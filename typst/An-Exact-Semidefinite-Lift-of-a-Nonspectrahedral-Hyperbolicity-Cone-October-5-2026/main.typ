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

#align(center)[#text(size: 16pt, weight: "bold")[An Exact Semidefinite Lift of a \
Nonspectrahedral Hyperbolicity Cone]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $bb(S)^n$ denote the real symmetric $n times n$ matrices.
  A #emph[spectrahedron] is a set defined by a finite affine linear matrix inequality;
  a #emph[spectrahedral shadow] is a linear projection of such a set.
  Thus auxiliary variables may make a semidefinite representation possible even when no representation exists in
  the original variables. We study this distinction for one explicit hyperbolicity cone.

For a homogeneous real polynomial $p$ with $p \( e \) > 0$,
  hyperbolicity with respect to $e$ means that $t mapsto p \( t e - x \)$ has only real roots for every $x$.
  We use the closed-cone convention

$ K \( p \, e \) = { x : upright("every root of ") t mapsto p \( t e - x \) upright(" is nonnegative") } . $

In particular, zero roots are allowed.

The convexity of hyperbolicity cones goes back to Gårding #cite(label("garding1959")).
  In three variables, the Helton–Vinnikov theorem yields definite symmetric determinantal representations,
  and hence spectrahedral cones #cite(label("helton-vinnikov2007")) #cite(label("lewis-parrilo-ramana2005")).
  Allowing auxiliary variables leads to a broader representation question.
  Netzer and Sanyal proved semidefinite liftability when every nonzero boundary point is a smooth point of the
  defining hyperbolic polynomial #cite(label("netzer-sanyal2015")).
  More recently, Scheiderer obtained second-order cone lifts under a Nash-smooth boundary
  hypothesis #cite(label("scheiderer2025")). Our result instead concerns an explicit cone and gives its lift by a
  bounded-degree algebraic construction.

=== 1.1 The cone and the main result <the-cone-and-the-main-result>

For $y = \( y_1 \, y_2 \, y_3 \) in bb(R)^3$, define

#[#set math.equation(numbering: n => "(1)")
 $ Q \( y \) =
   mat(delim: "(", y_1^2 + y_2^2, - y_1 y_2, - y_1 y_3; - y_1 y_2, y_2^2 + y_3^2, - y_2 y_3; - y_1 y_3, - y_2 y_3,
   y_3^2 + y_1^2) . $ <eq:Q>]

The associated biquadratic form $z^T Q \( y \) z$ is the coefficient-one Choi–Lam
  form #cite(label("choi-lam1977")) Section 4. For $a in bb(R)$, $r in bb(R)^3$, and $T in bb(S)^3$, set

#[#set math.equation(numbering: n => "(2)")
 $ Phi_y #h(-0.16667em) mat(delim: "(", a, r^T; r, T) =
   mat(delim: "(", "tr" \( Q \( y \) T \), - r^T Q \( y \); - Q \( y \) r, a Q \( y \)) . $ <eq:Phi>]

This is a linear map from $bb(S)^4$ to itself for each fixed $y$.
  On the space $cal(V) = bb(S)^4 times bb(S)^4 times bb(R)^3$, define

#[#set math.equation(numbering: n => "(3)")
 $ p \( X \, Z \, y \) = det #h(-0.16667em) (\( det X \) Z - Phi_y \( "adj" X \)) \, wide
   e = \( I_4 \, I_4 \, 0 \) \, $ <eq:p>]

where $"adj" X$ denotes the classical adjugate. Each matrix entry inside this determinant is homogeneous of degree
  five, and $p \( e \) = 1$; hence $p$ is homogeneous of degree twenty. We write $K = K \( p \, e \)$.
  The slice representation in Section 2 will in particular verify that $p$ is hyperbolic with respect to $e$.

Identify $cal(V)$ with $bb(R)^23$ by listing the upper triangular entries of $X$, then those of $Z$,
  each in lexicographic order of $\( i \, j \)$, followed by $y_1 \, y_2 \, y_3$.

#thm([Theorem 1.1.])[
  #emph[There exist fixed matrices $A_1 \, dots.h \, A_23 \, B_1 \, dots.h \, B_307 in bb(S)^100$ such that,
    for every $x = \( X \, Z \, y \) in cal(V)$,
$ x in K quad arrow.l.r.double quad upright("there exists ") v in bb(R)^307 upright(" with ") sum_(nu = 1)^23 x_nu
  A_nu + sum_(j = 1)^307 v_j B_j succ.curly.eq 0 . $

 The equivalence holds on the entire closed cone, including points with singular $X$.]
] <thm:main>

The sizes in Theorem 1 are explicit bounds, with no minimality assertion.
  The matrices are specified by a finite coefficient rule in Section 4.

The cone in (3) was constructed in the companion manuscript #cite(label("parent")),
  whose Theorem 1.1 proves that it has no homogeneous semidefinite representation in its original twenty-three
  coordinates. This also excludes affine representations. Indeed, if a cone containing $0$ equals ${ x : A_0 +
  L \( x \) succ.curly.eq 0 }$, where $L$ is linear, then $A_0 succ.curly.eq 0$.
  For each point $x$ of the cone and $t > 0$, we have $A_0 \/ t + L \( x \) succ.curly.eq 0$; letting $t arrow.r
  oo$ gives $L \( x \) succ.curly.eq 0$. Conversely, $L \( x \) succ.curly.eq 0$ implies $A_0 +
  L \( x \) succ.curly.eq 0$; thus the same cone has the homogeneous representation $L \( x \) succ.curly.eq 0$.
  We use the companion result only for this comparison: the proof of Theorem 1 below is self-contained.
  The companion also establishes hyperbolicity and, in Proposition 3.2, describes the part of $K$ with $X succ 0$.
  Our slice calculation recovers those two facts as part of the lift construction.

=== 1.2 Proof strategy <proof-strategy>

The starting point is a family of planes in $bb(R)^3$:

$ y = Y_theta \( eta \, xi \) = eta \( cos theta \, sin theta \, 0 \) + xi \( 0 \, 0 \, 1 \) . $

They cover all values of $y$. On each plane, the matrix $Q \( y \)$ has a Gram factorization linear in
  $\( eta \, xi \)$ and trigonometric of degree three in $theta$.
  This gives a $20 times 20$ linear pencil $L_theta$ whose positive semidefinite locus is exactly the
  corresponding slice of $K$, including its boundary.

The angular parameter does not itself furnish a finite linear matrix inequality.
  We instead introduce a real linear functional on a finite-dimensional space of trigonometric polynomials with
  coefficients linear in the slice variables. We require it to be nonnegative on $q^T L_theta
  q$ for every vector $q$ of trigonometric polynomials of degree at most two.
  These requirements form one finite matrix inequality. Evaluation at a single angle provides a feasible
  functional for every point of $K$.

This use of a finite matrix to encode positivity against a space of test polynomials belongs to the moment and
  sum-of-squares approach to semidefinite representations #cite(label("lasserre2001"))
  #cite(label("lasserre2009")). Here exactness must hold at one fixed degree.

The main issue is the converse: an arbitrary feasible functional need not be evaluation at an angle,
  or integration against a measure. The degree-two matching identity in Section 3 supplies enough test vectors to
  recover the matrix inequalities defining each slice. Its construction rotates a fixed complex Gram factor by a
  $2 times 2$ unitary matrix. The rotation preserves the Gram matrix and reduces a cubic trigonometric pairing to
  a first harmonic. Matching its value and first derivative then identifies the pairing exactly.
  This bounded-degree construction is the principal additional algebraic ingredient of the lift.
  Section 4 applies it to prove exactness for every feasible functional and completes the proof of Theorem 1.

== 2 Exact semidefinite representations on angular slices <sec:slices>

We first construct a matrix pencil on each plane $y = Y_theta \( eta \, xi \)$.
  Its determinant will agree with $p$ on that plane. This will identify cone membership with positive
  semidefiniteness even when $X$ is singular.

For $theta in bb(R)$, set

$ c = cos theta \, wide s = sin theta \, wide w = e^(i theta) \, wide d \( theta \) = \( c \, s \, 0 \) \, wide
  k = \( 0 \, 0 \, 1 \) \, $

and write

$ Y_theta \( eta \, xi \) = eta d \( theta \) + xi k wide \( eta \, xi in bb(R) \) . $

These planes cover $bb(R)^3$. We first factor $Q$ on each plane,
  using complex notation to keep the formulas short. For a complex matrix $F = \( f_1 \, f_2 \) in
  bb(C)^(3 times 2)$, define its realification by

$ tilde(F) = \( "Re" f_1 \, "Im" f_1 \, "Re" f_2 \, "Im" f_2 \) . $

Thus $tilde(F) tilde(F)^T = "Re" \( F F^(*) \)$, where $*$ denotes conjugate transpose. Define

#[#set math.equation(numbering: n => "(4)")
 $ U \( theta \) = 1 / sqrt(2) mat(delim: "(", - w^(- 1), - w; s w^(- 2), s w^2; c w^(- 2), - c w^2) \, wide V_0 =
   1 / sqrt(2) mat(delim: "(", 0, 0; i, i; 1, 1) \, wide F_theta \( eta \, xi \) = eta U \( theta \) +
   xi V_0 . $ <eq:U>]

#thm([Lemma 2.1.])[
  (Angular Gram factorization).  #emph[For every $theta \, eta \, xi in bb(R)$,
#[#set math.equation(numbering: n => "(5)")
 $ tilde(F)_theta \( eta \, xi \) tilde(F)_theta \( eta \, xi \)^T =
   Q #scale(x: 120%, y: 120%)[\(] Y_theta \( eta \, xi \) #scale(x: 120%, y: 120%)[\)] . $ <eq:gram>]

 In particular, $Q \( y \) succ.curly.eq 0$ for every $y in bb(R)^3$.]
] <lem:gram>

#proof[
  The three coefficients in the quadratic expansion of $"Re" \( F_theta F_theta^(*) \)$ are
  $ "Re" \( U U^(*) \) & = mat(delim: "(", 1, - s c, 0; - s c, s^2, 0; 0, 0, c^2) \, & "Re" \( V_0 V_0^(*) \) & =
    mat(delim: "(", 0, 0, 0; 0, 1, 0; 0, 0, 1) \,\
"Re" \( U V_0^(*) + V_0 U^(*) \) & = mat(delim: "(", 0, 0, - c; 0, 0, - s; - c, - s, 0) . $
  For the $\( 2 \, 3 \)$ entry of the last matrix, the multiplication gives $s cos \( 2 theta \) -
    c sin \( 2 theta \) = - s$. The sum of these matrices with coefficients $eta^2 \, xi^2 \,
    eta xi$ is exactly $Q \( eta c \, eta s \, xi \)$. Every real $y$ has this form,
    so the factorization also proves positive semidefiniteness. ◻
]

=== 2.1 The slice pencil <the-slice-pencil>

For a real column $r in bb(R)^3$ and a real vector $u = \( u_0 \, u' \) in bb(R) times bb(R)^3$, define

#[#set math.equation(numbering: n => "(6)")
 $ B \( r \) = mat(delim: "(", 0, r^T; - r, 0_(3 times 3)) \, wide J_u = mat(delim: "(", u', - u_0 I_3) . $ <eq:BJ>]

Then $B \( r \) u = J_u^T r$. If $r_1 \, dots.h \, r_4$ are the columns of $tilde(F)_theta \( eta \, xi \)$,
  direct multiplication and Lemma 2 give

#[#set math.equation(numbering: n => "(7)")
 $ sum_(j = 1)^4 B \( r_j \)^T W B \( r_j \) = Phi_(Y_theta \( eta \, xi \)) \( W \) wide \( W in bb(S)^4 \) .
   $ <eq:Phi-factor>]

Indeed, for $W = mat(delim: "(", a, v^T; v, T)$, the individual summands have blocks $r_j^T T r_j$, $-
  r_j^T v thin r_j^T$, $- r_j r_j^T v$, and $a r_j r_j^T$. Summing uses $sum_j r_j r_j^T =
  Q \( Y_theta \( eta \, xi \) \)$. Consequently, for every $y in bb(R)^3$,

#[#set math.equation(numbering: n => "(8)")
 $ u^T Phi_y \( W \) u = "tr" \( J_u W J_u^T Q \( y \) \) . $ <eq:Phi-quadratic>]

Here we used that the angular planes cover $bb(R)^3$.

Write $cal(X) \, cal(Z) in bb(S)^4$ for the matrix variables on a slice, and define

#[#set math.equation(numbering: n => "(9)")
 $ L_theta \( cal(X) \, cal(Z) \, eta \, xi \) =
   mat(delim: "(", I_4 ⊗ cal(X), cal(B)_theta \( eta \, xi \); cal(B)_theta \( eta \, xi \)^T, cal(Z)) \, wide
   cal(B)_theta \( eta \, xi \) = vec(B \( r_1 \), B \( r_2 \), B \( r_3 \), B \( r_4 \)) . $ <eq:slice-pencil>]

For fixed $theta$, this is a homogeneous real symmetric linear pencil of size twenty.
  Its coefficients are trigonometric polynomials in $theta$ of degree at most three.

#thm([Lemma 2.2.])[
  #emph[For every $theta \, eta \, xi in bb(R)$ and $cal(X) \, cal(Z) in bb(S)^4$,
#[#set math.equation(numbering: n => "(10)")
 $ \( cal(X) \, cal(Z) \, Y_theta \( eta \, xi \) \) in K quad arrow.l.r.double quad
   L_theta \( cal(X) \, cal(Z) \, eta \, xi \) succ.curly.eq 0 . $ <eq:slice-equivalence>]

 In particular, $p$ is hyperbolic with respect to $e$. If $cal(X) succ 0$,
   the conditions in (10) are also equivalent to $cal(Z) succ.curly.eq
   Phi_(Y_theta \( eta \, xi \)) \( cal(X)^(- 1) \)$.]
] <lem:slice>

#proof[
  For invertible $cal(X)$, the block determinant formula and (7) show that
  $ det L_theta & = \( det cal(X) \)^4 det #h(-0.16667em) (cal(Z) - Phi_(Y_theta \( eta \, xi \)) \( cal(X)^(- 1) \))\
 & = p \( cal(X) \, cal(Z) \, Y_theta \( eta \, xi \) \) . $
  The second equality uses $"adj" cal(X) = \( det cal(X) \)
    cal(X)^(- 1)$ and linearity of $Phi_y$ in its matrix argument.
    Both sides are polynomials in the slice variables, so the identity also holds for singular $cal(X)$.
    Moreover, $L_theta \( I_4 \, I_4 \, 0 \, 0 \) = I_20$. Thus
  #[#set math.equation(numbering: n => "(11)")
   $ p #h(-0.16667em) (t e - \( cal(X) \, cal(Z) \, Y_theta \( eta \, xi \) \)) =
     det #h(-0.16667em) (t I_20 - L_theta \( cal(X) \, cal(Z) \, eta \, xi \)) . $ <eq:roots>]
  The roots are the real eigenvalues of this symmetric pencil evaluated at the specified point.
    Since every $y$ lies on some angular plane, this proves hyperbolicity.
    Nonnegativity of all these eigenvalues, including zero eigenvalues, proves (10).
    For $cal(X) succ 0$, the final assertion is the Schur complement criterion applied to (9). ◻
]

== 3 A degree-two matching identity <sec:matching>

Write

$ Q \( y \, z \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] Q \( y + z \) - Q \( y \) -
  Q \( z \) #scale(x: 120%, y: 120%)[\)] $

for the symmetric bilinear polarization of $Q$, so that $Q \( y \, y \) = Q \( y \)$.

For $S in bb(S)^3$ and $F \, H in bb(C)^(3 times 2)$, put

$ chevron.l F \, H chevron.r_S = "Re" "tr" \( F^(*) S H \) = "tr" \( tilde(F)^T S tilde(H) \) . $

This is a symmetric real bilinear form. A complex trigonometric polynomial of degree at most $j$ is a linear
  combination of $e^(i ell theta)$ for $- j lt.eq ell lt.eq j$.

The finite lift will test $L_theta$ against trigonometric polynomial vectors built from the columns of a matrix
  $tilde(C) \( theta \)$. A constant Gram matrix for $tilde(C)$ makes the coefficient of $cal(X)$ in the quadratic
  contribution of the top blocks independent of $theta$. Requiring $chevron.l F_theta \, C chevron.r_S =
  "tr" \( S Q \( Y_theta \, z \) \)$ makes the mixed contribution linear in $Y_theta$.
  The next lemma achieves both properties with entries of degree at most two.
  The matrix $S$ in the pairing may be indefinite.

#thm([Lemma 3.1.])[
  (Degree-two matching).  #emph[Let $S in bb(S)^3$ and let $z in bb(R)^3$ satisfy $\( z_1 \, z_2 \)
    eq.not \( 0 \, 0 \)$. There is a matrix $C \( theta \) in
    bb(C)^(3 times 2)$ whose entries are trigonometric polynomials of degree at most two such that,
    for all $theta \, eta \, xi in bb(R)$,
#[#set math.equation(numbering: n => "(12)")
 $ tilde(C) \( theta \) tilde(C) \( theta \)^T & = Q \( z \) \,\
chevron.l F_theta \( eta \, xi \) \, C \( theta \) chevron.r_S & =
  "tr" #scale(x: 120%, y: 120%)[\(] S Q \( Y_theta \( eta \, xi \) \, z \) #scale(x: 120%, y: 120%)[\)] .
  $ <eq:matching>]

]
] <lem:matching>

#proof[
  Write $z = tau d \( alpha \) + rho k$, where $tau > 0$, and set
  $ w_0 = e^(i alpha) \, wide R_0 = tau U \( alpha \) + rho V_0 \, wide N = S R_0 . $
  By Lemma 2, $tilde(R)_0 tilde(R)_0^T = Q \( z \)$. We will set $C \( theta \) =
    R_0 M \( theta \)$ with $M \( theta \)$ unitary, so that this Gram matrix remains fixed.
    We choose the rotation to make $chevron.l V_0 \, C chevron.r_S$ constant and $chevron.l U \( theta \) \,
    C \( theta \) chevron.r_S$ a linear combination of $cos theta$ and $sin theta$.
    After those frequency bounds are established, values and a derivative at $alpha$ will identify the pairings.
  #emph[Choosing the unitary rotation.] Write $N_j$ for the $j$th row of $N$ and introduce the two-component row
  $ v = N_3 - i N_2 . $
  Subscripts $+$ and $-$ denote the first and second components of a row. Set
  $ g = v_(+) + overline(v_(-)) \, wide h = v_(+) - overline(v_(-)) \, wide
    kappa \( theta \) = \( w_0 \/ w \)^2 \, wide delta = \| g \|^2 + \| h \|^2 . $
  We seek a matrix of the form
  $ M \( theta \) = mat(delim: "(", a, b; - overline(b), overline(a)) . $
  Writing $v^M = v M$, we impose the two conditions
  #[#set math.equation(numbering: n => "(13)")
   $ v_(+)^M + overline(v_(-)^M) = g \, wide v_(+)^M - overline(v_(-)^M) = h kappa . $ <eq:rotation-pairings>]
  The sum on the left controls the pairing with $V_0$, while the difference multiplies $w^3$ in the pairing with
    $U$. These conditions therefore keep the first pairing constant and lower the cubic term of the second to
    frequency one, since $w^3 kappa = w_0^2 w$. The expansion below will also bound its remaining frequencies.
  The two left sides of (13) are $g a + overline(h) thin overline(b)$ and $h a - overline(g) thin overline(b)$,
    respectively. Thus, for $delta > 0$, we choose $a \( theta \)$ and $b \( theta \)$ by solving
  #[#set math.equation(numbering: n => "(14)")
   $ mat(delim: "(", g, overline(h); h, - overline(g)) vec(a, overline(b)) = vec(g, h kappa) . $ <eq:rotation-system>]
  The coefficient matrix $A$ satisfies $A^(*) A = delta I_2$, so the system has a unique solution. Explicitly,
  #[#set math.equation(numbering: n => "(15)")
   $ a = frac(\| g \|^2 + \| h \|^2 kappa, delta) \, wide overline(b) =
     frac(g h \( 1 - kappa \), delta) . $ <eq:rotation-coefficients>]
  Since the right side of (14) has squared norm $delta$, we have $\| a \|^2 + \| b \|^2 = 1$.
    For $delta = 0$, take $a = 1$ and $b = 0$; then $g = h = 0$ and the same system is satisfied.
    In both cases $M$ is unitary, $M \( alpha \) = I_2$, and $a \,
    overline(b)$ involve only the frequencies $0$ and $- 2$. Thus $C =
    R_0 M$ has degree at most two and $C \( alpha \) = R_0$. Moreover,
  $ tilde(C) tilde(C)^T = "Re" \( R_0 M M^(*) R_0^(*) \) = "Re" \( R_0 R_0^(*) \) = Q \( z \) \, $
  which proves the first identity in (12).
  #emph[Reducing the frequencies of the pairings.] The formula for $V_0$ and (13) yield
  $ sqrt(2) thin chevron.l V_0 \, C chevron.r_S = "Re" \( v_(+)^M + v_(-)^M \) = "Re" g \, $
  so this pairing is constant.
  Set $m = N_3 + i N_2$, $n = N_1$, and write $m^M = m M$, $n^M = n M$.
    Expanding $c$ and $s$ in powers of $w$, the formula for $U$ gives
  $ sqrt(2) thin chevron.l U \( theta \) \, C \( theta \) chevron.r_S = "Re" #scale(x: 120%, y: 120%)[\[]  & 1 /
    2 w^3 v_(+)^M + w \( 1 / 2 m_(+)^M - n_(+)^M \)\
 & - 1 / 2 w^(- 3) v_(-)^M + w^(- 1) \( - 1 / 2 m_(-)^M - n_(-)^M \) #scale(x: 120%, y: 120%)[\]] . $
  Inside the real part, we may replace each negative-power term by its complex conjugate. The resulting expression is
  #[#set math.equation(numbering: n => "(16)")
   $ "Re"
     [w^3 / 2 \( v_(+)^M - overline(v_(-)^M) \) + w (m_(+)^M / 2 - n_(+)^M - overline(m_(-)^M) / 2 -
     overline(n_(-)^M))] . $ <eq:frequency-reduction>]
  The first term has frequency one because $w^3 kappa = w_0^2 w$.
    In the second term, the expression in parentheses has only frequencies $0$ and $- 2$: for any fixed row $r$,
  $ \( r M \)_(+) = r_(+) a - r_(-) overline(b) \, wide overline(\( r M \)_(-)) =
    overline(r_(+)) thin overline(b) + overline(r_(-)) a . $
  Consequently (16) is a real linear combination of $cos theta$ and $sin theta$, as required.
  #emph[Identifying the pairings.] At $theta = alpha$, polarization of Lemma 2 within the plane spanned by
    $d \( alpha \)$ and $k$ gives
  #[#set math.equation(numbering: n => "(17)")
   $ chevron.l V_0 \, R_0 chevron.r_S & = "tr" #scale(x: 120%, y: 120%)[\(] S Q \( k \, z \)
     #scale(x: 120%, y: 120%)[\)] \,\
chevron.l U \( alpha \) \, R_0 chevron.r_S & = "tr" #scale(x: 120%, y: 120%)[\(] S Q \( d \( alpha \) \, z \)
  #scale(x: 120%, y: 120%)[\)] . $ <eq:matching-value-v>]
  Both sides of the desired identity $chevron.l V_0 \, C \( theta \) chevron.r_S =
    "tr" \( S Q \( k \, z \) \)$ are constant, so (17) proves it for every $theta$.
  For the pairing with $U$, both $chevron.l U \( theta \) \,
    C \( theta \) chevron.r_S$ and $"tr" \( S Q \( d \( theta \) \, z \) \)$ are linear combinations of $cos
    theta$ and $sin theta$. They agree at $alpha$ by (17); it remains to compare their derivatives there.
    The fixed Gram matrix of $C$ gives
  $ chevron.l C \( theta \) \, C \( theta \) chevron.r_S = "tr" \( S Q \( z \) \) \, wide chevron.l R_0 \,
    C' \( alpha \) chevron.r_S = 0 . $
  Constancy of the pairing with $V_0$ also gives $chevron.l V_0 \, C' \( alpha \) chevron.r_S = 0$.
    Since $R_0 = tau U \( alpha \) + rho V_0$ and $tau > 0$, it follows that
  #[#set math.equation(numbering: n => "(18)")
   $ chevron.l U \( alpha \) \, C' \( alpha \) chevron.r_S = 0 . $ <eq:matching-moving-factor>]
  Next differentiate the identity
  $ chevron.l tau U \( theta \) + rho V_0 \, tau U \( theta \) + rho V_0 chevron.r_S =
    "tr" #scale(x: 120%, y: 120%)[\(] S Q \( tau d \( theta \) + rho k \) #scale(x: 120%, y: 120%)[\)] \, $
  which follows from Lemma 2. Evaluating at $alpha$ and dividing by $2 tau$ gives
  $ chevron.l U' \( alpha \) \, R_0 chevron.r_S = "tr" #scale(x: 120%, y: 120%)[\(] S Q \( d' \( alpha \) \, z \)
    #scale(x: 120%, y: 120%)[\)] . $
  Together with (18), this is the required derivative identity.
    A real linear combination of $cos theta$ and $sin theta$ is determined by its value and derivative at a single
    angle. Hence the pairing with $U$ has the desired value for all $theta$.
    Linearity in $eta \, xi$ completes the proof. ◻
]

== 4 A finite semidefinite lift <sec:lift>

We now replace the angular family of pencils by one finite matrix condition.
  Evaluation on an angular slice will provide a feasible lift for each point of $K$.
  Conversely, the functions supplied by Lemma 4 will turn positivity of the finite matrix into the inequalities
  that characterize the slice, including its singular boundary.

=== 4.1 The matrix condition <the-matrix-condition>

Let $cal(T)_j$ be the real vector space of trigonometric polynomials of degree at most $j$, with basis

$ 1 \, cos theta \, sin theta \, dots.h \, cos \( j theta \) \, sin \( j theta \) . $

Let $cal(E)$ be the space of real functions of $\( theta \, cal(X) \, cal(Z) \, eta \, xi \)$ that are linear
  homogeneous in the $22$ coordinates of $\( cal(X) \, cal(Z) \, eta \, xi \) in bb(S)^4 times bb(S)^4 times
  bb(R)^2$, with coefficients in $cal(T)_7$. Thus $dim cal(E) = 22 dot.op 15 = 330$.
  Our lifting variable is a real linear functional $Lambda : cal(E) arrow.r bb(R)$;
  on vectors and matrices we apply it entrywise. For an output point $\( X \, Z \, y \)$, impose

#[#set math.equation(numbering: n => "(19)")
 $ Lambda \( cal(X) \) = X \, wide Lambda \( cal(Z) \) = Z \, wide
   Lambda #scale(x: 120%, y: 120%)[\(] Y_theta \( eta \, xi \) #scale(x: 120%, y: 120%)[\)] = y . $ <eq:output>]

We also require

#[#set math.equation(numbering: n => "(20)")
 $ Lambda #scale(x: 120%, y: 120%)[\(] q \( theta \)^T L_theta \( cal(X) \, cal(Z) \, eta \, xi \) q \( theta \)
   #scale(x: 120%, y: 120%)[\)] gt.eq 0 wide upright("for every ") q in \( cal(T)_2 \)^20 . $ <eq:moment>]

The expression to which $Lambda$ is applied lies in $cal(E)$:
  the entries of $L_theta$ have trigonometric degree at most three,
  so its product with two entries of $q$ has degree at most seven.

Condition (20) is a single finite semidefinite condition,
  using the finite test-space construction familiar from moment relaxations #cite(label("lasserre2001"))
  #cite(label("lasserre2009")).
  Indeed, set $\( f_1 \, dots.h \, f_5 \) = \( 1 \, cos theta \, sin theta \, cos 2 theta \, sin 2 theta \)$ and
  define $H \( Lambda \) in bb(S)^100$ by

#[#set math.equation(numbering: n => "(21)")
 $ H \( Lambda \)_(\( i \, a \) \, \( j \, b \)) = Lambda #scale(x: 120%, y: 120%)[\(] f_a f_b \( L_theta \)_(i j)
   #scale(x: 120%, y: 120%)[\)] \, wide 1 lt.eq i \, j lt.eq 20 \, quad 1 lt.eq a \, b lt.eq 5 . $ <eq:moment-matrix>]

If $q_i = sum_a t_(i \, a) f_a$, the left side of (20) is $t^T H \( Lambda \) t$.
  Hence (20) is equivalent to $H \( Lambda \) succ.curly.eq 0$.
  Every entry of this real symmetric matrix is linear homogeneous in the $330$ coordinates of $Lambda$.

#thm([Proposition 4.1.])[
  #emph[For $\( X \, Z \, y \) in bb(S)^4 times bb(S)^4 times bb(R)^3$, the following are equivalent:]
  + #emph[$\( X \, Z \, y \) in K$;]
  + #emph[there is a real linear functional $Lambda : cal(E) arrow.r
    bb(R)$ satisfying (19) and $H \( Lambda \) succ.curly.eq 0$.]
] <prop:lift>

#proof[
  Suppose first that $\( X \, Z \, y \) in K$. Choose $theta_0 \, eta_0 \, xi_0$ with $y =
    Y_(theta_0) \( eta_0 \, xi_0 \)$, and let $Lambda$ be evaluation at
    $\( theta_0 \, X \, Z \, eta_0 \, xi_0 \)$. The output equations hold,
    and Lemma 3 gives $L_(theta_0) \( X \, Z \, eta_0 \, xi_0 \) succ.curly.eq 0$, which implies (20).
    This evaluation functional is a finite feasible witness even when $X$ is singular.
  For the converse, suppose that $Lambda$ satisfies the stated conditions.
    Taking constant $q$ supported on one of the four top blocks of $L_theta$ in (20) gives $X succ.curly.eq 0$.
    We next obtain a family of scalar inequalities from which the remaining slice conditions will follow.
  Fix $u in bb(R)^4$, $D in bb(S)^4$, and $z in bb(R)^3$ with $\( z_1 \, z_2 \) eq.not \( 0 \, 0 \)$,
    and apply Lemma 4 with $S = J_u D J_u^T in bb(S)^3$. Neither $D$ nor $S$ is required to be positive
    semidefinite. Let $b_1 \( theta \) \, dots.h \, b_4 \( theta \)$ be the columns of the resulting real matrix
    $tilde(C) \( theta \)$. Choose the five four-dimensional blocks of $q$ to be
  $ q \( theta \) = vec(- D J_u^T b_1 \( theta \), dots.v, - D J_u^T b_4 \( theta \), u) . $
  The degree bound in Lemma 4 puts this vector in $\( cal(T)_2 \)^20$.
    Write $r_j$ for the columns of $tilde(F)_theta \( eta \, xi \)$, as in the definition of $L_theta$.
    Using $B \( r_j \) u = J_u^T r_j$, the top blocks and the cross terms of $q^T L_theta q$ are respectively
  $ sum_(j = 1)^4 b_j^T J_u D cal(X) D J_u^T b_j & = "tr" #scale(x: 120%, y: 120%)[\(] J_u D cal(X) D J_u^T
    Q \( z \) #scale(x: 120%, y: 120%)[\)] \,\
- 2 sum_(j = 1)^4 b_j^T J_u D J_u^T r_j & = - 2 chevron.l F_theta \( eta \, xi \) \, C \( theta \) chevron.r_S\
 & = - 2 "tr" #scale(x: 120%, y: 120%)[\(] J_u D J_u^T Q \( Y_theta \( eta \, xi \) \, z \)
   #scale(x: 120%, y: 120%)[\)] . $
  These identities hold before applying $Lambda$. The first identity removes the angular dependence from the
    coefficient of $cal(X)$; the last expression is linear in $Y_theta \( eta \, xi \)$.
    Consequently, applying (19) and (20) gives
  #[#set math.equation(numbering: n => "(22)")
   $ u^T Z u + "tr" #scale(x: 120%, y: 120%)[\(] J_u D X D J_u^T Q \( z \) #scale(x: 120%, y: 120%)[\)] -
     2 "tr" #scale(x: 120%, y: 120%)[\(] J_u D J_u^T Q \( y \, z \) #scale(x: 120%, y: 120%)[\)] gt.eq
     0 . $ <eq:certificate>]
  For fixed $u \, D$, the left side is a polynomial in $z$,
    so the inequality extends by continuity to every $z in bb(R)^3$.
    Only this scalar inequality is extended; no continuity of the functions $C$ is needed.
    Thus (22) holds for all $u in bb(R)^4$, $D in bb(S)^4$, and $z in bb(R)^3$.
  If $X$ were positive definite, setting $z = y$ and $D = X^(- 1)$ in (22) would give $Z succ.curly.eq
    Phi_y \( X^(- 1) \)$. For singular $X$, the same family of tests also supplies the necessary range condition.
    Fix slice parameters $y = Y_(theta_0) \( eta_0 \, xi_0 \)$ and, for the rest of the proof,
    let $r_j$ denote the columns of $tilde(F)_(theta_0) \( eta_0 \, xi_0 \)$ and set $B_j = B \( r_j \)$.
    For $v in ker X$, take $D = t v v^T$ and $z = y$ in (22), where $t in bb(R)$ is arbitrary.
    Since $D X D = 0$, this gives
  $ u^T Z u - 2 t thin \( J_u v \)^T Q \( y \) \( J_u v \) gt.eq 0 wide \( t in bb(R) \) . $
  Its coefficient of $t$ must vanish. The Gram factorization of $Q \( y \)$ therefore yields
  $ 0 = \( J_u v \)^T Q \( y \) \( J_u v \) = sum_(j = 1)^4 \( v^T B_j u \)^2 . $
  As $u$ and $v in ker X$ are arbitrary, it follows that
  #[#set math.equation(numbering: n => "(23)")
   $ "range" B_j subset.eq \( ker X \)^perp = "range" X wide \( 1 lt.eq j lt.eq 4 \) . $ <eq:range>]
  Let $X^dagger$ be the symmetric matrix that inverts the positive eigenvalues of $X$ and is zero on $ker X$.
    In particular, $X^dagger X X^dagger = X^dagger$. Taking $D = X^dagger$ and $z = y$ in (22),
    and using (8) and (7), gives
  #[#set math.equation(numbering: n => "(24)")
   $ Z succ.curly.eq Phi_y \( X^dagger \) = sum_(j = 1)^4 B_j^T X^dagger B_j . $ <eq:singular-schur>]
  We now verify positivity of the slice pencil directly by completing a square using (23) and (24).
    For $a_1 \, dots.h \, a_4 \, u in bb(R)^4$, its quadratic form equals
  $ & sum_(j = 1)^4 a_j^T X a_j + 2 sum_(j = 1)^4 a_j^T B_j u + u^T Z u\
 & quad = sum_(j = 1)^4 \( a_j + X^dagger B_j u \)^T X \( a_j + X^dagger B_j u \) +
   u^T (Z - sum_(j = 1)^4 B_j^T X^dagger B_j) u gt.eq 0 . $
  Here the cross terms agree because $X X^dagger B_j = B_j$ by (23).
    Thus $L_(theta_0) \( X \, Z \, eta_0 \, xi_0 \) succ.curly.eq 0$, and Lemma 3 gives $\( X \, Z \, y \) in K$. ◻
]

The converse has used an arbitrary feasible functional $Lambda$.
  In particular, the proof requires no representation of $Lambda$ by a measure and no closure operation on the
  projected feasible set.

=== 4.2 The size of the lift <the-size-of-the-lift>

#proof[
  Choose the displayed trigonometric basis of $cal(T)_7$ and the upper-triangular coordinate functions of $cal(X)$
    and $cal(Z)$, together with $eta \, xi$, to specify the $330$ coordinates of $Lambda$.
    The output equations (19) prescribe precisely the following $23$ distinct coordinates:
  $ Lambda \( cal(X)_(i j) \) \, quad Lambda \( cal(Z)_(i j) \) wide \( 1 lt.eq i lt.eq j lt.eq 4 \) \,\
Lambda \( eta cos theta \) \, quad Lambda \( eta sin theta \) \, quad Lambda \( xi \) . $
  They are independent members of the chosen coordinate system on $cal(E)^(*)$.
    Substitute the corresponding entries of $X \, Z \, y$ for these coordinates in (21),
    and use the remaining $330 - 23 = 307$ coordinates as auxiliary variables.
    The result is a fixed real symmetric $100 times 100$ matrix pencil,
    homogeneous in the output and auxiliary variables. Proposition 5 proves that its projection is exactly $K$.
    Hence the requested representation has $N = 100$, $m = 307$, and zero constant term. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
