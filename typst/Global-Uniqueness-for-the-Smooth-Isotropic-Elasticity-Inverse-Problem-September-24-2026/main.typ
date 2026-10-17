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

#align(center)[#text(size: 16pt, weight: "bold")[Global Uniqueness for the Smooth Isotropic Elasticity Inverse Problem]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $Omega subset bb(R)^3$ be a bounded connected domain with smooth boundary. For real functions $lambda \, mu in C^oo \( overline(Omega) \)$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ mu > 0 \, #h(2em) 3 lambda + 2 mu > 0 quad upright("on ") overline(Omega) \, $ <eq:energy-positivity>]

define the strain, stress, and static elasticity operator by

#[#set math.equation(numbering: n => "(1.2)")
 $ e \( u \) = frac(nabla u + \( nabla u \)^T, 2) \, #h(2em) sigma_(lambda \, mu) \( u \) = lambda \( "div" u \) I + 2 mu e \( u \) \, #h(2em) L_(lambda \, mu) u = "div" sigma_(lambda \, mu) \( u \) . $ <eq:physical-operator>]

Here $mu$ is the shear modulus and $lambda + 2 mu \/ 3$ is the bulk modulus. The inequalities in (1.1) give uniformly positive elastic energy. For each $f in H^(1 \/ 2) \( partial Omega \; bb(R)^3 \)$ there is a unique $u_f in H^1 \( Omega \; bb(R)^3 \)$ with $L_(lambda \, mu) u_f = 0$ and trace $f$. The displacement-to-traction map is defined weakly by

#[#set math.equation(numbering: n => "(1.3)")
 $ chevron.l Lambda_(lambda \, mu) f \, g chevron.r = integral_Omega [lambda \( "div" u_f \) \( "div" v_g \) + 2 mu e \( u_f \) : e \( v_g \)] upright(d) x \, $ <eq:physical-dn>]

where $v_g in H^1 \( Omega \; bb(R)^3 \)$ has trace $g$, and $A : B = "tr" \( A^T B \)$. The weak equation makes this expression independent of the extension. For smooth boundary data it is the traction $sigma_(lambda \, mu) \( u_f \) n$, with $n$ the outward normal.

#thm([Theorem 1.1.])[
  #emph[Let $Omega subset bb(R)^3$ be any bounded connected domain with $C^oo$ boundary. For $j = 1 \, 2$, let $lambda_j \, mu_j in C^oo \( overline(Omega) \; bb(R) \)$ satisfy $mu_j > 0$ and $3 lambda_j + 2 mu_j > 0$ on $overline(Omega)$. If 
$ Lambda_(lambda_1 \, mu_1) = Lambda_(lambda_2 \, mu_2) : H^(1 \/ 2) \( partial Omega \; bb(R)^3 \) arrow.r H^(- 1 \/ 2) \( partial Omega \; bb(R)^3 \) \, $

 then $lambda_1 = lambda_2$ and $mu_1 = mu_2$ throughout $Omega$.]
] <thm:main>

Thus Theorem 1 gives a positive resolution of the smooth three-dimensional isotropic elastic Calderón uniqueness problem under (1.1). It uses the full zero-frequency boundary operator in fixed Euclidean coordinates. The coefficients need not be analytic or close to constants, and their agreement near the boundary is not an additional hypothesis.

===== 1.1 History and significance. <history-and-significance.>

The inverse problem asks whether static boundary measurements determine both spatially varying elastic moduli. The scalar conductivity problem posed by Calderón #cite(label("Calderon1980")) and the complex geometric optics uniqueness theorem of Sylvester and Uhlmann #cite(label("SylvesterUhlmann1987")) are important antecedents, but elasticity couples two moduli through vector displacements. Nakamura and Uhlmann recovered the elastic boundary Taylor series #cite(label("NakamuraUhlmann1995Boundary")). Their original global claim #cite(label("NU1994")) was corrected in #cite(label("NU2003")). The erratum identifies two defects: the prescribed initial-value problem for a planar matrix transport need not be solvable, and substitution of the corrected complex geometric optics solutions yields a pseudodifferential equation where a partial differential equation had been asserted. Its corrected theorem proves uniqueness when both $parallel nabla mu_j parallel_(C^m)$ are sufficiently small.

Eskin and Ralston developed higher-order matrix complex geometric optics expansions using invertible planar transport frames, together with restricted elasticity uniqueness results #cite(label("EskinRalston2002Elasticity")) #cite(label("EskinRalston2004")). A direct inspection of the differential map from their auxiliary vector–scalar fields to physical displacement #cite(label("EskinRalston2004")) Section 3 shows that it is noninjective. The reduction alone therefore does not transfer equality of the physical boundary maps to equality of unrestricted auxiliary Cauchy data. The proof here transfers exact physical solutions while retaining their actual divergence.

In two dimensions, Imanuvilov and Yamamoto proved global uniqueness for smooth coefficients satisfying $mu > 0$ and $lambda + mu > 0$, without a smallness assumption #cite(label("ImanuvilovYamamoto2015Elasticity")). In three dimensions, Lin and Nakamura gave local boundary reconstruction at finite regularity #cite(label("LinNakamura2017")); Tan and Liu obtained boundary jets on smooth Riemannian manifolds and global recovery under their analytic hypotheses #cite(label("TanLiu2023")). A recent preprint of Chen, Jiang, Liu, and Tao treats structured shear moduli under axisymmetry, separation, or directional quasianalyticity in the specified geometries #cite(label("ChenJiangLiuTao2026Elasticity")). Theorem 1 treats the full smooth class under (1.1).

===== 1.2 Conventions. <conventions.>

All differential identities are complexified by linearity. Dot products of complex vectors, including the null condition and orthogonality, use the complex bilinear extension of the Euclidean product. Sobolev norms and Hilbert-space adjoints use the usual Hermitian structure. Equality of the real boundary maps extends complex linearly to the complex boundary data used in the proof.

===== 1.3 Proof strategy. <proof-strategy.>

The proof converts equality of the boundary maps into an exact exterior comparison of physical solutions. Boundary determination first gives matching boundary jets, from which we construct common smooth extensions of the coefficients outside $Omega$. Given a solution in the first medium, equality of displacement and traction then lets us glue a solution in the second medium to it across $partial Omega$. The two solutions, and their actual divergences, coincide in the exterior. Section 2 establishes this transfer.

Fix a nonzero complex null vector $theta$, so $theta dot.op theta = 0$, and write $D_theta = theta dot.op nabla$. The real and imaginary parts of $theta$ span a plane on which $D_theta$ is a nonzero multiple of a Cauchy–Riemann operator; the remaining real coordinate is transverse to these planes. For solutions with exponential phase $e^(tau theta dot.op x)$, the leading displacement–divergence pair $\( a \, b \)$ has $a in H_theta = { a in bb(C)^3 : theta dot.op a = 0 }$ and $b in bb(C)$. The resulting transport space $cal(E)_theta = H_theta xor bb(C)$ has dimension three. The displacement–divergence reduction to a system with Laplacian principal part is classical in Lamé unique continuation #cite(label("Weck1969")) #cite(label("ImanuvilovYamamoto2004Carleman")). The formulation here uses an independent vector–scalar pair $\( u \, d \)$, retains that principal part after normalization, and satisfies a compatibility identity for the defect $"div" u - d$. Its supported Carleman estimate, together with a compatible high-order transport recursion and a correction using the physical elasticity operator, realizes a full local frame in $cal(E)_theta$ by exact displacements. The construction controls both the leading pair and its weighted first derivatives. Sections 3 and 4 prove these facts.

The leading equations have a useful normalization. For each coefficient pair, set

$ p = sqrt(mu) thin a \, #h(2em) s = - frac(lambda + mu, 2 sqrt(mu)) thin b - 1 / 2 nabla log mu dot.op p . $

This is an invertible change of variables on $cal(E)_theta$, since $mu > 0$ and $lambda + mu > 0$. In the $j$th medium, the normalized transport takes the form

$ D_theta binom(p, s) = M_(j \, theta) binom(p, s) \, #h(2em) M_(j \, theta) = mat(delim: "(", 0, theta; Q_(j \, theta) dot.op, T_(j \, theta)) . $

Here $Q_(j \, theta) dot.op$ is the covector $p mapsto Q_(j \, theta) dot.op p$. The lower coefficients are smooth in $x$ and linear in $theta$; Lemma 10 gives their formulas. The upper equation $D_theta p = theta s$ is the same for both media.

Transport comparison followed by holomorphic variation of the complex direction has a close precedent in Cekić’s work on connection Laplacians #cite(label("Cekic2025")), whose parameter argument follows Eskin’s analysis of Yang–Mills potentials #cite(label("Eskin2001")). Cekić treats full connection-system boundary data on a trivial vector bundle. The comparison needed here must be obtained from physical elasticity data on the constrained fibers $cal(E)_theta$.

On a cylinder given by a planar disk times a transverse interval, let $Y_1 : bb(C)^3 arrow.r cal(E)_theta$ be the matrix of normalized columns of one local frame realized in the first medium. Transfer its exact physical solutions to the second medium. The two augmented operators have the same principal part, so the forcing for the difference of the physical pairs has only first order. The derivative bound and the supported Carleman estimate make the transferred leading pairs bounded in $L^2$. Weak limits supply a matrix $Y_2 : bb(C)^3 arrow.r cal(E)_theta$ of three second-medium transport columns. The two normalizations agree in the exterior because the coefficients do, so $Y_2 = Y_1$ there. The local comparison $G = Y_2 Y_1^(- 1)$ is therefore an endomorphism of $cal(E)_theta$ equal to the identity on the part of that cylinder outside $overline(Omega)$. Only the original columns $Y_1$ need to form an invertible frame.

The initial comparison is obtained in a weak sense on transverse cylinders. Section 5 proves uniqueness for supported planar transport equations and an estimate on fixed supported Sobolev spaces. These results assemble the local comparisons into a unique smooth field $G \( x \, \[ theta \] \) in "End" \( cal(E)_theta \)$ on $bb(R)^3 times cal(C)$, where $cal(C) = { \[ theta \] in bb(C) upright(P)^2 : theta dot.op theta = 0 }$ is the projective null conic. For a fixed ball $cal(B) subset bb(R)^3$ independent of $\[ theta \]$, it satisfies

$ D_theta G = M_(2 \, theta) G - G M_(1 \, theta) \, #h(2em) G \( x \, \[ theta \] \) = upright("Id") quad \( x in.not cal(B) \) . $

Differentiating this equation in a conjugate conic coordinate while holding $x$ fixed gives a supported homogeneous transport equation. Its uniqueness makes $G \( x \, dot.op \)$ holomorphic.

Finally, the planes $H_theta$ form a holomorphic bundle $H$ on $cal(C)$. It has no nonzero global holomorphic sections, while its quotient by the null line subbundle with fiber $bb(C) theta$ is trivial. These facts and the universal upper transport equation force the displacement block of $G$ to be scalar. The remaining upper block equation uses $dim H_theta = 2$ to make that scalar constant in $x$ and remove the remaining off-diagonal block; the exterior value then gives $G = upright("Id")$. Equality of the transports first determines $\( lambda + mu \) \/ \( lambda + 2 mu \)$. The remaining equations for $eta = log mu_1 - log mu_2$ have the form $nabla^2 eta = B \( x \) nabla eta + q \( x \) I$, where $B \( x \) : bb(R)^3 arrow.r bb(R)^(3 times 3)$ and the scalar $q \( x \)$ are smooth. One differentiation closes a homogeneous first-order system for $\( nabla eta \, q \)$, whose zero exterior values propagate by uniqueness for ordinary differential equations along paths. Section 6 gives this rigidity and recovers both coefficients.

== 2 Boundary reduction and physical transfer <sec:boundary-reduction>

Throughout the proof, the two coefficient pairs satisfy the hypotheses of Theorem 1 and have equal displacement-to-traction maps.

#thm([Lemma 2.1.])[
  (Common exterior extension).  #emph[The two pairs admit real smooth extensions to $bb(R)^3$ that satisfy (1.1) everywhere, coincide on $bb(R)^3 \\ Omega$, and equal a common constant admissible pair outside a ball.]
] <lem:common-extension>

#proof[
  By Theorem 1.2 of Tan and Liu #cite(label("TanLiu2023")), equality of the elastic Dirichlet-to-Neumann maps determines all boundary partial derivatives of both Lamé moduli. Our inequalities imply $lambda + mu > mu \/ 3 > 0$, so their positivity condition holds. Their definition of the boundary operator is $lambda \( "div" u \) n + mu \( nabla u + \( nabla u \)^T \) n$, so its Euclidean specialization agrees with (1.3). Consequently the two pairs have identical jets at every point of $partial Omega$. Lin and Nakamura also give local boundary reconstruction, with curved boundaries discussed in Section 4 of #cite(label("LinNakamura2017")).
  Smoothly extend the first pair to a neighborhood of $overline(Omega)$. By compactness and strict positivity, shrink the neighborhood so that (1.1) still holds there. Choose a smooth cutoff equal to one on a smaller neighborhood of $overline(Omega)$ and supported in the first neighborhood. Interpolate with any constant pair satisfying (1.1). The admissible set in the $\( lambda \, mu \)$ plane is convex, so this produces a smooth admissible global extension of the first pair, constant outside a compact set.
  For the second pair use its prescribed values in $Omega$ and the first extension on the complement. Equality of all jets makes this piecewise definition smooth across each boundary component. Positivity holds on both sides and on the boundary. This proves the assertion, including when the complement of $Omega$ has bounded components. ◻
]

Fix these extensions and retain the notation $lambda_j \, mu_j$ and $L_j = L_(lambda_j \, mu_j)$ for them. Choose $r > 0$ so that $overline(Omega) subset B_r$ and the extensions are constant outside $B_r$. Here $B_R$ is the open ball of radius $R$ centered at the origin.

#thm([Proposition 2.2.])[
  (Transfer of physical solutions).  #emph[Let $B$ be a ball containing $overline(B)_r$. Every smooth solution $u_1$ of $L_1 u_1 = 0$ on $B$ has a smooth counterpart $u_2$ satisfying $L_2 u_2 = 0$ on $B$ and 
$ u_2 = u_1 quad upright("on ") B \\ overline(Omega) . $

 In particular, $u_2 - u_1$ and $"div" u_2 - "div" u_1$ are smooth and supported in $overline(Omega)$.]
] <prop:physical-transfer>

#proof[
  Solve the second Dirichlet problem in $Omega$ with trace $u_1 \|_(partial Omega)$, and use $u_1$ outside $overline(Omega)$. Matching traces give an $H_(upright("loc"))^1 \( B \)$ field $u_2$. The restrictions of the two interior solutions have identical boundary tractions because their Dirichlet values and boundary maps agree. For a smooth test vector compactly supported in $B$, the weak boundary term contributed by the interior therefore agrees with that for $u_1$. The coefficients and displacements coincide on the exterior, where the same test contributes the opposite interface term. Hence the glued field satisfies $L_2 u_2 = 0$ weakly on $B$.
  The extended operator is smooth and strongly elliptic. Interior elliptic regularity, applied also across $partial Omega$, gives $u_2 in C^oo \( B \; bb(C)^3 \)$. The difference is zero off $overline(Omega)$, as are all its derivatives there. Its support and the support of its divergence are thus contained in $overline(Omega) subset.double B_r$. ◻
]

== 3 An augmented system and analytic estimates <sec:analytic-estimates>

This section constructs a scalar-Laplacian augmented operator and a supported estimate that will control differences of transferred physical displacement–divergence pairs. Adjoining the displacement divergence to obtain a system with Laplacian principal part goes back to Weck #cite(label("Weck1969")); see the account of Imanuvilov and Yamamoto #cite(label("ImanuvilovYamamoto2004Carleman")) Section 1. The identities below give the formulation used in this proof. We first work with one of the smoothly extended coefficient pairs from Lemma 2, and suppress its subscript. Set

$ m = mu \, #h(2em) k = lambda + mu \, #h(2em) ell = lambda + 2 mu = k + m . $

The energy assumptions imply $m > 0$, $k > m \/ 3$, and $ell > 4 m \/ 3$. For an independent vector–scalar pair $U = \( u \, d \)$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ R \( u \, d \)_i & = m Delta u_i + k partial_i d + sum_(j = 1)^3 \( partial_j m \) \( partial_j u_i + partial_i u_j \) + \( partial_i lambda \) d \,\
S \( u \, d \) & = ell Delta d + 2 nabla k dot.op nabla d + 2 nabla m dot.op Delta u + 2 sum_(i \, j = 1)^3 \( partial_i partial_j m \) partial_i u_j + \( Delta lambda \) d \,\
P & = m Delta + nabla m dot.op nabla . $ <eq:augmented-operators>]

The scalar $d$ will equal $"div" u$ for physical solutions, but keeping it independent gives the compatibility identity needed below.

#thm([Lemma 3.1.])[
  #emph[For every smooth pair $\( u \, d \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ L u = R \( u \, "div" u \) \, #h(2em) "div" R \( u \, d \) - S \( u \, d \) = P \( "div" u - d \) . $ <eq:augmented-identity>]

 In particular, $L u = 0$ implies $R \( u \, "div" u \) = S \( u \, "div" u \) = 0$. The normalized augmented operator 
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(L) U = (m^(- 1) R \( u \, d \) \, thin ell^(- 1) #scale(x: 120%, y: 120%)[\(] S \( u \, d \) - 2 m^(- 1) nabla m dot.op R \( u \, d \) #scale(x: 120%, y: 120%)[\)]) $ <eq:normalized-augmented>]

 has the form 
#[#set math.equation(numbering: n => "(3.4)")
 $ cal(L) = Delta upright("Id")_4 + sum_(j = 1)^3 A_j \( x \) partial_j + A_0 \( x \) $ <eq:laplace-principal-form>]

 with smooth matrix coefficients. Consequently, the difference of the normalized augmented operators for the two coefficient pairs has order at most one and coefficients supported in $overline(Omega)$.]
] <lem:augmented-system>

#proof[
  The first identity is the coordinate expansion of $"div" sigma \( u \)$. To verify the second independently of the constraint, write $v = "div" u$. Differentiating (3.1) gives
  $ "div" R \( u \, d \) =  & m Delta v + nabla m dot.op nabla v + k Delta d + \( nabla k + nabla lambda \) dot.op nabla d\
 & + 2 nabla m dot.op Delta u + 2 sum_(i \, j = 1)^3 \( partial_i partial_j m \) partial_i u_j + \( Delta lambda \) d . $
  Subtracting $S$ and using $k = lambda + m$ gives $m Delta \( v - d \) + nabla m dot.op nabla \( v - d \)$.
  For the principal part in (3.3), the only second derivatives of $u$ in its scalar numerator cancel. More explicitly, if
  $ C_m \( u \)_i = sum_(j = 1)^3 \( partial_j m \) \( partial_j u_i + partial_i u_j \) \, $
  then this numerator is
  $ S - 2 m^(- 1) nabla m dot.op R =  & ell Delta d + \( 2 nabla k - 2 k m^(- 1) nabla m \) dot.op nabla d\
 & + 2 sum_(i \, j = 1)^3 \( partial_i partial_j m \) partial_i u_j - 2 m^(- 1) nabla m dot.op C_m \( u \)\
 & + #scale(x: 120%, y: 120%)[\(] Delta lambda - 2 m^(- 1) nabla m dot.op nabla lambda #scale(x: 120%, y: 120%)[\)] d . $
  This proves (3.4). The support assertion follows from equality of the extended coefficients off $overline(Omega)$. ◻
]

The order-one difference of the two augmented operators is the forcing term to be estimated after physical transfer in Section 5.

Fix a nonzero $theta in bb(C)^3$ with $theta dot.op theta = 0$, and write

#[#set math.equation(numbering: n => "(3.5)")
 $ D_theta = theta dot.op nabla \, #h(2em) E_tau \( x \) = e^(tau theta dot.op x) \, #h(2em) h = tau^(- 1) . $ <eq:phase-notation>]

For $s in bb(R)$, the semiclassical Sobolev norm on $bb(R)^3$ is

$ ∥v∥_(H_h^s)^2 = integral_(bb(R)^3) \( 1 + h^2 lr(|xi|)^2 \)^s lr(|hat(v) \( xi \)|)^2 thin upright(d) xi . $

For vectors, we sum the component norms. These norms and all Hilbert space adjoints below use the Hermitian structure, whereas products such as $theta dot.op theta$ remain complex bilinear. Constants in the following estimates may depend on the coefficients, the fixed ball, and $theta$, but not on sufficiently large $tau$.

#thm([Proposition 3.2.])[
  (Supported Carleman estimate).  #emph[Let $B$ be a bounded ball. For $U in C_c^oo \( B \; bb(C)^4 \)$ and all sufficiently small $h > 0$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ ∥E_tau^(- 1) U∥_(H_h^1) lt.eq C h ∥E_tau^(- 1) cal(L) U∥_(H_h^(- 1)) . $ <eq:augmented-carleman>]

]
] <prop:carleman>

#proof[
  Put $phi \( x \) = - "Re" \( theta dot.op x \)$. A nonzero complex null vector has nonzero real part, so $phi$ is a nonconstant linear limiting Carleman weight for the Laplacian. For $phi_epsilon = phi + h phi^2 \/ \( 2 epsilon \)$, #cite(label("SaloTzou2009")) Lemma 2.1, with Sobolev index $s = - 1$, gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ h / sqrt(epsilon) ∥v∥_(H_h^1) lt.eq C ∥e^(phi_epsilon \/ h) h^2 Delta e^(- phi_epsilon \/ h) v∥_(H_h^(- 1)) \, #h(2em) v in C_c^oo \( B \) \, $ <eq:convexified-carleman>]
  for $h lt.double epsilon lt.double 1$, with $C$ independent of sufficiently small $epsilon$. Its statement has a gain of two derivatives and permits every real $s$. The sign of the Laplacian is immaterial here.
  Apply (3.7) componentwise. A first-order term in (3.4) contributes
  $ e^(phi_epsilon \/ h) h^2 A_j partial_j e^(- phi_epsilon \/ h) v = h A_j \( h partial_j v \) - h A_j \( partial_j phi_epsilon \) v . $
  Its $H_h^(- 1)$ norm is bounded by $C_1 h ∥v∥_(H_h^1)$, uniformly when $h \/ epsilon$ is small. The zeroth-order terms have the same bound. Choose $epsilon > 0$ so small that these terms are absorbed by the left side of (3.7), and then choose $h$ sufficiently small relative to this fixed $epsilon$. We obtain
  $ ∥e^(phi_epsilon \/ h) U∥_(H_h^1) lt.eq C_epsilon h ∥e^(phi_epsilon \/ h) cal(L) U∥_(H_h^(- 1)) . $
  The factor $e^(phi^2 \/ \( 2 epsilon \))$ is now fixed. It and its inverse, smoothly localized around $overline(B)$, are bounded multipliers on $H_h^1$, uniformly for $0 < h lt.eq 1$, by the product rule. They are bounded on $H_h^(- 1)$ by duality. Removing this factor gives the same estimate with $phi$ in place of $phi_epsilon$. The multiplier constants may depend on $epsilon$; no subsequent absorption involves them.
  Finally, write $beta = "Im" theta$. Multiplication by $e^(- i beta dot.op x \/ h)$ shifts the semiclassical frequency $h xi$ by the fixed vector $- beta$. The weights $1 + lr(|h xi|)^2$ and $1 + lr(|h xi - beta|)^2$ are comparable, so this multiplier and its inverse are uniformly bounded on $H_h^(plus.minus 1)$. Since $E_tau^(- 1) = e^(phi \/ h) e^(- i beta dot.op x \/ h)$, this proves (3.6). ◻
]

#thm([Corollary 3.3.])[
  #emph[For the same $B$ and $theta$, and all sufficiently large $tau$, every $w in C_c^oo \( B \; bb(C)^3 \)$ satisfies 
#[#set math.equation(numbering: n => "(3.8)")
 $ ∥E_tau^(- 1) w∥_(L^2 \( B \)) lt.eq C ∥E_tau^(- 1) L w∥_(L^2 \( B \)) . $ <eq:physical-test-estimate>]

 Moreover, for every $f in L^2 \( B \; bb(C)^3 \)$ there exists $z in L^2 \( B \; bb(C)^3 \)$ satisfying, distributionally, 
#[#set math.equation(numbering: n => "(3.9)")
 $ E_tau^(- 1) L \( E_tau z \) = f quad upright("in ") B \, #h(2em) ∥z∥_(L^2 \( B \)) lt.eq C ∥f∥_(L^2 \( B \)) . $ <eq:physical-solvability>]

]
] <cor:physical-solvability>

#proof[
  Apply Proposition 5 to $\( w \, "div" w \)$. By (3.2), its augmented forcing is formed from $L w$ and $"div" \( L w \)$. If $F = E_tau^(- 1) L w$, then
  $ E_tau^(- 1) "div" \( L w \) = "div" F + tau theta dot.op F . $
  The Fourier definition of the norms gives $∥partial_j F∥_(H_h^(- 1)) lt.eq h^(- 1) ∥F∥_(L^2)$. Smooth coefficient multipliers, localized near $overline(B)$, are uniformly bounded on $H_h^(- 1)$. Hence
  $ ∥E_tau^(- 1) cal(L) \( w \, "div" w \)∥_(H_h^(- 1)) lt.eq C h^(- 1) ∥F∥_(L^2) . $
  Taking the displacement component on the left side of (3.6) proves (3.8).
  Let $A_theta = E_tau^(- 1) L E_tau$ on test functions in $B$. Substituting $w = E_tau v$ in (3.8) gives $∥v∥_(L^2) lt.eq C ∥A_theta v∥_(L^2)$. Formal self-adjointness of $L$ gives
  $ A_theta^(*) = e^(tau overline(theta) dot.op x) L e^(- tau overline(theta) dot.op x) = A_(- overline(theta)) . $
  The same estimate for the null direction $- overline(theta)$ thus holds for $A_theta^(*)$. Use the $L^2$ inner product linear in its first argument. The functional
  $ A_theta^(*) v mapsto \( v \, f \)_(L^2 \( B \)) \, #h(2em) v in C_c^oo \( B \; bb(C)^3 \) \, $
  is well-defined and has norm at most $C ∥f∥_(L^2)$. Extend it by the Hahn–Banach Theorem and represent it as $\( thin dot.op thin \, z \)_(L^2)$. Then $\( A_theta^(*) v \, z \) = \( v \, f \)$ for every test function $v$, which is the distributional equation in (3.9). The norm of the representing vector gives the asserted bound. ◻
]

#thm([Lemma 3.4.])[
  (Scaled interior estimate).  #emph[Let $B' subset.double B$. There exists $h_(B') > 0$ such that, whenever $0 < h = tau^(- 1) < h_(B')$ and $z \, f in L^2 \( B \; bb(C)^3 \)$ satisfy $E_tau^(- 1) L \( E_tau z \) = f$ distributionally in $B$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ sum_(j = 0)^2 h^j ∥nabla^j z∥_(L^2 \( B' \)) lt.eq C_(B') #scale(x: 120%, y: 120%)[\(] ∥z∥_(L^2 \( B \)) + h^2 ∥f∥_(L^2 \( B \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:scaled-interior>]

 If $f$ is smooth, then $z$ is smooth in $B$ for each fixed $tau$.]
] <lem:scaled-interior>

#proof[
  The positive principal coefficient form of $L$ is
  $ m lr(|xi|)^2 lr(|v|)^2 + k lr(|xi dot.op v|)^2 \, #h(2em) xi in bb(R)^3 \, quad v in bb(C)^3 . $
  Thus its ellipticity is uniform on $overline(B)$. Conjugation leaves the principal part unchanged and introduces coefficients of size $O \( h^(- 1) \)$ and $O \( h^(- 2) \)$ in orders one and zero. On a ball $B \( x_0 \, 2 h \) subset B$, set $x = x_0 + h y$ and multiply the equation by $h^2$. The resulting operator on the fixed ball $B \( 0 \, 2 \)$ has a uniformly strongly elliptic principal part, while its coefficients and their derivatives in $y$ are uniformly bounded. As $\( x_0 \, h \)$ ranges over $overline(B)' times \[ 0 \, h_0 \]$, these operators form a compact smooth coefficient family with a common ellipticity bound. The local parametrix estimate persists under a small coefficient perturbation, so a finite cover gives a uniform constant. Interior $H^2$ regularity for distributional $L^2$ solutions of smooth elliptic systems is given by #cite(label("Dyatlov2026")) Theorem 15.1 and Remark 15.2. The same parametrix argument with matrix symbols gives the localized estimate for systems corresponding to the scalar Proposition 15.6 of that source. With the uniform constants just obtained, it yields
  $ sum_(j = 0)^2 h^j ∥nabla^j z∥_(L^2 \( B \( x_0 \, h \) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] ∥z∥_(L^2 \( B \( x_0 \, 2 h \) \)) + h^2 ∥f∥_(L^2 \( B \( x_0 \, 2 h \) \)) #scale(x: 120%, y: 120%)[\)] . $
  For small $h$, cover $B'$ by such inner balls with uniformly bounded overlap of the doubled balls. Squaring and summing proves (3.10). Iterated interior elliptic regularity, with $tau$ fixed, proves the final assertion. ◻
]

== 4 Physical solutions realizing local transport frames <sec:physical-amplitudes>

We now construct exact elasticity solutions with controlled leading behavior for both the displacement and its actual divergence. We begin by identifying the equations obeyed by these leading terms. Fix the null vector $theta$ from (3.5), and write $D = D_theta$ when convenient. Since $theta dot.op theta = 0$, conjugating the operators in (3.1) gives

$ E_tau^(- 1) R \( E_tau a \, E_tau b \) = R \( a \, b \) + tau R^theta \( a \, b \) \, #h(2em) E_tau^(- 1) S \( E_tau a \, E_tau b \) = S \( a \, b \) + tau S^theta \( a \, b \) \, $

where

#[#set math.equation(numbering: n => "(4.1)")
 $ R^theta \( a \, b \) & = 2 m D a + \( D m \) a + theta \( k b + nabla m dot.op a \) \,\
S^theta \( a \, b \) & = 2 ell D b + 2 \( D k \) b + 4 nabla m dot.op D a + 2 \( D nabla m \) dot.op a . $ <eq:leading-operators>]

For smooth vector amplitudes $a_0 \, a_1$, the first two terms of a trial displacement give

$ E_tau^(- 1) "div" #scale(x: 120%, y: 120%)[\(] E_tau \( a_0 + tau^(- 1) a_1 \) #scale(x: 120%, y: 120%)[\)] = tau theta dot.op a_0 + #scale(x: 120%, y: 120%)[\(] "div" a_0 + theta dot.op a_1 #scale(x: 120%, y: 120%)[\)] + tau^(- 1) "div" a_1 . $

An $O \( 1 \)$ leading divergence therefore requires $theta dot.op a_0 = 0$, while its scalar term also contains $theta dot.op a_1$ and need not equal $"div" a_0$. We retain that scalar as the component $b$ of the leading pair. Define the fixed complex vector spaces

#[#set math.equation(numbering: n => "(4.2)")
 $ H_theta = { a in bb(C)^3 : theta dot.op a = 0 } \, #h(2em) cal(E)_theta = H_theta xor bb(C) . $ <eq:constrained-fibers>]

The transport equation on $cal(E)_theta$ is

#[#set math.equation(numbering: n => "(4.3)")
 $ R^theta \( a \, b \) = 0 \, #h(2em) S^theta \( a \, b \) = 0 \, #h(2em) \( a \, b \) in cal(E)_theta . $ <eq:constrained-transport>]

Indeed, putting $P^theta = 2 m D + \( D m \)$, we have

#[#set math.equation(numbering: n => "(4.4)")
 $ theta dot.op R^theta \( a \, b \) = P^theta \( theta dot.op a \) . $ <eq:normal-transport-component>]

Thus $R^theta$ takes values in $H_theta$ when $a$ does. On $cal(E)_theta$, the coefficient multiplying $D \( a \, b \)$ in the two transport equations is

$ mat(delim: "(", 2 m upright("Id")_(H_theta), 0; 4 nabla m dot.op, 2 ell) . $

It is invertible, so (4.3) is a square rank-three system with principal part $D$.

For clarity, write $theta = alpha + i beta$ with $alpha \, beta in bb(R)^3$. The null condition says $lr(|alpha|) = lr(|beta|) = rho > 0$ and $alpha dot.op beta = 0$. Let $\( y_1 \, y_2 \, t \)$ be positively oriented orthonormal coordinates in the directions $alpha \/ rho$, $beta \/ rho$, and their cross product. Then, for $z = y_1 + i y_2$,

$ D = rho \( partial_(y_1) + i partial_(y_2) \) = 2 rho partial_(overline(z)) . $

We denote the planar disk ${ y in bb(R)^2 : lr(||) y < R }$ by $D_R^2$.

For each chosen transverse coordinate $t_0$, we will select a smooth frame of (4.3) for $t$ near $t_0$ and then realize its three columns by physical solutions. Earlier systems complex geometric optics constructions also use invertible planar transport frames #cite(label("EskinRalston2004")) Section 1. The next lemma records the local parameter dependence and inhomogeneous solvability with transverse support needed here.

#thm([Lemma 4.1.])[
  (Planar frames and inhomogeneous transports).  #emph[Let $I subset bb(R)$ be an open interval and let $A in C^oo \( D_R^2 times I \; bb(C)^(n times n) \)$. For each fixed $t in I$, the equation 
#[#set math.equation(numbering: n => "(4.5)")
 $ partial_(overline(z)) V = A \( z \, t \) V $ <eq:planar-frame-equation>]

 has a smooth invertible matrix solution on $D_R^2$. For every $R' < R$ and $t_0 in I$, there are an interval $I_0 subset.double I$ containing $t_0$ and a smooth invertible solution $V$ on $D_(R')^2 times I_0$.]
  #emph[Given this $V$, a radius $R'' < R'$, and $F in C^oo \( D_(R')^2 times I_0 \; bb(C)^n \)$, the equation 
#[#set math.equation(numbering: n => "(4.6)")
 $ partial_(overline(z)) v = A v + F $ <eq:planar-inhomogeneous>]

 has a smooth solution on $D_(R'')^2 times I_0$. If $F \( thin dot.op thin \, t \) = 0$ for $t in.not K$, where $K subset.double I_0$ is compact, the solution can be chosen with the same transverse support property. These assertions also hold with $D$ in place of $partial_(overline(z))$, and for systems obtained by multiplying $D$ by an invertible smooth matrix.]
] <lem:planar-frames>

#proof[
  We first construct frames locally at a fixed parameter. For a bounded function $f$ supported in a disk of radius $delta$, the Cauchy transform
  $ \( cal(T) f \) \( z \) = 1 / pi integral_(bb(C)) frac(f \( w \), z - w) thin upright(d) y_1 \( w \) thin upright(d) y_2 \( w \) $
  satisfies $partial_(overline(z)) cal(T) f = f$ in distributions and $∥cal(T) f∥_(L^oo) lt.eq C delta ∥∥ f_(L^oo)$. The latter estimate follows by integrating $lr(|z - w|)^(- 1)$ over the support disk. Choose a smooth cutoff $chi$ supported in a sufficiently small disk and equal to one on a smaller disk. On bounded matrix functions, the equation
  $ V = upright("Id")_n + cal(T) \( chi A V \) $
  is then solved by a convergent Neumann series. Shrinking the disk until the operator norm is less than $1 \/ 3$ gives $∥V - upright("Id")_n∥_(L^oo) < 1 \/ 2$, hence invertibility. The distributional equation and interior elliptic regularity for $partial_(overline(z))$ show that $V$ is smooth on the smaller disk. This proves local smooth invertible solvability.
  If $V_i \, V_j$ are two such local frames, then $partial_(overline(z)) \( V_i^(- 1) V_j \) = 0$ on their overlap. Their transition functions therefore define a holomorphic vector bundle on $D_R^2$, whose underlying smooth bundle is trivial. Its holomorphic frame bundle has fiber $upright("GL")_n \( bb(C) \)$. The disk is Stein and contractible, so a continuous section of this frame bundle exists. The Oka principle for sections of holomorphic fiber bundles with complex homogeneous fibers, in the form of #cite(label("Forstneric2009")) Theorem 1.1, p. 1018, supplies a holomorphic section; this homogeneous-fiber case goes back to Grauert #cite(label("Grauert1958")). In the original smooth trivialization it is a smooth invertible matrix solving (4.5) throughout $D_R^2$.
  To obtain local parameter dependence, choose such a frame $V_0 \( z \)$ at $t_0$. After writing $V = V_0 W$, the equation becomes
  $ partial_(overline(z)) W = B \( z \, t \) W \, #h(2em) B \( z \, t \) = V_0 \( z \)^(- 1) #scale(x: 120%, y: 120%)[\(] A \( z \, t \) - A \( z \, t_0 \) #scale(x: 120%, y: 120%)[\)] V_0 \( z \) . $
  Choose a cutoff $chi in C_c^oo \( D_R^2 \)$ equal to one near $overline(D)_(R')^2$. On its compact support, $B \( thin dot.op thin \, t \)$ tends uniformly to zero as $t arrow.r t_0$. On a sufficiently small interval $I_0 subset.double I$, solve
  $ W = upright("Id")_n + cal(T) \( chi B \( thin dot.op thin \, t \) W \) $
  by a Neumann series with norm less than $1 \/ 3$. This gives an invertible solution on $D_(R')^2 times I_0$. The integral operator depends smoothly on $t$ in operator norm on $L^oo$; its inverse does also. Hence all parameter derivatives of $W$ exist in $L^oo$. Differentiating its equation and applying interior elliptic regularity successively gives smoothness jointly in $\( z \, t \)$, with bounds on compact subsets. Thus $V = V_0 W$ has the claimed parameter regularity.
  Finally, choose $chi in C_c^oo \( D_(R')^2 \)$ equal to one near $overline(D)_(R'')^2$. The formula
  $ v = V cal(T) \( chi V^(- 1) F \) $
  solves (4.6) on the smaller disk. The transform acts only in the planar variable, so it preserves the specified support in $t$. Dividing a system with invertible derivative coefficient by that coefficient, and using $D = 2 rho partial_(overline(z))$, proves the final assertion. ◻
]

To carry a leading frame through physical transfer, we need control of both the displacement–divergence pair and its derivatives. Corollary 6 gives physical solvability with an $L^2$ estimate independent of $tau$. We will make the correction small enough after taking a divergence by first constructing a compatible expansion of truncation order $N gt.eq 4$. The proof below obtains a physical residual of size $O \( tau^(1 - N) \)$ and a conjugated divergence correction of size $O \( tau^(2 - N) \)$. The resulting strong convergence identifies the first medium’s leading columns and, by exterior agreement, the exterior values of the transferred columns. The weighted $O \( tau \)$ derivative bound controls the first-order forcing obtained by applying the difference of the two normalized augmented operators to the first physical pair.

#thm([Proposition 4.2.])[
  (Physical realization of local transport frames).  #emph[For every nonzero null vector $theta$ and every $t_0 in \( - 2 r \, 2 r \)$, there exist an open interval $J subset \( - 2 r \, 2 r \)$ containing $t_0$ and three smooth solutions $\( a_0^nu \, b_0^nu \)$, $1 lt.eq nu lt.eq 3$, of (4.3) on a neighborhood of $overline(B)_(5 r)$, with the following properties.]
  #emph[The three columns form a frame of $cal(E)_theta$ at every point of $D_(2 r)^2 times J$. For each $nu$ and all sufficiently large $tau$, there is $u_tau^nu in C^oo \( B_(5 r) \; bb(C)^3 \)$ with $L u_tau^nu = 0$ such that, on putting $U_tau^nu = \( u_tau^nu \, "div" u_tau^nu \)$, 
#[#set math.equation(numbering: n => "(4.7)")
 $ E_tau^(- 1) U_tau^nu & arrow.r \( a_0^nu \, b_0^nu \) &  & upright("in ") L^2 \( B_(4 r) \) \,\
∥E_tau^(- 1) nabla U_tau^nu∥_(L^2 \( B_(4 r) \)) & = O \( tau \) . $ <eq:physical-leading-limit>]

]
] <prop:physical-amplitudes>

#proof[
  We construct compatible formal amplitudes and then correct the truncated displacement using the physical operator. Fix an integer $N gt.eq 4$ and radii $R_0 > R_1 > dots.h.c > R_N > 5 r$. The coefficients are smooth on all of $bb(R)^3$. Apply Lemma 8 to the rank-three system (4.3), starting on a disk strictly larger than $D_(R_0)^2$. It supplies a smooth invertible frame
  $ cal(F) \( y \, t \) : bb(C)^3 arrow.r cal(E)_theta quad upright("on ") D_(R_0)^2 times I_0 \, $
  where $I_0 subset.double \( - 2 r \, 2 r \)$ contains $t_0$. Choose an interval $J$ containing $t_0$ with $overline(J) subset I_0$, and choose $chi in C_c^oo \( I_0 \)$ equal to one on $J$. Multiply each column of $cal(F)$ by $chi \( t \)$ and extend it by zero in $t$ to obtain $\( a_0^nu \, b_0^nu \)$ on $D_(R_0)^2 times bb(R)$. Since $D chi = 0$, these columns still solve (4.3). They are a frame on $D_(2 r)^2 times J$, and all have transverse support in the fixed compact set $K = "supp" chi subset.double I_0$.
  We construct a physical solution for any one of these columns and suppress $nu$. Higher-order transport expansions for systems appear in Eskin and Ralston #cite(label("EskinRalston2004")) Section 2, equations (2.2)–(2.4). The recursion here must cancel the vector residual while making the conjugated actual divergence have leading term $b_0$. Its scalar equation makes the next normal constraint compatible with the vector equation; the final correction will be made only in the physical displacement equation. For $1 lt.eq j lt.eq N$, we seek smooth coefficients $\( a_j \, b_j \)$ on successively smaller disks such that
  #[#set math.equation(numbering: n => "(4.8)")
   $ R^theta \( a_j \, b_j \) & = - R \( a_(j - 1) \, b_(j - 1) \) \,\
S^theta \( a_j \, b_j \) & = - S \( a_(j - 1) \, b_(j - 1) \) \,\
theta dot.op a_j & = - \( "div" a_(j - 1) - b_(j - 1) \) . $ <eq:physical-recursion>]
  Throughout this recursion, write $q_j = "div" a_j - b_j$ and set $a_(- 1) = b_(- 1) = q_(- 1) = 0$. The last equation in (4.8) is the displacement–divergence constraint at order $j$.
  We first verify the compatibility of these three equations. Conjugating $P$ gives $E_tau^(- 1) P E_tau = P + tau P^theta$. Comparing coefficients of $tau$ in the conjugated identity (3.2) yields, for arbitrary $\( a \, b \)$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ "div" R^theta \( a \, b \) + theta dot.op R \( a \, b \) - S^theta \( a \, b \) = P \( theta dot.op a \) + P^theta \( "div" a - b \) . $ <eq:transport-compatibility>]
  Suppose the preceding recursive equations have been solved. Apply (4.9) to $\( a_(j - 1) \, b_(j - 1) \)$. For $j gt.eq 2$, the preceding vector and scalar equations, followed by (3.2), give
  $ "div" R^theta \( a_(j - 1) \, b_(j - 1) \) - S^theta \( a_(j - 1) \, b_(j - 1) \) & = - "div" R \( a_(j - 2) \, b_(j - 2) \) + S \( a_(j - 2) \, b_(j - 2) \)\
 & = - P q_(j - 2) . $
  The preceding normal constraint gives the same term on the other side:
  $ P \( theta dot.op a_(j - 1) \) = - P q_(j - 2) . $
  For $j = 1$, both expressions are zero by the homogeneous leading equations and $q_(- 1) = 0$. In every case these two terms cancel in (4.9), leaving
  #[#set math.equation(numbering: n => "(4.10)")
   $ theta dot.op R \( a_(j - 1) \, b_(j - 1) \) = P^theta q_(j - 1) . $ <eq:recursion-normal-compatibility>]
  Choose a constant vector $n_theta in bb(C)^3$ with $theta dot.op n_theta = 1$, and set $a_j^(upright(p)) = - q_(j - 1) n_theta$, $b_j^(upright(p)) = 0$. After subtracting this particular pair from the desired $\( a_j \, b_j \)$, the unknown takes values in $cal(E)_theta$. Equations (4.4) and (4.10) show that the residual vector source belongs to $H_theta$. Its scalar source is unrestricted. We are therefore left with an inhomogeneous square system on $cal(E)_theta$ with invertible derivative coefficient. Use the uncut frame $cal(F)$ and the inhomogeneous part of Lemma 8 to solve it on $D_(R_j)^2 times I_0$. All source terms, including the particular pair and its derivatives, have transverse support in $K$; the constructed solution retains that support and extends smoothly by zero in $t$. This proves the induction. After finitely many steps, every coefficient is smooth on $D_(R_N)^2 times bb(R)$, hence on a neighborhood of $overline(B)_(5 r)$.
  Set
  $ a^(\[ N \]) = sum_(j = 0)^N tau^(- j) a_j \, #h(2em) b^(\[ N \]) = sum_(j = 0)^N tau^(- j) b_j . $
  The first equation of (4.8) telescopes to
  #[#set math.equation(numbering: n => "(4.11)")
   $ E_tau^(- 1) R \( E_tau a^(\[ N \]) \, E_tau b^(\[ N \]) \) = tau^(- N) R \( a_N \, b_N \) . $ <eq:truncated-vector-residual>]
  The normal constraints telescope separately, giving
  #[#set math.equation(numbering: n => "(4.12)")
   $ E_tau^(- 1) "div" \( E_tau a^(\[ N \]) \) = b^(\[ N \]) + tau^(- N) q_N . $ <eq:truncated-divergence>]
  Using the dependence of $R$ on its scalar argument, these identities give the physical residual explicitly:
  #[#set math.equation(numbering: n => "(4.13)")
   $ f_tau & colon.eq E_tau^(- 1) L \( E_tau a^(\[ N \]) \)\
 & = tau^(- N) #scale(x: 120%, y: 120%)[\[] R \( a_N \, b_N \) + k nabla q_N + \( nabla lambda \) q_N + tau k theta q_N #scale(x: 120%, y: 120%)[\]] . $ <eq:physical-truncated-residual>]
  All coefficients on the right are fixed smooth functions. Consequently $∥f_tau∥_(L^2 \( B_(5 r) \)) = O \( tau^(1 - N) \)$.
  Corollary 6 gives a correction $r_tau in L^2 \( B_(5 r) \; bb(C)^3 \)$ satisfying
  $ E_tau^(- 1) L \( E_tau r_tau \) = - f_tau \, #h(2em) ∥r_tau∥_(L^2 \( B_(5 r) \)) = O \( tau^(1 - N) \) . $
  It is smooth in $B_(5 r)$ by Lemma 7. The same Lemma, on $B_(4 r)$, gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ sum_(j = 0)^2 h^j ∥nabla^j r_tau∥_(L^2 \( B_(4 r) \)) = O \( tau^(1 - N) \) . $ <eq:physical-remainder-two-derivatives>]
  Define its conjugated physical divergence by
  $ d_tau = E_tau^(- 1) "div" \( E_tau r_tau \) = "div" r_tau + tau theta dot.op r_tau . $
  It follows directly from (4.14) that
  #[#set math.equation(numbering: n => "(4.15)")
   $ ∥d_tau∥_(L^2 \( B_(4 r) \)) + h ∥nabla d_tau∥_(L^2 \( B_(4 r) \)) lt.eq C tau sum_(j = 0)^2 h^j ∥nabla^j r_tau∥_(L^2 \( B_(4 r) \)) = O \( tau^(2 - N) \) . $ <eq:physical-divergence-remainder>]
  Now put $u_tau = E_tau \( a^(\[ N \]) + r_tau \)$. It is a smooth exact solution of $L u_tau = 0$ on $B_(5 r)$, and its physical pair satisfies
  $ E_tau^(- 1) \( u_tau \, "div" u_tau \) = #scale(x: 120%, y: 120%)[\(] a^(\[ N \]) + r_tau \, b^(\[ N \]) + tau^(- N) q_N + d_tau #scale(x: 120%, y: 120%)[\)] . $
  The smooth finite expansions and the remainder estimates imply the first assertion of (4.7). They also show that, if the last displayed pair is denoted by $cal(A)_tau$, then
  $ ∥cal(A)_tau∥_(L^2 \( B_(4 r) \)) + h ∥nabla cal(A)_tau∥_(L^2 \( B_(4 r) \)) = O \( 1 \) . $
  Since, for $j = 1 \, 2 \, 3$, $E_tau^(- 1) partial_j \( E_tau cal(A)_tau \) = partial_j cal(A)_tau + tau theta_j cal(A)_tau$, the second assertion of (4.7) follows. Repeating the construction for the three initial columns proves the Proposition. ◻
]

== 5 Matching the leading transports <sec:transport-matching>

Proposition 12 constructs the unique holomorphic comparison of the two leading transports. We first derive a transport normal form and prove a supported estimate for parameter dependence. Throughout this section, a dot between complex vectors denotes the complex bilinear Euclidean product.

#thm([Lemma 5.1.])[
  (Transport normal form).  #emph[For one coefficient pair, set $g = nabla log m$. The change of variables 
#[#set math.equation(numbering: n => "(5.1)")
 $ p = sqrt(m) thin a \, #h(2em) s = - frac(k, 2 sqrt(m)) thin b - 1 / 2 g dot.op p $ <eq:transport-change>]

 is a smooth invertible map of $cal(E)_theta$ to itself. It transforms (4.3) into 
#[#set math.equation(numbering: n => "(5.2)")
 $ D_theta binom(p, s) = M_theta binom(p, s) \, #h(2em) M_theta = mat(delim: "(", 0, theta; Q_theta dot.op, T_theta) quad upright("on ") H_theta xor bb(C) \, $ <eq:transport-matrix>]

 where 
#[#set math.equation(numbering: n => "(5.3)")
 $ T_theta & = D_theta log \( k \/ ell \) \,\
Q_theta & = 1 / 2 [(m / ell D_theta log k - 1 / 2 theta dot.op g) g - m / ell D_theta g] . $ <eq:transport-coefficients>]

 In particular, the bottom-left entry in (5.2) is the covector $p mapsto Q_theta dot.op p$. Both $D_theta$ and $M_theta$ depend linearly and holomorphically on $theta$.]
] <lem:transport-normal-form>

#proof[
  The inverse of (5.1) is
  $ a = m^(- 1 \/ 2) p \, #h(2em) b = - frac(2 sqrt(m), k) (s + 1 / 2 g dot.op p) . $
  It is well defined because $m \, k > 0$, and multiplication by $sqrt(m)$ preserves $H_theta$. Write $D = D_theta$. Substitution into the first equation in (4.1) gives
  $ 0 = 2 sqrt(m) thin D p + theta \( k b + sqrt(m) thin g dot.op p \) \, #h(2em) upright("hence") #h(2em) D p = theta s . $
  Dividing the second equation by two and using $nabla m = m g$ yields
  $ 0 = ell D b + \( D k \) b + 2 nabla m dot.op D a + \( D nabla m \) dot.op a . $
  Here
  $ 2 nabla m dot.op D a & = 2 sqrt(m) thin g dot.op D p - sqrt(m) thin \( D log m \) g dot.op p \,\
\( D nabla m \) dot.op a & = sqrt(m) thin #scale(x: 120%, y: 120%)[\(] \( D log m \) g + D g #scale(x: 120%, y: 120%)[\)] dot.op p . $
  The terms containing $\( D log m \) g dot.op p$ cancel. Thus
  #[#set math.equation(numbering: n => "(5.4)")
   $ ell D b = - \( D k \) b - sqrt(m) #scale(x: 120%, y: 120%)[\(] 2 \( theta dot.op g \) s + \( D g \) dot.op p #scale(x: 120%, y: 120%)[\)] . $ <eq:transformed-divergence-transport>]
  Differentiate the definition of $s$ and substitute (5.4), the expression for $b$, and $D p = theta s$. With $c = m \/ ell$ and $gamma = D log m = theta dot.op g$, the result is
  $ D s = c \( D log k - gamma \) s + 1 / 2 #scale(x: 120%, y: 120%)[\[] \( c D log k - gamma \/ 2 \) g - c D g #scale(x: 120%, y: 120%)[\]] dot.op p . $
  Finally, since $ell = k + m$,
  $ D log \( k \/ ell \) = D log k - frac(D k + D m, ell) = m / ell \( D log k - D log m \) . $
  This proves the formulas. The top row takes values in $H_theta$ because $theta dot.op theta = 0$. All the direction dependence displayed in the formulas is linear. ◻
]

The comparison equation can now be described in terms of the columns that the physical construction must supply. Fix $theta$ and a cylinder $D_(2 r)^2 times J$. Suppose for the moment that $Y_1 : bb(C)^3 arrow.r cal(E)_theta$ is a smooth invertible matrix of normalized transport columns for the first medium, and that $Y_2 : bb(C)^3 arrow.r cal(E)_theta$ has locally $L^2$ columns satisfying the second transport equation in distributions:

$ D_theta Y_j = M_(j \, theta) Y_j \, #h(2em) j = 1 \, 2 . $

The columns in each $Y_j$ are normalized by that medium’s own change of variables (5.1). These changes agree outside $overline(Omega)$, where the extended coefficients agree. Thus exterior agreement of the corresponding physical leading columns gives $Y_2 = Y_1$ there.

Under this exterior agreement, define

$ G = Y_2 Y_1^(- 1) in "End" \( cal(E)_theta \) . $

Only $Y_1$ is required to be invertible. Multiplication by its smooth inverse is legitimate for locally $L^2$ columns, and the product rule in distributions gives

$ D_theta G = M_(2 \, theta) G - G M_(1 \, theta) \, #h(2em) G = upright("Id") quad upright("outside ") overline(Omega) $

on the cylinder. Consequently $W = G - upright("Id")$ is locally $L^2$ and supported in $overline(Omega)$ within that cylinder.

For a transverse coordinate $t$, restrict the coefficients to the corresponding plane and use a basis of $cal(E)_theta$ fixed in $x$. On planar endomorphism-valued unknowns define

#[#set math.equation(numbering: n => "(5.5)")
 $ cal(P)_(theta \, t) W = D_theta W - M_(2 \, theta) W + W M_(1 \, theta) \, #h(2em) f_(theta \, t) = M_(2 \, theta) - M_(1 \, theta) . $ <eq:planar-comparison-operator>]

The supported planar equation required for the comparison is

#[#set math.equation(numbering: n => "(5.6)")
 $ cal(P)_(theta \, t) W = f_(theta \, t) . $ <eq:inhomogeneous-comparison>]

Matrices here may be regarded as vectors of their nine entries. For almost every $t$, the $L^2$ planar restriction of the local $W$ is supported in $overline(D_r^2)$ because $overline(Omega) subset B_r$. The physical transfer and weak-limit argument below will supply the second columns $Y_2$. Slicing their distributional cylinder equation will initially give (5.6) only for almost every $t$. We therefore need both uniqueness for supported planar solutions and a way to pass from this almost-everywhere construction to smooth dependence on every parameter. The next lemma provides these facts on fixed Hilbert spaces, which will also allow the planes to vary.

#thm([Lemma 5.2.])[
  (Supported planar transport).  #emph[Let $cal(U) subset bb(R)^d$ be open, let $n gt.eq 1$, and suppose that 
$ cal(P)_rho = gamma \( rho \) \( partial_(y_1) + i partial_(y_2) \) + A \( y \, rho \) \, #h(2em) rho in cal(U) \, $

 where $gamma$ is smooth and nonzero and $A$ is a smooth complex $n times n$ matrix on a neighborhood of $overline(D_(2 r)^2) times cal(U)$. Then the following statements hold.]
  + #emph[A distributional solution of $cal(P)_rho W = 0$ on $D_(2 r)^2$ whose support is a compact subset of that disk is zero.]
  + #emph[For every integer $j gt.eq 0$ and every $W in H^(j + 1) \( D_(2 r)^2 \; bb(C)^n \)$ supported in $overline(D_r^2)$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ ∥W∥_(H^(j + 1) \( D_(2 r)^2 \)) lt.eq C_j ∥cal(P)_rho W∥_(H^j \( D_(2 r)^2 \)) \, #h(2em) "supp" W subset overline(D_r^2) . $ <eq:supported-transport-estimate>]

 The constants are locally uniform in $rho$.]
  + #emph[Suppose that $f \( y \, rho \)$ is smooth on a neighborhood of $overline(D_(2 r)^2) times cal(U)$. If the equation $cal(P)_rho W = f \( dot.op \, rho \)$ has an $L^2$ solution supported in $overline(D_r^2)$ for a dense set of parameters $rho$, then it has such a solution for every $rho$. These solutions are unique and form a smooth function of $\( y \, rho \)$.]
  #emph[The same conclusions apply to matrix-valued unknowns, after their entries are regarded as a vector.]
] <lem:supported-transport>

#proof[
  For a fixed parameter, $cal(P)_rho$ is elliptic in the two real planar variables: its principal symbol is $gamma \( rho \) \( i xi_1 - xi_2 \)$, which is nonzero for $xi in bb(R)^2 \\ { 0 }$. On each sufficiently small disk, Lemma 8 gives a smooth invertible matrix $F$ satisfying $cal(P)_rho F = 0$. If $cal(P)_rho W = 0$, then
  $ \( partial_(y_1) + i partial_(y_2) \) \( F^(- 1) W \) = 0 $
  in distributions. Its components are therefore holomorphic functions of $y_1 + i y_2$. A homogeneous solution that vanishes on an open set vanishes on every overlapping frame disk by the holomorphic identity theorem. Connectedness propagates this conclusion throughout $D_(2 r)^2$. A compactly supported solution vanishes near the boundary of the disk, proving (i).
  We give the estimate on the fixed supported space. Extending $W$ by zero to $bb(R)^2$ is harmless because its support lies in $overline(D_r^2)$. The Fourier symbol just computed gives
  $ ∥W∥_(H^(j + 1)) lt.eq C #scale(x: 120%, y: 120%)[\(] ∥gamma \( rho \) \( partial_(y_1) + i partial_(y_2) \) W∥_(H^j) + ∥W∥_(L^2) #scale(x: 120%, y: 120%)[\)] . $
  Here and below in this proof the norms can equivalently be taken on $D_(2 r)^2$, since the functions under consideration are supported in the smaller disk. Smooth multiplication and, for $j gt.eq 1$, the interpolation estimate $∥W∥_(H^j) lt.eq epsilon ∥W∥_(H^(j + 1)) + C_epsilon ∥W∥_(L^2)$ give
  #[#set math.equation(numbering: n => "(5.8)")
   $ ∥W∥_(H^(j + 1)) lt.eq C #scale(x: 120%, y: 120%)[\(] ∥cal(P)_rho W∥_(H^j) + ∥W∥_(L^2) #scale(x: 120%, y: 120%)[\)] . $ <eq:supported-elliptic-preestimate>]
  The coefficients can be cut off outside a neighborhood of the smaller disk for this calculation. We will also use local regularity for an $L^2$ distributional solution with smooth right side. In a local frame $F$, its equation becomes a scalar Cauchy–Riemann equation componentwise with smooth right side. Subtracting a smooth local particular solution, as supplied by Lemma 8, leaves holomorphic components. The original solution is therefore smooth in the disk.
  To remove the last term in (5.8), suppose that (5.7) fails at a fixed parameter. There would then be a sequence $W_nu$, supported in $overline(D_r^2)$, such that
  $ ∥W_nu∥_(H^(j + 1)) = 1 \, #h(2em) ∥cal(P)_rho W_nu∥_(H^j) arrow.r 0 . $
  After passing to a subsequence, compactness of the embedding into $L^2 \( D_(2 r)^2 \)$ gives a strong $L^2$ limit $W$. This limit is supported in $overline(D_r^2)$ and solves $cal(P)_rho W = 0$ distributionally. Part (i) gives $W = 0$. Equation (5.8) now contradicts the normalization of $W_nu$. This proves (ii) at a fixed parameter.
  For the parameter assertions, equip the fixed complex Hilbert spaces
  $ X_j & = { W in H^(j + 1) \( D_(2 r)^2 \; bb(C)^n \) : "supp" W subset overline(D_r^2) } \,\
Z_j & = H^j \( D_(2 r)^2 \; bb(C)^n \) $
  with their usual Hermitian Sobolev inner products. The subspace $X_j$ is closed. The map $rho mapsto cal(P)_rho$ is smooth in $cal(L) \( X_j \, Z_j \)$. The estimate at $rho_0$ persists in a neighborhood: absorb $∥\( cal(P)_rho - cal(P)_(rho_0) \) W∥_(Z_j)$ into its left side when the operator norm of the difference is small. This proves local uniformity in (ii).
  Write $cal(P)_rho^(*) : Z_j arrow.r X_j$ for the Hilbert space adjoint with respect to these fixed inner products. In particular, this is not an adjoint in the complex bilinear pairing used for the null vectors. The lower bound in (ii) implies that $cal(P)_rho^(*) cal(P)_rho : X_j arrow.r X_j$ is coercive and invertible. Consequently
  #[#set math.equation(numbering: n => "(5.9)")
   $ T_(rho \, j) = \( cal(P)_rho^(*) cal(P)_rho \)^(- 1) cal(P)_rho^(*) : Z_j arrow.r X_j $ <eq:supported-left-inverse>]
  is a bounded left inverse. It depends smoothly on $rho$, since adjoints and inversion of bounded invertible operators do so locally. This argument uses a lower bound for $cal(P)_rho$; it requires no surjectivity onto $Z_j$.
  For each $j$, set $W_j \( rho \) = T_(rho \, j) f \( dot.op \, rho \)$. An $L^2$ supported solution, whenever it exists, is smooth by interior ellipticity and hence belongs to every $X_j$. It must equal $W_j \( rho \)$ by the left-inverse identity. Thus the smooth $Z_j$-valued residual
  $ cal(P)_rho W_j \( rho \) - f \( dot.op \, rho \) $
  vanishes on the assumed dense set, and continuity makes it zero for every $rho$. Uniqueness in (i) identifies the solutions for different $j$. Smooth dependence with values in every $H^(j + 1)$, together with Sobolev embedding in the planar variables, gives joint smoothness in $\( y \, rho \)$. This proves (iii). ◻
]

Let

$ cal(C) = { \[ theta \] in bb(C) upright(P)^2 : theta dot.op theta = 0 } $

be the projective null conic. The fibers $cal(E)_theta = H_theta xor bb(C)$ form a holomorphic subbundle $cal(E)$ of the trivial bundle $cal(C) times bb(C)^4$. For example, on a chart where $theta_i eq.not 0$, the vectors $e_j - \( theta_j \/ theta_i \) e_i$, $j eq.not i$, give a holomorphic frame of $H_theta$; adjoining the scalar component gives one of $cal(E)$.

Cekić constructs a transport comparison for connection Laplacians that equals the identity in the outer exterior component #cite(label("Cekic2025")) Theorem 3.4 in the arXiv version, using full connection-system boundary data on a trivial vector bundle. The comparison below is obtained from physical elastic transfer and weak limits on the constrained fibers $cal(E)_theta$.

#thm([Proposition 5.3.])[
  (Matching of the transports).  #emph[For the two extended coefficient pairs of Lemma 2, equality of the physical displacement-to-traction maps implies that there is a unique smooth field 
$ G \( x \, \[ theta \] \) in "End" \( cal(E)_theta \) \, #h(2em) \( x \, \[ theta \] \) in bb(R)^3 times cal(C) \, $

 satisfying, for every nonzero representative $theta$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ D_theta G & = M_(2 \, theta) G - G M_(1 \, theta) \,\
G \( x \, \[ theta \] \) & = upright("Id") #h(2em) upright("if ") \| x \| > 2 r . $ <eq:comparison-transport>]

 For each fixed $x$, this field is a holomorphic section of $"End" \( cal(E) \)$ over $cal(C)$. In fact, for each fixed direction the first equation has at most one smooth solution whose difference from the identity has compact spatial support.]
] <prop:transport-matching>

#proof[
  #emph[Physical transfer and weak limits.] Fix a nonzero null vector $theta$ and $t_0 in \( - 2 r \, 2 r \)$. Apply Proposition 9 to the first coefficient pair. It supplies three exact smooth solutions on $B_(5 r)$, with the limits and estimates in (4.7), and an interval $J$ containing $t_0$ on which their leading columns form a frame on $D_(2 r)^2 times J$. We perform the following construction for each column, temporarily suppressing its index.
  By Proposition 3, the first solution $u_(1 \, tau)$ has a smooth transferred solution $u_(2 \, tau)$ on $B_(5 r)$, with $u_(2 \, tau) = u_(1 \, tau)$ outside $overline(Omega)$. Define the physical augmented vectors
  $ V_(j \, tau) = \( u_(j \, tau) \, "div" u_(j \, tau) \) \, #h(2em) j = 1 \, 2 . $
  The difference $V_(2 \, tau) - V_(1 \, tau)$ is smooth and compactly supported in $overline(Omega) subset B_r$. By Lemma 4,
  #[#set math.equation(numbering: n => "(5.11)")
   $ cal(L)_2 \( V_(2 \, tau) - V_(1 \, tau) \) = \( cal(L)_1 - cal(L)_2 \) V_(1 \, tau) . $ <eq:physical-transfer-forcing>]
  Both normalized systems have principal part $Delta upright("Id")_4$. Their difference is therefore an operator of order at most one, whose coefficients are supported in $overline(Omega)$. The weighted derivative bound in (4.7) implies
  $ ∥E_tau^(- 1) \( cal(L)_1 - cal(L)_2 \) V_(1 \, tau)∥_(L^2) & lt.eq C (∥E_tau^(- 1) V_(1 \, tau)∥_(L^2 \( B_(4 r) \)) + ∥E_tau^(- 1) nabla V_(1 \, tau)∥_(L^2 \( B_(4 r) \)))\
 & = O \( tau \) . $
  The function on the left is extended by zero off its compact support when a norm on $bb(R)^3$ is used. Apply Proposition 5 to the difference in (5.11). Since $∥F∥_(H_h^(- 1)) lt.eq ∥F∥_(L^2)$ and $h = tau^(- 1)$, we obtain
  #[#set math.equation(numbering: n => "(5.12)")
   $ ∥E_tau^(- 1) \( V_(2 \, tau) - V_(1 \, tau) \)∥_(H_h^1) & lt.eq C h ∥E_tau^(- 1) \( cal(L)_1 - cal(L)_2 \) V_(1 \, tau)∥_(H_h^(- 1))\
 & lt.eq C . $ <eq:bounded-transferred-amplitudes>]
  Thus $E_tau^(- 1) V_(2 \, tau)$ is bounded in $L^2 \( B_(4 r) \)$. After passage to a subsequence, chosen simultaneously for the three columns, it converges weakly to a vector $\( tilde(a) \, tilde(b) \)$. The strong convergence of the first amplitudes and the exterior agreement of the physical solutions give
  #[#set math.equation(numbering: n => "(5.13)")
   $ \( tilde(a) \, tilde(b) \) = \( a_0 \, b_0 \) quad upright("almost everywhere on ") B_(4 r) \\ overline(Omega) . $ <eq:exterior-leading-agreement>]
  These weak limits satisfy the constrained transport for the second pair. To see this directly, write $\( a_tau \, b_tau \) = E_tau^(- 1) V_(2 \, tau)$. The exact equations and the null condition give
  $ R_2^theta \( a_tau \, b_tau \) + tau^(- 1) R_2 \( a_tau \, b_tau \) & = 0 \,\
S_2^theta \( a_tau \, b_tau \) + tau^(- 1) S_2 \( a_tau \, b_tau \) & = 0 . $
  When tested against a fixed compactly supported smooth function, the terms multiplied by $tau^(- 1)$ tend to zero: all their derivatives can be transferred to that test function, while the amplitudes remain bounded in $L^2$. Weak convergence passes the remaining terms to the limit. Moreover, the physical divergence identity says
  $ theta dot.op a_tau = tau^(- 1) \( b_tau - "div" a_tau \) \, $
  so $theta dot.op tilde(a) = 0$ distributionally. We have proved
  $ R_2^theta \( tilde(a) \, tilde(b) \) = 0 \, #h(2em) S_2^theta \( tilde(a) \, tilde(b) \) = 0 \, #h(2em) \( tilde(a) \, tilde(b) \) in cal(E)_theta . $
  No derivative estimate on the transferred amplitudes, beyond their $L^2$ bound, is needed for this passage to the limit.
  The physical transfer has therefore produced the second transport columns, but only as weak limits. We next obtain a supported comparison on almost every transverse plane and use supported uniqueness to extend it to every plane.
  #emph[A comparison on almost every plane.] Apply (5.1) to the three leading columns for each pair and denote the resulting maps by $Y_j : bb(C)^3 arrow.r cal(E)_theta$. For $j = 2$, these columns are initially locally $L^2$; they satisfy the equations distributionally. Since $J subset \( - 2 r \, 2 r \)$, the cylinder on which the first columns form a frame satisfies
  $ D_(2 r)^2 times J subset B_(sqrt(8) thin r) subset B_(4 r) . $
  Thus the weak limits constructed above are defined throughout this cylinder, where
  $ D_theta Y_j = M_(j \, theta) Y_j \, $
  and $Y_1$ is smooth and invertible. The change of variables agrees for the two pairs outside $overline(Omega)$. Define
  $ G = Y_2 Y_1^(- 1) . $
  The calculation preceding Lemma 11 now applies: $G$ is a locally $L^2$ endomorphism on the cylinder, equals the identity outside $overline(Omega)$, and satisfies the first equation of (5.10) distributionally. With $W = G - upright("Id")$, this is the cylinder version of (5.6). The operator $D_theta$ differentiates only the planar variables. Testing the cylinder equation with products of a planar test function and a transverse test function, and then using a countable dense collection of planar tests, gives (5.6) on $D_(2 r)^2$ for almost every $t in J$. For these $t$, $W \( dot.op \, t \)$ belongs to $L^2 \( D_(2 r)^2 \)$ and has support in $overline(D_r^2)$. Indeed, $W = 0$ when $\| y \| > r$, and on its remaining support multiplication by $Y_1^(- 1)$ is locally bounded uniformly in $t$. These assertions can first be made on compact subintervals of $J$ and then exhausted over $J$.
  #emph[Existence on every plane.] In the orthonormal coordinates associated with the fixed $theta$,
  $ D_theta = \| "Re" theta \| \( partial_(y_1) + i partial_(y_2) \) . $
  Thus (5.5), as an operator on matrix entries, has the form of Lemma 11. Its coefficients and the source $f_(theta \, t)$ are smooth in $\( y \, t \)$. The set of parameters for which a supported solution has just been obtained has full measure in $J$, and hence is dense. Part (iii) of that lemma extends existence to every $t in J$ and makes $W$ smooth in $\( y \, t \)$. It also makes the choice unique, so the results from different intervals $J$ agree on their overlaps.
  Since $t_0$ was arbitrary, this constructs $G$ for every $- 2 r < t < 2 r$. Extend $W = G - upright("Id")$ by zero in the planar variables outside $D_(2 r)^2$. This extension is smooth because $W$ is already zero for $r < \| y \| < 2 r$. The equation holds across this extension, and it holds farther out because $f_(theta \, t) = 0$ there. If $\| t \| > r$, the entire plane misses $overline(Omega)$, so $f_(theta \, t) = 0$. Part (i) of Lemma 11 then gives $W = 0$ on that plane. Extending by zero also for $\| t \| gt.eq 2 r$ is therefore smooth. For this fixed direction we have constructed a global smooth comparison with
  #[#set math.equation(numbering: n => "(5.14)")
   $ "supp" \( G \( dot.op \, theta \) - upright("Id") \) subset { \( y \, t \) : \| y \| lt.eq r \, med \| t \| lt.eq r } subset overline(B_(2 r)) . $ <eq:comparison-uniform-support>]
  The final containing ball is independent of the direction.
  For later use, uniqueness holds even if a larger compact support is allowed. The difference of two such comparisons solves the homogeneous equation on every plane and has compact support there. The local-frame and holomorphic-continuation argument in Lemma 11, applied on a disk containing that support, makes the difference zero on each plane.
  #emph[Smooth dependence on the direction.] The preceding construction gives a unique comparison separately for every nonzero null vector $theta$. If $c in bb(C) \\ { 0 }$, then $cal(E)_(c theta) = cal(E)_theta$, and
  $ D_(c theta) = c D_theta \, #h(2em) M_(j \, c theta) = c M_(j \, theta) . $
  The equations for $theta$ and $c theta$ are consequently identical after division by $c$. Compact-support uniqueness gives $G \( x \, c theta \) = G \( x \, theta \)$, so the field is already well defined on projective directions as a pointwise family.
  Choose a local smooth representative $theta \( v \)$ of those directions, where $v$ ranges over an open subset of $bb(R)^2$, and a smooth local frame of $cal(E)$. Define the orthonormal vectors
  $ e_1 \( v \) = frac("Re" theta \( v \), \| "Re" theta \( v \) \|) \, quad e_2 \( v \) = frac("Im" theta \( v \), \| "Im" theta \( v \) \|) \, quad e_3 \( v \) = e_1 \( v \) times e_2 \( v \) . $
  They vary smoothly: the real and imaginary parts of a nonzero null vector are nonzero, perpendicular, and of equal length. In the coordinates
  $ x = y_1 e_1 \( v \) + y_2 e_2 \( v \) + t e_3 \( v \) \, $
  and the chosen bundle frame, (5.6) is a smooth family of operators of the form in Lemma 11, with parameters $\( t \, v \)$ on the fixed disk $D_(2 r)^2$. For every value of these parameters a solution supported in $overline(D_r^2)$ has already been constructed. The smooth left inverse (5.9) therefore expresses this unique solution as a smooth function of $\( y \, t \, v \)$. Returning to physical coordinates gives joint smoothness in $\( x \, v \)$.
  This reasoning uses the separate fixed-direction existence results and their uniqueness. In particular, none of the earlier weakly convergent subsequences has to be chosen simultaneously for varying directions.
  #emph[Holomorphic dependence at fixed physical coordinates.] A close precedent for this parameter argument is Cekić #cite(label("Cekic2025")) Theorem 3.4 and Lemma 4.1 in the arXiv version, whose parameter argument follows Eskin’s complex-parameter method #cite(label("Eskin2001")). Now let $v$ be a complex local coordinate on $cal(C)$. Choose a holomorphic nonzero representative $theta \( v \)$ and a holomorphic frame of $cal(E)$ on this chart. This frame depends only on $v$. In this frame the matrices $M_(j \, theta \( v \)) \( x \)$ are holomorphic in $v$ for each fixed $x$: the ambient formulas (5.2)–(5.3) are holomorphic in $theta$, and passage to a holomorphic bundle frame preserves that property.
  Represent $G$ in the same frame and differentiate the first equation of (5.10) by $partial_(macron(v))$, #emph[holding $x in bb(R)^3$ fixed]. Joint smoothness just established justifies this differentiation. Since the representative and the frame are holomorphic and the frame is independent of $x$, the result is exactly
  $ D_(theta \( v \)) \( partial_(macron(v)) G \) - M_(2 \, theta \( v \)) partial_(macron(v)) G + \( partial_(macron(v)) G \) M_(1 \, theta \( v \)) = 0 . $
  The derivative here is a matrix in a holomorphic trivialization, hence represents an endomorphism of the same fiber $cal(E)_(theta \( v \))$. The common support bound (5.14) implies that this derivative is zero for $\| x \| > 2 r$. Compact-support uniqueness on each plane gives $partial_(macron(v)) G = 0$. The smooth moving coordinates were used to establish joint regularity; the equation was differentiated only after returning to fixed physical coordinates. We conclude that $G \( x \, dot.op \)$ is holomorphic on $cal(C)$ for every $x$, completing the proof. ◻
]

== 6 Recovery of the coefficients <sec:coefficient-recovery>

The holomorphic comparison from Proposition 12 is constrained by the geometry of its polarization bundle. We first show that this comparison is the identity, and then recover the coefficients from the transport matrices.

=== 6.1 The bundle on the null conic <the-bundle-on-the-null-conic>

Let $H arrow.r cal(C)$ be the holomorphic bundle with fiber $H_theta$, and let $cal(N) subset H$ be the null line subbundle with fiber $bb(C) theta$. Thus $cal(E) = H xor cal(O)$, where $cal(O)$ denotes the trivial holomorphic line bundle on $cal(C)$. On $bb(P)^1 \( bb(C) \)$, let $cal(O) \( - 1 \)$ denote the tautological line bundle and $cal(O) \( - 2 \)$ its tensor square.

#thm([Lemma 6.1.])[
  #emph[The bundle $H$ has no nonzero global holomorphic sections, and $H \/ cal(N)$ is holomorphically trivial. More precisely, under the identification $cal(C) tilde.eq bb(P)^1 \( bb(C) \)$, 
$ H tilde.eq cal(O) \( - 1 \)^(xor 2) \, #h(2em) cal(N) tilde.eq cal(O) \( - 2 \) \, $

 and their quotient sequence is 
#[#set math.equation(numbering: n => "(6.1)")
 $ 0 arrow.r cal(O) \( - 2 \) arrow.r^(med \( z_0 \, z_1 \)^T med) cal(O) \( - 1 \)^(xor 2) arrow.r^(med \( - z_1 \, z_0 \) med) cal(O) arrow.r 0 . $ <eq:conic-quotient>]

 Here $\[ z_0 : z_1 \]$ are homogeneous coordinates on $bb(P)^1 \( bb(C) \)$.]
] <lem:conic-bundle>

#proof[
  A homogeneous parametrization of the conic is
  #[#set math.equation(numbering: n => "(6.2)")
   $ theta \( z_0 \, z_1 \) = \( z_0^2 - z_1^2 \, med i \( z_0^2 + z_1^2 \) \, med 2 z_0 z_1 \) . $ <eq:conic-parametrization>]
  It identifies $bb(P)^1 \( bb(C) \)$ with $cal(C)$: on the first coordinate chart its inverse is $z_1 \/ z_0 = theta_3 \/ \( theta_1 - i theta_2 \)$, and on the second it is $z_0 \/ z_1 = theta_3 \/ \( - theta_1 - i theta_2 \)$. The denominators cannot both vanish at a point of $cal(C)$.
  Consider the two degree-one columns
  $ h_1 = \( z_0 \, i z_0 \, z_1 \) \, #h(2em) h_2 = \( - z_1 \, i z_1 \, z_0 \) . $
  Direct calculation, with the complex bilinear product, gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ theta dot.op h_1 = theta dot.op h_2 = 0 \, #h(2em) h_1 times h_2 = i theta \, #h(2em) theta = z_0 h_1 + z_1 h_2 . $ <eq:conic-frame>]
  To interpret these homogeneous formulas as bundle maps, write $cal(O) \( - 1 \)_(\[ z \]) = bb(C) z$ for $z = \( z_0 \, z_1 \)$. The assignment
  $ \( xi_1 z \, xi_2 z \) mapsto xi_1 h_1 \( z \) + xi_2 h_2 \( z \) $
  is independent of the representative: replacing $z$ by $c z$ replaces $xi_j$ by $c^(- 1) xi_j$ and $h_j \( z \)$ by $c h_j \( z \)$. Its local polynomial formulas are holomorphic. Since the images lie in $H$ and are linearly independent at every point, it is an isomorphism $cal(O) \( - 1 \)^(xor 2) arrow.r H$. Likewise, $xi z^(⊗ 2) mapsto xi theta \( z \)$ is well defined because $theta \( c z \) = c^2 theta \( z \)$, and identifies $cal(O) \( - 2 \)$ with $cal(N)$. The final identity in (6.3) gives the first map in (6.1).
  The expression $- z_1 xi_1 + z_0 xi_2$ is also unchanged under the same representative scaling, so its local polynomial formulas define a holomorphic map to the trivial line bundle $cal(O)$. The row $\( - z_1 \, z_0 \)$ is everywhere surjective, and its kernel is the image of $\( z_0 \, z_1 \)^T$. This proves the quotient assertion, including at both coordinate-chart endpoints. It is also consistent with the induced bilinear form: for $p = xi_1 h_1 + xi_2 h_2$ in a local frame,
  $ p dot.op p = \( - z_1 xi_1 + z_0 xi_2 \)^2 . $
  Finally, any holomorphic section of $H$ has holomorphic ambient components on the compact conic, so those components are constant. Such a constant vector is orthogonal to every null vector. The vectors $theta \( 1 \, 0 \)$, $theta \( 0 \, 1 \)$ and $theta \( 1 \, 1 \)$ span $bb(C)^3$, so the section is zero. ◻
]

#prodef([Remark 6.2.])[
  The exact sequence (6.1) does not split holomorphically: a splitting would give a nonzero global section of $H$. On the other hand, the displayed splitting of $H$ itself gives nonscalar holomorphic endomorphisms of $H$. The next argument uses the transport equation to restrict those endomorphisms.
]

#thm([Proposition 6.3.])[
  #emph[The comparison endomorphism of Proposition 12 is $G = upright("Id")$. Consequently, for every $x in bb(R)^3$ and every nonzero null vector $theta$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ M_(1 \, theta) = M_(2 \, theta) quad upright("on ") cal(E)_theta . $ <eq:equal-restricted-transports>]

]
] <prop:comparison-rigidity>

#proof[
  Fix $x$. Relative to $cal(E) = H xor cal(O)$, the upper-right block of the holomorphic endomorphism $G \( x \, dot.op \)$ is a global holomorphic section of $H$, and therefore vanishes by Lemma 13. Its lower-right block is a holomorphic scalar function on the compact conic, and hence is independent of direction. We may thus write
  $ G = mat(delim: "(", F, 0; A, f) \, #h(2em) f = f \( x \) . $
  All these blocks are smooth in $x$. Taking the upper-right block of (5.10), and using (5.2), gives
  $ 0 = theta f - F theta . $
  It follows that $F - f upright("Id")_H$ vanishes on $cal(N)$. This holomorphic bundle morphism consequently factors through $H \/ cal(N)$. By Lemma 13, its factor is a morphism $cal(O) arrow.r H$, which must vanish. Thus $F = f upright("Id")_H$.
  The upper-left block of (5.10) now reads
  #[#set math.equation(numbering: n => "(6.5)")
   $ \( D_theta f \) upright("Id")_(H_theta) = theta A . $ <eq:comparison-rank>]
  The right side has rank at most one, while $H_theta$ has dimension two. Therefore $D_theta f = 0$. Equation (6.5) then gives $A = 0$, since $theta eq.not 0$. As null vectors span $bb(C)^3$, we obtain $nabla f = 0$. The exterior identity value of $G$ fixes $f = 1$, so $G = upright("Id")$. Substitution in (5.10) proves (6.4). ◻
]

=== 6.2 A finite-type uniqueness lemma <a-finite-type-uniqueness-lemma>

We will show that equality of the restricted bottom-left transport blocks leaves at most a scalar-identity ambiguity, then use the following elementary lemma to remove it. Indices in the lemma range from $1$ to $n$; all sums are written explicitly.

#thm([Lemma 6.4.])[
  #emph[Let $U subset bb(R)^n$ be connected and open, with $n gt.eq 2$, and let $eta \, q$ and $B_(i j)^(med a)$ be smooth, real- or complex-valued functions on $U$ satisfying 
#[#set math.equation(numbering: n => "(6.6)")
 $ partial_i partial_j eta = sum_(a = 1)^n B_(i j)^(med a) partial_a eta + delta_(i j) q . $ <eq:finite-type-hypothesis>]

 Then $\( nabla eta \, q \)$ satisfies a homogeneous first-order system with smooth coefficients. In particular, if $eta$ vanishes on a nonempty open subset of $U$, then $eta = q = 0$ on $U$.]
] <lem:finite-type>

#proof[
  Put $v_a = partial_a eta$. For each $s$, choose one index $i = i \( s \)$ with $i eq.not s$, without summing over $i$. Equation (6.6) and commutation of third derivatives give
  $ partial_s q & = partial_i (sum_(a = 1)^n B_(s i)^(med a) v_a) - partial_s (sum_(a = 1)^n B_(i i)^(med a) v_a)\
 & = sum_(a = 1)^n \( partial_i B_(s i)^(med a) - partial_s B_(i i)^(med a) \) v_a + sum_(a = 1)^n \( B_(s i)^(med a) partial_i v_a - B_(i i)^(med a) partial_s v_a \) . $
  There is no derivative of $q$ on the right because the off-diagonal entry $partial_s partial_i eta$ in (6.6) has $delta_(s i) = 0$. Substituting that equation for the derivatives of $v$ yields
  #[#set math.equation(numbering: n => "(6.7)")
   $ partial_s v_a & = sum_(b = 1)^n B_(a s)^(med b) v_b + delta_(a s) q \,\
partial_s q & = sum_(b = 1)^n C_s^(med b) v_b + d_s q \, $ <eq:finite-type-system>]
  where the smooth coefficients are explicitly
  #[#set math.equation(numbering: n => "(6.8)")
   $ C_s^(med b) & = partial_i B_(s i)^(med b) - partial_s B_(i i)^(med b) + sum_(a = 1)^n #scale(x: 120%, y: 120%)[\(] B_(s i)^(med a) B_(a i)^(med b) - B_(i i)^(med a) B_(a s)^(med b) #scale(x: 120%, y: 120%)[\)] \,\
d_s & = B_(s i)^(med i) - B_(i i)^(med s) . $ <eq:finite-type-coefficients>]
  This is the claimed homogeneous system for $v$ and $q$.
  If $eta = 0$ on an open subset, then $v = 0$ there, and a diagonal entry of (6.6) also gives $q = 0$ there. Along any piecewise smooth path in $U$, Equation (6.7) restricts to a homogeneous linear ordinary differential equation for $\( v \, q \)$. Uniqueness with zero initial data propagates its vanishing along the path. An open connected subset of $bb(R)^n$ is path connected, so $v = q = 0$ on $U$. Finally, $eta$ is constant on $U$, and its value on the initial open subset is zero. ◻
]

=== 6.3 Completion of the coefficient recovery <completion-of-the-coefficient-recovery>

#proof[
  Suppose that the two displacement-to-traction maps agree, and use the common exterior extensions furnished by Lemma 2. Propositions 12 and 15 give equality of the transport matrices on $cal(E)_theta$ for every nonzero null $theta$. In particular, (5.3) gives
  $ D_theta log \( k_1 \/ ell_1 \) = D_theta log \( k_2 \/ ell_2 \) . $
  Since null vectors span $bb(C)^3$, the difference of these logarithms has zero gradient. Its exterior value is zero. Hence $k_1 \/ ell_1 = k_2 \/ ell_2$ on $bb(R)^3$, and the functions
  #[#set math.equation(numbering: n => "(6.9)")
   $ c = m_1 / ell_1 = m_2 / ell_2 > 0 \, #h(2em) b_(*) = log k_1 / m_1 = log k_2 / m_2 $ <eq:common-ratios>]
  are well defined and smooth. Indeed, $m_j \/ ell_j = 1 - k_j \/ ell_j$, and $k_j \/ m_j = \( k_j \/ ell_j \) \/ \( 1 - k_j \/ ell_j \)$.
  Equality of the bottom-left blocks on $cal(E)_theta$ means
  $ \( Q_(1 \, theta) - Q_(2 \, theta) \) dot.op p = 0 #h(2em) \( p in H_theta \) . $
  The annihilator of $H_theta = theta^perp$ for the nondegenerate ambient bilinear form is $bb(C) theta$. Since each $Q_(j \, theta)$ is linear in $theta$, there is a smooth ambient matrix $K \( x \)$ such that
  #[#set math.equation(numbering: n => "(6.10)")
   $ Q_(1 \, theta) - Q_(2 \, theta) = K \( x \) theta in bb(C) theta #h(2em) \( theta dot.op theta = 0 \) . $ <eq:null-line-preservation>]
  For fixed $x$, the proportionality factor in (6.10) is a holomorphic function on $cal(C)$. To see this at every point, choose a local holomorphic representative $theta$ and a component $theta_a eq.not 0$; the factor is $\( K theta \)_a \/ theta_a$. These expressions agree on overlapping charts and are unchanged by rescaling the representative. Compactness of $cal(C)$ makes the factor constant in direction. The spanning property of null vectors then gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ K \( x \) = kappa \( x \) upright("Id") \, #h(2em) kappa \( x \) = 1 / 3 "tr" K \( x \) . $ <eq:scalar-ambient-difference>]
  In particular, $kappa$ is smooth.
  Set
  $ eta = log m_1 - log m_2 \, #h(2em) v = nabla eta = g_1 - g_2 \, #h(2em) beta = nabla b_(*) \, #h(2em) alpha = frac(c - 1 \/ 2, c) \, $
  where $g_j = nabla log m_j$. Because $nabla log k_j = g_j + beta$, the expression for $Q$ in (5.3) becomes
  $ 2 Q_(j \, theta) = #scale(x: 120%, y: 120%)[\(] \( c - 1 \/ 2 \) g_j g_j^T + c g_j beta^T - c nabla^2 log m_j #scale(x: 120%, y: 120%)[\)] theta . $
  Subtract these identities, use $g_1 g_1^T - g_2 g_2^T = g_1 v^T + v g_2^T$, and apply (6.11). Defining the smooth scalar $q = - 2 kappa \/ c$, we obtain
  $ nabla^2 eta = alpha \( g_1 v^T + v g_2^T \) + v beta^T + q upright("Id") . $
  Equivalently,
  #[#set math.equation(numbering: n => "(6.12)")
   $ partial_i partial_j eta & = sum_(a = 1)^3 B_(i j)^(med a) partial_a eta + delta_(i j) q \,\
B_(i j)^(med a) & = alpha \( g_1 \)_i delta_(j a) + #scale(x: 120%, y: 120%)[\(] alpha \( g_2 \)_j + beta_j #scale(x: 120%, y: 120%)[\)] delta_(i a) . $ <eq:coefficient-hessian>]
  The coefficients $B_(i j)^(med a)$ are smooth on $bb(R)^3$. They are fixed functions determined by the two coefficient pairs under comparison. The common exterior extension gives $eta = 0$ on a nonempty exterior open set. Lemma 16, applied to (6.12), yields $eta = 0$ throughout $bb(R)^3$. Thus $m_1 = m_2$. Equation (6.9) then gives $k_1 = m_1 e^(b_(*)) = m_2 e^(b_(*)) = k_2$, and therefore
  $ mu_1 = mu_2 \, #h(2em) lambda_1 = k_1 - m_1 = k_2 - m_2 = lambda_2 . $
  Restricting to $Omega$ proves the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
