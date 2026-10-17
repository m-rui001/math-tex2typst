#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Global quantum geometric Langlands at irrational level]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth projective connected curve over $bb(C)$, and let $G$ be a connected simple complex algebraic group. Its Langlands dual $G^or$ is defined by the dual of the full root datum, so the global form of $G$ is part of the data. Write $"Bun"_G \( X \)$ for the stack of principal $G$-bundles. The adjoint determinant line on this stack is

$ L_G \|_E = det R Gamma \( X \, frak(g)_E \) . $

Thus the determinant of $H^1$ occurs with exponent $- 1$. If $h^or$ is the dual Coxeter number, set

#[#set math.equation(numbering: n => "(1.1)")
 $ D_c \( "Bun"_G \( X \) \) := D #h(-0.16667em) (L_G^(\( c - h^or \) \/ \( 2 h^or \))) . $ <intro:level>]

Here $D \( L^s \)$ is the cocomplete derived DG category of all twisted $D$-modules for the indicated complex power of the line. The power specifies a sheaf of twisted differential operators and does not require a root of $L$. Precise descent and sign conventions are given in Section 2.

Let $r$ be the lacing number of $G$: it is $1$, $2$, or $3$ according to the ratio of the squared root lengths. Fix dual pinnings and a theta characteristic on $X$. These choices fix the residue characters and the normalizations of localization used below.

#thm([Theorem 1.1.])[
  #emph[For every $c in bb(C) \\ bb(Q)$ there is an equivalence of presentable $bb(C)$-linear DG categories 
#[#set math.equation(numbering: n => "(1.2)")
 $ D_c \( "Bun"_G \( X \) \) tilde.eq D_(- 1 \/ \( r c \)) \( "Bun"_(G^or) \( X \) \) . $ <intro:equivalence>]

 The construction uses the given global forms and all connected components. It is characterized by the localization–Whittaker comparison of Section 13, including its compatibility with families of marked points and their collisions. It also intertwines central torsor actions with the corresponding transgression local systems.]
] <thm:main>

The normalization (1.1) is the shifted-level convention of [6] Section 1.1.5, Conjecture 1. In particular, Theorem 1 gives its unramified de Rham equivalence in the irrational range. The localization comparison and the central compatibility are part of the construction: they identify the functor as the quantum Langlands correspondence. Their definitions and formulas appear with the functors they concern in Section 13.

=== 1.1 Context and prior work <context-and-prior-work>

Geometric Langlands relates sheaf-theoretic categories on a bundle stack to categories built from local systems for the dual group. Its quantum form compares twisted $D$-module categories at inverse shifted levels. The gauge-theoretic interpretation through electric–magnetic duality, developed by Kapustin and Witten [28], explains the appearance of the dual root datum and reciprocal parameter. An early formulation of the quantum deformation, attributed there to Drinfeld, appears in Stoyanovsky’s inverse-parameter conjecture for twisted $D$-module categories [35] Section 1.3, Conjecture 2. The formulation in terms of local categories, localization, and Whittaker coefficients is developed in Gaitsgory’s quantum Langlands program [19].

Several established results supply the local and classical parts of the argument. Feigin–Frenkel duality identifies principal $W$-algebras at inverse shifted levels [15]. Arakawa–Frenkel identify the reductions of Weyl modules and their coweight twists, including concentration and simplicity at irrational level [1]. Raskin’s categorical form of Drinfeld–Sokolov reduction gives a precise renormalized $W$-module category and generalized vacuum objects [32]. The fundamental local equivalences of Campbell–Dhillon–Raskin give the required irrational-level point categories for the actual global forms [9]. Gaitsgory’s local/global Whittaker comparison supplies the bridge between the affine Grassmannian and global pole models, also over multipoint parameter schemes [22].

On the global side, the proof of ordinary geometric Langlands provides the spectral description of the tempered category and its enhanced Whittaker–Poincaré comparison [24,2,8,3,25]. The arbitrary-level localization and unipotent-period constructions of [2] supply further inputs. In Sections 10–12 we construct the period comparison with the finite levels, arbitrary Grassmannian tests, and moving-point operations needed below. Drinfeld–Gaitsgory’s finiteness and constant-term results and Gaitsgory’s miraculous duality furnish the categorical and geometric framework for our twisted duality [11,13,20]. Lin’s comparison of Poincaré series with miraculous duality supplies the ordinary-level geometric maps that we deform [30].

Recent work of Bogdanova constructs a quantum Langlands functor in the Betti setting and specifies its central compatibility through 2-Fourier–Mukai duality [6]. Her work on quantum Whittaker nonvanishing also makes explicit the finite local averaging diagram used in our argument [5]. The two further mechanisms developed here are a weight argument controlling filtered deformation of a global kernel, and an extension argument turning local pairings into coherent comparisons across collisions.

=== 1.2 The two main comparisons <the-two-main-comparisons>

Localization takes representations of loop Lie algebras to twisted $D$-modules on the bundle stack and is a quotient functor. We first compare the two sides on localized objects, using local pairings and a global period identity. The quotient property then produces a functor between the bundle categories; two global Whittaker identities provide its left and right inverses. We explain the two main inputs to this construction.

The first concerns global Whittaker coefficients. For a group $H$ and a determinant exponent $s$, let $R_s$ denote the coefficient functor with arbitrary moving sets of allowed poles. Its target remembers the nondegenerate unipotent character, as well as the pole positions. Pairing with the opposite character and applying the twisted pseudo-identity produces a Poincaré functor $J_s$. We construct a comparison and prove that it is an isomorphism:

#[#set math.equation(numbering: n => "(1.3)")
 $ J_s R_s arrow.r "Id" #h(2em) \( s in.not bb(Q) \) . $ <intro:plancherel>]

This comparison is defined on the entire twisted $D$-module category. Its ordinary-level counterpart has an anti-tempered remainder. A fixed finite Whittaker test annihilates that remainder and is conservative at irrational exponent. It therefore suffices to prove that the tested kernel cone vanishes after deformation.

Finite pole bounds and finite diagrams of marked-point maps give finite approximations to this cone. We express them by ordinary geometric complexes with a universal Kummer local system of monodromy $q$; Fourier transform in auxiliary affine lines then introduces the exponential characters. Quasi-unipotent monodromy makes cohomology ranks and transition-map ranks constant away from roots of unity. The passage to the colimit requires a further argument. Compatible logarithm variations and a uniform upper weight bound imply that each cohomology generator in the completion at $q = 1$ is killed by a finite transition. Constancy of transition ranks then gives the same vanishing at every non-torsion $q$, hence at every irrational exponent. Ordinary geometric Langlands supplies the cohomological bound used to make the weights uniform. Section 5 proves the deformation principles; Section 6 applies them to the tested kernel cone.

The second comparison concerns local categories over families of points. For $G$ and $G^or$, convolution followed by Drinfeld–Sokolov reduction pairs a positive-loop-equivariant Kac–Moody module with a Whittaker object on its affine Grassmannian. At a single point, inverse-level $W$-algebra duality identifies reductions with the representation and modification labels exchanged. To use these pairings globally, one needs maps over the whole parameter scheme, including collision diagonals, together with their insertion and factorization compatibilities. We construct the two pairings with a common $W$-module target and continuous relative right adjoints. On each configuration stratum, the cohomology of the semisimple group makes the adjunction units isomorphisms through degree two on heart objects. Maps between heart objects can therefore be recovered from their images in the common target. Restriction across a collision divisor has amplitude $\[ 0 \, 1 \]$; the recovered maps identify its boundary epimorphisms, extending the equivalence of hearts across the divisor. Realization and the adjunctions give the equivalence of DG categories. A separate extension argument, using translation of the marked points and the horizontal vacuum, identifies the pairings with both slots inserted. Sections 7–9 carry out these steps.

=== 1.3 Organization and the global period comparison <organization-and-the-global-period-comparison>

The category-theoretic setup begins in Section 2. Irrational inertia weights eliminate sufficiently unstable Harder–Narasimhan strata. This reduces the relevant bundle categories to quasi-compact opens and allows ordinary categorical duals to be used. Section 3 proves twisted pseudo-identity using compactifications, adjunctions, and the Levi boundary of the diagonal. Section 4 fixes the Whittaker models and their dual pairings.

After the two main comparisons, Sections 10–12 identify unipotent periods with integrated reduction complexes (Theorem 47). The proof keeps the determinant lines, finite-level shifts, and moving-point operators throughout. Ran integration contracts the added point variables and turns the local pairing comparison into a global period identity.

Section 13 assembles the equivalence through the localization quotient, using the period identity and the two instances of (1.3). It also derives the exchange of components and central characters and the coherent action of central torsors.

== 2 Twists, boundedness, and categorical duality <sec:foundations>

The kernel calculations below take place in categories of all twisted $D$-modules on bundle stacks. Their two necessary foundations are a precise choice of twist and a finiteness statement: at the irrational exponents in question, restriction to a suitable quasi-compact open is an equivalence. We establish these facts first, and then explain the resulting kernel formalism, including its renormalized evaluation pairing.

=== 2.1 Root data, determinant lines, and level conventions <root-data-determinant-lines-and-level-conventions>

All groups retain their given root data. Fix dual pinnings and a theta characteristic $theta.alt$ on $X$, together with an isomorphism $theta.alt^(⊗ 2) tilde.eq Omega_X$. For a connected reductive group $H$ write

$ Y_H = "Bun"_H \( X \) \, #h(2em) L_H \|_E = det R Gamma \( X \, frak(h)_E \) . $

Thus $det H^1$ occurs with exponent $- 1$. Write $rho_H$ for the half-sum of positive #emph[coroots], and put $P_0 = theta.alt^(2 rho_H)$, regarded as an $H$-bundle through its torus reduction. This uses the integral cocharacter $2 rho_H$ and makes sense for the actual group $H$. In Grassmannian constructions we rigidify the determinant line by replacing $L_H$ with $L_H ⊗ \( L_H \|_(P_0) \)^(- 1)$. A constant line does not change the sheaf of twisted differential operators. When tensoring by integral powers, either rigidification gives the same formula after retaining the corresponding constant one-dimensional factor.

For a line $L$ on a smooth stack $Y$ and $s in bb(C)$, write $D \( L^s \)$ for the presentable DG category of twisted $D$-modules. Here is the sign convention. On a smooth scheme, if a frame $e$ is replaced by $a e$, the local differentiation operator changes by $- s thin d log a$. Equivalently, on the frame torsor of $L$ we impose strong Kummer equivariance with the connection

#[#set math.equation(numbering: n => "(2.1)")
 $ d - s thin d log t \, #h(2em) q = exp \( 2 pi i s \) . $ <foundations:kummer>]

The associated de Rham local system has monodromy $q$. On stacks these categories and their functors are defined by strong derived descent. The opposite twist is $L^(- s)$. Sums of twists use the tensor product of frame torsors, or equivalently their ratio torsor; these conventions also apply on singular auxiliary stacks by smooth descent and Kashiwara’s lemma.

We use sheaf conventions for operations: $omega_Y$ is the unit of $⊗^(!)$, $k_Y$ is the constant object, and a lower star denotes de Rham direct image. To express calculations with left $D$-modules on smooth $Y$, write $M^(chevron.l Y chevron.r)$ for the object corresponding to the left module $M \[ dim Y \]$. In particular,

$ cal(O)_Y^(chevron.l Y chevron.r) = omega_Y . $

Inside these brackets, $!$-pullback is left crystalline pullback without an additional shift. The convention descends to smooth stacks, with their stack dimension. The exponential object of phase $phi.alt$ is the left connection $d + d phi.alt$ in this dualizing normalization. All tensor products, functors, and mapping complexes are derived. Categories are cocomplete and $bb(C)$-linear; functors between them are continuous unless an adjoint or a partially defined functor is explicitly specified.

We now translate the shifted level of the problem into the four categories used in the proof. Use the basic invariant forms $"Kil" \/ \( 2 h^or \)$ and $"Kil"^or \/ \( 2 caron(h)^or \)$. Their inverse forms give long roots, respectively long coroots, squared length $2$. Thus inverse shifted forms have scalar parameters $a \, d$ related by $d = 1 \/ \( r a \)$, where $r$ is the lacing number. Set

#[#set math.equation(numbering: n => "(2.2)")
 $ a = - c \, #h(2em) d = frac(1, r a) = - frac(1, r c) \, #h(2em) k_a = a - h^or \, #h(2em) k_d = d - caron(h)^or . $ <foundations:levels>]

Our notation is

#[#set math.equation(numbering: n => "(2.3)")
 $ A & = D #scale(x: 120%, y: 120%)[\(] L_G^(- k_a \/ \( 2 h^or \)) #scale(x: 120%, y: 120%)[\)] \, & A' & = D #scale(x: 120%, y: 120%)[\(] L_G^(k_a \/ \( 2 h^or \)) #scale(x: 120%, y: 120%)[\)] \,\
B' & = D #scale(x: 120%, y: 120%)[\(] L_(G^or)^(- k_d \/ \( 2 caron(h)^or \)) #scale(x: 120%, y: 120%)[\)] \, & B & = D #scale(x: 120%, y: 120%)[\(] L_(G^or)^(k_d \/ \( 2 caron(h)^or \)) #scale(x: 120%, y: 120%)[\)] . $ <foundations:four-categories>]

In the convention of [6] Section 1.1.5, a shifted level $c$ means the exponent $\( c - h^or \) \/ \( 2 h^or \)$. Since

$ - frac(k_a, 2 h^or) = frac(c - h^or, 2 h^or) + 1 \, $

tensoring by $L_G$ identifies the source category in that convention with $A$. Its target at shifted level $- 1 \/ \( r c \)$ is exactly $B$. This is an integral translation by the determinant line; it requires neither a square root of that line nor divisibility of the basic form in the lattice of integral levels. Because $c in.not bb(Q)$, all four exponents in (2.3) are irrational.

We retain all connected components:

#[#set math.equation(numbering: n => "(2.4)")
 $ pi_0 \( Y_H \) = pi_1 \( H \) = X_(*) \( T_H \) \/ bb(Z) Phi_H^or . $ <foundations:components>]

In particular, modification labels and dual weights always belong to the lattices of the specified groups. For semisimple $H$, its finite centre acts trivially on $L_H$, since the adjoint representation has trivial central action. Central inertia therefore gives the usual decomposition into character sectors. These components and sectors are retained by the constructions below.

=== 2.2 An irrational twist cuts off the unstable directions <an-irrational-twist-cuts-off-the-unstable-directions>

We prove the boundedness statement in a form that also applies to the Levi subgroups occurring later. Let $H$ be connected reductive and let $V$ be a finite-dimensional self-dual representation. Put

$ L \( V \) \|_E = det R Gamma \( X \, V_E \) \, #h(2em) Q \( z \, w \) = "Tr"_V \( z w \) . $

Assume that $Q$ is positive definite on the real cocharacter space. For a degree $u in pi_1 \( H \)$ its rational image has a unique representative $u_(upright("cen")) in X_(*) \( Z \( H \)^0 \) ⊗ bb(Q)$. We write $Q \( z \, u \)$ for $Q \( z \, u_(upright("cen")) \)$ when $z$ is central.

#thm([Lemma 2.1.])[
  (Inertia vanishing).  #emph[Let $Z$ be an algebraic stack carrying a line $L$. Suppose a central $bb(G)_m$ in its inertia acts on $L$ with a fixed nonzero integral weight $m$. If $s m in.not bb(Z)$, then $D_Z \( L^s \) = 0$. The assertion remains valid after restricting to a locally closed substack and after taking a product with a spectator stack carrying any external twist.]
] <foundations:inertia>

#proof[
  Pull an object to the frame torsor of $L$. The weighted scaling of the frame supplied by the inertial $bb(G)_m$ is $2$-isomorphic to the projection. Strong Kummer equivariance consequently identifies the two pullbacks of the object to the product with $bb(G)_m$, one with a constant factor and the other with the Kummer factor of exponent $s m$. On a smooth chart, apply de Rham direct image along $bb(G)_m$. The nonintegral Kummer factor has zero de Rham cohomology. For example, in the Laurent-polynomial de Rham complex its differential has eigenvalues $n - s m$ on $t^n$, all invertible. The constant factor has the nonzero finite complex $H_(upright("dR"))^bullet \( bb(G)_m \)$, containing $bb(C)$ as a summand. Tensoring with that complex detects zero, even for unbounded complexes. Hence the pullback object vanishes. Smooth pullback and frame-torsor pullback are conservative. The calculation leaves all spectator factors unchanged. ◻
]

#thm([Proposition 2.2.])[
  (Bounded support in the categorical sense).  #emph[For $s in.not bb(Q)$, the category $D_(Y_H) \( L \( V \)^s \)$ vanishes on every component of nontorsion degree. There is a quasi-compact open $j : U arrow.r.hook Y_H$, contained in the union of the torsion-degree components, such that 
#[#set math.equation(numbering: n => "(2.5)")
 $ j^(!) : D_(Y_H) \( L \( V \)^s \) arrow.r^(med tilde.op med) D_U \( L \( V \)^s \) $ <foundations:cutoff-equivalence>]

 with inverse $j_(*)$. The same open works for $- s$, and the equivalence persists after taking a product with any spectator stack and any external twist there.]
] <foundations:cutoff>

#proof[
  First suppose that $u$ has nonzero rational image. Nondegeneracy on the centre gives an integral central cocharacter $z$ with $Q \( z \, u \) eq.not 0$. Decompose $V$ into its central weight spaces. Riemann–Roch gives the weight of $z$ on $L \( V \)$ as
  #[#set math.equation(numbering: n => "(2.6)")
   $ sum_mu mu \( z \) chi \( X \, V_(mu \, E) \) = Q \( z \, u \) . $ <foundations:rr-weight>]
  The term involving $1 - g \( X \)$ is zero because $V$ is self-dual. The right side is an integer, being the weight of an algebraic $bb(G)_m$-action on a line. Lemma 2 proves the first assertion, including its restriction to any locally closed bundle condition in that component.
  Now fix a torsion degree. We use the characteristic-zero Harder–Narasimhan theorem for principal bundles: canonical parabolic reductions describe the strata, the HN types form a discrete set with bounded denominators, and bounded HN regions admit quasi-compact open neighbourhoods. The associated bundle of a semistable Levi bundle under a representation on which the connected centre acts by a character is semistable. These are the forms of the reduction and vanishing results recalled in [12] Sections 7.3–7.4 and 10.1. Write $nu$ for the dominant rational HN coweight. Its central component is zero because the degree is torsion. Put
  $ b_X = max { 0 \, 2 g \( X \) - 2 } . $
  We claim that the twisted category on its stratum vanishes whenever $alpha_i \( nu \) > b_X$ for some simple root $alpha_i$.
  Let $Q_i$ be the maximal standard parabolic obtained by omitting $alpha_i$, and let $M_i$ be its Levi subgroup. The canonical parabolic of $nu$ is contained in $Q_i$. Projecting the canonical reduction to $M_i$ identifies the HN stratum with a stack of unipotent extensions over the corresponding HN stratum of $Y_(M_i)$. Filter the unipotent radical of $Q_i$ by height in $alpha_i$. Each vector-group quotient, with its filtration induced by the canonical reduction inside $M_i$, has semistable associated graded pieces whose slopes are root evaluations $beta \( nu \)$. Every such root $beta$ contains $alpha_i$ with positive coefficient; dominance therefore gives
  $ beta \( nu \) gt.eq alpha_i \( nu \) > 2 g \( X \) - 2 . $
  Serre duality and semistability imply $H^1 = 0$ for every piece, hence for each successive extension bundle. Riemann–Roch then makes the ranks of $H^0$ constant on the fixed stratum. Consequently these extension stacks are, locally in families, successive classifying stacks of smooth unipotent groups. The section of split extensions is a smooth surjective cover in the sense of stacks.
  Choose a positive integral multiple $z$ of the $i$th fundamental coweight, in the semisimple span, that belongs to $X_(*) \( T_H \)$. It is central in $M_i$. On the split section, the determinant filtration identifies $L \( V \)$ with the determinant line for the restricted $M_i$-representation. Formula (2.6) now gives its $z$-weight as $Q \( z \, nu \)$. This is strictly positive: on each simple factor the trace form is a positive multiple of the basic form, and the inverse Cartan matrix has strictly positive entries. The dominant coweight $nu$ is nonzero on the factor containing $alpha_i$. Lemma 2 thus kills the pullback to the split section, and smooth descent kills the whole HN stratum. The proof also kills its restriction to any locally closed substack.
  The remaining HN types satisfy $0 lt.eq alpha_i \( nu \) lt.eq b_X$ for every simple root. Their central part is zero, so they lie in a bounded region. Bounded denominators make their number finite. There are only finitely many torsion degrees in $pi_1 \( H \)$. Choose a quasi-compact HN open $U$ containing all these types. On the complement, restriction to every HN stratum vanishes. To pass from strata to arbitrary objects, work on each bounded open in the HN exhaustion: its complement of $U$ has a finite HN stratification, and the localization triangles show successively that its twisted category is zero. The exhaustion detects objects, so the same holds on the full complement. The localization triangle for $j$ then proves (2.5), with inverse $j_(*)$. All arguments commute with an external spectator and use only the nonintegrality of a nonzero integer times $s$; they apply unchanged to $- s$. ◻
]

The assertion is about $!$-restriction of categories. It makes no set-theoretic claim about closures of supports of the underlying complexes. For the simple groups in the main theorem one takes $V = frak(h)$. For a Levi subgroup, the restriction of the original adjoint representation supplies a self-dual representation with positive trace form, including on the Levi centre.

=== 2.3 Operations with compatible twists <foundations:operations>

A QCA stack is a quasi-compact algebraic stack with affine automorphism groups; our stacks are locally of finite type over $bb(C)$. We use the $D$-module formalism of [11]: compact generation, categorical duality, and renormalized de Rham direct image with base change and the projection formula. A quasi-compact morphism is safe when the neutral components of the automorphism groups in its geometric fibres are unipotent. Safe direct image agrees with ordinary de Rham $*$-image and is continuous; schematic quasi-compact morphisms are examples [11] Sections 9–10.

For correspondences with compatible twists the same formulas apply. Compatibility identifies the relevant pullbacks of frame torsors, or trivializes their ratio when twists are added. Pulling to these torsors reduces $!$-base change, the $!$-tensor projection formula, and continuity of safe direct image to the ordinary formulas. Their natural identifications commute with frame scaling, so they descend with the specified Kummer equivariance. This also explains why one must retain the compatibility of lines throughout a correspondence.

We use the six operations on locally holonomic objects wherever they are defined. In particular, for schematic separated finite-type maps, shriek direct image on holonomic arguments is the partial left adjoint to $!$-pullback, with the adjunction tested against arbitrary $D$-modules. This assertion and Verdier duality, which negates the twist, can be checked on smooth charts. Riemann–Hilbert is used only for regular holonomic objects, again on charts; Kummer connections are regular singular. For a smooth map $q$ of relative dimension $e$, our convention is $q^(*) = q^(!) \[ - 2 e \]$.

=== 2.4 Compact generation and opposite-twist duality <compact-generation-and-opposite-twist-duality>

The cutoff has reduced our bundle categories to smooth QCA stacks. We record explicitly why twisting preserves the finiteness and kernel statements needed later.

#thm([Proposition 2.3.])[
  #emph[Let $Y$ be a smooth quasi-compact open in a bundle stack as above, and let $tau$ be a determinant-line twist. Then $D_tau \( Y \)$ is compactly generated. On every smooth finite-type scheme chart, the pullback of a compact object has bounded coherent cohomology. For two such stacks and twists, external tensor product induces an equivalence 
#[#set math.equation(numbering: n => "(2.7)")
 $ D_(tau_1) \( Y_1 \) ⊗ D_(tau_2) \( Y_2 \) arrow.r^(med tilde.op med) D_(tau_1 plus.square tau_2) \( Y_1 times Y_2 \) . $ <foundations:kunneth>]

 The ordinary categorical dual of $D_tau \( Y \)$ is $D_(- tau) \( Y \)$, with evaluation and coevaluation 
#[#set math.equation(numbering: n => "(2.8)")
 $ \( M \, N \) mapsto Gamma_(upright("dR"))^(upright("ren")) \( Y \, M ⊗^(!) N \) \, #h(2em) Delta_(*) omega_Y . $ <foundations:evaluation>]

 The twist on the diagonal is canonically trivial. These assertions remain valid for the full bundle categories reduced by Proposition 3.]
] <foundations:categories>

#proof[
  #emph[The induction adjunction.] We first specify the underlying quasi-coherent complex of a twisted object. Write $tau = s thin d log L$ and let $P = L^times arrow.r Y$ be the frame torsor. An object $N in D_tau \( Y \)$ is represented on $P$ by a strongly Kummer-equivariant D-module. Forgetting its connection in the normalized left-module convention turns the Kummer connection $d - s thin d log t$ into the trivial line with its multiplicative frame $1$. In this normalization, smooth $!$-pullback induces ordinary pullback of the underlying quasi-coherent complexes, with no remaining dimension shift. Its equivariance isomorphisms therefore give ordinary quasi-coherent descent along $P arrow.r Y$, including the descent coherences. Denote the result by $N^(upright("oblv"))$. This operation is conservative and preserves colimits. It retains the equivariance maps, rather than replacing them by identity maps; in particular it retains their infinitesimal isotropy actions.
  If $Y$ has dimension $d$ and canonical line $omega_Y^(upright("can"))$, this normalization is right-module oblivion tensored with $\( omega_Y^(upright("can")) \)^(- 1) \[ - d \]$ on line-trivializing charts. We will construct $"Ind"_tau$ on $"Perf" \( Y \)$ with the adjunction
  #[#set math.equation(numbering: n => "(2.9)")
   $ "RHom"_(D_tau \( Y \)) \( "Ind"_tau \( F \) \, N \) tilde.eq R Gamma \( Y \, F^or ⊗ N^(upright("oblv")) \) . $ <foundations:induction-adjunction>]
  Since perfect complexes compactly generate $"QCoh" \( Y \)$, this formula will give compact generators for $D_tau \( Y \)$. Its external-product compatibility will give Künneth. We verify the evaluation pairing separately after these constructions.
  #emph[Presentations and induction.] The bounded Quot construction presents $Y$ as a quotient of a smooth finite-type scheme by a product of general linear groups. Indeed, a faithful representation bounds the associated vector bundles; after a uniformly large twist they have vanishing $H^1$ and are generated by global sections. Framing those sections gives a scheme atlas. Reductions of structure group are representable by schemes of sections because the quotient by the reductive subgroup is affine. We can therefore choose a smooth presentation $p : Z arrow.r Y$ which is a torsor for such a product.
  Here is the twisted induction construction on this presentation. It is the relative Lie-algebroid construction of [11] Section 6.3, especially Lemmas 6.3.15–6.3.16, with the lift of the relative action to the twisting line retained. For a smooth schematic chart $T arrow.r Y$, let $A_T = T_(T \/ Y)$ be the relative tangent Lie algebroid, with its anchor to $T_T$. Relative differentiation lifts $A_T$ to the Atiyah algebroid of the pulled-back line, and hence to its twisted differential operators $cal(D)_T^tau$. Explicitly, if $a in A_T$ has anchor $v_a$ and its lift acts on a local frame $e$ by $b_a e$, the resulting operator is $v_a + s b_a$. Under $e' = f e$ one has $b'_a = b_a + v_a \( log f \)$, while the differentiation generator changes by $- s v_a \( log f \)$; the operator is therefore independent of the frame. For $F in "Perf" \( Y \)$ define the chart expression
  #[#set math.equation(numbering: n => "(2.10)")
   $ "Ind"_tau \( F \) \|_T = (cal(D)_T^tau ⊗_(U \( A_T \))^L F_T)^(chevron.l T chevron.r) . $ <foundations:induction>]
  Here $F_T$ has the canonical relative connection coming from its pullback from $Y$, and $U \( A_T \)$ denotes the enveloping algebra. If the anchor has a kernel, that kernel is retained: its action on the twisting line supplies the corresponding scalar action in $cal(D)_T^tau$. Trivializing the line on $T$ does not discard this isotropy action.
  For a smooth map $T' arrow.r T$ over $Y$, the relative tangent algebroid $A_(T')$ is the inverse-image algebroid. Resolve first in $T_(T' \/ T)$ using its relative Spencer complex. The result is precisely the transfer bimodule for smooth pullback applied to (2.10). Resolving successively for two smooth maps gives the same comparison, by associativity of transfer tensor products. Thus the chart objects and their comparisons descend. This argument remains valid when an anchor has a kernel: after smooth base change by $Z arrow.r Y$, it is the relative differentiation along ordinary smooth morphisms over $Z$, with its descent data.
  At zero twist, the induction used here is the induction of [11] Section 6.3.21 applied, in its IndCoh normalization, to $F ⊗ omega_Y^(upright("can")) \[ d \]$. For example, on $B H$ one has $d = - dim H$ and $omega_(B H)^(upright("can")) = det frak(h)$. At zero twist these factors cancel the $det \( frak(h)^or \) \[ dim H \]$ in the atlas formula of [11] Section 6.4.8; (2.10) then gives precisely derived $frak(h)$-coinvariants on the point atlas. The relative-algebroid construction uses the same normalization at nonzero twist.
  #emph[The adjunction, including unbounded coefficients.] The Spencer resolution and enveloping-algebra adjunction on charts give the desired formula (2.9) locally. We explain the descent assertion implicit here. Restricting $N \|_T$ to $A_T$ gives the relative connection on the pullback of $N^(upright("oblv"))$, with its derived descent homotopies. The twist is canonically split along these relative derivatives. The mapping complex is consequently the totalization, over the smooth faces of the Čech nerve of $p$, of the corresponding relative de Rham complexes with coefficients in $F^or ⊗ N^(upright("oblv"))$.
  This totalization works for unbounded coefficients as well. Put $E = p_(*) Omega_(Z \/ Y)^bullet$ and $p_n : Z^(\[ n \]) = Z^(times_Y \( n + 1 \)) arrow.r Y$. The product formula for relative forms and the affine projection formula give, for any coefficient complex $M$,
  $ R p_(n \, *) #scale(x: 120%, y: 120%)[\(] Omega_(Z^(\[ n \]) \/ Y)^bullet ⊗ p_n^(*) M #scale(x: 120%, y: 120%)[\)] tilde.eq E^(⊗^L \( n + 1 \)) ⊗^L M . $
  The cofaces insert the unit of $E$. The invariant Reynolds functional on regular functions of the group, extended by zero on positive-degree forms, gives a chain map $E arrow.r cal(O)_Y$ splitting the unit. Left and right invariance make it independent of torsor trivializations. Applying this retraction in the first tensor factor contracts the augmented tensor-power diagram. Tensoring this explicit contraction with any coefficient complex proves the asserted unbounded totalization formula: the homotopy lowers cosimplicial degree by one, so it acts on the product totalization without an infinite sum. It contracts the augmented diagram, not the individual de Rham complex of the group.
  The forgetful functor is conservative and preserves colimits. Perfect complexes compactly generate $"QCoh" \( Y \)$ on these smooth quotient stacks, and their external products generate on products [11] Sections 3–4. Formula (2.9) therefore makes the induced perfects compact generators of $D_tau \( Y \)$. Their finite Spencer resolutions on charts consist of coherent $cal(D)_T^tau$-modules. They therefore have bounded coherent cohomology on each smooth finite-type chart. Finite cones and retracts preserve this property, so it holds for all compact objects. Induction commutes with external products. Applying (2.9) to external perfects, together with the quasi-coherent Künneth formula, proves full faithfulness on compact generators in (2.7); these generators also generate the target. Hence (2.7) is an equivalence.
  #emph[The evaluation pairing.] For an untwisted QCA stack, the evaluation is renormalized de Rham cohomology and the coevaluation is $Delta_(*) omega_Y$ [11] Sections 8.4 and 9.1. For opposite twists use the same two formulas, with the ratio line trivialized on the diagonal. To check either triangle identity, pull the output leg to a smooth chart on which the output twisting line is trivialized. Base change replaces the diagonal by the graph of the chart, and the projection formula cancels the two twists along this graph. The remaining expression is the untwisted graph calculation. The graph is schematic and safe, so its renormalized image is its ordinary star image and the composite is the identity. These identifications descend, since they use only the canonical diagonal trivialization. This proves (2.8).
  #emph[Return to the full bundle stack.] Transport compact generation and duality across (2.5). The spectator version of that equivalence identifies products and diagonal kernels, so the same formulas apply. The renormalized pairing may equivalently be computed on the common cutoff open; it is independent of enlarging that open. For local coherence, one need not assert that an arbitrary open star image preserves coherence. Given a finite-type smooth chart of $Y_H$, choose a larger quasi-compact HN open $V$ containing both its image and $U$. The same cutoff argument gives $D_tau \( V \) tilde.eq D_tau \( U \)$. A compact object is thus compact on $V$, where the preceding Spencer argument proves its coherence on the chosen chart. This proves local coherence on the full stack. ◻
]

In particular, $A'$ and $B'$ realize the ordinary categorical duals of $A$ and $B$. Formula (2.8) still uses the star-diagonal kernel. The shriek-diagonal kernel $Delta_(!) k_Y$, which defines pseudo-identity, is a separate object; proving that it gives an equivalence is the next step.

== 3 Twisted pseudo-identity <sec:pseudoidentity>

The ordinary and extraordinary diagonal kernels play different roles in the argument. The former represents categorical duality, as established in Section 2; the latter must itself define an equivalence. We prove this by combining parabolic adjunctions with a compactification of the diagonal. The essential additional point at an irrational twist is that central inertia removes every boundary stratum with nonzero defect.

Let $H$ be a connected reductive group, let $V$ be a self-dual representation whose trace form $Q$ is positive definite on the real cocharacter space, and put $L_H = det R Gamma \( X \, V_E \)$. Restrictions of $V$ will define the corresponding lines for Levi subgroups. Write

$ cal(C)_H = D \( L_H^s \) \, #h(2em) cal(C)'_H = D \( L_H^(- s) \) \, #h(2em) s in.not bb(Q) . $

The duality of Section 2 identifies $\( cal(C)'_H \)^or$ with $cal(C)_H$. The line ratio on the diagonal is canonically trivial. Consequently the kernel $Delta_(!) k_(Y_H)$ defines a continuous endofunctor $F_H$ of $cal(C)_H$; its existence as a kernel uses that the diagonal is schematic and that $k_(Y_H)$ is locally holonomic.

#thm([Theorem 3.1.])[
  #emph[For every $H \, V \, s$ as above, the functor $F_H$ is an equivalence. The assertion holds on all components, including those on which the twisted category is zero, and also with $s$ replaced by $- s$.]
] <pseudo:equivalence>

We first establish parabolic adjunctions and their compatibility with $F_H$. The compactified diagonal will then show that the cone of the natural map $F_H arrow.r "Id" \[ - 2 dim Y_H \]$ has a finite filtration whose quotients factor through proper Levi categories. Induction handles objects obtained by Eisenstein series, while $F_H$ acts by a shift on objects whose proper constant terms vanish. These two cases generate the category and will prove the equivalence.

The geometric constructions are those of geometric Eisenstein series and second adjointness [7,13]. We include the twist and coherence arguments, since an adjunction only on holonomic objects would not suffice here.

=== 3.1 Parabolic correspondences and their compactifications <parabolic-correspondences-and-their-compactifications>

For the moment suppose that $H$ is semisimple. Fix a parabolic $P$, its Levi quotient $M$, an opposite $P^(-)$, and a torsion degree $u in pi_1 \( M \)$. Set $Y = Y_H$ and use the correspondence

$ Y_M^u arrow.l^(med q med) Y_P^u arrow.r^(med p med) Y . $

The weight filtration of $V$ associated to a cocharacter defining $P$ gives an identification $p^(*) L_H tilde.eq q^(*) L_M$. Normalize it to be the identity on split $M$-reductions. Use the same normalization for $P^(-)$. Define

$ C_P = q_(*) p^(!) \, #h(2em) E_P = p_(*) q^(!) \, #h(2em) e = dim \( q \) = \( g \( X \) - 1 \) dim N_P . $

The last equality uses that $u$ is torsion; it gives the same value for $P^(-)$. Primes on these functors will mean that they are taken at the opposite twist.

Here $p$ is schematic, separated, and relatively quasi-compact, whereas $q$ is smooth, relatively quasi-compact, and safe. A positive grading of $N_P$ presents $q$, locally over the Levi stack, as successive fibrations of vector stacks. A vector-stack step has the form $\[ V^1 \/ V^0 \]$, with $V^i$ vector bundles coming from a two-term complex computing cohomology on $X$. There are no obstructions in degree two. This description has three useful consequences. First, the direct images defining $C_P \, E_P$ are continuous. Second, $q_(*)$ preserves local regular holonomicity. Third, the partial holonomic operations $q_(!)$ and $q^(*)$ have their actual adjunction property against arbitrary D-modules. For the last two assertions present each vector stack by its vector bundle: descent along the vector group is fully faithful by its de Rham acyclicity, and both assertions reduce to the schematic formulas. More explicitly, for $a : V^1 arrow.r \[ V^1 \/ V^0 \]$, the star image is computed using $a^(*)$ followed by the schematic star image; the holonomic shriek image uses $a^(!)$ followed by the schematic shriek image. The identities $a_(*) a^(*) tilde.eq "Id"$ and $a_(!) a^(!) tilde.eq "Id"$ follow from the corresponding ordinary and compactly supported cohomology of the vector-group fibers. This retains the shifts even when the vector stack has negative dimension. These reductions are compatible with smooth descent and with adding a spectator category.

Kernel duality gives

$ \( C'_P \)^or = E_P . $

Indeed both kernels are obtained from the diagonal unit by !-base change followed by the indicated safe direct image. Every calculation below may be made on quasi-compact open exhaustions; the boundedness result of Section 2 identifies the twisted categories of the bundle stacks with those on fixed quasi-compact opens. Thus this calculation uses ordinary categorical duals and does not introduce a co-category.

We will use the fine Drinfeld compactification

$ Y_P^u arrow.r^(med j med) tilde(Y)_P^u \, #h(2em) macron(q) : tilde(Y)_P^u arrow.r Y_M^u \, #h(2em) macron(p) : tilde(Y)_P^u arrow.r Y . $

Its points are generalized reductions with their Levi datum retained, and $macron(p)$ is schematic and proper. If the derived group is simply connected, this is the compactification by generically nondegenerate sections of the affine closure of $H \/ N_P$. The boundary is stratified by positive defects. On each stratum the saturated reduction is an actual $P$-bundle; its Levi bundle is related to the originally specified one by a positive modification. The map from the stratum to this Levi Hecke datum is the base change of the ordinary map from parabolic bundles to Levi bundles. The stratification is locally finite on quasi-compact substacks. These are the geometric compactification and stratification results of [7]; see also [34] Sections 3.2–3.3.

For completeness, the same statements hold for the actual global form of $H$. Choose a central extension $H_1 arrow.r H$ with torus kernel $D$ and simply connected derived group, and form the compactification upstairs. Central $D$-bundles act on all its data: each Plücker block transforms through its central character. Quotient by this action. Lifts of an $H$-bundle exist smoothly locally on the base. On geometric fibers this follows from the vanishing of the Brauer group of the smooth projective curve; infinitesimal lifting follows from the vanishing of degree-two coherent cohomology. Thus $Y_(H_1) arrow.r Y_H$ and the corresponding parabolic and Levi maps are torsors for $Y_D$ in this sense.

Fix a lift of the ambient degree and the original Levi degree downstairs. There is a unique compatible degree for its lift. To check this, use the exact sequence of maximal tori: two possible Levi lifting degrees differ by a cocharacter of $D$, and this cocharacter injects into $pi_1 \( H_1 \)$. The injectivity follows because $D$ meets the derived group in a finite subgroup. Compatibility of ambient degrees therefore forces the difference to vanish. Conversely the same sequence provides any compatible lift. Properness, schematicity, and the stratum description consequently descend. The descended Hecke base is the simultaneous central quotient of the upstairs Hecke base; its unipotent-extension fibers are unchanged. A nonzero defect changes the Levi degree nontrivially over $bb(Q)$: the simple coroots omitted from $M$ remain linearly independent in the quotient of the rational cocharacter space by the Levi coroot span. This rational statement, rather than a possibly enlarged integral defect monoid, is what we shall use.

=== 3.2 Boundary smoothness and cleanness <boundary-smoothness-and-cleanness>

On $tilde(Y)_P^u$ take the twist

$ \( macron(p)^(*) L_H ⊗ macron(q)^(*) L_M^(- 1) \)^s $

and the kernel $J = j_(!) omega_(Y_P^u)$ defined using its splitting over the open. We next prove two properties: $J$ is clean, and it has no nonzero characteristic covector pulled back from the Levi base. The second property allows us to tensor $J$ with arbitrary coherent Levi coefficients.

Here is the elementary analytic observation that will be used twice. Let $U subset Z$ be an open subset of a finite-type complex scheme, let $cal(L)$ be a local system on $U$, and let $j_(!) cal(L)$ be its extension by zero. A derivation of $cal(O)_Z$ preserving the ideal of $Z \\ U$ has local analytic flows preserving the pair $\( Z \, U \)$. To see this even when $Z$ is singular, embed it locally as a closed subscheme of a smooth scheme. Lift the derivation to the ambient local coordinates. Its preservation of the ideals of $Z$ and of the boundary makes the ambient flow preserve their analytic zero loci. Along a sufficiently small time disk, flow transport identifies the two pullbacks of $cal(L)$, and hence those of $j_(!) cal(L)$. These identifications commute with extraordinary pullback along a compatible map of pairs. On a smooth test scheme, a family of such fields spanning the tangent space therefore makes the pulled-back complex a local system: successive flows give local coordinates. Likewise every characteristic covector of the closed direct image annihilates each such field. This last assertion follows from the equality of characteristic variety and microsupport for regular holonomic D-modules [29] Theorem 11.3.3 and the local product description along the flow.

#thm([Lemma 3.2.])[
  #emph[Let $i_theta : S_theta arrow.r.hook tilde(Y)_P^u$ be a defect stratum, and let $f_theta : S_theta arrow.r B_theta$ be its Levi Hecke-data projection. Its twist is pulled back from $B_theta$, and there is a locally holonomic complex $K_theta$ on that base such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ i_theta^(!) J tilde.eq f_theta^(!) K_theta . $ <eq:M2>]

]
] <pseudo:fiber-descent>

#proof[
  The determinant filtration for the saturated reduction identifies the line ratio with the ratio of the two Levi determinant lines. This proves the assertion about twists. We first show smoothness on each geometric !-fiber of $f_theta$.
  Choose a point on the stratum, and a point $z in X$ outside its defect divisor. Shrink the parameter chart so that $z$ remains outside every defect. On the formal disk at $z$ the generalized reduction is actual. Choose a frame of this reduction, locally on a smooth chart; for any finite collection of Laurent principal parts only a finite jet of this choice is needed. Frames of that jet lift smoothly, and compatible higher jets exist by formal smoothness. In the central-extension construction take the same charts upstairs before descent.
  A Laurent element $eta in frak(n)_P \( \( t_z \) \)$ modifies the framed bundle infinitesimally by $1 + epsilon.alt eta$. Gluing on the punctured disk produces a first-order deformation of the generalized reduction, unchanged away from $z$. Since the data are actual near $z$, this gluing preserves their defining relations. A smooth scheme presentation $T' arrow.r tilde(Y)_P^u$ admits a local lift of this infinitesimal deformation to a derivation of $T'$; any chosen value differing by a relative tangent vector can be prescribed. The derivation preserves the boundary ideal. More explicitly, the defect incidence is unchanged away from $z$ and is empty near $z$. Its scheme image in the parameter space is therefore unchanged by the automorphism over $bb(C) \[ epsilon.alt \] \/ \( epsilon.alt^2 \)$ associated to the derivation. Formation of this image commutes with these flat pullbacks. This proves ideal preservation, not just preservation of boundary points.
  Fix the Levi Hecke datum and pull $T'$ back to the stratum fiber, obtaining $W$. The map from $W$ to that fiber is smooth, being a base change of the smooth presentation $T' arrow.r tilde(Y)_P^u$. The fiber itself is a smooth tower of vector stacks over a point. Thus $W$ is smooth, after a scheme presentation when necessary. The fields just constructed lift compatibly to $W$, because a modification by $N_P$ keeps the Levi modification fixed. Their values, together with relative presentation directions, span its tangent space. Indeed the non-presentation directions are deformations of a parabolic bundle with fixed Levi, hence are the image of $H^1 \( X \, \( frak(n)_P \)_(E_P) \)$. Principal parts at $z$ surject onto this space: for sufficiently large $n$, the exact sequence for $\( frak(n)_P \)_(E_P) subset \( frak(n)_P \)_(E_P) \( n z \)$ and Serre vanishing give the surjection. Its connecting map is precisely the gluing deformation above. The tangent-complex sequence supplies the remaining presentation directions, including the quotient by infinitesimal automorphisms.
  Trivialize the line-frame torsors locally analytically. The kernel $J$ is regular holonomic, and on the open it corresponds to a local system. The flow observation now shows that its !-pullback to $W$ is a local system. Changing a frame only tensors by a smooth Kummer local system, so does not alter this conclusion.
  It remains to turn fiberwise smoothness into descent. Each step of $f_theta$ is a vector-stack fibration. On a vector stack over a point, a smooth regular holonomic complex is constant, since both the vector space and the acting vector group are contractible. For one fibration apply the counit $f^(*) f_(*) arrow.r "Id"$ and test it on geometric !-fibers by !-base change. It is an isomorphism on each fiber and therefore globally. Repeat for the tower and use smooth descent. Since $f^(*)$ differs from $f^(!)$ by the smooth dimension shift, this gives (3.1). ◻
]

#thm([Lemma 3.3.])[
  #emph[The kernel $J$ is clean: $j_(!) omega tilde.eq j_(*) omega$ in the specified twist. Moreover, on a smooth Levi chart $S arrow.r Y_M^u$, choose a scheme presentation of $tilde(Y)_P^u times_(Y_M^u) S$ and a local closed embedding into a smooth scheme over $S$. The characteristic variety of the closed direct image of $J$ contains no nonzero covector pulled back from $S$.]
] <pseudo:clean-noncharacteristic>

#proof[
  For $theta eq.not 0$, simultaneous central inertia on the two Levi bundles of $B_theta$ acts on the determinant ratio with weight $Q \( z \, u_(upright("sat")) - u \)$. The degree difference is rationally nonzero, so positivity of $Q$ provides an integral central cocharacter $z$ for which this integer is nonzero. At exponent $s$ its Kummer parameter is not integral. The inertia vanishing test of Section 2 therefore kills the entire twisted category on this base, including any additional spectator. Under a central extension one may first multiply and lift $z$; the removed central directions act trivially on the ratio, so the test descends. Lemma 6 gives $i_theta^(!) J = 0$. Localization and the locally finite stratification prove cleanness. The same reasoning applies to the opposite twist and hence to the Verdier-dual kernel.
  For the characteristic assertion repeat the modification argument at $z$ with elements of the Levi loop Lie algebra. Prescribe their lifts first in $S$, then in the presentation of the compactification. These derivations again preserve the open and its boundary. Principal parts in the adjoint Levi bundle span its $H^1$, and the relative chart directions complete their images to a spanning set of $T_s S$. Extend the derivations in the chosen smooth ambient embedding. The flow observation shows that every characteristic covector annihilates them. A horizontal covector is pulled back from $T_s^(*) S$; annihilating fields whose projections span $T_s S$ forces it to be zero. This proves the assertion. ◻
]

#thm([Proposition 3.4.])[
  #emph[On degree $u$, the continuous functor $L_P = E_P \[ - 2 e \]$ is a left adjoint of $C_P$: 
#[#set math.equation(numbering: n => "(3.2)")
 $ L_P = E_P \[ - 2 e \] med tack.l med C_P . $ <eq:M1>]

 It computes the partially defined expression $p_(!) q^(*)$ on every object.]
] <pseudo:first-adjunction>

#proof[
  First let $E in cal(C)_M^u$ be compact, hence locally coherent by Section 2, and form
  $ J_E = J ⊗^(!) macron(q)^(!) E . $
  In the charts of Lemma 7, the second factor has horizontal characteristic covectors. The absence of nonzero horizontal covectors for the first factor is exactly the condition making the diagonal noncharacteristic for their exterior product. The noncharacteristic inverse-image theorem, including compatibility with duality [26] Theorems 2.4.6 and 2.7.1(ii), proves that $J_E$ is locally coherent and that Verdier duality commutes with this tensor product, up to the smooth dimension shift. The same calculation applies after closed direct image from the possibly singular presentation, by the projection formula.
  Both $J_E$ and its Verdier dual have zero !-restriction to the boundary, since this holds for $J$ and its dual. Hence $J_E$ is simultaneously the star and the extraordinary extension of its restriction to $Y_P^u$. Here extraordinary extension has its full partial-adjoint meaning: there are no maps from $J_E$ to an arbitrary object pushed from the boundary. We verify this for arbitrary targets using chartwise compactness and descent. On every affine scheme chart of the compactification, embed the chart as a closed subscheme of a smooth affine scheme. Its closed direct image of $J_E$ is bounded coherent, and hence compact in the D-module category of that smooth affine scheme. By Kashiwara equivalence, an arbitrary boundary object is a colimit of bounded coherent boundary-supported D-modules. Verdier duality and the vanishing of the boundary !-restriction of the dual of $J_E$ kill maps to each such coherent object. Compactness then kills maps to their colimit. Kashiwara equivalence identifies these with the mapping complexes on the original, possibly singular chart. Apply this argument also on scheme charts of every level of a smooth hypercover. Smooth descent expresses the stack mapping complex as the limit of these zero complexes, so it vanishes. This uses compactness only in smooth affine ambient charts; no global compactness of $J_E$ is required.
  Push by the proper map $macron(p)$. Using $q^(*) = q^(!) \[ - 2 e \]$, the simultaneous extension gives
  $ p_(!) q^(*) E tilde.eq p_(*) q^(!) E \[ - 2 e \] = L_P E $
  with its adjunction against every target object. Compact objects generate the Levi category. The functor on the right is continuous, so the same adjunction extends by colimits to every $E$. This proves (3.2). ◻
]

=== 3.3 Second adjointness with the determinant twist <second-adjointness-with-the-determinant-twist>

The first adjunction controls compact Eisenstein objects. We also need the opposite-parabolic adjunction, including its unit and counit, to control objects orthogonal to Eisenstein series.

#thm([Proposition 3.5.])[
  #emph[On the same torsion component there is an adjunction 
#[#set math.equation(numbering: n => "(3.3)")
 $ C_(P^(-)) med tack.l med E_P . $ <eq:M3>]

]
] <pseudo:second-adjunction>

#proof[
  Choose an integral cocharacter $lambda$ defining $P$. Use the smooth graph interpolation group $tilde(H)$ over $bb(A)^1$, with general fiber ordered as $\( g \, t^(- lambda) g t^lambda \)$ and special fiber $P^(-) times_M P$. The interpolation of bundle stacks is smooth over $bb(A)^1$, and its map to $bb(A)^1 times Y times Y$ is schematic of finite type; these are [13] Section 2.4 and Proposition 2.5.2. Let $T$ be the open substack obtained by retaining degree $u$ at the special fiber and all of the general fiber.
  The determinant-line ratio of the two ends has its canonical splitting for $t eq.not 0$. It extends across $t = 0$. Indeed its order there is locally constant, and the special fiber is connected: it is a tower of vector stacks over the connected $Y_M^u$. Test the order on split reductions, using the constant diagonal Levi subgroup. The order is the sum of the $lambda$-weights times Euler characteristics, namely $plus.minus Q \( lambda \, u \) = 0$. Smoothness of $T$ then extends the section as a nowhere-vanishing section. Its value at zero equals the parabolic splitting: their quotient is a unit, is constant along each vector-stack fiber, and equals one on the split section. The splitting is equivariant under dilation of the parameter. This holds away from zero, where inner conjugation identifies the induced bundle action with the identity, and hence holds everywhere.
  Push $omega_T$ to $bb(A)^1 times Y^2$ with this ratio splitting. The result is conic in the first factor. Its !-fiber at one is the identity kernel, and its !-fiber at zero is the kernel of $E_P C_(P^(-))$. The cospecialization map between these fibers supplies
  $ eta : "Id" arrow.r E_P C_(P^(-)) . $
  To specify the cospecialization and its continuity, on the conic axis use
  $ i_(1 \, *) i_1^(!) arrow.r "Id" arrow.l i_(0 \, *) i_0^(!) $
  and apply compactly supported image along $bb(A)^1$. Contraction makes the second arrow invertible. One can check this on holonomic conic objects by dualizing: the star extension from the punctured axis has zero compactly supported image. Pullback of a compact object from $\[ bb(A)^1 \/ bb(G)_m \]$ is holonomic, because its characteristic variety is the zero section off zero and has dimension at most one over zero. Continuous extension from these objects defines the construction on the conic category used here. It also tensors with any compactly generated spectator category, by compactness of the holonomic axis objects. In these !-fiber conventions cospecialization for a constant family is the identity.
  Define the counit
  $ epsilon : C_(P^(-)) E_P arrow.r "Id" $
  by restricting the kernel on $Y_P^u times_Y Y_(P^(-))^u$ to the open where the reductions are everywhere transverse. This open is $Y_M^u$; restriction followed by star image gives the arrow. The line identification there is the split-reduction identification.
  We verify the two triangular identities rather than infer them from an untwisted result. Precompose $eta$ with $E_P$. The family of kernels is then the fiber product $R = Y_P^u times_Y T$, with $Y_P^u$ on the input end. Include the general fiber and the everywhere-transverse locus of its special fiber in an open $R^o$. It is $bb(A)^1 times Y_P^u$: an extra reduction is a flag in $H \/ P$; its open orbit under the first projection of $tilde(H)$ has stabilizer identified by the second projection with the constant $P$. At zero this is the big orbit of $P^(-)$, and the graph of contracting conjugation on $P$ gives the identification across zero. The maps to the output $H$-bundle and input Levi bundle are constant on this product. So is their determinant splitting, since the two trivializations agree at zero and a unit is constant along an affine line. Restriction to $R^o$ identifies the unit followed by the counit with cospecialization of this constant family, which is the identity.
  For the other triangular identity use $T times_Y Y_(P^(-))^u$, with the parabolic factor on the output end. The second projection of $tilde(H)$ acts on the flags; on the corresponding open orbit its stabilizer is identified by the first projection with $P^(-)$. The open family is $bb(A)^1 times Y_(P^(-))^u$, with constant maps and constant line splitting. The same calculation gives the identity. All kernel operations here are safe, or are the holonomic partial operations described above; their extension with spectators and through open exhaustions is therefore legitimate. This proves (3.3). ◻
]

The two adjunctions interact with the extraordinary diagonal as follows:

#[#set math.equation(numbering: n => "(3.4)")
 $ C_(P^(-)) F_H tilde.eq F_M \( L'_P \)^or \, #h(2em) F_H E_(P^(-)) tilde.eq L_P F_M . $ <eq:M4>]

For the first identity apply $C_(P^(-))$ to the output factor of $Delta_(!) k_Y$. In the following calculation $p \, q$ are the maps for $P$. The expression $q_(!) p^(*)$ is the partial left adjoint of $E_P = p_(*) q^(!)$ on locally holonomic arguments, with its adjunction against arbitrary targets. Proposition 9 provides the genuine left adjoint $C_(P^(-))$; uniqueness of left-adjoint values identifies its value on this kernel with $q_(!) p^(*)$. Base change now gives $\( p \, q \)_(!) k_(Y_P^u)$. Applying $L'_P$ to the first factor of $Delta_(!) k_(Y_M^u)$ gives the same kernel, by (3.2). The second identity is its transpose at the opposite twist. Notice that $\( L'_P \)^or$ is the right adjoint of $E_P$. Thus (3.4) identifies actual continuous functors, not just their values on holonomic test objects.

=== 3.4 The boundary of the diagonal <the-boundary-of-the-diagonal>

The preceding identities deal with the Eisenstein part of the category. To complete the proof, we must show that the difference between $F_H$ and a shift of the identity is built from that part.

#thm([Proposition 3.6.])[
  #emph[For semisimple $H$, there is a natural transformation 
$ F_H arrow.r "Id" \[ - 2 dim Y \] $

 whose cone has a finite filtration with quotients factoring through constant term, a functor between Levi categories, and Eisenstein series for proper parabolics.]
] <pseudo:boundary-factorization>

#proof[
  We first describe the required compactification, including its properness for the given global form. The Vinberg semigroup $"Vin"_H$ is the affine Rees monoid of the enhanced group. Its parameter space is $T_(upright("ad"))^(+) tilde.eq bb(A)^("rk" H)$, with coordinates indexed by simple roots. It has matrices $h_mu$ in every representation of dominant highest weight $mu$ in the #emph[actual] weight lattice of $H$. Finitely many generators suffice. Cartan multiplication has no parameter factor, while the component of highest weight $nu$ in the product for $mu \, mu'$ is multiplied by $v^(mu + mu' - nu)$. The nondegenerate locus, where all the $h_mu$ are nonzero, is smooth over the parameter space; each fiber is homogeneous for $H times H$. At the standard point $c_P$, with coordinates one on Levi roots and zero on the other simple roots, the matrices are projections to $V_mu^(N_P)$, and their stabilizer is $P^(-) times_M P$. These forms of the Vinberg statements, including the smooth stabilizer family and standard section, are recalled in [13] Appendices C–D.
  Let $macron(Y)$ classify two $H$-bundles and a section of their associated Vinberg bundle which is generically nondegenerate on $X$, modulo the Cartan torus $T_H$. The parameter $v$ is constant on the complete curve. Write $b : macron(Y) arrow.r Y^2$ for the projection. Over $v in T_(upright("ad"))$ there is an open immersion $j_0$ and a finite étale $Z_H$-torsor $l : Y arrow.r "im" \( j_0 \)$: fixing $v = 1$ gives an isomorphism between the two bundles, with the residual central scaling. Thus $b j_0 l = Delta$.
  The map $b$ is representable and proper. Relative finite type follows by writing the finitely many regular matrix maps $h_mu$ and their equations. The torus acts freely relative to the two fixed bundles: all matrices are generically nonzero, and the dominant weights generate the character lattice. For the valuative criterion, fix extended bundles over a DVR. A torus torsor over its fraction field is trivial, so choose matrix data there. The minimum valuation $a \( mu \)$ of $h_mu$ at the generic point of the special curve is additive under Cartan multiplication. Indeed the Cartan product of two nonzero residue matrices is nonzero. Explicitly, let $A^(+) = xor.big_mu V_mu$ and $A^(-) = xor.big_mu V_mu^(*)$ be the two Cartan algebras, realized as coordinate rings of basic affine spaces for opposite Borel conventions. Inside their tensor product, the diagonal graded subalgebra is
  $ A = xor.big_mu \( V_mu ⊗ V_mu^(*) \) = xor.big_mu "End" \( V_mu \) . $
  Its product on two matrices $a_mu \, a_(mu')$ is $pi_(mu \, mu') \( a_mu ⊗ a_(mu') \) iota_(mu \, mu')$, where $iota$ and $pi$ are the normalized inclusion and projection of the Cartan component. This is exactly the matrix product in the Vinberg Cartan relation. The basic affine spaces are geometrically integral; hence the coordinate ring of their product and the displayed subalgebra are domains, also after extending to the residue function field. The nonvanishing assertion follows. Hence $a$ extends to an integral homomorphism from the actual weight lattice to $bb(Z)$, that is, a cocharacter of $T_H$. Rescale by its value on the uniformizer. Every matrix then has valuation zero and extends over the curve family; normality removes the remaining apparent poles of these bundle maps. The parameter coordinates are integral as well. For a simple root $alpha_i$, choose sufficiently large actual dominant weights $mu \, mu'$ so that the tensor product contains the component $mu + mu' - alpha_i$. In its product identity the left side is integral and the matrix of that component has valuation zero, forcing $v_i$ to be integral. The extended matrices are generically nonzero on the special curve. The rescaling is unique modulo $T_H$ over the DVR, which proves uniqueness in the valuative criterion and hence properness.
  Stratify $macron(Y)$ first by the parameter orbits, indexed by the finitely many standard parabolics for a fixed Borel. On the orbit of $c_P$ one may set $v = c_P$, retaining the residual $Z_M$ scaling. Refine by Levi degrees and defect. The base $B$ of a refined stratum consists of two Levi bundles and a positive modification between them, described by the closure $macron(M)$ of $M$ in the Levi blocks of the semigroup, modulo this residual scaling. The stratum is the pullback of
  #[#set math.equation(numbering: n => "(3.5)")
   $ q^(-) times q : Y_(P^(-)) times Y_P arrow.r Y_M times Y_M $ <eq:M5>]
  over $B$. For simply connected derived group this is the defect stratification in [34] Proposition 3.2.2. The following description verifies what we need without changing the global form.
  At the generic point of $X$, the homogeneous-orbit description produces the two parabolic flags. They extend over the curve by properness of the flag varieties. Every matrix factors through its Levi block because it does so generically; the remaining regular maps give exactly a $macron(M)$-modification. Conversely these data give the Vinberg section. In families, take actual positive multiples $mu_i$ of the fundamental weights for omitted simple roots. Their Levi blocks are lines. Stratify by lengths of the zero divisors of the generically rank-one matrix maps, and flatten those zero loci. On each piece the divisors are relative Cartier divisors. Divide out their equations: the resulting image lines and dual image lines recover the flags. Their ranks and Plücker relations, and all block factorizations, follow from the generically nondegenerate locus, which is schematically dense on the relative smooth curve. Passing to reduced strata suffices for D-modules. These finitely many weights embed the flag varieties; the remaining conditions concern only the modification. This constructs the claimed locally finite stratification with fibers (3.5).
  A nonempty defect divisor gives a nonzero rational difference of Levi degrees, by pairing with these Levi characters. Conversely, if all these divisors vanish, determinants of every Levi block are nonzero. Indeed powers of these determinants are Laurent monomials in the line characters, which span the rational character space; after clearing denominators these relations hold on the closure. Thus the modification lies in $M$ and has zero defect. This proves both implications used below.
  On $macron(Y)$ take the kernel
  $ J^b = \( j_0 \)_(!) l_(*) k_Y $
  with the ratio twist of its two ends and the diagonal splitting on the cover. Its !-restriction to a stratum is pulled back from $B$. We give the argument, since this assertion is the reason the degree vanishing test can be applied to this kernel. Choose $z in X$ where the section is nondegenerate. Trivialize the torus quotient locally and, by an étale torus rescaling, set all nonzero parameter coordinates equal to one. Frame the open-orbit datum at $z$. The stabilizer group scheme is smooth over the parameters. Laurent directions in $frak(n)_(P^(-)) xor frak(n)_P$ at $c_P$ therefore extend locally to sections of its Lie algebra, using only finitely many jets for a chosen finite set of directions. Infinitesimal gluing at $z$ defines derivations on smooth presentations of the ambient Vinberg bundle stack. They preserve $v$, hence the pair defining $j_0$, and lift compatibly to the stratum fiber over $B$: there they change the two unipotent extensions and keep the Levi modification fixed. Principal parts on the two factors, with the relative chart directions, span that fiber’s tangent space. The finite étale image $l_(*) k_Y$ is a local system on the open. Apply the analytic-flow observation and then vector-stack descent exactly as in Lemma 6. This proves the assertion for $J^b$.
  On $B$ there are independent central-inertia cocharacters at its two ends: the residual $Z_M$ quotient absorbs the difference of the two central actions on the modification. Their weights on the ratio line are $Q \( z \, u_1 \)$ and $- Q \( z \, u_2 \)$. The irrational Kummer test therefore kills the twisted category unless both $u_1$ and $u_2$ are torsion. Their difference then vanishes rationally, so the defect must be zero. Only the defect-zero strata of torsion degree remain. There are finitely many such degrees and finitely many parabolics.
  Set
  $ D^b = "cone" #scale(x: 120%, y: 120%)[\(] J^b arrow.r \( j_0 \)_(*) l_(*) k_Y #scale(x: 120%, y: 120%)[\)] . $
  For a boundary stratum inclusion $i$, the identity $i^(!) \( j_0 \)_(*) = 0$ gives $i^(!) D^b tilde.eq i^(!) J^b \[ 1 \]$. Thus the preceding boundary calculation applies to the cone. Use localization with !-restrictions and star extensions from strata to filter $D^b$. Within a fixed parameter orbit, the !-restrictions on every nonzero-defect stratum vanish by the preceding argument; this is checked on quasi-compact pieces using the locally finite stratification. Thus the cone has a finite filtration involving only the defect-zero strata for proper parabolics. Push it by the proper map $b$. On a stratum over $B$ its contribution has the form
  $ \( p^(-) times p \)_(*) \( q^(-) times q \)^(!) K $
  for a kernel $K$ on $Y_M times Y_M$, by !-base change from $B$. The map forgetting the modification is quasi-compact and safe on fixed degrees: in the remaining defect-zero case it is the isomorphism datum modulo central scaling, which acts freely relative to the two Levi bundles. If $T_K$ denotes the functor represented by $K$, the displayed kernel represents $E_P compose T_K compose C_(P^(-))$; any shift from the cone is absorbed into $K$. This is the required factorization through both a proper constant term and a proper Eisenstein image. Finally, $b j_0 l = Delta$, $b$ is proper, and $k_Y = omega_Y \[ - 2 dim Y \]$. The two pushed kernels are therefore $Delta_(!) k_Y$ and $Delta_(*) omega_Y \[ - 2 dim Y \]$, respectively. This proves the Proposition. ◻
]

=== 3.5 Induction and the reductive case <induction-and-the-reductive-case>

We finish the proof of Theorem 5. The induction is on semisimple rank, simultaneously for the two signs of $s$. We first explain the semisimple step, assuming the assertion for reductive groups of smaller semisimple rank.

For every proper parabolic and torsion degree, choose compact generators $w$ of $cal(C)_M^u$ and put $x = E_P w$. Equation (3.2) implies that $x$ is compact. Equation (3.4) gives $F_H x tilde.eq L_(P^(-)) F_M w$, which is compact by the inductive equivalence. For every $y$, adjunction and (3.4) give natural isomorphisms

$ "Hom" \( F_H x \, F_H y \) tilde.eq "Hom" \( F_M w \, C_(P^(-)) F_H y \) tilde.eq "Hom" \( w \, \( L'_P \)^or y \) tilde.eq "Hom" \( x \, y \) . $

Full faithfulness requires the actual map induced by $F_H$ to be invertible. The preceding adjunction calculation gives an isomorphism natural in $y$, but has not yet shown that its inverse sends the identity of $x$ to the identity of $F_H x$. By enriched Yoneda, the inverse of the displayed natural isomorphism has the form $f mapsto F_H \( f \) b$ for an endomorphism $b$ of $F_H x$. Surjectivity at $y = x$ provides $a in "End" \( x \)$ with $F_H \( a \) b = 1$. A split epimorphism endomorphism of $F_H x$ is invertible: on affine charts its bounded coherent cohomology modules are noetherian, and a surjective endomorphism of a noetherian module is injective. Hence $F_H \( a \)$ and then $b$ are invertible. The actual $F_H$-comparison is consequently an isomorphism.

Let $cal(B)$ be the right orthogonal of this set of compact $x$. Equation (3.2) identifies it with the objects whose proper constant terms vanish. Equation (3.3) also makes these objects left orthogonal to every proper Eisenstein image. If $m in cal(B)$, Proposition 10 therefore gives both $F_H m tilde.eq m \[ - 2 dim Y \]$ and

$ "Hom" \( m \, y \) arrow.r^(med tilde.op med) "Hom" \( F_H m \, F_H y \) . $

The second assertion follows by applying $"Hom" \( m \, - \)$ to the cone filtration and using naturality of its map. Compact localization says that the $x$ together with $cal(B)$ generate under colimits. Mapping out of colimits converts them to limits, so these comparisons prove full faithfulness of $F_H$ on every source. Its essential image is closed under colimits. It contains $cal(B)$ because $F_H$ is a shift there, and it contains every Eisenstein generator by (3.4) and the inductive equivalence. Hence it is the entire category.

It remains to justify the reductive groups used at the induction base and as Levi subgroups. For a reductive $H$, let $H_(upright("der"))$ be its derived group and $Z^0$ its connected center. Their product maps to $H$ by a central isogeny. On torsion degrees, the induced map of bundle stacks

$ f : Y_(H_(upright("der"))) times Y_(Z^0)^(thin 0) arrow.r Y_H^(upright("tors")) $

retaining all contributing lifting components is surjective. In fact the abelianization degree of a torsion class is zero. In the exact sequence

$ pi_1 \( H_(upright("der")) \) arrow.r pi_1 \( H \) arrow.r pi_1 \( H \/ H_(upright("der")) \) arrow.r 0 \, $

the left image is finite and the right group is a free lattice, so the left image is exactly the torsion subgroup. Thus the degree lifts from the derived group. The degree-two obstruction for the finite central isogeny is the class of this degree in the cokernel of the map on fundamental groups; it therefore vanishes. One may check this last statement topologically on the complex curve and then use comparison for finite coefficients. When a lift exists, its choices form a torsor for bundles of this finite kernel. There are finitely many such bundles and finite automorphism groups. The map $f$ is therefore, étale locally on the base, a finite union of finite étale gerbes. Formal étaleness follows as well from the isomorphism of Lie algebras. In characteristic zero, $f$ is proper and safe, $f^(!) = f^(*)$ is conservative, and pushforward and pullback are ambiadjoint.

The twisting separates on this product. Decompose $V$ into representations of $H_(upright("der"))$ tensored with central characters. The determinant-of- cohomology tensor formula separates each summand into its derived and central factors; its mixed Deligne-pairing term vanishes because a representation of a semisimple group has trivial determinant. On the neutral component of the torus stack, a rigidification at a point of $X$ identifies the stack with a Picard variety times $B Z^0$. Writing $V = xor.big_i W_i ⊗ chi_i$, its central inertia weight on degree zero is $\( 1 - g \( X \) \) sum_i dim \( W_i \) chi_i = 0$, because $V$ is self-dual. Thus only the Picard factor is twisted. Its pseudo-identity is a shift, since the variety is smooth and separated. For $B Z^0$ use the untwisted miraculous duality theorem [20] Theorem 0.1.6, applied to the neutral component of $"Bun"_(Z^0)^(thin 0) \( bb(P)^1 \) = B Z^0$. The extraordinary diagonal kernel of the product is the exterior product of those of its factors, so its pseudo-identity is $F_(H_(upright("der"))) ⊗ F_(Z^0)$. Thus rank zero is established, and the semisimple assertion of any rank gives the product assertion of that rank.

Finally that assertion descends along $f$. The extraordinary diagonal kernels give

$ f_(*) F_(H_(upright("der")) times Z^0) tilde.eq F_H f_(*) \, #h(2em) F_(H_(upright("der")) times Z^0) f^(!) tilde.eq f^(!) F_H . $

For example both kernels for the first equality are $Gamma_(f \, !) k$, where $Gamma_f$ is the graph: use $f_(*) = f_(!)$ and then star–shriek base change with $f^(!) = f^(*)$, which holds because $f$ is étale. Transposition at the opposite twist gives the second equality. Compact objects pushed from the product remain compact and generate downstairs, since $f^(!)$ is continuous and conservative. Their images under $F_H$ are compact by the product assertion. The displayed identities and ambiadjunction give the same natural Hom isomorphism as above on these generators. The noetherian split-epimorphism argument identifies it with the actual comparison map. Full faithfulness follows by generation; essential surjectivity follows because the pushed generators lie in the image. This completes the simultaneous induction and proves Theorem 5.

== 4 Whittaker categories in families <sec:whittaker>

The Whittaker coefficient functor will be used both in duality and in families in which marked points collide. We construct its projection on all D-modules, establish its compatibility with those families, and fix the pairing and t-structure normalizations. The finite averaging calculation below is the common source of these properties.

=== 4.1 The pole and Grassmannian models <the-pole-and-grassmannian-models>

Let $H$ be one of the semisimple groups under consideration. Fix a Borel $B = T N$ and the Cartan bundle $T_0$ inducing the bundle $P_0$ of Section 2. Write

$ N_0 = N^(T_0) \, #h(2em) frak(n)_0 = "Lie" \( N_0 \) \, #h(2em) delta_N = - chi \( X \, frak(n)_0 \) = dim "Bun"_(N_0) . $

Here $chi \( X \, - \)$ denotes Euler characteristic. Each simple-root line of $frak(n)_0$ is $Omega_X$. The pinning and the sum of residues therefore define a nondegenerate additive character, also denoted $chi$, on the unipotent loop groups. We use both $chi$ and $- chi$. Our gluing convention sends the inside frame to the outside frame.

A parameter scheme $S$ carries a nonempty tuple $\( x_i \)_(i in I)$ of points of $X$; auxiliary parameters are allowed. The principal examples are the powers $X^I$ and their coincidence strata. All operations in the parameter scheme use the D-module conventions of Section 2.3, without a perverse shift unless one is displayed. The ordinary Ran space is presented by the $X^I$, with transition maps the diagonals indexed by surjections of nonempty finite sets.

Let $cal(Y) arrow.r S$ be the following pole stack. An object consists of an $H$-bundle $P$ together with Plücker maps

$ T_0^lambda arrow.r V_P^lambda #h(2em) \( lambda upright(" a dominant weight of ") H \) \, $

regular away from the marked points, generically nonzero, and satisfying the Cartan-product relations. All representations are those of the given group $H$. Thus the definition uses the affine closure of $H \/ N$ and allows defects; it imposes no quotient by Cartan scalings. Denote the forgetful map by $p_(cal(Y)) : cal(Y) arrow.r "Bun"_H$ and give $cal(Y)$ the pullback of the determinant twist $L_H^s$.

We write $cal(Y)_m$ for closed pole bounds. Choose effective bounds for a finite set of highest-weight generators, compatible with Cartan multiplication; multiples of a coweight strictly positive in the coroot span give a cofinal choice. At colliding markings these bounds add. Each $cal(Y)_m$ is locally QCA, and its map to $"Bun"_H times S$ is schematic, separated, and of finite type: after bounding poles, the finitely many maps are sections of vector bundles satisfying equations and open conditions.

On each $cal(Y)_m$ take the full subcategory of $D_(p_(cal(Y))^(*) L_H^s) \( cal(Y)_m \)$ defined by the strong Whittaker condition: its objects are equivariant with character $chi$ for $N$-modifications away from the marked points and on the nondefective locus. The determinant twist is split along these modifications by the Borel filtration and the relative determinant identification. Restriction between closed pole bounds respects this character descent. Define $cal(W)_s^(+) \( S \)$ to be the limit of these full subcategories under $!$-restriction, inside the ambient category

$ D_(p_(cal(Y))^(*) L_H^s) \( cal(Y) \) = lim_m D_(p_(cal(Y))^(*) L_H^s) \( cal(Y)_m \) . $

The opposite category $cal(W)_(- s)^(-) \( S \)$ is defined with $L_H^(- s)$ and $- chi$. If the derived group is not simply connected, the usual Drinfeld compactification imposes an additional closed defect condition. Whittaker objects on the Plücker model used here are supported on that closed substack [22] Remark 4.1.2; hence the two models define the same Whittaker category. The projection and continuity properties, and the equivalent colimit presentation, will be proved below. One may impose this condition by choosing an auxiliary point $z$, passing to the open where $z$ is neither marked nor defective, framing the reduction at $z$, and using the unipotent loops there. We verify below that the resulting condition is independent of these choices.

The Grassmannian $"Gr"_(P_0 \, S)$ parametrizes modifications of $P_0$ at the marked points. Such a modification supplies the Plücker maps and hence a morphism

$ mu : "Gr"_(P_0 \, S) arrow.r cal(Y) . $

Its twisting line is the relative determinant: the pullback of $L_H$ divided by its fixed value at $P_0$. This line factorizes over disjoint formal discs and has the unipotent splitting just specified.

#thm([Proposition 4.1.])[
  (Comparison of Whittaker models).  #emph[For a connected semisimple complex group $H$, a smooth complete curve $X$, and the fixed half-canonical datum defining $T_0$, the functor $mu^(!)$ identifies the pole-model Whittaker category with the strongly $chi$-equivariant D-module category on $"Gr"_(P_0 \, S)$ with its relative determinant twist. This holds for every exponent $s$, with arbitrary D-modules in the marked-point parameters, and is compatible with the multipoint and Ran presentations. The assertion also holds with both signs reversed.]
] <whittaker:model-comparison>

#proof[
  For the untwisted sheaf theory this is Gaitsgory’s local/global comparison, [22] Theorems 5.5.2 and 7.2.3. We explain why its proof applies to our determinant twist, so that the distinction between a character twist and a twisting line is explicit.
  Let $cal(L) = p_(cal(Y))^(*) L_H$ and form the frame torsor $cal(L)^times arrow.r cal(Y)$. Pull every correspondence in the comparison proof back from its target to this torsor. On an open action correspondence, the unipotent and arc splittings transport this frame to the source. On a compactified correspondence we pull back only the target torsor; the open source-frame identification is not extended as a trivialization over its boundary. This single Cartesian pullback preserves the proper maps in the compactified action diagrams.
  There are two ingredients in the comparison proof [22] Sections 6.1–6.6: full faithfulness after Ran uniformization, and the equivalence obtained by restricting to the unit configuration in the Whittaker category. The geometric input to the first is universal homological contractibility. This means precisely that the corresponding pullback is fully faithful after every prestack base change; see [23] Appendix A.1.8–A.1.11. It therefore applies after the frame-torsor base change as well as with the marked-point parameters retained.
  The second ingredient uses unipotent averaging, arcs, and conjugates of positive-depth subgroups. The determinant central extension is canonically split on arcs, and the Borel filtration splits it on unipotent modifications. These splittings restrict to the finite quotients used in averaging and respect multiplication. For the subgroups conjugated by a multiple of the half-sum of positive coroots, take the cofinal sequence of even depths. The conjugating cocharacter then belongs to the actual cocharacter lattice of $H$, since twice that half-sum is the sum of coroots. Conjugation of the arc splitting is consequently defined: choose a lift of the conjugating loop to the central extension, locally if necessary; any two choices differ centrally and give the same result.
  There is also a family compatibility to check at collisions. In the notation of [22] Section 6.6.4, the group $frak(L)_I^(+) \( H \)^j$ is the inverse image of the preceding one-point subgroup under $frak(L)_I^(+) \( H \)' arrow.r frak(L)_x \( H \)$. On this group the relative determinant extension is pulled back from the distinguished disc at $x$: the primed group allows poles only on the distinguished graph $E = S times { x }$. More explicitly, let $t$ cut out $E$ and let $A_I$ be the ring completed along the entire marked divisor, including $E$. On a bounded piece choose $m$ so that $t^m Lambda subset g Lambda subset t^(- m) Lambda$. The finite lattice quotients defining the relative determinant are supported on a thickening of $E$. For every $r$,
  $ A_I \/ \( t^r \) tilde.eq cal(O)_(S times X) \/ \( t^r \) tilde.eq cal(O)_S \[ \[ t \] \] \/ \( t^r \) \, $
  because the ideal of the entire marked divisor is nilpotent modulo $t^r$. Thus restriction to the distinguished disc preserves the quotient complexes and their determinant identifications, including on collision and nonreduced parameter schemes. The splitting therefore pulls back from the one-point subgroup. It agrees on overlaps with the canonical arc splitting; on pro-unipotent kernels uniqueness follows from the absence of algebraic characters to $bb(G)_m$. These constructions commute with coordinate changes and match the determinant ratio at $P_0$.
  Finally, the clean-extension argument lifts as well. In its product presentation $\( g \, y \)$, the ratio between the target and source determinant lines is the multiplicative line $cal(R) \( g \) = det \( g Lambda : Lambda \)$. The splitting on the conjugated congruence group descends this line through the quotient used in [22] Appendix A.2, and the unipotent splitting gives its left $N$-action. The ratio line can remain nontrivial on the boundary; only its equivariance is needed. On every finite-dimensional boundary piece the proof supplies a unipotent stabilizer on which the Whittaker character is nontrivial [22] Appendix A.2–A.3. This stabilizer fixes the source coordinate and acts on the ratio-line fiber by an algebraic character to $bb(G)_m$, hence trivially. It therefore fixes the target frame as well, while retaining its nontrivial Whittaker character. The same boundary-vanishing argument applies to arbitrary objects on the frame torsor. Together with the lifted averaging correspondences, this transports the units, counits, and clean-extension isomorphisms of the unit-restriction equivalence.
  Every lifted map commutes with multiplication of the determinant frame by $bb(G)_m$. Taking strong equivariance with the Kummer character of exponent $s$ therefore descends the lifted equivalence to D-modules twisted by $cal(L)^s$. An equivariant equivalence induces an equivalence on these descent categories, including their full cosimplicial descent data. This yields the stated determinant-level comparison, and preserves its base and Ran compatibilities. ◻
]

We will need two point inputs. At an irrational scalar level, the point Whittaker Grassmannian category is a sum of copies of $"Vect"$ indexed by the dominant coweights of the actual group. Here is the precise consequence of Campbell–Dhillon–Raskin that we use. The irrational case of their integral-Weyl-group calculation [9] Theorem 3.5.6, Equation (3.28) leaves one dominant label in each contributing spherical highest-weight block. Its finite-length one-simple highest-weight heart is therefore finite-dimensional vector spaces. The derived-heart comparison of [9] Section 2.9.4, together with the compact generators used in the proofs of their Corollary 3.5.9 and Theorem 3.7.3, identifies the presentable block with $"Ind" \( D^b \( "Vect"^(upright("fd")) \) \) = "Vect"$. Thus higher self-extensions are excluded by the derived comparison, not just by the absence of linkage. Their spherical fundamental local equivalence [9] Remark 3.7.5 transfers this statement to Whittaker D-modules. Their actual-form reduction [9] Section 4.2, Proposition 4.2.2, and Section 4.3 retains the actual weight and coweight lattices and treats products. An irrational complex level of either sign is in their negative good-level regime. For groups with simply connected derived group, the corresponding irrational clean-standard statement was already proved in [21] Proposition 8.4.

At exponent zero we use the clean-standard theorem [16] Theorem 3; its Introduction explicitly includes characteristic-zero D-modules. Cleanliness and the mapping complex calculation in Proposition 14 give the corresponding DG semisimplicity. This is the categorical form of geometric Casselman–Shalika needed here. When passing between invariant and coinvariant conventions at a point, we use the Whittaker invariant/coinvariant theorem [32] Theorem 2.1.1. These are point statements; the family conclusions used below will be deduced separately.

=== 4.2 Defect strata and a continuous Whittaker projection <defect-strata-and-a-continuous-whittaker-projection>

In a fixed pole bound, record actual poles and defects by

$ D = sum_y lambda_y y \, #h(2em) T_D = T_0 \( - D \) \, $

with poles positive. Orders of Plücker maps pair additively with dominant weights. Indeed their leading terms have nonzero Cartan product, so their valuations add. Using every highest weight of $H$ shows that each $lambda_y$ is a coweight of $H$. Away from the markings it belongs to the negative rational coroot cone. At a marking it is bounded above by the specified pole bound, in the order defined by that cone.

Stratify both the markings by their coincidences and the Plücker maps by this divisor. Write $S_D$ for the resulting divisor-parameter scheme and

$ f_D : cal(Y)_D arrow.r.hook cal(Y)_m \, #h(2em) q_D : cal(Y)_D arrow.r S_D $

for the inclusion and the parameter map. Dividing the maps by their common zeros gives a genuine Borel reduction with Cartan bundle $T_D$. Conversely such a reduction recovers the point of the stratum. Thus $q_D$ parametrizes $N^(T_D)$-bundles. It is a smooth fibration given by a tower of vector stacks: filtering $N$ by root height reduces each stage to the stack associated with the two-term complex of global sections of a root line bundle. The determinant twist restricts to a line from $S_D$, by the same filtration.

This description is valid in families. After clearing bounded poles, flattening by the lengths of zero divisors makes them relative Cartier divisors. One then refines by coincidences, and, when needed, passes to étale charts enumerating the support. D-modules allow us to ignore nilpotents in this stratification. Opens bounding the total zero lengths exhaust $cal(Y)_m$; over quasicompact parameter pieces they are quasicompact and have only finitely many of these strata. Their stabilizers are unipotent. In fact an automorphism preserving all Plücker maps restricts generically to the unipotent stabilizer of a reduction with fixed Cartan datum. Alternatively, on a bounded open a sufficiently deep frame at a nondefective point kills the stabilizer.

A stratum is #emph[relevant] if every $lambda_y$ is dominant. Dominance and the negative-cone condition force all off-marking defects to vanish. There are only finitely many relevant labels in each pole bound. On a relevant stratum the simple-root lines are

$ alpha \( T_D \) = Omega_X #scale(x: 120%, y: 120%)[\(] - chevron.l alpha \, D chevron.r #scale(x: 120%, y: 120%)[\)] arrow.r Omega_X . $

The simple-root abelianization and the trace on $H^1 \( X \, Omega_X \)$ define a function $psi_D : cal(Y)_D arrow.r bb(A)^1$. Choose its sign so that modification at a nondefective point changes $psi_D$ by the residue character of the modifying loop. In Grassmannian coordinates its phase along $n t^lambda$ is therefore $chi \( n \)$.

#thm([Proposition 4.2.])[
  (Projection and stratum tests).  #emph[In every pole bound, inclusion of the strongly Whittaker category has a continuous right adjoint $"Av"_(*)$. Its image consists exactly of the objects $F$ satisfying]
  + #emph[$f_D^(!) F = 0$ on every irrelevant stratum;]
  + #emph[on a relevant stratum, $f_D^(!) F = "Exp" \( psi_D \) ⊗^(!) q_D^(!) E_D$ for an object $E_D$ in the D-module category of $S_D$ with its induced twist.]
  #emph[The analogous statement uses $- psi_D$ for the opposite character. Restriction by $!$ computes the projection on each stratum. These projections commute with $!$-base change in the parameter schemes and with tensoring a spectator category. They are compatible with $!$-restriction between pole bounds. Closed direct images, both between pole bounds and along closed parameter embeddings, preserve the Whittaker subcategories.]
  #emph[If a bounded-zero open contains every relevant stratum of a pole bound, restriction to that open and star extension identify its Whittaker category with that of the entire bound.]
] <whittaker:strata-properties>

#proof[
  We first construct the projection on a quasicompact bounded-zero open on which an auxiliary point $z$ is unmarked and nondefective. Use root-height coordinates for $N_0$ at $z$. Let $U_n$ be the unipotent loop subgroup allowing pole order at most $n "ht" \( alpha \)$ in the positive-root coordinate $alpha$; $U_0$ is the arc subgroup. Root heights add under multiplication, so these are subgroups. Each $U_n$ is pro-unipotent and the homogeneous space $U_n \/ U_0$ is finite dimensional and de Rham acyclic; $U_0$ need not be normal in $U_n$.
  Let $cal(Z)^(upright("fr"))$ be the formally framed stack on this open. It carries a $U_n$-action, and the unframed open is $cal(Z)^(upright("fr")) \/ U_0$. Its averaging arrows form the Čech groupoid of
  $ cal(Z)^(upright("fr")) \/ U_0 arrow.r cal(Z)^(upright("fr")) \/ U_n . $
  Equivalently, these arrows are isomorphisms away from $z$ and modifications by $U_n$ at $z$. The character descends to the groupoid because $chi \|_(U_0) = 0$; normality of $U_0$ is unnecessary. Write $s_n \, t_n$ for source and target. They are smooth, with fiber $U_n \/ U_0$ of dimension $d_n$, and preserve the pole bounds and defect strata. Indeed the Plücker maps agree away from $z$, and $N$ fixes every highest-weight vector at $z$; the modified reduction is therefore still nondefective there. Thus the actual defect divisor and the bounded-zero open are preserved. If finite-type charts are desired, divide frames by an arc subgroup sufficiently deep to be normal in $U_n$. The arrow splitting of the determinant line defines the averaging functor
  #[#set math.equation(numbering: n => "(4.1)")
   $ "Av"_(n \, *) \( F \) = t_(n \, *) #scale(x: 120%, y: 120%)[\(] "Exp" \( chi \) ⊗^(!) s_n^(!) F #scale(x: 120%, y: 120%)[\)] \[ - 2 d_n \] . $ <eq:W1>]
  Smooth pullback along the unipotent fibers is fully faithful because their de Rham cohomology is the ground field. Base change and additivity of $chi$ identify (4.1) with a strongly equivariant object for this finite groupoid. Smooth star-pullback/star-image adjunction then identifies it with the right adjoint to inclusion of that equivariant subcategory. In particular its counit and the transition maps for larger $n$ are canonical. The maps in (4.1) are finite-type and safe after taking these quotients, so the functor is continuous on all D-modules.
  We next compute the restrictions of (4.1). On a defect stratum its arrow stack maps to $cal(Y)_D times_(S_D) cal(Y)_D$. For large $n$ this map is, smoothly locally, a tower of affine-space bundles. To see this, lift isomorphisms between the two unipotent extensions in order of root height. At the $alpha$-stage, possible lifts form a torsor under global sections of the corresponding root line with poles $n "ht" \( alpha \) z$. The obstruction lies in its $H^1$ and vanishes for large $n$. Apply relative Serre vanishing to the bounded family of root lines on $X times S_D$. Once $R^1 p_(*)$ vanishes, Riemann–Roch and cohomology-and-base-change make the spaces of sections locally free of constant rank, compatible with arbitrary parameter base change. Hence their torsors are smoothly locally affine-space bundles even where the unmodified $H^0$ and $H^1$ jump. Higher-root lifts are controlled by the same graded root lines. The height convention makes these successive extensions compatible with multiplication.
  On a relevant stratum the character on the arrow stack is $t_n^(*) psi_D - s_n^(*) psi_D$, by the residue description of the trace. Base change and de Rham integration along the preceding affine-space towers therefore give
  #[#set math.equation(numbering: n => "(4.2)")
   $ F mapsto "Exp" \( psi_D \) ⊗^(!) q_D^(*) q_(D \, *) #scale(x: 120%, y: 120%)[\(] "Exp" \( - psi_D \) ⊗^(!) F #scale(x: 120%, y: 120%)[\)] . $ <whittaker:stratum-projector>]
  For the shift, put $e = dim \( q_D \)$ and let $h = d_n - e$ be the relative dimension of the affine-space tower from the arrow stack to $cal(Y)_D times_(S_D) cal(Y)_D$. Integration of its $!$-pullback contributes $\[ 2 h \]$, so
  $ \[ 2 h - 2 d_n \] = \[ - 2 e \] \, #h(2em) q_D^(!) \[ - 2 e \] = q_D^(*) . $
  The two pullbacks have the same essential image, differing by this fixed shift on the stratum. Pullback is fully faithful for the vector-stack tower $q_D$, so (4.2) is its exponential-conjugate projection.
  On an irrelevant stratum there is a simple root $alpha$ for which $alpha \( T_D \)$ admits a pole at some point other than $z$. A section with sufficient pole allowance at $z$ can prescribe a nonzero residue at that point and zero residues at the other allowed poles. The required surjectivity is again the vanishing of $H^1$ after increasing $n$. The residue theorem makes its residue at $z$ nonzero. Thus, after integrating the higher-root coordinates, the averaging contains the de Rham cohomology of a nonconstant linear exponential on an affine space; this cohomology is zero. The calculation works over the parameter scheme, étale locally if a support enumeration is needed.
  There are finitely many strata in our open. Choose $n$ large enough for all of them. On every stratum the adjunction transitions from larger averaging functors to (4.1) are now isomorphisms: on relevant strata all are the projection (4.2), with its canonical counit, and on irrelevant strata all are zero. The finite stratification is conservative for $!$-restriction, so the transitions are isomorphisms on the open. Equivalently, the counits testing equivariance for larger $U_n$ become isomorphisms there. The stable functor is therefore the right adjoint to the full Whittaker inclusion, with exactly the two stated stratum tests.
  All calculations were relative and used finite-type correspondences, so they commute with $!$-base change and spectators before stabilization. The same uniform finite choice proves that they still do so afterwards. On overlaps of auxiliary-point opens the tests describe the same full subcategory. The right adjoints and their counits consequently glue, uniquely compatibly with the inclusions. Several or varying auxiliary points give the same condition: repeat the calculation over their parameter scheme, replacing $n z$ by the corresponding auxiliary divisor and adding their characters. This also verifies the smooth-local version of strong equivariance.
  The bounded-zero opens exhaust the pole bound, and their projections glue by these compatibilities. Closed images preserve the two tests by $!$-base change, both for an increase of pole bound and for a closed parameter embedding. Finally, outside an open containing all relevant strata the $!$-restriction of a Whittaker object is zero. The localization triangle identifies it with star extension from that open. Conversely star extension preserves the tests and hence recovers a Whittaker object. This proves the last assertion and completes the proof. ◻
]

=== 4.3 Duality and passage to the Ran space <duality-and-passage-to-the-ran-space>

The projections just constructed allow duality to be established on the full Whittaker categories. The opposite character is essential: it cancels the exponential in the pairing.

#thm([Proposition 4.3.])[
  (Whittaker duality).  #emph[The categories $cal(W)_s^(+) \( S \)$ and $cal(W)_(- s)^(-) \( S \)$ are dual, with the normalized pairing 
#[#set math.equation(numbering: n => "(4.3)")
 $ chevron.l W \, W' chevron.r = Gamma_(upright("dR")) \( W ⊗^(!) W' \) \[ - 2 delta_N \] . $ <eq:W2>]

 In a pole bound this formula uses the bounded-zero star-extension convention of Proposition 12. It then extends continuously to the full pole model. Equivalently, one may place one argument in a pole bound and $!$-restrict the other to that bound. The analogous pairing relative to $S$ is defined by relative star image. Closed images transpose to $!$-restrictions.]
  #emph[These statements hold for the Ran categories, formed as limits under $!$-restriction along the diagonals, and are compatible with tensoring a spectator category.]
] <whittaker:duality>

#proof[
  First work in a bounded-zero quasicompact open of a pole bound. Its unipotent inertia makes ordinary de Rham pushforward safe. The twisted QCA duality pairing is therefore ordinary de Rham global sections after the twists cancel.
  Here is a direct way to pass the smooth-stack duality of Proposition 4 to these pole stacks. On a quasicompact open of $"Bun"_H$, allow sufficiently many extra poles that the relevant $H^1$ groups vanish. The spaces of Plücker maps are then vector bundles, and their relations are closed conditions in a smooth quotient stack. An open condition can be realized by restricting the ambient stack to an open, so the bounded piece admits a closed embedding into such a smooth ambient stack, with the twisting line extended from it. For the parameters, work on affine opens embedded as closed subschemes of smooth ambient schemes, using the graph of the marked-point map and local trivializations of the twisting line. For a closed embedding $i$, Kashiwara’s equivalence realizes the supported category as the image of the continuous projector $i_(*) i^(!)$. On a product the two external projectors commute and cut out precisely the product support. Thus Künneth and the diagonal duality identities pass to these closed supports. After cancellation of the twists, renormalized pushforward in those identities agrees with ordinary pushforward by safety. This supplies the stated pairing, also with spectators.
  Let $P_(+)$ and $P_(-)$ denote the projections for the two opposite characters. For a Whittaker object $W$ and an arbitrary oppositely twisted object $F$, the counit $P_(-) F arrow.r F$ induces an isomorphism
  #[#set math.equation(numbering: n => "(4.4)")
   $ Gamma_(upright("dR")) \( W ⊗^(!) P_(-) F \) arrow.r^(med tilde.op med) Gamma_(upright("dR")) \( W ⊗^(!) F \) . $ <whittaker:orthogonal-projection>]
  Indeed, on an auxiliary-point open insert the finite formula (4.1) for $P_(-)$ with $n$ sufficiently large. The $!$-projection formula moves $W$ to the arrow stack. Its positive-character equivariance cancels the negative exponential in the averaging kernel. Integrating along the source then cancels the dimension normalization of (4.1) and gives the right side of (4.4). The identification is the one induced by the counit. Open descent gives it on the whole quasicompact open. The same argument interchanges the two characters.
  Consequently the Whittaker subcategory on either side annihilates the kernel of the projection on the other. Transposing the inclusion and its continuous right adjoint under ambient duality gives adjoints in the opposite order. The transposed projector is the identity on the opposite Whittaker image and zero on its projection kernel, by (4.4) and its counterpart. It is therefore exactly the opposite projector. Splitting these projectors identifies the two Whittaker categories as duals. The fixed shift $\[ - 2 delta_N \]$ is an invertible normalization of this duality.
  An open containing all relevant strata computes the Whittaker category of the entire pole bound. The tensor product in (4.3) is likewise star-extended from that open: its $!$-restriction to the complement is zero. This proves the formula and duality on the bound.
  For closed increases of pole bound, the continuous closed image is left adjoint to the continuous $!$-restriction. The latter also preserves limits. The limit of these right adjoints is the colimit of their left adjoints in presentable categories. Formula (4.3), together with the $!$-projection formula, transposes the closed image to the corresponding restriction. Passing to this limit/colimit therefore preserves the duality.
  The Ran presentation has the same form. By Proposition 12, its diagonal restrictions and closed images are computed in the collision parameter schemes, after a cofinal increase of pole bounds. Their adjunctions and transpose identities are the ones just proved. Thus
  $ cal(W)_s^(+) \( "Ran" \) = lim_(I \, thin Delta^(!)) cal(W)_s^(+) \( X^I \) = "colim"_(I \, thin Delta_(*)) cal(W)_s^(+) \( X^I \) \, $
  with the corresponding statement for the opposite character. To see the duality directly, compute maps out of the colimit by the diagram and use the termwise dualities; the resulting dual is exactly the displayed limit on the opposite side. Tensoring by a spectator category commutes with this presentation because it commutes with the colimit, and the continuous adjunctions tensor with it. The same argument gives the relative pairing over $S$. ◻
]

=== 4.4 Standard objects and the t-structure <standard-objects-and-the-t-structure>

We now specialize to an irrational exponent $s$ or to $s = 0$. The point semisimplicity recalled above makes the relevant strata into actual summands. We must establish this over parameter schemes, since a pointwise statement alone would not control arbitrary D-modules in a family.

Let $S$ be a fixed coincidence piece, so that the distinct marked points are indexed by a fixed finite set. A relevant label is a tuple of dominant coweights at these points. For such a label $D$, the scheme $S_D$ is identified with $S$; write $cal(L)_D$ for the line on $S$ whose pullback is the determinant line on $cal(Y)_D$. Set

$ a_D = sum_y chevron.l 2 rho_(upright("rt")) \, lambda_y chevron.r \, #h(2em) 2 rho_(upright("rt")) = sum_(alpha > 0) alpha . $

Riemann–Roch, applied to the root-height filtration, gives

#[#set math.equation(numbering: n => "(4.5)")
 $ dim \( q_D \) = - chi \( X \, frak(n)^(T_D) \) = delta_N + a_D . $ <whittaker:stratum-dimension>]

#thm([Proposition 4.4.])[
  (Standard summands in families).  #emph[Suppose $s$ is irrational or zero. Over a fixed coincidence piece $S$, the Whittaker category is the direct sum, in presentable DG categories, of the categories $D \( cal(L)_D^s \)$ indexed by relevant labels $D$. The inclusion of the $D$-summand is star extension from its stratum; with the normalization below it is 
#[#set math.equation(numbering: n => "(4.6)")
 $ E mapsto f_(D \, *) #scale(x: 120%, y: 120%)[\(] "Exp" \( psi_D \) ⊗^(!) q_D^(!) E \[ - a_D \] #scale(x: 120%, y: 120%)[\)] . $ <eq:W3>]

 The construction takes place in any pole bound containing the label and is then carried to larger bounds by closed image. For holonomic arguments in this formula, the canonical shriek-to-star map is an isomorphism. Both assertions hold for the opposite twist and character.]
] <whittaker:standards>

#proof[
  Begin over a point. The star standard and its shriek counterpart are Whittaker objects. For the former this follows from the stratum tests; for the latter use the smooth modification arrows, equivariance, and partial shriek on the holonomic exponential. Their endomorphism complexes are the ground field: locally closed image is fully faithful, and pullback along the unipotent stack $q_D$ is fully faithful.
  For irrational $s$, the canonical map from shriek to star is nonzero, since its restriction to the stratum is the identity. In the semisimple point category supplied by the block theorem and Proposition 11, an object with scalar endomorphism complex is a shift of a single simple. The nonzero map between these two objects is therefore an isomorphism. For $s = 0$, the same cleanliness is precisely the imported clean-standard theorem. In either case, adjunction and cleanliness make the mapping complexes between distinct standard objects zero: restriction of one clean standard to the other stratum is zero. Moreover, partial shriek adjunction against an arbitrary Whittaker object $W$ identifies maps from the $D$-standard with the coefficient complex extracted from $f_D^(!) W$ by exponential cancellation and the fully faithful $q_D^(!)$, up to the displayed fixed shift. This extraction is continuous by Proposition 12. Each standard is therefore compact in the Whittaker category. The standards generate by the stratum tests and finite stratification in each bound. These orthogonal compact generators with scalar endomorphisms give the asserted presentable DG summand description, including at exponent zero.
  Over a fixed coincidence piece choose, étale locally, curve coordinates near the distinct marked sections and compatible spin frames. If $z$ is such a coordinate, $t = z - z \( x_i \)$ is an actual relative parameter; formal étaleness identifies the completed graph neighborhood with $cal(O)_S \[ \[ t \] \]$. Thus no section of an arbitrary formal-coordinate torsor is required. The spin frames give the corresponding Cartan trivializations. The local Grassmannians, residue characters, loop actions, and determinant twists are then products of the point models with the parameter scheme, with the possible residual line on the parameters retained. The point decomposition tensors with $D \( S \)$. Taking invariants of this product commutes with that tensor product because $D \( S \)$ is dualizable. This proves the family decomposition in these coordinates, with all D-modules as coefficients.
  To identify and descend its summands, take $!$-restriction along the sections $t^lambda$ in the Grassmannian model. Under the model comparison this is evaluation of the corresponding exponential-conjugate $q_D^(!)$ object on the global label stratum, carrying exactly the twist $cal(L)_D^s$. The standard defined by $f_(D \, *)$ has these restrictions by base change. Hence the summands and their inclusions are intrinsic, and descend under changes of coordinates and twisting-line trivializations. This gives the asserted formula before its harmless normalizing shift.
  For a holonomic parameter object, shriek extension of the stratum object is Whittaker by the same smooth-arrow calculation. Partial adjunction computes its maps to Whittaker objects from their $!$-restrictions to the label stratum. The summand description shows that star extension represents the same functor. The canonical shriek-to-star map is the resulting isomorphism. This proves the family cleanliness assertion. ◻
]

Use the usual stack perverse normalization on D-modules: $!$-pullback to a smooth chart is shifted back by its relative dimension. On the pole model translate the resulting t-structure so that its heart is the stack heart shifted by $\[ delta_N \]$. This fixes the Whittaker t-structure used from now on.

#thm([Proposition 4.5.])[
  (Normalization and divisor amplitude).  #emph[This t-structure restricts to each Whittaker pole bound and extends to the full pole model with t-exact closed transition images. With this convention (4.6) is t-exact. On an affine chart where a smooth divisor diagonal has inclusion $i$ and affine open complement $j$, 
$ i_(*) \, med j^(!) \, med j_(*) quad upright("are t-exact") \, #h(2em) i^(!) quad upright("has t-amplitude ") \[ 0 \, 1 \] . $

 The resulting t-structures on the parameter categories used here are separated.]
] <whittaker:t-structure>

#proof[
  The strong character condition is preserved by truncation: its isomorphisms are tested by the t-exact smooth pullbacks normalized by relative dimension. Closed transition images are t-exact in the ambient D-module categories and hence on their Whittaker subcategories.
  An object in the full pole model is the filtered colimit of the closed images of its $!$-restrictions to pole bounds. Truncate these objects in the bounds. The transition maps between their truncations are compatible because the closed images are t-exact. This constructs the two truncation terms in the colimit category. Orthogonality follows by adjunction: restriction to any fixed bound is left t-exact and commutes with filtered colimits. The resulting t-structure is compatible with filtered colimits.
  On a fixed coincidence piece, Proposition 14 decomposes a pole bound into summands, and its t-structure decomposes with them because its aisles are closed under direct summands. For one label, work in an open where its stratum is closed. Open pullback and closed image are t-exact. That open pullback is conservative on the summand, so the t-structure is detected there. The smooth normalization and (4.5) now give the precise shift: $q_D^(!) \[ - \( delta_N + a_D \) \]$ takes a parameter heart object to the stack heart, and translating the latter by $\[ delta_N \]$ gives exactly $q_D^(!) \[ - a_D \]$. Exponential tensoring preserves this normalization. This proves the t-exactness of (4.6); closed transition images give it in the entire pole model.
  For a smooth divisor and its principal affine complement, the asserted exactness is the ordinary D-module exactness for a closed inclusion and an affine open inclusion, applied on the ambient charts. The localization triangle then places $i^(!)$ in amplitude $\[ 0 \, 1 \]$. Base change with closed images and filtered colimits passes these assertions to the pole presentation. Finally, $!$-restrictions to the finitely many parameter coincidence strata have bounded t-amplitude and jointly detect objects. On each such stratum the standard decomposition reduces separation to that of D-modules on a scheme. This proves separation in the parameter categories at issue without an assertion about arbitrary ind-scheme t-structures. ◻
]

=== 4.5 The coefficient functor <the-coefficient-functor>

We can now define the continuous Whittaker coefficient functor with all its required parameter operations:

#[#set math.equation(numbering: n => "(4.7)")
 $ R_H : D \( L_H^s \) arrow.r cal(W)_s^(+) \( "Ran" \) . $ <whittaker:coefficient-functor>]

At marked parameters it is $p_(cal(Y))^(!)$ followed by $"Av"_(*)$ of Proposition 12. The base-change and closed-image compatibilities of that proposition assemble the marked-point functors into (4.7). We use the analogous functor for $- s \, - chi$, and the same definition at $s = 0$. Proposition 13 supplies the duality for these actual presentable Whittaker categories. Thus the adjoints and transposes used below are defined on all D-modules in the base, while shriek operations on holonomic standards serve only to establish their stated cleanliness.

== 5 Deformation of the Whittaker counit <sec:deformation>

Fix one of the groups $H$ under consideration. Throughout this section and Section 6, put

$ Y = Y_H \, #h(2em) b = dim Y \, #h(2em) D_s = D \( L_H^s \) . $

Write $R_s$ for its enhanced Whittaker coefficient and $R'_s$ for the opposite coefficient on $D_(- s)$. We use the duality of (4.3) to interpret $\( R'_s \)^or$, and define

$ J_s = F_H compose \( R'_s \)^or \[ 2 b + 2 delta_N \] . $

Thus $J_s$ applies a Whittaker functional to the first slot of the $!$-diagonal kernel, whose two twists are $\( - s \, s \)$. Our objective is

#[#set math.equation(numbering: n => "(5.1)")
 $ J_s R_s tilde.eq "Id"_(D_s) #h(2em) \( s in.not bb(Q) \) . $ <eq:P1>]

The present section constructs the comparison and proves the finite deformation statements needed to study it. Section 6 proves that its cone vanishes.

Since $F_H$ is an equivalence, it suffices to identify the kernels of $J_s R_s F_H$ and $F_H$. The latter is $Delta_(!) k_Y$, with twists $\( - s \, s \)$. Its first variable is a spectator, while $J_s R_s$ acts on the second. On a smooth affine chart $w : W arrow.r Y$ in the first variable, trivialize the determinant line and pull back the kernel. Interchange the factors and denote the resulting object on $Y times W$ by $F_W$, so the output variable now comes first. Smooth base change describes $F_W$ as the graph $!$-image, with the smooth dimension conversion. We construct the comparison on these charts, naturally under smooth pullback, and then descend it to a map of kernels.

=== 5.1 The ordinary-level inputs <deform:classical-inputs>

We use the following established statements at exponent zero. In each statement the group is a connected reductive group over $bb(C)$, the curve is smooth and complete, the actual root datum is retained, and the theta characteristic converts the half-density convention to the ordinary $D$-module convention used here.

+ The geometric Langlands equivalence identifies $D \( Y \)$ with $"IndCoh"_("Nilp") \( "LS"_(caron(H)) \)$, where local systems are de Rham. Under this identification the tempered inclusion is
  $ Xi : "QCoh" \( "LS"_(caron(H)) \) arrow.r.hook "IndCoh"_("Nilp") \( "LS"_(caron(H)) \) . $
  The cone of the counit from Ran $!$-Poincaré applied to the enhanced Whittaker coefficient lies in the kernel of the right adjoint to this inclusion. We call this kernel the #emph[anti-tempered category]. The $!$-Poincaré images of the vacuum and its fixed-point Satake translates are, up to one fixed shift and constant line, respectively $Xi \( cal(O) \)$ and $Xi$ of the tensor products of the evaluation representation bundles. These are the enhanced Whittaker and spectral localization statements in the geometric Langlands theorem [24,2,8,3,25]: Ran Casselman–Shalika identifies $!$-Poincaré with spectral localization followed by $Xi$, and the right adjoint of spectral localization is fully faithful [2] Section 18.1.1, Proposition 18.1.6 and Equation (18.4). Together with [24] Section 5.1 and Equation (5.1), the equivalence identifies the normalized counit with that of the tempered inclusion. In the Drinfeld model the coefficient is $!$-pullback followed by Whittaker projection; its left adjoint on holonomic finite-pole arguments is $!$-image.
+ Ordinary geometric Satake and categorical Casselman–Shalika identify the action of a Satake intersection complex on the vacuum with the corresponding standard Whittaker object. In the fusion version these intersection complexes extend over the whole tuple power of the curve, are universally locally acyclic over that power, and specialize on diagonals to tensor products. On a finite Hecke correspondence they are relatively universally locally acyclic for both projections; this follows locally from disk frames, with finite jets sufficient in a fixed bound. Pulling the correspondence to a pole model gives the same action by changing the extension at the marked points. Both character signs are allowed: Cartan conjugation over $bb(C)$ interchanges them, also in families.
+ Lin’s comparison between Poincaré series and miraculous duality identifies the two geometric arrows in (5.7) below, for ordinary holonomic Whittaker arguments. We use the construction in [30] Propositions 2.2.4–2.2.5, Section 2.2.6, Section 8.1.3 and Proposition 8.1.4, including the version retaining the marked parameters.
+ The Whittaker characterization of tempering gives a finite Whittaker test at a point that annihilates the anti-tempered category [14]. Section 6 states the precise finite-level functor and verifies its use in our situation.

The passage from these ordinary-level inputs to irrational exponent uses algebraically constructible calculations with a variable rank-one local system. Our deformation lemmas require mixed Hodge origin and quasi-unipotent monodromy, so we first encode each Whittaker character by an algebraic translation on an auxiliary affine line. These translations belong to the ordinary geometric diagrams to which the lemmas apply. Fourier transform then turns them into the required exponential factors.

=== 5.2 An auxiliary axis and Fourier transform <an-auxiliary-axis-and-fourier-transform>

For a space $Z$ in a finite diagram, introduce $Z times bb(A)_u^1$. We call a complex there a #emph[pre-complex]. Fourier transform is performed only after specialization of the coefficient parameter to a field. Our relative algebraic $D$-module Fourier transform is

$ sans(F) \( K \) = p_(t \, *) #scale(x: 120%, y: 120%)[\(] p_u^(!) K ⊗^(!) "Exp" \( u t \) #scale(x: 120%, y: 120%)[\)] . $

Here the projections are from $Z times bb(A)_u^1 times bb(A)_t^1$. This normalization gives $sans(F) \( delta_(u = 0) \) = omega_t$; $sans(F) \[ - 1 \]$ is exact for the perverse convention. The latter is the Weyl-algebra Fourier theorem, applied relatively on affine charts and with closed supports when the parameter scheme is singular.

#thm([Lemma 5.1.])[
  (Fourier comparisons).  #emph[On holonomic arguments, the $!$ and $*$ integrals in the axis defining $sans(F)$ agree canonically. Consequently Fourier commutes with both pullbacks and both direct images for maps independent of the axis, whenever these holonomic operations are defined. These identifications respect adjunctions, the $!$-to-$*$ map, and diagonal orientation maps pulled back from the diagram without the axis.]
] <deform:fourier>

#proof[
  Compactify the $u$-line and put $z = u^(- 1)$ at infinity, retaining $t$ as a variable. Extension across $z = 0$ of the Fourier integrand is clean. Here is the local algebraic verification, which also explains why retaining $t$ is necessary. In a left-module presentation, sections obtained from the module before tensoring with the exponential, multiplied by Laurent functions of $z$ and polynomials of $t$, are killed by powers of $z partial_t - 1$. They generate the meromorphic extension. On a module supported at $z = 0$, however, $z partial_t$ is locally nilpotent, so $z partial_t - 1$ is invertible. The meromorphic star extension therefore has no quotient supported at the boundary. Duality excludes a boundary submodule of the shriek extension. Thus the cokernel and kernel, respectively, of the clean comparison vanish. Since both extensions across the affine Cartier complement are perverse exact, their comparison is an isomorphism. The assertion for complexes follows by perverse truncation.
  Use the $*$ integral to commute $!$-pullback and $*$-image with Fourier, and the canonically equal $!$ integral to commute $*$-pullback and $!$-image. Tensoring by the exponential connection is compatible with either pullback. Base change and the projection formula give the resulting identifications. Their transitivity, or equivalently their adjunction descriptions, proves compatibility with units and counits. The same compactification identifies both constructions of the $!$-to-$*$ map. Finally a diagonal orientation class is external to the axis; its pullback and tensor morphism use exactly these adjunctions. This proves compatibility also with orientation maps. ◻
]

We specialize Fourier transforms by $!$-pullback at $t = 1$. All diagrams where this is done carry an algebraic torus action rescaling $u$ through a nonzero power; the action may also move the other variables. Equivariance up to a Kummer factor suffices on frame torsors. Fourier gives the inverse action on $t$. After a finite cover of $bb(G)_(m \, t)$ and the coordinate change supplied by the action, the diagram is an external product in $t$. Base change at $t = 1$ therefore identifies its operations with the operations on the specialized diagram. For $*$ operations we use the smooth dimension conversion in this product. In particular, $i_1^(!) omega_t = k$, and covariant translation $"Trans"_psi$ of the $u$-axis gives tensoring with $"Exp" \( t psi \)$ after Fourier transform. This is a geometric base-change argument, rather than an interchange of a nonproper image and an arbitrary specialization.

Let $p : Z times bb(A)_u^1 arrow.r Z$. The projection that discards the constant part in the axis is

#[#set math.equation(numbering: n => "(5.2)")
 $ C_(!)^u \( K \) = "Fib" #scale(x: 120%, y: 120%)[\(] K arrow.r p^(!) p_(!) K #scale(x: 120%, y: 120%)[\)] . $ <eq:pre-axis-projection>]

The functor $p^(!)$ is fully faithful. Its image Fourier-transforms to objects supported at $t = 0$, and the localization triangle gives

$ sans(F) C_(!)^u \( K \) tilde.eq j_(t \, !) j_t^(!) sans(F) \( K \) \, #h(2em) j_t : bb(G)_(m \, t) arrow.r.hook bb(A)_t^1 . $

Thus $C_(!)^u \( K \) = 0$ is the precise test for vanishing of Fourier on the punctured axis. A comparison whose cone is killed by $C_(!)^u$ will be called an isomorphism #emph[modulo constants in $u$]. Operations independent of $u$, of either kind, preserve the constant subcategory, as does translation by a function of the other variables. Hence these comparisons can be carried through subsequent operations. We do not assert that $C_(!)^u$ commutes with a mixture of $!$ and $*$ operations. When there are two axes the constructions and their dilation actions are applied separately.

=== 5.3 Finite constructible calculations and Mellin ranks <finite-constructible-calculations-and-mellin-ranks>

Put $A_0 = bb(Q) \[ q \, q^(- 1) \]$, and let $M_q$ be the multiplicative rank-one $A_0$-local system on $bb(G)_m$ with monodromy $q$ and its unit rigidification. Twist calculations take place on frame torsors. A factor $M_q \( r \)$ means ordinary pullback and ordinary tensor product; equivalently one can use its dualizing normalization with $!$-tensor product. Specialization at $q = exp \( 2 pi i s \)$ and Riemann–Hilbert, after complexification, recover the regular-holonomic calculation with exponent $s$.

We make explicit the finiteness scope used below. A finite geometric calculation consists of a finite diagram of bounded algebraically constructible complexes, built by the six operations, cones, and finite totalizations from constant complexes, intersection complexes, and the displayed Kummer factors. The maps in the diagram are the geometric maps of these operations. Over an output chart the maps are finite type; maps used for $!$-image are schematic or separated representable. Smooth unipotent-extension stack projections are also permitted. Their two-term vector-stack presentations reduce the calculation to schematic ones, with the specified shifts and Tate twists.

For $*$-image we also allow finite-type Artin stacks with unipotent identity components of stabilizers and finite component groups. Stratify such a stack into gerbes over algebraic spaces, after flattening inertia and rigidification. Smoothly or étale locally these gerbes have the calculation of a classifying stack. A connected unipotent group is constructibly acyclic, and pullback along its torsors is fully faithful; one may further stratify to use split unipotent coordinates. Finite component groups contribute exact invariants in characteristic zero. Gluing the strata by localization triangles proves bounded constructibility and the coefficient formulas. The same argument, using safe base change, applies to holonomic $D$-module $*$-images. It also extends Lemma 16 to the stack operations just listed. Locally finite-type non-quasi-compact stacks are used only through these relative finite constructions over charts.

Every stalk of a finite calculation is a perfect $A_0$-complex, and coefficient specialization is derived tensor product. For schemes these facts follow by finite algebraic triangulations and the same finite link calculations for pullback and extension. The reductions above establish them for the allowed stacks.

We shall also use the mixed enhancement of these diagrams. Saito’s theory supplies the six operations, pure intersection complexes, weight inequalities, and quasi-unipotence of nearby cycles [33]; the enhanced formalism, including stacks, supplies the coherent diagrams of operations and their comparisons [36] Sections 1 and 3. All weight conclusions will be tested on finite schematic charts. In particular, cones and adjunction maps below are formed in the mixed category, not by choosing arbitrary maps after forgetting the mixed structure. Our weight convention is

$ K upright(" has weight ") lt.eq w quad arrow.l.r.double quad zws^p H^j \( K \) upright(" has weights ") lt.eq w + j upright(" for every ") j . $

The dualizing complex of a smooth scheme has weight zero. Ordinary pullback and $!$-image preserve upper weight bounds, as does the smooth conversion $\[ 2 e \] \( e \)$ in relative dimension $e$.

#thm([Lemma 5.2.])[
  (Non-torsion rank test).  #emph[Consider a finite geometric diagram as above. Assume that its $q$-dependence is introduced by Kummer factors $M_q \( r \)$ for algebraic invertible functions $r$, and that the corresponding diagrams with these factors recorded as graphs have mixed Hodge origin. At every output stalk, the dimensions of its specialized cohomologies and the ranks of the induced maps are constant as $q$ ranges over complex numbers that are not roots of unity. In particular, a finite output complex which vanishes at $q = 1$ vanishes at every such $q$.]
] <deform:rank>

#proof[
  To compare non-torsion specializations, introduce a recording coordinate $z in bb(G)_m$, independent of the Fourier axis. Replace an initial factor $M_q \( r \)$ by the graph $z = r$ and apply at the end
  #[#set math.equation(numbering: n => "(5.3)")
   $ K mapsto p_(!) #scale(x: 120%, y: 120%)[\(] K ⊗ M_q \( z \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:P2>]
  where $K$ is independent of $q$ and $p$ forgets $z$. For a complex of mixed Hodge origin, the nearby-cycle monodromies at $z = 0 \, oo$ are quasi-unipotent. Tensoring with $M_q \( z \)$ for non-torsion $q$ leaves no eigenvalue $1$ there. Thus both invariants and coinvariants vanish, and the extension over these endpoints is clean. Consequently the $!$ integral in (5.3) is canonically the $*$ integral. This criterion holds relatively, with charts and spectators retained. The argument of Lemma 16 therefore moves (5.3) past either pullback, either direct image, and their geometric comparison maps.
  For external products multiply the recording coordinates and use $!$-image along multiplication, since $M_q$ is multiplicative. This also explains cancellation of ratio twists. Before (5.3), a frame change rescales the recording coordinate by the corresponding positive or negative power. Two occurrences of an inner frame have opposite scalings. Their product recording coordinate is unchanged, so the complex descends through that frame torsor before the inner frame is removed. In local trivializations this is simply invariance of the product under opposite changes of variables by a unit. The graph construction and its maps respect these equivariances. We have therefore obtained (5.3) as a presentation of the whole specialized diagram for non-torsion $q$, including its maps. At $q = 1$ and with logarithm coefficients, we retain the original geometric diagram: the recording presentation is used only on the non-torsion locus.
  Pull to an output stalk. If $P$ is perverse on $bb(G)_m$ and of mixed Hodge origin, Artin vanishing and equality of $!$ and $*$ integration imply that $R Gamma \( bb(G)_m \, P ⊗ M_q \)$ is concentrated in degree zero. Its dimension is its Euler characteristic, independent of $q$: stratify $P$ and use that tensoring with a rank-one local system does not alter the Euler characteristic. The same reasoning applies to mixed subquotients. Taking perverse cohomology now proves constancy in each degree for a complex and exactness on the perverse subquotients. It also proves constancy for maps, either by their images in perverse cohomology or by the long exact sequence of their cones. Finally, perfectness of the original $A_0$-complex and vanishing of its derived fibre at $q = 1$ give vanishing at the generic parameter. The constant-rank conclusion on the non-torsion locus gives the last assertion. ◻
]

The preceding lemma concerns finite calculations. A zero colimit at $q = 1$ says that each cohomology class dies under some later transition; it does not say that any finite-stage complex vanishes. We therefore cannot apply the finite rank test directly to an increasing collection of pole bounds. The next lemma uses a uniform upper weight bound to turn vanishing at a finite logarithm length into a transition that kills the entire completed cohomology module.

=== 5.4 Logarithm coefficients and passage to colimits <logarithm-coefficients-and-passage-to-colimits>

Write $B_n = bb(Q) \[ h \] \/ h^n$. Substitution $q = exp \( h \)$ identifies $A_0 \/ \( q - 1 \)^n$ with $B_n$. The length-$n$ logarithm variation $cal(L)_n$ on $bb(G)_m$ has this monodromy and the usual Tate convention for $h$. Its quotients and ideals fit into exact sequences of admissible variations

#[#set math.equation(numbering: n => "(5.4)")
 $ 0 arrow.r cal(L)_(n - a) \( a \) arrow.r^(med h^a med) cal(L)_n arrow.r cal(L)_a arrow.r 0 #h(2em) \( n gt.eq a \) \, $ <eq:logarithm-sequence>]

with the first term zero when $n = a$. One can construct these variations as symmetric powers of the Kummer extension; their successive quotients are $bb(Q) \( j \)$, $0 lt.eq j < n$. In particular multiplication by $h$ lowers weights by two.

#thm([Lemma 5.3.])[
  (Logarithm colimit test).  #emph[Let ${ K_i }$ be a filtered system of finite geometric calculations with outputs on a fixed finite schematic chart. Suppose that each calculation and all transition maps are linear in a single input $M_q \( r \)$. Assume their substitutions by $cal(L)_n \( r \)$ lift to mixed diagrams compatibly with (5.4). For every stalk $x$ and every degree $d$, suppose that 
$ "colim"_i thin H^d #scale(x: 120%, y: 120%)[\(] \( K_i \)_(x \, q = 1) #scale(x: 120%, y: 120%)[\)] = 0 $

 and that the weights of these groups have a common upper bound $C_(x \, d)$, independent of $i$. Then the same cohomology colimit vanishes at every non-root-of-unity value of $q$.]
] <deform:colimit>

#proof[
  Fix $x \, d$ and write $C = C_(x \, d)$. Denote the stalk calculation with length-$n$ logarithm coefficients by $C_(i \, n)$. Linearity makes (5.4) an exact triangle of these calculations. Induction on $n$, the long exact sequence, and exactness of filtered colimits show that
  $ "colim"_i H^j \( C_(i \, n) \) = 0 quad upright("for every ") j \, n . $
  The same filtration shows that the weights of $H^d \( C_(i \, n) \)$ are at most $C$ for all $i \, n$: each successive term comes from $H^d \( C_(i \, 1) \) \( a \)$ and has weights at most $C - 2 a$.
  For a fixed $i$, perfectness and the Mittag–Leffler property give
  $ M_i := "proj lim"_n H^d \( C_(i \, n) \)_(bb(C)) = H^d #scale(x: 120%, y: 120%)[\(] \( K_i \)_x ⊗_(A_0)^L bb(C) \[ \[ h \] \] #scale(x: 120%, y: 120%)[\)] . $
  This is a finite $bb(C) \[ \[ h \] \]$-module. The coefficient exact sequence identifies $M_i \/ h M_i$ with the image of $M_i$ in $H^d \( C_(i \, 1) \)_(bb(C))$; it need not be all of that group. For precision, these images carry canonical mixed Hodge structures. Put $P_i = \( K_i \)_x ⊗_(A_0)^L bb(C) \[ \[ h \] \]$, and choose $e$ such that $h^e$ annihilates the $h$-power torsion of $H^(d + 1) \( P_i \)$. The universal coefficient sequence is
  $ 0 arrow.r M_i \/ h^n M_i arrow.r H^d \( C_(i \, n) \)_(bb(C)) arrow.r H^(d + 1) \( P_i \) \[ h^n \] arrow.r 0 . $
  Under transition from length $m$ to length $n$, the last map on these torsion terms is multiplication by $h^(m - n)$. For $m gt.eq n + e$ the image is therefore exactly $M_i \/ h^n M_i$: containment follows from that vanishing, and surjectivity onto it follows from $M_i \/ h^m M_i arrow.r M_i \/ h^n M_i$. Thus the latter modules are stabilized-image subobjects of the finite-length mixed Hodge structures, with surjective mixed transition maps.
  Deligne’s functorial complex splitting of mixed Hodge structures [10] permits a finite set of generators of this image to be chosen homogeneous for the weight splitting and lifted to weight-homogeneous elements of the inverse system. Indeed, choose a basis in Deligne’s bigrading at length one and lift recursively in the same bigraded components of the stabilized images. Strictness gives surjectivity on each such component. The resulting elements lift coherently and remain homogeneous in weight. Nakayama’s lemma says that their pro lifts generate $M_i$.
  Let $v$ be such a pro generator, of weight $w$. Choose $a$ with $C - 2 a < w$. Since the length-$a$ colimit is zero, a transition $i arrow.r i'$ kills the length-$a$ component of $v$. For every $n gt.eq a$, exactness of (5.4) puts its image at length $n$ in the image of
  $ H^d \( C_(i' \, n - a) \) \( a \) arrow.r H^d \( C_(i' \, n) \) . $
  The source has weights at most $C - 2 a$, whereas the image of $v$ is homogeneous of weight $w$. Strictness forces that image to vanish. Its components at lengths below $a$ vanish as well. Thus the whole pro generator is killed by this transition. There are finitely many generators, so one further transition kills $M_i$.
  The substitution $q = exp \( h \)$ embeds $bb(C) \( q \)$ into $bb(C) \( \( h \) \)$: a nonzero Laurent polynomial cannot vanish as a formal exponential polynomial. After extension to $bb(C) \( \( h \) \)$, the preceding conclusion says that the cohomology map from stage $i$ to a sufficiently late stage is zero at the generic coefficient parameter. Lemma 17 applied to this finite transition makes its rank zero at every non-torsion $q$. Each stage in each degree is consequently killed later in the system, which is precisely the required vanishing of the filtered colimit. ◻
]

#thm([Lemma 5.4.])[
  (Stalk detection for the colimits used here).  #emph[On a finite smooth chart, the filtered colimits of regular-holonomic complexes occurring above are detected by constructible stalks. The analogous holonomic Ind-category has a separated perverse $t$-structure and embeds fully faithfully into all $D$-modules.]
] <deform:stalks>

#proof[
  Bounded holonomic complexes on the chart are compact as $D$-modules. Hence their Ind-category, and likewise the Ind-category of regular-holonomic complexes, embeds fully faithfully. The perverse $t$-structure extends to a separated $t$-structure there. For regular-holonomic complexes, the bounded comparison between the perverse and ordinary constructible $t$-structures passes to Ind, so the latter is separated as well.
  It remains to justify stalk detection in its heart. The ordinary algebraically constructible heart is Noetherian. Indeed, consider an ascending sequence of subsheaves of one constructible sheaf. Choose a smooth connected open stratum where the ambient sheaf is lisse. The generic ranks stabilize. A term of that rank is lisse as a subsystem on a smaller open. Every later term agrees with it there: the quotient is a subsheaf of a local system with zero generic rank, hence is zero. Induction on the dimension of the closed complement proves stabilization. A finite stratification deals with several top-dimensional components. Every object of the Ind-heart is a filtered union of its Noetherian subobjects. If all its stalks vanish, each such subobject has zero stalks and hence is zero. Stalk detection and separatedness prove the claim for complexes. We have used constructible stalks only inside this Ind-category, not as a test for arbitrary all-$D$-module objects. ◻
]

=== 5.5 Finite Whittaker stages <deform:finite-stages>

We now apply the deformation lemmas to the kernel $F_W$. Let $S_I = X^I$, where $I$ is a nonempty finite set, and choose a common pole bound $m$ at its marks. Write

$ pi : cal(Y)_m arrow.r Y \, #h(2em) pi_S : cal(Y)_m arrow.r S_I $

for the pole model of Section 4; when appropriate $pi$ retains the marked positions. Spectator variables are carried throughout. For a relevant stratum $sigma$, write $f_sigma \, q_sigma \, psi_sigma$ for its embedding, unipotent-stack projection, and character. The base of $q_sigma$ is the corresponding configuration open $S_sigma$ in a partition stratum of $S_I$, and set $e_sigma = dim \( q_sigma \)$.

Lift $F_W$ to its constructible graph formula on frame torsors. Its only coefficient input is $M_q \( r \)$, for the relative frame ratio determined by the chosen spectator trivialization. The formula is the smooth pullback of $Delta_(!) k_Y$, so its smooth dimension shifts have the corresponding mixed Tate twists. Put

$ hat(F) = pi^(!) \( F_W times.square delta_(u = 0) \) . $

For the sign giving coefficient $"Exp" \( psi \)$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ hat(T)_sigma & = f_(sigma \, !) "Trans"_(+ psi_sigma) q_sigma^(!) \,\
hat(H)_sigma & = q_(sigma \, *) \[ - 2 e_sigma \] "Trans"_(- psi_sigma) f_sigma^(!) . $ <eq:P3>]

In mixed calculations the shift in the second line includes $\( - e_sigma \)$. Filtered determinants identify the twists along these operations. They therefore lift to the same frame torsors and add no new Kummer input. The opposite sign replaces $psi$ by $- psi$ everywhere.

#thm([Proposition 5.5.])[
  (Finite projection diagrams).  #emph[There is a canonical finite triangle 
$ hat(M)_(I \, m) arrow.r hat(F) arrow.r hat(F)_perp $

 such that $hat(M)_(I \, m)$ is a finite extension of images of the $hat(T)_sigma$ and every $hat(H)_sigma$ kills $hat(F)_perp$. After field specialization, Fourier transform, and $!$-restriction at $t = 1$, its first map is the counit of Whittaker projection of $pi^(!) F_W$. Denote that projection by $M_(I \, m)$. The augmented stages 
#[#set math.equation(numbering: n => "(5.6)")
 $ pi_(!) hat(M)_(I \, m) arrow.r F_W times.square delta_(u = 0) $ <eq:P4>]

 form a geometric diagram under increases of pole bounds and closed diagonals of marked parameters. This entire diagram is linear in the single initial Kummer input.]
] <deform:stages>

#proof[
  The stratum calculation of Proposition 12 gives the adjunction $hat(T)_sigma tack.l hat(H)_sigma$ and $hat(H)_sigma hat(T)_sigma = "Id"$. There are only finitely many relevant strata in a pole bound. Order them from the higher open strata to the lower ones. For each successive stratum, take the cone of its projection counit on the current remainder. Lower shriek extensions have zero restriction to the higher open strata already treated. Induction therefore kills all the $hat(H)_sigma$ and produces the stated triangle. Orthogonality to the generated subcategory characterizes the triangle, so its construction is independent of the chosen refinement of the order and is functorial, with coherent comparison maps.
  Cartan scaling by $2 rho$ acts on the Plücker data and scales each $psi_sigma$ by the square (or inverse square in the other action convention). Give $u$ the same scaling. The diagram is equivariant for this action. On the twist line pulled from $Y$ the action is trivial; its identification with a stratum line over $S_sigma$ carries the induced filtered-determinant action. Thus the required dilation equivariance persists in frame presentations containing Kummer factors. The Fourier specialization rules apply.
  After specialization, $hat(T)_sigma$ becomes the corresponding Whittaker shriek extension. It satisfies character equivariance on the stratum, and its holonomic extension preserves that equivariance by the smooth-arrow tests in (4.1). Vanishing of all the specialized $hat(H)_sigma$ is precisely the stratum criterion for zero Whittaker projection. Consequently the triangle specializes to the claimed projection triangle. The object $M_(I \, m)$ is locally holonomic. It is supported cleanly on a bounded-zero quasi-compact open containing the relevant strata: its $!$-restriction to the complement is zero by the stratum criterion; its $*$-restriction is zero by holonomic duality and the same criterion for the opposite character. This support conclusion is asserted after Fourier specialization; the pre-complex need not have both kinds of vanishing support.
  Apply $pi_(!)$ to the first arrow and use its adjunction with $pi^(!)$ to obtain (5.6). These are finite geometric operations on every output chart. The map $pi$ in a pole bound is relatively finite type; alternatively the first term is computed by its finite extensions from quasi-compact relevant strata.
  For transitions use the closed inclusions that increase pole bounds and the closed diagonals $S_I arrow.r.hook S_J$ associated to surjections $J arrow.r.twohead I$. Increase the new pole bound enough to include sums at coincident marks. The $hat(F)$’s restrict by $!$ to each other. Closed image preserves the subcategory generated by the $hat(T)_sigma$: for pole inclusions the old relevant strata are strata at the new bound, and for diagonals coincidences are already part of the stratification. The earlier $hat(M)$ therefore maps to the later $hat(F)$ through the later $hat(M)$. Orthogonality gives the factorization and all its coherences. Every step is geometric and linear in the single $M_q \( r \)$; hence the logarithm lifts and the recording presentation (5.3) apply to the diagram. ◻
]

For clarity, its colimit can be calculated without a compactness claim about the kernel. Let $r_(I \, m)$ be the $!$-restriction functors in the limit presentation of the Whittaker category, and $a_(I \, m)$ their left adjoints in the corresponding colimit presentation. For an object $A$ in that category,

$ A tilde.eq "colim"_(I \, m) a_(I \, m) r_(I \, m) A . $

Indeed mapping this formula to $B$ gives, by adjunction, the limit of the mapping complexes between $r_(I \, m) A$ and $r_(I \, m) B$, which is the mapping complex in the limit category. Here $M_(I \, m)$ computes $r_(I \, m) R_s F_W$. At $s = 0$, applying the known left adjoint $!$-Poincaré to $a_(I \, m) M_(I \, m)$ gives $pi_(!) M_(I \, m)$, again by adjunction. Both classical functors are continuous, so their tensored adjunction permits the spectator; the partial $!$-images on the holonomic arguments are their actual left adjoints there. Thus the Fourier-specialized colimit of (5.6) at exponent zero is exactly the ordinary $!$-Poincaré counit.

We will apply Lemma 18 to finite calculations presenting this colimit. Take the simplicial replacement on a skeleton of the stage diagram, restrict to finite subdiagrams, and then to finite skeleta. These form a filtered system with the same colimit. In the skeletal filtration, simplicial degree $l$ contributes with shift $\[ l \]$. Taking the augmented cone gives a filtered system ${ hat(C)_beta }$ of finite diagrams, where $beta$ records the finite subdiagram and skeletal truncation. These cones have all the coefficient and mixed-lift properties just proved. The shift $\[ l \]$ will be included in the weight estimate in Section 6.

=== 5.6 Comparison through the compactified diagonal <comparison-through-the-compactified-diagonal>

We next identify each finite Fourier-specialized stage with the formula defining $J_s$. This is a finite comparison, so Lemma 17, rather than the colimit lemma, suffices. Recall the proper Vinberg correspondence from Section 3,

$ b_(upright(V)) : macron(Y) arrow.r Y times Y \, #h(2em) J^b = \( j_0 \)_(!) l_(*) k_Y \, $

where $J^b$ carries the ratio twist with exponent $- s$ in the first slot. For a locally holonomic Whittaker object $D$ in a pole bound, form

$ cal(Z) = cal(Y)_m times_Y macron(Y) \, #h(2em) g : cal(Z) arrow.r cal(Y)_m times macron(Y) \, #h(2em) p_2 : cal(Z) arrow.r Y . $

The last map uses the second factor of the Vinberg correspondence. All these formulas retain spectator variables, and initially also the marked parameter $S_I$.

Let $cal(Z)^(upright("tr"))$ be the open where the Borel of the Plücker data and the opposite parabolic of the Vinberg data are transverse at the generic point of $X$. It contains the data over $j_0$. It is open because, in the section-matrix description, transversality is detected by generic nonvanishing of the Vinberg maps on the Plücker lines. The open-orbit description of each Vinberg fibre gives the test on fundamental lines for the omitted roots; for the actual root datum take positive multiples of the relevant weights. Transversality then implies nonvanishing for every highest-line map.

#thm([Lemma 5.6.])[
  #emph[The restriction $p_(2 \, upright("tr"))$ is representable and separated. On finite output charts the unrestricted $p_(2 \, *)$ has the unipotent-stabilizer finiteness required for the finite geometric calculus.]
] <deform:transverse-map>

#proof[
  At the generic point, an automorphism of the Plücker data lies in the maximal unipotent. Nonzero Vinberg matrices on the highest lines force every residual torus scaling to be trivial. The remaining kernel of the Vinberg map is in the radical of the opposite parabolic, whose intersection with this maximal unipotent is trivial. Automorphisms over the output are therefore trivial, proving representability.
  For separatedness use the valuative criterion for isomorphisms. The torus scalings comparing the matrices extend as units: their compositions on the Plücker lines are generically nonzero on the special curve. At the valuation given by the generic point of that special curve, choose integral frames putting both systems of Plücker vectors in standard form. This is possible because the reductions are nondegenerate. The isomorphism over the fraction field is now an element $n$ of the maximal unipotent. Choose an actual strictly dominant highest-weight representation, highest vector $e$, and an output covector whose composition with the Vinberg matrix takes unit value on $e$. The resulting row $ell$ is integral, $ell \( e \)$ is a unit, and $ell n$ is integral.
  These conditions force $n$ to be integral. To verify this, write its ordered root coordinates by increasing positive root height. Evaluate $ell n$ on $f_beta e$, where $f_beta$ lowers by a positive root $beta$. The coordinate for $beta$ occurs with coefficient a nonzero root-string integer times $ell \( e \)$, hence a unit over the complex DVR. All other nonconstant terms involve coordinates of smaller height: the total raising height cannot exceed that of $beta$, and a different root of the same height cannot reach the highest weight. Induction recovers each coordinate integrally. The isomorphism consequently extends at the generic point of the special curve. Normality and the codimension-one extension criterion for sections of the affine isomorphism scheme extend it over the entire curve family; its compatibility with the data extends as well. The argument retains marked parameters; if they are forgotten, their own separatedness supplies that part of the criterion.
  Finally, before restricting to the transverse open, inertia over an output chart embeds in the inertia of the Plücker data, because the Vinberg compactification is representable. The latter is unipotent. The previously established unipotent-stabilizer reduction therefore applies to $p_(2 \, *)$. ◻
]

Consider the two geometric arrows

#[#set math.equation(numbering: n => "(5.7)")
 $ p_(2 \, upright("tr") \, !) #scale(x: 120%, y: 120%)[\(] g^(*) \( D times.square J^b \) \|_(upright("tr")) #scale(x: 120%, y: 120%)[\)] & arrow.r p_(2 \, upright("tr") \, *) #scale(x: 120%, y: 120%)[\(] g^(!) \( D times.square J^b \) \|_(upright("tr")) #scale(x: 120%, y: 120%)[\)] \[ 2 b \]\
 & arrow.l p_(2 \, *) g^(!) \( D times.square J^b \) \[ 2 b \] . $ <eq:P5>]

The first arrow uses the orientation of the smooth diagonal of $Y$ and then the $!$-to-$*$ comparison on the transverse open. More explicitly, pull the diagonal class to the fibre product by the canonical base-change map and use the tensor-to-$!$-pullback morphism; this gives $g^(*) arrow.r g^(!) \[ 2 b \]$. The tensor morphism also follows from adjunction and the projection formula. The second arrow is restriction to the transverse open. Mixed versions include the Tate conversion belonging to $\[ 2 b \]$.

These are finite calculations on an output chart. Indeed, cut $cal(Y)_m$ to a bounded-zero quasi-compact open containing the relevant strata. The clean support of $D$ just proved shows that the star pull in the first term extends by shriek from this cut, whereas the shriek pulls in the other terms extend by star. Thus all three images are computed from the cut. Properness of the Vinberg correspondence now gives the finite calculation above an output chart. Enlarging the cut gives the same arrows by restriction and transitivity of the $!$-to-$*$ comparison. Proper base change and compatibility of orientation also make them natural under closed pushes in the stage indices.

After integrating the proper marked parameter $S_I$, the left term of (5.7) is $pi_(!) D$: this is the shriek calculation of the diagonal using the Vinberg correspondence. The right-source term is $J_s \( a_(I \, m) D \)$. For the latter identification, (4.3) transposes $a_(I \, m)$ to restriction. Pairing with $D$ makes the opposite Whittaker-projection counit an isomorphism, so one can use the unprojected pullback of the $!$-diagonal kernel. Vinberg proper pushforward and $!$-base change then give exactly the right-source expression. The $2 delta_N$ in $J_s$ cancels the normalization in (4.3); the remaining diagonal shift is $2 b$.

#thm([Proposition 5.7.])[
  (Finite Vinberg comparison).  #emph[For $s in.not bb(Q)$ and $D = M_(I \, m)$, both arrows in (5.7) are isomorphisms. They are natural under the stage transitions, smooth chart changes, and retention of marked parameters. The same conclusion holds for the fixed-point, fixed-label standard Whittaker objects of (4.6).]
] <deform:vinberg>

#proof[
  At exponent zero the two maps are precisely Lin’s geometric comparison [30] Propositions 2.2.4–2.2.5, Section 2.2.6, Section 8.1.3 and Proposition 8.1.4, Theorem 9.0.2. The restriction map is his vanishing after image from the nontransverse locus; the first arrow is the diagonal orientation and transverse $!$-to-$*$ construction of his transformation. The theorem says that both are isomorphisms for ordinary Whittaker arguments, also with marked parameters retained. Its diagonal is the ordinary diagonal; thus its torus-quotient presentation includes the central-cover push appearing in $J^b$. Its dimension is the stack dimension $b$, with the unshifted pair of opposite Whittaker objects used here.
  The assertion permits our chart spectator. To check this without an assertion about arbitrary tensor extension, first add extra marked points with zero pole allowance. Their pole model is the pullback of the original one, and the smooth modification tests preserve the Whittaker condition. Embed the affine spectator into affine space. Smoothly, or étale locally, that space is covered by schemes étale over it which are open in powers of $X$: use coordinate charts on the curve and translations in affine space. For such opens the assertion follows from the retained parameter theorem by open shriek extension to the whole power of $X$. Smooth-arrow character tests preserve equivariance under that extension. Restrict back to the open, and then use the closed image of the spectator. Proper base change commutes that closed image with every formula, since the spectator is carried along. Closed inclusions of pole bounds handle changes of bounds in this reduction.
  Now express the three terms and two arrows of (5.7) as finite pre-axis calculations on the chosen bounded-zero cut, using $hat(M)_(I \, m)$ and the regular constructible frame-ratio formula for $J^b$. The latter introduces a Kummer factor but no exponential. Multiply its recording coordinate with that of $hat(M)_(I \, m)$ in (5.3). Pullback by $g$ lifts to the frame torsors, and the inner frame descends because its two recording scalings are opposite. Thus all the arrows, including orientation and the push comparison, have the finite geometric presentation required by Lemma 17.
  Apply $C_(!)^u$ to the cones of the two arrows. The Cartan dilation preserves transversality, so the Fourier specialization rules identify their field specializations with the cones in (5.7) on the punctured Fourier axis. At $q = 1$ these projected cones vanish by the ordinary-level result and dilation. Although the pre-object itself need not have clean support, after Fourier at every nonzero character parameter the bounded-zero cut suffices by the clean support of the Whittaker object. This justifies the use of that cut in the test at $q = 1$. Lemma 17 makes the projected cones zero for every non-torsion $q$, in particular for $q = exp \( 2 pi i s \)$ with $s in.not bb(Q)$. Fourier and restriction at $t = 1$ prove the claim.
  For a fixed-label standard replace $hat(M)_(I \, m)$ by the formula (5.5) applied to $delta_(u = 0)$ and its stratum factor on frame torsors, with its fixed normalization shift. The stratum exponentials extend cleanly as in (4.6), and the same finite argument applies. All maps used were geometric and compatible with the indicated base changes, which proves the stated naturality. ◻
]

By continuity, the colimit of the stage comparisons identifies the Fourier-specialized augmentation (5.6), for irrational $s$, with a canonical map

#[#set math.equation(numbering: n => "(5.8)")
 $ J_s R_s \( F_W \) arrow.r F_W . $ <eq:P6>]

The projection counits and the Vinberg arrows make this a map of kernels, compatible with smooth spectator charts. At exponent zero the analogous counit has only an anti-tempered cone. The next section applies the finite Whittaker test to that cone, proves the uniform upper weight bound needed in Lemma 18, and thereby proves that (5.8) is an isomorphism at irrational exponent.

== 6 The finite Whittaker test and Plancherel identity <sec:plancherel>

We complete the deformation argument of Section 5. Its remaining input is a uniform upper weight bound for the finite approximations to the cone of (5.8). A finite Whittaker test makes that cone vanish at exponent zero and detects its vanishing at irrational exponents. The weight bound will then allow Lemma 18 to transfer the vanishing. Throughout, $Y = Y_H$, $b = dim Y$, and $D_s = D \( L_H^s \)$, as in that section. All the tests below act in the output bundle variable; the spectator variable is retained.

=== 6.1 A test at one point <planch:finite-test-construction>

Fix $x_0 in X$ and a parameter $z$ at $x_0$. Set

$ K = L^(+) H \, #h(2em) K_1 = ker \( K arrow.r H \) \, #h(2em) I^(-) = "ev"^(- 1) \( B^(-) \) \, $

and define

$ K^d = "Ad"_(z^(- rho)) K \, #h(2em) I^d = "Ad"_(z^(- rho)) I^(-) \, #h(2em) K_1^d = "Ad"_(z^(- rho)) K_1 . $

These conjugations take place in the adjoint group. They do not require $rho$ to belong to the cocharacter lattice of $H$. Write $Y \( J \)$ for the stack with level $J$ at $x_0$, so that $Y \( K \) = Y$. One may construct these stacks by formal frames and disk gluing, or by the corresponding smooth parahoric group schemes. The level changes used here are finite-type morphisms: after passage to a sufficiently deep congruence subgroup, they are the usual finite-dimensional homogeneous-space fibrations of jet-frame torsors. In particular, with

$ V = Y \( K_1^d \) \, $

the map $V arrow.r Y \( K^d \)$ is an $H$-torsor and $V \/ B^(-) = Y \( I^d \)$.

We define a functor $cal(T)_s$ in three steps. First pull by $!$ from $Y$ to $Y \( I^(-) \)$. Next apply the star intertwiner

$ p_(2 \, *) p_1^(!) \, #h(2em) Y \( I^(-) \) arrow.l^(med p_1 med) Y \( I^(-) ∩ I^d \) arrow.r^(med p_2 med) Y \( I^d \) . $

Finally apply finite $\( N \, chi_0 \)$ star averaging, where $chi_0$ is a nondegenerate residual character. Either sign of $chi_0$ is allowed. The last operation is the kernel transform for the open incidence

#[#set math.equation(numbering: n => "(6.1)")
 $ { \( \[ v n \] \, v \) : v in V \, med n in N } med subset med V \/ B^(-) times_(Y \( K^d \)) V : #h(2em) \( \[ v n \] \, v \) mapsto chi_0 \( n \) . $ <eq:P7>]

It uses $!$-pull from the first projection, tensor with the exponential of the displayed function, and star image to $V$. Fixed normalization shifts do not affect any vanishing or conservativity assertion in this subsection.

Here are the twisting lines in this construction. On $Y \( K^d \)$ use the determinant line defined by the lattice $"Ad"_(z^(- rho)) frak(h)_(cal(O))$, where $cal(O) = bb(C) \[ \[ z \] \]$. On $Y \( I^d \)$ correct its pullback by the inverse relative determinant of this lattice and $frak(h)_(cal(O))$. On frames the relative determinant is a fixed vector line whose torus character is

#[#set math.equation(numbering: n => "(6.2)")
 $ nu = sum_(alpha > 0) 2 "ht" \( alpha \) alpha = "Kil" \( rho \, - \) . $ <planch:det-character>]

The formula follows by counting the shifted root-lattice lines. Extend this character to the Iwahori through its torus quotient and form the associated line. Its inverse is the required correction. After taking exponent $s$, the resulting line agrees with the input twisting line on the intersection correspondence. Characters of that intersection are determined on its torus, so this check proves the agreement globally. On $V$ the frame trivializes the correction line, with its specified character law; use the same trivialization at $v n$ in (6.1). Thus $cal(T)_s$ is a well-defined functor from $D_s$ to twisted D-modules on $V$.

#thm([Proposition 6.1.])[
  (Finite Whittaker test).  #emph[The functor $cal(T)_0$ kills the anti-tempered subcategory of $D \( Y \)$. If $s in.not bb(Q)$, the functor $cal(T)_s$ is conservative on all of $D_s$. Both assertions remain valid after tensoring with a spectator D-module category.]
] <planch:finite-test>

#proof[
  For the assertion at zero we use the local Whittaker description of anti-tempering. In the notation of [14] Lemmas 4.2.0.1 and 4.3.0.1, Equation (4.3.1), the kernel of nondegenerate Whittaker $!$-averaging on positive-loop invariants is exactly the anti-tempered subcategory. That averaging factors through the translated first adolescent Whittaker level, whose inclusion in the full Whittaker category is fully faithful. Its finite-level formula is forgetful passage to the opposite Iwahori, star intertwinement, and residual finite Whittaker averaging. The last $!$-averaging agrees with star averaging on these inputs up to a fixed shift; see also [5] Section 3.1, Lemma 3.1.4. The resulting finite-level diagram on bundle stacks is exactly the construction above. The use of adjoint conjugation for a group on which $rho$ is not a cocharacter is allowed in this theorem; see [14] Remark 4.4.0.1.
  For completeness, the categorical mechanism explains why this assertion applies to all D-modules on the level tower. An object of positive-loop invariants determines an equivariant functor out of the Grassmannian module category. The Whittaker Grassmannian category is a tempered spherical module. Consequently the functor associated to an anti-tempered object becomes zero after taking Whittaker coinvariants: the tempered projector acts as the identity on that module, whereas precomposition with the projector kills the given functor. Whittaker invariants and coinvariants agree in the character conventions under consideration. The finite test lands in the first adolescent level, where the fully faithful inclusion detects zero. Its operations commute with the equivariant functor: this is clear for restriction and finite averaging, and for the intertwiner follows from the finite unipotent root-piece quotients of the two compact subgroups by their intersection. This also proves the assertion with spectators, without a holonomicity restriction.
  We next prove conservativity for irrational $s$. The first $!$-pull is conservative because the level map is smooth and surjective. To treat the intertwiner, choose a minimal gallery from the alcove of $I^(-)$ to that of $I^d$. The open Bruhat convolution for the associated reduced word identifies its product correspondence with the intersection-level correspondence. The star intertwiner therefore factors into the intertwiners for adjacent alcoves. Twists factor as well: at each Iwahori use its own Lie-lattice determinant and the inverse relative determinant with respect to $frak(h)_(cal(O))$. Transitivity of relative determinant gives the comparisons at consecutive intersections and recovers the prescribed endpoint lines.
  For adjacent alcoves, work smoothly locally over the wall-level stack. The correspondence is the open of distinct flags in a product of two projective lines for the rank-one reductive quotient. The wall-lattice determinant comes from the base; the remaining twists are the torus lines on the two flag varieties. Compose the star open kernel with the reverse shriek open kernel. To calculate this composition, fix the first and last flags. If they differ, the middle flag ranges over a twice-punctured projective line, with star extension at one puncture and shriek extension at the other. The regular-singular rank-one connection occurring in the tensor product has the same cohomology as its restriction to the link of the shriek puncture; the relative cohomology specified by shriek extension at that puncture is therefore zero. In coordinates with punctures $a eq.not c$, this is the fibre of the restriction map
  $ R Gamma \( bb(P)^1 \\ { a \, c } \, cal(L) \) arrow.r R Gamma \( "link"_c \, cal(L) \) \, $
  which is an isomorphism for every Kummer system $cal(L)$, including the trivial one. The $!$-tensor calculation has this description by Verdier duality and the projection formula. If the flags coincide, the ratio twists cancel. The projection formula for star image and $!$-tensor reduces the calculation to the constant kernel on an affine line, whose integral is a nonzero constant complex up to shift. The calculation is smooth along the diagonal. The composite is thus a nonzero constant multiple, up to shift, of the identity kernel. Each adjacent intertwiner is conservative. The alcove argument uses affine Weyl representatives, which exist for the actual root datum; it does not assert the existence of $z^(- rho)$ in $L H$.
  It remains to treat finite Whittaker averaging. Smoothly locally over $Y \( K^d \)$, its source is the flag variety $H \/ B^(-)$ and its output is the frame space $H$. The flag twist has torus character $- s nu$. Compose its star open kernel with the reverse star open kernel, using opposite pairing twists and the negative exponential. By the projection formula this is computed on the two open incidences. The composite is equivariant for the left $H$-action on the pair of flags. On a Bruhat stratum indexed by $w eq.not 1$, the stabilizer torus carries the Kummer character
  $ s \( w nu - nu \) $
  up to the harmless overall sign convention. The weight $nu$ is regular on the root system. Thus $w nu - nu$ is nonzero, and irrationality of $s$ makes the character nonintegral on some cocharacter of the stabilizer torus. The Kummer inertia test forces the equivariant category on that stratum to vanish.
  For the diagonal calculation we use $!$-restriction, rather than ordinary star pull. If $j_1 \, j_2$ are the two open incidences in the space of a pair of flags and an intermediate frame, the $!$-tensor projection formula and $!$-base change identify the tensor of their star extensions with star image from their open intersection. For the projection $q$ forgetting the intermediate frame and the diagonal inclusion $i_Delta$, schematic $!$-base change gives $i_Delta^(!) q_(*) = q_(Delta \, *) \( i'_Delta \)^(!)$, with $i'_Delta$ the pulled-back diagonal. Thus no interchange of nonproper star image with ordinary star restriction is being used. On the diagonal the two $n$-coordinates agree. Both the exponential factors and the twisting factors cancel. After fixing a flag and a representative of it, the remaining integral is the de Rham integral of the dualizing object on $N times B^(-)$. Its cohomology is nonzero and varies constantly along the diagonal. The composite therefore acts as the identity tensored with a nonzero complex of vector spaces, and is conservative. These are ordinary D-module kernel calculations on fixed finite-dimensional correspondences. They apply to all D-modules and commute with spectator factors. This proves the proposition. ◻
]

=== 6.2 Preparing both character parameters <planch:two-axes>

Let ${ hat(C)_beta }$ be the finite augmented cone diagrams constructed at the end of Section 5.5. They already carry the pre-axis $u$. Write $hat(cal(T))$ for the pre-axis version of the finite Whittaker test: adjoin $delta_(u' = 0)$, perform its pullback and intertwiner, and replace the exponential in (6.1) by translation of the second axis $u'$ by $chi_0 \( n \)$. Fourier specialization at its character parameter $1$ recovers $cal(T)_s$.

The new finite diagram has the dilation property in both axes. For $u'$ use the right torus action on frames: it conjugates $n$, scales $chi_0$ and $u'$ by the same square, and leaves the first flag $\[ v n \]$ fixed. The correction line transforms by its character law. The matched determinant lines define maps between frame torsors, and $hat(cal(T))$ transports the single coefficient input along these maps. At logarithm length $a$ this is one $cal(L)_a$ input; no tensor product over $bb(Q)$ of separate logarithm variations is taken. A change of trivialization merely rescales the one frame-ratio coordinate. Thus these operations introduce no new monodromy input.

Define the tested cones

#[#set math.equation(numbering: n => "(6.3)")
 $ hat(K)_beta = C_(!)^u C_(!)^(u') hat(cal(T)) \( hat(C)_beta \) . $ <planch:tested-cones>]

On fixed output and spectator charts, including their frame torsors, these are finite geometric calculations linear in the original Kummer input, with the compatible logarithm lifts of Section 5. To apply Lemma 18 we must prove two properties of this family: its cohomology colimit is zero at $q = 1$, and its weights in each stalk degree have an upper bound independent of $beta$. The next lemma proves the first property; the rest of the section establishes the bound.

#thm([Lemma 6.2.])[
  #emph[For every stalk $xi$ on a test chart and every degree $j$, 
$ "colim"_beta H^j #scale(x: 120%, y: 120%)[\(] \( hat(K)_beta \)_(xi \, q = 1) #scale(x: 120%, y: 120%)[\)] = 0 . $

]
] <planch:zero-colimit>

#proof[
  With both Fourier parameters nonzero, the exponent-zero Poincaré counit has anti-tempered cone by the enhanced classical Whittaker theorem recalled in Section 5. Proposition  23 kills this cone. Continuity gives the same statement with spectators. Dilation spreads vanishing at unit parameters to the product of the two punctured Fourier axes.
  This argument also commutes with the colimit used here. On smooth charts the calculations lie in Ind-holonomic complexes. The dilation identifications hold stage by stage, so the colimit vanishes after pullback to the dilation covers and hence before that pullback. Shriek extension from the punctured axes is computed in the same Ind-holonomic category and preserves this zero colimit. The Fourier description of $C_(!)^u C_(!)^(u')$ now gives the assertion for the tested cones $hat(K)_beta$. ◻
]

We will need one boundedness property of the fixed finite test. At $q = 1$, its pre-axis version increases upper weights and upper ordinary cohomological degrees by fixed constants on fixed test charts. To see the weight assertion, factor the intertwiner into adjacent-alcove steps and compactify each open by its proper wall-flag correspondence. Smoothly locally over the input flag, the star extension is external product with a fixed fibre kernel. Its weight cost is therefore fixed; the remaining push is proper. The same reasoning applies to (6.1): compactify the incidence inside $V \/ B^(-) times_(Y \( K^d \)) V$, retaining $u'$. To see the product over the input, choose a local lift $g \( f \)$ of its flag $f$. The incidence $\[ v n \] = f$ writes $v = g \( f \) b n^(- 1)$, with $b in B^(-)$. In the coordinate $g \( f \)^(- 1) v$, its open fibre is the fixed cell $B^(-) N$ and its character graph $u' = chi_0 \( n \)$ is independent of $f$. An arbitrary input is therefore external-tensored with this fixed star-extended graph kernel. The remaining projection, from the compactification to $V$ with the axis retained, is proper. Ordinary cohomological dimension gives the corresponding fixed degree bounds. Above a fixed output chart these level and flag correspondences require only fixed quasi-compact input charts. Finally each pre-axis projection uses a one-dimensional projection with fixed shifts. None of these costs depends on the number of marks, the pole bound, the Satake labels, or the skeletal degree.

The uniform estimate has three parts. The two opposite Hecke kernels have cancelling weights, removing dependence on the Satake labels. A spectral calculation then gives an upper cohomological degree independent of those labels and the number of marked points. Configuration integration lowers this degree by the collision codimension, and the simplicial shifts lower it further. Only finitely many collision codimensions and simplicial degrees can therefore contribute to any fixed stalk degree; their weight bounds will suffice.

=== 6.3 Satake decomposition of the finite terms <planch:satake-decomposition>

All weights from now until the final application are computed at $q = 1$. On frame-torsor charts the monodromy input is then constant in mixed Hodge modules. We use the mixed-complex convention of Section 5, and work on fixed final test charts. Smooth-chart dimension shifts are fixed constants there.

Take a term $pi_(!) hat(M)_(I \, m)$ of (5.6), retaining its pre-axis. Stratify $X^I$ by coincidence patterns. The filtration by $!$-restrictions expresses it by star extensions from these strata. Let $S_alpha$ have $n$ distinct points. Its closure is a diagonal copy of $X^n$, denoted $overline(S)_alpha$, and $j_alpha : S_alpha arrow.r.hook overline(S)_alpha$ is the open configuration inclusion. We first retain the marked parameters and use the entire stack $Y$ as spectator, with $F_Y = Delta_(!) k_Y$ in output–spectator order. All comparisons are relative and will subsequently be pulled to a smooth spectator chart $W$. Comparisons made modulo $u$-constants are used only after applying the pre-axis projections.

For a tuple $lambda = \( lambda_1 \, dots.h \, lambda_n \)$ of dominant coweights within the pole bound, let $sans(S)_lambda$ be the relative Satake operator. Our convention on bounded holonomic diagrams is

$ sans(S)_lambda \( D \) = p_(2 \, !) #scale(x: 120%, y: 120%)[\(] p_1^(*) D ⊗^(*) K_lambda #scale(x: 120%, y: 120%)[\)] \, $

where $p_1$ is the input projection and the Hecke projections are proper on the support. The labels are chosen so that application to the vacuum gives the corresponding Whittaker standard objects. Extend the kernels over $overline(S)_alpha = X^n$ by fusion. On the bundle Hecke correspondence set

$ d_lambda = sum_i chevron.l 2 rho_(upright("rt")) \, lambda_i chevron.r \, #h(2em) K_lambda = "IC"_lambda \[ - \( b + n \) \] . $

There are no half Tate twists. Thus $K_lambda$ has complex weight $d_lambda$, and its relative dual over the smooth base of dimension $b + n$ is

#[#set math.equation(numbering: n => "(6.4)")
 $ K_lambda^r = K_lambda \( d_lambda \) \, #h(2em) "wt" \( K_lambda^r \) = - d_lambda . $ <planch:dual-satake>]

The right adjoint $sans(S)_lambda^r$ uses the exchanged paths and this relative dual. The Tate twist disappears after forgetting the mixed structure, but its weight in (6.4) is essential below.

We recall the exchange properties being used. Fusion Satake kernels are universally locally acyclic (ULA) relative to either Hecke projection. The relative duality formula identifies $K ⊗^(*) p_i^(*) \( - \)$ with relative Hom from the dual kernel into $p_i^(!) \( - \)$; kernels and their relative duals commute with base change. Together with properness, this gives the displayed adjoints, exchange with $!$-pull, and exchange with star image under parameter changes. These are comparisons in mixed complexes. They may be checked after forgetting to constructible complexes, because the comparison maps, duals, and adjunctions are themselves mixed. At distinct fixed points the Hecke correspondences are locally products over both projections, using finite jet frames. Thus the same formulas hold for the holonomic exponential expressions after Fourier specialization. We use the usual fusion and Casselman–Shalika theorems with these relative normalizations; see [7,2].

The pole-model Hecke correspondence is the base change of the bundle Hecke correspondence along either projection: modifying the extension at the marked points transports the Plücker data. Its kernels are the star pullbacks of $K_lambda$. All calculations in a fixed bound use finite bounds. In particular, a modification bounded by $lambda$ takes the vacuum pole bound to the bound allowing exactly those dominant pole orders on the highest-line maps. This is the Schubert-bound estimate on representation lattices; at collisions the pole orders add. It also permits the adjoint calculation back to the vacuum using just the indicated forward bound.

Over $S_alpha$, denote the vacuum operations of (5.5) by $hat(T)_0$ and $hat(H)_0$. Their vacuum stratum consists of true $N_0$-bundles, with no poles or defects. Put

$ hat(Q)_lambda = sans(S)_lambda hat(T)_0 \, #h(2em) hat(H)^lambda = hat(H)_0 sans(S)_lambda^r . $

The following arrows are the evaluation maps of these adjunctions and the map induced by the Whittaker projection counit:

#[#set math.equation(numbering: n => "(6.5)")
 $ hat(M) arrow.l xor.big_lambda hat(Q)_lambda hat(H)^lambda \( hat(M) \) arrow.r xor.big_lambda hat(Q)_lambda hat(H)^lambda \( hat(F) \) . $ <eq:P8>]

Here $hat(M)$ and $hat(F)$ are $!$-restricted to $S_alpha$, and the finite sum ranges over its labels in the pole bound. Both arrows are isomorphisms modulo $u$-constants. Indeed Fourier commutes with the Hecke operations, whose kernels are external to the axis. The diagram has dilation because Hecke transport commutes with the Cartan action on Plücker data. At a nonzero character parameter, Casselman–Shalika identifies the vacuum translates with the standard objects of the Whittaker summands, while $hat(M)$ is the Whittaker projection. This gives the assertion. The verification may be made on $!$-fibres over $S_alpha$, also with spectators: properness and the local product description give the Hecke base changes, the Whittaker decomposition gives the projection base changes, and the vacuum bound is constant over the parameter base. Notice that the restricted $hat(F)$ uses $pi^(!)$ over $S_alpha$, so includes the base dualizing factor.

Define two objects without marked parameters:

#[#set math.equation(numbering: n => "(6.6)")
 $ U_0 = pi_(!) hat(T)_0 \( delta_(u = 0) \) \, #h(2em) U'_0 = hat(H)_0 #scale(x: 120%, y: 120%)[\(] pi^(!) \( F_Y times.square delta_(u = 0) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:P9>]

They live respectively on the output and spectator copies of $Y$, each with a pre-axis. Equivalently one may use a fixed marked point with pole bound zero in this definition. Write $*_(! \, u)$ for external product followed by $!$-image under addition of the two pre-axes.

#thm([Lemma 6.3.])[
  (Separation of the two bundle variables).  #emph[After (6.5), the term indexed by $lambda$, star extended to $overline(S)_alpha$ and pushed by $pi_(!)$ with marked parameters retained, is, modulo $u$-constants, 
#[#set math.equation(numbering: n => "(6.7)")
 $ sans(S)_lambda^(\( 1 \)) sans(S)_lambda^(' \( 2 \)) (\( U_0 *_(! \, u) U'_0 \) times.square \( j_alpha \)_(*) omega_(S_alpha)) . $ <eq:P10>]

 Both Hecke operations are over $overline(S)_alpha$. The second is the transpose-path version of $sans(S)_lambda^r$: its path is reversed back to the forward direction, but its kernel is $K_lambda^r$, rather than $K_lambda$. Formula (6.7) includes the base dualizing factors and has no additional shifts depending on $I$, $alpha$, or $lambda$.]
] <planch:separation>

#proof[
  First work over $S_alpha$. In $hat(H)^lambda \( hat(F) \)$, move $sans(S)_lambda^r$ from the pole model to the bundle stack. The Cartesian Hecke squares, properness, and the ULA exchange formulas justify this move through $pi^(!)$. Only the vacuum restriction for $hat(H)_0$ is needed, so the forward Schubert bound just described suffices. Acting on the first slot of the $!$-diagonal kernel is the same as acting on the second slot by the transpose-path operator $sans(S)'_lambda$. In both expressions, star pull followed by the diagonal $!$-image produces the same $!$-image along the Hecke path, with the same relative dual kernel. Now commute $hat(H)_0$ with that spectator operation. Its $!$-restrictions, vacuum translation, and star image satisfy the same exchange formulas. This gives $sans(S)'_lambda \( U'_0 times.square omega_(S_alpha) \)$.
  Next apply $hat(T)_0$ and the forward pole-model Hecke operator. The vacuum operation commutes with the spectator Hecke calculation by star-pull and shriek calculus. Before either Hecke operation we therefore have an external object with parameter factor $omega_(S_alpha)$. The ULA fusion kernels exchange with $\( j_alpha \)_(*)$, including the closed embeddings of pole bounds. Consequently extension to $overline(S)_alpha$ changes only that external factor, to $\( j_alpha \)_(*) omega_(S_alpha)$.
  Finally move $pi_(!)$, with parameters retained, through the pole-model Hecke operation. The Cartesian square and the exchange between star pull and $!$-image turn it into bundle-stack Hecke. Before this operation, the vacuum translation formula is exactly
  $ hat(T)_0 \( E \) = hat(T)_0 \( delta_0 \) *_(! \, u) E . $
  It gives the addition convolution in (6.7). Every step is relative to the spectator and hence commutes with smooth pull to $W$. The closed diagonal embedding $overline(S)_alpha arrow.r.hook X^I$ may be included afterwards and introduces no further shifts. ◻
]

=== 6.4 Uniform bounds before configuration integration <planch:uniform-bounds>

Replace the two vacuum inputs by

$ macron(U)_0 = C_(!)^u U_0 \, #h(2em) macron(U)'_0 = C_(!)^u U'_0 . $

This does not change (6.7) modulo $u$-constants: addition convolution with a $u$-constant is again $u$-constant, by a change of coordinates and the $!$-projection formula. The benefit is that both bar objects have a global upper weight bound, even though $Y$ is not quasi-compact.

#thm([Lemma 6.4.])[
  #emph[The objects $macron(U)_0$ and $macron(U)'_0$ have fixed upper complex-weight bounds on their entire bundle stacks. In (6.7), omit $\( j_alpha \)_(*) omega_(S_alpha)$ and instead use the unshifted constant complex $k_(overline(S)_alpha)$, of weight zero and ordinary degree zero. With the bar inputs, the resulting object has an upper complex-weight bound independent of $I \, alpha \, lambda$ and the pole bound.]
] <planch:vacuum-weight>

#proof[
  For $U_0$, the vacuum $!$-image factors through shriek extension from a fixed quasi-compact open of $Y$. Its source is the finite-type stack of $N_0$-bundles with fixed Cartan bundle, and its image is contained in such an open. The mixed object on that open is bounded; shriek extension preserves upper weights. Applying $C_(!)^u$ has a fixed weight cost.
  For $macron(U)'_0$, use Fourier only to identify support, not to assert preservation of Hodge weights. At nonzero Fourier parameter, $sans(F) U'_0$ is the $!$-Poincaré object of the opposite vacuum, up to a fixed shift and line. This is Lin’s vacuum comparison [30] Theorem 9.0.2 and Section 8.1, applied to the coefficient of the $!$-diagonal kernel as in (4.3) and (5.7). More explicitly that coefficient is
  $ q_(0 \, *) #scale(x: 120%, y: 120%)[\(] "Exp" \( - psi_0 \) ⊗^(!) f_0^(!) pi^(!) F_Y #scale(x: 120%, y: 120%)[\)] \[ - 2 delta_N \] . $
  Dilation changes the character parameter while leaving the bundle variable fixed. Hence over the punctured Fourier axis this object extends by shriek from one fixed quasi-compact bundle open. The Fourier transform of $macron(U)'_0$ is its shriek extension across the zero parameter. Inverse Fourier, which operates only in the axis variable, preserves the same bundle-open support property. The shriek-extension comparison exists in mixed complexes and is an isomorphism after forgetting the mixed structure. It is therefore an isomorphism in mixed complexes. On the fixed quasi-compact open, $macron(U)'_0$ has an upper weight bound, which extends to all of $Y$.
  Apply the two Hecke operations to these bar inputs. Star pull, star tensor, and proper image give upper weight bounds, and the kernel contributions $d_lambda$ and $- d_lambda$ cancel by (6.4). Addition convolution uses $!$-image and has a fixed cost. Thus the upper bound is independent of every index. Restoring the parameter factor in (6.7) simply star-tensors this object with its pullback, by projection formula. ◻
]

Restoring $\( j_alpha \)_(*) omega_(S_alpha)$ will introduce weight bounds that depend on collision codimension, which is unbounded as the number of points grows. We now prove a uniform degree bound that will limit the codimensions contributing to a fixed cohomology degree. This is the one place where the full classical geometric Langlands theorem enters the estimate.

#thm([Lemma 6.5.])[
  #emph[Fix smooth output charts on the two copies of $Y$. With the bar inputs and the parameter factor $k_(overline(S)_alpha)$ used in Lemma 26, the star restriction of (6.7) to every fibre of $overline(S)_alpha$ has a uniform upper ordinary cohomological degree. The bound includes all tuples of points, all further collisions, and all Satake labels.]
] <planch:satake-degree>

#proof[
  On a parameter fibre, fusion identifies Hecke with fixed-point Satake operators for tensor products of the given representations. We first bound the Fourier transform away from zero. For $macron(U)'_0$, the value at character parameter $1$ on a spectator chart $W$ is a kernel-valued Hom of the form
  #[#set math.equation(numbering: n => "(6.8)")
   $ "Hom"_(D \( Y \)) #scale(x: 120%, y: 120%)[\(] sans(S) P "vac"_(!) \, F_W #scale(x: 120%, y: 120%)[\)] \, #h(2em) P "vac"_(!) = pi_(!) T_0 \( k \) . $ <eq:P11>]
  Here $T_0$ is the exponential-specialized vacuum of the corresponding sign, $sans(S)$ is the usual fixed-point Satake operator, and Hom means application in the first kernel variable, with values in $D \( W \)$. Formula (6.8) follows from (6.6) by the transpose calculation in Lemma 25, the smooth vacuum adjunction with its specified shift, and $!$-image adjunction. These adjunctions tensor with the spectator. Their fixed-point kernel formulas hold for every representation tensor produced by fusion, with no additional shifts depending on its labels. Tate factors can now be forgotten, since we are proving a degree bound.
  The object $F_W$ is compact in $D \( Y \) ⊗ D \( W \)$. Indeed it is the $!$-image of a holonomic object on the finite-type affine scheme $W$ along its schematic graph map. The partial $!$-image has genuine adjunction against arbitrary D-modules, and the corresponding $!$-pullback is continuous. Compactness follows. The tensor-product theorem for the ordinary D-module category of $Y$ then expresses $F_W$ as a retract of a finite construction by extensions and shifts from exterior products of compact objects.
  Let $cal(L) = "LS"_(caron(H))$ be the derived stack of de Rham local systems. Under classical geometric Langlands, those first-factor compact objects become coherent compacts in $"IndCoh"_("Nilp") \( cal(L) \)$, and
  $ sans(S) P "vac"_(!) quad arrow.l.r quad Xi \( cal(V) \) \, $
  where $cal(V)$ is the evaluation representation vector bundle, or the tensor product of such bundles at the specified points. The global shift and line are fixed. This normalization is the vacuum normalization of [24] Sections 1.3–1.4, with Hecke compatibility from its Theorem 1.2.4 and Proposition 1.7.2, and the full equivalence from [25]. More explicitly, $bb(L)_(H \, "temp")^L \( cal(O) \) = P "vac"_(!)$ and $Psi bb(L)_H = bb(L)_(H \, "coarse")$ by [24] Corollary 1.6.5. Uniqueness of left adjoints after the equivalence gives $bb(L)_H bb(L)_(H \, "temp")^L = Xi$. It follows that the vacuum maps to $Xi \( cal(O) \)$ and its Satake translates to $Xi \( cal(V) \)$. The chosen theta characteristic transports the ordinary-D Hecke conventions; any resulting constant label lines do not change cohomological degrees.
  For a fixed coherent compact $C$, adjunction computes the mapping complex as
  #[#set math.equation(numbering: n => "(6.9)")
   $ "Hom" #scale(x: 120%, y: 120%)[\(] Xi \( cal(V) \) \, C #scale(x: 120%, y: 120%)[\)] = R Gamma #scale(x: 120%, y: 120%)[\(] cal(L) \, cal(V)^or ⊗^(*) Psi \( C \) #scale(x: 120%, y: 120%)[\)] . $ <planch:spectral-bound>]
  The right adjoint $Psi$ takes $C$ to a bounded coherent quasi-coherent complex. Tensoring with a vector bundle is t-exact, irrespective of its rank, highest weight, or evaluation points. The fixed derived QCA stack $cal(L)$ has finite cohomological dimension for quasi-coherent global sections in characteristic zero; we use the QCA finiteness theorem [11]. Thus (6.9) has an upper bound depending on $C$ and $cal(L)$ only. Finite extensions, shifts, retracts, and the fixed compact $D \( W \)$ factors yield a uniform perverse-D upper bound in (6.8).
  For $macron(U)_0$, Lin’s vacuum comparison identifies its Fourier transform on the puncture with the corresponding transform for $macron(U)'_0$ of the opposite sign, up to a fixed normalization. Applying fixed-point Satake therefore gives the same bound. The two bundle charts may be chosen independently.
  The fixed-fibre Satake operations commute with shriek extension across the Fourier origin, by their kernel formulas. On the puncture, dilation makes the preceding bound uniform in the parameter, with only a fixed dimension shift after the dilation cover. The principal affine-open extension $j_(t \, !)$ is t-exact on holonomic complexes. Fourier is t-exact with its fixed normalization shift. The same perverse bounds thus hold on the whole pre-axis. The chart dimensions are fixed, so they also give uniform upper ordinary degrees. Finally the addition convolution $*_(! \, u)$ has fixed relative dimension and commutes with the fixed-fibre Hecke calculations. It changes this upper bound by a fixed constant. This proves the lemma. ◻
]

=== 6.5 Configuration strata and the uniform weight estimate <planch:configuration-estimate>

We now restore $\( j_alpha \)_(*) omega_(S_alpha)$ and integrate the marked parameters. Stratify $overline(S)_alpha = X^n$ again by coincidence patterns. If a stratum $S'$ has $n'$ distinct points, write

$ c' = n - n' gt.eq 0 . $

In this second filtration we use star restrictions to strata and shriek extensions for integration.

The star restriction of $\( j_alpha \)_(*) omega_(S_alpha)$ to $S'$ has ordinary upper degree

#[#set math.equation(numbering: n => "(6.10)")
 $ c' - 2 n . $ <planch:link-degree>]

Indeed local coordinates on the curve identify a normal slice with a product of central braid arrangements of total rank $c'$. The local links have the cohomology of their arrangement complements, whose cohomology vanishes above $c'$. The dualizing normalization $\[ 2 n \] \( n \)$ gives (6.10). The same restriction has a complex-weight upper bound depending only on $c'$. This follows from the mixed arrangement description, which is étale local in curve coordinates. For fixed $c'$ there are only finitely many nontrivial collision types: every block of size $r > 1$ consumes $r - 1$ units of codimension, and singleton blocks contribute only smooth factors. Finally $\[ 2 n \] \( n \)$ is neutral for the complex-weight convention. Thus neither the number of singleton blocks nor $n$ changes this weight bound.

Let $E$ be the fixed upper degree from Lemma 27, with the fixed costs of convolution included. Integrating the piece over $S'$ by $!$ adds at most $2 n'$ to ordinary cohomological degree, while preserving upper complex weights. Its contribution on the test charts therefore has upper degree

#[#set math.equation(numbering: n => "(6.11)")
 $ E + c' - 2 n + 2 n' = E - c' \, $ <planch:codimension-decay>]

and an upper complex-weight bound depending only on $c'$. The closed embedding of $overline(S)_alpha$ back into $X^I$ adds no further cost.

The comparison with the original terms is made after the pre-axis projections. Every arrow used in Lemmas 25–27 is defined in mixed complexes. Where its being an isomorphism was checked by Fourier and projection, that check was on underlying field complexes and therefore also detects the mixed isomorphism. The fixed finite test and both pre-axis projections add only the fixed costs established in Section 6.2. The augmentation-target term has fixed bounds as well.

#thm([Proposition 6.6.])[
  (Uniform weight estimate).  #emph[Fix a test chart, a stalk $xi$, and a degree $j$. The mixed Hodge structures $H^j \( \( hat(K)_beta \)_(xi \, q = 1) \)$ have a common upper weight bound, independent of $beta$ and hence of all pole, configuration, label, and skeletal indices.]
] <planch:weight-estimate>

#proof[
  For skeletal degree $l$, the shift $\[ l \]$ in the finite approximation lowers (6.11) to
  $ E' - c' - l \, $
  where $E'$ includes all fixed shifts. The complex-weight bound depends only on $\( c' \, l \)$. A term can contribute to degree $j$ only if
  $ c' + l lt.eq E' - j . $
  Since $c' \, l$ are nonnegative integers, only finitely many such pairs occur. Take the maximum of their degree-$j$ weight bounds. The finite-stage filtrations use finite sums and extensions, and an upper weight bound on cohomology in a fixed degree passes to extensions. The resulting bound is uniform in every remaining index, as asserted. ◻
]

=== 6.6 Completion of the identity <completion-of-the-identity>

#thm([Theorem 6.7.])[
  (Plancherel identity).  #emph[For $s in.not bb(Q)$, the natural transformation (5.8) is an isomorphism. Consequently 
$ J_s R_s tilde.eq "Id"_(D_s) \, $

 as asserted in (5.1).]
] <planch:identity>

#proof[
  On every test chart the family ${ hat(K)_beta }$ of (6.3) is linear in the single frame-ratio Kummer input and has compatible logarithm lifts. It therefore satisfies the finite-stage logarithm and rank hypotheses of Lemma 18. Its cohomology colimit vanishes at $q = 1$ by Lemma 24, and Proposition 28 supplies the required degreewise uniform upper weights. The colimit lemma and stalk detection in Lemma 19 therefore give $"colim"_beta hat(K)_beta = 0$ at every parameter that is not a root of unity, in particular at the monodromy of every irrational $s$.
  Fourier transform in the two pre-axes and take $!$-fibres at the two character parameters $1$. The pre-axis diagrams are regular holonomic; Fourier and specialization are computed in the holonomic Ind-categories on charts. Away from zero character parameters, the pre-axis projections do not change them. We obtain a zero cone after applying $cal(T)_s$ to (5.8). Its conservativity in Proposition 23 proves (5.8) on each spectator chart. All arrows used were natural stack morphisms, so this is the required isomorphism of kernels. The pseudo-identity equivalence of Section 3 then gives (5.1). ◻
]

== 7 Loop categories over moving divisors <sec:loop>

The local comparison will involve marked points that move and collide. We therefore construct its categories and pairings over a parameter scheme, including their infinitesimal transport. The essential output is the pairing (7.5) and its continuous, parameter-linear right adjoints. The construction also identifies the strong equivariance used in that pairing with the Harish–Chandra models used for the representation-theoretic calculations in the next sections.

=== 7.1 Divisors, determinant lines, and parameter directions <divisors-determinant-lines-and-parameter-directions>

Let $S$ be a smooth affine scheme with a finite tuple of maps $x_l : S arrow.r X$. Additional parameters are allowed. Complete along the #emph[sum] of their graphs. Repeating a graph changes its multiplicity but not the resulting formal completion or meromorphic algebra. After an étale localization, separate disjoint clusters and choose a curve coordinate $z$ and a frame of the theta characteristic. On one cluster the divisor has equation

$ u = P \( z \) = product_l \( z - x_l \) . $

Only the formal neighborhood of the marked points in this coordinate chart is used. Write $L G$ and $H = L^(+) G$ for the resulting relative loop and arc groups. The groups are twisted by $P_0$; the displayed coordinates include a trivialization of $P_0$. In particular, the intrinsic unipotent group is $N_0$.

The relative determinant extension is the multiplicative line

$ cal(L) \( g \) = det \( g frak(g)_(cal(O)) : frak(g)_(cal(O)) \) \, $

with first lattice over second lattice and the adjoint action on $frak(g)$. The lattice indices vanish, so this is an ordinary multiplicative line. It is the local line in the global Hecke correspondence. Its Lie cocycle is

$ \( x \, y \) mapsto "Res" "Kil" \( d x \, y \) . $

Indeed, the Tate trace cocycle is the trace of the two off-diagonal blocks relative to the regular lattice; on modes $a z^m \, b z^(- m)$, with $m > 0$, it is $m "Tr" \( a b \)$. This proves the formula at distinct points. Both sides are polynomial identities in each bounded collection of Laurent coefficients, and the relative residue formula gives the same identity on the collision locus.

Put $ell = hat(frak(g))_(cal(K))$ for this Tate Lie algebra with its central extension. Its central element acts by

$ - s = frac(k_a, 2 h^or) . $

Thus the basic-form level is $k_a$ and the shifted level is $a$. The sign comes from the frame convention: a frame for a modification glues from the inside to the outside, and sections transform by its inverse power. Left convolution consequently uses the twist $cal(L)^(- s)$.

For a module $M$, a loop $g$, and a determinant lift $tilde(g)$, the family of conjugated modules, paired with this convolution twist, is given in left-module normalization by

#[#set math.equation(numbering: n => "(7.1)")
 $ x & mapsto "act"_M \( "Ad"_(g^(- 1)) x \) \,\
partial_v & mapsto partial_v + "act"_M \( tilde(g)^(- 1) partial_v tilde(g) \) . $ <eq:L1>]

Here $partial_v$ differentiates in the parameter direction while holding the curve coordinate $z$ fixed. Changing the determinant lift adds $- s$ times its logarithmic derivative, so this family has twist $s$. The second line is essential: conjugation alone does not specify the connection when the marked points move. We construct the categorical meaning of (7.1) below.

We use crystals of presentable categories in the sense of [2] Section 2 and Appendix B, especially Sections B.3.8–B.3.11 and B.14. By [18] Theorem 2.6.3, a crystal over $S$ is equivalently a $D \( S \)$-module category. Its underlying quasi-coherent category is

$ cal(E)^0 = "QCoh" \( S \) ⊗_(D \( S \)) cal(E) \( S \) \, #h(2em) b : cal(E) \( S \) arrow.r cal(E)^0 . $

The functor in this tensor product is the left-crystal forgetful functor: it sends $F^(chevron.l S chevron.r)$ to its underlying quasi-coherent module. After applying $b$, equivariant operations on smooth schemes over $S$ are relative operations. This follows either from crystal base change or from the relative differential-operator algebra.

We will check crystal compatibilities on the formal diagonal groupoid of $S$. This means all finite infinitesimal neighborhoods of every multiple diagonal, with their coherent pullback maps. Since $S$ is smooth, the projections may be computed using cofinal neighborhoods finite and flat over $S$. The use of this groupoid will permit moving congruence subgroups; it does not declare a fixed finite jet group to be horizontally constant.

=== 7.2 Relative convolution and equivariance <relative-convolution-and-equivariance>

Let

$ cal(A) = D_(* \, cal(L)^(- s)) \( L G \) . $

The subscript specifies star convolution and its pro convention. In the ind direction we use closed direct images. In the pro direction we use systems compatible under star direct image. The pro projections have smooth unipotent affine-space fibers; their star-compatible limit is also the colimit under normalized smooth pulls, the left adjoints of those direct images.

Concretely, on a bounded part of $L G$ stable on the right under $H$, take quotients by sufficiently deep congruence subgroups $K subset H$. Left quotients give the same category: bounded conjugation sends sufficiently deep congruences into any specified congruence, so both presentations have common higher-jet refinements. A bounded part may be the preimage of a closed bound in the affine Grassmannian. Multiplication is star direct image with the multiplicative line. All products are relative: for the finite-type schemes used in these presentations,

$ D \( U \) ⊗_(D \( S \)) D \( V \) tilde.eq D \( U times_S V \) . $

This is the D-module tensor-product formula, followed by base change along the base diagonal; it also holds with the indicated twists. For any finite string of products and any output jet level, sufficiently deep input levels make the calculation finite-dimensional. Composition of star direct images then proves associativity, including its higher coherences. The delta system at the identity is the unit.

We need an equivariance calculation over $S$, where jet groups can vary with the divisor. A #emph[strong action] in the following statement means an action of the convolution category of D-modules. This is stronger than an algebraic action on the underlying category.

#thm([Proposition 7.1.])[
  (Relative invariant and coinvariant calculation).  #emph[Let $J arrow.r S$ be one of the smooth affine finite jet groups of the arc, congruence, or unipotent groups used here. Put $A_J = D_(*) \( J \)$ and let $upright(bold(1))_J = D \( S \)$ be its module given by relative de Rham direct image. For every $D \( S \)$-linear strong $J$-category $cal(E)$, the norm calculation identifies $cal(E)_J$ with $cal(E)^J$, naturally also in additional coefficient categories. Under this duality:]
  + #emph[geometric relative tensor products over $A_J$ are D-modules on contracted products, with star integration in a free group variable;]
  + #emph[$"End"_(A_J) \( upright(bold(1))_J \) = D \( B_S J \)$, with ! tensor;]
  + #emph[the unbalanced evaluation 
$ "ev"_J : zws_(A_J) upright(bold(1))_J ⊗_(D \( S \)) upright(bold(1))_J zws_(A_J) arrow.r A_J $

 has a continuous right adjoint, linear for the left and right $A_J$-actions. Both actions on $upright(bold(1))_J$ are given by the de Rham augmentation.]
  #emph[The assertions hold for the pro-smooth groups in use, whose kernels over a finite jet stage are pro-unipotent, and commute with change of smooth parameter base. Character versions use the corresponding exponential and its inverse on opposite sides.]
] <loop:relative-equivariance>

#proof[
  For a constant finite-dimensional group, this is strong-group-action duality; see the distinction between group schemes and loop indgroups in [32] Section 1.5.4. We reduce the relative case to this one without assuming that $J$ is constant.
  Locally on $S$, embed $J$ in a constant general linear group $D_0$ over $S$, with schematic quotient $W = D_0 \/ J$. The embeddings needed here can be constructed as follows. An arc jet group acts faithfully on a finite free module over the finite divisor algebra. Restriction of scalars embeds it in a general linear group over $S$. The intermediate quotient parametrizes module structures over the divisor algebra for which it is locally free of the specified rank over the divisor algebra. This is an open locus in an affine representation scheme. The remaining quotient is affine, since the original reductive group has affine quotient in a general linear group and restriction of scalars along a finite flat map preserves affines. Split unipotent jet groups admit upper-triangular embeddings using their root and congruence filtrations. The same construction applies after restricting to a base chart.
  The relative D-module category of a finite-type schematic map $U arrow.r S$ is dualizable over $D \( S \)$: its coevaluation is the relative diagonal kernel $Delta_(*) omega_U$, and evaluation is ! tensor followed by star integration. The triangle identities are base change on the relative square. Transposing an action using this duality gives its !-coaction and hence the usual descent diagram for strong invariants.
  Consider
  $ cal(B) = A_(D_0) ⊗_(A_J) cal(E) . $
  We first show, by a free-action computation, that
  $ cal(B) tilde.eq #scale(x: 120%, y: 120%)[\(] D \( D_0 \) ⊗_(D \( S \)) cal(E) #scale(x: 120%, y: 120%)[\)]^J . $
  Here $J$ acts by right translation on $D_0$, and inversion identifies the required right and left conventions. If $m mapsto m^h$ denotes the transposed coaction, the comparison is star averaging: on a trivialized right torsor $U arrow.r W$, its ! family at a section $x$ is the star integral in $h$ of $K \( x h \) ⊗^(!) m^h$. The coaction identity makes this an equivariant family. Shearing two group variables shows that convolution on $K$ is the action on $m$, so the comparison is balanced; the same calculation for strings supplies the coherent balance.
  For a trivial torsor, pulling the family to a section splits its descent bar. The extra degeneracy identifies its invariants with coefficients on $W$, and the ! fiber of the displayed averaging formula is exactly the original action. Thus the comparison is an equivalence on a trivial torsor. A smooth torsor has sections étale locally. Restriction to such a cover commutes with the descent limits, by the relative dualizability just proved, and with the tensor bars. Descent for $D \( W \)$-module categories follows from the 1-affineness of $W_(upright("dR"))$. It therefore gives the claimed equivalence over $W$, and over $S$. The construction is $A_(D_0)$-linear.
  Associativity of relative tensors, constant-group duality, and this free-action formula now give
  $ cal(E)_J tilde.eq cal(B)_(D_0) tilde.eq cal(B)^(D_0) tilde.eq cal(E)^J . $
  For the last equivalence, interchange the two commuting descent diagrams and apply translation descent on $D_0$. These computations also work with coefficient categories and hence identify the claimed module duality, rather than just its value on one category.
  On the regular category, translation descent identifies the two trivial modules with $D \( S \)$. Evaluation is consequently the smooth pull kernel on $J$, up to an invertible normalization from the base. Its right adjoint is star integration with the corresponding smooth shift. The projection formula and the shear map identify the canonical adjunction-linearity maps for the two convolutions with isomorphisms. The contracted-product formula and the description of the endomorphism category follow from the same descent calculation.
  Finally, for a pro-unipotent kernel, normalized smooth pull of the unit is a convolution idempotent at every finite quotient. Its image is strong equivariance, and its continuous right adjoint is star averaging. The delta unit in the pro-convolution convention is the filtered colimit of these idempotents for decreasing kernels: this is checked by projection to every finite level. This reduces the assertions to a finite quotient. In particular $D \( B_S J \)$ may be computed at any finite stage with pro-unipotent kernel. All maps in the argument are relative pull, star integration, or tensor bars, so the construction commutes with the asserted base changes. ◻
]

This proposition is used only for finite-dimensional or compact pro-groups. Coinvariants for the indgroup $L N$ will instead be formed as a colimit over compact subgroups.

=== 7.3 Renormalized Harish–Chandra categories <renormalized-harishchandra-categories>

We next describe the underlying quasi-coherent categories, after applying $b$. Every compact-generation assertion in this subsection is made in these categories. It does not assert generation by horizontal objects; in particular, multipoint Kazhdan–Lusztig categories need not be ULA-generated [2] Remark B.14.25. Put $R = cal(O) \( S \)$. Modules for $ell$ are smooth: every vector is annihilated by a sufficiently deep Lie lattice. Let $J$ be an arc group, a congruence subgroup, or a pro-unipotent compact open of the kind above, with Lie algebra $j$ and a specified splitting of the extension. A character $chi_J$ is incorporated by the augmentation

$ K mapsto p_(J \, *) #scale(x: 120%, y: 120%)[\(] K ⊗^(!) "Exp" \( chi_J \) #scale(x: 120%, y: 120%)[\)] . $

The corresponding Harish–Chandra condition identifies the differential of the $J$-action with the $ell$-action #emph[minus] $chi_J$. This sign agrees with (7.1).

Define the renormalized category for $\( ell \, J \)$ as the Ind category of the idempotent-complete stable category generated by

#[#set math.equation(numbering: n => "(7.2)")
 $ "Ind"_j^ell \( V \) \, $ <eq:L2>]

where $V$ ranges over algebraic $J$-representations that are vector bundles over $S$. Impose the specified central value and character correction. The mapping complexes on these generators are the ordinary derived Harish–Chandra mapping complexes. By induction adjunction, they are the derived algebraic $J$-maps from $V$ to the restricted target. Renormalized pro-group representations are defined in the same way, omitting Lie induction.

#thm([Proposition 7.2.])[
  #emph[The underlying quasi-coherent categories have the following properties.]
  + #emph[The comparison with the ordinary derived category of smooth Harish–Chandra modules is t-exact and is an equivalence on complexes bounded below in cohomological degrees.]
  + #emph[The category for $\( ell \, J \)$ is monadic over renormalized $J$-representations, with the PBW induction monad. Its t-structure is created by the forgetful functor.]
  + #emph[The compact-generator mapping calculations commute with smooth affine base change, restriction to smooth closed collision and graph charts, residue fields, and the finite flat scalar extensions used on infinitesimal diagonals. In the last case the generators are perfect relative to the scalar extension.]
  + #emph[Restriction to a smaller compact open with smooth finite-dimensional quotient preserves compact objects. Between pro-unipotent opens it is fully faithful and has a continuous right adjoint.]
] <loop:hc-renormalization>

#proof[
  The pointwise renormalization and bounded comparison are developed in [31] Sections 9.11–9.13 and 10.8; we give the relative calculation needed here. First consider finite group stages. The quotient presentations in the proof of Proposition 30 give the resolution property. Indeed, quasi-coherent representations are generated by vector bundles: use generation on the quasi-affine homogeneous space, and then finite algebraic subrepresentations of its sections. General linear group invariants are exact in characteristic zero, and a quasi-affine scheme of finite type has bounded cohomological dimension. On the smooth base, bounded coherent equivariant complexes are therefore perfect and compact. Ordinary equivariant descent supplies the derived representation category at these stages. Restricted perfects generate after the stated base changes, either by the same quotient presentation or by testing after the affine pushforward.
  Every algebraic representation of a pro-group is exhausted by the subobjects fixed by deeper kernels, as follows from its coaction. Mappings between bounded coherent objects are computed by the group cobar resolution. If the target complexes are bounded below in a fixed range, maps from a finite vector bundle commute with filtered colimits: degree by degree the cobar computation uses only a finite part of the resulting first-quadrant total complex. This proves the bounded-below comparison for renormalized group representations. More explicitly, the hearts are generated by the finite-stage representations; bounded complexes lift using the mapping calculation; and bounded-below complexes are obtained as colimits of their good upper truncations. The same calculation shows that the renormalized pro-category is the colimit of the finite-stage renormalized categories. The finite-stage transition functors need not be fully faithful.
  For later use, in the pro-unipotent case the compact representation category is thickly generated over $R$ by the trivial representation. At a finite stage, the successive vector-group quotients act by commuting locally nilpotent operators. On a coherent representation they supply a finite filtration by coherent subobjects with trivial successive action; repeat with the quotient group and resolve over the smooth affine base. This proves the assertion at each stage and hence in the pro-category.
  The Lie induction monad is the PBW monad. The quotient of the Tate Lie algebra by an open lattice is a union of finite locally free summands, so PBW makes induction exact. The adjoint $J$-action is algebraic: sufficiently high congruences fix each specified bounded Laurent expression and each vector fixed at a sufficiently deep level. The monad thus acts on the representation categories just constructed. Its extension to their Ind categories agrees on bounded-below objects with the ordinary induction monad. Its free modules have exactly the mapping complexes prescribed in (7.2), proving the monadic assertion. The ordinary induction and forgetful functors are exact, the latter is conservative and commutes with colimits, and all monad iterates agree in the bounded-below comparison. This proves the first two assertions for Harish–Chandra modules.
  For base change, compute the generator mappings with the same relative cobar complexes and PBW modules. Their terms are $R$-flat, and the asserted changes have finite Tor dimension; for a regular closed chart this is given by its finite Koszul resolution. The bounded-below calculation therefore commutes with the derived tensor product. A finite flat algebra from an infinitesimal diagonal is treated as an algebra object in these categories. Its compact generators are obtained from perfect scalar extensions, not by declaring every coherent module over that possibly singular algebra compact. The free-generator cobar calculation gives the same base-change and bounded-below assertions there.
  Finally, restriction of (7.2) to a smaller open is resolved by the finite-dimensional relative Chevalley complex for the difference of the Lie lattices. Retain the smaller group’s equivariance throughout. This finite resolution proves compact preservation. The opens may first be refined through a common deeper congruence with smooth quotients. If both opens are pro-unipotent and the smaller is normal, the assertion of full faithfulness is the equality of the relative Chevalley calculation and algebraic group cohomology for the finite-dimensional unipotent quotient. For a nonnormal inclusion use a still smaller normal subgroup.
  On bounded-below modules the essential image consists of those objects whose corrected Lie action integrates to the larger pro-unipotent group. Such integration is unique and is preserved by extensions. Smoothness reduces this assertion, vector by vector, to local nilpotence for a finite-dimensional unipotent quotient. The fully faithful assertion then extends from the compact presentations to the Ind categories. Compact preservation implies that the right adjoint to restriction is continuous. ◻
]

We define the renormalized Kac–Moody category $cal(M)^0$ as the colimit of these categories over decreasing untwisted pro-unipotent congruence levels. The maps into this category will be called forgetful maps. They are distinct from passage to the ordinary abelian module model. In particular, Proposition 31 does not identify the two unbounded categories; this restriction is essential for Whittaker objects, as explained in [32] Sections 1.5.7–1.5.9.

=== 7.4 Infinitesimal transport and the strong loop action <infinitesimal-transport-and-the-strong-loop-action>

The preceding categories must now be supplied with their connection in $S$. The issue is that a fixed congruence level moves when a graph moves. The full completed arc algebra does not have this defect.

#thm([Proposition 7.3.])[
  #emph[The categories just constructed and their restriction and induction functors descend along the formal diagonal groupoid of $S$. Their sections are $D \( S \)$-linear categories, with underlying categories as above. The construction commutes with smooth parameter change and with separation into disjoint clusters, including after restriction to a collision locus.]
] <loop:crystal>

#proof[
  Two infinitesimally close lifts of the marked graphs give cofinal divisor ideals. Explicitly, if their monic equations $P \, Q$ agree modulo an ideal $I$ with $I^r = 0$, the binomial expansion gives
  $ Q^(n + r - 1) in \( P^n \) \, #h(2em) P^(n + r - 1) in \( Q^n \) . $
  Every surviving term in the first expansion contains at least $n$ factors of $P$, and the other inclusion is symmetric. They therefore define the same completions, full arc groups, and Laurent algebras. The determinant extension has the same canonical identification.
  Choose a congruence deep enough for one lift to lie in the two levels being compared. It may be chosen normal in the full arc group. The two relative quotients are smooth: the quotient polynomial in each such divisibility is monic, so the finite difference of the corresponding lattices is locally free even over the nonreduced base. Restriction to this common deeper level is fully faithful and compact-preserving by Proposition 31, also after the finite flat scalar extensions under consideration.
  The two essential images there agree. To see this on bounded-below modules, filter by the powers of the nilpotent base ideal. On every successive quotient the two integrability conditions coincide. Integrability is stable under extensions, so it coincides on the whole module. Equivalently, a change with coefficients in a nilpotent ideal integrates by the finite exponential. Restriction is t-exact, by the group-representation comparison followed by the induction monad. Thus the same argument applies to the scalar extensions of the compact generators. Their images are compact in the common-depth category; when they lie in the other fully faithful subcategory they remain compact there. The two compact subcategories therefore agree, and so do their Ind-completions.
  These identifications are independent of the common depth, because passing to a deeper one is fully faithful. On multiple infinitesimal diagonals choose a single common deeper level for all lifts. All identifications are then restrictions of the same full Laurent algebra, and their compositions agree there. This supplies the higher cocycle compatibilities, not just transport on first-order tangent vectors. Smooth descent and the formal diagonal description of crystals give the claim. The base-change mapping calculations in Proposition 31 identify the underlying categories on a new smooth parameter scheme with its corresponding Harish–Chandra categories.
  The derivative at fixed $z$ preserves the full regular arc algebra. It need not preserve a chosen finite-depth subgroup; the comparison through deeper levels is exactly what makes that derivative act on the crystal. Disjoint-cluster products follow from products of the completed algebras. The cofinal-ideal argument applies equally at collisions. ◻
]

Write $cal(M)$ for the resulting crystal category of Kac–Moody modules. We next verify that its geometric loop action is the strong action whose invariants were used above.

#thm([Proposition 7.4.])[
  #emph[Formula (7.1), paired by ! tensor and star integration, defines a unital associative $cal(A)$-action on $cal(M)$ in $D \( S \)$-module categories. For each compact open $J$ used above, its strong $\( J \, chi_J \)$-equivariant category is the renormalized Harish–Chandra category for $\( ell \, J \)$ with differential $"act"_ell - chi_J$. These identifications respect the forgetful maps into $cal(M)$.]
] <loop:strong-action>

#proof[
  Suppose an input belongs to a congruence level $K$, and take a bounded right-stable part $Z$ of the loop group. Project a convolution kernel to $Z \/ K$. On this quotient it is paired with $M^g$ from (7.1). A sufficiently deep output level $K'$ satisfies $g^(- 1) K' g subset K$ uniformly on the bound; thus $M^g$ has values in the smaller Harish–Chandra category, and the pairing and integration are ordinary relative operations with that category as coefficients.
  One can compute $M^g$ after ! pull to any smooth affine plot of $Z \/ K$. Choose a local loop lift and determinant frame. At $b$, the first line of (7.1) is conjugation restricted to $K'$. The positive-depth splittings agree with conjugation after increasing the depth; this follows directly from the relative determinant calculation. Across an infinitesimal diagonal, two lifts differ by a formal group element. Exponentiating its Lie action, including the prescribed scalar on the center, gives the comparison. Each exponential terminates on a nilpotent test ideal. Changing the loop lift by $K$ has precisely the Harish–Chandra equivariance already imposed. First-order differentiation yields the second line of (7.1), while products of formal elements give all higher compatibilities. By Proposition 32 these are calculations in crystal categories.
  Here plots need not be smooth over a Schubert bound. We record why ! plots still suffice. For a finite-dimensional scheme $V$, a proper map $tilde(V) arrow.r V$ that is an isomorphism off a closed subset $D$ gives a descent square with $D$ and $tilde(D) = tilde(V) times_V D$. The open/closed triangles prove this: open objects extended by star and closed objects have the indicated pullbacks, and their extension maps agree by proper direct-image/!-pull adjunction and Kashiwara’s theorem. These identities remain valid with coefficient categories. Resolution of singularities and induction on the dimension of the closed complement therefore reduce descent to smooth plots. To compare with any other smooth plot, resolve the closure of its lift over the open locus and apply the same square; plots supported entirely over the closed complement are handled by the induction. This also proves descent for morphisms and coherent data. Twists and restriction to affine plots do not change the argument.
  The kernel formula is compatible with changes of level by the projection formula. For multiplication choose an intermediate depth so that its left action on the second bounded right quotient is trivial. Project both inputs to these finite quotients. Pulling $M^g$ along the multiplication map gives the iterated formula: on product plots conjugation composes, the Maurer–Cartan term obeys its product rule, and the determinant line multiplies. Relative base change now identifies convolution followed by the action with the two successive actions. Coefficient functors commute with this integration because they are continuous and parameter-linear. The calculation with strings proves coherence, and the delta kernel acts identically.
  It remains to identify strong equivariance, including its derived structure. Take a deeper open $K_1$ normal in $J$, on which $chi_J$ vanishes. The pro-unipotent forgetful identifications reduce the calculation to the finite-dimensional smooth quotient $Q = J \/ K_1$. On a fixed input level, averaging and the bar maps factor through such quotients by the kernel formula; further output levels give the same calculation.
  First replace $ell$ by $j$ and work at a finite group stage of $J$. Harish–Chandra modules for $\( j \, K_1 \)$ are equivalent to weakly right $J$-equivariant relative D-modules on $K_1 without J$. Here weak equivariance is algebraic equivariance, without identifying its differential with the D-module differential. Indeed, translation descent of the underlying quasi-coherent module identifies it with a representation of the stabilizer $K_1$. Differential-operator induction adds the monad
  $ U \( j \) ⊗_(U \( "Lie" K_1 \)) \( - \) . $
  Invariant first-order differentiation gives the Lie operators; the stabilizer derivatives are already prescribed. Brackets and relative PBW identify the entire monad. This is a derived identification, using equivariant descent and its flat filtered induction monad.
  In this model the $Q$-action is strong translation, and its conjugation kernel is exactly (7.1). Strong translation invariants descend the D-module to the base while retaining the weak $J$-action. They therefore give algebraic representations of $J$, as required. A character twists this same computation. Passing to pro $J$ is legitimate on induced generators: only a finite-dimensional Lie quotient is added, and a generator trivial on an open normal stage remains at that stage under induction. The representation cobar calculation proves the colimit assertion, and taking $Q$-invariants commutes with it by Proposition 30.
  Finally add the remaining Lie operators from $ell$ by their induction monad. Induction and its continuous forgetful right adjoint are $Q$-linear. For restriction this is immediate from (7.1); for induction the adjoint change on the enveloping factor gives the same derivative rule. Forgetful is conservative by testing the induced generators. Equivariant bars thus give the Harish–Chandra induction monad for $\( ell \, J \)$.
  There is no assumption here that infinite-level equivariance has already been identified. For a pro-unipotent congruence $K$, its convolution idempotent is the identity on a level already $K$-equivariant. On a smaller level pass to a normal smaller one; the finite calculation shows that the image of the idempotent is exactly the modules equivariant for $K$. This identifies its image in the colimit defining $cal(M)$. All other compact opens are then handled by the same finite quotient calculation. This proves the asserted identification and its compatibility with the forgetful functors. ◻
]

The spherical category constructed from the inner $P_0$ presentation is the ordinary Kazhdan–Lusztig category. Trivializing $P_0$ on the disks gives the identification; changes of trivialization descend because the modules are strongly positive-loop equivariant and the extension splits there. The same change of frames identifies the localization constructions.

=== 7.5 The spherical–Whittaker pairing and its adjoints <the-sphericalwhittaker-pairing-and-its-adjoints>

Set

$ C_S & = cal(M)^H \, #h(2em) upright(bold(1))_S = D \( S \) \,\
a_S & = cal(A) ⊗_(D_(*) \( H \)) upright(bold(1))_S = D_(cal(L)^(- s)) \( L G \/ H \) \,\
d_S & = \( a_S \)_(L N \, chi) \, #h(2em) Q_S = cal(M)_(L N \, chi) . $

The Grassmannian category uses closed ind-proper bounds. Since $L N$ is an increasing union of compact pro-unipotent groups, its coinvariants are the colimit of compact-subgroup coinvariants. After the norm identification at each compact stage, the transition functors are star averaging with character. Denote the image of a Grassmannian object $K$ in $d_S$ by $upright(bold(d)) \( K \)$.

These conventions give

#[#set math.equation(numbering: n => "(7.3)")
 $ d_S = cal(W)_(- s)^(-) \( S \) . $ <loop:whittaker-coinvariants>]

The sign can be checked without a choice of local coordinates. Transpose the Grassmannian pairing, which is star integration of ! tensor. Coinvariants at phase $chi$ become ! equivariance at phase $+ chi$ on the opposite, exponent-$s$ Grassmannian. The model comparison (4.3) therefore identifies $upright(bold(d)) \( K \)$ with the functional

#[#set math.equation(numbering: n => "(7.4)")
 $ W mapsto Gamma_(upright("dR")) \( K ⊗^(!) mu^(!) W \) . $ <eq:loop-whittaker-functional>]

The pairing is relative over $S$ when parameters are present.

For clarity, this duality also permits coefficient categories. Grassmannian duality is computed by closed bounds and ordinary D-module duality. Compact-subgroup equivariant categories are retracts by pro-unipotent averaging. To pass from their colimit to the tensor-compatible dual category, one may use the compact opens of Proposition 36: its presentation and transition calculation apply to $a_S$, since deep-open-equivariant categories generate it. For a chosen compact open, use a cofinal system of closed bounds stable under that group. Such a system exists: on a fixed bounded subscheme a sufficiently deep normal congruence acts trivially, so its saturation factors through a finite-type quotient of the compact open and remains bounded; take its stable closed closure. On these bounds the open-equivariant stage uses finite-type quotients with unipotent stabilizers. The closed-bound transitions, and then the compact-open transitions in that calculation, are fully faithful with continuous $D \( S \)$-linear right adjoints. Their stages are dualizable and their colimit remains dualizable. Consequently its dual is the limit of the !-equivariance diagrams, also after tensoring with coefficients. This is the Whittaker category in (4.3). Alternatively, the same conclusion follows from the linear parametrized Whittaker comparison.

The loop action on a spherical module factors through the Grassmannian. Passing to $L N$-coinvariants gives the pairing

#[#set math.equation(numbering: n => "(7.5)")
 $ F_S : C_S ⊗_(D \( S \)) d_S arrow.r Q_S . $ <eq:L3>]

It is balanced over the spherical monoidal category $cal(S)_S = "End"_(cal(A)) \( a_S \)$, with factor orientations chosen for the left loop action. All its categories and maps have the disjoint-cluster product property. For $d_S$ this property comes from coinvariants, or equivalently from the Whittaker model comparison with its dual pairing; this specifies the normalization even when stack dimensions contribute shifts.

#thm([Proposition 7.5.])[
  #emph[At the irrational levels under consideration, the balanced functor 
$ overline(F)_S : C_S ⊗_(cal(S)_S) d_S arrow.r Q_S $

 is fully faithful and has a continuous $D \( S \)$-linear right adjoint. The projection $C_S ⊗_(D \( S \)) d_S arrow.r C_S ⊗_(cal(S)_S) d_S$ also has a continuous $D \( S \)$-linear right adjoint. These assertions hold over the full parameter scheme, including its collision loci.]
] <loop:pairing-adjoints>

#proof[
  First identify the spherical category. On any nonunit Schubert orbit the twisting character of a stabilizer is nonintegral on a one-dimensional torus. At a nonzero coweight it is the Killing pairing with that coweight, up to the fixed sign, times the irrational exponent. The corresponding equivariant D-module category vanishes. On a bounded Schubert chart this argument applies to each distinct-point stratum; ! restrictions to the collision strata give the same calculation for their merged coweights. After removing the unit locus there is no remaining stratum. Thus
  $ cal(S)_S tilde.eq D \( B_S H \) \, $
  with ! tensor, the convolution product on the unit orbit.
  The multiplication of $D \( B_S H \)$ is ! pull along its diagonal. Compute it using a finite smooth quotient of $H$ with pro-unipotent kernel. The diagonal is then smooth, representable, and affine; its right adjoint is star direct image with the smooth shift. The ! projection formula makes this adjoint bimodule-linear and continuous. This uses the diagonal, not the map $B_S H arrow.r S$, and makes no compactness assertion about the unit of $D \( B_S H \)$. The balanced projection for two $cal(S)_S$-modules is obtained by tensoring this multiplication and its adjunction with those modules. Hence its right adjoint has the same properties. It is also conservative: the terms coming from the unbalanced tensor generate the balanced tensor, as its tensor bar shows.
  Put
  $ a^r = upright(bold(1))_S ⊗_(D_(*) \( H \)) cal(A) \, #h(2em) cal(S)_S = a^r ⊗_(cal(A)) a_S . $
  Consider the evaluation
  $ e : a_S ⊗_(cal(S)_S) a^r arrow.r cal(A) . $
  Before balancing, its geometric calculation is the evaluation kernel for $H$ from Proposition 30, followed by
  $ cal(A) ⊗_(D_(*) \( H \)) cal(A) arrow.r cal(A) . $
  The latter functor is multiplication on $L G times^H L G$. Separating out the product coordinate identifies its fibers with the ind-proper affine Grassmannian. The right adjoint is ! pull and is continuous and bimodule-linear by base change. Precisely, at each congruence quotient of the product coordinate use closed proper Grassmannian bounds and then their compatible system. This constructs the adjoint in the pro convention; no finite-type adjunction for the whole loop group is being assumed.
  Consequently the pre-balance evaluation has a continuous bimodule-linear right adjoint. The balanced evaluation $e$ has those same properties. To check this formal passage, write $p$ for balancing. The right adjoint of $e p$ is $p^R e^R$. Since $p^R$ is continuous, conservative, and bimodule-linear, it detects both the colimit comparison maps for $e^R$ and its canonical linearity maps. They are isomorphisms because they are so for $\( e p \)^R$.
  The functor $e$ is fully faithful. Put $E = a_S ⊗_(cal(S)_S) a^r$. Proposition 30 expresses $H$-invariants as a relative tensor operation and gives
  $ E^(H times H) tilde.eq a_S^H ⊗_(cal(S)_S) \( a^r \)^H tilde.eq cal(S)_S ⊗_(cal(S)_S) cal(S)_S \, #h(2em) cal(A)^(H times H) tilde.eq cal(S)_S . $
  On these two-sided invariants evaluation becomes $cal(S)_S ⊗_(cal(S)_S) cal(S)_S arrow.r cal(S)_S$, which is the identity. Both adjoints are bimodule-linear, so the unit of the adjunction is an isomorphism on these invariants. They generate the domain under the two loop actions. Indeed, $a_S$ and $a^r$ are generated by the loop actions on their equivariant Grassmannian delta units, from their relative tensor presentations; the tensor bar then gives the assertion for the balanced product. Continuity and bimodule-linearity extend the unit isomorphism to the whole domain.
  Tensor this fully faithful adjunction with $cal(M)$ over $cal(A)$ and take $L N$-coinvariants on the other side. Both operations preserve the adjunction and its unit isomorphism because both functors in the adjunction are continuous and linear. The resulting functor is precisely $overline(F)_S$. This proves the first assertion, and the earlier balancing calculation proves the second. Every calculation took place over $S$ and in its finite/pro presentations, so the argument applies across collisions. ◻
]

#thm([Corollary 7.6.])[
  (Parameter operations for the pairing).  #emph[Let $f : T arrow.r S$ be a change between the smooth affine parameter charts used here, including a principal open or a smooth closed collision or graph chart. For each of the families $cal(E) = cal(M) \, C \, a \, d \, Q$, there is an identification 
$ cal(E)_T tilde.eq D \( T \) ⊗_(D \( S \)) cal(E)_S . $

 The pairing and its continuous linear right adjoint base change under these identifications. For a smooth closed inclusion $i : Z arrow.r S$ and a principal open inclusion $j : U arrow.r S$, they commute with $i_(*) \, i^(!) \, j_(*) \, j^(!)$, including the units and counits of the adjunctions.]
] <loop:parameter-operations>

#proof[
  For the Harish–Chandra categories, first apply the underlying quasi-coherent functor $b$. The monic divisor algebras and lattice presentations commute with the indicated base changes. Proposition 31 identifies the mappings between the base-changed compact generators, which still generate. All the maps in question have finite Tor dimension since the source and target charts are smooth. The underlying category of $D \( T \) ⊗_(D \( S \)) cal(E)_S$ is
  $ "QCoh" \( T \) ⊗_(D \( S \)) cal(E)_S tilde.eq "QCoh" \( T \) ⊗_("QCoh" \( S \)) cal(E)_S^0 \, $
  which is the category just computed. The formal-diagonal transport of Proposition 32 restricts along $f$ and agrees on every multiple infinitesimal diagonal with the transport on that category. This identifies the crystals. The equivalence between crystals and $D \( S \)$-module categories recalled at the start of this section identifies their sections as asserted; see [18] Theorem 2.6.3 and Lemma 3.2.4. For $a$ the assertion is the relative D-module tensor-product formula; for $d$ and $Q$ it follows by base change in their coinvariant bars.
  Tensoring both functors of a continuous $D \( S \)$-linear adjunction with $D \( T \)$ tensors its unit and counit as well. Thus its right adjoint over $T$ is the base-changed right adjoint. Finally, on any of these module categories, the open and closed localization projectors $j_(*) j^(!)$ and $i_(*) i^(!)$ are the actions of $j_(*) omega_U$ and $i_(*) omega_Z$, respectively. Linearity makes both adjoints commute with these projectors. Identifying their images with the restricted categories gives the claimed commutation with the pushes and pulls, and the tensor construction preserves their adjunction maps. ◻
]

== 8 A common target through principal $W$-algebras <sec:walg>

The pairings of (7.5) take values in Whittaker coinvariants of Kac–Moody modules. We identify these targets for the two inverse shifted levels. At a single point this is categorical Feigin–Frenkel duality. The assertion needed here is stronger: the identification must respect moving points, collisions, and the crystal structure on the parameter scheme. We construct it on compact generators and prove the necessary base-change assertion for their mapping complexes.

Throughout this section $S$ is a smooth affine coordinate chart for a finite tuple of points of the curve, $R = cal(O) \( S \)$, and $u = P \( z \)$ is the monic equation of their effective divisor in the coordinate $z$. Write $cal(O)$ for its completed regular ring and $cal(K) = cal(O) \[ u^(- 1) \]$. All residues are total residues with respect to $d z$. We use the Kac–Moody category $cal(M)$, its Whittaker coinvariants $Q_S$, and the passage $b$ to the underlying $"QCoh" \( S \)$-linear category from Section 7. A superscript $0$ denotes this last passage, as in $Q_S^0 = b Q_S$. The definitions are local on $S$; the coordinate and crystal comparisons below will make the resulting equivalence independent of this chart.

=== 8.1 Compact open approximations <compact-open-approximations>

For a positive root $alpha$, let $h_alpha$ be its height. The adolescent Whittaker subgroup $I_i$, for $i gt.eq 1$, has the following root and Cartan orders:

#[#set math.equation(numbering: n => "(8.1)")
 $ & e_alpha & frak(t) & f_alpha\
I_i & - i h_alpha & i & i \( h_alpha + 1 \) . $ <eq:L4>]

Here an order $m$ means coefficients in $u^m cal(O)$. Write $N_i$ for the positive-root part and $B_i$ for the Cartan and negative-root part. These are pro-unipotent groups, with product coordinates, and $I_i = N_i B_i$. The character $chi$ extends to $I_i$ by zero on $B_i$.

The multiplicative twisting splits over these groups with the Lie splitting specified by the standard cocycle. Indeed the order bounds make that cocycle zero. At integral depth the splitting is the conjugated arc splitting. Its possible Cartan correction vanishes on positive-order Cartan coefficients. We will also use intermediate rational orders. To see the splitting there without assuming that $rho$ is an integral cocharacter, give the root piece of signed height $l$ the order $m + lambda l$. The group preserves the corresponding rationally filtered arc lattice in the adjoint representation. Its order-zero action is upper unipotent in root height, and all other pieces increase order. The determinant of its action on every finite lattice difference is therefore canonically trivial. The differential of this trivialization has zero root correction by weights and zero Cartan correction because positive-order Cartan modes have zero trace on the successive order quotients. Passing through the finite nilpotent quotients gives the asserted splitting.

#thm([Proposition 8.1.])[
  (Adolescent presentation).  #emph[There is a canonical presentation 
#[#set math.equation(numbering: n => "(8.2)")
 $ Q_S tilde.eq "colim"_(i gt.eq 1) P_i \, #h(2em) P_i = cal(M)^(I_i \, chi) \, $ <eq:L5>]

 whose transition functors are star averaging with character. They are fully faithful and have continuous $D \( S \)$-linear right adjoints. After passage to $b$, they preserve compact objects. These assertions hold over collision loci and after the base changes of Section 7. The same presentation and transition assertions apply with $a_S$ in place of $cal(M)$.]
] <walg:adolescent>

#proof[
  First fix $N_i$. Its invariant category is generated by objects with additional $B_j$-equivariance for sufficiently large $j gt.eq i$. In fact, the underlying category is generated by objects with deep congruence equivariance. For such an object choose $j$ so that $B_j$ lies in that congruence subgroup. Product coordinates identify its $N_i$-averaging with its $N_i B_j$-averaging. Forgetting the additional equivariance is fully faithful and has continuous right adjoint by Proposition 30. Thus these subcategories exhaust the $N_i$-invariant category. Increasing $i$ commutes with these exhaustions after increasing $j$, by the same averaging formula. The diagonal depths are cofinal. This proves (8.2); bounded loop supports give the identical argument for $a_S$.
  It remains to prove the transition assertion relatively. We give the Fourier argument underlying the adolescent construction [32] Section 2, retaining the divisor coefficients to account for collisions. Interpolate the orders using rational slopes $lambda > 1$. At a break the new orders are
  $ a_l = - floor.l lambda l floor.r quad \( l > 0 \) \, #h(2em) b_r = floor.l lambda \( r + 1 \) floor.r quad \( r gt.eq 0 \) \, $
  where $r = 0$ denotes the Cartan part. The old orders immediately before this break are
  $ a_l^0 = a_l + upright(bold(1))_(lambda l in bb(Z)) \, #h(2em) b_r^0 = b_r - upright(bold(1))_(lambda \( r + 1 \) in bb(Z)) . $
  Let $J$ use the new positive orders and the old nonpositive orders, and let $K subset J$ use the old positive orders and the new nonpositive orders. Then $K$ is normal, and its character is $J$-invariant. Here are the order checks. In positive roots they follow from the floor inequality $floor.l x floor.r + floor.l y floor.r lt.eq floor.l x + y floor.r$; when the sum is an integral break, either both summands are integral or their fractional parts add to one. A sum of two old nonpositive orders reaches the new order, since $lambda > 1$. For a mixed bracket of positive height $l$ and nonpositive height $- r$, $a_l + b_r^0$ reaches the old nonpositive order if $l lt.eq r$, and can fail to reach the new order only when both participating breaks are integral. If $l > r$, it already reaches the old positive order of height $l - r$. A simple-root residue can occur only when $l - r = 1$, both breaks are integral, and both coefficients are among those changed at the break. This verifies normality and invariance of the character on $K$. In the Cartan case the orders also exclude a residue in the central Lie cocycle. Exponentiating the finite nilpotent quotients gives the group assertions.
  Modulo $K$, denote the new/old positive difference by $U$ and the old/new nonpositive difference by $V$. The group $U$ is unipotent, and $V$ is a normal vector group. Relative Fourier transform for $V$, applied to the category of $\( K \, chi \)$-equivariant objects, identifies the old invariant category with the fiber over zero in $V^(*)$. The new condition is $U$-equivariance. Its action on $V^(*)$ is affine: exchanging the two factors in multiplication introduces both conjugation on $V$ and the residual character of $K$; Fourier transform turns the latter into translation. Thus this description also accounts for the character twisting of the quotient action.
  The orbit of zero is free and closed over $S$. To check this, order coordinates by root height. The linear term from a height $l$ coordinate of $U$ to the height $l - 1$ component of $V^(*)$ is the pairing
  $ \( x \, y \) mapsto chi \( \[ x \, y \] \) . $
  It is injective in $x$, with locally split image: the Lie-algebra factor is the injective principal $frak(s l)_2$ operator $\[ f_(upright("prin")) \, - \]$ on positive grades, and the coefficient factor is the perfect residue pairing
  $ \( overline(f) \, overline(g) \) mapsto "Res" frac(f \( z \) g \( z \), P \( z \)) thin d z quad upright("on ") R \[ z \] \/ \( P \) . $
  This pairing is perfect for every monic $P$, including repeated roots. The higher terms in the orbit map at height $l - 1$ involve only lower-height coordinates. Induction in height therefore identifies the orbit with a closed graph over the locally split linear image, and identifies its parameter space with $U$.
  Closed pushforward from this orbit is fully faithful with continuous right adjoint, also for categories with coefficients. On the orbit, translation descent for the free $U$-action identifies equivariant objects with the fiber over zero. Under this identification, forgetting from that fiber and star averaging is exactly the transition at the break, with the fixed smooth/Fourier normalization. It is therefore fully faithful with continuous linear right adjoint. Composing the finitely many breaks between successive integral slopes gives the claimed transition. After passage to $b$, such a left adjoint preserves compact objects because its right adjoint is continuous. All operations used in the argument are relative Fourier transform, closed pushforward, smooth descent, and the base-change operations of Section 7; this proves the remaining assertions. ◻
]

=== 8.2 The point input and its module convention <the-point-input-and-its-module-convention>

We specify the representation-theoretic input before extending it over $S$. For a split root Lie algebra over a characteristic-zero field, Raskin’s affine Skryabin theorem identifies the Whittaker coinvariants of the renormalized Kac–Moody category with the renormalized category of principal $W$-modules [32] Theorem 5.1.1. Here the latter category means

$ "Ind" #scale(x: 120%, y: 120%)[\(] "thick" { V_i^W : i gt.eq 0 } subset D^(+) \( W upright("-") upright("sm") \) #scale(x: 120%, y: 120%)[\)] . $

In particular the mapping complexes in its specified compact category are the ordinary derived mapping complexes between the generalized vacua. This is the convention in [32] Section 5.1 and the proof of Theorem 5.1.1; it does not assert that these objects are compact in the unrenormalized unbounded derived category.

The composite with the underlying-complex functor is principal Drinfeld–Sokolov reduction. It sends the Whittaker averaging counits to isomorphisms. On the induced $\( I_i \, chi \)$-generator, using the $N_i$-lattice, it gives the generalized vacuum $V_i^W$ in degree zero. Changing the lattice introduces its relative cohomological shift and determinant line. The vacuum calculation, its nonnegative PBW filtration, and the strict surjections $V_j^W arrow.r.twohead V_i^W$ for $j gt.eq i$ are [32] Theorems 4.2.1, 4.5.1, and 4.6.1. The ordinary vacuum is the case $i = 0$.

We use unshifted vertex modes $w_(\( m \))$. For homogeneous principal PBW generators $w$ of conformal degree $d_w$, the vacuum is annihilated by $w_(\( m \))$ for $m gt.eq i d_w$, and ordered monomials in the remaining modes give its PBW basis. One can recover the exact, rather than merely associated-graded, annihilation from the free-field realization [32] Theorem 6.1.1. The vacuum embeds in the depth-$i$ Heisenberg vacuum. A homogeneous normally ordered monomial of weight $d$ has $k$ currents and $r$ derivatives with $k + r = d$; its mode of index $m$ has current indices with sum $m - \( k - 1 \) - r$. If $m gt.eq i d$ and $i gt.eq 1$, this sum is greater than $k \( i - 1 \)$, so one of the annihilating current modes occurs on the right after normal ordering. The creation axiom gives the case $i = 0$. The associated-graded calculation then proves the stated PBW basis.

We also use Feigin–Frenkel duality of principal conformal vertex algebras at the inverse shifted forms. Our levels are irrational; thus they lie in the proved range of the duality, including its vacuum-preserving form [32] Section 7.3, especially Warning 7.3.1 and Lemma 7.3.3. The input is a Lie-algebra theorem and is unaffected by the isogeny type of the group. The principal BRST construction provides closed fields acting on reduction, with the usual conformal coordinate action. One may use its nonnegative ghost-degree subalgebra: in the principal integer grading it has cohomology only in degree zero, and its degree-zero kernel realizes the $W$-algebra. This is the subcomplex $cal(C)^(-)$ of [27] Section 4, Theorem 4.1 and Remark 4.1, with homological charge reversed to cohomological degree. Its absence of negative cohomological degrees means that no degree-zero boundary has to be quotiented out. Thus its degree-zero cycles form an actual vertex subalgebra of the BRST algebra, acting on every module complex. This supplies the strict action needed here; the corresponding factorization action is discussed in [32] Section 4.4.

For completeness, the coordinate convention agrees with our $P_0$-twist. The improved Virasoro term is $L_n^(upright("Sug")) - \( n + 1 \) rho_n$, together with its ghost terms. On a current mode $x_m$ of height $l$ its noncentral commutator is

$ \[ L_n \, x_m \] = - \( m + \( n + 1 \) l \) x_(m + n) . $

This is the coordinate action on the root coefficient with density $\( d z \)^l$. The central term is the affine gauge correction for $\( d z \)^rho$; differentiating $z mapsto z + epsilon.alt z^(n + 1)$ gives precisely the correction contributed by $- \( n + 1 \) rho_n$. The charged ghosts transform by the dual densities. Corrected currents and their normally ordered ghost bilinears preserve the closed-field model, with possible scalar corrections from reordering. Consequently the BRST action and the conformal vertex-algebra action use the same changes of coordinate.

=== 8.3 Reduction over a moving divisor <reduction-over-a-moving-divisor>

Let $cal(H)_R^W$ be the abelian category of smooth modules for these $W$-modes over $R$. Concretely, fields are smeared by coefficients in $cal(K)$, with total residue and the translation and operator-product relations; equivalently one uses the chiral module construction of [4] Section 3.6. Smoothness means that, on any fixed vector, sufficiently high-order coefficients of each generating field act by zero. The identity field acts by total residue against $d z$. For coefficients $f \, g$, commutators use the vertex products with coefficients $\( partial^n f \/ n ! \) g$. Composite fields act by their normal-product formulas. Write $D \( cal(H)_R^W \)$ for the ordinary derived category.

These formulas make sense also when the divisor has multiple points. For example, the two expansions of a pole $\( z - w \)^(- j)$, $j > 0$, are obtained by writing

$ \( z - w \)^(- j) = (frac(P \( z \) - P \( w \), z - w))^j \( P \( z \) - P \( w \) \)^(- j) $

and expanding the last factor in the two orders in the nested Laurent rings. In each resulting normally ordered series, the coefficients of the modes applied first tend to arbitrarily high order. Thus each expression acts on a smooth vector by a well-defined sum. The construction is unchanged upon replacing $P$ by an equation giving a cofinal completion, commutes with scalar extension, and uses products of mode algebras on disjoint formal divisors.

Give a generating field its principal degree $d_w$. A commutator of two generating modes has strictly smaller total PBW degree: a nonnegative vertex product has conformal weight smaller than the sum of the two weights, and expressing it through products and derivatives does not increase that bound. We will repeatedly use this fact to reorder words. Every such calculation is vectorwise; it requires no single smoothness bound valid for an entire module.

The reduction functor on compact Kac–Moody modules is the complex

#[#set math.equation(numbering: n => "(8.3)")
 $ "DS"_R \( M \) = C^(oo \/ 2 \, h) #scale(x: 120%, y: 120%)[\(] "Lie" \( L N \) \, M ⊗ R_(- chi) #scale(x: 120%, y: 120%)[\)] \, #h(2em) h = "Lie" N_0 \( cal(O) \) . $ <eq:L6>]

We use cochains on the compact lattice. If $h' supset h$, changing from $h'$ to $h$ tensors the complex by $det \( h' \/ h \) \[ dim \( h' \/ h \) \]$. The critical bracket correction is zero on the unipotent Lie algebra. The complex uses the algebraic smooth module and the Fock ghost module. On a bounded complex of inputs, quasi-isomorphisms remain quasi-isomorphisms: the input direction is bounded and the ghost factors are free. The compact calculations in Proposition 31 therefore define (8.3) on compact objects, and then define its continuous extension to $cal(M)^0$.

The BRST differential and the closed $W$-fields are given by the same residue formulas on every chart. Their identities can be checked in the affine-plus-Clifford enveloping algebra. The preceding expansions guarantee convergence in the smooth-module topology; induced modules for sufficiently deep lattices have free PBW terms, and the Clifford factor has its free Fock presentation. These modules detect the identities. Equivalently, on them one may check the identities after every residue-field extension, where they are the ordinary BRST identities in uniformizers. This also verifies closure of the degree-zero fields acting on the complex.

The full regular lattice $h$, its Fock module, and its vacuum are canonically identified across nilpotently different lifts of the parameter scheme. Indeed the corresponding regular and Laurent completions are canonically equal. Thus (8.3), after forgetting the $W$-action if necessary, defines a crystal functor. In particular the ordinary vacuum cycle, consisting of the inducing vector times the full-lattice Fock vacuum, is horizontal. We do not assert that a prescribed positive-depth cutoff is itself horizontally constant.

#thm([Lemma 8.2.])[
  (Relative depth vacua).  #emph[The reduction of the induced $\( I_i \, chi \)$-generator, calculated with the $N_i$-lattice, is a flat heart module $V_(i \, R)^W$. It has a distinguished vector $upright(bold(v))_i$ with presentation 
#[#set math.equation(numbering: n => "(8.4)")
 $ w \( u^(i d_w) cal(O) \) upright(bold(v))_i = 0 \, #h(2em) V_(i \, R)^W upright(" has PBW basis in modes of orders ") < i d_w . $ <eq:L7>]

 It corepresents vectors satisfying the displayed annihilations. These constructions commute with the scalar extensions used here, including the finite flat infinitesimal tests for the crystal. The ordinary vacuum satisfies the same assertion for $i = 0$.]
] <walg:vacua>

#proof[
  Coefficients of each fixed $u$-order have basis $z^a$, $0 lt.eq a < deg P$. Apply ordered words in the closed fields to the inducing vector times the lattice Fock vacuum. This defines a map from the free $R$-module on the proposed PBW words to the BRST complex. Its terms and its construction commute with ordinary scalar extension. Over every residue field it is a quasi-isomorphism by the point vacuum calculation: at a point of multiplicity $m$, the equation $u$ has order $m$, so that its depth is $m i$; separated points give the product calculation.
  The BRST terms are flat over $R$. Since $R$ is smooth of finite dimension, the scalar extensions to residue fields have finite Tor dimension, and ordinary tensor with these complexes computes derived tensor. The cone of the displayed map therefore has zero derived fiber at every prime. Residue fields at all primes detect zero objects of $D \( R \)$, so the map is a quasi-isomorphism. Its cohomology is the indicated free module. The annihilations follow from the point annihilations, since an operator between free $R$-modules that is zero at every prime is zero. The same free presentation remains valid on the finite flat infinitesimal tests.
  Finally let $v$ be a smooth vector satisfying (8.4). Reorder a word by decreasing total PBW degree, moving annihilating modes to the right; each commutator lowers degree. The same operation on $upright(bold(v))_i$ gives its PBW expansion. At each comparison the normal-product tails terminate by the smoothness bounds for the two vectors. Hence the substitution $upright(bold(v))_i mapsto v$ respects every mode action. Its uniqueness follows from cyclicity, proving the universal property. ◻
]

The modules $V_(i \, R)^W$ generate $cal(H)_R^W$, because every vector satisfies a sufficiently deep cutoff. Kernels, cokernels, and filtered colimits are computed on the underlying modules, with the induced smooth action. Consequently $cal(H)_R^W$ is a Grothendieck category with exact filtered colimits.

=== 8.4 Mapping complexes and scalar extension <mapping-complexes-and-scalar-extension>

The passage from the point theorem to families needs a finiteness statement for derived maps. Smoothness alone would not justify commuting an infinite collection of mode conditions with tensor product. The finite differences between the depth vacua provide the required replacement.

#thm([Lemma 8.3.])[
  (Ext continuity).  #emph[For every depth $i gt.eq 0$ and every $p gt.eq 0$, the functor $"Ext"_(cal(H)_R^W)^p \( V_(i \, R)^W \, - \)$ commutes with filtered colimits. If $R arrow.r T$ is a scalar extension occurring in our affine or infinitesimal charts, then, for a smooth $W$-module $M$ over $T$, restriction gives 
#[#set math.equation(numbering: n => "(8.5)")
 $ "Ext"_(cal(H)_T^W)^p \( V_(i \, T)^W \, M \) tilde.eq "Ext"_(cal(H)_R^W)^p \( V_(i \, R)^W \, "oblv"_R M \) . $ <walg:restriction-ext>]

 For smooth affine or residue-field extensions, and for the finite flat infinitesimal tests, the ordinary derived mapping complexes between depth vacua consequently satisfy 
#[#set math.equation(numbering: n => "(8.6)")
 $ "RHom"_(cal(H)_R^W) \( V_(i \, R)^W \, V_(j \, R)^W \) ⊗_R^(upright(bold(L))) T tilde.eq "RHom"_(cal(H)_T^W) \( V_(i \, T)^W \, V_(j \, T)^W \) . $ <walg:mapping-base-change>]

]
] <walg:ext>

#proof[
  #emph[Resolving the difference between two depths.] Put $K_(j i) = ker \( V_(j \, R)^W arrow.r.twohead V_(i \, R)^W \)$ for $j > i$. We first construct a resolution of $K_(j i)$, possibly infinite to the left, whose terms are finite sums of depth vacua. The PBW filtration on its defining surjection is strict; in its associated graded the kernel is generated by the finitely many mode coefficients between the two cutoffs. Choose homogeneous generators and lift them to $K_(j i)$. Their smoothness supplies a common sufficiently deep vacuum mapping to each chosen lift, with the appropriate filtration shift. These maps give a strict surjection onto $K_(j i)$.
  The construction can be iterated. Indeed, at each step choose a common upper depth $m$. All the associated-graded modules involved are finitely presented over the polynomial ring in the mode variables below depth $m$. Modes above that depth act as zero in associated graded, because commutators lower degree; they need not annihilate the filtered modules. Increasing from one finite depth to another adds only finitely many variables. The polynomial ring in all the remaining, countably many, variables over the Noetherian ring $R$ is coherent. To verify precisely the fact used here, a matrix between finite free modules and its finitely many coefficients descend to a polynomial ring in finitely many variables; its kernel is finitely generated there, and extension to the full polynomial ring is flat. Thus kernels between finitely presented modules remain finitely presented. The next graded kernel is therefore finitely generated, and the lifting argument repeats. This proves the resolution assertion.
  Every vacuum is $R$-flat. The first kernel $K_(j i)$ is flat because it is the kernel of a surjection between flat modules with flat quotient. Inductively, every subsequent kernel in the resolution is flat for the same reason. Hence these exact sequences remain exact after arbitrary scalar extension in the charts. The PBW presentations of Lemma 37 identify the extended sequences with the corresponding sequences over $T$. This argument applies also over the finite flat infinitesimal charts.
  #emph[Continuity of Ext under filtered colimits.] For $p = 0$, a map from a vacuum is determined by its generating vector. If that vector is given in a filtered colimit, lift it to one member. The lift is annihilated above some depth $j$. Only finitely many coefficients between depth $i$ and depth $j$ remain to be tested. Their vanishing holds in a common later member, which proves continuity of $"Hom" \( V_(i \, R)^W \, - \)$. The universal property also gives (8.5) for $p = 0$.
  For the induction in $p$, the exact underlying-module functor has the presentation
  $ "oblv" \( M \) = "colim"_j "Hom" \( V_(j \, R)^W \, M \) . $
  Applying this formula to an injective resolution and using exactness of filtered colimits gives
  $ "colim"_j "Ext"^p \( V_(j \, R)^W \, M \) = 0 #h(2em) \( p > 0 \) . $
  The long exact sequences for $K_(j i)$, followed by this colimit, therefore give, for every $p > 0$, the useful formula
  #[#set math.equation(numbering: n => "(8.7)")
   $ "Ext"^p \( V_(i \, R)^W \, M \) tilde.eq "coker" ("colim"_(j > i) "Ext"^(p - 1) \( V_(j \, R)^W \, M \) arrow.r "colim"_(j > i) "Ext"^(p - 1) \( K_(j i) \, M \)) . $ <walg:ext-bootstrap>]
  For fixed $j \, i$, the resolution just constructed calculates $"Ext"^(p - 1) \( K_(j i) \, M \)$ by the first-quadrant resolution spectral sequence. Its terms are finite sums of $"Ext"^q \( V_(m \, R)^W \, M \)$, and its diagonals in any fixed total degree are finite. Only $q lt.eq p - 1$ is needed. The induction hypothesis therefore gives filtered-colimit continuity for this Ext group. Formula (8.7) proves the claim in degree $p$.
  #emph[Restriction under scalar extension.] The same induction proves (8.5). Its degree zero assertion was proved above; use the base-extended resolutions of $K_(j i)$, which remain exact, in the spectral sequences on the two bases, and then use (8.7). All comparisons are the natural maps obtained by restriction and the canonical $V_(i \, R)^W arrow.r V_(i \, T)^W$, so this is an identification of the natural derived mapping complexes, not just a coincidence of their cohomology dimensions.
  #emph[Derived tensor base change.] It remains to justify tensoring the target in (8.6). First tensor by a finite projective $R$-module; the assertion follows from finite additivity and retracts. A flat module is a filtered colimit of finite free modules, so the Ext-continuity statement proves the assertion for a flat module as well. The extensions from a smooth affine $R$ under consideration have finite Tor dimension; resolve $T$ by a bounded complex of flat $R$-modules. The preceding comparisons totalize over this finite range and prove the required derived tensor identity. Formula (8.5) then changes the ambient module category from $R$ to $T$. Finite flat infinitesimal tests are already covered by the flat case. ◻
]

=== 8.5 The relative Skryabin comparison <the-relative-skryabin-comparison>

The stages in (8.2) have positive depth, so we first use only their vacuum images. Let $cal(V)_R^W$ denote the thick, idempotent-complete subcategory of $D \( cal(H)_R^W \)$ generated by $V_(i \, R)^W$, $i gt.eq 1$. Keeping the ordinary mapping complexes in this definition is essential. After constructing the relative comparison, Lemma 40 will prove geometrically that adjoining $V_(0 \, R)^W$ does not change this category. Define the relative renormalized category by

$ cal(W)_R^(upright("ren")) = "Ind" \( cal(V)_R^W \) . $

The next proposition constructs this category intrinsically as the Whittaker target and then checks its dependence on the formal curve.

#thm([Proposition 8.4.])[
  (Relative Skryabin comparison).  #emph[Reduction induces an equivalence 
$ Q_S^0 tilde.eq cal(W)_R^(upright("ren")) . $

 On compact objects its composite with the ordinary comparison to $D \( cal(H)_R^W \)$ is (8.3). This comparison is fully faithful on compact objects and has essential image $cal(V)_R^W$. It commutes with the scalar extensions in Lemma 38 and with the crystal transport of Section 7.]
] <walg:relative-skryabin>

#proof[
  We first descend the continuous extension of (8.3) through the Whittaker projection. Apply it to the counit of star averaging by a compact subgroup $N_i$. After forgetting the $W$-action, this comparison commutes with tensor to every residue field: on congruence compact generators this follows from the BRST formula, and on their continuous extensions it follows by colimits. The point Skryabin theorem says that every such fiber of the counit is an isomorphism. Residue-field detection in $D \( R \)$ therefore makes the original counit an isomorphism. The isomorphisms are the images of the averaging counits themselves and hence carry their composition coherences. They define a single functor
  $ Q_S^0 arrow.r D \( cal(H)_R^W \) $
  using (8.2), whose composite with the canonical projection from $cal(M)^0$ is reduction. In particular this is a comparison on functors and maps, as well as on objects.
  By Proposition 36, every compact object of $Q_S^0$ is a retract of an object generated at a finite stage, and the stage transitions preserve compactness. Each stage is thickly generated over $R$ by the induced trivial representation, with its character correction. This is the pro-unipotent Harish–Chandra calculation of Proposition 31. Its reduction is the vacuum of Lemma 37, with the prescribed relative lattice line and shift.
  Take two such generators. Move them to a common later stage of (8.2). Their source mapping complex commutes with the allowed scalar extensions by Proposition 31 and the continuous linear averaging adjunctions. Their target mapping complex commutes with these extensions by Lemma 38. On each residue field the resulting mapping comparison is the point Skryabin equivalence. Apply residue-field detection to its cone. The comparison is consequently an isomorphism over $R$, proving full faithfulness on the generators and hence on their thick closure. Its essential image is exactly $cal(V)_R^W$; taking Ind proves the equivalence.
  For crystal transport, work on a finite infinitesimal neighborhood of a diagonal in the parameter scheme. The two lifts have the same absolute completed curve, full regular lattice, and Laurent algebra. The ordinary BRST comparison on Kac–Moody compact objects is therefore the same for both lifts, including its Fock vacuum. Its mapping comparisons agree by the finite flat case of Lemma 38. To pass to $Q$, refine to common deep congruence subgroups as in Proposition 32; their systems are cofinal. On an equivariant stage the projection to coinvariants is precisely its map into the colimit, so its ordinary comparison is calculated by first forgetting to the Kac–Moody category and applying the same BRST functor. Thus the comparisons agree on the stages and their transition maps, and hence on the colimit. The identifications are induced by the identity of the absolute formal curve. They compose identically on higher infinitesimal diagonals, which supplies the crystal coherence. ◻
]

#thm([Lemma 8.5.])[
  (The ordinary vacuum is in the compact image).  #emph[The image in $Q_S^0$ of the spherical Kac–Moody vacuum is compact. Its ordinary comparison is $V_(0 \, R)^W$. Consequently adjoining $V_(0 \, R)^W$ to the generators of $cal(V)_R^W$ does not change that category.]
] <walg:ordinary-vacuum>

#proof[
  Let $upright("Vac")_H in C_S$ be the module induced from the trivial arc-group representation, and let $delta_1 in a_S$ be the convolution unit supported at the unit section of the Grassmannian. By (7.2), $b upright("Vac")_H$ is compact in $C_S^0$. We first verify that $b upright(bold(d)) \( delta_1 \)$ is compact in $d_S^0$.
  In the global pole model of Section 4, the zero-pole bound has just one relevant label, namely zero. The stratum tests remove all defective strata, leaving the fixed stack $"Bun"_(N_0) times S$. Exponential pullback identifies its Whittaker category with $D \( S \)$, with the fixed determinant line and normalization from that section. This assertion is uniform in the marks: a zero divisor does not change when marks collide. The inclusion of this Whittaker pole bound into the full pole model has continuous $D \( S \)$-linear right adjoint given by $!$-restriction, by Propositions 12 and 13. Tensoring this adjunction with $"QCoh" \( S \)$ shows that the image of the compact module $R$ is compact after passage to $b$.
  Under (4.3), this opposite zero-label object represents $upright(bold(d)) \( delta_1 \)$, up to the fixed invertible line and shift specified by the pairing. To verify the identification, its functional on a Whittaker object $W$ is the normalized zero-label coefficient. Indeed restriction to the zero-pole bound extracts that coefficient by exponential cancellation. The functional defining $upright(bold(d)) \( delta_1 \)$ in Section 7 is
  $ W mapsto Gamma_(upright("dR")) \( delta_1 ⊗^(!) mu^(!) W \) . $
  It is the same coefficient: the Grassmannian unit maps to the trivial $N_0$-torsor, a section of the zero-label stratum over $S$, and normalized $!$-pullback to that section inverts exponential pullback of the coefficient. More explicitly, if $q_0$ is the zero-label projection and $sigma$ the trivial-torsor section, then $q_0 sigma = "id"_S$ and $psi_0 sigma = 0$. On the pairing side, $q_(0 \, *) q_0^(!)$ contributes $\[ 2 delta_N \]$, exactly canceled by the $\[ - 2 delta_N \]$ in (4.3). Proposition 13 identifies closed inclusion with the transpose of $!$-restriction, so this identifies the two functionals on every object, not just on standard generators. Invertible lines and shifts preserve compactness. This proves the assertion about $upright(bold(d)) \( delta_1 \)$.
  By Proposition 34, the pairing $F_S$ has a continuous $D \( S \)$-linear right adjoint, as the composite of the adjoints to balancing and to the balanced pairing. After passage to $b$ its adjunction remains continuous and linear. Thus it preserves compact objects. The exterior product of the two compact inputs above is compact, and the convolution unit gives
  $ F_S \( upright("Vac")_H \, upright(bold(d)) \( delta_1 \) \) = q \( upright("Vac")_H \) \, $
  where $q : cal(M) arrow.r Q_S$ is the coinvariant projection. Hence this particular coinvariant image is compact; no compactness claim about $q$ on arbitrary inputs is being used.
  Proposition 39 identifies its ordinary comparison with $"DS"_R \( upright("Vac")_H \)$, which is $V_(0 \, R)^W$ by Lemma 37. The already proved full faithfulness on compact objects has essential image $cal(V)_R^W$, generated by positive depths. Therefore $V_(0 \, R)^W$ belongs to that image, as required. ◻
]

The relative renormalization thus agrees with the convention that includes the ordinary vacuum. The order of the argument matters: its compactness follows from the geometric pairing, not from the possibly infinite resolution in Lemma 38.

=== 8.6 Duality and compatibility <duality-and-compatibility>

For either Lie algebra, compose the ordinary comparison of Proposition 39 with the underlying-complex functor:

$ Q_S^0 arrow.r D \( cal(H)_R^W \) arrow.r D \( R \) . $

Its crystal compatibility descends this composite to a continuous $D \( S \)$-linear functor

#[#set math.equation(numbering: n => "(8.8)")
 $ "oblv"_W : Q_S arrow.r D \( S \) . $ <eq:walg-forgetful>]

After passage to $b$, its composite with the coinvariant projection is the continuous Drinfeld–Sokolov functor computed on compact inputs by (8.3). The scalar-extension comparisons used in this construction are those of Lemma 38: finite-Tor smooth-affine and residue-field extensions, and finite flat infinitesimal tests for the crystal.

#thm([Theorem 8.6.])[
  (Common Whittaker target).  #emph[For the inverse shifted levels on the two Langlands-dual Lie algebras, there is a canonical identification of the crystal categories $Q_S$. It respects pullback in $S$, collisions of marks, changes of curve coordinate, and exterior products for disjoint clusters. The underlying-complex functors from these categories to $D \( S \)$ are identified. The ordinary vacuum and its distinguished horizontal generating cycle are identified as well.]
] <walg:common-target>

#proof[
  The conformal Feigin–Frenkel isomorphism identifies the two $W$-algebras [15]. At a point it identifies depth vacua with their cyclic vectors, by [32] Lemma 7.3.3. In the relative presentation (8.4) this identification is equally explicit. The principal degrees agree. Replacing homogeneous principal PBW generators by the images of the dual generators does not change the presentation. We verify the needed cutoff assertion before applying its universal property. Suppose $i gt.eq 1$, and a vector $v$ obeys the generating-field cutoffs. Induction on conformal weight proves that every homogeneous field of weight $d$ has modes of index $m gt.eq i d$ annihilating $v$. Derivatives preserve the assertion: $\( partial^r A \)_(\( m \))$ is a scalar multiple of $A_(\( m - r \))$, and $m gt.eq i \( a + r \)$ implies $m - r gt.eq i a$ for a field of weight $a$.
  For a normal product of fields of positive weights $a \, b$, use
  $ \( : A B : \)_(\( m \)) = sum_(k < 0) A_(\( k \)) B_(\( m - 1 - k \)) + sum_(k gt.eq 0) B_(\( m - 1 - k \)) A_(\( k \)) . $
  If $m gt.eq i \( a + b \)$, the first sum kills $v$, as do the terms $k gt.eq i a$ in the second. In the remaining finitely many terms, commute $B_(\( s \))$ past $A_(\( k \))$, where $s = m - 1 - k gt.eq i b$. The reordered term kills $v$. Each commutator term is a scalar multiple of $\( B_(\( n \)) A \)_(\( m - 1 - n \))$; this field has weight $c = a + b - n - 1 < a + b$, and
  $ m - 1 - n - i c = \( m - i \( a + b \) \) + \( i - 1 \) \( n + 1 \) gt.eq 0 . $
  It therefore kills $v$ by induction. Weight-zero fields contribute only the identity mode of index $- 1$, which cannot occur in this range. Strong generation now proves the assertion. The case $i = 0$ is the ordinary creation axiom.
  Over the moving divisor, specialize the transported generator action to every residue field. The calculation just made applies at each support point, with its multiplicity multiplying the depth. Thus these modes annihilate the cyclic vector on every fiber. The module $V_(i \, R)^W$ is $R$-free and $R$ is reduced, so the same annihilation holds over $R$; it persists under the flat infinitesimal base changes by its presentation. Hence the images of the dual generators satisfy (8.4). Applying the inverse change of generators proves equality of the two annihilation conditions. The common cyclic vector and Lemma 37 determine mutually inverse maps of the relative vacua.
  It follows that Feigin–Frenkel identifies the two thick subcategories $cal(V)_R^W$, with their ordinary mapping complexes, and hence their Ind completions. Proposition 39 identifies both with $Q_S^0$. Its crystal compatibility identifies this equivalence across the formal diagonals, so it descends to the claimed equivalence of crystal categories $Q_S$.
  The coordinate compatibility follows from the conformal coordinate action on the strict closed fields and the BRST calculation above. For disjoint divisors the modes, Fock modules, and semi-infinite complexes are tensor products. The determinant lines and shifts use the graded tensor symmetry, so the comparisons also respect products and their permutation coherences. Finally, the Feigin–Frenkel identification changes the algebra acting on a module and preserves its underlying complex. The two ordinary comparison functors to $D \( S \)$ consequently agree. At depth zero Lemma 40 places both vacuum images in the compact subcategories where the ordinary comparison is fully faithful. The vacuum-preserving module isomorphism therefore lifts to their unique isomorphism in $Q_S^0$, and its crystal compatibility follows from the same comparison on infinitesimal charts. It preserves the actual inducing/Fock cycle, which was shown to be horizontal. ◻
]

Theorem 41 supplies the common target for the pairings of (7.5), with the relative structure needed to compare their right adjoints. Its proof has used the point representation theorems together with explicit relative mode and mapping calculations; no factorization form of a fundamental local equivalence enters this construction.

== 9 Local comparison in families <sec:local>

The common category $Q_S$ of Section 8 receives the two semi-infinite pairings, one for $G$ and one for $caron(G)$. We now compare these pairings over the entire space of marked points, including its collision diagonals. The point calculation supplies a gap in low cohomological degrees. That gap determines the equivalence of hearts across a collision; derived realization then supplies the equivalence of DG categories. A further argument with translation of the marked points will make the comparison compatible with insertion in both slots.

Throughout this section $a$ is irrational and $d$ is its dual shifted level. The spherical category $C_S$, the test category $d_S$, and their pairing $F_S$ are those of Section 7, with $d_S = cal(W)_(- s)^(-) \( S \)$ as in (7.3). In particular, $d_S$ is a category of tests, whereas $d$ without a subscript is a level. Checked symbols refer to the dual group. We work on smooth affine coordinate charts for tuples of points. Extra auxiliary coordinates are allowed. When adding a collision diagonal, we retain the complements of any other diagonals already deleted; thus the new diagonal is a smooth divisor and its complement is principal affine locally.

=== 9.1 The heart and its derived realization <the-heart-and-its-derived-realization>

We use the $t$-structure on $C_S$ whose heart has the perverse $D$-module normalization in the parameter $S$. In the underlying quasi-coherent description $b$, its test includes the shift $\[ dim S \]$. This convention is relevant to both insertion and the open–closed arguments below.

#thm([Proposition 9.1.])[
  #emph[On the coordinate charts just described, the $t$-structure on $C_S$ is separated and compatible with filtered colimits. Its heart is a Grothendieck abelian category, and there is a continuous equivalence 
#[#set math.equation(numbering: n => "(9.1)")
 $ D \( C_S^suit.heart.stroked \) tilde.eq C_S . $ <eq:L8>]

 The functors $j^(!) \, j_(*) \, i_(*)$ are $t$-exact when $j$ is a principal open and $i$ is a smooth closed collision diagonal. For a smooth divisor $i$, the functor $i^(!)$ has amplitude $\[ 0 \, 1 \]$. These assertions also hold for products of the group categories, with separate subsets of the marks assigned to the different factors.]
] <local:heart>

#proof[
  We first identify the connection that must be added to the Harish–Chandra description of Section 7. On an affine smooth $S$, forgetting the connection has the continuous left adjoint of $D$-induction. Its projection formula allows this adjunction to be tensored with a crystal of categories. Forgetting is conservative: if the underlying object of $M$ vanishes, the action of the $D$-induced structure sheaf on $M$ vanishes, and this induced object generates $D \( S \)$. The adjunction is therefore monadic.
  The connection monad is the differential-operator monad with crystal transport. Filter it by the order of distributions on the formal diagonal of $S$. At every finite order the transport is the one over that infinitesimal diagonal; the associated graded is tensoring with $"Sym" \( T_S \)$. Combine this filtration with the Harish–Chandra induction monad of Proposition 31. In coordinates, the combined induction adds the Laurent-current action and the derivatives on $S$, the latter taken at fixed curve coordinate $z$. Regular currents are stable under this derivative. For a distribution of fixed order, the order of a vanishing current can decrease only by a bounded amount. Thus the formula respects algebraic arc equivariance and smoothness. Each associated graded piece for distribution order is the induction in (7.2) tensored with a vector bundle. It is $t$-exact. The increasing filtration and passage to Ind extend this conclusion from bounded below arc representations to the renormalized category in both $t$-directions.
  Let $cal(H)_S$ denote the ordinary abelian category of smooth connection Harish–Chandra modules obtained in this way, with the specified parameter shift. The two consecutive forgetful functors are conservative and continuous, so their monadic descriptions give a $t$-exact comparison
  $ u_C : C_S arrow.r D \( cal(H)_S \) $
  which is an equivalence on bounded below objects. The heart $cal(H)_S$ is Grothendieck. It is generated by the modules induced, including their connection, from the arc representations that are locally free over the base. The same induction adjunctions give bounded compact generators of $C_S$. Forgetting further to underlying $D$-modules, and removing the parameter shift when using left crystal normalization, commutes with the parameter operations.
  We verify conservativity also without a boundedness condition. At a point the category $C$ is DG semisimple, with basis the Weyl modules $M_eta$ for actual dominant weights of $G$. Here is the irrational-level argument. The Sugawara operator $L_0$ on $M_eta$ has bottom energy equal to the finite Casimir divided by $2 a$, and its spectrum consists of this number plus nonnegative integers. A submodule with a higher bottom energy has, at its bottom, a finite $G$-type killed by the positive currents. Its energy difference would be a nonzero rational number divided by $2 a$ and a positive integer. Irrationality excludes this. A submodule reaching the bottom contains the generating irreducible finite $G$-module. Hence each $M_eta$ is simple. Extensions split by energy separation; at a common bottom energy, a splitting of finite $G$-modules lifts the bottom vectors, which the positive currents kill, and induction splits the extension. The statements use the algebraic energy decomposition from PBW, and generalized eigenspaces for an extension. The unipotent filtration of a finite arc representation now shows that its induction is a sum of these Weyl modules. These inductions generate the heart. Bounded comparison and generation by bounded compacts give the asserted DG semisimplicity.
  On a cell of fixed coincidence pattern the coordinate description of $C_S$ is the tensor product of the corresponding point categories with $D \( S \)$. This description respects the crystal: infinitesimal translation of centered coordinates is inner, through Sugawara translation, since $a eq.not 0$. Between nilpotent lifts its exponential is a finite expression, acting on modules and their mappings. Consequently $u_C$ detects objects on each cell. The ! restrictions to the cells are jointly conservative by the open–closed triangles, so $u_C$ detects objects on the chart. This proves separation. The claimed exactness and amplitude of the parameter operations can therefore be checked in ordinary $D$-modules. In particular, principal-open star extension is exact; the localization triangle then gives the amplitude of $i^(!)$. Compatibility with filtered colimits follows from the monadic formulas.
  It remains to justify unbounded realization. We describe the construction, since bounded comparison alone would not suffice. An exact, sum-preserving functor from a Grothendieck heart to the heart of a separated DG category with filtered-colimit-compatible $t$-structure can be realized on complexes as follows. For a bounded above complex, shift its upper bound to degree zero and use the additive Dold–Kan construction, followed by geometric realization in the target. Equivalently, use the filtered colimit of the finite totalizations of its lower stupid truncations. Changing the upper bound gives the same construction by the normalized-chain suspension identification. For an arbitrary complex, take the filtered colimit over its good upper truncations.
  The inclusion of the heart has discrete mapping spaces: negative cohomology of a mapping complex between heart objects vanishes. Thus the diagrams and their coherences used here are actual diagrams in the target. Short exact sequences of heart objects are cofiber sequences there. Finite totalizations compute the usual cohomology; filtered-colimit compatibility gives the same assertion for the successive infinite totalizations. In particular, quasi-isomorphisms are inverted. The cone calculation is compatible with changing the truncation bounds, since the resulting comparison is an isomorphism on cohomology and the $t$-structure is separated. This constructs an exact continuous DG realization functor.
  Apply this construction to the inverse of $u_C$ on hearts. Its composition with $u_C$ is the identity by the same realization formula in the ordinary derived category. The opposite composition is the identity on bounded objects by bounded comparison, and hence on $C_S$ by its bounded compact generators and continuity. This proves (9.1). The construction is linear: tensoring with a complex of vector spaces is computed by the same finite operations, sums, and realizations. ◻
]

We will also use the corresponding statement about natural transformations. Suppose two continuous functors out of $D \( cal(H)_S \)$ have images of heart objects in a common subcategory whose mapping spaces are discrete. A natural transformation on the heart extends uniquely by the realization formulas above. Indeed, apply it term by term to Dold–Kan diagrams and their truncation colimits. An existing transformation must equal this extension by naturality with the colimit cocones. This argument identifies the mapping spaces as well as the sets of transformations. It applies separately in each variable of a multilinear functor, including auxiliary scheme $D$-module variables.

=== 9.2 Insertion of marked points <insertion-of-marked-points>

Let $T subset V$ be two assignments of marks over the same base $S$. All collisions remain allowed. Subscripts $T$ and $V$ indicate the corresponding categories, and $T = diameter$ means the unit input $D \( S \)$.

#thm([Lemma 9.2.])[
  #emph[Insertion of the unit defines $t$-exact functors $C_T arrow.r C_V$ and $d_T arrow.r d_V$. They have continuous $D \( S \)$-linear right adjoints, commute with parameter operations and disjoint products, and use the vacuum when $T = diameter$. On arc-induced modules the first functor is 
#[#set math.equation(numbering: n => "(9.2)")
 $ "Ind"_(j_T)^(ell_T) W mapsto "Ind"_(j_V)^(ell_V) \( W \|_(H_V) \) . $ <eq:L9>]

 Here restriction is along the restriction map on regular arcs.]
] <local:insertion>

#proof[
  The Lie-algebra formula factors through currents over $V$ whose poles are allowed only at $T$. Modulo regular currents, this intermediate algebra has the same principal parts as the algebra for $T$. Inducing further gives (9.2), the usual insertion formula for localization; compare [2]. The formula is horizontal for the fixed-$z$ connection of Section 7. It preserves compact generators. Its right adjoint is therefore continuous, and the quasi-coherent-linear adjunction descends to the crystal. Compact generation and the mapping base-change statement show that the adjoint commutes with base change as well.
  We check exactness even when points collide. Add one new point $x$ and write $w = z - x$. If $f$ is the old divisor equation, the quotient of Laurent currents by the intermediate algebra is exhausted by principal parts in $w$ after inverting $f$. At finite order the underlying module is built from $cal(O) \/ \( w^n \) \[ f^(- 1) \]$, where $cal(O)$ is the completion for all the marks. The quotient $cal(O) \/ \( w^n \)$ is the finite jet ring at $x$. Inverting $f$ in it is equivalent to inverting $f \( x \)$ in the base: their difference is nilpotent modulo $w^n$. These modules, and hence the quotient of current algebras, are flat over $S$.
  For completeness, flatness suffices for PBW induction even if the quotient is not projective. Modulo the common regular lattice, the sequence of principal-part modules is pure exact with flat quotient. In characteristic zero the symmetric-power filtration for this sequence is obtained from the tensor-power filtration by the symmetric idempotent. The associated graded induction therefore adds a flat symmetric-algebra factor. Alternatively, resolve induction by the common-lattice free bar and filter by PBW degree. For a heart input its associated graded is precisely this symmetric-algebra bar, concentrated in heart degree zero. Induction on the filtration and exhaustion prove exactness of the filtered induction. Proposition 42 transfers this calculation to $C_S$. Iterating adds any finite set of marks; for the empty input the assertion is ordinary PBW.
  For $d_T arrow.r d_V$, use the opposite-character Whittaker model (7.3). On each pole bound the functor is the closed push of the locus with no added poles. Its continuous extension is $t$-exact, and its right adjoint is ! restriction. Both preserve the Whittaker conditions: on the relevant strata the new distinct points have zero pole contribution, with the same $q_D$-pull and exponential; negative defect has zero restriction. Equivalently, one may use the projection characterization of these conditions after (4.1). Empty insertion is the zero-pole vacuum locus, whose Whittaker category is $D \( S \)$ and whose restriction adjoint is continuous. By ! base change these closed pushes also agree with insertion of the Grassmannian kernels in the $upright(bold(d))$ description of (7.4). All the formulas respect disjoint products and parameter operations. ◻
]

=== 9.3 The point calculation and its cohomological gap <the-point-calculation-and-its-cohomological-gap>

At one point, write $M_eta$ for the Weyl module with dominant weight $eta$, and $D_lambda$ for the opposite-character standard in (4.6), labeled by a dominant coweight $lambda$. The labels are those of the actual root datum; no passage to a simply connected or adjoint replacement is made.

#thm([Lemma 9.3.])[
  #emph[The point pairing satisfies 
#[#set math.equation(numbering: n => "(9.3)")
 $ R "Hom"_Q #scale(x: 120%, y: 120%)[\(] F \( M_eta \, D_lambda \) \, F \( M_(eta') \, D_(lambda') \) #scale(x: 120%, y: 120%)[\)] tilde.eq cases(delim: "{", H_(upright("dR"))^bullet \( G \) \, & \( eta \, lambda \) = \( eta' \, lambda' \) \,, 0 \, & upright("otherwise") .) $ <eq:L10>]

 The map induced from the input categories identifies cohomology in degrees at most two. Under the common $W$-module comparison, $F \( M_eta \, D_lambda \)$ is the irrational-level simple reduction $T_(eta \, lambda)^kappa$, tensored with a one-dimensional vector space. Its essential image agrees with the image for the dual pairing with the two labels exchanged.]
] <local:point-gap>

#proof[
  Let $q$ be the balanced-tensor projection in (7.5). The monad $q^R q$ is obtained by applying the right adjoint of multiplication in the spherical category $cal(S)$ to its unit, then acting on the two inputs. At a finite quotient $H_f$ of the arc group by a pro-unipotent kernel this right adjoint uses
  $ Delta_(B H_f \, *) omega_(B H_f) \[ - 2 dim H_f \] . $
  Pulling to the two trivial $H_f$-bundles gives $H_(upright("dR"))^bullet \( H_f \) = H_(upright("dR"))^bullet \( G \)$. On $C$, the spherical action supported at the unit orbit tensors the underlying Lie module by its ! fiber at the base point of $B H$. The semisimplicity proved in Proposition 42 therefore computes this action on distinct Weyl labels.
  For the test slot, put $a_lambda = chevron.l 2 rho_(upright("rt")) \, lambda chevron.r$ and let $upright(bold(k))_g$ be the kernel at the section $g = t^lambda$. Equations (4.3) and (4.6), including integration in dimension $delta_N + a_lambda$, give, after retaining the constant one-dimensional line,
  $ upright(bold(d)) \( upright(bold(k))_g \) = D_lambda \[ - a_lambda \] . $
  Unit-orbit convolution on this section also contributes the fiber at the base point of $B H$: the section trivializes its arc torsor. Combining the two actions proves (9.3). The unit of the adjunction is the constants map. Since $G$ is semisimple, $H_(upright("dR"))^1 \( G \) = H_(upright("dR"))^2 \( G \) = 0$, and the positive cohomology starts in degree at least three.
  We now use the irrational-level reduction theorem of Arakawa–Frenkel [1] Theorems 2.1–2.3. Principal reduction of the Weyl module labeled by $eta$, with Drinfeld–Sokolov twist by the dominant coweight $lambda$, is concentrated in degree zero and is the simple highest module $T_(eta \, lambda)^kappa$. Under Feigin–Frenkel duality it identifies with $T_(lambda \, eta)^(kappa^or)$. In our modes the character on a simple-root current is at mode $- 1 - chevron.l alpha \, lambda chevron.r$, the lattice is the regular lattice, and the $W$-action is the spectral-flow action. Simultaneous changes of character sign conjugate the $W$-fields and leave the statement unchanged.
  To match these conventions, apply (7.1) to $upright(bold(k))_g$. Spectral flow changes a simple-root mode $m$ to $m - chevron.l alpha \, lambda chevron.r$. Its conjugated Fock lattice differs from the regular lattice by the determinant line and the shift $\[ - a_lambda \]$ in (8.3). This shift cancels the shift in the displayed formula for $upright(bold(d)) \( upright(bold(k))_g \)$. The resulting ordinary compared module is exactly the reduction in the preceding paragraph. These objects are compact by the adjunctions of (7.5); full faithfulness of the ordinary $W$ comparison on compacts promotes this calculation to $Q$.
  We will need its generating vector at a collision. It is the highest Weyl vector times the semi-infinite vacuum for the specified lattice. The character and highest-vector formulas make it closed. In the DS calculation, coinvariants for the strictly negative $N$-modes evaluate the PBW-free negative unipotent factor at the character, so the finite-type generating vector survives. The remaining nonnegative cochain calculation has no degree-zero boundaries. Compare also the highest-weight and grading calculations in [1] Sections 4.1 and 4.3. Thus its class is nonzero and generates the reduction. No rigidification of its one-dimensional line is needed. ◻
]

On a cell of fixed coincidence pattern, the same calculation works with parameters. Indeed $Q_S$ is locally the point category tensored with $D \( S \)$. Its horizontal identification is supplied by $W$ Virasoro translation: between formal lifts, exponentiation of the translation generator in a nilpotent ideal identifies centered coordinates. This is an infinitesimal crystal calculation, and requires no exponentiation on a punctured parameter space. The image of a pair of labels is consequently its fixed compact point object tensored by a line with connection. To see that only a line can occur, use mapping base change and (9.3): negative self-Ext vanishes and the degree-zero endomorphisms are scalars. The vacuum line is canonically the same for the two pairings. In (8.3) its generating vector is the Weyl vacuum times the $h$-Fock vacuum, horizontal for the absolute currents; the vacuum presentation in (8.4) preserves it over families and their collision diagonals.

The same description computes right adjoints. On coordinate pieces of a cell the pairing is tensoring with fixed compact point objects and invertible line connections. Therefore the cone of its unit on a heart input lies in degrees at least three, and every input is a retract of the result of applying the resulting right-adjoint monad. Products of points give the same assertions. Insertions simply prescribe that some labels be the vacuum.

=== 9.4 Extending the equivalence across collisions <extending-the-equivalence-across-collisions>

Insert the vacuum in the second slot of $F_S$ and in the first slot of $caron(F)_S$, and write

$ F_0 : C_S arrow.r Q_S \, #h(2em) F_1 : caron(d)_S arrow.r Q_S . $

Their right adjoints $R_0 \, R_1$ are continuous and $D \( S \)$-linear, by Proposition 34 and Lemma 43. Corollary 35 identifies these adjunctions under restriction to the smooth parameter charts. In particular they commute with $i_(*) \, i^(!) \, j_(*) \, j^(!)$ for the closed collision divisor and its principal open complement, including the units and counits. The same assertion applies to closed graph maps in auxiliary parameter factors.

#thm([Proposition 9.4.])[
  #emph[There is a canonical continuous $t$-exact equivalence 
#[#set math.equation(numbering: n => "(9.4)")
 $ alpha_S : C_S arrow.r^(med tilde.op med) caron(d)_S \, #h(2em) F_1 alpha_S tilde.eq F_0 . $ <eq:L11>]

 It is $D \( S \)$-linear and compatible with the parameter operations, disjoint products, and coordinate changes. Exchanging the two groups gives $caron(alpha)_S : caron(C)_S tilde.eq d_S$. The same statements apply to the simultaneous opposite levels.]
] <local:one-slot>

#proof[
  The proof has three stages. We propagate two low-degree properties across a collision divisor, use them to construct the equivalence of hearts, and then realize that equivalence and its compatibilities. The final passage to DG categories will also use the cell retract property established after Lemma 44.
  On a cell, that lemma gives the following properties for heart inputs:
  + #emph[Unit gap.] The cone of $M arrow.r R_r F_r M$ lies in degrees $gt.eq 3$, for $r = 0 \, 1$ in its respective source category.
  + #emph[Cross-pairing gap.] For $U = R_1 F_0$, the object $U M$ lies in degrees $gt.eq 0$, has $H^1 = H^2 = 0$, and $H^0 U$ is an exact equivalence of hearts. The adjunction map $F_1 H^0 U M arrow.r F_0 M$ is an isomorphism.
  The analogous assertions hold with the subscripts reversed. The invertible base lines in the cell calculation are included in these equivalences.
  #emph[Propagating the unit gap.] We prove these properties on a larger piece of the arrangement by adding a smooth divisor $i$, with principal complement $j$. Assume them on both smaller pieces. For $M$ in the heart put $B = j^(!) M$ and $E = i^(!) M$. Then $B$ is in the heart and $E$ has amplitude $\[ 0 \, 1 \]$, by Proposition 42 and Proposition 15 on the two respective sides. Apply the cone of the unit to
  $ i_(*) E arrow.r M arrow.r j_(*) B . $
  The exact pushes and the known bound on the two cohomology terms of $E$ give the unit gap on the larger piece. It implies, by adjunction, that each $F_r$ identifies degree-zero maps between heart inputs with those between their images, whose negative Hom also vanishes.
  #emph[The boundary map and the equivalence of hearts.] On the closed piece, the induction hypothesis gives $U E$ in degrees $gt.eq 0$, with $H^0 U E \, H^1 U E$ obtained from $H^0 E \, H^1 E$ by the heart equivalence, and $H^2 U E = 0$. Moreover,
  $ F_1 tau_(lt.eq 1) U E tilde.eq F_0 E . $
  Indeed this holds on the two heart terms; the gap makes their truncations a triangle, so it holds on $E$.
  Apply $U$ to the localization triangle. Its only possible obstruction to the cross-pairing gap is $H^1 U M$. In the original heart, the boundary gives an epimorphism
  $ j_(*) B arrow.r i_(*) H^1 E . $
  The corresponding boundary after applying $U$ is
  $ j_(*) H^0 U B arrow.r i_(*) H^1 U E . $
  To identify these maps, let $D$ be a heart object on the closed piece of the $C$ family. Here and below $U$ on either smaller piece denotes its corresponding adjoint composite. There are natural identifications of degree-zero maps
  $ "Hom"_(C_S) \( j_(*) B \, i_(*) D \) & tilde.eq "Hom"_(Q_S) \( F_0 j_(*) B \, F_0 i_(*) D \)\
 & tilde.eq "Hom"_(Q_S) \( F_1 j_(*) H^0 U B \, F_1 i_(*) H^0 U D \)\
 & tilde.eq "Hom"_(caron(d)_S) \( j_(*) H^0 U B \, i_(*) H^0 U D \) . $
  The outer identifications use the unit gaps just proved on the larger piece; the middle one uses the smaller-piece comparisons and their compatibility with the exact pushes. Apply this chain with $D = H^1 E$. The comparison $F_1 tau_(lt.eq 1) U E tilde.eq F_0 E$, followed by the truncation map $E \[ 1 \] arrow.r H^1 E$, identifies the two boundary maps. The gaps ensure that the maps to the indicated heart objects are unique. The cokernel of the second boundary is supported on $i$, because $j^(!)$ is exact. By the equivalence of hearts on the closed piece, write it as $i_(*) H^0 U D$ for a closed-heart object $D$. The quotient map from $i_(*) H^1 U E$ then corresponds to a map $i_(*) H^1 E arrow.r i_(*) D$. Naturality of the displayed identifications makes its composite with the first boundary zero. That boundary is an epimorphism, so this map, and hence the quotient map, is zero. The cokernel therefore vanishes. Hence $H^1 U M = 0$; the other degree bounds and $H^2 U M = 0$ follow from the same triangle.
  Finally, test the adjunction map $F_1 H^0 U M arrow.r F_0 M$ by ! restriction to both pieces. On the open it is the known map. On the closed piece the gap and the amplitude of $i^(!)$ give
  $ i^(!) H^0 U M = tau_(lt.eq 1) U E \, $
  so it is the preceding isomorphism for $E$. Conservativity of the two restrictions proves the assertion. The long exact sequence and the gap show that $H^0 U$ is exact on the heart. Repeating with the two sides reversed gives inverse heart functors, because the unit gap identifies their degree-zero maps. This completes the induction through the arrangement.
  #emph[Realization and equivalence of DG categories.] Realize $H^0 U$ using (9.1). The heart formula commutes with sums and filtered colimits, so its realization $alpha_S$ is continuous and $t$-exact. The comparison of functors in (9.4) extends by the natural-transformation statement after Proposition 42: the relevant images of heart objects have discrete mapping spaces. This also proves commutation with the exact operations $j^(!) \, j_(*) \, i_(*)$, first on hearts and then on their realizations.
  We verify that $alpha_S$ is an equivalence without presupposing a derived-realization theorem for $caron(d)_S$. The mate
  $ alpha_S R_0 arrow.r R_1 $
  is an isomorphism on the cells, by their explicit description. It remains so after successive $i_(*)$ and $j_(*)$, by their linear adjunctions and the comparisons just established. Open–closed triangles show that it is an isomorphism on all objects. Adjunction and (9.4) now give full faithfulness on maps into objects in the image of $R_0$. On every cell, every input is a retract of such an object by the cell monad calculation. Applying the exact pushes and the localization triangles yields full faithfulness everywhere. The corresponding retracts on the other side generate $caron(d)_S$ under colimits and finite extensions. Thus the continuous fully faithful functor is also essentially surjective.
  #emph[Linearity and coherence.] Carry out all the constructions with a list of auxiliary scheme factors. Exterior products of heart objects are heart objects in the ordinary module description; for the Whittaker side this follows on the pole bounds and then by colimits. The same gaps therefore give the canonical comparisons for exterior products. The comparisons also commute with closed graph or diagonal pushes in these auxiliary factors, by the exact heart constructions. Their coherences are unique there, since the relevant mapping spaces are discrete, and realization preserves these coherences. Taking mates gives the coherent squares for ! pulls. Exterior product followed by diagonal ! pull computes the $D \( S \)$ action; hence these squares give $D \( S \)$-linearity, including its unit and iterated-action coherences. The original $F_i \, R_i$ commute with the units and counits of these operations, so the comparison $F_1 alpha_S tilde.eq F_0$ has the same linearity.
  Disjoint products give the cell comparison used to construct $alpha_S$, and hence the same comparison everywhere. To check the $t$-structures even when each disjoint block has internal collisions, characterize nonnegative objects by their ! restrictions to the arrangement pieces, using the localization triangle and left exactness of ! restriction and the pushes. The product equivalence and its inverse preserve this criterion. Uniqueness on hearts and realization give its coherence. The same criterion makes the $t$-structures local in the curve, including those defined by global pole models for $d_S$. Consequently the constructions agree on étale coordinate charts and glue. This proves all the assertions. ◻
]

=== 9.5 Comparison with both slots inserted <comparison-with-both-slots-inserted>

The preceding equivalence will be used inside integrated pairings. For this purpose it must respect insertion simultaneously in both slots. Let $T \, U$ be two colors of independent marks over a parameter chart $S$, let $Z$ be extra neutral marks, and put $V = T union U union Z$. Collisions within and between all three sets are allowed. The common input is $C_T ⊗_(D \( S \)) caron(C)_U$, with $D \( S \)$ used for an empty color.

#thm([Proposition 9.5.])[
  #emph[There is a canonical comparison $G_0 tilde.eq G_1$, where 
#[#set math.equation(numbering: n => "(9.5)")
 $ G_0 \( A \, B \) & = F_V #scale(x: 120%, y: 120%)[\(] "ins" A \, "ins" \( caron(alpha)_U B \) #scale(x: 120%, y: 120%)[\)] \,\
G_1 \( A \, B \) & = caron(F)_V #scale(x: 120%, y: 120%)[\(] "ins" B \, "ins" \( alpha_T A \) #scale(x: 120%, y: 120%)[\)] . $ <eq:L12>]

 It agrees with the disjoint comparison and respects $D \( S \)$-linearity, coordinate changes, disjoint products, symmetries, and all diagonal operations for merge and repetition of marks. Vacua give the empty inputs. In particular, (9.4) is compatible with ordinary insertion of marks.]
] <local:two-slot>

#proof[
  First the collision argument constructs an autoequivalence of the common input that intertwines $G_0$ and $G_1$. Translation will identify this autoequivalence with the identity. We will then check that the resulting comparison specializes to the prescribed vacuum insertion map when a neutral point meets another mark.
  Both functors have continuous linear right adjoints by Proposition 34 and Lemma 43; their parameter adjunctions are those of Corollary 35. To apply the proof of Proposition 45, take both source families to be $C_T ⊗_(D \( S \)) caron(C)_U$ and replace $F_0 \, F_1$ by $G_0 \, G_1$. Proposition 42 supplies the product KL $t$-structure, its open–closed amplitudes, and derived realization. On each cell the point label calculation supplies the unit and cross-pairing gaps, as well as the retracts of right-adjoint images used for the derived equivalence. This holds also at cross-color collisions: the point calculation exchanges the matched labels, while the neutral insertions designate vacua. The divisor induction, realization, and auxiliary-parameter argument therefore give a $t$-exact $D \( S \)$-linear autoequivalence $beta_S$, whose heart functor is $H^0 \( G_1^R G_0 \)$, and an isomorphism
  #[#set math.equation(numbering: n => "(9.6)")
   $ G_1 beta_S tilde.eq G_0 . $ <eq:L13>]
  On the open where different colors do not meet, neutral marks meet neither color, and neutral marks are distinct, this autoequivalence is canonically the identity. Use disjoint factorization, (9.4), and the common horizontal $W$ vacuum. This comparison retains the line connections; it does not choose flat frames for conformal-weight lines. We show that the identity comparison extends through the deleted crossings.
  #emph[Translation of an entire color.] We construct the comparison first on the universal affine-line chart with independent coordinates for the marks and any auxiliary parameters. The parameter comparisons then pull it to the smooth charts under consideration; curve-coordinate descent is checked below. If $T$ is nonempty, select one of its marks as origin for the relative coordinates and write
  $ S = bb(A)_y^1 times S_0 \, $
  where $y$ translates all $T$-marks together. In this step remove only those collision loci not involving $T$, so their equations are independent of $y$. The locus of forbidden crossings involving $T$ is the zero set of a polynomial $f$ monic in $y$. The common input admits a $t$-compatible presentation
  $ D \( bb(A)^1 \) ⊗ cal(E) \( S_0 \) . $
  Here $cal(E) \( S_0 \)$ is the product KL category for the relative positions and the other color; it has the heart and realization properties of Proposition 42.
  We justify the horizontal assertion in this presentation also at internal collisions of $T$. Simultaneous translation is implemented by $L_(- 1)$, the total smeared Sugawara operator. Its bracket with currents is the ordinary translation derivation. Use total residue over the marked divisor to define it. The mode expansion and the bracket identity hold over the parameter ring, as can be checked on PBW generators before specialization. In particular this operator is horizontal in the remaining parameters at fixed curve coordinate $z$. One can see this directly by splitting into the regular lattice and the isotropic Laurent complement of rational functions with poles on the divisor and vanishing at infinity. Infinitesimal variation of the poles at fixed $z$ preserves both halves. The quadratic expression from their residue pairing, with regular modes on the right, has the translation bracket on all the fibers and over the parameter ring. Normal-order sums act on smooth modules. Subtracting this inner translation from the parameter derivative gives the commuting derivative in the displayed product category. The nilpotent exponential identifies the centered and absolute crystal transports, including on formal collision diagonals. The same constructions allow the fixed origin among the relative coordinates of $S_0$.
  #emph[Unique extension on constant objects.] For $E in cal(E) \( S_0 \)^suit.heart.stroked$ set
  $ M = omega_(bb(A)^1) \[ - 1 \] times.square E . $
  This is a heart object with no nonzero subobject or quotient supported on $f = 0$. For subobjects this follows from the ordinary module presentation: the polynomial $f$ is monic, so multiplication by it is injective on the module underlying $M$. For quotients, a generator constant along $y$ cannot have nonzero image in an $f$-torsion module. If $f^n e = 0$ and the commuting derivative satisfies $partial_y e = 0$, differentiation $n deg_y \( f \)$ times gives a nonzero constant multiple of $e = 0$. The argument applies generator by generator, without coherence or a uniform torsion exponent. Vanishing on the open $f eq.not 0$ is exactly $f$-torsion in this module description.
  The same condition holds for $beta_S M$. Indeed $beta_S$ is an exact equivalence, commutes with open restriction along with its inverse, and hence preserves the supported subcategory. The identity comparison over $f eq.not 0$ now extends uniquely to $beta_S M tilde.eq M$. To prove this explicitly, embed both objects in the star push of their common open restriction; the embeddings are monomorphisms because neither object has a supported subobject. The quotient of either image by its intersection with the other is supported on $f = 0$, hence zero. Their images are equal. The same argument proves uniqueness of the extension.
  This comparison is natural in $E$. Extend it by realization in $cal(E) \( S_0 \)$, and then by $D \( bb(A)^1 \)$-linearity. The latter step is valid because the displayed product is a free $D \( bb(A)^1 \)$ factor and $omega_(bb(A)^1) \[ - 1 \]$ is its shifted unit. To retain $D \( S_0 \)$-linearity, do the construction with any list of auxiliary parameters. Uniqueness on the external heart objects makes it commute with exterior products and with exact graph and diagonal pushes in those parameters. Realization and the free $D \( bb(A)^1 \)$ factor extend these identities. Passing to mates supplies the coherent !-pull and linearity squares, as in Proposition 45.
  This allows all crossings involving $T$. Next translate $U$ to allow its remaining crossings. Finally translate one neutral point at a time to allow crossings between neutral points; the input then has a free $D \( bb(A)^1 \)$ factor with no color on it. At each step the deleted equation is monic in the translating coordinate, while the other remaining deletions lie in the base. We have constructed an extension of $beta_S tilde.eq "Id"$ over every collision.
  #emph[Uniqueness and changes of chart.] Natural transformations after (9.6) are controlled on hearts by Proposition 42. An endomorphism of the identity of a KL input is determined on the dense open. Indeed, its heart is epi-generated by connection-induced arc representations locally free over the base. PBW makes these inducing generators torsion-free for localization to the dense open. A map on such a generator that vanishes there is zero; naturality with the generating epimorphisms then detects the transformation on every heart object. The same argument with auxiliary parameters and diagonal pushes proves coherent uniqueness. Thus the extensions just constructed are independent of the order of translation, agree on smaller affine charts, and glue. Over $X$, use étale coordinates separating disjoint clusters. The locality in the curve proved in Proposition 45 identifies these constructions with the affine-line calculation. This gives (9.5), including its symmetries and disjoint-product compatibility.
  #emph[Diagonal operations involving a neutral point.] The comparison now extends over the independent marking chart. To identify its pullback along a neutral-point diagonal with the specified insertion comparison, we must still determine its value on the vacuum. The following two-point calculation does this.
  Compatibility with a same-color merge follows from uniqueness: on the resulting scheme use its dense open with separated colors and neutrals, where the comparison is (9.4). For a neutral point merging into another mark the same uniqueness reduces to the locus where all other resulting marks are separated. These reductions are legitimate inside the comparison of functors: closed diagonal push is fully faithful and $t$-exact, and the gap and adjunction constructions commute with it. Thus one can push a resulting heart object to the original chart, compare there, and apply the same heart and realization test on the diagonal.
  Disjoint product reduces the remaining calculation to two points: a neutral point $w$ merging with a neutral point or a labeled point $x$. Two neutral points use the common horizontal vacuum already described. Now let the label at $x$ have color $T$. The first pairing uses its Weyl module and the inserted test vacuum; the second uses the dual Weyl vacuum and the matched test label. Write $lambda$ for the coweight of that dual test label; the $U$ case exchanges the groups. Work in a coordinate neighborhood and fix $x$ by base change if convenient. On the Weyl side, insertion is (9.2) from evaluation at $x$. On the flow side, use the Grassmannian section $g = \( z - x \)^lambda$ and the inserted Weyl vacuum. Retain the shifts and determinant line from Lemma 44. The line comparison in (9.4) pulls back from the label at $x$.
  In the compact ordinary comparison (8.3), both complexes have the closed cycles given by their highest vectors and Fock vacua. The mode formulas (8.4) define them also at $w = x$. On the flow side the change of lattice has a finite locally free quotient at $x$, even when $w = x$, so its determinant also extends. The positive-current and character equations proving closure are unchanged. If $w eq.not x$, the section $g$ is regular at $w$; its standard central splitting acts trivially on the vacuum generator there. The Fock vacuum and determinant formula use the same splitting. Thus these cycles are exactly the external highest cycles with the vacuum at $w$, without a factor depending on $w$. Their classes generate also when $w = x$, by the point reduction theorem.
  Here is the specialization argument that identifies the actual comparison map on the diagonal. Pass to a parameter DVR transverse to $w = x$, with uniformizer $pi$, and denote either shifted BRST complex by $K$. Its terms are flat; its generic and closed fibers have cohomology only in degree zero. The closed degree-zero classes lift to $K$, because the displayed cycles and their $W$-modes generate them. The long exact sequence of
  $ K arrow.r^pi K arrow.r K \/ pi $
  therefore shows that multiplication by $pi$ is injective on $H^0 \( K \)$ and on every $H^q \( K \)$. For $q = 1$ use precisely the surjectivity of the lifting of $H^0 \( K \/ pi \)$; in other degrees injectivity follows directly from the vanishing of the adjacent fiber group. The generic calculation makes $H^q \( K \)$ torsion for $q eq.not 0$, hence zero by this injectivity. The module $H^0 \( K \)$ is torsion-free and consequently flat over the DVR.
  On the generic fiber the comparison is the fixed line comparison at $x$ and the identity on the vacuum. Since the generating cycles extend and the degree-zero modules are torsion-free, the same formula holds before specialization and at $w = x$. This proves the comparison on the extremal-label vector. Degree-zero maps between the matched label objects are just maps of the corresponding lines with connection, so it proves the comparison on the full two-point test locus. Auxiliary parameters can be included throughout. All elementary diagonal comparisons therefore agree; their repeated composites are coherent by the closed-push and discrete-mapping realization argument. A crossing between the two colors requires no operation identifying their colors: it is simply parameter pull of the comparison on the independent marked-point chart.
  #emph[Insertion for the one-slot equivalence.] Compare $alpha_V "ins"$ with $"ins" alpha_T$ using (9.4) and (9.5) with the other color empty. After applying $F_1$ at $V$, the comparison is the one already constructed. On heart objects the gap makes $F_1$ fully faithful in degree zero and negative degrees, so this lifts uniquely before $F_1$; insertion is $t$-exact by Lemma 43. Realization extends the lifted comparison. For transitivity, test on the dense separated locus. In the test category insertion by a closed pole image is fully faithful, since $i^(!) i_(*) tilde.eq "Id"$ on each closed bound and hence after passage to the colimit. Thus the same uniqueness using KL generators proves transitivity. It also proves repetition and the auxiliary linearity coherences. All unit conventions, determinant lines, and coordinate transports are retained in the comparisons, as required. ◻
]

== 10 Localization and finite-level periods <sec:localization>

We now connect the local pairing of Section 9 with a Whittaker coefficient of global localization. The comparison has two steps. This section expresses that coefficient as an exponential period on a stack of unipotent bundles. Sections 11 and 12 identify the period with semi-infinite cohomology after integration over additional markings. The integration is essential: semi-infinite cohomology at one fixed finite set is not itself the global period.

Continue with the notation $G \, A \, s \, C_T \, d_T$ of Sections 7–9. Set

$ delta_N = - chi \( X \, frak(n)_0 \) \, #h(2em) l_N = det R Gamma \( X \, frak(n)_0 \) . $

We compose determinant lines and their dimension shifts using graded multiplicativity, including the relative-lattice identifications in (8.3). For a tuple $T$ over a smooth parameter scheme $S$, write

$ "Loc"_T : C_T arrow.r D \( L_G^s times.square cal(O)_S \) \, #h(2em) Lambda_T = "Loc"_T ⊗ l_N^(- 1) \[ delta_N \] . $

The target is the category on $Y_G times S$; the parameter is retained. We construct $"Loc"_T$ below, specifying its left-module normalization. The functor $"oblv"_W : Q_S arrow.r D \( S \)$ is the common underlying-complex functor of (8.8) and Theorem 41; its semi-infinite computation uses (8.3) with the same left-crystal normalization. The coefficient $R_T$ retains the marked parameters, and the pairing is that of (4.3).

Write $integral_(V supset.eq T)$ for relative Ran integration with dualizing normalization. Its charts are all tuples enlarging $T$, with their incidence maps, including coincidences. It can be computed by direct images from these tuple and incidence schemes followed by the colimit of their $!$ systems; equivalently, one uses the colimit presentation with closed direct images. These presentations are pseudo-proper, so the direct images in this calculation agree for $*$ and $!$. Consequently the integral is continuous, commutes with $!$ base change, and satisfies Fubini for two successive enlargements.

#thm([Theorem 10.1.])[
  (Period comparison).  #emph[Fix $G$ and its level as in Section 7, and let $T$ be a nonempty tuple over a smooth parameter scheme $S$. There is a natural isomorphism of continuous $D \( S \)$-bilinear pairings 
#[#set math.equation(numbering: n => "(10.1)")
 $ ⟨R_T Lambda_T \( M \) \, W'⟩_S tilde.eq integral_(V supset.eq T) "oblv"_W #h(-0.16667em) (F_V \( "ins"_(T \, V) M \, "ins"_(T \, V) W' \)) \, #h(2em) M in C_T \, quad W' in d_T . $ <eq:T1>]

 It respects the ordinary and crystalline parameter comparisons, including permutations, repetitions, and diagonal mergers of marks.]
] <loc:period-comparison>

The proof occupies the remainder of this section and Sections 11–12.

We will also use the universal homological contractibility of the Ran space of a connected curve [17], in its relative form with a prescribed tuple contained in the set. Indeed, union with that tuple maps ordinary Ran to the containing-set Ran; forgetting the containment and then taking union is the identity on the latter. Its augmentation is thus a retract of the ordinary Ran augmentation, also after base change. The augmentation therefore integrates a $!$-pullback from the base to that same object. Several prescribed tuples are handled by their union. Our prescribed tuples are nonempty.

=== 10.1 Level structures with moving markings <level-structures-with-moving-markings>

Fix a smooth affine chart $S$ of a tuple space. Let $D_(upright("lv"))$ be either zero or an effective thickening of the entire tuple $T$; positive multiples of the sum of its graphs form sufficient choices. Consider the smooth group schemes over $X times S$

$ frak(G) = \( G^(P_0) \)^(D_(upright("lv"))) \, #h(2em) frak(N) = N_0^(D_(upright("lv"))) . $

The superscript means dilation imposing the identity along the level divisor. For $N_0$, root coordinates are the corresponding root lines twisted by $- D_(upright("lv"))$; their multiplication is defined because products have at least the required vanishing. For $G^(P_0)$, smoothness follows in étale coordinates about the identity by dividing the coordinates by a local equation of the divisor. Away from that divisor the group scheme is unchanged.

Let $B_G^(upright("lv"))$ and $B_N^(upright("lv"))$ be their bundle stacks. They classify bundles with the indicated level framing in the inner presentation. In particular $B_G^0 = Y_G times S$, by contraction with $P_0$. Curve deformation theory makes both stacks smooth over $S$. Write $frak(g)^(upright("lv"))$ and $frak(n)^(upright("lv")) = frak(n)_0 \( - D_(upright("lv")) \)$ for the Lie bundles. The twist on $B_G^(upright("lv"))$ is pulled back from $Y_G$. For the natural map

$ p : B_N^(upright("lv")) arrow.r B_G^(upright("lv")) \, $

its pullback is canonically trivial: the root filtration with fixed Cartan bundle $T_0$ identifies its determinant ratio with the ratio at $P_0$.

For a larger tuple $E supset.eq T$, let $H_(G \, E)^(upright("lv"))$ and $H_(N \, E)^(upright("lv"))$ be the regular arc groups of these level group schemes. The meromorphic Lie algebras do not change, since the level divisor is supported on $T subset.eq E$. We use the Harish–Chandra module categories of Proposition 31; on the $N$ side no character condition is imposed here. The affine extension on the $G$ side has central scalar $- s$ and splits canonically on $N$.

#thm([Lemma 10.2.])[
  #emph[The level Harish–Chandra categories have the compact presentations, continuous functors, and ordinary and crystalline parameter comparisons of Propositions 31 and 32. Restriction between two nonzero levels supported on the whole old tuple is fully faithful when compared through a common deeper level. It preserves compact objects. These comparisons remain valid in the presence of extra markings, including collisions with the old ones.]
] <loc:levels>

#proof[
  First take the underlying quasi-coherent calculation, denoted by $b$ in Section 7. The level subgroup is the kernel of evaluation from regular arcs to the level divisor. At sufficiently deep finite jet stages this evaluation is a smooth quotient. Its differential is surjective by restriction between finite divisors, whose modules are finite locally free. Surjectivity can be checked on geometric points: a jet of a smooth group extends over local Artin thickenings; at an extra distinct point choose the identity. The resolution-property argument in Proposition 31 applies to this kernel. Namely, the ambient jet group has an embedding with quasi-affine homogeneous space, and the additional quotient imposed here is affine. The compact presentation and bounded-object arguments therefore carry over.
  One must distinguish two uses of unipotence. At an added point away from $T$, the level subgroup includes full arcs and need not itself be pro-unipotent. The #emph[difference between deeper levels on the old tuple], however, is smooth unipotent. In the coordinates $u = P \( z \)$ of Section 7, use positive powers of $u$; successive kernels are additive groups from square-zero thickenings. Thus forgetting between these levels forgets strong equivariance for a unipotent quotient. Normalized smooth pull and affine-space de Rham acyclicity give full faithfulness, and the finite relative Chevalley resolution gives preservation of compactness. Full-arc factors at the added points do not affect this argument.
  For crystal comparisons, take two lifts of the parameter tuple across a nilpotent ideal. Their full formal disks and meromorphic objects, including the affine data of (7.1), agree. Pass to common thickenings of their level divisors. Such thickenings are cofinal by nilpotence, and the relevant divisor quotients are finite locally free; locally this follows by division of their monic equations. Differences on the old levels again have unipotent quotients, since their defining ideals in the larger Artin jet rings are nilpotent.
  To include the full-arc factors, first divide by a common deeper normal congruence on the entire tuple $E$. The finite relative D-module equivariant diagrams now compare by their relative de Rham groupoids, together with the formal Lie transport in (7.1). In particular, this comparison uses the specified identification of the actions; an isomorphism of reduced spaces alone would not specify a comparison of Lie modules. Restriction to the common level realizes the same comparison. The finite equivariance calculation of Proposition 33, or the relative Chevalley resolution for a unipotent difference, identifies the corresponding module functors. Zero level compares directly by the full-disk identification. Refinement to a third common level proves the cocycle identities, including on multiple infinitesimal diagonals. This gives precisely the crystal parameter operations. ◻
]

=== 10.2 The localization algebroid <the-localization-algebroid>

We next construct localization on smooth bundle charts. This also identifies the maps that will be needed when a Grassmannian kernel moves in its parameters.

Let $U$ be a smooth scheme over the parameter base with a map to one of the bundle stacks and with full disk framings along $E$, compatible with its level. Write $underline(ell)_U$ for the meromorphic Lie algebra, with its affine extension on the $G$ side. Infinitesimal replacement of the framed gluing data gives the transitive algebroid

$ cal(T)_U = T_(U \/ upright("base")) times_(T_(upright("Framed") \/ upright("base"))) underline(ell)_U . $

An element is a pair $\( v \, x \)$ for which the replacement by $x$ induces the deformation $v$ of the framed bundle. The bracket is the bracket of the right action, including differentiation of Lie sections. Its anchor kernel is the algebra of outside currents

$ frak(g)_(P \, upright("out"))^(upright("lv")) = Gamma \( X - E \, frak(g)_P^(upright("lv")) \) \, $

together with the center when present; the analogous assertion holds for $N$.

Here is why this remains an ordinary algebroid calculation despite the Tate notation. Every infinitesimal framed deformation can be trivialized away from $E$: that complement is affine, so its relative $H^1$ vanishes locally on the chart. Such a trivialization supplies the Laurent replacement and proves transitivity. Its ambiguity is exactly an outside current. The latter is a union of locally free finite-pole pieces with locally free successive quotients, after starting at a sufficiently large pole bound with vanishing $H^1$. On an affine chart, split the successive quotients: the outside currents are then a countable direct sum of finite projective modules. The projective form of PBW therefore applies. Full framings can be chosen by first choosing finite jets and then lifting through smooth jet projections with unipotent kernels on affine test schemes. An automorphism preserving a full framing is trivial.

The determinant line splits the affine extension on outside currents: an outside replacement identifies the bundle back with itself, and there is a unique lift acting trivially on its determinant. The relative determinant of lattices gives this action. Differentiation on the determinant torsor gives a map from $cal(T)_U$ to the relative twisted differential operators $cal(D)_U^s$, taking the center to $- s$.

#thm([Proposition 10.3.])[
  #emph[Localization with level is the continuous functor whose calculation on such a chart is 
#[#set math.equation(numbering: n => "(10.2)")
 $ "Loc"_(G \, E)^(upright("lv")) \( M \) \|_U = cal(D)_U^s ⊗_(U \( cal(T)_U \))^L M_U \, #h(2em) \( v \, x \) m = v \( m \) + x m . $ <eq:T2>]

 Here $M_U$ is the module pulled to the framed chart and the enveloping algebra uses the specified central quotient. Omitting the center and twist gives $"Loc"_(N \, E)^(upright("lv"))$. These functors commute with the parameter operations of Proposition 32, with pullback between smooth bundle charts, and with the deeper-level comparisons of Lemma 48. At zero level divisor, $"Loc"_(G \, T)^0$ is $"Loc"_T$.]
] <loc:construction>

#proof[
  Formula (10.2) is a formula for left modules in the angle-bracket convention. Its underlying $cal(O)$ calculation is the Chevalley chain complex of the outside Lie algebra with coefficients in $M_U$, without an additional shift inside the angle brackets. Indeed, as a right $U \( cal(T)_U \)$-module the TDO is the quotient by the outside kernel, using its determinant splitting. Resolve that kernel and apply PBW; equivalently use the Spencer resolution and the anchor exact sequence. Projective outside algebras of this form cause no completion: the associated graded Koszul calculation is the direct union of the finite calculations.
  For a map of smooth charts $f : U' arrow.r U$, not necessarily a smooth map, the algebroid on $U'$ is the inverse-image algebroid, formed by taking the fiber product with $T_(U' \/ upright("base"))$. The ordinary TDO transfer defines the pullback comparison for (10.2). On its generating section it sends module generators to their pulls; the relations for $\( v \, x \)$ become differentiation and the inverse-image algebroid action. Derived tensor or Spencer resolutions give the map on complexes. On forgetting differential operators it is exactly derived pullback of the outside chain complex, hence an isomorphism. Composition of transfers proves coherence.
  Change of a disk frame by an arc element acts on $M_U$ through its Harish–Chandra equivariance. On the algebroid it acts by conjugation and the logarithmic derivative. The strong differential equality, with the affine splitting on frames, identifies (10.2) in the two frames. This descends the chart formulas. The same chart calculation proves compatibility with forgetting additional level, where the bundle-side operation is $!$-pullback.
  We give the parameter verification since it will be used for arbitrary kernels. Work with relative differential operators on smooth bundle charts. At zero level, the full frame prestack and the Lie formula identify across infinitesimal lifts of the marked tuple. At nonzero level, pull both formulas to a common deeper level as in Lemma 48. The two forgetful maps agree on reduction and supply the same crystalline comparisons; their normalized pulls are fully faithful because the level differences are unipotent torsors. The chart formula already agrees on those pulls. Descent and further common refinements give all multiple-diagonal cocycles. For twisted differential operators, a change of determinant frame by a nil-unit uses Kummer equivariance, that is, its logarithmic derivative with scalar $- s$.
  Ordinary changes of tuple schemes are checked by derived base change in the same formulas. On the inducing compact presentations, PBW and Chevalley terms are locally flat. Base changes between smooth schemes have finite Tor dimension; the cofinal infinitesimal-diagonal projections used for the crystal test are flat. Thus these resolutions compute the asserted comparisons. This argument works on all smooth charts of a bundle-stack exhaustion and their common-level pulls; it does not require a tensor-product assertion for the limit over non-quasi-compact charts.
  Finally take the continuous extension from the compact presentations of Proposition 31. The formulas already use colimits and derived tensors. Their agreement with bounded-module calculations follows by filtered colimits in bounded ranges and the displayed resolutions. At zero level the construction is the usual Beilinson–Drinfeld localization: twist on the frame torsor, descend by positive-loop splitting, and induce along the uniformization algebroid. Pullback to a chart gives (10.2), or equivalently the outside coinvariants. This also fixes its normalization, including the ratio rigidification at $P_0$. The inner presentation changes only the chosen frames. ◻
]

The arbitrary-level localization functor and its crystalline transformation are constructed in [2] Section 12.1, especially Equation (12.4). Its comparison with the quasi-coherent construction after insertion and integration is [2] Theorems 12.1.5 and 12.1.8. We use the standard localization construction here. The moving-parameter and arbitrary-kernel comparisons required below are proved by the algebroid calculation, and the period identity (10.1) will be proved in the following sections.

=== 10.3 Propagation and restriction <propagation-and-restriction>

Adding a marked point enlarges both the outside algebra and the principal parts. Their quotient records the same global cohomology; this is the reason localization is unchanged by insertion.

Fix $T subset.eq U' subset.eq E$ and the level divisor supported on $T$. Insertion in the level categories is denoted by $"ins"_G$ or $"ins"_N$. At $b$ it is (9.2) with the arcs of the level group scheme. More explicitly, use the intermediate Laurent algebra completed along $E$ but allowing poles only on $U'$, restrict the old module to it, and then induce to the Laurent algebra at $E$. The cocycle identifies under this map by the relative-residue formula, equivalently by the relative determinant. For each pole bound, principal parts of the intermediate algebra modulo its regular level lattice are the same finite divisor-supported module as at $U'$. This statement uses the sum of graphs and remains true at collisions.

The induction bar with the common arc subgroup gives the bounded module formula and its maps. Its pole quotient is flat by the jet localization calculation following (9.2), since the level Lie bundle is locally free on the curve. The formula on compact presentations therefore extends continuously and is transitive. Arc representations are pulled by the map from arcs at $E$ to those at $U'$. For an infinitesimal parameter comparison, the intermediate algebra compares by inverting the old divisor equation. Deepening a level on $T$ leaves this Lie induction unchanged and only restricts its Harish–Chandra equivariance. Thus insertion has all the parameter and level comparisons just constructed.

#thm([Proposition 10.4.])[
  #emph[With parameters retained, there are natural isomorphisms 
#[#set math.equation(numbering: n => "(10.3)")
 $ "Loc"_(G \, U')^(upright("lv")) \( M \) tilde.eq "Loc"_(G \, E)^(upright("lv")) \( "ins"_G M \) \, $ <eq:T3>]

 and the analogous isomorphisms for $N$. They respect transitivity, ordinary and crystalline parameter changes, and deeper levels.]
] <loc:propagation>

#proof[
  On an $E$-framed chart, restriction of an outside trivialization from $X - U'$ to $X - E$ maps the old localization algebroid to the new one. Its Laurent vector lies in the intermediate algebra: in vector representations, clear powers of the old divisor equation before completing along $E$. This also proves the assertion when points collide. The central splittings and the maps to TDOs agree, since both use the determinant of the same replacement. Sending module generators into the induction therefore defines the comparison.
  Test the map on the inducing generators of Proposition 31. Filter the outside-chain calculation by total PBW degree, counting the number of chain factors as well. For an inducing representation $W$, the associated graded is $W$ pulled to the chart, tensored with
  $ "Sym" #h(-0.16667em) ("Cone" #scale(x: 120%, y: 120%)[\(] frak(g)_(P \, upright("out"))^(upright("lv")) arrow.r "PP" \( frak(g)_P^(upright("lv")) \) #scale(x: 120%, y: 120%)[\)]) . $
  The outside-current term in this cone is in shift $\[ 1 \]$. The meromorphic resolution identifies the cone with $R Gamma \( X \, frak(g)_P^(upright("lv")) \) \[ 1 \]$ for either tuple, and the comparison induces the identity on this object. The exhaustive increasing PBW filtration gives the isomorphism. The argument for $N$ is identical, and all its maps are the parameter maps of Proposition 49. ◻
]

Restriction of Lie modules from $G$ to $N$, denoted $"Res"$, is ordinary bounded restriction on compact inputs at $b$, with values in the renormalized $N$ category by bounded comparison, and is then extended continuously. One may construct it by the map of Harish–Chandra induction monads: restrict the group representation and use the enveloping-algebra map. On finite representation generators this is the ordinary restriction map; PBW commutes with filtered colimits in bounded ranges. The forgetful functors of Proposition 31 show that it is $t$-exact at $b$. These descriptions also prove the common-level crystal comparisons.

We record more precisely the filtration used later to control this restriction. For a $G$-inducing generator with representation $W$, count only the PBW factors outside the $N$ algebra. Its $i$th graded piece, as an $N$ module, is

#[#set math.equation(numbering: n => "(10.4)")
 $ "Ind"_("Lie" H_N^(upright("lv")))^(ell_N^(upright("loop"))) (W ⊗ "Sym"^i "PP" \( frak(g)^(upright("lv")) \/ frak(n)^(upright("lv")) \)) . $ <eq:T4>]

Here $ell_N^(upright("loop"))$ has no center and $W$ is restricted to $H_N^(upright("lv"))$. Order $N$ operators first in PBW. Commuting an arc $N$ vector past an outside operator gives its adjoint action modulo $N$ and the regular lattice; all other terms have smaller outside count. Commutators of outside operators, including central terms, also lower that count. This proves the intrinsic filtration. The inducing representations in (10.4) are exhausted by locally free pieces at finite pole and representation bounds: finite principal-part bounds are arc-stable, and one takes their symmetric and tensor powers with $W$. Consequently the filtration is valid in the renormalized comparison and commutes with scalar extension and the crystal maps.

The enveloping formula gives a natural map

$ "ins"_N "Res" \( M \) arrow.r "Res" \( "ins"_G M \) . $

The map of localization algebroids on $B_N^(upright("lv"))$, together with the determinant trivialization there, gives

#[#set math.equation(numbering: n => "(10.5)")
 $ "Loc"_(N \, E)^(upright("lv")) \( "Res" M \) arrow.r p^(!) "Loc"_(G \, E)^(upright("lv")) \( M \) . $ <eq:T5>]

These maps commute with propagation (10.3), with the displayed insertion map for restriction, and with the ordinary, crystalline, and deeper-level comparisons. They are maps induced by the same derived tensor construction (10.2).

=== 10.4 Localization of an arbitrary Grassmannian kernel <localization-of-an-arbitrary-grassmannian-kernel>

Let $M in C_T$ and let $K in D_(cal(L)^(- s)) \( "Gr"_T \)$ be supported on a finite closed bound $Z$, which may be taken proper over $S$. Choose a level divisor on $T$ sufficiently deep that its congruence subgroup acts trivially on $Z$ and that all determinant data factor through the resulting finite jets. Such a choice exists: for Laurent elements in a fixed bound, conjugation carries sufficiently deep congruences into positive arcs. Then $K star.op M$ is a module for $H_(G \, T)^(upright("lv"))$. This follows directly from (7.1), using $g^(- 1) H_(G \, T)^(upright("lv")) g subset.eq H_(G \, T)^0$. The convolution uses the positive-loop descended kernel with $!$ pairing and star integration; its unmodified-section value is $M$.

The level framing defines the modification map

$ t_Z : Z times_S B_G^(upright("lv")) arrow.r Y_G times S . $

The determinant formula for this map has the factor $cal(L)^s$ on $Z$, which cancels the twist of $K$.

#thm([Proposition 10.5.])[
  #emph[There is a natural isomorphism 
#[#set math.equation(numbering: n => "(10.6)")
 $ "Loc"_(G \, T)^(upright("lv")) \( K star.op M \) tilde.eq \( "pr"_(B_G^(upright("lv"))) \)_(*) ("pr"_Z^(!) K ⊗^(!) t_Z^(!) "Loc"_T \( M \)) . $ <eq:T6>]

 It is compatible with ordinary and crystalline parameter operations, with deeper levels, and with insertion into $E supset.eq T$. In the last comparison, $K$ is taken by closed direct image to the Grassmannian at $E$.]
] <loc:kernel>

#proof[
  #emph[1. Relative gauge comparison.] We first compare the kernels before integrating against $K$. On a smooth affine plot of $Z$, choose a Laurent lift $g$ and a determinant lift $tilde(g)$. If $f$ is a disk frame on a localization chart, the frames $f$ and $f g$ identify their vector/Lie pairs by
  #[#set math.equation(numbering: n => "(10.7)")
   $ \( v \, x \) mapsto (v \, "Ad"_(g^(- 1)) x + tilde(g)^(- 1) v \( tilde(g) \)) . $ <loc:gauge>]
  This is the change in (7.1), including the determinant correction. Hence (10.2) identifies the relative kernel formulas at fixed plot parameters. To obtain a comparison of D-module kernels, we must also verify formal transport when the plot parameter moves.
  #emph[2. Crystalline transfer and independence of choices.] Consider two parameter lifts across a fixed nilpotent ideal. Use common full frames, passing to a common deeper level if necessary. After smooth chart refinement, the two modified bundles lift to maps $q_1 \, q_2 : W arrow.r Y$ to the same smooth bundle chart, agreeing on reduction. Choose their disk and determinant frames with matching reductions; other choices are handled by the arc descent already proved. The change between the two lifts is a formal arrow of the replacement groupoid of $A_Y = cal(T)_Y$. It consists of the nearby chart maps, a trivialization of the deformation off the markings, and its Laurent replacement in the chosen disk frames, including the determinant lift.
  We describe its action to all nilpotent orders. Locally split the transitive anchor of $A_Y$. Lifts of coordinate derivatives together with outside-current directions give coordinates for formal arrows: first move the target along the lifted coordinate directions, then apply a formal outside automorphism. The first movement may be constructed recursively by its formal flow, integrating the Laurent vector and its central component through the logarithmic derivative. It remains a replacement arrow because the framed gluing relation is preserved at each nilpotent order. Equivalently, construct the outside trivializations order by order; their obstruction vanishes by the affineness of $X - E$. Formal isotropy is the exponential of outside currents, with the indicated central splitting.
  The algebra of finite tangent distributions on this formal groupoid is therefore $U \( A_Y \)$. Indeed its order filtration has associated graded the symmetric powers of the coordinate and outside-current tangents, giving the usual Taylor proof of PBW. Only finite Taylor expressions are needed: the coordinate displacements are nilpotent, and at each fixed nilpotent order a Laurent section has a finite pole bound and uses finitely many tangent expressions. No dual of all functions on an infinite-dimensional formal germ is used. Formal composition gives the composition of these distributions.
  For clarity, this identifies the derived transfer maps as well. The two module pulls use
  $ cal(O)_W ⊗_(cal(O)_Y \, q_i) U \( A_Y \) \, #h(2em) i = 1 \, 2 \, $
  as right $U \( A_Y \)$-modules with their inverse-image algebroid actions. Multiply by the Taylor distribution of the formal arrow to send the second generating section to the first transfer. This map is right linear. Differentiating composition shows that it intertwines the inverse-image algebroids by (10.7). After tensoring with the chart TDO, the same distribution becomes the ordinary TDO Taylor transfer, with the determinant-frame factor. A nil-unit change of that lift acts by its inverse-section power in the arrow from the second pull to the first, on both sides, because the central scalar is $- s$.
  One can verify the transfer quotient directly by PBW. The anchor kernel pulls back from $Y$; order its factors first. The enveloping transfer is then PBW-free in these kernel directions, so tensoring to the kernel quotient computes its derived tensor as well. Equivalently, the associated-graded Koszul complex has no additional homology. The resulting quotient is precisely the ordinary TDO transfer.
  The result is independent of the outside trivialization used to construct the formal arrow. Two choices differ by a formal outside automorphism. On a fixed nilpotent test its Taylor distribution is a finite unit $u$ in the enveloping algebra of the target inverse-image algebroid, lying in the anchor-kernel subalgebra. Its determinant-trivial lift maps to $1$ in the TDO quotient. The inner-conjugation bimodule is canonically identified by multiplication by $u$, with $u^(- 1)$ for the reverse direction; this intertwines the corresponding coefficient-module actions. On the TDO quotient the identification is the identity. These bimodule identifications compose by multiplication of units. Applying the functorial two-sided bar construction therefore gives a coherent trivialization of the ambiguity after derived tensor, including all higher homotopies.
  Thus tensoring these transfer diagrams with a complex of coefficient modules proves the required comparison, including derived relations in compact presentations. On the coefficient module the formal arrow acts by the Taylor form of (7.1), since its derivatives are the stated Lie action. Formal-arrow composition gives every cocycle identity. Refining charts or changing arc frames uses the same transfer and Harish–Chandra formulas.
  #emph[3. Integration and insertion.] We have proved equality after every $!$-plot pull, with all the infinitesimal lift comparisons. The plot criterion proved in Proposition 33 therefore identifies the parameter D-module kernels. Localization with parameter coefficients is continuous and $D \( S \)$-linear. Star-pairing these kernels with $K$ commutes with localization, by relative tensor and $!$ base change, and gives (10.6). The calculation is schematic on finite bounds, so it is valid on the smooth bundle charts used above.
  Finally insert into $E$. The modification represented by $g$ has poles only at $T$. In an $E$-frame its Laurent datum consequently belongs to the intermediate meromorphic group: clear powers of the old divisor before completing, as in Proposition 50. Conjugation identifies the intermediate-algebra induction bars with the modified old-module bars. Termwise their Lie actions are intertwined by (10.7), with the same relative determinant. The derivative on the added enveloping factor is the conjugation derivative; together with the derivative on the coefficient module this is exactly (7.1) on the induced module. Hence the preceding formal Taylor comparison also intertwines the bars. The old level depth suffices: only poles at the old divisor are cleared, and the new positions carry positive arcs. Arc changes use Harish–Chandra equivariance. The plot comparison and star integration now prove the insertion assertion. At any enlarged finite bound, imposing the old pole conditions is a closed embedding, so closed-image/$!$-pull formulas supply the stated image of $K$. All these comparisons are unchanged at deeper levels. ◻
]

=== 10.5 Whittaker averaging as a unipotent period <whittaker-averaging-as-a-unipotent-period>

Localization and its kernel compatibility are now available in families. We use them to express the left side of (10.1), before the scalar normalization in $Lambda_T$, as one exponential period.

Let $q_N^(upright("lv")) : B_N^(upright("lv")) arrow.r S$ be projection and let $psi_0$ be the zero-defect function in (4.1), pulled back to this stack. Define

$ "Per"_(G \, E)^(upright("lv")) \( M \) & = \( q_N^(upright("lv")) \)_(*) ("Exp" \( - psi_0 \) ⊗^(!) p^(!) "Loc"_(G \, E)^(upright("lv")) \( M \)) \,\
"Per"_(N \, E)^(upright("lv")) \( M \) & = \( q_N^(upright("lv")) \)_(*) ("Exp" \( - psi_0 \) ⊗^(!) "Loc"_(N \, E)^(upright("lv")) \( M \)) . $

Their projections are safe, since stabilizers are unipotent, and these functors have the preceding parameter compatibilities. Put

$ delta = dim \( B_N^(upright("lv")) \/ S \) = - chi \( X \, frak(n)^(upright("lv")) \) . $

The periods with shift $\[ - 2 delta \]$ agree under deeper nonzero-level pull comparisons. This is the smooth normalization for the unipotent torsors that forget the extra level.

For $W' = upright(bold(d)) \( K \)$, where $K$ is supported on $Z$, the pairing (7.4) expresses the unnormalized left side as

#[#set math.equation(numbering: n => "(10.8)")
 $ \( q_Z \)_(*) (K ⊗^(!) mu^(!) R_T "Loc"_T \( M \)) . $ <eq:T7>]

The maps are $q_Z : Z arrow.r S$ and the uniformization map $mu$ used in the Whittaker model.

#thm([Proposition 10.6.])[
  #emph[For the deep level chosen in Proposition 51, Expression (10.8) is naturally isomorphic to 
#[#set math.equation(numbering: n => "(10.9)")
 $ "Per"_(G \, T)^(upright("lv")) \( K star.op M \) \[ - 2 delta \] . $ <eq:T8>]

 The isomorphism respects parameter operations, increases of finite bounds, and deeper-level comparisons.]
] <loc:averaging>

#proof[
  We first recover $mu^(!) R_T \( F \)$ on $Z$, for any family $F$ of bundle D-modules, by finite-loop averaging. We then pair this formula with $K$ and exchange the two integrations; the dimensions of the unipotent presentation give the period shift.
  Let $L_l subset L N_T$ be the compact subgroup allowing pole order $l "ht" \( alpha \)$ times the marking divisor in each root direction $alpha$. The divisor counts repeated marks. For fixed $l$ and $Z$, a sufficiently deep normal congruence $J subset L_l$ makes the action, determinant, and character formulas factor through a finite-dimensional quotient. Normalized star averaging evaluated at $g$ integrates the bundle pull at $n g$ against $"Exp" \( - chi \( n \) \)$ over that quotient, with shift minus twice its relative dimension. Passing to a deeper quotient leaves the result unchanged by unipotent de Rham acyclicity. The $N$-equivariance of $R_T \( F \)$ and its counit to the bundle pull give a natural comparison from $mu^(!) R_T \( F \)$ to this averaging expression.
  We show that the comparison is an isomorphism for sufficiently large $l$. Stratify $Z$ first by coincidences and then by semi-infinite orbit type. Only finitely many types occur: the Plücker orders are bounded above and below by the lattice bounds in a finite collection of representations. On each stratum, divide the Plücker maps by their prescribed zero orders. This produces the genuine Borel extension with its Cartan lattices. Choose unipotent frames on the disks and compare to the punctured trivialization. Locally on the parameter stratum the result has the form $n_0 t^lambda$, with $lambda$ not assumed dominant. These representatives have bounded Laurent poles; a finite cover of the bounded strata gives a common allowance $l$. The calculation ignores nilpotent structure only when forming the stratification; the comparison of D-modules is pulled by $!$ base change, so it applies with arbitrary parameter coefficients.
  The stabilizer of $t^lambda$ is
  $ J_lambda = t^lambda H_(N \, T)^0 t^(- lambda) subset.eq L_l $
  for sufficiently large $l$. Here the superscript $0$ means zero level divisor, hence full arcs. The residual integration along its finite unipotent quotient is zero unless $chi \|_(J_lambda) = 0$: the de Rham cohomology of a nontrivial exponential on an additive root quotient vanishes. Testing the simple roots shows that this condition is exactly dominance of $lambda$. The determinant on the stabilizer has its canonical splitting.
  For dominant $lambda$, the quotient $L_l \/ J_lambda$ presents the genuine bundle data with Cartan bundle $T_lambda = T_0 \( - sum_y lambda_y y \)$, modulo a smooth finite-dimensional unipotent group. To see this in families, enlarge the root lattices at the markings to those defining $L_l$, leaving the group unchanged on their complement. On each locally closed parameter stratum $S_D$, choose $l$ so that $R^1 pi_(*)$ vanishes for every enlarged root line, where $pi : X times S_D arrow.r S_D$. Then their $pi_(*)$ are locally free and commute with base change. Successive vector extensions show that the enlarged group bundles are locally trivial in families; their trivializations form a torsor for the unipotent group of global sections. Recovering the original lattice is exactly the quotient $L_l \/ J_lambda$. The residue convention makes the exponential descend to this presentation.
  Enlarge $l$ once more so that the chosen $n_0$ lies in $L_l$. Pulling this presentation to the stratum identifies normalized averaging with the conjugated pull after star image along the stratum map $q_D$ in (4.1). Indeed, $!$ base change gives that correspondence; integration along its smooth unipotent presentation fibers, together with the averaging normalization, gives precisely $\[ - 2 dim_(upright("rel")) q_D \]$. The averaging correspondence and the Whittaker stratum projector in (4.1) are thus $!$-base changes of the same relative quotient presentation. Their counits induce the identity of that projector, with the displayed dimension shift. This proves the comparison for arbitrary coefficient D-modules on $S_D$. The strata are finite, so their $!$ restrictions prove the assertion on $Z$. Increasing $l$ uses the same averaging projection and trace, hence gives the same map.
  Apply this calculation inside (10.8). The level choice allows us to project the averaging variable to $L_l \/ H_(N \, T)^(upright("lv"))$. Its element represents a point of $B_N^(upright("lv"))$, and the product $n g$ is precisely the level modification in (10.6). The line and phase descend with this map. Integration over the unipotent difference changes the normalization to $\[ - 2 e_l \]$, where
  $ e_l = dim \( L_l \/ H_(N \, T)^(upright("lv")) \) . $
  By the preceding enlarged-root argument, this quotient presents $B_N^(upright("lv"))$ modulo the unipotent group of global sections of the enlarged bundle. If that group has dimension $f_l$, then $delta = e_l - f_l$. Integration over its presentation fibers changes $\[ - 2 e_l \]$ to $\[ - 2 e_l + 2 f_l \] = \[ - 2 delta \]$. The descended character is $"Exp" \( - psi_0 \)$, and the determinant splittings agree by multiplicativity along the root filtration. The remaining integration against $K$ is exactly (10.6), proving (10.9).
  All shifts here follow the fixed smooth/left convention: integrating a dualizing pull over an affine-space fiber of dimension $e$ contributes $\[ 2 e \]$. Every calculation takes place at finite bounds and finite congruence quotients, and the comparison maps are the normalized pull, trace, and base-change maps. Their compatibility under refinement proves the asserted naturality. ◻
]

== 11 The unipotent period map <sec:unipotent>

We construct a map from semi-infinite cohomology to the period of localization. Its underlying map is the inclusion of constant functions on a framed bundle space. The main point is to identify the complexes on both sides with their correct determinant lines, and to make this map compatible with changing the marked divisor and its formal lift. The character-twisted period construction of [2] Section 12.5.17 and Theorem 12.5.18, and its extension to reductive-group inputs in [2] Theorem 12.8.8, provide the corresponding Ran comparison. Here we construct the map before Ran integration, retaining the relative and level compatibilities needed for the family comparison.

=== 11.1 The normalization and the statement <the-normalization-and-the-statement>

Keep the marked divisor $E$, the chosen level divisor, and the Harish–Chandra categories of Section 10. Write $h_E^0$ for the full $N_0$ arc Lie lattice and $h = h_E^(upright("lv"))$ for its level sublattice. On either the $N$ or the $G$ input category, define

$ B_E^0 \( M \) = C^(oo \/ 2 \, h_E^0) #scale(x: 120%, y: 120%)[\(] "Lie" L N_E \, M ⊗ k_(- chi) #scale(x: 120%, y: 120%)[\)] \, #h(2em) B_E^(upright("lv")) \( M \) = C^(oo \/ 2 \, h) #scale(x: 120%, y: 120%)[\(] "Lie" L N_E \, M ⊗ k_(- chi) #scale(x: 120%, y: 120%)[\)] . $

These are the continuous extensions of the compact-object calculations in (8.3); additional structures are forgotten. As in Section 7, after applying the forgetful functor $b$, we write the underlying relative formulas over the smooth affine parameter scheme $S$ without angle brackets. Their crystalline versions on parameter schemes use the angle-bracket convention. The full-arc formula $B_E^0$ has the latter interpretation directly; the level formula requires the following relative determinant normalization.

Put

$ m = "rank" \( h_E^0 \/ h \) \, #h(2em) l^(upright("lv")) = det R Gamma \( X \, frak(n)^(upright("lv")) \) \, #h(2em) delta = - chi \( X \, frak(n)^(upright("lv")) \) . $

The exact sequence for the level divisor, together with change of semi-infinite lattice, gives

#[#set math.equation(numbering: n => "(11.1)")
 $ delta & = delta_N + m \,\
l^(upright("lv")) & = l_N ⊗ det \( h_E^0 \/ h \)^(- 1) \,\
B_E^(upright("lv")) & = B_E^0 ⊗ det \( h_E^0 \/ h \) \[ m \] . $ <eq:T9>]

These identities also hold for intermediate tuples: the quotient $h_E^0 \/ h$ depends only on the level divisor.

#thm([Proposition 11.1.])[
  (Period map).  #emph[For the $N$ Harish–Chandra category there is a natural continuous map 
#[#set math.equation(numbering: n => "(11.2)")
 $ l^(upright("lv")) \[ delta \] ⊗ B_E^(upright("lv")) arrow.r "Per"_(N \, E)^(upright("lv")) . $ <eq:T10>]

 After shifting by $\[ - 2 delta \]$, its source identifies canonically with $l_N \[ - delta_N \] ⊗ B_E^0$. In this normalization the map is a map of crystalline operations, compatible with the parameter base changes, lift comparisons, and deeper-level comparisons of Section 10.]
] <prop:unipotent-period>

We first construct the map on bounded ordinary modules over an affine base. Finite-dimensional localization will identify its target with semi-infinite cohomology having an extra function-space coefficient. We then construct the same comparison on the compact presentations of the renormalized categories. This second construction proves the derived base-change assertion without an exactness assertion for invariants under a fixed congruence subgroup.

=== 11.2 A finite presentation of the bundle space <a-finite-presentation-of-the-bundle-space>

Abbreviate the bundle stack $B_N^(upright("lv"))$ to $B_N$, and let $tilde(B)_N$ denote its space of full frames along $E$. Framed replacement gives it a right $N$-loop action. Specifying the full frame already specifies the level structure, so $tilde(B)_N$ is independent of level: it is also the space of ordinary $N_0$-bundles with frames on these disks.

Use the height lattices $L_l$ from the proof of (10.9), now along $E$. Enlarge $l$ until the first cohomology of every enlarged root line vanishes, relatively over the affine base. Set

$ H = H_(N \, E)^(upright("lv")) \, #h(2em) A_l = "Lie" L_l . $

Let $K_l$ be the group of global sections of the enlarged unipotent group scheme and put $k_l = "Lie" K_l$. It is a smooth finite-dimensional unipotent group over the base.

#thm([Lemma 11.2.])[
  #emph[Disk gluing identifies 
#[#set math.equation(numbering: n => "(11.3)")
 $ B_N = \[ K_l without L_l \/ H \] \, #h(2em) tilde(B)_N = K_l without L_l . $ <eq:T11>]

 For $e_l = "rank" \( A_l \/ h \)$ and $f_l = "rank" k_l$, one has 
#[#set math.equation(numbering: n => "(11.4)")
 $ delta = e_l - f_l \, #h(2em) l^(upright("lv")) = det \( k_l \) ⊗ det \( A_l \/ h \)^(- 1) . $ <eq:T12>]

 The character $chi$ on the presentation induces the function $psi_0$ on $B_N$.]
] <lem:unipotent-presentation>

#proof[
  Filter the enlarged group by root height. Each successive quotient is a vector group whose underlying vector bundle has vanishing $H^1$. Its torsors on $X$ therefore become trivial over an affine chart of the parameter base. Induction along this filtration trivializes every enlarged-group torsor; two trivializations differ by $K_l$. Recovering the original bundle amounts to choosing its lattice at $E$, which gives the double quotient in (11.3). With full frames the right quotient by $H$ is omitted.
  The inclusion of global sections into sufficiently long jets is fiberwise injective. After increasing the jet order on the chosen base chart, it realizes $K_l$ as a closed smooth subgroup of a finite quotient of $L_l$. Exponential coordinates compatible with root height identify the successive quotient maps with affine-space torsors. Thus the quotients occurring here have smooth relative scheme presentations. Enlarging $l$ recovers the same framed space with its right action.
  For each root bundle the meromorphic-lattice sequence represents $R Gamma \( X \, frak(n)^(upright("lv")) \)$ by global sections of the enlarged bundle mapping to its quotient lattice at $E$. Taking the successive root-height pieces gives the two-term determinant calculation
  $ det R Gamma \( X \, frak(n)^(upright("lv")) \) = det \( k_l \) ⊗ det \( A_l \/ h \)^(- 1) . $
  Its Euler characteristic is $f_l - e_l$, proving both assertions in (11.4). Finally, the residue calculation of (4.1) identifies the character on this presentation with $psi_0$. ◻
]

The construction of Lemma 54 uses the root-height filtration and the underlying root bundles. Consequently it also applies to the family with bracket $t \[ - \, - \]$: the same $H^1$-vanishing bounds and jet orders work over the auxiliary affine line. These geometric presentations and their untwisted structure maps are equivariant for root height and for the simultaneous scaling $t mapsto c t$, $x mapsto c^(- 1) x$ in exponential coordinates. Under the latter scaling the character has weight $- 1$. The equivariance just stated will be used for the untwisted degeneration in Section 12.

=== 11.3 Localization at a finite quotient <localization-at-a-finite-quotient>

Choose a sufficiently deep normal congruence subgroup $J subset L_l$ contained in $H$, with $K_l$ still embedded in $L_l \/ J$. Such subgroups are obtained by truncating the enlarged height coordinates along the divisor. For finitely many lattices we use a common subgroup normal in all of them. Bars denote the finite quotients; in particular,

$ macron(Z) = K_l without macron(L)_l \, #h(2em) B_N = \[ macron(Z) \/ macron(H) \] . $

For an ordinary smooth module $M$, let $M \[ J \]$ be the submodule killed by $"Lie" J$. Normality makes it an $\( A_l \, H \)$-module, and the $M \[ J \]$ exhaust $M$. Initially, for a bounded complex, apply this construction termwise.

The finite-action localization of $M \[ J \]$ is the object $cal(V)_l \( M \[ J \] \)$ descending from the left-module formula

#[#set math.equation(numbering: n => "(11.5)")
 $ cal(D)_(macron(Z)) ⊗_(U \( macron(A)_l \))^L M \[ J \] . $ <eq:T13>]

The operator map uses infinitesimal right translations on $macron(Z)$; Harish–Chandra equivariance supplies descent along $macron(H)$. This is the transitive action-algebroid localization of (10.2).

If $J' subset J$, the map $macron(Z)' arrow.r macron(Z)$ is a torsor under $J \/ J'$. The new action algebroid is the inverse image of the old one: the added Lie quotient is exactly the relative tangent of this torsor. Inflation of the module is therefore pullback as an action-algebroid module, and (11.5) pulls back to the formula for $J'$. For $l lt.eq l'$, choose a common $J$ and use the inclusion of the action algebroids on the common presentation of the framed space. These maps supply the transition maps in both indices.

Taking the colimit first over $J$ and then over $l$ gives $"Loc"_(N \, E)^(upright("lv")) \( M \)$. To check the claim, pull to a chart with a full frame. Formula (11.5) there is the vector/Lie-pair formula for framed changes with Laurent component in $A_l$. Replacing a frame modulo $J$ by a full frame only supplies the components in $"Lie" J$. These components are uniquely determined because $J$ acts freely, and they act trivially on $M \[ J \]$. The stabilizer Lie kernel thus projects isomorphically to the kernel in the finite action-algebroid calculation. Increasing $l$ exhausts the out-current kernel in (10.2).

This also explains why the construction is valid on bounded derived inputs. For a fixed $l$ the kernel on a framed chart has finite rank $f_l$. Its Chevalley complex commutes with the exhaustive colimit of the termwise modules $M \[ J \]$. The resulting bounded-input calculation is therefore the ordinary derived Chevalley calculation with coefficients in $M$. Exactness of the operation $M mapsto M \[ J \]$ at an individual $J$ is not needed. The comparison to (10.2) is the colimit of the corresponding maps on out-current chains.

=== 11.4 The determinant and cohomological shift <the-determinant-and-cohomological-shift>

We now calculate the period of (11.5). This is the step which determines both the normalization of the map and its direction.

#thm([Lemma 11.3.])[
  #emph[After applying $b$, the finite-action localization satisfies 
#[#set math.equation(numbering: n => "(11.6)")
 $ & \( q_N^(upright("lv")) \)_(*) #scale(x: 120%, y: 120%)[\(] "Exp" \( - psi_0 \) ⊗^(!) cal(V)_l \( M \[ J \] \) #scale(x: 120%, y: 120%)[\)]\
 & quad tilde.eq l^(upright("lv")) \[ delta \] ⊗ C^bullet #h(-0.16667em) (macron(A)_l \, M \[ J \] ⊗ cal(O) \( macron(Z) \)_(- chi)) ⊗ det \( A_l \/ h \) \[ e_l \] . $ <eq:T14>]

 Functions carry the derivative action of the right translations; the subscript $- chi$ adds the indicated Lie character. The isomorphism is natural for congruence refinement and for enlargement of the height lattice.]
] <lem:unipotent-finite-period>

#proof[
  Let $z = dim \( macron(Z) \/ S \)$ and $a = "rank" macron(A)_l$. Compute ordinary relative left de Rham cohomology on $macron(Z)$ and then shift by $\[ 2 delta \]$. Smooth pullback along the $macron(H)$-presentation and unipotent de Rham acyclicity identify this with the stated stack period. Ordinary left de Rham cohomology uses right tensor with $Omega_(macron(Z))^(upright("top"))$, with the exponential twist, and shift $\[ - z \]$. Since $macron(Z)$ is affine, (11.5) thus gives Lie chains over $U \( macron(A)_l \)$ with this right coefficient module.
  Use the invariant volume line $det \( macron(A)_l \/ k_l \)^(- 1)$. Converting right Lie derivatives on functions times volume to left derivatives produces the character $- chi$. The groups are unipotent, so their determinant actions have no modular character. Finite-dimensional Lie Poincaré duality converts chains to cochains, contributing $det \( macron(A)_l \) \[ a \]$. The resulting line is
  $ det \( macron(A)_l \/ k_l \)^(- 1) ⊗ det \( macron(A)_l \) = det \( k_l \) = l^(upright("lv")) ⊗ det \( A_l \/ h \) . $
  Because $z = a - f_l$ and $delta = e_l - f_l$, the resulting shift is
  $ 2 delta - z + a = 2 delta + f_l = delta + e_l . $
  This proves the line and shift in (11.6).
  It remains to identify the transition maps under this conversion. For height enlargement the map before Poincaré duality is the inclusion of Lie chains. Afterwards it is the cochain inclusion followed by wedging to top degree in the added lattice, with the relative determinant and shift displayed in (11.6). On a common finite presentation, the determinant comparisons follow from the exact sequences for the tangent spaces. Equivalently, the meromorphic-lattice sequences and the vanishing of the enlarged root-bundle $H^1$ identify $A_(l') \/ A_l$ with $k_(l') \/ k_l$ in these determinant comparisons. We always use graded determinant lines, so the wedge maps include the signs of the graded Poincaré conversion.
  For congruence refinement the map is inflation of cochains together with pullback of functions. One can see this directly from the Spencer calculation. If $A$ is a transitive action algebroid on a smooth scheme and $I = ker \( A arrow.r T \)$, its sheaf form is
  #[#set math.equation(numbering: n => "(11.7)")
   $ "DR"^(upright("ord")) #scale(x: 120%, y: 120%)[\(] cal(D) ⊗_(U \( A \))^L R #scale(x: 120%, y: 120%)[\)] tilde.eq C^bullet \( A \, R ⊗ det I \) \[ "rank" I \] . $ <eq:unipotent-spencer>]
  Here $det I$ carries adjoint transport. Right tensor with top forms gives Spencer chains; the identity $det A ⊗ Omega^(upright("top")) = det I$ then gives (11.7). The Lie derivative on the two determinant factors is exactly adjoint transport on $det I$. For smooth inverse image of the algebroid, the relative tangent contributes ordinary smooth de Rham pullback. Locally in smooth coordinates this is the product Spencer formula, with ordinary pullback of forms in the new coordinates. The Spencer transfer map is canonical, so these local descriptions glue. Applying it to $macron(Z)' arrow.r macron(Z)$ proves the asserted inflation formula. The same argument applies to derived coefficient modules: the bimodule and Spencer resolutions use locally free tangent and Lie sheaves, and their maps are defined before derived tensor. ◻
]

=== 11.5 The period on bounded inputs and the constant-function map <the-period-on-bounded-inputs-and-the-constant-function-map>

After applying $b$, let $M$ be a bounded ordinary Harish–Chandra complex over the fixed affine parameter scheme $S$. Take the double colimit in (11.6). For fixed $l$, refinement of $J$ gives continuous cochains for the compact Lie algebra $A_l$, using its discrete dual. Height enlargement gives the semi-infinite wedge relative to $h$: compact modes contribute cochains, while modes added outside $h$ contribute the determinant conversion of chains. This identifies the bounded ordinary period calculation as

#[#set math.equation(numbering: n => "(11.8)")
 $ "Per"_(N \, E)^(upright("lv")) \( M \) & tilde.eq l^(upright("lv")) \[ delta \] ⊗ \
 & quad C^(oo \/ 2 \, h) #h(-0.16667em) ("Lie" L N_E \, M ⊗ cal(O) \( tilde(B)_N \) ⊗ k_(- chi)) . $ <eq:unipotent-coefficient-period>]

Here the functions on the full framed space are the colimit of the functions on its finite congruence presentations.

This identification includes the differentials. Choose a height-compatible topological basis of root modes. The finite Chevalley differentials have their usual action and bracket terms. Congruence inflation is a map of complexes because the congruence Lie algebras are ideals in $A_l$. For height enlargement, the terms outside the old lattice vanish after wedging to top degree: the old lattice is a subalgebra, and its trace on the intervening quotient is zero. Indeed brackets strictly raise root height, so all the normal-ordering trace terms vanish, including those on lattice quotients. The differential in the colimit is therefore the normal-ordered semi-infinite differential. For bounded complexes the ordinary totalization is quasi-isomorphism invariant, since the coefficient-complex direction is bounded.

The inclusion

$ cal(O)_S arrow.r cal(O) \( tilde(B)_N \) $

of constant functions is equivariant for the loop action. Applying semi-infinite cohomology gives (11.2) on bounded ordinary inputs. We have thus constructed the map and checked its line, shift, and congruence transitions. To obtain the assertion for families, we must still verify that the construction descends through the derived presentations and is independent of the formal lift.

=== 11.6 Derived base change and lift comparisons <derived-base-change-and-lift-comparisons>

We extend this bounded-input comparison and its constant-function map to the renormalized category, and then verify its crystalline compatibilities. For fixed $l$, use the renormalized Harish–Chandra category of $\( A_l \, H \)$ as the colimit of its finite-quotient presentations, as in the compact-Lie calculation in the proof of Proposition 33. Operations on arbitrary unbounded inputs will be defined through this categorical colimit and continuous extension; the termwise $M \[ J \]$ exhaustion above is used only to identify the bounded ordinary calculation. On a fixed finite quotient, construct (11.5) and (11.6) with derived tensor and the Spencer resolution. On the cochain side allow all further congruence refinements, with the pulled function spaces. Lemma 55 shows that this computes the same period. Also form the continuous cochain calculation without the function space, again as a colimit over further refinements. The latter transition maps need not be isomorphisms. Constants give a natural transformation from this second calculation to the first.

Every operation just described commutes with the relevant derived base extensions on compact presentations. At a finite quotient, the Chevalley and Spencer resolutions have relatively flat terms; the unipotent-equivariant descent calculations have the same property. Thus the assertions follow from derived tensor and then colimit. In the parameter diagrams one uses finite-Tor-dimension changes between smooth bases, and flat lift changes on infinitesimal neighborhoods. This construction does not assert that a fixed ordinary invariant submodule $M \[ J \]$ commutes with a nonflat base change.

Compatibility with changing $l$ holds at the same derived level. For two lattices, compute on a finite quotient of a common larger lattice and choose a common normal $J$. Restriction to the smaller Lie algebra is ordinary derived restriction followed by the finite-quotient operation. It commutes with base extension even when its value is not compact. For example, restriction of a free inducing generator has a PBW filtration for the finite-rank difference of the lattices. Each term is a module over the smaller Lie algebra, and their exhaustion computes the restriction and commutes with base extension. Equivalently, this is restriction for the induction monads. The algebroid inclusion and the top-wedge maps of Lemma 55 are defined on this common finite quotient and therefore remain compatible after colimit.

Restriction from the original loop Harish–Chandra category to $\( A_l \, H \)$ is likewise restriction of induction-monad modules. The equivariance category is the same on both sides, so the monadic calculation of Proposition 31 makes this restriction continuous and $t$-exact after applying $b$. Its agreement with the bounded construction can be checked on an inducing generator. If $W$ is its locally free inducing representation, then

$ "Ind"_h^("Lie" L N_E) W = "colim"_(l' gt.eq l) "Ind"_h^(A_(l')) W . $

For a fixed $l'$, take $J$ normal also in $L_(l')$ and sufficiently deep for $W$. The resulting PBW-flat module factors through the finite Lie quotient. It yields precisely the colimit and constant-function map constructed above.

We now identify the natural transformations in these comparisons. Each finite presentation maps naturally to the bounded calculation by inflation and ordinary comparison; for localization this is the action-algebroid map after pullback to full-frame charts. On bounded inputs in the loop category, comparison with the continuous calculation is obtained by evaluating these maps on maps from compact objects, using the fully faithful bounded comparison of Proposition 31. The displayed exhaustion proves that these comparison maps are isomorphisms on inducing generators, hence on their thick closure. Finally, the comparisons with (10.2) and (8.3) are Lie-algebroid inclusions and the same wedge identifications. Their terms on the inducing generators are locally free or filtered unions of flat modules. They therefore commute with the derived base changes in question.

It remains to compare lifts. The full-frame presentation (11.3) uses the absolute formal curves and is independent of the lift. For two lifts, compare cofinal height lattices: a pole bound coming from either lift is contained in a sufficiently large bound coming from the other. Relative divisor thickenings give smooth lattice differences, including in the nilpotent comparison diagrams. With these common enlargements, the presentation by $K_l$ and the congruence refinements apply on both sides. All comparison maps are the inflation and top-wedge maps already proved compatible in Lemma 55.

For a change between nonzero levels, choose $J$ sufficiently deep for both. The same $macron(Z)$ and $macron(A)_l$ then calculate the two periods; only the quotient by the level group changes. Smooth pullback, with normalization $\[ - 2 delta \]$, identifies their ordinary de Rham calculations on $macron(Z)$. On the semi-infinite side, (11.1) is exactly the change of lattice. The determinant and dimension formulas (11.4) identify the two normalizations. These comparisons are transitive, including when a common deeper level is needed. We obtain a map of crystalline operations. Continuous extension from compacts completes the proof of Proposition 53.

=== 11.7 Restriction from the reductive group <restriction-from-the-reductive-group>

To apply the period map to a $G$ input, one must compare the continuous $N$ calculation after restriction with the bounded BRST calculation used to define the $G$ operation. This comparison is needed because restriction need not preserve compact objects.

#thm([Lemma 11.4.])[
  #emph[With the restriction functor of Section 10, there is a natural isomorphism of continuous operations 
#[#set math.equation(numbering: n => "(11.9)")
 $ B_E^0 compose "Res" tilde.eq B_E^0 \, $ <eq:T15>]

 where the right side denotes the operation on the $G$ input category. Consequently (11.2) also gives the period map for $G$ inputs, with the same parameter and level compatibilities.]
] <lem:unipotent-restriction>

#proof[
  On compact $G$ inputs, restriction is computed by bounded ordinary modules. On a bounded $N$ module there is a natural comparison from the continuously extended $B_E^0$ to the bounded BRST formula: evaluate the latter on maps from compacts and use the fully faithful bounded comparison of Proposition 31. This map is the identity on compact $N$ inputs.
  For restriction of an inducing $G$ generator, use the outside-mode PBW filtration (10.4). Each graded term is induced from a representation exhausted in heart degrees by finite representations. Bounded BRST complexes commute termwise with these filtered colimits in a bounded range of coefficient degrees. For derived filtered diagrams in the same range, finite truncation triangles reduce this assertion to the assertion in the heart. The comparison therefore computes the exhausted graded terms and then the filtration itself. It is an isomorphism on restricted inducing generators and hence on the thick category of compact $G$ inputs. This proves (11.9), including naturality, by continuous extension.
  Composing (11.2) with the localization comparison (10.5) now gives the asserted $G$ map. The preceding proof also justifies the bounded BRST calculations on inserted exhausted modules used below. It makes no comparison of ordinary and renormalized formulas on arbitrary unbounded complexes. ◻
]

== 12 Integrating the period map over the Ran space <sec:ran>

The period map of Section 11 becomes an isomorphism after allowing additional marked points and integrating over them. This is the remaining ingredient in the pairing identity (10.1). We first prove an incidence calculation for principal parts, then apply it to unipotent cochains and to the PBW filtration for restriction from $G$ to $N$. Throughout, the level divisor is supported on the original tuple $T$. Additional markings carry zero level. When making underlying-complex calculations, we apply the forgetful functor $b$ of Section 7 in the original tuple variables. The added markings retain their relative D-module operations.

For an intermediate tuple $U supset.eq T$, insertion and the map (11.2), or its restriction version (11.9), give

#[#set math.equation(numbering: n => "(12.1)")
 $ l_N \[ - delta_N \] ⊗ integral_(V supset.eq U) B_V^0 #scale(x: 120%, y: 120%)[\(] "ins"_(U \, V) M #scale(x: 120%, y: 120%)[\)] arrow.r "Per"_U^(upright("lv")) \( M \) \[ - 2 delta \] . $ <eq:T16>]

Here the target is identified using propagation (10.3) and the Ran trace. The symbol $"Per"$ denotes the $N$-period for an $N$-input and the $G$-period for a $G$-input. After applying $b$ in the old variables, we may equivalently use the source $l^(upright("lv")) \[ delta \] ⊗ B^(upright("lv"))$ and unshifted periods, by (11.1).

#thm([Proposition 12.1.])[
  #emph[The map (12.1) is an isomorphism for unipotent Harish–Chandra inputs at every intermediate tuple $U supset.eq T$. With $U = T$, it is also an isomorphism for every $G$ Harish–Chandra input whenever the level divisor is a nonzero admissible thickening of the entire tuple $T$. These isomorphisms are continuous, linear over the D-module category of the original parameter scheme, and compatible with insertion, deeper levels, and the parameter comparisons of Sections 10 and 11.]
] <prop:ran-integrated-period>

The base-change convention in this statement is essential. Integration is relative to the old base. After applying $b$, crystal base change computes it by the same Ran colimits and relative de Rham operations in the added marking schemes. The proofs below consequently retain the crystal structures in these added variables.

=== 12.1 Principal parts and incidence <principal-parts-and-incidence>

Let $J_0$ be a vector bundle on the curve over an affine base. For an additional tuple $V$, let $P_V \( J_0 \) = "PP" \( J_0 \, V \)$ be the full relative principal parts: the filtered union over all pole orders, modulo regular sections, pushed from the divisor support. We equip this object with its principal-part crystal in the varying tuple, in the angle-bracket dualizing normalization. On the curve set

$ cal(I)_X \( J_0 \) = #scale(x: 120%, y: 120%)[\(] cal(D)_X ⊗_(cal(O)_X) \( J_0 ⊗ Omega_X^(- 1) \) #scale(x: 120%, y: 120%)[\)]^(chevron.l X chevron.r) . $

All these objects and operations are relative to the affine base. Write $i$ for the closed incidence $z in V$ in the product of the curve with the tuple scheme, and $p_V$ for projection from that product to the tuple scheme.

#thm([Lemma 12.2.])[
  #emph[There is a natural identification 
#[#set math.equation(numbering: n => "(12.2)")
 $ P_V \( J_0 \) tilde.eq p_(V \, *) i_(*) i^(!) #scale(x: 120%, y: 120%)[\(] cal(I)_X \( J_0 \) times.square omega_(upright("tuple")) #scale(x: 120%, y: 120%)[\)] . $ <eq:T17>]

 Under this identification, forgetting supports is the canonical map $P_V \( J_0 \) arrow.r R Gamma \( X \, J_0 \) \[ 1 \]$. For every finite list of vector bundles $J_1 \, dots.h \, J_r$ and every old tuple $U$, these maps induce an isomorphism 
#[#set math.equation(numbering: n => "(12.3)")
 $ integral_(V supset.eq U) ⨂_(j = 1)^r zws^(!) P_V \( J_j \) arrow.r^(med tilde.op med) ⨂_(j = 1)^r R Gamma \( X \, J_j \) \[ 1 \] . $ <eq:T18>]

 The assertion includes $r = 0$, with the tensor units understood, and is compatible with permutations, shifts, and symmetric powers.]
] <lem:ran-principal-parts>

#proof[
  Apply the localization triangle to the complement of the incidence. This complement is the complement of the Cartier marking divisor, with multiplicities allowed. In our pushforward convention the relative-curve de Rham complex of $cal(I)_X \( J_0 \)$ computes $J_0 \[ 1 \]$. Indeed, passing from a left induced module to a right module tensors by $Omega_X$; the factor $Omega_X^(- 1)$ in the definition cancels it, and the angle-bracket normalization supplies the smooth-curve integration shift, exactly as in (11.6). Localizing differential operators gives the same calculation on the open complement. The complex with supports is therefore the principal-part quotient. Its map to the full de Rham complex is the boundary map $P_V \( J_0 \) arrow.r R Gamma \( X \, J_0 \) \[ 1 \]$ of the meromorphic resolution.
  This is an identification of crystals, including across collisions. Under two lifts of a tuple agreeing on reduction, localize the same bundle by the two divisor equations. Their supports agree on reduction, so their localizations agree after passing to all powers of those equations. These cofinal pole systems give the principal-part comparison; in local coordinates it is differentiation in the marking variable with the curve variable fixed. Thus the support calculation gives the specified comparison, rather than an identification only on geometric fibers.
  For $r$ factors, use $r$ curve variables $z_1 \, dots.h \, z_r$ and the incidence conditions $z_j in V$. ! base change and Künneth identify the tensor product in (12.3) with the corresponding product support calculation. No smoothness of the intersections of these incidences is needed: each support operation is defined by its localization triangle. Project this incidence space to $X^r$. Its relative Ran direction consists of finite subsets containing both $U$ and all the specified $z_j$. Universal homological contractibility identifies integration in this direction with the identity, by the Ran trace [17] Theorem 1.6.5, Section 2.5.12, and Corollary 2.5.13. The resulting morphism is precisely the one obtained by forgetting the supports in (12.2), so it is the map displayed in (12.3).
  All operations commute with the finite permutation actions and with shifts. In characteristic zero, symmetric powers are direct summands of tensor powers. The same calculation therefore applies to every symmetric power, and continuity permits their direct sum. ◻
]

=== 12.2 The unipotent calculation <the-unipotent-calculation>

We begin by identifying the period map on induced generators. At a tuple $V$, put $H = H_(N \, V)^(upright("lv"))$ and $h = "Lie" H$. Let $W$ be an inducing representation, and let $"ev"_V : B_N arrow.r B H$ classify the frame torsor $tilde(B)_N arrow.r B_N$. The symbols $B_N$ and $tilde(B)_N$ here include the fixed level data, as in Section 11.

#thm([Lemma 12.3.])[
  #emph[With continuous cochains and the Harish–Chandra convention of (11.5), there are natural identifications 
#[#set math.equation(numbering: n => "(12.4)")
 $ B_V^(upright("lv")) \( "Ind" W \) & tilde.eq C^bullet \( h \, W \) \,\
\( l^(upright("lv")) \)^(- 1) \[ - delta \] ⊗ "Per"_(N \, V)^(upright("lv")) \( "Ind" W \) & tilde.eq C^bullet #scale(x: 120%, y: 120%)[\(] h \, W ⊗ cal(O) \( tilde(B)_N \) #scale(x: 120%, y: 120%)[\)]\
 & tilde.eq R Gamma #scale(x: 120%, y: 120%)[\(] B_N \, "ev"_V^(*) W #scale(x: 120%, y: 120%)[\)] . $ <eq:T19>]

 The map (11.2) becomes the cochain pullback induced by $W arrow.r W ⊗ cal(O) \( tilde(B)_N \)$.]
] <lem:ran-shapiro>

#proof[
  Use the increasing compact Lie lattices $A_l$ from (11.6). For a fixed $l$, a finite stage of $W$, and, when present, a finite stage of functions, choose a sufficiently deep normal quotient $J$ through which the requisite actions factor. Finite-dimensional Lie Shapiro then computes induction to $A_l \/ J$. In cochain form its map inserts the inducing vectors and wedges with the top exterior power of the complementary modes. The latter is exactly the determinant conversion in (11.6). Thus the comparison is the map of Lie chains defining (11.2); with functions included, the projection formula for Lie induction gives the same map. The character $- chi$ restricts to zero on $h$, so it does not change these finite Shapiro computations.
  There are two compatible exhaustions. Deepening $J$ gives cochain inflation, and increasing $A_l$ gives the same complementary top wedge as in the semi-infinite transition maps. Every inducing-module element occurs for some $l$. For any chosen finite representation and function stages, the quotient can then be taken sufficiently deep and normal for all of those data. Taking their filtered colimit proves the first two identifications of (12.4), together with the asserted map. In the function calculation the stages are $overline(Z) = tilde(B)_N \/ J$ from (11.3).
  In characteristic zero, algebraic cohomology of a split unipotent group is computed by its Lie cochains, also relatively over the present base. For completeness, resolve a representation by cofree representations of the form functions tensored with a representation. Their Lie cochain complex is the algebraic de Rham complex of the unipotent group, hence is acyclic in positive degrees; successive vector-group extensions give the relative assertion. Apply this at the finite quotients and then pass to the displayed colimit. Descent for the frame torsor gives the last identification in (12.4).
  These identifications also compute the crystals in the added markings. Across a nilpotent lift comparison, the arcs and the frame torsor use the same formal curves. The finite lattice bounds have common enlargements, and the quotient levels have common refinements, so the preceding cochain maps compare on a cofinal system. Evaluation is the map of those same frame torsors. The resulting comparison is therefore the parameter comparison, not merely the underlying pointwise Shapiro map. ◻
]

Since $H$ is pro-unipotent, the induced trivial representation suffices for the generation test of (7.2). Proposition 57 for $N$ consequently reduces to proving that evaluation induces an isomorphism

#[#set math.equation(numbering: n => "(12.5)")
 $ integral_(V supset.eq U) C^bullet #scale(x: 120%, y: 120%)[\(] "Lie" H_(N \, V)^(upright("lv")) \, cal(O) #scale(x: 120%, y: 120%)[\)] arrow.r R Gamma \( B_N \, cal(O) \) . $ <eq:T20>]

Indeed, the right side in (12.4) is the constant family in the added markings. Propagation (10.3) identifies it with the family from the old tuple, and integration of that ! pull is the identity.

#thm([Lemma 12.4.])[
  #emph[The evaluation map (12.5) is an isomorphism, with its relative parameter comparisons.]
] <lem:ran-unipotent-cohomology>

#proof[
  First suppose that the group is the additive group of a vector bundle $J$ on the curve. Residue duality identifies continuous arc cochains with
  $ "Sym" #scale(x: 120%, y: 120%)[\(] P_V \( J^(*) ⊗ Omega_X \) \[ - 1 \] #scale(x: 120%, y: 120%)[\)] \, $
  where tensor operations use the ! family convention. A two-term perfect complex for $R Gamma \( X \, J \)$ presents the stack of $J$-torsors as a vector stack. Computing its functions by additive-group cochains gives
  $ R Gamma \( B_J \, cal(O) \) tilde.eq "Sym" #scale(x: 120%, y: 120%)[\(] R Gamma \( X \, J \)^(*) \[ - 1 \] #scale(x: 120%, y: 120%)[\)] . $
  Serre duality identifies $R Gamma \( X \, J \)^(*) \[ - 1 \]$ with $R Gamma \( X \, J^(*) ⊗ Omega_X \)$. Thus Lemma 58, applied degree by degree and with the shift $\[ - 1 \]$, identifies these two symmetric algebras after integration.
  It also identifies their actual comparison map. Evaluation at a finite jet is restriction of linear complexes,
  $ R Gamma \( X \, J \) arrow.r Gamma \( X \, J \|_(V_(upright("thick"))) \) . $
  The shifted dual is its map on cochain generators. Serre duality and the lattice/support exact sequence identify this dual map with forgetting supports in (12.2). Passing to all thickened divisors gives the full principal-part map. Over an infinitesimal test on which two tuples agree on reduction, their thickenings are cofinal; the restriction maps and the dual support maps consequently give the same crystal comparison. This checks the derived map before truncating the linear complexes, and proves (12.5) for the vector group.
  We pass from the vector group to $N$ by a deformation whose gradings control specialization. In exponential coordinates replace the bracket on $frak(n)^(upright("lv"))$ by $t \[ - \, - \]$, over $bb(A)_t^1$. The positive root-height decomposition makes this construction global. At $t = 0$ the group is the additive group of $J = frak(n)^(upright("lv"))$, and at $t = 1$ it is the original group. The deformation concerns only the untwisted cochains and functions in (12.5). Both sides and its evaluation map are computed quasi-coherently in $t$, while retaining the relative D-module operations in the added marking schemes.
  These computations commute with specialization. On the source, the continuous Chevalley–Eilenberg complexes use locally free discrete duals and their filtered unions. On the target, use the presentations (11.3), taking the root-lattice enlargement sufficiently large that $H^1$ vanishes in each of the finitely many root pieces. The same choice works over $bb(A)_t^1$, since these underlying vector bundles are unchanged. The height lattices, their global-section subgroups $K_l$, and the deep congruence quotients are invariant under both scalings used below, by their exponential-coordinate definitions. Finite quotient presentations and their cochain computations are flat over the $t$-line. Common deeper quotients compare them with the exhausted presentation. Evaluation uses these very presentations, so its map commutes with specialization as well.
  Here is the bound that makes the special fiber decisive. Give a coordinate, or a linear cochain, belonging to a height-$m$ root piece first weight $m > 0$. Give $t$ first weight zero. A second action is
  $ t mapsto c t \, #h(2em) x mapsto c^(- 1) x quad upright("in exponential coordinates") . $
  It acts by group isomorphisms in the family: scaling the variables by $c^(- 1)$ compensates for scaling the bracket parameter by $c$. Thus a linear coordinate or cochain has second weight $- 1$, and $t$ has second weight $1$. In first weight $n gt.eq 0$, every monomial has at most $n$ such linear factors, and hence has second weight at least $- n$. This bound applies to arc cochains and to the function modules in the finite unipotent presentations. In particular, functions on $K_l without \( L_l \/ J \)$ form a graded submodule of $cal(O) \( L_l \/ J \)$. The bound therefore passes to these quotient function modules, to the cochain complexes computing the quotient stacks, and to their cohomology. At finite stages relative unipotent cohomology may be computed by finite-range Lie cochains, so these are actual graded complexes. The first grading is a direct sum, not a completion.
  All maps in the added marking variables preserve both gradings. Relative de Rham pushforward, followed by the Ran colimits, preserves their direct sums and the lower bound $- n$ in every first weight. Let $Q_n$ be the first-weight-$n$ part of the cone of (12.5) for the family. The vector-group calculation says $Q_n ⊗_(cal(O) \[ t \])^(upright(bold(L))) cal(O) = 0$ at $t = 0$. The associated exact triangle says that multiplication by $t$ is an isomorphism on $Q_n$. On cohomology it would therefore give isomorphisms between successive second weights. A nonzero class could be pulled back repeatedly to weights below $- n$, which is impossible. Hence every $Q_n$ vanishes. Their direct sum is the full cone, so the family map, and in particular its specialization at $t = 1$, is an isomorphism. ◻
]

Together with Lemma 59, this proves Proposition 57 for $N$. The factor $l^(upright("lv")) \[ delta \]$ is constant in the added markings and can be tensored through the calculation. We next compare restriction from $G$ with localization; this supplies the passage to the reductive group.

=== 12.3 Restriction and the two insertion comparisons <restriction-and-the-two-insertion-comparisons>

For $G$, start at $U = T$ with a nonzero level covering the original tuple, as in the congruence calculation of Section 10. Fix any such level. The additional depth required by a finite Grassmannian kernel will enter only when we apply (10.6) below. Combining (10.5), propagation, and trace gives a map

#[#set math.equation(numbering: n => "(12.6)")
 $ integral_(U supset.eq T) "Loc"_(N \, U)^(upright("lv")) #scale(x: 120%, y: 120%)[\(] "Res" "ins"_(G \, T \, U) M #scale(x: 120%, y: 120%)[\)] arrow.r p^(!) "Loc"_(G \, T)^(upright("lv")) \( M \) . $ <eq:T21>]

The reductive comparison fits into the following square. To display its four vertices without repeating the insertion expressions, set

$ I_U = "Res" "ins"_(G \, T \, U) M \, #h(2em) c_N = l_N \[ - delta_N \] \, $

and define

$ sans(B)_2 \( M \) & = c_N ⊗ integral_(T subset.eq U subset.eq V) B_V^0 #scale(x: 120%, y: 120%)[\(] "ins"_(N \, U \, V) I_U #scale(x: 120%, y: 120%)[\)] \,\
sans(B)_1 \( M \) & = c_N ⊗ integral_(T subset.eq V) B_V^0 \( I_V \) \,\
sans(P)_N \( M \) & = integral_(T subset.eq U) "Per"_(N \, U)^(upright("lv")) \( I_U \) \[ - 2 delta \] \,\
sans(P)_G \( M \) & = "Per"_(G \, T)^(upright("lv")) \( M \) \[ - 2 delta \] . $

The level remains on $T$, so $delta$ and $c_N$ are constant in the added markings. The maps form the commutative diagram

(12.7)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$sans(B)_2 \( M \)$])
  content((4.491, 0), [$sans(P)_N \( M \)$])
  content((0, -2.091), [$sans(B)_1 \( M \)$])
  content((4.491, -2.091), [$sans(P)_G \( M \) .$])
  line((0.666, 0), (3.825, 0), mark: (end: ">"))
  content((2.245, -0.2266), [#text(size: 0.73em)[$upright("integrated ") N upright(" case of (12.1)")$]])
  content((2.245, 0.2266), [#text(size: 0.73em)[$tilde.op$]])
  line((0, -0.2725), (0, -1.819), mark: (end: ">"))
  content((-1.238, -1.046), [#text(size: 0.73em)[$upright("insertion comparison")$]])
  line((4.491, -0.2725), (4.491, -1.819), mark: (end: ">"))
  content((5.584, -1.046), [#text(size: 0.73em)[$upright("period of (12.6)")$]])
  line((0.666, -2.091), (3.759, -2.091), mark: (end: ">"))
  content((2.212, -2.318), [#text(size: 0.73em)[$G upright(" case of (12.1)")$]])
})

The top map is already an isomorphism by the unipotent calculation. The right map applies the period operation to (12.6). For the left map, use the natural insertion comparison

$ "ins"_(N \, U \, V) I_U arrow.r I_V $

and the integration counit for forgetting $U$. By (11.1), this is the map (12.9) in the full-arc normalization displayed here. The square commutes because (11.2) is natural, the restriction map (10.5) commutes with propagation (10.3), and the integration traces compose; the $G$-period map uses exactly the resulting restriction map (11.9). We will prove that the right vertical map is an isomorphism using (12.6), and then that the left vertical map is an isomorphism using (12.9). This will prove the bottom map is an isomorphism.

#thm([Lemma 12.5.])[
  #emph[The map (12.6) is an isomorphism.]
] <lem:ran-restriction-localization>

#proof[
  Pull to bundle charts on $B_N$ and apply $b$ in the old tuple variables. ! base change commutes with the indicated integrations. For this isomorphism test we may forget differential operators in the bundle-chart variables, while retaining the D-module operations in the added markings. By pro-unipotence at the initial congruence level and (7.2), it suffices to use the arc-induced generator with trivial inducing representation. At a chart bundle $P$ with unipotent data, filter the calculation (10.2) by total PBW degree, including the Lie-chain factors. The associated graded on the left, before integration, is
  #[#set math.equation(numbering: n => "(12.8)")
   $ "Sym" #h(-0.16667em) ("Cone" #h(-0.16667em) (frak(n)_(P \, upright("out") \, U)^(upright("lv")) arrow.r P_U \( frak(g)_P^(upright("lv")) \))) . $ <eq:T22>]
  On the right the out-current term is $frak(g)_(P \, upright("out") \, U)^(upright("lv"))$ instead. Its cone is $R Gamma \( X \, frak(g)_P^(upright("lv")) \) \[ 1 \]$ by the meromorphic resolution. The comparison is induced by inclusion of out currents.
  To apply integration to this filtration, we check it in the added markings. The bundle $P$ and its level are fixed over these variables. Across nilpotent lifts of the added markings, its disk frames are frames on the same formal curves. Changes of frame belong to the regular level arc group and preserve the PBW filtration by Harish–Chandra equivariance. The out-current and principal-part complexes use these same comparisons. Hence (12.8) is a filtered crystal calculation in the added markings. There is no assertion here that this is a filtration by D-submodules in the bundle-chart variables; those variables have already been forgotten for the isomorphism test.
  Set $J_P = frak(g)_P^(upright("lv")) \/ frak(n)_P^(upright("lv"))$. The smooth root lattices make $0 arrow.r frak(n)_P^(upright("lv")) arrow.r frak(g)_P^(upright("lv")) arrow.r J_P arrow.r 0$ an exact sequence of vector bundles. Affineness of the complement of $U$ and the principal-part sequence give a diagram of exact triangles. Its common first term is $K_P = R Gamma \( X \, frak(n)_P^(upright("lv")) \) \[ 1 \]$; its middle terms are the two cone-generating complexes just described; and its quotient map is
  $ P_U \( J_P \) arrow.r R Gamma \( X \, J_P \) \[ 1 \] . $
  More explicitly, the two rows of the diagram are
  $ K_P & arrow.r & "Cone" \( frak(n)_(P \, upright("out") \, U)^(upright("lv")) arrow.r P_U \( frak(g)_P^(upright("lv")) \) \) & arrow.r & P_U \( J_P \) & arrow.r K_P \[ 1 \] \,\
K_P & arrow.r & R Gamma \( X \, frak(g)_P^(upright("lv")) \) \[ 1 \] & arrow.r & R Gamma \( X \, J_P \) \[ 1 \] & arrow.r K_P \[ 1 \] \, $
  with identity on $K_P$ and the forget-support map on the quotients. For each symmetric degree $r$, the extension filtration has $r + 1$ steps, with pieces given by tensor products of a symmetric power of $K_P$ and a symmetric power of the corresponding quotient. The former is constant in $U$; Lemma 58 identifies the integrated maps on the latter. Thus the comparison is an isomorphism in each symmetric degree. Finite induction through the extension filtration, and then the exhaustive PBW colimit, prove (12.6). ◻
]

Lemma 61, followed by the period operation, proves that the right vertical map in (12.7) is an isomorphism. It remains to prove the same assertion for the left vertical map. By (11.1), we may remove the common invertible normalization and use the level-lattice form of this comparison. Thus we must show that

#[#set math.equation(numbering: n => "(12.9)")
 $ & integral_(T subset.eq U subset.eq V) B_V^(upright("lv")) #scale(x: 120%, y: 120%)[\(] "ins"_(N \, U \, V) "Res" "ins"_(G \, T \, U) M #scale(x: 120%, y: 120%)[\)]\
 & #h(30mm)  arrow.r integral_(T subset.eq V) B_V^(upright("lv")) #scale(x: 120%, y: 120%)[\(] "Res" "ins"_(G \, T \, V) M #scale(x: 120%, y: 120%)[\)] $ <eq:T23>]

is an isomorphism. Both nested integrals use the ordinary relative parameter operations, with ! pulls and their integration counits.

#thm([Lemma 12.6.])[
  #emph[The map (12.9) is an isomorphism.]
] <lem:ran-two-insertions>

#proof[
  Again use the trivially induced generator at the old congruence level. Filter restriction by the number of outside modes as in (10.4). Insertion (9.2), followed by Lemma 59, identifies the map in outside degree $i$ with the integrated map of complexes
  #[#set math.equation(numbering: n => "(12.10)")
   $ C^bullet #h(-0.16667em) (h_V \, "Sym"^i P_U \( frak(g)^(upright("lv")) \/ frak(n)^(upright("lv")) \)) arrow.r C^bullet #h(-0.16667em) (h_V \, "Sym"^i P_V \( frak(g)^(upright("lv")) \/ frak(n)^(upright("lv")) \)) . $ <eq:T24>]
  Here $h_V = "Lie" H_(N \, V)^(upright("lv"))$. The map on the coefficients is the actual principal-part inclusion: in the inserting induction, the intermediate Laurent vectors have poles only on $U$. For a fixed outside degree and finite pole bound the inducing representations in (10.4) are finite stages in heart degree; choose a common sufficiently deep quotient, apply Shapiro there, and pass to the filtered union of these stages. This gives (12.10), including its map. The old level remains fixed, so all these filtrations use the formal-curve comparisons in the added variables already checked for (12.8).
  We reduce (12.10) to tensor products of principal parts by two finite filtrations. First fix $i$. The heights of the root and Cartan pieces of $frak(g) \/ frak(n)$ lie in a finite interval, say $\[ a \, b \]$; a degree-$i$ symmetric monomial has height in $\[ i a \, i b \]$. The arc-unipotent action strictly raises height. The resulting finite filtration, of length at most $i \( b - a \) + 1$, has trivial action on its associated graded. Thus each piece is the tensor product of $C^bullet \( h_V \, cal(O) \)$ with a fixed tensor/symmetry expression in coefficient principal parts.
  Next decompose the plain cochain complex by the positive height grading used in Lemma 60. In first weight $n$, cochain degree is at most $n$, since every linear cochain has positive height at least one. Its cochain-degree filtration is therefore finite. By residue duality each of its terms is a tensor, shift, and alternating summand of the principal parts of the dual root bundles with $Omega_X$. Consequently the comparison on every such term is a comparison between a finite list of principal parts taken at $U$ and at $V$, on the left, and the same list all taken at $V$, on the right.
  For these terms use the incidence proof of (12.3). Both sides project to the same power of the curve. On the left, $U$ must contain $T$ and the curve variables assigned to its list; $V$ must contain $U$ and the remaining variables. Integrating first in the larger tuple and then in the smaller tuple contracts these two Ran directions. On the right, a single tuple $V$ contains $T$ and all the curve variables, and contracts by the same trace. The comparison is the isomorphism between these two contractions: the inclusion of incidences $z in U arrow.r.double z in V$ uses exactly the forget-support maps of (12.2), whose traces compose.
  Finite induction through the cochain-degree and coefficient-height filtrations proves the assertion in each first weight and outside symmetric degree. Take the direct sum of first weights and then the exhaustive outside-mode filtration. Continuity of the cochain, insertion, and integration constructions permits these colimits. This proves (12.9). ◻
]

The two insertion comparisons finish the reductive case of Proposition 57. Every comparison was made in the parameter operations, with common deeper levels on any finite collection of bounds. It follows by continuous extension that the resulting isomorphism has all the compatibilities stated there.

=== 12.4 Normalization and descent from Grassmannian tests <normalization-and-descent-from-grassmannian-tests>

We now complete the proof of Theorem 47. Start with a test $W' = upright(bold(d)) \( K \)$, where $K$ lies in a finite closed Grassmannian bound. Choose the sufficiently deep level required by (10.6). Formula (10.9) expresses the unnormalized pairing as a shifted period. Proposition 57, together with the normalization of localization, cancels $l_N \[ - delta_N \]$ and gives

#[#set math.equation(numbering: n => "(12.11)")
 $ integral_(V supset.eq T) B_V^0 #scale(x: 120%, y: 120%)[\(] "ins"_(T \, V) \( K star.op M \) #scale(x: 120%, y: 120%)[\)] . $ <eq:T25>]

In particular all auxiliary level determinants and dimension shifts have canceled; the semi-infinite lattice remaining in this formula is the full arc lattice $h_V^0$.

The insertion-with-action assertion of (10.6) and the descriptions (7.5) and (8.3) identify (12.11) with the right side of (10.1). More precisely, compare $B^0$ on the Harish–Chandra categories with the Whittaker coinvariant projection after their forgetful maps to $cal(M)$, followed by $"oblv"_W$. After applying $b$, the forgetful maps to $cal(M)^0$ preserve compact objects by the finite relative Chevalley calculation of Proposition 31. Both operations on these compact presentations are the BRST complex (8.3) with lattice $h_V^0$; continuity then gives their agreement on all inputs. Insertion of $upright(bold(d)) \( K \)$ is the closed Grassmannian image from the tests version of (9.2). Thus the comparison is a comparison in parameters, including moving kernels. Every operation used here is the finite-bound pairing followed by continuous extension.

We must still descend the comparison from these tests to all of $d_T$. The construction is compatible as the bounds grow: for any finite set of bounds, take one common sufficiently deep level, and use the pull and period comparisons when deepening further. We have therefore constructed the comparison after precomposition by

$ upright(bold(d)) : D_(cal(L)^(- s)) \( "Gr"_T \) arrow.r d_T . $

Precomposition along this functor is fully faithful on continuous functionals. Indeed, its transpose is the full embedding of the positive-character Whittaker category on the Grassmannian, by (7.3)–(7.4) and the normalization (4.3). After currying, maps between the two pairings are therefore computed fully faithfully after precomposition by $upright(bold(d))$. The isomorphism just constructed, and its inverse, descend uniquely.

For a pairing valued in D-modules on a base, apply the same argument after pairing with the dual of the parameter D-module category. It reduces the claim to continuous Vect-valued pairings, to which the preceding full faithfulness applies. The argument also applies with any list of parameter actions, so the descended isomorphism is parameter-linear and respects the action maps. This proves (10.1) with all of its stated compatibilities.

=== 12.5 The Ran pairing and reversal of levels <the-ran-pairing-and-reversal-of-levels>

To pass to independent marking tuples, write $C = C_(upright("Ran"))$ and $caron(C) = caron(C)_(upright("Ran"))$. In this subsection only, $d = d_(upright("Ran"))$ denotes the tests category, rather than the numerical shifted level. The equivalences (9.4), in particular $C tilde.eq caron(d)$ and $caron(C) tilde.eq d$, extend to Ran by their diagonal comparisons; the categories presented by ! systems also use the colimit by closed-image operations. Integrating normalized localization from tuple schemes gives continuous functors

$ Lambda : C arrow.r A \, #h(2em) caron(Lambda) : caron(C) arrow.r B' . $

Integration here has the stack and sheaf conventions of the earlier parameter operations; on $X^I$ it is ordinary proper de Rham pushforward.

#thm([Proposition 12.7.])[
  #emph[For $M in C$ and $caron(M) in caron(C)$, there is a canonical isomorphism of bilinear forms 
#[#set math.equation(numbering: n => "(12.12)")
 $ chevron.l R_A Lambda \( M \) \, caron(alpha) \( caron(M) \) #scale(x: 120%, y: 120%)[chevron.r] tilde.eq chevron.l R_(B') caron(Lambda) \( caron(M) \) \, alpha \( M \) #scale(x: 120%, y: 120%)[chevron.r] . $ <eq:T26>]

 It is compatible with parameter actions, permutations, and diagonals.]
] <prop:ran-pairing>

#proof[
  Represent the inputs over independent marking schemes. On their product, insert each list into the union and apply (10.1); then integrate over the two original marking schemes. We check that the resulting pairings are precisely the displayed ones.
  For Whittaker coefficients, use (4.3) with the tests extended by closed push from the old pole data, where no extra poles have yet been allowed. ! restriction of the coefficient to these old pole bounds is its old value. This is the closed parameter/pole comparison established in the tests-insertion calculation after (9.2); equivalently, compute (4.1) away from the union of marking points, where the auxiliary correspondences are unchanged. On the localization side use propagation (10.3) with zero level divisor at the additional markings. ! projection formula and base change, followed by de Rham integration, consequently compute the first pairing in (12.12). On the other side of (10.1), the identification (9.5) and the common underlying-complex functor (8.8) give the second one.
  These are maps on the actual marking schemes. Their permutation and diagonal compatibilities were retained in the parameter constructions; the level choices can be deepened to common choices in each comparison diagram. The same argument works for closed pushes in tuple coordinates, using the parameter-linear calculation and the same closed-embedding adjunction maps. These diagrams present the Ran categories and their continuous functors, so the isomorphism descends to Ran as asserted. ◻
]

Finally, the period calculation applies with simultaneous reversal of the characters: take negative character in (7.1)–(7.5) and (10.1) on their original-twist categories, and positive character on their opposite categories. It also applies to any other pair of irrational inverse shifted forms. The proof used no order or positivity condition on those forms.

For negated shifted forms, one must first recompute the affine levels: the affine level is the new shifted form minus the dual Coxeter number. The determinant exponents are then exactly those prescribed in (7.1). One may subsequently transport the comparison by integral powers of the determinant. These tensor identifications respect the formulas: the pole, Grassmannian, and Hecke maps carry their relative determinant; the unipotent bundle and action maps use the filtration trivialization and orbit maps of (4.1); and the two powers cancel in opposite pairings. This is the sign convention used in Section 13.

== 13 The global equivalence and its central data <sec:equivalence>

We now combine the period comparison with the Plancherel identity. The period comparison first produces a functor out of a localization quotient. The two Plancherel identities, one for each group, then provide its two inverses. We finish by describing the compatibility with localization, components, central characters, and central torsors.

=== 13.1 The four localizations <the-four-localizations>

Recall the shifted levels and determinant exponents

$ a = - c \, #h(2em) d = frac(1, r a) \, #h(2em) k_a = a - h^or \, #h(2em) k_d = d - caron(h)^or \, #h(2em) s = - frac(k_a, 2 h^or) \, #h(2em) s' = - frac(k_d, 2 caron(h)^or) . $

Thus the four bundle categories used below are

$ A = D \( L_G^s \) \, & A' = D \( L_G^(- s) \) \,\
B = D \( L_(G^or)^(- s') \) \, & B' = D \( L_(G^or)^(s') \) . $

All contain every component of the corresponding bundle stack. Use the four coefficient functors

$ R : A arrow.r cal(D) \, #h(2em) R' : A' arrow.r cal(D)' \, #h(2em) S : B arrow.r cal(C) \, #h(2em) S' : B' arrow.r cal(C)' . $

The Whittaker twists and characters specifying their targets are

$ upright("category") & upright("group") & upright("determinant exponent") & upright("Whittaker character")\
cal(D) & G & s & +\
cal(D)' & G & - s & -\
cal(C) & G^or & - s' & -\
cal(C)' & G^or & s' & + $

in the notation of (4.1). The opposite-character pairings (4.3) give

$ cal(D)' = cal(D)^or \, #h(2em) cal(C)' = cal(C)^or . $

Here and below these equalities denote the specified equivalences, and $or$ denotes categorical duality.

The Ran form of (9.4) identifies

$ cal(C) tilde.eq "KL"_G \( a \)_("Ran") \, #h(2em) cal(D)' tilde.eq "KL"_(G^or) \( d \)_("Ran") . $

Apply the same comparison to $- a \, - d$, with negative coefficient characters and positive test characters as at the end of Section 12. Its localization exponents differ from the required opposite exponents by one. For example,

$ - frac(- a - h^or, 2 h^or) = - s + 1 . $

Tensor by $L_G^(- 1)$ on this localization side and by the opposite power on its test side; use the corresponding transports for the dual group. This gives

$ cal(C)' tilde.eq "KL"_G \( - a \)_("Ran") \, #h(2em) cal(D) tilde.eq "KL"_(G^or) \( - d \)_("Ran") . $

We use these constructed comparisons throughout. In particular, no additional identification between a Kac-module duality and (4.3) is required.

Let

$ L : cal(C) arrow.r A \, #h(2em) M' : cal(D)' arrow.r B' \, #h(2em) L' : cal(C)' arrow.r A' \, #h(2em) M : cal(D) arrow.r B $

be the four normalized localization functors. They include the integral transports just described. Their normalization is the one used in the period comparison: induced-stack localization in angle brackets, tensored with $l_N^(- 1) \[ delta_N \]$.

#thm([Proposition 13.1.])[
  #emph[Each of $L \, M' \, L' \, M$ is a continuous localization: its right adjoint is fully faithful. Its categorical transpose is therefore fully faithful.]
] <equivalence:localization>

#proof[
  We use the arbitrary-level localization theorem [2] Theorem 13.4.2. For a connected reductive group over a field of characteristic zero, a smooth complete curve, a level $kappa$, and a quasi-compact open $j : U arrow.r.hook "Bun"_H$, this asserts that
  $ j^(*) "Loc"_(H \, kappa) : "KL" \( H \)_(kappa \, "Ran") arrow.r D upright("-") mod_kappa \( U \) $
  is a localization. The target carries the stack twisting associated to that same level. Sections 10.1–10.5 of [2] construct this localization for arbitrary levels; the restriction to the critical level begins in Section 14 of that work.
  Its localization is the Beilinson–Drinfeld localization calculated by the frame coinvariants in (10.2). The arc-equivariant frame identification (7.1) identifies the affine level with the form $- s "Kil"$, or its counterpart for the other three functors. Proposition 10.1.11 of [2] associates the form $- "Kil" = 2 "crit"$ with $d log \( L_H \)$. Consequently $- s "Kil"$ gives $s thin d log \( L_H \)$, exactly the determinant twisting displayed here. Thus the source, the stack twisting, and the localization functor agree with the ones to which the cited theorem applies. Tensoring by a constant invertible line, shifting, and transporting by an integral power of a determinant line are equivalences and preserve the localization property.
  By the irrational-twist boundedness result of Section 2, restriction to a sufficiently large quasi-compact open is an equivalence for each of $A \, A' \, B \, B'$. Since restriction to an open satisfies $j^(*) = j^(!)$, the cited localization assertion therefore gives the assertion on the full bundle categories.
  Finally, for a localization $Q : cal(E) arrow.r cal(F)$, precomposition identifies functors on $cal(F)$ with functors on $cal(E)$ that invert the morphisms inverted by $Q$. It is fully faithful. Restricting to continuous functors with values in $"Vect"$ proves that $Q^or : cal(F)^or arrow.r cal(E)^or$ is fully faithful. This argument uses the ordinary localization property and does not require the right adjoint of $Q$ to preserve colimits. ◻
]

=== 13.2 Construction and the two inverses <construction-and-the-two-inverses>

All categories in the following calculation are dualizable. The period identity (12.12), followed by its application to the negated shifted forms, gives natural isomorphisms

#[#set math.equation(numbering: n => "(13.1)")
 $ R L tilde.eq \( M' \)^or \( S' \)^or \, #h(2em) R' L' tilde.eq M^or S^or . $ <eq:G1>]

These are identities of continuous functors, with the family and insertion compatibilities proved in Section 12.

#thm([Lemma 13.2.])[
  #emph[There are continuous functors $f : A arrow.r \( B' \)^or$ and $f' : A' arrow.r B^or$, with natural isomorphisms 
#[#set math.equation(numbering: n => "(13.2)")
 $ R & tilde.eq \( M' \)^or f \, & #h(2em) \( S' \)^or & tilde.eq f L \,\
R' & tilde.eq M^or f' \, & S^or & tilde.eq f' L' . $ <eq:G2>]

 They are uniquely determined, together with these isomorphisms, by (13.1) and the fully faithful transposes of localization.]
] <equivalence:factorization>

#proof[
  Every object of $A$ is isomorphic to $L \( C \)$ for some $C in cal(C)$. The first identity of (13.1) therefore places every value of $R$ in the essential image of $\( M' \)^or$. Full faithfulness supplies the factorization $R tilde.eq \( M' \)^or f$, including its action on morphisms and all coherence data. The resulting functor is continuous: for a diagram in $A$, the comparison from the colimit of its $f$-images to the $f$-image of its colimit becomes an isomorphism after applying $\( M' \)^or$, because both that embedding and $R$ preserve colimits. Full faithfulness detects the isomorphism. Cancelling the fully faithful embedding in the first identity of (13.1) gives $\( S' \)^or tilde.eq f L$. The second identity gives $f'$ and the other two comparisons by the same argument, with $L' \, R' \, M^or \, S^or$ in place of $L \, R \, \( M' \)^or \, \( S' \)^or$. ◻
]

Let

$ e_A : \( A' \)^or arrow.r^tilde.op A \, #h(2em) e_B : \( B' \)^or arrow.r^tilde.op B $

be the pseudo-identity equivalences of Section 3, with shifts $\[ 2 dim Y_G + 2 delta_N \( G \) \]$ and $\[ 2 dim Y_(G^or) + 2 delta_N \( G^or \) \]$, respectively. They evaluate a functional on the first slot of the shriek diagonal kernel with the indicated shift. The Plancherel identity (5.1) reads

#[#set math.equation(numbering: n => "(13.3)")
 $ e_A \( R' \)^or R tilde.eq "Id"_A \, #h(2em) e_B \( S' \)^or S tilde.eq "Id"_B . $ <eq:G3>]

#proof[
  Define
  #[#set math.equation(numbering: n => "(13.4)")
   $ Phi = e_B f : A arrow.r B . $ <eq:G4>]
  We display the two inverse candidates to keep their domains and the role of the two groups explicit:
  $ Psi_(upright("left")) & = e_A \( f' \)^or M \( M' \)^or e_B^(- 1) : B arrow.r A \,\
Psi_(upright("right")) & = L \( L' \)^or \( f' \)^or : B arrow.r A . $
  Transposing $R' tilde.eq M^or f'$, and using biduality, gives $\( R' \)^or tilde.eq \( f' \)^or M$. The first identity of (13.3) and (13.2) consequently imply
  $ Psi_(upright("left")) Phi tilde.eq e_A \( f' \)^or M \( M' \)^or f tilde.eq "Id"_A . $
  Transposing $S^or tilde.eq f' L'$ gives $S tilde.eq \( L' \)^or \( f' \)^or$. The second identity of (13.3) therefore implies
  $ Phi Psi_(upright("right")) tilde.eq e_B f L \( L' \)^or \( f' \)^or tilde.eq "Id"_B . $
  These two inverses agree, since
  $ Psi_(upright("left")) tilde.eq Psi_(upright("left")) Phi Psi_(upright("right")) tilde.eq Psi_(upright("right")) . $
  Thus $Phi$ is fully faithful and essentially surjective. This uses neither a composite $L^R L$ nor a left adjoint on arbitrary non-holonomic Whittaker tests.
  Finally,
  $ s = frac(c + h^or, 2 h^or) = frac(c - h^or, 2 h^or) + 1 \, #h(2em) - s' = frac(- 1 \/ \( r c \) - caron(h)^or, 2 caron(h)^or) . $
  Tensoring the source category in Theorem 1 by the actual line $L_G$ identifies it with $A$, while $B$ is already the required target. Composing this tensor equivalence with $Phi$ proves the theorem in its stated determinant convention. ◻
]

=== 13.3 Localization, coefficients, and families <localization-coefficients-and-families>

#thm([Theorem 13.3.])[
  #emph[The equivalence $Phi$ has the natural localization and coefficient compatibilities 
(13.5)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$cal(C)$])
  content((2.057, 0), [$A$])
  content((2.057, -1.585), [$B$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$L$]])
  line((0.2108, -0.1625), (1.847, -1.423), mark: (end: ">"))
  content((0.6923, -1.229), [#text(size: 0.73em)[$e_B \( S' \)^or$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((2.332, -0.7927), [#text(size: 0.73em)[$Phi$]])
})
$\[ 1 e x \] R tilde.eq \( M' \)^or e_B^(- 1) Phi .$

 They hold with the full Ran family structures: they commute with collisions, insertion of vacua, disjoint products, and the base operations in the local comparison and period construction. The first compatibility uniquely determines $Phi$, with its specified comparison, on the localization quotient.]
] <equivalence:compatibility>

#proof[
  Both identities follow from (13.2) and the definition of $Phi$. Their maps are obtained by lifting the period pairings through fully faithful embeddings. Such a lift is unique with its comparison, so the family compatibilities of (12.12) lift as well: each coherence diagram becomes the already commuting period diagram after applying the embedding. Finally, precomposition with the localization $L$ is fully faithful on functor categories, which proves the uniqueness assertion. ◻
]

This gives the unramified localization–Whittaker–Poincaré diagram formulation, as in [19] Section 4, with all signs and shifts fixed. For any list of distinct insertion points, the identification (9.4) matches the corresponding KL modules with the dual-group Whittaker modules. On that fixed-point category, the fixed-mark comparison following (5.7) identifies $e_B \( S' \)^or$ with holonomic shriek Poincaré and its continuous extension. It is shriek pushforward from the pole model, or from actual reductions on its strata, with their exponential factors. The description (4.6) determines the functor on the whole fixed-point category. Weyl modules match Whittaker standards with the label lines of (9.4); the zero label supplies the vacuum comparison.

The localization in (13.5) includes $l_N^(- 1) \[ delta_N \]$. With that last normalization removed, its right-hand side is correspondingly tensored by $l_N \[ - delta_N \]$. The KL comparison uses inverse shifted forms. After the frame sign and Cartan shifts in (7.1) and the integral transport above, it becomes the negative-reciprocal relation between the determinant twists in Theorem 1. In particular, the compatibility identifies a functor with specified natural maps, rather than merely identifying the two categories abstractly. Its canonicity is relative to the fixed pinnings, Whittaker characters, orientation normalizations, and theta characteristic.

=== 13.4 Components and central characters <components-and-central-characters>

The actual root data give canonical identifications

$ X^(*) \( Z_G \) tilde.eq pi_1 \( G^or \) \, #h(2em) pi_1 \( G \) tilde.eq X^(*) \( Z_(G^or) \) . $

We use them without passing to a simply connected or adjoint form. Because the adjoint determinant line has trivial central inertia, each bundle category decomposes by a central character and a component.

#thm([Proposition 13.4.])[
  #emph[If a source object has central character $eta in X^(*) \( Z_G \)$ and component $p in pi_1 \( G \)$, its image under $Phi$ has central character $p$ and component $- eta$. Thus, writing character first and component second, 
#[#set math.equation(numbering: n => "(13.6)")
 $ \( eta \, p \) mapsto \( p \, - eta \) . $ <eq:G6>]

]
] <equivalence:sectors>

#proof[
  The KL categories over tuples are graded by total central character. The constant central arcs act using their canonical splitting. The localization frame formulas retain this action: changing a frame on the right by $h$ acts on its section generators by $h$, with the same sign as the infinitesimal formula (7.1). Localization therefore carries the KL central character to bundle central inertia, without inversion.
  In the matched Whittaker cell a label $lambda$ gives Cartan bundle
  $ T_D = T_0 #scale(x: 180%, y: 180%)[\(] - sum_i lambda_i x_i #scale(x: 180%, y: 180%)[\)] . $
  Its component is $- sum_i lambda_i$, since $2 rho$ lies in the coroot lattice. Hence the local comparison sends the total KL central character to the negative bundle component. This verification on cells gives the assertion on all objects: the two decompositions are already defined on the full Grassmannian, and the open and closed shriek restrictions to its strata jointly detect the assertion. Parameter operations preserve both decompositions, so it also holds on the Ran colimit.
  Apply the first identity of (13.5). Poincaré with the shriek diagonal preserves bundle components. A KL input of central character $eta$ therefore gives target component $- eta$. Every source object of character $eta$ is localized from that KL character sector: localization is essentially surjective and preserves the character decomposition, so projecting any preimage to the sector produces a preimage there. This proves the target component assertion.
  For the target character, use $R tilde.eq \( M' \)^or f$. The coefficient functor $R$ preserves the source bundle component $p$. Under the dual-group local comparison, the part of $cal(D)'$ with that component is the KL character sector $- p$. Since $M'$ realizes its character sectors, $f$ sends a source object of component $p$ to a functional on $B'$ supported on central character $- p$. The two factors of the shriek diagonal kernel have opposite central characters, by its simultaneous central inertia and the diagonal splitting of the twist. Evaluation by $e_B$ consequently gives central character $p$ on $B$, as asserted. ◻
]

=== 13.5 Central torsors and transgression <central-torsors-and-transgression>

We spell out the torsor compatibility because it records the global form as a groupoid action, including its automorphisms. Put $Z = Z_G$. For a $Z$-torsor $Q$ on $X$, let $tau_Q$ be central translation on $Y_G$, with contracted-product convention $\[ q z \, x \] = \[ q \, z x \]$. It canonically preserves the twisting: the adjoint bundle of the translated bundle is canonically unchanged. Use the same notation for the corresponding operation for $Z_(G^or)$-torsors on $Y_(G^or)$.

Let $A_(G^or)$ be the finite kernel of $G_(upright("sc"))^or arrow.r G^or$. The root datum gives the perfect finite pairing $Z_G times A_(G^or) arrow.r bb(C)^times$. Use complex orientation and the exponential with $2 pi sqrt(- 1)$ to identify this kernel with the fundamental group. We normalize the lifting obstruction so that its integral over $X$ is the component used in Proposition 67. Equivalently, a local modification with gluing $t^lambda$ has relative obstruction with integral $- lambda$. This is the local lifting obstruction around an oriented circle, with the same degree convention as the Cartan bundle in the preceding proof.

The universal bundle on $X times Y_(G^or)$ has a gerbe of lifts to $G_(upright("sc"))^or$, with obstruction class $"obs"$ in degree two and coefficients in $A_(G^or)$. Form $\[ Q \] union "obs"$, with $Q$ first, use the finite pairing, and integrate over $X$. The resulting class has degree $1 + 2 - 2 = 1$ and defines a rank-one local system $u_Q$ with finite monodromy on $Y_(G^or)$:

$ \[ u_Q \] = integral_X chevron.l \[ Q \] union "obs" #scale(x: 120%, y: 120%)[chevron.r] . $

This construction is performed on the torsor and gerbe themselves, as maps to Eilenberg–MacLane spaces, so it retains isomorphisms, automorphisms, and the coherent tensor law in $Q$. Reversing the two groups gives $u'_(Q')$ on $Y_G$ for a $Z_(G^or)$-torsor $Q'$. Finite-coefficient comparison and Riemann existence realize these systems algebraically on charts; smooth descent gives the systems on the stacks. Associated-line monodromy is $gamma \( z \)$ for transport by $z$ and character $gamma$. Tensor by these systems means dualizing-normalized shriek tensor, or ordinary flat tensor inside angle brackets.

#thm([Theorem 13.5.])[
  #emph[The equivalence $Phi$ has coherent natural isomorphisms 
#[#set math.equation(numbering: n => "(13.7)")
 $ Phi tau_Q^(!) tilde.eq u_Q^(- 1) ⊗ Phi \, #h(2em) tau_(Q')^(!) Phi tilde.eq Phi \( u'_(Q') ⊗ - \) . $ <eq:G7>]

 They are natural on the full groupoids of central torsors and respect their tensor products. They and (13.6) remain valid after the integral determinant transport to the convention of Theorem 1.]
] <equivalence:central>

#proof[
  We first describe two operations before passing to the global localization quotient.
  #emph[Twisting KL inputs.] Over a tuple scheme, restrict $Q$ to the formal neighborhoods of the marked graphs. Trivialize it locally and descend KL inputs by the central arc action. Denote the resulting operation by $V mapsto V \[ Q \]$. The same definition works at collisions. To give precise local trivializations, write $D = sum_i Gamma_i subset X times S$ for the sum of the marked graphs over the tuple scheme $S$. This is finite locally free over $S$, including at collisions. The section scheme
  $ "Res"_(D \/ S) \( Q \|_D \) arrow.r S $
  is $acute(e)$tale and surjective: a geometric fiber admits a section by choosing a lift on each of its clusters, and formal $acute(e)$taleness extends this choice across the nilpotents. This section scheme need not be finite when clusters split. After passing to it, formal $acute(e)$taleness extends the universal section uniquely to each thickening $n D$, and hence to the completed divisor. Two such sections differ by a section of $Z$ on the completed divisor, locally constant on each cluster. Their transitions satisfy the cocycle identity because they are differences of actual torsor sections. For insertion or comparison of tuples, use the sum of their divisors as a common refinement and restrict its sections. Unique extension through thickenings then gives compatibility with the crystal structure, further collisions, and all resulting coherence diagrams.
  On localization charts compare at these chosen lifts of $Q$. The out Lie algebra, its differential operators, and the determinant identifications use the unchanged adjoint bundle. A change of lift by $z$ changes the translated frame by $z$, precisely the central transition used in defining $V \[ Q \]$. Thus the chart coinvariant formulas give
  $ tau_Q^(!) L \( V \) tilde.eq L \( V \[ Q \] \) . $
  The comparison holds on bounded-module formulas and their morphisms, then on their continuous extension; it commutes with insertion and parameter operations. The same argument applies to $M'$ and $Q'$ for the dual group.
  #emph[Transgression on Whittaker inputs.] Pull $u_Q$ to the pole model and tensor there. Its two pullbacks along a Whittaker arrow identify canonically. Indeed the arrow is a unipotent modification, whose gluing lifts uniquely through the simply connected cover by the corresponding root subgroups. Change the local lift by this lifted modification and retain the lift away from the marking. This identifies the lifting gerbes, multiplicatively under composition of arrows. Hence tensor by the transgression system preserves Whittaker equivariance. Projection formula shows that coefficient operations and their counits commute with it.
  For the local comparison $alpha$ of (9.4), the two operations are related by
  #[#set math.equation(numbering: n => "(13.8)")
   $ alpha \( V \[ Q \] \) tilde.eq u_Q^(- 1) ⊗ alpha \( V \) . $ <eq:G8>]
  Here the equality includes all tuple-parameter structures. To check it, use the Grassmannian model. Its bundle is identified away from the markings with $P_0 = theta.alt^(2 rho)$, which has its fixed lift to the simply connected group. The lifting obstruction is therefore relative, supported at the markings. The chosen disk sections of $Q$ trivialize its transgression line: they nullhomotope $\[ Q \]$ near the support of the relative obstruction, hence nullhomotope the integrated cup product. This construction is functorial in the relative lifting gerbe, so the trivialization holds on the entire Grassmannian chart, not just on its labeled cells. On the section cover, therefore, both sides of (13.8) identify with $alpha \( V \)$ for every object $V$, and we use the identity comparison. Changing a section by $z$ on a cluster of total label $lambda$ changes the transgression trivialization by $\( - lambda \) \( z \)$.
  We next check compatibility across collisions. In an analytic chart of any finite Grassmannian bound, extend the chosen disk sections to neighborhoods of the graph unions. Trivialize the cup product using the relative obstruction and this section. Excision makes the trivialization independent of shrinking the neighborhoods. Its change is cup product with the degree-zero change of section followed by integration, hence evaluation of that section change on the cluster degree. That degree is $- lambda$ by the obstruction convention. Neighborhoods and their intersections give these comparisons across collisions; excision and associativity give the comparisons for further clustering. Finite-coefficient comparison transports these finite-system isomorphisms to the algebraic charts, compatibly with pullback.
  On the KL side the same cluster acts through its total central character $lambda$. On the Whittaker side $u_Q^(- 1)$ has transition $lambda \( z \)$, by the calculation just made. The component calculation in the proof of Proposition 67 says that $alpha$ preserves these decompositions. On each finite central-character sector the transition is a scalar natural transformation, so $bb(C)$-linearity identifies the two transitions on all objects and morphisms. For a varying section difference $z$, its distinct values partition the completed divisor into open-and-closed pieces; markings with different values cannot collide. Use the disjoint-product compatibility of $alpha$ between these pieces, and the single central scalar on each piece, including all its internal collisions. The two descent data therefore agree. The pole–Grassmannian comparison transports the identification to the Whittaker categories. It can be checked on underlying Grassmannian objects because Whittaker equivariance defines a full subcategory. This proves (13.8), with its coherent parameter compatibilities. The same construction gives its dual-group counterpart with $u'_(Q')$.
  We now pass to the global functor. Put $P_B = e_B \( S' \)^or$. Tensoring one slot of the opposite-character pairing by a finite local system moves that same tensor to its other slot; coefficients commute with this tensor by the preceding argument. In the shriek diagonal kernel, tensor on one factor also moves to the other factor with the same local system. Consequently
  $ P_B \( u_Q^(- 1) ⊗ C \) tilde.eq u_Q^(- 1) ⊗ P_B \( C \) . $
  Together with (13.5), the KL twisting comparison, and (13.8), this proves $Phi tau_Q^(!) L tilde.eq u_Q^(- 1) ⊗ Phi L$. Precomposition with the localization $L$ is fully faithful on functor categories, so this comparison descends uniquely and gives the first isomorphism of (13.7).
  For the second, apply the dual-group twisting comparison to $R tilde.eq \( M' \)^or f$. Let $F in A$ and $E in cal(D)'$, viewing $E$ as a dual-group KL object through the constructed identification. Write $E \[ Q' \]$ for the transported central-torsor action. The dual-group version of (13.8) gives $u'_(Q') ⊗ E tilde.eq E \[ \( Q' \)^(- 1) \]$. Evaluation on the localized test $M' E$ now gives
  $ f \( u'_(Q') ⊗ F \) \( M' E \) & tilde.eq chevron.l R \( u'_(Q') ⊗ F \) \, E #scale(x: 120%, y: 120%)[chevron.r]\
 & tilde.eq chevron.l R \( F \) \, u'_(Q') ⊗ E #scale(x: 120%, y: 120%)[chevron.r]\
 & tilde.eq chevron.l R \( F \) \, E \[ \( Q' \)^(- 1) \] #scale(x: 120%, y: 120%)[chevron.r]\
 & tilde.eq f \( F \) #scale(x: 120%, y: 120%)[\(] \( tau_(Q')^(- 1) \)^(!) M' E #scale(x: 120%, y: 120%)[\)] . $
  The first equality is (13.2); the second is the coefficient projection formula and the pairing’s tensor symmetry; the third is the dual-group comparison; and the last is the KL localization compatibility with torsor twisting. Since $M'$ is a localization, these evaluations descend to the natural equality
  $ f \( u'_(Q') ⊗ F \) tilde.eq f \( F \) compose \( tau_(Q')^(- 1) \)^(!) . $
  To check the variance after applying $e_B$, let $K_B in B' ⊗ B$ be its shifted shriek diagonal kernel, and put $tau = tau_(Q')$. Simultaneous translation preserves $K_B$, so
  $ \( \( tau^(- 1) \)^(!) ⊗ "Id" \) \( K_B \) tilde.eq \( "Id" ⊗ tau^(!) \) \( K_B \) . $
  For any continuous functional $h$ on $B'$, evaluation of its first factor consequently gives
  $ e_B #scale(x: 120%, y: 120%)[\(] h compose \( tau^(- 1) \)^(!) #scale(x: 120%, y: 120%)[\)] tilde.eq tau^(!) e_B \( h \) . $
  Taking $h = f \( F \)$ proves the second isomorphism.
  All maps used in the construction are maps on torsor groupoids: section descent, the cup product, excision, projection formula, and diagonal invariance preserve their composition and tensor laws. The descended comparisons retain these coherences by full faithfulness. One can also read the two signs directly on torsor automorphisms. An automorphism $z in Z_G$ of the trivial $Q$ acts on a source object of character $eta$ by $eta \( z \)$. Its image has component $- eta$, so $u_Q^(- 1)$ has exactly this automorphism. An automorphism $z' in Z_(G^or)$ of the trivial $Q'$ acts on the target by $p \( z' \)$; on the source component $p$, $u'_(Q')$ has the same automorphism. Thus the full groupoid formulas agree with both parts of (13.6).
  Finally, tensoring by $L_G$ commutes with central translation, including torsor automorphisms, because this determinant is formed from the adjoint bundle. The same is true of central inertia. This proves the last assertion and completes the global unramified correspondence. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Tomoyuki Arakawa and Edward Frenkel, #emph[Quantum Langlands duality of representations of $W$-algebras], Compositio Mathematica #strong[155] (2019), 2235--2262. #link("https://doi.org/10.1112/S0010437X19007553")[doi:10.1112/S0010437X19007553]\; #link("https://arxiv.org/abs/1807.01536v3")[arXiv:1807.01536v3].]
#bibitem([2])[Dmitry Arinkin, Dario Beraldo, Justin Campbell, Lin Chen, Joakim Færgeman, Dennis Gaitsgory, Kevin Lin, Sam Raskin, and Nick Rozenblyum, #emph[Proof of the geometric Langlands conjecture II: Kac--Moody localization and the FLE], 2024. #link("https://arxiv.org/abs/2405.03648v3")[arXiv:2405.03648v3].]
#bibitem([3])[Dmitry Arinkin, Dario Beraldo, Lin Chen, Joakim Færgeman, Dennis Gaitsgory, Kevin Lin, Sam Raskin, and Nick Rozenblyum, #emph[Proof of the geometric Langlands conjecture IV: ambidexterity], 2024. #link("https://arxiv.org/abs/2409.08670v1")[arXiv:2409.08670v1].]
#bibitem([4])[Alexander Beilinson and Vladimir Drinfeld, #emph[Chiral Algebras], American Mathematical Society Colloquium Publications #strong[51], American Mathematical Society, Providence, RI, 2004. #link("https://doi.org/10.1090/coll/051")[doi:10.1090/coll/051].]
#bibitem([5])[Ekaterina Bogdanova, #emph[Non-vanishing of quantum geometric Whittaker coefficients], 2025. #link("https://arxiv.org/abs/2508.19058v1")[arXiv:2508.19058v1].]
#bibitem([6])[Ekaterina Bogdanova, #emph[Quantum Betti geometric Langlands functor], 2026. #link("https://arxiv.org/abs/2606.29585v1")[arXiv:2606.29585v1].]
#bibitem([7])[Alexander Braverman and Dennis Gaitsgory, #emph[Geometric Eisenstein series], Inventiones Mathematicae #strong[150] (2002), 287--384. #link("https://doi.org/10.1007/s00222-002-0237-8")[doi:10.1007/s00222-002-0237-8]\; #link("https://arxiv.org/abs/math/9912097v2")[arXiv:math/9912097v2].]
#bibitem([8])[Justin Campbell, Lin Chen, Joakim Færgeman, Dennis Gaitsgory, Kevin Lin, Sam Raskin, and Nick Rozenblyum, #emph[Proof of the geometric Langlands conjecture III: compatibility with parabolic induction], 2024. #link("https://arxiv.org/abs/2409.07051v1")[arXiv:2409.07051v1].]
#bibitem([9])[Justin Campbell, Gurbir Dhillon, and Sam Raskin, #emph[Fundamental local equivalences in quantum geometric Langlands], Compositio Mathematica #strong[157] (2021), 2699--2732. #link("https://doi.org/10.1112/S0010437X2100765X")[doi:10.1112/S0010437X2100765X]\; #link("https://arxiv.org/abs/1907.03204v2")[arXiv:1907.03204v2].]
#bibitem([10])[Pierre Deligne, #emph[Théorie de Hodge, II], Publications Mathématiques de l'IHÉS #strong[40] (1971), 5--57; #emph[Théorie de Hodge, III], Publications Mathématiques de l'IHÉS #strong[44] (1974), 5--77. #link("https://doi.org/10.1007/BF02684692")[doi:10.1007/BF02684692]\; #link("https://doi.org/10.1007/BF02685881")[doi:10.1007/BF02685881].]
#bibitem([11])[Vladimir Drinfeld and Dennis Gaitsgory, #emph[On some finiteness questions for algebraic stacks], Geometric and Functional Analysis #strong[23] (2013), 149--294. #link("https://doi.org/10.1007/s00039-012-0204-5")[doi:10.1007/s00039-012-0204-5]\; #link("https://arxiv.org/abs/1108.5351v3")[arXiv:1108.5351v3].]
#bibitem([12])[Vladimir Drinfeld and Dennis Gaitsgory, #emph[Compact generation of the category of $D$-modules on the stack of $G$-bundles on a curve], Cambridge Journal of Mathematics #strong[3] (2015), 19--125. #link("https://arxiv.org/abs/1112.2402v8")[arXiv:1112.2402v8].]
#bibitem([13])[Vladimir Drinfeld and Dennis Gaitsgory, #emph[Geometric constant term functor(s)], Selecta Mathematica (N.S.) #strong[22] (2016), 1881--1951. #link("https://doi.org/10.1007/s00029-016-0269-3")[doi:10.1007/s00029-016-0269-3]\; #link("https://arxiv.org/abs/1311.2071v4")[arXiv:1311.2071v4].]
#bibitem([14])[Joakim Færgeman and Sam Raskin, #emph[Non-vanishing of geometric Whittaker coefficients for reductive groups], 2022. #link("https://arxiv.org/abs/2207.02955v1")[arXiv:2207.02955v1].]
#bibitem([15])[Boris Feigin and Edward Frenkel, #emph[Duality in $W$-algebras], International Mathematics Research Notices #strong[1991] (1991), no.~6, 75--82. #link("https://doi.org/10.1155/S1073792891000119")[doi:10.1155/S1073792891000119].]
#bibitem([16])[Edward Frenkel, Dennis Gaitsgory, and Kari Vilonen, #emph[Whittaker patterns in the geometry of moduli spaces of bundles on curves], Annals of Mathematics (2) #strong[153] (2001), 699--748. #link("https://arxiv.org/abs/math/9907133v5")[arXiv:math/9907133v5].]
#bibitem([17])[Dennis Gaitsgory, #emph[Contractibility of the space of rational maps], 2012. #link("https://arxiv.org/abs/1108.1741v3")[arXiv:1108.1741v3].]
#bibitem([18])[Dennis Gaitsgory, #emph[Sheaves of categories and the notion of $1$-affineness], 2014. #link("https://arxiv.org/abs/1306.4304v4")[arXiv:1306.4304v4].]
#bibitem([19])[Dennis Gaitsgory, #emph[Quantum Langlands Correspondence], 2016; notes written in 2007. #link("https://arxiv.org/abs/1601.05279v1")[arXiv:1601.05279v1].]
#bibitem([20])[Dennis Gaitsgory, #emph[A "strange" functional equation for Eisenstein series and miraculous duality on the moduli stack of bundles], Annales Scientifiques de l'École Normale Supérieure (4) #strong[50] (2017), 1123--1162. #link("https://doi.org/10.24033/asens.2641")[doi:10.24033/asens.2641]\; #link("https://arxiv.org/abs/1404.6780v3")[arXiv:1404.6780v3].]
#bibitem([21])[Dennis Gaitsgory, #emph[Twisted Whittaker model and factorizable sheaves], Selecta Mathematica (N.S.) #strong[13] (2008), 617--659. #link("https://doi.org/10.1007/s00029-008-0053-0")[doi:10.1007/s00029-008-0053-0]\; #link("https://arxiv.org/abs/0705.4571v4")[arXiv:0705.4571v4].]
#bibitem([22])[Dennis Gaitsgory, #emph[The local and global versions of the Whittaker category], Pure and Applied Mathematics Quarterly #strong[16] (2020), 775--904. #link("https://arxiv.org/abs/1811.02468v6")[arXiv:1811.02468v6].]
#bibitem([23])[Dennis Gaitsgory, #emph[The semi-infinite intersection cohomology sheaf-II: the Ran space version], 2021. #link("https://arxiv.org/abs/1708.07205v5")[arXiv:1708.07205v5].]
#bibitem([24])[Dennis Gaitsgory and Sam Raskin, #emph[Proof of the geometric Langlands conjecture I: construction of the functor], 2024, revised 2025. #link("https://arxiv.org/abs/2405.03599v3")[arXiv:2405.03599v3].]
#bibitem([25])[Dennis Gaitsgory and Sam Raskin, #emph[Proof of the geometric Langlands conjecture V: the multiplicity one theorem], 2024, revised 2026. #link("https://arxiv.org/abs/2409.09856v3")[arXiv:2409.09856v3].]
#bibitem([26])[Ryoshi Hotta, Kiyoshi Takeuchi, and Toshiyuki Tanisaki, #emph[$D$-Modules, Perverse Sheaves, and Representation Theory], Progress in Mathematics #strong[236], Birkhäuser Boston, 2008. #link("https://doi.org/10.1007/978-0-8176-4523-6")[doi:10.1007/978-0-8176-4523-6].]
#bibitem([27])[Victor G. Kac and Minoru Wakimoto, #emph[Quantum reduction and representation theory of superconformal algebras], Advances in Mathematics #strong[185] (2004), 400--458; corrigendum, #strong[193] (2005), 453--455. #link("https://doi.org/10.1016/j.aim.2003.12.005")[doi:10.1016/j.aim.2003.12.005]\; #link("https://doi.org/10.1016/j.aim.2005.01.001")[corrigendum]\; #link("https://arxiv.org/abs/math-ph/0304011v2")[arXiv:math-ph/0304011v2].]
#bibitem([28])[Anton Kapustin and Edward Witten, #emph[Electric-magnetic duality and the geometric Langlands program], Communications in Number Theory and Physics #strong[1] (2007), 1--236. #link("https://arxiv.org/abs/hep-th/0604151v3")[arXiv:hep-th/0604151v3].]
#bibitem([29])[Masaki Kashiwara and Pierre Schapira, #emph[Sheaves on Manifolds], Grundlehren der mathematischen Wissenschaften #strong[292], Springer-Verlag, Berlin--Heidelberg, 1990. #link("https://doi.org/10.1007/978-3-662-02661-8")[doi:10.1007/978-3-662-02661-8].]
#bibitem([30])[Kevin Lin, #emph[Poincaré series and miraculous duality], 2022. #link("https://arxiv.org/abs/2211.05282v1")[arXiv:2211.05282v1].]
#bibitem([31])[Sam Raskin, #emph[Homological methods in semi-infinite contexts], 2020. #link("https://arxiv.org/abs/2002.01395v1")[arXiv:2002.01395v1].]
#bibitem([32])[Sam Raskin, #emph[$W$-algebras and Whittaker categories], Selecta Mathematica (N.S.) #strong[27] (2021), Article~46. #link("https://doi.org/10.1007/s00029-021-00641-6")[doi:10.1007/s00029-021-00641-6]\; #link("https://www.samraskin.net/whit.pdf")[author's version, updated July 1, 2023] (with published theorem numbering).]
#bibitem([33])[Morihiko Saito, #emph[Mixed Hodge modules], Publications of the Research Institute for Mathematical Sciences #strong[26] (1990), 221--333. #link("https://doi.org/10.2977/PRIMS/1195171082")[doi:10.2977/PRIMS/1195171082].]
#bibitem([34])[Simon Schieder, #emph[Geometric Bernstein asymptotics and the Drinfeld--Lafforgue--Vinberg degeneration for arbitrary reductive groups], 2017. #link("https://arxiv.org/abs/1607.00586v2")[arXiv:1607.00586v2].]
#bibitem([35])[A.~V. Stoyanovsky, #emph[Quantum Langlands duality and conformal field theory], 2006. #link("https://arxiv.org/abs/math/0610974v1")[arXiv:math/0610974v1].]
#bibitem([36])[Swann Tubach, #emph[Mixed Hodge modules on stacks], Forum of Mathematics, Sigma #strong[13] (2025), e175. #link("https://doi.org/10.1017/fms.2025.10122")[doi:10.1017/fms.2025.10122]\; #link("https://arxiv.org/abs/2407.02256v3")[arXiv:2407.02256v3].]


