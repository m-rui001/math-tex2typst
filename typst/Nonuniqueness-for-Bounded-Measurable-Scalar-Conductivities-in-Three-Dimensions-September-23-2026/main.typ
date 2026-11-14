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

#align(center)[#text(size: 16pt, weight: "bold")[Nonuniqueness for Bounded Measurable Scalar \
Conductivities in Three Dimensions]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $Omega subset bb(R)^n$ be a bounded connected Lipschitz domain and let $gamma in
  L^oo \( Omega \; bb(R) \)$ satisfy $0 < c lt.eq gamma lt.eq C < oo$ almost everywhere.
  For $f in H^(1 \/ 2) \( partial Omega \)$, let $u_f in H^1 \( Omega \)$ be the unique function of trace $f$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_Omega gamma nabla u_f dot.op nabla phi thin upright(d) x =
   0 wide \( phi in H_0^1 \( Omega \) \) . $ <eq:weak-model>]

Its full weak Dirichlet-to-Neumann operator is defined by

#[#set math.equation(numbering: n => "(1.2)")
 $ ⟨Lambda_gamma f \, g⟩ = integral_Omega gamma nabla u_f dot.op nabla v thin upright(d) x \, wide "Tr" v =
   g . $ <eq:dn-definition>]

Equation (1.1) makes this independent of the extension $v$.
  Our result concerns this entire operator on the usual trace space, at zero frequency.
  The inverse problem asks whether the boundary response to every applied voltage determines the conductivity
  inside the domain.

#thm([Theorem 1.1.])[
  #emph[There exist real scalar functions $gamma_0 \, gamma_1 in
    L^oo \( B \( 0 \, 3 \) \; bb(R) \)$ and constants $0 < c < C < oo$ such that]
  + #emph[$c lt.eq gamma_j lt.eq C$ almost everywhere, for $j = 0 \, 1$;]
  + #emph[both conductivities equal $1$ in a neighborhood of the boundary;]
  + #emph[$lr(|{ x : gamma_0 \( x \) eq.not gamma_1 \( x \) }|) > 0$;]
  + #emph[$Lambda_(gamma_0) = Lambda_(gamma_1)$ as bounded operators from
    $H^(1 \/ 2) \( partial B \( 0 \, 3 \) \)$ to $H^(- 1 \/ 2) \( partial B \( 0 \, 3 \) \)$.]
] <thm:main>

Thus the scalar Calderón uniqueness assertion with only bounded measurability and uniform positivity has a
  negative resolution, already in dimension three. In particular, the assertion quantified over every $n gt.eq
  3$ is false. The theorem imposes no derivative regularity and does not prescribe the contrast $C \/
  c$ or assert a construction in every higher dimension.

#thm([Corollary 1.2.])[
  (Localized nonuniqueness).  #emph[Let $c \, C$ be the constants in Theorem 1.
    For every bounded connected Lipschitz domain $Omega subset
    bb(R)^3$ and every finite family of pairwise disjoint balls $B_1 \, dots.h \, B_m subset.double Omega$,
    $m gt.eq 1$, there are $2^m$ pairwise distinct real scalar conductivities $gamma_epsilon in L^oo \( Omega \)$,
    indexed by $epsilon in { 0 \, 1 }^m$, such that
$ c lt.eq gamma_epsilon lt.eq C quad upright("almost everywhere") \, wide gamma_epsilon = 1 quad
  upright("on ") Omega \\ union.big_(i = 1)^m B_i \, $

 and all their full weak Dirichlet-to-Neumann operators from $H^(1 \/ 2) \( partial Omega \)$ to
   $H^(- 1 \/ 2) \( partial Omega \)$ agree. Distinct conductivities differ on a set of positive measure.]
] <cor:localized>

The proof, given after the main construction, copies the pair into smaller separated balls and minimizes energy
  over their interface traces. It does not require the common response to be that of the constant conductivity one.

===== 1.1 Regularity and related constructions. <regularity-and-related-constructions.>

Calderón posed the determination problem for bounded measurable real scalar conductivities bounded away from zero,
  and proved injectivity of its linearization at constant conductivities [3].
  For the nonlinear problem in dimensions at least three, Sylvester and Uhlmann established full-boundary
  uniqueness for smooth scalar conductivities [13]. Later results reach lower regularity.
  Haberman proves uniqueness for uniformly elliptic $W^(1 \, n)$ conductivities in dimensions three and four [6]
  Theorem 1.1; Caro and Rogers prove it for positive Lipschitz conductivities in every dimension at least three
  [4] Theorem 1.1. In the plane, Astala and Päivärinta prove uniqueness for bounded measurable uniformly positive
  scalar conductivities on bounded simply connected domains [2] Theorem 1.
  Theorem 1 concerns the three-dimensional measurable class,
  without the derivative hypotheses of the cited higher-dimensional results.

The companion scalar corollary proves uniqueness for strictly positive conductivities smooth up to the boundary of
  a bounded connected smooth domain in $bb(R)^n$, $n gt.eq 3$,
  with Dirichlet inputs supported in any nonempty relatively open boundary patch and conductivity flux observed on
  that same patch [10] Corollary 1.3.

For rough matrix-valued conductivities, nonunique continuation provides a route to inverse nonuniqueness.
  Daudé, Kamran, and Nicoleau [5] Theorem 1 and Proposition 1.2 combine Miller’s construction [9] with a conformal
  change to obtain anisotropic counterexamples with partial boundary data.
  Their full-boundary obstruction [5] Remark 1.3 also explains a difficulty for the present problem:
  a weakly harmonic factor with constant full boundary trace is itself constant by the energy identity.
  The factor used below has a nonzero interior source, subject to a more specific annihilation identity.

Scalar approximation of matrix conductivities raises a separate issue.
  Marino and Spagnolo [8] establish isotropic density in the sense of $G$-convergence.
  Rondi, using an example communicated by Giovanni Alessandrini,
  makes the distinction between such approximation and exact boundary-map realization explicit [12]
  Proposition 2.2, Theorem 4.3, and Example 4.4. On the unit disc,
  a constant matrix $"diag" \( a \, b \)$ with $a \, b > 0$ and $a eq.not
  b$ is an $H$-limit of scalar coefficients, with ellipticity bounds allowed to widen,
  but has no bounded uniformly positive scalar representative with the same full boundary map.
  The scalarization used here preserves exact responses to two prescribed inputs;
  a further argument is needed to reach every input.

===== 1.2 From a scalar block to the full operator. <from-a-scalar-block-to-the-full-operator.>

The construction in Section 5 takes $Omega = B \( 0 \, 3 \)$ and nests scaled copies of a scalar block with one
  parent and two child boundary tori. Each torus carries a specified probability measure.
  The block can realize every current triple $p = \( p_0 \, p_(-) \, p_(+) \)$ in the plane $p_0 + p_(-) + p_(+) =
  0$, with flux equal to $p_i$ times the corresponding measure.
  After its parent voltage is normalized to zero, the potential extends by constants into the adjacent regions as
  an admissible compactly supported test for any global $gamma$-harmonic function $u$. Reciprocity therefore gives

$ p_0 m_0 \( u \) + p_(-) m_(-) \( u \) + p_(+) m_(+) \( u \) = 0 wide \( p_0 + p_(-) + p_(+) = 0 \) \, $

where $m_i \( u \)$ is the trace average on the indicated surface.
  The three averages are equal because their vector is orthogonal to the zero-sum plane.
  Iterating through the nested blocks gives one common average $u_(*)$ on every cell surface,
  for every global harmonic $u$.

Signed currents propagated through the cells produce a nonzero $w in H_0^1 \( Omega \) ∩
  L^oo \( Omega \)$ supported away from the outer boundary.
  The common averages and shrinking cell diameters imply that its source satisfies

$ integral_Omega gamma nabla w dot.op nabla #scale(x: 120%, y: 120%)[\(] \( u - u_(*) \) phi.alt
  #scale(x: 120%, y: 120%)[\)] thin upright(d) x = 0 wide #scale(x: 120%, y: 120%)[\(] phi.alt in
  C_c^oo \( Omega \) #scale(x: 120%, y: 120%)[\)] $

for every bounded weakly $gamma$-harmonic $u$. The source is not zero; it vanishes on these particular products.
  This is the property used to change the conductivity.

Choose a sufficiently small nonzero $delta$ so that $rho = 1 + delta w$ is positive, and set

$ tilde(gamma) = rho^2 gamma \, wide tilde(u) = u_(*) + frac(u - u_(*), rho) . $

The corresponding flux is

$ tilde(gamma) nabla tilde(u) = rho gamma nabla u - \( u - u_(*) \) gamma nabla rho . $

The product identity, together with the original weak equation tested against $rho phi.alt$,
  makes this flux divergence free. In the outer collar $rho = 1$,
  so the transformed solution and flux agree with the original ones.
  Smooth boundary voltages have bounded harmonic extensions, so their boundary responses agree;
  boundedness and density then give equality of the full operators on $H^(1 \/ 2) \( partial Omega \)$.
  The nonzero potential makes the two positive conductivities distinct.
  Thus the source identity, applied to every bounded harmonic function,
  is the step from the block’s finite family of controlled inputs to the full inverse problem.

===== 1.3 Constructing the scalar block. <constructing-the-scalar-block.>

Section 3 proves an exact finite-field scalarization theorem.
  Under the stated local smoothness and rank conditions, it replaces a uniformly elliptic symmetric tensor by one
  bounded positive scalar coefficient while preserving the voltage trace and the entire normal-flux functional of
  each of two designated solutions. Here “finite-field” refers to the number of chosen inputs,
  not to a finite-dimensional observation of each response.

The product scalar leaves and successive coordinate joins have a classical antecedent in the isotropic
  approximation of Marino and Spagnolo [8] §3. The localized flux waves use the polynomial potential method of
  Raiă [11] Theorem 1 and §2; the proof gives the explicit formula for a surjective symbol and the coupled
  construction required here. Together with a synchronized coordinate change and a small symmetric tensor
  correction, these waves produce successive perturbations satisfying the exact equations and preserving both
  boundary responses. A Baire continuity-point argument then selects a strong limit satisfying one scalar
  constitutive relation for both fields. This uses the method developed by Kirchheim [7] and adapted to elliptic
  equations by Astala, Faraco, and Székelyhidi [1] Lemmas 3.7–3.8.
  These precedents supply methods; the simultaneous Cauchy-pair conclusion is proved in Section 3.

Section 4 supplies the tensor and the two designated fields.
  It builds a block with one parent and two child boundary tori,
  and makes both fields affine in the normal coordinate at all three ends.
  The construction corrects small residuals across rank-one walls,
  then transfers a decaying mode through successively doubled angular frequencies until it vanishes at finite
  distance. The two resulting current vectors span the zero-sum plane.
  After scalarization, those two responses and the constant solution cover every separately constant voltage
  vector on the three boundary components. This is precisely the block property used to force the common surface
  averages above.

== 2 Weak equations and changes of variables <sec:prelim>

We use real functions throughout; complex trace spaces, if desired, follow by complex linear extension.
  Let $U subset bb(R)^3$ be bounded and Lipschitz. A tensor is a measurable symmetric matrix $A$ with $a I lt.eq
  A lt.eq b I$ almost everywhere, where $0 < a < b < oo$. The weak equation is $"div" \( A nabla u \) = 0$,
  interpreted as in Equation (1.1). The trace theorem, the zero-trace Poincaré inequality,
  and coercivity give existence and uniqueness for each trace.
  A weak solution minimizes its energy among functions of that trace: if $h in H_0^1 \( U \)$, then

#[#set math.equation(numbering: n => "(2.1)")
 $ integral_U A nabla \( u + h \) dot.op nabla \( u + h \) = integral_U A nabla u dot.op nabla u +
   integral_U A nabla h dot.op nabla h . $ <eq:energy-minimum>]

Testing positive and negative truncations gives the usual maximum bound when the trace is bounded.
  These facts require no derivative of $A$.

For a divergence-free $F in L^2 \( U \; bb(R)^3 \)$, its normal flux is the continuous functional

#[#set math.equation(numbering: n => "(2.2)")
 $ ⟨F dot.op nu \, "Tr" v⟩ := integral_U F dot.op nabla v thin upright(d) x wide \( v in H^1 \( U \) \) .
   $ <eq:normal-functional>]

It is well defined because the integral vanishes for zero-trace functions.
  A Cauchy pair consists of $"Tr" u$ and this functional for $F = A nabla u$.
  This convention also fixes all signs when a function on a block is extended by constants across its boundary
  components.

We will use that matching traces glue $H^1$ functions across Lipschitz interfaces.
  Also $H^1 ∩ L^oo$ is an algebra, with the ordinary weak product rule;
  Lipschitz compositions on the range of a function obey the weak chain rule.
  In particular truncation commutes with the trace, so the trace of a bounded $H^1$ function inherits its bounds.
  All interfaces used for these operations are finite unions of Lipschitz pieces;
  infinite constructions are passed to the limit in $H^1$ explicitly.

For later reference, let $x = X \( y \)$ be a bi-Lipschitz change of variables that is smooth with nonsingular
  derivative on open pieces covering almost every point. Write $J = D X$ and set, at $x = X \( y \)$,

#[#set math.equation(numbering: n => "(2.3)")
 $ hat(u) \( x \) = u \( y \) \, wide hat(A) \( x \) = frac(J A \( y \) J^t, lr(|det J|)) \, wide hat(F) \( x \) =
   frac(J F \( y \), lr(|det J|)) . $ <eq:pushforward>]

Then $nabla hat(u) = J^(- t) nabla u$, and change of variables gives

#[#set math.equation(numbering: n => "(2.4)")
 $ integral_(X \( U \)) hat(F) dot.op nabla phi.alt thin upright(d) x =
   integral_U F dot.op nabla \( phi.alt compose X \) thin upright(d) y . $ <eq:pushforward-test>]

Thus divergence-free fluxes remain divergence free, and the tensor rule preserves the weak energy pairing.
  A right-hand side transforms as a density: $hat(r) \( X \( y \) \) = r \( y \) \/ lr(|det J \( y \)|)$.
  Symmetry and uniform ellipticity persist, with bounds depending on the bi-Lipschitz constants.
  If $X$ is the identity outside an interior box, both Cauchy data are unchanged.
  We will apply the same rules to potential coordinates and to the piecewise smooth physical collars.

== 3 Exact scalarization of two Cauchy pairs <sec:scalarization>

This section replaces a matrix conductivity by a scalar one while preserving two specified Cauchy pairs exactly.
  This is a finite-field statement: it preserves the full flux response to each of two prescribed voltage inputs,
  not the matrix conductivity’s full Dirichlet-to-Neumann operator.
  Classical isotropic approximation in $G$-convergence provides useful historical context [8],
  but no homogenization result is used below. The exact boundary data follow from localized perturbations and a
  strong limit selected by the Baire theorem. The continuity-point method follows the Baire-category framework for
  differential inclusions developed by Kirchheim [7] and used for elliptic equations by Astala, Faraco,
  and Székelyhidi [1] Lemmas 3.7–3.8. We give the complete localized construction and limiting argument for the
  simultaneous Cauchy-pair constraints needed here.

#thm([Theorem 3.1.])[
  (Exact finite-field scalarization).  #emph[Let $U subset bb(R)^3$ be a bounded Lipschitz domain.
    Let $A$ be a measurable symmetric matrix field satisfying
$ c_0 I lt.eq A lt.eq C_0 I wide upright("almost everywhere in ") U \, wide 0 < c_0 lt.eq C_0 < oo . $

 Suppose the real-valued potentials $u_1 \, u_2 in H^1 \( U \)$ satisfy $"div" \( A nabla u_j \) = 0$.
   Assume that there is an open cover of a full-measure subset of $U$ on whose members $A \, u_1 \,
   u_2$ are smooth and have the following local rank property.
   On each member, a fixed subset of the potentials has everywhere independent gradients,
   and every remaining potential is a constant affine combination of that subset.
   The subset may have zero, one, or two elements; a zero-element subset means that both potentials are constant there.]
  #emph[There exist constants $0 < a < b < oo$, a measurable scalar $a lt.eq gamma lt.eq b$, and $v_1 \,
    v_2 in H^1 \( U \)$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ "div" \( gamma nabla v_j \) & = 0 \, & v_j - u_j & in H_0^1 \( U \) \,\
integral_U gamma nabla v_j dot.op nabla psi thin thin upright(d) x & =
  integral_U A nabla u_j dot.op nabla psi thin thin upright(d) x &  & upright("for every ") psi in H^1 \( U \) .
  $ <sc:conclusion-equations>]

 The bounds $a \, b$ may be chosen using only $c_0 \, C_0$.]
] <thm:scalarization>

We use the Euclidean norm for vectors and the Frobenius norm for matrices.
  Write $upright("Sym")_3$ for the vector space of real symmetric $3 times 3$ matrices, with this norm.
  Gradient and flux matrices have their fields as columns. In particular,
  $E^t F$ is the matrix of their pointwise pairings. The proof will not require a positive lower bound on the
  independent gradients throughout $U$: such bounds are used only on individual compactly contained coordinate boxes.

=== 3.1 An open class of finite laminates <an-open-class-of-finite-laminates>

For positive triples $alpha \, beta in \( 0 \, oo \)^3$, a coordinate direction $i$, and $0 lt.eq theta lt.eq 1$,
  define their coordinate join $J_i \( theta \; alpha \, beta \)$ by

#[#set math.equation(numbering: n => "(3.2)")
 $ \[ J_i \]_i = (theta / alpha_i + frac(1 - theta, beta_i))^(- 1) \, wide \[ J_i \]_ell =
   theta alpha_ell + \( 1 - theta \) beta_ell quad \( ell eq.not i \) . $ <sc:join>]

Fix $0 < a < b$. Let $cal(G)^(upright("diag"))$ consist of the triples obtainable by a finite tree of these joins,
  starting from scalar triples $\( s \, s \, s \)$ with $a < s < b$.
  A tree is evaluated in one fixed coordinate frame. Let $cal(G)$ be its spectral extension:

$ cal(G) = { Q "diag" \( alpha \) Q^t : Q upright(" orthogonal") \, med alpha in cal(G)^(upright("diag")) } . $

In particular, every matrix in $cal(G)$ lies strictly between $a I$ and $b I$.

#thm([Lemma 3.2.])[
  (Openness and coverage).  #emph[The set $cal(G)^(upright("diag"))$ is open in $bb(R)^3$,
    and $cal(G)$ is open in $upright("Sym")_3$. Every joining path in a representing tree lies in $cal(G)$.
    Given $c_0 \, C_0$, the numbers $a \, b$ can be chosen so that every symmetric matrix with spectrum in
    $\[ c_0 \, C_0 \]$ belongs to $cal(G)$.]
] <sc:open-class>

#proof[
  The product construction below is related to the diagonal approximation in Marino and Spagnolo [8] Section 3;
    we use its elementary coordinate-join arithmetic directly.
    First we show that each scalar triple strictly between the endpoints is interior.
    Given a nearby positive triple $\( alpha_1 \, alpha_2 \, alpha_3 \)$, choose $M > max_i alpha_i$ and set
  $ d_i = sqrt(1 - alpha_i \/ M) . $
  Let $t_i$ independently take the two values $1 - d_i \, 1 + d_i$ with equal weights.
    Its arithmetic mean is one and its harmonic mean is $1 - d_i^2 = alpha_i \/ M$. Start with the eight scalar leaves
  #[#set math.equation(numbering: n => "(3.3)")
   $ M t_1 t_2 t_3 I . $ <sc:product-leaves>]
  Joining the $t_1$ pairs in direction 1 gives the diagonal triple
  $ \( alpha_1 t_2 t_3 \, M t_2 t_3 \, M t_2 t_3 \) . $
  Joining the $t_2$ pairs in direction 2 gives $\( alpha_1 t_3 \, alpha_2 t_3 \, M t_3 \)$,
    and the direction-3 joins give $\( alpha_1 \, alpha_2 \, alpha_3 \)$.
    If the target tends to $\( s \, s \, s \)$, choose $M$ tending to $s$ from above.
    Every leaf then tends to $s$, so all leaves lie in $\( a \, b \)$ for sufficiently close targets.
  Interior propagates through any nontrivial join. With the other child and a weight $0 < theta < 1$ fixed,
    the derivative of the join in its first child is diagonal,
    with entries $theta$ in the tangential positions and $theta \[ J_i \]_i^2 \/ alpha_i^2 >
    0$ in the normal position. It is invertible. The inverse function theorem,
    applied successively up a finite tree, proves openness in diagonal variables.
    Zero-weight joins can be removed. The diagonal class is permutation invariant;
    continuity of ordered eigenvalues now proves that its spectral extension is open,
    including at repeated eigenvalues. Varying the weight of an existing join simply supplies another finite tree
    with the same children, so its entire path, including its endpoints, stays in $cal(G)$.
  For uniform coverage, take $M = 2 C_0$ in Equation (3.3). For targets in $\[ c_0 \, C_0 \]^3$, all factors lie between
  $ ell = 1 - sqrt(1 - c_0 \/ \( 2 C_0 \)) > 0 quad upright("and") quad 2 . $
  All leaves therefore lie in $\[ M ell^3 \, 8 M \]$. For example, $a = M ell^3 \/ 2$ and $b =
    16 M$ put them strictly inside the leaf interval, uniformly for the entire required spectral range. ◻
]

Fix these $a \, b$ for the rest of the proof. The distance of a joining path from $upright("Sym")_3 \\ cal(G)$ can
  depend on the path, but every fixed path is compact in the open set $cal(G)$ and hence has positive such
  distance. All corrections below are symmetric and will respect that distance.
  Thus every corrected matrix remains in the same $cal(G)$, and the global bounds $a \, b$ never deteriorate.

We now fix the equations and boundary data that every intermediate field must preserve.
  Write $A^(upright("in")) \, u_1^(upright("in")) \, u_2^(upright("in"))$ for the data of Theorem 3,
  and put $F_j^(upright("in")) = A^(upright("in")) nabla u_j^(upright("in"))$.

#prodef([Definition 3.3.])[
  (Subsolution).  A subsolution consists of a measurable symmetric matrix $A$, two potentials $u_1 \,
    u_2 in H^1 \( U \)$, and the column matrices
  $ E = \( nabla u_1 \, nabla u_2 \) \, wide F = A E \, $
  such that $A in cal(G)$ almost everywhere and, for $j = 1 \, 2$,
  $ u_j - u_j^(upright("in")) & in H_0^1 \( U \) \, & "div" F_j & = 0 \,\
integral_U F_j dot.op nabla psi thin thin upright(d) x & =
  integral_U F_j^(upright("in")) dot.op nabla psi thin thin upright(d) x &  & upright("for every ") psi in
  H^1 \( U \) . $
  It must also have an open cover of a full-measure subset of $U$ on which $A \, u_1 \,
    u_2$ are smooth and have the local rank property in Theorem 3:
    on each member one fixed subset of the potentials has independent gradients,
    and every remaining potential is a constant affine combination of those potentials.
] <sc:subsolution>

The original fields are a subsolution by Lemma 4. The construction will change the matrix and interior fields
  while keeping the equations and the two entire boundary responses in this definition.

=== 3.2 A split in preliminary coordinates <a-split-in-preliminary-coordinates>

We first compute the states to be realized by a local perturbation.
  A divergence-free flux wave with the potentials held fixed can mix the tangential entries of a coordinate join.
  The normal entry requires its harmonic mean instead. We obtain both at once by coupling the flux wave to a
  normal change of variables; the following states describe that coupling before localization.
  Freeze a parent matrix $A_0$ and its two diagonal children $A^(+)$, $A^(-)$ in a common orthonormal frame.
  Let the layering direction be the unit vector $d$, and let the physical fractions be $theta_(+) \,
  theta_(-) > 0$, with sum one. A trivial join needs no perturbation.
  Subscripts $d$ and $T$ denote the normal scalar entry and tangential diagonal block. Set

#[#set math.equation(numbering: n => "(3.4)")
 $ q_s = frac(A_d^s, \( A_0 \)_d) \, wide B_d^s = \( A_0 \)_d \, wide B_T^s = q_s A_T^s \, wide eta_s = theta_s /
   q_s \, quad s in { + \, - } . $ <sc:preliminary-states>]

The normal harmonic-mean formula and the tangential arithmetic-mean formula give

#[#set math.equation(numbering: n => "(3.5)")
 $ eta_(+) + eta_(-) = 1 \, wide eta_(+) q_(+) + eta_(-) q_(-) = 1 \, wide eta_(+) B^(+) + eta_(-) B^(-) =
   A_0 . $ <sc:means>]

The fractions $eta_s$, not $theta_s$, are used before the coordinate change.

Put $Delta B = B^(+) - B^(-)$ and $Delta q = q_(+) - q_(-)$.
  A scalar parameter $z in \[ - eta_(+) \, eta_(-) \]$ describes the segment

#[#set math.equation(numbering: n => "(3.6)")
 $ B \( z \) = A_0 + z Delta B \, wide q \( z \) = 1 + z Delta q . $ <sc:synchronized-segment>]

Its endpoints are the two states in Equation (3.4); its barycenter is $z = 0$.
  The normal stretch $L \( z \) = I + \( q \( z \) - 1 \) d ⊗ d$ pushes $B \( z \)$ forward to

#[#set math.equation(numbering: n => "(3.7)")
 $ C \( z \) = frac(L \( z \) B \( z \) L \( z \)^t, det L \( z \)) =
   "diag" #scale(x: 120%, y: 120%)[\(] q \( z \) \( A_0 \)_d \, med
   B_T \( z \) \/ q \( z \) #scale(x: 120%, y: 120%)[\)] $ <sc:predicted-matrix>]

in the chosen frame. This entire path is the original coordinate joining path, with changed weights.
  Indeed if $B = sum_s tau_s B^s$ and $q = sum_s tau_s q_s$ for $tau_(+) + tau_(-) = 1$,
  the physical weights are $w_s = tau_s q_s \/ q$. Their normal harmonic mean is

$ (sum_s w_s / A_d^s)^(- 1) = q \( A_0 \)_d \, $

and their tangential arithmetic mean is $B_T \/ q$. In particular,
  smoothing and cutting off the scalar parameter while keeping it in its segment will not leave the admissible path.

=== 3.3 Exact localized flux waves <exact-localized-flux-waves>

Let $m in { 1 \, 2 }$ potentials have independent gradients on a smooth patch.
  Temporarily discard the affinely dependent columns. For a symmetric matrix to map their gradient matrix $E$ to a
  flux matrix $F$, the pairing $E^t F$ must be symmetric. The flux wave must preserve this condition as well as
  column divergence. After shrinking the patch, choose smooth coordinates

$ z = Phi \( y \) \, wide z_1 = u_1 \( y \) \, dots.h \, z_m = u_m \( y \) \, $

where the independent potentials have been relabeled if needed.
  If $J = D Phi$, a flux column becomes the divergence density $J F \/ lr(|det J|)$.
  In these coordinates, symmetry of $E^t F$ is exactly symmetry of the leading $m times
  m$ block of this transformed flux matrix. Thus the two constraints to preserve are constant coefficient:
  column divergences vanish and that block is symmetric.

Let $V_m$ be the vector space of $3 times m$ matrices with symmetric leading block,
  equipped with the Frobenius inner product. Define

$ D \( xi \) : V_m arrow.r bb(R)^m \, wide D \( xi \) G = xi^t G . $

We identify the row vector on the right with a vector in $bb(R)^m$.

The following is the surjective-symbol case of the polynomial potential construction of Raiă [11] Theorem 1 and
  Section 2. We give the explicit formula used for these coupled constraints.

#thm([Lemma 3.4.])[
  (A polynomial potential).  #emph[For every $xi eq.not 0$, $D \( xi \)$ is onto.
    There is a homogeneous polynomial map $P \( xi \) : V_m arrow.r V_m$ of degree $2 m$ such that
$ D \( xi \) P \( xi \) = 0 \, wide "im" P \( xi \) = ker D \( xi \) quad \( xi eq.not 0 \) . $

 Consequently every mean-zero smooth periodic plane wave with polarization in $ker
   D \( xi \)$ admits a compactly supported localization satisfying both constraints exactly,
   with arbitrarily small absolute uniform norm of the difference from its cut-off leading wave.]
] <sc:polynomial-potential>

#proof[
  For $m = 1$, surjectivity is ordinary nonzero contraction. For $m = 2$ write
  $ G = mat(delim: "(", a, b; b, c; d, e) \, wide D \( xi \)
    G = \( xi_1 a + xi_2 b + xi_3 d \, xi_1 b + xi_2 c + xi_3 e \) . $
  If $lambda in bb(R)^2$ annihilates its range, then
  $ xi_1 lambda_1 = xi_2 lambda_2 = xi_1 lambda_2 + xi_2 lambda_1 = xi_3 lambda_1 = xi_3 lambda_2 = 0 . $
  When $xi_3 eq.not 0$ the assertion follows immediately; otherwise either $xi_1$ or $xi_2$ is nonzero and the
    first three equalities give the same conclusion. Thus $D \( xi \)
    D \( xi \)^t$ is positive definite at every nonzero $xi$, where the transpose uses the specified inner products.
  Set $Q \( xi \) = D \( xi \) D \( xi \)^t$ and define
  #[#set math.equation(numbering: n => "(3.8)")
   $ P \( xi \) = det Q \( xi \) I - D \( xi \)^t "adj" \( Q \( xi \) \) D \( xi \) . $ <sc:polynomial-symbol>]
  The identity $Q "adj" Q = \( det Q \) I$ gives $D P = 0$ as a polynomial identity.
    On $ker D \( xi \)$, $P \( xi \)$ is multiplication by the nonzero scalar $det Q \( xi \)$,
    proving the image assertion. Both terms have degree $2 m$.
  For completeness, let $R in ker D \( xi \)$ and choose $R_0 in V_m$ with $P \( xi \) R_0 = R$.
    Let $h$ be a smooth one-periodic function of mean zero and let $H$ be a one-periodic $2 m$-fold primitive,
    so $H^(\( 2 m \)) = h$. Such primitives are obtained by successive integration and subtraction of the mean.
    Given a smooth compactly supported cutoff $chi$, apply the constant coefficient differential operator
    $P \( partial \)$ to
  #[#set math.equation(numbering: n => "(3.9)")
   $ k^(- 2 m) chi \( z \) H \( k xi dot.op z \) R_0 . $ <sc:localized-potential>]
  Its output lies in $V_m$ and has zero column divergence exactly, by the polynomial identity.
    Terms with every derivative on $H$ give $chi \( z \) h \( k xi dot.op z \) R$.
    Each remaining term has at least one derivative on $chi$ and is $O \( k^(- 1) \)$ uniformly for fixed $chi \,
    h$. This proves the localization claim. ◻
]

The flux wave will satisfy the differential constraints exactly but will have a small constitutive error.
  The following algebraic fact removes that error without losing symmetry.

#thm([Lemma 3.5.])[
  (Symmetric algebraic correction).  #emph[Let $E$ have independent columns and let $R$ satisfy that $E^t
    R$ is symmetric. With $E^dagger = \( E^t E \)^(- 1) E^t$, the matrix
#[#set math.equation(numbering: n => "(3.10)")
 $ H = R E^dagger + \( E^dagger \)^t R^t - \( E^dagger \)^t \( E^t R \) E^dagger $ <sc:correction-formula>]

 is symmetric and satisfies $H E = R$. Its norm is bounded by a locally uniform constant times $∥R∥$ when $E$
   ranges over a bounded set with its smallest singular value bounded below.]
] <sc:symmetric-correction>

#proof[
  Symmetry is immediate. Multiply by $E$, use $E^dagger E = I$, and cancel the last two terms using $R^t E =
    E^t R$. The norm bound follows from the same formula. ◻
]

=== 3.4 Realizing one coordinate join <realizing-one-coordinate-join>

We can now state the local operation used to exhaust a finite laminate tree.
  Its two conclusions serve different purposes: proximity to the children lowers the remaining tree depth,
  while weak proximity lets us make that change inside any prescribed weak neighborhood.

#thm([Lemma 3.6.])[
  (Local realization of a coordinate join).  #emph[Let $\( A \, E \, F \)$, with potentials $u_1 \, u_2$,
    be a subsolution. Let $y_0$ lie in one of its smooth patches from Definition 5,
    on which one fixed set of $m in { 1 \, 2 }$ potentials has independent gradients.
    Suppose $A_0 = A \( y_0 \)$ is a coordinate join of two children $A^(+) \, A^(-)$ in one orthonormal frame,
    with positive weights $theta_(+) \, theta_(-)$ summing to one and with its joining path contained in $cal(G)$.
    Given open neighborhoods $cal(O)_(+) \, cal(O)_(-)$ of the children in $upright("Sym")_3$ and $delta > 0$,
    there is an open neighborhood $V$ of $y_0$, compactly contained in the patch, with the following property.]
  #emph[For every open rectangular box $Q$ with $overline(Q) subset V$,
    one can choose a cutoff and periodic waveform, then construct subsolutions $\( A'_k \, E'_k \, F'_k \)$,
    with potentials $u'_(1 \, k) \, u'_(2 \, k)$, for all sufficiently large integers $k$ such that $A'_k =
    A$ outside $Q$. The differences $u'_(j \, k) - u_j$ and $F'_(j \, k) -
    F_j$ vanish outside compact subsets of $Q$, and
$ integral_U \( F'_(j \, k) - F_j \) dot.op nabla psi thin thin upright(d) x = 0 wide
  #scale(x: 120%, y: 120%)[\(] psi in H^1 \( U \) \, med j = 1 \, 2 #scale(x: 120%, y: 120%)[\)] . $

 There are disjoint open subsets $Q_(k \, +) \, Q_(k \, -) subset Q$ such that
$ A'_k in cal(O)_s med upright("on ") Q_(k \, s) quad \( s in { + \, - } \) \, wide
  lr(|Q \\ \( Q_(k \, +) union Q_(k \, -) \)|) < delta lr(||) Q . $

 On the same fixed box, with the cutoff and waveform fixed,
$ \( E'_k \, F'_k \) harpoon.rt \( E \, F \) quad upright("in ") L^2 \( U \) times L^2 \( U \) quad
  upright("as ") k arrow.r oo . $

 The neighborhood and frequency threshold may depend on all preceding local data, including $cal(O)_(+) \,
   cal(O)_(-)$ and $delta$; the threshold may also depend on the chosen box, cutoff, and waveform.]
] <sc:local-join>

#proof[
  Choose an initial compactly contained neighborhood of $y_0$ on which the potential chart $Phi$ is defined and
    the selected gradients have a positive lower singular-value bound.
    We will choose a smaller neighborhood $V$ from the frozen-error estimates below;
    the box $Q$ will then have closure in $V$. Until the constitutive correction is complete,
    the local matrices $E \, F \, E_0 \, R$ and their primed versions contain only these $m$ independent columns.
    We restore the full pair by the fixed affine relations at the end of the local calculation.
    Freeze $A_0 = A \( y_0 \)$, $E_0 = E \( y_0 \)$, and $J_0 = D Phi \( y_0 \)$.
    For a split as above, the physical polarization $Delta B E_0$ has zero normal component since the normal row
    of $Delta B$ vanishes. Its gradient pairing is symmetric. Hence
  #[#set math.equation(numbering: n => "(3.11)")
   $ xi = J_0^(- t) d \, wide R = frac(J_0 Delta B E_0, lr(|det J_0|)) quad upright("satisfy") quad R in V_m \,
     quad D \( xi \) R = 0 . $ <sc:transformed-polarization>]
  For the last assertion, contract the displayed matrix with $xi$.
    For the first, the leading rows of $J_0$ are the gradients of the selected potentials,
    so their entries are precisely the symmetric pairings with $Delta B$.
  The construction below applies on any box $Q$ with $overline(Q) subset V$.
    After $V$ has been chosen from the estimates below, fix such a box and a smooth cutoff $0 lt.eq chi lt.eq 1$,
    supported in $Q$ and equal to one except on a thin margin.
    Choose a smooth periodic function $h$ by convolving the two-state step function that equals $eta_(-)$ on a
    fraction $eta_(+)$ of the period and $- eta_(+)$ on the remaining fraction $eta_(-)$. Then
  #[#set math.equation(numbering: n => "(3.12)")
   $ integral_0^1 h = 0 \, wide - eta_(+) lt.eq h lt.eq eta_(-) \, $ <sc:wave-properties>]
  and $h$ equals the two pure values outside an arbitrarily small part of its period.
    The margin and transition lengths will be chosen to meet the prescribed volume error $delta lr(||) Q$.
    Let $H_1$ be a periodic primitive of $h$. In Equation (3.9), use the cutoff $chi compose Phi^(- 1)$.
    Transform the resulting flux perturbation back to the original coordinates and denote the perturbed flux by
    $hat(F)_k$. It satisfies
  #[#set math.equation(numbering: n => "(3.13)")
   $ "div" hat(F)_k = 0 \, wide E^t hat(F)_k = hat(F)_k^t E $ <sc:exact-preliminary-constraints>]
  exactly, and equals the original flux outside a compact subset of $Q$. The selected potentials have not yet changed.
  Write $phi \( y \) = xi dot.op Phi \( y \)$; thus $nabla phi \( y_0 \) = d$.
    At the same time define on $Q$, extending by the identity outside $Q$,
  #[#set math.equation(numbering: n => "(3.14)")
   $ X_k \( y \) = y + frac(Delta q, k) thin d thin chi \( y \) H_1 \( k phi \( y \) \) . $ <sc:local-diffeomorphism>]
  If $z_k \( y \) = chi \( y \) h \( k phi \( y \) \)$, differentiation gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ D X_k = I + Delta q thin z_k thin d ⊗ nabla phi + O \( k^(- 1) \) . $ <sc:jacobian-approximation>]
  Throughout $Q$, this is uniformly close to $L \( z_k \)$ when $V$ is sufficiently small and then $k$ is large.
    The scalar $z_k$ stays in the segment in Equation (3.6), because zero lies in that segment and $0 lt.eq
    chi lt.eq 1$. All $q \( z_k \)$ are bounded away from zero. More explicitly, the rank-one determinant formula gives
  $ det D X_k = q \( z_k \) + Delta q thin z_k \( partial_d phi - 1 \) +
    frac(Delta q, k) H_1 \( k phi \) partial_d chi . $
  First shrink $V$ so that $partial_d phi$ is uniformly close to one; after the box and profiles are fixed,
    take $k$ large. The displayed determinant, which is the derivative of $X_k$ along each line parallel to $d$ in
    that direction, is then strictly positive. The displacement is parallel to $d$ and compactly supported.
    Each such line is consequently mapped monotonically onto itself.
    This proves that $X_k$ is a global smooth diffeomorphism, equal to the identity outside $Q$,
    and mapping $Q$ onto itself. Its derivative and inverse derivative have bounds independent of sufficiently
    large $k$.
  Push the potentials and preliminary fluxes forward by this map:
  #[#set math.equation(numbering: n => "(3.16)")
   $ u'_(j \, k) = u_j compose X_k^(- 1) \, wide E'_k compose X_k = D X_k^(- t) E \, wide F'_k compose X_k =
     frac(D X_k hat(F)_k, det D X_k) . $ <sc:pushed-fields>]
  The determinant is positive here. These fields satisfy exact column divergence and pairing symmetry, since
  $ \( E'_k ""^t F'_k \) compose X_k = frac(E^t hat(F)_k, det D X_k) . $
  The selected gradients remain independent. The discarded potentials are recomposed by the same map,
    so their original constant affine relations with the selected potentials remain valid.
    Restore their preliminary fluxes by the corresponding constant linear combinations of the selected fluxes,
    and push them by the same formula. We continue the constitutive estimates on the selected columns.
  The errors in the frozen description are only errors in the constitutive approximation, not in these equations.
    More precisely, let $omega \( V \)$ bound the oscillations from their values at $y_0$ of the fixed smooth
    fields and chart derivatives on $V$, with $omega \( V \) arrow.r 0$ as $V$ shrinks to $y_0$.
    The frozen flux error can be seen directly. Put $Gamma \( y \) = lr(|det J \( y \)|) J \( y \)^(- 1)$,
    so that $Gamma \( y_0 \) R = Delta B E_0$. The localized leading wave gives
  $ hat(F)_k - B \( z_k \) E = \( A - A_0 \) E + z_k #scale(x: 120%, y: 120%)[\[] \( Gamma - Gamma \( y_0 \) \)
    R + Delta B \( E_0 - E \) #scale(x: 120%, y: 120%)[\]] + O \( k^(- 1) \) . $
  Consequently, for the fixed plan,
  #[#set math.equation(numbering: n => "(3.17)")
   $ hat(F)_k - B \( z_k \) E & = O \( omega \( V \) \) + O \( k^(- 1) \) \,\
D X_k - L \( z_k \) & = O \( omega \( V \) \) + O \( k^(- 1) \) . $ <sc:frozen-flux-error>]
  All estimates here are absolute uniform bounds on the box.
    The constants multiplying $omega \( V \)$ depend only on the fixed plan and bounds on the initial
    neighborhood; $z_k$ remains in its fixed segment. The constants in $O \( k^(- 1) \)$ may also depend on the
    chosen box, cutoff, and waveform. This is why those choices can be fixed before the frequency is increased.
  Define the constitutive defect
  $ cal(R)_k = F'_k - C \( z_k compose X_k^(- 1) \) E'_k . $
  Writing $K = D X_k$ and evaluating $B \, L$ at $z_k \( y \)$, the pushforward formulas give the exact identity
  $ cal(R)_k compose X_k = frac(K, det K) \( hat(F)_k - B E \) +
    (frac(K B K^t, det K) - frac(L B L^t, det L)) K^(- t) E . $
  The map bounds and Equations (3.17)– (3.17) therefore give
  #[#set math.equation(numbering: n => "(3.18)")
   $ cal(R)_k = O \( omega \( V \) \) + O \( k^(- 1) \) . $ <sc:constitutive-error>]
  Apply Lemma 7 to $cal(R)_k$, using the independent columns. Its symmetry condition is exact:
    both $E'_k ""^t F'_k$ and $E'_k ""^t C \( z_k compose X_k^(- 1) \) E'_k$ are symmetric.
    The selected gradients retain a positive lower singular-value bound, because $E'_k compose X_k =
    D X_k^(- t) E$ and the map derivatives are bounded. Thus the correction $H_k$ has a uniform bound by a local
    constant times $lr(|cal(R)_k|)$, and
  $ A'_k = C \( z_k compose X_k^(- 1) \) + H_k $
  maps the selected new gradients to their new fluxes. Restore every discarded flux by the same constant linear
    combination as its gradient. The common recomposition then gives the full two-column relation $F'_k =
    A'_k E'_k$ and preserves the original fields outside the box.
    From this point onward, $E \, F \, E'_k \, F'_k$ and $hat(F)_k$ again denote the full two-column matrices;
    the bound for $H_k$ is the one just obtained from the selected columns.
  Choose $tau > 0$ so that the symmetric $tau$-neighborhood of the compact path $C$ lies in $cal(G)$ and the
    $tau$-balls about $A^s$ lie in $cal(O)_s$ for $s in { + \, - }$. This uses distance inside $upright("Sym")_3$.
    The coefficient of $omega \( V \)$ in the correction bound is fixed on the initial neighborhood,
    independently of the later box and profiles. Choose $V$ small enough that this contribution is less than
    $tau \/ 2$ and that the preceding map determinant is positive after a sufficiently small frequency error.
    For each box with closure in this $V$, fix its cutoff and waveform and take $k$ large enough that the
    remaining contribution is less than $tau \/ 2$. Then $A'_k in cal(G)$ throughout the box.
    The correction needs no bounds on derivatives of the defect.
    It is smooth inside the box; outside $Q$ keep the original matrix.
    A jump of the matrix at the box boundary is harmless: the potentials and fluxes agree with the old ones near
    that boundary, and the matrix is only required to be smooth on an open cover up to null sets.
  Where $chi = 1$ and $h$ is at the pure value for child $s$, the matrix $C$ is exactly $A^s$,
    so the correction bound puts $A'_k$ in $cal(O)_s$. Take $Q_(k \, s)$ to be the images under $X_k$ of the open
    pure regions, omitting the endpoints of the waveform plateaus. The omitted plateau endpoints form a null set.
    The cutoff margin can have arbitrarily small volume, and the transition intervals can have arbitrarily small
    total length. The phase is nondegenerate on the box; changing to the chart and integrating in its linear phase
    direction shows that the preimages of the transition intervals have the corresponding small limiting volume.
    For the image measure, the determinant formula above gives
  $ 0 < det D X_k lt.eq sup_(z in \[ - eta_(+) \, eta_(-) \]) q \( z \) +
    lr(|Delta q|) sup_(z in \[ - eta_(+) \, eta_(-) \]) lr(||) z sup_V lr(|partial_d phi - 1|) + 1 = : J_(*) \, $
  after the profiles are fixed and $k$ is large enough to make the $k^(- 1)$ term in the determinant formula at
    most one in absolute value. Thus $J_(*)$ is fixed by the preceding local data and $V$,
    independently of the cutoff margin and transition lengths, and bounds the volume increase under $X_k$.
    Choose the margin and transition lengths so that, for all sufficiently large $k$,
    the complement of $Q_(k \, +) union Q_(k \, -)$ has volume less than $delta lr(||) Q$.
    The new smooth box pieces and the old pieces away from its faces retain the full-measure local rank cover.
  ===== 3.4.1 Boundary data and weak proximity. <boundary-data-and-weak-proximity.>
  Every perturbation just constructed preserves the outer boundary traces and fluxes exactly.
    Before the pushforward the flux change is divergence-free and compactly supported in the interior.
    After the pushforward the same is true of its difference from the old flux,
    since $X_k$ is the identity outside $Q$. Thus for every $psi in
    H^1 \( U \)$ the flux difference has zero pairing with $nabla psi$.
    To see this without any boundary smoothness of the fields,
    insert a smooth cutoff equal to one on the support of the flux difference,
    and use density of smooth tests in $H_0^1 \( U \)$ together with its distributional zero divergence.
    The potentials also agree outside a compact subset of $Q$, so their trace difference vanishes.
    There is no new global boundary compatibility condition: the perturbation starts from an existing solution
    pair and satisfies the exact local equations with compact support.
    Together with the constitutive relation and the local rank cover,
    these facts prove that the corrected fields are subsolutions.
  It is equally important that these perturbations can be made arbitrarily weakly close to the old fields,
    even though the local child states stay separated. Keep the chosen $V$, box, waveform, and cutoff fixed.
    The preliminary flux perturbation is a smooth matrix amplitude times $h \( k phi \( y \) \)$,
    plus a uniformly $O \( k^(- 1) \)$ error. Changing to the chart and using the zero mean of $h$ shows
  #[#set math.equation(numbering: n => "(3.19)")
   $ hat(F)_k harpoon.rt F quad upright("in ") L^2 . $ <sc:preliminary-weak-limit>]
  For example, for a smooth compactly supported test amplitude one can integrate a bounded periodic primitive in
    the phase direction, obtaining $O \( k^(- 1) \)$; density and the uniform $L^2$ bound give the stated weak
    convergence.
  The product of the oscillating Jacobian and flux in Equation (3.16) cannot be treated by multiplying weak
    limits. Instead write $v_k = X_k - I$. For a smooth vector test function $psi$, change variables to obtain
  $ integral_U F'_k \( x \) dot.op psi \( x \) thin thin upright(d) x =
    integral_U D X_k \( y \) hat(F)_k \( y \) dot.op psi \( X_k \( y \) \) thin thin upright(d) y $
  for each flux column. Replacing $psi compose X_k$ by $psi$ costs $o \( 1 \)$ because $v_k arrow.r
    0$ uniformly and the other factors are uniformly bounded in $L^2$.
    The remaining additional term vanishes by the exact divergence equation:
  #[#set math.equation(numbering: n => "(3.20)")
   $ integral_U partial_j \( v_k \)_i \( hat(F)_k \)_j psi_i thin thin upright(d) y = -
     integral_U \( v_k \)_i \( hat(F)_k \)_j partial_j psi_i thin thin upright(d) y arrow.r
     0 . $ <sc:piola-weak-cancellation>]
  Summation over repeated spatial indices is understood only in this display.
    Equations (3.19) and (3.20) prove $F'_k harpoon.rt F$. The potentials converge uniformly on the modified
    compact region, since $X_k^(- 1) arrow.r I$ uniformly and the old potentials are smooth there.
    Their gradients are uniformly bounded in $L^2$, either directly on the box or by the energy estimate below.
    Consequently $E'_k harpoon.rt E$ as well. The same weak limits hold for the restored columns,
    since their local changes are the same fixed linear combinations of the selected-column changes.
  The choices now have the order asserted in the lemma. First the neighborhood $V$ controls the fixed coefficient
    error $O \( omega \( V \) \)$ for every box whose closure lies in $V$.
    After fixing one such box, choose its cutoff and waveform to meet the volume budget.
    All sufficiently large frequencies then give the pure-state membership,
    and that same family converges weakly to the old pair as the frequency tends to infinity.
    The freezing error is not an error in the differential constraints and does not obstruct this limit. ◻
]

=== 3.5 Finite-depth exhaustion <finite-depth-exhaustion>

We use Lemma 8 to replace a finite laminate tree by its children one depth at a time.
  Every step remains a subsolution in the explicit sense of Definition 5.

#thm([Proposition 3.7.])[
  (Weak approximation by scalar-near matrices).  #emph[Given a subsolution,
    a weak $L^2$ neighborhood of its pair $\( E \, F \)$, and $epsilon > 0$,
    there is a subsolution in that neighborhood whose matrix has distance less than $epsilon$ from the scalar
    matrices outside a set of volume less than $epsilon$.]
] <sc:weak-approximation>

#proof[
  For clarity we make the finite-depth argument explicit. In diagonal variables let $T_0$ be the triples in
    $cal(G)^(upright("diag"))$ whose distance from scalar triples is strictly less than $epsilon$.
    Inductively, $T_k$ contains $T_(k - 1)$ and the outputs of joins of two $T_(k - 1)$ children whose entire
    joining path lies in $cal(G)^(upright("diag"))$. Equivalently these are targets with a representing tree of
    depth at most $k$, ending in $T_0$, with the indicated path condition.
    Take their spectral extensions when discussing matrices.
  Each $T_k$ is open and permutation invariant. This is immediate for $T_0$.
    For a nontrivial join with children in $T_(k - 1)$, its invertible derivative in one child,
    computed in Lemma 4, absorbs any sufficiently small change of output into a change of that child.
    The child remains in the open set $T_(k - 1)$, and the whole path remains in the open class by compactness.
    This proves the induction; permutation invariance and spectral openness follow as before.
    Every member of $cal(G)$ lies in some $T_k$, since its defining tree ends at scalar leaves.
  Intersect the smooth rank patches with the set where $A in cal(G)$.
    This intersection is open in each patch and still has full measure.
    Its subsets where $A in T_k$ are open and increase to the whole intersection.
    By finite measure, choose a finite $K$ so that the portion not covered by these rank-regular $T_K$ patches has
    volume less than $epsilon \/ 3$. If $K = 0$, the original subsolution already suffices.
    Otherwise fix $delta > 0$ with $delta lr(||) U < epsilon \/ \( 3 K \)$.
    At each of the $K$ reductions, take a compact subset of the current good region losing volume less than
    $epsilon \/ \( 3 K \)$, and use this fixed relative tolerance $delta$ in the local lemma before choosing its
    neighborhoods. Consider one reduction from $T_k$ to $T_(k - 1)$, with $1 lt.eq k lt.eq K$.
    Choose every admissible neighborhood below inside its current open $T_k$ rank patch.
  At a rank-positive point, fix its smooth potential chart.
    If its matrix already belongs to $T_(k - 1)$, choose an admissible neighborhood on which $A in T_(k - 1)$;
    every contained box then needs no change. Otherwise choose its frozen two-child plan,
    with children in $T_(k - 1)$. Apply Lemma 8 with both child neighborhoods equal to the spectral extension of
    $T_(k - 1)$ and with the already fixed relative tolerance $delta$.
    It supplies an admissible neighborhood for every contained grid box;
    the large-frequency family then permits any prescribed weak error.
    The local independent gradients have a positive smallest singular value on the initial compact neighborhood
    used by that lemma. At a rank-zero point, choose an admissible neighborhood on which the potentials are
    constant and their fluxes vanish. On any box with closure inside it,
    replace the matrix by any scalar strictly in $\( a \, b \)$, without changing the fields.
  These choices give admissible neighborhoods of every point in the chosen compact subset.
    A finite subcover of that compact set and a fine enough grid give finitely many disjoint box interiors,
    with closures inside admissible neighborhoods, covering the compact set except for grid faces.
    The frozen point need not lie in the grid box: Lemma 8 applies to every box whose closure lies in its
    admissible neighborhood. One can equivalently refine a grid successively.
    Each box is treated using its own chart, fixed frame, rank bound, and frozen plan;
    no continuous eigenframe on the whole domain is required.
  For this reduction, construct every boxwise output from the same incoming subsolution,
    with the frozen data just selected. In each rank-positive box requiring a join,
    use the local lemma with the fixed relative tolerance $delta$.
    Paste the individual potential and flux differences and the matrix choices over the disjoint box interiors.
    The potential and flux differences have compact support in those boxes,
    so the pasted gradients and fluxes have each box’s constitutive relation, and the exact flux pairings add.
    Since the box interiors are disjoint, the sum of the exceptional volumes is less than $delta sum_Q lr(||) Q
    lt.eq delta lr(||) U < epsilon \/ \( 3 K \)$. The unchanged $T_(k - 1)$ boxes and the rank-zero scalar boxes
    create no exceptional volume. Together with them, the open pure regions give smooth patches with the local
    rank property on which the new matrix belongs to $T_(k - 1)$. The output is again a subsolution.
    In joined boxes this is part of the lemma; in the other boxes the fields are unchanged,
    and either the matrix is unchanged or it maps the zero gradients to the zero fluxes.
    The scalar replacement lies in $cal(G)$ and retains the local rank property.
    Matrix jumps at the finitely many box faces add only null seams,
    and the original cover remains where nothing changed.
  Perform the next step only inside these new good patches and continue down to $T_0$.
    Untreated exceptional portions can be left untouched. Every map is supported in a selected box and maps that
    box onto itself. Thus later operations can be confined to the current good set.
    The initial loss is less than $epsilon \/ 3$; the $K$ compact-subset losses and the $K$ local exceptional
    losses are each less than $epsilon \/ \( 3 K \)$ per stage. Their total is less than $epsilon$.
    Fixed global rank bounds or fixed tolerances over infinitely many plans are not needed.
  Finally, because the box outputs are pasted from one incoming pair,
    the finite sum of their field differences is arbitrarily weakly small by taking their frequencies sufficiently
    large. Use a metric for the weak topology on the bounded set of all subsolution pairs,
    whose boundedness is shown below, and allot a sufficiently small part of the prescribed neighborhood to each
    of the finitely many stages. The final pair lies in the prescribed neighborhood,
    and its matrix is in $T_0$ off a set of measure less than $epsilon$, as asserted. ◻
]

=== 3.6 The strong limit selected by Baire <the-strong-limit-selected-by-baire>

We now close the argument without losing either Cauchy condition. All subsolution pairs are uniformly bounded in

$ cal(H) = L^2 \( U \; bb(R)^(3 times 2) \) times L^2 \( U \; bb(R)^(3 times 2) \) . $

Indeed, for each potential $tilde(u)_j$ of a subsolution, energy minimality with its fixed boundary trace gives

#[#set math.equation(numbering: n => "(3.21)")
 $ a integral_U lr(|nabla tilde(u)_j|)^2 lt.eq integral_U tilde(A) nabla tilde(u)_j dot.op nabla tilde(u)_j lt.eq
   b integral_U lr(|nabla u_j^(upright("in"))|)^2 . $ <sc:uniform-energy>]

Here $tilde(A)$ is that subsolution’s matrix. Also $lr(|F|) lt.eq b lr(|E|)$.
  Since $tilde(u)_j - u_j^(upright("in")) in H_0^1 \( U \)$,
  the zero-trace Poincaré inequality bounds the potentials themselves as well.

Let $Z$ be the weak closure in $cal(H)$ of all subsolution pairs.
  It is nonempty, weakly compact, and metrizable in its weak topology.
  One may use a metric obtained from a countable orthonormal basis of the separable Hilbert space $cal(H)$.
  Every point of $Z$ still consists of gradients of potentials with the prescribed traces and of divergence-free
  fluxes with the prescribed normal-flux functionals. To verify the gradient assertion,
  take a weakly convergent sequence of subsolutions; Equation (3.21) and Poincaré give weakly convergent
  potentials in the fixed affine space $u_j^(upright("in")) + H_0^1 \( U \)$.
  Their weak gradients are the limiting columns. For the flux assertion,
  all functionals $F_j mapsto integral_U F_j dot.op nabla psi$ are weakly continuous,
  for every fixed $psi in H^1 \( U \)$.

#thm([Lemma 3.8.])[
  (Weak-to-strong continuity points).  #emph[The identity from $Z$ with its weak topology to $cal(H)$ with its
    norm topology has a dense set of continuity points.]
] <sc:baire>

#proof[
  Let $P_N$ be the finite-rank orthogonal projections onto the first $N$ vectors of a fixed orthonormal basis.
    Their restrictions to $Z$ are weak-to-norm continuous and $P_N z arrow.r z$ in norm for every $z$.
    Here is the relevant Baire argument explicitly. On any nonempty closed subset $K$ of $Z$ and for $delta > 0$,
    the closed sets
  $ K_N = { z in K : ∥P_p z - P_q z∥ lt.eq delta upright(" for all ") p \, q gt.eq N } $
  cover $K$. Compact metric spaces are Baire, so some $K_N$ has nonempty relative interior.
    On that patch, letting $p$ tend to infinity gives $∥z - P_N z∥ lt.eq delta$.
    Shrinking the patch using continuity of $P_N$, its strong diameter is at most $3 delta$.
  Apply this inside the closure of an open set whose closure lies in any prescribed nonempty open subset of $Z$.
    The relative patch meets the original open set, because that set is dense in its closure.
    Their intersection contains a nonempty open subset of $Z$ of strong diameter at most $3 delta$.
    Consequently, for each $r > 0$, the union of all open subsets of $Z$ of strong diameter less than $r$ is open
    and dense. The intersection of these sets for $r = 1 \, 1 \/ 2 \, 1 \/ 3 \, dots.h$ is dense by Baire,
    and every point of the intersection is a continuity point of the identity. ◻
]

#proof[
  Choose a continuity point $\( E \, F \) in Z$ from Lemma 10.
    By the definition of $Z$, choose subsolution pairs converging weakly to it, and apply Proposition 9 to each,
    with weak errors tending to zero and with $epsilon_j = 2^(- j)$.
    Denote the resulting subsolutions by $\( A_j \, E_j \, F_j \)$. Then
  #[#set math.equation(numbering: n => "(3.22)")
   $ \( E_j \, F_j \) arrow.r \( E \, F \) quad upright("strongly in ") cal(H) \, $ <sc:strong-continuity-limit>]
  and $"dist" \( A_j \, bb(R) I \) < 2^(- j)$ except on a set of measure less than $2^(- j)$.
    Put $lambda_j = "tr" \( A_j \) \/ 3$. Since $A_j in cal(G)$, one has $a < lambda_j < b$,
    and the Frobenius-distance projection onto scalar matrices is exactly $lambda_j I$.
  The exceptional measures are summable. After discarding their limsup, which has measure zero, we have $A_j -
    lambda_j I arrow.r 0$ pointwise. Passing to a subsequence in Equation (3.22) also gives pointwise convergence
    of $E_j \, F_j$ almost everywhere. At such a point,
  $ F_j - lambda_j E_j = \( A_j - lambda_j I \) E_j arrow.r 0 . $
  If $E eq.not 0$, it follows that
  #[#set math.equation(numbering: n => "(3.23)")
   $ lambda_j arrow.r gamma = frac(E : F, lr(|E|)^2) in \[ a \, b \] \, wide F = gamma E \, $ <sc:measurable-scalar>]
  where $E : F$ is the Frobenius pairing. If $E = 0$, the bound $lr(|F_j|) lt.eq b lr(|E_j|)$ forces $F = 0$;
    define $gamma = a$ there. This defines one measurable scalar, common to both columns, with $a lt.eq
    gamma lt.eq b$ almost everywhere. No pointwise subsequence of the bounded coefficient sequence itself was assumed.
  The strong convergence is essential for excluding concentration on small exceptional sets.
    Equivalently, it makes $lr(|E_j|)^2$ uniformly integrable,
    so the coefficient defect times $E_j$ also tends to zero in $L^2$.
    A mere uniform energy bound would not suffice for that conclusion.
  Finally the gradient and flux characterization of $Z$ supplies $v_1 \,
    v_2 in H^1 \( U \)$ with the original traces, gradients $E$, and the original normal-flux functionals.
    Since $F = gamma E$ and its columns have zero divergence, these are precisely Equations (3.1) and (3.1). ◻
]

== 4 Constructing the branching block <sec:block>

We now construct a building block with three boundary components.
  Its essential property is that separately constant voltages produce constant flux densities in prescribed torus
  coordinates. All constants in this section may depend on this one fixed block.

#thm([Proposition 4.1.])[
  (Branching block).  #emph[Let $B subset bb(R)^3$ be a bounded connected Lipschitz domain whose boundary has
    three components $Gamma_0 \, Gamma_1 \, Gamma_2$. Suppose these components have disjoint product collars
    parametrized by $bb(T)^2 times \[ 0 \, eta_i \]$, where $bb(T)^2 = \( bb(R) \/ 2 pi bb(Z) \)^2$.
    Assume the parametrizations are bi-Lipschitz, smooth with nonsingular derivative on open pieces covering up to
    a null set, and that removing sufficiently thin collars leaves a connected Lipschitz central region.
    Let $mu_i$ be the probability measure obtained by pushing forward $\( 2 pi \)^(- 2) thin upright(d)
    theta$ to $Gamma_i$ by its collar parametrization.]
  #emph[There is a scalar conductivity $gamma_B$, bounded above and bounded away from zero,
    with the following property. For every $c = \( c_0 \, c_1 \, c_2 \) in bb(R)^3$,
    the weak $gamma_B$-harmonic function $U_c$ with boundary value $c_i$ on $Gamma_i$ satisfies
#[#set math.equation(numbering: n => "(4.1)")
 $ integral_B gamma_B nabla U_c dot.op nabla psi thin thin upright(d) x =
   sum_(i = 0)^2 I_i \( c \) integral_(Gamma_i) psi thin thin upright(d) mu_i \, wide psi in H^1 \( B \) \,
   $ <bl:constant-flux>]

 where $sum_i I_i \( c \) = 0$. The linear map $c mapsto I \( c \)$ has kernel $bb(R) \( 1 \, 1 \, 1 \)$ and image
   ${ I in bb(R)^3 : sum_i I_i = 0 }$.]
] <prop:branching-block>

We first construct a uniformly elliptic symmetric tensor and two fields with the required Cauchy data.
  Only at the end will we apply Theorem 3.

=== 4.1 Attaching flat ends <attaching-flat-ends>

Write $B_0$ for a connected Lipschitz central region after removing collars.
  Attach an auxiliary cylinder $bb(T)^2 times \[ 0 \, oo \)$ to each component of $partial B_0$,
  using the corresponding angular coordinates. The coordinate $t$ increases away from $B_0$.
  These infinite cylinders are auxiliary: we will retain only finite portions of them.

On $B_0$ use the identity tensor. On each cylinder use the energy

#[#set math.equation(numbering: n => "(4.2)")
 $ integral_0^oo integral_(bb(T)^2) #scale(x: 120%, y: 120%)[\(] lr(|partial_t p|)^2 +
   nabla_theta p dot.op S nabla_theta p #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta thin thin
   upright(d) t \, $ <bl:flat-energy>]

where $S$ is a fixed positive definite symmetric $2 times 2$ matrix such that the numbers $h^t S h$,
  $h in bb(Z)^2 \\ { 0 }$, have no equalities except those between $h$ and $- h$. Such an $S$ exists:
  each unwanted equality cuts out a proper hyperplane in the space of symmetric matrices,
  and countably many proper hyperplanes do not cover the open positive cone.
  The hyperplane is proper because $h h^t = l l^t$ implies $l = plus.minus h$.

Set $lambda_h = \( h^t S h \)^(1 \/ 2)$. For a trace $f$ on a torus,
  let $macron(f) = \( 2 pi \)^(- 2) integral f$ and write $f = macron(f) +
  sum_(h eq.not 0) hat(f) \( h \) e^(i h dot.op theta)$. Ellipticity gives $lambda_h gt.eq
  c_S lr(||) h$ for some $c_S > 0$, so only finitely many frequencies have rate below any fixed bound.
  Given a slope $s$, its continuation into the end is

#[#set math.equation(numbering: n => "(4.3)")
 $ p \( t \, theta \) = macron(f) + s t + sum_(h eq.not 0) hat(f) \( h \) e^(- lambda_h t) e^(i h dot.op theta) .
   $ <bl:flat-extension>]

Only the decaying part has finite energy on the infinite end; the full field is locally $H^1$ there.
  Its derivative at $t = 0$, directed into the end, is $s - P f$,
  where $P$ is the Fourier multiplier $lambda_h$ on nonconstant modes and zero on constants.

For prescribed slopes $s_0 + s_1 + s_2 = 0$, solve on $B_0$, modulo a common constant,

#[#set math.equation(numbering: n => "(4.4)")
 $ integral_(B_0) nabla p dot.op nabla psi thin thin upright(d) x + sum_(i = 0)^2 chevron.l P p_i \,
   psi_i chevron.r = sum_(i = 0)^2 s_i integral_(bb(T)^2) psi_i thin thin upright(d) theta . $ <bl:central-variational>]

Here $p_i \, psi_i in H^(1 \/ 2) \( bb(T)^2 \)$ are traces in the attachment coordinates.
  The brackets denote the $H^(- 1 \/ 2) \( bb(T)^2 \) \, H^(1 \/ 2) \( bb(T)^2 \)$ duality, equivalently

$ chevron.l P f \, g chevron.r = \( 2 pi \)^2 sum_(h eq.not 0) lambda_h hat(f) \( h \) hat(g) \( - h \) . $

The trace forms on the left are continuous on $H^1 \( B_0 \)$.
  For completeness, in a short collar the estimate for a Fourier mode with rate $m > 0$ is

$ m lr(|q \( 0 \)|)^2 lt.eq C integral_0^eta #scale(x: 120%, y: 120%)[\(] lr(|q'|)^2 + \( 1 + m^2 \) lr(||) q^2
  #scale(x: 120%, y: 120%)[\)] thin thin upright(d) t . $

It follows by applying the fundamental theorem of calculus and Cauchy–Schwarz on an interval of length comparable
  to $min { eta \, m^(- 1) }$; summation over modes and the bi-Lipschitz collar bounds give the assertion.
  The central Dirichlet energy is coercive modulo constants by the Poincaré inequality on connected $B_0$;
  the added trace forms are nonnegative. The right side kills constants.
  Hilbert space minimization therefore gives Equation (4.4).
  Together with Equation (4.3), it gives a joint weak solution,
  since the central outward flux functional equals $s_i - P p_i$.

Choose two fields corresponding to a basis of ${ s in bb(R)^3 : sum_i s_i = 0 }$.
  On each end the slope functional on this two-dimensional space is nonzero.
  Make an invertible affine change of these two fields, on this end only, so that the new fields $u \,
  v$ have respective slopes $1 \, 0$ and both have zero constant offset.
  At the end of our modification we will undo this same affine change.
  Consequently the original global pair and its slope vectors will be preserved.

If $v$ is not zero on the end, its first nonzero Fourier eigenspace consists of a single pair of opposite
  frequencies. A unimodular change of torus coordinates, followed by a translation, puts that leading term in the form

#[#set math.equation(numbering: n => "(4.5)")
 $ b e^(- lambda t) cos \( k x \) \, wide b eq.not 0 \, quad k in bb(N) \, quad lambda > 0 . $ <bl:leading-mode>]

Indeed, divide the frequency vector by the greatest common divisor of its coordinates and complete the resulting
  primitive vector to an integral unimodular basis. Translation absorbs the phase.
  The angular tensor remains constant and positive definite under this change.
  Both changes preserve uniform probability measure on the torus,
  so they do not alter the measures prescribed in Proposition 11.

=== 4.2 Matching one flat end exactly <matching-one-flat-end-exactly>

The next lemma replaces the asymptotic form of the two fields by exact data on a finite section of the end.
  This leaves a single mode for the frequency construction in the following subsection.

#thm([Lemma 4.2.])[
  (Exact matching on one flat end).  #emph[Fix one end after the preceding affine and angular normalizations,
    and write $A_0 = "diag" \( 1 \, S \)$ in its coordinates $\( t \, x \, y \)$.
    Let $u_(upright("in")) \, v_(upright("in"))$ be the two flat continuations in Equation (4.3),
    with zero constant offsets and respective slopes $1 \, 0$.
    Suppose first that $v_(upright("in"))$ is nonzero, with leading term $b e^(- lambda t)
    cos \( k x \)$ as in Equation (4.5); thus $lambda^2 = k^2 S_(x x)$.]
  #emph[For every sufficiently large $T$, there are smooth fields $u_T \,
    v_T$ on $bb(T)^2 times \[ T \, T + 4 \]$ and a smooth symmetric matrix $H_T$ compactly supported in the
    interior of this band such that
#[#set math.equation(numbering: n => "(4.6)")
 $ "div" #scale(x: 120%, y: 120%)[\(] \( A_0 + H_T \) nabla u_T #scale(x: 120%, y: 120%)[\)] =
   "div" #scale(x: 120%, y: 120%)[\(] \( A_0 + H_T \) nabla v_T #scale(x: 120%, y: 120%)[\)] = 0 \,\
∥H_T∥_(L^oo) arrow.r 0 wide \( T arrow.r oo \) . $ <bl:end-matching-equations>]

 Near the left edge the pair is exactly $\( u_(upright("in")) \, v_(upright("in")) \)$;
   near the right edge it is exactly $\( t \, b e^(- lambda t) cos \( k x \) \)$.
   The fluxes in the positive $t$ direction there are respectively
   $\( partial_t u_(upright("in")) \, partial_t v_(upright("in")) \)$ and
   $\( 1 \, - lambda b e^(- lambda t) cos \( k x \) \)$. For large $T$, the corrected tensor $A_0 +
   H_T$ is uniformly elliptic. The construction also has $partial_t u_T > 0$,
   and the two gradients are independent off a union of $2 k$ smooth walls.
   If $v_(upright("in"))$ is identically zero, one instead obtains $v_T = 0$,
   right-hand field and flux pairs $\( t \, 0 \)$ and $\( 1 \, 0 \)$, and all the stated conclusions for $H_T \, u_T$.]
] <bl:end-matching>

The gradients of the target pair become dependent on the $2 k$ walls $sin \( k x \) = 0$.
  A correction based only on the potential coordinates $\( u \, v \)$ therefore cannot cover the band.
  The proof will remove the source near each wall, use wall fluxes to balance the remaining source between the
  regular strips, and then solve separately in those strips.
  We first record the compatibility conditions and the regular solve.

All changes of coordinates in this argument are made in the energy form.
  Thus matrices, their flux columns, and sources in a new chart are the corresponding matrix, vector,
  and source #emph[densities]. The divergence equations, symmetry of a matrix density,
  and integrals of source densities are preserved by these changes of coordinates.

For a compactly supported symmetric correction $H$, the two sources $"div" \( H nabla u \)$ and
  $"div" \( H nabla v \)$ have zero integral. Symmetry also gives

#[#set math.equation(numbering: n => "(4.7)")
 $ v "div" \( H nabla u \) - u "div" \( H nabla v \) = "div" #scale(x: 120%, y: 120%)[\(] v H nabla u -
   u H nabla v #scale(x: 120%, y: 120%)[\)] \, $ <bl:torque-divergence>]

so their cross-moment has zero integral as well. On a connected region where the gradients are independent,
  these conditions are sufficient for data of fixed compact support, as the following lemma shows.

First recall an elementary compact divergence construction.
  On a rectangular box $Q$, every $r in C_c^oo \( Q \)$ with $integral_Q r =
  0$ is the divergence of a vector in $C_c^oo \( Q \; bb(R)^d \)$.
  To see this inductively, write $Q = \( a \, b \) times Q'$,
  choose $eta in C_c^oo \( a \, b \)$ with $integral eta = 1$, and put $R \( x' \) =
  integral_a^b r \( t \, x' \) thin thin upright(d) t$. The first component

$ F_1 \( x \) = integral_a^(x_1) #scale(x: 120%, y: 120%)[\(] r \( t \, x' \) -
  eta \( t \) R \( x' \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) t $

is compactly supported, and the remaining source is $eta \( x_1 \) R \( x' \)$.
  Apply the construction in $Q'$ and multiply its components by $eta$.
  The one-dimensional case is direct integration. With fixed boxes and fixed auxiliary bumps,
  this is a linear construction with bounds in each smooth norm.
  The same assertion holds for data supported in a fixed compact subset of a connected open region:
  use a finite connected cover by boxes, a partition of unity,
  and bumps in overlaps to transfer the mean of each piece along a spanning tree.
  The final piece has zero mean because the original data do.

#thm([Lemma 4.3.])[
  (Two symmetric divergence columns).  #emph[Suppose $u \, v$ are smooth with independent gradients on a connected
    open region. Let $r^1 \, r^2$ be smooth densities supported in a fixed compact subset of that region and satisfying
#[#set math.equation(numbering: n => "(4.8)")
 $ integral r^1 = integral r^2 = integral \( v r^1 - u r^2 \) = 0 . $ <bl:three-moments>]

 Then there is a compactly supported smooth symmetric matrix density $H$ such that
#[#set math.equation(numbering: n => "(4.9)")
 $ "div" \( H nabla u \) = r^1 \, wide "div" \( H nabla v \) = r^2 . $ <bl:correction-equations>]

 For a fixed finite system of regular coordinate charts and supports, the construction has bounds in smooth norms.
   These bounds persist under sufficiently small smooth perturbations of the charts and fields.]
] <bl:regular-correction>

#proof[
  Use local coordinates $y_1 = u \, y_2 = v \, y_3$ and cover the source support by finitely many such coordinate
    boxes joined by overlaps in the regular region. A partition of unity splits the data.
    In any nonempty open overlap, smooth test pairs generate arbitrary vectors of the three moments in
    Equation (4.8). For example, take two bumps in the first component with different averages of $v$,
    and one bump in the second component. Their moment vectors are $\( 1 \, 0 \, macron(v)_1 \)$,
    $\( 1 \, 0 \, macron(v)_2 \)$, and $\( 0 \, 1 \, - macron(u)_3 \)$,
    which are independent when $macron(v)_1 eq.not macron(v)_2$. Such bumps exist because $v$ is a coordinate.
    Transfer the moment vector of each piece along a spanning tree to one final box;
    the total vector there is zero. We have reduced to a pair satisfying all three conditions in a single box.
  Solve $"div" F^i = r^i$ compactly by the box construction. Put $q = F_2^1 - F_1^2$. Integration by parts gives
  $ integral \( y_2 r^1 - y_1 r^2 \) = - integral q = 0 . $
  Choose a compactly supported vector $h$ with $"div" h = q$. Add to the first column the vector
  $ \( partial_2 h_1 \, med - partial_1 h_1 - partial_3 h_3 \, med partial_2 h_3 \)^t $
  and to the second column the vector
  $ \( partial_2 h_2 \, med - partial_1 h_2 \, med 0 \)^t . $
  Both additions have zero divergence, and their change to $F_2^1 - F_1^2$ is $- "div" h = - q$.
    The corrected columns can therefore be completed to a symmetric matrix:
    set its third-row counterparts by symmetry and its unused $33$ entry to zero.
    Since $nabla y_1 = e_1$ and $nabla y_2 = e_2$, its first two columns give Equation (4.9).
    Transform back to the original coordinates.
  All operations involve fixed compact supports, fixed integrations, smooth multipliers,
    and finitely many derivatives. The overlap moment matrices have nonzero determinants;
    they and the coordinate Jacobians remain invertible under small smooth perturbations.
    This proves the stated uniform bounds, allowing a fixed finite loss of derivatives. ◻
]

#proof[
  We first treat the nonzero case. Write the translated band as $0 < t < 4$, and normalize the input fields there by
  $ tilde(u)_T \( t \, theta \) = u_(upright("in")) \( T + t \, theta \) - T \, wide tilde(v)_T \( t \, theta \) =
    frac(v_(upright("in")) \( T + t \, theta \), b e^(- lambda T)) . $
  They tend in every fixed smooth norm on the band to
  #[#set math.equation(numbering: n => "(4.10)")
   $ U = t \, wide V = e^(- lambda t) cos \( k x \) . $ <bl:limiting-pair>]
  Indeed, the rate spectrum is discrete, so the first omitted rate in $v_(upright("in"))$, if present,
    is strictly larger than $lambda$; if there is no omitted mode, the normalized second field is already $V$.
    For an $H^(1 \/ 2)$ trace, Cauchy–Schwarz bounds every differentiated Fourier series on a translated band by
    the trace norm times a convergent sum of polynomial weights against the exponential factors.
    The positive rate gap then controls the normalized remainder;
    the decaying part of $tilde(u)_T$ is handled in the same way.
  Choose a fixed smooth cutoff which is zero near $t = 0$ and one near $t = 4$.
    Interpolate from $\( tilde(u)_T \, tilde(v)_T \)$ to $\( U \, V \)$ with this cutoff,
    and call the resulting pair $u \, v$. Both endpoint pairs are $A_0$-harmonic.
    Hence the source densities $r^1 = - "div" \( A_0 nabla u \)$, $r^2 = -
    "div" \( A_0 nabla v \)$ for the flat tensor are supported in a fixed interior subband and tend to zero in
    every fixed smooth norm.
  These sources satisfy Equation (4.8) exactly. The first two equalities express equality of the mean axial slopes
    before and after interpolation. For the third, integrate the counterpart of Equation (4.7) for $A_0$.
    The boundary expression is the difference of the cross-flux concomitants
  $ integral_(bb(T)^2) \( v partial_t u - u partial_t v \) thin thin upright(d) theta . $
  For the normalized input pair, continued harmonically along the translated end,
    this is independent of $t$ and tends to zero at infinity:
    its first field is linear plus decaying modes, and its second has zero offset and zero slope.
    For the pure pair it vanishes by angular integration. Hence the difference is zero.
  The three global moments now vanish, but the gradients may still fail to be independent near the walls of the
    limiting pair. For sufficiently large $T$, use coordinates $\( s = u \, x \, y \)$,
    since $u_t$ is close to one. Here $v_x$ denotes differentiation with $s \, y$ held fixed.
    Near each limiting wall, the equation $v_x = 0$ has a unique nearby smooth graph $x =
    x_j \( s \, y \)$ by the implicit function theorem. Recenter by $z = x - x_j \( s \, y \)$. Then
  #[#set math.equation(numbering: n => "(4.11)")
   $ v_z \( s \, 0 \, y \) = 0 \, wide lr(|v_(z z) \( s \, 0 \, y \)|) gt.eq c_(*) > 0 $ <bl:wall-simple>]
  on a fixed narrow strip. After narrowing it if necessary,
    $v_z \/ z$ extends smoothly and is bounded away from zero on the strip.
    The graphs and coordinates are periodic in $y$ and converge smoothly to their limiting counterparts.
    Choose all $2 k$ strips disjoint.
  We now remove the source near each wall. In its chart, $r^1 \,
    r^2$ and $H$ denote the transformed densities under the convention above,
    and derivatives hold the other recentered coordinates fixed. Set
  #[#set math.equation(numbering: n => "(4.12)")
   $ alpha \( s \, z \, y \) & = integral_0^z r^1 \( s \, q \, y \) thin thin upright(d) q \,\
G \( s \, z \, y \) & = integral_0^z #scale(x: 120%, y: 120%)[\(] r^2 -
  partial_s \( alpha v_z \) #scale(x: 120%, y: 120%)[\)] \( s \, q \, y \) thin thin upright(d) q -
  alpha \( s \, z \, y \) v_s \( s \, z \, y \) . $ <bl:wall-particular>]
  Use only the $s \, z$ block of $H$, taking
  $ H_(s s) = 0 \, wide H_(s z) = H_(z s) = alpha \, wide H_(z z) = G \/ v_z . $
  All entries involving $y$ are zero. The quotient extends smoothly across $z = 0$:
    the numerator vanishes there, so $G \/ z$ is smooth, while $v_z \/ z$ is smooth and bounded away from zero.
    In particular
  $ H_(z z) \( s \, 0 \, y \) =
    frac(r^2 \( s \, 0 \, y \) - r^1 \( s \, 0 \, y \) v_s \( s \, 0 \, y \), v_(z z) \( s \, 0 \, y \)) . $
  Differentiating Equation (4.12) gives
  $ partial_z alpha = r^1 \, wide partial_z G = r^2 - partial_s \( alpha v_z \) - partial_z \( alpha v_s \) . $
  Since $u = s$, the two flux columns are $\( 0 \, alpha \, 0 \)^t$ and $\( alpha v_z \, alpha v_s + G \, 0 \)^t$;
    the displayed identities prove both equations in Equation (4.9).
    The fixed denominator bound and the smooth convergence of the wall charts show that this correction is small
    in every fixed smooth norm. Integration only in $z$ preserves its support away from the axial ends.
    Multiply it by a cutoff in $z$ which equals one in a narrower wall strip and vanishes outside the chosen
    strip. After subtracting the divergences of these compact corrections,
    the remaining sources are supported away from all walls. They still have three zero total moments by Equation (4.7).
  The remaining source pair may nevertheless have nonzero moments in an individual regular strip between
    successive walls. We next transfer these imbalances across the walls without recreating a source there.
    To do so, choose any smooth $a \( s \, y \)$ supported in a fixed middle axial interval, put $H_(s z) =
    H_(z s) = a$, $H_(s s) = 0$, and set
  #[#set math.equation(numbering: n => "(4.13)")
   $ H_(z z) v_z = - 2 a #scale(x: 120%, y: 120%)[\(] v_s \( s \, z \, y \) -
     v_s \( s \, 0 \, y \) #scale(x: 120%, y: 120%)[\)] - a_s #scale(x: 120%, y: 120%)[\(] v \( s \, z \, y \) -
     v \( s \, 0 \, y \) #scale(x: 120%, y: 120%)[\)] . $ <bl:wall-homogeneous>]
  The first divergence is zero because $a$ is independent of $z$.
    For the second, the $z$ derivative of the right side is $- 2 a v_(s z) - a_s v_z$,
    which cancels $partial_z \( a v_s \) + partial_s \( a v_z \)$.
    Differentiating $v_z \( s \, 0 \, y \) = 0$ with the recentered $z$ fixed gives $v_(s z) \( s \, 0 \, y \) =
    0$. Hence both differences on the right of Equation (4.13) are of order $z^2$.
    Thus division by $v_z$ is again smooth and $H_(z z) v_z$ vanishes on the wall.
    Cut this matrix off away from the wall. Its new sources are confined to the adjacent regular strips.
    Their three moments on one side, up to a common orientation sign, are
  #[#set math.equation(numbering: n => "(4.14)")
   $ integral a \( s \, y \) #scale(x: 120%, y: 120%)[\(] 1 \, v_s \, v -
     s v_s #scale(x: 120%, y: 120%)[\)] \( s \, 0 \, y \) thin thin upright(d) s thin thin upright(d) y \;
     $ <bl:wall-moment-map>]
  on the other side they are their negatives. This follows by integrating the two fluxes and Equation (4.7);
    their normal values on the wall are $a$, $a v_s$, and $a \( v - s v_s \)$.
    They are flux densities in this chart, so the wall integral uses $thin upright(d) s thin thin upright(d) y$.
  The map in Equation (4.14) has a bounded right inverse uniformly for large $T$.
    On a limiting wall write $V \( s \, 0 \, y \) = sigma e^(- lambda s)$, where $sigma in { 1 \, - 1 }$, and set
  $ w \( s \) = #scale(x: 120%, y: 120%)[\(] 1 \, - sigma lambda e^(- lambda s) \,
    sigma \( 1 + lambda s \) e^(- lambda s) #scale(x: 120%, y: 120%)[\)] . $
  Its three component functions are linearly independent on every open interval:
    after multiplying a linear relation by $e^(lambda s)$, two derivatives force its exponential coefficient to
    vanish, and the remaining affine coefficients then vanish.
    Choose a nonnegative smooth middle-supported function $chi$, positive on an interval,
    and use $a_j \( s \, y \) = chi \( s \) w_j \( s \)$, $j = 1 \, 2 \, 3$.
    The limiting moment matrix is $2 pi integral chi \( s \) w \( s \) w \( s \)^t thin thin upright(d) s$,
    which is positive definite. Its determinant remains nonzero for the smoothly perturbed wall coordinates and
    fields. This provides a fixed finite-dimensional right inverse with the asserted support and bounds.
  The regular strips form a cyclic adjacency graph with $2 k$ vertices.
    Choose a spanning tree and transfer each strip’s three-vector imbalance towards a root.
    The root imbalance is zero because the total is zero. There are only finitely many transfers,
    so all corrections remain small with the sources. Their cutoff regions lie in fixed cores of the regular
    strips. Each regular strip is connected; away from the narrow wall neighborhoods $v_x$ has a fixed nonzero
    sign and $\( u \, v \, y \)$ are regular local coordinates.
    The remaining source pair in each strip now has all three moments zero and support in a fixed compact subset
    of that strip. Lemma 13 removes it there.
  Choose the wall strips and their transverse cutoffs first for the limiting pair in Equation (4.10),
    with the axial supports a positive distance from the band ends.
    In the complementary regular strips choose the source cores a positive distance from their bounding walls and
    the band ends, and fix the associated finite chart covers, overlap bumps, and right inverses.
    These choices persist for the smoothly close fields. Transforming each local matrix density back to the
    product coordinates and summing gives a correction $H$ with $"div" \( H nabla u \) =
    r^1$ and $"div" \( H nabla v \) = r^2$. Thus both fields solve the equations for $A_0 + H$.
    The fixed bounds, including the finite derivative loss in Lemma 13,
    and the convergence of the sources in every smooth norm give $∥H∥_(L^oo) arrow.r 0$ as $T arrow.r oo$.
    These constants are for the fixed end; no estimate uniform in $lambda$ or $k$ is used.
    For large enough $T$, $A_0 + H$ remains uniformly positive definite.
  Return to the original band by setting
  $ u_T \( T + t \, theta \) = T + u \( t \, theta \) \, wide v_T \( T + t \, theta \) =
    b e^(- lambda T) v \( t \, theta \) \, $
  and translating $H$ to $H_T$. Linearity preserves both equations.
    Near the left and right edges, respectively, the pair is the original input and the exact target, and $H_T =
    0$. The normal row of $A_0$ is $\( 1 \, 0 \, 0 \)$, so the stated positive-$t$ fluxes follow there.
    Finally, $partial_t u_T > 0$ by smooth closeness to $U = t$; away from the $2 k$ wall graphs,
    $v_x eq.not 0$ in the $\( s \, x \, y \)$ coordinates, so the two gradients are independent.
    This proves the nonzero case.
  If $v_(upright("in"))$ is identically zero, normalize and interpolate only the first field to $t$.
    Its residual is small, compactly supported, and has mean zero because the two mean slopes agree.
    The compact divergence construction on the connected band gives a small compactly supported flux correction
    $f$ with $"div" f$ equal to this residual. Since $e = nabla u$ stays nonzero, the symmetric matrix
  $ H = frac(f e^t + e f^t, lr(||) e^2) - frac(\( f dot.op e \) e e^t, lr(||) e^4) $
  satisfies $H e = f$. It is smooth, compactly supported, and small because $e$ stays bounded away from zero on
    this fixed band. Returning to the original band gives the stated first field, flux, and ellipticity,
    with $partial_t u_T > 0$ and the zero field unchanged. ◻
]

=== 4.3 Ending a single mode in finite distance <ending-a-single-mode-in-finite-distance>

The frequency-changing mechanism below is related to classical nonunique-continuation constructions [9];
  we prove all the two-field properties needed here directly.
  We next keep $u = t$ while terminating the remaining mode.
  Throughout this construction the normal coefficient is one and the normal-angular cross entries vanish.
  Only the symmetric angular $2 times 2$ block varies. Thus $u = t$ is always a solution with unit axial flux,
  and the normal flux of the other field is simply its $t$ derivative.

For a pure mode $f \( t \) cos \( p x \)$, a diagonal angular block with $x$ entry

#[#set math.equation(numbering: n => "(4.15)")
 $ a_x \( t \) = frac(f'' \( t \), p^2 f \( t \)) > 0 $ <bl:pure-angular-entry>]

solves the equation. The unused diagonal entry can be any fixed positive number.
  At the end of the matching band, replacing the old constant angular block by this diagonal one preserves the
  pure mode’s equation, because its active entry is unchanged.
  It also preserves both fields and their normal fluxes at the interface.
  If necessary, reflect the entire normalized second field on this end,
  including its retained input and matching region, so that the initial amplitude is positive;
  include this reflection in the affine normalization that is undone when returning to the original global pair.

Fix a sufficiently large $L$, to be chosen once below. In a crossing from frequency $p$ in one angular axis to
  frequency $2 p$ in the other, use an interval $lr(|t - t_0|) lt.eq L \/ p$ and write

#[#set math.equation(numbering: n => "(4.16)")
 $ f \( t \) = b e^(- 3 p \( t - t_0 \)) \, wide g \( t \) = b e^(- p \( t - t_0 \)) . $ <bl:crossing-profiles>]

Let $z = p \( t - t_0 \)$. Turn on the second mode by a smooth cutoff that is zero near $z = -
  L$ and one for $z gt.eq - L \/ 2$; turn off the first by a cutoff that is one for $z lt.eq
  L \/ 2$ and zero near $z = L$. Take these cutoffs with derivatives of order $j$ bounded by fixed constants times
  $L^(- j)$. The field is the sum of the two cut-off modes.
  Before correction the angular diagonal entries are $9$ and $1 \/ 4$,
  the squares of the ratios of their decay rates to their frequencies.
  At least one uncut positive profile remains throughout the crossing:
  the incoming cutoff is one through $z = L \/ 2$, and the outgoing cutoff is one from $z = - L \/ 2$.

Only one cutoff varies at a time. On such a region, relabel the dominant angular variable as $x$,
  its frequency as $ell$, and its amplitude as $D \( t \) > 0$; label the weaker variable as $y$,
  its frequency as $m$, and its cut-off amplitude as $J \( t \)$. The residual is $R \( t \) cos \( m y \)$.
  Since the weak-to-dominant ratio is at most $e^(- L)$ on both cutoff regions, and $m \/ ell in { 2 \, 1 \/ 2 }$,

#[#set math.equation(numbering: n => "(4.17)")
 $ frac(lr(||) R, ell^2 D) + frac(lr(||) J, D) lt.eq C e^(- L) . $ <bl:crossing-smallness>]

Indeed $R$ consists of a second cutoff derivative times the uncut weak profile and twice a first cutoff derivative
  times its first derivative; scaling by $z$ gives exactly this estimate.
  The amplitude comparisons are $g \/ f = e^(2 z) lt.eq e^(- L)$ on the turn-on region and $f \/ g =
  e^(- 2 z) lt.eq e^(- L)$ on the turn-off region.

The following symmetric angular correction cancels the residual #emph[exactly]:

#[#set math.equation(numbering: n => "(4.18)")
 $ H_(x y) = H_(y x) & = frac(2 R, D ell m) sin \( ell x \) sin \( m y \) \,\
H_(x x) & = frac(R, D ell^2) cos \( ell x \) cos \( m y \) - frac(2 R J, D^2 ell^2) sin^2 \( m y \) \,\
H_(y y) & = 0 . $ <bl:crossing-correction>]

To check this, an off-diagonal entry $a sin \( ell x \) sin \( m y \)$ contributes

$ - a D ell m sin^2 \( ell x \) cos \( m y \) - a J ell m cos \( ell x \) sin^2 \( m y \) $

to the angular divergence of the flux. The divergence contributions of the two unit $x x$ entries are

$ cos \( ell x \) cos \( m y \) & mapsto - D ell^2 cos \( 2 ell x \) cos \( m y \) \,\
sin^2 \( m y \) & mapsto - D ell^2 cos \( ell x \) sin^2 \( m y \) . $

Substitution of Equation (4.18) leaves just $- R cos \( m y \)$.
  Equation (4.17) bounds every correction entry by $C e^(- L)$.
  Choose $L$ once so large that the perturbed angular block has eigenvalues in a fixed positive interval,
  independently of $p$ and $b$, and also that $2 e^(- 4 L) < 1$.
  No $t$ derivative of this correction occurs in the equation, because its normal row and column are zero.

Between crossings, connect the pure outgoing frequency $p$ at decay rate $p \/ 2$ to the next incoming rate $3 p$.
  Write $r = - f' \/ f$ and choose a smooth transition, constant near its endpoints, such that

$ p \/ 2 lt.eq r lt.eq 3 p \, wide 0 lt.eq r' lt.eq p^2 \/ 8 . $

It fits in an interval of length $K \/ p$ for one fixed sufficiently large $K$.
  Starting from a positive amplitude, the solution $f \( t \) =
  f \( t_a \) exp \( - integral_(t_a)^t r \( q \) thin thin upright(d) q \)$ stays positive throughout the
  connector. Equation (4.15) then gives

#[#set math.equation(numbering: n => "(4.19)")
 $ 1 / 8 lt.eq frac(f'', p^2 f) = frac(r^2 - r', p^2) lt.eq 9 . $ <bl:connector-ellipticity>]

An initial pure connector joins the fixed starting rate $lambda$ at frequency $k$ to $3 k$.
  Choose its positive rate to vary slowly enough that $r^2 - r'$ remains positive.
  This single connector has finite length and positive finite ellipticity bounds depending on $lambda \/ k$;
  it need not share the later uniform constants. All interfaces preserve the profile and its first derivative,
  hence the normal flux. Changes in an unused angular entry likewise create no interface source.

Iterate the crossings with frequencies $p_j = 2^j k$, alternating the angular axes.
  Their lengths and connector lengths form a convergent geometric series.
  Let $b_j$ be the center amplitude of crossing $j$, and let $I_j >
  0$ be the integral of the decay rate over its following connector.
  The amplitude at the left edge of crossing $j$ is $b_j e^(3 L)$,
  and its outgoing amplitude at the right edge is $b_j e^(- L)$. Matching to the next crossing therefore gives

#[#set math.equation(numbering: n => "(4.20)")
 $ b_(j + 1) = b_j e^(- 4 L - I_j) lt.eq b_j e^(- 4 L) . $ <bl:amplitude-decay>]

Since $p_j = 2^j k$, this gives the explicit decay

$ p_j b_j lt.eq k b_0 \( 2 e^(- 4 L) \)^j arrow.r 0 . $

On crossing $j$ and its following connector the profile is bounded by $C b_j
  e^(3 L)$ and its first derivatives by $C p_j b_j e^(3 L)$, with fixed constants.
  The introduced mode, extrapolated backwards from the crossing center,
  is never larger than the continued dominant mode on its turn-on region.
  The displayed decay of $p_j b_j$ therefore makes the second field and its entire gradient tend uniformly to zero
  at the finite limiting section $t = t_(*)$. Its energy is finite,
  since the gradient is bounded and the cylinder has finite length.

Extend the second field by zero for $t gt.eq t_(*)$. To verify the weak equation,
  integrate by parts through finitely many stages. Their interface terms cancel by the matching of normal
  derivatives. At a terminal section tending to $t_(*)$ the normal flux is $partial_t v$,
  which tends uniformly to zero; its contribution against any fixed smooth test function therefore tends to zero.
  The remaining energy integrals converge by integrability.
  This proves the weak equation across the accumulation section, with no surface source.
  The tensor stays bounded and uniformly positive, although its derivatives need not be bounded near $t_(*)$.
  Beyond that section it can be any fixed positive angular block with normal entry one.
  Add a short final flat band if necessary. On this band the two normalized fields are exactly $u = t$ and $v = 0$.

=== 4.4 Returning to the block and scalarizing <returning-to-the-block-and-scalarizing>

Apply Lemma 12 and the ending construction to each of the three ends.
  If its second field was identically zero, only the one-field matching step and a final flat band are needed.
  Undo each end’s own invertible affine change of fields. The two resulting global fields agree with their
  original central values and fluxes and have constant terminal voltages and constant angular flux densities.
  Their integrated terminal currents remain the two original independent slope vectors,
  multiplied by the common torus area $\( 2 pi \)^2$. In particular those currents are independent and each has
  zero sum.

Each end now has some finite length $T_i > 0$. For each $i$ separately,
  map the completed cylinder to its available physical collar by a fixed linear change from $\[ 0 \, T_i \]$ to
  the collar’s transverse interval, followed by the given collar parametrization.
  Push its tensor density, two fields, and flux pairing forward in the energy form,
  and retain the central tensor and fields on $B_0$. Each collar map is piecewise smooth and bi-Lipschitz with
  finite nonsingular bounds. These three pushforwards on the collars, together with the central tensor,
  define a bounded uniformly positive symmetric tensor $A_B$ on the physical block.
  The bi-Lipschitz constants are fixed after completing the finite cylinders and do not depend on the crossing index.

The fields have finite central and initial collar energy, the retained lengths are finite,
  and the ending construction has finite energy. Their traces match at each attachment,
  so matching-trace gluing gives two potentials in $H^1 \( B \)$.
  For every $psi in H^1 \( B \)$, restrict the test to $B_0$ and the three collars and pull back the collar
  restrictions. The energy and trace pairings are continuous on the respective $H^1$ spaces,
  so the weak identities on the pieces apply to these tests.
  At each attachment the central and collar outward flux functionals are opposite on the same trace.
  Summing the identities therefore cancels their terms and leaves only the terminal flux functionals.
  This is the global weak identity for the glued fields for every such test.
  Uniform parameter flux density on a terminal torus becomes a constant multiple of its specified measure $mu_i$:
  the flux pushforward preserves the flux integral against every pulled-back boundary test function,
  including through the axial compression. The glued potentials have constant traces on the three boundary components.

We verify all rank and regularity hypotheses of Theorem 3.
  The seams of the collar maps, the finitely many central attachment interfaces,
  all countably many stage interfaces, including connector interfaces,
  and the terminal accumulation surfaces have volume zero. Off these sets the tensor and fields are smooth on open
  pieces. In the central region and unchanged flat ends, the fields are real analytic,
  being constant-coefficient harmonic functions. Their gradient wedge is either not identically zero on a
  connected piece, in which case its zero set has measure zero, or is identically zero.
  In the latter case, on a neighborhood where one gradient is nonzero, write the other field as $v = F \( u \)$.
  Its equation gives

$ 0 = "div" \( A nabla v \) = F'' \( u \) nabla u dot.op A nabla u \, $

so $F$ is affine there. The critical set of a nonconstant analytic field has measure zero;
  if both fields are constant there is nothing to check. The elementary analytic zero-set assertion follows by
  locally differentiating to the first nonzero Taylor term and applying the one-variable zero-set fact along lines
  and Fubini.

In a matching band with nonzero second input, $u$ is a coordinate and the two gradients are independent off the
  finitely many smooth walls, by Equation (4.11) and the fixed sign of $v_x$ between them.
  In a pure or crossing band, $u = t$ and the angular part of the other field is one or two cosines on different
  axes. Its angular gradient is nonzero off a null set: with one nonzero mode its zeros lie in finitely many
  walls, and with both modes present they lie in their intersections.
  Above the accumulation section the second normalized field is zero, an allowed affine dependency.
  The case with just one matched field has a nonvanishing gradient.
  These properties are unchanged by invertible affine transformations of the pair or by the physical collar maps.
  Thus the required regular rank pieces cover $B$ up to a null set.

Theorem 3 now provides a bounded positive scalar $gamma_B$ and two scalar-conductivity harmonic fields with
  exactly the same boundary values and normal fluxes as the tensor fields.
  Together with constants, their boundary values span all separately constant data.
  Indeed, if a linear combination of the two fields had one common boundary constant,
  energy minimization for the positive tensor would make it a constant field,
  so its integrated currents would all be zero. Independence of the two original slope vectors forces that linear
  combination to be trivial. Their two voltage vectors are therefore independent modulo constants, as required.

Linearity and uniqueness for $gamma_B$ now prove Equation (4.1) for every $c in bb(R)^3$.
  Testing with $psi = 1$ gives $sum_i I_i \( c \) = 0$. If $I \( c \) = 0$, test instead with $psi = U_c$;
  positivity forces $nabla U_c = 0$, so connectedness of $B$ makes all $c_i$ equal.
  Conversely common constant data have zero current. The image therefore has dimension two and is precisely the
  zero-sum current plane. This proves Proposition 11.

== 5 From a branching block to identical boundary measurements <sec:nonuniqueness>

We now use the exact scalar block supplied by Proposition 11. Set $Omega = B \( 0 \, 3 \)$.
  Our objective is to construct a uniformly positive bounded scalar conductivity $gamma$,
  equal to one near the boundary, and a nonzero $w in H_0^1 \( Omega \) ∩ L^oo \( Omega \)$,
  supported away from the outer boundary, whose source satisfies

$ integral_Omega gamma nabla w dot.op nabla #scale(x: 120%, y: 120%)[\(] \( u - u_(*) \) phi.alt
  #scale(x: 120%, y: 120%)[\)] = 0 wide #scale(x: 120%, y: 120%)[\(] phi.alt in C_c^oo \( Omega \)
  #scale(x: 120%, y: 120%)[\)] $

for every bounded $gamma$-harmonic function $u$, with a constant $u_(*)$ depending on $u$.
  For a sufficiently small nonzero real $delta$, this identity will make the change from $gamma$ to
  $\( 1 + delta w \)^2 gamma$ preserve every boundary measurement.
  We obtain it by nesting scalar blocks, forcing one common average of $u$ on all cell boundaries,
  and passing signed surface charges to the limit.

All similarities below act on scalar conductivities by composition,
  so their ellipticity bounds remain fixed at every depth.

=== 5.1 A repeatable geometry <a-repeatable-geometry>

Set

#[#set math.equation(numbering: n => "(5.1)")
 $ L = 8 / 5 \, wide h = 3 / 100 \, wide s = 57 / 100 \, wide a = 81 / 100 . $ <nu:parameters>]

The inequalities $2 s > 1$ and $2 s^3 < 1$ will respectively ensure convergence of the potential series and
  vanishing volume of the limiting nested set. Define the rectangular annular prism

#[#set math.equation(numbering: n => "(5.2)")
 $ D = {x in bb(R)^3 : h < max #scale(x: 120%, y: 120%)[\(] lr(|x_1|) \/ L \,
   lr(|x_2|) #scale(x: 120%, y: 120%)[\)] < 1 \, quad lr(|x_3|) < 1} . $ <nu:parent>]

Let $R \( x_1 \, x_2 \, x_3 \) = \( x_2 \, x_1 \, x_3 \)$, put

$ S_plus.minus x = s R x plus.minus a e_1 \, wide D_plus.minus = S_plus.minus D \, wide B =
  D \\ #scale(x: 120%, y: 120%)[\(] overline(D_(-)) union overline(D_(+)) #scale(x: 120%, y: 120%)[\)] \, $

and write $Sigma = partial D$ and $Sigma_plus.minus = partial D_plus.minus$.

#thm([Lemma 5.1.])[
  #emph[The three boundary components of $B$ are disjoint Lipschitz tori.
    They have compatible piecewise smooth bi-Lipschitz product collars,
    whose removal leaves a connected Lipschitz central region.
    Moreover, $overline(D_(-))$ and $overline(D_(+))$ are disjoint compact subsets of $D$.]
] <nu:geometry>

#proof[
  The outer boxes of the children are, respectively,
  $ \[ - 1.38 \, - 0.24 \] times \[ - 0.912 \, 0.912 \] times \[ - 0.57 \, 0.57 \] quad
    upright("and") quad \[ 0.24 \, 1.38 \] times \[ - 0.912 \, 0.912 \] times \[ - 0.57 \, 0.57 \] . $
  They lie strictly inside the parent outer box. Both avoid the parent axial hole,
    whose first-coordinate half-width is $L h = 0.048$, and the two boxes have separation at least $0.48$.
  For explicit collars, let $q \( theta \) = \( q_1 \( theta \) \, q_2 \( theta \) \)$ parametrize the unit square
    perimeter by rays, and let $zeta \( psi \)$ similarly parametrize the perimeter of $\[ h \, 1 \]
    times \[ - 1 \, 1 \]$ about its center $c_0 = \( \( 1 + h \) \/ 2 \, 0 \)$.
    Both parameters have period $2 pi$. Writing
  $ \( r \, z \) = c_0 + \( 1 + tau \) #scale(x: 120%, y: 120%)[\(] zeta \( psi \) -
    c_0 #scale(x: 120%, y: 120%)[\)] \, $
  the map
  #[#set math.equation(numbering: n => "(5.3)")
   $ \( theta \, psi \, tau \) mapsto #scale(x: 120%, y: 120%)[\(] L r q_1 \( theta \) \,
     thin r q_2 \( theta \) \, thin z #scale(x: 120%, y: 120%)[\)] $ <nu:collar>]
  is a product collar of $Sigma$ for sufficiently small $lr(|tau|)$.
    Indeed $r$ stays strictly positive, and on each pair of perimeter faces the map and its inverse have bounded
    derivatives and nonzero Jacobian. The finitely many seams have measure zero.
    The child collars are its images under $S_(-)$ and $S_(+)$. Choose their widths small enough that they are disjoint.
  For completeness, the central complement is connected. Above the child boxes, for example at height $x_3 = 0.8$,
    its horizontal section is the connected parent rectangular annulus.
    A point between heights $- 0.57$ and $0.57$ in the complement of the children can move vertically to that
    level: its horizontal position is outside the child annular footprints or inside one of their axial holes.
    A point below the child boxes first moves horizontally in the parent annulus to a position outside both boxes
    and then moves upward. The same argument applies after sufficiently thin collars are removed.
    Such removal slightly shrinks the parent cross-sectional rectangle in $\( r \, x_3 \)$ and slightly expands
    the two child rectangles; all the containment margins above remain positive.
  We also check the local boundary regularity for these particular regions.
    Positive separation places each boundary point on just one boundary of a rectangular annular prism.
    A face is locally a half-space, and the convex edge and corner types are graphs of maxima or minima of
    finitely many affine functions after choosing a diagonal direction.
    For an inner top corner, the reentrant local model, after changes of coordinates and signs,
    is ${ max \( x \, y \) > 0 \, med z < 0 }$. On the line $\( x \, y \, z \) = \( x_0 \, y_0 \, z_0 \) +
    t \( 1 \, 1 \, - 1 \)$, membership is equivalent to
  $ t > max { z_0 \, - max \( x_0 \, y_0 \) #scale(x: 120%, y: 120%)[}] . $
  The threshold is a Lipschitz function on the transverse plane $x_0 + y_0 - z_0 = 0$.
    Inner edges give the corresponding two-dimensional max graph,
    and reversing the side of any of these boundaries reverses the inequality without changing the graph.
    The remaining edge and corner types give the same max/min description.
    Thus every boundary point has a local Lipschitz graph. The small collar adjustment keeps this rectangular form
    and the positive separation, so the central region is Lipschitz as claimed. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.68, -2.3), (3.68, 2.3), fill: rgb("#f0f0f0"), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((-0.1104, -0.069), (0.1104, 0.069), fill: rgb("#ffffff"), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((-3.174, -2.098), (-0.552, 2.098), fill: rgb("#d9d9ff"), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((0.552, -2.098), (3.174, 2.098), fill: rgb("#d9d9ff"), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((-1.902, -0.06293), (-1.824, 0.06293), fill: rgb("#f0f0f0"), stroke: (thickness: 0.3pt, miter-limit: 10))
  rect((1.824, -0.06293), (1.902, 0.06293), fill: rgb("#f0f0f0"), stroke: (thickness: 0.3pt, miter-limit: 10))
  content((-1.863, 1.127), [#text(size: 9pt)[$D_-$]])
  content((1.863, 1.127), [#text(size: 9pt)[$D_+$]])
  content((0, 1.495), [#text(size: 9pt)[$B$]])
  line((-3.68, 2.645), (3.68, 2.645), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((0, 2.645), [#text(size: 9pt)[$2L=3.2$]], anchor: "south", padding: 0.1176cm)
  line((-4.048, -2.3), (-4.048, 2.3), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((-4.048, 0), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  line((-0.69, -2.875), (0, -0.0575), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1058cm, fill: black)))
  content((-0.69, -2.875), [#text(size: 9pt)[parent axial hole]], anchor: "north", padding: 0.1176cm)
  line((2.645, -2.875), (1.863, -0.046), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1058cm, fill: black)))
  content((2.645, -2.875), [#text(size: 9pt)[child axial hole]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Top view of the cell geometry, at the exact planar scale. The parent prism has $lr(|x_3|) < 1$; the two shaded child prisms have $lr(|x_3|) < s$. The small gray child holes belong to $B$, whereas the white central hole is outside $D$. The available space above and below the children connects the block. ],
) <nu:geometry-figure>

Let $mu$ be the probability measure on $Sigma$ obtained by pushing forward $\( 2 pi \)^(- 2) thin upright(d) theta
  thin thin upright(d) psi$ under Equation (5.3) at $tau = 0$,
  and let $mu_plus.minus = \( S_plus.minus \)_(*) mu$. These measures have bounded positive densities relative to
  surface measure on their respective fixed boundaries. Apply Proposition 11 to $B$ with these three measures.
  We obtain a scalar conductivity $b$ and constants $0 < c_b lt.eq C_b < oo$ such that $c_b lt.eq b lt.eq
  C_b$ almost everywhere, with the exact property: every $b$-harmonic field having separately constant boundary
  voltages has conormal flux a constant multiple of the corresponding probability measure on each component.

The ball $Omega$ strictly contains $overline(D)$, since the parent outer box has maximal norm $sqrt(L^2 + 2) < 3$.
  For a finite word $nu$ over ${ - \, + }$, let $lr(|nu|)$ denote its length, set $S_diameter = I$, and define

$ S_(nu plus.minus) = S_nu compose S_plus.minus \, wide D_nu = S_nu D \, quad B_nu = S_nu B \, quad Sigma_nu =
  partial D_nu \, quad mu_nu = \( S_nu \)_(*) mu . $

Every $S_nu$ is a similarity of ratio $s^(lr(|nu|))$. Its orthogonal part can reverse orientation,
  which does not affect any scalar energy or change-of-variables formula. The sets $B_nu$ are pairwise disjoint. Define

#[#set math.equation(numbering: n => "(5.4)")
 $ gamma \( x \) =
   cases(delim: "{", b \( S_nu^(- 1) x \) \, & x in B_nu upright(" for some ") nu \,, 1 \, &
   upright("otherwise") .) $ <nu:gamma>]

This is measurable and satisfies $c lt.eq gamma lt.eq C$, where $c = min \( 1 \, c_b \) > 0$ and $C =
  max \( 1 \, C_b \) < oo$. The remaining nested set has volume zero, since the total volume of the depth-$j$ cells is

#[#set math.equation(numbering: n => "(5.5)")
 $ 2^j s^(3 j) lr(||) D = \( 2 s^3 \)^j lr(||) D arrow.r 0 \, wide 2 s^3 = 0.370386 < 1 . $ <nu:null-set>]

The countably many boundary seams are also null sets. Their assigned values in Equation (5.4) are immaterial.

=== 5.2 Surface charges and equal averages <surface-charges-and-equal-averages>

We first record both the exact source identity and its scaling.
  For vectors in $bb(R)^3$, $lr(||) p$ denotes Euclidean norm.

#thm([Lemma 5.2.])[
  #emph[There is a constant $K$, independent of $nu$, such that for every $p = \( p_0 \, p_(-) \, p_(+) \)$ with
    $p_0 + p_(-) + p_(+) = 0$, there exists $W_(nu \, p) in H_0^1 \( Omega \) ∩ L^oo \( Omega \)$,
    vanishing off $overline(D_nu)$ and constant on each child cell, with
#[#set math.equation(numbering: n => "(5.6)")
 $ integral_Omega gamma nabla W_(nu \, p) dot.op nabla psi =
   p_0 integral_(Sigma_nu) "Tr" psi thin thin upright(d) mu_nu +
   p_(-) integral_(Sigma_(nu -)) "Tr" psi thin thin upright(d) mu_(nu -) +
   p_(+) integral_(Sigma_(nu +)) "Tr" psi thin thin upright(d) mu_(nu +) $ <nu:source-identity>]

 for every $psi in H^1 \( Omega \)$. It obeys
#[#set math.equation(numbering: n => "(5.7)")
 $ ∥W_(nu \, p)∥_oo lt.eq K s^(- lr(|nu|)) lr(||) p \, wide integral_Omega lr(|nabla W_(nu \, p)|)^2 lt.eq
   K s^(- lr(|nu|)) lr(||) p^2 . $ <nu:source-bounds>]

]
] <nu:source-lemma>

#proof[
  On the fixed block, let $V = \( V_0 \, V_(-) \, V_(+) \)$ be the constant voltage vector and let $p$ be the
    integrated outward conormal flux vector of its harmonic extension $v$.
    The map $V mapsto p$ is linear, $sum_i p_i = 0$, and
  $ integral_B b lr(|nabla v|)^2 = sum_i V_i p_i . $
  Thus its kernel consists exactly of common constants: zero flux implies zero energy,
    and connectedness of $B$ then makes $v$ constant. The induced map from voltage vectors modulo constants to
    zero-sum flux vectors is an isomorphism of two-dimensional spaces. Normalize its inverse by $V_0 = 0$.
  Extend $v$ by $V_plus.minus$ in $D_plus.minus$ and by zero outside $overline(D)$.
    Matching traces give an $H^1$ function $W_p$ with compact support in $overline(D)$.
    The exact block flux property gives Equation (5.6) at the root. This identity holds for every $H^1$ test:
    equivalently, one may first multiply the test by a smooth cutoff equal to one near $overline(D)$.
    The boundary trace functionals are continuous, since the measures have bounded surface densities.
    Invertibility of the finite-dimensional map, the maximum principle for the bounded boundary voltages,
    and the energy identity give
  $ ∥W_p∥_oo lt.eq K lr(||) p \, wide integral lr(|nabla W_p|)^2 lt.eq K lr(||) p^2 . $
  For $j = lr(|nu|)$, set
  $ W_(nu \, p) \( x \) = s^(- j) W_p \( S_nu^(- 1) x \) \, $
  where $W_p$ is understood to be zero outside $overline(D)$.
    A similarity of ratio $r$ multiplies energy and integrated flux by $r$ in dimension three when the scalar
    coefficient is copied without changing its values. The extra voltage factor $r^(- 1)$, here $r = s^j$,
    therefore preserves the prescribed integrated charges and gives the bounds in Equation (5.7).
    The coefficient inside the children is irrelevant because this function has zero gradient there.
    Finally, $\( S_nu \)_(*) mu_plus.minus = mu_(nu plus.minus)$;
    hence the measure on each shared boundary is exactly the same from its two adjacent blocks. ◻
]

#thm([Lemma 5.3.])[
  #emph[If $u in H^1 \( Omega \)$ is weakly $gamma$-harmonic, then
$ m_nu \( u \) := integral_(Sigma_nu) "Tr" u thin thin upright(d) mu_nu $

 has one common value $u_(*)$ for all finite words $nu$. If $u$ is bounded, then $lr(|u_(*)|) lt.eq ∥∥ u_oo$.]
] <nu:equal-averages>

#proof[
  Test the weak equation for $u$ with $W_(nu \, p)$, and use Equation (5.6) with $psi = u$. This gives
  $ p_0 m_nu \( u \) + p_(-) m_(nu -) \( u \) + p_(+) m_(nu +) \( u \) = 0 wide upright("whenever ") p_0 + p_(-) +
    p_(+) = 0 . $
  The triple of averages is orthogonal to the zero-sum plane and is therefore constant.
    Iterating proves the assertion. If $u$ is bounded, its traces have the same essential bounds:
    apply the trace map to the vanishing positive-part truncations beyond those bounds.
    Since every $mu_nu$ is a probability measure, the last claim follows. ◻
]

=== 5.3 A bounded potential carrying opposite limiting charges <a-bounded-potential-carrying-opposite-limiting-charges>

Give the two first-level cells charges $q_(-) = 1$ and $q_(+) = - 1$, and recursively put $q_(nu -) = q_(nu +) =
  q_nu \/ 2$. Thus

#[#set math.equation(numbering: n => "(5.8)")
 $ lr(|q_nu|) = 2^(1 - j) quad \( lr(|nu|) = j gt.eq 1 \) \, wide sum_(lr(|nu|) = j) lr(|q_nu|) = 2 . $ <nu:charges>]

Define

$ Z_0 = W_(diameter \, \( 0 \, 1 \, - 1 \)) \, wide Z_j =
  sum_(lr(|nu|) = j) W_(nu \, \( - q_nu \, q_nu \/ 2 \, q_nu \/ 2 \)) quad \( j gt.eq 1 \) \, wide w^(\( N \)) =
  sum_(j = 0)^(N - 1) Z_j . $

The source identities telescope. For every integer $N gt.eq 1$ and every $psi in H^1 \( Omega \)$,

#[#set math.equation(numbering: n => "(5.9)")
 $ integral_Omega gamma nabla w^(\( N \)) dot.op nabla psi =
   sum_(lr(|nu|) = N) q_nu integral_(Sigma_nu) "Tr" psi thin thin upright(d) mu_nu . $ <nu:finite-source>]

#thm([Lemma 5.4.])[
  #emph[The sequence $w^(\( N \))$ converges in both $L^oo \( Omega \)$ and $H^1 \( Omega \)$ to a nonzero $w in
    H_0^1 \( Omega \) ∩ L^oo \( Omega \)$ that vanishes almost everywhere off $overline(D)$.]
] <nu:potential>

#proof[
  At a fixed depth the cell interiors are disjoint. Combining Equations (5.7) and (5.8),
    with a larger constant $K$ if necessary, gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ ∥Z_j∥_oo lt.eq K \( 2 s \)^(- j) \, wide ∥nabla Z_j∥_2^2 lt.eq K \( 2 s \)^(- j) . $ <nu:level-bounds>]
  Since $2 s = 1.14 > 1$, both $sum_j ∥Z_j∥_oo$ and $sum_j ∥nabla Z_j∥_2$ converge.
    The first controls the $L^2$ norms as well because $Omega$ is bounded. This proves the asserted convergence.
    Every partial sum is in $H_0^1 \( Omega \)$ and vanishes off $overline(D)$; the same is true of its limit.
  To show that $w eq.not 0$, fix $eta in C_c^oo \( Omega \)$ equal to one on a neighborhood of $overline(D_(-))$
    and zero on a neighborhood of $overline(D_(+))$. The positive separation of these compact sets makes this
    possible. At every depth the signed total in the first left cell is $1$ and that in the first right cell is $-
    1$. Equation (5.9) therefore gives
  $ integral_Omega gamma nabla w^(\( N \)) dot.op nabla eta = 1 . $
  Strong $H^1$ convergence yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_Omega gamma nabla w dot.op nabla eta = 1 \, $ <nu:nonzero>]
  which proves nontriviality. No trace or pointwise value on the limiting nested set has been used. ◻
]

=== 5.4 An exact transformation of all boundary measurements <an-exact-transformation-of-all-boundary-measurements>

The transformation in this subsection is related to the conformal energy identity used by Daudé, Kamran,
  and Nicoleau [5] Proposition 1.2. Here Equation (5.11) shows that $w$ has a nonzero source.
  The decisive property is that this source vanishes on every product $\( u - u_(*) \)
  phi.alt$ with $u$ bounded and harmonic and $phi.alt$ a smooth compactly supported test.
  We prove that identity before transforming the harmonic extensions.

Choose a real $delta eq.not 0$ such that $lr(|delta|) ∥∥ w_oo < 1 \/ 2$, and set

#[#set math.equation(numbering: n => "(5.12)")
 $ rho = 1 + delta w \, wide tilde(gamma) = rho^2 gamma . $ <nu:new-coefficient>]

Then

#[#set math.equation(numbering: n => "(5.13)")
 $ 1 / 2 lt.eq rho lt.eq 3 / 2 \, wide c / 4 lt.eq tilde(gamma) lt.eq frac(9 C, 4) quad
   upright("almost everywhere") . $ <nu:ellipticity>]

Both conductivities equal one in a neighborhood of $partial Omega$. They differ on a set of positive measure:
  by Equation (5.11), $w$ is not zero almost everywhere, and positivity of $rho$ makes $rho^2 =
  1$ equivalent to $w = 0$.

#thm([Lemma 5.5.])[
  #emph[Let $u$ be a bounded weakly $gamma$-harmonic function in $Omega$,
    and let $u_(*)$ be its common average from Lemma 16. Then, for every $phi.alt in C_c^oo \( Omega \)$,
#[#set math.equation(numbering: n => "(5.14)")
 $ integral_Omega gamma nabla rho dot.op nabla #scale(x: 120%, y: 120%)[\(] \( u - u_(*) \) phi.alt
   #scale(x: 120%, y: 120%)[\)] = 0 . $ <nu:weighted>]

]
] <nu:weighted-identity>

#proof[
  The product $\( u - u_(*) \) phi.alt$ belongs to $H_0^1 \( Omega \)$,
    so it is an admissible test in Equation (5.9). Put $M = ∥∥ u_oo$.
    For each depth-$N$ cell choose $x_nu in overline(D_nu)$. The zero-average identity on its surface gives
  $ integral_(Sigma_nu) \( "Tr" u - u_(*) \) phi.alt thin thin upright(d) mu_nu =
    integral_(Sigma_nu) \( "Tr" u - u_(*) \) #scale(x: 120%, y: 120%)[\(] phi.alt -
    phi.alt \( x_nu \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) mu_nu . $
  Since $lr(|"Tr" u - u_(*)|) lt.eq 2 M$ almost everywhere on this surface,
    the absolute value of the sum on the right-hand side of Equation (5.9) is at most
  #[#set math.equation(numbering: n => "(5.15)")
   $ 4 M ∥nabla phi.alt∥_oo thin "diam" \( D \) thin s^N . $ <nu:diameter-error>]
  Here we used Equation (5.8) and $"diam" \( D_nu \) = s^N "diam" \( D \)$. This tends to zero.
    The fixed product test has square-integrable gradient, so strong $H^1$ convergence of $w^(\( N \))$,
    together with boundedness of $gamma$, justifies passage to the limit on the left.
    Multiplication by $delta$ proves Equation (5.14). ◻
]

#thm([Proposition 5.6.])[
  #emph[The full weak Dirichlet-to-Neumann operators of $gamma$ and $tilde(gamma)$ on $Omega$ are equal.]
] <nu:identical-dn>

#proof[
  First take $f in C^oo \( partial Omega \)$, and let $u$ be its weak $gamma$-harmonic extension.
    The weak maximum principle, obtained by testing truncations beyond the boundary bounds,
    gives $∥∥ u_oo lt.eq ∥∥ f_oo$. Define
  #[#set math.equation(numbering: n => "(5.16)")
   $ tilde(u) = u_(*) + frac(u - u_(*), rho) . $ <nu:transformed-solution>]
  The Sobolev chain rule applies to $1 \/ rho$ on the interval $\[ 1 \/ 2 \, 3 \/ 2 \]$,
    and the product rule applies because both factors are bounded $H^1$ functions.
    Hence $tilde(u) in H^1 \( Omega \)$, and it equals $u$ off $overline(D)$,
    in particular near the outer boundary. Its flux is
  #[#set math.equation(numbering: n => "(5.17)")
   $ tilde(gamma) nabla tilde(u) = rho gamma nabla u - \( u - u_(*) \) gamma nabla rho . $ <nu:transformed-flux>]
  This is an $L^2$ vector field.
  For $phi.alt in C_c^oo \( Omega \)$, use $rho phi.alt in H_0^1 \( Omega \)$ in the original weak equation to obtain
  $ integral_Omega rho gamma nabla u dot.op nabla phi.alt = - integral_Omega phi.alt gamma nabla u dot.op nabla rho . $
  Equation (5.14), expanded by the product rule, also gives
  $ integral_Omega \( u - u_(*) \) gamma nabla rho dot.op nabla phi.alt = -
    integral_Omega phi.alt gamma nabla rho dot.op nabla u . $
  Subtracting proves that the divergence of the flux in Equation (5.17) is zero.
    All cross-gradient products are integrable by Cauchy–Schwarz;
    boundedness of the other factors also gives the stated $L^2$ flux bound.
    Density of smooth tests in $H_0^1 \( Omega \)$ proves the full weak equation.
    By uniqueness, $tilde(u)$ is the $tilde(gamma)$-harmonic extension of $f$.
  Now fix arbitrary $g in H^(1 \/ 2) \( partial Omega \)$ and choose an $H^1$ extension $V$ of $g$.
    Multiply $V$ by a smooth cutoff that equals one near $partial
    Omega$ and is supported in an outer collar disjoint from $overline(D)$.
    The resulting $V_0$ still has trace $g$, and its gradient is supported where the two solution fluxes agree.
    Consequently the defining weak pairings satisfy
  $ chevron.l Lambda_(tilde(gamma)) f \, g chevron.r = integral_Omega tilde(gamma) nabla tilde(u) dot.op nabla
    V_0 = integral_Omega gamma nabla u dot.op nabla V_0 = chevron.l Lambda_gamma f \, g chevron.r . $
  Both operators are bounded from $H^(1 \/ 2)$ to $H^(- 1 \/ 2)$ by the elliptic energy estimate.
    Since smooth boundary functions are dense in $H^(1 \/ 2) \( partial Omega \)$ on the ball,
    equality extends from smooth $f$ to all boundary traces. This last step does not require extending the
    transformation in Equation (5.16) to unbounded solutions. ◻
]

#proof[
  Lemma 14 permits the use of Proposition 11, and Equation (5.4) constructs a uniformly positive bounded scalar
    conductivity on the ball $Omega = B \( 0 \, 3 \) subset bb(R)^3$.
    Lemmas 15–17 produce the bounded nonzero function used in Equation (5.12).
    The second scalar conductivity has the positive bounds in Equation (5.13),
    agrees with the first near the boundary, and differs from it on a set of positive measure.
    Set $gamma_0 = gamma$ and $gamma_1 = tilde(gamma)$, with common positive finite bounds obtained by taking the
    smaller lower bound and the larger upper bound. Proposition 19 proves equality of their full weak
    Dirichlet-to-Neumann operators. Thus these coefficients give the claimed counterexample in dimension three,
    disproving the assertion quantified over all $n gt.eq 3$. ◻
]

#proof[
  Return to the notation of Corollary 2: let $Omega$ be its bounded connected Lipschitz domain, let $c \,
    C$ be the common bounds from Theorem 1, and let $B_1 \, dots.h \, B_m$ be the prescribed balls.
    Write $B_i = B \( x_i \, r_i \)$ and set $U_i = B \( x_i \, r_i \/ 2 \)$.
    The closed balls $overline(U)_i$ are separated from one another and from $partial Omega$,
    even if some prescribed balls have tangent boundaries. Let $a_0 \, a_1$ be the pair of Theorem 1,
    and put $Phi_i \( y \) = x_i + s_i y$, where $s_i = r_i \/ 6$. This maps $B \( 0 \, 3 \)$ onto $U_i$.
    Copy the scalar coefficients by composition: $a_(i \, j) = a_j compose Phi_i^(- 1)$ on $U_i$.
    If $q_(i \, j) \( h \)$ is the minimum energy with trace $h in H^(1 \/ 2) \( partial U_i \)$,
    change of variables gives
  $ q_(i \, j) \( h \) = s_i ⟨Lambda_(a_j) \( h compose Phi_i \) \, h compose Phi_i⟩ . $
  Thus $q_(i \, 0) = q_(i \, 1)$. The coefficient values and their unit boundary collars are preserved;
    no amplitude rescaling is needed.
  Define $gamma_epsilon = a_(i \, epsilon_i)$ on $U_i$ and $gamma_epsilon = 1$ elsewhere.
    The stated bounds follow because the original unit collars imply $c lt.eq 1 lt.eq C$.
    Let $E = Omega \\ union.big_i overline(U)_i$, and denote by
    $E_(upright("ext")) \( f \, h_1 \, dots.h \, h_m \)$ the minimum unit-conductivity energy on $E$ with outer
    trace $f$ and inner traces $h_i$. The trace theorem and matching-trace $H^1$ gluing,
    together with Equation (2.1), give
  $ ⟨Lambda_(gamma_epsilon) f \, f⟩ = min_(h_i in H^(1 \/ 2) \( partial U_i \))
    {E_(upright("ext")) \( f \, h_1 \, dots.h \, h_m \) + sum_(i = 1)^m q_(i \, epsilon_i) \( h_i \)}
    wide \( f in H^(1 \/ 2) \( partial Omega \) \) . $
  Indeed, restriction of a global competitor gives one inequality,
    and gluing the subdomain minimizers gives the other; a global minimizer supplies an attaining tuple of
    interface traces. The right side is independent of $epsilon$.
    Polarization therefore proves equality of the full weak operators.
  If two indices differ at position $i$, their conductivities differ inside $U_i$ on a set of measure $s_i^3
    lr(|{ a_0 eq.not a_1 }|) > 0$. This proves all $2^m$ choices are distinct.
    Their common boundary response is not asserted to be that of the constant conductivity one. ◻
]

#heading(level: 1)[References]
#bibitem([1])[K.~Astala, D.~Faraco, and L.~Székelyhidi, Jr.,
  Convex integration and the $L^p$ theory of elliptic equations,
  #emph[Annali della Scuola Normale Superiore di Pisa, Classe di Scienze] (5) #strong[7] (2008), no.~1, 1--50.
  #link("https://www.numdam.org/item/ASNSP_2008_5_7_1_1_0/")[Numdam: ASNSP\_2008\_5\_7\_1\_1\_0].]
#bibitem([2])[K.~Astala and L.~Päivärinta, Calderón's inverse conductivity problem in the plane,
  #emph[Annals of Mathematics] (2) #strong[163] (2006), no.~1, 265--299.
  #link("https://doi.org/10.4007/annals.2006.163.265")[doi:10.4007/annals.2006.163.265].]
#bibitem([3])[A.~P.~Calderón, On an inverse boundary value problem,
  in #emph[Seminar on Numerical Analysis and its Applications to Continuum Physics],
  Sociedade Brasileira de Matemática, Rio de Janeiro, 1980, pp.~65--73.
  Reprinted in #emph[Computational and Applied Mathematics] #strong[25] (2006), no.~2--3, 133--138.
  #link("https://doi.org/10.1590/S0101-82052006000200002")[doi:10.1590/S0101-82052006000200002].]
#bibitem([4])[P.~Caro and K.~M.~Rogers, Global uniqueness for the Calderón problem with Lipschitz conductivities,
  #emph[Forum of Mathematics, Pi] #strong[4] (2016), e2.
  #link("https://doi.org/10.1017/fmp.2015.9")[doi:10.1017/fmp.2015.9].]
#bibitem([5])[T.~Daudé, N.~Kamran, and F.~Nicoleau, On nonuniqueness for the anisotropic Calderón problem with
  partial data, #emph[Forum of Mathematics, Sigma] #strong[8] (2020), e7.
  #link("https://doi.org/10.1017/fms.2020.1")[doi:10.1017/fms.2020.1].]
#bibitem([6])[B.~Haberman, Uniqueness in Calderón's problem for conductivities with unbounded gradient,
  #emph[Communications in Mathematical Physics] #strong[340] (2015), no.~2, 639--659.
  #link("https://doi.org/10.1007/s00220-015-2460-3")[doi:10.1007/s00220-015-2460-3].]
#bibitem([7])[B.~Kirchheim, #emph[Rigidity and Geometry of Microstructures], habilitation thesis,
  Universität Leipzig, 2003; Lecture Note 16/2003, Max Planck Institute for Mathematics in the Sciences.
  #link("https://www.mis.mpg.de/publications/preprint-repository/lecture_note/2003/issue-16")[MPI MIS Lecture Note
  16/2003].]
#bibitem([8])[A.~Marino and S.~Spagnolo, Un tipo di approssimazione dell'operatore $sum_(i \, j = 1)^n
  D_i \( a_(i j) \( x \) D_j \)$ con operatori $sum_(j = 1)^n D_j \( beta \( x \) D_j \)$,
  #emph[Annali della Scuola Normale Superiore di Pisa, Classe di Scienze] (3) #strong[23] (1969), no.~4, 657--673.
  #link("https://www.numdam.org/item/ASNSP_1969_3_23_4_657_0/")[Numdam: ASNSP\_1969\_3\_23\_4\_657\_0].]
#bibitem([9])[K.~Miller, Nonunique continuation for uniformly parabolic and elliptic equations in self-adjoint
  divergence form with Hölder continuous coefficients, #emph[Archive for Rational Mechanics and Analysis]
  #strong[54] (1974), no.~2, 105--117. #link("https://doi.org/10.1007/BF00247634")[doi:10.1007/BF00247634].]
#bibitem([10])[OpenAI, Smooth anisotropic uniqueness in the Calderón problem from one boundary patch,
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Smooth-Anisotropic-Uniqueness-in-the-Calderon-Problem-from-One-Boundary-Patch-September-24-2026/paper.pdf")[OAI:Smooth-Anisotropic-Uniqueness-in-the-Calderon-Problem-from-One-Boundary-Patch-September-24-2026],
  2026.]
#bibitem([11])[B.~Raiă, Potentials for $cal(A)$-quasiconvexity,
  #emph[Calculus of Variations and Partial Differential Equations] #strong[58] (2019), article 105.
  #link("https://doi.org/10.1007/s00526-019-1544-x")[doi:10.1007/s00526-019-1544-x].]
#bibitem([12])[L.~Rondi, Continuity properties of Neumann-to-Dirichlet maps with respect to the $H$-convergence of
  the coefficient matrices, #emph[Inverse Problems] #strong[31] (2015), no.~4, 045002.
  #link("https://doi.org/10.1088/0266-5611/31/4/045002")[doi:10.1088/0266-5611/31/4/045002].]
#bibitem([13])[J.~Sylvester and G.~Uhlmann, A global uniqueness theorem for an inverse boundary value problem,
  #emph[Annals of Mathematics] (2) #strong[125] (1987), no.~1, 153--169.
  #link("https://doi.org/10.2307/1971291")[doi:10.2307/1971291].]
