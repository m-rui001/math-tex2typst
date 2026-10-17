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

#align(center)[#text(size: 16pt, weight: "bold")[Area-controlled end replacement and the Bondi--Penrose inequality in the CKS class]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Replacing the end and retaining the area <sec:introduction>

We ask whether a Cha–Khuri–Sakovich hyperboloidal end can be replaced by an asymptotically flat end while leaving a prescribed compact interior unchanged and making the ADM mass approach the Lorentz norm of the hyperboloidal charge. For the Penrose inequality, a mass comparison alone is insufficient. A surface enclosing the inner boundary can travel through the modified end, so its area must remain controlled wherever the replacement occurs.

We construct replacements that preserve the dominant energy condition and give a lower metric comparison on the entire exterior. This controls every enclosing surface at once, including disconnected surfaces and surfaces touching the original boundary. The construction applies to the precise asymptotic class of Cha, Khuri and Sakovich [7]. The end replacement is the main geometric result; the sharp Bondi inequality follows by applying the numerical asymptotically flat inequality to each completed replacement.

=== 1.1 The exterior, its charges and its enclosing cuts <the-exterior-its-charges-and-its-enclosing-cuts>

Let $Omega$ be a connected orientable smooth three-manifold with nonempty compact smooth boundary $S$. Let $g$ be a smooth Riemannian metric and $K$ a smooth symmetric covariant two-tensor, both smooth up to $S$. We require completeness as a metric space with $S$ included, and exactly one coordinate end with compact complement. With $G = c = 1$ and zero cosmological constant, the constraint densities are

#[#set math.equation(numbering: n => "(1.1)")
 $ 16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, #h(2em) 8 pi J = "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] . $ <eq:constraints-definition>]

The dominant energy condition (DEC) is $mu gt.eq \| J \|_g$. For a two-sided surface with normal $nu$ pointing into its end side, write

$ H = "div"_(upright("surface")) nu \, #h(2em) theta_(+) = H + "tr"_(upright("surface")) K \, #h(2em) theta_(-) = H - "tr"_(upright("surface")) K . $

Thus a future marginally outer trapped surface has $theta_(+) = 0$. Our spacetime convention is $K \( Y \, Z \) = overline(g) \( overline(nabla)_Y n_(upright("future")) \, Z \)$; the future unit hyperboloid in Minkowski space has $K = g$.

An #emph[enclosing cut] is $Gamma = partial D$, the intrinsic manifold boundary of a connected smooth codimension-zero submanifold-with-boundary $D subset Omega$ that is closed in $Omega$, contains the whole sufficiently distant end, and has manifold interior in $"int" Omega$. Its full boundary must be compact, smooth, embedded and two-sided. Every component and every portion coinciding with $S$ contributes its area. A cut need not be connected, trapped or minimal. Set

#[#set math.equation(numbering: n => "(1.2)")
 $ A_(min \, g) \( S \) = inf_Gamma "Area"_g \( Gamma \) . $ <eq:area-definition>]

Taking $D = Omega$ shows that the class includes $S$ itself. We neither assume attainment of the infimum nor identify it with $"Area"_g \( S \)$. This distinction matters for the Penrose inequality: Ben-Dov’s spherical example violates the bound using the apparent horizon’s own area, while leaving the minimum-enclosing-area formulation intact [5] Sections 1 and 4.

Let $sigma$ be the unit round metric on $bb(S)^2$. In coordinates $\( r \, omega \)$ on the end, put

$ h = \( 1 + r^2 \)^(- 1) upright(d) r^2 + r^2 sigma \, #h(2em) g = h + a \, #h(2em) K = h + b . $

The CKS class in this paper consists exactly of the expansions

#[#set math.equation(numbering: n => "(1.3)")
 $ a_(r r) & = r^(- 5) m^r + O_3 \( r^(- 6) \) \, & a_(r A) & = O_3 \( r^(- 3) \) \, & a_(A B) & = r^(- 1) m_(A B)^g + O_3 \( r^(- 2) \) \,\
b_(r r) & = O_2 \( r^(- 5) \) \, & b_(r A) & = O_2 \( r^(- 3) \) \, & b_(A B) & = r^(- 1) m_(A B)^K + O_2 \( r^(- 2) \) . $ <eq:cks>]

The leading angular fields are smooth. For a coordinate component, $O_j \( r^(- q) \)$ bounds $r^(q + i) partial_r^i partial_omega^alpha$ through $i + \| alpha \| lt.eq j$ in a finite sphere atlas. Equivalently, one may use angular derivatives and scaled radial derivatives $r partial_r$. No smallness, pointwise sign or symmetry of the leading fields is required. These component rates and derivative orders are those of [7] Equations (2.1)–(2.3).

Writing $n = \( n^1 \, n^2 \, n^3 \)$ for the inclusion $bb(S)^2 subset bb(R)^3$, define

#[#set math.equation(numbering: n => "(1.4)")
 $ M = "tr"_sigma \( m^g + 2 m^K \) + 2 m^r \, #h(2em) \( E_B \, P_B \) = frac(1, 16 pi) integral_(bb(S)^2) \( 1 \, n \) M thin upright(d) A_sigma \,\
m_B = sqrt(E_B^2 - \| P_B \|^2) . $ <eq:bondi>]

We call $\( E_B \, P_B \)$ the #emph[Bondi charge of the initial data]. All statements below concern the explicit CKS functional (1.4) and its Lorentz norm; no spacetime development is assumed. Identifying an initial-data charge with the Bondi–Sachs charge of a cut of null infinity requires an appropriate compatible development and asymptotics; see, for example, [10] Theorem 5.3. We assume $E_B > \| P_B \|$. A chart is #emph[balanced] if $P_B = 0$; then $E_B = m_B > 0$. The second tensor is essential to the aspect $M$. For comparison with Chen, Wang and Yau, set $p = K - g$. Its leading tangential coefficient is $m^K - m^g$, so their mass aspect is

$ 3 / 2 "tr"_sigma m^g + "tr"_sigma \( m^K - m^g \) + m^r = M \/ 2 . $

Their charge factor $1 \/ \( 8 pi \)$ therefore gives exactly (1.4) [8] Definitions 1.3–1.4. Chen, Wang and Yau obtain rest-frame foliations in their asymptotic setting [8] Corollary 4.3. Lemma 4 proves the Lorentz covariance and preservation of the finite derivative class (1.3) needed here.

=== 1.2 The geometric theorem and its numerical consequence <the-geometric-theorem-and-its-numerical-consequence>

For an asymptotically flat end with Cartesian coordinates $x = r n$, our ADM conventions are

#[#set math.equation(numbering: n => "(1.5)")
 $ E & = frac(1, 16 pi) lim_(r arrow.r oo) integral_(\| x \| = r) \( partial_j g_(i j) - partial_i g_(j j) \) n^i thin upright(d) A_delta \,\
P_i & = frac(1, 8 pi) lim_(r arrow.r oo) integral_(\| x \| = r) #scale(x: 120%, y: 120%)[\(] K_(i j) - \( "tr"_g K \) g_(i j) #scale(x: 120%, y: 120%)[\)] n^j thin upright(d) A_delta . $ <eq:adm-energy>]

In Cartesian coordinates $O_j \( r^(- q) \)$ has the usual differentiated decay: an order-$i$ derivative is $O \( r^(- q - i) \)$.

#thm([Theorem 1.1.])[
  (Area-controlled end replacement).  #emph[Let $\( Omega \, g \, K \)$ be a smooth connected orientable three-dimensional exterior, complete including its nonempty compact smooth boundary, with exactly one end of class (1.3). Suppose DEC holds and $E_B > \| P_B \|$. There is a balanced chart such that, for every sufficiently large $R$, smooth data $\( G_R \, k_R \)$ on the same exterior have the following properties:]
  + #emph[They agree with $\( g \, K \)$ on the compact side of $r = R$ and satisfy DEC.]
  + #emph[For numbers $0 lt.eq epsilon_R < 1$ with $epsilon_R arrow.r 0$, $G_R gt.eq \( 1 - epsilon_R \) g$ everywhere on $Omega$.]
  + #emph[The end is asymptotically flat, with $G_R - delta = O_j \( r^(- 1) \)$ for every fixed finite $j$, and $k_R = 0$ sufficiently far out. The constraints are integrable and its charges satisfy $P_R = 0$, $E_R = m_B + eta_R$, where $0 lt.eq eta_R lt.eq 2 R^(- 1 \/ 2)$.]
  #emph[The new exterior is complete and $A_(min \, G_R) \( S \) gt.eq \( 1 - epsilon_R \) A_(min \, g) \( S \)$. No condition on the boundary expansion is needed.]
] <prop:replacement>

The theorem separates the geometry of the end from a numerical inequality. In particular it retains the boundary’s original null expansion, whatever its sign. For a weakly future trapped boundary, the numerical spacetime Penrose inequality gives the following result.

#thm([Corollary 1.2.])[
  (Sharp Bondi inequality in the CKS class).  #emph[Under the hypotheses of Theorem 1, assume $theta_(+) \( S \) lt.eq 0$, with normal into $Omega$, and $A_(min \, g) \( S \) > 0$. Then 
#[#set math.equation(numbering: n => "(1.6)")
 $ sqrt(E_B^2 - \| P_B \|^2) gt.eq sqrt(frac(A_(min \, g) \( S \), 16 pi)) . $ <eq:main>]

 The boundary may be disconnected. For every $m > 0$ there is a horizon-regular Schwarzschild hyperboloidal exterior attaining equality with $m_B = m$ and $A_(min \, g) \( S \) = 16 pi m^2$.]
] <cor:cks-inequality>

This gives the sharp Bondi–Penrose bound in the specified CKS class, using the numerical spacetime Penrose theorem of [15] Definitions 1.1–1.2 and Theorem 1.3 in dimension three. Section 6.3 states that input and checks its full hypotheses for each fixed replacement. The geometric theorem also gives a conditional implication from the corresponding asymptotically flat inequality, recorded in Section 6.3.0.1. The sharpness examples exclude additional closed horizons of either time orientation.

=== 1.3 Predecessors and the construction <predecessors-and-the-construction>

Penrose’s mass–area comparison arose from gravitational collapse, cosmic censorship and the area theorem [16]. For time-symmetric asymptotically flat data, Huisken and Ilmanen’s weak inverse mean curvature flow proves the bound for each connected component of an outermost minimal horizon [13]. Bray’s conformal flow gives the sharp bound for the total area of a possibly disconnected outer-minimizing minimal horizon [6]. The extension to a general second fundamental form must retain an area comparison while controlling both constraint densities.

In the hyperboloidal setting, Cha, Khuri and Sakovich reduce the sharp inequality to a generalized Jang equation coupled to weak inverse mean curvature flow, with the required boundary behavior and asymptotics and a connected outermost apparent horizon [7] Theorem 3.2. Their prescribed-warping existence theorem solves the generalized Jang equation alone [7] Theorem 3.4; it does not establish existence for the coupled system. Sakovich’s ordinary Jang argument proves positive energy in a weighted asymptotically hyperbolic class [17] Theorem 1.1.

Null-geometric approaches make the role of the limiting cut and observer explicit. Mars and Soria compare a trapped cross-section with the limiting Hawking energy along a distinguished null foliation; identifying that limit with Bondi energy requires their large-sphere condition [14] Theorems 2–3. In a controlled perturbative vacuum regime near Schwarzschild, Alexakis constructs a nearby marginally trapped sphere and an asymptotically round null foliation giving a Bondi-energy inequality at its new limiting cut [1] Theorem 1.3 and Section 2.1.

For nonsymmetric initial data, Allen, Bryden, Kazaras and Khuri prove a universal suboptimal-constant inequality for invariant ADM mass in the asymptotically flat case and for the chosen end’s energy under Wang-type hyperboloidal asymptotics [2] Theorems 1.1 and 1.3. Their area is the least enclosing area of a selected outermost apparent horizon. Ellithy’s future-development approach bounds actual horizon-section area under quasi-final-state and further Bondi–Sachs hypotheses [12] Theorem 4.12, Remark 4.14 and Theorem C.1. Its final Bondi quantity is defined in the specified Bondi–Sachs foliation. These results distinguish the initial-data norm, a foliation’s energy, and the area being bounded.

Our construction is related to earlier geometric changes of an end. The radial-lapse ansatz belongs to Bartnik’s quasi-spherical framework [3][4] Section 5. Chruściel and Delay bend an exactly hyperbolic end to a flat end through a Minkowski graph, preserving the compact side and DEC [9] proof of Theorem 4.2. Their model has zero charge and uses the opposite time orientation. Corvino and Huang’s localized deformation theory addresses the additional difficulty that a metric change also changes the norm of the momentum density [11] Introduction and Equation (1.1). Ellithy’s late-time comparison likewise attaches a quasi-spherical Riemannian end before applying inverse mean curvature flow [12] Appendix C, proof of Theorem C.1. The target here is a DEC replacement of the fixed CKS initial-data exterior, with positive charge approximated by ADM mass and a global lower metric bound protecting every enclosing cut. The collar and bending estimates establish these properties directly.

The proof begins with a radial vacuum model in Section 2. It shows how the tangential tensor trace can be reduced to zero while retaining a mass variable. An arbitrary angular mass aspect creates two additional terms: a Laplacian in energy and a gradient in momentum. Heat evolution cancels the first, and a trace-free sphere tensor cancels the second. Its divergence equation has precisely a first-harmonic obstruction; Lorentz balancing removes that obstruction.

Before bending, the original leaves must be made round. Because the input DEC may be saturated, this cannot be justified by smallness alone. Section 3 supplies the constraint identities, and Section 4 constructs a collar whose added constraint vector lies in the future causal cone. The estimates retain the activation cutoff as a factor, even at its flat initial endpoint. Section 5 then performs the angularly corrected bending. Heat starts while the tangential tensor trace still has its hyperboloidal value; the trace-free correction enters as bending begins. Section 6 computes the ADM charges at fixed $R$, compares every cut, and applies the numerical theorem before letting $R arrow.r oo$. Section 7 supplies actual equality examples. Vanishing comparison errors alone do not classify equality for general hyperboloidal data.

== 2 The radial model and the angular obstruction <sec:model>

We first isolate the operation that will change the end. On a round sphere, the mean curvature and the tangential trace of $K$ are distinct quantities. Their difference of squares determines a local mass. This permits us to lower the tensor trace without prescribing that the future null expansion should vanish.

Fix $m > 0$ and a smooth function $v = v \( r \)$. On any interval where $1 + v^2 > 2 m \/ r$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ u^2 = 1 + v^2 - 2 m \/ r \, #h(2em) G = u^(- 2) upright(d) r^2 + r^2 sigma \, #h(2em) N = u partial_r \,\
k \( N \, N \) = v' \, #h(2em) k \( N \, dot.op \) \|_(T bb(S)^2) = 0 \, #h(2em) k_T = \( v \/ r \) r^2 sigma . $ <eq:radial-model>]

The positivity condition holds, for example, on $r > 2 m$. The leaves have mean curvature $H = 2 u \/ r$ and tensor trace $p = 2 v \/ r$. Thus

$ r / 2 \( 1 + v^2 - u^2 \) = m \, #h(2em) theta_(+) = 2 \( u + v \) \/ r . $

Choosing $v = r$ gives the hyperboloidal scale, whereas $v = 0$ gives the spatial Schwarzschild metric. The quantity reduced to zero is $p = 2 v \/ r$, not $theta_(+)$.

These data are vacuum for every such choice of $v$. Indeed the warped-product scalar-curvature calculation gives

$ R_G / 2 = frac(1 - u^2, r^2) - frac(2 u u', r) \, #h(2em) frac(\( "tr"_G k \)^2 - \| k \|_G^2, 2) = frac(2 v v', r) + v^2 / r^2 . $

Their sum is zero by differentiating $u^2 = 1 + v^2 - 2 m \/ r$. The radial momentum equals

$ frac(2 u, r) (v' - v / r) - u partial_r (frac(2 v, r)) = 0 \, $

and the angular momentum vanishes by spherical symmetry. This is the basic flexibility of the construction: changing $v$ alone need not cost any mass.

For general CKS data the corresponding mass is a function of direction. If $m$ in (2.1) is replaced by $F \( r \, omega \)$, then angular derivatives of the lapse appear in both constraints. The energy contains a leading multiple of $Delta_sigma F$ and the angular momentum a leading multiple of $upright(d)_(bb(S)^2) F$. We will evolve the angular function by heat flow and add a trace-free tangential tensor to cancel these terms. The elementary obstruction to the latter step explains why balancing belongs at the beginning of the proof. For a smooth sphere function $f$, write $chevron.l f chevron.r = frac(1, 4 pi) integral_(bb(S)^2) f thin upright(d) A_sigma$.

#thm([Lemma 2.1.])[
  (The first-harmonic obstruction).  #emph[If a smooth trace-free symmetric tensor $T$ on the unit sphere satisfies $"div"_sigma T = upright(d)_(bb(S)^2) f$, then $integral_(bb(S)^2) f n^i thin upright(d) A_sigma = 0$ for $i = 1 \, 2 \, 3$. Conversely, every smooth $f$ satisfying these three conditions admits such a tensor.]
] <lem:obstruction>

#proof[
  The coordinate functions satisfy $nabla_sigma^2 n^i = - n^i sigma$ and $Delta_sigma n^i = - 2 n^i$. Integration by parts gives
  $ 2 integral_(bb(S)^2) f n^i = integral_(bb(S)^2) chevron.l upright(d) f \, upright(d) n^i chevron.r = - integral_(bb(S)^2) T : nabla^2 n^i = 0 . $
  For the converse, write $f = chevron.l f chevron.r + sum_(ell gt.eq 2) f_ell$ in spherical harmonics and let $lambda_ell = ell \( ell + 1 \)$. The function
  $ psi = sum_(ell gt.eq 2) frac(f_ell, 1 - lambda_ell \/ 2) $
  is smooth: repeated integration by parts makes the harmonic coefficients decay faster than any fixed power of $lambda_ell$. On the unit sphere, commuting derivatives gives
  $ "div"_sigma \( nabla^2 psi \)^(upright("TF")) = upright(d)_(bb(S)^2) \( 1 / 2 Delta_sigma psi + psi \) = upright(d)_(bb(S)^2) f . $
  Thus $T = \( nabla^2 psi \)^(upright("TF"))$ works. The constant mode contributes no gradient; only degree one obstructs the inversion. ◻
]

In a balanced chart $f_(*) = M \/ 4$ has mean $m_B$ and vanishing first harmonic. We next prove the existence of that chart and bring the original geometry to round leaves. The small increasing mass correction used in that collar will continue through the bending. It supplies a positive DEC margin after the two leading angular terms have canceled. The round-leaf radial-lapse metric is a zero-shift instance of Bartnik’s quasi-spherical framework [3,4]. Here both the metric and the second tensor vary, and both constraint inequalities are proved directly rather than imported from a prescribed-scalar-curvature theorem.

== 3 Balancing and the constraint identities <sec:geometry>

The round model suggests which quantities to preserve, but the given end need not have round leaves or a radial mass aspect. We begin by choosing coordinates in which the Bondi momentum vanishes. This change does not alter the data; it removes the first spherical harmonic of the mass aspect, which is the obstruction to the angular divergence equation used later. We then write the constraints for the original, generally nonround leaves. These identities will let us round them without losing the dominant energy condition.

All remainder estimates below have the componentwise, differentiated meaning in (1.3). Only three derivatives of the metric remainder and two of the tensor remainder are used.

=== 3.1 A balanced end chart <a-balanced-end-chart>

#thm([Lemma 3.1.])[
  (Lorentz balancing).  #emph[Let smooth data $\( g \, K \)$ have an end in the asymptotic class (1.3), with charges defined by (1.4). This class is preserved by the coordinate changes induced by proper orthochronous Lorentz transformations of the background unit hyperboloid. In the pullback convention described below, the charge vector transforms by 
$ \( E'_B \, P'_B \) = cal(L)^(- 1) \( E_B \, P_B \) . $

 Consequently, if $E_B > \| P_B \|$, there is an end chart in the same class in which $E'_B = m_B$ and $P'_B = 0$. In this chart the smooth function 
#[#set math.equation(numbering: n => "(3.1)")
 $ f_(*) := M / 4 #h(2em) upright("satisfies") #h(2em) frac(1, 4 pi) integral_(bb(S)^2) f_(*) thin upright(d) A_sigma = m_B \, #h(2em) integral_(bb(S)^2) f_(*) n^i thin upright(d) A_sigma = 0 quad \( i = 1 \, 2 \, 3 \) . $ <eq:balanced-aspect>]

 Large spheres in the new chart still bound compact inner portions of the same exterior.]
] <lem:balance>

#proof[
  Use the Minkowski inner product of signature $\( - \, + \, + \, + \)$ and write
  $ X = \( sqrt(1 + r^2) \, r n \) \, #h(2em) X' = \( sqrt(1 + rho^2) \, rho n' \) \, #h(2em) X = cal(L) X' . $
  Since $cal(L)$ preserves the future null cone, there are a positive smooth function $D$ and a sphere diffeomorphism $Phi$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ cal(L) \( 1 \, n' \) = D \( n' \) \( 1 \, Phi \( n' \) \) . $ <eq:lorentz-boundary>]
  For tangent vectors $Y \, Z$ on the primed sphere, the Minkowski inner product of the derivatives of the left side is $sigma \( Y \, Z \)$. On the right side it is $D^2 \( Phi^(*) sigma \) \( Y \, Z \)$: the derivatives of $D$ multiply a null vector orthogonal to all angular derivatives. Consequently
  #[#set math.equation(numbering: n => "(3.3)")
   $ Phi^(*) sigma = D^(- 2) sigma \, #h(2em) Phi^(*) upright(d) A_sigma = D^(- 2) upright(d) A_sigma . $ <eq:lorentz-conformal>]
  The area formula follows because the sphere is two-dimensional. Expanding $X'$ in powers of $rho^(- 1)$ gives
  $ r = D rho + O \( rho^(- 1) \) \, #h(2em) n = Phi \( n' \) + O \( rho^(- 2) \) \, $
  with the same orders after any fixed number of angular derivatives and applications of $rho partial_rho$. In particular,
  $ partial_rho r = D + O \( rho^(- 2) \) \, #h(2em) partial_A r = O \( rho \) \, #h(2em) partial_rho n = O \( rho^(- 3) \) \, #h(2em) partial_A n = partial_A Phi + O \( rho^(- 2) \) . $
  The metric $h$ keeps its standard form because it is the metric induced on the unit hyperboloid.
  We verify the perturbation orders directly; this avoids requiring a stronger expansion than (1.3). For $a = g - h$, the leading new radial component is
  $ a_(rho rho) = frac(D^(- 3) \( m^r compose Phi \), rho^5) + O_3 \( rho^(- 6) \) . $
  Indeed, the radial–radial term has this coefficient; the old mixed components contribute $O_3 \( rho^(- 6) \)$, and the old angular components contribute $O_3 \( rho^(- 7) \)$. In a new angular–angular component, the old radial–radial and mixed terms have orders $O_3 \( rho^(- 3) \)$ and $O_3 \( rho^(- 2) \)$, respectively. Thus
  $ a_(A B) = frac(D^(- 1) \( Phi^(*) m^g \)_(A B), rho) + O_3 \( rho^(- 2) \) \, #h(2em) a_(rho A) = O_3 \( rho^(- 3) \) . $
  The same calculation for $b = K - h$ gives
  $ b_(rho rho) = O_2 \( rho^(- 5) \) \, #h(2em) b_(rho A) = O_2 \( rho^(- 3) \) \, #h(2em) b_(A B) = frac(D^(- 1) \( Phi^(*) m^K \)_(A B), rho) + O_2 \( rho^(- 2) \) . $
  These statements include their indicated derivatives. To see this without losing a derivative, observe that a new scaled radial or angular derivative is a combination, with uniformly bounded smooth coefficients, of $r partial_r$ and old angular derivatives. Apply the chain and product rules through order three for $a$ and order two for $b$. The coordinate coefficients themselves have expansions to every order. No derivative of the original perturbations beyond these orders is used. Taylor expansion of a leading angular coefficient is harmless: these coefficients are smooth, even though only the stated finite number of weighted derivatives of the remainders is assumed.
  It follows from (3.3) that the mass aspect in (1.4) transforms as
  $ M' = D^(- 3) \( M compose Phi \) . $
  For completeness, the trace in this calculation satisfies $"tr"_sigma \( Phi^(*) T \) = D^(- 2) \( "tr"_sigma T \) compose Phi$ for any covariant two-tensor $T$ on the sphere. Combining the charge definition with (3.2) and (3.3), we obtain
  $ frac(1, 16 pi) integral_(bb(S)^2) \( 1 \, n' \) M' thin upright(d) A_sigma & = frac(1, 16 pi) integral_(bb(S)^2) D^(- 1) \( 1 \, n' \) \( M compose Phi \) thin Phi^(*) upright(d) A_sigma\
 & = cal(L)^(- 1) frac(1, 16 pi) integral_(bb(S)^2) \( 1 \, n \) M thin upright(d) A_sigma . $
  This proves the transformation law for the full charge, including its extrinsic-curvature contribution. It agrees with the charge conventions of [7] Remark 2.1 and [8] Definitions 1.3–1.4.
  Strict timelikeness permits the choice $cal(L) \( m_B \, 0 \) = \( E_B \, P_B \)$, which proves (3.1). Since $D$ is positive on the compact sphere, $r$ and $rho$ are uniformly comparable sufficiently far out. The new chart therefore contains a full tail, and its sufficiently large spheres have compact inner sides, just as in the original end chart. ◻
]

We use this balanced chart from now on and again call its coordinates $\( r \, omega \)$. The original data have not been deformed. We have only put their total charge in its rest frame; the angular function $f_(*)$ may still change sign and need not be small.

=== 3.2 Sphere geometry and the constraints <sphere-geometry-and-the-constraints>

The collar will change both the leaf geometry and the second tensor. To see which changes can preserve DEC, let $\( G \, k \)$ be smooth data on a sphere-foliated portion of the end, with the physical constraint normalization of the introduction. Write

#[#set math.equation(numbering: n => "(3.4)")
 $ G & = U^(- 2) thin upright(d) r^2 + gamma_(A B) \( upright(d) omega^A + s^A upright(d) r \) \( upright(d) omega^B + s^B upright(d) r \) \,\
N & = U \( partial_r - s \) \, #h(2em) U > 0 . $ <eq:foliation>]

Here $gamma$ is the induced sphere metric, $s$ is a sphere-tangential vector field, and $N$ is the unit normal toward increasing $r$. Unless otherwise stated, norms, contractions, traces, and differential operators on a leaf are taken with $gamma$; in particular, $Delta_gamma = "div"_gamma nabla^gamma$. Denote the leaf second fundamental form, mean curvature, and normal acceleration by

#[#set math.equation(numbering: n => "(3.5)")
 $ chi = U / 2 \( partial_r gamma - cal(L)_s gamma \) \, #h(2em) H = "tr"_gamma chi \, #h(2em) B_N = nabla_N^G N = nabla^gamma log U . $ <eq:leaf-geometry>]

Decompose $k$ into its normal, mixed, and tangential parts:

#[#set math.equation(numbering: n => "(3.6)")
 $ L = k \( N \, N \) \, #h(2em) eta = k \( N \, dot.op \) \|_(T bb(S)^2) \, #h(2em) k_T = p / 2 gamma + tau \, #h(2em) "tr"_gamma tau = 0 \,\
hat(chi) = chi - H / 2 gamma . $ <eq:k-decomposition>]

The following scalar variables will be central:

#[#set math.equation(numbering: n => "(3.7)")
 $ d & = r / 4 "tr"_gamma \( partial_r gamma - cal(L)_s gamma \) \, & u & = frac(r H, 2) = U d \,\
v & = frac(r p, 2) \, & F & = r / 2 \( 1 + v^2 - u^2 \) . $ <eq:mass-variables>]

Here $u$ is the rescaled mean curvature and $v$ is the rescaled tangential trace of $k$. The quantity $F$ is their mass combination; it agrees with the constant mass in the radial model. We use these variables only where $u \, d > 0$. The scalar $d$ records the effect of the nonround leaves on the relation $u = U d$. It is distinct from the differential $upright(d)$; write $upright(d)_(bb(S)^2)$ for the angular differential.

#thm([Lemma 3.2.])[
  (Constraint decomposition).  #emph[For the smooth data $\( G \, k \)$ in (3.4), assume $u \, d > 0$ and use the decomposition (3.6). Let $C = 8 pi mu$, $Q = 8 pi J \( N \)$, and $Z = 8 pi J \|_(T bb(S)^2)$. Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ C =  & R_gamma / 2 - N H - U Delta_gamma \( U^(- 1) \) - 3 / 4 H^2 - 1 / 2 \| hat(chi) \|^2 + L p + 1 / 4 p^2 - 1 / 2 \| tau \|^2 - \| eta \|^2 \,\
Q =  & H \( L - p \/ 2 \) - hat(chi) : tau - N p + "div"_gamma eta - 2 eta \( B_N \) \,\
Z =  & U \( partial_r eta - cal(L)_s eta \) + H eta + "div"_gamma tau - upright(d)_(bb(S)^2) \( L + p \/ 2 \) + \( L gamma - k_T \) \( B_N \, dot.op \) . $ <eq:constraints>]

 In particular, the dominant energy condition is exactly $C gt.eq sqrt(Q^2 + \| Z \|_gamma^2)$. Moreover, $L$ cancels from the combination 
#[#set math.equation(numbering: n => "(3.9)")
 $ C - v / u Q =  & frac(2 N F, u r^2) + (R_gamma / 2 - 1 / r^2) + (U / u - 1) frac(2 - 6 F \/ r, r^2) - U Delta_gamma \( U^(- 1) \)\
 & - 1 / 2 #scale(x: 120%, y: 120%)[\(] \| hat(chi) \|^2 + \| tau \|^2 #scale(x: 120%, y: 120%)[\)] + v / u hat(chi) : tau - \| eta \|^2 - v / u #scale(x: 120%, y: 120%)[\(] "div"_gamma eta - 2 eta \( B_N \) #scale(x: 120%, y: 120%)[\)] . $ <eq:mass-identity>]

]
] <lem:constraints>

#proof[
  The first formula of (3.5) is the tangential restriction of $cal(L)_N G \/ 2$. For a tangential vector field $Y$, $\[ N \, Y \]$ has normal component $- Y \( log U \) N$. Metric compatibility and torsion freeness then give $G \( nabla_N N \, Y \) = Y \( log U \)$, proving the acceleration formula, including its sign.
  The normal Ricci identity and the Gauss equation give, respectively,
  $ "Ric"_G \( N \, N \) = "div"_G B_N - N H - \| chi \|^2 \, #h(2em) R_G = R_gamma + 2 "Ric"_G \( N \, N \) + \| chi \|^2 - H^2 . $
  Since $B_N$ is tangential,
  $ "div"_G B_N = "div"_gamma B_N - \| B_N \|^2 = - U Delta_gamma \( U^(- 1) \) . $
  Thus
  $ R_G = R_gamma - 2 N H - 3 / 2 H^2 - \| hat(chi) \|^2 - 2 U Delta_gamma \( U^(- 1) \) . $
  Also
  $ \( "tr"_G k \)^2 - \| k \|_G^2 = 2 L p + 1 / 2 p^2 - \| tau \|^2 - 2 \| eta \|^2 . $
  Their half-sum is the asserted expression for $C$.
  Here are the momentum calculations, with the normal-acceleration terms retained. The one-form $k \( N \, dot.op \)$ on the ambient space is $L N^flat + eta$, where $eta \( N \) = 0$. Its divergence is
  $ "div"_G #scale(x: 120%, y: 120%)[\(] k \( N \, dot.op \) #scale(x: 120%, y: 120%)[\)] = N L + H L + "div"_gamma eta - eta \( B_N \) . $
  To obtain $\( "div"_G k \) \( N \)$, subtract the contraction of $k$ with $nabla N$, namely $eta \( B_N \) + chi : k_T$. Subtracting also $N \( "tr"_G k \) = N \( L + p \)$ gives
  $ Q = H L - chi : k_T - N p + "div"_gamma eta - 2 eta \( B_N \) \, $
  which is the second identity in (3.8).
  For the tangential component, choose a leaf-orthonormal frame $e_1 \, e_2$ at the point of calculation and a tangential vector $Y$. The tangential terms in $\( "div"_G k \) \( Y \)$ are
  $ sum_(a = 1)^2 \( nabla_(e_a)^G k \) \( e_a \, Y \) = \( "div"_gamma k_T \) \( Y \) + H eta \( Y \) + eta #scale(x: 120%, y: 120%)[\(] chi \( Y \, dot.op \)^sharp #scale(x: 120%, y: 120%)[\)] . $
  Writing $X = partial_r - s$, one has
  $ nabla_N^G Y = chi \( Y \, dot.op \)^sharp + U \[ X \, Y \] - Y \( log U \) N . $
  Consequently, the normal term is
  $ \( nabla_N^G k \) \( N \, Y \) =  & U \( partial_r eta - cal(L)_s eta \) \( Y \) - eta #scale(x: 120%, y: 120%)[\(] chi \( Y \, dot.op \)^sharp #scale(x: 120%, y: 120%)[\)]\
 & + \( L gamma - k_T \) \( B_N \, Y \) . $
  Adding these formulas cancels the two contractions with $chi$. Finally subtract $Y \( L + p \)$ and use $"div"_gamma k_T = 1 / 2 upright(d)_(bb(S)^2) p + "div"_gamma tau$. This proves the formula for $Z$.
  To verify (3.9), first note that $p \/ H = v \/ u$, so that the terms involving $L$ cancel. Set $A = u^2 - v^2 = 1 - 2 F \/ r$. The squared trace terms become $- 3 A \/ r^2$, whereas $N r = U$ gives
  $ - N H + v / u N p = - frac(N A, u r) + frac(2 A U, u r^2) . $
  Substituting $N A = - 2 N F \/ r + 2 F U \/ r^2$, their sum is
  $ frac(2 N F, u r^2) - 1 / r^2 + (U / u - 1) frac(2 - 6 F \/ r, r^2) . $
  The remaining terms of (3.8) are precisely those in (3.9). ◻
]

The identities separate the two adjustments needed in the collar. Changing $L$ changes the constraints without introducing a radial derivative of $L$. Changing $F$ produces the first-derivative term $2 N F \/ \( u r^2 \)$ in (3.9), where $L$ has canceled. We will use a radial addition to $L$ for the large null component of the constraint increment and a slowly increasing addition to $F$ for the small component. Their sizes will also control the angular momentum increment.

=== 3.3 The original data in foliation variables <the-original-data-in-foliation-variables>

Before changing the data, we identify the sizes of these variables. Put a subscript $0$ on the quantities associated with $G_0 = g$ and $k_0 = K$. In particular, the limit of $F_0$ must contain the leading coefficients of both tensors, because it is the Bondi mass aspect that must survive the replacement.

#thm([Lemma 3.3.])[
  #emph[For smooth data in the class (1.3), expressed in the balanced chart of Lemma 4, the original foliation variables satisfy 
#[#set math.equation(numbering: n => "(3.10)")
 $ r^(- 2) gamma_0 & = sigma + m^g / r^3 + O_3 \( r^(- 4) \) \, & s_0 & = O_3 \( r^(- 5) \) \,\
d_0 & = 1 - frac(3 "tr"_sigma m^g, 4 r^3) + O_2 \( r^(- 4) \) \,\
U_0 / sqrt(1 + r^2) & = 1 - frac(m^r, 2 r^3) + O_2 \( r^(- 4) \) \,\
u_0 / sqrt(1 + r^2) & = 1 - frac(m^r \/ 2 + \( 3 \/ 4 \) "tr"_sigma m^g, r^3) + O_2 \( r^(- 4) \) \,\
v_0 / r & = 1 + frac("tr"_sigma \( m^K - m^g \), 2 r^3) + O_2 \( r^(- 4) \) \, & F_0 & = f_(*) + O_2 \( r^(- 1) \) \,\
L_0 - 1 & = O_2 \( r^(- 3) \) \, & r^(- 1) eta_0 & = O_2 \( r^(- 3) \) \, #h(2em) r^(- 2) tau_0 = O_2 \( r^(- 3) \) . $ <eq:original-asymptotics>]

 In particular, $d_0 \, u_0 \, v_0 > 0$ sufficiently far out.]
] <lem:original-asymptotics>

#proof[
  The tangential metric is $gamma_0 = g_(A B)$, and $s_0^A = gamma_0^(A B) g_(r B)$, which proves the first line. Writing $q_0 = r^(- 2) gamma_0$, the definition of $d_0$ becomes
  $ d_0 = 1 + r / 4 "tr" \( q_0^(- 1) partial_r q_0 \) - r / 2 "div"_(gamma_0) s_0 . $
  The first correction has leading coefficient $- 3 "tr"_sigma m^g \/ \( 4 r^3 \)$; the shift term is $O_2 \( r^(- 4) \)$. This calculation consumes one of the three allowed metric derivatives and leaves the stated two differentiated orders.
  The normal lapse follows from
  $ U_0^(- 2) = g_(r r) - gamma_0 \( s_0 \, s_0 \) = frac(1, 1 + r^2) + m^r / r^5 + O_3 \( r^(- 6) \) \, $
  where $gamma_0 \( s_0 \, s_0 \) = O_3 \( r^(- 8) \)$. Expanding the inverse square root gives the displayed formula for $U_0$; multiplication by $d_0$ gives the formula for $u_0$.
  Next, taking the tangential trace of $K$ gives
  $ p_0 = "tr"_(gamma_0) K_T = 2 + frac("tr"_sigma \( m^K - m^g \), r^3) + O_2 \( r^(- 4) \) \, $
  which proves the expansion of $v_0$. If $alpha = m^r \/ 2 + \( 3 \/ 4 \) "tr"_sigma m^g$ and $beta = 1 / 2 "tr"_sigma \( m^K - m^g \)$, these formulas imply
  $ u_0^2 = 1 + r^2 - frac(2 alpha, r) + O_2 \( r^(- 2) \) \, #h(2em) v_0^2 = r^2 + frac(2 beta, r) + O_2 \( r^(- 2) \) . $
  Since $alpha + beta = M \/ 4$, the definition of $F_0$ yields $F_0 = M \/ 4 + O_2 \( r^(- 1) \)$, with the same two differentiated orders.
  Finally, use $K - g = b - a$ in the normal, mixed, and trace-free tangential components of (3.6). The normal component is $O_2 \( r^(- 3) \)$, the mixed angular covector is $O_2 \( r^(- 2) \)$, and the trace-free angular tensor is $O_2 \( r^(- 1) \)$. The corresponding components of $g$ are $1$, $0$, and $0$. This gives the last line of (3.10); no leading coefficient for $b_(r r)$ is required. ◻
]

== 4 A collar with round leaves <sec:collar>

Our next task is to replace the large leaves by round spheres while retaining the original data on their inner side. The metric change is small, but smallness alone does not preserve a saturated dominant energy condition. Instead, we arrange that the change in the constraint vector is itself future causal.

The construction has two stages on adjacent annuli. On the first we start a positive addition to $F$ and a radial addition to $L$. On the second, with these additions fully active, we interpolate the remaining fields to their round values. The first addition controls the small null component $C - Q$; the second controls $C + Q$. Their product will dominate the square of the angular momentum change. This is why no strictness assumption on the original DEC is needed.

Throughout this section a subscript $0$ denotes the quantities of the original data in the balanced chart. Constants denoted $C_(*)$ or $C_j$ may depend on these data and on fixed cutoff profiles, but not on the large parameter $R$. They are distinct from the constraint density $C$ and its original value $C_0$.

#thm([Lemma 4.1.])[
  (Round-leaf collar).  #emph[Let $\( g \, K \)$ be smooth data in the balanced class (1.3), satisfying the dominant energy condition. For all sufficiently large $R$, there are smooth data $\( G \, k \)$ on the original manifold up to the sphere $r = 3 R$ with the following properties. They equal $\( g \, K \)$ on the entire inner side of $r = R$, satisfy the dominant energy condition, and on $R lt.eq r lt.eq 3 R$ satisfy 
$ \| G - h \|_h lt.eq C_(*) r^(- 3) . $

 On their entire domain they also satisfy $G gt.eq \( 1 - C_(*) R^(- 3) \) g$, after enlarging $C_(*)$ if necessary. The constants and the threshold for $R$ depend on the given data and fixed cutoff profiles, not on $R$. At $r = 3 R$ their full jets agree with the prescription 
$ gamma = r^2 sigma \, #h(2em) s = eta = tau = 0 \, #h(2em) v = r \, #h(2em) F = f_(*) + c_R \( r \) \,\
L = 1 + r^(- 2) \, #h(2em) U = u = sqrt(1 + r^2 - 2 F \/ r) . $

 Here $f_(*) = M \/ 4$ is the balanced mass function, and $c_R$ is smooth, nonnegative, and satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ c_R \( r \) = integral_R^r w \( rho \) rho^(- 3 \/ 2) thin upright(d) rho \, #h(2em) c'_R \( r \) = w \( r \) r^(- 3 \/ 2) \, #h(2em) 0 lt.eq c_R \( r \) lt.eq 2 R^(- 1 \/ 2) quad \( r gt.eq R \) \, $ <eq:mass-padding>]

 where $w$ is nondecreasing, vanishes for $r lt.eq R$, and equals one for $r gt.eq 2 R$. In particular $c_R$ extends by zero across $r = R$.]
] <lem:collar>

#proof[
  Choose smooth nondecreasing cutoff functions $w \, e$ from $0$ to $1$, each a fixed profile of $r \/ R$, so that
  $ & upright("identically zero") & upright("identically one")\
w & r lt.eq R & r gt.eq 2 R\
e & r lt.eq 2 R & r gt.eq 3 R . $
  Use (4.1) to define $c_R$ for all $r gt.eq R$. On the collar $R lt.eq r lt.eq 3 R$ prescribe
  #[#set math.equation(numbering: n => "(4.2)")
   $ gamma & = \( 1 - e \) gamma_0 + e r^2 sigma \, & s & = \( 1 - e \) s_0 \,\
v & = \( 1 - e \) v_0 + e r \, & F & = \( 1 - e \) F_0 + e f_(*) + c_R \,\
L_b & = \( 1 - e \) L_0 + e \, & L & = L_b + w / r^2 \,\
eta & = \( 1 - e \) eta_0 \, & tau & = \( 1 - e \) (tau_0 - 1 / 2 \( "tr"_gamma tau_0 \) gamma) . $ <eq:collar-data>]
  The last expression is trace-free with respect to the new sphere metric. Define $d$ from $gamma \, s$ as in (3.7), and then set
  #[#set math.equation(numbering: n => "(4.3)")
   $ u = sqrt(1 + v^2 - 2 F \/ r) \, #h(2em) U = u \/ d \, #h(2em) k_T = \( v \/ r \) gamma + tau . $ <eq:collar-reconstruction>]
  Together with $k \( N \, N \) = L$ and $k \( N \, dot.op \) \|_(T bb(S)^2) = eta$, these formulas specify $G \, k$. The positive definiteness of $gamma$ follows already from its convex interpolation. The estimates below give $d \, u > 0$ uniformly for large $R$. Also $v_0 \/ r = 1 + O \( r^(- 3) \)$, so this interpolation keeps $v > 0$: no passage through $v = 0$ occurs in the collar. Where $w = e = 0$, we have $c_R = 0$, $u = u_0$, and the original data are recovered exactly. The flat endpoints of the cutoffs then give a smooth join to the unchanged interior. Smoothness here uses the smoothness of the input; the uniform estimates will use only its stated finite derivative bounds.
  #emph[Weighted estimates at the start of the modification.] Write $D = r partial_r$. For an angular tensor $T$, the notation $T = O_omega^j \( w r^(- a) \)$ will mean
  $ sum_(i = 0)^j \| nabla_sigma^i T \|_sigma lt.eq C_(*) w \( r \) r^(- a) \; $
  this notation makes no assertion about radial derivatives. In this proof $delta$ denotes the new quantity minus the original one; for $L_b$ the original quantity is $L_0$.
  The separated supports of the cutoffs imply
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| D^j e \| lt.eq C_j w quad \( j gt.eq 0 \) \, #h(2em) c_R \( r \) lt.eq 2 w \( r \) R^(- 1 \/ 2) lt.eq 2 sqrt(3) thin w \( r \) r^(- 1 \/ 2) quad \( R lt.eq r lt.eq 3 R \) . $ <eq:collar-cutoff-estimates>]
  For the first assertion, $e$ and all its derivatives vanish below $2 R$, whereas $w = 1$ above $2 R$. For the second, use monotonicity to bound $w \( rho \)$ by $w \( r \)$ inside the integral defining $c_R$. No bound on $w' \/ w$ is used.
  The original estimates (3.10), the interpolation formulas, and (4.4) give the following table. The two columns mean a bound for the listed expression and for its difference from the corresponding original expression, respectively.
  #[#set math.equation(numbering: n => "(4.5)")
   $ upright("expression") & upright("bound") & upright("difference bound")\
r^(- 2) gamma - sigma \, med d - 1 & O_omega^2 \( r^(- 3) \) & O_omega^2 \( w r^(- 3) \)\
u \/ sqrt(1 + r^2) - 1 \, med U \/ sqrt(1 + r^2) - 1 & O_omega^2 \( r^(- 3) \) & O_omega^2 \( w r^(- 3) \)\
v \/ r - 1 \, med L_b - 1 \, med eta \/ r \, med tau \/ r^2 & O_omega^2 \( r^(- 3) \) & O_omega^2 \( w r^(- 3) \)\
s & O_omega^2 \( r^(- 5) \) & O_omega^2 \( w r^(- 5) \) . $ <eq:collar-weighted-table>]
  Here and below an omitted factor $w$ means the corresponding unweighted estimate. We justify the derivative assertions needed from this table. The interpolation of $gamma \/ r^2$ and $s$ has the same weighted bounds through three total angular and scaled radial derivatives, by the three derivatives available for $g$. This gives the two angular derivatives of $d$, because
  $ d = r / 4 "tr"_gamma \( partial_r gamma - cal(L)_s gamma \) $
  uses one such derivative. For $v \/ r - 1$ and $eta \/ r$ the weighted bounds also hold after one application of $D$, including the lower angular orders allowed by the two derivatives of $K$. The same holds for $gamma \/ r^2 - sigma$ and $s$. These are the only radial derivative bounds from the table that will be needed.
  For completeness, the mass interpolation has the more informative bounds
  #[#set math.equation(numbering: n => "(4.6)")
   $ delta F = O_omega^2 \( w r^(- 1 \/ 2) \) \, #h(2em) partial_r delta F = w r^(- 3 \/ 2) + O \( w r^(- 2) \) . $ <eq:collar-mass-difference>]
  Indeed,
  $ delta F = e \( f_(*) - F_0 \) + c_R \, #h(2em) partial_r delta F = e' \( f_(*) - F_0 \) - e partial_r F_0 + w r^(- 3 \/ 2) \, $
  and $F_0 - f_(*) = O_2 \( r^(- 1) \)$. Also $F$ and its first two angular derivatives are uniformly bounded. The bounds for $u$ in (4.5) now follow algebraically from
  $ frac(u^2, 1 + r^2) - 1 = frac(v^2 - r^2 - 2 F \/ r, 1 + r^2) \, #h(2em) delta \( u^2 \) = \( v + v_0 \) delta v - 2 delta F \/ r . $
  Thus $u \/ sqrt(1 + r^2)$ is positive and close to one. The already proved bound $d = 1 + O \( r^(- 3) \)$ gives $d > 0$ and the same estimates for $U = u \/ d$. Finally, inverse metrics and their angular derivatives preserve the weighted bounds, so the trace removal in (4.2) gives the claimed bounds for $tau$. None of these steps requires a weighted radial derivative estimate for $u$, $U$, or $d$.
  These estimates also give $\| G - h \|_h lt.eq C_(*) r^(- 3)$. For the mixed term in (3.4), use $gamma \/ r^2 = O \( 1 \)$ and $s = O \( r^(- 5) \)$; for the radial term use $U \/ sqrt(1 + r^2) = 1 + O \( r^(- 3) \)$. To obtain the comparison with the original metric, choose $C_(upright("met") \, 0) \, C_(upright("met") \, 1)$ so that $g lt.eq \( 1 + C_(upright("met") \, 0) R^(- 3) \) h$ and $G gt.eq \( 1 - C_(upright("met") \, 1) R^(- 3) \) h$ throughout the collar. For sufficiently large $R$,
  $ G gt.eq frac(1 - C_(upright("met") \, 1) R^(- 3), 1 + C_(upright("met") \, 0) R^(- 3)) g gt.eq #scale(x: 120%, y: 120%)[\(] 1 - \( C_(upright("met") \, 0) + C_(upright("met") \, 1) \) R^(- 3) #scale(x: 120%, y: 120%)[\)] g . $
  Inside $r = R$ there is equality $G = g$. This proves the metric assertion on the whole constructed region. We must still prove DEC there.
  #emph[The momentum increments.] We compare the constraint quantities of Lemma 5 before and after the modification. Their radial components satisfy
  #[#set math.equation(numbering: n => "(4.7)")
   $ Q_0 = O \( r^(- 3) \) \, #h(2em) delta Q = H w / r^2 + O \( w r^(- 3) \) \, #h(2em) H = 2 + O \( r^(- 2) \) \, $ <eq:collar-momentum-estimates>]
  and the tangential components satisfy
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| Z_0 \|_(gamma_0) = O \( r^(- 3) \) \, #h(2em) \| Z - Z_0 \|_gamma = O \( w r^(- 3) \) . $ <eq:collar-transverse-estimates>]
  Here the subtraction in the last formula is of angular covectors in the fixed end coordinates, so is well defined before comparing their norms. We give the termwise estimates to keep track of the factor $w$.
  Taking the trace-free part of $chi = U / 2 \( partial_r gamma - cal(L)_s gamma \)$ gives
  $ hat(chi) \/ r^2 = O \( r^(- 3) \) \, #h(2em) delta \( hat(chi) \/ r^2 \) = O \( w r^(- 3) \) . $
  In fact the contribution from differentiating the factor $r^2$ in $gamma = r^2 \( r^(- 2) gamma \)$ is $\( U \/ r \) gamma$, which has no trace-free part. The acceleration covector $B_N^flat = upright(d)_(bb(S)^2) log U$ is $O \( r^(- 3) \)$ with difference $O \( w r^(- 3) \)$. For the trace term put $t = v \/ r$ and $t_0 = v_0 \/ r$. The interpolation is $t = \( 1 - e \) t_0 + e$, so
  $ delta t = - e \( t_0 - 1 \) \, #h(2em) partial_r delta t = - e' \( t_0 - 1 \) - e partial_r t_0 = O \( w r^(- 4) \) . $
  Here $t_0 - 1 = O_2 \( r^(- 3) \)$ and $\| r e' \| lt.eq C w$. Together with $p = 2 t$, the angular bounds for $delta t$, and the estimates for $U \, s$, this gives
  $ N p = O \( r^(- 3) \) \, #h(2em) delta \( N p \) = O \( w r^(- 3) \) . $
  In the formula for $Q$ in (3.8), its first term has increment
  $ delta #scale(x: 120%, y: 120%)[\(] H \( L - p \/ 2 \) #scale(x: 120%, y: 120%)[\)] = H w / r^2 + O \( w r^(- 3) \) . $
  The shear contraction is quadratic in tensors of norm $O \( r^(- 3) \)$, while $"div"_gamma eta = O \( r^(- 4) \)$ with difference $O \( w r^(- 4) \)$. The acceleration term is smaller. This proves (4.7).
  For $Z$, work first in angular covector components. The expression
  $ U \( partial_r eta - cal(L)_s eta \) + H eta $
  is $O \( r^(- 2) \)$ with difference $O \( w r^(- 2) \)$: here $eta = O \( r^(- 2) \)$, $partial_r eta = O \( r^(- 3) \)$, and $U = O \( r \)$. Both $"div"_gamma tau$ and $upright(d)_(bb(S)^2) \( L + p \/ 2 \)$ are $O \( r^(- 3) \)$, with differences $O \( w r^(- 3) \)$. In the latter assertion the added radial entry causes no difficulty, because $upright(d)_(bb(S)^2) \( w \/ r^2 \) = 0$. Finally, $\( L gamma - k_T \) \( B_N \, dot.op \)$ obeys at least these bounds by (4.5). Passing from angular components to a $gamma$-covector norm introduces a factor $O \( r^(- 1) \)$. These facts prove (4.8). Notice in particular that no radial derivative of $L$ occurs in either momentum formula.
  #emph[The small null increment.] Put $a = v \/ u$ and $a_0 = v_0 \/ u_0$. The mass identity (3.9), in which $L$ has canceled, gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ delta \( C - a Q \) = 2 w r^(- 7 \/ 2) + O \( w r^(- 4) \) . $ <eq:collar-null-increment>]
  In this expression $delta \( C - a Q \)$ means $\( C - a Q \) - \( C_0 - a_0 Q_0 \)$. To verify it, first note the exact identity
  $ frac(N F, u) = 1 / d \( partial_r F - s^A partial_A F \) . $
  Using (4.6), $partial_r F_0 = O \( r^(- 2) \)$, $s = O \( r^(- 5) \)$, and the weighted bounds for $d \, s$ therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ delta (frac(2 N F, u r^2)) = 2 w r^(- 7 \/ 2) + O \( w r^(- 4) \) . $ <eq:collar-mass-derivative>]
  The remaining terms in (3.9) have the following difference estimates:
  $ upright("term") & upright("difference bound")\
R_gamma \/ 2 - r^(- 2) & O \( w r^(- 5) \)\
\( d^(- 1) - 1 \) \( 2 - 6 F \/ r \) \/ r^2 & O \( w r^(- 5) \)\
U Delta_gamma \( U^(- 1) \) & O \( w r^(- 5) \)\
- 1 / 2 \( \| hat(chi) \|^2 + \| tau \|^2 \) + a hat(chi) : tau - \| eta \|^2 & O \( w r^(- 6) \)\
- a #scale(x: 120%, y: 120%)[\(] "div"_gamma eta - 2 eta \( B_N \) #scale(x: 120%, y: 120%)[\)] & O \( w r^(- 4) \) . $
  For the curvature term write $R_gamma = r^(- 2) R_(r^(- 2) gamma)$ and use the two angular derivatives of the normalized metric. The second row uses $d - 1 = O \( r^(- 3) \)$ and the boundedness of $F$. For the third row put $q = U \/ sqrt(1 + r^2)$; angular differentiation does not act on the radial factor, so $U Delta_gamma \( U^(- 1) \) = q Delta_gamma \( q^(- 1) \)$, with $q - 1 = O_omega^2 \( r^(- 3) \)$ and $delta q = O_omega^2 \( w r^(- 3) \)$. The quadratic row follows from the $O \( r^(- 3) \)$ sphere norms of $hat(chi) \, tau \, eta$ and their weighted differences. The last row uses the divergence estimate above. Changes of inverse metrics in these contractions have relative size $O \( w r^(- 3) \)$ and respect all the displayed bounds. This proves (4.9).
  In particular, neither the scalar-constraint calculation nor the momentum estimates require $w'$: the mass term uses exactly $c'_R = w r^(- 3 \/ 2)$, angular derivatives ignore $w \/ r^2$, and the radial derivative of $L$ has canceled from the constraints. This is why the bounds remain uniform at a flat start of the cutoff.
  #emph[The dominant energy cone.] The reconstruction gives
  $ a - 1 = O \( r^(- 2) \) \, #h(2em) delta a = O \( w r^(- 3) \) . $
  Consequently
  $ delta \( C - Q \) = delta \( C - a Q \) + \( a - 1 \) delta Q + \( a - a_0 \) Q_0 = 2 w r^(- 7 \/ 2) + O \( w r^(- 4) \) . $
  For clarity, fix constants $A_(*) \, B_(*)$, independent of $R$, such that the preceding estimates give
  $ lr(|delta \( C - Q \) - 2 w r^(- 7 \/ 2)|) lt.eq A_(*) w r^(- 4) \, #h(2em) lr(|delta Q - 2 w r^(- 2)|) lt.eq B_(*) w r^(- 3) . $
  Taking $R gt.eq max { 1 \, A_(*)^2 \, B_(*) }$ yields $delta \( C - Q \) gt.eq w r^(- 7 \/ 2)$ and $delta Q gt.eq w r^(- 2)$. In particular, uniformly throughout the collar,
  #[#set math.equation(numbering: n => "(4.11)")
   $ delta C - delta Q gt.eq w r^(- 7 \/ 2) gt.eq 0 \, #h(2em) delta C + delta Q gt.eq w r^(- 2) gt.eq 0 . $ <eq:collar-cone-margins>]
  It remains to compare the tangential momenta in a common norm. At each point choose a linear isometry
  $ I : \( T^(*) bb(S)^2 \, gamma_0^(- 1) \) arrow.r \( T^(*) bb(S)^2 \, gamma^(- 1) \) $
  as follows. On covectors let $A$ be the positive self-adjoint operator, relative to $gamma_0^(- 1)$, determined by
  $ gamma^(- 1) \( alpha \, beta \) = gamma_0^(- 1) \( A alpha \, beta \) . $
  Set $I = A^(- 1 \/ 2)$. Then $gamma^(- 1) \( I alpha \, I beta \) = gamma_0^(- 1) \( alpha \, beta \)$. Since $A - upright("Id") = O \( w r^(- 3) \)$, spectral calculus on a fixed interval around $1$ gives $I - upright("Id") = O \( w r^(- 3) \)$ in the old covector norm. This comparison is pointwise and needs no derivatives of $I$. By (4.8) the covector $W = Z - I Z_0$ satisfies
  $ \| W \|_gamma lt.eq C_1 w r^(- 3) . $
  The product of the two lower bounds in (4.11) is $w^2 r^(- 11 \/ 2)$. Increasing $R$ also to satisfy $R gt.eq C_1^4$ gives
  $ \( delta C \)^2 - \( delta Q \)^2 gt.eq w^2 r^(- 11 \/ 2) gt.eq C_1^2 w^2 r^(- 6) gt.eq \| W \|_gamma^2 . $
  The nonnegativity in (4.11) gives $delta C gt.eq 0$, so the last inequality yields
  $ delta C gt.eq sqrt(\( delta Q \)^2 + \| W \|_gamma^2) . $
  This argument also includes $w = 0$, where all increments vanish exactly. The old dominant energy condition and the triangle inequality in $bb(R) xor T^(*) bb(S)^2$ now give
  $ C = C_0 + delta C & gt.eq sqrt(Q_0^2 + \| I Z_0 \|_gamma^2) + sqrt(\( delta Q \)^2 + \| W \|_gamma^2)\
 & gt.eq sqrt(Q^2 + \| Z \|_gamma^2) . $
  This proves DEC even where the original constraint vector lies on the boundary of the future cone. It also explains why estimating only the scalar constraint would have been insufficient: the angular momentum is controlled by the product of the two null margins.
  Finally, all derivatives of $1 - e$ vanish at $3 R$, and $w = 1$ there. Thus the nonround leaf and mixed fields disappear to every order, $v$ agrees with $r$ to every order, and $d$ agrees with $1$ to every order. Equations (4.2)–(4.3) therefore give exactly the stated jets. The padding continues smoothly to all $r gt.eq 3 R$, with $c'_R = r^(- 3 \/ 2)$ and $0 lt.eq c_R lt.eq 2 R^(- 1 \/ 2)$. These are the round data to which the outer bending construction applies. ◻
]

== 5 Bending the round end <sec:bending>

The collar has produced the round leaves needed for the model of Section 2. We now lower their tangential tensor trace $2 v \/ r$ from $2$ to zero. The angular mass function is not discarded: its mean will become the ADM energy, while its other modes are smoothed by heat evolution. The trace-free correction from Lemma 3 removes the associated angular momentum. The increasing mass term already present in the collar then absorbs all remaining constraint errors.

There are two radial scales. We begin reducing $v \/ r$ at a radius comparable to $R$, but postpone its final cutoff to the annulus $R^2 lt.eq r lt.eq 2 R^2$. By then $v$ and its scaled derivatives are small, so the final cutoff is smooth without a singular estimate involving $1 \/ v$. Heat evolution is activated before either change, while $v = r$.

#thm([Lemma 5.1.])[
  (Angular heat evolution).  #emph[Suppose $f_(*) in C^oo \( bb(S)^2 \)$ has average $m$ and vanishing first spherical harmonic. There are smooth functions $f \( t \, omega \)$ and trace-free symmetric tensors $cal(T) \( t \, omega \)$, for $t gt.eq 0$, such that 
$ partial_t f = Delta_sigma f \, #h(2em) f \( 0 \, dot.op \) = f_(*) \, #h(2em) frac(1, 4 pi) integral_(bb(S)^2) f \( t \, dot.op \) thin upright(d) A_sigma = m \, #h(2em) "div"_sigma cal(T) = upright(d)_(bb(S)^2) f . $

 Every fixed-order angular and time derivative of $f$ and $cal(T)$ is bounded uniformly for $t gt.eq 0$. More precisely, for all nonnegative integers $a \, b$, 
$ parallel nabla_sigma^a partial_t^b \( f - m \) parallel_(L^oo) + parallel nabla_sigma^a partial_t^b cal(T) parallel_(L^oo) lt.eq C_(a \, b) e^(- 6 t) . $

]
] <lem:sphere-heat>

#proof[
  Let $f_(* \, ell)$ be the projection onto the degree-$ell$ spherical harmonics and put $lambda_ell = ell \( ell + 1 \)$. Define
  #[#set math.equation(numbering: n => "(5.1)")
   $ f \( t \) & = m + sum_(ell gt.eq 2) e^(- lambda_ell t) f_(* \, ell) \,\
psi \( t \) & = sum_(ell gt.eq 2) frac(e^(- lambda_ell t), 1 - lambda_ell \/ 2) f_(* \, ell) \, #h(2em) cal(T) = \( nabla_sigma^2 psi \)^(upright("TF")) . $ <eq:spherical-series>]
  The degree-one term is absent by hypothesis. For each $t$, this is the inverse constructed in Lemma 3, applied to $f \( t \)$; hence $"div"_sigma cal(T) = upright(d)_(bb(S)^2) f$. The complete orthogonal decomposition into spherical harmonics converges here with all fixed-order derivatives, even at $t = 0$, because the initial function is smooth. Explicitly, repeated integration by parts gives
  $ parallel f_(* \, ell) parallel_(L^2) lt.eq lambda_ell^(- N) parallel Delta_sigma^N f_(*) parallel_(L^2) #h(2em) \( ell gt.eq 2 \) $
  for every $N$. The $C^a$ norm of a degree-$ell$ harmonic is bounded by a polynomial in $lambda_ell$ times its $L^2$ norm. One can see this directly from the addition formula, whose diagonal value is $\( 2 ell + 1 \) \/ \( 4 pi \)$, and repeated differentiation by rotation fields: these preserve the eigenspace, have $L^2$ operator norm at most $sqrt(lambda_ell)$ there, and span the tangent spaces of the sphere. These polynomial bounds, with $N$ arbitrarily large, justify all differentiations, including time differentiation and the two derivatives defining $cal(T)$. Since $lambda_ell gt.eq 6$ for $ell gt.eq 2$, the same summation gives the asserted exponential decay. Preservation of the average is immediate. ◻
]

We apply Lemma 8 with the balanced aspect $f_(*)$ and $m = m_B$. All constants below may depend on this smooth aspect and on fixed cutoff profiles, but not on the large parameter $R$. We use $C_(*)$ for a positive bound that may increase from line to line, to distinguish such constants from the constraint quantity $C$.

The two coefficients in the bending prescription can be read from the round constraints. To see this, consider first the region after the joining annulus, where the added normal term has disappeared. Take $gamma = r^2 sigma$, $L = v'$, $eta = 0$, and set $A = 1 + v^2$ and $u^2 = A - 2 F \/ r$, temporarily leaving $F$ and $tau$ undetermined. Replacing $u^2$ by $A$ in the angular coefficients, the terms to cancel in the scalar and tangential momentum constraints are, respectively,

$ frac(2 partial_r F, r^2) - frac(Delta_sigma F, r^3 A) \, #h(2em) "div"_gamma tau - frac(v' - v \/ r, r A) upright(d)_(bb(S)^2) F . $

The first expression suggests taking $F = f \( t \( r \) \, omega \) + c_R \( r \)$ with $t' = 1 \/ \( 2 r A \)$; the radial padding then contributes only its positive mass derivative. For the second, since $"div"_sigma cal(T) = upright(d)_(bb(S)^2) f$ and $"div"_gamma = r^(- 2) "div"_sigma$ on covariant sphere tensors, the coefficient of $cal(T)$ must be $r \( v' - v \/ r \) \/ A$. This calculation chooses the formulas. The proof below retains the exact coefficients and all quadratic terms, and starts heat evolution before changing $v \/ r$ to handle the joining annulus.

#thm([Lemma 5.2.])[
  (Outer bending).  #emph[Let $f \, cal(T)$ be the heat evolution and trace-free tensors of Lemma 8, with initial value the balanced aspect $f_(*)$. For all sufficiently large $R$, there are smooth radial functions $t : \[ 3 R \, oo \) arrow.r \[ 0 \, oo \)$, $beta : \[ 3 R \, oo \) arrow.r \[ 0 \, 1 \]$ and $v : \[ 3 R \, oo \) arrow.r \[ 0 \, oo \)$ such that the round data at the outer edge of the collar extend smoothly to $r gt.eq 3 R$, satisfy the dominant energy condition, and have the form 
#[#set math.equation(numbering: n => "(5.2)")
 $ G = u^(- 2) upright(d) r^2 + r^2 sigma \, #h(2em) u^2 = 1 + v^2 - frac(2 F, r) \, #h(2em) F = f \( t \( r \) \, omega \) + c_R \( r \) \,\
k \( N \, N \) = v' + beta / r^2 \, #h(2em) k \( N \, dot.op \) \|_(T bb(S)^2) = 0 \, #h(2em) k_T = v / r gamma + tau \, #h(2em) gamma = r^2 sigma \,\
tau = frac(r \( v' - v \/ r \), 1 + v^2) cal(T) \( t \( r \) \, omega \) \, #h(2em) N = u partial_r . $ <eq:outer-data>]

 Here $0 lt.eq v lt.eq r$, $v = r$ through $6 R$, and $v = 0$ for $r gt.eq 2 R^2$. The tensor $k$ vanishes identically for $r gt.eq 2 R^2$. The function $F$ and every fixed-order mixed angular and scaled radial derivative of $F$ are bounded uniformly in $R$ on $r gt.eq 3 R$.]
] <lem:bending>

#proof[
  #emph[The radial profiles.] Choose fixed smooth functions $phi.alt \, xi$ on $\( 0 \, oo \)$ with
  $ 0 < phi.alt lt.eq 1 \, & phi.alt \( x \) = 1 quad \( x lt.eq 6 \) \, & phi.alt \( x \) = x^(- 3) quad \( x gt.eq 12 \) \,\
0 lt.eq xi lt.eq 1 \, & xi \( x \) = 1 quad \( x lt.eq 1 \) \, & xi \( x \) = 0 quad \( x gt.eq 2 \) \, $
  and set
  #[#set math.equation(numbering: n => "(5.3)")
   $ v \( r \) = r phi.alt \( r \/ R \) xi \( r \/ R^2 \) \, #h(2em) A = 1 + v^2 . $ <eq:bending-profile>]
  We always take $R gt.eq 12$. The profiles can be chosen, and are now fixed, so that $\| \( x partial_x \)^j phi.alt \| lt.eq C_j phi.alt$ for every fixed $j$. Away from the final cutoff, logarithmic derivatives of $v$ are therefore bounded by a constant times $v$. On the final cutoff $R^2 lt.eq r lt.eq 2 R^2$, the preceding profile is $r phi.alt \( r \/ R \) = R^3 \/ r^2 = O \( R^(- 1) \)$; every scaled derivative of the product with $xi \( r \/ R^2 \)$ is also $O \( R^(- 1) \)$. Thus, for every fixed $j$,
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| \( r partial_r \)^j v \| lt.eq C_j sqrt(A) \, #h(2em) upright("in particular") #h(2em) \| r v' \| lt.eq C_1 sqrt(A) . $ <eq:profile-derivatives>]
  This estimate holds across the smooth zero of $v$ without dividing by $v$.
  Choose smooth radial cutoffs $0 lt.eq zeta \, beta lt.eq 1$, with fixed profiles in $r \/ R$, such that
  $ zeta = 0 quad \( r lt.eq 4 R \) \, #h(2em) zeta = 1 quad \( r gt.eq 5 R \) \, #h(2em) beta = 1 med upright("near ") 3 R \, #h(2em) beta = 0 quad \( r gt.eq 5 R \) . $
  Define
  #[#set math.equation(numbering: n => "(5.5)")
   $ t \( r \) = integral_(3 R)^r frac(zeta \( s \), 2 s A \( s \)) thin upright(d) s \, #h(2em) L = v' + beta / r^2 \, $ <eq:heat-time>]
  and prescribe the data by (5.2). Recall that $c'_R = r^(- 3 \/ 2)$ on this entire region. The heat lemma and $0 lt.eq c_R lt.eq 2 R^(- 1 \/ 2)$ bound $F$ uniformly. In particular, after increasing $R$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ 1 / 2 A lt.eq u^2 lt.eq 3 / 2 A \, #h(2em) lr(|u^(- 2) - A^(- 1)|) lt.eq frac(C_(*), r A^2) . $ <eq:lapse-comparison>]
  The data are smooth and positive definite. Near $3 R$, one has $v = r$, $t = 0$, $beta = 1$, and $tau = 0$. Hence all quantities agree with the round endpoint of (4.2). The cutoffs are constant on their designated sides, so this is a smooth match, including all derivatives at the join.
  Figure 1 records the order of the modifications. In particular, heat evolution is fully active and the extra normal entry has disappeared before $v \/ r$ begins to decrease.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.6, 1.3), fill: rgb("#f5f5f5"), stroke: none)
  rect((1.6, 0), (3.5, 1.3), fill: rgb("#e8e8e8"), stroke: none)
  rect((3.5, 0), (5.4, 1.3), fill: rgb("#f5f5f5"), stroke: none)
  rect((5.4, 0), (8.1, 1.3), fill: rgb("#e8e8e8"), stroke: none)
  rect((8.1, 0), (10.7, 1.3), fill: rgb("#f5f5f5"), stroke: none)
  rect((10.7, 0), (13.2, 1.3), fill: rgb("#e8e8e8"), stroke: none)
  line((0, 0), (13.5, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((13.5, 0), [#text(size: 8pt)[$r$]], anchor: "west", padding: 0.1176cm)
  line((1.6, -0.07), (1.6, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.6, -0.09), [#text(size: 8pt)[$R$]], anchor: "north", padding: 0.1176cm)
  line((3.5, -0.07), (3.5, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.5, -0.09), [#text(size: 8pt)[$2R$]], anchor: "north", padding: 0.1176cm)
  line((5.4, -0.07), (5.4, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.4, -0.09), [#text(size: 8pt)[$3R$]], anchor: "north", padding: 0.1176cm)
  line((8.1, -0.07), (8.1, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.1, -0.09), [#text(size: 8pt)[$6R$]], anchor: "north", padding: 0.1176cm)
  line((10.7, -0.07), (10.7, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.7, -0.09), [#text(size: 8pt)[$2R^2$]], anchor: "north", padding: 0.1176cm)
  content((0.8, 0.65), [#box(width: 1.735cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Original#linebreak()data]]])])
  content((2.55, 0.65), [#box(width: 2.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Activate#linebreak()padding]]])])
  content((4.45, 0.65), [#box(width: 2.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Round#linebreak()the leaves]]])])
  content((6.75, 0.65), [#box(width: 2.735cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Heat on;#linebreak()$beta$ off#linebreak()\($v=r$\)]]])])
  content((9.4, 0.65), [#box(width: 2.635cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Bend and smoothly#linebreak()switch off $v$]]])])
  content((11.95, 0.65), [#box(width: 2.535cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[AF tail#linebreak()$k=0$]]])])
})],
    caption: [Figure 1: Order of the end replacement, schematically and not to scale. The padding cutoff $w$ is one before rounding starts. The heat cutoff $zeta$ turns on between $4 R$ and $5 R$, and $beta = 0$ from $5 R$ on, while $v = r$ through $6 R$. The final cutoff of $v$ occurs between $R^2$ and $2 R^2$. Heat evolution and the integrable mass increase continue on the AF tail. ],
  ) <fig:stages>
  The profiles now supply a smooth metric and tensor with the required end behavior. We must verify their dominant energy condition throughout the transition, before using the far end to compute mass.
  #emph[The exact constraints.] Here $d = 1$, $hat(chi) = 0$, $s = 0$, $eta = 0$, and $U = u$. Substituting in (3.8) and (3.9) gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ Q & = frac(2 u beta, r^3) \,\
C & = v / u Q + frac(2 partial_r F, r^2) - u Delta_gamma \( u^(- 1) \) - 1 / 2 \| tau \|_gamma^2 \,\
Z & = "div"_gamma tau + \( L - v \/ r \) upright(d)_(bb(S)^2) log u - tau \( B_N \, dot.op \) \, #h(2em) B_N = nabla^gamma log u . $ <eq:round-constraints>]
  The first formula follows as well directly from $H = 2 u \/ r$, $p = 2 v \/ r$, and $N = u partial_r$; the terms involving $v'$ cancel. These are the constraint quantities of the new data, not prescribed matter fields.
  For the energy equation, direct angular differentiation yields
  #[#set math.equation(numbering: n => "(5.8)")
   $ u Delta_gamma \( u^(- 1) \) & = frac(Delta_sigma F, r^3 u^2) + frac(3 \| nabla^sigma F \|_sigma^2, r^4 u^4) \,\
frac(2 partial_r F, r^2) & = frac(zeta Delta_sigma F, r^3 A) + 2 / r^(7 \/ 2) . $ <eq:laplacian-cancellation>]
  The Laplacian coefficients cancel to the required order. Indeed,
  $ zeta / A - 1 / u^2 = frac(zeta - 1, A) + (1 / A - 1 / u^2) . $
  The first term is supported where $v = r$ and thus is $O \( r^(- 2) \)$; the second is $O \( r^(- 1) A^(- 2) \)$ by (5.6). The angular derivatives of $F$ are uniformly bounded. Moreover (5.4) gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| tau \|_gamma lt.eq frac(C_(*), r^2 sqrt(A)) \, #h(2em) \| B_N \|_gamma lt.eq frac(C_(*), r^2 A) \, #h(2em) upright(d)_(bb(S)^2) log u = - frac(upright(d)_(bb(S)^2) F, r u^2) . $ <eq:tau-acceleration-bounds>]
  Finally, $Q gt.eq 0$. Wherever $beta eq.not 0$ we have $v = r$, so $\| v \/ u - 1 \| = O \( r^(- 2) \)$ and $Q = O \( r^(- 2) \)$. It follows from (5.7)–(5.9) that
  #[#set math.equation(numbering: n => "(5.10)")
   $ C - Q = 2 / r^(7 \/ 2) + O \( r^(- 4) \) . $ <eq:energy-margin>]
  All error constants here are independent of $R$.
  The energy has acquired a positive margin of order $r^(- 7 \/ 2)$. To obtain DEC rather than energy positivity alone, the tangential momentum must be smaller than that margin. Its leading term has its own cancellation. Since $"div"_sigma cal(T) = upright(d)_(bb(S)^2) F$, and the leafwise constant factor $r^2$ rescales the inverse leaf metric, one has
  $ "div"_gamma tau = frac(v' - v \/ r, r A) upright(d)_(bb(S)^2) F . $
  Consequently its exact remaining terms are
  #[#set math.equation(numbering: n => "(5.11)")
   $ Z = [frac(v' - v \/ r, r) (1 / A - 1 / u^2) - frac(beta, r^3 u^2)] upright(d)_(bb(S)^2) F - tau \( B_N \, dot.op \) . $ <eq:gradient-cancellation>]
  In taking its norm, $\| upright(d)_(bb(S)^2) F \|_gamma lt.eq C_(*) \/ r$. Also $\| v' - v \/ r \| lt.eq C_(*) sqrt(A) \/ r$. Equations (5.6) and (5.9) therefore give
  #[#set math.equation(numbering: n => "(5.12)")
   $ \| Z \|_gamma lt.eq frac(C_(*), r^4 A^(3 \/ 2)) + frac(C_(*) beta, r^4 A) lt.eq C_(*) r^(- 4) . $ <eq:momentum-error>]
  For sufficiently large $R$, the positive term in (5.10) dominates both its error and (5.12), uniformly for every $r gt.eq 3 R$. Thus
  $ C gt.eq Q + \| Z \|_gamma gt.eq sqrt(Q^2 + \| Z \|_gamma^2) \, $
  which proves the dominant energy condition. The construction used only denominators $A$ and $u$, both bounded away from zero; in particular, the final vanishing of $v$ causes no singularity.
  #emph[Differentiated bounds and the far end.] With $D = r partial_r$, Equation (5.4) gives $D^j A = O_j \( A \)$ and hence $D^j \( A^(- 1) \) = O_j \( A^(- 1) \)$. Thus all fixed-order scaled derivatives of $A^(- 1)$ are bounded. Equation (5.5) then bounds every positive-order scaled derivative of $t$. All positive-order scaled derivatives of $c_R$ on this region are $O \( r^(- 1 \/ 2) \)$. The chain rule and Lemma 8 give the asserted bounds on $F$, including the two differentiated orders needed for the metric’s asymptotically flat decay.
  For $r gt.eq 2 R^2$ one has $v = v' = beta = 0$, so $L = tau = 0$ and $k = 0$. On this tail,
  $ t \( r \) = 1 / 2 log r + kappa_R \, #h(2em) c_R \( r \) = c_R \( oo \) - 2 r^(- 1 \/ 2) . $
  In particular, the exponential estimate of Lemma 8 gives the useful refinement
  #[#set math.equation(numbering: n => "(5.13)")
   $ F = m_B + c_R \( oo \) - 2 r^(- 1 \/ 2) + O_R \( r^(- 3) \) \, $ <eq:tail-profile>]
  where the remainder obeys the same order after any fixed number of angular and scaled radial derivatives. The subscript allows the decay constant in this last refinement to depend on $R$; the uniform bounds and the dominant energy estimates above do not have that dependence. ◻
]

== 6 Charges, completeness and enclosing area <sec:transfer>

We now finish Theorem 1. All estimates in this section concern the data constructed in Sections 4 and 5; in particular their DEC has already been proved. Subscripts $R$ are suppressed when they are not needed.

=== 6.1 The asymptotically flat output <the-asymptotically-flat-output>

For each fixed sufficiently large $R$, the outer construction has $v = beta = 0$ beyond a finite radius. Therefore $L = 0$, $tau = 0$ and $k = 0$ there, and

#[#set math.equation(numbering: n => "(6.1)")
 $ G = \( 1 - 2 F \/ r \)^(- 1) upright(d) r^2 + r^2 sigma . $ <eq:af-tail>]

Lemma 9 bounds every fixed-order scaled radial and angular derivative of $F$. In Cartesian coordinates $x = r n$ the metric takes the form

$ G_(i j) = delta_(i j) + b thin n_i n_j \, #h(2em) b = \( 1 - 2 F \/ r \)^(- 1) - 1 . $

Every Cartesian derivative can be expressed as $partial_(x_i) = r^(- 1) \( n_i D + X_i \)$, where $D = r partial_r$ and $X_i$ is a smooth tangential field on the unit sphere. Repeatedly applying this identity to $b n_i n_j$ proves $G_(i j) - delta_(i j) = O_j \( r^(- 1) \)$ for every fixed finite $j$. In particular the $O_6$ metric requirement of the numerical input below holds. The round constraint estimates give $C = O \( r^(- 7 \/ 2) \)$ and $J = 0$ on this tail. Since its volume element is comparable to $r^2 upright(d) r thin upright(d) A_sigma$, the constraint densities are integrable. The portion inside a fixed tail sphere is compact and smooth, so integrability holds on the whole exterior.

For completeness, the ADM energy calculation allows angular dependence of $b$. Direct differentiation, using $partial_j n_i = \( delta_(i j) - n_i n_j \) \/ r$, gives

$ \( partial_j G_(i j) - partial_i G_(j j) \) n^i = frac(2 b, r) . $

The derivatives of $b$ cancel after contraction with $n$; there is no assumption that $F$ is radial. Since $r b = 2 F + O \( r^(- 1) \)$, uniformly on the sphere, (1.5) gives

#[#set math.equation(numbering: n => "(6.2)")
 $ E_R = lim_(r arrow.r oo) frac(1, 4 pi) integral_(bb(S)^2) F \( r \, dot.op \) thin upright(d) A_sigma = m_B + c_R \( oo \) \, #h(2em) P_R = 0 . $ <eq:replacement-charges>]

The mean of the heat solution is constant, which proves the second equality. The vanishing of $k$ on the tail proves $P_R = 0$ directly. The bound in (4.1) yields $0 lt.eq c_R \( oo \) lt.eq 2 R^(- 1 \/ 2)$. Because $m_B > 0$, the constructed charges satisfy the strict inequality $E_R > \| P_R \|$. These are the charges of one completed replacement, with $R$ fixed. The constant in the refined tail estimate (5.13) need not be uniform in $R$.

=== 6.2 A comparison for every cut <a-comparison-for-every-cut>

In the balanced chart the original metric satisfies $\| g - h \|_h lt.eq C_(*) r^(- 3)$ for $r gt.eq R$. On $R lt.eq r lt.eq 3 R$, Lemma 7 gives the same estimate for $G$. Beyond $3 R$, the new angular metric is exactly $r^2 sigma$ and has no shift, while

$ u^2 = 1 + v^2 - 2 F \/ r lt.eq 1 + r^2 + 2 parallel F parallel_oo \/ r . $

Write $M_(*) gt.eq parallel F parallel_oo$ for a bound independent of $R$. Since $0 lt.eq v lt.eq r$, comparison of the radial coefficients gives

$ u^(- 2) gt.eq frac(\( 1 + r^2 \)^(- 1), 1 + 2 M_(*) r^(- 3)) gt.eq \( 1 - 2 M_(*) r^(- 3) \) \( 1 + r^2 \)^(- 1) . $

The angular coefficients already agree with those of $h$. Thus $G gt.eq \( 1 - 2 M_(*) r^(- 3) \) h$ on the whole outer region, while $g lt.eq \( 1 + C_(*) r^(- 3) \) h$. Together with the collar comparison and the identity $G = g$ on the compact interior, this gives a constant $C_(upright("met"))$ independent of $R$ such that, with $epsilon_R = C_(upright("met")) R^(- 3)$,

#[#set math.equation(numbering: n => "(6.3)")
 $ G_R gt.eq \( 1 - epsilon_R \) g quad upright("on all of ") Omega . $ <eq:metric-comparison>]

We increase $R$ once so that $0 lt.eq epsilon_R < 1$.

This also proves completeness, including the boundary. A $G_R$-Cauchy sequence is $g$-Cauchy by (6.3), and hence has a limit in $Omega$. The smooth positive metrics induce the same local topology, so it converges in $G_R$ as well. The manifold, its boundary, and its single end have not changed. Compact truncations remain compact after the balancing chart change because old and new radii are comparable sufficiently far out.

On the tangent plane of any smooth cut, the two relative eigenvalues of $G_R$ with respect to $g$ are at least $1 - epsilon_R$. Its area element is therefore at least $\( 1 - epsilon_R \)$ times the original area element. The admissible cuts are the same geometric surfaces for the two metrics, with the same filled-side convention. Taking the infimum over #emph[all] such surfaces gives

#[#set math.equation(numbering: n => "(6.4)")
 $ A_(min \, G_R) \( S \) gt.eq \( 1 - epsilon_R \) A_(min \, g) \( S \) . $ <eq:area-comparison>]

This includes cuts coinciding with the obstacle $S$. It uses neither existence of a minimizing cut nor any identification of its area with the area of $S$. Equations (6.2)– (6.4), together with the smooth DEC construction, prove Theorem 1.

=== 6.3 The numerical input and the Bondi bound <sec:companion-input>

The replacements now have the geometric properties needed for the numerical step. We use the dimension-three case of the companion [15] Definitions 1.1–1.2 and Theorem 1.3, stated here with our physical constraint normalization.

#thm([Theorem 6.1.])[
  (Asymptotically flat numerical input).  #emph[Let $\( X \, q \, k \)$ be a smooth connected orientable three-dimensional exterior, complete including its nonempty compact smooth boundary, with exactly one asymptotically flat coordinate end and compact complement. Suppose that, in Cartesian coordinates, for some $1 \/ 2 < a < 1$, 
$ q_(i j) - delta_(i j) = O_6 \( r^(- a) \) \, #h(2em) k_(i j) = O_5 \( r^(- 1 - a) \) . $

 Use the constraints (1.1) and ADM normalizations (1.5)–(1.5). Assume DEC, integrability of $mu$ and $\| J \|_q$, finite ADM limits, $E > \| P \|$, and $A_(min \, q) \( partial X \) > 0$. If every boundary component satisfies $theta_(+) lt.eq 0$ with normal into $X$, then 
$ sqrt(E^2 - \| P \|^2) gt.eq sqrt(frac(A_(min \, q) \( partial X \), 16 pi)) . $

 The full cut class is that of (1.2), including disconnected cuts and partial or whole coincidence with the boundary. No extension across the boundary, outermostness, outer area-minimization or attainment of the infimum is assumed.]
] <ass:af>

To identify this statement with the cited theorem, its densities satisfy

$ 2 mu_(upright(N)) = R + \( "tr" k \)^2 - \| k \|^2 \, #h(2em) J_(upright(N)) = "div" \( k - \( "tr" k \) q \) . $

Thus $mu_(upright(N)) = 8 pi mu$ and $J_(upright(N)) = 8 pi J$; the common positive factor preserves DEC and integrability. At dimension three its ADM factors are $\[ 2 \( n - 1 \) omega_(n - 1) \]^(- 1) = 1 \/ \( 16 pi \)$ and $\[ \( n - 1 \) omega_(n - 1) \]^(- 1) = 1 \/ \( 8 pi \)$, so the charges are unchanged. Its Definition 1.2 takes the full intrinsic boundary of the connected closed end-containing outer domain, including every component and all contact with the original boundary. This is precisely the cut class in (1.2).

#proof[
  Fix a sufficiently large $R$. The data $\( G_R \, k_R \)$ have the same connected orientable manifold, compact boundary and single end as the original data. Their completeness follows from (6.3). Both tensors agree with $\( g \, K \)$ on a neighborhood of $S$, so its normal, mean curvature, tangential tensor trace and weak future trapping are unchanged. The construction proves DEC and integrable constraint densities. On the completed tail, $G_R - delta = O_6 \( r^(- 1) \)$ and $k_R = 0$, which give the required differentiated rates with $a = 3 \/ 4$. Equation (6.4) and the assumed positivity of $A_(min \, g) \( S \)$ give $A_(min \, G_R) \( S \) > 0$. Finally, (6.2) gives finite charges with $E_R = m_B + c_R \( oo \) > 0 = \| P_R \|$.
  Thus every hypothesis of the companion’s numerical theorem, in the form of Theorem 10, holds for this fixed replacement. Using the comparison of all cuts gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ m_B + c_R \( oo \) gt.eq sqrt(frac(A_(min \, G_R) \( S \), 16 pi)) gt.eq sqrt(frac(\( 1 - epsilon_R \) A_(min \, g) \( S \), 16 pi)) . $ <eq:finite-numerical>]
  Only now let $R arrow.r oo$, using $0 lt.eq c_R \( oo \) lt.eq 2 R^(- 1 \/ 2)$ and $epsilon_R arrow.r 0$. This proves (1.6). The examples in Section 7 establish sharpness. ◻
]

There are two successive infinities in this proof. Radial infinity defines the ADM charges of one completed replacement. The replacement radius tends to infinity only after its numerical inequality has been proved. No convergence of comparison metrics or minimizing cuts is required, and the constant in $O_R \( r^(- 3) \)$ need not be uniform in the replacement radius.

#prodef([Remark 6.2.])[
  (The weaker-decay numerical theorem).  The companion also proves the same inequality directly under $q - delta = O_2 \( r^(- a) \)$, $k = O_1 \( r^(- 1 - a) \)$, $a > 1 \/ 2$, for the same smooth one-ended exterior and full cut class, with physical constraint densities, integrable DEC, finite timelike charges, and weakly future trapped boundary [15] Definition 7.1 and Theorem 7.2. That theorem does not assume positivity of the enclosing infimum. It gives another numerical input for our replacements; its weaker original-data hypotheses are a separate result, not a consequence of changing the exponent in Theorem 10.
]

===== 6.3.1 Dependence on the numerical input. <sec:conditional>

The proof uses the companion only through the displayed asymptotically flat inequality. More generally, this inequality is the sole numerical input needed for the same argument to give the Bondi bound for every weakly future trapped, possibly disconnected boundary under the other hypotheses of Corollary 2. In particular, it applies when $S$ is connected and marginal, and the open exterior contains no compact smooth embedded two-sided separating union of closed future or past apparent horizons, allowing either sign on each component. These additional horizon conditions are not needed for the transfer. The Schwarzschild examples below satisfy them and attain the bound at every positive mass.

The inequality alone does not classify equality for the original data: the construction need not preserve an equality case at finite $R$. A classification, or an extension to weaker null-infinity expansions, would require a further argument.

== 7 Schwarzschild equality examples <sec:sharpness>

The radial model gives equality examples once its inner endpoint is placed on the future Schwarzschild horizon. We verify their geometry at that endpoint, their CKS charges at infinity, and the area of every enclosing cut. The examples also exclude every closed interior apparent horizon of either time orientation.

Fix $m > 0$ and let $Omega = \[ 2 m \, oo \) times bb(S)^2$. Choose a smooth function $v \( r \)$ equal to $- 1$ near $2 m$ and to $r$ for all sufficiently large $r$. Define

#[#set math.equation(numbering: n => "(7.1)")
 $ u^2 = 1 - frac(2 m, r) + v^2 \, #h(2em) G = u^(- 2) upright(d) r^2 + r^2 sigma \, #h(2em) N = u partial_r \,\
k \( N \, N \) = v' \, #h(2em) k \( N \, dot.op \) \|_(T bb(S)^2) = 0 \, #h(2em) k \|_(T bb(S)^2 times T bb(S)^2) = \( v \/ r \) r^2 sigma . $ <eq:schwarzschild-data>]

The function $u$ is strictly positive at the boundary and throughout the exterior, including any interior zero of $v$. Thus these are smooth data up to $S = { 2 m } times bb(S)^2$. At infinity $u tilde.op r$, so the radial length $integral^oo u^(- 1) upright(d) r$ diverges logarithmically. Together with compactness of finite truncations, this proves completeness. Substitution in (5.7), or directly in (3.8), gives $C = Q = Z = 0$: here $F = m$, $eta = tau = 0$, and $L = v'$. In particular the data are vacuum.

=== 7.1 Spacetime realization and the future boundary <spacetime-realization-and-the-future-boundary>

To verify their Schwarzschild interpretation and sign, write $h_m = 1 - 2 m \/ r$. On $r > 2 m$ the Schwarzschild metric is

$ overline(g) = - h_m upright(d) t_s^2 + h_m^(- 1) upright(d) r^2 + r^2 sigma . $

Take a graph $t_s = t_s \( r \)$ with

$ t'_s = frac(v, h_m u) . $

Its induced radial metric coefficient is $u^(- 2)$. The future unit normal and outward radial unit tangent have $\( t_s \, r \)$-components

$ n_(upright("future")) = \( u \/ h_m \, v \) \, #h(2em) e_r = \( v \/ h_m \, u \) . $

The tangential sphere component of its second fundamental form is $\( v \/ r \) r^2 sigma$. The radial component of $overline(nabla)_(e_r) n_(upright("future"))$ is $u v'$: the connection terms from $overline(Gamma)_(t_s t_s)^r = h_m h'_m \/ 2$ and $overline(Gamma)_(r r)^r = - h'_m \/ \( 2 h_m \)$ cancel. Orthogonality to the future normal then gives $k \( e_r \, e_r \) = v'$, with mixed component zero. This proves exactly the convention used in (7.1).

In advanced time $w = t_s + integral h_m^(- 1) upright(d) r$, the spacetime metric is regular at the future horizon. Along the graph,

$ frac(upright(d) w, upright(d) r) = frac(u + v, h_m u) = frac(1, u \( u - v \)) . $

The latter expression is smooth at $r = 2 m$ because $v = - 1$ there and $u = 1$. Thus the slice extends smoothly to the future horizon, not to the opposite horizon with the wrong expansion sign. At $S$,

$ theta_(+) \( S \) = frac(2 \( u + v \), r) = 0 . $

For large $r$ we have $v = r$, $v' = 1$, and hence $k = G$. Moreover

$ G - h = (frac(1, 1 + r^2 - 2 m \/ r) - frac(1, 1 + r^2)) upright(d) r^2 = (frac(2 m, r^5) + O_3 \( r^(- 7) \)) upright(d) r^2 . $

The CKS expansion holds with $m^r = 2 m$ and $m^g = m^K = 0$. Consequently $M = 4 m$, $E_B = m$, $P_B = 0$, and $m_B = m > 0$.

=== 7.2 No further horizon and the exact area infimum <no-further-horizon-and-the-exact-area-infimum>

Every interior coordinate sphere satisfies

#[#set math.equation(numbering: n => "(7.2)")
 $ H = frac(2 u, r) > frac(2 \| v \|, r) = \| "tr"_(upright("sphere")) k #scale(x: 120%, y: 120%)[\|] \, $ <eq:sphere-barrier>]

because $u^2 - v^2 = 1 - 2 m \/ r > 0$. This also rules out nonround apparent horizons. Indeed, let $T$ be any compact closed embedded two-sided surface in the interior, and let $x$ be a maximum of $r \|_T$. The tangent plane at $x$ is tangent to the coordinate sphere. Orient $T$ locally by the radial outward normal. The surface Hessian identity and $Delta_T r \( x \) lt.eq 0$ give

$ 0 gt.eq Delta_T r \( x \) = "tr"_(T_x T) nabla_G^2 r - u H_T \( x \) = u (frac(2 u, r) - H_T \( x \)) . $

Thus $H_T \( x \) gt.eq 2 u \/ r > \| "tr"_(T_x T) k \|$. Reversing the orientation changes $H_T$ only by sign, so neither $theta_(+) = 0$ nor $theta_(-) = 0$ can hold on $T$. The argument applies to every component of a separating union of closed surfaces, even if different components are assigned different horizon signs.

Finally let $pi : Omega arrow.r S$ be radial projection. Since $r gt.eq 2 m$ and the metric is $u^(- 2) upright(d) r^2 + r^2 sigma$, this map is length nonincreasing. A radial ray from $S$ to infinity starts on the filled inner side, or on the cut itself, and eventually enters the retained outer domain. It therefore meets every enclosing cut $Gamma$; at a point of boundary coincidence the initial point is already an intersection. Thus $pi \|_Gamma$ is surjective. The area formula, with absolute two-dimensional Jacobian at most one, implies

$ "Area"_G \( Gamma \) gt.eq "Area"_G \( S \) = 16 pi m^2 . $

As $S$ itself is an allowed cut, $A_(min \, G) \( S \) = 16 pi m^2 > 0$. Equality in (1.6) follows. These examples prove the sharpness assertion in Corollary 2, including its connected marginal specialization.

#heading(level: 1)[References]
#bibitem([1])[S.~Alexakis, #emph[The Penrose inequality on perturbations of the Schwarzschild exterior], preprint (2015), #link("https://arxiv.org/abs/1506.06400v1")[arXiv:1506.06400v1].]
#bibitem([2])[B.~Allen, E.~Bryden, D.~Kazaras, and M.~Khuri, #emph[Proof of the spacetime Penrose inequality with suboptimal constant in the asymptotically flat and asymptotically hyperboloidal regimes], preprint (2025), #link("https://arxiv.org/abs/2504.10641v1")[arXiv:2504.10641v1].]
#bibitem([3])[R.~Bartnik, #emph[Quasi-spherical metrics and prescribed scalar curvature], J. Differential Geom. #strong[37] (1993), no.~1, 31--71. #link("https://doi.org/10.4310/jdg/1214453422")[doi:10.4310/jdg/1214453422].]
#bibitem([4])[R.~Bartnik, #emph[Mass and 3-metrics of non-negative scalar curvature], in #emph[Proceedings of the International Congress of Mathematicians, Beijing 2002], Vol.~II, 231--240. #link("https://arxiv.org/abs/math/0304259v1")[arXiv:math/0304259v1].]
#bibitem([5])[I.~Ben-Dov, #emph[The Penrose inequality and apparent horizons], Phys. Rev. D #strong[70] (2004), 124031. #link("https://doi.org/10.1103/PhysRevD.70.124031")[DOI]. Locators refer to #link("https://arxiv.org/abs/gr-qc/0408066v2")[arXiv:gr-qc/0408066v2].]
#bibitem([6])[H.~L.~Bray, #emph[Proof of the Riemannian Penrose inequality using the positive mass theorem], J. Differential Geom. #strong[59] (2001), no.~2, 177--267. #link("https://doi.org/10.4310/jdg/1090349428")[doi:10.4310/jdg/1090349428].]
#bibitem([7])[Y.~S.~Cha, M.~Khuri, and A.~Sakovich, #emph[Reduction arguments for geometric inequalities associated with asymptotically hyperboloidal slices], Class. Quantum Grav. #strong[33] (2016), no.~3, 035009. #link("https://doi.org/10.1088/0264-9381/33/3/035009")[doi:10.1088/0264-9381/33/3/035009]\; #link("https://arxiv.org/abs/1509.06255v2")[arXiv:1509.06255v2].]
#bibitem([8])[P.-N.~Chen, M.-T.~Wang, and S.-T.~Yau, #emph[Conserved quantities on asymptotically hyperbolic initial data sets], Adv. Theor. Math. Phys. #strong[20] (2016), no.~6, 1337--1375. #link("https://doi.org/10.4310/ATMP.2016.v20.n6.a2")[DOI]\; #link("https://arxiv.org/abs/1409.1812v1")[arXiv:1409.1812v1].]
#bibitem([9])[P.~T.~Chruściel and E.~Delay, #emph[The hyperbolic positive energy theorem], preprint (2019), revised 2 April 2026. Locators refer to #link("https://arxiv.org/abs/1901.05263v3")[arXiv:1901.05263v3].]
#bibitem([10])[P.~T.~Chruściel, J.~Jezierski, and S.~Łęski, #emph[The Trautman--Bondi mass of hyperboloidal initial data sets], Adv. Theor. Math. Phys. #strong[8] (2004), no.~1, 83--139. #link("https://doi.org/10.4310/ATMP.2004.v8.n1.a2")[DOI]. Locators refer to #link("https://arxiv.org/abs/gr-qc/0307109v2")[arXiv:gr-qc/0307109v2].]
#bibitem([11])[J.~Corvino and L.-H.~Huang, #emph[Localized deformation for initial data sets with the dominant energy condition], Calc. Var. Partial Differential Equations #strong[59] (2020), article~42. #link("https://doi.org/10.1007/s00526-019-1679-9")[DOI]. Locators refer to #link("https://arxiv.org/abs/1606.03078v2")[arXiv:1606.03078v2].]
#bibitem([12])[A.~Ellithy, #emph[The spacetime Penrose inequality under a quasi final state hypothesis], preprint (2026), #link("https://arxiv.org/abs/2605.18730v1")[arXiv:2605.18730v1].]
#bibitem([13])[G.~Huisken and T.~Ilmanen, #emph[The inverse mean curvature flow and the Riemannian Penrose inequality], J. Differential Geom. #strong[59] (2001), no.~3, 353--437. #link("https://doi.org/10.4310/jdg/1090349447")[doi:10.4310/jdg/1090349447].]
#bibitem([14])[M.~Mars and A.~Soria, #emph[On the Penrose inequality along null hypersurfaces], Class. Quantum Grav. #strong[33] (2016), no.~11, 115019. #link("https://doi.org/10.1088/0264-9381/33/11/115019")[DOI]. Locators refer to #link("https://arxiv.org/abs/1511.06242v1")[arXiv:1511.06242v1].]
#bibitem([15])[OpenAI, #emph[The spacetime Penrose inequality and enclosing area], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-spacetime-Penrose-inequality-and-enclosing-area-September-27-2026/paper.pdf")[OAI:The-spacetime-Penrose-inequality-and-enclosing-area-September-27-2026], 2026.]
#bibitem([16])[R.~Penrose, #emph[Naked singularities], Ann. New York Acad. Sci. #strong[224] (1973), 125--134. #link("https://doi.org/10.1111/j.1749-6632.1973.tb41447.x")[DOI].]
#bibitem([17])[A.~Sakovich, #emph[The Jang equation and the positive mass theorem in the asymptotically hyperbolic setting], Comm. Math. Phys. #strong[386] (2021), no.~2, 903--973. #link("https://doi.org/10.1007/s00220-021-04083-1")[doi:10.1007/s00220-021-04083-1]\; #link("https://arxiv.org/abs/2003.07762v2")[arXiv:2003.07762v2].]


