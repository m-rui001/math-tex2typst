#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Constructible-tame-Hecke-eigensheaves-in-positive-characteristic-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A Hecke eigensheaf realizes a local system on a curve through the geometry of modifications of bundles. For a punctured curve, the local monodromy of the parameter must also be reflected in the level structure at the puncture. We study Borel level and tame regular-unipotent monodromy. The required automorphic object is a locally constructible perverse sheaf, and its eigenisomorphisms must hold over the entire space of Hecke legs, including their collision diagonals.

=== 1.1 The setting and the main theorem <the-setting-and-the-main-theorem>

Let $k = overline(bb(F))_q$ have characteristic $p$, and let $E = overline(bb(Q))_ell$, where $ell eq.not p$. Let $X_0 \/ bb(F)_q$ be a smooth projective geometrically connected curve of genus $g gt.eq 2$, with a rational point $x_0$. Write $X = X_0 times_(bb(F)_q) k$, $x = \( x_0 \)_k$, and $U = X \\ { x }$. Let $G_0 \/ bb(F)_q$ be split, simple, and simply connected of positive rank, and fix a Borel subgroup $B_0 subset G_0$. Put $G = \( G_0 \)_k$, $B = \( B_0 \)_k$, and $frak(g) = "Lie" \( G \)$. The dual group $hat(G) \/ E$ is adjoint.

We make the following assumptions on the characteristic. In the statements below, $M$ ranges over Levi subgroups of $G$, $frak(m) = "Lie" \( M \)$, $T_M subset M$ is a maximal torus, and $W_M = N_M \( T_M \) \/ T_M$.

+ There is a nondegenerate $G$-invariant symmetric form $kappa$ on $frak(g)$, and its restriction to the Lie-algebra center $frak(z) \( frak(m) \)$ is nondegenerate for every $M$.
+ Restriction induces an isomorphism
  $ k \[ frak(m) \]^M arrow.r^tilde.op k \[ "Lie" \( T_M \) \]^(W_M) #h(2em) upright("for every ") M . $
+ The scheme-theoretic centralizer in $G$ of every semisimple element of $frak(g)$ is a Levi subgroup.
+ For every field extension $k' \/ k$, each nilpotent element of $frak(g) ⊗_k k'$ belongs to $"Lie" \( R_u \( P \) \)$ for some parabolic subgroup $P subset G_(k')$ defined over $k'$.

Here semisimple means geometrically conjugate into a toral Lie algebra, and nilpotent means that the geometric adjoint-orbit closure contains zero. We impose no additional condition that $p$ be prime to the order of a Weyl group.

A parameter $sigma$ is a continuous homomorphism

#[#set math.equation(numbering: n => "(1.1)")
 $ rho : pi_1^(upright(acute(e) t)) \( U \, macron(u) \) arrow.r hat(G) \( L \) \, $ <eq:parameter>]

up to $hat(G) \( E \)$-conjugacy, where $L \/ bb(Q)_ell$ is finite inside $E$. We require its image to be Zariski dense. It defines a tensor local system $V mapsto V_sigma$ for $V in "Rep"_E \( hat(G) \)$. We further require that $rho$ kill wild inertia at $x$ and that its tame inertia action factor through $bb(Z)_ell \( 1 \)$. After choosing a compatible system of $ell$-power roots of unity, let $t_ell : I_x arrow.r bb(Z)_ell$ be the resulting quotient map. The regular-unipotent condition is

#[#set math.equation(numbering: n => "(1.2)")
 $ rho \( gamma \) = exp #scale(x: 120%, y: 120%)[\(] t_ell \( gamma \) N #scale(x: 120%, y: 120%)[\)] \, #h(2em) gamma in I_x \, #h(2em) dim Z_(hat(G)) \( N \) = "rk" \( hat(G) \) \, $ <eq:regular-monodromy>]

for a nilpotent $N in "Lie" \( hat(G) \) \( L \)$ after a finite extension of $L$ and a conjugation. The exponential is the finite nilpotent exponential. Changing the chosen generator rescales $N$ by a unit, so the condition does not add a generator or a logarithm to the automorphic data. No Frobenius descent is assumed for $sigma$.

Let

$ cal(A) = "Bun"_(G \, B \, x) \( X \) $

be the stack of $G$-bundles $P$ on $X$ with a $B$-reduction $beta$ at $x$. A geometric $E$-adic sheaf $M$ on $cal(A)$ is #emph[locally constructible perverse] if, for every smooth map $f : S arrow.r cal(A)$ from a smooth finite-type $k$-scheme of constant relative dimension $d$, the complex $f^(*) M \[ d \]$ is bounded constructible and perverse. This condition is local on the bundle stack; it requires no bound on the Harder–Narasimhan strata supporting $M$.

Using $kappa$, a cotangent vector to $cal(A)$ is represented by

$ \( P \, beta \, phi.alt \) \, #h(2em) phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X \, "ad" \( P \) ⊗ omega_X \( x \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) "Res"_x \( phi.alt \) in "Lie" \( R_u \( B_beta \) \) . $

The #emph[parabolic global nilpotent cone] $Lambda_(upright("par"))$ consists of these triples for which $phi.alt$ is generically nilpotent. The singular-support condition below is interpreted by pulling this cone back to the cotangent bundle of each smooth scheme chart.

For a finite set $I$ and $V_i in "Rep"_E \( hat(G) \)$, let $sans(H)_(I \, \( V_i \))$ denote the Hecke functor away from $x$, with target sheaves on $cal(A) times U^I$. We use the relative Satake normalization: on the open Schubert cell of dimension $d_lambda$ the simple kernel is $E \[ d_lambda \] \( d_lambda \/ 2 \)$, with no additional moving-leg shift. These dimensions are even because $G$ is simply connected. In particular, the tensor-unit functor sends $M$ to $M times.square E_(U^I)$. Section 2 fixes the corresponding tensor and fusion conventions.

#thm([Theorem 1.1.])[
  #emph[Assume Section 1.1–Section 1.1. For every Zariski-dense parameter (1.1) satisfying (1.2), there is a nonzero locally constructible perverse geometric $E$-adic sheaf $M$ on $cal(A)$ such that 
$ "SS" \( M \) subset Lambda_(upright("par")) . $

 For every finite set $I$ and every family $\( V_i \)_(i in I)$, it carries isomorphisms 
#[#set math.equation(numbering: n => "(1.3)")
 $ sans(H)_(I \, \( V_i \)) \( M \) tilde.eq M times.square #scale(x: 180%, y: 180%)[\(] times.square_(i in I) \( V_i \)_sigma #scale(x: 180%, y: 180%)[\)] quad upright("on ") cal(A) times U^I \, $ <eq:main-eigen>]

 natural in the representations and coherently compatible with the tensor unit, convolution, permutations of legs, and fusion along every collision diagonal.]
] <thm:main>

=== 1.2 Historical context <historical-context>

The eigensheaf formulation of geometric Langlands grew from Drinfeld’s rank-two construction and Laumon’s geometric formulation and proposed construction for general linear groups #cite(label("Drinfeld")) #cite(label("Laumon")). Frenkel, Gaitsgory, and Vilonen reduced the unramified $upright("GL")_n$ existence problem to a vanishing theorem #cite(label("FGV")); Gaitsgory proved that theorem #cite(label("GaitsgoryVanishing")). For general reductive groups in characteristic zero, Beilinson and Drinfeld constructed eigensheaves from opers by quantizing the Hitchin system #cite(label("BD")) §0.2. The tensor structure and fusion of geometric Hecke operators are furnished by geometric Satake #cite(label("MV")) §§4–5,14.

Ramified eigensheaves have also been studied through automorphic data with prescribed level and character. Yun’s rigidity framework constructs eigenvalues from suitable rigid automorphic data #cite(label("YunRigidity")) §4; the present problem starts instead with a prescribed Zariski-dense local system. In the characteristic-zero de Rham setting, Færgeman constructs coherent eigensheaves for irreducible regular-singular parameters using the factorizable spectral input specified in his paper #cite(label("Faergeman")) Theorem 1.4.1.1,§1.3.7. In the version cited here, regular holonomicity and generic perversity in the ramified setting are left as expectations #cite(label("Faergeman")) Remark 1.4.1.2. Our theorem concerns geometric adic coefficients in positive characteristic, Borel level, and local constructibility together with perversity.

The geometry of the global nilpotent cone was developed by Laumon, Faltings, and Ginzburg #cite(label("LaumonNilpotent")) #cite(label("Faltings")) #cite(label("GinzburgNilpotent")). Beilinson established the singular-support theory for constructible etale sheaves, and Barrett extended it to the adic coefficient categories used here #cite(label("Beilinson")) #cite(label("Barrett")). Arinkin, Gaitsgory, Kazhdan, Raskin, Rozenblyum, and Varshavsky developed the restricted spectral stack and its action on sheaves with nilpotent singular support #cite(label("AGKRRV")). Their Hecke detection argument uses a central cocharacter of the Levi centralizing a semisimple Higgs value and an isolated cotangent intersection #cite(label("AGKRRV")) §§20.5,20.7–20.8, Appendix H. The cotangent calculations below adapt these ideas to the level structures and the characteristic hypotheses of Theorem 1.

Gaitsgory and Raskin establish the unramified restricted equivalence in characteristic zero and develop geometric specialization and its compatibility with the Hecke action #cite(label("GR")) Main Theorem 1.3.9,§4. We use their characteristic-zero equivalence to produce a compact eigencomplex, and prove the required level-dependent specialization and nonvanishing assertions here. The twisted nodal geometry belongs to the automorphic gluing framework of Nadler and Yun #cite(label("NYAutomorphicGluing")) §§2–3. Their gluing theorem is a categorical construction; the nonvanishing of the particular specialized eigencomplex used below is a separate argument.

In Betti sheaf theory, Nadler and Yun construct a spectral action with level structure and prove local constancy of the moving Hecke operators on the nilpotent category #cite(label("NY")) Theorems 6.2.2,6.3.7. At the marked point we use Gaitsgory’s nearby-cycle construction of central sheaves #cite(label("GaitsgoryCentral")), the local spectral geometry of Arkhipov and Bezrukavnikov #cite(label("AB")), and its universal monodromic form due to Dhillon and Taylor #cite(label("DT")). The latter allows arbitrary enhancement monodromy before the central trace calculation forces it to be unipotent.

=== 1.3 The two specializations and the proof strategy <the-two-specializations-and-the-proof-strategy>

The proof first constructs an eigensheaf with Borel level in characteristic zero, and then specializes it to the curve of Theorem 1. The characteristic-zero construction itself uses a different specialization: a degeneration to a separating node creates the level structure.

Start with a pointed complex curve and a dense parameter with unipotent boundary monodromy on its punctured complement. Join two copies of the curve at their marked points and smooth the resulting node. On the second punctured component, choose a parameter with inverse boundary monodromy. The compatible finite quotients of the two parameters glue on twisted nodal models and lift to the smooth generic curve. Their inverse limit is an unramified dense parameter there, to which we apply the characteristic-zero unramified correspondence. Taking the compact spectral skyscraper at this parameter gives a nonzero eigencomplex that is locally constructible.

The special fiber introduces enhanced flags. Put $T = B \/ R_u \( B \)$ and let $cal(A)^(+)$ be the stack of bundles with an $R_u \( B \)$-reduction at the marked point. The map $q : cal(A)^(+) arrow.r cal(A)$ is a $T$-torsor. For a suitable prescribed stabilizer type at the twisted node, the bundle stack is

$ \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T . $

Nearby cycles, pullback to the product, and restriction to one enhanced factor give a nonzero eigencomplex on $cal(A)_1^(+)$. Taking a nonzero perverse cohomology, applying $q_(!)$, and taking perverse cohomology once more produce the ordinary-flag perverse eigensheaf. The arguments below establish nonvanishing and preserve the eigenstructure at each of these steps.

To return to positive characteristic, lift the original pointed curve and the compatible finite quotients of its parameter to mixed characteristic. Apply the preceding construction on the geometric generic fiber. Its geometric nearby cycles give the sheaf on $cal(A)$ in Theorem 1. The two specializations are shown in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Unramified eigencomplex#linebreak()on a smooth curve]]])])
  content((4.953, 0), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Eigencomplex#linebreak()on $cal(A)_1^+$]]])])
  content((9.906, 0), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Perverse eigensheaf#linebreak()on $cal(A)_1$]]])])
  line((1.926, 0), (3.026, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((2.476, 0.8), [#text(size: 8pt)[nodal nearby cycles#linebreak()and restriction]], anchor: "south", padding: 0.1176cm)
  line((6.879, 0), (7.979, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((7.429, 0.8), [#text(size: 8pt)[perverse cohomology#linebreak()and $q_!$]], anchor: "south", padding: 0.1176cm)
  content((4.953, 2.623), [#text(size: 8pt)[Construction in characteristic zero]])
  content((9.906, -2.4), [#box(width: 3.853cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Perverse eigensheaf#linebreak()on $"Bun"_(G,B,x)(X)$]]])])
  line((9.906, -0.6), (9.906, -1.8), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((9.906, -1.2), [#text(size: 8pt)[mixed-characteristic#linebreak()nearby cycles]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The first specialization creates the level structure; the second changes the characteristic. The arrow from enhanced to ordinary flags takes perverse cohomology both before and after $q_(!)$. Each specialization also requires a separate nonvanishing argument. The arrows record operations on sheaves, not morphisms between the displayed moduli stacks. ],
) <fig:construction>

The first difficulty is nonvanishing. Nearby cycles on a nonproper bundle stack can annihilate a nonzero object; at the node they must also be nonzero on the prescribed stabilizer type. Uniformization places a nonzero generic stalk in a bounded Hecke space proper over a reference bundle of that type. Its extension shows that the support approaches the required special fiber. Theorem 7 then proves that nearby cycles cannot vanish.

The detection arguments have a common local calculation but different conclusions. Over a field, a nonnilpotent covector admits a transverse Hecke modification with a nonzero moving-leg component. The two-Hecke calculation and projective recovery use the lisse eigenrelation to show that a function with that differential has zero vanishing cycles, excluding the covector from singular support. Over a trait, assume that nearby cycles vanish. The same local calculation forces nearby cycles to vanish on hypersurface cuts whose differentials avoid the nilpotent cone. The cone dimension bound allows enough simultaneous cuts to retain a nonzero generic stalk while making the support finite over the trait. Its nearby cycles are a nonzero sum of stalks, giving the contradiction. The two-Hecke and projective slicing methods follow #cite(label("OpenAIFullSupport2026")) Sections 3–7; we prove their versions for ordinary and enhanced Borel level and the simultaneous torus quotient, under Section 1.1–Section 1.1.

Preserving the Hecke system requires more than commuting nearby cycles with a fixed-point operator. The comparison must retain all moving legs, including collisions, and the maps expressing convolution and fusion. In input frames, each successive Hecke correspondence is a product with a fixed Grassmannian Schubert model. The nearby-cycle exterior-product comparison applies even when earlier modifications have made the input singular. Iterating it and using proper convolution gives the entire coherent system in Section 5.

Perverse cohomology presents a different issue: general Hecke functors are not assumed to be perverse exact. Choose generators of the punctured surface group. A framing of the parameter gives a monodromy tuple $y in Y = hat(G)^(2 g)$, whose simultaneous-conjugation orbit is closed and free because the parameter is dense and $hat(G)$ is adjoint. For each representation $V$, the equivariant bundle $Y times V$ admits an equivariant frame after inverting an invariant function $f_V$ nonzero at $y$. Under the Betti spectral action, this frame identifies the fixed-point Hecke functor with $dim V$ copies of the identity wherever $f_V$ acts invertibly. The eigencomplex belongs to this subcategory because $f_V$ acts on it by the scalar $f_V \( y \)$. Inverting these functions gives a category stable under perverse truncation, on which all fixed-point Hecke functors are exact. Nadler–Yun’s local constancy theorem extends this exactness to moving legs and their collisions. Functorial truncation then preserves the original eigenmaps and all their compatibilities (Section 6).

Finally, $q_(!)$ can vanish on an enhanced-flag object with arbitrary torus monodromy. A central-sheaf trace identity relates that monodromy to the boundary monodromy of the parameter. Unipotence of the latter forces unipotence along the enhancement fibers and hence nonvanishing of $q_(!)$. To globalize the trace identity, we retain independent input and output enhancements during collision at the marked point. After removing the contractible real radial directions of the enhancement torus, the bounded pushforward is proper. This comparison preserves the monodromy on each central factor, as the trace requires (Section 7).

The geometric nearby-cycle foundations are those of Hansen–Scholze #cite(label("HansenScholze")) and Gaitsgory–Raskin #cite(label("GR")). Throughout, finite reductions may require different finite trait extensions; we do not replace them by one extension supporting the entire adic system. All sheaves and parameters are geometric, and no Frobenius structure is required.

Section 2 fixes the sheaf and Hecke conventions. Sections 3 and 4 establish the cotangent geometry and detection arguments. After the Hecke comparison, perverse cohomology, and torus descent of Sections 5–7, Section 8 constructs the two families and assembles the proof of Theorem 1.

== 2 Sheaf conventions and the relative Hecke system <sec:foundations>

The argument will specialize sheaves twice and will use Betti sheaves in the intermediate characteristic-zero fiber. We first specify the sheaf categories and the normalization in which these operations will be compared. In particular, the moving points of a Hecke correspondence contribute no shift to the eigenvalue identity.

=== 2.1 Local constructibility and flag levels <local-constructibility-and-flag-levels>

Write $E = overline(bb(Q))_ell$. For a smooth algebraic stack $cal(B)$ locally of finite type over an algebraically closed field of characteristic different from $ell$, let $D_(upright("lcc")) \( cal(B) \, E \)$ denote the category of geometric adic complexes whose pullback to every smooth finite-type scheme chart is bounded and constructible. The abbreviation “lcc” will always mean #emph[locally bounded constructible], not locally constant. Bounds may depend on the chart. An object $F$ is perverse if

$ f^(*) F \[ d \] in "Perv" \( D \, E \) $

for every smooth chart $f : D arrow.r cal(B)$ of constant relative dimension $d$. Charts of nonconstant relative dimension are treated componentwise. This defines the usual perverse $t$-structure locally and hence its truncations and perverse cohomology on $D_(upright("lcc"))$. Neither this definition nor the word “perverse” imposes a support condition on the set of Harder–Narasimhan strata.

We use ordinary pullbacks and ordinary geometric stalks. For a closed conic subset $C subset T^(*) cal(B)$, its pullback to a smooth chart is

$ f^compose C = "image" #scale(x: 120%, y: 120%)[\(] D times_(cal(B)) C arrow.r T^(*) D #scale(x: 120%, y: 120%)[\)] . $

Thus $"SS" \( F \) subset C$ means $"SS" \( f^(*) F \) subset f^compose C$ on every such chart. Shifting a complex does not change this condition. The singular support used here is the geometric adic singular support; existence and the function-test characterization for bounded constructible $E$-complexes are as in #cite(label("Barrett")) §1.5, Theorem (vii).

Fix a maximal torus in $B$ and identify it with $T = B \/ N_B$, where $N_B = R_u \( B \)$. For a smooth pointed projective curve $\( X \, x \)$ put

$ cal(A) = "Bun"_(G \, B \, x) \( X \) \, #h(2em) cal(A)^(+) = "Bun"_(G \, N_B \, x) \( X \) . $

An enhanced flag is an $N_B$-reduction of the fiber at $x$; forgetting the enhancement gives a representable $T$-torsor

#[#set math.equation(numbering: n => "(2.1)")
 $ pi : cal(A)^(+) arrow.r cal(A) . $ <eq:found-level-torsor>]

We also allow unlevelled bundles. For two pointed curves with identified flag tori, and a fixed choice of identification $tau : T_1 tilde.eq T_2$, write

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(B)_12 = #scale(x: 120%, y: 120%)[\[] \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T_Delta #scale(x: 120%, y: 120%)[\]] \, #h(2em) T_Delta = { \( t \, tau \( t \) \) : t in T_1 } . $ <eq:found-node-quotient>]

The Borels on the two curves may be opposite. The branch convention fixes $tau$ once and for all. The map from $cal(B)_12$ to $cal(A)_1 times cal(A)_2$ is a torsor under $\( T_1 times T_2 \) \/ T_Delta$. An unramified Hecke modification on either punctured component transports the level data and acts on the corresponding factor of this presentation. Section 3 describes the cotangent spaces and the generic-nilpotence cone for all these stacks.

=== 2.2 Geometric specialization <geometric-specialization>

Let $S = "Spec" R$ be an excellent complete strictly henselian discrete valuation trait, with algebraically closed residue field $k$, and with $ell$ invertible in $R$. Fix an algebraic closure $overline(K)$ of its fraction field. Write $macron(eta) = "Spec" overline(K)$ and $s = "Spec" k$. For a finite-type $S$-scheme $Y$ we use geometric nearby cycles

$ Psi_Y : D_c^b \( Y_(macron(eta)) \, E \) arrow.r D_c^b \( Y_s \, E \) . $

The geometric generic fiber is part of this notation. In particular, $Psi_Y$ takes no inertia invariants. When an object has descent data, nearby cycles may retain the resulting inertia action, but the underlying complex is the one used here.

It is useful to name the natural exchange maps. For a morphism $f : Y arrow.r Z$ of models, and complexes $A \, B$ on geometric generic fibers, they are

#[#set math.equation(numbering: n => "(2.3)")
 $ "Ex"_f^(*) & : f_s^(*) Psi_Z A arrow.r Psi_Y \( f_(macron(eta))^(*) A \) \,\
"Ex"_(f \, *) & : Psi_Z \( f_(macron(eta) \, *) B \) arrow.r f_(s \, *) Psi_Y B \,\
mu_(A \, B) & : Psi_Y A ⊗ Psi_Y B arrow.r Psi_Y \( A ⊗ B \) . $ <eq:found-pull-exchange>]

We use the push exchange only where it is defined by the proper nearby-cycle comparison, and therefore an isomorphism. Pull exchange and tensor exchange are not asserted to be isomorphisms in general. For two models $Y \, Z$, their composite gives the exterior-product map

#[#set math.equation(numbering: n => "(2.4)")
 $ "Ex"_(Y \, Z)^times.square : Psi_Y A times.square Psi_Z B arrow.r Psi_(Y times_S Z) \( A times.square B \) . $ <eq:found-exterior-exchange>]

The products in this formula are on the appropriate fibers of the product over $S$.

#thm([Proposition 2.1.])[
  (Geometric nearby-cycle formalism).  #emph[For the traits just specified, geometric nearby cycles preserve bounded constructibility and are exact for the perverse $t$-structures on the geometric fibers. They are unchanged by finite extension of the trait inside $overline(K)$. The maps (2.3), (2.3), and (2.4) are isomorphisms, respectively, for smooth $f$, for proper $f$, and for exterior products of bounded constructible complexes. These assertions extend to locally constructible complexes on the smooth stacks used here by smooth descent; proper morphisms in this extension are representable.]
  #emph[Let $L_(macron(eta))$ be a lisse finite-rank $E$-sheaf on a model’s geometric generic fiber. Suppose it has, after a finite extension of the coefficient field, a lisse lattice whose finite reductions extend to lisse sheaves after finite extensions of $S$. Suppose these extensions are compatible on further common extensions and have reductions of a lisse special-fiber sheaf $L_s$. The finite extension of $S$ may depend on the reduction. Then, for any map $g : Y arrow.r Z$ to that model and any $F in D_c^b \( Y_(macron(eta)) \, E \)$, the natural map is an isomorphism 
#[#set math.equation(numbering: n => "(2.5)")
 $ Psi_Y F ⊗ g_s^(*) L_s arrow.r^(med tilde.op med) Psi_Y \( F ⊗ g_(macron(eta))^(*) L_(macron(eta)) \) . $ <eq:found-lisse-tensor>]

 The statement also holds locally on the stacks in question, and is compatible with tensor products and morphisms of the lisse systems.]
] <prop:nearby-foundations>

#proof[
  We recall the coefficient issue because it prevents an unwarranted descent hypothesis in the applications. At torsion coefficient level, a constructible object on $Y_(macron(eta))$ descends to a finite extension of $K$; the same holds for any specified finite diagram of objects and maps. Geometric nearby cycles of those descents agree after further finite extensions. Hence the torsion functor is defined on the filtered union of these categories, independently of all such choices. Applying the adic formalism and extension of coefficients gives the geometric functor above. This construction is the specialization functor of #cite(label("GR")) §§4.1.1–4.1.5. Different reductions of an adic object can require different extensions of $K$; the construction does not replace this tower by a single finite extension.
  The constructibility and exchange assertions are recorded in #cite(label("GR")) §4.1.6. For the general traits used here, they follow from #cite(label("HansenScholze")) Theorem 4.1 and Corollary 4.2, in the rational-adic coefficient setting (C) of that paper. Indeed, the integral closure $V$ of $R$ in $overline(K)$ is a rank-one absolutely integrally closed valuation ring. On a separated finitely presented $V$-scheme, restriction to the generic fiber identifies universally locally acyclic complexes with arbitrary constructible generic-fiber complexes; its inverse is $R j_(*)$. Nearby cycles are $i^(*) R j_(*)$. This applies to $E$ itself, and thus directly to objects without common finite descent. Perverse exactness follows from this equivalence and the relative perverse $t$-structure of #cite(label("HansenScholze")) Theorem 6.7: generic restriction and special restriction are exact for their fiberwise perverse structures. Finite extensions of the original trait give the same $V$. On a smooth stack, smooth pullback of relative dimension $d$ commutes with $Psi$ and with $\[ d \]$. The scheme assertions therefore descend, and give both local constructibility and perverse exactness on the stack. The proper assertion is checked after smooth base change to schemes, or algebraic spaces, for a representable proper map.
  For the last assertion choose the lattice and reduce modulo a power of its uniformizer. After the permitted trait extension its extension is lisse on $Z$. The lisse tensor formula for nearby cycles, after pullback to $Y$, gives (2.5) at this finite coefficient level. Its construction is natural in reductions, maps, and further trait extensions. Passing to the adic system and then inverting the coefficient uniformizer proves the assertion. This proof permits arbitrary $g$: it uses lisseness of the extended factor, not a base-change theorem for $Psi$ along $g$. ◻
]

All exchange maps above obey the following compatibilities. Pull and proper-push exchange compose for composite morphisms; tensor exchange is associative and unital; and these maps commute with proper base change and the projection formula. They are the natural transformations obtained from restriction and pushforward in the definition of nearby cycles, so these identities hold before choosing any isomorphisms. This observation will identify the maps obtained by different orders of Hecke convolution.

=== 2.3 Relative Satake normalization <relative-satake-normalization>

For a dominant coweight $lambda$, put $d_lambda = chevron.l 2 rho \, lambda chevron.r$. The spherical Satake complex $"IC"_lambda$ is normalized on the open Schubert orbit by

#[#set math.equation(numbering: n => "(2.6)")
 $ "IC"_lambda \|_("Gr"^lambda) = E \[ d_lambda \] \( d_lambda \/ 2 \) . $ <eq:found-satake-normalization>]

Since $G$ is simply connected, its coweight lattice is the coroot lattice; $chevron.l 2 rho \, alpha^or chevron.r = 2$ for every simple coroot. Thus every $d_lambda$ is even. We choose the usual Satake equivalence with $"Rep" \( hat(G) \)$, including its cohomological fiber functor and fusion commutativity constraint; see #cite(label("MV")) §§4–6 and Theorem 14.1. Tate twists are geometric coefficient lines. They require no Weil structure, and compatible trivializations may be fixed in comparisons with Betti coefficients.

Let $U$ be the smooth scheme locus of the curve on which modifications are allowed, disjoint from all marked or stacky points. For a finite set $I$, let $cal(H)_I$ be the Beilinson–Drinfeld Hecke stack with input bundle map $p_I$ and output-and-leg map

$ o_I : cal(H)_I arrow.r cal(B) times U^I . $

For representations $bold(V) = \( V_i \)_(i in I)$, let $"Sat"_I \( bold(V) \)$ denote its relative spherical kernel. In input frames at pairwise distinct legs it is the exterior product of the fixed-point Satake complexes, with normalization (2.6). At collisions it is obtained by the proper convolution map from successive modifications. Define

#[#set math.equation(numbering: n => "(2.7)")
 $ sans(H)_(I \, bold(V)) \( F \) = o_(I \, *) #scale(x: 120%, y: 120%)[\(] F thin tilde(times.square) thin "Sat"_I \( bold(V) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:found-hecke-definition>]

The twisted product is characterized in input frames by the ordinary exterior product with $F$. The equivariance of the Satake factor provides its descent. These formulas are computed on finite-dimensional bounds containing the support of the kernel; the output map on each such bound is representable and proper. No shift $\[ \| I \| \]$ occurs in (2.7). In particular

#[#set math.equation(numbering: n => "(2.8)")
 $ sans(H)_(I \, \( upright(bold(1)) \)) \( F \) = F times.square E_(U^I) \, #h(2em) sans(H)_diameter \( F \) = F . $ <eq:found-hecke-unit>]

When discussing perversity over a smooth leg space, we will explicitly insert $\[ \| I \| \]$ and subsequently remove it.

For a surjection of finite sets $a : I arrow.r.twohead J$, write $delta_a : U^J arrow.r U^I$ for its collision diagonal, and put $W_j = ⨂_(i in a^(- 1) \( j \)) V_i$. The relative fusion convention is

#[#set math.equation(numbering: n => "(2.9)")
 $ \( 1 times delta_a \)^(*) sans(H)_(I \, bold(V)) \( F \) tilde.eq sans(H)_(J \, bold(W)) \( F \) . $ <eq:found-fusion>]

There is no codimension shift in this ordinary-pullback formula. The usual shifts appear only if both sides have first been made perverse over their respective leg spaces. An eigenstructure throughout this paper means natural isomorphisms for all $I$ and all representations, compatible with these fusion maps, the unit, successive modifications, and permutations. A system of separate fixed-point eigenisomorphisms is not sufficient.

=== 2.4 The use of Betti realization <the-use-of-betti-realization>

For a finite-type complex scheme, geometric adic constructible complexes admit the usual realization as algebraically constructible complexes of ordinary $E$-vector spaces on the analytic space. It is obtained from finite coefficient comparison and passage to adic coefficients; on a lisse sheaf it restricts its continuous monodromy representation to topological loops. On bounded constructible objects the realization is conservative, preserves the perverse $t$-structure, and commutes with the pullbacks, tensor products, and finite-type pushforwards used below. The local finite-triangulation form of comparison ensures that these operations commute with passage from a lattice to $E$-coefficients. The characteristic-zero comparison convention is also used in #cite(label("GR")) §2.2.1.

For algebraically constructible complexes this comparison identifies algebraic singular support with the corresponding complex conic singular support in the analytic cotangent bundle. One can check the assertion using the vanishing-cycle characterization: comparison identifies the tests by algebraic functions, and such tests generate singular support. We apply these statements on finite-type smooth charts and their correspondence diagrams, and descend them to the stacks above. In particular Betti realization may verify that an already defined adic truncation comparison is an isomorphism. It does not create an adic object from an arbitrary Betti object. The infinite-rank universal monodromic kernels appearing later are used only on the Betti side; all objects subsequently specialized are geometric adic lcc complexes.

== 3 Nilpotent cotangent cones and transverse modifications <sec:geometry>

The detection arguments require two geometric facts. The nilpotent cone must have at most half the dimension of the cotangent bundle on a smooth chart, and a covector outside that cone must admit a Hecke modification with a nonzero component in the direction of the moving point. We prove both facts, including the nondegeneracy of the modification that will be needed for the slicing argument.

Throughout this section the ground field is algebraically closed. It is either of characteristic zero or is $k = overline(bb(F))_q$, with the four characteristic hypotheses of Theorem 1. In characteristic zero we choose an invariant form $kappa$ with the same nondegeneracy properties. The stack $cal(B)$ will be an unlevelled bundle stack, a bundle stack with ordinary or enhanced Borel level at one point, or, in characteristic zero, the simultaneous torus quotient $\[ \( cal(A)_1^(+) times cal(A)_2^(+) \) \/ T \]$ described in Section 2. An actual Hecke modification is always made on one curve, away from its marked point.

=== 3.1 Cotangent vectors and the dimension bound <cotangent-vectors-and-the-dimension-bound>

Let $cal(P)$ be a $G$-bundle, with reduction to a subgroup $H$ at $x$, where $H = B$ or $R_u \( B \)$, and put $frak(h) = "Lie" \( H \)$. The vector bundle governing its deformations is the elementary modification

$ cal(E)_H = ker #scale(x: 120%, y: 120%)[\(] "ad" \( cal(P) \) arrow.r "ad" \( cal(P) \)_x \/ frak(h) #scale(x: 120%, y: 120%)[\)] . $

Its first cohomology is the space of infinitesimal deformations and its zeroth cohomology is the infinitesimal automorphism space. Serre duality therefore identifies a degree-zero cotangent vector with a section

#[#set math.equation(numbering: n => "(3.1)")
 $ phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X \, "ad" \( cal(P) \) ⊗ omega_X \( x \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) "Res"_x phi.alt in frak(h)^perp . $ <eq:geometry-cotangent>]

Here and below a cotangent vector on a smooth stack means an element of $H^0$ of the fiber of its cotangent complex. Thus these descriptions retain the infinitesimal automorphisms of the bundle stack; they do not replace the stack by a coarse moduli space.

The $T$-weight decomposition and invariance of $kappa$ show that opposite root spaces pair perfectly and that $kappa$ is nondegenerate on $frak(t)$. Consequently

$ frak(b)^perp = "Lie" R_u \( B \) \, #h(2em) \( "Lie" R_u \( B \) \)^perp = frak(b) . $

Formula (3.1) is thus the strongly parabolic residue condition at ordinary level and the Borel residue condition at enhanced level. For the simultaneous torus quotient, its cotangent vectors are pairs of enhanced-level Higgs fields annihilating the infinitesimal diagonal torus action. Under Serre duality the functional on a change of enhancement is pairing with the toral component of the residue, with the sign fixed by the action convention on that branch.

Write $Lambda subset T^(*) cal(B)$ for the cone of such fields that are nilpotent over the function field of each curve. It is closed: after choosing homogeneous generators of the invariant polynomials, the condition is the vanishing of their associated global sections. The identification of this zero fiber with generic nilpotence is valid under Hypothesis Section 1.1. Indeed an element can be conjugated into a Borel Lie algebra, as also verified in the proof of Lemma 4 below; contraction of its nilradical part leaves its toral part. Restriction of invariants to the torus and the finite Weyl group quotient then show that all positive-degree invariants vanish exactly when that toral part is zero. A finite-group quotient separates its geometric orbits in every characteristic; no averaging over the Weyl group is involved.

The residue of a generically nilpotent field is nilpotent. For example, in a parameter $t$ at $x$, write $phi.alt = b \( t \) thin d t \/ t$. Every invariant polynomial vanishes on $b \( t \)$ and hence on $b \( 0 \)$. At enhanced level $b \( 0 \) in frak(b)$, so its toral projection vanishes. It follows that the enhanced-level cone is the smooth pullback of the ordinary-level cone. The same is true for the simultaneous torus quotient over $cal(A)_1 times cal(A)_2$: both toral residues are already zero on its nilpotent cone. These assertions also describe the cones after pullback to scheme charts.

#thm([Proposition 3.1.])[
  #emph[Let $cal(B)$ be one of the bundle stacks just specified, and let $f : D arrow.r cal(B)$ be a smooth chart with $D$ a smooth finite-type scheme of pure dimension $d$. For the smooth cotangent pullback $Lambda_D = f^compose Lambda subset T^(*) D$, one has 
#[#set math.equation(numbering: n => "(3.2)")
 $ dim Lambda_D lt.eq d . $ <eq:geometry-cone-dimension>]

 In characteristic zero this cone is isotropic, in the sense that the symplectic form restricts to zero on the smooth locus of every reduced subvariety of $Lambda_D$.]
] <prop:cone-dimension>

#proof[
  We give the ordinary-level argument; the unlevelled version omits the condition at $x$. This is the parabolic form of the isotropy argument for the global nilpotent cone #cite(label("GinzburgNilpotent")) Lemma 7; compare the separable-lifting criterion and its bundle-stack application in #cite(label("AGKRRV")) Appendix D.1.5 and D.1.8.
  Let $Z$ be an irreducible component of $Lambda_D$ with its reduced structure, and put $F = k \( Z \)$. Its generic point specifies a family $\( cal(P) \, beta \, phi.alt \)$ on $X_F$. By #cite(label("DrinfeldSimpson")) Theorem 2, after a finite separable extension $F' \/ F$ the bundle is trivial over the generic point of $X_(F')$. Hypothesis Section 1.1, applied to the field $F' \( X \)$, gives a parabolic subgroup whose nilradical contains the value of $phi.alt$ there. In characteristic zero the same assertion is the rational parabolic consequence of Jacobson–Morozov. Choose the standard parabolic $P$ of this type. For the split group $G$, the scheme of parabolics of that type is $G \/ P$; the rational parabolic therefore gives, in the generic trivialization, a section of $cal(P) \/ P$ over $F' \( X \)$. This is the required generic $P$-reduction and does not require a choice of rational conjugating element. Properness of $G \/ P$ extends it to a reduction $cal(Q)$ on the whole smooth curve $X_(F')$. Since its nilradical bundle is a subbundle of $"ad" \( cal(P) \)$, the generic containment extends to
  $ phi.alt in H^0 #scale(x: 120%, y: 120%)[\(] X_(F') \, cal(Q) times^P "Lie" R_u \( P \) ⊗ omega_(X_(F')) \( x \) #scale(x: 120%, y: 120%)[\)] . $
  Consider the stack $cal(Y)$ of a $P$-bundle together with a Borel flag at $x$ in the relative position of $\( cal(Q)_x \, beta \)$ just obtained. This stack is smooth. Indeed $"Bun"_P$ is smooth by the vanishing of the second cohomology of its deformation bundle on a curve, and the relative-position locus over it is the associated bundle with fiber a $P$-orbit in $G \/ B$. That orbit is smooth: its stabilizer is an intersection of a parabolic and a Borel, with the usual smooth torus and root-group description.
  The pullback of $phi.alt$ to a cotangent vector on $cal(Y)$ is zero. To check this without suppressing the level condition, deformations on $cal(Y)$ are governed by the locally free sheaf $cal(E)$ of sections of $"ad" \( cal(Q) \)$ whose value at $x$ lies in the intersection with the Borel Lie algebra. Pairing $phi.alt$ with $cal(E)$ has no pole at $x$, by the original residue condition. It is zero generically because the nilradical of a parabolic is the annihilator of its Lie algebra. Hence the induced section of $cal(E)^(*) ⊗ omega$ is zero everywhere. Serre duality proves the asserted vanishing on deformation spaces.
  Shrink to a smooth dense open of $Z$. The finite separable extension $F' \/ F$ spreads to a finite #emph[étale] cover of a smaller such open, and the reduction spreads to a map from that cover to $cal(Y)$. The canonical one-form of $T^(*) D$ pulls back to zero there: it evaluates the given covector on the induced deformation of the bundle, and this deformation factors through $cal(Y)$. Since the cover is separable, the one-form already vanishes on the smooth dense open of $Z$. Its exterior differential, the symplectic form, also vanishes there. An isotropic tangent space in $T^(*) D$ has dimension at most $d$, proving (3.2). The separability in this argument is essential; a purely inseparable cover would not detect vanishing of differential forms.
  Products and smooth pullbacks preserve this dimension bound: on cotangent bundles a smooth pullback adds exactly the relative dimension to the dimension of the cone. The description of the enhanced and quotient cones above therefore proves the remaining cases. In characteristic zero the same argument can start with any reduced irreducible subvariety of the cone, rather than only an irreducible component. It gives the stated isotropy, which is likewise preserved by products and smooth pullbacks. ◻
]

=== 3.2 A central cocharacter detecting a nonnilpotent value <a-central-cocharacter-detecting-a-nonnilpotent-value>

The modification below must be defined by an integral cocharacter. Choosing merely an element of a toral Lie algebra would lose information in positive characteristic. The next lemma supplies an actual cocharacter and the formal normal form needed for the residue calculation.

#thm([Lemma 3.2.])[
  #emph[Over an algebraically closed field of characteristic zero, or over $k = overline(bb(F))_q$ under the four characteristic hypotheses, let $a \( t \) in frak(g) \[ \[ t \] \]$ with $a \( 0 \)$ not nilpotent. After changing the formal $G$-frame, there are a Levi subgroup $M$ and a cocharacter $lambda : bb(G)_m arrow.r Z \( M \)$ such that 
#[#set math.equation(numbering: n => "(3.3)")
 $ a \( t \) in frak(m) \[ \[ t \] \] \, #h(2em) "ad" \( a \( 0 \) \) : frak(g) \/ frak(m) arrow.r^tilde.op frak(g) \/ frak(m) \,\
kappa \( a \( 0 \) \, d lambda \) eq.not 0 . $ <eq:geometry-levi-normal-form>]

 Here $d lambda$ is the image of $1 in "Lie" bb(G)_m$ under the differential of $lambda$.]
] <lem:central-cocharacter>

#proof[
  We construct the Levi from the semisimple part of $a \( 0 \)$, choose a central cocharacter that pairs nontrivially with that part, and then remove the remaining off-Levi coefficients of the series. The first two steps require some care in positive characteristic.
  #emph[The semisimple part and its centralizer.] Embed $G$ as a closed subgroup of some $"GL" \( W \)$. In positive characteristic $frak(g)$ is closed under the restricted $p$-power, which is matrix $p$-th power in this representation. All eigenvalues of $a \( 0 \)$ belong to a finite subfield of $k$. For a sufficiently large power $p^r$ that fixes these eigenvalues and kills every nilpotent Jordan block, matrix power $a \( 0 \)^(p^r)$ is its semisimple part $s$. Consequently both $s$ and $n = a \( 0 \) - s$ belong to $frak(g)$ and $\[ s \, n \] = 0$. In characteristic zero this is the usual Jordan decomposition in an algebraic Lie algebra.
  To identify $s$ and $n$ intrinsically, fix a maximal torus $T$, a simple system $Delta$, and compatible root vectors $e_alpha \, e_(- alpha)$ with $\[ e_alpha \, e_(- alpha) \] = d alpha^or$. Invariance gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ kappa \( d alpha^or \, H \) = c_alpha thin d alpha \( H \) \, #h(2em) c_alpha = kappa \( e_alpha \, e_(- alpha) \) eq.not 0 quad \( H in frak(t) \) . $ <eq:geometry-root-pairing>]
  The nonzero constant follows from the perfect pairing of opposite $T$-weight spaces. Hypothesis Section 1.1, applied to the Levi $T$, makes $kappa \|_(frak(t))$ nondegenerate. Since $G$ is simply connected, the simple coroots form a basis of $X_(*) \( T \)$; their differentials are therefore a basis of $frak(t)$. Equation (3.4) shows that the simple-root differentials are linearly independent. The same equation, applied to any root, shows that its differential is nonzero.
  We claim that matrix semisimplicity agrees with the toral definition in the theorem, and that matrix nilpotence agrees with the orbit-closure definition. The proper incidence morphism
  $ G times^B frak(b) arrow.r frak(g) $
  is surjective. Its differential is surjective at a toral element outside the finitely many root-differential hyperplanes, so its closed image contains a dense open. Inside $frak(b)$, write an element as $H + u$. Successive conjugations by root groups, in increasing root height, remove every root coefficient with $d alpha \( H \) eq.not 0$: the coefficient in question changes by a nonzero multiple of the root-group parameter, while changes to other coefficients occur in higher heights. The remaining term $u_0$ commutes with $H$ and is a nilpotent matrix. Thus $H + u_0$ is matrix semisimple only if $u_0 = 0$. Likewise a matrix nilpotent in $frak(b)$ has zero toral projection, since a faithful representation is upper triangular on $B$ and its toral differential is injective. Contraction by a strictly dominant cocharacter sends the nilradical to zero. This proves that matrix nilpotence is equivalent to the orbit-closure definition; the reverse implication also follows directly from the closed matrix nilpotent cone. The same argument applies inside any Levi.
  We may now conjugate $s$ into $frak(t)$. Since $a \( 0 \)$ is not nilpotent, $s eq.not 0$. Hypothesis Section 1.1 makes its scheme-theoretic centralizer a Levi $M = Z_G \( s \)$. We have $s in frak(z) \( frak(m) \)$ and $n in frak(m)$. Conjugate $n$ within $M$ into a Borel nilradical of $frak(m)$, using the preceding argument. Torus weights then show that $n$ is orthogonal to $frak(z) \( frak(m) \)$; this conclusion is unchanged by the conjugation.
  #emph[Choosing an integral central cocharacter.] To detect $s$ by a cocharacter, we need the differentials of central cocharacters to span $frak(z) \( frak(m) \)$. We verify this before using the nondegeneracy of $kappa$ on the center. Choose the simple system $Delta$ so that $M$ corresponds to a subset $Delta_M subset Delta$. Its Lie center is
  $ frak(z) \( frak(m) \) = ⋂_(alpha in Delta_M) ker \( d alpha \) subset frak(t) . $
  There are no additional central root vectors, since each root differential is nonzero. The integral map
  $ X_(*) \( T \) arrow.r bb(Z)^(Delta_M) \, #h(2em) nu mapsto \( chevron.l alpha \, nu chevron.r \)_(alpha in Delta_M) $
  has full row rank after reduction modulo $p$ in positive characteristic, by the linear independence of the simple-root differentials proved above. Its Smith normal form therefore has no nonunit elementary divisor divisible by $p$. It follows that the kernel of its differential is spanned over $k$ by the differentials of its integral kernel. The latter kernel is exactly $X_(*) \( Z \( M \) \)$. Thus the Lie center is spanned by differentials of actual central cocharacters. In characteristic zero the same conclusion follows by tensoring the integral kernel with $k$.
  By Hypothesis Section 1.1 the restriction of $kappa$ to this center is nondegenerate, and by the integral-kernel calculation its central cocharacter differentials span it. Some $lambda in X_(*) \( Z \( M \) \)$ therefore satisfies
  $ kappa \( a \( 0 \) \, d lambda \) = kappa \( s \, d lambda \) eq.not 0 . $
  On $frak(g) \/ frak(m)$ the operator $"ad" \( s \)$ is invertible and $"ad" \( n \)$ is nilpotent and commutes with it. Their sum is invertible, giving the middle assertion of (3.3).
  #emph[Putting the formal series in the Levi.] It remains to put the whole series in $frak(m) \[ \[ t \] \]$. Decompose $frak(g)$ into the zero and nonzero eigenspaces of $"ad" \( s \)$, so that the first summand is $frak(m)$. Suppose inductively that the non-$frak(m)$ coefficients below order $t^r$ have been removed. Conjugation by a group element congruent to $1 + t^r Y$ modulo $t^(r + 1)$ changes the offending coefficient by $\[ Y \, a \( 0 \) \]$. The invertibility just proved supplies $Y$ that removes it. Such a group element exists by smoothness of $G$. The successive changes converge in $G \( k \[ \[ t \] \] \)$, proving the first assertion without changing the constant term. ◻
]

=== 3.3 The two tangent maps of a Hecke modification <the-two-tangent-maps-of-a-hecke-modification>

The central-cocharacter modification below follows the microlocal method of #cite(label("AGKRRV")) Sections 20.5 and 20.7–20.8 and the transverse formulation in #cite(label("OpenAIFullSupport2026")) Proposition 4.2. We include both tangent calculations, since the slicing argument uses them on opposite fibers.

Let $U$ denote the allowed moving-point curve, or the disjoint union of the two allowed curves in the quotient case. An exact-relative-position Hecke correspondence $H$ has maps

$ p : H arrow.r cal(B) \, quad o : H arrow.r cal(B) \, quad "leg" : H arrow.r U \, #h(2em) q = \( o \, "leg" \) \, quad tilde(p) = \( p \, "leg" \) . $

Thus $p$ remembers the input bundle and $o$ the output bundle. For relative position $lambda^(+)$, both $q$ and $tilde(p)$ are representable smooth of relative dimension $m = chevron.l 2 rho \, lambda^(+) chevron.r$. This is the usual smooth affine-Grassmannian orbit description in disc frames. Its Schubert closure is a bound proper over either bundle together with the leg; the inverse modification gives the description from the other side. These facts hold in families of smooth legs, and a level condition at a disjoint point is transported unchanged.

#thm([Proposition 3.3.])[
  #emph[Let $A in T_b^(*) cal(B)$ be a covector outside $Lambda$. There exist a point $y in U$, an exact-relative-position correspondence $H$, a modification $h in H$ with $p \( h \) = b$ and leg $y$, an output covector $A' in T_(o \( h \))^(*) cal(B)$, and a nonzero $xi in T_y^(*) U$ such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ p^(*) A = q^(*) \( A' \, xi \) quad upright("at ") h . $ <eq:geometry-covector-identity>]

 Put 
$ H_(upright("in")) = tilde(p)^(- 1) \( b \, y \) \, #h(2em) H_(upright("out")) = q^(- 1) \( o \( h \) \, y \) \, $

 where the fibers include the fixed-side bundle identifications. Both are smooth of dimension $m$. The following two sections have nondegenerate zeros at $h$:]
  + #emph[on $H_(upright("in"))$, the restriction of $p^(*) A$ to $T_(H \/ \( cal(B) times U \) \, q) \|_(H_(upright("in")))$;]
  + #emph[on $H_(upright("out"))$, the restriction of $o^(*) A'$ to $T_(H \/ \( cal(B) times U \) \, tilde(p)) \|_(H_(upright("out")))$.]
  #emph[Each is a section of the dual of the indicated rank-$m$ bundle. In particular, both zeros are isolated.]
] <prop:transverse-hecke>

#proof[
  Represent $A$ by its Higgs field or pair of fields. On a curve where it is not generically nilpotent, choose an unmarked point $y$ at which the value is not nilpotent. In a parameter $t$ centered at $y$ and a formal frame, write this field as $a \( t \) thin d t$. Lemma 4 supplies $M$ and $lambda$ satisfying (3.3). Make the modification by $lambda \( t \)$, with the convention that its adjoint output lattice is
  $ L' = "Ad" \( lambda \( t \) \) L \, #h(2em) L = frak(g) \[ \[ t \] \] \, #h(2em) J = L ∩ L' . $
  Because $lambda$ centralizes $M$, the field $a \( t \) thin d t$ is regular in both lattices. It therefore transports to a global output covector $A'$ with the same residue conditions at every marked point.
  We record explicitly the tangent spaces and their pairing. Gauge transformations on the input formal disc move $L'$, whereas those on the output move $L$. Quotienting in each case by the common stabilizer gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ T_h H_(upright("in")) = L \/ J \, #h(2em) T_h H_(upright("out")) = L' \/ J . $ <eq:geometry-two-tangents>]
  Both $L$ and $L'$ are their own annihilators for the pairing $"Res"_(t = 0) kappa \( - \, - \) thin d t$. More explicitly, if $frak(g) = xor.big_(j in bb(Z)) frak(g)_j$ is the #emph[integer] weight decomposition for $lambda$, then
  #[#set math.equation(numbering: n => "(3.7)")
   $ L \/ J & = xor.big_(j > 0) frak(g)_j ⊗ k \[ \[ t \] \] \/ \( t^j \) \,\
L' \/ J & = xor.big_(j < 0) frak(g)_j ⊗ t^j k \[ \[ t \] \] \/ k \[ \[ t \] \] . $ <eq:geometry-truncated-lattices>]
  Opposite weights pair perfectly under $kappa$, and the coefficient of $t^i$ pairs with that of $t^(- 1 - i)$. Thus
  #[#set math.equation(numbering: n => "(3.8)")
   $ \( L \/ J \) times \( L' \/ J \) arrow.r k \, #h(2em) \( D \, C \) mapsto "Res" kappa \( D \, C \) thin d t $ <eq:geometry-residue-perfect>]
  is a perfect pairing of $m$-dimensional vector spaces.
  To compute the covector identity, first hold the output and leg fixed. A tangent vector represented by $C in L'$ changes the input bundle by that principal part. Serre duality evaluates $p^(*) A$ on it as $"Res" kappa \( a \( t \) \, C \) thin d t$, which vanishes because $a \( t \) in L'$. The degree-zero smooth cotangent exact sequence for $q$ implies that $p^(*) A$ is the pullback of a covector on output bundle times leg. This argument is valid for stack covectors: the pullback in that exact sequence is injective, and its image consists precisely of covectors annihilating the relative tangent space.
  The bundle component is $A'$. It can be tested on principal parts at points away from $y$ and the markings, where the input and output are identified. Such tests span the deformation space: sufficiently large pole divisors supported at those points kill the first cohomology of the deformation bundle, and the principal-parts exact sequence then surjects onto that first cohomology. For the moving-point component, hold the output fixed and replace $t$ by $t - z$ in the modification. The logarithmic derivative of $lambda \( t - z \)$ at $z = 0$ is $- d lambda \/ t$. Consequently, up to the common sign determined by the gluing convention,
  #[#set math.equation(numbering: n => "(3.9)")
   $ xi = plus.minus kappa \( a \( 0 \) \, d lambda \) thin d z eq.not 0 . $ <eq:geometry-leg-covector>]
  These computations prove (3.5). In the simultaneous quotient case they may first be made with both enhancements retained and then descended along the smooth torus quotient; the modified curve is disjoint from all gluing data.
  It remains to prove the two nondegeneracy assertions. The perfect pairing above pairs tangents to the two fixed-side fibers; its $"ad" \( a \( t \) \)$-twist will be the derivative of each section. Move in $H_(upright("in"))$ in direction $D in L \/ J$ and transport a test vector $C in L' \/ J$ with the moving lattice. Differentiating its pairing with the fixed input covector gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ "Res" kappa \( a \( t \) \, \[ D \, C \] \) thin d t = "Res" kappa \( \[ a \( t \) \, D \] \, C \) thin d t \, $ <eq:geometry-derivative-pairing>]
  up to the same harmless choice of sign. The expression is independent of lifts of $D$ and $C$: $"ad" \( a \( t \) \)$ preserves $L$, $L'$ and $J$. It preserves every $lambda$-weight space because $a \( t \) in frak(m) \[ \[ t \] \]$ and $lambda$ is central in $M$. For $j eq.not 0$, $frak(g)_j$ lies in the noncentralizer summand $frak(g) \/ frak(m)$; hence the constant term of this operator is invertible on $frak(g)_j$. It is therefore invertible on each of the truncated modules in (3.7). The perfect residue pairing (3.8) makes (3.10) perfect as well. This is exactly the derivative of the first section in the statement at its zero.
  For the section on $H_(upright("out"))$, keep the output fixed, move $L$ using $C in L' \/ J$, and transport $D in L \/ J$. The resulting derivative is the transpose of (3.10), up to sign. It too is perfect. A section of a rank-$m$ vector bundle on a smooth $m$-dimensional fiber whose derivative at a zero is invertible has an isolated reduced zero there, proving both assertions. All truncation lengths in this proof are integer cocharacter weights; none is inverted in $k$. ◻
]

The two fibers will have different roles in the detection argument. The nondegenerate zero on $H_(upright("out"))$ isolates a contribution to a proper Hecke pushforward. The zero on $H_(upright("in"))$ supplies the coordinates transverse to that contribution and yields the exact split quadratic equation of Section 4.

== 4 Hecke eigencomplexes and transverse slices <sec:detection>

We now turn the transverse modification of Proposition 5 into a sheaf-theoretic detection argument. There are two conclusions. Over a field, a Hecke eigencomplex has singular support in the generically nilpotent cone. Over a trait, a Hecke eigencomplex cannot have zero nearby cycles if its support approaches the special fiber. The same two-Hecke correspondence proves both statements; the final step of the second also uses the dimension bound of Proposition 3. The moving-leg argument and the isolation of a covector by a modification have close predecessors in #cite(label("AGKRRV")) §§20.5–20.8; their vanishing-cycle method also uses transverse quadratic functions #cite(label("AGKRRV")) Appendix H, especially Remark H.2.5. The two-modification quadratic model and the projective slicing arguments are the unramified methods of #cite(label("OpenAIFullSupport2026")) Proposition 5.1, Section 6, and Lemma 7.2. We prove their field and trait versions here for the level stacks required in the construction. A projective quadric calculation recovers the original hypersurface from the local model supplied by the two modifications.

Throughout this section, a bundle stack over an algebraically closed field means one of the stacks considered in Section 3: the unlevelled bundle stack on a smooth projective curve, the bundle stack with ordinary or enhanced Borel level at a marked point, or, in characteristic zero, the quotient of two enhanced-level bundle stacks by the simultaneous flag torus. In the last case Hecke modifications act separately on the two punctured curves. We write $cal(B)$ for the stack and $Lambda subset T^(*) cal(B)$ for its cone of Higgs fields generically nilpotent on every curve. For a smooth scheme chart $b : D arrow.r cal(B)$, $Lambda_D$ denotes the image of the pullback of this cone under the cotangent map. The group and characteristic hypotheses are those of Section 3.

#thm([Theorem 4.1.])[
  (Nilpotent detection).  #emph[Let $cal(B)$ be such a bundle stack over an algebraically closed field, and let $F$ be a locally bounded constructible $E$-complex on $cal(B)$. Suppose that, for every spherical Satake representation $V$ and each curve on which modifications are allowed, there is an isomorphism 
$ sans(H)_V \( F \) tilde.eq F times.square cal(V)_V $

 with $cal(V)_V$ lisse on the open curve. Then $"SS" \( b^(*) F \) subset Lambda_D$ for every smooth finite-type scheme chart $b : D arrow.r cal(B)$.]
] <thm:nilpotent-detection>

The specialization statement uses the following precise relative setup. Let $S = "Spec" R$ be an excellent complete strictly henselian trait on which $ell$ is invertible, with algebraically closed residue field, generic point $eta$, and geometric generic point $macron(eta)$. Let $cal(B) arrow.r S$ be smooth and locally of finite type, with special fiber one of the preceding bundle stacks. Assume that there is a smooth scheme of legs $L arrow.r S$ of relative dimension one, whose special fiber contains a nonempty open subset of every allowed special-fiber curve, with the usual spherical Hecke correspondences. Their bounded output maps to $cal(B) times_S L$ are representable and proper. Each exact-relative-position stratum is smooth over $\( upright("input bundle") \, upright("leg") \)$ and over $\( upright("output bundle") \, upright("leg") \)$, and has the special-fiber geometry of Proposition 5. The Satake kernel on its open stratum is the constant sheaf with its relative Satake shift and twist. These conditions hold for the pointed smooth family and for the twisted nodal family used below.

#thm([Theorem 4.2.])[
  (Specialization detection).  #emph[In this relative setup, let $F$ be a locally bounded constructible $E$-complex on $cal(B)_(macron(eta))$ with lisse Hecke eigenvalues on $L_(macron(eta))$. Suppose each eigenvalue admits a lisse lattice whose finite reductions extend lisse after finite extensions of the trait, compatibly with its special-fiber value, as in Proposition 2. If $Psi F = 0$, then, on every smooth finite-type chart $D arrow.r cal(B)$, the closure of the nonzero-stalk locus of $F \|_(D_(macron(eta)))$ does not meet $D_s$. Equivalently, any such meeting forces $Psi F eq.not 0$.]
] <thm:specialization-detection>

The closure in this statement can be computed after descending its finitely many geometric generic components to a finite extension of $R$. It does not require a field of definition for $F$ itself. All extensions below are taken inside the fixed geometric generic field. Nearby cycles always mean geometric nearby cycles, without inertia invariants.

=== 4.1 A hypersurface cut and two Hecke modifications <a-hypersurface-cut-and-two-hecke-modifications>

The common step in the two theorems is a calculation for one hypersurface. We keep the two coefficient complexes distinct. In the #emph[field case], let $F$ satisfy the hypotheses of Theorem 6, take a smooth chart $b : D arrow.r cal(B)$, a closed point $d$, and a regular function $f$ near $d$ with $f \( d \) = 0$, and put $K = b^(*) F$. Here $L$ is the open curve of allowed legs, or the disjoint union of the two open curves in the quotient case. In the #emph[trait case], let $F$ satisfy the hypotheses of Theorem 7 and assume $Psi F = 0$. Take a smooth chart $b : D arrow.r cal(B)$ over $S$, a closed point $d in D_s$, and a regular function $f$ with $f \( d \) = 0$; put $K = b_(macron(eta))^(*) F$. Thus $K$ is defined on $D$ in the field case and only on $D_(macron(eta))$ in the trait case.

#thm([Lemma 4.3.])[
  (Hypersurface calculation).  #emph[If the differential $d f_d$ in the field case, respectively its relative special-fiber differential in the trait case, lies outside $Lambda_D$, then 
$ \( Phi_f K \)_d = 0 quad upright("in the field case") \, #h(2em) #scale(x: 120%, y: 120%)[\(] Psi \( K \|_({ f = 0 }_(macron(eta))) \) #scale(x: 120%, y: 120%)[\)]_d = 0 quad upright("in the trait case") . $

 Here $Phi_f$ is the unshifted cone from restriction to geometric nearby cycles for $f$.]
] <lem:detection-hypersurface>

#proof[
  The Hecke eigenrelation first gives a vanishing after proper pushforward. The two nondegenerate zeros of Proposition 5 then have different roles: one isolates a single stalk in that pushforward, and the other gives local coordinates in which the equation is the original hypersurface equation plus a split quadratic form. A projective compactification will recover the cycles of the original hypersurface from those of the stabilized one.
  #emph[1. The modified hypersurface and the eigenrelation.] If $d f_d$ is nonzero on the tangent space relative to $b$, the map $\( b \, f \) : D arrow.r cal(B) times bb(A)^1$ is smooth near $d$ in the field case, and ${ f = 0 } arrow.r cal(B)$ is smooth near $d$ in the trait case. Smooth base change proves the assertion. We may therefore assume $d f_d = b^(*) A$ for a covector $A in.not Lambda$ at $b \( d \)$.
  Choose the modification $h$ supplied by Proposition 5, at a leg $y$. Write $H$ for its exact-position Hecke stratum and
  $ p : H arrow.r cal(B) \, #h(2em) o : H arrow.r cal(B) \, #h(2em) q = \( o \, "leg" \) : H arrow.r cal(B) times L \, #h(2em) tilde(p) = \( p \, "leg" \) . $
  Both $q$ and $tilde(p)$ are smooth of relative dimension $m$. At $h$ the proposition gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ p^(*) A = q^(*) \( A' \, xi \) \, #h(2em) xi eq.not 0 . $ <eq:detection-leg>]
  Use the two fibers named in that proposition:
  $ H_(upright("in")) = tilde(p)^(- 1) \( b \( d \) \, y \) \, #h(2em) H_(upright("out")) = q^(- 1) \( o \( h \) \, y \) . $
  On $H_(upright("in"))$, the restriction of $p^(*) A$ to the $q$-relative tangent has a nondegenerate zero at $h$; on $H_(upright("out"))$, the restriction of $o^(*) A'$ to the $tilde(p)$-relative tangent does too. Each fiber retains the identification with its fixed-side bundle.
  In the trait case these are special-fiber statements; take the corresponding relative Hecke stratum over $S$. In the field case introduce the trait in the function line with parameter $z$, extend all spaces constantly, and impose $f = z$. We will apply vanishing cycles over this trait. Thus the two cases have a common notation: $e = 0$ in the trait case and $e = z$ in the field case, and the operation to be computed is, respectively, $Psi$ and $Phi$.
  Take two copies $H_1 \, H_2$ of $H$ and form
  #[#set math.equation(numbering: n => "(4.2)")
   $ W_0 = H_2 times_(p \, cal(B)) D \, #h(2em) P = H_1 times_(q \, cal(B) times L \, q) W_0 . $ <eq:detection-double>]
  Thus the two modifications have the same output bundle and leg, while the input of the second lies in the chart $D$. The defining square is
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$P$])
  content((2.193, 0), [$H_1$])
  content((0, -0.744), [$W_0$])
  content((2.193, -0.744), [$cal(B) times L \,$])
  line((0.336, 0), (1.725, 0), mark: (end: ">"))
  content((1.03, 0.2266), [#text(size: 0.73em)[$"pr"_1$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.4668, -0.372), [#text(size: 0.73em)[$"pr"_2$]])
  line((2.193, -0.2725), (2.193, -0.4715), mark: (end: ">"))
  content((2.515, -0.372), [#text(size: 0.73em)[$q$]])
  line((0.468, -0.744), (1.593, -0.744), mark: (end: ">"))
  content((1.03, -0.5173), [#text(size: 0.73em)[$q_2$]])
})
  where $q_2$ is the output-and-leg map of the second modification and the composite on the right is its input map. Let $c : P arrow.r D$ be the projection through $W_0$. Set $W = { f = e } subset W_0$ and $P_c = { f \( c \) = e } subset P$. The distinguished points are $w = \( h \, d \)$ in $W_s$ and $a = \( h \, h \, d \)$ in $\( P_c \)_s$. Products here are over the trait when one is present.
  The output-bundle map $W arrow.r cal(B)$ is smooth near $w$. Indeed, $W_0 arrow.r cal(B) times L$ is smooth, and (4.1) says that the cut differential, on directions relative to the output bundle, has the nonzero leg component $xi$. The eigenisomorphism therefore implies that the cycles of the pulled-back Hecke transform vanish at $w$. In the trait case this is smooth base change from $Psi F = 0$, followed by the lisse tensor compatibility. In the field case $W arrow.r cal(B)_S$ is smooth over the function trait, where $cal(B)_S$ is the constant stack. Pullback of the constant family with coefficient $F$ therefore has zero vanishing cycles, and tensoring by the lisse eigenvalue preserves this assertion. The map to the bundle stack is what is smooth here; no smoothness of $W arrow.r cal(B) times L$ is needed.
  #emph[2. Isolating one stalk in the proper pushforward.] Replace $H_1$ in (4.2) by its proper Schubert bound $overline(H)_1$. Choose the Satake representation whose kernel is the intersection complex of this bound. Proper base change identifies the cycles of the preceding transform with the proper push of the cycles of its Satake integrand. If $T$ is the proper fiber over $w$ and $C$ is the restriction of those cycles to $T$, we obtain
  #[#set math.equation(numbering: n => "(4.3)")
   $ R Gamma \( T \, C \) = 0 . $ <eq:detection-proper-zero>]
  We next isolate the contribution of $a$; no assertion about the boundary of the Schubert variety is required. In the field case the Satake integrand is defined on the entire constant family and then restricted to the cut $f \( c \) = z$; $C$ is the restriction of its vanishing cycles. In the trait case we instead start with the geometric-generic integrand and take its nearby cycles.
  Before cutting, $P arrow.r cal(B)$ by the first input bundle is smooth. At a point of $T$ in its open-orbit neighborhood, failure of smoothness after cutting would mean that $d \( f compose c \)$ comes from the cotangent space of that first input bundle. On this fiber the same differential is the pullback of $\( A' \, xi \)$ along $q_1$. Since $P arrow.r H_1$ is smooth, its cotangent map is injective; thus failure would already give on $H_1$ an equality
  $ q_1^(*) \( A' \, xi \) = p_1^(*) A_1 $
  for some $A_1$. On $tilde(p)_1$-relative tangents this forces $o_1^(*) A'$ to vanish. The nondegenerate zero on $H_(upright("out"))$ shows that $a$ is isolated among such points of $T$. Consequently $C$ vanishes on a punctured neighborhood of $a$ in $T$: there the cut map to the first input stack is smooth and the open-orbit Satake kernel is an invertible constant shift and twist. This smoothness is over the trait. In the field case the integrand therefore pulls back the constant $F$-family on $cal(B)_S$, so it has zero $Phi$, as required; the trait case uses $Psi F = 0$. Here the open part of $T$ is exactly $H_(upright("out"))$ for $H_1$, since $w$ fixes the second modification and $d$.
  Here is the precise consequence of this isolation. If a constructible complex on a proper scheme vanishes on a punctured neighborhood of a closed point, its contribution at that point is a direct summand of its global cohomology. To see this, let $j : T \\ { a } arrow.r T$ and $i : { a } arrow.r T$. The restriction $j^(*) C$ is zero near $a$, so $\( R j_(*) j^(*) C \)_a = 0$. The localization triangle consequently splits as the direct sum of $i_(*) C_a$ and $R j_(*) j^(*) C$; both connecting morphisms vanish by these disjoint supports. The same localization argument applies to algebraic spaces. Equation (4.3) now gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ C_a = 0 . $ <eq:detection-vertex-zero>]
  #emph[3. An exact split quadratic equation at the isolated point.] We identify the local equation at this isolated point exactly. The diagonal $W_0 arrow.r P$, given by making the two modifications equal, is a section of the smooth map $P arrow.r W_0$. Etale locally at $a$, there is a map $r : P arrow.r D$ lifting the first-input map to $cal(B)$, whose restriction to this diagonal is the original chart point, including its identification with the first input. Indeed, the smooth morphism $P times_(cal(B)) D arrow.r P$ has that section on the diagonal. To extend it, choose relative smooth coordinates, giving an etale map from a neighborhood of its value to $bb(A)_P^delta$, where $delta$ is the relative dimension of $D arrow.r cal(B)$ at $d$. The coordinates of the prescribed section are functions on the diagonal; lift these functions to a neighborhood in $P$ and take their graph in $bb(A)_P^delta$. Pullback of the etale map along this graph gives an etale neighborhood of $P$ with a lift to $P times_(cal(B)) D$. Retain the branch carrying the prescribed section along the diagonal. The resulting projection to $D$ is $r$, and the fiber product retains the specified stack isomorphism between $b compose r$ and the first input. Thus $c$ records the second input everywhere, whereas $r$ records the first input in this etale neighborhood; the two agree on the diagonal. The diagonal, being a section of the smooth morphism $P arrow.r W_0$ of relative dimension $m$, is a regular immersion of codimension $m$. Choose relative coordinates $v_1 \, dots.h \, v_m$ generating its ideal. Since $r = c$ on it, there are functions $u_i$ with
  #[#set math.equation(numbering: n => "(4.5)")
   $ f \( c \) - f \( r \) = sum_(i = 1)^m u_i v_i . $ <eq:detection-exact-uv>]
  This is an equality of functions, not merely an equality of quadratic terms.
  On the diagonal fiber with $c = d$ and leg $y$, which is the fixed-input, fixed-leg fiber of $H$ through $h$, the conormal coefficients $u_i$ are the negatives of the restriction of $p^(*) A$ to the $q$-relative tangent, in the frame dual to the $v_i$. In fact variation of the first modification with the second fixed has $d c = 0$, whereas $b compose r$ is its first input, so differentiating (4.5) gives precisely this restriction. This calculation is independent of the chart-vertical part of $d r$: $d f_d = b^(*) A$ annihilates $ker \( d b_d \)$. The description holds along that entire diagonal fiber. The nondegenerate zero on $H_(upright("in"))$ shows that $u_i \( a \) = 0$ and that the derivatives of the $u_i$ on that fiber form a basis. The map $W_0 arrow.r D times L$ is the smooth base change of $tilde(p)$, of relative dimension $m$. On the diagonal, $r = c$ and the leg provide the other coordinates; the $v_i$ provide its normal coordinates. Hence
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( r \, "leg" \, u_1 \, dots.h \, u_m \, v_1 \, dots.h \, v_m \) : P arrow.r D times L times bb(A)^(2 m) $ <eq:detection-uv-chart>]
  is etale near $a$, with the evident relative interpretation over $S$. The first-input integrand is $r^(*) K$ up to its invertible constant shift and twist. Thus (4.4) says that its cycles vanish at the vertex of
  #[#set math.equation(numbering: n => "(4.7)")
   $ f + sum_i u_i v_i = e . $ <eq:detection-affine-quadric>]
  For $m = 0$ this is already the required assertion, after removing the smooth leg factor.
  #emph[4. Recovering the original hypersurface.] We have proved vanishing after adjoining the split quadratic variables. To remove them, we use a proper family whose extra cohomology is supported precisely on the original cut ${ f = e }$. For $m > 0$, put $B = D times L$ and compactify (4.7) to the proper quadric family
  #[#set math.equation(numbering: n => "(4.8)")
   $ pi : Q = {sum_(i = 1)^m u_i v_i + \( f - e \) w^2 = 0} subset bb(P)_B^(2 m) arrow.r B . $ <eq:detection-projective-quadric>]
  In the field case $B$ also carries the constant extension in $z$. Every point above $\( d \, y \)$ other than the vertex $\[ 0 : dots.h.c : 0 : 1 \]$ is smooth for $pi$, since some $u_i$ or $v_i$ is nonzero. The cycles of $pi^(*) K$ there vanish by smooth base change; they vanish at the vertex by (4.6). Proper compatibility therefore gives zero cycles for $R pi_(*) pi^(*) K$ at $\( d \, y \)$.
  We record why the extra cohomology of this projective quadric recovers the desired cut as a sheaf, including in characteristic two. Write $i : Z = { f = e } arrow.r.hook B$. Hyperplane powers define a morphism
  #[#set math.equation(numbering: n => "(4.9)")
   $ xor.big_(a = 0)^(2 m - 1) E_B \( - a \) \[ - 2 a \] arrow.r R pi_(*) E_Q arrow.r i_(*) E_Z \( - m \) \[ - 2 m \] arrow.r^(+ 1) . $ <eq:detection-quadric-triangle>]
  To verify this triangle, first take its first arrow and call its cone $J$. Away from $Z$, the fibers are smooth odd-dimensional quadrics and their cohomology is freely generated by these hyperplane powers. Consequently $J$ is supported on $Z$. Over $Z$ the entire family, including its hyperplane bundle, is the product with the split projective cone $Q_0$ on the smooth quadric of dimension $2 m - 2$. Removing its vertex gives an affine-line bundle over that even-dimensional quadric. Here the affine cells can be computed inductively: in a smooth split quadric of dimension $N$, the open set where an isotropic coordinate is nonzero is $bb(A)^N$, and its complement is a point together with an affine-line bundle over the split quadric of dimension $N - 2$. Starting with the two-point quadric and the conic $bb(P)^1$ gives one cell in every dimension, with a second middle cell precisely when $N$ is even. Apply the same decomposition to the cone. Localization and the absence of odd-dimensional cohomology give
  $ H^(2 a) \( Q_0 \, E \) & = E \( - a \) &  & \( 0 lt.eq a lt.eq 2 m - 1 \, med a eq.not m \) \,\
H^(2 m) \( Q_0 \, E \) & = E \( - m \)^(xor 2) \,\
H^(upright("odd")) \( Q_0 \, E \) & = 0 . $
  Every hyperplane power is nonzero. To check this without invoking duality on the singular cone, write $C_0$ for its smooth quadric base and resolve the cone by $bb(P)_(upright("lines")) \( cal(O)_(C_0) \( - 1 \) xor cal(O)_(C_0) \)$. The hyperplane class pulls back to $zeta = c_1 \( cal(O) \( 1 \) \)$ on this projective bundle. If $h_0$ is the hyperplane class on $C_0$, the projective-bundle formula gives $zeta^2 = h_0 zeta$ and hence $integral zeta^(2 m - 1) = integral_(C_0) h_0^(2 m - 2) = 2$. Thus the top hyperplane power on the cone is nonzero, and so are all its lower powers. This also covers $m = 1$, when $C_0$ consists of two points and the resolution is the two projective lines. Consequently $i^(*) J$ has just one cohomology sheaf, the constant sheaf $E_Z \( - m \)$ in degree $2 m$. Proper base change gives this calculation over $Z$ as a complex of sheaves, since the family there is the specified product. Localization gives $J tilde.eq i_(*) i^(*) J$, proving (4.9). A choice of generator of the one-dimensional quotient identifies it with the displayed Tate line; its constancy, rather than that choice, is what we use.
  All these assertions hold in characteristic two. The split even quadric has the same affine cells, and for $f - e eq.not 0$ the only possible singular point of the odd quadric would have all $u_i = v_i = 0$, which does not lie on it. Hyperplane degree $2$ is invertible in $E$, irrespective of the characteristic of the geometric base. No division by $2$ in coordinates or quadratic Morse lemma has been used.
  Tensor (4.9) with $K$ and use the projection formula. In the trait case take this triangle on the geometric generic fiber. The cycles of its first term vanish at $\( d \, y \)$ because $Psi K = 0$; those of its middle term vanish by the proper calculation above. Its last term therefore has zero nearby cycles there, and proper compatibility for $i$ proves the claimed vanishing on ${ f = 0 }$. In the field case use the triangle on the whole $z$-family. Its first term has zero vanishing cycles because $K$ is pulled from the constant family $D$. The identical argument with $Phi$ proves $\( Phi_f K \)_d = 0$. Smooth base change removes the leg factor in both cases. The sheaf operations used throughout are those in Proposition 2. ◻
]

=== 4.2 Nilpotent singular support <nilpotent-singular-support>

#proof[
  Apply Lemma 8 on every smooth chart and every open subchart. It says that every function whose differential at a point is outside $Lambda_D$ is locally acyclic there relative to $b^(*) F$. The cone includes the zero section, so these are precisely the nonzero directions that must be excluded. Weak singular support is the closure of the differentials of functions with nonzero vanishing cycles; over an infinite field closed-point tests suffice by constructibility. Barrett proves this description for the present $E$-coefficients and proves that weak singular support equals full singular support #cite(label("Barrett")) §§1.4–1.5, Theorem (vii), extending Beilinson’s torsion-coefficient theorem #cite(label("Beilinson")) §1.5. The hypersurface calculation therefore gives $"SS" \( b^(*) F \) subset Lambda_D$. The same calculation on charts with additional smooth parameters is available, so the conclusion is compatible with the smooth-chart definition of singular support on the stack. ◻
]

=== 4.3 Simultaneous cuts and nonvanishing of specialization <simultaneous-cuts-and-nonvanishing-of-specialization>

To prove specialization detection, we must pass from hypersurfaces to enough simultaneous cuts to make the support finite over the trait. Successive hypersurface applications would require information about the singular support of intermediate restrictions. The following incidence argument makes all the cuts at once.

#thm([Lemma 4.4.])[
  (Simultaneous cuts).  #emph[In the trait case, assume $Psi F = 0$. Let $f_1 \, dots.h \, f_r$ vanish at $d in D_s$ and suppose their special-fiber differentials span an $r$-dimensional subspace $V subset T_d^(*) D_s$ with $V ∩ \( Lambda_D \)_d = { 0 }$. Then nearby cycles of $K \|_({ f_1 = dots.h.c = f_r = 0 }_(macron(eta)))$ vanish at $d$. The statement for $r = 0$ is $Psi K = 0$.]
] <lem:detection-cuts>

#proof[
  The case $r = 1$ is Lemma 8. For $r > 1$ consider the proper incidence projection
  $ pi : J = { \( t \, \[ a_1 : dots.h.c : a_r \] \) in D times bb(P)^(r - 1) : sum_i a_i f_i \( t \) = 0 } arrow.r D . $
  At $\( d \, \[ a \] \)$ the differential of the defining function on a standard projective chart is $sum_i a_i d f_i$; derivatives in the projective directions are zero since all $f_i \( d \)$ vanish. It is nonzero and lies outside the pulled-back nilpotent cone. The map $D times bb(A)^(r - 1) arrow.r cal(B)$ on each such chart is smooth, so Lemma 8 proves that the nearby cycles of $pi^(*) K$ vanish on the whole fiber $bb(P)^(r - 1)$ over $d$. Proper compatibility gives $\( Psi R pi_(*) pi^(*) K \)_d = 0$.
  Let $i : Z = { f_1 = dots.h.c = f_r = 0 } arrow.r.hook D$. On the geometric generic fiber hyperplane powers give the triangle
  $ xor.big_(a = 0)^(r - 2) E_D \( - a \) \[ - 2 a \] arrow.r R pi_(*) E_J arrow.r i_(*) E_Z \( - \( r - 1 \) \) \[ - 2 \( r - 1 \) \] arrow.r^(+ 1) . $
  Indeed, over $D \\ Z$ the incidence is a projective bundle of relative dimension $r - 2$, so the first arrow is an isomorphism there. Over $Z$ it is the product $Z times bb(P)^(r - 1)$, and the cone has only its constant top cohomology sheaf. Proper base change and localization identify the cone as written, not merely its stalk dimensions. Tensor by $K$. The first term has zero nearby cycles by $Psi K = 0$, and the middle term by the preceding proper calculation. Proper compatibility for $i$ proves the lemma. ◻
]

#proof[
  Suppose that the closure of the nonzero-stalk locus meets $D_s$. Shrink to an affine chart smooth of constant relative dimension $n$ over $S$. The closure of that locus in $D_(macron(eta))$ has finitely many irreducible components $Z_(macron(eta) \, alpha)$. Constructibility gives, on each component, a dense open subset where the stalk of $K$ is nonzero. After a finite extension of the trait, descend the components and the proper closed complements of these opens. We only descend these finite algebraic data, and continue to use $K$ over $macron(eta)$. Let $Z_alpha subset D$ and $E_alpha subset Z_alpha$ be their horizontal closures. Components not meeting $D_s$ may be removed.
  Write $j$ for the largest dimension of a generic component whose closure meets $D_s$, and choose an irreducible component $Z_0$ of the reduced special fiber of such a closure. A horizontal integral finite-type scheme over this excellent trait, with generic dimension $j$, has every nonempty special-fiber component of dimension $j$; its local dimension at a special-fiber closed point is $j + 1$. For these two assertions see, respectively, #cite(label("Stacks")) Tags 0B2J and 02JU. The same dimension calculation shows that the special fibers of the horizontal exceptional closures $E_alpha$ have dimension at most $j - 1$ whenever the corresponding generic component has dimension at most $j$.
  Choose a general closed point $d$ of $Z_0$. We may arrange that $Z_0$ is smooth at $d$, that $d$ is in none of the exceptional closures, and that every reduced special-fiber component of the support closure through $d$ equals $Z_0$ near $d$. Distinct horizontal components may have this same special component; this causes no difficulty. By Proposition 3,
  $ dim Lambda_D lt.eq n . $
  After shrinking a dense open in $Z_0$, the fiber dimension theorem therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ dim \( Lambda_D \)_d lt.eq n - j . $ <eq:detection-cone-fiber>]
  Choose a $j$-plane $V subset T_d^(*) D_s$ which avoids $\( Lambda_D \)_d \\ { 0 }$ and whose restriction to $T_d Z_0$ is an isomorphism onto $T_d^(*) Z_0$. Both are nonempty open conditions on the Grassmannian. When $j > 0$, for the first condition projectivize the cone in (4.10): it has dimension at most $n - j - 1$, and a general $bb(P)^(j - 1)$ in $bb(P)^(n - 1)$ is disjoint from it by the elementary incidence dimension count. The second is the usual complement-to-a-fixed-subspace condition. The base field is infinite, so the two opens meet. If $j = 0$, take $V = 0$ and use no cutting functions. Lift a basis of $V$ to differentials of regular functions $f_1 \, dots.h \, f_j$ vanishing at $d$. Their restrictions are parameters on the smooth scheme $Z_0$. Put $Y = { f_1 = dots.h.c = f_j = 0 } subset D$. Lemma 9 says
  #[#set math.equation(numbering: n => "(4.11)")
   $ \( Psi \( K \|_(Y_(macron(eta))) \) \)_d = 0 . $ <eq:detection-final-zero>]
  We finish by showing directly that this stalk is nonzero. Near $d$, the special fiber of the closed support closure intersected with $Y$ is zero-dimensional. On any of its selected horizontal components $Z_alpha$ of generic dimension $j$ through $d$, the local ring has dimension $j + 1$, so its quotient by the $j$ functions has dimension at least one #cite(label("Stacks")) Tag 0B52. Its further quotient by the uniformizer is zero-dimensional. Thus this intersection has a generization of $d$ in the generic fiber. Such a generization lies outside $E_alpha$, since $d$ was chosen outside its closure, and $K$ has a nonzero geometric stalk there.
  For completeness, the passage from this generization to nearby cycles is local and finite. Let $Z subset Y$ be the reduced intersection $Y ∩ union.big_alpha Z_alpha$. Its generic fiber contains the nonzero-stalk locus of $K \|_(Y_(macron(eta)))$, the preceding generization lies in $Z$, and $d$ is isolated in $Z_s$. The morphism $Z arrow.r S$ is quasi-finite at $d$. Take an affine neighborhood in $Y$ and use the henselian decomposition of its closed support: the local ring of $Z$ at $d$ is a finite local $R$-algebra and defines an open-and-closed piece $T subset Z$ #cite(label("Stacks")) Tag 04GH(3) and its proof. Its unique special-fiber point is $d$. Remove the closed complement $Z \\ T$ from the ambient neighborhood. On the resulting neighborhood, which has the same nearby-cycle stalk at $d$, the support closure is the finite $S$-scheme $T$.
  The generic restriction of $K$ is the extension by zero from this finite closed support. Proper base change now identifies its nearby-cycle stalk at $d$ with
  $ xor.big_(z in T_(macron(eta))) \( K \|_(Y_(macron(eta))) \)_z . $
  This is a finite direct sum of complexes of $E$-vector spaces, at least one of which is nonzero. Hence the sum is nonzero, contradicting (4.11). The argument includes $j = 0$, when there are no cutting functions and the original support already has the required finite local piece. This proves the theorem. ◻
]

== 5 Specialization of the coherent Hecke system <sec:specialization>

We now prove that geometric nearby cycles preserve the entire unramified Hecke system on the smooth leg locus. The proof must include collisions: commutation with a separate one-point transform would not supply the fusion identities required in Theorem 1. The essential local calculation is an exterior-product comparison on a space that may already carry other modifications and leg parameters. The corresponding unlevelled comparison and its fusion diagrams appear in #cite(label("GR")) Proposition 4.2.5 and §4.2.6. We give the local proof that also applies with the disjoint level data used here.

Throughout this section $S \, macron(eta) \, s$ have the meaning fixed in Section 2. Let $cal(B) \/ S$ be a smooth bundle stack and $U \/ S$ a smooth scheme of relative dimension one parametrizing allowed legs. We assume the usual spherical local description at those legs: after choosing a coordinate and a frame of the input bundle, a bounded one-step Hecke correspondence is a split Schubert model in the curve variable. Its maps to input-and-leg and to output-and-leg are representable and proper on bounds. Its open exact-position maps are smooth. These conditions hold for ordinary or enhanced level away from the marked point, and for the twisted-curve family used in Section 8. We verify the last assertion at the end of the section.

#thm([Proposition 5.1.])[
  #emph[For $F in D_(upright("lcc")) \( cal(B)_(macron(eta)) \, E \)$, any finite set $I$, and any representations $bold(V) = \( V_i \)_(i in I)$, there are natural isomorphisms 
#[#set math.equation(numbering: n => "(5.1)")
 $ c_(I \, bold(V)) \( F \) : sans(H)_(I \, bold(V))^s \( Psi_(cal(B)) F \) arrow.r^(med tilde.op med) Psi_(cal(B) times_S U^I) #scale(x: 120%, y: 120%)[\(] sans(H)_(I \, bold(V))^(macron(eta)) \( F \) #scale(x: 120%, y: 120%)[\)] . $ <eq:spec-hecke-comparison>]

 They are compatible with the tensor unit, successive Hecke modifications and their convolution maps, permutations, and ordinary pullback along every collision diagonal. The functors have the relative normalization of (2.7).]
  #emph[Suppose, moreover, that $F$ has a coherent eigenstructure with lisse tensor eigenvalue $V mapsto L_(macron(eta) \, V)$ on $U_(macron(eta))$. Suppose the lisse lattices specialize to a tensor system $V mapsto L_(s \, V)$ on $U_s$ as in Proposition 2. Then $Psi_(cal(B)) F$ has a coherent eigenstructure with this special-fiber eigenvalue: 
#[#set math.equation(numbering: n => "(5.2)")
 $ sans(H)_(I \, bold(V))^s \( Psi F \) tilde.eq \( Psi F \) times.square times.square_(i in I) L_(s \, V_i) . $ <eq:spec-eigenvalue>]

 This conclusion does not assert that $Psi F$ is nonzero; nonvanishing is supplied separately by Theorem 7.]
] <prop:hecke-specialization>

We first establish the exterior-product calculation with arbitrary input, and then apply it to fixed-point Satake kernels and their fusion products.

#thm([Lemma 5.2.])[
  (The frame comparison with arbitrary input).  #emph[Let $cal(H) arrow.r cal(B) times_S U$ be a bounded one-step Hecke correspondence, viewed by its input-and-leg map, and let $K_(macron(eta))$ be its relative Satake kernel. Let $b : B' arrow.r cal(B) times_S U$ be any finite-type map of models and set 
$ W = B' times_(cal(B) times_S U) cal(H) \, #h(2em) r : W arrow.r B' \, #h(2em) h : W arrow.r cal(H) . $

 For $D in D_c^b \( B'_(macron(eta)) \, E \)$, the natural composite 
#[#set math.equation(numbering: n => "(5.3)")
 $ Theta_b \( D \, K \) : quad r_s^(*) Psi_(B') D ⊗ h_s^(*) Psi_(cal(H)) K_(macron(eta)) & arrow.r^("Ex"_r^(*) ⊗ "Ex"_h^(*)) Psi_W \( r_(macron(eta))^(*) D \) ⊗ Psi_W \( h_(macron(eta))^(*) K_(macron(eta)) \)\
 & arrow.r^mu Psi_W \( r_(macron(eta))^(*) D ⊗ h_(macron(eta))^(*) K_(macron(eta)) \) $ <eq:spec-frame-map>]

 is an isomorphism. The analogous statement for twisted products is obtained by frame descent. No smoothness assumption on $B'$ or on $b$ is required.]
] <lem:spec-frame>

#proof[
  All assertions are local for smooth covers. Choose a smooth cover $C arrow.r cal(B) times_S U$ carrying a coordinate at the leg and an input frame to a sufficiently high jet order for the bound. Since $cal(B) times_S U$ is smooth over $S$, we may take $C$ smooth over $S$. In these coordinates
  $ cal(H)_C tilde.eq C times_S "Gr"_(lt.eq lambda \, S) \, #h(2em) W_C tilde.eq B'_C times_S "Gr"_(lt.eq lambda \, S) \, quad B'_C = B' times_(cal(B) times_S U) C \, $
  enlarging the bound if the kernel is a sum of simple Satake objects. The pullback of $K_(macron(eta))$ is the pullback of the Grassmannian Satake object $K_(macron(eta))^("Gr")$. As $C \/ S$ is smooth, smooth exchange identifies its nearby cycles with the pullback of $Psi_("Gr") K_(macron(eta))^("Gr")$. Smooth exchange also identifies the pullback of $Psi_(B') D$ to $B'_(C \, s)$ with the nearby cycles of the pullback $D_C$.
  Under these identifications, (5.3) is exactly
  $ Psi_(B'_C) D_C times.square Psi_("Gr") K_(macron(eta))^("Gr") arrow.r Psi_(B'_C times_S "Gr") \( D_C times.square K_(macron(eta))^("Gr") \) . $
  It is an isomorphism by the exterior-product theorem in Proposition 2, which permits a nonsmooth first factor. The calculation is compatible with changes of frame because every arrow is a natural exchange map. It therefore descends. Notice that the two individual pull-exchange arrows in (5.3) were not required to be isomorphisms; the assertion concerns their composite with tensor exchange. ◻
]

#thm([Lemma 5.3.])[
  #emph[Let $"Gr"_(lt.eq lambda \, S)$ be the split projective Schubert model for loops in the curve variable over $S$. Then 
#[#set math.equation(numbering: n => "(5.4)")
 $ Psi "IC"_(lambda \, macron(eta)) tilde.eq "IC"_(lambda \, s) . $ <eq:spec-simple-satake>]

 Specialization is a symmetric tensor equivalence of the two spherical Satake categories and intertwines their cohomological fiber functors. Under Satake equivalence, it is tensor isomorphic to the identity on $"Rep" \( hat(G) \)$. Fix such a tensor identification in the rest of the paper.]
] <lem:spec-satake>

#proof[
  Let $P = Psi "IC"_(lambda \, macron(eta))$. By Proposition 2, $P$ is perverse. It is equivariant under the positive-loop group: on a bound the action and its equivariance diagram are computed at a sufficiently large finite jet level, where the relevant projections are smooth, and their equivariance maps specialize by smooth pullback. The same observation applies to coordinate changes. The open Schubert orbit is smooth over $S$, so
  $ P \|_("Gr"_s^lambda) = E \[ d_lambda \] \( d_lambda \/ 2 \) . $
  Its support is contained in $"Gr"_(lt.eq lambda \, s)$.
  The characteristic-zero coefficient Satake category on either geometric fiber is semisimple and is identified with $"Rep" \( hat(G) \)$, with simples indexed by the same dominant coweights. This is geometric Satake over an arbitrary algebraically closed base field #cite(label("MV")) Theorem 14.1. Thus $"IC"_(lambda \, s)$ occurs in $P$ with multiplicity one. Any other constituent has smaller highest weight. Proper nearby-cycle compatibility gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ R Gamma \( "Gr"_(lt.eq lambda \, s) \, P \) tilde.eq R Gamma \( "Gr"_(lt.eq lambda \, macron(eta)) \, "IC"_(lambda \, macron(eta)) \) . $ <eq:spec-satake-cohomology>]
  The total dimension on the right is $dim V_lambda$, where $V_lambda$ is the irreducible $hat(G)$-representation with highest weight $lambda$. The constituent $"IC"_(lambda \, s)$ already has that total cohomological dimension. Every nonzero Satake constituent has nonzero cohomology, since total cohomology is its faithful exact fiber functor #cite(label("MV")) §6. There can be no additional constituent, proving (5.4) with the stated normalization.
  For convolution use the usual proper map from the twisted product of two Schubert models. Lemma 11, with the first modification as its input space, identifies nearby cycles of the twisted product of kernels with the twisted product of their nearby cycles. Proper exchange then gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ Psi K star.op Psi L arrow.r^(med tilde.op med) Psi \( K star.op L \) . $ <eq:spec-convolution-kernels>]
  Associativity and the unit constraint follow from the compatibility of the pull, tensor, and proper-push exchange maps. Apply the frame lemma also to the global successive-modification diagram over $U^2$ and then push by its proper convolution map. This first identifies the specialization of the entire fused kernel with the special-fiber fused kernel, including the diagonal. It then compares the fusion commutativity constraints: off the diagonal the map is exterior symmetry; on the local Grassmannian model, after adding the two leg shifts, the resulting special-fiber fusion kernels are the perverse middle extensions from that open locus. Any additional smooth chart factor carries its usual smooth-pullback shift. Their maps are therefore determined there. No commutation of nearby cycles with arbitrary middle extension is used. This is the construction of the symmetry in #cite(label("MV")) §5, especially (5.10)–(5.11), and the same argument with more legs supplies its coherence. The conventional parity adjustment in #cite(label("MV")) §6 is trivial here, since all Schubert dimensions are even.
  Consequently $Psi$ gives a symmetric tensor equivalence of the two Satake categories, preserving their simple labels and their cohomological fiber functors by (5.5). Under the fixed Satake equivalences, it is a symmetric tensor autoequivalence of $"Rep" \( hat(G) \)$ preserving every highest weight. Tannakian duality identifies it, up to tensor isomorphism, with an automorphism of $hat(G)$ up to inner automorphism. Preservation of every highest weight makes the induced automorphism of the based root datum trivial, so this automorphism is inner. Over the algebraically closed coefficient field this supplies a tensor isomorphism to the identity. We choose it once; all further comparisons use that choice rather than separate identifications for individual representations. This choice need not induce the previously specified cohomology comparison in a fixed trivialization of the fiber functor. The possible change is inner conjugacy, which does not change the isomorphism class of a $hat(G)$-local system. ◻
]

#proof[
  For one leg, first pull $F$ to $cal(B)_(macron(eta)) times U_(macron(eta))$. The projection to $cal(B)$ is smooth, so its pull exchange is an isomorphism. Apply Lemma 11 with $B' = cal(B) times_S U$, and identify the specialized kernel by Lemma 12. Proper push exchange along the output-and-leg map gives the comparison in the orientation
  $ sans(H)_V^s \( Psi F \) arrow.r o_(s \, *) Psi_(cal(H)) \( F thin tilde(times.square) thin K_(macron(eta) \, V) \) arrow.r^("Ex"_(o \, *)^(- 1)) Psi_(cal(B) times_S U) sans(H)_V^(macron(eta)) \( F \) . $
  Both arrows are isomorphisms. All constructions are made on a bound containing the kernel’s support and are unchanged upon increasing it.
  For several legs, choose an order $i_1 \, dots.h \, i_m$ of $I$ and form the stack of successive modifications. At step $r$ it remembers bundles $P_0 \, dots.h \, P_r$, the leg tuple, and the first $r$ modifications. The next correspondence is attached by the bundle $P_r$ and the next leg. The space $B'$ in Lemma 11 is now this space of preceding data. Its complex is the previous twisted product, and it can be singular. The lemma proves inductively that the product of the pulls of $Psi F$ and of the specialized step kernels maps isomorphically to nearby cycles of the successive twisted product. This remains true if some or all of the legs have been set equal: the lemma permits any map $B' arrow.r cal(B) times_S U$.
  Forget the intermediate bundles. This convolution map is proper on the chosen bounds. Proper exchange and the projection formula compare its pushforward with the transform defined by the fused kernel $"Sat"_I \( bold(V) \)$. This produces (5.1). Alternatively one can push each intermediate output before performing the next modification. The two comparisons agree: pull-and-tensor exchange is associative, proper-push exchange composes, and the proper base-change and projection-formula identities move an intermediate push through the next twisted product. Thus the result is compatible with the succession of Hecke functors, not merely with the final objects of the two constructions.
  We give the diagonal comparison explicitly. Fix $a : I arrow.r.twohead J$ and write $delta = 1 times delta_a$. For a sheaf $Q$ on $cal(B)_(macron(eta)) times U_(macron(eta))^I$, the natural diagonal exchange has the form
  #[#set math.equation(numbering: n => "(5.7)")
   $ delta_s^(*) Psi Q arrow.r Psi \( delta_(macron(eta))^(*) Q \) . $ <eq:spec-diagonal-exchange>]
  It need not be an isomorphism for arbitrary $Q$. We prove that it is an isomorphism for the complexes in the Hecke construction, and that it identifies their comparison maps.
  Before the first modification, $Q$ is the pullback of $F$ from $cal(B)$. Both projections $cal(B) times_S U^I arrow.r cal(B)$ and $cal(B) times_S U^J arrow.r cal(B)$ are smooth. Compatibility of pull exchange for their factorization through $delta$ identifies (5.7) with the isomorphism between the two smooth-pullback formulas. Suppose the assertion has been proved on the space of the first $r - 1$ modifications. Pull a coordinate-and-frame cover for the next step to the diagonal. The next twisted product on each side is, in these covers, the exterior product of the preceding complex with the fixed Grassmannian Satake kernel. The square relating the two maps (5.3) and diagonal exchange commutes by naturality. The map for the first factor is an isomorphism by the induction hypothesis, and both frame maps are isomorphisms by Lemma 11. The diagonal map for the new twisted product is therefore an isomorphism too. Proper base change and proper exchange preserve this conclusion when intermediate bundles are forgotten. Induction proves it for the full transform and proves that the comparison agrees with the convolution identification on the collision diagonal. Applied to the kernel construction itself, this also proves the assertion for the fused Satake kernel used in (2.7).
  For clarity, the square just established at the level of Hecke transforms is
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$delta_s^(*) sans(H)_(I \, bold(V))^s \( Psi F \)$])
  content((4.371, 0), [$delta_s^(*) Psi sans(H)_(I \, bold(V))^(macron(eta)) \( F \)$])
  content((0, -0.744), [$sans(H)_(J \, bold(W))^s \( Psi F \)$])
  content((4.371, -0.744), [$Psi sans(H)_(J \, bold(W))^(macron(eta)) \( F \) \,$])
  line((1.59, 0), (2.715, 0), mark: (end: ">"))
  content((2.153, 0.2266), [#text(size: 0.73em)[$delta_s^(*) c_(I \, bold(V))$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.5632, -0.372), [#text(size: 0.73em)[$upright("fusion")$]])
  content((-0.2741, -0.372), [#text(size: 0.73em)[$tilde.op$]])
  line((4.371, -0.2725), (4.371, -0.4715), mark: (end: ">"))
  content((5.561, -0.372), [#text(size: 0.73em)[$"Ex"_delta^(*) thin \, med Psi \( upright("fusion") \)$]])
  line((1.194, -0.744), (3.177, -0.744), mark: (end: ">"))
  content((2.186, -0.5173), [#text(size: 0.73em)[$c_(J \, bold(W))$]])
})
  where $W_j = ⨂_(i in a^(- 1) \( j \)) V_i$. The right vertical arrow is an isomorphism by the preceding induction. For two successive surjections, the square for their composite is the composite of the two squares, because pull exchange composes. This checks nested collisions as well as a single diagonal.
  It remains to identify permutations and the unit. Over the locus of pairwise distinct legs, the comparison is an exterior-product comparison, and hence respects every permutation. The permutation maps on the relative fused Satake kernels are determined from this locus by middle extension on the Grassmannian models after the leg shift. The kernel comparison therefore respects them everywhere, as in Lemma 12. Applying the same twisted product with $F$ and the same proper push carries this equality of kernel maps to the Hecke transform; no assertion that the transform of $F$ itself is a middle extension is needed. This gives independence of the order chosen for successive modifications and all symmetric-group relations. For the trivial representation the kernel is supported on the identity modification, so the comparison is simply smooth exchange for $cal(B) times_S U^I arrow.r cal(B)$. Its unit constraint is the unit constraint of the exchange maps. Naturality in every representation has held throughout, because every construction was performed on the Satake category and on maps of kernels.
  Finally apply $Psi$ to the given eigenisomorphism and compose with (5.1). Smooth pullback in the leg variables and (2.5) identify its target with the right-hand side of (5.2). On a collision diagonal, the same lisse tensor formula identifies the product of eigenvalue factors with $L_(s \, ⊗ V_i)$. Hence diagonal exchange is an isomorphism on the eigenvalue side as well. Apply these comparisons to each original coherence diagram. The comparisons commute with its arrows by the preceding construction, so its specialized diagram also commutes. This proves unit, tensor, permutation, and fusion coherence of (5.2). ◻
]

=== 5.1 Why disjoint level data do not alter the comparison <why-disjoint-level-data-do-not-alter-the-comparison>

We spell out the locality assertion used in the proposition. A modification at a leg $u in U$ is obtained by gluing a bundle on the complement of its graph to a bundle on the formal disc at $u$, with an identification on the punctured disc. The level structure at a disjoint marked point belongs entirely to the first piece and is transported by that identification. A frame on the formal disc therefore gives the same Schubert model with ordinary, enhanced, or no level structure. The frame and coordinate choices needed on a fixed bound reduce to finite jet torsors, which are smooth. From the output side, inversion of the modification gives an opposite Schubert bound; hence the output-and-leg map is proper as well. These are the usual Beauville–Laszlo descriptions of the Hecke correspondence.

For a twisted nodal curve, choose the leg in its smooth scheme locus. The same gluing takes place on an ordinary formal disc and leaves the stacky node in the complementary piece. In particular it preserves the isomorphism class of the stabilizer representation at the node. Restricting the bundle stack by deleting unwanted closed-fiber types therefore restricts the Hecke correspondence by the same condition on either side; its bounded maps remain proper by base change. Coordinates, frames, and the open exact-position smoothness are unchanged at the leg. After the nodal identification (2.2), the action on either punctured component is the action on that enhanced-flag factor, followed by the simultaneous torus quotient. This establishes precisely the local hypotheses of Proposition 10 in both specializations used below.

== 6 Perverse cohomology of a dense eigencomplex <sec:perverse>

In this section the curve is defined over $bb(C)$. We prove that perverse cohomology preserves the entire Hecke eigenstructure for a Zariski-dense parameter. The main point is to obtain exactness near the given parameter from a frame on its free closed orbit. The spectral action and local constancy needed to use this frame are the Betti results of Nadler–Yun.

Put $N_B = R_u \( B \)$ and $T = B \/ N_B$. Write

$ cal(A) = "Bun"_(G \, B \, x) \( X \) \, #h(2em) cal(A)^(+) = "Bun"_(G \, N_B \, x) \( X \) . $

Thus $cal(A)^(+)$ remembers an enhancement of the flag, namely an $N_B$-reduction. Let $cal(B)$ denote either $cal(A)$ or $cal(A)^(+)$, and let $Lambda subset T^(*) cal(B)$ be its cone of generically nilpotent Higgs fields, with the residue condition imposed by the chosen level. All Hecke functors below act away from $x$ and use the relative normalization of the introduction.

#thm([Proposition 6.1.])[
  #emph[Let $X \/ bb(C)$ be a smooth projective connected curve, let $x in X$, and put $U = X \\ { x }$. Let $G$ be simple and simply connected, and let $cal(B)$ be either of the two level stacks just defined. Suppose that a locally bounded constructible geometric $E$-adic complex $cal(F)$ on $cal(B)$ has a coherent Hecke eigenstructure for a Zariski-dense parameter $sigma$ on $U$. For every $j in bb(Z)$, the perverse cohomology $zws^p H^j \( cal(F) \)$ has an induced coherent eigenstructure with the same parameter and has singular support in $Lambda$. This structure is natural in representations and compatible with the unit, convolution, permutations, and all collision diagonals in every $U^I$. If $cal(F) eq.not 0$, at least one of these perverse eigensheaves is nonzero. No common bound on the cohomological degrees of $cal(F)$ over $cal(B)$ is required.]
] <prop:perverse-eigen>

=== 6.1 Betti transport and the spectral action <betti-transport-and-the-spectral-action>

We first record precisely which Betti statements enter the proof. For a formal coordinate $t$ at $x$, the ordinary and enhanced levels correspond respectively to

$ upright("Iw") = { g in G \( bb(C) \[ \[ t \] \] \) : g \( 0 \) in B } \, #h(2em) upright("Iw")^0 = { g in G \( bb(C) \[ \[ t \] \] \) : g \( 0 \) in N_B } . $

Both contain the first congruence subgroup and are contained in the positive-loop maximal parahoric, so they satisfy the level hypotheses of #cite(label("NY")) §6.2. The nilpotent cone in that section is defined by generic nilpotence of the Higgs field in the cotangent stack with level; it is therefore our $Lambda$.

Let $cal(D)_Lambda \( cal(B) \)$ be the Betti category of complexes with singular support in $Lambda$. Nadler–Yun’s #cite(label("NY")) Theorem 6.2.2 gives, for every finite set $I$ and collection $bold(V) = \( V_i \)_(i in I)$,

#[#set math.equation(numbering: n => "(6.1)")
 $ "SS" #scale(x: 120%, y: 120%)[\(] sans(H)_(I \, bold(V)) \( K \) #scale(x: 120%, y: 120%)[\)] subset Lambda times 0_(U^I) \, #h(2em) K in cal(D)_Lambda \( cal(B) \) . $ <eq:perverse-NY-support>]

This assertion holds on the full product $U^I$, including its diagonals. Their product-stratification argument #cite(label("NY")) Proposition 6.3.2 consequently gives locally constant transport in the leg variables, compatibly with the multi-point tensor operations. Explicitly, on a smooth finite-type chart $D$ of $cal(B)$ one chooses a stratification whose conormals contain the pulled-back nilpotent cone. On the product with a sufficiently small contractible open set $P subset \( U^(upright("an")) \)^I$, the output is weakly constructible for the product stratification and is the pullback of its restriction to any slice $D times { bold(u) }$. The same statement applies when $P$ meets collision diagonals.

Choose $u in U^(upright("an"))$ and free generators $gamma_1 \, dots.h \, gamma_a$ of $pi_1 \( U^(upright("an")) \, u \)$; here $a = 2 g \( X \)$ because there is one puncture. Set

#[#set math.equation(numbering: n => "(6.2)")
 $ Y = hat(G)^a \, #h(2em) cal(L) = \[ Y \/ hat(G) \] \, $ <eq:perverse-spectral-stack>]

where $hat(G)$ acts by simultaneous conjugation. Since the punctured surface has the homotopy type of a graph, $cal(L)$ is its Betti stack of $hat(G)$-local systems. By #cite(label("NY")) Theorem 6.3.7, the symmetric monoidal category $"Perf" \( cal(L) \)$ acts on $cal(D)_Lambda \( cal(B) \)$. For $V in "Rep" \( hat(G) \)$, the equivariant vector bundle

$ cal(E)_V = Y times V $

acts by the fixed-point Hecke functor $sans(H)_(V \, u)$. Its tautological automorphisms at the chosen generators act by Hecke transport along $gamma_i$. We identify Satake and its eigenvalues with these conventions, as in Section 2. These theorems allow all complexes in the indicated nilpotent category: the absence of global boundedness restrictions is explicit in #cite(label("NY")) §5.1 and §6.2. In particular their application here does not require support in a finite-type substack. Our finite-dimensional Satake kernels also preserve local bounded constructibility: on a finite-type output chart, each bounded Hecke correspondence is proper of finite type and meets only a quasi-compact part of the input stack.

A trivialization of a parameter $sigma$ at $u$ represents its topological monodromy by a homomorphism $rho : pi_1 \( U^(upright("an")) \, u \) arrow.r hat(G) \( E \)$. Its values on the chosen generators give the corresponding point $y in Y \( E \)$.

#thm([Lemma 6.2.])[
  #emph[Let $K in cal(D)_Lambda \( cal(B) \)$ be a coherent Betti Hecke eigencomplex with parameter $sigma$, represented by $y = \( rho \( gamma_1 \) \, dots.h \, rho \( gamma_a \) \) in Y \( E \)$. The degree-zero central endomorphism associated to $f in E \[ Y \]^(hat(G)) = "End"_("Perf" \( cal(L) \))^0 \( cal(O) \)$ acts on $K$ as $f \( y \) "id"_K$.]
] <lem:perverse-scalar-center>

#proof[
  The identification of spectral functions with excursion operators is #cite(label("NY")) §7.1 and Proposition 7.2.3. In the present free-group case its evaluation rule can be seen directly. Matrix coefficients span the coordinate ring of $Y$. Exactness of invariants for the reductive group $hat(G)$ shows that an invariant function is a finite sum of functions of the form
  #[#set math.equation(numbering: n => "(6.3)")
   $ \( g_1 \, dots.h \, g_a \) mapsto "Tr"_W (A compose ⨂_(i = 1)^a V_i \( g_i \)) \, #h(2em) W = ⨂_(i = 1)^a V_i \, quad A in "End"_(hat(G)) \( W \) . $ <eq:perverse-excursion-trace>]
  Indeed $E \[ Y \] = ⨂_i E \[ hat(G) \]$ is spanned by products of matrix coefficients. Each such product lies in the image of the equivariant map $"End"_E \( W \) arrow.r E \[ Y \]$ given by the trace in (6.3). A given invariant function belongs to the image of finitely many of these maps. The direct sum of their source spaces surjects onto a finite-dimensional $hat(G)$-stable image containing that function. Exactness of invariants lifts it to a tuple of invariant endomorphisms, since $\( xor.big_nu "End"_E \( W_nu \) \)^(hat(G)) = xor.big_nu "End"_(hat(G)) \( W_nu \)$. This proves the asserted finite-sum expression.
  The corresponding excursion inserts the invariant coevaluation tensor for $W ⊗ W^(*)$, transports the $V_i$ factors around $gamma_i$, applies $A$, and evaluates. The $W^(*)$ factor may be retained at the base point as an additional identity leg. Naturality, convolution, and the unit constraints of the eigenstructure identify these maps with the same operations on the tensor local system of $sigma$. Their composite on the multiplicity space is precisely (6.3) evaluated at $y$. Summing proves the assertion. This uses the maps in the coherent eigenstructure, not just the isomorphism classes of its fixed-point transforms. ◻
]

=== 6.2 A frame near the dense parameter <a-frame-near-the-dense-parameter>

The next lemma gives an invariant function nonzero at $y$ whose inversion trivializes $cal(E)_V$. Through the spectral action, this will identify $sans(H)_(V \, u)$ with $dim V$ copies of the identity on a subcategory preserved by perverse truncation. We only need the frames to prove this exactness; they need not be compatible with tensor products. The induced eigenmaps will instead come from truncating the original coherent maps.

#thm([Lemma 6.3.])[
  #emph[Suppose that $y in Y \( E \)$ generates a Zariski-dense subgroup of $hat(G)$. For every nonzero $V in "Rep" \( hat(G) \)$ of dimension $b$ there are $f_V in E \[ Y \]^(hat(G))$ with $f_V \( y \) eq.not 0$ and equivariant maps 
$ alpha_V : cal(O)_Y^(xor b) arrow.r cal(E)_V \, #h(2em) beta_V : cal(E)_V arrow.r cal(O)_Y^(xor b) $

 such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ beta_V alpha_V = f_V "id"_(cal(O)_Y^(xor b)) \, #h(2em) alpha_V beta_V = f_V "id"_(cal(E)_V) . $ <eq:perverse-adjugate>]

]
] <lem:perverse-frame>

#proof[
  The group $hat(G)$ is adjoint because $G$ is simply connected. The stabilizer of $y$ centralizes a dense subgroup and hence equals $Z \( hat(G) \) = 1$. Its orbit $O$ is closed. To recall the closed-orbit criterion in this case, a one-parameter subgroup producing a limit under simultaneous conjugation forces every entry of the tuple to belong to its associated parabolic. Density forces that parabolic to be $hat(G)$, so the one-parameter subgroup is central. The Hilbert–Mumford criterion therefore gives closedness. Thus $O tilde.eq hat(G)$ and the equivariant bundle $cal(E)_V \|_O$ has equivariant sections $s_1 \, dots.h \, s_b$ specified by any basis $v_1 \, dots.h \, v_b$ of $V$ at $y$: at $g dot.op y$ their values are $g v_1 \, dots.h \, g v_b$.
  Because $O$ is closed in the affine variety $Y$, restriction gives a surjection $E \[ Y \] ⊗ V arrow.r E \[ O \] ⊗ V$. Taking invariants remains exact in characteristic zero. The $s_i$ therefore extend to equivariant regular sections of $cal(E)_V$ on $Y$. Let $alpha_V$ have these sections as its columns. Every algebraic character of the semisimple group $hat(G)$ is trivial, so $det \( V \)$ is trivial. After fixing a volume form, the determinant $f_V = det \( alpha_V \)$ is an invariant function, nonzero at $y$. The adjugate matrix defines $beta_V$ regularly on all of $Y$. It is equivariant, either by the exterior-power construction of the adjugate or by the identity $beta_V = f_V alpha_V^(- 1)$ on the open set where $f_V eq.not 0$. The adjugate identities give (6.4). ◻
]

We now use these algebraic maps to obtain exactness on a subcategory containing the eigencomplex and all of its truncations. Write $cal(D)_Lambda^(upright("lcc")) \( cal(B) \)$ for the locally bounded constructible objects of the Betti nilpotent category. Perverse truncation preserves this category: locally on a smooth chart, singular support is unchanged upon replacing a complex by the union of the singular supports of its perverse cohomologies. This is the usual microlocal dévissage, or equivalently the exactness of the perverse vanishing-cycle tests.

#thm([Lemma 6.4.])[
  #emph[Choose a frame as in Lemma 15 for each isomorphism class of nonzero representations, and let $S$ be the multiplicative set generated by the $f_V$. The full subcategory 
$ cal(D)_S = { K in cal(D)_Lambda^(upright("lcc")) \( cal(B) \) : f_K : K arrow.r K upright(" is invertible for all ") f in S } $

 is preserved by perverse truncations and by all fixed-point Hecke functors. Every fixed-point Hecke functor is perverse $t$-exact on $cal(D)_S$.]
] <lem:perverse-localized-exactness>

#proof[
  For any central degree-zero natural endomorphism $f$ of the identity, naturality for $zws^p tau_(lt.eq n) K arrow.r K$, together with the universal property of truncation, gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ f_(zws^p tau_(lt.eq n) K) = zws^p tau_(lt.eq n) \( f_K \) . $ <eq:perverse-center-truncation>]
  For example the map on the left is the unique endomorphism of $zws^p tau_(lt.eq n) K$ whose composite with its map to $K$ is $f_K$ composed with that map. The same argument for the other truncation gives $f_(zws^p tau_(gt.eq n) K) = zws^p tau_(gt.eq n) \( f_K \)$. Consequently invertibility of $f_K$ implies invertibility on both truncations. This establishes the asserted restricted $t$-structure without any exactness assertion for arbitrary spectral operators.
  Apply the spectral action to the two maps of Lemma 15. They give natural maps
  $ K^(xor b) arrow.r^(alpha_(V \, K)) sans(H)_(V \, u) \( K \) arrow.r^(beta_(V \, K)) K^(xor b) . $
  The composites are the indicated actions of $f_V$. Symmetric monoidality identifies the action of any $f in S$ on $sans(H)_(V \, u) \( K \)$ with $sans(H)_(V \, u) \( f_K \)$. Thus $sans(H)_(V \, u)$ preserves $cal(D)_S$, and $f_V^(- 1) beta_(V \, K)$ is an inverse to $alpha_(V \, K)$ there. In particular
  #[#set math.equation(numbering: n => "(6.6)")
   $ sans(H)_(V \, u) \|_(cal(D)_S) tilde.eq "id"_(cal(D)_S)^(xor b) . $ <eq:perverse-fixed-frame>]
  This proves $t$-exactness at $u$. Locally constant Hecke transport along a path from $u$ to any other point gives the same conclusion there. The zero representation acts by zero. Compositions of fixed-point Hecke functors, including convolutions at one point, are consequently $t$-exact and preserve $cal(D)_S$. ◻
]

=== 6.3 Truncation of the moving Hecke system <truncation-of-the-moving-hecke-system>

Fixed-point exactness now supplies the perverse bounds. Locally constant transport will extend them over every leg space, including its collision diagonals. We then use the resulting truncation comparisons to transport the original eigenmaps and their coherence constraints.

#proof[
  Pass temporarily to Betti realization, with coefficients in $E$. Theorem 6 puts $cal(F)$ in the nilpotent category. Its parameter remains Zariski dense after restriction from the profinite fundamental group to topological loops. Indeed the latter have dense image in the former; any polynomial equation on the matrices is closed for the adic topology after passing to a finite coefficient extension containing its coefficients. An equation vanishing on topological monodromy therefore vanishes on the entire adic image.
  Use this tuple $y$ in Lemma 15. Lemma 14 gives $f_(V \, cal(F)) = f_V \( y \) "id"_(cal(F))$, so $cal(F) in cal(D)_S$. All its perverse truncations and cohomologies belong to this same subcategory by Lemma 16. We next extend fixed-point exactness to the moving system and explain its compatibility with collisions.
  For $K in cal(D)_S$ and a finite set $I$, put $m = \| I \|$ and consider
  $ upright(T)_(I \, bold(V)) \( K \) = sans(H)_(I \, bold(V)) \( K \) \[ m \] . $
  On a contractible parameter patch as in (6.1), its unshifted value is the exterior product of a fixed-point transform and the constant sheaf of the patch. That transform is a succession of fixed-point Hecke operators; at a collision it is their convolution. By Lemma 16 it has the same perverse bounds as $K$. The constant sheaf shifted by $m$ is perverse on the smooth complex $m$-fold parameter space. Testing on smooth charts therefore proves that $upright(T)_(I \, bold(V))$ is $t$-exact on $cal(D)_S$. In particular, the images of a truncation triangle for $K$ are the truncation triangle for $upright(T)_(I \, bold(V)) \( K \)$. Its universal property supplies natural comparison isomorphisms
  #[#set math.equation(numbering: n => "(6.7)")
   $ zws^p H^j #scale(x: 120%, y: 120%)[\(] sans(H)_(I \, bold(V)) \( K \) \[ m \] #scale(x: 120%, y: 120%)[\)] tilde.eq sans(H)_(I \, bold(V)) \( zws^p H^j K \) \[ m \] . $ <eq:perverse-moving-truncation>]
  These comparisons also hold for successive Hecke operations when the input already carries other leg variables. Locally in all the parameter variables it is a constant family, so the same fixed-point exactness argument applies, with the shift equal to the total dimension of the retained smooth parameter space. This proves the comparison for convolution diagrams as well as for individual functors.
  More explicitly, for a surjection $pi : I arrow.r.twohead J$ let $Delta_pi : U^J arrow.r U^I$ be the collision diagonal and put $W_j = ⨂_(i in pi^(- 1) \( j \)) V_i$. Fusion gives the ordinary pullback identification
  #[#set math.equation(numbering: n => "(6.8)")
   $ \( "id" times Delta_pi \)^(*) sans(H)_(I \, bold(V)) \( K \) tilde.eq sans(H)_(J \, bold(W)) \( K \) . $ <eq:perverse-diagonal-normalization>]
  On the locally constant families under consideration, the functor
  $ \( "id" times Delta_pi \)^(*) \[ thin \| J \| - \| I \| thin \] $
  is perverse $t$-exact: in product charts it replaces the perverse constant sheaf on an $\| I \|$-dimensional smooth base by the perverse constant sheaf on an $\| J \|$-dimensional smooth base. Applied to (6.8), this proves compatibility of (6.7) with diagonal restriction. The full-product assertion in (6.1) is essential here; constancy only at pairwise distinct legs would not provide this comparison.
  Now let $cal(V)_(I \, sigma) = times.square_(i in I) \( V_i \)_sigma$. Shift the original eigenisomorphism by $m$ and apply $zws^p H^j$. Exterior product with the lisse sheaf $cal(V)_(I \, sigma) \[ m \]$ is $t$-exact, so (6.7) gives
  $ sans(H)_(I \, bold(V)) \( zws^p H^j cal(F) \) \[ m \] tilde.eq \( zws^p H^j cal(F) times.square cal(V)_(I \, sigma) \) \[ m \] . $
  Canceling the common shift yields precisely the relative-normalized eigenisomorphism
  #[#set math.equation(numbering: n => "(6.9)")
   $ sans(H)_(I \, bold(V)) \( zws^p H^j cal(F) \) tilde.eq zws^p H^j cal(F) times.square cal(V)_(I \, sigma) . $ <eq:perverse-induced-eigen>]
  There is no moving-leg shift in this formula.
  To verify coherence, apply these functorial truncation comparisons to each diagram for the original eigenstructure. Naturality in representations, the unit, and permutations commute with the comparisons by their construction from truncation. The relative exactness for successive operations gives convolution compatibility; the dimension-adjusted diagonal comparison gives every fusion compatibility, including iterated collisions. On a diagram over $U^I$, shift each entire vertex by $\| I \|$ once: successive modifications at a shared leg do not introduce further leg parameters. Every vertex is locally the exterior product of a composite of fixed-point exact functors applied to $zws^p H^j cal(F)$ with a lisse multiplicity space. Thus all these shifted vertices lie in the perverse heart. After a collision to $U^J$, the shift $\| J \| - \| I \|$ puts all vertices in the corresponding target heart. For two objects $P \, Q$ of any of these hearts, $pi_r "Map" \( P \, Q \) = "Hom" \( P \, Q \[ - r \] \) = 0$ for $r > 0$. Their mapping spaces are therefore discrete; positive Ext groups do not affect this assertion. The resulting commutative diagrams consequently determine the required coherent constraints. In particular choices of the auxiliary spectral frames introduce no choices into (6.9).
  Finally these constructions give eigenmaps in geometric adic sheaves, not only after realization. Start with the adic truncation triangles and apply the adic Hecke functors. Betti realization, which preserves perversity and detects isomorphisms on finite-type charts, verifies the perverse bounds just proved. The universal property of truncation then gives (6.7) in the adic category itself. The same reasoning applies to successive operations and diagonal pullbacks. Applying it to the original adic eigenmaps therefore constructs (6.9) and all its compatibilities there. Singular support remains in $Lambda$ by the perverse dévissage already used, or by Theorem 6 applied to these eigenmaps.
  Every assertion has been checked on finite-type smooth charts and is compatible with further smooth pullback. Thus no uniform cohomological bound on the bundle stack has entered the proof. If $cal(F)$ is nonzero, its restriction to some such chart is nonzero and bounded. Some perverse cohomology on that chart is nonzero, and smooth perverse pullback identifies it with a restriction of $zws^p H^j cal(F)$. This proves the final assertion. ◻
]

== 7 Removing the enhancement of a flag <sec:descent>

We continue over $bb(C)$. Write $N_B = R_u \( B \)$, $T = B \/ N_B$, and

$ q : cal(A)^(+) = "Bun"_(G \, N_B \, x) \( X \) arrow.r cal(A) = "Bun"_(G \, B \, x) \( X \) . $

This is a $T$-torsor: an enhancement of a fixed Borel reduction is a trivialization of its induced $T$-torsor. Set $r = dim T$. Our objective is to show that a nonzero eigencomplex on $cal(A)^(+)$ produces one on $cal(A)$. The direct image $q_(!)$ need not preserve nonvanishing for arbitrary monodromy along its fibers. We will prove that the unipotent boundary monodromy of the eigenvalue forces unipotent monodromy along those fibers, which is sufficient.

The central sheaves of Gaitsgory and their universal monodromic version of Dhillon–Taylor provide the local identity that relates these two monodromies. The main point of this section is to globalize that identity with its tensor and individual-factor monodromy maps. All universal local systems used in this argument are Betti sheaves. The final direct image and perverse truncation are performed on the original geometric adic objects.

=== 7.1 Monodromy along a torsor and the universal unit <monodromy-along-a-torsor-and-the-universal-unit>

We call a complex on a $T$-torsor #emph[monodromic along the torsor] if, locally on its base, it is constructible for a product stratification ${ S_alpha times T }$ and its restriction to a contractible patch in the $T$-factor is pulled back from a slice. This permits arbitrary monodromy in $pi_1 \( T \) = X_(*) \( T \)$; it does not require an equivariant structure. The condition is preserved by base change on the base.

#thm([Lemma 7.1.])[
  #emph[Let $Q$ be a locally bounded constructible complex on $cal(A)^(+)$ with singular support in the generic nilpotent cone. Its Betti realization is monodromic along $q$.]
] <lem:descent-monodromic>

#proof[
  The cotangent description in Section 3 identifies the nilpotent cone on $cal(A)^(+)$ with the smooth pullback of the cone on $cal(A)$: a nilpotent residue lying in a Borel Lie algebra has zero toral component. In particular every covector in this cone annihilates the tangent to a $T$-fiber.
  Take a smooth finite-type chart $D arrow.r cal(A)$ and trivialize the pulled-back torsor, after further localization on $D$. The singular support on $D times T$ lies in $C_D times 0_T$, where $C_D subset T^(*) D$ is the ordinary-level cone of Proposition 3. Choose a microlocal stratification of $D$ whose conormals contain $C_D$. The singular-support criterion for constructibility then applies to the product stratification ${ S_alpha times T }$; this is precisely the criterion used in the proof of #cite(label("NY")) Proposition 6.3.2. On a contractible patch of $T$, restriction to a slice is an equivalence for sheaves constructible with respect to this product stratification. Consequently the complex, including its extension data between strata, is pulled back from the slice there. The descriptions agree on overlaps by locally constant continuation. They establish the asserted condition on the torsor and after every further base change. In particular $X_(*) \( T \)$ acts by continuation on the stalk cohomology of the restriction to each fiber. ◻
]

Fix orientations of the compact real torus in $T \( bb(C) \)$ and the corresponding positive cocharacter loops. Put

$ Gamma = X_(*) \( T \) \, #h(2em) R_T = E \[ Gamma \] = cal(O) \( hat(T) \) . $

Let $cal(L)_T$ be the local system on $T$ with fiber $R_T$ and regular monodromy. Thus its pullback to the universal cover of the compact torus is constant, with fiber the finitely supported functions on the deck group. It is a weakly constructible Betti sheaf, with infinite-dimensional stalks. We use ordinary direct image in the convolution of such kernels, and its unit is

#[#set math.equation(numbering: n => "(7.1)")
 $ upright(bold(1))_T = cal(L)_T \[ r \] . $ <eq:descent-unit>]

For a fixed output enhancement $e$, write a varying input enhancement as $e d^(- 1)$. The coordinate $d$ is the enhancement difference in our convolution convention. With this choice the endomorphisms $R_T$ of the unit act by the monodromy of the input, without inversion.

#thm([Lemma 7.2.])[
  #emph[Convolution with (7.1) acts as the identity on complexes monodromic along a $T$-torsor. This identification is natural under base change, compatible with successive convolutions, and identifies the $R_T$-action with enhancement monodromy.]
] <lem:descent-unit>

#proof[
  First take a local system with fiber $W$, and write $M_1 \, dots.h \, M_r$ for its commuting monodromy operators in a basis of $Gamma$. For fixed output, the integrand has monodromies $z_i ⊗ M_i^(- 1)$ on $R_T ⊗_E W$. Ordinary cohomology of $T$ is computed by the cohomological Koszul complex
  $ K^bullet #scale(x: 120%, y: 120%)[\(] z_1 M_1^(- 1) - 1 \, dots.h \, z_r M_r^(- 1) - 1 \; R_T ⊗_E W #scale(x: 120%, y: 120%)[\)] . $
  Untwisting the diagonal $Gamma$-action identifies this with the Koszul complex for $z_1 - 1 \, dots.h \, z_r - 1$ on the free module with underlying fiber $W$. Its only cohomology is $W$ in degree $r$. The shift in (7.1) therefore makes the integral $W$ in degree zero, and the residual $z_i$ acts by $M_i$.
  There is a useful geometric description of this identification. Remove the contractible real radial directions of $T$. The free local system is the direct image with finite supports from the universal cover $bb(R)^r$ of the compact torus. Integration over that compact torus becomes compactly supported integration over $bb(R)^r$. On the cover the other factor is pulled back from its fiber by continuation from the zero lift. The orientation identifies $R Gamma_c \( bb(R)^r \, E \) \[ r \]$ with $E$. This construction also works for complexes and relatively over a stratified base, so it proves naturality and base change.
  For two enhancement differences $d_1 \, d_2$, convolution replaces them by their product $d_2 d_1$. On their real covers this is addition of lifted angles. The change from the two lifted differences to the first lifted difference and the lifted total difference preserves product orientation. Integrating in this order agrees with the two successive integrations; the continuation of the input follows the sum of the same two paths. This proves compatibility with the unit convolution isomorphism, including its shifts and $R_T$-action. ◻
]

=== 7.2 The local central-sheaf identity <the-local-central-sheaf-identity>

Let $L G$ denote loops in a formal curve coordinate, and let $upright("Iw")$ and $upright("Iw")^0$ be the inverse images of $B$ and $N_B$ under evaluation $L^(+) G arrow.r G$. We use the Betti universal monodromic Hecke category on $L G \/ upright("Iw")^0$, with the pro-unipotent equivariance convention of #cite(label("DT")). Its unit is (7.1) on the identity stratum $T$. The local result we need is the monoidal central-sheaf construction

$ Z : "Rep" \( hat(G) \) arrow.r cal(H)^(upright("mon")) \, #h(2em) V mapsto Z \( V \) \, $

together with its tensor automorphism $m_V$ given by nearby-cycle monodromy. These are constructed in #cite(label("DT")) Section 6, especially Proposition 6.3.1, using the degeneration introduced in #cite(label("GaitsgoryCentral")).

We record explicitly the consequence of the local monodromy formula that will be globalized. If $chi_V$ is the character of $V$ restricted to $hat(T)$, then

#[#set math.equation(numbering: n => "(7.2)")
 $ (upright(bold(1))_T arrow.r^(upright("coev")) Z \( V \) star.op Z \( V^(*) \) arrow.r^(m_V star.op upright("id")) Z \( V \) star.op Z \( V^(*) \) arrow.r^(upright("ev")) upright(bold(1))_T) = chi_V quad upright("in ") "End" \( upright(bold(1))_T \) = R_T . $ <eq:descent-local-trace>]

Here evaluation in the indicated order is the image of evaluation in the symmetric representation category. To deduce the equation from #cite(label("DT")) Proposition 9.3.1(a)–(c), apply the faithful monoidal Wakimoto associated-graded functor of #cite(label("DT")) Proposition 5.3.1. On the weight summand indexed by $nu in X^(*) \( hat(T) \) = Gamma$, the monodromy is multiplication by the torus function $e^nu$. The trace on the associated graded is therefore $sum_nu \( dim V_nu \) e^nu = chi_V$. The associated-graded functor is faithful on endomorphisms of the unit: on its sole identity stratum it is the regular $R_T$-module and retains the multiplication endomorphism. Thus equality of these graded endomorphisms proves (7.2). Opposite conventions invert both the torus and the boundary loop; we keep the convention fixed above.

=== 7.3 Specialization through a torus torsor <specialization-through-a-torus-torsor>

To use the local trace formula globally, we must commute nearby cycles with a direct image whose nonproper fibers are enhancement tori. The following observation is the required substitute for properness.

#thm([Lemma 7.3.])[
  #emph[Let $Delta$ be an analytic disc, let $Y arrow.r Delta$ be a stratified analytic space, and factor a morphism over $Delta$ as 
$ P arrow.r^pi C arrow.r^b Y \, $

 where $pi$ is a $T$-torsor on the entire family and $b$ is proper. Work locally on finite-dimensional, paracompact charts. Let $F$ on $P \|_(Delta^(*))$ be weakly constructible and, in torsor charts, constructible for product stratifications with the $T$-factor. Then the exchange map 
#[#set math.equation(numbering: n => "(7.3)")
 $ Psi \( b pi \)_(*) F arrow.r \( b_0 pi_0 \)_(*) Psi F $ <eq:descent-push-exchange>]

 is an isomorphism. The same reduction gives the base-change and projection-formula isomorphisms for these direct images when the additional factors are pulled back from their targets. These identifications respect composition.]
] <lem:descent-radial>

#proof[
  Let $T_c$ be the compact real form of $T$, and let $A tilde.eq bb(R)^r$ be its positive real radial subgroup. A reduction of the structure group from $T$ to $T_c$ exists on the paracompact charts. Equivalently, quotient the torsor by $A$:
  $ P arrow.r^rho overline(P) = P \/ A arrow.r^(macron(pi)) C . $
  Here $overline(P)$ is a topological quotient, and we use topological nearby cycles, defined by the universal cover of the punctured disc. The first map has contractible real fibers, and $macron(pi)$ is a locally trivial compact-torus bundle, hence proper. These are factorizations over the full disc, including its center.
  The hypothesis implies that $F = rho^(*) overline(F)$ for a sheaf $overline(F)$ on $overline(P) \|_(Delta^(*))$. This may be checked in a torsor chart, where it is the restriction equivalence for the product stratification and a contractible radial factor. Such local descriptions glue because that restriction equivalence is fully faithful. In a trivialization extending across zero, nearby cycles are computed in the product of a radial patch with a neighborhood in $overline(P)$. Contracting the radial patch gives
  $ Psi F = rho_0^(*) Psi overline(F) \, #h(2em) R rho_(*) rho^(*) overline(F) = overline(F) . $
  These identities hold also after base change and after tensoring by a factor from the target. Now $b macron(pi)$ is proper, so ordinary proper base change gives (7.3). It also proves the other asserted formulas after the radial factors have been removed. Every identification is the natural exchange map, as can be seen using restriction and direct image from the universal cover of $Delta^(*)$. They therefore compose for composite maps. The same argument works for products of enhancement tori. ◻
]

=== 7.4 The central action and its individual monodromies <the-central-action-and-its-individual-monodromies>

We now compare the local central action with the global eigenvalue. A choice of lift to the universal cover of a punctured disc at $x$ defines a nearby fiber $V_(sigma \, partial)$ of every $V_sigma$, compatibly with tensors; let $M_(V \, partial)$ be its positive-loop monodromy.

#thm([Lemma 7.4.])[
  (Global action of the central kernels).  #emph[Let $Q$ be a locally bounded constructible Betti complex on $cal(A)^(+)$, monodromic along $q$, equipped with coherent Hecke eigenisomorphisms on $U$ with eigenvalue $sigma$. The kernels $Z \( V \)$ act at $x$ on $Q$, by ordinary direct image in bounded affine Hecke correspondences, and there are isomorphisms 
#[#set math.equation(numbering: n => "(7.4)")
 $ Z \( V \) star.op_x Q tilde.eq Q ⊗_E V_(sigma \, partial) . $ <eq:descent-central-eigen>]

 They are natural in $V$, compatible with the tensor unit and successive convolutions, and carry $m_V star.op_x upright("id")_Q$ to $upright("id")_Q ⊗ M_(V \, partial)$. In a convolution of several central kernels this comparison holds for the monodromy on each individual factor. Consequently the action on $Q$ of (7.2) is 
#[#set math.equation(numbering: n => "(7.5)")
 $ chi_V \( upright("enhancement monodromy") \) = "Tr" \( M_(V \, partial) \) thin upright("id")_Q . $ <eq:descent-global-trace>]

]
] <lem:central-globalization>

#proof[
  The trace in (7.2) applies monodromy to the $Z \( V \)$ factor alone. We must therefore construct the central eigenisomorphism together with its tensor compatibility, retaining the monodromy on each factor. We first specialize one moving action, then compare successive actions on a common correspondence, and finally identify the individual monodromies and evaluate the trace.
  #emph[The moving action and its specialization.] Choose a coordinate disc $Delta$ around $x$, with $x = 0$. Consider the correspondence $frak(H)_Delta$ whose points consist of a leg $z in Delta$, two enhanced bundles $\( P_0 \, eta_0 \)$ and $\( P_1 \, eta_1 \)$, and an isomorphism
  $ P_0 \|_(X \\ { z }) tilde.eq P_1 \|_(X \\ { z }) . $
  The two enhancements at $x$ are independent, including when $z eq.not 0$. Write $p$ for the input map and $o$ for the output-and-leg map. We use bounded versions of this correspondence throughout.
  In a frame of $P_0$ that takes $eta_0$ to the standard enhanced flag, the local family is the Gaitsgory family of #cite(label("DT")) Section 6. Its fiber for $z eq.not 0$ is
  $ "Gr"_G times G \/ N_B \, $
  and its fiber at zero is $L G \/ upright("Iw")^0$. For $V in "Rep" \( hat(G) \)$, let $K_V$ on the punctured family be the Satake kernel on the Grassmannian factor, externally tensored with $upright(bold(1))_T$ on the locally closed subspace $T = B \/ N_B subset G \/ N_B$, extended by zero. Thus its support requires the two ordinary flags to agree under the modification, while its universal local system records their enhancement difference. By the local construction,
  #[#set math.equation(numbering: n => "(7.6)")
   $ Psi K_V = Z \( V \) . $ <eq:descent-kernel-specialization>]
  We use unsuspended geometric nearby cycles on relative kernels; the moving-curve perverse shift and its inverse in perverse nearby cycles have both been removed. This is the normalization in which the moving tensor-unit Hecke functor is exterior product with $E_Delta$.
  These descriptions descend from the frames to the global correspondence. Indeed changes of input frame are regular loop changes whose value at $x$ lies in $N_B$. Off zero the Satake factor has its positive-loop equivariance and the flag factor has the corresponding $N_B$-invariance. The descent isomorphisms and their cocycle identities specialize by smooth pullback. At zero their group is $upright("Iw")^0$, which is exactly the required equivariance for (7.6). On a fixed bound all this can be carried out with finite jets: use a sufficiently thick neighborhood of the sum of the graphs of $x$ and $z$, so the same frame space works at collision. These frame spaces are smooth. Off zero, descent of morphisms uses the specified Satake and flag equivariance. At collision the jet quotients of $upright("Iw")^0$ are unipotent, hence contractible in Betti topology; restriction along their group nerves is fully faithful. Thus the descent retains the maps of kernels, not only their isomorphism classes. Gluing bundles off the disc identifies these local descriptions with the global ones.
  Over $Delta^(*)$ form the action
  $ A_V \( Q \) = o_(*) #scale(x: 120%, y: 120%)[\(] Q thin accent(times.square K, ̃)_V #scale(x: 120%, y: 120%)[\)] \, $
  where the twisted product includes the fixed relative normalization. On the support of $K_V$, ordinary flags agree. Hence the correspondence is the usual enhancement-preserving Hecke correspondence together with a varying input enhancement. Its $T$-integration is the unit calculation of Lemma 18. It gives, with its functorial unit identification,
  #[#set math.equation(numbering: n => "(7.7)")
   $ A_V \( Q \) tilde.eq sans(H)_V \( Q \) \|_(Delta^(*)) tilde.eq Q times.square V_sigma \|_(Delta^(*)) . $ <eq:descent-punctured-action>]
  We next justify specialization of the direct image in this equation. The obstruction to properness is entirely the input enhancement. Forgetting that enhancement, while retaining its ordinary flag, is a $T$-torsor over the #emph[whole] bounded correspondence over $Delta$. Its quotient is proper over output and leg: after fixing the output bundle and enhancement, a bounded input modification is in a proper Grassmannian bound, and the ordinary input flag is a point of the proper flag bundle over it. This description uses full flags over the bound and remains valid at $z = 0$.
  Both factors of the integrand are relatively monodromic in this input-enhancement torsor. For $Q$ this is the base-change-stable condition in Lemma 17, or the hypothesis of the present lemma. For $K_V$ over $Delta^(*)$, its ordinary-flag condition and Grassmannian factor are independent of the enhancement; its remaining factor is a local system in the enhancement difference. Thus their product satisfies Lemma 19. It follows that nearby cycles commute with $o_(*)$. This argument uses one radial quotient extending across zero, so it also proves the asserted comparison at collision, where properness of $o$ itself is unavailable.
  On the correspondence, nearby cycles of the integrand are its twisted product with $Z \( V \)$. To check this assertion, pass to the input frames just described. There the input is pulled back from the bundle factor and the kernel from the local degeneration. The nearby-cycle exterior-product map is an isomorphism. More generally the same statement holds when the input is a family $D$ over $Delta^(*)$ that is $Q$ tensored with a lisse complex there: in the untwisted notation of a frame chart, it is the natural map
  #[#set math.equation(numbering: n => "(7.8)")
   $ p_0^(*) Psi D ⊗ Psi K_V arrow.r Psi \( p^(*) D ⊗ K_V \) . $ <eq:descent-tensor-exchange>]
  Trivialize the lisse factor on the universal cover of $Delta^(*)$ to reduce to the same exterior-product calculation.
  For precision concerning coefficients, these are calculations in weakly constructible Betti sheaves on finite-dimensional bounds. Adapt a complex stratification to the kernels and input. The local Milnor data have finite triangulations, and the exterior comparison is computed by cellular cochains on nearby fibers in product neighborhoods, using the same lift to the universal cover of the puncture. Each complex has finitely many cells; the usual Künneth map therefore works for the vector-space stalks of the universal local system as well. There is no inverse limit of finite-rank adic systems in this assertion. The computation is natural in maps of the factors and respects their monodromy; smooth frame changes preserve it. This is also the local calculation used in #cite(label("DT")) Proposition 6.3.1.
  Write $A_V$ for the punctured-family action above and
  $ B_V \( R \) = Z \( V \) star.op_x R $
  for its collision action. For an input family $D$ to which (7.8) applies, let
  #[#set math.equation(numbering: n => "(7.9)")
   $ c_V \( D \) : B_V \( Psi D \) arrow.r Psi A_V \( D \) $ <eq:descent-c-map>]
  be the tensor-exchange map followed by the inverse of the push exchange. In frame notation it is the composite
  $ o_(0 \, *) \( p_0^(*) Psi D ⊗ Z \( V \) \) arrow.r o_(0 \, *) Psi \( p^(*) D ⊗ K_V \) arrow.r^tilde.op Psi o_(*) \( p^(*) D ⊗ K_V \) . $
  The twists in this formula are the same on both sides. The preceding calculations prove that $c_V \( D \)$ is an isomorphism for $D$ constant with value $Q$, and for $D = Q times.square L$ with $L$ a finite-rank local system on $Delta^(*)$.
  For constant input, compose $c_V \( Q \)$ with nearby cycles of (7.7). This gives (7.4) and identifies $m_V$ with $M_(V \, partial)$, since $Q$ is constant in the disc direction. We now compare these maps for tensor products. Compatibility with total nearby-cycle monodromy would only identify the product of the factor monodromies; the trace requires each factor separately.
  #emph[Successive actions and the tensor comparison.] For a second representation $W$, the eigenisomorphism identifies $A_W \( Q \)$ with $Q times.square W_sigma \|_(Delta^(*))$, so it is among the inputs for which $c_V$ is an isomorphism. We first record how this comparison treats an extra lisse factor. For $D = Q times.square L$, set $L_partial = Psi L$. Projection formula and the exterior comparison give the following commutative square:
  (7.10)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$B_V \( Psi \( Q times.square L \) \)$])
  content((3.381, 0), [$Psi A_V \( Q times.square L \)$])
  content((0, -0.744), [$B_V \( Q \) ⊗ L_partial$])
  content((3.381, -0.744), [$Psi A_V \( Q \) ⊗ L_partial .$])
  line((1.194, 0), (2.517, 0), mark: (end: ">"))
  content((1.856, 0.2266), [#text(size: 0.73em)[$c_V \( Q times.square L \)$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.2741, -0.372), [#text(size: 0.73em)[$tilde.op$]])
  line((3.381, -0.2725), (3.381, -0.4715), mark: (end: ">"))
  content((3.655, -0.372), [#text(size: 0.73em)[$tilde.op$]])
  line((0.93, -0.744), (2.319, -0.744), mark: (end: ">"))
  content((1.625, -0.5173), [#text(size: 0.73em)[$c_V \( Q \) ⊗ upright("id")$]])
})
  Indeed, on the universal cover of $Delta^(*)$ the factor $L$ is constant. There both routes are the tensor-exchange map for $Q$ and $K_V$ tensored with its fiber, followed by the same push exchange. Finite rank permits that fiber to pass through all the direct images. The construction is equivariant for deck transformations, so the square descends, and it is natural in every local-system endomorphism of $L$. In particular it respects its boundary monodromy as an endomorphism on this factor alone: that monodromy commutes with the cyclic fundamental group of $Delta^(*)$ and hence is an endomorphism of $L$, not merely an automorphism of its nearby fiber.
  It remains to identify the resulting successive comparison with the one for the convolution of kernels. Let $frak(H)_(W \, V)^(\( 2 \))$ parametrize two bounded modifications at $z in Delta$,
  $ \( P_0 \, eta_0 \) arrow.r \( P_1 \, eta_1 \) arrow.r \( P_2 \, eta_2 \) \, $
  with each enhancement independent. The first bound supports $K_W$ and the second supports $K_V$. There are two forgetting maps. The map $f : frak(H)_(W \, V)^(\( 2 \)) arrow.r frak(H)_V$ forgets $\( P_0 \, eta_0 \)$ and the first modification; it is the base change of the output map for $frak(H)_W$. Forgetting only $eta_0$, while retaining its ordinary flag $beta_0$, factors $f$ as a $T$-torsor followed by a proper map, over the whole disc. For its projection formula the second kernel is pulled back from $frak(H)_V$.
  The other map $g : frak(H)_(W \, V)^(\( 2 \)) arrow.r frak(H)_(V ⊗ W)$ forgets $\( P_1 \, eta_1 \)$ and composes the two modifications; take a large enough bound on the target to contain their composites. First forget only $eta_1$, retaining $P_1$ and its ordinary flag $beta_1$. This is again a $T$-torsor on the entire family. The remaining map is proper. For fixed endpoints and composite modification, the possible bounded $P_1$ form the closed convolution fiber inside a proper Grassmannian bound: the two relative-position bounds are closed conditions. Choosing $beta_1$ adds a proper $G \/ B$-bundle. This description is valid also at $z = 0$, where the composite is an ordinary local modification with the endpoint enhancements retained.
  The integrand $Q thin accent(times.square K, ̃)_W thin accent(times.square K, ̃)_V$ is monodromic in the torus forgotten by either map. For $f$ this is the already proved input-enhancement calculation, with the second kernel pulled back from the target. For $g$ the factor $Q$ is independent of $eta_1$. Over $Delta^(*)$, changing $eta_1$ changes the two enhancement differences inversely; the two universal local systems therefore remain a local system in that variable. Their ordinary-flag conditions and Grassmannian factors do not depend on $eta_1$. This proves relative monodromicity in the actual intermediate-enhancement torsor, in frames, without requiring an equivariant structure on $Q$. Lemma 19 now applies to $f$ and $g$, their base changes, and the required projection formulas. The same uniform radial quotient applies to their specialized integrands by the nearby-cycle tensor comparison.
  For $z eq.not 0$, the two unit integrations give a convolution isomorphism
  $ b : A_V A_W \( Q \) arrow.r^tilde.op A_(V ⊗ W) \( Q \) \, $
  where tensor factors are written in action order. Forgetting the intermediate bundle first gives exactly this map: on the two torus covers, replace the two lifted enhancement differences by the first lifted difference and their lifted total difference. The coordinate change preserves product orientation. Integration in the first variable is the free-unit convolution map of Lemma 18, and its continuation agrees with the successive unit integrations.
  At zero the DT convolution comparison gives
  $ b_0 : B_V B_W \( Q \) arrow.r^tilde.op B_(V ⊗ W) \( Q \) . $
  It is the action of the specific monoidal kernel map $Z \( V \) star.op Z \( W \) tilde.eq Z \( V ⊗ W \)$ of #cite(label("DT")) Section 6.3: in the successive frames, #cite(label("DT")) Lemma 6.3.2 identifies the nearby cycles of the twisted product of the two kernels with their specialized twisted product, and pushing by $g$ is precisely their construction of this map. Exterior comparison with $Q$ and frame descent preserve that map.
  The equality of the two ways to compare actions is the square
  (7.11)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$B_V B_W \( Q \)$])
  content((3.117, 0), [$B_(V ⊗ W) \( Q \)$])
  content((0, -0.744), [$Psi \( A_V A_W \( Q \) \)$])
  content((3.117, -0.744), [$Psi A_(V ⊗ W) \( Q \) \,$])
  line((0.864, 0), (2.253, 0), mark: (end: ">"))
  content((1.558, 0.2266), [#text(size: 0.73em)[$b_0$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.9004, -0.372), [#text(size: 0.73em)[$c_(V \, W)^(upright("seq")) \( Q \)$]])
  line((3.117, -0.2725), (3.117, -0.4715), mark: (end: ">"))
  content((3.825, -0.372), [#text(size: 0.73em)[$c_(V ⊗ W) \( Q \)$]])
  line((1.062, -0.744), (2.187, -0.744), mark: (end: ">"))
  content((1.624, -0.5173), [#text(size: 0.73em)[$Psi \( b \)$]])
})
  where
  $ c_(V \, W)^(upright("seq")) \( Q \) = c_V \( A_W \( Q \) \) compose B_V \( c_W \( Q \) \) . $
  All domains in this expression are identified by $Psi Q = Q$ for the constant input family. To prove the square, on $frak(H)_(W \, V)^(\( 2 \))$ take the natural map from the product of the pulled-back nearby cycles of $Q \, K_W \, K_V$ to the nearby cycles of their twisted product. It is an isomorphism by the DT comparison just cited and the exterior comparison with $Q$. Push this map first through $f$ or first through $g$. Through $f$, base change and projection formula identify it with $c_V \( A_W \( Q \) \) compose B_V \( c_W \( Q \) \)$. Through $g$, they identify it with the action of the DT monoidal map followed by $c_(V ⊗ W) \( Q \)$. These identifications give the same map after the final output push: pullback-and-tensor exchange composes for iterated tensors, push exchange composes for composite maps, and their intervening projection-formula square commutes. Equivalently these are the exchange squares for restriction and direct image from the punctured-disc cover. The uniform torus factorizations above justify every exchange, so this verifies (7.11) also for the nonproper maps.
  #emph[Individual monodromy and the trace.] Apply this square using the eigenisomorphism $A_W \( Q \) tilde.eq Q times.square W_sigma \|_(Delta^(*))$. The second input is covered by (7.10): it is still monodromic along the enhancement, and its extra factor is lisse on $Delta^(*)$. The single-step map $c_W \( Q \)$ identifies $m_W$ with $M_(W \, partial)$. Applying $B_V$ to that identification and then (7.10) carries this endomorphism to the $W_(sigma \, partial)$ factor alone. This is legitimate independently of simultaneous disc monodromy, since the latter square is natural in the local-system endomorphism $M_(W \, partial)$ of $W_sigma \|_(Delta^(*))$. For the outer factor $m_V$, the bottom row of (7.10) is $c_V \( Q \)$ tensored with the identity of $W_(sigma \, partial)$, so its single-step identification gives $M_(V \, partial) ⊗ upright("id")$. Thus under the action comparison the two individual endomorphisms are respectively $upright("id") ⊗ M_(W \, partial)$ and $M_(V \, partial) ⊗ upright("id")$.
  The convolution square and the original tensor compatibility of the eigenisomorphisms show that these successive identifications are the one for $V ⊗ W$. Naturality of all maps of kernels proves compatibility with representation morphisms, including coevaluation and evaluation. The unit compatibility is exactly Lemma 18. Iterating the same square gives any number of factors, and permutation and fusion maps are the corresponding Satake kernel maps transported by these natural exchanges.
  We may therefore evaluate (7.2) on $Q$. Its coevaluation and evaluation become the ordinary insertion and contraction for $V_(sigma \, partial)$, and the middle map becomes $M_(V \, partial)$ on its indicated factor. The resulting scalar is $"Tr" \( M_(V \, partial) \)$. On the other hand, the right side of (7.2) acts through the $R_T$-action identified in Lemma 18. This proves (7.5) and the lemma. ◻
]

=== 7.5 Unipotence and nonvanishing of the direct image <unipotence-and-nonvanishing-of-the-direct-image>

#thm([Proposition 7.5.])[
  #emph[Let $sigma$ be a Zariski-dense geometric adic parameter on $U$ whose local monodromy at $x$ is unipotent. If $cal(A)^(+)$ carries a nonzero locally bounded constructible geometric adic Hecke eigencomplex for $sigma$, with the coherent tensor and fusion data, then $cal(A)$ carries a nonzero locally constructible perverse geometric adic Hecke eigensheaf for the same parameter and with the same coherences. Its singular support lies in the parabolic global nilpotent cone.]
] <prop:torus-descent>

#proof[
  By Proposition 13, a nonzero perverse cohomology of the given eigencomplex is again an eigenobject. Denote it by $Q$. Its singular support is nilpotent by Theorem 6; hence its Betti realization satisfies Lemma 17. Lemma 20 gives, for every algebraic representation $V$ of $hat(G)$,
  #[#set math.equation(numbering: n => "(7.12)")
   $ chi_V \( upright("enhancement monodromy") \) = \( dim V \) thin upright("id")_Q \, $ <eq:descent-character-identity>]
  because the boundary monodromy of $V_sigma$ is unipotent.
  Restrict to any torsor fiber, and to any finite-dimensional stalk cohomology space of $Q$ on it. The commuting enhancement monodromies have joint generalized eigencharacters $a : Gamma arrow.r E^times$, that is, points $a in hat(T) \( E \)$. Equation (7.12) says $chi_V \( a \) = chi_V \( 1 \)$ for every $V$. In characteristic zero the representation characters span $cal(O) \( hat(T) \)^W$ and separate semisimple conjugacy classes. Thus $a$ and $1$ have the same image in the finite Weyl quotient $hat(T) \/ W$. Its fiber through $1$ is the singleton ${ 1 }$, so $a = 1$. Every enhancement monodromy operator is therefore unipotent on every stalk cohomology space. This argument requires no uniform bound on Jordan blocks as the point of the bundle stack varies.
  Return to geometric adic sheaves and set $F = q_(!) Q$. The morphism $q$ has finite type and fixed relative dimension, so $F$ is locally bounded constructible. We prove $F eq.not 0$ by one fiber. Choose a point of $cal(A)^(+)$ with nonzero stalk, and let $a$ be its image in $cal(A)$. On the fiber $T = q^(- 1) \( a \)$ the restriction $Q_T$ has locally constant finite-dimensional cohomology sheaves. Choose the largest $j$ for which $cal(H)^j \( Q_T \) eq.not 0$, and write $W$ for its fiber. This is a nonzero finite-dimensional representation of $Gamma$ with commuting unipotent monodromies. Its coinvariants $W_Gamma$ are nonzero. Indeed the augmentation ideal of $E \[ Gamma \]$ acts nilpotently on $W$: its finitely many commuting nilpotent generators have a common finite nilpotence bound on this particular space. If $W_Gamma$ vanished, successive powers of that ideal would give $W = 0$.
  Poincaré duality on the torus identifies
  $ H_c^(2 r) \( T \, cal(H)^j \( Q_T \) \) tilde.eq W_Gamma \( - r \) eq.not 0 . $
  In the compact-support hypercohomology spectral sequence, the term of bidegree $\( 2 r \, j \)$ has no incoming differential, since all higher cohomology sheaves vanish, and no outgoing differential, since compactly supported cohomology vanishes above degree $2 r$. It yields a nonzero class in $H_c^(2 r + j) \( T \, Q_T \)$. Comparison with Betti sheaves and base change for $q_(!)$ now show $F_a eq.not 0$.
  Finally, away from $x$ the Hecke correspondence transports both the ordinary flag and its enhancement. Thus the enhanced correspondence is the pullback of the ordinary one along $q$, and the bounded output map is proper. Base change and the projection formula give natural isomorphisms
  $ sans(H)_(I \, \( V_i \)) \( q_(!) Q \) tilde.eq \( q times upright("id")_(U^I) \)_(!) sans(H)_(I \, \( V_i \)) \( Q \) tilde.eq q_(!) Q times.square times.square_(i in I) \( V_i \)_sigma . $
  The same correspondence calculation works on the successive modification spaces and on every collision diagonal in $U^I$. The exchange maps are natural, so they preserve the unit, tensor, permutation, and fusion diagrams. Hence $F$ is a nonzero coherent Hecke eigencomplex on $cal(A)$. A nonzero perverse cohomology of $F$ is an eigensheaf by Proposition 13, and its singular support is in $Lambda_(upright("par"))$ by Theorem 6. ◻
]

The descent argument uses unipotence of boundary monodromy, without a regularity requirement. In the application to Theorem 1, the prescribed regular-unipotent boundary satisfies this hypothesis.

== 8 Construction and the two specializations <sec:construction>

We now construct the eigencomplex to which the preceding results apply. The initial object comes from the unramified characteristic-zero correspondence. A degeneration to a separating node produces enhanced flags on its normalization. The torus descent of Proposition 21 then gives an ordinary-flag perverse eigensheaf in characteristic zero. A second specialization gives the sheaf in Theorem 1. In both specializations we must place a nonzero generic stalk in the closure of the particular special-fiber bundle stack under consideration; this is where uniformization and proper bounded Hecke spaces enter.

=== 8.1 A constructible unramified eigencomplex <a-constructible-unramified-eigencomplex>

Here is the precise consequence of the characteristic-zero correspondence that we need. The compactness assertion is essential: the existence of an arbitrary ind-constructible eigenobject would not suffice for nearby cycles or for the arguments of Sections 4–7.

#thm([Lemma 8.1.])[
  #emph[Let $C$ be a smooth projective connected curve over an algebraically closed field $K$ of characteristic zero, and let $G$ be simple and simply connected. Let $tau$ be a continuous $hat(G)$-local system on $C$, defined over a finite extension of $bb(Q)_ell$, with Zariski-dense image. There is a nonzero locally bounded constructible geometric $E$-adic complex $F$ on $"Bun"_G \( C \)$ with a coherent Hecke eigenstructure of eigenvalue $tau$. The eigenstructure uses the relative normalization of Section 2 and includes all finite sets of legs and their collision maps.]
] <lem:compact-eigencomplex>

#proof[
  We use the characteristic-zero part of the Gaitsgory–Raskin theorem, namely the equivalence
  $ "Shv"_(upright("Nilp")) \( "Bun"_G \( C \) \) tilde.eq "IndCoh"_(upright("Nilp")) #scale(x: 120%, y: 120%)[\(] "Loc"_(hat(G))^(upright("restr")) \( C \) #scale(x: 120%, y: 120%)[\)] \, $
  its $"QCoh"$-linearity, and the preservation of compact objects by the inclusion of the automorphic nilpotent category #cite(label("GR")) Main Theorem 1.3.9(ii), Lemma 1.3.7, and Theorem 1.1.7. Its scope includes geometric $overline(bb(Q))_ell$-sheaves and arbitrary algebraically closed characteristic-zero base fields #cite(label("GR")) Section 2.3. Auxiliary choices in that construction, such as a theta characteristic, can be made over $K$.
  We identify the external Satake labels with our Hecke input–output convention. If our label $V$ corresponds externally to $alpha \( V \)$ for a symmetric tensor autoequivalence $alpha$ (for example a Chevalley relabeling), we use the external spectral point $tau compose alpha^(- 1)$. Thus, in the convention used below, universal evaluation at the point denoted $tau$ is exactly $V mapsto V_tau$.
  Put $cal(S) = "Loc"_(hat(G))^(upright("restr")) \( C \)$ and let $i_tau : "Spec" E arrow.r cal(S)$ be the point defined by $tau$. We first check that the ind-coherent skyscraper $delta_tau = i_(tau \, *)^("IndCoh") E$ is a nonzero compact object with nilpotent singular support. The connected components of the restricted stack are indexed by semisimple parameters, and a component containing an irreducible parameter has a unique isomorphism class of geometric points #cite(label("AGKRRV")) Proposition 3.7.2 and Corollary 3.7.5. Density makes $tau$ irreducible: a reduction to a proper parabolic would put its image in that parabolic. Moreover, $hat(G)$ is adjoint, so
  $ "Aut" \( tau \) = Z_(hat(G)) \( "im" tau \) = Z \( hat(G) \) = 1 . $
  The formal tangent complex at this point is $R Gamma \( C \, "ad" \( tau \) \) \[ 1 \]$ #cite(label("AGKRRV")) Section 21.2.1. Its degree $- 1$ cohomology vanishes by the displayed centralizer calculation. The invariant perfect form on the characteristic-zero semisimple Lie algebra and Poincaré duality give
  $ H^2 \( C \, "ad" \( tau \) \) tilde.eq H^0 \( C \, "ad" \( tau \) \)^or \( - 1 \) = 0 . $
  Thus there are neither infinitesimal automorphisms nor obstructions, and this one-point formal component is a smooth formal polydisc with tangent space $H^1 \( C \, "ad" \( tau \) \)$.
  For completeness, on the completion of a smooth affine space at the origin, ind-coherent sheaves identify with ind-coherent sheaves on that space supported at the origin. The coherent skyscraper is compact in this category, and extension to the disjoint union of formal components preserves compactness; this is the formal-completion description used in #cite(label("AGKRRV")) Sections 21.1.7–21.1.10. On a smooth formal component the space of obstruction directions is zero. Hence the spectral singular support of $delta_tau$ is zero, in particular nilpotent. Here spectral singular support refers to ind-coherent obstruction directions, rather than to the microlocal support of a constructible skyscraper.
  Let $F$ be the inverse image of $delta_tau$ under the equivalence. It is nonzero and compact in the nilpotent category, hence compact in the ambient automorphic category by the cited compactness theorem. Compact automorphic sheaves are bounded constructible after pullback to each finite-type smooth chart #cite(label("AGKRRV")) Appendix F, Section F.2.2. This proves the required local finiteness.
  It remains to explain why the construction supplies the whole eigenstructure. For $A in "QCoh" \( cal(S) \)$ the projection formula gives the natural module identity
  $ A ⊗ delta_tau tilde.eq i_(tau \, *)^("IndCoh") \( i_tau^(*) A \) . $
  For a finite set $I$ and representations $\( V_i \)_(i in I)$, apply this identity to the universal evaluation object with its lisse dependence on $C^I$. Its restriction to $tau$ is $times.square_(i in I) \( V_i \)_tau$. The universal evaluation action is the Hecke action #cite(label("AGKRRV")) Main Theorem 14.3.2 and Section 14.3.3. $"QCoh"$-linearity therefore transports the displayed identity to
  $ sans(H)_(I \, \( V_i \)) \( F \) tilde.eq F times.square #scale(x: 180%, y: 180%)[\(] times.square_(i in I) \( V_i \)_tau #scale(x: 180%, y: 180%)[\)] . $
  These are restrictions of one universal tensor-evaluation system. The unit, convolution, permutations, and restrictions to collision diagonals are consequently transported together, with their coherence relations. Converting the universal system to our relative Satake normalization gives the displayed formula without a moving-leg shift, as fixed in Section 2. ◻
]

=== 8.2 The separating node and its bundle stack <the-separating-node-and-its-bundle-stack>

Until the mixed-characteristic construction below, the pointed curve $\( X \, x \)$ is over $bb(C)$. Write $U = X \\ { x }$, and fix a continuous dense parameter $sigma$ on $U$, represented by $rho$. Twisted nodal curves and their relation to parahoric level already enter the automorphic gluing construction of Nadler–Yun #cite(label("NYAutomorphicGluing")) Section 2.3, Proposition 3.1.5, and Lemma 3.2.3. We give the local calculation for the alcove type needed here, including the gluing torus. Take copies $\( X_1 \, x_1 \)$ and $\( X_2 \, x_2 \)$ of $\( X \, x \)$ and identify $x_1$ with $x_2$ to form the stable nodal curve $C_0$. A projective smoothing

$ C arrow.r "Spec" R_1 \, #h(2em) R_1 = bb(C) \[ \[ s \] \] \, $

can be chosen with completed local equation $a b = s$ at the node and smooth connected generic fiber. Indeed, deformation theory of a nodal curve has no obstruction in degree two, and its local node smoothing parameters are independent; algebraizing an ample line bundle gives the projective family.

Choose compatible roots $s_n$ of $s$, put $R_n = bb(C) \[ \[ s_n \] \]$ with $s_n^n = s$, and use the balanced twisted model $C \( n \)$ over $R_n$. Its node chart and coarse coordinates are

#[#set math.equation(numbering: n => "(8.1)")
 $ ["Spec" R_n \[ u \, v \] \/ \( u v - s_n \) #scale(x: 120%, y: 120%)[\/] mu_n] \, #h(2em) zeta \( u \, v \) = \( zeta u \, zeta^(- 1) v \) \, #h(2em) a = u^n \, quad b = v^n . $ <eq:construction-balanced-node>]

Away from the closed node this is the coarse family after base change. This description glues in an #emph[étale] node chart: changing branch coordinates multiplies them by units, whose roots can be taken étale locally, and the ambiguities are precisely the indicated $mu_n$-action. Equivalently, one uses the divisor charts of the two components of the semistable family. If $n divides m$, the power maps $u_n = u_m^(m \/ n)$, $v_n = v_m^(m \/ n)$ give compatible maps of twisted models. Each model is a proper tame Deligne–Mumford stack with projective coarse space. The normalization of $C \( n \)_0$ consists of $X_1$ and $X_2$ with an $n$th root-stack point at the marking on each. This is the balanced-node construction of #cite(label("OlssonTwisted")) Theorems 1.9–1.10, Remark 1.11, and Proposition 2.2(ii).

Fix $T subset B subset G$ and a strictly dominant cocharacter $lambda in X_(*) \( T \)$. Choose $n$ so large that

#[#set math.equation(numbering: n => "(8.2)")
 $ 0 < chevron.l alpha \, lambda chevron.r < n #h(2em) \( alpha upright(" a positive root") \) . $ <eq:construction-alcove>]

At the node prescribe the conjugacy class of the homomorphism $lambda \|_(mu_n) : mu_n arrow.r G$, using the first branch coordinate $u$ in (8.1). Its centralizer is $T$: no root is trivial on this subgroup by (8.2), and semisimple centralizers in the simply connected group $G$ are connected.

Let $cal(B)_n$ be the open substack of $"Bun"_G \( C \( n \) \/ R_n \)$ obtained by removing all the other types in the closed fiber. This is indeed open. The conjugacy types of $mu_n arrow.r G$ form the finite set $T \[ n \] \/ W$, and are locally constant in families on the residual gerbe; hence the unwanted types form a closed substack of the closed fiber. The stack $cal(B)_n$ is algebraic, locally of finite type, and smooth over $R_n$. Apply the Hom-stack theorem #cite(label("HallRydh")) Theorem 1.2 to the proper flat finitely presented source $C \( n \)$ and the target $B G$, whose diagonal is affine. This gives algebraicity, local finite presentation, and an affine diagonal. The obstruction to deforming a bundle is in $H^2 \( C \( n \)_0 \, "ad" P \)$, which vanishes: coarse pushforward is exact for a tame stack #cite(label("AbramovichVistoli")) Lemma 2.3.4, and the coarse space is a curve. The same calculation applies to every fiber. Isomorphism spaces are representable, with the usual affine diagonal for the bundle stack. In particular, its smooth charts are available for nearby cycles. Its geometric generic fiber is the unlevelled bundle stack of the smooth generic curve.

The following calculation identifies its closed fiber, including the enhancements that will be needed for torus descent. Set $U_B = R_u \( B \)$, let $B^(-)$ be the opposite Borel containing $T$, write $U^(-) = R_u \( B^(-) \)$, and put

$ cal(A)_1^(+) = "Bun"_(G \, U_B \, x_1) \( X_1 \) \, #h(2em) cal(A)_2^(+) = "Bun"_(G \, R_u \( B^(-) \) \, x_2) \( X_2 \) . $

An object of either stack is a bundle with a reduction to the specified unipotent subgroup at the marked point. Forgetting the enhancement is a torsor under $T = B \/ U_B = B^(-) \/ R_u \( B^(-) \)$.

#thm([Lemma 8.2.])[
  #emph[With these choices there is an equivalence 
#[#set math.equation(numbering: n => "(8.3)")
 $ \( cal(B)_n \)_0 tilde.eq \[ cal(A)_1^(+) times cal(A)_2^(+) \/ T \] \, $ <eq:construction-special-bun>]

 where $T$ changes the two identifications at the gluing gerbe simultaneously. Hecke modifications at an unmarked point of $X_i$ pull back to the usual Hecke modifications on the $i$th factor.]
] <lem:construction-type-flags>

#proof[
  On the first normalized component put $t = u^n$. Locally on a test scheme $S$, choose a frame on the root-disc cover in which the inertia acts by $lambda \( zeta \)$. Such frames lift from the origin through all infinitesimal neighborhoods: the frame spaces are smooth and $mu_n$-invariants are exact. A change of frame satisfies
  #[#set math.equation(numbering: n => "(8.4)")
   $ h \( zeta u \) = lambda \( zeta \) h \( u \) lambda \( zeta \)^(- 1) . $ <eq:construction-equivariant-frame>]
  In particular $h \( 0 \) in T$. Passing to the invariant punctured-disc frame replaces $h$ by $g \( t \) = lambda \( u \)^(- 1) h \( u \) lambda \( u \)$.
  We check exactly which series $g$ occur. For a positive root $alpha$ put $j = chevron.l alpha \, lambda chevron.r$. The $alpha$-root series in (8.4) and its conjugate have the forms
  $ u^j a_alpha \( u^n \) mapsto a_alpha \( t \) \, #h(2em) a_alpha in cal(O)_S \[ \[ t \] \] \, $
  whereas the $- alpha$-root series have the forms
  $ u^(n - j) b_alpha \( u^n \) mapsto t b_alpha \( t \) \, #h(2em) b_alpha in cal(O)_S \[ \[ t \] \] . $
  The toral series are simply series in $t$. These formulas give the entire group, including its converse. Namely, $h \( 0 \) in T$ puts $h$ in the formal big cell $U^(-) T U_B$, in a fixed root order; the displayed formulas transform that factorization into precisely the big-cell factorization of
  $ I_B = { g \( t \) in G \( cal(O)_S \[ \[ t \] \] \) : g \( 0 \) in B } . $
  Conversely every series in $I_B$ has that factorization since its reduction belongs to $B subset U^(-) T U_B$, and the inverse formulas produce a regular equivariant $h$. The calculation is valid over arbitrary test schemes and identifies the group functors.
  Gluing to the complement of the point therefore identifies bundles of this root type with ordinary $B$-level bundles on $X_1$. Moreover, evaluation $h mapsto h \( 0 \)$ becomes the torus projection $I_B arrow.r T$. Its kernel becomes the inverse image of $U_B$ under $I_B arrow.r B$. Thus an identification of the bundle on the residual gerbe with the fixed type torsor corresponds exactly to an enhanced flag.
  For the second branch the coordinate action is $v mapsto zeta^(- 1) v$. If its positive coordinate generator is denoted by $eta = zeta^(- 1)$, the fiber action is $lambda \( eta^(- 1) \)$. The preceding calculation therefore uses $- lambda$ and gives the opposite Borel $B^(-)$. This explains the sign and the choice of $cal(A)_2^(+)$. Both gerbe frame spaces have automorphism group $T$ when expressed using the common node generator $zeta$.
  A bundle on the nodal twisted curve is a pair of bundles on its normalization together with an identification on their residual gerbes. This is ordinary nodal gluing in the equivariant chart (8.1). Choosing identifications of both gerbe restrictions with the fixed type torsor makes that gluing identification automatic, and changing both choices by the same element of $T$ leaves it unchanged. Descent gives (8.3); there is no additional quotient. If enhancements are instead written as right actions with the second identification reversed, the same quotient is written with inversion on the second torus. We retain the simultaneous-frame convention.
  Finally a modification away from the node identifies the bundles near the gerbe, and hence transports the two frames and the gluing map. After pullback to the product it acts on exactly the indicated factor. ◻
]

At a scheme-theoretic smooth leg of $C \( n \)$ away from the node, Beauville–Laszlo gluing #cite(label("BeauvilleLaszlo")) Section 3, applied in a faithful representation and to its reductions of structure group, gives the usual relative affine Grassmannian description. Finite jets suffice for each Schubert bound. Its bounded Hecke maps are proper, its exact-position maps to bundle and leg are smooth, and modifications preserve the prescribed type. The closed leg locus contains $U_1 union.sq U_2$. Consequently this family has all the geometric properties required in Theorem 7 and Proposition 10. The nilpotent cone and its dimension bound on its special fiber are those for the torus quotient in Proposition 3.

=== 8.3 Gluing the parameter through the node <gluing-the-parameter-through-the-node>

We next construct an unramified parameter on the smooth generic curve whose specialization on $U_1$ is $sigma$. This requires a compatible tower of finite covers, because the given adic parameter need not have finite monodromy or descend over a finite extension of the trait.

Choose a based orientation-reversing homeomorphism $f : U_2^(upright("an")) arrow.r U_1^(upright("an"))$, with paths to tangential base points chosen so that a positive boundary loop $c_2$ maps to $c_1^(- 1)$. Riemann existence identifies the étale fundamental groups with the profinite completions of these topological groups. The induced map on completions is continuous. Thus $rho_2 = rho compose hat(f)_(*)$ defines a continuous parameter on $U_2$ with the same compact image as $rho$, and

#[#set math.equation(numbering: n => "(8.5)")
 $ rho_2 \( c_2 \) = rho \( c_1 \)^(- 1) . $ <eq:construction-boundary-inverse>]

The homeomorphism need not be algebraic: finite-cover Riemann existence is what supplies the algebraic local systems.

Let $H = rho \( pi_1^(upright("et")) \( U_1 \) \) subset hat(G) \( L \)$, for a finite coefficient field $L$, and choose a cofinal decreasing sequence of open normal subgroups $H_r$. It can be obtained by choosing an $H$-invariant lattice in a faithful representation and taking congruence kernels. Put $Q_r = H \/ H_r$. Both punctured components carry connected $Q_r$-torsors. Choose root indices $m_r$ with $n divides m_r divides m_(r + 1)$ and divisible by the order of the boundary image in $Q_r$. The torsors extend to finite étale torsors on the normalization root stacks of $C \( m_r \)_0$: locally a Kummer root kills the finite boundary inertia. This is the root-stack description of tame covers #cite(label("LieblichOlsson")) Proposition A.10.

At the node the same generator $zeta$ acts positively on the first branch and negatively on the second. Equation (8.5) therefore says that the restrictions of these torsors to the gluing gerbe have the same $Q_r$-action. Fix their identification by reducing one boundary-fiber identification modulo $H_r$. This makes all transition maps compatible. The two torsors glue to a finite étale $Q_r$-torsor $Y_(r \, 0)$ over $C \( m_r \)_0$. On the node chart, both branch covers become constant across their origins with the same inertia action; gluing the constant fibers and then taking the equivariant quotient proves the assertion at the node as well as away from it.

Proper henselian invariance lifts $Y_(r \, 0)$ uniquely up to its unique compatible isomorphism to a finite étale torsor $Y_r$ over $C \( m_r \)$ #cite(label("Rydh")) Theorem 4.5. The theorem applies because these stacks are proper with finite diagonal over the henselian trait. Its full faithfulness lifts the group actions, the transition maps after pullback to a divisible model, and all their relations. Fix a compatible geometric generic field $K = overline(bb(C) \( \( s \) \))$. All $C \( m_r \)_K$ are the same smooth scheme $C_K$. Choose a base point over a section specializing in $U_1$, and compatible points above it in the torsor fibers. These framings can be lifted from the original tower on $U_1$, since finite étale covers of the strictly henselian section are constant. The restrictions of the lifted tower give a continuous homomorphism

#[#set math.equation(numbering: n => "(8.6)")
 $ rho_K : pi_1^(upright("et")) \( C_K \) arrow.r "proj lim"_r Q_r = H subset hat(G) \( L \) . $ <eq:construction-generic-parameter>]

We verify density rather than assuming that it survives lifting. Each $Y_(r \, 0)$ is connected: its first normalization component is connected, and every component of the other normalization meets the gluing fiber. The stack $Y_r$ is proper and flat, with geometrically reduced fibers. Its tame coarse space is also flat over the trait, since taking invariants is exact and preserves flatness. On the connected reduced proper special fiber, $H^0 \( cal(O) \)$ consists of constants. Semicontinuity therefore gives $h^0 \( Y_(r \, K) \, cal(O) \) = 1$, so the geometric generic torsor is connected. Hence (8.6) surjects onto every $Q_r$. Its image is compact, thus closed in $H$, and is therefore all of $H$. In particular it is Zariski dense in $hat(G)$.

For each representation of $hat(G)$, enlarge the finite coefficient field as needed and choose a lattice stable under $H$. Each finite reduction factors through some $Q_r$, and hence extends as a lisse system on the smooth leg locus after the corresponding finite trait extension. The special reductions are those of $sigma$ on $U_1$ and of $rho_2$ on $U_2$. Although the models at the node vary with $m_r$, they agree away from it. This proves exactly the lattice-reduction specialization condition of Proposition 10, with its tensor compatibilities. It does not require one finite trait extension for the entire adic system.

=== 8.4 Nonvanishing at the prescribed type <subsec:construction-prescribed-type>

Apply Lemma 22 to $C_K$ and $rho_K$, obtaining $F$. Regard its nearby cycles on the fixed model $cal(B)_n$. To prove that they are nonzero, we must meet the chosen type in the special fiber. Nonvanishing on some unspecified component of the full bundle stack would not give this conclusion.

Choose a point of the product in (8.3). A smooth chart of $cal(B)_n$ through its image lifts this point over the henselian trait, and therefore supplies a reference bundle $P_0$ on $C \( n \)$ of the prescribed type. Choose also a section $y$ of the smooth scheme locus disjoint from the node. Since $F$ is nonzero and locally constructible, it has a nonzero stalk at a $K$-valued bundle $P$ on $C_K$.

The uniformization argument of Drinfeld–Simpson applies here: a bundle for a semisimple simply connected group on a smooth affine curve over an algebraically closed field is trivial. One may use the precise affine-curve statement #cite(label("BelkaleFakhruddin")) Theorem 1.1, whose fundamental-group-order hypothesis is automatic for a simply connected group. Thus $P$ and $\( P_0 \)_K$ are isomorphic on $C_K \\ { y_K }$. An isomorphism exhibits $P$ as a modification of $\( P_0 \)_K$ lying in a finite Schubert bound. The corresponding bounded Hecke space over the reference input and the section $y$ is proper over the trait. The modification therefore extends after a finite extension of that trait. Its output still has the prescribed node type, since modification at $y$ leaves the bundle near the node unchanged.

Choose a finite-type smooth affine chart of $cal(B)_n$ through this special output. After a further henselian lift the section of the bundle stack lifts to that chart. Its geometric generic point has the original nonzero stalk. The closure of the nonzero-stalk locus on this chart consequently meets the special fiber. The contrapositive of Theorem 7, with the Hecke geometry and lattice extensions already verified, now gives

#[#set math.equation(numbering: n => "(8.7)")
 $ Psi F eq.not 0 quad upright("on ") \( cal(B)_n \)_0 . $ <eq:construction-nonzero-node>]

Proposition 10 gives its coherent eigenstructure for all legs in $U_1 union.sq U_2$. Pull back ordinarily along the smooth surjection $cal(A)_1^(+) times cal(A)_2^(+) arrow.r \( cal(B)_n \)_0$. The pullback is nonzero by (8.7). Choose a geometric point $\( a_1 \, a_2 \)$ with nonzero stalk and restrict along $cal(A)_1^(+) times { a_2 }$. We obtain a nonzero locally bounded constructible complex $F_1^(+)$ on $cal(A)_1^(+)$. Bounded Hecke pushforward for the first curve commutes with both pullbacks by proper base change and Lemma 23. Thus $F_1^(+)$ has eigenvalue $sigma$, with all multi-leg compatibilities. No assertion about perversity is needed for these ordinary pullbacks.

#thm([Proposition 8.3.])[
  #emph[Let $\( X \, x \)$ be a smooth projective pointed complex curve of genus at least two, let $G$ be simple and simply connected, and let $sigma$ be a continuous Zariski-dense geometric $E$-adic $hat(G)$-parameter on $X \\ { x }$, defined over a finite coefficient extension. If its local monodromy is unipotent, there is a nonzero locally constructible perverse eigensheaf on $"Bun"_(G \, B \, x) \( X \)$ with eigenvalue $sigma$, nilpotent singular support, and the full coherent Hecke system in our relative normalization.]
] <prop:charzero-existence>

#proof[
  The preceding construction gives the nonzero enhanced-flag eigencomplex $F_1^(+)$. Proposition 21 applies because $sigma$ is dense and its boundary monodromy is unipotent. It supplies a nonzero locally constructible perverse eigenobject at ordinary $B$-level. Its singular support is nilpotent by Theorem 6. All steps used geometric adic sheaves; Betti realization enters only through the previously proved perversity and torus-descent statements. ◻
]

=== 8.5 Lifting the curve and the parameter from characteristic $p$ <lifting-the-curve-and-the-parameter-from-characteristic-p>

We return to the data of Theorem 1. Let $R = W \( k \)$. This is a complete strictly henselian discrete valuation ring, and $ell$ is invertible in it. There is a smooth projective pointed lift

$ \( cal(X) \, frak(x) \) arrow.r "Spec" R quad upright("of ") \( X \, x \) . $

Pointed smooth curves have unobstructed deformations, since

$ H^2 \( X \, T_X \( - x \) \) = 0 . $

An ample line bundle lifts as well, and formal algebraization produces the displayed projective family. Lift the split group and Borel by their split models over $bb(Z)$. Write $cal(U) = cal(X) \\ frak(x)$ and $K_0 = overline("Frac" \( R \))$.

We may identify $K_0$ abstractly with $bb(C)$ for the characteristic-zero argument. Indeed, $k$ is countable, $W \( k \)$ is a set of countable sequences in $k$, and it contains $bb(Z)_p$, so its cardinality is the continuum. Its fraction field and an algebraic closure of that field have the same cardinality. An uncountable algebraically closed field of characteristic zero has transcendence degree equal to its cardinality, which proves the assertion. This identification concerns the geometric base field; the adic topology and continuity of the coefficient representation are retained.

#thm([Lemma 8.4.])[
  #emph[The given parameter $sigma$ lifts to a continuous parameter $sigma_(K_0)$ on $cal(U)_(K_0)$ with the same compact image and the same full boundary inertia homomorphism, after the compatible identification of prime-to-$p$ roots of unity. In particular it is Zariski dense, its local inertia factors through $bb(Z)_ell \( 1 \)$ and is regular unipotent, and its lattice reductions specialize to those of $sigma$ on $U$.]
] <lem:construction-mixed-parameter>

#proof[
  Use the compact image $H$ and its quotients $Q_r = H \/ H_r$ as above. The corresponding $Q_r$-torsor on $U$ is tamely ramified at $x$. Since its inertia comes from $bb(Z)_ell \( 1 \)$, its inertia image has order a power of $ell$. Choose compatible indices $d_r = ell^(e_r)$, with $d_r divides d_(r + 1)$, that kill these finite inertia images. Each torsor extends to a finite étale torsor over the root stack $X \( root(d_r, x) \)$. These indices are invertible in $R$, so the relative root stacks $cal(X) \( root(d_r, frak(x)) \)$ are smooth proper tame Deligne–Mumford stacks over $R$.
  Apply proper henselian invariance of finite étale covers to lift the torsors, their actions, and all transition maps to these relative root stacks #cite(label("Rydh")) Theorem 4.5. The root-stack and tame-cover formulation is also given in #cite(label("LieblichOlsson")) Proposition A.10, Theorem A.11, and Corollaries A.12–A.13. Restricting to $cal(U)$ and then to $K_0$ gives a compatible tower of finite torsors, hence a continuous homomorphism $pi_1^(upright("et")) \( cal(U)_(K_0) \) arrow.r H$. These statements require the local ramification index to be prime to $p$; they put no prime-to-$p$ restriction on $\| Q_r \|$.
  Each special torsor on the root stack is connected and geometrically reduced, since its dense restriction to $U$ is connected. The proper flat tame-coarse-space argument used for (8.6) gives connected geometric generic root-stack torsors. They are smooth connected curves as stacks; removing the inverse image of the marked gerbe preserves connectedness. The homomorphism therefore surjects onto every $Q_r$, and compactness again gives image exactly $H$.
  The gerbe along $frak(x)$ records the inertia map at each finite stage. Compatible prime-to-$p$ roots of unity identify its special and generic generators, and full faithfulness in the lifting theorem preserves the entire action of $mu_(d_r)$. Thus the generic inertia homomorphism factors through $mu_(ell^(e_r))$ at every finite stage and agrees there with the original one. In particular every $bb(Z)_a \( 1 \)$ factor of characteristic-zero inertia for a prime $a eq.not ell$, including $a = p$, acts trivially. Passing to the inverse limit gives the full formula
  $ rho_(K_0) \( gamma \) = exp #scale(x: 120%, y: 120%)[\(] t_ell \( gamma \) N #scale(x: 120%, y: 120%)[\)] #h(2em) \( gamma in I_(frak(x) \, K_0) \) \, $
  with the same regular nilpotent $N$, up to the allowed change of generator. This also accords with the peripheral compatibility of specialization in #cite(label("LieblichOlsson")) Lemma 3.5.
  Finally every invariant-lattice reduction in an algebraic representation factors through some $Q_r$. The corresponding lifted torsor is lisse on $cal(U)$ and has the required special fiber. The tower respects tensor operations, so these reductions give the claimed lisse specialization condition for the whole tensor local system. ◻
]

=== 8.6 Completion of the proof <completion-of-the-proof>

#proof[
  Use Lemma 25 and identify $K_0$ with $bb(C)$. Proposition 24 produces a nonzero locally constructible perverse eigensheaf $M_(K_0)$ on $"Bun"_(G \, B \, frak(x)) \( cal(X) \)_(K_0)$ with eigenvalue $sigma_(K_0)$. Set
  $ cal(A) = "Bun"_(G \, B \, frak(x)) \( cal(X) \/ R \) \, #h(2em) M = Psi M_(K_0) quad upright("on ") cal(A)_k = cal(A) . $
  The relative bundle stack is smooth over $R$: the unlevelled bundle stack is smooth by $H^2$-vanishing, and adding the flag is a smooth $G \/ B$-fibration. By Proposition 2, the geometric nearby cycles used here are locally constructible and perverse, without taking inertia invariants. The lattice extensions in Lemma 25 and Proposition 10 give
  $ sans(H)_(I \, \( V_i \)) \( M \) tilde.eq M times.square #scale(x: 180%, y: 180%)[\(] times.square_(i in I) \( V_i \)_sigma #scale(x: 180%, y: 180%)[\)] $
  for every finite set of legs, with the stated naturality, unit, convolution, permutation, and fusion compatibilities.
  It remains to prove that $M eq.not 0$. As in Section 8.4, we extend a bundle with nonzero generic stalk by a bounded Hecke modification. Here the level datum to extend is an ordinary flag, so properness of $G \/ B$ will complete the extension. Choose a $K_0$-valued point $\( P \, beta \)$ where $M_(K_0)$ has nonzero stalk, a reference $G$-bundle $P_0$ on $cal(X)$, and a smooth section $y$ disjoint from $frak(x)$. The existence of $y$ follows by lifting a point of $X \\ { x }$ over the henselian base. Off $y_(K_0)$, the bundles $P$ and $\( P_0 \)_(K_0)$ are isomorphic by the affine-curve triviality used above. A bounded Hecke space at $y$, proper over the reference input, extends this modification after a finite trait extension. Its output extends the underlying bundle $P$. The generic flag $beta$ then extends by properness of the associated $G \/ B$-bundle over the marked section. Thus the point with nonzero stalk extends to a section of $cal(A)$. Lifting this section in a finite-type smooth affine chart through its special value shows that the closure of the generic nonzero-stalk locus meets the special fiber on that chart.
  Theorem 7 now proves $M eq.not 0$. Its geometric assumptions hold for this smooth pointed family; the special-fiber cone dimension and transverse-modification statements are Propositions 3 and 5, under precisely the four characteristic hypotheses of Theorem 1.
  Finally Theorem 6 applied to this locally constructible eigenobject gives $"SS" \( M \) subset Lambda$ on every smooth chart. At ordinary $B$-level the cotangent residue lies in $"Lie" R_u \( B_beta \)$, so this cone is exactly $Lambda_(upright("par"))$ from the theorem. The construction thus has all the required properties. All parameter lifts and nearby-cycle operations are geometric; no Frobenius structure is involved. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
