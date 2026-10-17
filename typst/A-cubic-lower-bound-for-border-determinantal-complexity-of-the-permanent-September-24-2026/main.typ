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

#align(center)[#text(size: 16pt, weight: "bold")[A cubic lower bound for border determinantal complexity of the permanent]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a matrix $X = \( x_(i j) \)$ of independent variables, the permanent is

$ "per"_m \( X \) = sum_(sigma in S_m) product_(i = 1)^m x_(i \, sigma \( i \)) . $

The permanent–determinant problem asks how large a determinant of affine-linear forms is needed to express $"per"_m$. Valiant connected determinant projections to arithmetic formulas: his construction represents a polynomial computed by a formula with $s$ addition or multiplication operations as a determinant of order $s + 2$ #cite(label("Valiant1979Algebra")) Theorem 1. His algebraic completeness theorem shows that, in characteristic different from two, polynomial families defined by summing polynomial-size formulas over Boolean strings of polynomial length are projections of polynomial-size permanents #cite(label("Valiant1979Algebra")) Theorem 2. Valiant’s projections substitute individual variables or field constants. The exact model below allows every matrix entry to be an arbitrary affine-linear form.

For $f in bb(C) \[ x_1 \, dots.h \, x_N \]$, its #emph[determinantal complexity] $"dc" \( f \)$ is the least positive integer $n$ for which

$ f = det (A_0 + sum_(j = 1)^N x_j A_j) \, #h(2em) A_0 \, dots.h \, A_N in "Mat"_n \( bb(C) \) . $

Its #emph[border determinantal complexity] $upright(overline(d c)) \( f \)$ is the least positive integer $n$ such that $f$ lies in the coefficientwise closure of

#[#set math.equation(numbering: n => "(1.1)")
 $ {det (A_0 + sum_(j = 1)^N x_j A_j) : A_0 \, dots.h \, A_N in "Mat"_n \( bb(C) \)} . $ <eq:border-definition>]

The closure is taken in the finite-dimensional space of polynomials of degree at most $n$; a polynomial of larger degree cannot belong to it. We allow $f$ to be constant or zero. Coefficientwise closure agrees with Zariski closure here, as explained in Section 2. The size $n$ stays fixed along an approximating sequence, while the complex coefficients of its matrix entries are unrestricted.

#thm([Theorem 1.1.])[
  #emph[There exist absolute constants $c > 0$ and $m_0$ such that, for every integer $m gt.eq m_0$, 
$ upright(overline(d c)) \( "per"_m \) gt.eq c m^3 . $

 One may take $c = 1 \/ \( 5 thin 529 thin 600 e \)$ and $m_0 = 1408$.]
] <thm:main>

The constants are not optimized. Proposition 3 identifies this coefficientwise model with the projective determinant-orbit closure formulation, including equal permanent and determinant orders.

The same numerical lower bound holds for exact determinantal complexity. There is also a consequence for algebraic branching programs. An affine-linear algebraic branching program is a finite directed acyclic graph with a source and a sink and an affine-linear form on each edge; it computes the sum of products of edge labels along all source-to-sink paths. Over $bb(C)$, computing $"per"_m$ requires $Omega \( m^3 \)$ vertices and $Omega \( m^3 \)$ edges. The same bounds hold for coefficientwise limits when the relevant vertex or edge budget remains fixed along the approximation, even if the graph varies. Section 9 gives the precise statements and determinant reductions.

=== 1.1 Earlier bounds and geometric methods <earlier-bounds-and-geometric-methods>

The early matrix-order lower bounds were linear in the permanent order $m$. For the variable-or-constant projection model, von zur Gathen published a bound due to Babai and Seress with leading term $sqrt(2) thin m$ and a loss of $6 sqrt(m)$ #cite(label("vonZurGathen1987")) Theorem 4.4. For arbitrary affine representations over $bb(C)$, Meshulam’s final theorem #cite(label("Meshulam1989")) pp. 270–271 and Cai’s dimension argument #cite(label("Cai1990")) Theorem 1.5 and Section 2.2 give the scale $sqrt(2) thin m - O \( 1 \)$. Their arguments compare the dimension of the affine matrix image with the minimum rank that an exact permanent representation must have.

Mignon and Ressayre raised the exact lower bound to $"dc" \( "per"_m \) gt.eq m^2 \/ 2$ in characteristic zero #cite(label("MignonRessayre2004")). Their proof compares Hessians at a zero: affine pullback cannot increase Hessian rank, the Hessian of an order-$n$ determinant has rank at most $2 n$ at a noninvertible matrix, and, for $m gt.eq 2$, the permanent has a zero where its Hessian has full rank $m^2$. Cai, Chen and Li extended the quadratic scale to positive characteristic different from two by constructing sparse zeros that avoid the large factorial factors in the earlier Hessian calculation #cite(label("CaiChenLi2010")) Theorem 2.3.

On the upper side, Grenet’s construction realizes $"per"_m$ as a determinant of order $2^m - 1$, using a branching program indexed by the subsets of ${ 1 \, dots.h \, m }$ #cite(label("Grenet2012")) unnumbered Theorem, p. 3. Its determinant entries are individual variables and constants, so it is also an upper bound in the unrestricted exact model.

Mulmuley and Sohoni’s geometric complexity theory program studies permanent–determinant separation through orbit closures of determinants and padded permanents, seeking equations or representation-theoretic obstructions to containment #cite(label("MulmuleySohoni2001")) #cite(label("MulmuleySohoni2008")). Landsberg, Manivel and Ressayre proved the unrestricted complex border bound $upright(overline(d c)) \( "per"_m \) gt.eq m^2 \/ 2$ by studying hypersurfaces with degenerate duals and the effect of padding #cite(label("LandsbergManivelRessayre2010")) Theorem 1.1.1. Theorem 1 raises the lower-bound exponent from two to three in that same model. It remains a fixed polynomial bound. Whether the permanent has superpolynomial determinantal complexity, or superpolynomial border determinantal complexity, remains open.

Landsberg and Ressayre later proved exponential optima for exact representations with symmetry requirements. Each specified projective symmetry of the input must lift to a projective symmetry of the determinant that fixes the pencil’s constant matrix, preserves the image of its linear part, and induces the given input action there. Over $bb(C)$, for $m gt.eq 3$, requiring this for left multiplication by invertible diagonal and permutation matrices gives minimum order $2^m - 1$. Lifting the full projective symmetry group of the permanent gives minimum order $binom(2 m, m) - 1$ in the same range #cite(label("LandsbergRessayre2017")) Theorems 2.1 and 2.8; Propositions 2.9 and 2.10. These hypotheses specify exact representation classes; the border model of Theorem 1 allows arbitrary affine determinant approximations of fixed order.

Singularities also give geometric lower bounds for exact representations. For a homogeneous polynomial of degree greater than two whose affine singular locus has codimension greater than four, Alper, Bogart and Velasco prove $"dc" \( f \) gt.eq "codim" "Sing" \( f \) + 1$ #cite(label("AlperBogartVelasco2017")) Theorem 1.2. For the permanent, matrices with two zero columns show that this codimension is at most $2 m$, so this obstruction alone has only a linear scale #cite(label("AlperBogartVelasco2017")) Remark 1.5. Our construction instead obtains a coefficient polynomial from a permanent and finds a linear subspace on which its zero hypersurface is smooth. Its degree is linear and the subspace dimension is quadratic in an auxiliary matrix size.

For a smooth complex form of degree $r gt.eq 2$ in $d gt.eq 2$ variables, the classical top polar degree is $r \( r - 1 \)^(d - 2)$ #cite(label("Piene1978")) Corollary 3.7. The left and right kernel equations for the determinant matrix and the Schur-complement reduction used below also appear in Sheshadri’s June 2026 preprint #cite(label("SheshadriBorder2026")) Theorem 3 and Section 3.1, as part of its proposed conormal approach to border bounds for diagonal power sums. Kumar and Volk’s September 2026 preprint uses such kernel equations and a multihomogeneous count to obtain a quadratic #emph[exact] lower bound for $sum_(i = 1)^n x_i^n$ #cite(label("KumarVolk2026")) Theorem 1.1 and Section 3. Theorem 4 proves the version needed here, including persistence of finitely many simple polar intersections in one sufficiently close determinant under an arbitrary coefficientwise approximation. Its lower bound is proportional to the product $\( r - 1 \) \( d - 1 \)$.

=== 1.2 The coefficient construction and the proof <the-coefficient-construction-and-the-proof>

To use this product at cubic scale, we seek an affine restriction of a permanent of size proportional to $k$ that has degree proportional to $k$ in quadratically many variables and has a smooth projective zero set. Let $k gt.eq 1$ and $0 lt.eq q lt.eq floor.l k \/ 2 floor.r$ be integers. With indeterminates $theta_1 \, dots.h \, theta_k$, put $D = "diag" \( theta_1 \, dots.h \, theta_k \)$ and define

$ G_D \( X \) = \[ s^q t^q \] "per"_k \( X + s I + t D \) in bb(Z) \[ theta_1 \, dots.h \, theta_k \] \[ X_(i j) \] . $

This polynomial is homogeneous of degree $r = k - 2 q$ in the $k^2$ entries of $X$. We use the same notation after specializing the parameters in a field. For the main construction we assume $k gt.eq 128$ and take $q = floor.l \( k - 1 \) \/ 3 floor.r$; then $r$ is linear in $k$ and $T = binom(q + 2, 2)$ is quadratic in $k$.

The integral formula has two uses. Over $bb(C)$, two count gates and a cancellation gadget realize $G_D$, up to a fixed nonzero scalar, as an affine restriction of a permanent of size $11 k - 2 q$ (Proposition 5). This holds for every complex choice of the parameters. The scalar vanishes in characteristic two, so the geometric argument specializes the integral coefficient formula itself. We will use the complex projection at the complex parameter choice that geometry eventually supplies.

Let $K = overline(bb(F))_2$, choose pairwise distinct $macron(theta)_1 \, dots.h \, macron(theta)_k in K$, and write $macron(D) = "diag" \( macron(theta)_1 \, dots.h \, macron(theta)_k \)$. Since permanent and determinant agree over $K$, every matrix $X$ defines a plane curve

$ C_X = V #scale(x: 120%, y: 120%)[\(] det \( s I + t macron(D) + u X \) #scale(x: 120%, y: 120%)[\)] subset bb(P)_K^2 . $

Its fiber on $u = 0$ consists of the distinct points $\[ - macron(theta)_i : 1 : 0 \]$. This fixed fiber makes the curve reduced and its projection to $\[ t : u \]$ finite and generically separable, and it controls the adjugate of $s I + t macron(D) + u X$ on the curve. The full adjugate defines a finite subscheme $Z subset C_X$. If all entrywise derivatives of $G_(macron(D))$ vanish at $X$, the coefficient $\[ s^q t^q u^(r - 1) \]$ of every adjugate entry vanishes. We prove that these entries span all degree-$\( k - 1 \)$ forms vanishing on $Z$, so the same coefficient vanishes on every such form. For a degree-$q$ monomial $s^i t^j u^ell$, multiplication by $s^(q - i) t^(q - j) u^(r - 1 - ell)$ lets this functional recover its coefficient in any degree-$q$ form. These exponents are nonnegative because $r - 1 gt.eq q$. Thus restriction of degree-$q$ forms to $Z$ is injective, giving the length bound in Proposition 10:

$ K \[ s \, t \, u \]_q arrow.r.hook H^0 \( Z \, cal(O)_Z \( q \) \) \, #h(2em) "length" Z gt.eq dim_K K \[ s \, t \, u \]_q = T . $

The length of $Z$ is bounded above by the #emph[normalization defect] $delta \( C_X \)$, the length of the quotient between the normalization’s structure sheaf and the curve’s structure sheaf. The comparison follows the evaluation-ideal argument of Fantechi, Göttsche and van Straten over $bb(C)$ #cite(label("FGvS1999")) Proposition C.2 and Corollary C.3; Section 5 proves the needed conductor inclusion and colength identity for our generically separable pencils in arbitrary characteristic. Thus every critical matrix lies over a curve with $delta \( C_X \) gt.eq T$.

Applying the arbitrary-characteristic Severi dimension theorem of Christ, He and Tyomkin #cite(label("CHT2023")) Lemma 2.6, Proposition 2.7, and Remark 2.8 to the integral components bounds the locus of curves with this defect. Their result builds on Tyomkin’s dimension bound for toric pairs #cite(label("Tyomkin2013")) Theorem 1.2(1). The sum $R_X = \( 1 \, dots.h \, 1 \) "adj" \( s I + t macron(D) + u X \)$ of the adjugate rows controls the matrices over one fixed curve: its zero subscheme has length $k \( k - 1 \) \/ 2$, and the common boundary frame makes that subscheme determine the matrix uniquely. A Hilbert-scheme estimate and an algebraic incidence then bound the dimension of each matrix fiber. Combining the curve and matrix bounds gives

$ dim { X : nabla G_(macron(D)) \( X \) = 0 } lt.eq k^2 + k - T \, #h(2em) "codim" { X : nabla G_(macron(D)) \( X \) = 0 } gt.eq T - k . $

The projective zero scheme of the raw partial derivatives forms a proper family over the integral parameter space. Specialization transfers the dimension bound to a nonempty open set of complex parameters. Over $bb(C)$, Euler’s identity identifies these gradient zeros with the hypersurface’s singular scheme, and a general linear section avoids that scheme and meets the smooth locus transversely. Proposition 20 then supplies, for $k gt.eq 128$ and the stated choice of $q$, a nonzero form $G$ of degree $r$ in $d = floor.l k^2 \/ 100 floor.r$ variables whose projective zero set is smooth. For each $m gt.eq 11 k - 2 q$, it also supplies a fixed affine map $Phi_m$ satisfying $G = "per"_m compose Phi_m$.

Figure 1 shows how the two uses of the coefficient formula meet and how the polar bound converts their output into the cubic estimate.

#figure(
  [#strong[One integral coefficient polynomial] $G_D \( X \) = \[ s^q t^q \] "per"_k \( X + s I + t D \) in bb(Z) \[ theta_1 \, dots.h \, theta_k \] \[ X_(i j) \]$ $D = "diag" \( theta_1 \, dots.h \, theta_k \) \, #h(2em) r = k - 2 q \, #h(2em) T = binom(q + 2, 2)$
  #[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$arrow.bl$over $bb(C)$, every parameter choice
], table.cell(rowspan: 1, colspan: 1)[$arrow.br$over $K = overline(bb(F))_2$, choose distinct parameters
],
  table.cell(rowspan: 1, colspan: 1)[#strong[Permanent projection] $"per"_m \( A_m \( X \) \) = a_0 G_D \( X \)$ $m gt.eq 11 k - 2 q \, #h(2em) a_0 eq.not 0$
], table.cell(rowspan: 1, colspan: 1)[#strong[Plane-curve geometry] $nabla G_(macron(D)) \( X \) = 0 med arrow.r.double med delta \( C_X \) gt.eq T$ $"codim" V \( nabla G_(macron(D)) \) gt.eq T - k$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.br$apply at the complex parameters supplied by geometry
], table.cell(rowspan: 1, colspan: 1)[$arrow.bl$proper specialization and a transverse linear section
],
)
]
  #strong[A smooth affine restriction over $bb(C)$] A nonzero homogeneous form $G$ of degree $r$ in $d$ variables has a smooth projective zero set and satisfies $G = "per"_m compose Phi_m$ for a fixed affine map $Phi_m$. $r - 1 gt.eq k / 4 \, #h(2em) d - 1 gt.eq k^2 / 200$
  $arrow.b$the polar count for smooth homogeneous forms
  $upright(overline(d c)) \( "per"_m \) gt.eq upright(overline(d c)) \( G \) gt.eq frac(\( r - 1 \) \( d - 1 \), 4 e) gt.eq frac(k^3, 3200 e)$],
  caption: [Figure 1: The two uses of the integral coefficient formula meet over $bb(C)$. The graph projection applies to every complex parameter choice; the characteristic-two branch supplies a suitable complex choice through the proper parameter family. The displayed scale bounds use $q = floor.l \( k - 1 \) \/ 3 floor.r$, $k gt.eq 128$, and $m gt.eq 11 k - 2 q$. ],
) <fig:proof-flow>

Sections 3–7 establish this construction. Section 8 then proves the smooth-form bound stated in Section 2, using selected simple polar intersections and the left and right kernels of one nearby determinant. Section 9 combines the two results and gives the exact, branching-program, and smooth-initial-form consequences.

== 2 Border models and smooth homogeneous forms <sec:models>

We first identify the two border models precisely. All closures in this section are over $bb(C)$. In a finite-dimensional polynomial space, coefficientwise convergence means ordinary convergence of the coefficients of every monomial. The image of a polynomial map is constructible #cite(label("StacksProject")) Theorem 29.23.3, Tag 054K, and a complex constructible set has the same Euclidean and Zariski closures. For the latter fact, decompose the set into finitely many locally closed subsets: each contains a Zariski open dense subset of its closure, which is also Euclidean dense. These facts apply both to the polynomial map taking an affine matrix to its determinant and to the action map defining a linear-group orbit. Thus coefficientwise sequences can be used for either closure below.

#thm([Lemma 2.1.])[
  (Affine substitution).  #emph[Let $f$ be a complex polynomial, let $A$ be an affine map into its variable space, and let $a eq.not 0$ be a complex scalar. Then 
$ upright(overline(d c)) \( a f compose A \) lt.eq upright(overline(d c)) \( f \) . $

]
] <lem:affine-substitution>

#proof[
  Fix a size $n$ and determinants $Q_j = det M_j$ converging coefficientwise to $f$, with all entries of $M_j$ affine-linear. The entries of $M_j compose A$ are still affine-linear. Substitution by the fixed map $A$ is a continuous linear map on spaces of polynomials of degree at most $n$, so $Q_j compose A arrow.r f compose A$. Multiplying one row of each substituted matrix by $a$ gives the assertion. This argument imposes no bound on the matrix entries in the approximating sequence. ◻
]

For $n gt.eq m$, let $W_n = "Mat"_n \( bb(C) \)$ and regard $det_n$ as a degree-$n$ form on $W_n$. Choose $m^2$ independent linear coordinates $x_(i j)$ on $W_n$. If $n > m$, choose one more independent coordinate $z$ and set

$ P_(n \, m) = z^(n - m) "per"_m \( x \) . $

If $n = m$, set $P_(m \, m) = "per"_m \( x \)$; no padding coordinate is needed. Let $cal(D)_n$ be the projective Zariski closure of the orbit of $\[ det_n \]$ under invertible linear substitutions on $W_n$.

#thm([Proposition 2.2.])[
  (Equivalence of the two border models).  #emph[For every $n gt.eq m gt.eq 1$, 
$ upright(overline(d c)) \( "per"_m \) lt.eq n quad arrow.l.r.double quad \[ P_(n \, m) \] in cal(D)_n . $

]
] <prop:model-equivalence>

#proof[
  Every linear map $L : W_n arrow.r W_n$ is a limit of invertible ones. Consequently $det_n compose L$ belongs to the affine closure of the determinant orbit. This orbit is invariant under nonzero scalar multiplication: multiplying one row of a matrix variable by $a eq.not 0$ multiplies its determinant by $a$ and is an invertible linear substitution. Its affine closure is therefore the cone over $cal(D)_n$. In particular a nonzero form belongs to this affine closure exactly when its projective class belongs to $cal(D)_n$.
  Suppose first that $upright(overline(d c)) \( "per"_m \) lt.eq n$. Identity blocks let us take every approximating matrix to have size exactly $n$. Write
  $ Q_j \( x \) = det (A_(j \, 0) + sum_(a \, b = 1)^m x_(a b) A_(j \, a b)) arrow.r "per"_m \( x \) . $
  For $n > m$, homogenize to degree $n$ using the independent coordinate $z$:
  $ Q_j^(upright("hom")) \( x \, z \) = det (z A_(j \, 0) + sum_(a \, b = 1)^m x_(a b) A_(j \, a b)) arrow.r z^(n - m) "per"_m \( x \) . $
  Homogenization here is a fixed linear map of coefficient spaces. Each displayed determinant is a linear substitution of $det_n$ on $W_n$, so its limit belongs to the same closed cone. The coordinates fit because $m^2 + 1 lt.eq n^2$ when $n > m$.
  For $n = m$, instead take the degree-$m$ homogeneous component of each $Q_j$. It is precisely
  $ det (sum_(a \, b = 1)^m x_(a b) A_(j \, a b)) \, $
  and these components converge to $"per"_m$. They again are linear substitutions of $det_m$. This proves the forward implication without introducing an extra variable in the case $n = m$.
  Conversely, the cone observation and equality of the two closures give determinant-orbit representatives converging coefficientwise to $P_(n \, m)$. When $n > m$, set $z = 1$ and all unused coordinates to zero; when $n = m$, just use the $m^2$ coordinates $x_(a b)$. Each resulting polynomial is an affine determinant of size $n$, and the limit is $"per"_m$. This proves the converse. Finally, a determinant of size less than $m$ has degree less than $m$, as does every polynomial in its coefficientwise closure. Thus $upright(overline(d c)) \( "per"_m \) gt.eq m$, and the stated range $n gt.eq m$ covers every size that can satisfy the affine condition. ◻
]

The quantitative obstruction used in the proof depends on the degree and the number of variables of a smooth homogeneous polynomial. Here smoothness means that the projective zero set has no point at which all first partial derivatives vanish.

#thm([Theorem 2.3.])[
  (Lower bound for smooth homogeneous forms).  #emph[Let $G in bb(C) \[ x_1 \, dots.h \, x_d \]$ be a nonzero homogeneous polynomial of degree $r gt.eq 2$, where $d gt.eq 2$. If its zero set in $bb(P)^(d - 1)$ is smooth, then 
$ upright(overline(d c)) \( G \) gt.eq frac(\( r - 1 \) \( d - 1 \), 4 e) . $

]
] <thm:smooth-border>

The complete proof is in Section 8. For a constant vector $w in bb(C)^d$, write

$ partial_w G = sum_(j = 1)^d w_j frac(partial G, partial x_j) $

for the first directional derivative, or #emph[first polar], of $G$. If $G$ is a coefficientwise limit of affine determinants of size $n$, the proof chooses $d - 2$ first polars whose common intersection with the hypersurface consists of $r \( r - 1 \)^(d - 2)$ simple points. It then shows that these selected points persist for one sufficiently close determinant and satisfy

#[#set math.equation(numbering: n => "(2.1)")
 $ r \( r - 1 \)^(d - 2) lt.eq 2^(d - 2) binom(2 n - 1, d - 1) lt.eq (frac(4 e n, d - 1))^(d - 1) . $ <eq:smooth-count-synopsis>]

The binomial coefficient is understood to be zero when $d - 1 > 2 n - 1$; in that case the positive left side already rules out the approximation. The first inequality comes from lifting the selected points to the right and left kernel lines of the determinant matrix and counting the resulting bilinear equations. Taking the $\( d - 1 \)$st root gives the theorem. The proof establishes persistence and simplicity of those selected lifts using only coefficientwise closeness of the determinant polynomials, so it allows unbounded coefficients in the approximating matrices.

This comparison specifies our construction’s target. A nonzero homogeneous form of degree proportional to $k$ in quadratically many variables, with a smooth projective zero set, forces cubic determinant size. We now produce such a form as a fixed affine restriction of a permanent whose size is linear in $k$.

== 3 Selecting a coefficient by a permanent projection <sec:selector>

We realize a coefficient of a diagonally shifted permanent as an affine projection of a larger permanent. The construction selects prescribed exponents in two auxiliary variables while keeping the larger permanent’s size linear in the order of the shifted permanent.

Fix integers $k gt.eq 1$ and $0 lt.eq q lt.eq floor.l k \/ 2 floor.r$, and put $r = k - 2 q$. Let $theta_1 \, dots.h \, theta_k$ be indeterminates and put $D = "diag" \( theta_1 \, dots.h \, theta_k \)$. Let $X = \( X_(i j) \)_(1 lt.eq i \, j lt.eq k)$ be a matrix of independent variables. Define the integral coefficient polynomial $G_D in bb(Z) \[ theta_1 \, dots.h \, theta_k \] \[ X_(i j) : 1 lt.eq i \, j lt.eq k \]$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ G_D \( X \) = \[ s^q t^q \] "per"_k \( X + s I + t D \) . $ <eq:selector-coefficient>]

The brackets denote coefficient extraction in the auxiliary variables $s \, t$. For a tuple of values $theta_i$ in any field, we use the same notation $G_D$ for the specialized polynomial. Write $\[ k \] = { 1 \, dots.h \, k }$. Expanding the diagonal entries gives

#[#set math.equation(numbering: n => "(3.2)")
 $ G_D \( X \) = sum_(S \, T subset.eq \[ k \] \, med \| S \| = \| T \| = q\
S ∩ T = diameter) (product_(i in T) theta_i) "per" \( X_(C \, C) \) \, #h(2em) C = \[ k \] \\ \( S union T \) . $ <eq:selector-subsets>]

Indeed, $S$ records the diagonal positions contributing $s$, and $T$ those contributing $t theta_i$. The two sets are disjoint because each row and column is used once in a permanent term. After these fixed diagonal positions are removed, the remaining permutation is an arbitrary permutation of $C$, and these data recover the original term uniquely. Thus no additional factorial occurs in (3.2). Every summand is homogeneous of degree $r$ in $X$. We use the convention that the permanent of the empty matrix is $1$.

We use the matching interpretation of a permanent. A matrix’s rows and columns form the two vertex classes of a bipartite graph, with each entry as the weight of the edge joining its row to its column. The permanent is the sum, over perfect matchings, of the products of their edge weights. Negative weights are allowed. Weighted matching gadgets and cancellation are classical tools of Valiant’s projection framework #cite(label("Valiant1979Algebra")). The practice of fixing external choices before summing internal completions also appears in his permanent reduction #cite(label("Valiant1979Permanent")) Lemma 3.1 and its proof. Signed gadgets enforcing equality of edge choices also appear in Dell, Husfeldt, Marx, Taslaman and Wahlén #cite(label("DellHusfeldtMarxTaslamanWahlen2014")) Section 3 and Figure 2. Here we give the weights and completion counts needed for a construction of linear size.

#thm([Proposition 3.1.])[
  (Coefficient projection).  #emph[Let $k gt.eq 1$ and $0 lt.eq q lt.eq floor.l k \/ 2 floor.r$ be integers, put $r = k - 2 q$, and let $D = "diag" \( theta_1 \, dots.h \, theta_k \)$ with $theta_i in bb(C)$. For every integer $m gt.eq 11 k - 2 q$, there is an $m times m$ matrix $A \( X \)$ of complex affine-linear forms such that 
#[#set math.equation(numbering: n => "(3.3)")
 $ "per"_m \( A \( X \) \) = a_0 G_D \( X \) \, #h(2em) a_0 = \( - 2 \)^(2 k) #scale(x: 120%, y: 120%)[\(] \( k - q \) ! #scale(x: 120%, y: 120%)[\)]^4 eq.not 0 . $ <eq:selector-scalar>]

 Its entrywise homogenization $B \( X \, z \)$ is a matrix of homogeneous linear forms whose permanent is the degree-$m$ homogenization of $a_0 G_D$: 
#[#set math.equation(numbering: n => "(3.4)")
 $ "per"_m \( B \( X \, z \) \) = a_0 z^(m - r) G_D \( X \) . $ <eq:selector-homogeneous>]

 The construction requires no distinctness or nonvanishing assumption on the entries of $D$.]
] <prop:selector>

#proof[
  Start with $k$ main rows and columns carrying the edges $X_(i j)$. At each diagonal position add two labeled special edges, with weights
  $ w_(i \, 1) = 1 \, #h(2em) w_(i \, 2) = theta_i . $
  We call them the first and second color. At this intermediate stage they are parallel to the ordinary edge $X_(i i)$. The three labels record the choices $X_(i i)$, $s$, and $t theta_i$ in the diagonal entry, with the factors $s \, t$ omitted from the two special weights. The coefficient of $s^q t^q$ in the shifted permanent is therefore the weighted sum of main matchings using exactly $q$ special edges of each color, as in (3.2). We will count each color in a separate gate and couple each special main edge to the corresponding distinguished edge of its gate.
  #emph[A gate imposing one prescribed count.] Put $h = k - q$. Take $k$ original rows and columns, with distinguished diagonal edges of weight $1$, and $h$ additional rows and columns. Join every original row to every additional column and every additional row to every original column, all with weight $1$. There are no other edges. Every additional row must occupy an original column, and every additional column must be occupied by an original row. Consequently exactly $q$ distinguished edges occur in a perfect matching.
  For each prescribed distinguished set $S subset.eq \[ k \]$ of size $q$, the remaining original rows match the additional columns in $h !$ ways, and the additional rows match the remaining original columns in $h !$ ways. These choices are independent. Hence the multiplicity for this exact set is
  #[#set math.equation(numbering: n => "(3.5)")
   $ \( h ! \)^2 = \( \( k - q \) ! \)^2 . $ <eq:selector-gate-count>]
  This also covers $q = 0$: all original rows and columns then match across the two groups.
  #emph[A gadget equating two edge choices.] Call the main and gate vertices #emph[outer]. For one special main edge of weight $w$ and its distinguished gate edge of weight $1$, write the outer row endpoints as $u_1 \, u_2$ and the outer column endpoints as $v_1 \, v_2$, respectively. These two edges have distinct endpoints. Delete them and add three fresh internal rows and three fresh internal columns, with weight matrix
  #[#set math.equation(numbering: n => "(3.6)")
   $ H = mat(delim: "(", - 1, - 1, 1; - 1, - 1, 1; 1, 1, 1) . $ <eq:selector-gadget>]
  For $i = 1 \, 2$, add an incoming edge from $u_i$ to internal column $i$ and an outgoing edge from internal row $i$ to $v_i$. All four weights are $1$, except that the first incoming edge has weight $- 2 w$.
  Fix the subset $I subset.eq { 1 \, 2 }$ of incoming edges used and the subset $O subset.eq { 1 \, 2 }$ of outgoing edges used. Let $Phi_w \( I \, O \)$ be the total weight of their internal completions, including the weights of those boundary edges. If $\| I \| eq.not \| O \|$, the remaining internal row and column sets have different sizes, so there is no completion and $Phi_w \( I \, O \) = 0$. Otherwise
  #[#set math.equation(numbering: n => "(3.7)")
   $ Phi_w \( I \, O \) = \( - 2 w \)^(upright(bold(1))_({ 1 in I })) "per" H_({ 1 \, 2 \, 3 } \\ O \, thin { 1 \, 2 \, 3 } \\ I) . $ <eq:selector-boundary-weight>]
  The complete table of $Phi_w$ is
  #[#set math.equation(numbering: n => "(3.8)")
   $ I without O & diameter & { 1 } & { 2 } & { 1 \, 2 }\
diameter & - 2 & 0 & 0 & 0\
{ 1 } & 0 & 0 & 0 & 0\
{ 2 } & 0 & 0 & 0 & 0\
{ 1 \, 2 } & 0 & 0 & 0 & - 2 w . $ <eq:selector-boundary-table>]
  To verify the six balanced cases, first $"per" H = - 2$. Deleting any one row and any one column indexed in ${ 1 \, 2 }$ leaves $mat(delim: "(", - 1, 1; 1, 1)$, whose permanent is $- 1 + 1 = 0$. This includes the crossed choices $I = { 1 } \, O = { 2 }$ and $I = { 2 } \, O = { 1 }$. Deleting both interface rows and columns leaves the entry $H_33 = 1$; the four external edge weights then have product $- 2 w$. The ten unbalanced cases have already been excluded.
  Thus $Phi_w \( I \, O \)$ vanishes unless $I = O = diameter$ or $I = O = { 1 \, 2 }$. In these two states the weights $- 2$ and $- 2 w$ reproduce neither outer edge being used or both being used, with the common factor $- 2$. The four balanced singleton states can have individual internal matchings; it is their sums that cancel.
  #emph[Combining the two counts.] Take two disjoint copies of the count gate, one for each color. For every $i in \[ k \]$ and $c in { 1 \, 2 }$, replace the special main edge of weight $w_(i \, c)$ and its distinguished gate edge by the equality gadget. Use fresh internal rows and columns for all $2 k$ gadgets. At a fixed index $i$, the two replacements share the main row and column, while their internal vertices and their gate endpoints remain distinct. Figure 2 shows these attachments.
  #figure(
    [(460,202) (174,129)(112,55) (174,25)(112,55) (72,104)(1,0)316 (72,104)(123,122)(174,140) (286,140)(337,122)(388,104) (72,171)(1,0)102 (286,171)(1,0)102 (72,104)(123,86)(174,68) (286,68)(337,86)(388,104) (72,37)(1,0)102 (286,37)(1,0)102 (72,104) (388,104) (72,171) (388,171) (72,37) (388,37) (174,171) (174,140) (286,171) (286,140) (174,68) (174,37) (286,68) (286,37) (230,162)(0,0)color 1: $H$ (230,151)(0,0)3 rows $+$ 3 columns (181,171)(0,0)\[l\]$c_2$ (181,140)(0,0)\[l\]$c_1$ (279,171)(0,0)\[r\]$r_2$ (279,140)(0,0)\[r\]$r_1$ (230,57)(0,0)color 2: $H$ (230,46)(0,0)3 rows $+$ 3 columns (181,68)(0,0)\[l\]$c_1$ (181,37)(0,0)\[l\]$c_2$ (279,68)(0,0)\[r\]$r_1$ (279,37)(0,0)\[r\]$r_2$ (64,104)(0,0)\[r\]shared main row $i$ (396,104)(0,0)\[l\]shared main column $i$ (72,192)(0,0)gate 1 row $i$ (388,192)(0,0)gate 1 column $i$ (72,16)(0,0)gate 2 row $i$ (388,16)(0,0)gate 2 column $i$ (230,113)(0,0)$X_(i i)$ (122,132)(0,0)$- 2$ (121,76)(0,0)$- 2 theta_i$],
    caption: [Figure 2: Wiring after the two replacements at a fixed diagonal position $i$. Each box is a separate copy of $H$ on three fresh rows and three fresh columns. Its incoming ports $c_1 \, c_2$ are internal columns and its outgoing ports $r_1 \, r_2$ are internal rows; their placement is schematic. The two copies share the main endpoints and have distinct gate and internal vertices. Unlabeled boundary edges have weight $1$. The ordinary edge $X_(i i)$ remains; other main and gate edges are omitted. ],
  ) <fig:selector-wiring>
  Group the full matching sum by the set $E$ of chosen edges outside the internal $H$-blocks. This set includes all chosen incoming and outgoing edges and must cover each outer vertex exactly once. Let $w_(upright("out")) \( E \)$ be the product of the weights of the chosen edges whose two endpoints are outer. For the gadget indexed by $\( i \, c \)$, write $I_(i \, c) \, O_(i \, c)$ for its boundary state. Since the internal vertex sets are disjoint, the total weight of all completions of $E$ is
  $ w_(upright("out")) \( E \) product_(i = 1)^k product_(c = 1)^2 Phi_(w_(i \, c)) \( I_(i \, c) \, O_(i \, c) \) . $
  Each factor $Phi_(w_(i \, c))$ already includes its boundary edge weights; $w_(upright("out")) \( E \)$ contains only the remaining chosen weights. By (3.8), this product vanishes unless every gadget has $I_(i \, c) = O_(i \, c) = diameter$ or $I_(i \, c) = O_(i \, c) = { 1 \, 2 }$. Unbalanced states have no completion, and balanced singleton states cancel.
  Now restrict to choices $E$ for which every gadget has one of these two states. For each gadget with $I_(i \, c) = O_(i \, c) = { 1 \, 2 }$, replace its four boundary edges by the original special main edge and distinguished gate edge. For an empty state, insert neither original edge. Because $E$ covers every outer vertex exactly once, this contraction gives a perfect matching in the graph before replacement, with each special main edge used if and only if its paired gate edge is used. Conversely, each such matching determines the set $E$ and its boundary states uniquely. The table assigns $- 2 w_(i \, c)$ to a used pair of original weight $w_(i \, c)$, and $- 2$ to an unused pair of weight $1$. Hence its contribution is its original matching weight multiplied by exactly one factor $- 2$ for each of the $2 k$ gadgets. Shared main endpoints enter through the matching constraint enforced when $E$ is fixed; the internal factorization uses disjoint vertices.
  Each gate now forces exactly $q$ special edges of its color. The two selected sets are disjoint by the main matching condition. For these sets, the two gates contribute $\( \( k - q \) ! \)^4$ by (3.5), while the main matching sum is the corresponding summand of (3.2). The $2 k$ gadgets contribute $\( - 2 \)^(2 k)$. This proves (3.3) for the unpadded construction.
  Its number of rows, and separately its number of columns, is
  #[#set math.equation(numbering: n => "(3.9)")
   $ k + 2 \( 2 k - q \) + 3 \( 2 k \) = 11 k - 2 q . $ <eq:selector-size>]
  These terms count the main graph, the two count gates, and the fresh internal blocks. The final graph has no parallel special edges: their replacements lead to distinct internal columns. Its weight matrix therefore has entries that are variables or constants. Append an identity block to reach order $m$; its unique matching has weight $1$, so the permanent identity is preserved.
  Finally, write this padded affine matrix as $A \( X \) = A_0 + sum_(i \, j) X_(i j) A_(i j)$ and set $B \( X \, z \) = z A_0 + sum_(i \, j) X_(i j) A_(i j)$. For $z eq.not 0$, homogeneity gives
  $ "per"_m B \( X \, z \) = z^m "per"_m A \( X \/ z \) = a_0 z^m G_D \( X \/ z \) = a_0 z^(m - r) G_D \( X \) . $
  Since $m gt.eq k gt.eq r$, both sides are polynomials. Their equality for $z eq.not 0$ proves their identity also at $z = 0$. The identity block is homogenized along with every other constant entry, so it contributes the additional power of $z$ required in (3.4). ◻
]

The affine identity yields a comparison for every fixed affine substitution.

#thm([Corollary 3.2.])[
  #emph[Under the hypotheses of Proposition 5, let $d gt.eq 1$ be an integer and let $Lambda : bb(C)^d arrow.r "Mat"_k \( bb(C) \)$ be any fixed affine map. Then 
$ upright(overline(d c)) \( G_D compose Lambda \) lt.eq upright(overline(d c)) \( "per"_m \) . $

 In particular, this holds for every fixed linear restriction of $G_D$.]
] <cor:selector-border>

#proof[
  Proposition 5 gives $G_D compose Lambda = a_0^(- 1) "per"_m compose A compose Lambda$. Apply Lemma 2 to the affine map $A compose Lambda$ and the nonzero scalar $a_0^(- 1)$. Both are fixed before any determinant approximation is chosen. ◻
]

#prodef([Remark 3.3.])[
  The coefficient formula (3.1) and the subset formula (3.2) are integral and can be specialized over any field. The projection used for the complex border comparison requires the nonzero scalar $a_0$, whose factor $\( - 2 \)^(2 k)$ vanishes in characteristic two. The characteristic-two argument uses the integral coefficient expression specialized directly to $overline(bb(F))_2$.
] <rem:selector-characteristic>

== 4 The adjugate scheme in characteristic two <sec:adjugate>

We now study the coefficient formula (3.1) over

$ K = overline(bb(F))_2 . $

In this characteristic the permanent equals the determinant. This lets us associate a plane curve and a finite adjugate scheme to every matrix $X$. Vanishing of the gradient will force this finite scheme to have large length.

Fix an integer $k gt.eq 2$, pairwise distinct elements $theta_1 \, dots.h \, theta_k in K$, and $D = "diag" \( theta_1 \, dots.h \, theta_k \)$. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ q = ⌊frac(k - 1, 3)⌋ \, #h(2em) r = k - 2 q \, #h(2em) c = r - 1 \, #h(2em) T = binom(q + 2, 2) . $ <eq:adjugate-parameters>]

Thus

#[#set math.equation(numbering: n => "(4.2)")
 $ 2 q + c = k - 1 \, #h(2em) 0 lt.eq q lt.eq c . $ <eq:adjugate-degrees>]

For a polynomial, brackets denote extraction of the indicated monomial coefficient. We use the homogeneous degree-$r$ polynomial

#[#set math.equation(numbering: n => "(4.3)")
 $ G_D \( X \) = \[ s^q t^q \] "per"_k \( X + s I_k + t D \) = \[ s^q t^q \] det \( X + s I_k + t D \) . $ <eq:adjugate-coefficient-polynomial>]

Statements about its gradient below refer to the common zero locus of all its $k^2$ entrywise partial derivatives; no equation $G_D = 0$ is included in that definition.

For each fixed $X in "Mat"_k \( K \)$, put

#[#set math.equation(numbering: n => "(4.4)")
 $ A = t D + u X \, #h(2em) M = s I_k + A \, #h(2em) F_X \( s \, t \, u \) = det M \, #h(2em) C_X = V \( F_X \) subset bb(P)_K^2 . $ <eq:adjugate-curve>]

Here $F_X$ has degree $k$, with coefficient $1$ at $s^k$. We abbreviate $C_X$ to $C$ when $X$ is fixed.

#thm([Lemma 4.1.])[
  (Projection of the auxiliary curve).  #emph[For every $X in "Mat"_k \( K \)$, the curve $C_X$ is reduced and the map 
$ pi : C_X arrow.r bb(P)_K^1 \, #h(2em) \[ s : t : u \] mapsto \[ t : u \] $

 is finite flat of degree $k$ and is étale over a nonempty open subset of the base. Every irreducible component of $C_X$ meets the line $u = 0$, and at each point of that intersection $M$ has rank $k - 1$. Moreover, $pi^(*) cal(O)_(bb(P)^1) \( 1 \) = cal(O)_C \( 1 \)$, and 
#[#set math.equation(numbering: n => "(4.5)")
 $ pi_(*) cal(O)_C = xor.big_(j = 0)^(k - 1) cal(O)_(bb(P)^1) \( - j \) \, #h(2em) cal(E) := pi_(*) cal(O)_C \( k - 1 \) = xor.big_(j = 0)^(k - 1) cal(O)_(bb(P)^1) \( k - 1 - j \) . $ <eq:adjugate-splitting>]

]
] <lem:adjugate-projection>

#proof[
  The restriction
  #[#set math.equation(numbering: n => "(4.6)")
   $ F_X \( s \, t \, 0 \) = product_(i = 1)^k \( s + t theta_i \) $ <eq:adjugate-fixed-fiber>]
  is squarefree. If a positive-degree irreducible homogeneous factor $H$ occurred at least twice in $F_X$, its restriction to $u = 0$ could not vanish identically: otherwise $u$ would divide $F_X$, contrary to (4.6). That restriction is a nonzero homogeneous polynomial of the same positive degree as $H$. Its square would divide (4.6), a contradiction. Thus $C$ is reduced. The restriction of each irreducible factor is likewise a positive-degree binary form, so it has a projective zero over $K$. Hence every component meets $u = 0$.
  The points on that line are
  $ P_i = \[ - theta_i : 1 : 0 \] #h(2em) \( 1 lt.eq i lt.eq k \) . $
  At $P_i$, the matrix $M$ is diagonal with exactly one zero entry. It has rank $k - 1$, and its $i$-th diagonal adjugate entry is $product_(j eq.not i) \( theta_j - theta_i \) eq.not 0$.
  The only possible base point of the projection is $\[ 1 : 0 : 0 \]$, which does not belong to $C$ because $F_X \( 1 \, 0 \, 0 \) = 1$. On the base chart $t eq.not 0$, use $v = u \/ t$ and $y = s \/ t$. The inverse image has coordinate algebra
  $ K \[ v \, y \] #scale(x: 120%, y: 120%)[\/] det \( y I_k + D + v X \) . $
  Its defining polynomial is monic of degree $k$ in $y$; consequently this algebra is free over $K \[ v \]$, with basis $1 \, y \, dots.h \, y^(k - 1)$. The chart $u eq.not 0$ gives the same conclusion, so $pi$ is finite flat of degree $k$. At $v = 0$ the monic polynomial has the distinct roots $- theta_1 \, dots.h \, - theta_k$. Its resultant with its $y$-derivative is nonzero there, and hence nonzero on an open subset of the base. Over that open subset the finite flat map is étale. In particular its generic algebra is a product of finite separable field extensions, also when $k$ is even.
  The sections $t \, u$ have no common zero on $C$, so they identify $pi^(*) cal(O)_(bb(P)^1) \( 1 \)$ with $cal(O)_C \( 1 \)$. The two monic-polynomial bases satisfy
  $ \( s \/ u \)^j = \( t \/ u \)^j \( s \/ t \)^j #h(2em) \( 0 lt.eq j < k \) $
  on their overlap. These are exactly the transition functions of $cal(O)_(bb(P)^1) \( - j \)$. This proves the first splitting in (4.5); tensoring by $cal(O)_(bb(P)^1) \( k - 1 \)$ and using the projection formula proves the second. ◻
]

The fixed distinct-root fiber has established reducedness and a finite flat, generically separable projection. We next use the adjugate to turn a vanished coefficient into a lower bound on the length of a finite scheme.

Each entry of $"adj" M$ is a homogeneous form of degree $k - 1$. Define its ideal on $C$ intrinsically by

#[#set math.equation(numbering: n => "(4.7)")
 $ J = "im" #scale(x: 120%, y: 120%)[\(] cal(O)_C \( 1 - k \)^(k^2) arrow.r^(med upright("entries of ") "adj" M med) cal(O)_C #scale(x: 120%, y: 120%)[\)] \, #h(2em) Z = V_C \( J \) . $ <eq:adjugate-ideal>]

Thus a local trivialization of $cal(O)_C \( k - 1 \)$ turns the adjugate entries into generators of $J$. Changing the trivialization multiplies all generators by a unit and leaves the ideal unchanged. By Lemma 8, each component of $C$ contains a point at which an adjugate entry is nonzero. The support of $cal(O)_C \/ J$ therefore contains no component of $C$, so $Z$ is a finite scheme. It may have nonreduced structure.

#thm([Lemma 4.2.])[
  (Generation by adjugate entries).  #emph[Every homogeneous form of degree $k - 1$ that vanishes scheme-theoretically on $Z$ is a constant $K$-linear combination of the entries of $"adj" M$.]
] <lem:adjugate-generation>

#proof[
  All sheaves on the base in this proof are on $bb(P)_K^1$. The adjugate entries define a morphism
  $ psi : "Mat"_k \( cal(O) \) arrow.r cal(E) \, #h(2em) Y mapsto "tr" \( Y "adj" M \) . $
  The trace pairs matrix entries in transposed order, so its image is the $cal(O)$-span of all adjugate entries. We first show that
  #[#set math.equation(numbering: n => "(4.8)")
   $ "im" psi = pi_(*) \( J \( k - 1 \) \) . $ <eq:adjugate-image>]
  Work on either standard affine chart of the base and trivialize $cal(O) \( 1 \)$. Write its coordinate ring as $R$, the affine $s$-coordinate as $y$, and the corresponding matrix as $A_0$. The curve algebra is $B = R \[ y \] \/ \( f \)$, where $f = det \( y I_k + A_0 \)$. Let $Q$ be the $R$-span in $B$ of the entries of $"adj" \( y I_k + A_0 \)$. The adjugate identity gives, in $B$,
  $ y "adj" \( y I_k + A_0 \) = - A_0 "adj" \( y I_k + A_0 \) . $
  Thus $Q$ is stable under multiplication by $y$. Since $B$ is generated by $y$ over $R$, $Q$ is already the $B$-ideal generated by these entries. Restoring the local trivialization proves (4.8) on both charts.
  Put $cal(K) = ker psi$. To lift every global section of $"im" psi$ to a constant matrix, it is enough to prove $H^1 \( cal(K) \) = 0$. We obtain this vanishing by comparing $cal(K)$ with the image of the commutator with $A$.
  The matrix $A = t D + u X$ has entries in $cal(O) \( 1 \)$, so the commutator defines the morphism
  $ chi : "Mat"_k \( cal(O) \( - 1 \) \) arrow.r "Mat"_k \( cal(O) \) \, #h(2em) Y mapsto A Y - Y A . $
  The adjugate commutes with $A$, and cyclicity of trace gives $psi chi = 0$. Put $cal(I) = "im" chi$; then $cal(I) subset cal(K)$.
  At the base point $\[ t : u \] = \[ 1 : 0 \]$, the commutator is $\[ D \, - \]$. On the matrix unit $E_(i j)$ it acts by multiplication by $theta_i - theta_j$. These multipliers are nonzero for $i eq.not j$, including in characteristic two. Hence the commutator has rank $k^2 - k$ at that point. At the same point, the images under $psi$ of the diagonal matrix units are the classes of
  $ h_i \( y \) = product_(j eq.not i) \( y + theta_j \) quad upright("in") quad K \[ y \] #scale(x: 120%, y: 120%)[\/] product_j \( y + theta_j \) . $
  Evaluation at the $k$ distinct roots gives a diagonal matrix with nonzero diagonal, so these classes are independent and $psi$ has rank $k$, the rank of $cal(E)$. Its generic rank is therefore $k$, and its generic kernel has dimension $k^2 - k$. The rank of $chi$ at $\[ 1 : 0 \]$ shows that its generic rank is at least $k^2 - k$, while $cal(I) subset cal(K)$ gives the opposite inequality. Thus $cal(I)$ and $cal(K)$ have equal generic rank. The quotient $cal(K) \/ cal(I)$ is therefore a coherent torsion sheaf on $bb(P)^1$.
  We now use two exact sequences to compute $H^1 \( cal(K) \)$. The first is
  $ 0 arrow.r ker chi arrow.r cal(O) \( - 1 \)^(k^2) arrow.r cal(I) arrow.r 0 . $
  Since $H^1 \( bb(P)^1 \, cal(O) \( - 1 \) \) = 0$ and coherent $H^2$ vanishes on $bb(P)^1$, its cohomology sequence gives $H^1 \( cal(I) \) = 0$. These two facts follow, for example, from the usual computation with the two standard affine charts of $bb(P)^1$. Next, a coherent torsion sheaf on $bb(P)^1$ has finite support and vanishing $H^1$. The sequence
  $ 0 arrow.r cal(I) arrow.r cal(K) arrow.r cal(K) \/ cal(I) arrow.r 0 $
  therefore gives $H^1 \( cal(K) \) = 0$. Finally, the sequence
  $ 0 arrow.r cal(K) arrow.r cal(O)^(k^2) arrow.r "im" psi arrow.r 0 $
  shows that constant matrices surject onto
  $ H^0 \( bb(P)^1 \, "im" psi \) = H^0 \( C \, J \( k - 1 \) \) \, $
  where the equality uses (4.8) and finite pushforward.
  Let $P$ be a degree-$k - 1$ homogeneous form vanishing on the scheme $Z$. Its restriction to $C$ is a section of $J \( k - 1 \)$, so the preceding surjectivity expresses it on $C$ as a constant linear combination of the adjugate entries. Their difference is a degree-$k - 1$ form vanishing on $C$. Since the homogeneous ideal of this plane hypersurface is generated by $F_X$, of degree $k$, the difference is zero. Thus the equality holds as an equality of homogeneous forms. ◻
]

#thm([Proposition 4.3.])[
  (Length forced by the gradient).  #emph[With the parameters in (4.1), let $X in "Mat"_k \( K \)$ satisfy $nabla G_D \( X \) = 0$. Then its adjugate zero scheme $Z$ satisfies 
$ "length" Z gt.eq T = binom(q + 2, 2) . $

]
] <prop:adjugate-length>

#proof[
  Homogeneity and entrywise differentiation give
  $ G_D \( X \) = \[ s^q t^q u^r \] F_X \, #h(2em) frac(partial F_X, partial X_(i j)) = u \( "adj" M \)_(j i) . $
  Thus the gradient hypothesis is precisely the entrywise condition
  #[#set math.equation(numbering: n => "(4.9)")
   $ \[ s^q t^q u^c \] "adj" M = 0 \, #h(2em) c = r - 1 . $ <eq:adjugate-coefficient-zero>]
  This calculation uses no division by the degree $r$. By Lemma 9, the functional $Lambda = \[ s^q t^q u^c \]$ consequently vanishes on every degree-$k - 1$ form that vanishes scheme-theoretically on $Z$.
  The next comparison is the line-bundle case of Gałązka’s catalecticant bound under this annihilation condition. It uses the multiplication map $P mapsto \( Q mapsto Lambda \( P Q \) \)$, where $P$ and $Q$ have degrees $q$ and $k - 1 - q$, respectively #cite(label("Galazka2017")) Theorem 4 and Propositions 6, 7, and 9 in arXiv:1605.08005v1. The complementary monomials below compute this map directly over $K$.
  Suppose that a degree-$q$ form
  $ P = sum_(i + j + ell = q) a_(i j ell) s^i t^j u^ell $
  vanishes on $Z$. For each triple in this sum, the monomial
  $ s^(q - i) t^(q - j) u^(c - ell) $
  has nonnegative exponents because $i \, j \, ell lt.eq q lt.eq c$. Its product with $P$ still vanishes on $Z$, and has degree $2 q + c = k - 1$. Exactly one term contributes to its selected coefficient, giving
  $ 0 = Lambda #scale(x: 120%, y: 120%)[\(] s^(q - i) t^(q - j) u^(c - ell) P #scale(x: 120%, y: 120%)[\)] = a_(i j ell) . $
  Hence $P = 0$. Restriction therefore induces an injection
  $ H^0 \( bb(P)^2 \, cal(O) \( q \) \) arrow.r.hook H^0 \( Z \, cal(O)_Z \( q \) \) . $
  The space on the left has dimension $binom(q + 2, 2)$. On a finite scheme over $K$, an invertible sheaf is free of rank one on each Artin local component, so its space of global sections has dimension equal to the scheme’s length. The space on the right thus has dimension $"length" Z$, including all nonreduced multiplicities. The stated inequality follows. ◻
]

== 5 The conductor and the normalization defect <sec:conductor>

We next bound the length of the adjugate subscheme by the singularities of the plane curve. For a reduced projective curve $C$, let $nu : tilde(C) arrow.r C$ be its normalization and set

#[#set math.equation(numbering: n => "(5.1)")
 $ delta \( C \) = dim_K H^0 #scale(x: 120%, y: 120%)[\(] C \, nu_(*) cal(O)_(tilde(C)) \/ cal(O)_C #scale(x: 120%, y: 120%)[\)] . $ <eq:conductor-delta>]

The normalization may be disconnected. The comparison below follows the evaluation-ideal argument of Fantechi–Göttsche–van Straten #cite(label("FGvS1999")) Proposition C.2 and Corollary C.3. Their setting is over $bb(C)$; we give the local proof needed here in arbitrary characteristic.

#thm([Lemma 5.1.])[
  #emph[Let $k gt.eq 1$ be an integer, let $K$ be an algebraically closed field, and let $S$ be a discrete valuation ring containing $K$, with residue field $K$ and fraction field $Q$. For $A_0 in "Mat"_k \( S \)$, put 
$ M_0 = y I + A_0 \, #h(2em) f = det M_0 \, #h(2em) B = S \[ y \] \/ \( f \) . $

 Suppose that $f$ is separable over $Q$. Let $R$ be the normalization of $B$ in $B_Q = B ⊗_S Q$, let 
$ frak(c) = { a in B : a R subset B } \, $

 and let $J_0 subset B$ be the ideal generated by the entries of $"adj" M_0$. Then 
#[#set math.equation(numbering: n => "(5.2)")
 $ frak(c) subset J_0 \, #h(2em) "length"_S \( B \/ J_0 \) lt.eq "length"_S \( B \/ frak(c) \) = "length"_S \( R \/ B \) . $ <eq:conductor-local-length>]

]
] <lem:conductor-local>

#proof[
  Monicity makes $B$ free over $S$, with basis $1 \, y \, dots.h \, y^(k - 1)$. In particular, it embeds into $B_Q$, a product of finite separable field extensions of $Q$, and is reduced. The integral closures of $S$ and $B$ in this algebra agree, since $B$ is integral over $S$. They are finite over $S$. One way to see the finiteness directly is to use the sum of the field trace pairings on the factors of $B_Q$. This pairing is nondegenerate, so the lattice dual to $B$ is finite free over $S$. If $z in B_Q$ is integral over $S$, then each $z y^j$, for $0 lt.eq j < k$, is integral because $y$ is integral. Its trace lies in the integrally closed ring $S$, so $z$ belongs to the dual lattice. The normalization is an $S$-submodule of that finite lattice and is therefore finite. The same finiteness conclusion follows by applying the normalization theorem #cite(label("StacksProject")) Tag 032L to each field factor.
  It follows that $R$ is semilocal. Its localizations at maximal ideals are one-dimensional Noetherian normal local domains, hence discrete valuation rings #cite(label("StacksProject")) Tag 00PD. All their residue fields are $K$. As a finite torsion-free $S$-module, $R$ is free of rank $k$, and $R \/ B$ has finite length.
  #emph[The adjugate ideal as an evaluation ideal.] Consider the $B$-module
  $ L = "coker" \( M_0 : B^k arrow.r B^k \) . $
  The same cokernel over $S \[ y \]$ is $S^k$, with $y$ acting as $- A_0$: polynomial-vector division by the monic matrix $y I + A_0$ reduces every class uniquely to a constant vector. The adjugate identity shows that $f$ already kills this cokernel. Thus $L$ is free of rank $k$ over $S$.
  Over a splitting field of $f$, the action of $- A_0$ has $k$ distinct eigenvalues, each with a one-dimensional eigenspace. Consequently $L_Q$ is rank one over every field factor of $B_Q$, and $L_Q tilde.eq B_Q$ as a $B_Q$-module. Fixing such an isomorphism embeds the $S$-free module $L$ as a lattice in $B_Q$.
  Define its evaluation ideal by
  $ tau_B \( L \) = "im" ("Hom"_B \( L \, B \) ⊗_B L arrow.r B) . $
  A homomorphism $L arrow.r B$ is a row annihilating $M_0$ modulo $f$. Lift the row to $b in S \[ y \]^(1 times k)$, so that $b M_0 = f b'$ for another polynomial row $b'$. Multiplication by the adjugate gives
  $ f b = f b' "adj" M_0 . $
  We may cancel the nonzero $f$ in the domain $S \[ y \]$, obtaining $b = b' "adj" M_0$. Conversely, each adjugate row annihilates $M_0$ modulo $f$. Evaluation on the standard generators of $L$ therefore gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ tau_B \( L \) = J_0 . $ <eq:conductor-evaluation>]
  #emph[The conductor is contained in the evaluation ideal.] The fractional ideal $I = R L subset B_Q$ is free of rank one at every maximal localization of $R$. We claim that some $h in L$ generates it at all these localizations at once. Choose $S$-generators $l_1 \, dots.h \, l_k$ of $L$. At a maximal ideal $frak(m)$ of $R$, their images span the one-dimensional $K$-space $I_(frak(m)) \/ frak(m) I_(frak(m))$. The coefficients $\( a_1 \, dots.h \, a_k \) in K^k$ for which $sum_i a_i l_i$ has zero image form a proper linear subspace. There are only finitely many such maximal ideals. Since $K$ is infinite, we can avoid all these subspaces. The resulting $h = sum_i a_i l_i in L$ generates every $I_(frak(m))$, and hence $I = h R$.
  In particular, $h$ is nonzero in every field factor of $B_Q$. The rescaled module $L' = h^(- 1) L$ satisfies
  $ B subset L' subset R : $
  it contains $1$, and $L subset R L = h R$. For $a in frak(c)$, multiplication by $a$ defines a homomorphism $L' arrow.r B$ whose value at $1$ is $a$. Evaluation ideals are invariant under module isomorphism, so
  $ frak(c) subset tau_B \( L' \) = tau_B \( L \) = J_0 . $
  We have identified the adjugate ideal with an evaluation ideal and shown that it contains the conductor. It remains to compute the conductor colength in terms of the normalization.
  #emph[The conductor colength.] Let $lambda : B arrow.r S$ extract the coefficient of $y^(k - 1)$ in the monic remainder, and consider
  #[#set math.equation(numbering: n => "(5.4)")
   $ Phi : B arrow.r B^or := "Hom"_S \( B \, S \) \, #h(2em) Phi \( a \) \( b \) = lambda \( a b \) . $ <eq:conductor-pairing>]
  This is $B$-linear for the action $\( a dot.op ell \) \( b \) = ell \( a b \)$ on $B^or$. In the basis $1 \, y \, dots.h \, y^(k - 1)$, its matrix has entry $lambda \( y^(i + j) \)$ in position $\( i \, j \)$. That entry is zero when $i + j < k - 1$, and is one when $i + j = k - 1$. Reversing the columns therefore gives a triangular matrix with diagonal entries one. Thus $Phi$ is an isomorphism in every characteristic. The trace pairing above was used over $Q$ to prove finiteness of $R$. This coefficient pairing supplies the self-duality over $S$ used below.
  The adjunction
  $ "Hom"_S \( R \, S \) tilde.eq "Hom"_B \( R \, "Hom"_S \( B \, S \) \) $
  sends $ell$ to the map $x mapsto \[ b mapsto ell \( b x \) \]$. Using $Phi$, it identifies $"Hom"_S \( R \, S \)$ with $"Hom"_B \( R \, B \)$. Every homomorphism in the latter module becomes a $B_Q$-linear endomorphism of $B_Q$, hence multiplication by some $a in B_Q$. It takes $R$ into $B$ exactly when $a R subset B$. Since $1 in R$, this forces $a in B$, and the possible multipliers are precisely $frak(c)$.
  This identification respects restriction to $B$: for a multiplier $a$, the corresponding functional restricts to $b mapsto lambda \( a b \) = Phi \( a \) \( b \)$. Hence restriction
  #[#set math.equation(numbering: n => "(5.5)")
   $ R^or = "Hom"_S \( R \, S \) arrow.r B^or quad upright("has image ") Phi \( frak(c) \) . $ <eq:conductor-dual-image>]
  To compute its colength, choose bases for the two free $S$-lattices in which the inclusion $B subset R$ has elementary divisors $pi^(n_1) \, dots.h \, pi^(n_k)$, where $pi$ is a uniformizer and the $n_i$ are nonnegative. The quotient $R \/ B$ has length $sum_i n_i$, and the restriction on dual lattices has the same elementary divisors. By (5.4) and (5.5), its cokernel is isomorphic to $B \/ frak(c)$. This proves
  $ "length"_S \( B \/ frak(c) \) = "length"_S \( R \/ B \) . $
  The inclusion $frak(c) subset J_0$ now gives (5.2). ◻
]

#thm([Proposition 5.2.])[
  #emph[For each curve $C = C_X$ and adjugate subscheme $Z$ constructed in Section 4, 
#[#set math.equation(numbering: n => "(5.6)")
 $ "length" Z lt.eq delta \( C \) . $ <eq:conductor-global-length>]

]
] <prop:conductor-length>

#proof[
  By Lemma 8, the projection $pi : C arrow.r bb(P)_K^1$ is finite and flat, with a distinct-root fiber. It is therefore generically separable. At a closed point $b$ of the base, take $S = cal(O)_(bb(P)^1 \, b)$ and trivialize $cal(O) \( 1 \)$. If $y$ is the resulting $s$-coordinate and $A_0$ represents $t D + u X$, the curve algebra is
  $ B = S \[ y \] \/ #scale(x: 120%, y: 120%)[\(] det \( y I + A_0 \) #scale(x: 120%, y: 120%)[\)] . $
  The stalk of $pi_(*) \( cal(O)_C \/ J \)$ is $B \/ J_0$, with $J_0$ as in Lemma 11. Its normalization $R$ gives the stalk $R \/ B$ of $pi_(*) \( nu_(*) cal(O)_(tilde(C)) \/ cal(O)_C \)$. Indeed, normalization commutes with this localization. Changes of trivialization multiply the adjugate generators by units, so these are the intrinsic ideals and quotient sheaves.
  Both quotient sheaves have finite support. At every closed point of the base, their finite-length $S$-modules have length equal to their $K$-dimension, because the residue field is $K$. Equivalently, each such length is the sum of the lengths at the curve points above that base point; no ramification factor enters. Summing (5.2) over $b$ therefore gives
  $ "length" Z = sum_b "length"_(cal(O)_(bb(P)^1 \, b)) \( B \/ J_0 \) lt.eq sum_b "length"_(cal(O)_(bb(P)^1 \, b)) \( R \/ B \) = delta \( C \) . $
  Only generic separability was needed. Nonreduced closed fibers and wild ramification are allowed by the coefficient pairing (5.4). ◻
]

In particular, Proposition 10 yields

#[#set math.equation(numbering: n => "(5.7)")
 $ nabla G_D \( X \) = 0 quad arrow.r.double quad delta \( C_X \) gt.eq T . $ <eq:conductor-gradient-defect>]

== 6 From curve defects to matrix codimension <sec:dimension>

The preceding sections show that a critical matrix of the coefficient polynomial produces a reduced plane curve with large normalization defect. We now count these matrices by separating the choice of the curve from the choice of a matrix that produces it.

#thm([Proposition 6.1.])[
  (Gradient codimension).  #emph[Let $K = overline(bb(F))_2$, let $k gt.eq 2$, and set 
$ q = ⌊frac(k - 1, 3)⌋ \, #h(2em) T = binom(q + 2, 2) . $

 For pairwise distinct $theta_1 \, dots.h \, theta_k in K$, put $D = "diag" \( theta_1 \, dots.h \, theta_k \)$ and 
$ G_D \( X \) = \[ s^q t^q \] "per"_k \( X + s I + t D \) \, #h(2em) X in "Mat"_k \( K \) . $

 Then 
#[#set math.equation(numbering: n => "(6.1)")
 $ dim { X in "Mat"_k \( K \) : nabla G_D \( X \) = 0 } lt.eq k^2 + k - T . $ <eq:gradient-dimension>]

]
] <prop:gradient-codimension>

For the proof, fix these parameters and write

$ Gamma_D = { X in "Mat"_k \( K \) : nabla G_D \( X \) = 0 } . $

Consider the morphism

#[#set math.equation(numbering: n => "(6.2)")
 $ f_D : "Mat"_k \( K \) arrow.r bb(P) H^0 \( bb(P)_K^2 \, cal(O) \( k \) \) \, #h(2em) X mapsto \[ F_X \] \, #h(2em) F_X = det \( s I + t D + u X \) . $ <eq:determinant-curve-map>]

The coefficient of $s^k$ is one, so a projective fiber fixes the polynomial $F_X$ itself and hence the embedded curve $C_X$. Every curve in the image is reduced by Lemma 8. For $X in Gamma_D$, Propositions 10 and 12 give

#[#set math.equation(numbering: n => "(6.3)")
 $ T lt.eq "length" Z lt.eq delta \( C_X \) . $ <eq:dimension-gradient-defect>]

We will bound the dimension of $f_D \( Gamma_D \)$ using this defect, then bound the fibers of $f_D$ by associating a finite subscheme of the fixed curve to each matrix in the fiber.

=== 6.1 Curves with large normalization defect <curves-with-large-normalization-defect>

Recall that, for a reduced curve $C$ with normalization $nu : tilde(C) arrow.r C$,

$ delta \( C \) = "length" \( nu_(*) cal(O)_(tilde(C)) \/ cal(O)_C \) . $

The normalization may be disconnected. We will keep track of its components explicitly when applying the dimension theorem for integral curves.

Over any algebraically closed field, let $b gt.eq 1$ and $0 lt.eq g lt.eq \( b - 1 \) \( b - 2 \) \/ 2$ be integers. The locus of integral plane curves of degree $b$ and normalization genus $g$ is locally closed and, when nonempty, has dimension $3 b + g - 1$ #cite(label("CHT2023")) Lemma 2.6, Proposition 2.7, and Remark 2.8. This is the cited theorem with surface $bb(P)^2$ and line bundle $cal(O) \( b \)$. The locus includes every integral curve of the stated genus: the surface has no singular points to exclude, and nodality is not a hypothesis.

#thm([Lemma 6.2.])[
  #emph[Let $K$ be an algebraically closed field, and let $k gt.eq 1$ and $T gt.eq 0$ be integers. In the degree-$k$ plane linear system over $K$, the locus of reduced curves satisfying $delta \( C \) gt.eq T$ is constructible. If nonempty, it has dimension at most 
$ frac(k \( k + 3 \), 2) - T . $

]
] <lem:severi-dimension>

#proof[
  Write $C = C_1 union dots.h.c union C_a$, where the integral components have degrees $b_i$ and normalization genera $g_i$. The Euler characteristics of the normalization and the curve are $a - sum_i g_i$ and $1 - p_a \( C \)$. The normalization exact sequence therefore gives
  $ delta \( C \) = p_a \( C \) - sum_(i = 1)^a g_i + a - 1 \, #h(2em) p_a \( C \) = frac(\( k - 1 \) \( k - 2 \), 2) . $
  In particular, the term $a - 1$ accounts for the disconnected normalization, and the identity includes the contribution of intersections between different components.
  For fixed degrees and genera, multiplying the equations of the components defines a morphism from the product of their integral curve loci to the degree-$k$ linear system. Restricting to distinct factors gives precisely the reduced curves of this type. The image is constructible, and its dimension is at most
  $ sum_(i = 1)^a \( 3 b_i + g_i - 1 \) & = 3 k + sum_(i = 1)^a g_i - a\
 & = frac(k \( k + 3 \), 2) - delta \( C \) . $
  There are only finitely many degree and genus types: $a lt.eq k$, $sum b_i = k$, and $0 lt.eq g_i lt.eq \( b_i - 1 \) \( b_i - 2 \) \/ 2$. The normalization identity determines $delta \( C \)$ from each type. The required locus is therefore a finite union of constructible images with the stated dimension bound. ◻
]

=== 6.2 A row subscheme determines a matrix <a-row-subscheme-determines-a-matrix>

Fix a curve $C$ in the image of $f_D$, and let $cal(F)_C = f_D^(- 1) \( \[ C \] \)$. Our remaining task is to bound this matrix fiber. For a critical matrix, its full-adjugate scheme $Z$ supplied the defect bound (6.3) on its curve. We now use a row obtained from the adjugate to distinguish all matrices in the fixed fiber $cal(F)_C$.

Put $N = k \( k - 1 \) \/ 2$. For $X in cal(F)_C$, define

$ R_X = \( 1 \, dots.h \, 1 \) "adj" \( s I + t D + u X \) \, $

and define an ideal and its subscheme on the fixed curve by

#[#set math.equation(numbering: n => "(6.4)")
 $ J'_X = "im" #scale(x: 120%, y: 120%)[\(] cal(O)_C \( 1 - k \)^k arrow.r^(med R_X med) cal(O)_C #scale(x: 120%, y: 120%)[\)] \, #h(2em) Z'_X = V_C \( J'_X \) . $ <eq:row-adjugate-ideal>]

Thus $J'_X$ is locally generated by the row entries after trivializing their common twist. We use the prime to distinguish this row subscheme from the full-adjugate scheme $Z$.

After transposition, the equations $R_X = 0$ say that an adjugate matrix annihilates a fixed vector. Adams, Harnad and Hurtubise use equations of this form for spectral divisors in a generic complex setting #cite(label("AdamsHarnadHurtubise1993")) Section 1b, equation (1.29) in arXiv:hep-th/9210089v1. Here we prove the uniform finite length of $Z'_X$ directly. The common boundary frame then makes this subscheme determine the matrix uniquely on a fixed embedded curve.

#thm([Lemma 6.3.])[
  (The row subscheme).  #emph[For each $X in cal(F)_C$, the scheme $Z'_X$ is finite of length $N$. If $X \, X' in cal(F)_C$ satisfy $Z'_X = Z'_(X')$ as subschemes of $C$, then $X = X'$.]
] <lem:row-adjugate-scheme>

#proof[
  The projection $pi : C arrow.r bb(P)_(t : u)^1$ and the bundle
  $ cal(E) = pi_(*) cal(O)_C \( k - 1 \) = xor.big_(j = 0)^(k - 1) cal(O) \( k - 1 - j \) $
  are fixed throughout $cal(F)_C$. The entries of $R_X$ give a map $rho_X : cal(O)^k arrow.r cal(E)$ on $bb(P)^1$. At $b_0 = \[ 1 : 0 \]$, trivialize by $t$ and put $y = s \/ t$. For every $X$, the map on this fiber sends the $i$-th standard basis vector to
  #[#set math.equation(numbering: n => "(6.5)")
   $ h_i \( y \) = product_(j eq.not i) \( y + theta_j \) quad upright("in") quad K \[ y \] #scale(x: 120%, y: 120%)[\/] product_j \( y + theta_j \) . $ <eq:row-boundary-frame>]
  Evaluation at the distinct roots $- theta_i$ shows that these $k$ classes form a basis. In particular, all the maps $rho_X$ restrict to the same isomorphism at $b_0$. Each $rho_X$ is therefore generically full rank and injective as a sheaf map. Its cokernel is torsion of length
  #[#set math.equation(numbering: n => "(6.6)")
   $ "length" \( "coker" rho_X \) = deg cal(E) = sum_(j = 0)^(k - 1) \( k - 1 - j \) = N . $ <eq:row-adjugate-length>]
  On $C$, the adjugate identity gives
  $ s R_X = - R_X \( t D + u X \) . $
  On either affine base chart, the span of the row entries over the base ring is consequently stable under the affine $s$-coordinate. This coordinate generates the finite curve algebra over the base, so the span is already the ideal generated over the curve algebra, with its twist. Hence
  $ "im" rho_X = pi_(*) \( J'_X \( k - 1 \) \) . $
  Finite pushforward is exact, so
  $ "coker" rho_X = pi_(*) \( cal(O)_(Z'_X) \( k - 1 \) \) . $
  This pushforward has finite support, and $pi$ is finite, so $cal(O)_(Z'_X)$ has finite support as well. Twisting preserves length, as does finite pushforward over the algebraically closed ground field. Equation (6.6) thus proves that $Z'_X$ is finite of length $N$.
  Suppose now that $Z'_X = Z'_(X')$. Their ideal sheaves on the fixed curve are equal, so $rho_X$ and $rho_(X')$ have the same image inside the same bundle $cal(E)$. Since both maps are injective, there is an automorphism $U$ of $cal(O)^k$ with
  $ rho_(X') = rho_X U . $
  Every such automorphism is an invertible constant matrix. Restricting this equality to $b_0$, where both maps are the same isomorphism (6.5), gives $U = I$ and hence $rho_(X') = rho_X$.
  Multiplication by $s$ maps $cal(E)$ to $cal(E) \( 1 \)$, and the row identity says
  $ s rho_X = - rho_X \( 1 \) \( t D + u X \) . $
  The analogous equation for $X'$ now gives $rho_X \( 1 \) u \( X - X' \) = 0$. The map $rho_X \( 1 \)$ is injective, so $u \( X - X' \) = 0$ as a matrix of sections of $cal(O) \( 1 \)$. Since $u$ is a nonzero section and $X - X'$ is constant, this forces $X = X'$. The same argument works after extending the ground field, so the uniqueness statement also holds for geometric points. ◻
]

The lemma reduces the fiber count to the possible length-$N$ subschemes of $C$. We next bound the dimension of their Hilbert scheme in a form valid in characteristic two.

=== 6.3 Finite subschemes of a plane curve <finite-subschemes-of-a-plane-curve>

For a punctual quotient of $cal(O)$, Baranovsky’s construction of punctual Quot schemes over $bb(C)$ uses commuting nilpotent operators and a cyclic vector after choosing a basis #cite(label("Baranovsky1998")) Section 2, Lemma 2.2. For the classical punctual-plane Hilbert dimension bound in arbitrary characteristic, see #cite(label("Premet2003")) Corollary 4.1. The centralizer count below supplies the dimension bound needed here in every characteristic.

#thm([Lemma 6.4.])[
  #emph[Let $C subset bb(P)_K^2$ be a reduced curve over an algebraically closed field $K$, and let $N gt.eq 0$. Then 
$ dim "Hilb"^N \( C \) lt.eq N . $

]
] <lem:hilbert-curve-dimension>

#proof[
  Fix a point of the affine plane and an integer $ell gt.eq 1$, and translate the point to the origin. Inside $"Hilb"^ell \( bb(A)_K^2 \)$, let $P_ell$ be the closed locus of quotients on which $\( x \, y \)^ell$ acts by zero. Its geometric points are precisely the punctual subschemes supported at the origin: in a length-$ell$ local algebra, the $ell$-th power of the maximal ideal is zero.
  The frame bundle of the tautological quotient algebra over $P_ell$ has dimension $dim P_ell + ell^2$. In a frame, multiplication by the two coordinates gives commuting nilpotent matrices $A \, B$ of size $ell$, and the unit gives a cyclic vector $v in K^ell$, meaning $K \[ A \, B \] v = K^ell$. These data recover the ideal as
  $ { f in K \[ x \, y \] : f \( A \, B \) v = 0 } \, $
  and recover its frame. Thus the resulting morphism from the frame bundle to the finite-type scheme of such triples is injective on geometric points. Its geometric fibers have dimension zero, which suffices for a dimension upper bound.
  There are finitely many nilpotent Jordan types for $A$. If its linear centralizer has dimension $j$, then its group centralizer is the open set of invertible elements in that vector space. The conjugacy orbit of $A$ therefore has dimension $ell^2 - j$. Within its centralizer, the nilpotent choices of $B$ have dimension at most $j - 1$: they satisfy $det B = 0$, whereas the determinant is one at the identity matrix in the same centralizer. This argument works in every characteristic. Consequently the commuting nilpotent pairs have dimension at most $ell^2 - 1$. The choice of the cyclic vector adds at most $ell$ parameters, so
  $ dim P_ell + ell^2 lt.eq ell^2 + ell - 1 \, #h(2em) dim P_ell lt.eq ell - 1 . $
  Fix $p in C$ and choose an affine plane chart around it, translated so that $p$ is the origin. Inside the Hilbert scheme of this affine part of $C$, impose the same condition that the $ell$-th power of the maximal ideal of $p$ acts by zero. The resulting locus is a closed subscheme of $P_ell$, and its geometric points are exactly the length-$ell$ subschemes of $C$ supported at $p$. Its dimension is therefore at most $ell - 1$, including when $p$ is singular. Fix a positive length type $ell_1 + dots.h.c + ell_a = N$. Consider ordered distinct points $\( p_1 \, dots.h \, p_a \)$ of $C$ together with subschemes of lengths $ell_i$ supported at $p_i$. This incidence is algebraic: containment in the $ell_i$-th infinitesimal neighborhood of the moving point can be imposed using the $ell_i$-th power of the diagonal ideal on $C times C$. The support parameters have dimension at most $a$, and the fibers have dimension at most $sum_i \( ell_i - 1 \) = N - a$. The incidence therefore has dimension at most $N$. Taking disjoint unions of its subschemes maps it to $"Hilb"^N \( C \)$. Finitely many length types cover all geometric points of this Hilbert scheme, proving the claim. The case $N = 0$ is immediate. ◻
]

=== 6.4 The matrix fibers and the gradient locus <the-matrix-fibers-and-the-gradient-locus>

We now use the universal family of length-$N$ subschemes to compare the matrix fiber with $"Hilb"^N \( C \)$.

#thm([Proposition 6.5.])[
  (Dimension of a matrix fiber).  #emph[For the morphism $f_D$ in (6.2), every fiber has dimension at most $N = k \( k - 1 \) \/ 2$.]
] <prop:matrix-fiber>

#proof[
  Fix a curve $C$ in the image and its fiber $cal(F)_C$. Form
  $ cal(I)_C = { \( X \, Z' \) in cal(F)_C times "Hilb"^N \( C \) : R_X \|_(Z') = 0 } . $
  This is a closed incidence. Indeed, restrict the row entries to the universal finite flat subscheme over the Hilbert scheme and push forward their common twist. This produces sections of a vector bundle on the product, whose zero locus is $cal(I)_C$.
  Every matrix $X$ occurs in the incidence with its subscheme $Z'_X$. Conversely, row vanishing on $Z'$ means $J'_X subset I_(Z')$, so $Z' subset Z'_X$. The scheme $Z'$ has length $N$ by its membership in the Hilbert scheme, and $Z'_X$ has length $N$ by Lemma 15. Therefore they are equal. The same lemma shows that each fiber of $cal(I)_C$ over $"Hilb"^N \( C \)$ has at most one geometric point. Such a finite-type fiber has dimension zero when nonempty, even if it is nonreduced. Projection to $cal(F)_C$ is surjective on geometric points, so
  $ dim cal(F)_C lt.eq dim cal(I)_C lt.eq dim "Hilb"^N \( C \) lt.eq N \, $
  where the last inequality is Lemma 16. ◻
]

#proof[
  By (6.3), every curve in $f_D \( Gamma_D \)$ has normalization defect at least $T$. Lemma 14 bounds the dimension of this constructible image by $k \( k + 3 \) \/ 2 - T$. Each fiber of the restriction of $f_D$ to $Gamma_D$ is contained in a full matrix fiber and has dimension at most $N$ by Proposition 17. Consequently
  $ dim Gamma_D lt.eq frac(k \( k + 3 \), 2) - T + frac(k \( k - 1 \), 2) = k^2 + k - T \, $
  as asserted. ◻
]

== 7 Characteristic transfer and smooth linear sections <sec:transfer>

Proposition 13 bounds an affine gradient locus in characteristic two. We now transfer that bound to complex parameters, then choose a linear section on which the coefficient polynomial defines a smooth projective hypersurface. The final proof will combine the resulting affine permanent projection with Theorem 4 to obtain the cubic lower bound.

=== 7.1 Transferring the gradient bound <transferring-the-gradient-bound>

The proper family used for specialization is the projective zero scheme of the partial derivatives. In characteristic two this scheme need not be the singular scheme of the hypersurface itself. After passing to characteristic zero, Euler’s identity will identify the two.

#thm([Lemma 7.1.])[
  (Specialization of a gradient locus).  #emph[Let 
$ F \( theta \, x \) in bb(Z) \[ theta_1 \, dots.h \, theta_a \] \[ x_1 \, dots.h \, x_v \] $

 be homogeneous of degree $r gt.eq 2$ in $x$, where $v gt.eq 2$, and let $1 lt.eq delta lt.eq v$ be an integer. Suppose some $macron(theta) in overline(bb(F))_2^(thin a)$ satisfies 
$ dim V_(bb(A)_(overline(bb(F))_2)^v) #scale(x: 120%, y: 120%)[\(] partial_(x_1) F_(macron(theta)) \, dots.h \, partial_(x_v) F_(macron(theta)) #scale(x: 120%, y: 120%)[\)] lt.eq v - delta . $

 Then there is a nonempty Zariski open subset $U subset bb(A)_(bb(C))^a$ such that, for every $theta in U$, the polynomial $F_theta$ is nonzero and 
#[#set math.equation(numbering: n => "(7.1)")
 $ dim "Sing" V_(bb(P)_(bb(C))^(v - 1)) \( F_theta \) lt.eq v - 1 - delta . $ <eq:transfer-singular-bound>]

 We use dimension $- 1$ for the empty projective scheme.]
] <lem:characteristic-transfer>

#proof[
  Put $R = bb(Z) \[ theta_1 \, dots.h \, theta_a \]$ and $S = "Spec" R$. The homogeneous ideal
  $ I = \( partial_(x_1) F \, dots.h \, partial_(x_v) F \) subset R \[ x_1 \, dots.h \, x_v \] $
  defines a closed subscheme
  #[#set math.equation(numbering: n => "(7.2)")
   $ cal(Z) = "Proj" \( R \[ x \] \/ I \) subset bb(P)_S^(v - 1) . $ <eq:transfer-projective-family>]
  Its structural morphism $pi : cal(Z) arrow.r S$ is projective, hence proper. Differentiation commutes with specialization, and the closed projective subscheme in (7.2) commutes with base change. Thus its geometric fibers are exactly the projective gradient-zero schemes of the specialized polynomials.
  The derivatives have positive homogeneous degree $r - 1$. At $macron(theta)$, their affine zero set is a cone. If its projectivization is nonempty, its dimension is one less than that of the cone: on each projective coordinate chart the corresponding punctured cone is a product with $bb(G)_m$. If the projectivization is empty, the same upper bound holds with our convention. Hence
  $ dim cal(Z)_(macron(theta)) lt.eq v - 1 - delta . $
  Let $s in S$ be the image of the geometric point $macron(theta)$. The dimension of a scheme of finite type over a field is unchanged by extending that field, so the same bound holds for $cal(Z)_s$. If $v - 1 - delta gt.eq 0$, upper semicontinuity of fiber dimension for the proper morphism $pi$ gives an open neighborhood $U_S$ of $s$ on which this bound holds #cite(label("StacksProject")) Tag 0D4I. If $v - 1 - delta = - 1$, the fiber $cal(Z)_s$ is empty. Properness makes $pi \( cal(Z) \)$ closed, so $U_S = S \\ pi \( cal(Z) \)$ is an open neighborhood of $s$ whose fibers are all empty. Thus the required neighborhood exists in every case, without a flatness assumption.
  Since $S$ is integral, $U_S$ contains its generic point, which has characteristic zero. To see explicitly that the open has complex points, choose a nonempty principal open $D \( h \) subset U_S$, with $0 eq.not h in R$. The polynomial $h$ remains nonzero over $bb(C)$, so $D \( h \)_(bb(C))$ is nonempty. We may take $U = \( U_S \)_(bb(C))$. The same invariance under field extension shows that every complex fiber over $U$ satisfies
  #[#set math.equation(numbering: n => "(7.3)")
   $ dim V_(bb(P)_(bb(C))^(v - 1)) \( nabla F_theta \) lt.eq v - 1 - delta . $ <eq:transfer-complex-gradient>]
  Since $delta > 0$, $F_theta$ cannot be the zero polynomial: otherwise the left side of (7.3) would be $v - 1$. Over $bb(C)$, Euler’s identity gives
  $ r F_theta = sum_(i = 1)^v x_i partial_(x_i) F_theta . $
  Thus the ideals $\( F_theta \, nabla F_theta \)$ and $\( nabla F_theta \)$ agree. These equations describe the actual projective hypersurface singular scheme. Indeed, on the chart $x_i eq.not 0$, put $z_j = x_j \/ x_i$ for $j eq.not i$ and $f_i = F_theta \/ x_i^r$. The hypersurface has equation $f_i = 0$ and cotangent presentation
  $ cal(O)_(V \( f_i \)) arrow.r^(thin d f_i thin) cal(O)_(V \( f_i \))^(thin v - 1) arrow.r Omega_(V \( f_i \) \/ bb(C)) arrow.r 0 . $
  Its $\( v - 2 \)$-nd Fitting ideal is generated by the local partial derivatives of $f_i$. On $f_i = 0$, these are the homogeneous gradient equations in this chart: Euler’s identity supplies the derivative in the omitted $x_i$ direction. The Jacobian criterion therefore identifies this scheme with the singular scheme. Equation (7.3) proves (7.1). ◻
]

All coefficients in (7.2) are integral; in particular, the construction does not invert $2$ or $r$. Division by $r$ occurs only in characteristic zero. In applying the lemma to $G_D$, we use its coefficient formula (3.1), before multiplying by the projection scalar $a_0$, which vanishes in characteristic two.

=== 7.2 A smooth section of the required dimension <a-smooth-section-of-the-required-dimension>

Avoiding the singular locus of a hypersurface is one condition on a linear section. The section must also meet its smooth locus transversely. The following incidence calculation establishes both conditions and keeps track of the projective dimension.

#thm([Proposition 7.2.])[
  (Smooth linear section).  #emph[Let $F$ be a nonzero homogeneous complex polynomial of degree $r gt.eq 2$ on a vector space $V$ of dimension $v$. Set $Y = V_(bb(P) \( V \)) \( F \)$, and suppose 
$ dim "Sing" Y lt.eq v - 1 - delta $

 for an integer $delta gt.eq 1$. If $2 lt.eq d < v$ and $d - 1 < delta$, then a nonempty Zariski open subset of $"Gr" \( d \, V \)$ consists of subspaces $H$ for which $F \|_H$ is nonzero and defines a smooth degree-$r$ hypersurface in $bb(P) \( H \)$.]
] <prop:smooth-slice>

#proof[
  Write $cal(G) = "Gr" \( d \, V \)$, so $dim cal(G) = d \( v - d \)$. A point of $cal(G)$ is a vector subspace of dimension $d$, whose projectivization has dimension $d - 1$.
  First consider pairs $\( p \, H \)$ with $p in "Sing" Y$ and $p in bb(P) \( H \)$. For fixed $p$, the choices of $H$ form $"Gr" \( d - 1 \, V \/ p \)$, of dimension $\( d - 1 \) \( v - d \)$; here $p$ also denotes its line in $V$. This incidence has dimension at most
  $ \( v - 1 - delta \) + \( d - 1 \) \( v - d \) = dim cal(G) + d - 1 - delta < dim cal(G) . $
  Its projection to $cal(G)$ is closed because $"Sing" Y$ is projective. It is a proper subset, so outside it the section avoids every singular point of $Y$.
  For $p = \[ x \] in Y_(upright("reg"))$, the nonzero differential $d F_x$ has a kernel $K_p subset V$ of dimension $v - 1$. Euler’s identity at $F \( x \) = 0$ shows that $p subset K_p$. If $p subset H$, the restricted equation is singular at $p$ exactly when
  $ p subset H subset K_p . $
  The homogeneous partial derivatives define the Gauss morphism $Y_(upright("reg")) arrow.r bb(P) \( V^(*) \)$, $p = \[ x \] mapsto \[ d F_x \]$. The pairs above form a closed incidence in $Y_(upright("reg")) times cal(G)$: they are the inverse image of the closed flag incidence $p subset H subset ker ell$ under $\( p \, H \) mapsto \( p \, H \, \[ d F_x \] \)$. For fixed $p$, these subspaces form $"Gr" \( d - 1 \, K_p \/ p \)$, of dimension $\( d - 1 \) \( v - d - 1 \)$. Since $dim Y_(upright("reg")) lt.eq v - 2$, this tangency incidence has dimension at most
  $ \( v - 2 \) + \( d - 1 \) \( v - d - 1 \) = d \( v - d \) - 1 . $
  Its image in $cal(G)$ is constructible, and the closure of that image has dimension at most $dim cal(G) - 1$. Removing this closure and the preceding singular-point incidence image leaves a nonempty open subset of the irreducible Grassmannian.
  For $H$ in that open, every zero of $F \|_H$ has nonzero differential on $H$. The restriction cannot vanish identically: if it did, every point $p in bb(P) \( H \)$ would lie in $Y$, singular avoidance would put it in $Y_(upright("reg"))$, and differentiation of the zero restriction would force $H subset K_p$, contrary to the tangency exclusion.
  Thus $F \|_H$ is a nonzero homogeneous polynomial of degree $r$. Since $d gt.eq 2$, it defines a nonempty hypersurface of dimension $d - 2$ in $bb(P) \( H \)$. The nonzero differentials prove its smoothness. ◻
]

=== 7.3 A smooth form obtained from the permanent <a-smooth-form-obtained-from-the-permanent>

We now apply the two geometric results to the coefficient polynomial. The resulting form has linear degree and quadratically many variables, and is an affine projection of a permanent of linear size.

#thm([Proposition 7.3.])[
  (A smooth form obtained from the permanent).  #emph[Let $k gt.eq 128$ be an integer, and put 
$ q = ⌊frac(k - 1, 3)⌋ \, #h(2em) r = k - 2 q \, #h(2em) d = ⌊k^2 / 100⌋ . $

 There is a nonzero homogeneous polynomial $G in bb(C) \[ x_1 \, dots.h \, x_d \]$ of degree $r$ such that its zero set in $bb(P)_(bb(C))^(d - 1)$ is smooth and, for every integer $m gt.eq 11 k - 2 q$, there is an affine map $Phi_m : bb(C)^d arrow.r "Mat"_m \( bb(C) \)$ satisfying 
$ G = "per"_m compose Phi_m . $

 The parameters also satisfy 
$ r - 1 gt.eq k / 4 \, #h(2em) d - 1 gt.eq k^2 / 200 . $

]
] <prop:smooth-projection>

#proof[
  Set $T = binom(q + 2, 2)$. Since $k gt.eq 128$,
  $ q gt.eq frac(k - 4, 3) gt.eq k / 4 \, #h(2em) T gt.eq q^2 / 2 gt.eq k^2 / 32 . $
  Consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ Delta := T - k gt.eq k^2 / 32 - k gt.eq k^2 / 64 > 0 . $ <eq:transfer-codimension-size>]
  Also $T lt.eq \( k + 2 \) \( k + 5 \) \/ 18 < k^2$ for these $k$, so $1 lt.eq Delta lt.eq k^2$.
  Choose pairwise distinct $macron(theta)_1 \, dots.h \, macron(theta)_k in overline(bb(F))_2$ and put $macron(D) = "diag" \( macron(theta)_1 \, dots.h \, macron(theta)_k \)$. Proposition 13 gives
  $ dim V_(bb(A)_(overline(bb(F))_2)^(k^2)) \( nabla G_(macron(D)) \) lt.eq k^2 + k - T = k^2 - Delta . $
  The coefficient formula (3.1), with the $theta_i$ treated as indeterminates, is integral in these parameters and homogeneous of degree $r$ in the $k^2$ matrix variables. Moreover,
  $ r - 1 = k - 2 q - 1 gt.eq frac(k - 1, 3) gt.eq k / 4 \, $
  so $r gt.eq 2$. Lemma 18 supplies a nonempty open subset $U subset bb(A)_(bb(C))^k$. Choose $theta = \( theta_1 \, dots.h \, theta_k \) in U \( bb(C) \)$ and put $D = "diag" \( theta_1 \, dots.h \, theta_k \)$. Then $G_D eq.not 0$ and
  $ dim "Sing" V_(bb(P)_(bb(C))^(k^2 - 1)) \( G_D \) lt.eq k^2 - 1 - Delta . $
  The complex coefficient projection permits arbitrary diagonal entries for this $D$.
  For $d = floor.l k^2 \/ 100 floor.r$, we have $2 lt.eq d < k^2$, and (7.4) gives
  $ d - 1 < k^2 / 100 < k^2 / 64 lt.eq Delta . $
  Proposition 19 therefore supplies a subspace $H subset "Mat"_k \( bb(C) \)$ of dimension $d$ such that $G_D \|_H$ is nonzero and defines a smooth degree-$r$ hypersurface in $bb(P) \( H \)$. Choose a linear isomorphism $Lambda : bb(C)^d arrow.r H$ and set $G = G_D compose Lambda$. This gives the asserted smooth form. The remaining scale estimate is
  $ d - 1 gt.eq k^2 / 100 - 2 gt.eq k^2 / 200 \, $
  where the last inequality holds for $k gt.eq 20$.
  Finally, $0 lt.eq 3 q lt.eq k - 1$, so $0 lt.eq q lt.eq floor.l k \/ 2 floor.r$. For each integer $m gt.eq 11 k - 2 q$, Proposition 5 gives a matrix $A_m \( X \)$ of affine-linear forms with
  $ "per"_m \( A_m \( X \) \) = a_0 G_D \( X \) \, #h(2em) a_0 eq.not 0 . $
  Compose $A_m$ with $Lambda$ and multiply its first row by $a_0^(- 1)$. The resulting affine map $Phi_m : bb(C)^d arrow.r "Mat"_m \( bb(C) \)$ satisfies $"per"_m compose Phi_m = G$, as required. ◻
]

== 8 Counting polars of a smooth hypersurface <sec:polar>

We now prove Theorem 4. A smooth degree-$r$ hypersurface in $bb(P)^(d - 1)$ supplies $r \( r - 1 \)^(d - 2)$ simple intersections with first polars. These points persist for one sufficiently close affine determinant. Right and left kernel variables then express each selected intersection by bilinear equations, whose multidegrees give the numerical comparison stated in Section 2. The determinant kernel-incidence count and its Schur-complement reduction build on #cite(label("SheshadriBorder2026")) Theorem 3 and Section 3.1. We give the argument needed here for finitely many simple polar intersections, including unrestricted affine limits and possible excess components of the incidence.

For a constant vector $w in bb(C)^N$, write

$ partial_w F = sum_(j = 1)^N w_j frac(partial F, partial x_j) . $

We call this an ambient first polar: after restricting to an affine slice, the direction $w$ need not be tangent to the slice. A common zero of $s$ equations in $s$ local coordinates is #emph[simple] if its full Jacobian is invertible.

=== 8.1 Simple polar intersections <simple-polar-intersections>

The numerical count below is the classical top polar degree of a smooth hypersurface #cite(label("Piene1978")) Corollary 3.7. We give the transversality argument to retain the individual simple points needed in the limit. General-transversality principles of this kind are developed in #cite(label("Kleiman1974")) Corollary 5; the argument below works directly over $bb(C)$ with the incidence of polar directions.

#thm([Lemma 8.1.])[
  #emph[Let $r \, d gt.eq 2$, and let $G in bb(C) \[ x_1 \, dots.h \, x_d \]$ be homogeneous of degree $r$. Suppose that $Y = V \( G \) subset bb(P)^(d - 1)$ is a smooth hypersurface. There are constant directions $w_1 \, dots.h \, w_(d - 2) in bb(C)^d$ for which 
#[#set math.equation(numbering: n => "(8.1)")
 $ G = 0 \, #h(2em) partial_(w_i) G = 0 quad \( 1 lt.eq i lt.eq d - 2 \) $ <polar:projective-certificate>]

 has exactly $mu = r \( r - 1 \)^(d - 2)$ distinct simple projective solutions. There is a linear form $L_0$ nonzero at every one of these points.]
] <polar:simple-points>

#proof[
  The sections $partial_w G$ of $cal(O)_Y \( r - 1 \)$ have no common zero on $Y$: otherwise all partial derivatives of $G$ would vanish at a point of the smooth hypersurface. We spell out why general choices give simple points. If $d = 2$, the smooth degree-$r$ hypersurface in $bb(P)^1$ already consists of $r$ distinct points, and there are no polar equations. Assume $d gt.eq 3$.
  Put $cal(P) = \( bb(C)^d \)^(d - 2)$ and consider
  $ cal(I) = { \( x \, w_1 \, dots.h \, w_(d - 2) \) in Y times cal(P) : partial_(w_i) G \( x \) = 0 upright(" for every ") i } . $
  For each $x$, the equation in each separate $w_i$ block is a nonzero linear equation. Thus $cal(I)$ is the total space of a vector bundle of rank $\( d - 1 \) \( d - 2 \)$ over $Y$. In particular it is smooth, and $dim cal(I) = d \( d - 2 \) = dim cal(P)$. The incidence is closed in $Y times cal(P)$, so its projection to $cal(P)$ is proper because $Y$ is projective. It is surjective: $G$ and any $d - 2$ chosen polars are $d - 1$ positive-degree homogeneous equations in $d$ variables, so the projective dimension theorem gives a common projective zero.
  Characteristic-zero generic smoothness makes the generic fiber of each dominating component smooth. Remove the proper images of the non-dominating components and of the locus where the projection is not smooth. Properness makes these images closed, and generic smoothness ensures that they omit the generic point of $cal(P)$. The resulting nonempty open subset has smooth zero-dimensional fibers. Each such fiber is a finite set of reduced points. At each point the differentials of the polar sections on $Y$ are independent. Since $d G eq.not 0$ in local projective coordinates, the full system (8.1) is simple there.
  This is a proper intersection of hypersurfaces of degrees $r \, r - 1 \, dots.h \, r - 1$ in $bb(P)^(d - 1)$. Projective Bézout therefore gives exactly $r \( r - 1 \)^(d - 2)$ points, each of multiplicity one. Finally, the linear forms vanishing at at least one of these finitely many points form a finite union of proper hyperplanes in $\( bb(C)^d \)^(*)$. Choose $L_0$ outside that union. ◻
]

=== 8.2 A count that permits excess components <a-count-that-permits-excess-components>

The kernel equations below need not meet properly everywhere, so we count only their selected simple zeros. The coefficient in the next lemma is the multihomogeneous Bézout number. Its standard specialization bound controls nonsingular isolated zeros even when other components are present #cite(label("Wampler1996")) Sections 3–3.2. We give a direct proof of the bilinear case needed here.

#thm([Lemma 8.2.])[
  #emph[Let $Y = product_(j = 1)^s bb(P)^(a_j)$, where $a_j gt.eq 0$ and $M = sum_j a_j gt.eq 1$. For each $1 lt.eq ell lt.eq M$, let $F_ell$ be a multihomogeneous polynomial of degree one in two distinct coordinate groups, indexed by $u_ell \, v_ell$, and degree zero in the other groups. Any finite collection of distinct simple common zeros of these equations has size at most 
#[#set math.equation(numbering: n => "(8.2)")
 $ \[ H_1^(a_1) dots.h.c H_s^(a_s) \] product_(ell = 1)^M \( H_(u_ell) + H_(v_ell) \) . $ <polar:product-coefficient>]

 Other zeros and components of any dimension are allowed.]
] <polar:product-count>

#proof[
  First construct a system with the displayed number of zeros, all simple. Give each occurrence of a coordinate group in an equation a different label. On $bb(P)^(a_j)$ choose the labeled linear forms so that every subfamily of at most $a_j + 1$ coefficient vectors is independent. In coordinates $\[ z_0 : dots.h.c : z_(a_j) \]$, forms
  $ z_0 + t z_1 + dots.h.c + t^(a_j) z_(a_j) $
  with distinct values of $t$ have this property by the Vandermonde determinant. When $a_j = 0$, use the nowhere-zero form $z_0$ on $bb(P)^0$. Replace equation $ell$ by $Q_ell = L_ell R_ell$, using its two labeled forms on factors $u_ell$ and $v_ell$.
  At a common zero of all $Q_ell$, let $b_j$ count the labeled forms vanishing in factor $j$. General position implies $b_j lt.eq a_j$. Each of the $M$ equations requires at least one vanishing form, and no label occurs in two equations. Hence
  $ M lt.eq sum_j b_j lt.eq sum_j a_j = M . $
  Exactly one labeled factor vanishes in each equation, and exactly $a_j$ forms vanish in factor $j$. Conversely, choosing one factor of each equation, with exactly $a_j$ choices assigned to factor $j$, determines one point of $Y$: the selected $a_j$ hyperplanes in that factor meet in one point. No additional labeled form vanishes there, because $a_j + 1$ such hyperplanes have empty intersection. Different choices therefore give different points. Expanding the product in (8.2) counts exactly these choices; denote that coefficient by $B$.
  Every comparison zero is simple. In equation $ell$, one factor is zero and the other is nonzero, so its differential is a nonzero multiple of the selected linear form’s differential. In each projective factor the selected hyperplanes have independent differentials. The full Jacobian is therefore invertible. This construction also covers $B = 0$, when the comparison system has no common zero.
  It remains to compare an arbitrary system with this one. Interpolate by
  $ F_(ell \, t) = \( 1 - t \) Q_ell + t F_ell #h(2em) \( t in bb(C) \) . $
  The common-zero incidence is closed in $Y times bb(C)$. On it, rank deficiency of the differential in the $Y$ directions is a closed algebraic condition. Indeed, it is given by maximal Jacobian minors in each projective chart. Coordinate changes act invertibly on the differential, and changing a trivialization multiplies an equation by a unit. At a common zero the derivative of that unit contributes zero, so the rank condition is independent of the chart.
  Since $Y$ is projective, the parameter values having a rank-deficient common zero form a Zariski-closed subset $cal(B) subset bb(C)$. The comparison system shows that $0 in.not cal(B)$, so $cal(B)$ is finite. For $t in.not cal(B)$, all zeros are isolated by the implicit function theorem. Their set is closed in the compact space $Y$, hence finite. The number of zeros is locally constant on $bb(C) \\ cal(B)$: the implicit function theorem preserves each zero in a disjoint neighborhood, and compactness prevents additional zeros from appearing outside those neighborhoods as the parameter varies. The same argument covers an empty fiber. Because the complement of a finite subset of $bb(C)$ is connected, this number is always the number at $t = 0$, namely $B$.
  Finally, choose any finite set of simple zeros at $t = 1$. They persist in disjoint neighborhoods for parameters sufficiently close to $1$. Such parameters can be chosen outside $cal(B)$, where the total count is $B$. The selected set has at most $B$ members. This conclusion does not assign multiplicities to, or impose conditions on, any excess components at $t = 1$. ◻
]

=== 8.3 Ambient polars of affine determinant limits <ambient-polars-of-affine-determinant-limits>

We next apply the product count to an arbitrary affine determinant approximation. The directions in the statement remain ambient directions; this permits us to use a projective polar certificate on an affine chart.

#thm([Proposition 8.3.])[
  #emph[Let $N \, n \, mu gt.eq 1$ and $h gt.eq 0$ be integers. Suppose that $P in bb(C) \[ x_1 \, dots.h \, x_N \]$ is a coefficientwise limit of determinants of $n times n$ matrices of affine-linear forms. Let $Psi : bb(C)^(h + 1) arrow.r bb(C)^N$ be an affine map and $w_1 \, dots.h \, w_h in bb(C)^N$ constant directions. If 
#[#set math.equation(numbering: n => "(8.3)")
 $ P \( Psi \( xi \) \) = 0 \, #h(2em) \( partial_(w_i) P \) \( Psi \( xi \) \) = 0 quad \( 1 lt.eq i lt.eq h \) $ <polar:affine-certificate>]

 has at least $mu$ distinct simple zeros, then 
#[#set math.equation(numbering: n => "(8.4)")
 $ mu & lt.eq \[ H^(h + 1) U^(n - 1) V^(n - 1) \] \( H + U \)^n \( H + V \)^(n - 1) \( U + V \)^h\
 & lt.eq 2^h binom(2 n - 1, h + 1) \,\
n & gt.eq frac(h + 1, 4 e) mu^(1 \/ \( h + 1 \)) . $ <polar:ambient-coefficient>]

 The binomial coefficient is zero if $h + 1 > 2 n - 1$.]
] <polar:ambient-bound>

#proof[
  #emph[Choose one sufficiently close determinant.] Fix $mu$ distinct simple zeros of (8.3). All output polynomials lie in the finite-dimensional coefficient space of degree at most $n$. With $Psi$ and the $w_i$ fixed, the map
  $ \( Q \, xi \) mapsto #scale(x: 120%, y: 120%)[\(] Q \( Psi \( xi \) \) \, \( partial_(w_1) Q \) \( Psi \( xi \) \) \, dots.h \, \( partial_(w_h) Q \) \( Psi \( xi \) \) #scale(x: 120%, y: 120%)[\)] $
  is polynomial in the coefficients of $Q$ and the coordinates of $xi$. At every selected zero for $P$, its $xi$-Jacobian is invertible. The complex implicit function theorem preserves that simple zero for all sufficiently close coefficient vectors. Take disjoint neighborhoods of the $mu$ zeros and intersect their finitely many coefficient neighborhoods. There is an actual determinant in the resulting neighborhood,
  #[#set math.equation(numbering: n => "(8.5)")
   $ Q \( x \) = det A \( x \) \, #h(2em) A \( x \) = A_0 + sum_(j = 1)^N x_j A_j \, #h(2em) A_j in "Mat"_n \( bb(C) \) \, $ <polar:chosen-matrix>]
  for which the same polar system has $mu$ distinct simple zeros. This choice constrains only the coefficients of $Q$. The matrix entries may be arbitrary complex numbers, however large; no bound on an approximation order or on coefficients of a parametrized family is used.
  #emph[Choose a common chart for the right kernels.] At each selected zero, the first row of the polar Jacobian is nonzero, so $d \( Q compose Psi \) eq.not 0$. If $A \( Psi \( xi \) \)$ had rank at most $n - 2$, its adjugate would vanish and the determinant derivative in every direction would be zero. Since its determinant is zero, its rank is exactly $n - 1$. It has unique right and left projective kernel lines.
  Choose a linear functional nonzero on every one of the finitely many right kernel lines. Such functionals are the complement of a finite union of proper hyperplanes. A fixed change of basis in the matrix domain makes this functional the first coordinate. Equivalently, replace $A$ by $A S$ for a suitable invertible constant matrix $S$. This multiplies $Q$ and all its polars by the same nonzero constant and preserves simplicity. Continue to write $A \, Q$ for the resulting matrix and polynomial. Every selected right kernel now has a representative with first coordinate one. Put
  $ B_i = partial_(w_i) A = sum_(j = 1)^N \( w_i \)_j A_j . $
  These are constant matrices, and $partial_(w_i) Q = "tr" \( "adj" \( A \) B_i \)$.
  #emph[Lift to a square system of bilinear equations.] Let $A^(upright("hom")) \( xi_0 \, xi \)$ be the entrywise homogenization of the affine matrix $A compose Psi$, so $A^(upright("hom")) \( 1 \, xi \) = A \( Psi \( xi \) \)$. On
  $ bb(P)_(\[ xi_0 : xi \])^(h + 1) times bb(P)_p^(n - 1) times bb(P)_b^(n - 1) $
  use the equations
  #[#set math.equation(numbering: n => "(8.6)")
   $ A^(upright("hom")) p = 0 \, #h(2em) \( b^(sans(T)) A^(upright("hom")) \)_j = 0 quad \( 2 lt.eq j lt.eq n \) \, #h(2em) b^(sans(T)) B_i p = 0 quad \( 1 lt.eq i lt.eq h \) . $ <polar:kernel-system>]
  There are $n + \( n - 1 \) + h = h + 2 n - 1$ equations, equal to the product dimension. In the chart $p_1 eq.not 0$, the omitted first left-kernel equation follows from the others, since
  $ 0 = b^(sans(T)) \( A^(upright("hom")) p \) = p_1 \( b^(sans(T)) A^(upright("hom")) \)_1 + sum_(j = 2)^n p_j \( b^(sans(T)) A^(upright("hom")) \)_j . $
  At a selected point, rank $n - 1$ implies $"adj" \( A \) = rho p b^(sans(T))$ for normalized kernel representatives and some $rho eq.not 0$: every column of the adjugate is in the right kernel, every row is in the left kernel, and some cofactor is nonzero. Consequently $partial_(w_i) Q = rho b^(sans(T)) B_i p$ there. Each selected affine zero therefore has a unique lift satisfying (8.6).
  The lift is not yet known to be simple. We prove this locally before applying Lemma 22; other components of the kernel system will impose no further requirement.
  #emph[Eliminate the kernel coordinates.] Fix one selected lift and normalize $p_1 = 1$. Choose a nonzero coordinate of its left kernel vector, move that row to the first position, and normalize the corresponding left coordinate to one. These are local coordinate choices, which can differ between selected points. The cofactor obtained by deleting this first row and first column is nonzero, because it is the corresponding entry of $rho p b^(sans(T))$. In these row orders write the ambient matrix near $Psi \( xi \)$ as
  $ A \( x \) = mat(delim: "(", a \( x \), beta \( x \); gamma \( x \), E \( x \)) \, #h(2em) p = binom(1, u) \, #h(2em) b = binom(1, v) \, $
  where $E$ has size $\( n - 1 \) times \( n - 1 \)$. The chosen cofactor makes $E$ invertible at the selected point, so restrict to an ambient neighborhood on which it is invertible. When $n = 1$, $E$ is the empty matrix with determinant one, and the auxiliary vectors $u \, v$ are empty.
  The same row permutation is applied to every $B_i$. The last $n - 1$ right equations and all retained left equations give
  $ gamma + E u = 0 \, #h(2em) beta + v^(sans(T)) E = 0 . $
  Their auxiliary Jacobian has invertible diagonal blocks $E \, E^(sans(T))$, so they eliminate the kernel coordinates holomorphically as
  #[#set math.equation(numbering: n => "(8.7)")
   $ u = - E^(- 1) gamma \, #h(2em) v^(sans(T)) = - beta E^(- 1) . $ <polar:solved-kernels>]
  The remaining right equation, evaluated on the slice, is
  $ s \( xi \) = S \( Psi \( xi \) \) = 0 \, #h(2em) S \( x \) = a \( x \) - beta \( x \) E \( x \)^(- 1) gamma \( x \) . $
  The Schur determinant identity gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ Q \( x \) = sigma det \( E \( x \) \) S \( x \) \, $ <polar:schur-determinant>]
  where $sigma in { 1 \, - 1 }$ is the sign of the row permutation. It follows by subtracting $beta E^(- 1)$ times the lower block rows from the first row. Here $S$ is defined on an ambient neighborhood where $E$ is invertible, so it can be differentiated in each ambient direction $w_i$.
  After substituting (8.7), let $g_i \( xi \)$ denote the bilinear equation $b^(sans(T)) B_i p$. For any constant ambient direction $w$, differentiation of $S$ gives
  $ partial_w S & = partial_w a - \( partial_w beta \) E^(- 1) gamma + beta E^(- 1) \( partial_w E \) E^(- 1) gamma - beta E^(- 1) \( partial_w gamma \)\
 & = \( 1 \, - beta E^(- 1) \) \( partial_w A \) binom(1, - E^(- 1) gamma) . $
  Thus $g_i = \( partial_(w_i) S \) compose Psi$. In particular this computation does not identify an ambient derivative with a derivative along the slice. If $f = Q compose Psi$ and $q_i = \( partial_(w_i) Q \) compose Psi$, differentiating (8.8) in the ambient space yields
  #[#set math.equation(numbering: n => "(8.9)")
   $ f = c thin s \, #h(2em) q_i = c thin g_i + c_i s \,\
c = sigma \( det E \) compose Psi eq.not 0 \, #h(2em) c_i = sigma \( partial_(w_i) det E \) compose Psi . $ <polar:reduced-system>]
  The original equation vector $\( f \, q_1 \, dots.h \, q_h \)$ and the reduced vector $\( s \, g_1 \, dots.h \, g_h \)$ therefore differ by a triangular holomorphic matrix with diagonal entries $c$. At a common zero their Jacobians differ by the value of that invertible matrix. The original zero was simple, so the reduced Jacobian is invertible.
  Finally, a tangent vector annihilated by the full kernel-system Jacobian first satisfies the differentials of the eliminated equations. Their invertible auxiliary block determines its $\( u \, v \)$ component from its $xi$ component. The remaining equations and the invertible reduced Jacobian force that $xi$ component to be zero, and hence the auxiliary component is zero as well. The full square Jacobian is invertible. All $mu$ selected lifts are thus distinct simple zeros of (8.6).
  #emph[Count the selected lifts.] The three groups of equations in (8.6) have multidegrees and multiplicities
  $ upright("equations") & upright("multidegree") & upright("number")\
A^(upright("hom")) p & \( 1 \, 1 \, 0 \) & n\
\( b^(sans(T)) A^(upright("hom")) \)_j \, j gt.eq 2 & \( 1 \, 0 \, 1 \) & n - 1\
b^(sans(T)) B_i p & \( 0 \, 1 \, 1 \) & h . $
  Lemma 22 gives the first inequality in (8.4), regardless of other zeros or components. The product has nonnegative coefficients. Setting $U = V = 1$ sums the coefficients with the same $H$-exponent, and hence bounds the particular coefficient by
  $ \[ H^(h + 1) \] thin 2^h \( H + 1 \)^(2 n - 1) = 2^h binom(2 n - 1, h + 1) . $
  Since $mu > 0$, we must have $h + 1 lt.eq 2 n - 1$. For integers $1 lt.eq b lt.eq a$,
  $ binom(a, b) lt.eq frac(a^b, b !) lt.eq (frac(e a, b))^b \; $
  the last bound follows from $log \( b ! \) gt.eq integral_1^b log t thin d t gt.eq b log b - b$. Taking $\( h + 1 \)$st roots gives
  $ mu^(1 \/ \( h + 1 \)) lt.eq 2^(h \/ \( h + 1 \)) frac(e \( 2 n - 1 \), h + 1) lt.eq frac(4 e n, h + 1) \, $
  which is (8.4). No comparison between $n$ and the number $N$ of ambient variables, or between $n$ and $h + 2$, was assumed. ◻
]

=== 8.4 The smooth-hypersurface lower bound <the-smooth-hypersurface-lower-bound>

We have proved that a fixed finite set of simple polar intersections persists under arbitrary affine determinant approximation, and that its kernel lifts satisfy the multidegree bound. We now use the certificate provided by the smooth hypersurface.

#proof[
  Let $n$ be any size for which $G$ is a coefficientwise limit of affine $n times n$ determinants. Choose the directions and $L_0$ from Lemma 21. The affine hyperplane $L_0 = 1$ identifies with the projective chart $L_0 eq.not 0$ and contains representatives of all $mu = r \( r - 1 \)^(d - 2)$ selected points. Parametrize it by an affine isomorphism
  $ Psi : bb(C)^(d - 1) arrow.r { x in bb(C)^d : L_0 \( x \) = 1 } . $
  Restricting the homogeneous equations to this hyperplane is precisely their dehomogenization in that projective chart. Thus the equations
  $ G compose Psi = 0 \, #h(2em) \( partial_(w_i) G \) compose Psi = 0 quad \( 1 lt.eq i lt.eq d - 2 \) $
  have $mu$ distinct simple affine solutions. The directions remain constant vectors in $bb(C)^d$; they need not be tangent to $L_0 = 1$. Apply Proposition 23 with $N = d$, $h = d - 2$, and $P = G$. It gives
  $ n gt.eq frac(d - 1, 4 e) #scale(x: 120%, y: 120%)[\(] r \( r - 1 \)^(d - 2) #scale(x: 120%, y: 120%)[\)]^(1 \/ \( d - 1 \)) gt.eq frac(\( r - 1 \) \( d - 1 \), 4 e) \, $
  where the last inequality uses $r gt.eq r - 1 > 0$. This holds for every admissible size $n$, so taking the minimum proves the theorem. ◻
]

== 9 The permanent lower bound and its consequences <sec:consequences>

Proposition 20 supplies a smooth form with an exact affine permanent projection. Combining it with Theorem 4 proves the main lower bound.

#proof[
  Let $m gt.eq 1408$ be an integer and put $k = floor.l m \/ 11 floor.r$. Then $k gt.eq 128$. With $q = floor.l \( k - 1 \) \/ 3 floor.r$, we have $q gt.eq 0$ and
  $ m gt.eq 11 k gt.eq 11 k - 2 q . $
  Proposition 20 supplies a nonzero homogeneous form $G$ of degree $r$ in $d$ variables, with smooth projective zero set, and a fixed affine map $Phi_m$ such that $G = "per"_m compose Phi_m$. Lemma 2 and Theorem 4 give
  $ upright(overline(d c)) \( "per"_m \) gt.eq upright(overline(d c)) \( G \) gt.eq frac(\( r - 1 \) \( d - 1 \), 4 e) gt.eq frac(k^3, 3200 e) \, $
  using the two scale bounds in Proposition 20. The affine substitution is fixed before any determinant approximation is chosen, so this step applies to the unrestricted coefficientwise border model.
  Finally,
  $ k gt.eq m / 11 - 1 gt.eq m / 12 \, $
  where the last inequality holds for $m gt.eq 132$. Therefore
  $ upright(overline(d c)) \( "per"_m \) gt.eq frac(m^3, 5 thin 529 thin 600 e) \, $
  which proves the stated choices of $c$ and $m_0$. ◻
]

=== 9.1 Determinantal complexity and branching programs <determinantal-complexity-and-branching-programs>

The border lower bound gives the same estimate for exact determinant representations. A direct determinant construction also transfers it to algebraic branching programs and their fixed-budget limits.

#thm([Corollary 9.1.])[
  (Exact determinantal complexity).  #emph[For every integer $m gt.eq 1408$, 
$ "dc" \( "per"_m \) gt.eq frac(m^3, 5 thin 529 thin 600 e) . $

]
] <cor:exact-complexity>

#proof[
  An exact determinant representation is also a constant sequence of approximating determinants. Hence $upright(overline(d c)) \( f \) lt.eq "dc" \( f \)$ for every $f$, and Theorem 1 applies. ◻
]

#thm([Corollary 9.2.])[
  (Affine-linear algebraic branching programs).  #emph[Over $bb(C)$, an algebraic branching program is a finite directed acyclic graph with distinct designated source $s$ and sink $t$, whose edges carry affine-linear forms; its output is the sum of the commutative products of labels along all directed $s$-to-$t$ paths. Such a program computing $"per"_m$ requires $Omega \( m^3 \)$ vertices and $Omega \( m^3 \)$ edges, even after trimming to the vertices and edges on source-to-sink paths. The same bounds hold if $"per"_m$ is a coefficientwise (equivalently, Zariski) limit of outputs with a fixed vertex budget, respectively a fixed edge budget, along the approximation.]
] <cor:abp-complexity>

#proof[
  Let a program with $N$ vertices have output $f$. Sum parallel-edge labels and topologically order the vertices. With adjacency convention $A_(v \, u) = upright("label") \( u arrow.r v \)$, the matrix $A$ is strictly triangular, $det \( I - A \) = 1$, and $\( I - A \)^(- 1) = I + A + dots.h.c + A^(N - 1)$. The path-sum formula and the block determinant identity give
  $ f = e_t^(sans(T)) \( I - A \)^(- 1) e_s = det mat(delim: "(", I - A, e_s; - e_t^(sans(T)), 0) . $
  This is an affine-linear determinant of size $N + 1$. Padding with isolated vertices covers all programs with at most $N$ vertices. Taking closures therefore gives $upright(overline(d c)) \( f \) lt.eq N + 1$ for every output in the fixed-budget border model, even when the graph varies. After summing parallel edges, there are finitely many graph types for a fixed vertex budget, and each output depends polynomially on the affine-label coefficients. Hence the output set is constructible, so its two closures agree by the argument in Section 2.
  For a nonzero output, trim away all vertices and edges outside source-to-sink paths. The remaining underlying graph is connected, so $N lt.eq E + 1$, where $E$ is its edge count. Thus $upright(overline(d c)) \( f \) lt.eq E + 2$. For a fixed-edge-budget approximation to the nonzero permanent, discard any zero outputs and trim each remaining program separately; the same uniform determinantal bound passes to the limit. The finite graph-type argument also applies to this trimmed edge-budget model. Theorem 1 now yields both cubic lower bounds. ◻
]

=== 9.2 Smooth initial forms <smooth-initial-forms>

Theorem 4 also applies locally to a polynomial that need not be homogeneous. Its first nonzero homogeneous term can be obtained as a coefficientwise limit of translated and rescaled copies of that polynomial.

#thm([Corollary 9.3.])[
  (Smooth initial form).  #emph[Let $g in bb(C) \[ x_1 \, dots.h \, x_d \]$, where $d gt.eq 2$, and let $a in bb(C)^d$. Suppose that the lowest nonzero homogeneous term $G_r \( x \)$ of $g \( a + x \)$ has degree $r gt.eq 2$ and defines a smooth hypersurface in $bb(P)^(d - 1)$. Then 
$ upright(overline(d c)) \( g \) gt.eq frac(\( r - 1 \) \( d - 1 \), 4 e) . $

 The same lower bound holds for $"dc" \( g \)$.]
] <cor:smooth-initial-form>

#proof[
  Fix a size $n$ for which $g$ belongs to the coefficientwise closure $cal(C)_n$ of affine determinants of size $n$. Then $deg g lt.eq n$, and $cal(C)_n$ is closed in the space of polynomials of degree at most $n$. For every fixed $t in bb(C) \\ { 0 }$, Lemma 2 gives
  $ t^(- r) g \( a + t x \) in cal(C)_n . $
  Writing $g \( a + x \) = sum_(j = r)^(deg g) G_j \( x \)$ as a sum of homogeneous terms, the polynomial on the left is $sum_(j = r)^(deg g) t^(j - r) G_j \( x \)$. It converges coefficientwise to $G_r$ as $t arrow.r 0$. Closedness therefore gives $G_r in cal(C)_n$. Theorem 4 now bounds this same size $n$ below by $\( r - 1 \) \( d - 1 \) \/ \( 4 e \)$. Taking the least admissible $n$ proves the border assertion, and $"dc" \( g \) gt.eq upright(overline(d c)) \( g \)$ proves the exact assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
