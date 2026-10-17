#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Strict hot spots and absence of interior critical points on smooth simply connected planar domains]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

The hot-spots problem arose from Rauch’s discussion of the long-time behavior of heat flow with insulating boundary conditions #cite(label("Rauch1975")). Its spectral formulation asks whether the extrema of a first-positive Neumann eigenfunction occur on the boundary. Bañuelos and Burdzy distinguished strict and nonstrict formulations, and assertions about every eigenfunction from the existence of one favorable eigenfunction #cite(label("BanuelosBurdzy1999")). These distinctions matter when the eigenvalue is multiple.

Let $Omega subset bb(R)^2$ be a nonempty bounded simply connected open set with $C^oo$ boundary. In particular, $Omega$ is connected. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ mu = mu_1 \( Omega \) = inf_(0 eq.not v in H^1 \( Omega \)\
integral_Omega v = 0) frac(integral_Omega \| nabla v \|^2, integral_Omega \| v \|^2) \, $ <eq:mu>]

and let $cal(V)$ be the real Neumann eigenspace for $mu$. We count only positive eigenvalues in this notation; sources that count the constant eigenfunction first write $mu_2$ for this same eigenvalue.

#thm([Theorem 1.1.])[
  #emph[For every $0 eq.not u in cal(V)$, 
$ nabla u \( x \) eq.not 0 #h(2em) \( x in Omega \) . $

 In particular, 
#[#set math.equation(numbering: n => "(1.2)")
 $ min_(y in partial Omega) u \( y \) < u \( x \) < max_(y in partial Omega) u \( y \) #h(2em) \( x in Omega \) . $ <eq:hotspots>]

]
] <thm:main>

The theorem imposes no convexity or symmetry condition. It applies to every member of the first positive eigenspace, including when the eigenvalue is multiple. The nonvanishing-gradient conclusion is stronger than (1.2), since it also rules out interior saddle points.

===== 1.1 Background and methods. <background-and-methods.>

Topology matters in the hot-spots problem. Burdzy and Werner constructed a planar counterexample with two holes and a simple first-positive eigenvalue #cite(label("BurdzyWerner1999")). Bass and Burdzy obtained examples with both extrema strictly in the interior #cite(label("BassBurdzy2000")), and Burdzy subsequently obtained this behavior with just one hole #cite(label("Burdzy2005")). The simply connected planar conjecture is stated explicitly in #cite(label("Burdzy2005")) Conjecture 1.2(ii).

Important geometric special cases already establish strong gradient conclusions. Jerison and Nadirashvili proved a positive directional derivative for every first-positive eigenfunction on convex planar domains with two orthogonal reflection symmetries, allowing multiple eigenvalues #cite(label("JerisonNadirashvili2000")) Theorem 1.4. Probabilistic coupling methods developed by Bañuelos and Burdzy #cite(label("BanuelosBurdzy1999")) led to further results. Pascu proved boundary-only extrema for antisymmetric eigenfunctions on $C^(1 \, alpha)$ convex planar domains with one reflection symmetry, where $0 < alpha < 1$ #cite(label("Pascu2002")). Atar and Burdzy treated every first-positive eigenfunction on lip domains, a class of Lipschitz domains bounded between graphs of functions with Lipschitz constants at most one #cite(label("AtarBurdzy2004")). Miyamoto obtained interior critical-point exclusion under a spectral-diameter condition, giving nonsymmetric nearly circular convex examples #cite(label("Miyamoto2007")) Lemma 1.2 and Theorem A.

The polygonal problem has a complementary development. Siudeja proved hot-spots results for a class of acute triangles #cite(label("Siudeja2015")). Judge and Mondal, with their subsequent erratum, excluded interior critical points for every first-positive Neumann eigenfunction on every Euclidean triangle #cite(label("JudgeMondal2020")) #cite(label("JudgeMondal2022")). Chen, Gui and Yao established the finer classification of nonvertex critical points #cite(label("ChenGuiYao2026")). These results concern domains with corners; 1 concerns the full smooth simply connected planar class.

Recent quantitative work measures how far the hot-spots conclusion can fail. For general bounded connected Lipschitz domains, de Dios Pont, Hsu and Taylor determined the sharp dimension-dependent upper bound for the ratio of a first-positive Neumann eigenfunction’s supremum over the domain to its maximum on the boundary #cite(label("deDiosPontHsuTaylor2025")) Definition 1 and Theorem 4. Deng, Jiang and Yang obtained quantitative bounds for convex domains in two-dimensional space forms #cite(label("DengJiangYang2026")). Such ratios concern extrema; excluding every interior critical point also requires excluding saddle points.

Our starting point is Rohleder’s variational principle for tangent vector fields #cite(label("Rohleder2021")) #cite(label("Rohleder2024")). In its lip-domain application, taking componentwise absolute values after a suitable rotation preserves the required tangent boundary condition and yields directional monotonicity. We use scalar boundary multipliers to keep tangency on an arbitrary smooth boundary, and construct those multipliers through a reciprocal Green-kernel theorem.

The difficulty is to control the gradient without a preferred direction in the domain. Each Cartesian derivative of an eigenfunction solves the same Helmholtz equation, but its boundary values need not have a fixed sign. The Neumann condition instead constrains the two derivatives together: their vector is tangent to the boundary. We use that constraint through a nonnegative quadratic form whose nullspace consists exactly of first-positive eigenfunction gradients. The remaining task is to construct enough scalar boundary multipliers that preserve this nullspace if an interior critical point exists.

===== 1.2 The mechanism. <the-mechanism.>

Write $bb(D) = { z in bb(C) : \| z \| < 1 }$ and $bb(S)^1 = partial bb(D)$, and let $Phi : bb(D) arrow.r Omega$ be a smooth conformal parametrization. The proof begins with the variational principle for tangent vector fields associated with Neumann gradients. For a tangent vector field $X$, its divergence–curl energy is at least $mu lr(bar.v.double X bar.v.double)_2^2$, with equality exactly for gradients of functions in $cal(V)$. After this conformal change of variables, solving the scalar Helmholtz equation in each Cartesian component gives a nonnegative quadratic form $E$ on boundary vector data. If $g$ is the boundary gradient of an eigenfunction, then $E \( g \) = 0$, and a scalar multiplier $b$ satisfies

$ E \( b g \) = 1 / 2 integral.double_(bb(S)^1 times bb(S)^1) N \( s \, t \) \( b \( s \) - b \( t \) \)^2 g \( s \) dot.op g \( t \) thin upright(d) s thin upright(d) t . $

Here $N$ is a positive boundary kernel, and the corresponding interior evaluation kernel is denoted by $K$.

The sign of $g \( s \) dot.op g \( t \)$ prevents a direct positivity argument in this identity. The main kernel result supplies a family of multipliers whose squared differences remove the factor $N$. For every interior point $p$,

$ D_p \( s \, t \) = frac(K \( p \, s \) K \( p \, t \), N \( s \, t \)) quad \( s eq.not t \) \, #h(2em) D_p \( s \, s \) = 0 \, $

is conditionally negative semidefinite. It is therefore the squared distance of an injective Lipschitz map from the circle to a real Hilbert space. Applying the preceding energy identity to its coordinates gives

$ sum_j E \( b_j g \) = 1 / 2 \| nabla u \( Phi \( p \) \) \|^2 . $

A critical point would thus produce too many eigenfunction gradients, contradicting the planar multiplicity bound or boundary uniqueness.

The construction of $D_p$ is the central analytic step. We first regularize the disk Green function so that the entrywise reciprocal of every finite kernel matrix has at most one positive eigenvalue. This property survives successive rank-one updates along columns of the current kernel matrix, which sum the Green resolvent over a finite set of integration nodes. Positive quadrature and monotone limits then pass from those matrices to the singular Green kernel and finally to its boundary kernels. Taking the boundary limit before removing a compact-support cutoff avoids treating a Poisson kernel as an $L^2$ function when it need not be one.

The kernel theorem, 13, holds for every bounded nonnegative disk potential satisfying the subcritical Dirichlet inequality (4.2), independently of the conformal origin of that potential. The reciprocal-matrix condition comes from the McCullough–Quiggin characterization of complete Nevanlinna–Pick kernels #cite(label("McCullough1992")) #cite(label("McCullough1994")) #cite(label("Quiggin1993")) #cite(label("Quiggin1994")); see also #cite(label("AglerMcCarthy2000")) Corollary 1.12. Schoenberg’s squared-distance correspondence supplies the Hilbert-space realization #cite(label("Schoenberg1938")). The analytic work here concerns the singular Green kernel, its positive-potential resolvent, and its boundary limit; the resulting theorem can be used independently of the eigenfunction argument.

===== 1.3 Organization and background. <organization-and-background.>

2 proves the spectral gap, the smooth conformal reduction, and the multiplicity bound. 3 proves the vector variational principle. 4 constructs the boundary kernels and derives the multiplier identity. 5 proves their conditional negativity, and 6 completes the argument. We use standard Sobolev compactness, Poincaré and trace inequalities on smooth bounded domains, Poisson solvability and elliptic boundary regularity, the maximum and boundary point principles, elementary complex analysis, and planar separation. All specialized ingredients used in the proof are established below. The smooth-boundary regularity input is #cite(label("Showalter1994")) Chapter III, Theorems 6.1, 6.4 and 6.5: $L^2$ Poisson data give $H^2$ solutions under homogeneous Dirichlet or Neumann conditions, and higher regularity follows with smoother data. Subtracting a smooth extension handles the inhomogeneous Dirichlet data used below. Bootstrap and Sobolev embedding make weak Neumann eigenfunctions smooth up to the boundary. Interior solutions of $\( Delta + mu \) v = 0$ are analytic; alternatively, $e^(sqrt(mu) t) v \( x \)$ is harmonic in one additional variable.

== 2 Spectral and planar preliminaries <sec:preliminaries>

Write $lambda_D$ for the first Dirichlet eigenvalue of $Omega$. Both $mu$ and $lambda_D$ are positive by the respective Poincaré inequalities. Their Rayleigh infima are attained by compactness, and the eigenspaces are finite-dimensional.

The strict separation below is the first-mode case of the Friedlander–Filonov comparison #cite(label("Friedlander1991")) #cite(label("Filonov2005")). We give the plane-wave argument of Filonov in the form needed here, including the strictness that identifies the equality space of the later vector variational principle.

#thm([Lemma 2.1.])[
  #emph[One has $mu < lambda_D$.]
] <lem:gap>

#proof[
  Choose a nonzero nonnegative Dirichlet minimizer $phi.alt$, using absolute values in the Rayleigh quotient. Then $integral_Omega phi.alt > 0$. Work temporarily over $bb(C)$. For $k in bb(R)^2$ with $\| k \|^2 = lambda_D$, put
  $ e_k \( x \) = e^(i k dot.op x) \, #h(2em) w_k = e_k - frac(integral_Omega e_k, integral_Omega phi.alt) phi.alt . $
  Each $w_k$ has mean zero. The form $integral \( \| nabla v \|^2 - lambda_D \| v \|^2 \)$ vanishes on $e_k$ and $phi.alt$; its cross term vanishes because $- Delta e_k = lambda_D e_k$ and $phi.alt$ has zero trace. Thus every nonzero $w_k$ has Rayleigh quotient $lambda_D$, proving $mu lt.eq lambda_D$.
  If equality held, each such $w_k$ would be a Neumann eigenfunction by variational equality. The Euler equation first holds against mean-zero tests and then against all tests, since $w_k$ has mean zero. But distinct plane waves are linearly independent: restrict any finite family to a line segment in an interior ball whose direction gives distinct frequencies. Subtracting multiples of one fixed function leaves their span infinite-dimensional. This contradicts finite eigenspace dimension. The real Neumann inequality and its equality case apply in the complexified space by separating real and imaginary parts. ◻
]

We also include the smooth conformal parametrization used throughout the proof; see #cite(label("Pommerenke1992")) for the classical boundary-regularity theory of conformal maps.

#thm([Lemma 2.2.])[
  #emph[There is a conformal bijection $Phi : bb(D) arrow.r Omega$ extending to a smooth diffeomorphism of closures, with $Phi' eq.not 0$ on $overline(bb(D))$.]
] <lem:conformal>

#proof[
  Identify the plane with $bb(C)$ and fix $a in Omega$. Let $l$ solve the harmonic Dirichlet problem with boundary values $log \| z - a \|$. It is smooth up to the boundary. Simple connectivity gives a harmonic conjugate $tilde(l)$; its gradient extends smoothly, so the conjugate also extends smoothly in boundary charts. The holomorphic function
  $ m \( z \) = \( z - a \) exp \( - l \( z \) - i tilde(l) \( z \) \) $
  has modulus one on the boundary, modulus less than one inside, and precisely one zero, of order one. Near the boundary, $log \| m \|$ is harmonic, negative inside, and zero on the boundary. The boundary point lemma gives a nonzero normal derivative, so $m'$ does not vanish there.
  For any $w in bb(D)$, take a smooth inner approximation of $Omega$ so close to its boundary that $\| m \| > \| w \|$ throughout the omitted collar. Rouché’s theorem gives exactly one zero of $m - w$ in that approximation, counting multiplicity, because $m$ has exactly one. There are none in the collar. Thus $m$ is a biholomorphism in the interior. It maps the boundary onto the circle by compactness. Its local boundary inverses imply injectivity there: two boundary preimages would give two nearby interior preimages. The inverse map is the required $Phi$. ◻
]

Throughout, $bb(S)^1 = partial bb(D)$ carries arclength $thin upright(d) s$, of total mass $2 pi$.

To bound the dimension of $cal(V)$, we transfer its mean-zero condition to the boundary and use connectedness of the positive and negative sets to control boundary signs.

#thm([Lemma 2.3.])[
  #emph[There is a fixed smooth positive function $beta$ on $bb(S)^1$ such that every $v in cal(V)$ has boundary trace $h_v = v compose Phi$ satisfying 
$ integral_(bb(S)^1) beta h_v thin upright(d) s = 0 . $

 If $v eq.not 0$, its boundary trace is nonzero and takes both signs.]
] <lem:boundary-weight>

#proof[
  By 2, the Dirichlet problem
  $ \( - Delta - mu \) L = 1 \, #h(2em) L \|_(partial Omega) = 0 $
  is coercive and has a smooth solution. Testing by its negative part gives $L gt.eq 0$. Hence $- Delta L = 1 + mu L > 0$, and the boundary point lemma gives $- partial_nu L > 0$. Green’s identity and the Neumann equation yield
  $ 0 = integral_Omega v = - integral_(partial Omega) v thin partial_nu L = integral_(bb(S)^1) beta \( s \) h_v \( s \) thin upright(d) s \, quad beta = \| Phi' \| thin \( - partial_nu L \) compose Phi . $
  If $h_v = 0$, then $v in H_0^1 \( Omega \)$, and the Dirichlet inequality and $mu < lambda_D$ force $v = 0$. Positivity of $beta$ gives the last assertion. ◻
]

#thm([Lemma 2.4.])[
  #emph[For $0 eq.not v in cal(V)$, the sets ${ v > 0 }$ and ${ v < 0 }$ are connected. Its boundary trace cannot have four cyclically ordered points with strictly alternating signs.]
] <lem:nodal>

#proof[
  For each component $U$ of a sign set, the function $v_U = v upright(bold(1))_U$ belongs to $H^1 \( Omega \)$ and has weak gradient $upright(bold(1))_U nabla v$. Indeed it is locally Lipschitz in interior balls: any transition between $U$ and its complement crosses a zero of $v$, so the local Lipschitz bound for $v$ also bounds the zeroed function. This gives the local weak-gradient identity, and the global $L^2$ bounds give global $H^1$ membership. Testing the eigenfunction equation by $v_U$ shows
  $ integral_Omega \| nabla v_U \|^2 = mu integral_Omega \| v_U \|^2 . $
  If at least three sign components existed, a nonzero linear combination of two restrictions could be chosen mean zero. Disjoint supports show that it attains the quotient $mu$. It is therefore an eigenfunction, but vanishes on the omitted open component, contradicting interior analyticity. Both sign sets are nonempty, so each is connected.
  Four alternating strict signs on the boundary would give a simple arc joining the two positive points, otherwise in the positive interior set, and another joining the negative points in the negative interior set. Such arcs exist by connectedness of open planar sign sets, using short interior end segments and then polygonal paths with loops removed. After applying $Phi^(- 1)$, their endpoints alternate on a circle. Planar separation forces the two arcs to intersect, contrary to their signs; see 1. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.25, stroke: (paint: rgb("#595959"), thickness: 0.65pt, cap: "round", join: "round"))
  content((-0.67, -0.69), [#text(size: 9pt)[$bb(D)$]])
  bezier((-1.25, 0), (0, 0.22), (-0.8, 0.38), (-0.4, 0.22), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  bezier((0, 0.22), (1.25, 0), (0.48, 0.22), (0.78, 0.18), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  bezier((0, 1.25), (0, 0.22), (-0.26, 0.91), (-0.2, 0.55), stroke: (thickness: 0.9pt, cap: "round", join: "round", dash: (3pt, 2.2pt)))
  bezier((0, 0.22), (0, -1.25), (0.35, -0.2), (0.3, -0.9), stroke: (thickness: 0.9pt, cap: "round", join: "round", dash: (3pt, 2.2pt)))
  circle((0, 0.22), radius: 0.05997, fill: black, stroke: none)
  circle((-1.25, 0), radius: 0.05644, fill: black, stroke: none)
  circle((1.25, 0), radius: 0.05644, fill: black, stroke: none)
  circle((0, 1.25), radius: 0.05644, fill: black, stroke: none)
  circle((0, -1.25), radius: 0.05644, fill: black, stroke: none)
  content((-1.57, 0), [#text(size: 12pt)[$+$]])
  content((1.57, 0), [#text(size: 12pt)[$+$]])
  content((0, 1.55), [#text(size: 12pt)[$-$]])
  content((0, -1.55), [#text(size: 12pt)[$-$]])
  line((2.1, 0.74), (2.72, 0.74), stroke: (thickness: 1.1pt, cap: "round", join: "round"))
  content((2.89, 0.74), [#text(size: 9pt)[Positive crosscut]], anchor: "west", padding: 0.1176cm)
  line((2.1, 0.1), (2.72, 0.1), stroke: (thickness: 0.9pt, cap: "round", join: "round", dash: (3pt, 2.2pt)))
  content((2.89, 0.1), [#text(size: 9pt)[Putative negative path]], anchor: "west", padding: 0.1176cm)
  circle((2.41, -0.54), radius: 0.05997, fill: black, stroke: none)
  content((2.89, -0.54), [#text(size: 9pt)[Intersection forced]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Connectedness of the positive set gives a crosscut joining the $+$ points. It separates the two $-$ points, forcing any negative connecting path to meet it. The dashed path illustrates this contradiction; all four boundary signs are strict. ],
) <fig:boundary-signs>

The following multiplicity bound is due to Nadirashvili #cite(label("Nadirashvili1988")) Theorem 3, p. 227; see also #cite(label("BanuelosBurdzy1999")) Proposition 2.5. The boundary-sign proof is included for completeness.

#thm([Proposition 2.5.])[
  #emph[The real eigenspace $cal(V)$ has dimension at most two.]
] <prop:multiplicity>

#proof[
  Suppose its dimension is at least three. Since the trace map is injective, choose $0 eq.not v in cal(V)$ whose trace $h = h_v$ satisfies
  $ integral_(bb(S)^1) beta h cos theta thin upright(d) s = integral_(bb(S)^1) beta h sin theta thin upright(d) s = 0 \, #h(2em) s = e^(i theta) . $
  It is already orthogonal to $1$ by 4. Cut the circle at a strictly negative point and write its angles as $\( theta_0 \, theta_0 + 2 pi \)$. If $a$ and $b$ are the infimum and supremum of the positive angles, then
  $ theta_0 < a < b < theta_0 + 2 pi . $
  There are no positive values outside $\[ a \, b \]$. Nor is there a negative value between $a$ and $b$: positive values on either side of it, together with the cut point, would violate 5. The function
  $ F \( theta \) = cos #h(-0.16667em) (theta - frac(a + b, 2)) - cos #h(-0.16667em) (frac(b - a, 2)) $
  is strictly positive on $\( a \, b \)$ and negative outside $\[ a \, b \]$ in the cut interval. Consequently $F h gt.eq 0$ everywhere and $F h > 0$ on a nonempty open set. Thus $integral beta F h > 0$, contradicting the three orthogonalities. ◻
]

== 3 A variational principle for tangent vector fields <sec:vector>

For a real vector field $X in H^1 \( Omega \; bb(R)^2 \)$ with tangent trace, meaning $"tr" X dot.op nu = 0$, set

$ cal(Q) \( X \) = integral_Omega #scale(x: 120%, y: 120%)[\(] \| "div" X \|^2 + \| "curl" X \|^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) "curl" X = partial_1 X_2 - partial_2 X_1 . $

The following is Rohleder’s vector variational principle #cite(label("Rohleder2021")) Theorem 1.1; see also #cite(label("Rohleder2024")). We include its derivation, in particular its equality case. Our curvature convention below is the opposite of his, so the corresponding boundary term has the opposite sign.

#thm([Proposition 3.1.])[
  #emph[For every such $X$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ cal(Q) \( X \) gt.eq mu integral_Omega \| X \|^2 \, $ <eq:vector-inequality>]

 with equality exactly when $X = nabla v$ for some $v in cal(V)$.]
] <prop:vector>

#proof[
  Solve
  $ Delta v = "div" X \, quad partial_nu v = 0 \, quad integral_Omega v = 0 \, #h(2em) Delta j = "curl" X \, quad j \|_(partial Omega) = 0 . $
  The Neumann compatibility follows from the tangent trace. The solutions are in $H^2 \( Omega \)$ by smooth-boundary regularity #cite(label("Showalter1994")) Chapter III, Theorems 6.1 and 6.4. The rotated gradient $nabla^perp j = \( - partial_2 j \, partial_1 j \)$ is tangent. Thus
  $ Z = X - nabla v - nabla^perp j $
  is tangent, curl-free, and divergence-free. Its components are harmonic in the interior, so $Z$ is smooth there. Simple connectivity gives an interior potential $r$ with $Z = nabla r$.
  Here $r in H^1 \( Omega \)$, as can be seen without assuming its global integrability in advance. For $M > 0$, its bounded truncation $r_M = max \( - M \, min \( r \, M \) \)$ has local weak gradient of norm at most $\| Z \|$, hence belongs globally to $H^1 \( Omega \)$. Fix an interior ball $B$. Its averages $\( r_M \)_B$ are bounded by $sup_B \| r \|$. The Poincaré inequality, with this fixed-ball average as anchor, gives
  $ lr(bar.v.double r_M bar.v.double)_(L^2 \( Omega \)) lt.eq C lr(bar.v.double nabla r_M bar.v.double)_(L^2 \( Omega \)) + C \| \( r_M \)_B \| lt.eq C lr(bar.v.double  bar.v.double) Z_2 + C sup_B \| r \| . $
  Fatou gives $r in L^2$, and its weak gradient is $Z$. Testing $"div" Z = 0$ against $r$, with its zero normal trace, yields $integral \| nabla r \|^2 = 0$. Thus
  $ X = nabla v + nabla^perp j . $
  The summands are orthogonal in $L^2$, since the second is divergence-free and tangent. Moreover,
  $ cal(Q) \( X \) = lr(bar.v.double Delta v bar.v.double)_2^2 + lr(bar.v.double Delta j bar.v.double)_2^2 . $
  Integration by parts and the two Poincaré inequalities show
  $ lr(bar.v.double nabla v bar.v.double)_2^2 lt.eq lr(bar.v.double  bar.v.double) v_2 lr(bar.v.double Delta v bar.v.double)_2 lt.eq mu^(- 1 \/ 2) lr(bar.v.double nabla v bar.v.double)_2 lr(bar.v.double Delta v bar.v.double)_2 \, $
  and likewise $lr(bar.v.double Delta j bar.v.double)_2^2 gt.eq lambda_D lr(bar.v.double nabla j bar.v.double)_2^2$. Hence
  $ cal(Q) \( X \) gt.eq mu lr(bar.v.double nabla v bar.v.double)_2^2 + lambda_D lr(bar.v.double nabla j bar.v.double)_2^2 = mu lr(bar.v.double  bar.v.double) X_2^2 + \( lambda_D - mu \) lr(bar.v.double nabla j bar.v.double)_2^2 . $
  By 2, this proves (3.1). Equality forces $j = 0$ and equality in the Rayleigh inequality for $v$, so $v in cal(V)$. Conversely, gradients of functions in $cal(V)$ give equality directly. ◻
]

For a differential-form interpretation of this divergence–curl energy, see #cite(label("FriesGoffengMiranda2026")) Section 5.1. We will use the following boundary identity in the fixed Cartesian coordinates of the plane.

Let $tau$ be the counterclockwise unit tangent to $partial Omega$, and put

$ kappa = det \( tau \, partial_tau tau \) . $

Thus $kappa$ is positive on a convex circle.

#thm([Lemma 3.2.])[
  #emph[For tangent $X in H^1 \( Omega \; bb(R)^2 \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ cal(Q) \( X \) = integral_Omega \| nabla X \|^2 + integral_(partial Omega) kappa \| X \|^2 . $ <eq:curvature>]

]
] <lem:curvature>

#proof[
  For smooth fields, the difference of the bulk integrands is $2 det nabla X$. Its integral is the boundary pairing
  $ integral_(partial Omega) \( X_1 partial_tau X_2 - X_2 partial_tau X_1 \) . $
  This identity extends to $H^1$ fields by smooth approximation, since traces are in $H^(1 \/ 2)$ and their tangential derivatives are in $H^(- 1 \/ 2)$. If the trace is $a tau$, the pairing is $integral kappa a^2$. This follows first for smooth $a$ and then by approximation in $H^(1 \/ 2)$. It gives (3.2). ◻
]

== 4 Boundary kernels and the multiplier identity <sec:boundary>

Our objective is a boundary formula for the nonnegative vector energy from 7. We first construct scalar solution and interaction kernels for a general nonnegative subcritical potential on the disk. We then return to the conformal potential and derive the multiplier identity that will connect these kernels to an eigenfunction gradient.

=== 4.1 A subcritical disk potential <a-subcritical-disk-potential>

The conformal map of 3 defines a measure

#[#set math.equation(numbering: n => "(4.1)")
 $ thin upright(d) q \( x \) = mu \| Phi' \( x \) \|^2 thin upright(d) x . $ <eq:q>]

It has a bounded positive density. A subscript $q$ on an inner product or norm denotes $L^2 \( q \)$. Conformal invariance of the Dirichlet integral and the Dirichlet inequality on $Omega$ give

#[#set math.equation(numbering: n => "(4.2)")
 $ lr(bar.v.double psi bar.v.double)_(L^2 \( q \))^2 lt.eq d integral_(bb(D)) \| nabla psi \|^2 \, #h(2em) psi in H_0^1 \( bb(D) \) \, #h(2em) d = mu / lambda_D < 1 . $ <eq:subcritical>]

Until the vector-form application in 4.3, only boundedness and nonnegativity of the density and (4.2) are needed. In particular, the kernel constructions apply to any measure $q$ with those properties. For such a general measure we fix a constant $0 < d < 1$ satisfying the same inequality; the zero measure also admits this choice.

The Dirichlet Green function and Poisson kernel of the disk are

#[#set math.equation(numbering: n => "(4.3)")
 $ G \( x \, y \) & = frac(1, 2 pi) log lr(|frac(1 - x overline(y), x - y)|) = frac(1, 4 pi) log (1 + frac(\( 1 - \| x \|^2 \) \( 1 - \| y \|^2 \), \| x - y \|^2)) \,\
P_s \( x \) & = frac(1 - \| x \|^2, 2 pi \| s - x \|^2) \, #h(2em) s in bb(S)^1 . $ <eq:green>]

The Green function is positive and is assigned value $+ oo$ on the diagonal. Its logarithmic pole, harmonic correction, and zero boundary data give the Green identity. Also $integral_(bb(S)^1) P_s \( x \) thin upright(d) s = 1$.

#thm([Lemma 4.1.])[
  #emph[The operator 
$ T f \( x \) = integral_(bb(D)) G \( x \, y \) f \( y \) thin upright(d) q \( y \) $

 is a bounded self-adjoint operator on $L^2 \( q \)$ with $lr(bar.v.double  bar.v.double) T lt.eq d < 1$. The same statement holds with $q$ replaced by any measure $0 lt.eq rho lt.eq q$.]
] <lem:green-operator>

#proof[
  Write $thin upright(d) q = a thin upright(d) x$, with $a$ bounded. For $f in L^2 \( q \)$, the source $a f$ lies in $L^2 \( thin upright(d) x \)$, since $integral \| a f \|^2 lt.eq lr(bar.v.double  bar.v.double) a_oo integral \| f \|^2 thin upright(d) q$. Its Dirichlet solution $psi = T f$ satisfies
  $ integral_(bb(D)) \| nabla psi \|^2 = chevron.l psi \, f chevron.r_q . $
  Combining this with (4.2) gives
  $ lr(bar.v.double psi bar.v.double)_q^2 lt.eq d lr(bar.v.double psi bar.v.double)_q lr(bar.v.double  bar.v.double) f_q \, $
  hence the norm bound. Symmetry follows from the Green kernel, or by testing the two Poisson equations against each other. The Green formula can first be proved for smooth compactly supported sources and then passed to $L^2 \( thin upright(d) x \)$ by approximation; $G \( x \, dot.op \) in L^2 \( thin upright(d) x \)$ gives pointwise evaluation. These sections vary continuously in $L^2$ on compact interior sets, so this is the continuous interior representative. For $rho lt.eq q$, its density remains bounded and its weighted Dirichlet inequality follows from (4.2), proving the same result. ◻
]

For Lipschitz scalar or vector boundary data $h$, let

$ A h \( x \) = integral_(bb(S)^1) P_s \( x \) h \( s \) thin upright(d) s . $

This harmonic extension belongs to $H^1 \( bb(D) \)$. The unique weak solution with trace $h$ of

$ - Delta W_h thin upright(d) x = W_h thin upright(d) q $

is

#[#set math.equation(numbering: n => "(4.4)")
 $ W_h = A h + T \( I - T \)^(- 1) A h . $ <eq:extension>]

Indeed the correction has zero trace and solves the required Poisson equation. Uniqueness follows from (4.2). The construction is componentwise for vectors.

=== 4.2 Positive kernels and their estimates <positive-kernels-and-their-estimates>

For $p in bb(D)$ and distinct $s \, t in bb(S)^1$, define

#[#set math.equation(numbering: n => "(4.5)")
 $ K \( p \, s \) & = P_s \( p \) + sum_(n gt.eq 1) \( T^n P_s \) \( p \) \,\
R \( s \, t \) & = sum_(n gt.eq 0) integral_(bb(D)) P_s thin T^n P_t thin upright(d) q \,\
N \( s \, t \) & = N_0 \( s \, t \) + R \( s \, t \) \, #h(2em) N_0 \( s \, t \) = frac(1, pi \| s - t \|^2) . $ <eq:K>]

Powers applied to $P_s$ mean iterated nonnegative kernel integrals, not an a priori application of an $L^2$ operator to $P_s$.

#thm([Lemma 4.2.])[
  #emph[The kernels above are finite at the stated points. For fixed $p$, $K \( p \, dot.op \)$ is positive and bounded. The kernel $R$ is symmetric, nonnegative, and integrable on $bb(S)^1 times bb(S)^1$, with 
#[#set math.equation(numbering: n => "(4.6)")
 $ integral.double R \( s \, t \) thin upright(d) s thin upright(d) t lt.eq frac(q \( bb(D) \), 1 - d) . $ <eq:R-integral>]

 For Lipschitz boundary data, 
#[#set math.equation(numbering: n => "(4.7)")
 $ W_h \( p \) & = integral_(bb(S)^1) K \( p \, s \) h \( s \) thin upright(d) s \,\
chevron.l A h \, \( I - T \)^(- 1) A k chevron.r_q & = integral.double R \( s \, t \) h \( s \) dot.op k \( t \) thin upright(d) s thin upright(d) t . $ <eq:K-representation>]

]
] <lem:kernel-estimates>

#proof[
  The elementary estimates
  $ P_s \( y \) lt.eq frac(C, \| y - s \|) \, #h(2em) 0 lt.eq G \( x \, y \) lt.eq C log frac(2, \| x - y \|) $
  give uniform bounds for $P_s$ in $L^(3 \/ 2) \( thin upright(d) x \)$ and for $G \( x \, dot.op \)$ in $L^3 \( thin upright(d) x \)$. Hölder and the bounded density imply
  $ sup_(s in bb(S)^1) lr(bar.v.double T P_s bar.v.double)_(L^oo \( bb(D) \)) < oo . $
  The section $P_s$ need not belong to $L^2 \( q \)$, but one Green integration gives $F_s = T P_s in L^oo \( bb(D) \) subset L^2 \( q \)$. We can now apply the $L^2 \( q \)$ contraction estimate to the remaining iterates. For $n gt.eq 2$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| \( T^n P_s \) \( p \) \| = \| chevron.l G \( p \, dot.op \) \, T^(n - 2) F_s chevron.r_q \| lt.eq lr(bar.v.double G \( p \, dot.op \) bar.v.double)_q thin d^(n - 2) lr(bar.v.double F_s bar.v.double)_q lt.eq C d^(n - 2) . $ <eq:iterate-bound>]
  The constants can be chosen uniformly in $p$ and $s$. This proves the assertion about $K$.
  For distinct $s \, t$, the product $P_s P_t$ is integrable: near either boundary pole, the other factor is bounded, and $\| y - s \|^(- 1)$ is locally integrable in two dimensions. The terms with $n gt.eq 1$ in (4.5) are summable by the first smoothing estimate and (4.8), since $integral P_s thin upright(d) q$ is uniformly bounded. Reversing the nonnegative chains proves symmetry. Tonelli’s theorem and $integral P_s thin upright(d) s = 1$ give
  $ integral.double R \( s \, t \) thin upright(d) s thin upright(d) t = sum_(n gt.eq 0) chevron.l upright(bold(1)) \, T^n upright(bold(1)) chevron.r_q lt.eq sum_(n gt.eq 0) d^n lr(bar.v.double upright(bold(1)) bar.v.double)_q^2 \, $
  which is (4.6). Diagonal values of $R$ play no role in these boundary integrals. Expanding the Neumann series in (4.4) and using the positive kernels gives (4.7) and (4.7); the same bounds justify the exchanges for signed data by absolute domination. ◻
]

=== 4.3 The boundary energy <subsec:energy>

Return now to $q$ in (4.1). A vector boundary function $h$ is called tangent if $h \( s \)$ is tangent to $partial Omega$ at $Phi \( s \)$. Extend its fixed Cartesian components by (4.4), and set

$ X_h = W_h compose Phi^(- 1) \, #h(2em) E \( h \) = cal(Q) \( X_h \) - mu lr(bar.v.double X_h bar.v.double)_(L^2 \( Omega \))^2 . $

We write $E \( h \, k \)$ for its bilinear form. 7 gives $E gt.eq 0$ on tangent Lipschitz boundary data, and

#[#set math.equation(numbering: n => "(4.9)")
 $ E \( h \) = 0 quad arrow.l.r.double quad X_h = nabla v upright(" for some ") v in cal(V) . $ <eq:E-nullspace>]

#thm([Lemma 4.3.])[
  #emph[For tangent Lipschitz data $h \, k$, 
#[#set math.equation(numbering: n => "(4.10)")
 $ E \( h \, k \) =  & 1 / 2 integral.double N_0 \( s \, t \) \( h \( s \) - h \( t \) \) dot.op \( k \( s \) - k \( t \) \) thin upright(d) s thin upright(d) t\
 & - integral.double R \( s \, t \) h \( s \) dot.op k \( t \) thin upright(d) s thin upright(d) t + integral_(bb(S)^1) \| Phi' \| \( kappa compose Phi \) h dot.op k thin upright(d) s . $ <eq:E-boundary>]

]
] <lem:boundary-energy>

#proof[
  By 8 and conformal invariance of the scalar Dirichlet integral applied to each Cartesian component, the bulk terms of $E$ are
  $ integral_(bb(D)) nabla W_h : nabla W_k - chevron.l W_h \, W_k chevron.r_q . $
  The equation for $W_k$ permits replacing $W_h$ here by $A h$, since their difference has zero trace. Harmonicity of $A h$ then replaces $W_k$ by $A k$ in the gradient term. Since $W_k = \( I - T \)^(- 1) A k$ in $L^2 \( q \)$, this gives
  $ integral_(bb(D)) nabla A h : nabla A k - chevron.l A h \, \( I - T \)^(- 1) A k chevron.r_q . $
  The boundary curvature term changes by the factor $\| Phi' \|$, and (4.7) identifies the second term.
  For the harmonic energy,
  #[#set math.equation(numbering: n => "(4.11)")
   $ integral_(bb(D)) nabla A h : nabla A k = 1 / 2 integral.double N_0 \( s \, t \) \( h \( s \) - h \( t \) \) dot.op \( k \( s \) - k \( t \) \) thin upright(d) s thin upright(d) t . $ <eq:harmonic-energy>]
  Indeed both sides diagonalize in Fourier modes. The Hermitian energy of $s^m$ is $2 pi \| m \|$, while
  $ integral.double frac(\| s^m - t^m \|^2, \| s - t \|^2) thin upright(d) s thin upright(d) t = \( 2 pi \)^2 \| m \| $
  by a geometric sum, verifying the normalization. Smooth convolution approximation, with uniformly bounded Lipschitz constants and convergence in $H^(1 \/ 2)$, extends the identity to the stated data. This proves (4.10). ◻
]

Fix $0 eq.not u in cal(V)$ and let

#[#set math.equation(numbering: n => "(4.12)")
 $ g \( s \) = \( nabla u \) \( Phi \( s \) \) \, #h(2em) s in bb(S)^1 . $ <eq:g>]

It is tangent by the Neumann condition. Differentiation of the Euclidean Helmholtz equation commutes with its Cartesian derivatives, so uniqueness gives

#[#set math.equation(numbering: n => "(4.13)")
 $ W_g = \( nabla u \) compose Phi \, #h(2em) E \( g \) = 0 . $ <eq:gradient-extension>]

#thm([Proposition 4.4.])[
  (Multiplier identity).  #emph[For every real Lipschitz function $b$ on $bb(S)^1$, 
#[#set math.equation(numbering: n => "(4.14)")
 $ E \( b g \) = 1 / 2 integral.double N \( s \, t \) \( b \( s \) - b \( t \) \)^2 g \( s \) dot.op g \( t \) thin upright(d) s thin upright(d) t . $ <eq:multiplier>]

]
] <prop:multiplier>

#proof[
  Since $E$ is positive semidefinite and $E \( g \) = 0$, its bilinear form annihilates $g$: this follows by considering $E \( g + t h \)$ for real $t$. In particular, $E \( g \, b^2 g \) = 0$. Subtract (4.10) for this pair from the formula for $E \( b g \, b g \)$. The curvature terms cancel. The harmonic term gives
  $ 1 / 2 N_0 \( s \, t \) \( b \( s \) - b \( t \) \)^2 g \( s \) dot.op g \( t \) $
  in the double integral. Symmetry of $R$ gives the same expression with $R$ in place of $N_0$. Their sum is (4.14). All terms are integrable: the squared Lipschitz difference cancels the singularity of $N_0$, and $R$ is integrable. ◻
]

== 5 Reciprocal Green functions and a squared-distance kernel <sec:reciprocal>

In this section we prove the reciprocal-kernel theorem for a general disk potential. The kernels $K \, N$ are those of (4.5)–(4.5); their construction and estimates require only the measure hypotheses restated in the theorem below.

A real symmetric kernel $D$ with zero diagonal is #emph[conditionally negative semidefinite] if, for every finite family of points and real coefficients with $sum_i a_i = 0$,

$ sum_(i \, j) a_i a_j D \( s_i \, s_j \) lt.eq 0 . $

#thm([Theorem 5.1.])[
  #emph[Let $thin upright(d) q = a thin upright(d) x$ on $bb(D)$, where $a in L^oo \( bb(D) \)$ is nonnegative, and suppose there is a constant $0 < d < 1$ such that 
$ integral_(bb(D)) \| psi \|^2 thin upright(d) q lt.eq d integral_(bb(D)) \| nabla psi \|^2 #h(2em) \( psi in H_0^1 \( bb(D) \) \) . $

 For the associated kernels $K \, N$ and every $p in bb(D)$, the kernel 
#[#set math.equation(numbering: n => "(5.1)")
 $ D_p \( s \, t \) = frac(K \( p \, s \) K \( p \, t \), N \( s \, t \)) quad \( s eq.not t \) \, #h(2em) D_p \( s \, s \) = 0 \, $ <eq:D>]

 is conditionally negative semidefinite on $bb(S)^1$.]
] <thm:negative-kernel>

#prodef([Remark 5.2.])[
  For $q = 0$, this kernel is a rescaled squared chordal distance. Indeed, with the disk automorphism $phi_p \( z \) = \( z - p \) \/ \( 1 - overline(p) z \)$,
  $ D_p \( s \, t \) = pi P_s \( p \) P_t \( p \) \| s - t \|^2 = frac(1, 4 pi) \| phi_p \( s \) - phi_p \( t \) \|^2 . $
  13 supplies a Hilbert-space squared-distance interpretation after a nonnegative subcritical potential is added.
] <rem:zero-potential>

We prove the theorem through reciprocal matrices. The reciprocal inertia condition comes from the McCullough–Quiggin theory #cite(label("McCullough1994")) #cite(label("Quiggin1994")). For finite-valued positive-definite kernels whose entries never vanish, it characterizes the complete Nevanlinna–Pick property #cite(label("AglerMcCarthy2000")) Corollary 1.12. Quiggin established the reciprocal condition for a class of weighted one-dimensional Sobolev kernels, represented by Green functions of regular Sturm–Liouville problems #cite(label("Quiggin1994")) Section 2.2, Corollary 2.2.2 and Theorem 2.2.3. Here this condition serves as an algebraic model; all the matrix and analytic arguments needed for the singular Green kernel will be given below.

Say that a real symmetric matrix has property (P) if it has at most one positive eigenvalue, counted with multiplicity. This property is preserved by positive diagonal congruence, subtraction of a positive semidefinite matrix, passage to principal submatrices, and limits of matrices of fixed size. Reciprocals below are always #emph[entrywise], never matrix inverses.

The fixed interior point $p$ connects (P) to the desired conditional negativity. Adjoining it to boundary points will give a reciprocal matrix with zero diagonal, boundary block $B_(i j) = 1 \/ N \( s_i \, s_j \)$ for $i eq.not j$, and border $ell_i = 1 \/ K \( p \, s_i \)$. Property (P) for this bordered matrix forces $x^T B x lt.eq 0$ on $ell^T x = 0$; the substitution $x_i = K \( p \, s_i \) a_i$ turns this into the required inequality for $sum_i a_i = 0$. We prove this last algebraic step at the end of the section.

We first construct bounded regularizations of $G$ whose reciprocals have (P), and prove that updates along a column of the current kernel matrix preserve this condition. The resolvent construction then uses four limits, in order: refine a positive quadrature at fixed $epsilon.alt > 0$ and compactly supported $0 lt.eq rho lt.eq q$; let $epsilon.alt arrow.b 0$; send the moving evaluation points radially to the circle while fixing $p$; and finally increase $rho$ to $q$. Compact support keeps the Poisson sections bounded during the boundary step.

=== 5.1 A bounded regularization of the Green kernel <a-bounded-regularization-of-the-green-kernel>

Direct quadrature of $G$ would encounter the infinite value $G \( z \, z \)$ at every integration node. We therefore need a bounded replacement with finite positive diagonal that retains the reciprocal condition (P).

The scalar integral used below is an equivalent form of the logarithmic-mean representations in #cite(label("QiZhangLi2014")). We derive it and then establish the positive-semidefinite disk-kernel property that we need.

#thm([Lemma 5.3.])[
  #emph[There are bounded continuous strictly positive kernels $C_epsilon.alt$ on $bb(D) times bb(D)$, $0 < epsilon.alt lt.eq 1$, such that $C_epsilon.alt arrow.t G$ as $epsilon.alt arrow.b 0$, including on the diagonal, and every finite matrix $\( 1 \/ C_epsilon.alt \( x_i \, x_j \) \)_(i \, j)$ has (P).]
] <lem:regularization>

#proof[
  Put
  $ h \( x \, y \) = frac(\| x - y \|^2, \( 1 - \| x \|^2 \) \( 1 - \| y \|^2 \)) \, #h(2em) L \( h \) = frac(1, log \( 1 + 1 \/ h \)) med \( h > 0 \) \, quad L \( 0 \) = 0 \, $
  and $f \( h \) = h + 1 / 2 - L \( h \)$. After multiplying the $x$- and $y$-entries by $1 - \| x \|^2$ and $1 - \| y \|^2$, respectively, the kernel $h + 1 / 2$ becomes
  #[#set math.equation(numbering: n => "(5.2)")
   $ 1 / 2 \( 1 + \| x \|^2 \) \( 1 + \| y \|^2 \) - 2 x dot.op y . $ <eq:lorentz>]
  This is a positive rank-one kernel minus a positive semidefinite kernel, so $h + 1 / 2$ has (P) on finite sets.
  Since $1 \/ G = 4 pi L \( h \)$, the identity $L = \( h + 1 / 2 \) - f$ will be useful once we prove that $f \( h \( x \, y \) \)$ is positive semidefinite. For $h > 0$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ L \( h \) = integral_0^1 h^(1 - alpha) \( h + 1 \)^alpha thin upright(d) alpha . $ <eq:log-mean>]
  For $0 < alpha < 1$, let $c_alpha$ normalize $v^(alpha - 1) \( 1 + v \)^(- 1) thin upright(d) v$ to a probability measure on $\( 0 \, oo \)$, and set $r = \( 1 + v \)^(- 1)$. Integration by parts gives
  $ bb(E)_alpha \( 1 - r \) = c_alpha integral_0^oo frac(v^alpha, \( 1 + v \)^2) thin upright(d) v = alpha . $
  For $h > 0$, scaling $v$ in the normalized integral yields
  #[#set math.equation(numbering: n => "(5.4)")
   $ h^(1 - alpha) \( h + 1 \)^alpha & = c_alpha integral_0^oo frac(h \( h + 1 \), \( h + 1 \) + v h) v^(alpha - 1) thin upright(d) v\
 & = bb(E)_alpha frac(h \( h + 1 \), h + r) = bb(E)_alpha [h + \( 1 - r \) - frac(r \( 1 - r \), h + r)] . $ <eq:mixture-algebra>]
  The last equality remains true at $h = 0$. Integrating in $alpha$ therefore gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ f \( h \) = integral_0^1 bb(E)_alpha frac(r \( 1 - r \), h + r) thin upright(d) alpha \, #h(2em) 0 lt.eq f \( h \) lt.eq f \( 0 \) = 1 / 2 . $ <eq:f-mixture>]
  Now
  $ k \( x \, y \) = frac(1, 1 + h \( x \, y \)) = frac(\( 1 - \| x \|^2 \) \( 1 - \| y \|^2 \), \| 1 - x overline(y) \|^2) $
  is positive semidefinite. Indeed $\( 1 - x overline(y) \)^(- 1)$ is a Gram kernel by its power series; multiplying it by its complex conjugate and the positive diagonal factors preserves positive semidefiniteness. For fixed $0 < r < 1$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ frac(1, h + r) = sum_(n gt.eq 0) \( 1 - r \)^n k^(n + 1) \, $ <eq:schur-geometric>]
  where powers are entrywise. This series converges even when $h = 0$. Each power is positive semidefinite, as follows by taking tensor products of Gram vectors. Thus $1 \/ \( h + r \)$ is positive semidefinite, and the positive mixture (5.5) proves the claim. The mixture has finite entries by the displayed bound, including on the diagonal.
  Define
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(1, C_epsilon.alt \( x \, y \)) = 4 pi #scale(x: 120%, y: 120%)[\[] h + 1 / 2 - \( 1 - epsilon.alt \) f \( h \) #scale(x: 120%, y: 120%)[\]] = 4 pi #scale(x: 120%, y: 120%)[\[] L \( h \) + epsilon.alt f \( h \) #scale(x: 120%, y: 120%)[\]] . $ <eq:C-epsilon>]
  Its reciprocal matrix has (P) by (5.2) and the positive semidefiniteness just proved. Its denominator is at least $2 pi epsilon.alt$, because
  $ L + epsilon.alt f = epsilon.alt \( h + 1 / 2 \) + \( 1 - epsilon.alt \) L gt.eq epsilon.alt \/ 2 . $
  It is positive and continuous, so $C_epsilon.alt$ is bounded, continuous, and strictly positive. Since $f gt.eq 0$, these kernels increase to $G$ by (4.3), and $0 < C_epsilon.alt lt.eq G$. On the diagonal $C_epsilon.alt \( x \, x \) = 1 \/ \( 2 pi epsilon.alt \)$, as required. ◻
]

=== 5.2 A finite resolvent update <a-finite-resolvent-update>

#thm([Lemma 5.4.])[
  #emph[Let $M$ be a real symmetric finite matrix with strictly positive entries such that its reciprocal has (P). For any index $z$ and any $c gt.eq 0$, the matrix 
$ tilde(M)_(i j) = M_(i j) + c M_(i z) M_(z j) $

 also has a reciprocal with (P).]
] <lem:update>

#proof[
  Positive diagonal congruence transforms the reciprocal of $M$ into
  $ H_(i j) = frac(M_(i z) M_(z j), M_(i j)) . $
  Writing $a = M_(z z) > 0$, its $z$-row and column are identically $a$. Put $z$ last, and let $H_0$ denote the remaining principal block. Subtracting the last row from every other row, and doing the same to the columns, gives the congruence
  $ H med tilde.op med mat(delim: "(", H_0 - a upright(bold(1)) upright(bold(1))^T, 0; 0, a) . $
  Because $a > 0$ and $H$ has (P), the first block is nonpositive. Hence
  $ U = a upright(bold(1)) upright(bold(1))^T - H succ.curly.eq 0 . $
  Since $H_(i i) > 0$, one has $0 lt.eq U_(i i) < a$, and positive-semidefinite Cauchy–Schwarz gives $\| U_(i j) \| < a$.
  Using the same diagonal normalization, the new reciprocal has entries $H_(i j) \/ \( 1 + c H_(i j) \)$. The difference from the constant rank-one kernel is
  #[#set math.equation(numbering: n => "(5.8)")
   $ frac(a, 1 + c a) - frac(H_(i j), 1 + c H_(i j)) & = frac(U_(i j), \( 1 + c a \) \( 1 + c a - c U_(i j) \))\
 & = sum_(n gt.eq 0) frac(c^n U_(i j)^(n + 1), \( 1 + c a \)^(n + 2)) . $ <eq:update-series>]
  The series converges absolutely because $\| c U_(i j) \| < 1 + c a$. Its coefficients are nonnegative and every entrywise power of $U$ is positive semidefinite, even if $U$ has negative entries. Thus the normalized reciprocal of $tilde(M)$ is a positive rank-one kernel minus a positive semidefinite matrix, proving (P). For $c = 0$ the identity reduces directly to $U$. ◻
]

=== 5.3 The interior resolvent kernel <the-interior-resolvent-kernel>

For $0 lt.eq rho lt.eq q$ supported on a compact subset of $bb(D)$, let $T_rho$ be the Green operator on $L^2 \( rho \)$ and define

#[#set math.equation(numbering: n => "(5.9)")
 $ M^rho \( x \, y \) = G \( x \, y \) + chevron.l G \( x \, dot.op \) \, \( I - T_rho \)^(- 1) G \( y \, dot.op \) chevron.r_rho . $ <eq:M-rho>]

It is finite for distinct interior points, since its Green sections belong to $L^2 \( rho \)$, and has infinite diagonal.

#thm([Proposition 5.5.])[
  #emph[For every finite set of interior points, the reciprocal matrix of $M^rho$, with diagonal zero, has (P).]
] <prop:interior-reciprocal>

#proof[
  First fix $epsilon.alt > 0$ and replace $G$ throughout (5.9) by $C = C_epsilon.alt$. Its integral operator $T_C$ on $L^2 \( rho \)$ satisfies
  $ \| T_C f \| lt.eq T_rho \| f \| \, #h(2em) lr(bar.v.double T_C bar.v.double) lt.eq d < 1 . $
  The absolute pointwise domination proves the norm bound without requiring a separate positivity assertion about its quadratic form.
  Partition a compact integration set into finitely many measurable cells with uniformly vanishing diameters. For each cell of positive $rho$-mass, choose a representative, and let $pi$ send that cell to the representative. Use its mass as the quadrature weight. Uniform continuity gives uniform convergence of
  $ C \( pi \( dot.op \) \, pi \( dot.op \) \) arrow.r C $
  on the integration set up to null sets. The associated operators $T_pi$ on $L^2 \( rho \)$ converge to $T_C$ in operator norm; for example their norm difference is at most $rho \( bb(D) \)$ times the uniform kernel error. Likewise $C \( x \, pi \( dot.op \) \) arrow.r C \( x \, dot.op \)$ in $L^2 \( rho \)$ for each fixed evaluation point $x$. In particular, sufficiently fine quadratures have $lr(bar.v.double T_pi bar.v.double) < 1$, and
  #[#set math.equation(numbering: n => "(5.10)")
   $ C \( x \, y \) + chevron.l C \( x \, pi \( dot.op \) \) \, \( I - T_pi \)^(- 1) C \( y \, pi \( dot.op \) \) chevron.r_rho $ <eq:quadrature-resolvent>]
  converges to the regularized continuum resolvent evaluation. This follows from convergence of the source vectors and of the inverses in operator norm.
  For clarity, if the nodes and weights are $z_alpha \, w_alpha$, set
  $ sans(T)_(alpha beta) = sqrt(w_alpha) thin C \( z_alpha \, z_beta \) sqrt(w_beta) \, #h(2em) \( xi_x \)_alpha = sqrt(w_alpha) thin C \( x \, z_alpha \) . $
  The normalized cell indicators form an orthonormal basis for the step functions. On this subspace $T_pi$ is represented by $sans(T)$, and it vanishes on the orthogonal complement. Thus $lr(bar.v.double sans(T) bar.v.double) < 1$, and the correction in (5.10) is $xi_x^T \( I - sans(T) \)^(- 1) xi_y$. Evaluation points enter only these finite vectors, including when they coincide with nodes.
  We next prove (P) for each sufficiently fine quadrature. On the union of the evaluation points and quadrature nodes, start with $M_(i j) = C \( x_i \, x_j \)$. By 15, its reciprocal has (P). Expanding the finite resolvent sums all chains, multiplying kernel entries along each chain and the quadrature weight at every intermediate occurrence. These nonnegative sums are finite by the preceding matrix formula. Restricting the allowed intermediate nodes gives a subseries and hence remains finite.
  Suppose some nodes have been allowed and their chain sum is $M$. Admit one more node $z$ of weight $w > 0$. Chains with exactly $k gt.eq 1$ internal occurrences of $z$ have total weight
  $ w^k M_(i z) M_(z z)^(k - 1) M_(z j) . $
  All factors are positive. Finiteness of the full series forces $w M_(z z) < 1$, and summing over $k$ updates the matrix to
  #[#set math.equation(numbering: n => "(5.11)")
   $ M_(i j) + frac(w, 1 - w M_(z z)) M_(i z) M_(z j) . $ <eq:elimination>]
  16 therefore propagates (P) one node at a time. This counting remains valid when an endpoint is a quadrature node, since only internal occurrences receive weights. Coincident node locations may be merged by adding their weights. Thus the discrete kernel (5.10) has the required reciprocal property. The quadrature limit gives it for the regularized continuum kernel. If $rho = 0$, this conclusion follows directly from 15.
  Finally let $epsilon.alt arrow.b 0$. Every chain integral increases to its counterpart with $G$ by monotone convergence, as does the sum of these nonnegative integrals. Off the diagonal, its limit is (5.9), and the correction is finite because
  $ \| chevron.l G \( x \, dot.op \) \, \( I - T_rho \)^(- 1) G \( y \, dot.op \) chevron.r_rho \| lt.eq frac(lr(bar.v.double G \( x \, dot.op \) bar.v.double)_rho lr(bar.v.double G \( y \, dot.op \) bar.v.double)_rho, 1 - d) . $
  The direct diagonal term tends to infinity, so its reciprocal tends to zero. Finite entrywise limits preserve (P), completing the proof. ◻
]

=== 5.4 The boundary limit <the-boundary-limit>

For compactly supported $rho$, write $K^rho \, R^rho \, N^rho$ for the kernels in (4.5)–(4.5) with $q$ replaced by $rho$. The boundary limit will be taken with this compact support fixed, before increasing $rho$ to $q$.

#thm([Lemma 5.6.])[
  #emph[For distinct $s_1 \, dots.h \, s_m in bb(S)^1$ and $p in bb(D)$, the matrix 
#[#set math.equation(numbering: n => "(5.12)")
 $ mat(delim: "(", B, ell; ell^T, 0) \, #h(2em) B_(i j) = cases(delim: "{", 1 \/ N \( s_i \, s_j \) \, & i eq.not j \,, 0 \, & i = j \,) #h(2em) ell_i = 1 \/ K \( p \, s_i \) \, $ <eq:bordered>]

 has (P).]
] <lem:bordered>

#proof[
  Fix compactly supported $0 lt.eq rho lt.eq q$. Apply 17 to the points $r s_1 \, dots.h \, r s_m \, p$, with $r arrow.t 1$ and $r > \| p \|$. The explicit Green formula gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ frac(G \( r s \, x \), 1 - r) & arrow.r P_s \( x \) \,\
frac(G \( r s \, r t \), \( 1 - r \)^2) & arrow.r N_0 \( s \, t \) #h(2em) \( s eq.not t \) . $ <eq:radial-one>]
  The first convergence is uniform on compact interior sets. For the second, one may use
  $ G \( r s \, r t \) = frac(1, 4 pi) log (1 + frac(\( 1 - r^2 \)^2, r^2 \| s - t \|^2)) . $
  The bounded resolvent in (5.9) and the uniform convergence on $"supp" rho$ therefore imply
  $ frac(M^rho \( r s_i \, r s_j \), \( 1 - r \)^2) arrow.r N^rho \( s_i \, s_j \) quad \( i eq.not j \) \, #h(2em) frac(M^rho \( p \, r s_i \), 1 - r) arrow.r K^rho \( p \, s_i \) . $
  Here the first resolvent correction tends to $chevron.l P_(s_i) \, \( I - T_rho \)^(- 1) P_(s_j) chevron.r_rho = R^rho \( s_i \, s_j \)$. The second tends to $P_(s_i) \( p \) + chevron.l G \( p \, dot.op \) \, \( I - T_rho \)^(- 1) P_(s_i) chevron.r_rho = K^rho \( p \, s_i \)$. These pairings are legitimate on the compact support, where the Poisson kernels are bounded.
  Scale the reciprocal matrix by positive diagonal congruence with factors $1 - r$ at the moving points and factor $1$ at $p$. Its limit is (5.12) with $K^rho \, N^rho$, so it has (P). The zero diagonal stays zero throughout.
  Now choose increasing disk cutoffs $thin upright(d) rho_n = upright(bold(1))_({ \| x \| lt.eq r_n }) thin upright(d) q$, with $r_n arrow.t 1$. Every term of $K^(rho_n)$ and $R^(rho_n)$ is a nonnegative chain integral. Monotone convergence in each finite product integral and then in the series gives
  $ K^(rho_n) \( p \, s \) arrow.t K \( p \, s \) \, #h(2em) N^(rho_n) \( s \, t \) arrow.t N \( s \, t \) quad \( s eq.not t \) . $
  These limits are finite by 10. Taking the reciprocals and the finite matrix limit proves (5.12). No $L^2 \( q \)$ boundary limit of an individual Poisson kernel has been used. ◻
]

#proof[
  Use the matrix of 18. We first show that $x^T B x lt.eq 0$ whenever $ell^T x = 0$. If instead $x^T B x > 0$, choose $y$ with $ell^T y eq.not 0$ and replace it by
  $ y - frac(x^T B y, x^T B x) x . $
  Then $x^T B y = 0$ and still $ell^T y eq.not 0$. In the bordered form, $\( x \, 0 \)$ and $\( y \, c \)$ are orthogonal, and $c$ can be chosen so that
  $ \( y \, c \)^T mat(delim: "(", B, ell; ell^T, 0) \( y \, c \) = y^T B y + 2 c ell^T y > 0 . $
  They would span a two-dimensional positive subspace, contradicting (P).
  Finally, for coefficients with $sum_i a_i = 0$, put $x_i = K \( p \, s_i \) a_i$. Then $ell^T x = 0$ and
  $ sum_(i \, j) a_i a_j D_p \( s_i \, s_j \) = x^T B x lt.eq 0 . $
  This proves the assertion on distinct points; repeated points are handled by combining their coefficients. ◻
]

== 6 Hilbert multipliers and the absence of critical points <sec:conclusion>

We now use the conditional negativity proved in 13 to construct all the scalar multipliers needed in 12 at once. The Hilbert-space construction is the classical squared-distance correspondence of Schoenberg #cite(label("Schoenberg1938")); we give the short Gram-kernel proof.

#thm([Lemma 6.1.])[
  #emph[For every $p in bb(D)$ there is an injective Lipschitz map $b : bb(S)^1 arrow.r cal(H)$, where $cal(H)$ is a separable real Hilbert space, such that 
#[#set math.equation(numbering: n => "(6.1)")
 $ lr(bar.v.double b \( s \) - b \( t \) bar.v.double)_(cal(H))^2 = D_p \( s \, t \) . $ <eq:hilbert-distance>]

]
] <lem:hilbert>

#proof[
  Fix $s_0 in bb(S)^1$. Conditional negativity makes the anchored kernel
  $ Gamma \( s \, t \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] D_p \( s \, s_0 \) + D_p \( t \, s_0 \) - D_p \( s \, t \) #scale(x: 120%, y: 120%)[\)] $
  positive semidefinite: append to any finite family of coefficients the coefficient at $s_0$ that makes their sum zero. Give formal finite linear combinations of symbols $b \( s \)$ the bilinear form with Gram kernel $Gamma$, quotient by its nullspace, and complete. Since $D_p \( s \, s \) = 0$, this realizes (6.1) and $b \( s_0 \) = 0$.
  Positivity of $K$ and finiteness and positivity of $N$ off the diagonal give $D_p \( s \, t \) > 0$ for $s eq.not t$, so $b$ is injective. Also $N gt.eq N_0$ gives
  $ lr(bar.v.double b \( s \) - b \( t \) bar.v.double)_(cal(H))^2 lt.eq pi lr(bar.v.double K \( p \, dot.op \) bar.v.double)_oo^2 \| s - t \|^2 . $
  Thus $b$ is Lipschitz. Replace $cal(H)$ by the closed span of $b \( bb(S)^1 \)$; it is separable by continuity and separability of the circle. ◻
]

#proof[
  Take an arbitrary $0 eq.not u in cal(V)$, with $g$ defined by (4.12). Suppose $Phi \( p \)$ is a critical point. Choose $b$ from 19, and let $b_j$ be its coordinates in a finite or countable orthonormal basis. Each $b_j$ is real Lipschitz, so 12 applies. For partial sums, the absolute integrand is bounded by
  $ N \( s \, t \) sum_(j lt.eq m) \| b_j \( s \) - b_j \( t \) \|^2 \| g \( s \) \| \| g \( t \) \| & lt.eq N \( s \, t \) D_p \( s \, t \) \| g \( s \) \| \| g \( t \) \|\
 & = K \( p \, s \) K \( p \, t \) \| g \( s \) \| \| g \( t \) \| . $
  The right side is bounded and integrable. Dominated convergence therefore gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ sum_j E \( b_j g \) & = 1 / 2 integral.double K \( p \, s \) K \( p \, t \) g \( s \) dot.op g \( t \) thin upright(d) s thin upright(d) t\
 & = 1 / 2 lr(|integral_(bb(S)^1) K \( p \, s \) g \( s \) thin upright(d) s|)^2 = 1 / 2 \| W_g \( p \) \|^2 = 0 . $ <eq:sum-energy>]
  Every summand is nonnegative. By (4.9), for every $j$ there is $v_j in cal(V)$ whose boundary gradient, pulled back by $Phi$, is $b_j g$. The trace equality holds pointwise because both sides are continuous. The boundary gradient of $u$ is $g$.
  Set $S_g = { s in bb(S)^1 : g \( s \) eq.not 0 }$. This is a nonempty open set. If it were empty, each Cartesian derivative of $u$ would solve the Helmholtz equation with zero Dirichlet trace, contradicting $mu < lambda_D$ unless both vanished. Then $u$ would be a constant eigenfunction for a positive eigenvalue, hence zero.
  The two possibilities for $S_g$ lead respectively to multiplicity and boundary-uniqueness contradictions.
  #emph[Case 1: $S_g$ is dense.] The set $b \( S_g \)$ cannot lie in an affine line. Otherwise continuity would place $b \( bb(S)^1 \)$ in that closed line, but a continuous injective circle cannot map into a line. Indeed its compact connected image would be an interval; deleting an interior point disconnects an interval but not a circle with one point removed.
  Choose three points of $S_g$ whose images are affinely independent. Their two difference vectors are linearly independent in $cal(H)$, so some two coordinates $j \, k$ have a nonzero $2 times 2$ minor. To see this, if all such minors vanished, a nonzero coordinate of the first difference vector would force every coordinate of the second to be proportional to it. Thus the functions $1 \, b_j \, b_k$ are linearly independent on those three points. Since $g eq.not 0$ there, the vector traces $g \, b_j g \, b_k g$ are linearly independent. They are gradient traces of three functions in $cal(V)$, contradicting 6.
  #emph[Case 2: $S_g$ is not dense.] There is a nonempty open arc $I$ on which $g = 0$. Since $S_g$ is nonempty and open and $b$ is injective, some coordinate $b_j$ is nonconstant on $S_g$. Consequently $g$ and $b_j g$ are linearly independent, and so are their eigenfunctions $u$ and $v_j$. Their gradients vanish on the boundary arc $Phi \( I \)$, so each has a constant trace there. Choose a nonzero linear combination $w$ of them whose constant trace on that arc is zero. It also has zero normal derivative there.
  Take a small neighborhood of an interior point of the arc that meets no other boundary portion, and extend $w$ by zero to the exterior of $Omega$ in that neighborhood. This is a local version of the zero-extension argument in #cite(label("Filonov2005")) Lemma, p. 414. Integration by parts against compactly supported tests shows that this extension solves $\( Delta + mu \) w = 0$ distributionally: both its Dirichlet and normal traces on the intervening boundary vanish. Interior elliptic regularity and analyticity make the extension analytic. Since it is zero on an exterior open set, it is zero throughout a smaller neighborhood. Analytic continuation inside the connected domain gives $w = 0$ on $Omega$, contradicting independence of $u$ and $v_j$. No analyticity of the boundary is used.
  Both cases contradict the assumed critical point. Thus $nabla u$ is nowhere zero in $Omega$. The continuous function $u$ attains both extrema on the compact closure. Any interior extremum would be critical, so both are attained on the boundary. An interior value equal to either boundary extremum would itself be a global extremum. This proves both strict inequalities in (1.2). ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
