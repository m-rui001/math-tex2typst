#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Electromagnetic tails and the \
Kerr--Newman Penrose inequality]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Kerr–Newman mass formula suggests the Kerr–Newman Penrose inequality

#[#set math.equation(numbering: n => "(1.1)")
 $ m^2 gt.eq frac(A, 16 pi) + Q^2 / 2 + frac(pi \( Q^4 + 4 J^2 \), A) \, #h(2em) A gt.eq 4 pi sqrt(Q^4 + 4 J^2) \, $ <eq:kn-inequality>]

where $A$ is a suitable enclosing area, $m$ is mass, $Q$ is total charge, and $J$ is angular momentum. Its motivation comes from the gravitational-collapse argument underlying Penrose’s original proposal #cite(label("Penrose1973")); the area branch in (1.1) is the branch on which the right side increases with $A$. The formulation using minimum enclosing area, and the distinction between the corresponding upper and lower area bounds, are discussed in #cite(label("DKWY2013")).

In the presence of an electromagnetic field, specifying $J$ is essential. The gravitational angular-momentum flux through a surface need not be conserved. For the globally defined invariant magnetic potential used below, adding the corresponding electromagnetic boundary term gives a conserved flux under the electrovacuum constraints. Khuri–Weinstein include this term in their definition at infinity and state that its disappearance requires appropriate asymptotic conditions #cite(label("KW2016")) Equation (1.12) and the following paragraph. The identification argument of Dain–Khuri–Weinstein–Yamada uses Coulomb expansions for the electric and magnetic fields #cite(label("DKWY2013")) Equations (2.20) and (2.22). The weaker bounds $cal(E) \, cal(B) = O \( r^(- 2) \)$ alone do not impose those leading terms.

We give a negative resolution of (1.1) for the precise formulation below: $J$ is the gravitational ADM flux at infinity, and the electromagnetic assumptions are only the displayed decay and constraint conditions. Our examples have a connected outermost future marginally outer trapped boundary, minimize area among all enclosing cuts, and lie strictly on the physical area branch. They also disprove the associated nondegenerate Kerr–Newman equality implication. Stronger asymptotic conditions, or a definition of angular momentum retaining its electromagnetic term, lead to different assertions; no conclusion about those assertions follows from these examples.

=== 1.1 Conventions and the class of exteriors <sec:conventions>

We work in three spatial dimensions with $G = c = 1$ and zero cosmological constant. On an oriented Riemannian three-manifold $\( Omega \, g \)$, the cross product is defined by

$ \( X times_g Y \)^flat \( Z \) = #h(-0.16667em) upright(d) V_g \( X \, Y \, Z \) . $

Let $K$ be a symmetric covariant two-tensor, $tau = "tr"_g K$, and let $cal(E) \, cal(B)$ be electric and magnetic vector fields. We use the source-free electrovacuum constraint equations

#[#set math.equation(numbering: n => "(1.2)")
 $ R_g + tau^2 - lr(|K|)_g^2 & = 2 #scale(x: 120%, y: 120%)[\(] lr(|cal(E)|)_g^2 + lr(|cal(B)|)_g^2 #scale(x: 120%, y: 120%)[\)] \,\
"div"_g \( K - tau g \) & = 2 \( cal(E) times_g cal(B) \)^flat \,\
"div"_g cal(E) & = "div"_g cal(B) = 0 . $ <eq:constraints>]

Thus the total constraint densities are

$ mu = frac(lr(|cal(E)|)_g^2 + lr(|cal(B)|)_g^2, 8 pi) \, #h(2em) J_(upright("con")) = frac(\( cal(E) times_g cal(B) \)^flat, 4 pi) . $

The covector $J_(upright("con"))$ is distinct from the scalar angular momentum $J$.

All data are smooth, including at the compact boundary. The exterior is connected, complete as a metric space with its boundary included, and diffeomorphic to the complement of an open ball in $bb(R)^3$. There is one asymptotically flat end and a smooth effective $U \( 1 \)$ action preserving $g \, K \, cal(E) \, cal(B)$ and the boundary $S$. Its generator $eta$ has period $2 pi$ and agrees on the end with the standard oriented rotation about the third coordinate axis.

In asymptotic Euclidean coordinates $x$, write $r = lr(|x|)$ and assume

#[#set math.equation(numbering: n => "(1.3)")
 $ g_(i j) - delta_(i j) = O_4 \( r^(- 1) \) \, #h(2em) K_(i j) = O_3 \( r^(- 3) \) \, #h(2em) cal(E)^i \, cal(B)^i = O_3 \( r^(- 2) \) . $ <eq:falloff>]

Here $O_k \( r^(- a) \)$ bounds each Cartesian derivative of order $j lt.eq k$ by $C r^(- a - j)$. We require $mu$ and $lr(|J_(upright("con"))|)_g$ to be integrable. On a coordinate sphere $S_R$, let $n_delta$ be its Euclidean outward unit normal and $nu_R$ its $g$-unit outward normal. The asymptotic quantities are

#[#set math.equation(numbering: n => "(1.4)")
 $ E_(upright("ADM")) & = frac(1, 16 pi) lim_(R arrow.r oo) integral_(S_R) \( partial_j g_(i j) - partial_i g_(j j) \) n_delta^i thin #h(-0.16667em) upright(d) A_delta \,\
\( P_(upright("ADM")) \)_i & = frac(1, 8 pi) lim_(R arrow.r oo) integral_(S_R) \( K_(i j) - tau g_(i j) \) n_delta^j thin #h(-0.16667em) upright(d) A_delta \,\
J & = frac(1, 8 pi) lim_(R arrow.r oo) integral_(S_R) \( K_(i j) - tau g_(i j) \) nu_R^i eta^j thin #h(-0.16667em) upright(d) A_g \,\
Q_e & = frac(1, 4 pi) lim_(R arrow.r oo) integral_(S_R) g \( cal(E) \, nu_R \) thin #h(-0.16667em) upright(d) A_g \, #h(2em) Q_b = frac(1, 4 pi) lim_(R arrow.r oo) integral_(S_R) g \( cal(B) \, nu_R \) thin #h(-0.16667em) upright(d) A_g . $ <eq:adm-energy>]

All these limits are required to exist and be finite. We impose $P_(upright("ADM")) = 0$ and $E_(upright("ADM")) > 0$, and set $m = E_(upright("ADM"))$, $Q = sqrt(Q_e^2 + Q_b^2)$. In particular (1.4) has no electromagnetic surface term.

For a two-sided surface with unit normal $nu$ pointing toward the end, put

#[#set math.equation(numbering: n => "(1.5)")
 $ H_Sigma = "div"_Sigma nu \, #h(2em) "tr"_Sigma K = \( g^(i j) - nu^i nu^j \) K_(i j) \, #h(2em) theta_(+) \( Sigma \) = H_Sigma + "tr"_Sigma K . $ <eq:expansion>]

Thus outward Euclidean spheres have positive mean curvature. The boundary is a future marginally outer trapped surface, or future MOTS, if $theta_(+) \( S \) = 0$. We require this condition and the following precise outermostness condition: there is no compact smooth embedded enclosing surface entirely in the interior, possibly disconnected, for which $theta_(+) lt.eq 0$ everywhere. No condition on the inward expansion is imposed.

An #emph[enclosing cut] is the compact intrinsic boundary $Gamma = partial D$ of a connected smooth codimension-zero submanifold $D subset Omega$, closed as a subset of $Omega$, whose interior lies in $"int" Omega$ and which contains the entire sufficiently distant part of the end. The full intrinsic boundary is counted, including any portion coinciding with $S$. The cut must be smooth, embedded and two-sided; it may be disconnected and need not be symmetric or trapped. In particular $D = Omega$ gives the cut $S$. The required area condition is

#[#set math.equation(numbering: n => "(1.6)")
 $ "Area"_g \( Gamma \) gt.eq A := "Area"_g \( S \) > 0 #h(2em) upright("for every enclosing cut ") Gamma . $ <eq:outer-area-condition>]

Thus $A$ is exactly the minimum enclosing area.

=== 1.2 Main result <sec:main-result>

#thm([Theorem 1.1.])[
  #emph[In the class of smooth axisymmetric source-free electrovacuum exteriors specified in 1.1, both of the following occur.]
  + #emph[There are data with 
$ Q_e = Q_b = 0 \, #h(2em) A > 8 pi lr(||) J \, #h(2em) m^2 < frac(A, 16 pi) + frac(4 pi J^2, A) . $

]
  + #emph[There are data with 
$ Q_e = Q_b = 0 \, #h(2em) A > 8 pi lr(||) J \, #h(2em) m^2 = frac(A, 16 pi) + frac(4 pi J^2, A) \, $

 for which no smooth spacelike embedding into the Kerr–Newman spacetime with parameters $\( m \, J \, Q_e \, Q_b \)$ induces the given metric, second fundamental form, and electromagnetic fields.]
  #emph[All these examples are maximal, $"tr"_g K = 0$, on $Omega = { x in bb(R)^3 : lr(|x|) gt.eq 1 }$, with connected boundary $S = { r = 1 }$. Both electromagnetic fields are nonzero.]
] <thm:main>

The first conclusion disproves (1.1) under (1.3) and (1.4), even with every horizon and area condition above. The second disproves the nondegenerate equality implication with a Kerr–Newman realization, including realizations by nonconstant time graphs. The usual spacetime convention is $K \( X \, Y \) = overline(g) \( overline(nabla)_X n \, Y \)$ for the future unit normal $n$; the induced fields are $cal(E)^flat = \( iota_n F \) \|_(T Omega)$ and $cal(B)^flat = star.op_g \( F \|_(T Omega) \)$. The obstruction in the second conclusion holds for every spacelike slice, so it also excludes a realization extending smoothly to a cross-section of the future horizon or to the bifurcation sphere.

The proof is independent of any neutral or charged Penrose inequality or rigidity theorem. It gives a two-parameter family, with amplitude $s in \[ 0 \, 1 \]$ and a transition radius $L$, such that

#[#set math.equation(numbering: n => "(1.7)")
 $ J = - frac(4 s^2, 15) \, #h(2em) m = 2 + O \( s^2 \/ L \) \, #h(2em) A = 64 pi + O \( s^2 \/ L^2 \) . $ <eq:family-summary>]

The electromagnetic correction to the angular-momentum flux is $+ 4 s^2 \/ 15$ at infinity. Angularly varying radial tails supply this term while their energy tends to zero as $L arrow.r oo$. At $s = 1$, the defect in (1.1) tends to $- 1 \/ 225$. For fixed large $L$, a small positive amplitude gives the opposite sign, yielding the equality example by continuity.

Two features make the construction explicit. A mixed radial–azimuthal tensor solves the electromagnetic momentum constraint without a vector elliptic equation. Kelvin reflection then gives a positive Newton-potential operator with the Robin condition that makes the unit sphere minimal. The contraction estimate uses the distance of the source from that sphere, and accommodates a noncompact $r^(- 4)$ energy tail. Finally, a closed two-form obtained by radial projection proves area-minimization against all enclosing cuts. These steps are developed in Section 2, Section 3, Section 4; 5 computes the fluxes and proves both conclusions.

== 2 Explicit electrovacuum seeds <sec:construction>

We first solve the momentum and Maxwell divergence constraints explicitly. The electromagnetic fields begin at a large radius; one scalar equation will then determine the metric. Throughout the construction,

$ Omega = { x in bb(R)^3 : r = \| x \| gt.eq 1 } \, #h(2em) S = { r = 1 } \, $

with the Euclidean metric $delta$ and standard orientation. Write $\( r \, theta \, phi.alt \)$ for spherical coordinates, with $theta$ the colatitude and $eta = partial_phi.alt$ the generator of the standard rotation action. Fix a smooth function $chi : bb(R) arrow.r \[ 0 \, 1 \]$ that is zero on $\( - oo \, 1 \]$ and one on $\[ 2 \, oo \)$. For example, one may take

$ chi \( t \) = frac(zeta \( t - 1 \), zeta \( t - 1 \) + zeta \( 2 - t \)) \, #h(2em) zeta \( t \) = cases(delim: "{", e^(- 1 \/ t) \, & t > 0 \,, 0 \, & t lt.eq 0 .) $

For $s in \[ 0 \, 1 \]$ and $L > 4$, put $c \( r \) = chi \( r \/ L \)$. Constants $C \, C_j$ below depend only on this fixed cutoff and the indicated derivative order, and are independent of $s$ and $L$ above a fixed lower threshold.

Define the scalar potentials, vector fields, and symmetric covariant tensor by

#[#set math.equation(numbering: n => "(2.1)")
 $ f & = s c \( r \) sin^2 theta \, & h & = s c \( r \) sin^2 theta cos theta \,\
iota_(tilde(E)) #h(-0.16667em) upright(d) V_delta & = #h(-0.16667em) upright(d) \( f thin #h(-0.16667em) upright(d) phi.alt \) \, & iota_(tilde(B)) #h(-0.16667em) upright(d) V_delta & = #h(-0.16667em) upright(d) \( h thin #h(-0.16667em) upright(d) phi.alt \) \,\
sigma & = - frac(s^2 c \( r \)^2 sin^4 theta, r^2) \( #h(-0.16667em) upright(d) r ⊗ #h(-0.16667em) upright(d) phi.alt + #h(-0.16667em) upright(d) phi.alt ⊗ #h(-0.16667em) upright(d) r \) . $ <eq:seeds>]

Here contraction with the volume form uniquely determines each vector field. The coordinate formulas in (2.1) extend smoothly across the rotation axis, as 2 verifies.

#thm([Lemma 2.1.])[
  (Seed identities and bounds).  #emph[The fields $tilde(E) \, tilde(B)$ and tensor $sigma$ are smooth on $Omega$, invariant under the standard effective $U \( 1 \)$ action, and vanish on ${ 1 lt.eq r lt.eq L }$. They satisfy 
#[#set math.equation(numbering: n => "(2.2)")
 $ "div"_delta tilde(E) = "div"_delta tilde(B) = 0 \, #h(2em) "tr"_delta sigma = 0 \, #h(2em) "div"_delta sigma = 2 #h(-0.16667em) upright(d) V_delta \( tilde(E) \, tilde(B) \, dot.op \) . $ <eq:seed-constraints>]

 For every Cartesian multi-index $alpha$ of order $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ \| partial^alpha tilde(E) \|_delta + \| partial^alpha tilde(B) \|_delta & lt.eq C_j s r^(- 2 - j) upright(bold(1))_({ r gt.eq L }) \,\
\| partial^alpha sigma \|_delta & lt.eq C_j s^2 r^(- 3 - j) upright(bold(1))_({ r gt.eq L }) . $ <eq:seed-bounds>]

 Moreover, $"div"_delta sigma$ is supported in ${ L lt.eq r lt.eq 2 L }$, with 
$ \| partial^alpha \( "div"_delta sigma \) \|_delta lt.eq C_j s^2 r^(- 4 - j) upright(bold(1))_({ L lt.eq r lt.eq 2 L }) . $

]
] <lem:seeds>

#proof[
  Let $X = \( x^1 \, x^2 \, x^3 \)$, $T = \( - x^2 \, x^1 \, 0 \)$, and $w = \( x^1 \)^2 + \( x^2 \)^2$, with $flat$ denoting Euclidean metric dual in the following formulas. The primitives and tensor have the Cartesian expressions
  #[#set math.equation(numbering: n => "(2.4)")
   $ f thin #h(-0.16667em) upright(d) phi.alt & = frac(s c, r^2) \( x^1 #h(-0.16667em) upright(d) x^2 - x^2 #h(-0.16667em) upright(d) x^1 \) \,\
h thin #h(-0.16667em) upright(d) phi.alt & = frac(s c x^3, r^3) \( x^1 #h(-0.16667em) upright(d) x^2 - x^2 #h(-0.16667em) upright(d) x^1 \) \,\
sigma & = - frac(s^2 c^2 w, r^7) \( X^flat ⊗ T^flat + T^flat ⊗ X^flat \) . $ <eq:cartesian-seeds>]
  These are smooth on $r gt.eq 1$, with no denominator involving distance to the axis. They also show rotation invariance and, since $X dot.op T = 0$, trace-freeness. The exact flux forms are closed, so $#h(-0.16667em) upright(d) \( iota_(tilde(E)) #h(-0.16667em) upright(d) V_delta \) = \( "div"_delta tilde(E) \) #h(-0.16667em) upright(d) V_delta = 0$, and likewise for $tilde(B)$.
  For the momentum identity we compute off the axis and then use smoothness. Since $#h(-0.16667em) upright(d) V_delta = r^2 sin theta thin #h(-0.16667em) upright(d) r and #h(-0.16667em) upright(d) theta and #h(-0.16667em) upright(d) phi.alt$, the spherical #emph[coordinate] components are
  #[#set math.equation(numbering: n => "(2.5)")
   $ tilde(E)^r & = frac(2 s c cos theta, r^2) \, & tilde(E)^theta & = - frac(s c' sin theta, r^2) \, & tilde(E)^phi.alt & = 0 \,\
tilde(B)^r & = frac(s c \( 3 cos^2 theta - 1 \), r^2) \, & tilde(B)^theta & = - frac(s c' sin theta cos theta, r^2) \, & tilde(B)^phi.alt & = 0 . $ <eq:field-components>]
  In particular an orthonormal polar component is $r$ times the displayed polar component. The covector $#h(-0.16667em) upright(d) V_delta \( tilde(E) \, tilde(B) \, dot.op \)$ has only an azimuthal component, namely
  #[#set math.equation(numbering: n => "(2.6)")
   $ #h(-0.16667em) upright(d) V_delta \( tilde(E) \, tilde(B) \, partial_phi.alt \) = frac(f_r h_theta - f_theta h_r, r^2 sin theta) = - frac(s^2 c c' sin^4 theta, r^2) . $ <eq:seed-cross-product>]
  To check all three tensor-divergence components, put $a = sigma_(r phi.alt) = - s^2 c^2 sin^4 theta \/ r^2$ and use the coordinate identity
  $ \( "div"_delta sigma \)_i = 1 / sqrt(det delta) partial_j #scale(x: 120%, y: 120%)[\(] sqrt(det delta) thin sigma_i zws^j #scale(x: 120%, y: 120%)[\)] - 1 / 2 sigma^(j k) partial_i delta_(j k) . $
  The last term vanishes: the metric is diagonal in these coordinates, whereas $sigma^(j k)$ has only $r phi.alt$ and $phi.alt r$ entries. Thus
  #[#set math.equation(numbering: n => "(2.7)")
   $ \( "div"_delta sigma \)_r & = frac(1, r^2 sin theta) partial_phi.alt (frac(a, sin theta)) = 0 \,\
\( "div"_delta sigma \)_theta & = 0 \,\
\( "div"_delta sigma \)_phi.alt & = frac(1, r^2 sin theta) partial_r \( r^2 sin theta thin a \) = a_r + frac(2 a, r) = - frac(2 s^2 c c' sin^4 theta, r^2) . $ <eq:all-divergence-components>]
  This proves (2.2). The last expression also proves the stated support property; for $r gt.eq 2 L$ both fields are radial and parallel.
  Finally, for $j gt.eq 1$ the Cartesian derivatives of $c$ obey
  $ \| partial^alpha c \| lt.eq C_j r^(- j) upright(bold(1))_({ L lt.eq r lt.eq 2 L }) . $
  Indeed, all such derivatives are supported where $r$ is comparable to $L$, and differentiating $chi \( r \/ L \)$ gives this bound. The coefficients of the two uncut primitive one-forms in (2.4) are smooth homogeneous functions of degree $- 1$; exterior differentiation therefore gives the field bounds in (2.3). The uncut Cartesian tensor coefficients are smooth homogeneous functions of degree $- 3$, which gives the tensor bounds by the same product rule. Smooth cutoff jets give the estimates also at $r = L$ and $r = 2 L$. ◻
]

=== 2.1 Reduction to a scalar equation <reduction-to-a-scalar-equation>

For a positive function $u$, define the physical data by

#[#set math.equation(numbering: n => "(2.8)")
 $ g = u^4 delta \, #h(2em) K = u^(- 2) sigma \, #h(2em) cal(E) = u^(- 6) tilde(E) \, #h(2em) cal(B) = u^(- 6) tilde(B) . $ <eq:conformal-data>]

The next calculation fixes the conformal weights and the normalization of the scalar equation directly.

#thm([Lemma 2.2.])[
  (Conformal electrovacuum equations).  #emph[For every smooth positive $u$, the data (2.8) satisfy 
$ tau = "tr"_g K = 0 \, #h(2em) "div"_g cal(E) = "div"_g cal(B) = 0 \, #h(2em) "div"_g K = 2 \( cal(E) times_g cal(B) \)_g^flat . $

 They satisfy the electrovacuum Hamiltonian constraint if and only if 
#[#set math.equation(numbering: n => "(2.9)")
 $ - Delta_delta u = p u^(- 7) + ell u^(- 3) quad upright("on ") Omega \, $ <eq:scalar>]

 where, writing $t = cos theta$, 
#[#set math.equation(numbering: n => "(2.10)")
 $ p & = 1 / 8 \| sigma \|_delta^2 = frac(s^4 c^4 sin^6 theta, 4 r^6) \,\
ell & = 1 / 4 #scale(x: 120%, y: 120%)[\(] \| tilde(E) \|_delta^2 + \| tilde(B) \|_delta^2 #scale(x: 120%, y: 120%)[\)]\
 & = frac(s^2, 4 r^4) [c^2 \( 9 t^4 - 2 t^2 + 1 \) + \( r c' \)^2 \( 1 - t^4 \)] . $ <eq:coefficients>]

 The nonnegative coefficients $p \, ell$ are smooth and rotation invariant. For every Cartesian multi-index $alpha$ of order $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ \| partial^alpha p \| lt.eq C_j s^4 r^(- 6 - j) upright(bold(1))_({ r gt.eq L }) \, #h(2em) \| partial^alpha ell \| lt.eq C_j s^2 r^(- 4 - j) upright(bold(1))_({ r gt.eq L }) . $ <eq:source-coefficient-bounds>]

]
] <lem:conformal>

#proof[
  Since $#h(-0.16667em) upright(d) V_g = u^6 #h(-0.16667em) upright(d) V_delta$, the flux forms are unchanged:
  #[#set math.equation(numbering: n => "(2.12)")
   $ iota_(cal(E)) #h(-0.16667em) upright(d) V_g = iota_(tilde(E)) #h(-0.16667em) upright(d) V_delta \, #h(2em) iota_(cal(B)) #h(-0.16667em) upright(d) V_g = iota_(tilde(B)) #h(-0.16667em) upright(d) V_delta . $ <eq:conformal-fluxes>]
  Their closedness proves the two Maxwell divergence constraints. The cross-product convention gives, for any vector $Z$,
  $ \( cal(E) times_g cal(B) \)_g^flat \( Z \) = #h(-0.16667em) upright(d) V_g \( cal(E) \, cal(B) \, Z \) = u^(- 6) #h(-0.16667em) upright(d) V_delta \( tilde(E) \, tilde(B) \, Z \) . $
  Here is the tensor calculation in Cartesian coordinates. Put $b = 2 log u$, so $g = e^(2 b) delta$ and $K = e^(- b) sigma$. The connection difference is
  $ D_(j k)^i = delta_j^i b_k + delta_k^i b_j - delta_(j k) b^i \, #h(2em) b_j = partial_j b \, $
  with indices on the right raised by $delta$. Symmetry and trace-freeness give
  $ delta^(j k) D_(k i)^l sigma_(l j) = 0 \, #h(2em) delta^(j k) D_(k j)^l = - b^l . $
  Consequently the derivative of $e^(- b)$ cancels the second connection contraction, yielding
  #[#set math.equation(numbering: n => "(2.13)")
   $ "tr"_g K = e^(- 3 b) "tr"_delta sigma = 0 \, #h(2em) \( "div"_g K \)_i = e^(- 3 b) delta^(j k) partial_k sigma_(i j) = u^(- 6) \( "div"_delta sigma \)_i . $ <eq:conformal-divergence>]
  Together with 2, this is exactly the momentum constraint.
  For completeness, substituting the same $D$ into
  $ R_(i j) = partial_k D_(i j)^k - partial_j D_(i k)^k + D_(k l)^k D_(i j)^l - D_(j l)^k D_(i k)^l $
  gives derivative terms $- b_(i j) - delta_(i j) Delta_delta b$ and quadratic terms $b_i b_j - delta_(i j) \| nabla_delta b \|^2$. Contracting therefore gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ R_g = e^(- 2 b) #scale(x: 120%, y: 120%)[\(] - 4 Delta_delta b - 2 \| nabla_delta b \|^2 #scale(x: 120%, y: 120%)[\)] = - 8 u^(- 5) Delta_delta u . $ <eq:conformal-curvature>]
  The norm identities are
  $ \| K \|_g^2 = u^(- 12) \| sigma \|_delta^2 \, #h(2em) \| cal(E) \|_g^2 = u^(- 8) \| tilde(E) \|_delta^2 \, #h(2em) \| cal(B) \|_g^2 = u^(- 8) \| tilde(B) \|_delta^2 . $
  Thus the Hamiltonian constraint $R_g - \| K \|_g^2 = 2 \( \| cal(E) \|_g^2 + \| cal(B) \|_g^2 \)$ becomes (2.9), with the coefficients in (2.10). Those explicit expressions follow from (2.5) and $\| sigma \|_delta^2 = 2 a^2 \/ \( r^2 sin^2 theta \)$. Their smoothness, nonnegativity, and derivative bounds follow either from their definitions as squared norms or directly from 2 and the product rule. ◻
]

We will solve (2.9) with $u arrow.r 1$ at infinity and $partial_r u + u \/ 2 = 0$ on $S$. This boundary condition will make $S$ a future MOTS. A solution and the uniform estimates needed to control all other surfaces are established next.

== 3 The conformal factor <sec:elliptic>

The sources begin at radius $L$. This separation makes their effect near $S$ of order $L^(- 2)$, while their total integral is of order $L^(- 1)$. We prove both estimates by constructing the solution directly.

#thm([Proposition 3.1.])[
  (Uniform conformal factor).  #emph[There is $L_0 > 4$, depending only on the fixed cutoff, such that for every $L gt.eq L_0$ and $s in \[ 0 \, 1 \]$, Equation (2.9) has a smooth axisymmetric solution $u = u_0 + v$ on $Omega$, where $u_0 = 1 + r^(- 1)$, satisfying 
#[#set math.equation(numbering: n => "(3.1)")
 $ u_r + 1 / 2 u = 0 quad upright("on ") S \, #h(2em) u arrow.r 1 quad upright("as ") r arrow.r oo . $ <eq:robin>]

 It is unique among smooth solutions with $v gt.eq 0$ and $v = O \( r^(- 1) \)$. One may take a constant $M = 3$, independent of $s \, L$, such that $1 lt.eq u_0 lt.eq u lt.eq M$. Uniformly in these parameters, 
#[#set math.equation(numbering: n => "(3.2)")
 $ \| v \| + r \| v_r \| & lt.eq C s^2 L^(- 2) &  & \( r gt.eq 1 \) \,\
\| v_(r r) \| & lt.eq C s^2 L^(- 2) &  & \( 1 lt.eq r lt.eq 2 \) . $ <eq:radial-bounds>]

 For every integer $k gt.eq 0$, all Cartesian derivatives satisfy 
#[#set math.equation(numbering: n => "(3.3)")
 $ \| D^k v \| lt.eq C_k s^2 / L r^(- 1 - k) \, #h(2em) \| D^k \( u - 1 \) \| lt.eq C_k r^(- 1 - k) . $ <eq:all-derivative-bounds>]

 For fixed $L$, $s mapsto v_s$ is continuous in the sup norm, as are 
$ s mapsto integral_(bb(R)^3) H_s thin #h(-0.16667em) upright(d) x \, #h(2em) s mapsto N_s \( 0 \) = frac(1, 4 pi) integral_(bb(R)^3) frac(H_s \( x \), \| x \|) thin #h(-0.16667em) upright(d) x \, $

 where $H_s = p u_s^(- 7) + ell u_s^(- 3)$ is extended by zero inside the unit ball and $N_s$ is its Newton potential. Moreover, 
#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq integral_(bb(R)^3) H_s thin #h(-0.16667em) upright(d) x lt.eq C s^2 / L \, #h(2em) 0 lt.eq N_s \( 0 \) lt.eq C s^2 / L^2 . $ <eq:source-integrals>]

 At $s = 0$ the solution is exactly $u_0$.]
] <prop:conformal-factor>

Here and below $D^k$ denotes any Cartesian derivative of order $k$; constants may depend on this order but are independent of $s in \[ 0 \, 1 \]$ and $L gt.eq L_0$. We first record the elementary potential estimates used in the proof.

#thm([Lemma 3.2.])[
  (Newton potential and Robin reflection).  #emph[Suppose $L > 4$ and $H in C \( bb(R)^3 \)$ obeys 
$ \| H \( y \) \| lt.eq a \| y \|^(- 4) upright(bold(1))_({ \| y \| gt.eq L }) . $

 Then 
$ N_H \( x \) = frac(1, 4 pi) integral_(bb(R)^3) frac(H \( y \), \| x - y \|) thin #h(-0.16667em) upright(d) y $

 is well defined and $C^1$, satisfies $- Delta N_H = H$ distributionally, and is smooth and harmonic on ${ \| x \| < L }$. For $j = 0 \, 1$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ \| D^j N_H \( x \) \| lt.eq cases(delim: "{", C_j a L^(- 2 - j) \, & \| x \| lt.eq L \/ 2 \,, C_j a #scale(x: 120%, y: 120%)[\(] r^(- 2 - j) + L^(- 1) r^(- 1 - j) #scale(x: 120%, y: 120%)[\)] \, & r = \| x \| gt.eq L \/ 2 .) $ <eq:newton-bounds>]

 The first estimate holds for every $j gt.eq 0$. The operator 
$ \( cal(R) H \) \( x \) = N_H \( x \) + r^(- 1) N_H \( x \/ r^2 \) \, #h(2em) x in Omega \, $

 preserves nonnegativity, satisfies $- Delta cal(R) H = H$ distributionally and $\( partial_r + 1 / 2 \) cal(R) H = 0$ on $S$, and obeys 
#[#set math.equation(numbering: n => "(3.6)")
 $ parallel cal(R) H parallel_oo lt.eq C a L^(- 2) \, #h(2em) \| cal(R) H \| + r \| partial_r cal(R) H \| lt.eq C a L^(- 2) \,\
\| partial_r^2 cal(R) H \| lt.eq C a L^(- 2) quad \( 1 lt.eq r lt.eq 2 \) . $ <eq:robin-operator-bounds>]

 The homogeneous harmonic Robin problem on $Omega$ has no nonzero solution of order $O \( r^(- 1) \)$.]
] <lem:newton>

#proof[
  The bound on $H$ gives $parallel H parallel_(L^1) lt.eq 4 pi a \/ L$. The Newton kernel and its first derivatives are locally integrable. Localizing around a point and separating a small ball about its kernel singularity proves that the potential and its first derivatives are continuous; the singular part of the gradient integral is bounded by a constant times the ball’s radius. The fundamental-solution identity $- Delta \( 4 pi \| x \| \)^(- 1) = delta_0$, obtained by integration by parts around the pole, therefore gives the distributional equation by Fubini’s theorem.
  For $\| x \| lt.eq L \/ 2$, source separation allows differentiation under the integral to every order and gives
  $ \| D^j N_H \( x \) \| lt.eq C_j a integral_L^oo rho^(- 4) rho^(- 1 - j) rho^2 thin #h(-0.16667em) upright(d) rho lt.eq C_j a L^(- 2 - j) . $
  For $r = \| x \| gt.eq L \/ 2$, split the integral at $\| x - y \| = r \/ 2$. In the inner part $\| y \| gt.eq r \/ 2$, and for $j = 0 \, 1$ its absolute value is at most
  $ C a r^(- 4) integral_(\| z \| lt.eq r \/ 2) \| z \|^(- 1 - j) thin #h(-0.16667em) upright(d) z lt.eq C a r^(- 2 - j) . $
  The outer part is bounded by $C r^(- 1 - j) parallel H parallel_(L^1) lt.eq C a L^(- 1) r^(- 1 - j)$. This proves (3.5).
  Write $I \( x \) = x \/ r^2$. The Kelvin identity in dimension three is
  $ Delta #scale(x: 120%, y: 120%)[\(] r^(- 1) N_H \( I \( x \) \) #scale(x: 120%, y: 120%)[\)] = r^(- 5) \( Delta N_H \) \( I \( x \) \) . $
  Its right side vanishes on $Omega$ because $\| I \( x \) \| lt.eq 1 < L$. Along each ray $x = r omega$, direct differentiation gives
  $ \( cal(R) H \) \( omega \) = 2 N_H \( omega \) \, #h(2em) partial_r \( cal(R) H \) \( omega \) = - N_H \( omega \) \, $
  which proves the Robin condition including its angular dependence. Positivity follows from the two positive kernels. Combining (3.5) in the two radial regions gives the first two bounds in (3.6). For the last bound both potential arguments are separated from the source. More explicitly, put $n \( t \) = N_H \( t omega \)$; then
  $ frac(#h(-0.16667em) upright(d)^2, #h(-0.16667em) upright(d) r^2) #scale(x: 120%, y: 120%)[\(] r^(- 1) n \( r^(- 1) \) #scale(x: 120%, y: 120%)[\)] = 2 r^(- 3) n \( r^(- 1) \) + 4 r^(- 4) n' \( r^(- 1) \) + r^(- 5) n'' \( r^(- 1) \) . $
  The separated estimates for $j = 0 \, 1 \, 2$, together with the corresponding bound for $partial_r^2 N_H \( r omega \)$, give the claim.
  For uniqueness of the homogeneous problem, let $w$ be harmonic on $Omega$, $C^1$ up to $S$, with $w = O \( r^(- 1) \)$ and $w_r + 1 / 2 w = 0$ on $S$. Extend it to $0 < r < 1$ by $r^(- 1) w \( I \( x \) \)$. Values and tangential derivatives match at $S$, and the interior radial derivative there is $- w - w_r = w_r$. Thus the extension $hat(w)$ is distributionally harmonic across $S$ and hence harmonic on $bb(R)^3 \\ { 0 }$. It is bounded near zero and is $O \( r^(- 1) \)$ at infinity. For sufficiently small $epsilon$ and large $R$, the maximum principle applied to $plus.minus hat(w)$ on $epsilon < \| x \| < R$ gives $\| hat(w) \( x \) \| lt.eq C epsilon \/ \| x \| + C \/ R$, with one constant $C$: the harmonic right side bounds the absolute value on both boundary spheres. Letting $epsilon arrow.b 0$ and $R arrow.r oo$ proves uniqueness. ◻
]

#thm([Lemma 3.3.])[
  (Localized derivative bootstrap).  #emph[Let $H$ satisfy the hypotheses of 5. If $H in C^j \( bb(R)^3 \)$, then $N_H in C^(j + 1) \( bb(R)^3 \)$. If, in addition, 
$ \| D^i H \( y \) \| lt.eq a_j \| y \|^(- 4 - i) upright(bold(1))_({ \| y \| gt.eq L }) quad \( 0 lt.eq i lt.eq j \) \, $

 then (3.5) holds through order $j + 1$, with a constant $C_j a_j$ in place of $C_j a$. Consequently the local gain in regularity and the derivative decay use no first moment of $H$.]
] <lem:regularity>

#proof[
  Fix a point $x_0$. Choose a smooth compactly supported cutoff $zeta$ equal to one near $x_0$, and keep this cutoff fixed when differentiating with respect to $x$. Writing $G \( x \) = \( 4 pi \| x \| \)^(- 1)$, for $\| alpha \| = j + 1$ choose $alpha = beta + e_i$, $\| beta \| = j$. Distributional integration by parts gives, near $x_0$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ D^alpha N_H \( x \) = integral_(bb(R)^3) partial_i G \( x - y \) D_y^beta \( zeta H \) \( y \) thin #h(-0.16667em) upright(d) y + integral_(bb(R)^3) D^alpha G \( x - y \) \( 1 - zeta \( y \) \) H \( y \) thin #h(-0.16667em) upright(d) y . $ <eq:localized-kernel>]
  There are no boundary terms since $zeta H$ has compact support. The first integral is continuous by local integrability of $partial_i G$ and the same small-ball argument as above; the second is smooth near $x_0$ by source separation and integrability at infinity. The formula, also applied at lower orders, proves $C^(j + 1)$ regularity.
  For the estimate at $\| x_0 \| = r gt.eq L \/ 2$, take $zeta$ supported in $B \( x_0 \, r \/ 2 \)$ and equal to one on $B \( x_0 \, r \/ 4 \)$, with $\| D^i zeta \| lt.eq C_i r^(- i)$. On its support every Leibniz term in $D^beta \( zeta H \)$ is bounded by $C_j a_j r^(- 4 - j)$. The first integral in (3.7) at $x_0$ is therefore bounded by
  $ C_j a_j r^(- 4 - j) integral_(\| z \| lt.eq r \/ 2) \| z \|^(- 2) thin #h(-0.16667em) upright(d) z lt.eq C_j a_j r^(- 3 - j) . $
  The second is bounded by
  $ C_j r^(- 2 - j) parallel H parallel_(L^1) lt.eq C_j a_j L^(- 1) r^(- 2 - j) . $
  These are precisely the claimed bounds at order $j + 1$; the same argument gives the lower orders. On $\| x \| lt.eq L \/ 2$, differentiation of the separated integral already gives every derivative estimate. ◻
]

#proof[
  The coefficient estimates from Lemma 2.1, Lemma 2.2 imply, for every $j gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| D^j p \| lt.eq C_j s^4 r^(- 6 - j) upright(bold(1))_({ r gt.eq L }) \, #h(2em) \| D^j ell \| lt.eq C_j s^2 r^(- 4 - j) upright(bold(1))_({ r gt.eq L }) . $ <eq:elliptic-coefficient-bounds>]
  Let $cal(C) = { v in C_b \( Omega \) : v gt.eq 0 }$, a complete metric space in the sup norm. For $v in cal(C)$, put
  #[#set math.equation(numbering: n => "(3.9)")
   $ H_v & = p \( u_0 + v \)^(- 7) + ell \( u_0 + v \)^(- 3) \,\
N_v \( x \) & = frac(1, 4 pi) integral_(bb(R)^3) frac(H_v \( y \), \| x - y \|) thin #h(-0.16667em) upright(d) y \,\
T_s \( v \) \( x \) & = N_v \( x \) + r^(- 1) N_v \( x \/ r^2 \) . $ <eq:fixed-point>]
  The source is extended by zero to $bb(R)^3$; this extension is continuous because it vanishes on $r < L$. Since $u_0 + v gt.eq 1$, the mean-value theorem for the negative powers gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ 0 lt.eq H_v & lt.eq C s^2 r^(- 4) upright(bold(1))_({ r gt.eq L }) \,\
\| H_v - H_w \| & lt.eq C s^2 r^(- 4) upright(bold(1))_({ r gt.eq L }) parallel v - w parallel_oo . $ <eq:source-contraction>]
  By 5, $T_s$ maps the whole cone $cal(C)$ into itself, with
  $ parallel T_s \( v \) parallel_oo lt.eq C s^2 L^(- 2) \, #h(2em) parallel T_s \( v \) - T_s \( w \) parallel_oo lt.eq C L^(- 2) parallel v - w parallel_oo . $
  Choose $L_0 > 4$ so large that the second constant is at most $1 \/ 2$ and the first, for $s = 1$, is at most one. The contraction theorem now gives an actual fixed point $v in cal(C)$, unique in that cone. The operator commutes with rotation about the prescribed axis, so its unique fixed point is axisymmetric. It also gives $v = 0$ when $s = 0$. 5 yields (3.2), $1 lt.eq u_0 lt.eq u lt.eq 3$, the Robin condition, and the scalar equation distributionally. The potential bounds give $v = O \( r^(- 1) \)$, hence $u arrow.r 1$.
  For completeness we bootstrap both smoothness and the full decay. The fixed point is $C^1$ by 5; near $S$ it is already smooth by separation of both potential arguments from the source. Suppose derivatives of $u - 1$ through order $j$ have the uniform bounds $C_i r^(- 1 - i)$. The case $j = 0$ follows from (3.5) and $u_0 = 1 + r^(- 1)$. Because $u gt.eq 1$, the chain and product rules with (3.8) give
  $ \| D^i H_v \| lt.eq C_j s^2 r^(- 4 - i) upright(bold(1))_({ r gt.eq L }) quad \( 0 lt.eq i lt.eq j \) . $
  The zero extension is $C^j$ since the source vanishes near $S$. 6 gains one derivative for $N_v$ with the stated bounds. For the reflected term, the separated estimates and the homogeneity of $I \( x \)$ give at every order $k$
  $ \| D^k #scale(x: 120%, y: 120%)[\(] r^(- 1) N_v \( I \( x \) \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\|] lt.eq C_k s^2 L^(- 2) r^(- 1 - k) . $
  In the region $1 lt.eq r lt.eq L \/ 2$, the ordinary term is bounded by $C_k s^2 L^(- 2 - k)$; in the other region it is bounded by $C_k s^2 \( r^(- 2 - k) + L^(- 1) r^(- 1 - k) \)$. Each bound is at most $C_k s^2 L^(- 1) r^(- 1 - k)$ in its region. This proves the next induction step and (3.3) at every order, with constants independent of $L \, s$. In particular $u$ is smooth and solves (2.9) pointwise. If another solution has $v gt.eq 0$ and $v = O \( r^(- 1) \)$, subtracting $cal(R) H_v$ leaves a decaying homogeneous harmonic Robin solution. 5 makes that difference zero; cone uniqueness then identifies the solutions.
  Finally, fix $L gt.eq L_0$. The coefficients have the form $p_s = s^4 p_1$, $ell_s = s^2 ell_1$. Thus uniformly for $v in cal(C)$,
  $ parallel T_s \( v \) - T_t \( v \) parallel_oo lt.eq C L^(- 2) \| s - t \| . $
  Using the contraction constant $1 \/ 2$ in the fixed point equations gives
  $ parallel v_s - v_t parallel_oo lt.eq 2 C L^(- 2) \| s - t \| . $
  Combining this with the pointwise source Lipschitz bound yields
  $ \| H_s \( y \) - H_t \( y \) \| lt.eq C \| s - t \| thin \| y \|^(- 4) upright(bold(1))_({ \| y \| gt.eq L }) . $
  The right side is integrable with both weights $1$ and $\| y \|^(- 1)$. It proves continuity of the two source integrals, and (3.10) gives their quantitative bounds (3.4). Uniform convergence also gives continuity of the restriction $u_s \|_S$, which will imply continuity of the horizon area. No finite first moment or multipole expansion has entered the argument. ◻
]

== 4 The horizon and all enclosing surfaces <sec:geometry>

The estimates for the conformal factor make the coordinate spheres useful barriers. Their positive expansion outside the boundary also gives a closed two-form that compares the boundary area with every enclosing cut.

#thm([Proposition 4.1.])[
  #emph[For all sufficiently large $L$, uniformly for $0 lt.eq s lt.eq 1$, the data constructed in Section 2, Section 3 are smooth source-free electrovacuum data on 
$ Omega = { x in bb(R)^3 : r gt.eq 1 } \, #h(2em) S = { r = 1 } \, $

 with $"tr"_g K = 0$. The metric is complete with its boundary included, has one asymptotically flat end, and satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ g_(i j) - delta_(i j) = O_4 \( r^(- 1) \) \, #h(2em) K_(i j) = O_3 \( r^(- 3) \) \, #h(2em) cal(E)^i \, cal(B)^i = O_3 \( r^(- 2) \) . $ <eq:geometric-falloff>]

 The standard effective $U \( 1 \)$ action preserves all the data and $S$, and $mu$ and $\| J_(upright("con")) \|_g$ are integrable. With the normal toward the end, $S$ is a future MOTS, and no compact smooth embedded enclosing surface in $"int" Omega$, possibly disconnected, has everywhere nonpositive future outward expansion. Every enclosing cut in the sense of 1 has area at least $A = "Area"_g \( S \)$. Moreover, for a constant $C_A$ independent of $s \, L$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ 64 pi lt.eq A lt.eq 64 pi + C_A s^2 / L^2 \, #h(2em) A = 64 pi + O \( s^2 \/ L^2 \) \, $ <eq:area-estimate>]

 and $A \( s \, L \)$ is continuous in $s$ for fixed $L$.]
] <prop:geometry>

#proof[
  The domain is connected and oriented by the standard orientation of $bb(R)^3$; its boundary is a connected two-sphere. Outside each sufficiently large ball it is a single product end. Smoothness up to $S$ and across the rotation axis follows from Lemma 2.1, Proposition 3.1; the constraints and maximality follow from 3. The seeds are invariant under the standard rotations, and uniqueness of the fixed point makes $u$ invariant as well. Thus these rotations preserve $g \, K \, cal(E) \, cal(B)$, with generator $eta = partial_phi.alt$ of period $2 pi$. The action is effective because a rotation fixing every point of $Omega$ has angle $0$ modulo $2 pi$.
  The bound $1 lt.eq u lt.eq M$ gives $delta lt.eq g lt.eq M^4 delta$. The Euclidean intrinsic length metric on the closed exterior is complete: a Cauchy sequence has a Euclidean limit in $Omega$, and local smooth boundary charts show convergence also in the intrinsic length metric. Comparison of curve lengths now proves completeness for $g$ with $S$ included. The derivative bounds in Lemma 2.1, Proposition 3.1 and the product rule give (4.1).
  The electrovacuum constraints identify
  $ mu = frac(\| cal(E) \|_g^2 + \| cal(B) \|_g^2, 8 pi) = O \( r^(- 4) \) \, #h(2em) J_(upright("con")) = frac(\( cal(E) times_g cal(B) \)^(flat_g), 4 pi) . $
  The fields vanish for $r lt.eq L$ and are radial, hence parallel, for $r gt.eq 2 L$. Consequently $J_(upright("con"))$ is supported in the compact annulus $L lt.eq r lt.eq 2 L$. Since $#h(-0.16667em) upright(d) V_g = u^6 #h(-0.16667em) upright(d) x lt.eq M^6 #h(-0.16667em) upright(d) x$, both required densities are integrable. The horizon and enclosing-surface assertions are proved in Lemma 4.2, Lemma 4.3 below. ◻
]

#thm([Lemma 4.2.])[
  #emph[For $L$ sufficiently large, the coordinate sphere $S_r = { r = upright("const") }$ has future outward expansion zero at $r = 1$ and strictly positive at every $r > 1$. No compact smooth embedded enclosing surface in $"int" Omega$, with any finite number of components, is weakly future outer trapped.]
] <lem:positive-spheres>

#proof[
  The normal to $S_r$ toward infinity is $nu_r = u^(- 2) partial_r$. Since $sigma$ has only mixed radial–azimuthal components, $K \|_(T S_r times T S_r) = 0$, including on the axis by smoothness. The mean curvature is therefore also the future outward expansion, and direct divergence gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ theta_(+) \( S_r \) = H_(S_r) = frac(1, u^6 r^2) partial_r \( r^2 u^4 \) = frac(2 W, r u^3) \, #h(2em) W = u + 2 r u_r . $ <eq:sphere-expansion>]
  This formula permits angular dependence of $u$: the normal has no angular components. The Robin condition (3.1) gives $W \( 1 \, omega \) = 0$. For $r gt.eq 2$, (3.2) gives
  $ W = 1 - r^(- 1) + v + 2 r v_r gt.eq 1 / 2 - frac(C s^2, L^2) . $
  On $1 lt.eq r lt.eq 2$, the same estimates yield
  $ W_r = r^(- 2) + 3 v_r + 2 r v_(r r) gt.eq 1 / 4 - frac(C s^2, L^2) . $
  Increasing $L$ once, uniformly over $s in \[ 0 \, 1 \]$, we obtain
  #[#set math.equation(numbering: n => "(4.4)")
   $ W_r gt.eq 1 / 8 \, #h(2em) W gt.eq frac(r - 1, 8) & quad \( 1 lt.eq r lt.eq 2 \) \,\
W gt.eq 1 / 4 & quad \( r gt.eq 2 \) . $ <eq:positive-W>]
  Thus the strict positivity holds even arbitrarily close to $S$.
  Let $Sigma subset "int" Omega$ be any compact smooth embedded enclosing surface, without a symmetry or connectedness restriction. To cover also the interpretation allowing components with interior edges, let $Sigma_(upright("cl"))$ be the union of its components without boundary. The other components do not affect separation. Indeed, a path avoiding $Sigma_(upright("cl"))$ can be perturbed to miss their edges and cross their interiors transversely at finitely many points. For each crossing, choose an embedded arc in that component from the crossing to an edge. A narrow tubular strip along the arc gives a detour on one side of the component, around the edge, and back on the other side, removing the crossing without introducing another. Compactness and disjointness of the components, and their location in $"int" Omega$, let every detour avoid the other components and $S$. Thus any path avoiding $Sigma_(upright("cl"))$ can avoid all of $Sigma$, so $Sigma_(upright("cl"))$ still encloses $S$ and is nonempty.
  Choose $p in Sigma_(upright("cl"))$ where $r$ has its global maximum $R > 1$ on $Sigma_(upright("cl"))$. The increasing radial ray beyond $p$ misses $Sigma_(upright("cl"))$. Starting just beyond $p$, the same detours past any edged components connect this side to infinity without meeting $Sigma$. Hence the prescribed normal at $p$ is $nu_Sigma \( p \) = u \( p \)^(- 2) partial_r$, and $T_p Sigma = T_p S_R$. With the convention $H_Sigma = "div"_Sigma nu_Sigma$, restriction of the ambient Hessian gives, at $p$,
  $ 0 gt.eq Delta_Sigma r = "tr"_(T_p Sigma) nabla_g^2 r - H_Sigma thin nu_Sigma \( r \) = \| nabla_g r \|_g #scale(x: 120%, y: 120%)[\(] H_(S_R) - H_Sigma #scale(x: 120%, y: 120%)[\)] . $
  For the last identity, the tangential Hessian of a defining function for a level surface equals its second fundamental form times the length of its gradient. It follows that $H_Sigma \( p \) gt.eq H_(S_R) \( p \) > 0$. Tangency also gives $"tr"_Sigma K \( p \) = 0$, so $theta_(+) \( Sigma \) \( p \) > 0$. This excludes precisely the condition $theta_(+) lt.eq 0$ everywhere. ◻
]

#thm([Lemma 4.3.])[
  #emph[For the same choices of $L$, every enclosing cut $Gamma = partial D$ from the specified class has $"Area"_g \( Gamma \) gt.eq "Area"_g \( S \)$. Thus $S$ attains the minimum enclosing area, and (4.2) holds.]
] <lem:area-minimum>

#proof[
  Let $pi : Omega arrow.r bb(S)^2$ be the radial projection $pi \( r \, omega \) = omega$, and let $#h(-0.16667em) upright(d) A_(bb(S)^2)$ denote the unit round area form. Define the smooth closed two-form
  $ beta = pi^(*) #scale(x: 120%, y: 120%)[\(] u \( 1 \, omega \)^4 #h(-0.16667em) upright(d) A_(bb(S)^2) #scale(x: 120%, y: 120%)[\)] . $
  It is closed because every two-form on $bb(S)^2$ is closed. Its comass, namely the supremum of $\| beta \( e_1 \, e_2 \) \|$ over $g$-orthonormal pairs, is
  #[#set math.equation(numbering: n => "(4.5)")
   $ parallel beta parallel_(* \, g) \( r \, omega \) = frac(u \( 1 \, omega \)^4, r^2 u \( r \, omega \)^4) lt.eq 1 . $ <eq:calibration-comass>]
  Indeed, $beta$ annihilates radial vectors and its value on an oriented orthonormal angular pair is the displayed ratio. Furthermore,
  $ partial_r \( r u^2 \) = u \( u + 2 r u_r \) = u W > 0 #h(2em) \( r > 1 \) \, $
  by 8; hence $r u \( r \, omega \)^2 gt.eq u \( 1 \, omega \)^2$. The comass estimate controls every tangent plane, so it does not require $Gamma$ to be a radial graph.
  For completeness, take any connected smooth codimension-zero submanifold $D subset Omega$ that is closed in $Omega$, has interior contained in $"int" Omega$, contains the entire sufficiently distant part of the end, and has compact smooth embedded two-sided intrinsic boundary $Gamma$. Choose $R$ beyond that boundary and beyond the radius where $D$ contains the entire end. Then
  $ D_R = D ∩ { r lt.eq R } quad upright("is compact and smooth, with") quad partial D_R = Gamma union.sq S_R . $
  Near $Gamma$ the truncation leaves $D$ unchanged, including at contacts with $S$; near $S_R$ it is a regular level-set truncation in the interior of $D$. These boundary pieces are disjoint, so $D_R$ has no corners. Here $D_R$ inherits the orientation of $Omega$, and its boundary is the #emph[full intrinsic boundary]. In particular, any portion coinciding with $S$ already belongs to $Gamma$ and contributes to this boundary integral. Stokes’ theorem with the induced boundary orientations gives
  $ integral_Gamma beta = - integral_(S_R) beta = - integral_(bb(S)^2) u \( 1 \, omega \)^4 #h(-0.16667em) upright(d) A_(bb(S)^2) = - A . $
  Using (4.5), including all components, we conclude
  $ A = lr(|integral_Gamma beta|) lt.eq integral_Gamma parallel beta parallel_(* \, g) thin #h(-0.16667em) upright(d) A_g lt.eq "Area"_g \( Gamma \) . $
  The choice $D = Omega$ is allowed and gives $Gamma = S$, so the infimum equals $A$ and is attained. No symmetry or finite-perimeter approximation has entered this comparison.
  Finally, $u \( 1 \, omega \) = 2 + v \( 1 \, omega \)$ with $0 lt.eq v \( 1 \, omega \) lt.eq C s^2 \/ L^2$. Since $u lt.eq M$,
  $ 0 lt.eq A - 64 pi = integral_(bb(S)^2) #scale(x: 120%, y: 120%)[\(] \( 2 + v \)^4 - 16 #scale(x: 120%, y: 120%)[\)] #h(-0.16667em) upright(d) A_(bb(S)^2) lt.eq 4 M^3 integral_(bb(S)^2) v thin #h(-0.16667em) upright(d) A_(bb(S)^2) lt.eq C_A s^2 / L^2 . $
  This proves (4.2). Supremum-norm continuity of $v$ in $s$ from 4 also proves continuity of $A \( s \, L \)$. ◻
]

== 5 Asymptotic quantities and the counterexamples <sec:counterexamples>

Fix the cutoff of 2. Throughout this section $L$ is above a single threshold for the preceding construction, uniformly for $s in \[ 0 \, 1 \]$. Write $H$ and $N$ for the source and Newton potential at the fixed point. All constants below are independent of these two parameters once that threshold is fixed.

=== 5.1 Mass, momentum, and charges <mass-momentum-and-charges>

#thm([Proposition 5.1.])[
  #emph[The constructed data have finite asymptotic quantities 
#[#set math.equation(numbering: n => "(5.1)")
 $ P_(upright("ADM")) = 0 \, #h(2em) Q_e = Q_b = 0 \, $ <eq:vanishing-charges>]

 and 
#[#set math.equation(numbering: n => "(5.2)")
 $ m = 2 + 2 N \( 0 \) + frac(1, 2 pi) integral_(bb(R)^3) H \( x \) thin #h(-0.16667em) upright(d) x = 2 + O \( s^2 \/ L \) . $ <eq:mass>]

 In particular $m gt.eq 2$. If $M$ is a uniform upper bound for $u$, then 
#[#set math.equation(numbering: n => "(5.3)")
 $ m - 2 gt.eq frac(s^2, 3 M^3 L) . $ <eq:mass-lower-bound>]

 The angular momentum in (1.4) is 
#[#set math.equation(numbering: n => "(5.4)")
 $ J = - frac(4 s^2, 15) . $ <eq:angular-momentum>]

 For $s > 0$, neither electromagnetic field is identically zero.]
] <prop:charges>

#proof[
  The Cartesian decay $K = O \( r^(- 3) \)$, with $tau = 0$, makes the integrals in (1.4) of order $O \( r^(- 1) \)$. This proves the first part of (5.1).
  The conformal weights leave both Maxwell flux forms unchanged. On every coordinate sphere, the electric flux is
  $ integral_(S_r) iota_(cal(E)) #h(-0.16667em) upright(d) V_g = integral_(S_r) #h(-0.16667em) upright(d) \( f thin #h(-0.16667em) upright(d) phi.alt \) = 2 pi #scale(x: 120%, y: 120%)[\(] f \( r \, pi \) - f \( r \, 0 \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  The identical calculation for $h$ gives zero magnetic flux. Equivalently, these are integrals of globally smooth exact two-forms over closed surfaces. The charge limits are therefore zero.
  Substituting $g_(i j) = u^4 delta_(i j)$ in (1.4) gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ E_(upright("ADM")) = - frac(1, 2 pi) lim_(R arrow.r oo) integral_(S_R) u^3 u_r thin #h(-0.16667em) upright(d) A_delta . $ <eq:conformal-mass-flux>]
  Since $u - 1 = O \( R^(- 1) \)$ and $u_r = O \( R^(- 2) \)$, replacing $u^3$ by one has an integrated error $O \( R^(- 1) \)$. The source $H$ is integrable and the ordinary Newton potential satisfies the exact flux identity
  $ integral_(S_R) N_r thin #h(-0.16667em) upright(d) A_delta = - integral_(B_R) H thin #h(-0.16667em) upright(d) x . $
  For the reflected term, smoothness of $N$ at the origin gives
  $ R^(- 1) N \( omega \/ R \) = frac(N \( 0 \), R) + O \( R^(- 2) \) \, #h(2em) partial_R #scale(x: 120%, y: 120%)[\(] R^(- 1) N \( omega \/ R \) #scale(x: 120%, y: 120%)[\)] = - frac(N \( 0 \), R^2) + O \( R^(- 3) \) . $
  Together with $u_0 = 1 + 1 \/ r$, these identities prove the existence of the limit and the exact formula (5.2). In particular no first-moment assumption on $H$ or multipole expansion of the ordinary potential is needed. The estimates of 4 give $N \( 0 \) = O \( s^2 \/ L^2 \)$, $integral H = O \( s^2 \/ L \)$, and all contributions in (5.2) are nonnegative. Since the linear momentum is zero, $m = E_(upright("ADM"))$.
  On $r gt.eq 2 L$ the cutoff is one, and
  #[#set math.equation(numbering: n => "(5.6)")
   $ tilde(E) = frac(2 s cos theta, r^2) partial_r \, #h(2em) tilde(B) = frac(s \( 3 cos^2 theta - 1 \), r^2) partial_r . $ <eq:radial-tails>]
  Using just the electric field and $u lt.eq M$,
  $ H gt.eq ell u^(- 3) gt.eq frac(s^2 cos^2 theta, M^3 r^4) #h(2em) \( r gt.eq 2 L \) . $
  As $integral_(bb(S)^2) cos^2 theta thin #h(-0.16667em) upright(d) A = 4 pi \/ 3$, this gives
  $ integral H thin #h(-0.16667em) upright(d) x gt.eq frac(2 pi s^2, 3 M^3 L) . $
  The mass formula proves (5.3).
  Finally $nu_r = u^(- 2) partial_r$, $#h(-0.16667em) upright(d) A_g = u^4 #h(-0.16667em) upright(d) A_delta$, and $K = u^(- 2) sigma$, so all conformal weights in the angular-momentum integrand cancel. The gravitational flux at every coordinate sphere is
  #[#set math.equation(numbering: n => "(5.7)")
   $ J_(upright("grav")) \( r \) & := frac(1, 8 pi) integral_(S_r) K \( nu_r \, eta \) thin #h(-0.16667em) upright(d) A_g\
 & = frac(1, 8 pi) integral_(S_r) sigma \( partial_r \, partial_phi.alt \) thin #h(-0.16667em) upright(d) A_delta = - frac(s^2 c \( r \)^2, 4) integral_0^pi sin^5 theta thin #h(-0.16667em) upright(d) theta = - frac(4 s^2 c \( r \)^2, 15) . $ <eq:finite-radius-angular>]
  It is constant for $r gt.eq 2 L$, proving (5.4) and existence of the prescribed limit. The two nonzero angular polynomials in (5.6), multiplied by the positive factor $u^(- 6)$, also prove the final assertion. ◻
]

=== 5.2 The conserved electromagnetic correction <the-conserved-electromagnetic-correction>

The flux (5.7) vanishes near the horizon but not at infinity. The following calculation identifies the boundary term responsible for the difference, using precisely our constraint signs.

#thm([Proposition 5.2.])[
  #emph[Let $A_B = h thin #h(-0.16667em) upright(d) phi.alt$, the smooth magnetic potential one-form in 2. Then 
#[#set math.equation(numbering: n => "(5.8)")
 $ "div"_g (K \( dot.op \, eta \)^(sharp_g) + 2 h cal(E)) = 0 . $ <eq:corrected-divergence>]

 The electromagnetic boundary contribution on every coordinate sphere is 
#[#set math.equation(numbering: n => "(5.9)")
 $ J_(upright("EM")) \( r \) := frac(1, 4 pi) integral_(S_r) h thin iota_(cal(E)) #h(-0.16667em) upright(d) V_g = frac(4 s^2 c \( r \)^2, 15) . $ <eq:electromagnetic-correction>]

 Consequently $cal(J) \( r \) := J_(upright("grav")) \( r \) + J_(upright("EM")) \( r \) = 0$ for all $r gt.eq 1$, whereas $J_(upright("EM")) \( r \) arrow.r 4 s^2 \/ 15$ at infinity.]
] <prop:corrected-flux>

#proof[
  Since $A_B$ is invariant and $A_B \( eta \) = h$, Cartan’s identity gives
  $ iota_eta #h(-0.16667em) upright(d) A_B = - #h(-0.16667em) upright(d) h . $
  Using $#h(-0.16667em) upright(d) A_B = iota_(cal(B)) #h(-0.16667em) upright(d) V_g$ and evaluating on $cal(E)$ gives
  $ cal(E) \( h \) = - #h(-0.16667em) upright(d) V_g \( cal(E) \, cal(B) \, eta \) . $
  The symmetry of $K$ and the Killing equation imply
  $ "div"_g #scale(x: 120%, y: 120%)[\(] K \( dot.op \, eta \)^(sharp_g) #scale(x: 120%, y: 120%)[\)] = \( "div"_g K \) \( eta \) = 2 #h(-0.16667em) upright(d) V_g \( cal(E) \, cal(B) \, eta \) . $
  Combining this with $"div"_g cal(E) = 0$ proves (5.8). Directly from the flux form,
  $ J_(upright("EM")) \( r \) = 1 / 2 integral_0^pi h f_theta thin #h(-0.16667em) upright(d) theta = s^2 c \( r \)^2 integral_0^pi sin^3 theta cos^2 theta thin #h(-0.16667em) upright(d) theta = frac(4 s^2 c \( r \)^2, 15) . $
  Now apply (5.7). ◻
]

There is no singular gauge choice in this computation: $A_B$ is a globally smooth one-form. The scalar $h = A_B \( eta \)$ vanishes on the axis, where $eta = 0$. An additive constant $C$ in a scalar potential would change the boundary contribution only by $C Q_e = 0$. The norm of $A_B$ is $O \( r^(- 1) \)$, while $A_B \( eta \) = h$ need not tend to zero because $lr(|eta|) = O \( r \)$. Moreover, for $s > 0$, the zero-charge fields in (5.6) retain angularly varying $r^(- 2)$ terms. Multiplication by $u^(- 6) = 1 + O \( r^(- 1) \)$ preserves these leading terms. They satisfy (1.3), but they are not $O \( r^(- 3) \)$. The divergence constraint does not prohibit this: in Euclidean space,

$ "div"_delta #scale(x: 120%, y: 120%)[\(] r^(- 2) a \( omega \) partial_r #scale(x: 120%, y: 120%)[\)] = 0 $

for every smooth angular function $a$. No curl-free or stationarity condition is imposed. Thus 11 is consistent with electromagnetic angular-momentum conservation; it is the identification of that conserved flux with (1.4) which fails here.

=== 5.3 Strict violation and nondegenerate equality <strict-violation-and-nondegenerate-equality>

The area estimate and angular momentum already give, uniformly in the family,

#[#set math.equation(numbering: n => "(5.10)")
 $ A gt.eq 64 pi > frac(32 pi, 15) gt.eq 8 pi lr(||) J . $ <eq:strict-branch>]

Since $Q = 0$, this is the strict physical area branch. Set

#[#set math.equation(numbering: n => "(5.11)")
 $ D \( s \, L \) = m \( s \, L \)^2 - frac(A \( s \, L \), 16 pi) - frac(4 pi J \( s \, L \)^2, A \( s \, L \)) . $ <eq:defect>]

By (4.2), (5.2), and (5.4),

#[#set math.equation(numbering: n => "(5.12)")
 $ lim_(L arrow.r oo) D \( 1 \, L \) = - 1 / 225 . $ <eq:negative-limit>]

Hence $D \( 1 \, L \) < 0$ for all sufficiently large finite $L$.

#thm([Proposition 5.3.])[
  #emph[For every sufficiently large fixed $L$, there exists $s_(*) in \( 0 \, 1 \)$ such that $D \( s_(*) \, L \) = 0$. These equality data satisfy the strict branch (5.10) and have no Kerr–Newman realization with the specified asymptotic parameters and induced fields.]
] <prop:equality>

#proof[
  Write the uniform area estimate as
  $ 64 pi lt.eq A lt.eq 64 pi + C_A s^2 \/ L^2 . $
  The lower mass bound (5.3) and $A gt.eq 64 pi$ imply
  #[#set math.equation(numbering: n => "(5.13)")
   $ D \( s \, L \) gt.eq frac(4 s^2, 3 M^3 L) - frac(C_A s^2, 16 pi L^2) - s^4 / 225 . $ <eq:positive-small-amplitude>]
  Choose $L$ above the thresholds for the previous propositions, (5.12), and positivity of the quadratic coefficient on the right of (5.13). For this fixed $L$, the right side is positive at sufficiently small nonzero $s$.
  The fixed point depends continuously on $s$ in the supremum norm. Restriction to $S$ therefore gives continuity of $A$, and the integrable source bounds give continuity of $N \( 0 \)$ and $integral H$. The mass formula and (5.4) show that $D \( s \, L \)$ is continuous. Its positive value at a nonzero small parameter and its negative value at $s = 1$ yield a root $s_(*) in \( 0 \, 1 \)$ by the intermediate value theorem.
  At this root, $Q_e = Q_b = 0$, $J eq.not 0$, and both electromagnetic fields are nonzero. The strict branch and the equality equation give
  #[#set math.equation(numbering: n => "(5.14)")
   $ m^2 - lr(||) J = frac(\( A - 8 pi lr(||) J \)^2, 16 pi A) > 0 . $ <eq:subextremality>]
  Thus the Kerr–Newman member with these parameters would be a subextremal zero-charge member, namely Kerr with zero Maxwell tensor. Indeed the dyonic Kerr–Newman potential is linear in its electric and magnetic charges; see #cite(label("CKST2018")) Equation (3). When both vanish, $F = 0$. Every spacelike slice then has
  $ \( iota_n F \) \|_(T Omega) = 0 \, #h(2em) star.op_g \( F \|_(T Omega) \) = 0 \, $
  independently of the slice or its future unit normal. This contradicts the nonzero constructed fields, and proves the asserted obstruction. ◻
]

#proof[
  Lemma 2.1, Lemma 2.2, Proposition 3.1, Proposition 4.1 provide smooth maximal electrovacuum data with every topological, asymptotic, boundary, outermostness, and area condition in 1.1. 10 supplies the finite ADM and charge limits, positive mass and zero linear momentum. The physical branch is strict by (5.10). For $s = 1$ and sufficiently large finite $L$, (5.12) gives the first conclusion. For the same large $L$, 12 gives the second. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
