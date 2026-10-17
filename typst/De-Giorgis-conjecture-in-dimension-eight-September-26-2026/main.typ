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

#align(center)[#text(size: 16pt, weight: "bold")[A positive resolution of De Giorgi's conjecture \
in dimension eight]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

==== 1 Introduction <sec:introduction>

Consider the scalar Allen–Cahn equation

#[#set math.equation(numbering: n => "(1)")
 $ Delta u = u^3 - u . $ <eq:allen-cahn>]

The function

$ g \( s \) = tanh \( s \/ sqrt(2) \) $

is its increasing one-dimensional transition from $- 1$ to $1$. Thus $u \( x \) = g \( e dot.op x - c \)$ solves (1) whenever $e$ is a unit vector; its level sets are parallel hyperplanes. De Giorgi’s conjecture asks whether every bounded entire solution that is strictly increasing in a fixed direction has this form in ambient dimension at most eight #cite(label("DeGiorgi1979")).

The conjecture connects phase transitions with the Bernstein problem for minimal hypersurfaces. For the quartic potential

$ W \( s \) = 1 / 4 \( 1 - s^2 \)^2 \, $

the rescaled phase-transition energies have surface tension times perimeter as their variational limit #cite(label("ModicaMortola1977")) #cite(label("Modica1987")). The graph condition in the minimal-surface problem is important: nonflat minimizing cones occur in ambient dimension eight, whereas nonaffine entire minimal graphs first occur in ambient dimension nine #cite(label("Simons1968")) #cite(label("BDG1969")). The corresponding distinction between stable and monotone Allen–Cahn solutions will also enter our proof.

Theorem 2 has a geometric parallel in the stable Bernstein theorem for complete, connected, two-sided stable smooth minimal immersions of boundaryless six-manifolds into $bb(R)^7$: their images are entire affine hyperplanes, with no volume-growth hypothesis #cite(label("HongLiWang2026")) Theorem 1.1. The Bernstein theorem is not an input to our argument.

Ghoussoub and Gui established the conjecture in dimension two #cite(label("GhoussoubGui1998")), and Ambrosio and Cabré in dimension three #cite(label("AmbrosioCabre2000")). Savin proved the result through dimension eight under the additional assumption

$ lim_(t arrow.r - oo) u \( x' \, t \) = - 1 \, #h(2em) lim_(t arrow.r + oo) u \( x' \, t \) = 1 quad upright("for every ") x' in bb(R)^(n - 1) $

#cite(label("Savin2009")) Theorem 2.4. These limits are pointwise in the transverse variable. Del Pino, Kowalczyk and Wei constructed nonplanar strictly monotone solutions in every ambient dimension at least nine, near large dilations of nonaffine minimal graphs #cite(label("DPKW2011")). The main result of this paper gives a positive resolution in dimension eight without an assumption on the directional limits.

#thm([Theorem 1.])[
  (Monotone rigidity in dimension eight).  #emph[Let $u in C^2 \( bb(R)^8 \, \( - 1 \, 1 \) \)$ satisfy 
$ Delta u = u^3 - u \, #h(2em) partial_8 u > 0 quad upright("in ") bb(R)^8 . $

 Then there are $e in bb(S)^7$ with $e_8 > 0$ and $c in bb(R)$ such that 
$ u \( x \) = tanh #h(-0.16667em) (frac(e dot.op x - c, sqrt(2))) #h(2em) upright("for every ") x in bb(R)^8 . $

]
] <thm:monotone>

Neither energy growth nor minimization is assumed. Those properties, and the well limits, will be consequences of the argument. Both rigidity theorems concern the scalar quartic equation (1); the monotonicity assumption in Theorem 1 is strict positivity of $partial_8 u$.

===== 1.1 The stable equation <the-stable-equation>

For an open set $Omega subset bb(R)^n$ write

$ cal(E) \( v \; Omega \) = integral_Omega (1 / 2 \| nabla v \|^2 + W \( v \)) thin upright(d) x . $

A solution $v$ is #emph[stable] if its second variation satisfies

#[#set math.equation(numbering: n => "(2)")
 $ Q_v \( phi \) := integral_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] \| nabla phi \|^2 + \( 3 v^2 - 1 \) phi^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) x gt.eq 0 #h(2em) upright("for every ") phi in C_c^1 \( bb(R)^n \) . $ <eq:stability-definition>]

A #emph[global minimizer] minimizes $cal(E)$ in every ball among $H^1$ competitors with the same boundary trace. Stability requires only the quadratic inequality, so it is a weaker condition than minimization.

A strictly positive directional derivative solves the linearized equation and gives stability. Moreover, the limits along that direction are stable solutions in one fewer variable. This observation makes the following classification the analytic core of the paper.

#thm([Theorem 2.])[
  (Stable rigidity in dimension seven).  #emph[Let $v in C^2 \( bb(R)^7 \, \[ - 1 \, 1 \] \)$ be a stable solution of $Delta v = v^3 - v$. Then either $v equiv 1$, $v equiv - 1$, or 
$ v \( x \) = tanh #h(-0.16667em) (frac(a dot.op x - b, sqrt(2))) #h(2em) upright("for some ") a in bb(S)^6 \, med b in bb(R) . $

 No energy-growth assumption is required.]
] <thm:stable>

This stability endpoint is sharp: Pacard and Wei constructed bounded stable nonplanar solutions in dimension eight #cite(label("PacardWei2013")). For the smooth quartic equation, Liu, Luo, Wang, Juncheng Wei, Yong Wei and Wu prove stable rigidity in dimension three and monotone rigidity in dimension four #cite(label("LLWWW2026")). The same conclusions are obtained independently by Chan, Fernández-Real, Figalli, Florit-Simon and Serra #cite(label("CFFFS2026")) Theorem 1.1 and Corollary 1.2. Florit-Simon and Serra prove stable rigidity in dimension four under a bounded-energy-density hypothesis #cite(label("FSS2025")). Both the higher dimension and the removal of the density assumption matter here; they require different parts of the analysis.

===== 1.2 From stable end profiles to the monotone theorem <from-stable-end-profiles-to-the-monotone-theorem>

We give the complete deduction of Theorem 1 from Theorem 2 at the beginning of the paper. The comparison with competitors between the directional limits is due to Alberti, Ambrosio and Cabré #cite(label("AlbertiAmbrosioCabre2001")) Theorem 4.4. Jerison and Monneau established the minimizing-end-profile reduction #cite(label("JerisonMonneau2004")) Theorem 1.3. The positive derivative supplies stability, and the directional limits are stable seven-dimensional solutions. Their classification allows constant wells or planar transitions at this stage. Each is a global minimizer, by the one-dimensional calibration. Clipping a competitor between the two end profiles and sliding translates of $u$ then shows that $u$ is itself a global minimizer. Comparison with a constant phase inside a large ball gives $cal(E) \( u \; B_R \) lt.eq C R^7$.

The surface tension in this normalization is

#[#set math.equation(numbering: n => "(3)")
 $ s_0 = integral_(- 1)^1 sqrt(2 W \( t \)) thin upright(d) t = integral_(bb(R)) g' \( s \)^2 thin upright(d) s = frac(2 sqrt(2), 3) . $ <eq:intro-tension>]

Under dilations $u \( R_j x \)$ with $R_j arrow.r oo$, the minimizing comparison identifies the entire limiting energy measure with $s_0$ times the perimeter measure of a minimizing boundary. This equality needs a recovery sequence patched to the original solution; convergence of the phases alone would leave open the possibility of extra energy.

Energy monotonicity makes the limiting boundary a cone, that is, a boundary preserved by dilations about the origin. Directional monotonicity fixes the sign of one component of its normal. In dimension eight the minimizing-boundary regularity theory allows only a possible singularity at the vertex #cite(label("Federer1970")). The classical directed-cone argument then forces a hyperplane #cite(label("Schnuerer2003")). We include the case in which that normal component vanishes identically: it gives translation invariance, which is incompatible with an isolated singular vertex. The limiting density is therefore that of one planar transition. Wang’s near-unit-density theorem #cite(label("Wang2017")) Theorem 11.1 returns to the original solution, and the one-dimensional equation determines the profile and its orientation.

This deduction explains why the stable theorem is the right target. It also separates the classical geometric reduction from the new estimates needed for stable solutions. A reader interested primarily in the conjecture can follow the deduction first; a reader interested in the stable classification can proceed directly from its statement to the analytic argument in Part II. The classical gradient bound and energy monotonicity needed by both paths are proved in Section 2.

===== 1.3 The finite-density step <the-finite-density-step>

Let $omega_(n - 1)$ be the volume of the unit ball in $bb(R)^(n - 1)$. For a solution in $bb(R)^n$ define

$ M_R \( y \) = frac(cal(E) \( v \; B_R \( y \) \), s_0 omega_(n - 1) R^(n - 1)) \, #h(2em) M_oo = sup_(R > 0) M_R \( 0 \) . $

A single planar transition has limiting density one. The first analytic step is the following result, which is also needed locally in the argument that removes the density bound.

#thm([Theorem 3.])[
  (Finite-density stable rigidity).  #emph[Let $4 lt.eq n lt.eq 7$. Suppose $v in C^2 \( bb(R)^n \, \[ - 1 \, 1 \] \)$ solves $Delta v = v^3 - v$ and satisfies 
$ integral_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] \| nabla phi \|^2 + \( 3 v^2 - 1 \) phi^2 #scale(x: 120%, y: 120%)[\)] thin upright(d) x gt.eq 0 #h(2em) upright("for every ") phi in C_c^1 \( bb(R)^n \) . $

 If $M_oo < oo$, then $v equiv 1$, $v equiv - 1$, or $v \( x \) = g \( a dot.op x - b \)$ for some $a in bb(S)^(n - 1)$ and $b in bb(R)$.]
] <thm:finite>

For stable solutions in $bb(R)^7$, the remaining task is to prove that $M_oo$ is finite. A penalized reach measures both the bending of a zero sheet and its proximity to other sheets; the finite-density theorem supplies local regularity at nearly this scale. Combining reach geometry with stability bounds the fourth curvature moment and squared defect, controlling the regions where the zero set is poorly approximated by planes. We then compare the reach inequality with an ambient stability test built from the same radial amplitude on the sheets. The cost of joining neighboring amplitudes is small enough to leave a strict positive margin, which contradicts the amount of surface area forced by unbounded density.

===== 1.4 Organization and conventions <organization-and-conventions>

Part I gives the complete deduction from stable end profiles to Theorem 1, conditional on Theorem 2. Appendix 2 explains compatibility with the dimension-nine construction of del Pino, Kowalczyk and Wei. After an optional guide to the analytical strategy in Section 1, Part II proves the diffuse estimates, Theorem 3, and its local regularity consequence. Part III develops the reach and interface estimates, joins the ambient and surface tests, and proves fourth-moment growth. Part IV constructs the radial ambient test and completes the unbounded-density contradiction. Thus the reading order places the geometric application first, while the analytic proof of the stable theorem is contained in Parts II–IV. For a direct analytical reading, begin at Section 2, whose opening recalls the equation, stability and all normalizations used there; the strategy section can be read beforehand or consulted later.

We write $n = m + 1$, so $m$ is the interface dimension, and use $thin upright(d) S$ for induced surface measure. The surface tension $s_0$ and the normal-average constant $sigma = 2 s_0$ are kept distinct. All stability tests are unrestricted compactly supported tests. Uniformity in translating centers, the order of parameter choices, and successive limits are specified in the statements where they are needed.

==== 2 Two classical estimates for the quartic equation <sec:classical-estimates>

Both the geometric deduction and the analytical classification use the same gradient bound and energy monotonicity. We record their short proofs here, independently of either rigidity theorem. Let $n = m + 1 gt.eq 2$ and let $v in C^2 \( bb(R)^n \, \[ - 1 \, 1 \] \)$ solve $Delta v = v^3 - v$. Throughout,

$ W \( t \) = 1 / 4 \( 1 - t^2 \)^2 \, #h(2em) s_0 = frac(2 sqrt(2), 3) \, $

and $omega_m$ denotes the volume of the unit ball in $bb(R)^m$. Interior elliptic estimates bootstrap $v$ to a smooth function with uniform bounds for every derivative of fixed order.

===== 2.1 Modica’s gradient estimate <modicas-gradient-estimate>

We use Modica’s gradient bound #cite(label("Modica1985")),

#[#set math.equation(numbering: n => "(4)")
 $ 1 / 2 \| nabla v \|^2 lt.eq W \( v \) . $ <eq:diffuse-modica>]

For completeness, its entire-solution argument in this normalization is short. For $P = \| nabla v \|^2 \/ 2 - W \( v \)$, the identities $nabla P = nabla^2 v nabla v - W' \( v \) nabla v$ and $Delta P = \| nabla^2 v \|^2 - W' \( v \)^2$ imply, wherever $nabla v eq.not 0$,

$ Delta P gt.eq frac(2 W' \( v \), \| nabla v \|^2) nabla v dot.op nabla P . $

If $sup P > 0$, translate a maximizing sequence and pass to a locally smooth limit. Its $P$ attains a positive maximum. The strong maximum principle makes $P$ constant on the component of ${ nabla v eq.not 0 }$ containing that point. This component is also closed: on it $\| nabla v \|^2 gt.eq 2 sup P > 0$. It is therefore all of $bb(R)^n$. The globally bounded smooth vector field $nabla v$ has complete forward flow, and along that flow $v$ increases at rate at least $2 sup P$, contradicting its boundedness. This proves (4).

===== 2.2 Normalized energy and monotonicity <normalized-energy-and-monotonicity>

We recall Modica’s energy monotonicity formula #cite(label("Modica1989")) and give the stress-tensor calculation in the present normalization. Set

#[#set math.equation(numbering: n => "(5)")
 $ e \( v \) = 1 / 2 \| nabla v \|^2 + W \( v \) \, #h(2em) M_r \( y \) = frac(1, s_0 omega_m r^m) integral_(B_r \( y \)) e \( v \) \, #h(2em) M_oo = sup_(r > 0) M_r \( 0 \) . $ <eq:finite-density>]

The stress tensor $e \( v \) upright("Id") - nabla v ⊗ nabla v$ is divergence free. Its contraction with the derivative of $x - y$, followed by the divergence theorem, gives

$ r integral_(partial B_r \( y \)) #scale(x: 120%, y: 120%)[\(] e \( v \) - \| partial_r v \|^2 #scale(x: 120%, y: 120%)[\)] = integral_(B_r \( y \)) #scale(x: 120%, y: 120%)[\(] \( m + 1 \) e \( v \) - \| nabla v \|^2 #scale(x: 120%, y: 120%)[\)] . $

Consequently

#[#set math.equation(numbering: n => "(6)")
 $ M'_r \( y \) = frac(1, s_0 omega_m) {r^(- m - 1) integral_(B_r \( y \)) (W \( v \) - 1 / 2 \| nabla v \|^2) + r^(- m) integral_(partial B_r \( y \)) \| partial_r v \|^2} gt.eq 0 . $ <eq:finite-monotonicity>]

The formula initially holds for almost every $r$ and hence in integrated form for every pair of radii. Containment of shifted balls shows that the limit at infinity is independent of $y$, and $M_r \( y \) lt.eq M_oo$.

The derivation uses neither stability nor a density-growth hypothesis.

== 1 The geometric deduction <the-geometric-deduction>

==== 1.1 From stable end profiles to the monotone theorem <sec:monotone>

In this part we deduce Theorem 1 from the unrestricted seven-dimensional classification in Theorem 2, whose independent analytical proof occupies Parts II–IV. None of those parts uses the geometric deduction given here. The end profiles will initially be allowed to be planar heteroclinics. Their minimizing property suffices for the argument; no well limit is imposed on the given solution. We first derive minimization and surface-order energy growth, then identify the complete limiting energy with perimeter. Only after this exact identification do we use the geometry of a directed minimizing cone and return to the equation at unit density.

We use the energy $cal(E)$ and global minimizers defined in Section 1. It is enough to consider competitors valued in $\[ - 1 \, 1 \]$: truncation to this interval decreases both terms of the energy. This definition also gives minimization in every bounded Lipschitz domain: extend a same-trace competitor by $u$ to a containing ball, use the Sobolev gluing property across the boundary, and cancel the identical exterior energies. We retain the normalization

#[#set math.equation(numbering: n => "(1.1)")
 $ s_0 = integral_(- 1)^1 sqrt(2 W \( a \)) thin upright(d) a = integral_(bb(R)) g' \( s \)^2 thin upright(d) s = frac(2 sqrt(2), 3) = sigma / 2 . $ <eq:monotone-tension>]

===== 1.1.1 Stable end profiles and a variational comparison <stable-end-profiles-and-a-variational-comparison>

The first task is to turn strict monotonicity into minimizing barriers. The positive directional derivative gives stability, and a long-cylinder test transfers that stability to the seven-dimensional limits. Their classification then supplies a calibration, even when a limit is a planar profile rather than a constant well.

#thm([Lemma 1.1.])[
  (End profiles).  #emph[Let $u in C^2 \( bb(R)^8 \, \( - 1 \, 1 \) \)$ solve $Delta u = u^3 - u$ and satisfy $u_8 > 0$. There are smooth stable solutions $v_(-) \, v_(+) : bb(R)^7 arrow.r \[ - 1 \, 1 \]$ such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ u \( x' \, t + s \) arrow.r v_plus.minus \( x' \) quad upright("in ") C_(upright("loc"))^k \( bb(R)^8 \) quad upright("as ") s arrow.r plus.minus oo \, #h(2em) k gt.eq 0 . $ <eq:monotone-end-convergence>]

 They satisfy $v_(-) \( x' \) < u \( x' \, t \) < v_(+) \( x' \)$ everywhere. Their extensions independent of the eighth coordinate are global minimizers in $bb(R)^8$.]
] <lem:monotone-ends>

#proof[
  Elliptic interior estimates, applied on unit balls, give smoothness and uniform bounds for every fixed derivative order of $u$. The function $h = u_8 > 0$ satisfies $\( - Delta + 3 u^2 - 1 \) h = 0$. For every compactly supported $C^1$ function $eta$, integration by parts gives the ground-state identity
  #[#set math.equation(numbering: n => "(1.3)")
   $ integral_(bb(R)^8) #scale(x: 120%, y: 120%)[\(] \| nabla eta \|^2 + \( 3 u^2 - 1 \) eta^2 #scale(x: 120%, y: 120%)[\)] = integral_(bb(R)^8) h^2 lr(|nabla (eta / h)|)^2 gt.eq 0 . $ <eq:monotone-ground-state>]
  The division is legitimate because $h$ has a positive minimum on the support of $eta$.
  Bounded monotonicity gives pointwise limits along each vertical line. Translation compactness and the derivative bounds improve this to (1.2). Indeed every convergent subsequence has the same pointwise limit, and a bounded vertical shift leaves that limit unchanged. Passing the equation and stability to these limits first gives solutions and stability in eight dimensions. To see stability in seven dimensions, fix $phi in C_c^1 \( bb(R)^7 \)$ and a nonzero $zeta in C_c^1 \( bb(R) \)$. Test with $eta \( x' \, t \) = phi \( x' \) zeta \( t \/ L \)$ and divide by $L integral zeta^2$. The result is
  $ integral_(bb(R)^7) #scale(x: 120%, y: 120%)[\(] \| nabla phi \|^2 + \( 3 v_plus.minus^2 - 1 \) phi^2 #scale(x: 120%, y: 120%)[\)] gt.eq - 1 / L^2 frac(integral \| zeta' \|^2, integral zeta^2) integral_(bb(R)^7) phi^2 . $
  Letting $L arrow.r oo$ proves the assertion. For example, $u \( x' \, t \) < u \( x' \, t + 1 \) lt.eq v_(+) \( x' \)$, which proves the strict upper inequality; the lower one is analogous.
  Theorem 2 says that each $v_plus.minus$ is a constant well or a planar heteroclinic. To check the minimizing assertion directly, put $Phi \( a \) = integral_(- 1)^a sqrt(2 W \( b \)) thin upright(d) b$. For a unit vector $e$ and a competitor $w in H^1 \( Omega \, \[ - 1 \, 1 \] \)$,
  #[#set math.equation(numbering: n => "(1.4)")
   $ 1 / 2 \| nabla w \|^2 + W \( w \) gt.eq sqrt(2 W \( w \)) thin partial_e w = partial_e Phi \( w \) . $ <eq:monotone-calibration>]
  There is equality when $w \( x \) = g \( e dot.op x - c \)$, since $g' = sqrt(2 W \( g \))$. The integral of the last expression depends only on the boundary trace. Thus such a profile minimizes on every ball, in any ambient dimension in which $e$ is a unit vector. This includes the extensions of the seven-dimensional profiles, with $e_8 = 0$. The constants $plus.minus 1$ have zero energy and also minimize. ◻
]

The next comparison also applies in other dimensions. It records exactly which property of the end profiles is used. The constrained comparison between end profiles was proved by Alberti, Ambrosio and Cabré #cite(label("AlbertiAmbrosioCabre2001")) Theorem 4.4. The unrestricted minimization implication is the classical theorem of #cite(label("JerisonMonneau2004"), form: "prose") Theorem 1.3, p. 441; proof on pp. 452–453; we include the compact comparison argument in the present normalization. Its globally $C^(1 \, 1)$ potential hypothesis is met by

$ tilde(W) \( s \) = cases(delim: "{", \( s + 1 \)^2 \, & s < - 1 \,, W \( s \) \, & - 1 lt.eq s lt.eq 1 \,, \( s - 1 \)^2 \, & s > 1 .) $

The values and the first two derivatives match at the wells, and $tilde(W)'$ is globally Lipschitz. Both potentials are nonnegative and agree on $\[ - 1 \, 1 \]$. Clipping any competitor to this interval decreases its gradient energy and replaces its exterior potential by zero for either potential, so their minimizing comparisons for $u$ agree.

#thm([Lemma 1.2.])[
  (Minimizing barriers and compact sliding).  #emph[Let $N gt.eq 2$, and suppose a bounded solution $u : bb(R)^(N - 1) times bb(R) arrow.r \( - 1 \, 1 \)$ of $Delta u = W' \( u \)$ is strictly increasing in the last coordinate. Suppose its vertical limits $a_plus.minus \( x' \)$, extended to $bb(R)^N$, are global minimizers. Then $u$ is a global minimizer. Moreover there is a dimensional constant $C_N$ such that 
#[#set math.equation(numbering: n => "(1.5)")
 $ cal(E) \( u \; B_R \( y \) \) lt.eq C_N R^(N - 1) #h(2em) \( y in bb(R)^N \, med R gt.eq 2 \) . $ <eq:monotone-energy-growth>]

]
] <lem:monotone-minimizer>

#proof[
  Fix a ball $B$. The direct method produces an energy minimizer $w$ with boundary trace $u$; truncation allows $\| w \| lt.eq 1$. First clip it from below by $a_(-)$, writing $w_1 = max { w \, a_(-) }$. The Sobolev lattice identity is
  $ cal(E) \( max { w \, a_(-) } \; B \) + cal(E) \( min { w \, a_(-) } \; B \) = cal(E) \( w \; B \) + cal(E) \( a_(-) \; B \) . $
  Since $u > a_(-)$ on $partial B$, the minimum on the left has the same trace as $a_(-)$. Minimality of $a_(-)$ therefore shows $cal(E) \( w_1 \; B \) lt.eq cal(E) \( w \; B \)$. The maximum has trace $u$, so it remains an unconstrained minimizer. The analogous upper clipping gives another unconstrained minimizer $tilde(w) = min { w_1 \, a_(+) }$ satisfying $a_(-) lt.eq tilde(w) lt.eq a_(+)$.
  The Euler–Lagrange equation and elliptic boundary regularity make $tilde(w)$ smooth up to $partial B$. A difference of two solutions $b \, c$ here satisfies $- Delta \( b - c \) + \( b^2 + b c + c^2 - 1 \) \( b - c \) = 0$, with bounded zeroth-order coefficient. Strong comparison for a nonnegative solution of this linear equation, together with the strict boundary inequalities, gives
  $ a_(-) < tilde(w) < a_(+) quad upright("on ") overline(B) . $
  These gaps have positive minima on this compact set. Vertical translates $u_s \( x' \, t \) = u \( x' \, t + s \)$ converge uniformly there to $a_(+)$ as $s arrow.r + oo$, so $u_s > tilde(w)$ for all sufficiently large $s$. Let
  $ s_(*) = inf { s gt.eq 0 : u_s gt.eq tilde(w) upright(" on ") overline(B) } . $
  The set inside the infimum is an upper interval, by strict monotonicity. Continuity gives $u_(s_(*)) gt.eq tilde(w)$. If $s_(*) > 0$, then $u_(s_(*)) > u = tilde(w)$ on $partial B$, and strong comparison gives strict inequality throughout $overline(B)$. Compactness and continuity then allow a smaller positive translation, a contradiction. Thus $tilde(w) lt.eq u$. For the reverse inequality, $u_(- s)$ lies below $tilde(w)$ when $s$ is large. Decrease $s gt.eq 0$ until first contact. A positive first-contact parameter is again impossible, because $u_(- s) < u = tilde(w)$ on $partial B$ and strong comparison gives a strict compact gap. At $s = 0$ this yields $u lt.eq tilde(w)$. Consequently $u = tilde(w)$ on $B$, and $B$ was arbitrary.
  Finally choose a smooth cutoff $eta_R$ that is zero on $B_(R - 1) \( y \)$, one near $partial B_R \( y \)$, and satisfies $\| nabla eta_R \| lt.eq C$. The competitor $1 + eta_R \( u - 1 \)$ has zero energy in the inner ball and bounded energy density in the remaining shell. The latter assertion uses $\| u \| lt.eq 1$ and the uniform unit-scale interior gradient estimate for the equation. The shell has volume at most $C_N R^(N - 1)$, proving (1.5). ◻
]

Lemmas 4 and 5 apply to the solution of Theorem 1. They establish minimization and the required energy growth directly from its hypotheses and Theorem 2.

===== 1.1.2 Exact convergence to a minimizing boundary <exact-convergence-to-a-minimizing-boundary>

We have obtained the variational comparison needed for the blow-down. The remaining issue in this step is equality of measures: phase convergence and a perimeter lower bound alone would permit additional diffuse energy. We eliminate that possibility by comparing with a recovery sequence patched to the original solution in a thin annular layer. This argument does not require a prescribed trace for the recovery sequence.

We use the following established variational and geometric inputs. For a finite-perimeter set $F$ in a bounded Lipschitz domain $Omega$, the Modica–Mortola recovery theorem provides, for any sequence $epsilon_j arrow.b 0$, functions $w_j in H^1 \( Omega \, \[ - 1 \, 1 \] \)$ such that

#[#set math.equation(numbering: n => "(1.6)")
 $ w_j & arrow.r 2 upright(bold(1))_F - 1 quad upright("in ") L^1 \( Omega \) \,\
limsup_j integral_Omega (epsilon_j / 2 \| nabla w_j \|^2 + frac(W \( w_j \), epsilon_j)) & lt.eq s_0 P \( F \; Omega \) . $ <eq:monotone-recovery>]

Here $P \( F \; Omega \) = \| D upright(bold(1))_F \| \( Omega \)$ is relative perimeter #cite(label("ModicaMortola1977")); the finite-perimeter recovery statement is also proved in #cite(label("Modica1987"), form: "prose") Section 3, pp. 140–141. For a locally perimeter-minimizing set in $bb(R)^N$, its perimeter measure defines a stationary integral varifold with multiplicity one on the reduced boundary. Its support is a smooth embedded minimal hypersurface outside a closed singular set of Hausdorff dimension at most $N - 8$ (and the singular set is empty when $N lt.eq 7$). The centered area ratio is nondecreasing, and equality at all scales forces a cone. These are the classical regularity, dimension-reduction, and monotonicity results for minimizing boundaries #cite(label("Federer1969")) #cite(label("Giusti1984")) #cite(label("Simons1968")); for the sharp singular-set dimension bound, see #cite(label("Federer1970"), form: "prose") Theorem 1, p. 769. The argument below uses recovery and comparison to prove exact energy convergence before using this multiplicity-one geometric theory.

#thm([Proposition 1.3.])[
  (Exact perimeter limit).  #emph[Let $u : bb(R)^N arrow.r \[ - 1 \, 1 \]$ be an entire global minimizer with $cal(E) \( u \; B_R \) lt.eq C R^(N - 1)$ for $R gt.eq 2$. Given $R_j arrow.r oo$, set $epsilon_j = R_j^(- 1)$ and $u_j \( x \) = u \( R_j x \)$. After taking a subsequence there is a locally finite-perimeter set $E$ such that 
#[#set math.equation(numbering: n => "(1.7)")
 $ u_j & arrow.r 2 upright(bold(1))_E - 1 &  & upright("in ") L_(upright("loc"))^1 \( bb(R)^N \) \,\
(epsilon_j / 2 \| nabla u_j \|^2 + frac(W \( u_j \), epsilon_j)) thin upright(d) x & harpoon.rt s_0 \| D upright(bold(1))_E \| &  & upright("as local Radon measures") . $ <eq:monotone-exact-limit>]

 The set $E$ is locally perimeter minimizing against compact perturbations.]
] <prop:monotone-exact-limit>

#proof[
  #emph[Compactness and the lower bound.] Recall the phase primitive $Phi \( a \) = integral_(- 1)^a sqrt(2 W \( b \)) thin thin upright(d) b$. Denote the rescaled energy by $cal(E)_j$ and its energy measure by $mu_j$. Scaling the minimizing comparison shows that $u_j$ minimizes $cal(E)_j$ against every compact modification. A change of variables gives
  #[#set math.equation(numbering: n => "(1.8)")
   $ mu_j \( B_r \) = R_j^(1 - N) cal(E) \( u \; B_(R_j r) \) . $ <eq:monotone-rescaled-energy>]
  Thus these measures are locally bounded. Moreover
  $ \| nabla Phi \( u_j \) \| lt.eq epsilon_j / 2 \| nabla u_j \|^2 + frac(W \( u_j \), epsilon_j) \, #h(2em) integral_K W \( u_j \) lt.eq epsilon_j mu_j \( K \) arrow.r 0 $
  on each compact set $K$. Local BV compactness, followed by a diagonal subsequence, implies that $Phi \( u_j \)$ has an $L_(upright("loc"))^1$ limit. The vanishing potential forces its values to lie in ${ Phi \( - 1 \) \, Phi \( 1 \) } = { 0 \, s_0 }$. The inverse of $Phi$ is uniformly continuous on $\[ 0 \, s_0 \]$, so this also proves the asserted local $L^1$ convergence of $u_j$ to $2 upright(bold(1))_E - 1$. Weak compactness of $mu_j$ and lower semicontinuity of total variation give a local measure limit $mu$ satisfying
  #[#set math.equation(numbering: n => "(1.9)")
   $ mu gt.eq s_0 \| D upright(bold(1))_E \| . $ <eq:monotone-perimeter-lower>]
  #emph[A recovery comparison with the correct boundary trace.] We prove the opposite inequality, including the boundary gluing. Fix a ball $B_r \( y \)$ and $delta > 0$. Let $F$ be a finite-perimeter set in $B_(r + delta) \( y \)$ that agrees with $E$ on the annulus $A = B_(r + delta) \( y \) \\ overline(B_r \( y \))$. The case $F = E$ is permitted. Choose a recovery sequence $w_j$ on this larger ball as in (1.6). Both $w_j$ and $u_j$ converge on $A$ to $2 upright(bold(1))_E - 1$. Their boundedness implies
  #[#set math.equation(numbering: n => "(1.10)")
   $ integral_A \| u_j - w_j \|^2 lt.eq 2 integral_A \| u_j - w_j \| arrow.r 0 . $ <eq:monotone-annulus-mismatch>]
  For $epsilon_j < delta \/ 4$, partition all but a remainder of $A$ into $L_j = floor.l delta \/ epsilon_j floor.r - 1$ disjoint radial layers of thickness $epsilon_j$. Thus $L_j gt.eq delta \/ \( 2 epsilon_j \)$, and the outer remainder leaves a neighborhood of $partial B_(r + delta) \( y \)$ untouched. In one such layer $S$, let $chi$ increase from zero to one, with $\| nabla chi \| lt.eq C \/ epsilon_j$, and interpolate by $z_j = \( 1 - chi \) w_j + chi u_j$. The cutoff is zero on the inner side and one on the outer side. On $\[ - 1 \, 1 \]$, boundedness of $W''$ and $\| W' \|^2 lt.eq C W$ give, uniformly for $0 lt.eq chi lt.eq 1$,
  $ W \( \( 1 - chi \) a + chi b \) lt.eq C #scale(x: 120%, y: 120%)[\(] W \( a \) + W \( b \) + \| a - b \|^2 #scale(x: 120%, y: 120%)[\)] . $
  Expanding the gradient therefore yields
  #[#set math.equation(numbering: n => "(1.11)")
   $ cal(E)_j \( z_j \; S \) lt.eq C #scale(x: 120%, y: 120%)[\(] cal(E)_j \( u_j \; S \) + cal(E)_j \( w_j \; S \) #scale(x: 120%, y: 120%)[\)] + C / epsilon_j integral_S \| u_j - w_j \|^2 . $ <eq:monotone-strip-cost>]
  Averaging the right-hand side over the disjoint layers selects $S_j$ with cost at most
  #[#set math.equation(numbering: n => "(1.12)")
   $ C epsilon_j / delta #scale(x: 120%, y: 120%)[\(] cal(E)_j \( u_j \; A \) + cal(E)_j \( w_j \; A \) #scale(x: 120%, y: 120%)[\)] + C / delta integral_A \| u_j - w_j \|^2 = o_j \( 1 \) . $ <eq:monotone-strip-average>]
  Here $delta$ is fixed before $j arrow.r oo$; the two energies are bounded by compactness and recovery. In particular no rate for the $L^1$ convergence is needed: the averaging cancels the factor $epsilon_j^(- 1)$ multiplying the mismatch in a single layer.
  Use $w_j$ inside $S_j$, the interpolation on $S_j$, and $u_j$ outside $S_j$. This is an admissible compact modification of $u_j$. Its minimizing property, and nonnegativity of the original energy in the part of the annulus inside $S_j$, give
  $ cal(E)_j \( u_j \; B_r \( y \) \) lt.eq cal(E)_j \( w_j \; B_(r + delta) \( y \) \) + o_j \( 1 \) . $
  Consequently, whenever $mu \( partial B_r \( y \) \) = 0$,
  #[#set math.equation(numbering: n => "(1.13)")
   $ mu \( B_r \( y \) \) lt.eq s_0 P \( F \; B_(r + delta) \( y \) \) . $ <eq:monotone-competitor-bound>]
  #emph[Equality of energy and perimeter, then minimality.] First set $F = E$. At radii with $mu \( partial B_r \( y \) \) = \| D upright(bold(1))_E \| \( partial B_r \( y \) \) = 0$, send $delta arrow.b 0$ in (1.13). These are all but countably many radii at each center. Together with (1.9), the resulting inequalities on balls prove $mu = s_0 \| D upright(bold(1))_E \|$ as measures. More explicitly, $mu - s_0 \| D upright(bold(1))_E \|$ is already a nonnegative Radon measure by (1.9), and it vanishes on these balls, which form a neighborhood basis. In particular no additional transition-layer mass remains.
  Next suppose $F triangle.stroked.t E$ is compactly contained in an open ball. Choose $r$ outside that compact set, inside the ball, and with zero perimeter measure on $partial B_r \( y \)$. Then $F = E$ near this sphere, so it is a continuity sphere for both perimeter measures. Apply (1.13) and let $delta arrow.b 0$ to obtain $P \( E \; B_r \( y \) \) lt.eq P \( F \; B_r \( y \) \)$. The perimeter measures coincide outside the compact modification; hence this proves local perimeter minimality, as asserted. ◻
]

===== 1.1.3 The directed minimizing cone in dimension eight <the-directed-minimizing-cone-in-dimension-eight>

The exact limit is now available together with perimeter minimality. We next combine energy monotonicity with vertical monotonicity: the first makes the limiting boundary a cone, while the second fixes the sign of its vertical normal component. In this geometric step, dimension eight enters when we analyze the singular set of this cone.

For our eight-dimensional solution, the gradient inequality (4) and monotonicity formula (6) give a nondecreasing normalized energy

$ M_r \( u \) = frac(cal(E) \( u \; B_r \), s_0 omega_7 r^7) . $

By (1.5) it has a finite limit $M_oo$. This limit is positive, since $u$ is nonconstant and its energy is positive on some ball. Apply Proposition 6 to any sequence $R_j arrow.r oo$. At continuity radii, its exact convergence and (1.8) imply

#[#set math.equation(numbering: n => "(1.14)")
 $ P \( E \; B_r \) = omega_7 r^7 M_oo . $ <eq:monotone-cone-ratios>]

Squeezing between continuity radii proves this identity for every $r > 0$. Thus the stationary varifold of the minimizing boundary has constant centered area ratio. The equality case of monotonicity makes its support

$ C = "supp" \| D upright(bold(1))_E \| $

a cone with vertex at the origin. It is nonempty and contains the origin. Its multiplicity is one, since its weight is the perimeter measure.

Vertical monotonicity also survives this convergence. For each nonnegative $psi in C_c^1 \( bb(R)^8 \)$,

$ - integral u_j thin partial_8 psi = integral \( partial_8 u_j \) psi gt.eq 0 . $

The $L^1$ limit gives $partial_8 upright(bold(1))_E gt.eq 0$ as a distribution and hence as a measure. Let $nu_E$ denote the unit normal pointing #emph[into] $E$ on the regular boundary, so that $D upright(bold(1))_E = nu_E \| D upright(bold(1))_E \|$. Then

#[#set math.equation(numbering: n => "(1.15)")
 $ nu_E dot.op e_8 gt.eq 0 quad upright("on the regular part of ") C . $ <eq:monotone-directed-cone>]

#thm([Lemma 1.4.])[
  (Flatness of the directed cone).  #emph[Let $E subset bb(R)^8$ be locally perimeter minimizing. Suppose its nonempty boundary support $C$ is a cone with vertex $0$ and $partial_8 upright(bold(1))_E gt.eq 0$. Then $C$ is a hyperplane, with perimeter multiplicity one.]
] <lem:monotone-flat-cone>

#proof[
  This is the classical directed-cone reduction; see also #cite(label("Schnuerer2003"), form: "prose") Theorem 4.5 and Corollary 4.6. We give its short proof to make the treatment of the vertex explicit. #emph[The cone has a smooth compact link.] The singular-set dimension bound is at most zero. A nonzero singular point would, by dilation invariance, generate a whole singular ray: each dilation is an ambient diffeomorphism preserving $C$, and therefore preserves the distinction between smooth and singular boundary points. This is impossible, so $"Sing" C subset { 0 }$. Consequently
  $ Lambda = C ∩ bb(S)^7 $
  is a smooth compact embedded minimal hypersurface of $bb(S)^7$, possibly with several connected components. The oriented normal is continuous on the regular boundary. Since tangent normal lines are dilation invariant and the choice of side is continuous, that orientation is constant along every regular ray: it takes values in the same two-point set along that connected ray. This uses conicality of the support and does not presume conicality of $E$. The function $f = nu_E dot.op e_8 gt.eq 0$ is therefore homogeneous of degree zero.
  The normal component of a Euclidean translation on a minimal hypersurface satisfies the Jacobi equation #cite(label("Simons1968")) Corollary 3.3.1, p. 74
  $ Delta_C f + \| A_C \|^2 f = 0 . $
  The cone metric is $thin upright(d) r^2 + r^2 g_Lambda$ and $\| A_C \|^2 = r^(- 2) \| A_Lambda \|^2$, where $A_Lambda$ is the second fundamental form of $Lambda$ in the sphere. Thus
  #[#set math.equation(numbering: n => "(1.16)")
   $ Delta_Lambda f + \| A_Lambda \|^2 f = 0 . $ <eq:monotone-link-jacobi>]
  We separate the case where this nonnegative function is positive on a link component from the case where it vanishes on every component. #emph[A positive directional normal component.] On a connected component where $f$ is not identically zero, the strong maximum principle gives $f > 0$. Integration of (1.16) on that compact component yields $integral \| A_Lambda \|^2 f = 0$, so it is totally geodesic. A connected compact embedded totally geodesic hypersurface of the sphere is a whole equatorial $bb(S)^6$. Any other component, being disjoint from this equator, would lie in one of its open hemispheres. This cannot happen: the corresponding signed coordinate function $ell$ on a closed minimal six-dimensional hypersurface of $bb(S)^7$ satisfies $Delta_Lambda ell + 6 ell = 0$, hence has integral zero, whereas in an open hemisphere it has strict constant sign. There are consequently no other components, and $C$ is the hyperplane over that equator.
  #emph[A vanishing directional normal component.] It remains to handle the case $f equiv 0$ on all of $Lambda$. Perimeter measure gives zero mass to the possible singular point, so now
  #[#set math.equation(numbering: n => "(1.17)")
   $ partial_8 upright(bold(1))_E = 0 quad upright("on all of ") bb(R)^8 . $ <eq:monotone-vertical-invariance>]
  A locally integrable function whose distributional derivative in one direction vanishes is invariant under translations in that direction. For example this follows by mollifying, applying the assertion to the smooth functions, and passing to the local $L^1$ limit. Thus each vertical translation preserves $upright(bold(1))_E$ as an $L_(upright("loc"))^1$ class, and also preserves its perimeter measure, its support $C$, and the singular set of that support. If $0$ were singular, every point of the vertical axis would be singular, contradicting $"Sing" C subset { 0 }$. Therefore the origin is regular. A cone smooth at its vertex equals its tangent hyperplane there: dilating toward the origin keeps the cone fixed while its smooth local graphs converge to that tangent plane. This proves flatness in the remaining case. In either case the weight is $cal(H)^7 corner.l.b C$, by the multiplicity-one structure of a minimizing boundary. ◻
]

Applying Lemma 7 to (1.14) shows

#[#set math.equation(numbering: n => "(1.18)")
 $ M_oo \( u \) = 1 . $ <eq:monotone-unit-density>]

This is the point where the exact measure convergence in Proposition 6 is needed: flat support alone would not determine the diffuse energy density.

===== 1.1.4 Return to the equation and the exact profile <return-to-the-equation-and-the-exact-profile>

The near-unit-density theorem of Wang #cite(label("Wang2017")) Theorem 11.1, p. 3036 says that, in every ambient dimension $N$, a nonconstant bounded entire Allen–Cahn solution with the Modica bound and

$ lim_(R arrow.r oo) frac(cal(E) \( u \; B_R \), s_0 omega_(N - 1) R^(N - 1)) lt.eq 1 + delta_N $

for a sufficiently small dimensional $delta_N > 0$ is one-dimensional. The constant wells can be included as the separate trivial alternatives; see also #cite(label("FSS2025"), form: "prose") Theorem 2.16. Our solution has the required range and Modica bound, is nonconstant by $u_8 > 0$, and satisfies this energy condition by (1.18). Hence $u \( x \) = h \( e dot.op x \)$ for some unit vector $e$.

For completeness we recover the profile and its orientation directly. Since $u_8 = e_8 h' > 0$, we have $e_8 eq.not 0$; reversing $e$ and the scalar coordinate if necessary gives $e_8 > 0$ and $h' > 0$ everywhere. The finite limits $a_plus.minus = lim_(s arrow.r plus.minus oo) h \( s \)$ are distinct and lie in $\[ - 1 \, 1 \]$. Translated compactness for the ODE $h'' = h^3 - h$ shows $a_plus.minus^3 - a_plus.minus = 0$ and $h' \( s \) arrow.r 0$ at both ends. Indeed any translated subsequential limit at an end is the constant $a_plus.minus$, and the uniform derivative bounds give convergence of its derivatives. The first integral is

$ 1 / 2 h' \( s \)^2 - W \( h \( s \) \) = upright("constant") . $

Taking both limits gives $W \( a_(-) \) = W \( a_(+) \)$. Among the three stationary roots $- 1 \, 0 \, 1$, the only distinct pair with equal potential is $- 1 \, 1$. Thus $a_(-) = - 1$, $a_(+) = 1$, and the first integral and $h' > 0$ give

$ h' = frac(1 - h^2, sqrt(2)) \, #h(2em) h \( s \) = tanh (frac(s - c, sqrt(2))) $

for some $c in bb(R)$. This proves Theorem 1, including the condition $e_8 > 0$. Conversely this formula has strict range $\( - 1 \, 1 \)$, satisfies $g'' = g^3 - g$, and obeys $u_8 = e_8 g' \( e dot.op x - c \) > 0$.

== 2 Stable solutions with finite density <stable-solutions-with-finite-density>

==== 2.1 Guide to the analytical proof <sec:analytic-strategy>

This section explains how the three analytical parts fit together. It may be skipped on a first reading: the definitions and proofs begin afresh in Section 2.

===== 2.1.1 Finite density and the diffuse defect <finite-density-and-the-diffuse-defect>

The main quantities measure departure from a planar transition. For $\| v \| < 1$, put

$ q = 1 - v^2 \, #h(2em) U = g^(- 1) \( v \) \, #h(2em) D = 1 - \| nabla U \|^2 . $

Modica’s gradient bound gives $D gt.eq 0$ #cite(label("Modica1985")). A planar transition has affine $U$ and $D = 0$. For a stable solution the amplitude $q$ gives the exact identity

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 lt.eq Q_v \( q eta \) = integral_(bb(R)^n) q^2 \| nabla eta \|^2 thin upright(d) x - integral_(bb(R)^n) q^3 D eta^2 thin upright(d) x #h(2em) \( eta in C_c^1 \( bb(R)^n \) \) . $ <eq:intro-defect-test>]

The inverse-profile formulation and this test also occur in #cite(label("LLWWW2026"), form: "prose") Lemma 2.1; we derive them in the present dimension. The second term detects defect, including at zeros where a smooth level-set description is unavailable.

At a regular point of $Sigma = { v = 0 }$, let $nu = nabla U \/ \| nabla U \|$ be the normal pointing toward increasing $v$, let $A = d nu \|_(T Sigma)$ be the second fundamental form, and set $H = "tr" A$. Small defect gives a local description by one nearly planar transition. For its normal averages the appropriate normalization is

$ G \( s \) = 1 - g \( s \)^2 \, #h(2em) sigma = integral_(bb(R)) G \( s \)^2 thin upright(d) s = frac(4 sqrt(2), 3) = 2 s_0 . $

For a fixed, sufficiently large normal length $P$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ I_P \( z \) = 1 / sigma integral_(- P)^P q \( z + s nu \( z \) \)^3 D \( z + s nu \( z \) \) thin upright(d) s . $ <eq:intro-normal-average>]

This is an average along a normal segment, not the pointwise defect $D \( z \)$. We prove that $I_P$ controls both curvature and mean curvature, with a sharp coefficient in the latter bound. The limiting equation obtained by normalizing $D$ by its value $D \( z_j \) arrow.r 0$ at a zero has a nonnegative source even in the normal coordinate. Separating this source from the positive homogeneous solutions gives the strict coefficient needed when the interface has dimension six.

For the later unbounded-density argument in dimension seven, we will also need a surface inequality. Lifting a surface test into the ambient equation yields

#[#set math.equation(numbering: n => "(2.3)")
 $ \( 1 - epsilon \) integral_Sigma frac(\| A \|^2 + I_P, 2) psi^2 thin upright(d) S lt.eq integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S . $ <eq:intro-surface-stability>]

Here $P$ is chosen first, sufficiently large depending on $epsilon > 0$, and $psi$ is Lipschitz and compactly supported where $D < delta$, with $delta$ then sufficiently small. The two favorable terms come from normal tube geometry and profile defect, respectively. When interaction dominates curvature, this inequality retains only about half of the mass $I_P$. The final ambient test will retain almost all of that mass for the specifically chosen radial amplitude. This improvement is what makes the eventual comparison in dimension seven decisive.

Returning to finite density, we use the preliminary critical-density and regularity results of Florit-Simon and Serra #cite(label("FSS2025")) Sections 3–5. These results apply through ambient dimension seven; their final classification theorem is four-dimensional. They reduce a possible failure of Theorem 3 to an integer-density solution whose zero set consists, away from a sparse set, of ordered sheets. The transition-layer estimates of Wang and Wei #cite(label("WangWei2019")) apply after establishing the required nonvanishing core gradient and a bound on the full ambient derivative of its direction. We keep these hypotheses explicit.

The remaining contradiction compares the nearest gap between sheets in two ways. A preliminary concave test controls the geometric errors. A sharper gap test then combines the mean-curvature bound with a radial Green estimate, while diffuse stability supplies the competing Hardy bound. Their logarithmic coefficients are incompatible through dimension seven. The resulting finite-density theorem makes every fixed finite density threshold available in the local regularity theorem used later.

===== 2.1.2 Geometry without a global density bound <geometry-without-a-global-density-bound>

The remaining task is to exclude unbounded density for a stable solution in $bb(R)^7$. The relevant geometry can first be seen in an ordinary normal tube around a smooth sheet: its points have the form $z + t nu \( z \)$, where $nu$ is the unit normal. Such a tube can cease to describe one isolated transition because the sheet bends or because a second sheet enters it. Both obstructions must be measured when the number of sheets is not known in advance.

For two different zeros $z \, y$, with $z$ regular, the ratio

$ frac(\| y - z \|^2, \| nu \( z \) dot.op \( y - z \) \|) $

is twice the radius of the normal tangent ball through $y$. When the denominator vanishes, the ratio is interpreted as $+ oo$ and there is no such finite ball. As $y$ approaches $z$, it also records curvature. We use a smoothed angular penalty to define a comparable length $d \( z \)$, called the #emph[penalized reach]. Its purpose is to retain these two geometric controls while allowing a differential comparison at a second contact point. The penalty and its precise properties are introduced where this comparison is proved.

A delayed energy-monotonicity argument finds a bounded-density window at nearly the reach scale. The preceding local regularity theorem then isolates a single sheet there, although the original solution has no global density bound. Projection onto the translation mode of $g$ improves the mean-curvature derivatives. A tangent ball on one phase side controls signed mean curvature at a remote contact. These estimates produce a differential inequality for $d$ and a change-of-variables formula that counts its positive curvature contributions with multiplicity one.

We next connect this local geometry to stability. Tests lifted from a sheet use the derivative of the one-dimensional profile. Where several lifts reach the same ambient point, their squares are added before taking a square root. The resulting gradient identity retains a nonnegative variance term. Joining these tests to $q$ near zeros with large defect preserves positive defect mass and controls the cost of the joining region. Combining the resulting inequality with the Simons–Schoen–Simon–Yau curvature method #cite(label("Simons1968")) #cite(label("SchoenSimonYau1975")) yields a fourth-moment growth bound. Interaction is measured here by $E = e^(- kappa d)$, where $kappa > 0$ is fixed by the reach penalty. The estimate controls weighted integrals of $\| A \|^4 + D^2 + E^2$, together with the weighted count of a separated net of large-defect zeros, by $K \( R \) R^(m - 4)$, where $m = 6$ and $K \( R \) = 1 + sup_x M_R \( x \)$. This gains four powers of $R$ over the corresponding weighted area bound, even though $K \( R \)$ may grow. The mean curvature need not vanish, so its derivative terms remain part of this calculation.

This passage from ambient stability to the transition set is related to the free-boundary work of Chan, Fernández-Real, Figalli and Serra #cite(label("CFFS2025")) and to #cite(label("LLWWW2026"), form: "prose") Sections 3 and 5 for the smooth quartic equation in dimension three. The latter joins $1 - v^2$ to transition-profile derivatives and uses a surface inequality, Gauss–Bonnet, and logarithmic cutoffs. Here the six-dimensional interface requires the reach inequality, the fourth-moment growth estimate, and the final radial comparison. The two joining operations also have different purposes: the first changes from ambient to surface tests near large-defect zeros; the final one interpolates amplitudes between neighboring sheets.

In that final comparison, the same radial reach weight is used in the geometric inequality and the ambient stability test. The growth estimate controls the regions where the regular-sheet description fails. On the remaining regions, the surface amplitude is extended normally and interpolated between adjacent sheets in fixed-width bands inside their logarithmic gaps. The cost is proportional to the squared difference of the two amplitudes, so it vanishes when they agree. Assign each portion of a switching band to the base with the larger uncut amplitude. On that base’s nearest gap, the reach comparison makes the amplitude ratio tend to one, so the normalized loss vanishes. Of the two possible sides at the assigned base, only the other side can therefore incur the fixed positive loss. The resulting stability estimate retains almost nine tenths of $integral_Sigma I_P psi^2 thin upright(d) S$, while the coefficient of $integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S$ stays close to one. For the same radial amplitude $psi$, this is stronger in the interaction term than (2.3) and provides the additional control of $I_P$ needed in the reach comparison. Expanding the shared radial gradient and comparing its coefficients with the reach inequality leaves a strict margin in interface dimension six. A normal-tube packing argument then converts the estimate into an area contradiction, excluding unbounded density and completing Theorem 2.

==== 2.2 Diffuse fields and a sharp mean-curvature comparison <sec:diffuse>

This section begins the analytical proof of stable rigidity. It uses the classical estimates of Section 2 and can be read independently of the geometric deduction in Part I. Its aim is to bound the mean curvature of a zero layer by the defect from a planar transition, with the strict coefficient needed for finite-density rigidity. The argument has three steps: an exact stability identity, estimates uniform after division by a small defect, and a classification of the positive functions arising in the normalized limit.

Throughout this section the ambient dimension $n gt.eq 2$ is fixed. All constants are uniform over entire solutions $v in C^2 \( bb(R)^n \, \[ - 1 \, 1 \] \)$ of

#[#set math.equation(numbering: n => "(2.4)")
 $ Delta v = v^3 - v . $ <eq:diffuse-equation>]

We call such a solution stable when

$ Q_v \( zeta \) := integral_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] \| nabla zeta \|^2 + \( 3 v^2 - 1 \) zeta^2 #scale(x: 120%, y: 120%)[\)] thin thin upright(d) x gt.eq 0 #h(2em) upright("for every ") zeta in C_c^1 \( bb(R)^n \) . $

The tests are scalar and unrestricted. The local estimates below do not require stability; we invoke it only for the quadratic-form inequality. Our normalization is

$ W \( t \) = frac(\( 1 - t^2 \)^2, 4) \, #h(2em) g \( s \) = tanh \( s \/ sqrt(2) \) \, #h(2em) G \( s \) = 1 - g \( s \)^2 . $

Thus $g' = G \/ sqrt(2)$, $g'' = g^3 - g$, and the two normalization constants used below are

#[#set math.equation(numbering: n => "(2.5)")
 $ s_0 = integral_(bb(R)) \( g' \)^2 thin thin upright(d) s = frac(2 sqrt(2), 3) \, #h(2em) sigma = integral_(bb(R)) G^2 thin thin upright(d) s = 2 s_0 = frac(4 sqrt(2), 3) . $ <eq:diffuse-tension>]

The strong maximum principle applied to $1 - v$ and $1 + v$ shows that a solution attaining either endpoint is identically that endpoint. We henceforth assume $\| v \| < 1$. Interior elliptic estimates give bounds, depending only on $n$ and the derivative order, for all derivatives of $v$.

===== 2.2.1 The inverse profile and the exact stability identity <the-inverse-profile-and-the-exact-stability-identity>

Modica’s bound (4), proved in Section 2, is $\| nabla v \|^2 lt.eq 2 W \( v \)$. For the variables introduced next it says that the inverse profile is 1-Lipschitz.

Define the inverse-profile variables

#[#set math.equation(numbering: n => "(2.6)")
 $ q = 1 - v^2 \, #h(2em) U = g^(- 1) \( v \) \, #h(2em) p = nabla U \, #h(2em) T = nabla^2 U \, #h(2em) D = 1 - \| p \|^2 . $ <eq:diffuse-variables>]

Then $0 lt.eq D lt.eq 1$, $\| p \| lt.eq 1$, and direct substitution gives

#[#set math.equation(numbering: n => "(2.7)")
 $ Delta U & = - sqrt(2) v D \,\
cal(L) D & = 2 \| T \|^2 \, & cal(L) & = - Delta + 2 sqrt(2) v p dot.op nabla + 2 q \| p \|^2 \,\
\( - Delta + 3 v^2 - 1 \) q & = - q^2 D . $ <eq:diffuse-U>]

In particular, writing $e \( v \) = \| nabla v \|^2 \/ 2 + W \( v \)$,

#[#set math.equation(numbering: n => "(2.8)")
 $ W \( v \) - 1 / 2 \| nabla v \|^2 = 1 / 4 q^2 D \, #h(2em) e \( v \) = 1 / 4 q^2 \( 2 - D \) . $ <eq:diffuse-energy>]

All positive-order derivatives of $U$ have uniform bounds as well. To see this without assuming that $v$ stays uniformly away from its endpoints, on each ball subtract $U$ at its center. The resulting function is uniformly bounded there because $\| p \| lt.eq 1$. Equation (2.7) first gives uniform interior $W^(2 \, r)$ bounds for every finite $r$, then $C^(1 \, alpha)$ bounds. Its right side is the smooth function $- sqrt(2) g \( U \) \( 1 - \| nabla U \|^2 \)$; the derivatives of every translate of $g$ are uniformly bounded. Interior Schauder estimates and induction give the assertion.

The zeroth-order coefficient in $cal(L)$ is nonnegative. If $D$ vanishes at a point, its equation and the strong minimum principle give $D equiv 0$; then $T equiv 0$. Thus $U \( x \) = e dot.op x + c$ with $\| e \| = 1$ and $v = g \( U \)$. In all subsequent arguments requiring normalization by $D$, we assume $D > 0$ everywhere.

The variables in (2.6) put the planar profile at $D = 0$. They also produce a test that detects its failure without requiring a regular zero set. For a stable solution, use $q eta$ in $Q_v$ and integrate by parts with (2.7):

#[#set math.equation(numbering: n => "(2.9)")
 $ 0 lt.eq Q_v \( q eta \) = integral_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] q^2 \| nabla eta \|^2 - q^3 D eta^2 #scale(x: 120%, y: 120%)[\)] thin thin upright(d) x . $ <eq:q-stability>]

Indeed, the cross term and the $eta^2 \| nabla q \|^2$ term combine with the potential into $integral q eta^2 \( - Delta + 3 v^2 - 1 \) q$. This is an exact identity, including for compactly supported Lipschitz $eta$ by approximation. The inverse-profile formulation and this test also appear in #cite(label("LLWWW2026"), form: "prose") Lemma 2.1; the calculation here is independent of dimension. The constant $v = 0$ is unstable: a cutoff which is one on $B_R$, vanishes outside $B_(2 R)$, and has gradient $O \( R^(- 1) \)$ gives $Q_0 < 0$ for large $R$.

===== 2.2.2 Estimates uniform relative to a small defect <estimates-uniform-relative-to-a-small-defect>

To compare zero layers later, we need estimates that remain useful as $D$ tends to zero. The first bound below controls bending, the second controls relative changes of defect, and the exponential rate fixes the cost of comparing two distant layers. The derivative estimates also specify what remains uniform when the observation window grows.

#thm([Lemma 2.1.])[
  (Uniform defect estimates).  #emph[There is a constant $C = C \( n \)$, and for each $gamma > 0$ a constant $C_gamma = C \( n \, gamma \)$, such that every solution with $D > 0$ satisfies 
#[#set math.equation(numbering: n => "(2.10)")
 $ \| T \( x \) \|^2 lt.eq C D \( x \) \, #h(2em) \| nabla D \( x \) \| lt.eq C D \( x \) \, #h(2em) D \( y \) lt.eq C_gamma e^(\( 2 sqrt(2) + gamma \) \| y - z \|) D \( z \) quad \( y \, z in bb(R)^n \) . $ <eq:diffuse-local>]

 For every $R < oo$ and integer $k gt.eq 0$ there is $C_(R \, k) = C \( n \, R \, k \)$ such that, for every center $z$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ ∥frac(D, D \( z \))∥_(C^k \( B_R \( z \) \)) + ∥T / sqrt(D \( z \))∥_(C^k \( B_R \( z \) \)) lt.eq C_(R \, k) . $ <eq:diffuse-normalized-bounds>]

 Moreover $inf_(B_R \( z \)) D gt.eq C_R^(- 1) D \( z \)$. The dependence on a growing observation radius can be made explicit: for every $k gt.eq 0$ and $gamma > 0$, with $kappa = 2 sqrt(2) + gamma$, 
#[#set math.equation(numbering: n => "(2.12)")
 $ \| nabla^k D \( x \) \| & lt.eq C_(k \, gamma) e^(kappa \| x - z \|) D \( z \) \,\
\| nabla^k T \( x \) \| & lt.eq C_(k \, gamma) e^(kappa \| x - z \| \/ 2) sqrt(D \( z \)) #h(2em) \( x \, z in bb(R)^n \) . $ <eq:diffuse-derivative-growth>]

]
] <lem:diffuse-local>

#proof[
  We first prove the pointwise bounds on a fixed ball, then the exponential comparison, and finally the normalized derivative estimates.
  #emph[Fixed-ball control.] The drift and potential in (2.7), including the derivatives of their coefficients, are uniformly bounded. Apply the weak Harnack inequality to the nonnegative supersolution $cal(L) D gt.eq 0$ on a fixed enclosing ball, for example $B_20 \( z \)$. The constant leading matrix and bounded lower-order coefficients permit an exponent greater than one; Hölder’s inequality therefore gives
  $ integral_(B_4 \( z \)) D lt.eq C D \( z \) . $
  The enclosing radius is fixed, so the constant depends only on dimension. Integrating (2.7) against a nonnegative cutoff equal to one on $B_3 \( z \)$ and supported in $B_4 \( z \)$ gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ integral_(B_3 \( z \)) \| T \|^2 lt.eq C D \( z \) . $ <eq:diffuse-T-integral>]
  Indeed all derivatives can be moved onto the cutoff and the bounded drift; in particular $"div" \( v p \)$ is uniformly bounded.
  Put $b = 2 sqrt(2) v p$. Twice differentiating (2.7), and using $D_i = - 2 \( T p \)_i$ and $D_(i j) = - 2 p_k partial_k T_(i j) - 2 \( T^2 \)_(i j)$, gives the explicit system
  #[#set math.equation(numbering: n => "(2.14)")
   $ \( Delta - b dot.op nabla \) T_(i j) = - q D T_(i j) + sqrt(2) v q D p_i p_j - q \( p_i D_j + p_j D_i \) + 2 sqrt(2) v \( T^2 \)_(i j) . $ <eq:diffuse-T-system>]
  Repeated indices are summed. Its right side is bounded in norm by $C \( D + \| T \| \)$, using $nabla D = - 2 T p$ and the preliminary uniform bound on $T$. Consequently $F_0 = D^2 + \| T \|^2$ satisfies
  $ \( - Delta + b dot.op nabla \) F_0 lt.eq C F_0 . $
  The local mean-value estimate, (2.13), and $D^2 lt.eq D$ give $\| T \( z \) \|^2 lt.eq C D \( z \)$. We may now regard the $D$ equation as a homogeneous linear equation with bounded potential $2 q \| p \|^2 - 2 \| T \|^2 \/ D$. Ordinary Harnack gives uniform local comparability of $D$. Finally apply interior $W^(2 \, r)$ estimates, $r > n$, to (2.7): its source $2 \| T \|^2$ is bounded on a fixed ball by $C D \( z \)$. Sobolev embedding gives $\| nabla D \( z \) \| lt.eq C D \( z \)$. This argument uses only the boundedness of $\| T \|^2 \/ D$, not a derivative bound for that quotient.
  #emph[The exponential rate.] Fix $kappa = 2 sqrt(2) + gamma$. For $r = \| x - y \| > 0$,
  $ cal(L) \( e^(- kappa r) \) lt.eq e^(- kappa r) [- kappa^2 + frac(\( n - 1 \) kappa, r) + 2 sqrt(2) kappa \| v \| + 2 \( 1 - v^2 \)] . $
  The maximum of the last two terms, for $\| v \| in \[ 0 \, 1 \]$, is $2 sqrt(2) kappa < kappa^2$. Hence this is negative for $r gt.eq R_gamma$, where $R_gamma$ is uniform. Local Harnack, chained a fixed number of times, provides a uniform $a_gamma > 0$ such that $a_gamma D \( y \) e^(- kappa r) lt.eq D \( x \)$ on $r = R_gamma$. For any $epsilon.alt > 0$ subtract $epsilon.alt$ from the left side; this preserves the subsolution inequality since the potential of $cal(L)$ is nonnegative. It is then negative on a sufficiently large outer sphere. Comparison on annuli and $epsilon.alt arrow.b 0$ show $D \( x \) gt.eq a_gamma D \( y \) e^(- kappa \| x - y \|)$ outside the inner ball. Harnack covers the inner ball and interchange of $x \, y$ gives the last bound in (2.10).
  #emph[Normalized derivatives.] Fix $z$, put $epsilon.alt = D \( z \)$, and set $d_epsilon.alt = D \/ epsilon.alt$, $t_epsilon.alt = T \/ sqrt(epsilon.alt)$. The estimates already proved bound $d_epsilon.alt$, $nabla d_epsilon.alt$ and $t_epsilon.alt$ on each fixed ball. Their equations are
  $ \( Delta - b dot.op nabla \) d_epsilon.alt & = 2 q \| p \|^2 d_epsilon.alt - 2 \| t_epsilon.alt \|^2 \,\
\( Delta - b dot.op nabla \) \( t_epsilon.alt \)_(i j) & = - q epsilon.alt d_epsilon.alt \( t_epsilon.alt \)_(i j) + sqrt(2 epsilon.alt) thin v q d_epsilon.alt p_i p_j - q sqrt(epsilon.alt) #scale(x: 120%, y: 120%)[\(] p_i partial_j d_epsilon.alt + p_j partial_i d_epsilon.alt #scale(x: 120%, y: 120%)[\)] + 2 sqrt(2 epsilon.alt) thin v \( t_epsilon.alt^2 \)_(i j) . $
  Their coefficients have uniform smooth bounds, and $0 < epsilon.alt lt.eq 1$. First use interior $W^(2 \, r)$ estimates on both equations and then Schauder estimates, shrinking the ball at each step. Induction gives (2.11). The lower bound for $D$ follows from the local Harnack inequality already established. Finally apply (2.11) on a unit ball centered at $x$, so that $\| nabla^k D \( x \) \| lt.eq C_k D \( x \)$ and $\| nabla^k T \( x \) \| lt.eq C_k sqrt(D \( x \))$, and use the exponential comparison between $x$ and $z$. This proves (2.12); in particular the constants on logarithmically growing windows need not be inferred from an unspecified dependence of $C_(R \, k)$ on $R$. ◻
]

===== 2.2.3 Zeros and decay inside either phase <zeros-and-decay-inside-either-phase>

The weighted identity (2.9) will eventually be compared with integrals over $Sigma = { v = 0 }$. We therefore need to know that $Sigma$ exists, and that the weight $q$ becomes exponentially small far from it. The following elementary comparison proves both facts; its open-set version will also apply to individual chambers between zero layers.

#thm([Lemma 2.2.])[
  (Clearing inside a phase).  #emph[A solution with $\| v \| < 1$ has a nonempty zero set $Sigma = { v = 0 }$. For every $0 < gamma < sqrt(2)$ there is $C_gamma = C \( n \, gamma \)$ such that 
#[#set math.equation(numbering: n => "(2.15)")
 $ q \( x \) lt.eq C_gamma e^(- \( sqrt(2) - gamma \) "dist" \( x \, Sigma \)) . $ <eq:phase-decay>]

 More generally the same estimate, with $"dist" \( x \, partial Omega \)$ in place of $"dist" \( x \, Sigma \)$, holds for any solution in an open set $Omega$ with $0 < v lt.eq 1$ there, and also with the signs reversed.]
] <lem:diffuse-phase>

#proof[
  #emph[Clearing on large balls.] Let $phi.alt_R$ be the positive first Dirichlet eigenfunction of a ball $B_R \( x \)$, normalized by $phi.alt_R \( x \) = max phi.alt_R = 1$. For $0 < c < 1$ such that $lambda_1 \( B_R \) < 1 - c^2$,
  $ Delta \( c phi.alt_R \) + c phi.alt_R - \( c phi.alt_R \)^3 = c phi.alt_R #scale(x: 120%, y: 120%)[\(] 1 - lambda_1 \( B_R \) - c^2 phi.alt_R^2 #scale(x: 120%, y: 120%)[\)] > 0 . $
  If $v > 0$ on a neighborhood of the closed ball, small multiples of $phi.alt_R$ lie below $v$. Increase the multiple up to $c$. A first interior contact contradicts the strict displayed inequality at a minimum of $v - c phi.alt_R$; boundary contact is excluded by $v > 0$ there. Thus $v \( x \) gt.eq c$. Since $lambda_1 \( B_R \) = R^(- 2) lambda_1 \( B_1 \)$, for each $c < 1$ this holds once $R$ is sufficiently large. If an entire $\| v \| < 1$ solution had no zero, connectedness would give one strict sign; letting $R arrow.r oo$ and then $c arrow.t 1$ would give $\| v \( x \) \| gt.eq 1$, a contradiction. The same comparison also shows, uniformly, that $\| v \| arrow.r 1$ when distance to a phase boundary tends to infinity.
  #emph[Decay at every rate below $sqrt(2)$.] It suffices to treat a positive phase. Write $w = 1 - v$; then $0 lt.eq w lt.eq 1$ and
  $ Delta w = \( 2 - 3 w + w^2 \) w . $
  Fix $k = sqrt(2) - gamma \/ 2$. By the preceding comparison there is a uniform $R_0$ such that $Delta w gt.eq k^2 w$ at all points whose distance to the phase boundary is at least $R_0$. If the distance of $x$ to that boundary is $d > R_0 + 1$, this inequality holds throughout $B_(d - R_0) \( x \)$. Let
  $ A_k \( r \) = frac(1, \| bb(S)^(n - 1) \|) integral_(bb(S)^(n - 1)) e^(k r theta_1) thin thin upright(d) theta . $
  The radial function $A_k \( \| y - x \| \) \/ A_k \( d - R_0 \)$ solves $Delta a = k^2 a$ and equals one on that ball’s boundary. Comparison gives $w \( x \) lt.eq A_k \( d - R_0 \)^(- 1)$. A spherical cap of angular radius $r^(- 1 \/ 2)$ about $theta_1 = 1$ shows, for $r gt.eq 1$, $A_k \( r \) gt.eq c_k r^(- \( n - 1 \) \/ 2) e^(k r)$. Absorbing the polynomial factor into $e^(gamma r \/ 2)$, and using $q lt.eq 2 w$, proves the assertion. All balls in this proof may be chosen with closure inside $Omega$ and then increased by a limit, so no boundary regularity of $Omega$ is needed. ◻
]

===== 2.2.4 The limit seen from a small-defect zero <the-limit-seen-from-a-small-defect-zero>

The preceding estimates allow division by $D$ without losing local compactness. We now identify the resulting limit and the quantity in it that measures mean curvature. At a regular zero orient the normal by $nu = p \/ \| p \|$, and use $A = thin upright(d) nu \|_(T Sigma)$, $H = "tr" A$. This sign convention gives

#[#set math.equation(numbering: n => "(2.16)")
 $ H = frac(partial_nu D, 2 \| p \|^2) #h(2em) upright("on ") Sigma_(upright("reg")) . $ <eq:diffuse-H>]

Indeed $Delta U = 0$ at a zero, while $Delta U = T \( nu \, nu \) + \| p \| H$ and $partial_nu D = - 2 \| p \| T \( nu \, nu \)$. In particular $\| H \| lt.eq C D$ and $\| A \|^2 lt.eq C D$ at zeros with $D lt.eq 1 \/ 2$, by Lemma 8.

#thm([Lemma 2.3.])[
  (Small-defect limits).  #emph[Let $v_j$ be entire solutions in the fixed dimension, and let $z_j$ be zeros with $epsilon.alt_j = D_j \( z_j \) > 0$ and $epsilon.alt_j arrow.r 0$. Translate and rotate so that $z_j = 0$ and $nu_j \( 0 \) = e_n$, and write $x = \( x' \, s \) in bb(R)^(n - 1) times bb(R)$. After a subsequence, 
#[#set math.equation(numbering: n => "(2.17)")
 $ U_j arrow.r s \, #h(2em) D_j / epsilon.alt_j arrow.r cal(D) > 0 \, #h(2em) T_j / sqrt(epsilon.alt_j) arrow.r cal(T) quad upright("in ") C_(upright("loc"))^k upright(" for every ") k gt.eq 0 . $ <eq:diffuse-limits>]

 Here $cal(D) \( 0 \) = 1$. The tensor $cal(T)$ has only tangential components, is independent of $s$, is trace free, and is harmonic in $x'$. The positive function $F \( x' \, s \) = G \( s \) cal(D) \( x' \, s \)$ obeys 
#[#set math.equation(numbering: n => "(2.18)")
 $ cal(L)_0 F = 2 G \( s \) \| cal(T) \( x' \) \|^2 \, #h(2em) cal(L)_0 = - Delta + 2 - G \( s \) . $ <eq:diffuse-limit-operator>]

 Moreover 
#[#set math.equation(numbering: n => "(2.19)")
 $ frac(H_j \( 0 \), epsilon.alt_j) arrow.r 1 / 2 F_s \( 0 \) . $ <eq:diffuse-mean-limit>]

]
] <lem:diffuse-compactness>

#proof[
  Lemma 8 gives all normalized derivative bounds on fixed balls and a positive local lower bound for $D_j \/ epsilon.alt_j$. Since $U_j \( 0 \) = 0$, $p_j \( 0 \) = sqrt(1 - epsilon.alt_j) thin e_n$, and $T_j arrow.r 0$ locally smoothly, the first convergence follows as well. The identities
  $ T_j p_j = - 1 / 2 nabla D_j \, #h(2em) \( p_j dot.op nabla \) T_j = - T_j^2 - 1 / 2 nabla^2 D_j $
  give $cal(T) e_n = 0$ and $partial_s cal(T) = 0$ after division by $sqrt(epsilon.alt_j)$. Equation (2.7) gives $"tr" cal(T) = 0$. Twice differentiating it gives $Delta T_j = - sqrt(2) nabla^2 \( v_j D_j \) = O \( epsilon.alt_j \)$ on every fixed ball, including every fixed derivative order. Thus $Delta' cal(T) = 0$. The limiting $D$ equation is
  $ \( - Delta + 2 sqrt(2) g \( s \) partial_s + 2 G \( s \) \) cal(D) = 2 \| cal(T) \( x' \) \|^2 . $
  Conjugation by $G$, using $G' \/ G = - sqrt(2) g$ and $G'' = \( 3 g^2 - 1 \) G$, gives (2.18). Finally (2.16), $G \( 0 \) = 1$, and $G' \( 0 \) = 0$ give (2.19). ◻
]

===== 2.2.5 Separating the even source from the normal derivative <separating-the-even-source-from-the-normal-derivative>

In the limit just obtained, the source $2 G \| cal(T) \|^2$ is even in the normal coordinate. We use that symmetry to remove its contribution to $F_s \( 0 \)$ without discarding its nonnegative mass. The next lemma treats the inhomogeneous source explicitly. No bound on its growth at infinity is assumed. The hypothesis that a nonnegative solution $F$ exists supplies the local bounds needed in the exhaustion.

#thm([Lemma 2.4.])[
  (Positive decomposition and normal derivative).  #emph[Let $F gt.eq 0$ be a smooth entire function on $bb(R)^(n - 1) times bb(R)$ and suppose $cal(L)_0 F = S$, where $S gt.eq 0$ is smooth and $S \( x' \, s \) = S \( x' \, - s \)$. There is a decomposition 
#[#set math.equation(numbering: n => "(2.20)")
 $ F = E + h \, #h(2em) E gt.eq 0 \, quad h gt.eq 0 \, quad cal(L)_0 E = S \, quad cal(L)_0 h = 0 \, quad E \( x' \, s \) = E \( x' \, - s \) . $ <eq:diffuse-Riesz>]

 In particular $E_s \( x' \, 0 \) = 0$ and $nabla' E_s \( x' \, 0 \) = 0$. With integrals permitted to have value $+ oo$, 
#[#set math.equation(numbering: n => "(2.21)")
 $ frac(\| F_s \( 0 \) \|, 2) lt.eq frac(1, 2 sqrt(2)) thin 1 / sigma integral_(bb(R)) G \( s \)^2 F \( 0 \, s \) thin thin upright(d) s . $ <eq:diffuse-sharp-positive>]

 For every $c > 1 \/ \( 2 sqrt(2) \)$ there exists $P = P \( c \) < oo$ such that 
#[#set math.equation(numbering: n => "(2.22)")
 $ frac(\| F_s \( 0 \) \|, 2) lt.eq c / sigma integral_(- P)^P G \( s \)^2 F \( 0 \, s \) thin thin upright(d) s $ <eq:diffuse-positive-window>]

 for all such $F$. The choice of $P$ is independent of the source and of $F$.]
  #emph[More precisely, every extreme point of 
$ cal(K) = { h gt.eq 0 : cal(L)_0 h = 0 upright(" on ") bb(R)^n \, med h \( 0 \) = 1 } $

 has the form $e^(b dot.op x') f \( s \/ sqrt(2) \)$, where $a = sqrt(4 - 2 \| b \|^2) in \[ 1 \, 2 \]$. If $a > 1$, $f$ is one of 
#[#set math.equation(numbering: n => "(2.23)")
 $ 1 / a e^(a y) \( a - tanh y \) \, #h(2em) 1 / a e^(- a y) \( a + tanh y \) \; $ <eq:diffuse-extremals>]

 if $a = 1$, $f \( y \) = "sech" y$.]
] <lem:diffuse-positive>

#proof[
  There are four steps. We remove the source by monotone exhaustion, classify the extreme positive homogeneous solutions, compute their normal derivative-to-mass ratios, and then pass to all solutions on a single finite interval.
  #emph[The even inhomogeneous part.] For each integer $R$ solve $cal(L)_0 E_R = S$ on $B_R \( 0 \)$ with zero Dirichlet data. The potential $2 - G$ lies in $\[ 1 \, 2 \]$, so comparison gives $0 lt.eq E_R lt.eq F$. Reflection in $s$ preserves the operator, domain and source, hence $E_R$ is even in $s$. Comparison on nested balls gives $E_R lt.eq E_(R + 1)$ on $B_R$. Interior estimates and the upper bound by $F$ show that their increasing limit $E$ is smooth locally and solves the stated equation. This proves (2.20). This construction does not interchange an uncontrolled source integral with a limit.
  #emph[The homogeneous extreme points.] It remains to control $h$ in (2.20): $E$ contributes no normal derivative at zero and only increases the weighted mass. The set $cal(K)$ is convex and compact in the topology of smooth convergence on compact sets: Harnack and interior estimates bound every derivative on each ball, and the normalization is preserved in a limit. Every nonzero nonnegative homogeneous solution is strictly positive. For a horizontal translation $t in bb(R)^(n - 1)$, uniform Harnack chains give
  $ h \( x' + t \, s \) lt.eq C_t h \( x' \, s \) quad upright("for all ") \( x' \, s \) \, $
  with $C_t$ independent of the base point. The operator is invariant under these translations. If $h$ is extreme in $cal(K)$, choose $C > C_t$; both $C^(- 1) h \( x' + t \, s \)$ and $h \( x' \, s \) - C^(- 1) h \( x' + t \, s \)$ are nonnegative homogeneous solutions. Normalizing these two summands at the origin writes $h$ as a convex combination in $cal(K)$. Extremality therefore makes the translate proportional to $h$. The positive proportionality factors form a continuous multiplicative character of $bb(R)^(n - 1)$, so they equal $e^(b dot.op t)$ for some real $b$. Consequently $h \( x' \, s \) = e^(b dot.op x') f \( s \/ sqrt(2) \)$ and
  #[#set math.equation(numbering: n => "(2.24)")
   $ - f'' - 2 "sech"^2 y thin f = - \( 4 - 2 \| b \|^2 \) f . $ <eq:diffuse-extremal-ode>]
  A positive solution $f$ gives the ground-state identity
  $ integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] \| zeta' \|^2 - 2 "sech"^2 y thin zeta^2 + \( 4 - 2 \| b \|^2 \) zeta^2 #scale(x: 120%, y: 120%)[\)] thin thin upright(d) y = integral_(bb(R)) f^2 lr(|(zeta / f)'|)^2 thin thin upright(d) y gt.eq 0 quad \( zeta in C_c^1 \( bb(R) \) \) . $
  Use compactly supported approximations to $"sech" y$, for which $\( - partial_y^2 - 2 "sech"^2 y \) "sech" y = - "sech" y$. It follows that $4 - 2 \| b \|^2 gt.eq 1$; its upper bound $4$ is immediate. For $a = sqrt(4 - 2 \| b \|^2) > 1$, two linearly independent solutions of (2.24) are $f_a^plus.minus \( y \) = e^(plus.minus a y) \( a minus.plus tanh y \)$. They are positive. The coefficient of $f_a^(+)$ in any positive solution is nonnegative by its asymptotic behavior at $+ oo$, and the coefficient of $f_a^(-)$ is nonnegative by the behavior at $- oo$. Extremality excludes a combination with both coefficients positive. At $a = 1$, reduction of order gives the basis
  $ "sech" y \, #h(2em) "sech" y integral_0^y cosh^2 t thin thin upright(d) t . $
  The second member dominates with opposite signs at the two ends, so a positive solution is a multiple of $"sech" y$. This proves the stated necessary classification of extreme points.
  #emph[The sharp full-line coefficient.] We compute the derivative-to-mass ratio for the unnormalized $f_a^(+)$; reflection gives the other sign. Define
  $ M \( a \) = 3 / 4 integral_(bb(R)) e^(a y) "sech"^4 y thin thin upright(d) y \, #h(2em) 1 lt.eq a lt.eq 2 . $
  Integration by parts, with boundary term zero because $a < 4$, gives
  $ 1 / sigma integral_(bb(R)) G \( s \)^2 f_a^(+) \( s \/ sqrt(2) \) thin thin upright(d) s = frac(3 a, 4) M \( a \) \, #h(2em) lr(|frac(thin upright(d), thin upright(d) s) f_a^(+) \( s \/ sqrt(2) \) \|_(s = 0)|) = frac(a^2 - 1, sqrt(2)) . $
  Thus the ratio of half the derivative to this mass is
  #[#set math.equation(numbering: n => "(2.25)")
   $ sqrt(2) / 3 frac(a - 1 \/ a, M \( a \)) . $ <eq:diffuse-ratio>]
  The function $M$ is convex. Its value and derivative at $2$ can be computed without special-function formulas: with $t = \( 1 + tanh y \) \/ 2$,
  $ M \( 2 \) = 6 integral_0^1 t^2 thin thin upright(d) t = 2 \, #h(2em) M' \( 2 \) = 3 integral_0^1 t^2 log frac(t, 1 - t) thin thin upright(d) t = 3 / 2 . $
  For the last equality the two logarithmic integrals are $- 1 \/ 9$ and $- 11 \/ 18$, respectively. The tangent-line inequality for convex $M$ therefore yields
  #[#set math.equation(numbering: n => "(2.26)")
   $ M \( a \) gt.eq 3 / 2 a - 1 gt.eq 4 / 3 \( a - 1 \/ a \) \, #h(2em) 1 lt.eq a lt.eq 2 \, $ <eq:diffuse-M-bound>]
  because the difference in the second inequality is $\( a - 2 \) \( a - 4 \) \/ \( 6 a \) gt.eq 0$. The ratio in (2.25) is at most $1 \/ \( 2 sqrt(2) \)$.
  #emph[One finite interval for the entire cone of positive solutions.] The full-line mass need not be continuous in the local smooth topology. We therefore pass to a finite interval before applying convex compactness. The normalized functions $f_a^plus.minus \/ a$, including $a = 1$, form a compact family, and
  $ "sech"^4 y thin frac(f_a^plus.minus \( y \), a) lt.eq C e^(- 2 \| y \|) quad \( 1 lt.eq a lt.eq 2 \) . $
  Their full weighted masses have a strictly positive uniform lower bound. Consequently, for every $c > 1 \/ \( 2 sqrt(2) \)$, a single sufficiently large $P$ makes the two linear inequalities
  $ plus.minus 1 / 2 h_s \( 0 \) lt.eq c / sigma integral_(- P)^P G \( s \)^2 h \( 0 \, s \) thin thin upright(d) s $
  true for every extreme point of $cal(K)$. Both sides are continuous linear functionals in the local smooth topology. The Krein–Milman theorem extends these inequalities from the extreme points to their closed convex hull, which is $cal(K)$. Scaling also covers every nonnegative homogeneous solution, including zero. Since $E_s \( 0 \) = 0$ and $E gt.eq 0$, the same inequality holds for $F = E + h$. This proves (2.22). It implies (2.21) by bounding the truncated mass by the full mass and sending $c arrow.b 1 \/ \( 2 sqrt(2) \)$. ◻
]

#prodef([Remark 2.5.])[
  The strict relaxation in the finite-window statement is necessary. For $a = 2$ and $b = 0$ the full-line ratio equals $1 \/ \( 2 sqrt(2) \)$, and any finite truncation strictly decreases its positive denominator. In particular a finite-window proof cannot retain the exact endpoint constant merely by invoking local convergence.
] <rem:diffuse-truncation>

===== 2.2.6 Returning to a finite normal segment <returning-to-a-finite-normal-segment>

The limit inequality now gives a uniform estimate for the original solution. For a regular zero $z$ and a finite $P > 0$, write

#[#set math.equation(numbering: n => "(2.27)")
 $ I_P \( z \) = 1 / sigma integral_(- P)^P q \( z + t nu \( z \) \)^3 D \( z + t nu \( z \) \) thin thin upright(d) t . $ <eq:diffuse-normal-average>]

This is a normal average, not the pointwise defect. Its normalization is chosen so that the limiting mass is $sigma^(- 1) integral G^2 F$. The next lemma proves $\| H \| lt.eq c I_P$ by first fixing the interval and only then choosing the defect threshold.

#thm([Lemma 2.6.])[
  (Mean curvature controlled by normal defect mass).  #emph[For every $c > 1 \/ \( 2 sqrt(2) \)$ there exist $P = P \( c \) < oo$ and $delta = delta \( n \, c \) in \( 0 \, 1 \/ 2 \]$ such that every entire solution and every zero $z$ with $0 < D \( z \) < delta$ satisfy 
#[#set math.equation(numbering: n => "(2.28)")
 $ \| H \( z \) \| lt.eq c / sigma integral_(- P)^P q \( z + s nu \( z \) \)^3 D \( z + s nu \( z \) \) thin thin upright(d) s . $ <eq:diffuse-mean-window>]

 The point is regular and the normal is oriented by $p$. The inequality also holds with any larger normal interval. In particular one can fix 
#[#set math.equation(numbering: n => "(2.29)")
 $ frac(1, 2 sqrt(2)) < c_(*) < sqrt(2) / 3 $ <eq:diffuse-strict-mean>]

 and obtain constants $P_(*) \, delta_(*) > 0$ used in the finite-density argument.]
] <lem:diffuse-mean>

#proof[
  Choose $c_1$ strictly between $1 \/ \( 2 sqrt(2) \)$ and $c$, and fix a finite $P gt.eq 1$ supplied by Lemma 11 for $c_1$. If no uniform $delta$ existed for this $P$, there would be solutions and zeros with $0 < epsilon.alt_j = D_j \( z_j \) arrow.r 0$ violating (2.28). Apply Lemma 10 to translate and rotate them. On the fixed interval $\[ - P \, P \]$, smooth convergence gives
  $ 1 / epsilon.alt_j integral_(- P)^P q_j \( s e_n \)^3 D_j \( s e_n \) thin thin upright(d) s arrow.r integral_(- P)^P G \( s \)^3 cal(D) \( 0 \, s \) thin thin upright(d) s = integral_(- P)^P G \( s \)^2 F \( 0 \, s \) thin thin upright(d) s > 0 . $
  The source in (2.18) is nonnegative and even in $s$, so the limiting mean satisfies the same bound with coefficient $c_1$. The violated inequalities and (2.19) instead give the reverse weak inequality with coefficient $c$. The displayed strictly positive mass and $c_1 < c$ contradict each other. All compactness constants depend only on $n$ and the chosen finite interval, so the resulting threshold is uniform over the entire class of solutions. Finally the integrand is nonnegative, which proves the assertion about larger intervals. ◻
]

==== 2.3 Rigidity under a finite density bound <sec:finite>

We now prove Theorem 3, in its full range $4 lt.eq n lt.eq 7$. This will also make a density bound on one sufficiently large ball a regularity criterion; that local consequence is the input for the later analysis without a global density bound. Write $n = m + 1$, let $omega_m$ be the volume of the unit ball in $bb(R)^m$, and keep $s_0 = sigma \/ 2 = 2 sqrt(2) \/ 3$. Recall the normalized energy

$ M_r \( y \) = frac(1, s_0 omega_m r^m) integral_(B_r \( y \)) e \( v \) \, #h(2em) e \( v \) = 1 / 2 \| nabla v \|^2 + W \( v \) \, #h(2em) M_oo = sup_(r > 0) M_r \( 0 \) \, $

as defined in (5).

The statements from the literature used below are preliminary results of Florit-Simon–Serra, with their numbering fixed to #cite(label("FSS2025")), version 1. Their final classification theorem concerns $n = 4$; the extension to $n = 5 \, 6 \, 7$ here is the gap argument following Lemma 14.

Suppose the theorem fails. The literature reduction produces a critical solution with an integer number $K gt.eq 2$ of zero layers outside a sparse set. We will compare two estimates for the nearest gap between those layers. A Green test bounds its average in terms of mean curvature; Lemma 13 and a Hardy test bound that curvature cost. The opposite orientations of adjacent transitions force almost all gaps to be logarithmically large. A preliminary square-root gap test is needed before the sharper, nearly linear test: it makes the gradient error in the gap Laplacian absorbable without losing the final coefficient.

===== 2.3.1 Reduction to a critical integer-density solution <reduction-to-a-critical-integer-density-solution>

By (6), $M_r \( y \)$ is nondecreasing and its limit at infinity is independent of $y$. In the diffuse variables, the discrepancy in that formula is $q^2 D \/ 4$ by (2.8); thus

$ M'_r \( y \) = frac(1, s_0 omega_m) {r^(- m - 1) integral_(B_r \( y \)) frac(q^2 D, 4) + r^(- m) integral_(partial B_r \( y \)) \| partial_r v \|^2} . $

We will use its two nonnegative terms separately. The derivation in Section 2 uses neither stability nor finite density; finite density now enters through the following reduction.

A number $K_f > 0$ is called #emph[subcritical] in dimension $n$ if the conclusion of Theorem 3 holds for every bounded entire stable solution with $M_oo lt.eq K_f$. The range of a bounded entire solution is automatically contained in $\[ - 1 \, 1 \]$, by applying the equation to translated limits at its supremum and infimum. The constants $plus.minus 1$ are included in this definition.

======= 2.3.1.1 The two regularity inputs. <the-two-regularity-inputs.>

There are two different ways to obtain a graphical region: subcritical energy density, or small local generalized-curvature mass. We state both hypotheses because the critical solution uses the second before the theorem makes the first available at every finite threshold. For a regular point put $cal(A)_v = \| nabla \( nabla v \/ \| nabla v \| \) \|$, where the derivative is the full ambient derivative. The #emph[sheeting assumptions] on $B_r$ are

$ \| nabla v \| gt.eq C^(- 1) \, #h(2em) cal(A)_v lt.eq C \/ r quad upright("on ") B_r ∩ { \| v \| lt.eq 0.9 } . $

Thus a tangential curvature bound alone would not be this hypothesis. For entire stable parameter-one solutions in $n lt.eq 7$, #cite(label("FSS2025")) Theorem 3.2 gives these assumptions on $B_(delta r)$ when $K_f$ is subcritical, $M_r lt.eq K_f + delta$, and $r^(- 1) lt.eq delta$; $delta > 0 \, C < oo$ depend on $K_f \, n$. The separate good-ball result #cite(label("FSS2025")) Theorem 3.4 assumes $M_r lt.eq C_0$, $r gt.eq r_0 \( C_0 \, n \)$, and

$ integral_(B_1 \( x \)) cal(A)_v^2 \| nabla v \|^2 < delta_(upright("bad")) quad upright("for every ") x in B_r ∩ { \| v \| lt.eq 0.9 } . $

It gives the sheeting assumptions on $B_(r \/ 2)$, with constants depending on $C_0 \, n$. In this integral the curvature density is defined almost everywhere as $cal(A)_v^2 \| nabla v \|^2 = \| nabla^2 v \|^2 - \| nabla \| nabla v \| \|^2 .$

======= 2.3.1.2 What sheeting supplies. <what-sheeting-supplies.>

Under the sheeting assumptions, #cite(label("FSS2025")) Lemma 2.13 and Theorem 2.14 give graphical decomposition and the Wang–Wei estimates #cite(label("WangWei2019")); the latter permit $n lt.eq 10$. Theorem 1.1 of the final Wang–Wei author manuscript, dated 9 October 2019, uses a potential with second derivative one at the wells. Our normalization is transferred to theirs by

$ hat(W) = W \/ 2 \, #h(2em) hat(v) \( y \) = v \( y \/ sqrt(2) \) \, #h(2em) Delta_y hat(v) = hat(W)' \( hat(v) \) . $

Then $hat(W)'' \( plus.minus 1 \) = 1$, stability is preserved by change of variables, and lengths are multiplied by $sqrt(2)$. This fixed rescaling changes only the constants in the estimates below; the parameter-one formulation in #cite(label("FSS2025")) Theorem 2.14 already uses our quartic normalization. On smaller cylinders they give scaled $C^(2 \, theta)$ bounds, mean curvature $O \( r^(- 2) \)$, and separation tending to infinity as $r arrow.r oo$. We will only need the weaker $C_iota r^(- 2 + iota)$ mean-curvature bound for each fixed $iota > 0$. When all zeros in the original ball lie in a sufficiently thin slab, #cite(label("FSS2025")) Theorem 4.8 and Lemmas 4.9–4.10 give arbitrarily small slopes, comparison of density with the integer number of graphs, and local approximation by a planar heteroclinic on every fixed window. Interior elliptic estimates upgrade that approximation to smooth local convergence. The thickness threshold, the interior fractions, and the constants are uniform once the sheeting constants, dimension, and desired accuracy have been fixed.

#thm([Lemma 2.7.])[
  (Critical solution and its good regions).  #emph[If Theorem 3 fails in a fixed dimension $4 lt.eq n lt.eq 7$, there is a nonplanar entire stable solution with finite integer density $M_oo = K gt.eq 2$, and a nonempty closed set $Z$, with the following properties. Put $s \( x \) = "dist" \( x \, Z \)$ and $Sigma = { v = 0 }$.]
  + #emph[Uniformly for $y in Z$, 
$ M_r \( y \) arrow.r K \, #h(2em) r^(2 - m) \| B_1 \( Z \) ∩ B_r \( y \) \| arrow.r 0 quad \( r arrow.r oo \) . $

 The second conclusion holds with $B_h \( Z \)$ in place of $B_1 \( Z \)$ for each fixed $h < oo$.]
  + #emph[There are $c > 0 \, C < oo$ and uniform moduli tending to zero as $s arrow.r oo$ such that, about each $z in Sigma$ with $s \( z \)$ large, the zero set in an interior cylinder of radius $c s \( z \)$ consists of exactly $K$ ordered smooth graphs. They are defined on a disk of that radius over a hyperplane through $z$, their heights are $o \( s \( z \) \)$, their slopes are $o \( 1 \)$, and 
$ parallel nabla^2 f_i parallel_oo + s \( z \)^(1 \/ 2) \[ nabla^2 f_i \]_(C^(1 \/ 2)) lt.eq C \/ s \( z \) \, #h(2em) \| H_i \| lt.eq C_iota s \( z \)^(- 2 + iota) . $

 Their separations tend uniformly to infinity. At the inner zero points $D = o \( 1 \)$, and every fixed normal window converges smoothly to the oriented $g$-profile.]
  + #emph[Uniformly for $y in Z$, 
#[#set math.equation(numbering: n => "(2.30)")
 $ r^(- m) integral_(B_r \( y \)) q^2 D arrow.r 0 . $ <eq:finite-discrepancy>]

]
  #emph[Constants and moduli in this lemma may depend on the fixed critical solution and dimension.]
] <lem:finite-critical>

#proof[
  We first obtain the critical solution and uniform information at its bad centers. We then transfer that information to every distant good zero, where the later gap test will be applied.
  #emph[Attainment and the bad set.] Near-unit-density rigidity, stated in #cite(label("FSS2025")) Theorem 2.16 and originating in #cite(label("Wang2017")) Theorem 11.1, makes $1 + delta \( n \)$ subcritical. If some finite density is not subcritical, the finite critical density is attained by #cite(label("FSS2025")) Proposition 3.6. Take the bad set in its Definition 3.7: its centers satisfy $\| v \| lt.eq 0.9$ and the reverse nonstrict inequality in the good-ball curvature condition above. Lemma 3.8 there makes this set nonempty. It is harmless to take its closure; all estimates below pass to that closure by continuity and shifted-ball containment. Propositions 3.9–3.10 there give uniform large-scale planar confinement, uniform convergence of density at these centers, integrality of the critical density, and the no-gaps conclusion. Thus $K gt.eq 2$. Lemma 5.1 and Proposition 5.2 there give the asserted sparse bad-set estimate. These results explicitly assume $n lt.eq 7$, including Section 5 of that paper.
  For clarity, the enlargement from $1$ to a fixed $h$ costs only a constant depending on $h \, n$. Choose a maximal separated family of bad centers in $B_(r + h + 2) \( y \)$ with fixed small separation. Disjoint balls of a still smaller fixed radius about its centers lie in $B_1 \( Z \) ∩ B_(r + h + 3) \( y \)$. Balls of radius $h + 2$ about this family cover $B_h \( Z \) ∩ B_r \( y \)$. This proves the claim using the estimate at the slightly larger radius.
  #emph[Exactly $K$ sheets at every distant good zero.] We now prove (ii), with the same moduli at all good points. Choose a nearest $y in Z$ to $z$, with $s = \| z - y \|$. There are no bad centers in $B_(s \/ 2) \( z \)$, so the good-ball theorem gives the sheeting assumptions on $B_(s \/ 4) \( z \)$. The plane supplied by large-scale flatness at $y$, at radius $4 s$, passes within $o \( s \)$ of $z$, and the zero set in this ball is confined to an $o \( s \)$-slab about it. Translate the plane to pass through $z$.
  Here is the precise no-gaps transfer. Write $A_0 = 4 s$, let $P_(y \, A_0)$ be the plane through $y$ given by large-scale flatness, and let $a_0$ be the orthogonal projection of $z$ to that plane. There is one modulus $omega$, independent of the bad center $y$, such that
  $ \| z - a_0 \| lt.eq A_0 omega \( A_0^(- 1) \) \, #h(2em) M_(A_0 omega \( A_0^(- 1) \)) \( a_0 \) gt.eq K - omega \( A_0^(- 1) \) . $
  The second inequality is exactly the conclusion of #cite(label("FSS2025")) Proposition 3.10; it applies because $a_0 in P_(y \, A_0) ∩ B_(A_0) \( y \)$. For any fixed $theta > 0$, the number $b_s = theta s - \| z - a_0 \|$ exceeds $A_0 omega \( A_0^(- 1) \)$ for all sufficiently large $s$. Monotonicity at $a_0$ and $B_(b_s) \( a_0 \) subset B_(theta s) \( z \)$ then give
  $ K gt.eq M_(theta s) \( z \) gt.eq (frac(b_s, theta s))^m #scale(x: 120%, y: 120%)[\(] K - omega \( A_0^(- 1) \) #scale(x: 120%, y: 120%)[\)] = K - o \( 1 \) . $
  All thresholds and errors are uniform in $z \, y$; no diagonal selection of centers or radii is involved.
  Set $a = s \/ 4$, the radius of the ball where the sheeting assumptions hold. Translating $P_(y \, A_0)$ to pass through $z$ confines every zero in $B_a \( z \)$ to a slab of width at most $2 A_0 omega \( A_0^(- 1) \) = o \( a \)$. Apply #cite(label("FSS2025")) Theorem 4.8 on $B_a \( z \)$. It represents all zeros in the cylinder $B'_(3 a \/ 5) times \[ - 3 a \/ 5 \, 3 a \/ 5 \]$, in the resulting coordinates, by $N$ ordered graphs defined over $B'_(3 a \/ 5)$, each with height in $\[ - a \/ 8 \, a \/ 8 \]$. Thus every listed graph meets $B_(a \/ 2) \( z \)$, and no zero in that ball is omitted. Its Lemma 4.9 gives, for any prescribed sufficiently small $delta_1 > 0$ and all sufficiently large $s$,
  $ \| M_(a \/ 2) \( z \) - N \| lt.eq delta_1 N . $
  The preceding density transfer with $theta = 1 \/ 8$ gives $M_(a \/ 2) \( z \) arrow.r K$. First $delta_1 lt.eq 1 \/ 2$ gives $N lt.eq 2 K$; then choose $delta_1 < 1 \/ \( 8 K \)$ and a density deficit smaller than $1 \/ 4$. It follows that $\| N - K \| < 1 \/ 2$, and hence $N = K$. The curvature, separation and profile conclusions are those of the same results. All applications use fixed interior fractions and uniform moduli.
  #emph[Uniform disappearance of discrepancy.] Integrate the first term of (6) between $r$ and $2 r$. Its nonnegativity gives
  $ r^(- m) integral_(B_r \( y \)) q^2 D lt.eq C #scale(x: 120%, y: 120%)[\(] M_(2 r) \( y \) - M_r \( y \) #scale(x: 120%, y: 120%)[\)] . $
  Uniform convergence at bad centers proves (iii). ◻
]

For the rest of the proof fix such a critical solution. The preliminary rigidity case $D = 0$ is excluded, so $D > 0$. For a sufficiently large fixed $S$, write $Sigma_S = Sigma ∩ { s > S }$. This is a smooth open surface. Every small quantity denoted below by $epsilon_S$ is uniform and tends to zero as $S arrow.r oo$. No constant depending on a radial exhaustion scale or a cap will be hidden in this notation.

===== 2.3.2 Surface measures and radial estimates <surface-measures-and-radial-estimates>

We first transfer the ambient energy and stability bounds to the regular zero surface. Four estimates will be used: defect mass grows at most like $r^(m - 2)$, radial geometric errors have a vanishing tail, surface mass retains the coefficient $K$, and a Hardy test fixes the sharp coefficient of the logarithmic defect integral. All radial tests are centered at arbitrary points of $Z$.

#thm([Lemma 2.8.])[
  (Tube, mass and Hardy estimates).  #emph[For any prescribed finite $P$, increasing $S$ makes 
$ Phi \( z \, t \) = z + t nu \( z \) \, #h(2em) z in Sigma_(S \/ 2) \, quad \| t \| lt.eq P \, $

 injective, with Jacobian $1 + epsilon_S$ and $q \( Phi \( z \, t \) \) = G \( t \) + o_S \( 1 \)$, uniformly. Good-surface area in every ball of radius $r gt.eq 1$ is at most $C r^m$, and 
#[#set math.equation(numbering: n => "(2.31)")
 $ integral_(Sigma_(S \/ 2) ∩ B_r \( x \)) D thin thin upright(d) S lt.eq C integral_(B_(r + 1) \( x \)) q^3 D thin thin upright(d) x lt.eq C r^(m - 2) #h(2em) \( x in bb(R)^n \, med r gt.eq 1 \) . $ <eq:B1>]

 For $y in Z$, put $r = \| z - y \|$ on the surface and $e_r = \( z - y \) \/ r$. Uniformly in $y$, 
#[#set math.equation(numbering: n => "(2.32)")
 $ integral_(Sigma_S ∩ { r > R_0 }) (\( e_r dot.op nu \)^2 r^(- m) + \| H \| r^(1 - m)) thin upright(d) S lt.eq eta \( R_0 \) \, #h(2em) eta \( R_0 \) arrow.r 0 . $ <eq:B2>]

 The same function $eta$ may be used for every $S$ above one fixed unit-tube threshold $S_(*)$. Choose a smooth ambient $0 lt.eq chi lt.eq 1$, supported in ${ s > S }$ and equal to one on ${ s gt.eq 2 S }$, with bounded first two derivatives. For fixed nonnegative Lipschitz $F$, supported in $\[ 1 \/ 2 \, 2 \]$, and every $delta > 0$, $S$ can be chosen so that 
#[#set math.equation(numbering: n => "(2.33)")
 $ liminf_(R arrow.r oo) R^(- m) integral_Sigma chi F \( r \/ R \) thin thin upright(d) S gt.eq K m omega_m integral_0^oo t^(m - 1) F \( t \) thin thin upright(d) t - delta . $ <eq:B3>]

 Finally, for each fixed $R_0 gt.eq 10$, 
#[#set math.equation(numbering: n => "(2.34)")
 $ limsup_(R arrow.r oo) frac(1, sigma log R) integral_({ R_0 \/ 2 < \| x - y \| < 4 R }) q^3 D thin \| x - y \|^(2 - m) thin thin upright(d) x lt.eq K m omega_m frac(\( m - 2 \)^2, 4) . $ <eq:B4>]

 The limiting estimates are uniform for $y in Z$.]
] <lem:finite-measures>

#proof[
  We prove the assertions in their order: first tube injectivity and defect mass, then the radial tail, then the surface mass retained outside the bad set, and finally the Hardy coefficient.
  #emph[Tube injectivity and defect mass.] Curvature $O \( 1 \/ s \)$ and profile convergence give the local tube description. To verify injectivity, a collision would have base points within distance $2 P$, hence in a common good chart when $S$ is large. Different sheets cannot collide because their separation tends to infinity; on a single sheet the small slope and curvature give uniqueness of the normal projection on this fixed-width tube. The volume Jacobian is $det \( upright("Id") + t A \) = 1 + o_S \( 1 \)$. A unit tube, on which $q$ is bounded below, controls surface area by energy. Bounded density therefore gives the area bound for arbitrary centers. Local Harnack comparison in (2.10) also gives the first inequality of (2.31). To obtain its second inequality, apply (2.9) with a cutoff equal to one on $B_(r + 1) \( x \)$, supported in $B_(2 r + 2) \( x \)$, and with gradient bounded by $C \/ r$; use $q^2 lt.eq 4 e \( v \)$. On good zeros the identity $H = partial_nu D \/ \( 2 \| p \|^2 \)$ gives $\| H \| lt.eq C D$.
  #emph[The radial error has a vanishing tail.] Integrating the second term in (6) gives
  $ integral_({ \| x - y \| > R_0 }) \| partial_r v \|^2 \| x - y \|^(- m) thin thin upright(d) x lt.eq s_0 omega_m #scale(x: 120%, y: 120%)[\(] K - M_(R_0) \( y \) #scale(x: 120%, y: 120%)[\)] . $
  In a unit tube, $\| p \( Phi \( z \, t \) \) - nu \( z \) \| lt.eq C sqrt(D \( z \))$, by (2.10); changing radial directions costs $C \/ r$. After squaring, integrating in $t$, and using the unit tube’s positive lower profile bound, the surface radial-normal integral is bounded by this ambient flux tail, plus
  $ C integral_(Sigma_S ∩ { r > R_0 }) #scale(x: 120%, y: 120%)[\(] D r^(- m) + r^(- m - 2) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) S . $
  On a dyadic shell of radius $a$, (2.31) bounds the first error by $C a^(- 2)$, and the area bound does the same for the second. The mean-curvature term in (2.32) is at most $C a^(- 1)$ on that shell. Summing proves the explicit uniform bound
  $ eta \( R_0 \) lt.eq C (sup_(y in Z) #scale(x: 120%, y: 120%)[\(] K - M_(R_0 - 2) \( y \) #scale(x: 120%, y: 120%)[\)] + R_0^(- 1)) \, $
  which tends to zero by uniform density convergence at $Z$. The constants can be fixed when the unit tube and (2.31) are first valid, at $S = S_(*)$. Increasing $S$ merely restricts the nonnegative integrals to smaller subsets, so it does not worsen this bound.
  #emph[Removing the bad set while retaining the coefficient $K$.] We first construct the stated smooth cutoff without differentiating the nonsmooth distance $s$. Mollify $s$ at radius $S \/ 8$, writing $tilde(s) = rho_(S \/ 8) * s$, and choose a smooth nondecreasing $theta : bb(R) arrow.r \[ 0 \, 1 \]$ equal to zero on $\( - oo \, 5 \/ 4 \]$ and to one on $\[ 7 \/ 4 \, oo \)$. Then $chi = theta \( tilde(s) \/ S \)$ has the required properties: $\| tilde(s) - s \| lt.eq S \/ 8$, so its derivatives are supported in $9 S \/ 8 lt.eq s lt.eq 15 S \/ 8$, strictly inside the regular region $s > S$. Moreover $\| nabla chi \| lt.eq C \/ S$ and $\| nabla^2 chi \| lt.eq C \/ S^2$.
  The same tube and the fixed-thickness bad-set estimate imply
  #[#set math.equation(numbering: n => "(2.35)")
   $ sup_(y in Z) cal(H)^m #scale(x: 120%, y: 120%)[\(] Sigma ∩ { S < s < 2 S } ∩ B_r \( y \) #scale(x: 120%, y: 120%)[\)] = o \( r^(m - 2) \) quad \( r arrow.r oo \) $ <eq:finite-collar-area>]
  for each fixed sufficiently large $S$. Indeed the unit tube over this set lies in $B_(2 S + 1) \( Z \) ∩ B_(r + 1) \( y \)$.
  To prove (2.33), first observe the exact identity
  $ e \( v \) = q^2 / 2 - frac(q^2 D, 4) . $
  Together with Lemma 14 this gives, uniformly at bad centers,
  #[#set math.equation(numbering: n => "(2.36)")
   $ R^(- m) integral_(B_R \( y \)) q^2 arrow.r sigma K omega_m . $ <eq:finite-qmass>]
  Its radial distributional consequence is
  $ R^(- m) integral q^2 F \( \| x - y \| \/ R \) thin thin upright(d) x arrow.r sigma K m omega_m integral t^(m - 1) F \( t \) thin thin upright(d) t . $
  For completeness, the part of this integral at distance greater than $P$ from the zero set is $o_P \( 1 \) R^m$, uniformly for $R gt.eq 1$. Take a maximal unit-separated net on $Sigma$. A fixed small ball about any zero has energy bounded below: the uniform gradient bound keeps $\| v \| lt.eq 1 \/ 2$ in a uniform neighborhood of that zero. Disjoint such balls and the density bound give at most $C \( a + 1 \)^m$ net points in any ball of radius $a$. The portion with zero-set distance in $\[ j \, j + 1 \]$, inside $B_(2 R) \( y \)$, is therefore covered with volume at most
  $ C \( R + j + 2 \)^m \( j + 2 \)^n . $
  Exponential decay (2.15), summed over $j gt.eq P - 1$, proves the assertion.
  For fixed $P$, points within $P$ of a zero with $s lt.eq 2 S$ have volume $o \( R^(m - 2) \)$ in $B_(2 R) \( y \)$, by the fixed enlargement of the bad set. Every remaining point within $P$ of $Sigma$ has a nearest zero in ${ chi = 1 }$, and belongs to the injective good tube. Replacing $F \( \| Phi \( z \, t \) - y \| \/ R \)$ by $F \( \| z - y \| \/ R \)$ costs $O \( P \/ R \)$ in normalized mass. The normal profile integral is at most $sigma + o_S \( 1 \)$. First choose $P$ to make the discarded tail small, then $S$ to make this profile and Jacobian error small. To make the direction of this transfer explicit, the preceding estimates give
  $ R^(- m) integral q^2 F \( \| x - y \| \/ R \) thin thin upright(d) x lt.eq \( sigma + o_S \( 1 \) \) R^(- m) integral_Sigma chi F \( r \/ R \) thin thin upright(d) S + o_P \( 1 \) + o_(R arrow.r oo \; P \, S) \( 1 \) . $
  The error $o_P \( 1 \)$ tends to zero as $P arrow.r oo$; with $P$ fixed, $o_S \( 1 \)$ tends to zero as $S arrow.r oo$. The radial mass limit therefore gives (2.33) in precisely the stated order of choices.
  #emph[The Hardy coefficient.] The radial $q^2$ mass has now been identified, including its coefficient. Put $a = \( m - 2 \) \/ 2$. In (2.9) use $eta \( x \) = \| x - y \|^(- a)$ on $R_0 \/ 2 < \| x - y \| < 4 R$, extended with smooth cutoffs on the adjacent inner and outer dyadic shells. The cutoff-shell costs are $O \( 1 \)$, uniformly in $y$ and $R$; this follows from $integral_(B_t \( y \)) q^2 lt.eq C t^m$. The remaining right-hand integral is
  $ a^2 integral_({ R_0 \/ 2 < \| x - y \| < 4 R }) q^2 \| x - y \|^(- m) thin thin upright(d) x . $
  Stieltjes integration by parts in (2.36) gives
  $ integral_({ b < \| x - y \| < c R }) q^2 \| x - y \|^(- m) thin thin upright(d) x = sigma K m omega_m log R + o \( log R \) $
  for fixed $b \, c > 0$. The same leading term holds after including the cutoff shells. Division by $sigma log R$ proves (2.34). ◻
]

===== 2.3.3 Nearest-sheet distance and its weak Laplacian <nearest-sheet-distance-and-its-weak-laplacian>

The mass estimates are now available. To use them in a Green test, we need an upper Laplacian bound for the distance to a neighboring sheet and an exact count of how often a target point can receive a curvature term. The following argument works with local adjacent sheets and does not require a global labeling of the zero set.

#thm([Lemma 2.9.])[
  (Nearest feet and multiplicity).  #emph[On $Sigma_S$, for $S$ sufficiently large, let $l \( z \)$ be the shortest Euclidean distance to a distinct sheet in the local good chart. This definition is independent of the chart. Uniformly as $s \( z \) arrow.r oo$, 
$ l \( z \) arrow.r oo \, #h(2em) l \( z \) = o \( s \( z \) \) . $

 Locally $l$ is the minimum of the smooth distance functions to the one or two adjacent sheets. On an active branch $l_b$, with nearest foot $z' = pi_b \( z \)$, one has 
#[#set math.equation(numbering: n => "(2.37)")
 $ Delta_Sigma l_b lt.eq \| H \( z \) \| + \| H \( z' \) \| + frac(C, s \( z \)) \| nabla_Sigma l_b \|^2 . $ <eq:B5>]

 Every measurable choice of an active foot has inverse multiplicity at most two. The branch area Jacobian is $1 + o_S \( 1 \)$, and 
$ s \( z' \) \/ s \( z \) = 1 + o_S \( 1 \) \, #h(2em) \| z' - y \| \/ \| z - y \| = 1 + o_S \( 1 \) quad \( y in Z \) . $

]
] <lem:finite-gap>

#proof[
  #emph[Defining the adjacent foot.] All $K gt.eq 2$ graphs have height $o \( s \)$; their separation diverges, so the nearest distinct-sheet distance has the claimed size. Orientations alternate because the solution changes sign on crossing each regular zero graph. Equivalently, $l$ is the nearest distance to a zero whose oriented normal has scalar product less than $- 1 \/ 2$ with $nu \( z \)$. The minimum is attained within $o \( s \)$, and every competitor that could improve it lies in the same buffered chart. A nonadjacent sheet cannot minimize: the chord to it crosses an intervening zero sheet at a strictly smaller distance. This also proves that the definition agrees on overlapping charts.
  Projection to an adjacent sheet is smooth at these distances. Indeed its curvature is $O \( s^(- 1) \)$, the distance is $o \( s \)$, and the slopes are small. In graph coordinates the squared-distance function has positive definite Hessian near its minimizing foot; all possible minimizers lie in this region, since their horizontal displacements are at most $l = o \( s \)$. It thus has a unique foot.
  #emph[The branch Laplacian.] Choose on the target graph the unit normal $N$ pointing toward the source. Then $z = z' + l_b N \( z' \)$, and the distance Hessian at $z$ has eigenvalues
  $ frac(kappa_i, 1 + l_b kappa_i) lt.eq kappa_i $
  in the transported target tangent directions, and zero in the normal direction. Here $1 + l_b kappa_i > 0$; its operator norm is $O \( s^(- 1) \)$. The inequality follows exactly by subtracting $l_b kappa_i^2 \/ \( 1 + l_b kappa_i \)$. Restricting to the source surface removes its normal-normal Hessian component. Its absolute value is bounded by
  $ C / s #scale(x: 120%, y: 120%)[\(] 1 - \( nu \( z \) dot.op N \)^2 #scale(x: 120%, y: 120%)[\)] = C / s \| nabla_Sigma l_b \|^2 . $
  The restriction formula for the Laplacian adds $- H \( z \) nu \( z \) dot.op N$, of size at most $\| H \( z \) \|$. Taking the ambient trace and bounding the target trace by $\| H \( z' \) \|$ proves (2.37).
  #emph[The Jacobian and the count of two.] The exact projection area Jacobian is
  #[#set math.equation(numbering: n => "(2.38)")
   $ J_(pi_b) \( z \) = frac(\| nu \( z \) dot.op N \( z' \) \|, \| det \( upright("Id") + l_b A_N \( z' \) \) \|) = 1 + o_S \( 1 \) . $ <eq:finite-foot-jacobian>]
  To check multiplicity globally, fix a target point $z'$. Write $l \( z \) lt.eq epsilon_S s \( z \)$ on $Sigma_S$, where $epsilon_S arrow.r 0$. The Lipschitz property of $s$ gives
  $ \| z - z' \| lt.eq frac(epsilon_S, 1 - epsilon_S) s \( z' \) . $
  Choose $S$ so this fraction is smaller than the fixed inner radius of a good chart. Every active source projecting to $z'$ then lies in that single chart centered at $z'$. The fixed normal line through $z'$ meets each small-slope graph at most once. Any intervening sheet would meet the source-target segment and contradict minimality. Only the immediately adjacent sheet on either side can therefore supply a source, giving at most two preimages. This reasoning also covers ties between active branches. A countable atlas and a measurable selection among the finite local branches permit the area formula with this multiplicity. Finally $s$ and distance to a fixed $y in Z$ are 1-Lipschitz and $s \( z \) lt.eq \| z - y \|$; the two ratio estimates follow from $l = o \( s \)$. ◻
]

Let $psi$ be nonnegative, increasing and concave on the range of $l$, and set $w = min { T_0 \, psi \( l \) }$. If

$ - psi'' \( l \) \/ psi' \( l \) gt.eq C \/ s \, #h(2em) 0 lt.eq psi' \( l \) lt.eq L \, $

Lemma 16 gives

#[#set math.equation(numbering: n => "(2.39)")
 $ Delta_Sigma w lt.eq L #scale(x: 120%, y: 120%)[\(] \| H \( z \) \| + \| H \( pi \( z \) \) \| #scale(x: 120%, y: 120%)[\)] quad upright("on ") Sigma_S $ <eq:B6>]

in the sense of measures, where any measurable active foot may be chosen almost everywhere. To justify the weak statement, each local distance branch is smooth with locally bounded second derivatives. Their finite minimum, including the constant cap, is locally semiconcave. Its singular Hessian part is nonpositive, and its absolutely continuous Hessian agrees almost everywhere with that of an active branch. On the capped part the constant branch has zero Laplacian and the right-hand side is nonnegative. The chain rule therefore gives (2.39). In particular $psi \( l \) = sqrt(l)$ works with $L = 1$ for large $S$, since $l = o \( s \)$.

===== 2.3.4 A Green test and a first bound on the gap <a-green-test-and-a-first-bound-on-the-gap>

The concave transformation in (2.39) absorbs the gradient error in the distance Laplacian. The next test integrates this inequality against an inward Green kernel. Its cutoff errors must be independent of the cap $T_0$, except for a geometric tail whose coefficient can be made small before the outer radius is increased.

Fix henceforth $F in C_c^oo \( \( 1 \/ 2 \, 2 \) \)$, nonnegative and positive on a neighborhood of $1$, normalized by $integral t^(m - 1) F \( t \) thin thin upright(d) t = m - 2$. Define the radial function $phi.alt_R$, for $0 < r < 2 R$, by

$ phi.alt_R \( r \) = integral_r^(2 R) t^(1 - m) (R^(- m) integral_t^(2 R) u^(m - 1) F \( u \/ R \) thin thin upright(d) u) thin upright(d) t \, $

and set it to zero for $r gt.eq 2 R$. Direct differentiation gives

$ phi.alt''_R + frac(m - 1, r) phi.alt'_R = R^(- m) F \( r \/ R \) \, #h(2em) 0 lt.eq phi.alt_R lt.eq r^(2 - m) \, #h(2em) r \| phi.alt'_R \| + r^2 \| phi.alt''_R \| lt.eq C r^(2 - m) . $

#thm([Lemma 2.10.])[
  (Green inequality with cap-independent collar errors).  #emph[Suppose that (2.39) holds, with $L lt.eq 2$, and that $psi \( l \)$ is bounded uniformly on each fixed range $S < s < A$. For fixed sufficiently large $S$ and $R_0 gt.eq 10$, all caps $T_0 > 0$, all $y in Z$, and large $R$, one has 
#[#set math.equation(numbering: n => "(2.40)")
 $ R^(- m) integral_Sigma w chi F \( r \/ R \) thin thin upright(d) S & lt.eq L integral_(Sigma_S ∩ { R_0 < r < 2 R }) r^(2 - m) #scale(x: 120%, y: 120%)[\(] \| H \( z \) \| + \| H \( pi \( z \) \) \| #scale(x: 120%, y: 120%)[\)] thin thin upright(d) S\
 & quad + C_(R_0 \, S) + o_(R arrow.r oo \; R_0 \, S) \( log R \) + T_0 eta \( R_0 \) . $ <eq:B7>]

 Here $C_(R_0 \, S)$ is independent of $T_0 \, y \, R$. The $o \( log R \)$ remainder is independent of $T_0$ and uniform in $y$; $eta \( R_0 \) arrow.r 0$ is uniform in $y$. These constants may depend on the fixed function $psi$.]
] <lem:finite-green>

#proof[
  The cap can affect the radial geometric error, but it must not multiply the errors near the fixed inner boundary or the bad set. We keep those three terms separate. Choose a smooth radial $alpha$, zero on $r lt.eq R_0$, one on $r gt.eq 2 R_0$, with derivatives bounded by $C R_0^(- j)$. Test (2.39) against the nonnegative compactly supported $alpha chi phi.alt_R$. Its support lies in the regular open surface, so distributional integration by parts has no singular-set boundary. For a radial function $f$, the convention $H = "div"_Sigma nu$ gives
  $ Delta_Sigma f = f'' + \( m - 1 \) f' \/ r + \( f' \/ r - f'' \) \( e_r dot.op nu \)^2 - H f' \( e_r dot.op nu \) . $
  Thus the error between $Delta_Sigma phi.alt_R$ and its flat $m$-dimensional radial Laplacian is at most
  $ C #scale(x: 120%, y: 120%)[\(] \( e_r dot.op nu \)^2 r^(- m) + \| H \| r^(1 - m) #scale(x: 120%, y: 120%)[\)] . $
  It contributes at most $T_0 eta \( R_0 \)$, by (2.32).
  Terms differentiating $alpha$ are supported where $r lt.eq 2 R_0$, and there $s lt.eq r$. The uniform bound $l = o \( s \)$, after fixing its lower threshold $S$, implies $w lt.eq psi \( l \) lt.eq C_(R_0 \, S)$ on this set, independently of the cap. Area and derivative bounds there give a cap-independent constant error. Terms differentiating $chi$ are supported in $S < s < 2 S$, where again $w lt.eq C_S$, independently of the cap. The ambient derivative bounds for $chi$ and the bounded mean curvature imply that these terms are bounded in absolute value by
  $ C_S integral_(Sigma ∩ { S < s < 2 S \, med R_0 < r < 2 R }) r^(2 - m) thin thin upright(d) S . $
  On a dyadic shell of radius $a$, (2.35) bounds this by a quantity tending to zero as $a arrow.r oo$, uniformly in $y$. The sum of $O \( log R \)$ such quantities is $o \( log R \)$: split at any fixed large shell, then use the uniform small bound on all later shells. This is the required Cesaro estimate.
  On the support of $F \( r \/ R \)$, $alpha = 1$ for large $R$. The main term on the left is therefore exactly that in (2.40). Bound the nonnegative right-hand test by $r^(2 - m)$; all remaining terms have just been estimated. ◻
]

#thm([Lemma 2.11.])[
  (Rough gap bound).  #emph[There is $C < oo$ such that, at all sufficiently distant good zeros, 
#[#set math.equation(numbering: n => "(2.41)")
 $ l \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(] \( log s \( z \) \)^2 + s \( z \)^(1 \/ 10) #scale(x: 120%, y: 120%)[\)] . $ <eq:B8>]

]
] <lem:finite-rough>

#proof[
  Use $w = min { T_0 \, sqrt(l) }$. The Green inequality will bound its average by $O \( log R \)$. A Harnack estimate for adjacent height differences then turns this average bound into a bound at any chosen good zero.
  #emph[The average estimate.] The curvature integral in (2.40) is at most $C \( 1 + log R \)$. Indeed $\| H \| lt.eq C D$, and each dyadic shell contributes $O \( 1 \)$ by (2.31). For its foot term use (2.38), multiplicity two and the comparable radial weights; the image is contained in $Sigma_(S \/ 2) ∩ { R_0 \/ 2 < r < 4 R }$. The same shell estimate applies.
  #emph[From one gap to a patch of comparable gaps.] Given a good zero $z$, choose a nearest $y in Z$, and set $R = s \( z \) = \| z - y \|$, $T_0 = sqrt(l \( z \))$. We claim that either $l \( z \) lt.eq C' R^(1 \/ 10)$, or an area-$c R^m$ patch of the source sheet, within distance $c R$ of $z$, has $l gt.eq c l \( z \)$. In the chart of Lemma 14, an adjacent height difference $h = f_(i + 1) - f_i > 0$ satisfies
  $ "div" \( a \( x' \) nabla h \) = cal(M) \( f_(i + 1) \) - cal(M) \( f_i \) \, #h(2em) cal(M) \( f \) = "div" frac(nabla f, sqrt(1 + \| nabla f \|^2)) \, $
  where
  $ a \( x' \) = integral_0^1 D_xi #h(-0.16667em) (xi / sqrt(1 + \| xi \|^2)) #scale(x: 120%, y: 120%)[\(] nabla f_i + t \( nabla f_(i + 1) - nabla f_i \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) t . $
  The small slopes make this matrix uniformly elliptic. The right-hand side has absolute value at most $C R^(- 2 + 1 \/ 10)$. Interior Harnack for a positive solution with bounded forcing, after rescaling to a unit disk, therefore gives on a fixed smaller disk
  $ inf h gt.eq c h \( x'_z \) - C R^(1 \/ 10) . $
  Every adjacent vertical gap relevant to the source sheet is at least $l \( z \)$ at $x'_z$. If $C'$ is sufficiently large, the asserted lower bound follows for both adjacent gaps, or for the sole adjacent gap on an extreme sheet. Vertical gaps and nearest Euclidean distances are comparable uniformly by the small slope bound; potential closest points outside the buffered chart are at distance comparable to $R$, whereas $l = o \( R \)$. This proves the claim.
  Shrink the patch fraction so $F \( r \/ R \) gt.eq c > 0$ on it. On this patch $s gt.eq \( 1 - c \) R$, hence $chi = 1$ for large $R$, and $w gt.eq c T_0$. Thus the left side of (2.40) is at least $c' T_0$. Fix $R_0$ large enough that $eta \( R_0 \) < c' \/ 2$, independently of $z \, T_0 \, R$. Absorb its last term and obtain $T_0 lt.eq C \( 1 + log R \)$. Squaring proves (2.41) in the second case, and its first case already has the asserted bound. ◻
]

===== 2.3.5 Completion of the finite-density proof <completion-of-the-finite-density-proof>

The rough estimate has strengthened $l = o \( s \)$ to $l^2 = o \( s \)$. This permits a concave transformation whose derivative tends to one, so the coefficient of the mean-curvature term survives the Green test. We first obtain the upper logarithmic coefficient and then prove that almost all the surface mass attains the logarithmic cap.

#proof[
  #emph[Completion of the proof of Theorem 3.] #emph[The nearly linear gap test.] Fix a small tolerance $delta > 0$ and use
  $ psi \( l \) = l + log l \, #h(2em) w = min { T_0 \, psi \( l \) } . $
  Because $l arrow.r oo$, $psi' lt.eq 1 + delta$ once $S$ is large. Moreover
  $ - frac(psi'' \( l \), psi' \( l \)) = frac(1, l \( l + 1 \)) \, #h(2em) frac(l \( l + 1 \), s) arrow.r 0 $
  by (2.41). Thus (2.39) and Lemma 17 apply with $L lt.eq 1 + delta$.
  #emph[The upper logarithmic coefficient.] Let $1 \/ \( 2 sqrt(2) \) < c_(*) < sqrt(2) \/ 3$ and $P$ be those of Lemma 13. Increase $S$ so this lemma applies on $Sigma_(S \/ 2)$ and its $P$-tube is injective. The source term of (2.40) contributes one curvature integral; the target terms contribute at most two by Lemma 16. The area Jacobians and radial-weight changes cost a relative $1 + C delta$ after increasing $S$. Thus the curvature integral in (2.40), including its factor $L$, is at most
  $ \( 1 + C delta \) thin 3 integral_(Sigma_(S \/ 2) ∩ { 3 R_0 \/ 4 < r < 3 R }) \| H \( z \) \| r^(2 - m) thin thin upright(d) S . $
  At every such base point,
  $ \| H \( z \) \| lt.eq c_(*) / sigma integral_(- P)^P q^3 D \( z + t nu \( z \) \) thin thin upright(d) t . $
  Choose $R_0$ also large compared with $P$. Tube changes of radial weights and volume Jacobians have relative error as small as desired, and this enlarged region’s $P$-tube lies in $R_0 \/ 2 < \| x - y \| < 4 R$ when $R_0 > 4 P$. Using (2.34) therefore gives
  #[#set math.equation(numbering: n => "(2.42)")
   $ limsup_(R arrow.r oo) frac(L, log R) integral_(Sigma_S ∩ { R_0 < r < 2 R }) r^(2 - m) #scale(x: 120%, y: 120%)[\(] \| H \( z \) \| + \| H \( pi \( z \) \) \| #scale(x: 120%, y: 120%)[\)] thin thin upright(d) S lt.eq \( 1 + C delta \) thin 3 c_(*) K m omega_m frac(\( m - 2 \)^2, 4) . $ <eq:B9>]
  There is no extra multiplicity from this last transfer: the normal tube over $Sigma_(S \/ 2)$ is injective.
  #emph[Almost all surface mass reaches the cap.] For the lower bound choose $T_0 = \( sqrt(2) - delta \) log R$. We first prove that, for any $gamma > 0$,
  #[#set math.equation(numbering: n => "(2.43)")
   $ D \( z \) + D \( pi \( z \) \) gt.eq c_gamma e^(- \( sqrt(2) + gamma \) l \( z \)) quad \( z in Sigma_S \) $ <eq:finite-endpoint-defect>]
  when $S$ is large. The endpoint normals have opposite orientations and $D = o \( 1 \)$, so $\| p \( z \) - p \( pi \( z \) \) \| gt.eq c > 0$. Apply (2.10) with exponential rate $2 sqrt(2) + 2 gamma$ along each half of the chord. Since $\| nabla p \| = \| T \| lt.eq C sqrt(D)$, integration from the two endpoints to the midpoint gives
  $ c lt.eq C_gamma #scale(x: 120%, y: 120%)[\(] sqrt(D \( z \)) + sqrt(D \( pi \( z \) \)) #scale(x: 120%, y: 120%)[\)] e^(\( sqrt(2) + gamma \) l \( z \) \/ 2) . $
  Squaring proves (2.43).
  Choose $gamma > 0$ so $beta = \( sqrt(2) + gamma \) \( sqrt(2) - delta \) < 2$. On the exceptional set
  $ E_R = { z in Sigma_S : R \/ 2 < r < 2 R \, med l \( z \) < T_0 } \, $
  (2.43) gives $D \( z \) + D \( pi \( z \) \) gt.eq c R^(- beta)$. By (2.31), the area formula, multiplicity two and the radial comparability of the feet,
  $ cal(H)^m \( E_R \) lt.eq C R^beta integral_(E_R) #scale(x: 120%, y: 120%)[\(] D \( z \) + D \( pi \( z \) \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) S lt.eq C R^(m - 2 + beta) = o \( R^m \) . $
  Outside this exceptional set on the support of $F$, $l gt.eq T_0$; since $l > 1$, $w = T_0$. Applying (2.33), with its error chosen at most $delta$, gives
  $ liminf_(R arrow.r oo) frac(R^(- m), log R) integral_Sigma w chi F \( r \/ R \) thin thin upright(d) S gt.eq \( sqrt(2) - delta \) #scale(x: 120%, y: 120%)[\(] K m omega_m \( m - 2 \) - delta #scale(x: 120%, y: 120%)[\)] . $
  #emph[The incompatible coefficients.] All cutoff errors in (2.40) other than $T_0 eta \( R_0 \)$ vanish after division by $log R$. To make the order of choices explicit, first fix $delta$; then fix $P \, S$ to meet the mean-curvature, tube, concavity and mass requirements; next fix $R_0$, as large as needed for the radial tail; finally let $R arrow.r oo$. Letting $R_0 arrow.r oo$ in the resulting numerical inequality removes $\( sqrt(2) - delta \) eta \( R_0 \)$. Now send $delta arrow.r 0$ and use (2.42). Cancellation of the positive factor $K m omega_m \( m - 2 \)$ yields
  $ sqrt(2) lt.eq frac(3 c_(*), 4) \( m - 2 \) . $
  This is impossible for $3 lt.eq m lt.eq 6$, since its right side is at most $3 c_(*) < sqrt(2)$. In the endpoint $m = 6$, the strict inequality in Lemma 13 is essential. No critical solution exists, proving Theorem 3. ◻
]

===== 2.3.6 The local regularity consequence <the-local-regularity-consequence>

The classification has now made every finite threshold subcritical. The following consequence therefore applies a local density bound at one large radius; it does not require a global density bound for the particular entire solution to which it is applied.

#thm([Corollary 2.12.])[
  (Uniform regularity from any finite density bound).  #emph[Fix $4 lt.eq n lt.eq 7$ and $0 < K_f < oo$. There are $c > 0 \, C < oo \, r_0 < oo$, depending only on $n \, K_f$, such that every entire stable parameter-one solution with $M_r \( z \) lt.eq K_f$, $r gt.eq r_0$, satisfies 
$ \| nabla v \| gt.eq C^(- 1) \, #h(2em) lr(|nabla frac(nabla v, \| nabla v \|)|) lt.eq C \/ r quad upright("on ") B_(c r) \( z \) ∩ { \| v \| lt.eq 0.9 } . $

 For each prescribed slope tolerance and each fixed $iota > 0$, if $v \( z \) = 0$, a sufficiently thin slab confinement of the zero set in this ball about a hyperplane through $z$ gives, on a smaller cylinder, ordered graphs with that slope tolerance and 
$ parallel nabla^2 f_i parallel_oo + r^(1 \/ 2) \[ nabla^2 f_i \]_(C^(1 \/ 2)) lt.eq C' \/ r \, #h(2em) \| H_i \| lt.eq C'_iota r^(- 2 + iota) . $

 The constants and interior fractions depend only on the stated parameters. On each fixed window about an inner zero, the solution converges smoothly to its oriented planar profile as $r arrow.r oo$, uniformly among these solutions.]
] <cor:finite-subcritical>

#proof[
  Theorem 3 makes every finite $K_f$ subcritical. Apply #cite(label("FSS2025")) Theorem 3.2 with its tolerance $delta \( K_f \, n \)$ and $r^(- 1) lt.eq delta$; its allowed density is $K_f + delta$, so the stated bound suffices. Its sheeting assumptions and #cite(label("FSS2025")) Theorem 2.14, Theorem 4.8, and Lemmas 4.9–4.10 give the remaining assertions, as specified above. Constants $plus.minus 1$ have an empty core band and cause no exception. ◻
]

== 3 Geometry and stability without a density bound <geometry-and-stability-without-a-density-bound>

==== 3.1 Penalized reach and isolated interfaces <sec:reach>

We now work in the only case left by finite-density rigidity: an entire stable solution $v : bb(R)^7 arrow.r \( - 1 \, 1 \)$ with $D > 0$ and unbounded energy density. Thus the interface dimension is $m = 6$. Our aim is to attach a length to each regular zero that controls both bending of its own sheet and approach to another sheet. We will prove a differential inequality for this length, including a precise rule for integrating the contribution of a second contact point.

Recall that $Sigma = { v = 0 }$ and, on its regular part, $nu = nabla U \/ \| nabla U \|$, $A = d nu \|_(T Sigma)$, $a = \| A \|$, and $H = "tr" A$. For the opposite orientation, or a separately specified unit normal $N$, we write $A_N$ and $H_N$. The normal map is

$ \( z \, t \) mapsto z + t nu \( z \) . $

It can lose local invertibility when $upright("Id") + t A$ becomes singular; even before that, normals from different parts of $Sigma$ can meet. The reach below records both obstructions through chords between zeros.

There is still useful local regularity in this setting. Corollary 19 applies whenever one large ball has a fixed finite density bound; it does not require a density bound on the whole solution. We first find such a ball at almost the reach scale. Its isolated graph supports two parity projections that improve mean-curvature derivatives. A separate tangent-ball argument controls the signed mean curvature at a possibly distant contact. These are the two local inputs to the reach inequality.

Throughout, put

$ K \( R \) = 1 + sup_(x in bb(R)^7) M_R \( x \) . $

Monotonicity and the uniform energy-integrand bound give $1 lt.eq K \( R \) lt.eq 1 + C R$ and $K \( R \) arrow.r oo$. All constants are uniform in the solution and in translating centers. When dependence on a fixed penalty matters, it is indicated by $C_Gamma$. Dependence on $K$ will always be displayed explicitly.

===== 3.1.1 Chords, the penalty, and ordinary tubes <chords-the-penalty-and-ordinary-tubes>

For distinct zeros $z \, y$, with $z$ regular, set $ell = \| y - z \|$, $e = \( y - z \) \/ ell$, and $s = \| nu \( z \) dot.op e \|$. If $s > 0$, then $ell \/ s$ is twice the radius of the normal tangent ball at $z$ passing through $y$. As $y$ tends to $z$ along a principal direction, the same quotient tends to twice the reciprocal absolute principal curvature when that curvature is nonzero. Thus taking an infimum over chords measures both approach and bending.

Figure 1 illustrates this quotient before we modify its angular factor.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.875), radius: 1.875, stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((-2.625, 0), (2.625, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.625, 0), [#text(size: 9pt)[$T_z Sigma$]], anchor: "west", padding: 0.1176cm)
  bezier((-1.438, 0.1625), (0, 0), (-0.6875, 0.03125), (-0.25, 0), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  bezier((0, 0), (1.438, 0.1625), (0.25, 0), (0.6875, 0.03125), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  line((0, 0), (0, 1.062), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 1.062), [#text(size: 9pt)[$nu (z)$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (1.875, 1.875), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.9375, 0.9375), [#text(size: 9pt)[$ell e=y-z$]], anchor: "north-west", padding: 0.1176cm)
  line((0, 1.875), (1.875, 1.875), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.9375, 1.875), [#text(size: 9pt)[$ell"/"(2s)$]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$z$]], anchor: "north-east", padding: 0.1176cm)
  circle((1.875, 1.875), radius: 0.05644, fill: black, stroke: none)
  content((1.875, 1.875), [#text(size: 9pt)[$y in Sigma$]], anchor: "west", padding: 0.1176cm)
  circle((0, 1.875), radius: 0.04233, fill: rgb("#00008c"), stroke: none)
  content((-0.1, 2.062), [#text(size: 9pt)[center]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: The normal-centered circle through two zeros, shown on the side where $nu \( z \) dot.op e = s > 0$. Its radius is $ell \/ \( 2 s \)$, so the unmodified quotient $ell \/ s$ is twice that radius. The blue arc shows only the local sheet at $z$; the picture asserts neither tangency at $y$ nor that the circle bounds a zero-free ball. The penalized reach replaces $1 \/ s$ by $Gamma \( s \)$ below. ],
) <fig:reach-tangent-ball>

We slightly modify this quotient when the chord is almost normal. The angular factor $Gamma \( s \)$ will equal $1 \/ s$ away from $s = 1$, stay uniformly close to $1 \/ s$, and be constant near $1$. Its constant portion makes the second contact normal to the chord; this is what will permit the signed transfer in Proposition 26. The transition must also have small weighted second derivative, so its differentiation costs only an arbitrarily small error.

Here is a penalty with these properties. Fix an accuracy $epsilon_1 > 0$, choose $0 < delta_1 < 1 \/ 10$, then $L > 1$, and put $delta_2 = delta_1 e^(- L)$. Let $chi : bb(R) arrow.r \[ 0 \, 1 \]$ be smooth, nonincreasing, equal to $1$ on $\( - oo \, 0 \]$, and equal to $0$ on $\[ 1 \, oo \)$. For $s gt.eq 1 - delta_1$ define

$ Gamma \( s \) = frac(1, 1 - delta_1) - integral_(1 - delta_1)^s u^(- 2) chi #h(-0.16667em) (frac(log \( delta_1 \/ \( 1 - u \) \), L)) thin thin upright(d) u \, $

and set $Gamma \( s \) = s^(- 1)$ below $1 - delta_1$. The integrand is understood as zero near $u = 1$. This gives a smooth function on $\( 0 \, 1 \]$, constant, with value $G_1$, for $s gt.eq 1 - delta_2$. Direct differentiation gives

#[#set math.equation(numbering: n => "(3.1)")
 $ s^(- 1) lt.eq Gamma \( s \) lt.eq \( 1 + C delta_1 \) s^(- 1) \, #h(2em) 1 lt.eq G_1 lt.eq Gamma \( s \) \,\
- \( 1 - delta_1 \)^(- 2) lt.eq Gamma' \( s \) lt.eq 0 \, #h(2em) 0 lt.eq \( 1 - s \) Gamma'' \( s \) lt.eq frac(2 delta_1, \( 1 - delta_1 \)^3) + frac(parallel chi' parallel_oo, L \( 1 - delta_1 \)^2) lt.eq epsilon_1 quad \( s gt.eq 1 - delta_1 \) . $ <eq:reach-penalty>]

The last inequality is achieved by first decreasing $delta_1$ and then increasing $L$. Thus both $G_1 - 1$ and $epsilon_1$ can be prescribed arbitrarily small. All choices are made before any large reach or exhaustion limit.

On $Sigma_(upright("reg"))$ define

#[#set math.equation(numbering: n => "(3.2)")
 $ d \( z \) = inf_(y in Sigma \\ { z }) ell Gamma \( s \) \, #h(2em) ell = \| y - z \| \, quad e = frac(y - z, ell) \, quad s = \| nu \( z \) dot.op e \| . $ <eq:reach-definition>]

A competitor with $s = 0$ has value $+ oo$. An #emph[active contact] is a competitor attaining this infimum, or a limiting diagonal competitor attaining it as the second point approaches the base. The proof of Proposition 26 will show that one of these alternatives always realizes the infimum.

#thm([Lemma 3.1.])[
  (Elementary chord bounds).  #emph[The function $d$ is finite and positive on $Sigma_(upright("reg"))$. At every such point, writing $lambda_i$ for the eigenvalues of $A$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ d max_i \| lambda_i \| lt.eq 2 \, #h(2em) \| \( y - z \) dot.op nu \( z \) \| lt.eq C_Gamma \| y - z \|^2 \/ d \( z \) quad \( y in Sigma \) . $ <eq:reach-elementary>]

 For each $J < oo$ there is a uniform $delta \( J \) > 0$ such that $v \( z \) = 0$ and $D \( z \) < delta \( J \)$ imply $d \( z \) > J$. Moreover, at every regular base there are zero-free open balls tangent at that base on both normal sides, of radius $c_Gamma d \( z \)$.]
] <lem:reach-small-defect>

#proof[
  Local smooth graph representation bounds the quotients $\| nu \( z \) dot.op \( y - z \) \| \/ \| y - z \|^2$ for nearby zeros; competitors outside a fixed small ball have a positive lower bound because $Gamma gt.eq 1$. This proves positivity. If every zero lay in the tangent plane at $z$, phase decay (2.15) would bound the energy by $C e^(- c "dist" \( x \, T_z Sigma \))$, giving finite density. Thus a finite competitor exists. A signed unit geodesic tangent to a principal direction gives $ell \/ s arrow.r 2 \/ \| lambda_i \|$ whenever $lambda_i eq.not 0$, proving the first inequality. The second uses the #emph[upper] penalty bound: $d lt.eq ell Gamma \( s \) lt.eq C_Gamma ell \/ s$.
  If $D \( z_j \) arrow.r 0$, the translated, rotated fields $U$ converge smoothly on every fixed ball to $x_n$, by (2.10) and the equation. In $B_(4 J)$ all zeros are therefore one graph whose curvature and slope tend to zero. A competitor of value at most $J$ has $ell lt.eq J$; on this graph $s lt.eq o \( 1 \) ell$, whereas $ell Gamma \( s \) gt.eq ell \/ s$. This is impossible, also for competitors converging to the diagonal. The contradiction formulation proves uniformity of the threshold. Finally, the second inequality in (3.3) excludes zeros from each ball $B_(c_Gamma d) \( z plus.minus c_Gamma d nu \)$ when $c_Gamma$ is sufficiently small: a point in either ball has $\| nu dot.op \( y - z \) \| > \| y - z \|^2 \/ \( 2 c_Gamma d \)$. ◻
]

#prodef([Remark 3.2.])[
  (Jointly injective ordinary tubes).  The elementary chord inequality also gives the ordinary tube used in the final packing argument. If $d \( z \) > L$, choose $0 < c < min { 1 \/ \( 2 C_Gamma \) \, 1 \/ 2 }$. For $0 < \| t \| < c L$ and every other zero $y$,
  $ \| z + t nu \( z \) - y \|^2 - t^2 = \| y - z \|^2 - 2 t nu \( z \) dot.op \( y - z \) gt.eq \( 1 - 2 c C_Gamma \) \| y - z \|^2 > 0 . $
  Thus $z$ is the unique nearest zero to $z + t nu \( z \)$. Normal tubes over all bases with $d > L$ are therefore jointly injective in this range, on both sides. The curvature bound $max \| lambda_i \| lt.eq 2 \/ d$ implies $det \( upright("Id") + t A \) gt.eq \( 1 - 2 c \)^m > 0$. Consequently any such bases in $B_(2 R)$ have area at most $C R^(m + 1) \/ L$ when $L lt.eq R$, by integrating the positive Jacobian over both normal sides and comparing the resulting tube volume to $\| B_(3 R) \|$.
] <rem:reach-ordinary-tube>

===== 3.1.2 A bounded density window with delayed monotonicity <a-bounded-density-window-with-delayed-monotonicity>

A long reach confines nearby zeros to a thin slab. We use that confinement to limit the increase of energy density between successive radii. The resulting estimate involves the density at a larger radius, so its discrete iteration must retain that delay.

#thm([Lemma 3.3.])[
  (A fixed density bound near the reach scale).  #emph[There are fixed $C \, c > 0$ and a fixed density bound $K_0 < oo$ such that, if $d = d \( z \)$ is sufficiently large, then 
#[#set math.equation(numbering: n => "(3.4)")
 $ h = d exp { - C sqrt(log \( K \( d \) + 1 \)) } \, #h(2em) M_h \( z \) lt.eq K_0 . $ <eq:C1>]

 The constant $C$ can be increased without invalidating the conclusion. In particular $h gt.eq d^(1 - o \( 1 \))$, uniformly as $d arrow.r oo$.]
] <lem:reach-density-window>

#proof[
  #emph[Slab confinement and one-step density control.] Translate $z$ to $0$ and take $nu \( z \) = e_n$. By (3.3), the zeros in $B_(3 R)$ lie in $\| x_n \| lt.eq C R^2 \/ d$. With $bb(S) = e \( v \) upright("Id") - nabla v ⊗ nabla v$, the stress tensor identity $"div" bb(S) = 0$, tested against $x_n e_n zeta^2$, gives
  $ integral zeta^2 bb(S)_(n n) = - 2 integral x_n zeta thin bb(S) e_n dot.op nabla zeta . $
  The identities $nabla v = q p \/ sqrt(2)$ and $e \( v \) = q^2 \( 1 + \| p \|^2 \) \/ 4$ show $bb(S)_(n n) gt.eq c q^2 \( 1 - p_n^2 \)$ and $\| bb(S) e_n \|^2 lt.eq C q^2 bb(S)_(n n)$. Young’s inequality, with a cutoff equal to one on $B_R$ and supported on $B_(2 R)$, consequently proves
  $ integral_(B_R) q^2 \( 1 - p_n^2 \) lt.eq C integral_(B_(2 R)) q^2 \( x_n \/ R \)^2 . $
  On the part of $B_(2 R)$ with $\| x_n \| > C R^2 \/ d + sqrt(R)$, every zero either lies outside $B_(3 R)$ or has the confined height, so its distance is at least $c sqrt(R)$. Phase decay controls the energy there by $C R^n e^(- c sqrt(R))$. Elsewhere $\( x_n \/ R \)^2 lt.eq C \( \( R \/ d \)^2 + R^(- 1) \)$.
  In the monotonicity formula between $R \/ B$ and $R$, with a fixed $B gt.eq 8$, the discrepancy is bounded by $C q^2 \( 1 - p_n^2 \)$, and the squared radial derivative on these annuli by $C_B q^2 \( 1 - p_n^2 + \( x_n \/ R \)^2 \)$. The preceding estimate, at a fixed multiple of $R$, therefore gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ 0 lt.eq M_R \( z \) - M_(R \/ B) \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(] \( R \/ d \)^2 + R^(- 1) #scale(x: 120%, y: 120%)[\)] M_(B R) \( z \) #h(2em) \( 10 lt.eq R lt.eq c d \) . $ <eq:C3>]
  The exponentially small remainder was absorbed using $M_R \( z \) gt.eq c$ for $R gt.eq 1$. This uniform lower bound follows from $v \( z \) = 0$, the uniform first derivative bound, and monotonicity.
  #emph[Iterating with the larger-radius term.] We now retain the delay in (3.5); replacing $M_(B R)$ by $M_R$ would give an unjustified recursion. Set $R_j = d B^(- j)$, $k_j = M_(R_j) \( z \)$, and $b_j = C \( B^(- 2 j) + R_j^(- 1) \)$. Beyond a fixed starting index,
  $ k_j - k_(j + 1) lt.eq b_j k_(j - 1) . $
  Choose $R_(upright("fix"))$ and that starting index so $b_j < 1 \/ 8$ while $R_j gt.eq R_(upright("fix"))$. Put $J = ceil.l C_0 sqrt(log \( K \( d \) + 1 \)) ceil.r$. For sufficiently large $d$, $R_(2 J + 10) gt.eq d^(1 \/ 2)$, because $K \( d \) lt.eq 1 + C d$. Suppose a halving $k_(j + 1) < k_j \/ 2$ occurs at some $j gt.eq J - 2$ before the fixed-scale endpoint. Then $k_(j - 1) > k_j \/ \( 2 b_j \) > 4 k_j$, so a halving also occurs at the preceding index. Induction propagates this backwards through all indices in $\[ ceil.l J \/ 2 ceil.r \, J - 3 \]$. On this interval $b_i lt.eq C e^(- c J)$: the $B^(- 2 i)$ term has this bound, and $R_i^(- 1) lt.eq d^(- 1 \/ 2)$ is smaller. Multiplying the preceding lower growth factors over at least $c J$ indices gives $K \( d \) gt.eq c exp \( c' J^2 \)$, contradicting the choice of large $C_0$. Here all $k_j$ before the endpoint are bounded below by the same positive constant. Thus no such halving occurs.
  It follows that $k_(j - 1) lt.eq 2 k_j$ for $j gt.eq J$ up to that endpoint, and hence $k_(j + 1) gt.eq \( 1 - 2 b_j \) k_j$. The sum of $b_j$ on this range is uniformly bounded: the first terms form a geometric series, and the $R_j^(- 1)$ terms form a reversed geometric series ending at a fixed radius. The product of $\( 1 - 2 b_j \)^(- 1)$ is therefore bounded. At the last index $M_(R_j)$ has a uniform bound from the bounded energy integrand. Consequently $k_J lt.eq K_0$ with fixed $K_0$. Taking $C$ large enough in (3.4) makes $h lt.eq R_J$; monotonicity completes the proof. ◻
]

===== 3.1.3 A bounded positive barrier for the normal operator <a-bounded-positive-barrier-for-the-normal-operator>

The profile error on either side of an isolated zero sheet vanishes on that sheet. To compare this error with its forcing we need a positive bounded supersolution for the normal operator. The following formula will also apply when the boundary of a later comparison region is shifted by a fixed amount.

#thm([Lemma 3.4.])[
  (Positive half-line barrier).  #emph[Let $g \( t \) = tanh \( t \/ sqrt(2) \)$ and $V_g \( t \) = 3 g \( t \)^2 - 1$. For each fixed $a_0 in bb(R)$, the function 
#[#set math.equation(numbering: n => "(3.6)")
 $ v_(a_0) \( t \) = g' \( t \) [1 + integral_(a_0)^t \( g' \( s \) \)^(- 2) integral_s^oo g' \( r \) thin thin upright(d) r thin thin upright(d) s] \, #h(2em) t gt.eq a_0 \, $ <eq:reach-half-line-barrier>]

 satisfies 
$ \( - partial_t^2 + V_g \) v_(a_0) = 1 \, #h(2em) 0 < c_(a_0) lt.eq v_(a_0) lt.eq C_(a_0) . $

 Every fixed derivative of $v_(a_0)$ is bounded on this half-line. The constants can be chosen uniformly when $a_0$ varies over a fixed compact interval. Translating the independent variable gives the same assertion for a translated profile and half-line.]
] <lem:reach-half-line-barrier>

#proof[
  Write $v_(a_0) = g' b$ and use $\( - partial_t^2 + V_g \) g' = 0$. Then
  $ \( - partial_t^2 + V_g \) \( g' b \) = - 1 / g' #scale(x: 120%, y: 120%)[\(] \( g' \)^2 b' #scale(x: 120%, y: 120%)[\)]' = 1 \, $
  since $\( g' \)^2 b' = integral_t^oo g' \( r \) thin thin upright(d) r$. Both terms in the bracket in (3.6) are nonnegative, and $g' > 0$. Moreover $g' \( t \) tilde.op 2 sqrt(2) e^(- sqrt(2) t)$ and $integral_t^oo g' = 1 - g \( t \) tilde.op 2 e^(- sqrt(2) t)$, so $v_(a_0) \( t \) arrow.r 1 \/ 2$ as $t arrow.r oo$. Continuity gives the positive lower and finite upper bounds, uniformly for $a_0$ in a compact interval. Differentiating the displayed formula gives a bounded first derivative; the equation and its successive derivatives give all remaining fixed derivative bounds. ◻
]

===== 3.1.4 Isolation and the two parity projections <isolation-and-the-two-parity-projections>

The density window now gives one graph on the scale $h$. For reach calculus we need more than its curvature bound: the first two derivatives of $H$ must be smaller than the scale-invariant $h^(- 3)$ size. Two projections in the normal variable provide this gain. The first uses oddness of the leading curvature forcing; the second uses the tangential improvement obtained from the first.

#thm([Lemma 3.5.])[
  (An isolated graph and mean-curvature derivatives).  #emph[There are uniform $c \, c' \, C \, gamma > 0$ such that, for sufficiently large $d \( z \)$ and $h$ in (3.4), the zero set in $B_(c h) \( z \)$ is a single graph over $T_z Sigma$, extending over the tangent disk of radius $c' h$. On a smaller concentric portion, 
#[#set math.equation(numbering: n => "(3.7)")
 $ \| A \| + h^(1 \/ 2) \[ A \]_(C^(1 \/ 2)) lt.eq C h^(- 1) \, #h(2em) \| nabla_Sigma A \| lt.eq C h^(- 2) \, #h(2em) \| H \| lt.eq C h^(- 2) \,\
\| nabla_Sigma H \| + \| nabla_Sigma^2 H \| lt.eq C h^(- 3 - gamma) . $ <eq:C2>]

 The estimates hold uniformly on every inner patch having a fixed fractional margin from the original chart boundary. Hölder norms may be computed in its graph coordinates.]
] <lem:reach-isolation>

#proof[
  #emph[One graph and preliminary bounds.] The fixed bound of Lemma 22 is subcritical by Theorem 3. Apply Corollary 19, including its sheeting conclusions, at radius $h$. Thus the density used here is the fixed local bound $K_0$; the contradiction hypothesis still allows unbounded density on larger scales. The confinement thickness divided by this radius is $O \( h \/ d \)$. Increasing the fixed constant in (3.4) makes this ratio as small as required, without changing the density bound. The resulting graphs have arbitrarily small fixed slope, the first estimate in (3.7), and
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| H \| lt.eq C_iota h^(- 2 + iota) quad upright("for every fixed ") iota > 0 . $ <eq:reach-preliminary-H>]
  An additional graph in an inner cylinder would cross the normal line at $z$ at distance $O \( h \)$, producing a competitor of value $O \( h \)$, contrary to $d \/ h$ being sufficiently large. Thus just one sheet remains in a smaller cylinder. On fixed windows centered on inner zeros the solution, in oriented normal coordinates, converges uniformly and smoothly to $g$. The lower gradient bound from sheeting and interior elliptic estimates also give unit-scale bounds on all fixed orders of graph derivatives. These statements are uniform in the centers and solutions, by the stated uniformity of the subcritical ball input and the usual sequential formulation of compactness.
  It remains to strengthen the mean-curvature derivatives and then recover the large-scale bound on $nabla_Sigma A$. The two projections below serve different purposes: the first removes the leading odd forcing from the equation at the zero sheet, and the second uses the resulting tangential gain to improve the derivatives of $H$. We prove the derivative improvement; in particular we do not differentiate (3.8) at its original scale. Fix an inner zero as origin. Let $X \( y \)$ be its tangent-plane graph and use Fermi coordinates $X \( y \) + t nu \( y \)$. Choose a small number $epsilon.alt > 0$, to be fixed at the end, and write $R_h = h^epsilon.alt$. All arguments below take place in a fixed finite sequence of nested boxes with side lengths fixed fractions of $R_h$, starting inside ${ \| y \|_oo \, \| t \| < R_h }$. The much larger $h$-scale chart guarantees that these coordinates are injective there, have polynomially bounded unit-scale derivatives of each fixed order, and contain no other zero. The distance to $Sigma$ is comparable to $\| t \|$ on the boxes. Consequently
  $ phi \( y \, t \) = v \( X \( y \) + t nu \( y \) \) - g \( t \) = o \( 1 \) $
  uniformly. To see uniformity also at unbounded $t$, first choose a large fixed depth and use phase decay beyond it, then use the fixed window convergence at shallower depths. For $\| t \|$ a fixed fraction of $R_h$, $phi$ and every needed fixed derivative are bounded by $C h^C e^(- c R_h)$: apply phase decay and unit-scale elliptic estimates to $v minus.plus 1$, and differentiate the coordinate composition.
  We record the interpolation used below. If a tensor has uniformly bounded $C^N$ norm on unit balls and $C^(1 \/ 2)$ seminorm at most $C h^(- 3 \/ 2)$, its derivatives of orders $1 lt.eq k lt.eq 30$ are bounded by $C h^(- 5 \/ 4)$, by taking $N$ sufficiently large once and for all. Indeed the standard interpolation exponent of the low seminorm can be taken arbitrarily close to one for any fixed $k$ by increasing $N$; subtracting its value at the center removes the constant term. Applied to the coordinate components of $A$, whose change-of-frame terms have the same or better bound, this gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| partial_y^k A \| lt.eq C h^(- 5 \/ 4) quad \( 1 lt.eq k lt.eq 30 \) \, #h(2em) \| partial_y^k H \| lt.eq C_epsilon.alt h^(- 2 + epsilon.alt) quad \( 0 lt.eq k lt.eq 30 \) . $ <eq:reach-interpolation>]
  For the second assertion use (3.8) with $iota < epsilon.alt \/ 2$ and interpolate its supremum norm with a sufficiently high unit-scale derivative bound. All interpolation orders are finite and fixed before $h$ tends to infinity.
  In these coordinates the equation is exactly
  #[#set math.equation(numbering: n => "(3.10)")
   $ \( - Delta_y - partial_t^2 + V_g \) phi =  & K_t g' + K_t phi_t + \( g_t^(i j) - delta^(i j) \) partial_(i j) phi + b_t^i partial_i phi - 3 g phi^2 - phi^3 \,\
V_g =  & 3 g^2 - 1 \, #h(2em) K_t = "tr" \[ A \( upright("Id") + t A \)^(- 1) \] thin . $ <eq:C4>]
  Here $g_t^(i j)$ is the inverse tangential metric, and $b_t^i$ is the first-order coefficient in its Laplace operator. Neither superscript nor subscript $t$ denotes differentiation in this display. Matrix inversion in $upright("Id") + t A$, the graph metric, and (3.9) give, with derivatives through order 20,
  #[#set math.equation(numbering: n => "(3.11)")
   $ K_t = H - t \| A \|^2 + t^2 "tr" A^3 + O \( h^(- 4 + C epsilon.alt) \) \, #h(2em) K_t = O \( h^(- 2 + C epsilon.alt) \) \,\
g_t^(i j) - delta^(i j) = O \( h^(- 1 + C epsilon.alt) \) \, #h(2em) b_t^i = O \( h^(- 1 + C epsilon.alt) \) . $ <eq:reach-coefficients>]
  Every occurrence of $C epsilon.alt$ in this proof has a bounded absolute multiplier independent of $epsilon.alt$. For example the tangent slope is $O \( h^(- 1 + epsilon.alt) \)$, and the remainder in the first line contains at least four factors of $A$ and at most a fixed power of $\| t \|$. The differentiated remainders obey the same bounds, since each positive derivative of $A$ is no larger than $O \( h^(- 1) \)$.
  #emph[A first bound for the profile error.] Use $v_0$ from Lemma 23 on $t gt.eq 0$ and its reflection on $t lt.eq 0$, separately on the two half-boxes. The reflected pair need not be differentiable at zero; no full-line supersolution is asserted. In each half-box move the metric and drift terms to the left of (3.10) and write the nonlinearity as $\( 3 g phi + phi^2 \) phi$. Its coefficient tends uniformly to zero, so the resulting operator applied to $v_0$ is at least $1 \/ 2$. Comparison is valid after division by this positive supersolution, which makes the zeroth-order coefficient positive. For each lateral or distant normal face, $v_0 e^(- c_0 thin upright("distance to face"))$ is also a supersolution when $c_0$ is a sufficiently small fixed number. The sum of these face barriers and $C h^(- 2 + C epsilon.alt) v_0$ dominates both signs of $phi$. The bottom boundary has $phi \( y \, 0 \) = 0$. Shrinking the box makes all face contributions exponentially small. Interior elliptic estimates across $t = 0$, using the smooth equation, then give
  #[#set math.equation(numbering: n => "(3.12)")
   $ parallel phi parallel_(C^15) lt.eq C_epsilon.alt h^(- 2 + C epsilon.alt) . $ <eq:reach-phi-first>]
  The coefficient norms needed for this bootstrap are uniform by (3.11); the nonlinearity is smooth and has already been bounded in supremum norm.
  #emph[The inverse on the complement of the translation mode.] The positive barrier controlled the full profile error. The next estimate separates its translation mode from the remaining normal modes, where a spectral gap is available. Let $L_t = - partial_t^2 + V_g$. It has kernel spanned by $g'$ and a fixed spectral gap $lambda > 0$ on its $L^2 \( bb(R) \)$ orthogonal complement. One elementary justification is the ground-state factorization of its quadratic form, simplicity of the positive zero mode, and compactness on bounded intervals together with $V_g arrow.r 2$ at infinity; a Rayleigh sequence tending to zero could neither escape to infinity nor stay orthogonal to the kernel. Let $P_perp$ be this projection. For
  $ \( - Delta_y + L_t \) w = P_perp F \, #h(2em) P_perp w = w \, $
  the regularized $L_t^2$ norm of each $y$-derivative of $w$ is a subsolution for $- Delta_y + lambda$, with source the corresponding norm of $F$. This follows by differentiating the squared norm, using $chevron.l L_t w \, w chevron.r gt.eq lambda parallel w parallel_2^2$ and Cauchy–Schwarz, and then letting the regularization vanish. Comparison with the constant source bound plus decaying face barriers controls these norms on each smaller $y$-box, with an exponentially small multiple of their boundary bound. Commuting two additional $y$-derivatives and using the equation gives the same bound in $H_t^2$, since $parallel w parallel_(H^2) lt.eq C \( parallel L_t w parallel_2 + parallel w parallel_2 \)$. Thus source derivatives through order $j + 2$ control the value at $t = 0$ and its $y$-derivatives through order $j$. This assertion applies separately to even and odd functions of $t$, because both the operator and $P_perp$ preserve parity. It applies also to a range of strictly positive derivative orders: no estimate of the undifferentiated source is needed to estimate a differentiated equation. Polynomial boundary bounds suffice in every use here.
  #emph[The whole-line equation and the first parity projection.] Choose an even cutoff $chi_h \( t \)$, equal to one on an inner normal interval and supported in a slightly larger interval inside the box, with derivatives supported where $\| t \|$ is comparable to $R_h$. Put $Phi = chi_h phi$. If $E_(upright("raw"))$ denotes the right side of (3.10) minus $H g'$, the exact equation on the whole normal line is
  $ \( - Delta_y + L_t \) Phi = H g' + E_(upright("full")) \, #h(2em) E_(upright("full")) = chi_h E_(upright("raw")) + \( chi_h - 1 \) H g' - 2 chi'_h phi_t - chi''_h phi . $
  The kernel tail $\( chi_h - 1 \) H g'$ and the two commutators, together with all their needed $y$-derivatives, are $O \( h^(- N) \)$ for every fixed $N$. For the tail this follows from the preliminary derivatives of $H$ and the exponential decay of $g'$; for the commutators it follows from the normal-edge estimates. Restoring the cutoff leading term $- chi_h t \| A \|^2 g'$ to the whole-line odd function $- t \| A \|^2 g'$ costs another error of the same order. We henceforth write $phi$ for $Phi$, and $E$ for $E_(upright("full"))$. Write
  $ phi = u_0 \( y \) g' \( t \) + phi^perp \( y \, t \) \, #h(2em) \( - Delta_y + L_t \) phi = H \( y \) g' \( t \) + E \( y \, t \) . $
  We normalize kernel coefficients by $integral \( g' \)^2$. From (3.11) and (3.12), in $L_t^2$ with $y$-derivatives through order 11,
  #[#set math.equation(numbering: n => "(3.13)")
   $ E = - t \| A \|^2 g' + O \( h^(- 3 + C epsilon.alt) \) \, #h(2em) E^(upright("even")) = O \( h^(- 3 + C epsilon.alt) \) . $ <eq:reach-first-parity>]
  Here $t^2 "tr" A^3 g'$ has size $h^(- 3 + C epsilon.alt)$, every metric error is a coefficient of size $h^(- 1 + C epsilon.alt)$ times a derivative of $phi$ of size $h^(- 2 + C epsilon.alt)$, and the normal-drift and nonlinear errors have size $h^(- 4 + C epsilon.alt)$.
  The inverse estimate for the even orthogonal component, followed by evaluation at $t = 0$, bounds $phi^perp \( y \, 0 \)$ and its derivatives through order 9 by $C h^(- 3 + C epsilon.alt)$; the odd component vanishes there. Since $phi \( y \, 0 \) = 0$, the same bound holds for $u_0$. The kernel equation
  #[#set math.equation(numbering: n => "(3.14)")
   $ - Delta_y u_0 = H + E_0 $ <eq:reach-kernel>]
  therefore bounds $H$ and its derivatives through order 7 by $C h^(- 3 + C epsilon.alt)$. In addition, positive $y$-derivatives of $- t \| A \|^2 g'$ gain $h^(- 1 \/ 4)$ over its $h^(- 2)$ bound by (3.9); derivatives of the remainder in (3.13) are already smaller. Applying the inverse estimate to the entire orthogonal component consequently gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ parallel partial_y^k phi parallel_(L_t^2) lt.eq C h^(- 2 - 1 \/ 4 + C epsilon.alt) \, #h(2em) 1 lt.eq k lt.eq 8 . $ <eq:reach-positive-phi>]
  For these $L_t^2$ bounds no loss of two derivative orders is required; the already controlled derivatives of $u_0$ cover the kernel term.
  The first projection has now bounded the kernel coefficient through nine tangential derivatives and $H$ through seven. The full orthogonal equation has also supplied the gain in (3.15) without losing derivative orders. We use that gain in a second even projection; no eighth derivative of $H$ is required, because $P_perp$ annihilates $H g'$.
  #emph[The second parity projection.] Return to (3.10). Positive derivatives through order 6 of the even part of $E$ now obey
  #[#set math.equation(numbering: n => "(3.16)")
   $ parallel partial_y^k E^(upright("even")) parallel_(L_t^2) lt.eq C h^(- 3 - 1 \/ 4 + C epsilon.alt) \, #h(2em) 1 lt.eq k lt.eq 6 . $ <eq:reach-second-parity>]
  Indeed the odd term $- t \| A \|^2 g'$ still contributes nothing; a positive derivative of $"tr" A^3$ contains a factor bounded by $h^(- 5 \/ 4)$; every horizontal metric or drift error contains at least one positive $y$-derivative of $phi$, so (3.15) applies up to order 8. If derivatives instead fall on its coefficient, that coefficient remains $O \( h^(- 1 + C epsilon.alt) \)$ and the same estimate applies to the positive derivative already present on $phi$. The normal drift and nonlinear terms remain $O \( h^(- 4 + C epsilon.alt) \)$ in these norms. This accounts for all terms, including products of derivatives and the superpolynomially small cutoff errors.
  Apply the even orthogonal inverse once more. Its value at zero and the zero condition give $\| partial_y^k u_0 \| lt.eq C h^(- 3 - 1 \/ 4 + C epsilon.alt)$ for $1 lt.eq k lt.eq 4$. Equation (3.14) gives the same estimate for $partial_y H$ and $partial_y^2 H$. Choose $epsilon.alt$ so small that every fixed exponent loss $C epsilon.alt$ above is less than $1 \/ 8$; decreasing the resulting gain if necessary gives $gamma > 0$. Covariant derivatives have the asserted bounds as well: the coordinate connection is bounded and its extra terms multiply already controlled first derivatives of $H$.
  #emph[Recovering the large-scale curvature derivative.] The improved mean-curvature derivatives are now in hand. Rescale the original graph disk by $h^(- 1)$. Its existing $C^(2 \, 1 \/ 2)$ bound is uniform, and the rescaled mean curvature $h H$ has uniformly bounded $C^(1 \, 1)$ norm, since its first and second derivatives scale by $h^2$ and $h^3$, respectively. Differentiate the prescribed mean-curvature graph equation once and apply interior Schauder estimates. The rescaled graph has a uniform third derivative bound, giving $\| nabla_Sigma A \| lt.eq C h^(- 2)$ in original variables. All boxes used above have a fixed total fractional shrinkage and all derivative orders were fixed in advance. Repeating at each inner center proves the uniform inner-window assertion. ◻
]

===== 3.1.5 One-sided trace improvement from a tangent phase ball <one-sided-trace-improvement-from-a-tangent-phase-ball>

The isolated chart controls the base point of a reach contact. Its second point need not lie in that chart, so it requires an estimate whose sole geometric input is a zero-free tangent ball. The sign of the resulting trace bound matters: only positive mean curvature at the receiving point will enter the upper reach inequality.

#thm([Lemma 3.6.])[
  (One-sided improvement at a tangent phase ball).  #emph[There are uniform $r_0 \, C \, gamma > 0$ with the following property. If an open ball of radius $r gt.eq r_0$ is disjoint from $Sigma$ and its boundary contains $x in Sigma$, and $N$ is its inward normal at $x$, then 
#[#set math.equation(numbering: n => "(3.17)")
 $ x in Sigma_(upright("reg")) \, #h(2em) D \( x \) lt.eq C \/ r \, #h(2em) a \( x \) lt.eq C \/ r \, #h(2em) H_N \( x \) lt.eq C r^(- 1 - gamma) . $ <eq:C5>]

 After changing the sign of $v$ so that it is positive inside the ball, along the inward radius one also has 
#[#set math.equation(numbering: n => "(3.18)")
 $ U \( x + s N \) gt.eq s - C \( 1 + s \) \/ r #h(2em) \( 0 lt.eq s lt.eq log r \) . $ <eq:C6>]

 Only the last curvature estimate is one-sided; no absolute-value improvement for $H_N$ is asserted.]
] <lem:reach-phase-ball>

#proof[
  #emph[Comparison along the inward radius.] Let $s$ denote inward depth in the annulus $0 < s < Q = sqrt(r)$. The nonnegative function
  $ w \( s \) = g' \( s \) integral_0^s \( g' \( t \) \)^(- 2) integral_t^oo \( g' \( u \) \)^2 thin thin upright(d) u thin thin upright(d) t $
  has $w \( 0 \) = 0$, $\( - partial_s^2 + V_g \) w = g'$, and $\| w \| + \| w' \| lt.eq C \( 1 + s \) g'$. Thus $v_(*) = g - C_0 w \/ r$, with a sufficiently large fixed $C_0$, is positive on the annulus and satisfies $Delta v_(*) + v_(*) - v_(*)^3 > 0$. Indeed the linear correction contributes $C_0 g' \/ r$, the inward radial drift is $- \( n - 1 \) v'_(*) \/ \( r - s \)$, and the quadratic correction is bounded by $C r^(- 2) \( 1 + s \)^2 \( g' \)^2 = o \( r^(- 1) g' \)$ uniformly on $\[ 0 \, Q \]$. Multiplication by $1 - e^(- c Q)$, with a sufficiently small fixed $c > 0$, keeps a strict subsolution and makes its value less than $v$ on the inner boundary, by phase decay. On the outer boundary it vanishes. Sliding its amplitude from a small positive number to one proves comparison. To justify the start, $v > 0$ in the compact annulus and the Hopf boundary estimate applies at any outer zero; these and compactness bound the quotient from below. At a first contact a strict subsolution cannot touch in the interior, and the Hopf comparison excludes an outer boundary obstruction. Smaller amplitudes remain strict subsolutions: writing $cal(F) \( w \) = Delta w + w - w^3$, one has $cal(F) \( a v_(*) \) = a cal(F) \( v_(*) \) + \( a - a^3 \) v_(*)^3 > 0$ for $0 < a lt.eq 1$.
  Inverting $g$ on $0 lt.eq s lt.eq log r$ proves (3.18): the correction is bounded by $C \( 1 + s \) g' \( s \) \/ r$, and the extra $e^(- c sqrt(r))$ term is smaller after division by $g' \( s \)$ on that range. Differentiation at the contact point gives $partial_N v \( x \) gt.eq g' \( 0 \) - C \/ r > 0$. Thus $x$ is regular, $N = nu$ after the sign choice, and $D \( x \) lt.eq C \/ r$. The tangent ball gives the principal-curvature lower bound $lambda_i \( A_N \) gt.eq - 1 \/ r$. The zero-level identity $H_N = partial_N D \/ \( 2 \| p \|^2 \)$ and (2.10) give $\| H_N \| lt.eq C D lt.eq C \/ r$. Summing the principal curvatures then bounds each one from above by $C \/ r$, proving the full curvature estimate in (3.17).
  #emph[Separating the even source from the boundary contribution.] The comparison has established regularity and the $r^(- 1)$ bounds. To improve only the upper trace, place $x = 0$, $N = e_n$, and use the ambient vertical coordinate $s$. Work in $B_P$ with $P = alpha log r$, where $alpha > 0$ is fixed sufficiently small at the end. The differentiated diffuse estimates give, for every needed fixed order $k$,
  $ parallel D parallel_(C^k \( B_P \)) lt.eq C_k r^(- 1 + C alpha) \, #h(2em) parallel T parallel_(C^k \( B_P \)) + parallel U - s parallel_(C^k \( B_P \)) lt.eq C_k r^(- 1 \/ 2 + C alpha) . $
  These follow by applying unit-ball derivative estimates and the exponential comparison for $D$ along chains from $0$; integration of $T$ gives the estimate on $U - s$. The multipliers of $alpha$ are fixed independently of small $alpha$. The identity $nabla_p T = - T^2 - nabla^2 D \/ 2$ further gives $partial_s T = O \( r^(- 1 + C alpha) \)$: the replacement of $p$ by $e_n$ has error $\| p - e_n \| \| nabla T \| = O \( r^(- 1 + C alpha) \)$.
  Set $F = G \( s \) D$. Conjugating the defect equation and replacing $v p$ by $g \( s \) e_n$ and $q \| p \|^2$ by $G \( s \)$ yields
  #[#set math.equation(numbering: n => "(3.19)")
   $ \( - Delta + 2 - G \( s \) \) F = 2 G \( s \) \| T \( x' \, 0 \) \|^2 + cal(E) \, #h(2em) parallel cal(E) parallel_oo lt.eq C r^(- 3 \/ 2 + C alpha) . $ <eq:reach-ball-conjugation>]
  For completeness, each replacement in the drift or potential multiplies a coefficient of size $r^(- 1 \/ 2 + C alpha)$ by $D$ or $nabla D$ of size $r^(- 1 + C alpha)$. Replacing $\| T \( x' \, s \) \|^2$ by $\| T \( x' \, 0 \) \|^2$ has the same order, since $\| T \| = O \( r^(- 1 \/ 2 + C alpha) \)$, $partial_s T = O \( r^(- 1 + C alpha) \)$, and $\| s \| lt.eq P$. Logarithmic factors are absorbed by increasing the fixed multiplier of $alpha$.
  Solve the Dirichlet problem on $B_P$ by linearity. The solution with source $2 G \| T \( x' \, 0 \) \|^2$ and zero boundary is even in $s$ and nonnegative. The zero-boundary solution for $cal(E)$ has interior $C^1$ norm at most $C r^(- 3 \/ 2 + C alpha)$, since the potential $2 - G$ is at least one. The remaining homogeneous solution is $u_(+) + u_(-)$, both nonnegative, with boundary values $F$ on the upper and lower hemispheres, respectively, and zero on the other one. Their harmless equatorial boundary discontinuity is interpreted by bounded Dirichlet solutions; it does not affect interior estimates. Reflection and the maximum principle in the upper half-ball give $partial_s u_(-) \( 0 \) lt.eq 0$; local Harnack and derivative estimates give $\| partial_s u_(+) \( 0 \) \| lt.eq C u_(+) \( 0 \)$.
  At $x_(*) = \( 0 \, P \/ 2 \)$, positivity of the source solution implies
  $ u_(+) \( x_(*) \) lt.eq F \( x_(*) \) + C r^(- 3 \/ 2 + C alpha) lt.eq C \( 1 + P \) r^(- 1) G \( P \/ 2 \) + C r^(- 3 \/ 2 + C alpha) . $
  For the last inequality integrate $D lt.eq 2 \( 1 - partial_s U \)$ along $\[ 0 \, P \/ 2 + 1 \]$, use (3.18), and apply unit-scale Harnack to $D$ to pass from the integral to its value at $P \/ 2$. This use is valid for $alpha < 1$, so the interval lies in the range of (3.18).
  #emph[Suppressing the upper boundary contribution.] Only $u_(+)$ can contribute a positive leading normal derivative at the origin. Its value at $x_(*)$ is small by the inward comparison; we now transfer that gain to the origin with explicit Poisson bounds. Write $A_partial = integral_(partial B_P ∩ { s > 0 }) F thin thin upright(d) S$. Comparison with potentials one and two gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ u_(+) \( 0 \) lt.eq C P^C e^(- P) A_partial \, #h(2em) u_(+) \( x_(*) \) gt.eq c_zeta e^(- \( sqrt(2) + zeta \) sqrt(5) P \/ 2) A_partial quad \( zeta > 0 \) . $ <eq:reach-poisson>]
  For the first inequality, the Poisson density at the center for $- Delta + 1$ is constant on the sphere. The spherical average of $e^(x dot.op theta)$ shows that its size is at most $C P^C e^(- P)$. The solution for potential $2 - G gt.eq 1$ is smaller. For the second, the solution for potential $2 - G lt.eq 2$ is larger than that for $- Delta + 2$. Its Dirichlet Poisson density at any upper-hemisphere point $xi$ is at least $c_zeta e^(- \( sqrt(2) + zeta \) \| x_(*) - xi \|)$. Here are quantitative details of this last bound. Start the Dirichlet Green function a fixed distance from $x_(*)$, with a fixed positive lower bound obtained from a fixed-radius ball. Along the segment towards $xi$ insert a cylinder of fixed large cross-sectional radius, chosen so that $sqrt(2 + lambda_1) < sqrt(2) + zeta$. Its first transverse Dirichlet mode times the longitudinal hyperbolic-sine solution propagates the lower bound with that exponential rate. Stop a fixed distance before $xi$. Such a cylinder fits in $B_P$ except for fixed initial and final portions: $x_(*)$ is at distance $P \/ 2$ from the boundary and the incidence angle at $xi$ has a cosine bounded below uniformly. Harnack on those fixed portions and a tangent-ball barrier at $xi$ transfer the bound to the inward normal derivative. All constants depend on $zeta$ but not $P$. Finally $\| x_(*) - xi \| lt.eq sqrt(5) P \/ 2$, proving (3.20).
  Combining the two bounds with $G \( P \/ 2 \) lt.eq C e^(- sqrt(2) P \/ 2)$ gives
  $ u_(+) \( 0 \) lt.eq C P^C r^(- 1) e^(\[ \( sqrt(2) + zeta \) sqrt(5) \/ 2 - 1 - sqrt(2) \/ 2 \] P) + C P^C r^(- 3 \/ 2 + C alpha) e^(\[ \( sqrt(2) + zeta \) sqrt(5) \/ 2 - 1 \] P) . $
  Since $sqrt(10) \/ 2 - 1 - sqrt(2) \/ 2 < 0$, choose $zeta$ so the first exponent is negative, then choose $alpha > 0$ so the second term still has a power better than $r^(- 1)$. Polynomial factors in $P$ can be absorbed by slightly decreasing a resulting gain $gamma > 0$. The source solution has zero derivative at $0$, the lower-hemisphere solution has nonpositive derivative there, and the error solution is smaller still. Thus $F_s \( 0 \) lt.eq C r^(- 1 - gamma)$. Since $G \( 0 \) = 1$, $G' \( 0 \) = 0$, and $\| p \( 0 \) \|^2 = 1 - O \( r^(- 1) \)$, the zero-level identity for $H_N$ proves (3.17). ◻
]

===== 3.1.6 The weak reach inequality and transfer of positive charge <the-weak-reach-inequality-and-transfer-of-positive-charge>

We now combine the base estimates with the tangent-ball bound. At an active contact on the plateau of the penalty, the second point will be called the #emph[receiving foot]. The proposition distinguishes these contact types because only plateau contacts retain a mean-curvature term at that foot. It also specifies the direction and multiplicity of the area change needed when that positive term is integrated.

#thm([Proposition 3.7.])[
  (Weak reach inequality and positive-foot transfer).  #emph[Given $eta_0 > 0$, the penalty parameters can be chosen, in the order specified above, so that the following holds for all sufficiently large $d$. The function $d$ is locally semiconcave on $Sigma_(upright("reg"))$, and the singular part of its distributional surface Laplacian is nonpositive. Almost everywhere, 
#[#set math.equation(numbering: n => "(3.21)")
 $ \| nabla_Sigma d \| lt.eq C_Gamma exp { C_Gamma sqrt(log \( K \( d \) + 1 \)) } . $ <eq:C7>]

 At an active non-plateau or diagonal contact, 
#[#set math.equation(numbering: n => "(3.22)")
 $ Delta_Sigma d lt.eq \( 1 + eta_0 + C_Gamma d^(- gamma) \) a^2 d + B thin frac(\| nabla_Sigma d \|^2, d) \, #h(2em) B lt.eq 1 + C_Gamma d^(- gamma) . $ <eq:C8>]

 If $a d$ is sufficiently small, the same bound can be used with $B lt.eq eta_0 + C_Gamma a d + C_Gamma d^(- gamma)$, and then $\| nabla_Sigma d \| gt.eq c_Gamma > 0$. At an active plateau contact, meaning $s gt.eq 1 - delta_2$, one has 
#[#set math.equation(numbering: n => "(3.23)")
 $ Delta_Sigma d lt.eq G_1 #scale(x: 120%, y: 120%)[\(] \| H \( z \) \| + H_(N_y) \( y \)_(+) #scale(x: 120%, y: 120%)[\)] + eta_0 frac(\| nabla_Sigma d \|^2, d) \, #h(2em) N_y = - e . $ <eq:C9>]

 For any measurable choice of such contacts, the positive foot charge can be transferred to $y$ with multiplicity at most one and area factor 
#[#set math.equation(numbering: n => "(3.24)")
 $ J_(y arrow.r z) = frac(\| det \( upright("Id") + ell A_(N_y) \( y \) \) \|, s) lt.eq C_Gamma \, #h(2em) d \( y \) lt.eq d \( z \) = G_1 ell \, #h(2em) a \( y \) + D \( y \) lt.eq C_Gamma \/ d \( z \) . $ <eq:C10>]

 More precisely, $J_(y arrow.r z) lt.eq 1 + C delta_2 + C a \( y \) ell$ whenever $a \( y \) ell$ is bounded by a sufficiently small fixed constant. The constants and the large-reach threshold are fixed before any later defect threshold, collar scale, or exhaustion radius is chosen.]
] <prop:reach-calculus>

#proof[
  #emph[Semiconcavity, including diagonal competitors.] We first justify the weak interpretation, independently of the differentiations to follow. On a compact regular coordinate patch there are uniform bounds $0 < c lt.eq d lt.eq C$: local graph curvature gives the lower bound, and one fixed off-diagonal positive-angle competitor gives the upper bound after shrinking the patch. Relevant competitors of value at most $2 C$ have bounded length. Those of length at least $epsilon > 0$ have angle $s gt.eq epsilon \/ \( 2 C \)$, by $Gamma gt.eq 1 \/ s$. With the second foot fixed, these are smooth branches in the base variable, uniformly bounded in $C^2$; no regularity of the second foot is needed here.
  For shorter chords the second point is on the same regular local graph. In coordinates $X \( u \)$ write it as $X \( u + t omega \)$, with $\| omega \| = 1$ and $t$ small. Such chords use $Gamma = 1 \/ s$. The reciprocal branch is
  $ frac(\| nu \( u \) dot.op \[ X \( u + t omega \) - X \( u \) \] \|, \| X \( u + t omega \) - X \( u \) \|^2) . $
  Both numerator before absolute value and denominator vanish to second order in $t$, since $D X$ is tangent. Cancelling $t^2$ by the integral Taylor formula gives a $C^2$ function through $t = 0$, uniformly in the compact direction parameter. On relevant branches its absolute value is bounded below by $1 \/ \( 2 C \)$, so a smooth sign can be chosen and taking its reciprocal preserves the uniform $C^2$ bound. The diagonal limits are legitimate upper branches for $d$, since they are limits of competitors. Compactness of the remaining parameter sets shows that every minimizing sequence has either an off-diagonal or a diagonal realizing parameter and that $d$ is the infimum of a family with locally uniform upper Hessian bound. Subtracting the corresponding fixed quadratic function makes each branch concave and hence also their infimum concave. This proves local semiconcavity.
  At almost every point there is an Alexandrov second-order expansion. At such a point any smooth active upper branch has the same first derivative and an upper bound for the Hessian of $d$. Its trace therefore bounds the absolutely continuous Laplacian. The singular part is a nonpositive measure by semiconcavity, in coordinates and therefore for the surface Laplacian as well. It suffices to compute the following upper touching branches.
  The weak interpretation is now established. We next compute smooth upper touching branches, treating the unmodified penalty, diagonal limits, and the transition to the plateau in that order. The final step will transfer the positive plateau contribution to its receiving foot.
  #emph[A tangent phase ball at every second foot.] For an off-diagonal contact choose $N = plus.minus nu \( z \)$ so $N dot.op e = s > 0$. The open region
  $ { z + ell' e' : N dot.op e' > 0 \, med ell' Gamma \( N dot.op e' \) < d } $
  contains no zeros. After translation, rotation, and division by $d$, its boundary is a fixed smooth embedded compact radial surface. Near the origin it agrees with the sphere $\| x \|^2 = x_n$, because there $Gamma \( s \) = 1 \/ s$. On the remainder it is the smooth positive radial graph $1 \/ Gamma$. It has an inward rolling ball of a fixed positive radius $c_Gamma$: local $C^2$ graph bounds supply the balls near each point, and compactness and embeddedness allow a uniform decrease so those balls avoid the rest of the boundary. Hence at the second foot $y$ there is a zero-free tangent ball of radius $c_Gamma d$. Lemma 25 shows that the foot is regular, $a \( y \) + D \( y \) lt.eq C_Gamma \/ d$, and its inward trace satisfies $H_(N_y) \( y \) lt.eq C_Gamma d^(- 1 - gamma)$.
  #emph[Off-diagonal contacts with the unmodified penalty.] First suppose $s lt.eq 1 - delta_1$, so $Gamma = 1 \/ s$. Write $r = d \/ 2$, $b = e - s N$, and $M = upright("Id") + r A_N$. Then $ell = 2 r s$ and the inward normal at the second foot is $N_y = N - 2 s e$. Reflect an orthonormal frame $v_i$ of $T_z Sigma$ across $e^perp$ to obtain $v'_i = v_i - 2 \( e dot.op v_i \) e$ in $T_y Sigma$. Move $z$ and $y$ on the respective geodesics with these initial velocities. The resulting chord branches touch $d$ from above. First and second differentiation gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ nabla_Sigma r =  & - M b \/ s \,\
Delta_Sigma d lt.eq  & a^2 d + (2 - frac(2, 1 + r max_i \| lambda_i \|)) frac(\| nabla_Sigma d \|^2, d)\
 & + frac(H_(N_y) \( y \) - \( 1 - 2 s^2 \) H_N \( z \) - ell b dot.op nabla_Sigma H_N \( z \), s^2) . $ <eq:C11>]
  Here is the algebra, including the factor of the gradient term. Put $w = y - z$ and $w_i = v'_i - v_i = - 2 \( e dot.op v_i \) e$ and differentiate $\| w \|^2 \/ 2 - r N dot.op w$, which vanishes at contact and is nonnegative for a competitor. The summed second derivative bounds $\( Delta r \) s ell$ by
  $ & sum_i \| w_i \|^2 + \( w - r N \) dot.op \( - H_(N_y) N_y + H_N N \) - 2 r sum_i w_i dot.op A_N v_i\
 & #h(8mm)  - r w dot.op \( nabla H_N - a^2 N \) - 2 sum_i r_i #scale(x: 120%, y: 120%)[\(] w_i dot.op N + w dot.op A_N v_i #scale(x: 120%, y: 120%)[\)] . $
  Use $w - r N = - r N_y$ and the first derivative identity. The algebraic terms besides $a^2$ and the traces reduce to $4 s^2 \| nabla r \|^2 + 4 s b dot.op nabla r$. By (3.3), $0 lt.eq M lt.eq \( 1 + r max_i \| lambda_i \| \) upright("Id")$, so
  $ b dot.op nabla r = - b dot.op M b \/ s lt.eq - frac(s \| nabla r \|^2, 1 + r max_i \| lambda_i \|) . $
  Dividing the preceding second derivative expression by $r s^2$ therefore gives exactly (3.25). The identity $Delta_Sigma N = nabla_Sigma H_N - a^2 N$ fixes all trace signs.
  We bound its last quotient uniformly, including almost tangential contacts. Choose a small fixed $gamma' > 0$ compared with the gains in Lemmas 24 and 25. If $s gt.eq d^(- gamma')$, the second-foot upper trace, the base bounds $\| H \| lt.eq C h^(- 2)$ and $\| nabla H \| lt.eq C h^(- 3 - gamma)$, and $h = d^(1 - o \( 1 \))$ bound that quotient above by $C_Gamma d^(- 1 - gamma'')$ for some fixed $gamma'' > 0$. If $s < d^(- gamma')$, then $ell = d s$ lies inside the isolated graph. The two normal orientations agree by continuation there. In its tangent-plane coordinates the displacement is exactly $ell b$; Taylor’s formula gives
  $ H_(N_y) \( y \) - H_N \( z \) - ell b dot.op nabla H_N \( z \) = O \( ell^2 h^(- 3 - gamma) \) . $
  The coordinate Hessian obeys this bound as well, since its connection correction multiplies the already controlled gradient. Dividing by $s^2$ and adding $2 H_N \( z \)$ proves the same upper error after possibly decreasing $gamma''$.
  The coefficient in parentheses in (3.25) is at most one, because $r max \| lambda_i \| lt.eq 1$. It is $O \( a d \)$ if $a d$ is small. Also $\| b \| gt.eq sqrt(1 - \( 1 - delta_1 \)^2) > 0$. If $a d$ is sufficiently small then the first derivative identity gives $\| nabla d \| gt.eq c_Gamma$. Otherwise $a^2 d gt.eq c_Gamma \/ d$. In either case the error $C d^(- 1 - gamma'')$ can be absorbed into $C d^(- gamma'') \( a^2 d + \| nabla d \|^2 \/ d \)$. This proves (3.22) in the present range.
  For the gradient bound, if $ell gt.eq c h$, then $1 \/ s = d \/ ell lt.eq C d \/ h$ and $parallel M parallel lt.eq 2$, giving $\| nabla d \| lt.eq C d \/ h$. For $ell < c h$ both points lie on the isolated graph. Expanding its normal and projecting tangentially at the base yields
  $ - 2 s b = ell A_N b + O \( ell^2 \/ h^2 \) \, $
  using $\| nabla A \| lt.eq C h^(- 2)$ and $\| A \| lt.eq C h^(- 1)$. Thus $\| M b \| lt.eq C s d^2 \/ h^2$, and $\| nabla d \| lt.eq C d^2 \/ h^2$. Both estimates imply (3.21).
  #emph[Diagonal contacts.] At a diagonal contact the curvature itself is the active constraint. Choose $N$ so $S = - A_N$ has top positive eigenvalue $lambda = 2 \/ d$, and let $v_1$ be an active top eigenvector. Every eigenvalue $lambda_j$ of $S$ is between $- lambda$ and $lambda$. For a unit vector $v$ in the top eigenspace $V$, expansion along the geodesic with signed length $L$ gives
  $ frac(2 N dot.op \( y - z \), \| y - z \|^2) = lambda + 1 / 3 nabla_v S \( v \, v \) L + O \( L^2 \) . $
  This reciprocal cannot exceed $2 \/ d = lambda$ for either sign of $L$, so $nabla_v S \( v \, v \) = 0$. Codazzi makes $nabla S$ totally symmetric, and polarization implies that it vanishes on triples in $V$.
  Touch $d$ from above by $2 \/ S \( v_1 \, v_1 \)$ using a unit field extension. At the point choose its derivatives, in a principal frame, to be
  $ chevron.l nabla_i v_1 \, v_j chevron.r = frac(nabla_i S_(1 j), lambda - lambda_j) quad \( lambda_j < lambda \) \, #h(2em) chevron.l nabla_i v_1 \, v_j chevron.r = 0 quad \( v_j in V \) . $
  A smooth local unit extension with these specified first derivatives exists; its second derivatives are unconstrained apart from the unit length condition, and their tangential components drop out of the Laplacian of $S \( v_1 \, v_1 \)$ at a top eigenvector. Thus that Laplacian is
  $ \( Delta S \)_11 + 2 sum_(lambda_j < lambda) frac(\| nabla S_(1 j) \|^2, lambda - lambda_j) . $
  The Euclidean hypersurface identity
  #[#set math.equation(numbering: n => "(3.26)")
   $ Delta S = nabla^2 "tr" S + \( "tr" S \) S^2 - a^2 S $ <eq:reach-simons>]
  follows by commuting the two derivatives in Codazzi and applying the Gauss equation. This is the Simons curvature calculation #cite(label("Simons1968")) #cite(label("SchoenSimonYau1975")), with the mean-curvature terms retained because the sheet need not be minimal. More explicitly the Ricci contraction is $\( \( "tr" S \) S - S^2 \)_(i p) S_(p j)$ and the remaining curvature contraction is $S_(i j)^3 - a^2 S_(i j)$, giving the stated identity. Also $lambda - lambda_j lt.eq 2 lambda$, and Codazzi gives $nabla_j S_11 = nabla_1 S_(j 1)$, which is zero for $v_j in V$. Consequently the denominator $f = S \( v_1 \, v_1 \)$ satisfies
  $ Delta f gt.eq - a^2 lambda - C \( \| nabla^2 H \| + a^2 \| H \| \) + \| nabla f \|^2 \/ lambda . $
  Differentiating $2 \/ f$ now gives
  $ Delta d lt.eq a^2 d + frac(\| nabla d \|^2, d) + C d^2 \( \| nabla^2 H \| + a^2 \| H \| \) . $
  The last term is $C d^(- gamma) \( a^2 d \)$ by Lemma 24, $h = d^(1 - o \( 1 \))$, and $a^2 d gt.eq 4 \/ d$. This proves (3.22). A diagonal contact always has $a d gt.eq 2$, so the small-$a d$ assertion makes no claim here. Finally $\| nabla d \| lt.eq C d^2 \| nabla A \| lt.eq C d^2 \/ h^2$ proves (3.21) for these contacts too.
  #emph[The angular transition and the plateau.] The unmodified and diagonal cases satisfy the claimed inequality. It remains to handle $s gt.eq 1 - delta_1$, where the penalty changes the variation at the second foot. Set
  $ b = e - s N \, #h(2em) c_1 = Gamma - s Gamma' \, #h(2em) Z = c_1 e + Gamma' N . $
  First variation in the second foot shows that its inward normal is $N_y = - Z \/ \| Z \|$. Rotate the tangent frame at $z$ by the small plane rotation taking $N$ to $Z \/ \| Z \|$, to obtain $v'_i$ at $y$. With $w_i = v'_i - v_i$, elementary plane-rotation formulas give
  $ w_i = O \( \| b \| \) N + O \( \| b \|^2 \) \, #h(2em) P_(e^perp) w_i = O \( \| b \|^2 \) \, #h(2em) \( N - s e \) dot.op w_i = O \( \| b \|^3 \) . $
  The constants are uniform for the fixed penalty; in fact $\| Z \| = 1 + O \( delta_1 \)$ and the rotation is uniformly small. At $b = 0$ use the identity rotation. Differentiation of $ell Gamma \( s \)$ gives the first derivative and the following upper trace:
  #[#set math.equation(numbering: n => "(3.27)")
   $ nabla d =  & \( - c_1 upright("Id") + ell Gamma' A_N \) b \,\
Delta d lt.eq  & \| Z \| H_(N_y) + H_N Z dot.op N + ell Gamma' b dot.op nabla H_N - ell Gamma' s a^2\
 & + sum_i {c_1 / ell \| P_(e^perp) w_i \|^2 + 2 Gamma' w_i dot.op A_N v_i + ell Gamma'' [b dot.op A_N v_i + frac(\( N - s e \) dot.op w_i, ell)]^2} . $ <eq:reach-transition-calculus>]
  This can also be derived directly from $thin upright(d) ell = e dot.op thin upright(d) w$ and $thin upright(d) s = thin upright(d) N dot.op e + \( N - s e \) dot.op thin upright(d) w \/ ell$: the Hessian in $w$ contributes the first term in braces, the two mixed normal derivatives the second, the second derivative of $Gamma$ the square, and $Delta N = nabla H_N - a^2 N$ gives the two normal-variation terms on the first line of the trace. The accelerations of the two geodesic frames give the two trace terms.
  Since $Gamma'' \| b \|^2 lt.eq C epsilon_1$, the algebraic terms, including $- ell Gamma' s a^2$, are at most
  $ \( 1 + C \( epsilon_1 + delta_1 \) \) a^2 d + C a \| b \|^2 + C \| b \|^4 \/ d . $
  For clarity the leading coefficient is bounded by one up to $O \( delta_1 \)$ because $- s Gamma' \/ Gamma lt.eq 1 + C delta_1$; the $Gamma''$ square contributes $C epsilon_1 a^2 d$ and $C epsilon_1 \| b \|^4 \/ d$, and the rotation gives the remaining two terms. Young’s inequality bounds $C a \| b \|^2$ by any fixed small multiple of $a^2 d$ plus a fixed multiple of $\| b \|^4 \/ d$. If $a d$ is small, the first derivative formula bounds $\| nabla d \|$ below by a fixed multiple of $\| b \|$. If it is not small, $\| b \|^4 \/ d$ is at most $C delta_1^2 a^2 d$. Choosing $epsilon_1$ and then $delta_1$ small enough for the prescribed tolerance therefore bounds all these terms by $\( 1 + eta_0 \) a^2 d + eta_0 \| nabla d \|^2 \/ d$, with room to decrease the initial tolerance for the subsequent errors. In the transition interval before the plateau, $\| b \|$ has a fixed positive lower bound depending on $delta_2$. The trace terms in (3.27) are $O \( d^(- 1 - gamma) \)$ from above by the base and second-foot estimates. They are absorbed exactly as in (3.25), proving (3.22), including its small-$a d$ statement. The gradient formula, $ell lt.eq d$, and $d a lt.eq 2 sqrt(m)$ give a fixed bound in this range, hence (3.21).
  On the plateau $Gamma' = Gamma'' = 0$, so $nabla d = - G_1 b$, $Z = G_1 e$, $N_y = - e$. The only algebraic remainder is $C \| b \|^4 \/ d$, bounded by $C delta_2 \| nabla d \|^2 \/ d$. The traces are $G_1 H_(N_y) + G_1 s H_N lt.eq G_1 \( H_(N_y \, +) + \| H_N \| \)$. Decreasing $delta_2$ if necessary proves (3.23). At the endpoints of the ranges the jets match, since the constructed penalty is smooth; either computation thus has the same limiting validity.
  The differential inequalities have now been proved for every active contact type. It remains to justify their integrated use: a positive plateau contribution at a receiving foot must be counted with its inverse area factor, and without an additional multiplicity.
  #emph[The inverse Jacobian and positive receiving multiplicity.] We prove the transfer statement in the direction from receiving feet to bases; this direction determines the Jacobian below. For a plateau pair, $z = y + ell N_y$ and $\| N_y dot.op nu \( z \) \| = s gt.eq 1 - delta_2$. Fix a local regular sheet through $z$. The equation that $y + t N_y$ lies on this sheet has nonzero $t$ derivative, so the implicit function theorem supplies a smooth inverse parametrization $z \( y \) = y + ell \( y \) N_y$ near this pair. Projecting its derivative onto $T_y Sigma$ removes $\( thin upright(d) ell \) N_y$ and leaves $upright("Id") + ell A_(N_y)$. Orthogonal projection from $T_z Sigma$ to $T_y Sigma$ has area factor $s$. It follows that the area Jacobian of the inverse map is exactly the quotient in (3.24). The second-foot bound $a \( y \) lt.eq C_Gamma \/ d \( z \)$ therefore bounds this quotient uniformly. Expanding the determinant when $a \( y \) ell$ is small gives the more precise estimate stated. The reverse chord is normal at $y$, so it is a competitor of value $G_1 ell$ there and proves $d \( y \) lt.eq d \( z \)$.
  At a foot with $H_(N_y) > 0$ the orientation $N_y$ is unique. All bases sending positive charge to this foot must lie on its same normal ray. Suppose two existed, at lengths $0 < ell_1 < ell_2$. For the farther base $z_2$, the nearer base $z_1$ is a competing zero with chord direction exactly equal to the direction towards $y$ and length $ell_2 - ell_1$. It has the same angle penalty and strictly smaller objective than the alleged active chord to $y$, a contradiction. Thus every positively charged foot has at most one inverse base.
  There is no hidden diffeomorphism assumption here. Cover the regular pair relation by countably many of the preceding inverse charts. Active parameters on compact coordinate pieces form a closed compact-valued relation; a measurable selection can be obtained there and pieced together over a countable exhaustion. Restrict the selected pairs to disjoint measurable pieces in those charts. The area formula on each inverse chart gives exactly its Jacobian; its critical image has zero surface measure. Summing the formula over the selected pieces adds no multiplicity for positive charges by the ray argument. In explicit terms, for a nonnegative measurable integrand $F \( z \, y \)$ supported on positively charged selected pairs,
  $ integral F \( z \, y \( z \) \) thin thin upright(d) S_z = integral F \( z \( y \) \, y \) J_(y arrow.r z) thin thin upright(d) S_y \, $
  where the right-hand integral is over the selected positive feet, with null critical images omitted on the left. This proves the claimed transfer for arbitrary nonnegative weights, not only constant ones, and completes the proposition. ◻
]

===== 3.1.7 Defect and reach near bad zeros <defect-and-reach-near-bad-zeros>

We finish with the collar estimate used when geometric tests are joined to ambient tests. Its source-reach bound also applies when the second contact, rather than the base, lies close to a bad zero.

For the next statement, a #emph[good zero] relative to a set $X subset Sigma$ means a point of $Sigma_(upright("reg")) \\ X$.

#thm([Corollary 3.8.])[
  (Reach bounds near bad zeros).  #emph[For sufficiently large $d \( z \)$, $D \( z \) + a \( z \) lt.eq C_Gamma \/ d \( z \)$. If $X = { z in Sigma : D \( z \) gt.eq delta }$ with fixed $delta > 0$, then for every fixed $L_0$ there is a finite uniform upper bound for $d \( z \)$ at all good zeros with $"dist" \( z \, X \) lt.eq 10 L_0$. The same conclusion holds for a contact reach $d \( z \)$ when its second foot $y$ satisfies $"dist" \( y \, X \) lt.eq 10 L_0$.]
] <cor:reach-base-defect>

#proof[
  Use the tangent balls of Lemma 20 and Lemma 25. The proof of Proposition 26 supplies the corresponding tangent balls at second feet, with radius measured by the source reach $d \( z \)$. Exponential comparison in (2.10) bounds $D$ below by a positive constant depending only on $delta \, L_0$ within distance $10 L_0$ of $X$. Combining it with the appropriate upper bound $C_Gamma \/ d \( z \)$ gives the asserted reach bound. If $X$ is empty the collar assertion has no points to consider. ◻
]

==== 3.2 Interface stability and exact interactions <sec:interface>

We retain the notation and hypotheses of Section 1. Thus $n = 7$, $m = 6$, and the penalty $Gamma$, including its constant value $G_1$ near $1$, is fixed. None of the estimates in this section assumes an energy density bound. The elementary local estimates below also hold in every fixed ambient dimension.

Our objective is to turn ambient stability into estimates on the zero surface and to identify the strength of the interaction between nearby zero sheets. Recall that $D = 1 - \| nabla U \|^2$ is a diffuse scalar field, whereas $a^2 = \| A \|^2$ and $H = "tr" A$ are, respectively, the squared norm and signed trace of the second fundamental form of a regular zero sheet. These quantities have different roles: the estimates below compare them, but do not identify them or assume that $H$ vanishes.

The argument has three parts. A finite normal average of $q^3 D$ controls curvature and mean curvature, and supplies an additional favorable term in surface stability. A comparison on both sides of a sheet then relates $D$ to curvature and the exponential of its penalized reach. Finally, on logarithmic windows with uniformly small defect, we determine the sharp constants in the interaction and phase-tail estimates. These are the surface inputs for the growth and radial arguments in Sections 3 and 1. The passage from stable diffuse solutions to interacting transition layers is central to the local theory of #cite(label("WangWei2019"), form: "prose"). Here we prove the surface test and exact interaction estimates needed in the quartic normalization.

===== 3.2.1 Normal averages, curvature, and mean curvature <normal-averages-curvature-and-mean-curvature>

Recall the normal average defined in (2.27): at a regular zero and for $P > 0$,

$ I_P \( z \) = 1 / sigma integral_(- P)^P q \( z + s nu \( z \) \)^3 D \( z + s nu \( z \) \) thin thin upright(d) s \, #h(2em) sigma = frac(4 sqrt(2), 3) . $

Once $P$ has been fixed we write $I = I_P$. The normalization uses $sigma = integral_(bb(R)) G^2 thin thin upright(d) s$, rather than the energy of one transition, $s_0 = sigma \/ 2$. In particular, $I_P$ is a normal average based at $z$, not the pointwise defect $D \( z \)$.

#thm([Lemma 3.9.])[
  (Sharp means).  #emph[For each $epsilon > 0$ there exist $P_epsilon < oo$ and, for each fixed $P gt.eq P_epsilon$, a number $delta_(epsilon \, P) > 0$ such that every zero with $0 < D \( z \) < delta_(epsilon \, P)$ is regular and satisfies 
#[#set math.equation(numbering: n => "(3.28)")
 $ c D \( z \) lt.eq I_P \( z \) lt.eq C_P D \( z \) \, #h(2em) I_P \( z \) gt.eq \( 1 - epsilon \) \| A \( z \) \|^2 \, #h(2em) \| H \( z \) \| lt.eq (frac(1, 2 sqrt(2)) + epsilon) I_P \( z \) . $ <eq:L1>]

 The constants and thresholds are independent of the solution and center. The constant $c > 0$ can be chosen independently of $P gt.eq 1$.]
] <lem:interface-sharp-means>

#proof[
  It suffices to treat $0 < epsilon < 1$, since decreasing $epsilon$ strengthens the conclusions. The two-sided comparison with $D$ follows from the local Harnack bound in (2.10), the positive lower bound for $q$ in a fixed small neighborhood of a zero, and its upper bound on a fixed segment. The mean-curvature estimate is the finite-window conclusion of Lemma 13. To prove the additional curvature estimate, and to identify the common limiting quantities, consider the normalized limits of Lemma 10, with $z = 0$, $nu \( z \) = e_n$, and normalization by $D \( 0 \)$ for $D$ and by $sqrt(D \( 0 \))$ for $T$. Write these limits as $cal(D) \, cal(T)$. Then $cal(D) \( 0 \) = 1$, $cal(T)$ is a horizontal harmonic tensor independent of $s = x_n$, and
  $ F \( x' \, s \) = G \( s \) cal(D) \( x' \, s \) \, #h(2em) \( - Delta + 2 - G \) F = 2 G \( s \) \| cal(T) \( x' \) \|^2 . $
  We use the nonnegative source part of Lemma 11 to compare this mass with curvature. The function $\| cal(T) \|^2$ is horizontally subharmonic. In a product cylinder $B_R^m times \( - R \, R \)$ the positive Dirichlet Green kernel, evaluated at $\( 0 \, s \)$, is radial in the horizontal source variable. Horizontal spherical averaging therefore shows that its integral against $2 G \| cal(T) \|^2$ is at least its integral against $2 G \| cal(T) \( 0 \) \|^2$. The zero-boundary source solution is bounded above by $F$. As $R arrow.r oo$, the latter constant-horizontal source solutions increase to $\| cal(T) \( 0 \) \|^2 f \( s \)$, where
  $ \( - partial_s^2 + 2 - G \) f = 2 G \, #h(2em) f gt.eq 0 \, $
  with $f$ bounded. To justify this identification, comparison with the constant $2$ bounds the exhaustions; every bounded entire solution with this source is unique, since the potential is at least $1$, and horizontal translations then force independence of $x'$. The uniqueness follows by comparison on balls with the growing exponential barriers for $- Delta + 1$. Since $\( - partial_s^2 + 2 - G \) G = 2 G^2$, integration against $G$ gives
  $ 1 / sigma integral_(bb(R)) G \( s \)^2 F \( 0 \, s \) thin thin upright(d) s gt.eq \| cal(T) \( 0 \) \|^2 . $
  All integrations are legitimate by boundedness of $f$ and exponential decay of $G$; one may first insert compact cutoffs.
  These limiting inequalities imply their stated finite-window versions. Here is the uniformity argument for the curvature assertion, where an additive limiting error would be insufficient. If no fixed interval and threshold worked, choose $P_j arrow.r oo$, $D \( z_j \) arrow.r 0$, and $I_(P_j) < \( 1 - epsilon \) a \( z_j \)^2$. The lower local mass bound gives $a \( z_j \)^2 \/ D \( z_j \) gt.eq c \/ \( 1 - epsilon \) > 0$. Subsequence convergence on every fixed interval would contradict the preceding limiting inequality. Here $a^2 \/ D$ converges to $\| cal(T) \( 0 \) \|^2$. Choose the interval large enough also for Lemma 13 with coefficient $1 \/ \( 2 sqrt(2) \) + epsilon$, and then take the smaller of the two defect thresholds. Its nonnegative integrand preserves that mean-curvature bound on every larger fixed interval. This proves all assertions with the stated order of choices. ◻
]

The next estimate concerns tangential variation of $H$. Its small coefficient is obtained by averaging on a sufficiently large, but fixed, surface disk. It will allow the mean-curvature derivative in the curvature equation to be absorbed in Section 3.

#thm([Lemma 3.10.])[
  (Averaged mean derivative).  #emph[For every $epsilon > 0$ there are $S gt.eq 10$ and $delta > 0$ such that, if $z in Sigma$ and $D \( z \) < delta$, all zeros in $B_(4 S) \( z \)$ belong to one regular graph converging smoothly to the tangent plane as the threshold decreases, and 
#[#set math.equation(numbering: n => "(3.29)")
 $ \| nabla_Sigma H \( z \) \|^2 lt.eq epsilon / S^m integral_(B_S \( z \) ∩ Sigma_(upright("reg"))) D^2 thin thin upright(d) S . $ <eq:L2>]

]
] <lem:interface-mean-gradient>

#proof[
  Smooth single-profile convergence on every fixed ball follows from (2.10). In the normalized limit used above, $nabla_Sigma H \/ D \( z \)$ converges to $nabla_(x') F_s \( 0 \) \/ 2$. The even source part of $F$ contributes zero to this derivative. For a positive homogeneous extremal $F = e^(b dot.op x') f \( s \/ sqrt(2) \)$, the explicit profiles in Lemma 11 give
  $ \| nabla_(x') F_s \( 0 \) \| lt.eq C \| b \| F \( 0 \) \, #h(2em) \| b \| lt.eq sqrt(3 \/ 2) . $
  The average of $e^(b dot.op x')$ on $B_(S \/ 2)^m$ is at least $1$, and tends to infinity uniformly when $\| b \|$ is bounded below by any positive number. First restricting to $\| b \| < eta$, then taking $S$ large on its complement, proves, with any prescribed $zeta > 0$,
  $ 1 / 2 \| nabla_(x') F_s \( 0 \) \| lt.eq zeta integral.slash_(B_(S \/ 2)^m) F \( x' \, 0 \) thin thin upright(d) x' . $
  The same inequality holds for positive mixtures by the triangle inequality; the nonnegative even source can only enlarge its right side. Choose $zeta$ in terms of $epsilon$ and apply Cauchy–Schwarz. Since $F \( x' \, 0 \) = cal(D) \( x' \, 0 \)$, this proves the limiting version of (3.29). Smooth normalized convergence and the uniformly positive local mass of $cal(D)^2$ allow a fixed strict relaxation. The graph area elements converge to $thin upright(d) x'$, and the disk $B_(S \/ 2)^m$ lies in the surface ball used on the right. A contradiction sequence now gives a uniform positive threshold $delta$. ◻
]

===== 3.2.2 From ambient tests to surface stability <from-ambient-tests-to-surface-stability>

The preceding estimates concern one zero and a fixed normal interval. We now use them simultaneously along a surface test. Normal segments from different bases may overlap, so the ambient test must account for all their inverse branches. Taking the square root of the sum of their squares preserves the potential term exactly and produces a useful nonnegative difference of gradient energies.

#thm([Lemma 3.11.])[
  (Pushing a lifted test to space).  #emph[Let $Omega subset Sigma_(upright("reg"))$ be open and $Phi \( z \, s \) = z + s nu \( z \)$. Fix $0 < alpha < 1 \/ 4$ and an even smooth function $beta \( z \, s \) = beta_0 \( s a \( z \) \)$, equal to $1$ for $\| s \| a lt.eq alpha \/ 2$ and supported in $\| s \| a < alpha$. For a compactly supported Lipschitz amplitude on the lifted tube, write $xi_j$ for its local inverse branches and put $xi = \( sum_j xi_j^2 \)^(1 \/ 2)$. Then $xi$ is an admissible physical test. Its quadratic form is the lifted form minus $integral cal(V) thin thin upright(d) x$, where the nonnegative variance density is 
$ cal(V) = min_(b in bb(R)^n) sum_j \| nabla xi_j - xi_j b \|^2 . $

 For the lifted amplitude $G \( s \) beta \( z \, s \) psi \( z \)$, the lifted form is 
#[#set math.equation(numbering: n => "(3.30)")
 $ integral_(Omega times bb(R)) {G^2 J \| nabla \( beta psi \) \|^2 + beta^2 psi^2 [- J_s G G' + 3 #scale(x: 120%, y: 120%)[\(] v \( Phi \)^2 - g \( s \)^2 #scale(x: 120%, y: 120%)[\)] G^2 J]} thin thin upright(d) S thin thin upright(d) s \, #h(2em) J = det \( upright("Id") + s A \) . $ <eq:L4>]

 Here the gradient and volume use the pullback Euclidean metric. Formula (3.30) also holds when $psi$ includes a bounded Lipschitz factor depending on $x = Phi \( z \, s \)$, initially with compact support and a finite normal cap.]
] <lem:interface-immersed-test>

#proof[
  On $\| s \| a < alpha$, $Phi$ is a local diffeomorphism and $J > 0$. A fiber restricted to the compact lifted support is discrete and compact, hence finite. A sufficiently small physical neighborhood has only these nonzero inverse branches: otherwise a sequence of additional branches has a limit in the same compact support and contradicts local invertibility. Consequently the squared sum is locally a finite sum. Its square root is Lipschitz, including at its zero set, and almost everywhere
  $ sum_j \| nabla xi_j \|^2 - \| nabla xi \|^2 = sum_j \| nabla xi_j \|^2 - frac(\| sum_j xi_j nabla xi_j \|^2, sum_j xi_j^2) = cal(V) gt.eq 0 . $
  At points where all terms vanish, their gradients vanish almost everywhere, so the same equality holds with value zero. The potential terms add exactly, irrespective of their sign. The area formula for $Phi$ thus proves the assertion without an injective global tube.
  For any lifted amplitude $G f$, expand its normal derivative and integrate the cross term $2 G G' f f_s J$ by parts. Using $G'' = \( 3 g^2 - 1 \) G$ gives precisely (3.30), with $f = beta psi$. There are no artificial chart boundaries in this computation: the amplitude is globally defined on the lifted surface, while local inverse charts are used only to justify its pushdown. Finite even normal caps may be removed whenever the displayed terms are dominated by a polynomial in $\| s \|$ times $G^2$; this is the case in the applications below. At $a = 0$ take $beta = 1$ and use the same capped limit. ◻
]

Physical stability and the variance identity show that the lifted quadratic form is nonnegative. We may discard the subtracted variance for the next estimate; Section 3 will retain it in a more general gluing construction. The next proposition combines two negative terms in the lifted quadratic form. The normal Jacobian supplies $a^2 \/ 2$, while the profile deficit supplies $I_P \/ 2$. Keeping both terms will allow separate control of curvature and of interaction in the later estimates.

#thm([Proposition 3.12.])[
  (Strengthened surface stability).  #emph[For each $epsilon > 0$, choose $P$ sufficiently large as in Lemma 28. There exists $delta > 0$ such that every compactly supported Lipschitz function on ${ z in Sigma : D \( z \) < delta }$ satisfies 
#[#set math.equation(numbering: n => "(3.31)")
 $ \( 1 - epsilon \) integral_Sigma frac(a^2 + I_P, 2) psi^2 thin thin upright(d) S lt.eq integral_Sigma \| nabla_Sigma psi \|^2 thin thin upright(d) S . $ <eq:L3>]

 In the lifted computation the gradient coefficient can be made arbitrarily close to $sigma$, and the negative coefficient arbitrarily close to $sigma \( a^2 + I_P \) \/ 2$, with the same choices.]
] <prop:interface-strengthened-stability>

#proof[
  Use Lemma 30. On the support of $beta$ the pullback tangential metric differs from the surface metric by $O \( alpha \)$. Uniform derivative estimates give $\| nabla beta \| lt.eq C_alpha \( 1 + \| s \| \)$; derivatives of $a = \| A \|$ are understood weakly at its zero set. All terms containing a derivative of $beta$ are bounded, after a Young inequality with any fixed small parameter, by $C_alpha e^(- c_alpha \/ a) psi^2$. Thus the gradient part is at most
  $ \( 1 + C alpha + eta \) sigma \| nabla_Sigma psi \|^2 + C_(alpha \, eta) e^(- c_alpha \/ a) psi^2 . $
  The exponential remainder is $o \( D \)$ uniformly as $D arrow.r 0$, since $a^2 lt.eq C D$.
  The elementary-symmetric expansion of $J$ and evenness give
  $ - integral beta^2 J_s G G' thin thin upright(d) s = sigma / 2 \( H^2 - a^2 \) + o \( D \) . $
  Indeed the constant term $H$ in $J_s$ integrates to zero, the linear term is $\( H^2 - a^2 \) s$, and $- integral s G G' = sigma \/ 2$. Terms of order at least two in $s A$ are either odd under the integral or bounded by $C a^3 = o \( D \)$. The cap errors have the preceding exponential bound, and $H^2 = o \( D \)$.
  The potential contribution is nonpositive everywhere: $U \( z \) = 0$ and $\| nabla U \| lt.eq 1$ imply $\| U \( z + s nu \) \| lt.eq \| s \|$ and hence $v \( z + s nu \)^2 lt.eq g \( s \)^2$. We quantify its gain. On the two normal rays define $U_plus.minus \( r \) = plus.minus U \( z plus.minus r nu \)$ for $r gt.eq 0$. Then
  $ r - U_plus.minus \( r \) gt.eq 1 / 2 integral_0^r D \( z plus.minus t nu \) thin thin upright(d) t . $
  Indeed $U'_plus.minus \( r \) = p \( z plus.minus r nu \) dot.op nu lt.eq sqrt(1 - D \( z plus.minus r nu \)) lt.eq 1 - D \( z plus.minus r nu \) \/ 2$. This writes the same deficit inequality on both sides without changing its sign convention. Moreover, on every fixed segment,
  #[#set math.equation(numbering: n => "(3.32)")
   $ \| p \( z + s nu \) - nu \| + \| U \( z + s nu \) - s \| lt.eq C_P D \( z \) \, #h(2em) \| s \| lt.eq P . $ <eq:interface-normal-accuracy>]
  To prove it, initially $\| p \( z \) - nu \| lt.eq C D \( z \)$, and along the segment
  $ \| T nu \| lt.eq \| T p \| + \| T \| \| p - nu \| lt.eq C_P D \( z \) + C_P sqrt(D \( z \)) \| p - nu \| . $
  A Gronwall estimate gives (3.32). Here $T p = - nabla D \/ 2$ and (2.10) were used.
  For a fixed segment $\[ - Q \, Q \]$, (3.32) gives $p dot.op nu > 0$ once the threshold is small enough. Thus $U \( s \)$ has the sign of $s$ on both half-segments. After division by $D \( z \)$ and passage to a normalized limit, the potential gain $3 \( g^2 - v^2 \) G^2$ is at least
  $ - 1 / 2 \( G^3 \)' \( s \) integral_0^s cal(D) \( 0 \, t \) thin thin upright(d) t . $
  This expression is nonnegative on both half-lines. Integrating and using Tonelli, its total mass is $1 / 2 integral_(bb(R)) G^3 cal(D) thin thin upright(d) s$. To make the finite-window order explicit, first fix $P$ and put $h_P \( s \) = integral_0^s upright(bold(1))_({ \| t \| lt.eq P }) cal(D) \( 0 \, t \) thin thin upright(d) t$. For $Q gt.eq P$, integration by parts gives exactly
  $ - 1 / 2 integral_(- Q)^Q \( G^3 \)' h_P thin thin upright(d) s = 1 / 2 integral_(- P)^P G^3 cal(D) thin thin upright(d) s - frac(G \( Q \)^3, 2) integral_(- P)^P cal(D) thin thin upright(d) s . $
  Local Harnack bounds the last integral by $C_P$, uniformly for normalized limits. Choose $Q$ large after $P$ so the loss is as small as prescribed, then decrease the defect threshold to use compactness on $\[ - Q \, Q \]$. This threshold also ensures $beta = 1$ on that segment. Since $I_P \/ D gt.eq c$, for any $eta > 0$ this gives
  $ integral 3 \( g^2 - v \( Phi \)^2 \) G^2 beta^2 J thin thin upright(d) s gt.eq \( 1 - eta \) sigma / 2 I_P $
  when the defect threshold is sufficiently small. Fix $eta$, then $alpha$ and the threshold, in that order, to absorb the $o \( D \)$ terms using $I_P gt.eq c D$. Physical stability and the upper bound by the lifted form now prove (3.31). All normal intervals used here are fixed before the final defect threshold: choose $P$, then the larger extraction interval $Q$, and then decrease the threshold. No later surface collar or surface-test amplitude enters those choices. ◻
]

===== 3.2.3 Comparison at the exact exponential rate <comparison-at-the-exact-exponential-rate>

For $0 < delta lt.eq 1 \/ 4$ set

$ X = { z in Sigma : D \( z \) gt.eq delta } \, #h(2em) macron(a) \( z \) = cases(delim: "{", 1 \, & z in X \,, a \( z \) \, & z in.not X \,) #h(2em) kappa = sqrt(2) / G_1 \, #h(2em) E \( z \) = e^(- kappa d \( z \)) . $

The zero set is closed, and $X$ includes every singular zero. Here $E$ records the interaction scale associated with reach. To compare it with $D$, we must also retain curvature away from the base: a local curvature value alone does not control the two-sided comparison problem. The exponentially weighted supremum $J_0$ in the next proposition records that curvature, with value $1$ assigned to the excluded set $X$.

#thm([Proposition 3.13.])[
  (Exact exponential comparison).  #emph[There exist $lambda > 0$ and $C < oo$, depending on the fixed penalty and dimension but independent of $delta in \( 0 \, 1 \/ 4 \]$, such that 
#[#set math.equation(numbering: n => "(3.33)")
 $ D \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(] J_0 \( z \) + E \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) E \( z \) lt.eq C #scale(x: 120%, y: 120%)[\(] J_0 \( z \) + D \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) z in Sigma \\ X \, quad J_0 \( z \) = sup_(y in Sigma) e^(- lambda \| y - z \|) macron(a) \( y \)^2 . $ <eq:L5>]

]
] <prop:interface-exact-comparison>

We prove the proposition with explicit comparisons. In particular, no loss in the exponent $sqrt(2)$ is absorbed into a constant. The lower bound for $D$ comes from a positive kernel and the opposite sheet. For the upper bound, we construct an isolated solution on each side of the same base graph. Adding their equations cancels the terms linear in the graph’s mean curvature. The remaining task is to compare each artificial solution with the true phase while preserving the exact exponential rate across a growing chamber.

#thm([Lemma 3.14.])[
  (A half-space inverse).  #emph[Let $p_0 > n$, $V_g = 3 g^2 - 1$, and $L_g = - Delta_y - partial_t^2 + V_g \( t \)$ on $bb(R)^m times \( 0 \, oo \)$, with zero Dirichlet trace. For some $b_0 > 0$, uniformly in $0 lt.eq b lt.eq b_0$, its inverse maps the norm 
$ sup_(\( y \, t \)) e^(- b \| y \|) parallel f parallel_(L^(p_0) \( B_1 \( y \, t \) ∩ { t > 0 } \)) $

 to the analogous uniformly local $W^(2 \, p_0)$ norm. The inverse is unique in this weighted class.]
] <lem:interface-halfspace-inverse>

#proof[
  Let $v_0$ be the bounded positive half-line function supplied by Lemma 23 with initial endpoint $0$. It satisfies $\( - partial_t^2 + V_g \) v_0 = 1$, $0 < c lt.eq v_0 lt.eq C$, and $\| v'_0 \| + \| v''_0 \| lt.eq C$. Its trace at $0$ is positive; the functions to which we apply the inverse, rather than this comparison function, have zero trace. Ground-state substitution, first for compact zero-trace functions, gives
  $ integral #scale(x: 120%, y: 120%)[\(] \| nabla f \|^2 + V_g f^2 #scale(x: 120%, y: 120%)[\)] = integral v_0^2 \| nabla \( f \/ v_0 \) \|^2 + integral v_0^(- 1) f^2 gt.eq C^(- 1) parallel f parallel_2^2 . $
  The energy inverse therefore exists for compactly supported sources. For a source in a unit block, energy estimates followed by interior and flat-boundary elliptic estimates and Sobolev bootstrapping bound its $W^(2 \, p_0)$ norm locally by the source’s $L^(p_0)$ norm. These bounds are uniform in the block location; only a fixed number of bootstraps is required because $p_0 > n$ is fixed.
  Off a fixed enlargement of that block, compare its absolute value with $C v_0 \( t \) e^(- c_1 r)$, where $r$ is distance to the block center. For sufficiently small fixed $c_1 > 0$, this is a supersolution: $L_g v_0 = 1$ dominates the terms bounded by $C \( c_1 + c_1^2 + c_1 \/ r \) v_0$. Comparison is valid after division by $v_0$, since the divided operator has positive zeroth coefficient $v_0^(- 1)$. On unbounded domains it follows by exhaustion using outer growing exponential barriers; alternatively, the energy solution’s vanishing exterior $L^2$ norm and local estimates give the boundary condition at infinity. Local elliptic estimates then give exponential decay of the $W^(2 \, p_0)$ norms as well. Partition an arbitrary source into disjoint unit blocks and sum these estimates. The sum converges locally absolutely because $e^(b \| y' \|) lt.eq e^(b \| y \|) e^(b \| y - y' \|)$ and $b < c_1 \/ 2$. It provides the stated inverse and norm bound. Here is an explicit uniqueness argument for the full weighted class, including directions with $t arrow.r oo$. Let $R_(*) \( x \) = sqrt(1 + \| x \|^2)$, and write $C_0 = sup v_0$, $C_1 = sup \| v'_0 \|$. Since $\| nabla R_(*) \| lt.eq 1$ and $Delta R_(*) lt.eq n$,
  $ L_g \( v_0 e^(c R_(*)) \) gt.eq e^(c R_(*)) #scale(x: 120%, y: 120%)[\[] 1 - 2 c C_1 - n c C_0 - c^2 C_0 #scale(x: 120%, y: 120%)[\]] . $
  Choose $c_(*) > 0$ so the bracket is at least $1 \/ 2$, and decrease $b_0$ to be at most $min \( c_1 \/ 4 \, c_(*) \/ 2 \)$. A homogeneous solution in the weighted class satisfies $\| u \( y \, t \) \| lt.eq C_u e^(b \| y \|)$ by local Sobolev embedding. On the hemisphere $\| x \| = R$, the barrier $eta v_0 e^(c_(*) R_(*))$ dominates $\| u \|$ for every sufficiently large $R$, since $c_(*) > b$. On its flat boundary $u = 0$. The divided maximum principle on half-balls, for both signs of $u$, therefore gives $\| u \| lt.eq eta v_0 e^(c_(*) R_(*))$ everywhere. Let $eta arrow.b 0$. ◻
]

#proof[
  Fix $z$ and write $B = J_0 \( z \) + E \( z \)$. We need only treat $B arrow.r 0$. For the first inequality other values are trivial. For the second, if $E lt.eq J_0$ there is nothing to prove; if $B$ is bounded below and $E > J_0$, then $d$ is uniformly bounded and $D$ is uniformly bounded below. The latter assertion follows from single-profile compactness: $D \( z_j \) arrow.r 0$ would make $U$ converge to a linear coordinate on every fixed ball, forcing $d \( z_j \) arrow.r oo$ by the definition of the penalty. This is also Lemma 20.
  #emph[Step 1: ordered sheets on the comparison scale.] Translate and rotate so $z = 0$, $nu \( z \) = e_n$. Put $P_0 = A_0 log \( 1 \/ B \)$, where $A_0$ will be large and fixed. After $A_0$ is chosen, take $lambda$ so small that $10 lambda A_0 < 1 \/ 2$. Every zero in $B_(10 P_0)$ is then good, and
  $ \| A \|^2 lt.eq J_0 \( 0 \) e^(10 lambda P_0) lt.eq B^(1 \/ 2) . $
  Indeed a bad zero there would give $J_0 \( 0 \) gt.eq B^(10 lambda A_0) > B$. At every such good zero $\| nabla v \| gt.eq sqrt(3 \/ 8)$, so uniform elliptic estimates give uniform graph smoothness on a fixed scale.
  The base sheet extends over a disk of radius at least $2 P_0$ in its tangent plane. To see this directly, lift radial segments by tangent projection. Along a lift of length $O \( P_0 \)$ the normal changes by at most $O \( P_0 B^(1 \/ 4) \) = o \( 1 \)$, so the projection remains invertible and the lift length remains controlled. All lifts stay inside the regular larger ball, and any terminal limit is regular. Continuation and local uniqueness give a smooth graph; the same argument works for sheets based in a fixed small fraction of $B_(P_0)$. Their heights differ from their tangent planes by $O \( P_0^2 B^(1 \/ 4) \) = o \( 1 \)$.
  Here is the ordering argument with the length scales recorded. Fix a small angular parameter $theta > 0$. A sheet based within $theta P_0$ has unoriented normal within $C theta + o \( 1 \)$ of $e_n$. Otherwise its almost affine disk of radius comparable to $P_0$ crosses the base disk transversally: along a line in the direction of its tilt, its signed height relative to the base changes sign, with magnitude bounded below by a constant times the tilt times $P_0$, while both graph errors are $o \( 1 \)$. The intermediate value theorem would give an intersection, impossible for two different regular zero sheets. Thus all pieces in a smaller box are ordered graphs over one horizontal disk. There are finitely many in each closed inner box: infinitely many would accumulate at a regular zero, where the fixed local graph property permits only one piece. Descriptions on overlapping disks agree or are disjoint.
  Let the first graph above the base have positive-axis intercept less than $theta P_0 \/ 10$, if such a graph exists, and let $ell$ be its shortest distance to $0$. Its foot normal $n'$ satisfies
  #[#set math.equation(numbering: n => "(3.34)")
   $ \| n' - e_n \| lt.eq C frac(ell + o \( 1 \), P_0) \, #h(2em) { n' dot.op x = ell } upright(" is its tangent plane at the foot") . $ <eq:interface-gap-angle>]
  For this stronger bound, apply the preceding nonintersection argument out to the full horizontal scale comparable to $P_0$, now using its height $ell$ instead of $theta P_0$. The minimizing foot is interior because the horizontal chart radius greatly exceeds its intercept. Choosing $theta$ small puts the chord in the constant part of $Gamma$, and hence $d \( 0 \) lt.eq G_1 ell$.
  Choose box fractions $c_1 = c'_0 theta$, $c_2 = c_1 \/ C_0$, with $c'_0$ sufficiently small and $C_0$ sufficiently large dimensional constants. These two constants can be fixed before $theta$ is decreased further. In $\| y \|_oo lt.eq 10 c_1 P_0$ the adjacent height differs from $ell$ by at most a small fixed fraction of $ell$, plus $o \( 1 \)$, by (3.34). This box contains the whole adjacent chamber and ample lateral buffer. If no small intercept exists, the analogous box contains no zero above the base up to height $10 c_1 P_0$. An intervening zero would extend through the axis to a prohibited smaller intercept. The same statements hold below. All these chamber heights tend to infinity, since $d \( 0 \) gt.eq kappa^(- 1) log \( 1 \/ B \)$.
  If $E \( 0 \) gt.eq J_0 \( 0 \)$, then $d \( 0 \) = kappa^(- 1) log \( 1 \/ E \( 0 \) \) = O \( log \( 1 \/ B \) \)$. For $A_0$ sufficiently large it is much smaller than $theta P_0$. Every realizing contact lies in the preceding graph system. A contact on the base sheet, including a diagonal one, has value at least $c B^(- 1 \/ 4) gt.double P_0$, by its curvature bound and the graph Taylor formula. Every other competing sheet has its shortest chord in the plateau, while every chord to it has penalty at least $G_1$. Consequently
  #[#set math.equation(numbering: n => "(3.35)")
   $ d \( 0 \) = G_1 ell_min \, $ <eq:interface-real-gap>]
  where $ell_min$ is the shortest distance to an adjacent graph. Only adjacent graphs can be shortest, since a segment to a farther graph crosses an intervening zero.
  #emph[Step 2: the opposite sheet gives the lower interaction bound.] For a fixed unit vector $n_0$, put $w = q \( 1 - p dot.op n_0 \) gt.eq 0$. The identities for $q$ and $nabla v$, together with $q p = sqrt(2) nabla v$, give
  #[#set math.equation(numbering: n => "(3.36)")
   $ \( - Delta + 2 \) w = 3 q w - q^2 D gt.eq q w gt.eq 0 . $ <eq:L6>]
  The last inequality uses $D lt.eq 2 \( 1 - p dot.op n_0 \)$. The positive kernel of $- Delta + 2$ is
  $ cal(K) \( x \) = integral_0^oo \( 4 pi t \)^(- n \/ 2) e^(- 2 t - \| x \|^2 \/ \( 4 t \)) thin thin upright(d) t . $
  For $r gt.eq 1$ it is bounded above and below by positive constants times $r^(- m \/ 2) e^(- sqrt(2) r)$; the bounds follow by splitting this integral about its minimum at $t = r \/ \( 2 sqrt(2) \)$ and scaling the central interval by $sqrt(r)$. Convolution represents bounded solutions of this equation, by the maximum principle for their bounded homogeneous difference. In particular a nonnegative subset of its source gives a lower bound.
  Take $n_0 = e_n$ and assume $E gt.eq J_0$. On the opposite adjacent sheet realizing (3.35), the oriented normal is almost $- e_n$, because the signs of a continuous function alternate between its regular zero graphs. On a tangent disk of radius $c sqrt(ell_min)$ and a fixed thin neighborhood of this disk, $q w$ has a fixed positive lower bound: $D < 1 \/ 4$ at its zeros and uniform local derivative bounds apply. The distances to $0$ are $ell_min + O \( 1 \)$, and its volume is comparable to $ell_min^(m \/ 2)$. Thus (3.36) gives
  $ D \( 0 \) gt.eq w \( 0 \) gt.eq c e^(- sqrt(2) ell_min) = c E \( 0 \) . $
  This proves the second inequality of (3.33), including its exact exponential rate. The remaining inequality requires an upper bound for the deficit of the base slope; a one-sided curvature error would be too large for that purpose.
  #emph[Step 3: cancellation for two artificial half-space solutions.] Write the base graph as $x_n = h \( y \)$, with $h \( 0 \) = 0$ and $nabla h \( 0 \) = 0$, and cut it off smoothly outside the preceding comparison region at scale $P_0$. Its extension can be chosen with
  $ parallel h parallel_(C^2) = o \( 1 \) \, #h(2em) \| nabla h \( y \) \| + \| nabla^2 h \( y \) \| lt.eq C sqrt(J_0 \( 0 \)) e^(2 lambda \| y \|) . $
  For an explicit bound independent of $P_0$, take the cutoff equal to $1$ on $\| y \| lt.eq P_0$ and supported on $\| y \| lt.eq 2 P_0$. The uncut graph has $\| nabla h \| lt.eq 1$, so $\| \( y \, h \( y \) \) \| lt.eq 2 \| y \|$ and $\| nabla^2 h \( y \) \| lt.eq C sqrt(J_0 \( 0 \)) e^(lambda \| y \|)$. Radial integration from $h \( 0 \) = nabla h \( 0 \) = 0$ gives
  $ \| nabla h \( y \) \| lt.eq C lambda^(- 1) sqrt(J_0 \( 0 \)) e^(lambda \| y \|) \, #h(2em) \| h \( y \) \| lt.eq C lambda^(- 2) sqrt(J_0 \( 0 \)) e^(lambda \| y \|) . $
  Derivatives of the cutoff contribute factors $P_0^(- 1)$ and $P_0^(- 2)$, which are at most $1$ for $P_0 gt.eq 1$. Thus the extended graph obeys the displayed weighted estimate with a constant at most $C \( 1 + lambda^(- 1) + lambda^(- 2) \)$, fixed after $lambda$, and no factor growing with $log \( 1 \/ B \)$. Its unweighted $C^2$ smallness follows separately from $P_0^2 B^(1 \/ 4) arrow.r 0$. Use this same extension $h$ on both sides. In the coordinates $x_n = h \( y \) plus.minus t$, $t > 0$, seek positive solutions $v_plus.minus^(*) = g \( t \) + phi_plus.minus$ with zero boundary. Their equations are
  #[#set math.equation(numbering: n => "(3.37)")
   $ L_g phi_plus.minus =  & \| nabla h \|^2 partial_(t t) \( g + phi_plus.minus \) minus.plus 2 nabla h dot.op nabla_y partial_t phi_plus.minus minus.plus Delta h thin partial_t \( g + phi_plus.minus \)\
 & - 3 g phi_plus.minus^2 - phi_plus.minus^3 . $ <eq:L7>]
  Lemma 33 and the embedding $W_(upright("uloc"))^(2 \, p_0) subset C^(1 \, eta)$ make the right-hand side followed by the inverse a contraction in a small unweighted ball. The highest derivative terms have coefficients tending uniformly to zero; the nonlinear terms have Lipschitz constants tending to zero on that ball. The source terms from $g$ tend to zero there. This proves existence and uniqueness of small zero-trace solutions; local elliptic bootstrapping gives smoothness. Weighted estimates in the same equation, with the small-coefficient terms absorbed, then give
  $ parallel phi_plus.minus parallel_(W^(2 \, p_0) \( B_1 \( y \, t \) ∩ { t > 0 } \)) lt.eq C sqrt(J_0 \( 0 \)) e^(3 lambda \| y \|) . $
  They are positive by $C^1$ smallness near $t = 0$ and $C^0$ smallness away from it. They are at most $1$: a supremizing sequence with value above $1$, translated in the interior and using uniform regularity, gives a positive interior maximum incompatible with $Delta v^(*) = v^(* 3) - v^(*)$.
  Put $S = phi_(+) + phi_(-)$ and $T_(*) = phi_(+) - phi_(-)$. Adding (3.37) gives exactly
  $ L_g S =  & \| nabla h \|^2 \( 2 g'' + S_(t t) \) - 2 nabla h dot.op nabla_y \( T_(*) \)_t - Delta h thin \( T_(*) \)_t\
 & - 3 g \( phi_(+)^2 + phi_(-)^2 \) - \( phi_(+)^3 + phi_(-)^3 \) . $
  The terms $minus.plus Delta h thin g'$ cancel. Every remaining source is $O \( J_0 \( 0 \) \)$ in the weighted local $L^(p_0)$ norm with exponent $10 lambda$: the coefficient factors have weight $2 lambda$, the perturbations have weight $3 lambda$, and the cubic terms also have a uniform small bound on one factor. Taking $10 lambda < b_0$ and using the inverse and boundary Sobolev embedding, we conclude
  #[#set math.equation(numbering: n => "(3.38)")
   $ \| partial_t \( phi_(+) + phi_(-) \) \( 0 \, 0 \) \| lt.eq C J_0 \( 0 \) . $ <eq:L8>]
  Thus the sum of the two artificial boundary slopes differs from the planar value by a curvature-square envelope. We next estimate the change in each slope caused by the actual adjacent sheet, if present.
  #emph[Step 4: comparing an artificial solution with the true chamber.] We prove, on the upper side with a small adjacent intercept,
  #[#set math.equation(numbering: n => "(3.39)")
   $ \| partial_n \( v - v_(+)^(*) \) \( 0 \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] e^(- sqrt(2) ell) + e^(- c P_0) #scale(x: 120%, y: 120%)[\)] . $ <eq:L9>]
  If no small intercept is present, the right side is $C e^(- c P_0)$. The lower-side assertion compares $- v$ with $v_(-)^(*)$. All constants $c > 0$ below are fixed before choosing $A_0$.
  #emph[Middle-chamber deficit.] First we establish a sharp bound at the middle of a chamber. Set $t_1 = x_n$ and $t_2 = ell - n' dot.op x$. In the central lateral box, near $t_1 = t_2$, both $1 - v$ and $1 - v_(+)^(*)$ satisfy
  #[#set math.equation(numbering: n => "(3.40)")
   $ 1 - v \, med 1 - v_(+)^(*) lt.eq C #scale(x: 120%, y: 120%)[\(] e^(- sqrt(2) t_1) + e^(- sqrt(2) t_2) + e^(- c P_0) #scale(x: 120%, y: 120%)[\)] . $ <eq:L10>]
  Here and below $v$ is positive in the chamber. For the proof, subtract the uniform $o \( 1 \)$ graph errors from $t_1$ and $t_2$, and add the lateral face distances of a wider box. Call all these inward unit affine distances $l_1 \, dots.h \, l_k$. Their positive intersection is contained in the phase, by ordering. For either deficit $u = 1 - v$ or $u = 1 - v_(+)^(*)$,
  $ \( - Delta + 2 \) u = 3 u^2 - u^3 . $
  Sign-ball clearing, as proved with (2.15), makes $u$ uniformly as small as desired where $min_j l_j gt.eq M$, for large fixed $M$. Put $a_0 = sqrt(2)$ and choose positive constants $C_j$ with $C_j e^(- a_0 M) = eta_0$, where $eta_0 > 0$ is fixed small. On this inner polytope the function
  $ cal(W) = sum_(j = 1)^k (C_j e^(- a_0 l_j) - k C_j^2 e^(- 2 a_0 l_j)) $
  is positive and at most $k eta_0$. With $r_j = C_j e^(- a_0 l_j)$,
  $ \( - Delta + 2 \) cal(W) = 6 k sum_j r_j^2 gt.eq 6 #scale(x: 180%, y: 180%)[\(] sum_j r_j #scale(x: 180%, y: 180%)[\)]^2 gt.eq 3 cal(W)^2 . $
  Choose $eta_0$ so $k eta_0 < 1 \/ 8$, then $M$ so clearing gives $u lt.eq eta_0 \/ 2$ on the boundary. On a boundary face $cal(W) gt.eq eta_0 - k eta_0^2 gt.eq eta_0 \/ 2$. The difference equation has positive zeroth coefficient while $u \, cal(W)$ are small, so the maximum principle gives $u lt.eq cal(W)$. The central point is a distance comparable to $P_0$ from the lateral faces; the $o \( 1 \)$ shifts only change constants. This proves (3.40).
  #emph[Potential comparison on the lower half of the chamber.] Now use the domain between $x_n = h \( y \)$ and the affine midpoint $t_1 = t_2$, with $\| y \|_oo < c_2 P_0$. In the case without a small intercept, use instead its horizontal top at height $c_2 P_0$. The difference $u_(*) = v - v_(+)^(*)$ solves
  $ \( - Delta + V_(*) \) u_(*) = 0 \, #h(2em) V_(*) = v^2 + v v_(+)^(*) + \( v_(+)^(*) \)^2 - 1 . $
  For some fixed $gamma_1 > 0$,
  #[#set math.equation(numbering: n => "(3.41)")
   $ V_(*) \( x \) gt.eq V_g \( t_1 \) - eta \( B \) e^(- gamma_1 t_1) \, #h(2em) eta \( B \) arrow.r 0 . $ <eq:interface-potential-comparison>]
  We check both the fixed-depth and increasing-depth content of this statement. At each base point in the lateral box there is a tangent ball in the positive phase whose radius tends uniformly to infinity. It may be chosen much smaller than $c_1 P_0$, the adjacent height, and $B^(- 1 \/ 4)$: the base Hessian bound keeps the ball above the base, and the chamber and lateral buffers exclude any other zero from it. For a concrete uniform choice, put $H_B = ell$ when the small adjacent intercept is present and $H_B = c_1 P_0$ otherwise, and take
  $ r_B = #scale(x: 120%, y: 120%)[\[] min { c_1 P_0 \, H_B \, B^(- 1 \/ 4) } #scale(x: 120%, y: 120%)[\]]^(1 \/ 2) . $
  All three quantities in the minimum tend to infinity, so $r_B$ is smaller than each by a factor tending to zero. The adjacent height over the larger box is bounded below by a fixed positive fraction of $H_B$, and every base in the smaller box has a lateral margin comparable to $c_1 P_0$. Finally $r_B B^(1 \/ 4) arrow.r 0$, so the Hessian bound excludes a second contact of the tangent ball with the base. The radius therefore works uniformly, including at bases on a lateral face of the smaller box. Lemma 25, or its explicit inequality (3.18), gives $v arrow.r g \( t_1 \)$ on every fixed depth interval. Indeed, along the inward normal at a base point, that inequality and $\| nabla U \| lt.eq 1$ give $s - C \( 1 + s \) \/ r lt.eq U lt.eq s$ for fixed $s gt.eq 0$, where $r$ is the radius of the tangent phase ball. These radii tend uniformly to infinity. To pass from normal depth to the vertical coordinate $t_1$, use the uniformly vanishing slope and height of the base graph and the same Lipschitz bound for $U$. Thus the convergence is uniform over all bases in the buffered comparison box; no two-sided estimate for $H$ is used. The artificial solution has the same convergence by construction, and $h = o \( 1 \)$ on this box. At increasing depths up to the midpoint there is an explicit phase-ball radius independent of $theta$. Let $eta_B = o \( 1 \)$ bound the signed affine errors of both sheets in the larger box $\| y \|_oo lt.eq 10 c_1 P_0$. For a point in the closure of the smaller lateral comparison box, put $s = t_1 gt.eq 1$. We have $t_2 gt.eq s$ and $s lt.eq theta P_0 \/ 4$; the latter follows from $ell lt.eq theta P_0 \/ 10$ and (3.34). Set $c_(upright("ball")) = min \( 1 \/ 8 \, c'_0 \)$. On $B_(c_(upright("ball")) s) \( x \)$ both unit affine distances are at least $7 s \/ 8 > eta_B$ for small $B$. Its horizontal displacement is at most $c'_0 theta P_0 \/ 4 = c_1 P_0 \/ 4$, so it remains inside the larger box even when its center is on a lateral face of the smaller box. It therefore lies in the true positive chamber. It also lies above the artificial graph. Without a small intercept, $s lt.eq c_2 P_0$, and the same ball stays below the empty-chamber height $10 c_1 P_0$. Sign-ball clearing consequently gives $1 - v + 1 - v_(+)^(*) lt.eq C e^(- c_3 t_1)$ with $c_3 > 0$ depending only on the fixed $c_(upright("ball"))$ and dimension, before $theta$ is chosen. Take $0 < gamma_1 < min \( c_3 \, sqrt(2) \)$. Splitting at a fixed large depth and then using fixed-depth convergence proves (3.41). This reasoning includes the domain with the artificial upper face.
  #emph[The barrier at rate $sqrt(2)$.] We have bounded the error in the potential by a decaying function with coefficient $eta \( B \) arrow.r 0$. We now absorb that error into the comparison operator. This is the step that preserves the exact rate. Choose a fixed small $theta_0 > 0$; all $t_1$ in the domain are at least $- theta_0$ for small $B$. Put $a_0 = sqrt(2)$ and
  $ Y \( t \) = g' \( t \) [1 + integral_(- theta_0)^t g' \( s \)^(- 2) thin thin upright(d) s] \, #h(2em) k' \( t \) = - Y \( t \)^(- 2) integral_(- theta_0)^t Y \( s \)^2 e^(- gamma_1 s) thin thin upright(d) s . $
  Then $Y > 0$, $\( - partial_t^2 + V_g \) Y = 0$, and $Y \( t \) asymp e^(a_0 t)$ as $t arrow.r oo$. Consequently $\| k' \( t \) \| lt.eq C e^(- gamma_1 t)$ and its integral is finite. Choose $k \( - theta_0 \)$ so $1 lt.eq k lt.eq C$, and set $phi.alt = e^(- a_0 t) Y k$. Direct differentiation gives
  #[#set math.equation(numbering: n => "(3.42)")
   $ 0 < c lt.eq phi.alt lt.eq C \, #h(2em) \| phi.alt' \| lt.eq C e^(- gamma_1 t) \,\
- phi.alt'' - 2 a_0 phi.alt' + \( V_g - 2 \) phi.alt = e^(- a_0 t) Y \( t \) e^(- gamma_1 t) gt.eq c e^(- gamma_1 t) . $ <eq:interface-shifted-barrier>]
  These bounds also hold on the fixed compact initial interval. If $c' = n' dot.op e_n$, then
  $ \( - Delta + V_(*) \) #scale(x: 120%, y: 120%)[\[] e^(- a_0 t_2) phi.alt \( t_1 \) #scale(x: 120%, y: 120%)[\]] = e^(- a_0 t_2) #scale(x: 120%, y: 120%)[\[] - phi.alt'' - 2 a_0 c' phi.alt' + \( V_(*) - 2 \) phi.alt #scale(x: 120%, y: 120%)[\]] . $
  By (3.42) the bracket is nonnegative when $\| 1 - c' \|$ is a sufficiently small fixed number and $B$ is sufficiently small. Its errors are bounded by $C \( \| 1 - c' \| + eta \( B \) \) e^(- gamma_1 t_1)$. This is the reason the exact exponential $e^(- sqrt(2) t_2)$ survives. The small geometric and potential errors have been absorbed in the operator inequality before comparison. They are not additive errors in the interaction estimate and are never divided by its exponentially small scale.
  There are also coarse barriers for the remaining faces. Take $v_0$ from Lemma 23 with initial endpoint $- theta_0$. It is bounded above and below by positive constants and satisfies $\( - partial_t^2 + V_g \) v_0 = 1$. For any inward affine unit face distance $l$, the function $v_0 \( t_1 \) e^(- c_4 l)$ is a supersolution of $- Delta + V_(*)$ when $c_4 > 0$ is sufficiently small and $B$ is sufficiently small. Indeed the new terms are bounded by $C \( c_4 + c_4^2 + eta \( B \) \)$, whereas the undisturbed positive term is $1$.
  The difference is zero at the bottom. Multiples of these coarse barriers dominate its absolute value at the lateral faces. At the midpoint, (3.40) and $t_1 = t_2$ bound it by a multiple of $e^(- a_0 t_2) phi.alt \( t_1 \)$ plus $e^(- c P_0) v_0 \( t_1 \)$. The latter is itself a supersolution after multiplication by the constant $e^(- c P_0)$. In the case with an artificial top face use its coarse barrier instead. Comparison is legitimate despite the possible sign of $V_(*)$: division by $v_0$ gives a strictly positive zeroth coefficient, by (3.41). The resulting bound on a fixed neighborhood of $0$ is $C \( e^(- a_0 ell) + e^(- c P_0) \)$, or $C e^(- c P_0)$ without an adjacent small intercept. Boundary gradient estimates for the homogeneous equation on the uniformly smooth graph, with zero boundary value, prove (3.39).
  #emph[Step 5: choosing the constants and recovering the base defect.] The artificial cancellation and the true-chamber comparison are now proved separately. To combine them uniformly, use the following order for the constants. First fix the decay and comparison constants for $g$, the half-space inverse, and the elementary phase-ball clearing. The box construction above has uniformly controlled aspect ratios when both fractions are proportional to $theta$, so choose $gamma_1$ and then $phi.alt \, v_0$ using those uniform constants. Next take $theta$ small enough for the plateau condition and the drift error in (3.42); choose $c_1 \, c_2$ as specified. The resulting coarse exponent $c > 0$ is fixed. Now choose $A_0$ large enough for the realizing-contact argument and $c A_0 > 1$. Then choose $lambda$ small enough for $10 lambda A_0 < 1 \/ 2$ and $10 lambda < b_0$. Finally decrease the upper threshold for $B$ to meet all small-error conditions. This order is independent of $delta$. In particular $e^(- c P_0) lt.eq B$ with uniform constants.
  At $0$, the two unsigned true derivatives in the inward height coordinates are both $partial_n v \( 0 \)$. Equations (3.38) and (3.39) show
  $ \| 2 partial_n v \( 0 \) - 2 g' \( 0 \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] J_0 \( 0 \) + E \( 0 \) + e^(- c P_0) #scale(x: 120%, y: 120%)[\)] lt.eq C B \, $
  because every adjacent gap used satisfies $d \( 0 \) lt.eq G_1 ell$. Since $D \( 0 \) = 1 - 2 partial_n v \( 0 \)^2$ and $g' \( 0 \) = 1 \/ sqrt(2)$, this proves the first inequality of (3.33) and completes the proposition. ◻
]

===== 3.2.4 An integral comparison <an-integral-comparison>

The pointwise comparison contains the supremum $J_0$. For the growth argument we need an integral estimate involving $a^4$, $D^2$ and $E^2$ instead. Uniform local area and derivative bounds let us replace the supremum by a positive convolution, with a small $D^2$ error that can be absorbed. The constants must remain independent of the eventual choice of the defect threshold and of the center of the spatial weight.

#thm([Lemma 3.15.])[
  (Uniform area on good pieces).  #emph[For $0 < delta lt.eq 1 \/ 4$, the area of $Sigma \\ X$ in any unit ball is bounded by a dimensional constant, independently of $delta$. Consequently its area in an ambient ball of radius $r gt.eq 1$ is at most $C \( 1 + r \)^n$. At a good zero whose distance from $X$ exceeds $2$, there is a fixed-size graph neighborhood on which $D$ is comparable to its value at that zero and $\| nabla_Sigma A \| lt.eq C sqrt(D)$.]
] <lem:interface-good-area>

#proof[
  At a good zero, $\| nabla v \| gt.eq sqrt(3 \/ 8)$. Uniform second derivative bounds for $v$ give a fixed ball on which its derivative along the initial normal is bounded below. All zeros in a smaller ball therefore form one graph, with uniformly bounded slope and derivatives. A separated selection of such smaller balls has bounded cardinality inside a unit ball, by ordinary ambient packing, and covers its good zeros. Summing their graph areas gives the claim. Larger balls are covered by $C \( 1 + r \)^n$ unit balls. The last assertions are local Harnack and the differentiated bounds in Lemma 8, applied on a fixed regular graph contained in the good set. ◻
]

#thm([Lemma 3.16.])[
  (Weighted integral comparison).  #emph[Let $cal(X)$ be a maximal unit-separated subset of $X$, with $cal(X) = diameter$ when $X = diameter$. For an arbitrary center $x_c$, set $chi_R \( x \) = exp \( - sqrt(1 + \| x - x_c \|^2) \/ R \)$. There are $C_D \, R_D < oo$, independent of $0 < delta lt.eq 1 \/ 4$ and $x_c$, such that for $R gt.eq R_D$, 
#[#set math.equation(numbering: n => "(3.43)")
 $ integral_(Sigma \\ X) \( D^2 + E^2 \) chi_R^2 thin thin upright(d) S lt.eq C_D {integral_(Sigma \\ X) \( a^4 + D E \) chi_R^2 thin thin upright(d) S + sum_(x in cal(X)) chi_R \( x \)^2} . $ <eq:L11>]

]
] <lem:interface-integral>

#proof[
  Multiplying the first inequality of (3.33) by $D$ and the second by $E$, and absorbing $D J_0 \, E J_0$ by Young’s inequality, gives $D^2 + E^2 lt.eq C \( J_0^2 + D E \)$. We estimate $J_0^2$ without replacing a supremum by an unjustified point value integral. Let $w$ be good and $"dist" \( w \, X \) > 2$. On its fixed regular graph, for $w'$ within intrinsic distance $mu$, Lemma 34 gives
  $ a \( w \)^4 lt.eq C a \( w' \)^4 + C mu^4 D \( w \)^2 . $
  Average on that small graph disk, and use Harnack and a fixed-size graph disk to bound $D \( w \)^2$ by the integral of $D^2$ in $B_1 \( w \)$. For every sufficiently small fixed $mu > 0$ this yields
  $ a \( w \)^4 lt.eq C_mu integral_(B_1 \( w \) ∩ \( Sigma \\ X \)) a^4 thin thin upright(d) S + C mu^4 integral_(B_1 \( w \) ∩ \( Sigma \\ X \)) D^2 thin thin upright(d) S . $
  The coefficient in front of the last integral is independent of $mu$. Values at $w$ within distance $2$ of $X$, including bad points where $macron(a) = 1$, are bounded by a constant and can instead be charged to some point of $cal(X)$ within distance $3$. Since bounded shifts change $e^(- 2 lambda \| z - w \|)$ by only a fixed factor, taking the supremum over $w$ gives
  $ J_0 \( z \)^2 lt.eq C integral e^(- 2 lambda \| z - w \|) (C_mu a^4 thin thin upright(d) S + C mu^4 D^2 thin thin upright(d) S + thin upright(d) \#_(cal(X))) \( w \) . $
  The surface measures here are restricted to $Sigma \\ X$. By Lemma 34 and $chi_R \( z \) lt.eq e^(\| z - w \| \/ R) chi_R \( w \)$, for $R gt.eq 2 \/ lambda$,
  $ integral_(Sigma \\ X) e^(- 2 lambda \| z - w \|) chi_R \( z \)^2 thin thin upright(d) S_z lt.eq C_lambda chi_R \( w \)^2 . $
  The constant is independent of the good threshold, by summation over unit annuli and their polynomial area bound. Tonelli now bounds the integral of $J_0^2 chi_R^2$. Choose $mu$ small enough to absorb the resulting $D^2$ term, after the constant in (3.33) and $lambda$ have been fixed. This proves (3.43). All integrals are finite: $D \, E \, a$ are bounded on good zeros, the area has polynomial growth, and the separated net has polynomial ambient growth. ◻
]

===== 3.2.5 Sharp constants in logarithmic windows <sharp-constants-in-logarithmic-windows>

The comparison above fixes the exponential rate, with unspecified multiplicative constants. On windows whose defect decreases at a polynomial rate, the sheets are sufficiently close to parallel planes to compute the coefficients as well. We first make the geometry and the additive distance errors precise; these errors must tend to zero before they are inserted into an exponential.

#thm([Lemma 3.17.])[
  (Uniform geometry on clean windows).  #emph[Fix $omega > 0$, $C_0 < oo$, and a fractional margin $0 < theta_0 < 1$. Suppose that $z_0 in Sigma$ and 
$ D \( w \) lt.eq N^(- omega) #h(2em) \( w in Sigma ∩ B_(N^omega) \( z_0 \) \) \, #h(2em) N arrow.r oo . $

 The following conclusions hold uniformly for bases $z in Sigma ∩ B_(\( 1 - theta_0 \) N^omega) \( z_0 \)$. Local zero pieces within $C_0 log N$ of $z$ are finitely many ordered smooth graphs over $T_z Sigma$. Their domains contain a disk of radius $c N^(omega \/ 8)$, with a further comparable graph buffer. They have curvature at most $C N^(- omega \/ 2)$ and slopes and differences of unoriented normals at most 
$ C #scale(x: 120%, y: 120%)[\(] N^(- omega \/ 8) log N + N^(- 3 omega \/ 8) #scale(x: 120%, y: 120%)[\)] . $

 Distinct graphs have Euclidean separation at least $c_0 log N$ where they participate in these neighborhoods.]
  #emph[For every fixed $k > 0$, these descriptions extend over lateral disks of radius $\( log N \)^k$ and through every fixed multiple of $log N$ in normal depth. They contain every zero piece meeting the corresponding smaller cylinder. Projection to each participating local graph is unique and smooth there. Differences between its Euclidean distance and its vertical distance, and differences between its height increments and those of its tangent plane, are additive errors bounded by 
$ C_k N^(- c) \( 1 + log N \)^(C_k) = o \( 1 \) \, #h(2em) c = c \( omega \) > 0 . $

 The same bounds hold uniformly as the center moves in the stated fractional interior. In particular the lateral domains include $\( log N \)^2$ boxes and disks of radius $ell^(2 \/ 3)$ whenever $ell = O \( log N \)$. The polynomial buffers and unique projections make these descriptions consistent on overlaps.]
  #emph[If a distinct graph is within $C_0 log N$ of the base $z$, then 
$ d \( z \) = G_1 ell_min \( z \) \, $

 where $ell_min \( z \)$ is the shortest Euclidean distance from $z$ to an adjacent graph. All thresholds may depend on the fixed parameters and on $k$, but not on the solution or the base.]
] <lem:interface-log-windows>

#proof[
  We establish graph continuation on a polynomial scale before using it on any logarithmic scale. Put
  $ kappa_N = C N^(- omega \/ 2) \, #h(2em) r = N^(omega \/ 8) . $
  At every zero under consideration, $\| A \| lt.eq kappa_N$ and $\| nabla v \|$ has a fixed positive lower bound. The fractional margin contains all balls of radius $100 r$ used below once $N$ is large. Starting at any such zero, lift a straight radial segment in its tangent plane by tangent projection. As long as the lift has length at most $10 r$, its normal changes by at most $10 kappa_N r = o \( 1 \)$. The differential of projection therefore remains invertible, and the lifted length is at most twice the projected length. In particular every segment of projected length at most $r$ continues to its endpoint: a terminating sequence stays in the larger ball, has a regular zero as its limit, and local inversion continues it. The lifting equation depends smoothly on the segment endpoint. Its endpoints thus form one smooth graph over the full tangent disk; local uniqueness identifies it with the original zero piece. Starting with a larger fixed multiple of $r$ supplies the stated buffer. Taylor’s formula on these graphs gives the affine error
  $ C kappa_N r^2 = O \( N^(- omega \/ 4) \) . $
  We next put nearby pieces over the same plane. Two such graph disks whose base points are at distance $b = o \( r \)$ have unoriented normal angle at most
  #[#set math.equation(numbering: n => "(3.44)")
   $ C (b / r + kappa_N r) . $ <eq:interface-clean-angle>]
  Indeed, if the angle were larger, a line in one tangent plane in the direction of maximal tilt would make its signed distance from the other tangent plane take opposite signs, with magnitude greater than both affine errors, inside a fixed smaller disk. Points of that graph project into the interior of the other disk. The signed graph height, measured in the second disk’s normal direction, then vanishes by the intermediate value theorem. At this intersection the two normals would still differ by more than their variations $C kappa_N r$, contradicting the unique tangent plane of the regular level set. This argument also excludes differently tilted pieces of a single connected component. Taking $b = O \( log N \)$ proves the claimed common-plane slope bound. Over a common smaller disk the graphs either agree or are disjoint, and so are ordered.
  For completeness, no new sheet can enter unnoticed through the side of a logarithmic-power box. A zero $w$ with lateral coordinate $\| y \| lt.eq \( log N \)^k$ and height at most $C_0 log N$ first has $b = O \( \( 1 + log N \)^(max \( k \, 1 \)) \)$ in (3.44). This already gives a slope tending to zero polynomially and permits its graph to continue to the normal axis through $z$. Its height changes on that continuation by at most
  $ C (frac(\( 1 + log N \)^(max \( k \, 1 \)), r) + kappa_N r) \( 1 + log N \)^k = o \( 1 \) . $
  Its intercept is therefore within $\( C_0 + 1 \) log N$ of $z$ for large $N$. Applying (3.44) again at this intercept gives the refined slope bound already stated. Enlarging the fixed depth constant in a buffered description therefore includes all pieces in the smaller box. There are only finitely many in each closed inner cylinder: otherwise zeros on distinct graphs accumulate at a regular zero, whose uniform local graph neighborhood contains only one zero piece. This is local finiteness, and imposes no global bound on the number of sheets.
  The same estimates give the required additive accuracy. On a disk of radius $L = \( log N \)^k$, the error from a graph’s own tangent plane is at most $C kappa_N L^2$. If $theta.alt_N = C \( log N \/ r + kappa_N r \)$ denotes the common-plane slope bound, changing from its tangent plane to the common horizontal plane costs at most $C theta.alt_N L + C kappa_N L^2$ in height. Both quantities are bounded by a negative power of $N$ times a fixed logarithmic power. They tend to zero as numbers, rather than only relative to the gap.
  To check projections, write one graph as $x_n = f \( y \)$. For a fixed point $x$, half its squared distance to $\( y \, f \( y \) \)$ has Hessian
  $ upright("Id") + nabla f ⊗ nabla f - \( x_n - f \) D^2 f . $
  On a buffered disk relevant to logarithmic depth this is positive definite, with eigenvalues $1 + o \( 1 \)$: the slope tends to zero and $\| x_n - f \| \| D^2 f \| = o \( 1 \)$. The same bound holds out to a fixed fraction of the polynomial disk, since its height variation is at most $C theta.alt_N r + C kappa_N r^2 = O \( log N \)$. A minimizing point cannot occur at that outer boundary, whose horizontal distance is polynomially large, whereas the vertical competitor has distance $O \( log N \)$. Strict convexity gives a unique foot, and the implicit function theorem gives its smooth dependence on $x$. The stationary equation bounds the horizontal displacement of the foot by $C theta.alt_N log N$ and the difference between true and vertical distances by $C theta.alt_N^2 log N$, after harmless enlargement of the common slope bound. These are the asserted additive errors. This projection is to a specified local graph, not to an entire connected component. Every foot that can compete for the nearest zero lies within logarithmic distance, and hence belongs to the buffered family by the preceding completeness argument.
  To prove separation, set $r_0 = c_0 log N$ with $c_0 > 0$ sufficiently small. Starting at any participating zero, the exponential bound in (2.10) gives $D lt.eq C N^(- omega \/ 2)$ throughout $B_(4 r_0)$. Consequently $\| T \| lt.eq C N^(- omega \/ 4)$ there. Integration shows that $p$ remains uniformly close to the initial unit normal, so its component in that direction is positive. All zeros in a smaller cylinder then form a single graph. In conjunction with the common graph description, this excludes a distinct sheet at distance less than a smaller fixed multiple of $r_0$.
  Finally assume a distinct sheet lies within $C_0 log N$ of $z$. Its nearest foot is interior to the polynomial graph disk, and the shortest chord is normal to that graph. The common normal estimate puts its angle at $z$ in the plateau of $Gamma$, for large $N$. It supplies a penalized competitor of size $O \( log N \)$. Every better competitor has chord length $O \( log N \)$ because $Gamma gt.eq 1$, so lies in the same graph system. A chord of length $l$ to the base graph has normal displacement at most $C kappa_N l^2$. Since $Gamma \( s \) gt.eq 1 \/ s$, its penalized length is at least $c kappa_N^(- 1) gt.double log N$, also in a diagonal limit. For every other graph all chords cost at least $G_1$ times their length, and its shortest chord attains this factor. Only adjacent graphs can minimize, since a chord to a farther one crosses an intervening zero first. This proves the exact identity for $d$. All graph identifications and projections on overlapping inner windows agree by their local uniqueness; all construction scales fit within the original fractional margin. ◻
]

#thm([Proposition 3.18.])[
  (Sharp interaction and middle-phase tail).  #emph[Under the hypotheses of Lemma 36, for each $epsilon > 0$ there is $P_epsilon < oo$ such that every fixed $P gt.eq P_epsilon$ has the following properties when $N$ is sufficiently large. If a different sheet is within $C_0 log N$ of the base, then 
#[#set math.equation(numbering: n => "(3.45)")
 $ I_P \( z \) gt.eq \( 32 - epsilon \) e^(- sqrt(2) ell_min \( z \)) . $ <eq:L12>]

 If $x$ lies between two adjacent sheets, their distances $s_i \, s_j$ from $x$ are both at most $C_0 log N$, they are the nearest sheets, and $\| s_i - s_j \| lt.eq C_1$ for a fixed $C_1$, then 
#[#set math.equation(numbering: n => "(3.46)")
 $ q \( x \) lt.eq \( 4 + epsilon \) (e^(- sqrt(2) s_i) + e^(- sqrt(2) s_j)) . $ <eq:L13>]

 Largeness of $N$ may depend on all the fixed parameters, including $P \, C_1 \, epsilon$. The window geometry and conclusions are uniform in the solution and center.]
] <prop:interface-sharp-gaps>

#proof[
  For (3.45) let $ell = ell_min$ and fix $n_0 = nu \( z \)$ in (3.36). On the column $z + s nu \( z \)$, $\| s \| lt.eq P$, (3.32) and local Harnack imply
  $ D = 2 \( 1 - p dot.op n_0 \) - \| p - n_0 \|^2 \, #h(2em) q D gt.eq \( 2 - o \( 1 \) \) w . $
  In fact $\| p - n_0 \|^2 = O_P \( D \( z \)^2 \)$ whereas $D$ is comparable to $D \( z \)$ there, so the last error is uniform and relative. At the opposite foot use a tangent disk of radius $ell^(2 \/ 3)$ and bounded depth $\| t \| lt.eq Q$ in its affine normal coordinates. The true orientations are opposed, and all profile and affine errors on this patch tend uniformly to zero by Lemma 36 and (3.32) at its bases. Thus the exact source on the right of (3.36) satisfies
  $ 3 q w - q^2 D gt.eq \( 6 - o \( 1 \) \) G \( t \)^2 \, #h(2em) \| t \| lt.eq Q . $
  The constant is $6$, since $w arrow.r 2 G$ there. For fixed $P \, Q$ the comparison is relative, as $G$ has a positive minimum on the compact depth interval.
  Integrating the heat-kernel formula for $cal(K)$ in its horizontal variables gives exactly
  $ integral_(bb(R)^m) cal(K) \( y \, h \) thin thin upright(d) y = frac(1, 2 sqrt(2)) e^(- sqrt(2) \| h \|) . $
  Truncating this integral to $\| y \| lt.eq ell^(2 \/ 3)$ changes it by a relative $o \( 1 \)$ for $h = ell + O \( P + Q \)$: the excess distance outside that disk is at least $c ell^(1 \/ 3)$, and the kernel bounds used above control the remaining polynomial volume factor. Polynomial-small graph and angular errors contribute only $o \( 1 \)$ additive errors to distances on this disk, so do not change the exponential factor by more than $1 + o \( 1 \)$. It follows, with signs depending on the side but irrelevant by symmetry of $G$, that
  $ frac(I_P \( z \), e^(- sqrt(2) ell)) & gt.eq frac(2 - o \( 1 \), sigma) frac(6 - o \( 1 \), 2 sqrt(2)) (integral_(- P)^P e^(sqrt(2) s) G \( s \)^2 thin thin upright(d) s) (integral_(- Q)^Q e^(sqrt(2) t) G \( t \)^2 thin thin upright(d) t) . $
  Choose $P \, Q$ large and fixed, then $N$ large. The elementary substitution $r = e^(sqrt(2) t)$ gives
  $ integral_(bb(R)) e^(sqrt(2) t) G \( t \)^2 thin thin upright(d) t = 2 sigma . $
  The limiting coefficient is therefore
  $ 2 / sigma frac(6, 2 sqrt(2)) \( 2 sigma \)^2 = 32 \, $
  which proves (3.45).
  The complementary estimate concerns the value of the phase between the same sheets. Here the coefficient comes from the one-dimensional tail $1 - g \( s \) tilde.op 2 e^(- sqrt(2) s)$ and from $q lt.eq 2 \( 1 - v \)$ in a positive phase. The lateral boundary must be placed farther away than the logarithmic sheet separation so that its contribution is negligible relative to the principal tails.
  For (3.46), change the sign of $v$ if necessary so the phase between the sheets is positive. Separation and $\| s_i - s_j \| lt.eq C_1$ imply $min \( s_i \, s_j \) arrow.r oo$, so the point $x$ belongs to the fixed-depth inner polytope used below once $N$ is sufficiently large. Use the two tangent planes at the perpendicular feet from $x$, together with lateral faces at scale $\( log N \)^2$. Lemma 36 provides these graphs with polynomial buffers, no intervening zeros, and affine errors $o \( 1 \)$. Subtract these errors from the two face distances, producing an inner polytope as in the proof of (3.40). Its distances at $x$ are $s_i + o \( 1 \)$ and $s_j + o \( 1 \)$.
  In that proof the two principal coefficients $C_j$ can now be chosen equal to $2 + eta$, with arbitrarily small fixed $eta > 0$. Indeed at every point of their inner boundaries $l_j = M$, including intersections with lateral faces, the true perpendicular projection is unique and remains in the polynomially buffered clean window. The signed distance to its sheet is $M + o \( 1 \)$: the affine error on the entire $\( log N \)^2$ box is polynomial-small, including its gradient, and the squared-distance Hessian in Lemma 36 is positive definite. Fixed-depth profile convergence at these feet is uniform, so the solution converges there to $g \( M + o \( 1 \) \)$. Since $1 - g \( M \) = 2 e^(- sqrt(2) M) + O \( e^(- 2 sqrt(2) M) \)$, choose $M$ large so that
  $ \( 2 + eta \) e^(- sqrt(2) M) - k \( 2 + eta \)^2 e^(- 2 sqrt(2) M) > 1 - g \( M \) $
  with fixed positive slack, and then $N$ large enough to retain it. Keep the coarse fixed coefficients on the lateral faces. Each summand in the barrier is nonnegative; thus intersections of faces cause no difficulty in the boundary comparison. The same algebra $\( - Delta + 2 \) cal(W) gt.eq 3 cal(W)^2$ applies with these unequal coefficients. At $x$, the lateral contribution is $O \( e^(- c \( log N \)^2) \)$, hence negligible relative to either of the two exponentials, since $s_i \, s_j lt.eq C_0 log N$. We obtain
  $ 1 - v \( x \) lt.eq \( 2 + 2 eta \) (e^(- sqrt(2) s_i) + e^(- sqrt(2) s_j)) . $
  Finally $q = \( 1 - v \) \( 1 + v \) lt.eq 2 \( 1 - v \)$; take $eta$ sufficiently small in terms of $epsilon$ to prove (3.46). ◻
]

The two sharp coefficients concern different quantities: $32$ bounds normal defect mass from below, while $4$ bounds the phase tail from above. The radial test will compare them on the same adjacent gap. The fourth-order estimate proved next first supplies the control of rough regions needed to make that comparison globally.

==== 3.3 A fourth-order growth estimate <sec:growth>

The reach and interface estimates are local. We now integrate them to bound the portions of the zero set on which the radial argument will incur errors: large defect, appreciable curvature, or short reach. Throughout this section $v : bb(R)^7 arrow.r \( - 1 \, 1 \)$ is an entire stable solution of $Delta v = v^3 - v$, $D > 0$, and its energy density is unbounded, as in Sections 1 and 2. In particular $m = 6$. Recall that $a = \| A \|$, $d$ is the penalized reach, and $G_1$ is the constant value of its angular penalty near normal incidence. Write

$ K \( R \) = 1 + sup_(x in bb(R)^7) M_R \( x \) \, #h(2em) kappa = sqrt(2) / G_1 \, #h(2em) E = e^(- kappa d) . $

The target scale is $K \( R \) R^(m - 4)$ for the fourth curvature moment and the squared defect and interaction. Its gain of four powers over the weighted area scale $K \( R \) R^m$ will pay for rough regions and curvature errors in Section 1, even when $K \( R \)$ grows arbitrarily slowly. There are three steps. Simons’ identity reduces the curvature moment to a small multiple of the squared defect. A single ambient stability test then supplies both surface mass and mass near bad zeros. Finally, a multiplier for the reach inequality bounds the derivative cost of that test. The integral comparison of Lemma 35 will close the three estimates.

All surface integrals in this section use induced area. Fix a threshold $delta in \( 0 \, 1 \/ 4 \)$ provisionally and define

$ X = { z in Sigma : D \( z \) gt.eq delta } \, #h(2em) Sigma_g = Sigma \\ X \, $

and let $cal(X) subset X$ be any maximal unit-separated set. Put

$ chi \( x \) = chi_(R \, x_c) \( x \) = exp #h(-0.16667em) (- sqrt(1 + \| x - x_c \|^2) / R) \, #h(2em) N_R = sum_(x in cal(X)) chi \( x \)^2 \, #h(2em) S_0 = frac(a^2 + I_P, 2) . $

Here $I_P$ is the normal average defined in Lemma 28; its finite depth $P$ will be fixed below. Thus $S_0$ is the favorable mass in the strengthened surface inequality. The convention when $X = diameter$ is $N_R = 0$ and $"dist" \( x \, X \) = + oo$. Since $D = 1$ at a singular zero, every such zero belongs to $X$. The quantity $N_R$ records the bad set through any maximal unit-separated net, rather than requiring that set to be smooth.

#thm([Proposition 3.19.])[
  (Fourth-order growth).  #emph[In the seven-dimensional stable setting above, fix the penalty $Gamma$ sufficiently close to the choices specified in Section 1, with $eta_0 < 10^(- 4)$ and $G_1 - 1 \, \( 1 - delta_2 \)^(- 1) - 1 < 10^(- 3)$, decreasing these errors if required by Section 1. There are a finite $P$, a positive $delta$, and constants $R_0 \, C < oo$ such that, for every solution in the setting above, every $x_c in bb(R)^7$, every maximal net $cal(X)$, and every $R gt.eq R_0$, 
#[#set math.equation(numbering: n => "(3.47)")
 $ cal(Y)_R := integral_(Sigma_g) chi^2 \( a^4 + D^2 + E^2 \) + N_R lt.eq C K \( R \) R^(m - 4) . $ <eq:M1>]

 The constants depend on the fixed penalty and tolerances, including $delta$, but are independent of the solution, the center, the net, and $R$. Any prescribed smaller positive tolerances in (3.28)–(3.30) and (3.45)–(3.46) may be imposed before $P$ and $delta$ are fixed.]
] <prop:growth-fourth-order>

======= 3.3.1 Order of choices. <order-of-choices.>

The threshold $delta$ must remain fixed while the spatial radius grows; otherwise the bad set and its net could change with $R$. First fix the penalty and the threshold-independent constant $C_D$ in (3.43). Choose the small coefficient in the curvature estimate below in terms of $C_D$. Next fix the interface tolerances, including $tau lt.eq .001$ for Lemma 40, the normal depth $P$, and the required lower reach threshold $t_min$. Only then shrink $delta$ so that the interface estimates hold on $Sigma_g$ and $d gt.eq t_min$ there. In particular, throughout the remaining proof,

#[#set math.equation(numbering: n => "(3.48)")
 $ I := I_P gt.eq .999 a^2 \, #h(2em) c_I D lt.eq I lt.eq C_P D \, #h(2em) \| H \| lt.eq (frac(1, 2 sqrt(2)) + epsilon_H) I \, quad epsilon_H lt.eq .001 . $ <eq:growth-sharp-budget>]

The value of $epsilon_H$ can also be small enough that $\| H \| lt.eq .355 I$. After $delta$ is fixed, choose a collar width $L_0$ about $X$. The reach is bounded on that collar, so a compact interval $\[ t_min \, t_(*) \]$ can cover all its reach values. The later test amplitude $f \( d \)$ will equal one on this interval. Its decay and the parameters that join its different decay ranges are chosen last. All these choices precede every spatial exhaustion and the limit $R arrow.r oo$.

======= 3.3.2 Area and collar bounds. <area-and-collar-bounds.>

Two elementary estimates will justify all weighted integrations:

#[#set math.equation(numbering: n => "(3.49)")
 $ K \( t \) lt.eq C t / R K \( R \) quad \( t gt.eq R gt.eq 1 \) \, #h(2em) integral_(Sigma_g) chi^2 lt.eq C K \( R \) R^m . $ <eq:growth-area>]

To prove the first, cover a ball of radius $t$ by at most $C \( t \/ R \)^n$ balls of radius $R$ and divide the resulting energy bound by $t^m$. For the second, the uniformly regular small charts at good zeros bound their area by the energy in fixed enlargements; use a bounded overlap covering and then exponentially weighted annuli. The same charts, or Lemma 34, imply

#[#set math.equation(numbering: n => "(3.50)")
 $ integral_(Sigma_g ∩ { "dist" \( dot.op \, X \) lt.eq s }) chi^2 + integral_({ "dist" \( dot.op \, X \) lt.eq s }) chi^2 thin thin upright(d) x lt.eq C \( 1 + s \)^n e^(C \( 1 + s \) \/ R) N_R quad \( s gt.eq 1 \) . $ <eq:growth-collar-count>]

Indeed maximality of the net places $X$ in its unit balls, and each enlarged ball has good area and volume at most $C \( 1 + s \)^n$. Shifting the weight through that ball costs at most $e^(C \( 1 + s \) \/ R)$. These arguments also prove finiteness of every integral used below.

===== 3.3.1 Simons’ identity and the curvature moment <simons-identity-and-the-curvature-moment>

We first estimate $a^4$ with a coefficient of $D^2$ that can be made arbitrarily small. The method combines Simons’ identity, a strict Kato gain, and stability, following the curvature-estimate arguments of #cite(label("Simons1968"), form: "prose") #cite(label("SchoenSimonYau1975"), form: "prose"). Our surface need not be minimal. We therefore retain both the derivatives of $H = "tr" A$ and the cubic-curvature error involving $H$; the averaged mean-derivative estimate (3.29) will make their cost sufficiently small.

#thm([Lemma 3.20.])[
  (Curvature controlled by a small defect cost).  #emph[For each $epsilon_2 > 0$ there are choices of the interface tolerances and $delta > 0$ such that, uniformly for all centers and sufficiently large $R$, 
#[#set math.equation(numbering: n => "(3.51)")
 $ A_4 := integral_(Sigma_g) chi^2 a^4 lt.eq epsilon_2 integral_(Sigma_g) chi^2 D^2 + C_(epsilon_2 \, delta) N_R + C_(epsilon_2 \, delta) K \( R \) R^(m - 4) . $ <eq:M2>]

 The constants remain valid on decreasing $delta$ once the preceding interface tolerances have been fixed, except for the displayed allowed dependence of the last two coefficients on $delta$.]
] <lem:growth-curvature>

#proof[
  The strict gradient gain lets Simons’ identity and surface stability control one another. We derive that gain first, apply it away from $X$, and then charge the omitted collar to $N_R$.
  ======= 3.3.1.1 The Kato gain. <the-kato-gain.>
  We first record the algebra behind the strict gradient gain. If $A$ is a symmetric tensor and $nabla A$ is totally symmetric, there are dimensional $theta > 0 \, C$ such that
  #[#set math.equation(numbering: n => "(3.52)")
   $ \| nabla A \|^2 gt.eq \( 1 + theta \) \| nabla \| A \| \|^2 - C \| nabla H \|^2 . $ <eq:growth-kato>]
  For $\| A \| = \| nabla A \| = 1$, equality in ordinary Kato requires $nabla_i A = b_i A$. Total symmetry, after placing $b$ in the first coordinate direction, forces $A$ to have only its $11$ component. Consequently $nabla H = b "tr" A eq.not 0$. Compactness of the normalized finite-dimensional tensor sets therefore gives a strict Kato gap when $\| nabla H \|$ is sufficiently small; when it is larger, the last term in (3.52) pays for the inequality. Homogeneity proves the claim. The weak gradient of $\| A \|$ is zero almost everywhere on its zero set, so this includes that set.
  ======= 3.3.1.2 Simons’ identity away from bad zeros. <simons-identity-away-from-bad-zeros.>
  Choose the averaging radius $S$ in (3.29). Let $m_c$ be a Lipschitz cutoff vanishing within distance $3 S$ of $X$, equal to one outside distance $6 S$, and with bounded gradient; take $m_c = 1$ if $X$ is empty. Put $u = chi m_c$. The hypersurface identity, with our convention $A = thin upright(d) nu$, is
  $ Delta_Sigma A = nabla_Sigma^2 H + H A^2 - a^2 A . $
  Pair with $A u^2$ and integrate by parts. Codazzi gives $"div"_Sigma A = nabla_Sigma H$. Thus the term with $nabla^2 H$ costs at most $C integral u^2 \| nabla H \|^2 + C integral a^2 \| nabla u \|^2$; the cross from $Delta A$ uses $chevron.l A \, nabla_i A chevron.r = a nabla_i a$ and costs an arbitrarily small fraction of $integral u^2 \| nabla a \|^2$ plus $C integral a^2 \| nabla u \|^2$. Since $\| H \| lt.eq C D$, (3.52) yields, for a dimensional $theta' > 0$,
  #[#set math.equation(numbering: n => "(3.53)")
   $ \( 1 + theta' \) G lt.eq F + C integral u^2 #scale(x: 120%, y: 120%)[\(] \| nabla H \|^2 + D a^3 #scale(x: 120%, y: 120%)[\)] + C integral a^2 \| nabla u \|^2 \, quad G = integral u^2 \| nabla a \|^2 \, quad F = integral u^2 a^4 . $ <eq:growth-simons>]
  Applying (3.31) to $a u$, and using the curvature lower bound in (3.28) with sufficiently small tolerance, gives
  $ F lt.eq \( 1 + theta' \/ 2 \) G + C integral a^2 \| nabla u \|^2 . $
  Subtracting this from (3.53) controls both $G$ and $F$ by the remaining errors.
  ======= 3.3.1.3 Paying the mean-curvature and collar errors. <paying-the-mean-curvature-and-collar-errors.>
  It remains to control the errors in (3.53) without losing the small coefficient of $D^2$. For every center in this application there is one uniform sheet on $B_(4 S) \( z \)$. Fubini in (3.29) therefore gives
  $ integral u^2 \| nabla H \|^2 lt.eq C epsilon integral_(Sigma_g) chi^2 D^2 . $
  The averaging balls do not meet $X$. For each fixed point counted by the integral, its centers lie on one chart of area at most $C S^m$; the factor $S^(- m)$ cancels this bound. The ratio of the two weights is at most $e^(2 S \/ R)$, hence at most two for sufficiently large $R$. This explains why the constant multiplying $epsilon$ is independent of $S$. Furthermore $a^2 lt.eq C D$ implies $D a^3 lt.eq C sqrt(delta) D^2$. The cutoff cost is bounded by
  $ C_S N_R + C R^(- 2) integral_(Sigma_g) chi^2 a^2 lt.eq C_S N_R + epsilon' A_4 + C_(epsilon') R^(- 4) integral_(Sigma_g) chi^2 . $
  The discarded part of $A_4$, where $m_c eq.not 1$, is also $C_S N_R$ by (3.50). Choose $epsilon'$ small enough to absorb, then the tolerance in (3.29) and $delta$ small enough for the prescribed $epsilon_2$. Equation (3.49) proves (3.51). All integrations may first have compact support; the exponential weight, polynomial area bound, and uniform unit derivative bounds remove the additional cutoffs. Approximation of $a$ by $\( a^2 + epsilon^2 \)^(1 \/ 2)$ justifies its use as a test. ◻
]

From now on fix $epsilon_2$ sufficiently small relative to $C_D$ in (3.43), and make all the preceding parameter choices. Lower bounds on $t_min$ used below involve only the already fixed reach and interface constants. Lemma 20 permits us to enforce them by the final choice of $delta$.

===== 3.3.2 Gluing ambient and surface stability <gluing-ambient-and-surface-stability>

The curvature estimate leaves a cost proportional to $N_R$. To control it, stability must detect defect near $X$, where a regular surface test is unavailable. The ambient amplitude $q = 1 - v^2$ does this. Away from $X$, lifting the normal profile $G \( s \) = 1 - g \( s \)^2$ supplies the stronger surface mass $S_0$. We now combine those amplitudes into one physical test.

Combining ambient and transition-set tests is also part of the free-boundary methods of #cite(label("CFFS2025"), form: "prose") and the smooth quartic three-dimensional argument of #cite(label("LLWWW2026"), form: "prose") Sections 3 and 5. The latter uses a sum of transition-profile derivatives and a linear joining to the ambient amplitude. A related geometric stability inequality in #cite(label("CFFFS2026"), form: "prose") Proposition 4.7 uses a weighted ground-state identity on the normal parametrizing manifold. Here we use a square root of a sum of squares and retain its exact gradient variance. The following argument supplies the required estimates on our six-dimensional interface.

The cancellation is already visible for two nonnegative Lipschitz functions $xi_0 \, xi_1$ on a Euclidean open set. Wherever $xi_0^2 + xi_1^2 > 0$, differentiation gives

$ \| nabla xi_0 \|^2 + \| nabla xi_1 \|^2 - lr(|nabla sqrt(xi_0^2 + xi_1^2)|)^2 = frac(\| xi_0 nabla xi_1 - xi_1 nabla xi_0 \|^2, xi_0^2 + xi_1^2) . $

The identity holds almost everywhere with value zero on their common zero set. If $xi_0 = h cos theta$ and $xi_1 = h sin theta$ for locally Lipschitz $h gt.eq 0$ and $0 lt.eq theta lt.eq pi \/ 2$, the square root is just $h$ and the variance is $h^2 \| nabla theta \|^2$. Thus it cancels the cost of changing amplitudes when the profiles agree. In the construction below, $q$ and the lifted $G$ agree to a controlled error on the short normal segments called accurate. The other short segments are charged to defect mass, while the long segments have exponentially small tails. This is a change from an ambient description to a surface description near bad zeros. The interpolation between neighboring sheet amplitudes in Section 1 is a separate construction.

#thm([Lemma 3.21.])[
  (Uniform gluing).  #emph[Fix $0 < tau lt.eq .001$ among the interface tolerances, before the final choice of $delta$, and choose the preceding data with this tolerance. There exist $L_0 \, t_(*) \, c_0 > 0$ and $R_1 \, C < oo$ with the following property. Let $f : \[ t_min \, oo \) arrow.r \( 0 \, 1 \]$ be nonincreasing and locally Lipschitz, equal to one on $\[ t_min \, t_(*) \]$, and a positive multiple of $e^(- kappa t \/ 2)$ for sufficiently large $t$. Suppose also that $\| f' \| lt.eq C_f^(\( 0 \)) f$ for some finite constant. Then for every center and $R gt.eq R_1$, writing $s_X = "dist" \( dot.op \, X \)$, 
#[#set math.equation(numbering: n => "(3.54)")
 $ & \( 1 - tau \) integral_(Sigma_g ∩ { s_X gt.eq 4 L_0 }) S_0 f \( d \)^2 chi^2 + c_0 N_R\
 & #h(2em) lt.eq \( 1 + tau \) integral_(Sigma_g) chi^2 f' \( d \)^2 \| nabla_Sigma d \|^2 + C / R^2 integral_(Sigma_g) chi^2 f \( d \)^2 . $ <eq:M3>]

 In particular $c_0$ is independent of $f$. The constants $L_0 \, t_(*) \, R_1 \, C$ can also be chosen independently of $f$; its stated tail and slope conditions are used only to justify exhaustion.]
] <lem:growth-gluing>

#proof[
  If $X$ is empty, apply (3.31) to $chi f \( d \)$ and use Young’s inequality. Suppose henceforth that $X$ is nonempty. We construct the test, reserve positive mass for its transition region, and estimate its derivatives. The $f'$ energy and the spatial-weight cost remain on the right side of (3.54). After estimating those terms and using the mass reserve, only the two partition terms remain to be canceled by the variance identity.
  ======= 3.3.2.1 Construction: a collar on which $f = 1$. <construction-a-collar-on-which-f1.>
  The base tangent-ball estimate in Corollary 27 and (2.10) give a uniform bound
  #[#set math.equation(numbering: n => "(3.55)")
   $ sup_(Sigma_g ∩ { s_X lt.eq 10 L_0 }) d lt.eq T \( delta \, L_0 \) < oo . $ <eq:growth-bounded-collar-reach>]
  Indeed a nearby $x in X$ gives $D \( z \) gt.eq c delta e^(- C \( 10 L_0 + 1 \))$, whereas a base tangent ball gives $D \( z \) lt.eq C_Gamma \/ d \( z \)$ when $d$ is large. The same bound, with a changed constant, applies to the #emph[source] reach $d \( z \)$ of a plateau pair $\( z \, y \)$ whenever $s_X \( y \) lt.eq 10 L_0$, because (3.24) gives $D \( y \) lt.eq C_Gamma \/ d \( z \)$. Choose $t_(*)$ to cover both bounds. This choice will also be used in the multiplier argument.
  Choose Lipschitz functions on physical space
  $ theta = theta \( s_X \/ L_0 \) \, #h(2em) theta = 0 med \( s_X lt.eq 2 L_0 \) \, #h(2em) theta = pi \/ 2 med \( s_X gt.eq 3 L_0 \) \,\
\| nabla theta \| lt.eq C \/ L_0 \, #h(2em) alpha_0 = cos theta \, #h(2em) b = sin theta . $
  On $Sigma_g$ choose $mu = 0$ for $s_X lt.eq L_0 \/ 2$ and $mu = 1$ for $s_X gt.eq L_0$, with $\| nabla mu \| lt.eq C \/ L_0$, and put $p_0 \( z \) = mu \( z \) f \( d \( z \) \)$. Use the normal immersion $Phi \( z \, s \) = z + s nu \( z \)$ and the even curvature cutoff $beta \( z \, s \)$ from Lemma 30, supported strictly inside $\| s \| a < alpha$ and equal to one for $\| s \| a lt.eq alpha \/ 2$. The parameter $alpha$ is fixed small in terms of $tau$ before shrinking $delta$. The physical ambient function and the lifted functions are
  $ xi_0 \( x \) = q \( x \) chi \( x \) alpha_0 \( x \) \, #h(2em) xi_(z \, s) \( x \) = G \( s \) beta \( z \, s \) chi \( x \) b \( x \) p_0 \( z \) \, quad x = Phi \( z \, s \) . $
  They define the single physical test $F = \( sum_j xi_j^2 \)^(1 \/ 2)$. Here the sum includes $xi_0$ and every nonzero lifted preimage of the physical point; no global numbering of the sheets is chosen.
  ======= 3.3.2.2 Admissibility and the full variance. <admissibility-and-the-full-variance.>
  The immersion need not be globally injective. To justify the physical test without choosing global sheet labels, first cap $\| s \|$ and physical support by smooth cutoffs. The nonzero lifted support is then compact inside the immersion domain: $\| z \|$ is bounded because both $\| x \|$ and $\| s \|$ are bounded, and $mu$ keeps the bases away from $X$. Fibers are discrete by local invertibility and finite by compactness. Around any physical point finitely many local inverses therefore contain all nonzero branches. A smaller neighborhood has no additional branch arriving from elsewhere in the compact support. Thus $F$ is locally Lipschitz, including where it vanishes, and is a compactly supported stability test. Almost everywhere,
  #[#set math.equation(numbering: n => "(3.56)")
   $ sum_j \| nabla xi_j \|^2 - \| nabla F \|^2 = min_(w in bb(R)^n) sum_j \| nabla xi_j - xi_j w \|^2 = : cal(V) gt.eq 0 . $ <eq:growth-variance>]
  The potential terms add exactly, even where $3 v^2 - 1$ is negative. Consequently the physical quadratic form is the sum of the ambient and lifted forms #emph[minus] $integral cal(V)$. No partition of a chart is introduced. The area formula accounts for every lifted preimage. Moreover the variance of any subfamily is a lower bound for $cal(V)$, since each omitted square is nonnegative before minimization.
  For each fixed normal cap remove the spatial cap, and then remove the normal cap. For the lifted terms this is dominated convergence in (3.30), using
  $ chi \( Phi \( z \, s \) \) \/ chi \( z \) lt.eq e^(\| s \| \/ R) \, #h(2em) \| nabla d \| lt.eq C exp #scale(x: 120%, y: 120%)[\(] C sqrt(log \( K \( d \) + 1 \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) K \( d \) lt.eq 1 + C d . $
  For each fixed $f$ the products $\| f' \| thin \| nabla d \|$ are bounded, and normal cutoff costs are polynomials in $\| s \|$ times $G \( s \)^2$. Polynomial good-area growth and the exponential spatial weight dominate the remaining factors. For the subtracted variance retain only the lower bounds on fixed short segments used below, and apply Fatou’s lemma. This proves that the same stability comparison is valid after both caps are removed. The dominating bound here may depend on $f$; it is used only for convergence. No coefficient in the quantitative estimates below uses its value.
  ======= 3.3.2.3 Claim 1: a positive mass reserve independent of $f$. <claim-1-a-positive-mass-reserve-independent-of-f.>
  The favorable terms will pay for the transition collar while retaining the full stated strength outside it. Define
  $ S_(upright("sw")) = Sigma_g ∩ { 3 L_0 \/ 2 lt.eq s_X lt.eq 4 L_0 } \, #h(2em) D_(upright("sw")) = integral_(S_(upright("sw"))) chi^2 D . $
  Disjoint fixed small balls about the unit-separated bad net yield $c_delta N_R$ from the term $integral q^3 D chi^2 alpha_0^2$: at their centers $q = 1$ and $D gt.eq delta$, and unit regularity and (2.10) give uniform lower bounds in the balls. These balls are disjoint from a fixed small normal tube over $S_(upright("sw"))$. That tube is injective: small defect gives a single graph in a uniform fixed neighborhood of every base, and any overlapping short normal segments must be in such a chart, where the normal map is injective. In this tube the ambient term gives
  $ c integral_(S_(upright("sw"))) chi \( z \)^2 alpha_0 \( z \)^2 D \( z \) - C / L_0 D_(upright("sw")) - o_(R arrow.r oo) \( 1 \) D_(upright("sw")) . $
  Here $q^3 D$ is uniformly comparable to $D \( z \)$, and freezing $alpha_0$ and $chi$ accounts for the two errors.
  The lifted potential and Jacobian terms of (3.30) provide the complementary positive mass with $b \( z \)^2$, and on $s_X gt.eq 4 L_0$ provide $\( 1 - tau' \) sigma integral S_0 f^2 chi^2$, where $tau' > 0$ is as small as prescribed. To check the freezing error, on the cutoff tube
  $ \| partial_s J \| lt.eq C \( 1 + \| s \| \)^n D \( z \) \, #h(2em) J = det \( 1 + s A \) \, $
  because $\| H \| lt.eq C D$ and $a^2 lt.eq C D$; expand the determinant in powers of $s A$. The nonpositive potential term can be restricted to the fixed finite segments used to extract $I_P$. Freezing $b^2 \, chi^2$ on these terms therefore costs at most $C L_0^(- 1) D_(upright("sw")) + o_R \( 1 \) D_(upright("sw"))$ on $S_(upright("sw"))$. Outside $S_(upright("sw"))$ any change of $b$ between a supported base and its image requires
  $ \| s \| gt.eq L_0 \/ 2 \, #h(2em) s_X \( z \) lt.eq 3 L_0 + \| s \| . $
  Equation (3.50) and exponential decay of $G$ bound the resulting integrals by $o_(L_0) \( 1 \) N_R$, uniformly for large $R$. The curvature cutoff errors $C e^(- c \/ a) f^2$ are absorbed by the available $I f^2$ on shrinking $delta$. Here is an explicit mass reserve. Let $c_(upright("amb")) > 0$ denote the ambient switch coefficient, take the pure-sheet loss below $tau \/ 16$, and fix
  $ 0 < c_(upright("sw")) lt.eq min { c_(upright("amb")) \/ 4 \, thin tau sigma c_I \/ 32 } . $
  On $S_(upright("sw")) ∩ { s_X < 4 L_0 }$ the complementary ambient and sheet gains supply at least $2 c_(upright("sw")) \( alpha_0^2 + b^2 \) D = 2 c_(upright("sw")) D$. On $s_X = 4 L_0$, retain $\( 1 - tau \/ 2 \) sigma S_0 f^2$ for exterior strength. Since $b = f = 1$, the spare sheet gain is at least $\( 7 tau \/ 16 \) sigma S_0 gt.eq \( 7 tau sigma c_I \/ 32 \) D$, which also pays $2 c_(upright("sw")) D$. This leaves $c_(upright("sw")) D_(upright("sw"))$ for errors and the desired exterior strength after the remaining tolerance losses. This treatment includes the level set $s_X = 4 L_0$, even if it has positive surface area. We have therefore reserved positive fixed multiples of both $D_(upright("sw"))$ and $N_R$; their coefficients were chosen before $f$. The next two claims show that this reserve suffices.
  ======= 3.3.2.4 Claim 2: every derivative cost except the partition terms. <claim-2-every-derivative-cost-except-the-partition-terms.>
  For clarity we expand every differentiated amplitude in the lifted gradient term. Let $B_s = \( upright("Id") + s A \)^(- 1)$ on tangent vectors and write $beta = beta_0 \( s a \)$ with $beta_0$ even. Almost everywhere,
  $ nabla beta = beta'_0 \( s a \) #scale(x: 120%, y: 120%)[\(] a nu + s B_s nabla_Sigma a #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| nabla beta \| lt.eq C_alpha \( 1 + \| s \| \) . $
  This includes the derivative of $a$; its weak gradient is uniformly bounded by the unit derivative estimates on good charts. At $a = 0$ the derivative of this cutoff is zero almost everywhere. All vectors in the following expansion are physical vectors at $x = Phi \( z \, s \)$:
  $ V_f & = chi b beta mu f' \( d \) B_s nabla_Sigma d \, & V_mu & = chi b beta f B_s nabla_Sigma mu \,\
V_beta & = chi b mu f nabla beta \, & V_chi & = b beta mu f nabla chi \,\
V_b & = chi beta mu f nabla b . & $
  Their sum is $nabla \( chi b beta mu f \)$. Keep $\| V_b \|^2 + 2 V_b dot.op V_chi$ untouched, together with the ambient partition terms. These are the following ambient and lifted densities, respectively:
  #[#set math.equation(numbering: n => "(3.57)")
   $ & chi^2 q^2 \| nabla alpha_0 \|^2 + 2 chi q^2 alpha_0 nabla chi dot.op nabla alpha_0 \,\
 & G^2 J p_0^2 beta^2 #scale(x: 120%, y: 120%)[\(] chi^2 \| nabla b \|^2 + 2 chi b nabla chi dot.op nabla b #scale(x: 120%, y: 120%)[\)] . $ <eq:M4>]
  For a fixed arbitrarily small $epsilon > 0$, all other squares and crosses are bounded by
  $ \( 1 + C epsilon \) \| V_f \|^2 + C_epsilon #scale(x: 120%, y: 120%)[\(] \| V_mu \|^2 + \| V_beta \|^2 + \| V_chi \|^2 #scale(x: 120%, y: 120%)[\)] + 2 V_b dot.op \( V_f + V_mu + V_beta \) . $
  The vector $V_b$ differentiates the physical partition. Its displayed square and its cross with $V_chi$ must keep their signs for the later cancellation; all other terms can be estimated now. Every lifted integral below has the factor $G^2 J$. The $V_f$ square uses the inverse metric bound $1 + O \( alpha \)$ and the normal integral $sigma + O \( R^(- 1) \)$. The $V_chi$ square uses $\| nabla chi \| lt.eq chi \/ R$. The $V_mu$ square is a long tail: $s_X \( z \) lt.eq L_0$ on its support, while $b \( x \) eq.not 0$ forces $s_X \( x \) > 2 L_0$, hence $\| s \| gt.eq L_0$.
  For $V_beta$, the derivative support has $\| s \| a gt.eq c_alpha$. Polynomial factors in $\| s \|$ therefore give a normal integral at most $C_alpha e^(- c_alpha \/ a)$. Freeze $b \( x \)^2$ at $b \( z \)^2$ as above: the frozen contribution is $C_alpha e^(- c_alpha \/ a) f^2 b \( z \)^2 chi \( z \)^2$, absorbed by the sheet gain since $e^(- c_alpha \/ a) lt.eq o_delta \( 1 \) a^2 lt.eq o_delta \( 1 \) D$. The freezing error on $S_(upright("sw"))$ is at most $C L_0^(- 1) D_(upright("sw"))$; off it, the error is a long tail bounded by $o_(L_0) \( 1 \) N_R$.
  #emph[Cross terms with the partition derivative.] Only the three displayed crosses against $V_b$ remain. If $V_b dot.op V_f eq.not 0$, then $f' \( d \( z \) \) eq.not 0$ and $x$ is in the physical switch. The collar plateau gives $s_X \( z \) > 10 L_0$, so $\| s \| > 7 L_0$. Young’s inequality pays $epsilon \| V_f \|^2$ from the exact derivative energy and leaves $C_epsilon \| V_b \|^2$ on this long-ray support. It is a tail controlled by $f lt.eq 1$, with no bound on $f'$ required. The cross $V_b dot.op V_mu$ is a long tail for the same support reason as the $V_mu$ square. Finally, on $S_(upright("sw"))$ the absolute $V_b dot.op V_beta$ integral is at most $C L_0^(- 1) integral_(S_(upright("sw"))) chi^2 e^(- c_alpha \/ a) lt.eq C L_0^(- 1) D_(upright("sw"))$; off that set it is again a long tail. All other crosses, including those between $V_f$ and $V_beta$, were included in the first Young bound.
  Consequently the costs apart from (3.57) are at most
  $ \( 1 + tau' \) sigma integral_(Sigma_g) chi^2 f' ""^2 \| nabla d \|^2 + C_(tau') R^(- 2) (integral_(Sigma_g) chi^2 f^2 + C_(L_0) N_R) + o_(L_0) \( 1 \) \( D_(upright("sw")) + N_R \) \, $
  plus arbitrarily small fractions of the favorable mass already retained. Every occurrence of $f'$ has been assigned to its displayed derivative energy. All remaining bounds use $0 lt.eq f lt.eq 1$, so these constants are independent even of the finite slope bound $C_f^(\( 0 \))$, as well as of the later bridge parameters.
  ======= 3.3.2.5 Claim 3: cancellation of the partition costs. <claim-3-cancellation-of-the-partition-costs.>
  The preceding estimates have assigned every occurrence of $f'$ to its exact derivative energy. We must now cancel the two signed costs in (3.57), rather than spend a fixed amount of the surface mass on them. The required estimate is
  #[#set math.equation(numbering: n => "(3.58)")
   $ integral #scale(x: 120%, y: 120%)[\(] upright("the two densities in ") upright("(3.57)") #scale(x: 120%, y: 120%)[\)] - integral cal(V) lt.eq o_(L_0) \( 1 \) \( D_(upright("sw")) + N_R \) . $ <eq:M5>]
  The first integral includes the lifted measure for the second density. The error is uniform for $R$ sufficiently large and for the entire class of $f$ in the lemma. We supply the details, including the order of the logarithmic cutoffs. We will cancel the ambient partition cost against one lifted cost at each physical point, so the choice of that lifted preimage must be unique. The remaining short-ray costs will be bounded by defect mass, and long rays by the bad-net mass.
  #emph[Short rays and uniqueness.] Let $cal(W) = { 2 L_0 < s_X < 3 L_0 }$, choose $M = C_1 log L_0$, and temporarily fix a small $xi > 0$. A preimage $\( z \, s \)$ of $x in cal(W)$, $\| s \| lt.eq M$, is called accurate if
  $ B_z \( s \) := D \( z \) e^(\( 2 sqrt(2) + xi \) \| s \|) lt.eq b_xi \, $
  where the fixed positive $b_xi$ will be small. For $L_0$ large, $M < L_0 \/ 2$, so every such base lies in $S_(upright("sw"))$ and $p_0 = 1$. On an accurate segment the diffuse estimate with exponential loss $xi \/ 2$, and $T p = - nabla D \/ 2$, imply
  #[#set math.equation(numbering: n => "(3.59)")
   $ \| p \( x \) - nu \( z \) \| + \| U \( x \) - s \| lt.eq C_xi D \( z \) e^(\( 2 sqrt(2) + xi \/ 2 \) \| s \|) = C_xi B_z \( s \) e^(- xi \| s \| \/ 2) . $ <eq:growth-accurate-ray>]
  In detail, along the segment $\| T nu \| lt.eq C D + C sqrt(D) thin \| p - nu \|$, $\| p \( z \) - nu \( z \) \| lt.eq D \( z \)$, and $integral_0^(\| s \|) sqrt(D \( z + t nu \)) thin thin upright(d) t lt.eq C_xi sqrt(b_xi)$. Gronwall followed by integration proves (3.59). Also $\| s \| a \( z \) lt.eq C sqrt(b_xi) \| s \| e^(- \( sqrt(2) + xi \/ 2 \) \| s \|)$, so $beta = 1$ if $b_xi$ is sufficiently small.
  There is at most one accurate preimage of a physical point. Suppose $\( z \, s \)$ and $\( tilde(z) \, tilde(s) \)$ are both accurate. Comparing each signed depth with $U \( x \)$ first gives $\| s - tilde(s) \| lt.eq C_xi b_xi$ and comparability of their residual exponentials. Comparing their normals with $p \( x \)$ and using $z = x - s nu \( z \)$ next gives
  $ \| z - tilde(z) \| lt.eq C_xi b_xi \( 1 + \| s \| \) e^(- xi \| s \| \/ 2) lt.eq C'_xi b_xi . $
  Choose $b_xi$ so that these bases belong to one uniform small graph. On it $\| A \| lt.eq C sqrt(D \( z \))$ by local defect comparability. Tangential projection of the equality of the two normal images yields
  $ \| "proj"_(T_z Sigma) \( tilde(z) - z \) \| lt.eq C \| tilde(s) \| sqrt(D \( z \)) thin \| tilde(z) - z \| . $
  The left side is at least $.9 \| tilde(z) - z \|$, whereas the coefficient on the right is at most $C_xi sqrt(b_xi) < .9$. Thus the bases and depths coincide. This proof uses signed depths and oriented normals and therefore covers preimages from opposite sides.
  #emph[Cancellation along the unique accurate ray.] At an accurate pair, $nabla s = nu \( z \)$ in the inverse normal chart, and (3.59) gives
  $ \| q \/ G - 1 \| + \| nabla log \( G \/ q \) \| lt.eq C_xi B_z . $
  Retaining only the ambient function and this lifted function in (3.56), the variance is at least
  $ chi^2 frac(q^2 G^2, alpha_0^2 q^2 + b^2 G^2) lr(|nabla theta + alpha_0 b nabla log \( G \/ q \)|)^2 . $
  The two pure partition squares, in physical measure, equal $chi^2 \( q^2 b^2 + G^2 alpha_0^2 \) \| nabla theta \|^2$. For $A = q^2$, $B = G^2$, their coefficient minus the leading variance coefficient is exactly
  $ A b^2 + B alpha_0^2 - frac(A B, A alpha_0^2 + B b^2) = frac(alpha_0^2 b^2 \( A - B \)^2, A alpha_0^2 + B b^2) . $
  Expanding the variance and dropping its remaining negative square, then combining the two $nabla chi$ crosses, bounds the uncancelled cost by
  #[#set math.equation(numbering: n => "(3.60)")
   $ C_xi chi^2 G^2 B_z #scale(x: 120%, y: 120%)[\(] L_0^(- 1) + L_0^(- 2) + \( L_0 R \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <eq:growth-accurate-error>]
  There is no multiplicity factor for this cancellation, by the accurate pair uniqueness just proved. Other preimages can only increase the full variance.
  #emph[The remaining rays.] The cancellation has used at most one lifted branch at each physical point. We now bound every other partition cost by defect mass or by the bad-net mass. For inaccurate lifted preimages of depth at most $M$,
  $ G \( s \)^2 lt.eq C_xi D \( z \) e^(xi M) . $
  If an ambient point has no accurate preimage, select a closest zero. When its distance is at most $M$, that zero is regular and belongs to $S_(upright("sw"))$, since $X$ is more than $2 L_0$ away. Its ray is normal and inaccurate, whether or not it belongs to the curvature cutoff. Indeed an accurate full normal ray has $beta = 1$ by the bound on $\| s \| a \( z \)$ proved above. Its base in $S_(upright("sw"))$ has $mu = f = 1$, so it would supply an accurate lifted preimage, contrary to the case under consideration. The phase estimate (2.15), with exponent loss at most $xi \/ 2$, gives
  $ q \( x \)^2 lt.eq C_xi D \( z \) e^(2 xi M) . $
  This ambient integral is bounded using the area formula for the full normal map on $\| s \| lt.eq M$. One may restrict it to any measurable closest-point selection; the resulting integral is no larger than the integral over all eligible rays. The normal Jacobian is at most $C \( 1 + M \)^m$. Its critical images have zero volume by the area formula, so no inverse chart or unique nearest point is required for this estimate. Measurable selection exists since the zero set is closed and nearest points form a nonempty compact set locally.
  If the closest distance exceeds $M$, use phase decay and the volume bound in (3.50). For these long ambient tails use one fixed coarse exponent in (2.15), independently of $xi$; only the short-ray comparison above needs an exponent loss chosen in terms of $xi$. For lifted rays of depth greater than $M$, a contribution in $cal(W)$ requires $s_X \( z \) lt.eq 3 L_0 + \| s \|$; the same collar bound and the exponential tail of $G^2$ apply. Thus, for fixed dimensional $N$ and $c > 0$, independent of sufficiently small $xi$ and of $C_1$, all costs in this comparison are bounded by
  #[#set math.equation(numbering: n => "(3.61)")
   $ C_xi frac(\( 1 + M \)^N e^(2 xi M), L_0) D_(upright("sw")) + C_xi \( 1 + L_0 + M \)^N e^(- c M) N_R . $ <eq:growth-log-errors>]
  The Jacobian, the integration over depth, and derivatives of $beta$ only alter the fixed power $N$. Weight shifts cost $e^(2 \| s \| \/ R)$ and are absorbed in the tail exponent for all sufficiently large $R$.
  #emph[Fixing the logarithmic window.] The order of choices is now decisive. The defect threshold and its positive bad-mass coefficient $c_delta$ have already been fixed. Choose $C_1 > \( N + 3 \) \/ c$, then $xi > 0$ with $2 xi C_1 < 1 \/ 4$, then $b_xi > 0$ as above, and finally let $L_0$ be large. Both coefficients in (3.61) tend to zero; the first is bounded by a constant times $L_0^(- 3 \/ 4) \( 1 + log L_0 \)^N$ and the second by a constant times $L_0^(- 3) \( 1 + log L_0 \)^N$. They can therefore be absorbed by the already fixed positive multiples of $D_(upright("sw"))$ and $N_R$. This proves (3.58) with a fixed threshold $delta$.
  ======= 3.3.2.6 Conclusion of the gluing estimate. <conclusion-of-the-gluing-estimate.>
  Claim 1 supplies the positive reserve, Claim 2 leaves only the signed partition costs, and Claim 3 absorbs those costs with the variance. Stability of $F$ and division by $sigma$ therefore give (3.54). The remaining $C_(L_0) R^(- 2) N_R$ is absorbed for $R$ large; the interface tolerances and Young constants were chosen with room inside $tau$. This also proves the asserted uniformity in the center and in $f$. ◻
]

===== 3.3.3 A reach multiplier with a long plateau <a-reach-multiplier-with-a-long-plateau>

The letter $P_(*)$ below denotes the multiplier, and is unrelated to the fixed integration depth $P$ defining $I_P$. We now choose $f$ so that its derivative energy in (3.54) can be estimated by integrating the reach inequality. The plateau keeps this derivative away from the collar; a slow initial decay makes the multiplier flux there arbitrarily small. The subsequent power and exponential ranges supply the two different bounds needed for short and long reaches.

#thm([Lemma 3.22.])[
  (A weight and its reach multiplier).  #emph[Let $zeta_0 = .01$ and $k = 1.53$. Increase $t_min$, before fixing $delta$, so that $exp \( C \/ \( gamma t_min^gamma \) \) < 1.001$, where $C \, gamma$ dominate the errors in (3.22). For every finite $t_(*) gt.eq t_min$, every $epsilon_3 > 0$, and every $eta > 0$, there are $t_0 > t_(*)$ and a function $f$ as in Lemma 40 such that, with 
$ B_(*) \( t \) = 1 + C t^(- gamma) + zeta_0 upright(bold(1))_({ t gt.eq t_0 }) \, quad p_(*) \( t \) = exp integral_(t_min)^t frac(B_(*) \( s \), s) thin thin upright(d) s \, quad P_(*) \( t \) = frac(1, p_(*) \( t \)) integral_t^oo p_(*) \( s \) f' \( s \)^2 thin thin upright(d) s \, $

 one has $- P'_(*) = f' ""^2 + B_(*) P_(*) \/ t$ almost everywhere and 
#[#set math.equation(numbering: n => "(3.62)")
 $ t P_(*) \( t \) lt.eq .79 f \( t \)^2 #h(2em) \( t_min lt.eq t < t_0 \) \,\
P_(*) \( t \) lt.eq \( kappa \/ 4 + .001 \) f \( t \)^2 \, #h(2em) t^3 f \( t \)^2 lt.eq epsilon_3 #h(2em) \( t gt.eq t_0 \) \,\
sup_(\[ t_min \, t_(*) \]) P_(*) lt.eq eta . $ <eq:M6>]

 Moreover 
$ e^(- kappa t) lt.eq f \( t \)^2 lt.eq C_f e^(- kappa t) \, #h(2em) Psi \( t \) := integral_t^oo P_(*) \( s \) thin thin upright(d) s lt.eq C_f f \( t \)^2 $

 for a finite constant $C_f$ depending on the final construction.]
] <lem:growth-multiplier>

#proof[
  There are four ranges. A plateau protects the collar; a very slow power decay makes the multiplier flux on that plateau small; a faster power decay makes $t^3 f^2$ small; and the final exponential tail matches $E = e^(- kappa d)$. Take $t_s gt.eq t_(*)$ and use the continuous piecewise formula
  $ f \( t \) = cases(delim: "{", 1 \, & t lt.eq t_s \,, \( t \/ t_s \)^(- mu) \, & t_s < t < t_p \,, f \( t_p \) \( t \/ t_p \)^(- k) \, & t_p < t < t_e \,, f \( t_e \) e^(- kappa \( t - t_e \) \/ 2) \, & t gt.eq t_e .) $
  Here $0 < mu lt.double 1$, $t_p > t_s$, and $t_p < t_0 < t_e$. Corners cause no problem for locally Lipschitz tests or the multiplier identity. Set $F_0 = exp \( C \/ \( gamma t_min^gamma \) \) < 1.001$. For $s gt.eq t$,
  $ frac(p_(*) \( s \), p_(*) \( t \)) lt.eq F_0 \( s \/ t \)^(1 + zeta_0) . $
  ======= 3.3.3.1 The main power range and the exponential tail. <the-main-power-range-and-the-exponential-tail.>
  On the main polynomial bridge its polynomial contribution is therefore at most $F_0 A \/ t$ in $P_(*) \/ f^2$, where
  $ A = frac(k^2, 2 k - zeta_0) \, #h(2em) F_0 A < .77 . $
  The tail value $Q_e = P_(*) \( t_e \) \/ f \( t_e \)^2$ obeys
  $ Q_e lt.eq frac(kappa^2 \/ 4, kappa - \( 1 + zeta_0 + C t_e^(- gamma) \) \/ t_e) = kappa \/ 4 + o_(t_e arrow.r oo) \( 1 \) . $
  The same upper bound holds for $P_(*) \( t \) \/ f \( t \)^2$ for $t gt.eq t_e$. Propagating this terminal flux backwards along the polynomial range adds at most
  $ F_0 Q_e \( t_e \/ t \)^(1 + zeta_0 - 2 k) $
  to $P_(*) \/ f^2$. Its product with $t$ tends uniformly to zero on $\[ t_p \, t_0 \]$ as $t_e arrow.r oo$ with $t_0$ fixed, since $1 + zeta_0 - 2 k = - 2.05$. For $t_0 lt.eq t lt.eq t_e$, the total is at most $F_0 \( A \/ t_0 + Q_e \)$. This is less than $kappa \/ 4 + .001$ by first taking $t_0$ large and then $t_e$ large: the fixed factor costs less than $.000354$ since $kappa lt.eq sqrt(2)$, leaving a positive margin for the two vanishing errors. This proves both multiplier bounds on the main bridge and the tail.
  ======= 3.3.3.2 Small flux on the collar plateau. <small-flux-on-the-collar-plateau.>
  On the slow bridge there is no $zeta_0$ drift. Up to the factor $F_0$, the ratio $t P_(*) \/ f^2$ is bounded by
  $ mu / 2 #scale(x: 120%, y: 120%)[\(] 1 - \( t \/ t_p \)^(2 mu) #scale(x: 120%, y: 120%)[\)] + \( t \/ t_p \)^(2 mu) frac(t_p P_(*) \( t_p \), f \( t_p \)^2) . $
  Thus it remains below $.79$, and its value at $t_s$ can be made as small as desired by taking $mu$ small and then $t_p \/ t_s$ large. On the plateau $t P_(*) \( t \) lt.eq F_0 t_s P_(*) \( t_s \)$, proving the arbitrarily small compact flux. More explicitly, require the terminal contribution to $t P_(*) \/ f^2$ on $\[ t_p \, t_0 \]$ to be at most $.005$. The main, slow, and plateau ranges then have the common upper bound $F_0^2 \( F_0 A + .005 \) < .775 < .79$, and
  $ sup_(\[ t_min \, t_(*) \]) P_(*) lt.eq F_0^2 / t_min (mu / 2 + .775 \( t_s \/ t_p \)^(2 mu)) . $
  All these choices can be made before selecting $t_0 \, t_e$, since the later terminal contribution can be required to be smaller than any prescribed positive error on $\[ t_min \, t_p \]$.
  ======= 3.3.3.3 Completing the choices. <completing-the-choices.>
  The strict inequality $2 k > 3$ supplies the last decay requirement: after $t_p$, $t^3 f \( t \)^2$ decreases as $t^(3 - 2 k)$. Choose $t_0$ large enough to put it below $epsilon_3$, in addition to the preceding lower bounds. Choose $t_e$ afterwards; on its exponential tail the same quantity is decreasing once $t_e > 3 \/ kappa$. All the required bounds are simultaneous. Finally $- f' \/ f lt.eq k \/ t < kappa \/ 2$ before $t_e$, after increasing $t_min$. Hence $f^2 e^(kappa t)$ is nondecreasing up to $t_e$ and constant thereafter, proving both exponential comparisons. The primitive estimate follows on the tail by integration and on the remaining compact interval by positivity of $f$. ◻
]

===== 3.3.4 Integrating the reach inequality and paying for the feet <integrating-the-reach-inequality-and-paying-for-the-feet>

There are two kinds of cost to compare with the surface mass in (3.54): a source at the point where the reach is differentiated, and a positive charge at a receiving foot of a plateau contact. We estimate the local sources first, then integrate the inequality and transfer the foot charges using their multiplicity-one bound.

======= 3.3.4.1 Local source costs. <local-source-costs.>

Choose the constants in (3.22) so that $B_(*)$ dominates its drift. On nonplateau branches with $d < t_0$, (3.62) bounds the multiplied curvature source by $.80 f^2 a^2$, after increasing $t_min$ and making the already fixed reach tolerance small. On $d gt.eq t_0$, if $a d lt.eq c_2$ for a sufficiently small fixed $c_2 > 0$, the gradient lower bound in (3.22) gives

$ \( 1 + eta_0 + C d^(- gamma) \) a^2 d lt.eq zeta_0 frac(\| nabla d \|^2, d) . $

This is paid for by the additional drift in $B_(*)$. If $a d > c_2$, the multiplied source is instead at most

$ C f^2 a^2 d lt.eq C epsilon_3 a^2 d^(- 2) lt.eq C_(c_2) epsilon_3 a^4 . $

Plateau branches have no such curvature source. Their outgoing source in (3.23) satisfies

$ G_1 P_(*) \| H \| lt.eq .13 f^2 I . $

On the early range use $P_(*) \/ f^2 lt.eq .79 \/ t_min$; on the late range use (3.62) and (3.48). The limiting late coefficient is $\( kappa \/ 4 \) G_1 \/ \( 2 sqrt(2) \) = 1 \/ 8$, strictly below $.13$.

======= 3.3.4.2 The weak integration and its cutoff errors. <the-weak-integration-and-its-cutoff-errors.>

Let $m_0$ be an exterior Lipschitz cutoff, zero for $s_X lt.eq 5 L_0$ and one for $s_X gt.eq 6 L_0$, or identically one if $X$ is empty. Multiply the measure reach inequality by $P_(*) \( d \) m_0 chi^2$. For its absolutely continuous part, write $Delta d lt.eq A + B \| nabla d \|^2 \/ d$. Integration by parts and $- P'_(*) = f' ""^2 + B_(*) P_(*) \/ d$ give

#[#set math.equation(numbering: n => "(3.63)")
 $ & integral m_0 chi^2 f' ""^2 \| nabla d \|^2 + integral m_0 chi^2 \( B_(*) - B \) P_(*) frac(\| nabla d \|^2, d)\
 & #h(12mm)  lt.eq integral A P_(*) m_0 chi^2 + integral P_(*) nabla d dot.op nabla \( m_0 chi^2 \) . $ <eq:growth-multiplier-integration>]

The nonpositive singular part of $Delta d$ has the favorable sign. Nonnegative compactly supported Lipschitz tests are valid by uniform approximation and convergence of their weak gradients; locally $d$ is semiconcave and $nabla d$ is bounded. Chain rules apply almost everywhere across the finitely many coefficient corners. Since $f' = 0$ on the whole collar $s_X lt.eq 10 L_0$, the first integral in (3.63) is precisely the gradient integral in (3.54).

The cutoff derivative in (3.63) is bounded as follows. The part with $nabla m_0$ costs

$ C_(delta \, L_0) sup_(\[ t_min \, t_(*) \]) P_(*) thin N_R $

by (3.21) and (3.55). On the other part use $nabla Psi \( d \) = - P_(*) \( d \) nabla d$ and integrate once more:

$ integral m_0 P_(*) nabla d dot.op nabla chi^2 = integral Psi \( d \) #scale(x: 120%, y: 120%)[\(] m_0 Delta_Sigma chi^2 + nabla m_0 dot.op nabla chi^2 #scale(x: 120%, y: 120%)[\)] . $

For $r_c = sqrt(1 + \| x - x_c \|^2)$, convexity of $r_c$ gives the one-sided ambient bound $nabla^2 chi^2 lt.eq C R^(- 2) chi^2 upright("Id")$. Its tangential trace and $Delta_Sigma x = - H nu$ therefore give

$ Delta_Sigma chi^2 lt.eq C R^(- 2) chi^2 + C R^(- 1) D chi^2 . $

Together with the primitive bound, the cutoff derivative is at most

#[#set math.equation(numbering: n => "(3.64)")
 $ & C_(delta \, L_0) sup_(\[ t_min \, t_(*) \]) P_(*) thin N_R + C_f R^(- 2) integral_(Sigma_g) chi^2 f^2\
 & quad + C_f R^(- 1) integral_({ s_X gt.eq 4 L_0 }) chi^2 D f^2 + C_(delta \, L_0 \, f) R^(- 1) N_R . $ <eq:growth-spatial-error>]

Exhaustion of these identities is justified by the same exponential estimates as in the gluing lemma. In particular no sign of a second derivative of $m_0$ is required.

======= 3.3.4.3 Incoming positive charges. <incoming-positive-charges.>

The local sources and the cutoff errors have now been accounted for. It remains to pay the mean-curvature term at a second contact point. We account for the positive foot charge of every selected plateau pair $\( z \, y \)$. Choose a measurable active branch, selecting a plateau whenever one is available. First the part $d \( z \) > sqrt(R)$ costs $o \( K \( R \) R^(m - 4) \)$ directly at its source. Indeed $P_(*)$ is eventually bounded by $C_f e^(- kappa d)$; the sources in (3.22)–(3.23) and the bound (3.21) grow at most polynomially in $d$, while the tangent-ball bound controls the foot mean curvature by $C \/ d$. The good weighted area is bounded by (3.49). Thus this error is at most $C_f e^(- c sqrt(R)) K \( R \) R^m$ after altering $c > 0$.

On the remaining pairs $\| z - y \| lt.eq d \( z \) lt.eq sqrt(R)$, so $chi \( z \)^2 \/ chi \( y \)^2 lt.eq e^(2 \/ sqrt(R)) = 1 + o \( 1 \)$ uniformly in the center. If $s_X \( y \) lt.eq 10 L_0$, the source reach is at most $t_(*)$ by (3.55), and $z$ is in a fixed bounded enlargement of $X$. Its entire cost is

$ C_(delta \, L_0 \, t_(*)) sup_(\[ t_min \, t_(*) \]) P_(*) thin N_R \, $

where the coefficient is fixed before $f$ is constructed. For every other receiving foot apply (3.24). Its selected positive charge has inverse multiplicity at most one and area factor

$ J_(upright("foot")) = frac(\| det \( 1 + ell A_(N_y) \( y \) \) \|, s) lt.eq C_Gamma \, #h(2em) d \( y \) lt.eq d \( z \) \, #h(2em) ell = d \( z \) \/ G_1 . $

On $d \( z \) < t_0$, its cost is at most $.14 chi \( y \)^2 f \( d \( y \) \)^2 I \( y \)$ by choosing $t_min$ large after the fixed bound $C_Gamma$. On $d \( z \) gt.eq t_0$, if $a \( y \) d \( z \) lt.eq c_3$ with sufficiently small fixed $c_3$, the improved area factor is less than $1.05$. Equations (3.62) and (3.48), monotonicity of $f$, and the weight ratio then give the same $.14$ bound. Its limiting coefficient is $1.05 \/ 8 = .13125$, leaving strict room. If instead $a \( y \) d \( z \) > c_3$, use $H_(N_y) \( y \)_(+) lt.eq C \/ d \( z \)$ and $d \( z \)^3 f \( d \( z \) \)^2 lt.eq epsilon_3$ to bound the transferred cost by

$ C_(Gamma \, c_3) epsilon_3 chi \( y \)^2 a \( y \)^4 . $

Every foot outside the bounded-collar case lies in $s_X > 10 L_0$, hence in the region of full strength in (3.54). The count of positive charges, not a two-sided unoriented count, is what permits the single coefficient $.14$.

======= 3.3.4.4 The numerical reserve. <the-numerical-reserve.>

At a given surface point the selected reach branch contributes either a nonplateau source or a plateau source. It may also receive a positive charge, but the transfer counts that charge at most once. After factoring $chi^2 f^2$, the combined costs are

$ upright("selected local branch") & upright("local and incoming costs")\
upright("nonplateau") & .80 a^2 + .14 I\
upright("plateau") & .27 I . $

A point receiving only a charge has a smaller cost. For $tau lt.eq .001$, (3.48) implies

#[#set math.equation(numbering: n => "(3.65)")
 $ \( 1 - tau \) frac(a^2 + I, 2) - \( 1 + tau \) \( .80 a^2 + .14 I \) & gt.eq .05 I \,\
\( 1 - tau \) frac(a^2 + I, 2) - \( 1 + tau \) .27 I & gt.eq .22 I . $ <eq:growth-numerical-margin>]

For example the first left side is at least $\[ .35936 - .3013 \/ .999 \] I > .057 I$ at the worst allowed tolerance. Thus the sharp comparison $I gt.eq .999 a^2$ is essential here.

Combine (3.54) and (3.63), use (3.65) and $I gt.eq c_I D$, and absorb the two $R^(- 1)$ terms in (3.64) after $f$ is fixed. Choose the compact multiplier flux so small that all fixed collar costs are absorbed by $c_0 N_R$. This proves

#[#set math.equation(numbering: n => "(3.66)")
 $ c_4 (N_R + integral_({ s_X gt.eq 4 L_0 }) chi^2 D f^2) lt.eq epsilon_4 A_4 + C_f R^(- 2) integral_(Sigma_g) chi^2 f^2 + C_f K \( R \) R^(m - 4) . $ <eq:M7>]

For example, after taking the compact flux small enough to spend at most $c_0 N_R \/ 4$ and then absorbing the $R^(- 1)$ terms, one may use $c_4 = min { c_0 \/ 4 \, .02 c_I } > 0$. This constant is fixed by the gluing mass and numerical margins and is independent of $f$. The coefficient $epsilon_4$ is any prescribed positive number: choose $epsilon_3$ in Lemma 41 after fixing $c_4$ and the preceding source constants. The terms denoted $C_f$ may then be large, but remain fixed as $R$ grows.

===== 3.3.5 Closure of the estimate <closure-of-the-estimate>

We have estimated curvature by a small multiple of the squared defect, and we have estimated the first defect moment weighted by $f^2$. The remaining step is to connect these estimates. The integral comparison (3.43) reduces squared defect and interaction to curvature and $D E$. Since $E lt.eq f^2$, the latter term is paid by (3.66). We perform this absorption before allowing the final comparison constant $C_f$ to enter the inverse-square cutoff error.

Set $Z_2 = integral_(Sigma_g) chi^2 \( D^2 + E^2 \)$ and $V_R = K \( R \) R^(m - 4)$. Equations (3.43) and (3.51), with $epsilon_2 C_D$ small, imply

#[#set math.equation(numbering: n => "(3.67)")
 $ A_4 + Z_2 + N_R lt.eq C' (N_R + integral_(Sigma_g) chi^2 D E + V_R) . $ <eq:growth-preclosure>]

The constant $C'$ is fixed before constructing $f$. Since $E lt.eq f^2$ and the good collar has weighted area at most $C_(L_0) N_R$,

$ integral_(Sigma_g) chi^2 D E lt.eq integral_({ s_X gt.eq 4 L_0 }) chi^2 D f^2 + C_(L_0) N_R . $

Choose $epsilon_4$ in (3.66) small in terms of $C' \, c_4 \, C_(L_0)$. Substitution in (3.67) absorbs the resulting multiple of $A_4$. The remaining inverse-square term satisfies, for any $eta > 0$,

$ C_f R^(- 2) integral_(Sigma_g) chi^2 f^2 lt.eq C'_f R^(- 2) integral_(Sigma_g) chi^2 E lt.eq eta integral_(Sigma_g) chi^2 E^2 + C_(f \, eta) R^(- 4) integral_(Sigma_g) chi^2 lt.eq eta Z_2 + C_(f \, eta) V_R . $

Take $eta$ small enough for the last absorption. This proves (3.47) and Proposition 38. Every shift of a weight above was controlled by the Lipschitz bound $\| nabla log chi \| lt.eq R^(- 1)$; consequently none of the constants depends on the translating center $x_c$.

== 4 Automatic bounded density and stable rigidity <automatic-bounded-density-and-stable-rigidity>

==== 4.1 A radial threshold and automatic bounded density <sec:radial>

We now exclude the unbounded-density alternative for a stable scalar solution $v : bb(R)^7 arrow.r \( - 1 \, 1 \)$ with $D > 0$. Throughout this section $m = 6$. The inputs are the reach inequality and its positive-foot transfer from Proposition 26, the sharp interface estimates from Section 2, and the fourth-order bound (3.47). All are uniform under translation. We will use this uniformity to choose the center of a large ball after choosing its radius.

The proof has two parts. First we compare reach and stability using the same surface amplitude. The comparison forces a positive radial integral to be negligible. We then transfer the energy in the selected ball to regular zero-surface area. Jointly injective normal tubes show that most of this area has small reach, where the radial integral has a definite lower bound. These conclusions are incompatible.

===== 4.1.1 The common amplitude and the comparison to be proved <the-common-amplitude-and-the-comparison-to-be-proved>

Recall that $I = I_P$ is the normal average with normalization $sigma = 4 sqrt(2) \/ 3$, and $d$ is the penalized reach. Put $K \( R \) = 1 + sup_x M_R \( x \)$ and suppose $K \( R \) arrow.r oo$. For each large $R$ choose a center with $M_R gt.eq K \( R \) \/ 2$, then translate that center to the origin. Define

$ rho = \( R^2 + \| x \|^2 \)^(1 \/ 2) \, #h(2em) tau = log rho \, #h(2em) h = rho^(- 2) \, #h(2em) phi.alt = h^2 = rho^(- 4) \, #h(2em) L = R / sqrt(K \( R \)) . $

The length $L$ is large but small compared with $R$. Indeed $K \( R \) lt.eq 1 + C R$ gives $L gt.eq c_0 sqrt(R)$, while

#[#set math.equation(numbering: n => "(4.1)")
 $ sup_(rho gt.eq R) frac(L + log rho, rho) lt.eq 1 / sqrt(K \( R \)) + frac(log R, R) arrow.r 0 . $ <eq:radial-scale-separation>]

This separation requires no rate of divergence for $K$.

Fix

$ theta.alt = .02 \, #h(2em) c = .87 \, #h(2em) q_(*) = 2.2 \, #h(2em) alpha = .04 \, #h(2em) beta_0 = .01 . $

Choose a smooth nondecreasing $f_(*) : bb(R) arrow.r \( 0 \, 1 \]$ such that

$ 0 lt.eq \( log f_(*) \)' lt.eq q_(*) \, #h(2em) f_(*) \( s \) = 1 quad \( s gt.eq 1 \) \, #h(2em) f_(*) \( s \) = C_(*) e^(q_(*) s) quad \( s lt.eq - 1 \) . $

For $t > 0$ set

$ b \( t \) = #scale(x: 120%, y: 120%)[\(] t^(1 - theta.alt) - L^(1 - theta.alt) #scale(x: 120%, y: 120%)[\)]_(+)^(1 \/ \( 1 - theta.alt \)) \, #h(2em) W_(*) \( tau \, t \) = t^(- theta.alt) f_(*) \( c tau - b \( t \) \) \, #h(2em) cal(F) \( tau \, t \) = integral_t^oo W_(*) \( tau \, u \) thin upright(d) u . $

Below the reach scale $L$, the weight is simply $t^(- theta.alt)$. Past the transition $b \( t \) tilde.eq c tau$ it decays exponentially. We evaluate $W_(*)$ and $cal(F)$ at $t = d \( z \)$ and write $lambda = \( log f_(*) \)' \( c tau - b \( d \) \)$. The symbols $W_(*)$ and $f_(*)$ are distinct from the potential $W$ and the decreasing reach multiplier $f$ of Section 3.

The amplitude will vanish near zeros where the defect is not yet small. Define

$ Z = { z in Sigma : D \( z \) gt.eq rho \( z \)^(- alpha) } . $

Choose a smooth ambient $m_H : bb(R)^7 arrow.r \[ 0 \, 1 \]$, zero when $"dist" \( x \, Z \) < rho \( x \)^(beta_0)$ and one when $"dist" \( x \, Z \) > 4 rho \( x \)^(beta_0)$, with uniformly bounded first and second derivatives. One obtains it by convolving an intermediate distance cutoff on a fixed small scale; the gaps between the displayed constants preserve these two requirements for large $R$. Set $m_H = 1$ if $Z$ is empty. Every singular zero has $D = 1$ and lies in $Z$. Let $m_B$ be smooth, equal to one on $B_B$, zero outside $B_(2 B)$, with $\| nabla^k m_B \| lt.eq C_k B^(- k)$ for $k = 1 \, 2$, and put $m_c = m_H m_B$. All supported surface expressions therefore lie in the regular surface. Moreover, Lemma 20 gives

$ d_min \( R \) := inf_({ m_H eq.not 0 } ∩ Sigma) d arrow.r oo quad \( inf diameter := + oo \) . $

The common amplitudes and mass are

$ V = h sqrt(W_(*)) \, #h(2em) psi = m_c V \, #h(2em) cal(L) = integral_Sigma I psi^2 thin upright(d) S \, #h(2em) T_r = 1 - \| nabla_Sigma rho \|^2 gt.eq R^2 \/ rho^2 . $

When an amplitude or its derivatives is written on all of $Sigma$, it is extended by zero through the collar where $m_H = 0$.

The integrated reach inequality, proved in Lemma 44, will have right side $.73 cal(L)$. An ambient test interpolating the values of $psi$ between adjacent sheets will give

$ .895 cal(L) lt.eq 1.005 integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S + upright("negligible errors") . $

The initial surface estimate (3.31) does not give this much interaction mass when $a^2$ is small compared with $I$. Nor do the numbers $.73$ and $.895$ alone yield a contradiction. Expanding the gradient for this amplitude separates the radial contribution from the reach-gradient contribution. Their coefficients will be compared after the two inequalities have been proved; the strict difference leaves a positive multiple of

$ integral_Sigma phi.alt m_c^2 cal(F) thin T_r / rho^2 thin upright(d) S . $

This identifies the quantity that the final area argument must bound from below.

We measure errors against $cal(A) = K \( R \) L^(1 - theta.alt)$. An error is #emph[negligible] if its absolute value is at most $e \( R \) cal(A) + e_R \( B \)$, where $e \( R \) arrow.r 0$ and, for each fixed $R \, L$, $e_R \( B \) arrow.r 0$ as $B arrow.r oo$. All estimates are uniform in the chosen center. The limits are always taken in the order $B arrow.r oo$ at fixed $R$, followed by $R arrow.r oo$.

===== 4.1.2 Weight identities and fixed analytic choices <weight-identities-and-fixed-analytic-choices>

We now fix the analytic tolerances used in the comparison. First choose the small normal-interpolation allowances quantified in Lemma 46. Choose the penalty $Gamma$ so that $1 lt.eq G_1 < 1.001$ and $eta_0 < 10^(- 4)$ in (3.22)–(3.23), and set $kappa = sqrt(2) \/ G_1$. Prescribe the tolerances in (3.28), (3.45), and (3.46); then fix a sufficiently long normal interval $\[ - P \, P \]$. In particular $\| H \| lt.eq .355 I$, while the two sharp interaction tolerances may be at most $.001$. The middle-phase estimate holds at its prescribed tolerance on sufficiently large clean windows. Finally choose the defect threshold and the other constants in (3.47). The interpolation half-width $A_(upright("sw")) = 3$, depth constant $M$, and reach truncation constant $M_0$ are fixed before the final increase of $R$. None of these choices uses a lower bound on the speed at which $K \( R \)$ diverges.

#thm([Lemma 4.1.])[
  (Weight identities).  #emph[Uniformly for $tau gt.eq log R$ and $t gt.eq t_min$, where $t_min > 0$ is any fixed lower bound for the reach on the good set, 
#[#set math.equation(numbering: n => "(4.2)")
 $ cal(F)_tau & = \( 1 + o_R \( 1 \) \) thin c W_(*) (frac(t, c tau or b \( t \)))^theta.alt \,\
frac(cal(F)_tau + cal(F), W_(*)) & lt.eq C \( L + tau \) \, #h(2em) cal(F) / W_(*) gt.eq frac(1, q_(*) + theta.alt \/ t_min) \,\
cal(F) & lt.eq C \( L + tau \)^(1 - theta.alt) . $ <eq:R1>]

 On the regular zero surface the following is a distributional measure inequality: 
#[#set math.equation(numbering: n => "(4.3)")
 $ Delta_Sigma cal(F) gt.eq  & cal(F)_tau Delta_Sigma tau - c^2 theta.alt J_1 \| nabla_Sigma tau \|^2 - W_(*) \( Delta_Sigma d \)_(upright("upper"))\
 & + frac(theta.alt W_(*), d) \| nabla_Sigma d \|^2 + frac(W_(*) lambda, b') \| nabla_Sigma \( c tau - b \( d \) \) \|^2 \,\
J_1 =  & integral_(b \( d \))^oo u^(- theta.alt - 1) f'_(*) \( c tau - u \) thin upright(d) u lt.eq C cal(F)_tau \/ tau . $ <eq:R2>]

 The last square is defined to be zero where $b' = 0$.]
] <lem:radial-weight>

#proof[
  For $t > L$,
  $ b' = \( b \/ t \)^theta.alt \, #h(2em) t^(- theta.alt) thin upright(d) t = b^(- theta.alt) thin upright(d) b . $
  Since $c tau > 1$ for large $R$, the part $t lt.eq L$ contributes nothing to $cal(F)_tau$. Thus
  $ cal(F)_tau = c integral_(b \( t \))^oo u^(- theta.alt) f'_(*) \( c tau - u \) thin upright(d) u . $
  The total mass of the measure $f'_(*) \( c tau - u \) thin upright(d) u$ in this integral is $f_(*) \( c tau - b \( t \) \)$. If $b \( t \) lt.eq c tau + 1$, this mass is concentrated at $u = c tau + O \( 1 \)$ with an exponentially decaying right tail; if $b \( t \) > c tau + 1$, it is concentrated at $u = b \( t \) + O \( 1 \)$ with the same property. Its support is contained in $u gt.eq c tau - 1$ in the first case. Comparing $u^(- theta.alt)$ with $\( c tau or b \( t \) \)^(- theta.alt)$ proves the first estimate uniformly; the same comparison with $u^(- theta.alt - 1)$ proves the bound for $J_1$.
  The logarithmic slope satisfies
  #[#set math.equation(numbering: n => "(4.4)")
   $ 0 lt.eq - partial_t log W_(*) = theta.alt \/ t + lambda b' lt.eq q_(*) + theta.alt \/ t_min \, #h(2em) 0 lt.eq partial_tau log W_(*) lt.eq c q_(*) . $ <eq:radial-weight-slopes>]
  Integration of the resulting exponential lower bound for $W_(*) \( tau \, t + s \) \/ W_(*) \( tau \, t \)$ gives the lower ratio in (4.2). The same argument starting at the current $t$ gives $cal(F) \/ W_(*) gt.eq 1 \/ \( q_(*) + theta.alt \/ t \)$. In particular, on any region where $d gt.eq d_min \( R \) arrow.r oo$, the ratio is at least $1 \/ \( 2.2 + o_R \( 1 \) \)$ uniformly. The relation $t lt.eq C \( L + b \( t \) \)$, splitting the integrals at $C \( L + tau \)$, and the exponential tail of $f_(*)$ give the two upper bounds. In the exponentially decaying region one can also use
  $ cal(F) \/ W_(*) lt.eq C \( t \/ b \( t \) \)^theta.alt lt.eq C quad upright("if ") t > C \( L + tau \) . $
  This observation will allow polynomial factors in $d$ to be discarded far beyond the switching region.
  For completeness the derivatives responsible for the gradient square are
  $ cal(F)_t = - W_(*) \, quad cal(F)_(t t) = W_(*) \( theta.alt \/ t + lambda b' \) \, quad cal(F)_(tau t) = - c W_(*) lambda \, quad cal(F)_(tau tau) = c^2 #scale(x: 120%, y: 120%)[\(] b^(- theta.alt) f'_(*) \( c tau - b \) - theta.alt J_1 #scale(x: 120%, y: 120%)[\)] . $
  Since $b^(- theta.alt) f_(*) = W_(*) \/ b'$, their quadratic expression in $\( nabla_Sigma tau \, nabla_Sigma d \)$ is exactly the last two terms of (4.3), minus $c^2 theta.alt J_1 \| nabla_Sigma tau \|^2$. Near $t = L$ we have $f'_(*) = 0$; all terms involving $lambda \/ b'$ therefore vanish on a neighborhood of this apparent singularity. The reach is locally semiconcave, with nonpositive singular Laplacian part. Multiplication by $cal(F)_t = - W_(*) < 0$ changes this part to a nonnegative measure. The smooth calculation for its almost-everywhere density consequently gives (4.3); one can equivalently obtain it by local concave smoothing and passage to the distributional limit. ◻
]

===== 4.1.3 Removing rough regions and summing the errors <removing-rough-regions-and-summing-the-errors>

The fourth-order estimate pays for the collar of $Z$ and the regions where the reach inequality has a large curvature error. The next lemma records the two sums needed for those payments and the separate decay needed to remove the outer cutoff at fixed $R$.

#thm([Lemma 4.2.])[
  (Summable errors).  #emph[Write $s_j = 2^j R$, $j gt.eq 0$; a shell $rho asymp s_j$ may be enlarged by any fixed factor. The good surface area and ambient volume within $C s_j^(beta_0)$ of $Z$ on this shell are bounded by $C K \( s_j \) s_j^(m - 4 + 2 alpha + n beta_0)$. Each of the following two shell bounds has negligible sum: 
#[#set math.equation(numbering: n => "(4.5)")
 $ C K \( s \) s^(- 2 + 2 alpha + n beta_0) \( 1 + log s \)^C \( L + log s \)^(1 - theta.alt) \, $ <eq:R3>]

 
#[#set math.equation(numbering: n => "(4.6)")
 $ C K \( s \) e^(C sqrt(log \( K \( s \) + 1 \))) s^(- 2) \( L + log s \)^(3 - theta.alt) . $ <eq:R4>]

 Moreover, for some $epsilon.alt' > 0$ and every fixed $R \, L$, 
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_({ rho asymp s } ∩ \( Sigma \\ X \)) W_(*) thin upright(d) S lt.eq C_R s^(m - epsilon.alt') #h(2em) \( s arrow.r oo \) . $ <eq:R5>]

]
] <lem:radial-errors>

#proof[
  Take a uniformly separated net on $Z$ in an enlarged shell. Outside a unit neighborhood of $X$, each such center has a regular surface disk of fixed radius on which $D gt.eq c s^(- alpha)$, by (2.10). Its contribution to $integral D^2$ is at least $c s^(- 2 alpha)$. Bounded overlap and (3.47) bound the number of these centers by $C K \( s \) s^(m - 4 + 2 alpha)$. Centers near $X$ obey the stronger bad-net bound from the same estimate. Enlargement by $C s^(beta_0)$ costs at most $C s^(n beta_0)$, using unit ambient volume and unit good-area bounds.
  For (4.5) use $K \( 2^j R \) lt.eq C 2^j K \( R \)$ and $- 2 + 2 alpha + n beta_0 = - 1.85$. After division by $cal(A)$, its sum is bounded by
  $ C R^(- 1.85) \( 1 + log R \)^C sum_(j gt.eq 0) 2^(- .85 j) \( 1 + j \)^C = o \( 1 \) . $
  Here $\( L + log R + j \) \/ L lt.eq C \( 1 + j \)$ since $L gt.eq c_0 sqrt(R)$. For (4.6), the elementary inequality $sqrt(a + b) lt.eq sqrt(a) + sqrt(b)$ gives instead
  $ 1 / cal(A) sum_(j gt.eq 0) C K \( s_j \) e^(C sqrt(log \( K \( s_j \) + 1 \))) s_j^(- 2) \( L + log s_j \)^(3 - theta.alt) & lt.eq C L^2 / R^2 e^(C sqrt(log \( K \( R \) + 1 \))) sum_(j gt.eq 0) 2^(- j) e^(C sqrt(j + 1)) \( 1 + j \)^C\
 & lt.eq C frac(e^(C sqrt(log \( K \( R \) + 1 \))), K \( R \)) arrow.r 0 . $
  The last limit uses only $K \( R \) arrow.r oo$.
  To prove (4.7), fix a sufficiently small $epsilon.alt > 0$. At fixed $L$, $b \( t \) gt.eq \( 1 - epsilon.alt \) t - C_(epsilon.alt \, L)$ for all $t > 0$. Thus, on the good set,
  $ W_(*) lt.eq C_R s^(c q_(*)) E^p \, #h(2em) p = frac(q_(*) \( 1 - epsilon.alt \), kappa) < 2 . $
  Hölder’s inequality, (3.47), and the good-area bound give $integral_(rho asymp s) E^p lt.eq C K \( s \) s^(m - 2 p)$. Using $K \( s \) lt.eq C s$ proves (4.7) with
  $ epsilon.alt' = q_(*) (frac(2 \( 1 - epsilon.alt \), kappa) - c) - 1 > 0 . $
  For example the limiting value at $epsilon.alt = 0$, $kappa = sqrt(2)$ is greater than $.197$, so the fixed choices above leave strict room. ◻
]

Here are several consequences used without repeating the summation. Derivative costs in the rough collar are bounded by (4.5). For reach derivatives this follows from (3.21) and the weight: a factor $e^(C sqrt(log \( d + 1 \)))$ is bounded by $C_xi d^xi$ for every fixed $xi > 0$, while $W_(*) lt.eq d^(- theta.alt)$. More explicitly, $b' lt.eq 1$, $lambda lt.eq q_(*)$, $\| nabla tau \| lt.eq rho^(- 1)$, and $K \( d \) lt.eq 1 + C d$ imply

$ W_(*) \| nabla_Sigma log W_(*) \|^2 lt.eq C d^(- theta.alt) [rho^(- 2) + \( 1 + d^(- 2) \) e^(C sqrt(log \( d + 1 \)))] lt.eq C . $

The last constant is independent of $L$; the negative power of $d$ absorbs the subpolynomial factor, including near $d = L$. Along logarithmic normal segments, the corresponding metric and volume factors are also bounded by such powers. The same reasoning applies to terms involving $cal(F)$ using (4.2).

Outer cutoff errors without mean curvature are $C_R \( 1 + log B \)^C B^(- epsilon.alt')$ by (4.7). The one potentially larger mean-curvature error is bounded by

$ C B^(1 - m) integral_(rho asymp B) cal(F) D lt.eq C_R \( 1 + log B \) B^(1 - m) (integral_(rho asymp B) D^2)^(1 \/ 2) (integral_(rho asymp B) W_(*)^2)^(1 \/ 2) lt.eq C_R \( 1 + log B \) B^(- \( 1 + epsilon.alt' \) \/ 2) . $

We used $W_(*) lt.eq C$, $integral D^2 lt.eq C B^(m - 3)$, and $cal(F) lt.eq C_R \( 1 + log B \) W_(*)$. Finally, choose $M_0$ sufficiently large and fixed. On $d > M_0 \( L + tau \)$ we have $b \( d \) gt.eq c_1 d$ and $W_(*) lt.eq C d^(- theta.alt) e^(q_(*) c tau - q_(*) c_1 d)$. Thus every fixed polynomial in $d \, rho$ and every $e^(C sqrt(log \( K \( d \) + 1 \)))$ occurring in the reach inequalities has an integrable negligible tail there. This justifies truncating those calculations to $d lt.eq M_0 \( L + tau \)$. Here $M_0$ is chosen to handle the finitely many polynomial degrees in these calculations; it remains fixed through the successive limits $B arrow.r oo$ at fixed $R$, then $R arrow.r oo$.

===== 4.1.4 The integrated reach inequality <the-integrated-reach-inequality>

The preceding estimates pay for all cutoff derivatives and for the large-reach tail. We now integrate the reach equation against the radial weight, retaining the coefficients that will be compared with stability.

For the rest of the reach calculation, unmarked derivatives are surface derivatives. The definitions of $T_r$ and $cal(L)$ are those above. The hypersurface identity $Delta_Sigma F = "tr"_(T Sigma) D^2 F - H nu dot.op nabla F$ gives

$ Delta tau = frac(m - 2 + 2 T_r - H z dot.op nu, rho^2) \, #h(2em) - frac(Delta phi.alt, phi.alt) = frac(\( m - 2 \) \( m T_r - H z dot.op nu \), rho^2) . $

#thm([Lemma 4.3.])[
  (Radial reach budget).  #emph[With the fixed parameter choices above, for large $R$ and $B$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ & integral_Sigma phi.alt m_c^2 W_(*) [frac(3.44 + 24 \( cal(F) \/ W_(*) \) T_r, rho^2) + .012 / d \| nabla d \|^2 + lambda / b' \| nabla \( c tau - b \( d \) \) \|^2] thin upright(d) S\
 & #h(2em)  lt.eq .73 cal(L) + o_R \( cal(A) \) + o_(B arrow.r oo \; R) \( 1 \) . $ <eq:R6>]

]
] <lem:radial-reach-budget>

#proof[
  Integrate (4.3) against $phi.alt m_c^2$ and move the surface Laplacian onto this test. The preceding error estimates justify this operation and control all derivatives of $m_H \, m_B$. The mean-curvature terms in the radial identities are at most
  $ C sup_(rho gt.eq R) frac(L + tau, rho) integral phi.alt m_c^2 W_(*) \| H \| = o_R \( 1 \) cal(L) $
  by (4.2), (4.1), and $\| H \| lt.eq .355 I$. The term involving $J_1$ loses only $o_R \( 1 \) cal(F)_tau \/ rho^2$.
  We spell out the source accounting in $W_(*) \( Delta d \)_(upright("upper"))$. On a nonplateau branch where $a d lt.eq a_0$, (3.22) and $\| nabla d \| gt.eq c_Gamma > 0$ show that the sum of the $a^2 d$ term and its gradient error is bounded by $.008 \| nabla d \|^2 \/ d$, on first choosing $a_0$ small and then the uniform lower reach large. Where $a d > a_0$, (3.21)–(3.22) instead bound the source by
  $ C W_(*) a^4 d^3 e^(C sqrt(log \( K \( d \) + 1 \))) . $
  For $d lt.eq M_0 \( L + tau \) lt.double rho$ its shell integral against $phi.alt$ is bounded by (4.6), using $W_(*) lt.eq d^(- theta.alt)$ and (3.47). Indeed, on $rho asymp s$, the reach power contributes at most $C \( L + log s \)^(3 - theta.alt)$, the subpolynomial factor is bounded using $K \( d \) lt.eq K \( C s \)$, and the product of $phi.alt$ with the fourth-order shell bound has size $C K \( s \) s^(- 2)$. The remaining tail was treated above. The gradient error on plateau branches is smaller than the same $.008$ allowance.
  The local mean curvature on a plateau costs $G_1 \| H \( z \) \|$. For its positive foot term use (3.24). On the truncated range the source and receiving radii have ratio $1 + o_R \( 1 \)$. Since $d \( y \) lt.eq d \( z \)$ and $\| partial_tau log W_(*) \| lt.eq c q_(*)$,
  $ W_(*) \( z \) lt.eq \( 1 + o_R \( 1 \) \) W_(*) \( y \) . $
  If the receiving point lies in the rough collar, transfer first and integrate over that receiving set. In fact (3.24) and the uniformly diverging source reach imply $D \( y \) arrow.r 0$, so the foot is good for the fixed threshold. The transfer Jacobian is bounded, $W_(*) \( z \) lt.eq d \( z \)^(- theta.alt) lt.eq C$, $H_(N_y) \( y \)_(+) lt.eq C D \( y \) lt.eq C$, and $phi.alt \( z \) lt.eq \( 1 + o_R \( 1 \) \) phi.alt \( y \)$. Positive incoming multiplicity is at most one. Thus the charge is bounded by
  $ C integral_(y in Sigma \\ X\
"dist" \( y \, Z \) lt.eq 4 rho \( y \)^(beta_0)) phi.alt \( y \) thin upright(d) S_y . $
  Its shell bound is $C K \( s \) s^(- 2 + 2 alpha + n beta_0)$, smaller than (4.5). No enlargement of the receiving collar by $d \( z \)$ is made: even when $d \( z \)$ is of order $L$, the area formula counts the receiving set itself. Otherwise the point is on the good surface. For $a \( y \) d \( z \) > a_1$, use $H_(N_y) \( y \)_(+) lt.eq C \/ d \( z \) lt.eq C_(a_1) a \( y \)^4 d \( z \)^3$, the uniformly bounded area distortion, and (3.47); this is another error of type (4.6). The reach power here remains the source value $d \( z \)^3$: the truncated source and receiving points lie in comparable shells, and the combined factor $W_(*) \( z \) d \( z \)^3$ is at most $C \( L + log s \)^(3 - theta.alt)$ after transfer. For $a \( y \) d \( z \) lt.eq a_1$, choose $a_1$ and $delta_2$ small so that the area distortion is at most $1.01$. There is exactly the incoming multiplicity bound of (3.24), namely one.
  Spatial cutoff transfer uses, with fixed small $epsilon.alt_c > 0$,
  $ m_B \( z \)^2 lt.eq \( 1 + epsilon.alt_c \) m_B \( y \)^2 + C_(epsilon.alt_c) \( d \/ B \)^2 upright(bold(1))_({ rho asymp B }) . $
  The latter term tends to zero by (4.7), since the truncated reach is at most $C \( L + log B \)$ on this shell. The radial factors $phi.alt$ have ratio $1 + o_R \( 1 \)$ as well. Consequently the sum of all local and incoming curvature charges is at most
  $ \( 1 + o_R \( 1 \) \) G_1 \( .355 \) #scale(x: 120%, y: 120%)[\(] 1 + 1.01 \( 1 + epsilon.alt_c \) #scale(x: 120%, y: 120%)[\)] cal(L) < .73 cal(L) . $
  This leaves room for the radial mean-curvature terms already listed.
  It remains to give the constant mass on the left. If $d gt.eq .8 tau$, then $b \( d \) lt.eq d$ and (4.2) gives
  $ \( 4 - o_R \( 1 \) \) cal(F)_tau \/ W_(*) gt.eq 4 \( .87 \) \( .8 \/ .87 \)^.02 - o_R \( 1 \) > 3.44 . $
  The nonnegative $2 T_r cal(F)_tau$ term may be discarded. On the exceptional set $d < .8 tau$, $E^2 gt.eq s^(- 1.6 kappa)$ on a shell $rho asymp s$. Thus the omitted weighted mass $integral phi.alt W_(*) \/ rho^2$ is at most $C K \( s \) s^(- 4 + 1.6 kappa)$ by (3.47). Its dyadic sum is negligible, since $1.6 kappa < 3$ and $K \( s \) lt.eq C \( s \/ R \) K \( R \)$. The gradient coefficient left from $theta.alt = .02$ is $.012$. The second radial identity gives $m \( m - 2 \) = 24$, proving (4.8). ◻
]

===== 4.1.5 The local geometry for a global ambient test <the-local-geometry-for-a-global-ambient-test>

The remaining task is to recover almost all of $cal(L)$ from ambient stability. We will extend the amplitude $psi$ normally and interpolate between its values across a fixed-width middle band of each relevant gap. This differs from the square-root gluing in Section 3: that construction proved the growth bound, whereas we now use that bound to remove rough regions while interpolating the sheet amplitudes themselves.

#thm([Lemma 4.4.])[
  (Geometry of the radial interpolation regions).  #emph[Fix $C_0 < oo$. For all sufficiently large $R$, the common graph and projection conclusions of Lemma 36 apply within distance $C_0 log rho \( z \)$ of every zero satisfying $"dist" \( z \, Z \) > rho \( z \)^(beta_0) \/ 3$. They apply in particular at every base with $m_H eq.not 0$, uniformly for $rho gt.eq R$ and independently of $B$. The polynomial graph buffers accommodate every fixed logarithmic-power lateral disk. Besides the exact identity $d \( z \) = G_1 ell \( z \)$ whenever a distinct sheet is at logarithmic distance, where $ell \( z \)$ is the shortest adjacent Euclidean gap, the following conclusions hold.]
  + #emph[Two sheet distances within a fixed bounded amount of the least distance can compete only across an adjacent gap, on opposite sides of the point. Three sheets cannot so compete.]
  + #emph[Fix a base $z_i$ and one normal side. Its only possible partner in a middle band is the first adjacent graph on that side. Write $ell_(i j)$ for the distance from the fixed base to that graph, and suppose $ell_(i j) lt.eq C_0 log rho$. Before the ray reaches that graph, at logarithmic depths in the stated window, its two sheet distances $s_i \, s_j$ satisfy 
$ s_i + s_j = ell_(i j) + o_R \( 1 \) \, #h(2em) frac(thin upright(d), thin upright(d) s_i) frac(s_i - s_j, 2) = 1 + o_R \( 1 \) . $

 The ray traverses a fixed-width middle band at most once. The partner graph and $ell_(i j)$ are fixed although the projected receiving point can move on that graph.]
  #emph[All distance errors are additive and uniformly vanish. Buffered graph families and their projections agree on overlaps.]
] <lem:radial-clean-geometry>

#proof[
  Choose $0 < omega < min \( alpha \, beta_0 \)$, put $N = rho \( z \)$, and consider $B_(2 N^omega) \( z \)$. Since $rho$ is $1$-Lipschitz, its values there are $N + O \( N^omega \)$. For large $R$ this ball avoids $Z$, because $2 N^omega < N^(beta_0) \/ 3$. Every zero in it therefore satisfies
  $ D < rho^(- alpha) lt.eq C N^(- alpha) lt.eq N^(- omega) . $
  Lemma 36 applies on a fixed fractional interior, decreasing $omega$ if necessary to leave a margin. Every fixed logarithmic-power disk and every fixed normal interval fit inside that interior. Its errors are bounded by a positive inverse power of $N$ times a fixed logarithmic power, so their supremum for $N gt.eq R$ tends to zero. The sharp analytic estimates (3.45)–(3.46) apply with these same premises after $P$ and the depth constants are fixed.
  We verify the extra conclusions used to count bands. In a frame over one of the common tangent planes, unsigned sheet distances differ additively by $o_R \( 1 \)$ from distances to the ordered graph intercepts. Successive intercepts differ by at least $c_0 log rho$. Among ordered points on a line, two whose distances are within a fixed amount of the least distance must bracket the point and be adjacent; a third is farther by a diverging amount. The same assertions therefore hold for the true sheets.
  Now fix a base and its positive normal ray, putting the base at height zero. The first adjacent graph on that side has intercept $l = ell_(i j) + o_R \( 1 \)$. Before reaching it, the graph estimates and smooth distance gradients give
  $ s_j = l - s_i + o_R \( 1 \) \, #h(2em) frac(thin upright(d) s_j, thin upright(d) s_i) = - 1 + o_R \( 1 \) . $
  These are the asserted sum and derivative formulas. The derivative of $\( s_i - s_j \) \/ 2$ is positive, hence a fixed-width band is traversed at most once. A farther graph cannot be the partner before the first is reached, because the first intervenes and is closer. After crossing that first graph, it remains nearer than the base graph on the relevant logarithmic ray. Thus the base cannot meet a second band on this side. The negative side is identical. Finally, all descriptions concern the actual zero pieces and their unique projections, so they agree on overlaps. ◻
]

===== 4.1.6 A single compactly supported test in physical space <a-single-compactly-supported-test-in-physical-space>

We now extend the sheet values $psi$ to the ambient space. The interpolation is chosen to match the phase tail. In a gap of length $ell$, (3.46) weights its normal derivative by a constant multiple of $e^(- sqrt(2) ell) cosh^2 \( sqrt(2) t \)$. For a scalar interpolation $F$ from $1$ to $0$ on $\[ - A \, A \]$, Cauchy–Schwarz gives

$ 1 = lr(|integral_(- A)^A F' thin upright(d) t|)^2 lt.eq (integral_(- A)^A cosh^2 \( sqrt(2) t \) \| F' \|^2 thin upright(d) t) (integral_(- A)^A "sech"^2 \( sqrt(2) t \) thin upright(d) t) . $

Equality holds exactly when $F'$ is a negative constant times $"sech"^2 \( sqrt(2) t \)$. Fixing the half-width at $A_(upright("sw")) = 3$, we therefore define

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(U) \( t \) = frac(integral_t^3 "sech"^2 \( sqrt(2) u \) thin upright(d) u, integral_(- 3)^3 "sech"^2 \( sqrt(2) u \) thin upright(d) u) \, #h(2em) - 3 lt.eq t lt.eq 3 . $ <eq:radial-interpolant>]

This coefficient is unrelated to $U = g^(- 1) \( v \)$. Choose a large fixed depth constant $M$, and use buffered local graph families containing every candidate within distance $2 M log rho + 10$. More distant pieces cannot enter the bands below. For points satisfying

$ "dist" \( x \, Sigma \) lt.eq M log rho \( x \) + 1 \, #h(2em) "dist" \( x \, Z \) > 1 / 2 rho \( x \)^(beta_0) \, $

let $z_i \( x \)$ denote projection to the nearest sheet. Set $tilde(eta) \( x \) = psi \( z_i \( x \) \)$ unless its distance and the next smallest distance obey $\| s_i - s_j \| lt.eq 6$. In that band set

#[#set math.equation(numbering: n => "(4.10)")
 $ tilde(eta) \( x \) = cal(U) \( t \) psi \( z_i \( x \) \) + \( 1 - cal(U) \( t \) \) psi \( z_j \( x \) \) \, #h(2em) t = \( s_i - s_j \) \/ 2 . $ <eq:radial-ambient-amplitude>]

Labels in this formula are local and may be chosen in either order.

All participating feet lie a logarithmic distance from $x$, so $"dist" \( z_i \, Z \) > rho \( z_i \)^(beta_0) \/ 3$ for large $R$. Thus Lemma 45 supplies the projection charts even when all projected amplitudes vanish. There is no triple competition. Moreover $cal(U) \( - t \) = 1 - cal(U) \( t \)$, so exchanging the two labels leaves the formula unchanged. At $t = - 3$ and $t = 3$ it equals the appropriate single-sheet value. Near a zero it uses only the smooth projection, without differentiating that zero’s unsigned distance. The overlap assertion of Lemma 45 therefore makes $tilde(eta)$ one locally Lipschitz function.

Let $zeta$ be a Lipschitz function equal to one for $"dist" \( x \, Sigma \) lt.eq M log rho \( x \)$ and zero for $"dist" \( x \, Sigma \) gt.eq M log rho \( x \) + 1$, with bounded gradient. For example apply a fixed Lipschitz cutoff to $"dist" \( x \, Sigma \) - M log rho \( x \)$. Set $eta = zeta tilde(eta)$ in the displayed region and zero elsewhere. Near its auxiliary boundary $"dist" \( x \, Z \) = rho \( x \)^(beta_0) \/ 2$, every participating foot lies at distance less than $rho \( z_i \)^(beta_0)$ from $Z$, hence has $m_H = 0$. There is a full zero neighborhood before this boundary, so extension by zero remains locally Lipschitz.

If $eta \( x \) eq.not 0$, some participating base has $\| z_i \| lt.eq 2 B$, and $\| x - z_i \| lt.eq C \( 1 + log rho \( x \) \)$. Consequently

$ \| x \| lt.eq 2 B + C \( 1 + log \( R + \| x \| \) \) \, $

which bounds $\| x \|$ for fixed $R \, B$. A finite cover of this compact support by the local projection charts gives a finite Lipschitz constant. Uniformity of that constant as $B$ grows is unnecessary. We have constructed an admissible test for (2.9) without a global enumeration or a global bound on the number of sheets.

===== 4.1.7 The normal switching cost <the-normal-switching-cost>

#thm([Lemma 4.5.])[
  (Normal switching cost).  #emph[With the preceding fixed parameter choices, for sufficiently large $R$ and uniformly in the subsequent outer radius $B$, 
#[#set math.equation(numbering: n => "(4.11)")
 $ .895 cal(L) lt.eq 1.005 integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S + o_R \( cal(A) \) + o_(B arrow.r oo \; R) \( 1 \) . $ <eq:R7>]

 The constructed ambient test has normalized switching cost at most $.087853 cal(L)$, apart from negligible collar and cutoff terms.]
] <lem:radial-switch-cost>

#proof[
  We separate the terms whose coefficients tend to their planar values from the normal derivative of the interpolation. This leaves a one-gap calculation and the count that allows a positive charge only once per base.
  ======= 4.1.7.1 Defect mass, tangential derivatives, and cutoffs. <defect-mass-tangential-derivatives-and-cutoffs.>
  Over supported bases the fixed tubes $\| s \| lt.eq P$ are jointly injective for large $R$: any intersecting segments have bases in one buffered chart, where separation excludes different sheets and uniqueness of projection excludes two bases on one sheet. They have Jacobian $1 + o_R \( 1 \)$. The base is nearest there, $zeta = 1$, and $eta \( z + s nu \( z \) \) = psi \( z \)$. Hence
  #[#set math.equation(numbering: n => "(4.12)")
   $ integral q^3 D eta^2 thin upright(d) x gt.eq \( 1 - o_R \( 1 \) \) sigma cal(L) . $ <eq:radial-test-mass>]
  In a single-projection region the gradient of $psi \( z_i \( x \) \)$ is $\( upright("Id") + s A_i \)^(- 1) nabla_Sigma psi$. Its metric and volume factors are $1 + o_R \( 1 \)$ at every relevant logarithmic depth. Where $i$ is nearest, the distance to $Sigma$ equals $\| s \|$. Fixed-depth profile convergence and then the uniform phase tail in (2.15) give
  $ integral_(upright("nearest part of the ray")) q^2 thin upright(d) s lt.eq sigma + o_R \( 1 \) . $
  For precision, first choose a large fixed depth to make the exponential tail arbitrarily small, then increase $R$ to use profile convergence on the fixed interval. This proves a uniform limsup without assuming convergence on an expanding interval.
  In a band, differentiation of the two base amplitudes gives $cal(U) nabla \( psi compose z_i \) + \( 1 - cal(U) \) nabla \( psi compose z_j \)$. Convexity bounds its square by the corresponding convex combination of gradient squares. Both sheet distances are at least a fixed multiple of $log rho$, so the $q^2$ mass of a fixed-width band tends uniformly to zero. Normal parametrization from each base, using the single traversal in Lemma 45, bounds the integral of these tangential terms by $o_R \( 1 \) integral \| nabla_Sigma psi \|^2$. Young’s inequality with a fixed small parameter on the switch derivative changes its square by a factor $1 + epsilon.alt_s$; its reciprocal factor on this tangential part is harmless. Combining all such terms gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ \( 1 + o_R \( 1 \) \) sigma integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S . $ <eq:radial-tangent-cost>]
  On the support of $nabla zeta$ the phase bound gives $q^2 lt.eq C rho^(- 2 M \( sqrt(2) - gamma \))$. Also $tilde(eta)^2 lt.eq C rho^(- 4)$, because $W_(*) lt.eq d^(- theta.alt)$ is uniformly bounded on supported bases and their radii differ by $O \( log rho \)$. Ambient shell volume is at most $C rho^7$. Thus the depth cost is bounded by
  $ C sum_(j gt.eq 0) s_j^(3 - 2 M \( sqrt(2) - gamma \)) = o_R \( cal(A) \) $
  for sufficiently large fixed $M$. Its cross term uses another fixed Young factor. The only cost still needing a fixed fraction of $cal(L)$ is
  #[#set math.equation(numbering: n => "(4.14)")
   $ S_(upright("sw")) = integral_(upright("bands")) q^2 cal(U)' \( t \)^2 \| psi \( z_i \) - psi \( z_j \) \|^2 thin upright(d) x \, $ <eq:radial-switch-integral>]
  since $\| nabla t \| lt.eq 1$.
  If either projected $m_H$ is not one, a nonzero projected base is in a fixed logarithmic enlargement of the $4 rho^(beta_0)$ collar of $Z$. Parametrize by the normal rays of the nonzero bases. Each base has at most two bands, with bounded widths and polynomially bounded logarithmic Jacobian factors. The integrand is at most $C rho^(- 4)$ times a fixed logarithmic power. The collar bound in Lemma 43 and the summation (4.5) make this portion negligible. This argument counts rays, not globally named sheets.
  On the remaining bands $m_H = 1$ at both feet. Assign each physical point to a foot $i$ for which the uncut amplitude $V_i$ is larger, breaking equality measurably. This partitions the nonnegative integral (4.14); it does not redefine $eta$, so no derivative of the assignment occurs. With $r = V_j \/ V_i in \( 0 \, 1 \]$,
  #[#set math.equation(numbering: n => "(4.15)")
   $ \| m_B \( z_i \) V_i - m_B \( z_j \) V_j \|^2 lt.eq \( 1 + epsilon.alt_s \) m_B \( z_i \)^2 V_i^2 \( 1 - r \)^2 + C_(epsilon.alt_s) V_i^2 \| m_B \( z_i \) - m_B \( z_j \) \|^2 . $ <eq:radial-cutoff-split>]
  The last term is supported on $rho asymp B$ when $B$ is large at fixed $R$, and its cutoff difference is at most $C log B \/ B$. Normal parametrization and (4.7) therefore bound its integral by $C_R \( 1 + log B \)^k B^(- epsilon.alt') arrow.r 0$.
  ======= 4.1.7.2 One fixed base and one adjacent side. <one-fixed-base-and-one-adjacent-side.>
  Fix an assigned base $z_i$ and one normal side that contributes a band. Its partner is the first adjacent graph on that side, fixed throughout the band. Let $ell_(i j)$ be the shortest Euclidean distance from this fixed base to that graph, and put $ell_i = d \( z_i \) \/ G_1$. By Lemma 45, $ell_i$ is the shortest adjacent gap, so $u := ell_(i j) - ell_i gt.eq 0$. The projected foot $z_j$ moves along its graph as the normal depth changes; $ell_(i j)$ does not.
  We justify the additive error for the moving foot. Put $z_i = 0$ and its normal ray on the vertical axis, so $x = \( 0 \, s_i \)$ and $s_i$ is the actual normal depth. Write the partner graph as $x_7 = f \( y \)$, with common-plane slope bounded by $theta_N = o \( 1 \)$ at a polynomial rate, where $N = rho \( z_i \)$. The stationary equation for projection gives $\| y_j \| lt.eq C theta_N log N$ and $f \( y_j \) = f \( 0 \) + O \( theta_N^2 log N \)$. The logarithmic lower separation then gives
  $ \| z_j - z_i \| = f \( 0 \) + O \( theta_N^2 log N \) = ell_(i j) + o_R \( 1 \) \, $
  after choosing the positive vertical side; the negative side is identical with absolute heights. The second equality also follows by applying the same projection equation to the base $z_i$ itself. The chord makes an unoriented angle tending to zero with both graph normals, so its penalty at $z_j$ is on the plateau. It is an admissible receiving-reach competitor, giving
  #[#set math.equation(numbering: n => "(4.16)")
   $ d \( z_j \) lt.eq G_1 \( ell_(i j) + o_R \( 1 \) \) \, #h(2em) d \( z_i \) = G_1 ell_i . $ <eq:radial-receiving>]
  The radial factors satisfy $h_j \/ h_i = 1 + o_R \( 1 \)$ and $\| tau_j - tau_i \| lt.eq C log rho \/ rho$. By (4.4), monotonicity in $d$, and the uniform divergence of the supported reaches, there is $epsilon.alt_R arrow.r 0$ such that, throughout all assigned bands,
  #[#set math.equation(numbering: n => "(4.17)")
   $ V_j / V_i gt.eq \( 1 - epsilon.alt_R \) exp \[ - \( q_(*) G_1 \/ 2 + epsilon.alt_R \) u \] . $ <eq:radial-amplitude-ratio>]
  Here both feet have $m_H = 1$ and thus diverging reach. To verify the inequality when $d \( z_j \) > d \( z_i \)$, integrate the logarithmic derivative in $d$ from (4.4) from $d \( z_i \)$ up to the upper bound in (4.16), and use its $tau$-derivative bound to change $tau$. If $d \( z_j \) lt.eq d \( z_i \)$, decreasing reach only increases $W_(*)$, so the same lower bound holds. The additive distance error in (4.16) enters a multiplicative factor tending to one. This proves (4.17) uniformly for $rho gt.eq R$.
  The sharp phase input and Lemma 45 give
  #[#set math.equation(numbering: n => "(4.18)")
   $ q^2 lt.eq 64 (1 + .001 / 4)^2 \( 1 + o_R \( 1 \) \) e^(- sqrt(2) ell_(i j)) cosh^2 \( sqrt(2) t \) . $ <eq:radial-q-band>]
  Indeed $e^(- sqrt(2) s_i) + e^(- sqrt(2) s_j) = 2 e^(- sqrt(2) \( s_i + s_j \) \/ 2) cosh \( sqrt(2) t \)$, and its sum of distances differs additively from $ell_(i j)$ by $o_R \( 1 \)$. The finite-width integral is exact:
  #[#set math.equation(numbering: n => "(4.19)")
   $ cal(U)' \( t \) = - frac("sech"^2 \( sqrt(2) t \), sqrt(2) tanh \( 3 sqrt(2) \)) \, #h(2em) integral_(- 3)^3 64 cosh^2 \( sqrt(2) t \) cal(U)' \( t \)^2 thin upright(d) t = frac(32 sqrt(2), tanh \( 3 sqrt(2) \)) . $ <eq:radial-finite-integral>]
  The change from normal depth to $t$ and the normal volume Jacobian are $1 + o_R \( 1 \)$. Therefore, after division by the defect mass at this base,
  $ sigma I_P \( z_i \) m_B \( z_i \)^2 V_i^2 \, $
  the contribution of this side is bounded, up to the displayed finite profile factors and vanishing errors, by
  #[#set math.equation(numbering: n => "(4.20)")
   $ frac(1, tanh \( 3 sqrt(2) \)) sqrt(2) / sigma e^(- sqrt(2) u) \( 1 - e^(- q_(*) G_1 u \/ 2) \)^2 . $ <eq:radial-one-edge>]
  We used $I_P \( z_i \) gt.eq 31.999 e^(- sqrt(2) ell_i)$; replacing $31.999$ by $32$ in (4.20) contributes the explicit factor $32 \/ 31.999$ below. A base with $m_B = 0$ contributes no principal term in (4.15), so division by zero is never needed.
  The vanishing error in this normalized assertion is uniform even if $u$ grows with $log rho$. For any fixed $U_0$, the lower bound in (4.17) converges uniformly on $0 lt.eq u lt.eq U_0$. On $u > U_0$ both the actual loss and its proposed bound are bounded by a fixed constant times $e^(- sqrt(2) u)$, because $0 lt.eq 1 - r lt.eq 1$. First make this tail small by choosing $U_0$, then increase $R$. In particular the side with $u = 0$ has loss tending to zero: (4.17) then gives $1 - r lt.eq epsilon.alt_R$.
  The count of sides now matters. There is at most one first adjacent graph on each side, and the normal ray crosses its band at most once. If both sides contribute, at least one realizes the nearest adjacent distance $ell_i$; if only one side contributes and the nearest side is different, that single contributing side is the only possible positive charge. Thus at most one side needs the positive supremum of (4.20). Restricting to the measurable part assigned to $z_i$ can only decrease the integral. No factor of two multiplies this supremum. Figure 2 summarizes this count.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-3, -0.7125), (3, -0.4875), fill: rgb("#e6e6ff"), stroke: none)
  rect((-3, 0.825), (3, 1.05), fill: rgb("#ffebd6"), stroke: none)
  bezier((-3, -1.2), (3, -1.163), (-1, -1.215), (1, -1.185), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-3, 0), (3, 0.045), (-1, -0.0225), (1, 0.0225), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-3, 1.875), (3, 1.927), (-1, 1.86), (1, 1.897), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, -1.425), (0, 2.175), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.175), [#text(size: 9pt)[normal line through $z_i$]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$z_i$]], anchor: "north-west", padding: 0.1176cm)
  line((-2.4, -1.2), (-2.4, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((-2.4, -0.6), [#text(size: 9pt)[$ell_i$]], anchor: "east", padding: 0.1176cm)
  line((2.4, 0.045), (2.4, 1.912), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((2.4, 0.9788), [#text(size: 9pt)[$ell_(i j)$]], anchor: "west", padding: 0.1176cm)
  content((3.5, -0.6), [#text(size: 9pt)[nearest band]], anchor: "west", padding: 0.1176cm)
  content((3.5, 0.9375), [#text(size: 9pt)[possible charged band]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: A schematic local cross-section, not to scale. The colored strips represent fixed-width middle bands. On the part of a band assigned to $z_i$ as the larger uncut amplitude, the shorter gap $ell_i = d \( z_i \) \/ G_1$ has vanishing normalized loss. Here $ell_(i j)$ is the distance from $z_i$ to its first adjacent sheet on the other side. Only that side can require a positive fixed allowance. The proof uses true normal projections and does not assume globally parallel sheets. ],
  ) <fig:radial-interpolation>
  ======= 4.1.7.3 The finite tolerance budget. <the-finite-tolerance-budget.>
  Since $sqrt(2) \/ sigma = 3 \/ 4$, define
  #[#set math.equation(numbering: n => "(4.21)")
   $ C \( G_1 \) = 3 / 4 sup_(u gt.eq 0) e^(- sqrt(2) u) \( 1 - e^(- 1.1 G_1 u) \)^2 . $ <eq:radial-loss-number>]
  Set $x = e^(- 1.1 G_1 u)$ and $a_(*) = sqrt(2) \/ \( 1.1 G_1 \)$. Differentiation of $x^(a_(*)) \( 1 - x \)^2$ shows its only interior maximum is at $x = a_(*) \/ \( a_(*) + 2 \)$, while the endpoint values are zero. Hence
  #[#set math.equation(numbering: n => "(4.22)")
   $ C \( G_1 \) = 3 / 4 (frac(a_(*), a_(*) + 2))^(a_(*)) (frac(2, a_(*) + 2))^2 . $ <eq:radial-maximum>]
  The defining expression is nondecreasing in $G_1$, so the largest permitted value occurs at $1.001$, and direct evaluation gives $C \( G_1 \) < .083272621$.
  Use Young factors at most $1.001$ for the band derivative, depth cutoff, and cutoff difference. After those fixed choices, increase $R$ until the normal Jacobian, the inverse derivative $thin upright(d) s_i \/ thin upright(d) t$, and the exponential of the additive distance error are each at most $1.001$. After all these finite factors have been fixed, the uniform estimate following (4.20) allows a normalized error of at most $.002$ on each side, including the nearest side, #emph[after multiplication by those factors]. This is legitimate because the unamplified uniform error can be made arbitrarily small. The principal normalized switching contribution is consequently at most
  #[#set math.equation(numbering: n => "(4.23)")
   $ frac(.083272621, tanh \( 3 sqrt(2) \)) (1 + .001 / 4)^2 32 / 31.999 \( 1.001 \)^6 + .004 < .087853 < .100 . $ <eq:radial-finite-budget>]
  Every factor is finite: the band width was fixed at $3$, and all analytic tolerances were fixed before $R$ increased. In particular the proof does not use an infinite-width switch and silently discard its tails.
  Choose the depth constant $M$ large enough for its negligible cost before the final increase of $R$. Then (4.12) is at least $.998 sigma cal(L)$, and the sheet-gradient costs in (4.13), including the fixed Young factor for the depth cutoff, are at most $1.005 sigma integral \| nabla_Sigma psi \|^2$. The other Young factors multiply only the switch term or a tangential band term tending to zero. The rough collar and outer cutoff errors have already been shown negligible. Substitution into (2.9) and division by $sigma$ give
  $ \( .998 - .100 \) cal(L) lt.eq 1.005 integral_Sigma \| nabla_Sigma psi \|^2 thin upright(d) S + o_R \( cal(A) \) + o_(B arrow.r oo \; R) \( 1 \) . $
  As $.998 - .100 > .895$, this proves (4.11). All estimates were made at finite $B$ with coefficients uniform in $B$; the outer limit therefore precedes the limit $R arrow.r oo$ exactly as required by the radial argument. ◻
]

===== 4.1.8 The coefficient comparison and the contradiction <the-coefficient-comparison-and-the-contradiction>

The reach and stability inequalities now concern the same sheet amplitude. Removing the derivative of its radial factor exposes the coefficients directly; their strict differences will leave a positive multiple of $cal(F) T_r \/ rho^2$.

The cross term against $h$ can be removed exactly:

$ integral_Sigma \| nabla \( h m_c sqrt(W_(*)) \) \|^2 = integral_Sigma phi.alt \| nabla \( m_c sqrt(W_(*)) \) \|^2 - integral_Sigma h Delta h thin m_c^2 W_(*) \, #h(2em) - frac(Delta h, h) = frac(4 + 8 T_r - 2 H z dot.op nu, rho^2) . $

All terms have compact support in the regular surface. The $H$ term is $o_R \( 1 \) cal(L)$ by (4.2) and (4.1). The derivatives of $m_c$ have negligible cost by Lemma 43; Young’s inequality costs an arbitrarily small fixed relative loss in the other gradient term. Since

$ frac(.73 \( 1.005 \), .895) < .820 \, #h(2em) nabla log W_(*) = lambda nabla \( c tau - b \( d \) \) - theta.alt / d nabla d \, $

(4.11), after absorbing $o_R \( 1 \) cal(L)$, bounds $.73 cal(L)$, up to negligible errors, by

$ .835 integral_Sigma phi.alt m_c^2 W_(*) [frac(4 + 8 T_r, rho^2) + 1.03 / 4 lr(|lambda nabla \( c tau - b \( d \) \) - theta.alt / d nabla d|)^2] thin upright(d) S . $

Every comparison with (4.8) is strict. For the gradient square use $\| a - b \|^2 lt.eq 1.5 \| a \|^2 + 3 \| b \|^2$ and

$ .835 1.03 / 4 thin 1.5 lambda^2 lt.eq .70955 lambda < .72 thin lambda / b' quad \( 0 < lambda lt.eq 2.2 \, med 0 < b' lt.eq 1 \) . $

Its other term is $.835 \( 1.03 \) 3 theta.alt^2 \/ \( 4 d^2 \)$, smaller than $.012 \/ d$ uniformly on the supported set for large $R$. Where $lambda = 0$ the first comparison is simply unnecessary. The constant radial terms satisfy $.835 dot.op 4 = 3.34 < 3.44$. For the $T_r$ term use $cal(F) \/ W_(*) gt.eq 1 \/ \( 2.2 + o_R \( 1 \) \)$:

$ 24 cal(F) / W_(*) - .835 dot.op 8 gt.eq #scale(x: 120%, y: 120%)[\(] 24 - .835 dot.op 8 \( 2.2 + o_R \( 1 \) \) #scale(x: 120%, y: 120%)[\)] cal(F) / W_(*) gt.eq 5 cal(F) / W_(*) . $

Subtracting and discarding the other nonnegative remainders yields

#[#set math.equation(numbering: n => "(4.24)")
 $ integral_Sigma phi.alt m_c^2 cal(F) thin T_r / rho^2 thin upright(d) S lt.eq o_R \( cal(A) \) + o_(B arrow.r oo \; R) \( 1 \) . $ <eq:R8>]

Every absorption of $o_R \( 1 \) cal(L)$ above is performed at finite $B$, with its coefficient uniform in $B$. Thus the exhaustion does not presume that $cal(L)$ has a finite limit as $B arrow.r oo$.

It remains to find enough surface area where the weight has not decayed. The chosen center supplies energy of order $K \( R \) R^m$. We first transfer that energy to regular zero-surface area, then use injective normal tubes to exclude a substantial portion at large reach.

#thm([Lemma 4.6.])[
  (Area at small reach).  #emph[For all sufficiently large $R$, the set 
$ { z in Sigma ∩ B_(2 R) : m_H \( z \) = 1 \, med d \( z \) lt.eq L \/ 2 } $

 has area at least $c K \( R \) R^m$, with $c > 0$ independent of $R$ and of the selected center.]
] <lem:radial-area>

#proof[
  The energy in $B_R$ is at least $c K \( R \) R^m$ by the center choice. We first transfer a fixed fraction of it to good surface area. Let $cal(Z)$ be a fixed-scale separated net on all of $Sigma$. Uniform gradient bounds give a fixed positive lower energy in a fixed small ball at every zero, including singular zeros. Packing, the definition of $K$, and ball coverings show that the number of net points in $B_(R + j + 2)$ is at most
  $ C K \( R \) R^m \( 1 + j \/ R \)^(m + 1) . $
  By (2.15) and Modica’s inequality, the energy at points of $B_R$ whose distance from $Sigma$ is greater than $P_0$ is therefore at most
  $ C K \( R \) R^m sum_(j gt.eq P_0) \( 1 + j \/ R \)^(m + 1) \( j + 2 \)^n e^(- c_1 j) . $
  Choose $P_0$ large and fixed so this is a small fraction of the initial energy. Energy within the enlarged rough collar is also a negligible fraction: its density is bounded and its volume in $B_(2 R)$ is $O \( K \( R \) R^(m - 4 + 2 alpha + n beta_0) \)$. Enlarge the collar by $2 P_0$ without changing this estimate. Every remaining point lies within $P_0$ of a zero $z$ in $B_(2 R)$ with $m_H \( z \) = 1$. Such bases have $D arrow.r 0$ uniformly. Their fixed normal tubes are regular with bounded Jacobian, and cover the points in question by nearest projection. Their energy is at most a fixed constant times their base area by the area formula and the bounded energy density. Thus
  $ cal(H)^m \( Sigma ∩ B_(2 R) ∩ { m_H = 1 } \) gt.eq c K \( R \) R^m . $
  The large-reach part can now be removed with the jointly injective tube estimate from Remark 21, applied with threshold $L \/ 2$. More explicitly, its normal map is injective simultaneously over all bases with $d > L \/ 2$ and on both normal sides for $\| t \| < c_2 L$, where $c_2 > 0$ depends only on the fixed penalty. Its Jacobian has a fixed positive lower bound. Since $L lt.eq R$, the images of bases in $B_(2 R)$ lie in a ball of radius at most $3 R$. Consequently
  $ cal(H)^m \( Sigma ∩ B_(2 R) ∩ { d > L \/ 2 } \) lt.eq C R^(m + 1) \/ L = C K \( R \) R^m \/ sqrt(K \( R \)) = o \( K \( R \) R^m \) . $
  Subtracting this from the preceding good-area lower bound proves the lemma. ◻
]

Take $B > 3 R$ in (4.24). On the set in Lemma 47, $m_c = 1$, $rho lt.eq sqrt(5) R$ and $T_r gt.eq 1 \/ 5$. Since $d lt.eq L \/ 2$ and $f_(*) \( c tau \) = 1$,

$ cal(F) \( tau \, d \) gt.eq integral_(L \/ 2)^L t^(- theta.alt) thin upright(d) t = frac(1 - 2^(- \( 1 - theta.alt \)), 1 - theta.alt) L^(1 - theta.alt) . $

Also $phi.alt T_r \/ rho^2 gt.eq c R^(- m)$ on $B_(2 R)$. The left side of (4.24) is consequently at least $c K \( R \) L^(1 - theta.alt) = c cal(A)$. First let $B arrow.r oo$ at fixed $R$ and then let $R arrow.r oo$. This contradicts (4.24). The unbounded-density alternative is impossible.

#proof[
  #emph[Completion of Theorem 2.] If a solution attains either endpoint of $\[ - 1 \, 1 \]$, it is the corresponding constant by the strong maximum principle. The remaining constant, zero, is unstable. Indeed, for any nonzero $chi in C_c^1 \( bb(R)^7 \)$, the test $chi_R \( x \) = chi \( x \/ R \)$ gives
  $ Q_0 \( chi_R \) = R^5 integral \| nabla chi \|^2 - R^7 integral chi^2 < 0 $
  for large $R$. For a nonconstant stable solution with values in $\( - 1 \, 1 \)$, if $D$ vanishes anywhere, the equality case in Section 2 gives a planar heteroclinic. Otherwise $D > 0$ everywhere. If its centered density is bounded, Theorem 3 applies. If that density were unbounded, then $K \( R \) arrow.r oo$ and Sections 1–3, followed by the contradiction just proved, would apply. Thus this last case cannot occur, and Theorem 3 gives precisely the claimed constants and planar profiles. ◻
]

==== 4.2 The dimension-nine comparison <sec:dimension-nine>

There are two dimension-sensitive steps in the proof. The classification of the end profiles used Theorem 2 in dimension seven. The cone argument used the absence of a singular ray in ambient dimension eight. In dimension nine, the singular-set bound allows dimension one, so a vertical cylinder over a singular minimizing cone in $bb(R)^8$ is no longer excluded. The actual construction of del Pino, Kowalczyk, and Wei realizes precisely this possibility.

Here the numbering refers to their published paper #cite(label("DPKW2011")). Its Theorem 1, pp. 1488–1489, constructs, for sufficiently small fixed $alpha > 0$, a bounded entire smooth solution $u_alpha$ in $bb(R)^9$, strictly increasing in $x_9$, associated with the nonaffine entire minimal graph

$ Gamma_alpha = { \( p \, F_alpha \( p \) \) : p in bb(R)^8 } \, #h(2em) F_alpha \( p \) = alpha^(- 1) F \( alpha p \) . $

It satisfies

#[#set math.equation(numbering: n => "(4.25)")
 $ \| u_alpha \( x \) \| arrow.r 1 quad upright("as ") "dist" \( x \, Gamma_alpha \) arrow.r oo . $ <eq:monotone-dpkw-clearing>]

The graph is a refinement of the Bombieri–De Giorgi–Giusti construction #cite(label("BDG1969")). With $p = \( xi \, zeta \) in bb(R)^4 times bb(R)^4$ and $\( \| xi \| \, \| zeta \| \) = \( r cos theta \, r sin theta \)$, Lemma 2.1 and Theorem 2 of #cite(label("DPKW2011"), form: "prose") pp. 1492–1493 give

#[#set math.equation(numbering: n => "(4.26)")
 $ F_0 \( r \, theta \) = r^3 g_(upright("BDG")) \( theta \) \, #h(2em) g_(upright("BDG")) \( theta \) > 0 quad \( pi \/ 4 < theta < pi \/ 2 \) \,\
F_0 lt.eq F lt.eq F_0 + C r^(- beta) min { F_0 \, 1 } quad upright("in this sector for ") r > R_0 \, #h(2em) 0 < beta < 1 \,\
F \( zeta \, xi \) = - F \( xi \, zeta \) . $ <eq:monotone-dpkw-graph>]

The angular notation $g_(upright("BDG"))$ is unrelated to the heteroclinic $g$. In arXiv version 0806.3141v2 the corresponding main and graph theorems are numbered 1.1 and 3.1, respectively.

We spell out the consequences needed for the comparison. For a fixed base point $p$, continuity bounds $F_alpha$ on every bounded neighborhood of $p$. Hence $"dist" \( \( p \, t \) \, Gamma_alpha \) arrow.r oo$ as $\| t \| arrow.r oo$: otherwise a graph point a bounded distance away would have a bounded base coordinate and an unbounded height. Bounded strict monotonicity gives distinct vertical limits, while (4.25) puts both limits in ${ - 1 \, 1 }$. They are therefore $- 1$ and $1$. In particular $- 1 < u_alpha < 1$ everywhere and each vertical line has a unique zero, of height $h_alpha \( p \)$. Equation (4.25) also implies that all these zeros lie within a fixed distance $D_alpha < oo$ of $Gamma_alpha$.

Fix $p$ with $0 < \| xi \| < \| zeta \|$ and fix $t in bb(R)$. The angular direction stays in a compact subinterval of the positive sector for all points $R p + O \( 1 \)$ as $R arrow.r oo$. The lower bound in (4.26), with $alpha$ fixed, gives

#[#set math.equation(numbering: n => "(4.27)")
 $ F_alpha \( R p + O \( 1 \) \) gt.eq c_(p \, alpha) R^3 quad upright("for all sufficiently large ") R . $ <eq:monotone-dpkw-cubic>]

A graph point within $D_alpha + 1$ of the zero $\( R p \, h_alpha \( R p \) \)$ has base coordinate $R p + O \( 1 \)$, so (4.27) implies $h_alpha \( R p \) \/ R arrow.r + oo$. Thus $u_alpha \( R p \, R t \) < 0$ for large $R$. Moreover the distance from $\( R p \, R t \)$ to the graph tends to infinity: a bounded-distance subsequence would contradict (4.27). By (4.25),

$ u_alpha \( R p \, R t \) arrow.r - 1 quad upright("if ") 0 < \| xi \| < \| zeta \| . $

The oddness of $F$ and the same argument give limit $+ 1$ in the opposite sector $0 < \| zeta \| < \| xi \|$. The excluded equality set and coordinate axes have Lebesgue measure zero. Bounded convergence now shows local $L^1$ convergence of the rescaled solutions to the two-phase function with interface

#[#set math.equation(numbering: n => "(4.28)")
 $ cal(C)_9 = { \( xi \, zeta \) : \| xi \| = \| zeta \| } times bb(R) . $ <eq:monotone-dpkw-cylinder>]

This cone has the entire vertical axis as its singular set and is invariant under vertical translations. Its directional normal component is zero on its regular part. Thus it falls into exactly the case that was ruled out by the singular-set bound in Lemma 7 in dimension eight.

The same solutions are minimizers by Lemma 5, applied to their constant end profiles, and consequently have the corresponding $O \( R^8 \)$ energy growth. Thus neither the derived minimizing property nor this energy bound conflicts with the construction. Their nonplanar phase limit also precludes one-dimensionality. The construction extends constantly in additional coordinates to every $N > 9$, as explained in #cite(label("DPKW2011"), form: "prose") p. 1490: the added second derivatives vanish, and strict monotonicity in $x_9$ is preserved. It supplies no eight-dimensional example.


#bibliography("refs.bib", style: "ieee", title: [References])
