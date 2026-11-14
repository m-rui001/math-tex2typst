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

#align(center)[#text(size: 16pt, weight: "bold")[The Kervaire theorem for groups]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Adding one generator and one relation to a nontrivial group should leave a nontrivial group.
  This is the Kervaire conjecture. We prove it by establishing coefficient injectivity in the case where the new
  generator has exponent sum $plus.minus 1$.

Let $A$ be a group, let $chevron.l t chevron.r tilde.equiv bb(Z)$, and set $H = A * chevron.l t chevron.r$.
  Write $p : H arrow.r bb(Z)$ for the homomorphism that kills $A$ and sends $t$ to $1$.
  A word $w in H$ is #emph[unimodular] if $p \( w \) = plus.minus 1$.
  Denote its normal closure in $H$ by $chevron.l #h(-0.16667em) chevron.l w chevron.r #h(-0.16667em) chevron.r_H$.

The equation $w \( t \) = 1$ is #emph[solvable over $A$] if there are an embedding $A arrow.r
  B$ and an element $b in B$ such that evaluating $t$ at $b$ gives $w \( b \) = 1$.
  This is equivalent to injectivity of the coefficient map $A arrow.r
  H \/ chevron.l #h(-0.16667em) chevron.l w chevron.r #h(-0.16667em) chevron.r_H$:
  every solution factors through this quotient, while an injective coefficient map lets the quotient itself supply
  a solution.

#thm([Theorem 1.1.])[
  #emph[For every group $A$ and every unimodular word $w in A * chevron.l t chevron.r$, the canonical homomorphism
$ A arrow.r \( A * chevron.l t chevron.r \) \/ chevron.l #h(-0.16667em) chevron.l w chevron.r #h(-0.16667em)
  chevron.r_H $

 is injective.]
] <thm:main>

No restriction on torsion, cardinality, or presentation of $A$ is imposed.
  The nontriviality assertion for all exponent sums follows at once.

#thm([Corollary 1.2.])[
  (The Kervaire conjecture).  #emph[If $A eq.not 1$, then $\( A * chevron.l t chevron.r \) \/ chevron.l
    #h(-0.16667em) chevron.l w chevron.r #h(-0.16667em) chevron.r_H eq.not 1$ for every $w in A * chevron.l t
    chevron.r$.]
] <cor:kervaire>

#proof[
  For $p \( w \) = plus.minus 1$, apply Theorem 1. For every other integer $d = p \( w \)$,
    the map $p$ induces a surjection from the quotient onto the nontrivial group $bb(Z) \/ d bb(Z)$,
    where $bb(Z) \/ 0 bb(Z) = bb(Z)$. ◻
]

=== 1.1 Context and methods <context-and-methods>

Kervaire’s characterization of high-dimensional knot groups includes normal generation by a single element
  #cite(label("Kervaire1965")) Theorem 1.1. Chen #cite(label("Chen2026")) preprint Section 1 traces the
  group-theoretic Kervaire problem to this setting. Its stronger Kervaire–Laudenbach form asks for coefficient
  injectivity whenever $p \( w \) eq.not 0$; such one-variable equations are called #emph[nonsingular].
  Theorem 1 proves its unimodular case, while Corollary 2 resolves the full nontriviality conjecture.
  At the level of assertions for all groups, this nontriviality statement is equivalent to unimodular coefficient
  injectivity: Klyachko records the standard reduction through an embedding into a simple group
  #cite(label("Klyachko2004")) preprint Section 3, Proposition 2. We prove injectivity directly.

Gerstenhaber and Rothaus proved solvability of nonsingular systems of equations over finite groups in finite
  overgroups #cite(label("GerstenhaberRothaus1962")) Theorem 2.
  In particular their theorem gives the required injectivity for finite coefficient groups,
  and hence for residually finite groups by separating each nonidentity coefficient in a finite quotient.
  Pestov records the resulting ultraproduct extension: nonsingular equations over hyperlinear groups have
  solutions in hyperlinear overgroups #cite(label("Pestov2008")) preprint Corollary 10.4.
  Hyperlinear groups admit embeddings into metric ultraproducts of unitary groups with normalized Hilbert–Schmidt
  metrics. Klyachko proved unimodular injectivity for torsion-free groups #cite(label("Klyachko1993")) Theorem 4,
  exponent-one case. Chen gave a new proof through estimates for the complexity of surfaces
  #cite(label("Chen2026")) preprint Theorem 6.9. For arbitrary coefficient groups,
  Klyachko and Lurye proved injectivity after imposing $w^m = 1$ when $w$ is unimodular and $m gt.eq
  2$ #cite(label("KlyachkoLurye2012")) preprint Section 1, Theorem; Section 5; this does not impose $w = 1$.

Kawauchi has published a proposed resolution of the universal nontriviality assertion through knot exteriors,
  relative collapses, and ribbon sphere-link groups #cite(label("Kawauchi2024")) Theorem 1 and Corollary 2.
  By the equivalence just recalled, its endpoint includes unimodular injectivity.
  The argument below takes a different route through spectral phase and a finite-dimensional fixed-space theorem;
  neither the collapse construction nor the ribbon-asphericity assertions enter its proof.
  Recent work of Klyachko, Mikheenko, and Olshanskii also distinguishes solvability inside a coefficient group
  from solvability in an overgroup #cite(label("KlyachkoMikheenkoOlshanskii2026")) Sections 1 and 3.
  Our conclusion concerns the latter and does not assert that a solution already lies in $A$.

Unitary groups and degree theory already play a central role in the Gerstenhaber–Rothaus method
  #cite(label("GerstenhaberRothaus1962")) Theorem 1; see also #cite(label("KlyachkoThom2017")) Section 1.1.
  Corner-labelled diagrams and Euler-characteristic estimates likewise have a substantial history in equations
  over groups #cite(label("KlyachkoLurye2012")) preprint Sections 3–4 and #cite(label("Chen2026")) preprint
  Sections 2–4. Here these methods meet through a trace comparison for permutations weighted by the left regular
  representation of $A$. The regular representation is available for every group and supplies a faithful finite
  trace without an approximation hypothesis on $A$. For the spectral ingredient,
  Thompson’s matrix exponential formula and its extensions provide a related precedent
  #cite(label("AntezanaLarotondaVarela2012")) Section 2 and Theorem 4.4;
  Section 2 distinguishes those formulas from the unrestricted phase inequality proved here.

Two ingredients are useful independently of the diagram argument.
  The first is subadditivity of the trace of the fractional spectral phase of a unitary.
  The second is a fixed-space lemma: given $k gt.eq 1$, signs $s_1 \, dots.h \, s_n in { 1 \, -
  1 }$ with $sum_i s_i = plus.minus 1$, and $P in "U" \( n k \)$,
  some $X in "U" \( k \)$ makes $"diag" \( X^(s_1) \, dots.h \, X^(s_n) \) P$ have at least $k$ fixed directions.
  We prove the latter by a degree calculation on a compact manifold that records a unitary together with a fixed
  $k$-plane. Their combination gives the planar obstruction below.

=== 1.2 Proof overview <proof-overview>

Suppose a coefficient $g in A$ becomes trivial after imposing $w = 1$.
  A finite expression for $g$ as a product of conjugates of $w$ and $w^(- 1)$ can be drawn on a punctured disk.
  Pairing the occurrences of $t$ produces disjoint bands between word disks.
  The complementary boundary curves read words in $A$.

The central assertion is Theorem 6: in a connected planar surface made from these disks and bands,
  one boundary word cannot be the only nontrivial one. To prove it,
  we encode travel along the boundaries by a weighted permutation.
  We measure that operator by the trace of its spectral phase.
  Mixing positive and negative word disks with a suitable unitary gives an upper bound.
  A second calculation, one boundary circle at a time, approaches that bound plus the nonnegative phase of the
  exceptional word. The Euler characteristic formula identifies the common term in these two calculations.
  The upper bound forces the extra term to vanish, so this word is trivial.

Section 2 proves the phase inequality, and Section 3 proves the fixed-space lemma used to choose the mixing
  unitary. Section 4 establishes the planar boundary theorem.
  Section 5 constructs the bands from the original group relation and removes their connected components from the
  inside out, proving $g = 1$.

The proof uses group presentations, the spectral theorem for unitary operators, elementary surface topology,
  and degree modulo two. The trace, incidence-space, and diagram calculations are included.

== 2 Spectral phase and its trace <sec:phase>

We measure a unitary by the sum of its spectral angles, with each angle chosen in $\[ 0 \, 1 \)$.
  The value zero at the cut is essential: the resulting quantity is subadditive and vanishes only at the identity.

Let $A$ be an arbitrary group, with identity $1$. On $ell^2 \( A \)$ define the left and right translations by

$ L \( a \) delta_x = delta_(a x) \, wide R \( a \) delta_x = delta_(x a^(- 1)) \, $

and let $cal(M)$ be the commutant of all $R \( a \)$. Thus $L \( a \) in cal(M)$.
  For $T in cal(M)$, set $tau \( T \) = T_(1 \, 1)$, and for a finite matrix $\( T_(i j) \) in M_b \( cal(M) \)$ set

$ tau_b \( \( T_(i j) \) \) = sum_(j = 1)^b tau \( T_(j j) \) . $

Throughout, the matrix trace is unnormalized: $tau_b \( I \) = b$.

We record why these are faithful traces, including when $A$ is uncountable.
  Writing $t_x = T_(x \, 1)$, commutation with right translations gives $T_(x \, y) = t_(x y^(- 1))$,
  and $\( t_x \)_(x in A) in ell^2 \( A \)$. For $S \, T in cal(M)$,

$ tau \( S T \) = sum_(x in A) s_(x^(- 1)) t_x = sum_(x in A) t_(x^(- 1)) s_x = tau \( T S \) . $

Both sums converge absolutely by Cauchy–Schwarz; square-summable families have countable support even if $A$ is
  uncountable. Positivity is immediate. If $T gt.eq 0$ and $tau \( T \) = 0$, then $T^(1 \/ 2) delta_1 = 0$.
  Since $T^(1 \/ 2)$ also commutes with right translations, it kills every basis vector, so $T = 0$.
  Block multiplication proves traciality of $tau_b$; the same square-root argument,
  applied to each $e_j ⊗ delta_1$, proves its faithfulness.

The algebra $M_b \( cal(M) \)$ is the commutant of the simultaneous right translations on $bb(C)^b ⊗
  ell^2 \( A \)$. For background on group von Neumann algebras and functional calculus,
  see #cite(label("Jones2009")) Sections 2.2, 3.3, and 3.4, EP1.
  It contains spectral projections and bounded Borel functions of its normal elements.
  For a unitary on an arbitrary Hilbert space, the spectral calculus can be obtained by decomposing the space into
  orthogonal cyclic reducing subspaces: each is the closed span of ${ U^j xi : j in bb(Z) }$ and is separable,
  and the calculi on these subspaces form a direct sum. Uniqueness of the spectral resolution shows that the
  calculus commutes with every unitary commuting with $U$, so it remains in the right-translation commutant.
  Moreover, $tau_b$ is the finite sum of the vector functionals at $e_j ⊗ delta_1$.
  In particular, for a fixed unitary $U$, uniformly bounded Borel functions $f_r$ converging pointwise to $f$ satisfy

#[#set math.equation(numbering: n => "(1)")
 $ tau_b \( f_r \( U \) \) arrow.r tau_b \( f \( U \) \) . $ <eq:phase-bounded-convergence>]

Indeed, apply dominated convergence to the finite scalar spectral measures associated with these vectors.
  This also explains why no separability assumption is needed.

For $bb(T) = { z in bb(C) : \| z \| = 1 }$, define the Borel function

$ h \( e^(2 pi i x) \) = x - floor.l x floor.r \, wide h \( 1 \) = 0 \, wide ell \( U \) = tau_b \( h \( U \) \) . $

Thus $0 lt.eq h \( U \) lt.eq I$ and $e^(2 pi i h \( U \)) = U$. Faithfulness implies

#[#set math.equation(numbering: n => "(2)")
 $ ell \( U \) = 0 quad arrow.l.r.double quad U = I . $ <eq:phase-faithfulness>]

#thm([Lemma 2.1.])[
  (Subadditivity of spectral phase).  #emph[For all unitaries $U \, V in M_b \( cal(M) \)$,
$ ell \( U V \) lt.eq ell \( U \) + ell \( V \) . $

]
] <lem:phase>

#proof[
  Put $B = h \( V \)$ and $W_u = U e^(2 pi i u B)$ for $0 lt.eq u lt.eq 1$.
    Then $W_0 = U$, $W_1 = U V$, and $W'_u = 2 pi i W_u B$. For a smooth function $f$ on $bb(T)$,
    let $f'$ denote differentiation in normalized angle: $f' \( e^(2 pi i x) \) =
    frac(d, d x) f \( e^(2 pi i x) \)$. We first claim that
  #[#set math.equation(numbering: n => "(3)")
   $ frac(d, d u) tau_b \( f \( W_u \) \) = tau_b \( f' \( W_u \) B \) . $ <eq:phase-derivative>]
  For $f \( z \) = z^r$ with $r > 0$, the product rule and traciality give
  $ frac(d, d u) tau_b \( W_u^r \) = 2 pi i sum_(j = 0)^(r - 1) tau_b \( W_u^(j + 1) B W_u^(r - 1 - j) \) =
    2 pi i r tau_b \( W_u^r B \) . $
  For negative powers, use $\( W_u^(- 1) \)' = - 2 pi i B W_u^(- 1)$ and the same calculation.
    The formula is also immediate for $r = 0$. If $f \( e^(2 pi i x) \) =
    sum_(r in bb(Z)) a_r e^(2 pi i r x)$ is smooth, then $sum_r \( 1 + \| r \| \) \| a_r \| < oo$.
    Its Fourier series and differentiated series converge uniformly;
    the differentiated traces are uniformly bounded termwise by $2 pi b \| r a_r \|
    lr(bar.v.double B bar.v.double)$. Termwise differentiation proves (3).
  Suppose now that $f$ is real and $f' lt.eq 1$. Since $B gt.eq 0$, traciality and positivity give
  $ tau_b \( f' \( W_u \) B \) = tau_b \( B^(1 \/ 2) f' \( W_u \) B^(1 \/ 2) \) lt.eq tau_b \( B \) . $
  This argument does not require $B$ to commute with $f' \( W_u \)$. Integrating (3) yields
  #[#set math.equation(numbering: n => "(4)")
   $ tau_b \( f \( U V \) \) lt.eq tau_b \( f \( U \) \) + tau_b \( h \( V \) \) . $ <eq:phase-smooth-bound>]
  To pass to the discontinuous function $h$, choose a smooth nonnegative density $rho_epsilon$ of integral one
    supported in $\( 0 \, epsilon \)$, where $0 < epsilon < 1$, and set
  $ f_epsilon \( e^(2 pi i x) \) = integral_0^epsilon rho_epsilon \( s \) #scale(x: 120%, y: 120%)[\(] x + s -
    floor.l x + s floor.r #scale(x: 120%, y: 120%)[\)] thin d s . $
  These functions are smooth and lie between zero and one. For the periodic fractional-part function $g \( x \) =
    x - floor.l x floor.r$,
  $ g \( x + delta \) - g \( x \) = delta - #scale(x: 120%, y: 120%)[\(] floor.l x + delta floor.r -
    floor.l x floor.r #scale(x: 120%, y: 120%)[\)] lt.eq delta wide \( delta gt.eq 0 \) . $
  Averaging and differentiating gives $f'_epsilon lt.eq 1$. Also $f_epsilon arrow.r h$ pointwise.
    At the only discontinuity, the forward shift gives
  $ 0 lt.eq f_epsilon \( 1 \) = integral_0^epsilon s rho_epsilon \( s \) thin d s lt.eq epsilon \, $
  so the limiting value is precisely $h \( 1 \) = 0$. Apply (4) to $f_epsilon$ and use (1) for the fixed unitaries
    $U$ and $U V$. ◻
]

#prodef([Remark 2.2.])[
  For finite matrices, the same inequality follows from Thompson’s exponential formula,
    recalled in #cite(label("AntezanaLarotondaVarela2012")) Section 2.
    It expresses $U V$ as $e^(2 pi i C)$ with $C$ a sum of unitary conjugates of $h \( U \)$ and $h \( V \)$.
    Thus $C gt.eq 0$, $h \( e^(2 pi i C) \) lt.eq C$, and taking traces proves the bound.
    The norm-limit extension to infinite factors in #cite(label("AntezanaLarotondaVarela2012")) Theorem 4.4
    assumes embeddability in the ultrapower of the hyperfinite $upright("II")_1$ factor.
    The direct smoothing proof above requires no such approximation hypothesis and retains the prescribed value at
    the phase cut.
]

== 3 A unitary with a large fixed space <sec:degree>

The next lemma supplies the matrix that will mix copies of a word disk.
  Its conclusion holds for an arbitrary fixed unitary matrix; no continuous choice of the mixing matrix is needed.
  The compact-unitary degree strategy goes back to Gerstenhaber–Rothaus #cite(label("GerstenhaberRothaus1962"))
  Theorem 1; see also #cite(label("KlyachkoThom2017")) Section 1.1 for removing coefficients by homotopy.
  Here the degree domain records a fixed plane as well as a unitary,
  so that it has the dimension required for the intersection.

#thm([Lemma 3.1.])[
  #emph[Let $s_1 \, dots.h \, s_n in { 1 \, - 1 }$ satisfy $epsilon := sum_i s_i in { 1 \, - 1 }$, let $k gt.eq
    1$ be an integer, and put $m = n k$. For every $P in "U" \( m \)$ there is an $X in "U" \( k \)$ such that
$ F \( X \) = "diag" \( X^(s_1) \, dots.h \, X^(s_n) \) P $

 fixes a complex subspace of dimension at least $k$.]
] <lem:fixed>

#proof[
  We use degree modulo two to force an intersection with the matrices that fix a $k$-plane.
    Keeping the plane as part of the data makes that incidence space a smooth manifold.
  #emph[A convenient homotopy.] First remove $P$ along a smooth path from $P$ to $I_m$ in $"U" \( m \)$,
    obtained by diagonalizing this fixed matrix and interpolating its angles.
    All homotopies below can be reparametrized to be constant near their endpoints,
    so their concatenation is smooth. Next pair positive and negative blocks, leaving one block of sign $epsilon$.
    Each pair can be cancelled by the following explicit homotopy. On its two coordinate $k$-planes, set
  $ R_u =
    mat(delim: "(", cos \( pi u \/ 2 \) I_k, - sin \( pi u \/ 2 \) I_k; sin \( pi u \/ 2 \) I_k, cos \( pi u \/
    2 \) I_k) \, wide 0 lt.eq u lt.eq 1 . $
  Then
  $ "diag" \( X \, I_k \) R_u "diag" \( I_k \, X^(- 1) \) R_u^(- 1) $
  runs from $"diag" \( X \, X^(- 1) \)$ to $I_(2 k)$ and depends smoothly on $X$.
    Apply this homotopy on the disjoint paired block sums, and then move the resulting constant identity blocks to
    $- I$. Thus, in a fixed orthogonal splitting $bb(C)^m = E_0 xor E_0^perp$ with $dim_(bb(C)) E_0 = k$,
    the map $F$ is homotopic to
  $ F_0 \( X \) = X^epsilon xor \( - I_r \) \, wide r = m - k . $
  #emph[The incidence manifold.] Write $"Gr"_k \( bb(C)^m \)$ for the Grassmannian of complex $k$-planes and set
  $ cal(R) = { \( W \, E \) in "U" \( m \) times "Gr"_k \( bb(C)^m \) : W \|_E = I_E } . $
  A unitary fixing $E$ preserves $E^perp$, where it is arbitrary.
    Consequently $cal(R)$ is a smooth bundle over $"Gr"_k \( bb(C)^m \)$ with fiber $"U" \( r \)$.
    Local orthonormal frames of $E^perp$ give its local product charts.
    The condition $\( W - I_m \) p_E = 0$, where $p_E$ is the orthogonal projection onto $E$,
    also shows that $cal(R)$ is closed in a compact product. Its base and fiber are connected.
    Thus it is a compact connected manifold without boundary, of real dimension
  $ 2 k r + r^2 = m^2 - k^2 . $
  The product $M = "U" \( k \) times cal(R)$ and the target $"U" \( m \)$ are thus connected closed manifolds of
    the same dimension $m^2$.
  Consider the smooth map
  $ G_0 : M arrow.r "U" \( m \) \, wide G_0 \( X \, W \, E \) = F_0 \( X \) W^(- 1) . $
  Its only preimage of $I_m$ is
  $ \( I_k \, W_0 \, E_0 \) \, wide W_0 = I_k xor \( - I_r \) . $
  Indeed, $G_0 \( X \, W \, E \) = I_m$ implies $W = F_0 \( X \)$.
    Every fixed vector of this matrix lies in $E_0$, so its fixed $k$-plane $E$ must equal $E_0$.
    It follows that $X^epsilon = I_k$, hence $X = I_k$.
  #emph[Regularity at the unique preimage.] For $j gt.eq 0$,
    let $frak(u) \( j \)$ denote the real vector space of skew-Hermitian $j times j$ matrices.
    Tangent coordinates at this preimage are
  $ A in frak(u) \( k \) \, wide B in frak(u) \( r \) \, wide Z in M_(r times k) \( bb(C) \) . $
  Put
  $ K_Z = mat(delim: "(", 0, - Z^(*); Z, 0) . $
  Local coordinates are given by
  $ X = e^A \, wide E = e^(K_Z) E_0 \, wide W = e^(K_Z) "diag" \( I_k \, - e^B \) e^(- K_Z) . $
  Here $Z$ gives the usual Grassmannian tangent directions $"Hom"_(bb(C)) \( E_0 \, E_0^perp \)$,
    and $B$ gives all fiber directions. At zero these formulas give
  $ dot(F)_0 = mat(delim: "(", epsilon A, 0; 0, 0) \, wide dot(W) = \[ K_Z \, W_0 \] +
    mat(delim: "(", 0, 0; 0, - B) = mat(delim: "(", 0, 2 Z^(*); 2 Z, - B) . $
  Since $F_0 = W = W_0 = W_0^(- 1)$ at the preimage,
  #[#set math.equation(numbering: n => "(5)")
   $ d G_0 \( A \, B \, Z \) = dot(F)_0 W_0 - dot(W) W_0 = mat(delim: "(", epsilon A, 2 Z^(*); - 2 Z, - B) .
     $ <eq:degree-derivative>]
  Every skew-Hermitian $m times m$ matrix has this form uniquely.
    Thus the derivative is an isomorphism and $I_m$ is a regular value.
    If $r = 0$, the Grassmannian and $cal(R)$ are points, and the calculation reduces to $A mapsto epsilon A$.
    The same formulas also apply when $k = 1$.
  #emph[The degree conclusion.] For smooth maps between connected closed manifolds of the same dimension,
    the parity of a regular fiber is independent of the regular value and invariant under smooth homotopy.
    This is the degree modulo two; see #cite(label("Milnor1965")) Section 4, pp. 20–25.
    No orientations are needed. The unique regular preimage above therefore gives $deg_2 \( G_0 \) = 1$.
  The homotopy from $F_0$ to $F$ induces a homotopy from $G_0$ to
  $ G \( X \, W \, E \) = F \( X \) W^(- 1) . $
  Hence $G$ also has degree one. It cannot miss $I_m$, since a map with no preimages of that point has degree
    zero. At a preimage we have $F \( X \) = W$, and $W$ fixes $E$. This proves the lemma. ◻
]

== 4 A planar surface cannot have one nontrivial boundary <sec:diagram>

We now combine the two unitary lemmas. Corner-labelled relative diagrams are classical;
  see Howie #cite(label("Howie1983")) Section 1, Lemma 1. Diagram obstructions and Euler-characteristic estimates
  also appear in #cite(label("KlyachkoLurye2012")) preprint Sections 3–4,
  especially Lemma 2 and #cite(label("Chen2026")) preprint Sections 3–4.
  We give the disk-and-band argument in full, using the spectral-phase comparison for its central estimate.
  Fix a group $A$ and a cyclic word

#[#set math.equation(numbering: n => "(6)")
 $ w = t^(s_1) a_1 dots.h.c t^(s_n) a_n \, wide a_i in A \, quad s_i in { 1 \, - 1 } \, quad sum_(i = 1)^n s_i =
   plus.minus 1 . $ <eq:word>]

Thus $n$ is odd and positive. The coefficients may equal $1$. Indices on this word are taken modulo $n$.

A #emph[word disk] is an oriented disk whose boundary has $n$ disjoint marked intervals, called slots,
  separated by labelled arcs, called corners. A positive disk reads $w$ around its oriented boundary,
  and a negative disk reads $w^(- 1)$. Each slot is indexed by the occurrence of $t$ in (6) from which it comes.
  Its #emph[traversal sign] is $s_i$ on a positive disk and $- s_i$ on a negative disk.
  The sign of a disk and the traversal sign of a slot are different data.

Attach rectangular bands to pairs of slots, compatibly with orientation, using every slot exactly once.
  Require each band to join opposite traversal signs. The resulting compact oriented surface has boundary words in
  $A$: read the corner labels in the boundary orientation, ignoring band sides.
  Changing the starting point conjugates the word, which does not affect whether it represents $1$.

#thm([Theorem 4.1.])[
  (Planar boundary theorem).  #emph[Let $Sigma$ be a connected surface of genus zero constructed from a nonempty
    finite collection of word disks for (6) and bands as above.
    If every boundary word except possibly one is trivial in $A$, then the remaining boundary word is trivial as well.]
] <thm:planar>

=== 4.1 Slots, corners, and boundary cycles <slots-corners-and-boundary-cycles>

The total of all traversal signs is zero, since the bands pair opposite signs.
  A positive disk contributes $sum_i s_i$ and a negative disk its negative.
  There are therefore $k$ disks of each kind, with $k gt.eq 1$. Let $D$ be the set of their $2 n k$ slots.
  Define two permutations of $D$: $sigma$ takes each slot to the next slot on its oriented disk,
  and $theta$ pairs the two slots of a band. Write $c_d in A$ for the corner from $d$ to $sigma d$. Thus

#[#set math.equation(numbering: n => "(7)")
 $ upright("disk kind") & upright("successor") & upright("corner label")\
+ & i mapsto i + 1 & a_i\
- & i + 1 mapsto i & a_i^(- 1) . $ <eq:corners>]

The boundary circles are the cycles of $sigma theta$. Indeed, from the start of a slot $d$,
  a boundary path follows a band side to the finish of $theta d$,
  then follows its corner to the start of $sigma theta d$. For a cycle $z = \( d_1 \, dots.h \, d_(d_z) \)$ in
  this order, its word is

#[#set math.equation(numbering: n => "(8)")
 $ r_z = c_(theta d_1) dots.h.c c_(theta d_(d_z)) . $ <eq:boundaryword>]

Figure 1 records this local convention.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.35, 1.504), fill: rgb("#f0f0f0"), stroke: none)
  line((0, 0), (0, 1.504), (2.35, 0), (2.35, 1.504), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (2.35, 0), (0, 1.504), (2.35, 1.504), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((1.504, 0), (0.752, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.752, 1.504), (1.504, 1.504), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.175, 0), [#text(size: 9pt)[$d$]], anchor: "north", padding: 0.1176cm)
  content((1.175, 1.504), [#text(size: 9pt)[$theta d$]], anchor: "south", padding: 0.1176cm)
  content((1.175, 0.752), [#text(size: 9pt)[band]])
  content((2.35, 0), [#text(size: 9pt)[start]], anchor: "north-west", padding: 0.1176cm)
  content((2.444, 1.222), [#text(size: 9pt)[finish]], anchor: "west", padding: 0.1176cm)
  line((2.35, 0.188), (2.35, 1.316), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  bezier((2.35, 1.504), (4.606, 1.974), (2.985, 2.139), (3.707, 1.974), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((3.76, 2.021), [#text(size: 9pt)[$c_( theta d)$]], anchor: "south", padding: 0.1176cm)
  line((4.606, 1.974), (5.875, 1.974), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.311, 1.974), [#text(size: 9pt)[$sigma theta d$]], anchor: "north", padding: 0.1176cm)
  content((4.7, 0.517), [#text(size: 9pt)[one boundary step:#linebreak()$d#h(0.3333em) theta#h(0.3333em) theta d #h(0.3333em) sigma#h(0.3333em) sigma theta d$]])
})],
  caption: [Figure 1: The slot arrows follow the oriented boundaries of the word disks. The blue path follows the boundary of the attached surface. The paired slots have opposite traversal signs; the corner encountered after the band is $c_(theta d)$. ],
) <fig:boundary>

There are $2 k$ disks and $n k$ bands. If $q$ is the number of boundary circles, the Euler characteristic gives

#[#set math.equation(numbering: n => "(9)")
 $ 2 - q = 2 k - n k \, wide q = n k - 2 k + 2 . $ <eq:euler>]

In particular $q gt.eq 1$: the surface has nonempty boundary along its corners.

We will assign a small real phase $eta_z$ to each boundary circle, with $sum_z eta_z = 0$.
  The phases will let us approach the spectral cut from opposite sides on the trivial and possibly nontrivial
  boundary circles. They can be realized by numbers $gamma_d in bb(R)$ satisfying

#[#set math.equation(numbering: n => "(10)")
 $ gamma_(theta d) = - gamma_d \, wide sum_(d in z) gamma_d = eta_z . $ <eq:flows>]

To see this, form a graph whose vertices are the cycles of $sigma theta$ and whose edges are the pairs ${ d \,
  theta d }$. The graph is connected: connectedness of $Sigma$ makes $chevron.l sigma \,
  theta chevron.r$ transitive on $D$, and this group equals $chevron.l sigma theta \, theta chevron.r$.
  On a spanning tree, any assignment of total sum zero is the divergence of a real edge flow.
  For completeness, remove a leaf, put its required value on its end of the incident edge and its negative on the
  other end, and adjust the value required at the adjacent vertex. The final vertex has value zero.
  Set all other edge flows to zero, including loops. This gives (10); if $q = 1$, take every $gamma_d = 0$.

=== 4.2 An upper bound obtained by mixing the disks <an-upper-bound-obtained-by-mixing-the-disks>

Use the algebra $M_(2 n k) \( cal(M) \)$ and its trace from Section 2, with matrix coordinates indexed by $D$.
  On $bb(C)^D ⊗ ell^2 \( A \)$ define

#[#set math.equation(numbering: n => "(11)")
 $ S \( e_d ⊗ v \) & = e_(sigma d) ⊗ L \( c_d^(- 1) \) v \, & Theta \( e_d ⊗ v \) & =
   e^(2 pi i gamma_d) e_(theta d) ⊗ v . $ <eq:shifts>]

Both operators are unitary; (10) gives $Theta^2 = I$. The product $S
  Theta$ follows the boundary permutation $sigma theta$. Its coefficient weights act on the left,
  so a complete circuit multiplies the inverse corner labels in reverse order, giving the inverse boundary word.
  We regard scalar matrices on $bb(C)^D$ as elements of this algebra by tensoring with the identity.
  For a scalar orthogonal projection $Q$, $tau_(2 n k) \( Q ⊗ I \) = "rank" Q$, since $tau \( I \) = 1$.

Number the disks of each kind by $1 \, dots.h \, k$. At each slot index $i$,
  write $e_(+ \, i) \( u \)$ and $e_(- \, i) \( u \)$ for the positive- and negative-disk arrays with coefficient
  vector $u in bb(C)^k$. Given $X in "U" \( k \)$, put

#[#set math.equation(numbering: n => "(12)")
 $ J e_(+ \, i) \( u \) = e_(- \, i) \( X u \) \, wide J e_(- \, i) \( u \) =
   e_(+ \, i) \( X^(- 1) u \) . $ <eq:mixing>]

This scalar operator is a unitary involution. The corner convention gives

$ S \( e_(+ \, i) \( u \) ⊗ v \) & = e_(+ \, i + 1) \( u \) ⊗ L \( a_i^(- 1) \) v \,\
S \( e_(- \, i) \( u \) ⊗ v \) & = e_(- \, i - 1) \( u \) ⊗ L \( a_(i - 1) \) v . $

The same coefficient weight acts on all $k$ disks of a given kind. Consequently $J S J = S^(- 1)$:
  on a positive array both sides shift to $i - 1$ with weight $L \( a_(i - 1) \)$,
  and on a negative array both shift to $i + 1$ with weight $L \( a_i^(- 1) \)$.
  Thus $S J$ is a self-adjoint unitary. It exchanges disk kinds, so its trace is zero.
  Its negative spectral projection $\( I - S J \) \/ 2$ has trace $n k$, and hence

#[#set math.equation(numbering: n => "(13)")
 $ ell \( S J \) = frac(n k, 2) . $ <eq:phaseSJ>]

We now choose $X$ to make $J Theta$ have a large fixed space.
  Let $V_(+)$ and $V_(-)$ be the scalar coordinate spaces of slots with positive and negative traversal signs.
  Each has dimension $n k$. Both $J$ and $Theta$ exchange them.
  In $V_(+)$, the block at index $i$ consists of positive disks when $s_i = 1$ and negative disks when $s_i = -
  1$; in $V_(-)$, use the opposite kind. Order each block by disk number.
  In these bases $Theta : V_(+) arrow.r V_(-)$ is a fixed matrix $P in "U" \( n k \)$, while $J : V_(-) arrow.r
  V_(+)$ is $"diag" \( X^(- s_1) \, dots.h \, X^(- s_n) \)$. Thus

#[#set math.equation(numbering: n => "(14)")
 $ \( J Theta \) \|_(V_(+)) = "diag" \( X^(- s_1) \, dots.h \, X^(- s_n) \) P . $ <eq:traversalblock>]

Lemma 5, applied to the signs $- s_i$, supplies $X$ for which this block has at least $k$ fixed directions.
  Moreover, $J \( J Theta \) J = \( J Theta \)^(- 1)$, and $J$ exchanges $V_(+)$ and $V_(-)$.
  The other block therefore also has at least $k$ fixed directions.

The eigenvalues of the scalar unitary $J Theta$ are paired with their inverses, with multiplicities.
  Since $h \( lambda \) + h \( lambda^(- 1) \) = 1$ for $lambda eq.not 1$ and both terms vanish at $1$, we obtain

#[#set math.equation(numbering: n => "(15)")
 $ ell \( J Theta \) = frac(2 n k - dim ker \( J Theta - I \), 2) lt.eq n k - k . $ <eq:phaseJTheta>]

Apply Lemma 3 to $S Theta = \( S J \) \( J Theta \)$:

#[#set math.equation(numbering: n => "(16)")
 $ ell \( S Theta \) lt.eq 3 / 2 n k - k . $ <eq:upper>]

This bound holds for every choice of the boundary phases in (10). The choice of $X$ may depend on those phases.

=== 4.3 Computing the phase along boundary circles <computing-the-phase-along-boundary-circles>

We compute the same trace directly from the boundary cycles.
  On a cycle $z = \( d_1 \, dots.h \, d_(d_z) \)$, one circuit of $S Theta$ starting at $d_1$ has weight

$ e^(2 pi i eta_z) L \( c_(theta d_(d_z))^(- 1) \) dots.h.c L \( c_(theta d_1)^(- 1) \) =
  e^(2 pi i eta_z) L \( r_z^(- 1) \) . $

Circuit weights at other starting points are unitary conjugates.
  If $T_z$ is the restriction of $S Theta$ to this cycle, then

#[#set math.equation(numbering: n => "(17)")
 $ ell \( T_z \) = frac(d_z - 1, 2) + tau #scale(x: 120%, y: 120%)[\(] h \( e^(2 pi i eta_z) L \( r_z^(- 1) \) \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:cyclephase>]

Here and below $ell$ uses the matrix trace of the appropriate size.
  To prove the formula, let $d = d_z$ and $zeta = e^(2 pi i \/ d)$.
  Rephasing the successive coordinate vectors by $1 \, zeta \, dots.h \,
  zeta^(d - 1)$ conjugates $T_z$ to $zeta T_z$. For every $lambda in bb(T)$ the exact identity

$ sum_(j = 0)^(d - 1) h \( zeta^j lambda \) = frac(d - 1, 2) + h \( lambda^d \) $

follows by listing the $d$ fractional parts; it also holds when $lambda^d = 1$, because $h \( 1 \) = 0$.
  Apply bounded Borel functional calculus and take the trace. Each term on the left has trace $ell \( T_z \)$.
  The constant on the right has trace $d \( d - 1 \) \/ 2$,
  and $T_z^d$ is diagonal with $d$ conjugate circuit weights. Division by $d$ gives (17).

#proof[
  Let $z_0$ be the possibly nontrivial boundary circle. We approach the phase cut from below on the trivial
    circles and from above on $z_0$. Thus each trivial word contributes a limit of one,
    while the exceptional word retains its nonnegative phase. For $epsilon.alt > 0$ put
  $ eta_z = - epsilon.alt quad \( z eq.not z_0 \) \, wide eta_(z_0) = \( q - 1 \) epsilon.alt . $
  These phases sum to zero. On each trivial circle the last term of (17) tends to $1$ as $epsilon.alt arrow.b 0$.
    On $z_0$ it tends to $tau \( h \( L \( r_(z_0)^(- 1) \) \) \)$:
    the fractional part converges to its prescribed value from the nonnegative-shift side, including at $1$,
    and the trace obeys bounded convergence. For $q = 1$ the exceptional phase is identically zero and there are
    no other circles, so the same statement holds.
  Since $sum_z d_z = 2 n k$, summing (17) and then using (9) gives
  $ lim_(epsilon.alt arrow.b 0) ell \( S Theta \) & = frac(2 n k - q, 2) + q - 1 +
    tau \( h \( L \( r_(z_0)^(- 1) \) \) \)\
 & = 3 / 2 n k - k + tau \( h \( L \( r_(z_0)^(- 1) \) \) \) . $
  The uniform bound (16) forces the last term to vanish. Faithfulness of $tau$ and positivity of $h$ imply
    $h \( L \( r_(z_0)^(- 1) \) \) = 0$, hence $L \( r_(z_0)^(- 1) \) = I$ and $r_(z_0) = 1$.
    Only the uniform bound is used; no limiting choice of $X$ or $J$ is needed. ◻
]

== 5 From a coefficient relation to a planar surface <sec:topology>

We now prove Theorem 1. The construction has two steps. A finite product of conjugates of the relator gives a
  punctured disk with paired bands. We then remove its connected band surfaces from the inside out,
  applying Theorem 6 at each step. The relation-to-surface interpretation is also described in
  #cite(label("Chen2026")) preprint Section 2, especially Example 2.5.
  We retain the finite domain and the original coefficient map explicitly in the construction.

#proof[
  Cyclically conjugating the relator does not change its normal closure.
    Since its total $t$-exponent is $plus.minus 1$, it has a cyclic expression beginning with a $t$-letter.
    Splitting powers of $t$ into individual letters gives (6); identity coefficients are allowed.
    Suppose that $g in A$ belongs to the normal closure of $w$ in $A * chevron.l t chevron.r$.
    Then, for some finite $r$,
  #[#set math.equation(numbering: n => "(18)")
   $ g = product_(j = 1)^r b_j w^(epsilon_j) b_j^(- 1) \, wide b_j in A * chevron.l t chevron.r \, quad
     epsilon_j in { 1 \, - 1 } . $ <eq:normal-closure-product>]
  If $r = 0$, then $g = 1$. Henceforth assume $r > 0$.
  ===== 5.1 Realizing the relation. <realizing-the-relation.>
  Choose a based CW presentation space $Y$ with $pi_1 \( Y \) = A$. Such a space exists for every group:
    take one loop $x_a$ for each $a in A$ and attach two-cells imposing $x_1 = 1$ and $x_a x_b = x_(a b)$.
    These relations identify its fundamental group with $A$; see also #cite(label("Hatcher2002")) Corollary 1.28.
    Thus $pi_1 \( Y or bb(T) \) = A * chevron.l t chevron.r$, with the added circle representing $t$.
    All subsequent triangulations concern a finite planar domain.
  Let $Delta$ be a polygonal disk, and remove the interiors of $r$ disjoint polygonal disks to obtain a planar
    surface $P$. There is a continuous map
  $ f : P arrow.r Y or bb(T) $
  whose outer boundary is a based loop in $Y$ representing $g$,
    and whose $j$th inner boundary reads $w^(epsilon_j)$ when oriented as the boundary of its missing disk.
    To construct it, join marked points on the inner circles to a common outer basepoint by cutting arcs that are
    otherwise disjoint. Order the arcs so that the outer loop represents the ordered product of the conjugated
    missing-disk loops, and map the $j$th arc to a path representing $b_j$.
    Use chosen based coefficient loops in $Y$ and one monotone traversal of $bb(T)$, affine in angle,
    for each $t^(plus.minus 1)$; on an inverse relator, reverse the chosen paths in reverse order.
    Cutting along the arcs gives a disk whose boundary path is nullhomotopic by (18).
    Extend over that disk and reglue the matching copies of the arcs.
    This uses the equality in $pi_1 \( Y or bb(T) \)$, before imposing the relator $w$.
  Write $u : P arrow.r bb(T)$ for the projection of $f$ that collapses $Y$, and $v : P arrow.r
    Y$ for the projection that collapses $bb(T)$. The boundary map $u$ is constant on the outer circle and on
    every coefficient interval, and traverses $bb(T)$ once on each $t$-letter interval.
  ===== 5.2 Extracting bands while retaining the original map. <extracting-bands-while-retaining-the-original-map.>
  Identify $bb(T)$ with $bb(R) \/ bb(Z)$, with wedge point $0$.
    Approximate $u$, relative to the boundary, by a map $u'$ that is piecewise affine in local angle coordinates,
    with uniform circle distance less than $1 \/ 12$. Here is a direct construction.
    Subdivide the boundary so that its angle maps are affine on each edge,
    and choose a sufficiently fine finite triangulation of $P$.
    By uniform continuity, the image under $u$ of each triangle lies in an arbitrarily short arc.
    Lift to angles on each triangle and interpolate the vertex values affinely.
    The lifts on shared edges differ by an integer, so the resulting circle maps agree there.
    On boundary edges the interpolation equals $u$. Finer triangulations make the uniform error arbitrarily small.
    Only the compact surface $P$ and its circle map have been triangulated.
  Choose an angle $z in \( 1 \/ 3 \, 2 \/ 3 \)$ outside the images of all vertices.
    The level $u' ""^(- 1) \( z \)$ is a finite disjoint union of polygonal circles and properly embedded
    polygonal arcs: within each triangle it is a line segment or empty, and it misses every vertex.
    Because $u' = u$ on the boundary, each $t$-letter interval contains exactly one arc endpoint;
    there are no other endpoints. Ignore the closed level circles.
  The circle orientation coorients the level arcs. Their endpoints have opposite crossing signs along the induced
    boundary orientation of $P$. The missing-disk orientation reverses this boundary orientation at both ends,
    so each arc pairs opposite $t$-letter signs in the word-disk readings.
    This remains true for an arc with both ends on the same disk.
  At every point of the level, the original value $u$ has distance greater than $1 \/ 4$ from the wedge point.
    Consequently the original map $f$ takes an open neighborhood of the level into $bb(T) \\ { 0 }$,
    and $v$ is identically the basepoint there. Take pairwise disjoint thin rectangular neighborhoods of the level
    arcs inside this neighborhood. They give bands meeting the missing-disk boundaries in small intervals inside
    the corresponding $t$-letter intervals. Thus $v$ is exactly constant throughout every band.
  Each small attachment interval is now a slot, with the sign of its original $t$-letter.
    Between consecutive slots, the projected boundary path consists of the original coefficient loop together with
    constant pieces from the adjacent $t$-intervals. Its label in $A$ is therefore unchanged.
    In particular positive disks have the corners $a_i$, and negative disks have the reversed corners $a_i^(- 1)$.
    This observation allows the geometric attachment slots to be smaller than the original letter intervals.
  ===== 5.3 Removing the planar components. <removing-the-planar-components.>
  Put the missing disks back into $Delta$ as word disks and adjoin all the bands.
    Their union is a finite compact planar surface $S$, possibly disconnected.
    Each component contains a word disk, every slot is used once, and the paired signs are opposite.
    Its orientation is induced from the plane, so it satisfies the disk-and-band hypotheses of Theorem 6.
    Along its boundary, $v$ reads exactly the corner words from that theorem:
    band sides and remaining pieces of $t$-intervals are constant in $Y$.
  The nonexterior boundary words of an arbitrary component need not yet be trivial,
    because other components may lie inside them. We therefore choose an innermost component as follows.
    Every connected planar component $C$ has a unique exterior boundary circle;
    let $D \( C \)$ be the closed Jordan disk it bounds. Its other boundary circles bound the inner complementary
    disks of $C$. Among the finitely many $D \( C \)$ choose one minimal under inclusion.
    No inner complementary disk of this $C$ contains another component:
    such a component would have its exterior disk strictly inside $D \( C \)$, contradicting minimality.
  Each inner complementary disk of $C$ therefore contains no word disks.
    It already carries the map $v$ to $Y$, so its boundary word is trivial in $A$.
    Theorem 6 makes the exterior boundary word trivial as well.
    Hence its actual boundary loop under $v$ is nullhomotopic in $Y$.
    Fill all of $D \( C \)$ by a map to $Y$ agreeing with that boundary loop,
    and discard the word disks and bands of $C$.
  We continue to write $v$ for the resulting coefficient map.
    This replacement changes nothing outside $D \( C \)$ and affects no other component.
    It leaves a continuous $Y$-map outside the remaining word-disk interiors,
    with the same corner readings and constant remaining bands.
    That is precisely the invariant needed to repeat the argument; no further circle approximation is required.
    Each step removes a component. After finitely many steps, the original outer loop extends over $Delta$ in $Y$.
    Thus $g = 1$ in $A$, proving the claimed injectivity. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
