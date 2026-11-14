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

#align(center)[#text(size: 16pt, weight: "bold")[Determination of a metric and a unitary connection \
from one boundary patch]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

A connection Laplacian couples the geometry of a manifold to parallel transport in a vector bundle.
  Its boundary measurements therefore pose two simultaneous inverse problems:
  determining the metric that governs its principal part and determining the connection that governs the transport
  of vector-valued solutions. We consider both unknowns at zero frequency,
  with all measurements confined to one boundary patch.

Let $M$ be a compact connected smooth manifold of dimension $n gt.eq 3$, with nonempty smooth boundary,
  and let $Gamma subset partial M$ be a nonempty relatively open proper subset.
  The bundle is the trivial Hermitian bundle $M times bb(C)^2$.
  A smooth unitary connection is written $d_A = d + A$, where

$ A in C^oo \( M \; T^(*) M ⊗ frak(u) \( 2 \) \) \, wide frak(u) \( 2 \) = { B in bb(C)^(2 times 2) : B^(*) = - B } . $

For a smooth Riemannian metric $g$, write $L_(g \, A) = d_A^(* g) d_A$.
  Its zero-Dirichlet realization is invertible: a section of zero energy is parallel,
  and a parallel section with zero boundary trace is zero. Elliptic coercivity then gives,
  for each $f in C_c^oo \( Gamma \; bb(C)^2 \)$ extended by zero to $partial M$, a unique solution $u_f^(g \, A)$ of

$ L_(g \, A) u_f^(g \, A) = 0 quad upright("in ") M \, wide u_f^(g \, A) \|_(partial M) = f . $

The measured object is the sesquilinear energy form

#[#set math.equation(numbering: n => "(1.1)")
 $ chevron.l Lambda_(g \, A \, Gamma) f \, h chevron.r = integral_M chevron.l d_A u_f^(g \, A) \,
   d_A u_h^(g \, A) chevron.r_g thin d V_g \, wide f \, h in C_c^oo \( Gamma \; bb(C)^2 \) . $ <eq:DN>]

The Hermitian product is linear in its first argument. All integrations use densities;
  no orientation of $M$ is required. In particular, (1.1) specifies the boundary measurement without presupposing
  a boundary metric or a boundary measure.

#thm([Theorem 1.1.])[
  #emph[Let $M$ and $Gamma$ be as above. For $j = 1 \, 2$, let $g_j$ be a smooth Riemannian metric on $M$ and let
    $A_j in C^oo \( M \; T^(*) M ⊗ frak(u) \( 2 \) \)$. If
$ chevron.l Lambda_(g_1 \, A_1 \, Gamma) f \, h chevron.r = chevron.l Lambda_(g_2 \, A_2 \, Gamma) f \,
  h chevron.r quad upright("for all ") f \, h in C_c^oo \( Gamma \; bb(C)^2 \) \, $

 then there are a smooth diffeomorphism $Phi : M arrow.r M$ and a smooth map $U : M arrow.r U \( 2 \)$ such that
#[#set math.equation(numbering: n => "(1.2)")
 $ Phi \|_Gamma = "Id" \, wide U \|_Gamma = I \, wide g_2 = Phi^(*) g_1 \, wide A_2 =
   U^(- 1) \( Phi^(*) A_1 \) U + U^(- 1) d U . $ <eq:main-conclusion>]

 Here $I$ denotes the $2 times 2$ identity matrix.]
] <thm:main>

The two transformations in (1.2) preserve (1.1): the corresponding change of solution is $u_2 =
  U^(- 1) \( u_1 compose Phi \)$. Thus the conclusion describes precisely the ambiguities inherent in these
  measurements. The patch need not be connected, and the manifold may have several boundary components.

=== 1.1 Context and contribution <context-and-contribution>

Calderón’s inverse conductivity problem asks whether electrical measurements at the boundary determine an interior
  conductivity #cite(label("Calderon1980")). For smooth isotropic conductivities in dimension at least three,
  global uniqueness was established by Sylvester and Uhlmann #cite(label("SylvesterUhlmann1987")).
  In the anisotropic formulation the unknown is a metric, or equivalently a positive conductivity tensor density,
  and boundary-fixing diffeomorphisms give an unavoidable invariance.
  Lee and Uhlmann proved a boundary determination result and uniqueness in the real-analytic setting under
  geometric and topological hypotheses #cite(label("LeeUhlmann1989")).
  Lassas and Uhlmann subsequently recovered real-analytic manifolds from local boundary information
  #cite(label("LassasUhlmann2001")). The Poisson embedding approach of Lassas, Liimatainen,
  and Salo #cite(label("LLS20")) expresses the geometry through the values of harmonic solutions.
  We use the same broad principle, with source solutions of a connection Laplacian providing both points and fiber
  identifications.

For connections, Albin, Guillarmou, Tzou, and Uhlmann recovered Hermitian connections and matrix potentials from
  full Cauchy data on fixed surfaces #cite(label("AlbinGuillarmouTzouUhlmann2013")).
  In higher dimensions, Cekić established recovery for line bundles on certain known conformally transversally
  anisotropic geometries #cite(label("Cekic2017Connections")),
  and for smooth unitary Yang–Mills connections of arbitrary rank from same-patch measurements on an arbitrary
  fixed smooth metric #cite(label("Cekic2020YM")) Theorem 1.3.
  His complex parallel transport method also recovers arbitrary-rank connections and matrix potentials from full
  boundary data on fixed geometries conformal to subdomains of $bb(R)^2 times
  M_0$ #cite(label("Cekic2025Systems")) Theorem 1.1. In the real-analytic category,
  Gabdurakhmanov and Kokarev proved joint recovery of metric, Euclidean bundle,
  and compatible connection from a boundary patch #cite(label("GabdurakhmanovKokarev2025")) Theorem 1.1.
  Their use of Green kernels to identify the base and fibers is a close geometric antecedent.
  Theorem 1 concerns an unknown smooth metric and an arbitrary smooth unitary connection on the fixed trivial
  rank-two bundle; it imposes no Yang–Mills equation on that connection.

The scalar companion #cite(label("ScalarCompanion2026")) develops a smooth continuation argument based on
  separately harmonic Green kernels and shrinking geodesic spheres.
  The present proof uses its product continuation, sphere geometry,
  and scalar angular estimate #cite(label("ScalarCompanion2026")) Sections 3–5.
  We give the analytic arguments needed here, including their extension to systems with scalar principal part.
  The scalar uniqueness theorem itself is not applied to the matrix-valued boundary data.

The additional difficulty appears in the first moments of the transfer between local solution spaces.
  In scalar harmonic coordinates those moments can be normalized away.
  For a connection, a harmonic frame removes the zeroth-order term,
  but the transfer still has a matrix-valued first moment. We represent it by matrices $D^1 \, dots.h \, D^n$.
  Their components complementary to the real scalar matrices satisfy a first-order system whose principal symbol
  is the conformal Killing symbol. In dimension at least three this symbol is of finite type:
  two prolongations determine all third derivatives from lower jets.
  The real scalar part of the displacement is fixed by the coordinate normalization.
  Together these facts turn an initial square-root estimate on $D$ into the stronger estimate needed to continue
  the metric and connection across a frontier point. This reduction is the main matrix-specific step of the proof.

=== 1.2 How the proof is organized <how-the-proof-is-organized>

Boundary symbol factorization first determines all metric and connection jets on $Gamma$,
  after imposing normal gauge. Attaching a small exterior cap then converts the boundary form into equality of
  Green matrices on an open interior set. Source solutions supported in that set separate points,
  span fiber values, and realize the allowed harmonic jets.
  They define a maximal local isometry with a unitary bundle identification;
  Section 2 prepares coordinates and harmonic frames at any putative frontier point.

The local continuation mechanism has three stages. First, Section 3 continues a mixed Green matrix,
  initially known when either variable lies in the matched region.
  Two quantitative unique-continuation estimates, one in each variable,
  allow continuation across suitable hypersurfaces in the product.
  Second, Sections 4 and Section 5 use this kernel to transfer harmonic functions across small moving spheres.
  The transfer is represented by a matrix density of total mass $I$.
  An angular coercivity estimate bounds that density uniformly even as the spheres shrink.
  The matrix lower-order terms are absorbed in the same estimate.

Finally, Section 6 extracts the first and second moments of the transfer.
  The finite-type argument described above improves the difference of the normalized inverse metrics from order
  $r$ to order $r^(3 \/ 2)$, where $r$ is the sphere radius.
  A continuity argument then lets the radii collapse, proving local agreement of the normalized operators.
  Section 7 removes the remaining conformal factor and extends the resulting isometry and unitary identification
  over the whole manifold, including every component of the measured patch.

== 2 Boundary data, exterior sources, and contact coordinates <bdy:section>

We first replace the measurements by a family of interior source solutions.
  The boundary symbol determines jets of both the metric and the connection,
  after a boundary-identity change of gauge. These jets allow a common exterior cap,
  on which the Green matrices agree. Source evaluations in that cap then identify points and fibers
  simultaneously. The final part of the section prepares coordinates and harmonic frames at a possible frontier of
  this identification. The cap and source-evaluation construction follows the scalar construction in
  #cite(label("ScalarCompanion2026")) Section 2; we give the changes needed for unitary connections and
  matrix-valued evaluations.

=== 2.1 Dirichlet solutions and boundary jets <dirichlet-solutions-and-boundary-jets>

We use positive metric densities throughout. Write $L_(g \, A) = d_A^(* g) d_A$, with positive principal symbol,
  and let $L_(g \, A \, D)$ denote its zero-Dirichlet realization.
  Its quadratic form is coercive on $H_0^1 \( M \; bb(C)^2 \)$.
  Indeed, the usual elliptic form estimate and compactness reduce coercivity to the absence of a kernel.
  A kernel element satisfies $d_A u = 0$; its norm is constant, and its zero boundary trace makes it zero.
  Smooth sources and boundary data therefore have unique solutions smooth up to the boundary.
  The same facts hold on every smooth extension used below and on sufficiently small coordinate balls;
  we use the standard smooth elliptic Dirichlet theory of #cite(label("TaylorPDEI2011")) Chapter 5.

We also use open-set unique continuation for systems with a smooth,
  real scalar elliptic principal part and smooth matrix lower-order terms;
  see #cite(label("Aronszajn1957")) Remark 3. The usual scalar local Carleman estimate, summed over components,
  proves this statement: after conjugation by the scalar weight,
  a matrix first-order term is bounded by a constant times $parallel nabla v parallel + tau parallel v parallel$,
  and is absorbed for large Carleman parameter $tau$. See #cite(label("HormanderIV2009")) Chapter XXVIII for the
  underlying scalar estimates. Boundary Cauchy uniqueness follows from the same interior statement.
  Extend the coefficients smoothly across a boundary patch and extend a solution with zero trace and zero
  covariant normal derivative by zero. Green’s formula leaves no boundary distribution,
  so the extension solves the equation weakly. Interior regularity and unique continuation then give vanishing
  near the patch and throughout the connected interior.

A unitary gauge $V : M arrow.r U \( 2 \)$ changes the connection to

#[#set math.equation(numbering: n => "(2.1)")
 $ A^V = V^(- 1) A V + V^(- 1) d V \, wide d_(A^V) \( V^(- 1) u \) = V^(- 1) d_A u . $ <bdy:gauge>]

A gauge equal to $I$ on the boundary preserves the measured form.
  In inward boundary-normal coordinates $\( z \, s \)$, solve $partial_s V = - A_s V$, $V \( z \, 0 \) = I$.
  This gives $A_s^V = 0$. The gauge can be made global: in a collar replace the time argument of this solution by
  a smooth function equal to $s$ in a smaller collar and equal to zero near the inner edge, and set $V =
  I$ farther inside. The ODE preserves unitarity. Apply this construction separately to $A_1 \, A_2$,
  using gauges $V_1 \, V_2$, and retain their names for the final return to the original trivializations.
  Until then, $A_j$ denotes the gauged connection.

#thm([Lemma 2.1.])[
  (Boundary jets).  #emph[Suppose the local energy forms of $\( g_1 \, A_1 \)$ and $\( g_2 \, A_2 \)$ agree on
    $Gamma$. In their respective boundary-normal coordinates, based on the same boundary coordinates,
    and in the normal gauges just constructed, the full Taylor jets of $g_1 \, A_1$ and $g_2 \,
    A_2$ agree at every point of $Gamma$.]
] <bdy:jets>

#proof[
  Write $g = d s^2 + k \( s \, z \)$, with $k$ a tangential positive matrix,
    and put $rho = \( k^(a b) xi_a xi_b \)^(1 \/ 2)$. Green’s formula identifies the measured operator with the
    density $nabla_nu^A u thin d S_g$. Relative to the coordinate density, its principal symbol is
  $ \( det k \)^(1 \/ 2) rho I . $
  Its square determines $C = \( det k \) k^(- 1)$. Since the tangential dimension is $m = n - 1$,
  $ det C = \( det k \)^(m - 1) \, wide k = \( det C \)^(1 \/ \( m - 1 \)) C^(- 1) . $
  Thus the boundary metrics and densities agree. Division by their common density gives equality of the ordinary
    covariant unit-normal DN operators locally on $Gamma$. Localization on both sides by cutoffs supported in
    $Gamma$ gives equality of their full symbols.
  We spell out the symbol calculation, extending the metric factorization of #cite(label("LeeUhlmann1989")) to the
    present scalar-principal system. Recovery of a connection together with the metric by this even–odd symbol
    separation is also developed in #cite(label("Gabdurakhmanov2021DN")) Theorem 1.1 and Section 3.3;
    the calculation below uses complex Hermitian fibers. In normal gauge,
  $ L_(g \, A) = - partial_s^2 - alpha partial_s + P \, wide alpha = 1 / 2 "tr" \( k^(- 1) partial_s k \) \, $
  where $P$ is the connection Laplacian on each tangential slice.
    With $D_z = - i partial_z$, its degree-one symbol consists of the scalar metric term and $-
    2 i k^(a b) A_a xi_b$. Its degree-zero symbol uses only slice coefficients and their tangential derivatives.
    The local Dirichlet factorization has the form
  $ L_(g \, A) = \( - partial_s + B - alpha \) \( partial_s + B \) med \( mod med Psi^(- oo) \) \, wide b \# b -
    alpha b - partial_s b tilde.op sigma \( P \) \, $
  where $b tilde.op rho I + b_0 + b_(- 1) + dots.h.c$ is a left symbol and
  $ b \# c tilde.op sum_mu frac(\( 1 \/ i \)^(\| mu \|), mu !) \( partial_xi^mu b \) \( partial_z^mu c \) . $
  The positive root $rho I$ selects the decaying Dirichlet branch.
    The Poisson parametrix consequently identifies $B \( 0 \)$, modulo a smoothing operator,
    with the outward normal derivative. This factorization is valid for smooth coefficients:
    its principal root is scalar and each subsequent matrix coefficient is solved by scalar division by $2 rho$.
    The true inverse Dirichlet problem changes only the local smoothing remainder.
  The part of $b_0$ involving the new jets is
  #[#set math.equation(numbering: n => "(2.2)")
   $ 1 / 4 ("tr"_k partial_s k - frac(\( partial_s k \) \( xi^sharp \, xi^sharp \), rho^2)) I -
     frac(i k^(a b) A_a xi_b, rho) \, wide xi^sharp = k^(- 1) xi . $ <bdy:first-jets>]
  This follows from $partial_s rho = - \( partial_s k \) \( xi^sharp \, xi^sharp \) \/ \( 2 rho \)$ and the
    degree-one factorization equation. At degree $1 - j$, $j gt.eq 2$,
    the new normal derivatives arise only in $partial_s b_(2 - j) \/ \( 2 rho \)$. Inductively their contribution is
  #[#set math.equation(numbering: n => "(2.3)")
   $ frac(1, \( 2 rho \)^(j - 1))
     [1 / 4 ("tr"_k partial_s^j k - frac(\( partial_s^j k \) \( xi^sharp \, xi^sharp \), rho^2)) I - frac(i k^(a
     b) \( partial_s^(j - 1) A_a \) xi_b, rho)] . $ <bdy:highest-jets>]
  Every omitted term involves lower normal jets, with tangential derivatives.
    Differentiating $rho$, a raised index, or a coefficient multiplying the preceding highest jet produces only
    such lower-jet expressions.
  Subtract the two symbol recursions after their lower jets have been identified.
    The metric term in (2.3) is even in $xi$, whereas the connection term is odd.
    The odd term determines all components of the new connection jet.
    If the even term vanishes for a symmetric tensor $T$, then $T \( v \, v \) =
    "tr"_k \( T \)$ for every unit vector $v$. Polarization gives $T = "tr"_k \( T \) k$,
    and taking trace gives $\( m - 1 \) "tr"_k \( T \) = 0$. As $m gt.eq 2$, $T = 0$.
    Beginning with the recovered boundary metric, this proves all normal jets by induction;
    their tangential derivatives recover all mixed jets. The remaining normal metric components and normal
    connection component are fixed by the coordinate and gauge choices. ◻
]

=== 2.2 A common cap and its Green matrices <a-common-cap-and-its-green-matrices>

Jet equality does not assert equality in an interior collar.
  It provides instead a common smooth extension on the exterior side of a smaller patch.
  The following variational argument turns that exterior region into common interior data.

#thm([Proposition 2.2.])[
  (Common exterior sources).  #emph[There are compact connected smooth extensions $N_j$ of the original manifold,
    with nonempty smooth boundary, and a common connected open exterior cap $E subset N_j^compose$,
    attached through a nonempty open patch $P subset.double Gamma$,
    such that the extended metrics and connections agree on $E$.
    For each $f in C_c^oo \( E \; bb(C)^2 \)$, the solutions $L_(j \, D)^(- 1) f$ agree on $E$.
    The Dirichlet Green matrices, normalized using metric volume, satisfy
#[#set math.equation(numbering: n => "(2.4)")
 $ G_1 \( x \, y \) = G_2 \( x \, y \) quad \( x \, y in E \, med x eq.not y \) \, wide G_j \( x \, y \) =
   G_j \( y \, x \)^(*) . $ <bdy:common-green>]

]
] <bdy:cap>

#proof[
  Choose a boundary chart compactly contained in $Gamma$, and a nonnegative smooth bump $b$ whose support is
    compact in that chart and whose positivity set $P = { b > 0 }$ is nonempty and connected.
    Using the separate normal collars, move the boundary from $s = 0$ to the graph $s = - b \( z \)$,
    with $b$ small enough to remain inside an extended collar. The common open cap is
  $ E = { \( z \, s \) : - b \( z \) < s < 0 } . $
  Extend the first coefficient fields smoothly to negative $s$,
    retaining positive definiteness of the metric and skew-Hermitian values of the connection.
    Use the same exterior extension for the second pair. Lemma 2 makes the resulting pasting smooth to all orders
    on a neighborhood of $"supp" b$. Restricting it to $s gt.eq -
    b \( z \)$ gives smoothness also at the flat edges of the bump.
    The bundles remain trivial in the extended normal gauges.
  For the energy comparison only, identify the extensions by the identity on the original $M$ and by cap
    coordinates on $E$. In collar charts this map and its inverse are continuous and piecewise smooth with bounded
    first derivatives, and hence bi-Lipschitz. They identify the relevant $H_0^1$ spaces.
    Fix a vector source $f$ compactly supported in $E$. The solution $w_j =
    L_(j \, D)^(- 1) f$ is the unique minimizer of
  $ cal(J)_j \( w \) = 1 / 2 integral_(N_j) \| d_(A_j) w \|_(g_j)^2 thin d V_(g_j) -
    "Re" integral_E chevron.l f \, w chevron.r thin d V_(g_j) quad upright("on ") H_0^1 \( N_j \; bb(C)^2 \) . $
  Its trace on the original boundary is smooth and supported in $"supp" b subset.double Gamma$,
    because the original and extended boundaries coincide wherever $b = 0$.
    Transport $w_1$ to $N_2$, and inside the original $M$ replace it by the second harmonic extension of this
    trace. The replacing difference has zero trace on $partial M$, so its zero extension is in $H_0^1 \( N_2 \)$.
    The competitor is therefore admissible even at the narrowing edges of the cap.
  On $M$, the source is zero and $w_1$ is the first harmonic extension of its trace.
    Equality of the measured quadratic forms makes its interior energy equal to that of the replacement.
    On $E$, both coefficients and the source pairing are unchanged. Thus $min cal(J)_2 lt.eq min cal(J)_1$.
    Reversing the argument gives equality, and uniqueness of the minimizer proves $w_1 = w_2$ on $E$.
  Normalize the Green matrix by
  $ L_(j \, x) G_j \( x \, y \) = delta_y^(g_j) \( x \) I \, wide G_j \( dot.op \, y \) \|_(partial N_j) = 0 \,
    wide L_(j \, D)^(- 1) f \( x \) = integral_(N_j) G_j \( x \, y \) f \( y \) thin d V_(g_j) \( y \) . $
  The source densities on $E$ coincide. Varying the source gives equality of the distribution kernels on $E times
    E$, hence pointwise equality off the diagonal. Self-adjointness of the Dirichlet inverse gives the adjoint
    symmetry in (2.4). ◻
]

=== 2.3 Evaluations identify points and fibers <evaluations-identify-points-and-fibers>

Fix a nonempty open set $U_0 subset.double E$. For $f in C_c^oo \( U_0 \; bb(C)^2 \)$, set

#[#set math.equation(numbering: n => "(2.5)")
 $ w_(j \, f) = L_(j \, D)^(- 1) f \, wide I_j \( p \) f = w_(j \, f) \( p \) . $ <bdy:source-evaluations>]

Thus $I_j \( p \)$ is a linear map from the common source space to the fiber at $p$. The maps agree on $E$.
  This construction is related to the source and Poisson embeddings of #cite(label("LLS20")) Section 6.1 and
  Appendix A. The following point-distribution proof, in the spirit of #cite(label("Malgrange1956")) Chapter III,
  Section 3, supplies the precise system-valued separation needed here.

#thm([Lemma 2.3.])[
  (Values and harmonic two-jets).  #emph[Let $N$ be a compact connected smooth manifold of dimension $n gt.eq
    2$ with nonempty boundary, let $L = d_A^(* g) d_A$, and let $U subset.double
    N^compose$ be a nonempty open source set.]
  + #emph[At each interior point, $f mapsto L_D^(- 1) f \( p \)$ is onto $bb(C)^2$.
    At any two distinct interior points the two values are jointly onto $bb(C)^2 xor bb(C)^2$.]
  + #emph[If $p in.not overline(U)$, the second jets of $L_D^(- 1)
    f$ at $p$ fill exactly the linear space of jets satisfying $L u \( p \) = 0$.]
  + #emph[Each evaluation is zero on $partial N$, and for fixed $f$ varies continuously up to that boundary.]
] <bdy:evaluations>

#proof[
  The last assertion is smooth Dirichlet regularity. For the first two,
    a complex-linear functional on values or jets is represented by a dual-vector distribution $T$,
    supported at one or two points. Suppose it annihilates all source solutions,
    and define $v = \( L_D^(- 1) \)^t T$ by distributional transposition. Then
  $ chevron.l v \, f chevron.r = chevron.l T \, L_D^(- 1) f chevron.r =
    0 quad \( f in C_c^oo \( U \; bb(C)^2 \) \) \, wide L^t v = T . $
  Here the transpose and pairing are bilinear on the dual bundle; no complex conjugation convention is needed.
    Elliptic regularity makes $v$ smooth off the support of $T$.
    The interior with one or two points removed is connected:
    a path can be diverted around each point in a punctured coordinate ball when $n gt.eq 2$.
    Unique continuation from the nonempty set obtained by removing these points from $U$ makes $v$ supported at
    those points in the interior. If a point belongs to $U$, the asserted initial vanishing is distributional
    there as well.
  At each support point a distribution is a finite sum of derivatives of the point mass.
    If its highest derivative order is $k$, its image under $L^t$ has exact highest order $k + 2$.
    Indeed, the highest homogeneous coefficient vector polynomial is multiplied by the scalar elliptic quadratic
    polynomial; this multiplication is injective. Consequently no nonzero order-zero distribution can be the image
    of a point-supported distribution. There are therefore no value annihilators, proving both surjectivity claims.
  For a two-jet annihilator at $p in.not overline(U)$, the image $T$ has order at most two.
    Thus $v = c delta_p$, with $c$ a dual-fiber vector. Its image is precisely the functional $u mapsto
    c \( L u \( p \) \)$. Conversely all such functionals annihilate the source solutions.
    Finite-dimensional duality gives the exact stated jet space.
    In particular, values and gradients may be prescribed freely,
    since the Hessian trace can be chosen to satisfy the equation. ◻
]

We can now define the correspondence whose continuation will prove the theorem.
  A #emph[match] consists of a local isometry $Phi : W arrow.r N_1^compose$,
  with $W subset N_2^compose$ connected, open, and containing $E$,
  and a smooth unitary bundle map $J$ from the second fiber at $p$ to the first fiber at $Phi \( p \)$. We require

#[#set math.equation(numbering: n => "(2.6)")
 $ Phi \|_E = "Id" \, wide J \|_E = I \, wide d_(Phi^(*) A_1) \( J u \) = J d_(A_2) u \, wide
   J \( p \) I_2 \( p \) = I_1 \( Phi \( p \) \) . $ <bdy:matching>]

In the connection identity the first connection is pulled back to $W$. The identity on $E$ is a match.

#thm([Lemma 2.4.])[
  (The maximal match).  #emph[All matches agree on overlaps and are injective on base points.
    Their union is a unique maximal match $\( Phi \, J \)$ on a connected open set $W subset N_2^compose$. On this set,
#[#set math.equation(numbering: n => "(2.7)")
 $ G_1 \( Phi \( p \) \, Phi \( q \) \) = J \( p \) G_2 \( p \, q \) J \( q \)^(*)
   wide \( p \, q in W \, med p eq.not q \) . $ <bdy:matched-green>]

]
] <bdy:matches>

#proof[
  If two possible images of the same point were distinct, their evaluation identities would impose a fixed
    invertible linear relation between the evaluations at two distinct points of $N_1^compose$.
    This contradicts joint surjectivity in Lemma 4. Once the image agrees,
    surjectivity at the source point determines $J$ uniquely.
    The same argument using the evaluations in $N_2$ rules out two base points with the same image.
    Thus the maps glue on every overlap. Their union is connected because every domain contains $E$,
    and retains all the properties in (2.6).
  For fixed $p$, the evaluation identity and the common source density give (2.7) when $q in U_0$,
    away from the pole. As a function of $q$, the adjoint of each side solves the same pulled-back connection
    equation after the bundle identification. Injectivity of $Phi$ ensures that $q = p$ is the only possible pole.
    Unique continuation on the connected set $W \\ { p }$ proves the identity everywhere claimed. ◻
]

=== 2.4 Coordinates at a possible interior frontier <coordinates-at-a-possible-interior-frontier>

It remains to show that the maximal domain is the entire interior.
  We next prepare the local data needed to enlarge it. The use of harmonic #emph[frames] is essential:
  constant coefficient columns in these frames solve the equation,
  even when the connection has no nonzero parallel sections.

#thm([Proposition 2.5.])[
  (Contact data).  #emph[If the maximal domain $W$ has an interior frontier,
    there are a point $p in partial W ∩ N_2^compose$, a point $q in N_1^compose$, and charts about $p \, q$,
    both with coordinate range a neighborhood of $0 in bb(R)^n$, with the following properties.]
  + #emph[Both charts avoid $overline(U_0)$. The old match is coordinate identity on its domain in these charts.
    That domain contains a region $x_n < kappa \( x' \)$, where $kappa$ is smooth, $kappa \( 0 \) = 0$,
    and $d kappa \( 0 \) = 0$.]
  + #emph[In smooth local unitary frames, the metrics, connection matrices,
    and Green matrices agree on the known region (for the Green matrices, on its square off the diagonal),
    and $g_1 \( 0 \) = g_2 \( 0 \) = I_n$.]
  + #emph[There are invertible matrix functions $F_j$ with harmonic columns,
    chosen as corresponding source solutions. In these harmonic frames there are corresponding harmonic matrix
    functions $X_j^l$, $1 lt.eq l lt.eq n$, satisfying
#[#set math.equation(numbering: n => "(2.8)")
 $ 1 / 2 "Re" "tr" X_j^l \( x \) = x^l \, wide X_j^l \( 0 \) = 0 \, wide partial_i X_j^l \( 0 \) =
   delta_i^l I . $ <bdy:trace-coordinates>]

]
  + #emph[There are finitely many further corresponding harmonic column functions with zero value and gradient at
    $0$, whose Hessians at $0$ span the space of symmetric $bb(C)^2$-valued tensors $H$ satisfying $sum_i
    H_(i i) = 0$. All these paired functions, including the frames,
    agree on the known region and have identical jets at $0$.]
] <bdy:contact>

#proof[
  Choose a small coordinate ball near an interior frontier and a point of $W$ close enough to that frontier that
    its distance to the complement is attained inside the chart.
    The Euclidean ball with that center and radius lies in $W$ and touches its complement at an interior point
    $p$. Its boundary gives the required smooth one-sided contact hypersurface.
  If $p_k in W$ tends to $p$, compactness of $N_1$ and $U \( 2 \)$, using the fixed global trivializations,
    gives a subsequence for which $Phi \( p_k \) arrow.r q$ and $J \( p_k \) arrow.r J_0$.
    Continuity of every source solution gives
  #[#set math.equation(numbering: n => "(2.9)")
   $ J_0 I_2 \( p \) = I_1 \( q \) . $ <bdy:limit-match>]
  The point $q$ cannot lie on the boundary, where the right side would be zero, since $I_2 \( p \)$ is onto.
    Two distinct possible limits $q$ contradict joint surjectivity on $N_1$; at a fixed $q$,
    surjectivity of $I_2 \( p \)$ determines $J_0$. The full limits therefore exist. Also $q in.not E$:
    otherwise its identity match on $E$ and (2.9) would relate the evaluations at the distinct points $q \,
    p$ of $N_2$. Both $p$ and $q$ consequently avoid $overline(U_0)$.
  Choose two source solutions whose columns give an invertible matrix $F_1 \( q \)$.
    Their corresponding second-side columns give $F_2 \( p \)$, invertible by (2.9).
    Shrink the charts so both matrices are invertible. In a harmonic frame, $v =
    F_j^(- 1) w$ satisfies an equation with scalar elliptic principal part and no zeroth-order term,
    since every column of $F_j$ is harmonic. Lemma 4 is invariant under this smooth frame change.
    It therefore supplies matrices $X_1^l$ with value zero and gradients equal to any chosen real coordinate
    covectors times $I$. Choose those covectors independently,
    and let $X_2^l$ be the corresponding source matrices expressed in $F_2$.
  Set $x^l = 1 / 2 "Re" "tr" X_1^l$ and $y^l = 1 / 2 "Re" "tr" X_2^l$.
    The first functions form coordinates at $q$. On matched points, the source identity implies $J F_2 =
    F_1 compose Phi$ and $X_2^l = X_1^l compose Phi$. Thus the scalar coordinates and the metric Gram matrices of
    their differentials agree under the isometry. Passing to $p \, q$,
    their Gram matrices agree and are positive definite. Hence the $y^l$ are coordinates at $p$.
    Fix a target chart neighborhood $U_1$ on which the $x^l$ are coordinates.
    The full convergence of partner points permits a source chart neighborhood $U_2$ so small that
    $Phi \( W ∩ U_2 \) subset U_1$. Choose a small coordinate ball $Omega$ about zero contained in both
    $x \( U_1 \)$ and $y \( U_2 \)$, and restrict the two charts to their inverse images of $Omega$.
    For a matched point in the restricted source chart, $x \( Phi \( p' \) \) = y \( p' \) in Omega$;
    its partner therefore lies in the restricted target chart.
    Thus the old map is coordinate identity throughout its domain in these charts.
    The matrix gradient identity at $q$ now reads $partial_i X_1^l \( 0 \) = delta_i^l I$;
    equality on the one-sided region and smoothness give the same identity for $X_2^l$.
  Because the harmonic-frame equation has no zeroth-order term,
    a jet with zero value and gradient is constrained only by $g_1^(i j) \( 0 \) H_(i j) = 0$.
    The jet lemma supplies a finite basis of these Hessians and corresponding source pairs.
    They agree on the known region, so their complete jets agree at the contact point.
    The same conclusion holds for every smooth coefficient or paired function already identified there.
  Finally polar-orthonormalize the original harmonic frames:
    write $F_j = H_j S_j$, with $H_j$ unitary and $S_j$ positive Hermitian.
    On the matched set, $J F_2 = F_1$ implies $S_2 = S_1$ and $J H_2 = H_1$.
    In the unitary frames $H_j$, the old bundle identification is therefore $I$;
    connection matrices and Green matrices agree there. We continue to write $F_j$ for the harmonic-frame matrices
    in these unitary frames. A common real linear coordinate change makes the metric at zero Euclidean and the
    contact hyperplane horizontal. Apply the same linear change to the list of $X_j^l$;
    this preserves all identities in (2.8). Reverse the final normal coordinate if necessary to put the known side
    below its graph. In these coordinates the Hessian constraint is the one in the statement. ◻
]

=== 2.5 Dilation of the contact data <bdy:dilation>

The local analysis uses the preceding charts on a small physical scale and a fixed coordinate range.
  For $lambda > 0$, set

#[#set math.equation(numbering: n => "(2.10)")
 $ g_(j \, lambda) \( x \) & = g_j \( lambda x \) \, & A_(j \, lambda) \( x \) & = lambda A_j \( lambda x \) \,\
G_(j \, lambda) \( x \, y \) & = lambda^(n - 2) G_j \( lambda x \, lambda y \) \, & F_(j \, lambda) \( x \) & =
  F_j \( lambda x \) . $ <bdy:dilation-formulas>]

Here the metric normalization is $lambda^(- 2)$ times the pullback metric.
  Thus the pulled-back connection Laplacian is multiplied by $lambda^2$,
  and the factor $lambda^(n - 2)$ in the kernel exactly compensates for metric volume.
  In particular the displayed kernel still has unit matrix point source for $g_(j \, lambda)$.
  Harmonic functions and the harmonic frames dilate by composition, without a multiplicative factor.

On every fixed bounded coordinate range, these metrics converge smoothly to $I_n$,
  the connection matrices converge smoothly to zero, and all fixed finite orders of their coefficients and frames
  remain bounded. Source-free harmonic-frame operators have zero zeroth-order terms;
  their ordinary-coordinate first-order coefficients tend to zero.
  The known side becomes $x_n < lambda^(- 1) kappa \( lambda x' \)$,
  which contains every fixed bounded region lying strictly below $x_n = 0$ for all sufficiently small $lambda$.

We also have uniform kernel bounds on fixed separated sets.
  An interior parametrix of order $- 2$ for the original smooth scalar-principal system gives $\|
  G_j \( x \, y \) \| lt.eq C \| x - y \|^(2 - n)$ in a sufficiently small fixed chart, with a smooth remainder;
  interior estimates give the corresponding bounds for derivatives away from the diagonal.
  After (2.10), every fixed positive lower bound for $\| x -
  y \|$ therefore gives bounds of any prescribed finite order, uniformly for small $lambda$.
  The local constructions below first specify their bounded ranges and positive separation margins and then
  restrict $lambda$. They never demand a bound uniform as the separation tends to zero from this initialization alone.

For the local argument, our convention for a normalized equation in a harmonic frame is

#[#set math.equation(numbering: n => "(2.11)")
 $ cal(L)_j v = - c_j F_j^(- 1) L_(g_j \, A_j) \( F_j v \) \, wide c_j > 0 . $ <bdy:harmonic-normalization>]

The scalar multiplier acts outside the differential operator.
  Its second-derivative coefficient matrix is $c_j g_j^(- 1)$, and its zeroth-order term is zero.
  This convention applies to both the original and the dilated data; the functions $c_j$ will be chosen in Section 4.

The remaining local task is to continue the match through zero.
  Sections 3–6 will prove that the metrics are conformal and that suitable normalizations (2.11) give equal
  operators on a neighborhood of zero. Section 7 will then use the vanishing zeroth-order terms to remove the
  conformal factor and prove that $F_1 F_2^(- 1)$ is a unitary connection identification.
  Unique continuation extends every source evaluation, so the local identification enlarges the maximal match.

== 3 Continuation of solutions in two variables <cross:section>

The local data give a matrix Green kernel when at least one variable lies in the region where the two structures
  already agree. We must continue this kernel to separated pairs outside that region.
  This section proves the required continuation for elliptic systems acting on separate tensor indices.
  The geometric construction and its scalar analytic foundation are those of #cite(label("ScalarCompanion2026"))
  Section 3; we reproduce the argument, including the interpolation and overlap constructions,
  and make the extension to systems explicit. No scalar inverse-problem uniqueness theorem is used.

=== 3.1 Separate equations and extension from a cross <separate-equations-and-extension-from-a-cross>

Let $V_i$ be finite-dimensional Hermitian vector spaces. In a coordinate domain in $bb(R)^n$, consider an operator

$ sans(L)_i = - Delta_(g_i) I_(V_i) + C_i^a partial_a + D_i \, $

where $g_i$ is a smooth Riemannian metric and $C_i^a \, D_i$ are smooth endomorphism-valued coefficients.
  A #emph[product solution] is a $V_1 ⊗ V_2$-valued function $F \( x \, y \)$ satisfying

$ \( sans(L)_1^x ⊗ I \) F = 0 \, wide \( I ⊗ sans(L)_2^y \) F = 0 . $

We suppress the identity factors below. The coefficients of one equation act only on its indicated tensor index
  and depend only on its indicated variable. In particular, the two equations commute.
  Their sum has scalar real elliptic principal part on the product;
  ordinary unique continuation therefore identifies product solutions that agree on a nonempty open subset of a
  connected common domain. Multiplication of either equation by a positive scalar function does not change its
  solutions or any continuation constructed from them.

For matrix Green kernels the first tensor factor is the output fiber.
  The second is the conjugate of the input fiber: the equation in $y$ is obtained by conjugating the coefficients
  of the second connection Laplacian. Equivalently, the adjoint columns of the kernel solve the second equation.
  This convention places the two matrix actions on separate indices, as required here.

The first construction extends compatible data on $\( D_1 times S_2 \) union \( S_1 times D_2 \)$.
  Its mechanism is a basis that is orthogonal both on a large domain and after restriction to the observed set.
  Common-basis methods have a classical antecedent in separately harmonic extension #cite(label("Zeriahi1982"));
  singular systems also enter quantitative Runge approximation #cite(label("RulandSalo2019")).
  The interpolation threshold and the construction below follow the scalar companion.

#thm([Lemma 3.1.])[
  (Extension from a cross).  #emph[Let $D_i$ be bounded connected coordinate domains,
    and let $S_i subset.double D_i$ be nonempty open sets. Suppose a product solution $F$ is given consistently on
$ \( D_1 times S_2 \) union \( S_1 times D_2 \) \, $

 with the sum of its two $L^2$ norms at most $M$. Suppose $O_i subset.double
   D_i$ are open sets and every $V_i$-valued solution $w$ of $sans(L)_i w = 0$ on $D_i$ satisfies
#[#set math.equation(numbering: n => "(3.1)")
 $ parallel w parallel_(L^2 \( O_i \)) lt.eq C parallel w parallel_(L^2 \( S_i \))^(gamma_i) parallel w
   parallel_(L^2 \( D_i \))^(1 - gamma_i) \, wide 0 < gamma_i < 1 \, wide gamma_1 +
   gamma_2 > 1 . $ <cross:interpolation-input>]

 Then $F$ extends as a product solution to $O_1 times O_2$,
   agreeing with the two given pieces on their intersections.
   Its $C^m$ norm on every compact subset of the output product is at most $C_m M$.
   These constants are uniform when geometric margins, ellipticity, the required coefficient bounds,
   interpolation constants, and a positive lower bound for $gamma_1 + gamma_2 - 1$ are uniform.
   A specified output order requires only finitely many coefficient bounds.]
] <cross:series>

#proof[
  Let $cal(H)_1 \( D_1 \)$ be the closed subspace of $L^2 \( D_1 \; V_1 \)$ consisting of distributional
    $sans(L)_1$-solutions. Restriction $R : cal(H)_1 \( D_1 \) arrow.r
    L^2 \( S_1 \; V_1 \)$ is compact by interior elliptic estimates and is injective by unique continuation.
    The spectral theorem for $R^(*) R$ gives an orthonormal basis $\( w_j \)$ of $cal(H)_1 \( D_1 \)$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ \( w_i \, w_j \)_(L^2 \( S_1 \)) = mu_j^2 delta_(i j) \, wide 0 < mu_j lt.eq 1 . $ <cross:singular-values>]
  For every $N$ there is a uniform constant $C_N$ with
  #[#set math.equation(numbering: n => "(3.3)")
   $ mu_j lt.eq C_N \( 1 + j \)^(- N) . $ <cross:singular-decay>]
  Indeed, multiply a solution by a cutoff equal to one near $overline(S_1)$ and compactly supported in $D_1$.
    Interior estimates bound its $H^k$ norm by its $L^2 \( D_1 \)$ norm.
    Fourier truncation in a containing cube, component by component,
    gives an approximation of rank $O \( A^n \)$ and error $O \( A^(- k) \)$.
    The minimax characterization of singular values yields $mu_j lt.eq C_k j^(- k \/ n)$.
    The fixed fiber dimension changes only the constants.
  For $y in S_2$, expansion in the first variable gives
  $ F \( x \, y \) = sum_j w_j \( x \) ⊗ b_j \( y \) \, wide parallel b_j parallel_(L^2 \( S_2 \; V_2 \)) lt.eq M . $
  Contracting the first tensor index against $overline(w_j)$ extends the coefficients to $D_2$:
  #[#set math.equation(numbering: n => "(3.4)")
   $ b_j \( y \) = mu_j^(- 2) integral_(S_1) sum_alpha overline(w_(j \, alpha) \( x \)) F_alpha \( x \, y \) thin
     d x \, wide parallel b_j parallel_(L^2 \( D_2 \; V_2 \)) lt.eq M mu_j^(- 1) . $ <cross:coefficient-extension>]
  Here $F_alpha \( x \, y \) in V_2$ are the first-index components in an orthonormal basis of $V_1$;
    the displayed contraction leaves a vector in $V_2$. Because the second system acts on that remaining index,
    $sans(L)_2 b_j = 0$. Restriction orthogonality proves that this formula agrees with the original coefficient
    on $S_2$. The assumed interpolation gives
  $ parallel w_j parallel_(L^2 \( O_1 \)) lt.eq C mu_j^(gamma_1) \, wide
    parallel b_j parallel_(L^2 \( O_2 \)) lt.eq C M mu_j^(gamma_2 - 1) . $
  Thus the tensor series converges absolutely in $L^2 \( O_1 times O_2 \)$:
    the norm of its $j$th term is at most $C M mu_j^(gamma_1 + gamma_2 - 1)$,
    and (3.3) makes these bounds summable. The limit solves both equations distributionally.
    Interior estimates for their elliptic sum give smoothness and the claimed bounds.
  Agreement on the second arm requires a completeness check.
    Take $z in L^2 \( S_1 \; V_1 \)$ orthogonal to the closure of $R cal(H)_1 \( D_1 \)$. The $V_2$-valued function
  $ y mapsto integral_(S_1) sum_alpha overline(z_alpha \( x \)) F_alpha \( x \, y \) thin d x $
  solves the second system and vanishes on $S_2$, hence vanishes on connected $D_2$.
    Every second-arm slice therefore belongs to the closed restricted range.
    Its expansion in the orthonormal basis $w_j \/ mu_j$ is complete, with coefficients $mu_j b_j \( y \)$.
    Consequently the series equals $F$ on $S_1 times O_2$; it converges there by the positive exponent $gamma_2$.
    On $O_1 times S_2$ it is the original expansion, converging with exponent $gamma_1$.
    These establish both required agreements. Only upper bounds for $mu_j$ have been used,
    so uniformity does not require continuous choices of singular bases or lower bounds on singular values. ◻
]

The remaining issue is geometric: we must place two observed sets so that the interpolation exponents add to more
  than one. Strict Carleman weights will supply those exponents from a curvature condition on the boundary of the
  region where the product solution is known.

=== 3.2 A geometric criterion for local extension <a-geometric-criterion-for-local-extension>

We next build the interpolation estimates needed in Lemma 7.
  For a metric $g$, call a smooth real function $theta$ a #emph[strict weight] at a point where $d theta eq.not 0$ if

#[#set math.equation(numbering: n => "(3.5)")
 $ "Hess"_g theta \( e \, e \) + "Hess"_g theta \( v \, v \) > 0 quad upright("for all ") v perp e \,
   med \| v \|_g = 1 \, wide e = frac(nabla^g theta, \| nabla^g theta \|_g) . $ <cross:strict-weight>]

For the system $sans(L) = - Delta_g I + C^a partial_a + D$, the strict Carleman estimate gives,
  after shrinking the coordinate neighborhood,

#[#set math.equation(numbering: n => "(3.6)")
 $ tau^3 parallel e^(tau theta) w parallel_(L^2)^2 + tau parallel nabla \( e^(tau theta) w \) parallel_(L^2)^2
   lt.eq C parallel e^(tau theta) sans(L) w parallel_(L^2)^2 \, wide tau gt.eq tau_0 \, $ <cross:carleman>]

for compactly supported vector-valued $w$. All norms sum over the fiber components.
  The scalar form is the elliptic strict-weight estimate of the classical Carleman theory;
  see #cite(label("HormanderIV2009")) Chapter XXVIII and #cite(label("KochTataru2005")) Definition 8.3 and
  Theorem 9(a). We recall its energy proof to record the system dependence.
  First take one scalar component and $sans(L) = - Delta_g$, write $v = e^(tau theta) w$ and

$ e^(tau theta) sans(L) e^(- tau theta) = A_tau + B_tau \, wide A_tau = - Delta_g - tau^2 \| d theta \|_g^2 \,
  quad B_tau = tau \( 2 nabla^g theta dot.op nabla + Delta_g theta \) . $

Here $A_tau$ is self-adjoint and $B_tau$ is skew-adjoint for metric volume. Integration by parts gives

$ parallel \( A_tau + B_tau \) v parallel^2 & = parallel A_tau v parallel^2 +
  parallel B_tau v parallel^2 + \( \[ A_tau \, B_tau \] v \, v \) \,\
\( \[ A_tau \, B_tau \] v \, v \) & = 4 tau integral "Hess"_g theta \( nabla v \, nabla overline(v) \) +
  4 tau^3 integral "Hess"_g theta \( nabla theta \, nabla theta \) \| v \|^2 -
  tau integral \( Delta_g^2 theta \) \| v \|^2 . $

Choose a real constant $m$ strictly between the negative of the least unit tangential Hessian value and the unit
  normal Hessian value. After shrinking the patch, these inequalities have a positive margin.
  Add $4 m tau \( A_tau v \, v \)$ to the commutator form. Its gradient coefficient becomes $4
  tau \( "Hess"_g theta + m g \)$, and its leading zero-order coefficient is

$ 4 tau^3 \| d theta \|_g^2 #scale(x: 120%, y: 120%)[\(] "Hess"_g theta \( e \, e \) -
  m #scale(x: 120%, y: 120%)[\)] > c tau^3 . $

The tangential gradient form is positive. Its mixed and possibly negative normal terms cost at most $C tau
  parallel nabla_e v parallel^2$, and

$ parallel nabla_e v parallel^2 lt.eq C tau^(- 2) parallel B_tau v parallel^2 + C parallel v parallel^2 . $

Finally $\| 4 m tau \( A_tau v \, v \) \| lt.eq 1 / 2 parallel A_tau v parallel^2 +
  C tau^2 parallel v parallel^2$. For large $tau$, the squared parts absorb the normal derivative cost and the
  positive zero-order term absorbs the remaining errors. This yields the scalar estimate.
  Summing it over components gives the estimate for $- Delta_g I$.
  The conjugated matrix lower-order terms have norm at most
  $C \( parallel nabla v parallel + tau parallel v parallel \)$,
  so their squared norm is absorbed by the $tau$ and $tau^3$ terms after increasing $tau_0$.
  This proves (3.6) for the stated systems. The constants are uniform on compact sets of strict weights,
  with fixed positive strictness margins and bounded matrix coefficients.
  The scalar cutoff commutators used below act componentwise,
  and interior estimates for these systems have the same orders as in the scalar case.

The existence criterion below is the geometric criterion of #cite(label("ScalarCompanion2026")) Section 3,
  “A geometric criterion for local extension”. Its geometric proof depends only on the principal metrics.
  The system estimate just proved and Lemma 7 provide the analytic steps in the present setting.
  All gradients, lengths, orthogonality relations, and Hessians in its statement use the principal metrics $g_1 \,
  g_2$ and their product connection.

#thm([Proposition 3.2.])[
  (Product extension criterion).  #emph[Let $rho$ be smooth near $z_0 = \( x_0 \, y_0 \)$, with $rho \( z_0 \) =
    0$ and $d_x rho \, d_y rho eq.not 0$. Put
$ a_i = frac(nabla_i rho, \| nabla_i rho \|^2) \, wide H = "Hess" rho . $

 Suppose that at $z_0$
#[#set math.equation(numbering: n => "(3.7)")
 $ H \( \( a_1 \, - a_2 \) \, \( a_1 \, - a_2 \) \) + H \( \( v_1 \, v_2 \) \, \( v_1 \, v_2 \) \) > 0 quad
   (v_i perp a_i \, med \| v_i \| = \| a_i \|) . $ <cross:hessian-test>]

 Every product solution given on ${ rho > 0 }$ near $z_0$ extends to a neighborhood of $z_0$,
   agreeing on a smaller part of that side. In fact, the construction uses only two compact product sets in ${
   rho > epsilon }$ for some $epsilon > 0$. The neighborhoods and estimates on smaller neighborhoods are uniform
   under small smooth perturbations preserving the strict hypotheses,
   provided the data on those compact sets are bounded.]
] <cross:criterion>

#proof[
  We first split the product Hessian condition into a strict weight in each factor.
    Their sum will lie below a defining function for the given side, with a quadratic gap.
    That gap places two intersecting product sets in the given side;
    the weights then yield interpolation exponents greater than one half, allowing Lemma 7 to apply.
  ===== 3.2.1 Splitting the weight between the factors. <splitting-the-weight-between-the-factors.>
  We seek symmetric forms $P_i$ satisfying
  $ P_i \( a_i \, a_i \) + P_i \( v_i \, v_i \) > 0 \, wide H + K thin d rho^(⊗ 2) > P_1 xor P_2 $
  for some $K > 0$, with the vectors $v_i$ as in (3.7). After division by $\| a_i \|^2$,
    the first inequality is the strict-weight condition for a function with gradient $nabla_i
    rho$ and Hessian $P_i$. The second inequality will give the quadratic gap.
    To obtain these forms by convex separation, the dual tests are positive semidefinite forms $D$ whose diagonal
    blocks are
  $ d_i a_i^(⊗ 2) + S_i \, wide d_i gt.eq 0 \, quad S_i gt.eq 0 upright(" on ") a_i^perp \, quad "tr" S_i =
    d_i \| a_i \|^2 . $
  This follows by separating the open convex cone consisting of positive definite forms plus the allowed $P_1 xor
    P_2$; the individual dual cones are generated by $a_i^(⊗ 2) + v_i^(⊗ 2)$. Normalize $"tr" D = 1$.
    To obtain a suitable $K$, it suffices by compactness to prove $H : D > 0$ on tests with $D thin d rho = 0$.
  Represent such a $D$ as a covariance matrix. The normal components measured by the two partial covectors are
    opposite. The diagonal-block condition makes each normal component uncorrelated with its own tangential
    component, hence with both tangential components. Their variances coincide, giving $d_1 = d_2 = d > 0$ and
  $ D = d \( a_1 \, - a_2 \)^(⊗ 2) + D_perp \, wide "tr" \( D_perp \)_(i i) = d \| a_i \|^2 . $
  The case $d = 0$ would force $D = 0$. Among nonnegative tangential forms with these two fixed traces,
    every extreme point has rank one: on an image of rank $r gt.eq 2$,
    a nonzero symmetric perturbation preserves the two traces because $r \( r + 1 \) \/ 2 > 2$,
    and small perturbations of both signs preserve positivity.
    The rank-one tests are precisely those in (3.7), multiplied by $d$. The asserted positivity follows.
    Compactness of the normalized tests then supplies $K$, as required.
  Prescribe partial covectors $d_x rho \, d_y rho$ and Hessians $P_i$ for smooth functions $theta_i$ vanishing at
    the respective points. In small coordinates centered there, Taylor expansion gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ theta_1 \( x \) + theta_2 \( y \) lt.eq tilde(rho) \( x \, y \) - c \( \| x \|^2 + \| y \|^2 \) \, wide
     tilde(rho) = rho + K rho^2 \/ 2 \, $ <cross:quadratic-gap>]
  with $c > 0$. Each $theta_i$ satisfies (3.5). The positive side of $tilde(rho)$ is the positive side of $rho$ in
    this neighborhood.
  ===== 3.2.2 Placing the cross and obtaining interpolation. <placing-the-cross-and-obtaining-interpolation.>
  Use coordinates $\( s_i \, z_i \)$ with $s_i = theta_i$. Fix a small $kappa > 0$ so that $phi.alt \( s_i \) =
    s_i - kappa s_i^2$ remains a strict weight. Choose successively a small lateral radius $R$,
    a height $l lt.double c R^2$, and $e lt.double kappa l^2$. Take
  $ D_i = { - l < s_i < l + 4 e \, med \| z_i \| < R } . $
  Use a cutoff equal to one on the inner lateral half and for $- l + 3 e < s_i < l + 2 e$,
    supported in the cylinder and in $- l + 2 e < s_i < l + 3 e$.
    Let $S_i subset.double D_i$ include neighborhoods of its top and lateral derivative supports, where respectively
  $ s_i > l + e \/ 2 quad upright("or") quad \| z_i \| > R \/ 3 \, $
  and an inner top slice near $s_i = l + 5 e \/ 4$. The two closed product sets $overline(D_1 times S_2)$ and
    $overline(S_1 times D_2)$ lie strictly in the given side.
    For a top slice, the sum of the two $s$ coordinates is positive.
    For a lateral slice, it is greater than $- 2 l$, which is dominated by the quadratic gap in (3.8).
    Making the sets slightly smaller if necessary gives a common $epsilon > 0$ with $rho > epsilon$ on their closures.
  For an $sans(L)_i$-solution normalized by $parallel w parallel_(L^2 \( D_i \)) = 1$,
    apply (3.6) to this cutoff times $w$. Interior estimates bound the bottom derivative terms using the large
    norm and the weight $phi.alt \( - l + 3 e \)$. The remaining derivative terms use $parallel w
    parallel_(L^2 \( S_i \))$ and a weight at most $phi.alt \( l + 3 e \)$.
    On a smaller inner cylinder beginning at $s_i = - e$, the weight is at least $phi.alt \( - e \)$.
    Balancing the two exponentials yields (3.1) with
  #[#set math.equation(numbering: n => "(3.9)")
   $ gamma_i =
     frac(phi.alt \( - e \) - phi.alt \( - l + 3 e \), phi.alt \( l + 3 e \) - phi.alt \( - l + 3 e \)) > 1 /
     2 . $ <cross:exponent>]
  Indeed at $e = 0$ the quotient is $1 \/ 2 + kappa l \/ 2$.
    Values of the balancing parameter below $tau_0$ are covered by increasing the constant.
    The output cylinder may be chosen to include a connected tube from the origin to the indicated top slice.
  ===== 3.2.3 Constructing and identifying the extension. <constructing-and-identifying-the-extension.>
  Lemma 7 now gives a product solution on a neighborhood of $z_0$.
    It agrees with the old solution there on the positive side:
    from a sufficiently near positive-side point, increase $s_2$ into the top slice.
    Since $partial_(s_2) rho > 0$ locally, the segment stays on that side and in the larger constructed cylinder.
    Agreement on the slice and unique continuation along a neighborhood of the segment prove agreement at the
    original point. All choices have strict margins. Keeping their finitely many compact sets and shrinking their
    output neighborhoods once proves the stated perturbation uniformity by (3.6),
    Lemma 7 and interior elliptic estimates. ◻
]

=== 3.3 Gluing along a compact family of surfaces <gluing-along-a-compact-family-of-surfaces>

Proposition 8 provides a germ across one surface point. The following formulation records the geometry needed to
  combine these germs. In particular, agreement is proved on specified overlap components,
  rather than inferred from the existence of a cover.

#thm([Lemma 3.3.])[
  (Propagation through a compact cylinder).  #emph[Suppose a region in a product patch has smooth coordinates
    $\( z \, a \)$ near $B times \[ a_(-) \, a_(+) \]$, where $B$ is a compact base,
    possibly with boundary or corners. A single product solution is given on an open set $cal(S)$ containing
    neighborhoods of the top and lateral boundary. Assume that $cal(S)$ is upward closed in $a$ at fixed $z$.
    If every level $a = upright("constant")$ satisfies Proposition 8 outside $cal(S)$,
    with the positive side pointing toward increasing $a$, the solution extends to a neighborhood of the cylinder,
    agreeing on $cal(S)$. For fixed coordinates, compact sets and strict reference inequalities,
    the extension has uniform compact-subset bounds under small smooth perturbations,
    in terms of bounds on finitely many compact subsets of the initially given region.]
] <cross:propagation>

#proof[
  Starting from the top, let $a_(*)$ be the infimum of levels down to which an extension agreeing with the seed
    has been obtained. In the uniform version include uniform bounds in this property.
    At a non-seed point of $B times { a_(*) }$, Proposition 8 uses compact data strictly above that level.
    Take a finite cover of the level by such output neighborhoods and seed neighborhoods.
    Their data are contained above $a_(*) + eta$ for one $eta > 0$,
    so an already reached level supplies them with the needed bounds.
  Shrink the outputs in $\( z \, a \)$ coordinates to boxes $B_i times \( a_(*) - d_i \, a_(*) + d_i \)$.
    Every connected component of an overlap contains vertical segments to a common height greater than $a_(*)$.
    Both germs equal the preceding extension there. Unique continuation for $sans(L)_1^x +
    sans(L)_2^y$ makes them identical on that overlap component.
    The same argument gives agreement with $cal(S)$, because a vertical segment moving upward from a seed point
    stays in the seed. Boundary neighborhoods use the given solution.
    A finite subcover has a positive minimum output width and therefore passes the putative last level,
    or includes the endpoint $a_(-)$. This proves continuation on the whole cylinder.
    The same finite constructions retain all strict margins under small perturbations.
    Their Carleman, series and interior estimates prove the uniform assertion.
    Data bounded up to a limiting surface are never required:
    each local construction uses compact sets strictly above it. ◻
]

=== 3.4 Initialization at a fixed distance from the diagonal <initialization-at-a-fixed-distance-from-the-diagonal>

We now return to the connection Laplacians. In common coordinate patches centered at $0$,
  let $\( g_j \, A_j \)$ be smooth metrics and unitary connection matrices obtained from interior patches of
  compact Dirichlet manifolds. Use fixed local unitary frames,
  and let $G_j$ denote their matrix Dirichlet Green kernels, normalized with metric volume.
  Suppose that both coefficient pairs agree on an open set $W$ containing the lower side of a smooth hypersurface
  through $0$, and that $G_1 \( x \, y \) = G_2 \( x \, y \)$ for distinct $x \, y in W$.
  After a common linear coordinate change, assume

$ g_1 \( 0 \) = g_2 \( 0 \) = I_n \, wide { x_n < q \( x' \) } subset W upright(" near ") 0 \, wide q \( 0 \) =
  0 \, quad d q \( 0 \) = 0 \, $

for a smooth function $q$. No regularity of the rest of $partial W$ is assumed.
  For a small spatial dilation parameter $lambda > 0$, put

#[#set math.equation(numbering: n => "(3.10)")
 $ g_(j \, lambda) \( z \) = g_j \( lambda z \) \, wide A_(j \, lambda) \( z \) = lambda A_j \( lambda z \) \,
   wide W_lambda = lambda^(- 1) W \,\
G_(j \, lambda) \( x \, y \) = lambda^(n - 2) G_j \( lambda x \, lambda y \) . $ <cross:dilation>]

On each fixed bounded patch the metrics tend smoothly to the Euclidean metric.
  The corresponding dilated systems have uniformly bounded smooth lower-order coefficients on every fixed bounded
  set, and $W_lambda$ contains every fixed compact subset of ${ z_n < 0 }$ for sufficiently small $lambda$.
  Initially define, off the diagonal,

#[#set math.equation(numbering: n => "(3.11)")
 $ cal(G)_lambda \( x \, y \) =
   cases(delim: "{", G_(1 \, lambda) \( x \, y \) \, & y in W_lambda \,, G_(2 \, lambda) \( x \, y \) \, & x in
   W_lambda .) $ <cross:mixed-data>]

The pieces agree on their overlap. They solve the first connection Laplacian in $x$ and the conjugate second
  connection Laplacian on the second index in $y$, in the convention at the beginning of the section.
  Indeed, on the observed factor its two coefficient systems agree.
  Thus (3.11) is a product solution of the systems already treated.

#thm([Proposition 3.4.])[
  (Fixed-separation initialization).  #emph[In this setting, let $n gt.eq 3$ and fix $B > 0$,
    $d > 0$ and $eta > 0$. For all sufficiently small $lambda$,
    the data (3.11) have a product-solution continuation to a neighborhood of
$ { \( x \, y \) : \| x \| \, \| y \| lt.eq B \, med \| x - y \| gt.eq d } . $

 Every fixed $C^m$ norm on a smaller neighborhood is bounded uniformly in $lambda$.
   It agrees with $G_(1 \, lambda)$ when $y in W_lambda$ and with $G_(2 \, lambda)$ when $x in W_lambda$,
   on the corresponding overlaps. In particular these agreements hold on the fixed truncated lower strips $y_n < -
   eta$ and $x_n < - eta$, respectively. The smallness threshold for $lambda$ and the constants may depend on
   $B \, d \, eta \, m$.]
] <cross:initial>

#proof[
  For the final comparison with the full original cross, fix at the outset
  $ hat(B) = B + eta + 4 \, wide hat(d) = min \( d \/ 2 \, 1 \/ 4 \) . $
  We construct the continuation for these enlarged location bounds and smaller separations,
    and then restrict to the stated target. We first cross the limiting plane,
    then deform variable-radius tubes to reach those separations.
    This follows the two-stage construction of #cite(label("ScalarCompanion2026")) Section 3,
    “Fixed-separation initialization”. We first choose the Euclidean geometric ratios,
    including the opening of the region reached in the first stage.
    We next choose the entire tube cylinder and a bounded positive-separation range containing it.
    The first-stage constructions are then made on that range.
    Only after all these fixed sets have been chosen do we decrease $lambda$.
  ===== 3.4.1 Crossing the plane and obtaining a common seed. <crossing-the-plane-and-obtaining-a-common-seed.>
  We first extend slightly across the plane in one variable while keeping the other at a comparable positive
    separation. The first interpolation exponent can be made close to one;
    this compensates for the fixed positive exponent obtained by propagation in the separated second variable.
  For the Euclidean equations, the following choices are invariant under translations parallel to the plane and
    under a common change of spatial scale. We make the geometric choices on a unit-scale template.
    They therefore give an opening constant $c_0 > 0$ independent of the bounded range on which the construction
    is subsequently used. On any fixed compact range of centers and scales $0 < s_min lt.eq s lt.eq s_max$,
    the same strict weights and geometric fractions work for the dilated systems once $lambda$ is sufficiently
    small. The lower-order coefficients are bounded uniformly there (and converge to zero under the connection
    dilation).
  Fix a point $x_0$ of height zero and a separation scale $s > 0$. In the second factor take
  $ D_2 = { s \/ 2 < \| y - x_0 \| < 2 s } $
  and an observed ball $S_2$ about $x_0 - s e_n$. In the first take a ball of radius $3 theta.alt_0
    s$ centered at $x_0 - theta.alt_0 s e_n$, with $theta.alt_0 >
    0$ fixed small enough that the two large domains are separated.
    Its observed ball has radius $\( 1 - alpha \) theta.alt_0 s$, with $alpha > 0$ to be chosen.
    These observed balls lie strictly in the lower half-space.
    On a fixed compact scale range their heights are bounded above by a common negative number, since $s gt.eq
    s_min > 0$. Thus, after a finite covering, one choice of small $lambda$ places every observed ball in
    $W_lambda$ with room. No neighborhood of the whole limiting plane is assumed to belong to $W_lambda$.
  There is a two-constants estimate from $S_2$ to a slightly enlarged closed annulus $4 s \/ 5 lt.eq \| y -
    x_0 \| lt.eq 6 s \/ 5$, with an exponent $gamma_2 > 0$ independent of $alpha$.
    Here is a direct way to obtain it with room for perturbations.
    On a Euclidean annulus the weight $\| z - z_(*) \|^(- 1)$ is strict:
    its radial Hessian is $2 \| z - z_(*) \|^(- 3)$ and each tangential Hessian value is $- \| z -
    z_(*) \|^(- 3)$. Radial cutoffs in (3.6), followed by exponential balancing,
    propagate smallness from an inner ball to an intermediate ball using the norm on an outer ball.
    A finite chain of overlapping balls with enlarged balls inside $D_2$ connects $S_2$ to the target annulus.
    The annulus is connected since $n gt.eq 3$. Multiplying the finitely many positive exponents gives the
    asserted $gamma_2$. The same weights and margins work for sufficiently small perturbations of the Euclidean metric.
  In the first factor use this radial argument centered at $x_0 - theta.alt_0 s e_n$.
    Keep the outer cutoff a fixed distance beyond radius $theta.alt_0 s$,
    and put the inner cutoff just inside radius $\( 1 - alpha \) theta.alt_0 s$.
    Take a concentric target ball of radius $\( theta.alt_0 + c \) s$, with $c > 0$ small;
    it contains the observed ball and a ball of radius $c s$ about $x_0$.
    To see the resulting exponent, let $R_(upright("in"))$ be an inner cutoff radius,
    chosen just inside the observed radius, let $R_(upright("tar")) = \( theta.alt_0 + c \) s$,
    and let $R_(upright("out")) > R_(upright("tar"))$ be a fixed starting radius for the outer derivative support.
    With $theta \( R \) = R^(- 1)$, exponential balancing gives
  $ gamma_1 =
    frac(theta \( R_(upright("tar")) \) - theta \( R_(upright("out")) \), theta \( R_(upright("in")) \) - theta \(
    R_(upright("out")) \)) . $
  The inner core is bounded directly by the observed norm. As $alpha$ and $c$ decrease,
    choose the inner cutoff so that both $R_(upright("in"))$ and $R_(upright("tar"))$ approach $theta.alt_0 s$,
    while $R_(upright("out"))$ stays a fixed distance beyond that radius. Thus $gamma_1 arrow.r 1$.
    Choose these constants so that $gamma_1 + gamma_2 > 1$. Lemma 7 extends the kernel to a small ball about $x_0$
    times the target annulus. On these fixed separated sets the rescaled Green kernels and their derivatives are
    uniformly bounded: the same bounds hold entrywise for the smooth systems used here.
    To see this, an interior inverse parametrix has order $- 2$ and frequency pieces bounded by $C_N
    2^(j \( n - 2 \)) \( 1 + 2^j \| x - y \| \)^(- N)$, up to a smooth kernel.
    Summing gives the local bound $C \| x - y \|^(2 - n)$ for $n gt.eq 3$.
    The normalization in (3.10) preserves this bound; interior estimates for the uniformly elliptic dilated
    equations give all fixed derivative bounds away from the pole.
  The extensions agree with both lower pieces on their actual comparison domains.
    For $y in S_2$, the series equals $G_(1 \, lambda)$ for all $x$ in its first output ball.
    Fix any such $x$ in a truncated lower half-space contained in $W_lambda$.
    On $S_2$ both variables then lie in $W_lambda$, so this value also equals $G_(2 \, lambda)$.
    Unique continuation for the second system on the connected output annulus proves agreement with
    $G_(2 \, lambda)$ throughout that annulus. In the other direction,
    fix $y$ in the output annulus and in $W_lambda$. On the first observed ball $S_1$,
    agreement with the second arm gives $G_(2 \, lambda) = G_(1 \, lambda)$.
    Unique continuation for the first system on its connected output ball gives agreement with $G_(1 \, lambda)$
    there. Each comparison stays a positive distance from the diagonal.
  We make the overlap comparison precise because the two variables may play different roles in two local
    constructions. Inside the output just obtained choose a larger comparison product of the form
  $ P \( x_0 \, s \) = B \( x_0 \, kappa s \) times { \( 1 - zeta \) s < \| y - x_0 \| < \( 1 + zeta \) s } \, $
  where $kappa \, zeta > 0$ are fixed geometric fractions. The first ball is contained in the actual concentric
    first output ball, and the annulus is contained in the actual second output.
    Keep the full original outputs for the preceding lower-piece comparisons. For coverage retain only
  $ P' \( x_0 \, s \) = B \( x_0 \, epsilon.alt_1 s \) times { \( 1 - zeta' \) s < \| y -
    x_0 \| < \( 1 + zeta' \) s } \, wide 0 < epsilon.alt_1 lt.double kappa \, quad 0 < zeta' < zeta . $
  The transposed products are used when $y$ is the near-plane variable.
    If a point belongs to two retained products, their scales are comparable to each other and to $\| x - y \|$,
    with fixed constants. Choose $epsilon.alt_1$ small enough, relative to $kappa$ and $zeta - zeta'$,
    that a downward translation of size at most a fixed multiple of $epsilon.alt_1$ times either scale stays
    inside each larger comparison product whenever it acts on a retained near-plane variable.
    This follows directly from the triangle inequality for the ball and annular distances.
    On the chosen compact scale range take $eta_0 > 0$ much smaller than the remaining margins times $s_min$,
    and with $eta_0 lt.eq eta$.
  For products of the same orientation, lower only their common near-plane variable by
  $ h = max \( x_n \, 0 \) + 2 eta_0 $
  (or the analogous expression in $y$). The other variable remains fixed.
    For products of opposite orientations, both $x$ and $y$ lie in retained near-plane balls; lower both by
  $ h = max \( x_n \, y_n \, 0 \) + 2 eta_0 . $
  The scale comparability and the preceding choices keep the entire path in the intersection of the two larger
    comparison products. Its endpoint has the near-plane variable below $- eta_0$ in the first case,
    and both variables below $- eta_0$ in the second. For small enough $lambda$ these endpoint neighborhoods lie
    in the original lower cross, where the preceding comparisons identify both germs.
    Unique continuation for the elliptic sum on the component of the larger intersection containing the path
    identifies the germs at the starting point. The path need not remain in the retained products.
    This proves agreement on every retained overlap without a connectedness assumption on that overlap.
  Apply the same construction with the variable roles and their tensor factors interchanged,
    and then return the values to the original tensor order. The resulting germs solve the same two equations as
    the first orientation. The overlap comparison therefore applies to them and produces,
    for some fixed $c_0 > 0$, a single-valued continuation in
  #[#set math.equation(numbering: n => "(3.12)")
   $ min \( x_n \, y_n \) < c_0 \| x - y \| \, $ <cross:coarse-region>]
  on every fixed compact range of bounded locations and positive separations.
    The estimates are uniform in $lambda$ on that range. For coverage near the plane,
    take $x_0 = \( x' \, 0 \)$ and $s = \| y - x_0 \|$ when the first variable has the smaller nonnegative height;
    then $x$ is in the retained first ball and $y$ in the retained annulus if $c_0$ is small;
    for instance $c_0 \/ \( 1 - c_0 \) < epsilon.alt_1$ guarantees the required ball inclusion.
    Points already below the plane are covered by the same construction near it or by the given cross farther
    below it. The preceding overlap argument makes these choices compatible.
  ===== 3.4.2 Sweeping tubes inward from the common seed. <sweeping-tubes-inward-from-the-common-seed.>
  The region (3.12) is now the seed for the second stage. At fixed center $y$ and direction $omega$,
    we move $x$ along the ray from $y$: large radii lie in the seed,
    and decreasing the radius will reach the target pairs. Choose $M > hat(B) + 3$ and introduce
  #[#set math.equation(numbering: n => "(3.13)")
   $ t = M + y_n + e_0 \| y' \|^2 \, wide r_a \( y \) = a t^(1 + sigma) \, wide x = y + r_a \( y \) omega \,
     quad \| omega \| = 1 \, $ <cross:tubes>]
  where $sigma \, e_0 > 0$ will be small. The base is
  $ y_n gt.eq - hat(B) - 1 \, wide t lt.eq T_0 \, wide omega in bb(S)^(n - 1) \, $
  and $a$ decreases through a fixed interval $\[ a_min \, a_max \]$.
    The term $e_0 \| y' \|^2$ makes this base compact. The parameter $a$ decreases while $\( y \, omega \)$
    remains fixed, as required by the compact-cylinder propagation lemma. Put $m = M - hat(B) - 1 > 2$.
    Reserve the bounds $0 < sigma lt.eq 1$, $e_0 lt.eq \( 1 + hat(B)^2 \)^(- 1)$, and $e_0 T_0 lt.eq 1 \/ 4$.
    Once $sigma$ is chosen below, take
  $ 0 < a_min < frac(hat(d), 2 \( M + hat(B) + 1 \)^(1 + sigma)) \, wide
    a_max > max (a_min \, frac(2, c_0 m^sigma)) \, $
  and then choose
  $ T_0 > 2 \( M + hat(B) + 1 \) \, wide c_0 a_min T_0^sigma > 2 . $
  For every target center, $t lt.eq M + hat(B) + 1$; hence its target separations exceed $r_(a_min) \( y \)$.
    On the initial level, $c_0 r_(a_max) > 2 t > y_n$, so this level lies in (3.12).
    The bottom base boundary has $y_n < 0$, and on the face $t =
    T_0$ we have $c_0 r_a > 2 t > y_n$ for all allowed $a$. Thus the initial level and both base boundary faces
    are supplied by the seed. The power $1 + sigma > 1$ is what permits this last inequality at the top face.
    This known region is upward closed in $a$: since $min \( x_n \, y_n \) = y_n + r min \( omega_n \, 0 \)$,
    its defining inequality is $y_n < \( c_0 - min \( omega_n \, 0 \) \) r$, whose radius coefficient is positive.
  It remains to check the strict extension criterion outside that region. At the Euclidean metrics use
  $ rho = 1 / 2 \( \| x - y \|^2 - r_a \( y \)^2 \) \, wide b = nabla r_a . $
  Away from $omega + b = 0$, multiply the vectors in (3.7) by the common positive factor $r_a$ and write their
    real and imaginary parts as
  #[#set math.equation(numbering: n => "(3.14)")
   $ U_1 & = omega + i v \, & \| v \| = 1 \, quad v perp omega \,\
U_2 & = frac(omega + b, \| omega + b \|^2) + i w \, & w perp \( omega + b \) \, quad \| w \| = \| omega +
  b \|^(- 1) . $ <cross:null-vectors>]
  The identity $omega dot.op \( U_1 - U_2 \) = b dot.op U_2$ cancels the normal part of the distance Hessian.
    Consequently the test is
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 - \( r_a partial^2 r_a \) \( U_2 \, overline(U_2) \) . $ <cross:tube-test>]
  For bounded $b$, outside fixed small neighborhoods of $b = - omega$ and $b = - 2 omega$,
    the first term is at least $c \| b \|^2$. To see this, a zero forces the real part of $U_2$ to be parallel to
    $omega$, and equality of the projected imaginary lengths gives $\| omega + b \| = 1$.
    Thus $b = 0$ or $b = - 2 omega$. Near $b = 0$, the real projected difference controls $\| pi_(omega^perp)
    b \|$ to first order; also
  $ \| pi_(omega^perp) w \| = 1 - omega dot.op b + O \( \| b \|^2 \) \, $
  so the imaginary projected difference controls $\| omega dot.op b \|$ to first order.
    This proves the quadratic lower bound near zero; compactness proves it on the remaining range.
  Outside (3.12), $y_n gt.eq c_0 r_a$, so $r_a \/ t lt.eq 1 \/ c_0$ and
  $ b = \( 1 + sigma \) \( r_a \/ t \) nabla t $
  has $\| b \| lt.eq 4 \/ c_0$ under the reserved bounds. This fixes a compact range for $b$ before $sigma$,
    the $a$-interval, $T_0$, and $e_0$ receive their final values.
    When $nabla t$ is close to $e_n$, the two excluded neighborhoods already lie in (3.12). Indeed,
  $ x_n / r_a lt.eq frac(\( 1 + sigma \) \| nabla t \|, \| b \|) + omega_n \, $
  which is arbitrarily small near $b = - omega$ and negative near $b = -
    2 omega$ as $sigma$ and the gradient error tend to zero. On the complement $\|
    U_2 \|$ is bounded and differentiation of (3.13) gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ r_a \| partial^2 r_a \| lt.eq C \( sigma + T_0 e_0 \) \| b \|^2 . $ <cross:tube-error>]
  Here the choices can be made in a definite order. First choose a neighborhood radius $delta_0 > 0$ for $b = -
    omega$ and $b = - 2 omega$, in terms of $c_0$, and upper bounds on $sigma$ and $\| nabla t -
    e_n \|$ so that their closures satisfy $x_n \/ r_a < c_0 \/ 2$.
    On the complementary bounded $b$-range let $c > 0$ be the constant in the quadratic lower bound.
    There $\| U_2 \|^2 lt.eq 2 \/ delta_0^2$. Direct differentiation sharpens (3.16) to
  $ frac(r_a \| partial^2 r_a \|, \| b \|^2) lt.eq sigma + 2 e_0 T_0 . $
  Choose $sigma > 0$ small enough that its contribution to this bound is less than $c delta_0^2 \/ 8$.
    Choose the $a$-interval and $T_0$ as above, and finally take $e_0 >
    0$ sufficiently small that all reserved bounds hold, $\| nabla t - e_n \| lt.eq
    2 sqrt(e_0 T_0)$ has the required smallness, and $sigma + 2 e_0 T_0 < c delta_0^2 \/ 4$.
    The second term of (3.15) is then at most $\( c \/ 2 \) \| b \|^2$ in absolute value.
    The whole test is bounded below by
  $ c / 2 \| b \|^2 gt.eq c / 2 \( 1 + sigma \)^2 a_min^2 m^(2 sigma) > 0 $
  where continuation is needed. Also the two partial gradients of $rho$ have lengths at least $r_a$ and $delta_0
    r_a$, respectively. This supplies fixed strict margins before any metric perturbation.
  All these sets are bounded and stay at separation at least $a_min \( M - hat(B) - 1 \)^(1 + sigma) > 0$.
    Smooth convergence of the metrics therefore preserves the strict tests for sufficiently small $lambda$.
    At this point the tube parameters and its compact range have all been fixed.
    Apply the first-stage construction on a slightly larger bounded range of locations and separations containing
    this cylinder, and then choose $lambda$ small enough for both its data and the strict tube tests.
    Lemma 9 continues the kernel through the cylinder, with uniform estimates and agreement on the seed.
    A target pair has $a = \| x - y \| \/ t^(1 + sigma) gt.eq a_min$;
    if $a > a_max$ it is already in the coarse region. Hence every target pair is covered.
  It remains to identify this extension with both pieces of the full cross (3.11),
    including parts of $W_lambda$ not in a truncated half-space. For $\| y \| lt.eq B$ put
  $ D_y = B \( 0 \, hat(B) \) \\ overline(B \( y \, hat(d) \)) \, wide A = B \( - \( B + eta + 2 \) e_n \, 1 \/ 4 \) . $
  The excluded closed ball lies strictly inside $B \( 0 \, hat(B) \)$, so $D_y$ is connected;
    it contains the fixed lower ball $A$, which is disjoint from every excluded ball and lies below $x_n = - eta$.
    For fixed $y in W_lambda$ in the target range, the constructed kernel and $G_(1 \, lambda)$ solve the same
    first-variable system on $D_y$. On $A$ the constructed kernel equals $G_(2 \, lambda)$,
    which equals $G_(1 \, lambda)$ because both variables are in $W_lambda$.
    Unique continuation on $D_y$ proves agreement on the target overlap.
    Interchanging the variables proves agreement with the other piece.
    The inequalities defining $hat(B)$ and $hat(d)$ leave open room around the original target,
    so this also gives the claimed neighborhood and its compact-subset estimates. ◻
]

The constants in Proposition 10 may deteriorate as $d arrow.b 0$.
  Its role is to initialize the sphere construction at fixed positive separations.
  Lemma 9 will subsequently give existence at each positive radius of a shrinking family.
  The separate estimate on that family’s transfer density, rather than an estimate obtained by iterating this
  continuation, will control the shrinking limit.

== 4 Shrinking spheres and harmonic transfer <sec:spheres>

We now work with the contact data of Proposition 6. The two systems agree on the lower side of a smooth
  hypersurface through the origin, and their Green matrices agree when both arguments are on that side.
  Our aim is to represent a map between their local harmonic sections by integration over small spheres.
  Product continuation constructs this map at each positive radius.
  A separate estimate in the next section will control its density as the radii collapse.

The sphere geometry and radius profiles below are adapted from #cite(label("ScalarCompanion2026")) Section 4.
  We give their proofs, including the strict Hessian calculation,
  and formulate the resulting transfer for the present matrix equations. The coordinates need not be harmonic.

=== 4.1 A concave depth and the radius profiles <a-concave-depth-and-the-radius-profiles>

Apply the spatial dilation (2.10). In this section we suppress the dilation subscript on $g_j \, A_j \, G_j \,
  F_j$ and on the paired functions, while retaining $lambda$ for the dilation parameter.
  On every fixed bounded coordinate region, $g_j arrow.r I$ smoothly and $A_j arrow.r
  0$ smoothly as $lambda arrow.b 0$. The harmonic frames and their inverses have uniform smooth bounds there.
  All bounded regions and positive separation scales used below are fixed before the final upper bound on $lambda$
  is chosen.

Put

$ Y = { y = \( y' \, y_n \) : \| y' \| lt.eq 1 \, med - 1 lt.eq y_n lt.eq 1 } \, wide t_0 \( y \) = y_n + \| y' \|^2 . $

For a sufficiently large fixed $L$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ gamma = e^(- 2 L t_0) g_1 \, wide a = gamma^(- 1) \, wide Q = frac(n g_2^(- 1), "tr" \( gamma g_2^(- 1) \)) \,
   wide h = Q - a . $ <sph:normalization>]

These tensors are defined on a fixed neighborhood of $Y$, also used for the first-variable points.
  Specify the scalar multipliers in the harmonic-frame convention (2.11) by

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(L)_j v = - c_j F_j^(- 1) L_j \( F_j v \) \, wide c_1 = e^(2 L t_0) \, wide c_2 =
   frac(n, "tr" \( gamma g_2^(- 1) \)) > 0 . $ <sph:frame-normalization>]

Their second-derivative coefficient matrices are $a$ and $Q$, respectively,
  and their zeroth-order terms vanish because the columns of $F_j$ are harmonic.
  These changes leave the solution spaces unchanged after the frame identification.
  For product continuation we use the positive-principal-symbol convention:
  $- cal(L)_j$ in harmonic frames, or equivalently $c_j L_j$ in unitary frames.
  The corresponding principal metrics are $gamma$ and $Q^(- 1)$. The normalization ensures

#[#set math.equation(numbering: n => "(4.3)")
 $ "tr" \( gamma h \) = 0 \, wide h arrow.r 0 quad upright("in every fixed smooth norm as ") lambda arrow.b 0 .
   $ <sph:trace-free>]

Define a depth function by

#[#set math.equation(numbering: n => "(4.4)")
 $ t \( y \) = integral_(1 \/ 8)^(t_0 \( y \)) e^(- 2 L s) thin d s . $ <sph:depth>]

It is negative near the origin and has nonvanishing differential.
  Its useful feature is strict concavity for the reference metric:

#[#set math.equation(numbering: n => "(4.5)")
 $ "Hess"_gamma t = e^(- 2 L t_0) #scale(x: 120%, y: 120%)[\(] "Hess"_(g_1) t_0 -
   L \| d t_0 \|_(g_1)^2 g_1 #scale(x: 120%, y: 120%)[\)] lt.eq - c gamma . $ <sph:depth-hessian>]

Indeed the conformal connection formula cancels the two $d t_0 ⊗ d t_0$ terms.
  The norm of $d t_0$ is bounded below on the fixed region,
  whereas $"Hess"_(g_1) t_0$ is uniformly bounded for small $lambda$.
  Choosing $L$ first proves the last inequality. All constants describing this reference geometry are henceforth fixed.

For an integer $p_(*) gt.eq 2$, an amplitude $R_(*) > 0$, and $0 < delta lt.eq 1$, put

#[#set math.equation(numbering: n => "(4.6)")
 $ ell_delta \( t \) = delta log \( 1 + e^(t \/ delta) \) \, wide r_delta \( y \) =
   R_(*) ell_delta \( t \( y \) \)^(p_(*)) \, wide f_(*) = log r_delta \, wide
   beta = \| d f_(*) \|_gamma . $ <sph:radius>]

We use the $gamma$-geodesic ball with center $y$ and radius $r_delta \( y \)$.
  These balls shrink to a point on ${ t lt.eq 0 }$, including a neighborhood of the contact point.
  At positive depths bounded away from zero, their radii retain a positive lower bound.
  This will let us place cutoff derivatives where the transfer is already controlled.

#thm([Lemma 4.1.])[
  (Uniform profile bounds).  #emph[For the geometry just fixed and all sufficiently small $lambda$,
    the profiles (4.6) satisfy
#[#set math.equation(numbering: n => "(4.7)")
 $ beta gt.eq c p_(*) \, wide "Hess"_gamma f_(*) lt.eq - c beta gamma \, wide \| partial^j f_(*) \| lt.eq
   C_j beta^j quad \( j gt.eq 1 \) \, $ <sph:profile-bounds>]

 uniformly in $0 < delta lt.eq 1$. The constants $c \, C_j$ are independent of $p_(*) gt.eq 2$.
   For fixed $p_(*) \, R_(*)$, the functions $r_delta^(1 \/ p_(*))$ have a uniform Lipschitz bound.
   The radii increase strictly with $delta$, converge to zero where $t lt.eq 0$, and obey
#[#set math.equation(numbering: n => "(4.8)")
 $ sup_(0 < delta lt.eq 1 \, med y in Y) r_delta beta^2 arrow.r 0 quad
   upright("as ") R_(*) arrow.b 0 $ <sph:amplitude-smallness>]

 for each fixed $p_(*)$.]
] <sph:profiles>

#proof[
  Write $a_delta = \( log ell_delta \)'$. With $s = t \/ delta$,
  $ a_delta \( t \) = delta^(- 1) A \( s \) \, wide A \( s \) = frac(e^s, \( 1 + e^s \) log \( 1 + e^s \)) . $
  The function $A$ is positive and decreasing: setting $u = e^s$ gives
  $ A' \( s \) =
    frac(u #scale(x: 120%, y: 120%)[\(] log \( 1 + u \) - u #scale(x: 120%, y: 120%)[\)], \( 1 + u \)^2 log \( 1 +
    u \)^2) < 0 . $
  At the negative end $A$ tends to one, and at the positive end it is comparable to $\( 1 + s \)^(- 1)$.
    Differentiating its convergent expressions at the two ends gives $\| A^(\( j \)) \| lt.eq C_j A^(j + 1)$;
    positivity gives the same bounds on the remaining compact interval. Consequently, on the fixed range of $t$,
  $ a_delta gt.eq c > 0 \, wide a'_delta lt.eq 0 \, wide \| partial_t^j log ell_delta \| lt.eq C_j a_delta^j \,
    wide a_delta lt.eq ell_delta^(- 1) . $
  Since $\| d t \|_gamma$ is bounded above and below, $beta = p_(*) a_delta \| d t \|_gamma$. The identity
  $ "Hess"_gamma f_(*) = p_(*) a_delta "Hess"_gamma t + p_(*) a'_delta thin d t ⊗ d t $
  and (4.5) prove the first two bounds in (4.7). The chain rule gives the derivative bounds;
    their constants can be independent of $p_(*)$ because $p_(*) a_delta^j lt.eq p_(*)^j a_delta^j$ for $j gt.eq 1$.
  The estimate $0 < ell'_delta < 1$ proves the Lipschitz assertion. Moreover,
  $ partial_delta ell_delta = log \( 1 + e^s \) - frac(s e^s, 1 + e^s) > 0 . $
  The displayed expression tends to zero at both ends and its derivative in $s$ is $- s e^s \/ \( 1 + e^s \)^2$,
    so it is strictly positive at finite $s$. The limit of $ell_delta$ is $max \( t \, 0 \)$. Finally,
  $ r_delta beta^2 lt.eq C R_(*) p_(*)^2 ell_delta^(p_(*) - 2) \, $
  and $ell_delta$ is uniformly bounded on the fixed depth interval. This proves (4.8). ◻
]

=== 4.2 The core, cutoff, and order of choices <sph:core-cutoff>

Choose $t_b > 0$ so small that $3 t_b < t \( 1 \/ 4 \)$, where $t \( 1 \/ 4 \)$ denotes the value of the
  increasing function in (4.4) at $t_0 = 1 \/ 4$. Define

#[#set math.equation(numbering: n => "(4.9)")
 $ K = { y in Y : y_n gt.eq - 1 \/ 2 \, med t \( y \) lt.eq 2 t_b } \,\
chi in C_c^oo \( Y^compose \) \, wide chi = 1 upright(" near ") K \,\
"supp" \( d chi \) subset { y_n < - 1 \/ 4 } union { t > t_b } . $ <sph:cutoff>]

Such a cutoff exists. Indeed, on $K$ one has $t_0 < 1 \/ 4$, and thus $\| y' \|^2 < 3 \/ 4$ and $y_n < 1 \/ 4$;
  hence $K subset.double Y^compose$. Multiply a cutoff changing from zero to one between $y_n = -
  3 \/ 4$ and $y_n = - 1 \/ 2$ by a cutoff of $t$ changing from one to zero between $2 t_b$ and $3 t_b$,
  moving its endpoints slightly to leave room around $K$. The inequality $3 t_b <
  t \( 1 \/ 4 \)$ keeps the support away from the lateral and upper faces of $Y$. On the second cutoff region,

#[#set math.equation(numbering: n => "(4.10)")
 $ r_delta gt.eq R_(*) t_b^(p_(*)) > 0 . $ <sph:positive-depth-radius>]

Every point of $K$ can be joined to the known lower region by the vertical segment with the same $y'$ and initial
  height $- 1 \/ 2$. That segment stays in $K$; both $t$ and $r_delta$ are nondecreasing along it.
  For sufficiently small $lambda$, its initial point and a neighborhood of it lie in the known side.

We will use the following temporary metric comparison:

#[#set math.equation(numbering: n => "(4.11)")
 $ H_8 \( y \) := sum_(\| alpha \| lt.eq 8) \| partial^alpha h \( y \) \| lt.eq
   epsilon r_delta \( y \) wide \( y in Y \) . $ <sph:smallness>]

Coordinate norms in this definition are uniformly equivalent to the reference-metric norms.
  This condition will later be improved and then removed by a continuity argument.

#prodef([Remark 4.2.])[
  (Parameter choices).  The reference geometry, $t_b$, $K$, and $chi$ are fixed first.
    Choose $p_(*)$ sufficiently large and then $epsilon > 0$ sufficiently small.
    The lower bounds on $p_(*)$ and upper bounds on $epsilon$ used below depend only on the fixed geometry and
    coefficient bounds, before $R_(*)$ and the final dilation are chosen.
    Choose $R_(*)$ so that every ball lies in a normal neighborhood with fixed coordinate room and
  #[#set math.equation(numbering: n => "(4.12)")
   $ r_eta \| d log r_eta \|_gamma^2 lt.eq epsilon wide \( 0 < eta lt.eq 1 \, med y in Y \) . $ <sph:radius-smallness>]
  The fixed-separation scales determined by these choices are positive, although they may be small.
    Only then reduce $lambda$ to meet the fixed-separation initialization and the coefficient bounds.
    The parameter $delta$ remains free subject to (4.11). In particular the upper bound on $lambda$ does not
    depend on $delta$.
] <sph:choices>

=== 4.3 The strict Hessian test for a moving sphere <the-strict-hessian-test-for-a-moving-sphere>

The difficulty in approaching the diagonal is that the radius varies with the center.
  The leading terms from its gradient cancel in the product Hessian test.
  The strict concavity of its logarithm provides the positive remainder.

#thm([Lemma 4.3.])[
  (Strict sphere geometry).  #emph[Let $r = r_delta$ satisfy (4.7), (4.11), and (4.12).
    For $p_(*)$ sufficiently large and $epsilon$ sufficiently small, the hypersurface
$ rho \( x \, y \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] d_gamma \( x \, y \)^2 -
  r \( y \)^2 #scale(x: 120%, y: 120%)[\)] = 0 $

 satisfies the strict criterion of Proposition 8 for principal metrics $gamma$ in the first factor and $Q^(- 1)$
   in the second. Both partial gradients are nonzero, and the positive side is the exterior of the moving ball.]
] <sph:strict>

#proof[
  Put $b = nabla^gamma r$, so that $\| b \| = r beta$. Parallel transport along the radial $gamma$-geodesic
    identifies the endpoint tangent spaces; let $omega$ be its unit direction from $y$ to $x$.
    Multiply the normalized vectors in Proposition 8 by the common factor $r$.
    Their real and imaginary parts can be written as
  $ U_1 = omega + i v \, wide v perp omega \, quad \| v \| = 1 \, wide U_2 = q + i w . $
  All lengths in the following calculation use $gamma$. Set $s = omega + b$.
    In a $gamma$-orthonormal frame at $y$, the exact conditions on the second vector are
  #[#set math.equation(numbering: n => "(4.13)")
   $ q = frac(Q s, s^T Q s) \, wide s dot.op w = 0 \, wide w^T Q^(- 1) w = frac(1, s^T Q s) . $ <sph:test-vectors>]
  Here the matrix of $a$ is the identity. Therefore
  #[#set math.equation(numbering: n => "(4.14)")
   $ s dot.op U_2 = 1 \, wide q = frac(s, \| s \|^2) + O \( \| h \| \) \, wide \| w \| = \| s \|^(- 1) +
     O \( \| h \| \) . $ <sph:test-vector-bounds>]
  The assumptions make $b$ and $h$ small. Both partial gradients of $rho$ are consequently nonzero,
    and $\| U_2 \|$ is bounded above and below.
  With the product $gamma$-connection, the endpoint Hessian of half the squared distance has value
  #[#set math.equation(numbering: n => "(4.15)")
   $ \| U_1 - U_2 \|^2 + O \( r^2 \) \( \| U_1 \|^2 + \| U_2 \|^2 \) . $ <sph:distance-hessian>]
  To obtain the error, parametrize the radial geodesic on $\[ 0 \, 1 \]$.
    In a parallel frame its Jacobi field with prescribed endpoint values differs from the affine interpolant by
    $O \( r^2 \)$ in $C^1$, because the curvature is bounded and the velocity has size $r$.
    The second variation formula gives (4.15). Replacing the second connection by that of $Q^(- 1)$ contributes
    only $O \( r^2 \)$: its difference from the $gamma$-connection is $O \( \| h \| + \| partial h \| \) =
    O \( epsilon r \)$, while $\| d rho \| = O \( r \)$.
  The relation $s dot.op U_2 = 1$ implies $omega dot.op \( U_1 - U_2 \) = b dot.op U_2$. Also
  $ "Hess"_gamma \( r^2 \/ 2 \) = 2 thin d r ⊗ d r + r^2 "Hess"_gamma f_(*) . $
  Thus the Hessian sum in the criterion, multiplied by $r^2$, equals
  #[#set math.equation(numbering: n => "(4.16)")
   $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 - \| b dot.op U_2 \|^2 -
     r^2 "Hess"_gamma f_(*) \( U_2 \, overline(U_2) \) + O \( r^2 \) . $ <sph:test-expression>]
  For a real bilinear form, evaluation on a complex vector and its conjugate means the sum of the evaluations on
    its real and imaginary parts, as in the criterion.
  We record the cancellation quantitatively. The real projected difference is $- pi_(omega^perp) b +
    O \( \| b \|^2 + \| h \| \)$. The imaginary part obeys
  $ \| pi_(omega^perp) w \| = 1 - omega dot.op b + O \( \| b \|^2 + \| h \| \) . $
  Comparing this length with $\| v \| = 1$ and squaring gives
  $ \| pi_(omega^perp) \( U_1 - U_2 \) \|^2 gt.eq \| b \|^2 -
    C #scale(x: 120%, y: 120%)[\(] \| b \|^3 + \| b \| \| h \| + \| h \|^2 #scale(x: 120%, y: 120%)[\)] . $
  The real and imaginary directions of $U_2$ are almost orthonormal; hence
  $ \| b dot.op U_2 \|^2 lt.eq #scale(x: 120%, y: 120%)[\(] 1 +
    C \( \| b \| + \| h \| \) #scale(x: 120%, y: 120%)[\)] \| b \|^2 . $
  Using $\| b \| = r beta$, $\| h \| lt.eq epsilon r$, and (4.7), expression (4.16) is bounded below by
  #[#set math.equation(numbering: n => "(4.17)")
   $ c r^2 beta - C #scale(x: 120%, y: 120%)[\(] r^2 + r^3 beta^3 + epsilon r^2 beta +
     epsilon^2 r^2 #scale(x: 120%, y: 120%)[\)] . $ <sph:test-lower-bound>]
  Divide the error terms by $r^2 beta$. Their ratios are bounded by $C \/ beta$, $C r beta^2$, $C epsilon$,
    and $C epsilon^2 \/ beta$, respectively. Increasing $p_(*)$ controls the first,
    and then decreasing $epsilon$ controls the others by (4.12). This proves strict positivity. ◻
]

#thm([Proposition 4.4.])[
  (Continuation to the sphere family).  #emph[Make the choices of Remark 12.
    For all sufficiently small $lambda$ and every $0 < delta lt.eq 1$ satisfying (4.11),
    the mixed Green matrix extends to a neighborhood of
$ { \( x \, y \) : y in Y \, med d_gamma \( x \, y \) = r_delta \( y \) } . $

 It solves the first system in $x$ and the conjugate second system in the second tensor index.
   On the lower center region $y_n < - 1 \/ 4$ it agrees with $G_1$,
   and on the prescribed positive-depth region $t > t_b$ it agrees with the fixed-separation continuation of
   Proposition 10. The extension is smooth for each positive $delta$.]
] <sph:continuation>

#proof[
  Deform $eta$ from $1$ down to $delta$, using $\( y \, omega \)$ in the unit sphere bundle of $gamma$ as base
    coordinates and
  $ x = exp_y^gamma \( r_eta \( y \) omega \) . $
  The base over the closed cylinder $Y$ is compact. The radius has strictly positive derivative in $eta$,
    so these variables give cylinder coordinates on every fixed interval $delta lt.eq eta lt.eq 1$.
    The positive side of a level is the direction of increasing $eta$.
    Since $r_eta gt.eq r_delta$, condition (4.11) holds at every intermediate radius. Lemma 13 applies there.
  At $eta = 1$ the separations have a positive minimum on $Y$. The same is true throughout $t > t_b$ by (4.10).
    Proposition 10 therefore supplies the top and positive-depth data,
    with open room and uniform bounds at any fixed order. In the lower strip $y_n < - 1 \/ 4$,
    use the original kernel $G_1$; this strip lies in the dilated known side for small $lambda$.
    The initialization agrees with this kernel on their overlap.
  These two base regions cover every lateral face of $Y$: its bottom face is in the lower strip,
    and on a remaining lateral or upper face outside that strip one has $t_0 gt.eq 3 \/ 4$.
    Both regions are independent of $eta$ and hence upward closed.
    Together with a neighborhood of the top level they supply exactly the seed required by Lemma 9.
    That lemma and the strict sphere test extend the kernel through the whole cylinder,
    preserving agreement on the seed. Normal-neighborhood room and positive radii on each fixed interval ensure
    that all surfaces remain off the diagonal. ◻
]

The proposition gives existence at every admissible positive radius.
  It does not give a bound for the kernel as $delta arrow.b 0$.
  We next pass from the kernel to its action on harmonic sections;
  this action has a sphere density that can be estimated separately.

=== 4.4 The transfer and its matrix density <the-transfer-and-its-matrix-density>

Fix $delta > 0$ satisfying (4.11), write $r = r_delta$, and denote the continued kernel by $cal(G) \( x \, y \)$.
  For a first-system harmonic section $u$ defined near the closed $gamma$-ball centered at $y$, set

#[#set math.equation(numbering: n => "(4.18)")
 $ S \( y \; u \) = integral_(partial B_gamma \( y \, r \( y \) \))
   [cal(G) \( x \, y \)^(*) nabla_(nu_1)^(A_1) u \( x \) - #scale(x: 120%, y: 120%)[\(] nabla_(nu_1 \, x)^(A_1)
   cal(G) \( x \, y \) #scale(x: 120%, y: 120%)[\)]^(*) u \( x \)] thin d S_1 \( x \) . $ <sph:flux>]

Here $nu_1$ and $d S_1$ are the outward unit normal and hypersurface density for the actual metric $g_1$.
  The derivative of the kernel acts on its first fiber index.
  Consequently the displayed integrand is a section of the second fiber, with the adjoints in the indicated order.
  For a first harmonic-frame function $v$, define

#[#set math.equation(numbering: n => "(4.19)")
 $ T_y v = F_2 \( y \)^(- 1) S \( y \; F_1 v \) . $ <sph:transfer-definition>]

Let $S_y$ denote the unit sphere of $\( T_y bb(R)^n \, gamma_y \)$ and $d
  sigma_y$ its rotation-invariant probability measure.

#thm([Proposition 4.5.])[
  (Matrix harmonic transfer).  #emph[Under the assumptions of Proposition 14,
    there is a smooth matrix function $psi = psi_delta$ on the unit sphere bundle over $Y^compose$ such that
#[#set math.equation(numbering: n => "(4.20)")
 $ T_y v = integral_(S_y) psi \( y \, omega \) v #scale(x: 120%, y: 120%)[\(] exp_y^gamma \( r \( y \) omega \)
   #scale(x: 120%, y: 120%)[\)] thin d sigma_y \( omega \) . $ <sph:density-representation>]

 For every $y_0 in Y^compose$ and every first harmonic-frame function $v$ defined near
   $overline(B_gamma \( y_0 \, r \( y_0 \) \))$, the function $y mapsto T_y
   v$ is second harmonic-frame harmonic on a neighborhood of $y_0$.
   For each pair $\( v_1 \, v_2 \)$ of first and second harmonic-frame functions defined on the fixed coordinate
   neighborhoods and agreeing on the known side,
#[#set math.equation(numbering: n => "(4.21)")
 $ integral_(S_y) psi \( y \, omega \) thin d sigma_y \( omega \) = I \, wide T_y v_1 =
   v_2 \( y \) . $ <sph:reproduction>]

]
] <sph:transfer>

#proof[
  The Dirichlet problem on each ball is invertible. In the unitary frame this follows from the positive connection
    energy: a zero-boundary null solution is parallel and hence zero.
    Invertibility is preserved by the harmonic-frame change and by positive scalar multiplication of the equation.
    Its Dirichlet solution operator determines the boundary covariant normal derivative from the boundary value.
    Transpose this boundary operator onto the smooth matrix coefficient in the first term of (4.18),
    then multiply by the frame factors and pull the surface density back under $omega mapsto
    exp_y^gamma \( r \( y \) omega \)$. This gives the smooth matrix density in (4.20).
    Smooth dependence of the ball Dirichlet problem on its center and positive radius gives smooth dependence of $psi$.
  To prove the local harmonicity assertion, fix $y_0$ and $u = F_1 v$.
    The kernel is defined on an open neighborhood of the compact sphere over $y_0$.
    Choose a fixed slightly larger surrounding surface inside that neighborhood and inside the domain of $u$.
    After restricting the center neighborhood, this surface surrounds all the moving spheres and the intervening
    collars remain in the common domain. Green’s identity on each collar replaces (4.18) by its integral over the
    fixed surface. Both first-variable equations are homogeneous in the collar.
    Applying the second-variable operator under the fixed integral now proves that $S \( y \; u \)$ is
    second-system harmonic: the columns of $cal(G) \( x \, y \)^(*)$ solve that system.
    Equation (4.19) proves the assertion in harmonic frames. This argument applies to arbitrary local harmonic
    inputs; they need not extend throughout the coordinate region.
  If $y_n < - 1 \/ 4$, the kernel is $G_1$ and the Green representation formula gives $S \( y \; u \) =
    u \( y \)$. On that region $F_1 = F_2$, so $T_y v = v \( y \)$.
    For a fixed pair $\( v_1 \, v_2 \)$, both $T_y v_1$ and $v_2 \( y \)$ solve the second harmonic-frame equation
    on connected $Y^compose$ and agree in the lower strip. Unique continuation proves their equality.
    Finally constant columns are harmonic in both harmonic frames and agree there,
    so the same argument yields the first identity in (4.21). ◻
]

#thm([Lemma 4.6.])[
  (Bounds where the cutoff varies).  #emph[After the choices in Remark 12,
    for every fixed integer $m$ the angular $H^m$ norms of $psi_delta$ and its first base derivatives on
    $"supp" \( d chi \)$ are bounded independently of admissible $delta$ and sufficiently small $lambda$.]
] <sph:cutoff-bounds>

#proof[
  On the lower cutoff region, $T_y$ is evaluation at the center in the harmonic frame.
    Normalize its equation to principal matrix $a = gamma^(- 1)$,
    use a smooth $gamma$-orthonormal frame to pull it back under $z mapsto exp_y^gamma \( r z \)$,
    and multiply by $r^2$. With center and radius regarded as independent parameters,
    the resulting Dirichlet systems extend smoothly to $r = 0$, are uniformly elliptic,
    and have the Euclidean Laplacian as limit; their lower-order coefficients vanish at $r = 0$.
    The Dirichlet inverses are uniformly bounded, either by their limiting inverse and perturbation or by the
    positive energy before the change of frame. Elliptic boundary regularity,
    applied after differentiation in the parameters, shows that the evaluation density at the center has uniform
    angular smooth bounds and smooth center–radius dependence.
    The center remains a fixed positive distance from the unit sphere in these coordinates.
    Substituting the varying radius costs only $\| d r \|_gamma = r beta$,
    which is uniformly bounded by (4.12) and the lower bound for $beta$.
  This evaluation density is the density constructed in Proposition 15.
    Indeed both represent the same functional on traces of functions harmonic near the closed ball.
    These traces are dense in smooth boundary data. For a prescribed smooth trace $phi \( omega \)$,
    solve on the ball of radius $r \( 1 + eta \)$ with boundary value $phi$ transported along the radial rays.
    On pulling this problem back to the closed unit ball, its solution $z_eta$ converges in every $C^k$ norm to
    the solution $z_0$ at radius $r$, by smooth dependence of the Dirichlet inverse and boundary regularity.
    Its trace on the original sphere is $z_eta \( omega \/ \( 1 + eta \) \)$,
    which converges in $C^k \( S_y \)$ to $z_0 \( omega \) = phi \( omega \)$.
    The corresponding physical solutions are harmonic near the original closed ball.
    Thus the two smooth density matrices agree.
  On the other cutoff region $t > t_b$, the radii have the positive lower bound (4.10);
    all their required derivatives are uniformly bounded in $delta$.
    Proposition 10 gives uniform kernel bounds there. The smooth Dirichlet construction of the density therefore
    gives the same bounds for $psi_delta$ and its first base derivatives.
    Compactness of the cutoff derivative support completes the proof. ◻
]

We have constructed a matrix density that reproduces the matched harmonic pairs and has controlled data wherever
  the cutoff changes. The remaining estimate is a uniform bound on $chi
  psi_delta$ over the shrinking part of the sphere family.

== 5 Uniform estimates for the matrix transfer density <ang:section>

The previous section constructs a smooth matrix density on every sphere of positive radius.
  We prove that its $L^2$ norm stays bounded when the spheres shrink,
  provided the two normalized principal matrices differ by $O \( r \)$.
  The main analytic input is a scalar coercivity argument from #cite(label("ScalarCompanion2026"), form: "prose")
  Section 5, whose proof we reproduce below. We then compare the matrix equation with that scalar operator.
  The comparison is of lower differential order; it requires bounded matrix drifts,
  but no smallness assumption on their difference.

=== 5.1 Moving traces and the matrix equation <moving-traces-and-the-matrix-equation>

Use the reference metric and normalized inverse matrices from (4.1).
  The harmonic-frame convention (2.11), with the multipliers $c_j$ in (4.2),
  gives equations whose second-derivative coefficient matrices are positive definite:

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(L)_1 = a^(i j) partial_i partial_j + B_1^i partial_i \, wide cal(L)_2 = Q^(i j) partial_i partial_j +
   B_2^i partial_i . $ <ang:frame-equations>]

The $B_j^i$ are complex $2 times 2$ matrices acting on columns from the left.
  There is no zeroth-order term because each column of the defining frame $F_j$ is harmonic.
  All coefficients have uniform smooth bounds on the fixed coordinate neighborhood for sufficiently small spatial
  dilations. Suppress the dilation and shrinking parameters for now, and write

$ r = r_delta \, wide f_(*) = log r \, wide beta = \| d f_(*) \|_gamma \, wide f_i = nabla_i f_(*) . $

The profile bounds supplied by Lemma 11 have the form

#[#set math.equation(numbering: n => "(5.2)")
 $ beta gt.eq beta_0 \, wide "Hess"_gamma f_(*) lt.eq - c_0 beta gamma \, wide \| nabla^j f_(*) \| lt.eq
   C_j beta^j quad \( 1 lt.eq j lt.eq 8 \) . $ <ang:profile-bounds>]

The lower threshold $beta_0$ can be increased by increasing $p_(*)$. Throughout this section we impose

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(\| alpha \| lt.eq 8) \| partial_y^alpha h \| lt.eq epsilon r \, wide r beta^2 lt.eq epsilon . $ <ang:smallness>]

The first is the bootstrap assumption of Section 4; the second is ensured by the choice of radius amplitude.

Let $S_gamma Y$ be the tangent unit-sphere bundle with fiber probability measure $d sigma_y$.
  Horizontal differentiation $nabla$ uses parallel transport for $gamma$, including any base tensor indices,
  and acts componentwise on the fixed harmonic-frame components. The measure $d sigma_y$ is parallel.
  Our Hilbert norms use $d V_gamma \( y \) d sigma_y \( omega \)$ and the standard Hermitian norm,
  or the Frobenius norm for matrices.

There are two different transpose operations in the argument.
  If $cal(C)$ is a sphere operator on columns, its #emph[bilinear row transpose] $cal(C)^t$ is defined by

#[#set math.equation(numbering: n => "(5.4)")
 $ integral_(S_y) \( cal(C)^t psi \) V thin d sigma_y = integral_(S_y) psi \( cal(C) V \) thin d sigma_y .
   $ <ang:row-transpose>]

Here the identity is applied to each row of $psi$; it involves no complex conjugation.
  In particular, a matrix multiplication $M$ on columns becomes right multiplication $psi mapsto psi M$,
  whereas a matrix multiplying the output of the transfer map acts on $psi$ from the left.
  A star will denote the Hermitian sphere adjoint of a scalar operator,
  and a dagger its full Hilbert-space adjoint, including the base integration.
  Real scalar sphere operators have the same bilinear transpose and Hermitian adjoint.

For a column $v$ solving $cal(L)_1 v = 0$ near a closed moving ball, set

$ V \( y \, omega \) = v #scale(x: 120%, y: 120%)[\(] exp_y^gamma \( r \( y \) omega \) #scale(x: 120%, y: 120%)[\)] . $

Solving the ball Dirichlet problem expresses the boundary derivatives of $v$ in terms of its trace and therefore
  defines sphere operators $cal(C)_i$ satisfying $nabla_i V = cal(C)_i V$.
  For scalar functions write $Delta_g = "div"_g nabla$. Let $cal(C)_(i \, 0)$ be the corresponding moving trace
  operators for $c_1 Delta_(g_1)$, whose second-derivative coefficient matrix is $a = gamma^(- 1)$.
  This scalar comparison equation need not have zero coordinate drift.

On each tangent unit ball, let $sans(B)$ be the radial boundary derivative of Euclidean harmonic extension and
  $sans(A)_i$ its ambient derivatives in a $gamma$-orthonormal frame.
  On spherical harmonics $cal(H)_k$ of degree $k$, $sans(B) = k$ and $sans(A)_i : cal(H)_k arrow.r
  cal(H)_(k - 1)$. The operators are parallel with their tensor indices, and

#[#set math.equation(numbering: n => "(5.5)")
 $ \[ sans(B) \, sans(A)_i^(*) \] = sans(A)_i^(*) \, wide sum_i sans(A)_i^(*) sans(A)_i^(*) =
   0 . $ <ang:elementary-identities>]

The second identity is the adjoint of the vanishing Laplacian of a harmonic extension. Define

$ parallel w \( y \, dot.op \) parallel_s = parallel \( 1 + sans(B) \)^s w \( y \, dot.op \)
  parallel_(L^2 \( S_y \)) . $

These norms are equivalent to the usual sphere Sobolev norms, uniformly in $y$.
  They also apply componentwise to tensors and matrices.

Write $Psi^m$ for classical angular pseudodifferential operators of order $m$,
  scalar or matrix valued as specified. The notation $c \( y \) Psi^m$ means that division by $c \( y \) >
  0$ leaves uniformly bounded symbol and operator seminorms in the finitely many orders being used.
  An allowance $beta^j$ for $j$ base derivatives means the corresponding seminorms are bounded by $C_j beta^j$.

#thm([Lemma 5.1.])[
  (Trace expansions).  #emph[Under (5.2)–(5.3),
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(C)_(i \, 0)^(*) = r^(- 1) sans(A)_i^(*) + f_i sans(B) + E_i + F_i \, wide E_i in r Psi^1 \, quad
   F_i in Psi^0 . $ <ang:C-expansion>]

 The normalized remainders $r^(- 1) E_i \, F_i$ have the allowance $C_j beta^j$ through six base derivatives.
   Moreover, on rows,
#[#set math.equation(numbering: n => "(5.7)")
 $ K_i := cal(C)_i^t - cal(C)_(i \, 0)^(*) in Psi^0 \, wide nabla K_i in beta Psi^0 . $ <ang:trace-difference>]

 All constants depend on fixed smooth background bounds, not on the lower threshold $beta_0$ once $beta_0 gt.eq 1$.]
] <ang:trace>

#proof[
  First regard the radius $s$ as an independent parameter. Pull the first scalar equation back by $z mapsto
    exp_y^gamma \( s z \)$ and multiply by $s^2$. Its principal coefficients are $delta^(i j) +
    O \( s^2 \)$ and its first-order coefficients are $O \( s \)$.
    The same statement holds for the system, with scalar principal coefficients times $I$.
    Both Dirichlet operators extend smoothly to $s = 0$, where they equal the Euclidean Laplacian.
    On each fixed Sobolev scale their Dirichlet inverses are uniformly bounded and smooth for sufficiently small
    $s$, by elliptic Dirichlet estimates and invertibility at zero.
  For these smooth strongly elliptic Dirichlet families on the unit ball,
    the boundary radial derivative operator is classical of order one.
    Its principal symbol depends only on the principal coefficients and the differentiating vector.
    The boundary symbol construction, obtained by choosing the decaying normal root and solving the successive
    transport equations, is smooth in $\( y \, s \)$; see, for example,
    #cite(label("JoshiLionheart2005"), form: "prose") Section 3, Proposition 3.1.
    Their factorization is for the Hodge Laplacian; its construction applies to the present Dirichlet systems
    because their principal symbol is scalar times $I$, while the transport equations allow matrix coefficients.
    The true Dirichlet inverse corrects the parametrix by a smoothing operator.
    Differentiating this inverse on arbitrarily high fixed Sobolev scales bounds every required smooth kernel
    seminorm of the correction. Thus these assertions hold in the full symbol topology,
    including smoothing remainders and parameter derivatives.
  At $s = 0$ the radial operator is $sans(B)$, and the first $s$-derivative of its principal symbol vanishes
    because the principal coefficients have no linear term in $s$.
    Taylor expansion in the symbol topology therefore gives, for the scalar equation,
  #[#set math.equation(numbering: n => "(5.8)")
   $ sans(B) + s cal(B)_1 \( y \) + s^2 cal(B)_2 \( y \, s \) \, wide cal(B)_1 in Psi^0 \, quad
     cal(B)_2 in Psi^1 . $ <ang:radial-expansion>]
  The system and scalar radial operators have identical principal symbols for every $s$ and coincide at zero.
    Their difference is consequently $s$ times a smooth family in $Psi^0$.
  Differentiating the center of the exponential map while transporting $omega$ parallel gives a Jacobi field with
    initial derivative zero. In the unit-ball coordinates its velocity is
  $ s^(- 1) \( e_i + O \( s^2 \) \) \; $
  putting $s = r \( y \)$ adds $f_i omega$. Tangential derivatives act directly on boundary data and are identical
    for the scalar and matrix equations. For the radial component use (5.8).
    The leading terms are $r^(- 1) sans(A)_i + f_i sans(B)$; the order-one errors have size $O \( r \)$ and the
    order-zero errors are bounded, since $r beta lt.eq epsilon \/ beta$.
    This proves (5.6) after sphere adjunction. The radial difference $r Psi^0$,
    multiplied by the center velocity $O \( r^(- 1) + beta \)$, proves (5.7).
    Base derivatives cost at most one factor $beta$ each by the profile bounds.
    Sphere transposition and commutation with the smooth angular connection fields preserve these orders and bounds. ◻
]

Write the second system in the reference connection as $cal(L)_2 = Q^(i j) nabla_i nabla_j + b_2^i nabla_i$;
  equivalently, $b_2^k = B_2^k + Q^(i j) Gamma_(i j)^k \( gamma \) I$ in coordinates.
  Set $D_i = nabla_i + cal(C)_i^t$. The matrix density of Proposition 15 satisfies

#[#set math.equation(numbering: n => "(5.9)")
 $ P psi = 0 \, wide P = r [Q^(i j) D_i D_j + b_2^i D_i] . $ <ang:P-equation>]

Products are covariant products, and $b_2^i$ multiplies $D_i psi$ from the left.
  In particular, $Q$ is not differentiated by a base adjoint.
  Indeed, differentiation of $T_y v = integral psi V thin d sigma_y$ gives $nabla_i \( T_y v \) =
  integral \( D_i psi \) V thin d sigma_y$ by (5.4). Differentiate once more and apply the second system equation,
  which holds for every local first-system harmonic $v$ by Proposition 15.
  The resulting expression pairs to zero with all such traces. These traces are dense in smooth boundary data:
  solve the Dirichlet problems on slightly enlarged balls with transported smooth boundary values and let their
  radii decrease to the given radius. Smooth parameter dependence gives convergence in every fixed boundary smooth
  norm. This proves (5.9).

Write the scalar comparison equation on the second side as $c_2 Delta_(g_2) = Q^(i j) nabla_i nabla_j +
  b_(2 \, 0)^i nabla_i$. Define the scalar operator, acting entrywise on matrices,

#[#set math.equation(numbering: n => "(5.10)")
 $ P_0 = r [Q^(i j) D_(i \, 0) D_(j \, 0) + b_(2 \, 0)^i D_(i \, 0)] \, wide D_(i \, 0) = nabla_i +
   cal(C)_(i \, 0)^(*) . $ <ang:P0>]

The next subsections prove coercivity for $P_0$. The proof uses only its trace expansion and coefficient bounds;
  it assumes no scalar transfer density or scalar Green-kernel identity.

=== 5.2 The model operator and its principal perturbations <the-model-operator-and-its-principal-perturbations>

We separate a degree-raising model operator from the remaining principal and lower-order terms of the moving trace
  equation. We continue under the hypotheses of Lemma 17, including (5.3).

Define

#[#set math.equation(numbering: n => "(5.11)")
 $ D_i^(+) = nabla_i + f_i sans(B) \, wide D_i^(-) = - nabla_i + f_i sans(B) \, wide T =
   sum_i sans(A)_i^(*) D_i^(+) \, quad T^flat = sum_i sans(A)_i D_i^(-) . $ <ang:T-definition>]

The symbol $T$ here denotes a differential operator on sphere functions;
  the transfer functional continues to be denoted $T_y$. Expand (5.10) by (5.6). The identities (5.5) give

$ D_i^(+) \( r^(- 1) sans(A)_j^(*) \) = r^(- 1) sans(A)_j^(*) D_i^(+) \, wide sum_i sans(A)_i^(*) sans(A)_i^(*) = 0 . $

Thus, in ordinary base coordinates and an orthonormal sphere trivialization,

#[#set math.equation(numbering: n => "(5.12)")
 $ P_0 = 2 T + cal(U) + cal(J) \, $ <ang:P-decomposition>]

where $cal(J)$ is a uniformly bounded family in $Psi^1$, with no base derivatives, and

#[#set math.equation(numbering: n => "(5.13)")
 $ cal(U) = sum_(\| alpha \| lt.eq 2) cal(U)_alpha \( y \) partial_y^alpha \, wide
   cal(U)_alpha in epsilon beta^(- \| alpha \|) Psi^(2 - \| alpha \|) . $ <ang:U-bounds>]

Up to five derivatives of these coefficients have the additional allowance $C_j beta^j$.
  The second-base-derivative term is precisely

#[#set math.equation(numbering: n => "(5.14)")
 $ r Q^(i j) partial_(y_i) partial_(y_j) \; $ <ang:real-principal-part>]

its coefficients are real scalars independent of the sphere variable.

We detail these bounds. The pure angular second derivative contracted with $a$ vanishes.
  The remaining contraction is $\( h^(i j) \/ r \) sans(A)_i^(*) sans(A)_j^(*)$,
  and belongs to the zero-base-derivative term of (5.13). The mixed correction is $2 h^(i j) sans(A)_i^(*)
  D_j^(+)$ and has the stated small bounds. The $D^(+) D^(+)$ term has coefficient $r$; its base orders two,
  one and zero have coefficients $O \( r \)$, $O \( r beta \)$ and $O \( r beta^2 \)$, respectively.
  The condition $r beta^2 lt.eq epsilon$ gives (5.13) for all three. Terms containing $E_i$ obey the same bounds.
  Terms containing $F_i$ also do so, except for their cross terms with $r^(- 1) sans(A)_j^(*)$,
  which are bounded angular order-one terms and belong to $cal(J)$.
  The drift term with $sans(A)_i^(*)$ belongs to $cal(J)$ as well.
  Differentiating any of these expressions gives the stated coefficient bounds by (5.2) and (5.3).
  A horizontal connection written in this trivialization adds a bounded angular first derivative,
  which preserves the same estimates. The bounds for $cal(J)$ use the fixed background and remain uniform as
  $beta_0$ is increased.

The decomposition identifies the model operator $2 T$ and the second-order perturbation $cal(U)$.
  To carry the model estimate over to $P_0$ we shall need more than an ordinary first-derivative estimate:
  the error forms also contain mixed base and angular derivatives. For a sphere function $phi$, put

#[#set math.equation(numbering: n => "(5.15)")
 $ cal(N) \( phi \)^2 =
   integral_Y
   (parallel nabla phi parallel_0^2 + beta^2 parallel phi parallel_1^2 + beta^(- 1) parallel nabla phi
   parallel_(1 \/ 2)^2 + beta parallel phi parallel_(3 \/ 2)^2) d V_gamma . $ <ang:N-definition>]

The last two terms of $cal(N)$ place half an angular derivative on $nabla phi$ and three halves on $phi$.
  They will bound the remaining error forms left by the comparison with $P_0$.

=== 5.3 A comparison of raising and lowering operators <a-comparison-of-raising-and-lowering-operators>

The next estimate supplies these two derivative strengths for the model operator.
  Spherical harmonics are trace-free symmetric tensors, and comparing their raising and lowering operators is
  familiar from energy identities in tensor tomography; see, for example,
  #cite(label("PSU15")) #cite(label("GPSU16")). Here the negative Hessian of the spatial weight supplies the
  positive term that absorbs the bounded curvature. The particular weighted estimate below is adapted from
  #cite(label("ScalarCompanion2026"), form: "prose") Section 5, weighted raising estimate.
  We include the degree calculation because it is the source of the additional half angular derivative used in the
  perturbation argument.

#thm([Lemma 5.2.])[
  (Weighted raising estimate).  #emph[Let $n gt.eq 3$, and suppose (5.2) holds on a fixed base region with
    uniformly bounded reference geometry. There are $beta_0$ and $c > 0$,
    depending only on that geometry and the constants in (5.2), such that every smooth,
    compactly base-supported function with zero fiber mean satisfies
#[#set math.equation(numbering: n => "(5.16)")
 $ parallel T phi parallel^2 - parallel T^flat phi parallel^2 gt.eq
   c thin cal(N) \( phi \)^2 . $ <ang:raising-estimate>]

]
] <ang:raising>

#proof[
  Both operators change angular degree by exactly one, so it suffices to prove the estimate at one input degree $k
    gt.eq 1$. Identify that component with a harmonic homogeneous polynomial $v \( z \)$ of degree $k$.
    Use the Fischer inner product, in which the monomials $z^alpha$ are orthogonal with squared norm $alpha !$.
    Polynomial differentiation $a_i = partial_(z_i)$ is adjoint to multiplication $M_i = z_i$.
    On harmonic polynomials of degree $k$ the Fischer squared norm is the normalized squared sphere norm multiplied by
  $ N_k = n \( n + 2 \) dots.h.c \( n + 2 k - 2 \) \, wide N_0 = 1 . $
  For completeness, integration against a standard real Gaussian identifies the Fischer norm on trace-free
    homogeneous polynomials with their Gaussian $L^2$ norm; integrating radially then gives the factor $N_k$.
    These classical identities are also recorded in #cite(label("Render08")) Equation (2.1) and Theorem 2.1.
  Set $d = k + n \/ 2 - 1$ and use $D_i^plus.minus = plus.minus nabla_i + k f_i$ at this fixed degree.
    For harmonic polynomials $q_i$ of degree $k$, the Laplacian of $sum_i M_i q_i$ is $2 sum_i a_i q_i$. Since
  $ Delta_z \( \| z \|^2 s \) = 4 d thin s wide \( s in cal(H)_(k - 1) \) \, $
  its harmonic projection is $sum_i M_i q_i - \| z \|^2 sum_i a_i q_i \/ \( 2 d \)$.
    Orthogonality of this projection and its complement shows that its squared norm is
  $ sum_i parallel q_i parallel^2 + sum_(i \, j) \( a_j q_i \, a_i q_j \) -
    d^(- 1) parallel sum_i a_i q_i #scale(x: 180%, y: 180%)[parallel]^2 . $
  Changing from Fischer adjoints to sphere adjoints gives
  $ sans(A)_i^(*) \|_(cal(H)_k) = N_(k + 1) / N_k Pi_(k + 1) M_i \, $
  where $Pi_(k + 1)$ is harmonic projection in homogeneous degree $k + 1$.
    Consequently $N_k$ times the left side of (5.16) is
  #[#set math.equation(numbering: n => "(5.17)")
   $ \( 2 d + 2 \)
     [parallel D^(+) v parallel^2 + sum_(i \, j) \( a_j D_i^(+) v \, a_i D_j^(+) v \) - 1 / d parallel sum_i a_i
     D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2] - 2 d parallel sum_i a_i D_i^(-) v
     #scale(x: 180%, y: 180%)[parallel]^2 . $ <ang:Fock-difference>]
  All norms in this calculation include integration over the base and use the polynomial inner product in the
    fibers. The factors are $N_(k + 1) \/ N_k = 2 d + 2$ and $N_k \/ N_(k - 1) = 2 d$.
  Write $C_(i j) = 2 k \( "Hess"_gamma f_(*) \)_(i j)$ and
  $ C \[ a v \] = integral_Y sum_(i \, j) C_(i j) chevron.l a_i v \, a_j v chevron.r thin d V_gamma . $
  Covariant integrations by parts give
  #[#set math.equation(numbering: n => "(5.18)")
   $ sum_(i \, j) \( a_j D_i^(+) v \, a_i D_j^(+) v \) & = parallel sum_i a_i D_i^(-) v
     #scale(x: 180%, y: 180%)[parallel]^2 - C \[ a v \] + O \( k^2 \) parallel v parallel^2 \,\
parallel sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2 & lt.eq k parallel D^(-) v parallel^2 -
  C \[ a v \] + O \( k^2 \) parallel v parallel^2 \,\
parallel D^(-) v parallel^2 & = parallel D^(+) v parallel^2 +
  integral_Y "tr" C thin \| v \|^2 thin d V_gamma . $ <ang:ibp-one>]
  Here and below a form denoted $O \( k^2 \) parallel v parallel^2$ has absolute value at most a fixed constant
    times that quantity. To verify the first two formulas, move a $D_j^(+)$ across the pairing and commute
    $D_j^(-) D_i^(+)$ to $D_i^(+) D_j^(-) - C_(i j)$. The reordered term in (5.18) is at most $k parallel D^(-) v
    parallel^2$, because $sum_i \| a_i w \|^2 = k \| w \|^2$ for $w in cal(H)_k$.
    The extra commutator is curvature: it acts as a sum of rotations of norm $O \( k \)$ at degree $k$,
    and the two contractions supply one more factor $k$. This proves the claimed error bounds.
    Expanding the two squares proves (5.18). For complex functions all the displayed forms are understood through
    their real parts.
  Substituting (5.18) into (5.17) rewrites that expression as
  #[#set math.equation(numbering: n => "(5.19)")
   $ & \( 2 + 2 \/ d \)
     [d parallel D^(+) v parallel^2 - parallel sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[parallel]^2 - d C \[ a
     v \]]\
 & wide + 2 parallel sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[parallel]^2 +
   O \( k^3 \) parallel v parallel^2 . $ <ang:after-first-ibp>]
  We must control the remaining negative divergence square while retaining both an ordinary derivative estimate
    and an additional half-order angular derivative estimate.
    The latter requires a coefficient of size $k \/ beta$ in front of $\| D^(+) v \|^2$,
    including when $k$ is much larger than $beta$. Choose a small constant $theta.alt > 0$.
    On the fraction $1 - theta.alt$ of its negative divergence square use (5.18)–(5.18).
    On the remaining fraction use the pointwise convex combination
  #[#set math.equation(numbering: n => "(5.20)")
   $ \| sum_i a_i D_i^(+) v #scale(x: 180%, y: 180%)[\|]^2 & lt.eq \( 1 - zeta \) \( k + n - 1 \) \| D^(+) v \|^2\
 & quad + zeta (2 \| sum_i a_i D_i^(-) v #scale(x: 180%, y: 180%)[\|]^2 + 8 k^3 beta^2 \| v \|^2) \, wide zeta =
   c_1 \/ beta . $ <ang:convex-bound>]
  The fraction $1 - theta.alt$ in the integrated estimates is constant;
    the $y$-dependent $zeta$ is used only in this pointwise inequality.
    The first bound follows from the adjoint multiplication operators,
    since the contraction $\( q_i \) mapsto sum_i a_i q_i$ has squared norm at most $k + n -
    1$ on polynomials of degree $k$. The second follows from $D_i^(+) + D_i^(-) =
    2 k f_i$ and $\| sum_i f_i a_i v \|^2 lt.eq k beta^2 \| v \|^2$.
  Combining these bounds in (5.19), the coefficient retained for $\| D^(+) v \|^2$ is
  #[#set math.equation(numbering: n => "(5.21)")
   $ \( 2 + 2 \/ d \) #scale(x: 120%, y: 120%)[\[] d - k - theta.alt \( n - 1 \) +
     theta.alt zeta \( k + n - 1 \) #scale(x: 120%, y: 120%)[\]] . $ <ang:positive-degree-factor>]
  Since $d - k = \( n - 2 \) \/ 2$, a sufficiently small fixed $theta.alt$ makes this at least a fixed positive
    constant plus a positive multiple of $c_1 k \/ beta$. The coefficient of $\| sum_i a_i D_i^(-)
    v \|^2$ is nonnegative when $beta_0$ is sufficiently large. The Hessian contribution is exactly
  #[#set math.equation(numbering: n => "(5.22)")
   $ - \( 2 + 2 \/ d \)
     [\( d - 1 + theta.alt \) C \[ a v \] + \( 1 - theta.alt \) k integral_Y "tr" C thin \| v \|^2 thin d
     V_gamma] . $ <ang:hessian-contribution>]
  For $k gt.eq 1$ and $n gt.eq 3$, both coefficients inside this expression are positive.
    The Hessian hypothesis bounds it below by $c k^3 integral beta \| v \|^2$.
    This absorbs the curvature error $O \( k^3 \) parallel v parallel^2$ by increasing $beta_0$,
    and absorbs the last term of (5.20) by choosing $c_1$ sufficiently small.
    We have therefore retained positive multiples of
  $ parallel D^(+) v parallel^2 \, wide integral_Y k / beta \| D^(+) v \|^2 thin d V_gamma \, wide
    k^3 integral_Y beta \| v \|^2 thin d V_gamma . $
  The first controls both $parallel nabla v parallel^2$ and $k^2 integral beta^2 \| v \|^2$,
    since its cross term is $- k integral Delta_gamma f_(*) thin \| v \|^2 gt.eq 0$.
    For the weighted derivative use the pointwise inequality
  $ k / beta \| nabla v \|^2 lt.eq 2 k / beta \| D^(+) v \|^2 + 2 k^3 beta \| v \|^2 . $
  No differentiation of $beta^(- 1)$ is required. Dividing by $N_k$,
    and then summing the orthogonal degree components, proves (5.16);
    the weights $\( 1 + k \)^s$ are comparable to $k^s$ because the zero degree is excluded. ◻
]

=== 5.4 Keeping the principal perturbations <keeping-the-principal-perturbations>

The raising estimate controls the model operator. The scalar operator (5.10) also contains second base derivatives
  and a small second-order angular perturbation. We retain these terms in a comparison of squared norms.

#thm([Proposition 5.3.])[
  (Scalar coercivity).  #emph[Fix uniform smooth bounds for the reference geometry and scalar comparison
    equations, and the constants in (5.2). Suppose $P_0$ is the scalar operator (5.10),
    with the scalar trace operators of Lemma 17. There exist $beta_0$ sufficiently large,
    $epsilon_0 > 0$ and $C < oo$, depending only on these fixed bounds, such that (5.3) with $epsilon lt.eq
    epsilon_0$ implies
#[#set math.equation(numbering: n => "(5.23)")
 $ cal(N) \( phi \) lt.eq C parallel P_0 phi parallel $ <ang:coercive-estimate>]

 for every smooth, compactly base-supported function $phi$ with zero mean on each sphere.
   These constants are independent of the shrinking parameter.
   Only the eight indicated derivatives of the small tensor $h$ are required.]
] <ang:scalar-coercivity>

#proof[
  Let a dagger denote the full adjoint for $d V_gamma d sigma$. Covariant integration and the degree shift give
  #[#set math.equation(numbering: n => "(5.24)")
   $ Z := T^flat - T^dagger = sum_i f_i sans(A)_i . $ <ang:Z-definition>]
  A direct expansion yields
  #[#set math.equation(numbering: n => "(5.25)")
   $ & parallel \( 2 T + cal(U) \) phi parallel^2 - parallel \( 2 T^flat + cal(U)^dagger \) phi parallel^2\
 & wide = 4 #scale(x: 120%, y: 120%)[\(] parallel T phi parallel^2 -
   parallel T^flat phi parallel^2 #scale(x: 120%, y: 120%)[\)] + chevron.l cal(E) phi \, phi chevron.r \,
   $ <ang:norm-comparison>]
  where
  #[#set math.equation(numbering: n => "(5.26)")
   $ cal(E) = 2 \[ T^dagger \, cal(U) \] + 2 \[ cal(U)^dagger \, T \] + \[ cal(U)^dagger \, cal(U) \] -
     2 #scale(x: 120%, y: 120%)[\(] cal(U) Z + \( cal(U) Z \)^dagger #scale(x: 120%, y: 120%)[\)] .
     $ <ang:error-operator>]
  We will prove
  #[#set math.equation(numbering: n => "(5.27)")
   $ \| chevron.l cal(E) phi \, phi chevron.r \| lt.eq C epsilon cal(N) \( phi \)^2 . $ <ang:error-form-bound>]
  Here are the complete order and weight counts needed for this claim.
    An operator has count $\( m \, s \)$ if its coefficient at $partial_y^alpha$ is angular order $m - \|
    alpha \|$, of size $O \( beta^(s - \| alpha \|) \)$, with the derivative allowances already specified.
    Adjoints preserve the count, and products add the counts.
    When a base derivative hits a coefficient it consumes one differential order and adds a factor $beta$,
    so it preserves the weight index. A commutator of scalar angular operators loses one angular order:
    the products of their principal symbols cancel. Hence a scalar commutator loses one in total order while
    preserving the sum of the weight indices. The counts of $T \, T^dagger \, cal(U) \, Z$ are, respectively,
  $ \( 2 \, 1 \) \, quad \( 2 \, 1 \) \, quad \( 2 \, 0 \) \, quad \( 1 \, 1 \) \, $
  and every occurrence of $cal(U)$ carries the factor $epsilon$.
    Thus (5.26) has count at most $\( 3 \, 1 \)$ and a factor $O \( epsilon \)$; the quadratic $cal(U)$ term is smaller.
  There is a further cancellation that the total count alone does not express: no third base derivative survives.
    To check it explicitly, use an orthonormal sphere trivialization and write the base measure as $mu \( y \)
    thin d y$. The sphere probability measure is then fixed. Write
  $ cal(U) = c^(i j) partial_i partial_j + cal(B)^i partial_i + cal(C) \, wide c^(i j) = r Q^(i j) =
    c^(j i) in bb(R) . $
  The coefficients $cal(B)^i$ and $cal(C)$ are angular operators.
    Replacing a horizontal derivative by a coordinate derivative plus its angular connection term changes only
    base orders at most one, so these are all the second-base coefficients.
    If a star denotes the sphere adjoint, direct integration by parts gives
  $ cal(U)^dagger - cal(U) =  & (2 mu^(- 1) partial_j \( mu c^(i j) \) - cal(B)^i - \( cal(B)^i \)^(*)) partial_i\
 & + mu^(- 1) partial_i partial_j \( mu c^(i j) \) - mu^(- 1) partial_i #scale(x: 120%, y: 120%)[\(]
   mu \( cal(B)^i \)^(*) #scale(x: 120%, y: 120%)[\)] + cal(C)^(*) - cal(C) . $
  In particular it has base order at most one. In $\[ T^dagger \, cal(U) \]$ and its partner,
    the possible third-base-derivative coefficient is a commutator of an angular coefficient with $r Q^(i j)$,
    which is zero by (5.14). For $\[ cal(U)^dagger \, cal(U) \]$,
    first write it as $\[ cal(U)^dagger - cal(U) \, cal(U) \]$.
    The operator $cal(U)^dagger - cal(U)$ has no second base derivative, since the coefficient in (5.14) is real.
    Taking adjoints against the smooth base density only produces lower base orders.
    Its remaining possible third-base-derivative coefficients commute for the same reason.
    Finally, $cal(U) Z$ already has at most two base derivatives.
    It follows that $cal(E)$ is a sum of terms of precisely the following three permitted types:
  #[#set math.equation(numbering: n => "(5.28)")
   $ epsilon beta^(- 1) Psi^1 partial_y^2 \, wide epsilon Psi^2 partial_y \, wide
     epsilon beta Psi^3 . $ <ang:error-types>]
  This argument also covers lower orders, since $beta gt.eq 1$.
  For the first type in (5.28), integrate once in the base.
    The principal form is bounded by $C epsilon integral beta^(- 1) parallel partial_y phi parallel_(1 \/ 2)^2$.
    A derivative of its coefficient costs one factor $beta$ and leaves an $epsilon Psi^1 partial_y$ term.
    This includes differentiation of the weight itself: $\| d beta \| lt.eq
    C beta^2$ implies $\| d \( beta^(- 1) \) \| lt.eq C$. The second type has the form bound
  $ C epsilon integral_Y parallel partial_y phi parallel_(1 \/ 2) parallel phi parallel_(3 \/ 2) thin d V_gamma
    lt.eq
    C epsilon integral_Y
    (beta^(- 1) parallel partial_y phi parallel_(1 \/ 2)^2 + beta parallel phi parallel_(3 \/ 2)^2) d V_gamma . $
  The third type is bounded by $C epsilon integral beta parallel phi parallel_(3 \/ 2)^2$.
    The lower-order term from differentiating a coefficient satisfies the same bound.
    Replacing coordinate derivatives by horizontal derivatives adds a bounded angular first derivative,
    again controlled by these norms. A fixed finite partition of the base region has the same harmless lower-order
    errors. This proves (5.27).
  The constants in the preceding estimates are uniform for all $beta gt.eq
    beta_0$ once a fixed lower threshold is met. Choose $epsilon_0$ small relative to the constant in Lemma 18.
    Dropping the nonnegative second squared norm in (5.25) gives $cal(N) \( phi \) lt.eq
    C parallel \( 2 T + cal(U) \) phi parallel$. Finally,
  $ parallel cal(J) phi parallel lt.eq C parallel phi parallel_(L^2 \( Y \; H^1 \( S_y \) \)) lt.eq
    C beta_0^(- 1) cal(N) \( phi \) \, $
  so a sufficiently large $beta_0$ absorbs $cal(J)$ and proves (5.23).
  All these operations use angular symbol estimates pointwise in the base,
    and ordinary base differential operators of degree at most two.
    Formal adjoints, the commutator expansion and the one integration by parts use at most the five base
    coefficient derivatives specified in (5.13). Forming these coefficients uses at most one base derivative of a
    trace operator; six trace derivatives therefore suffice. Since its weight dependence is through $r$ and $f_i$,
    profile derivatives through order seven suffice, within the eight allowed in (5.2).
    Differentiating a factor such as $h \/ r$ five times uses only five derivatives of $h$,
    with the remaining factors bounded by the permitted powers of $beta$.
    Higher angular symbol seminorms depend on the fixed smooth first-metric family:
    the tensor $h$ is evaluated at the center, so angular differentiation introduces no further center derivatives
    of it. The scalar drifts have fixed smooth background bounds.
    Thus the eight smallness derivatives in (5.3) suffice in every fixed dimension;
    no smallness of all derivatives of $h$ is used. ◻
]

=== 5.5 The matrix comparison and the density bound <the-matrix-comparison-and-the-density-bound>

The scalar calculation is now complete. We use it entrywise before introducing any matrix coefficients into a
  squared-norm comparison. This order matters: matrix principal symbols need not commute,
  whereas the preceding commutator argument is scalar.

#thm([Proposition 5.4.])[
  (System coercivity).  #emph[Fix uniform smooth bounds for the harmonic-frame systems and the reference geometry,
    and the constants in (5.2). There are $beta_0$ sufficiently large, $epsilon_0 > 0$, and $C$,
    depending only on these bounds, such that (5.3) with $epsilon lt.eq epsilon_0$ implies
$ cal(N) \( phi \) lt.eq C parallel P phi parallel_(L^2) $

 for every smooth compactly base-supported matrix function $phi$ with zero fiber mean.
   The constants are independent of the shrinking parameter and of sufficiently small spatial dilations.]
] <ang:system-coercivity>

#proof[
  Put $q^i = b_2^i - b_(2 \, 0)^i I$ and use $D_i = D_(i \, 0) + K_i$ from (5.7).
    Let $L_M$ denote left multiplication by a matrix $M$. Expansion, without interchanging any factors,
    gives the identity
  #[#set math.equation(numbering: n => "(5.29)")
   $ P - P_0 = r #scale(x: 120%, y: 120%)[\[] & Q^(i j) \( D_(i \, 0) K_j + K_i D_(j \, 0) + K_i K_j \)\
 & + L_(q^i) D_(i \, 0) + L_(b_2^i) K_i #scale(x: 120%, y: 120%)[\]] . $ <ang:comparison-identity>]
  Thus $D_(i \, 0) K_j$ denotes composition and includes differentiation of $K_j$.
    There is no derivative of $q^i$ or $b_2^i$ in this formula.
    Left multiplication commutes with the row action of a sphere operator when its matrix depends only on the
    center, but no such commutation is needed in (5.29).
  The trace expansion gives $cal(C)_(i \, 0)^(*) in \( r^(- 1) + beta + 1 \) Psi^1$.
    Together with $K_i in Psi^0$, $nabla K_i in beta Psi^0$, and bounded drifts, (5.29) consequently yields
  #[#set math.equation(numbering: n => "(5.30)")
   $ parallel \( P - P_0 \) phi parallel_(L^2) lt.eq
     C (parallel phi parallel_(L^2 \( Y \; H^1 \( S_y \) \)) + parallel r nabla phi parallel_(L^2)) .
     $ <ang:comparison-bound>]
  To see the weights explicitly, every term with a derivative of $phi$ in the base is $r Psi^0 nabla phi$.
    Products of $K_i$ with the leading $r^(- 1) sans(A)_j^(*)$ leave a bounded $Psi^1$ term after multiplication
    by $r$; products with $f_j sans(B)$ have coefficient $O \( r beta \)$.
    Differentiating $K_j$ gives $r beta Psi^0$. The remaining products have smaller orders and bounded
    coefficients. Since $r beta lt.eq epsilon \/ beta$, all constants in (5.30) are uniform as the lower threshold
    $beta_0$ increases.
  Apply Proposition 19 to the four entries of $phi$. By the definition of $cal(N)$,
  $ parallel phi parallel_(L^2 \( Y \; H^1 \)) lt.eq beta_0^(- 1) cal(N) \( phi \) \, wide
    parallel r nabla phi parallel_(L^2) lt.eq epsilon beta_0^(- 2) cal(N) \( phi \) . $
  It follows that
  $ cal(N) \( phi \) lt.eq C_0 parallel P phi parallel_(L^2) +
    C_0 C \( beta_0^(- 1) + epsilon beta_0^(- 2) \) cal(N) \( phi \) . $
  Increase the fixed lower threshold so that the last coefficient is at most $1 \/ 2$. This proves the assertion.
    In the parameter choices for the construction, this increase is made when $p_(*)$ is chosen,
    before $epsilon$ and the radius amplitude are fixed. ◻
]

We record two bounds needed to use coercivity on the actual density. First, $P_0 1$ is uniformly bounded:
  the raising part in (5.12) annihilates constants, the zeroth base coefficient of $cal(U)$ is bounded in $Psi^2$,
  and $cal(J)$ is bounded in $Psi^1$. Equation (5.30) then shows that $P I$ is uniformly bounded in $L^2$.
  Second, for any fixed smooth base cutoff $chi$,

#[#set math.equation(numbering: n => "(5.31)")
 $ parallel \[ P \, chi \] w parallel_(L^2) lt.eq
   C_chi
   (parallel w parallel_(L^2 \( cal(O)_chi \; H^1 \( S_y \) \)) + parallel r nabla w parallel_(L^2 \( S_gamma
   cal(O)_chi \))) \, $ <ang:cutoff-bound>]

where $cal(O)_chi$ is any fixed small neighborhood of the supports of its derivatives.
  Indeed, $\[ 2 T \, chi \] = 2 sum_i sans(A)_i^(*) \( nabla_i chi \)$,
  $cal(U)$ has second base coefficient $r Q^(i j)$ and first base coefficients bounded in $Psi^1$,
  and $cal(J)$ commutes with $chi$. The additional first base coefficients of $P - P_0$ are $r Psi^0$, by (5.29).
  These observations give exactly (5.31).

#thm([Proposition 5.5.])[
  (Uniform transfer density).  #emph[Choose the fixed geometry as in Section 4,
    then choose $p_(*)$ sufficiently large, $epsilon > 0$ sufficiently small,
    and the radius amplitude $R_(*) > 0$ sufficiently small that $r_delta beta_delta^2 lt.eq
    epsilon$ for $0 < delta lt.eq 1$. For all sufficiently small spatial dilations there is a constant $C$,
    independent of the dilation and $delta$, such that
#[#set math.equation(numbering: n => "(5.32)")
 $ parallel chi psi_delta parallel_(L^2 \( S_gamma Y \)) lt.eq C $ <ang:density-bound>]

 whenever $sum_(\| alpha \| lt.eq 8) \| partial^alpha h \| lt.eq epsilon r_delta$ on $Y$.
   Here $chi$ is the fixed cutoff from (4.9) and $psi_delta$ is the left-acting matrix density of Proposition 15.]
] <ang:density>

#proof[
  The reproduction identity $integral psi_delta thin d sigma_y = I$ makes $phi =
    chi \( psi_delta - I \)$ mean zero on each sphere. It is smooth and compactly supported in the base.
    Equation (5.9) gives
  $ P phi = - chi P I + \[ P \, chi \] \( psi_delta - I \) . $
  The first term has the uniform bound just established. For the second,
    (5.31) requires only one angular derivative and $r nabla psi_delta$ on the cutoff derivative region.
    The uniform bounds of Lemma 16 supply these: in the lower region the density is the normalized ball evaluation
    kernel, and in the other region the radii have a fixed positive lower bound.
    System coercivity bounds $cal(N) \( phi \)$, hence $parallel phi parallel_(L^2)$, uniformly.
    Adding the fixed matrix function $chi I$ proves (5.32). ◻
]

The estimate controls the density of the actual transfer functional.
  In the next section its first and second Taylor moments will turn this bound into quantitative information about
  the difference of the two harmonic-frame equations.

== 6 Matrix moments and extension across the contact point <sec:matrix>

The transfer density constructed in Section 4 has a uniform $L^2$ bound whenever the two normalized principal
  tensors differ by at most a small multiple of the sphere radius.
  We now improve that comparison from order $r$ to order $r^(3 \/ 2)$.
  This strict improvement will allow the radii to tend to zero while keeping one fixed dilation of the original
  coordinates.

The scalar argument uses affine and quadratic moments of the transfer density;
  see #cite(label("ScalarCompanion2026")) Section 6. In a harmonic frame,
  the first moments are matrices and need not vanish. We approximate them by a matrix-valued displacement
  independent of the shrinking parameter. Its component complementary to the real scalar matrices satisfies a
  first-order system with conformal Killing principal part.
  The finite-type property of that system provides the additional power of the radius.

=== 6.1 A finite family of harmonic jets <a-finite-family-of-harmonic-jets>

We use the coordinates and harmonic frames of Proposition 6. Before dilation, their matrix coordinate functions satisfy

$ 1 / 2 "Re" "tr" X_j^l \( x \) = x^l \, wide X_j^l \( 0 \) = 0 \, wide partial_i X_j^l \( 0 \) = delta_i^l I \,
  wide 1 lt.eq l lt.eq n . $

There are also finitely many paired harmonic columns whose value and gradient vanish at the origin and whose
  first-side Hessians form a basis of the vector-valued trace-free symmetric Hessians there.
  All these pairs agree on the known side of the contact hypersurface.

For the dilation parameter $lambda$, replace the coordinate matrices by

#[#set math.equation(numbering: n => "(6.1)")
 $ hat(X)_j^l \( y \) = lambda^(- 1) X_j^l \( lambda y \) \, $ <mat:renormalized-coordinates>]

and replace each of the additional columns $u_j$ by $lambda^(- 2) u_j \( lambda y \)$. Let

$ \( v_(1 \, nu) \, v_(2 \, nu) \) \, wide 1 lt.eq nu lt.eq N \, $

be the resulting list of column pairs, including all columns of the $hat(X)_j^l$.
  The list is finite and fixed independently of the shrinking parameter $delta$.
  Taylor’s formula at the origin shows that these functions have uniform bounds of every fixed smooth order on the
  fixed dilation range. To obtain the second-side bounds, note that each paired difference,
  expressed in the common coordinates, vanishes on an open set accumulating at the origin.
  Every derivative therefore vanishes at the origin by continuity.
  Each additional column pair thus has zero value and gradient on both sides,
  as required for its quadratic rescaling; the coordinate pairs have the common zero value required for linear
  rescaling. Taylor’s formula then gives uniform bounds of every fixed order on both sides.

Recall the harmonic-frame equations, written with positive definite second-derivative coefficients:

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(L)_1 = a^(i j) partial_i partial_j + B_1^i partial_i \, wide cal(L)_2 = Q^(i j) partial_i partial_j +
   B_2^i partial_i \, wide Q = a + h . $ <mat:operators>]

The tensors $a \, Q$ are real and scalar in the fiber index; the $B_j^i$ are complex $2 times 2$ matrices.
  All coefficients have uniform smooth bounds for small $lambda$.
  There is no zeroth-order term because the columns of the frames are harmonic.
  In ordinary coordinates, $B_j^i arrow.r 0$ smoothly under dilation, whereas $a arrow.r e^(2 L t_0) I_n$.

#thm([Lemma 6.1.])[
  (Uniform spanning by the selected jets).  #emph[For all sufficiently small $lambda$ and every $y in Y$, the vectors
$ #scale(x: 120%, y: 120%)[\(] partial_i v_(1 \, nu) \( y \) \,
  partial_i partial_j v_(1 \, nu) \( y \) #scale(x: 120%, y: 120%)[\)] \, wide 1 lt.eq nu lt.eq N \, $

 span, over $bb(C)$, the space of pairs $\( p \, H \)$ with $p_i in bb(C)^2$ and $H_(i j) =
   H_(j i) in bb(C)^2$ satisfying
#[#set math.equation(numbering: n => "(6.3)")
 $ a^(i j) H_(i j) + B_1^i p_i = 0 . $ <mat:jet-constraint>]

 The coefficients realizing prescribed such data may be chosen by a smooth right inverse,
   with uniform bounds to every fixed order.]
] <mat:spanning>

#proof[
  As $lambda arrow.r 0$, the coordinate columns converge smoothly to $y^l e_alpha$, $1 lt.eq l lt.eq n$, $1 lt.eq
    alpha lt.eq 2$, where $e_alpha$ is the standard basis of $bb(C)^2$.
    The additional columns converge to the trace-free quadratic polynomials specified by their Hessians at the
    origin. At any point $y$, the latter give arbitrary trace-free Hessians,
    and the affine columns correct their gradients to any prescribed values.
    Thus the limiting jets span all $\( p \, H \)$ with $sum_i H_(i i) = 0$, uniformly for $y in Y$.
  The spaces in (6.3) form a smooth vector bundle of constant rank:
    contraction with the positive definite tensor $a$ is onto $bb(C)^2$.
    They can be trivialized by the gradient and the trace-free part of the Hessian,
    the remaining trace being determined by (6.3). In this trivialization the selected jets give a smooth matrix
    of constant full row rank at $lambda = 0$. Compactness of $Y$ preserves this rank,
    with a positive lower bound on its nonzero singular values, for small $lambda$.
    If this matrix is $T$, the right inverse $T^(*) \( T T^(*) \)^(- 1)$ has the asserted smoothness and uniform
    bounds. Each selected column satisfies (6.3), so its range is precisely the stated space. ◻
]

=== 6.2 Displacement and weighted remainders <displacement-and-weighted-remainders>

Throughout the next three subsections we fix $0 < delta lt.eq 1$ and assume the provisional comparison

#[#set math.equation(numbering: n => "(6.4)")
 $ H_8 \( y \) := sum_(\| alpha \| lt.eq 8) \| partial^alpha h \( y \) \| lt.eq epsilon r_delta \( y \) \, wide
   y in Y . $ <mat:provisional>]

Write $r = r_delta$. Since $r_(delta') gt.eq r_delta$ when $delta' gt.eq delta$,
  the bound (6.4) also holds with every intermediate radius used to continue from $delta' = 1$ to $delta' =
  delta$. Proposition 15 and Proposition 21 give

#[#set math.equation(numbering: n => "(6.5)")
 $ v_(2 \, nu) \( y \) & = integral_(S_y) psi \( y \, omega \) thin v_(1 \, nu) #scale(x: 120%, y: 120%)[\(]
   exp_y^gamma \( r \( y \) omega \) #scale(x: 120%, y: 120%)[\)] thin d sigma_y \( omega \) \,\
integral_(S_y) psi \( y \, omega \) thin d sigma_y \( omega \) & = I \, wide
  parallel chi psi parallel_(L^2 \( Y times S_y \)) lt.eq C . $ <mat:transfer-input>]

The constant is independent of $delta$ and of sufficiently small $lambda$.
  The measure in the last norm is $d V_gamma \( y \) d sigma_y \( omega \)$;
  on the fixed coordinate range it is uniformly equivalent to the corresponding Euclidean base measure.

Set $x \( y \, omega \) = exp_y^gamma \( r \( y \) omega \)$.
  The first Taylor coefficients of the transfer formula involve the matrix moments

$ M^i \( y \) = integral_(S_y) psi \( y \, omega \) #scale(x: 120%, y: 120%)[\(] x^i \( y \, omega \) -
  y^i #scale(x: 120%, y: 120%)[\)] thin d sigma_y \( omega \) . $

These moments depend on $delta$ through the density and the sphere.
  We need a displacement that remains fixed as the radii shrink.
  The paired coordinate matrices provide such a choice, and the moment estimate below will show that it differs
  from $M$ only by a second-order error.

Define matrices $D^i \( y \)$, $1 lt.eq i lt.eq n$, by the linear system

#[#set math.equation(numbering: n => "(6.6)")
 $ hat(X)_2^l - hat(X)_1^l = sum_i D^i partial_i hat(X)_1^l \, wide 1 lt.eq l lt.eq n . $ <mat:displacement>]

The map on the right sends the $n$ matrices $D^i$ to $n$ matrices by right multiplication with the indicated
  coefficients. It converges uniformly, with derivatives, to the identity map because $partial_i hat(X)_1^l
  arrow.r delta_i^l I$. Hence (6.6) defines smooth $D^i$ with uniform smooth bounds.
  In particular, $D$ is independent of $delta$. For each selected pair define

#[#set math.equation(numbering: n => "(6.7)")
 $ R_nu = v_(2 \, nu) - v_(1 \, nu) - D^i partial_i v_(1 \, nu) . $ <mat:remainder>]

These remainders also have uniform smooth bounds and are independent of $delta$.

#thm([Lemma 6.2.])[
  (Weighted moment bounds).  #emph[Under (6.4),
#[#set math.equation(numbering: n => "(6.8)")
 $ parallel chi D \/ r parallel_(L^2 \( Y \)) lt.eq C \, wide
   parallel chi R_nu \/ r^2 parallel_(L^2 \( Y \)) lt.eq C \, wide 1 lt.eq nu lt.eq N . $ <mat:weighted-moments>]

 The constants are uniform in $delta$ and small $lambda$.]
] <mat:moments>

#proof[
  Writing $rho \( y \) = parallel psi \( y \, dot.op \) parallel_(L^2 \( S_y \))$,
    uniform normal coordinates and Cauchy–Schwarz give $\| M \( y \) \| lt.eq C r \( y \) rho \( y \)$.
    Taylor expansion in the fixed chart, followed by (6.5), gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ v_(2 \, nu) - v_(1 \, nu) = M^i partial_i v_(1 \, nu) + E_nu \, wide \| E_nu \( y \) \| lt.eq
     C r \( y \)^2 rho \( y \) . $ <mat:taylor-transfer>]
  This calculation uses only the uniform second derivatives of the selected columns and $\| x - y \| lt.eq C r$;
    the coordinate displacement is a scalar, so no matrix factors have been interchanged.
  Apply the same calculation to the coordinate matrices. Subtracting (6.6) shows that the uniformly invertible map
    defining $D$ sends $D - M$ to an error bounded by $C r^2 rho$. Therefore
  $ \| D - M \| lt.eq C r^2 rho \, wide \| D \| lt.eq C r rho \, wide \| R_nu \| lt.eq C r^2 rho . $
  Multiplication by $chi$ and integration prove (6.8). ◻
]

The next estimate turns these weighted $L^2$ bounds into bounds for enough derivatives to compare the equations.
  No derivative of the shrinking radius is taken in this interpolation step.

#thm([Lemma 6.3.])[
  (Pointwise interpolation).  #emph[Choose
$ d_(*) = 10 + n / 2 \, wide eta = frac(1, 2 d_(*)) \, wide p_(*) > 2 d_(*) \, wide m gt.eq ceil.l 10 +
  3 d_(*) ceil.r . $

 There is a fixed $rho_0 > 0$ such that, if $y in K$ and $r \( y \) < rho_0$, then
#[#set math.equation(numbering: n => "(6.10)")
 $ sum_(\| alpha \| lt.eq 10) \| partial^alpha D \( y \) \| lt.eq C r \( y \)^(1 \/ 2) \, wide
   sum_(\| alpha \| lt.eq 10) \| partial^alpha R_nu \( y \) \| lt.eq C r \( y \)^(3 \/ 2) . $ <mat:pointwise>]

 The threshold and constants are independent of $delta$ and small $lambda$.]
] <mat:interpolation>

#proof[
  By Lemma 11, $r^(1 \/ p_(*))$ has a uniform Lipschitz constant. Set $s = r \( y \)^eta$.
    Since $eta > 1 \/ p_(*)$, for $r \( y \)$ sufficiently small every $z in B \( y \, s \)$ satisfies
  $ \| r \( z \)^(1 \/ p_(*)) - r \( y \)^(1 \/ p_(*)) \| lt.eq C r \( y \)^eta lt.eq 1 / 2 r \( y \)^(1 \/ p_(*)) . $
  Consequently $c r \( y \) lt.eq r \( z \) lt.eq C r \( y \)$ on this ball,
    with constants depending only on the fixed $p_(*)$. Because $chi =
    1$ on a neighborhood of the compact set $K$, the ball lies in that neighborhood after a further fixed
    reduction of $rho_0$. The weighted bounds yield
  $ parallel D parallel_(L^2 \( B \( y \, s \) \)) lt.eq C r \( y \) \, wide
    parallel R_nu parallel_(L^2 \( B \( y \, s \) \)) lt.eq C r \( y \)^2 . $
  For any smooth vector- or matrix-valued function $U$ with a bounded $C^m$ norm, Taylor expansion to degree $m -
    1$ and equivalence of norms on the finite-dimensional polynomial space give
  #[#set math.equation(numbering: n => "(6.11)")
   $ \| partial^alpha U \( y \) \| lt.eq C s^(- \| alpha \| - n \/ 2) parallel U
     parallel_(L^2 \( B \( y \, s \) \)) + C_m s^(m - \| alpha \|) \,
     wide \| alpha \| < m . $ <mat:taylor-interpolation>]
  Indeed the Taylor remainder has $L^2$ norm at most $C_m s^(m + n \/ 2)$, and,
    after rescaling the ball to unit radius, each coefficient of its Taylor polynomial is bounded by that
    polynomial’s $L^2$ norm. This proves the displayed inequality componentwise.
  For $\| alpha \| lt.eq 10$, the first term of (6.11) applied to $D$ is at most $C r \( y \)^(1 - eta d_(*)) =
    C r \( y \)^(1 \/ 2)$; for $R_nu$ it is at most $C r \( y \)^(2 - eta d_(*)) = C r \( y \)^(3 \/ 2)$.
    The second term is at most $C_m r \( y \)^(eta \( m - 10 \)) lt.eq C_m r \( y \)^(3 \/ 2)$,
    taking $rho_0 lt.eq 1$. This proves (6.10). ◻
]

=== 6.3 The equation for the displacement <the-equation-for-the-displacement>

The weighted moments give a preliminary $r^(1 \/ 2)$ bound for $D$.
  To improve it, we compare the two harmonic equations on the selected columns.
  This comparison separates the scalar tensor $h$ from the matrix part of $D$.

For a selected first-side column write $w = v_(1 \, nu)$ and $R = R_nu$.
  Using $v_(2 \, nu) = w + D^k partial_k w + R$, expand $cal(L)_2 v_(2 \, nu) = 0$ and use $cal(L)_1 w = 0$.
  In the third derivatives use

$ a^(i j) partial_i partial_j partial_k w = - \( partial_k a^(i j) \) partial_i partial_j
  w - \( partial_k B_1^i \) partial_i w - B_1^i partial_i partial_k w . $

The resulting identity is

#[#set math.equation(numbering: n => "(6.12)")
 $ & #scale(x: 120%, y: 120%)[\[] h^(i j) I + a^(l i) partial_l D^j + a^(l j) partial_l D^i +
   cal(B)^(i j) \( D \) #scale(x: 120%, y: 120%)[\]] partial_i partial_j w + cal(Y)^i partial_i w\
 & #h(15mm)  = - cal(L)_2 R - 2 h^(i j) \( partial_i D^k \) partial_j partial_k w -
   D^k h^(i j) partial_i partial_j partial_k w \,\
 & cal(B)^(i j) \( D \) = - D^k partial_k a^(i j) + 1 / 2 #scale(x: 120%, y: 120%)[\(] B_2^i D^j + B_2^j D^i -
   D^j B_1^i - D^i B_1^j #scale(x: 120%, y: 120%)[\)] \,\
 & cal(Y)^k = B_2^k - B_1^k + Q^(i j) partial_i partial_j D^k + B_2^i partial_i D^k -
   D^l partial_l B_1^k . $ <mat:comparison-identity>]

In particular, $cal(Y)$ is independent of the selected column.
  The order of the factors in (6.12) records the noncommutativity of the matrix drifts.
  The drift of $cal(L)_2$ acting on $D^k partial_k w$ places $B_2^i$ on the left of $D^k$,
  while differentiating the first-side equation places $B_1^i$ on its right.

Let $Pi$ be the projection of symmetric contravariant spatial tensors onto their $gamma$-trace-free part,
  acting entrywise on matrices:

$ \( Pi T \)^(i j) = T^(i j) - 1 / n #scale(x: 120%, y: 120%)[\(] gamma_(k l) T^(k l) #scale(x: 120%, y: 120%)[\)]
  a^(i j) . $

Recall that $gamma_(i j) h^(i j) = 0$.

#thm([Lemma 6.4.])[
  (Projected displacement equation).  #emph[There is a smooth matrix-valued symmetric tensor $cal(E)$ such that
#[#set math.equation(numbering: n => "(6.13)")
 $ h^(i j) I + Pi #scale(x: 120%, y: 120%)[\(] a^(l i) partial_l D^j + a^(l j) partial_l D^i +
   cal(B)^(i j) \( D \) #scale(x: 120%, y: 120%)[\)] = cal(E)^(i j) . $ <mat:projected>]

 For $y in K$ with $r \( y \) < rho_0$,
#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(\| alpha \| lt.eq 8) \| partial^alpha cal(E) \( y \) \| lt.eq C r \( y \)^(3 \/ 2) . $ <mat:E-bound>]

]
] <mat:projected-equation>

#proof[
  Denote the right-hand side of (6.12) for the column $v_(1 \, nu)$ by $Z_nu$.
    Its derivatives through order eight are bounded by $C r^(3 \/ 2)$ on the stated set.
    For $cal(L)_2 R_nu$ this uses derivatives of $R_nu$ through order ten in (6.10).
    Every derivative of either remaining product contains a derivative of $h$ of order at most eight and a
    derivative of $D$ of order at most nine or eight, respectively.
    Thus (6.4) and (6.10) give the factor $r thin r^(1 \/ 2)$.
    The other factors are fixed smooth derivatives of the selected columns.
  At each point, Lemma 22 permits linear combinations of the identities (6.12) for which the combined gradient is
    zero and the combined Hessian is any prescribed $a$-trace-free symmetric covariant tensor with values in
    $bb(C)^2$. Such Hessians satisfy (6.3) with zero gradient.
    They annihilate the $cal(Y)$ term and test precisely the $gamma$-trace-free part of the coefficient of the Hessian.
  More explicitly, choose a smooth uniformly bounded basis $H_s$ of scalar symmetric Hessians with
    $a^(i j) \( H_s \)_(i j) = 0$, and use the right inverse in Lemma 22 to realize $H_s e_alpha$, for $alpha =
    1 \, 2$, with zero gradient. The resulting combinations of $Z_nu$ give the two columns of the contraction of
    the projected coefficient with $H_s$. Inverting this spatial duality defines $cal(E)$ and proves (6.13).
    The coefficients realizing these prescribed jets are smooth functions of $y$ and give zero combined gradient
    identically. We form these combinations before differentiating, so the $cal(Y)$ term is identically zero.
    The resulting formula expresses $cal(E)$ using only the $Z_nu$ and coefficients with uniformly bounded
    derivatives. Differentiating that formula through order eight proves (6.14),
    without introducing derivatives of $cal(Y)$. ◻
]

Define the real-linear projection on matrices

$ q \( Z \) = Z - 1 / 2 "Re" "tr" \( Z \) I \, wide cal(V)_0 = { Z in bb(C)^(2 times 2) : "Re" "tr" Z = 0 } . $

Write $D^i = d^i I + W^i$, where $d^i in bb(R)$ and $W^i in cal(V)_0$.
  Taking half the real trace in (6.6), and using the exact trace coordinate identity for both sides, gives

#[#set math.equation(numbering: n => "(6.15)")
 $ d^l = - 1 / 2 "Re" "tr" sum_i W^i partial_i hat(X)_1^l . $ <mat:scalar-direction>]

Thus $d$ is a zero-order real-linear expression in $W$ with uniformly smooth coefficients.

Apply $q$ in the matrix index to (6.13). The term $h^(i j) I$ vanishes,
  as do all derivative terms involving $d^i I$. Substituting (6.15) in the remaining zero-order terms gives

#[#set math.equation(numbering: n => "(6.16)")
 $ Pi #scale(x: 120%, y: 120%)[\(] a^(l i) partial_l W^j + a^(l j) partial_l W^i #scale(x: 120%, y: 120%)[\)] +
   cal(B)_0^(i j) \( W \) = cal(E)_0^(i j) \, wide cal(E)_0 = q \( cal(E) \) . $ <mat:CK-system>]

Here $cal(B)_0$ is a real-linear zeroth-order operator with uniformly smooth coefficients,
  and $cal(E)_0$ satisfies (6.14). There are no hidden first derivatives in $cal(B)_0$:
  differentiation of (6.15) occurs only in the terms proportional to $I$, which have already been removed by $q$.

=== 6.4 Finite type and the improved estimate <finite-type-and-the-improved-estimate>

We prove the finite-type statement needed for (6.16). In Euclidean space,
  conformal Killing vector fields have degree at most two; see, for example,
  #cite(label("Eastwood2005")) Section 3. The calculation below establishes the corresponding injectivity on third
  derivatives and includes the uniformity needed for the variable-coefficient equation.

#thm([Lemma 6.5.])[
  (Prolongation of the conformal Killing principal part).  #emph[Let $n gt.eq 3$, let $a =
    gamma^(- 1)$ be a smooth positive definite tensor on a coordinate domain,
    and let $V$ be a finite-dimensional real vector space. Suppose that a $V$-valued vector field $W$ satisfies
$ Pi #scale(x: 120%, y: 120%)[\(] a^(l i) partial_l W^j + a^(l j) partial_l W^i #scale(x: 120%, y: 120%)[\)] +
  C^(i j) \( W \) = E^(i j) \, $

 where $C$ is a smooth real-linear zeroth-order operator. Every third derivative of $W$ is then a smooth linear
   combination of derivatives of $W$ through order two and derivatives of $E$ through order two.
   The coefficient bounds are uniform when $a$ is uniformly elliptic and the indicated background coefficients
   range in bounded smooth sets.]
] <mat:finite-type>

#proof[
  Differentiate the equation twice. At a point, its highest-order part is a linear map from the tensor of third
    derivatives of $W$ to the twice-differentiated trace-free symmetric gradient.
    We first show that this map is injective. A constant linear change of coordinates sets $a^(i j) =
    delta^(i j)$ at the point, and each real component of $V$ can be considered separately.
  A tensor in the kernel defines a homogeneous cubic vector field $Z$ whose trace-free symmetric gradient
    vanishes: that gradient is homogeneous quadratic and all of its second derivatives are zero. Hence
  #[#set math.equation(numbering: n => "(6.17)")
   $ partial_i Z_j + partial_j Z_i = 2 delta_(i j) sigma \, wide sigma = 1 / n "div" Z . $ <mat:CK-cubic>]
  Differentiating and combining the three permutations of the indices gives
  $ partial_i partial_j Z_k = delta_(j k) partial_i sigma + delta_(i k) partial_j sigma -
    delta_(i j) partial_k sigma . $
  Taking divergence in $k$ yields
  $ \( n - 2 \) partial_i partial_j sigma = - delta_(i j) Delta sigma . $
  Its trace gives $\( 2 n - 2 \) Delta sigma = 0$; since $n gt.eq 3$, the Hessian of $sigma$ is zero.
    The preceding formula therefore gives $partial_i partial_j partial_l Z_k = 0$,
    so the homogeneous cubic $Z$ vanishes. This proves injectivity.
  Let $T_a$ denote this injective map on third-derivative tensors,
    using fixed Euclidean inner products on the finite-dimensional tensor spaces.
    It has the smooth left inverse $\( T_a^(*) T_a \)^(- 1) T_a^(*)$.
    Uniform ellipticity and compactness of bounded coefficient ranges give uniform bounds for this inverse.
    All other terms in the twice-differentiated equation contain at most two derivatives of $W$ or of $E$.
    Applying the left inverse proves the claim, including the smooth coefficient bounds after further fixed
    numbers of differentiations. ◻
]

#thm([Proposition 6.6.])[
  (Strict improvement of the principal tensors).  #emph[With the fixed choices in Lemma 24,
    there are constants $C$ and $rho_0 > 0$, uniform for sufficiently small $lambda$, such that (6.4) implies
#[#set math.equation(numbering: n => "(6.18)")
 $ H_8 \( y \) lt.eq C r_delta \( y \)^(3 \/ 2) wide upright("if ") y in K upright(" and ") r_delta \( y \) <
   rho_0 . $ <mat:improved-h>]

 On the same set, the derivatives of $D$ through order nine are bounded by $C r_delta^(3 \/ 2)$.]
] <mat:improvement>

#proof[
  Apply Lemma 26 to (6.16) with $V = cal(V)_0$. For each multi-index $alpha$ of order three,
    it gives an identity of the form
  #[#set math.equation(numbering: n => "(6.19)")
   $ partial^alpha W = sum_(\| zeta \| lt.eq 2) C_(alpha zeta) partial^zeta W +
     sum_(\| zeta \| lt.eq 2) F_(alpha zeta) partial^zeta cal(E)_0 \, $ <mat:prolongation>]
  with uniformly smooth coefficient maps.
  Fix $y in K$ with $r \( y \) < rho_0$. By the core geometry of Section 4.2, the vertical segment
  $ z \( s \) = \( y' \, s \) \, wide - 1 / 2 lt.eq s lt.eq y_n \, $
  stays in $K$, and $r \( z \( s \) \) lt.eq r \( y \)$. At its initial point, $D$ and all its derivatives vanish:
    the paired coordinate matrices agree on an open neighborhood in the known lower region. The same holds for $W$.
  Let $cal(W) \( s \)$ consist of all coordinate derivatives of $W$ through order two at $z \( s \)$.
    Differentiating this vector with respect to $s$ either gives another one of its components or a third
    derivative, to which (6.19) applies. Thus
  $ cal(W)' \( s \) = A \( s \) cal(W) \( s \) + F \( s \) \, wide cal(W) \( - 1 / 2 \) = 0 \,
    wide \| A \( s \) \| lt.eq C \, wide \| F \( s \) \| lt.eq C r \( y \)^(3 \/ 2) . $
  The bound for $F$ follows from (6.14), since the entire segment has radius below $rho_0$.
    Its length is uniformly bounded, so the elementary integral form of Gronwall’s inequality gives
  $ sum_(\| alpha \| lt.eq 2) \| partial^alpha W \( y \) \| lt.eq C r \( y \)^(3 \/ 2) . $
  This argument holds at every point of the stated set. Differentiating (6.19) $k - 3$ times, for $3 lt.eq k lt.eq
    9$, expresses the derivatives of $W$ of order $k$ in terms of its derivatives through order $k -
    1$ and derivatives of $cal(E)_0$ through order $k - 1$. Induction and (6.14) therefore give the same bound
    through order nine. Notice that the last step uses precisely eight derivatives of $cal(E)_0$.
  Equation (6.15) now gives the same estimates for $d$ and hence for $D$.
    Finally, differentiate (6.13) through order eight. Its right-hand side uses derivatives of $D$ through order
    nine and of $cal(E)$ through order eight, all bounded by $C r^(3 \/ 2)$. This proves (6.18). ◻
]

=== 6.5 One dilation for all shrinking radii <one-dilation-for-all-shrinking-radii>

We have proved the strict improvement assuming the provisional bound.
  We now remove that assumption for all positive shrinking parameters. The order of choices matters:
  the threshold for the improvement must be fixed before the final choice of the dilation.

#thm([Proposition 6.7.])[
  (Local equality of the normalized equations).  #emph[In the contact coordinates and harmonic frames of
    Proposition 6, there is a neighborhood of the origin on which the two metrics are smoothly conformal and the
    harmonic-frame equations, multiplied by the positive scalars making their principal tensors equal, coincide.
    All the finitely many selected pairs of harmonic-frame columns agree on that neighborhood.]
] <mat:local>

#proof[
  First fix the reference geometry and uniform smooth bounds for all sufficiently small dilations.
    Choose $p_(*)$ large enough for the sphere geometry, the angular estimate, and Lemma 24.
    Next choose $epsilon$ sufficiently small and $R_(*)$ sufficiently small to satisfy those results,
    including $r beta^2 lt.eq epsilon$. As explained in Remark 12,
    every fixed-separation range needed for the continuation and cutoff bounds is then fixed before $lambda$.
    Proposition 21 and all estimates of this section have constants uniform for sufficiently small $lambda$.
  Choose $0 < rho_(*) < rho_0$, with $rho_(*) lt.eq 1$, so small that $C rho_(*)^(1 \/ 2) lt.eq
    epsilon \/ 2$ in (6.18). Thus, wherever that estimate applies and $r_delta < rho_(*)$,
    it improves (6.4) to $H_8 lt.eq epsilon r_delta \/ 2$.
  As $lambda arrow.r 0$, $h arrow.r 0$ in $C^8 \( Y \)$. The numbers
  $ rho_(*) \, wide min_Y r_1 \, wide R_(*) \( 2 t_b \)^(p_(*)) $
  are positive and fixed independently of $lambda$. We can therefore choose one sufficiently small $lambda$ such that
  #[#set math.equation(numbering: n => "(6.20)")
   $ sup_Y H_8 lt.eq epsilon / 2 min { rho_(*) \, min_Y r_1 \, R_(*) \( 2 t_b \)^(p_(*)) } . $ <mat:final-dilation>]
  We also make the known lower region contain ${ y_n < - 1 \/ 4 }$ on the fixed ranges,
    as in the sphere construction. Fix this $lambda$ for the rest of the proof.
  Let
  $ cal(I) = { delta in \( 0 \, 1 \] : H_8 \( y \) lt.eq epsilon r_delta \( y \) upright(" for every ") y in Y } . $
  It contains $1$ by (6.20). For any $delta in cal(I)$, the preceding estimates improve the inequality to $H_8
    lt.eq epsilon r_delta \/ 2$ throughout $Y$. Indeed, Proposition 27 handles the points in $K$ with $r_delta <
    rho_(*)$. Equation (6.20) handles all points with $r_delta gt.eq rho_(*)$.
    At a point outside $K$, either $y_n < - 1 \/ 2$, where equality of the coefficients is already known,
    or $t > 2 t_b$. In the latter case $ell_delta \( t \) gt.eq t$, so $r_delta gt.eq
    R_(*) \( 2 t_b \)^(p_(*))$ and (6.20) again applies.
  The set $cal(I)$ is relatively closed in $\( 0 \, 1 \]$ by continuity and compactness of $Y$.
    It is also relatively open: at any positive $delta$, the radius has a positive minimum on $Y$,
    so the strict factor $1 \/ 2$ just proved persists for nearby parameter values in the weaker defining
    inequality. Since $\( 0 \, 1 \]$ is connected, $cal(I) = \( 0 \, 1 \]$.
  On the fixed open set $K^compose ∩ { t < 0 }$, which contains the origin, $r_delta arrow.r 0$ as $delta arrow.r
    0$. The coefficients $h \, D \, R_nu$ are independent of $delta$. The provisional bound and (6.10) therefore imply
  $ h = 0 \, wide D = 0 \, wide R_nu = 0 $
  there. In particular all selected pairs agree. Subtracting their equations now gives
  $ \( B_2^i - B_1^i \) partial_i v_(1 \, nu) = 0 wide \( 1 lt.eq nu lt.eq N \) . $
  The gradient projection of the space (6.3) is all of $\( bb(C)^2 \)^n$:
    for any gradient one can choose the trace of the Hessian to satisfy that constraint.
    Lemma 22 therefore implies $B_1 = B_2$. Together with $Q = a$,
    this proves equality of the normalized harmonic-frame operators.
    The definition of $Q$ shows that the two inverse metrics are positive scalar multiples,
    so the metrics are smoothly conformal. Undoing the fixed dilation proves the stated conclusion in the original
    contact coordinates. ◻
]

The remaining conformal factor and the metric carried by the harmonic frames are addressed next.
  The local conclusion just proved supplies the equality of equations needed to recover both the Riemannian metric
  and a unitary connection identification.

== 7 Exact identification and the measured boundary <glob:section>

Proposition 28 identifies the metric up to conformal scale and identifies the normalized equations in harmonic
  frames near a contact point. We first show why, for a connection Laplacian without an additional potential,
  this is already an exact local isometry with a unitary connection identification.
  We then return to the maximal match of Section 2 and prove that it extends over the whole manifold and fixes
  every part of the measured boundary.

=== 7.1 Removing the conformal factor <removing-the-conformal-factor>

#thm([Lemma 7.1.])[
  (Exact local identification).  #emph[In the contact coordinates and unitary frames of Proposition 6,
    suppose that on a connected neighborhood $Omega$ of zero the metrics satisfy $g_2 = e^(2 omega) g_1$,
    and that the equations in the harmonic frames $F_j$, after scalar normalization to the same principal part,
    have equal first-order coefficients. Then
$ g_2 = g_1 \, wide J_(upright("loc")) = F_1 F_2^(- 1) in U \( 2 \) \, wide d_(A_1) \( J_(upright("loc")) u \) =
  J_(upright("loc")) d_(A_2) u quad upright("on ") Omega . $

 Moreover this identification agrees with the old match on the known side and matches all corresponding source
   evaluations throughout $Omega$.]
] <glob:conformal>

#proof[
  Let
  $ C_j = F_j^(- 1) \( d F_j + A_j F_j \) . $
  These are the connection matrices in the harmonic frames;
    they need not be skew-Hermitian in the standard matrix inner product.
    The negative of the actual connection Laplacian, expressed in such a frame, is
  $ Delta_(g_j \, C_j) =
    g_j^(i l) #scale(x: 120%, y: 120%)[\(] \( partial_i + C_(j \, i) \) \( partial_l + C_(j \, l) \) -
    Gamma_(i l)^k \( g_j \) \( partial_k + C_(j \, k) \) #scale(x: 120%, y: 120%)[\)] . $
  Its zeroth-order term is zero, because the columns of $F_j$ are harmonic.
    The common-principal-part hypothesis therefore says
  #[#set math.equation(numbering: n => "(7.1)")
   $ e^(2 omega) Delta_(g_2 \, C_2) = Delta_(g_1 \, C_1) . $ <glob:equal-frame-operators>]
  Indeed their second-order coefficients agree after the indicated conformal normalization,
    their first-order coefficients agree by assumption, and both zeroth-order coefficients vanish.
  Put $phi.alt = \( n - 2 \) omega \/ 2$. The conformal change of the Christoffel symbols gives
  $ e^(2 omega) Delta_(g_2 \, C_2) = Delta_(g_1 \, C_2) + 2 chevron.l d phi.alt \, partial + C_2 chevron.r_(g_1) . $
  Comparison of first-order terms with (7.1) yields $C_2 = C_1 - d phi.alt thin I$.
    Substitution, with matrix multiplication in its displayed order, gives
  $ Delta_(g_1 \, C_1 - d phi.alt I) + 2 chevron.l d phi.alt \, partial + C_1 - d phi.alt I chevron.r_(g_1) & =
    Delta_(g_1 \, C_1) - \( Delta_(g_1) phi.alt + \| d phi.alt \|_(g_1)^2 \) I . $
  Here $Delta_(g_1) = "div"_(g_1) nabla_(g_1)$. The zeroth-order terms in (7.1) consequently imply
  $ Delta_(g_1) phi.alt + \| d phi.alt \|_(g_1)^2 = 0 \, wide Delta_(g_1) \( e^phi.alt \) = 0 . $
  On the known open side the metrics already agree, so $e^phi.alt = 1$.
    Unique continuation on $Omega$ gives $e^phi.alt = 1$ everywhere.
    Since $n gt.eq 3$ and $omega$ is real, $omega = 0$, and hence $C_1 = C_2$.
  The last equality is equivalent to $d_(A_1) \( F_1 F_2^(- 1) u \) = F_1 F_2^(- 1) d_(A_2) u$.
    Although the harmonic frames are not unitary, $J_(upright("loc")) = F_1 F_2^(- 1)$ is.
    To see this, parallel transport the intertwining identity along any path starting in the known side.
    Both connection transports are unitary, and $J_(upright("loc"))$ is the old unitary identification at the
    initial point. It remains unitary along the path; connectedness of $Omega$ proves the assertion everywhere.
  For an arbitrary source $f in C_c^oo \( U_0 \; bb(C)^2 \)$,
    both $w_(1 \, f)$ and $J_(upright("loc")) w_(2 \, f)$, in the common coordinate domain,
    are solutions of the first homogeneous connection equation. The charts avoid $overline(U_0)$.
    Their difference vanishes on the known side, so unique continuation makes it zero on $Omega$.
    Thus all evaluation identities hold, not only those for the finite family used in the local argument.
    On an overlap with the old match, the two proposed first-side images of a point,
    together with their invertible fiber maps, would impose an invertible linear relation between the two
    first-side evaluation maps. Joint surjectivity in Lemma 4 forces the image points to coincide.
    Surjectivity at the second-side point then forces the fiber maps to coincide as well.
    Thus the local identification agrees with the old match on every overlap. ◻
]

=== 7.2 The match fills both interiors <the-match-fills-both-interiors>

The source-evaluation argument below follows the embedding architecture of #cite(label("LLS20")) Section 6.1.
  The maximal matching, boundary completion, and recovery on the whole measured patch adapt
  #cite(label("ScalarCompanion2026")) Section 7; we give the details for the unitary bundle identification as well
  as the base map.

#thm([Proposition 7.2.])[
  (Global interior identification).  #emph[The maximal match of Lemma 5 is defined on $N_2^compose$,
    and its base map is an onto isometry $Phi : N_2^compose arrow.r N_1^compose$.]
] <glob:interior>

#proof[
  If its domain had an interior frontier, Proposition 6 and the dilation in Section 2.5 would supply the local
    data used in Sections 4–Section 6. Proposition 28 gives conformally equal metrics and equal normalized
    harmonic-frame equations on a neighborhood of the contact point in the original charts. Apply Lemma 29.
    Coordinate identity and $J_(upright("loc"))$ extend the old match to a neighborhood containing the frontier
    point. The concluding assertion of Lemma 29 ensures agreement on every overlap. This contradicts maximality.
    The domain, already nonempty and open, has no relative frontier in the connected interior,
    and is therefore all of $N_2^compose$.
  The image is open because $Phi$ is a local isometry. To see that it is relatively closed,
    suppose $Phi \( p_k \) arrow.r q in N_1^compose$. Compactness gives a subsequence with $p_k arrow.r
    p in N_2$ and $J \( p_k \) arrow.r J_0 in U \( 2 \)$. If $p in partial N_2$,
    continuity of the evaluations and (2.6) would give $I_1 \( q \) = J_0 I_2 \( p \) = 0$, contrary to Lemma 4.
    Thus $p$ is interior, and continuity gives $Phi \( p \) = q$.
    Connectedness of $N_1^compose$ makes the image all of that interior.
    Injectivity was proved in Lemma 5; the inverse is smooth because the map is a bijective local diffeomorphism. ◻
]

=== 7.3 Boundary extension and the original gauge <boundary-extension-and-the-original-gauge>

#thm([Proposition 7.3.])[
  (Completion and the measured patch).  #emph[The interior maps $\( Phi \, J \)$ extend smoothly to the extended
    manifolds, with $Phi : N_2 arrow.r N_1$ a diffeomorphism and $J$ a unitary bundle map intertwining the
    connections. They preserve the original copies of $M$ and satisfy
$ Phi \|_Gamma = "Id" \, wide J \|_Gamma = I . $

]
] <glob:boundary>

#proof[
  An onto interior isometry preserves lengths of curves in both directions and therefore preserves intrinsic
    distance. The metric completion of the interior of a compact smooth Riemannian manifold with boundary is the
    manifold with its length metric. In particular, a curve touching the boundary can be pushed slightly into an
    inward collar with arbitrarily small change of length; uniform local metric comparisons identify the resulting
    completion with the original compact topology. Thus $Phi$ and its inverse extend to mutually inverse
    homeomorphisms of $N_2 \, N_1$, mapping boundary to boundary.
  The extensions are smooth. In a sufficiently thin uniform collar,
    the distance $s_j$ to $partial N_j$ is smooth and its gradient generates inward unit normal flow.
    The isometry preserves distance to boundary, so $s_1 compose Phi = s_2$,
    and in the interior it intertwines these gradient fields.
    On a fixed small level $s_2 = s_0 > 0$, the map is already smooth.
    For $0 lt.eq s lt.eq s_0$, express it using that smooth level map and the smooth normal flows on the two
    sides. This gives a smooth extension to $s = 0$; the inverse has the same construction.
    Parallel transport for $A_1 \, A_2$ along these normal curves similarly extends $J$ smoothly,
    retaining unitarity and the connection intertwining identity.
  The maps are identity on the open cap, hence on its closure by continuity.
    With closure taken in $N_j$, the original interiors satisfy
  $ M_j^compose = N_j^compose \\ overline(E) . $
  Bijectivity and identity on $overline(E)$ preserve these complements, and hence their closures,
    the original copies of $M$. The restricted diffeomorphism fixes the attachment patch $P = { b > 0 }$, and $J =
    I$ there.
  We must recover the boundary identity on every part of $Gamma$, which may have more than one component.
    For $f in C_c^oo \( Gamma \; bb(C)^2 \)$, let $u_j$ now denote the harmonic solutions on the original
    manifolds with boundary value $f$. On the second manifold define $tilde(u)_1 = J^(- 1) \( u_1 compose Phi \)$.
    The metric and connection identities make $tilde(u)_1$ second-harmonic.
    On $P$, it has the same boundary value as $u_2$. It also has the same covariant normal derivative there.
    Indeed equality of the measured forms, tested against arbitrary functions supported in $P$,
    gives the equality of smooth densities
  $ \( nabla_(nu_1)^(A_1) u_1 \) thin d S_(g_1) = \( nabla_(nu_2)^(A_2) u_2 \) thin d S_(g_2) quad upright("on ") P . $
  The densities agree by Lemma 2, the isometry transports the outward normal,
    and the bundle map equals $I$ on $P$. Thus $tilde(u)_1 - u_2$ has zero Cauchy data there.
    Boundary and interior unique continuation give $tilde(u)_1 = u_2$ throughout $M$.
  Taking boundary traces yields
  #[#set math.equation(numbering: n => "(7.2)")
   $ J \( p \) f \( p \) = f \( Phi \( p \) \) quad #scale(x: 120%, y: 120%)[\(] p in partial M \, med
     f in C_c^oo \( Gamma \; bb(C)^2 \) #scale(x: 120%, y: 120%)[\)] . $ <glob:boundary-tests>]
  If $p in Gamma$ and $Phi \( p \) eq.not p$, choose $f$ nonzero at $p$,
    supported in a small neighborhood of $p$ avoiding $Phi \( p \)$.
    Equation (7.2) contradicts invertibility of $J \( p \)$. Hence $Phi \( p \) = p$ on $Gamma$.
    Arbitrary vector values of $f \( p \)$ then give $J \( p \) = I$ there. ◻
]

#proof[
  The boundary-identity gauges $V_j$ of Section 2 put the connections in normal gauge.
    Lemma 2 and Proposition 3 produce common exterior Green data.
    Lemmas 4 and 5 define the maximal match, and Proposition 6 supplies the local contact data wherever an
    interior frontier is present. Proposition 28, followed by Lemma 29, removes that frontier.
    Propositions 30 and 31 give a smooth global metric and connection identification fixing the entire measured patch.
  To distinguish the original connections in this final step, write $A_j^(upright("orig"))$ for them,
    so the connections used in the proof were
  $ A_j = V_j^(- 1) A_j^(upright("orig")) V_j + V_j^(- 1) d V_j . $
  In the original trivializations the bundle map from second to first fiber is
  $ U = \( V_1 compose Phi \) J V_2^(- 1) . $
  It is smooth and unitary, and equals $I$ on $Gamma$, since both original gauges equal $I$ on the entire
    boundary. The intertwining identity is $d_(Phi^(*) A_1^(upright("orig"))) \( U u \) =
    U d_(A_2^(upright("orig"))) u$. Expanding it gives
  $ A_2^(upright("orig")) = U^(- 1) \( Phi^(*) A_1^(upright("orig")) \) U + U^(- 1) d U \, wide g_2 = Phi^(*) g_1 . $
  These are the asserted identities. The argument uses densities and a single nonempty cap;
    it requires neither orientability nor connectedness of the boundary or of $Gamma$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
