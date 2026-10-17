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

#align(center)[#text(size: 16pt, weight: "bold")[Equality and rigidity in the spacetime Penrose inequality]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

The spacetime Penrose inequality compares the invariant ADM mass of initial data with the least area needed to enclose a trapped boundary. Its model equality cases are spacelike slices of the Schwarzschild–Tangherlini spacetime #cite(label("Tangherlini1963")). Such a slice need not be time-symmetric. Admissible asymptotically boosted slices can have different second fundamental forms and ADM energy–momentum vectors while retaining the same invariant mass. The rigidity question is therefore whether equality determines the original metric and second fundamental form as the induced data of a Schwarzschild–Tangherlini slice.

We prove this conclusion in every spatial dimension $n gt.eq 3$ under strong differentiated decay, and under weaker decay in dimensions three and four. The embedding includes the original horizon in regular spacetime coordinates. In dimension three the finite-component theorem also proves that equality forces the horizon to be connected. The hypotheses and converse statements differ between the three classes; we describe those distinctions before explaining the proof.

=== 1.1 The equality statements and their scope <the-equality-statements-and-their-scope>

Write $\( E \, P \)$ for the original ADM energy–momentum vector and $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$ for its invariant mass. Let $a \( g \)$ be the infimum of the areas of all full enclosing cuts, including every component and every portion coincident with the original boundary $S$. The numerical inequality is

$ m gt.eq F_n \( a \( g \) \) \, #h(2em) F_n \( a \) = 1 / 2 (a / omega_(n - 1))^(\( n - 2 \) \/ \( n - 1 \)) \, #h(2em) omega_(n - 1) = \| bb(S)^(n - 1) \| . $

All our equality classes have smooth orientable data satisfying the dominant energy condition, integrable constraint densities and finite ADM limits. Their boundary is marginally outer trapped and outer area-minimizing, so that $a \( g \) = A := \| S \|_g > 0$. The chosen closed exterior is complete with its boundary included and has compact complement to one asymptotically flat end. No spin, vacuum, maximality or stationary-development assumption is imposed.

Table 1 records the remaining distinctions. Here $O_j \( r^(- a) \)$ includes the coordinate derivative estimates through order $j$; the underlying data are smooth. Wholly-interior outermostness excludes any smooth weakly outer trapped enclosing cut entirely in the open exterior, even if that cut is disconnected. Partial-coincidence outermostness also excludes cuts retaining some entire original boundary components and replacing others by interior components. The precise definitions are given with the theorems.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Class
], table.cell(rowspan: 1, colspan: 1)[Differentiated asymptotics
], table.cell(rowspan: 1, colspan: 1)[Horizon, ambient hypothesis and conclusion
]),
  table.cell(rowspan: 1, colspan: 1)[$n gt.eq 3$
], table.cell(rowspan: 1, colspan: 1)[$g - delta = O_6 \( r^(- q) \)$, $K = O_5 \( r^(- 1 - q) \)$, $frac(n - 2, 2) < q < n - 2$
], table.cell(rowspan: 1, colspan: 1)[Connected $S$; wholly-interior outermostness; no ambient extension required. Equality and the converse hold in this class (Theorems 5 and 6).
],
  table.cell(rowspan: 1, colspan: 1)[$n = 3$
], table.cell(rowspan: 1, colspan: 1)[$g - delta = O_2 \( r^(- q) \)$, $K = O_1 \( r^(- 1 - q) \)$, $q > 1 / 2$ on each ambient end
], table.cell(rowspan: 1, colspan: 1)[The exterior lies in complete boundaryless data with finitely many AF ends. For finitely many components, partial-coincidence outermostness gives rigidity and connectedness; for connected $S$, wholly-interior outermostness suffices. These are forward statements (Theorems 53 and 54).
],
  table.cell(rowspan: 1, colspan: 1)[$n = 4$
], table.cell(rowspan: 1, colspan: 1)[$g - delta = O_2 \( r^(- q) \)$, $K = O_1 \( r^(- 1 - q) \)$, $q > 1$
], table.cell(rowspan: 1, colspan: 1)[Connected $S$; wholly-interior outermostness; no ambient extension required. Equality and the converse hold in this weak-decay class (Theorem 82).
],
)
]],
  caption: [Table 1: The three equality classes. Common energy, area and completeness hypotheses are stated above; the cited theorems give the full assumptions. ],
)

Future timelikeness $E > \| P \|$ is assumed in the strong and three-dimensional statements. In dimension four it follows from the numerical theorem and positive enclosing area. In the three-dimensional theorem the ambient completeness assumption ensures completeness of the closed chosen exterior; the conclusion concerns only that exterior. No theorem identifies a region behind $S$.

In each branch, equality embeds the entire original exterior, with its given $g$ and $K$, into the regular extension of the exterior of mass $m$. The boundary is a full smooth section of the future horizon or the bifurcation sphere, and the chosen end approaches spatial infinity. The converses include asymptotically boosted slices and compute the invariant mass from the original ADM integrals. The strong class contains examples with $K equiv.not 0$. In the three-dimensional finite-component class, Corollary 55 gives the further consequence

$ S upright(" disconnected") quad arrow.r.double quad sqrt(E^2 - \| P \|^2) > sqrt(A \/ \( 16 pi \)) . $

This is qualitative strictness, with no asserted uniform positive lower bound for the deficit.

Two numerical inputs have distinct roles. The spacetime theorem of #emph[The spacetime Penrose inequality and enclosing area] #cite(label("CompanionNumerical")) Theorems 1.3, 7.2 and 8.2 applies to the nearby weakly trapped data used in the variations; they need not satisfy the original pair’s outermostness or area-minimizing hypotheses. The Riemannian theorem of #emph[Conformal flow and the Riemannian Penrose inequality with minimizing frontiers] #cite(label("CompanionRiemannian")) Theorem 1.1 enters later in the all-dimensional classification. We use its numerical bound to prove nonnegative mass and then rigidity for a rough conformal double. Neither input supplies the original-data equality argument.

=== 1.2 Why equality must be varied on the original data <why-equality-must-be-varied-on-the-original-data>

The numerical spacetime proof constructs auxiliary metrics and passes to inequalities in a prescribed order. Equality in its final bound does not identify the original pair $\( g \, K \)$ with any one auxiliary metric. We instead use the inequality on admissible variations of $\( g \, K \)$ itself: equality makes the mass–area deficit $m \( g \, K \) - F_n \( a \( g \) \)$ a constrained minimum.

There are two obstacles to extracting stationary equations from this minimum. A least-area enclosing surface can change when the metric changes. Even when $S$ minimizes area, its own first variation need not be the derivative of the infimum. Moreover, separation of the first variations produces measures on all minimizing enclosures. Interior sheets can therefore contribute an area source to the adjoint equations. This source must be removed before the equations of a stationary spacetime become available.

The geometric step attaches an inner side to $S$ and minimizes full perimeter among sets containing it. Mean-convex spheres confine minimizers for asymptotically flat metric paths. The broader paths needed in dimension three use uniform metric comparison and density bounds instead. Perimeter convergence and continuity for vector measures control the tangent-plane integrals and give the right metric derivative

$ a' \( g \; h \) = min_C 1 / 2 integral_(partial^(*) C) "tr"_(T partial^(*) C) h thin d A_g \, $

where $C$ ranges over all original minimizing enclosures. Thus no differentiable choice of a minimizing surface is needed.

Positive separation then produces a lapse $u$, a shift $X$ and a positive area measure. Causality takes the form $u gt.eq \| X \|$, while the Hessian equation initially has a measure source normal to the minimizing sheets. Compact normal tests show that a typical free sheet has both zero mean curvature and zero tangential trace of $K$. In dimensions at most seven it is already smooth, so outermostness removes it. In higher dimensions, atomic sheets are totally geodesic; neighboring nonatomic sheets produce a common positive Jacobi field. Its behavior near singular points, together with a BV zero-set argument, gives a curvature bound that removes the remaining singularities. Smooth outermostness can then be applied.

After localization the interior adjoint is homogeneous. Its stationary development still admits a null-dust alternative. The common stationary argument, Proposition 34, removes the twist and constructs the static base without presupposing a regular interior null set. It retains possible complete ends arising there. The three classifications subsequently resolve these ends in different ways, as shown in Figure 1. In particular, the weak-decay branches derive the harmonic-coordinate estimates needed for compactification; they do not assume strong differentiated decay for the original data.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 13.86cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Spacetime numerical inequality on variations of the original data#linebreak()$arrow.r.long$ full-area envelope and causal multipliers]]])])
  content((0, -1.398), [#box(width: 13.86cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Normal tests and outermostness localize the area source to $S$]]])])
  content((0, -2.765), [#box(width: 13.86cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Homogeneous adjoint $arrow.r.long$ stationary field $arrow.r.long$ static base#linebreak()Possible interior null ends are retained]]])])
  content((-5.306, -5.346), [#box(width: 4.614cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n gt.eq 3$, strong decay#linebreak()Circle completion#linebreak()Rough conformal double#linebreak()Riemannian mass bound]]])])
  content((0, -5.346), [#box(width: 4.614cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n=3$, weak decay#linebreak()Complete conformal double#linebreak()Spinor rigidity with other ends]]])])
  content((5.306, -5.346), [#box(width: 4.614cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n=4$, weak decay#linebreak()$C^2$ compactification#linebreak()Nonspin nonnegative mass]]])])
  line((0, -0.5114), (0, -1.111), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -1.685), (0, -2.285), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -3.246), (0, -4.146), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -3.246), (0, -3.646), (-5.306, -3.646), (-5.306, -4.146), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -3.246), (0, -3.646), (5.306, -3.646), (5.306, -4.146), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
})],
  caption: [Figure 1: The common variational and stationary steps precede three complete classification arguments. Each branch proves the rigidity needed for its conformal double and then recovers the original slice through the horizon. Numerical mass bounds are used only in the indicated roles. ],
) <fig:intro:proof>

=== 1.3 Mathematical context and attribution <mathematical-context-and-attribution>

Penrose’s mass–area question arose from black-hole collapse and cosmic censorship #cite(label("Penrose1973")). The area in an initial-data formulation requires care. Ben-Dov constructed spherically symmetric data satisfying the dominant energy condition for which the bound using the apparent horizon’s own area fails; he distinguished that area from the minimum area needed to enclose it #cite(label("BenDov2004")) Section 1. This distinction explains the use of $a \( g \)$ in the numerical inequality and the separate outer area-minimizing assumption in our equality classes.

For time-symmetric data, Huisken and Ilmanen’s weak inverse mean curvature flow proves the three-dimensional bound associated with a connected horizon, while Bray’s conformal flow gives the sharp bound for the total area of a possibly disconnected horizon #cite(label("HuiskenIlmanen2001")) #cite(label("Bray2001")). Bray and Lee develop the conformal flow in dimensions below eight #cite(label("BrayLee2009")). Minimizing hulls and smooth-obstacle regularity are central to the inverse mean curvature approach. Here perimeter compactness is combined with Reshetnyak’s continuity principle to differentiate the enclosing infimum as the metric varies #cite(label("Reshetnyak1968")) #cite(label("Spector2011")).

Beyond time symmetry, Bray and Khuri’s generalized Jang construction is an important equality precedent. In their spherically symmetric setting they recover the original metric and second fundamental form as a Schwarzschild spacelike embedding #cite(label("BrayKhuri2010")) Section 4. Their proposed nonspherical coupled system is conditional on its existence and regularity #cite(label("BrayKhuri2010")) Section 5. The original-slice conclusion, rather than vanishing of $K$, is thus already integral to the earlier spacetime formulation. The argument here obtains that conclusion by varying the original mass–area deficit after the numerical theorem has been established.

Bartnik’s variational program relates constrained gravitational energy to stationary geometry. In his boundaryless asymptotically flat three-dimensional phase space, critical points of the ADM energy on a fixed constraint level set are characterized by the adjoint constraint equations; future-timelike ADM vectors give the corresponding invariant-mass formulation #cite(label("Bartnik2005PhaseSpace")) Theorem 6.1 and Corollary 6.2. The Killing-initial-data framework and asymptotic Killing-field estimates of Beig and Chruściel explain how lapse–shift equations encode a spacetime symmetry #cite(label("BeigChrusciel1996")) #cite(label("BeigChrusciel1997KID")). For the dominant energy condition, Corvino and Huang introduce a modified constraint operator that accounts for the metric dependence of the momentum norm #cite(label("CorvinoHuang2020")) Section 2.2. Huang and Lee relate its adjoint, together with a null-vector identity, to Killing developments with null-fluid stress #cite(label("HuangLee2024Bartnik")) Section 6.1.

Hirsch and Huang obtain a strongly stationary vacuum development of the interior for local ADM-mass minimizers with compact boundary, fixed Bartnik data, the dominant energy condition and $E > \| P \|$, under their stated decay and regularity hypotheses #cite(label("HirschHuang2025")) Theorem 7. Fixing those boundary data fixes $\| S \|$, but need not fix the least area of all enclosing cuts. Our constrained minimum is therefore a different variational problem: it retains $a \( g \)$ and the interior source generated by its minimizing enclosures. Their strong maximum principle rules out an interior null point for a causal Killing field $Y$ that is timelike near infinity and satisfies $"Ric" \( Y \, Y \) lt.eq 0$ #cite(label("HirschHuang2025")) Theorem 4. Here localization first produces the homogeneous adjoint; the stationary construction retains its possible null stress, and the twist argument treats the null set directly.

Static classification has its own ancestry. In three spatial dimensions, Bunting and Masood-ul-Alam used positive mass to remove the connected-horizon assumption in the asymptotically Euclidean static vacuum problem #cite(label("BuntingMasoodUlAlam1987")). Gibbons, Ida and Shiromizu developed the conformal construction in higher dimensions #cite(label("GibbonsIdaShiromizu2002")) Section 2. Hwang’s related rigidity theorem concerns complete spin Ricci-flat manifolds with prescribed asymptotically flat behavior and an appropriate circle action with fixed points #cite(label("Hwang1998")); this is also a precedent for the circle-extension setting used here. For the present data, we establish the completeness of each double and the required horizon and compactified-point regularity.

The mass inputs are accordingly different in the three branches. Bartnik and Chruściel prove positive energy and parallel-spinor rigidity with a noncompact interior #cite(label("BartnikChrusciel2005")) Theorem 11.2; Cecchini and Zeidler give a smooth Riemannian spin formulation with arbitrary other ends and Euclidean rigidity #cite(label("CecchiniZeidler2024")) Theorem B. We supply the spinor argument at the rough regularity of the three-dimensional double. In dimension four, Lesourd, Unger and Yau supply smooth nonspin nonnegative mass for a distinguished asymptotically Schwarzschild end, allowing arbitrary other ends #cite(label("LesourdUngerYau2021")) Theorem 1.2 and Definition 1.9, arXiv version 1. We prove the required rigidity by deformation and volume comparison. In the strong-decay branch, the Riemannian numerical companion supplies the mass bound in every dimension from which the rough-double rigidity is derived. None of these applications identifies a merely numerical inequality with an equality theorem.

=== 1.4 Reading the proof <reading-the-proof>

Section 2 states the strong-decay equality theorem and converse. Section 3 establishes the common enclosure geometry and metric derivative. Section 4 carries out the all-dimensional separation and support localization; its smooth-dimensional shortcut is identified after the contact argument. Section 5 contains the common stationary construction and the all-dimensional classification, followed by the converse ADM calculation in Section 6.

For weak decay in dimension three, Sections 7 and 8 give the data and equality statements. Variation and the static base lead to global classification and horizon recovery in Section 12. A separate local two-component spinor argument follows that main route. It examines a family of complete conformal metrics and obtains a local obstruction in the limit, without requiring completeness of the limiting metric. It provides an alternative explanation of strictness for two spherical components. The four-dimensional route begins in Section 14 and concludes with horizon recovery and the weak-decay converse in Section 20.

== 2 Original data and the equality theorems <sec:setting>

Throughout, $n gt.eq 3$, $k = n - 1$, and $omega = \| S^(n - 1) \|$ is the area of the unit round sphere. The Laplacian is $Delta = "div" nabla$, and symmetrization includes the factor $1 \/ 2$. Mean curvature is the tangential divergence of the specified normal.

#prodef([Definition 2.1.])[
  (One-ended initial-data exterior).  A one-ended initial-data exterior is a smooth connected orientable $n$-manifold $Omega$ with nonempty compact smooth boundary $S$, a smooth Riemannian metric $g$, and a smooth symmetric covariant two-tensor $K$, both smooth up to $S$, satisfying the following conditions.
  The metric space $\( Omega \, g \)$, with $S$ included, is complete. There is a compact subset $C subset Omega$ such that $Omega \\ C$ is a single coordinate end diffeomorphic to ${ x in bb(R)^n : \| x \| > R_0 }$. In these coordinates, for some
  $ frac(n - 2, 2) < q < n - 2 \, $
  we have
  #[#set math.equation(numbering: n => "(2.1)")
   $ g_(i j) - delta_(i j) = O_6 \( r^(- q) \) \, #h(2em) K_(i j) = O_5 \( r^(- 1 - q) \) \, #h(2em) r = \| x \| . $ <eq:setting:decay>]
  Here $O_j \( r^(- a) \)$ includes the estimate $\| partial^alpha T \| lt.eq C_alpha r^(- a - \| alpha \|)$ for every $\| alpha \| lt.eq j$. These are asymptotic bounds on otherwise smooth data.
  Put
  #[#set math.equation(numbering: n => "(2.2)")
   $ tau = "tr"_g K \, #h(2em) 2 mu = R_g + tau^2 - \| K \|_g^2 \, #h(2em) J_i = nabla^j \( K_(i j) - tau g_(i j) \) . $ <eq:setting:constraints>]
  We assume the dominant energy condition and integrability:
  #[#set math.equation(numbering: n => "(2.3)")
   $ mu gt.eq \| J \|_g \, #h(2em) mu \, med \| J \|_g in L^1 \( Omega \, d V_g \) . $ <eq:setting:dec>]
  The ADM limits
  #[#set math.equation(numbering: n => "(2.4)")
   $ E & = frac(1, 2 k omega) lim_(R arrow.r oo) integral_(S_R) \( partial_j g_(i j) - partial_i g_(j j) \) thin n_delta^i thin d A_delta \,\
P_i & = frac(1, k omega) lim_(R arrow.r oo) integral_(S_R) \( K_(i j) - tau g_(i j) \) thin n_delta^j thin d A_delta $ <eq:setting:energy>]
  exist and are finite. We impose the future-timelike condition
  #[#set math.equation(numbering: n => "(2.5)")
   $ E > \| P \|_delta \, #h(2em) m = \( E^2 - \| P \|_delta^2 \)^(1 \/ 2) . $ <eq:setting:timelike>]
  On every component of $S$, the unit normal $nu$ points into $Omega$. We require
  #[#set math.equation(numbering: n => "(2.6)")
   $ theta_(+) \( S \) = H_S + "tr"_S K lt.eq 0 \, #h(2em) H_S = "div"_S nu \, #h(2em) "tr"_S K = \( g^(i j) - nu^i nu^j \) K_(i j) . $ <eq:setting:trapping>]
  There is no assumption on the other null expansion.
] <def:data>

The compact-complement condition in Definition 1 is part of our use of #emph[one-ended]. It excludes additional non-asymptotically-flat ends. Merely specifying one asymptotically flat end among other unrestricted ends would define a larger class, for which the compact filling and global arguments below would need additional hypotheses. The cosmological constant is zero. No spin, maximality, time-symmetry, vacuum, stationary-development, or interior-topology assumption is made.

#prodef([Definition 2.2.])[
  (Full enclosing cuts).  A full enclosing cut is $Gamma = partial D$, the entire intrinsic manifold boundary of a connected smooth codimension-zero submanifold-with-boundary $D$ of $Omega$, such that $D$ is closed in $Omega$, its manifold interior lies in $"int" Omega$, and it contains the whole sufficiently distant coordinate end. We require $Gamma$ to be compact, smooth, embedded, and two-sided.
  All components of $partial D$ are counted, including any portion coincident with $S$. In particular, $D = Omega$ is admissible and has full boundary $S$. Define
  #[#set math.equation(numbering: n => "(2.7)")
   $ A_min \( S \) = inf_Gamma "Area"_g \( Gamma \) \, $ <eq:setting:minarea>]
  and assume $A_min \( S \) > 0$.
] <def:fullcuts>

A cut need not be connected, minimal, or trapped. The areas in (2.7) are always computed in the original metric $g$. We neither assume that the infimum is attained nor assign a classical expansion to a singular minimizing boundary.

#thm([Theorem 2.3.])[
  (Numerical input).  #emph[The numerical spacetime Penrose theorem #cite(label("CompanionNumerical")) Theorem 1.3 states that every initial-data exterior in Definition 1, with the positive full-cut infimum in Definition 2, satisfies 
#[#set math.equation(numbering: n => "(2.8)")
 $ #box(stroke: black, inset: 3pt, [$ quad m gt.eq 1 / 2 (frac(A_min \( S \), omega))^(frac(n - 2, n - 1)) . quad $]) $ <eq:setting:main>]

 This input is used for nearby weakly trapped data as well as for the original pair. It imposes none of the additional equality hypotheses introduced below.]
] <thm:numerical-input>

The normalization is geometric: the Schwarzschild–Tangherlini metric of mass $M > 0$ is

#[#set math.equation(numbering: n => "(2.9)")
 $ upright(bold(G))_M = - F \( r \) thin d t^2 + F \( r \)^(- 1) thin d r^2 + r^2 sigma_(n - 1) \,\
F \( r \) = 1 - frac(2 M, r^(n - 2)) \, #h(2em) r > r_M := \( 2 M \)^(1 \/ \( n - 2 \)) . $ <eq:setting:tangherlini>]

Here $sigma_(n - 1)$ is the unit round metric. We use its regular extension across the future horizon and at the bifurcation sphere. For a spacelike hypersurface our sign convention is

#[#set math.equation(numbering: n => "(2.10)")
 $ K \( U \, V \) = upright(bold(G))_M \( nabla_U^(upright(bold(G))_M) n_(upright("future")) \, V \) . $ <eq:setting:Ksign>]

#prodef([Definition 2.4.])[
  (Rigidity class).  An exterior in Definition 1 belongs to the rigidity class if $S$ is connected, $theta_(+) \( S \) = 0$, every full cut has area at least $A = "Area"_g \( S \) > 0$, and no compact smooth embedded two-sided enclosing hypersurface entirely in $"int" Omega$, possibly disconnected, has $theta_(+) lt.eq 0$ everywhere with normal toward the end.
] <def:setting:rigidity>

Thus $A_min \( S \) = A$ in this class. Outermostness is imposed only for smooth entirely interior enclosing hypersurfaces; its use on limiting minimizers will be justified by the singular-sheet argument.

#thm([Theorem 2.5.])[
  (Original-data rigidity).  #emph[Suppose an exterior in Definition 4 attains equality in (2.8). There is a global smooth spacelike embedding of the entire $Omega$, including $S$, into the regular extension of one exterior of $upright(bold(G))_m$, inducing exactly the original $g$ and $K$ with convention (2.10).]
  #emph[The image lies in the domain $r > r_m$ together with its corresponding future horizon and bifurcation sphere. The boundary maps to a full smooth section of that future horizon or to its bifurcation sphere. The embedding and future unit normal extend smoothly to $S$ in horizon-regular coordinates, and the chosen end approaches spatial infinity. There is no conclusion about a region behind $S$.]
] <thm:rigidity>

A full horizon section meets every null generator once; its induced metric has the same area as the round horizon sphere. In statements about an asymptotic slice, approaching spatial infinity means that the ambient static radius tends to infinity along every sequence escaping the given coordinate end.

#thm([Theorem 2.6.])[
  (Converse and sharpness).  #emph[Let $M > 0$. Every smooth spacelike exterior hypersurface in the regular extension of $upright(bold(G))_M$, with its interior in $r > r_M$, whose induced data satisfy Definitions 1, 2, and 4, whose boundary is a full smooth section of the corresponding future horizon or its bifurcation sphere, and whose end approaches spatial infinity, has 
#[#set math.equation(numbering: n => "(2.11)")
 $ \( E^2 - \| P \|_delta^2 \)^(1 \/ 2) = M \, #h(2em) A = omega \( 2 M \)^(frac(n - 1, n - 2)) . $ <eq:setting:converse>]

 It therefore attains equality in (2.8). In every dimension there are admissible static examples and admissible examples with $K equiv.not 0$.]
] <thm:converse>

Theorems 5 and 6 permit non-time-symmetric and asymptotically boosted slices. The invariant mass assertion in the converse refers to the original slice’s ADM integrals (2.4)–(2.4); it is not inferred only from an auxiliary Riemannian metric.

=== 2.1 The strict direction used in the variation <the-strict-direction-used-in-the-variation>

The numerical inequality applies on a constraint set with boundary: the dominant energy condition and the expansion condition may both be saturated. The following analytic input supplies a direction into its interior. Its proof is independent of the numerical inequality.

#thm([Lemma 2.7.])[
  (Strict conformal direction).  #emph[For the smooth exterior and decay in Definition 1, choose $0 < beta < min \( 1 \, q \)$ and a smooth positive extension $𝜚$ of the coordinate radius. Let $B gt.eq \| K \|$ be smooth and nonnegative, with $B = O_5 \( r^(- 1 - q) \)$. There is a unique smooth positive solution tending to zero at infinity of 
$ - Delta_g phi.alt = B sqrt(\| d phi.alt \|_g^2 + 𝜚^(- 2 k)) + 𝜚^(- n - beta) \, #h(2em) partial_nu phi.alt = - 1 quad upright("on ") S . $

 It satisfies $phi.alt = O_6 \( r^(2 - n) \)$, and $\( - Delta_g phi.alt \) \/ r^(- n - beta) arrow.r 1$. Its flux is finite and equals 
$ f_phi.alt := lim_(R arrow.r oo) integral_(S_R) partial_(nu_g) phi.alt thin d A_g = - "Area" \( S \) - integral_Omega [B sqrt(\| d phi.alt \|^2 + 𝜚^(- 2 k)) + 𝜚^(- n - beta)] d V_g < 0 . $

 For sufficiently small $delta > 0$, the pair $\( e^(2 delta phi.alt) g \, e^(delta phi.alt) K \)$ satisfies a strict global weighted dominant energy inequality and has strictly negative future expansion. Its energy is $E - delta f_phi.alt \/ omega$, its momentum is $P$, and its metric is at least $g$ and converges uniformly relative to $g$ as $delta arrow.b 0$.]
] <lem:strict-input>

This is the strict-direction lemma in the numerical companion #cite(label("CompanionNumerical")) Lemma 3.5; its complete exterior proof accompanies that numerical theorem. Below we also compute the precise active-ray derivative, since its positivity is the part needed for separation.

=== 2.2 How the dimension-dependent conclusions fit together <how-the-dimension-dependent-conclusions-fit-together>

Theorem 5 concerns a one-ended exterior with strong differentiated decay and requires no ambient extension behind its boundary. There are further conclusions for weaker decay in spatial dimensions three and four. Their precise hypotheses and statements appear in Theorems 53, 54, and 82.

The three-dimensional statements assume a complete boundaryless ambient initial-data manifold with finitely many asymptotically flat ends. The finite-component version forbids weakly trapped enclosing cuts even when they partly coincide with the given horizon; it forces one spherical component. With a connected boundary, the weaker wholly-interior outermostness condition suffices. These weak-decay statements are forward rigidity results. The four-dimensional statement is an exterior theorem, with a connected marginal outer-area-minimizing horizon and wholly-interior outermostness; it also includes its horizon-regular converse.

The distinction matters for the proof. The all-dimensional argument excludes possible interior null ends by a circle extension before forming a compact-core double. The low-dimensional classification arguments permit such ends while applying their positive-mass inputs. We will therefore match regularity and completion separately in each branch, after localizing the original-data variational equations.

== 3 Minimizing enclosures and their area envelope <q:geometry:section>

The area in the numerical inequality is an infimum over complete enclosing frontiers. A metric perturbation can change which frontier attains that infimum. We first describe the whole family of minimizers and then differentiate its least area. This argument concerns only the metric and the enclosing sets; no constraint equation or equality hypothesis enters it.

Let $\( X \, g \)$ be a connected orientable smooth $n$-manifold, $n gt.eq 3$, complete with its nonempty compact smooth boundary $B$ included. The boundary may be disconnected. Assume that outside a compact set $X$ is one Euclidean coordinate end and

#[#set math.equation(numbering: n => "(3.1)")
 $ g - delta = O_2 \( r^(- q) \) \, #h(2em) q > 0 . $ <q:geometry:AF>]

A full cut is the entire compact smooth embedded two-sided intrinsic boundary of a connected closed outer domain in $X$, whose interior lies in $"int" X$ and which contains the distant end. Every boundary component and every portion coincident with $B$ is counted. Write $a \( g \)$ for the infimum of their full areas.

Attach a compact smooth filling $O$ behind $B$ and extend the metric smoothly to the resulting boundaryless manifold $hat(X)$. Such a filling exists here: reverse a compact truncation of $X$ and cap its spherical end boundary with a ball. The remaining boundary is the oppositely oriented $B$. The filling and collar extension serve only to measure perimeter on $B$; the metric farther inside $O$ has no role. Let $cal(A)$ be the bounded finite-perimeter sets $E subset hat(X)$ containing $O$ almost everywhere, identified modulo null sets. Put

#[#set math.equation(numbering: n => "(3.2)")
 $ P_g \( E \) = \| D upright(bold(1))_E \|_g \( hat(X) \) \, #h(2em) T_E = "supp" \| D upright(bold(1))_E \|_g \, #h(2em) cal(T) \( g \) = "argmin"_(E in cal(A)) P_g \( E \) . $ <q:geometry:full-perimeter>]

Thus the perimeter is measured in the filled manifold, including contact with $B$. A smooth full cut bounds a filled set of precisely the same perimeter; in particular $P_g \( O \) = "Area"_g \( B \)$. We use the basic BV compactness, Gauss–Green and submodularity facts in #cite(label("AmbrosioFuscoPallara2000")) #cite(label("Maggi2012")).

=== 3.1 Existence, contact regularity, and strict barriers <existence-contact-regularity-and-strict-barriers>

#thm([Proposition 3.1.])[
  (The full minimizing enclosure).  #emph[The minimum in Equation (3.2) exists, equals $a \( g \) > 0$, and is independent of the filling. All its minimizing sets are contained in one compact region. Their multiplicity-one frontiers are smooth minimal hypersurfaces away from $B$ and a singular set of Hausdorff dimension at most $n - 8$; the singular set is empty when $n lt.eq 7$. Every contact point with $B$ is regular, with a $C^(1 \, alpha) ∩ W^(2 \, p)$ graph for every finite $p$ and $0 < alpha < 1$. For $n = 3 \, 4$ the whole frontier is $C^(1 \, 1)$, including contact, and its graph functions are $W^(2 \, oo)$.]
  #emph[In dimensions $3$ and $4$, each frontier bounds a connected exterior and is the $C^1$ and area limit of smooth full cuts contained in $"int" X$. If $H_B < 0$ for the normal into $X$, every minimizer contains one fixed exterior collar of $B$. In dimensions $3$ and $4$ its frontier is then a smooth minimal full cut; its closed exterior is connected, one-ended, complete with its boundary included, and outer area-minimizing with all boundary components counted. In every dimension, whenever a minimizing frontier is smooth, its closed exterior has these same connectedness, completeness, one-end and outer area-minimization properties.]
] <q:geometry:enclosure>

#proof[
  #emph[Confinement and existence.] For sufficiently large $R_0$ the end spheres have
  $ H_({ r = R }) = "div"_g \( nabla r \/ \| nabla r \|_g \) = frac(n - 1, R) + O \( R^(- 1 - q) \) > 0 . $
  Set $Y = nabla r \/ \| nabla r \|_g$. For each competitor $E$, and almost every $R > R_0$, the BV trace formula and Gauss–Green on $E ∩ { r > R }$ give
  #[#set math.equation(numbering: n => "(3.3)")
   $ P_g \( E \\ { r > R } \) - P_g \( E \) lt.eq - integral_(E ∩ { r > R }) "div"_g Y thin d V_g lt.eq 0 . $ <q:geometry:clipping>]
  Indeed the new slice area is the flux through the inner end of this region; the original exterior-boundary flux is at most its perimeter. At a good slicing radius the two traces agree, so these are exactly the terms in the perimeter difference. The inequality is strict if the removed set has positive volume.
  Fix $R_1 > R_0$. For each competitor choose a good radius in $\( R_0 \, R_1 \)$ and clip there. This confines a minimizing sequence to the same compact region. BV compactness and lower semicontinuity produce a global minimizer; containment of $O$ and emptiness in the fixed tail are closed constraints. Applying the strict inequality to any minimizer, at a good radius below a fixed $R_2$ with $R_0 < R_2 < R_1$, puts every minimizer inside the smaller truncation. There is no need for a radius that is simultaneously a good slice for every competitor.
  #emph[Recovering the full smooth-cut infimum.] A full cut supplies a member of $cal(A)$, so $min P_g lt.eq a \( g \)$. In the other direction choose a smooth collar field pointing strictly out of $O$ on $B$ and let $Phi_epsilon$ be its flow. For small positive $epsilon$, the set $Phi_epsilon \( E \)$ contains a neighborhood of $O$, and its perimeter tends to $P_g \( E \)$. Approximate its indicator in finitely many charts by convolution and a partition of unity, keeping it identically one on a smaller neighborhood of $O$ and zero outside a fixed compact region. The BV approximation and coarea formula give smooth level sets containing that neighborhood, with perimeters tending to $P_g \( Phi_epsilon \( E \) \)$. Fill every bounded complementary component of such a level set and retain the complementary component containing the end. Its closure in $X$ is a connected smooth outer domain; filling deletes boundary components and creates none. Its full-cut area is no larger than the approximating perimeter. Letting the approximation error, then $epsilon$, tend to zero proves $a \( g \) lt.eq P_g \( E \)$. This argument also works when $E$ has singular frontier.
  #emph[Local regularity.] Choose a smooth field $Z$ supported near $B$, with $\| Z \|_g lt.eq 1$ and $Z = nu_O$ on $B$. For any local replacement $F$ of a minimizer $E$, submodularity, constrained minimality, and Gauss–Green imply
  $ P_g \( E \) & lt.eq P_g \( F union O \) lt.eq P_g \( F \) + P_g \( O \) - P_g \( F ∩ O \) \,\
P_g \( O \) - P_g \( F ∩ O \) & lt.eq integral_(O \\ F) "div"_g Z thin d V_g lt.eq C "Vol"_g \( E triangle.stroked.t F \) . $
  The unchanged terms outside the replacement region cancel. Thus, if $E triangle.stroked.t F subset.double U$,
  #[#set math.equation(numbering: n => "(3.4)")
   $ P_g \( E \; U \) lt.eq P_g \( F \; U \) + C "Vol"_g \( E triangle.stroked.t F \) . $ <q:geometry:almost-minimality>]
  Ball insertion and deletion, followed by the relative isoperimetric inequality, give an upper perimeter bound $C r^(n - 1)$ and positive lower density bounds for both phases at every frontier point #cite(label("Maggi2012")). The volume error in Equation (3.4) scales as $r^n$. The local almost-minimizing-boundary theorem gives $C^(1 \, alpha)$ regularity at reduced-boundary points and minimizing boundary cones as tangent sets. Dimension reduction gives singular dimension at most $\( n - 1 \) - 7 = n - 8$; see #cite(label("BiZhu2026")) Theorem 2.27 and the codimension-one theory in #cite(label("Simon2018")) Chapter 7. Off the obstacle the minimizing property has zero error, so the regular frontier is smooth and minimal.
  At a contact point a tangent filled set contains the tangent half-space of $O$. Its stationary boundary cone lies on one side of the bounding plane. Such a cone is planar: the nonnegative height function on its spherical link satisfies weakly $Delta_(upright("link")) z = - \( n - 2 \) z$. Testing with the constant function makes its height integral zero, hence its support lies in the plane. The weak stationary identity is on the whole link and does not discard its singular set. The two density bounds and the multiplicity-one boundary property select a half-space rather than the full or empty set. Density regularity therefore makes the contact point a graph point.
  Equation (3.4), applied to flows with both signs, bounds the graph’s weak mean curvature. Its scalar minimal-surface operator has smooth coefficients and is uniformly elliptic on the bounded gradient range. Difference quotients yield $W^(2 \, 2)$ locally. In nondivergence form the leading coefficients are $C^(0 \, alpha)$ and the right side is bounded; localized linear $W^(2 \, p)$ estimates then give every finite $p$. The Sobolev embedding allows every $alpha < 1$. In dimensions $3$ and $4$ we also use the stronger smooth-obstacle theorem: for a $C^2$ obstacle, zero bulk term, and ambient dimension below eight, its entire minimizing frontier is $C^(1 \, 1)$ #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3(iii), pp. 368–369. This gives the stated $W^(2 \, oo)$ regularity.
  The frontier is nonempty. Otherwise its BV indicator is constant on the connected filled manifold, contrary to containment of the open obstacle and absence from an end tail. Its perimeter is positive; this follows from the relative isoperimetric inequality, or from a regular frontier chart.
  #emph[Connected exterior and smooth approximation in low dimensions.] Take the closure of the measure-theoretic interior as representative. When $n = 3 \, 4$ its frontier is compact embedded $C^(1 \, 1)$, with filled and exterior sets on its two local sides. Any complementary component other than the end component is relatively compact. Its boundary is a nonempty union of frontier components. Filling it removes positive full perimeter, contradicting minimality. The exterior is connected. The same argument applies in every dimension whenever the frontier is smooth. It only uses the local two-sided hypersurface charts and compactness.
  Choose a smooth field $V$ uniformly transverse to the continuous outward normal of the compact frontier $T$. Its flow gives a $C^1$ collar $Psi : T times \( - delta \, delta \) arrow.r hat(X)$ with filled side $t lt.eq 0$. For small $epsilon > 0$, the flowed set is $E union Psi \( T times \( 0 \, epsilon \] \)$; every crossing of the frontier is outward. It contains $O$ in its interior, and the displaced frontier lies at positive distance from $B$. Smooth a $C^1$ defining function in a smaller collar, retaining its positive derivative along $V$. The resulting smooth zero set is a small graph on the collar fibers. Extend the graph displacement to an isotopy supported in that collar; it fixes $O$ and the distant end. Enclosure and connectedness of the exterior are therefore preserved. The resulting full cuts converge in $C^1$ and area to $T$.
  #emph[Detachment from a strict inner barrier.] If $H_B < 0$ for the normal into $X$, a fixed distance collar $0 lt.eq t lt.eq epsilon$ has $Y = partial_t$ and $"div"_g Y lt.eq - beta < 0$. For a good level $s$, put $O_s = O union { 0 < t < s }$ and $W_s = O_s \\ E$. Gauss–Green on $W_s$, including the flux on $t = 0$, gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ P_g \( E union O_s \) - P_g \( E \) lt.eq integral_(W_s) "div"_g Y thin d V_g lt.eq - beta "Vol"_g \( W_s \) . $ <q:geometry:detachment>]
  Minimality makes $W_s$ null. Choosing, for each minimizer, a good $s in \( epsilon \/ 2 \, epsilon \)$ proves that the same smaller collar lies in its filled interior. Thus all contact is removed.
  For $n = 3 \, 4$ the detached frontier is now smooth and minimal. More generally, in any dimension where the frontier under consideration is smooth, its connected closed exterior $D$ contains just the original end. It is complete in its intrinsic length metric: an intrinsic Cauchy sequence is Cauchy in $X$, has a limit in the closed set $D$, and smooth interior or boundary half-ball charts give intrinsic convergence to that limit. Finally, every full enclosing cut of $D$ gives a filled competitor containing $E$ and hence $O$. Its full area is at least $P_g \( E \)$. This proves outer area-minimization with every component and all coincidence counted. ◻
]

=== 3.2 Continuity of planes before differentiation <continuity-of-planes-before-differentiation>

For $E in cal(T) \( g \)$ define the position-and-plane measure $V_E$ on the bundle of unoriented $\( n - 1 \)$-planes by

#[#set math.equation(numbering: n => "(3.6)")
 $ integral Phi thin d V_E = integral_(partial^(*) E) Phi \( x \, T_x partial^(*) E \) thin d A_g . $ <q:geometry:plane-measure>]

Singular points have zero perimeter measure. Give $cal(T) \( g \)$ the topology of $L^1$ convergence of indicators and weak convergence of these measures. The next result explains why its second requirement follows from the first, and why it is needed for the metric derivative.

#thm([Proposition 3.2.])[
  (Compactness and the derivative of least area).  #emph[The space $cal(T) \( g \)$ is compact and metrizable. For every smooth symmetric two-tensor $h$ the function 
$ E mapsto a'_E \( h \) := 1 / 2 integral_(partial^(*) E) "tr"_(T partial^(*) E) h thin d A_g $

 is continuous on it. Let $g_t$, $\| t \| < t_0$, be a smooth path of smooth metrics with $g_0 = g$, extended smoothly through the fixed boundary. Assume uniform comparison with $g$, and bounded first and second parameter derivatives relative to $g$. One sufficient end hypothesis is 
#[#set math.equation(numbering: n => "(3.7)")
 $ g_t - delta = O_2 \( r^(- q_(*)) \) quad upright("uniformly for ") \| t \| < t_0 \, #h(2em) q_(*) > 0 . $ <q:geometry:uniform-AF>]

 More generally, it suffices that the coordinate spheres have positive outward mean curvature beyond one common radius. The result also holds if the end metrics are uniformly comparable to the Euclidean metric with uniform scaled $C^1$ bounds; they need not have a common mean-convex tail in this last alternative. Put $h = partial_t g_t \|_0$. Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ frac(d, d t)\|_(0 +) a \( g_t \) = min_(E in cal(T) \( g \)) a'_E \( h \) . $ <q:geometry:envelope-derivative>]

 For any $t_j arrow.r 0$ and any $E_j in cal(T) \( g_(t_j) \)$, a subsequence converges in $L^1$ to $E in cal(T) \( g \)$, with convergence of perimeters and of the plane measures computed in the fixed metric $g$.]
] <q:geometry:envelope>

#proof[
  The uniform asymptotic hypothesis gives one mean-convex tail, so Equation (3.3) confines all minimizers uniformly. The same proof applies under the common-sphere hypothesis. For the last alternative, existence can be proved without an outer barrier. Minimize inside successively larger closed coordinate truncations. Each constrained minimum exists by the direct method and is at most $P_(g_t) \( O \)$. Local BV compactness yields a limiting set containing $O$, of finite total perimeter. The minimizing values decrease to the infimum over bounded competitors. The limit is locally minimizing away from $O$, and constrained-minimizing at $O$: to compare it with a compact replacement, glue that replacement into the truncated minimizers across a thin annulus. Coarea chooses a slicing boundary on which the $L^1$ trace discrepancy tends to zero, so the added perimeter tends to zero. The minimizing inequality then passes to the limit. This is the local minimizing-boundary compactness argument in the BV framework of #cite(label("AmbrosioFuscoPallara2000")) #cite(label("Maggi2012")).
  The limit has finite volume, so its exterior phase is the empty one once its frontier is confined. To see the finite-volume assertion before using confinement, apply the Euclidean isoperimetric inequality to the filled part on the coordinate end with a fixed inner slicing sphere, capping that slice inside the coordinate ball. Its Euclidean perimeter is bounded by the original perimeter times the uniform metric-comparison constant, plus the fixed sphere area. The resulting volume bound is uniform in the outer truncation; local convergence passes it to the limit.
  Testing on $O$ gives a uniform perimeter bound. If a minimizing frontier passes through an end point of radius $r$, a coordinate ball of radius $c r$ about that point misses the obstacle. The rescaled metrics are uniformly elliptic with uniformly bounded first derivatives, and the frontier is locally perimeter-minimizing in that ball. The interior perimeter density estimate gives area at least $c_1 r^(n - 1)$, with $c_1$ uniform. This contradicts the fixed upper bound for large $r$. Thus the limiting frontier lies in a fixed compact region. The connected end tail is therefore almost everywhere full or empty; finite volume makes it empty. The limiting set is an admissible bounded competitor. Lower semicontinuity bounds its perimeter by the infimum approached by the truncated minima, so it is a global minimizer. The same density argument confines every global minimizer, uniformly in $t$. Thus their bounded filled sides again lie in one compact set.
  BV compactness now applies on that compact region. For fixed-metric minimizers $E_j arrow.r E$ in $L^1$, lower semicontinuity gives
  $ a \( g \) lt.eq P_g \( E \) lt.eq liminf_j P_g \( E_j \) = a \( g \) . $
  Thus the limit is a minimizer and the perimeters converge. Set $sigma_j = \| D upright(bold(1))_(E_j) \|_g$ and $sigma = \| D upright(bold(1))_E \|_g$. Weighted lower semicontinuity makes every weak limit of $sigma_j$ dominate $sigma$. Their total masses agree, so $sigma_j harpoon.rt sigma$. The normal vector measures $nu_j sigma_j$ converge weakly to $nu sigma$ by Gauss–Green.
  To pass from normals to tangent planes, cover the compact support by finitely many charts with nonnegative smooth partition weights $rho_alpha$. Choose a smooth matrix $A_alpha \( x \)$ in each chart such that $\| A_alpha \( x \) v \|_delta = \| v \|_g$. The Euclidean vector measures
  $ lambda_(alpha \, j) = rho_alpha A_alpha nu_j sigma_j quad upright("have") quad \| lambda_(alpha \, j) \|_delta = rho_alpha sigma_j . $
  They converge weakly and their total variations have convergent masses. The localized Reshetnyak continuity theorem #cite(label("Reshetnyak1968")), in the polar-direction formulation of #cite(label("Spector2011")) Theorem 1.3, therefore applies to
  $ \( x \, z \) mapsto Phi #scale(x: 120%, y: 120%)[\(] x \, \( A_alpha \( x \)^(- 1) z \)^(perp_g) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| z \|_delta = 1 . $
  Insert a continuous compact cutoff equal to one on the localized support, so the integrand is bounded on the chart, and sum over the partition. This proves weak convergence of $V_(E_j)$, including contact mass: a chart crossing $B$ is an interior chart of $hat(X)$. It is convergence of plane integrals, not yet pointwise convergence of tangent planes. Compact supports and bounded masses make the indicated measure topology metrizable. The subsequence argument proves compactness, and the choice $Phi \( x \, Pi \) = 1 / 2 "tr"_Pi h$ proves continuity.
  For varying metrics, uniform convergence on the confining region provides $epsilon_t arrow.r 0$ such that
  $ \( 1 - epsilon_t \) P_g \( F \) lt.eq P_(g_t) \( F \) lt.eq \( 1 + epsilon_t \) P_g \( F \) $
  for every confined competitor. Testing a fixed $g$-minimizer and using $P_g \( E_t \) gt.eq a \( g \)$ shows $a \( g_t \) arrow.r a \( g \)$ and $P_g \( E_t \) arrow.r a \( g \)$. Hence every BV limit is a $g$-minimizer and the preceding localized argument gives its plane measure convergence.
  On the compact Grassmann bundle the area density has the uniform Taylor expansion
  #[#set math.equation(numbering: n => "(3.9)")
   $ P_(g_t) \( F \) = P_g \( F \) + t thin a'_F \( h \) + O \( t^2 \) P_g \( F \) . $ <q:geometry:area-taylor>]
  Testing every fixed $E in cal(T) \( g \)$ gives $limsup_(t arrow.b 0) \( a \( g_t \) - a \( g \) \) \/ t lt.eq min_E a'_E \( h \)$. For the other bound choose $E_t in cal(T) \( g_t \)$. Its $g$-perimeter is uniformly bounded and at least $a \( g \)$, so
  $ frac(a \( g_t \) - a \( g \), t) gt.eq a'_(E_t) \( h \) - O \( t \) . $
  Every sequence tending to zero has a subsequence whose plane measures converge to those of a $g$-minimizer. The right side then tends to a value at least $min_E a'_E \( h \)$. This proves both the derivative and its formula, with no uniqueness or smooth choice of a minimizing cut. ◻
]

=== 3.3 Tied sheets and uniform graphical separation <tied-sheets-and-uniform-graphical-separation>

The averaged area source later requires one plane at a point shared by different minimizing frontiers. It also requires quantitative control when a nearby frontier approaches a given regular sheet. These are local consequences of minimizing geometry, distinct from the integral continuity just proved.

#thm([Proposition 3.3.])[
  (No crossing and uniform regular sheets).  #emph[If a minimizing frontier meets the free regular part of another, the two frontiers agree locally at that point. In particular the plane field on the union of their free regular parts is well-defined and continuous in its relative topology. Around every such point there are nested graph cylinders, disjoint from $B$, in which every minimizing frontier meeting the smaller cylinder is a single smooth graph over the same base. The graph bounds are uniform on smaller base domains. Two such graphs either agree or are disjoint and can be ordered. For $V' subset.double V$ and fixed $y_0 in V$, their ordered heights obey 
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel h_1 - h_2 parallel_(C^j \( V' \)) lt.eq C_j \| h_1 \( y_0 \) - h_2 \( y_0 \) \| \, #h(2em) j = 0 \, 1 \, 2 \, dots.h \, $ <q:geometry:graph-separation>]

 with constants uniform in the two minimizers.]
] <q:geometry:sheets>

#proof[
  For minimizing sets $E \, F$, submodularity gives
  $ P_g \( E union F \) + P_g \( E ∩ F \) lt.eq P_g \( E \) + P_g \( F \) = 2 a \( g \) . $
  Each term on the left is at least $a \( g \)$, so the union and intersection are themselves minimizers and the submodularity deficit is zero as a measure. Let $x in T_F$ lie on a free regular sheet of $T_E$. Blow up both sets at $x$ along a common sequence, writing $H$ for the tangent half-space of $E$ and $C$ for a tangent set of $F$. Their unions and intersections converge in $L^1$ to $C union H$ and $C ∩ H$. Minimizing-boundary compactness makes these minimizing cones, with empty and full sets allowed. The half-space argument in Proposition 8 gives
  $ C union H in { H \, bb(R)^n } \, #h(2em) C ∩ H in { diameter \, H } . $
  Thus $C$ is one of $H \, H^c \, diameter \, bb(R)^n$; the density bounds for $F$ rule out the latter two.
  If $C = H$, both union and intersection have density-one planar tangent and are regular near $x$. Their minimal graphs are ordered against the reference sheet and touch it at $x$. The strong comparison principle makes them agree with it locally, hence so does $T_F$. If $C = H^c$, the union has full tangent and the intersection empty tangent. The uniform two-phase density bounds at frontier points put $x$ outside the supports of both boundaries. In a neighborhood the union is full and the intersection empty, so $F$ is the complement of $E$ there. Their common open sheet contributes twice its positive area to $P_g \( E \) + P_g \( F \)$ and zero to the union and intersection. That contradicts the zero submodularity deficit. This excludes the opposite coorientation and proves local agreement.
  We next justify the uniform graphical assertion, including the entire support. Suppose $x_j in T_(E_j)$ tends to a free regular point $x$ of a fixed minimizing frontier. Compactness from Proposition 9 gives a minimizing limit $E_oo$. Uniform density bounds put $x in T_(E_oo)$, and the preceding argument identifies its sheet near $x$ with the fixed regular sheet. In a ball about $x$ missing $B$, all these boundaries are locally area-minimizing. Their integral varifolds are stationary in the smooth ambient metric, with multiplicity one and no boundary. The limit is smooth with density one.
  Choose a sufficiently small continuity radius for its area measure. The limiting mass ratio is close to one and its height and tilt excesses relative to $T_x T_(E_oo)$ are small. Plane-measure convergence transfers these properties to $E_j$. Moving centers to $x_j$ changes the required radii by a quantity tending to zero. To apply the small-excess theorem in a Riemannian chart, use its smooth-ambient form, or smoothly isometrically embed a neighborhood: stationarity in the ambient manifold gives Euclidean generalized mean curvature bounded by the ambient second fundamental form. After rescaling by the small radius, the required $L^p$ curvature norm is small for any fixed $p > n - 1$.
  Allard’s graphical theorem therefore represents the entire support in a smaller ball by a single $C^(1 \, alpha)$ graph with uniform bounds #cite(label("Allard1972")) #cite(label("Maggi2012")); the exact small-mass and $L^p$ mean-curvature formulation is #cite(label("Simon2014")) Chapter 5, Section 5, Theorem 5.2. It leaves no second small sheet or spike outside a selected graphical component. Uniform graph compactness and the identified varifold limit give $C^1$ convergence; interior estimates for the smooth minimal-graph equation improve this to smooth convergence on smaller domains. A sequence contradicting uniform cylinders or uniform graph bounds would have precisely such a convergent subsequence, which is impossible. The same argument for $x_j arrow.r x$ proves continuity of the common plane field.
  Two distinct local graphs do not meet by the first part of the proof, so their heights can be ordered. Their nonnegative difference solves a linear uniformly elliptic equation, obtained by integrating the derivative of the scalar minimal-graph operator between the two graphs. The preceding interior bounds give uniform coefficient bounds of every order, including the lower-order terms. The Harnack inequality for a nonnegative solution bounds its size on smaller domains by its value at $y_0$; interior derivative estimates then give Equation (3.10). If that value is zero, the same principle makes the two graphs coincide. ◻
]

== 4 Equality as a constrained minimum of the original data <sec:variation>

We now assume the hypotheses of the rigidity assertion, including equality, and return to the original pair $\( g \, K \)$. The only conclusion needed from the numerical argument, Theorem 3, is its inequality for all sufficiently small admissible variations of these original data. Those variations need not satisfy the additional outermostness or area-minimization hypotheses of the rigidity assertion. No equality statement for a Riemannian deformation, and no rigidity theorem in another dimension, is used here. In this section $u \, X$ denote the lapse and shift obtained as constraint multipliers.

Our goal is to show that the area multiplier is supported entirely on the original boundary. We first retain all minimizing frontiers in a relaxed variation formula, then remove their interior support before invoking smooth outermostness.

Put

#[#set math.equation(numbering: n => "(4.1)")
 $ r_h = \( A \/ omega \)^(1 \/ k) \, #h(2em) m = 1 / 2 r_h^(k - 1) \, #h(2em) b^0 = E \/ m \, #h(2em) b^i = - P_i \/ m \, #h(2em) c = \( k - 1 \) \/ r_h . $ <eq:variation:constants>]

For nearby charges define $cal(E) = b^0 E_(upright("new")) + b^i P_(upright("new") \, i)$. The reverse Cauchy–Schwarz inequality for future timelike vectors gives $cal(E) gt.eq \( E_(upright("new"))^2 - \| P_(upright("new")) \|^2 \)^(1 \/ 2)$. At the original data, $cal(E) = m$, and, for $F \( a \) = 1 / 2 \( a \/ omega \)^(\( k - 1 \) \/ k)$,

#[#set math.equation(numbering: n => "(4.2)")
 $ 2 k omega F' \( A \) = c . $ <eq:variation:area-derivative-constant>]

=== 4.1 The relaxed area envelope <the-relaxed-area-envelope>

Apply Section 3 to the original exterior $\( Omega \, g \)$ and its boundary $S$. Its hypotheses follow from the smoothness, completeness, compact-complement one-end condition and asymptotic decay in Definition 1. Use the compact filling $O$ constructed there and write $frak(T) = cal(T) \( g \)$ and $Gamma_C = T_C$. The boundary is outer area-minimizing, so its area $A$ equals the full-cut infimum. In particular, the original filled obstacle is itself a minimizing competitor. The normalizations of the constraint densities play no role in this geometric step.

Several enclosures may attain $A$. We retain all of them: under a metric variation the right derivative of their least area is the least of their first variations. This compact family will carry the probability measure in the multiplier identity below.

#thm([Lemma 4.1.])[
  (Envelope and local geometry).  #emph[The minimum perimeter is $A$. The family $frak(T)$ is compact in $L^1$, its members lie in one compact set, and convergence within it is strict convergence of vector perimeter measures. The same uniform confinement and subsequential convergence to $frak(T)$ hold for minimizers of the smooth metric paths used below.]
  #emph[Each $Gamma_C$ is a multiplicity-one almost-minimizing boundary, with singular set of Hausdorff dimension at most $n - 8$. Its free regular part is smooth and minimal. Every contact point with $S$ is regular, with a $C^(1 \, alpha) ∩ W^(2 \, p)$ graph for every finite $p$. Whenever the frontier is smooth, its closed exterior is connected, complete, one-ended, and outer area-minimizing. Near a free regular point there are uniform smaller cylinders in which all minimizing frontiers meeting the cylinder are single graphs. Distinct graphs are disjoint, and their ordered heights satisfy 
#[#set math.equation(numbering: n => "(4.3)")
 $ parallel h_1 - h_2 parallel_(C^j \( V' \)) lt.eq C_j \| h_1 \( y_0 \) - h_2 \( y_0 \) \| \, #h(2em) V' subset.double V \, $ <eq:variation:graph-separation>]

 with constants uniform in the two members. For $g_t = g + t h + o \( t \)$ among these paths, 
#[#set math.equation(numbering: n => "(4.4)")
 $ frac(d, d t)\|_(0 +) a \( g_t \) = min_(C in frak(T)) a'_C \( h \) \, #h(2em) a'_C \( h \) = 1 / 2 integral_(partial^(*) C) "tr"_(T partial^(*) C) h thin d A_g . $ <eq:variation:envelope-derivative>]

]
] <lem:variation:envelope>

#proof[
  Proposition 8 gives the full-perimeter realization and regularity with obstacle $S$, without invoking any rigidity assertion. For the paths below, the compact variations vanish in the tail, while the charge prototypes and strict conformal direction have metric perturbation $O_2 \( r^(2 - n) \)$. After decreasing the parameter interval, these are uniformly asymptotically flat, uniformly positive, and smoothly controlled on the compact region. Thus Proposition 9 applies, including its localized plane-measure continuity. Proposition 10 gives the graph cylinders and Equation (4.3). ◻
]

=== 4.2 Separation with active constraints <separation-with-active-constraints>

Let

$ frak(A) = { \( x \, v \) : x in Omega \, med \| v \|_g lt.eq 1 \, med mu \( x \) + J_x \( v \) = 0 } $

be the closed set of active rays. For a variation $\( h \, p \) = \( g' \, K' \)$ transport the original ball isometrically by the metric square root; thus $v' = - 1 / 2 h^sharp v$. Denote the resulting derivative of $2 \( mu + J \( v \) \)$ by $frak(C)' \( h \, p \; v \)$.

#thm([Proposition 4.2.])[
  (Constraint and area multipliers).  #emph[There are a probability measure $pi$ on $frak(T)$, a locally finite nonnegative measure $Lambda$ on $frak(A)$, and a finite nonnegative measure $zeta$ on $S$, such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ 2 k omega cal(E)' \( h \, p \) - c integral_(frak(T)) a'_C \( h \) thin d pi \( C \) = integral_(frak(A)) frak(C)' \( h \, p \; v \) thin d Lambda \( x \, v \) - integral_S theta'_(+) \( h \, p \) thin d zeta . $ <eq:variation:multiplier>]

 This identity holds for all smooth compactly supported variations, including arbitrary jets at $S$, and for the energy and momentum prototypes specified below. The scalar and vector moments of $Lambda$ obey, initially as measures, 
#[#set math.equation(numbering: n => "(4.6)")
 $ u gt.eq \| X \|_g \, #h(2em) u mu + J \( X \) = 0 . $ <eq:variation:causality>]

 Here a field and its density relative to the fixed original volume form are identified when that density exists.]
] <prop:variation:multiplier>

#proof[
  Choose $0 < beta < min \( 1 \, q \)$, let $𝜚$ be a smooth positive extension of the end radius, and set $rho_0 = 𝜚^(- n - beta)$. The strict conformal direction in Lemma 7 supplies $phi.alt = O_6 \( r^(2 - n) \)$, with finite flux,
  #[#set math.equation(numbering: n => "(4.7)")
   $ - Delta phi.alt = B sqrt(\| d phi.alt \|^2 + 𝜚^(- 2 k)) + rho_0 \, #h(2em) partial_nu phi.alt = - 1 \, #h(2em) frac(- Delta phi.alt, rho_0) arrow.r 1 \, $ <eq:variation:strict-direction>]
  where $B gt.eq \| K \|$ is smooth and $B = O_5 \( r^(- 1 - q) \)$. The strict direction is $\( 2 phi.alt g \, phi.alt K \)$. The conformal variation formula gives
  $ frak(C)' = - 4 phi.alt \( mu + J \( v \) \) + 2 k { - Delta phi.alt + K \( nabla phi.alt \, v \) } . $
  It is strictly positive on active rays, its quotient by $rho_0$ tends to $2 k$, and $- theta'_(+) = k$ on $S$.
  Take the real vector space generated by all compact variations, this strict direction, and cut-off end prototypes of the following forms:
  #[#set math.equation(numbering: n => "(4.8)")
   $ h = r^(2 - n) delta \, med p = 0 \; #h(2em) h = 0 \, quad p - \( "tr"_delta p \) delta = Pi \( a \) \, quad Pi \( a \)_(i j) = r^(- n) \( a_i x_j + a_j x_i - \( a dot.op x \) delta_(i j) \) . $ <eq:variation:prototypes>]
  The flat scalar linearization of the first is zero outside the cutoff, and $partial^j Pi \( a \)_(i j) = 0$. Their ADM derivatives are respectively $E' = \( n - 2 \) \/ 2$ and $P'_i = a_i \/ k$; thus they span all charge derivatives. In the original background their constraint derivatives, also with ray transport, are $O \( r^(- n - q) \)$. Their normalized values on the active rays therefore tend to zero.
  The coefficient of the strict direction is well defined. Otherwise, outside a compact set we would have $2 a phi.alt g = b r^(2 - n) delta$ for constants $a eq.not 0$ and $b$. Taking the Euclidean trace gives
  $ phi.alt = frac(b n, 2 a) frac(r^(2 - n), "tr"_delta g) = frac(b, 2 a) r^(2 - n) + O_6 \( r^(2 - n - q) \) . $
  Since $Delta_delta r^(2 - n) = 0$, this would imply $Delta_g phi.alt = O \( r^(- n - q) \)$, contradicting $\( - Delta_g phi.alt \) \/ rho_0 arrow.r 1$ and $beta < q$. This argument also covers bounded or empty active-ray sets.
  Adjoin one infinity point to $frak(A)$, using its one-point compactification when it is unbounded and an isolated point otherwise. On this point assign $2 k$ times the strict-direction coefficient. The linear map
  #[#set math.equation(numbering: n => "(4.9)")
   $ \( h \, p \) mapsto (frak(C)' / rho_0 \, med - theta'_(+) \, med { c a'_C \( h \) - 2 k omega cal(E)' \( h \, p \) }_(C in frak(T))) $ <eq:variation:separation-map>]
  takes values in continuous functions on the disjoint compact union $frak(A)^oo union.sq S union.sq frak(T)$. Continuity on the last factor is the strict tangent-plane continuity proved above.
  Its image contains no strictly positive function. To check this without a constraint-surjectivity assumption, suppose such a variation has strict-direction coefficient $a > 0$, and write its remaining part as $\( h_0 \, p_0 \)$. Use the path
  #[#set math.equation(numbering: n => "(4.10)")
   $ g_t = e^(2 a t phi.alt) \( g + t h_0 \) \, #h(2em) K_t = e^(a t phi.alt) \( K + t p_0 \) \, #h(2em) t gt.eq 0 . $ <eq:variation:feasible-path>]
  On a compact region, strict positivity on the compact active set, continuity on the unit-ball bundle, and Taylor’s formula make all constraints nonnegative for sufficiently small $t$. This argument also covers nearby inactive rays; the remaining compact inactive set has a positive original minimum.
  On the end the conformal identity leaves a positive multiple of the nonnegative original contraction unaltered in sign. The additional non-strict linear error is $O \( t r^(- n - q) \)$. Quadratic prototype and conformal errors are $O \( t^2 r^(2 - 2 n) \) = O \( t^2 rho_0 \)$, since $beta < 1$. The strict conformal term is $2 k a t rho_0 \( 1 + o \( 1 \) \)$, uniformly in the transported unit ball. Choose the radius first, then $t$; it dominates both errors and proves DEC there. Likewise $theta_(+) \( S \) < 0$ for small positive $t$. Uniform metric equivalence preserves completeness and positive full-cut area, and the perturbations preserve the stated decay, integrability, and differentiable ADM limits. Future timelikeness of the charges is open. Thus the numerical theorem applies to Equation (4.10).
  The third component of Equation (4.9), together with Equation (4.4), would give $2 k omega cal(E)' < c a' \( 0 + \)$, contradicting $cal(E) \( g_t \, K_t \) gt.eq F \( a \( g_t \) \)$ and equality at $t = 0$. This proves disjointness from the open positive cone. Hahn–Banach separation of an open convex cone from a linear subspace gives a nonzero continuous functional, nonnegative on nonnegative functions, annihilating the image. No closed range is required. By the Riesz representation theorem it consists of three finite nonnegative measures.
  The mass of the measure on $frak(T)$ is positive. Otherwise its value on the strict direction would be positive, because the first two components of that direction have positive minima and some nonzero measure would remain on them. Normalize this mass to one, calling that measure $pi$. On the finite part of $frak(A)^oo$ divide its measure by $rho_0$, giving $Lambda$, and call the boundary measure $zeta$. An infinity atom contributes zero on compact variations and prototypes, exactly the tests asserted in Equation (4.5). It is therefore absent from that identity, without having been assumed to vanish on the strict test. The normalized identity is Equation (4.5).
  Define the moments by $u \( f \) = integral f \( x \) thin d Lambda$ and $X \( alpha \) = integral alpha_x \( v \) thin d Lambda$. The unit-ball condition gives $\| X \| lt.eq u$, and support on $frak(A)$ gives the complementarity identity in Equation (4.6). ◻
]

=== 4.3 Exact adjoints and regularity of the multipliers <exact-adjoints-and-regularity-of-the-multipliers>

The separating measures are initially only measures. Their exact adjoint equations supply the regularity and the positive Hessian source needed to analyze the frontiers carrying area mass. The modified-adjoint and null-perfect-fluid framework of #cite(label("HuangLee2024Bartnik")) Section 6.1 is a useful precedent, but does not supply these area-source terms or their support analysis.

#thm([Lemma 4.3.])[
  (Interior equations).  #emph[In the open original exterior the moments have representatives $u in C_(upright("loc"))^(0 \, 1)$ and $X in C_(upright("loc"))^(1 \, 1)$, and $u$ is locally semiconvex. Define the tensor-valued measures 
$ d sigma = integral_(frak(T)) d A_C thin d pi \( C \) \, #h(2em) d cal(N) = integral_(frak(T)) nu_C^flat ⊗ nu_C^flat thin d A_C thin d pi \( C \) \, #h(2em) d cal(T) = g thin d sigma - d cal(N) . $

 Their interior equations are 
#[#set math.equation(numbering: n => "(4.11)")
 $ "sym" nabla X & = - u K \,\
"Hess" u - \( Delta u \) g + cal(S) \( u \, X \, nabla X \) & = - c / 2 thin d cal(T) \,\
"Hess" u & = cal(B) \( u \, X \, nabla X \) + c / 2 thin d cal(N) \, #h(2em) cal(B) = - cal(S) + frac("tr" cal(S), k) g \, $ <eq:variation:shift>]

 where the smooth-coefficient linear expression is 
#[#set math.equation(numbering: n => "(4.12)")
 $ cal(S) =  & - u "Ric" + 2 u \( K^2 - tau K \) + cal(L)_X K - \( "div" X \) K\
 & - "div" \( K \( X \, dot.op \) \) g - J_(\( i) X_(j \)) . $ <eq:variation:S>]

 In particular the measure in Equation (4.11) is positive semidefinite. Equations (4.11) and (4.11) close after one prolongation on the first jets of $u \, X$, apart from this explicitly displayed measure.]
] <lem:variation:adjoints>

#proof[
  All pairings in this proof use the fixed original volume density. Direct differentiation gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ \( 2 mu \)' =  & nabla^i nabla^j h_(i j) - Delta "tr" h - chevron.l "Ric" \, h chevron.r + 2 tau \( "tr" p - chevron.l K \, h chevron.r \) - 2 chevron.l K \, p chevron.r + 2 chevron.l K^2 \, h chevron.r \,\
J'_i =  & nabla^j p_(i j) - nabla_i "tr" p + h^(j l) \( nabla_i K_(j l) - nabla_l K_(i j) \) + 1 / 2 K^(j l) nabla_i h_(j l) - K_i zws^a nabla^j h_(a j) + 1 / 2 K_i zws^a nabla_a "tr" h \,\
frak(C)' =  & \( 2 mu \)' + 2 J' \( v \) - J_i h^i zws_j v^j . $ <eq:variation:scalar-linearization>]
  For Equation (4.13), vary both inverse metrics and both connection terms in $"div" \( K - tau g \)$; terms involving $h thin d tau$ and $tau thin d h$ cancel. The last term of Equation (4.13) is the metric-square-root ray transport, and must be retained.
  On compact interior tests the objective derivative is zero. Integration by parts of the $p$ terms in Equation (4.5) gives
  $ 2 { u \( tau g - K \) - "sym" nabla X + \( "div" X \) g } = 0 . $
  Taking its trace yields $"div" X = - u tau$, and substitution proves Equation (4.11). The curvature principal part has adjoint $"Hess" u - \( Delta u \) g$. Integrating the metric terms of $2 J' \( X \)$ gives
  $ cal(L)_X K - \( "div" X \) K - "div" \( K \( X \, dot.op \) \) g . $
  The algebraic scalar terms and ray transport give the other terms of Equation (4.12). The area derivative is $1 / 2 chevron.l d cal(T) \, h chevron.r$, proving Equation (4.11). Its trace is $- k Delta u + "tr" cal(S) = - c k thin d sigma \/ 2$; substitution proves Equation (4.11), including its sign and coefficient.
  For the regularity assertion, differentiate Equation (4.11) and commute derivatives. One convenient formula, in which the commutator convention is explicit, is
  #[#set math.equation(numbering: n => "(4.14)")
   $ nabla_i nabla_j X_l =  & - nabla_i \( u K_(j l) \) - nabla_j \( u K_(i l) \) + nabla_l \( u K_(i j) \)\
 & + 1 / 2 #scale(x: 120%, y: 120%)[\(] \[ nabla_i \, nabla_j \] X_l - \[ nabla_i \, nabla_l \] X_j - \[ nabla_j \, nabla_l \] X_i #scale(x: 120%, y: 120%)[\)] . $ <eq:variation:prolongation>]
  The commutators are smooth curvature coefficients times $X$. Taking traces of Equation (4.11) and Equation (4.14) gives a system with diagonal Laplace principal part and smooth first-order lower terms. Its sole measure source has growth $O \( r^(n - 1) \)$, uniformly on compact subsets, by the perimeter bound in Lemma 11.
  To spell out the regularity furnished by this growth, a local order-minus-two parametrix for this smooth-coefficient elliptic system has kernel bounded by $C \| x - y \|^(2 - n)$ and first derivative bounded by $C \| x - y \|^(1 - n)$; its localized remainder is smooth. These estimates follow by freezing the principal matrix in a small coordinate ball, using the Newton kernel, and successively correcting the smooth coefficient error; first-order terms have one additional integrable power. Applied to a measure with mass at most $C r^(n - 1)$, the near part of a first difference is $O \( delta \)$ and the annuli between $delta$ and a fixed radius contribute $O \( delta log \( 1 \/ delta \) \)$. Hence the potential is $C^(0 \, alpha)$ for every $alpha < 1$. The same local parametrix applies to distributional solutions, leaving only a smooth homogeneous remainder. Thus both $u$ and $X$ are $C^(0 \, alpha)$. Equation (4.14), or its trace in divergence form, and the scalar Schauder estimate with Hölder divergence data then give $X in C^(1 \, alpha)$.
  Now $cal(B)$ is locally bounded and continuous. The positive tensor in Equation (4.11) implies a lower bound on the covariant Hessian of $u$. One can pass from this distributional statement to semiconvexity without already assuming a bounded gradient. In a smooth chart mollify $u$. The commutator between $Gamma thin d u$ and convolution is bounded by $C epsilon^alpha$: integrate its derivative onto the kernel, subtract the value of $u$ at the center, and use the smooth coefficient oscillation and the $C^(0 \, alpha)$ bound. Thus the mollified covariant Hessian is bounded below uniformly. Restriction to a unit-speed geodesic gives a uniform lower bound for the ordinary second derivative. Uniform convergence transfers this bound to $u$. Bounds on $u$ on slightly longer geodesic segments bound both one-sided slopes on shorter segments; hence $u$ is locally Lipschitz. Equation (4.14) now has a bounded right side in every component, so $nabla^2 X in L^oo$ and $X in C^(1 \, 1)$. Finally bounded $d u$ converts the covariant Hessian lower bound to ordinary coordinate semiconvexity. This also proves the stated closure on first jets. ◻
]

=== 4.4 Compact normal variations through the active constraints <compact-normal-variations-through-the-active-constraints>

The multiplier identity still contains every minimizing frontier. To understand its typical support we need variations that move the metric normally, $h = 2 s K$, while making the derivative of each active constraint vanish. A Gaussian collar supplies such infinitesimal variations. It is only a device for calculating these tests; no spacetime development or energy condition for neighboring slices is assumed.

#thm([Lemma 4.4.])[
  (Compact dust tests).  #emph[Let $g \, K$ be smooth on an open set $U$ of spatial dimension $n gt.eq 3$, and suppose that $mu gt.eq \| J \|_g$, with the constraint and future-normal conventions of this paper. If $s in C_c^oo \( U \)$, there are smooth, compactly supported tensor variations $\( h \, p_delta \)$, $delta > 0$, such that 
$ h = 2 s K \, #h(2em) sup_(x in U \, med \| v \|_g lt.eq 1\
mu \( x \) + J_x \( v \) = 0) \| frak(C)' \( h \, p_delta \; v \) \| arrow.r 0 . $

 The supremum may equivalently be taken over a fixed compact neighborhood of $"supp" s$, since the variations vanish outside that neighborhood. Here the ray is transported with derivative $v' = - 1 / 2 h^sharp v$, as in Equation (4.5). In particular, if the compact multiplier identity Equation (4.5) holds with a locally finite active-ray measure $Lambda$, then these tests have $integral frak(C)' \( h \, p_delta \; v \) thin d Lambda arrow.r 0$.]
] <lem:variation:dust-tests>

#proof[
  Fix relatively compact open neighborhoods of $"supp" s$ whose closures lie in $U$. All uniform limits below are on the larger of these fixed neighborhoods. Put
  $ D_delta = frac(J ⊗ J, mu + delta) . $
  We first realize these tensors as the spatial Einstein components of a smooth Gaussian collar. Write
  $ upright(bold(g))_delta = - d t^2 + g_delta \( t \) \, #h(2em) g_delta \( t \) = g + 2 t K + t^2 Q_delta . $
  For each fixed $delta$ this is Lorentzian on a sufficiently short collar. Its future unit normal is $upright(bold(n)) = partial_t$, and the initial second form is $K$. At $t = 0$, direct contraction of the Gaussian Christoffel symbols
  $ bold(Gamma)_(i j)^0 = K_(i j) \, #h(2em) bold(Gamma)_(0 j)^i = K^i zws_j \, #h(2em) bold(Gamma)_(j k)^i = Gamma_(j k)^i \( g \) $
  gives
  $ upright(bold(R i c))_00 & = - "tr"_g Q_delta + \| K \|^2 \,\
upright(bold(R i c))_(0 i) & = J_i \,\
upright(bold(R i c))_(i j) & = "Ric"_(i j) \( g \) + \( Q_delta \)_(i j) + tau K_(i j) - 2 \( K^2 \)_(i j) \,\
upright(bold(R)) & = R_g + 2 "tr"_g Q_delta + tau^2 - 3 \| K \|^2 . $
  Consequently $upright(bold(G)) \( upright(bold(n)) \, upright(bold(n)) \) = mu$, $upright(bold(G)) \( upright(bold(n)) \, partial_i \) = J_i$, and
  $ upright(bold(G))_(i j) = \( Q_delta \)_(i j) - \( "tr"_g Q_delta \) g_(i j) + T_(i j) \, quad T = "Ric"_g + tau K - 2 K^2 - 1 / 2 \( R_g + tau^2 - 3 \| K \|^2 \) g . $
  The map $Q mapsto Q - \( "tr"_g Q \) g$ is invertible, with inverse $H mapsto H - \( "tr"_g H \) g \/ \( n - 1 \)$. Thus the explicit choice
  $ Q_delta = D_delta - T - frac("tr"_g \( D_delta - T \), n - 1) g $
  has $upright(bold(G))_(i j) = D_delta$. This construction fixes every first spacetime metric jet independently of $delta$. Collar widths and higher normal derivatives need not have uniform bounds.
  The tensors $D_delta$ converge in spatial $C^1$ to
  $ D_0 = cases(delim: "{", J ⊗ J \/ mu \, & mu > 0 \,, 0 \, & mu = 0 .) $
  Here is the verification at the zero set, where division alone would not justify the assertion. Smoothness and nonnegativity give $d mu = 0$ on ${ mu = 0 }$. In any smooth local frame, $\| J_i \| lt.eq C mu$ implies $d J_i = 0$ there as well. Differentiating the displayed formula gives, with tensor norms taken using $g$,
  $ \| D_delta \| lt.eq mu \, #h(2em) \| nabla D_delta \| lt.eq 2 \| nabla J \| + \| nabla mu \| . $
  On a small neighborhood of the compact zero set the right sides are uniformly small. On its complement $mu$ has a positive lower bound, so the formulas and their first derivatives converge uniformly. Moreover $\| D_0 \| lt.eq mu$ makes $D_0$ differentiable, with zero derivative, at each zero of $mu$; the derivative bound makes this derivative continuous. These facts prove the asserted $C^1$ convergence.
  Let $upright(bold(T))_delta$ denote the Einstein tensor of the collar, and identify its restriction to $t = 0$ with a bilinear form on $bb(R) upright(bold(n)) xor T U$. Its time-zero components converge spatially in $C^1$ to a tensor $upright(bold(T))_0$. At a point where $mu > 0$ it is
  $ upright(bold(T))_0 = mu^(- 1) alpha ⊗ alpha \, #h(2em) alpha \( upright(bold(n)) \) = mu \, quad alpha \|_(T U) = J . $
  The covector $alpha$ is causal in the precise sense that $alpha \( a upright(bold(n)) + w \) gt.eq 0$ when $a gt.eq \| w \|_g$ and $a gt.eq 0$. At an active ray with $mu > 0$, the inequalities
  $ 0 = mu + J \( v \) gt.eq mu - \| J \| thin \| v \| gt.eq 0 $
  force $\| J \| = mu$, $\| v \| = 1$, and $J = - mu v^flat$. Thus $ell = upright(bold(n)) + v$ is null and $alpha \( ell \) = 0$. Parallel transport $ell$ along any smooth curve in ${ t = 0 }$ through the point, using the collar connection, whose first jets are fixed. The transported vector remains future null. The smooth scalar $alpha \( ell \)$ is nonnegative and vanishes at the point, so its derivative in every spatial direction vanishes there. Differentiating $mu^(- 1) alpha ⊗ alpha$ therefore gives
  $ \( bold(nabla)_Y upright(bold(T))_0 \) \( W \, ell \) = 0 quad \( Y in T U \, med W in bb(R) upright(bold(n)) xor T U \) . $
  At $mu = 0$, all the components of $upright(bold(T))_0$ and all their spatial first derivatives vanish. Hence the same identity holds for every active $\| v \| lt.eq 1$ there, including the timelike vectors $upright(bold(n)) + v$.
  Contracted Bianchi supplies exactly the normal derivative which is needed, without requiring convergence of third normal metric jets. For a spatial orthonormal frame $e_1 \, dots.h \, e_n$, evaluated at $t = 0$,
  $ \( bold(nabla)_(upright(bold(n))) upright(bold(T))_delta \) \( upright(bold(n)) \, ell \) = sum_(i = 1)^n \( bold(nabla)_(e_i) upright(bold(T))_delta \) \( e_i \, ell \) . $
  The right side converges uniformly to zero on the compact active-ray set: spatial $C^1$ convergence was proved above, and all connection coefficients in this formula are fixed at $t = 0$.
  Finally use the graph embeddings $F_a \( x \) = \( a s \( x \) \, x \)$ in this collar. Differentiating the induced metric and future second form gives
  $ h = 2 s K \, #h(2em) p_delta = nabla^2 s + s Q_delta . $
  Both variations are smooth and compactly supported. We spell out the argument-vector variation in order to include the terms involving $d s$. Transport $v$ on the domain by $v'_0 = - s K^sharp v$, and write $ell_a = upright(bold(n))_a + \( F_a \)_(*) v_a$. Covariant differentiation along the graph variation gives
  $ dot(upright(bold(n))) = nabla s \, #h(2em) frac(D, d a) \( F_a \)_(*) v_a \|_(a = 0) = v \( s \) upright(bold(n)) \, #h(2em) dot(ell) = nabla s + v \( s \) upright(bold(n)) . $
  In the middle equality, the spatial connection contribution $s K^sharp v$ cancels the prescribed ray transport. Gauss–Codazzi on each graph identifies the differentiated ray constraint with
  $ 1 / 2 frak(C)' \( h \, p_delta \; v \) =  & s \( bold(nabla)_(upright(bold(n))) upright(bold(T))_delta \) \( upright(bold(n)) \, ell \) + upright(bold(T))_delta \( nabla s \, ell \)\
 & + upright(bold(T))_delta \( upright(bold(n)) \, nabla s + v \( s \) upright(bold(n)) \) . $
  The first term tends uniformly to zero by Bianchi. The second tends to zero because $upright(bold(T))_0 \( dot.op \, ell \) = 0$ at every active ray. The final term is exactly $J \( nabla s \) + mu v \( s \)$; it is zero at a positive-density active ray by $J = - mu v^flat$, and at a zero-density ray by $J = 0$. This proves the uniform assertion. Local finiteness of $Lambda$ proves the final statement of the lemma. Only infinitesimal compact tests have been constructed; no energy condition on the neighboring graphs is needed for this use of the multiplier identity. ◻
]

=== 4.5 Localizing a smooth family of minimizing enclosures <localizing-a-smooth-family-of-minimizing-enclosures>

Compact normal tests give an averaged trace identity. To turn it into information about individual minimizing frontiers, we use their common tangent plane at intersections. Positivity then prevents cancellation between different frontiers. The remaining issue is contact with the original boundary: the zero-expansion equation continues through contact, and strong comparison identifies the boundary components that remain.

The next proposition takes the enclosure geometry as an explicit input. Its regularity assumptions hold for the minimizing families considered here in dimensions at most seven. They are not consequences merely of smoothness of the original boundary in higher dimensions.

#thm([Proposition 4.5.])[
  (Localization for smooth minimizing frontiers).  #emph[Let $\( Omega \, g \, K \)$ be smooth initial data on a connected manifold with one end and nonempty compact smooth boundary $S = union.sq.big_(i = 1)^r S_i$, where $r < oo$ and each $S_i$ is connected. Orient $S$ into $Omega$, and suppose 
$ H_S + "tr"_S K = 0 \, #h(2em) A = "Area"_g \( S \) > 0 . $

 A full enclosing cut means the entire compact boundary of a connected closed exterior domain containing the sufficiently distant end, with its manifold interior in $"int" Omega$. Its normal points toward that end, and all components and all coincidence with $S$ count. Assume $S$ is outer area-minimizing for these smooth cuts.]
  #emph[Let $cal(T)$ be a measurable family of full minimizing frontiers, equipped with a probability measure $pi.alt$. Assume the following geometric properties.]
  + #emph[Every $T in cal(T)$ has area $A$, lies in one fixed compact subset of $Omega$, and is a compact embedded two-sided $C^(1 \, alpha)$ hypersurface without boundary, for some $0 < alpha < 1$. It is the entire boundary of a connected closed $C^1$ exterior domain containing the distant end. Its manifold interior lies in $"int" Omega$, and the coorientation of $T$ points toward that end. In particular, whenever $T$ is smooth it is a full enclosing cut of the stated comparison class.]
  + #emph[The free part $T \\ S$ is smooth and minimal. At contact with $S$, its graph functions are locally $W^(2 \, 2)$, its filled side contains the original obstacle, and its normal agrees with that of $S$. Thus its local graph lies on the exterior side of the obstacle graph.]
  + #emph[The surface-area measures form a measurable kernel in $T$. On the union of the free frontiers there is a single Borel tangent-plane field $Pi \( x \)$, continuous relative to that union, such that $Pi \( x \) = T_x T$ whenever $x in T \\ S$.]
  #emph[Suppose also that 
#[#set math.equation(numbering: n => "(4.15)")
 $ integral_(cal(T)) integral_T s thin "tr"_(T_x T) K \( x \) thin d A_g \( x \) thin d pi.alt \( T \) = 0 #h(2em) #scale(x: 120%, y: 120%)[\(] s in C_c^oo \( "int" Omega \) #scale(x: 120%, y: 120%)[\)] . $ <eq:variation:smooth-aggregate-trace>]

 Then, for $pi.alt$-almost every $T$, the whole frontier is a smooth MOTS, its free part satisfies $H_T = "tr"_T K = 0$, and each of its connected components is either an entire $S_i$ or is compactly contained in $"int" Omega$.]
  #emph[Moreover, $pi.alt { T : T = S } = 1$ under either of the following hypotheses:]
  + #emph[$S$ is connected, and no compact smooth embedded two-sided full enclosing cut lying wholly in $"int" Omega$, possibly disconnected, has $theta_(+) lt.eq 0$ everywhere.]
  + #emph[No full smooth enclosing cut has all components either equal to entire original components $S_i$ or wholly in $"int" Omega$, at least one component in that open exterior, and $theta_(+) lt.eq 0$ everywhere.]
  #emph[In case (a), before outermostness is applied, almost every frontier satisfies the sharper dichotomy: it equals $S$, or it is wholly interior and satisfies $H_T = "tr"_T K = 0$ everywhere. In either localization case, for every continuous symmetric tensor $h$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ integral_(cal(T)) 1 / 2 integral_T "tr"_(T_x T) h thin d A_g thin d pi.alt \( T \) = 1 / 2 integral_S "tr"_S h thin d A_g . $ <eq:variation:smooth-localized-area>]

]
] <prop:variation:smooth-localization>

#proof[
  Define the aggregate area measure in the open exterior by
  $ beta \( B \) = integral_(cal(T)) "Area"_g \( T ∩ B \) thin d pi.alt \( T \) #h(2em) #scale(x: 120%, y: 120%)[\(] B subset "int" Omega upright(" Borel") #scale(x: 120%, y: 120%)[\)] . $
  It is positive and has mass at most $A$. On the union of the free frontiers put $F \( x \) = "tr"_(Pi \( x \)) K \( x \)$, and set $F = 0$ elsewhere. This is a bounded measurable function on the common compact region. Equation (4.15) says that the signed Radon measure $F beta$ vanishes. Hence $F = 0$ $beta$-almost everywhere, and Tonelli’s theorem gives
  $ 0 = integral \| F \| thin d beta = integral_(cal(T)) integral_(T \\ S) \| "tr"_(T_x T) K \| thin d A_g thin d pi.alt \( T \) . $
  For almost every $T$, its tangential trace therefore vanishes at area-almost every free point. Each free part is smooth, so a nonzero value would persist on an open patch of positive area. Thus its trace vanishes everywhere there. Minimality gives $H_T = 0$ on that part as well. The common-plane hypothesis is essential: it makes the trace one function of position before positivity is used.
  Fix one of these frontiers and a contact point. Extend the smooth one-sided coefficients of $g \, K$ locally across $S$ only to write graph equations. In a graph chart let $f$ describe $T$ and let the smooth function $psi$ describe the obstacle. Their ordered graphs have matching normals at contact. On the coincidence set $Z = { f = psi }$, their first derivatives agree. Sobolev locality applied to $partial_j \( f - psi \) in W^(1 \, 2)$ gives $D^2 f = D^2 psi$ almost everywhere on $Z$. Since $S$ is marginal, the graph of $f$ satisfies $H + "tr"_(upright("tan")) K = 0$ almost everywhere on $Z$. It satisfies this equation on the free set by the first part of the proof.
  We verify that this almost-everywhere equation yields smoothness through contact. In the chart it has the form
  $ partial_i cal(F)^i \( y \, f \, D f \) = cal(B) \( y \, f \, D f \) \, $
  with smooth functions $cal(F) \, cal(B)$. The matrix $cal(F)_(p_j)^i$ is uniformly elliptic on a smaller chart, since $D f$ is bounded there. These are the usual graph coefficients for mean curvature, with the smooth tangential trace of $K$ included in $cal(B)$. As $f in W^(2 \, 2)$, the divergence on the left is an $L^2$ function. The almost-everywhere identity is therefore also a weak divergence-form equation; there is no additional contact measure. For $f_k = partial_k f$, differentiation in distributions gives
  $ partial_i \( a^(i j) partial_j f_k \) = partial_i #scale(x: 120%, y: 120%)[\(] delta_(i k) cal(B) - cal(F)_(y_k)^i - cal(F)_z^i f_k #scale(x: 120%, y: 120%)[\)] \, #h(2em) a^(i j) = cal(F)_(p_j)^i \( y \, f \, D f \) . $
  All displayed coefficients and the right-hand vector field are $C^(0 \, alpha)$, while $f_k in W^(1 \, 2)$. Interior divergence-form Schauder regularity gives $f_k in C^(1 \, alpha)$ on smaller charts. Thus $f in C^(2 \, alpha)$, and further differentiation and Schauder estimates give smoothness; see #cite(label("GilbargTrudinger2001")). Consequently $T$ is a smooth MOTS across every contact point.
  If $T$ touches $S_i$, the two ordered smooth graphs satisfy the same zero-expansion equation with the same orientation. Their nonnegative difference $w$ satisfies a linear uniformly elliptic equation $a^(i j) w_(i j) + b^i w_i + c w = 0$ with bounded coefficients. Replacing $c$ by $min \( c \, 0 \)$ gives an inequality with left side $lt.eq 0$, since $w gt.eq 0$. The strong minimum principle at a zero of $w$ forces local coincidence. Therefore $T ∩ S_i$ is both open and closed in the connected hypersurface $S_i$, so $S_i subset T$. Local coincidence also makes $S_i$ open in $T$, and compactness makes it closed there; it is one connected component of $T$. Every remaining component is disjoint from $S$ and, by compactness, lies a positive distance inside the open exterior. This proves the component assertion.
  Suppose first that (a) holds. If $T$ touches $S$, it contains $S$ as a component. Since $"Area"_g \( T \) = A = "Area"_g \( S \)$, no further component of positive area is possible, and $T = S$. Otherwise $T$ is a wholly interior smooth full enclosing MOTS, excluded by (a).
  Under (b), any interior component of $T$ would give exactly a prohibited partial-coincidence cut: all its other components are interior or entire $S_i$, and $theta_(+) = 0$ everywhere. Hence $T = union.sq.big_(i in I) S_i$ for some $I subset { 1 \, dots.h \, r }$. The area identity
  $ sum_(i in I) "Area"_g \( S_i \) = A = sum_(i = 1)^r "Area"_g \( S_i \) $
  and the positive area of every $S_i$ force $I = { 1 \, dots.h \, r }$. Thus $T = S$ in this case too. All conclusions hold outside the single null family discarded above. Integrating the area derivative of this fixed frontier proves Equation (4.16). ◻
]

=== 4.6 The typical minimizing frontiers <the-typical-minimizing-frontiers>

#thm([Lemma 4.6.])[
  (Zero trace and contact dichotomy).  #emph[For $pi$-almost every $C in frak(T)$, either $Gamma_C = S$, or $Gamma_C$ is compactly contained in the open exterior and 
#[#set math.equation(numbering: n => "(4.17)")
 $ H_(Gamma_C) = "tr"_(T Gamma_C) K = 0 $ <eq:variation:three-equations>]

 on its regular part. The latter frontier is not asserted to be smooth at this stage.]
] <lem:variation:contact-dichotomy>

#proof[
  Apply Lemma 14 to an arbitrary compact smooth lapse $s$ in the open exterior. The variations have zero ADM and boundary terms. Their active-constraint derivatives tend uniformly to zero on a fixed compact set, where $Lambda$ has finite mass. Equation (4.5) therefore gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ integral_(frak(T)) integral_(partial^(*) C) s thin "tr"_(T partial^(*) C) K thin d A thin d pi \( C \) = 0 . $ <eq:variation:trace-measure>]
  On a uniform graph cylinder from Lemma 11, all sheets through one point have the same tangent plane. Their tangent planes also vary continuously on the union of the sheets: a contrary sequence would contradict multiplicity-one regular convergence. Consequently $"tr"_(T partial^(*) C) K$ defines one continuous function $f$ on this union, and Equation (4.18) says $f thin d sigma = 0$ there. There is no cancellation between differing tangent planes at the same point. Hence $f = 0$ almost everywhere for the positive measure $sigma$. Tonelli’s theorem and continuity on each smooth graph give $"tr"_(T Gamma_C) K = 0$ everywhere on each participating free graph for almost every $C$. Choose countably many smaller cylinders covering all free regular points of the family and discard the union of their null exceptional sets. Minimality already gives $H = 0$ on these patches.
  Suppose a remaining frontier touches $S$. Near a contact point write the frontier and $S$ as $W^(2 \, p) ∩ C^(1 \, alpha)$ and smooth ordered graphs, respectively. Their difference vanishes on the coincidence set. Sobolev locality says that its first and second weak derivatives vanish almost everywhere on that set; this follows by applying first-derivative locality to the function and then to its first derivatives. Thus the graph’s second jet agrees there almost everywhere with that of $S$. On the coincidence set it has $H + "tr"_(upright("tan")) K = theta_(+) \( S \) = 0$, and on its free set it has the same equation by Equation (4.17). It therefore solves the uniformly elliptic scalar zero-expansion graph equation almost everywhere on the entire patch. Linear $W^(2 \, p)$ estimates and Schauder bootstrap make it smooth. The strong comparison principle for two ordered solutions of this graph equation makes it coincide locally with $S$. Connectedness of $S$, local continuation of this coincidence, and closedness of the frontier make it contain all of $S$. Since its total perimeter is $A = "Area" \( S \)$, there is no remaining perimeter for another sheet. The support is exactly $S$.
  Otherwise its compact support is disjoint from the compact set $S$, so it lies a positive distance inside the open exterior and satisfies Equation (4.17) on every regular patch. ◻
]

When $3 lt.eq n lt.eq 7$, Proposition 15 now gives the desired localization directly. Indeed, Lemma 11 supplies compact minimizing frontiers of area $A$, their full enclosing geometry, smooth minimal free parts, and the required contact regularity. Its common-plane property and multiplicity-one regular convergence give the continuous plane field. Equation (4.18) is the averaged trace identity. The connected marginal boundary and wholly-interior outermostness in Definition 4 match case (a) of the proposition. Thus $pi { C : Gamma_C = S } = 1$. In these dimensions the reader may proceed to Theorem 29 and then to Section 5. The weaker-decay classes in dimensions three and four require their own end analysis below; this application uses the strong-decay class of Definition 1.

For $n gt.eq 8$, smooth outermostness cannot yet be applied: the wholly interior frontier could have singular points. The next arguments prove that almost every frontier carrying area mass is nevertheless smooth. We distinguish atoms of the local graph-height measure from its nonatomic part. An atom gives a nonzero jump of the normal derivative of $u$; the tangential Hessian equation then forces that sheet to be totally geodesic. For a nonatomic sheet, neighboring minimizers produce one common positive Jacobi field. We will show that this field diverges at every singular end and that the lapse is positive somewhere on almost every such sheet. Focusing then bounds its second fundamental form, removes its singularities, and permits the original smooth outermostness hypothesis to apply.

=== 4.7 Measurable graph families and the atomic case <subsec:variation:graph-families>

We first fix the measurable meaning of this local distinction. Choose nested uniform graph cylinders $Q_j^(-) subset.double Q_j^0 subset.double Q_j^(+)$ such that every member meeting $Q_j^0$ has one graph over the fixed base used in $Q_j^(-)$, with uniform estimates inside $Q_j^(+)$. Shrinking the cylinders from Lemma 11, and using their uniform slope bounds, gives these margins. The smallest cylinders cover every free regular point of the minimizing family; second countability gives a countable subcover.

Put $cal(U)_j = { D in frak(T) : Gamma_D ∩ Q_j^0 eq.not diameter }$. This is open in $frak(T)$: strict perimeter convergence and the density lower bounds imply local convergence of perimeter supports. It has a countable compact exhaustion, for example by the sets at distance at least $1 \/ m$ from $frak(T) \\ cal(U)_j$; if $cal(U)_j = frak(T)$, use $frak(T)$ itself. Graph height at a fixed base point defines a continuous map $a_j : cal(U)_j arrow.r bb(R)$. Its image $I_j$ is therefore a countable union of compact sets and is Borel. Identify graphs with equal height: strong comparison makes them coincide, and Equation (4.3) makes the graph map $a mapsto h_a$ Lipschitz into each smaller $C^l$ graph space. Thus the parameter family and its geometric weights are Borel.

Let $lambda_j = \( a_j \)_(*) \( pi \|_(cal(U)_j) \)$ be its finite height measure. Every sheet contributing in $Q_j^(-)$ is represented, including a sheet crossing the edge of a larger cylinder. Distinct parameters have distinct heights at every base point by strong comparison. An #emph[atomic patch] means a graph whose parameter has positive $lambda_j$ mass; equivalently, the fiber of minimizers agreeing on that patch has positive $pi$ mass. The nonatomic alternative refers to the nonatomic part of this same pushforward measure. All later exceptional families will be discarded on the original space $frak(T)$, using these countably many maps.

Figure 2 shows how the two cases lead to the same regularity conclusion. For a connected component $Sigma$ of the regular frontier, write $A_Sigma$ for its second fundamental form and $K_(upright("tan")) = K \|_(T Sigma)$ for the tangential restriction of $K$. The nonatomic route uses both the Jacobi field at singular ends and the diffuse Hessian measure; neither input alone gives the required maximum.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 13.7cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Wholly interior minimizing frontier, possibly singular#linebreak()$H= "tr"_( upright(t) "an")K=0$ on its regular part]]])])
  content((-3.5, -1.35), [#box(width: 6.624cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Atomic graph parameter#linebreak()normal derivative jump]]])])
  content((3.5, -1.35), [#box(width: 6.624cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Nonatomic graph parameter#linebreak()one common positive Jacobi field $phi$]]])])
  content((-3.5, -2.95), [#box(width: 6.624cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Tangential Hessian traces#linebreak()$A_ Sigma =0$]]])])
  content((3.5, -2.95), [#box(width: 6.624cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Diffuse BV: $u>0$ somewhere#linebreak()Singular ends: $phi arrow.r infinity$#linebreak()Maximum principle and focusing#linebreak()$A_ Sigma plus.minus K_( upright(t) "an")=0$ for one sign]]])])
  content((0, -4.85), [#box(width: 13.7cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Uniform curvature bound $|A_ Sigma | lt.eq sup_( Gamma_C)|K|$#linebreak()on every regular component]]])])
  content((0, -6.2), [#box(width: 13.7cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Planar tangent cones remove singularities#linebreak()Smooth outermostness excludes the interior frontier]]])])
  line((0, -0.5114), (-3.5, -0.8386), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -0.5114), (3.5, -0.8386), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.5, -1.861), (-3.5, -2.446), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.5, -1.861), (3.5, -2.051), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.5, -3.454), (0, -4.33), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.5, -3.849), (0, -4.33), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -5.37), (0, -5.719), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 2: Removal of singular frontiers carrying area mass. Each regular component follows one of the two routes. The common curvature bound holds for one full-measure family of minimizers, after the countable exceptional-family step in Theorem 29. ],
) <fig:variation:singular-localization>

#thm([Lemma 4.7.])[
  (Atoms give totally geodesic sheets).  #emph[Fix a uniform graph cylinder about a free regular sheet $Sigma$ of a minimizer. Collapse coincident graphs and parametrize the remaining graphs by their height at a fixed base point. If the parameter of $Sigma$ has positive mass under the pushforward of $pi$, then the second fundamental form $A_Sigma$ vanishes on its smaller patch.]
] <lem:variation:atomic-flatness>

#proof[
  Use Fermi coordinates $\( y \, s \)$ about the smooth reference sheet, with $g = d s^2 + g_s$, $s = 0$ on $Sigma$, and $A_(a b) = 1 / 2 partial_s \( g_s \)_(a b)$. Let $a > 0$ be the mass of the coincident-graph fiber. Its contribution to Equation (4.11) is $\( c a \/ 2 \) thin d s ⊗ d s thin d A_Sigma$. In the $s s$ equation this is the density $\( c a \/ 2 \) delta_0 \( d s \)$ on almost every normal line; the volume and surface densities coincide at $s = 0$. All other graph parameters have height different from zero on every such line, by noncrossing and contact agreement. They contribute no atom at zero. Semiconvexity and local Lipschitz bounds give bounded one-sided traces of $partial_s u$ on almost every line, and slicing the equation proves
  #[#set math.equation(numbering: n => "(4.19)")
   $ \( partial_s u \)^(+) - \( partial_s u \)^(-) = c a \/ 2 . $ <eq:variation:normal-jump>]
  The tangential equations contain no jump measure on the reference sheet. Contributions from nearby sheets must also be controlled before taking traces. Equation (4.3) implies that a nearby leaf at distance $\| s \|$ has tangential normal components $O \( \| s \| \)$ relative to the reference Fermi frame, on a smaller patch. Indeed Harnack compares its height at the fixed base point to its height at the chosen point, and the derivative estimate controls its tilt. Thus the tangential–tangential components of $d cal(N)$ in $\| s \| < epsilon$ have total variation bounded by $C epsilon^2 sigma \( { \| s \| < epsilon } \)$. After division by the slab width this tends to zero; the total local $sigma$ mass is bounded. This estimate also covers infinitely many accumulating leaves and their diffuse parameter measure.
  Average the tangential equation over $0 < s < epsilon$ and over $- epsilon < s < 0$, and test in the $y$ variables. The continuous tensor $cal(B) \( u \, X \, nabla X \)$ has identical limiting traces. On each parallel sheet,
  $ \( "Hess"_g u \)_(a b) = \( "Hess"_(g_s) u \|_s \)_(a b) + A_(a b) \( s \) partial_s u . $
  Uniform continuity of $u$ makes the two averaged intrinsic Hessians converge to the same distribution, and the bounded normal derivatives converge to their one-sided traces in $L^1$ on smaller base patches. Taking the difference and using the vanishing measure contribution therefore gives $A_(a b) \( 0 \) \[ partial_s u \] = 0$ as distributions. Equation (4.19) and smoothness of $A$ prove $A = 0$. ◻
]

=== 4.8 Jacobi fields from neighboring minimizers <jacobi-fields-from-neighboring-minimizers>

On a free sheet with Equation (4.17), let $L_0$ be the minimal Jacobi operator and $L_plus.minus$ the normal linearizations of $H plus.minus "tr"_(upright("tan")) K$. Explicitly,

#[#set math.equation(numbering: n => "(4.20)")
 $ L_0 f & = - Delta_Sigma f - \( \| A_Sigma \|^2 + "Ric" \( nu \, nu \) \) f \,\
L_plus.minus f & = L_0 f med plus.minus 2 K \( nu \, nabla_Sigma f \) plus.minus "tr"_(T Sigma) \( nabla_nu K \) f . $ <eq:variation:L0>]

These formulas follow from $nu' = - nabla_Sigma f$ and the mean-curvature variation formula. In the trace of $K$, the two terms from differentiating the tangent frame cancel the variation of the inverse induced metric, leaving precisely the last two terms above.

#thm([Lemma 4.8.])[
  (One common positive Jacobi field).  #emph[Let $C in "supp" pi$ belong to the full-measure family in Lemma 16, with wholly interior frontier, and let $Sigma$ be a connected component of its regular part. If its local graph parameter at some patch is not an atom, there is a smooth positive function $phi$ on all of $Sigma$ with 
#[#set math.equation(numbering: n => "(4.21)")
 $ L_0 phi = L_(+) phi = L_(-) phi = 0 . $ <eq:variation:common-jacobi>]

]
] <lem:variation:common-jacobi>

#proof[
  Fix a base point $y_0$ in the patch. The fiber of minimizers whose graph agrees there has $pi$ measure zero. Every neighborhood of $C$ in the compact metric space $frak(T)$ has positive $pi$ measure. Deleting this fiber and the exceptional family from Lemma 16, choose $C_j arrow.r C$ with distinct graphs at $y_0$, all satisfying Equation (4.17) near the component.
  Choose a connected relatively compact smooth exhaustion of $Sigma$ by domains containing $y_0$. For each fixed exhaustion domain, multiplicity-one regular convergence and finitely many overlapping graph charts express $Gamma_(C_j)$ as one smooth normal graph $h_j$ over it, with $h_j arrow.r 0$ smoothly. Noncrossing says this graph either agrees with $Sigma$ or is strictly on one side. Agreement at one point propagates through overlapping charts by strong comparison; it would contradict distinction at $y_0$. A subsequence thus has a fixed strict sign on every exhaustion domain.
  Divide $h_j$ by its signed value at $y_0$, obtaining positive functions normalized to one there. Each satisfies the linear difference equation for the two minimal graphs. The coefficients converge smoothly to those of $L_0$. Harnack along a finite chain of balls and interior estimates bound the normalized graphs and all their derivatives on each compact subset. Diagonal extraction gives a smooth positive limit $phi$ on all of $Sigma$. The same graph differences solve the two difference equations for $H plus.minus "tr"_(upright("tan")) K = 0$; their coefficients converge to $L_plus.minus$. Passing to the same limit proves all three equations in Equation (4.21). This argument requires a sequence of neighboring minimizers, not a differentiable family. ◻
]

=== 4.9 Focusing and the positive stress measure <focusing-and-the-positive-stress-measure>

The common Jacobi field will provide the comparison function for a maximum principle. We now establish the inequality it will be compared with. The positive Hessian source in the lapse equation becomes a positive spatial stress after trace reversal; retaining that source is what gives the favorable sign in the focusing inequality.

#thm([Lemma 4.9.])[
  (The stationary metric adjoint).  #emph[Let $u > 0$ and $X$ be smooth on an open set with smooth metric $g$, and put 
$ upright(bold(g)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) b = - u^(- 1) "sym" nabla X . $

 Let $mu_b \, J_b$ be the constraints of $\( g \, b \)$, and let $S_b$ denote the expression $cal(S)$ in Equation (4.12), with $K$ replaced throughout by $b$. Then the exact smooth identity is 
$ nabla^2 u - \( Delta u \) g + S_b = - u upright(bold(G))_(upright("spatial")) - \( u mu_b + J_b \( X \) \) g - \( J_b \)_(\( i) X_(j \)) . $

 Here the spatial Einstein tensor is its restriction to the tangent spaces of $z = upright("constant")$, and parentheses include the factor $1 \/ 2$.]
] <lem:variation:stationary-action>

#proof[
  All variations and integrations in this proof have compact support in the open set. Define
  $ sans(B) \( B \, C \) = chevron.l B \, C chevron.r_g - \( "tr"_g B \) \( "tr"_g C \) . $
  Temporarily let $K$ be independent of the metric. Integration of the momentum divergence, at fixed contravariant shift $X$, gives
  $ integral \( 2 u mu + 2 J \( X \) \) thin d V_g & = integral u { R_g - sans(B) \( K \, K \) + 2 sans(B) \( K \, b \) } thin d V_g\
 & = integral u { R_g + sans(B) \( b \, b \) - sans(B) \( K - b \, K - b \) } thin d V_g . $
  At $K = b$ the final square has zero first variation, including for a metric variation with the covariant components of $K$ held fixed. Thus the metric derivative of the constraint functional at this point equals that of the stationary scalar action $integral u \( R_g + sans(B) \( b \, b \) \) thin d V_g$.
  For completeness, its relation to the spacetime scalar action follows from the Gaussian contraction formulas with lapse and shift. They give
  $ upright(bold(R)) = R_g + \| b \|^2 + \( "tr" b \)^2 + 2 upright(bold(n)) \( "tr" b \) - 2 u^(- 1) Delta u . $
  Stationarity implies $upright(bold(n)) \( "tr" b \) = - u^(- 1) X \( "tr" b \)$ and $"div" X = - u "tr" b$, whence
  $ upright(bold(R)) = R_g + sans(B) \( b \, b \) - 2 u^(- 1) "div" #scale(x: 120%, y: 120%)[\(] nabla u + \( "tr" b \) X #scale(x: 120%, y: 120%)[\)] . $
  Since $sqrt(\| det upright(bold(g)) \|) = u sqrt(det g)$, the two scalar actions differ by a spatial divergence per unit $z$-length. For a spacetime metric variation $H$, differentiating the connection formula for scalar curvature gives
  $ delta \( upright(bold(R)) thin d V_(upright(bold(g))) \) = [- chevron.l upright(bold(G)) \, H chevron.r_(upright(bold(g))) + bold(nabla)_alpha #scale(x: 120%, y: 120%)[\(] bold(nabla)_beta H^(alpha beta) - bold(nabla)^alpha "tr"_(upright(bold(g))) H #scale(x: 120%, y: 120%)[\)]] d V_(upright(bold(g))) . $
  At fixed $u \, X$, $H = h_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \)$ annihilates the unit normal in each slot. The derivative of the stationary action therefore pairs $h$ with $- u upright(bold(G))_(upright("spatial"))$.
  The metric coefficient of the constraint integral before ray transport is
  $ nabla^2 u - \( Delta u \) g + S_b + \( J_b \)_(\( i) X_(j \)) + \( u mu_b + J_b \( X \) \) g . $
  The last term is the volume derivative, and the preceding added term restores the term removed by isometric ray transport in the definition of $S_b$. Equating the two coefficients proves the identity. This also displays why the volume derivative disappears only after complementarity has been imposed. ◻
]

#thm([Lemma 4.10.])[
  (Focusing with a positive Hessian measure).  #emph[Let $g \, K$ be smooth on $U$, with $mu gt.eq \| J \|_g$. Suppose that $u$ is locally Lipschitz and semiconvex, $X in C_(upright("loc"))^(1 \, 1)$, and the following exact distributional equations hold: 
$ u gt.eq \| X \|_g \, #h(2em) u mu + J \( X \) = 0 \, #h(2em) "sym" nabla X = - u K \,\
nabla^2 u = - S + frac("tr"_g S, n - 1) g + cal(M) \, $

 where 
$ S =  & - u "Ric"_g + 2 u \( K^2 - tau K \) + cal(L)_X K - \( "div" X \) K\
 & - "div" \( K \( X \, dot.op \) \) g - J_(\( i) X_(j \)) \, $

 and $cal(M)$ is a locally finite positive semidefinite symmetric tensor measure, interpreted relative to $d V_g$. In the application, 
$ cal(M) = c / 2 integral nu_D^flat ⊗ nu_D^flat thin d A_D thin d pi . $

 Let $Sigma subset U$ be a smooth two-sided hypersurface with $H_Sigma = "tr"_Sigma K = 0$, and let $nu$ be its chosen unit normal. Set 
$ L_plus.minus f =  & - Delta_Sigma f plus.minus 2 K \( nu \, nabla_Sigma f \)\
 & + #scale(x: 120%, y: 120%)[\[] - \| A_Sigma \|^2 - "Ric"_g \( nu \, nu \) plus.minus "tr"_Sigma \( nabla_nu K \) #scale(x: 120%, y: 120%)[\]] f \, #h(2em) Q_plus.minus = u minus.plus g \( X \, nu \) . $

 Then $Q_plus.minus gt.eq 0$, and, on the open subset $Sigma ∩ { u > 0 }$, 
$ L_plus.minus Q_plus.minus lt.eq - u \| A_Sigma plus.minus K_(upright("tan")) \|^2 $

 in distributions. Precisely, each inequality holds after pairing with any nonnegative smooth compactly supported test function on that open subset.]
] <lem:variation:measure-focusing>

#proof[
  The operator formula follows by varying $Sigma$ with velocity $f nu$. The mean-curvature derivative is $- Delta_Sigma f - \( \| A_Sigma \|^2 + "Ric"_g \( nu \, nu \) \) f$. For the other term, differentiation of $"tr"_Sigma K = "tr"_g K - K \( nu \, nu \)$, using $dot(nu) = - nabla_Sigma f$, gives $f "tr"_Sigma \( nabla_nu K \) + 2 K \( nu \, nabla_Sigma f \)$. Adding the two derivatives gives $L_(+)$; replacing $K$ by $- K$ gives $L_(-)$.
  Fix a compact patch of $Sigma ∩ { u > 0 }$. Enlarge it slightly to a coordinate neighborhood on which $u gt.eq a > 0$. All constants below may depend on this neighborhood, $a$, the smooth data, and the stated local Lipschitz bounds; the only limiting parameter is the mollifier radius $epsilon arrow.b 0$. Choose a nonnegative smooth convolution kernel of integral one. Mollify $u$ and the components of the covector $w = X^flat$, and then put
  $ u_epsilon = u * rho_epsilon \, #h(2em) w_epsilon = w * rho_epsilon \, #h(2em) X_epsilon = g^(- 1) w_epsilon \, #h(2em) b_epsilon = - u_epsilon^(- 1) "sym" nabla X_epsilon . $
  Convolutions are used only on smaller coordinate neighborhoods. In particular $u_epsilon gt.eq a \/ 2$ for small $epsilon$.
  We need convergence of $b_epsilon$ through one derivative. For a smooth coefficient $a_0$ and a Lipschitz function $f$, let
  $ C_epsilon \( a_0 \, f \) = \( a_0 f \) * rho_epsilon - a_0 \( f * rho_epsilon \) . $
  The integral formula with integrand $\( a_0 \( y \) - a_0 \( x \) \) f \( y \) rho_epsilon \( x - y \)$ gives $parallel C_epsilon \( a_0 \, f \) parallel_oo lt.eq C epsilon parallel f parallel_oo$. Differentiation in distributions gives the useful identity
  $ partial_j C_epsilon \( a_0 \, f \) = C_epsilon \( partial_j a_0 \, f \) + C_epsilon \( a_0 \, partial_j f \) . $
  The same integral bound, applied to the bounded weak derivative of $f$, proves
  $ parallel C_epsilon \( a_0 \, f \) parallel_(C^1) lt.eq C epsilon parallel f parallel_(W^(1 \, oo)) . $
  In covector coordinates the shift equation reads $1 / 2 \( partial_i w_j + partial_j w_i \) - Gamma_(i j)^l w_l = - u K_(i j)$. Thus
  $ "sym" nabla X_epsilon + u_epsilon K = C_epsilon \( Gamma \, w \) - C_epsilon \( K \, u \) = O_(C^1) \( epsilon \) . $
  The positive lower bound for $u_epsilon$ and its bounded first derivatives therefore give
  $ b_epsilon arrow.r K quad upright("in ") C^1 . $
  Also $X_epsilon arrow.r X$ in $C^1$, $u_epsilon arrow.r u$ uniformly, and all their first derivatives are uniformly bounded.
  Put $B = - S + \( "tr"_g S \) g \/ \( n - 1 \)$; it is continuous under the stated regularity. To convolve the tensor measure precisely, write $d V_g = v_g thin d x$ in the chosen chart and convolve the component measures $v_g^(- 1) thin d cal(M)_(i j)$. Denote the resulting matrix of smooth functions by $M_epsilon$. This matrix is positive semidefinite at each point, because the convolution kernel and $v_g^(- 1)$ are nonnegative. The Hessian equation and the connection commutator give
  $ nabla^2 u_epsilon = B * rho_epsilon + M_epsilon + o_(C^0) \( 1 \) . $
  Indeed the sole extra term is $\( Gamma thin d u \) * rho_epsilon - Gamma thin d u_epsilon$, which is $O \( epsilon \)$ since $d u$ is bounded. No derivative of $d u$ is required in this estimate.
  Define the stationary smooth spacetime metric from $u_epsilon \, X_epsilon \, g$ as in Lemma 19. Its induced second form is $b_epsilon$; let $mu_epsilon \, J_epsilon$ be its constraint components. Since $b_epsilon arrow.r K$ in $C^1$,
  $ mu_epsilon arrow.r mu \, #h(2em) J_epsilon arrow.r J \, #h(2em) S_(b_epsilon) \( u_epsilon \, X_epsilon \) arrow.r S $
  uniformly. The smooth action identity and the convolved Hessian equation consequently give
  $ u_epsilon upright(bold(G))_(upright("spatial"))^epsilon = P_epsilon - J_(\( i) X_(j \)) + o_(C^0) \( 1 \) \, #h(2em) P_epsilon = \( "tr"_(g \( x \)) M_epsilon \) g \( x \) - M_epsilon . $
  Here the regular terms cancel because $B - \( "tr"_g B \) g + S = 0$, and the volume term tends to zero by $u mu + J \( X \) = 0$. The matrix $P_epsilon$ is positive semidefinite: in a $g \( x \)$-orthonormal eigenbasis for $M_epsilon$ its eigenvalues are the sums of all but one of the nonnegative eigenvalues of $M_epsilon$. It is essential that this trace reversal be applied #emph[after] convolution, at $g \( x \)$. There is no estimate here commuting a variable trace-reversal coefficient past an unbounded Hessian. For the area measure in the statement, the corresponding unmollified positive spatial measure is exactly
  $ c / 2 integral \( g - nu_D^flat ⊗ nu_D^flat \) thin d A_D thin d pi . $
  Let $upright(bold(n))_epsilon$ be the future slice normal. For the $g$-unit normal $nu$ of $Sigma$, Gauss–Codazzi and nullness yield
  $ u_epsilon upright(bold(R i c))^epsilon \( upright(bold(n))_epsilon plus.minus nu \, upright(bold(n))_epsilon plus.minus nu \) & = u_epsilon upright(bold(G))^epsilon \( upright(bold(n))_epsilon plus.minus nu \, upright(bold(n))_epsilon plus.minus nu \)\
 & gt.eq u mu plus.minus 2 u J \( nu \) - J \( nu \) g \( X \, nu \) - o \( 1 \) gt.eq - o \( 1 \) . $
  To check the last inequality pointwise, if $mu = 0$ then $J = 0$. Otherwise complementarity and $u gt.eq \| X \|$ imply $\| J \| = mu$, $\| X \| = u$, and $J = - mu X^flat \/ u$. The expression is therefore $u mu \( 1 plus.minus J \( nu \) \/ mu \)^2$. This verifies the null Ricci lower bound uniformly, without bounding $M_epsilon$ or the full spacetime curvature.
  We give the smooth focusing identity used to finish. Write $theta_epsilon = H_Sigma + "tr"_Sigma b_epsilon$ and $ell_epsilon = upright(bold(n))_epsilon + nu$. Launch orthogonal null geodesics from the patch, and intersect their local null hypersurface with the stationary slices. For each fixed $epsilon$ this is a smooth construction for some positive time; no uniform time interval is needed. On each slice normalize the null generator by $ell = upright(bold(n)) + nu$. If $chi$ denotes its screen second form, commuting covariant derivatives along an affinely parametrized generator in a parallel screen frame gives
  $ nabla_ell chi_(a b) = - chi_(a c) chi_(c b) - cal(R)_(a b) \, #h(2em) sum_a cal(R)_(a a) = upright(bold(R i c)) \( ell \, ell \) \, $
  where $cal(R)$ is the screen Jacobi curvature matrix. Tracing gives $ell \( theta \) = - \| chi \|^2 - upright(bold(R i c)) \( ell \, ell \)$ for that affine normalization. For the slice normalization, $bold(nabla)_ell ell = kappa ell$, so the trace identity instead has the additional term $kappa theta$. Differentiating $upright(bold(g)) \( ell \, upright(bold(n)) \) = - 1$ gives
  $ kappa = upright(bold(g)) \( ell \, bold(nabla)_ell upright(bold(n)) \) = u^(- 1) nu \( u \) + b \( nu \, nu \) \, $
  because the slice-normal acceleration is $nabla log u$.
  The velocity with slice coordinate $z$ as parameter is $u ell$. Subtracting the stationary Killing translation $partial_z = u upright(bold(n)) + X$ leaves the spatial velocity $u nu - X$, whose normal component is $Q = u - X dot.op nu$ and tangential component is $- X^T$. At the initial slice $chi = A_Sigma + b \|_(T Sigma)$. Thus the two descriptions of the expansion derivative give exactly
  $ L_(+ \, epsilon) Q_(+ \, epsilon) - X_epsilon^T \( theta_epsilon \) =  & - u_epsilon #scale(x: 120%, y: 120%)[\(] \| A_Sigma + \( b_epsilon \)_(upright("tan")) \|^2 + upright(bold(R i c))^epsilon \( ell_epsilon \, ell_epsilon \) #scale(x: 120%, y: 120%)[\)]\
 & + #scale(x: 120%, y: 120%)[\(] nu \( u_epsilon \) + u_epsilon b_epsilon \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] theta_epsilon . $
  The notation $L_(+ \, epsilon)$ means the displayed spatial linearization with $K$ replaced by $b_epsilon$, without assuming that $theta_epsilon$ is zero.
  Since $H_Sigma = "tr"_Sigma K = 0$ and $b_epsilon arrow.r K$ in $C^1$, one has $theta_epsilon arrow.r 0$ in $C^1$ on the patch. Both the tangential transport term and the final normalization term therefore tend uniformly to zero; their coefficients involve only bounded first jets. The null Ricci lower bound gives
  $ L_(+ \, epsilon) Q_(+ \, epsilon) lt.eq - u_epsilon \| A_Sigma + \( b_epsilon \)_(upright("tan")) \|^2 + o \( 1 \) . $
  The principal part of all these operators is the fixed $- Delta_Sigma$. Their first-order and zeroth-order coefficients converge uniformly, while $Q_(+ \, epsilon) arrow.r Q_(+)$ uniformly with uniform local Lipschitz bounds. Pairing with a compactly supported smooth test function and integrating the Laplacian by parts thus passes to the asserted distributional inequality. For the drift term, the gradients converge weakly against integrable test fields, and the error in its coefficient tends uniformly to zero.
  Finally replace stationary time $z$ by $- z$ and the future normal by its negative. This replaces $\( K \, X \, J \)$ by $\( - K \, - X \, - J \)$ while leaving $u \, g \, S \, B \, cal(M)$ unchanged. Applying the plus calculation gives $Q_(-) = u + X dot.op nu$ and the claimed minus inequality. The argument is local on every compact subset of ${ u > 0 }$, so a partition of unity establishes the statement for all test functions specified in the lemma. ◻
]

=== 4.10 Capacity estimates and positive Jacobi fields at singular ends <capacity-estimates-and-positive-jacobi-fields-at-singular-ends>

The maximum-principle argument will be applied to $Q_plus.minus \/ phi$. To ensure that a positive maximum cannot escape into the singular set, we prove that $1 \/ phi$ is bounded and tends to zero there. Capacity cutoffs allow bounded subsolutions to cross the singular set; dilation and a cone Liouville theorem then give the required vanishing along every singular approach.

We first specify the geometric measure theory used in this subsection. Let $Gamma$ be the compact support of the perimeter measure of a set whose boundary is locally perimeter minimizing in an open subset of a smooth $\( k + 1 \)$-dimensional Riemannian manifold. The open subset contains $Gamma$; thus there is no boundary condition or obstacle in this subsection. Write $cal(S) = "sing" Gamma$ and $d mu = d cal(H)_g^k floor.l Gamma$. The interior regularity, monotonicity, and compactness theorems for minimizing boundaries give the following facts #cite(label("Simon2018")): $Gamma \\ cal(S)$ is a smooth embedded minimal hypersurface, $cal(S)$ is closed with Hausdorff dimension at most $k - 7$, and $mu \( B_r \( x \) \) lt.eq Lambda r^k$ for $x in Gamma$ and all sufficiently small $r$, with uniform constants on the compact ambient neighborhood. The singular set is empty when $k lt.eq 6$. Dilations about a fixed point have subsequences converging to multiplicity-one perimeter-minimizing boundary cones, with convergence of perimeter measures and supports on compact sets, and smooth multiplicity-one graphical convergence on compact subsets of the regular limit. A multiplicity-one plane tangent cone implies regularity of the original point. These statements concern boundaries of sets; no multiplicity assumption is being inferred merely from stationarity of a varifold.

#thm([Lemma 4.11.])[
  (Removal of the singular set for bounded subsolutions).  #emph[Suppose $k > 2$ and let $Gamma$ be as above. A bounded nonnegative function $w in W_(upright("loc"))^(1 \, 2) \( Gamma \\ cal(S) \)$ satisfying $Delta_Gamma w gt.eq - F$ weakly there, where $F gt.eq 0$ is constant, has locally finite Dirichlet energy through $cal(S)$. The inequality extends to compactly supported tests on all of $Gamma$. There are $r_0 > 0$ and $C_0 < oo$, depending only on the ambient neighborhood, $k$, and $Lambda$, such that 
$ upright("ess") thin s u p_(Gamma ∩ B_(r \/ 2) \( x \)) w lt.eq C_0 [(r^(- k) integral_(Gamma ∩ B_r \( x \)) w^2 thin d mu)^(1 \/ 2) + F r^2] \, #h(2em) 0 < r lt.eq r_0 . $

 For a continuous function on the regular part the essential supremum can be replaced by the supremum there. The constants are uniform under dilations by scales tending to zero about points in the fixed compact ambient neighborhood. One may in particular start with $w$ on one regular component and extend it by zero to the other regular components.]
] <lem:variation:capacity-submean>

#proof[
  Here is the capacity calculation and the energy argument needed before using a Sobolev inequality. On a fixed compact region cover its singular set by finitely many ambient balls $B_(r_i) \( p_i \)$, with $r_i < epsilon$ and $sum_i r_i^(k - 2) < epsilon$. Such covers exist because $dim_(cal(H)) cal(S) lt.eq k - 7 < k - 2$. Let $theta_i$ be one on $B_(r_i) \( p_i \)$, zero outside $B_(2 r_i) \( p_i \)$, and satisfy $\| nabla theta_i \| lt.eq 2 \/ r_i$. The cutoff $chi = 1 - max_i theta_i$ satisfies
  $ integral_Gamma \| nabla chi \|^2 thin d mu lt.eq C Lambda sum_i r_i^(k - 2) \, #h(2em) integral_Gamma \( 1 - chi \)^2 thin d mu lt.eq C Lambda sum_i r_i^k . $
  The first estimate follows pointwise almost everywhere by selecting an index attaining the maximum. Taking shrinking covers gives $0 lt.eq chi_j lt.eq 1$, equal to zero near $cal(S)$, converging to one at every regular point, with both displayed integrals tending to zero. Local versions use a slightly larger compact region than the support of the test under consideration.
  For a fixed smooth ambient cutoff $eta$, test the subsolution inequality with $eta^2 chi_j^2 w$. Sobolev approximation on the smooth regular part justifies this test. Expanding and applying Young’s inequality gives
  $ integral eta^2 chi_j^2 \| nabla w \|^2 thin d mu lt.eq 4 integral w^2 \| nabla \( eta chi_j \) \|^2 thin d mu + 2 F integral eta^2 chi_j^2 w thin d mu . $
  The right side is uniformly bounded because $w$ is bounded, the area is locally finite, and the capacity energies tend to zero. Fatou’s lemma proves local finite energy. Moreover, $chi_j w$ converges to $w$ in local $W^(1 \, 2)$: the extra gradient $w nabla chi_j$ tends to zero in $L^2$, and dominated convergence applies to $\( 1 - chi_j \) nabla w$. For a nonnegative smooth compact test $psi$, the tests $psi chi_j^2$ now pass to the limit in the weak inequality. Indeed, the only extra term is bounded by
  $ 2 parallel psi parallel_oo parallel nabla w parallel_(L^2 \( "supp" psi \)) parallel nabla chi_j parallel_(L^2) \, $
  and tends to zero. This proves removability, without assuming energy regularity in advance.
  The required Sobolev input is the Michael–Simon inequality #cite(label("MichaelSimon1973")), in the following local $L^2$ form:
  $ (integral \| v \|^(2 k \/ \( k - 2 \)) thin d mu)^(\( k - 2 \) \/ k) lt.eq C integral #scale(x: 120%, y: 120%)[\(] \| nabla v \|^2 + C_(upright("amb")) v^2 #scale(x: 120%, y: 120%)[\)] thin d mu . $
  Initially $v$ is compactly supported in the regular part. To obtain this form, apply the $L^1$ Michael–Simon inequality to $\| v \|^(2 \( k - 1 \) \/ \( k - 2 \))$ and use Cauchy–Schwarz. A smooth isometric embedding of a slightly larger compact ambient neighborhood gives a bound for its second fundamental form. Since $Gamma$ is minimal in the ambient metric, its Euclidean mean curvature in that embedding is bounded by the trace of this ambient second fundamental form. In particular the bound does not involve $\| A_Gamma \|$. The capacity approximation just proved extends the inequality to the tests used here. Dilating this fixed embedding multiplies its second fundamental form by the dilation scale, which also proves the claimed uniformity in blow-ups.
  For completeness, put $v = w + F r^2$; if $F = 0$, first put $v = w + delta$ and later let $delta arrow.b 0$. On $B_r \( x \)$ this is a positive subsolution of $Delta v gt.eq - r^(- 2) v$. Testing with $eta^2 v^(p - 1)$, $p gt.eq 2$, and applying the preceding Sobolev inequality gives
  $ (integral \| eta v^(p \/ 2) \|^(2 k \/ \( k - 2 \)) thin d mu)^(\( k - 2 \) \/ k) lt.eq C p^2 integral \( \| nabla eta \|^2 + r^(- 2) eta^2 \) v^p thin d mu \, $
  after decreasing $r_0$ so the bounded ambient term is absorbed in $r^(- 2)$. All power tests follow from boundedness of $w$ and the energy approximation above. Iteration with $p_j = 2 \( k \/ \( k - 2 \) \)^j$ on radii $r \/ 2 + r \/ 2^(j + 1)$ yields the displayed submean estimate; the factors converge since $sum_j \( 1 + j \) \/ p_j < oo$. The contribution of the added constant is bounded by $C F r^2$ using $mu \( B_r \) lt.eq Lambda r^k$. Finally, every regular point has a connected smooth neighborhood in one regular component. The boundary within $Gamma$ of any regular component is contained in $cal(S)$. Zero extension to other components therefore adds no regular interface, and the same capacity argument applies. ◻
]

#thm([Lemma 4.12.])[
  (A flat link component determines the entire cone).  #emph[Let $C subset bb(R)^(k + 1)$ be the support of a nonzero multiplicity-one perimeter-minimizing boundary cone. If a component of the regular link $L_(upright("reg")) = \( C ∩ S^k \)_(upright("reg"))$ is totally geodesic in $S^k$, then $C$ is a hyperplane.]
] <lem:variation:flat-link-component>

#proof[
  Write $d = k - 1$ for the link dimension and $cal(S)_L = \( "sing" C \) ∩ S^k$. The product description of the cone away from its vertex and the singular-dimension estimate give $dim_(cal(H)) cal(S)_L lt.eq k - 8 = d - 7$ when the link is singular. Its area growth is of order $r^d$: on a fixed annulus the radial product formula and cone area growth imply this bound by integrating over radial intervals of length comparable to $r$. Thus $cal(S)_L$ has zero $2$-capacity in the link by the preceding cover construction. A smooth link needs no capacity cutoffs.
  Let $U$ be the totally geodesic regular component. It lies in a great equator $E$ and is open in $E$. Every limit point of $U$ that is regular belongs to $U$: a connected local regular chart through that point meets $U$, so belongs to the same component. Consequently $U$ is relatively closed as well as open in $E \\ cal(S)_L$. This latter set is connected. One elementary justification is to use stereographic coordinates on $E$. Given two points outside $cal(S)_L$, almost every intermediate point can be joined to both by straight segments missing $cal(S)_L$: the set of bad intermediate points is contained in the two radial shadows of that set, whose Hausdorff dimension is at most $dim_(cal(H)) cal(S)_L + 1 < d$. Taking countably many bounded pieces handles the point omitted by stereographic projection. Thus $U = E \\ cal(S)_L$, and closedness of the support implies $E subset C ∩ S^k$.
  Any other connected regular link component $V$ is disjoint from $E$. Indeed a smooth regular neighborhood of a point of $E$ already contains the equatorial sheet; as an embedded hypersurface of the same dimension it is that sheet locally. By connectedness $V$ lies in one strict hemisphere. Its suitably signed equatorial height $h$ satisfies
  $ h > 0 \, #h(2em) \| h \| lt.eq 1 \, #h(2em) \| nabla_V h \| lt.eq 1 \, #h(2em) Delta_V h = - d h . $
  This Laplace identity holds for coordinate functions on a minimal $d$-dimensional submanifold of the unit sphere. Test it on $V$ with the squared link capacity cutoffs $chi_j^2$. These tests have compact support in $V$: any relative boundary of $V$ in the compact link is singular. They give
  $ d integral_V h chi_j^2 thin d cal(H)^d = 2 integral_V chi_j chevron.l nabla h \, nabla chi_j chevron.r thin d cal(H)^d arrow.r 0 . $
  Here Cauchy–Schwarz, the finite link area, and the vanishing capacity energy justify the limit. Dominated convergence gives $integral_V h = 0$, contradicting $h > 0$ on a nonempty open component. Hence no such $V$ exists. The regular support is contained in $E$; the singular set has zero link area, and the regular set is dense in the support. Thus the support is precisely $E$, and multiplicity one makes the cone a hyperplane. ◻
]

#thm([Lemma 4.13.])[
  (A Liouville theorem for minimizing cones).  #emph[Let $C$ be a nonflat multiplicity-one perimeter-minimizing boundary cone of dimension $k$. If $z$ is a bounded, nonnegative, smooth function on $"reg" C$ satisfying 
$ Delta_C z gt.eq \| A_C \|^2 z \, $

 then $z = 0$. No smoothness or connectedness of the regular link is assumed.]
] <lem:variation:cone-liouville>

#proof[
  A nonflat minimizing boundary cone has $k gt.eq 7$. In logarithmic radius $s = log r$ and the regular link $L$, set $a = k - 2 > 0$, $V = \| A_L \|^2$, and $Z \( s \, omega \) = z \( e^s omega \)$. The cone metric and the scaling of the second fundamental form give
  $ Z_(s s) + a Z_s + Delta_L Z gt.eq V Z . $
  The operator on the left is in divergence form for the measure $e^(a s) thin d s thin d cal(H)_L^(k - 1)$. On any compact $s$-strip, test after dropping $V Z gt.eq 0$ with $eta \( s \)^2 chi_j \( omega \)^2 Z$. The energy proof in Lemma 21, with this smooth positive weight, proves finite energy on smaller strips and permits removal of the link capacity cutoffs. In particular, tests constant in the link variable are legitimate. It follows that
  $ q \( s \) = integral_L Z \( s \, omega \) thin d cal(H)_L^(k - 1) \( omega \) quad upright("satisfies") quad q'' + a q' gt.eq 0 $
  on the entire real line in distributions. The energy bound gives $q in H_(upright("loc"))^1 \( bb(R) \)$, so we use its continuous representative. It is bounded and nonnegative.
  Such a $q$ is nondecreasing. To see this, convolve with a smooth nonnegative kernel. For the resulting smooth bounded function, $\( e^(a s) q' \)' gt.eq 0$. If $q' \( s_0 \) < 0$, then for every $s < s_0$
  $ q' \( s \) lt.eq e^(a \( s_0 - s \)) q' \( s_0 \) . $
  Integrating backwards forces $q \( s \) arrow.r + oo$ as $s arrow.r - oo$, contrary to boundedness. Thus all mollifications are nondecreasing, and so is $q$.
  Suppose $Z$ is not zero. Positivity on a regular open patch implies $q \( s_0 \) > 0$ for some $s_0$. Choose $rho in C_c^oo \( \( 1 \, 2 \) \)$, $rho gt.eq 0$, $integral rho = 1$, and set
  $ rho_T \( s \) = T^(- 1) rho \( s \/ T \) \, #h(2em) Z_T \( omega \) = integral_(bb(R)) rho_T \( s \) Z \( s \, omega \) thin d s . $
  For $T > s_0$ one has $integral_L Z_T gt.eq q \( s_0 \) > 0$, while $0 lt.eq Z_T lt.eq parallel z parallel_oo$. On every compact regular link patch, integration by parts in $s$ gives
  $ Delta_L Z_T gt.eq V Z_T - e_T \, #h(2em) \| e_T \| lt.eq parallel z parallel_oo \( parallel rho''_T parallel_(L^1) + a parallel rho'_T parallel_(L^1) \) lt.eq C \/ T . $
  Local Caccioppoli estimates give uniform $W^(1 \, 2)$ bounds there. Weak compactness on a countable exhaustion by regular patches and weak-star compactness in $L^oo \( L \)$ provide a common subsequence with limit $overline(Z) in W_(upright("loc"))^(1 \, 2) \( L \)$ satisfying
  $ 0 lt.eq overline(Z) lt.eq parallel z parallel_oo \, #h(2em) integral_L overline(Z) gt.eq q \( s_0 \) \, #h(2em) Delta_L overline(Z) gt.eq V overline(Z) . $
  The integral passes to the weak-star limit since the whole link has finite area. There is no assumption here that $V$ is bounded or integrable at its singular set.
  Test the last inequality with $chi_j^2 overline(Z)$, supported away from the singular link. Expanding and using Young’s inequality gives
  $ 1 / 2 integral_L chi_j^2 \| nabla overline(Z) \|^2 + integral_L V chi_j^2 overline(Z)^2 lt.eq 2 parallel z parallel_oo^2 integral_L \| nabla chi_j \|^2 arrow.r 0 . $
  Fatou’s lemma shows that $overline(Z)$ is constant on each regular link component, and that any component with positive constant has $A_L = 0$. There are at most countably many regular components, since the regular link is a second countable manifold. Its positive integral therefore supplies at least one such component. Lemma 22 would make $C$ a plane, contrary to hypothesis. Hence $Z$, and therefore $z$, is zero. ◻
]

The cone Liouville theorem supplies the obstruction at a singular limit. We now apply it to the reciprocal Jacobi field, using the uniform submean estimate to control approaches that do not remain in regular cone patches.

#thm([Lemma 4.14.])[
  (Reciprocal Jacobi fields under dilation).  #emph[Let $Sigma$ be one connected regular component of $Gamma$, and suppose $phi > 0$ is smooth on $Sigma$ with 
$ Delta_Sigma phi + \( \| A_Sigma \|^2 + "Ric"_g \( nu \, nu \) \) phi = 0 \, #h(2em) phi gt.eq m_0 > 0 . $

 Extend $z = 1 \/ phi$ by zero on the other regular components. Fix $p in Gamma$ and $r_j arrow.b 0$. Pass to a subsequence on which dilation about $p$ by $r_j^(- 1)$ converges to a tangent cone $C$. After a further subsequence, the dilated $z_j$ converge smoothly on all compact regular cone patches to a bounded nonnegative smooth $z_0$, with 
$ Delta_C z_0 gt.eq \| A_C \|^2 z_0 . $

 Different regular cone components are allowed to have zero limits.]
] <lem:variation:reciprocal-compactness>

#proof[
  In exponential coordinates at the fixed point $p$, let $g_j$ be the rescaled metrics; these tend smoothly to the Euclidean metric on compact sets. On the rescaled copy of $Sigma$,
  $ Delta_(Gamma_j) z_j = \( \| A_(Gamma_j) \|^2 + "Ric"_(g_j) \( nu_j \, nu_j \) \) z_j + 2 \| nabla z_j \|^2 \/ z_j gt.eq \( \| A_(Gamma_j) \|^2 - C r_j^2 \) z_j . $
  The zero extension is bounded by $m_0^(- 1)$ and is smooth on every regular component. On a connected regular limit chart, smooth multiplicity-one convergence identifies $Gamma_j$ with a single connected graph. The graph lies either in the rescaled $Sigma$ or in another component. Passing to a subsequence fixes this alternative. In the latter case $z_j = 0$ there. In the former choose a base point in the chart and normalize $phi_j$ by its value there. The scalar Harnack inequality and interior Schauder estimates #cite(label("GilbargTrudinger2001")) apply: the graph metrics are smoothly uniformly elliptic and the Jacobi potentials are uniformly bounded with every derivative on a slightly larger regular chart. They bound the normalized positive functions and their reciprocals in every interior $C^l$ norm. Therefore $z_j$ has uniform interior $C^l$ bounds, even if its value at the base point tends to zero; in that case the same normalization proves smooth convergence to zero. If its value has a positive limit, reciprocal convergence proves the claimed differential inequality. It is also valid on zero limit patches. A countable exhaustion by relatively compact regular charts and diagonal extraction produce compatible limits on the entire regular cone. ◻
]

#thm([Lemma 4.15.])[
  (Positive lower bound and blow-up at every singular end).  #emph[Let $Sigma$ be a connected regular component of the compact locally perimeter-minimizing boundary $Gamma$. Every smooth positive solution of 
$ Delta_Sigma phi + \( \| A_Sigma \|^2 + "Ric"_g \( nu \, nu \) \) phi = 0 $

 satisfies $inf_Sigma phi > 0$. Moreover, $phi \( x_j \) arrow.r + oo$ for every sequence $x_j in Sigma$ with $"dist" \( x_j \, cal(S) \) arrow.r 0$.]
] <lem:variation:jacobi-singular-ends>

#proof[
  If $Gamma$ is smooth, its regular components are compact and the first assertion follows from positivity and continuity; the second is vacuous. Otherwise $k gt.eq 7$, so all preceding lemmas apply. Choose $C gt.eq sup \| "Ric"_g \|$ on the compact ambient neighborhood. Convex truncation of the Jacobi equation shows that
  $ w_delta & = \( 1 - phi \/ delta \)_(+) \, #h(2em) 0 lt.eq w_delta lt.eq 1 \,\
Delta_Sigma w_delta & gt.eq \( \| A_Sigma \|^2 + "Ric"_g \( nu \, nu \) \) \( phi \/ delta \) thin 1_({ phi < delta }) gt.eq - C . $
  The possible measure at the truncation level has the favorable nonnegative sign. Extend these functions by zero to other regular components and use Lemma 21. Fix $r > 0$ small enough that $C_0 C r^2 < 1 \/ 4$ and cover $Gamma$ by finitely many balls of radius $r \/ 2$ with corresponding $r$-balls in the allowed ambient neighborhood. Since $w_delta arrow.r 0$ at every regular point and the whole perimeter is finite, dominated convergence makes all the finitely many integral terms less than $1 \/ 4$ for small enough $delta > 0$. Thus $w_delta lt.eq 1 \/ 2$ everywhere on $Sigma$, proving $phi gt.eq delta \/ 2$. The radius is fixed before $delta$ is sent to zero.
  Set $z = 1 \/ phi$, extended by zero as before, and write $M = parallel z parallel_oo < oo$. It satisfies $Delta z gt.eq \( \| A_Sigma \|^2 - C \) z$ on $Sigma$ and hence $Delta z gt.eq - C M$ on all regular components. Suppose the second assertion fails. After passing to a subsequence, compactness gives a #emph[fixed] $p in cal(S)$ with $x_j arrow.r p$ and $z \( x_j \) gt.eq epsilon.alt > 0$. Set $r_j = 4 "dist"_g \( x_j \, p \)$ and dilate about $p$. The points $x_j$ then lie in the rescaled $B_(1 \/ 2)$. A tangent-cone subsequence converges to a nonflat cone, since a plane tangent cone would imply regularity at $p$. Lemmas 24 and 23 give $z_j arrow.r 0$ smoothly on every compact regular patch of that cone.
  This convergence and the uniform bound $M$ imply
  $ integral_(Gamma_j ∩ B_1) z_j^2 thin d mu_j arrow.r 0 . $
  To verify the assertion at singular points, choose a neighborhood of the cone singular set in $overline(B)_(3 \/ 2)$ whose closure has arbitrarily small cone measure. Such neighborhoods exist because the singular set has zero cone measure; they may be chosen with measure-zero boundary. Perimeter-measure convergence bounds the $mu_j$-measure of these neighborhoods by the same arbitrarily small quantity, up to an error tending to zero. On their complement in $overline(B)_1$, support convergence and finitely many regular graph charts give uniform convergence of $z_j$ to zero. The integral on the omitted neighborhood is bounded by $M^2$ times its measure. Let first $j arrow.r oo$ and then the omitted measure tend to zero. The cone has zero $k$-dimensional measure on every sphere of positive radius, so the displayed ball causes no boundary measure issue.
  The rescaled inequality is $Delta z_j gt.eq - C M r_j^2$. The uniform scaled form of Lemma 21, on a fixed ball, now implies $sup_(Gamma_j ∩ B_(1 \/ 2)) z_j arrow.r 0$, contradicting $z \( x_j \) gt.eq epsilon.alt$. This proves the blow-up along every singular approach. In particular, there has been no use of a cone limit for dilations centered at moving singular points, and no uniqueness of the tangent cone is needed. ◻
]

=== 4.11 Diffuse second derivatives on the zero set <diffuse-second-derivatives-on-the-zero-set>

The remaining obstruction is a nonatomic family of sheets on which $u$ vanishes identically. On a transverse line such a family gives a diffuse second-derivative measure, but the diffuse part of the second derivative of a nonnegative function cannot charge its minimum level.

#thm([Lemma 4.16.])[
  (The diffuse BV derivative at a minimum level).  #emph[Let $f gt.eq 0$ be locally Lipschitz on an interval $I$, and assume its almost-everywhere derivative $v = f'$ belongs to $B V_(upright("loc")) \( I \)$. If $D^d v$ denotes the nonatomic part of $D v$, then 
$ \| D^d v \| \( { f = 0 } \) = 0 . $

]
] <lem:variation:diffuse-bv-minima>

#proof[
  The one-dimensional BV representative has finite left and right limits $v \( t - \)$ and $v \( t + \)$ at every interior point; the set $J_v = { t : v \( t - \) eq.not v \( t + \) }$ is countable. Since $f \( t + h \) - f \( t \) = integral_t^(t + h) v \( s \) thin d s$, the one-sided derivatives of $f$ equal these traces. At a zero of the nonnegative $f$,
  $ v \( t - \) lt.eq 0 lt.eq v \( t + \) . $
  Consequently both traces are zero on ${ f = 0 } \\ J_v$.
  We record a direct consequence of the scalar BV chain rule #cite(label("AmbrosioFuscoPallara2000")): for every $a in bb(R)$,
  $ \| D^d v \| \( { t : v \( t - \) = v \( t + \) = a } \) = 0 . $
  It suffices to prove this on a relatively compact interval, where $\| D v \|$ is finite. Choose $eta in C_c^oo \( bb(R) \)$ with $0 lt.eq eta lt.eq 1$ and $eta \( 0 \) = 1$, and define
  $ H_epsilon \( s \) = integral_a^s eta \( \( r - a \) \/ epsilon \) thin d r . $
  Then $parallel H_epsilon parallel_oo lt.eq C epsilon$. The $C^1$ BV chain rule writes
  $ D \( H_epsilon \( v \) \) = eta \( \( tilde(v) - a \) \/ epsilon \) D^d v + sum_(t in J_v) \[ H_epsilon \( v \( t + \) \) - H_epsilon \( v \( t - \) \) \] delta_t \, $
  where $tilde(v)$ is the common trace off the jump set. The first term converges in total variation to $1_({ tilde(v) = a }) D^d v$ by dominated convergence with respect to $\| D^d v \|$. Every summand in the second term tends to zero, and its absolute value is bounded by $\| v \( t + \) - v \( t - \) \|$; the latter jump sizes have finite sum. Thus the second term tends to zero in total variation. On the other hand $H_epsilon \( v \) arrow.r 0$ uniformly, so its distributional derivative tends to zero. The restricted signed measure $1_({ tilde(v) = a }) D^d v$ is therefore zero, and hence so is its total variation. This proves the asserted level locality. Apply it with $a = 0$ and use that the nonatomic measure $\| D^d v \|$ does not charge the countable set $J_v$. Jump atoms are genuinely excluded from the conclusion: $f \( t \) = \| t \|$ has $D^2 f = 2 delta_0$. ◻
]

#thm([Lemma 4.17.])[
  (Nonatomic graph mass cannot be supported where the lapse vanishes).  #emph[Let $V times I$ be a coordinate cylinder, where $V subset bb(R)^k$ is open, and let ${ t = h_a \( y \) : a in A }$ be a Borel family of uniformly smooth graphs defined over $V$ in a larger coordinate range. Only their portions with $h_a \( y \) in I$ are used, so graphs may cross the top or bottom of the cylinder. Let $sigma$ be a finite Borel measure on the parameter space $A subset bb(R)$. Assume that, for every $y in V$, $a mapsto h_a \( y \)$ is injective, and that the weights $w \( y \, a \)$ are measurable with $0 < c_0 lt.eq w lt.eq C_0$ on smaller cylinders. Suppose a nonnegative locally Lipschitz function $u$ satisfies 
$ partial_t^2 u = b \( y \, t \) thin d y thin d t + integral_A w \( y \, a \) thin d y thin delta_(h_a \( y \)) \( d t \) thin d sigma \( a \) $

 as distributions on $V times I$, with each Dirac measure restricted to $I$, where $b$ is locally bounded and $b = 0$ for Lebesgue-almost every point of ${ u = 0 }$. Write $sigma = sigma_(upright("at")) + sigma_(upright("na"))$ for its atomic and nonatomic parts. Then for $sigma_(upright("na"))$-almost every $a$, 
$ \| { y in V : h_a \( y \) in I \, med u \( y \, h_a \( y \) \) = 0 } \| = 0 . $

 In particular $u$ cannot vanish identically on any nonempty open portion of such a graph inside the cylinder. The conclusion holds simultaneously in any specified countable collection of these cylinders, outside one null set of the original measure on minimizing boundaries from which their parameter measures are pushed forward.]
] <lem:variation:non-atomic-slicing>

#proof[
  For almost every $y$ the equation slices to
  $ D^2 u_y = b \( y \, t \) thin d t + lambda_y \, #h(2em) lambda_y = integral_A w \( y \, a \) #scale(x: 120%, y: 120%)[\(] delta_(h_a \( y \)) \|_I #scale(x: 120%, y: 120%)[\)] thin d sigma \( a \) \, #h(2em) u_y \( t \) = u \( y \, t \) . $
  Here is a precise way to arrange the slice exceptional sets. Test the cylinder equation first with products of a smooth base test and each member of a countable collection of smooth tests dense in $C^2$ on every compact subinterval of $I$. Fubini gives the equality outside a single base null set for all tests in that collection. The local Lipschitz bound for $u_y$ and the locally finite measure bounds on the right extend it to every test by density. They also show that $u'_y in B V_(upright("loc")) \( I \)$. A countable exhaustion by smaller cylinders yields one allowable exceptional set for the entire cylinder. The vanishing condition on $b$ likewise holds on ${ u_y = 0 }$ for almost every $y$, by Fubini.
  For each fixed $y$, injectivity of the graph parameter gives
  $ lambda_y \( { t } \) = integral_({ a : h_a \( y \) = t }) w \( y \, a \) thin d sigma \( a \) . $
  Every fiber has at most one member. Consequently the contribution of $sigma_(upright("na"))$ is precisely the nonatomic part $lambda_y^(upright("na"))$, and the contribution of $sigma_(upright("at"))$ is atomic. The strictly positive bounded weights preserve this distinction. Lemma 26 applied to $u_y$ shows that the diffuse part of $D \( u'_y \)$ does not charge $Z_y = { u_y = 0 }$. Taking the diffuse parts in the sliced equation and using $b \( y \, dot.op \) = 0$ almost everywhere on $Z_y$ therefore gives
  $ lambda_y^(upright("na")) \( Z_y \) = 0 quad upright("for almost every ") y . $
  Tonelli’s theorem now yields
  $ 0 = integral_A integral_V w \( y \, a \) thin 1_({ h_a \( y \) in I \, med u \( y \, h_a \( y \) \) = 0 }) thin d y thin d sigma_(upright("na")) \( a \) . $
  The lower bound on $w$ proves the assertion about almost every graph, and no uncountable intersection of slice exceptional sets has been taken.
  To make the final assertion explicit, index the cylinders by $j in bb(N)$. If $pi$ is the original measure and $a_j$ is its graph-height map on the measurable subfamily meeting cylinder $j$, let $N_j$ be the null set of nonatomic parameters excluded above. Since $N_j$ contains no atomic parameters, $sigma_j \( N_j \) = 0$, and the pushforward identity gives $pi \( a_j^(- 1) \( N_j \) \) = 0$. Discard $union.big_(j = 1)^oo a_j^(- 1) \( N_j \)$ together with the previously specified null family. For every remaining minimizing boundary, every nonempty patch of every regular component is represented in the countable cover. Whenever its parameter there is nonatomic, the asserted zero-set exclusion holds. In particular a regular component on which $u$ vanishes identically can only have atomic parameters in this cover. ◻
]

#prodef([Remark 4.18.])[
  For the tensor Hessian equation in the variation argument, the slicing hypothesis has exactly the form above. In coordinates $\( y \, t \)$, put $F_a = t - h_a \( y \)$. Then $nu_a^flat = d F_a \/ \| d F_a \|_g$, and $d A_a = sqrt(det g) thin \| d F_a \|_g thin d y$ on the graph. Contracting the Hessian source twice with $partial_t$, and dividing the resulting measure by the ambient density $sqrt(det g)$, gives the weight $\| d F_a \|_g^(- 1)$, times the fixed positive scalar coefficient in that equation. Uniform transversality and the smooth metric give the required upper and lower bounds. The connection term in $partial_t^2 u = nabla^2 u \( partial_t \, partial_t \) + Gamma_(t t)^i partial_i u$ belongs to the bounded term. If that term is homogeneous and linear in $u \, X \, nabla X \, d u$, with $\| X \| lt.eq u$, $u$ locally Lipschitz and $X in C_(upright("loc"))^(1 \, 1)$, then it vanishes almost everywhere on ${ u = 0 }$: one has $u = X = 0$ there, and Sobolev zero-set locality gives $d u = nabla X = 0$ almost everywhere there. Finally, injectivity of the height parameter is the no-contact property of distinct local minimal graphs, after coincident graphs have been identified.
]

=== 4.12 Removal of all interior area support <removal-of-all-interior-area-support>

We can now finish the localization promised at the beginning of the section. Atomic sheets are totally geodesic. On a nonatomic sheet the diffuse BV argument ensures that the lapse is positive somewhere; the reciprocal Jacobi estimate prevents its comparison maximum from escaping into a singular point. These two cases give one curvature bound, which makes smooth outermostness applicable.

#thm([Theorem 4.19.])[
  (The area multiplier is supported on the original boundary).  #emph[Under the rigidity hypotheses and equality, the probability measure in Proposition 12 satisfies 
$ pi { C : Gamma_C = S } = 1 . $

 Consequently, on every compact variation and end prototype, 
#[#set math.equation(numbering: n => "(4.22)")
 $ 2 k omega cal(E)' \( h \, p \) - c a'_S \( h \) = integral_(frak(A)) frak(C)' \( h \, p \; v \) thin d Lambda - integral_S theta'_(+) \( h \, p \) thin d zeta \, #h(2em) a'_S \( h \) = 1 / 2 integral_S "tr"_S h thin d A . $ <eq:variation:boundary-multiplier>]

 In particular the area source in Equation (4.11) vanishes in the open exterior. Boundary mass of the constraint measure $Lambda$ is not included in this conclusion.]
] <thm:variation:boundary-support>

#proof[
  For $3 lt.eq n lt.eq 7$, the conclusion was proved above using Proposition 15. We therefore assume $n gt.eq 8$.
  #strong[One full-measure family of graph patches.]
  Discard the exceptional family in Lemma 16 and the complement of $"supp" pi$, which has zero measure because $frak(T)$ is a compact metric space. Use the countable cylinders, height maps $a_j$, and pushforward measures $lambda_j$ fixed in Subsection 4.7; the measures still come from the original $pi$, since the discarded family has zero mass.
  The $partial_t^2 u$ component of Equation (4.11), written in each such cylinder, has exactly the form in Lemma 27. Its positive weight is $c \/ \( 2 \| d \( t - h_a \( y \) \) \|_g \)$. The remaining bounded term is homogeneous and linear in $u \, X \, nabla X \, d u$. On ${ u = 0 }$, causality implies $X = 0$, and Sobolev locality gives $d u = nabla X = 0$ almost everywhere. The bounded term thus vanishes there almost everywhere. Apply that lemma on each cylinder and remove the countable union of its exceptional families of minimizers. Every remaining non-atomic graph patch has $u > 0$ somewhere; indeed its zero set has zero graph area. This discarding is on the original measure space $frak(T)$ by the pushforward identity, not on an uncountable collection of separately chosen leaves.
  #strong[A curvature bound on each regular component.]
  Fix a remaining wholly interior frontier and a connected component $Sigma$ of its regular part. If a local graph parameter is an atom, then all the coincident minimizers agree along this entire component. To see this, the coincidence set is open by the regular-sheet comparison principle; a limit point in $Sigma$ lies in the other closed frontier and the same principle makes coincidence open there as well. Connectedness makes the set all of $Sigma$. Thus the same positive-mass fiber is present in every smaller patch of this component, and Lemma 17 gives $A_Sigma = 0$ everywhere.
  Otherwise take a non-atomic patch of $Sigma$. Lemma 18 supplies one positive $phi$ on all of $Sigma$ solving Equation (4.21). It is bounded below and diverges along every singular approach by Lemma 25. The functions
  $ Q_(+) = u - g \( X \, nu \) \, #h(2em) Q_(-) = u + g \( X \, nu \) $
  are nonnegative and bounded on the compact ambient neighborhood. By the diffuse-zero-set exclusion, $u > 0$ somewhere on the chosen patch, so at least one $Q_plus.minus$ is positive somewhere. For that sign, $Q_plus.minus \/ phi$ attains a positive maximum on $Sigma$: it tends to zero at every singular end, and on a component without singular ends the component is compact. All regular frontier components have relative boundary only in the singular set, so these are the only possibilities for escape from compact subsets of $Sigma$.
  At a point where this ratio is positive one has $u > 0$. Lemma 20 therefore gives
  $ L_plus.minus Q_plus.minus lt.eq - u \| A_Sigma plus.minus K_(upright("tan")) \|^2 \, #h(2em) L_plus.minus phi = 0 . $
  Dividing by $phi$ removes the zeroth-order term: if $L_plus.minus = - Delta + b_plus.minus dot.op nabla + V_plus.minus$, the operator on the ratio is $- Delta + \( b_plus.minus - 2 nabla log phi \) dot.op nabla$. Its distributional strong maximum principle applies to the locally Lipschitz ratio. For example, apply the weak Harnack inequality to the nonnegative difference between its maximum and the ratio. The positive maximum set is open in $Sigma$ by this principle and closed by continuity; its positivity ensures that the focusing inequality holds throughout every neighborhood used in this argument. Connectedness makes the ratio constant and positive on all of $Sigma$. The displayed inequality then forces $A_Sigma plus.minus K_(upright("tan")) = 0$ there. We conclude in both the atomic and non-atomic cases that
  #[#set math.equation(numbering: n => "(4.23)")
   $ \| A_Sigma \| lt.eq sup_(Gamma_C) \| K \| . $ <eq:variation:curvature-bound>]
  The bound is independent of the component. Each regular frontier has at most countably many components; the preceding single full-measure family already makes these conclusions simultaneous.
  #strong[Removal of singular points.]
  There can now be no singular point on this frontier. At such a point take a fixed-center tangent cone. Smooth convergence on each regular cone patch and the rescaled bound $\| A_(upright("scaled")) \| lt.eq r_j sup \| K \| arrow.r 0$ make every regular cone component totally geodesic. Some regular component exists by the positive density and singular-dimension bound. Its regular link component is totally geodesic, so Lemma 22 makes the cone a multiplicity-one plane. Density regularity then makes the original point regular, a contradiction.
  #strong[Application of smooth outermostness.]
  The entire frontier is therefore a compact smooth embedded two-sided hypersurface, with finitely many components by compactness and local regularity. Its filled minimizer has connected exterior containing the end, as proved in Lemma 11. The closure of that exterior in $Omega$ is a smooth closed codimension-zero submanifold with this entire frontier as its intrinsic boundary. Since the frontier is wholly interior, it is an enclosing cut of exactly the kind excluded by the outermostness hypothesis. Equation (4.17) gives $theta_(+) = 0$ everywhere with the normal toward the end, a contradiction.
  Thus almost every remaining frontier is $S$. Integrating its fixed area derivative yields Equation (4.22). The moment regularity and interior equations were obtained before this removal, so they remain valid with zero interior area source. ◻
]

== 5 Static rigidity and the original horizon embedding <sec:static>

The preceding variational argument has located the area multiplier on $S$, the original smooth boundary. We now turn that local information into a global description of the original metric and second fundamental form. This step requires more than solving a vacuum static equation: the adjoint initially permits null dust, and the norm of its stationary field may vanish away from $S$.

We use the strong-decay equality class of Definition 4: $n gt.eq 3$, the exterior is complete with its connected boundary included, its complement to a single Euclidean end is compact, and the decay is $O_6 \( r^(- q) \) \/ O_5 \( r^(- 1 - q) \)$ with $\( n - 2 \) \/ 2 < q < n - 2$. The dominant energy condition and the future-normal convention remain those of Definition 1. Theorem 29 supplies the localized multiplier; Proposition 12 supplies its charge normalization, its complementary support, and its variational identity for compact variations up to $S$. In particular, no frontier carrying the area multiplier remains in the open exterior. Put

#[#set math.equation(numbering: n => "(5.1)")
 $ r_h = \( A \/ omega \)^(1 \/ k) \, #h(2em) m = 1 / 2 r_h^(k - 1) \, #h(2em) b^0 = E \/ m \, quad b = - P \/ m \, #h(2em) c = \( k - 1 \) \/ r_h \, quad kappa = c \/ 2 . $ <eq:static:constants>]

Thus $\( b^0 \)^2 - \| b \|^2 = 1$ and $kappa > 0$. We retain the convention that $nu$ points from $S$ into the exterior.

#thm([Theorem 5.1.])[
  (Recovery of the original data).  #emph[Under the equality and rigidity hypotheses of Theorem 5, the original exterior, with its boundary included, admits a smooth spacelike embedding into the regular Schwarzschild–Tangherlini exterior of mass $m$. Its induced metric and future-normal second fundamental form are $g$ and $K$. The boundary is a full section of the future horizon, or the bifurcation sphere, and the end approaches spatial infinity.]
] <thm:static:classification>

Here is the order of the argument. The adjoint gives smooth fields $u \, X$ and a stationary spacetime containing the original slice. A twist identity, tested through the possible zero set of $u^2 - \| X \|^2$, makes that spacetime locally static wherever the stationary field is timelike. Write $h$ and $lambda$ for the resulting static base metric and lapse. Two auxiliary completions then have different purposes. After the twist vanishes, the circle metric $h + lambda^2 d T^2$ rules out an interior zero frontier of the Killing norm by completeness, Ricci flatness, and the splitting theorem. We then double the static base conformally across its attached boundary, compactify one end, and prove that the resulting zero-mass metric is Euclidean. This identifies $\( h \, lambda \)$; a global time primitive finally recovers the original pair $\( g \, K \)$, including its smooth attachment to the future horizon or bifurcation sphere. The nonnegative-mass input is proved below from the numerical Riemannian Penrose theorem and independent smooth-obstacle geometry. Its conformal correction and all regularity arguments are part of the present proof.

=== 5.1 From the localized multiplier to smooth normalized fields <from-the-localized-multiplier-to-smooth-normalized-fields>

Our first task is to turn the multiplier into ordinary smooth fields, including at the boundary, and to identify their constants at infinity. The finite first-jet system performs both tasks; the causal inequality rules out the linear growth that this system would otherwise allow.

Write $u \, X$ for the scalar and vector moments in Proposition 12, using the original volume density. Their distributional inequalities are

#[#set math.equation(numbering: n => "(5.2)")
 $ u gt.eq \| X \|_g \, #h(2em) u mu + J \( X \) = 0 . $ <eq:static:complementarity>]

After Theorem 29, their interior equations are

#[#set math.equation(numbering: n => "(5.3)")
 $ "sym" nabla X = - u K \, #h(2em) "Hess" u = - cal(S) + frac("tr"_g cal(S), k) g \, $ <eq:static:adjoint>]

where the smooth-coefficient linear expression is

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(S) =  & - u "Ric"_g + 2 u \( K^2 - tau K \) + cal(L)_X K - \( "div" X \) K - "div" \( K \( X \, dot.op \) \) g - "sym" \( J ⊗ X^flat \) . $ <eq:static:S>]

Here $K_(i j)^2 = K_i zws^a K_(a j)$, and the last divergence is the divergence of the one-form $K \( X \, dot.op \)$. These formulas also specify all the zeroth-order terms needed in the continuation argument.

#thm([Lemma 5.2.])[
  #emph[The interior moments are smooth and extend smoothly to $S$. The multiplier has no additional scalar or vector measure supported on $S$.]
] <lem:static:smooth-fields>

#proof[
  The first equation in Equation (5.3) has the usual finite prolongation. More explicitly, if $T_(i j) = nabla_i X_j + nabla_j X_i = - 2 u K_(i j)$, the combination
  $ nabla_i T_(j ell) + nabla_j T_(i ell) - nabla_ell T_(i j) $
  equals $2 nabla_i nabla_j X_ell$ plus curvature contractions with $X$; this follows by commuting the two derivatives in the three terms. Consequently $nabla^2 X$ is a smooth linear combination of $u \, X \, d u$. Together with the second equation in Equation (5.3), this is a closed first-order homogeneous system for
  $ cal(Y) = \( u \, X \, d u \, nabla X \) \, #h(2em) nabla_i cal(Y) = cal(A)_i cal(Y) \, $
  with smooth coefficients. The interior regularity already obtained for the moments in the preceding section, followed by these equations, gives smoothness. Alternatively their traced equations and smooth elliptic regularity give the first bootstrap directly.
  Fix an interior slice of a compact collar of $S$. Along each collar normal, the displayed system is an ordinary linear differential equation with smooth coefficients on a closed finite interval. Its solution and all derivatives with respect to the footpoint extend to the endpoint. The original solution agrees with this extension by uniqueness along each normal. The tangential equations continue to hold there by continuity. This proves smooth extension without yet discarding measures on the boundary.
  Now use metric variations $h$ whose value and first derivatives vanish on $S$, with $p = 0$. Their area and expansion variations vanish there. For the smooth interior fields, integration by parts has zero boundary term and zero interior adjoint term. On the other hand the scalar curvature variation at $S$ can be prescribed freely: in Gaussian coordinates take $h_(A B) = s^2 psi \( y \) g_(A B) \|_(s = 0)$ times a collar cutoff. Its double-divergence minus Laplacian-of-trace at $s = 0$ is $- 2 k psi$, whereas all first-jet and algebraic terms vanish. The multiplier identity therefore annihilates every smooth scalar test against the scalar boundary measure. That measure is zero. The vector boundary measure is dominated by it by Equation (5.2), and is zero as well. ◻
]

The following elementary asymptotic lemma also applies to Killing lapse and shift on the hypersurfaces in the converse.

#thm([Lemma 5.3.])[
  (Causal first jets on an end).  #emph[Suppose $g - delta = O_2 \( r^(- q) \)$, $q > 1 \/ 2$, and a smooth pair $Y = \( u \, X \)$ on the coordinate end satisfies $u gt.eq \| X \|_g$ and 
#[#set math.equation(numbering: n => "(5.5)")
 $ \| D^2 Y \| lt.eq C r^(- 1 - q) \| D Y \| + C r^(- 2 - q) \| Y \| . $ <eq:static:jet-inequality>]

 Then $Y = Y_oo + O_2 \( r^(- q_0) \)$ for every $0 < q_0 < q$.]
] <lem:static:end-jets>

#proof[
  All estimates are uniform in the angular variable. Along radial rays, $\| Y \( r \) \| lt.eq C + integral_(R_0)^r \| D Y \( t \) \| thin d t$. Integrating Equation (5.5), taking the supremum on the sphere, and interchanging the two integrals gives
  $ sup_(R_0 lt.eq t lt.eq r \, thin theta.alt) \| D Y \( t \, theta.alt \) \| lt.eq C + C integral_(R_0)^r t^(- 1 - q) sup_(R_0 lt.eq s lt.eq t \, thin theta.alt) \| D Y \( s \, theta.alt \) \| thin d t . $
  The term containing $Y$ has the required bound because
  $ integral_s^r t^(- 2 - q) thin d t lt.eq C s^(- 1 - q) . $
  Gronwall’s inequality gives $D Y = O \( 1 \)$ and $Y = O \( r \)$, hence $D^2 Y = O \( r^(- 1 - q) \)$. Each Cartesian derivative has a limit along every ray. Comparing two rays on a sphere of radius $r$, along a spherical path of length at most $C r$, shows that their derivative values differ by $O \( r^(- q) \)$. Thus all ray limits form a single constant matrix $B$, and $Y \( x \) = B x + o \( r \)$ uniformly on spheres.
  The first row of $B$ is zero: its linear function is nonnegative on the entire unit sphere, and replacing a direction by its negative changes its sign. Dividing $u gt.eq \| X \|_g$ by $r$ now forces every remaining row of $B$ to vanish. Terminal integration of $D^2 Y$ gives $D Y = O \( r^(- q) \)$.
  If $q > 1$ this already makes $Y$ bounded. If $1 \/ 2 < q < 1$, radial integration first gives $Y = O \( r^(1 - q) \)$, and reinsertion gives $D^2 Y = O \( r^(- 1 - 2 q) \)$ and, since the derivative limit is zero, $D Y = O \( r^(- 2 q) \)$. This is integrable because $2 q > 1$, so $Y$ is bounded. If $q = 1$, replace the exponent in this intermediate step by any number strictly between $1 \/ 2$ and $1$. In all cases choose an intermediate $hat(q)$ with $1 \/ 2 < hat(q) < q$ (or use $q$ itself away from $1$) so that $D Y = O \( r^(- a) \)$ for some $a > 1$. Boundedness of $Y$ in Equation (5.5) then gives $D^2 Y = O \( r^(- 2 - q) \)$, followed by $D Y = O \( r^(- 1 - q) \)$ and convergence of $Y$ on each ray with error $O \( r^(- q) \)$. Angular comparison using this last derivative bound shows that the limits of $Y$ are the same. Weakening the exponent proves the stated $O_2$ assertion. ◻
]

The prolonged system satisfies Equation (5.5): curvature, $nabla K$, $K^2$ and $J$ multiply values, while $K$ and the coordinate Christoffel symbols multiply first derivatives. The assumed end differentiability suffices for the two differentiated estimates. Fix henceforth

#[#set math.equation(numbering: n => "(5.6)")
 $ \( n - 2 \) \/ 2 < q_0 < q \, #h(2em) q_0 eq.not 1 . $ <eq:static:q0>]

The charge prototypes in Proposition 12 identify the constants. After integrating the adjoint equations by parts, the only surviving terms at infinity are the constant lapse times the scalar-curvature flux and twice the constant shift times the momentum-constraint flux. For the scalar prototype $h = O \( r^(2 - n) \)$, $D h = O \( r^(1 - n) \)$, terms such as $u_oo \( g - delta \) D h$, $u_oo Gamma h$, and $K X_oo h$ have integrated flux $O \( r^(- q) \)$. Replacing a constant field by its remainder, or using $D Y$ in a boundary term, contributes $O \( r^(- q_0) \)$. The vector prototypes have the same or better orders. Thus all background and field errors have total flux $O \( r^(- q) \) + O \( r^(- q_0) \) = o \( 1 \)$. The scalar prototype changes $E$ nontrivially and the vector prototypes span the changes of $P$. Comparing their coefficients in the multiplier identity therefore yields

#[#set math.equation(numbering: n => "(5.7)")
 $ u = b^0 + O_2 \( r^(- q_0) \) \, #h(2em) X = b + O_2 \( r^(- q_0) \) . $ <eq:static:normalization>]

Finally $u > 0$ in the open exterior. At an interior zero of $u$, nonnegativity gives $d u = 0$, and domination gives $X = 0$ and $D X = 0$. The full first jet is then zero; uniqueness in the homogeneous system along piecewise smooth paths contradicts Equation (5.7).

=== 5.2 The stationary spacetime and its horizon boundary laws <the-stationary-spacetime-and-its-horizon-boundary-laws>

The fields now have a nonzero future-causal limit and a positive lapse in the interior. We use them to construct a stationary spacetime whose $z = 0$ slice has exactly the given $g$ and $K$. The multiplier identity will determine both the possible matter tensor and the data at $S$.

On $bb(R)_z times "int" Omega$ define

#[#set math.equation(numbering: n => "(5.8)")
 $ upright(bold(g)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) xi = partial_z = u upright(bold(n)) + X . $ <eq:static:stationary-metric>]

We orient time by $upright(bold(n)) = u^(- 1) \( partial_z - X \)$. Its slice second form is $- "sym" nabla X \/ u = K$, with precisely the future-normal convention of the theorem.

#thm([Lemma 5.4.])[
  #emph[The Einstein tensor and the boundary values satisfy 
#[#set math.equation(numbering: n => "(5.9)")
 $ upright(bold(G)) & = mu u^(- 2) xi^flat ⊗ xi^flat \, & "Ric"_(upright(bold(g))) \( xi \, dot.op \) & = 0 \,\
X \|_S & = u nu \, & partial_nu u + K \( X \, nu \) & = kappa . $ <eq:static:dust>]

 On the connected $S$, either $u > 0$ everywhere or $u = 0$ everywhere. Writing $W = u^2 - \| X \|_g^2$, a deleted collar of $S$ has $W > 0$.]
] <lem:static:stress-boundary>

#proof[
  In the open exterior, where $u > 0$, Equation (5.3) gives
  $ b = - u^(- 1) "sym" nabla X = K \, #h(2em) "Hess" u - \( Delta u \) g + cal(S) = 0 . $
  Apply Lemma 19 with this $b$. Complementarity eliminates its volume term and yields
  $ u upright(bold(G))_(i j) = - J_(\( i) X_(j \)) . $
  Gauss–Codazzi supplies $upright(bold(G)) \( upright(bold(n)) \, upright(bold(n)) \) = mu$ and $upright(bold(G)) \( upright(bold(n)) \, partial_i \) = J_i$.
  If $mu > 0$, equality in $0 = u mu + J \( X \) gt.eq mu \( u - \| X \| \)$ forces $\| X \| = u$ and $J = - mu X^flat \/ u$. If $mu = 0$, DEC gives $J = 0$. Since $xi^flat \( upright(bold(n)) \) = - u$ and its spatial part is $X^flat$, these identities give the first part of Equation (5.9). In particular $mu W = 0$. The stress tensor has zero spacetime trace and annihilates $xi$; the same is therefore true of its Ricci contraction.
  For compact variations extending to $S$, the multiplier identity now reads
  $ 2 k omega cal(E)' - c / 2 integral_S "tr"_S h thin d A = integral_Omega { u \( 2 mu \)' + 2 J' \( X \) - J_i h^i zws_j X^j } thin d V_g - integral_S theta'_(+) thin d zeta . $
  The free $p = K'$ boundary term, with integration normal $- nu$, is $2 X_nu "tr"_S p - 2 p \( X_(upright("tan")) \, nu \)$. Since $theta'_(+) = "tr"_S p$ in this test, arbitrary normal-tangential and tangential components give $X_(upright("tan")) = 0$ and $d zeta = 2 X_nu d A$. For a compact conformal test $\( h \, p \) = \( 2 s g \, s K \)$, the constraint variation on active rays is $2 k \( - Delta s + K \( nabla s \, v \) \)$ and $theta'_(+) = k partial_nu s$. Its boundary identity becomes
  $ - k c integral_S s thin d A = 2 k integral_S { u partial_nu s - \( partial_nu u + K \( X \, nu \) \) s } thin d A - k integral_S partial_nu s thin d zeta . $
  The independent value and normal derivative of $s$ give $d zeta = 2 u thin d A$ and Equation (5.9).
  It remains to justify the dichotomy, since $u$ might initially vanish at only part of $S$. One-sided area minimization implies $H gt.eq 0$: test the area by every nonnegative outward speed. Use Lie derivative variations along a compactly supported vector field $Y$ equal to $s nu$ on $S$, extended across its collar. Fix an interior active ray $\( x \, v \)$, let $phi.alt_t$ be the local flow of $Y$, and put $\( g_t \, K_t \) = \( phi.alt_t^(*) g \, phi.alt_t^(*) K \)$. If $v_t$ is the isometrically identified ray for $g_t$, then $w_t = upright(d) phi.alt_t \( v_t \)$ satisfies $\| w_t \|_(g \, phi.alt_t x) = \| v \|_(g \, x) lt.eq 1$. Naturality gives the constraint derivative as $2 F' \( 0 \)$, where
  $ F \( t \) = mu \( phi.alt_t x \) + J_(phi.alt_t x) \( w_t \) gt.eq 0 . $
  Since $x$ is interior, this smooth function is defined for both signs of sufficiently small $t$. Activity gives $F \( 0 \) = 0$, so $F' \( 0 \) = 0$. This argument also applies when $\| v \|_g = 1$, since it differentiates only along the transported curve in the closed unit-ball bundle. Boundary rays contribute no integral, since Lemma 31 has already eliminated the boundary constraint measure. The area variation is $integral_S H s$, and the expansion variation is $L_(+) s$, the outward normal linearization of $theta_(+)$. Thus
  #[#set math.equation(numbering: n => "(5.10)")
   $ L_(+)^(*) u = c / 2 H gt.eq 0 . $ <eq:static:boundary-adjoint>]
  The operator has principal part $- Delta_S$ and smooth bounded coefficients. The strong minimum principle for a nonnegative supersolution applies locally: replace its zeroth-order coefficient by a larger nonnegative constant to obtain the usual form, then propagate along overlapping balls. Since $S$ is connected, $u > 0$ throughout $S$, or $u$ is identically zero there.
  If $u > 0$ on $S$, the tangential derivatives of $W$ vanish, and the normal-normal component of $"sym" nabla X = - u K$ gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ d W \|_S = 2 kappa X^flat = 2 kappa u nu^flat . $ <eq:static:positive-boundary>]
  Thus $W$ is a positive defining function in the exterior collar. If $u = 0$ on $S$, then $X = 0$, all its tangential derivatives vanish, and its symmetrized equation successively gives $nabla_nu X = 0$ in the normal-normal and normal-tangential components. In original exterior distance $s$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ u = s a \, #h(2em) X = s^2 Y_(*) \, #h(2em) a \|_S = kappa \, #h(2em) W = s^2 \( a^2 - s^2 \| Y_(*) \|_g^2 \) \, $ <eq:static:zero-boundary>]
  with smooth coefficients. This also proves positivity in a deleted collar. ◻
]

=== 5.3 A common stationary-field construction of the static base <subsec:static:common-base>

We isolate the part of the stationary argument that also applies to the weaker three- and four-dimensional end hypotheses. Its output allows complete ends arising from an interior null set. The later classification arguments will exclude those ends by different methods. The twist estimate is the main step: near an arbitrary null set, a logarithmic bound controls the transverse derivatives in the flux.

#thm([Proposition 5.5.])[
  (The complete attached static base).  #emph[Let $\( Omega \, g \)$ be a smooth connected $n$-manifold, $n gt.eq 3$, complete with its nonempty compact smooth boundary $S = union.sq.big_(i = 1)^ell S_i$, $1 lt.eq ell < oo$, included. Suppose the complement of a compact set is one Euclidean coordinate end. Let $K \, u \, X$ be smooth up to the one-sided boundary, and suppose that, for some $q_0 > \( n - 2 \) \/ 2$, 
$ g - delta = O_2 \( r^(- q_0) \) \, #h(2em) \( u \, X \) = \( b^0 \, b \) + O_2 \( r^(- q_0) \) \, #h(2em) \( b^0 \)^2 - \| b \|^2 = 1 \, quad b^0 > 0 . $

 Assume $u > 0$ in the open exterior, $u gt.eq \| X \|_g$, and $"sym" nabla X = - u K$. On $bb(R) times "int" Omega$, set 
$ upright(bold(g)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) xi = partial_z \, $

 and assume $"Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0$ throughout this interior spacetime and $"Ric"_(upright(bold(g))) = 0$ where $W := u^2 - \| X \|_g^2 > 0$. On each connected boundary component $S_i$, suppose 
$ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa_i \, #h(2em) kappa_i > 0 med upright("constant") \, $

 where $nu$ points into $Omega$, and suppose either $u > 0$ throughout $S_i$ or $u = 0$ throughout it.]
  #emph[Put $alpha = X_g^flat$. On $cal(U) = { W > 0 }$ define 
#[#set math.equation(numbering: n => "(5.13)")
 $ lambda = sqrt(W) \, #h(2em) h_s = g + W^(- 1) alpha ⊗ alpha \, #h(2em) C = h_s^(- 1) = g^(- 1) - u^(- 2) X ⊗ X \,\
A_s = W^(- 1) alpha \, #h(2em) F_s = d A_s . $ <eq:static:orbit-metric>]

 Then $cal(U)$ is connected and contains the end and a deleted collar of every $S_i$. One has $F_s = 0$, and, writing $h = h_s$, 
#[#set math.equation(numbering: n => "(5.14)")
 $ "Hess"_h lambda = lambda "Ric"_h \, #h(2em) Delta_h lambda = 0 \, #h(2em) R_h = 0 \, #h(2em) 0 < lambda < 1 . $ <eq:static:common-equations>]

 The metric $h$ has a smooth one-sided attachment at each $S_i$, with induced metric $g \|_(T S_i)$, zero second fundamental form, and $partial_(nu_h) lambda = kappa_i$. The attached base is complete with its boundary included. Every possible interior null frontier in the original exterior is infinitely far away for $h$. The even reflection of $h$ and odd reflection of $lambda$ are $C^(2 \, alpha)$ for every $0 < alpha < 1$, and the metric double is complete. After a fixed linear coordinate change, the given end of $h$ is asymptotically Euclidean with $O_2 \( r^(- q_0) \)$ decay.]
] <prop:static:common-base>

The proposition does not yet assert $W > 0$ on the entire original exterior or exactness of the closed form $A_s$.

#thm([Lemma 5.6.])[
  (Vanishing of the stationary twist).  #emph[Under the hypotheses of Proposition 34, $F_s = 0$ on every component of $cal(U)$.]
] <lem:static:twist>

#proof[
  First the boundary laws and $"sym" nabla X = - u K$ give the collars needed below. On a component where $u > 0$, differentiating $W = u^2 - \| X \|^2$ and using its vanishing tangential derivatives gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ d W \|_(S_i) = 2 kappa_i X^flat = 2 kappa_i u nu^flat . $ <eq:static:common-positive-collar>]
  On a component where $u = 0$, also $X = 0$ and its tangential derivatives vanish. The normal-normal and normal-tangential components of the symmetrized equation give $nabla_nu X = 0$. In original exterior distance $s$, therefore,
  #[#set math.equation(numbering: n => "(5.16)")
   $ u = s a \, #h(2em) X = s^2 Y_(*) \, #h(2em) a \|_(S_i) = kappa_i \, #h(2em) W = s^2 \( a^2 - s^2 \| Y_(*) \|_g^2 \) . $ <eq:static:common-zero-collar>]
  Both alternatives imply $W > 0$ in a deleted collar. Since $W arrow.r 1$ at the end, the interior zero set is compact and separated from all these collars and the distant end.
  We first derive an estimate that permits integration through an arbitrary interior zero set of $W$. The tensor $C = g^(- 1) - u^(- 2) X ⊗ X$ is smooth and nonnegative throughout the open exterior, including its zeros of $W$. Let $D_(gamma eta) = bold(nabla)_gamma xi_eta$; the Killing equation makes $D$ skew. In the following calculation $\| D \|_(upright(bold(g)))^2$ denotes the full contraction $D_(gamma eta) D^(gamma eta)$, which need not be nonnegative. The Killing wave identity, together with $"Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0$, gives $bold(square.stroked.tiny W) = - 2 \| D \|_(upright(bold(g)))^2$. The spatial inverse block of $upright(bold(g))$ is $C$, its volume density is $u sqrt(det g)$, and $W$ is independent of $z$. Consequently
  #[#set math.equation(numbering: n => "(5.17)")
   $ u^(- 1) "div"_g \( u C thin d W \) = - 2 \| D \|_(upright(bold(g)))^2 . $ <eq:static:wave>]
  This is an identity of smooth functions through all interior zeros.
  Fix a relatively compact neighborhood of such a zero, small enough that $u$ and $v = \| X \|_g$ have positive lower bounds there. Write $e = X \/ v$, $T = e^perp$, and choose a local $g$-orthonormal frame $\( e \, E_1 \, dots.h \, E_(n - 1) \)$. Let $upright(bold(n))$ be the future unit normal to the $z$-slices, so $xi = u upright(bold(n)) + v e$. For a spatial index $i$ differentiation of $W = - upright(bold(g)) \( xi \, xi \)$ gives
  $ D_(i upright(bold(n))) = u^(- 1) \( - W_i \/ 2 - v D_(i e) \) . $
  Putting $a_a = D_(a e)$ and $b_(a b) = D_(a b)$, full contraction in this Lorentz orthonormal frame therefore gives the exact expansion
  $ - 2 \| D \|_(upright(bold(g)))^2 = frac(\| d W \|_g^2, u^2) + frac(4 v, u^2) sum_a W_a a_a - frac(4 W, u^2) sum_a a_a^2 - 2 sum_(a \, b) b_(a b)^2 . $
  On every smaller relatively compact neighborhood, smooth nonnegativity of $W$ gives $\| d W \|_g^2 lt.eq C_0 W$. This elementary estimate follows by applying the second-order Taylor bound along short geodesics in the direction $- nabla W$. Since $D$ is bounded, the favorable last two terms imply
  $ - 2 \| D \|_(upright(bold(g)))^2 lt.eq C_1 \( W + \| d_T W \|_g \) . $
  Here $d_T W = d W - e \( W \) e^flat$. The eigenvalues of $C$ are $1$ on $T$ and $W \/ u^2$ along $e$.
  Choose a smooth compactly supported cutoff $eta$ in this neighborhood. Multiplying Equation (5.17) by $eta^2 \/ \( W + delta \)$ and integrating gives
  $ E_delta & := integral frac(u eta^2 \| d W \|_C^2, \( W + delta \)^2) thin d V_g\
 & = integral frac(u eta^2 \( - 2 \| D \|_(upright(bold(g)))^2 \), W + delta) thin d V_g + 2 integral frac(u eta chevron.l d eta \, d W chevron.r_C, W + delta) thin d V_g . $
  The preceding upper bound and Young’s inequality bound the first term by $E_delta \/ 4 + C_eta$: use $W \/ \( W + delta \) lt.eq 1$ and $\| d_T W \|_g^2 lt.eq \| d W \|_C^2$. The same inequality bounds the second term by $E_delta \/ 4 + C_eta$, since $C lt.eq g^(- 1)$. Thus $E_delta lt.eq 2 C_eta$, independently of $delta > 0$. Fatou’s lemma gives, wherever $eta = 1$,
  #[#set math.equation(numbering: n => "(5.18)")
   $ integral_({ W > 0 }) \| d_T log W \|_g^2 thin d V_g < oo . $ <eq:static:log-bound>]
  The integral is local in the fixed neighborhood, including its zero set as a limiting set. No ellipticity in the direction $e$ at $W = 0$ was required.
  The estimate controls the transverse logarithmic derivative without requiring ellipticity along $X$. We now derive the twist flux and verify that it contains only this controlled derivative. On $cal(U)$ write $theta = d z - A_s$, so that $upright(bold(g)) = - W theta^2 + h_s$ and
  $ xi^flat = - W theta \, #h(2em) d xi^flat = - d W and theta + W F_s . $
  Raising the index of $theta$ with $upright(bold(g))$ gives no spatial component. Thus the raised spatial block of $d xi^flat$ is $W C^(i k) C^(j l) F_(s \, k l)$. The Killing Maxwell identity $bold(nabla)_gamma \( d xi^flat \)^(gamma eta) = 0$ and stationarity yield
  #[#set math.equation(numbering: n => "(5.19)")
   $ nabla_i Q^(i j) = 0 \, #h(2em) Q^(i j) = u W C^(i k) C^(j l) F_(s \, k l) \, $ <eq:static:Maxwell>]
  where $nabla$ is the connection of $g$. Since $C alpha = \( W \/ u^2 \) X$, multiplication by $A_s$ and lowering with $g$ gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ g_(i ell) Q^(ell j) A_(s \, j) & = 1 / u [X^j \( d alpha \)_(i j) - frac(\| X \|_g^2, W) W_i + frac(X \( W \), W) alpha_i]\
 & = 1 / u [X^j \( d alpha \)_(i j) - \| X \|_g^2 \( d_T log W \)_i] . $ <eq:static:twist-flux>]
  The first line is valid even at zeros of $X$ in $cal(U)$; the second is used only where $X eq.not 0$. In particular the flux $Q^(i j) A_(s \, j)$ is exactly perpendicular to $X$.
  To convert the divergence identity into vanishing twist, we must remove three boundaries of integration: the possible interior zero set, the original horizon, and spatial infinity. We check their fluxes separately before taking any limit. The componentwise collars (5.15)–(5.16) already separate the compact interior zero set from $S$ and the distant end. The boundary estimates below are made on each of the finitely many components.
  Choose a smooth function $f$ which vanishes off a distant end neighborhood and equals $A_(oo \, i) x^i$ sufficiently far out, where $A_oo$ is the constant limit of $A_s$. Put $beta = A_s - d f$, so $d beta = F_s$. Near the zero set and $S$, $beta = A_s$.
  For the interior cutoff take a smooth increasing function $chi$, zero on $\( - oo \, 1 \]$ and one on $\[ 2 \, oo \)$, and use $chi \( W \/ delta \)$ on a fixed neighborhood of the compact zero set. Extend it as one outside a slightly larger such neighborhood. One precise extension is $1 - rho + rho chi \( W \/ delta \)$, with $rho = 1$ near the zero set; for all sufficiently small $delta$, the derivative involving $d rho$ vanishes because $W$ has a positive lower bound on its support. On ${ delta < W < 2 delta }$, transversality in Equation (5.20) gives
  $ lr(|Q^(i j) A_(s \, j) partial_i chi \( W \/ delta \)|) lt.eq C #scale(x: 120%, y: 120%)[\(] \| d_T log W \|_g + \| d_T log W \|_g^2 #scale(x: 120%, y: 120%)[\)] lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| d_T log W \|_g^2 #scale(x: 120%, y: 120%)[\)] . $
  A finite cover by neighborhoods satisfying Equation (5.18) shows that its integral tends to zero as $delta arrow.b 0$.
  For the boundary cutoff use $chi \( s \/ epsilon.alt \)$. If $u > 0$ on $S_i$, then uniformly in its collar
  $ W asymp s \, #h(2em) e = nabla s + O \( s \) \, #h(2em) d_T W = O \( s \) . $
  The flux in Equation (5.20) is bounded and perpendicular to $e$, so its contraction with $d s$ is $O \( s \)$. Since the collar volume is $O \( epsilon.alt \)$ and the cutoff derivative is $O \( epsilon.alt^(- 1) \)$, the boundary error is $O \( epsilon.alt \)$. If $u = 0$ on $S_i$, use the first line of Equation (5.20). Here $d alpha = O \( s \)$, $d log W = O \( s^(- 1) \)$, and $X = s^2 Y$; each term inside its brackets is $O \( s^3 \)$, whereas $u asymp s$. The whole flux is consequently $O \( s^2 \)$, uniformly also where $X = 0$, and the boundary error is $O \( epsilon.alt^2 \)$.
  Finally choose an outer cutoff supported in ${ r < 2 R }$ and equal to one on ${ r < R }$, with derivative $O \( R^(- 1) \)$. On its annulus the end estimates give
  $ beta = O \( r^(- q_0) \) \, #h(2em) Q = O \( r^(- 1 - q_0) \) \,\
lr(|integral Q^(i j) beta_j partial_i chi_R thin d V_g|) lt.eq C R^(n - 2 - 2 q_0) = o \( 1 \) . $
  Let $zeta$ be the product of these three nonnegative cutoffs. It has compact support in $cal(U)$. Testing Equation (5.19) against $zeta beta$ gives
  $ integral frac(zeta u W, 2) C^(i k) C^(j l) F_(s \, i j) F_(s \, k l) thin d V_g = - integral Q^(i j) beta_j partial_i zeta thin d V_g . $
  The left integrand is nonnegative, and strictly positive where $F_s eq.not 0$. Fix any compact subset of $cal(U)$ and choose the cutoffs to equal one there. First let $delta arrow.b 0$, then $epsilon.alt arrow.b 0$, and finally $R arrow.r oo$. The preceding estimates force the twist energy on that compact subset to vanish. Exhausting $cal(U)$ proves $F_s = 0$ everywhere on it, without assuming beforehand that the total twist energy is finite. ◻
]

We henceforth write $h = h_s$ and retain the notation $A_s$ and $F_s = d A_s$.

#proof[
  We identify the positive component, prove the distance estimate at its possible interior null frontier, and attach the original boundary.
  #strong[Step 1: Static equations and the positive component.] By Lemma 35, the one-form $A_s = X^flat \/ W$ is closed on ${ W > 0 }$. On a small simply connected set write $A_s = d Phi$ and set $t = z - Phi$. Then
  $ upright(bold(g)) = - lambda^2 d t^2 + h . $
  The vacuum hypothesis applies on this set. The warped metric formulas, obtained from $upright(bold(Gamma))_(i t)^t = lambda^(- 1) lambda_i$ and $upright(bold(Gamma))_(t t)^i = lambda lambda^i$, are
  $ "Ric"_(upright(bold(g)) \, t t) = lambda Delta_h lambda \, #h(2em) "Ric"_(upright(bold(g)) \, i j) = "Ric"_(h \, i j) - lambda^(- 1) "Hess"_(h \, i j) lambda . $
  They give the equations in Equation (5.14) on every positive component.
  There is a positive component $cal(C)$ containing the end, since $W arrow.r 1$. Every other positive component has compact closure in the original exterior: the complement of a coordinate tail is compact. Its continuous function $lambda$ is zero on its frontier, including any part of $S$. A positive maximum would therefore be attained at an interior point, contrary to the strong maximum principle for its harmonic equation. Hence there is only one positive component. If $lambda > 1$ anywhere in that component, its limit $1$ at infinity and its zero value on the original frontier force a maximum at a positive interior point of a compact original truncation. The strong maximum principle excludes this. Thus $lambda lt.eq 1$; the boundary collar prevents constancy, so $0 < lambda < 1$. This argument uses no regularity of a possible interior frontier. The positive collar of every $S_i$ belongs to $cal(C)$.
  #strong[Step 2: Distance to an interior zero frontier.] An interior zero of $W$ is infinitely far away for $h$. Indeed, on a relatively compact neighborhood of such a zero we have $u \, \| X \| > 0$. Put $e = X \/ \| X \|$ and denote its orthogonal complement by $T$. The exact flux identity Equation (5.20), with $F_s = d A_s = 0$, gives a uniform bound for $d_T log W$ on its positive part. Smooth nonnegativity gives $\| d W \|_g^2 lt.eq C W$. Since $h^(- 1) = g^(- 1) - u^(- 2) X ⊗ X$, it follows that
  #[#set math.equation(numbering: n => "(5.21)")
   $ \| d log W \|_(h^(- 1))^2 = \| d_T log W \|_g^2 + frac(\( e W \)^2, u^2 W) lt.eq C . $ <eq:static:length-log>]
  The integral of $\| d log W \|$ along a finite $h$-length curve is bounded; such a curve cannot have $W arrow.r 0$ at an interior point. Also $h gt.eq g$. Every finite-length escape curve has a limit in the original complete metric space, with $S$ included. An interior positive limit is not an escape; an interior zero is excluded by Equation (5.21). We next describe precisely the remaining limits on $S$.
  #strong[Step 3: Attachment at the original boundary.] Work on a fixed component $S_i$. In the positive boundary-lapse case, Equation (5.15) allows original coordinates $\( W \, y \)$ in the collar. Put $alpha = X^flat$. Its smooth coefficients satisfy
  $ alpha = b \( W \, y \) d W + W beta_A \( W \, y \) d y^A \, #h(2em) b \( 0 \, y \) = frac(1, 2 kappa_i) . $
  Indeed its tangential coefficients vanish at $W = 0$, and the normal coefficient follows from $d W = 2 kappa_i alpha$ there. In coordinates $\( lambda \, y \)$, $W = lambda^2$, the metric is
  $ h =  & \( 4 lambda^2 g_(W W) + 4 b^2 \) d lambda^2 + 2 \( 2 lambda g_(W A) + 2 b lambda beta_A \) d lambda thin d y^A\
 & + \( g_(A B) + lambda^2 beta_A beta_B \) d y^A d y^B . $
  All coefficient functions on the right are evaluated at $\( lambda^2 \, y \)$. Its normal coefficient at zero is $kappa_i^(- 2)$, its cross coefficients vanish, and its tangential part is $g \|_(T S_i)$. The $d lambda^2$ and tangential coefficients are even smooth functions, and the cross coefficients are odd smooth functions. This is a smooth reflected tensor, not merely continuity of its components.
  In the zero boundary-lapse case, Equation (5.16) instead gives directly
  $ h = g + s^2 frac(Y_(*)^flat ⊗ Y_(*)^flat, a^2 - s^2 \| Y_(*) \|^2) \, #h(2em) lambda = s sqrt(a^2 - s^2 \| Y_(*) \|^2) . $
  These are smooth one-sided, the first is positive definite at $S_i$, and $d lambda = kappa_i thin d s$ there. In both cases the static equation extends to $S$ and gives $"Hess"_h lambda = 0$. Its tangential restriction is $kappa_i$ times the second fundamental form, so that form is zero. In Gaussian base distance $sigma$ the Taylor expansions are therefore
  #[#set math.equation(numbering: n => "(5.22)")
   $ h = d sigma^2 + h_0 \( y \) + sigma^2 h_2 \( y \) + O \( sigma^3 \) \, #h(2em) lambda = kappa_i sigma + a_3 \( y \) sigma^3 + O \( sigma^4 \) . $ <eq:static:polar-jets>]
  Here and below these one-sided remainders have the corresponding differentiated Taylor bounds. The reflected coefficients match through second derivatives; their third derivatives are locally bounded on each side. Thus the even reflection of $h$ and odd reflection of $lambda$ are $C^(2 \, alpha)$ for every $alpha < 1$. Limits of finite-length curves on $S$ are limits in this attached collar, as is seen directly from the coordinates $\( lambda \, y \)$ or $\( s \, y \)$ just constructed.
  The finite-length curve criterion proves completeness of the attached base, and gluing two copies along its compact boundary gives a complete metric double. Finally the original end estimates give
  $ h_(i j) = delta_(i j) + b_i b_j + O_2 \( r^(- q_0) \) \, #h(2em) lambda = 1 + O_2 \( r^(- q_0) \) . $
  A fixed linear change of coordinates takes the constant positive metric $delta + b^flat ⊗ b^flat$ to the Euclidean metric and preserves these decay orders. ◻
]

=== 5.4 Excluding interior null frontiers by the circle extension <excluding-interior-null-frontiers-by-the-circle-extension>

We return to the all-dimensional equality data. The common stationary construction supplies a complete attached static base; it remains to exclude its possible interior null ends. Collapsing a circle at the original horizon gives a complete Ricci-flat manifold whose product end has incompatible volume growth with a splitting caused by any additional end.

#thm([Proposition 5.7.])[
  #emph[One has $W > 0$ throughout $"int" Omega$. The static base metric $h = g + W^(- 1) X^flat ⊗ X^flat$ has a smooth one-sided attachment at $S$, with induced metric $g \|_(T S)$, and 
#[#set math.equation(numbering: n => "(5.23)")
 $ "Hess"_h lambda = lambda "Ric"_h \, #h(2em) Delta_h lambda = 0 \, #h(2em) R_h = 0 \, #h(2em) 0 < lambda < 1 \, quad lambda = sqrt(W) . $ <eq:static:static-equations>]

 At the attached boundary $S$, $\| d lambda \|_h = kappa$ and the boundary is totally geodesic. The even reflection of $h$ and odd reflection of $lambda$ are at least $C^(2 \, alpha)$ for $0 < alpha < 1$.]
] <prop:static:positive>

#proof[
  The original compact-complement and completeness assumptions, Equation (5.7), and Lemma 33 verify every hypothesis of Proposition 34. In particular the geometric density vanishes where $W > 0$, so the stationary metric is vacuum there. That proposition gives the connected positive region $cal(C)$, its complete attached static base, and all the asserted local boundary data. Here the boundary constant is the single number $kappa$ in Equation (5.1). We need only show that no interior null frontier remains.
  #strong[Step 1: A smooth complete Ricci-flat circle manifold.] To rule out missing interior sets, form over $cal(C)$ the product with a circle of period $2 pi \/ kappa$ and metric
  #[#set math.equation(numbering: n => "(5.24)")
   $ frak(h) = h + lambda^2 d T^2 . $ <eq:static:circle>]
  This product is built from the global static metric and lapse; it requires no global primitive of $A_s$ or quotient of the stationary spacetime. Collapse the circle over $S$ by attaching $S times D^2$ in the collar. This attachment has the required regularity. To check it explicitly put $theta = kappa T$ and $\( z_1 \, z_2 \) = \( sigma cos theta \, sigma sin theta \)$. The normal polar part equals
  $ d z_1^2 + d z_2^2 + frac(\( lambda \/ \( kappa sigma \) \)^2 - 1, sigma^2) \( z_1 d z_2 - z_2 d z_1 \)^2 . $
  By Equation (5.22), the extra tensor is a smooth quadratic polynomial to leading order, with remainder whose coefficients and derivatives through order two have size $O \( sigma^(3 - j) \)$. Its second derivatives are Lipschitz away from the axis and extend Hölder continuously with any exponent less than one. The tangential correction is $\( z_1^2 + z_2^2 \) h_2 + O \( sigma^3 \)$ and has the same property. Thus $frak(h)$ is a positive $C^(2 \, alpha)$ metric across the disk center. Its Ricci tensor vanishes off the center by the static equations, and on the center by continuity. Harmonic-coordinate elliptic regularity for the Ricci tensor now makes this metric smooth: harmonic coordinates are $C^(3 \, alpha)$, the Ricci equation has principal part $- 1 / 2 frak(h)^(a b) partial_(a b) frak(h)_(i j)$, and repeated Schauder estimates apply to its quadratic first-derivative terms #cite(label("DeTurckKazdan1981")).
  The circle manifold is complete. Project a finite-length curve to the base, using Equation (5.24); the preceding length test gives a base limit. Over an interior positive base limit the circle metric is uniformly nondegenerate and the fiber is compact. At $S$ the disk coordinates give the limit. These observations also prove metric completeness by joining a summably Cauchy subsequence with paths of summable lengths.
  #strong[Step 2: Excluding an interior frontier.] Suppose an interior frontier of $cal(C)$ remained. A sequence tending to it in the original metric escapes every compact subset of the circle manifold: the continuous map from the circle attachment to the original exterior maps its compact subsets to compact sets avoiding this frontier. Choose a connected product cross-section ${ \| x \| = R } times S^1$ sufficiently far out. Its outer side is the asymptotically Euclidean base times a circle, and is noncompact. A connected two-sided cross-section has at most two complement components: each component must meet one of its two connected collar sides. Thus the inner side is a single component and contains the escaping sequence just constructed. The cross-section therefore separates at least two ends of a complete smooth manifold with nonnegative Ricci curvature. Minimizing segments between escaping sequences in the two sides cross the compact separator and have a subsequence converging to a globally minimizing line. The Cheeger–Gromoll splitting theorem #cite(label("CheegerGromoll1971")) gives an isometric product $bb(R) times N$. If $N$ were noncompact this product would have one end: outside any compact cylinder its two axial sides can be joined through a point of $N$ outside its compact projection. Hence $N$ is compact, and its ball volumes grow at most linearly. On the other hand, in the original product end, $h$ tends after a linear change to the Euclidean metric and $lambda arrow.r 1$. Uniform metric comparison places a coordinate annulus of radius proportional to $L$, times the entire circle, inside a ball of radius $L$ about a fixed point; its volume is at least $c_0 L^n$. This contradicts linear growth. There is no interior frontier. Since $Omega$ is connected, $cal(C) = "int" Omega$. ◻
]

=== 5.5 The static end and its conformal compactification <subsec:static:compactification>

There are now no interior null frontiers, so the static base has a compact core and exactly one end. This is the point at which conformal doubling becomes available. The conformal joining and compactification are the static uniqueness method of Bunting–Masood-ul-Alam #cite(label("BuntingMasoodUlAlam1987")), developed in higher dimensions by Gibbons–Ida–Shiromizu #cite(label("GibbonsIdaShiromizu2002")) Section 2, Equations (2.6)–(2.12). We give the asymptotic calculation and the regularity of the added point explicitly, rather than importing a uniqueness theorem with different global hypotheses.

We now use the complete static base just constructed. In this subsection write $h = h_s$ and set $d = n - 2 = k - 1$. Thus $S$ is compact and connected, $h$ is smooth up to $S$, and

#[#set math.equation(numbering: n => "(5.25)")
 $ "Hess"_h lambda = lambda "Ric"_h \, #h(2em) Delta_h lambda = 0 \, #h(2em) R_h = 0 \, #h(2em) lambda \|_S = 0 \, #h(2em) partial_(nu_h) lambda \|_S = kappa > 0 . $ <eq:static:base-for-double>]

Here $nu_h$ is the $h$-unit normal pointing from $S$ into the static exterior; on large coordinate spheres it denotes the $h$-unit normal toward infinity. We have $0 < lambda < 1$ in the interior, $S$ is totally geodesic, and the complement of the one asymptotically Euclidean end is compact. A fixed linear change of end coordinates makes the limiting metric Euclidean. We may decrease the decay exponent and choose

$ d / 2 < q_0 < min \( q \, d \) \, #h(2em) q_0 eq.not 1 \, #h(2em) h - delta = O_2 \( r^(- q_0) \) \, #h(2em) lambda - 1 = O_2 \( r^(- q_0) \) . $

The required end expansion has two purposes: the retained end must have zero mass, and the other end must become a metric with enough Sobolev regularity at a single added point. We first record the potential estimate that isolates the leading monopole.

#thm([Lemma 5.8.])[
  (The monopole of a decaying Poisson solution).  #emph[Suppose $w$ is smooth outside a ball in $bb(R)^n$, tends to zero there, and $Delta_delta w = O_j \( r^(- n - epsilon.alt) \)$ for every $j gt.eq 0$, where $epsilon.alt > 0$. Suppose initially that $w = O \( r^(- b) \)$ for some $b > 0$. For every $0 < eta < min \( 1 \, epsilon.alt \)$ there is a constant $A$ such that 
$ w = A r^(- d) + O_j \( r^(- d - eta) \) #h(2em) \( j gt.eq 0 \) . $

 The assertion also holds componentwise for a tensor written in these coordinates.]
] <lem:static:poisson-tail>

#proof[
  Extend $chi w$ by zero across a ball, where $chi$ is one far out, and put $f = Delta_delta \( chi w \)$. Then $integral \( 1 + \| z \|^eta \) \| f \( z \) \| thin d z < oo$. For the fundamental solution $Phi \( x \) = - \( d omega \)^(- 1) \| x \|^(- d)$ of $Delta_delta$, the difference $chi w - Phi * f$ is an entire harmonic function tending to zero, and therefore vanishes. In the region $\| z \| < \| x \| \/ 2$, the estimate
  $ \| Phi \( x - z \) - Phi \( x \) \| lt.eq C \| x \|^(- d - eta) \| z \|^eta $
  controls the difference from the monopole. In the remaining region, split off $\| x - z \| < \| x \| \/ 2$. On that ball, the pointwise bound for $f$ gives $C \| x \|^(- d - epsilon.alt)$ after integration against $Phi$; on its complement the finite $eta$-moment gives $C \| x \|^(- d - eta)$. Consequently $A = - \( d omega \)^(- 1) integral f$ and the asserted zeroth-order remainder follows. Interior Poisson estimates on annuli rescaled to unit size give every differentiated remainder. This last step avoids differentiating the singular Newton kernel twice under an absolutely convergent integral. ◻
]

#thm([Proposition 5.9.])[
  (Harmonic asymptotics of the static end).  #emph[There are end coordinates and a number $0 < eta < min \( 1 \, 2 q_0 - d \)$ such that, for every $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.26)")
 $ caron(h) := lambda^(2 \/ d) h = delta + O_j \( r^(- d - eta) \) \, #h(2em) V := log lambda = - a r^(- d) + O_j \( r^(- d - eta) \) \,\
a = frac(kappa "Area"_h \( S \), d omega) > 0 . $ <eq:static:harmonic-end>]

]
] <prop:static:harmonic-end>

#proof[
  The conformal Ricci and Laplace formulas, with conformal exponent $V \/ d$, give
  #[#set math.equation(numbering: n => "(5.27)")
   $ "Ric"_(caron(h)) = k / d thin d V ⊗ d V \, #h(2em) Delta_(caron(h)) V = 0 . $ <eq:static:optical-system>]
  For example $Delta_h V = - \| d V \|_h^2$ and $"Ric"_h = "Hess"_h V + d V ⊗ d V$; substitution cancels both the Hessian and the scalar multiple of $h$ in the conformal Ricci formula.
  Here are details of the choice of harmonic coordinates. Extend the end coefficients to be Euclidean inside a large radius $R$, using a cutoff on $R < r < 2 R$, and solve for $y^i = x^i + psi^i$ satisfying $Delta_(caron(h)) y^i = 0$ on the original tail. The weight for $psi$ is $gamma = 1 - q_0 in \( 2 - n \, 1 \) \\ { 0 }$. The Euclidean Laplacian has a bounded right inverse from weighted $C_(gamma - 2)^(0 \, alpha)$ to weighted $C_gamma^(2 \, alpha)$. To see the bound directly when $gamma < 0$, use its Newton integral; when $gamma > 0$, replace the kernel on $\| z \| > 1$ by $Phi \( x - z \) - Phi \( - z \)$. The latter subtraction makes the outer integral convergent. Splitting the integral into $\| z \| < \| x \| \/ 2$, comparable radii, and $\| z \| > 2 \| x \|$ gives growth $\( 1 + \| x \| \)^gamma$, and rescaled interior estimates give its derivatives and Hölder seminorm. The restrictions on $gamma$ are exactly those used in these integrals. Constants in the positive-weight kernel cause no difficulty; this construction fixes one right inverse.
  In coordinates $x = R z$, the extended coefficients differ from their Euclidean values by $O \( R^(- q_0) \)$ in the corresponding weighted coefficient norms. Hence
  $ psi = T #scale(x: 120%, y: 120%)[\(] - Delta_(caron(h)) x - \( Delta_(caron(h)) - Delta_delta \) psi #scale(x: 120%, y: 120%)[\)] $
  is solved by a Neumann series for large $R$. It gives $psi = O_2 \( r^(1 - q_0) \)$, with the scaled Hölder control, and $D y = I + O \( r^(- q_0) \)$. Thus $y$ is a coordinate system sufficiently far out: local invertibility follows from the last bound, and properness and the estimate $y = x + o \( r \)$ give injectivity and coverage of a smaller tail. The initial $O_2$ coefficient bounds also give scaled $W^(3 \, p)$ bounds for $y$ for every finite $p$ by differentiating its scalar equation once. The metric in $y$ consequently has controlled $W^(2 \, p)$ and $C^(1 \, alpha)$ norms on scaled annuli, for $p > n$.
  In these coordinates the equations have the diagonal principal part
  $ caron(h)^(a b) partial_(a b) caron(h)_(i j) = Q_(i j) \( caron(h)^(- 1) \, D caron(h) \) - frac(2 k, d) thin partial_i V partial_j V \, #h(2em) caron(h)^(a b) partial_(a b) V = 0 \, $
  where $Q$ is quadratic in $D caron(h)$. Scalar interior Schauder estimates, first with the controlled $C^(1 \, alpha)$ coefficients and then after differentiation, give $caron(h) - delta \, V = O_j \( r^(- q_0) \)$ for every $j$. It follows that
  $ Delta_delta \( caron(h)_(i j) - delta_(i j) \) \, quad Delta_delta V = O_j \( r^(- 2 - 2 q_0) \) . $
  Since $2 + 2 q_0 > n$, Lemma 37 gives
  $ caron(h)_(i j) = delta_(i j) + A_(i j) r^(- d) + O_j \( r^(- d - eta) \) \, #h(2em) V = A_0 r^(- d) + O_j \( r^(- d - eta) \) . $
  The harmonic coordinate identity $partial_j \( sqrt(det caron(h)) thin caron(h)^(i j) \) = 0$ has leading term
  $ d (A_(i j) - 1 / 2 "tr" \( A \) delta_(i j)) x^j r^(- n) = 0 . $
  All omitted terms are smaller by a positive power of $r$. Letting $r arrow.r oo$ on each ray shows $A_(i j) - 1 / 2 "tr" \( A \) delta_(i j) = 0$. Its trace is $\( 1 - n \/ 2 \) "tr" \( A \) = 0$, so $A = 0$ because $n gt.eq 3$.
  Write $A_0 = - a$. As $eta < 1 lt.eq d$, exponentiation gives $lambda = 1 - a r^(- d) + O_j \( r^(- d - eta) \)$. Integrating $Delta_h lambda = 0$ between $S$ and a large coordinate sphere, with the inner integration normal $- nu_h$, gives
  $ lim_(r arrow.r oo) integral_(S_r) partial_(nu_h) lambda thin d A_h = kappa "Area"_h \( S \) . $
  The left side is $d omega a$ by the expansion. This proves the coefficient and its strict positivity. ◻
]

We have determined the leading lapse coefficient and removed the metric monopole in the conformal metric $caron(h)$. These two facts supply exactly the cancellation and point regularity needed for the double. Reflect $h$ across $S$ and extend $lambda$ oddly. The reflected pair is $C^(2 \, alpha)$ for every $0 < alpha < 1$. Indeed, in Gaussian distance $sigma gt.eq 0$,

$ h = d sigma^2 + gamma \( sigma \) \, #h(2em) gamma' \( 0 \) = 0 \, #h(2em) lambda = kappa sigma + O \( sigma^3 \) . $

The first identity at $S$ is total geodesicity; the missing quadratic lapse term follows from $"Hess"_h lambda = 0$ there. Even reflection of $gamma$ and odd reflection of $lambda$ therefore have continuous second derivatives and locally Lipschitz second derivatives in these smooth one-sided charts. The static equations and scalar flatness hold across the seam by continuity. On this double define

#[#set math.equation(numbering: n => "(5.28)")
 $ gamma_(*) = (frac(1 + lambda, 2))^(4 \/ d) h . $ <eq:static:doubled-metric>]

On the second copy this is understood as $\( \( 1 - lambda \) \/ 2 \)^(4 \/ d) h$ with the original positive lapse.

#thm([Lemma 5.10.])[
  (The filled double).  #emph[Adding one point at the second end produces a connected complete boundaryless manifold $N$ with a locally uniformly elliptic metric $gamma_(*)$ of class $W_(upright("loc"))^(2 \, s)$, for some $s > n \/ 2$. It is scalar flat in distributions, smooth except possibly at that point and at the $C^(2 \, alpha)$ seam, and has one smooth asymptotically Euclidean end of ADM mass zero.]
] <lem:static:filled-double>

#proof[
  The scalar conformal formula and $Delta_h lambda = 0$ make Equation (5.28) scalar flat away from the added point, including the seam. At the retained end its exact expression relative to $caron(h)$ is
  $ gamma_(*) = (frac(\( 1 + lambda \)^2, 4 lambda))^(2 \/ d) caron(h) = (1 + frac(\( 1 - lambda \)^2, 4 lambda))^(2 \/ d) caron(h) . $
  Proposition 38 therefore gives $gamma_(*) = delta + O_j \( r^(- d - eta) \) + O_j \( r^(- 2 d) \)$. Its ADM flux is zero.
  On the second copy the factor relative to $caron(h)$ is
  $ (frac(1 - lambda, 2))^(4 \/ d) lambda^(- 2 \/ d) = (a / 2)^(4 \/ d) r^(- 4) #scale(x: 120%, y: 120%)[\(] 1 + O_j \( r^(- eta) \) #scale(x: 120%, y: 120%)[\)] . $
  In inverted coordinates $z = x \/ \| x \|^2$, $rho = \| z \|$, the identity $r^(- 4) delta_(i j) thin d x^i d x^j = delta_(i j) thin d z^i d z^j$ gives
  #[#set math.equation(numbering: n => "(5.29)")
   $ \( gamma_(*) \)_(i j) \( z \) = (a / 2)^(4 \/ d) #scale(x: 120%, y: 120%)[\(] delta_(i j) + e_(i j) \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| D^j e \( z \) \| lt.eq C_j rho^(eta - j) quad \( j gt.eq 0 \) . $ <eq:static:inverted-point>]
  The orthogonal reflection in the differential of inversion causes no change in these orders. Define $e \( 0 \) = 0$. Choose
  #[#set math.equation(numbering: n => "(5.30)")
   $ n / 2 < s < frac(n, 2 - eta) < n . $ <eq:static:point-exponents>]
  Then $integral_0^1 rho^(n - 1 + s \( eta - 2 \)) thin d rho < oo$. Thus the metric has two weak derivatives in $L^s$ across the point. For completeness, integrating by parts over $rho > epsilon$ introduces no missing second-derivative measure: the potentially relevant first-derivative boundary term is $O \( epsilon^(n + eta - 2) \) arrow.r 0$; the zeroth-order boundary term also vanishes. Its curvature is consequently the ordinary $L^s$ tensor computed from these weak derivatives. Indeed, with
  $ p = frac(n s, n - s) > n \, #h(2em) p > 2 s \, $
  the first derivatives belong to $L^p$, so their quadratic products belong to $L^(p \/ 2) subset L^s$. Scalar curvature vanishes almost everywhere and therefore distributionally everywhere.
  Equation (5.29) gives a continuous positive definite extension at the added point. The remainder of the compact core has the same property. Every escape from this core along the retained end has infinite length, since its metric is uniformly comparable to the Euclidean metric. This proves completeness of the filled metric. ◻
]

=== 5.6 Rigidity of the zero-mass double <subsec:static:zero-mass>

The metric $gamma_(*)$ is complete and scalar flat, has a single asymptotically Euclidean end of mass zero, and is $W_(upright("loc"))^(2 \, s)$ for $n \/ 2 < s < n$. Its possible nonsmoothness is confined to the joining hypersurface and the filled point. We will show that it is Euclidean. The main step is to vary this metric without leaving the scalar-flat class: nonnegative mass for both signs of a compact variation will force its Ricci tensor to vanish.

The numerical Riemannian Penrose inequality in Theorem 40 is the input. It is supplied by #emph[Conformal flow and the Riemannian Penrose inequality with minimizing frontiers]. We first construct the Laplace inverse needed both to insert a Green-function pole and to correct scalar curvature. Enclosing the pole by a minimizing frontier gives smooth nonnegative mass. We then smooth compact Sobolev defects and correct the scalar curvature, while computing the change in mass. Finally we remove the weak regularity defects of the Ricci-flat double and use volume comparison. Only the numerical inequality is needed from the Riemannian theorem.

Throughout this subsection $n gt.eq 3$, $d = n - 2$, $k = n - 1$, and $omega = \| S^(n - 1) \|$. The Laplacian is $Delta = "div" nabla$, and the ADM mass has factor $1 \/ \( 2 k omega \)$.

#thm([Theorem 5.11.])[
  (Riemannian numerical input #cite(label("CompanionRiemannian")) Theorem 1.1).  #emph[Let $n gt.eq 3$, $d = n - 2$, $k = n - 1$, and $omega = \| S^(n - 1) \|$. Let $\( E \, h \)$ be a connected complete #emph[enclosing-set exterior]: the end-containing closed region outside a filled set, with its compact full frontier $Sigma$ included. For $p \, q in E$, define the possibly extended rectifiable-path distance 
$ d_E \( p \, q \) = inf { "Length"_h \( gamma \) : gamma subset E upright(" is a rectifiable path joining ") p upright(" to ") q } \, #h(2em) inf diameter = + oo . $

 Completeness means that every finite-distance equivalence class ${ q in E : d_E \( p \, q \) < oo }$ is complete for the restricted metric. All points and components of $Sigma$ remain in $E$, and their full perimeter is counted. This convention neither identifies $E$ with the length completion of its open exterior nor asserts finite-length access from the end to every singular frontier point. Assume that the ambient metric $h$ is smooth on $E$ and through $Sigma$, and that the following conditions hold:]
  + #emph[There is one Euclidean coordinate end with compact complement, and $h - delta = O_2 \( r^(- tau) \)$ for some $tau > d \/ 2$.]
  + #emph[The scalar curvature satisfies $R_h gt.eq 0$, $R_h in L^1 \( E \, d V_h \)$, and $R_h = O \( r^(- n - beta) \)$ on the end for some $beta > 0$.]
  + #emph[The full frontier $Sigma$ is outer minimizing and locally perimeter minimizing as the boundary of the filled side. Its regular part is a smooth embedded minimal hypersurface, and its singular set has Hausdorff dimension at most $n - 8$.]
  #emph[Then, with $A$ the reduced-boundary perimeter of $Sigma$, counting every component, 
$ m_(upright("ADM")) \( h \) gt.eq 1 / 2 (A / omega)^(d \/ k) . $

 The assertion includes $A = 0$ and requires neither a spin assumption nor connectedness of $Sigma$.]
] <thm:riemannian-input>

Below we construct a nonempty detached frontier in a smooth scalar-flat metric and verify these hypotheses before applying the inequality.

#thm([Lemma 5.12.])[
  (A compact-source Laplace inverse).  #emph[Let $gamma$ be a complete locally uniformly elliptic $W_(upright("loc"))^(2 \, s)$ metric on a connected boundaryless manifold, where $n \/ 2 < s < n$. Suppose that it has compact complement to one smooth end on which $gamma - delta = O_j \( r^(- d) \)$ for every $j$. Fix a compact set $K$ and $d \/ 2 < b < d$. For every $f in L^s$ supported in $K$ there is a unique weak solution $v in W_(upright("loc"))^(2 \, s)$ of $Delta_gamma v = f$ tending to zero at the end. It satisfies 
#[#set math.equation(numbering: n => "(5.31)")
 $ parallel v parallel_(W^(2 \, s) \( K_1 \)) + sup_(r gt.eq R) r^b sum_(j = 0)^2 r^j parallel D^j v parallel_(L^oo \( { r < \| x \| < 2 r } \)) lt.eq C parallel f parallel_(L^s \( K \)) \, $ <eq:static:inverse-estimate>]

 where $K_1$ contains $K$ and the core. Moreover 
#[#set math.equation(numbering: n => "(5.32)")
 $ v = A_f r^(- d) + O_j \( r^(- d - eta_f) \) \, #h(2em) A_f = - frac(1, d omega) integral_N f thin d V_gamma \, $ <eq:static:source-flux>]

 for every fixed $0 < eta_f < min { 1 \, b }$. The inverse bound is uniform under sufficiently small $W^(2 \, s)$ perturbations supported in a fixed compact set; the end is kept unchanged.]
] <lem:static:compact-source>

#proof[
  We describe the underlying global estimate to fix the solvability class. This manifold has the Euclidean Sobolev inequality
  #[#set math.equation(numbering: n => "(5.33)")
   $ parallel phi parallel_(L^(2 n \/ \( n - 2 \))) lt.eq C parallel d phi parallel_(L^2) \, #h(2em) phi in C_c^oo \( N \) . $ <eq:static:global-sobolev>]
  To verify the compact part of this assertion, on the end write
  $ phi \( r \, theta \) = - integral_r^oo partial_t phi \( t \, theta \) thin d t . $
  Weighted Cauchy–Schwarz gives
  $ \| phi \( r \, theta \) \|^2 lt.eq r^(- d) / d integral_r^oo \| partial_t phi \|^2 t^(n - 1) thin d t . $
  Integration over a fixed end annulus bounds its $L^2$ norm by the global Dirichlet integral. A Poincaré inequality on a connected compact region meeting this annulus gives the same bound on the core. Finite-chart Sobolev inequalities on the core, and the Euclidean Sobolev inequality applied after an end cutoff, now prove Equation (5.33). Uniform metric comparability suffices in this argument.
  Let $cal(D)^(1 \, 2)$ be the completion of $C_c^oo \( N \)$ in the Dirichlet norm. Since a compactly supported $L^s$ function belongs to $L^(2 n \/ \( n + 2 \))$, Equation (5.33) and the Lax–Milgram theorem solve
  $ integral_N chevron.l d v \, d phi chevron.r_gamma thin d V_gamma = - integral_N f phi thin d V_gamma \, #h(2em) v in cal(D)^(1 \, 2) . $
  They also bound $parallel d v parallel_2$ and $parallel v parallel_(2 n \/ \( n - 2 \))$ by $C parallel f parallel_s$. Local Moser iteration for this divergence equation gives a local $L^oo$ bound, because $s > n \/ 2$. The local $W^(2 \, s)$ estimate applies as follows. In coordinates write $Delta_gamma = a^(i j) partial_(i j) + B^j partial_j$. Here $a$ is continuous and uniformly elliptic, and $B in L^p$ with $p = n s \/ \( n - s \) > n$. On small balls, freeze $a$, use the constant-coefficient Calderón–Zygmund estimate, and absorb its oscillation. The drift is absorbed by Hölder and interpolation,
  $ parallel B D v parallel_s lt.eq parallel B parallel_p parallel D v parallel_n \, #h(2em) parallel D v parallel_n lt.eq epsilon parallel D^2 v parallel_s + C_epsilon parallel v parallel_s \, $
  where the strict inequality $p > n$ permits interpolation below the Sobolev exponent for $D v$. These scalar interior estimates can first be applied to smooth metric and source approximations; their uniform energy, Moser, and interior bounds pass to the weak solution. This proves the core part of Equation (5.31); the scalar estimates used here are those of #cite(label("GilbargTrudinger2001")). The compact bound controls the inner boundary of the end. We next turn it into the decay and flux estimates that will determine the conformal mass change.
  For sufficiently large $r$,
  $ Delta_gamma r^(- b) = b \( b - d \) r^(- b - 2) + O \( r^(- b - d - 2) \) < 0 . $
  Compare $v$ and $- v$ with $C r^(- b)$, choosing $C$ from the fixed inner sphere bound. The comparison is legitimate on the unbounded end by testing with $\( plus.minus v - C r^(- b) \)_(+)$: this function has zero inner trace and belongs to $cal(D)^(1 \, 2)$ since $2 b > d$. It follows that $\| v \| lt.eq C r^(- b)$. Rescaled interior estimates for the smooth homogeneous end equation give all derivative bounds there. A decaying homogeneous solution has neither a positive maximum nor a negative minimum by the weak maximum principle, so the inverse is unique in the stated class.
  Finally, $Delta_delta v = O_j \( r^(- n - b) \)$ on the end. Apply Lemma 37 and integrate the weak equation over large coordinate balls to obtain
  $ - d omega A_f = lim_(r arrow.r oo) integral_(S_r) partial_(nu_gamma) v thin d A_gamma = integral_N f thin d V_gamma . $
  There is no interior boundary in this distributional identity. All constants above stay bounded under small compact $W^(2 \, s)$ metric perturbations: their $C^0$ norms and ellipticity, Hölder moduli of $a$, and $L^p$ norms of $B$ are uniformly controlled, and the end is fixed. ◻
]

#thm([Lemma 5.13.])[
  (Smooth nonnegativity from the numerical Penrose theorem).  #emph[Assume the numerical assertion of Theorem 40. Every complete smooth connected boundaryless scalar-flat manifold with compact complement to one end satisfying $gamma - delta = O_j \( r^(- d) \)$ has nonnegative ADM mass.]
] <lem:static:smooth-nonnegative-mass>

#proof[
  Fix a smooth point $p$. A local Dirichlet Green function, cut off inside its coordinate ball, has distributional Laplacian $- d omega delta_p + f_0$, where $f_0$ is smooth and supported away from $p$. Subtract the solution of $Delta_gamma v = f_0$ supplied by Lemma 41. The resulting function $G$ is harmonic off $p$, tends to zero at the end, and has the positive pole $G = r_p^(- d) \( 1 + o \( 1 \) \)$ in geodesic distance from $p$, with the corresponding differentiated leading term. The maximum principle on the punctured manifold gives $G > 0$. Its distributional equation and the same flux calculation as in Equation (5.32) give
  $ Delta_gamma G = - d omega delta_p \, #h(2em) G = r^(- d) + O_j \( r^(- d - eta_G) \) quad upright("at infinity") . $
  For $epsilon > 0$ put $gamma_epsilon = \( 1 + epsilon G \)^(4 \/ d) gamma$ on $N \\ { p }$. This is scalar flat and complete, with the original end and a second complete end at the pole. Near the pole, the length factor is comparable to $r_p^(- 2)$.
  For fixed $epsilon$, sufficiently small spheres about $p$ have strictly negative mean curvature toward the original end. In fact, writing $U = 1 + epsilon G$, the conformal mean-curvature law is
  $ H_(gamma_epsilon) = U^(- 2 \/ d) (H_gamma + frac(2 k, d) partial_(nu_gamma) log U) \, $
  and the expression in parentheses is $k \/ r_p - 2 k \/ r_p + o \( r_p^(- 1) \) < 0$. Choose one such sphere $S_rho$. Truncate the pole end at a smaller sphere $S_(rho_0)$, where $0 < rho_0 < rho$, retaining the closed ambient exterior $M_(rho_0)$. This is a smooth scalar-flat manifold with compact boundary and compact complement to the original Euclidean end. Its ordinary metric completeness follows from its compact smooth core, smooth boundary charts, and complete asymptotically Euclidean tail. This ambient completeness is independent of paths in the singular enclosure to be constructed. We keep $M_(rho_0)$ as an ambient neighborhood on both sides of the minimizing frontier that will be constructed.
  For the enclosure construction itself, let $X_rho$ be the original-end exterior bounded by $B = S_rho$, with $B$ included. Apply the smooth full-enclosure results of #cite(label("CompanionRiemannian")) Lemmas 2.1–2.3 to $\( X_rho \, gamma_epsilon \)$. These results assume a smooth connected manifold complete with its nonempty compact smooth boundary included, one Euclidean coordinate end with compact complement, and $g - delta = O_2 \( r^(- q) \)$ for some $q > 0$. A compact smooth filling $O$ is attached behind $B$, and perimeter is measured in the resulting boundaryless manifold, counting all free-frontier components and any contact with $B$. In our application choose the metric on that auxiliary filling to agree with $gamma_epsilon$ in a collar behind $S_rho$, where the original metric is smooth. Its extension farther inside the filling has no role in the scalar-curvature argument on the exterior.
  The end condition holds because $gamma_epsilon - delta = O_j \( r^(- d) \)$; in particular, large coordinate spheres have mean curvature $k \/ r + O \( r^(- d - 1) \) > 0$. The enclosure lemmas give a compact full-perimeter minimizer with connected end exterior. Since $H_B < 0$ toward $X_rho$, their strict-barrier conclusion puts a fixed exterior collar of $B$ inside the minimizing filled set. Its frontier is therefore detached from $B$, is outer minimizing, and is locally perimeter minimizing in the smooth metric. Its singular set has Hausdorff dimension at most $n - 8$. These statements use only smooth obstacle geometry and full perimeter, independently of original-data variation or equality.
  Consequently this compact frontier is locally perimeter minimizing, outer minimizing, and minimal, with singular set of Hausdorff dimension at most $n - 8$ by minimizing-boundary regularity #cite(label("Simon2018")). Its area is positive, and the smooth metric is defined on a neighborhood of it. Its original-end exterior has nonnegative scalar curvature, integrable scalar curvature (in fact zero), and the decay $d > d \/ 2$ required by Theorem 40. To give its enclosing-set ambient realization, use the already constructed $M_(rho_0)$: its compact boundary is strictly behind the detached frontier and its metric is smooth through that frontier. Let $D$ denote the retained closed enclosing-set exterior, including its entire frontier, and let $d_D$ be the possibly extended path distance defined above, using $gamma_epsilon$. We verify completeness of every finite-distance class of $d_D$.
  Fix such a class $C$ and a $d_D$-Cauchy sequence $\( x_j \)$ in $C$. Choose a subsequence $\( x_(j_ell) \)$ with $d_D \( x_(j_ell) \, x_(j_(ell + 1)) \) < 2^(- ell - 1)$. By the definition of the infimum, these successive points can be joined by rectifiable paths $c_ell subset D$ of length less than $2^(- ell)$. Concatenate the paths. Their total length is finite and their tail lengths tend to zero. Ambient distances between points on a tail are bounded by that tail’s length. Ordinary completeness of $M_(rho_0)$ therefore gives an ambient endpoint $x_oo$, and $x_oo in D$ because $D$ is closed. Appending this endpoint gives a rectifiable path in $D$ with length at most the sum of the constituent lengths. The appended limit lies in the same finite-distance class: the completed concatenation joins it to the fixed chain point $x_(j_1)$ with finite length. Its tails give
  $ d_D \( x_(j_ell) \, x_oo \) lt.eq sum_(r gt.eq ell) "Length"_(gamma_epsilon) \( c_r \) arrow.r 0 . $
  The Cauchy property and the triangle inequality then give $d_D \( x_j \, x_oo \) arrow.r 0$ for the whole sequence. Thus $C$ is complete. No restriction of $D$ to the finite-distance class of its end has been made; all frontier points and components, and their full perimeter, remain included. The argument asserts neither finite-length access to an arbitrary singular frontier point nor an identification with the length completion of the open exterior. Thus the numerical assertion of Theorem 40 implies $m_(upright("ADM")) \( gamma_epsilon \) gt.eq 0$. The old-end expansion of $G$ and the ADM normalization give
  $ m_(upright("ADM")) \( gamma_epsilon \) = m_(upright("ADM")) \( gamma \) + 2 epsilon . $
  Letting $epsilon arrow.b 0$ proves the claim. No property of the discarded pole end other than the displayed barriers is used. ◻
]

#thm([Lemma 5.14.])[
  (Conformal correction and mass at compact Sobolev defects).  #emph[Under the numerical assertion of Theorem 40, let $gamma$ satisfy the hypotheses of Lemma 41 and be scalar flat in distributions. Suppose that it is smooth outside a compact set. Then $m_(upright("ADM")) \( gamma \) gt.eq 0$. For a sufficiently small compact $W^(2 \, s)$ metric perturbation $gamma'$ there is a positive factor $U = 1 + v$, tending to one, such that $U^(4 \/ d) gamma'$ is scalar flat. Its mass is 
#[#set math.equation(numbering: n => "(5.34)")
 $ m_(upright("ADM")) \( U^(4 \/ d) gamma' \) = m_(upright("ADM")) \( gamma' \) - frac(1, 2 k omega) integral_N R_(gamma') U thin d V_(gamma') . $ <eq:static:conformal-mass>]

 The factor, its end monopole, and this mass depend differentiably on a differentiable $W^(2 \, s)$ curve of perturbations supported in a fixed compact set.]
] <lem:static:rough-nonnegative-mass>

#proof[
  Put $c_n = 4 k \/ d$. The conformal equation is
  $ - c_n Delta_(gamma') \( 1 + v \) + R_(gamma') \( 1 + v \) = 0 . $
  Use the inverse $T_gamma$ of Lemma 41 to write it as
  #[#set math.equation(numbering: n => "(5.35)")
   $ v = T_gamma [c_n^(- 1) R_(gamma') \( 1 + v \) - \( Delta_(gamma') - Delta_gamma \) v] . $ <eq:static:conformal-neumann>]
  The perturbation is supported in a fixed compact set $K$ containing the nonsmooth locus. Because $R_gamma = 0$, both terms in brackets are supported in $K$. The source norm is $L^s$ and the solution norm is that in Equation (5.31). These products are bounded in the indicated spaces: a second-order coefficient perturbation is small in $L^oo$, drift perturbations are small in $L^p$, $D v in L^p$, $p \/ 2 > s$, and $v in L^oo$. Also $R_(gamma')$ is small in $L^s$ because $gamma' arrow.r gamma$ in $W^(2 \, s)$ and $R_gamma = 0$. Thus Equation (5.35) is solved by a Neumann series, with $parallel v parallel arrow.r 0$ as $gamma' arrow.r gamma$. In particular $U > 0$, the corrected metric is complete, and its scalar curvature vanishes distributionally. The coefficient maps $gamma mapsto gamma^(- 1)$, $gamma mapsto Delta_gamma$, and $gamma mapsto R_gamma$ are differentiable between these spaces: their derivatives contain second derivatives linearly and products of two $L^p$ first derivatives, with $p \/ 2 > s$. Differentiating the convergent operator inverse in Equation (5.35) therefore proves differentiability in the perturbation parameter.
  On the common end $v$ is harmonic for $gamma'$, so it has the monopole expansion of Equation (5.32). The ADM calculation for $U = 1 + A r^(- d) + o_1 \( r^(- d) \)$ gives a mass change $2 A$, or equivalently
  $ m_(upright("ADM")) \( U^(4 \/ d) gamma' \) - m_(upright("ADM")) \( gamma' \) = - frac(2, d omega) lim_(r arrow.r oo) integral_(S_r) partial_(nu_(gamma')) U thin d A_(gamma') . $
  Integrating $Delta_(gamma') U = c_n^(- 1) R_(gamma') U$ proves Equation (5.34). The flux integral is finite, and its compact-source expression also proves its differentiability.
  To prove nonnegativity for the original rough metric, smooth its coefficients in finitely many charts covering its nonsmooth compact set, with a partition of unity, leaving the end fixed. The resulting smooth positive definite metrics $gamma_j$ converge in $W^(2 \, s)$ on the core and uniformly; their scalar curvatures tend to zero in $L^s$. The preceding construction provides $U_j arrow.r 1$ and smooth complete scalar-flat metrics $U_j^(4 \/ d) gamma_j$. Smoothness of $U_j$ follows from its smooth scalar elliptic equation. The end expansion is $delta + O_ell \( r^(- d) \)$ at every derivative order $ell$, so Lemma 42 applies. Compact smoothing leaves the uncorrected end mass unchanged, and Equation (5.34) gives
  $ 0 lt.eq m_(upright("ADM")) \( U_j^(4 \/ d) gamma_j \) arrow.r m_(upright("ADM")) \( gamma \) . $
  This proves nonnegativity at the asserted regularity as well. ◻
]

We now have nonnegative mass at the precise regularity of the filled double and under its compact conformally corrected perturbations. Applying this statement to both signs of a variation converts its zero mass into Ricci flatness before any smooth rigidity theorem is used.

#thm([Proposition 5.15.])[
  (Euclidean conformal double).  #emph[The filled metric $\( N \, gamma_(*) \)$ of Lemma 39 is isometric to Euclidean $bb(R)^n$.]
] <prop:static:euclidean-double>

#proof[
  #strong[Step 1: Mass variation and weak Ricci flatness.] Let $v_(i j)$ be an arbitrary smooth symmetric tensor compactly supported in a smooth patch of $gamma_(*)$, and put $gamma_t = gamma_(*) + t v$. For both signs of sufficiently small $t$, Lemma 43 constructs a positive factor $U_t$ such that $tilde(gamma)_t = U_t^(4 \/ d) gamma_t$ is scalar flat. The same lemma gives $m_(upright("ADM")) \( tilde(gamma)_t \) gt.eq 0$. Since $U_0 = 1$ and $m_(upright("ADM")) \( gamma_(*) \) = 0$, this differentiable mass has derivative zero at $t = 0$. Equation (5.34) gives precisely
  $ 0 & = - frac(1, 2 k omega) integral_N R'_(gamma_(*)) \[ v \] thin d V_(gamma_(*))\
 & = frac(1, 2 k omega) integral_N chevron.l "Ric"_(gamma_(*)) \, v chevron.r_(gamma_(*)) thin d V_(gamma_(*)) . $
  For the second equality use $R' \[ v \] = "div" "div" v - Delta "tr" v - chevron.l "Ric" \, v chevron.r$; the divergence terms integrate to zero because the test is supported in that smooth patch. Hence $"Ric"_(gamma_(*)) = 0$ on every smooth patch. Its coordinate components belong to $L^s$, as proved in Lemma 39. The seam and the filled point have zero volume, so $"Ric"_(gamma_(*)) = 0$ also as a distribution everywhere.
  #strong[Step 2: Smoothness at the seam and the filled point.] We include the regularity argument before applying a smooth comparison theorem. For a locally uniformly elliptic $W^(2 \, s)$ metric with $n \/ 2 < s < n$, put $p = n s \/ \( n - s \) > n$. It belongs to $W^(1 \, p)$, so local harmonic coordinates exist as $C^1$ diffeomorphisms of class $W^(2 \, p)$ by #cite(label("JulinLiimatainenSalo2017")) Corollary 2.8 with harmonic exponent two. In original coordinates their equation is
  $ a^(i j) partial_(i j) y^ell + B^j partial_j y^ell = 0 \, #h(2em) a in W^(2 \, s) \, quad B in W^(1 \, s) ∩ L^p . $
  We justify the extra derivative without assuming strong regularity of the differentiated coordinates. Define the distributional operator on $W_(upright("loc"))^(1 \, p)$ functions by
  $ L z = partial_i \( a^(i j) partial_j z \) + \( B^j - partial_i a^(i j) \) partial_j z . $
  Its lower-order product belongs to $L^(p \/ 2) subset L^s$ locally; on $W^(2 \, s)$ functions it equals $a^(i j) partial_(i j) z + B^j partial_j z$. For $z = partial_k y^ell in W^(1 \, p)$, differentiating the scalar coordinate equation by weak product rules therefore gives
  $ L z = F \, #h(2em) F = - \( partial_k a^(i j) \) partial_(i j) y^ell - \( partial_k B^j \) partial_j y^ell in L^s . $
  Indeed $D y$ is bounded, $D B in L^s$, and $D a \, D^2 y in L^p$ with $p \/ 2 > s$.
  Choose a small coordinate ball $B_r$ and a cutoff $chi in C_c^oo \( B_r \)$ equal to one on a smaller ball. Then $w = chi z in W_0^(1 \, p) \( B_r \)$ satisfies $L w = H in L^s \( B_r \)$: the additional terms are $2 a^(i j) \( partial_i chi \) \( partial_j z \)$ and $\( a^(i j) partial_(i j) chi + B^j partial_j chi \) z$. Construct $v in W^(2 \, s) \( B_r \) ∩ W_0^(1 \, s) \( B_r \)$ with $L v = H$ by perturbing the constant-coefficient Dirichlet inverse with coefficient matrix $a \( x_0 \)$ at the ball center. Its second-derivative estimate and the scaled Sobolev inequality give
  $ parallel B D v parallel_(L^s \( B_r \)) lt.eq C r^(thin 1 - n \/ p) parallel B parallel_(L^p \( B_r \)) parallel D^2 v parallel_(L^s \( B_r \)) \, #h(2em) 1 - n / p = 2 - n / s > 0 . $
  Continuity of $a$ makes the other operator error at most $C parallel a - a \( x_0 \) parallel_oo parallel D^2 v parallel_s$. Both errors are small for sufficiently small $r$, so a Neumann series constructs $v$.
  Sobolev embedding gives $v in W^(1 \, p)$ with zero trace. Thus $q = w - v in W_0^(1 \, p) \( B_r \) subset H_0^1 \( B_r \)$ satisfies
  $ partial_i \( a^(i j) partial_j q \) + \( B^j - partial_i a^(i j) \) partial_j q = 0 . $
  Testing with $q$, using ellipticity with constant $lambda_0 > 0$ and the Euclidean Sobolev inequality, gives
  $ lambda_0 parallel D q parallel_2^2 lt.eq C parallel B - "div" a parallel_(L^n \( B_r \)) parallel D q parallel_2^2 . $
  The coefficient norm is arbitrarily small on a small ball because $B \, D a in L^p$ and $p > n$. Hence $q = 0$. On the smaller ball $z = v in W^(2 \, s)$, proving $y in W_(upright("loc"))^(3 \, s)$.
  The inverse coordinates have the same regularity: their third derivatives contain $D^3 y in L^s$ and quadratic $D^2 y$ terms in $L^(p \/ 2) subset L^s$. The metric transformation formula likewise has highest terms $D^2 gamma_(*)$, $D^3 \( y^(- 1) \)$, and products of two $L^p$ factors. Consequently the harmonic-coordinate metric remains $W^(2 \, s)$. To justify tensoriality, approximate the metric in $W^(2 \, s)$ and the coordinate map in $W^(3 \, s)$. The latter convergence is also $C^1$, so the maps and their inverses remain diffeomorphisms on smaller common charts. Their transformed metrics converge in $W^(2 \, s)$; the same product bounds imply convergence of their Ricci tensors in $L^s$. The smooth Ricci transformation law therefore passes to the limit. Composition of the $L^s$ tensors causes no additional difficulty: approximate the limiting tensor by a smooth tensor and use the uniformly bounded Jacobians of the coordinate maps.
  The harmonic-coordinate Ricci identity #cite(label("DeTurckKazdan1981")) Equation (4.3) now gives the weak system
  $ \( gamma_(*) \)^(a b) partial_(a b) \( gamma_(*) \)_(i j) = Q_(i j) \( gamma_(*)^(- 1) \, D gamma_(*) \) \, $
  whose right side belongs to $L^(s_1)$, where $s_1 = n s \/ \( 2 \( n - s \) \) > s$. The principal coefficients are continuous and uniformly elliptic. To obtain the higher regularity without assuming it in advance, localize a component with a cutoff in a small harmonic-coordinate ball. Its equation has right side in $L^(s_1)$: besides the quadratic term, the cutoff terms contain only the metric and its first derivatives. Solve that Dirichlet equation in $W^(2 \, s_1)$ by the constant-coefficient inverse and the small oscillation of the principal coefficients. The difference from the original localized component lies in $H_0^1$ and solves the homogeneous equation. Writing the equation in divergence form introduces the drift $- partial_i \( gamma_(*) \)^(i j) in L^p$; its $L^n$ norm is small on this ball. The energy uniqueness argument just used for the coordinate derivatives forces the difference to vanish. Hence each metric component belongs to $W^(2 \, s_1)$ on a smaller ball. Repeating strictly improves the exponent until it exceeds $n$ in finitely many steps. Indeed while $s_j < n$ the reciprocal recurrence is $n \/ s_(j + 1) = 2 n \/ s_j - 2$, starting below two. If an exponent equals $n$, the embedding into $W^(1 \, p')$ for every finite $p'$ supplies the next improvement above $n$. Thus the metric becomes $C^(1 \, alpha)$; the displayed system and successive Schauder estimates make it smooth. The harmonic transition maps are then smooth by their scalar harmonic equations. This establishes a smooth complete Ricci-flat Riemannian structure on the same metric space, including the filled point and the seam.
  #strong[Step 3: Euclidean volume rigidity.] The one asymptotically Euclidean end gives asymptotic volume ratio one. More explicitly, outside each sufficiently large fixed core the metric lies between $\( 1 - epsilon.alt \) delta$ and $\( 1 + epsilon.alt \) delta$, while the core contributes only a fixed additive distance and finite volume. Squeezing geodesic balls between the corresponding coordinate balls and then sending $epsilon.alt arrow.b 0$ gives
  $ lim_(R arrow.r oo) frac("Vol"_(gamma_(*)) \( B_(gamma_(*)) \( o \, R \) \), \( omega \/ n \) R^n) = 1 . $
  For a complete smooth manifold with nonnegative Ricci curvature, Bishop–Gromov comparison makes this ratio nonincreasing; its small-radius limit is also one. The classical equality case of Bishop–Gromov comparison gives a global Euclidean isometry; this volume-rigidity statement is recalled in #cite(label("CavallettiManini")) p. 3237, before Theorem 1.1. ◻
]

=== 5.7 Recovering the round horizon and the original slice <recovering-the-round-horizon-and-the-original-slice>

The double has now been identified with Euclidean space. We finish by locating its seam, solving an exterior harmonic Dirichlet problem, and recovering the time coordinate of the original slice. The final boundary check is made in regular spacetime coordinates, because the static time itself diverges on a future-horizon section.

We now finish the proof of Theorem 30. The preceding conformal-double argument identifies the complete compactified double with Euclidean space. On the retained side its metric is

#[#set math.equation(numbering: n => "(5.36)")
 $ delta = (frac(1 + lambda, 2))^(4 \/ \( n - 2 \)) h . $ <eq:static:euclidean-side>]

The seam is a compact connected embedded hypersurface. Because it was totally geodesic for $h$, the conformal second-form formula makes it totally umbilic for $delta$. Its principal curvature with the Euclidean unit normal $nu_delta$ toward the retained side is the positive constant $2^(2 \/ \( n - 2 \)) thin 2 kappa \/ \( n - 2 \)$. For completeness, a Euclidean umbilic hypersurface of dimension $k gt.eq 2$ is a sphere or a plane: Codazzi applied to $upright("II") = \( H \/ k \) delta \|_(T S)$ forces $d H = 0$; if its common principal curvature is $a eq.not 0$, the ambient derivative of $p - a^(- 1) nu_delta$ along every tangent vector is zero. It lies on the sphere with that center. The inclusion into that sphere is a local diffeomorphism with closed and open image, and embeddedness gives the entire sphere. The zero-curvature case would be an open subset of an affine plane and cannot be compact. Thus, after translation, the seam is ${ \| y \| = R_0 }$, and the retained side is ${ \| y \| gt.eq R_0 }$ because it contains the unbounded end.

Let $rho = \| y \|$ and $Psi = 2 \/ \( 1 + lambda \)$. Equation (5.36) and $R_h = 0$ give $Delta_delta Psi = 0$. The boundary values are $Psi = 2$ on $rho = R_0$ and $Psi arrow.r 1$ at infinity. Comparison on bounded annuli followed by the limit at infinity proves uniqueness of this exterior Dirichlet problem. Hence

#[#set math.equation(numbering: n => "(5.37)")
 $ Psi = 1 + \( R_0 \/ rho \)^(n - 2) \, #h(2em) h = #scale(x: 120%, y: 120%)[\(] 1 + \( R_0 \/ rho \)^(n - 2) #scale(x: 120%, y: 120%)[\)]^(4 \/ \( n - 2 \)) delta \, #h(2em) lambda = frac(1 - \( R_0 \/ rho \)^(n - 2), 1 + \( R_0 \/ rho \)^(n - 2)) . $ <eq:static:isotropic-pair>]

The areal radius is $r = rho \( 1 + \( R_0 \/ rho \)^(n - 2) \)^(2 \/ \( n - 2 \))$. Substitution into Equation (5.37) gives

$ h = \( 1 - 2 M \/ r^(n - 2) \)^(- 1) d r^2 + r^2 sigma_k \, #h(2em) lambda^2 = 1 - 2 M \/ r^(n - 2) \, #h(2em) M = 2 R_0^(n - 2) . $

At the seam $r = 2^(2 \/ \( n - 2 \)) R_0$ and its $h$-area equals its original $g$-area. Thus $A = omega \( 2 M \)^(k \/ \( k - 1 \))$, and Equation (5.1) forces $M = m$. This proves the identification of the static pair without assuming topology or a vacuum development beforehand.

The identified base is the exterior of a ball in $bb(R)^n$. For $n gt.eq 3$ it is simply connected. The closed one-form $A_s = X^flat \/ W$ therefore has a global smooth primitive $Phi$ on the open exterior. Define the original slice by

#[#set math.equation(numbering: n => "(5.38)")
 $ iota \( p \) = #scale(x: 120%, y: 120%)[\(] t = - Phi \( p \) \, #h(0.27778em) r \( p \) \, #h(0.27778em) theta.alt \( p \) #scale(x: 120%, y: 120%)[\)] . $ <eq:static:graph-embedding>]

It is an injective graph over the entire static base. Its induced metric is $h - W d Phi^2 = h - W A_s^2 = g$. Moreover, the coordinate change $t = z - Phi$ transforms Equation (5.8) to the Schwarzschild–Tangherlini metric and takes the original slice $z = 0$ to Equation (5.38). It carries its future normal to the future normal of this graph. Consequently its second form is exactly $- "sym" nabla X \/ u = K$.

At infinity the base metric is uniformly comparable to the original end metric, and its Euclidean coordinates are obtained by a fixed invertible linear map and a sublinear correction. Thus $r arrow.r oo$ at the original end. The graph stays uniformly spacelike there: $u arrow.r b^0 < oo$ and $W arrow.r 1$, while

$ W \| d Phi \|_h^2 = frac(\| X \|_g^2, u^2) = 1 - W / u^2 . $

Consequently $\| d Phi \|_h$ is bounded by a constant strictly less than one sufficiently far out. Integrating along base radial curves gives $\| t \| lt.eq c_1 r + C$ for some $c_1 < 1$. Thus this end approaches the specified spatial infinity, with an arbitrary admissible asymptotic boost permitted.

We verify smoothness at the original boundary; the two lapse cases require different coordinates. First, the static-base isometry and its angular variables extend smoothly to the one-sided attachment. Away from the filled point the doubled metric is $C^(2 \, alpha)$, so its harmonic charts, and hence its Euclidean isometry, are $C^(3 \, alpha)$ in the collar coordinates. On either closed side the metric coefficients are smooth. The isometry equation for its Cartesian components $Y^a$ reads $partial_i partial_j Y^a = Gamma_(i j)^ell partial_ell Y^a$; differentiating this identity bootstraps the one-sided extension to every order. Normal geodesics for the static base metric $h$ from the seam then show that its angular coordinates are the smooth boundary footpoint map. In the positive boundary-lapse case the reflection in $lambda$ is an isometry of $h$ fixing the seam. The angular footpoint map is invariant under this reflection, hence is a smooth even function of $lambda$. Taylor’s formula for an even smooth function shows it is smooth as a function of $W = lambda^2$ up to $W = 0$. Therefore the angular variables are smooth in the original $\( W \, y \)$ coordinates. The areal radius is also a smooth function of $W$ near zero, since $W = 1 - 2 m \/ r^(n - 2)$ has nonzero derivative at $r = r_h$.

Suppose $u > 0$ at $S$. The expression for $alpha$ in the proof of Proposition 34 gives

#[#set math.equation(numbering: n => "(5.39)")
 $ A_s = frac(1, 2 kappa) thin d log W + gamma \, #h(2em) gamma upright(" smooth up to the original ") S . $ <eq:static:log-primitive>]

Indeed $\( b \( W \, y \) - b \( 0 \, y \) \) \/ W$ is smooth, and $b \( 0 \, y \) = 1 \/ \( 2 kappa \)$ is constant. The remainder $gamma$ is closed. Thus $Phi - \( 2 kappa \)^(- 1) log W$ extends smoothly locally, and these local extensions agree with the given global primitive up to constants, so give a global smooth extension on a collar. For the tortoise coordinate $d r_(*) \/ d r = W^(- 1)$,

#[#set math.equation(numbering: n => "(5.40)")
 $ r_(*) = \( 2 kappa \)^(- 1) log W + gamma_0 \( W \) \, #h(2em) gamma_0 upright(" smooth near ") 0 . $ <eq:static:tortoise>]

Here $W' \( r_h \) = \( n - 2 \) \/ r_h = 2 kappa$; subtracting the displayed simple pole from $d r_(*) \/ d W$ leaves a smooth coefficient. The ingoing null coordinate

$ v = t + r_(*) = - Phi + r_(*) $

therefore extends smoothly to $S$. In $\( v \, r \, theta.alt \)$ the spacetime metric is $- W d v^2 + 2 d v thin d r + r^2 sigma_k$, smooth at $r_h$. The boundary has finite ingoing time and $t arrow.r + oo$ as $W arrow.b 0$; it is a section of the future horizon.

Suppose instead $u = 0$ on $S$. Equation (5.12) shows that $A_s$ itself extends smoothly in the original collar, and $lambda$ is a smooth defining function there. Consequently $Phi$ is smooth up to the boundary. Equations (5.40) and $W = lambda^2$ imply $e^(kappa r_(*)) = lambda e^(kappa gamma_0 \( lambda^2 \))$. The Kruskal coordinates

#[#set math.equation(numbering: n => "(5.41)")
 $ U = - e^(- kappa \( t - r_(*) \)) = - lambda e^(kappa Phi + kappa gamma_0 \( lambda^2 \)) \, #h(2em) V = e^(kappa \( t + r_(*) \)) = lambda e^(- kappa Phi + kappa gamma_0 \( lambda^2 \)) $ <eq:static:kruskal>]

are smooth original functions and vanish together on $S$. Their spacetime metric coefficient is a nonzero smooth function of $U V$, by the simple zero of $W$ at $r_h$. Thus this is a smooth extension to the bifurcation sphere, with $U < 0 < V$ on the exterior side. These signs agree with the time orientation chosen in Equation (5.8).

In either case the extended pullback metric equals $g$ by continuity from the interior. It is positive definite, so the extended map is a spacelike immersion at every boundary point. Its future unit normal is smooth in these regular spacetime coordinates, and its second form extends as $K$ by the same continuity. The angular map on $S$ is a diffeomorphism onto the full horizon sphere. Distinct interior points were already separated by their base coordinates; boundary points are separated by their angles, and no interior point has radius $r_h$. Finally the original compact-core property and escape of the end make this injective immersion proper. It is therefore a global smooth embedding with boundary, which completes the proof of Theorem 30.

== 6 Schwarzschild slices: original charges and sharpness <q:converse:sec>

We now prove the converse in the strong-decay class. Start with a spacelike hypersurface in a Schwarzschild–Tangherlini exterior of mass $M > 0$. The geometry of its horizon determines the area, but the mass in the Penrose inequality is computed in the hypersurface’s own asymptotic coordinates. We must therefore identify its original ADM charges, including when the slice is asymptotically boosted.

The proof has three steps. The induced-data decay forces a single spacelike plane at infinity. We compute that plane’s fluxes and show that changing its height and its spatial coordinates contributes zero in the limit. Finally, the horizon area gives equality whenever the hypersurface has the full-cut minimality required in the rigidity class. Radial compactly supported changes of the static slice will then supply non-time-symmetric examples and verify all those cut and outermostness hypotheses directly.

Throughout this section $n gt.eq 3$, $k = n - 1$, $p = n - 2 = k - 1$, $omega = \| S^(n - 1) \|$, and $r_h = \( 2 M \)^(1 \/ p)$. We use $frak(r)$ for the areal radius and $s = \| y \|$ for the isotropic radius. In static isotropic coordinates $\( b \, y \)$ the spacetime metric is

#[#set math.equation(numbering: n => "(6.1)")
 $ upright(bold(G)) = - alpha \( s \)^2 thin d b^2 + h_0 \, #h(2em) h_0 = (1 + frac(M, 2 s^p))^(4 \/ p) delta \, #h(2em) alpha \( s \) = frac(1 - M \/ \( 2 s^p \), 1 + M \/ \( 2 s^p \)) . $ <q:converse:eq:static-isotropic>]

We retain the future-normal convention $K \( U \, V \) = upright(bold(G)) \( bold(nabla)_U upright(bold(n)) \, V \)$, and the energy and momentum factors $1 \/ \( 2 k omega \)$ and $1 \/ \( k omega \)$, respectively. The static Killing field $xi = partial_b$ is future timelike in the open exterior. The isotropic spatial coordinates extend continuously to its horizon by the angular coordinates and the limiting isotropic radius.

We use the compact-complement convention of Definition 1: outside a compact subset of $Omega$, there is just the given coordinate end ${ \| x \| > R_0 }$. For an embedding of this end, “approaches spatial infinity” means

#[#set math.equation(numbering: n => "(6.2)")
 $ \| x_j \| arrow.r oo quad arrow.r.double quad \| y \( x_j \) \| arrow.r oo quad upright("for every sequence in the end.") $ <q:converse:eq:spatial-infinity>]

This is the proper escape condition used below. An assertion about the existence of a single escaping sequence would not suffice.

=== 6.1 The asymptotic plane is forced by the induced data <the-asymptotic-plane-is-forced-by-the-induced-data>

#thm([Lemma 6.1.])[
  (An arbitrary admissible slice has a plane at infinity).  #emph[Let a smooth spacelike embedding of $Omega$ have its interior in the open exterior and extend smoothly to its compact boundary in the regular horizon extension. Suppose its induced data obey 
$ g_(i j) - delta_(i j) = O_6 \( r^(- q) \) \, #h(2em) K_(i j) = O_5 \( r^(- 1 - q) \) \, #h(2em) p / 2 < q < p \, #h(2em) r = \| x \| \, $

 with the future-normal convention stated above. Assume the compact-complement condition and Equation (6.2). For every $q_0$ with $p \/ 2 < q_0 < q$, the static Killing field decomposes as 
#[#set math.equation(numbering: n => "(6.3)")
 $ xi = u upright(bold(n)) + X \, #h(2em) \( u \, X \) = \( u_oo \, X_oo \) + O_2 \( r^(- q_0) \) \, #h(2em) u_oo > 0 \, #h(2em) u_oo^2 - \| X_oo \|^2 = 1 . $ <q:converse:eq:kid-limit>]

 After a constant time-orientation-preserving Lorentz change of ambient coordinates, the embedded end is a single graph $T = f \( z \)$ over a full distant spatial coordinate tail. After a constant orthogonal change of the $x$ coordinates, its coordinate change and height obey 
#[#set math.equation(numbering: n => "(6.4)")
 $ z \( x \) & = x + psi \( x \) \, & quad psi = o \( r \) \, & quad D psi = O_1 \( r^(- q_0) \) \,\
f \( z \) & = o \( \| z \| \) \, & D f & = O_1 \( \| z \|^(- q_0) \) . $ <q:converse:eq:graph-estimates>]

]
] <q:converse:lem:plane>

#proof[
  We first derive estimates in the original $x$ coordinates, without using the ambient spatial projection as a global coordinate system. Since $xi$ and $upright(bold(n))$ are future timelike,
  $ u = - upright(bold(G)) \( xi \, upright(bold(n)) \) > 0 \, #h(2em) W := u^2 - \| X \|_g^2 = alpha \( s \)^2 > 0 . $
  Killing translation preserves the induced metric and second form. Its tangential and normal parts therefore give the vacuum Killing initial-data equations
  #[#set math.equation(numbering: n => "(6.5)")
   $ nabla_i X_j + nabla_j X_i & = - 2 u K_(i j) \,\
nabla_i nabla_j u & = u #scale(x: 120%, y: 120%)[\(] "Ric"_(i j) + tau K_(i j) - 2 K_i zws^ell K_(ell j) #scale(x: 120%, y: 120%)[\)] - \( cal(L)_X K \)_(i j) . $ <q:converse:eq:kid-first>]
  The sign of the first equation follows directly by restricting $cal(L)_xi upright(bold(G)) = 0$ to two tangential vectors and using $K \( U \, V \) = upright(bold(G)) \( bold(nabla)_U upright(bold(n)) \, V \)$. For the second equation, the normal variation of $K$ with speed $u$ in vacuum is $nabla^2 u - u \( "Ric" + tau K - 2 K^2 \)$ with this sign convention; adding the tangential variation $cal(L)_X K$ gives zero. In particular, no stationary development has to be constructed in this argument: the ambient vacuum metric is already given.
  To see the precise differential estimate supplied by these equations, expand
  $ \( cal(L)_X K \)_(i j) = X^ell nabla_ell K_(i j) + K_(ell j) nabla_i X^ell + K_(i ell) nabla_j X^ell . $
  Differentiating Equation (6.5), adding the two permutations with first derivative indices $i \, j$, and subtracting the third permutation expresses $nabla_i nabla_j X_ell$ as curvature times $X$ and the three derivatives $- nabla_i \( u K_(j ell) \) - nabla_j \( u K_(i ell) \) + nabla_ell \( u K_(i j) \)$. Commuting covariant derivatives accounts for the curvature terms. Thus both Hessians involve only first derivatives of $u \, X$, with coefficients $K$, and their values, with coefficients among $"Ric"$, the full curvature, $nabla K$, and $K^2$. Passing to coordinate derivatives adds coefficients $Gamma \( g \)$ to first derivatives and $D Gamma \( g \) + Gamma \( g \)^2$ to values. The assumed decay consequently gives, for $Y = \( u \, X \)$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| D^2 Y \| lt.eq C r^(- 1 - q) \| D Y \| + C r^(- 2 - q) \| Y \| . $ <q:converse:eq:jet-bound>]
  Applying Lemma 32 to Equation (6.6) gives
  $ \( u \, X \) = \( u_oo \, X_oo \) + O_2 \( r^(- q_0) \) . $
  Its hypothesis $q > 1 \/ 2$ includes the slow decay permitted when $n = 3$. Equation (6.2) gives $W arrow.r 1$, so taking limits in $W = u^2 - \| X \|_g^2$ proves Equation (6.3).
  We next justify the global coordinate assertion on a tail. The spatial projection $pi$ of the slice to $y$ is a local diffeomorphism: a nonzero vector in its differential kernel would be vertical and therefore timelike, whereas every nonzero tangent vector of the slice is spacelike. Choose a target radius $s_0$ so large that the compact complement of the original coordinate tail, including its inner coordinate sphere, projects inside ${ \| y \| < s_0 }$. The map
  $ pi : pi^(- 1) \( { \| y \| > s_0 } \) arrow.r { \| y \| > s_0 } $
  is proper. Indeed, the preimage of a compact target set cannot escape through the intrinsic end by Equation (6.2), and cannot approach the excluded compact core by the choice of $s_0$. Its image is open by the local inverse theorem and closed by properness. It is nonempty and the target is connected, so the image is the whole tail. A proper local diffeomorphism is a covering: its fiber over a point is compact and discrete, hence finite; finitely many local inverse neighborhoods can be shrunk simultaneously, and properness excludes any additional preimages over that neighborhood.
  Each component of this covering is one sheet, since $bb(R)^n \\ overline(B)_(s_0)$ is simply connected for $n gt.eq 3$. There is only one such component. To check this last point, the complement of the preimage tail is compact by the same escape condition. Each sheet is noncompact, and points on it with $\| y \| arrow.r oo$ leave every intrinsic compact set. Two sheets would therefore give two distinct ends after removing that compact complement. This contradicts the stipulated single end. We have proved that $y$ is a global coordinate system on this tail, and that the static time $b$ there is a single-valued function of $y$.
  Let $overline(g) = pi^(*) h_0$. Restricting $xi^flat$ to the slice gives $X_g^flat = - W thin d b$, whence
  #[#set math.equation(numbering: n => "(6.7)")
   $ d b = - X_g^flat / W \, #h(2em) overline(g) = g + frac(X_g^flat ⊗ X_g^flat, W) . $ <q:converse:eq:base-pullback>]
  By Equation (6.3), $overline(g)$ tends to the positive definite constant matrix $delta + X_oo^flat ⊗ X_oo^flat$, with $O_2 \( r^(- q_0) \)$ error. Since $h_0$ tends to $delta$, the identity $overline(g) = \( D_x y \)^T h_0 \( y \) D_x y$ bounds both $D_x y$ and its inverse. Integrating $D_x y$ along intrinsic radial paths yields $\| y \| lt.eq C r$. Conversely, integrate the inverse derivative along target radial paths starting at a fixed target sphere. Its preimage is compact, giving $r lt.eq C \| y \|$. Thus the two radii are comparable.
  The connection transformation law is now available in genuine coordinate charts:
  #[#set math.equation(numbering: n => "(6.8)")
   $ partial_i partial_j y^a = Gamma \( overline(g) \)_(i j)^ell partial_ell y^a - Gamma \( h_0 \)_(b c)^a \( y \) partial_i y^b partial_j y^c . $ <q:converse:eq:coordinate-connection>]
  Here $Gamma \( overline(g) \) = O_1 \( r^(- 1 - q_0) \)$ and $Gamma \( h_0 \) = O_1 \( s^(- 1 - p) \)$. Because $q_0 < p$, bounded first derivatives and comparable radii give $D_x^2 y = O_1 \( r^(- 1 - q_0) \)$. Radial integration, followed by comparison on coordinate spheres, therefore gives a single invertible constant matrix $B_0$ with
  $ D_x y = B_0 + O_1 \( r^(- q_0) \) . $
  Equation (6.7) similarly gives $d b = beta + O_1 \( r^(- q_0) \)$, where $beta = - X_oo^flat$. Taking limits in the induced metric shows
  #[#set math.equation(numbering: n => "(6.9)")
   $ B_0^T B_0 - beta ⊗ beta = I . $ <q:converse:eq:limiting-plane>]
  Thus the linear map $v mapsto \( beta \( v \) \, B_0 v \)$ is an isometric embedding of Euclidean $bb(R)^n$ as a spacelike Minkowski hyperplane. A time-orientation-preserving Lorentz transformation takes this hyperplane to $T = 0$. In the resulting coordinates $\( T \, z \)$,
  $ D_x T = O_1 \( r^(- q_0) \) \, #h(2em) D_x z = Q + O_1 \( r^(- q_0) \) \, #h(2em) Q^T Q = I . $
  Integration gives $T = o \( r \)$ and $z = Q x + o \( r \)$. Choose a fixed large intrinsic sphere $r = R_1$ beyond which these coordinates are defined and $D_x z$ is invertible, and then choose $Z_0 > max_(r = R_1) \| z \|$. The map
  $ z : { r > R_1 \, med \| z \( x \) \| > Z_0 } arrow.r { \| z \| > Z_0 } $
  is proper by $z = Q x + o \( r \)$ and the exclusion of that inner sphere. The preceding covering argument makes it a single coordinate chart. This use of boosted coordinates is confined to the tail; it requires no extension of the static time to the compact horizon boundary. Rotating $x$ by $Q$ and using the chain rule proves Equation (6.4). ◻
]

=== 6.2 The charges of the limiting plane <the-charges-of-the-limiting-plane>

We have found the asymptotic plane without choosing a preferred foliation of the original hypersurface. Before estimating its remaining height, we compute the plane’s energy and momentum directly. This fixes both the normalization and the sign of the momentum. In the next lemma $x$ denotes Euclidean coordinates on the reference plane; the coordinates on the given slice will return in the following subsection.

#thm([Lemma 6.2.])[
  (Charges of a boosted Schwarzschild–Tangherlini end).  #emph[In the Schwarzschild–Tangherlini spacetime of geometric mass $M > 0$, let $b \, y$ be static time and isotropic spatial coordinates. Make the Lorentz change 
#[#set math.equation(numbering: n => "(6.10)")
 $ b = gamma \( T + v x^1 \) \, #h(2em) y^1 = gamma \( x^1 + v T \) \, #h(2em) y^a = x^a med \( 2 lt.eq a lt.eq n \) \, #h(2em) gamma = \( 1 - v^2 \)^(- 1 \/ 2) \, $ <q:converse:eq:boost-coordinates>]

 where $0 lt.eq v < 1$. The induced data on $T = 0$, oriented by the future normal, have 
#[#set math.equation(numbering: n => "(6.11)")
 $ E = gamma M \, #h(2em) P_1 = gamma M v \, #h(2em) P_a = 0 med \( a > 1 \) . $ <q:converse:eq:boost-charges>]

 The metric and second fundamental form have the homogeneous leading terms computed below, with remainders $O_d \( r^(- 2 p) \)$ and $O_d \( r^(- 2 p - 1) \)$, respectively, for every fixed derivative order $d$.]
] <q:converse:lem:boost>

#proof[
  Expanding Equation (6.1), the leading perturbation of Minkowski space is $2 M \| y \|^(- p) \( d b^2 + p^(- 1) \| d y \|^2 \)$. On $T = 0$ put
  $ rho^2 = gamma^2 \( x^1 \)^2 + sum_(a = 2)^n \( x^a \)^2 \, #h(2em) f = rho^(- p) \, #h(2em) A = gamma^2 \( v^2 + p^(- 1) \) \, quad B = p^(- 1) \, quad C = k p^(- 1) gamma^2 v . $
  The nonzero relevant leading components of the spacetime perturbation $sans(H)$ are $sans(H)_11 = 2 M A f$, $sans(H)_(a a) = 2 M B f$, and $sans(H)_01 = 2 M C f$. Moreover
  $ partial_1 f = - p gamma^2 x^1 rho^(- n) \, #h(2em) partial_a f = - p x^a rho^(- n) \, #h(2em) partial_T f = - p gamma^2 v x^1 rho^(- n) . $
  Thus the energy flux vector $Q_i = partial_j sans(H)_(i j) - partial_i sans(H)_(j j)$ satisfies
  $ Q_1 = - 2 M k B partial_1 f = 2 M k gamma^2 x^1 rho^(- n) \, #h(2em) Q_a = - 2 M \( A + p B \) partial_a f = 2 M p \( A + 1 \) x^a rho^(- n) . $
  Since $p \( A + 1 \) = k gamma^2$, these expressions give the pointwise identity
  #[#set math.equation(numbering: n => "(6.12)")
   $ Q_i = 2 M k gamma^2 x_i rho^(- n) . $ <q:converse:eq:boost-energy-vector>]
  The chosen sign of the second fundamental form gives, to first order,
  $ K_(i j) = 1 / 2 #scale(x: 120%, y: 120%)[\(] partial_T sans(H)_(i j) - partial_i sans(H)_(0 j) - partial_j sans(H)_(0 i) #scale(x: 120%, y: 120%)[\)] . $
  Direct substitution gives
  $ K_11 & = M gamma^4 v \( 2 p + 1 - p v^2 \) x^1 rho^(- n) \, & K_(a a) & = - M gamma^2 v x^1 rho^(- n) \,\
K_(1 a) & = M k gamma^2 v x^a rho^(- n) \, & K_(a b) & = 0 quad \( a eq.not b \) . $
  Their Euclidean trace is $M gamma^4 v \( p + v^2 \) x^1 rho^(- n)$. Consequently, for the leading Euclidean trace reversal $pi_(i j) = K_(i j) - \( "tr"_delta K \) delta_(i j)$,
  #[#set math.equation(numbering: n => "(6.13)")
   $ pi_(1 j) = M k gamma^2 v x_j rho^(- n) \, #h(2em) pi_(a 1) = M k gamma^2 v x^a rho^(- n) \, #h(2em) pi_(a b) = - M k gamma^4 v x^1 rho^(- n) delta_(a b) . $ <q:converse:eq:boost-momentum-tensor>]
  Using the exact normal and the exact metric in the trace reversal changes these formulas by $O_d \( r^(- 2 p - 1) \)$. The energy remainder has first derivatives of this same order. Their sphere integrals are $O \( r^(- p) \)$, and therefore vanish for every $n gt.eq 3$.
  The ellipsoid ${ \| "diag" \( gamma \, 1 \, dots.h \, 1 \) x \| < 1 }$ has volume $omega \/ \( n gamma \)$. Polar integration therefore gives
  #[#set math.equation(numbering: n => "(6.14)")
   $ integral_(S^(n - 1)) \| "diag" \( gamma \, 1 \, dots.h \, 1 \) theta \|^(- n) thin d theta = omega / gamma . $ <q:converse:eq:ellipsoid-integral>]
  Equations (6.12) and (6.13), divided by $2 k omega$ and $k omega$, give $E = M gamma$ and $P_1 = M gamma v$. The integrand of a transverse momentum row is a constant times $x^1 x^a rho^(- n) \/ r$, whose integral vanishes by reflection. ◻
]

The calculation is for each fixed $v < 1$. No estimate uniform as $v$ approaches $1$ is used.

=== 6.3 Height and coordinate changes leave the charges unchanged <height-and-coordinate-changes-leave-the-charges-unchanged>

The asymptotic plane does not by itself settle the charge calculation: the graph Hessian can decay more slowly than the model second form. We now separate its trace-reversed Hessian, whose flux vanishes identically, from the errors whose sphere integrals tend to zero.

#thm([Proposition 6.3.])[
  (ADM charges of an admissible Schwarzschild slice).  #emph[Under the hypotheses of Lemma 45, the ADM limits of the original induced data exist and satisfy 
#[#set math.equation(numbering: n => "(6.15)")
 $ E = M u_oo \, #h(2em) P_i = - M delta_(i j) X_oo^j \, #h(2em) E > 0 \, #h(2em) E^2 - \| P \|^2 = M^2 . $ <q:converse:eq:charges>]

 In particular the invariant mass is $M$. No parity assumption is needed.]
] <q:converse:prop:adm>

#proof[
  Use the coordinates supplied by Lemma 45 and write $R = \| z \|$. A constant Lorentz transformation of Equation (6.1) gives, on every sufficiently small fixed cone $\| T \| < epsilon R$,
  #[#set math.equation(numbering: n => "(6.16)")
   $ upright(bold(G))_(alpha beta) = eta_(alpha beta) + sans(H)_(alpha beta) + O_j \( R^(- 2 p) \) \, #h(2em) sans(H) = 2 M \| y \( T \, z \) \|^(- p) (d b^2 + 1 / p \| d y \|^2) . $ <q:converse:eq:ambient-leading>]
  Here $eta = - d T^2 + \| d z \|^2$ and the differentials on the right are the constant linear Lorentz differentials. The small cone is chosen so that $\| y \( T \, z \) \|$ and $R$ are comparable. All coordinate derivatives of any fixed order have their corresponding decay, and $sans(H)$ is homogeneous of degree $- p$. Define the leading induced plane tensors by
  #[#set math.equation(numbering: n => "(6.17)")
   $ h_(i j) \( z \) = sans(H)_(i j) \( 0 \, z \) \, #h(2em) L_(i j) \( z \) = 1 / 2 (partial_T sans(H)_(i j) - partial_i sans(H)_(0 j) - partial_j sans(H)_(0 i)) \( 0 \, z \) . $ <q:converse:eq:plane-tensors>]
  The exact reference plane has metric $delta + h + O_2 \( R^(- 2 p) \)$ and second form $L + O_1 \( R^(- 2 p - 1) \)$. Its charges were computed in Lemma 46. We will show that precisely the same terms survive in the ADM fluxes of the given hypersurface.
  First consider its graph $T = f \( z \)$ in these coordinates. Its tangent vectors are $e_i = partial_i + f_i partial_T$, so direct restriction of Equation (6.16) gives
  $ g_(i j)^(upright("gr")) = delta_(i j) - f_i f_j + sans(H)_(i j) \( f \, z \) + sans(H)_(0 j) \( f \, z \) f_i + sans(H)_(0 i) \( f \, z \) f_j + sans(H)_00 \( f \, z \) f_i f_j + O_1 \( R^(- 2 p) \) . $
  In particular
  #[#set math.equation(numbering: n => "(6.18)")
   $ g_(i j)^(upright("gr")) = delta_(i j) + h_(i j) + e_(i j)^(upright("gr")) \, #h(2em) \| e^(upright("gr")) \| + R \| D e^(upright("gr")) \| lt.eq C (\| f \| R^(- p - 1) + R^(- 2 q_0) + R^(- p - q_0) + R^(- 2 p)) . $ <q:converse:eq:graph-metric-error>]
  For example, the evaluation difference $sans(H)_(i j) \( f \, z \) - sans(H)_(i j) \( 0 \, z \)$ has size $O \( \| f \| R^(- p - 1) \)$; its derivative also has the term $O \( \| D f \| R^(- p - 1) \)$, included in the displayed bound. Since $f = o \( R \)$ and $2 q_0 > p$, this proves $e^(upright("gr")) = o_1 \( R^(- p) \)$.
  For completeness, the normal formula supplies the needed second-form estimate with its sign. In flat spacetime the future normal covector of the graph is
  $ upright(bold(n))^flat = frac(- d T + d f, sqrt(1 - \| D f \|^2)) \, #h(2em) K_(i j)^(upright("flat")) = f_(i j) / sqrt(1 - \| D f \|^2) . $
  In the perturbed metric, compute instead from $K_(i j) = - upright(bold(G)) \( upright(bold(n)) \, bold(nabla)_(e_i) e_j \)$. The coefficient of $f_(i j)$ changes by $O \( \| D f \|^2 + R^(- p) \)$. The connection term at $T = 0$, with zero slope, is exactly $L$ to first order. Evaluating it at $T = f$ costs $O \( \| f \| R^(- p - 2) \)$, inserting the graph slopes costs $O \( R^(- p - 1) \| D f \| \)$, and quadratic metric corrections cost $O \( R^(- 2 p - 1) \)$. It follows that
  #[#set math.equation(numbering: n => "(6.19)")
   $ K_(i j)^(upright("gr")) & = L_(i j) + f_(i j) + e_(i j)^K \,\
\| e^K \| & lt.eq C (\| f \| R^(- p - 2) + R^(- p - q_0 - 1) + R^(- 3 q_0 - 1) + R^(- 2 p - 1)) = o \( R^(- p - 1) \) . $ <q:converse:eq:graph-second-error>]
  The $R^(- 3 q_0 - 1)$ term is the flat nonlinear error $O \( \| D f \|^2 \| D^2 f \| \)$. Thus even when $f_(i j)$ decays more slowly than the plane second form, its only nonnegligible contribution is an ordinary coordinate Hessian.
  It remains to evaluate fluxes in the original coordinates. Set $z = x + psi \( x \)$ as in Equation (6.4) and $F_0 \( x \) = f \( z \( x \) \)$. Pulling back the Euclidean metric gives the exact expression
  $ \( D_x z \)^T D_x z = I + D psi + \( D psi \)^T + \( D psi \)^T D psi . $
  The last term is $O_1 \( r^(- 2 q_0) \)$. Homogeneity and $psi = o \( r \)$ give
  $ \( z^(*) h \)_(i j) = h_(i j) \( x \) + o_1 \( r^(- p) \) \, #h(2em) \( z^(*) L \)_(i j) = L_(i j) \( x \) + o \( r^(- p - 1) \) . $
  Indeed, evaluation changes contribute $psi thin D h$ and $psi thin D L$; tensor pullback contributes $D psi thin h$ and $D psi thin L$. Differentiating the metric pullback also produces $D^2 psi thin h$, of size $O \( r^(- p - q_0 - 1) \)$. The chain rule gives a useful exact identity for the Hessian:
  #[#set math.equation(numbering: n => "(6.20)")
   $ z^(*) \( D_z^2 f \)_(i j) = partial_i partial_j F_0 - \( partial_a f \) \( z \( x \) \) thin partial_i partial_j psi^a . $ <q:converse:eq:hessian-chain>]
  Its final term is $O \( r^(- 2 q_0 - 1) \) = o \( r^(- p - 1) \)$. Combining Equations (6.18)– (6.20) therefore gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ g_(i j) & = delta_(i j) + h_(i j) \( x \) + partial_i psi_j + partial_j psi_i + e_(i j) \, & e & = o_1 \( r^(- p) \) \,\
K_(i j) & = L_(i j) \( x \) + partial_i partial_j F_0 + tilde(e)_(i j) \, & tilde(e) & = o \( r^(- p - 1) \) . $ <q:converse:eq:original-metric>]
  For the momentum trace reversal, the original metric satisfies $g - delta = O \( r^(- q_0) \)$ and $K = O \( r^(- q_0 - 1) \)$. Consequently
  $ \( "tr"_g K \) g_(i j) - \( "tr"_delta K \) delta_(i j) = O \( r^(- 2 q_0 - 1) \) = o \( r^(- p - 1) \) . $
  Thus
  #[#set math.equation(numbering: n => "(6.22)")
   $ K_(i j) - \( "tr"_g K \) g_(i j) =  & L_(i j) - \( "tr"_delta L \) delta_(i j)\
 & + partial_i partial_j F_0 - \( Delta F_0 \) delta_(i j) + o \( r^(- p - 1) \) . $ <q:converse:eq:momentum-decomposition>]
  Both apparent extra fluxes vanish exactly. The energy flux vector of the symmetric-gradient term in Equation (6.21) is
  $ Q_i \( psi \) = Delta psi_i - partial_i "div" psi \, #h(2em) partial_i Q_i \( psi \) = 0 . $
  Choose a smooth cutoff that is one outside a fixed large sphere and zero on a smaller ball, and use it to extend $psi$ smoothly over $bb(R)^n$. The same formula for the extension is divergence free on the entire ball bounded by every sufficiently large coordinate sphere. The divergence theorem gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ integral_(S_r) Q_i \( psi \) thin nu_delta^i thin d A_delta = 0 . $ <q:converse:eq:gauge-flux>]
  Similarly, each row of the trace-reversed Hessian obeys
  $ partial_j #scale(x: 120%, y: 120%)[\(] partial_i partial_j F_0 - \( Delta F_0 \) delta_(i j) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Smoothly extending $F_0$ by the same procedure proves
  #[#set math.equation(numbering: n => "(6.24)")
   $ integral_(S_r) #scale(x: 120%, y: 120%)[\(] partial_i partial_j F_0 - \( Delta F_0 \) delta_(i j) #scale(x: 120%, y: 120%)[\)] nu_delta^j thin d A_delta = 0 quad upright("for every ") i . $ <q:converse:eq:height-flux>]
  These are identities for the extended potentials; no decay assumption on an interior extension, and no subtraction of an unknown inner boundary flux, is involved.
  Finally, a metric error $o_1 \( r^(- p) \)$ contributes $o \( 1 \)$ to the energy flux because $\| S_r \| = O \( r^(p + 1) \)$. A second-form error $o \( r^(- p - 1) \)$ contributes $o \( 1 \)$ to momentum. More explicitly the largest product errors above have flux size $O \( r^(p - 2 q_0) \)$; the remaining ambient products have size $O \( r^(- q_0) \)$ or $O \( r^(- p) \)$, and the evaluation errors have size $O \( \| f \| \/ r + \| psi \| \/ r \) = o \( 1 \)$. All tend to zero. Equations (6.23) and (6.24) leave precisely the plane fluxes.
  Lemma 46 computes these, with the present second-form convention, as $E = gamma M$, $P_1 = gamma v M$, and $P_a = 0$ for $a > 1$ under
  $ b = gamma \( T + v z^1 \) \, #h(2em) y^1 = gamma \( z^1 + v T \) \, #h(2em) y^a = z^a . $
  On that plane $xi = gamma partial_T - gamma v partial_(z^1)$, so its limiting lapse and shift are $\( gamma \, - gamma v \, 0 \, dots.h \, 0 \)$. Constant spatial rotations give $E = M u_oo$ and $P = - M X_oo$ in the original orthonormal end frame. Equation (6.3) proves the final identity in Equation (6.15). ◻
]

=== 6.4 The horizon area and the converse equality <the-horizon-area-and-the-converse-equality>

#thm([Lemma 6.4.])[
  (Geometry of a full horizon section).  #emph[Every full smooth spacelike section of the future horizon, including the bifurcation sphere, has induced area 
#[#set math.equation(numbering: n => "(6.25)")
 $ A = omega r_h^k = omega \( 2 M \)^(k \/ p) . $ <q:converse:eq:horizon-area>]

 If such a section is the boundary of a smooth spacelike hypersurface whose interior lies in the exterior, its outgoing future expansion is zero with the future-normal convention used here.]
] <q:converse:lem:horizon-area>

#proof[
  In horizon-regular null coordinates, restriction of the spacetime metric to the future horizon is the degenerate tensor $r_h^2 sigma$ pulled back from its spherical space of generators. For example, away from the bifurcation sphere the ingoing form is
  $ upright(bold(G)) = - F \( frak(r) \) thin d v^2 + 2 thin d v thin d frak(r) + frak(r)^2 sigma \, #h(2em) F \( frak(r) \) = 1 - frac(2 M, frak(r)^p) \, $
  and both of its first two terms restrict to zero at $frak(r) = r_h$. Kruskal coordinates give the same restriction at the bifurcation sphere. A tangent vector in the kernel of projection onto the generator sphere would be null, so spacelikeness makes that projection a local diffeomorphism. Fullness makes it bijective, and hence it is a diffeomorphism. Pulling back the displayed degenerate tensor to the section therefore gives a metric isometric to $r_h^2 sigma$, regardless of the location of the section along individual generators. This proves Equation (6.25).
  The null second fundamental form along the future horizon generator vanishes as well: the tensor $r_h^2 sigma$ is constant along each generator. For a spacelike hypersurface ending on the section from the exterior, the future outgoing null normal $upright(bold(n)) + nu$ is a positive multiple of this generator, where $nu$ points into the hypersurface. Scaling the generator multiplies its null second fundamental form by the same positive factor. Its trace is therefore zero. By the chosen convention that trace is $H + "tr"_S K = theta_(+)$. The same argument uses a regular future generator in Kruskal coordinates at the bifurcation sphere, where the Killing field itself vanishes. ◻
]

Proposition 47 and Lemma 48 prove the converse in Theorem 6. Indeed, the assumed full-cut minimality gives $A_min \( S \) = A$, while the original charges give

$ sqrt(E^2 - \| P \|^2) = M = 1 / 2 (A / omega)^(p \/ k) . $

The argument did not impose a preferred original foliation or an asymptotic graph hypothesis. It derived the graph only on the tail needed for the flux calculation; the compact part of the prescribed embedding was arbitrary.

=== 6.5 Static and non-time-symmetric sharp examples <static-and-non-time-symmetric-sharp-examples>

The converse assumes full-cut minimality and outermostness. To show that its class is nonempty, we now construct slices for which these properties can be checked for every enclosure. A closed angular form controls all cut areas, while the outward expansion of round spheres excludes a wholly interior weakly trapped enclosure.

#thm([Proposition 6.5.])[
  (Examples satisfying all full-cut hypotheses).  #emph[For every $n gt.eq 3$ and every $M > 0$, the static exterior slice satisfies all hypotheses of the rigidity subclass and realizes equality. There are also smooth examples with $K equiv.not 0$, obtained by nonconstant radial static-time graphs supported in any prescribed annulus strictly outside the horizon. These examples are vacuum, complete with their boundary included, have the same horizon and asymptotic end as the static slice, and satisfy 
$ "Area"_g \( Gamma \) gt.eq "Area"_g \( S \) quad upright("for every full enclosing cut ") Gamma . $

 They have no smooth compact weakly future-trapped enclosing hypersurface lying wholly in the interior.]
] <q:converse:prop:examples>

#proof[
  Fix $r_h < r_1 < r_2$ and take a smooth function $chi in C_c^oo \( \( r_1 \, r_2 \) \)$ with a nondegenerate interior critical point. Put $b = f \( frak(r) \) = epsilon chi \( frak(r) \)$ and choose $epsilon$ so that
  #[#set math.equation(numbering: n => "(6.26)")
   $ sup_(frak(r) > r_h) \| F \( frak(r) \) f' \( frak(r) \) \| < 1 . $ <q:converse:eq:radial-spacelike>]
  The zero choice gives the static slice. The induced metric of any of these graphs is
  #[#set math.equation(numbering: n => "(6.27)")
   $ g_f = A_f \( frak(r) \) thin d frak(r)^2 + frak(r)^2 sigma \, #h(2em) A_f = F^(- 1) - F \( f' \)^2 = F^(- 1) #scale(x: 120%, y: 120%)[\(] 1 - F^2 \( f' \)^2 #scale(x: 120%, y: 120%)[\)] > 0 . $ <q:converse:eq:radial-metric>]
  Thus the graph is spacelike. Close to the horizon it is exactly the static slice. To check regularity there without relying on the singular areal coordinate, use static proper distance $a gt.eq 0$, for which $d frak(r) \/ d a = sqrt(F)$. At $a = 0$,
  $ frak(r) \( a \) = r_h + frac(F' \( r_h \), 4) a^2 + O \( a^4 \) \, #h(2em) F' \( r_h \) = p / r_h > 0 \, $
  and the metric is $d a^2 + frak(r) \( a \)^2 sigma$. In Kruskal coordinates the static slice and its future normal extend smoothly to the bifurcation sphere. To see this, let the tortoise coordinate $r_(*)$ satisfy $d r_(*) \/ d frak(r) = F^(- 1)$. The two null coordinates on the slice are opposite constant multiples of $e^(kappa r_(*))$, where $kappa = F' \( r_h \) \/ 2$ and $e^(kappa r_(*)) = a$ times a smooth positive even function of $a$. Their derivatives with respect to $a$ are nonzero at $a = 0$. Our perturbation is supported away from this collar, so its embedding and normal have the same regularity. The boundary is connected, $K = 0$ there, and its mean curvature is $k frak(r)' \( 0 \) \/ r_h = 0$.
  The graph is unchanged at infinity as well. Radial length to infinity is infinite, and every bounded radial region is compact with the boundary included; hence $\( Omega \, g_f \)$ is complete as a metric space with that boundary. The induced data have $g_f - delta = O_j \( s^(- p) \)$ for every fixed $j$ in the static isotropic end and $K = 0$ there. They therefore satisfy all the stated finite derivative decay bounds for any $p \/ 2 < q < p$.
  The ambient metric is vacuum in every required dimension. This can also be checked directly from its areal form: the only potentially nonzero Ricci components are multiples of
  $ F'' + k / frak(r) F' \, #h(2em) \( k - 1 \) \( 1 - F \) - frak(r) F' \, $
  and both vanish for $F = 1 - 2 M frak(r)^(- p)$ and $p = k - 1$. Gauss–Codazzi therefore gives $mu = J = 0$ on each graph, so the dominant energy and integrability assumptions hold. Its end charges are $\( E \, P \) = \( M \, 0 \)$ by Lemma 46 with $v = 0$. To verify non-time-symmetry when $epsilon eq.not 0$, take the chosen critical point $frak(r)_(*)$ of $f$. There $f' = 0$ and the future normal is $F^(- 1 \/ 2) partial_b$. The defining second-form formula then gives
  $ K_(frak(r) frak(r)) \( frak(r)_(*) \) = sqrt(F \( frak(r)_(*) \)) thin f'' \( frak(r)_(*) \) eq.not 0 . $
  We prove the required area inequality for every full cut, including disconnected cuts and all portions coinciding with the boundary. Let $pi_sigma : Omega arrow.r S^k$ denote angular projection and set
  $ zeta = r_h^k pi_sigma^(*) \( d A_sigma \) . $
  This is a smooth closed $k$-form on the entire exterior with boundary. Its comass in the metric Equation (6.27), meaning its maximum absolute value on an orthonormal $k$-frame, is $\( r_h \/ frak(r) \)^k lt.eq 1$. Indeed it vanishes on the radial direction and has that value on an oriented orthonormal angular frame.
  Let $Gamma = partial D$ be a full cut as in Definition 2. Choose $R$ beyond its entire boundary and far enough that $D$ contains all $frak(r) gt.eq R$. The intrinsic compact manifold $D_R = D ∩ { frak(r) lt.eq R }$ has boundary exactly $Gamma union.sq { frak(r) = R }$. The second boundary is in the interior of $D$ before truncation, so this operation introduces no corner. Orient $Gamma$ by the normal pointing into $D$, and hence toward its end. Its orientation as a boundary of $D_R$ is the opposite one. Stokes’ theorem gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ integral_Gamma zeta = integral_({ frak(r) = R }) zeta = omega r_h^k . $ <q:converse:eq:full-cut-calibration>]
  The entire intrinsic boundary appears in this formula, even when a part of it lies on $S$. Applying the comass bound to every component and then summing gives
  $ "Area"_(g_f) \( Gamma \) gt.eq lr(|integral_Gamma zeta|) = omega r_h^k = "Area"_(g_f) \( S \) . $
  Since $S$ itself is an admissible full cut, this proves both $A_min \( S \) > 0$ and $A_min \( S \) = "Area"_(g_f) \( S \)$.
  It remains to check the trapping exclusion. Write $d_f = 1 - F^2 \( f' \)^2 > 0$. The future normal of the graph and the normal to an outward round sphere within it are respectively
  $ upright(bold(n)) = F^(- 1 \/ 2) / sqrt(d_f) #scale(x: 120%, y: 120%)[\(] partial_b + F^2 f' partial_(frak(r)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) nu = sqrt(F) / sqrt(d_f) #scale(x: 120%, y: 120%)[\(] partial_(frak(r)) + f' partial_b #scale(x: 120%, y: 120%)[\)] . $
  The round sphere has $H = k nu \( frak(r) \) \/ frak(r)$ and $"tr"_(S_(frak(r))) K = k upright(bold(n)) \( frak(r) \) \/ frak(r)$. Consequently
  #[#set math.equation(numbering: n => "(6.29)")
   $ theta_(+) \( S_(frak(r)) \) = frac(k sqrt(F), frak(r) sqrt(d_f)) \( 1 + F f' \) > 0 #h(2em) \( frak(r) > r_h \) . $ <q:converse:eq:round-expansion>]
  The positivity follows from Equation (6.26); it does not require a smallness estimate for second derivatives of $f$.
  Suppose a smooth compact embedded two-sided enclosing hypersurface $Sigma$ in the interior had $theta_(+) lt.eq 0$ everywhere toward the end. At a maximum of $frak(r)$ on $Sigma$, say $frak(r) = frak(r)_0 > r_h$, it is tangent to the round sphere $S_(frak(r)_0)$ and lies on its inner side. The ray with $frak(r) > frak(r)_0$ reaches infinity without meeting $Sigma$, so the normal toward the end at this point is the positive radial normal, even if $Sigma$ is disconnected. At the contact point, tracing the restriction Hessian identity gives
  $ 0 gt.eq Delta_Sigma frak(r) = "tr"_(T Sigma) "Hess"_g frak(r) - H_Sigma thin nu \( frak(r) \) . $
  For the tangent round sphere the right-hand side is zero with $H_Sigma$ replaced by $H_(S_(frak(r)_0))$. Since $nu \( frak(r) \) > 0$, this implies $H_Sigma gt.eq H_(S_(frak(r)_0))$. The tangent spaces coincide, so their tangential traces of $K$ are equal. Equation (6.29) now gives $theta_(+) \( Sigma \) > 0$ at the contact point, a contradiction. All rigidity-subclass hypotheses have been checked. ◻
]

The examples exist for every $M > 0$, and their common relation is $A = omega \( 2 M \)^(k \/ p)$. Thus the coefficient $1 \/ 2$ is attained in every dimension by both static and non-time-symmetric data. Varying $M$ also fixes the exponent: an inequality $M gt.eq c \( A \/ omega \)^beta$ with a universal $c > 0$ for this entire scaled family requires $beta = p \/ k$, by considering both $M arrow.b 0$ and $M arrow.r oo$.

== 7 Three-dimensional data and the numerical comparison <q3:intro:section>

=== 7.1 Initial data, normals, and enclosing area <initial-data-normals-and-enclosing-area>

We work in three spatial dimensions, with zero cosmological constant and $G = c = 1$. For a Riemannian metric $g$ and a symmetric covariant two-tensor $K$, define the constraint densities by

#[#set math.equation(numbering: n => "(7.1)")
 $ 16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2 \, #h(2em) 8 pi J = "div"_g #scale(x: 120%, y: 120%)[\(] K - \( "tr"_g K \) g #scale(x: 120%, y: 120%)[\)] . $ <q3:intro:constraints>]

Here $J$ is a covector field. The dominant energy condition is

#[#set math.equation(numbering: n => "(7.2)")
 $ mu gt.eq \| J \|_g . $ <q3:intro:dec>]

All initial data considered here are smooth, including at a compact boundary when one is present.

On an asymptotically flat end with Euclidean coordinates $x$ and $r = \| x \|$, our basic assumptions are

#[#set math.equation(numbering: n => "(7.3)")
 $ g_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, #h(2em) K_(i j) = O_1 \( r^(- 1 - q) \) \, #h(2em) q > 1 / 2 . $ <q3:intro:decay>]

The notation $O_j \( r^(- a) \)$ includes the corresponding coordinate derivative bounds through order $j$. We assume that $mu$ and $\| J \|_g$ are integrable and that the following ADM limits exist and are finite:

#[#set math.equation(numbering: n => "(7.4)")
 $ E & = frac(1, 16 pi) lim_(r arrow.r oo) integral_(S_r) \( partial_j g_(i j) - partial_i g_(j j) \) n^i thin upright(d) A_delta \,\
P_i & = frac(1, 8 pi) lim_(r arrow.r oo) integral_(S_r) #scale(x: 120%, y: 120%)[\(] K_(i j) - \( "tr"_g K \) g_(i j) #scale(x: 120%, y: 120%)[\)] n^j thin upright(d) A_delta . $ <q3:intro:energy>]

The normal and area form in these definitions are Euclidean. Whenever $E > \| P \|_delta$, write

#[#set math.equation(numbering: n => "(7.5)")
 $ m = sqrt(E^2 - \| P \|_delta^2) . $ <q3:intro:rest-mass>]

For a two-sided surface $Sigma$ with specified unit normal $nu$, we use

$ H_Sigma = "div"_Sigma nu \, #h(2em) theta_(+) \( Sigma \) = H_Sigma + "tr"_Sigma K . $

Thus Euclidean spheres have positive mean curvature for the normal toward infinity. A future marginally outer trapped surface, abbreviated MOTS, satisfies $theta_(+) = 0$. A weakly future outer trapped surface satisfies $theta_(+) lt.eq 0$. Our spacetime sign convention is

#[#set math.equation(numbering: n => "(7.6)")
 $ K \( Y \, Z \) = upright(bold(g)) \( upright(bold(nabla))_Y n \, Z \) \, $ <q3:intro:k-sign>]

where $n$ is the future unit timelike normal. Equivalently, in Gaussian normal coordinates the spatial metric has normal derivative $2 K$.

#prodef([Definition 7.1.])[
  (Exterior and enclosing area).  An exterior is a connected orientable smooth three-manifold $Omega$ with nonempty compact smooth boundary, complete as a metric space with its boundary included, and with exactly one end, which is asymptotically flat. An enclosing cut is a compact smooth embedded surface in $overline(Omega)$ separating the entire inner boundary from the sufficiently distant part of that end. Equivalently, it bounds the side containing the distant end; the other side is filled up to the inner obstacle. A cut may have several components and may coincide with the inner boundary. Its normal points toward the end. We put
  $ a_g \( partial Omega \) = inf { \| Gamma \|_g : Gamma upright(" is an enclosing cut") } . $
  When using perimeter compactness, we take the closure of this class among filled inner sets and include the area of any frontier coinciding with the obstacle. Smooth outward approximation gives the same infimum. Enclosing cuts and minimizing sets are taken with bounded complementary pockets filled. Auxiliary perimeter arguments may use competitors containing the inner obstacle before filling: filling a bounded pocket deletes its frontier, cannot increase perimeter, and leaves the enclosing infimum unchanged.
] <q3:intro:exterior-class>

The definition permits coincidence because first variations of the minimum need not be realized by a cut lying strictly outside the obstacle. It permits disconnected cuts because neither the minimizing hull nor an intermediate trapped boundary need be connected. The full-perimeter realization and the required compactness will be proved in Lemma 59.

=== 7.2 The numerical result used in the variations <the-numerical-result-used-in-the-variations>

The numerical spacetime Penrose theorem is used on a larger class than the equality theorem: the varied boundary need only be weakly future trapped. Here is its precise three-dimensional input and conclusion. This is Theorem 7.2 of the numerical companion #cite(label("CompanionNumerical")). Its proof uses no rigidity result from the present argument.

#thm([Proposition 7.2.])[
  (Numerical comparison for a weakly trapped exterior).  #emph[Let $\( Omega \, g \, K \)$ be an exterior as in Definition 50. Assume Equations (7.1)–(7.3), integrability of $mu$ and $\| J \|_g$, and the finite ADM limits (7.4)–(7.4). Orient $partial Omega$ by the normal into $Omega$, and suppose $theta_(+) \( partial Omega \) lt.eq 0$. If $E > \| P \|_delta$, then 
#[#set math.equation(numbering: n => "(7.7)")
 $ sqrt(E^2 - \| P \|_delta^2) gt.eq sqrt(frac(a_g \( partial Omega \), 16 pi)) . $ <q3:intro:penrose>]

 No extension of the data across $partial Omega$ is required.]
] <q3:intro:exterior-inequality>

In particular, variations in the proof below need not preserve outermostness, outer area minimization, or the existence of an ambient extension. They preserve precisely the hypotheses of this numerical comparison. For comparison with the convention $2 hat(mu) = R + tau^2 - \| K \|^2$ and $hat(J) = "div" \( K - tau g \)$, the densities satisfy $hat(mu) = 8 pi mu$ and $hat(J) = 8 pi J$. The ADM energy and momentum, and therefore the rest mass, are unchanged.

== 8 Equality and the number of boundary components <q3:rigidity:setup>

Equality concerns the original metric and second fundamental form. A numerical deformation can establish a sharp bound without producing a limit that retains the original geometry. We therefore use the numerical comparison of Proposition 51 to vary the original exterior, and then classify the stationary field forced by equality.

There are two outermostness hypotheses below. The finite-component statement permits comparison cuts that retain some of the original boundary components. The connected statement needs only to exclude cuts lying wholly in the open exterior. We define these comparison classes separately because their distinction is used in the proof.

#prodef([Definition 8.1.])[
  (Partial-coincidence outermostness).  Let the boundary of a one-ended exterior be $S = union.sq.big_(i = 1)^ell S_i$, with $1 lt.eq ell < oo$ and each $S_i$ connected. The boundary is outermost in the partial-coincidence sense if no enclosing cut $Gamma eq.not S$ has all of the following properties: every connected component of $Gamma$ is either an entire original component $S_i$ or is wholly contained in the open exterior; at least one component lies in the open exterior; and $theta_(+) \( Gamma \) lt.eq 0$ everywhere for the normal toward the end.
] <q3:rigidity:partial-outermostness>

This condition includes comparisons that retain some original components and replace others by interior components. It will be used only after contact regularity has shown that the active minimizing cuts have exactly this form. For a connected boundary, a separate statement below retains the weaker condition excluding only wholly interior enclosing cuts. The two comparison classes are not identified.

#thm([Theorem 8.2.])[
  (Finite-component exterior equality rigidity).  #emph[Let $\( M \, g \, K \)$ be a smooth connected orientable complete initial data set without boundary, consisting of a compact core and finitely many asymptotically flat ends. On each end assume $g - delta = O_2 \( r^(- q) \)$, $K = O_1 \( r^(- 1 - q) \)$, with $q > 1 \/ 2$, and existing finite ADM flux limits. Assume that $mu$ and $\| J \|_g$ are integrable and that $mu gt.eq \| J \|_g$ everywhere.]
  #emph[Choose an end and a finite nonempty disjoint union 
$ S = union.sq.big_(i = 1)^ell S_i \, #h(2em) 1 lt.eq ell < oo \, $

 of compact connected smooth embedded two-sided surfaces without boundary, separating that end from a complementary region. Let $M_(upright("ext"))$ be the closure of the connected side toward the chosen end. Suppose that $partial M_(upright("ext")) = S$, that $M_(upright("ext"))$ has exactly this one end, and that, for the normal pointing into $M_(upright("ext"))$:]
  + #emph[every $S_i$ is a future MOTS, so $H_(S_i) + "tr"_(S_i) K = 0$;]
  + #emph[$S$ is outermost in the partial-coincidence sense of Definition 52;]
  + #emph[every enclosing cut in the closed exterior has area at least $A = \| S \|_g = sum_(i = 1)^ell \| S_i \|_g > 0$.]
  #emph[Let $\( E \, P \)$ be the ADM vector of the chosen end. If 
#[#set math.equation(numbering: n => "(8.1)")
 $ E > \| P \|_delta \, #h(2em) m = sqrt(E^2 - \| P \|_delta^2) = sqrt(frac(A, 16 pi)) \, $ <q3:intro:equality>]

 then $ell = 1$ and $S$ is diffeomorphic to a sphere. There is a proper smooth spacelike embedding of the entire original $M_(upright("ext"))$ into the maximally extended Schwarzschild spacetime of mass $m$, inducing $g$ and the given $K$ for a consistent future unit normal. The chosen end approaches the corresponding spatial infinity. The image of $S$ is a smooth cross-section of the corresponding future horizon or the bifurcation sphere. The embedding and its future normal are smooth up to $S$, and the image extends as a smooth spacelike hypersurface through that boundary.]
] <q3:intro:rigidity>

#thm([Theorem 8.3.])[
  (Connected exterior equality rigidity).  #emph[Under the ambient, asymptotic, and exterior hypotheses of Theorem 53, suppose that $S$ is connected. Retain conditions (i) and (iii), and replace condition (ii) by the following weaker outermostness condition: there is no compact smooth embedded surface wholly contained in $"Int" M_(upright("ext"))$, possibly disconnected, separating $S$ from the distant end and having $theta_(+) lt.eq 0$ everywhere for the normal toward that end. If (8.1) holds with $A = \| S \|_g$, then $S$ is diffeomorphic to a sphere and all the original-data Schwarzschild embedding conclusions of Theorem 53 hold.]
] <q3:intro:connected-rigidity>

#thm([Corollary 8.4.])[
  (Strictness for disconnected boundary).  #emph[Under the hypotheses of Theorem 53, retain $E > \| P \|_delta$ but do not assume its equality in mass and area. If $ell gt.eq 2$, then 
$ sqrt(E^2 - \| P \|_delta^2) > sqrt(frac(A, 16 pi)) . $

]
] <q3:rigidity:finite-strictness>

#proof[
  The original exterior is complete as a metric space with boundary, as follows. An intrinsic Cauchy sequence is Cauchy in the complete ambient manifold, and its ambient limit remains in the closed exterior. A smooth interior or boundary half-ball chart then gives convergence in the intrinsic distance. Its compact boundary and unique end place it in Definition 50. Since $S$ is an enclosing cut and every enclosing cut has area at least $A$, its enclosing infimum is $A$. Proposition 51 gives the non-strict inequality. Equality would imply $ell = 1$ by Theorem 53, contradicting $ell gt.eq 2$. ◻
]

The proofs of Theorems 53 and 54 begin with the feasible strict direction in Section 9, continue through the original-data variation and static base in Sections 10 and 11, and conclude with global classification and horizon recovery in Section 12. Their outermostness assumptions enter only in localizing the area multiplier in Lemma 62, where the connected case is treated separately. Each $S_i$ is orientable because it is two-sided in the orientable manifold $M$, but no genus is prescribed. The proof first constructs a causal stationary field on the original exterior and concentrates its area multiplier on the entire boundary. A single complete conformal-double argument then gives positive intrinsic curvature and the same area $A$ on every component, forcing $ell = 1$. Schwarzschild reconstruction follows with connectedness established by the argument. The conclusion concerns only the chosen exterior; it allows a nonconstant time graph and nonzero momentum in the original asymptotic frame.

===== 8.1 The proof path. <the-proof-path.>

First, the area derivative ranges over every minimizing enclosure. Separation produces an area measure and causal constraint multipliers. Normal-slice tests and the appropriate outermostness condition then concentrate the area measure on the original boundary. The resulting stationary field can initially be null and can carry null dust. We remove the twist without assuming regularity of that null set, complete the static base, and apply a global spinor argument to its conformal double. This proves vacuum and recovers the original slice through the horizon. After the global proof, Section 13 gives an independent local conformal-family obstruction for two spherical components. The strictness conclusion is qualitative; it supplies no positive lower bound for the deficit depending only on the number of components.

== 9 A feasible strict direction <q3:strict:section>

The separation argument needs one variation that makes every active dominant-energy inequality and every boundary expansion strict. We construct that direction on the same exterior. Throughout this section $\( N \, g \, K \)$ is a smooth one-ended exterior in Definition 50, with compact boundary $B$, normal $nu$ pointing into $N$, and the decay, integrability and dominant-energy hypotheses of Proposition 51. No assumption on its ADM causal character is needed. The construction also gives the exact charge change and controls every enclosing cut, including cuts touching the boundary.

Conformal strictification by a spacetime Poisson equation was developed by Jaracz #cite(label("Jaracz2025StrictDEC")). Here a regularized drift equation with nonzero inner Neumann data also gives strict trapping, an exact energy slope, unchanged momentum, and comparison of all enclosing cuts. These quantitative conclusions are established below.

#thm([Lemma 9.1.])[
  (Conformal constraint formulas).  #emph[For a smooth function $f$, set 
$ g_f = e^(4 f) g \, #h(2em) K_f = e^(2 f) K . $

 The corresponding constraint densities satisfy 
#[#set math.equation(numbering: n => "(9.1)")
 $ 16 pi e^(4 f) mu_f & = 16 pi mu - 8 Delta_g f - 8 \| d f \|_g^2 \,\
8 pi J_f & = e^(- 2 f) #scale(x: 120%, y: 120%)[\(] 8 pi J + 4 K \( nabla f \, dot.op \) #scale(x: 120%, y: 120%)[\)] . $ <q3:reduction:conformal-energy>]

 Here the second identity is an identity of covectors. Consequently, 
#[#set math.equation(numbering: n => "(9.2)")
 $ 16 pi e^(4 f) \( mu_f - \| J_f \|_(g_f) \) gt.eq  & 16 pi \( mu - \| J \|_g \)\
 & + 8 #scale(x: 120%, y: 120%)[\(] - Delta_g f - \| d f \|_g^2 - \| K \|_g \| d f \|_g #scale(x: 120%, y: 120%)[\)] . $ <q3:reduction:conformal-dec>]

 On the fixed boundary, 
#[#set math.equation(numbering: n => "(9.3)")
 $ theta_(+ \, f) = e^(- 2 f) \( theta_(+) + 4 partial_nu f \) . $ <q3:reduction:conformal-expansion>]

 Equivalently, if $u = e^f > 0$, the last summand in Equation (9.2) is $8 u^(- 1) \( - Delta_g u - \| K \|_g \| d u \|_g \)$.]
] <q3:reduction:conformal-formulas>

#proof[
  The scalar-curvature transformation in dimension three is $e^(4 f) "Scal"_(g_f) = "Scal"_g - 8 Delta_g f - 8 \| d f \|^2$. Both quadratic terms in $K$ scale by $e^(- 4 f)$, which proves Equation (9.1). Put $pi = K - \( "tr"_g K \) g$. Then $pi_f = e^(2 f) pi$. For a covariant symmetric tensor $T$, the connection difference for $tilde(g) = Omega^2 g$ gives, in dimension three,
  $ tilde(nabla)^(\, i) \( Omega T \)_(i j) = Omega^(- 1) #scale(x: 120%, y: 120%)[\(] nabla^i T_(i j) + 2 T_(i j) nabla^i log Omega - \( "tr"_g T \) partial_j log Omega #scale(x: 120%, y: 120%)[\)] . $
  Take $Omega = e^(2 f)$ and use $"tr"_g pi = - 2 "tr"_g K$. The terms containing $"tr"_g K$ cancel, leaving Equation (9.1). Taking its norm introduces another factor $e^(- 2 f)$. The triangle inequality, with the factor two between the constraint normalizations $16 pi$ and $8 pi$, yields Equation (9.2). Finally, $nu_f = e^(- 2 f) nu$, $H_f = e^(- 2 f) \( H + 4 partial_nu f \)$, and $"tr"_(B \, g_f) K_f = e^(- 2 f) "tr"_(B \, g) K$. This proves Equation (9.3). The last assertion follows from $Delta log u + \| d log u \|^2 = u^(- 1) Delta u$. ◻
]

#thm([Lemma 9.2.])[
  (Strict direction under the original decay).  #emph[Choose 
$ 0 < delta < beta < min \( q \, 1 \) . $

 There are smooth positive functions $w$ and $phi.alt$ on $N$, with $w = r^(- 3 - delta)$ on the end, such that 
#[#set math.equation(numbering: n => "(9.4)")
 $ & partial_nu phi.alt = - 1 quad upright("on ") B \, & phi.alt & = O_2 \( r^(- 1) \) \,\
 & - Delta_g phi.alt - \| K \|_g \| d phi.alt \|_g gt.eq w \, & frac(- Delta_g phi.alt, w) & arrow.r 1 . $ <q3:reduction:strict-boundary>]

 The Euclidean normal flux 
$ L_phi.alt = lim_(r arrow.r oo) integral_(S_r) partial_r phi.alt thin thin upright(d) A_delta $

 is finite and negative. For every finite $s gt.eq 0$, set 
#[#set math.equation(numbering: n => "(9.5)")
 $ u_s = 1 + s phi.alt \, #h(2em) g_s = u_s^4 g \, #h(2em) K_s = u_s^2 K . $ <q3:reduction:linear-family>]

 These data are complete up to $B$ and satisfy DEC, strictly for $s > 0$. If $theta_(+) lt.eq 0$ on $B$, their boundary expansion remains nonpositive and is strictly negative for $s > 0$. Their decay exponent can be taken to be $min \( q \, 1 \) > 1 \/ 2$, their constraint densities are integrable, and 
#[#set math.equation(numbering: n => "(9.6)")
 $ E_s = E + s A_phi.alt \, #h(2em) P_s = P \, #h(2em) A_phi.alt = - frac(L_phi.alt, 2 pi) > 0 . $ <q3:reduction:strict-charges>]

 Their full enclosing infima satisfy 
#[#set math.equation(numbering: n => "(9.7)")
 $ a_g \( B \) lt.eq a_(g_s) \( B \) lt.eq \( 1 + s parallel phi.alt parallel_oo \)^4 a_g \( B \) . $ <q3:reduction:strict-areas>]

 In particular $E_s arrow.r E$ and $a_(g_s) \( B \) arrow.r a_g \( B \)$ as $s arrow.b 0$. No sign assumption on the ADM vector is needed.]
  #emph[If $K$ is compactly supported and the metric has symbol estimates of all orders with $g - delta = O \( r^(- 1) \)$, the function can instead be chosen with $phi.alt = O_k \( r^(- 1) \)$ for every $k$, while retaining Equations (9.4) and (9.4).]
] <q3:reduction:strict-direction>

#proof[
  Choose smooth $b gt.eq \| K \|_g$, positive everywhere and equal to $b_0 r^(- 1 - beta)$ sufficiently far out, where $b_0 > 0$ is chosen large enough. This is possible because $beta < q$. Choose a smooth positive regularizer $zeta$, equal to $r^(- 2)$ on the end, and extend $w$ smoothly and positively to $N$. We solve
  #[#set math.equation(numbering: n => "(9.8)")
   $ - Delta_g phi.alt = b sqrt(\| d phi.alt \|_g^2 + zeta^2) + w \, #h(2em) partial_nu phi.alt = - 1 \, #h(2em) phi.alt arrow.r 0 . $ <q3:reduction:drift-poisson>]
  The regularizer makes this equation smooth even at critical points.
  First truncate at a large coordinate sphere $S_R$ and prescribe $phi.alt = 0$ there. The Neumann and Dirichlet conditions occur on disjoint boundary components. For $0 lt.eq t lt.eq 1$, replace $b$ in Equation (9.8) by $t b$. At $t = 0$, the mixed Laplacian is invertible: its Dirichlet face gives the Poincare inequality, and the weak solution obtained from its coercive quadratic form is smooth by boundary regularity. At any solution, the linearization is a Laplacian with a smooth drift of norm at most $b$ and with the homogeneous mixed boundary conditions. The strong maximum principle and the Hopf boundary principle make its kernel zero. It is a Fredholm perturbation of the mixed Laplacian of index zero, and is therefore invertible. The boundary estimates used here are the ordinary elliptic estimates for Dirichlet and normal Neumann conditions: positive definiteness of $g$ verifies their principal complementing condition, and the disjoint boundary components can be covered separately #cite(label("AgmonDouglisNirenberg1959")). The maximum principles and local elliptic estimates below are used in their usual uniformly elliptic forms #cite(label("GilbargTrudinger2001")).
  To close continuation at $t = 1$, first work on a fixed truncation. The elliptic $W^(2 \, p)$ estimate and gradient interpolation give
  $ parallel phi.alt parallel_(W^(2 \, p)) lt.eq C_p #scale(x: 120%, y: 120%)[\(] 1 + parallel phi.alt parallel_(L^p) + parallel d phi.alt parallel_(L^p) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 2 parallel phi.alt parallel_(W^(2 \, p)) + C'_p \( 1 + parallel phi.alt parallel_(L^p) \) . $
  The constants include the fixed boundary data and are uniform in $t$. If the supremum norms of solutions on this truncation were unbounded, divide them by their supremum norms. The preceding estimate with $p > 3$, compactness, and the equation give a nonzero limit $v$ with homogeneous mixed data satisfying
  $ - Delta_g v = t_(*) b \| d v \|_g . $
  This can be written $Delta_g v + A dot.op d v = 0$ with a bounded measurable drift: take $A = t_(*) b nabla v \/ \| d v \|$ off the critical set and zero on it. The strong and Hopf maximum principles exclude a nonzero solution with the homogeneous mixed conditions. Thus the supremum norms are bounded. The $W^(2 \, p)$ estimate, Schauder estimates, and the smooth equation now give the bounds needed for closedness of continuation. Existence on each truncation follows.
  Every such solution is nonnegative. A negative minimum cannot be interior because the right side of Equation (9.8) is positive. At an inner-boundary minimum, the outward-domain derivative would be negative by the Hopf principle, whereas the prescribed derivative in that direction is $1$. The outer value is zero.
  It remains to make these bounds independent of $R$. For fixed sufficiently large $A$ and then sufficiently large $r_0$, the positive radial function
  $ v_0 \( r \) = r^(- 1) \( 1 - A r^(- delta) \) $
  satisfies, on $r gt.eq r_0$,
  $ - Delta_g v_0 - b \| d v_0 \|_g & = A delta \( 1 + delta \) r^(- 3 - delta) + O \( r^(- 3 - q) \) + O \( r^(- 3 - beta) \) gt.eq c_0 w . $
  The constants are fixed independently of the truncation. Since $b zeta = o \( w \)$, a sufficiently large multiple of $v_0$ is a supersolution of the regularized equation. The comparison principle gives
  #[#set math.equation(numbering: n => "(9.9)")
   $ 0 lt.eq phi.alt \( x \) lt.eq C \( 1 + M_R \) v_0 \( r \) \, #h(2em) M_R = sup_(N ∩ { r lt.eq r_0 }) phi.alt \, quad r_0 lt.eq r lt.eq R . $ <q3:reduction:core-barrier>]
  The notation for the compact core includes all points outside the end chart. Were $M_R$ unbounded along expanding truncations, the normalized solutions $phi.alt \/ M_R$ would have locally uniform $W^(2 \, p)$ bounds, including at $B$, by the preceding local estimates and Equation (9.9). A subsequence would converge locally in $C^1$ to a nonnegative function with maximum one on the core, homogeneous inner Neumann data, and a bounded-drift homogeneous equation. Equation (9.9) makes its value tend to zero at infinity. It consequently attains a positive maximum, contradicting the strong or Hopf principle for that homogeneous equation. This proves the uniform core bound. The contradiction uses the homogeneous bounded-drift equation.
  Local compactness and diagonal extraction give a smooth solution of Equation (9.8), with $phi.alt = O \( r^(- 1) \)$. The claimed derivative count can be checked directly on annuli. Put
  $ phi.alt_rho \( y \) = rho phi.alt \( rho y \) \, #h(2em) g_rho \( y \) = g \( rho y \) \, #h(2em) 1 < \| y \| < 4 . $
  On smaller fixed annuli the equation is
  $ - Delta_(g_rho) phi.alt_rho = rho b \( rho y \) sqrt(\| d phi.alt_rho \|_(g_rho)^2 + \( rho^2 zeta \( rho y \) \)^2) + rho^3 w \( rho y \) . $
  Its coefficients have uniform $C^(1 \, 1)$ bounds from the two derivatives in Equation (7.3); the scaled drift is $O \( rho^(- beta) \)$ and the scaled source is $O \( rho^(- delta) \)$. The bounded zeroth-order norm, interior $W^(2 \, p)$ estimates, and gradient interpolation first give uniform $C^(1 \, alpha)$ bounds for some $alpha > 0$. The right side is then uniformly $C^alpha$. Schauder estimates give uniform $C^(2 \, alpha)$ bounds on smaller annuli. This proves $phi.alt = O_2 \( r^(- 1) \)$ without using a third derivative of $g$ or a second derivative of $K$.
  The right side of Equation (9.8) is $w + O \( r^(- 3 - beta) \)$. It is integrable and proves Equation (9.4). The divergence theorem, with outward-domain normal $- nu$ on $B$, gives
  #[#set math.equation(numbering: n => "(9.10)")
   $ lim_(r arrow.r oo) integral_(S_r) partial_(n_g) phi.alt thin thin upright(d) A_g = - \| B \|_g - integral_N #scale(x: 120%, y: 120%)[\(] b sqrt(\| d phi.alt \|_g^2 + zeta^2) + w #scale(x: 120%, y: 120%)[\)] thin thin upright(d) V_g . $ <q3:reduction:phi-flux>]
  The Euclidean flux differs by $O \( r^(- q) \)$ and has the same finite limit.
  For every fixed finite $s gt.eq 0$, the factor $u_s$ in Equation (9.5) is bounded and at least one, so the transformed data are complete up to $B$. The $u$-form of Lemma 56 gives
  $ 16 pi u_s^4 \( mu_s - \| J_s \|_(g_s) \) & gt.eq 16 pi \( mu - \| J \|_g \) + frac(8 s, u_s) \( - Delta_g phi.alt - \| K \|_g \| d phi.alt \|_g \) gt.eq frac(8 s, u_s) w \,\
theta_(+ \, s) & = u_s^(- 2) (theta_(+) - frac(4 s, u_s)) . $
  This proves the asserted signs for all finite $s$, without a smallness restriction.
  Since $u_s - 1 = O_2 \( r^(- 1) \)$, the transformed decay exponent is $min \( q \, 1 \) > 1 \/ 2$. The exact energy transformation is
  $ 16 pi u_s^4 mu_s = 16 pi mu - 8 s u_s^(- 1) Delta_g phi.alt . $
  Here $Delta_g phi.alt = O \( r^(- 3 - delta) \)$, and the additional current term is bounded by a fixed-$s$ constant times $\| K \|_g \| d phi.alt \|_g = O \( r^(- 3 - q) \)$. Both are integrable in dimension three. The bounded positive conformal factor also preserves integrability in the transformed volume measure.
  The leading metric change is $4 s phi.alt delta$, whose ADM energy flux is $- 8 s integral_(S_r) partial_r phi.alt thin thin upright(d) A_delta$ before division by $16 pi$. All remaining metric flux terms are $O_s \( r^(- q) \) + O_s \( r^(- 1) \)$. Writing $pi = K - \( "tr"_g K \) g$, one has $pi_s = u_s^2 pi$, so the change in its Euclidean momentum flux is $O_s \( r^2 r^(- 1) r^(- 1 - q) \) = O_s \( r^(- q) \)$. This proves Equation (9.6); Equation (9.10) gives $A_phi.alt > 0$. No $1 \/ r$ coefficient expansion for $phi.alt$ is needed. Finally, the cut class is unchanged and every cut has area $integral_Gamma u_s^4 thin thin upright(d) A_g$. Bounding $u_s$ between $1$ and $1 + s parallel phi.alt parallel_oo$ and taking infima proves Equation (9.7), including coincident and disconnected cuts.
  For the final assertion, take $b$ nonnegative, compactly supported, and at least $\| K \|$; the proof is unchanged. The end equation is then simply $- Delta_g phi.alt = w$. Once the two-derivative estimate has been established, successive annular elliptic estimates use the assumed symbol bounds for $g$ and $w$ to give $phi.alt = O_k \( r^(- 1) \)$ for every $k$. ◻
]

== 10 Equality, first variations, and a causal stationary field <q3:variation:section>

We return to the original exterior in Theorem 53. Write its nonempty compact boundary as

$ S = union.sq.big_(i = 1)^ell S_i \, #h(2em) 1 lt.eq ell < oo \, $

where each $S_i$ is a closed connected orientable smooth surface. No genus is prescribed. Each component is a future MOTS, and $S$ is outer area-minimizing. We use the precise outermostness condition of that theorem: there is no enclosing cut with at least one component in $"Int" M_(upright("ext"))$, every other component either in that interior or equal to an $S_i$, and $theta_(+) lt.eq 0$ on every component. Thus the condition permits comparison cuts that retain some original boundary components. Alternatively, for Theorem 54, take $ell = 1$ and its wholly-interior outermostness condition. The only different step is specified in Lemma 62. All the arguments in this section take place on this original exterior. We use the exterior inequality of Proposition 51 for nearby data on the same manifold with boundary. Those nearby data need not have an outermost or outer area-minimizing boundary. This distinction is essential for the variations below.

Write

$ A = \| S \|_g = 16 pi m^2 \, #h(2em) b^0 = E / m \, #h(2em) b^i = - P_i / m \, #h(2em) c = frac(1, 2 m) \, #h(2em) tau = "tr"_g K . $

Thus $A = sum_(i = 1)^ell \| S_i \|_g$ counts all boundary components. The vector $\( b^0 \, b^i \)$ is future unit timelike. For a nearby ADM vector define the fixed linear functional

#[#set math.equation(numbering: n => "(10.1)")
 $ cal(E) = b^0 E_(upright("new")) + b^i P_(upright("new") \, i) . $ <q3:variation:supporting-energy>]

The reverse Lorentzian Cauchy–Schwarz inequality gives $cal(E) gt.eq sqrt(E_(upright("new"))^2 - \| P_(upright("new")) \|^2)$ when the nearby ADM vector is future timelike. At the original data both sides equal $m$ and have the same first derivative. Moreover,

#[#set math.equation(numbering: n => "(10.2)")
 $ 16 pi frac(thin upright(d), thin upright(d) a) sqrt(frac(a, 16 pi))\|_(a = A) = c . $ <q3:variation:area-coefficient>]

We shall prove the following statement. The notation $O_2$ for the vector field uses the original end coordinates, component by component.

#thm([Proposition 10.1.])[
  (Causal adjoint at equality).  #emph[There are a function $u$ and a vector field $X$, smooth on the one-sided manifold $M_(upright("ext"))$, with the following properties.]
  + #emph[$u gt.eq \| X \|_g$ everywhere and $u > 0$ in $"Int" M_(upright("ext"))$. For every $q'$ with $1 \/ 2 < q' < min { q \, 1 }$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ u = b^0 + O_2 \( r^(- q') \) \, #h(2em) X = b^i partial_i + O_2 \( r^(- q') \) . $ <q3:variation:asymptote>]

]
  + #emph[In the interior, 
#[#set math.equation(numbering: n => "(10.4)")
 $ "sym" nabla X & = - u K \,\
Delta u & = - "div" \( K \( X \, dot.op \)^sharp \) \,\
"Hess" u & = u \( "Ric"_g + tau K - 2 K^2 \) - cal(L)_X K + 8 pi X_(\( i) J_(j \)) . $ <q3:variation:kid-first>]

 Here $\( K^2 \)_(i j) = K_i zws^k K_(k j)$, and parentheses denote averaged symmetrization. These equations extend smoothly to $S$.]
  + #emph[On $bb(R) times "Int" M_(upright("ext"))$ the Lorentzian metric 
#[#set math.equation(numbering: n => "(10.5)")
 $ upright(bold(g)) = - u^2 thin upright(d) t^2 + g_(i j) \( thin upright(d) x^i + X^i thin upright(d) t \) \( thin upright(d) x^j + X^j thin upright(d) t \) $ <q3:variation:stationary-metric>]

 has stationary Killing field $xi = partial_t$ and induces $\( g \, K \)$ on $t = 0$, with future normal $n = u^(- 1) \( partial_t - X \)$ and the second fundamental form convention $K = 1 / 2 cal(L)_n g$. Its Einstein tensor satisfies 
#[#set math.equation(numbering: n => "(10.6)")
 $ u upright(bold(G))_(i j) = - 8 pi X_(\( i) J_(j \)) \, #h(2em) u mu + J \( X \) = 0 . $ <q3:variation:einstein-spatial>]

 Set $N = u^2 - \| X \|^2$. Then $mu N = 0$, and, throughout this stationary spacetime, 
#[#set math.equation(numbering: n => "(10.7)")
 $ upright(bold(G)) = frac(8 pi mu, u^2) thin xi^flat ⊗ xi^flat \, #h(2em) "Scal"_(upright(bold(g))) = 0 \, #h(2em) "Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0 . $ <q3:variation:null-dust>]

 In particular, the spacetime is vacuum on ${ N > 0 }$.]
  + #emph[With $nu$ pointing into the exterior, 
#[#set math.equation(numbering: n => "(10.8)")
 $ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa \, #h(2em) kappa = frac(1, 4 m) quad upright("on ") S . $ <q3:variation:boundary-data>]

 For each $i = 1 \, dots.h \, ell$, either $u > 0$ everywhere on $S_i$, or $u = 0$ everywhere on $S_i$. This alternative is made separately on each component; the constant $kappa$ is common to all components.]
] <q3:variation:adjoint>

Equation (10.7) deliberately allows nonzero matter where $N = 0$. This section does not infer vacuum from the existence of a causal stationary field alone. The treatment of that null region belongs to Section 11.

=== 10.1 The derivative of the enclosing area <q3:variation:area-subsection>

Apply the full-perimeter construction of Section 3 to $\( M_(upright("ext")) \, g \)$ with obstacle boundary $S$. Every compact orientable component of $S$ can also be filled by a handlebody, giving a compact filling directly in dimension three. Only the metric is extended; the constraints and the variations below remain on $M_(upright("ext"))$. Full perimeter counts all contact with all components of $S$, as required by Definition 50. Write $cal(T)$ for the minimizing frontiers, recorded together with their filled sets. Since $S$ is outer area-minimizing, their area is $A$ and $S$ belongs to $cal(T)$.

#thm([Lemma 10.2.])[
  (Compact minimizing cuts and the area envelope).  #emph[Let $g_s$ be a smooth path of metrics through $g$ whose first and second parameter derivatives are uniformly bounded relative to $g$, and whose end geometry has uniformly bounded scaled first derivatives for $s$ near zero. Put $h = dot(g)_0$, and let $a \( s \)$ be its filled enclosing infimum. Then 
#[#set math.equation(numbering: n => "(10.9)")
 $ a' \( 0 + \) = min_(T in cal(T)) a'_T \( h \) \, #h(2em) a'_T \( h \) = 1 / 2 integral_T "tr"_T h thin upright(d) A_g . $ <q3:variation:area-envelope-formula>]

 The space $cal(T)$ is compact for the convergence of its sets in local $L^1$ and of its unoriented tangent-plane area measures. The function $T mapsto a'_T \( h \)$ is continuous for that topology. Off the obstacle, two cuts in $cal(T)$ have the same tangent plane at each point where they meet.]
] <q3:variation:area-envelope>

#proof[
  Definition 50 supplies a smooth one-ended exterior, complete with compact boundary, and Equation (7.3) gives the original asymptotic geometry. There is no hypothesis concerning the constraint densities in the geometric propositions of Section 3. The parameter bounds, after shrinking the interval, make $g_s$ uniformly comparable to $g$. Together with the scaled first-derivative bounds, this is the last end alternative in Proposition 9; no common mean-convex tail for the whole path has to be assumed.
  Explicitly, the bounded-obstacle competitor gives a uniform perimeter bound. The BV exhaustion construction in that proposition first produces a locally minimizing limit of finite volume and bounded perimeter. An end frontier point at radius $r$ would contribute at least $c r^2$ area in an obstacle-free coordinate ball of radius comparable to $r$, by the uniform interior density estimate. Thus the frontier is confined, and finite volume makes its distant tail empty. It is a global minimizing bounded competitor. The same argument confines every minimizing set for every small $s$.
  Proposition 8, with $n = 3$, gives $C^(1 \, 1)$ regularity at contact and smooth-cut recovery. With the confinement just established, Proposition 9 gives strict perimeter convergence, the localized Reshetnyak–Spector plane-measure convergence and the derivative formula. The no-crossing argument in Proposition 10 gives the common plane. That proposition’s whole-support graphical convergence also shows that this plane is continuous on the union of the free cuts, with its relative topology. Pointwise plane convergence here uses this additional regularity step, not BV convergence alone. ◻
]

=== 10.2 A positive separator for the active constraints <q3:variation:separation-subsection>

The enclosing-area derivative retains all minimizing cuts rather than selecting one differentiable family. We now combine it with the energy, dominant-energy, and boundary-expansion variations to obtain a positive multiplier identity at equality.

Use the fixed unit ball bundle

$ cal(B) = { \( x \, v \) : x in M_(upright("ext")) \, med \| v \|_g lt.eq 1 } \, #h(2em) C \( x \, v \) = 16 pi #scale(x: 120%, y: 120%)[\(] mu \( x \) + J_x \( v \) #scale(x: 120%, y: 120%)[\)] \, $

and its closed active subset $cal(A) = { C = 0 }$. For a varying metric transport $v$ isometrically by the symmetric positive square root: if $g_s \( dot.op \, dot.op \) = g \( A_s dot.op \, dot.op \)$, put $v_s = A_s^(- 1 \/ 2) v$. Thus

#[#set math.equation(numbering: n => "(10.10)")
 $ dot(v)_0 = - 1 / 2 h^sharp v \, #h(2em) \| v_s \|_(g_s) = \| v \|_g . $ <q3:variation:frame-derivative>]

The linear variation $C'_H$ below includes this argument variation.

Fix the strict conformal direction from Lemma 57, and write it as

$ Q = \( 4 phi.alt g \, 2 phi.alt K \) . $

Here $partial_nu phi.alt = - 1$, $phi.alt = O_2 \( r^(- 1) \)$ has a finite flux, and for some $0 < delta < min { q \, 1 }$ and a smooth positive weight $w = r^(- 3 - delta)$ on the end,

#[#set math.equation(numbering: n => "(10.11)")
 $ - Delta phi.alt - \| K \| \| nabla phi.alt \| gt.eq w \, #h(2em) frac(- Delta phi.alt, w) arrow.r 1 . $ <q3:variation:strict-weight>]

Decrease $delta$ if necessary in using that lemma. Let $cal(V)$ be the real linear space generated by $Q$, all smooth compactly supported variations $\( h \, p \)$ up to $S$, and the following four smooth variations cut off to vanish on a fixed large compact set:

#[#set math.equation(numbering: n => "(10.12)")
 $ h_(i j)^(\( 0 \)) = delta_(i j) / r \, #h(2em) p^(\( 0 \)) = 0 \; #h(2em) h^(\( a \)) = 0 \, #h(2em) p^(\( a \)) = B \( e_a \) \, $ <q3:variation:prototypes>]

where, on the end,

#[#set math.equation(numbering: n => "(10.13)")
 $ B \( p \)_(i j) = r^(- 2) #scale(x: 120%, y: 120%)[\(] p_i n_j + p_j n_i - \( delta_(i j) - n_i n_j \) p dot.op n #scale(x: 120%, y: 120%)[\)] \, #h(2em) n = x \/ r . $ <q3:variation:momentum-prototype>]

These tensors are Euclidean tracefree and divergence-free. The scalar-curvature linearization at the Euclidean metric annihilates $delta \/ r$ outside the cutoff. Consequently the non-strict generators have

#[#set math.equation(numbering: n => "(10.14)")
 $ C'_H = O \( r^(- 3 - q) \) = o \( w \) quad upright("on the end, uniformly for ") \| v \| lt.eq 1 . $ <q3:variation:prototype-error>]

The same estimate includes the frame term in Equation (10.10). The momentum prototypes have independent momentum fluxes and the scalar prototype has nonzero energy flux.

On an active ray the background conformal scaling term vanishes, so the exact conformal formulas give

#[#set math.equation(numbering: n => "(10.15)")
 $ C'_Q = - 8 Delta phi.alt + 8 K \( v \, nabla phi.alt \) \, #h(2em) C'_Q / w arrow.r 8 \, #h(2em) - theta'_Q = 4 quad upright("on ") S . $ <q3:variation:strict-active>]

The coefficient of $Q$ is well defined even when the active set has no rays tending to infinity. For $H = \( h \, p \) in cal(V)$, define

$ a \( H \) = lim_(r arrow.r oo) frac(- Delta_g \( "tr"_g h \), 12 w) . $

This limit is $1$ on $Q$, because $"tr"_g \( 4 phi.alt g \) = 12 phi.alt$ and $- Delta_g phi.alt \/ w arrow.r 1$. It is zero on compact variations and on the momentum prototypes, whose metric components vanish. For the mass prototype, $"tr"_g \( delta \/ r \) = 3 \/ r + O_2 \( r^(- 1 - q) \)$, and therefore $Delta_g "tr"_g \( delta \/ r \) = O \( r^(- 3 - q) \) = o \( w \)$, since $delta < q$. Thus the limit exists for every generator and, by linearity, every $H in cal(V)$. It extracts its $Q$ coefficient independently of the chosen generator representation. On active rays escaping to infinity, Equations (10.14) and (10.15) give $C'_H \/ w arrow.r 8 a \( H \)$.

#thm([Lemma 10.3.])[
  (Multiplier identity).  #emph[There are a probability measure $pi.alt$ on $cal(T)$, a nonnegative finite measure $eta$ on $S$, a nonnegative locally finite measure $Lambda$ on $cal(A)$, and a number $z gt.eq 0$ such that, for every $H in cal(V)$, 
#[#set math.equation(numbering: n => "(10.16)")
 $ 16 pi cal(E)' \( H \) - c integral_(cal(T)) a'_T \( h \) thin upright(d) pi.alt \( T \) = chevron.l C'_H \, Lambda chevron.r - integral_S theta'_H thin upright(d) eta + z a \( H \) . $ <q3:variation:multiplier-identity>]

 The pairing is well defined on $cal(V)$. The last term vanishes on compact variations and on the four prototypes.]
] <q3:variation:separation>

#proof[
  Adjoin an end point to $cal(A)$, collapsing every ray that escapes spatial compact sets to that point; if $cal(A)$ is compact, take an additional isolated end point. The bounded fibers make the result a compact space. Assign the value $8 a \( H \)$ at the added point. If $cal(A)$ is noncompact, the active-ray asymptotics prove continuity there. If $cal(A)$ is compact or empty, the added point is isolated, so continuity is automatic. Take the disjoint compact union of this space, $S$, and $cal(T)$, and associate to $H$ the continuous function whose values on the three pieces are
  #[#set math.equation(numbering: n => "(10.17)")
   $ C'_H / w \, #h(2em) - theta'_H \, #h(2em) c a'_T \( h \) - 16 pi cal(E)' \( H \) \, $ <q3:variation:test-map>]
  respectively. Smooth dependence of the boundary expansion and Lemma 59 give the remaining continuity.
  We first prove that no image of this linear map is strictly positive at every point of the compact test space. Suppose otherwise, and write $H = a Q + H_0$. Positivity at the end point gives $a > 0$. Realize its tangent by the actual path
  #[#set math.equation(numbering: n => "(10.18)")
   $ g_s = e^(4 a s phi.alt) \( g + s h_0 \) \, #h(2em) K_s = e^(2 a s phi.alt) \( K + s p_0 \) . $ <q3:variation:feasible-path>]
  The metric remains positive and uniformly comparable to $g$ for small $\| s \|$. The varied data retain the required asymptotic decay with exponent $min { q \, 1 } > 1 \/ 2$, and their charge variations have finite limits. The conformal factor has its stated flux. Thus the path has differentiable ADM fluxes.
  Here are the estimates which ensure nonlinear feasibility. On the end the tensors in $H_0$ are $O_2 \( r^(- 1) \)$ and $O_1 \( r^(- 2) \)$, and their far-end Euclidean linear constraints vanish. Terms in their linear constraint variation containing a background error cost $O \( s r^(- 3 - q) \)$, while new quadratic terms cost $O \( s^2 r^(- 4) \)$. Changing the orthonormal identification has the same bound: the background momentum is $O \( r^(- 2 - q) \)$, and the metric variation is $O \( r^(- 1) \)$. Applying the exact conformal law to the intermediate data $\( g + s h_0 \, K + s p_0 \)$, and keeping the nonnegative background term with its positive scaling factor, therefore gives, uniformly over the full unit ball of test vectors,
  #[#set math.equation(numbering: n => "(10.19)")
   $ e^(4 a s phi.alt) C_s = C + s #scale(x: 120%, y: 120%)[\(] 8 a w + o \( w \) #scale(x: 120%, y: 120%)[\)] + O \( s^2 w \) quad upright("on the end") . $ <q3:variation:nonlinear-end>]
  The $o \( w \)$ is uniform as $r arrow.r oo$ at fixed $H$, and the quadratic bound is uniform for small $s$. The gradient square in the conformal formula is $O \( r^(- 4) \) = O \( w \)$ because $delta < 1$. One may use the composition of the two natural isometries of the unit balls in deriving this estimate; it tests the same DEC. At active rays its derivative agrees with Equation (10.10), since the difference of two isometric identifications is tangent to the unit sphere and is annihilated by $J$ at an active ray.
  It follows from Equation (10.19) that the DEC holds on a fixed far end for all sufficiently small positive $s$. On the remaining compact ball bundle, the derivative is strictly positive on the closed active set. A neighborhood of that set has the same positive derivative with a fixed smaller margin. On its compact complement the original $C$ has a positive minimum. Taylor’s formula now gives the DEC throughout the compact region as well. The strict inequality $- theta'_H > 0$ on compact $S$ gives $theta_(+ \, s) < 0$ for small positive $s$. The new sources are integrable: outside a compact set their changes, after the harmless positive rescaling of the original sources, have the integrable bounds just displayed. The ADM vector stays future timelike. Hence these are data to which Proposition 51 applies.
  Finally, strict positivity on the compact cut space gives
  $ c min_(T in cal(T)) a'_T \( h \) - 16 pi cal(E)' \( H \) > 0 . $
  By Lemma 59 and Equation (10.2), this says that the right derivative of $16 pi \( cal(E) \( s \) - sqrt(a \( s \) \/ \( 16 pi \)) \)$ is strictly negative. The expression is zero at $s = 0$, whereas the supporting-energy inequality and Proposition 51 make it nonnegative for small positive $s$. This is a contradiction.
  The image of the linear test map is therefore disjoint from the open cone of strictly positive continuous functions. The separating form of the Hahn–Banach theorem #cite(label("RudinFunctionalAnalysis1991")) Theorem 3.4(a), pp. 59–60 gives a nonzero continuous linear functional, nonnegative on nonnegative functions, which annihilates the image. The Riesz representation theorem #cite(label("RudinRealComplex1987")) Theorem 2.14, pp. 40–41 represents it by nonnegative finite measures on the three compact pieces. Its mass on the objective piece $cal(T)$ cannot be zero: otherwise its value on the image of $Q$, which is strictly positive on both remaining pieces including their end point, would be positive. Normalize this objective mass to one. On the finite active rays divide the corresponding measure by $w$ and call the result $Lambda$. It is locally finite; the original finite measure makes its pairing with $C'_H$ finite. Put the end-point mass, multiplied by eight, into $z$. Rearranging the annihilation identity gives Equation (10.16) with the stated signs. ◻
]

Define the scalar and vector moments of $Lambda$ with the fixed volume-density convention by

#[#set math.equation(numbering: n => "(10.20)")
 $ chevron.l u \, f chevron.r = integral f \( x \) thin upright(d) Lambda \( x \, v \) \, #h(2em) chevron.l X \, alpha chevron.r = integral alpha_x \( v \) thin upright(d) Lambda \( x \, v \) . $ <q3:variation:moments>]

Initially these are measures, including possible measures on $S$. Their positivity and the support of $Lambda$ give, distributionally,

#[#set math.equation(numbering: n => "(10.21)")
 $ u gt.eq \| X \|_g \, #h(2em) u mu + J \( X \) = 0 . $ <q3:variation:measure-complementarity>]

The first statement means domination of the total variation of the vector measure by the scalar measure; in particular it can be tested against arbitrary continuous unit covector fields.

=== 10.3 Removing the interior area multipliers <q3:variation:normal-slice-subsection>

The identity still averages area derivatives over active minimizing cuts. Before extracting the interior adjoint equations, we must concentrate that area term on the full original boundary. Compact normal variations supply these tests without assuming an ambient vacuum development.

#thm([Lemma 10.4.])[
  (Normal slice tests).  #emph[For every smooth $s$ compactly supported in $"Int" M_(upright("ext"))$ there are smooth compact variations $H_epsilon.alt = \( h_epsilon.alt \, p_epsilon.alt \)$, all supported in one fixed compact subset of the open exterior, such that $h_epsilon.alt = 2 s K$ and 
#[#set math.equation(numbering: n => "(10.22)")
 $ C'_(H_epsilon.alt) arrow.r 0 quad upright("uniformly on the active rays over compact sets") . $ <q3:variation:normal-test-limit>]

]
] <q3:variation:normal-tests>

#proof[
  Apply Lemma 14 on a relatively compact open neighborhood of $"supp" s$ in the open exterior. To match its geometric density convention, put
  $ hat(mu) = 8 pi mu \, #h(2em) hat(J) = 8 pi J . $
  Equation (7.1) gives $2 hat(mu) = R_g + \( "tr"_g K \)^2 - \| K \|_g^2$ and $hat(J) = "div"_g \( K - \( "tr"_g K \) g \)$, and the dominant energy condition gives $hat(mu) gt.eq \| hat(J) \|_g$. The data are smooth on this neighborhood, and the future-normal convention (7.6) is the one used in that lemma.
  The ray constraints agree exactly:
  $ 2 #scale(x: 120%, y: 120%)[\(] hat(mu) + hat(J) \( v \) #scale(x: 120%, y: 120%)[\)] = 16 pi #scale(x: 120%, y: 120%)[\(] mu + J \( v \) #scale(x: 120%, y: 120%)[\)] = C \( x \, v \) . $
  This identity holds for the varied data as well, and both derivatives use $v'_0 = - 1 / 2 h^sharp v$. Thus the active sets and the derivatives $frak(C)' \( h \, p \; v \)$ and $C'_H \( x \, v \)$ coincide. Taking the parameter $delta = 8 pi epsilon.alt$ in Lemma 14 gives the claimed variations and uniform convergence. Their compact support in the open exterior makes them admissible in the variation space and makes every boundary and ADM variation vanish. This density conversion does not change the ADM energy, momentum, or mass. ◻
]

#thm([Lemma 10.5.])[
  (Concentration of the area multiplier).  #emph[The measure $pi.alt$ in Lemma 60 is concentrated on the single cut $S$.]
] <q3:variation:area-support>

#proof[
  Use the variations of Lemma 61 in Equation (10.16). Their ADM and boundary variations vanish. Their supports lie in a fixed compact set, on which $Lambda$ is finite, so the uniform constraint-derivative limit gives
  #[#set math.equation(numbering: n => "(10.23)")
   $ integral_(cal(T)) integral_T s "tr"_T K thin upright(d) A_g thin upright(d) pi.alt \( T \) = 0 quad upright("for every ") s in C_c^oo \( "Int" M_(upright("ext")) \) . $ <q3:variation:aggregate-trace>]
  Here the metric component is $2 s K$, and the area coefficient $c = 1 \/ \( 2 m \)$ is positive.
  We apply Proposition 15 to this identity. Lemma 59 and its accompanying common-plane argument supply the required measurable compact family, smooth minimal free parts, and continuous common tangent plane. Its contact graphs are $C^(1 \, 1)$, hence $C^(1 \, alpha) ∩ W^(2 \, 2)$ locally. Each minimizing filled set has no bounded complementary pocket: filling such a pocket would remove positive perimeter. Its frontier therefore has a connected end side and is a full enclosing cut once smooth. Every frontier counts all its components, including coincidence with $S$, and has area $A = \| S \|_g$.
  For Theorem 53, the finite marginal boundary and Definition 52 match case (b) of the proposition exactly. For Theorem 54, $S$ is connected and its wholly-interior comparison condition matches case (a). Thus $pi.alt$ is concentrated on $S$ in either case. The comparison classes remain distinct; the connected case uses no partial-coincidence outermostness assumption. ◻
]

=== 10.4 The interior adjoint equations <q3:variation:interior-subsection>

Constraint-adjoint methods connect mass variation with Killing initial data #cite(label("BeigChrusciel1997KID")) #cite(label("HuangLee2024Bartnik")). The modified adjoint and its possible null-fluid stress are especially relevant here; see Section 6.1 of #cite(label("HuangLee2024Bartnik")). We derive the matter term and use the enclosing-area multiplier’s own boundary conditions, rather than importing fixed Bartnik boundary data or asserting vacuum at this stage.

The localization step has removed every interior area source. It remains to turn the constraint multiplier into a smooth stationary field and to determine its normalization from the ADM variations. We now know that the area term in Equation (10.16) is exactly $c a'_S \( h \)$. In particular, arbitrary variations compactly supported in the open exterior have zero total multiplier pairing. We first use this fact before making any regularity assumption on the moments.

#thm([Lemma 10.6.])[
  (Interior regularity and the full metric equation).  #emph[The moments $\( u \, X \)$ are smooth in the open exterior and satisfy Equations (10.4)–(10.4) and $u mu + J \( X \) = 0$ there. Their full first jet satisfies a homogeneous linear first-order system with smooth background coefficients.]
] <q3:variation:interior-equations>

#proof[
  For a compact variation $p = dot(K)$ with $h = 0$, direct differentiation and integration of the momentum divergence give the coefficient
  $ 2 #scale(x: 120%, y: 120%)[\[] u \( tau g - K \) - "sym" nabla X + \( "div" X \) g #scale(x: 120%, y: 120%)[\]] $
  against $p$. It is zero distributionally. Taking its trace gives $"div" X = - u tau$, and substituting back proves Equation (10.4).
  Next use the compact simultaneous conformal variation $\( h \, p \) = \( 4 psi g \, 2 psi K \)$. Its background scaling term is $- 64 pi psi \( u mu + J \( X \) \)$, which vanishes by Equation (10.21). The remaining pairing is
  $ - 8 chevron.l u \, Delta psi chevron.r + 8 chevron.l X \, K \( nabla psi \, dot.op \) chevron.r = 0 . $
  This is Equation (10.4) in distributions. Taking a divergence of the symmetric-gradient equation and using $"div" X = - u tau$ also gives
  #[#set math.equation(numbering: n => "(10.24)")
   $ Delta X_j + "Ric"_(j k) X^k & = \( tau delta_j zws^i - 2 K_j zws^i \) nabla_i u + u \( nabla_j tau - 2 nabla^i K_(i j) \) . $ <q3:variation:elliptic-shift>]
  Together with the lapse equation this is a second-order elliptic system with scalar Laplacian principal part and smooth lower-order couplings. Locally the measure moments belong to some negative Sobolev space. The local Laplace estimate #cite(label("MelroseEllipticRegularity")) Chapter 4, Section 3, Theorem 3.1, p. 127 applied to this system improves their Sobolev order by one, since the right sides have at most one derivative of the unknowns. Iterating with nested compact cutoffs puts them in every local Sobolev space. Sobolev embedding then gives smoothness. The distributional inequalities and complementarity now hold pointwise in the interior.
  We give the full metric calculation, including the dependence of the momentum test vectors on the metric. Put $P = K - tau g$. For compactly supported variations the constraint pairing is the first variation of
  #[#set math.equation(numbering: n => "(10.25)")
   $ I \( g \, K \) = integral [u \( R + tau^2 - \| K \|^2 \) + 2 X^i nabla^j P_(i j)] thin upright(d) V_g \, $ <q3:variation:constraint-action>]
  together with the frame correction
  #[#set math.equation(numbering: n => "(10.26)")
   $ - 8 pi integral h \( X \, J^sharp \) thin upright(d) V_g . $ <q3:variation:frame-correction>]
  The integration may be localized to a fixed region containing the variation. Changing its volume form instead of retaining the original fixed measure adds one half of its background integrand times $"tr" h$. That integrand is $16 pi \( u mu + J \( X \) \) = 0$, so this replacement does not change the pairing. Equation (10.26) follows directly from Equation (10.10) and has the displayed negative sign.
  Integrating the shift term once by parts makes it $- integral P^(i j) \( cal(L)_X g \)_(i j) thin upright(d) V_g$ up to a boundary term unaffected by these variations. In taking a pure metric variation, $u$, contravariant $X$, and covariant $K$ are fixed. The elementary variation formulas used are
  $ dot(R) & = - "Ric"^(i j) h_(i j) + nabla^i nabla^j h_(i j) - Delta \( "tr" h \) \,\
dot(tau) & = - K^(i j) h_(i j) \, #h(2em) #scale(x: 120%, y: 120%)[\(] \| K \|^2 #scale(x: 120%, y: 120%)[\)]^(bold(dot.op)) = - 2 \( K^2 \)^(i j) h_(i j) \, #h(2em) \( thin upright(d) V \)^(bold(dot.op)) = 1 / 2 "tr" h thin upright(d) V \,\
\( P^(i j) \)^(bold(dot.op)) & = - h^i zws_a K^(a j) - h^j zws_a K^(i a) + \( K^(a b) h_(a b) \) g^(i j) + tau h^(i j) \,\
\( cal(L)_X g \)^(bold(dot.op)) & = cal(L)_X h . $
  For example, integrating the last term by parts and combining it with the variation of $P^(i j)$ gives the following coefficient from the entire shift integral:
  $ \( cal(L)_X K \)_(i j) - \( "div" X \) K_(i j) - #scale(x: 120%, y: 120%)[\[] X \( tau \) + K^(a b) nabla_a X_b #scale(x: 120%, y: 120%)[\]] g_(i j) . $
  The scalar-curvature terms contribute $"Hess" u - \( Delta u \) g - u "Ric"$. Consequently the vanishing metric coefficient is the explicit equation
  #[#set math.equation(numbering: n => "(10.27)")
   $ 0 =  & nabla_i nabla_j u - \( Delta u \) g_(i j) - u "Ric"_(i j) + 2 u \( K^2 - tau K \)_(i j)\
 & + u / 2 \( R + tau^2 - \| K \|^2 \) g_(i j) + \( cal(L)_X K \)_(i j) - \( "div" X \) K_(i j)\
 & - #scale(x: 120%, y: 120%)[\[] X \( tau \) + K^(a b) nabla_a X_b #scale(x: 120%, y: 120%)[\]] g_(i j) - 8 pi X_(\( i) J_(j \)) . $ <q3:variation:full-metric-adjoint>]
  This calculation can equally be read distributionally, since each coefficient is linear in the moments and their derivatives.
  For completeness, its simplification uses no vacuum assumption. Equation (10.4) gives
  $ "div" X = - u tau \, quad K^(a b) nabla_a X_b = - u \| K \|^2 \, quad "tr" \( cal(L)_X K \) = X \( tau \) - 2 u \| K \|^2 . $
  Taking the trace of Equation (10.27) and using $16 pi mu = R + tau^2 - \| K \|^2$ and $J \( X \) = - u mu$ yields
  #[#set math.equation(numbering: n => "(10.28)")
   $ Delta u + X \( tau \) = u / 2 \( R + tau^2 + \| K \|^2 \) . $ <q3:variation:trace-metric-equation>]
  Substitution of this identity into Equation (10.27) gives exactly Equation (10.4).
  These equations have the asserted finite-type property. The right side of Equation (10.4) is linear in $u \, X \, nabla X$, with smooth background coefficients, since
  $ \( cal(L)_X K \)_(i j) = X^k nabla_k K_(i j) + K_(k j) nabla_i X^k + K_(i k) nabla_j X^k . $
  The second derivatives of $X$ are also fixed by first jets. To make this explicit, put $B_(i j) = nabla_(\( i) X_(j \)) = - u K_(i j)$. Commuting covariant derivatives gives
  #[#set math.equation(numbering: n => "(10.29)")
   $ nabla_i nabla_j X_k =  & nabla_i B_(j k) + nabla_j B_(i k) - nabla_k B_(i j)\
 & + 1 / 2 (\[ nabla_i \, nabla_j \] X_k - \[ nabla_i \, nabla_k \] X_j - \[ nabla_j \, nabla_k \] X_i) . $ <q3:variation:prolongation>]
  The commutators are curvature times $X$, and differentiating $B = - u K$ uses only $u \, nabla u$ and the background first derivative of $K$. Thus every derivative of $\( u \, X \, nabla u \, nabla X \)$ is a homogeneous linear expression in that same first jet. This proves the final assertion. ◻
]

=== 10.5 Boundary continuation and the ADM normalization <q3:variation:continuation-subsection>

#thm([Lemma 10.7.])[
  (Continuation, boundary atoms, and the end constants).  #emph[The smooth interior fields extend smoothly to the one-sided boundary. The original moment measures have no boundary-supported part. They satisfy Equation (10.3), and $u > 0$ in the interior.]
] <q3:variation:regularity-normalization>

#proof[
  In a smooth normal collar $\( s \, y \)$ of $S$, all background coefficients in the first-jet system of Lemma 63 are smooth up to $s = 0$. Along a normal line the system is an ordinary linear differential equation for the full first jet, with bounded coefficients. Solve it down to $s = 0$ from a fixed interior collar surface. Smooth dependence on the initial data and on $y$ supplies a smooth extension, which agrees with the original solution by uniqueness along each normal line. In particular all its one-sided derivatives have the values supplied by the system. The same system also proves that an interior first jet which vanishes at one point vanishes everywhere on the connected interior, by continuation along piecewise smooth paths.
  We next establish the asymptotic form without having prescribed growth to the measures. Let $Y$ denote all coordinate components of $\( u \, X \)$. The original $O_2 \( r^(- q) \)$, $O_1 \( r^(- 1 - q) \)$ bounds, the constraints, and Equations (10.4) and (10.29) give
  #[#set math.equation(numbering: n => "(10.30)")
   $ \| partial^2 Y \| lt.eq C r^(- 1 - q') \| partial Y \| + C r^(- 2 - q') \| Y \| \, #h(2em) 1 / 2 < q' < min { q \, 1 } . $ <q3:variation:end-jet-estimate>]
  Only the original derivative bounds occur here: the curvature and $partial K \, J$ are $O \( r^(- 2 - q') \)$, and the coefficients of first jets are $O \( r^(- 1 - q') \)$.
  Fix $q'$ with $1 \/ 2 < q' < min { q \, 1 }$, and choose $q' < hat(q) < min { q \, 1 }$. Equation (10.30) also holds with $hat(q)$ in place of $q'$, and $g - delta = O_2 \( r^(- hat(q)) \)$. The pair $Y = \( u \, X \)$ is smooth and satisfies $u gt.eq \| X \|_g$. Lemma 32, with input exponent $hat(q)$ and output exponent $q'$, therefore gives one constant $Y_oo$ such that
  #[#set math.equation(numbering: n => "(10.31)")
   $ Y = Y_oo + O \( r^(- q') \) \, #h(2em) partial Y = O \( r^(- 1 - q') \) \, #h(2em) partial^2 Y = O \( r^(- 2 - q') \) . $ <q3:variation:unnormalized-asymptote>]
  At this point the original measure moments could still have a component supported on $S$. Subtract the integration by parts of the smooth interior fields from the compact identity (10.16). Test with $p = 0$ and a metric variation whose value and full first jet vanish on $S$. The area and expansion variations and all the smooth integrated boundary terms then vanish. The remaining scalar-curvature variation on $S$ contains
  $ - partial_nu^2 \( "tr"_S h \) . $
  This is an arbitrary smooth function on $S$: in collar coordinates one may take the tangential trace to be a prescribed multiple of $s^2$ times a cutoff. All momentum and frame terms involve only the value or first jet of $h$ and hence vanish on $S$. It follows that the scalar moment has no boundary measure. Domination $\| X \| lt.eq u$ as measures eliminates a vector boundary measure also.
  We can therefore integrate the smooth adjoint by parts all the way to $S$ and to a large coordinate sphere. Use a prototype from Equation (10.12), with its cutoff chosen to vanish near $S$. Its area and expansion variations vanish, and $a \( H \) = 0$. Its constraint pairing is integrable by Equation (10.14) and Equation (10.31). Interior terms vanish by the adjoint equations. If the constants in the latter equation are $\( u_oo \, X_oo \)$, its outer boundary term is
  #[#set math.equation(numbering: n => "(10.32)")
   $ integral_(S_R) #scale(x: 120%, y: 120%)[\[] & u_oo \( partial_j h_(i j) - partial_i h_(j j) \) + 2 X_oo^j \( p_(i j) - \( "tr"_delta p \) delta_(i j) \) #scale(x: 120%, y: 120%)[\]] n^i thin upright(d) A_delta + o \( 1 \) . $ <q3:variation:adjoint-charge-flux>]
  For clarity, every omitted term vanishes under the stated decay: the derivatives of $u \, X$ are $O \( r^(- 1 - q') \)$ and multiply $h = O \( r^(- 1) \)$; their nonconstant values multiply $partial h \, p = O \( r^(- 2) \)$; and the metric-variation momentum terms contain $K h = O \( r^(- 2 - q') \)$. Multiplication by sphere area still leaves $O \( r^(- q') \)$. Thus the limit of Equation (10.32) is $16 pi \( u_oo E' + X_oo^i P'_i \)$.
  The scalar prototype has $E' = 1 \/ 2$ and $P' = 0$; for the momentum prototype in direction $p$, $E' = 0$ and $P' = 2 p \/ 3$. The latter follows by integrating $B \( p \)_(i j) n^j = r^(- 2) \( p_i + \( p dot.op n \) n_i \)$. Equation (10.16) for these four independent fluxes consequently gives
  $ u_oo = b^0 \, #h(2em) X_oo^i = b^i . $
  This proves Equation (10.3) and in particular shows that the adjoint is nontrivial.
  If $u$ vanished at an interior point, smooth nonnegativity would give $nabla u = 0$ there. The inequality $\| X \| lt.eq u$ gives $X = 0$; since $u$ has zero differential, it also forces $nabla X = 0$ at that point. The whole first jet would be zero. Its continuation property would make $\( u \, X \)$ identically zero, contradicting $u_oo = b^0 > 0$. Thus $u > 0$ in the interior. ◻
]

=== 10.6 The stationary Einstein tensor <q3:variation:stationary-subsection>

We can now form the nondegenerate Lorentzian metric (10.5) on the open exterior. All its coefficients are independent of $t$. Its future unit normal to a constant-time slice is $n = u^(- 1) \( partial_t - X \)$, and

$ 1 / 2 cal(L)_n g = - frac(1, 2 u) cal(L)_X g = K $

by Equation (10.4). Thus this construction recovers the original second fundamental form, including its sign.

Here is an explicit curvature verification of the stationary equation; in particular the modified metric adjoint is not being identified with vacuum Killing initial data by assertion. The Gauss–Codazzi formulas and the stationary normal-derivative formula for $K$, with the convention just specified, give

#[#set math.equation(numbering: n => "(10.33)")
 $ "Ric"_(upright(bold(g)) \, i j) & = "Ric"_(g \, i j) + tau K_(i j) - 2 \( K^2 \)_(i j) - u^(- 1) #scale(x: 120%, y: 120%)[\[] \( cal(L)_X K \)_(i j) + \( "Hess" u \)_(i j) #scale(x: 120%, y: 120%)[\]] \,\
"Scal"_(upright(bold(g))) & = R + tau^2 + \| K \|^2 - 2 u^(- 1) #scale(x: 120%, y: 120%)[\(] Delta u + X \( tau \) #scale(x: 120%, y: 120%)[\)] . $ <q3:variation:stationary-ricci>]

These identities can also be checked from the lapse-shift metric without an evolution assumption: its scalar decomposition is

$ u "Scal"_(upright(bold(g))) = u \( R + \| K \|^2 - tau^2 \) - 2 "div" \( nabla u + tau X \) \, $

and $"div" X = - u tau$ changes this into Equation (10.33). The spatial Ricci formula is its tensor counterpart, with normal change $u^(- 1) \( - cal(L)_X K \)$ and lapse acceleration $u^(- 1) "Hess" u$. Equivalently, variation of the reduced scalar action $integral u \( R + \| K \|^2 - tau^2 \) thin upright(d) V$ at fixed lapse and contravariant shift has coefficient $- u upright(bold(G))_(i j)$. This agrees with the explicit coefficient (10.27) before its frame correction.

Equation (10.28) in Equation (10.33) gives $"Scal"_(upright(bold(g))) = 0$. Equation (10.4) in Equation (10.33) now gives

$ u upright(bold(G))_(i j) = u "Ric"_(upright(bold(g)) \, i j) = - 8 pi X_(\( i) J_(j \)) . $

The normal and mixed Einstein components are the constraints, $upright(bold(G)) \( n \, n \) = 8 pi mu$ and $upright(bold(G)) \( n \, e_i \) = 8 pi J_i$. This proves Equation (10.6).

It remains to draw exactly the correct consequence of causality. At every interior point,

#[#set math.equation(numbering: n => "(10.34)")
 $ 0 = u mu + J \( X \) gt.eq u mu - \| J \| \| X \| gt.eq u \( mu - \| J \| \) gt.eq 0 . $ <q3:variation:causal-equalities>]

If $u > \| X \|$, these equalities force $mu = \| J \| = 0$. If $mu > 0$, they force

#[#set math.equation(numbering: n => "(10.35)")
 $ \| X \| = u \, #h(2em) \| J \| = mu \, #h(2em) J = - mu / u X^flat . $ <q3:variation:dust-alignment>]

When $mu = 0$, the DEC gives $J = 0$ and all Einstein components already vanish. When $mu > 0$, use the orthonormal coframe with $theta^0 \( n \) = 1$ and $theta^i \( e_j \) = delta_j^i$. The constraints and the spatial Einstein equation give

$ upright(bold(G)) = 8 pi mu (theta^0 - X_i / u theta^i)^2 = frac(8 pi mu, u^2) xi^flat ⊗ xi^flat . $

The covector in parentheses is null and annihilates $xi = u n + X$. This proves the tensor identity in Equation (10.7) everywhere, with $mu N = 0$. Its trace is zero and its contraction with $xi$ is zero, so $"Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0$. All these identities hold on every stationary time translate. No strict timelikeness has been inferred on the internal null set.

=== 10.7 Free boundary variations <q3:variation:boundary-subsection>

We finish the proof of Proposition 58 by determining the boundary data. By Lemma 64, all moments now have smooth volume densities up to $S$, with no constraint measure on $S$ itself. The integration-boundary normal is $- nu$.

Take an arbitrary compact $K$ variation $p$, allowing arbitrary boundary values, with $h = 0$. Integration of the momentum term has boundary contribution

$ - 2 integral_S #scale(x: 120%, y: 120%)[\[] p \( X \, nu \) - \( "tr" p \) X_nu #scale(x: 120%, y: 120%)[\]] thin upright(d) A . $

The boundary expansion variation is $"tr"_S p$, and the area variation vanishes. Separating the mixed and tangential-trace components of $p$ in Equation (10.16) gives

#[#set math.equation(numbering: n => "(10.36)")
 $ X_T = 0 \, #h(2em) thin upright(d) eta = 2 X_nu thin upright(d) A . $ <q3:variation:eta-density>]

Indeed, the remaining boundary expression is

$ - 2 integral_S p \( X_T \, nu \) thin upright(d) A + integral_S \( "tr"_S p \) \( 2 X_nu thin upright(d) A - thin upright(d) eta \) \, $

and these components of $p$ are independent. This also identifies $eta$ as a smooth density.

Now use the compact conformal variation $\( 4 psi g \, 2 psi K \)$, allowing arbitrary value and normal derivative of $psi$ on $S$. Its area derivative is $4 integral_S psi thin upright(d) A$, and its expansion derivative is $4 partial_nu psi$, since $theta_(+) = 0$. Integrating the lapse equation by parts with normal $- nu$ yields

#[#set math.equation(numbering: n => "(10.37)")
 $ - 4 c integral_S psi thin upright(d) A =  & 8 integral_S #scale(x: 120%, y: 120%)[\[] u partial_nu psi - \( partial_nu u + K \( X \, nu \) \) psi #scale(x: 120%, y: 120%)[\]] thin upright(d) A\
 & - 4 integral_S partial_nu psi thin upright(d) eta . $ <q3:variation:conformal-boundary>]

The independently prescribed normal derivative gives $thin upright(d) eta = 2 u thin upright(d) A$. Comparing with Equation (10.36) yields $X = u nu$. The independently prescribed value then gives

$ partial_nu u + K \( X \, nu \) = c / 2 = frac(1, 4 m) . $

This proves Equation (10.8) with its normal orientation and numerical normalization. The boundary values and normal derivatives used in these tests can be supported near any one $S_i$. The same total-area coefficient $c$ therefore gives the same constant $kappa = c \/ 2$ on every boundary component.

Let $L$ be the MOTS stability operator for outward normal graph variation at $S$: a graph with initial speed $s nu$ has expansion derivative $L s$. Its principal part is $- Delta_S$ and its coefficients are smooth. Extend an arbitrary smooth $s nu$ to a compact vector field $Y$ on the one-sided exterior and test with

$ h = cal(L)_Y g \, #h(2em) p = cal(L)_Y K . $

Only its one-sided jets at $S$ are needed; an actual diffeomorphism of the manifold with boundary is not required to be a member of the variation space. In the open exterior these are spatial diffeomorphism variations. Their DEC derivative vanishes at every active ray: under diffeomorphism transport, the derivative is a spatial derivative of a nonnegative scalar at its zero; the difference from the isometric vector transport is tangent to the unit sphere, and $J$ annihilates that difference at an active ray. At $mu = 0$ the latter statement also holds since $J = 0$. There is no boundary constraint measure left to test.

The ADM variation vanishes, the area variation is $integral_S H s thin upright(d) A$, and the expansion variation is $L s$. Using $thin upright(d) eta = 2 u thin upright(d) A$ in Equation (10.16) gives

$ c integral_S H s thin upright(d) A = 2 integral_S u L s thin upright(d) A quad upright("for every ") s in C^oo \( S \) . $

Consequently

#[#set math.equation(numbering: n => "(10.38)")
 $ 2 L^(*) u = c H quad upright("on ") S . $ <q3:variation:boundary-stability>]

Outer area minimization implies $H gt.eq 0$: the first area variation of every nonnegative outward speed is nonnegative. Thus the nonnegative smooth $u \|_S$ satisfies $L^(*) u gt.eq 0$. The strong minimum principle applies with no sign assumption on the original zeroth-order coefficient: subtract a sufficiently large constant from the operator with positive Laplacian principal part, using $u gt.eq 0$, to obtain the usual nonpositive zeroth-order coefficient. Apply this principle on each connected $S_i$. It follows that either $u > 0$ everywhere on $S_i$, or $u$ is identically zero on $S_i$ #cite(label("GilbargTrudinger2001")) Chapter 3. The argument is componentwise and does not require the same alternative on distinct components.

All assertions of Proposition 58 have now been proved. On any component $S_i$ where $u = 0$, one also has $X = 0$ and $nabla X = 0$: tangential derivatives of $X = 0$ vanish, and Equation (10.4) supplies the remaining normal derivatives there. On any component $S_i$ where $u > 0$, the same equation and Equation (10.8) give

$ partial_nu N = 2 u #scale(x: 120%, y: 120%)[\(] partial_nu u + K \( X \, nu \) #scale(x: 120%, y: 120%)[\)] = 2 u kappa quad upright("on ") S_i . $

These two local boundary behaviors apply independently at each component and will be used in the static classification.

== 11 The static base and its weak-decay end expansion <q3:static:section>

The original-data variation supplies a causal stationary field. We verify the hypotheses of the common static-base construction, keeping all possible ends approaching its null set. We then prove the three-dimensional end expansion needed for conformal doubling. The next section classifies that double and recovers the original hypersurface through its boundary. The conformal construction follows the method of Bunting and Masood-ul-Alam #cite(label("BuntingMasoodUlAlam1987")).

#thm([Proposition 11.1.])[
  (Static classification and hypersurface reconstruction).  #emph[Let the original exterior satisfy the hypotheses of Theorem 53, and let $u \, X$ be the fields supplied by Proposition 58. Then the number of boundary components is $ell = 1$, and that component is diffeomorphic to $S^2$. Moreover, 
$ N := u^2 - \| X \|_g^2 > 0 #h(2em) upright("on ") "int" M_(upright("ext")) . $

 The metric and function 
$ h = g + N^(- 1) X^flat ⊗ X^flat \, #h(2em) lambda = sqrt(N) $

 form the Schwarzschild static base of mass $m$, with its horizon boundary attached in the regular base coordinates described below. There is a proper smooth spacelike embedding of the original $M_(upright("ext"))$ into maximally extended Schwarzschild spacetime of mass $m$ whose induced metric and future second fundamental form are $g \, K$. Its boundary is a cross-section of the future horizon if $u \|_S > 0$, and the bifurcation sphere if $u \|_S = 0$. The embedding extends as a smooth spacelike hypersurface through $S$, and its chosen end approaches the corresponding spatial infinity.]
] <q3:static:classification>

We record precisely the outputs of Proposition 58 that will be used. Put $Omega = "int" M_(upright("ext"))$. The fields $u \, X$ are smooth up to the one-sided boundary, $u > 0$ on $Omega$, and $u gt.eq \| X \|_g$. For any fixed

$ 1 / 2 < q_0 < min { q \, 1 } \, $

their end asymptotes have an $O_2 \( r^(- q_0) \)$ remainder and satisfy

#[#set math.equation(numbering: n => "(11.1)")
 $ \( u \, X \) arrow.r \( b^0 \, b \) = (E / m \, - P / m) \, #h(2em) \( b^0 \)^2 - \| b \|^2 = 1 \, #h(2em) b^0 > 0 . $ <q3:static:asymptotic-field>]

On $bb(R) times Omega$, the Lorentzian metric

#[#set math.equation(numbering: n => "(11.2)")
 $ upright(bold(g)) = - u^2 thin upright(d) t^2 + g_(i j) \( thin upright(d) x^i + X^i thin upright(d) t \) \( thin upright(d) x^j + X^j thin upright(d) t \) $ <q3:static:stationary-metric>]

has Killing field $xi = partial_t$, satisfies $"Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0$, and is vacuum wherever $N > 0$. In addition,

#[#set math.equation(numbering: n => "(11.3)")
 $ "sym" nabla X = - u K \, #h(2em) X \|_S = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa := frac(1, 4 m) . $ <q3:static:kid-boundary>]

For each connected component $S_i$, either $u > 0$ everywhere on $S_i$ or $u = 0$ everywhere on $S_i$. The alternative may initially depend on $i$; the same positive constant $kappa$ occurs on all components. These statements include the null-dust alternative before vacuum has been proved: only the contraction $"Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0$ will be used at points where $N = 0$.

=== 11.1 The common construction under weak decay <q3:static:base-subsection>

Let $cal(P) = { N > 0 } subset Omega$. On this open set define

#[#set math.equation(numbering: n => "(11.4)")
 $ h & = g + N^(- 1) X^flat ⊗ X^flat \, & C & = h^(- 1) = g^(- 1) - u^(- 2) X ⊗ X \,\
lambda & = sqrt(N) \, & A & = N^(- 1) X^flat \, #h(2em) F = thin upright(d) A . $ <q3:static:base-definitions>]

The stationary metric then has the form

#[#set math.equation(numbering: n => "(11.5)")
 $ upright(bold(g)) = - N \( thin upright(d) t - A \)^2 + h \, #h(2em) thin upright(d) V_h = u / sqrt(N) thin upright(d) V_g . $ <q3:static:threading-form>]

We apply Proposition 34 to the original closed exterior. Its completeness follows from the ambient hypothesis: an intrinsic Cauchy sequence is Cauchy in the complete ambient manifold, its limit remains in the closed exterior, and a smooth interior or boundary half-ball chart gives intrinsic convergence. The exterior has exactly one end and a compact complement of that end. Its boundary has finitely many smooth components, all included in the application.

The end hypotheses of the common proposition require only two differentiated bounds on the metric and stationary field. Here $g - delta = O_2 \( r^(- q_0) \)$, and Equation (11.1) has an $O_2 \( r^(- q_0) \)$ remainder, with $2 q_0 > 1 = n - 2$. Proposition 58 obtained that field estimate from the original $O_2 \/ O_1$ data by applying the first-jet estimate with a slightly larger input exponent. Thus no additional derivative of the original metric or tensor is required here. The normalization $\( b^0 \)^2 - \| b \|^2 = 1$, the positive interior lapse, causal domination, vanishing Ricci contraction, and vacuum on $cal(P)$ are exactly the outputs recorded above. Equation (11.3) provides the boundary law on each component with the same $kappa = 1 \/ \( 4 m \) > 0$. The choice between positive and zero boundary lapse may differ from one component to another.

#thm([Lemma 11.2.])[
  (The complete three-dimensional static base).  #emph[The positive set $cal(P)$ is connected; write $cal(E) = cal(P)$. It contains the AF end and a deleted collar of every original boundary component. On $cal(E)$, $thin upright(d) A = 0$, $0 < lambda < 1$, and 
#[#set math.equation(numbering: n => "(11.6)")
 $ lambda "Ric"_h = "Hess"_h lambda \, #h(2em) Delta_h lambda = 0 \, #h(2em) "Scal"_h = 0 . $ <q3:static:static-equations>]

 Approach to an interior zero of $N$ has infinite $h$-length. Attaching all components of $S$ gives a complete base with compact boundary and 
#[#set math.equation(numbering: n => "(11.7)")
 $ h \|_(T S) = g \|_(T S) \, #h(2em) lambda = 0 \, #h(2em) partial_(nu_h) lambda = kappa \, #h(2em) upright("II")_h = 0 . $ <q3:static:base-boundary-data>]

 At a component with positive boundary lapse, the base metric has a smooth reflection with odd lapse. At a zero-lapse component the reflection is $C^(2 \, alpha)$ for every $alpha < 1$. The two-copy double is connected, orientable and complete, and its reflected metric and odd lapse satisfy the scalar and harmonic equations across every join.]
] <q3:static:base-completion>

#proof[
  The hypotheses of Proposition 34 were verified above. It gives the connected positive set, vanishing twist, static equations, lapse range, boundary attachments, and completeness with the entire boundary included. Its null-set and horizon cutoff arguments apply to all the finitely many components; they impose no common choice of boundary lapse alternative. In particular, the proposition does not discard any possible complete end approaching an interior zero of $N$. Closedness of $A$ supplies local static time coordinates, but no global primitive is asserted at this stage.
  Take two copies of the attached base and identify corresponding points of every $S_i$ by its collar reflection. The result is connected because the base is connected and its boundary is nonempty. Giving the second copy the opposite orientation makes the double orientable. The reflected second jets agree, so the scalar and harmonic equations hold continuously across each join.
  For completeness, fold the double onto the attached base. The fold is distance nonincreasing, so a Cauchy sequence projects to a Cauchy sequence in that complete base. A complete locally compact length space is proper; hence the projected sequence is contained in a compact base set. Its inverse image in the double is the quotient of two compact copies and is compact. The original sequence has a convergent subsequence and therefore converges. This proves completeness without a classification or simple-connectivity assumption. ◻
]

For the later recovery of the original hypersurface, we record the original-coordinate forms of the two attachments in Proposition 34. On a component with $u \|_S > 0$,

#[#set math.equation(numbering: n => "(11.8)")
 $ thin upright(d) N \|_S = 2 kappa X^flat \|_S = 2 u kappa thin nu^flat . $ <q3:static:simple-norm>]

Use $\( N \, y^1 \, y^2 \)$ as original smooth collar coordinates and write

$ X^flat = a \( N \, y \) thin upright(d) N + N beta_A \( N \, y \) thin upright(d) y^A \, #h(2em) a \( 0 \, y \) = frac(1, 2 kappa) . $

Putting $N = lambda^2$ gives

#[#set math.equation(numbering: n => "(11.9)")
 $ h_(lambda lambda) & = 4 lambda^2 g_(N N) + 4 a^2 \,\
h_(lambda A) & = 2 lambda \( g_(N A) + a beta_A \) \,\
h_(A B) & = g_(A B) + lambda^2 beta_A beta_B . $ <q3:static:even-base>]

The coefficients on the right are evaluated at $\( lambda^2 \, y \)$; the diagonal blocks are even and the mixed block is odd. The base attachment is therefore a homeomorphism to the original closed collar, though the change $N = lambda^2$ is not a boundary diffeomorphism.

On a component with $u \|_S = 0$, let $s gt.eq 0$ be the original $g$-normal distance. The attachment uses smooth fields $a \, Y$ with

#[#set math.equation(numbering: n => "(11.10)")
 $ u = s a \, #h(2em) X = s^2 Y \, #h(2em) a \|_S = kappa \, #h(2em) N = s^2 #scale(x: 120%, y: 120%)[\(] a^2 - s^2 \| Y \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <q3:static:double-norm>]

Thus, with $D = a^2 - s^2 \| Y \|_g^2$,

$ h = g + s^2 D^(- 1) Y^flat ⊗ Y^flat \, #h(2em) lambda = s sqrt(D) \, #h(2em) D \|_S = kappa^2 . $

Here both fields are smooth in the original one-sided collar. These formulas also show that the attached base and original exterior have the same boundary points and induced boundary metric in both cases.

=== 11.2 Static asymptotics and the compactified end <q3:static:asymptotic-subsection>

After a constant linear change of the original end coordinates, $h = delta + O_2 \( r^(- q_0) \)$ and $lambda = 1 + O_2 \( r^(- q_0) \)$. Indeed its original constant metric is $I + b ⊗ b$, by Equation (11.1). We prove the improvement required for conformal doubling explicitly; the harmonic-coordinate mechanism agrees with Bartnik #cite(label("Bartnik1986")) Theorem 3.1, Proposition 3.3, and Theorem 4.3.

#thm([Lemma 11.3.])[
  (Harmonic-coordinate expansion).  #emph[There are asymptotically Cartesian coordinates on the end and a number $0 < epsilon.alt < 1$ such that, with $gamma = lambda^2 h$ and $U = log lambda$, 
#[#set math.equation(numbering: n => "(11.11)")
 $ gamma_(i j) = delta_(i j) + O_k \( r^(- 1 - epsilon.alt) \) \, #h(2em) U = - M / r + frac(b_1 dot.op x, r^3) + O_k \( r^(- 2 - epsilon.alt) \) $ <q3:static:gamma-expansion>]

 for every fixed finite $k$. Here $M > 0$; the vector $b_1$ is unrelated to the shift asymptote $b$. Only the original two metric derivatives and the stated adjoint decay are needed to start this improvement.]
] <q3:static:asymptotics>

#proof[
  The three-dimensional conformal formulas applied to Equation (11.6) give
  #[#set math.equation(numbering: n => "(11.12)")
   $ "Ric"_gamma = 2 thin upright(d) U ⊗ thin upright(d) U \, #h(2em) Delta_gamma U = 0 . $ <q3:static:gamma-equations>]
  Initially $gamma - delta \, U = O_2 \( r^(- q_0) \)$. We give the coordinate construction with this derivative count.
  Move to a sufficiently distant end and extend $gamma$ to a metric on $bb(R)^3$, equal to $delta$ inside a large ball, using a fixed-ratio cutoff annulus. In the resulting coordinates write
  $ Delta_gamma = \( delta^(a b) + a^(a b) \) partial_(a b) + c^a partial_a . $
  The coefficients satisfy $a = O_2 \( r^(- q_0) \)$, $c = O_1 \( r^(- 1 - q_0) \)$, and their scaled Hölder norms through the orders needed here are small after increasing the cutoff radius. The bounded second derivatives in the hypothesis give scaled Lipschitz bounds on first derivatives, so they suffice for any fixed Hölder exponent less than one at this stage.
  Put $s_0 = 1 - q_0 in \( 0 \, 1 \/ 2 \)$. For a source with weighted scaled $C^(0 \, alpha)$ size $O \( r^(s_0 - 2) \)$, the Euclidean inverse normalized to vanish at zero is
  #[#set math.equation(numbering: n => "(11.13)")
   $ P f \( x \) = - frac(1, 4 pi) integral_(bb(R)^3) (frac(1, \| x - y \|) - frac(1, \| y \|)) f \( y \) thin upright(d) y . $ <q3:static:subtracted-newton>]
  It maps that weighted norm boundedly to scaled $C^(2 \, alpha)$ size $O \( r^(s_0) \)$. To verify the zeroth-order bound, split at $\| y \| = 2 \| x \|$. On the far part, the kernel difference is bounded by $C \| x \| \| y \|^(- 2)$, and its integral is $O \( \| x \|^(s_0) \)$ because $s_0 < 1$. On the near part the separate kernels have the same bound because $s_0 > 0$. Interior Poisson estimates on rescaled annuli give the derivative and Hölder bounds. The ordinary local estimates also apply on the fixed inner ball.
  The equations
  $ v^i = P #scale(x: 120%, y: 120%)[\(] - c^i - a^(a b) partial_(a b) v^i - c^a partial_a v^i #scale(x: 120%, y: 120%)[\)] $
  are contractions in that weighted space. Indeed the operator norm of the last two terms is bounded by a constant times the small scaled norms of $a$ and $r c$. They produce harmonic coordinates $x^i + v^i$ with $v = O_(C^(2 \, alpha)) \( r^(1 - q_0) \)$ and $D v = O \( r^(- q_0) \)$. These functions are coordinates sufficiently far out.
  There is a derivative issue in changing metric coordinates which must be addressed before using a classical Ricci equation. The original assumptions bound $a \, c$, respectively, in scaled $W^(2 \, oo)$ and $W^(1 \, oo)$. Differentiate the equation for $v$ once and apply local $W^(2 \, p)$ estimates to $D v$ on rescaled annuli. All differentiated coefficients and forcing are controlled by these bounds and the preceding $C^(2 \, alpha)$ estimate. For every finite $p$ this gives
  $ v = O_(W^(3 \, p)) \( r^(1 - q_0) \) . $
  Consequently the transformed $gamma - delta \, U$ have scaled $W^(2 \, p)$ size $O \( r^(- q_0) \)$. Take $p > 3$; Morrey embedding gives scaled $C^(1 \, alpha)$ control for some $alpha > 0$. In the harmonic chart Equation (11.12) has the elliptic form
  $ - 1 / 2 gamma^(a b) partial_(a b) gamma_(i j) + Q_(i j) \( gamma^(- 1) \, D gamma \) = 2 U_i U_j \, #h(2em) gamma^(a b) partial_(a b) U = 0 \, $
  where $Q_(i j)$ is quadratic in $D gamma$. Schauder estimates first give scaled $C^(2 \, alpha)$ control; differentiating this elliptic system then gives $gamma - delta \, U = O_k \( r^(- q_0) \)$ for each finite $k$. No higher original-coordinate derivative bound has been assumed.
  We use two elementary exterior Poisson estimates. If $w = o \( 1 \)$, $Delta_delta w = f$, and $f = O_k \( r^(- 2 - t) \)$, $1 < t < 2$, then
  #[#set math.equation(numbering: n => "(11.14)")
   $ w = a / r + O_k \( r^(- t) \) . $ <q3:static:poisson-monopole>]
  To prove this, cut $w$ off on a fixed inner annulus and extend it by zero; this changes $f$ only on a compact set. The extended solution equals the Newton potential of its Laplacian, since their difference is an entire decaying harmonic function. The coefficient is $a = - \( 4 pi \)^(- 1) integral f$. For $\| y \| < r \/ 2$, subtracting $1 \/ r$ from the kernel costs
  $ C r^(- 2) integral_(\| y \| < r \/ 2) \| y \| \| f \( y \) \| thin upright(d) y = O \( r^(- t) \) . $
  The remaining region, including the integrable kernel singularity, has the same bound. Rescaled interior estimates prove the derivative version. If instead $f = O_k \( r^(- 4 - epsilon.alt) \)$, $0 < epsilon.alt < 1$, its first moments converge and the same reasoning gives
  #[#set math.equation(numbering: n => "(11.15)")
   $ w = a / r + frac(d dot.op x, r^3) + O_k \( r^(- 2 - epsilon.alt) \) . $ <q3:static:poisson-dipole>]
  Here subtract $1 \/ r + \( x dot.op y \) \/ r^3$ in the near region. The remainder costs $C r^(- 3) integral_(\| y \| < r \/ 2) \| y \|^2 \| f \( y \) \| thin upright(d) y = O \( r^(- 2 - epsilon.alt) \)$; the far region has that order as well.
  Set $epsilon.alt = 2 q_0 - 1 in \( 0 \, 1 \)$. The harmonic-coordinate equations and initial symbol bounds yield
  $ Delta_delta \( gamma_(i j) - delta_(i j) \) \, med Delta_delta U = O_k \( r^(- 2 - 2 q_0) \) . $
  Equation (11.14) gives
  $ gamma_(i j) = delta_(i j) + A_(i j) / r + O_k \( r^(- 1 - epsilon.alt) \) \, #h(2em) U = a / r + O_k \( r^(- 1 - epsilon.alt) \) . $
  The harmonic-coordinate condition is $partial_j \( sqrt(det gamma) thin gamma^(i j) \) = 0$. Expanding it at the displayed order gives
  $ (A_(i j) - 1 / 2 \( "tr" A \) delta_(i j)) x^j / r^3 = O \( r^(- 2 - epsilon.alt) \) . $
  Taking a radial limit shows $A = 1 / 2 \( "tr" A \) I$. Its trace in dimension three is zero, hence $A = 0$. Since $D^2 U = O_k \( r^(- 3) \)$, the scalar equation now improves to
  $ Delta_delta U = \( delta^(a b) - gamma^(a b) \) partial_(a b) U = O_k \( r^(- 4 - epsilon.alt) \) . $
  Equation (11.15) proves Equation (11.11), initially with a real $M$.
  Its positivity uses the lapse range from Lemma 66. The function $- U > 0$ is $gamma$-harmonic. For $0 < eta < 1$ and a fixed positive $C$, the function
  $ w = r^(- 1) + C r^(- 1 - eta) $
  is positive and strictly $gamma$-subharmonic sufficiently far out: $Delta_gamma r^(- 1) = O \( r^(- 4 - epsilon.alt) \)$, while the leading Laplacian of $r^(- 1 - eta)$ is $eta \( 1 + eta \) r^(- 3 - eta)$. Choose $c > 0$ so small that $- U gt.eq c w$ on a large inner sphere. The difference tends to zero and is superharmonic, so the exterior minimum principle gives $- U gt.eq c w$ throughout that end. Taking the radial limit proves $M gt.eq c > 0$. ◻
]

The next section completes the finite-component classification and recovers the original hypersurface. The independent two-sphere argument in Section 13 uses only the static-base and end estimates established here.

== 12 Global classification and recovery through the horizon <q3:global:section>

We continue with the finite-component class of Theorem 53, with no prescribed boundary genera. Starting from the complete static base and end estimates just proved, we compactify one end of the double at its actual regularity and retain all possible other ends while proving zero-mass rigidity. We then exclude the interior null set. This order preserves the information needed to recover both the original metric and second fundamental form.

#thm([Lemma 12.1.])[
  (The two conformal metrics).  #emph[Define 
$ h_plus.minus = (frac(1 plus.minus lambda, 2))^4 h quad upright("on ") cal(E) . $

 Both are scalar flat. The plus end satisfies $h_(+) = delta + O_k \( r^(- 1 - epsilon.alt) \)$, hence has zero ADM mass. The minus end compactifies by one point to a nondegenerate $C^(1 \, epsilon.alt) ∩ W_(upright("loc"))^(2 \, p)$ metric for some $p > 3$, with scalar curvature zero as a distribution at that point.]
] <q3:static:conformal-completion>

#proof[
  Scalar flatness follows from Equation (11.6) and the three-dimensional conformal scalar-curvature formula, since $1 plus.minus lambda$ are harmonic. In terms of the preceding variables,
  #[#set math.equation(numbering: n => "(12.1)")
   $ h_(+) = cosh^4 \( U \/ 2 \) gamma \, #h(2em) h_(-) = sinh^4 \( U \/ 2 \) gamma . $ <q3:static:conformal-gamma>]
  The first factor is $1 + O_k \( r^(- 2) \)$, proving the assertion for $h_(+)$. Its ADM flux is $O \( r^(- epsilon.alt) \)$, so its mass is zero.
  For the minus end invert $x = y \/ \| y \|^2$, write $rho = \| y \|$, and put $R \( y \) = I - 2 y ⊗ y \/ rho^2$. The inversion differential is $rho^(- 2) R \( y \)$, with $R \( y \)^T R \( y \) = I$. Equation (11.11) gives
  $ I^(*) gamma = rho^(- 4) #scale(x: 120%, y: 120%)[\(] I + O_k \( rho^(1 + epsilon.alt) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) U \( I \( y \) \) = - M rho + \( b_1 dot.op y \) rho + O_k \( rho^(2 + epsilon.alt) \) . $
  Derivatives of the angular matrix $R \( y \)$ cost the corresponding powers of $rho^(- 1)$, so the displayed metric estimate retains the symbol bounds. Dividing the expansion of $sinh \( U \/ 2 \)$ by $rho$, and using $epsilon.alt < 1$, gives
  #[#set math.equation(numbering: n => "(12.2)")
   $ I^(*) h_(-) = (M / 2)^4 [(1 - frac(4 b_1 dot.op y, M)) I + O_k \( rho^(1 + epsilon.alt) \)] . $ <q3:static:inverted-minus>]
  In particular, its only first-order term is linear and scalar.
  For the remainder $E \( y \)$, the bounds
  $ \| E \| lt.eq C rho^(1 + epsilon.alt) \, quad \| D E \| lt.eq C rho^epsilon.alt \, quad \| D^2 E \| lt.eq C rho^(epsilon.alt - 1) $
  show that $E \( 0 \) = D E \( 0 \) = 0$ extends it as $C^(1 \, epsilon.alt)$. To see the Hölder estimate between two points, use the gradient bound when their separation is comparable to their radii; otherwise integrate the Hessian along the short segment in a common annulus. Moreover choose
  $ 3 < p < frac(3, 1 - epsilon.alt) . $
  Then $D^2 E in L^p$. Integration by parts across small coordinate spheres has an error bounded by a constant times their area, because the first derivatives are bounded. It follows that the punctured classical derivatives are the weak derivatives of the extension. The Christoffel symbols are continuous with weak derivatives in $L^p$, so scalar curvature is its usual $L^p$ expression in $partial Gamma$ and $Gamma Gamma$. It vanishes off the point and therefore also as a distribution on the whole ball. There is no point curvature term. ◻
]

=== 12.1 Zero-mass rigidity with arbitrary remaining ends <q3:static:spin-subsection>

The static equations and end expansion are now established. We have not yet proved that the stationary field is timelike throughout the original exterior. The next step closes precisely that gap. The completed conformal manifold can still have ends corresponding to an interior zero set. We need a rigidity statement that permits these ends, and also the regularity in Lemma 68. The smooth arbitrary-end positive mass theorem is established in #cite(label("CecchiniZeidler2024")) Theorem B. That formulation also credits the earlier spinor rigidity theorem of Bartnik and Chruściel #cite(label("BartnikChrusciel2005")) Theorem 11.2. In our scalar-flat situation the following direct spinor proof also handles the compactified point. It uses Witten’s identity #cite(label("Witten1981")); no asymptotic condition is imposed on any other end.

#thm([Lemma 12.2.])[
  (Scalar-flat rigidity at a faster-decaying end).  #emph[Let $\( W \, frak(g) \)$ be a connected orientable complete three-dimensional Riemannian manifold without boundary. Assume that its metric is locally $C^(1 \, alpha) ∩ W^(2 \, p)$, for some $alpha > 0 \, p > 3$, is scalar flat as a distribution, and has an end on which it is smooth with 
$ frak(g) = delta + O_2 \( r^(- 1 - epsilon.alt) \) \, #h(2em) epsilon.alt > 0 . $

 The other ends can be arbitrary. Then $\( W \, frak(g) \)$ is isometric to Euclidean space. The asserted regularity is sufficient at a compactified point and at a reflected hypersurface.]
] <q3:static:spin-rigidity>

#proof[
  An orientable three-manifold is spin. Choose a spin structure and use a smooth background metric to identify its spinor bundle with that for $frak(g)$. The positive square-root change of orthonormal frames has the stated metric regularity. The spin connection consequently has continuous locally bounded coefficients, with weak first derivatives in $L_(upright("loc"))^p$. Write $nabla^S$ for that connection, $D$ for the Dirac operator, and $c$ for Clifford multiplication.
  The weak Lichnerowicz formula has the following integrated form for every compactly supported $H^1$ spinor $phi.alt$:
  #[#set math.equation(numbering: n => "(12.3)")
   $ parallel D phi.alt parallel_2^2 = parallel nabla^S phi.alt parallel_2^2 . $ <q3:static:lichnerowicz>]
  Here and below norms and integrals are for $frak(g)$. To check the formula at the indicated regularity, first use a smooth compactly supported spinor. Approximate the metric on its support in $C^1$ and $W^(2 \, p)$ by smooth metrics, using the same background-bundle identification. The smooth Lichnerowicz formula passes to the limit: connection coefficients converge uniformly and scalar curvatures converge in $L^p$. The limiting scalar term is zero by the assumed distributional scalar flatness and the $L^p$ curvature expression. Density then proves Equation (12.3) for compact $H^1$ spinors. Thus no integration surface is retained around the compactified point.
  We next establish the coercivity needed to complete compact spinors. For a compactly supported scalar function $f$ on the AE end, one-dimensional integration by parts along coordinate rays gives
  #[#set math.equation(numbering: n => "(12.4)")
   $ integral_(r_0)^oo f^2 thin upright(d) r lt.eq 4 integral_(r_0)^oo r^2 \| partial_r f \|^2 thin upright(d) r . $ <q3:static:radial-hardy>]
  The inner boundary term has the favorable sign. Apply this to $f = \| phi.alt \|$ and integrate over angles. Metric comparability and $\| thin upright(d) \| phi.alt \| \| lt.eq \| nabla^S phi.alt \|$ give
  #[#set math.equation(numbering: n => "(12.5)")
   $ integral_(upright("AE")) r^(- 2) \| phi.alt \|^2 thin upright(d) V_(frak(g)) lt.eq C parallel nabla^S phi.alt parallel_2^2 . $ <q3:static:spin-hardy>]
  For any fixed compact $K subset W$, connect it to a fixed end annulus by a relatively compact connected domain. Poincaré’s inequality with the norm on that annulus retained gives
  $ parallel \| phi.alt \| parallel_(L^2 \( K \)) lt.eq C_K (parallel thin upright(d) \| phi.alt \| parallel_(L^2 \( upright("domain") \)) + parallel phi.alt parallel_(L^2 \( upright("annulus") \))) . $
  For example, this version follows from the ordinary Poincaré inequality after subtracting the mean; the observed annulus controls that mean because it has positive measure. Equation (12.5) controls its last term. We have proved
  #[#set math.equation(numbering: n => "(12.6)")
   $ parallel phi.alt parallel_(L^2 \( K \)) lt.eq C_K parallel nabla^S phi.alt parallel_2 . $ <q3:static:local-coercivity>]
  Connectedness is the only global input in this propagation.
  Let $cal(H)$ be the completion of compactly supported smooth spinors in the norm $parallel nabla^S phi.alt parallel_2$. Equation (12.6) embeds $cal(H)$ in $L_(upright("loc"))^2$, and the locally bounded connection then embeds it in $H_(upright("loc"))^1$. Both $nabla^S : cal(H) arrow.r L^2$ and $D : cal(H) arrow.r L^2$ are well-defined, and Equation (12.3) makes the latter an isometry. Its range is therefore closed. Equation (12.5) also passes to this completion. The local constants may depend on the chosen compact set; no uniform estimate over the remaining ends is required.
  Fix the ordinary orthonormalized coordinate frame on the distinguished end and a smooth cutoff $theta$, equal to one near infinity and zero before a slightly smaller end neighborhood. For each constant spinor $z in bb(C)^2$, set $psi_0 = theta z$. Because the connection there is $O \( r^(- 2 - epsilon.alt) \)$, $nabla^S psi_0 \, D psi_0 in L^2$. Orthogonally project $D psi_0$ onto the closed subspace $D cal(H)$ and choose $eta in cal(H)$ such that
  $ D eta = - "proj"_(D cal(H)) \( D psi_0 \) . $
  Set $psi = psi_0 + eta$, $w = D psi$. Then $w in L^2$ and
  $ integral chevron.l w \, D phi.alt chevron.r thin upright(d) V_(frak(g)) = 0 quad upright("for every compact smooth ") phi.alt . $
  Thus $D w = 0$ weakly. Local elliptic regularity for a first-order elliptic operator with locally Lipschitz principal coefficients and bounded lower-order coefficients gives $w in H_(upright("loc"))^1$. This regularity can also be seen by freezing the principal coefficients on small coordinate balls: the constant-coefficient Dirac estimate controls one derivative in $L^2$, the oscillation is absorbed, and commutators of mollification are bounded by the local Lipschitz norm. Apply the estimate to regularized $w$ and pass to a weak limit. The metric in the lemma has more than this coefficient regularity.
  Completeness supplies compactly supported Lipschitz distance cutoffs $chi_R$, equal to one on the radius-$R$ ball and with $\| thin upright(d) chi_R \| lt.eq C \/ R$. Indeed a complete locally compact Riemannian length space is proper, and a piecewise linear cutoff of its distance has these properties. Equation (12.3) applies to $chi_R w$, and the weak equation gives
  $ parallel nabla^S \( chi_R w \) parallel_2^2 = parallel D \( chi_R w \) parallel_2^2 = parallel c \( thin upright(d) chi_R \) w parallel_2^2 lt.eq C / R^2 parallel w parallel_2^2 . $
  On every fixed compact set the cutoff eventually equals one. It follows that $nabla^S w = 0$. A parallel spinor has constant length on the connected manifold; the distinguished end has infinite volume, so $w in L^2$ forces $w = 0$. No condition at another end entered this argument.
  It remains to show that $psi$, rather than just $D psi$, is parallel. Define the continuous sesquilinear form
  $ cal(B) \( a \, b \) = integral (chevron.l nabla^S a \, nabla^S b chevron.r - chevron.l D a \, D b chevron.r) thin upright(d) V_(frak(g)) $
  on fields for which the indicated derivatives are in $L^2$. For compact $phi.alt$, the polarized Lichnerowicz identity, with one slot compactly supported, gives $cal(B) \( psi_0 \, phi.alt \) = 0$. Approximate $eta$ in $cal(H)$ by compact spinors. These limits use the global derivative norms; no boundary flux of $eta$ at another end is invoked. Continuity and Equation (12.3) imply
  $ cal(B) \( psi_0 \, eta \) = 0 \, #h(2em) cal(B) \( eta \, eta \) = 0 \, #h(2em) cal(B) \( psi \, psi \) = cal(B) \( psi_0 \, psi_0 \) . $
  The last expression is zero. To see this directly, integrate the Lichnerowicz identity for $psi_0$ up to a large end sphere. There is no contribution at another end because $psi_0$ vanishes there. On that sphere $psi_0 = O \( 1 \)$ and $nabla^S psi_0 \, D psi_0 = O \( r^(- 2 - epsilon.alt) \)$; the boundary integral is $O \( r^(- epsilon.alt) \)$ and tends to zero. This is also the zero ADM boundary term of the spin proof. Since $D psi = w = 0$, we conclude that $parallel nabla^S psi parallel_2^2 = 0$.
  The parallel equation gives each resulting spinor a $C_(upright("loc"))^(1 \, beta)$ representative for some $beta > 0$. Indeed, $H^1 subset L^6$ and the locally bounded connection first give $W^(1 \, 6)$, hence local Hölder continuity; the locally Hölder connection coefficients then make its first derivatives Hölder. Write $psi_z$ for this parallel spinor. The fixed cutoff, orthogonal projection, and inverse of $D : cal(H) arrow.r D cal(H)$ make $z mapsto psi_z$ complex linear. For any point $p in W$, consider
  $ E_p : bb(C)^2 arrow.r bb(S)_p \, #h(2em) E_p \( z \) = psi_z \( p \) \, $
  where $bb(S)_p$ is the complex spinor fiber. If $E_p \( z \) = 0$, parallelism and connectedness give $psi_z = 0$ everywhere. Then $eta = - theta z$, which for $z eq.not 0$ has infinite $r^(- 2)$-weighted $L^2$ norm on the distinguished end, contrary to Equation (12.5). Thus $E_p$ is injective for every $p$, and it is an isomorphism because the complex spinor rank is two. The images of a basis of $bb(C)^2$ form a global parallel spinor frame.
  Its Hermitian Gram matrix is constant and positive definite; a constant change of basis makes the frame orthonormal. The weak curvature equations annihilate this frame, so the spin curvature vanishes. Faithfulness of the spin representation on $frak(s p i n) \( 3 \)$ gives zero Riemann curvature. Moreover, Clifford multiplication identifies the real tangent bundle with the traceless skew-Hermitian endomorphisms of the spinor bundle. Three fixed orthonormal matrices in this parallel spinor frame, with matrix inner product $- 1 / 2 "tr" \( A B \)$, therefore give a global parallel orthonormal tangent frame. The dual coframe is closed by torsion-freeness and integrates locally to coordinates in which the metric is exactly Euclidean. This also removes any apparent metric singularity at the compactified point.
  Finally, completeness makes the universal flat cover Euclidean $bb(R)^3$. The global parallel frame makes its deck transformations translations. A nontrivial discrete translation group has rank at least one, and a quotient by it has volume growth at most quadratic. The distinguished AE end gives a cubic lower bound: radial paths in that end put a Euclidean annulus of radius comparable to $R$ inside a metric ball of radius $C R$. The two volume bounds are incompatible. The deck group is therefore trivial, proving the lemma. ◻
]

#thm([Lemma 12.3.])[
  (The infinity component has no interior missing boundary).  #emph[The component $cal(E)$ is all of $Omega$. In particular $N > 0$ everywhere in the open exterior and the stationary metric is vacuum there.]
] <q3:static:no-internal-null>

#proof[
  The complete base of Lemma 66 reaches every component of $S$. Take its complete two-copy double, use $h_(+)$ on the plus copy and $h_(-)$ on the minus copy, and identify corresponding boundary points. The signed reflected lapse expresses the joined metric as
  $ q = (frac(1 + lambda_(upright("signed")), 2))^4 h_(upright(d)) . $
  It is smooth at each positive-lapse join and $C^2$ at each zero-lapse join. The matched second jets make its scalar curvature zero across every join, as well as on the two open sides. Compactify the unique AF end of the minus copy by Lemma 68.
  We verify completeness of this conformal manifold without placing any restriction on the number or regularity of the possible internal-null ends. On the plus copy the factor $\( 1 + lambda \) \/ 2$ is at least $1 \/ 2$. Fix a sufficiently large original AF tail. On its complement the continuous function $sqrt(N)$ is defined on a compact subset of the original closed exterior, equals zero on $S$ and the internal zero set, and is strictly less than one elsewhere by Lemma 66. Its maximum on this compact set is therefore some $a_0 < 1$. Thus on the entire corresponding minus remainder $\( 1 - lambda \) \/ 2 gt.eq \( 1 - a_0 \) \/ 2 > 0$ uniformly. On the double away from the minus AF tail the conformal metric is consequently bounded below by a fixed positive multiple of the complete doubled base metric. All joins are already attached. A finite-length escape can therefore only run down the minus AF tail, and its proved nondegenerate one-point compactification supplies its limit. More explicitly, truncate that tail at a large sphere. The other side of the sphere is complete with compact boundary by the uniform lower bound, and the compactified tail is a compact metric region with that same boundary; their gluing is complete.
  The conformal manifold is connected, orientable, and without boundary. It has local $C^(1 \, alpha) ∩ W^(2 \, p)$ regularity for some $alpha > 0$ and $p > 3$: the finitely many joins are at least $C^2$, and the sole compactification point has the regularity established in Lemma 68. Its scalar curvature is zero distributionally, including at that point, and its distinguished plus end has the fast decay required by Lemma 69. That lemma makes this entire manifold Euclidean space.
  Choose a sufficiently large sphere in the distinguished plus end. Under the Euclidean isometry it is a compact embedded sphere. Its end tail is the unbounded component of the complement: paths from large end radii to that sphere have lengths tending to infinity, and the tail has precisely that sphere as frontier. The other component is bounded and has compact closure. A sequence in $cal(E)$ approaching an interior point with $N = 0$ lies outside the chosen end tail and escapes every compact set of the complete conformal manifold. Indeed it cannot converge at an ordinary plus point by continuity of $N$, cannot converge on any joined component because every original boundary collar has no interior zero, and cannot converge at a point in the open minus copy or its compactified end. Such a sequence is impossible in the compact Euclidean complement. Thus $cal(E)$ has no interior boundary in $Omega$.
  It is a nonempty open and closed subset of connected $Omega$, and hence equals $Omega$. Vacuum now follows from Proposition 58, since $N > 0$ everywhere in $Omega$. ◻
]

#thm([Lemma 12.4.])[
  (Equality forces a single spherical boundary component).  #emph[In the Euclidean conformal double, every original component $S_i$ is a round sphere of radius $a = \( 8 kappa \)^(- 1)$ and has original area $\| S_i \|_g = 16 pi m^2 = \| S \|_g$. Consequently $ell = 1$.]
] <q3:static:one-boundary-component>

#proof[
  The completed conformal double in the proof of Lemma 70 is Euclidean. In particular its plus metric $q = h_(+)$ is flat up to every original boundary component. Put $phi.alt = \( 1 + lambda \) \/ 2$. On each $S_i$, Lemma 66 gives
  $ phi.alt = 1 / 2 \, #h(2em) partial_(nu_h) log phi.alt = kappa \, #h(2em) upright("II")_h = 0 \, #h(2em) h \|_(T S_i) = g \|_(T S_i) . $
  The conformal second-fundamental-form formula, with normal pointing into the plus side, is therefore
  $ upright("II")_q = phi.alt^2 #scale(x: 120%, y: 120%)[\(] upright("II")_h + 2 partial_(nu_h) log phi.alt thin h \|_(T S_i) #scale(x: 120%, y: 120%)[\)] = 8 kappa thin q \|_(T S_i) \, #h(2em) q \|_(T S_i) = 1 / 16 g \|_(T S_i) . $
  Let $F_i$ be the Euclidean position vector on $S_i$ and $nu_i$ its unit normal into the plus side. Its shape operator is $8 kappa I$, so the tangential differential of $F_i - a nu_i$ is zero for $a = \( 8 kappa \)^(- 1)$. Connectedness makes $F_i - a nu_i$ a constant point $c_i$. Thus the image lies on the sphere of radius $a$ centered at $c_i$, with $nu_i$ its outward radial normal. The image is open in that sphere by local invertibility and closed by compactness, hence is the whole sphere. The Euclidean embedding therefore identifies $S_i$ diffeomorphically with it. Since $q \|_(T S_i) = g \|_(T S_i) \/ 16$, its area satisfies
  #[#set math.equation(numbering: n => "(12.7)")
   $ \| S_i \|_g = 16 \| S_i \|_q = 64 pi a^2 = pi / kappa^2 = 16 pi m^2 = \| S \|_g . $ <q3:static:individual-boundary-area>]
  Summing over the finite family yields $\| S \|_g = sum_(i = 1)^ell \| S_i \|_g = ell \| S \|_g$. The boundary is nonempty and $\| S \|_g > 0$, hence $ell = 1$. In particular no connectedness or spherical topology assumption was needed before this step. ◻
]

#thm([Lemma 12.5.])[
  (Identification of the base and its mass).  #emph[The regular completion of $\( Omega \, h \, lambda \)$ is the Schwarzschild static exterior 
#[#set math.equation(numbering: n => "(12.8)")
 $ h = (1 + a / rho)^4 delta \, #h(2em) lambda = frac(1 - a \/ rho, 1 + a \/ rho) \, #h(2em) rho gt.eq a \, $ <q3:static:isotropic-base>]

 where $a = m \/ 2$. The completion is homeomorphic to the original $M_(upright("ext"))$, and $S$ is identified diffeomorphically with its horizon sphere in the regular base boundary structure.]
] <q3:static:schwarzschild-base>

#proof[
  Lemma 71 identifies the boundary in the Euclidean conformal double as one round sphere of radius $a = \( 8 kappa \)^(- 1)$. The plus side is its outside: its normal is the outward radial normal, its entire boundary is this sphere, and it contains the distinguished unbounded end. Center Euclidean coordinates at this sphere and write $rho$ for their radius.
  In the resulting Euclidean coordinates, write $psi = 2 \/ \( 1 + lambda \)$, so $h = psi^4 delta$. The scalar-flat conformal equation gives $Delta_delta psi = 0$ outside the sphere, with $psi = 2$ on it and $psi arrow.r 1$ at infinity. The function $1 + a \/ rho$ has the same data. Their difference vanishes by the exterior maximum principle. This proves Equation (12.8). Its Schwarzschild mass is $2 a = \( 4 kappa \)^(- 1) = m$, since $kappa = 1 \/ \( 4 m \)$. In particular $a = m \/ 2$.
  The regular base collar has the same underlying boundary topology as the original collar, even when its coordinate is $lambda = sqrt(N)$ instead of the original defining function $N$. Together with the unchanged interior this identifies its completion homeomorphically with $M_(upright("ext"))$. An interior base isometry extends uniquely to the metric completions. On the regular boundary structures it is smooth: its boundary restriction preserves induced lengths, hence is a smooth boundary isometry, and normal geodesic coordinates extend it smoothly to a collar. Thus the completion has the claimed global topology, and $Omega tilde.equiv \( a \, oo \) times S^2$ is simply connected. ◻
]

=== 12.2 The time graph and the Kruskal attachment <q3:static:embedding-subsection>

#proof[
  Lemma 71 proves $ell = 1$ and the spherical topology of $S$. Lemma 70 proves $N > 0$ on $Omega$, and Lemma 72 gives the global static base with mass $m$. For the reconstruction write $M = m$, so $kappa = 1 \/ \( 4 M \)$. Simple connectivity and Lemma 66 give a global smooth function $H$ with
  #[#set math.equation(numbering: n => "(12.9)")
   $ thin upright(d) H = - A . $ <q3:static:time-primitive>]
  In static Schwarzschild coordinates use time $T = t + H \( x \)$. Equations (11.4) and (12.9) give the exact identity
  #[#set math.equation(numbering: n => "(12.10)")
   $ - N thin upright(d) T^2 + h = - u^2 thin upright(d) t^2 + g_(i j) \( thin upright(d) x^i + X^i thin upright(d) t \) \( thin upright(d) x^j + X^j thin upright(d) t \) . $ <q3:static:reconstructed-metric>]
  The graph $T = H \( x \)$, corresponding to $t = 0$, therefore induces the original metric $g$. The stationary future unit normal is $n = \( partial_t - X \) \/ u$. With the second-fundamental-form convention of the theorem,
  #[#set math.equation(numbering: n => "(12.11)")
   $ K_(upright("graph")) = frac(1, 2 u) #scale(x: 120%, y: 120%)[\(] partial_t g - cal(L)_X g #scale(x: 120%, y: 120%)[\)] = - frac(1, 2 u) cal(L)_X g = K . $ <q3:static:reconstructed-k>]
  This calculation recovers the original $K$, including a non-time-symmetric slice.
  We next establish smoothness in the original boundary structure. If $u \|_S = 0$, Equation (11.10) gives
  $ A = frac(Y^flat, a^2 - s^2 \| Y \|_g^2) . $
  This is smooth in the original collar. The primitive $H$ therefore extends smoothly and finitely to $S$. For instance, fix its values on one interior collar section and integrate its smooth normal derivative to the boundary. Tangential derivatives of this extension agree with those prescribed by $thin upright(d) H = - A$, by continuity from the interior.
  If $u \|_S > 0$, the numerator $X^flat - \( 2 kappa \)^(- 1) thin upright(d) N$ vanishes as a one-form on $S$, by Equation (11.8). Smooth division by the defining function $N$ gives
  #[#set math.equation(numbering: n => "(12.12)")
   $ A = frac(1, 2 kappa) thin upright(d) log N + beta \, #h(2em) H = - frac(1, 2 kappa) log N + B \, $ <q3:static:log-time>]
  where $beta$ and $B$ are smooth in the original collar. The smoothness of $B$ follows by applying the same normal-integration argument to its differential $- beta$. In this case $H arrow.r + oo$ at the boundary, so static time itself is not a regular attachment coordinate.
  Let $r$ be the Schwarzschild area radius. On the whole exterior
  $ N = 1 - frac(2 M, r) \, #h(2em) r = frac(2 M, 1 - N) . $
  Normalize the tortoise coordinate and Kruskal coordinates by
  #[#set math.equation(numbering: n => "(12.13)")
   $ r_(*) & = r + 2 M log (frac(r, 2 M) - 1) \,\
sans(U) & = - e^(- kappa \( T - r_(*) \)) \, & sans(V) & = e^(kappa \( T + r_(*) \)) . $ <q3:static:kruskal-definitions>]
  On the right exterior $sans(U) < 0 \, sans(V) > 0$, and the Schwarzschild metric extends as
  $ upright(bold(g))_M = - frac(32 M^3, r) e^(- r \/ \( 2 M \)) thin upright(d) sans(U) thin thin upright(d) sans(V) + r^2 thin upright(d) omega^2 . $
  An exact useful form of Equation (12.13) is
  #[#set math.equation(numbering: n => "(12.14)")
   $ sans(U) = - Q \( N \) sqrt(N) thin e^(- kappa T) \, #h(2em) sans(V) = Q \( N \) sqrt(N) thin e^(kappa T) \, #h(2em) Q \( N \) = frac(exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 1 \/ \[ 2 \( 1 - N \) \] #scale(x: 120%, y: 120%)[\)], sqrt(1 - N)) . $ <q3:static:kruskal-factor>]
  The function $Q$ is smooth and positive near zero, with $Q \( 0 \) = sqrt(e)$.
  If $u \|_S = 0$, both $H$ and $sqrt(N) = s sqrt(a^2 - s^2 \| Y \|^2)$ are smooth. Substitution into Equation (12.14) gives $sans(U) = sans(V) = 0$ on $S$ and
  $ partial_s sans(U) \|_S = - sqrt(e) thin kappa e^(- kappa H \|_S) < 0 \, #h(2em) partial_s sans(V) \|_S = sqrt(e) thin kappa e^(kappa H \|_S) > 0 . $
  This is a smooth attachment at the bifurcation sphere. If $u \|_S > 0$, Equation (12.12) instead gives
  #[#set math.equation(numbering: n => "(12.15)")
   $ sans(U) = - Q \( N \) N e^(- kappa B) \, #h(2em) sans(V) = Q \( N \) e^(kappa B) . $ <q3:static:future-attachment>]
  These are smooth in the original collar; $sans(U)$ vanishes simply and $sans(V) \|_S = sqrt(e) thin e^(kappa B \|_S) > 0$. Thus the attachment is on the future horizon, with each generator met once after the angular identification.
  The angular regularity requires a further check when $u \|_S > 0$, because the regular base coordinate was $lambda$, not the original $N$. On the smooth reflected collar in Equation (11.9), normal projection onto its fixed boundary is invariant under $lambda mapsto - lambda$. This follows from uniqueness of the normal geodesics and reflection invariance of the metric. Schwarzschild angular coordinates are constant along these normal geodesics, and their boundary values are the smooth round-sphere identification from Lemma 72. They are therefore smooth even functions of $lambda$. A smooth even function, with smooth tangential parameters, is a smooth function of $N = lambda^2$ for $N gt.eq 0$: all odd Taylor coefficients vanish, and repeated application of $\( 2 lambda \)^(- 1) partial_lambda$ to the Taylor remainder gives continuous derivatives of every order at zero. This proves the required angular smoothness in the original collar. In the zero boundary-lapse case the original collar is already a smooth base collar, so its completed base isometry supplies the angular extension directly.
  We have constructed a smooth map $iota : M_(upright("ext")) arrow.r$ Schwarzschild. Equation (12.10) extends to $S$ by continuity, hence $iota^(*) upright(bold(g))_M = g$ there as well. The positive definiteness of $g$ proves that $thin upright(d) iota$ is injective at every boundary point. Interior injectivity follows from the global base isometry; boundary injectivity follows from the sphere identification. The boundary image, at $r = 2 M$, is disjoint from the open image, where $r > 2 M$. The map is proper: a compact subset of Schwarzschild has bounded area radius, and its inverse image is closed in the compact base region corresponding to $\[ 2 M \, R \] times S^2$. Thus the injective immersion is an embedding.
  The future normal extends smoothly even where $u = 0$. To avoid taking a limit of the expression involving $u^(- 1)$, choose the smooth future timelike Kruskal vector $Z = partial_(sans(U)) + partial_(sans(V))$ near the boundary. Let $Z^top$ be its tangential projection along the embedded spacelike hypersurface and set
  $ hat(n) = frac(Z - Z^top, sqrt(- upright(bold(g))_M \( Z - Z^top \, Z - Z^top \))) . $
  The denominator is positive, and this is a smooth future unit normal. On the open exterior it agrees with the normal used in Equation (12.11). Its second fundamental form is smooth and equals $K$ in the interior, so equality extends to $S$.
  There is also a smooth spacelike extension of the image through its boundary. In the positive boundary-lapse case, use $\( sans(U) \, omega \)$ as hypersurface coordinates; its normal derivative is nonzero by Equation (12.15). The remaining null coordinate is a smooth graph function and can be extended across $sans(U) = 0$. In the zero boundary-lapse case use $\( chi \, omega \)$, where $chi = \( sans(V) - sans(U) \) \/ 2$; the displayed normal derivatives give $partial_s chi > 0$. Again extend the remaining graph function across zero. Smooth one-sided graph functions extend across a smooth boundary, and compactness of $S$, together with openness of the spacelike condition, preserves spacelikeness on a sufficiently short collar. This extension makes no assertion about the original data behind $S$.
  Finally, the exact inverse-metric identity gives
  #[#set math.equation(numbering: n => "(12.16)")
   $ \| thin upright(d) H \|_h^2 = lr(|X^flat / N|)_C^2 = frac(\| X \|_g^2, u^2 N) arrow.r frac(\| b \|^2, \( b^0 \)^2) < 1 . $ <q3:static:end-slope>]
  Choose a constant $a_0 < 1$ larger than the limiting slope norm. Along radial rays in the Schwarzschild base, uniformly in angle,
  $ \| H \( r \, omega \) \| lt.eq C + a_0 integral_R^r frac(thin upright(d) rho, sqrt(1 - 2 M \/ rho)) = a_0 r + O \( log r \) . $
  Since $r_(*) = r + O \( log r \)$, it follows that
  $ H - r_(*) arrow.r - oo \, #h(2em) H + r_(*) arrow.r + oo . $
  This is approach to the chosen Schwarzschild spatial infinity. It allows a nonzero asymptotic tilt and does not impose $P = 0$ or $K = 0$. All conclusions of Proposition 65 follow. ◻
]

Propositions 58 and 65 prove Theorem 53. They also prove Theorem 54: the connected-case argument in Lemma 62 supplies the same localized multiplier identity, and all subsequent adjoint, static, and reconstruction steps use that identity rather than partial-coincidence outermostness.

== 13 A local spinor obstruction to two horizon spheres <q3:local-spinor:section>

We give an independent proof of the two-sphere strictness conclusion. It uses the complete static base from Section 11 and its end estimates, without the global classification in Section 12. The reason is local: a conformal change makes the base flat near each horizon, and the common surface gravity then fixes the area of each sphere. Under equality, that area is already the entire permitted horizon area. We obtain the local flatness by solving Dirac equations on a family of complete metrics and taking a nonzero parallel-spinor limit.

#thm([Theorem 13.1.])[
  (Strictness for two spherical components).  #emph[Let $\( M \, g \, K \)$ be smooth connected orientable three-dimensional initial data without boundary, with $g$ complete and with finitely many asymptotically flat ends outside a compact set. Assume on every end 
$ g - delta = O_2 \( r^(- q) \) \, #h(2em) K = O_1 \( r^(- 1 - q) \) \, #h(2em) q > 1 / 2 \, $

 integrable constraint densities $mu \, \| J \|_g$, finite ADM charges, and $mu gt.eq \| J \|_g$ everywhere. Here $16 pi mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2$ and $8 pi J = "div"_g \( K - \( "tr"_g K \) g \)$. Let $S_1 \, S_2$ be disjoint smooth embedded two-sided spheres, and suppose that the closure $Omega$ of the connected exterior toward a designated end has boundary $S = S_1 union.sq S_2$ and exactly that one end.]
  #emph[Orient $S$ into $Omega$. Assume $theta_(+) = H + "tr"_S K = 0$ on $S$, and assume every full enclosing cut has area at least $A = \| S_1 \|_g + \| S_2 \|_g$. A full cut is the entire compact smooth frontier of a connected end-containing outer domain, with all components and coincident portions of $S$ counted and bounded complementary pockets filled. Finally assume there is no such cut $Gamma eq.not S$ whose components either equal an $S_i$ or lie wholly in the open exterior, with at least one component in the open exterior and $theta_(+) \( Gamma \) lt.eq 0$ toward the designated end. If that end has $E > \| P \|_delta$, then 
$ sqrt(E^2 - \| P \|_delta^2) > sqrt(frac(\| S_1 \|_g + \| S_2 \|_g, 16 pi)) . $

]
] <q3:local-spinor:strictness>

The partial coincidence permitted in the last hypothesis excludes replacing only one horizon component by a weakly trapped exterior component while leaving the other in place. It is exactly the outermostness used to localize the variational area sources. The strict inequality is qualitative; it gives no uniform positive gap.

Write $m = sqrt(E^2 - \| P \|_delta^2) > 0$. The original exterior is complete with its smooth boundary included: an intrinsic Cauchy sequence has a limit in the closed subset $Omega$ of the complete ambient manifold, and a smooth half-ball chart at a boundary limit gives intrinsic convergence. All constraint and end hypotheses restrict to $Omega$. Proposition 51 therefore applies. Since $S$ itself is a full cut, outer area minimization identifies its cut infimum with $A$, and the numerical inequality gives $m gt.eq sqrt(A \/ \( 16 pi \))$. It remains to exclude

#[#set math.equation(numbering: n => "(13.1)")
 $ A = 16 pi m^2 . $ <q3:local-spinor:equality>]

Assume this equality for the remainder of the argument. We use the original-data variational and static-base results only up to the completion and harmonic-coordinate lemmas. The global classification and hypersurface reconstruction play no role in the proof below.

=== 13.1 The complete metrics used in the limiting argument <the-complete-metrics-used-in-the-limiting-argument>

Proposition 58 supplies the causal stationary field on the original exterior with the same constant $kappa = 1 \/ \( 4 m \)$ at both boundary components. The localization of the area sources in Lemma 62 uses precisely the assumed partial-coincidence outermostness. Lemma 66 then supplies vanishing twist, a connected positive set $cal(P) = { N > 0 }$, the complete static base and its two-copy double. Its construction does not use the exclusion of the internal null set or the Euclidean classification. In particular, an internal null set may still give additional complete ends here.

Denote the double by $W$, its metric by $h_(upright(d))$, and its signed lapse by $lambda_(upright(d))$. It is a connected orientable smooth manifold without boundary. The metric and signed lapse are $C^2$, the metric is complete, and

#[#set math.equation(numbering: n => "(13.2)")
 $ R_(h_(upright(d))) = 0 \, #h(2em) Delta_(h_(upright(d))) lambda_(upright(d)) = 0 \, #h(2em) \| lambda_(upright(d)) \| < 1 . $ <q3:local-spinor:double-input>]

On the plus interior they equal the smooth fields $h \, lambda$. At each attached sphere, for the normal $nu_h$ into the plus side,

#[#set math.equation(numbering: n => "(13.3)")
 $ lambda = 0 \, #h(2em) upright("II")_h = 0 \, #h(2em) h \|_(T S_i) = g \|_(T S_i) \, #h(2em) nu_h lambda = kappa = frac(1, 4 m) \, #h(2em) i = 1 \, 2 . $ <q3:local-spinor:horizon-input>]

To obtain complete scalar-flat metrics whose end energy tends to zero, define, for $0 < t < 1$,

#[#set math.equation(numbering: n => "(13.4)")
 $ q_t = (frac(1 + t lambda_(upright(d)), 1 + t))^4 h_(upright(d)) \, #h(2em) q_(*) = (frac(1 + lambda_(upright(d)), 2))^4 h_(upright(d)) . $ <q3:local-spinor:family>]

For fixed $t < 1$, its conformal factor satisfies

$ 0 < frac(1 - t, 1 + t) < frac(1 + t lambda_(upright(d)), 1 + t) < 1 . $

Consequently $q_t$ is complete. The three-dimensional conformal scalar-curvature identity

$ R_(phi.alt^4 h) = phi.alt^(- 5) \( - 8 Delta_h phi.alt + R_h phi.alt \) $

and Equation (13.2) make it scalar flat. The identity holds across the joins by their matching second jets. The metrics converge locally in $C^2$ to the positive metric $q_(*)$. The lower comparison constant above depends on $t$; no completeness of $q_(*)$ is used in this argument.

=== 13.2 Cancellation at the distinguished end <cancellation-at-the-distinguished-end>

Choose $1 \/ 2 < q_0 < min { q \, 1 }$. The harmonic-coordinate proof of Lemma 67, applied before any compactification or global classification, gives on the plus end

#[#set math.equation(numbering: n => "(13.5)")
 $ gamma = lambda^2 h = delta + O_1 \( r^(- 2 q_0) \) \, #h(2em) V = log lambda = a_oo / r + O_1 \( r^(- 2 q_0) \) $ <q3:local-spinor:improved-end>]

for a real constant $a_oo$. Indeed that proof uses $epsilon.alt = 2 q_0 - 1$, and its lapse expansion is stronger than the one displayed here. Its coordinate construction starts with the original two metric derivatives and then uses the static elliptic system to bootstrap; no higher original falloff is added.

The spinor construction below needs an estimate uniform in the conformal parameter. Fix $t_0 in \( 0 \, 1 \)$. On this end write

$ q_t = F_t \( V \)^4 gamma \, #h(2em) F_t \( v \) = frac(e^(- v \/ 2) + t e^(v \/ 2), 1 + t) . $

For $t_0 lt.eq t lt.eq 1$ and small $\| v \|$,

$ F_t \( 0 \) = 1 \, #h(2em) F'_t \( 0 \) = frac(t - 1, 2 \( 1 + t \)) \, #h(2em) \| F'_t \( v \) \| lt.eq C \( \( 1 - t \) + \| v \| \) . $

Equation (13.5) gives $\| V \| lt.eq C r^(- 1)$, $\| partial V \| lt.eq C r^(- 2)$, and $\| partial gamma \| lt.eq C r^(- 1 - 2 q_0)$. Hence, with $q_1 = q_(*)$,

#[#set math.equation(numbering: n => "(13.6)")
 $ \| partial q_t \| lt.eq C #scale(x: 120%, y: 120%)[\(] \( 1 - t \) r^(- 2) + r^(- 1 - 2 q_0) #scale(x: 120%, y: 120%)[\)] \, #h(2em) t_0 lt.eq t lt.eq 1 \, $ <q3:local-spinor:uniform-derivative>]

where $C$ is independent of $t$. Here $r^(- 3) lt.eq r^(- 1 - 2 q_0)$ for $r gt.eq 1$. These metrics are uniformly comparable to the Euclidean metric on a single fixed far end. More precisely, the same calculation gives the cancellation

#[#set math.equation(numbering: n => "(13.7)")
 $ \( q_t \)_(i j) = (1 + frac(2 a_oo \( t - 1 \), \( 1 + t \) r)) delta_(i j) + O_1 \( r^(- 2 q_0) \) \, $ <q3:local-spinor:leading-cancellation>]

uniformly in $t$. The derivative estimate will control all end errors in the spinor argument.

=== 13.3 Constructing spinors on the complete metrics <constructing-spinors-on-the-complete-metrics>

We use the Dirac method of Witten #cite(label("Witten1981")), constructing the spinors on the complete metrics $q_t$ before taking the local limit.

#thm([Lemma 13.2.])[
  (Spin structure and the compact energy identity).  #emph[The manifold $W$ admits a fixed spin structure. For any metric $q_t$ in Equation (13.4), its spin connection $nabla_t^S$, Dirac operator $D_t$, and Clifford multiplication $frak(c)_t$ satisfy 
#[#set math.equation(numbering: n => "(13.8)")
 $ parallel D_t zeta parallel_(L^2 \( q_t \))^2 = parallel nabla_t^S zeta parallel_(L^2 \( q_t \))^2 $ <q3:local-spinor:lichnerowicz>]

 for every compactly supported $H^1$ spinor $zeta$.]
] <q3:local-spinor:structure>

#proof[
  Every singular two-cycle with coefficients in $bb(Z) \/ 2$ has compact support and lies in the interior of a compact smooth three-dimensional submanifold $C subset W$ with boundary. The closed orientable double of $C$ is parallelizable by #cite(label("BenedettiLisca2018")) Theorem 1.1. Naturality therefore shows that $w_2 \( T W \)$ evaluates trivially on this cycle. Duality between cohomology and homology over the field $bb(Z) \/ 2$ gives $w_2 \( T W \) = 0$. Together with orientability this is the spin-structure criterion; see #cite(label("LawsonMichelsohn1989")) Chapter II, Sections 1–2. This argument applies directly to the possibly noncompact $W$.
  Fix one such spin structure. Positive square roots of the changes of metric identify the oriented orthonormal-frame bundles and their spinor bundles. We choose the lifts continuously in $t$; on compact sets these identifications and the metric coefficients converge in $C^2$ as $t arrow.t 1$. On the distinguished end the orthonormalized coordinate frame has a spin lift because that end is simply connected. We choose these lifts consistently throughout the family.
  We use the Clifford convention $frak(c)_t \( Y \) frak(c)_t \( Z \) + frak(c)_t \( Z \) frak(c)_t \( Y \) = - 2 q_t \( Y \, Z \)$; Clifford multiplication by a real tangent vector is skew-adjoint and has norm $\| Y \|_(q_t)$. The local spin-curvature formula and the curvature symmetries yield
  $ D_t^2 = \( nabla_t^S \)^(*) nabla_t^S + 1 / 4 R_(q_t) \; $
  the standard computation and formal adjoint identities are given in #cite(label("LawsonMichelsohn1989")) Chapter II, Sections 4–5 and 8. Integrating this identity for a compact test spinor proves Equation (13.8) for smooth scalar-flat metrics. For the present $C^2$ metric, smooth it in $C^2$ on a neighborhood of the test support and use the positive-square-root bundle identifications. The connections and Dirac coefficients converge, and the scalar curvatures converge uniformly to zero. Passing to the limit proves the identity for smooth compact test spinors. Density in local $H^1$ then proves the stated form. The joined spheres are interior surfaces of the $C^2$ metric on $W$, so this calculation has no boundary at a joined sphere. ◻
]

#thm([Lemma 13.3.])[
  (Coercivity from one end).  #emph[Fix $t_0 in \( 0 \, 1 \)$ and a sufficiently large end radius $r_0$. For every compactly supported $H^1$ spinor $zeta$ and $t_0 lt.eq t < 1$, 
#[#set math.equation(numbering: n => "(13.9)")
 $ integral_(r gt.eq r_0) r^(- 2) \| zeta \|^2 thin d V_(q_t) lt.eq C parallel nabla_t^S zeta parallel_(L^2 \( q_t \))^2 . $ <q3:local-spinor:hardy>]

 For every fixed compact $K subset W$ there is also a constant $C_K$, independent of $t$, such that 
#[#set math.equation(numbering: n => "(13.10)")
 $ parallel zeta parallel_(L^2 \( K \, q_t \)) lt.eq C_K parallel nabla_t^S zeta parallel_(L^2 \( W \, q_t \)) . $ <q3:local-spinor:local-coercivity>]

 In fixed local bundle identifications the corresponding local $H^1$ norm is bounded by the same global derivative norm.]
] <q3:local-spinor:coercivity>

#proof[
  For a compactly supported absolutely continuous function on a ray, integration by parts gives
  $ integral_(r_0)^oo f^2 thin d r = - r_0 f \( r_0 \)^2 - 2 integral_(r_0)^oo r f f' thin d r lt.eq 2 (integral f^2 thin d r)^(1 \/ 2) (integral r^2 \| f' \|^2 thin d r)^(1 \/ 2) . $
  Consequently $integral f^2 lt.eq 4 integral r^2 \| f' \|^2$; the inner boundary term has the favorable sign without a prescribed inner trace. Apply this to $f = \| zeta \|$, integrate over directions, and use uniform metric comparability from Equation (13.6) and the Kato inequality $\| d \| zeta \| \|_(q_t) lt.eq \| nabla_t^S zeta \|_(q_t)$. This proves Equation (13.9), first for smooth spinors and then by $H^1$ approximation.
  Choose a fixed end annulus $cal(A)$ and a relatively compact connected smooth domain $G subset W$ containing both $K$ and $cal(A)$. The scalar Poincaré inequality with an anchored mean gives
  $ parallel f parallel_(L^2 \( G \)) lt.eq C_G #scale(x: 120%, y: 120%)[\(] parallel d f parallel_(L^2 \( G \)) + parallel f parallel_(L^2 \( cal(A) \)) #scale(x: 120%, y: 120%)[\)] . $
  For completeness, subtract the mean of $f$ on $G$ and apply the usual Poincaré inequality; its restriction to $cal(A)$ bounds that mean by the two terms on the right. Take $f = \| zeta \|$. Equation (13.9) bounds its annular term, and Kato bounds its derivative. All norms on this fixed domain are uniformly equivalent as $t arrow.t 1$, since $q_t arrow.r q_(*)$ positively in $C^2$ there. This proves Equation (13.10). In a fixed local trivialization $partial zeta$ differs from $nabla_t^S zeta$ by a uniformly bounded connection matrix times $zeta$, which gives the last assertion. ◻
]

For corrections with uniformly bounded derivative norm, the preceding estimate gives local compactness and a uniform weighted bound on the distinguished end. That bound will later prevent the corrections from canceling a nonzero constant reference field on the whole end.

We take real parts of Hermitian inner products in the integral pairings that follow. For each fixed $t < 1$, complete the compact test spinors in the norm $parallel nabla_t^S dot.op parallel_2$ and call the resulting Hilbert space $cal(H)_t$. Lemma 75 identifies each element with a well-defined local $H^1$ spinor, and extends both coercivity inequalities to $cal(H)_t$. Equation (13.8) then makes

#[#set math.equation(numbering: n => "(13.11)")
 $ D_t : cal(H)_t arrow.r L^2 \( W \, q_t \) $ <q3:local-spinor:dirac-isometry>]

an isometry with closed image. The derivative and Dirac operator of a completed element agree with its distributional derivatives, by local $H^1$ convergence.

Choose a unit constant vector $sigma in bb(C)^2$ in the coordinate spin frame on the distinguished end and a smooth scalar cutoff which equals one for $r gt.eq 2 r_0$ and vanishes before $r = r_0$. Let $psi_(0 \, t)$ be the resulting spinor on $W$, extended by zero off this end neighborhood. Its covariant derivative on the far end is its spin connection acting on the fixed vector $sigma$. Thus Equation (13.6) implies

#[#set math.equation(numbering: n => "(13.12)")
 $ \| nabla_t^S psi_(0 \, t) \| + \| D_t psi_(0 \, t) \| lt.eq C #scale(x: 120%, y: 120%)[\(] \( 1 - t \) r^(- 2) + r^(- 1 - 2 q_0) #scale(x: 120%, y: 120%)[\)] \, #h(2em) parallel nabla_t^S psi_(0 \, t) parallel_2 + parallel D_t psi_(0 \, t) parallel_2 lt.eq C . $ <q3:local-spinor:reference-bounds>]

The second estimate also uses positive local $C^2$ convergence on the fixed cutoff annulus. For example, the tail of its square is bounded by a constant times $integral_(2 r_0)^oo \( \( 1 - t \)^2 r^(- 2) + r^(- 4 q_0) \) thin d r$. The reference field has finite derivative norms; it is not an element of $cal(H)_t$, since its weighted norm in Equation (13.9) is infinite.

#thm([Lemma 13.4.])[
  (A harmonic spinor with controlled correction).  #emph[For every $t_0 lt.eq t < 1$ there exists $zeta_t in cal(H)_t$ such that 
#[#set math.equation(numbering: n => "(13.13)")
 $ psi_t = psi_(0 \, t) + zeta_t \, #h(2em) D_t psi_t = 0 \, #h(2em) parallel nabla_t^S zeta_t parallel_2 lt.eq parallel D_t psi_(0 \, t) parallel_2 lt.eq C . $ <q3:local-spinor:projection-bound>]

]
] <q3:local-spinor:harmonic-spinor>

#proof[
  Project $- D_t psi_(0 \, t)$ orthogonally onto the closed image in Equation (13.11). The unique preimage is $zeta_t$, and the projection inequality gives the norm bound. The residual $w = D_t \( psi_(0 \, t) + zeta_t \) in L^2$ is orthogonal to $D_t cal(H)_t$, so formal symmetry against compact tests gives $D_t w = 0$ distributionally.
  We give the regularity step needed to test this equation. In a coordinate spin trivialization, $D_t = A^j \( x \) partial_j + B \( x \)$, where the principal coefficients are locally Lipschitz and $B$ is locally bounded. The Clifford relations make the principal symbol elliptic. Freezing $A^j$ at a point and applying the Fourier transform gives, for a smooth compact test vector in a sufficiently small chart,
  $ parallel v parallel_(H^1) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel D_t v parallel_(L^2) + parallel v parallel_(L^2) #scale(x: 120%, y: 120%)[\)] . $
  Indeed the constant symbol bounds $\| xi \| \| hat(v) \( xi \) \|$; the small oscillation of $A^j$ on the chart is absorbed into the left side, and the bounded zeroth-order coefficient contributes the $L^2$ term. This estimate applies to a localized weak solution by mollification. To see the necessary uniform bound, the commutator of $A^j partial_j$ with a mollifier has kernels involving $\( A^j \( x \) - A^j \( y \) \) partial_j rho_epsilon \( x - y \)$ and $\( partial_j A^j \) \( y \) rho_epsilon \( x - y \)$. Their $L^1$ norms are uniformly bounded by the Lipschitz norm of $A^j$. The commutator with $B$ is bounded on $L^2$ as well. For a compact localization $v$ of $w$, both $v$ and $D_t v$ are in $L^2$, so the mollified fields are uniformly $H^1$ on smaller charts and their weak limit is $v$. Hence $w in H_(upright("loc"))^1$. This is also the local regularity result in #cite(label("BartnikChrusciel2005")) Theorem 3.7; the present $C^2$ metric satisfies its coefficient hypotheses.
  For the fixed complete metric $q_t$, the length-space form of Hopf–Rinow makes closed metric balls compact #cite(label("BuragoBuragoIvanov2001")) Section 2.5. Distance from a fixed point therefore supplies compactly supported Lipschitz cutoffs $chi_R$ which equal one on the ball of radius $R$, vanish outside the ball of radius $2 R$, and satisfy $\| d chi_R \|_(q_t) lt.eq C \/ R$ almost everywhere. The product $chi_R w$ is compactly supported $H^1$. Since $D_t w = 0$, Equation (13.8) gives
  $ parallel nabla_t^S \( chi_R w \) parallel_2^2 = parallel frak(c)_t \( d chi_R \) w parallel_2^2 lt.eq C R^(- 2) parallel w parallel_2^2 . $
  Letting $R arrow.r oo$ shows on each compact set that $nabla_t^S w = 0$. Its length is constant on the connected $W$, by Kato or the metric compatibility of the connection. The distinguished end has infinite $q_t$ volume. Since $w in L^2$, this constant is zero, and $w = 0$ as required. ◻
]

=== 13.4 A nonzero parallel spinor in the local limit <a-nonzero-parallel-spinor-in-the-local-limit>

The harmonic spinors have uniformly bounded corrections. We now show that their total covariant-derivative energy tends to zero. This stronger estimate will make the local limit parallel, while the weighted bound on the correction will keep it nonzero.

#thm([Lemma 13.5.])[
  (The finite-energy identity).  #emph[The spinors in Lemma 76 satisfy 
#[#set math.equation(numbering: n => "(13.14)")
 $ parallel nabla_t^S psi_t parallel_(L^2 \( q_t \))^2 lt.eq C \( 1 - t \) \, #h(2em) t_0 lt.eq t < 1 . $ <q3:local-spinor:small-energy>]

]
] <q3:local-spinor:energy-lemma>

#proof[
  On the fields with finite derivative and Dirac norms used here, define the continuous bilinear form
  $ cal(B)_t \( xi \, eta \) = chevron.l nabla_t^S xi \, nabla_t^S eta chevron.r_(L^2) - chevron.l D_t xi \, D_t eta chevron.r_(L^2) . $
  The polarized compact identity gives $cal(B)_t \( xi \, eta \) = 0$ whenever one entry is compactly supported and both are locally $H^1$: multiply the other entry by a compact cutoff which is one near that support and use Equation (13.8). Approximate $zeta_t$ by compact tests in $cal(H)_t$. Equation (13.12) permits passage to the limit in the mixed terms, giving
  #[#set math.equation(numbering: n => "(13.15)")
   $ cal(B)_t \( zeta_t \, zeta_t \) = 0 \, quad cal(B)_t \( psi_(0 \, t) \, zeta_t \) = 0 \, quad cal(B)_t \( psi_t \, psi_t \) = cal(B)_t \( psi_(0 \, t) \, psi_(0 \, t) \) . $ <q3:local-spinor:mixed-identity>]
  This use of compact approximation concerns the correction $zeta_t$.
  To estimate the last expression, take a scalar cutoff $beta_R$ which is one up to radius $R$ in the distinguished end and zero beyond $2 R$, with $\| d beta_R \|_(q_t) lt.eq C \/ R$ there; extend it as one off the end. The spinor $beta_R psi_(0 \, t)$ is compactly supported. The product rules for $nabla_t^S$ and $D_t$ give
  $ 0 =  & cal(B)_t \( psi_(0 \, t) \, beta_R psi_(0 \, t) \)\
=  & integral_W beta_R \( \| nabla_t^S psi_(0 \, t) \|^2 - \| D_t psi_(0 \, t) \|^2 \) thin d V_(q_t) + cal(E)_(t \, R) \, $
  where
  #[#set math.equation(numbering: n => "(13.16)")
   $ \| cal(E)_(t \, R) \| & lt.eq C / R integral_(R < r < 2 R) \| psi_(0 \, t) \| \( \| nabla_t^S psi_(0 \, t) \| + \| D_t psi_(0 \, t) \| \) thin d V_(q_t)\
 & lt.eq C #scale(x: 120%, y: 120%)[\(] \( 1 - t \) + R^(1 - 2 q_0) #scale(x: 120%, y: 120%)[\)] . $ <q3:local-spinor:annulus-error>]
  Here $\| psi_(0 \, t) \| = 1$ on this annulus for large $R$, its volume is $O \( R^3 \)$ uniformly in $t$, and Equation (13.12) supplies the two derivative rates. The integral on the preceding line converges to $cal(B)_t \( psi_(0 \, t) \, psi_(0 \, t) \)$ by integrability of the two squared derivatives. Since $2 q_0 > 1$, letting $R arrow.r oo$ in Equation (13.16) yields $\| cal(B)_t \( psi_(0 \, t) \, psi_(0 \, t) \) \| lt.eq C \( 1 - t \)$. Finally $D_t psi_t = 0$ and Equation (13.15) prove Equation (13.14). All explicit flux estimates involve the reference field, whose support lies in the chosen end neighborhood; the correction was handled by its compact approximation. ◻
]

#thm([Proposition 13.6.])[
  (Local flatness of the limiting metric).  #emph[The metric $q_(*)$ is flat on the plus interior $cal(P)$ and has zero curvature at each attached sphere $S_i$.]
] <q3:local-spinor:flatness>

#proof[
  Use the fixed spin structure and bundle identifications with the positive $C^2$ metric $q_(*)$ on compact subsets of $W$. Equations (13.13) and (13.10) give uniform local $H^1$ bounds for $zeta_t$. The reference spinors $psi_(0 \, t)$ converge locally with their coefficients, so $psi_t$ also has uniform local $H^1$ bounds. A diagonal subsequence as $t arrow.t 1$ converges weakly in $H^1$ on every compact subdomain to a spinor $psi_(*)$; write $zeta_(*) := psi_(*) - psi_(0 \, *)$. The connection coefficients converge locally, and Equation (13.14) implies
  #[#set math.equation(numbering: n => "(13.17)")
   $ nabla_(*)^S psi_(*) = 0 quad upright("in distributions on ") W . $ <q3:local-spinor:parallel-limit>]
  It remains to prove that this limit does not vanish. Equations (13.9) and (13.13) give the uniform estimate
  $ integral_(r gt.eq r_0) r^(- 2) \| zeta_t \|^2 thin d V_(q_t) lt.eq C . $
  On every bounded end annulus, local weak lower semicontinuity and the converging metric and bundle coefficients pass this bound to $zeta_(*)$. Exhausting the end by such annuli gives
  #[#set math.equation(numbering: n => "(13.18)")
   $ integral_(r gt.eq r_0) r^(- 2) \| zeta_(*) \|^2 thin d V_(q_(*)) lt.eq C . $ <q3:local-spinor:limit-weight>]
  If $psi_(*)$ vanished identically on $cal(P)$, then $zeta_(*) = - psi_(0 \, *)$ on this end. The reference spinor has unit length for $r gt.eq 2 r_0$, and $q_(*)$ is uniformly comparable to the Euclidean metric there, so the integral in Equation (13.18) would be bounded below by a positive constant times $integral_(2 r_0)^oo d r = oo$. Thus $psi_(*)$ is nonzero on the plus interior.
  The metric is smooth on $cal(P)$. The parallel equation there first improves the local Sobolev regularity of $psi_(*)$ by differentiating in smooth local trivializations, and iteration gives a smooth parallel spinor. Metric compatibility shows that its length is constant; connectedness of $cal(P)$ makes that constant positive. Its spin curvature therefore annihilates it. The Clifford contraction of the spin-curvature formula, using the first Bianchi identity, is
  $ sum_j frak(c)_(*) \( e_j \) R_(*)^S \( e_j \, Y \) psi_(*) = 1 / 2 frak(c)_(*) #scale(x: 120%, y: 120%)[\(] "Ric"_(q_(*)) \( Y \, dot.op \)^sharp #scale(x: 120%, y: 120%)[\)] psi_(*) = 0 . $
  Changing both curvature conventions changes the displayed sign but leaves the conclusion unchanged. Clifford multiplication by a nonzero vector is invertible, since its square is minus its squared length. Hence $"Ric"_(q_(*)) = 0$ on $cal(P)$. In three dimensions the Riemann tensor is determined algebraically by the Ricci tensor, so $q_(*)$ is flat there. Its $C^2$ extension across the joined spheres has continuous curvature, which proves the last assertion. ◻
]

=== 13.5 The horizon area contradiction <the-horizon-area-contradiction>

We finish the contradiction under the equality assumption $\| S_1 \|_g + \| S_2 \|_g = 16 pi m^2$. On the plus side set $phi.alt = \( 1 + lambda \) \/ 2$, so $q_(*) = phi.alt^4 h$. Equation (13.3) gives $phi.alt = 1 \/ 2$ and $nu_h log phi.alt = kappa$ at each $S_i$. The conformal normal is $nu_(q_(*)) = phi.alt^(- 2) nu_h$, and the conformal second fundamental form, in this orientation, is

#[#set math.equation(numbering: n => "(13.19)")
 $ upright("II")_(q_(*)) = phi.alt^2 #scale(x: 120%, y: 120%)[\(] upright("II")_h + 2 nu_h \( log phi.alt \) h \|_(T S_i) #scale(x: 120%, y: 120%)[\)] = kappa / 2 h \|_(T S_i) = 8 kappa thin q_(*) \|_(T S_i) . $ <q3:local-spinor:shape>]

Both principal curvatures are consequently $8 kappa$. By Proposition 78 and the Gauss equation, the intrinsic Gauss curvature of each sphere is $64 kappa^2$. Although the ambient extension of $q_(*)$ is only $C^2$, its induced metric on $S_i$ equals $g \|_(T S_i) \/ 16$ and is smooth: the original metric and horizon sphere are smooth, and the attachment preserves their tangential smooth structure. Thus the ordinary smooth Gauss–Bonnet formula applies #cite(label("Chern1944")) Section 1 and gives $64 kappa^2 \| S_i \|_(q_(*)) = 2 pi chi \( S_i \) = 4 pi$. Since the induced metric is $q_(*) \|_(T S_i) = g \|_(T S_i) \/ 16$, its two-dimensional area form is $1 \/ 16$ times the original area form. Therefore

#[#set math.equation(numbering: n => "(13.20)")
 $ \| S_i \|_g = 16 \| S_i \|_(q_(*)) = 16 frac(4 pi, 64 kappa^2) = pi / kappa^2 = 16 pi m^2 \, #h(2em) i = 1 \, 2 . $ <q3:local-spinor:individual-area>]

Their sum would be $32 pi m^2$, whereas the assumed equality makes it $16 pi m^2$. This is impossible because $m > 0$. Together with the already established non-strict inequality, this excludes equality and proves Theorem 73.

== 14 Equality in four spatial dimensions <q4:sec:setup>

Equality concerns the initial hypersurface, including its second fundamental form. A limiting scalar-flat comparison metric does not by itself identify that hypersurface. We instead apply the numerical inequality to nearby original data. The resulting variational identity produces a causal stationary field on the original exterior. We remove its twist, classify the complete static base, and then recover the original hypersurface in coordinates regular at the horizon.

The four-dimensional route below has two useful features. It needs only two differentiated orders of asymptotic metric decay and one of tensor decay. It also permits additional complete ends of the intermediate static base until the classification argument excludes them. The required positive-mass input is nonspin and asserts nonnegativity only; the zero-mass rigidity and the treatment of the compactified point are proved in Section 19.

=== 14.1 Data, cuts, and the numerical input <data-cuts-and-the-numerical-input>

Let $Omega$ be a smooth connected orientable four-manifold with nonempty compact smooth boundary $S$. A smooth Riemannian metric $g$ is complete with $S$ included, and a smooth symmetric covariant two-tensor $K$ is its second fundamental form datum. We use the geometric density convention

$ omega = omega_3 = \| bb(S)^3 \| = 2 pi^2 \, #h(2em) tau = "tr"_g K \, #h(2em) mu = 1 / 2 \( R_g + tau^2 - \| K \|_g^2 \) \, #h(2em) J_i = nabla^j \( K_(i j) - tau g_(i j) \) . $

Here $R_g = "Scal"_g$ and $Delta_g = "div"_g nabla$. The dominant energy condition is $mu gt.eq \| J \|_g$. The boundary normal $nu$ points into the exterior, and the future null expansion is

$ H = "div"_S nu \, #h(2em) theta_(+) = H + "tr"_S K . $

For the second fundamental form in a spacetime, our sign convention is

#[#set math.equation(numbering: n => "(14.1)")
 $ K \( U \, V \) = overline(g) \( overline(nabla)_U n \, V \) $ <q4:eq:intro-second-fundamental-form>]

for the future unit normal $n$.

Assume that $Omega$ has one end, diffeomorphic to the complement of a closed ball in $bb(R)^4$, with compact complement. In its coordinates we require, for some $q > 1$,

#[#set math.equation(numbering: n => "(14.2)")
 $ g - delta = O_2 \( r^(- q) \) \, #h(2em) K = O_1 \( r^(- 1 - q) \) \, #h(2em) mu \, \| J \|_g in L^1 \( Omega \, d V_g \) . $ <q4:eq:weak-decay>]

The notation $O_j \( r^(- a) \)$ includes coordinate derivatives of order $k lt.eq j$ with bounds $O \( r^(- a - k) \)$. The ADM limits are assumed finite, with normalization

#[#set math.equation(numbering: n => "(14.3)")
 $ E & = frac(1, 6 omega) lim_(R arrow.r oo) integral_(\| x \| = R) \( partial_j g_(i j) - partial_i g_(j j) \) n_delta^i thin d A_delta \,\
P_i & = frac(1, 3 omega) lim_(R arrow.r oo) integral_(\| x \| = R) \( K_(i j) - tau g_(i j) \) n_delta^j thin d A_delta . $ <q4:intro:energy>]

#prodef([Definition 14.1.])[
  (Full enclosing cuts).  A full enclosing cut is the entire intrinsic manifold boundary of a connected smooth codimension-zero submanifold $D subset Omega$, closed in $Omega$, with compact boundary and with its manifold interior in $"int" Omega$, that contains the whole sufficiently distant end. Define
  $ A_(*) \( g \) = inf_D \| partial_(upright("man")) D \|_g . $
  The cut may be disconnected, and every part coincident with $S$ is counted. In particular $D = Omega$ is allowed and has full cut $S$. The infimum is not assumed attained by a smooth cut.
] <q4:def:cuts>

The numerical theorem is used on a larger class than the equality theorem. We record the exact one-ended input, so that no outermostness condition is silently imposed on the variations.

#thm([Theorem 14.2.])[
  (Weak four-dimensional numerical inequality).  #emph[Suppose $\( Omega \, g \, K \)$ satisfies the smoothness, orientability, completeness, end, integrability, decay, and finite-charge assumptions above, as well as $mu gt.eq \| J \|_g$ and $theta_(+) lt.eq 0$ on every component of its nonempty compact boundary. Then $A_(*) \( g \) > 0$ and 
#[#set math.equation(numbering: n => "(14.4)")
 $ E gt.eq sqrt(\| P \|_delta^2 + 1 / 4 (frac(A_(*) \( g \), omega))^(4 \/ 3)) . $ <q4:eq:numerical>]

 In particular $E > \| P \|_delta$ and $sqrt(E^2 - \| P \|_delta^2) gt.eq 1 / 2 \( A_(*) \( g \) \/ omega \)^(2 \/ 3)$.]
] <q4:thm:numerical-provider>

This is the one-ended restriction of Theorem 8.2 in the numerical companion #cite(label("CompanionNumerical")). The proof below never reverses an end replacement or a graph deformation used to establish it.

=== 14.2 The equality class and its geometric conclusion <the-equality-class-and-its-geometric-conclusion>

#prodef([Definition 14.3.])[
  (Connected outermost horizon).  The data satisfy all hypotheses of Theorem 80, have connected boundary $S$, and satisfy the following additional conditions:
  + $S$ is a future marginally outer trapped surface (MOTS): $theta_(+) \( S \) = 0$ for the normal into $Omega$.
  + No smooth compact embedded two-sided enclosing hypersurface in $"int" Omega$, possibly disconnected and oriented toward the end, has $theta_(+) lt.eq 0$ everywhere.
  + $S$ is outer area-minimizing: every full cut has area at least $A := \| S \|_g > 0$. Thus $A_(*) \( g \) = A$.
] <q4:def:horizon>

For $M_0 > 0$, the Schwarzschild–Tangherlini spacetime #cite(label("Tangherlini1963")) in its static exterior has metric

#[#set math.equation(numbering: n => "(14.5)")
 $ overline(g)_(M_0) = - (1 - frac(2 M_0, r^2)) d t^2 + (1 - frac(2 M_0, r^2))^(- 1) d r^2 + r^2 g_(bb(S)^3) \, #h(2em) r > sqrt(2 M_0) . $ <q4:eq:intro-tangherlini>]

Its regular maximal extension includes the future and past horizons and their bifurcation sphere. The singular coefficient at $r = sqrt(2 M_0)$ in this display is removed by regular horizon coordinates.

#thm([Theorem 14.4.])[
  (Original-data exterior rigidity).  #emph[Let $\( Omega \, g \, K \)$ belong to Definition 81, and set $m = sqrt(E^2 - \| P \|_delta^2)$. Then 
#[#set math.equation(numbering: n => "(14.6)")
 $ m = 1 / 2 (A / omega)^(2 \/ 3) $ <q4:eq:intro-equality>]

 if and only if the original initial data admit a global smooth spacelike embedding, including $S$, into the regular maximal extension of $overline(g)_m$. The image lies in the closure of the corresponding exterior, its end approaches that spatial infinity, and $S$ maps to a smooth section of its future horizon or to its bifurcation sphere. The induced metric is the original $g$, and its second fundamental form for a consistent future unit normal is the original $K$ with convention (14.1). The embedding and normal are smooth up to $S$ in regular horizon coordinates.]
  #emph[Equivalently, every such hypersurface in $overline(g)_(M_0)$ satisfying Definition 81 and the prescribed asymptotic assumptions has invariant ADM mass $M_0$, horizon area $omega \( 2 M_0 \)^(3 \/ 2)$, and equality in (14.4).]
] <q4:thm:rigidity>

This is an exterior theorem: there is no hypothesis about an ambient extension of the data behind $S$. Spherical topology, simple connectivity, vacuum, and stationary development are conclusions of the argument where they are used. The conclusion includes nonzero $K$ and asymptotically boosted slices.

=== 14.3 How the original data are recovered <how-the-original-data-are-recovered>

The least enclosing area may have several minimizing frontiers. Section 15 first constructs their compact space and computes the right metric derivative as the smallest variation among all of them. Positive separation in Section 16 then produces an area-sourced multiplier. Compact normal variations and outermostness localize that source to $S$, before a homogeneous interior adjoint equation is used.

Section 17 turns the multiplier into a smooth causal lapse–shift field. Complementarity initially permits null stress; vacuum is obtained only on its timelike region. Section 18 verifies the hypotheses of the shared static-base proposition at this weak decay and records the attachment of the original horizon. The shared twist argument treats the possible null set directly. Possible complete ends at interior zeros are retained at this stage.

The conformal double in Section 19 follows the method of Bunting and Masood-ul-Alam and its higher-dimensional development by Gibbons, Ida, and Shiromizu #cite(label("BuntingMasoodUlAlam1987")) #cite(label("GibbonsIdaShiromizu2002")). Second-order harmonic asymptotics make the compactification $C^2$. A compact smoothing and conformal correction reduce zero-mass rigidity to the smooth nonnegative-mass theorem of Lesourd, Unger, and Yau #cite(label("LesourdUngerYau2021")) Theorem 1.2 and Definition 1.9, arXiv version 1, with every other end still allowed. Euclidean rigidity then identifies the entire original exterior. Finally Section 20 reconstructs $g$ and $K$ as a single global graph, makes the graph smooth at the horizon in the original boundary structure, and computes the charges of every asymptotically boosted slice for the converse.

== 15 Enclosing area in the four-dimensional equality problem <q4:sec:enclosures>

We apply the geometric results of Section 3 to a smooth connected orientable four-manifold $\( X \, g \)$ with nonempty compact smooth boundary $B$, complete with $B$ included, and exactly one asymptotically Euclidean end with compact complement. Assume $g - delta = O_2 \( r^(- q) \)$ for $q > 1$. The full-cut convention is Definition 79, and

$ a_g \( B \) = inf_Gamma "Area"_g \( Gamma \) . $

The common geometric hypotheses require only $q > 0$ and are therefore satisfied. They require neither a constraint equation nor outermostness. In particular, we do not specialize a strong-decay equality theorem to these weaker data.

=== 15.1 The full-perimeter realization <q4:enc:obstacle-setup>

Use the compact filling $O$ from Section 3. As in Equation (3.2), minimize full perimeter among bounded filled sets containing $O$; write $cal(A)$ for this class.

#thm([Proposition 15.1.])[
  (Full-perimeter minimizing enclosures).  #emph[The minimum of $P_g$ over $cal(A)$ exists and equals $a_g \( B \) > 0$. Every minimizer has a regular representative whose frontier $T$ is a nonempty compact embedded $C^(1 \, 1)$ hypersurface, smooth and minimal on $T \\ B$. Its graph functions are locally $W^(2 \, oo)$, hence $W^(2 \, 2)$, including at contact with $B$. Its outward coorientation points toward a connected exterior containing the asymptotic end. All minimizing frontiers lie in one compact subset of $X$.]
  #emph[Every frontier is a $C^1$ and area limit of smooth full enclosing cuts in $"int" X$. If $H_B < 0$ for the normal into $X$, every minimizer contains a fixed exterior collar of $B$. Its frontier is then a smooth minimal full cut, and its closed exterior is smooth, connected, complete with its nonempty boundary included, and one-ended. Its boundary is outer area-minimizing there, with every component counted.]
] <q4:enc:minimizing-hull>

#proof[
  Apply Proposition 8 with $n = 4$ and obstacle $B$. Its $C^(1 \, 1)$ conclusion applies to the whole frontier in this dimension. Its outward collar isotopy supplies the smooth-cut approximation, preserving the connected exterior. If $H_B < 0$, the collar flux inequality (3.5) removes all contact uniformly. The final part of the same proposition proves intrinsic completeness and outer area-minimization of the detached closed exterior. ◻
]

===== 15.1.1 An equivalent filled-side realization. <an-equivalent-filled-side-realization.>

The argument above also admits a noncompact fixed side in place of the compact filling. Let $X union_B O'$ be the topological double, with $O'$ the second copy of $X$, and choose a smooth metric extension through $B$ agreeing with that of $hat(X)$ in a collar. Its admissible sets $E'$ contain $O'$ almost everywhere, have locally finite perimeter with finite total perimeter, and satisfy $E' ∩ "int" X subset K$ almost everywhere for some compact $K subset X$. No finite-volume condition is imposed on $E'$.

Write $P$ for full perimeter in the respective ambient manifold and $F = E ∩ "int" X$. The maps

$ E = O union F mapsto E' = O' union F \, #h(2em) E' mapsto O union \( E' ∩ "int" X \) $

are inverse modulo null sets: both retain the same essentially compactly supported exterior part $F$. To verify that they preserve full perimeter, let $t_F = "Tr"_X upright(bold(1))_F$ be the BV trace on $B$ taken from $X$. The gluing formula gives

$ P \( E \) = P_g \( F \; "int" X \) + integral_B \| 1 - t_F \| thin d A_g = P \( E' \) . $

Indeed, Gauss–Green applied on the two sides of $B$ gives the interior variation of $upright(bold(1))_F$ and the jump between its trace $t_F$ and the constant inner trace $1$. The fixed side has no interior variation. The same calculation with compactly supported test fields applies to $O'$, so it creates no term at infinity. The identity also holds after restricting the perimeter measures to any Borel subset of $X$. Thus contact with $B$ is counted in both constructions, their perimeter-support frontiers agree, and their minimizers correspond with the same minimizing value.

=== 15.2 The family of minimizers and the metric derivative <q4:enc:variation-setup>

For a minimizing filled set with frontier $T$, let $V_T$ be its unoriented tangent-plane area measure from Equation (3.6). Let $cal(T)$ be the family of minimizing filled sets, modulo null sets, with their regular frontiers, equipped with local $L^1$ and weak plane-measure convergence.

#thm([Proposition 15.2.])[
  (Compact minimizing space and right area derivative).  #emph[The space $cal(T)$ is compact and metrizable. For every smooth symmetric two-tensor $h$, the function 
#[#set math.equation(numbering: n => "(15.1)")
 $ a'_T \( h \) = 1 / 2 integral_T "tr"_(T_x T) h thin d A_g $ <q4:enc:metric-area-functional>]

 is continuous on it. Let $g_s$, $\| s \| < s_0$, be a smooth path of smooth metrics on $X$, with $g_0 = g$, uniformly comparable to $g$, and with uniformly bounded first and second parameter derivatives relative to $g$. Assume that its coordinate spheres have strictly positive outward mean curvature beyond one common radius. If $a \( s \)$ is its full smooth-cut infimum and $h = partial_s g_s \|_0$, then 
#[#set math.equation(numbering: n => "(15.2)")
 $ a' \( 0 + \) = min_(T in cal(T)) a'_T \( h \) . $ <q4:enc:area-derivative-formula>]

 The minimum is attained. For $s_j arrow.r 0$ and any minimizing frontiers $T_j$ for $g_(s_j)$, a subsequence of the filled sets converges to a member of $cal(T)$, and its plane-area measures in the fixed metric $g$ converge to the corresponding measure.]
] <q4:enc:area-derivative>

#proof[
  Smoothly extend the path through the fixed boundary in one collar. The common mean-convex tail gives uniform confinement directly by the clipping inequality (3.3): the divergence of the outward unit radial normal is positive for every metric in the path beyond the same radius. This is the common-sphere alternative in Proposition 9; the scaled first-derivative bounds used in its separate density-estimate alternative are unnecessary here. On the resulting fixed compact region, the smooth path has uniform local bounds. The proposition’s localized polar-measure continuity and uniform Grassmann-bundle Taylor expansion give all the assertions, retaining any mass on $B$. ◻
]

#thm([Proposition 15.3.])[
  (A common tangent plane for tied minimizers).  #emph[On $cal(L) = union.big_(T in cal(T)) \( T \\ B \)$, the plane $Pi_x = T_x T$ is independent of the minimizing frontier through $x$ and is continuous in the relative topology. Consequently $x mapsto "tr"_(Pi_x) K$ is single valued and continuous there for every smooth symmetric two-tensor $K$.]
] <q4:enc:common-plane>

#proof[
  All free frontiers are smooth in dimension four. Proposition 10 gives local agreement at a meeting point and continuity as both the point and the minimizing frontier vary. Its proof uses the small-excess theorem on the whole support, with a smooth-ambient mean-curvature bound after rescaling. This supplies the pointwise plane control beyond the integral convergence in Proposition 84. ◻
]

== 16 Variation at equality and localization of the area term <q4:var:section>

Throughout this section, $\( Omega \, g \, K \)$ satisfies the hypotheses of Definition 81, and equality holds in Theorem 80. Thus $Omega$ has one end and its only boundary $S$ is a connected, outermost, outer area-minimizing future MOTS. We use the full enclosing-cut convention of Definition 79. Set

#[#set math.equation(numbering: n => "(16.1)")
 $ A = "Area"_g \( S \) \, #h(2em) m = sqrt(E^2 - \| P \|^2) \, #h(2em) r_0 = \( A \/ omega \)^(1 \/ 3) = sqrt(2 m) \,\
b^0 = E \/ m \, #h(2em) b^i = - P_i \/ m \, #h(2em) frak(m) \( a \) = 1 / 2 \( a \/ omega \)^(2 \/ 3) \, #h(2em) c = 6 omega frak(m)' \( A \) = 2 \/ r_0 . $ <q4:var:constants>]

The strict future timelikeness needed here is already part of Theorem 80. For nearby data with charges $\( tilde(E) \, tilde(P) \)$, define the fixed linear charge functional

$ cal(E) \( tilde(g) \, tilde(K) \) = b^0 tilde(E) + sum_(i = 1)^4 b^i tilde(P)_i . $

The reverse Cauchy–Schwarz inequality on the future timelike cone gives

#[#set math.equation(numbering: n => "(16.2)")
 $ cal(E) \( tilde(g) \, tilde(K) \) gt.eq sqrt(tilde(E)^2 - \| tilde(P) \|^2) . $ <q4:var:supporting-charge>]

Equality holds at the original data. In particular, whenever the varied data satisfy the numerical theorem, their enclosing infimum $a \( tilde(g) \)$ satisfies

#[#set math.equation(numbering: n => "(16.3)")
 $ cal(E) \( tilde(g) \, tilde(K) \) - frak(m) \( a \( tilde(g) \) \) gt.eq 0 . $ <q4:var:nonnegative-defect>]

The varied data need not preserve outermostness or outer area minimization: those assumptions are absent from the numerical theorem.

The right-derivative formula in Proposition 84 accounts for all minimizing frontiers without choosing a differentiable family. It gives the positive-measure identity of Proposition 91. Compact normal tests and outermostness then localize its area term to $S$ in Proposition 93, supplying the identity used to construct the causal adjoint field in Theorem 94.

=== 16.1 Constraint derivatives and a strict direction <constraint-derivatives-and-a-strict-direction>

On the closed unit ball bundle of $g$, introduce

#[#set math.equation(numbering: n => "(16.4)")
 $ C \( x \, v \) = 2 \( mu \( x \) + J_x \( v \) \) = R_g + tau^2 - \| K \|_g^2 + 2 J_x \( v \) \, #h(2em) \| v \|_g lt.eq 1 \,\
cal(A) = { \( x \, v \) : C \( x \, v \) = 0 } . $ <q4:var:active-set>]

DEC is equivalent to $C gt.eq 0$ on this bundle. When the metric varies, we identify its unit ball with the original one by the positive symmetric inverse square root. More precisely, if $g_s \( V \, W \) = g \( G_s V \, W \)$, then $I_s = G_s^(- 1 \/ 2)$ sends the $g$ unit ball isometrically to the $g_s$ unit ball. For a variation $H = \( h \, p \) = \( dot(g)_0 \, dot(K)_0 \)$, all derivatives $C'_H$ below include this identification; in particular,

$ dot(I)_0 v = - 1 / 2 h^sharp v . $

#thm([Lemma 16.1.])[
  (Conformal constraint identities).  #emph[For a positive smooth function $f$, let $g_f = f^2 g$ and $K_f = f K$. Using $f^(- 1) v$ in the varied unit ball, one has 
#[#set math.equation(numbering: n => "(16.5)")
 $ f^2 C_f \( x \, f^(- 1) v \) & = C \( x \, v \) + 6 f^(- 1) #scale(x: 120%, y: 120%)[\[] - Delta_g f + K \( nabla f \, v \) #scale(x: 120%, y: 120%)[\]] \,\
f theta_(+ \, f) & = theta_(+) + 3 partial_nu log f . $ <q4:var:conformal-C>]

 Here $nu$ points into the exterior and $Delta_g = "div"_g nabla$.]
] <q4:var:conformal>

#proof[
  Put $phi = log f$. The scalar-curvature and tensor transformations in dimension four are
  $ R_(f^2 g) = f^(- 2) \( R_g - 6 Delta_g phi - 6 \| d phi \|_g^2 \) \, quad tau_f = f^(- 1) tau \, quad \| K_f \|_(f^2 g)^2 = f^(- 2) \| K \|_g^2 . $
  Since $Delta phi + \| d phi \|^2 = f^(- 1) Delta f$, they give $f^2 mu_f = mu - 3 f^(- 1) Delta_g f$. For the momentum, set $pi = K - tau g$, so $pi_f = f pi$. The connection difference is
  $ hat(Gamma)_(i j)^a - Gamma_(i j)^a = delta_i^a phi_j + delta_j^a phi_i - g_(i j) phi^a . $
  Contracting the covariant derivative of $f pi$ yields
  $ f J_(f \, i) = J_i + 3 pi_(i j) phi^j - \( "tr"_g pi \) phi_i = J_i + 3 K_(i j) phi^j \, $
  because $"tr"_g pi = - 3 tau$. In particular every trace-gradient term cancels; no extra asymptotic condition on $tau$ is used. Evaluating on the identified vector $f^(- 1) v$ gives
  $ f^2 J_f \( f^(- 1) v \) = J \( v \) + 3 f^(- 1) K \( nabla f \, v \) . $
  Adding twice the density and momentum identities proves (16.5). Finally $nu_f = f^(- 1) nu$, $H_(f^2 g) = f^(- 1) \( H_g + 3 partial_nu log f \)$, and $"tr"_(T S \, f^2 g) \( f K \) = f^(- 1) "tr"_(T S \, g) K$. Their sum proves (16.5) with the same oriented normal. ◻
]

#thm([Lemma 16.2.])[
  (Strict conformal direction).  #emph[Choose 
$ 1 < q_0 < min \( q \, 2 \) \, #h(2em) 0 < delta < min \( q_0 \, 1 \) \, #h(2em) w = r^(- 4 - delta) \, $

 where the end radius is extended to a positive smooth function on $Omega$. There is a smooth nonnegative function $phi.alt$, smooth up to $S$, such that 
#[#set math.equation(numbering: n => "(16.6)")
 $ partial_nu phi.alt = - 1 quad upright("on ") S \, #h(2em) - Delta_g phi.alt - \| K \|_g \| thin upright(d) phi.alt \|_g gt.eq w \, #h(2em) phi.alt = O_2 \( r^(- 2) \) \, #h(2em) - Delta_g phi.alt \/ w arrow.r 1 . $ <q4:var:phi-properties>]

 Its limiting Euclidean sphere gradient flux exists and is finite. For 
$ Q = \( 2 phi.alt g \, phi.alt K \) $

 one consequently has 
#[#set math.equation(numbering: n => "(16.7)")
 $ C'_Q gt.eq 6 w quad upright("on ") cal(A) \, #h(2em) - theta'_Q = 3 quad upright("on ") S . $ <q4:var:strict-derivatives>]

 Moreover, uniformly for all $\| v \|_g lt.eq 1$ on the end, $C'_Q \/ w arrow.r 6$.]
] <q4:var:strict-direction>

#proof[
  Choose a smooth majorant $d_0 gt.eq \| K \|_g$ which on the end is a sufficiently large radial multiple of $r^(- 1 - q_0)$. It can be chosen with all symbol bounds there. We solve
  #[#set math.equation(numbering: n => "(16.8)")
   $ - Delta_g phi.alt = d_0 sqrt(\| thin upright(d) phi.alt \|_g^2 + r^(- 6)) + w \, #h(2em) partial_nu phi.alt = - 1 upright(" on ") S \, #h(2em) phi.alt arrow.r 0 upright(" at infinity") . $ <q4:var:phi-equation>]
  First truncate at a large coordinate sphere $S_R$, imposing $phi.alt = 0$ on $S_R$, and replace $d_0$ in the equation by $t d_0$, $0 lt.eq t lt.eq 1$. The inner and outer boundary components are disjoint smooth hypersurfaces; there is no corner where the two boundary conditions meet. The $t = 0$ problem is the invertible mixed Laplace problem. Every linearization in $phi.alt$ adds to $- Delta_g$ a smooth drift of norm at most $d_0$, with homogeneous Neumann data at $S$ and homogeneous Dirichlet data at $S_R$. The maximum and boundary point principles give uniqueness, and the mixed elliptic Fredholm theory then gives invertibility. These are the usual local elliptic and boundary estimates on a fixed smooth truncated domain; see #cite(label("GilbargTrudinger2001")).
  Solutions are nonnegative. Indeed a negative minimum cannot occur in the interior because the right side of the equation is positive. At $S$, the outward normal of the truncated domain is $- nu$, so the prescribed outward derivative is $+ 1$, also excluding such a minimum by the boundary point principle. The outer Dirichlet value is zero.
  For completeness, the continuation bounds do not require a monotonicity assumption in the unknown. Fix $p > 4$. The mixed $W^(2 \, p)$ estimate, the linear growth of the right side in $thin upright(d) phi.alt$, and first-derivative interpolation give, on this fixed truncation,
  $ parallel phi.alt parallel_(W^(2 \, p)) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + parallel phi.alt parallel_(L^oo) #scale(x: 120%, y: 120%)[\)] \, $
  uniformly in $t$. If the supremum were unbounded, division by that supremum and compactness in $C^1$ would produce a nonnegative function $z$ with supremum one satisfying
  $ - Delta_g z = t_(*) d_0 \| thin upright(d) z \|_g \, #h(2em) partial_nu z = 0 upright(" on ") S \, #h(2em) z = 0 upright(" on ") S_R $
  for some $t_(*) in \[ 0 \, 1 \]$. At points where $thin upright(d) z eq.not 0$ the right side is a bounded drift applied to $thin upright(d) z$, and it is zero otherwise. The strong maximum and boundary point principles for this bounded-drift equation contradict the positive maximum. The resulting $W^(2 \, p)$ and Schauder bounds close the continuation argument and give a smooth solution at $t = 1$ on every sufficiently large truncation.
  We next make the bounds independent of $R$. For $W = r^(- 2) - r^(- 2 - delta)$, the Euclidean identity
  $ - Delta_delta W = \( 2 + delta \) delta r^(- 4 - delta) $
  and the AF estimates imply, beyond a fixed radius $R_1$,
  #[#set math.equation(numbering: n => "(16.9)")
   $ - Delta_g W - d_0 \| thin upright(d) W \|_g gt.eq c_1 w > 0 . $ <q4:var:tail-barrier>]
  The metric errors and the drift term are smaller than $w$ because $delta < q_0 < q$. Also $d_0 r^(- 3) = o \( w \)$. If $M_R$ is the supremum of the truncated solution on the fixed core bounded by $S_(R_1)$, a sufficiently large fixed multiple of $\( 1 + M_R \) W$ is a supersolution on $R_1 lt.eq r lt.eq R$. To see this, use $sqrt(a^2 + b^2) lt.eq a + b$ and (16.9); choose the multiple also to dominate $M_R$ on $S_(R_1)$. It dominates the zero outer value. Comparison is valid by writing the difference of the two gradient nonlinearities as a bounded drift. Therefore
  #[#set math.equation(numbering: n => "(16.10)")
   $ 0 lt.eq phi.alt_R lt.eq C \( 1 + M_R \) W #h(2em) \( R_1 lt.eq r lt.eq R \) . $ <q4:var:tail-bound>]
  If $M_R$ diverged along a sequence, normalize by $M_R$. Local mixed estimates near $S$ and interior estimates elsewhere give a subsequential limit $z$ on every fixed compact set. More precisely, (16.10) bounds $phi.alt_R \/ M_R$ on a neighborhood of the fixed closed core. Local Neumann $W^(2 \, p)$ estimates at $S$, and interior $W^(2 \, p)$ estimates away from it, give uniform bounds there for $p > 4$. Compactness in $C^1$ on the closed core retains both $sup_(upright("core")) z = 1$ and $partial_nu z = 0$. The limit satisfies $- Delta_g z = d_0 \| thin upright(d) z \|_g$, homogeneous Neumann data on $S$, and, by (16.10), $z arrow.r 0$ at infinity. Its positive global maximum is attained in a compact set. The same strong maximum and boundary point principles again give a contradiction. Thus $M_R$ is bounded, and exhaustion produces a smooth solution of (16.8) with $phi.alt = O \( r^(- 2) \)$.
  Here is the derivative control needed later, using only the stated derivatives of the original data. On a fixed annulus in the $y$ variables put $g_rho \( y \) = \( g_(i j) \( rho y \) \)$, $U_rho \( y \) = rho^2 phi.alt \( rho y \)$, and $a_rho \( y \) = rho d_0 \( rho y \)$. The exact rescaled equation is
  #[#set math.equation(numbering: n => "(16.11)")
   $ - Delta_(g_rho) U_rho = a_rho sqrt(\| thin upright(d) U_rho \|_(g_rho)^2 + \| y \|^(- 6)) + rho^(- delta) \| y \|^(- 4 - delta) . $ <q4:var:rescaled-phi>]
  The metric components have uniform $C^(1 \, 1)$ bounds from $g - delta = O_2$. Consequently both the principal coefficients of this Laplacian and its first-order coefficients have uniform $C^(0 \, alpha)$ bounds for every fixed $alpha < 1$. No third derivative of $g$ is needed. The chosen radial $d_0$ gives $a_rho = O \( rho^(- q_0) \)$ with uniform symbol bounds, independently of derivatives of $K$. First-derivative interpolation in the local $W^(2 \, p)$ estimates gives a uniform $W^(2 \, p)$ bound on a smaller annulus. Taking $p > 4$ controls $thin upright(d) U_rho$ in $C^(0 \, alpha)$ for some $alpha > 0$. The positive $\| y \|^(- 6)$ term is bounded away from zero there, so the entire right side of (16.11) is uniformly $C^(0 \, alpha)$. The usual Schauder estimate, including the first-order Laplacian coefficients with these $C^(0 \, alpha)$ bounds, now gives a uniform $C^(2 \, alpha)$ bound on a further smaller annulus. Scaling back proves $phi.alt = O_2 \( r^(- 2) \)$ without an additional metric or tensor falloff derivative. The equation now yields
  $ d_0 sqrt(\| thin upright(d) phi.alt \|_g^2 + r^(- 6)) = O \( r^(- 4 - q_0) \) = o \( w \) \, $
  which proves both the differential inequality and the last limit in (16.6). The right side of (16.8) is integrable. The divergence theorem consequently gives a finite limiting physical sphere flux. Its difference from the Euclidean sphere flux tends to zero, since $g - delta = O \( r^(- q) \)$ and $thin upright(d) phi.alt = O \( r^(- 3) \)$.
  Finally, differentiating Lemma 86 at $f = 1 + s phi.alt$ gives
  $ C'_Q = - 2 phi.alt C + 6 \[ - Delta_g phi.alt + K \( nabla phi.alt \, v \) \] \, #h(2em) theta'_Q = - phi.alt theta_(+) + 3 partial_nu phi.alt . $
  On $cal(A)$ the first term is zero, and on $S$ we have $theta_(+) = 0$. This proves (16.7). On the full end ball bundle, $C = O \( r^(- 2 - q) \)$, $phi.alt C = O \( r^(- 4 - q) \) = o \( w \)$, and $K \( nabla phi.alt \, v \) = O \( r^(- 4 - q) \) = o \( w \)$. Thus the normalized derivative tends uniformly to six. ◻
]

=== 16.2 Feasible variations and a measure identity <feasible-variations-and-a-measure-identity>

#prodef([Definition 16.3.])[
  (Variation space).  Let $cal(V)_0$ be the real vector space generated by all smooth compactly supported pairs $\( h \, p \)$ up to $S$ and the following five pairs, cut off smoothly to the end. The scalar pair is
  $ h_(i j) = r^(- 2) delta_(i j) \, #h(2em) p = 0 . $
  For each vector $e$ in a fixed basis of $bb(R)^4$, the momentum pair has $h = 0$ and is defined by
  #[#set math.equation(numbering: n => "(16.12)")
   $ p - \( "tr"_delta p \) delta = r^(- 3) #scale(x: 120%, y: 120%)[\(] e ⊗ hat(x) + hat(x) ⊗ e - \( e dot.op hat(x) \) delta #scale(x: 120%, y: 120%)[\)] \, #h(2em) hat(x) = x \/ r . $ <q4:var:momentum-prototype>]
  Set $cal(V) = bb(R) Q + cal(V)_0$. We write its elements as $H = a Q + H_0$, where $H_0 = \( h_0 \, p_0 \) in cal(V)_0$.
] <q4:var:variation-space>

#thm([Lemma 16.4.])[
  (End behavior of the variation space).  #emph[The five prototypes have independent charge derivatives. For every fixed $H_0 in cal(V)_0$, 
#[#set math.equation(numbering: n => "(16.13)")
 $ C'_(H_0) = O \( r^(- 4 - q) \) = o \( w \) $ <q4:var:prototype-constraint-decay>]

 uniformly on the full end ball bundle. The coefficient $a$ in Definition 88 is uniquely determined, and 
#[#set math.equation(numbering: n => "(16.14)")
 $ C'_H \/ w arrow.r 6 a $ <q4:var:end-value>]

 uniformly there. All elements of $cal(V)$ have well-defined charge derivatives.]
] <q4:var:end-variations>

#proof[
  Trace reversal on symmetric tensors in dimension four is invertible. The right side of (16.12), written as
  $ D_(i j) = r^(- 4) #scale(x: 120%, y: 120%)[\(] e_i x_j + x_i e_j - \( e dot.op x \) delta_(i j) #scale(x: 120%, y: 120%)[\)] \, $
  satisfies $partial_j D_(i j) = 0$ and $D_(i j) hat(x)^j = r^(- 3) e_i$. The scalar prototype satisfies the Euclidean linearized scalar constraint because $Delta_delta r^(- 2) = 0$ off the origin. With the ADM normalizations (14.3)–(14.3), the scalar prototype has $E' = 1$, $P' = 0$, and the momentum prototype for $e$ has $E' = 0$, $P' = e \/ 3$. Background corrections to these fluxes vanish by the AF estimates, so the derivatives are independent.
  On the end, $h_0 = O_2 \( r^(- 2) \)$ and $p_0 = O_1 \( r^(- 3) \)$. Their Euclidean linearized scalar and momentum constraints vanish. Each remaining linear constraint term has a factor from the decaying background: for example, $\( g - delta \) partial^2 h_0$, $partial g thin partial h_0$, $partial^2 g thin h_0$, $K p_0$, or $\( g - delta \) partial p_0$ has order at most $r^(- 4 - q)$. The variation of the vector identification contributes $- J \( h_0^sharp v \)$, of the same order. This proves (16.13). Lemma 87 then proves (16.14) and the uniqueness of $a$: an element of $cal(V)_0$ cannot have the normalized end derivative of $Q$.
  Compact variations have zero charge derivatives. The prototypes have the fluxes just computed. For $Q$, the momentum derivative is zero and
  $ E'_Q = - 1 / omega lim_(R arrow.r oo) integral_(\| x \| = R) partial_r phi.alt thin thin upright(d) A_delta \, $
  which is finite by Lemma 87. Products with background errors have zero limiting flux. Linearity completes the proof. ◻
]

Let $cal(T)$ be the compact space of minimizing frontiers for $g$, with their filled sets, from Proposition 84. For $T in cal(T)$, write

#[#set math.equation(numbering: n => "(16.15)")
 $ a'_T \( h \) = 1 / 2 integral_T "tr"_T h thin thin upright(d) A_g . $ <q4:var:fixed-area-derivative>]

This is a continuous function of $T$ for each fixed variation $h$.

#thm([Lemma 16.5.])[
  (Strict linear inequalities give feasible nonlinear data).  #emph[Suppose $H = a Q + H_0 in cal(V)$ has $a > 0$ and, for some $epsilon > 0$, 
$ C'_H gt.eq epsilon w upright(" on ") cal(A) \, #h(2em) - theta'_H > 0 upright(" on ") S . $

 Then, for every sufficiently small $s > 0$, 
#[#set math.equation(numbering: n => "(16.16)")
 $ g_s = e^(2 a s phi.alt) \( g + s h_0 \) \, #h(2em) K_s = e^(a s phi.alt) \( K + s p_0 \) $ <q4:var:nonlinear-path>]

 satisfies every hypothesis of Theorem 80. Its boundary has strictly negative future expansion. The path has derivative $H$, is uniformly comparable to $g$, has uniform large-sphere barriers, and its charges are differentiable at $s = 0$.]
] <q4:var:feasible-path>

#proof[
  Positivity of the metric and uniform comparability hold for small $s$, since $h_0$ and $phi.alt$ are bounded relative to $g$. They also give completeness with the boundary included. The topology, smoothness, end count and orientability remain those of $Omega$.
  We check DEC on the whole ball of test vectors. First use the intermediate metric and tensor $overline(g)_s = g + s h_0$, $overline(K)_s = K + s p_0$, identifying its vector ball with that of $g$ by $overline(I)_s$. For sufficiently large $r$, Taylor expansion and the Euclidean cancellations in Lemma 89 give, uniformly in $\| v \|_g lt.eq 1$,
  $ overline(C)_s \( x \, overline(I)_s v \) = C \( x \, v \) + O \( s r^(- 4 - q) \) + O \( s^2 r^(- 6) \) . $
  Here the remainder is uniform in $r$, $s$ in a fixed small interval, and the whole vector ball. To check all its components, the coordinate constraint expressions have the schematic forms
  $ R_g & = g^(- 1) partial^2 g + "smooth" \( g^(- 1) \) \( partial g \)^2 \,\
J & = "smooth" \( g^(- 1) \) partial K + "smooth" \( g^(- 1) \) \( partial g \) K \, $
  and $2 mu - R_g$ is quadratic in $K$, with smooth coefficients in $g^(- 1)$. Each second $s$ derivative on the intermediate path is $O \( r^(- 6) \)$: the largest terms are $h_0 partial^2 h_0$, $\( partial h_0 \)^2$, $p_0^2$, $h_0 partial p_0$, and $\( partial h_0 \) p_0$. Terms containing an original $K$, $partial K$, or background metric derivative decay faster. This calculation includes all occurrences of $tau = g^(i j) K_(i j)$, without a separate trace estimate. The vector identification also has the uniform matrix expansion
  $ overline(I)_s = \( "Id" + s h_0^sharp \)^(- 1 \/ 2) = "Id" - s / 2 h_0^sharp + O \( s^2 r^(- 4) \) \; $
  the eigenvalues lie in a fixed positive interval, so the matrix-function Taylor bound is uniform. Multiplication by the original or varied momentum covector keeps the same remainder order. In fact the preceding calculation gives the componentwise estimates
  #[#set math.equation(numbering: n => "(16.17)")
   $ overline(mu)_s & = mu + O \( s r^(- 4 - q) \) + O \( s^2 r^(- 6) \) \,\
overline(J)_s & = J + O \( s r^(- 4 - q) \) + O \( s^2 r^(- 6) \) . $ <q4:var:component-remainders>]
  Apply Lemma 86 to these intermediate data with $f_s = e^(a s phi.alt)$. After multiplication by the positive factor $f_s^2$, the constraint for the final data is
  #[#set math.equation(numbering: n => "(16.18)")
   $ C \( x \, v \) + s #scale(x: 120%, y: 120%)[\(] 6 a w + o \( w \) #scale(x: 120%, y: 120%)[\)] + O \( s^2 r^(- 6) \) \, $ <q4:var:end-feasibility-expansion>]
  again uniformly for the full vector ball. Indeed, $- Delta_g phi.alt \/ w arrow.r 1$ and $K \( nabla phi.alt \, v \) = o \( w \)$. Changing the metric, tensor, and vector identification in these conformal differential terms adds only the above decay orders, while the extra exponential term uses $\| thin upright(d) phi.alt \|^2 = O \( r^(- 6) \)$. Since $a > 0$ and $r^(- 6) = O \( w \)$, one can first choose a fixed large radius so the coefficient of $s$ in (16.18) is positive, and then choose $s$ small so its remainder is absorbed. DEC follows on this fixed far end, using $C gt.eq 0$.
  The remaining base region and its closed unit ball bundle are compact. The derivative of the constraint is strictly positive on its original zero set. By continuity it is positive on a neighborhood of that zero set; on the complement the original constraint has a positive minimum. A uniform Taylor expansion therefore gives $C_s gt.eq 0$ everywhere in the compact region for small positive $s$. The same compactness argument on $S$, where $theta_(+) = 0$, gives $theta_(+ \, s) < 0$.
  The new densities are integrable componentwise, not merely after contraction with active vectors. The exact conformal formulas give
  $ f_s J_s & = overline(J)_s + 3 a s overline(K)_s \( nabla_(overline(g)_s) phi.alt \, dot.op \) \,\
f_s^2 mu_s & = overline(mu)_s - 3 a s Delta_(overline(g)_s) phi.alt - 3 a^2 s^2 \| thin upright(d) phi.alt \|_(overline(g)_s)^2 . $
  The extra covector in the first line is $O \( s r^(- 4 - q) \) + O \( s^2 r^(- 6) \)$. Also $Delta_(overline(g)_s) phi.alt = Delta_g phi.alt + O \( s r^(- 6) \)$, with $Delta_g phi.alt = O \( w \)$. Together with (16.17), these identities express the new densities as bounded smooth scaling factors times the original integrable densities, plus integrable errors of orders $r^(- 4 - delta)$, $r^(- 4 - q)$, and $r^(- 6)$. Uniform metric comparability controls both norms and volume elements. The differentiated falloff has exponent $min \( q \, 2 \) > 1$, uniformly for $s$ in a small fixed interval, so large coordinate spheres remain mean convex uniformly.
  The charge limits can also be checked before differentiation. Write $pi = K - tau g$. Since conformal trace reversal gives $pi_s = f_s \( overline(K)_s - overline(tau)_s overline(g)_s \)$, expansion on the end yields
  $ pi_s = pi + s #scale(x: 120%, y: 120%)[\(] p_0 - \( "tr"_delta p_0 \) delta #scale(x: 120%, y: 120%)[\)] + O \( s r^(- 3 - q) \) + O \( s^2 r^(- 5) \) . $
  The terms with the original trace are of size $h_0 K = O \( r^(- 3 - q) \)$; multiplication by $f_s - 1 = O \( s r^(- 2) \)$ adds only the displayed error orders. All errors have zero limiting sphere flux. Therefore $P_s = P + s P'_(H_0)$ in the prescribed coordinates, without an extra decay assumption on $tau$. Similarly,
  $ g_s - g - s \( h_0 + 2 a phi.alt g \) = O_1 \( s^2 r^(- 4) \) \, $
  whose energy flux vanishes. The finite flux of $phi.alt$ and the scalar prototype thus give $E_s = E + s E'_H$. In particular both charge functions exist and are differentiable with the derivatives computed in Lemma 89. The path and its first two parameter derivatives are uniformly bounded relative to $g$, as required by Proposition 84. This verifies all claims and all hypotheses of the numerical theorem. ◻
]

#thm([Proposition 16.6.])[
  (Multiplier identity at equality).  #emph[There exist a probability measure $pi.alt$ on $cal(T)$, a nonnegative finite measure $eta$ on $S$, a nonnegative locally finite measure $Lambda$ on $cal(A)$, and $z gt.eq 0$, with $integral_(cal(A)) w thin thin upright(d) Lambda < oo$, such that for every $H = a Q + H_0 = \( h \, p \) in cal(V)$, 
#[#set math.equation(numbering: n => "(16.19)")
 $ 6 omega cal(E)' \( H \) - c integral_(cal(T)) a'_T \( h \) thin thin upright(d) pi.alt \( T \) = chevron.l C'_H \, Lambda chevron.r - integral_S theta'_H thin thin upright(d) eta + z a . $ <q4:var:measure-identity>]

 The constraint pairing is absolutely defined, since $C'_H \/ w$ is bounded on the compactified active set.]
] <q4:var:multiplier>

#proof[
  Compactify $cal(A)$ by one end point. If $cal(A)$ is already compact, adjoin an isolated point; if it is empty, use just that point. The ball fibers are compact and the base has one end, so this is a compact Hausdorff space, denoted $overline(cal(A))$. By Lemma 89, $C'_H \/ w$ extends continuously to it with value $6 a$ at the added point. On the disjoint compact union
  $ cal(K) = overline(cal(A)) union.sq S union.sq cal(T) $
  consider the linear map to $C \( cal(K) \)$ whose three components are
  #[#set math.equation(numbering: n => "(16.20)")
   $ H mapsto (C'_H / w \, med - theta'_H \, med c a'_T \( h \) - 6 omega cal(E)' \( H \)) . $ <q4:var:separation-map>]
  Its image does not meet the open cone of functions strictly positive everywhere. Otherwise its value at the added point gives $a > 0$, and Lemma 90 supplies actual feasible data (16.16). Let $a \( s \)$ be their enclosing infimum. The area derivative formula in Proposition 84 gives
  $ a' \( 0 + \) = min_(T in cal(T)) a'_T \( h \) . $
  Strict positivity of the third component in (16.20), and compactness of $cal(T)$, imply
  $ frac(thin upright(d), thin upright(d) s)\|_(0 +) 6 omega #scale(x: 120%, y: 120%)[\(] cal(E) \( g_s \, K_s \) - frak(m) \( a \( s \) \) #scale(x: 120%, y: 120%)[\)] = 6 omega cal(E)' \( H \) - c min_(T in cal(T)) a'_T \( h \) < 0 . $
  The expression starts at zero and is nonnegative by (16.3), a contradiction.
  Hahn–Banach separation of a linear subspace from this open convex cone gives a nonzero positive continuous functional on $C \( cal(K) \)$ annihilating the image. The subspace need not be closed: its closure is still disjoint from the open cone. The Riesz representation theorem identifies the functional with a nonzero finite positive measure on $cal(K)$.
  Its mass on $cal(T)$ is positive. If that mass were zero, testing $Q$ would give a strictly positive value on every remaining component: $C'_Q \/ w gt.eq 6$ on $cal(A)$, the added-point value is six, and $- theta'_Q = 3$ on $S$. This would contradict annihilation. Normalize the mass on $cal(T)$ to one and call the resulting measure there $pi.alt$. Call its restriction to $S$ $eta$. On $cal(A)$, divide the remaining measure by the positive function $w$ to obtain $Lambda$; this is locally finite and has finite weighted mass. If the normalized added-point mass is $lambda_oo$, put $z = 6 lambda_oo$. Rearranging annihilation of (16.20) is exactly (16.19). ◻
]

The separation argument has supplied a probability measure on all minimizing enclosures, not a fixed-horizon first variation. Our next task is to remove its interior support. We do this before extracting a homogeneous adjoint field: compact normal motions test the trace of $K$ on the minimizing frontiers, and the resulting MOTS equation brings outermostness into the argument.

=== 16.3 Normal graph tests <normal-graph-tests>

The measure $pi.alt$ may initially be supported on several enclosures of the same area. The next argument uses variations of the original data to show that it is supported on the original horizon. It is local in the open exterior and assumes no complete ambient development.

#thm([Lemma 16.7.])[
  (Compact normal tests annihilating active constraints).  #emph[For every $ell in C_c^oo \( "int" Omega \)$, there are smooth variations $H_j = \( h_j \, p_j \) in cal(V)_0$, all supported in one fixed compact subset of the open exterior, such that 
$ h_j = 2 ell K \, #h(2em) C'_(H_j) arrow.r 0 $

 uniformly on the active rays over that compact set.]
] <q4:var:normal-tests>

#proof[
  Choose a relatively compact open neighborhood of $"supp" ell$ in $"int" Omega$ and apply Lemma 14 there in spatial dimension four, with $s = ell$ and $delta = 1 \/ j$. The present densities already satisfy $2 mu = R_g + \( "tr"_g K \)^2 - \| K \|_g^2$ and $J = "div"_g \( K - \( "tr"_g K \) g \)$, with $mu gt.eq \| J \|_g$. The smoothness and future-normal convention (14.1) are precisely those of the lemma. Equation (16.4) defines the same constraint $C = 2 \( mu + J \( v \) \)$ and the same isometric ray transport, so its derivative is the derivative $frak(C)'$ in that lemma.
  The resulting pairs have metric component $2 ell K$ and fixed compact support in the open exterior. They therefore belong to $cal(V)_0$ by Definition 88, and the lemma gives the asserted uniform convergence, including active rays at which $mu = 0$. Their charge, boundary, and end-coefficient variations vanish because the support stays strictly inside the open exterior. ◻
]

#thm([Proposition 16.8.])[
  (Localization of the area multiplier).  #emph[For $pi.alt$-almost every element of $cal(T)$, its frontier equals $S$, where $pi.alt$ is the measure in Proposition 91. Consequently, for every variation $H = \( h \, p \)$ in $cal(V)$, 
#[#set math.equation(numbering: n => "(16.21)")
 $ integral_(cal(T)) a'_T \( h \) thin thin upright(d) pi.alt \( T \) = a'_S \( h \) = 1 / 2 integral_S "tr"_S h thin thin upright(d) A_g . $ <q4:var:localized-area>]

 In particular the multiplier identity becomes 
#[#set math.equation(numbering: n => "(16.22)")
 $ 6 omega cal(E)' \( H \) - c thin a'_S \( h \) = chevron.l C'_H \, Lambda chevron.r - integral_S theta'_H thin thin upright(d) eta + z a . $ <q4:var:localized-identity>]

]
] <q4:var:area-localization>

#proof[
  Apply Equation (16.19) to the variations in Lemma 92. Their charge, boundary, and end-coefficient terms vanish, and $Lambda$ is finite over their fixed compact support. Since the metric component is $2 ell K$ and $c > 0$, uniform convergence of the active constraint derivatives gives
  #[#set math.equation(numbering: n => "(16.23)")
   $ integral_(cal(T)) integral_T ell thin "tr"_T K thin thin upright(d) A_g thin thin upright(d) pi.alt \( T \) = 0 #h(2em) upright("for every ") ell in C_c^oo \( "int" Omega \) . $ <q4:var:trace-test>]
  Propositions 83 and 85 give exactly the geometry needed for Proposition 15: the full frontiers have area $A$, lie in one compact set, have smooth minimal free parts and $C^(1 \, 1)$ contact graphs, and carry a continuous common tangent plane away from $S$. The surface-area kernel is measurable by the tangent-plane measure topology. Their end sides are connected, and each entire smooth frontier is an admissible full cut; no component or contact area is discarded.
  Definition 81 supplies connectedness and marginality of $S$, outer area-minimality, and the wholly-interior outermostness condition in case (a) of Proposition 15. Hence almost every frontier equals $S$. Its area-derivative conclusion gives Equation (16.21); substituting this into Equation (16.19) gives Equation (16.22). ◻
]

== 17 A causal stationary field on the original exterior <q4:adj:section>

We continue with the original equality data $\( Omega \, g \, K \)$ of Definition 81. In particular, $S = partial Omega$ is connected, $theta_(+) = 0$ on $S$, and $S$ is outer area-minimizing. The constants fixed in Section 16 are

$ r_0 = sqrt(2 m) \, #h(2em) b^0 = E / m \, #h(2em) b^i = - P_i / m \, #h(2em) c = 2 / r_0 \, #h(2em) kappa = c / 2 = 1 / r_0 . $

Thus $\( b^0 \)^2 - \| b \|^2 = 1$ and $b^0 > 0$. We fix the same exponent $1 < q_0 < min { q \, 2 }$ as in the strict variation constructed there. The purpose of this section is to extract a smooth field from the multiplier and to retain all information about the original second fundamental form.

#thm([Theorem 17.1.])[
  (Causal stationary field).  #emph[There are a smooth function $u$ and a smooth vector field $X$ on $Omega$, smooth up to its one-sided boundary, with the following properties.]
  + #emph[They satisfy $u gt.eq \| X \|_g$, $u > 0$ in $"int" Omega$, and 
#[#set math.equation(numbering: n => "(17.1)")
 $ u mu + J \( X \) = 0 . $ <q4:adj:complementarity>]

 With symmetric indices denoting averaging, their equations are 
#[#set math.equation(numbering: n => "(17.2)")
 $ nabla_(\( i) X_(j \)) & = - u K_(i j) \,\
Delta u & = - "div"_g #scale(x: 120%, y: 120%)[\(] K \( X \, dot.op \)^sharp #scale(x: 120%, y: 120%)[\)] \,\
nabla^2 u & = u \( "Ric"_g + tau K - 2 K^2 \) - cal(L)_X K + X_(\( i) J_(j \)) . $ <q4:adj:kid-first>]

 Here $X_i = g_(i j) X^j$ and $\( K^2 \)_(i j) = K_(i k) K^k zws_j$.]
  + #emph[On the chosen asymptotically flat end, 
#[#set math.equation(numbering: n => "(17.3)")
 $ \( u \, X \) = \( b^0 \, b \) + O_2 \( r^(- q_0) \) . $ <q4:adj:decay>]

]
  + #emph[At the boundary, for the unit normal $nu$ pointing into $Omega$, 
#[#set math.equation(numbering: n => "(17.4)")
 $ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa . $ <q4:adj:horizon-data>]

 Either $u > 0$ everywhere on $S$ or $u = 0$ everywhere on $S$.]
  + #emph[On $bb(R) times "int" Omega$, set 
#[#set math.equation(numbering: n => "(17.5)")
 $ upright(bold(g)) = - u^2 thin upright(d) t^2 + g_(i j) \( upright(d) x^i + X^i thin upright(d) t \) \( upright(d) x^j + X^j thin upright(d) t \) \, #h(2em) xi = partial_t \, #h(2em) N = u^2 - \| X \|_g^2 . $ <q4:adj:stationary-metric>]

 For the future normal $n = u^(- 1) \( xi - X \)$, the slice $t = 0$ has exactly the original induced metric $g$ and second fundamental form $K$, with the convention of Theorem 82. Moreover, 
#[#set math.equation(numbering: n => "(17.6)")
 $ "Ric"_(upright(bold(g))) \( xi \, dot.op \) = 0 \, #h(2em) "Ric"_(upright(bold(g))) = 0 quad upright("on ") { N > 0 } . $ <q4:adj:ricci>]

]
  + #emph[We have $N gt.eq 0$, $N arrow.r 1$ at infinity, and $N > 0$ in a full collar just outside $S$. More precisely, in the positive boundary-lapse case, 
#[#set math.equation(numbering: n => "(17.7)")
 $ N \|_S = 0 \, #h(2em) upright(d) N \|_S = 2 u kappa thin nu^flat = 2 kappa X^flat . $ <q4:adj:positive-collar>]

 In the zero boundary-lapse case, if $s gt.eq 0$ is the original $g$-normal distance from $S$, there are smooth one-sided fields $d \, Y_2$ such that 
#[#set math.equation(numbering: n => "(17.8)")
 $ u = s d \, #h(2em) X = s^2 Y_2 \, #h(2em) d \|_S = kappa \, #h(2em) N = s^2 #scale(x: 120%, y: 120%)[\(] d^2 - s^2 \| Y_2 \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <q4:adj:zero-collar>]

 Consequently all zeros of $N$ in $"int" Omega$ lie in a compact subset of that interior.]
] <q4:adj:causal-field>

The proof occupies the remainder of this section. At no point do we assume that the original data are vacuum or that they lie in a prescribed stationary development. The metric in (17.5) is constructed from the multiplier.

=== 17.1 From a positive measure to the interior adjoint equations <q4:adj:measures>

By Proposition 91 and the area localization in Proposition 93, the multiplier identity is

#[#set math.equation(numbering: n => "(17.9)")
 $ 6 omega thin cal(E)' \( H \) - c thin a'_S \( h \) = chevron.l C'_H \, Lambda chevron.r - integral_S theta'_H thin upright(d) eta + z a \, #h(2em) H = a Q + H_0 . $ <q4:adj:localized-multiplier>]

The coefficient $a$ is the coefficient of the strict direction $Q$ in the variation space. We recall that

$ C \( x \, v \) = R_g + tau^2 - \| K \|^2 + 2 J \( v \) \, #h(2em) \| v \|_g lt.eq 1 \, $

that $Lambda$ is a positive locally finite measure on the active set $C = 0$, and that the test-vector identification for a metric variation $h$ has $dot(v) = - 1 / 2 h^sharp v$.

Let $u$ be the scalar pushforward of $Lambda$ to $Omega$, and let $X$ be its vector first moment. Initially these symbols denote measures: for a compactly supported scalar $f$ and covector $alpha$,

$ chevron.l u \, f chevron.r = integral f \( x \) thin upright(d) Lambda \( x \, v \) \, #h(2em) chevron.l X \, alpha chevron.r = integral alpha_x \( v \) thin upright(d) Lambda \( x \, v \) . $

The unit-ball condition and positivity give $\| X \|_g lt.eq u$ as measures, while activity gives $mu u + J \( X \) = 0$ as a measure. We use $upright(d) V_g$ as the reference density when expressing the resulting distributional equations. After establishing smoothness, we use the same letters for the smooth densities of these measures.

#thm([Lemma 17.2.])[
  (Interior adjoint equations).  #emph[The moment measures have smooth densities on $"int" Omega$. They satisfy (17.1)–(17.2) there, and $u gt.eq \| X \|_g$ there.]
] <q4:adj:interior-equations>

#proof[
  For a variation supported in the open exterior, every term of (17.9) except the constraint pairing vanishes. For a pure tensor variation $p = dot(K)$, that pairing is
  $ 2 chevron.l u \, tau "tr"_g p - K : p #scale(x: 120%, y: 120%)[chevron.r] + 2 chevron.l X \, nabla^j \( p_(i j) - \( "tr"_g p \) g_(i j) \) #scale(x: 120%, y: 120%)[chevron.r] . $
  Its distributional adjoint equation is
  #[#set math.equation(numbering: n => "(17.10)")
   $ u \( tau g - K \) - nabla_(\( i) X_(j \)) + \( "div" X \) g = 0 . $ <q4:adj:tensor-adjoint>]
  Taking the trace in four dimensions gives $3 u tau + 3 "div" X = 0$. Substitution proves (17.2).
  For the conformal variation $\( h \, p \) = \( 2 psi g \, psi K \)$, the constraint transformation already established in Section 16 gives, on active rays,
  $ C'_H \( x \, v \) = 6 { - Delta psi + K \( nabla psi \, v \) } . $
  Its adjoint is (17.2). This calculation is valid for measure moments, so both equations hold in distributions before any regularity assertion.
  Diverge (17.2) and substitute $"div" X = - u tau$. Commuting covariant derivatives gives a Laplace equation for $X$ whose right side consists of smooth coefficients times $u \, X \, nabla u$. In (17.2), the right side consists of smooth coefficients times $X \, nabla X$. Thus the coupled system has diagonal Laplace principal part on the scalar and vector bundles; all couplings have order at most one. Distributional interior elliptic regularity, iterated with the smooth coefficients, makes both densities smooth. The measure inequalities and complementarity now give the asserted pointwise statements.
  It remains to verify the full metric equation, including its matter term. We may now work with smooth $u \, X$. For a pure metric variation $h$, keep covariant $K$, scalar $u$, and contravariant $X$ fixed. The constraint pairing is the variation of
  #[#set math.equation(numbering: n => "(17.11)")
   $ integral #scale(x: 120%, y: 120%)[\[] u \( R + tau^2 - \| K \|^2 \) + 2 X^i nabla^j \( K_(i j) - tau g_(i j) \) #scale(x: 120%, y: 120%)[\]] thin upright(d) V_g $ <q4:adj:metric-functional>]
  minus $integral h \( X \, J^sharp \) thin upright(d) V_g$. The latter is precisely the contribution of $dot(v) = - 1 / 2 h^sharp v$. In using the varying volume form in (17.11), no term has been added: its original integrand is $2 u mu + 2 J \( X \) = 0$ pointwise.
  For completeness, put $pi^(i j) = K^(i j) - tau g^(i j)$. Integrating the shift term once by parts gives $- integral pi^(i j) \( cal(L)_X g \)_(i j) thin upright(d) V_g$, with unchanged boundary terms outside the variation support. At fixed covariant $K$,
  $ delta pi^(i j) = - h^i zws_a K^(a j) - h^j zws_a K^(i a) + \( K : h \) g^(i j) + tau h^(i j) . $
  Variation of the last integral, followed by integration of the term $- pi^(i j) \( cal(L)_X h \)_(i j)$, has coefficient
  #[#set math.equation(numbering: n => "(17.12)")
   $ cal(L)_X K - \( "div" X \) K - { X \( tau \) + K^(a b) nabla_a X_b } g . $ <q4:adj:shift-coefficient>]
  One can see the cancellations directly: if $B = cal(L)_X g$, the variation of $pi$ contributes $2 "Sym" \( K B \) - \( "tr" B \) K - tau B$; integration of $cal(L)_X h$ contributes $\( cal(L)_X pi \)^(i j) + \( "div" X \) pi^(i j)$ with indices lowered; and the volume variation contributes $- 1 / 2 \( pi : B \) g$. Together they are (17.12).
  The scalar and quadratic terms in (17.11) have coefficient
  $ nabla^2 u - \( Delta u \) g - u "Ric"_g + 2 u \( K^2 - tau K \) + u mu g . $
  Adding (17.12) and the test-vector correction therefore gives
  #[#set math.equation(numbering: n => "(17.13)")
   $ 0 =  & nabla^2 u - \( Delta u \) g - u "Ric"_g + 2 u \( K^2 - tau K \) + u mu g\
 & + cal(L)_X K - \( "div" X \) K - { X \( tau \) + K^(a b) nabla_a X_b } g - X_(\( i) J_(j \)) . $ <q4:adj:metric-adjoint-expanded>]
  Equation (17.2) gives $K^(a b) nabla_a X_b = - u \| K \|^2$. Moreover, using $nabla^j K_(i j) = J_i + nabla_i tau$ in (17.2) gives
  #[#set math.equation(numbering: n => "(17.14)")
   $ Delta u + X \( tau \) = u \| K \|^2 - J \( X \) = u \( \| K \|^2 + mu \) . $ <q4:adj:trace-identity>]
  Together with $"div" X = - u tau$, these identities cancel the scalar multiples of $g$ in (17.13) and give (17.2). ◻
]

The multiplier now has smooth interior densities and satisfies the full adjoint system, including its matter term. To use it as a geometric field we still need its boundary behavior and its normalization at infinity. Both follow from the same equations and the allowed variations; neither is imposed as an additional boundary condition.

=== 17.2 Boundary regularity and the asymptotic constants <boundary-regularity-and-the-asymptotic-constants>

#thm([Lemma 17.3.])[
  (Prolongation and absence of boundary atoms).  #emph[The fields $u \, X$ extend smoothly to the one-sided boundary $S$. Their first jet at one interior point determines them on the connected interior. The original moment measures have no boundary-supported part, and hence are exactly $u thin upright(d) V_g$ and $X thin upright(d) V_g$ on all of $Omega$.]
] <q4:adj:boundary-regularity>

#proof[
  Put $B_(i j) = - u K_(i j)$. Differentiate $nabla_(\( i) X_(j \)) = B_(i j)$ in three arrangements, add two of the resulting equations, and subtract the third. Commuting derivatives gives
  #[#set math.equation(numbering: n => "(17.15)")
   $ nabla_i nabla_j X_k & = nabla_i B_(j k) + nabla_j B_(i k) - nabla_k B_(i j) + cal(R)_(i j k) \( X \) \,\
cal(R)_(i j k) \( X \) & = - 1 / 2 #scale(x: 120%, y: 120%)[\(] \( \[ nabla_j \, nabla_i \] X \)_k + \( \[ nabla_i \, nabla_k \] X \)_j + \( \[ nabla_j \, nabla_k \] X \)_i #scale(x: 120%, y: 120%)[\)] . $ <q4:adj:prolongation-x>]
  Every commutator is a curvature contraction with $X$. Thus this equation uses only $K nabla u$, $u nabla K$, and curvature times $X$. Expanding the Lie derivative in (17.2) gives
  #[#set math.equation(numbering: n => "(17.16)")
   $ nabla_i nabla_j u =  & u \( "Ric"_(g \, i j) + tau K_(i j) - 2 \( K^2 \)_(i j) \) - X^a nabla_a K_(i j)\
 & - K_(a j) nabla_i X^a - K_(i a) nabla_j X^a + X_(\( i) J_(j \)) . $ <q4:adj:prolongation-u>]
  Consequently
  $ cal(J) = \( u \, X \, nabla u \, nabla X \) $
  obeys a homogeneous linear first-order system, with smooth coefficients built from $g \, K$, their required derivatives, and $J$. Along any smooth curve, this is a linear ODE for $cal(J)$. Uniqueness along curves proves the first-jet assertion.
  In a compact collar of $S$, start on an interior collar section and solve this ODE along the normal segments down to $S$. Its coefficients are smooth up to the one-sided boundary. Smooth dependence on the initial point and on the normal parameter provides the smooth extension, agreeing with the original solution for positive collar parameter. The pointwise inequalities and complementarity extend by continuity.
  The original moments could still have parts supported on $S$; the interior regularity alone does not exclude them. Let $s$ be geodesic collar distance, let $f in C^oo \( S \)$ be arbitrary and extended constantly along the normal segments, and take a collar cutoff $chi$ equal to one near $S$. Choose the compact pure metric variation
  #[#set math.equation(numbering: n => "(17.17)")
   $ h = frac(s^2 chi \( s \) f, 6) #scale(x: 120%, y: 120%)[\(] g - upright(d) s ⊗ upright(d) s #scale(x: 120%, y: 120%)[\)] \, #h(2em) p = 0 . $ <q4:adj:boundary-atom-test>]
  This is one of the allowed smooth compact variations, with strict-direction coefficient $a = 0$. Its value and first jet vanish on $S$. The trace along the three-dimensional collar slices is $s^2 chi f \/ 2$, so its second normal derivative at $S$ is $f$. At $S$, the scalar variation
  $ R'_g \( h \) = nabla^i nabla^j h_(i j) - Delta \( "tr"_g h \) - "Ric"_g : h $
  therefore equals $- f$: the only nonzero second jets are normal-normal derivatives of tangential components, whereas $h_(s s) = h_(s A) = 0$. The variation of $tau^2 - \| K \|^2$ uses only $h$, that of $J$ at fixed covariant $K$ uses only $h \, nabla h$, and the test-vector correction uses only $h$. Consequently $C'_H \|_S = - f$, independently of the active ray $v$.
  The area derivative vanishes because $h \|_S = 0$; the expansion derivative vanishes because $h \|_S = nabla h \|_S = p \|_S = 0$; and the charge derivative vanishes by compact support. Integrating the smooth interior densities by parts gives zero as well: the adjoint vanishes, and its scalar boundary terms involve only $h \, nabla h$, while its momentum boundary terms involve only $h$. This is ordinary integration up to $S$ using the one-sided smooth fields, not distributional differentiation of a zero extension across $S$. Thus (17.9) says that the scalar boundary measure annihilates every $f in C^oo \( S \)$, and that measure is zero. The inequality $\| X \|_g lt.eq u$ as measures eliminates the vector boundary part. Moreover, since $u$ is the pushforward of the positive measure $Lambda$, the entire measure $Lambda$ has zero mass over $S$, not merely zero first moment there. ◻
]

We first obtain constant limits from a Hessian estimate and causality. Related radial estimates for asymptotic Killing fields appear in #cite(label("BeigChrusciel1996")) Proposition 2.1 and Appendix C. The normalization of the limits will then follow from the end variations.

#thm([Lemma 17.4.])[
  (Asymptotics of causal fields).  #emph[Let $g$ be a smooth metric uniformly comparable to the Euclidean metric on an end $bb(R)^4 \\ overline(B)_R$. Let $u$ be a smooth function and $X$ a smooth vector field there with $u gt.eq \| X \|_g$. Write $Y$ for all coordinate components of $\( u \, X \)$. Suppose that, for some $q_0 > 1$ and a constant $C$, the coordinate derivatives satisfy 
#[#set math.equation(numbering: n => "(17.18)")
 $ \| partial^2 Y \| lt.eq C r^(- 1 - q_0) \| partial Y \| + C r^(- 2 - q_0) \| Y \| . $ <q4:adj:jet-estimate>]

 Then there are constants $u_oo$ and $X_oo in bb(R)^4$ such that 
$ \( u \, X \) = \( u_oo \, X_oo \) + O_2 \( r^(- q_0) \) . $

]
] <q4:adj:causal-jet-asymptotics>

#proof[
  Fix a sufficiently large coordinate sphere of radius $R$ and put
  $ D \( r \) = sup_(omega in S^3) \| partial Y \( r omega \) \| \, #h(2em) cal(M) \( r \) = sup_(R lt.eq t lt.eq r) D \( t \) . $
  Along each ray, $\| Y \( t omega \) \| lt.eq C + integral_R^t D \( a \) thin upright(d) a lt.eq C + t cal(M) \( t \)$, uniformly in $omega$. Integrating $partial_r \( partial Y \)$ using (17.18), and then taking the supremum over directions and radii at most $r$, gives
  $ cal(M) \( r \) lt.eq C + C integral_R^r t^(- 1 - q_0) cal(M) \( t \) thin upright(d) t . $
  The kernel is integrable. Gronwall therefore bounds $cal(M)$ uniformly, so $partial Y = O \( 1 \)$ and $Y = O \( r \)$. Equation (17.18) now gives $partial^2 Y = O \( r^(- 1 - q_0) \)$. Each coordinate derivative has a radial limit $L \( omega \)$, with error $O \( r^(- q_0) \)$. Any two points on the sphere of radius $r$ can be joined by a spherical arc of length at most $pi r$; integrating the Hessian along this arc gives an $O \( r^(- q_0) \)$ difference between their gradients. Letting $r arrow.r oo$ shows that $L \( omega \)$ is one constant matrix $L$. Radial integration of $partial Y - L$ then gives
  $ partial Y = L + O \( r^(- q_0) \) \, #h(2em) Y = L x + O \( 1 \) \, $
  where boundedness of the second error uses $q_0 > 1$. Since $u gt.eq 0$ in every direction, the linear part of $u$ vanishes. Uniform comparability of $g$ with the Euclidean metric and $\| X \|_g lt.eq u$ then force the linear part of $X$ to vanish as well. Thus $Y = O \( 1 \)$ and $partial Y = O \( r^(- q_0) \)$. Substitution in (17.18), using $q_0 > 1$, improves the Hessian bound to $O \( r^(- 2 - q_0) \)$. Integrating each gradient component radially toward its zero limit gives $partial Y = O \( r^(- 1 - q_0) \)$. A further radial integration gives $Y = B \( omega \) + O \( r^(- q_0) \)$; comparison of values along the same spherical arcs now gives an $O \( r^(- q_0) \)$ difference, so $B$ too is independent of direction. This proves the asserted constant limit and both differentiated estimates. ◻
]

#thm([Lemma 17.5.])[
  (Asymptotic normalization and positive lapse).  #emph[Equation (17.3) holds, and $u > 0$ on $"int" Omega$.]
] <q4:adj:asymptotics>

#proof[
  Let $Y$ denote all coordinate components of the pair $\( u \, X \)$. The prolonged system and the original $O_2$ metric and $O_1$ tensor decay imply Equation (17.18). Indeed curvature, $nabla K$, and $J$ have order $- 2 - q_0$, while $K$ and the Christoffel symbols have order $- 1 - q_0$. Equations (17.15) and (17.16) use no higher background derivatives. Converting their covariant Hessians to coordinate Hessians adds terms with coefficients $Gamma$, $partial Gamma$, and $Gamma^2$, controlled by the stated $O_2$ metric decay.
  Lemma 97 now gives constants with
  #[#set math.equation(numbering: n => "(17.19)")
   $ \( u \, X \) = \( u_oo \, X_oo \) + O_2 \( r^(- q_0) \) . $ <q4:adj:unnormalized-decay>]
  Use the five end prototypes of Definition 88, whose charge derivatives are computed in Lemma 89, in (17.9). Their strict-direction coefficient is $a = 0$, so the term $z a$ is absent; their boundary and area terms vanish because the prototypes are supported away from $S$. Integration by parts using the interior adjoint equations leaves only the outer boundary flux. By (17.19), its limit is
  #[#set math.equation(numbering: n => "(17.20)")
   $ 6 omega #scale(x: 120%, y: 120%)[\(] u_oo E' + X_oo^i P'_i #scale(x: 120%, y: 120%)[\)] . $ <q4:adj:charge-flux>]
  For clarity, the leading integrand is
  $ u_oo \( partial_j h_(i j) - partial_i h_(j j) \) + 2 X_oo^j #scale(x: 120%, y: 120%)[\(] p_(i j) - \( "tr"_delta p \) delta_(i j) #scale(x: 120%, y: 120%)[\)] . $
  This is exactly (17.20) with the energy and momentum normalizations of Equations (14.3)–(14.3). Every other boundary term contains a decaying background or adjoint coefficient, or its derivative, paired with $h = O_2 \( r^(- 2) \)$ or $p = O_1 \( r^(- 3) \)$ at the corresponding order. Multiplication by the sphere area $O \( r^3 \)$ makes each such flux tend to zero. The volume pairing converges as well: the prototype constraint derivatives are $O \( r^(- 4 - q) \)$ and the moment densities are bounded.
  The scalar prototype $h = r^(- 2) delta$, $p = 0$, has $\( E' \, P' \) = \( 1 \, 0 \)$. For the tensor prototype indexed by a constant vector $e$, its Euclidean trace reversal contracts with the sphere normal to $r^(- 3) e$, and thus has $\( E' \, P' \) = \( 0 \, e \/ 3 \)$. These independent charges identify $\( u_oo \, X_oo \) = \( b^0 \, b \)$ from (17.9) and (17.20). This proves (17.3).
  If $u$ vanished at an interior point, its nonnegativity would give $upright(d) u = 0$ there. Taylor’s theorem and $\| X \| lt.eq u$ would give $X = 0$ and $nabla X = 0$ at the same point. The whole first jet would vanish, contradicting Lemma 96 and $u_oo = b^0 > 0$. ◻
]

=== 17.3 Boundary fluxes and the two lapse cases <boundary-fluxes-and-the-two-lapse-cases>

#thm([Lemma 17.6.])[
  (Boundary equations).  #emph[The multiplier measure at $S$ is $upright(d) eta = 2 u thin upright(d) A_g$, and (17.4) holds.]
] <q4:adj:boundary-data>

#proof[
  Take arbitrary compact pure tensor variations up to $S$. The actual outward normal of the exterior domain at its inner boundary is $- nu$. Integration by parts in (17.9) therefore gives
  $ - 2 integral_S #scale(x: 120%, y: 120%)[\[] p \( X \, nu \) - \( "tr"_g p \) X_nu #scale(x: 120%, y: 120%)[\]] thin upright(d) A_g - integral_S \( "tr"_S p \) thin upright(d) eta = 0 . $
  Arbitrary mixed components $p_(nu A)$ imply $X_(T S) = 0$, and arbitrary tangential trace implies $upright(d) eta = 2 X_nu thin upright(d) A_g$.
  Now take $\( h \, p \) = \( 2 psi g \, psi K \)$ with arbitrary compact support up to $S$. At a MOTS, its expansion derivative is $3 partial_nu psi$, while its area derivative is $3 integral_S psi thin upright(d) A_g$. Integrating its constraint pairing with (17.2) gives
  $ - 3 c integral_S psi thin upright(d) A_g =  & 6 integral_S [u partial_nu psi - { partial_nu u + K \( X \, nu \) } psi] thin upright(d) A_g - 3 integral_S partial_nu psi thin upright(d) eta . $
  The boundary value and normal derivative of $psi$ can be prescribed independently. Their coefficients give $upright(d) eta = 2 u thin upright(d) A_g$ and $partial_nu u + K \( X \, nu \) = c \/ 2$. Together with the tensor-variation conclusions these are exactly (17.4). ◻
]

#thm([Lemma 17.7.])[
  (Boundary lapse dichotomy).  #emph[Either $u > 0$ at every point of $S$ or $u = 0$ identically on $S$.]
] <q4:adj:lapse-dichotomy>

#proof[
  Let $L_S$ be the expansion variation at $S$ under normal motion with speed $s nu$. Its principal part is $- Delta_S$. More explicitly, in a geodesic normal extension of $nu$, if $upright("II")$ is the second fundamental form of $S$ in $\( Omega \, g \)$,
  $ L_S s = - Delta_S s + 2 K \( nu \, nabla_S s \) + [- \| upright("II") \|^2 - "Ric"_g \( nu \, nu \) + "tr"_(T S) \( nabla_nu K \)] s . $
  Only the smoothness of the lower coefficients and the displayed principal part will be needed.
  Extend $s nu$ to a smooth compactly supported vector field $Y_1$ up to the boundary, and use $H = \( cal(L)_(Y_1) g \, cal(L)_(Y_1) K \)$ in (17.9). These are legitimate one-sided tensor variations; one may compute their jets using any smooth extension across $S$. Their area and expansion derivatives are respectively $integral_S H s thin upright(d) A_g$ and $L_S s$.
  We check the active-ray derivative with the specified vector identification. At a fixed interior point put $cal(A) \( v \) = nabla_v Y_1$, so $h^sharp = cal(A) + cal(A)^(*)$, where the adjoint uses $g$. Let $phi.alt_t$ be the local flow of $Y_1$ and let $v_t$ be the isometrically identified test vector for $g_t = phi.alt_t^(*) g$. Naturality gives
  $ C_(phi.alt_t^(*) g \, phi.alt_t^(*) K) \( x \, v_t \) = C_(g \, K) \( phi.alt_t x \, upright(d) phi.alt_t \( v_t \) \) . $
  At $t = 0$, the covariant velocity of the vector on the right, relative to parallel transport along $phi.alt_t x$, is
  $ cal(A) \( v \) + dot(v) = cal(A) \( v \) - 1 / 2 \( cal(A) + cal(A)^(*) \) v = 1 / 2 \( cal(A) - cal(A)^(*) \) v . $
  It is perpendicular to $v$. The base derivative of $C$, with $v$ parallel transported, vanishes at an interior active ray because it differentiates a nonnegative function at a two-sided interior minimum. The remaining vector derivative is $2 J \( 1 / 2 \( cal(A) - cal(A)^(*) \) v \)$, also zero: at an active unit ray $J = - mu v^flat$, and at an active ray with $\| v \| < 1$ we have $mu = J = 0$. Therefore $C'_H = 0$ at every interior active ray.
  The vector field $Y_1$ need not preserve $S$: its compact Lie derivatives are permitted tensor variations, independently of feasibility of a flow on the whole exterior. No normal derivative at a one-sided boundary minimum is being set equal to zero. Such boundary rays contribute no integral because $Lambda$ has zero mass over $S$ by Lemma 96. Thus the entire constraint pairing vanishes. The multiplier identity and $upright(d) eta = 2 u thin upright(d) A_g$ now read
  $ - c integral_S H s thin upright(d) A_g = - 2 integral_S u L_S s thin upright(d) A_g \, $
  and hence give
  #[#set math.equation(numbering: n => "(17.21)")
   $ 2 L_S^(*) u = c H . $ <q4:adj:boundary-stability-adjoint>]
  Here the adjoint is with respect to $upright(d) A_g$ on the closed manifold $S$.
  Outer area minimization, tested against every nonnegative outward normal speed, gives $H gt.eq 0$ pointwise. Hence $L_S^(*) u gt.eq 0$ and $u gt.eq 0$ on $S$. Increase the zeroth coefficient of $L_S^(*)$ by a constant until that coefficient is nonnegative. The inequality remains valid because $u gt.eq 0$. The strong minimum principle for this operator with principal part $- Delta_S$ shows that a zero of $u$ forces $u$ to vanish on the connected surface $S$. Otherwise it is everywhere positive. ◻
]

We have identified the field at the horizon and at infinity. These identities let us construct a stationary spacetime containing the original slice. Causality and complementarity will make that spacetime vacuum on the timelike region; an initially possible null stress must remain in the calculation until that region is identified.

=== 17.4 The constructed spacetime and its null stress <the-constructed-spacetime-and-its-null-stress>

#thm([Lemma 17.8.])[
  (Killing development and timelike collars).  #emph[The metric in (17.5) has all the properties in parts (iv) and (v) of Theorem 94.]
] <q4:adj:killing-development>

#proof[
  The interior positivity of $u$ makes (17.5) a smooth Lorentzian metric, with future normal $n = u^(- 1) \( partial_t - X \)$ after choosing the indicated time orientation. In the convention of the problem, the second fundamental form of a lapse-shift metric is
  $ frac(1, 2 u) #scale(x: 120%, y: 120%)[\(] partial_t g - cal(L)_X g #scale(x: 120%, y: 120%)[\)] . $
  Its coefficients here are independent of $t$, and (17.2) identifies this tensor with the original $K$. The vector field $xi = partial_t$ is Killing by construction.
  We record the curvature computation to fix both the matter term and the sign convention. The Gauss and normal-variation identities for a general lapse-shift metric, with positive second fundamental form convention, are
  $ "Ric"_(upright(bold(g)) \, i j) & = "Ric"_(g \, i j) + tau K_(i j) - 2 \( K^2 \)_(i j) + u^(- 1) #scale(x: 120%, y: 120%)[\(] partial_t K_(i j) - \( cal(L)_X K \)_(i j) - \( nabla^2 u \)_(i j) #scale(x: 120%, y: 120%)[\)] \,\
"Ric"_(upright(bold(g))) \( n \, n \) & = - u^(- 1) \( partial_t tau - X tau \) - \| K \|^2 + u^(- 1) Delta u . $
  Tracing these equations uses
  $ g^(i j) #scale(x: 120%, y: 120%)[\(] partial_t K_(i j) - \( cal(L)_X K \)_(i j) #scale(x: 120%, y: 120%)[\)] = partial_t tau - X tau + 2 u \| K \|^2 . $
  In the stationary case this yields
  #[#set math.equation(numbering: n => "(17.22)")
   $ "Ric"_(upright(bold(g)) \, i j) & = "Ric"_(g \, i j) + tau K_(i j) - 2 \( K^2 \)_(i j) - u^(- 1) #scale(x: 120%, y: 120%)[\(] \( cal(L)_X K \)_(i j) + \( nabla^2 u \)_(i j) #scale(x: 120%, y: 120%)[\)] \,\
R_(upright(bold(g))) & = R_g + tau^2 + \| K \|^2 - 2 u^(- 1) \( Delta u + X tau \) . $ <q4:adj:spatial-ricci>]
  Equation (17.14) and complementarity show that
  $ R_(upright(bold(g))) = 2 mu + frac(2 J \( X \), u) = 0 . $
  Writing $upright(bold(G))$ for the Einstein tensor, the constraints and (17.2) consequently give
  #[#set math.equation(numbering: n => "(17.23)")
   $ upright(bold(G)) \( n \, n \) = mu \, #h(2em) upright(bold(G)) \( n \, e_i \) = J_i \, #h(2em) u upright(bold(G))_(i j) = - X_(\( i) J_(j \)) . $ <q4:adj:einstein-components>]
  These identities can also be compared with the transversal Killing construction in #cite(label("BeigChrusciel1997KID")); its momentum symbol has the opposite sign to the one used here. The null-fluid structure of a modified constraint adjoint is discussed in #cite(label("HuangLee2024Bartnik")) Section 6.1. We use the displayed direct calculation, in four spatial dimensions, rather than importing a stationarity or dimensional-transfer theorem.
  If $mu = 0$, the dominant energy condition gives $J = 0$, so all entries in (17.23) vanish. If $mu > 0$, the inequalities
  $ 0 = u mu + J \( X \) gt.eq u mu - \| J \| \| X \| gt.eq 0 $
  force $\| J \| = mu$, $\| X \| = u$, and $J = - mu X^flat \/ u$. Since $upright(bold(g)) \( xi \, n \) = - u$ and $upright(bold(g)) \( xi \, e_i \) = X_i$, the tensor with components (17.23) is exactly
  #[#set math.equation(numbering: n => "(17.24)")
   $ upright(bold(G)) = mu / u^2 thin xi^flat ⊗ xi^flat quad upright("where ") mu > 0 . $ <q4:adj:null-stress>]
  The Killing one-form in this equation is the spacetime one-form. It is null wherever the displayed tensor is nonzero. Thus $upright(bold(G)) \( xi \, dot.op \) = 0$ everywhere. Since $R_(upright(bold(g))) = 0$, this is the first assertion of (17.6). If $N > 0$, then $\| X \| < u$, so complementarity forces $mu = J = 0$; all the Ricci components vanish. This proves the second assertion. An internal null region has not been excluded or assumed vacuum.
  It remains to examine the original boundary and the end. Equation (17.3) gives $N arrow.r \( b^0 \)^2 - \| b \|^2 = 1$. At $S$, Equation (17.4) gives $X = u nu$, so $N = 0$ and all tangential derivatives of $N$ vanish. If $u > 0$ on $S$, Equation (17.2) gives $chevron.l nabla_nu X \, nu chevron.r = - u K \( nu \, nu \)$. Hence
  $ partial_nu N = 2 u #scale(x: 120%, y: 120%)[\(] partial_nu u + u K \( nu \, nu \) #scale(x: 120%, y: 120%)[\)] = 2 u kappa \, $
  which is (17.7). Compactness of $S$ supplies a full collar on which $N > 0$.
  In the other case, $u \|_S = 0$ and $X \|_S = 0$. Tangential derivatives of $X$ vanish. The normal-normal and normal-tangential components of (17.2) then give $nabla_nu X = 0$ on $S$, so every first derivative of $X$ vanishes there. Smooth one-sided division by normal distance gives $u = s d$ and $X = s^2 Y_2$. The boundary condition gives $d \|_S = partial_nu u \|_S = kappa > 0$. This is (17.8), and once again compactness gives a full collar with $N > 0$. Together with positivity far out on the unique end, these collars place all interior zeros of $N$ in an interior compact set. ◻
]

#proof[
  Combine Lemmas 95, 96, 98, 99, 100, and 101. ◻
]

== 18 The complete static base under weak decay <q4:sta:section>

The causal field of Theorem 94 satisfies the hypotheses of Proposition 34. We verify that application at the stated weak decay, and record the boundary coordinates needed to recover the original hypersurface. The harmonic-coordinate improvement and the exclusion of possible additional ends belong to the four-dimensional classification in Section 19.

Write

$ N = u^2 - \| X \|_g^2 \, #h(2em) cal(P) = { N > 0 } subset "int" Omega \, #h(2em) Z = { N = 0 } ∩ "int" Omega . $

The adjoint theorem gives $N gt.eq 0$, $N arrow.r 1$ at infinity, and a full positive collar of $S$. Thus $Z$ is compactly contained in the original interior. On $cal(P)$ set

#[#set math.equation(numbering: n => "(18.1)")
 $ h_b & = g + N^(- 1) X^flat ⊗ X^flat \, & C_b & = g^(- 1) - u^(- 2) X ⊗ X = h_b^(- 1) \,\
A_b & = N^(- 1) X^flat \, & lambda & = sqrt(N) . $ <q4:sta:base-variables>]

Here $X^flat$ is formed with $g$. The stationary metric is

#[#set math.equation(numbering: n => "(18.2)")
 $ upright(bold(g)) = - N \( d t - A_b \)^2 + h_b . $ <q4:sta:stationary-decomposition>]

#thm([Proposition 18.1.])[
  (Static base for the weak four-dimensional class).  #emph[The set $cal(P)$ is connected; denote it by $cal(U)$. On this set $d A_b = 0$, $0 < lambda < 1$, and 
#[#set math.equation(numbering: n => "(18.3)")
 $ lambda "Ric"_(h_b) = "Hess"_(h_b) lambda \, #h(2em) Delta_(h_b) lambda = 0 \, #h(2em) "Scal"_(h_b) = 0 . $ <q4:sta:static-equations>]

 Every approach to an interior zero of $N$ has infinite $h_b$-length. Adjoining $S$ gives a complete manifold with smooth one-sided metric $h_b$ and lapse $lambda$, with 
#[#set math.equation(numbering: n => "(18.4)")
 $ h_b \|_(T S) = g \|_(T S) \, #h(2em) lambda \|_S = 0 \, #h(2em) partial_(nu_(h_b)) lambda = kappa \, #h(2em) upright("II")_(h_b) = 0 \, #h(2em) kappa = 1 / sqrt(2 m) . $ <q4:sta:boundary-data>]

 The normal $nu_(h_b)$ points into the base exterior. The attachment is homeomorphic to the original attachment of $S$, and it is the only finite-distance boundary attachment. Its smooth structure is as follows:]
  + #emph[If $u \|_S > 0$, then $N$ is an original defining function and the base boundary structure replaces $N$ by $lambda = sqrt(N)$. The reflected metric is smooth and even, and the signed lapse is smooth and odd.]
  + #emph[If $u \|_S = 0$, the one-sided base metric and lapse are smooth in the original boundary structure. Their even and odd reflections in base normal distance are at least $C^2$.]
] <q4:sta:complete-base>

#proof[
  The original exterior is complete with $S$ included and has one asymptotically Euclidean end with compact complement. Its boundary is smooth, nonempty, compact and connected. Choose the exponent already used in the adjoint construction,
  $ 1 < q_0 < min { q \, 2 } . $
  The original metric has $g - delta = O_2 \( r^(- q_0) \)$, while Theorem 94 proves $\( u \, X \) = \( b^0 \, b \) + O_2 \( r^(- q_0) \)$, with $\( b^0 \)^2 - \| b \|^2 = 1$ and $b^0 > 0$. The same theorem supplies smoothness up to $S$, $u > 0$ in the interior, $u gt.eq \| X \|_g$, the first Killing initial-data equation, and
  $ "Ric"_(upright(bold(g))) \( partial_t \, dot.op \) = 0 \, #h(2em) "Ric"_(upright(bold(g))) = 0 quad upright("on ") cal(P) . $
  Its boundary equations and lapse dichotomy give the remaining hypotheses of Proposition 34, with the positive constant $kappa = 1 \/ sqrt(2 m)$.
  In particular, the shared twist argument needs only the differentiated end bounds just established. After subtracting the differential of a function equal to $b^i x^i$ far out, its test one-form is $beta = A_b - d f = O \( r^(- q_0) \)$. The current
  $ Q^(i j) = u N C_b^(i k) C_b^(j ell) \( d A_b \)_(k ell) $
  is $O \( r^(- 1 - q_0) \)$. Its cutoff term on a four-dimensional annulus is $O \( R^(2 - 2 q_0) \)$, which tends to zero because $q_0 > 1$. The compact null-set and horizon estimates use the smooth original fields and the boundary collars. Thus the original decay with two metric derivatives and one derivative of $K$ suffices for every conclusion of the shared proposition, giving the stated static equations, connectedness, completeness and attachment. ◻
]

===== 18.1 The attachment in original coordinates. <the-attachment-in-original-coordinates.>

The collar description fixes the original boundary structure in which the final embedding must be smooth. If $u \|_S > 0$, then $d N = 2 kappa X^flat$ on $S$. In original coordinates $\( N \, y^A \)$, smooth division therefore gives

$ X^flat = a thin d N + N beta_A thin d y^A \, #h(2em) a \( 0 \, y \) = frac(1, 2 kappa) . $

The base coordinates are $\( lambda \, y \)$ with $N = lambda^2$, and

#[#set math.equation(numbering: n => "(18.5)")
 $ \( h_b \)_(lambda lambda) & = 4 lambda^2 g_(N N) + 4 a^2 \,\
\( h_b \)_(lambda A) & = 2 lambda \( g_(N A) + a beta_A \) \,\
\( h_b \)_(A B) & = g_(A B) + lambda^2 beta_A beta_B . $ <q4:sta:positive-lapse-base-collar>]

Every original coefficient on the right is evaluated at $\( lambda^2 \, y \)$. The resulting smooth reflection is exactly $\( lambda \, y \) mapsto \( - lambda \, y \)$: the first and third coefficients are even and the middle coefficient is odd. At $S$ the cross terms vanish and $\( h_b \)_(lambda lambda) = kappa^(- 2)$.

If $u \|_S = 0$, the original normal distance $s$ instead gives $u = s d$, $X = s^2 Y_2$, and $d \|_S = kappa$, hence

$ h_b = g + frac(s^2 Y_2^flat ⊗ Y_2^flat, d^2 - s^2 \| Y_2 \|_g^2) \, #h(2em) lambda = s sqrt(d^2 - s^2 \| Y_2 \|_g^2) . $

These are smooth in the original collar. The static equation gives $"Hess"_(h_b) lambda = 0$ on $S$; in base normal coordinates the even metric and odd lapse therefore match derivatives through order two.

The proposition retains any complete ends caused by $Z$. The next section allows those ends throughout the conformal doubling and zero-mass argument, and excludes them only after identifying the double as Euclidean space.

== 19 Classification of the four-dimensional static base <q4:cla:section>

We now classify the static base obtained in Proposition 102. The positive set $cal(U) = { N > 0 }$ is connected and contains the boundary collar. On $cal(U)$ the metric $h_b$ and the lapse $lambda = sqrt(N)$ satisfy

#[#set math.equation(numbering: n => "(19.1)")
 $ lambda "Ric"_(h_b) = "Hess"_(h_b) lambda \, #h(2em) Delta_(h_b) lambda = 0 \, #h(2em) "Scal"_(h_b) = 0 \, #h(2em) 0 < lambda < 1 . $ <q4:cla:static-equations>]

The base is complete with $S$ attached; approaches to interior zeros of $N$ have infinite base length. Its boundary data are

#[#set math.equation(numbering: n => "(19.2)")
 $ h_b \|_(T S) = g \|_(T S) \, #h(2em) lambda \|_S = 0 \, #h(2em) partial_(nu_(h_b)) lambda = kappa \, #h(2em) upright("II")_(h_b) = 0 \, #h(2em) kappa = 1 / sqrt(2 m) . $ <q4:cla:boundary-data>]

These are conclusions of the preceding argument, not hypotheses on the original data. In particular, neither simple connectivity nor absence of additional complete ends of the base is available yet.

Our goal is both the explicit static metric and the identity $cal(U) = "int" Omega$ in Proposition 107. The argument allows additional complete ends until Euclidean rigidity of the conformal double excludes interior null regions and identifies the whole exterior.

=== 19.1 Improvement of the static asymptotics <improvement-of-the-static-asymptotics>

After a constant linear change of the coordinates at infinity, the positive limiting matrix of $h_b$ becomes the identity. For a fixed $q_0 in \( 1 \, min { q \, 2 } \)$ we then have $h_b - delta = O_2 \( r^(- q_0) \)$ and $lambda - 1 = O_2 \( r^(- q_0) \)$. Introduce

#[#set math.equation(numbering: n => "(19.3)")
 $ U = log lambda \, #h(2em) gamma = lambda h_b . $ <q4:cla:reduced-variables>]

The conformal length factor from $h_b$ to $gamma$ is $e^(U \/ 2)$. The four-dimensional Ricci transformation and (19.1) give

#[#set math.equation(numbering: n => "(19.4)")
 $ "Ric"_gamma = 3 / 2 thin thin upright(d) U ⊗ thin upright(d) U \, #h(2em) Delta_gamma U = 0 . $ <q4:cla:reduced-equations>]

Indeed, $"Ric"_(h_b) = "Hess"_(h_b) U + thin upright(d) U ⊗ thin upright(d) U$ and $Delta_(h_b) U = - \| thin upright(d) U \|_(h_b)^2$, which yield both identities directly.

#thm([Lemma 19.1.])[
  (Static end expansion).  #emph[There are coordinates harmonic for $gamma$ on a sufficiently distant part of the end, a number $epsilon.alt in \( 0 \, 1 \)$, a constant $M_1 > 0$, and homogeneous harmonic polynomials $H_1 \, H_2$ of degrees one and two such that, for every fixed nonnegative integer $k$, 
#[#set math.equation(numbering: n => "(19.5)")
 $ gamma - delta & = O_k \( r^(- 2 - epsilon.alt) \) \,\
U & = - M_1 / r^2 + frac(H_1 \( x \), r^4) + frac(H_2 \( x \), r^6) + O_k \( r^(- 4 - epsilon.alt) \) . $ <q4:cla:gamma-decay>]

 In addition $gamma - delta = O_k \( r^(- 3) \)$.]
] <q4:cla:asymptotics>

#proof[
  We give the coordinate and expansion arguments, since the initial falloff alone would not justify the compactification below.
  Extend $gamma$ from a sufficiently distant region to a smooth metric on $bb(R)^4$, using a cutoff interpolation with $delta$. Write its Laplacian as
  $ Delta_gamma = Delta_delta + D^(i j) partial_i partial_j + D^i partial_i . $
  By making the interpolation sufficiently far out, the scaled $C^(0 \, alpha)$ norms of $D^(i j)$ and $\( 1 + r \) D^i$ are as small as desired, for any fixed $alpha in \( 0 \, 1 \)$. Here a scaled norm means the ordinary norm after rescaling each annulus to fixed size. The initial differentiated falloff gives the needed Hölder estimates: second derivatives bound the scaled Hölder seminorm of first derivatives. Moreover $D^i = O \( r^(- 1 - q_0) \)$ in these scaled norms.
  Put $a = 1 - q_0 in \( - 1 \, 0 \)$. On all of $bb(R)^4$, with weight $1 + r$, the Euclidean Newton operator maps scaled $C^(0 \, alpha)$ functions of order $a - 2$ to scaled $C^(2 \, alpha)$ functions of order $a$. For completeness, the zeroth-order estimate follows from the kernel $C \| x - y \|^(- 2)$ by splitting the integral into $\| y \| < r \/ 2$, a comparable annulus, and $\| y \| > 2 r$; convergence uses $- 2 < a < 0$. Interior elliptic estimates after rescaling give the two derivative and Hölder bounds. The small coefficient norms therefore make the map obtained from
  $ Delta_delta v^i = - D^i - D^(a b) partial_a partial_b v^i - D^a partial_a v^i $
  a contraction in that weighted space. Its solution satisfies $v = O \( r^(1 - q_0) \)$ with the stated scaled $C^(2 \, alpha)$ bounds, and $x^i + v^i$ are $gamma$-harmonic coordinates on the far end. They are indeed coordinates there: their first derivative tends to the identity, and a cutoff of the correction can be chosen to have globally small first derivative. Local elliptic regularity makes the coordinates smooth wherever the original metric is smooth.
  In the harmonic chart, $gamma - delta$ and $U$ initially have order $- q_0$ in scaled $C^(1 \, alpha)$: one derivative of the transformed metric uses two derivatives of the coordinate correction. We do not assume a weighted second-derivative estimate at this stage. The chart and the fields are nevertheless smooth locally, so Equations (19.4) take the coupled elliptic form
  #[#set math.equation(numbering: n => "(19.6)")
   $ - 1 / 2 gamma^(a b) partial_a partial_b gamma_(i j) + Q_(i j) \( gamma \, partial gamma \) = 3 / 2 U_i U_j \, #h(2em) gamma^(a b) partial_a partial_b U = 0 \, $ <q4:cla:harmonic-system>]
  where $Q$ is quadratic in first derivatives, with smooth coefficients depending on $gamma$. On an annulus rescaled to unit size, the initial $C^(1 \, alpha)$ norms of $gamma - delta$ and $U$ are $O \( R^(- q_0) \)$. Both quadratic right sides have $C^(0 \, alpha)$ norm $O \( R^(- 2 q_0) \)$, and the principal coefficients are uniformly elliptic with bounded $C^(1 \, alpha)$ norm. Interior Schauder estimates on a smaller annulus therefore restore $C^(2 \, alpha)$ bounds of order $R^(- q_0)$ for both unknowns. Differentiating this coupled system now inductively gives $gamma - delta \, U = O_k \( r^(- q_0) \)$ for every fixed $k$. Thus no higher derivative falloff is being assumed in the original coordinates. It follows in particular that
  #[#set math.equation(numbering: n => "(19.7)")
   $ Delta_delta \( gamma - delta \) \, med Delta_delta U = O_k \( r^(- 2 - 2 q_0) \) . $ <q4:cla:first-euclidean-source>]
  We use the following elementary multipole fact in dimension four. If a decaying smooth function $w$ on an end satisfies
  $ Delta_delta w = O_k \( r^(- 4 - j - eta) \) \, #h(2em) j in { 0 \, 1 \, 2 \, dots.h } \, quad 0 < eta < 1 \, $
  then
  #[#set math.equation(numbering: n => "(19.8)")
   $ w = sum_(d = 0)^j frac(P_d \( x \), r^(2 + 2 d)) + O_k \( r^(- 2 - j - eta) \) \, $ <q4:cla:multipole>]
  with $P_d$ homogeneous harmonic of degree $d$. To prove this, cut $w$ off to the end and represent the result by the whole-space Newton potential of its Laplacian. The difference is an entire harmonic function tending to zero, hence vanishes. The source has convergent moments through degree $j$. Taylor expansion of the kernel in the region $\| y \| < r \/ 2$ has remainder bounded by $C r^(- 3 - j) \| y \|^(j + 1)$; integration, and estimation of the complementary region after subtraction of the same moments, gives the error in (19.8). The local singularity of the Newton kernel is integrable. Rescaled elliptic estimates supply the differentiated error bounds. This also proves the statement simultaneously for each fixed finite number of derivatives.
  Choose $epsilon.alt in \( 0 \, 1 \)$ with $4 + epsilon.alt < 2 + 2 q_0$. Applying (19.8) first with $j = 0$ gives monopole expansions for $gamma - delta$ and $U$. Write the metric monopole as $D_(i j) \/ r^2$. The harmonic-coordinate condition is
  $ partial_j #scale(x: 120%, y: 120%)[\(] sqrt(det gamma) thin gamma^(j i) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Its leading homogeneous term implies
  $ #scale(x: 120%, y: 120%)[\(] D - 1 / 2 \( "tr" D \) "Id" #scale(x: 120%, y: 120%)[\)] x = 0 quad upright("for every ") x . $
  Taking the trace in dimension four gives $D = 0$. This proves (19.5). Since $U = O_k \( r^(- 2) \)$, its equation now improves to $Delta_delta U = O_k \( r^(- 6 - epsilon.alt) \)$. The case $j = 2$ of (19.8) gives (19.5), with the sign of its constant temporarily undetermined. In particular, the strict exponent in this source estimate excludes a logarithmic term at quadrupole order. The first use of (19.8) likewise accounts for the entire order $r^(- 2)$ tensor term, rather than only its spherical average. The metric equation in (19.6) has Euclidean source $O_k \( r^(- 6) \)$ at this stage. The case $j = 1$ of (19.8), with any smaller positive exponent if necessary, gives $gamma - delta = O_k \( r^(- 3) \)$. No expansion of the metric beyond this order is asserted or needed.
  Finally $- U$ is a positive $gamma$-harmonic function. On a sufficiently distant region the function $r^(- 2) + r^(- 2 - epsilon.alt)$ is positive and subharmonic for $gamma$; its favorable Euclidean Laplacian dominates the metric error. A small positive multiple lies below $- U$ on a fixed large sphere, and both tend to zero at infinity. The maximum principle therefore keeps it below $- U$ throughout the region. Taking the limit of $r^2 \( - U \)$ proves $M_1 > 0$. ◻
]

#prodef([Remark 19.2.])[
  The coefficient in Lemma 103 has the expected four-dimensional mass normalization:
  $ h_b = e^(- U) gamma = \( 1 + M_1 \/ r^2 \) delta + O_k \( r^(- 3) \) \, #h(2em) lambda = 1 - M_1 \/ r^2 + O_k \( r^(- 3) \) . $
  Direct substitution in the energy flux with factor $1 \/ \( 6 omega_3 \)$ gives base energy $M_1$. We have not identified that chart with the original ADM frame. The equality $M_1 = m$ will instead follow from the boundary constant $kappa$.
] <q4:cla:base-mass>

The static equations have improved the initial weak decay enough for two different operations: the plus conformal metric will have zero mass, and the minus metric will extend through its point at infinity with two continuous derivatives. The dipole and quadrupole terms are retained because a leading mass expansion alone would not justify the latter.

=== 19.2 The complete conformal double <the-complete-conformal-double>

We use the conformal-doubling strategy of Bunting and Masood-ul-Alam #cite(label("BuntingMasoodUlAlam1987")) and its higher-dimensional form due to Gibbons, Ida, and Shiromizu #cite(label("GibbonsIdaShiromizu2002")) Section 2. The static asymptotics retain a zero-mass end on one copy and compactify that end on the other. We keep all possible complete ends arising from interior zeros of $N$ until the separate rigidity argument excludes them; their absence is not an input to the double.

Define on $cal(U)$

#[#set math.equation(numbering: n => "(19.9)")
 $ k_plus.minus = (frac(1 plus.minus lambda, 2))^2 h_b . $ <q4:cla:conformal-metrics>]

The four-dimensional scalar conformal formula is

#[#set math.equation(numbering: n => "(19.10)")
 $ "Scal"_(f^2 h) = f^(- 3) \( - 6 Delta_h f + "Scal"_h f \) . $ <q4:cla:scalar-transform>]

Thus both $k_(+)$ and $k_(-)$ are scalar flat. In the variables of (19.3), the useful exact identities are

#[#set math.equation(numbering: n => "(19.11)")
 $ k_(+) = cosh^2 \( U \/ 2 \) gamma \, #h(2em) k_(-) = sinh^2 \( U \/ 2 \) gamma . $ <q4:cla:hyperbolic-factors>]

#thm([Lemma 19.3.])[
  (A zero-mass complete space).  #emph[Glue a plus and a minus copy along their common attached boundary $S$, and add one point at the minus asymptotic end. The resulting space $W$ is a connected orientable smooth boundaryless four-manifold with a complete $C^2$ scalar-flat metric $k_0$. This metric is smooth except possibly at the compact gluing hypersurface and the added point, and has a distinguished end satisfying 
#[#set math.equation(numbering: n => "(19.12)")
 $ k_0 - delta = O_k \( r^(- 3) \) quad upright("for every fixed ") k . $ <q4:cla:zero-end>]

 No assertion about the other ends of $W$ is needed here.]
] <q4:cla:double>

#proof[
  The smooth manifold structure is fixed before the metric is smoothed. At the seam use product charts from the regular base collar, with a signed normal coordinate on the double. In the positive boundary-lapse case this coordinate is signed $lambda$; in the zero boundary-lapse case one can use signed base normal distance. Tangential chart changes come from $S$, so these charts are smoothly compatible across the seam. Their overlaps with the original open base are smooth away from the seam. The added-point chart below is also smoothly compatible on every punctured overlap. Smoothness of this atlas does not assert smoothness of the reflected metric.
  By (19.11) and Lemma 103, the plus metric satisfies $k_(+) - delta = O_k \( r^(- 3) \)$; in particular its energy is zero.
  For the minus end use inversion $x = y \/ \| y \|^2$ and put $s = \| y \|$. Equation (19.5) gives
  #[#set math.equation(numbering: n => "(19.13)")
   $ frac(U \( x \( y \) \), s^2) = - M_1 + H_1 \( y \) + H_2 \( y \) + O_k \( s^(2 + epsilon.alt) \) . $ <q4:cla:inverted-lapse>]
  Differentiating the transformed remainder costs the corresponding powers of $s^(- 1)$. The Jacobian of inversion is $s^(- 2) A \( y \)$, where $A \( y \) = "Id" - 2 y y^t \/ \| y \|^2$ is orthogonal. Consequently the compactifying expression for $k_(-)$ is
  #[#set math.equation(numbering: n => "(19.14)")
   $ (frac(sinh \( U \/ 2 \), s^2))^2 ["Id" + A \( y \) #scale(x: 120%, y: 120%)[\(] gamma \( x \( y \) \) - "Id" #scale(x: 120%, y: 120%)[\)] A \( y \)] . $ <q4:cla:inverted-metric>]
  The first factor is the product
  $ 1 / 4 (U / s^2)^2 (frac(sinh \( U \/ 2 \), U \/ 2))^2 . $
  It has a $C^2$ extension with positive value $M_1^2 \/ 4$ at the origin. For the second factor, (19.5) gives $gamma \( x \( y \) \) - "Id" = O_k \( s^(2 + epsilon.alt) \)$. Each derivative of the angular matrix $A$ costs at most one power of $s^(- 1)$, so its conjugated error also has continuous derivatives through order two vanishing at the origin. This proves a nondegenerate $C^2$ extension of (19.14) across the added point. Scalar flatness extends there by continuity.
  Proposition 102 supplies the even $C^2$ reflection of $h_b$ and the odd $C^2$ reflection of $lambda$. The two conformal factors in (19.9) are one expression $\( \( 1 + lambda \) \/ 2 \)^2$ in that signed lapse. They therefore glue to a $C^2$ scalar-flat metric. Orient the second copy oppositely before gluing. The resulting manifold is orientable, and the punctured-ball chart above extends its orientation over the added point.
  It remains to check completeness, including possible escapes toward interior zeros of $N$. The plus length factor is at least $1 \/ 2$. On the minus copy its length factor is bounded below away from the chosen end: if a sequence there had $lambda arrow.r 1$, compactness in the original exterior would give either a positive-lapse limiting point with value one, contrary to the strict maximum principle, or a limiting boundary of the positive component, where $lambda arrow.r 0$. The latter possibility includes all interior zero loci and the attachment to $S$. Thus the complete base ends remain complete for both conformal metrics. The seam and the added point are regular metric neighborhoods. These observations exhaust the possible finite-distance escapes by Proposition 102 and the completeness of the original exterior. ◻
]

=== 19.3 Zero-mass rigidity without assumptions on the other ends <zero-mass-rigidity-without-assumptions-on-the-other-ends>

We use only the nonnegativity part of a smooth positive-mass theorem. The precise statement needed is Theorem 1.2 of Lesourd–Unger–Yau, in arXiv version 1 #cite(label("LesourdUngerYau2021")): a complete smooth orientable manifold of dimension $3 lt.eq n lt.eq 7$, with nonnegative scalar curvature and a distinguished asymptotically Schwarzschild end, has nonnegative mass at that end; its other ends are unrestricted. Definition 1.9 in that reference requires the remainder from the Schwarzschild metric to have weighted $C^(2 \, alpha)$ order $n - 1$. There is no spin hypothesis. The following argument reduces our $C^2$ zero-mass situation to exactly that smooth nonnegativity statement.

#thm([Lemma 19.4.])[
  (Zero-mass rigidity for the constructed space).  #emph[Let $\( W \, k_0 \)$ have the properties in Lemma 105. Then $\( W \, k_0 \)$ is isometric to Euclidean $bb(R)^4$. The isometry is smooth on every region where $k_0$ is smooth, including each smooth one-sided structure at the seam.]
] <q4:cla:zero-mass>

#proof[
  Suppose first that $"Ric"_(k_0)$ is nonzero somewhere. By continuity it is nonzero at a point in the smooth part of the metric. Choose a smooth compactly supported symmetric tensor $p$ in that part for which
  #[#set math.equation(numbering: n => "(19.15)")
   $ I := integral_W "Scal"'_(k_0) \( p \) thin d V_(k_0) = - integral_W chevron.l "Ric"_(k_0) \, p chevron.r thin d V_(k_0) > 0 . $ <q4:cla:positive-scalar-variation>]
  For example, a negative cutoff multiple of $"Ric"_(k_0)$ works. In this proof only, $s > 0$ denotes a small metric-variation parameter. Smooth the compact nonsmooth loci to obtain smooth metrics $ell_s$ equal to $k_0$ outside one fixed compact set, with
  $ ell_s = k_0 + s p + o \( s \) quad upright("in ") C^2 $
  on that compact set. More explicitly, choose fixed nested relatively compact neighborhoods of the attachment loci, and a smooth cutoff $chi$ equal to one on the smaller neighborhood and supported in the larger one. Finite-chart mollification and a partition of unity give a smooth tensor $t_s$ approximating $k_0 + s p$ in $C^2$ on the larger neighborhood with error at most $s^2$. Set $ell_s = chi t_s + \( 1 - chi \) \( k_0 + s p \)$ there and retain $k_0 + s p$ elsewhere. Where $chi$ is not one, the old metric is smooth, so this defines a globally smooth metric. The perturbation and all smoothing are confined to a fixed compact set; every other end is unchanged. For small $s$ the metrics are uniformly comparable to $k_0$ and therefore complete. Their scalar curvatures $R_s = "Scal"_(ell_s)$ have support in a fixed compact set $K$, satisfy $parallel R_s parallel_oo = O \( s \)$, and obey
  #[#set math.equation(numbering: n => "(19.16)")
   $ integral_W R_s thin d V_(ell_s) = s I + o \( s \) > 0 . $ <q4:cla:scalar-integral>]
  We construct a positive smooth conformal factor satisfying
  #[#set math.equation(numbering: n => "(19.17)")
   $ - 6 Delta_(ell_s) f_s + R_s f_s & = 0 \, & f_s & = 1 + O \( s \) quad upright("uniformly on ") W \,\
f_s - 1 & = O_k \( r^(- 2) \) &  & upright("on the distinguished end") \,\
integral_(S_R) partial_(nu_(ell_s)) f_s thin d A_(ell_s) & = 1 / 6 integral_W R_s f_s thin d V_(ell_s) &  & upright("for every sufficiently large ") R . $ <q4:cla:conformal-equation>]
  In particular, the flux in (19.17) is not being obtained by assuming zero flux at unspecified ends.
  Take connected smooth compact exhaustions $D_j$ whose boundary in the distinguished end is a large coordinate sphere $S_(R_j)$. The remaining boundary components lie outside each prescribed compact subset for sufficiently large $j$. Such an exhaustion is obtained by exhausting the complement of a fixed end neighborhood, joining to full coordinate annuli, and smoothing the compact joins. Impose $f = 1$ on $S_(R_j)$ and homogeneous Neumann conditions on every other boundary component. These boundary components are disjoint, so the mixed problem has no interface corners.
  We first record a uniform estimate for the compactly supported potential. If $v$ has zero Dirichlet value on $S_(R_j)$, then for every fixed compact set $K'$ in a fixed connected core neighborhood,
  #[#set math.equation(numbering: n => "(19.18)")
   $ parallel v parallel_(L^2 \( K' \, ell_s \)) lt.eq C_(K') parallel nabla v parallel_(L^2 \( D_j \, ell_s \)) \, $ <q4:cla:anchored-estimate>]
  with a constant independent of sufficiently large $j$ and small $s$. To see this first on a fixed end annulus, integrate along coordinate rays to the Dirichlet sphere. In Euclidean polar coordinates,
  $ \| v \( t \, theta \) \|^2 lt.eq (integral_t^(R_j) r^3 \| partial_r v \( r \, theta \) \|^2 thin d r) (integral_t^(R_j) r^(- 3) thin d r) \, #h(2em) integral_t^(R_j) r^(- 3) thin d r lt.eq frac(1, 2 t^2) . $
  Integration over the unit sphere and over the fixed annulus controls its $L^2$ norm by the full gradient energy. On a fixed connected neighborhood joining that annulus to $K'$, the Poincare inequality with the annulus as an anchor propagates the estimate. Uniform metric comparison on that neighborhood and the tail makes the constants uniform in $s$.
  For $v = f - 1$ the variational problem is
  #[#set math.equation(numbering: n => "(19.19)")
   $ integral_(D_j) (chevron.l nabla v \, nabla w chevron.r + R_s / 6 v w) d V_(ell_s) = - 1 / 6 integral_(D_j) R_s w thin d V_(ell_s) \, $ <q4:cla:mixed-weak>]
  for tests $w$ vanishing on the Dirichlet sphere. By (19.18) with a fixed neighborhood of $K$, the left quadratic form is bounded below by $\( 1 - C s \) parallel nabla v parallel_2^2$, and the right side is bounded in absolute value by $C s parallel nabla w parallel_2$. On each finite domain the gradient norm is a Hilbert norm on the Dirichlet test space. Lax–Milgram therefore solves (19.19) for small $s$, with
  #[#set math.equation(numbering: n => "(19.20)")
   $ parallel nabla v parallel_(L^2 \( D_j \)) = O \( s \) \, #h(2em) parallel v parallel_(L^2 \( K' \)) = O \( s \) $ <q4:cla:mixed-energy>]
  for every fixed compact $K'$ as above. Smooth elliptic regularity holds for the finite-domain solutions.
  These estimates also give a uniform supremum bound near $K$. First, interior $W^(2 \, 2)$ estimates for $Delta_(ell_s) v = \( R_s \/ 6 \) \( 1 + v \)$ give $O \( s \)$ on a slightly smaller fixed neighborhood. In dimension four this implies every finite local $L^p$ bound, though not yet an $L^oo$ bound. Applying the equation once more gives $W^(2 \, p) = O \( s \)$ for $p > 2$, and hence $parallel v parallel_oo = O \( s \)$ there. The constants are uniform because the metrics have uniform $C^2$ bounds and uniform ellipticity on those neighborhoods, and $R_s = O \( s \)$ in $L^oo$. Derivative bounds on the smoothing error beyond those needed here are unnecessary.
  Outside a fixed neighborhood of $K$, the function $v$ is harmonic. Its values at the inner boundary are bounded by $C s$, its outer Dirichlet values are zero, and its other outer normal derivatives are zero. Here is a global weak test that avoids assumptions on the remaining components. Take $\( v - C s \)_(+)$, which vanishes near $K$, and extend it by zero through that neighborhood. It is an admissible test in (19.19); both terms containing $R_s$ vanish, leaving the integral of its squared gradient equal to zero. Connectedness of $D_j$ and its zero Dirichlet trace imply $\( v - C s \)_(+) = 0$ everywhere. The negative excess gives the other bound. Thus $\| v \| lt.eq C s$ throughout $D_j$, with no geometry of the other ends used. On the distinguished end, a multiple of $r^(- 2) \( 1 - r^(- eta) \)$, with $0 < eta < 1$, is a positive strictly superharmonic barrier sufficiently far out for the metric (19.12). Comparison on the truncated annuli gives the uniform bound $\| v \| lt.eq C_s r^(- 2)$ there.
  For each fixed small $s$, pass to a subsequence converging smoothly on compact subsets as $j arrow.r oo$. The limit yields (19.17) and the zeroth-order decay in (19.17). Rescaled end estimates and differentiation give all its fixed differentiated orders. Positivity follows from the uniform bound $f_s = 1 + O \( s \)$. For a fixed sphere $S_R$ outside the support of $R_s$, integrate the finite-domain equation on
  $ B_(j \, R) = D_j \\ { x upright(" in the distinguished end") : r > R } . $
  Its boundary consists of $S_R$ and only artificial boundaries with homogeneous Neumann data; the Dirichlet sphere $S_(R_j)$ has been removed. For large $j$ it contains the whole support of $R_s$, so
  $ integral_(S_R) partial_(nu_(ell_s)) f_(s \, j) thin d A_(ell_s) = 1 / 6 integral_(D_j) R_s f_(s \, j) thin d V_(ell_s) . $
  The curvature has fixed compact support. Local convergence thus passes the derivative on the fixed sphere and the integral on that fixed support to the limit, proving (19.17) exactly. No integration over a limiting noncompact inner region is involved. The limiting factor may have harmonic behavior at the other ends; neither its limiting values nor individual end fluxes are required.
  The metric $f_s^2 ell_s$ is smooth, complete and scalar flat by (19.10) and the uniform positive bounds for $f_s$. Its distinguished end is asymptotically Schwarzschild in the precise sense required by the stated positive-mass theorem. Indeed, on that end $ell_s = k_0 = delta + O_k \( r^(- 3) \)$ and $Delta_(ell_s) f_s = 0$. Combining this with (19.17) gives $Delta_delta \( f_s - 1 \) = O_k \( r^(- 7) \)$. The multipole estimate (19.8) therefore implies
  #[#set math.equation(numbering: n => "(19.21)")
   $ f_s = 1 + a_s / r^2 + O_k \( r^(- 3) \) \, #h(2em) f_s^2 ell_s = \( 1 + a_s \/ r^2 \)^2 delta + O_k \( r^(- 3) \) . $ <q4:cla:factor-monopole>]
  The differentiated bounds supply the weighted $C^(2 \, alpha)$ remainder of order three, required in dimension four.
  On the other hand, (19.16) and the uniform bound in (19.17) give
  $ integral_W R_s f_s thin d V_(ell_s) = s I + o \( s \) > 0 . $
  Thus (19.17) has strictly positive outward flux. Physical and Euclidean fluxes have the same limit by the falloff. From (19.21), that limit is $- 2 omega_3 a_s$, so $a_s < 0$. Equivalently, direct computation with the prescribed energy normalization gives
  #[#set math.equation(numbering: n => "(19.22)")
   $ E \( f_s^2 ell_s \) = - 1 / omega_3 lim_(R arrow.r oo) integral_(S_R) partial_r f_s thin d A_delta = 2 a_s < 0 . $ <q4:cla:negative-mass>]
  The background end contributes zero energy, and products of its error with the conformal error contribute zero limiting flux. This contradicts the smooth arbitrary-ends positive-mass theorem: the dimension is four, the manifold is orientable and boundaryless, the metric is complete and smooth, its scalar curvature vanishes, and (19.21) has exactly the required distinguished end. Hence $"Ric"_(k_0) = 0$.
  For clarity concerning regularity, a $C^2$ Ricci-flat metric becomes smooth in harmonic coordinates by the elliptic Ricci equation; this is the harmonic-coordinate regularity statement of DeTurck–Kazdan #cite(label("DeTurckKazdan1981")) Theorem 5.2 for $C^2$ Einstein metrics in dimension at least three. We may consequently apply Bishop–Gromov comparison and its rigidity statement #cite(label("Petersen2016")). The asymptotic volume ratio is at least the Euclidean value using the distinguished end alone: paths from a fixed base point to a fixed end sphere, followed by coordinate rays, have length $r + o \( r \)$ uniformly in angle, and the end volume form tends to its Euclidean value. Thus large metric balls contain asymptotically Euclidean coordinate annuli of the corresponding radius. Ricci nonnegativity gives the opposite inequality for the volume ratio. Its value is therefore one, and the equality case of Bishop–Gromov implies that $W$ is Euclidean space globally.
  The isometry is smooth wherever the original metric is smooth. Its smoothness in each one-sided seam structure can also be seen directly, without asserting that the reflected metric was smooth. The $C^2$ metric has $C^1$ connection coefficients in the original seam charts. A flat parallel coframe extends across the seam by parallel transport, with at least $C^1$ dependence on its base point. In coordinates each member $alpha$ satisfies
  $ partial_j alpha_i = Gamma_(j i)^k alpha_k . $
  On each closed one-sided chart the connection coefficients are smooth up to the boundary. This identity inductively makes the coframe smooth up to that boundary. Its closed forms integrate to Euclidean coordinates agreeing with the isometry on the open side after a fixed Euclidean motion, hence also at the seam by continuity. This proves the asserted smoothness separately in both one-sided structures. ◻
]

The complete double is now Euclidean. This is stronger than a local static classification: it also excludes any complete base end hidden at an interior zero of the original Killing norm. We use that conclusion first, and only then identify the boundary sphere and the explicit lapse.

=== 19.4 The original positive component and its spherical boundary <the-original-positive-component-and-its-spherical-boundary>

#thm([Proposition 19.5.])[
  (Global static classification).  #emph[The positive component is the whole original open exterior: $cal(U) = "int" Omega$ and $N > 0$ there. Its attached boundary is $S$. There is a global isometry of the static base onto the Schwarzschild–Tangherlini spatial exterior of mass $m$, under which 
#[#set math.equation(numbering: n => "(19.23)")
 $ h_b = (1 + frac(m, 2 rho^2))^2 \( thin upright(d) rho^2 + rho^2 g_(bb(S)^3) \) \, #h(2em) lambda = frac(1 - m \/ \( 2 rho^2 \), 1 + m \/ \( 2 rho^2 \)) \, #h(2em) rho gt.eq sqrt(m \/ 2) . $ <q4:cla:ST-base>]

 The isometry is smooth on the open base and in its one-sided regular boundary structure. The attachment is homeomorphic to the original attachment of $S$ in $Omega$ and restricts smoothly on $S$. In particular the open base is simply connected and $S$ is a round three-sphere in its induced metric. The base reflection is smooth in signed $lambda$ in the positive boundary-lapse case; its angular coordinates can be taken constant along base normal geodesics.]
] <q4:cla:static-classification>

#proof[
  By Lemmas 105 and 106, the constructed space $W$ is Euclidean. Suppose a sequence in $cal(U)$ approaches an interior zero of $N$ in the original compact part of $Omega$. It escapes every compact subset of $W$: the zero locus is not a point of the plus copy, it cannot converge to $S$, and the only new point lies at the minus end in a neighborhood disjoint from that sequence. Yet the sequence remains outside a fixed distant tail of the distinguished end of $W$.
  This is impossible in Euclidean space. A coordinate cross-sphere in the distinguished end is a compact embedded sphere. Its tail has only that sphere as its frontier and is the unbounded component of its complement. Jordan–Brouwer separation makes the other side bounded; its closure is compact. Thus the complement of the tail is compact. This use of separation does not require a smooth Schoenflies theorem in dimension four.
  It follows that $cal(U)$ has no boundary in $"int" Omega$. The latter is connected, so $cal(U) = "int" Omega$. We now identify the plus and minus copies in the Euclidean double explicitly.
  At $S$, under the change $k_(+) = f^2 h_b$ with $f = \( 1 + lambda \) \/ 2$, the shape operator transforms by
  $ cal(S)_(k_(+)) = f^(- 1) #scale(x: 120%, y: 120%)[\(] cal(S)_(h_b) + nu_(h_b) \( log f \) "Id" #scale(x: 120%, y: 120%)[\)] . $
  Using (19.2), its value is $2 kappa "Id"$ for the normal toward the plus side. In Euclidean coordinates write $z$ for position and $nu$ for that normal. With $d_(*) = \( 2 kappa \)^(- 1)$, the tangential derivative of $z - d_(*) nu$ vanishes. Connectedness of $S$ makes this vector a constant center. The image of $S$ lies on the sphere of radius $d_(*)$ about that center, and is both open there by local immersion and closed by compactness. It is the entire round sphere. Embeddedness follows from the global ambient isometry. The plus side, which contains the distinguished infinity, is its Euclidean exterior.
  Set $psi = 2 \/ \( 1 + lambda \)$. Then $h_b = psi^2 k_(+)$. Scalar flatness and (19.10) show that $psi$ is harmonic on that Euclidean exterior. It is equal to two on the sphere and tends to one at infinity. Uniqueness by the maximum principle therefore gives, in centered Euclidean radius $rho$,
  #[#set math.equation(numbering: n => "(19.24)")
   $ psi = 1 + d_(*)^2 / rho^2 \, #h(2em) lambda = frac(1 - d_(*)^2 \/ rho^2, 1 + d_(*)^2 \/ rho^2) . $ <q4:cla:psi-and-lapse>]
  Since $kappa = 1 \/ sqrt(2 m)$, we have $d_(*)^2 = m \/ 2$, which proves (19.23). For an invariant check on the coefficient from Lemma 103, the flux of the $gamma$-harmonic function $U$ is independent of the end cross-section. Its limit is $2 omega_3 M_1$ in the harmonic coordinates and $2 omega_3 m$ in the explicit coordinates of (19.24). The divergence theorem between homologous cross-sections therefore gives $M_1 = m$, without identifying the two asymptotic charts. The area radius
  $ r = rho (1 + frac(m, 2 rho^2)) $
  satisfies
  #[#set math.equation(numbering: n => "(19.25)")
   $ N = 1 - frac(2 m, r^2) \, #h(2em) h_b = N^(- 1) thin upright(d) r^2 + r^2 g_(bb(S)^3) quad upright("on ") "int" Omega . $ <q4:cla:area-radius-base>]
  The apparent degeneracy of the area-radius expression at the boundary is removed by the isotropic radius or the regular base collar. Its boundary radius is $r_0 = sqrt(2 m)$.
  The smooth one-sided boundary assertion follows from Lemma 106 and the regular base collar of Proposition 102. In the positive boundary-lapse case this collar is expressed in $lambda = sqrt(N)$, with a smooth reflection; replacing an original defining coordinate $N$ by $sqrt(N)$ changes the smooth boundary coordinate but not the underlying topology or the smooth structure on $S$ itself. In the zero boundary-lapse case the base collar is already smooth in the original one-sided structure. The spherical angular coordinates in (19.23) are constant along the base normal geodesics from $S$. In a reflected collar their normal projection to $S$ is smooth and invariant under reflection. These facts give precisely the regular boundary identification needed to recover the hypersurface in horizon coordinates. Finally the Euclidean exterior of a ball in dimension four is simply connected, proving the topological assertions. ◻
]

== 20 Recovery of the original hypersurface and the converse <q4:rec:section>

The static classification identifies a metric on the orbit space. We now recover the original spacelike hypersurface, including its second fundamental form and its smooth structure at the horizon. We then compute the invariant ADM mass of every admissible Tangherlini slice, allowing a nonzero asymptotic boost.

=== 20.1 The original graph in the open exterior <the-original-graph-in-the-open-exterior>

Throughout the forward implication, assume equality and all the horizon hypotheses of Definition 81. Retain

$ m = sqrt(E^2 - \| P \|^2) \, #h(2em) r_0 = sqrt(2 m) \, #h(2em) kappa = r_0^(- 1) . $

Proposition 107 identifies the whole open base $"int" Omega$ with the Tangherlini spatial exterior of mass $m$:

#[#set math.equation(numbering: n => "(20.1)")
 $ h_b = N^(- 1) thin upright(d) r^2 + r^2 g_(bb(S)^3) \, #h(2em) N = 1 - r_0^2 / r^2 \, #h(2em) r > r_0 . $ <q4:rec:classified-base>]

In particular $N > 0$ throughout the original interior, the open base is simply connected, and its regular boundary attachment is homeomorphic to the original attachment of $S$. The adjoint field is the original field of Theorem 94; all occurrences of $X^flat$ below use the original metric $g$.

#thm([Lemma 20.1.])[
  (Recovery on the open exterior).  #emph[There is a smooth function $T_0$ on $"int" Omega$ such that the map 
$ x mapsto #scale(x: 120%, y: 120%)[\(] T_0 \( x \) \, r \( x \) \, theta.alt \( x \) #scale(x: 120%, y: 120%)[\)] $

 into the static Tangherlini exterior induces the original $g$ and $K$. Here $\( r \, theta.alt \)$ are the global base coordinates in Equation (20.1), with $theta.alt in bb(S)^3$.]
] <q4:rec:interior-graph>

#proof[
  The one-form $A_b = N^(- 1) X^flat$ is closed by the staticity conclusion. Simple connectedness gives a global primitive with
  #[#set math.equation(numbering: n => "(20.2)")
   $ thin upright(d) T_0 = - A_b . $ <q4:rec:primitive>]
  On $bb(R) times "int" Omega$ put $T = t + T_0 \( x \)$. The definitions of $h_b$, $A_b$, and $N = u^2 - \| X \|_g^2$ give the exact identity
  #[#set math.equation(numbering: n => "(20.3)")
   $ - N thin upright(d) T^2 + h_b & = - N \( thin upright(d) t - A_b \)^2 + h_b\
 & = - u^2 thin upright(d) t^2 + g_(i j) \( thin upright(d) x^i + X^i thin upright(d) t \) \( thin upright(d) x^j + X^j thin upright(d) t \) . $ <q4:rec:metric-identity>]
  Thus the graph $T = T_0$ is exactly the original $t = 0$ slice and induces $g$. Static time is future increasing, and its future unit normal is $n = u^(- 1) \( partial_t - X \)$. With the convention of the theorem, the lapse–shift identity is
  $ partial_t g = 2 u K + cal(L)_X g . $
  The metric on the right of Equation (20.3) is stationary, and Equation (17.2) therefore gives its second form as $- cal(L)_X g \/ \( 2 u \) = K$. This proves the claim for the original tensor, without a further deformation. These local sign conventions also agree with the Killing initial data identities in #cite(label("BeigChrusciel1997KID")) Equations (2.6) and (2.14). ◻
]

=== 20.2 Extension through the horizon in the original smooth structure <extension-through-the-horizon-in-the-original-smooth-structure>

The base has two possible regular boundary structures. When $u \|_S > 0$, $N$ is an original smooth defining function, whereas the regular base coordinate is $lambda = sqrt(N)$. When $u \|_S = 0$, the base is smooth in the original collar coordinate. The following lemma treats these cases before passing to regular spacetime coordinates.

#thm([Lemma 20.2.])[
  (Smooth horizon extension).  #emph[The graph in Lemma 108 extends smoothly, in the original smooth structure of $Omega$, to $S$ in the regular maximal Tangherlini extension. Its boundary is a smooth section of the corresponding future horizon if $u \|_S > 0$, and is the bifurcation sphere if $u \|_S = 0$.]
] <q4:rec:horizon-extension>

#proof[
  Connectedness of $S$ and Theorem 94 leave exactly the two cases just described.
  ===== 20.2.1 Positive boundary lapse. <positive-boundary-lapse.>
  Equation (17.7) states that $thin upright(d) N = 2 kappa X^flat$ on $S$ and that $N$ is an original defining function. Consequently the smooth covector $X^flat - \( 2 kappa \)^(- 1) thin upright(d) N$ vanishes on $S$. Dividing its components by $N$ in an original collar gives a smooth one-form $beta_0$ such that
  #[#set math.equation(numbering: n => "(20.4)")
   $ A_b = frac(1, 2 kappa) thin upright(d) log N + beta_0 \, #h(2em) T_0 = - frac(1, 2 kappa) log N + B_0 . $ <q4:rec:log-time>]
  Here $B_0$ is smooth up to $S$: its differential is $- beta_0$, and its values on an interior collar section determine its smooth extension by integration along collar segments. The primitive in Equation (20.2) is already single-valued, so this construction has no period ambiguity.
  We also need the angular coordinate $theta.alt$ to be smooth in the original coordinate $N$, not only in $lambda$. The specific reflection matters here. In the original-derived coordinates $\( lambda \, y \)$, with $N = lambda^2$, Equation (18.5) has even $lambda lambda$ and $A B$ coefficients and odd $lambda A$ coefficients, all original functions being evaluated at $\( lambda^2 \, y \)$. Thus the smooth isometric reflection is exactly
  $ cal(R) \( lambda \, y \) = \( - lambda \, y \) . $
  Let $p$ be normal projection to $S$ in this reflected base collar. Reflection fixes $S$ pointwise and reverses its unit normals, so $p compose cal(R) = p$. The smooth one-sided isometry in Proposition 107 sends these normal geodesics to the radial normal geodesics of the classified base. If $theta.alt_S$ denotes its smooth angular boundary identification, the original angular map on the positive collar is therefore $theta.alt = theta.alt_S compose p$. This formula extends it smoothly to the reflected collar and makes it invariant under the displayed $cal(R)$. In particular it is even in the specific $lambda$ coordinate obtained from original $N$, with its tangential parameters fixed. A smooth even function of $lambda$ is a smooth one-sided function of $lambda^2$: Taylor expansion has only even powers, and the differentiated remainder gives this assertion to every finite order. Applying this in angular charts proves that $theta.alt$ is smooth in the original $\( N \, y \)$ collar.
  ===== 20.2.2 Zero boundary lapse. <zero-boundary-lapse.>
  Let $s gt.eq 0$ be original outward collar distance. By Equation (17.8), there are smooth $d \, Y_2$ with
  #[#set math.equation(numbering: n => "(20.5)")
   $ u = s d \, #h(2em) X = s^2 Y_2 \, #h(2em) d \|_S = kappa \, #h(2em) N = s^2 #scale(x: 120%, y: 120%)[\(] d^2 - s^2 \| Y_2 \|_g^2 #scale(x: 120%, y: 120%)[\)] . $ <q4:rec:zero-collar>]
  It follows that $A_b$, and hence $T_0$, extend smoothly and finitely to $S$. The positive square root on the exterior is
  $ lambda = s sqrt(d^2 - s^2 \| Y_2 \|_g^2) \, $
  which is smooth one-sided in $s$. In this case the original and regular one-sided base structures agree. The smooth one-sided base identification therefore makes $theta.alt$ smooth in the original collar as well.
  ===== 20.2.3 Regular spacetime coordinates. <regular-spacetime-coordinates.>
  Define the tortoise coordinate and Kruskal coordinates by
  #[#set math.equation(numbering: n => "(20.6)")
   $ r_(*) & = r + r_0 / 2 log frac(r - r_0, r + r_0) \,\
sans(U) & = - exp #scale(x: 120%, y: 120%)[\(] - kappa \( T - r_(*) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sans(V) = exp #scale(x: 120%, y: 120%)[\(] kappa \( T + r_(*) \) #scale(x: 120%, y: 120%)[\)] . $ <q4:rec:kruskal>]
  Differentiation gives $thin upright(d) r_(*) \/ thin upright(d) r = N^(- 1)$. More precisely,
  #[#set math.equation(numbering: n => "(20.7)")
   $ e^(kappa r_(*)) = sqrt(N) thin D_(*) \( N \) \, #h(2em) D_(*) \( N \) = e^(r \/ r_0) frac(r, r + r_0) \, #h(2em) r = r_0 / sqrt(1 - N) . $ <q4:rec:regular-factor>]
  Thus $D_(*)$ is smooth positive near $N = 0$, with $D_(*) \( 0 \) = e \/ 2$. The two-dimensional static part becomes
  $ - N thin upright(d) T^2 + N^(- 1) thin upright(d) r^2 = - frac(1, kappa^2 D_(*) \( N \)^2) thin thin upright(d) sans(U) thin thin upright(d) sans(V) . $
  Moreover $- sans(U) sans(V) = N D_(*) \( N \)^2$ has a smooth local inverse for $N$ near zero. These are regular horizon coordinates: the coefficient of $thin upright(d) sans(U) thin thin upright(d) sans(V)$ is smooth negative nonzero and $r$ is smooth across the horizon.
  In the positive boundary-lapse case, substituting Equation (20.4) into Equation (20.6) on the graph gives
  #[#set math.equation(numbering: n => "(20.8)")
   $ sans(U) = - N D_(*) \( N \) e^(- kappa B_0) \, #h(2em) sans(V) = D_(*) \( N \) e^(kappa B_0) . $ <q4:rec:future-section>]
  Both functions are smooth in the original collar, and $S$ maps to $sans(U) = 0$, $sans(V) > 0$. Since its angular map identifies $S$ with $bb(S)^3$, this is a smooth section of the future horizon.
  In the zero boundary-lapse case, the same graph formulas are
  $ sans(U) = - lambda D_(*) \( N \) e^(- kappa T_0) \, #h(2em) sans(V) = lambda D_(*) \( N \) e^(kappa T_0) . $
  Equation (20.5) makes them smooth in $s$, and both vanish on $S$. Together with the angular identification, they map $S$ onto the bifurcation sphere. This proves the asserted smooth extension in both cases. ◻
]

#thm([Proposition 20.3.])[
  (Global recovery of the original exterior).  #emph[Equality under the horizon hypotheses gives a global smooth spacelike embedding of the original $Omega$, including $S$, in the regular maximal Tangherlini extension of mass $m$. The embedding pulls back the spacetime metric and the future second fundamental form to the original $g$ and $K$. Its image lies in the closure of the corresponding exterior, its boundary has the form stated in Lemma 109, and its end approaches the corresponding spatial infinity.]
] <q4:rec:embedding>

#proof[
  Combine the maps in Lemmas 108 and 109. Their pullback metric is $g$ on the open exterior and remains $g$ at $S$ by continuity. Since $g$ is positive definite, the extended map is a spacelike immersion there.
  It is injective on the interior by the global base identification, and on the boundary by the round-sphere identification. No interior point can have the same image as a boundary point, since their area radii are respectively $r > r_0$ and $r = r_0$. It is also proper. A compact set of the regular spacetime has bounded area radius; its preimage is a closed subset of a bounded annulus in the attached base. Such an annulus is compact, and the base attachment is homeomorphic to the original attachment. A proper injective immersion is an embedding.
  To obtain the normal at the boundary, take a smooth future timelike field in regular spacetime coordinates, project it to the normal line of the spacelike image, and normalize. Its normal projection is timelike and nonzero; the result is a smooth future unit normal. It agrees with the interior normal by uniqueness of the future choice. Hence the second-form identity from Lemma 108 extends to $S$. If desired, the smooth collar expressions extend locally across $S$ as a spacelike immersion, since immersion and spacelikeness are open conditions. No data beyond $S$ are prescribed or asserted.
  Finally the inverse-base identity gives
  #[#set math.equation(numbering: n => "(20.9)")
   $ \| thin upright(d) T_0 \|_(h_b)^2 = frac(\| X \|_g^2, u^2 N) arrow.r frac(\| b \|^2, \( b^0 \)^2) < 1 \, $ <q4:rec:spatial-infinity>]
  using Equation (17.3) and $N arrow.r 1$. Choose $a < 1$ slightly larger than the limiting slope. Increasing a fixed base radius if necessary absorbs the radial length factor $N^(- 1 \/ 2)$, so integration along base radial rays, starting on a compact sphere, gives $\| T_0 \| lt.eq a r + C$ uniformly on the end. Thus the end remains in a spacelike cone of the static exterior and approaches its spatial infinity. ◻
]

=== 20.3 Asymptotic geometry of an admissible Tangherlini slice <asymptotic-geometry-of-an-admissible-tangherlini-slice>

For the converse write $M_0 > 0$ for the geometric mass parameter of the ambient Tangherlini spacetime, to distinguish it from the invariant ADM mass that we will compute. In isotropic spatial coordinates $y$ on its chosen exterior, with future static time $T$, its metric is

#[#set math.equation(numbering: n => "(20.10)")
 $ upright(bold(g))_(M_0) = - (frac(1 - M_0 \/ \( 2 \| y \|^2 \), 1 + M_0 \/ \( 2 \| y \|^2 \)))^2 thin upright(d) T^2 + (1 + frac(M_0, 2 \| y \|^2))^2 sum_(i = 1)^4 \( thin upright(d) y^i \)^2 . $ <q4:rec:isotropic-spacetime>]

The following argument applies to the end of every slice in the converse class. It derives its asymptotic plane from the prescribed intrinsic decay.

#thm([Lemma 20.4.])[
  (Asymptotic affine plane).  #emph[Let a smooth spacelike hypersurface in the Tangherlini exterior of mass $M_0 > 0$ have an end with coordinates $x in bb(R)^4 \\ overline(B)$ and induced data satisfying 
$ g - delta = O_2 \( \| x \|^(- q) \) \, #h(2em) K = O_1 \( \| x \|^(- 1 - q) \) \, #h(2em) q > 1 . $

 Assume the hypersurface is smoothly embedded with a compact remaining part and boundary, if present, in the exterior closure. For any $1 < q_0 < min \( q \, 2 \)$ there are constants $L in "GL" \( 4 \, bb(R) \)$, $a in bb(R)^4$, $L_0 in bb(R)^4$, and $a_0 in bb(R)$ such that on the end 
#[#set math.equation(numbering: n => "(20.11)")
 $ y & = L x + L_0 + O_2 \( \| x \|^(1 - q_0) \) \,\
T & = a dot.op x + a_0 + O_2 \( \| x \|^(1 - q_0) \) \, #h(2em) L^t L - a ⊗ a = I . $ <q4:rec:affine-plane>]

 In particular the limiting tangent plane is spacelike and $x$ gives Euclidean orthonormal coordinates on it.]
] <q4:rec:asymptotic-plane>

#proof[
  We first control the spatial projection and then obtain its affine asymptotics.
  ===== 20.3.1 The end leaves every bounded area radius. <the-end-leaves-every-bounded-area-radius.>
  Gauss and Codazzi express the all-tangential and one-normal spacetime curvature components in a slice orthonormal frame in terms of $"Rm"_g$, $K^2$, and $nabla K$. All tend to zero by the stated decay. Vacuum $upright(bold(R i c))_(i j) = 0$ expresses the two-normal curvature components as sums of all-tangential ones. Thus every component tends to zero, and so does the spacetime curvature-square invariant.
  In the static orthonormal frame of Tangherlini, curvature components with one time index and three spatial indices vanish. All remaining squared components contribute nonnegatively to that invariant. The angular sectional curvature, computed from the static warped product, is
  $ frac(1 - \| nabla r \|_(h_(upright("static")))^2, r^2) = frac(2 M_0, r^4) . $
  The invariant is consequently bounded below by a positive constant times $M_0^2 \/ r^8$, including at the horizon by regularity. Hence the area radius $r$, and therefore $\| y \|$, tend to infinity as $\| x \| arrow.r oo$.
  ===== 20.3.2 A finite timelike limiting normal. <a-finite-timelike-limiting-normal.>
  For the estimates in original end coordinates, write $R = \| x \|$. Decompose the future static Killing field along the slice as $partial_T = u n + X$. On its exterior tail $u > \| X \|_g$. Local translates along this transverse field give stationary lapse–shift coordinates. The vacuum Killing initial data equations, with the present second-form convention, are
  #[#set math.equation(numbering: n => "(20.12)")
   $ nabla_(\( i) X_(j \)) = - u K_(i j) \, #h(2em) nabla^2 u = u \( "Ric"_g + tau K - 2 K^2 \) - cal(L)_X K . $ <q4:rec:vacuum-kid>]
  These follow respectively from the Killing equation and its normal derivative using the vacuum spatial Ricci equation. Their local form is dimension independent; we use them here in four spatial dimensions. The same local identities are recorded in #cite(label("BeigChrusciel1997KID")) Section 2.
  Commuting derivatives in the first equation expresses $nabla^2 X$ as curvature times $X$ and permutations of $nabla \( u K \)$. If $Y$ denotes the coordinate components of the pair $\( u \, X \)$, the prescribed decay therefore gives
  #[#set math.equation(numbering: n => "(20.13)")
   $ \| partial^2 Y \| lt.eq C \| x \|^(- 1 - q_0) \| partial Y \| + C \| x \|^(- 2 - q_0) \| Y \| . $ <q4:rec:jet-estimate>]
  Here only two derivatives of $g$ and one of $K$ are used.
  The metric $g$ is uniformly comparable to the Euclidean metric on the end, the lapse and shift are causal, and $q_0 > 1$. Applying Lemma 97 to Equation (20.13) gives finite constant limits with $O_2 \( R^(- q_0) \)$ errors. Their normalization follows separately from $u^2 - \| X \|_g^2 = - upright(bold(g))_(M_0) \( partial_T \, partial_T \) arrow.r 1$, using the already proved $\| y \| arrow.r oo$. Thus
  #[#set math.equation(numbering: n => "(20.14)")
   $ u = u_oo + O_2 \( R^(- q_0) \) \, #h(2em) X = X_oo + O_2 \( R^(- q_0) \) \, #h(2em) u_oo^2 - \| X_oo \|_delta^2 = 1 . $ <q4:rec:limiting-normal>]
  ===== 20.3.3 Proper spatial projection and affine jets. <proper-spatial-projection-and-affine-jets.>
  Set $N = u^2 - \| X \|_g^2$. Pairing $partial_T$ with tangent vectors to the slice gives the exact identities
  #[#set math.equation(numbering: n => "(20.15)")
   $ thin upright(d) T = - X^flat / N \, #h(2em) y^(*) h_(upright("static")) = h_b = g + N^(- 1) X^flat ⊗ X^flat . $ <q4:rec:projection-identities>]
  The spatial projection $y$ is a local diffeomorphism, since the static Killing field is timelike and transverse to the spacelike hypersurface. Equation (20.14) makes $h_b$ asymptotic to a positive constant matrix. Because $\| y \| arrow.r oo$, both its Jacobian and inverse Jacobian are uniformly bounded far out.
  We make the target coverage and path lifting explicit. Choose $R_(*)$ large enough that the preceding Jacobian bounds hold on the original end $E_(*) := { \| x \| > R_(*) }$. Choose $R_0$ larger than the maximum of $\| y \|$ on $partial E_(*)$, and put
  $ V_0 = { y in bb(R)^4 : \| y \| > R_0 } \, #h(2em) U_0 = E_(*) ∩ y^(- 1) \( V_0 \) . $
  The local diffeomorphism $y : U_0 arrow.r V_0$ is proper. Indeed a sequence whose images remain in a compact subset of $V_0$ cannot escape to original infinity, by $\| y \| arrow.r oo$, or approach $partial E_(*)$, by the choice of $R_0$. It therefore has a convergent subsequence in $U_0$. The image is open by local invertibility and closed by properness. It is nonempty, and $V_0$ is connected, so the image is all of $V_0$.
  A proper local diffeomorphism is a covering: inverse neighborhoods of its finite fibers give evenly covered neighborhoods, with properness excluding additional sheets arriving from outside those neighborhoods. In particular, radial paths down to a fixed sphere $\| y \| = R_1 > R_0$ lift. Their endpoints lie in the compact preimage of that sphere. The uniform inverse-Jacobian bound gives a lifted length at most $C \( \| y \| - R_1 \)$ and hence $\| x \| lt.eq C' \( 1 + \| y \| \)$. Conversely, integrating the Jacobian bound along original coordinate rays gives $\| y \| lt.eq C \( 1 + \| x \| \)$. Hence $\| y \| asymp \| x \|$.
  The connection transformation law for Equation (20.15) now yields $partial^2 y = O \( \| x \|^(- 1 - q_0) \)$: the connection of $h_b$ has that order, while the static connection is $O \( \| y \|^(- 3) \)$, and $q_0 < 2$. The first identity in Equation (20.15) similarly gives the required Hessian bound for $T$. Integration on radial rays and comparison on spheres first yield constant gradient limits and then constant translation limits. The latter comparison costs $O \( R^(1 - q_0) \)$, which tends to zero. This proves the two expansions in Equation (20.11). Finally the limit of the induced metric is $L^t L - a ⊗ a = I$. In particular $L$ is invertible and the affine plane is spacelike. ◻
]

The preceding lemma has recovered a genuine spacelike affine plane at infinity from the intrinsic weak decay, rather than assuming a preferred rest slicing. We can therefore compute the charges on that plane and show that the decaying displacement of the actual slice changes no ADM flux.

=== 20.4 The invariant ADM mass of the slice <the-invariant-adm-mass-of-the-slice>

#thm([Proposition 20.5.])[
  (Mass of every admissible Tangherlini slice).  #emph[Every hypersurface in the converse class of Theorem 82, in Tangherlini spacetime of geometric mass $M_0 > 0$, has invariant ADM mass $M_0$. More precisely, in coordinates adapted to its asymptotic boost, its charges are $E = M_0 Gamma$ and $P = M_0 Gamma v thin e_1$, where $0 lt.eq v < 1$ and $Gamma = \( 1 - v^2 \)^(- 1 \/ 2)$.]
] <q4:rec:converse-mass>

#proof[
  We compare the slice with its limiting plane and compute the flux on that plane.
  ===== 20.4.1 Comparison with the affine plane. <comparison-with-the-affine-plane.>
  Apply Lemma 111. Use the same parameter $x$ on the affine plane in Equation (20.11), and denote its induced data by $\( g^(*) \, K^(*) \)$. In affine Minkowski coordinates adapted to this plane, the residual displacement of the actual embedding is a spacetime vector $Z$, with time component $Z^0$, satisfying $Z = O_2 \( \| x \|^(1 - q_0) \)$. The ambient metric differs from Minkowski by $O_2 \( \| x \|^(- 2) \)$ near both embeddings. Consequently
  #[#set math.equation(numbering: n => "(20.16)")
   $ g_(i j) - g_(i j)^(*) & = partial_i Z_j + partial_j Z_i + O_1 \( \| x \|^(- 2 q_0) \) \,\
K_(i j) - K_(i j)^(*) & = partial_i partial_j Z^0 + O \( \| x \|^(- 1 - 2 q_0) \) . $ <q4:rec:gauge-comparison>]
  Here the indices on the spatial components of $Z$ are Euclidean. To check the error orders, the quadratic Minkowski metric term is $O_1 \( \| x \|^(- 2 q_0) \)$. Evaluation of the ambient perturbation at the displaced point, or its contraction with a displaced tangent vector, gives $O_1 \( \| x \|^(- 2 - q_0) \)$, which is smaller since $q_0 < 2$. For the second form use $- chevron.l n \, nabla_i partial_j iota chevron.r$. The normal differs from the constant future affine normal by $O \( \| x \|^(- q_0) \)$; multiplying this by $partial^2 Z$ gives $O \( \| x \|^(- 1 - 2 q_0) \)$. Ambient connection and evaluation errors have order $O \( \| x \|^(- 3 - q_0) \)$, again smaller. Euclidean trace reversal may be used in the difference with errors of the same allowed order.
  The only possible additional limiting fluxes in Equation (20.16) come from its displayed linear terms. For the metric term the energy vector is
  $ F_i = Delta Z_i - partial_i "div" Z \, #h(2em) partial_i F_i = 0 . $
  For the second-form term the momentum tensor is
  $ B_(i j) = partial_i partial_j Z^0 - delta_(i j) Delta Z^0 \, #h(2em) partial_j B_(i j) = 0 . $
  Extend $Z$ smoothly by a cutoff through the bounded Euclidean interior. The divergence theorem makes both linear fluxes exactly zero on every sufficiently large sphere. The remaining flux errors are $O \( R^(2 - 2 q_0) \)$, and hence tend to zero because $q_0 > 1$. It is therefore enough to compute the charges of the affine plane in the ambient metric (20.10).
  ===== 20.4.2 The model-plane charges. <the-model-plane-charges.>
  Translations change the ambient leading mass terms only by $O \( \| x \|^(- 3) \)$ and do not affect the charges. After rotations and an orthonormal choice of $x$, the plane is the one in Lemma 46 with $n = 4$, $p = 2$, $k = 3$, $M = M_0$, and $gamma = Gamma$. Its static and boosted times are the present $T$ and $t$, respectively; the ambient metric and future-normal convention agree.
  Put $s_(*)^2 = Gamma^2 x_1^2 + \| x_perp \|^2$. Specializing Equations (6.12) and (6.13) gives
  #[#set math.equation(numbering: n => "(20.17)")
   $ partial_j g_(i j)^(*) - partial_i g_(j j)^(*) = 6 M_0 Gamma^2 x_i s_(*)^(- 4) + o \( \| x \|^(- 3) \) \, $ <q4:rec:boost-energy-integrand>]
  and
  #[#set math.equation(numbering: n => "(20.18)")
   $ K^(*) - \( "tr"_(g^(*)) K^(*) \) g^(*) = 3 M_0 Gamma^2 v s_(*)^(- 4) mat(delim: "(", x_1, x_perp^t; x_perp, - Gamma^2 x_1 I_3) + o \( \| x \|^(- 3) \) . $ <q4:rec:boost-momentum-integrand>]
  The model metric and tensor remainders are respectively $O_d \( \| x \|^(- 4) \)$ and $O_d \( \| x \|^(- 5) \)$, with vanishing ADM fluxes. Equation (6.14) becomes
  #[#set math.equation(numbering: n => "(20.19)")
   $ integral_(bb(S)^3) #scale(x: 120%, y: 120%)[\(] Gamma^2 n_1^2 + \| n_perp \|^2 #scale(x: 120%, y: 120%)[\)]^(- 2) thin upright(d) A = omega / Gamma . $ <q4:rec:ellipsoid-integral>]
  The energy and momentum factors are $1 \/ \( 2 k omega \) = 1 \/ \( 6 omega \)$ and $1 \/ \( k omega \) = 1 \/ \( 3 omega \)$. The same lemma therefore gives
  #[#set math.equation(numbering: n => "(20.20)")
   $ E = M_0 Gamma \, #h(2em) P_1 = M_0 Gamma v \, #h(2em) P_A = 0 quad \( A = 2 \, 3 \, 4 \) . $ <q4:rec:boost-charges>]
  The preceding weak-decay comparison transfers these charges to the original slice, proving $sqrt(E^2 - \| P \|^2) = M_0$. ◻
]

#thm([Lemma 20.6.])[
  (Volume of a horizon section).  #emph[A smooth spacelike section of a future Tangherlini horizon of geometric mass $M_0 > 0$, including its bifurcation sphere, has induced metric $\( 2 M_0 \) g_(bb(S)^3)$ and three-volume $omega \( 2 M_0 \)^(3 \/ 2)$.]
] <q4:rec:horizon-area>

#proof[
  In the regular coordinates of Equation (20.6), the future horizon is $sans(U) = 0$ with area radius $r = sqrt(2 M_0)$. The generator direction $partial_(sans(V))$ is the kernel of its induced form. Thus pullback to any section leaves precisely $r^2 g_(bb(S)^3)$, regardless of the value of $sans(V)$ along the section. A compact connected spacelike section has an angular projection which is a local diffeomorphism and hence a covering of $bb(S)^3$; compactness gives surjectivity, and simple connectedness of $bb(S)^3$ makes that covering a diffeomorphism. The same induced metric holds at the bifurcation sphere. Taking its volume proves the formula. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 82.] For equality data, Theorem 80 gives $m > 0$. The preceding adjoint, staticity, and classification results apply to the original exterior, and Proposition 110 supplies the required global smooth embedding with the original $g$ and $K$, including its normal and its horizon boundary. The ambient mass is the same $m = sqrt(E^2 - \| P \|^2)$ by the scale in Equation (20.1).
  Conversely, take a Tangherlini hypersurface satisfying every exterior, decay, and horizon hypothesis in the theorem. If its ambient geometric mass is $M_0$, Proposition 112 gives invariant ADM mass $M_0$, and Lemma 113 gives $A = omega \( 2 M_0 \)^(3 \/ 2)$. Outer area minimization, which is part of this converse class, identifies $A$ with the original enclosing infimum. Therefore
  $ sqrt(E^2 - \| P \|^2) = M_0 = 1 / 2 (A / omega)^(2 \/ 3) . $
  This proves both directions, including slices with nonzero original $K$ or nonzero original ADM momentum. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
