#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[The-spacetime-Penrose-inequality-with-charge-and-original-data-rigidity-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Penrose’s mass–area inequality connects the geometry of initial data to the expected evolution of black holes under weak cosmic censorship #cite(label("Penrose1973")). In the absence of charge, its characteristic form is $m gt.eq sqrt(A \/ \( 16 pi \))$. In time-symmetric data, where the scalar curvature is nonnegative and horizons are minimal surfaces, Huisken and Ilmanen proved the three-dimensional bound using the area of any connected component of an outermost minimal boundary, and Bray proved it using the total area of a possibly disconnected outer minimizing minimal boundary #cite(label("HuiskenIlmanen2001")) #cite(label("Bray2001")). The passage to an arbitrary second fundamental form requires an area quantity attached to the original spacelike exterior. The minimum-area enclosure in the spacetime formulation of Bray and Khuri motivates the full-cut quantity used here #cite(label("BrayKhuri2010")). This formulation differs from bounds using the apparent-horizon area itself or the area of an outermost generalized apparent horizon, for which counterexamples are known #cite(label("BenDov2004")) #cite(label("CarrascoMars2010")).

Charge changes both the inequality and its equality model. If $Q^2 = Q_E^2 + Q_B^2$, the outer Reissner–Nordström radius is $m + sqrt(m^2 - Q^2)$. The appropriate statement for possibly disconnected horizons is the upper-area inequality

#[#set math.equation(numbering: n => "(1.1)")
 $ m gt.eq Q \, #h(2em) sqrt(frac(A, 4 pi)) lt.eq m + sqrt(m^2 - Q^2) . $ <eq:intro-upper-area>]

Writing $r_A = sqrt(A \/ \( 4 pi \))$, the familiar polynomial expression $m gt.eq \( r_A + Q^2 \/ r_A \) \/ 2$ is the required branch only for $r_A > Q$. Khuri, Weinstein and Yamada developed a charged conformal-flow approach for multiple boundary components #cite(label("KhuriWeinsteinYamada2017")). The numerical argument here instead converts electric flux into a controlled energy decrease and applies the neutral enclosing-area theorem #cite(label("NeutralEnclosingArea2026")) Theorem 1.3.

This paper proves the minimum-enclosing-area formulation of the charged spacetime Penrose conjecture for the exterior data of Definition 1. The result uses the invariant ADM mass and the area in the original metric. It permits nonzero ADM momentum, disconnected weakly future outer-trapped boundary, both source-free electromagnetic fields, and uncharged non-electromagnetic matter obeying its dominant energy condition (DEC). Only two metric derivatives and one second-form derivative are controlled at infinity. Neither a positive area infimum nor a timelike ADM vector is assumed. Theorem 3 establishes both and proves (1.1).

The equality theorem concerns the entire original initial data. For a connected, outer area-minimizing, outermost marginal boundary in the nondegenerate range $m > Q$, equality holds precisely in the admissible Reissner–Nordström class specified in Theorems 5 and 6. The original metric, second form and both electromagnetic fields are recovered by a global spacelike embedding that is smooth through the future horizon. This includes non-time-symmetric and boosted equality examples. No statement is made about the region behind the initial boundary.

=== 1.1 Construction of the numerical comparison <construction-of-the-numerical-comparison>

The proof first prepares a strict exterior with compactly supported second form and a smooth rest end. The preparation preserves the two closed flux forms and compares the original enclosing infima and invariant masses. Its annular construction uses the stated weak derivatives and integrable constraint sources; it does not impose parity or higher-order decay on the original data. An energy-raising conformal family then deals with the possible non-timelike ADM endpoint after the timelike estimate is proved.

On each prepared exterior we solve a coupled scalar system on an artificial compact filling. One variable is a graph height; the other controls conformal distortion and compression. A scalar identity provides positive quadratic terms strong enough to preserve the charged curvature lower bound after projection of the two flux forms. The system is solved with its floor, boundary-slope bounds and end normalization, rather than subject to a separate solvability hypothesis.

Two features of this construction are useful beyond the final inequality. First, the regularity argument exploits the rank-one axis structure of a uniformly elliptic equation whose axial coefficient need not have a modulus of continuity. A trace-reversed Hessian flux and a fixed-axis comparison give gradient control without differentiating that coefficient. Second, the estimates distinguish constants at a fixed approximation parameter from the quantitative distortion bounds needed when that parameter tends to infinity. The height separates the filling from a region with a charged scalar-curvature bound. A second bounded scalar solve converts the total charge into an exact decrease of ADM energy, while its conformal floor controls every full enclosing area. A compactly supported pure-trace second form makes a regular height boundary future trapped, so the neutral theorem applies. Optimizing the flux profile gives both branches of the charged bound. The Maxwell forms need be closed only on the original exterior; their smooth extensions into the artificial filling impose no flux constraint there.

=== 1.2 Recovery of equality data <recovery-of-equality-data>

After the numerical inequality, the proof returns to the original exterior. Variation of the enclosing infimum is performed over its whole compact family of perimeter minimizers. Constraint separation produces a causal lapse–shift pair. Variations of both closed flux forms yield exact electromagnetic Killing contractions even when the exterior is not simply connected. The resulting stationary data are the original data; their possible extra stress is an aligned null tensor.

The same variation argument excludes larger marginal obstacles with a fixed future or past sign on each component. This stronger exclusion supplies causal communication with the end. A smooth bifurcation attachment, including an all-orders normal-jet argument at vanishing lapse, then places the stationary exterior within the hypotheses of the maximal-hypersurface theorem of Chruściel and Wald #cite(label("ChruscielWald1994")). On that maximal slice, the magnetic potential and momentum identities adapt the integral staticity method of Sudarsky and Wald #cite(label("SudarskyWald1993")), with the residual-matter term treated locally, to force staticity and the disappearance of additional matter. The static orbit metric has the original invariant mass and boundary area. The complete electrostatic equations and normalized lapse permit application of the connected-horizon uniqueness theorem of Borghini, Cederbaum, and Cogo #cite(label("BorghiniCederbaumCogo2025")) Theorem 3.1. It identifies the static metric, lapse, and electric potential with Reissner–Nordström, after which the original slice, horizon embedding and two signed charges are recovered.

=== 1.3 Organization <organization>

Section 2 gives the full hypotheses and conventions. The geometric preliminaries justify positivity and the full-frontier perimeter formulation. The end preparation, filled-system identity, a priori estimates and elliptic solve construct the comparison data; the charged comparison closes the numerical proof. The final three sections carry out original-data variation, the stationary extension and the rigidity and sharpness arguments.

== 2 Initial data and the main theorems <sec:statements>

We use units $G = c = 1$ and zero cosmological constant. The sign convention for a spacetime realization is $\( - \, + \, + \, + \)$ and

$ K \( U \, V \) = upright(bold(G)) \( nabla_U n \, V \) \, $

where $n$ is the future unit timelike normal. On an inner boundary, the unit normal $nu$ always points into the exterior, toward its designated asymptotically Euclidean end. We put $H = "div"_S nu$ and $"tr"_S K = \( g^(i j) - nu^i nu^j \) K_(i j)$. Thus the future outward null expansion is $theta_(+) = H + "tr"_S K$.

#prodef([Definition 2.1.])[
  (Charged exterior data).  Let $Omega$ be a connected oriented smooth three-manifold with nonempty compact smooth boundary $S$, and let $\( g \, K \, cal(E) \, cal(B) \)$ be smooth up to $S$. Here $g$ is Riemannian, $K$ is a symmetric covariant two-tensor, and $cal(E) \, cal(B)$ are vector fields. We require completeness of the metric space $\( Omega \, g \)$ with its boundary included. Outside a compact set there is exactly one coordinate end, diffeomorphic to ${ x in bb(R)^3 : \| x \| > R_0 }$.
  Throughout the proof we use geometric constraint densities:
  #[#set math.equation(numbering: n => "(2.1)")
   $ 2 mu & = R_g + tau^2 - \| K \|_g^2 \, & J_i & = nabla^j \( K_(i j) - tau g_(i j) \) \, & tau & = "tr"_g K \,\
mu_m & = mu - \( \| cal(E) \|_g^2 + \| cal(B) \|_g^2 \) \, & J_m & = J - 2 \( cal(E) times cal(B) \)^flat . &  & $ <eq:constraints>]
  These four densities are $8 pi$ times their physical counterparts. The cross product uses the orientation of $Omega$. Assume
  #[#set math.equation(numbering: n => "(2.2)")
   $ mu_m gt.eq \| J_m \|_g \, #h(2em) "div"_g cal(E) = "div"_g cal(B) = 0 \, #h(2em) mu \, \| J \|_g in L^1 \( Omega \, d V_g \) . $ <eq:charged-dec>]
  On the end, for some $q > 1 \/ 2$ and $r = \| x \|$, assume
  #[#set math.equation(numbering: n => "(2.3)")
   $ g_(i j) - delta_(i j) = O_2 \( r^(- q) \) \, #h(2em) K_(i j) = O_1 \( r^(- 1 - q) \) \, #h(2em) cal(E)^i \, cal(B)^i = O_1 \( r^(- 2) \) . $ <eq:weak-decay>]
  The notation $O_j \( r^(- a) \)$ bounds every coordinate derivative of order $ell lt.eq j$ by $C_ell r^(- a - ell)$. These are bounds on otherwise smooth data, not additional higher-derivative decay assumptions.
  The following limits are assumed finite:
  #[#set math.equation(numbering: n => "(2.4)")
   $ E & = frac(1, 16 pi) lim_(R arrow.r oo) integral_(r = R) \( partial_j g_(i j) - partial_i g_(j j) \) n_delta^i thin d A_delta \,\
P_i & = frac(1, 8 pi) lim_(R arrow.r oo) integral_(r = R) \( K_(i j) - tau g_(i j) \) n_delta^j thin d A_delta \,\
Q_E & = frac(1, 4 pi) lim_(R arrow.r oo) integral_(r = R) g \( cal(E) \, nu_R \) thin d A_g \, & Q_B & = frac(1, 4 pi) lim_(R arrow.r oo) integral_(r = R) g \( cal(B) \, nu_R \) thin d A_g . $ <eq:adm-energy>]
  Here $n_delta \, d A_delta$ are Euclidean, whereas $nu_R \, d A_g$ are computed in $g$. Put $Q = \( Q_E^2 + Q_B^2 \)^(1 \/ 2)$.
] <def:data>

No assumption is made about data behind $S$, and no extension across $S$ is required. In particular, the single-end assumption concerns this exterior only. Boundary components and compact-interior topology are unrestricted. There is no assumption of a global electromagnetic vector potential. It is useful to retain instead the closed two-forms

#[#set math.equation(numbering: n => "(2.5)")
 $ alpha_1 = iota_(cal(E)) d V_g \, #h(2em) alpha_2 = iota_(cal(B)) d V_g . $ <eq:flux-forms>]

Unless stated otherwise, a change of metric keeps these forms fixed and defines the new vector fields by contraction with the new volume form. All form norms are exterior-algebra norms.

#prodef([Definition 2.2.])[
  (Full enclosing cut).  A full enclosing cut is $Gamma = partial D$, the entire intrinsic manifold boundary of a connected smooth codimension-zero submanifold-with-boundary $D subset Omega$ that is closed in $Omega$, has manifold interior in $"int" Omega$, and contains the whole sufficiently distant part of the end. The boundary $Gamma$ is required to be compact, smooth, embedded and two-sided. It is oriented toward the end. All components, including any portions coincident with $S$, are counted. In particular $D = Omega$ contributes $Gamma = S$. Define, in the original metric,
  #[#set math.equation(numbering: n => "(2.6)")
   $ a_g \( S \) = inf_Gamma "Area"_g \( Gamma \) \, #h(2em) r_A = sqrt(frac(a_g \( S \), 4 pi)) . $ <eq:enclosing-area>]
] <def:full-cut>

The closed flux forms have flux $4 pi Q_E$ and $4 pi Q_B$ across every full cut by Stokes’ Theorem. Opposite charges on different boundary components are allowed. Section 3 proves both positivity of $a_g \( S \)$ and equivalence with the filled finite-perimeter convention used in the proof; neither a positive infimum nor an attained smooth minimum is assumed here.

#thm([Theorem 2.3.])[
  (Charged spacetime Penrose inequality).  #emph[Let the data satisfy Definition 1, and suppose $theta_(+) lt.eq 0$ on every component of $S$. Then $E > \| P \|$, the invariant ADM mass $m = sqrt(E^2 - \| P \|^2)$ is positive, and 
#[#set math.equation(numbering: n => "(2.7)")
 $ E gt.eq sqrt(\| P \|^2 + Q^2) \, #h(2em) m gt.eq Q \, #h(2em) r_A lt.eq m + sqrt(m^2 - Q^2) . $ <eq:main-inequality>]

 The same conclusion holds if, on each boundary component, one fixes either the condition $H + "tr"_S K lt.eq 0$ or the condition $H - "tr"_S K lt.eq 0$.]
] <thm:numerical>

The upper-area formulation in (2.7) is essential. It is equivalent to $m gt.eq Q$ for $0 < r_A lt.eq Q$, and to

#[#set math.equation(numbering: n => "(2.8)")
 $ m gt.eq 1 / 2 (r_A + Q^2 / r_A) #h(2em) upright("when ") r_A > Q . $ <eq:polynomial-branch>]

There is no unrestricted polynomial claim below the charge threshold. The theorem also proves that the possible null ADM endpoint cannot occur with a nonempty compact boundary in this class. It requires no connectedness, outermostness or area-minimization hypothesis for the numerical inequality.

#prodef([Definition 2.4.])[
  (Connected horizon class).  Data in Theorem 3 belong to the connected horizon class if $S$ is connected, $theta_(+) = 0$ on $S$, every full cut has area at least $A = "Area"_g \( S \) > 0$, and there is no compact smooth embedded two-sided full enclosing surface entirely in $"int" Omega$ with $theta_(+) lt.eq 0$ everywhere. Such an excluded surface may be disconnected. Thus $a_g \( S \) = A$. No strictly positive stability eigenvalue of this marginally outer trapped surface (MOTS) is assumed.
] <def:rigidity-class>

#thm([Theorem 2.5.])[
  (Original-data equality).  #emph[Assume the connected horizon class and $m > Q$. If 
#[#set math.equation(numbering: n => "(2.9)")
 $ sqrt(frac(A, 4 pi)) = m + sqrt(m^2 - Q^2) \, $ <eq:main-equality>]

 then the entire original quadruple $\( g \, K \, cal(E) \, cal(B) \)$, including its boundary, is induced by a global smooth orientation-preserving spacelike embedding into the regular future-horizon extension of one exterior of dyonic Reissner–Nordström with parameters $\( m \, Q_E \, Q_B \)$.]
  #emph[The image lies in the domain of outer communication together with its corresponding future horizon. The boundary is a full smooth horizon cross-section or the bifurcation sphere, and the chosen end approaches the corresponding spatial infinity. The embedding, its future unit normal and the induced electromagnetic fields extend smoothly to $S$. The non-electromagnetic matter densities vanish throughout the exterior.]
] <thm:rigidity>

For clarity, in static coordinates the target spacetime and two-form are

#[#set math.equation(numbering: n => "(2.10)")
 $ upright(bold(G))_(upright("RN")) & = - F \( r \) thin d T^2 + F \( r \)^(- 1) d r^2 + r^2 sigma_2 \, & F \( r \) & = 1 - frac(2 m, r) + frac(Q_E^2 + Q_B^2, r^2) \,\
upright(bold(F))_(upright("RN")) & = Q_E / r^2 thin d T and d r + Q_B thin d A_(sigma_2) \, & r & > r_(+) = m + sqrt(m^2 - Q^2) . $ <eq:rn-metric>]

Here $sigma_2$ is the unit round metric with its oriented area form, and $"vol"_(upright(bold(G))) = r^2 d T and d r and d A_(sigma_2)$. The Hodge star is characterized by $beta and \( * gamma \) = chevron.l beta \, gamma chevron.r_(upright(bold(G))) "vol"_(upright(bold(G)))$. For the embedding $iota$ and its future normal $n$, electromagnetic matching means

#[#set math.equation(numbering: n => "(2.11)")
 $ cal(E)^flat = iota^(*) \( iota_n upright(bold(F))_(upright("RN")) \) \, #h(2em) cal(B)^flat = iota^(*) \( iota_n \( * upright(bold(F))_(upright("RN")) \) \) . $ <eq:em-matching>]

The induced orientation is $iota_n "vol"_(upright(bold(G)))$. On a static slice these fields are respectively $Q_E \/ r^2$ and $Q_B \/ r^2$ times the outward unit radial vector. On general slices neither radiality nor pointwise parallelism of the original two fields is asserted.

#thm([Theorem 2.6.])[
  (Converse and sharpness).  #emph[Let $M > sqrt(q_E^2 + q_B^2)$, and put $R_(+) = M + sqrt(M^2 - q_E^2 - q_B^2)$. Every smooth spacelike exterior hypersurface of dyonic Reissner–Nordström with these parameters whose induced data satisfy Definitions 1 and 4, whose boundary is a full cross-section of the corresponding future horizon or its bifurcation sphere, and whose actual invariant ADM mass and outward charge fluxes are $M \, q_E \, q_B$, satisfies 
$ a_g \( S \) = "Area"_g \( S \) = 4 pi R_(+)^2 $

 and attains equality in Theorem 3. For every such parameter triple there are admissible static examples, examples with $K equiv.not 0$, and examples with nonzero ADM momentum.]
] <thm:converse>

Mass and flux matching are explicit conditions in the converse; the examples verify them by direct calculation. Theorem 5 makes no extremal classification at $m = Q$ and no statement about data behind the boundary.

== 3 Full enclosing cuts and their minimizing frontiers <ct:section>

The area in the theorem is an intrinsic exterior invariant. In particular, a portion of a cut coinciding with the original boundary still contributes area. We establish the compactness and variation properties of this invariant without using the constraint equations.

Write $a_g \( S \) = A_min \( S \)$, with the convention of Definition 2. All surface orientations point toward the end. This normal is the inward normal of the exterior region bounded by the cut.

#thm([Lemma 3.1.])[
  (Flux through the entire intrinsic boundary).  #emph[If $beta$ is a smooth closed two-form on $Omega$, smooth up to $S$, then for every full enclosing cut $Gamma$ and every sufficiently distant coordinate sphere $S_r$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ integral_Gamma beta = integral_(S_r) beta = integral_S beta . $ <ct:flux-identity>]

 No extension of $beta$ across $S$ is required.]
] <ct:flux>

#proof[
  Let $D$ be the exterior region defining $Gamma$. Choose $r$ so that $Gamma$ lies strictly inside $S_r$ and a neighborhood of $S_r$ lies in the manifold interior of $D$. The truncated region $D_r$ is a compact smooth manifold with intrinsic boundary $Gamma union.sq S_r$. Its boundary orientation on $Gamma$ is opposite to the chosen end orientation. Stokes’ Theorem gives $0 = integral_(D_r) d beta = integral_(S_r) beta - integral_Gamma beta$. The same argument on the truncation of $Omega$ proves the other equality. Contact between $Gamma$ and $S$ occurs on the smooth intrinsic boundary of $D_r$; it neither deletes a boundary term nor creates another face. Every boundary component is included. ◻
]

For the two closed flux forms $alpha_1 \, alpha_2$ in Equation (2.5), Equation (3.1) gives the two conserved charges individually.

#thm([Proposition 3.2.])[
  (Strict positivity of the full-cut area).  #emph[Under the geometric hypotheses of Definition 1, 
#[#set math.equation(numbering: n => "(3.2)")
 $ 0 < a_g \( S \) lt.eq "Area"_g \( S \) < oo . $ <ct:positive-area>]

 There is, more precisely, a smooth closed two-form $beta$ on $Omega$ with finite positive comass bound $C_beta$ and $integral_Gamma beta = 1$ for every full cut. Thus $a_g \( S \) gt.eq C_beta^(- 1)$.]
] <ct:full-cut-positive>

#proof[
  Choose a point of $S$. Its boundary collar, connectedness of $Omega$, and the single coordinate end give an embedded proper ray starting transversely at that point and eventually equal to a straight coordinate ray. Indeed, join the collar to the end by a path, perturb its compact part to an embedded arc in dimension three, shorten at its last crossing of a large coordinate sphere, and attach the outward straight ray. The two joins can be smoothed in disjoint coordinate balls.
  The normal disk bundle of the ray is trivial because its base is an interval. The tubular-neighborhood construction on its compact portion, followed by the straight tail, gives an embedded tube
  $ Phi : \[ 0 \, oo \) times bb(D)^2 arrow.r Omega $
  whose initial disk lies in $S$, whose positive-parameter part lies in $"int" Omega$, and whose tail has a fixed positive coordinate radius. Let $omega$ be a smooth two-form compactly supported in the interior of the transverse disk, oriented so that $integral_(bb(D)^2) omega = 1$. Define $beta$ on the tube by $Phi^(*) beta = "pr"_(bb(D)^2)^(*) omega$, and extend by zero. The transverse compact support makes this extension smooth at the lateral boundary; it is smooth up to $S$ and closed.
  Its comass is bounded on the compact portion and on the straight tail, the latter because the coordinate radius is fixed and $g_(i j) arrow.r delta_(i j)$. Thus $C_beta = sup_Omega parallel beta parallel_(* \, g) < oo$. A sufficiently distant sphere meets the supporting tail in a positively oriented graph over the entire support of $omega$ and has flux one. Lemma 7 gives the same flux on every full cut. Hence
  $ 1 = lr(|integral_Gamma beta|) lt.eq C_beta "Area"_g \( Gamma \) . $
  Finally $S$ itself is an admissible cut. ◻
]

=== 3.1 An auxiliary perimeter problem <ct:perimeter-subsection>

Each component of $S$ is a closed orientable surface and bounds a compact handlebody. Attach such handlebodies along $S$, with the appropriate orientations, and denote their union by $F$ and the resulting boundaryless manifold by $hat(Omega)$. Extend $g$ smoothly across $S$: extend its smooth coefficients in boundary collars, retain positive definiteness in smaller collars, and join to any interior metric using a partition of unity. Thus

$ hat(Omega) \\ "int" F = Omega \, #h(2em) partial F = S . $

This construction extends only the Riemannian metric.

For a bounded set $M$ of finite perimeter, let $P_g \( M \) = \| D upright(bold(1))_M \|_g \( hat(Omega) \)$. Sets are initially identified up to volume-null sets. Put

#[#set math.equation(numbering: n => "(3.3)")
 $ p_g \( F \) = inf { P_g \( M \) : M upright(" bounded, of finite perimeter, ") F subset M upright(" a.e.") } . $ <ct:perimeter-infimum>]

Perimeter is taken in all of $hat(Omega)$; in particular $P_g \( F \) = "Area"_g \( S \)$. The same construction applies to any smooth compact enlarged obstacle whose exterior is connected and has the same end.

#thm([Lemma 3.3.])[
  (Confinement by the end foliation).  #emph[There are compact truncations $C_(R_0) subset "int" C_(R_1)$ containing $F$ such that the infimum in Equation (3.3) is attained and every bounded minimizer is contained in $C_(R_0)$ up to a null set. The same truncations work for a family with uniform asymptotic bounds $g_(i j) - delta_(i j) = O_1 \( r^(- q) \)$, $q > 0$, on a common end. The existence and confinement statements also hold for an arbitrary bounded measurable obstacle in place of $F$.]
] <ct:confinement>

#proof[
  Let $C_t$ be the compact region inside $S_t$, including the filling. On a sufficiently distant end the smooth unit field $Z = nabla r \/ \| nabla r \|_g$ satisfies
  #[#set math.equation(numbering: n => "(3.4)")
   $ "div"_g Z = H_(S_r) = 2 / r + O \( r^(- 1 - q) \) > 0 . $ <ct:positive-divergence>]
  Increase $R_0$ so this holds for $r > R_0$ and $F subset "int" C_(R_0)$.
  For any bounded finite-perimeter set $M$, the slicing and Gauss–Green formulas give, for almost every $t > R_0$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ integral_(M ∩ { r > t }) "div"_g Z thin d V_g & = integral_(partial^(*) M ∩ { r > t }) g \( Z \, nu_M \) thin d A_g - b \( t \) \,\
P_g \( M ∩ C_t \) & = P_g \( M \; { r < t } \) + b \( t \) \, $ <ct:clipping-flux>]
  where $b \( t \) = integral_(S_t) upright(bold(1))_M thin d A_g$ uses the common almost-everywhere trace. In Equation (3.5), cut off $Z$ beyond the bounded set $M$ if necessary. Since $\| Z \|_g = 1$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ P_g \( M ∩ C_t \) lt.eq P_g \( M \) - integral_(M ∩ { r > t }) "div"_g Z thin d V_g . $ <ct:clipping>]
  Clipping strictly decreases perimeter if the discarded volume is positive.
  Fix $R_1 > R_0$ and clip each member of a minimizing sequence at a good radius in $\( R_0 \, R_1 \)$. The resulting sets lie in $C_(R_1)$, contain $F$, and have bounded perimeter and volume. Compactness in the space $B V$ of functions of bounded variation gives an $L^1$ convergent subsequence, and lower semicontinuity gives a minimizer. The obstacle condition is closed under $L^1$ convergence. These compactness and lower-semicontinuity results apply in finitely many coordinate charts on a larger compact neighborhood #cite(label("AmbrosioFuscoPallara2000")) Theorem 3.23 and Proposition 3.6. Equation (3.6) equates this confined infimum with the unrestricted bounded-set infimum. Applying it to a minimizer at good radii decreasing to $R_0$ proves that the minimizer has zero volume outside $C_(R_0)$. Its perimeter support therefore lies strictly inside $C_(R_1)$.
  Uniform end bounds make the error in Equation (3.4) uniform, so the same construction works for the stated family. Only boundedness and the closedness in $L^1$ of the containment condition were used for the obstacle; a large compact truncation is always a finite-perimeter competitor. This proves the last assertion. ◻
]

#thm([Proposition 3.4.])[
  (Equivalence with full cuts and obstacle regularity).  #emph[The auxiliary minimum equals the intrinsic smooth-cut infimum: 
#[#set math.equation(numbering: n => "(3.7)")
 $ p_g \( F \) = a_g \( S \) . $ <ct:infima-equal>]

 Every minimizing set has a regular representative with compact embedded $C^(1 \, 1)$ frontier, smooth and minimal away from the obstacle. Thus its frontier is $C^(1 \, alpha)$ for every $0 < alpha < 1$ and has $W^(2 \, 2)$ local graphs. It has no bounded complementary component. Its exterior is connected to the unique end, and its entire frontier, including contact with $S$, carries its perimeter measure.]
] <ct:perimeter-equivalence>

#proof[
  Let $M$ minimize and let $M'$ be a bounded finite-perimeter local competitor, without an obstacle restriction. The set $M' union F$ is admissible. Perimeter submodularity gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ P_g \( M \) - P_g \( M' \) lt.eq P_g \( F \) - P_g \( M' ∩ F \) . $ <ct:submodular-repair>]
  Choose a smooth compactly supported vector field $V$ with $\| V \|_g lt.eq 1$ which agrees with the outward unit normal of $F$ on $partial F$. The signed-distance collar and a cutoff provide such a field. Gauss–Green gives
  $ P_g \( F \) = integral_F "div"_g V thin d V_g \, #h(2em) integral_(M' ∩ F) "div"_g V thin d V_g lt.eq P_g \( M' ∩ F \) . $
  Consequently, for $Lambda = parallel "div"_g V parallel_oo$,
  #[#set math.equation(numbering: n => "(3.9)")
   $ P_g \( M \) - P_g \( M' \) lt.eq Lambda "Vol"_g \( F \\ M' \) lt.eq Lambda "Vol"_g \( M triangle.stroked.t M' \) . $ <ct:almost-minimality>]
  The unchanged perimeters outside the variation neighborhood cancel, so this is also a local inequality.
  The exact obstacle regularity result we use is Huisken–Ilmanen’s Regularity Theorem 1.3(iii): in a smooth Riemannian domain of ambient dimension less than eight, a pure perimeter minimizer respecting a $C^2$ obstacle has $C^(1 \, 1)$ boundary, smooth off contact #cite(label("HuiskenIlmanen2001")). Here $M$ minimizes against every compactly supported competitor containing the open obstacle $"int" F$; the metric and obstacle are smooth, the dimension is three, and the bulk term is zero. Lemma 9 keeps its frontier away from the auxiliary truncation boundary. The regular representative is the closure of its measure-theoretic interior, whose boundary equals the perimeter support. Away from $F$, both signs of every compact normal variation are allowed, so this smooth boundary has mean curvature zero. The stated Sobolev regularity follows from $C^(1 \, 1)$.
  A compact embedded frontier has finitely many components: it has a finite cover by connected graph neighborhoods. If its complement had a bounded open component, that component’s boundary would be a nonempty union of frontier components. Adding it to $M$ removes their positive area without adding a new frontier and contradicts minimality. There is only one unbounded complementary component, because $hat(Omega)$ has one end and $M$ is bounded.
  Given an admissible smooth exterior $D$ with full boundary $Gamma$, the bounded set $M_D = hat(Omega) \\ "int" D$ contains $F$ and has boundary exactly $Gamma$. Therefore $P_g \( M_D \) = "Area"_g \( Gamma \)$, including every coincident portion on $S$. In particular $D = Omega$ gives $M_D = F$. This proves $p_g \( F \) lt.eq a_g \( S \)$.
  Conversely, flow a minimizing set $M$ for small time $s > 0$ by a compactly supported smooth field pointing strictly outward on $S$. The image $M_s$ contains $F$ in its interior. Indeed it contains the flowed obstacle, whose boundary in the signed-distance collar has moved strictly outside $S$. The flow’s surface Jacobians converge uniformly to one, so $P_g \( M_s \) arrow.r P_g \( M \)$.
  A compact $C^1$ embedded boundary has a $C^1$ defining function with nonzero differential near its boundary. Approximate this function in $C^1$ by smooth functions; the implicit function theorem yields smooth embedded boundaries converging in $C^1$, with the same enclosed side. Apply this to $partial M_s$. Its positive distance from $F$ preserves enclosure under sufficiently close approximation, and surface Jacobians give area convergence. Fill bounded complementary components of each approximation. This deletes components and does not increase area. The closure of the remaining exterior is connected, contains the whole distant end, and has smooth compact two-sided intrinsic boundary in $"int" Omega$. It is an admissible full cut. Letting the approximation error and then $s$ tend to zero proves $a_g \( S \) lt.eq p_g \( F \)$. ◻
]

#thm([Corollary 3.5.])[
  (Minimal obstacles).  #emph[If every component of the smooth obstacle boundary is minimal, every minimizing frontier in Proposition 10 is smooth and minimal everywhere. If a frontier meets a connected component of the obstacle boundary, it contains that entire component.]
] <ct:minimal-obstacle>

#proof[
  At contact, write frontier and obstacle as graphs $u gt.eq psi$, with $u in C^(1 \, 1)$ and $psi$ smooth. On the contact set $D u = D psi$ and $D^2 u = D^2 psi$ almost everywhere. The second statement follows from the fact that the weak derivative of a Sobolev function vanishes almost everywhere on a level set, applied to the Lipschitz functions $D_i \( u - psi \)$. Off contact $u$ solves the minimal graph equation; at almost every contact point its second derivatives equal those of the minimal graph $psi$. Thus it solves the same equation weakly throughout the patch. The bounded gradient makes this a uniformly elliptic equation, so interior elliptic regularity and bootstrapping give smoothness. The strong maximum principle for the difference of the two smooth minimal graph equations gives local coincidence at each contact point. Contact is also closed, so connectedness extends the coincidence over the obstacle component. ◻
]

#thm([Corollary 3.6.])[
  (Comparison of exterior metrics).  #emph[If $g_j gt.eq c_j g$ on $Omega$, $c_j arrow.r 1$, and $g_j arrow.r g$ uniformly on compact sets, then $a_(g_j) \( S \) arrow.r a_g \( S \)$.]
] <ct:metric-comparison>

#proof[
  Two-dimensional area elements satisfy $d A_(g_j) gt.eq c_j d A_g$, so $a_(g_j) \( S \) gt.eq c_j a_g \( S \)$. For the upper bound, test with any fixed smooth cut of $g$-area less than $a_g \( S \) + epsilon$, use compact convergence on that cut, and then let $epsilon arrow.b 0$. ◻
]

=== 3.2 Strict compactness and the derivative of the minimum <ct:variation-subsection>

For a fixed smooth obstacle $F$, denote the family of its minimizing filled sets by $cal(M)_g \( F \)$. Give this family the $L^1$ distance on a common compact truncation; enlarging that truncation does not change the distance. Tangent planes are unoriented.

#thm([Proposition 3.7.])[
  (Strict compactness of minimizing enclosures).  #emph[Let smooth metrics $g_j$ converge to $g$ uniformly on compact sets, with common end bounds as in Lemma 9, and choose their auxiliary extensions to converge uniformly on the filling. If $M_j in cal(M)_(g_j) \( F \)$, a subsequence converges to $M in cal(M)_g \( F \)$ with 
#[#set math.equation(numbering: n => "(3.10)")
 $ upright(bold(1))_(M_j) arrow.r upright(bold(1))_M quad upright("in ") L^1 \, #h(2em) P_g \( M_j \) arrow.r P_g \( M \) = p_g \( F \) . $ <ct:strict-convergence>]

 For every continuous function $Psi$ on the bundle of unoriented two-planes over the common compact truncation, 
#[#set math.equation(numbering: n => "(3.11)")
 $ integral_(partial M_j) Psi \( x \, T_x partial M_j \) thin d A_g arrow.r integral_(partial M) Psi \( x \, T_x partial M \) thin d A_g . $ <ct:plane-measure-continuity>]

 Thus $cal(M)_g \( F \)$ is a compact metric space, and the area first-variation functional is continuous on it.]
] <ct:strict-compactness>

#proof[
  Confinement supplies one compact set $C$ containing every minimizer. Uniform metric comparison on $C$ gives $epsilon_j arrow.b 0$ such that for every set $M'$ whose perimeter is supported there,
  #[#set math.equation(numbering: n => "(3.12)")
   $ \( 1 - epsilon_j \) P_g \( M' \) lt.eq P_(g_j) \( M' \) lt.eq \( 1 + epsilon_j \) P_g \( M' \) . $ <ct:uniform-perimeter-comparison>]
  Taking infima, using confinement for both metrics, proves $p_(g_j) \( F \) arrow.r p_g \( F \)$, and hence $P_g \( M_j \) arrow.r p_g \( F \)$. Compactness in $B V$ and lower semicontinuity give a subsequential $L^1$ limit $M$ containing $F$ and supported in $C$, with $P_g \( M \) lt.eq p_g \( F \)$. Therefore it minimizes, proving Equation (3.10).
  The vector-measure continuity needed here can also be proved directly. Use the fixed metric $g$, and write
  $ lambda_j = nu_j thin d A_g \|_(partial M_j) \, #h(2em) lambda = nu thin d A_g \|_(partial M) \, $
  where $nu_j \, nu$ are outward unit normals. Gauss–Green and $L^1$ convergence give weak convergence of these vector measures. Their total variation masses converge by Equation (3.10). Lower semicontinuity with nonnegative continuous weights and convergence of the total masses also imply $\| lambda_j \| harpoon.rt \| lambda \|$.
  Approximate the measurable unit normal $nu$ in $L^2 \( \| lambda \| \)$ by a continuous vector field $V$ on $C$ with $\| V \|_g lt.eq 1$. One obtains such approximations in finitely many bundle charts, joins them by a partition of unity, and projects onto the unit ball. They make $integral \( 1 - g \( V \, nu \) \) thin d \| lambda \|$ arbitrarily small. For each such $V$,
  $ integral \| nu_j - V \|_g^2 thin d \| lambda_j \| & lt.eq 2 (\| lambda_j \| \( C \) - integral g \( V \, d lambda_j \)) \,\
limsup_j integral \| nu_j - V \|_g^2 thin d \| lambda_j \| & lt.eq 2 integral \( 1 - g \( V \, nu \) \) thin d \| lambda \| . $
  A continuous function of a unit normal extends continuously to the closed unit-ball bundle and is uniformly continuous on that compact bundle. The displayed estimate, Cauchy–Schwarz, and weak convergence of $\| lambda_j \|$ give convergence of its integrals, first at a fixed approximation $V$, then as the approximation error tends to zero. Apply this to the even function $Psi \( x \, nu^(perp_g) \)$ to obtain Equation (3.11). This is the needed case of Reshetnyak’s Continuity Theorem #cite(label("AmbrosioFuscoPallara2000")) Theorem 2.39.
  The constant metric sequence gives compactness of $cal(M)_g \( F \)$. For a continuous symmetric tensor $h$, the function $Psi \( x \, T \) = 1 / 2 "tr"_T h$ is continuous, giving the last assertion. ◻
]

#thm([Proposition 3.8.])[
  (One-sided derivative of the area infimum).  #emph[Let $g_s$ be a path of smooth exterior metrics with $g_0 = g$, common end bounds as in Lemma 9, and 
$ g_s = g + s h + o \( \| s \| \) quad upright("in ") C^0 $

 on a common compact truncation including the filling. For the fixed obstacle $F$ with exterior boundary $B$, set $a \( s \) = a_(g_s) \( B \)$. Then 
#[#set math.equation(numbering: n => "(3.13)")
 $ frac(d, d s)\|_(0 +) a \( s \) = min_(M in cal(M)_g \( F \)) L_h \( M \) \, #h(2em) L_h \( M \) = 1 / 2 integral_(partial M) "tr"_(T partial M) h thin d A_g . $ <ct:minimum-derivative>]

 Only exterior and boundary values of $h$ enter the integral.]
] <ct:area-derivative>

#proof[
  The determinant formula for a two-plane area gives, uniformly over planes in the compact truncation,
  $ d A_(g_s) = (1 + s / 2 "tr"_T h + o \( \| s \| \)) d A_g . $
  For every finite-perimeter competitor $M'$ in that truncation,
  #[#set math.equation(numbering: n => "(3.14)")
   $ P_(g_s) \( M' \) = P_g \( M' \) + s L_h \( M' \) + o \( \| s \| \) P_g \( M' \) \, $ <ct:uniform-area-expansion>]
  with the same remainder modulus. By Proposition 13, the minimum of $L_h$ exists.
  Testing $a \( s \)$ with any $M in cal(M)_g \( F \)$ gives
  $ limsup_(s arrow.b 0) frac(a \( s \) - a \( 0 \), s) lt.eq L_h \( M \) . $
  In the other direction, take a minimizer $M_s$ for $g_s$. Its $g$-perimeter is bounded and at least $a \( 0 \)$, so Equation (3.14) gives
  $ frac(a \( s \) - a \( 0 \), s) gt.eq L_h \( M_s \) + o \( 1 \) #h(2em) \( s > 0 \) . $
  Along a sequence realizing the lower limit, strict compactness gives a subsequence converging to a member of $cal(M)_g \( F \)$; continuity of $L_h$ yields the opposite inequality. No differentiable choice of minimizer is needed. Since $F subset M$, the frontier does not enter $"int" F$, which proves the final assertion. ◻
]

=== 3.3 Compatibility of minimizing sheets <ct:sheets-subsection>

The variation argument averages over the minimizing family. The next property prevents cancellation between different tangent planes above one spatial point.

#thm([Lemma 3.9.])[
  (Compatible planes).  #emph[For a fixed smooth compact obstacle $F$, the set 
$ cal(Z) = union.big_(M in cal(M)_g \( F \)) partial M $

 is compact. At each $x in cal(Z)$, all minimizing frontiers through $x$ have the same unoriented tangent plane $T \( x \)$, and $T$ is continuous on $cal(Z)$. If $pi$ is a Borel probability measure on $cal(M)_g \( F \)$ and 
$ eta \( A \) = integral_(cal(M)_g \( F \)) "Area"_g \( A ∩ partial M \) thin d pi \( M \) \, $

 then, for every continuous function $Psi$ on the plane bundle, 
#[#set math.equation(numbering: n => "(3.15)")
 $ integral_(cal(M)_g \( F \)) integral_(partial M) Psi \( x \, T_x partial M \) thin d A_g thin d pi \( M \) = integral_(cal(Z)) Psi \( x \, T \( x \) \) thin d eta \( x \) . $ <ct:averaged-plane>]

]
] <ct:compatible-planes>

#proof[
  If $M_1 \, M_2$ minimize, their union and intersection contain $F$. Submodularity gives
  $ 2 p_g \( F \) lt.eq P_g \( M_1 union M_2 \) + P_g \( M_1 ∩ M_2 \) lt.eq P_g \( M_1 \) + P_g \( M_2 \) = 2 p_g \( F \) . $
  Thus both also minimize. If their frontier planes were distinct at an intersection, the tangent half-spaces would meet transversely. The boundary of their union or intersection would have a corner: its tangent cone would contain two distinct half-planes. This contradicts its $C^1$ regularity from Proposition 10.
  Here is the required closedness argument. On the common compact truncation, Equation (3.9) has a fixed constant. It yields uniform density bounds at every frontier point, for sufficiently small coordinate balls centered there:
  #[#set math.equation(numbering: n => "(3.16)")
   $ c r^3 lt.eq "Vol"_g \( M ∩ B_r \) \, #h(2em) c r^3 lt.eq "Vol"_g \( B_r \\ M \) \,\
c r^2 lt.eq P_g \( M \; B_r \) lt.eq C r^2 . $ <ct:density-bounds>]
  For clarity, compare with $M \\ B_r$ and $M union B_r$. For either phase volume $v \( r \)$, the isoperimetric inequality for its intersection with the ball and these comparisons give
  $ v \( r \)^(2 \/ 3) lt.eq C #scale(x: 120%, y: 120%)[\(] 2 v' \( r \) + Lambda v \( r \) #scale(x: 120%, y: 120%)[\)] quad upright("for almost every ") r . $
  The coarea formula identifies $v'$ with the slice area up to fixed coordinate constants. Since $v \( r \) lt.eq C r^3$, the last term is absorbed for small $r$. Integrating $\( v^(1 \/ 3) \)' gt.eq c$ gives $v \( r \) gt.eq c r^3$; both phases are nonempty at every scale at a perimeter-support point. Relative isoperimetry gives the perimeter lower bound; the same competitors and the coordinate-sphere area bound give the upper bound. Smooth compact geometry makes these constants uniform.
  Suppose now $M_j arrow.r M$ in $cal(M)_g \( F \)$ and $x_j in partial M_j$ tend to $x$. The two volume bounds pass to every fixed small ball about $x$ under $L^1$ convergence; hence $x in partial M$. Huisken–Ilmanen’s Regularity Theorem 1.3(ii) gives uniform local $C^(1 \, alpha)$ estimates for a fixed $0 < alpha lt.eq 1 \/ 2$ #cite(label("HuiskenIlmanen2001")). Its dependencies are the distance to the ambient domain boundary, obstacle $C^(1 \, alpha)$ bounds, metric $C^1$ bounds and positive definiteness, and the bulk bound, here zero. All are fixed in this application. Arzelà–Ascoli in local graph charts gives subsequential $C^(1 \, beta)$ convergence, $0 < beta < alpha$. The density bounds and the $L^1$ limit identify the limiting sheet with $partial M$. Thus
  $ T_(x_j) partial M_j arrow.r T_x partial M . $
  The incidence set ${ \( M \, x \, T_x partial M \) : M in cal(M)_g \( F \) \, thin x in partial M }$ is therefore compact. Its spatial projection $cal(Z)$ is compact, and the previously proved uniqueness of the plane at each limit point makes $T$ continuous.
  By Proposition 13, the surface measures depend weakly continuously on $M$, so their average defines the finite Borel measure $eta$. Each surface uses the same plane $T \( x \)$ at its points. Integrating this identity proves Equation (3.15). ◻
]

== 4 Charge-preserving preparation of the asymptotic end <en:section>

This section constructs the strict rest exteriors used in the comparison argument. The construction preserves the two closed flux forms, controls the area of every full cut, and relates the resulting energy to the invariant mass of the original end. All constraint densities in this section are geometric densities, as in Definition 1:

$ 2 mu = R_g + tau^2 - \| K \|_g^2 \, #h(2em) J = "div"_g \( K - tau g \) . $

Thus the factors in the ADM fluxes remain $16 pi$ and $8 pi$.

=== 4.1 Flux forms and conformal changes <flux-forms-and-conformal-changes>

Set $X_1 = cal(E)$, $X_2 = cal(B)$, and $alpha_i = iota_(X_i) d V_g$. The divergence constraints say precisely that $d alpha_i = 0$. For any other oriented metric $h$ on $Omega$, the same forms determine fields by $iota_(X_i \( h \)) d V_h = alpha_i$. Their two fluxes through every full cut remain $4 pi Q_E$ and $4 pi Q_B$. This statement uses Stokes’ Theorem in the truncated exterior of the cut, including each portion coincident with $S$.

For $\| Y \|_g lt.eq 1$ define

#[#set math.equation(numbering: n => "(4.1)")
 $ I_g \( Y \) & = \| X_1 \|_g^2 + \| X_2 \|_g^2 + 2 chevron.l X_1 times X_2 \, Y chevron.r_g \,\
D_g \( Y \) & = mu + J \( Y \) - I_g \( Y \) = mu_(upright(m)) + J_(upright(m)) \( Y \) . $ <en:ball-tests>]

The inequality $2 \| X_1 times X_2 \| lt.eq \| X_1 \|^2 + \| X_2 \|^2$ gives $I_g \( Y \) gt.eq 0$, and

$ inf_(\| Y \|_g lt.eq 1) D_g \( Y \) = mu_(upright(m)) - \| J_(upright(m)) \|_g . $

Consequently charged DEC implies total DEC. A constant $S O \( 2 \)$ rotation of $\( alpha_1 \, alpha_2 \)$ preserves both $I_g$ and $D_g$: it preserves the sum of the squared norms and the cross product.

#thm([Lemma 4.1.])[
  (Conformal identities).  #emph[Let $u > 0$, $g' = u^4 g$, $K' = u^2 K$, and retain $alpha_1 \, alpha_2$. Then 
#[#set math.equation(numbering: n => "(4.2)")
 $ u^4 mu' & = mu - 4 u^(- 1) Delta_g u \,\
u^2 J' & = J + 4 K \( nabla log u \, dot.op \) \,\
X_i \( g' \) & = u^(- 6) X_i \( g \) \, #h(2em) I_(g') \( u^(- 2) Y \) = u^(- 8) I_g \( Y \) . $ <en:conformal-constraints>]

 In particular, 
#[#set math.equation(numbering: n => "(4.3)")
 $ u^4 D_(g') \( u^(- 2) Y \) - D_g \( Y \) =  & 4 u^(- 1) { - Delta_g u + K \( nabla u \, Y \) }\
 & + \( 1 - u^(- 4) \) I_g \( Y \) . $ <en:conformal-exact>]

 If $u gt.eq 1$, it follows that 
#[#set math.equation(numbering: n => "(4.4)")
 $ u^4 D_(g') \( u^(- 2) Y \) gt.eq D_g \( Y \) + 4 u^(- 1) \( - Delta_g u - \| K \|_g \| d u \|_g \) . $ <en:conformal-margin>]

 For a fixed oriented surface and either fixed sign $sigma in { - 1 \, 1 }$, write $theta_sigma = H + sigma "tr"_S K$. Then 
#[#set math.equation(numbering: n => "(4.5)")
 $ theta'_sigma = u^(- 2) \( theta_sigma + 4 partial_nu log u \) . $ <en:conformal-expansion>]

]
] <en:conformal>

#proof[
  The scalar-curvature formula in dimension three is $R_(u^4 g) = u^(- 5) \( - 8 Delta_g u + R_g u \)$. Both $tau^2$ and $\| K \|^2$ acquire the factor $u^(- 4)$. This proves the first identity. Write $pi = K - tau g$ and $f = log u$. The transformed trace reversal is $pi' = u^2 pi$. In the divergence of this tensor use
  $ \( nabla'_A - nabla_A \) B = 2 { d f \( A \) B + d f \( B \) A - g \( A \, B \) nabla f } . $
  Contracting the two covariant tensor slots gives $u^2 "div"_(g') \( u^2 pi \) = "div"_g pi + 4 K \( nabla f \, dot.op \)$; the terms containing $tau thin d f$ cancel. This proves the momentum identity. Since $d V_(g') = u^6 d V_g$, fixed flux forms give $X'_i = u^(- 6) X_i$. In an orthonormal frame their components therefore scale by $u^(- 4)$, whereas $u^(- 2) Y$ has the same orthonormal components as $Y$. The electromagnetic identity and Equation (4.3) follow. Its last term is nonnegative for $u gt.eq 1$, and $K \( nabla u \, Y \) gt.eq - \| K \| \| d u \|$ proves Equation (4.4). Finally $H' = u^(- 2) \( H + 4 partial_nu log u \)$ and $"tr"'_S K' = u^(- 2) "tr"_S K$. ◻
]

=== 4.2 ADM flux under a change of asymptotic plane <adm-flux-under-a-change-of-asymptotic-plane>

#thm([Lemma 4.2.])[
  (Asymptotic Lorentz flux).  #emph[Let $G = eta + h$ be a Lorentzian metric on an exterior region containing the spacelike planes under consideration and the portions of their connecting cylinders at large radius. In background inertial coordinates suppose, uniformly on these regions, 
$ h = O_2 \( r^(- q_0) \) \, #h(2em) q_0 > 1 \/ 2 \, #h(2em) "Ein" \( G \) = O \( r^(- 4) \) . $

 Use signature $\( - + + + \)$ and the positive second-form convention $K \( U \, V \) = G \( nabla_U n \, V \)$. If the ADM limits on one plane exist, they exist on every fixed uniformly spacelike plane, and they are the components of the same translation covector $cal(C)$: 
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(C) \( a \) = E a^0 + sum_i P_i a^i . $ <en:translation-covector>]

 In particular, if $E > \| P \|$ and $m = \( E^2 - \| P \|^2 \)^(1 \/ 2)$, the unit future vector $b = \( E \/ m \, - P \/ m \)$ satisfies $cal(C) \( b \) = m$.]
  #emph[The same conclusion applies to a stationary vacuum or electrovacuum end whenever these estimates hold in its stationary coordinates, after a constant linear change making its limiting metric Minkowski. In coordinates adapted to a stationary field with unit timelike limit, suppose the shift has order $O_1 \( r^(- q_0) \)$. Then the energy of a rest plane equals that of the spatial orbit metric. This energy is also unchanged by spatial coordinate changes $y = x + zeta \( x \)$ with $zeta = O_2 \( r^(1 - q_1) \)$, $q_1 > 1 \/ 2$.]
] <en:adm-flux>

#proof[
  Indices in the following calculation are raised with $eta$. Define
  #[#set math.equation(numbering: n => "(4.7)")
   $ cal(F)_(l a b) =  & partial_a h_(l b) - partial_l h_(a b) + eta_(l b) \( partial^d h_(a d) - partial_a "tr"_eta h \)\
 & - eta_(a b) \( partial^d h_(l d) - partial_l "tr"_eta h \) . $ <en:superpotential>]
  It is skew in $l \, a$. Expanding its divergence and collecting the two Hessians, wave operator, and trace terms of the linearized Ricci tensor gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ partial^l cal(F)_(l a b) = 2 "Ein"_(a b)^(upright("lin")) \( h \) = O \( r^(- 2 - 2 q_0) \) + O \( r^(- 4) \) . $ <en:superpotential-divergence>]
  The last estimate follows because the difference between exact and linearized Einstein curvature is bounded by $C \( \| h \| \| partial^2 h \| + \| partial h \|^2 \)$.
  In coordinates adapted to a background plane $x^0 = 0$, direct substitution in Equation (4.7) gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ cal(F)_(i 00) & = partial_j h_(i j) - partial_i h_(j j) \,\
cal(F)_(i 0 k) & = 2 \( K_(i k)^(upright("lin")) - delta_(i k) "tr" K^(upright("lin")) \) + partial_k h_(0 i) - delta_(i k) partial_j h_(0 j) \,\
K_(i k)^(upright("lin")) & = 1 / 2 \( partial_0 h_(i k) - partial_i h_(0 k) - partial_k h_(0 i) \) . $ <en:superpotential-components>]
  Here $j$ is spatial. The last expression for $K^(upright("lin"))$ follows by expanding the future unit normal and its connection; in Gaussian normal coordinates it reduces to $K^(upright("lin")) = 1 / 2 partial_0 h$. For fixed $k$, the extra vector in the middle line has identically zero spatial divergence. Its flux through any exterior coordinate sphere is zero: extend $h_(0 i)$ smoothly across the ball and integrate that identity. The value of the extension cannot affect the flux. The nonlinear errors in $K$ and in its trace reversal are $O \( r^(- 1 - 2 q_0) \)$ and hence have integrated flux $O \( R^(1 - 2 q_0) \)$. Consequently the plane fluxes $integral cal(F)_(i 0 b) n^i thin d A \/ \( 16 pi \)$ equal $\( E \, P_i \)$.
  For a fixed translation vector $a$, regard $1 / 2 cal(F)_(l a b) a^b d x^l and d x^a$ as a two-form and take its background Lorentzian Hodge dual. With orientation $d x^0 and d x^1 and d x^2 and d x^3$, its integral on an outward plane sphere is the flux just computed, with the common orientation chosen to give positive Schwarzschild energy. Equation (4.8) bounds its exterior derivative. Two large plane sections can be joined along a cylinder in $r asymp R$ with absolute three-dimensional coordinate volume $O \( R^3 \)$. Stokes’ Theorem bounds the difference of the integrals by
  $ C \( R^(1 - 2 q_0) + R^(- 1) \) arrow.r 0 . $
  Replacing the sections by spheres or uniformly comparable ellipsoids in their planes has the same estimate, using the intervening annular three-region. The limiting flux is thus independent of the plane for fixed $a$. Tensor covariance under constant Lorentz changes proves Equation (4.6), including the plus sign of its spatial components. Substitution of $b = \( E \/ m \, - P \/ m \)$ gives $m$.
  For the last assertions, write the stationary metric in a rest coordinate system as
  $ G = gamma_(i j) d y^i d y^j + 2 beta_i d y^i d t - W d t^2 \, #h(2em) W arrow.r 1 \, quad beta = O_1 \( r^(- q_0) \) . $
  The orbit metric is $h_s = gamma + W^(- 1) beta ⊗ beta$, so $h_s - gamma = O_1 \( r^(- 2 q_0) \)$. Its extra ADM flux is $O \( R^(1 - 2 q_0) \)$ and vanishes. Finally let $gamma = delta + k$ with $k = O_2 \( r^(- q_0) \)$, and express its pullback under $y = x + zeta \( x \)$. Taylor expansion with one derivative gives
  $ gamma_(upright("new")) = delta + k + 2 "sym" D zeta + cal(R) \, #h(2em) cal(R) = O_1 \( r^(- 2 q_1) + r^(- q_0 - q_1) \) . $
  The linear ADM integrand of $2 "sym" D zeta$ is $Delta zeta_i - partial_i "div" zeta = partial_j \( partial_j zeta_i - partial_i zeta_j \)$. Its flux is zero by a smooth interior extension and skew symmetry. The remainder flux is $O \( R^(1 - 2 q_1) + R^(1 - q_0 - q_1) \) arrow.r 0$. This proves coordinate invariance in the precise class used here. A change of stationary time coordinate changes the threading one-form but leaves $h_s$ itself unchanged. ◻
]

=== 4.3 A strict conformal direction and the timelike endpoint <a-strict-conformal-direction-and-the-timelike-endpoint>

#thm([Lemma 4.3.])[
  (Strict conformal direction).  #emph[Suppose $g - delta = O_2 \( r^(- q) \)$ and $K = O_1 \( r^(- 1 - q) \)$, $q > 1 \/ 2$, on the single end. Fix $0 < delta_0 < min \( q \, 1 \)$. There are smooth functions $b gt.eq \| K \|_g$, $a > 0$, $w > 0$, and $phi.alt > 0$ such that 
#[#set math.equation(numbering: n => "(4.10)")
 $ - Delta_g phi.alt = b sqrt(\| d phi.alt \|_g^2 + a^2) + w \, #h(2em) partial_nu phi.alt = - 1 quad upright("on ") S \,\
phi.alt = O_2 \( r^(- 1) \) \, #h(2em) b = C r^(- 1 - q) \, quad a = r^(- 2) \, quad w = r^(- 3 - delta_0) quad upright("far out") . $ <en:strict-pde>]

 The gradient flux of $phi.alt$ has a finite limit at infinity. In particular $u = 1 + s phi.alt$, $s > 0$, preserves charged DEC and makes it strict, with margin at least $c_s r^(- 3 - delta_0)$ on the tail, and makes every weak fixed-sign boundary expansion strictly negative.]
  #emph[If $K$ is compactly supported and $g - delta = O_ell \( r^(- 1) \)$ for every $ell$, one may choose $b$ compactly supported. In that case $- Delta_g phi.alt = w$ on the tail and $phi.alt = O_ell \( r^(- 1) \)$ for every $ell$. If also $R_g = O_ell \( r^(- 4) \)$, then $R_(\( 1 + s phi.alt \)^4 g) = O_ell \( r^(- 3 - delta_0) \)$ for every $ell$.]
] <en:strictification>

#proof[
  Choose smooth majorants and positive interpolations with the stated tails; the bound on $K$ permits a constant radial majorant $C r^(- 1 - q)$ outside a compact set. When $K$ is compactly supported, choose $b$ with compact support instead. On $Omega_L = { r lt.eq L }$, including the compact core, impose the additional boundary condition $phi.alt = 0$ at $r = L$. Continue from $t = 0$ to $t = 1$ in
  $ - Delta_g phi.alt = t b sqrt(\| d phi.alt \|_g^2 + a^2) + w \, #h(2em) partial_nu phi.alt = - 1 \, quad phi.alt \|_(r = L) = 0 . $
  The linearization has principal part $- Delta_g$ and drift $- t b nabla phi.alt \/ sqrt(\| d phi.alt \|^2 + a^2)$ of norm at most $b$. The inner Neumann and outer Dirichlet boundaries are disjoint smooth components. The homogeneous mixed problem has zero kernel: a nonconstant positive maximum or negative minimum is excluded by the strong maximum principle and the boundary point lemma, and a constant is excluded by the Dirichlet condition. The mixed elliptic Fredholm index is zero, by continuation from the mixed Laplacian, so the linearization is invertible.
  Here are bounds closing this continuation. On a fixed $Omega_L$, mixed $W^(2 \, p)$ estimates, $p > 3$, and $sqrt(\| d phi.alt \|^2 + a^2) lt.eq \| d phi.alt \| + a$ give
  $ parallel phi.alt parallel_(W^(2 \, p)) lt.eq C_L \( 1 + parallel d phi.alt parallel_(L^p) + parallel phi.alt parallel_(L^p) \) lt.eq 1 / 2 parallel phi.alt parallel_(W^(2 \, p)) + C'_L \( 1 + parallel phi.alt parallel_(L^p) \) . $
  The second inequality is gradient interpolation, with its small parameter chosen after $C_L$. If the supremum norms were unbounded, divide a sequence by its supremum norm. Compactness in $C^1$ gives a function of supremum one solving $- Delta z = t b \| d z \|$, with zero mixed boundary data. This is a homogeneous equation with bounded drift, by taking the drift to be $t b nabla z \/ \| d z \|$ where $d z eq.not 0$ and zero elsewhere. The same maximum principles give a contradiction. The resulting $W^(2 \, p)$ bounds, followed by elliptic regularity, close the continuation. The solution is nonnegative: an interior negative minimum contradicts $- Delta phi.alt > 0$, and a negative minimum at $S$ contradicts the boundary point lemma, since the outward domain derivative is $- partial_nu phi.alt = 1$.
  The bounds can be made independent of $L$ on each compact subset. To see this without a bounded-domain constant depending on $L$, put $f \( r \) = r^(- 1) \( 1 - r^(- delta_0) \)$ on a sufficiently distant tail. Direct differentiation gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ - Delta_g f - \| K \|_g \| d f \|_g = delta_0 \( 1 + delta_0 \) r^(- 3 - delta_0) + O \( r^(- 3 - q) \) . $ <en:tail-barrier>]
  The same estimate holds with $b$ in place of $\| K \|$. Since $b a = O \( r^(- 3 - q) \)$ and $delta_0 < q$, a sufficiently large multiple $A f$ satisfies $- Delta_g \( A f \) gt.eq b sqrt(\| d \( A f \) \|^2 + a^2) + w$. Comparison on the exterior annulus, choosing its inner boundary value to dominate $phi.alt$, gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ 0 lt.eq phi.alt lt.eq C \( 1 + sup_(Omega_(L_(*))) phi.alt \) r^(- 1) quad \( r gt.eq L_(*) \) \, $ <en:exhaustion-tail>]
  with fixed $L_(*)$. If the core supremum diverged along an exhaustion, normalize by it and apply the preceding local estimates, including the inner boundary estimates. A subsequence converges locally in $C^1$ to a nonzero nonnegative solution of $- Delta z = b \| d z \|$, with $partial_nu z = 0$ and $z = O \( r^(- 1) \)$. The tail estimate forces its positive maximum to occur in a compact set; the strong and boundary maximum principles again exclude it. Thus exhaustion gives a positive smooth solution of Equation (4.10).
  Rescale each exterior annulus to unit size. The metric has uniformly bounded $C^2$ coefficients, the scaled drift has norm $O \( r^(- q) \)$, and the already proved bound is $phi.alt = O \( r^(- 1) \)$. Interior $W^(2 \, p)$ estimates and then Schauder estimates give $d phi.alt = O \( r^(- 2) \)$, $d^2 phi.alt = O \( r^(- 3) \)$. In the compact-$b$ case the equation is the linear Poisson equation on a smooth symbol end; differentiating its rescaled form gives the estimates at every order. Its right side is integrable in either case. The divergence theorem therefore gives a finite limit of $integral_(r = L) partial_(nu_L) phi.alt thin d A_g$. Its difference from the Euclidean gradient flux is $O \( L^(- q) \)$, so that limit also exists. For $u = 1 + s phi.alt$, $- Delta u - \| K \| \| d u \| gt.eq s w$. Apply Equations (4.4) and (4.5). The scalar-curvature conclusion follows from its conformal formula. The energy increment is finite and tends to zero with $s$, because its ADM flux contribution is $- \( s \/ 2 pi \) lim integral partial_(nu_L) phi.alt thin d A_g$. ◻
]

#thm([Lemma 4.4.])[
  (Reduction of the non-timelike endpoint).  #emph[Suppose the numerical conclusion of Theorem 3 has been proved for all data in its class satisfying $E > \| P \|$. Then every datum in the full class satisfies $E > \| P \|$, and the numerical conclusion holds for the full class.]
] <en:timelike-reduction>

#proof[
  Choose $0 < delta_0 < min \( q \, 1 \)$ and $f$ as in Equation (4.11). Far enough out $f' < 0$ and $- Delta_g f - \| K \| \| d f \| gt.eq 0$. Let $chi \( r \)$ be a smooth nondecreasing cutoff from zero to one supported in this valid range. Define
  $ phi.alt \( r \) = integral_r^oo chi \( t \) \( - f' \( t \) \) thin d t $
  there, and extend it constantly over the compact core. It is bounded, positive, smooth, and equals $f$ far out. The radial differentiation formula shows
  $ - Delta_g phi.alt - \| K \| \| d phi.alt \| = chi \( - Delta_g f - \| K \| \| d f \| \) - chi' f' \| d r \|_g^2 gt.eq 0 . $
  For each $s gt.eq 0$ set $u_s = 1 + s phi.alt$ and use $\( u_s^4 g \, u_s^2 K \)$ with the original forms. Charged DEC and all boundary signs persist. Completeness persists, since $u_s gt.eq 1$, and the full-cut infimum can only increase. The data still have decay exponent greater than $1 \/ 2$. The new constraint terms have orders $r^(- 3 - delta_0)$ and $r^(- 3 - q)$, so their absolute integrability follows from that of the old sources and Equation (4.2).
  The asymptotic expansion $u_s = 1 + s \/ r + o_2 \( r^(- 1) \)$ gives, directly in the original chart,
  #[#set math.equation(numbering: n => "(4.13)")
   $ E_s = E + 2 s \, #h(2em) P_s = P \, #h(2em) Q_(E \, s) = Q_E \, #h(2em) Q_(B \, s) = Q_B . $ <en:energy-raising>]
  Indeed the leading new metric term is $4 s delta_(i j) \/ r$ and its energy flux is $32 pi s$; the factor $1 \/ \( 16 pi \)$ yields $2 s$. The trace reversal is multiplied by $u_s^2$, whose additional momentum flux is $O \( r^(- q) \)$ and tends to zero.
  The assumed timelike numerical conclusion implies $r_(A \, s) lt.eq 2 sqrt(\( E + 2 s \)^2 - \| P \|^2)$. By Proposition 8, $A_(min \, g) \( S \) > 0$, while $r_(A \, s) gt.eq sqrt(A_(min \, g) \( S \) \/ \( 4 pi \))$. If $E lt.eq \| P \|$, take $s arrow.b \( \| P \| - E \) \/ 2$ from above. The right side tends to zero and contradicts this fixed positive lower bound. Thus $E > \| P \|$. Applying the assumed timelike result to the original data finishes the proof. No common limiting boost is used. ◻
]

=== 4.4 Compact corrections for the linearized constraints <compact-corrections-for-the-linearized-constraints>

On Euclidean three-space write

$ \( cal(L) H \) = partial_i partial_j \( H_(i j) - "tr" H thin delta_(i j) \) \, #h(2em) \( cal(D) k \)_i = partial_j \( k_(i j) - "tr" k thin delta_(i j) \) . $

The formal adjoint kernels are respectively the affine functions and the Euclidean Killing fields. For the scalar operator this follows from $partial_i partial_j p - \( Delta p \) delta_(i j) = 0$: taking the trace gives $Delta p = 0$, then its Hessian vanishes. For momentum, the adjoint equation is equivalent to the Euclidean Killing equation after taking its trace. Thus the momentum tests are translations and rotations, with no dilation test.

#thm([Lemma 4.5.])[
  (Supported linear inverses).  #emph[Fix a compact subannulus of ${ 1 < \| z \| < 4 }$. A smooth scalar source $f$ supported there has a compactly supported symmetric solution $H$ of $cal(L) H = f$ if its affine moments vanish. A smooth vector source $V$ has a compactly supported symmetric solution $k$ of $cal(D) k = V$ if its Killing moments vanish. The solutions can be supported in a fixed larger compact subannulus, and, for each integer $ell gt.eq 0$ and $1 < p < oo$, 
#[#set math.equation(numbering: n => "(4.14)")
 $ parallel H parallel_(W^(ell + 2 \, p)) lt.eq C parallel f parallel_(W^(ell \, p)) \, #h(2em) parallel k parallel_(W^(ell + 1 \, p)) lt.eq C parallel V parallel_(W^(ell \, p)) . $ <en:inverse-estimates>]

]
] <en:compact-inverses>

#proof[
  We first specify the ordinary divergence inverse used in the proof. For a mean-zero smooth compactly supported source in a ball, the support-preserving Bogovskiı̆ operator gives a smooth compactly supported vector field, with divergence equal to the source and a gain of one derivative in $W^(ell \, p)$. The regularized integral operators and their support and Sobolev mapping properties are given in #cite(label("CostabelMcIntosh2010")) Theorems 3.2 and 4.9, Corollary 4.11. To use balls on the annulus, cover the prescribed source support by finitely many balls whose closures lie inside the annulus and join them by a finite connected family of such balls. Split a source by a partition of unity. Along a spanning tree of overlapping balls transfer the integral of each leaf piece to its parent using a fixed unit-integral bump in the overlap. Removing leaves successively leaves each piece with integral zero, since the total integral is zero. Applying the ball operators and adding the results gives a divergence inverse with fixed compact support. The finite cutoffs and bumps preserve all the stated Sobolev estimates. Use successively larger fixed compact supports for successive applications below.
  For a scalar $f$ with zero affine moments solve $partial_i V_i = f$. Compact support and integration by parts imply $integral V_i = - integral z_i f = 0$. Solve $partial_j B_(i j) = V_i$ componentwise. Then the symmetric part $P = \( B + B^(sans(T)) \) \/ 2$ satisfies $partial_i partial_j P_(i j) = f$. In dimension three the inverse of trace reversal is
  $ H = P - 1 / 2 "tr" P thin delta \, #h(2em) H - "tr" H thin delta = P . $
  This gives the scalar solution and gains two derivatives.
  For momentum, zero translation moments permit a componentwise solve $partial_j B_(i j) = V_i$. Put $S_(i j) = \( B_(i j) - B_(j i) \) \/ 2$. The rotation moments give
  $ 0 = integral \( z_i V_j - z_j V_i \) = 2 integral S_(i j) . $
  Solve $partial_k D_(i j k) = - S_(i j)$, choosing $D$ skew in $i \, j$, and define
  $ C_(i j k) = D_(i j k) - D_(i k j) - D_(j k i) . $
  Directly using that skew symmetry gives $C_(i j k) = - C_(i k j)$ and $\( C_(i j k) - C_(j i k) \) \/ 2 = D_(i j k)$. It follows that $P_(i j) = B_(i j) + partial_k C_(i j k)$ is symmetric and $partial_j P_(i j) = V_i$. Set $k = P - 1 / 2 "tr" P thin delta$. There is one net derivative of gain: the second divergence solve gains a derivative and the displayed correction differentiates it once. All supports remain compact in the prescribed larger subannulus. Integration against the adjoint kernels also proves the necessity of the stated moment conditions. ◻
]

#thm([Lemma 4.6.])[
  (Weak-end annular replacement).  #emph[Let $\( g \, K \)$ have the weak end bounds of Definition 1, integrable geometric constraint densities, and total DEC. Let $\( g_(*) \, K_(*) \)$ be smooth vacuum reference data on that end with $g_(*) - delta = O_ell \( r^(- 1) \)$, $K_(*) = O_ell \( r^(- 2) \)$ at every order, and the same ADM energy and momentum. For arbitrarily large $R$ there are smooth data $\( hat(g)_R \, hat(K)_R \)$ equal to the original data on $r lt.eq R$ and to the reference on $r gt.eq 4 R$, such that on the intermediate annulus 
#[#set math.equation(numbering: n => "(4.15)")
 $ hat(mu)_R - \| hat(J)_R \|_(hat(g)_R) gt.eq - eta_R R^(- 3) \, #h(2em) eta_R arrow.r 0 . $ <en:annular-deficit>]

 For every fixed $1 \/ 2 < beta < min \( q \, 1 \)$ the scaled perturbations from Euclidean data are $O \( R^(- beta) \)$ in $C^2 times C^1$.]
] <en:annular-replacement>

#proof[
  Use $z = x \/ R$ on $A = { 1 < \| z \| < 4 }$ and regard the scaled fields as $g \( R z \)$ and $R K \( R z \)$. The constraints scale by $R^2$. Write $H = g \( R z \) - g_(*) \( R z \)$ and $k = R \( K \( R z \) - K_(*) \( R z \) \)$. These have $C^2 times C^1$ norm $O \( R^(- beta) \)$. If $lambda$ equals one near the inner boundary, zero near the outer boundary, and takes values in $\[ 0 \, 1 \]$, blend the metric and second form using $lambda$. The linearized constraint error beyond the blend of the two linear sources is
  $ f_R = \[ cal(L) \, lambda \] H \, #h(2em) V_R = \[ cal(D) \, lambda \] k . $
  If $P \( H \) = H - "tr" H thin delta$, the scalar commutator is
  #[#set math.equation(numbering: n => "(4.16)")
   $ f_R = \( partial_i partial_j lambda \) P \( H \)_(i j) + 2 \( partial_i lambda \) partial_j P \( H \)_(i j) \, #h(2em) \( V_R \)_i = \( partial_j lambda \) P \( k \)_(i j) . $ <en:commutator-orders>]
  Thus $parallel f_R parallel_(W^(1 \, p)) + parallel V_R parallel_(W^(1 \, p)) = O \( R^(- beta) \)$ for every fixed finite $p$. Only the second derivatives of the original metric and first derivatives of its second form are used.
  We next estimate all adjoint-kernel moments. Put $h = g - g_(*)$, $kappa = K - K_(*)$ in the physical $x$ coordinates, and $s = cal(L)_x h$, $V = cal(D)_x kappa$. They belong to $L^1$. In fact the scalar linear source for either datum equals its $2 mu$ plus an error bounded by
  $ C #scale(x: 120%, y: 120%)[\(] \| g - delta \| \| partial^2 g \| + \| partial g \|^2 + \| K \|^2 #scale(x: 120%, y: 120%)[\)] \, $
  and the momentum linear source equals $J$ plus an error bounded by
  $ C #scale(x: 120%, y: 120%)[\(] \| g - delta \| \| partial K \| + \| partial g \| \| K \| #scale(x: 120%, y: 120%)[\)] . $
  These errors are $O \( r^(- 2 - 2 q) \)$ for the original data and $O \( r^(- 4) \)$ for the reference. They are integrable because $q > 1 \/ 2$. For any integrable source $F$ on the end,
  #[#set math.equation(numbering: n => "(4.17)")
   $ integral_(r lt.eq 4 R) r \| F \| thin d x = o \( R \) . $ <en:sublinear-moment>]
  Indeed splitting at a fixed $M$ and dividing by $R$ bounds the outer contribution by $4 integral_(r > M) \| F \|$, while the inner contribution tends to zero; then let $M arrow.r oo$.
  For an affine scalar $p$ define its linear constraint boundary flux
  $ B_p \( t \; h \) = integral_(r = t) { p thin partial_j P \( h \)_(i j) - \( partial_j p \) P \( h \)_(i j) } n^i thin d A . $
  For a Euclidean Killing field $Z$, define $B_Z \( t \; kappa \) = integral_(r = t) P \( kappa \)_(i j) Z_i n^j thin d A$. Integration by parts gives, for either type of test, the difference of the two boundary fluxes as the integral of the test times the linear source; the adjoint-kernel term is zero. For $p = 1$ and constant $Z$, the boundary flux differences tend to zero as $t arrow.r oo$, since the two ADM vectors agree. For momentum the difference between Euclidean and geometric trace reversal has integrated error $O \( t^(1 - 2 q) \) + O \( t^(- 1) \) arrow.r 0$. For homogeneous linear $p$ or rotational $Z$, integration from a fixed sphere and Equation (4.17) instead give
  #[#set math.equation(numbering: n => "(4.18)")
   $ B_p \( t \; h \) = o \( t \) \, #h(2em) B_Z \( t \; kappa \) = o \( t \) . $ <en:first-moment-flux>]
  No limit for these first-moment fluxes is required.
  For clarity, the scaling factors in the commutator moments are as follows. A constant test gives
  $ integral_A f_R thin d z = - R^(- 1) {B_1 \( R \; h \) + integral_(R < r < 4 R) lambda \( x \/ R \) s \( x \) thin d x} = o \( R^(- 1) \) . $
  A homogeneous linear test $p \( z \)$ gives
  $ integral_A p \( z \) f_R \( z \) thin d z = - R^(- 2) {B_(p \( x \)) \( R \; h \) + integral_(R < r < 4 R) lambda \( x \/ R \) p \( x \) s \( x \) thin d x} = o \( R^(- 1) \) . $
  For momentum the identical calculation uses $R kappa \( R z \)$; translation tests have factor $R^(- 1)$, rotation tests factor $R^(- 2)$. Equations (4.17) and (4.18) therefore give
  #[#set math.equation(numbering: n => "(4.19)")
   $ integral_A p f_R = o \( R^(- 1) \) \, #h(2em) integral_A Z dot.op V_R = o \( R^(- 1) \) $ <en:small-cokernel>]
  for every fixed affine $p$ and every fixed Killing field $Z$.
  Choose a fixed nonnegative bump $chi$ supported in the annulus and positive on a ball. The Gram matrix of the affine basis with weight $chi$ is positive definite. Subtract the linear combination of the smooth functions $chi p$ having the same affine moments as $f_R$. Likewise use the Gram matrix of the Killing-field basis and the vector bumps $chi Z$ for $V_R$. Equation (4.19) says that the coefficients of all these bumps are $o \( R^(- 1) \)$. Their norms of every fixed order therefore have this size. The remaining sources have zero moments and $W^(1 \, p)$ norm $O \( R^(- beta) \)$. Apply Lemma 20 with the negative signs to cancel them. The resulting compact corrections have norms
  $ parallel H_R^(upright(c)) parallel_(W^(3 \, p)) + parallel k_R^(upright(c)) parallel_(W^(2 \, p)) = O \( R^(- beta) \) . $
  Taking $p > 3$ controls their $C^2 times C^1$ norms and ensures positivity of the corrected metric for large $R$.
  The nonlinear constraint map about $\( delta \, 0 \)$ has quadratic remainder bounded in $C^0$ by $C R^(- 2 beta)$ on these scaled data. Its sources consequently differ from the convex blend of the original and vacuum sources by $o \( R^(- 1) \) + O \( R^(- 2 beta) \)$ in $C^0$. The original scaled momentum is $O \( R^(- beta) \)$; changing its norm from the original metric to the corrected metric costs only $O \( R^(- 2 beta) \)$. Convexity of the cone ${ \( mu \, J \) : mu gt.eq \| J \| }$ therefore proves a scaled DEC deficit of size $o \( R^(- 1) \) + O \( R^(- 2 beta) \) = o \( R^(- 1) \)$. Undoing the scaling multiplies sources by $R^(- 2)$ and gives Equation (4.15). All corrections are supported away from the two annular boundaries, so the asserted exact matching and smoothness follow. ◻
]

=== 4.5 The strict rest exterior <the-strict-rest-exterior>

#thm([Proposition 4.7.])[
  (Rest preparation).  #emph[Let the data satisfy Definition 1 and $E > \| P \|$. Assume $theta_(+) \( S \) lt.eq 0$ on every boundary component. More generally, one may prescribe a fixed sign $sigma in { - 1 \, 1 }$ on each component and assume $H + sigma "tr"_S K lt.eq 0$ there. Set $m = sqrt(E^2 - \| P \|^2)$. There are smooth data $\( g_j \, K_j \, cal(E)_j \, cal(B)_j \)$ on the same oriented exterior $Omega$, with the same closed forms $alpha_1 \, alpha_2$, having the following properties.]
  + #emph[Both charges are exactly $Q_E \, Q_B$. Charged DEC is strict everywhere; for some $c_j > 0$ and a fixed $0 < delta_0 < 1$, 
$ inf_(\| Y \|_(g_j) lt.eq 1) D_(g_j) \( Y \) gt.eq c_j r_y^(- 3 - delta_0) quad upright("on the far end") . $

 Every boundary component has strictly negative future expansion, or strictly negative prescribed expansion $H + sigma "tr"_S K$ in the fixed-sign variant.]
  + #emph[In a rest chart $y$, $g_j - delta = O_ell \( r_y^(- 1) \)$ and $R_(g_j) = O_ell \( r_y^(- 3 - delta_0) \)$ for every $ell$. The tensor $K_j$ is compactly supported, and the two flux forms have components $O_1 \( r_y^(- 2) \)$. The constraint densities are integrable and the metric is complete with $S$ included.]
  + #emph[The rest ADM momentum is zero and its energy satisfies $E_j arrow.r m$. The fields and tensors converge to the original data smoothly on every compact subset of $Omega$.]
  + #emph[There are $epsilon.alt_j arrow.b 0$ such that $g_j gt.eq \( 1 - epsilon.alt_j \) g$ on all of $Omega$, and 
#[#set math.equation(numbering: n => "(4.20)")
 $ A_(min \, g_j) \( S \) arrow.r A_(min \, g) \( S \) . $ <en:area-convergence>]

]
  #emph[No uniform bound on the compact geometry of this sequence is asserted or needed. Each prepared datum is fixed before the subsequent elliptic comparison parameters are chosen.]
] <en:rest-preparation>

#proof[
  #emph[The reference plane.] Since $m > 0$, use the exterior Schwarzschild metric
  #[#set math.equation(numbering: n => "(4.21)")
   $ G_(*) = - (frac(1 - m \/ \( 2 r_y \), 1 + m \/ \( 2 r_y \)))^2 d T^2 + \( 1 + m \/ \( 2 r_y \) \)^4 \| d y \|^2 $ <en:schwarzschild-reference>]
  at sufficiently large radius. Set $v = P \/ E$, so $\| v \| < 1$, and $A = \( I - v v^(sans(T)) \)^(- 1 \/ 2)$. Parametrize the plane $T = v dot.op y$ by $y = A x$. Its induced background Minkowski metric is exactly $\| d x \|^2$. The unit normal and an adapted spatial frame are related to the horizontal ones by the Lorentz boost with velocity $v$. By Lemma 17, the plane data have
  $ \( E_(*) \, P_(*) \) = \( gamma m \, gamma m v \) = \( E \, P \) \, #h(2em) gamma = \( 1 - \| v \|^2 \)^(- 1 \/ 2) . $
  They are vacuum, with $g_(*) - delta = O_ell \( r_x^(- 1) \)$ and $K_(*) = O_ell \( r_x^(- 2) \)$ at every order. Identify their $x$ coordinates with the original end coordinates and apply Lemma 21.
  #emph[Bending the reference end.] Beyond $r_x = 4 R$ replace the plane by the graph
  #[#set math.equation(numbering: n => "(4.22)")
   $ T \( y \) = \( v dot.op y \) psi (frac(log \( r_y \/ R_b \), L)) \, $ <en:bend-height>]
  where $psi$ is smooth, is one on $\( - oo \, 0 \]$, is zero on $\[ 1 \, oo \)$, and has values in $\[ 0 \, 1 \]$. Choose $L$ sufficiently large that $\| v \| \( 1 + parallel psi' parallel_oo \/ L \) < 1$; then choose $R_b$ to be a sufficiently large fixed multiple of $R$. The bend starts in the exact reference portion. Its background gradient has norm at most the preceding strict bound, so it is uniformly spacelike in $G_(*)$ once $R$ is large. It becomes a horizontal Schwarzschild slice for $r_y gt.eq R_b e^L$. Denote the resulting data before conformal repair by $\( g_R \, K_R \)$.
  For fixed $L$, the graph has $\| d T \| lt.eq c < 1$, $\| d^2 T \| lt.eq C \/ r_y$, and derivatives of the background Schwarzschild coefficients are $O \( r_y^(- 2) \)$. The graph formulas thus give uniform comparability of $g_R$ with $delta_y$, $\| partial g_R \| lt.eq C \/ r_y$, and $\| K_R \| lt.eq C \/ r_y$ throughout the bend. The annular corrections have stronger corresponding bounds. It follows that, throughout these large-radius ranges,
  #[#set math.equation(numbering: n => "(4.23)")
   $ c lt.eq \| d r_y \|_(g_R) lt.eq C \, #h(2em) \| Delta_(g_R) r_y \| lt.eq C \/ r_y \, #h(2em) \| K_R \|_(g_R) lt.eq C \/ r_y . $ <en:radial-bounds>]
  Here and below constants may depend on $L$ and $v$, but not on $R$.
  Retain the original forms on the same manifold during the replacement and bend. Since $y = A x$ is fixed and all these metrics are uniformly comparable, their norms are $O \( r_y^(- 2) \)$ and their electromagnetic ball term is $O \( r_y^(- 4) \)$. The bend is vacuum for the total constraints. Thus Lemma 21, together with $I_(g_R) \( Y \) = O \( r_y^(- 4) \)$, implies the following estimate for the charged deficit. With $xi = r_y \/ R$ there are fixed $0 < a < xi_0 < b$ such that the data are original for $xi lt.eq xi_0$ and horizontal Schwarzschild for $xi gt.eq b$, and
  #[#set math.equation(numbering: n => "(4.24)")
   $ (- inf_(\| Y \|_(g_R) lt.eq 1) D_(g_R) \( Y \))_(+) lt.eq cases(delim: "{", 0 \, & xi lt.eq xi_0 \,, eta_R R^(- 3) \, & xi_0 lt.eq xi lt.eq b \,, C r_y^(- 4) \, & xi gt.eq b \,) #h(2em) eta_R arrow.r 0 . $ <en:charged-deficit>]
  The constant radial formulas used next are extended across the core.
  #emph[Repair of the charged deficit.] Choose a smooth $omega gt.eq 0$ vanishing near $a$ and at least one on $\[ xi_0 \, b + 1 \]$. On $\[ a \, b + 1 \]$ solve
  $ z'_R = C_0 z_R + omega \, #h(2em) z_R \( a \) = 0 \, $
  and put $z_R = 0$ below $a$. The constant $C_0$ will be chosen large using Equation (4.23). On the horizontal tail let
  $ A_R \( t \) = \( t + m \/ \( 2 R \) \)^2 z_R \( t \) . $
  Starting at $b$, smoothly continue its derivative to $t^(- 2)$ over $\[ b \, b + 1 \]$, using a convex interpolation of the positive derivative already prescribed and $t^(- 2)$. Thus
  #[#set math.equation(numbering: n => "(4.25)")
   $ A'_R \( t \) gt.eq c t^(- 2) quad \( t gt.eq b \) \, #h(2em) A'_R \( t \) = t^(- 2) quad upright("eventually") . $ <en:repair-tail>]
  The quantities $A_R \( oo \)$ and $F_R \( xi \) = integral_xi^oo z_R \( t \) thin d t$ are uniformly bounded for fixed $L$. Define
  $ u_R = 1 + e_R / R F_R \( r_y \/ R \) \, #h(2em) e_R > 0 . $
  It is smooth, at least one, and constant on the compact region $r_y lt.eq a R$. Direct differentiation, with $F'_R = - z_R$, gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ - Delta_(g_R) u_R - \| K_R \| \| d u_R \| = e_R / R^3 #scale(x: 120%, y: 120%)[\(] & z'_R \| d r_y \|_(g_R)^2 + R z_R Delta_(g_R) r_y\
 & - R \| K_R \| z_R \| d r_y \|_(g_R) #scale(x: 120%, y: 120%)[\)] . $ <en:repair-radial-calculation>]
  On $\[ a \, b \]$ this is at least $e_R R^(- 3) \( c z'_R - C z_R \)$. Choose $C_0$ sufficiently large to make it nonnegative everywhere there and at least $c' e_R R^(- 3)$ on $\[ xi_0 \, b \]$. On the horizontal tail $K_R = 0$. Writing $w_(*) = 1 + m \/ \( 2 r_y \)$, the radial conformal Laplacian formula is $Delta_(w_(*)^4 delta) u = w_(*)^(- 6) r_y^(- 2) partial_(r_y) \( r_y^2 w_(*)^2 partial_(r_y) u \)$. It yields the exact identity
  #[#set math.equation(numbering: n => "(4.27)")
   $ - Delta_(g_R) u_R = e_R R^(- 3) \( 1 + m \/ \( 2 R xi \) \)^(- 6) xi^(- 2) A'_R \( xi \) gt.eq c'' e_R R^(- 3) xi^(- 4) . $ <en:repair-schwarzschild>]
  Choose $e_R arrow.r 0$ with $e_R \/ \( eta_R + R^(- 1) \) arrow.r oo$. For fixed $L$, Equations (4.24), (4.26), and (4.27), followed by Equation (4.4), show that $\( g_0 \, K_0 \) = \( u_R^4 g_R \, u_R^2 K_R \)$ satisfies charged DEC. All boundary signs persist, since $u_R$ is constant near $S$.
  By Equation (4.25),
  $ u_R = 1 + frac(e_R A_R \( oo \), r_y) + O_ell \( r_y^(- 2) \) quad upright("for every ") ell $
  for each fixed $R \, L$. Its ADM energy and momentum are therefore
  #[#set math.equation(numbering: n => "(4.28)")
   $ E_0 = m + 2 e_R A_R \( oo \) \, #h(2em) P_0 = 0 . $ <en:repaired-mass>]
  The second form is compactly supported and the scalar curvature has $O_ell \( r_y^(- 4) \)$ decay on the tail. Both assertions follow from the exact horizontal form and Equation (4.27).
  #emph[Strictification and the limiting comparisons.] Fix this repaired exterior and apply the compact-$K$ part of Lemma 18, with a fixed $0 < delta_0 < 1$. A further conformal change by $1 + s phi.alt$, $s > 0$, gives the strict inequalities and every stated decay and integrability property. Its energy tends to $E_0$ as $s arrow.b 0$, its momentum remains zero, and it can be made arbitrarily small in any prescribed finite collection of compact smooth norms.
  It remains to check the area comparison, including cuts that escape into the bend. On the Schwarzschild graph, the spatial Schwarzschild metric dominates $\| d y \|^2$ and its lapse squared is at most one. Moreover Equation (4.22) gives
  $ d T = psi \( v dot.op d y \) + \( v dot.op y \) psi' frac(d r_y, L r_y) . $
  Since $0 lt.eq psi lt.eq 1$, the tensor square of this expression is bounded above by $\( v dot.op d y \)^2 + C L^(- 1) \| d y \|^2$. Consequently, on the plane and bend,
  #[#set math.equation(numbering: n => "(4.29)")
   $ g_R gt.eq \| d y \|^2 - d T^2 gt.eq \| d y \|^2 - \( v dot.op d y \)^2 - C L^(- 1) \| d y \|^2 gt.eq \( 1 - C' L^(- 1) \) \| d x \|^2 . $ <en:bend-metric-domination>]
  On the replacement annulus $g_R = delta_x + O \( R^(- beta) \)$, while the original metric has $g = delta_x + O \( R^(- q) \)$ throughout the distant end. Inside the replacement radius the metrics agree. Both conformal changes increase the metric. Therefore the final metric has a global lower bound $g_(R \, L \, s) gt.eq \( 1 - C' \/ L - o_R \( 1 \) \) g$.
  Choose $L_j arrow.r oo$ first. For each $L_j$ choose $R_j$ so large that all the preceding constructions apply, their error bounds are at most $1 \/ j$, and the energy increment in Equation (4.28) is at most $1 \/ j$. The choices are possible because for fixed $L$ the repair constants and $A_R \( oo \)$ are bounded independently of $R$. Then choose $s_j > 0$ small enough that the strictification energy increment and the errors in the first $j$ compact smooth seminorms are at most $1 \/ j$. The replacement and bend move to infinity; $u_R arrow.r 1$ uniformly and is constant on every fixed compact set eventually. Thus $g_j \, K_j$ converge locally smoothly to $g \, K$. The field convergence follows from the unchanged forms and the smooth convergence of the volume forms. This proves the energy, momentum, and local convergence assertions. The global lower metric bound proves completeness and gives, for every full cut $Gamma$,
  $ "Area"_(g_j) \( Gamma \) gt.eq \( 1 - epsilon.alt_j \) "Area"_g \( Gamma \) . $
  Taking infima yields the required lower limit for the areas. For the upper limit choose, for any $eta > 0$, a fixed smooth full cut $Gamma_eta$ with $"Area"_g \( Gamma_eta \) lt.eq A_(min \, g) \( S \) + eta$. It is compact, so local convergence gives
  $ limsup_j A_(min \, g_j) \( S \) lt.eq lim_j "Area"_(g_j) \( Gamma_eta \) lt.eq A_(min \, g) \( S \) + eta . $
  Let $eta arrow.b 0$. This proves Equation (4.20) for precisely the original full cut definition. If one uses the perimeter formulation, Proposition 10 identifies the same infimum, including the coincident obstacle frontier. At every stage the charge fluxes were preserved as integrals of the two original closed forms. ◻
]

== 5 The filled scalar system and its coercive identity <sy:section>

We work on one fixed strict exterior obtained in Proposition 22. Thus $K$ is compactly supported, the end has smooth asymptotic symbol estimates, and, for some $0 < beta < 1$ and $c > 0$,

#[#set math.equation(numbering: n => "(5.1)")
 $ mu + J \( Y \) - I_g \( Y \) gt.eq c r^(- 3 - beta) \, #h(2em) \| Y \|_g lt.eq 1 . $ <sy:strict-margin>]

Here and throughout this section the constraint densities are geometric: $2 mu = R_g + tau^2 - \| K \|^2$ and $J = "div" \( K - tau g \)$, where $tau = "tr"_g K$. The function $r$ agrees with the coordinate radius sufficiently far out and is smooth and positive elsewhere. We set $k = 2$; in particular, every transverse block below has dimension two.

=== 5.1 The auxiliary filling and the unknowns <the-auxiliary-filling-and-the-unknowns>

The construction also permits a fixed sign $sigma_i in { 1 \, - 1 }$ on each boundary component $S_i$, with $H_(S_i) + sigma_i "tr"_(S_i) K < 0$. For the future-trapped case of Theorem 3, all signs are $+ 1$. Allowing the signs separately will be useful when another obstacle is inserted. The signs are fixed during the construction.

#thm([Lemma 5.1.])[
  (Filling with controlled geometry).  #emph[For every sufficiently large integer $N$, the prepared exterior is contained in a smooth complete, boundaryless, one-ended manifold $Omega_N$. Its metric and symmetric tensor extend $g \, K$ and have the following properties. Each $S_i$ has a fixed inner collar on whose cross-sections $H + sigma_i "tr"_(upright("tan")) K < 0$, with the normal directed toward the exterior. Behind this collar there is a fixed transition to a product cylinder, a product neck of length $O \( 1 + N \)$, and a fixed cap. On the product neck and cap, $K = - sigma_i L_0 g$ for a fixed sufficiently large $L_0$. Local coordinate bounds for the metric, its inverse, and the tensor, of every fixed derivative order, and a positive local injectivity radius can be chosen independently of $N$. The enlarged compact core has volume $O \( 1 + N \)$. The extension of $r$ can be chosen uniformly comparable to one there. The closed flux forms $alpha_1 \, alpha_2$ are retained on the original exterior.]
] <sy:filled-setup>

#proof[
  Every connected component of the boundary is an orientable closed surface, hence is diffeomorphic to the boundary of a handlebody of its genus. Attach a separate such handlebody on each component. The collar theorem gives signed collar coordinates, increasing toward the original exterior. Extend the metric and tensor smoothly a short distance inward. The strict expansion inequality persists on a shorter collar by continuity.
  On the next fixed collar, interpolate the metric to a product metric. The metrics in this interpolation are positive definite and form a fixed compact family; their cross-sectional mean curvatures are therefore bounded. Before making this interpolation, subtract $sigma_i L g$ from $K$, with $L gt.eq 0$ increasing smoothly from zero. This changes $sigma_i "tr"_(upright("tan")) K$ by $- 2 L$. Start the change within the region where the expansion is already strict; after $L$ has become large, it dominates the bounded mean curvature and the bounded tensor terms in the interpolation. One may then interpolate the remaining tensor to the pure trace $- sigma_i L_0 g$, still retaining strictness. Finish with an exactly product segment. This gives the asserted fixed transition.
  Choose a smooth metric on each handlebody extending its product boundary collar, and put $K = - sigma_i L_0 g$ on that cap. Insert between the transition and cap as many copies of the fixed product segment as are needed. A length bounded by a fixed multiple of $1 + N$ is available, with the multiple enlarged when the height barriers are chosen. There are finitely many fixed transition and cap pieces. Product translation identifies all local neck charts, so all asserted local bounds and the local injectivity radius are uniform. Only the cylinder volume grows with its length. The original end is unaltered, proving completeness and the one-end assertion. Extending $r$ as a positive constant along the inserted pieces proves the weight assertion. This construction concerns the metric and tensor only; all subsequent uses of the flux forms take place on the original exterior, where they remain closed with their prescribed two fluxes. ◻
]

Fix $0 < epsilon.alt < 1$. Choose once and for all a smooth nonincreasing function $theta.alt : bb(R) arrow.r \[ 0 \, 1 \]$, equal to one on $\( - oo \, 0 \]$ and zero on $\[ 1 \, oo \)$. Define, for $t in bb(R)$,

#[#set math.equation(numbering: n => "(5.2)")
 $ p \( t \) = N theta.alt \( N t \) \, #h(2em) l \( t \) = exp (integral_0^t p \( s \) thin d s) \, #h(2em) ell = e^(- N epsilon.alt) \, #h(2em) eta = ell^(3 \/ 2) . $ <sy:compression-functions>]

We have $l' = p l$, $0 lt.eq p lt.eq N$, $l \( t \) = e^(N t)$ for $t lt.eq 0$, and $1 lt.eq l \( t \) lt.eq e$ for $t gt.eq 0$. In particular,

#[#set math.equation(numbering: n => "(5.3)")
 $ ell lt.eq l \( t \) lt.eq e quad upright("if ") t gt.eq - epsilon.alt . $ <sy:l-bounds>]

For unknown smooth functions $f \, Z$, define $t$ by

#[#set math.equation(numbering: n => "(5.4)")
 $ Z = t + 1 / 4 log D \, #h(2em) D = 1 + l \( t \)^2 \| d f \|_g^2 . $ <sy:implicit-t>]

This definition is global, including for trial functions that do not satisfy a lower bound on $t$. Indeed, for fixed $xi in T_x^(*) Omega_N$, the derivative of the right side with respect to $t$ is $1 + p v \/ 2 gt.eq 1$, where $v = l \( t \)^2 \| xi \|^2 \/ \( 1 + l \( t \)^2 \| xi \|^2 \)$. Its limits are $- oo$ and $+ oo$ at the two ends of the real line: at the negative end $l = e^(N t)$, and at the positive end $l$ is constant. The implicit function theorem therefore gives a unique smooth $t = t \( x \, Z \, xi \)$, with no singularity at $xi = 0$.

Here $f$ is the auxiliary graph height, $e^(2 t)$ the conformal multiplier, and $Z$ the scalar used in the divergence equation.

Vectors and covectors are identified using $g$. Our notation is

#[#set math.equation(numbering: n => "(5.5)")
 $ w & = l D^(- 1 \/ 2) nabla f \, & a_w & = \| w \| \, & v & = a_w^2 \, & d & = D^(- 1) = 1 - v \,\
q & = 2 + p v \, & chi & = frac(2 d, q) \, & A_d & = I - w ⊗ w \, & A_chi & = I - frac(2 + p, q) w ⊗ w \,\
U & = l sqrt(D) \, & u & = e^t U \, & h & = eta f \, & H^f & = l D^(- 1 \/ 2) nabla^2 f \,\
C & = K + H^f \, & F & = "tr"_(A_chi) C \, & V & = u A_chi \( 2 nabla Z + K \( w \, dot.op \) \) \, & hat(g) & = e^(2 t) \( g + l^2 d f^2 \) . $ <sy:variables>]

Here $"tr"_A C = A^(i j) C_(i j)$. Both $A_d$ and $A_chi$ have eigenvalue one perpendicular to $w$, and their axial eigenvalues are $d$ and $chi$, respectively. Thus $0 < chi lt.eq d lt.eq 1$, and

#[#set math.equation(numbering: n => "(5.6)")
 $ frac(2, 2 + N) A_d lt.eq A_chi lt.eq A_d . $ <sy:axis-comparison>]

The symbols $q \, d \, chi$ in this section are auxiliary scalar coefficients; $Q$ continues to denote the total charge.

At a point with $d f eq.not 0$, let $e = nabla f \/ \| nabla f \|$. Write

#[#set math.equation(numbering: n => "(5.7)")
 $ C = mat(delim: "(", T, M; M^(sans(t)), j) \, #h(2em) d t = \( y \, x \) \, #h(2em) w = a_w e \, #h(2em) T^0 = T - 1 / 2 \( "tr" T \) I_(e^perp) . $ <sy:blocks>]

The first block acts on the two-dimensional space $e^perp$. Consequently $F = "tr" T + chi j$. At $d f = 0$, choose any unit vector $e$ to write these block formulas. All scalar and tensor expressions defined invariantly below are independent of that choice.

=== 5.2 The exact scalar-curvature identity <the-exact-scalar-curvature-identity>

For symmetric tensors $A \, B$, put

$ sans(P)_A = A - \( "tr" A \) g \, #h(2em) sans(B) \( A \, B \) = chevron.l A \, B chevron.r - \( "tr" A \) \( "tr" B \) . $

Let

#[#set math.equation(numbering: n => "(5.8)")
 $ b = - H^f - p \( d t ⊗ w + w ⊗ d t \) \, #h(2em) sans(Q) = K - b = C + p \( d t ⊗ w + w ⊗ d t \) \, #h(2em) s_p = p + 1 / 2 . $ <sy:stationary-tensors>]

Define the smooth scalar

#[#set math.equation(numbering: n => "(5.9)")
 $ cal(T) = 1 / 2 sans(B) \( sans(Q) \, sans(Q) \) + sans(P)_(sans(Q)) \( w \, nabla t \) + 2 s_p \| d t \|_(A_d)^2 + F #scale(x: 120%, y: 120%)[\(] "tr" C + 2 s_p w \( t \) #scale(x: 120%, y: 120%)[\)] . $ <sy:invariant-T>]

This definition, rather than a choice of axis, fixes $cal(T)$ also at zero slope.

#thm([Proposition 5.2.])[
  (Exact filled scalar identity).  #emph[For every pair of smooth functions $f \, Z$ on the filled manifold, 
#[#set math.equation(numbering: n => "(5.10)")
 $ 1 / 2 e^(2 t) R_(hat(g)) = mu + J \( w \) + cal(T) + w \( F \) - F tau - u^(- 1) "div"_g V . $ <sy:scalar-equation>]

 The quadratic expression in Equation (5.9) has the following exact block expansion: 
#[#set math.equation(numbering: n => "(5.11)")
 $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + s_p a_w y \|^2 - 1 / 4 v \| y \|^2 + 2 s_p \( \| y \|^2 + d x^2 \)\
 & - 1 / 4 \( F - chi j \)^2 + chi j^2 - chi F j + F^2 + 2 s_p chi j a_w x . $ <sy:expanded-T>]

 These identities require neither a constraint inequality nor a field extension to the filling.]
] <sy:scalar-identity>

#proof[
  First obtain the scalar identity before conformal multiplication. On $Omega_N times bb(R)$ consider the stationary Lorentzian metric
  $ upright(bold(G)) = - l^2 \( d z - d f \)^2 + macron(g) \, #h(2em) macron(g) = g + l^2 d f^2 . $
  Written in the coordinates $\( x \, z \)$, it has spatial metric $g$, lapse $U = l sqrt(D)$, and shift $gamma = l^2 nabla f = U w$. Its future unit normal to the constant-$z$ slices is $upright(bold(n)) = U^(- 1) \( partial_z - gamma \) = U^(- 1) partial_z - w$. With the convention for $K$ in Definition 1, stationarity gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ b = - U^(- 1) "sym" nabla gamma = - H^f - p \( d t ⊗ w + w ⊗ d t \) \, #h(2em) "div" gamma = - U H_b \, quad H_b = "tr" b . $ <sy:shift-calculation>]
  Here $"sym"$ means the average of a two-tensor and its transpose. The contracted Gauss equation and normal variation of the second fundamental form give, with this sign convention,
  $ upright(bold(R)) = R_g + H_b^2 - \| b \|^2 - 2 upright(bold(R i c)) \( upright(bold(n)) \, upright(bold(n)) \) \, #h(2em) upright(bold(R i c)) \( upright(bold(n)) \, upright(bold(n)) \) = - upright(bold(n)) \( H_b \) - \| b \|^2 + U^(- 1) Delta_g U . $
  Since $H_b$ is independent of $z$, $upright(bold(n)) \( H_b \) = - w \( H_b \)$. Substituting and using $"div" \( U w \) = - U H_b$ yields
  #[#set math.equation(numbering: n => "(5.13)")
   $ upright(bold(R)) = R_g + sans(B) \( b \, b \) - 2 U^(- 1) "div" \( nabla U + H_b U w \) . $ <sy:stationary-scalar>]
  In the coordinates $z - f \( x \)$ the same metric is the warped static metric $- l^2 d \( z - f \)^2 + macron(g)$. Its scalar curvature is $upright(bold(R)) = R_(macron(g)) - 2 l^(- 1) Delta_(macron(g)) l$. The inverse and determinant of $macron(g)$ are $A_d$ and $D det g$, respectively. Hence
  #[#set math.equation(numbering: n => "(5.14)")
   $ l^(- 1) Delta_(macron(g)) l = U^(- 1) "div" #scale(x: 120%, y: 120%)[\(] \( U \/ l \) A_d nabla l #scale(x: 120%, y: 120%)[\)] \, #h(2em) nabla U - \( U \/ l \) A_d nabla l = - U b \( w \, dot.op \) . $ <sy:warp-divergence>]
  For the second identity, divide by $U$ and use $d log U = p \( 1 + v \) d t + H^f \( w \, dot.op \)$ and $d log l = p d t$; the resulting difference is $H^f \( w \, dot.op \) + p { v d t + w \( t \) w } = - b \( w \, dot.op \)$. Equations (5.13) and (5.14) now give
  #[#set math.equation(numbering: n => "(5.15)")
   $ 1 / 2 R_(macron(g)) = 1 / 2 R_g + 1 / 2 sans(B) \( b \, b \) + U^(- 1) "div" \( U sans(P)_b w \) . $ <sy:bar-scalar-b>]
  For clarity, the insertion of the original constraint tensor is an exact cancellation. Namely,
  $ U^(- 1) "div" \( U sans(P)_K w \) = J \( w \) + sans(P)_K : U^(- 1) nabla \( U w \) = J \( w \) - sans(B) \( K \, b \) \, $
  where symmetry of $sans(P)_K$ permits use of Equation (5.12). Moreover, $mu = R_g \/ 2 - sans(B) \( K \, K \) \/ 2$ and $sans(Q) = K - b$. Expanding $sans(B) \( sans(Q) \, sans(Q) \)$ in Equation (5.15) therefore proves
  #[#set math.equation(numbering: n => "(5.16)")
   $ 1 / 2 R_(macron(g)) = mu + J \( w \) + 1 / 2 sans(B) \( sans(Q) \, sans(Q) \) - U^(- 1) "div" \( U sans(P)_(sans(Q)) w \) . $ <sy:bar-scalar-Q>]
  In dimension three the conformal scalar law is
  $ 1 / 2 e^(2 t) R_(hat(g)) = 1 / 2 R_(macron(g)) - 2 Delta_(macron(g)) t - \| d t \|_(A_d)^2 . $
  The same determinant calculation as above gives $Delta_(macron(g)) t = U^(- 1) "div" \( U A_d nabla t \) - p \| d t \|_(A_d)^2$. Set $W = sans(P)_(sans(Q)) w + 2 A_d nabla t$. Since $u = e^t U$,
  $ - U^(- 1) "div" \( U W \) = - u^(- 1) "div" \( u W \) + W \( t \) . $
  It follows that
  #[#set math.equation(numbering: n => "(5.17)")
   $ 1 / 2 e^(2 t) R_(hat(g)) =  & mu + J \( w \) + 1 / 2 sans(B) \( sans(Q) \, sans(Q) \) + sans(P)_(sans(Q)) \( w \, nabla t \)\
 & + 2 s_p \| d t \|_(A_d)^2 - u^(- 1) "div" \( u W \) . $ <sy:before-flux-replacement>]
  Differentiating Equation (5.4) gives the useful exact one-form identity
  #[#set math.equation(numbering: n => "(5.18)")
   $ 2 thin d Z = \( 2 + p v \) d t + H^f \( w \, dot.op \) . $ <sy:differential>]
  In the block notation, $"tr" T = F - chi j$, and $sans(P)_(sans(Q)) w$ has transverse component $a_w M + p v y$ and axial component $- a_w \( F - chi j \)$. Thus both sides of the first identity below have transverse component $u \( q y + a_w M \)$ and axial component $u \( 2 d x + chi a_w j - a_w F \)$:
  #[#set math.equation(numbering: n => "(5.19)")
   $ u W = V - u F w \, #h(2em) u^(- 1) "div" \( u w \) = F + \( 1 - chi \) j - tau + 2 s_p a_w x . $ <sy:flux-identities>]
  For the second identity, use $u^(- 1) "div" \( u w \) = - H_b + w \( t \) = "tr" H^f + \( 2 p + 1 \) w \( t \)$. Replacing the flux in Equation (5.17) and differentiating $u F w$ gives Equation (5.10) with Equation (5.9).
  To check the full expansion, put $z_T = "tr" T = F - chi j$. The transverse, mixed, and axial blocks of $sans(Q)$ are $T$, $M + p a_w y$, and $j + 2 p a_w x$. Therefore
  $ 1 / 2 sans(B) \( sans(Q) \, sans(Q) \) = 1 / 2 \| T^0 \|^2 - 1 / 4 z_T^2 + \| M + p a_w y \|^2 - z_T j - 2 p a_w x z_T \, $
  and
  $ sans(P)_(sans(Q)) \( w \, nabla t \) = a_w chevron.l M \, y chevron.r + p v \| y \|^2 - a_w x z_T . $
  Combining the terms in $M \, y$ completes the square $\| M + s_p a_w y \|^2 - v \| y \|^2 \/ 4$. The remaining linear terms in $x$ equal $2 s_p a_w x \( F - z_T \) = 2 s_p chi j a_w x$; the remaining terms in $j \, F$ equal $- z_T j + F \( F + \( 1 - chi \) j \) = chi j^2 - chi F j + F^2$. These are exactly all the terms in Equation (5.11). ◻
]

=== 5.3 Polynomial coercivity and the stationary-point comparison <polynomial-coercivity-and-the-stationary-point-comparison>

We use $cal(P)_N$ for a positive bound of the form $C \( 1 + N \)^a$, allowing the constant and the finite exponent to increase between appearances. Its coefficients may depend on the fixed prepared data and on $epsilon.alt$, but never on the outer truncation radius. A bound merely finite for each fixed $N$ will not be denoted by $cal(P)_N$.

#thm([Proposition 5.3.])[
  (Coercivity).  #emph[For all the variables in Equation (5.5), 
#[#set math.equation(numbering: n => "(5.20)")
 $ \| T \|^2 + \| M \|^2 + d j^2 + F^2 + \| d t \|_(A_d)^2 lt.eq 20 \( 1 + N \)^2 cal(T) . $ <sy:coercivity-estimate>]

 At a point where $d t = 0$, set $cal(E)_0 = \| T^0 \|^2 + \| M \|^2 + F^2 + chi j^2$. Then, independently of $N$, 
#[#set math.equation(numbering: n => "(5.21)")
 $ 1 / 2 cal(E)_0 lt.eq cal(T) lt.eq cal(E)_0 . $ <sy:stationary-coercivity>]

]
] <sy:coercivity>

#proof[
  Completing first the $x$ square and then the $F$ square in Equation (5.11) gives the exact expression
  #[#set math.equation(numbering: n => "(5.22)")
   $ cal(T) =  & 1 / 2 \| T^0 \|^2 + \| M + s_p a_w y \|^2 + \( 2 s_p - v \/ 4 \) \| y \|^2\
 & + 2 s_p d (x + frac(a_w j, q))^2 + 3 / 4 (F - frac(chi j, 3))^2 + frac(d \( 8 + v \), 3 q^2) j^2 . $ <sy:positive-squares>]
  Indeed, the residual coefficient of $j^2$ is
  $ chi - 1 / 3 chi^2 - s_p frac(chi^2 v, 2 d) = chi / q (4 / 3 + v / 6) = frac(d \( 8 + v \), 3 q^2) . $
  Every displayed square has a positive coefficient, and $2 s_p - v \/ 4 gt.eq 3 s_p \/ 2 gt.eq 3 \/ 4$. The last square implies $d j^2 lt.eq 3 \( N + 2 \)^2 cal(T) \/ 8$ and $chi^2 j^2 lt.eq 3 cal(T) \/ 2$. The $F$ square then gives $F^2 lt.eq 3 cal(T)$; hence $\| T \|^2 = \| T^0 \|^2 + \( F - chi j \)^2 \/ 2 lt.eq 13 cal(T) \/ 2$. The transverse square gives $\| y \|^2 lt.eq 4 cal(T) \/ 3$. Undoing the $x$ shift gives
  $ d x^2 lt.eq 2 d (x + frac(a_w j, q))^2 + frac(2 d v, q^2) j^2 lt.eq 8 / 3 cal(T) . $
  Likewise,
  $ \| M \|^2 lt.eq 2 \| M + s_p a_w y \|^2 + 2 s_p^2 v \| y \|^2 lt.eq (2 + 4 / 3 \( N + 1 / 2 \)) cal(T) . $
  Adding these bounds proves Equation (5.20). In particular the coercivity loses no exponential factor from $l$ or $d$.
  When $d t = 0$, Equation (5.11) reduces to
  $ cal(T) = 1 / 2 \| T^0 \|^2 + \| M \|^2 + 3 / 4 F^2 - 1 / 2 chi F j + \( chi - 1 / 4 chi^2 \) j^2 . $
  The matrix of the last two variables $\( F \, sqrt(chi) j \)$ is
  $ mat(delim: "(", 3 \/ 4, - sqrt(chi) \/ 4; - sqrt(chi) \/ 4, 1 - chi \/ 4) . $
  Its eigenvalues are $1$ and $\( 3 - chi \) \/ 4 in \[ 1 \/ 2 \, 3 \/ 4 \]$. This proves Equation (5.21). ◻
]

For a symmetric tensor $B$, define

#[#set math.equation(numbering: n => "(5.23)")
 $ cal(S) \( B \) = 1 / 2 {\( "tr"_(A_d) B \)^2 - \| B \|_(A_d ⊗ A_d)^2} . $ <sy:S-definition>]

#thm([Lemma 5.4.])[
  (Identity and subtraction at a stationary point).  #emph[At any point where $d t = 0$, 
#[#set math.equation(numbering: n => "(5.24)")
 $ 1 / 2 e^(2 t) R_(hat(g)) =  & 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \)\
 & - v p "tr"_(e^perp) nabla^2 t - 2 "tr"_(A_d) nabla^2 t \, $ <sy:stationary-identity>]

 and 
#[#set math.equation(numbering: n => "(5.25)")
 $ cal(T) - cal(S) \( H^f \) gt.eq 1 / 12 cal(T) - \( 6 N + 25 \) #scale(x: 120%, y: 120%)[\(] v F^2 + \| K \|^2 #scale(x: 120%, y: 120%)[\)] . $ <sy:stationary-subtraction>]

 In particular both Hessian terms in Equation (5.24) are nonpositive at a local minimum of $t$.]
] <sy:stationary-minimum>

#proof[
  Use the graph of $f$ in the Riemannian warped product $g + l^2 d z^2$. At $d t = 0$ its second fundamental form, up to its irrelevant overall normal sign, is $H^f$; its induced metric is $macron(g)$ and its inverse is $A_d$. At that point $l^(- 1) nabla^2 l = p nabla^2 t$. The horizontal Ricci tensor of the ambient metric is $"Ric"_g - p nabla^2 t$, its unit vertical Ricci component is $- p Delta_g t$, and its mixed Ricci components vanish. Its scalar curvature is $R_g - 2 p Delta_g t$. The graph unit normal has horizontal part $- w$ and vertical part of length $sqrt(d)$. The contracted graph Gauss equation therefore gives
  $ 1 / 2 R_(macron(g)) = 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) - v p "tr"_(e^perp) nabla^2 t . $
  At a stationary point the conformal law contributes exactly $- 2 "tr"_(A_d) nabla^2 t$. This proves Equation (5.24), including all the Hessian terms.
  To prove the inequality, first use $C = H^f + K$. Its transverse trace is $F - chi j$, so direct contraction gives
  $ cal(S) \( C \) = 1 / 4 \( F - chi j \)^2 - 1 / 2 \| T^0 \|^2 + d j \( F - chi j \) - d \| M \|^2 . $
  Subtracting this from the stationary expression for $cal(T)$ gives the exact formula
  #[#set math.equation(numbering: n => "(5.26)")
   $ cal(T) - cal(S) \( C \) =  & \| T^0 \|^2 + \( 1 + d \) \| M \|^2 + 1 / 2 F^2 - d F j\
 & + b_(*) j^2 \, #h(2em) b_(*) = chi \( 1 + d \) - 1 / 2 chi^2 . $ <sy:exact-subtraction>]
  Since $chi lt.eq d$, we have $b_(*) gt.eq chi \( 1 + d \/ 2 \) gt.eq chi$ and
  $ frac(d^2, 2 b_(*)) lt.eq frac(d q, 2 \( 2 + d \)) lt.eq 1 / 3 + frac(p v, 6) . $
  Young’s inequality, in the form $d \| F j \| lt.eq b_(*) j^2 \/ 2 + d^2 F^2 \/ \( 2 b_(*) \)$, thus proves
  #[#set math.equation(numbering: n => "(5.27)")
   $ cal(T) - cal(S) \( C \) gt.eq 1 / 6 cal(E)_0 - p / 6 v F^2 . $ <sy:subtraction-before-K>]
  For the remaining polarization, let $X = A_d^(1 \/ 2) C A_d^(1 \/ 2)$ and $Y = A_d^(1 \/ 2) K A_d^(1 \/ 2)$, regarding these as symmetric matrices in a $g$-orthonormal frame. Then
  $ \| X \|^2 = \| T^0 \|^2 + 1 / 2 \( F - chi j \)^2 + 2 d \| M \|^2 + d^2 j^2 lt.eq frac(N + 4, 2) cal(E)_0 \, #h(2em) \| Y \| lt.eq \| K \| . $
  Here $d^2 \/ chi = d q \/ 2 lt.eq \( N + 2 \) \/ 2$ controls the only axial loss. The trace-reversal map on symmetric three-by-three matrices has operator norm two, whence
  $ \| \( "tr" X \) \( "tr" Y \) - chevron.l X \, Y chevron.r \| lt.eq sqrt(2 \( N + 4 \)) sqrt(cal(E)_0) \| K \| . $
  Also $cal(S) \( K \) lt.eq \| K \|^2$. As $cal(S) \( C - K \) = cal(S) \( C \) - { \( "tr" X \) \( "tr" Y \) - chevron.l X \, Y chevron.r } + cal(S) \( K \)$, Young’s inequality with coefficient $1 \/ 12$ of $cal(E)_0$ and Equation (5.27) imply
  $ cal(T) - cal(S) \( H^f \) gt.eq 1 / 12 cal(E)_0 - p / 6 v F^2 - \( 6 N + 25 \) \| K \|^2 . $
  Use $cal(E)_0 gt.eq cal(T)$ and $0 lt.eq p lt.eq N$ to obtain Equation (5.25). ◻
]

=== 5.4 The equations and their continuation family <the-equations-and-their-continuation-family>

Choose

#[#set math.equation(numbering: n => "(5.28)")
 $ 3 / 4 < b_1 < 1 \, #h(2em) rho_0 = r^(- 3 - beta) \, #h(2em) rho_1 = r^(- 2 b_1) \, #h(2em) rho = c_(*) rho_0 \, $ <sy:weights>]

where $c_(*) > 0$ is sufficiently small that the right side of Equation (5.1) is strictly larger than $2 rho$ on the original exterior. These weights are extended positively over the filling by the choice of $r$ in Lemma 23. Choose a fixed $0 < delta_0 < 1 \/ 24$, and put

#[#set math.equation(numbering: n => "(5.29)")
 $ m_0 \( t \) = theta.alt \( N \( t + epsilon.alt \) \) \, #h(2em) Xi = delta_0 #scale(x: 120%, y: 120%)[\(] cal(T) + eta a_w \| d f \| #scale(x: 120%, y: 120%)[\)] + rho - m_0 \( t \) C_N \( rho_0 + v rho_1 \) . $ <sy:penalty>]

The constant $C_N$ is positive and polynomially bounded in $1 + N$. It is chosen large enough for the floor estimate in Lemma 29; that lemma will show that this is a permissible polynomial choice. Thus the parameter order is: the prepared exterior, $epsilon.alt$, $N$, the above coefficients, and finally a sufficiently large truncation radius $R$. At $t = - epsilon.alt$ the penalty multiplier is one, while it vanishes at $t gt.eq - epsilon.alt + 1 \/ N$.

On $Omega_(N \, R)$, obtained by cutting the sole end at $r = R$, the system is

#[#set math.equation(numbering: n => "(5.30)")
 $ F = h = eta f \, #h(2em) "div"_g V = u Xi \, #h(2em) f = Z = 0 quad upright("on ") { r = R } . $ <sy:system>]

The first equation is equivalently

#[#set math.equation(numbering: n => "(5.31)")
 $ "tr"_(A_chi) nabla^2 f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] eta f - "tr"_(A_chi) K #scale(x: 120%, y: 120%)[\)] . $ <sy:normalized-trace>]

The penalty uses the smooth quantity $eta a_w \| d f \| = eta l D^(- 1 \/ 2) \| d f \|^2$ even at zero slope. All quantities in Equations (5.30) and (5.31) are now specified; the original boundary lies in the interior of $Omega_(N \, R)$.

For the continuation argument, let

#[#set math.equation(numbering: n => "(5.32)")
 $ \( a \, b \) in cal(H) := \( \[ 0 \, 1 \] times { 1 } \) union \( { 0 } times \[ 0 \, 1 \] \) \, #h(2em) K_a = a K \, #h(2em) F_a = eta f \, #h(2em) "div" V_a = b thin u Xi_a . $ <sy:homotopy>]

Every expression containing $K$, including $F \, V \, cal(T) \, tau$ and the constraint densities in scalar identities, is recomputed with $K_a$. The weights, $p \, l \, eta$, $delta_0$, and $C_N$ remain fixed. The original system is $\( a \, b \) = \( 1 \, 1 \)$; the two segments lead first to $\( 0 \, 1 \)$ and then to $\( 0 \, 0 \)$.

#thm([Lemma 5.5.])[
  (The zero-tensor segment).  #emph[Every smooth zero-Dirichlet solution of the trace equation with $K = 0$ has $f = 0$. On that segment $t = Z$, $d = chi = 1$, $w = 0$, and the second equation becomes 
#[#set math.equation(numbering: n => "(5.33)")
 $ 2 Delta_g Z + 2 \( 1 + p \( Z \) \) \| d Z \|^2 = b { 2 delta_0 s_p \( Z \) \| d Z \|^2 + rho - m_0 \( Z \) C_N rho_0 } . $ <sy:scalar-end-system>]

 In particular, at $\( a \, b \) = \( 0 \, 0 \)$ the unique solution is $f = Z = 0$.]
] <sy:zero-trace-reduction>

#proof[
  At a positive interior maximum of $f$, the left side of Equation (5.31) is nonpositive and the right side is strictly positive. A negative minimum is excluded in the same way. The zero boundary value therefore gives $f = 0$. The defining formulas now give $t = Z$, $cal(T) = 2 s_p \| d Z \|^2$, $u = e^Z l \( Z \)$, and $V = 2 e^Z l \( Z \) nabla Z$. Differentiating this flux proves Equation (5.33). For $b = 0$, define $Psi \( z \) = integral_0^z e^s l \( s \) thin d s$. The equation is $Delta_g Psi \( Z \) = 0$ with zero boundary value, so $Psi \( Z \) = 0$ by the maximum principle. Since $Psi' > 0$, $Z = 0$. This identifies the starting solution for continuation without assuming existence at any other parameter value. ◻
]

== 6 Height, floor exclusion, and quantitative distortion <es:section>

Throughout this section the prepared strict exterior and $0 < epsilon.alt < 1$ are fixed. We use the filled manifolds, coefficients, and equations of Section 5, with dimension three and $k = 2$. Thus

$ ell = e^(- N epsilon.alt) \, #h(2em) eta = ell^(3 \/ 2) \, #h(2em) Z = t + 1 / 4 log D \, #h(2em) u = e^t l sqrt(D) = l e^(2 Z - t) . $

All assertions concern smooth solutions on the truncation at $r = R$, with $f = Z = 0$ on that sphere. They apply to the homotopy

#[#set math.equation(numbering: n => "(6.1)")
 $ \( a \, b \) in \( \[ 0 \, 1 \] times { 1 } \) union \( { 0 } times \[ 0 \, 1 \] \) \,\
K_a = a K \, #h(2em) F = h = eta f \, #h(2em) "div" V = b u Xi \, $ <es:homotopy>]

where all quantities involving the tensor are recomputed using $K_a$. In particular,

#[#set math.equation(numbering: n => "(6.2)")
 $ Xi = delta_0 \( cal(T) + G \) + rho - m_0 C_N \( rho_0 + v rho_1 \) \, #h(2em) G = eta a_w \| d f \|_g = eta / l \( sqrt(D) - D^(- 1 \/ 2) \) . $ <es:source>]

Here $rho_0 = r^(- 3 - beta)$, $rho_1 = r^(- 2 b_1)$, $3 \/ 4 < b_1 < 1$, $rho = c_(*) rho_0$, and $m_0 = theta.alt \( N \( t + epsilon.alt \) \)$.

Constants denoted by $C$ can depend on the fixed prepared exterior and on $epsilon.alt$, but not on $N$, $R$, or the homotopy parameters. A symbol $P_N$ denotes a positive polynomial in $1 + N$ with those allowed dependencies; it can be enlarged at successive occurrences. We will keep polynomial bounds and bounds of the form $exp \( P_N \)$ distinct. The enlarged core has volume at most $C \( 1 + N \)$, uniformly bounded local geometry, and uniformly bounded $K_a$ and its derivatives. The tensor vanishes outside that core and a fixed exterior annulus. Radius weights are uniformly comparable to one on the added necks and caps.

=== 6.1 The height and the outer face <the-height-and-the-outer-face>

#thm([Lemma 6.1.])[
  (Uniform height and outer slope).  #emph[There are constants $C \, r_0$, independent of $N$, such that every smooth solution of the trace equation in (6.1) satisfies 
#[#set math.equation(numbering: n => "(6.3)")
 $ \| h \| lt.eq C \, #h(2em) \| h \| lt.eq C \( r^(- b_1) - R^(- b_1) \) quad \( r_0 lt.eq r lt.eq R \) \, $ <es:height-bound>]

 provided $R gt.eq 2 r_0$. On the outer sphere, 
#[#set math.equation(numbering: n => "(6.4)")
 $ \| d f \|_g lt.eq C eta^(- 1) R^(- b_1 - 1) . $ <es:face-slope>]

 Consequently, for all $R gt.eq R_min \( N \, epsilon.alt \)$, one has $t > - epsilon.alt$ on that sphere. If $a = 0$, then $f = h = 0$.]
] <es:height>

#proof[
  At an interior maximum of $h$, its gradient vanishes, and hence $D = 1$, $A_chi = I$. The trace equation there reads
  $ h = "tr"_g K_a + l / eta Delta_g h lt.eq "tr"_g K_a . $
  At an interior minimum the reverse inequality holds. The boundary height is zero and $\| "tr"_g K_a \| lt.eq C$ uniformly on the filled manifolds. This proves the first assertion. It also proves $h = 0$ when $K_a = 0$.
  Choose $r_0$ outside the support of $K$ and large enough for the following radial calculation. At a contact point with $H_R = C_0 \( r^(- b_1) - R^(- b_1) \)$, the slope axis of $h$ is the radial axis. The transverse eigenvalues of $A_chi$ are one and its axial eigenvalue is $0 < chi lt.eq 1$. The asymptotic bounds for the prepared metric imply, uniformly for this entire range of $chi$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ "tr"_(A_chi) nabla^2 H_R = C_0 b_1 r^(- b_1 - 2) #scale(x: 120%, y: 120%)[\(] - 2 + \( 1 + b_1 \) chi + o \( 1 \) #scale(x: 120%, y: 120%)[\)] < 0 . $ <es:radial-trace>]
  Indeed, in the Euclidean metric the radial and transverse Hessian eigenvalues are respectively $C_0 b_1 \( 1 + b_1 \) r^(- b_1 - 2)$ and $- C_0 b_1 r^(- b_1 - 2)$; the metric and connection errors are $o \( r^(- b_1 - 2) \)$. Since $1 - b_1 > 0$, one choice of $r_0$ makes the inequality strict for every slope and every $N$. Choose $C_0$ so that $H_R gt.eq C$ at $r = r_0$ for every $R gt.eq 2 r_0$. If $h - H_R$ had a positive interior maximum, the matching gradients would determine the same $t$, $l$, $D$, and $A_chi$ in evaluating the trace at that point, while $nabla^2 h lt.eq nabla^2 H_R$. The trace equation, $K = 0$, and (6.5) would give $0 < h lt.eq \( l \/ \( eta sqrt(D) \) \) "tr"_(A_chi) nabla^2 H_R < 0$. Applying the same argument to $- h$ proves the end bound. The two barriers vanish at $r = R$; their one-sided derivatives there, together with the zero tangential derivative of $h$, imply (6.4).
  For a fixed boundary slope the function
  $ t mapsto t + 1 / 4 log \( 1 + l \( t \)^2 \| d f \|_g^2 \) $
  has derivative $1 + p v \/ 2 gt.eq 1$. At $t = - epsilon.alt$ its value is at most
  $ - epsilon.alt + 1 / 4 log \( 1 + C^2 ell^2 eta^(- 2) R^(- 2 b_1 - 2) \) = - epsilon.alt + 1 / 4 log \( 1 + C^2 ell^(- 1) R^(- 2 b_1 - 2) \) . $
  This is negative for sufficiently large $R$ at fixed $N$; for example it suffices to require $C^2 ell^(- 1) R^(- 2 b_1 - 2) < e^(4 epsilon.alt) - 1$. Since its value at the actual boundary $t$ is $Z = 0$, strict monotonicity gives $t > - epsilon.alt$. ◻
]

=== 6.2 Exclusion of the lower boundary of the admissible set <exclusion-of-the-lower-boundary-of-the-admissible-set>

#thm([Lemma 6.2.])[
  (Floor exclusion).  #emph[One can choose a fixed $delta_0 > 0$ and a polynomial $C_N$ such that no smooth solution of (6.1) with $t gt.eq - epsilon.alt$ touches $t = - epsilon.alt$, provided $R gt.eq R_min \( N \, epsilon.alt \)$. The choices are uniform in the homotopy parameters.]
] <es:floor>

#proof[
  The outer boundary is excluded by Lemma 28. Consider first $b = 1$ and an interior minimum with $t = - epsilon.alt$. Write $e$ for the slope axis, arbitrary at zero slope. The stationary-point calculation of Lemma 26 gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ 1 / 2 e^(2 t) R_(hat(g)) & = 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) - v p "tr"_(e^perp) nabla^2 t - 2 "tr"_(A_d) nabla^2 t\
 & lt.eq 1 / 2 R_g - v "Ric"_g \( e \, e \) + cal(S) \( H^f \) \, $ <es:min-gauss>]
  where $cal(S) \( B \) = 1 / 2 \( \( "tr"_(A_d) B \)^2 - \| B \|_(A_d ⊗ A_d)^2 \)$. The signs in this inequality use $p \, v gt.eq 0$, $A_d > 0$, and $nabla^2 t gt.eq 0$. The same lemma supplies a constant $c_1 > 0$, independent of $N$, and the algebraic estimate
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(T) - cal(S) \( H^f \) gt.eq c_1 cal(T) - P_N \( v F^2 + \| K_a \|^2 \) . $ <es:min-subtraction>]
  Both formulas concern the actual tensor $K_a$; no energy condition on the filling or on the scaled tensor is used.
  By the scalar identity (5.10) and $F = eta f$, $w \( F \) = G$, so comparison with (6.6) yields
  $ u^(- 1) "div" V & gt.eq cal(T) - cal(S) \( H^f \) + G + \( mu_a - R_g \/ 2 \) + J_a \( w \) - F "tr"_g K_a + v "Ric"_g \( e \, e \)\
 & gt.eq c_1 cal(T) + G - B_N \( rho_0 + v rho_1 \) $
  with $B_N lt.eq C \( 1 + N \)$, using the coefficient $6 N + 25$ in Lemma 26. To justify the last bound throughout the noncompact range, observe that $mu_a - R_g \/ 2 = \( \( "tr" K_a \)^2 - \| K_a \|^2 \) \/ 2$, and that this term, $J_a$, $K_a$, and $F "tr" K_a$ are supported in the enlarged core, where they are bounded and $rho_0$ is bounded below. On the end, $\| F \|^2 = \| h \|^2 lt.eq C rho_1$ by Lemma 28, while $\| "Ric"_g \| lt.eq C r^(- 3) lt.eq C rho_1$. The same estimates on a fixed connecting annulus are absorbed into the constant. This proves the displayed bound with constants independent of $R$ and $a$.
  At the assumed minimum $m_0 = 1$. Equating the last lower bound with (6.2) gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ 0 gt.eq \( c_1 - delta_0 \) cal(T) + \( 1 - delta_0 \) G + \( C_N - B_N \) \( rho_0 + v rho_1 \) - c_(*) rho_0 . $ <es:floor-contradiction>]
  Choose $0 < delta_0 < 1 / 2 min \( c_1 \, 1 \)$, and then choose the polynomial $C_N gt.eq B_N + c_(*) + 1$. The right side of (6.8) is positive because $rho_0 > 0$, a contradiction.
  In the remaining homotopy segment $a = 0$, Lemma 28 gives $f = 0$. Consequently $t = Z$, $v = 0$, $A_chi = I$, $u = e^t l \( t \)$, and $cal(T) = \( 2 p + 1 \) \| d t \|^2$. At an interior minimum $t = - epsilon.alt$, the equation is
  $ 2 u Delta_g t = b u \( rho - C_N rho_0 \) . $
  Its left side is nonnegative, whereas its right side is negative if $b > 0$. If $b = 0$, set $Phi_0 \( t \) = integral_0^t e^s l \( s \) thin d s$. Then $Delta_g Phi_0 \( t \) = 0$ with zero boundary data, hence $Phi_0 \( t \) = 0$ and $t = 0$, since $Phi_0$ is strictly increasing. This proves the assertion on the whole homotopy. ◻
]

=== 6.3 A weighted integral above high levels <a-weighted-integral-above-high-levels>

For the rest of the section assume $t gt.eq - epsilon.alt$. The definition of $l$, including its constant value once $t gt.eq 1 \/ N$, gives

#[#set math.equation(numbering: n => "(6.9)")
 $ ell lt.eq l lt.eq e \, #h(2em) t lt.eq Z . $ <es:warp-bounds>]

Let $cal(C)_N$ be the enlarged core together with a fixed annulus containing the support of $K$. Enlarge it by a fixed amount when necessary. It has volume $O \( 1 + N \)$, $rho gt.eq c > 0$ there, and it has a cover by $O \( 1 + N \)$ patches of fixed size with uniform local geometry. These properties also hold for a fixed enlargement of every patch. Write

$ d nu = sqrt(D) thin d V_g \, #h(2em) A = A_chi . $

This measure is allowed to depend on the particular solution.

#thm([Lemma 6.3.])[
  (High-level integral).  #emph[On the first segment $b = 1$ of (6.1), there is a polynomial $Z_0 = P_N gt.eq 2$ such that 
#[#set math.equation(numbering: n => "(6.10)")
 $ Xi gt.eq delta_0 cal(T) + rho + 1 / 2 delta_0 G #h(2em) upright("where ") Z > Z_0 . $ <es:high-sign>]

 Every fixed enlargement of $cal(C)_N$ satisfies 
#[#set math.equation(numbering: n => "(6.11)")
 $ integral_(cal(C)_N) e^Z thin d nu lt.eq exp \( P_N \) . $ <es:moment>]

 The constants are independent of $R$ and $a$.]
] <es:high-integral>

#proof[
  Only the support of the penalty needs consideration for (6.10). There $- epsilon.alt lt.eq t < - epsilon.alt + 1 \/ N lt.eq 1$, and therefore, when $Z gt.eq 2$,
  $ G = eta / l (e^(2 \( Z - t \)) - e^(- 2 \( Z - t \))) gt.eq c eta e^(2 Z) . $
  The radius weights are bounded above, so the negative penalty has magnitude at most $C C_N$. Thus one may take
  $ Z_0 gt.eq 2 + 3 / 4 N epsilon.alt + 1 / 2 log \( 1 + C C_N \/ delta_0 \) . $
  Increasing this expression to a polynomial proves (6.10).
  Choose a nondecreasing Lipschitz function $q$ which is zero on $\( - oo \, Z_0 \]$, one on $\[ Z_0 + 1 \, oo \)$, and has $0 lt.eq q' lt.eq 2$. It vanishes on the outer boundary. Testing the divergence equation with $q \( Z \)$ gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ integral u Xi q \( Z \) thin d V_g & = - integral u q' \( Z \) #scale(x: 120%, y: 120%)[\(] 2 \| d Z \|_A^2 + A \( K_a \( w \, dot.op \) \, d Z \) #scale(x: 120%, y: 120%)[\)] thin d V_g\
 & lt.eq C integral_({ Z_0 < Z < Z_0 + 1 }) u \| K_a \|^2 thin d V_g . $ <es:cutoff-test>]
  The last inequality is the scalar estimate $- 2 x^2 + y x lt.eq y^2 \/ 8$, and $A lt.eq I$. The last integrand is supported in $cal(C)_N$, where $u = l e^(2 Z - t) lt.eq e^(1 + epsilon.alt + 2 \( Z_0 + 1 \))$ on the strip. Its integral is consequently at most $exp \( P_N \)$. All terms on the left are nonnegative by (6.10), and $q = 1$ above $Z_0 + 1$, so
  #[#set math.equation(numbering: n => "(6.13)")
   $ integral_({ Z > Z_0 + 1 }) u \( delta_0 cal(T) + rho + 1 / 2 delta_0 G \) thin d V_g lt.eq exp \( P_N \) . $ <es:weighted-positive>]
  The same argument applies to any fixed enlargement of the core, since $rho$ has a positive lower bound there.
  Here is a pointwise conversion of this estimate to the claimed moment. Since $l gt.eq ell gt.eq eta$ and $D gt.eq 1$,
  $ u \( 1 + G \) & = sqrt(D) e^t #scale(x: 120%, y: 120%)[\[] l + eta \( sqrt(D) - D^(- 1 \/ 2) \) #scale(x: 120%, y: 120%)[\]]\
 & gt.eq eta e^t D gt.eq eta e^Z sqrt(D) . $
  The final inequality is $sqrt(D) = e^(2 \( Z - t \)) gt.eq e^(Z - t)$. Thus (6.13), $rho gt.eq c$ on the core, and $eta^(- 1) = e^(3 N epsilon.alt \/ 2)$ bound the integral in (6.11) above $Z_0 + 1$. On the complementary set, $sqrt(D) = e^(2 \( Z - t \)) lt.eq e^(2 \( Z_0 + 1 + epsilon.alt \))$ and $e^Z lt.eq e^(Z_0 + 1)$; multiplication by the core volume $C \( 1 + N \)$ gives the same bound there. ◻
]

=== 6.4 Sobolev and energy estimates on graph patches <sobolev-and-energy-estimates-on-graph-patches>

#thm([Lemma 6.4.])[
  (Sobolev inequality on the unit-warp graph).  #emph[For each of the core patches just described, and every smooth compactly supported function $phi$ in the patch, 
#[#set math.equation(numbering: n => "(6.14)")
 $ (integral \| phi \|^6 thin d nu)^(1 \/ 3) lt.eq S_N integral #scale(x: 120%, y: 120%)[\(] \| d phi \|_A^2 + \( 1 + cal(T) \) phi^2 #scale(x: 120%, y: 120%)[\)] thin d nu \, #h(2em) log S_N lt.eq P_N . $ <es:sobolev-form>]

 No bound on $Z$, $d f$, or derivatives of $t$ is required beyond $t gt.eq - epsilon.alt$ and the trace and coercivity identities.]
] <es:sobolev>

#proof[
  Use the graph of $f$ in the product metric $g + d z^2$ on a larger base patch times the entire real line. Put
  $ E_f = 1 + \| d f \|_g^2 \, #h(2em) A_1 = I - frac(d f ⊗ d f, E_f) . $
  Its measure is $d nu_1 = sqrt(E_f) thin d V_g$ and its inverse metric on base covectors is $A_1$. Equations (6.9) give
  $ e^(- 2) D lt.eq E_f lt.eq ell^(- 2) D . $
  The axial eigenvalues of $A_1 \, A_d \, A$ are respectively $E_f^(- 1) \, d \, chi$, and $2 d \/ \( 2 + N \) lt.eq chi lt.eq d$. Hence the measures and inverse metrics are pairwise comparable with factors bounded by $C \( 2 + N \) ell^(- 2) lt.eq exp \( P_N \)$.
  The scalar mean curvature of this graph in $g + d z^2$ is
  $ H_1 = E_f^(- 1 \/ 2) "tr"_(A_1) nabla^2 f = frac(sqrt(D), l sqrt(E_f)) "tr"_(A_1) H^f . $
  Coercivity, Proposition 25, controls the transverse block of $H^f + K_a$ and the axial block multiplied by $sqrt(d)$ by $P_N sqrt(cal(T))$. Since $E_f^(- 1) lt.eq e^2 d lt.eq e^2 sqrt(d)$ and $\| K_a \| lt.eq C$, it follows that
  $ \| "tr"_(A_1) H^f \| lt.eq P_N \( 1 + sqrt(cal(T)) \) \, #h(2em) \| H_1 \| lt.eq exp \( P_N \) \( 1 + sqrt(cal(T)) \) . $
  This estimate uses weighted axial contraction, rather than an unweighted bound for the full Hessian.
  Each larger base patch can be smoothly isometrically embedded in a fixed Euclidean space. Only finitely many compact geometric models are needed: the fixed exterior and transition patches, the fixed caps, and translates of product-neck patches. One can obtain such embeddings by extending each model to a compact smooth Riemannian manifold and applying the smooth isometric embedding theorem #cite(label("Nash1956")) Theorem 2, p. 59. The Euclidean dimensions and the second fundamental forms on the smaller patches therefore have fixed bounds. Taking the product of these embeddings with the identity of the real line gives an isometric embedding of the ambient product. The Euclidean mean curvature vector of the graph has norm at most $\| H_1 \| + C$, because the trace of the ambient second fundamental form over its three unit tangent vectors is bounded by a fixed constant.
  The Euclidean submanifold Sobolev inequality of Michael and Simon #cite(label("MichaelSimon1973")), in the form proved in #cite(label("Simon2018GMT")) Chapter 4, Section 6, Theorem 6.7, applies to this smooth three-dimensional immersed graph and compactly supported test functions: if $zeta gt.eq 0$, then
  $ (integral zeta^(3 \/ 2) thin d nu_1)^(2 \/ 3) lt.eq C integral #scale(x: 120%, y: 120%)[\(] \| d zeta \|_(A_1) + \| upright(bold(H)) \| zeta #scale(x: 120%, y: 120%)[\)] thin d nu_1 . $
  There is no boundary term because the support is in the interior of the larger patch. Apply it to $zeta = \| phi \|^4$ and use Cauchy–Schwarz on $4 \| phi \|^3 \| d phi \|$ and $\| upright(bold(H)) \| \| phi \|^4$ to obtain
  $ (integral \| phi \|^6 thin d nu_1)^(1 \/ 3) lt.eq C integral #scale(x: 120%, y: 120%)[\(] \| d phi \|_(A_1)^2 + \| upright(bold(H)) \|^2 phi^2 #scale(x: 120%, y: 120%)[\)] thin d nu_1 . $
  The zero function is harmless; otherwise this follows by dividing the intermediate inequality by $\( integral \| phi \|^6 thin d nu_1 \)^(1 \/ 2)$ and squaring. The already established metric, measure, and mean curvature comparisons yield (6.14). ◻
]

#thm([Lemma 6.5.])[
  (Normalized energy estimate).  #emph[There are polynomials $E_N$ and $s_0 \( N \) gt.eq 1$ such that on the first homotopy segment, for $s gt.eq s_0 \( N \)$ and any compactly supported base cutoff $psi$, 
#[#set math.equation(numbering: n => "(6.15)")
 $ integral psi^2 e^(2 s Z) #scale(x: 120%, y: 120%)[\(] cal(T) + s \| d Z \|_A^2 #scale(x: 120%, y: 120%)[\)] thin d nu lt.eq E_N \( 1 + s \) integral e^(2 s Z) \( psi^2 + \| d psi \|_g^2 \) thin d nu . $ <es:energy-form>]

 All constants are independent of $R$, $a$, and the solution.]
] <es:energy>

#proof[
  Put $B = e^t l$, $kappa = K_a \( w \, dot.op \)$ and $gamma = d log B = \( 1 + p \) d t$. Coercivity and $A lt.eq A_d$ show that
  #[#set math.equation(numbering: n => "(6.16)")
   $ \| gamma \|_A lt.eq B_N sqrt(cal(T)) \, #h(2em) \| kappa \|_A lt.eq C \, $ <es:logweight>]
  with $B_N$ polynomial. The boundedness of the weights in the penalty gives, globally, $Xi gt.eq delta_0 cal(T) - L_N$ for a polynomial $L_N$. Test $"div" V = u Xi$ with the nonnegative function $psi^2 e^(2 s Z) \/ B$. As $u \/ B = sqrt(D)$, exact differentiation gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ & integral psi^2 e^(2 s Z) Xi thin d nu + 4 s integral psi^2 e^(2 s Z) \| d Z \|_A^2 thin d nu\
 & = integral e^(2 s Z) #scale(x: 120%, y: 120%)[\[] psi^2 A \( gamma \, 2 d Z + kappa \) - 2 psi A \( d psi \, 2 d Z + kappa \) - 2 s psi^2 A \( kappa \, d Z \) #scale(x: 120%, y: 120%)[\]] thin d nu . $ <es:normalized-test>]
  For clarity, set $X = \| d Z \|_A$ and $Y = \| d psi \|_A lt.eq \| d psi \|_g$. Young’s inequality and (6.16) give the following pointwise bounds for the terms on the right:
  $ 2 B_N psi^2 sqrt(cal(T)) X & lt.eq 1 / 4 delta_0 psi^2 cal(T) + C delta_0^(- 1) B_N^2 psi^2 X^2 \,\
C B_N psi^2 sqrt(cal(T)) & lt.eq 1 / 4 delta_0 psi^2 cal(T) + C delta_0^(- 1) B_N^2 psi^2 \,\
4 \| psi \| Y X & lt.eq s psi^2 X^2 + 4 s^(- 1) Y^2 \,\
2 C \| psi \| Y & lt.eq C \( psi^2 + Y^2 \) \,\
2 C s psi^2 X & lt.eq s psi^2 X^2 + C s psi^2 . $
  Choose the polynomial threshold $s_0 gt.eq 1 + C delta_0^(- 1) B_N^2$, with its constant large enough that the first $X^2$ error is at most $s psi^2 X^2$. Substituting these five estimates into (6.17) leaves at least $delta_0 cal(T) \/ 2 + s X^2$ on its left and at most $P_N \( 1 + s \) \( psi^2 + Y^2 \)$ on its right, all multiplied by $e^(2 s Z)$. Absorbing the fixed factor $delta_0 \/ 2$ proves (6.15). ◻
]

=== 6.5 Iteration with a polynomial logarithmic bound <iteration-with-a-polynomial-logarithmic-bound>

#thm([Proposition 6.6.])[
  (Quantitative distortion).  #emph[For the choices in Lemma 29, every smooth solution of (6.1) with $t gt.eq - epsilon.alt$ and $R gt.eq R_min \( N \, epsilon.alt \)$ satisfies 
#[#set math.equation(numbering: n => "(6.18)")
 $ - epsilon.alt < t lt.eq Z lt.eq P_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| d f \|_g lt.eq exp \( P_N \) . $ <es:distortion-bound>]

 The polynomial is independent of the outer radius and the homotopy parameters. In particular, exhausting the exterior at fixed $N$ preserves these bounds.]
] <es:distortion>

#proof[
  First take $b = 1$ and write $Y = e^Z$. Choose nested core patches $U_r subset.double U_R$ with $1 \/ 2 lt.eq r < R lt.eq 1$, in uniform local coordinates, and cutoffs with $\| d psi \|_g lt.eq C \/ \( R - r \)$. Combining Lemmas 31 and 32, applied to $phi = psi e^(s Z)$, gives
  #[#set math.equation(numbering: n => "(6.19)")
   $ parallel Y parallel_(L^(6 s) \( U_r \, d nu \)) lt.eq #scale(x: 120%, y: 120%)[\[] C S_N E_N \( 1 + s \)^2 \( 1 + \( R - r \)^(- 2) \) #scale(x: 120%, y: 120%)[\]]^(1 \/ \( 2 s \)) parallel Y parallel_(L^(2 s) \( U_R \, d nu \)) . $ <es:one-step>]
  Indeed, differentiation of $psi e^(s Z)$ contributes at most $2 e^(2 s Z) \| d psi \|_A^2 + 2 s^2 psi^2 e^(2 s Z) \| d Z \|_A^2$; the latter integral is bounded by $2 s$ times (6.15). This accounts for the power $\( 1 + s \)^2$ in (6.19).
  Set $s_i = 3^i s_0$, take successive spatial gaps proportional to $b 2^(- i - 1)$, where $0 < b lt.eq 1$ is the total gap, and iterate (6.19). The product of constants has logarithm at most
  $ sum_(i = 0)^oo frac(log \( C S_N E_N \) + 2 log \( 1 + s_0 \) + C i + 2 log \( 1 \/ b \), 2 s_0 3^i) . $
  The identities
  $ sum_(i gt.eq 0) 3^(- i) = 3 / 2 \, #h(2em) sum_(i gt.eq 0) i 3^(- i) = 3 / 4 $
  therefore give
  #[#set math.equation(numbering: n => "(6.20)")
   $ log sup_(U_r) Y lt.eq frac(1, 2 s_0) log integral_(U_R) Y^(2 s_0) thin d nu + D_N / s_0 + C / s_0 log frac(1, R - r) \, $ <es:local-moser>]
  where $D_N lt.eq C \( 1 + log S_N + log E_N + log \( 1 + s_0 \) \) lt.eq P_N$. The limiting norm is the supremum because each individual solution and its positive smooth measure are smooth on the closure of the larger patch. No uniform bound for that individual supremum has been used to obtain (6.20).
  We next lower the initial integrability exponent explicitly. By Lemma 30, $integral_(U_R) Y thin d nu lt.eq e^(L_N)$ with $L_N$ polynomial. Put $M \( r \) = max \( 1 \, sup_(U_r) Y \)$ and $theta = 1 - 1 \/ \( 2 s_0 \)$. The inequality $Y^(2 s_0) lt.eq M \( R \)^(2 s_0 - 1) Y$ and (6.20) yield
  #[#set math.equation(numbering: n => "(6.21)")
   $ log M \( r \) lt.eq theta log M \( R \) + frac(L_N, 2 s_0) + D_N / s_0 + C / s_0 log frac(1, R - r) . $ <es:interpolation>]
  Choose increasing radii $r_j$ whose successive gaps are $c 2^(- j - 1)$ and whose limit lies strictly inside the larger patch. Iterating (6.21) $m$ times gives
  $ log M \( r_0 \) lt.eq theta^m log M \( r_m \) + sum_(j = 0)^(m - 1) theta^j (frac(L_N \/ 2 + D_N + C, s_0) + frac(C j, s_0)) . $
  The first term tends to zero: the supremum on that fixed larger patch is finite for the particular smooth solution. Moreover,
  $ sum_(j gt.eq 0) theta^j = 2 s_0 \, #h(2em) sum_(j gt.eq 0) j theta^j = frac(theta, \( 1 - theta \)^2) lt.eq 4 s_0^2 . $
  Consequently
  #[#set math.equation(numbering: n => "(6.22)")
   $ log M \( r_0 \) lt.eq C \( L_N + D_N + 1 + s_0 \) lt.eq P_N . $ <es:log-bound>]
  This computation is the required control of the parameter dependence: both iteration steps enlarge only a polynomial in the logarithm of the supremum. Uniform patches cover the entire enlarged core and the support of $K$, so (6.22) bounds $Z$ there with one polynomial independent of the number of patches.
  Outside this covered region $K = 0$. If $Z$ attained a larger maximum, exceeding also $Z_0$, the maximum would be interior since $Z = 0$ on the outer sphere. At such a point $V = 2 u A nabla Z$ and
  $ "div" V = 2 u "tr"_A nabla^2 Z lt.eq 0 \, #h(2em) u Xi gt.eq u rho > 0 $
  by (6.10), a contradiction. This proves the global upper bound on the first segment.
  On the second segment $a = 0$, the trace equation again gives $f = 0$ and $t = Z$. If $b > 0$, a positive interior maximum with $Z > max \( 0 \, - epsilon.alt + 1 \/ N \)$ has $m_0 = 0$, $d t = 0$, and hence $"div" V lt.eq 0 < b u rho$. Together with zero boundary values this is already a uniform upper bound. If $b = 0$, the transformed harmonic equation used in Lemma 29 gives $Z = 0$.
  Finally Lemma 29 makes the lower bound strict, (6.9) gives the warp bounds, and $D = e^(4 \( Z - t \)) lt.eq exp \( P_N \)$ gives $\| d f \|_g = sqrt(D - 1) \/ l lt.eq exp \( P_N \)$. Lemma 28 and $eta^(- 1) = e^(3 N epsilon.alt \/ 2)$ give $\| f \| lt.eq exp \( P_N \)$. This proves (6.18). ◻
]

The estimates above use only the extended metric and tensor in the filled region. The electromagnetic flux forms are needed solely on the original exterior, and none has been extended through a cap. The quantitative conclusions concern height, slope, and distortion; subsequent elliptic estimates at a fixed $N$ may have arbitrary dependence on that fixed parameter.

== 7 The elliptic construction and its physical end <so:section>

We prove the existence assertion needed for the filled comparison. Throughout this section the dimension is three, so that $k = 2$. We fix the prepared exterior, $epsilon.alt$, and then $N > max \( 2 \, 2 \/ epsilon.alt \)$. Constants in this section may depend on these fixed choices without a specified rate. The bounds whose dependence on $N$ matters are precisely those in Proposition 25, Lemma 29, and Proposition 33. In particular, none of the elliptic constants below is used as a polynomial bound in $N$. We use the scalar linear elliptic estimates, maximum principles, and degree theory in #cite(label("GilbargTrudinger2001")) Chapters 6, 8, 9, and 11. The special estimates for the present coupled system are proved below.

=== 7.1 A scalar estimate with a measurable axial coefficient <a-scalar-estimate-with-a-measurable-axial-coefficient>

The following estimate is the reason that the trace equation can be treated before the second unknown has a modulus of continuity. In its statement, the matrix $A$ acts on covectors using the metric.

#thm([Lemma 7.1.])[
  (The rough axial estimate).  #emph[Let $g$ range over metrics with uniform ellipticity and bounded local $C^2$ norms on a three-dimensional ball. Suppose that $z in C^2$, $\| z \| + \| d z \| lt.eq M$, and 
#[#set math.equation(numbering: n => "(7.1)")
 $ A : nabla^2 z = G \, #h(2em) A = I - \( 1 - chi \) e ⊗ e \, #h(2em) e = frac(nabla z, \| nabla z \|) \, #h(2em) 0 < c lt.eq chi lt.eq 1 \, #h(2em) \| G \| lt.eq M \, $ <so:axial-equation>]

 where the axis at a zero of $d z$ may be arbitrary. No continuity assumption on $chi$ is imposed. There are $alpha in \( 0 \, 1 \)$ and $C$ depending only on the displayed bounds and the patch geometry such that on every smaller patch 
#[#set math.equation(numbering: n => "(7.2)")
 $ \[ d z \]_(C^alpha) lt.eq C \, #h(2em) integral_(B_r \( x \)) \| nabla^2 z \|^2 thin d V_g lt.eq C r^(1 + 2 alpha) . $ <so:rough-estimates>]

 The same assertion holds up to a smooth face on which $z$ is constant; balls in the integral are then intersected with the domain. It is enough that $z$ be individually $C^1 ∩ W^(2 \, s)$ for every finite $s$ and $C^2$ up to each side of such a reflected face.]
] <so:rough-gradient>

#proof[
  We give the compactness and improvement arguments, including the treatment of the face. The identities involving third derivatives are distributional. For a $C^2$ function and metric their trace-reversed form follows by $C^2$ smoothing: the fluxes converge locally uniformly, the Hessian quadratics converge in $L^1$, and the Ricci terms converge locally uniformly. The original axial equation is substituted only after this identity has been established; neither $chi$ nor $G$ is differentiated or mollified. The same argument on each side of a face retains the normal flux jump. Thus the proof applies in particular to the $C^(2 \, alpha)$ functions arising in continuation below.
  #emph[A Hessian estimate above exponent two.] Normalize the metric at the center of a small coordinate ball. The coordinate principal matrix $a$ in Equation (7.1) satisfies
  $ \| I - a \|_(upright(F)) lt.eq 1 - c \/ 2 $
  after shrinking the ball by an amount determined by the metric bounds. For a compactly supported function $Y$ on Euclidean space, the Fourier transform gives $parallel D^2 Y parallel_2 = parallel Delta Y parallel_2$, where the matrix norm is Frobenius. The Calderón–Zygmund estimate at any fixed exponent larger than two #cite(label("GilbargTrudinger2001")) Theorem 9.9, interpolated with this identity, implies that the norm of $D^2 Delta^(- 1) : L^s arrow.r L^s$ tends to one as $s arrow.b 2$. Choose $s_0 > 2$ sufficiently close to two that this norm times $1 - c \/ 2$ is less than one. Writing $Delta Y = \( I - a \) : D^2 Y + a : D^2 Y$ and absorbing gives the global estimate. Apply it to $zeta Y$, and use
  $ parallel D Y parallel_(L^s \( B_r \)) lt.eq epsilon r parallel D^2 Y parallel_(L^s \( B_r \)) + C_epsilon r^(- 1) parallel Y parallel_(L^s \( B_r \)) . $
  Using intermediate balls and absorbing successively gives, for $2 lt.eq s lt.eq s_0$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ parallel D^2 Y parallel_(L^s \( B_(r \/ 2) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] parallel a : D^2 Y parallel_(L^s \( B_r \)) + r^(- 2) parallel Y parallel_(L^s \( B_r \)) #scale(x: 120%, y: 120%)[\)] . $ <so:cordes-local>]
  For clarity, the successive absorption uses radii tending geometrically from $r \/ 2$ to $r$: choose the interpolation coefficient smaller than the inverse of the geometric loss to the power $2 s$. The resulting series converges. This proves Equation (7.3) without a derivative of $a$.
  #emph[The trace-reversed identity.] In Euclidean coordinates put $H = D^2 z$, $q = 1 - chi$, and $W = \| D z \|^2 \/ 2$. Since $H e = D W \/ \| D z \|$ wherever $D z eq.not 0$, direct multiplication gives the identity, also valid when $D z = 0$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ A D W - G D z = \( H - \( "tr" H \) I \) D z \, #h(2em) "div" #scale(x: 120%, y: 120%)[\(] \( H - \( "tr" H \) I \) D z #scale(x: 120%, y: 120%)[\)] = \| H \|^2 - \( "tr" H \)^2 . $ <so:trace-reversed>]
  Moreover $"tr" H = q H \( e \, e \) + G$. Choose $\( 1 - c \)^2 < theta < 1$. Young’s inequality then gives
  $ \( "tr" H \)^2 lt.eq theta \| H \|^2 + C_c G^2 . $
  If $\| D z \| lt.eq 1$ and $S = 1 - \| D z \|^2$, we consequently have
  #[#set math.equation(numbering: n => "(7.5)")
   $ "div" \( A D S + 2 G D z \) lt.eq - kappa \| D^2 z \|^2 + C_c G^2 \, #h(2em) kappa > 0 . $ <so:deficit-inequality>]
  This is a divergence inequality with measurable coefficients; it has no $D chi$ term. Intrinsically the last member of Equation (7.4) gains $"Ric"_g \( nabla z \, nabla z \)$. Passing to coordinates with the volume density and replacing covariant by ordinary derivatives adds bounded flux and scalar errors. On rescaled balls whose metric tends to the Euclidean metric in $C^1$, whose smooth-side curvature tends to zero, and whose normalized forcing tends to zero, these errors have the form
  #[#set math.equation(numbering: n => "(7.6)")
   $ "div" \( a_1 D S + B \) lt.eq - kappa_1 \| nabla^2 z \|^2 + epsilon \, #h(2em) \| B \| lt.eq epsilon \, $ <so:small-deficit>]
  with fixed ellipticity constants and $epsilon arrow.r 0$.
  #emph[A gradient drop or entry into an affine regime.] Fix $0 < r_(*) < 1 \/ 32$. For every $b_0 > 0$ there exist $k_(*) in \( r_(*) \, 1 \)$ and an error tolerance $epsilon_(*) > 0$ such that a normalized solution on $B_1$, with $\| nabla z \| lt.eq 1$ and errors at most $epsilon_(*)$, satisfies one of
  #[#set math.equation(numbering: n => "(7.7)")
   $ sup_(B_(r_(*))) \| nabla z \| lt.eq k_(*) \; #h(2em) sup_(B_(r_(*))) \| z - L \| lt.eq b_0 r_(*) \, quad 1 / 2 lt.eq \| D L \| lt.eq 2 $ <so:drop-or-affine>]
  for an affine $L$. To prove this, suppose the assertion fails, let the errors tend to zero, and let the gradient supremum on $B_(r_(*))$ tend to one. The scalar weak Harnack inequality #cite(label("GilbargTrudinger2001")) Theorem 8.18, applied to the nonnegative supersolution $S$ in Equation (7.6), gives
  $ (frac(1, \| B_(1 \/ 3) \|) integral_(B_(1 \/ 3)) S^p)^(1 \/ p) lt.eq C #scale(x: 120%, y: 120%)[\(] inf_(B_(r_(*))) S + epsilon #scale(x: 120%, y: 120%)[\)] arrow.r 0 $
  for a fixed $p > 0$. Equation (7.3) gives a uniform local $L^2$ bound for $D S$. Here is the extra truncation step needed to retain the negative Hessian term. Testing the supersolution inequality by $zeta^2 \( b - S \)_(+)$ yields
  #[#set math.equation(numbering: n => "(7.8)")
   $ integral_({ S < b }) zeta^2 \| D S \|^2 lt.eq C b^2 integral \| D zeta \|^2 + C parallel B parallel_oo^2 + C epsilon b . $ <so:lower-truncation>]
  Indeed the derivative of $\( b - S \)_(+)$ contributes the negative of the elliptic energy on ${ S < b }$; the cutoff and $B$ terms are absorbed by Young’s inequality. Since $S arrow.r 0$ in measure, split $D S$ into the sets ${ S < b }$ and ${ S gt.eq b }$. The first has limiting $L^1$ norm at most $C b$ by Equation (7.8); the second has vanishing $L^1$ norm by the uniform $L^2$ bound and its vanishing measure. Thus $D S arrow.r 0$ locally in $L^1$. Testing Equation (7.6) with a fixed nonnegative cutoff now gives $D^2 z arrow.r 0$ locally in $L^2$. After subtraction of a constant, the gradient bound gives uniform compactness, and the limit is affine. Its slope has length one because $S arrow.r 0$ in measure. This contradicts failure of the second alternative in Equation (7.7).
  #emph[Improvement near a nonzero affine function.] Suppose on $B_1$ that $\| z - L \| lt.eq b lt.eq b_0$, $1 \/ 4 lt.eq \| D L \| lt.eq 4$, and the gradient is bounded by a fixed constant. Suppose also that metric oscillation, connection errors, and forcing are at most $b delta$. For $Y = \( z - L \) \/ b$, Equation (7.3) gives a uniform $W^(2 \, s_0)$ bound on smaller balls; its source is bounded by $C delta$. Put $e_0 = D L \/ \| D L \|$. The directions satisfy
  $ \| e ⊗ e - e_0 ⊗ e_0 \| lt.eq C min { 1 \, b \| D Y \| } + o \( 1 \) . $
  Hence they converge in measure to the fixed axis as $b_0 \, delta arrow.r 0$. Hölder’s inequality, with exponent $2 s_0 \/ \( s_0 - 2 \)$ for this bounded coefficient error, proves
  #[#set math.equation(numbering: n => "(7.9)")
   $ parallel R parallel_(L^2 \( B_(3 \/ 4) \)) arrow.r 0 \, #h(2em) R = \( Delta_(e_0^perp) + chi partial_(e_0)^2 \) Y . $ <so:frozen-residual>]
  Only the axis is frozen; $chi$ remains an arbitrary measurable function of position.
  There is a zero-Dirichlet correction $U in W^(2 \, 2) \( B_(3 \/ 4) \) ∩ W_0^(1 \, 2) \( B_(3 \/ 4) \)$ with
  $ \( Delta_(e_0^perp) + chi partial_(e_0)^2 \) U = R \, #h(2em) parallel U parallel_(W^(2 \, 2)) lt.eq C_c parallel R parallel_2 . $
  Indeed solve $U = Delta_D^(- 1) \( \( 1 - chi \) U_(e_0 e_0) + R \)$ by contraction in the Hessian norm. On a convex ball integration by parts gives
  $ integral \| D^2 U \|^2 lt.eq integral \( Delta U \)^2 \; $
  the difference is the boundary mean curvature times $\( partial_nu U \)^2$, which is nonnegative. Thus the contraction factor is at most $1 - c$. Poincaré’s inequality controls the lower derivatives. In dimension three the Sobolev embedding $W^(2 \, 2) arrow.r.hook C^(0 \, 1 \/ 2)$ gives $parallel U parallel_oo arrow.r 0$. This is the dimension-specific uniform correction required here.
  Write $Y_0 = Y - U$, and rotate so that $e_0$ is the third coordinate axis. Then $v = partial_3 Y_0 in W^(1 \, 2)$ satisfies
  #[#set math.equation(numbering: n => "(7.10)")
   $ partial_1^2 v + partial_2^2 v + partial_3 \( chi partial_3 v \) = 0 $ <so:axial-derivative>]
  distributionally: it is exactly the distributional derivative of $Delta_(e_0^perp) Y_0 + chi partial_3^2 Y_0 = 0$. The scalar divergence-form Hölder estimate #cite(label("GilbargTrudinger2001")) Chapter 8 and its energy inequality therefore give, on smaller balls,
  $ \[ v \]_(C^(alpha_1)) lt.eq C \, #h(2em) integral_(B_r) \| D v \|^2 lt.eq C r^(1 + 2 alpha_1) $
  for some $alpha_1 in \( 0 \, 1 \)$. Since $Delta Y_0 = \( 1 - chi \) partial_3 v = : F_0$, Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ integral_(B_r) \| F_0 \| lt.eq C r^(2 + alpha_1) . $ <so:newton-mass>]
  This also controls all the first derivatives of $Y_0$. To see the point explicitly, localize $F_0$ to a slightly larger ball and take its Newton potential $P$. In the difference $D P \( x \) - D P \( y \)$, with $h = \| x - y \|$, the two near regions have size bounded by $C sum_(j gt.eq 0) \( 2^(- j) h \)^(alpha_1) lt.eq C h^(alpha_1)$, by Equation (7.11). On the annuli of radius $r gt.eq 2 h$, the derivative of the gradient kernel is bounded by $C r^(- 3)$, giving $C h sum_(r = 2^j h) r^(alpha_1 - 1) lt.eq C h^(alpha_1)$. The remainder $Y_0 - P$ is harmonic. Its local norms are bounded by the already established $W^(2 \, 2)$ bound and the potential bound. Consequently $D Y_0$ is uniformly Hölder on an interior ball.
  Choose $0 < alpha_2 < alpha_1$, then a sufficiently small fixed $lambda in \( 0 \, 1 \/ 8 \)$ so that the Taylor error of $Y_0$ is at most $1 / 2 lambda^(1 + alpha_2)$. Finally choose $b_0$ and $delta$ so that the uniform correction is smaller than the other half. We obtain an affine $L'$ with
  #[#set math.equation(numbering: n => "(7.12)")
   $ sup_(B_lambda) \| z - L' \| lt.eq b lambda^(1 + alpha_2) \, #h(2em) \| D L' - D L \| lt.eq C b . $ <so:affine-improvement>]
  #emph[Iteration and the boundary interface.] In the improvement statement $b$ is an allowed upper bound for the error, and need not equal the actual error. Fix $b_0 \, delta \, lambda$ as above, decreasing $b_0$ so that $C b_0 \/ \( 1 - lambda^(alpha_2) \) < 1 \/ 4$, and then choose $k_(*) \, epsilon_(*)$ in Equation (7.7). Initially shrink to a radius $R_0$ and normalize the gradient by a fixed bound $Lambda_0$ so that all errors are at most $min \( epsilon_(*) \, b_0 delta \)$. After $j$ drops the physical radius and gradient normalization are $R_j = R_0 r_(*)^j$ and $Lambda_j = Lambda_0 k_(*)^j$. In particular the normalized forcing is $R_j G \/ Lambda_j$, and is multiplied by $r_(*) \/ k_(*) < 1$ at each drop. Metric and connection errors decrease at least by $r_(*)$ and curvature errors by $r_(*)^2$. At the first affine entry the physical radius is $R_e = r_(*) R_j$, with the same $Lambda_j$. Rescale that ball and apply Equation (7.12) with the prescribed upper bound $b = b_0$, even if the actual affine error is smaller. On iteration $i$ use $b_i = b_0 lambda^(i alpha_2)$. The forcing divided by $b_i$ is at most $delta lambda^(i \( 1 - alpha_2 \))$; the same comparison controls the connection errors. The slope increments are summable by the choice of $b_0$, so the axis remains separated from zero. Only constants are subtracted in the rescaled original equation, so its axis is always the actual gradient axis. These two regimes give uniform affine approximation of order $r^(1 + alpha)$, including the transition scale, for any sufficiently small
  $ 0 < alpha lt.eq min { alpha_2 \, log k_(*) \/ log r_(*) } . $
  The affine approximation criterion for Hölder gradients can also be seen directly: affine slopes at consecutive dyadic scales differ by $C r^alpha$, hence converge; comparing overlapping balls gives the same modulus between two centers. Thus the first estimate in Equation (7.2) follows. Subtract the first jet in Equation (7.3). Its error is $O \( r^(1 + alpha) \)$; connection terms are bounded. Squaring the resulting $L^2$ estimate proves the second estimate.
  For a face use Gaussian coordinates $\( x' \, x_3 \)$, subtract its constant value, reflect $z$ oddly and $g$ evenly. The reflected function is $C^1 ∩ W^(2 \, s)$, the metric is Lipschitz, and each smooth side has bounded curvature. The coordinate Hessian estimate applies unchanged. In the trace-reversed identity the only additional term is the jump of the normal flux at $x_3 = 0$. Since the tangential gradient vanishes there,
  $ #scale(x: 120%, y: 120%)[\(] \( nabla^2 z - \( Delta z \) g \) nabla z #scale(x: 120%, y: 120%)[\)] dot.op nu = - \( partial_nu z \) "tr"_T nabla^2 z . $
  The constant boundary value gives $\| "tr"_T nabla^2 z \| lt.eq C \| upright("II") \| thin \| d z \|$. Thus the jump of the density-weighted flux is a bounded plane density $J \( x' \)$, of size $C \| upright("II") \| thin \| d z \|^2$. It can be cancelled exactly by adding the coordinate vector $- J \( x' \) upright(bold(1))_({ x_3 > 0 }) partial_3$ to the flux; its divergence is $- J delta_({ x_3 = 0 })$, and no tangential derivative of $J$ is used. Under a spatial scale $R_j$ and gradient normalization $Lambda_j$, the normal flux jump becomes $R_j J \/ Lambda_j^2$. Since the current gradient bound is $\| d z \| lt.eq Lambda_j$, its size is at most $C R_j \| upright("II") \|$, also after any number of gradient drops. The smooth-side Ricci error is at most $C R_j^2 \| "Ric" \|$. Both therefore tend to zero independently of the shrinking gradient normalization. Hence Equation (7.6), the compactness alternative, and the affine improvement all remain valid across the face. This proves the boundary assertion. ◻
]

=== 7.2 Regularity of the two unknowns <regularity-of-the-two-unknowns>

#thm([Lemma 7.2.])[
  (A small potential estimate).  #emph[Let $M$ be a symmetric bounded measurable uniformly elliptic matrix on $B_r subset bb(R)^3$. If $\| B \| lt.eq C_0$ and a nonnegative finite measure $mu$ satisfies $mu \( B_s \( x \) \) lt.eq C_0 s^(1 + gamma)$ for some $0 < gamma < 1$, then the zero-Dirichlet solution of 
$ - "div" \( M D v \) = "div" B + mu $

 satisfies $parallel v parallel_oo lt.eq C \( r + r^gamma \)$. The assertion applies uniformly to smooth approximations of the data and hence to their weak limits.]
] <so:potential>

#proof[
  For the bounded flux part, scale to the unit ball. Testing by $\( v - k \)_(+)$ gives $integral_({ v > k }) \| D v \|^2 lt.eq C parallel B parallel_oo^2 \| { v > k } \|$. Sobolev’s inequality and the level-set iteration give $parallel v parallel_oo lt.eq C parallel B parallel_oo$ on the unit ball; the same argument for $- v$ gives the other sign. Rescaling gives $C r C_0$. For the measure part the scalar Dirichlet Green function has the bound $0 lt.eq G \( x \, y \) lt.eq C \| x - y \|^(- 1)$ for bounded measurable symmetric uniformly elliptic coefficients. This follows from the whole-space bound in #cite(label("LittmanStampacchiaWeinberger1963")) Theorem 7.1 and Equation (7.9) by domain comparison. The coefficients may be extended elliptically outside the ball; symmetry is preserved. Integrating on dyadic balls centered at $x$ gives
  $ integral G \( x \, y \) thin d mu \( y \) lt.eq C sum_(j gt.eq 0) \( 2^(- j) r \)^(- 1) \( 2^(- j) r \)^(1 + gamma) lt.eq C r^gamma . $
  For completeness the measure belongs to $H^(- 1)$: its Newton energy is bounded by the displayed potential bound times $mu \( B_r \)$, and the Newton energy identity bounds its action on $H_0^1$. Mollifications preserve the mass-growth bound uniformly. Indeed, at scales $s < epsilon$ their density is bounded by $C epsilon^(gamma - 2)$, so their mass is at most $C s^3 epsilon^(gamma - 2) lt.eq C s^(1 + gamma)$; at larger scales use the original bound on a ball enlarged by $epsilon$. The bounded divergence-data estimate can first be applied to smooth matrices and then passed to the weak solution by its energy bound. The measure approximations have uniformly bounded $H^(- 1)$ norm and uniformly bounded potentials, so weak $H_0^1$ compactness and weak-star $L^oo$ compactness give the same estimate for their limit. This proves the lemma. ◻
]

#thm([Proposition 7.3.])[
  (Coupled estimates).  #emph[On a fixed truncation, every smooth solution of the homotopy in Equation (5.32) satisfying $t gt.eq - epsilon.alt$ has local smooth bounds depending only on the fixed data and $N$. The bounds hold on uniformly sized interior patches and on outer Dirichlet half-patches, independently of a sufficiently large truncation radius. In particular there is a fixed exponent $alpha_0 > 0$ and a uniform local $C^(1 \, alpha_0)$ bound for $f$ and $C^(0 \, alpha_0)$ bound for $Z$.]
] <so:coupled-regularity>

#proof[
  The bounds in Proposition 33 give uniform ellipticity of $A_chi$ and boundedness of every smooth function of $x \, Z \, d f$ that occurs in the equations. The trace equation, divided by $l D^(- 1 \/ 2)$, is
  #[#set math.equation(numbering: n => "(7.13)")
   $ A_chi : nabla^2 f = sqrt(D) / l #scale(x: 120%, y: 120%)[\(] eta f - "tr"_(A_chi) K_a #scale(x: 120%, y: 120%)[\)] . $ <so:normalized-trace>]
  Its right side is bounded. Lemma 34 therefore bounds $d f$ in $C^alpha$ and gives $integral_(B_r) \| nabla^2 f \|^2 lt.eq C r^(1 + 2 alpha)$. The exact differential identity in Equation (5.18) gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ \| d t \| lt.eq C \( \| d Z \| + \| nabla^2 f \| + 1 \) . $ <so:t-derivative-bound>]
  Write the second equation as
  $ "div" \( M d Z + J \) = F_1 \, #h(2em) M = 2 u A_chi \, quad J = u A_chi K_a \( w \, dot.op \) . $
  Here $M$ is symmetric uniformly elliptic and $J$ is bounded. The quadratic formula for $cal(T)$ and Equation (7.14) imply
  #[#set math.equation(numbering: n => "(7.15)")
   $ \| F_1 \| lt.eq C \( 1 + \| d Z \|^2 \) + C \| nabla^2 f \|^2 . $ <so:natural-growth>]
  All volume densities and connection terms can be incorporated into $M \, J \, F_1$ without changing these assertions. Set $d mu = \( 1 + \| nabla^2 f \|^2 \) thin d x$. For a fixed $0 < gamma < min \( 1 \, 2 alpha \)$ this measure satisfies $mu \( B_r \) lt.eq C r^(1 + gamma)$.
  Choose a sufficiently large fixed $L$ and put $Q_plus.minus = e^(plus.minus L Z)$. For either sign the chain rule gives
  $ - "div" \( M d Q_plus.minus \) = "div" \( Q'_plus.minus J \) - Q'_plus.minus F_1 - Q''_plus.minus #scale(x: 120%, y: 120%)[\(] M \( d Z \, d Z \) + J dot.op d Z #scale(x: 120%, y: 120%)[\)] . $
  The range of $Z$ is bounded. Ellipticity and Young’s inequality show that the last term absorbs the quadratic term in Equation (7.15) if $L$ is large. Thus
  #[#set math.equation(numbering: n => "(7.16)")
   $ - "div" \( M d Q_plus.minus \) lt.eq "div" B_plus.minus + C mu \, #h(2em) \| B_plus.minus \| lt.eq C . $ <so:exponential-subsolutions>]
  By Lemma 35, subtracting the zero-Dirichlet potential of the right side on $B_r$ changes $Q_plus.minus$ by at most $C \( r + r^gamma \)$ and makes it a subsolution. The corrected supremum deficit is nonnegative and is a supersolution. Apply weak Harnack to that deficit. On at least half of $B_(r \/ 2)$, either $Z$ is below the midpoint of its range on $B_r$, or it is above that midpoint. In the first case the $Q_(+)$ deficit, and in the second the $Q_(-)$ deficit, is at least a fixed multiple of $"osc"_(B_r) Z$, up to the potential error. Weak Harnack then decreases one end of the range on $B_(r \/ 4)$ by a fixed fraction. More precisely,
  $ "osc"_(B_(r \/ 4)) Z lt.eq theta "osc"_(B_r) Z + C \( r + r^gamma \) \, #h(2em) 0 < theta < 1 . $
  Iteration proves a uniform Hölder modulus for $Z$. At an outer face both unknowns have zero trace. In flattened coordinates let $P = "diag" \( 1 \, 1 \, - 1 \)$. After incorporating the volume density, reflect by $Z^(-) = - Z^(+)$, $M^(-) = P M^(+) P$, $J^(-) = - P J^(+)$, and $F_1^(-) = - F_1^(+)$, where opposite-side values are evaluated at reflected points. The reflected total flux is $- P \( M^(+) d Z^(+) + J^(+) \)$, so its normal component has matching traces and creates no plane source. For the principal part this also follows from the vanishing tangential gradient on the constant-data face. In the actual application $K_a = 0$ near the outer face, hence $J = 0$ there. The equation and its growth estimate hold across the face, and the same oscillation argument applies there.
  The coefficients and right side of Equation (7.13) are now Hölder. Interior and Dirichlet Schauder estimates give $C^(2 \, alpha')$ bounds for $f$, with some $alpha' > 0$. Expanding the second equation, all derivatives of its coefficients are derivatives of smooth functions of $x \, Z \, d f$. Consequently it has the form
  #[#set math.equation(numbering: n => "(7.17)")
   $ M^(i j) partial_(i j) Z = H \( x \, Z \, d Z \) \, #h(2em) \| H \( x \, Z \, d Z \) \| lt.eq C \( 1 + \| d Z \|^2 \) \, $ <so:Z-nondivergence>]
  with a uniformly Hölder principal matrix. No bound for $d Z$ has been used to reach this point.
  Here is the absorption which supplies that bound. For $s > 3$ the local $W^(2 \, s)$ estimate for a Hölder principal matrix has a uniformly bounded leading constant on sufficiently small patches. On balls or constant-Dirichlet half-balls the scaled derivative interpolation inequality is
  #[#set math.equation(numbering: n => "(7.18)")
   $ parallel d Z parallel_(L^(2 s) \( Q \))^2 lt.eq C "osc"_(Q') Z thin parallel D^2 Z parallel_(L^s \( Q' \)) + C r^(3 \/ s - 2) \( "osc"_(Q') Z \)^2 \, $ <so:gradient-interpolation>]
  where $Q subset.double Q'$ are concentric patches of comparable radius $r$. It follows by applying the $L^oo$–$W^(2 \, s)$ interpolation inequality to a cutoff times $Z - c$; take $c$ between its maximum and minimum. For half-balls subtract the zero boundary value and reflect, or use a boundary cutoff in flattened coordinates. The Hölder modulus makes the oscillation coefficient as small as needed by fixing a sufficiently small patch radius. To justify absorption locally without any bound depending on the number of patches, let $X$ be the supremum of their $L^s$ Hessian norms. Each enlarged patch is covered by a fixed number of the smaller patches. The local estimate and Equation (7.18) give $X lt.eq 1 / 2 X + C$. This supremum is individually finite on every smooth compact truncation. Thus $X lt.eq 2 C$, independently of its radius. Sobolev embedding gives a Hölder gradient for $Z$. Schauder estimates applied to both equations now give second derivative bounds; differentiating gives bounds of every fixed order. The background geometry, end symbols, and outer sphere charts have uniform bounds at the chosen patch scale. The constants are therefore independent of the sufficiently large truncation radius. ◻
]

=== 7.3 The trace solve for arbitrary trials <the-trace-solve-for-arbitrary-trials>

#thm([Proposition 7.4.])[
  (The unrestricted trial trace problem).  #emph[Fix a smooth compact truncation $Omega_(N \, R)$, $a in \[ 0 \, 1 \]$, and $alpha in \( 0 \, 1 \)$. For every $Z in C^(1 \, alpha) \( overline(Omega_(N \, R)) \)$, including trials for which the implicit $t$ is below $- epsilon.alt$, there is a unique solution $f in C^(3 \, alpha) \( overline(Omega_(N \, R)) \)$ of 
$ "tr"_(A_chi) \( K_a + H^f \) = eta f \, #h(2em) f \|_(partial Omega_(N \, R)) = 0 . $

 The solution depends continuously on $\( a \, Z \)$ in $C^(2 \, alpha)$; bounded sets of trials have uniform bounds sufficient for this assertion. For $a = 0$ the solution is identically zero.]
] <so:trial-trace>

#proof[
  All constants here may depend on a bound for the trial’s $C^(1 \, alpha)$ norm and on this fixed domain. The global implicit relation in Equation (5.4) makes $t$, $l$, $D$, and $A_chi$ smooth functions of $\( x \, Z \, d f \)$, even at $d f = 0$. The normalized equation is
  $ A_chi : nabla^2 f - q f + sqrt(D) / l "tr"_(A_chi) K_a = 0 \, #h(2em) q = eta sqrt(D) / l > 0 . $
  Continue it from $Delta_g f = f$ by using, for $sigma in \[ 0 \, 1 \]$,
  #[#set math.equation(numbering: n => "(7.19)")
   $ A_sigma : nabla^2 f - q_sigma f + sigma sqrt(D) / l "tr"_(A_chi) K_a = 0 \, quad A_sigma = \( 1 - sigma \) I + sigma A_chi \, quad q_sigma = 1 - sigma + sigma q . $ <so:trace-continuation>]
  The coefficient of $f$ is strictly negative in this convention. At a positive maximum $d f = 0$, so $t = Z$, $D = 1$, and $A_chi = I$. The maximum principle gives
  $ \| f \| lt.eq H := eta^(- 1) parallel "tr"_g K parallel_oo $
  for the entire continuation. If $K = 0$ it gives $f = 0$.
  We prove a gradient bound before using uniform ellipticity. Write $s = \| d f \|$. When $s arrow.r oo$ with $Z$ in a bounded interval, the implicit equation forces $t arrow.r - oo$. There $p = N$ and $l = e^(N t)$, and the defining equation gives
  #[#set math.equation(numbering: n => "(7.20)")
   $ t = - frac(log s, N + 2) + O \( 1 \) \, #h(2em) d asymp s^(- 4 \/ \( N + 2 \)) \, #h(2em) chi gt.eq frac(c, 1 + s) \, #h(2em) sqrt(D) / l lt.eq C \( 1 + s \) . $ <so:large-trial-slope>]
  These estimates are uniform for bounded trial values; on a bounded $s$ interval they follow from smoothness and positivity. The lower bound for $chi$ uses $N > 2$. Notice that it does not use the floor. The axial eigenvalue $chi_sigma = 1 - sigma + sigma chi$ obeys the same lower bound, while both transverse eigenvalues equal one. Since $\| f \| lt.eq H$, Equation (7.19) has normalized source of absolute value at most $C \( 1 + s \)$.
  Take a short fixed collar of the boundary and a smooth extension of the background metric across it. Choose a concave increasing modulus
  $ psi \( d \) = K_0^(- 1) log \( 1 + K_0 M d \) \, #h(2em) psi'' = - K_0 \( psi' \)^2 . $
  First choose $K_0$ sufficiently large depending on the source and geometry bounds. Then choose a sufficiently short $d_0$ and a sufficiently large $M$ so that $psi' gt.eq 1$ on $\[ 0 \, d_0 \]$ and $psi \( d_0 \) > 2 H$. Such choices are compatible: one can first make $K_0 d_0 < 1 \/ 2$ and then let $M arrow.r oo$. For the distance $d$ to the boundary, the Hessian in its gradient axis is $psi''$; the transverse trace is bounded by $C psi'$. Equation (7.20) gives
  $ chi_sigma psi'' + C psi' lt.eq - c K_0 frac(\( psi' \)^2, 1 + psi') + C psi' lt.eq \( - c K_0 \/ 2 + C \) psi' . $
  For large $K_0$ this is strictly more negative than the possible source. The negative barrier has the opposite strict inequality. At a first contact the gradients agree, and hence all the coefficients depending on the gradient agree. The strict sign and positivity of $q_sigma$ therefore exclude contact. The boundary values and the choice $psi \( d_0 \) > H$ give
  #[#set math.equation(numbering: n => "(7.21)")
   $ \| f \( x \) \| lt.eq psi \( "dist" \( x \, partial Omega_(N \, R) \) \) quad upright("in the collar") . $ <so:trace-face-modulus>]
  For the interior consider $f \( x \) - f \( y \) - psi \( "dist" \( x \, y \) \)$ for distances at most $d_0$, using the short geodesic distance in the smooth extended metric. The value is nonpositive on the diagonal, at distance $d_0$, and whenever one endpoint lies on the boundary, the last assertion by Equation (7.21) and monotonicity of $psi$. At a hypothetical positive interior maximum the endpoint gradients are parallel along the short geodesic and have the same magnitude $psi'$. Write $e_x \, e_y$ for that common transported direction. Varying just the first endpoint in its axial direction and then just the second endpoint gives, respectively,
  $ nabla^2 f_x \( e_x \, e_x \) lt.eq psi'' \, #h(2em) nabla^2 f_y \( e_y \, e_y \) gt.eq - psi'' . $
  Paired parallel transverse endpoint variations, summed over the two transverse directions, give
  $ "tr"_(e_x^perp) nabla^2 f_x - "tr"_(e_y^perp) nabla^2 f_y lt.eq C "dist" \( x \, y \) psi' . $
  This last bound is the second variation of the short geodesic length; the endpoint Jacobi fields have equal parallel initial and final values, and their index forms are bounded by curvature times its length. Thus the difference of the principal operators is at most
  #[#set math.equation(numbering: n => "(7.22)")
   $ \( chi_sigma \( x \) + chi_sigma \( y \) \) psi'' + C d_0 psi' lt.eq \( - c K_0 + C d_0 \) psi' . $ <so:different-axial-values>]
  The right sides of the two equations have difference bounded below by $- 2 C \( 1 + psi' \)$. Increasing $K_0$ gives a contradiction. Crucially, Equation (7.22) uses the two axial coefficients separately; no modulus of $chi \( x \) - chi \( y \)$ is assumed. We conclude $\| f \( x \) - f \( y \) \| lt.eq psi \( "dist" \( x \, y \) \)$ for short distances, and hence $\| d f \| lt.eq M$.
  Uniform ellipticity now follows from this gradient bound. The matrix $A_sigma$ still has precisely the structure of Lemma 34, and its right side is bounded. That lemma gives a Hölder gradient. Schauder estimates then give $C^(2 \, beta)$ bounds for some $beta > 0$. At this stage $d f$ is Lipschitz, and the prescribed $Z$ is $C^(1 \, alpha)$, so the coefficients and source of Equation (7.19) are $C^alpha$. Schauder estimates give $C^(2 \, alpha)$ bounds. Differentiating the equation and applying the same estimates, with the boundary estimates for tangential derivatives followed by the equation for the normal second derivative, gives $C^(3 \, alpha)$ bounds.
  The linearization in $f$ is uniformly elliptic with Hölder coefficients, bounded first-order terms, and zero-order term $- q_sigma < 0$. Derivatives of the gradient-dependent coefficients produce only first-order terms, because those coefficients do not depend on the value of $f$. The Dirichlet maximum principle and linear Schauder solvability make this linearization an isomorphism $C_0^(2 \, alpha) arrow.r C^(0 \, alpha)$. The implicit function theorem gives openness of the set of continuation parameters. The uniform $C^(3 \, alpha)$ bounds give compactness in $C^(2 \, alpha)$ and hence closedness. At $sigma = 0$ the unique solution is zero, so the set is all of $\[ 0 \, 1 \]$. If two solutions of the final equation differed, a positive maximum of their difference would have matching gradients and an ordered Hessian, while their common $q$ is positive. This contradicts the equations. Thus the solution is unique. Finally the same implicit function theorem, now with parameters $\( a \, Z \)$, gives the asserted continuous dependence. Its local branches agree globally by uniqueness. ◻
]

=== 7.4 The compact map and the floor <the-compact-map-and-the-floor>

#thm([Theorem 7.5.])[
  (Filled solver and normalized end).  #emph[For the choices in Section 5, Lemma 29, and Proposition 33, every sufficiently large $N$ admits a smooth solution $\( f \, Z \)$ of Equation (5.30) on the complete filled manifold $Omega_N$. It satisfies 
$ - epsilon.alt < t lt.eq Z lt.eq cal(P)_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| d f \| lt.eq exp \( cal(P)_N \) . $

 The height estimates of Lemma 28 also hold. On the physical end, for each fixed integer $j gt.eq 0$ there are $c_j \, C_j > 0$, allowed to depend on $N$, such that 
#[#set math.equation(numbering: n => "(7.23)")
 $ f = O_j \( e^(- c_j r) \) \, #h(2em) t \, Z = O_j \( r^(- 1) \) \, #h(2em) Delta_g t = O \( r^(- 3 - beta) \) . $ <so:physical-end>]

 In particular both end constants are zero. The solution is obtained by exhausting the outer Dirichlet radius with $N$ fixed. For the resulting solution $u Xi$ is absolutely integrable, $u arrow.r 1$, and the penalty vanishes sufficiently far out on the end.]
] <so:filled-solver>

#proof[
  Fix $R gt.eq R_min \( N \)$ as in Lemma 28. Parametrize the homotopy by $lambda in \[ 0 \, 2 \]$:
  $ \( a \( lambda \) \, b \( lambda \) \) = cases(delim: "{", \( 1 - lambda \, 1 \) \, & 0 lt.eq lambda lt.eq 1 \,, \( 0 \, 2 - lambda \) \, & 1 lt.eq lambda lt.eq 2 .) $
  All quantities in the trace and scalar identities use $K_a = a K$; the divergence equation is $"div" V = b thin u Xi$. Let $X = C_0^(1 \, alpha) \( overline(Omega_(N \, R)) \)$ for a fixed $alpha in \( 0 \, 1 \)$. For a trial $Z in X$ solve the trace equation by Proposition 37, and evaluate $t \, w \, u \, A_chi \, cal(T)$ and $Xi$ at this pair. Define $T_lambda Z = Y$ by the linear zero-Dirichlet equation
  #[#set math.equation(numbering: n => "(7.24)")
   $ "div" \( 2 u A_chi d Y \) = b thin u Xi - "div" \( u A_chi K_a \( w \, dot.op \) \) . $ <so:compact-map>]
  Only the gradient of the new unknown $Y$ is left unfrozen. On a bounded set of trials, Proposition 37 bounds $f$ in $C^(2 \, alpha)$, and all implicit coefficients have bounded $C^(1 \, alpha)$ norms. The scalar right side has bounded $C^(0 \, alpha)$ norm, since $d t$ is computed from Equation (5.18). Ellipticity is uniform on that bounded set by the trial gradient estimate, even when $t < - epsilon.alt$. Linear Dirichlet Schauder theory gives a uniform $C^(2 \, alpha)$ bound for $Y$. Thus $\( lambda \, Z \) mapsto T_lambda Z$ is continuous and compact into $X$. At a fixed point the linear solve first gives $Z in C^(2 \, alpha)$, whereas the trace solution is already $f in C^(3 \, alpha)$. Thus $Xi in C^(1 \, alpha)$ and the principal coefficient and drift flux are $C^(2 \, alpha)$. Schauder estimates give $Z in C^(3 \, alpha)$, and the trace equation gives $f in C^(4 \, alpha)$. Repeating gives smoothness. In particular the coupled a priori estimates apply to individually smooth fixed points; their eventual bounds for all fixed derivative orders control the chosen $X$ norm, regardless of its initially prescribed exponent $alpha$.
  Choose a radius $M_X$ larger than the $X$ norm of every above-floor fixed point, which is possible by Proposition 36 and the fixed truncation. Consider the relatively open bounded set
  #[#set math.equation(numbering: n => "(7.25)")
   $ cal(U) = { \( lambda \, Z \) : parallel Z parallel_X < M_X \, med min_(overline(Omega_(N \, R))) t \[ Z \, d f \[ a \( lambda \) \, Z \] \] > - epsilon.alt } . $ <so:moving-domain>]
  Its openness follows from the continuous dependence in Proposition 37. A fixed point cannot occur at its norm boundary by the choice of $M_X$. At its other boundary it would have minimum $t = - epsilon.alt$ and would be above the closed floor. Lemma 28 excludes such a minimum on the outer boundary; Lemma 29 excludes it in the interior. There is no inner boundary in the filled manifold.
  For completeness the variation of the domain in Equation (7.25) presents no degree obstruction. The images of the bounded parameter-trial cylinder under $T$ have compact closure. Therefore any convergent sequence of parameters and associated boundary fixed points would converge to a boundary fixed point, already excluded. Around any fixed parameter the compact set of its fixed points has an open neighborhood whose closure lies inside its slice of $cal(U)$. By compactness the same neighborhood contains every fixed point in the relevant slices for all sufficiently nearby parameters; otherwise a contrary sequence converges to an excluded fixed point. Excision and the usual fixed-domain homotopy invariance of Leray–Schauder degree show that the degrees on the slices are locally constant. A finite interval covering makes them constant along the full path. At $lambda = 2$ we have $K_a = 0$, $f = 0$, and $b = 0$. The linear solve in Equation (7.24) is therefore identically zero for every trial. Its sole fixed point is $Z = 0$, with $t = 0 > - epsilon.alt$, and the degree of $I - T_2$ on the terminal slice is one. Hence the initial slice has degree one and contains a fixed point. This proves existence on every sufficiently large truncation, with the estimates already established.
  We next verify the end before taking the exhaustion limit. All bounds in the remainder of the proof are uniform in the truncation radius at this fixed $N$. Outside a fixed sphere $K = 0$, so Equation (7.13) is the homogeneous proper equation
  #[#set math.equation(numbering: n => "(7.26)")
   $ A_chi : nabla^2 f - q \( x \) f = 0 \, #h(2em) q \( x \) = eta sqrt(D) / l gt.eq eta \/ e > 0 . $ <so:end-trace>]
  The eigenvalues of $A_chi$ stay in a fixed positive interval. For a sufficiently small fixed $c > 0$, the functions $C e^(- c \( r - r_0 \))$ have $\( A_chi : nabla^2 - q \) C e^(- c \( r - r_0 \)) < 0$ for $r_0$ sufficiently large. Indeed their Hessian is bounded by $C \( c^2 + c \/ r \) e^(- c \( r - r_0 \))$, whereas the zero-order term is at least $\( eta \/ e \) C e^(- c \( r - r_0 \))$. Choose $c$ first, then $r_0$. The negatives give the opposite inequality. Choose $C$ to dominate the uniformly bounded values on $r = r_0$; the outer Dirichlet data are zero. Comparison gives $\| f \| lt.eq C e^(- c r)$ on every truncated end. The local estimates in Proposition 36 give uniform smooth coefficients for Equation (7.26); its interior and boundary estimates then give exponential decay of every fixed derivative of $f$. Alternatively, interpolation between this exponential height bound and the uniform higher derivative bounds gives the same conclusion, with a possibly smaller positive exponent for each order. The implicit relation implies that $t - Z$ and its fixed derivatives are exponentially small.
  On the bounded fixed-$N$ range of $Z$, define the smooth increasing function $Phi$ by
  #[#set math.equation(numbering: n => "(7.27)")
   $ Phi \( 0 \) = 0 \, #h(2em) Phi' \( 0 \) = 1 \, #h(2em) frac(Phi'' \( z \), Phi' \( z \)) = 1 + p \( z \) - delta_0 s_(p \( z \)) \, #h(2em) s_p = p + 1 / 2 . $ <so:poisson-change>]
  Its derivative is bounded above and away from zero on that range. Putting $f = K = 0$ in Lemma 27 gives exactly
  $ 2 Delta_g Z + 2 #scale(x: 120%, y: 120%)[\(] 1 + p \( Z \) - delta_0 s_(p \( Z \)) #scale(x: 120%, y: 120%)[\)] \| d Z \|^2 = rho - theta.alt \( N \( Z + epsilon.alt \) \) C_N rho_0 . $
  The exponential bounds just proved and the uniform local derivative bounds show that the actual end equation differs from this one by $O_j \( e^(- c_j r) \)$ for every fixed order. Thus
  #[#set math.equation(numbering: n => "(7.28)")
   $ \| Delta_g Phi \( Z \) \| lt.eq C r^(- 3 - beta) \, #h(2em) Phi \( Z \) \|_(r = R) = 0 . $ <so:transformed-poisson>]
  This scalar Poisson bound is independent of the radius $R$.
  Here are explicit barriers fixing the end constant. Put $gamma = beta \/ 2$ and, after increasing $r_0$, let $W \( r \) = r^(- 1) - r^(- 1 - gamma) > 0$. The prepared metric has $g - delta = O_j \( r^(- 1) \)$. Since $Delta_delta r^(- 1) = 0$ and $Delta_delta r^(- 1 - gamma) = gamma \( 1 + gamma \) r^(- 3 - gamma)$,
  $ Delta_g W lt.eq - c_gamma r^(- 3 - gamma) $
  for large $r_0$. Choose a constant multiple of $W$ to dominate the inner boundary values and the right side of Equation (7.28); this is possible because $gamma < beta$. The zero outer boundary values lie between the positive and negative barriers. The maximum principle therefore gives $\| Phi \( Z \) \| lt.eq C r^(- 1)$, and the bounds for $Phi'$ give
  #[#set math.equation(numbering: n => "(7.29)")
   $ \| Z \| + \| t \| lt.eq C r^(- 1) $ <so:zero-end-constant>]
  on every truncated end. In particular no undetermined additive constant is introduced in the exhaustion.
  We record the derivative decay rather than infer it from an unscaled estimate. Rescale an annulus of radius $r$ to unit size. The bounded right side of Equation (7.28) and Equation (7.29) give, by local Poisson $W^(2 \, s)$ estimates for $s > 3$, $\| d Phi \( Z \) \| lt.eq C r^(- 2)$ and a scaled Hölder bound for its gradient. The exponentially small error has all unscaled derivatives exponentially small, so it remains negligible after this rescaling. The other right-side term is a smooth function of $Z$ times the prescribed weight $rho_0$; its scaled Hölder norms are bounded by $C r^(- 3 - beta)$. Schauder estimates give $D^2 Z = O \( r^(- 3) \)$. Differentiating the transformed equation and repeating the scaled estimates inductively gives $Z = O_j \( r^(- 1) \)$ for every fixed $j$. Since $t - Z$ is exponential, the same holds for $t$. Finally the untransformed equation gives
  $ Delta_g t = O \( r^(- 3 - beta) \) + O \( \| d Z \|^2 \) + O \( e^(- c r) \) = O \( r^(- 3 - beta) \) \, $
  because $beta < 1$ and $\| d Z \|^2 = O \( r^(- 4) \)$.
  Take any sequence $R arrow.r oo$. The compact-patch estimates and a diagonal subsequence give a smooth solution on $Omega_N$, with all bounds above and the stated end estimates. Initially the limit has $t gt.eq - epsilon.alt$. If equality held at a point, it would be an interior minimum of a smooth solution and the same strict contradiction in Lemma 29 would apply. Hence $t > - epsilon.alt$. No limit in $N$ has been taken. Since $Z arrow.r 0$ and $N epsilon.alt > 2$, the cutoff $theta.alt \( N \( t + epsilon.alt \) \)$ vanishes sufficiently far out. The exact zero-trace expression for $cal(T)$ and the exponential trace error give $cal(T) = O \( r^(- 4) \) + O \( e^(- c r) \)$ there. Also $eta a_w \| d f \|$ is exponential, $rho = O \( r^(- 3 - beta) \)$, and $u = e^Z l \( Z \) + O \( e^(- c r) \) arrow.r 1$. These functions are integrable over the three-dimensional end, and smoothness handles the compact part. Thus $u Xi in L^1 \( Omega_N \)$ and the final assertions follow. ◻
]

== 8 Charged comparison and the numerical inequality <cp:section>

We first fix one strict rest exterior supplied by Proposition 22. In this section $g \, K \, cal(E) \, cal(B)$ denote these prepared data, $E_(*)$ is their ADM energy, and their ADM momentum is zero. The tensor $K$ has compact support. The end has the strong metric and field decay required below, and, with the geometric density conventions of Definition 1,

#[#set math.equation(numbering: n => "(8.1)")
 $ D_g \( Y \) := mu + J \( Y \) - I_g \( Y \) > 2 rho \, #h(2em) \| Y \|_g lt.eq 1 \, #h(2em) rho = c_(*) r^(- 3 - beta) > 0 \, $ <cp:strict-margin>]

where

$ I_g \( Y \) = \| cal(E) \|_g^2 + \| cal(B) \|_g^2 + 2 \( cal(E) times cal(B) \) dot.op Y \, #h(2em) 0 < beta < 1 . $

On each boundary component a fixed sign $sigma_i in { 1 \, - 1 }$ satisfies $H + sigma_i "tr"_S K < 0$. The argument treats these signs component by component.

Fix $0 < epsilon.alt < 1$. We use the filled manifold $Omega_N$, its background metric $g_N$, and all the quantities of Section 5; thus $g_N = g$ on the original exterior. The dimension is three and $k = 2$. In particular,

#[#set math.equation(numbering: n => "(8.2)")
 $ ell = e^(- N epsilon.alt) \, #h(2em) eta = ell^(3 \/ 2) \, #h(2em) h = eta f \, #h(2em) macron(g) = g_N + l^2 d f^2 \, #h(2em) hat(g) = e^(2 t) macron(g) . $ <cp:parameters>]

At each $N$ we first exhaust the outer Dirichlet boundary as in Theorem 38. Every assertion below concerns the resulting smooth solution on $Omega_N$. A symbol $cal(P)_N$ denotes a positive polynomial bound in $1 + N$, whose coefficients may depend on this prepared exterior and on $epsilon.alt$. Different occurrences may denote different such bounds.

The quantitative inputs from Lemma 28 and Proposition 33 are

#[#set math.equation(numbering: n => "(8.3)")
 $ - epsilon.alt < t lt.eq Z lt.eq cal(P)_N \, #h(2em) ell lt.eq l lt.eq e \, #h(2em) \| f \| + \| d f \|_(g_N) lt.eq e^(cal(P)_N) \,\
\| h \| lt.eq C \, #h(2em) \| h \| lt.eq C r^(- b_1) med upright("on the end") \, #h(2em) 3 / 4 < b_1 < 1 . $ <cp:quantitative-inputs>]

The constants in the height bounds are independent of $N$. The filled backgrounds have uniform local geometry, and the volume of their enlarged compact part is $O \( 1 + N \)$. Higher derivative estimates will only be used with $N$ fixed.

=== 8.1 The end flux and its small negative part <the-end-flux-and-its-small-negative-part>

#thm([Lemma 8.1.])[
  (Mass cost of the filled deformation).  #emph[The metric $hat(g)$ has a well-defined ADM energy and 
#[#set math.equation(numbering: n => "(8.4)")
 $ E \( hat(g) \) = E_(*) - frac(frak(F)_N, 8 pi) \, #h(2em) frak(F)_N = integral_(Omega_N) u Xi thin d V_(g_N) = lim_(R arrow.r oo) integral_(r = R) g_N \( V \, nu_R \) thin d A_(g_N) . $ <cp:mass-flux>]

 There is a nonnegative sequence $a_N$ such that 
#[#set math.equation(numbering: n => "(8.5)")
 $ E \( hat(g) \) lt.eq E_(*) + a_N \, #h(2em) a_N lt.eq cal(P)_N \( ell + ell^(1 \/ 2) \) arrow.r 0 . $ <cp:mass-error>]

]
] <cp:mass-cost>

#proof[
  The end conclusion of Theorem 38 gives, at fixed $N$, exponential decay of $f$ and each of its fixed-order derivatives, and
  $ t \, Z = O_j \( r^(- 1) \) \, #h(2em) t - Z = O_j \( e^(- c_j r) \) \, #h(2em) Delta_g t = O \( r^(- 3 - beta) \) . $
  Here the constants and the positive $c_j$ may depend on $N$. Since $K = 0$ sufficiently far out, $cal(T) = O \( r^(- 4) \)$ up to exponentially decaying terms, $u = 1 + O \( r^(- 1) \)$, and $eta a_w \| d f \|$ decays exponentially. For $N epsilon.alt > 2$, the penalty cutoff $m_0 = theta.alt \( N \( t + epsilon.alt \) \)$ vanishes sufficiently far out. Consequently $u Xi$ is absolutely integrable. The divergence equation and the absence of any boundary in $Omega_N$ prove the flux identity in Equation (8.4).
  The definition of $V$, $A_chi = "Id" + O_j \( e^(- c_j r) \)$, and the same end estimates show that
  $ V = 2 nabla t + O \( r^(- 3) \) + O \( e^(- c r) \) . $
  Thus its limiting flux is twice the limiting flux of $d t$. The graph term $l^2 d f^2$ makes no contribution to ADM energy. Direct substitution of $e^(2 t) g$ into the ADM integral gives
  $ E \( e^(2 t) g \) - E \( g \) = - frac(1, 4 pi) lim_(R arrow.r oo) integral_(r = R) partial_(nu_R) t thin d A_g . $
  The terms containing $\( g - delta \) d t$, $t thin partial g$, or $t thin d t$ have integrals $O \( R^(- 1) \)$; changing between Euclidean and $g$ normals and measures has the same vanishing cost. This proves the coefficient and sign in Equation (8.4) without requiring a separately chosen monopole coefficient for $t$.
  It remains to estimate the possibly negative part of the integral. Write $sigma = \| d f \|_(g_N)$. On the support of $m_0$ the floor gives $- epsilon.alt < t < - epsilon.alt + N^(- 1)$, and therefore $ell lt.eq l lt.eq e ell$ for large $N$. Since $u = e^t l sqrt(D)$ and $D = 1 + l^2 sigma^2$, direct calculation gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ u lt.eq C \( ell + ell^2 sigma \) \, #h(2em) u v lt.eq C ell^2 sigma \, #h(2em) u a_w sigma = e^t l^2 sigma^2 gt.eq c ell^2 sigma^2 . $ <cp:penalty-weights>]
  The negative term in $u Xi$ is consequently bounded in absolute value by
  $ cal(P)_N ell rho_0 + cal(P)_N ell^2 sigma \( rho_0 + rho_1 \) . $
  Young’s inequality, using a fixed fraction of the positive $delta_0 eta u a_w sigma$, bounds the second summand by
  $ frac(delta_0 eta, 2) u a_w sigma + cal(P)_N ell^2 / eta \( rho_0^2 + rho_1^2 \) . $
  Here $rho_0 = r^(- 3 - beta)$ and $rho_1 = r^(- 2 b_1)$. Their required integrals have polynomial bounds: the compact contribution is $O \( 1 + N \)$, while on the end $rho_0$, $rho_0^2$, and $rho_1^2$ are integrable, the last because $4 b_1 > 3$. In particular, no integral of $rho_1$ is being assumed finite. Positivity of $cal(T)$, proved in Proposition 25, now gives
  $ frak(F)_N gt.eq - cal(P)_N (ell + ell^2 / eta) = - cal(P)_N \( ell + ell^(1 \/ 2) \) . $
  Equation (8.5) follows. ◻
]

=== 8.2 Separating the filling by height <separating-the-filling-by-height>

#thm([Lemma 8.2.])[
  (The collar and cap height gap).  #emph[The product lengths in Lemma 23 can be chosen of order $O \( 1 + N \)$ so that a number $b_2 > 0$, independent of $N$, has the following property for all large $N$. On each cap, its product neck, and the associated original boundary component, 
#[#set math.equation(numbering: n => "(8.7)")
 $ sigma_i h < - b_2 . $ <cp:signed-height>]

 The inequality also holds on a neighborhood of that boundary component.]
] <cp:height-gap>

#proof[
  We give the construction when $sigma_i = 1$. Use the signed collar coordinate $s$ increasing toward the original end. Choose a small fixed number $d_0 > 0$. On the cap put the comparison height equal to $- d_0$. There $K = - L_0 g_N$, so the trace of $K$ in $A_chi$ is $- L_0 \( 2 + chi \)$ and this constant height is a supersolution once $L_0$ is large.
  On the adjoining product cylinder choose a nonnegative slope $a \( s \)$ which starts at zero, becomes a truncated increasing exponential, and ends at a small fixed positive value $a_0$. It can be arranged that
  $ \| a' \( s \) \| lt.eq C \( a \( s \) + eta \) \, #h(2em) integral a \( s \) thin d s < d_0 \/ 8 . $
  Indeed, grow exponentially from a value of order $eta$ to $a_0$, smoothly cutting off near the first value and making the last value constant. The required length is $O \( 1 + \| log eta \| \) = O \( 1 + N \)$, and the integral is bounded by a fixed multiple of $a_0$. Let $H_0 \( s \)$ be the resulting height, starting at $- d_0$.
  For a height test $H_0$, the Hessian tensor in the trace equation is
  $ frac(nabla^2 H_0, sqrt(\( eta \/ l \)^2 + \| d H_0 \|^2)) . $
  On a product cylinder only its axial entry can be nonzero. The bound on $a'$ gives
  $ frac(\| a' \|, sqrt(\( eta \/ l \)^2 + a^2)) lt.eq C \( 1 + l \) lt.eq C \( 1 + e \) . $
  Multiplication by $chi lt.eq 1$ can only improve this estimate. A fixed choice of $L_0$ therefore makes $H_0$ a supersolution on the entire product, including its small-slope starting portion.
  Continue with a small fixed positive slope through the fixed transition and up to $S$, keeping the total increase below $d_0 \/ 4$. On these leaves the prepared extension satisfies $H_s + "tr"_(S_s) K < 0$. Increase the slope within the fixed strict collar on the exterior side until the test height exceeds the uniform bound $C$ in Equation (8.3) at its outer face. All slopes on these fixed transitions are bounded below by a fixed positive number, and all their derivatives are fixed. At a putative comparison contact the gradients of the solution and the test agree, so the solution’s floor gives $eta \/ l lt.eq eta \/ ell = ell^(1 \/ 2)$. At such contacts the transverse Hessian trace converges uniformly to $H_s$, while $chi arrow.r 0$ uniformly and the axial Hessian contribution vanishes. Thus the full test trace converges uniformly to $H_s + "tr"_(S_s) K$. First choose $d_0$ smaller than the absolute strict expansion bound on these fixed collars, and then choose $N$ large. The trace is then below $- d_0$, hence below the test height, at every possible contact in the remaining ramp.
  For completeness, the comparison uses the actual solution $Z$ as a fixed function. At a positive maximum of $h - H_0$, their gradients agree, so the defining equation for $t$ gives the same $t$ and the same positive matrix $A_chi$ for both functions. Their Hessians are ordered. Consequently $F \[ h \] lt.eq F \[ H_0 \] lt.eq H_0 < h$, contradicting $F \[ h \] = h$. There is no inner boundary, and the test dominates on the outer collar face. It follows that $h lt.eq H_0$, which is less than $- d_0 \/ 2$ on the cap, neck and original boundary. A slightly smaller bound holds on a neighborhood by continuity. For $sigma_i = - 1$ the same construction applies to $- h$ and $- K$. There are finitely many components, so one may take the minimum of their positive height gaps as $b_2$. ◻
]

Choose $0 < b_3 < b_2$ sufficiently small that, on the original exterior,

#[#set math.equation(numbering: n => "(8.8)")
 $ D_g \( Y \) - rho - \| h tau \| gt.eq rho quad upright("if ") \| h \| lt.eq b_3 upright(" and ") \| Y \|_g lt.eq 1 . $ <cp:tau-absorption>]

This is possible because $tau$ has compact support and the excess in Equation (8.1) has a positive minimum on that support. The height bound in Equation (8.3) places ${ \| h \| gt.eq b_3 \/ 4 }$, on the original exterior, within one fixed coordinate radius independent of $N$.

Let $zeta$ be a smooth nonnegative function on $bb(R)$, equal to zero on $\[ - b_3 \/ 4 \, b_3 \/ 4 \]$ and equal to one where $\| h \| gt.eq b_3 \/ 2$. We take $0 lt.eq zeta lt.eq 1$ and set

#[#set math.equation(numbering: n => "(8.9)")
 $ A_N = (ell / eta)^(1 \/ 2) = e^(N epsilon.alt \/ 4) \, #h(2em) psi \( h \) = A_N zeta \( h \) \, #h(2em) lambda = e^(t + psi \( h \) + epsilon.alt) \, #h(2em) tilde(g) = lambda^2 macron(g) . $ <cp:plateau-metric>]

The parameter $A_N$ here is a conformal height, not a surface area. The floor and $psi gt.eq 0$ imply

#[#set math.equation(numbering: n => "(8.10)")
 $ lambda gt.eq 1 \, #h(2em) tilde(g) gt.eq g_N . $ <cp:metric-dominance>]

#thm([Lemma 8.3.])[
  (Curvature outside the high band).  #emph[For all large $N$, on the part of the original exterior where $\| h \| lt.eq b_3$, 
#[#set math.equation(numbering: n => "(8.11)")
 $ lambda^2 / 2 R_(tilde(g)) gt.eq I_g \( w \) . $ <cp:curvature-lower>]

 The modification $psi$ is compactly supported. After the coordinate dilation $y' = e^epsilon.alt y$, the comparison metric is strongly asymptotically flat, has integrable scalar curvature, and its ADM mass $M_N$ satisfies 
#[#set math.equation(numbering: n => "(8.12)")
 $ M_N = e^epsilon.alt E \( hat(g) \) lt.eq e^epsilon.alt \( E_(*) + a_N \) . $ <cp:comparison-mass>]

]
] <cp:curvature>

#proof[
  Since $F = h = eta f$, differentiation gives $w \( F \) = eta a_w \| d f \|$. Substitute the equations into the scalar identity of Proposition 24. On $\| h \| lt.eq b_3$, using Equation (8.8) and dropping the nonnegative penalty contribution, one obtains
  #[#set math.equation(numbering: n => "(8.13)")
   $ e^(2 t) / 2 R_(hat(g)) gt.eq I_g \( w \) + rho + \( 1 - delta_0 \) cal(T) + \( 1 - delta_0 \) eta a_w \| d f \| . $ <cp:unmodified-curvature>]
  We estimate the cost of $psi$ directly through the trace equation. The graph inverse is $A_d$, and its volume density is $sqrt(D)$. Differentiation gives the identities
  #[#set math.equation(numbering: n => "(8.14)")
   $ \| d h \|_(A_d) & lt.eq eta \/ l \,\
e^(2 t) Delta_(hat(g)) h & = frac(eta, l sqrt(D)) ("div"_(g_N) w + \( 1 - p \) w \( t \)) \,\
"div"_(g_N) w & = "tr"_(A_d) H^f + p d thin w \( t \) . $ <cp:height-gradient>]
  For example, $sqrt(D) thin A_d nabla h = \( eta \/ l \) w$; the divergence formula for $macron(g)$, followed by the three-dimensional conformal Laplacian formula, proves Equation (8.14). Differentiating $w = l D^(- 1 \/ 2) nabla f$ proves Equation (8.14).
  In the axial decomposition of Section 5,
  $ "tr"_(A_d) H^f = h + \( d - chi \) j - "tr"_(A_d) K . $
  Since $\| d - chi \| lt.eq d$ and $0 < d lt.eq 1$, the coercivity estimate controls $\( d - chi \) j$, $d thin w \( t \)$, and $\| d t \|_(A_d)$ by $cal(P)_N sqrt(cal(T))$. On the compact original region where $zeta'$ or $zeta''$ can be nonzero, Equations (8.14)–(8.14) therefore give
  #[#set math.equation(numbering: n => "(8.15)")
   $ lr(|e^(2 t) Delta_(hat(g)) h|) lt.eq cal(P)_N eta / l \( 1 + sqrt(cal(T)) \) . $ <cp:height-laplacian-bound>]
  This estimate uses no quantitative bound on second derivatives of the solution beyond the structural coercivity inequality.
  In dimension three the conformal curvature identity reads
  #[#set math.equation(numbering: n => "(8.16)")
   $ lambda^2 / 2 R_(tilde(g)) = e^(2 t) / 2 R_(hat(g)) - 2 e^(2 t) Delta_(hat(g)) psi - e^(2 t) \| d psi \|_(hat(g))^2 . $ <cp:conformal-curvature>]
  The absolute value of its two error terms is at most
  $ cal(P)_N A_N eta / l \( 1 + sqrt(cal(T)) \) + C \( A_N + A_N^2 \) (eta / l)^2 . $
  Here
  $ A_N eta / l lt.eq ell^(1 \/ 4) \, #h(2em) A_N^2 (eta / l)^2 lt.eq ell^(1 \/ 2) . $
  Young’s inequality absorbs the $sqrt(cal(T))$ term into half of $\( 1 - delta_0 \) cal(T)$, with remainder tending to zero even after the polynomial factors. The remaining errors are absorbed by the positive minimum of $rho$ on this fixed transition region. Off that region $psi$ is constant, so there is no error. This proves Equation (8.11).
  Compact support of $psi$ follows from the height bound. It leaves the end energy unchanged. The estimates in Theorem 38, the strong prepared end, and the exponential graph error imply $e^(2 t) macron(g) - delta = O_2 \( r^(- 1) \)$. Its scalar curvature is integrable: on the end the conformal formula involves the integrable prepared $R_g$, $Delta_g t = O \( r^(- 3 - beta) \)$, $\| d t \|^2 = O \( r^(- 4) \)$, and exponentially decaying graph errors. The compact part is smooth. Finally, constant scaling by $e^(2 epsilon.alt)$ followed by $y' = e^epsilon.alt y$ multiplies ADM mass by $e^epsilon.alt$. Lemma 39 proves Equation (8.12). ◻
]

=== 8.3 Two fluxes and the charged scalar inequality <two-fluxes-and-the-charged-scalar-inequality>

#thm([Lemma 8.4.])[
  (Flux-preserving field projection).  #emph[On the original exterior there are smooth closed two-forms $tilde(alpha)_1 \, tilde(alpha)_2$, with total fluxes $4 pi Q_E \, 4 pi Q_B$, whose associated vector fields in $tilde(g)$ satisfy 
#[#set math.equation(numbering: n => "(8.17)")
 $ R_(tilde(g)) gt.eq 2 #scale(x: 120%, y: 120%)[\(] \| tilde(cal(E)) \|_(tilde(g))^2 + \| tilde(cal(B)) \|_(tilde(g))^2 #scale(x: 120%, y: 120%)[\)] quad upright("where ") \| h \| lt.eq b_3 . $ <cp:charged-scalar>]

 The vector fields are divergence free and have $O_1 \( r^(- 2) \)$ decay in the normalized end coordinates.]
] <cp:flux-projection>

#proof[
  Choose a constant matrix $sans(R) in S O \( 2 \)$ which sends the charge vector $\( Q_E \, Q_B \)$ to $\( Q \, 0 \)$. For $Q > 0$ one can take
  $ sans(R) = 1 / Q mat(delim: "(", Q_E, Q_B; - Q_B, Q_E) \; $
  for $Q = 0$ take the identity. Put $\( X_e \, X_o \)^T = sans(R) \( cal(E) \, cal(B) \)^T$ and $alpha = iota_(X_e) d V_g$. A determinant-one rotation preserves both the sum of squared norms and the cross product, so
  #[#set math.equation(numbering: n => "(8.18)")
   $ I_g \( w \) & = \| X_e \|_g^2 + \| X_o \|_g^2 + 2 X_o dot.op \( w times X_e \)\
 & = \| X_e \|_g^2 - \| w times X_e \|_g^2 + \| X_o + w times X_e \|_g^2 . $ <cp:projection-square>]
  To identify the first two terms, choose an oriented $g$-orthonormal frame in which $w = a_w e_1$. Then
  $ macron(g) = "diag" \( d^(- 1) \, 1 \, 1 \) \, #h(2em) macron(g)^(- 1) = "diag" \( d \, 1 \, 1 \) \, $
  and the components of $alpha = iota_(X_e) d V_g$ give
  #[#set math.equation(numbering: n => "(8.19)")
   $ \| alpha \|_(macron(g))^2 = X_(e \, 1)^2 + d \( X_(e \, 2)^2 + X_(e \, 3)^2 \) = \| X_e \|_g^2 - \| w times X_e \|_g^2 . $ <cp:two-form-norm>]
  The identity remains valid at $w = 0$ by continuity.
  Combine Equations (8.11), (8.18), and (8.19), retaining the different scaling powers of scalar curvature and two-form norm:
  #[#set math.equation(numbering: n => "(8.20)")
   $ 1 / 2 R_(tilde(g)) gt.eq lambda^(- 2) I_g \( w \) gt.eq lambda^(- 2) \| alpha \|_(macron(g))^2 gt.eq lambda^(- 4) \| alpha \|_(macron(g))^2 = \| alpha \|_(tilde(g))^2 . $ <cp:scaling-chain>]
  The third inequality uses $lambda gt.eq 1$ from Equation (8.10).
  Define
  $ \( tilde(alpha)_1 \, tilde(alpha)_2 \)^T = sans(R)^(- 1) \( alpha \, 0 \)^T \, #h(2em) iota_(tilde(cal(E))) d V_(tilde(g)) = tilde(alpha)_1 \, quad iota_(tilde(cal(B))) d V_(tilde(g)) = tilde(alpha)_2 . $
  Both forms are closed. Orthogonality of $sans(R)$ and the isometry between vector and contracted volume-form norms in dimension three identify the sum of squared vector norms with $\| alpha \|_(tilde(g))^2$. This proves Equation (8.17). Closedness is precisely divergence freedom in $tilde(g)$. The total flux vector is $sans(R)^(- 1) \( 4 pi Q \, 0 \) = \( 4 pi Q_E \, 4 pi Q_B \)$.
  The field associated with $alpha$ itself is explicitly
  $ tilde(X)_e = lambda^(- 3) D^(- 1 \/ 2) X_e . $
  At fixed $N$, $D - 1$ and its derivatives decay exponentially, $t = O_j \( r^(- 1) \)$, and $psi = 0$ near infinity. Hence the original $O_1 \( r^(- 2) \)$ field decay gives the asserted decay of both new fields; the constant coordinate dilation has no effect on its order. Flux integrals of two-forms are invariant under this coordinate change.
  This construction preserves the two total charges. It imposes no claim about the individual charges of the boundary components. All forms have been used only on the original exterior; their extension through a cap is unnecessary. ◻
]

=== 8.4 Removing the high band by a minimizing enclosure <removing-the-high-band-by-a-minimizing-enclosure>

We shall use the following precise form of the outermost-horizon existence theorem, also in the rigidity argument.

#thm([Lemma 8.5.])[
  (Outermost minimal enclosure).  #emph[Let a smooth connected Riemannian three-manifold be complete with a nonempty compact smooth minimal boundary included. Suppose it has one end admitting a foliation by sufficiently large strictly mean-convex spheres, and that the maximum principle with these spheres confines every compact minimal enclosure to a bounded region. Then its inner boundary is enclosed by a compact smooth embedded outermost minimal full cut. The cut may be disconnected and may coincide with components of the given boundary. Its exterior is the connected component containing the end.]
] <cp:outermost-enclosure>

#proof[
  Truncate beyond the confining radius and equip the compact region with the auxiliary second fundamental form zero. The inner boundary has expansion zero with respect to the normal pointing into the region; the outer sphere has positive expansion with respect to the normal pointing out. These are the weak inner and strict outer barriers in #cite(label("AnderssonMetzger2009")) Theorem 5.1. In particular neither strict stability of the inner boundary nor an energy condition is required. Definitions 7.1–7.2 of that paper prescribe the entire inner boundary in the bounding class of trapped sets. Theorem 7.3 and Remark 7.4 give the smooth outer boundary of their union and its outermostness. The weak-barrier version permits coincidence with inner components. Since the auxiliary second form vanishes, the resulting marginal surface is minimal. Keeping the full frontier of the component incident on the end, or equivalently filling bounded complementary pockets, gives the asserted full cut. The outer mean-convex spheres exclude a further compact minimal enclosure outside the truncation. This proves outermostness in the complete exterior as well as in the compact barrier problem. ◻
]

Put

$ H_N = { \| h \| gt.eq b_3 } subset Omega_N . $

It is compact by Equation (8.3) and contains all the caps and original boundary components by Lemma 40. Choose

#[#set math.equation(numbering: n => "(8.21)")
 $ 0 < s_N = e^(- cal(P)_N) < s_0 \, #h(2em) 3 s_N sup_(Omega_N) \| d h \|_(g_N) < b_3 \/ 2 \, #h(2em) O_N = { "dist"_(g_N) \( x \, H_N \) lt.eq s_N } \, $ <cp:obstacle-thickness>]

where $s_0$ is below a uniform background normal-chart radius. Such a choice follows from the first-derivative bound in Equation (8.3); the polynomial in the exponent may be enlarged. Every point at distance at most $2 s_N$ from $O_N$ then lies in the constant plateau $\| h \| gt.eq b_3 \/ 2$. The distance enlargement does not require $b_3$ to be a regular value of $\| h \|$.

#figure(
  [#image("fig/height-bands.pdf.png", width: 100%)],
  caption: [Figure 1: One admissible height cutoff and its two quantitative effects. The horizontal axis records height values on a schematic scale. The constant plateau $psi = A_N$ contains the high set ${ \| h \| gt.eq b_3 }$ and the entire further $2 s_N$ background neighborhood of its enlarged obstacle $O_N$. Caps, necks, and $S$ lie beyond the fixed threshold $b_2 > b_3$. The cutoff vanishes near infinity, while the comparison-mass upper error tends to zero. Any contact of a perimeter minimizer with $O_N$ would force total perimeter at least $e^(2 A_N - cal(P)_N)$, exceeding the $e^(cal(P)_N)$ bound supplied by a fixed enclosing sphere for large $N$. The neighborhood inclusion is a metric statement, independent of the schematic height-axis spacing. ],
) <fig:cp-height-bands>

#thm([Lemma 8.6.])[
  (The minimizing frontier avoids the obstacle).  #emph[For all large $N$ there is a bounded finite-perimeter set $B_N$ containing $O_N$ whose full $tilde(g)$-perimeter is minimal among all such bounded sets. After filling bounded complementary pockets, its entire frontier $Gamma_N^0$ is a nonempty compact smooth embedded minimal surface, disjoint from $O_N$, and its exterior is connected. Moreover 
#[#set math.equation(numbering: n => "(8.22)")
 $ P_(tilde(g)) \( B_N \) lt.eq e^(cal(P)_N) . $ <cp:competitor-bound>]

]
] <cp:contact-exclusion>

#proof[
  Choose a fixed original coordinate sphere beyond the radius containing ${ \| h \| gt.eq b_3 \/ 4 }$ and beyond a fixed further neighborhood. It encloses $O_N$ for all large $N$ and lies where $psi = 0$. Its area in $e^(2 \( t + epsilon.alt \)) \( g + l^2 d f^2 \)$ is at most $e^(cal(P)_N)$ by Equation (8.3). This proves the proposed upper bound for the infimum with a radius independent of $N$.
  We justify compactness separately at fixed $N$. Strong asymptotic flatness gives, sufficiently far out, a foliation by spheres with positive definite outward second fundamental form. Follow their unit-normal trajectories, parametrized by the radius. Tangential metrics increase along these trajectories. Projection from an outer leaf to an inner leaf consequently contracts two-dimensional area. For almost every sufficiently large radius $R$, clipping a bounded competitor at that leaf does not increase its perimeter: along each normal trajectory where clipping creates boundary, the bounded competitor must exit farther out; projection of that portion of its old boundary covers the new trace, with area counted with multiplicity. BV slicing and the area formula give the same inequality for finite-perimeter competitors. Thus the infimum over all bounded competitors equals the infimum in one fixed sufficiently large compact truncation. BV compactness and lower semicontinuity #cite(label("AmbrosioFuscoPallara2000")) Theorem 3.23 and Proposition 3.6, and the closed containment condition $B supset O_N$ almost everywhere give a minimizer. Since it minimizes among all bounded competitors, the outer truncation imposes no local constraint. Large mean-convex spheres also exclude a free minimal contact with that outer truncation.
  We prove that the perimeter support has no contact with $O_N$. Write
  $ gamma_N = e^(2 \( t + epsilon.alt \)) macron(g) . $
  On the $2 s_N$-neighborhood of $O_N$, the plateau is constant, and
  #[#set math.equation(numbering: n => "(8.23)")
   $ tilde(g) = e^(2 A_N) gamma_N \, #h(2em) g_N lt.eq gamma_N lt.eq L_N^2 g_N \, #h(2em) 1 lt.eq L_N lt.eq e^(cal(P)_N) . $ <cp:plateau-comparison>]
  Only pointwise metric comparison is asserted here.
  Suppose $q in O_N ∩ "supp" \| D upright(bold(1))_(B_N) \|$. Because $B_N$ contains $O_N$ almost everywhere, such a point is in $partial O_N$. Take a shortest background geodesic of length $s_N$ from $q$ to $H_N$. The ball of radius $s_N \/ 4$ about its midpoint lies in $O_N ∩ B_(s_N) \( q \)$. Uniform local background geometry gives
  #[#set math.equation(numbering: n => "(8.24)")
   $ \| B_N ∩ B_(s_N) \( q \) \|_(g_N) gt.eq c s_N^3 . $ <cp:filled-density>]
  We obtain a lower bound for the complementary volume without using regularity of either frontier. Put $v \( r \) = \| B_r \( q \) \\ B_N \|_(g_N)$ for $0 < r < s_N$. Full minimality against $B_N union B_r \( q \)$, cancellation outside the ball, and removal of the constant factor $e^(2 A_N)$ imply, for almost every $r$,
  #[#set math.equation(numbering: n => "(8.25)")
   $ P_(g_N) \( B_N \; B_r \( q \) \) lt.eq P_(gamma_N) \( B_N \; B_r \( q \) \) lt.eq L_N^2 v' \( r \) . $ <cp:one-sided-perimeter>]
  The last derivative is the background area of the complementary trace on the sphere, by coarea. In the uniform normal charts, background metric balls correspond to Euclidean balls and volume and perimeter are uniformly comparable. Thus the Euclidean absolute and relative isoperimetric inequalities #cite(label("AmbrosioFuscoPallara2000")) Theorem 3.46 and Remark 3.50 hold here with uniform constants. Local absolute isoperimetry for $B_r \( q \) \\ B_N$, including its boundary on the sphere, gives
  $ v \( r \)^(2 \/ 3) lt.eq C #scale(x: 120%, y: 120%)[\(] P_(g_N) \( B_N \; B_r \( q \) \) + v' \( r \) #scale(x: 120%, y: 120%)[\)] lt.eq C \( L_N^2 + 1 \) v' \( r \) . $
  Every ball at a point of perimeter support has positive complementary volume. Integrating the resulting inequality for $v^(1 \/ 3)$ from $delta$ to $r$ and then letting $delta arrow.b 0$ yields
  #[#set math.equation(numbering: n => "(8.26)")
   $ v \( r \) gt.eq c \( L_N^2 + 1 \)^(- 3) r^3 . $ <cp:unfilled-density>]
  Relative isoperimetry in $B_(s_N) \( q \)$, together with Equations (8.24) and (8.26), therefore forces
  $ P_(g_N) \( B_N \; B_(s_N) \( q \) \) gt.eq c \( L_N^2 + 1 \)^(- 2) s_N^2 . $
  Restoring the constant area multiplier in Equation (8.23) gives
  #[#set math.equation(numbering: n => "(8.27)")
   $ P_(tilde(g)) \( B_N \) gt.eq e^(2 A_N) c \( L_N^2 + 1 \)^(- 2) s_N^2 gt.eq exp \( 2 e^(N epsilon.alt \/ 4) - cal(P)_N \) . $ <cp:contact-area>]
  For fixed $epsilon.alt > 0$, this contradicts Equation (8.22) when $N$ is large.
  The minimizing frontier is now disjoint from the obstacle. It is locally perimeter minimizing without a constraint and is therefore smooth and embedded by three-dimensional perimeter regularity #cite(label("HuiskenIlmanen2001")) Regularity Theorem 1.3(iii). Filling every bounded complementary pocket cannot increase perimeter and preserves the obstacle condition. The frontier of the remaining exterior is the whole smooth minimal boundary incident on the end. It is nonempty because a bounded set containing the nonempty open obstacle cannot have zero perimeter in the connected filled manifold. This proves all assertions. ◻
]

=== 8.5 The Riemannian comparison and the limit <the-riemannian-comparison-and-the-limit>

#thm([Proposition 8.7.])[
  (Charged comparison exterior).  #emph[For each fixed strict prepared exterior, each $epsilon.alt > 0$, and all sufficiently large $N$, there is a smooth one-ended exterior $tilde(Omega)_N subset "int" Omega$, complete with its compact smooth boundary $Gamma_N$ included, with the following properties. Its metric and fields are the restrictions of the comparison objects above; the boundary is outermost minimal, and 
#[#set math.equation(numbering: n => "(8.28)")
 $ tilde(g) & gt.eq g \, & "Area"_(tilde(g)) \( Gamma_N \) & gt.eq a_g \( S \) \,\
"div"_(tilde(g)) tilde(cal(E)) & = "div"_(tilde(g)) tilde(cal(B)) = 0 \, & R_(tilde(g)) & gt.eq 2 #scale(x: 120%, y: 120%)[\(] \| tilde(cal(E)) \|_(tilde(g))^2 + \| tilde(cal(B)) \|_(tilde(g))^2 #scale(x: 120%, y: 120%)[\)] . $ <cp:comparison-area>]

 Its total charges are $Q_E \, Q_B$. Its metric is $O_2 \( r^(- 1) \)$ asymptotically flat, its fields are $O_1 \( r^(- 2) \)$, and its scalar curvature is integrable. Its ADM mass satisfies $M_N lt.eq e^epsilon.alt \( E_(*) + a_N \)$ with the error in Equation (8.5).]
] <cp:charged-comparison>

#proof[
  Apply Lemma 43 to the exterior of $Gamma_N^0$ from Lemma 44. The comparison end is strongly asymptotically flat, so its large coordinate spheres have positive outward mean curvature and confine compact minimal surfaces by the maximum principle at a largest-radius point. We obtain an outermost full minimal enclosure $Gamma_N$ and take its exterior $tilde(Omega)_N$.
  The obstacle contains every cap and a neighborhood of the entire original boundary. Both $Gamma_N^0$ and its outer enclosure are therefore full cuts in the original exterior, with every component counted. Their surviving exterior is disjoint from $H_N = { \| h \| gt.eq b_3 }$. Lemmas 41 and 42 consequently apply everywhere on $tilde(Omega)_N$, up to its boundary. No part of a filling is retained. The construction supplies smoothness, completeness with boundary, one end and the stated asymptotics. Finally, metric dominance on each tangent two-plane and the full-cut definition give
  $ "Area"_(tilde(g)) \( Gamma_N \) gt.eq "Area"_g \( Gamma_N \) gt.eq a_g \( S \) \, $
  and Equation (8.12) gives the mass bound. ◻
]

#thm([Proposition 8.8.])[
  (Numerical inequality on a prepared rest exterior).  #emph[The strict prepared rest data satisfy 
#[#set math.equation(numbering: n => "(8.29)")
 $ E_(*) gt.eq Q \, #h(2em) sqrt(frac(a_g \( S \), 4 pi)) lt.eq E_(*) + sqrt(E_(*)^2 - Q^2) . $ <cp:prepared-inequality>]

 This conclusion allows a different fixed choice of future or past boundary sign on each component.]
] <cp:numerical-prepared>

#proof[
  Put $r_(*) = \( a_g \( S \) \/ \( 4 pi \) \)^(1 \/ 2)$. We prove the family of bounds
  #[#set math.equation(numbering: n => "(8.30)")
   $ E_(*) gt.eq s Q + frac(1 - s^2, 2) r_(*) #h(2em) \( 0 < s < 1 \) . $ <cp:flux-family>]
  The numerical input is the neutral enclosing-area theorem #cite(label("NeutralEnclosingArea2026")) Definitions 1.1–1.2 and Theorem 1.3. In dimension three it states that a smooth connected oriented complete one-ended exterior with nonempty compact boundary, integrable neutral constraint densities satisfying $mu gt.eq \| J \|$, finite future-timelike ADM vector, decay $g - delta = O_6 \( r^(- q_0) \)$, $K = O_5 \( r^(- 1 - q_0) \)$ for some $1 \/ 2 < q_0 < 1$, and weakly future-trapped boundary on every component obeys $m gt.eq 1 / 2 \( a \/ \( 4 pi \) \)^(1 \/ 2)$ when its full-cut infimum $a$ is positive. We verify this contract for the auxiliary data constructed below.
  ===== 8.5.1 Retained curvature and a flux form. <retained-curvature-and-a-flux-form.>
  Work on the same filled manifold at fixed $epsilon.alt \, N$, and put
  $ z = t + epsilon.alt \, #h(2em) g_b = e^(2 z) macron(g) . $
  Then $z gt.eq 0$, $g_b gt.eq g_N$, and $\| d h \|_(macron(g)) lt.eq eta \/ l lt.eq ell^(1 \/ 2)$. Rotate the two original fields by the constant matrix $sans(R)$ in the proof of Lemma 42, and retain $alpha = iota_(X_e) d V_g$. It is closed on the original exterior and has flux $4 pi Q$. For $Q = 0$ the identity rotation suffices. Extend $alpha$ smoothly into the filling, cutting it off on fixed collars inside the original boundary; denote the extension by $alpha_(upright("ext"))$. It need not be closed there. Define
  $ iota_(E_b) d V_(g_b) = alpha_(upright("ext")) \, #h(2em) iota_(E_(upright("ext"))) d V_(g_N) = alpha_(upright("ext")) . $
  The second field is uniformly bounded on the fixed filling collars, is $O_1 \( r^(- 2) \)$ on the end, and has $L^2$ and $L^6$ norms bounded polynomially in $1 + N$. On the original exterior $E_b$ is divergence free. The square completion in Equations (8.18)–(8.19) gives
  $ e^(2 z) \| E_b \|_(g_b)^2 = e^(- 2 z) \| alpha \|_(macron(g))^2 lt.eq I_g \( w \) . $
  We need a sharper consequence of the existing quadratic identity:
  #[#set math.equation(numbering: n => "(8.31)")
   $ cal(T) gt.eq 3 / 4 \| d t \|_(A_d)^2 . $ <cp:sharp-gradient>]
  Here is a direct check. In Equation (5.22), minimize over $M \, F \, j$, keeping the transverse and axial components $y \, x$ of $d t$ fixed. The transverse coefficient is $2 s_p - v \/ 4 gt.eq 3 \/ 4$. The remaining axial coefficient, divided by $d$, is
  $ C \( p \, v \) = frac(\( 2 p + 1 \) \( 8 + v \), 8 + 4 v + 6 p v) . $
  This is increasing in $p gt.eq 0$, and $C \( 0 \, v \) = \( 8 + v \) \/ \( 8 + 4 v \) gt.eq 3 \/ 4$ for $0 lt.eq v < 1$. This proves Equation (8.31), including zero slope by the invariant definition of $cal(T)$.
  Let $cal(U)_N$ be the part of the original exterior where $\| h \| lt.eq b_3$. Equation (8.13) and $delta_0 < 1 \/ 24$ show that throughout $cal(U)_N$, $R_(g_b) \/ 2 gt.eq \| E_b \|_(g_b)^2$. On the fixed original band $b_3 \/ 4 lt.eq \| h \| lt.eq b_3$, the positive function $rho$ has a fixed positive lower bound $c_(*)$; hence, since $\( 1 - delta_0 \) 3 \/ 4 > 2 \/ 3$, we have the stronger bound
  #[#set math.equation(numbering: n => "(8.32)")
   $ e^(2 z) R_(g_b) \/ 2 gt.eq e^(2 z) \| E_b \|_(g_b)^2 + c_(*) + 2 / 3 \| d t \|_(macron(g))^2 . $ <cp:retained-band>]
  The end estimates already proved give all-order decay $g_b - delta = O_j \( r^(- 1) \)$ after the constant dilation, integrable scalar curvature, and
  $ E \( g_b \) lt.eq e^epsilon.alt \( E_(*) + a_N \) \, #h(2em) a_N arrow.r 0 . $
  ===== 8.5.2 A smooth bounded flux profile. <a-smooth-bounded-flux-profile.>
  Fix $s in \( 0 \, 1 \)$ and write $y_0 = log \( 1 - s^2 \) < 0$. For every $t_0 > 0$ choose smooth functions $L > 0$ and $H_0$ on the real line with
  $ L \( 0 \) = 1 \, #h(2em) L' gt.eq 0 \, #h(2em) H_0 = 0 med upright("on ") \( - oo \, y_0 \] \, #h(2em) "supp" H'_0 subset.double \( y_0 \, 0 \) \, #h(2em) H'_0 gt.eq 0 \,\
\| H'_0 \| lt.eq 2 sqrt(1 + 2 L' \/ L) thin e^y L \, #h(2em) 2 s - t_0 < H_0 \( 0 \) lt.eq 2 s . $
  To construct them, set $c = 1 - s^2$ and first use $L_(upright("opt")) \( y \)^2 = \( 1 - c e^(- y) \) \/ s^2$ for $y > y_0$. The right side in the bound for $H'_0$ is then $2 e^y \/ s$, whose integral from $y_0$ to zero is $2 s$. For a small $sigma > 0$, replace $L'_(upright("opt"))$ below $y_0 + sigma$ by $chi_sigma L'_(upright("opt"))$, where $chi_sigma$ is nondecreasing, zero below $y_0 + sigma \/ 3$, and one above $y_0 + 2 sigma \/ 3$; integrate backwards from the unchanged value at $y_0 + sigma$. This gives a positive smooth nondecreasing $L$ on the whole line, constant at its lower end. Take $H'_0 = zeta_sigma thin 2 e^y \/ s$, where $0 lt.eq zeta_sigma lt.eq 1$ is smooth and supported in $\( y_0 + sigma \, - sigma \)$ and tends to one on $\( y_0 \, 0 \)$. Put $H_0 \( y \) = integral_(- oo)^y H'_0 \( v \) thin d v$ and decrease $sigma$ until the asserted value at zero holds.
  Define $B \( 0 \) = 0$, $B' \( y \) = e^y L \( y \)$. This is strictly increasing, its range on $\[ y_0 \, oo \)$ is $\[ B \( y_0 \) \, oo \)$, and $B \( y \) gt.eq e^y - 1$ for $y gt.eq 0$. Set $Y_0 = B \( y_0 \) < 0$ and extend
  $ frak(h) \( Y \) = H_0 \( B^(- 1) \( Y \) \) quad \( Y gt.eq Y_0 \) \, #h(2em) frak(h) \( Y \) = 0 quad \( Y < Y_0 \) . $
  This is smooth and bounded, vanishes near and below $Y_0$, and is constant for all sufficiently large $Y$.
  ===== 8.5.3 The second scalar solve. <the-second-scalar-solve.>
  There is a smooth solution on the entire filled manifold of
  #[#set math.equation(numbering: n => "(8.33)")
   $ 2 Delta_(g_b) B \( y \) = "div"_(g_b) \( H_0 \( y \) E_b \) \, #h(2em) y arrow.r 0 quad upright("at infinity") \, #h(2em) y gt.eq y_0 . $ <cp:bounded-flux-equation>]
  We supply the estimates needed for this assertion; no estimate uniform in $s$ or in the profile tolerance is required. Set $Y = B \( y \)$. In the background measure its equation is exactly
  #[#set math.equation(numbering: n => "(8.34)")
   $ 2 "div"_(g_N) \( A nabla Y \) = "div"_(g_N) \( frak(h) \( Y \) E_(upright("ext")) \) \, #h(2em) A = e^z sqrt(D) thin A_d . $ <cp:background-flux-equation>]
  Indeed the volume ratio is $e^(3 z) sqrt(D)$, and its product with $E_b$ is $E_(upright("ext"))$. The axial and transverse eigenvalues of $A$ are $e^z \/ sqrt(D)$ and $e^z sqrt(D)$; thus their upper bounds and positive inverse lower bounds are at most $exp \( cal(P)_N \)$.
  The filled background has the Sobolev inequality
  $ parallel v parallel_6^2 lt.eq S_N parallel d v parallel_2^2 \, #h(2em) S_N lt.eq exp \( cal(P)_N \) \, $
  for compactly supported $v$, with the same bound on every outer truncation with zero trace. To verify the dependence on $N$, cover the compact core and its product necks by $O \( 1 + N \)$ uniformly controlled patches with bounded overlap. Chains of at most $O \( 1 + N \)$ overlapping patches join them to a fixed end annulus. Radial integration from infinity controls the annulus’s $L^2$ norm by the end gradient energy, because $integral_R^oo r^(- 2) thin d r < oo$. Local Poincaré inequalities control the successive differences of patch averages. Summing along the chains bounds the core $L^2$ norm by a polynomial multiple of the global gradient energy. The local Sobolev inequalities and the Euclidean end inequality then give the stated bound.
  Solve Equation (8.34) on expanding smooth outer truncations with zero Dirichlet data. Multiplying its right side by any homotopy parameter in $\[ 0 \, 1 \]$ leaves the following estimates unchanged. The vector $F_Y = frak(h) \( Y \) E_(upright("ext"))$ has bounded $L^2$ and $L^6$ norms, independent of $Y$ and of the outer radius. Testing by $Y$ gives $parallel d Y parallel_2 + parallel Y parallel_6 lt.eq exp \( cal(P)_N \)$. For $a > 0$, test by $\( Y - a \)_(+)$. Hölder and Sobolev give
  $ parallel \( Y - a \)_(+) parallel_6 lt.eq C_N \| { Y > a } \|^(1 \/ 3) \, #h(2em) C_N lt.eq exp \( cal(P)_N \) . $
  For $b > a$ this implies
  $ \| { Y > b } \| lt.eq (frac(C_N, b - a))^6 \| { Y > a } \|^2 . $
  Starting at level one, whose superlevel measure is bounded by the energy estimate, and taking levels $1 + d_(*) \( 1 - 2^(- j) \)$ proves $sup Y lt.eq exp \( cal(P)_N \)$ for a sufficiently large $d_(*) lt.eq exp \( cal(P)_N \)$. The identical argument for negative levels bounds $inf Y$.
  On a fixed truncation, freezing $F_Y$ and solving the linear uniformly elliptic Dirichlet equation defines a continuous compact map on the continuous functions with zero boundary values: linear $W^(1 \, p)$ estimates with $p > 3$ give compactness. The preceding bounds hold for every fixed point of its homotopy with zero. Leray–Schauder degree therefore gives a fixed point. Divergence-form local Hölder estimates, then divergence Schauder estimates and differentiation, make it smooth. The same estimates are uniform on each fixed compact subset as the truncation radius tends to infinity, so a diagonal limit solves the equation on the filled manifold. These are the standard uniformly elliptic Dirichlet and interior estimates #cite(label("GilbargTrudinger2001")) Chapters 6–8. Testing by $\( Y_0 - Y \)_(+)$ gives zero gradient, since $frak(h) = 0$ on its support and its outer trace vanishes. Consequently $Y gt.eq Y_0$ both on each truncation and in the limit. Inverting $B$ proves $y gt.eq y_0$ and, from its exponential growth, $y lt.eq cal(P)_N$.
  On the original end $"div"_(g_b) E_b = 0$, so $2 Delta_(g_b) Y = frak(h)' \( Y \) E_b \( Y \)$, with bounded drift $O \( r^(- 2) \)$. For fixed $0 < beta' < 1$, positive multiples of $r^(- 1) \( 1 - r^(- beta') \)$ are supersolutions of the absolute drift comparison equation outside a fixed radius. Their negative Laplacian has order $r^(- 3 - beta')$, which dominates the metric error and drift terms of order $r^(- 4)$. Comparison with both signs and the zero data at each outer boundary proves $Y = O \( r^(- 1) \)$ uniformly during exhaustion. Scaled estimates give the first two derivative orders. Thus $y arrow.r 0$ and eventually $H_0 \( y \) = H_0 \( 0 \)$; on that end $Y$ is harmonic. The all-order metric bounds then give $Y \, y = O_j \( r^(- 1) \)$ for every fixed $j$. Integration on the whole filled truncation, which has no inner boundary, gives the exact limiting flux
  #[#set math.equation(numbering: n => "(8.35)")
   $ lim_(R arrow.r oo) integral_(S_R) partial_(nu_b) y thin d A_(g_b) = frac(H_0 \( 0 \), 2) thin 4 pi Q . $ <cp:conversion-flux>]
  Indeed the flux identity first holds with $Y$ in place of $y$; $B' \( 0 \) = 1$ and the $O_j \( r^(- 1) \)$ decay make their difference tend to zero. This also explains why source terms in the artificial filling impose no omitted inner flux condition.
  ===== 8.5.4 A neutral exterior. <a-neutral-exterior.>
  Set $gamma = e^(2 y) g_b$. On $cal(U)_N$, expansion of the scalar equation and the conformal curvature identity give
  $ e^(2 y) R_gamma \/ 2 & gt.eq \| E_b \|^2 - frac(H'_0, e^y L) E_b \( y \) + \( 1 + 2 L' \/ L \) \| d y \|_(g_b)^2 gt.eq 0 . $
  The last inequality is precisely the profile discriminant bound. On the band, the terms in Equation (8.32) beyond the field norm remain available. Moreover, when $y gt.eq 0$ one has $H'_0 = 0$, so the full additional $\| d y \|^2$ term is retained. Therefore
  #[#set math.equation(numbering: n => "(8.36)")
   $ e^(2 \( z + y \)) R_gamma \/ 2 gt.eq c_(*) + 2 / 3 \| d t \|_(macron(g))^2 + upright(bold(1))_({ y gt.eq 0 }) \| d y \|_(macron(g))^2 . $ <cp:neutral-band>]
  Everywhere on the filled manifold $gamma gt.eq e^(2 y_0) g_N$. The conformal ADM calculation, with normalizing factor $1 \/ \( 16 pi \)$, and Equation (8.35) give
  #[#set math.equation(numbering: n => "(8.37)")
   $ e_N := E \( gamma \) = E \( g_b \) - frac(H_0 \( 0 \), 2) Q . $ <cp:conversion-mass>]
  The metric has all-order $O \( r^(- 1) \)$ decay. Its scalar curvature is integrable: far out $B \( y \)$ is harmonic, so $Delta_(g_b) y = - \( 1 + L' \/ L \) \| d y \|^2 = O \( r^(- 4) \)$, and $R_(g_b)$ is integrable.
  Choose a fixed smooth function $b$ with $b = 0$ on $\( - oo \, 0 \]$, $0 lt.eq b' lt.eq 1$, and $b' = 1$ for all sufficiently large arguments. Then $C \( y \) = e^(y - b \( y \))$ is bounded above and below by positive constants on $\[ y_0 \, oo \)$. We shall use a compactly supported pure-trace tensor
  $ K' = - a gamma \, #h(2em) a = e^(- z - b \( y \)) cal(H) \( \| h \| \) \, $
  where $cal(H)$ vanishes on $\[ 0 \, b_3 \/ 4 \]$ and is a constant $M$ on $\[ b_3 \/ 2 \, b_3 \]$. For such a tensor the neutral densities are $mu' = R_gamma \/ 2 + 3 a^2$ and $J' = 2 thin d a$. Multiplication by $e^(2 \( z + y \))$ bounds its momentum contribution by
  $ 2 C (cal(H) \| d t + b' d y \|_(macron(g)) + eta / l \| cal(H)' \|) . $
  Young’s inequality absorbs the first term into the two gradient terms of Equation (8.36) at a cost at most
  $ C^2 cal(H)^2 (frac(1, 2 \/ 3) + 1) = 5 / 2 C^2 cal(H)^2 . $
  Where $y < 0$, $b' = 0$, so no unavailable $y$-gradient term is used. The remaining energy coefficient is $3 - 5 \/ 2 = 1 \/ 2 > 0$. Consequently the neutral DEC follows if
  $ eta / l \| cal(H)' \| lt.eq c' \( 1 + cal(H)^2 \) $
  for a fixed sufficiently small $c' > 0$, depending only on $c_(*)$ and the two bounds for $C$. This condition can be enforced for #emph[every finite] plateau $M$ by a single sufficiently large $N$: choose a fixed smooth cutoff $chi_h$ from zero to one between $b_3 \/ 4$ and $b_3 \/ 2$, and set
  $ cal(H) \( v \) = tan \( \( arctan M \) chi_h \( v \) \) . $
  Then $\| cal(H)' \| \/ \( 1 + cal(H)^2 \) lt.eq \( pi \/ 2 \) parallel chi'_h parallel_oo$ independently of $M$, whereas $eta \/ l lt.eq ell^(1 \/ 2) arrow.r 0$. Its composition with $\| h \|$ is smooth because it vanishes on a neighborhood of zero.
  After these scalar solves, choose a regular value $c_h in \( b_3 \/ 2 \, b_3 \)$ of $\| h \|$. Let $cal(D)_N$ be the closure of the component of ${ \| h \| < c_h }$ containing the end. The height gap keeps it entirely in the original exterior. Its full boundary is compact, smooth, embedded, two-sided and nonempty. Since this boundary is fixed and compact, take the plateau $M$ sufficiently large that, with normal toward the end,
  $ H_(partial cal(D)_N) + "tr"_(partial cal(D)_N) K' = H_(partial cal(D)_N) - 2 a < 0 $
  on every component. The choice of $N$ need not be changed when $M$ is chosen. Restrict $gamma \, K'$ to $cal(D)_N$. They are smooth, satisfy the neutral DEC, and $K'$ is compactly supported. This is a connected oriented one-ended exterior with compact complement of its coordinate end. It is complete with boundary: its domain is closed in the original complete exterior, and its metric is bounded below by $e^(2 y_0) g$. All-order metric decay and compact support of $K'$ imply the neutral theorem’s $O_6 \/ O_5$ assumptions for any $1 \/ 2 < q_0 < 1$. The densities are integrable and its momentum is zero.
  Every full cut in $cal(D)_N$ is a full cut of the original exterior. Counting all components and contact portions, the metric comparison therefore gives its full-cut infimum $a'_N$ the bound
  $ a'_N gt.eq e^(2 y_0) a_g \( S \) > 0 . $
  If $e_N lt.eq 0$, use the energy-raising conformal family constructed in the proof of Lemma 19, with zero fields and with its radial function constant on a core containing $K'$ and the boundary. The neutral DEC and trapping persist, areas do not decrease, momentum remains zero, and the energy becomes $e_N + 2 lambda$. The all-order end decay persists for this radial construction. For arbitrarily small $e > 0$, choose $lambda = \( e - e_N \) \/ 2$. The neutral theorem would imply $e gt.eq 1 / 2 e^(y_0) r_(*) > 0$, a contradiction. Thus $e_N > 0$, and applying that theorem directly gives
  $ e^epsilon.alt \( E_(*) + a_N \) - frac(H_0 \( 0 \), 2) Q gt.eq 1 / 2 e^(y_0) r_(*) = frac(1 - s^2, 2) r_(*) . $
  At fixed prepared data, $s$, profile, and $epsilon.alt$, let $N arrow.r oo$. Then let $epsilon.alt arrow.b 0$ and finally $t_0 arrow.b 0$. This proves Equation (8.30). No convergence of comparison horizons or uniform estimate at $s = 0 \, 1$ is required.
  Letting $s arrow.t 1$ first yields $E_(*) gt.eq Q$. If $r_(*) > Q > 0$, choose $s = Q \/ r_(*)$ to get $E_(*) gt.eq \( r_(*) + Q^2 \/ r_(*) \) \/ 2$; for $Q = 0$ the same conclusion follows by $s arrow.b 0$. Since $r_(*) > Q$, this is equivalent to $r_(*) lt.eq E_(*) + sqrt(E_(*)^2 - Q^2)$. If $r_(*) lt.eq Q$, that upper-radius bound follows directly from $E_(*) gt.eq Q$. This proves both assertions of Equation (8.29). The original componentwise signs enter only in the height-gap construction. Every component of the new auxiliary boundary has the common future sign required by the neutral theorem. ◻
]

#proof[
  First suppose the original ADM vector is future timelike, and write $m = sqrt(E^2 - \| P \|^2)$. Proposition 22 supplies strict prepared rest exteriors indexed by $j$ with
  $ E_(* \, j) arrow.r m \, #h(2em) \( Q_(E \, j) \, Q_(B \, j) \) = \( Q_E \, Q_B \) \, #h(2em) a_(g_j) \( S \) arrow.r a_g \( S \) . $
  The area convergence is for the full original cut class. More explicitly, the lower metric comparison $g_j gt.eq \( 1 - delta_j \) g$, with $delta_j arrow.r 0$, gives $a_(g_j) \( S \) gt.eq \( 1 - delta_j \) a_g \( S \)$; local smooth convergence on any fixed full cut gives the reverse upper limit after taking its area arbitrarily close to the infimum. Thus no original minimizing cut is needed. The preparation keeps the fixed sign on each boundary component.
  For each $j$, Proposition 46 has already taken the limits in the order: outer Dirichlet exhaustion at fixed $N$, then $N arrow.r oo$, then $epsilon.alt arrow.b 0$. Apply its conclusion and only now let $j arrow.r oo$. It follows that
  $ m gt.eq Q \, #h(2em) r_A lt.eq m + sqrt(m^2 - Q^2) . $
  Since $E > 0$, the first inequality is equivalent to $E gt.eq sqrt(\| P \|^2 + Q^2)$.
  Finally, Proposition 8 gives $a_g \( S \) > 0$ for every original exterior in the theorem. We recall explicitly how Lemma 19 eliminates the remaining ADM endpoint using the timelike conclusion just proved. Its conformal energy-raising family preserves $P \, Q_E \, Q_B$, the matter condition and the componentwise boundary signs, increases every full-cut area, and changes the energy to $E_s = E + 2 s$. If $E lt.eq \| P \|$, take $s > \( \| P \| - E \) \/ 2$. The family then has a future-timelike ADM vector, so the preceding result applies and in particular gives
  $ sqrt(\( E + 2 s \)^2 - \| P \|^2) gt.eq 1 / 2 sqrt(frac(a_(g_s) \( S \), 4 pi)) gt.eq sqrt(frac(a_g \( S \), 16 pi)) > 0 . $
  Here we used $x + sqrt(x^2 - Q^2) lt.eq 2 x$ for $x gt.eq Q$. Letting $s arrow.b \( \| P \| - E \) \/ 2$ makes the left side tend to zero, a contradiction. Hence $E > \| P \|$ in the original data. The already proved timelike case completes the theorem, with no boost of speed one and no additional area or timelikeness hypothesis. ◻
]

== 9 Equality and multipliers on the original data <va:section>

Throughout this section the data are the original data of Theorem 5. In particular, the densities have the geometric normalization of Definition 1. Set

#[#set math.equation(numbering: n => "(9.1)")
 $ r_h = sqrt(A \/ \( 4 pi \)) = m + sqrt(m^2 - Q^2) \, #h(2em) c = frac(1 - Q^2 \/ r_h^2, r_h) > 0 \, #h(2em) b^0 = E / m \, quad b^i = - P_i / m . $ <va:constants>]

For varying data write $cal(L) = b^0 E_(upright("new")) + sum_i b^i P_(i \, upright("new"))$, with the coefficients in Equation (9.1) fixed. Then $m' = cal(L)'$ at the original data. The two charge fluxes will be fixed. On the branch $r > Q$, differentiating $\( r + Q^2 \/ r \) \/ 2$, with $a = 4 pi r^2$, gives

#[#set math.equation(numbering: n => "(9.2)")
 $ 16 pi frac(d, d a) (frac(sqrt(a \/ \( 4 pi \)) + Q^2 \/ sqrt(a \/ \( 4 pi \)), 2)) = c quad upright("at ") a = A . $ <va:mass-area-derivative>]

We first allow a more general obstacle. Let $B$ be a smooth full cut whose exterior is connected and contains the given end. On each component fix $epsilon in { 1 \, - 1 }$, and assume $theta_epsilon = H + epsilon "tr"_B K = 0$. Either all of $S$ is a component of $B$, or $B$ is disjoint from $S$; all other components are in $"int" Omega$. When $B = S$ take $epsilon = 1$. A compact filling is used only to describe sets containing the obstacle, as in Proposition 10. No electromagnetic field is extended into that filling.

The minimum enclosing area for $B$ is at least $A$, since every enclosure of $B$ encloses $S$. The mixed-sign numerical comparison, Theorem 3, gives the reverse inequality at the unchanged mass and charges. Consequently its infimum is $A$, and the data exterior to $B$ also attain equality. We carry out the following argument for either obstacle.

=== 9.1 The area derivative and a positive constraint multiplier <the-area-derivative-and-a-positive-constraint-multiplier>

Let $cal(M)_B$ be the family of perimeter-minimizing filled sets, identified up to null sets and represented by their regular frontiers. Proposition 13 confines this family, and the minimizers for all sufficiently small smooth variations considered below, to a common compact set. Write $T_M \( x \)$ for the unoriented tangent plane to its frontier. For a metric variation $h$, define

#[#set math.equation(numbering: n => "(9.3)")
 $ a'_M \( h \) = 1 / 2 integral_(partial M) "tr"_(T_M) h thin d A_g . $ <va:sheet-area>]

The topology on $cal(M)_B$ is convergence in measure. On this family it implies strict perimeter convergence and convergence of the tangent-plane area measures; in particular Equation (9.3) is a continuous function of $M$.

#thm([Lemma 9.1.])[
  #emph[For a smooth path with initial metric derivative $h$, the right derivative of its enclosing-area infimum is 
#[#set math.equation(numbering: n => "(9.4)")
 $ a'_(+) \( 0 \) = min_(M in cal(M)_B) a'_M \( h \) . $ <va:area-derivative>]

]
] <va:area-envelope>

#proof[
  This is the envelope formula of Proposition 14; the following two inequalities specify how it is used here. On the common compact truncation, the area density has the expansion
  $ d A_(g_t) \|_T = (1 + t / 2 "tr"_T h + O \( t^2 \)) d A_g \|_T \, $
  where the remainder is uniform in the point and the two-plane $T$. Every fixed $M in cal(M)_B$ is a competitor at positive $t$, giving the upper derivative bound. Conversely choose minimizing sets $M_t$ at positive $t$. Metric comparison and the same expansion show $P_g \( M_t \) arrow.r A$. A subsequence converges in measure to a member $M_0 in cal(M)_B$, and its perimeter convergence is strict. Continuity of Equation (9.3) gives
  $ a \( t \) - A gt.eq t thin a'_(M_t) \( h \) + O \( t^2 \) \, #h(2em) liminf_(t arrow.b 0) frac(a \( t \) - A, t) gt.eq a'_(M_0) \( h \) . $
  The uniform remainder is bounded by a constant times the uniformly bounded perimeter. Taking a subsequence realizing the lower limit proves Equation (9.4). ◻
]

Put $alpha_1 = *_g cal(E)^flat$ and $alpha_2 = *_g cal(B)^flat$. Use variations of $\( g \, K \, alpha_1 \, alpha_2 \)$ that are smooth and compactly supported, with support allowed to meet $B$; both form variations are closed. The unit ball is transported using the positive metric square root, so for $g' = h$ a transported vector has derivative $- 1 / 2 h^sharp v$. Let

#[#set math.equation(numbering: n => "(9.5)")
 $ cal(A)_B = { \( x \, v \) : x in overline(Omega_B) \, med \| v \|_g lt.eq 1 \, med mu_m + J_m \( v \) = 0 } \, #h(2em) frak(C)' = 2 \( mu_m + J_m \( v \) \)' . $ <va:active-rays>]

Here $Omega_B$ is the exterior to the chosen obstacle.

We add four directions supported away from $B$. The metric direction equals $r^(- 1) delta$ sufficiently far out. The three tensor directions have Euclidean trace reversals

#[#set math.equation(numbering: n => "(9.6)")
 $ p_(i j) = r^(- 2) #scale(x: 120%, y: 120%)[\(] a_i n_j^delta + a_j n_i^delta - delta_(i j) a dot.op n^delta #scale(x: 120%, y: 120%)[\)] \, #h(2em) a in bb(R)^3 . $ <va:momentum-prototype>]

Thus their actual $K$-variations are $p - 1 / 2 \( "tr"_delta p \) delta$. The flat linearized scalar curvature of $r^(- 1) delta$ vanishes, and $partial^j p_(i j) = 0$. Their flux variations are, respectively, $E' = 1 \/ 2$ and $P'_i = a_i \/ 2$. These four directions span the four ADM flux derivatives. No assertion of surjectivity of the constraint map is involved.

Fix $0 < beta < min \( q \, 1 \)$, and extend $r$ to a positive smooth function. Lemma 18 supplies a smooth positive $phi.alt = O_2 \( r^(- 1) \)$ such that

#[#set math.equation(numbering: n => "(9.7)")
 $ - Delta_g phi.alt = b_(*) sqrt(\| d phi.alt \|_g^2 + r^(- 4)) + r^(- 3 - beta) \, #h(2em) partial_nu phi.alt = - 1 quad upright("on ") B \, #h(2em) b_(*) gt.eq \| K \|_g \, $ <va:strict-lapse>]

where $b_(*) = O \( r^(- 1 - q) \)$ has smooth radial bounds on the end. Its Laplacian is integrable and its gradient has a finite flux at infinity. Use the derivative of the conformal path $\( 1 + t phi.alt \)^4 g \, \( 1 + t phi.alt \)^2 K$, with both forms fixed, as a fifth direction. Denote it by $V_(*)$ and put $rho_(*) = r^(- 3 - beta)$. Lemma 16 implies that on active rays

#[#set math.equation(numbering: n => "(9.8)")
 $ frak(C)' \( V_(*) \) gt.eq 8 rho_(*) \, #h(2em) - theta'_epsilon \( V_(*) \) = 4 quad upright("on ") B . $ <va:strict-cone>]

Moreover $frak(C)' \( V_(*) \) \/ rho_(*) arrow.r 8$ uniformly over end rays. The contributions from the drift and the field term are $O \( r^(- 3 - q) \) + O \( r^(- 5) \) = o \( rho_(*) \)$. The four prototypes have the same error bound and hence zero weighted limit. Compact directions have zero weighted limit as well.

#thm([Lemma 9.2.])[
  (Constraint separation).  #emph[There are a probability measure $pi_B$ on $cal(M)_B$, a nonnegative locally finite measure $Lambda_B$ on $cal(A)_B$, and a nonnegative finite measure $zeta_B$ on $B$, such that for every compact direction and every ADM prototype, 
#[#set math.equation(numbering: n => "(9.9)")
 $ 16 pi cal(L)' - c integral_(cal(M)_B) a'_M \( h \) thin d pi_B \( M \) = integral_(cal(A)_B) frak(C)' thin d Lambda_B - integral_B theta'_epsilon thin d zeta_B . $ <va:multiplier>]

 The measure satisfies $integral rho_(*) thin d Lambda_B < oo$.]
] <va:separation>

#proof[
  One-point compactify the active-ray space at infinity. If it is already compact, adjoin an isolated point instead. Assign the limiting values just calculated to the direction functions. The boundary and minimizing family are compact. Finite linear combinations $V$ of all the directions give continuous functions on their disjoint union through
  #[#set math.equation(numbering: n => "(9.10)")
   $ V mapsto (frac(frak(C)' \( V \), rho_(*)) \, med - theta'_epsilon \( V \) \, med [c thin a'_M \( h \) - 16 pi cal(L)']_(M in cal(M)_B)) . $ <va:separation-map>]
  We claim its linear image misses the open cone of functions that are strictly positive everywhere.
  Indeed, a direction in that cone has positive $V_(*)$-coefficient, by its value at infinity. Add its compact and prototype changes linearly and apply the indicated positive conformal change. The forms stay closed and retain their end fluxes. On a compact region, strict positivity on the closed active set makes the first constraint derivative uniformly positive there. Continuity gives this conclusion in a neighborhood of that set; outside the neighborhood the unperturbed constraint has a positive minimum. A uniform Taylor remainder therefore gives the DEC for all sufficiently small positive parameters. The same argument gives the strict chosen boundary expansion.
  Here the far end requires a uniform estimate, rather than compact continuity. The conformal identities retain a positive multiple of the original nonnegative ball constraint. Their additional term is a positive constant times $t rho_(*)$. The nonconformal linear errors are $t O \( r^(- 3 - q) + r^(- 5) \)$. The quadratic metric and tensor prototype errors are $O \( t^2 r^(- 4) \)$; the remaining conformal and mixed errors are $O \( t^2 rho_(*) \)$, after the background nonnegative term has been retained. Since $beta < q$ and $beta < 1$, first choose the end radius large enough for the linear errors to be absorbed, and then choose $t > 0$ small enough for the quadratic errors to be absorbed. This proves feasibility simultaneously on every end ray. The estimates also show integrability of the changed constraints and their Taylor remainders. The conformal gradient flux and the explicit prototype fluxes give finite, differentiable ADM limits. The weak decay, completeness, and cut hypotheses are preserved. Thus these paths belong to the numerical class; no preservation of equality-subclass outermostness is needed.
  Equation (9.4) and positivity of the third component in Equation (9.10) imply $c thin a'_(+) \( 0 \) > 16 pi cal(L)'$. This contradicts the numerical bound and Equation (9.2). The claim follows.
  Separation of a linear subspace from a disjoint open convex cone gives a nonzero continuous functional that annihilates the subspace and is nonnegative on positive functions. The representation of positive functionals on continuous functions gives positive measures on the three compact test spaces. If the measure on $cal(M)_B$ had zero mass, evaluation on $V_(*)$, using Equation (9.8) also at the adjoined point, would be strictly positive. This contradicts annihilation. Normalize that mass to one. On the finite active rays divide the resulting measure by $rho_(*)$, obtaining $Lambda_B$. The possible atom at infinity contributes zero to compact tests and the four prototypes. Rearranging the annihilation identity proves Equation (9.9) and the weighted finiteness assertion. ◻
]

=== 9.2 Normal variations and the minimizing sheets <normal-variations-and-the-minimizing-sheets>

The next step uses a Lorentzian metric only as a device for specifying finite jets. It does not use existence of a stationary development, or of an evolution of the additional matter.

#thm([Lemma 9.3.])[
  (Normal test variation).  #emph[For each smooth compactly supported function $s$ in the open exterior of $B$, there are compact variations, indexed by $delta > 0$, for which $h' = 2 s K$, both flux-form variations are closed, and $frak(C)' arrow.r 0$ uniformly on the compact active-ray support. Consequently, 
#[#set math.equation(numbering: n => "(9.11)")
 $ integral_(cal(M)_B) integral_(partial M) s "tr"_(T_M) K thin d A_g thin d pi_B \( M \) = 0 . $ <va:averaged-trace>]

]
] <va:gaussian-jets>

#proof[
  On a neighborhood of the support prescribe a Gaussian metric $upright(bold(G)) = - d t^2 + g_t$ with $g_0 = g$, $partial_t g_t \|_0 = 2 K$, and future normal $n = partial_t$. Prescribe a two-form $upright(bold(F))$ whose initial electric and magnetic fields are the given ones. The spatial pullbacks are $upright(bold(F)) \|_(t = 0) = alpha_2$ and $\( *_(upright(bold(G))) upright(bold(F)) \) \|_(t = 0) = - alpha_1$. The spatial closure equations are precisely $d alpha_1 = d alpha_2 = 0$. The components of $d upright(bold(F)) = 0$ and $d \( *_(upright(bold(G))) upright(bold(F)) \) = 0$ with one normal slot determine all six normal derivatives of the two-form from its spatial derivatives and the already prescribed first metric jets. Thus both Maxwell equations hold at the slice. For the graph variation with velocity $s n$, Cartan’s formula gives explicitly
  #[#set math.equation(numbering: n => "(9.12)")
   $ alpha'_1 = - d \( s cal(B)^flat \) \, #h(2em) alpha'_2 = d \( s cal(E)^flat \) . $ <va:lapse-flux-variation>]
  These are compact closed variations.
  Let
  #[#set math.equation(numbering: n => "(9.13)")
   $ sans(S)_(a b) = 2 (upright(bold(F))_(a d) upright(bold(F))_b zws^d - 1 / 4 upright(bold(G))_(a b) upright(bold(F))_(c d) upright(bold(F))^(c d)) \, #h(2em) T_delta = upright(bold(E i n)) - sans(S) . $ <va:maxwell-stress>]
  The constraint equations give $T_delta \( n \, n \) = mu_m$ and $T_delta \( n \, dot.op \) \|_(T Omega) = J_m$. Choose the second normal metric jets so that
  #[#set math.equation(numbering: n => "(9.14)")
   $ \( T_delta \)_(i j) = frac(\( J_m \)_i \( J_m \)_j, mu_m + delta) . $ <va:regularized-stress>]
  This is a free prescription: the dependence of the spatial Einstein tensor on $H = partial_t^2 g_t \|_0$ is $1 / 2 \( H - "tr"_g \( H \) g \)$. Its inverse sends a desired coefficient $A$ to $2 A - \( "tr"_g A \) g$ in dimension three. Smooth time collars realizing these finite jets can be obtained by a quadratic Taylor polynomial and a cutoff. The contracted Bianchi identity and the Maxwell equations at the slice give $nabla^a \( T_delta \)_(a b) = 0$ there. In particular they determine the normal derivatives of its normal contractions from spatial derivatives; no further evolution equation is imposed.
  We justify a limit used in this calculation. If smooth $mu gt.eq \| J \|$ on a compact set, then
  $ Q_delta = frac(J ⊗ J, mu + delta) arrow.r Q = cases(delim: "{", J ⊗ J \/ mu \, & mu > 0 \,, 0 \, & mu = 0) quad upright("in ") C^1 . $
  At a zero of $mu$, nonnegativity and domination give $d mu = d J = 0$. In a fixed smooth frame,
  $ \| d Q_delta \| lt.eq 2 \| d J \| + \| d mu \| \, #h(2em) \| Q_delta \| lt.eq mu . $
  These bounds are uniform in $delta$. On a sufficiently small neighborhood of the compact zero set the right sides, including the first derivatives, are uniformly small. On its complement the denominator has a positive lower bound and convergence is smooth. This proves the claim, including differentiability with derivative zero on the zero set.
  Apply it to Equation (9.14). Where $mu_m > 0$, the limiting tensor is $T = gamma ⊗ gamma \/ mu_m$, where $gamma \( n \) = mu_m$ and $gamma \|_(T Omega) = J_m$. The covector $gamma$ is causal. At an active ray with positive $mu_m$, one has
  $ \| v \| = 1 \, #h(2em) J_m = - mu_m v^flat \, #h(2em) ell = n + v upright(" null") \, #h(2em) gamma \( ell \) = 0 . $
  Parallel transport $ell$ along any spatial curve. Its pairing with the causal covector field $gamma$ is nonnegative and vanishes at the point under consideration. Its derivative there is therefore zero. It follows that $\( nabla_e T \) \( Z \, ell \) = 0$ for spatial $e$ and arbitrary $Z$. The divergence identity, in an orthonormal frame, now gives
  #[#set math.equation(numbering: n => "(9.15)")
   $ \( nabla_n T_delta \) \( n \, ell \) = sum_i \( nabla_(e_i) T_delta \) \( e_i \, ell \) arrow.r 0 . $ <va:normal-divergence>]
  At $mu_m = 0$, both the limiting tensor and its spatial covariant derivatives vanish, so the same conclusion holds for every active $\| v \| lt.eq 1$.
  For completeness the varying arguments in this contraction also matter. Under the graph variation and metric-square-root transport,
  $ D_t n = nabla s \, #h(2em) D_t v = v \( s \) n \, #h(2em) D_t ell = nabla s + v \( s \) n . $
  The tangential term $s K^sharp v$ in the derivative of a graph tangent vector is canceled by its square-root transport. Differentiating the constraint therefore gives
  $ 1 / 2 frak(C)'_delta & = s \( nabla_n T_delta \) \( n \, ell \) + T_delta \( nabla s \, ell \) + T_delta \( n \, nabla s + v \( s \) n \) . $
  At a positive-density active ray, the last term is $J_m \( nabla s \) + mu_m v \( s \) = 0$, and the middle term is $delta J_m \( nabla s \) \/ \( mu_m + delta \)$, which tends uniformly to zero. At a zero-density ray both terms vanish. Together with the proved $C^1$ convergence and Equation (9.15), this proves uniform convergence on the compact active set. The variations have no boundary or ADM contribution. Since $Lambda_B$ is locally finite, Equation (9.9) and dominated convergence give Equation (9.11). ◻
]

#thm([Lemma 9.4.])[
  #emph[For $pi_B$-almost every minimizing set, $"tr"_(T_M) K = 0$ on its sheets in the open exterior of $B$.]
] <va:trace-support>

#proof[
  There is no cancellation between different tangent planes in Equation (9.11). Indeed, perimeter submodularity and the common lower bound $A$ show that unions and intersections of two minimizers are minimizers. Their regularity excludes a transverse crossing. Lemma 15 further shows that the plane incidence set is closed: strict convergence, uniform local density, and graphical regularity prevent a sheet from disappearing or its tangent plane from changing at a limiting point. Thus the average of the tangent-plane area measures has the form $d eta \( x \) thin delta_(T \( x \))$, with a single plane over each relevant spatial point. Equation (9.11) reads
  $ integral s \( x \) "tr"_(T \( x \)) K thin d eta \( x \) = 0 $
  for every compact smooth $s$. Hence its integrand vanishes $eta$-almost everywhere. Fubini’s Theorem gives the claim on $pi_B$-almost every frontier. On each free smooth sheet it then holds everywhere by continuity. ◻
]

#thm([Proposition 9.5.])[
  (Exclusion of larger marginal obstacles).  #emph[There is no full smooth enlarged obstacle $B$ of the type described at the start of this section which contains an additional open subset of $Omega$ outside the original filled obstacle and is marginal with an arbitrary fixed choice of sign on each component. For the original obstacle, the area term in Equation (9.9) is exactly $a'_S \( h \) = 1 / 2 integral_S "tr"_S h thin d A$.]
] <va:enlarged-obstacle>

#proof[
  Every minimizing set for an enlarged obstacle is also a minimizing set for the original obstacle, because both minima equal $A$. Choose one of the frontiers supplied by Lemma 50. Away from $S$ this is a free original minimizer, so it is smooth and minimal, including at contact with an interior component of $B$. On the coincidence set with that component, its second graph derivatives agree almost everywhere with those of $B$. Thus $H_B = 0$ there. Its chosen marginality gives $"tr"_(T_M) K = 0$, independently of the chosen sign. Off the coincidence set the same assertion follows from Lemma 50. Continuity consequently gives $H = "tr"_(T_M) K = 0$ throughout the frontier in $"int" Omega$.
  At contact with $S$, the obstacle regularity gives a $C^(1 \, alpha) ∩ W^(2 \, 2)$ graph. On its coincidence set with $S$ the second derivatives agree almost everywhere, and the original condition $H_S + "tr"_S K = 0$ applies. Off that set the same equation has just been proved. The frontier therefore satisfies the uniformly elliptic expansion graph equation almost everywhere through the contact patch. Writing its principal part in divergence form, local elliptic regularity first gives $C^(2 \, alpha)$ and then smoothness, since the coefficients and the original data are smooth. The strong comparison principle for two touching ordered solutions of this graph equation gives local coincidence with $S$. The contact set is consequently both open and closed in connected $S$. If it is nonempty it is all of $S$, whose area already equals $A$; no additional frontier component remains.
  A frontier disjoint from $S$ would instead be a smooth full enclosing surface in the interior with $theta_(+) = 0$, contrary to the original outermostness hypothesis. Thus the chosen frontier must be exactly $S$. Its regular bounded filled side is the original obstacle, so it cannot contain the additional open set of an enlarged obstacle. This proves the exclusion. With $B = S$, the same reasoning applies to almost every member selected by $pi_S$, showing that their area functionals all equal $a'_S$. ◻
]

=== 9.3 Regularity and normalization of the multipliers <regularity-and-normalization-of-the-multipliers>

Use the original obstacle from now on, and suppress its subscript. The scalar and vector first moments of $Lambda$ define measures $u$ and $X$ relative to $d V_g$. Positivity and support on active rays mean, initially as measure statements,

#[#set math.equation(numbering: n => "(9.16)")
 $ u gt.eq \| X \|_g \, #h(2em) u mu_m + J_m \( X \) = 0 . $ <va:complementarity>]

Moment notation is used here because the measures will immediately be shown to have smooth densities.

#thm([Lemma 9.6.])[
  #emph[The moments have smooth densities on $overline(Omega)$, with no additional moment mass on $S$. In the interior they satisfy 
#[#set math.equation(numbering: n => "(9.17)")
 $ "sym" nabla X = - u K . $ <va:shift-equation>]

 Their full first jets obey a closed linear first-order system with smooth coefficients.]
] <va:smooth-moments>

#proof[
  For compactly supported interior tensor variations $k$, the part of $frak(C)'$ depending on $k$ integrates to
  $ 2 integral [u \( tau "tr" k - K : k \) + X^i nabla^j \( k_(i j) - "tr" k thin g_(i j) \)] d V . $
  There is no interior area term by Proposition 51. Integration by parts in distributions and invertibility of spatial trace reversal give Equation (9.17).
  For a compact interior metric variation $h$, the second-order principal term is the scalar curvature adjoint $nabla^2 u - \( Delta u \) g$. Connection variation in the momentum constraint has at most one derivative of $h$; after integration by parts it has at most one derivative of $u \, X$. The variations of the fixed flux forms’ norms and of the transported ray are algebraic. All other terms in the metric equation are therefore smooth linear expressions in $u \, X \, nabla u \, nabla X$. Taking the trace solves for $Delta u$, since in three dimensions $"tr" \( nabla^2 u - \( Delta u \) g \) = - 2 Delta u$, and hence solves for the full Hessian of $u$.
  Taking a divergence of Equation (9.17) and using its trace $"div" X = - u tau$ gives a vector Laplace equation for $X$ with only first derivatives of the moments on the right. Together with the traced metric equation this is a linear elliptic system with diagonal Laplace principal symbol. Local distributional elliptic regularity makes the moment measures smooth. To see that no derivatives remain unaccounted for, differentiate the symmetrized equation and combine its three index permutations. For $C_(i j) = - 2 u K_(i j)$ this expresses $2 nabla_i nabla_j X_k$ as $nabla_i C_(j k) + nabla_j C_(i k) - nabla_k C_(i j)$ plus curvature contractions with $X$. Thus every second derivative of $X$, as well as every second derivative of $u$, is a smooth linear function of the first jets. This is the asserted closed system.
  It also proves extension through the boundary. In a smooth collar, restrict the system for the first jets to each inward normal segment from a fixed interior collar slice. It is a linear ordinary differential equation with coefficients smooth up to $S$, so its solution extends smoothly to $S$. Smooth dependence on the tangential initial point gives a smooth extension of all the moments. Uniqueness of the normal equations preserves the identities between these extended jets and derivatives of the extended fields.
  It remains possible a priori that $Lambda$ has a boundary moment not represented by these densities. Take a metric test with $h = nabla h = 0$ on $S$ and arbitrary normal second derivatives of its tangential block. In collar coordinates the principal term $R'_g = nabla^i nabla^j h_(i j) - Delta "tr" h - chevron.l "Ric" \, h chevron.r$ then has arbitrary boundary value, through $- partial_nu^2 "tr"_S h$. The momentum, electromagnetic, transported-ray, area, and expansion variations vanish on $S$. After integrating the smooth interior moments by parts, their boundary terms also vanish because $h$ has zero first jet. Equation (9.9) consequently annihilates every boundary test against the scalar moment mass. That mass is zero. Its vector moment is dominated by the scalar mass and is zero as well. ◻
]

#thm([Lemma 9.7.])[
  #emph[For any $q_0$ with $1 \/ 2 < q_0 < min \( q \, 1 \)$, 
#[#set math.equation(numbering: n => "(9.18)")
 $ u = b^0 + O_2 \( r^(- q_0) \) \, #h(2em) X^i = b^i + O_2 \( r^(- q_0) \) . $ <va:asymptotic-moments>]

 Moreover $u > 0$ in $"int" Omega$.]
] <va:normalization>

#proof[
  Write $Y = \( u \, X \)$ in the end coordinates. Inspection of the preceding adjoint and its prolongation gives
  #[#set math.equation(numbering: n => "(9.19)")
   $ \| partial^2 Y \| lt.eq C r^(- 1 - q_0) \| partial Y \| + C r^(- 2 - q_0) \| Y \| . $ <va:finite-type-end>]
  The derivative coefficients contain $partial g \, K$; the value coefficients contain $partial^2 g \, partial K$, their quadratic products, and squared electromagnetic fields. These are controlled by the original $O_2 \/ O_1$ hypotheses; no extra derivative bound on the original data is being used.
  Here is the growth argument. On each radial segment, first bound $\| Y \( r \) \|$ by its value at a fixed sphere plus $integral_R^r \| partial Y \( t \) \| d t$. Substitution in the integrated form of Equation (9.19) and Gronwall’s inequality with the integrable kernel $t^(- 1 - q_0)$ give uniformly bounded first derivatives and $Y = O \( r \)$. The same equation then gives $partial^2 Y = O \( r^(- 1 - q_0) \)$, so $partial Y$ has a limit on each ray with error $O \( r^(- q_0) \)$. Two ray values on a sphere can be joined by an arc of length at most $pi r$; their derivative difference is $O \( r^(- q_0) \)$. Thus the limiting derivative matrix $L$ is independent of the ray, and $Y = L x + O \( r^(1 - q_0) \)$.
  The inequality $u gt.eq \| X \|_g$ holds in every direction at infinity. Applying it on opposite rays first forces the linear part of $u$ to vanish, and then forces every linear part of $X$ to vanish. Consequently $partial Y = O \( r^(- q_0) \)$ and $Y = O \( r^(1 - q_0) \)$. Reinsert these bounds in Equation (9.19) to obtain $partial^2 Y = O \( r^(- 1 - 2 q_0) \)$. Its radial integral from infinity gives $partial Y = O \( r^(- 2 q_0) \)$. Since $2 q_0 > 1$, $Y$ is bounded. One more insertion gives $partial^2 Y = O \( r^(- 2 - q_0) \)$, $partial Y = O \( r^(- 1 - q_0) \)$, and a common constant limit $Y_oo$ with error $O \( r^(- q_0) \)$.
  Integrate the smooth adjoint identity against the four prototypes, truncated at radius $R$, and let $R arrow.r oo$. The limiting scalar boundary term is $16 pi u_oo E'$, and the vector boundary term is $16 pi X_oo^i P'_i$. The errors involve a decaying coefficient times a prototype or its derivative, or a derivative of $Y$ times a prototype, and their sphere integrals are $O \( R^(- q_0) \)$. The volume integrals converge by the weighted finiteness in Lemma 48. The prototypes vanish near $S$, so Equation (9.9) identifies these limits with $16 pi \( b^0 E' + b^i P'_i \)$. Their four independent flux values give $Y_oo = \( b^0 \, b^i \)$, proving Equation (9.18).
  If $u$ vanished at an interior point, nonnegativity would give $d u = 0$ there and domination would give $X = 0$ and $nabla X = 0$ there. The entire first jet would be zero. Uniqueness along curves for the closed first-order system in Lemma 52 would make $u \, X$ identically zero on the connected exterior. This contradicts $u_oo = E \/ m > 0$. ◻
]

=== 9.4 Stationary reconstruction and electromagnetic potentials <stationary-reconstruction-and-electromagnetic-potentials>

#thm([Proposition 9.8.])[
  #emph[On $bb(R) times "int" Omega$ there are smooth stationary fields 
#[#set math.equation(numbering: n => "(9.20)")
 $ upright(bold(G)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) \, #h(2em) xi = partial_z \, $ <va:stationary-metric>]

 and a two-form $upright(bold(F))$, with the prescribed orientation, which induce all four original data $\( g \, K \, cal(E) \, cal(B) \)$ on each constant-$z$ slice. The Killing field is nonzero and future causal, and tends to the unit future timelike vector $\( E \/ m \, - P \/ m \)$ relative to the original asymptotic normal and frame. Both Maxwell equations hold. With $sans(S)$ as in Equation (9.13), 
#[#set math.equation(numbering: n => "(9.21)")
 $ u \( upright(bold(E i n))_(i j) - sans(S)_(i j) \) & = - \( J_m \)_(\( i) X_(j \)) \,\
upright(bold(E i n)) - sans(S) & = mu_m / u^2 thin xi^flat ⊗ xi^flat . $ <va:spatial-stress>]

 The coefficient is nonnegative; wherever it is positive, $xi$ is null. In particular the region $W = - upright(bold(G)) \( xi \, xi \) = u^2 - \| X \|_g^2 > 0$ is electrovacuum.]
] <va:stationary-data>

#thm([Lemma 9.9.])[
  (Global Killing potentials).  #emph[The spatial one-forms 
#[#set math.equation(numbering: n => "(9.22)")
 $ beta_E = u cal(E)^flat + \( cal(B) times X \)^flat \, #h(2em) beta_B = u cal(B)^flat + \( X times cal(E) \)^flat $ <va:potential-forms>]

 are globally exact on $"int" Omega$. They are the pullbacks of $i_xi upright(bold(F))$ and $i_xi \( *_(upright(bold(G))) upright(bold(F)) \)$, respectively. Their potentials extend smoothly to $S$.]
] <va:potentials>

#proof[
  Define $upright(bold(F))$ uniquely by stationarity and its electric and magnetic contractions with the future slice normal $n = u^(- 1) \( partial_z - X \)$. With the given orientation its spatial parts are $alpha_2$ and $- alpha_1$ for $upright(bold(F))$ and $*_(upright(bold(G))) upright(bold(F))$. Contraction with $xi = u n + X$ gives Equation (9.22), including both cross-product signs.
  In Equation (9.9), vary $alpha_1$ by any smooth compactly supported closed two-form $eta$ in the interior. The only contribution is $- 4 integral beta_E and eta$, hence it is zero. Varying $alpha_2$ gives the same assertion for $beta_B$. We explain why this test class implies exactness on arbitrary topology. Testing first with exact $eta = d gamma$ proves $d beta = 0$. For any embedded oriented loop choose a trivialized oriented normal disk bundle and a compact disk two-form of integral one, extended constantly along the loop and by zero through the tube sides. It is a compactly supported closed two-form. Since $beta$ is closed, its pairing with this form equals the period of $beta$ around the central loop: all parallel loops in the tube have the same period. Thus every such period is zero. Smooth one-cycles can be represented by finite sums of embedded loops in a three-manifold, so every period is zero. Path integration defines a global potential. This argument uses all compact closed two-form variations, not only the exact ones.
  The forms in Equation (9.22) are smooth up to $S$. In a collar, integration in the normal direction extends their potentials smoothly there; local potentials on overlapping charts differ by the same constants as in the interior, so the extensions agree. Finally, stationarity and Cartan’s identity give $i_xi d upright(bold(F)) = - d \( i_xi upright(bold(F)) \) = 0$ and the corresponding identity for $* upright(bold(F))$. Their spatial exterior derivatives vanish because $d alpha_1 = d alpha_2 = 0$. These two conclusions give $d upright(bold(F)) = d \( * upright(bold(F)) \) = 0$ on the product. ◻
]

#proof[
  The slice metric is $g$, and stationarity of Equation (9.20) gives its second fundamental form $- u^(- 1) "sym" nabla X = K$, by Equation (9.17). The definition of $upright(bold(F))$ recovers the two original fields. Lemma 55 proves Maxwell closure. Causality and the end normalization follow from Equations (9.16) and (9.18); $xi$ is nonzero because $u > 0$.
  We derive the stress assertion to fix its normalization. Write $sans(B) \( L \, M \) = L : M - "tr" L "tr" M$. In a compact metric variation keep the lapse and shift fixed, and set $b = - u^(- 1) "sym" nabla X$, so $b = K$ at the base point. Integrating the momentum term by parts gives the gravitational functional
  $ integral 2 { u mu + J \( X \) } thin d V = integral u { R - sans(B) \( K \, K \) + 2 sans(B) \( K \, b \) } thin d V . $
  Its first variation at $b = K$ is that of $integral u { R + sans(B) \( b \, b \) } thin d V$, since their difference is $- integral u sans(B) \( K - b \, K - b \) d V$, whose first derivative is zero. The Gauss scalar-curvature identity identifies the latter functional, up to a divergence, with the spacetime scalar action per unit Killing time of Equation (9.20). Integrating the scalar-curvature variation twice by parts gives its coefficient in a covariant spatial metric variation as $- u upright(bold(E i n))_(i j)$. This calculation uses the coframe $d x^i + X^i d z$: its dual spatial vectors are tangent to the slices, so the indicated Einstein slots are exactly the spatial ones.
  With a fixed flux form, the vector is its contravariant density divided by $sqrt(det g)$. Consequently
  $ #scale(x: 120%, y: 120%)[\(] \( \| cal(E) \|^2 + \| cal(B) \|^2 \) d V #scale(x: 120%, y: 120%)[\)]' = (cal(E)_i cal(E)_j + cal(B)_i cal(B)_j - 1 / 2 \( \| cal(E) \|^2 + \| cal(B) \|^2 \) g_(i j)) h^(i j) d V . $
  The coefficient for twice the lapse times this expression is $- u sans(S)_(i j)$. Also $chevron.l cal(E) times cal(B) \, X chevron.r d V$ is independent of the metric when the two vector densities and $X$ are fixed. The transported-ray derivative in Equation (9.5) adds $- J_(m \( i) X_(j \)) h^(i j)$. Including a volume variation costs nothing because $u mu_m + J_m \( X \) = 0$. The zero interior metric variation in Equation (9.9) therefore yields Equation (9.21).
  The normal-normal and normal-spatial components of $upright(bold(E i n)) - sans(S)$ are $mu_m \, J_m$ by Gauss–Codazzi and the original constraints. If $mu_m = 0$, the DEC gives $J_m = 0$, and Equation (9.21) makes all components zero. If $mu_m > 0$, complementarity and the two inequalities $\| J_m \| lt.eq mu_m$, $\| X \| lt.eq u$ imply
  $ \| X \| = u \, #h(2em) J_m = - mu_m / u X^flat . $
  Since $xi^flat \( n \) = - u$ and its spatial restriction is $X^flat$, these normal components and Equation (9.21) give Equation (9.21). This also proves its stated support property. In these formulas $mu_m \, J_m$ are geometric densities; there is no additional factor of $8 pi$. ◻
]

=== 9.5 The original boundary and positive surface gravity <the-original-boundary-and-positive-surface-gravity>

#thm([Proposition 9.10.])[
  #emph[The smooth multipliers on the original boundary satisfy 
#[#set math.equation(numbering: n => "(9.23)")
 $ X = u nu \, #h(2em) partial_nu u + K \( X \, nu \) = kappa \, #h(2em) kappa = c / 2 > 0 . $ <va:boundary-identities>]

 Either $u > 0$ everywhere on connected $S$, or $u = 0$ everywhere there. In the first case, 
#[#set math.equation(numbering: n => "(9.24)")
 $ d W = 2 kappa X^flat quad upright("on ") S . $ <va:horizon-gradient>]

 In the second case, in original outward normal distance $s$, 
#[#set math.equation(numbering: n => "(9.25)")
 $ u = kappa s + O \( s^2 \) \, #h(2em) X = O \( s^2 \) . $ <va:bifurcation-expansion>]

 In both cases $W > 0$ on a deleted collar of $S$. The coefficient $h_(*) = mu_m \/ u^2$ in Equation (9.21) is a smooth nonnegative function supported in a compact subset of $"int" Omega$, and extends by zero through $S$.]
] <va:boundary>

#proof[
  The integration normal of the exterior at its boundary is $- nu$. An arbitrary compact $K$-variation $k$ therefore leaves the boundary expression
  $ - 2 integral_S { k \( X \, nu \) - "tr" k thin X_nu } thin d A - integral_S "tr"_S k thin d zeta = 0 . $
  The mixed normal-tangential components first give $X_(upright("tan")) = 0$, and the tangential trace gives $d zeta = 2 X_nu d A$.
  Next use a compact scalar test $s$ and the variation $\( h \, k \) = \( 2 s g \, s K \)$, with the flux forms fixed. The differential part of $frak(C)'$ is $4 \( - Delta s + K \( nabla s \, v \) \)$, by Lemma 16. The expansion derivative at a marginal boundary is $2 partial_nu s$. After the already proved interior adjoint cancels the interior terms, Equation (9.9) becomes
  $ - 2 c integral_S s thin d A & = 4 integral_S [u partial_nu s - \( partial_nu u + K \( X \, nu \) \) s] d A - 2 integral_S partial_nu s thin d zeta . $
  The independent boundary value and normal derivative of $s$ give $X_nu = u$ and $partial_nu u + K \( X \, nu \) = c \/ 2$. This proves Equation (9.23).
  Let $L_(+)$ be the expansion linearization for outward normal motions of $S$; its principal part is $- Delta_S$. Apply the multiplier identity to Lie derivatives of all four original data under a compact vector field that equals $s nu$ on $S$. These are legitimate jets up to the boundary: extend the data smoothly into a collar solely to take the derivative. The flux-form Lie derivatives are exact. At an interior active ray, the transported DEC quantity is a nonnegative function with value zero, so its Lie derivative vanishes. There is no boundary constraint atom by Lemma 52. The area and expansion derivatives are $integral_S H_S s thin d A$ and $L_(+) s$, respectively, while the ADM derivative is zero. Since $d zeta = 2 u thin d A$, we obtain
  #[#set math.equation(numbering: n => "(9.26)")
   $ c H_S = 2 L_(+)^(*) u . $ <va:boundary-stability-identity>]
  Outer area minimization gives $H_S gt.eq 0$, by nonnegative outward normal area variations. Thus $u gt.eq 0$ is a supersolution of a smooth uniformly elliptic operator on connected compact $S$. The strong minimum principle, applied locally with the bounded zeroth-order coefficient, implies either strict positivity everywhere or identical vanishing. No positive stability eigenvalue is assumed.
  If $u > 0$ on $S$, then $W = 0$ there. Tangential derivatives of $W$ vanish, and the normal component of Equation (9.17) gives
  $ partial_nu W = 2 u partial_nu u - 2 chevron.l nabla_nu X \, X chevron.r = 2 u \( partial_nu u + u K_(nu nu) \) = 2 kappa u > 0 . $
  This is Equation (9.24) and gives the positive deleted collar. If $u = 0$ throughout $S$, then $X = 0$ there and all its tangential covariant derivatives vanish. The mixed and normal components of Equation (9.17) force its normal derivatives to vanish as well. Equation (9.23) gives $partial_nu u = kappa$, proving Equation (9.25) and again $W > 0$ for sufficiently small positive $s$.
  Finally Equation (9.18) gives $W arrow.r 1$ at infinity. Equation (9.21) makes $mu_m = 0$ wherever $W > 0$, so $h_(*)$ vanishes on both the boundary collar and a far end neighborhood. It is smooth in the remaining compact interior region because $u > 0$ there. Extension by zero proves the last claim. ◻
]

== 10 The communicating stationary region and a maximal hypersurface <st:section>

Throughout this section the hypotheses of the connected, nondegenerate equality case hold. We use the fields furnished by Propositions 54 and 56. Put

$ frak(R) = bb(R)_z times "int" Omega \, #h(2em) xi = partial_z \, #h(2em) W = u^2 - \| X \|_g^2 . $

Thus

#[#set math.equation(numbering: n => "(10.1)")
 $ upright(bold(G)) = - u^2 d z^2 + g_(i j) \( d x^i + X^i d z \) \( d x^j + X^j d z \) = - W d z^2 + 2 X^flat d z + g . $ <st:product>]

Here and below products of one-forms in metric formulas are symmetric products; in particular, $d U thin d V$ has components $G_(U V) = G_(V U) = 1 \/ 2$. The smooth two-form $upright(bold(F))$ and the metric are invariant under the complete flow of $xi$. The vector $xi$ is future causal and nonzero on $frak(R)$, since $u > 0$ there and $u gt.eq \| X \|_g$. Also

#[#set math.equation(numbering: n => "(10.2)")
 $ upright(bold(G))^(- 1) \( d z \, d z \) = - u^(- 2) < 0 . $ <st:original-time>]

Consequently $z$ is a temporal function even where $W = 0$. Near infinity and on a deleted collar of $S$ we have $W > 0$, and the equations there are the source-free Einstein–Maxwell equations. The constant $kappa > 0$ is the one in Proposition 56.

=== 10.1 Communication with the end <communication-with-the-end>

On the original stationary end chart, write $rho = \| x \|$ for the Euclidean spatial radius.

#thm([Proposition 10.1.])[
  #emph[Let $frak(E) = bb(R) times { rho > R }$, with $R$ sufficiently large. Taking chronological past and future within $frak(R)$, one has 
$ I^(-) \( frak(E) \) = frak(R) = I^(+) \( frak(E) \) . $

]
] <st:communication>

#proof[
  Write $frak(A) = I^(-) \( frak(E) \)$; the future case has the same proof with time orientation reversed. The end has timelike Killing orbits, so $frak(E) subset frak(A)$. The set $frak(A)$ is open and invariant under every Killing translation. It is connected: a point of $frak(A)$ can be joined to $frak(E)$ by a timelike curve entirely in $frak(A)$, and $frak(E)$ is connected. Hence $frak(A) = bb(R) times A$ for a connected open subset $A$ of $"int" Omega$ containing its distant end.
  Suppose that its relative boundary $frak(H) = partial_(frak(R)) frak(A)$ is nonempty. A boundary of a chronological past is achronal and locally separates its past side from an excluded future side. To recall the local regularity used here, choose a small coordinate cylinder whose vertical lines are timelike. Achronicity permits at most one boundary point on each such line. The openness of the past set and local timelike cone bounds show that the boundary is a graph over a spatial ball, with a uniform Lipschitz bound. Shrinking the cylinder removes any edge of this graph. This description also shows that both of its local sides are nonempty.
  The boundary is invariant. At every differentiability point its tangent hyperplane therefore contains $xi$. An achronal tangent hyperplane cannot contain a timelike vector. Since $xi$ is nonzero and causal, it is null there, and the hyperplane is precisely $xi^perp$. Continuity gives $W = 0$ throughout $frak(H)$. This proves smoothness as well. Indeed, in the preceding graph chart write the graph as $x^0 = f \( x^1 \, x^2 \, x^3 \)$. The smooth plane field $xi^perp$ is transverse to the vertical direction. Its graph slopes are smooth functions $a_i \( x^0 \, x \)$; the weak derivatives of $f$ satisfy $partial_i f = a_i \( f \( x \) \, x \)$ almost everywhere. The right sides are continuous. Mollification, or integration on coordinate lines, shows that these are the classical derivatives of a $C^1$ function. This identity then gives successively $C^2 \, C^3 \, dots.h$ regularity. In particular no regular-level-set assumption on $W$ is involved.
  Intersecting with $z = 0$ gives a smooth embedded two-sided surface $C = partial A$ in $"int" Omega$. The intersection is transverse because the $z$-slice is spacelike while the null normal $xi$ is nonzero. Invariance identifies $frak(H)$ with $bb(R) times C$. Since $W > 0$ in a deleted collar of $S$ and on the end, $C$ lies in a compact subset of $"int" Omega$. It is closed there and thus compact. A compact smooth embedded surface has finitely many components: finitely many connected local submanifold charts cover it, and each component contains one of these charts. In particular there is no accumulating family of extra frontier components.
  Choose the normal $nu_C$ into the end-side exterior. On each connected component of $C$,
  $ xi = u \( n + epsilon nu_C \) \, #h(2em) epsilon in { 1 \, - 1 } \, $
  where $n$ is the future normal to $z = 0$ and the sign is constant on that component. The null second form of $frak(H)$ along its Killing normal is zero: for tangent vectors $Y \, Z$ to a spacelike section it is symmetric by hypersurface orthogonality and has symmetric part $1 / 2 \( cal(L)_xi upright(bold(G)) \) \( Y \, Z \) = 0$. Its trace therefore vanishes. Thus $C$ is marginal for one of the two expansion signs on each component.
  The connected collar of the connected surface $S$ contains no frontier point. It is consequently wholly contained in $A$ or wholly excluded from $A$. The closure of $A$ in $Omega$ is a connected closed smooth exterior with full boundary $C union S$ in the first case and $C$ in the second. It contains the distant end. The local excluded side at every point of $C$ shows that its complementary obstacle contains an additional nonempty open subset outside the original obstacle. Its components have the marginal signs just determined, together with the original sign on $S$ if that component is present. This contradicts Proposition 51. Hence $frak(H)$ is empty. Connectedness of $frak(R)$ proves the assertion. ◻
]

The componentwise choice of sign in Proposition 51 is essential here: a boundary of a chronological future need not have the future marginal sign of the original surface.

=== 10.2 A smooth bifurcation attachment <a-smooth-bifurcation-attachment>

We first prove the regularity fact needed when the stationary lapse vanishes at the original boundary. All covariant derivatives in the next lemma are spacetime covariant derivatives taken on the open collar. Their limiting coefficients are evaluated in a spatial orthonormal frame and the future normal of the original slices.

#thm([Lemma 10.2.])[
  #emph[Suppose $u \|_S = 0$. The tensors $bold(nabla)^j upright(bold(F))$ and $bold(nabla)^j upright(bold(R m))$, for every integer $j gt.eq 0$, have smooth one-sided limiting coefficients at $S$ in this frame. So does $bold(nabla) xi$. At $S$ the latter tensor is the endomorphism $B$ given by 
#[#set math.equation(numbering: n => "(10.3)")
 $ B nu = kappa n \, #h(2em) B n = kappa nu \, #h(2em) B \|_(T S) = 0 . $ <st:boost-generator>]

 Every limiting curvature and Maxwell jet is invariant under $B$, acting on all its tensor and derivative slots. It is also invariant under the map $I_b$ which reverses both $n$ and $nu$ and fixes $T S$.]
] <st:covariant-jets>

#proof[
  Choose a smooth spatial orthonormal frame $e_i$ on an original collar patch and extend it, and $n$, by stationarity. For spatial directions the spacetime connection is nonsingular:
  $ bold(nabla)_(e_i) n = K_i zws^j e_j \, #h(2em) bold(nabla)_(e_i) e_j = Gamma_(i j)^k e_k + K_(i j) n . $
  In particular spatial covariant differentiation preserves smooth one-sided coefficients. The spatial derivatives of $xi = u n + X$ are
  #[#set math.equation(numbering: n => "(10.4)")
   $ bold(nabla)_(e_i) xi = \( e_i u + K \( e_i \, X \) \) n + \( u K_i zws^j + D_i X^j \) e_j . $ <st:derivative-killing>]
  Skew symmetry of $bold(nabla) xi$ determines its remaining components without division by $u$. The boundary identities $u = 0$, $X = 0$, $D X = 0$, and $d u = kappa nu^flat$ give Equation (10.3). Also $\[ xi \, e_i \] = \[ xi \, n \] = 0$, so the connection coefficients along $xi$ are the coefficients of $bold(nabla)_(e_i) xi$ and $bold(nabla)_n xi$ and are bounded and smooth in the same sense.
  The order-zero Maxwell coefficients are the original electric and magnetic fields. Gauss–Codazzi determines $upright(bold(R))_(i j k l)$ and $upright(bold(R))_(n i j k)$ from $g \, K$ and their spatial derivatives. In the deleted collar the Ricci tensor is
  $ upright(bold(R i c))_(a b) = 2 (upright(bold(F))_(a c) upright(bold(F))_b zws^c - 1 / 4 upright(bold(G))_(a b) upright(bold(F))_(c d) upright(bold(F))^(c d)) \, $
  because the Maxwell stress is trace free. The contraction identity
  #[#set math.equation(numbering: n => "(10.5)")
   $ upright(bold(R))_(n i n j) = sum_k upright(bold(R))_(k i k j) - upright(bold(R i c))_(i j) $ <st:ricci-block>]
  then supplies the remaining curvature block (with the same curvature convention in Gauss–Codazzi and this identity). All order-zero coefficients therefore have smooth limits.
  Here is an induction which controls every normal derivative. Write $F_j = bold(nabla)^j upright(bold(F))$ and $R_j = bold(nabla)^j upright(bold(R m))$, with derivative slots listed from outermost to innermost. Suppose all orders below $j$ have smooth limits. Any component of order $j$ having a spatial derivative slot has a smooth limit: commute that derivative to the outermost slot and use the displayed spatial connection formulas. The commutators are sums of contractions of lower derivatives of curvature with lower derivatives of the tensor being differentiated. Their total derivative order is $j - 2$, so the induction hypothesis controls every term.
  It remains to treat derivative slots $n \, dots.h \, n$. Apply $j - 1$ covariant derivatives to closure and co-closure of $upright(bold(F))$, and evaluate their free derivative slots on $n$. Metric compatibility allows these tensor identities to be contracted directly; derivatives of a chosen extension of the frame do not enter. For spatial $i \, l$ they read
  #[#set math.equation(numbering: n => "(10.6)")
   $ F_j \( n^j \; i \, l \) & = - F_j \( n^(j - 1) \, i \; l \, n \) - F_j \( n^(j - 1) \, l \; n \, i \) \,\
F_j \( n^j \; n \, i \) & = sum_l F_j \( n^(j - 1) \, l \; l \, i \) . $ <st:maxwell-curl-jets>]
  Here $n^j$ means $j$ derivative slots equal to $n$. Every right-hand side has a spatial derivative slot and was already controlled. These identities give all of $F_j$ first.
  The differentiated differential Bianchi identity similarly gives
  #[#set math.equation(numbering: n => "(10.7)")
   $ R_j \( n^j \; i \, l \, a \, b \) = - R_j \( n^(j - 1) \, i \; l \, n \, a \, b \) - R_j \( n^(j - 1) \, l \; n \, i \, a \, b \) . $ <st:bianchi-jets>]
  By pair symmetry this covers every curvature component except the block with two normal tensor slots, $R_j \( n^j \; n \, i \, n \, l \)$. Differentiating Equation (10.5) supplies that component. The differentiated Ricci tensor is a sum of products of the already controlled $F_0 \, dots.h \, F_j$. This closes the joint induction. Each right-hand side has smooth coefficients on the original closed collar, so the conclusion is smooth one-sided dependence, including all spatial derivatives, rather than merely bounded limits. No identity in the induction solves a time evolution equation by dividing by $u$.
  For $T = bold(nabla)^j upright(bold(F))$ or $bold(nabla)^j upright(bold(R m))$, Killing invariance of the connection gives $cal(L)_xi T = 0$. Written covariantly this is
  $ 0 = bold(nabla)_xi T + \( bold(nabla) xi \) dot.op T . $
  The first term tends to zero: it is $u bold(nabla)_n T + X^i bold(nabla)_(e_i) T$, and the next-order jets have just been controlled. Thus $B dot.op T = 0$ at the edge. In the null basis $n + nu \, n - nu$ the two eigenvalues of $B$ are $kappa \, - kappa$. A component of an invariant covariant tensor can be nonzero only when its total boost weight is zero. Counting its derivative slots as well as its tensor slots, it therefore contains equal numbers of the two normal null directions. Their simultaneous sign reversal has even total degree. This proves the $I_b$ invariance. ◻
]

#thm([Lemma 10.3.])[
  #emph[Let $a \( r \, y \)$ be smooth for $r gt.eq 0$, with $y$ in a compact smooth manifold. If all odd $r$-derivatives vanish at $r = 0$, then $a \( r \, y \) = a_0 \( r^2 \, y \)$ for a function $a_0$ smooth up to $r^2 = 0$. If all even derivatives vanish, then $a \( r \, y \) = r a_1 \( r^2 \, y \)$ with $a_1$ smooth. Both assertions hold for tensor coefficients in smooth local frames and uniformly with all tangential derivatives.]
] <st:smooth-parity>

#proof[
  In the first case Taylor’s formula to arbitrarily high order gives
  $ a \( r \, y \) = sum_(j = 0)^L a_j \( y \) r^(2 j) + r^(2 L + 2) b_L \( r \, y \) \, $
  where $b_L$ is smooth. Put $p = r^2$. Repeatedly applying $partial_p = \( 2 r \)^(- 1) partial_r$ to the remainder, up to order $h lt.eq L$, bounds the result by $C p^(L + 1 - h)$; the same estimate holds after any prescribed tangential derivatives. Hence $a \( sqrt(p) \, y \)$ has the derivatives at $p = 0$ prescribed by the polynomial, continuously to every order. In the second case, Hadamard’s formula writes $a = r b$ with $b$ smooth; the Taylor coefficients of $b$ have the parity of the first case. This proof also treats a smooth flat remainder and makes no analyticity assumption. ◻
]

#thm([Proposition 10.4.])[
  #emph[There is a smooth time-oriented Lorentzian manifold $\( tilde(frak(R)) \, upright(bold(G)) \)$ containing $frak(R)$ and a compact smooth spacelike surface $B_0$ naturally identified with $S$, such that the following properties hold.]
  + #emph[The Killing field extends smoothly, has complete flow, vanishes on $B_0$, and is a nondegenerate boost in its normal plane with constant $kappa$.]
  + #emph[The two-form $upright(bold(F))$ has a smooth invariant extension. The field equations continue to hold on the original right wedge.]
  + #emph[A neighborhood of the added surfaces is a band ${ \| U V \| < p_0 } times S$, with 
$ xi = kappa \( V partial_V - U partial_U \) \, #h(2em) B_0 = { U = V = 0 } \, $

 and its overlap with $frak(R)$ is $U \, V > 0$.]
  + #emph[If $u \|_S > 0$, the original stationary chart extends to the future horizon $U = 0 \, V > 0$, with each original boundary section at a finite positive $V$. If $u \|_S = 0$, the original slice extends to $B_0$. In both cases the metric of $B_0$ is the original metric on $S$.]
] <st:attachment>

#proof[
  First suppose $u \|_S > 0$. The equation $d W = 2 kappa X^flat$ on $S$ makes $W$ a global positive defining function on a boundary collar. Use coordinates $\( W \, y \)$ there. Division of a smooth tensor vanishing on the boundary by its defining function gives a smooth one-form $beta$ with
  $ X^flat = frac(d W, 2 kappa) + W beta . $
  Set
  #[#set math.equation(numbering: n => "(10.8)")
   $ V = e^(kappa z) \, #h(2em) U = W e^(- kappa z) \, #h(2em) p = U V = W . $ <st:positive-coordinates>]
  Substitution into Equation (10.1) cancels the singular terms and gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ upright(bold(G)) = kappa^(- 2) d U thin d V + 2 / kappa U beta thin d V + g \, $ <st:positive-extension>]
  where $beta \, g$ are pulled back from $\( p \, y \)$; in such pullbacks $d W = V d U + U d V$. This is smooth at both null faces and at their intersection. At the intersection its normal block is $kappa^(- 2) d U thin d V$ and its tangential block is $g \|_(T S)$.
  To extend the Maxwell tensor, write in the original regular chart
  $ upright(bold(F)) = d z and e + alpha_2 \, #h(2em) e = iota_xi upright(bold(F)) . $
  At $W = 0$ the vector $xi$ is the null normal of a smooth Killing horizon. Its null second form vanishes by the Killing equation. The null Raychaudhuri equation, either with an affine generator or with its nonaffine term proportional to the zero expansion, gives $upright(bold(R i c)) \( xi \, xi \) = 0$. Electrovacuum holds up to this horizon by continuity from the deleted collar. Thus
  $ 0 = upright(bold(R i c)) \( xi \, xi \) = 2 \| iota_xi upright(bold(F)) \|_(upright(bold(G)))^2 . $
  The one-form $iota_xi upright(bold(F))$ annihilates $xi$. On the orthogonal space of a null vector the metric is positive semidefinite with precisely its null line as kernel. The last equality therefore implies that $e$ is proportional to the metric dual of $xi$, hence to $d W$, at the horizon. Smooth division gives $e = b thin d W + W gamma$ with $b \, gamma$ smooth on the collar. The potentially singular terms become
  $ d z and b thin d W = - b / kappa d U and d V \, #h(2em) d z and W gamma = U / kappa d V and gamma . $
  All remaining terms are smooth pullbacks from $\( p \, y \)$.
  Now suppose $u \|_S = 0$. In original normal distance $s$ the boundary identities give $u = kappa s + O \( s^2 \)$ and $X = O \( s^2 \)$ with smooth Taylor factors. Thus the tensors
  #[#set math.equation(numbering: n => "(10.10)")
   $ A_s = W^(- 1) X^flat \, #h(2em) h_s = g + W^(- 1) X^flat ⊗ X^flat $ <st:orbit-collar>]
  are smooth up to $S$, and $h_s$ is positive definite and equals $g$ there. The metric is $upright(bold(G)) = - W \( d z - A_s \)^2 + h_s$. Let $\( r \, y \)$ be the Gaussian normal coordinates of $h_s$ at $S$, and put
  $ H \( r \, y \) = integral_0^r \( A_s \)_r \( t \, y \) thin d t \, #h(2em) z' = z - H \( r \, y \) . $
  In these coordinates $A_s - d H$ has no radial component. It follows that $G_(r r) = 1$ and $G_(r a) = 0$ for $a eq.not r$. Therefore the curves $r mapsto \( z' \, r \, y \)$ are unit spacelike geodesics, and $Y_A = partial_(y^A)$ and $xi = partial_(z')$ along them are Jacobi fields. Notice that $r$ is a smooth original defining function with $r = s + O \( s^2 \)$.
  We prove the precise parity of their coefficients. The connection along these geodesics is smooth one-sided: their velocities are smooth linear combinations of original spatial directions and $xi$, whose connection coefficients were controlled in Lemma 58. A parallel orthonormal frame with a prescribed limiting basis at $r = 0$ is therefore obtained by a linear ODE with smooth coefficients on a closed half interval. The radial velocity has limiting value $nu$. The values $Y_A \( 0 \)$ are tangent to $S$, while $xi \( 0 \) = 0$ and $D_r xi \( 0 \) = kappa n$.
  For completeness, $D_r Y_A \( 0 \)$ is normal to $S$. The Killing identity $bold(nabla) \( bold(nabla) xi \) = upright(bold(R m)) * xi$ shows that the tangential derivative of $B = bold(nabla) xi$ vanishes at the edge. Hence the projector $P = B^2 \/ kappa^2$ onto $"span" \( n \, nu \)$ is parallel there in every tangent direction. The vector $\( 1 - P \) partial_r$ vanishes at the edge, with its tangential derivatives. Differentiating this equality tangentially yields $\( 1 - P \) bold(nabla)_(Y_A) partial_r = 0$. Since coordinate fields commute, this is the assertion about $D_r Y_A \( 0 \)$.
  Let $I_b$ act in the parallel frame as in Lemma 58. The $j$th radial derivative of curvature at zero is its $j$th covariant derivative contracted with $j$ copies of $nu$. Its transformation under $I_b$ consequently acquires the factor $\( - 1 \)^j$. Differentiate the Jacobi equation
  $ D_r^2 Y + upright(bold(R)) \( Y \, partial_r \) partial_r = 0 . $
  The initial values are fixed by $I_b$ and their initial derivatives change sign. Induction in this equation gives $I_b D_r^j Y \( 0 \) = \( - 1 \)^j D_r^j Y \( 0 \)$ for both $Y = Y_A$ and $Y = xi$. The contractions $upright(bold(G)) \( Y_A \, Y_B \)$, $upright(bold(G)) \( xi \, Y_A \)$ and $upright(bold(G)) \( xi \, xi \)$ therefore have only even Taylor coefficients. The initial values and Equation (10.3) give
  $ upright(bold(G)) \( xi \, Y_A \) = O \( r^2 \) \, #h(2em) upright(bold(G)) \( xi \, xi \) = - kappa^2 r^2 + O \( r^4 \) . $
  For $upright(bold(F))$, the same differentiated contraction rule uses all its covariant jets. Contractions on two Jacobi fields have even parity, and contractions with one radial velocity and one Jacobi field have odd parity. Also $upright(bold(F)) \( xi \, Y_A \) = O \( r^2 \)$ because $xi \( 0 \) = 0$. Lemma 59 now gives the following actual smooth coefficient formulas, with $p = r^2$:
  #[#set math.equation(numbering: n => "(10.11)")
   $ upright(bold(G)) =  & d r^2 + \( - kappa^2 p + p^2 a \) thin d z' ""^2 + 2 p b_A thin d z' d y^A + c_(A B) thin d y^A d y^B \,\
upright(bold(F)) =  & 1 / 2 f_(A B) thin d y^A and d y^B + p e_A thin d z' and d y^A + r q_A thin d r and d y^A + r d thin d r and d z' . $ <st:even-metric>]
  All coefficients in these displays are smooth in $\( p \, y \)$ up to $p = 0$. Smooth dependence of the geodesic and parallel-frame ODEs on $y$ makes these conclusions uniform with every tangential derivative. The statements are tensorial on overlapping charts of $S$, so they define global tensors on its collar.
  Set
  #[#set math.equation(numbering: n => "(10.12)")
   $ V = r e^(kappa z') \, #h(2em) U = r e^(- kappa z') . $ <st:zero-coordinates>]
  Then
  $ d r^2 - kappa^2 r^2 d z' ""^2 = d U thin d V \, #h(2em) p thin d z' = frac(U thin d V - V thin d U, 2 kappa) \, $
  $ r thin d r = frac(V thin d U + U thin d V, 2) \, #h(2em) r thin d r and d z' = frac(d U and d V, 2 kappa) . $
  Equations (10.11)–(10.11) are thus smooth in $\( U \, V \, y \)$. Their metric at $U = V = 0$ has normal block $d U thin d V$ and tangential block $g \|_(T S)$.
  In each case extend the finitely many smooth coefficient tensors in $p gt.eq 0$ to $\| p \| < p_0$, keeping the displayed invariant forms. A smooth extension exists by collar extension in each coordinate patch and a partition of unity on the compact $S$. Lorentz signature and time orientation hold near $B_0$ by the nondegenerate leading blocks. They hold on the entire sufficiently small band: the boost $U mapsto e^(- kappa t) U$, $V mapsto e^(kappa t) V$ takes any point with $p eq.not 0$ to one with $\| U \| = \| V \| = sqrt(\| p \|)$, and takes a point on a punctured null face arbitrarily close to $B_0$. The extended formulas are invariant under these boosts.
  Glue this open band to the deleted collar of $frak(R)$ by Equation (10.8) or Equation (10.12). This is a collar gluing of smooth manifolds. To check its separation property, a sequence in the overlap which tends to an added null face has $p arrow.r 0$ or unbounded original time and cannot have a limit in $frak(R)$; a sequence tending to the outer collar boundary has no limit in the open added band. No pair of distinct retained points is therefore identified by a limiting overlap sequence. Local collar charts and the old charts give a Hausdorff, second-countable manifold. The translations and boosts agree on the overlap, and both are defined for every real parameter. Their resulting Killing flow is complete.
  In the positive-lapse case the original regular chart gives $U = 0 \, V = e^(kappa z)$ on $S$; in the zero-lapse case $r = 0$ gives $B_0$ and the original $z = 0$ slice has a smooth finite $z'$ offset. These observations also identify the induced metric on $B_0$ and the indicated original boundary. The extension was constructed for this geometric purpose; only its restriction to $frak(R)$ is used in the field equations below. ◻
]

#prodef([Remark 10.5.])[
  The tensors in Equation (10.10) will also be useful after obtaining staticity. In the positive-lapse case they satisfy
  $ A_s = frac(1, 2 kappa) d log W + beta \, #h(2em) h_s = g + frac(d W^2, 4 kappa^2 W) + 1 / kappa d W thin beta + W beta^2 . $
  Thus $h_s$ extends as a smooth positive tensor to the collar with defining function $r = sqrt(W)$, and is invariant under $r mapsto - r$ as a tensor. Its coefficients with one radial index have odd parity; the others have even parity. In the zero-lapse case $A_s$ is smooth in the original structure, and $sqrt(W)$ is a smooth positive multiple of the original defining function. The two smooth collar structures need not coincide in the positive-lapse case.
] <st:orbit-boundary>

=== 10.3 The stationary end and a global temporal graph <the-stationary-end-and-a-global-temporal-graph>

#thm([Proposition 10.6.])[
  #emph[The stationary end admits coordinates $\( t \, x^1 \, x^2 \, x^3 \)$ with $xi = partial_t$. Writing $rho = \| x \|$ in this chart, one has for every fixed integer $j gt.eq 0$ 
#[#set math.equation(numbering: n => "(10.13)")
 $ upright(bold(G))_(a b) - eta_(a b) = O_j \( rho^(- 1) \) \, #h(2em) upright(bold(F))_(a b) = O_j \( rho^(- 2) \) . $ <st:strong-end>]

 All these estimates have the corresponding scaled Hölder bounds. The coordinates are obtained from a constant rest chart by stationary corrections $O_(2 \, gamma) \( rho^(1 - q_1) \)$, where $1 \/ 2 < q_1 < q_0 < min \( q \, 1 \)$ and $0 < gamma < 1$ can be chosen smaller as needed. In particular, on the end the orbit metric $h_s$ satisfies $h_s - delta = O_j \( rho^(- 1) \)$ and $W = 1 + O_j \( rho^(- 1) \)$.]
] <st:stationary-end>

#proof[
  Proposition 54 gives a constant limiting metric for Equation (10.1), with error $O_2 \( rho^(- q_0) \)$, and a unit timelike limiting $xi$, since $\( b^0 \)^2 - \| b \|^2 = 1$. A constant linear change of coordinates puts this metric in rest form $eta$ while keeping the new spatial coordinates constant along Killing orbits. Explicitly, in the limiting product coordinates one can take $t_(*) = z - b_i x^i$ and a spatial linear map whose Euclidean quadratic form is $delta_(i j) + b_i b_j$. The old and new spatial radii are comparable. Maxwell components remain $O_1 \( rho^(- 2) \)$ under this constant change.
  We describe the coordinate improvement to account for the weak initial derivative bounds. For a stationary scalar the wave operator has the form
  $ L = upright(bold(G))^(i j) partial_i partial_j + d^i partial_i \, #h(2em) upright(bold(G))^(i j) = delta^(i j) + O_1 \( rho^(- q_0) \) \, quad d^i = O_0 \( rho^(- 1 - q_0) \) . $
  It is uniformly elliptic on a sufficiently distant end because $W > 0$ there. Solve $L chi^a = - bold(square.stroked x)_(*)^a$, for the three linear spatial rest coordinates and for $x_(*)^0 = t_(*)$. The sources are $O_(0 \, gamma) \( rho^(- 1 - q_1) \)$; this Hölder estimate follows on scaled annuli from the available second metric derivatives, after decreasing $q_1$ and, if necessary, $gamma$.
  Here is a construction of the right inverse at this weight. Extend the scalar operator to the Euclidean Laplacian inside a large sphere with a smooth cutoff. This extension is only for the coordinate equation. For a source $f = O_(0 \, gamma) \( rho^(- 1 - q_1) \)$ the Newton kernel with its constant term subtracted on the far tail defines
  $ P f \( x \) = - frac(1, 4 pi) integral_(bb(R)^3) (frac(1, \| x - y \|) - frac(chi_oo \( y \), \| y \|)) f \( y \) thin d y \, $
  where $chi_oo = 1$ outside a fixed ball and vanishes near zero. The tail is absolutely convergent because the difference of kernels is $O \( \| x \| thin \| y \|^(- 2) \)$. Splitting the integral into $\| y \| < \| x \| \/ 2$, $\| y \| asymp \| x \|$, and $\| y \| > 2 \| x \|$ gives $\| P f \( x \) \| lt.eq C \( 1 + \| x \| \)^(1 - q_1)$. For example, the last region is bounded by $C \| x \| integral_(2 \| x \|)^oo s^(- 1 - q_1) thin d s$; the other regions give the same power. Differentiation of the kernel for first derivatives and scaled interior Schauder estimates for second derivatives give the weighted $C^(2 \, gamma)$ bound. Thus $P$ is a bounded right inverse from weight $- 1 - q_1$ to weight $1 - q_1$.
  After rescaling the cutoff radius to one, the coefficient norm of $L - Delta$ between these spaces tends to zero with that radius. The convergent Neumann series for $1 + P \( L - Delta \)$ gives the required corrections $chi^a = O_(2 \, gamma) \( rho^(1 - q_1) \)$. They are smooth by local elliptic regularity. Their first derivatives tend to zero, so the new spatial coordinates are a diffeomorphism on a further tail. Since the corrections are stationary,
  $ bold(square.stroked t) = bold(square.stroked x)^i = 0 \, #h(2em) xi \( t \) = 1 \, #h(2em) xi \( x^i \) = 0 . $
  In particular $xi$ remains exactly $partial_t$.
  In these harmonic coordinates the reduced Ricci equation has scalar principal part
  #[#set math.equation(numbering: n => "(10.14)")
   $ upright(bold(G))^(i j) partial_i partial_j upright(bold(G))_(a b) = cal(Q)_(a b) \( upright(bold(G)) \, partial upright(bold(G)) \) - 2 upright(bold(R i c))_(a b) \, $ <st:harmonic-equation>]
  where $cal(Q)$ is quadratic in first derivatives with smooth bounded coefficients near $eta$. The coordinate construction starts with scaled $C^(1 \, gamma)$ bounds for the metric error and scaled $C^(0 \, gamma)$ bounds for the Maxwell field. The Ricci source is quadratic in $upright(bold(F))$, since the end is electrovacuum. Schauder estimates in Equation (10.14) therefore give scaled $C^(2 \, gamma)$ bounds for the metric. The Maxwell equations then give one additional field derivative. One way to see the latter step precisely is to square closure and co-closure:
  $ bold(square.stroked) upright(bold(F)) = upright(bold(R m)) * upright(bold(F)) . $
  By stationarity this is elliptic. Its coefficients have the metric regularity just obtained and its zeroth-order source has scaled $C^(0 \, gamma)$ bounds. Interior $W^(2 \, p)$ estimates first improve the bounded first field derivatives to $C^(0 \, gamma')$ bounds for any fixed $gamma' < 1$ by taking $p$ large; Schauder estimates then apply. Equivalently the stationary Hodge system is elliptic because the symbol of $d + delta$ squares to $upright(bold(G))^(i j) zeta_i zeta_j > 0$ for a nonzero spatial covector. Repeating these two estimates gives, on every scaled annulus,
  $ partial^j \( upright(bold(G)) - eta \) = O \( rho^(- q_1 - j) \) \, #h(2em) partial^j upright(bold(F)) = O \( rho^(- 2 - j) \) $
  for every fixed $j$. The constants may depend on $j$. This bootstrap uses only the original two metric derivatives and one field derivative to start, and only ellipticity on the distant timelike region.
  It follows from Equation (10.14), replacing its principal coefficients by $delta^(i j)$ and using the just-proved second derivative estimate, that
  #[#set math.equation(numbering: n => "(10.15)")
   $ Delta_delta \( upright(bold(G))_(a b) - eta_(a b) \) = O_j \( rho^(- 2 - 2 q_1) + rho^(- 4) \) $ <st:integrable-laplacian>]
  for every $j$. The right side is integrable in three dimensions because $2 q_1 > 1$. Multiply a component of the decaying perturbation by a cutoff on the end and call its Euclidean Laplacian $f$. The unsubtracted Newton integral of $f$ is now $O \( rho^(- 1) \)$: the inner region is bounded by $C rho^(- 1) parallel f parallel_(L^1)$ and the comparable and outer regions are $O \( rho^(- 2 q_1) \)$. Its difference from the cutoff perturbation is an entire harmonic function tending to zero, hence vanishes by the maximum principle. Scaled estimates for the Poisson equation and its derivatives prove the first estimate in Equation (10.13) to every order. The field estimate is already known. One further derivative implies each desired scaled Hölder estimate. Finally $h_(s \, i j) = upright(bold(G))_(i j) - upright(bold(G))_(0 i) upright(bold(G))_(0 j) \/ upright(bold(G))_00$ and $W = - upright(bold(G))_00$ give the asserted orbit estimates. ◻
]

#thm([Lemma 10.7.])[
  #emph[There is a smooth function $s_0$ on $frak(R)$ satisfying $xi \( s_0 \) = 1$, whose differential is timelike, such that 
#[#set math.equation(numbering: n => "(10.16)")
 $ s_0 = frac(1, 2 kappa) log V / U $ <st:time-near-bifurcation>]

 near the attachment and $s_0 = t + upright("constant")$ on the harmonic rest end of Proposition 62. Each level of $s_0$ is a Cauchy hypersurface of $frak(R)$.]
] <st:temporal-graph>

#proof[
  The covector in Equation (10.16) is timelike on a sufficiently small positive collar. This can be checked at $U = V = sqrt(p)$ in the smooth metrics of Proposition 60 and then everywhere on the positive collar by boost invariance. In the positive-lapse case it is $d z - \( 2 kappa W \)^(- 1) d W$. Choose a smooth radial cutoff $chi \( W \)$ equal to one near zero and zero outside this collar and set
  $ s_0 = z - frac(1, 2 kappa) integral^W frac(chi \( w \), w) thin d w . $
  The integration constant is chosen so that the displayed local formula holds exactly. Its differential is a convex combination of $d z$ and $d z - \( 2 kappa W \)^(- 1) d W$. Both covectors have value one on the future causal $xi$, so they lie in the same component of the timelike covector cone; that cone is convex. This proves timelikeness and extends $s_0$ to $z$ plus a constant off the collar.
  In the zero-lapse case Equation (10.16) is $z' = z - H \( r \, y \)$. Cut off $H$ in a sufficiently thin original collar. The additional spatial differential stays bounded because $H = O \( r \)$ and a cutoff derivative of order $r^(- 1)$ is multiplied by $H$. For any bounded spatial one-form $lambda$,
  $ upright(bold(G))^(- 1) \( d z + lambda \, d z + lambda \) = \| lambda \|_g^2 - u^(- 2) \( 1 - lambda \( X \) \)^2 . $
  Here $u = kappa r + O \( r^2 \)$ and $X = O \( r^2 \)$. Thus the negative term dominates uniformly on a sufficiently thin collar, including the cutoff annulus. This again continues the desired time as $z$ plus a constant.
  On the far end replace this time by the harmonic rest time $t$ plus a constant. Both time covectors have value one on $xi$; their limiting Minkowski covectors, and the segment joining them, are uniformly timelike. Their difference of functions is a spatial linear function plus $O \( rho^(1 - q_1) \)$ and a constant. If the interpolation cutoff varies by one over a sufficiently long interval of $log rho$, the extra differential is at most $C \/ L$, where $L$ is the length of that interval. Choose $L$ large, and then its starting radius large. This error is smaller than the uniform timelike margin of the convex segment. The resulting smooth function has all the asserted local formulas and is temporal globally. Each modification was a globally defined stationary function, so $xi \( s_0 \) = 1$ is preserved.
  We check the Cauchy assertion quantitatively. Write $r = sqrt(U V)$ in the positive collar and use $\( s_0 \, r \, y \)$ there. At $s_0 = 0$ the smooth extension has a positive radial coefficient, a positive tangential metric, and time coefficient a negative constant times $r^2$. The remaining terms in the formulas of Proposition 60 can be absorbed into these leading quadratic forms for small $r$. Uniformly for a causal tangent vector one obtains
  #[#set math.equation(numbering: n => "(10.17)")
   $ \| d r \|^2 + \| d y \|^2 lt.eq C r^2 \| d s_0 \|^2 . $ <st:collar-cone>]
  Here $\| d y \|$ is measured in a fixed metric on the compact $S$. Boost invariance extends the bound to every $s_0$. In particular $\| d log \( U V \) \/ d s_0 \| lt.eq C$, so a causal curve cannot reach the deleted inner end in a finite amount of $s_0$ time. On the outer end, Equation (10.13) gives $\| d x \/ d s_0 \| lt.eq C$, excluding escape to spatial infinity in finite time. On the compact part between these two regions, temporality and stationary smooth coefficients give the same bounded-speed estimate in any fixed auxiliary spatial metric. This argument also covers compact loci where $W = 0$, since $u$ and $d s_0$ remain nondegenerate there.
  If an inextendible future causal curve had a finite upper endpoint for its $s_0$ range, these estimates would confine it to a compact spatial set away from both ends and make its spatial coordinates Cauchy as $s_0$ approaches that endpoint. It would have a limit in $frak(R)$ and could be extended by a short timelike curve, a contradiction. The past argument is identical. Thus its $s_0$ range is all of $bb(R)$, and strict monotonicity gives exactly one intersection with every level. ◻
]

=== 10.4 Causality of the attachment and its domain of dependence <causality-of-the-attachment-and-its-domain-of-dependence>

Let

#[#set math.equation(numbering: n => "(10.18)")
 $ Sigma = { s_0 = 0 } union B_0 subset tilde(frak(R)) . $ <st:sigma-definition>]

Near $B_0$ it is parametrized by $U = V = r gt.eq 0$ and $y in S$. It is therefore a smooth spacelike hypersurface with boundary $B_0$. It is closed: the local parametrization includes its only limits on the added faces, while escaping the asymptotically Euclidean end has no limit in the spacetime. It is connected and has a compact core and one Euclidean end. Its induced metric is complete with the boundary included.

#thm([Lemma 10.8.])[
  #emph[After decreasing the width of the added band, the full spacetime $tilde(frak(R))$ is strongly causal and $Sigma$ is acausal. Moreover 
#[#set math.equation(numbering: n => "(10.19)")
 $ "int" D_(tilde(frak(R))) \( Sigma \) = frak(R) . $ <st:domain-equality>]

 The equality holds using either inextendible causal curves or the timelike-curve convention for domains of dependence.]
] <st:attachment-causality>

#proof[
  We retain only a sufficiently small open band $\| U V \| < p_0$ on the added side. The invariant smooth metric formulas imply
  $ upright(bold(G))^(U U) = U^2 a \( p \, y \) \, quad upright(bold(G))^(V V) = V^2 b \( p \, y \) \, quad upright(bold(G))^(U V) = c \( p \, y \) \, #h(2em) c gt.eq c_0 > 0 \, $
  where $a \, b \, c$ are smooth and bounded for $\| p \| < p_0$. Choose a fixed large $C$ and define
  #[#set math.equation(numbering: n => "(10.20)")
   $ cal(U) = U e^(- C p) \, #h(2em) cal(V) = V e^(- C p) . $ <st:corrected-null-coordinates>]
  A direct computation gives
  #[#set math.equation(numbering: n => "(10.21)")
   $ e^(2 C p) \| d cal(U) \|_(upright(bold(G)))^2 = U^2 { a \( 1 - C p \)^2 - 2 C \( 1 - C p \) c + C^2 p^2 b } . $ <st:corrected-gradient>]
  The analogous formula interchanges $U \, a$ with $V \, b$. Taking $C$ large and then $p_0$ small makes the braces strictly negative. The two gradients are nonzero even on their respective null faces. With the right-wedge future orientation, $cal(U)$ is nonincreasing and $cal(V)$ nondecreasing along future causal curves in the band. Their difference $cal(T) = cal(V) - cal(U)$ has timelike differential: the two causal covectors have opposite orientations and are linearly independent. In particular $cal(T)$ is temporal through the intersection of the faces.
  These monotonicities also control curves which leave a coordinate neighborhood. First the right wedge is causally convex in the full attachment. A future curve leaving it across a null face must cross $U = 0$ into $U lt.eq 0 \, V > 0$. It cannot return across that face because $cal(U)$ cannot increase to positive values. It cannot leave the added band elsewhere except through the right wedge, the only old region continuing beyond the band. The corresponding past statement uses $V = 0$. The same sign argument excludes a departure and return through the right wedge for endpoints in any one of the other open quadrants. Thus the temporal functions $s_0$ and $cal(T)$ establish strong causality at points off the faces.
  There is one additional global issue at a face: a curve could otherwise travel far into the right wedge and return near that face. Fix a small $p_1 > 0$ at which the exact logarithmic formula (10.16) still holds. Suppose a future causal curve with endpoints $a \, b$ sufficiently close to a face leaves $p < p_1$ through $e$, and subsequently returns through $f$. Both crossing points have $p = p_1$ in the right wedge. The segment between them has nondecreasing $s_0$, by causal convexity and Lemma 63. Hence
  $ V_f / U_f gt.eq V_e / U_e \, #h(2em) V_f gt.eq V_e \, quad U_f lt.eq U_e . $
  Monotonicity on the initial and final band segments then gives
  #[#set math.equation(numbering: n => "(10.22)")
   $ cal(U) \( a \) cal(V) \( b \) gt.eq cal(U) \( e \) cal(V) \( f \) gt.eq p_1 e^(- 2 C p_1) > 0 . $ <st:no-return>]
  If either factor has the wrong sign, such a curve is already impossible. Otherwise the left side tends to zero as both endpoints approach any fixed point on a null face, contradicting the fixed positive lower bound. This excludes the excursion.
  For a curve that stays in the band, both corrected coordinates stay between their endpoint values. The map $\( U \, V \) mapsto \( cal(U) \, cal(V) \)$ is a local diffeomorphism throughout the smaller band, since its Jacobian is $e^(- 2 C p) \( 1 - 2 C p \) > 0$. Thus endpoints near a fixed face point confine $U \, V$ to a fixed small coordinate box. In that box and for all $y in S$, compactness and the timelike covector $d cal(T)$ give a uniform causal speed bound $\| d y \| lt.eq C thin d cal(T)$. A sufficiently small difference of endpoint $cal(T)$ values prevents angular escape from any prescribed neighborhood of the point. Combined with Equation (10.22), this is the defining local no-departure-and-return property of strong causality at every face point, including $B_0$.
  The open part of $Sigma$ is acausal by its temporal level-set description and causal convexity of the right wedge. No causal curve can join it to $B_0$. A future curve from $B_0$ starts with $cal(U) lt.eq 0 \, cal(V) gt.eq 0$ and cannot enter the right wedge; a past curve has the opposite obstruction from $cal(V) lt.eq 0$. A hypothetical connection in the other direction is the same statement with endpoints reversed. A causal curve between two points of $B_0$ would have both corrected coordinates constant zero. It would then be tangent to $B_0$, whose metric is positive definite, and must be constant. Hence the closed hypersurface $Sigma$ is acausal.
  Every inextendible causal curve in the full spacetime through a point of the right wedge has a maximal portion in that wedge which is inextendible as a curve of the wedge. By Lemma 63 this portion intersects $s_0 = 0$. Thus $frak(R) subset D \( Sigma \)$, and openness gives the inclusion into its interior.
  For the reverse inclusion, in the left wedge $U \, V < 0$ the complete Killing orbits are timelike and avoid $Sigma$. In the future quadrant $U < 0 \, V > 0$, a timelike curve can be continued to the past into the left wedge while staying in the band. To verify this directly, boost a point to $\( U \, V \) = \( - d \, d \)$, where $d = sqrt(\| U V \|)$. At fixed $y$ follow the past-directed segment
  $ U \( lambda \) = - d + 1 / 2 d lambda \, #h(2em) V \( lambda \) = d - 2 d lambda \, #h(2em) 0 lt.eq lambda lt.eq 1 . $
  Its leading normal metric norm is a strictly negative constant times $d^2$, and the perturbation is smaller uniformly when the band is small. It is therefore timelike. Along it $\| U V \| lt.eq d^2 < p_0$, and it ends in the left wedge. Continue there on a complete timelike Killing orbit in the past direction; in the future direction remain in the future quadrant until an inextendible end of the curve. Both portions avoid $Sigma$. The past quadrant has the time-reversed construction. Corners can be rounded inside the open timelike cones. Thus every point of the three other open quadrants lies on an inextendible timelike curve avoiding $Sigma$. None belongs to $D \( Sigma \)$ even for the timelike-curve convention. Finally each null face has empty interior and borders an excluded quadrant. It cannot contribute to $"int" D \( Sigma \)$. This proves Equation (10.19) with either convention. ◻
]

#figure(
  [#image("fig/bifurcation-attachment.pdf.png", width: 100%)],
  caption: [Figure 2: Normal-plane schematic of the bifurcation attachment, with $x = \( U + V \) \/ 2$, $t = \( V - U \) \/ 2$, and the transverse compact surface suppressed. The original right wedge $U \, V > 0$ is $"int" D \( Sigma \)$; only the band $\| U V \| < p_0$ is adjoined in the remaining quadrants. The auxiliary slice $Sigma$ and the maximal slice $hat(Sigma)$ (denoted $Sigma_(upright("max"))$ in the figure and $Sigma'$ in Section 11) end at the same bifurcation surface $B_0$. The original boundary $S$ lies at $B_0$ when $u \|_S = 0$, and on the future horizon $U = 0$, $V > 0$ when $u \|_S > 0$. The curved arrow denotes Killing flow. Slice shapes are schematic, with $Sigma$ equal to $t = 0$ near the attachment; the drawing is not an exact conformal diagram. ],
) <fig:st-attachment>

=== 10.5 Application of the maximal-hypersurface theorem <application-of-the-maximal-hypersurface-theorem>

#thm([Proposition 10.9.])[
  #emph[Fix $q_2 in \( 1 \/ 2 \, 1 \)$. There exists a smooth spacelike maximal hypersurface $hat(Sigma) subset tilde(frak(R))$ with $partial hat(Sigma) = B_0$, whose interior is Cauchy in $frak(R)$. Every complete Killing orbit of $frak(R)$ meets it exactly once. In the harmonic rest chart of Proposition 62 its end is a graph $t = f \( x \)$ satisfying 
#[#set math.equation(numbering: n => "(10.23)")
 $ f = O \( rho^(1 - q_2) \) \, #h(2em) partial f = O \( rho^(- q_2) \) \, #h(2em) partial^2 f = O \( rho^(- 1 - q_2) \) . $ <st:maximal-decay>]

 The graph has the corresponding higher differentiability and scaled Hölder estimates. Its Killing translates cover the right wedge.]
] <st:maximal-slice>

#proof[
  We apply the class-(b) existence theorem of Chruściel and Wald #cite(label("ChruscielWald1994")) Definitions 2.1, 2.3 and 2.4, Equation (4.1), Theorem 4.2. We verify its geometric conditions on the particular spacetime just constructed.
  The spacetime is smooth, time oriented and strongly causal by Proposition 60 and Lemma 64. The hypersurface $Sigma$ in Equation (10.18) is connected, closed, acausal, spacelike and smooth up to the compact boundary $B_0$. It is the union of a compact core and one Euclidean end. The smooth Killing field has a complete flow on the full spacetime and fixes $B_0$ pointwise. The end lies in a stationary chart with uniformly negative $G_00$, uniformly positive spatial metric, and $xi = partial_t$. Equation (10.13) supplies all derivatives and the weighted Hölder bounds of their asymptotic definition. In particular we may use differentiability order two and the fixed exponent $q_2 in \( 1 \/ 2 \, 1 \)$.
  Let $frak(M)_(upright("ext"))$ denote the Killing development of this end, as in their definition of black and white hole regions. It is exactly a stationary end of the original right wedge. Equation (10.19) identifies the open domain of dependence as $frak(R)$, and Proposition 57 gives
  $ frak(R) subset I^(-) \( frak(M)_(upright("ext")) \) ∩ I^(+) \( frak(M)_(upright("ext")) \) . $
  Thus neither black nor white hole points meet that open domain; this is their Equation (4.1). All hypotheses of #cite(label("ChruscielWald1994")) Theorem 4.2 are now satisfied. We record the analytic details that give regularity at the fixed boundary and the derivative estimates in this application. Let $tau_0$ be the smooth time function furnished by #cite(label("ChruscielWald1994")) Proposition 4.2, and let $Sigma_(*) = { tau_0 = 0 } ∩ D \( Sigma \)$ be its zero hypersurface in the closed domain, with boundary $B_0$. Its interior is Cauchy in $frak(R)$. On the end $tau_0$ is Killing time; choose the additive constant of the harmonic rest coordinate so that $tau_0 = t$ there. On this strong end we first make the reference graph maximal outside a compact set. Here is a direct construction. Rescale a sufficiently distant end by $x = R y$, $t = R theta$, and extend its stationary metric coefficients to Minkowski coefficients inside $\| y \| = 1$. The extended coefficients satisfy
  $ partial^j \( upright(bold(G)) - eta \) = O \( epsilon chevron.l y chevron.r^(- 1 - j) \) \, #h(2em) epsilon = O \( R^(- 1) \) \, #h(2em) chevron.l y chevron.r = 1 + \| y \| \, $
  with the same scaled Hölder bounds. This auxiliary extension is used only to solve the end graph equation. For a stationary graph $theta = a \( y \)$ its normalized maximal equation is $Delta a + cal(Q) \( a \) = 0$. It depends on $D a \, D^2 a$, not on $a$. Use the norm controlling
  $ frac(\| a \|, log \( 2 + \| y \| \)) \, #h(2em) chevron.l y chevron.r \| D a \| \, #h(2em) chevron.l y chevron.r^2 \| D^2 a \| $
  and the corresponding scaled Hölder seminorm, with $a \( 0 \) = 0$. The Euclidean Newton operator with its constant tail subtracted, followed by subtraction of its value at zero, is a bounded right inverse from $C_(- 2)^(0 \, gamma)$ to this space. Indeed, splitting the integral into $\| z \| < \| y \| \/ 2$, $\| z \| asymp \| y \|$, and $\| z \| > 2 \| y \|$ gives the logarithmic bound for its value and $O \( chevron.l y chevron.r^(- 1) \)$ for its first derivative; local scaled Schauder estimates give the second derivative and its seminorm. The subtracted kernel is $O \( \| y \| \| z \|^(- 2) \)$ in the last region, so that integral converges absolutely.
  On a ball of radius $C epsilon$ in this norm, $cal(Q) \( 0 \) = O_(0 \, gamma) \( epsilon chevron.l y chevron.r^(- 2) \)$ and the Lipschitz norm of $cal(Q)$ into $C_(- 2)^(0 \, gamma)$ is $O \( epsilon \)$. These estimates follow by writing the principal coefficients as their Euclidean values plus $O \( upright(bold(G)) - eta \) + O \( \| D a \|^2 \)$; all remaining terms contain a metric derivative. The contraction map $a mapsto - P cal(Q) \( a \)$ therefore gives the required graph. Differentiating its uniformly elliptic equation on scaled annuli gives all higher derivatives. Returning to $x$ and cutting off the graph on a fixed annulus gives a smooth spacelike reference hypersurface $Sigma_e$ equal to $Sigma_(*)$ on the compact core, and maximal on the distant end, where its height $a_e$ satisfies
  $ a_e = O \( log rho \) \, #h(2em) partial^j a_e = O \( rho^(- j) \) quad \( j gt.eq 1 \) . $
  The cutoff is spacelike because its gradient is small on that annulus. The end Killing time $tau_e = t - a_e$ still has $upright(bold(G)) - eta = O_j \( rho^(- 1) \)$ in its coordinates.
  Subtract the same cut-off end correction from $tau_0$ and call the resulting time function $tau$. Its differential remains timelike: it is unchanged on the compact core, and the correction has uniformly small gradient in the transition annulus and the end. Thus $tau$ is smooth through $B_0$, has $Sigma_e$ as its zero hypersurface in $D \( Sigma \)$, and equals $tau_e$ on the distant end. Its zero level is Cauchy in $frak(R)$: the compact and inner ends are unchanged, and the end correction is sublinear with vanishing derivative, so the end causal speed bound and no-escape argument, or #cite(label("ChruscielWald1994")) Lemma 4.2, apply. Exhaust $Sigma_e$ by its compact truncations, whose boundaries are $B_0 union C_i$ with $C_i$ an end coordinate sphere. Compactness of their domains of dependence is supplied by #cite(label("ChruscielWald1994")) Theorem 3.2, using the communication condition already verified. It is this compactness, not merely compactness of the truncations, that permits the smooth Dirichlet construction of #cite(label("Bartnik1984")) Theorem 4.2. As in the cited proof, its domain and edge conditions hold for these acausal truncations. We obtain smooth maximal spans $M_i$ with the exact boundary $B_0 union C_i$.
  For clarity, the uniform height argument permits this fixed inner boundary. Choose a fixed sufficiently distant cylinder $rho = R_0$, and translate $M_i$ by a Killing parameter $b_i$ so that its least $tau$ value on the cylinder is $1$. Spacelikeness bounds the oscillation on that cylinder uniformly. The compactness statement #cite(label("ChruscielWald1994")) Corollary 3.6 then confines the translated compact portions to one compact set. The geometric constants in Bartnik’s tilt estimates are uniform on these surfaces: on the compact portion this follows from the smooth regular time $tau$, and on the end from its stationary identification with $tau_e$ and the strong coefficient bounds. In particular the curvature, the lapse and its first logarithmic derivative, and the derivative of the reference unit normal are bounded. If $b_i lt.eq 0$, the translated outer boundary has time $b_i$, while $B_0$ is fixed and has time zero. Comparison on the end with the maximal reference translates also bounds the translated height above: its interface height is bounded, and its outer height is nonpositive. Together with the compact-core bound this gives a uniform upper bound for the translated height. Thus the cylinder is separated by at least one unit of time from both boundary values, and its distance below the supremum of the translated height is uniformly bounded. The interior tilt estimate #cite(label("Bartnik1984")) Theorem 3.1(iv), Equation (3.14) gives a uniform tilt bound there. The exterior test-function argument in #cite(label("Bartnik1984")) proof of Theorem 5.3, Equations (5.13)–(5.18) now bounds $- b_i$. That argument integrates only over the end, after subtracting an exterior barrier and the outer boundary time. Its cylinder trace has bounded oscillation and bounded tilt; these are precisely the two inner-boundary estimates used in its boundary term. The fixed surface $B_0$ is outside this integration region and contributes no additional term. The test function gives $log \( 2 + \| b_i \| \) lt.eq C$, with $C$ independent of $i$. For large positive $b_i$, an additional bounded translation puts the greatest cylinder time at $- 1$; applying the same argument with time reversed bounds $b_i$. This is the translation argument in #cite(label("ChruscielWald1994")) proof of Theorem 4.2, Equations (4.22)–(4.26). Consequently $\| b_i \|$ is uniformly bounded. Compactness on the interior and comparison with the maximal reference translates on the end give $\| tau \| lt.eq C$ on the original $M_i$.
  The ensuing tilt estimate includes the actual boundary. Both components of $partial M_i$ lie in ${ tau = 0 }$; their ambient mean-curvature vectors have a uniform bound, since $B_0$ is fixed and smooth and $C_i$ are end spheres. The boundary maximum argument in #cite(label("Bartnik1984")) Theorem 3.1(iii), Equations (3.10)–(3.12) therefore gives a uniform tilt bound on all of $M_i$, including $B_0$. Its hypotheses bound the geometry of the prescribed edge; they do not assume the unknown boundary gradient. In smooth coordinates across $B_0$ this makes the graph equation uniformly elliptic with fixed smooth boundary data. Boundary gradient Hölder estimates and Schauder estimates, followed by bootstrapping, give uniform bounds of every order on each fixed closed collar. The interior estimates give the same conclusion on every compact subset. A diagonal subsequence consequently converges smoothly, up to the same embedded $B_0$, to a spacelike maximal hypersurface.
  One can also read off its end estimates directly. Relative to $Sigma_e$, the graphs $M_i$ have uniformly bounded heights. For any fixed $0 < beta < 1$, the graphs $a_e plus.minus C rho^(- beta)$ are upper and lower barriers outside a fixed large sphere. The principal term has the strict sign of $Delta rho^(- beta) = beta \( beta - 1 \) rho^(- beta - 2)$; the coefficient and drift errors are lower order, since $D a_e = O \( rho^(- 1) \)$, $D^2 a_e = O \( rho^(- 2) \)$ and the stationary metric has the strong decay above. Choose $C$ to dominate the bounded inner trace. The outer trace relative to $Sigma_e$ is zero, so comparison gives the same bound uniformly in $i$. Scaled elliptic estimates give all derivative and Hölder bounds for the limiting difference. Thus its full end graph has $f = O \( log rho \)$ and $partial^j f = O \( rho^(- j) \)$ for $j gt.eq 1$, which imply (10.23) for every $q_2 < 1$. In particular its induced metric has two controlled asymptotic derivatives and its second form has one, as required below. The Cauchy assertion and covering translates follow from #cite(label("ChruscielWald1994")) Lemma 4.2 and Theorem 4.2.
  Finally, the complete nonzero causal orbit of $xi$ through any point of $frak(R)$ is an inextendible causal curve there, so it meets the Cauchy hypersurface exactly once. It is transverse to that hypersurface: a nonzero causal vector cannot be tangent to a spacelike hyperplane. The intersection map is smooth by the implicit function theorem, giving the stated global graph and covering property directly. Its future lapse is strictly positive in the interior. This application uses the existence part of the cited theorem; the additional alternatives stated there for a foliation are not needed. ◻
]

#thm([Lemma 10.10.])[
  #emph[The Killing graph over $hat(Sigma)$ respects the whole original orbit space. On its boundary collar the projection is a smooth diffeomorphism when the orbit space is given the defining function $r = sqrt(U V)$. The global electric and magnetic Killing potentials from Lemma 55 pull back to exact smooth potentials on $hat(Sigma)$, smooth up to $B_0$ and constant there.]
] <st:maximal-boundary-graph>

#proof[
  Only the boundary assertion requires more than the global graph already proved. In a smooth collar of $hat(Sigma)$ choose a defining function $q gt.eq 0$. Its boundary is the actual embedded surface $B_0$, and its inward spacelike tangent has a positive spacelike component in the $\( U \, V \)$ normal plane. Because its interior is in $U \, V > 0$, the two components of this normal-plane vector are both strictly positive. Subtracting its component tangent to $B_0$ does not change that conclusion, since the normal and tangential blocks are orthogonal at $B_0$. Hadamard’s formula consequently gives
  $ U = q thin a \( q \, y \) \, #h(2em) V = q thin b \( q \, y \) \, #h(2em) a \( 0 \, y \) > 0 \, quad b \( 0 \, y \) > 0 . $
  It follows that $r = q sqrt(a b)$ is a smooth defining function, and the orbit projection $\( q \, y \) mapsto \( r \, y \)$ has an invertible boundary derivative. Its boundary map on $S$ is the identity in these natural labels. Also the graph time $s_0 = \( 2 kappa \)^(- 1) log \( b \/ a \)$ is smooth to the boundary. This proves the collar diffeomorphism. In the positive-lapse case $r = sqrt(W)$; it is not the original defining function $W$. In the zero-lapse case it is the Gaussian coordinate of Equation (10.12).
  The Killing contractions $iota_xi upright(bold(F))$ and $iota_xi \( *_(upright(bold(G))) upright(bold(F)) \)$ are invariant and annihilate $xi$. Their pullbacks under any two sections of the orbit projection are therefore the same one-forms on the orbit space. Their global exactness on the original interior implies exactness on $hat(Sigma) \\ B_0$. Both contractions are smooth on the attachment and vanish on $B_0$, since $xi = 0$ there. Their restrictions to the closed hypersurface are closed by continuity from its interior. Local collar primitives consequently extend the global primitives smoothly: the difference of two primitives has zero differential on an overlapping connected interior patch and is a constant. A finite collar cover, or integration along its radial curves, matches these constants. The resulting boundary differential is zero, and $B_0$ is connected, so each potential has one constant value on the whole boundary. This reasoning uses no simple-connectivity assumption on $Omega$. ◻
]

== 11 Staticity, recovery of the original data, and sharpness <ri:section>

Throughout the rigidity argument the hypotheses of Theorem 5 hold. Set

$ A = 4 pi r_h^2 \, #h(2em) r_h = m + sqrt(m^2 - Q^2) > Q \, #h(2em) kappa = frac(1 - Q^2 \/ r_h^2, 2 r_h) > 0 . $

We use the stationary metric $upright(bold(G))$, Maxwell form $upright(bold(F))$, and Killing field $xi = partial_z$ constructed in Proposition 54. In particular, their restriction to the original section $z = 0$ induces the original four tensors, with the prescribed future normal and orientation. The constructions of Section 10 have not yet asserted staticity or removed the possible residual matter stress. Both conclusions will follow from an integral on the maximal hypersurface.

=== 11.1 A global maximal graph and the staticity identity <ri:staticity-subsection>

The maximal-slice integral strategy below adapts the staticity method of Sudarsky and Wald; compare #cite(label("SudarskyWald1993")) Eq. (40) and Theorem 2. We derive the identity locally, including the duality rotation, global magnetic-potential argument and aligned residual-matter term. These features and the present hypotheses are not supplied by the cited electrovacuum staticity theorem.

#thm([Lemma 11.1.])[
  (The maximal hypersurface as an orbit section).  #emph[Let $Sigma'$ be the maximal hypersurface of Proposition 65, and let $B_0$ be its bifurcation boundary. Projection along the Killing flow identifies $"int" Sigma'$ diffeomorphically with $"int" Omega$. This identification takes the end to the same end and identifies the boundary labels on $B_0$ with those on $S$. Compact cuts contained in the interiors of the two hypersurfaces, with corresponding orbit labels, are homologous in the right wedge.]
] <ri:orbit-graph>

#proof[
  Each Killing orbit in the right wedge is a complete, nonzero causal curve. It is inextendible there: in the original product its spatial label is fixed and its $z$ coordinate traverses all of $bb(R)$. The Cauchy property of $"int" Sigma'$ therefore gives exactly one intersection with each orbit. A nonzero causal vector cannot be tangent to a spacelike hypersurface. Consequently the restriction of orbit projection is a local diffeomorphism, and its bijectivity makes it a global diffeomorphism. Flowing the section thus gives a diffeomorphism
  $ bb(R) times "int" Sigma' arrow.r bb(R) times "int" Omega . $
  For a compact cut its two sections bound the compact chain swept out by the intervening finite orbit segments, which proves the homology assertion without a filling behind either boundary.
  For clarity, the identification of boundary labels does not assert that the two hypersurfaces have the same transverse defining function. In the attachment coordinates of Proposition 60, $B_0 = { U = V = 0 }$ and the right wedge has $U \, V > 0$. A spacelike hypersurface through $B_0$ is transverse to both null faces. If $s gt.eq 0$ is a smooth defining function on that hypersurface, then
  $ U = s thin a \( s \, y \) \, #h(2em) V = s thin b \( s \, y \) \, #h(2em) a \( 0 \, y \) \, b \( 0 \, y \) > 0 . $
  Thus $sqrt(U V) = s sqrt(a b)$ is a smooth defining function, and the restriction of $y$ to $B_0$ is its original boundary label. This also proves that the graph approaches precisely that boundary and no other limiting orbit. The end assertion follows from the rest-chart graph estimates in Proposition 65. ◻
]

Use primes for the geometry of $Sigma'$:

$ xi = u' n' + X' \, #h(2em) "tr"_(g') K' = 0 \, #h(2em) "sym" nabla X' = - u' K' . $

Here $u' > 0$ in the interior because $xi$ is future causal and nonzero, whereas $u' = X' = 0$ on $B_0$. The last identity follows by restricting $cal(L)_xi upright(bold(G)) = 0$ to the hypersurface, with the positive second-fundamental-form convention of Definition 1.

If $Q > 0$, perform the constant duality rotation

#[#set math.equation(numbering: n => "(11.1)")
 $ hat(upright(bold(F))) = Q_E / Q upright(bold(F)) + Q_B / Q *_(upright(bold(G))) upright(bold(F)) \, #h(2em) *_(upright(bold(G))) hat(upright(bold(F))) = Q_E / Q *_(upright(bold(G))) upright(bold(F)) - Q_B / Q upright(bold(F)) . $ <ri:duality>]

If $Q = 0$, take $hat(upright(bold(F))) = upright(bold(F))$. Let $cal(E)' \, cal(B)'$ be its induced fields on $Sigma'$. Their charges are $Q \, 0$. Indeed the original spatial restrictions of $upright(bold(F)) \, * upright(bold(F))$ are $alpha_2 \, - alpha_1$, respectively; Maxwell closure and Lemma 67 preserve their integrals. The rotation also preserves the electromagnetic stress.

#thm([Proposition 11.2.])[
  (Staticity and vanishing of matter).  #emph[On $Sigma'$ one has 
$ K' = 0 \, #h(2em) X' = 0 \, #h(2em) cal(B)' = 0 . $

 The Killing field is strictly timelike throughout the open right wedge, and its metric and rotated Maxwell form have the global form 
#[#set math.equation(numbering: n => "(11.2)")
 $ upright(bold(G)) = - \( u' \)^2 d T^2 + g' \, #h(2em) hat(upright(bold(F))) = u' thin d T and \( cal(E)' \)^flat \, #h(2em) u' = sqrt(W) . $ <ri:static-product>]

 The residual non-electromagnetic stress vanishes. The original constraint densities $mu_m \, J_m$ consequently vanish on all of $Omega$, including $S$.]
] <ri:staticity>

#proof[
  The exact potentials of Lemma 55 remain exact after rotation and pullback to the global graph. In particular,
  #[#set math.equation(numbering: n => "(11.3)")
   $ b' = iota_xi \( *_(upright(bold(G))) hat(upright(bold(F))) \) \|_(T Sigma') = u' \( cal(B)' \)^flat + \( X' times cal(E)' \)^flat = d psi . $ <ri:magnetic-potential>]
  The primitive extends smoothly to $B_0$. To see this without an assumption on its periods at the boundary, take a smooth collar primitive locally, subtract its constant difference from the interior primitive, and glue; smoothness of the one-form supplies the local primitives. Since $xi = 0$ on $B_0$, its differential vanishes there. Connectedness of $B_0$, inherited from $S$, makes $psi$ one constant $psi_0$ on the whole boundary.
  At infinity $b' = O \( r^(- 2) \)$. Radial integration gives a finite limit along each ray, and joining two rays along a sphere gives oscillation at most $C r^(- 1)$. Hence there is a single constant $psi_oo$ with $psi - psi_oo = O \( r^(- 1) \)$. Since $"div"_(g') cal(B)' = 0$ and its total flux is zero, the divergence theorem on the portion of $Sigma'$ inside a large coordinate sphere gives
  $ integral_(Sigma') b' \( cal(B)' \) thin d V_(g') & = lim_(R arrow.r oo) integral_(S_R) \( psi - psi_oo \) g' \( cal(B)' \, nu_R \) thin d A_(g') - psi_0 integral_(B_0) g' \( cal(B)' \, nu \) thin d A_(g')\
 & = 0 . $
  The outer error is $O \( R^(- 1) \)$ and the inner total flux is zero. This is precisely where a single connected boundary is needed: zero total magnetic charge would not cancel independently chosen constants on several components. Equation (11.3) therefore yields
  #[#set math.equation(numbering: n => "(11.4)")
   $ integral_(Sigma') X' dot.op \( cal(E)' times cal(B)' \) thin d V_(g') = - integral_(Sigma') u' \| cal(B)' \|^2 thin d V_(g') . $ <ri:magnetic-integral>]
  We check the normalization and sign of the other integral. Proposition 54 gives
  $ "Ein"_(upright(bold(G))) - sans(S) = h_(*) xi^flat ⊗ xi^flat \, #h(2em) h_(*) gt.eq 0 \, #h(2em) "supp" h_(*) subset { W = 0 } . $
  Here $h_(*)$ is supported away from the inner and outer collars. For the geometric constraint densities used throughout this paper, $sans(S) \( n' \, e_i \) = 2 \( cal(E)' times cal(B)' \)_i$. Also $upright(bold(G)) \( xi \, n' \) = - u'$ and $upright(bold(G)) \( xi \, e_i \) = X'_i$. The mixed Einstein constraint on the maximal slice is consequently
  #[#set math.equation(numbering: n => "(11.5)")
   $ nabla^j K'_(i j) = 2 \( cal(E)' times cal(B)' \)_i - h_(*) u' X'_i . $ <ri:mixed-constraint>]
  There is no $8 pi$ in this identity. The $8 pi$ factor belongs to the ADM momentum flux and to conversion from physical matter densities, not to these geometric densities.
  Multiply Equation (11.5) by $X' ""^i$ and integrate. Integration by parts and the Killing equation give
  $ integral_(Sigma') X' ""^i nabla^j K'_(i j) thin d V_(g') = - integral_(Sigma') K'_(i j) nabla^j X' ""^i thin d V_(g') = integral_(Sigma') u' \| K' \|^2 thin d V_(g') . $
  The inner boundary term vanishes because $X' = 0$ there. At infinity $X' = O \( r^(- q_2) \)$ and $K' = O \( r^(- 1 - q_2) \)$ for some $q_2 > 1 \/ 2$, so its absolute value is $O \( R^(1 - 2 q_2) \) arrow.r 0$. All volume integrals converge: the gravitational integrand is $O \( r^(- 2 - 2 q_2) \)$, the Maxwell squared norms are $O \( r^(- 4) \)$, and $h_(*)$ has compact support. Substituting Equation (11.4) gives the exact nonnegative identity
  #[#set math.equation(numbering: n => "(11.6)")
   $ integral_(Sigma') u' #scale(x: 120%, y: 120%)[\(] \| K' \|^2 + 2 \| cal(B)' \|^2 + h_(*) \| X' \|^2 #scale(x: 120%, y: 120%)[\)] thin d V_(g') = 0 . $ <ri:staticity-integral>]
  It follows that $K' = cal(B)' = 0$ in the interior and hence at its boundary by smoothness.
  Now $X'$ is a spatial Killing field and vanishes on the whole boundary. Its covariant derivatives in boundary tangent directions are zero. Skew symmetry of $nabla X'$ then forces all remaining components of $nabla X'$ to vanish there as well. The Killing identities form the first-order linear system $nabla X' = A$, $nabla A = "Rm"_(g') * X'$ along any curve. Its zero initial data at a boundary point give $X' = 0$ along every such curve, and connectedness gives $X' = 0$ everywhere. Thus $W = \( u' \)^2 > 0$ in the interior. Every orbit meets this slice, and $W$ is invariant under the flow, so the same conclusion holds throughout the right wedge. The support condition now forces $h_(*) = 0$. Flowing the orthogonal slice gives Equation (11.2); invariance and the vanishing of the tangential restriction of $hat(upright(bold(F)))$ give its stated form. Restriction back to $z = 0$ proves $mu_m = J_m = 0$ in the original open exterior. Smoothness of the original data extends these equalities to $S$. ◻
]

=== 11.2 The mass and boundary of the static orbit metric <ri:mass-area>

On the open orbit space, the now positive function $W$ gives

#[#set math.equation(numbering: n => "(11.7)")
 $ g' = h_s = g + W^(- 1) X_g^flat ⊗ X_g^flat gt.eq g . $ <ri:orbit-metric>]

This is an equality of metrics after orbit projection in the interior; different boundary defining functions are allowed. The induced metric of $B_0$ equals the original metric on $T S$ by the attachment. Thus $\| B_0 \|_(g') = A$. The fixed set $B_0$ is totally geodesic in spacetime: its second fundamental vector is fixed by the differential of every Killing flow, while that differential acts as a nontrivial boost in the normal two-plane and has no fixed vector there. In particular $B_0$ is minimal in $g'$. The constraint and static equations give

#[#set math.equation(numbering: n => "(11.8)")
 $ R_(g') = 2 \| cal(E)' \|_(g')^2 \, #h(2em) "div"_(g') cal(E)' = 0 \, #h(2em) Delta_(g') u' = \| cal(E)' \|_(g')^2 u' . $ <ri:static-equations>]

For the last equation, the Ricci component in the future unit normal direction of a static metric is $\( u' \)^(- 1) Delta_(g') u'$. Electrovacuum has trace-free stress and that component of its Ricci tensor is $\| cal(E)' \|^2$.

#thm([Lemma 11.3.])[
  (The original invariant mass is the static ADM energy).  #emph[The metric $g'$ is complete up to $B_0$, has one strongly asymptotically flat end, and in its stationary rest coordinates 
$ g'_(i j) - delta_(i j) = O_2 \( r^(- 1) \) \, #h(2em) cal(E)' = O_1 \( r^(- 2) \) \, #h(2em) E_(upright("ADM")) \( g' \) = m . $

 Its electric charge is $Q$ and its magnetic charge is zero.]
] <ri:static-mass>

#proof[
  Smoothness through $B_0$, compactness of the core and completeness of the end follow from Proposition 65 and Lemma 67. The symbol bounds for the stationary end in Proposition 62, together with Equation (11.7), give the stated strong asymptotic flatness and field bounds. Fluxes were checked in the proof of Proposition 68.
  We spell out why the mass is that of the original data. In the unimproved stationary coordinates the spacetime perturbation of its limiting constant Minkowski metric has differentiated decay $O_2 \( r^(- q_0) \)$, $q_0 > 1 \/ 2$. It is electrovacuum near infinity. The skew-slot flux in Lemma 17 therefore has spacetime divergence
  $ O \( r^(- 2 - 2 q_0) \) + O \( r^(- 4) \) . $
  Stokes’ Theorem between cuts in the original asymptotic plane and cuts in a plane orthogonal to the limiting Killing direction has error $O \( R^(1 - 2 q_0) \) + O \( R^(- 1) \) arrow.r 0$: the connecting chains have volume $O \( R^3 \)$ and remain at radii comparable to $R$. The same estimate permits replacing comparable large cuts by coordinate spheres. With the positive-$K$ convention, Lemma 17 pairs a translation $\( b^0 \, b^i \)$ with $b^0 E + sum_i b^i P_i$. Here the limiting unit Killing translation furnished by Proposition 54 is
  $ b^0 = E / m \, #h(2em) b^i = - P_i / m . $
  Its flux on the original section is therefore
  $ b^0 E + sum_i b^i P_i = frac(E^2 - \| P \|^2, m) = m . $
  On the orthogonal rest plane that same flux is its ADM energy. Its spatial metric and $h_s$ differ by the quadratic shift term, which is $O_1 \( r^(- 2 q_0) \)$ in this chart and contributes $O \( R^(1 - 2 q_0) \)$ to the ADM flux.
  Finally the stationary harmonic correction has spatial coordinate displacement $O_2 \( r^(1 - q_1) \)$, $q_1 > 1 \/ 2$, as in Proposition 62. Its leading metric change is a symmetric flat gradient $2 partial_(\( i) a_(j \))$. The ADM divergence of this term is $Delta a_i - partial_i "div" a$, whose divergence vanishes identically. Extend $a$ smoothly across the inside of a coordinate sphere; the flux of this leading term is exactly zero by the Euclidean divergence theorem. Products of coordinate and metric errors have flux $O \( R^(1 - 2 q_1) \) arrow.r 0$, with a smaller decay exponent chosen if necessary. The energy is consequently still $m$ in the strong asymptotic coordinates. This argument uses the original invariant ADM flux, not the mass of a deformation. ◻
]

#thm([Proposition 11.4.])[
  (Identification of the static exterior).  #emph[There is an orientation-preserving isometry from $\( Sigma' \, g' \)$ onto the canonical exterior Reissner–Nordström slice of mass $m$ and charge magnitude $Q$, including its boundary. Under this isometry, with $r$ the areal radius, 
#[#set math.equation(numbering: n => "(11.9)")
 $ g' = f^(- 1) d r^2 + r^2 sigma_2 \, #h(2em) cal(E)' = Q / r^2 sqrt(f) thin partial_r \, #h(2em) u' = sqrt(f) \, #h(2em) f = 1 - frac(2 m, r) + Q^2 / r^2 \, quad r gt.eq r_h . $ <ri:rn-static-data>]

]
] <ri:rn-identification>

#proof[
  Put $N = u'$. We first verify the electrostatic system, including its potential and asymptotic normalization. By Lemma 55 and the constant duality rotation, the one-form $iota_xi hat(upright(bold(F))) = N \( cal(E)' \)^flat$ has a global primitive. Choose its negative, denoted by $Psi$, and add a constant so that $Psi arrow.r 0$ at infinity. This normalization is possible because $d Psi = O \( r^(- 2) \)$: radial integration gives a limit along each ray, and the oscillation on a sphere is $O \( r^(- 1) \)$. Thus
  $ d Psi = - N \( cal(E)' \)^flat \, #h(2em) hat(upright(bold(F))) = d Psi and d T \, #h(2em) Psi = O \( r^(- 1) \) . $
  The primitive extends smoothly to $B_0$, as in the proof of Proposition 68. Its differential vanishes there because $xi = 0$, and connectedness makes its boundary value a single constant $Psi_0$. This is a scalar Killing potential; no global vector potential or simple connectivity is needed.
  The spatial Ricci tensor of $- N^2 d T^2 + g'$ is $"Ric"_(g') - N^(- 1) nabla^2 N$. The spatial component of the purely electric Maxwell Ricci tensor is $\| cal(E)' \|^2 g' - 2 \( cal(E)' \)^flat ⊗ \( cal(E)' \)^flat$. Together with Equation (11.8) and $"div"_(g') cal(E)' = 0$, this gives
  $ N "Ric"_(g') & = nabla^2 N - 2 / N thin d Psi ⊗ d Psi + 1 / N \| d Psi \|^2 g' \,\
Delta_(g') N & = 1 / N \| d Psi \|^2 \, #h(2em) Delta_(g') Psi = 1 / N chevron.l d N \, d Psi chevron.r . $
  These signs agree with the convention $hat(upright(bold(F))) = d Psi and d T$.
  We next establish the lapse expansion required by electrostatic uniqueness. Proposition 62 gives $N = 1 + O_j \( r^(- 1) \)$, $g' - delta = O_j \( r^(- 1) \)$, and $cal(E)' = O_j \( r^(- 2) \)$ for every fixed $j$, with scaled Hölder bounds. Hence the lapse equation implies $Delta_delta \( N - 1 \) = O_j \( r^(- 4) \)$. Multiply $N - 1$ by an end cutoff and extend it by zero to $bb(R)^3$. Its Euclidean Laplacian $b$ is integrable and is $O_j \( r^(- 4) \)$ off a compact set. The Newton potential $- \( 4 pi \)^(- 1) integral b \( y \) \| x - y \|^(- 1) thin d y$ equals this cutoff function, since their difference is an entire harmonic function tending to zero. Subtracting the monopole term and splitting the integral into $\| y \| < r \/ 2$, $\| y \| asymp r$, and $\| y \| > 2 r$ gives an $O \( r^(- 2) log r \)$ remainder. Scaled Poisson estimates give the corresponding first two derivative bounds. Consequently, for a constant $mu$,
  $ N = 1 - mu / r + O_2 \( r^(- 2) log r \) = 1 - mu / r + o_2 \( r^(- 1) \) . $
  For completeness, this coefficient is the original invariant mass. Let $cal(G)_(i j) = "Ric"_(g' \, i j) - 1 / 2 R_(g') g'_(i j)$. Expanding about the Euclidean metric, the linearized contracted Bianchi identity gives
  $ partial_j (cal(G)_(i j)^(upright("lin")) x^i + 1 / 2 \( partial_i g'_(i j) - partial_j g'_(i i) \)) = 0 . $
  Extend the metric perturbation smoothly through a fixed ball. The flux of this divergence-free vector field is zero. The nonlinear terms have size $O \( r^(- 4) \)$ and give an $O \( r^(- 1) \)$ error in the resulting flux identity. Thus, with $n_delta$ and $d A_delta$ Euclidean,
  $ E_(upright("ADM")) \( g' \) = - frac(1, 8 pi) lim_(R arrow.r oo) integral_(S_R) cal(G)_(i j) x^i n_delta^j thin d A_delta . $
  The electrostatic equations give $cal(G) = N^(- 1) nabla^2 N - 2 \( cal(E)' \)^flat ⊗ \( cal(E)' \)^flat = partial^2 N + O \( r^(- 4) \)$ in these coordinates. The last flux is therefore $- 8 pi mu + o \( 1 \)$, proving $mu = E_(upright("ADM")) \( g' \) = m$ by Lemma 69. Also, with $nu$ pointing from $B_0$ toward the end, integration of the lapse equation gives
  $ 4 pi mu = integral_(B_0) partial_nu N thin d A + integral_(Sigma') N \| cal(E)' \|^2 thin d V > 0 . $
  Here $partial_nu N = kappa > 0$ follows from the bifurcation attachment and the normalization of $xi$.
  We can now apply the connected-horizon electrostatic uniqueness theorem of Borghini, Cederbaum, and Cogo #cite(label("BorghiniCederbaumCogo2025")) Theorem 3.1 and Proposition 6.1. The spatial manifold is connected, oriented, one-ended and complete up to its compact connected boundary by Lemma 69. The metric, lapse and potential are smooth up to that actual boundary, $N > 0$ inside, $N = 0$ and $\| d N \| = kappa > 0$ on $B_0$, and $Psi$ is constant there. The displayed electrostatic system and asymptotics are exactly the required ones. The additional charge expansion imposed in that theorem when $mu = 0$ is irrelevant because $mu = m > 0$. It follows that the entire system is the subextremal Reissner–Nordström system with mass $m$ and some signed charge $q$, including its normalized lapse and potential $N = sqrt(1 - 2 m \/ r + q^2 \/ r^2)$ and $Psi = q \/ r$. Its isometry extends smoothly to the nondegenerate boundary.
  The sign is fixed by the actual flux, not by a choice of potential convention: $cal(E)' = - N^(- 1) nabla Psi$ for our convention, so the charge of this model is $q$. Lemma 69 therefore gives $q = Q$. This also covers $Q = 0$. More directly, in that case integration of $"div" \( Psi N^(- 1) nabla Psi \) = N^(- 1) \| d Psi \|^2$ gives
  $ integral_(Sigma') N^(- 1) \| d Psi \|^2 thin d V = 4 pi Psi_0 Q = 0 . $
  The boundary expression is regular because $N^(- 1) d Psi = - \( cal(E)' \)^flat$; the term at infinity tends to zero. Thus $Psi = 0$, and the zero-charge case of the same uniqueness theorem is Schwarzschild.
  The identified horizon radius is $m + sqrt(m^2 - Q^2) = r_h$. The boundary isometry is smooth in proper-distance collars, where $N$ vanishes simply. If the isometry initially reverses orientation, compose it with a reflection of the round sphere. That reflection fixes the radial lapse, potential and electric field, and makes the resulting identification orientation preserving. This proves all three identifications in Equation (11.9) on the closed exterior. ◻
]

=== 11.3 Both Maxwell charges and the original horizon section <ri:original-subsection>

With the spacetime orientation fixed in Section 2, an orthonormal coframe $e^0 \, e^1 \, e^2 \, e^3$ with volume $e^0 and e^1 and e^2 and e^3$ satisfies

$ * \( e^0 and e^1 \) = - e^2 and e^3 \, #h(2em) * \( e^2 and e^3 \) = e^0 and e^1 . $

Equations (11.2) and (11.9) therefore give

$ hat(upright(bold(F))) = Q / r^2 d T and d r \, #h(2em) * hat(upright(bold(F))) = - Q thin d A_(sigma_2) . $

For $Q > 0$ the inverse of Equation (11.1) is

#[#set math.equation(numbering: n => "(11.10)")
 $ upright(bold(F)) = Q_E / Q hat(upright(bold(F))) - Q_B / Q * hat(upright(bold(F))) = Q_E / r^2 d T and d r + Q_B thin d A_(sigma_2) . $ <ri:inverse-duality>]

For $Q = 0$ all these forms vanish and the same conclusion holds. In particular,

$ * upright(bold(F)) = Q_B / r^2 d T and d r - Q_E thin d A_(sigma_2) . $

Contraction with the future static unit normal $f^(- 1 \/ 2) partial_T$ gives the two outward fields $Q_E r^(- 2) sqrt(f) thin partial_r$ and $Q_B r^(- 2) sqrt(f) thin partial_r$. Thus neither charge sign has been changed by the identification.

#thm([Proposition 11.5.])[
  (Global realization of the original data).  #emph[The original stationary section $z = 0$ gives a smooth orientation-preserving spacelike embedding of all of $Omega$ into one Reissner–Nordström exterior together with its future horizon or bifurcation sphere. It induces the original $\( g \, K \, cal(E) \, cal(B) \)$, including their values on $S$, and its end approaches the corresponding spatial infinity.]
] <ri:original-embedding>

#proof[
  The global product in Equation (11.2) and Proposition 70 identify the right wedge with the static Reissner–Nordström exterior, with the form in Equation (11.10). The original section is a global graph there by Lemma 67. All original tensors are already induced by $upright(bold(G)) \, upright(bold(F))$ on that section; in particular its second fundamental form is the original $K$, not the zero second fundamental form of $Sigma'$. Its unit normal need not be the static normal. The contraction identities defining the original fields consequently recover both full fields even when they are nonradial or nonparallel on that section.
  It remains to verify smoothness and injectivity at the original boundary. On the open original orbit base write
  #[#set math.equation(numbering: n => "(11.11)")
   $ upright(bold(G)) = - W \( d z - A_s \)^2 + h_s \, #h(2em) A_s = W^(- 1) X_g^flat \, #h(2em) d T = d z - A_s . $ <ri:time-connection>]
  The last equality is global: $T$ is the Killing-flow coordinate based on the orthogonal global section $Sigma'$, so $T - z$ is a single-valued function of the orbit label. On the original section it says $d T = - A_s$. Let $r_(*)$ be the Reissner–Nordström tortoise coordinate, $d r_(*) \/ d r = f^(- 1)$. Since $f' \( r_h \) = 2 kappa$ and $W = f \( r \)$,
  #[#set math.equation(numbering: n => "(11.12)")
   $ r_(*) = \( 2 kappa \)^(- 1) log W + a \( W \) $ <ri:tortoise>]
  for a smooth function $a$ near $W = 0$. To verify this expansion, use the smooth inverse $r = r \( W \)$ of $f$ near $r_h$ and subtract $\( 2 kappa W \)^(- 1)$ from $d r_(*) \/ d W$; the difference is smooth. The normalization of $kappa$ is the one from Proposition 56, equivalently the surface gravity of the now normalized static Killing field.
  If $u \|_S = 0$, Proposition 60 gives smooth $A_s$ and a smooth defining function $sqrt(W)$ in the original collar. Hence $T \|_(z = 0)$ extends smoothly there. The orbit metric is a smooth nondegenerate metric in that collar, and the base isometry extends smoothly by its normal geodesic collars; its angular boundary label is a diffeomorphism. The exterior Kruskal coordinates
  $ sans(U) = - e^(kappa \( r_(*) - T \)) \, #h(2em) sans(V) = e^(kappa \( r_(*) + T \)) $
  are, by Equation (11.12), smooth multiples of $sqrt(W)$ on this section. Both vanish simply in its inward normal parameter, while the angular variables parametrize $S$. Their derivative vector is a nonzero spacelike direction in the normal two-plane, since the two nonzero factors have opposite signs. This gives a smooth immersion through the bifurcation sphere.
  The exterior in these Kruskal coordinates has $sans(U) < 0 < sans(V)$; the attachment coordinates of Section 10 have $U \, V > 0$.
  If $u \|_S > 0$, the other part of Proposition 60 gives $W$ as a smooth original boundary defining function and
  $ X_g^flat = \( 2 kappa \)^(- 1) d W + W beta \, #h(2em) A_s = \( 2 kappa \)^(- 1) d log W + beta \, $
  where $beta$ is smooth in $\( W \, y \)$. Equations (11.11) and (11.12) show that the advanced time
  $ v = T + r_(*) $
  has smooth differential $d v = - beta + a' \( W \) d W$ on the original section, and hence has a finite smooth extension to $S$. In these coordinates the spacetime metric is
  $ - f thin d v^2 + 2 thin d v thin d r + r^2 sigma_2 . $
  The sign of the logarithmic cancellation therefore selects the future horizon, where $r = r_h$ and $v$ is finite.
  Here the angular map also is smooth in the original defining function $W$, a fact that requires more than smoothness in $sqrt(W)$. Put $s = sqrt(W)$. The formula for $X_g^flat$ shows that
  $ h_s = g + W^(- 1) #scale(x: 120%, y: 120%)[\(] \( 2 kappa \)^(- 1) d W + W beta #scale(x: 120%, y: 120%)[\)]^2 $
  extends as a smooth nondegenerate tensor in $\( s \, y \)$ invariant under $s mapsto - s$. At $s = 0$ its normal coefficient is $kappa^(- 2)$ and its tangential metric is $g \|_(T S)$. Reflection is consequently a local isometry fixing the boundary. In normal geodesic collars the angular labels are constant along the normal geodesics and invariant under this reflection. The angular components of the base isometry are thus smooth even functions of $s$. Taylor’s formula with parameters makes every such function smooth in $s^2 = W$ on the one-sided collar. The radial coordinate $r = r \( W \)$ is smooth as well. We have obtained a smooth map in the regular coordinates $\( v \, r \, upright("angles") \)$, and $d r \/ d W = \( 2 kappa \)^(- 1)$ at $S$ is nonzero. Together with the boundary angular diffeomorphism this proves immersion at the future horizon and shows that $S$ maps onto a full horizon cross-section.
  In either case the limiting pullback of the ambient metric is the original smooth positive definite $g$, so the immersion is spacelike up to $S$. The induced future normal is a smooth algebraic function of its first derivatives and the ambient metric; it therefore extends smoothly as well. The second fundamental form and the two field contractions agree in the open exterior and extend by smoothness, proving their equality with the original tensors on $S$.
  The open graph is injective, its boundary angular map is injective, and the boundary image is disjoint from the open exterior. Finally its end escapes properly: the base radius tends to infinity and the rest-chart graph has the original strictly spacelike asymptotic plane slope, up to sublinear errors. Its image approaches spatial infinity in that end. Compactness of the remaining core and the boundary collar then make the injective immersion proper, hence an embedding. The spatial orientation was fixed in Proposition 70; flowing the future normal preserves the corresponding spacetime orientation. This proves the stated orientation and all the required original-data matching. ◻
]

#proof[
  The equality variation and stationary construction in Propositions 54, 56, and 65, together with Lemma 55 apply to the original equality data. Proposition 68 proves static electrovacuum in their entire right wedge. Lemma 69 preserves the original invariant mass, and Proposition 70 identifies its orbit metric, lapse, and rotated electric field. The inverse duality formula (11.10) recovers the prescribed two charge signs. Proposition 71 then realizes the entire original data, with smooth future normal and fields at its horizon boundary. The vanishing of original non-electromagnetic matter was proved in Proposition 68. ◻
]

=== 11.4 Converse and three families of sharp examples <ri:examples-subsection>

#proof[
  Write $Q_(*)^2 = q_E^2 + q_B^2$ and $R_(+) = M + sqrt(M^2 - Q_(*)^2)$. The degenerate induced metric on the future horizon is $R_(+)^2 sigma_2$, with its null direction along the generators. Every full smooth cross-section, including the bifurcation sphere, therefore has area $4 pi R_(+)^2$. The assumed original cut condition implies
  $ A_min \( S \) = \| S \|_g = 4 pi R_(+)^2 . $
  The converse assumes that the actual invariant ADM mass is $M$ and that the actual outward fluxes are $q_E \, q_B$. Substitution now gives the required equality. The examples below verify those assumptions for three explicit types of slicing. ◻
]

#thm([Proposition 11.6.])[
  (Static, non-time-symmetric, and boosted examples).  #emph[For every $M > sqrt(q_E^2 + q_B^2)$ there are admissible equality data of each of the following kinds: static data; data with $K equiv.not 0$; and data with nonzero ADM momentum. In the last family, for every sufficiently small nonzero vector $v$, the actual ADM energy and momentum are 
$ E = gamma M \, #h(2em) P = gamma M v \, #h(2em) gamma = \( 1 - \| v \|^2 \)^(- 1 \/ 2) \, $

 with the positive-$K$ convention of this paper. In all three families the actual outward charges are $q_E \, q_B$ and the original minimum enclosing area is $4 pi R_(+)^2$.]
] <ri:sharp-examples>

#proof[
  Use the converse parameters $M \, q_E \, q_B$ and set $Q_(*)^2 = q_E^2 + q_B^2$. Let
  $ f \( r \) = 1 - frac(2 M, r) + Q_(*)^2 / r^2 \, #h(2em) g_0 = f^(- 1) d r^2 + r^2 sigma_2 \, #h(2em) r gt.eq R_(+) . $
  Start with the static exterior down to the bifurcation sphere. It is smooth there in proper distance or Kruskal coordinates; its future normal and both induced Maxwell fields are smooth, $K = 0$, and its boundary is a connected minimal sphere with $theta_(+) = 0$. Its metric is complete with that boundary included. Consider also time graphs $T = h \( y \)$ in areal Cartesian variables $y = r omega$ of the following two types:
  + $h = epsilon h_0 \( r \)$, where $h_0$ is smooth with compact support in $\( R_(+) \, oo \)$, and has a critical point $r_0$ with $h''_0 \( r_0 \) eq.not 0$;
  + $h = chi \( r \/ L \) thin v dot.op y$, where $chi = 0$ for $r \/ L lt.eq 1$, $chi = 1$ for $r \/ L gt.eq 2$, $L$ is sufficiently large, and $\| v \|$ is sufficiently small and nonzero.
  All graphs agree with the static slice near $S$. Their induced metric is
  #[#set math.equation(numbering: n => "(11.13)")
   $ g_h = g_0 - f thin d h ⊗ d h . $ <ri:graph-metric>]
  For the radial graph it is $\( f^(- 1) - f \( h' \)^2 \) d r^2 + r^2 sigma_2$ and is positive for small $epsilon$. For the cutoff graph, bounded derivatives of $chi$ give $f \| d h \|_(g_0)^2 lt.eq C \| v \|^2$. Choose $\| v \|$ such that this is at most a fixed $eta < 1$. Then
  #[#set math.equation(numbering: n => "(11.14)")
   $ g_h gt.eq \( 1 - eta \) g_0 . $ <ri:metric-domination>]
  These estimates prove spacelikeness and completeness, and the unchanged inner collar supplies smoothness of the graph and its future normal at the bifurcation sphere.
  These are electrovacuum initial data with exactly the normalizations of Definition 1. One can check this directly in the static coordinates: the mixed diagonal components of the Einstein tensor are
  $ frac(r f' + f - 1, r^2) \, quad frac(r f' + f - 1, r^2) \, quad f'' / 2 + f' / r \, quad f'' / 2 + f' / r \, $
  which equal $r^(- 4) \( - Q_(*)^2 \, - Q_(*)^2 \, Q_(*)^2 \, Q_(*)^2 \)$, the components of $2 \( F_(a c) F_b zws^c - 1 / 4 upright(bold(G))_(a b) F_(c d) F^(c d) \)$. The forms
  $ F = q_E / r^2 d T and d r + q_B d A_(sigma_2) \, #h(2em) * F = q_B / r^2 d T and d r - q_E d A_(sigma_2) $
  are closed. Gauss–Codazzi with $K \( U \, V \) = upright(bold(G)) \( nabla_U n \, V \)$ gives $mu = \| cal(E) \|^2 + \| cal(B) \|^2$ and $J = 2 \( cal(E) times cal(B) \)^flat$ on every graph; the spatial pullbacks of the closed forms give both divergence constraints. Thus $mu_m = J_m = 0$ and the matter DEC holds. For every graph sphere $r = R$, $d r$ vanishes on its tangent space, so directly
  #[#set math.equation(numbering: n => "(11.15)")
   $ frac(1, 4 pi) integral_(r = R) F = q_B \, #h(2em) - frac(1, 4 pi) integral_(r = R) * F = q_E . $ <ri:example-flux>]
  The orientation is toward increasing $r$. These are precisely the induced magnetic and electric fluxes, respectively. Closure identifies them with the fluxes on the actual end coordinate spheres, even when those coordinate spheres are not the surfaces $r = R$.
  We next check the full cut condition in the original graph metric. On the product $\[ R_(+) \, oo \) times bb(S)^2$ let
  $ alpha = R_(+)^2 d A_(sigma_2) . $
  It is closed and has comass $R_(+)^2 \/ r^2 lt.eq 1$ in the static and radial graph metrics, since their radial and angular blocks are orthogonal and the angular metric is $r^2 sigma_2$. For the cutoff graph, Equation (11.14) shows that its comass is at most $R_(+)^2 \/ \( \( 1 - eta \) r^2 \)$ in the changed region. Choose $L > R_(+) \/ sqrt(1 - eta)$. On the unchanged inner region the previous exact bound applies, so the comass is at most one everywhere on this graph too.
  If $Gamma = partial D$ is any full cut as in Definition 2, truncate $D$ by a large sphere outside $Gamma$. Stokes’ Theorem for this compact region, with all its inner boundary components and coincident obstacle portions counted, gives
  $ integral_Gamma alpha = integral_(r = R) alpha = 4 pi R_(+)^2 . $
  The comass bound yields $\| Gamma \|_(g_h) gt.eq 4 pi R_(+)^2 = \| S \|_(g_h)$. It covers disconnected cuts and cuts meeting the obstacle. Taking $D = Omega$ shows the infimum equals this value. No extension or filling behind the horizon has entered the calculation.
  The boundary expansion remains zero on the unchanged collar. Every coordinate sphere with $r > R_(+)$ has strictly positive $theta_(+)$ on these examples. On the static slice its value is $2 sqrt(f) \/ r$. For the compact radial change, the value varies continuously with the height in $C^2$ on its fixed compact support, so sufficiently small $epsilon$ preserves strict positivity; outside that support it has the static value. For the cutoff graph choose $L$ large enough that $2 sqrt(f) gt.eq 1$ for $r gt.eq L$. On any annulus with radii comparable to $R gt.eq L$, rescale spatial coordinates and time by $R$. The background metric and its derivatives are uniformly bounded and converge to the Minkowski ones as $R arrow.r oo$, and the rescaled height has $C^2$ norm at most $C \| v \|$, with a constant independent of $R$ and of whether the annulus meets the cutoff. The induced normal, mean curvature, and tangential $K$ trace depend smoothly on these derivatives as long as the graph stays uniformly spacelike. Consequently
  $ lr(|r theta_(+) \( r \) - 2 sqrt(f \( r \))|) lt.eq C' \| v \| #h(2em) \( r gt.eq L \) $
  pointwise on each sphere. Taking $C' \| v \| < 1 \/ 2$ proves the claim.
  To deduce the required outermostness, suppose a compact smooth enclosing surface entirely in the open graph had $theta_(+) lt.eq 0$. At a point of largest $r$ it is tangent to the coordinate sphere, with the same outward normal: the radially outward side is in the component containing infinity. The inner surface’s local graph lies on the inner side of the coordinate sphere. In coordinates on their common tangent plane, the second derivative test and the mean-curvature principal part $- Delta$ give $H_(upright("surface")) gt.eq H_(upright("sphere"))$ at contact. Their tangential $K$ traces are equal there because their tangent planes coincide. Hence its expansion is at least the strictly positive sphere expansion, a contradiction. The argument applies to a largest-radius point among all components, so it also excludes disconnected enclosing weakly outer-trapped surfaces.
  The radial example has nonzero original second fundamental form. At its critical radius the future normal is the static normal, and the graph Hessian formula gives
  $ K_(r r) \( r_0 \) = sqrt(f \( r_0 \)) thin h'' \( r_0 \) eq.not 0 . $
  Thus these examples are not time-symmetric.
  For completeness we calculate the ADM fluxes, including the momentum sign of the boosted examples, directly. The static metric in areal Cartesian coordinates is
  $ \( g_0 \)_(i j) = delta_(i j) + frac(2 M, r) frac(y_i y_j, r^2) + O_2 \( r^(- 2) \) . $
  Its energy flux is $M$ and its momentum flux is zero, as also follows from the calculation below at $v = 0$. The compact radial graph has exactly the same end data.
  Rotate the spatial axes for the cutoff graph so $v = beta e_3$, where $beta$ may have either sign. On its uncut tail set
  $ T = beta gamma x^3 \, #h(2em) y = \( x^1 \, x^2 \, gamma x^3 \) \, #h(2em) gamma = \( 1 - beta^2 \)^(- 1 \/ 2) \, #h(2em) d = gamma^2 - 1 . $
  The induced Minkowski metric in $x$ is Euclidean. Let $A_0 = "diag" \( 1 \, 1 \, gamma^2 \)$, $w = A_0 x$, and $r^2 = x dot.op A_0 x$. The leading induced metric is
  #[#set math.equation(numbering: n => "(11.16)")
   $ \( g_h \)_(i j) = delta_(i j) + H_(i j) + O_2 \( \| x \|^(- 2) \) \, #h(2em) H_(i j) = 2 M (frac(d thin delta_(i 3) delta_(j 3), r) + frac(w_i w_j, r^3)) . $ <ri:boost-metric>]
  Because $partial_i r = w_i \/ r$, differentiation gives
  $ partial_j H_(i j) - partial_i H_(j j) = frac(2 M, r^3) #scale(x: 120%, y: 120%)[\[] \( "tr" A_0 + d \) w_i - \( A_0 w \)_i - d delta_(i 3) w_3 #scale(x: 120%, y: 120%)[\]] = frac(4 M gamma^2 x_i, r^3) . $
  On $\| x \| = R$ put $mu = x^3 \/ R$ and $rho^2 = 1 + d mu^2$, so $r = R rho$. The $16 pi$ flux therefore is
  #[#set math.equation(numbering: n => "(11.17)")
   $ E = frac(M gamma^2, 2) integral_(- 1)^1 \( 1 + d mu^2 \)^(- 3 \/ 2) thin d mu = gamma M \, $ <ri:boost-energy>]
  where the primitive is $mu \/ sqrt(1 + d mu^2)$.
  To compute $K$ with its sign, the leading spacetime perturbation in $\( T \, y \)$ is $h_00 = 2 M \/ r$, $h_(0 a) = 0$, $h_(a b) = 2 M y_a y_b \/ r^3$. Its required connection coefficients are
  $ Gamma_(0 a)^0 = frac(M y_a, r^3) \, #h(2em) Gamma_00^a = frac(M y_a, r^3) \, #h(2em) Gamma_(b c)^a = M (frac(2 delta_(b c) y_a, r^3) - frac(3 y_a y_b y_c, r^5)) \, $
  up to $O_1 \( r^(- 3) \)$; the remaining mixed time coefficients at this order are zero. Put $F_0 = T - beta y^3$ and $sigma = sqrt(- upright(bold(G))^(- 1) \( d F_0 \, d F_0 \)) = gamma^(- 1) + O \( r^(- 1) \)$. The future normal is $n = - sigma^(- 1) nabla F_0$. For the constant tangent vectors $e_i$ to the plane this gives
  $ K_(i j) = - sigma^(- 1) "Hess" F_0 \( e_i \, e_j \) = gamma \( Gamma_(alpha lambda)^0 - beta Gamma_(alpha lambda)^3 \) e_i^alpha e_j^lambda + O_1 \( R^(- 3) \) . $
  Writing $z = x^3$, substitution yields
  #[#set math.equation(numbering: n => "(11.18)")
   $ K_(i j) = M beta gamma^2 [frac(x_i delta_(j 3) + x_j delta_(i 3) - 2 z delta_(i j) - d z delta_(i 3) delta_(j 3), r^3) + frac(3 z w_i w_j, r^5)] + O_1 \( R^(- 3) \) . $ <ri:boost-second-form>]
  The trace at this order is
  $ tau = M beta gamma^2 [- frac(\( 4 + d \) z, r^3) + frac(3 z \| w \|^2, r^5)] + O \( R^(- 3) \) . $
  Contracting with the Euclidean outward normal $x \/ R$ gives
  $ R^2 \( K_(3 j) - tau g_(3 j) \) x^j / R = M beta gamma^2 frac(1 + \( 3 + 4 d \) mu^2, \( 1 + d mu^2 \)^(5 \/ 2)) + O \( R^(- 1) \) . $
  Consequently the actual $8 pi$ momentum flux is
  #[#set math.equation(numbering: n => "(11.19)")
   $ P_3 = frac(M beta gamma^2, 4) integral_(- 1)^1 frac(1 + \( 3 + 4 d \) mu^2, \( 1 + d mu^2 \)^(5 \/ 2)) thin d mu = gamma M beta . $ <ri:boost-momentum>]
  Indeed an antiderivative is $mu \[ 1 + \( 1 + 2 d \) mu^2 \] \/ \( 1 + d mu^2 \)^(3 \/ 2)$, whose endpoint difference is $4 \/ gamma$. The two transverse momentum components vanish by reflection in the corresponding coordinate. Terms quadratic in asymptotic errors and the charge-squared terms have integrated error $O \( R^(- 1) \)$ and do not alter either flux. Rotating back gives $P = gamma M v$. Thus the actual invariant mass is $sqrt(E^2 - \| P \|^2) = M$, and the momentum is nonzero when $v eq.not 0$.
  Equations (11.16) and (11.18) also verify $g_h - delta = O_2 \( R^(- 1) \)$ and $K = O_1 \( R^(- 2) \)$ in the actual Euclidean end chart. Pulling back the smooth Maxwell forms and contracting with the uniformly timelike graph normal gives both fields $O_1 \( R^(- 2) \)$. Their stress, and hence $mu$ and $\| J \|$, are $O \( R^(- 4) \)$ and integrable. The compact core causes no integrability issue. Together with Equation (11.15), the cut calibration, and the expansion barrier, these checks establish every initial-data and connected rigidity-subclass hypothesis for all three families. The converse just proved supplies equality. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
