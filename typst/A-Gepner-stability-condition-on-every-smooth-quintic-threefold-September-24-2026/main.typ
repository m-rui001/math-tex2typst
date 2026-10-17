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

#align(center)[#text(size: 16pt, weight: "bold")[A Gepner stability condition on every smooth quintic threefold]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Stability conditions organize the objects of a derived category by a complex central charge and a real phase, with finite filtrations into semistable objects. Their physical antecedent is Douglas’s proposal of $Pi$-stability for D-branes #cite(label("Douglas2001")); Bridgeland gave the mathematical framework used here #cite(label("Bridgeland2007")). At a Gepner point, one seeks a stability condition compatible with a distinguished autoequivalence: the functor should rotate the central charge and translate every semistable phase by a fixed amount. We construct such a condition for every smooth quintic threefold.

Let $X subset bb(P)_(bb(C))^4$ be a smooth quintic hypersurface, and put $cal(D) = D^(upright(b)) \( "Coh" \( X \) \)$ and $H = c_1 \( cal(O)_X \( 1 \) \)$. The structure sheaf is spherical: $"Ext"^(*) \( cal(O)_X \, cal(O)_X \) = bb(C) xor bb(C) \[ - 3 \]$. Using the spherical twist of Seidel–Thomas #cite(label("SeidelThomas2001")), we consider the autoequivalence

$ Phi = T_(cal(O)_X) compose \( - ⊗ cal(O)_X \( 1 \) \) \, #h(2em) T_(cal(O)_X) \( E \) = "Cone" #scale(x: 120%, y: 120%)[\(] R "Hom" \( cal(O)_X \, E \) ⊗ cal(O)_X arrow.r E #scale(x: 120%, y: 120%)[\)] . $

We write $K_(upright("num")) \( X \)$ for the Grothendieck group modulo the radical of its Euler pairing, and $K_(upright("num")) \( X \)_(bb(R)) = K_(upright("num")) \( X \) ⊗_(bb(Z)) bb(R)$. A numerical central charge is a homomorphism $Z : K_(upright("num")) \( X \) arrow.r bb(C)$.

Following Bridgeland #cite(label("Bridgeland2007")), a slicing $cal(P)$ is a family of full additive subcategories $cal(P) \( phi \) subset cal(D)$, indexed by $phi in bb(R)$, with $cal(P) \( phi + 1 \) = cal(P) \( phi \) \[ 1 \]$, vanishing $"Hom" \( cal(P) \( phi_1 \) \, cal(P) \( phi_2 \) \)$ for $phi_1 > phi_2$, and finite Harder–Narasimhan filtrations by distinguished triangles with strictly decreasing phases. A nonzero object of $cal(P) \( phi \)$ has charge in $bb(R)_(> 0) e^(i pi phi)$. Local finiteness requires the extension categories of sufficiently short phase intervals to be quasi-abelian of finite length. We use the support property of Kontsevich–Soibelman #cite(label("KontsevichSoibelman2008")) Section 1.2, expressed on the full numerical group: there exist a norm on $K_(upright("num")) \( X \)_(bb(R))$ and a constant $C > 0$ such that

$ ∥\[ E \]∥ lt.eq C \| Z \( E \) \| quad upright("for every nonzero ") E in cal(P) \( phi \) . $

The pair $\( Z \, cal(P) \)$ is a numerical Bridgeland stability condition when these charge and slicing requirements hold, with local finiteness. We will also verify directly that each phase category is closed under direct summands, using the phase cuts constructed in Lemma 17.

Toda formulated Gepner-type stability for graded matrix factorizations #cite(label("Toda2013")) Definition 2.3 and Conjecture 1.2, and gave the normalized quintic formulation in #cite(label("TodaQuintic2013")) Conjecture 3.1. The following theorem positively resolves this quintic conjecture.

#thm([Theorem 1.1.])[
  #emph[Every smooth complex quintic threefold admits a numerical Bridgeland stability condition $sigma = \( Z \, cal(P) \)$ with the support property on $K_(upright("num")) \( X \)_(bb(R))$ such that, for every $E in cal(D)$ and $phi in bb(R)$, 
$ Z \( Phi E \) = e^(2 pi i \/ 5) Z \( E \) \, #h(2em) Phi #scale(x: 120%, y: 120%)[\(] cal(P) \( phi \) #scale(x: 120%, y: 120%)[\)] = cal(P) \( phi + 2 \/ 5 \) \, #h(2em) Z \( cal(O)_x \) = - 1 $

 for every closed point $x in X$.]
] <thm:main>

The normalization identifies our central charge with Toda’s by the uniqueness of the normalized eigenform proved in Proposition 4.

===== 1.1 Prior work and the remaining construction. <prior-work-and-the-remaining-construction.>

The functor relation $Phi^5 tilde.eq \[ 2 \]$ and its eigencharge are established features of the quintic Gepner problem. Orlov’s equivalence #cite(label("Orlov2009")) Theorem 2.5 and the compatibility with grade shift proved by Ballard–Favero–Katzarkov #cite(label("BallardFaveroKatzarkov2012")) Proposition 5.8 and Remark 5.12 identify the relevant categorical symmetry; Toda recalls this identification in #cite(label("TodaQuintic2013")) Theorem 2.5. A direct computation with Fourier–Mukai kernels appears in Aspinwall #cite(label("Aspinwall2004")) Section 7.1.4. Section 2 fixes the numerical conventions used in our construction; Appendix 5 supplies a relative-kernel proof of the functor relation.

The double-tilt approach to threefold stability was developed by Bayer–Macrì–Toda #cite(label("BayerMacriToda2014")). For the Gepner charge, Toda already proposed the first slope tilt at $- 1 \/ 2$ and the second tilt using the imaginary part of that charge #cite(label("TodaQuintic2013")) Sections 3.4–3.6 and Conjecture 3.9. His Remark 3.10 identifies the existence of Harder–Narasimhan filtrations for this irrational charge as a remaining difficulty. The existence of numerical Bridgeland stability conditions on every smooth quintic was established by Li #cite(label("Li2019")) Theorem 1.3. Theorem 1 adds the specified Gepner symmetry. Our slope-sheaf input is a consequence of Xu’s stronger Bogomolov–Gieseker inequality #cite(label("Xu2026")) Theorem 1.3, whose hypotheses and precise comparison with the bound used here are recorded in Lemma 5.

===== 1.2 Main idea and proof roadmap. <main-idea-and-proof-roadmap.>

The central step is to retain two independent perturbations of Toda’s second cut. They give inequalities controlling rank and first Chern character; the complex charge then controls the other two numerical coordinates. We obtain this support estimate before defining semistable objects. It makes finite refinement possible even though the image of the numerical lattice under the charge need not be discrete.

The proof proceeds through four stages.

+ In Section 2, we record periodicity and compute the unique normalized eigencharge. We also identify the full numerical group with a rank-four lattice. The resulting coordinate estimate will turn control of rank, first Chern character, and charge into full support.
+ In Section 3, we construct a family of bounded aisles $U_eta$, where an aisle is the nonpositive part of a bounded $t$-structure and $eta = \( eta_0 \, eta_1 \)$ ranges over a fixed open square in $bb(R)^2$. The construction tilts $"Coh" \( X \)$ twice, beginning at slope $- 1 \/ 2$, and varies the rank and first-Chern coefficients of the second cut. Xu’s inequality supplies strict margins for the comparison. The crucial conclusion of Proposition 10 is
  $ Phi U_eta subset U_theta . $
  Both parameters vary independently throughout the same square.
+ In Section 4, periodicity and positivity refine the translated aisles to a nested grid $V_k$, indexed by integers, with phase spacing $1 \/ 5$ (Proposition 11). The category $cal(S)_k = V_k ∩ V_(k + 1)^perp$ between consecutive aisles is called a block; here $perp$ is right $"Hom"$-orthogonality. Its charges lie in a closed sector of angle $pi \/ 5$. Each block object belongs to every member of a suitable perturbed family of hearts. Testing all those perturbations gives the full support estimate of Proposition 13.
+ We then refine each block into semistable factors (Lemma 14). Support and a positive projection of the charge bound the numerical classes of subobjects and the length of any refinement. The full lattice is discrete, so maximal phases exist and refinement stops. We merge shared endpoint phases to obtain the slicing, construct its phase cuts, and prove local finiteness through the exact structure of short phase intervals (Proposition 19).

===== 1.3 Conventions and prerequisites. <conventions-and-prerequisites.>

Our aisle convention is degree $lt.eq 0$, so aisles are closed under $\[ 1 \]$. For a subcategory $cal(C)$, the notation $cal(C)^perp$ means its right $"Hom"$-orthogonal. Extension closures always include the zero object and finite iterated extensions. We use standard coherent-sheaf cohomology, slope Harder–Narasimhan filtrations, derived truncations, Riemann–Roch, Serre duality, and the hyperplane theorem. The specific slope inequality is cited as above; the construction of the stability condition from it is given in full.

== 2 Periodicity and the numerical central charge <sec:numerical>

Throughout, $X subset upright(bold(P))_(bb(C))^4$ is a smooth hypersurface of degree five, $i : X arrow.r.hook upright(bold(P))^4$ is its inclusion, and $cal(D) = D^(upright(b)) \( "Coh" \( X \) \)$. Put $H = c_1 \( cal(O)_X \( 1 \) \)$, so that $integral_X H^3 = 5$. For an object $E in cal(D)$ we use the normalized characters

#[#set math.equation(numbering: n => "(2.1)")
 $ v \( E \) = \( r \, c \, d \, e \) = ("rk" \( E \) \, frac(integral_X H^2 "ch"_1 \( E \), 5) \, frac(integral_X H "ch"_2 \( E \), 5) \, frac(integral_X "ch"_3 \( E \), 5)) . $ <eq:normalized-characters>]

In particular, ordinary slope is normalized as $mu_H \( E \) = c \( E \) \/ r \( E \)$ for a sheaf of positive rank. We first record the functor relation that will make the subsequent family of aisles periodic, and then determine the central charge on the full numerical Grothendieck group. The periodicity is already visible in Aspinwall’s direct kernel calculation #cite(label("Aspinwall2004")) Section 7.1.4. It also follows from Orlov’s equivalence #cite(label("Orlov2009")) Theorem 2.5 and its compatibility with grade shift #cite(label("BallardFaveroKatzarkov2012")) Proposition 5.8 and Remark 5.12, as recalled in #cite(label("TodaQuintic2013")) Theorem 2.5. Appendix 5 gives a direct proof, keeping track of the relative kernels and the natural transformations needed for a functor isomorphism. Here we record the relation and compute its numerical action.

#thm([Lemma 2.1.])[
  #emph[Let $Phi = T_(cal(O)_X) compose \( - ⊗ cal(O)_X \( 1 \) \)$. There is a natural isomorphism of exact functors 
#[#set math.equation(numbering: n => "(2.2)")
 $ Phi^5 tilde.eq \[ 2 \] . $ <eq:periodicity>]

 Consequently $Phi$ is an autoequivalence, with inverse $Phi^4 \[ - 2 \]$.]
] <lem:periodicity>

To prove the relation, expand the ordered composition as

$ Phi^5 tilde.eq T_(cal(O)_X) compose T_(cal(O)_X \( 1 \)) compose dots.h.c compose T_(cal(O)_X \( 4 \)) compose \( - ⊗ cal(O)_X \( 5 \) \) . $

The rightmost functor acts first. The relative-kernel argument in Appendix 5 identifies this twist product with tensoring by $cal(O)_X \( - 5 \)$ followed by $\[ 2 \]$.

We next identify the entire numerical group and its integral discreteness. After computing the charge, these coordinates will also show that controlling rank, first Chern character, and charge suffices to control a numerical class.

#thm([Lemma 2.2.])[
  #emph[The map $v$ identifies $K_(upright("num")) \( X \)_(bb(R))$ with $bb(R)^4$. Under this identification, $K_(upright("num")) \( X \)$ is a full discrete lattice contained in 
#[#set math.equation(numbering: n => "(2.3)")
 $ bb(Z) times bb(Z) times 1 / 10 bb(Z) times 1 / 30 bb(Z) . $ <eq:numerical-lattice>]

 For $v = \( r \, c \, d \, e \)$ and $w = \( r' \, c' \, d' \, e' \)$, the Euler form is 
#[#set math.equation(numbering: n => "(2.4)")
 $ chi \( v \, w \) = 5 (r e' - c d' + d c' - e r' + 5 / 6 \( r c' - c r' \)) . $ <eq:euler-form>]

 The matrix induced by $Phi$ is 
#[#set math.equation(numbering: n => "(2.5)")
 $ M = mat(delim: "(", - 4, - 20 \/ 3, - 5, - 5; 1, 1, 0, 0; 1 \/ 2, 1, 1, 0; 1 \/ 6, 1 \/ 2, 1, 1) \, #h(2em) det \( z I - M \) = z^4 + z^3 + z^2 + z + 1 . $ <eq:numerical-rotation>]

]
] <lem:numerical>

#proof[
  The Weak Lefschetz Theorem (in the integral form recalled in #cite(label("Catanese2014")) Theorem 3) and Poincaré duality give $H^(2 j) \( X \, bb(Q) \) = bb(Q) H^j$ for $0 lt.eq j lt.eq 3$; the integral version also gives $H^2 \( X \, bb(Z) \) = bb(Z) H$. Thus the even Chern character is precisely
  $ "ch" \( E \) = r + c H + d H^2 + e H^3 . $
  The tangent sequence gives $c \( T_X \) = \( 1 + H \)^5 \/ \( 1 + 5 H \)$, so that $c_1 \( T_X \) = 0$, $c_2 \( T_X \) = 10 H^2$, and
  $ "td" \( X \) = 1 + 5 / 6 H^2 . $
  Hirzebruch–Riemann–Roch, obtained by taking the proper map to a point in #cite(label("BorelSerre1958")) Section 7, now gives (2.4), and in particular
  #[#set math.equation(numbering: n => "(2.6)")
   $ chi \( E \) = 5 (e \( E \) + 5 / 6 c \( E \)) . $ <eq:euler-characteristic>]
  The matrix of the bilinear form (2.4) is
  $ J = mat(delim: "(", 0, 25 \/ 6, 0, 5; - 25 \/ 6, 0, - 5, 0; 0, 5, 0, 0; - 5, 0, 0, 0) \, #h(2em) det J = 625 . $
  Moreover the four vectors
  $ v \( cal(O)_X \( k \) \) = \( 1 \, k \, k^2 \/ 2 \, k^3 \/ 6 \) \, #h(2em) 0 lt.eq k lt.eq 3 \, $
  span $bb(Q)^4$: their row matrix has determinant one. It follows that the kernel of $v$ on $K_0 \( X \)$ is exactly the radical of the Euler pairing. Indeed one implication follows from Riemann–Roch, and the other follows by testing against these four spanning vectors and using the nondegeneracy of $J$. Hence $v$ identifies the numerical group with its image, which spans $bb(Q)^4$.
  For any class of $K_0 \( X \)$, integrality of Chern classes and
  $ "ch"_2 = frac(c_1^2 - 2 c_2, 2) \, #h(2em) "ch"_3 = frac(c_1^3 - 3 c_1 c_2 + 3 c_3, 6) $
  give $d in 1 / 10 bb(Z)$ and $e in 1 / 30 bb(Z)$; integral Weak Lefschetz gives $c in bb(Z)$. The image is therefore a subgroup of the discrete lattice in (2.3). Since it contains the four spanning line-bundle classes, it is itself a full lattice. In particular its real span is the full space $bb(R)^4$.
  Tensoring by $cal(O)_X \( 1 \)$ sends
  $ \( r \, c \, d \, e \) mapsto (r \, c + r \, d + c + r / 2 \, e + d + c / 2 + r / 6) . $
  The twist $T_(cal(O)_X)$ then subtracts $chi \( E \( 1 \) \)$ from the rank and leaves the other three coordinates unchanged. Formula (2.6) therefore gives $M$ as displayed. Expanding $det \( z I - M \)$ gives (2.5); in particular its four eigenvalues are the nonidentity fifth roots of unity, each with multiplicity one. ◻
]

We denote by $Phi_(*)$ the induced automorphism of $K_(upright("num")) \( X \)$ and its real-linear extension to $K_(upright("num")) \( X \)_(bb(R))$; both are represented by $M$ in these coordinates.

Put

#[#set math.equation(numbering: n => "(2.7)")
 $ lambda = exp \( 2 pi i \/ 5 \) \, #h(2em) t_0 = 1 / 2 cot \( pi \/ 5 \) > 0 \, #h(2em) u = 4 / 5 sin^2 \( pi \/ 5 \) = frac(5 - sqrt(5), 10) . $ <eq:charge-constants>]

#thm([Proposition 2.3.])[
  #emph[There is a unique numerical homomorphism $Z : K_(upright("num")) \( X \) arrow.r bb(C)$ such that $Z compose Phi = lambda Z$ and $Z \( cal(O)_x \) = - 1$ for closed points $x in X$. It is 
#[#set math.equation(numbering: n => "(2.8)")
 $ frac(Z \( r \, c \, d \, e \), 5) = frac(lambda - 1, 5) r + (t_0^2 - 5 / 6 + frac(i t_0, 2)) c + (- 1 / 2 + i t_0) d - e . $ <eq:central-charge>]

 In particular, 
#[#set math.equation(numbering: n => "(2.9)")
 $ frac("Im" Z \( r \, c \, d \, e \), 5 t_0) = d + 1 / 2 c + u r . $ <eq:imaginary-charge>]

 For any fixed norm on $K_(upright("num")) \( X \)_(bb(R))$, there is a constant $C_0 > 0$ such that every real numerical class $v = \( r \, c \, d \, e \)$ satisfies 
#[#set math.equation(numbering: n => "(2.10)")
 $ ∥v∥ lt.eq C_0 #scale(x: 120%, y: 120%)[\(] \| r \| + \| c \| + \| Z \( v \) \| #scale(x: 120%, y: 120%)[\)] . $ <eq:numerical-norm-control>]

]
] <prop:central-charge>

#proof[
  A closed point has $v \( cal(O)_x \) = \( 0 \, 0 \, 0 \, 1 \/ 5 \)$, so the normalization fixes the coefficient of $e$ in $Z \/ 5$ to be $- 1$. Write $Z \/ 5 = A r + B c + C d - e$. Reading the $e$, $d$, and $c$ columns of $Z M = lambda Z$, in that order, gives
  $ A = frac(lambda - 1, 5) \, #h(2em) C = - frac(lambda, lambda - 1) \, #h(2em) B = - 4 / 3 + frac(C - 1 \/ 2, lambda - 1) . $
  The identity
  $ frac(1, lambda - 1) = - 1 / 2 - i t_0 $
  then gives $C = - 1 \/ 2 + i t_0$ and $B = t_0^2 - 5 \/ 6 + i t_0 \/ 2$. Substitution in the remaining, rank-column equation reduces it to $1 + lambda + lambda^2 + lambda^3 + lambda^4 = 0$. This proves both the eigenvalue identity and uniqueness with the stated normalization. Taking imaginary parts and using
  $ frac(sin \( 2 pi \/ 5 \), 5 t_0) = 4 / 5 sin^2 \( pi \/ 5 \) = u $
  proves (2.9).
  Finally, the real coefficient matrix of $\( d \, e \)$ in $\( "Re" Z \, "Im" Z \)$ is
  $ mat(delim: "(", - 5 \/ 2, - 5; 5 t_0, 0) \, #h(2em) det = 25 t_0 eq.not 0 . $
  Thus $v mapsto \( r \, c \, "Re" Z \( v \) \, "Im" Z \( v \) \)$ is an isomorphism of real vector spaces. Boundedness of its inverse in finite dimension proves (2.10). ◻
]

== 3 A uniform family of double-tilt aisles <sec:aisles>

Our goal is to construct bounded aisles $U_eta$ for which $Phi U_eta subset U_theta$ holds uniformly with independent parameters. We begin with Toda’s proposed two tilts for the quintic Gepner charge #cite(label("TodaQuintic2013")) Sections 3.4–3.6, and vary the second cut in two numerical directions. The slope estimate below supplies the strict margins that make the comparison survive these variations. The two first-tilt slopes $- 1 \/ 2$ and $1 \/ 2$ reflect the order of the factors in $Phi$: tensoring by $cal(O)_X \( 1 \)$ moves the first cut from $- 1 \/ 2$ to $1 \/ 2$, and the spherical twist will take the resulting aisle into one constructed at $- 1 \/ 2$.

We first isolate the geometric input. Slope always means $mu \( F \) = c \( F \) \/ r \( F \)$ for a torsion-free sheaf of positive rank. We use ordinary slope Harder–Narasimhan filtrations, writing $mu^(+) \( F \)$ and $mu^(-) \( F \)$ for their largest and smallest slopes. For an arbitrary sheaf, its torsion subsheaf is removed before these slopes are taken.

#thm([Lemma 3.1.])[
  (Slope input).  #emph[Put 
$ f \( x \) = max {- frac(3 x, 25) \, med x / 2 - 7 / 25 \, med frac(28 x, 25) - 31 / 50} #h(2em) \( 0 lt.eq x lt.eq 1 \) . $

 Every torsion-free slope-semistable sheaf $F$ on $X$ with $\| mu \( F \) \| lt.eq 1$ satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ frac(d \( F \), r \( F \)) lt.eq f \( \| mu \( F \) \| \) . $ <eq:slope-envelope>]

 The estimate extends under integral twists by $\( x \, y \) mapsto \( x + n \, y + n x + n^2 \/ 2 \)$. In particular, $f \( x \) lt.eq 0$ for $0 lt.eq x lt.eq 1 \/ 2$, and $f \( 1 \/ 2 \) = - 3 \/ 100$.]
] <lem:slope-input>

#proof[
  We use Xu’s Theorem 1.3 #cite(label("Xu2026")). Its hypotheses are precisely a smooth complex quintic threefold with its hyperplane polarization and a torsion-free slope-semistable sheaf of slope in $\[ - 1 \, 1 \]$; its coordinates $mu_H$ and $xi_H$ are our $c \/ r$ and $d \/ r$. On $\[ 0 \, 1 \/ 2 \]$ its upper bound $g$ is
  $ g \( x \) = cases(delim: "{", - x \/ 2 \, & 0 lt.eq x lt.eq 1 \/ 4 \,, x \/ 2 - 1 \/ 4 \, & 1 \/ 4 lt.eq x lt.eq 5 \/ 13 \,, - 3 x \/ 20 \, & 5 \/ 13 lt.eq x lt.eq 6 \/ 13 \,, x \/ 2 - 3 \/ 10 \, & 6 \/ 13 lt.eq x lt.eq 1 \/ 2 .) $
  The first and third lines are at most $- 3 x \/ 25$; the second is also at most $- 3 x \/ 25$ because $5 \/ 13 < 25 \/ 62$; and the last is at most $x \/ 2 - 7 \/ 25$. Thus $g lt.eq f$ on this half interval. The full upper bound $g$ in Xu’s theorem and the maximum $f$ both satisfy
  $ h \( 1 - x \) = h \( x \) + 1 / 2 - x . $
  For $f$, this reflection exchanges the first and third affine pieces and fixes the second. This proves the comparison on $\[ 0 \, 1 \]$, and the theorem uses $\| mu \|$ on the negative strip.
  For completeness, the symmetry is also compatible with the sheaf operations used here. Twisting by $cal(O)_X \( n \)$ has the displayed effect on $\( x \, y \)$ and preserves slope semistability. If $F$ is not reflexive, passing to $F^(* *)$ preserves slope semistability and $r \, c$, and only increases $d$. For a reflexive sheaf on a smooth threefold the higher sheaf Ext terms of its derived dual are supported in dimension zero, so its ordinary dual has characters $\( r \, - c \, d \)$ through degree two and is slope-semistable. The operations of dualizing and twisting by $cal(O)_X \( 1 \)$ therefore give $\( x \, y \) mapsto \( 1 - x \, y + 1 \/ 2 - x \)$ without changing the validity of an upper bound. Finally the three defining lines are nonpositive on $\[ 0 \, 1 \/ 2 \]$, and their maximum at $1 \/ 2$ is $- 3 \/ 100$. ◻
]

We use aisles in the convention $cal(D)^(lt.eq 0)$: they are closed under $\[ 1 \]$, and the heart of an aisle $V$ is $V ∩ \( V \[ 1 \] \)^perp$, where $perp$ denotes right Hom orthogonality. Recall explicitly the tilt construction of Happel–Reiten–Smalø #cite(label("HappelReitenSmalo1996")). A torsion pair $\( cal(T) \, cal(F) \)$ in the heart of a bounded aisle $V$ gives the aisle

#[#set math.equation(numbering: n => "(3.2)")
 $ V^sharp = { E in V : H_V^0 \( E \) in cal(T) } \, #h(2em) cal(H)^sharp = chevron.l cal(F) \[ 1 \] \, cal(T) chevron.r \, #h(2em) V \[ 1 \] subset V^sharp subset V . $ <eq:aisle-tilt>]

Here and below angle brackets denote extension closure. To construct the new truncation triangle, first truncate at zero for $V$, then take the inverse image of the torsion subobject of its zeroth cohomology. The remaining triangle has terms from $cal(F)$ and the old positive degrees. The old orthogonality and $"Hom" \( cal(T) \, cal(F) \) = 0$ give the required new orthogonality. Shift closure and the two inclusions prove that this is a bounded $t$-structure. The same truncations show conversely that an aisle between $V \[ 1 \]$ and $V$ gives a torsion pair in the heart of $V$.

For $b in { - 1 \/ 2 \, 1 \/ 2 }$, let $cal(C)_(lt.eq b)$ consist of zero and the torsion-free sheaves with $mu^(+) lt.eq b$, and let $cal(C)_(> b)$ consist of sheaves whose torsion-free quotient has $mu^(-) > b$, together with all torsion sheaves. Ordinary slope filtrations give the torsion pair $\( cal(C)_(> b) \, cal(C)_(lt.eq b) \)$ in $"Coh" \( X \)$. Define the first tilted heart and its aisle by

$ cal(B)_b = chevron.l cal(C)_(lt.eq b) \[ 1 \] \, cal(C)_(> b) chevron.r \, #h(2em) W_b = cal(D)_(cal(B)_b)^(lt.eq 0) \, #h(2em) p_b = c - b r . $

On $cal(B)_b$, $p_b$ takes values in $1 / 2 bb(Z)_(gt.eq 0)$, by Lemma 3. For $E in cal(B)_b$, the equality $p_b \( E \) = 0$ holds exactly when $H^(- 1) \( E \)$ is slope-semistable of slope $b$ (or zero), and $H^0 \( E \)$ has dimension at most one. This follows by applying $p_b$ to the slope factors of the two cohomology sheaves: each contribution is nonnegative, and a nonzero divisorial torsion sheaf has positive $c$.

#thm([Lemma 3.2.])[
  #emph[The abelian categories $cal(B)_(- 1 \/ 2)$ and $cal(B)_(1 \/ 2)$ are noetherian.]
] <lem:first-tilt-noetherian>

#proof[
  We give the rational first-tilt argument; compare #cite(label("BayerMacriToda2014")) proof of Lemma 3.2.4. Consider epimorphisms $E_0 arrow.r.twohead E_1 arrow.r.twohead E_2 arrow.r.twohead dots.h.c$ in $cal(B)_b$, with kernels $K_i$ for the individual arrows. The nonnegative discrete numbers $p_b \( E_i \)$ eventually stabilize, so $p_b \( K_i \) = 0$. The ordinary cohomology sheaves $H^0 \( E_i \)$ form a sequence of epimorphisms and eventually stabilize, since $"Coh" \( X \)$ is noetherian. The preceding description of $K_i$ gives $r \( K_i \) lt.eq 0$, hence the integers $r \( E_i \)$ are nondecreasing. They are bounded above by the now fixed rank of $H^0 \( E_i \)$, so eventually $r \( K_i \) = 0$. Each remaining $K_i$ is then an ordinary sheaf of dimension at most one.
  The cohomology sequence now reads
  $ 0 arrow.r H^(- 1) \( E_i \) arrow.r H^(- 1) \( E_(i + 1) \) arrow.r K_i arrow.r 0 . $
  These torsion-free sheaves agree in codimension one. Their injections extend to isomorphisms of their reflexive hulls, so they form an increasing chain of coherent subsheaves of a fixed reflexive sheaf. That chain stabilizes, forcing $K_i = 0$. Thus every such sequence of epimorphisms stabilizes, as required. ◻
]

The first tilted hearts are now available. We define the second cut and choose constants for three uses: negativity at the slope boundary, exclusion of a small neighboring slope strip, and a strict comparison between the two cuts. At zero perturbation and $b = - 1 \/ 2$, the cut is the imaginary part of the normalized Gepner charge, as in Toda’s candidate heart #cite(label("TodaQuintic2013")) Section 3.6. Fix

#[#set math.equation(numbering: n => "(3.3)")
 $ delta = 10^(- 5) \, #h(2em) s_0 = 553 / 1000 \, #h(2em) B_delta = { eta = \( eta_0 \, eta_1 \) in bb(R)^2 : \| eta_j \| < delta } \,\
N_b^eta = d - b c + u r + eta_1 c + eta_0 r . $ <eq:aisle-parameters>]

The following exact margins will be useful:

#[#set math.equation(numbering: n => "(3.4)")
 $ m_b & = 7 / 25 - u - 3 / 2 delta > 0 \,\
m_s & = 13857 / 50000 - u - \( 1 + s_0 \) delta > 0 \,\
m_c & = 1 / 2 - u / s_0 - 3 delta > 0 . $ <eq:boundary-margin>]

For example, $sqrt(5) > 223606 \/ 100000$ implies $u < 138197 \/ 500000$, and gives respectively the positive lower bounds $3591 \/ 10^6$, $73047 \/ 10^8$, and $8941 \/ 55300000$ for these three expressions. On a slope-semistable sheaf $F$ of slope $b$, Lemma 5 gives

#[#set math.equation(numbering: n => "(3.5)")
 $ frac(N_b^eta \( F \), r \( F \)) lt.eq - 3 / 100 - 1 / 4 + u + 3 / 2 delta = - m_b < 0 . $ <eq:boundary-negative>]

Consequently $N_b^eta gt.eq 0$ on the $p_b = 0$ objects of $cal(B)_b$; equality holds precisely for zero-dimensional sheaves, including zero. Indeed their degree-minus-one part contributes strictly positively unless it vanishes, while a sheaf of dimension at most one has $N_b^eta = d gt.eq 0$, with equality exactly in dimension zero.

Call a nonzero object of $cal(B)_b$ #emph[high] if $p_b = 0$ or $N_b^eta > 0$, and #emph[low] otherwise. Thus low means $p_b > 0$ and $N_b^eta lt.eq 0$. Set

$ cal(T)_b^eta & = { E : upright("every nonzero quotient of ") E upright(" in
 ") cal(B)_b upright(" is high") } \,\
cal(F)_b^eta & = { E : upright("every nonzero subobject of ") E upright(" in
 ") cal(B)_b upright(" is low") } . $

#thm([Lemma 3.3.])[
  (The second tilt).  #emph[For every $b = plus.minus 1 \/ 2$ and $eta in B_delta$, the pair $\( cal(T)_b^eta \, cal(F)_b^eta \)$ is a torsion pair. Its tilt has bounded heart and aisle 
$ cal(A)_b^eta = chevron.l cal(F)_b^eta \[ 1 \] \, cal(T)_b^eta chevron.r \, #h(2em) cal(U)_b^eta = { E in W_b : H_(cal(B)_b)^0 \( E \) in cal(T)_b^eta } . $

 On $cal(A)_b^eta$ one has $N_b^eta gt.eq 0$, and no nonzero object of this heart has zero numerical class.]
] <lem:second-tilt>

#proof[
  High objects are closed under extensions: if one end term has positive $N_b^eta$, so does the extension, and otherwise both have $p_b = 0$. It follows, by taking the induced filtration on a quotient, that $cal(T)_b^eta$ is closed under quotients and extensions.
  If an object has a high subobject, choose such a nonzero subobject $A$ with $p_b \( A \)$ minimal. When $p_b \( A \) = 0$, all its quotients have $p_b = 0$. Otherwise $N_b^eta \( A \) > 0$, and a low quotient $Q$ would have $p_b \( Q \) > 0$ and $N_b^eta \( Q \) lt.eq 0$. Its kernel would then be a high subobject with strictly smaller $p_b$, a contradiction. Thus $A in cal(T)_b^eta$ in either case.
  By Lemma 6, every object has a maximal $cal(T)_b^eta$ subobject; sums of such subobjects again belong to $cal(T)_b^eta$, so maximality has its usual torsion meaning. The quotient has no high subobject, since such a subobject would contain a nonzero member of $cal(T)_b^eta$ by the preceding paragraph, and its inverse image would enlarge the maximal torsion subobject. The quotient therefore lies in $cal(F)_b^eta$. Finally a nonzero image of a map from $cal(T)_b^eta$ to $cal(F)_b^eta$ would be both high and low. This proves the torsion pair, and (3.2) gives boundedness.
  Write an object of the new heart as an extension of $T$ by $F \[ 1 \]$, where $T in cal(T)_b^eta$ and $F in cal(F)_b^eta$. Then $N_b^eta \( T \) gt.eq 0$ and $N_b^eta \( F \) lt.eq 0$, proving nonnegativity. If $N_b^eta \( E \) = 0$, both terms have $N_b^eta = 0$. Since $T$ itself is high when nonzero, this forces $p_b \( T \) = 0$, hence $T$ is zero-dimensional. If $F eq.not 0$, then $p_b \( F \) > 0$ and $p_b \( E \) = - p_b \( F \) < 0$. Thus $\[ E \] = 0$ would force $F = 0$; it would then force $T = 0$, since $e \( T \) = "length" \( T \) \/ 5$. This proves the last assertion. ◻
]

We next compare the two slope cuts with independent parameters. Subscripts $-$ and $+$ mean $b = - 1 \/ 2$ and $b = 1 \/ 2$, respectively.

#thm([Lemma 3.4.])[
  #emph[For every $alpha \, theta in B_delta$, 
$ cal(U)_(+)^alpha subset cal(U)_(-)^theta . $

]
] <lem:compare-slope-cuts>

#proof[
  Let $cal(M)$ be the ordinary torsion-free sheaves all of whose slopes lie in $\( - 1 \/ 2 \, 1 \/ 2 \]$, and let
  $ cal(L) = chevron.l cal(C)_(lt.eq - 1 \/ 2) \[ 1 \] \, cal(C)_(> 1 \/ 2) chevron.r = cal(B)_(-) ∩ cal(B)_(+) . $
  To see the torsion pair $\( cal(L) \, cal(M) \)$ in $cal(B)_(-)$, take $E in cal(B)_(-)$ and let $M_E$ be the quotient of $H^0 \( E \)$ obtained by removing its torsion and its slope factors above $1 \/ 2$. Then $M_E in cal(M)$. The kernel of $E arrow.r M_E$ in $cal(B)_(-)$ has degree-minus-one cohomology $H^(- 1) \( E \)$ and degree-zero cohomology in $cal(C)_(> 1 \/ 2)$, so it lies in $cal(L)$. The slope vanishing and the ordinary cohomological degrees give $"Hom" \( cal(L) \, cal(M) \) = 0$. Tilting this torsion pair gives $cal(B)_(+) = chevron.l cal(M) \[ 1 \] \, cal(L) chevron.r$; in $cal(B)_(+)$ the corresponding torsion pair is $\( cal(M) \[ 1 \] \, cal(L) \)$. In particular $W_(-) \[ 1 \] subset W_(+) subset W_(-)$, and $W_(+) \[ 1 \] subset W_(-) \[ 1 \] subset cal(U)_(-)^theta$. It suffices to prove
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Hom" \( cal(T)_(+)^alpha \, cal(F)_(-)^theta \) = 0 . $ <eq:comparison-hom>]
  Indeed an object $E in W_(-)$ has maps to a member of $cal(F)_(-)^theta$ exactly through $H_(cal(B)_(-))^0 \( E \)$; vanishing of all such maps puts this cohomology object in $cal(T)_(-)^theta$. Equation (3.6) therefore puts $cal(T)_(+)^alpha$ in $cal(U)_(-)^theta$, and the preceding inclusion handles the negative $cal(B)_(+)$ degrees.
  Suppose there is a nonzero map $E arrow.r G$ with $E in cal(T)_(+)^alpha$ and $G in cal(F)_(-)^theta$. Its source decomposes in $cal(B)_(+)$ as $0 arrow.r M_E \[ 1 \] arrow.r E arrow.r E_0 arrow.r 0$, with $E_0 in cal(L)$. Because $"Hom" \( cal(M) \[ 1 \] \, cal(B)_(-) \) = 0$, the map factors through $E_0$, which is still in $cal(T)_(+)^alpha$. The $\( cal(L) \, cal(M) \)$ decomposition of $G$ in $cal(B)_(-)$ then factors it through a subobject $G_0 in cal(L)$ of $G$, since $"Hom" \( cal(L) \, cal(M) \) = 0$.
  Take the kernel $K$ and the nonzero image $Q$ of $E_0 arrow.r G_0$ in $cal(B)_(-)$. Let $K_(cal(L))$ be the $cal(L)$ torsion part of $K$, and put $U' = E_0 \/ K_(cal(L))$ in $cal(B)_(-)$. The quotient closure of $cal(L)$ gives $Q \, U' in cal(L)$. All three terms of $K_(cal(L)) arrow.r E_0 arrow.r U'$ belong to both hearts, so its triangle is short exact in $cal(B)_(+)$ as well. Thus $U'$ remains a quotient of $E$ in $cal(B)_(+)$, and we have
  #[#set math.equation(numbering: n => "(3.7)")
   $ 0 arrow.r S arrow.r U' arrow.r Q arrow.r 0 quad upright("in ") cal(B)_(-) \, #h(2em) S = K \/ K_(cal(L)) in cal(M) \, quad U' in cal(T)_(+)^alpha \, quad 0 eq.not Q in cal(F)_(-)^theta . $ <eq:common-heart-sequence>]
  We use the sequence (3.7) only as a short exact sequence in $cal(B)_(-)$; its term $S$ need not belong to $cal(B)_(+)$.
  We now use the slope envelope to exclude factors close to the two slope boundaries. The resulting rank bounds will contradict the opposite signs of the two cut forms on $U'$ and $Q$.
  Directly from the three affine functions defining $f$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ max_(1 \/ 2 lt.eq s lt.eq s_0) #scale(x: 120%, y: 120%)[\(] f \( s \) - s \/ 2 + u #scale(x: 120%, y: 120%)[\)] = u - 13857 / 50000 . $ <eq:strip-test>]
  The perturbation error on a slope $plus.minus s$ is at most $\( 1 + s_0 \) delta$, so (3.4) makes the relevant sheaf value of $N_(-)$ on $\[ - s_0 \, - 1 \/ 2 \]$, or of $N_(+)$ on $\[ 1 \/ 2 \, s_0 \]$, strictly negative.
  Write $A = H^(- 1) \( Q \)$. If $A eq.not 0$, its top slope factor $A_1$ is a saturated subsheaf and $A \/ A_1 in cal(C)_(lt.eq - 1 \/ 2)$. Consequently $A_1 \[ 1 \]$ is a subobject of $A \[ 1 \]$, and then of $Q$, in $cal(B)_(-)$. If $mu \( A_1 \) in \[ - s_0 \, - 1 \/ 2 \]$, the preceding negative sheaf value makes $A_1 \[ 1 \]$ high, contradicting $Q in cal(F)_(-)^theta$. Thus $mu^(+) \( A \) < - s_0$.
  For $U'$, put $A' = H^(- 1) \( U' \)$ and $D' = H^0 \( U' \)$. If $D'$ has positive rank, remove its ordinary torsion subsheaf and take its bottom positive-rank slope quotient $G'$. The kernel of $D' arrow.r G'$ consists of that torsion and the other slope factors, all of slope $> 1 \/ 2$; this sequence is therefore exact in $cal(B)_(+)$. The ordinary cohomology sequence also makes $D'$ a $cal(B)_(+)$ quotient of $U'$, so $G'$ is such a quotient. A slope $mu \( G' \) in \( 1 \/ 2 \, s_0 \]$ would give $p_(+) \( G' \) > 0$, $N_(+)^alpha \( G' \) < 0$, contradicting $U' in cal(T)_(+)^alpha$. Every positive-rank slope of $D'$ therefore exceeds $s_0$.
  For any $L in cal(L)$, its two ordinary cohomology sheaves give
  #[#set math.equation(numbering: n => "(3.9)")
   $ c \( L \) gt.eq 1 / 2 #scale(x: 120%, y: 120%)[\(] r \( H^(- 1) \( L \) \) + r \( H^0 \( L \) \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 2 \| r \( L \) \| . $ <eq:overlap-rank-bound>]
  Divisorial torsion contributes nonnegative $c$, and torsion in lower dimension contributes zero. The stronger slope conclusions just proved similarly give
  #[#set math.equation(numbering: n => "(3.10)")
   $ c \( Q \) gt.eq - s_0 r \( Q \) \, #h(2em) c \( U' \) gt.eq s_0 r \( U' \) . $ <eq:two-slope-tests>]
  More explicitly, with $D = H^0 \( Q \)$ the estimates are
  $ c \( Q \) & gt.eq s_0 r \( A \) + 1 / 2 r \( D \) gt.eq - s_0 r \( Q \) \,\
c \( U' \) & gt.eq 1 / 2 r \( A' \) + s_0 r \( D' \) gt.eq s_0 r \( U' \) . $
  They include torsion cohomology sheaves: their ranks are zero and their contributions to $c$ are nonnegative. Also $d \( S \) lt.eq 0$, by applying Lemma 5 to the ordinary slope factors of $S$.
  Set $C = c \( Q \) + c \( U' \)$. By (3.9), $C gt.eq 0$. If $C = 0$, then $c \( Q \) = r \( Q \) = 0$, so $p_(-) \( Q \) = 0$, impossible for a nonzero member of $cal(F)_(-)^theta$. Hence $C > 0$; and (3.10) together with (3.7) gives $C gt.eq s_0 r \( S \)$. By additivity,
  $ N_(-)^theta \( Q \) - N_(+)^alpha \( U' \) & = 1 / 2 C - u r \( S \) - d \( S \) + theta_1 c \( Q \) + theta_0 r \( Q \) - alpha_1 c \( U' \) - alpha_0 r \( U' \)\
 & gt.eq (1 / 2 - u / s_0 - 3 delta) C - d \( S \) > 0 . $
  Here the absolute value of the last four terms is at most $3 delta C$ by (3.9); this applies even when a derived rank is negative. The strict sign is (3.4). But $N_(-)^theta \( Q \) lt.eq 0 lt.eq N_(+)^alpha \( U' \)$, a contradiction. This proves (3.6) and the aisle inclusion. ◻
]

#thm([Lemma 3.5.])[
  #emph[For all $alpha \, theta in B_delta$, 
$ cal(O)_X in cal(A)_(-)^theta \, #h(2em) cal(O)_X \[ 2 \] in cal(A)_(+)^alpha \, #h(2em) T_(cal(O)_X) \( cal(U)_(+)^alpha \) subset cal(U)_(-)^theta . $

]
] <lem:twist-aisle>

#proof[
  The object $cal(O)_X in cal(B)_(-)$ has the smallest positive value $p_(-) = 1 \/ 2$ and $N_(-)^theta = u + theta_0 > 0$. It has no nonzero subobject of $p_(-) = 0$: a $p_(-) = 0$ object is an extension of a sheaf of dimension at most one by $F \[ 1 \]$ of slope $- 1 \/ 2$, and both have zero Hom to $cal(O)_X$. Any nonzero low quotient of $cal(O)_X$ would have $p_(-) = 1 \/ 2$, leaving a kernel of $p_(-) = 0$; that kernel must vanish, contradicting that $cal(O)_X$ is high. Hence $cal(O)_X in cal(T)_(-)^theta$.
  Similarly $cal(O)_X \[ 1 \] in cal(B)_(+)$ has $p_(+) = 1 \/ 2$ and $N_(+)^alpha = - u - alpha_0 < 0$. A $p_(+) = 0$ object has no map to it: for its slope-$1 \/ 2$ part this is $"Hom" \( F \[ 1 \] \, cal(O)_X \[ 1 \] \) = "Hom" \( F \, cal(O)_X \) = 0$, and for its dimension-at-most-one part $T$ it follows from
  $ "Ext"^1 \( T \, cal(O)_X \) = H^2 \( X \, T \)^(*) = 0 . $
  Here we use Serre duality and $K_X tilde.eq cal(O)_X$. Every nonzero subobject $A$ of $cal(O)_X \[ 1 \]$ therefore has $p_(+) \( A \) = 1 \/ 2$, and its quotient $Q$ has $p_(+) \( Q \) = 0$. Hence $N_(+)^alpha \( A \) = N_(+)^alpha \( cal(O)_X \[ 1 \] \) - N_(+)^alpha \( Q \) < 0$. This proves $cal(O)_X \[ 1 \] in cal(F)_(+)^alpha$, and thus $cal(O)_X \[ 2 \] in cal(A)_(+)^alpha$.
  For $B in cal(U)_(+)^alpha$ and $j gt.eq 2$, Serre duality and the heart orthogonality give
  $ "Ext"^j \( cal(O)_X \, B \) = "Hom" \( B \[ j - 1 \] \, cal(O)_X \[ 2 \] \)^(*) = 0 \, $
  since $B \[ j - 1 \] in cal(U)_(+)^alpha \[ 1 \]$. Lemma 8 puts $B$ in $cal(U)_(-)^theta$. In the twist triangle
  $ B arrow.r T_(cal(O)_X) \( B \) arrow.r "RHom" \( cal(O)_X \, B \) ⊗ cal(O)_X \[ 1 \] arrow.r B \[ 1 \] \, $
  the third term is a finite direct sum of copies of $cal(O)_X \[ 1 - j \]$ with $j lt.eq 1$, because bounded complexes of finite-dimensional vector spaces split into their cohomology. All these terms lie in $cal(U)_(-)^theta$. Extension closure therefore gives the claimed twist inclusion. ◻
]

#thm([Proposition 3.6.])[
  (Uniform independent-parameter inclusion).  #emph[There is a fixed open square 
#[#set math.equation(numbering: n => "(3.11)")
 $ Omega = { eta = \( eta_0 \, eta_1 \) : \| eta_0 \| \, \| eta_1 \| < 5 dot.op 10^(- 6) } $ <eq:fixed-omega>]

 and bounded aisles $U_eta = cal(U)_(-)^eta$, with hearts $cal(A)_eta = U_eta ∩ \( U_eta \[ 1 \] \)^perp$, such that 
#[#set math.equation(numbering: n => "(3.12)")
 $ Phi U_eta subset U_theta #h(2em) \( eta \, theta in Omega \) . $ <eq:uniform-aisle>]

 Moreover 
#[#set math.equation(numbering: n => "(3.13)")
 $ N_eta = d + 1 / 2 c + u r + eta_1 c + eta_0 r gt.eq 0 quad upright("on ") cal(A)_eta \, #h(2em) N_0 = frac("Im" Z, 5 t_0) \, $ <eq:perturbed-positive-form>]

 and no nonzero object of any $cal(A)_eta$ has zero numerical class. The two parameters in (3.12) vary independently throughout this same square.]
] <prop:uniform-aisle>

#proof[
  Tensoring by $cal(O)_X \( 1 \)$ takes $cal(B)_(-)$ to $cal(B)_(+)$ and preserves the $p$ test. Its effect on the other test is
  $ N_(+)^alpha \( E \( 1 \) \) = N_(-)^eta \( E \) quad upright("when") quad alpha_1 = eta_1 \, #h(2em) alpha_0 = eta_0 - eta_1 . $
  Thus it takes the second torsion pair and aisle to those with this parameter $alpha$. If $eta in Omega$, then $alpha in B_delta$; also $theta in Omega$ implies $theta in B_delta$. Lemma 9 now gives
  $ Phi U_eta = T_(cal(O)_X) #scale(x: 120%, y: 120%)[\(] cal(U)_(+)^alpha #scale(x: 120%, y: 120%)[\)] subset U_theta . $
  The remaining assertions are Lemma 7 and (2.9).
  The parameter shear was used once, in proving this inclusion for the original family. In particular, applying any power $Phi^i$ to (3.12) gives $Phi^(i + 1) U_eta subset Phi^i U_theta$ with the same $eta \, theta in Omega$; it performs no further shear and requires no further shrinkage. Negative powers are allowed by Lemma 2. ◻
]

== 4 From uniform aisle inclusions to a slicing <sec:grid>

We now use the bounded aisles $U_eta$ and their hearts $cal(A)_eta$ constructed above. The parameter $eta = \( eta_0 \, eta_1 \)$ ranges over the fixed open square $Omega$ of Proposition 10, and $0 in Omega$. The inputs to this section are

#[#set math.equation(numbering: n => "(4.1)")
 $ Phi U_eta subset U_theta quad \( eta \, theta in Omega \) \,\
N_eta = d + 1 / 2 c + u r + eta_1 c + eta_0 r gt.eq 0 quad upright("on ") cal(A)_eta \, $ <eq:grid-inputs>]

the absence of nonzero objects of zero numerical class in these hearts, and Lemma 2, Lemma 3, and Proposition 4. In particular, throughout this section $Phi$ is an autoequivalence, $Phi^5 tilde.eq \[ 2 \]$, and $Z Phi = e^(2 pi i \/ 5) Z$. All extension closures below mean finite extension closures, contain zero, and are strictly full subcategories of $cal(D)$. For a subcategory $cal(C)$, write $cal(C)^perp = { E : "Hom" \( C \, E \) = 0 upright(" for all ") C in cal(C) }$; the left orthogonal $zws^perp cal(C)$ is defined similarly.

The decisive use of the perturbations is twofold. Simultaneous positivity in fixed middle hearts improves the coarse nesting to a grid with spacing $1 \/ 5$. Positivity in every perturbed preceding heart then bounds the full numerical class of each grid block by its charge.

=== 4.1 The finer grid <the-finer-grid>

Put $D_i^eta = Phi^i U_eta$ for $i in bb(Z)$. The hypotheses give

#[#set math.equation(numbering: n => "(4.2)")
 $ D_(i + 1)^eta subset D_i^theta quad \( i in bb(Z) \, med eta \, theta in Omega \) \, #h(2em) D_(i + 5)^eta = D_i^eta \[ 2 \] . $ <eq:coarse-grid>]

All successive inclusions allow independent parameter choices. The charge rotation suggests how to insert a fifth-step between these coarse cuts: $Phi^3 \[ - 1 \]$ multiplies $Z$ by $e^(i pi \/ 5)$. For its translates to give nested aisles, we need $Phi^3 U_alpha \[ - 1 \] subset U_beta$, or equivalently $D_3^alpha subset D_0^beta \[ 1 \]$. The next proposition proves this inclusion before any slicing or semistable phase is defined.

#thm([Proposition 4.1.])[
  (Uniform refinement of the grid).  #emph[There is an open square $Omega_1$ about zero, contained in $Omega$, such that 
#[#set math.equation(numbering: n => "(4.3)")
 $ D_3^alpha subset D_0^beta \[ 1 \] #h(2em) \( alpha \, beta in Omega_1 \) . $ <eq:single-shift-inclusion>]

 For $k in bb(Z)$ and $eta in Omega_1$, define 
#[#set math.equation(numbering: n => "(4.4)")
 $ V_k^eta = Phi^m U_eta \[ j \] \, #h(2em) k = 2 m + 5 j . $ <eq:fifths-aisles>]

 This is independent of the integers $m \, j$ chosen, and these bounded aisles satisfy 
#[#set math.equation(numbering: n => "(4.5)")
 $ V_(k + 1)^alpha subset V_k^beta \, #h(2em) V_(k + 5)^eta = V_k^eta \[ 1 \] \, #h(2em) Phi V_k^eta = V_(k + 2)^eta \,\
k in bb(Z) \, quad alpha \, beta \, eta in Omega_1 . $ <eq:fifths-nesting>]

]
] <prop:fine-grid>

#proof[
  For $alpha \, beta in Omega$, consider
  $ cal(I)_(alpha \, beta) = D_3^alpha ∩ \( D_0^beta \[ 1 \] \)^perp . $
  Every object of this intersection belongs to the hearts of $D_0^beta$ and $D_3^alpha$. More strongly, for every $gamma in Omega$ and $i in { 1 \, 2 }$, (4.2) gives
  $ D_3^alpha subset D_i^gamma subset D_0^beta \, #h(2em) D_i^gamma \[ 1 \] subset D_0^beta \[ 1 \] . $
  The first inclusion gives aisle membership, and the second gives the orthogonal membership. Thus the same object lies in the heart of $D_i^gamma$ for every $gamma$ in the original fixed square $Omega$. This square is independent of the endpoints $alpha \, beta$ and of the object.
  Fix a Euclidean norm on $K_(upright("num")) \( X \)_(bb(R))$. Suppose there were nonzero objects $E_n in cal(I)_(alpha_n \, beta_n)$ with $alpha_n \, beta_n arrow.r 0$. The endpoint heart has no nonzero zero-class object, so $v_n = \[ E_n \] \/ ∥\[ E_n \]∥$ is defined. After a subsequence it tends to a unit vector $v$. Heart positivity at the two endpoints, and at the unperturbed middle hearts, gives in the limit
  #[#set math.equation(numbering: n => "(4.6)")
   $ "Im" #scale(x: 120%, y: 120%)[\(] e^(- 2 pi i q \/ 5) Z \( v \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 #h(2em) \( q = 0 \, 1 \, 2 \, 3 \) . $ <eq:four-halfplanes>]
  These four inequalities force $Z \( v \) = 0$. Indeed, if $Z \( v \) eq.not 0$, choose its argument $theta.alt in \[ 0 \, 2 pi \)$. The first three inequalities force $theta.alt in \[ 4 pi \/ 5 \, pi \]$, whereas the fourth forces $theta.alt in \[ 0 \, pi \/ 5 \] union \[ 6 pi \/ 5 \, 2 pi \)$, which is impossible.
  Now fix any $gamma in Omega$. The middle-heart inequality at index one holds for every $n$, so the same convergent subsequence satisfies
  $ N_gamma \( Phi_(*)^(- 1) v \) gt.eq 0 . $
  Since $gamma$ was arbitrary, this holds simultaneously for all $gamma in Omega$; there is no further subsequence or shrinking of the middle parameter set. Write $w = Phi_(*)^(- 1) v$. The eigencharge identity and (2.9) give $Z \( w \) = N_0 \( w \) = 0$. Varying $gamma_0 \, gamma_1$ with both signs in $Omega$ now gives $r \( w \) = c \( w \) = 0$. The real-linear independence of the $d \, e$ coefficients of $Z$ gives $d \( w \) = e \( w \) = 0$. This contradicts $∥v∥ = 1$.
  Consequently some square $Omega_1$ about zero has $cal(I)_(alpha \, beta) = 0$ for every pair $alpha \, beta in Omega_1$: otherwise choose counterexamples with both parameters within distance $1 \/ n$ of zero. To deduce (4.3), let $E in D_3^alpha$ and truncate in the bounded t-structure with aisle $D_0^beta$:
  $ A arrow.r E arrow.r H_(D_0^beta)^0 \( E \) arrow.r A \[ 1 \] \, #h(2em) A in D_0^beta \[ 1 \] . $
  Here $E in D_0^beta$, and $A \[ 1 \] in D_0^beta \[ 2 \] = D_5^beta subset D_3^alpha$. Extension closure therefore puts the zeroth cohomology in $D_3^alpha ∩ \( D_0^beta \[ 1 \] \)^perp = 0$. Hence $E in D_0^beta \[ 1 \]$.
  Every integer is $2 m + 5 j$. Two such representations differ by $\( m \, j \) mapsto \( m + 5 t \, j - 2 t \)$, so $Phi^5 tilde.eq \[ 2 \]$ proves that (4.4) is well defined. Since $V_1^alpha = Phi^3 U_alpha \[ - 1 \] subset U_beta = V_0^beta$, transport by $Phi^m \[ j \]$ proves the first assertion of (4.5) for all $k$. Its other assertions follow directly from the definition. ◻
]

From now on $V_k = V_k^0$. Define the heart and the block

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(H)_k = V_k ∩ V_(k + 5)^perp \, #h(2em) cal(S)_k = V_k ∩ V_(k + 1)^perp . $ <eq:block-definitions>]

The first is a bounded heart because $V_(k + 5) = V_k \[ 1 \]$.

#thm([Lemma 4.2.])[
  (Block filtrations).  #emph[The blocks are extension closed, and $"Hom" \( cal(S)_j \, cal(S)_k \) = 0$ whenever $j > k$. Every object has a finite triangle filtration with nonzero factors in blocks of strictly decreasing indices. In $cal(H)_k$ there is a torsion pair 
#[#set math.equation(numbering: n => "(4.8)")
 $ cal(T)_k = V_(k + 1) ∩ cal(H)_k & = chevron.l cal(S)_(k + 4) \, cal(S)_(k + 3) \, cal(S)_(k + 2) \, cal(S)_(k + 1) chevron.r \,\
cal(F)_k & = cal(S)_k . $ <eq:block-torsion-pair>]

 In particular, $cal(S)_k$ is closed under subobjects in $cal(H)_k$.]
] <lem:block-filtrations>

#proof[
  Extension closure follows from (4.7). If $j > k$, then $cal(S)_j subset V_j subset V_(k + 1)$ and $cal(S)_k subset V_(k + 1)^perp$, proving the Hom vanishing. Boundedness and $V_(k + 5) = V_k \[ 1 \]$ put any object $E$ in $V_l ∩ V_h^perp$ for some integers $l < h$. Truncation at $V_(l + 1)$ gives
  $ A arrow.r E arrow.r B arrow.r A \[ 1 \] \, quad A in V_(l + 1) \, med B in V_(l + 1)^perp . $
  Because $E \, A \[ 1 \] in V_l$, we have $B in V_l$, hence $B in cal(S)_l$. Also $B \[ - 1 \] in V_h^perp$: for $F in V_h$, $F \[ 1 \] in V_h subset V_(l + 1)$ gives $"Hom" \( F \, B \[ - 1 \] \) = 0$. The rotated triangle thus shows $A in V_h^perp$. Repeat with $A in V_(l + 1) ∩ V_h^perp$. At index $h$ the remaining object belongs to $V_h ∩ V_h^perp$ and is zero. Reading the resulting triangles from the first subobject to the last quotient gives the stated decreasing order; zero factors are omitted.
  If $E in cal(H)_k$, apply the same construction with $l = k$ and $h = k + 5$. The first triangle has all its terms in $cal(H)_k$, so it is a short exact sequence there, with $A in cal(T)_k$ and $B in cal(S)_k$. The preceding Hom vanishing proves the torsion-pair axiom. Repeating on $A$ proves the displayed four-block description. For completeness, a subobject $G$ of an object of $cal(S)_k$ has $"Hom" \( cal(T)_k \, G \) = 0$, by composing with the inclusion, so its torsion part vanishes. Thus $G in cal(S)_k$. ◻
]

Figure 1 records the index conventions and the charge sectors that will be established in Proposition 13.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.1), [#text(size: 9pt)[$V_0$]])
  content((1.45, 1.1), [#text(size: 9pt)[$V_1$]])
  content((2.9, 1.1), [#text(size: 9pt)[$V_2$]])
  content((4.35, 1.1), [#text(size: 9pt)[$V_3$]])
  content((5.8, 1.1), [#text(size: 9pt)[$V_4$]])
  content((7.25, 1.1), [#text(size: 9pt)[$V_5$]])
  line((1.143, 1.1), (0.3072, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.593, 1.1), (1.757, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.043, 1.1), (3.207, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.493, 1.1), (4.657, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((6.943, 1.1), (6.107, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((0, 1.357), (2.9, 1.357), (0.9265, 2.006), (1.974, 2.006), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.45, 1.843), [#text(size: 9pt)[$Phi$]], anchor: "south", padding: 0.1176cm)
  bezier((0, 1.357), (7.25, 1.357), (2.166, 3.174), (5.084, 3.174), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.625, 2.72), [#text(size: 9pt)[$[1]$]], anchor: "south", padding: 0.1176cm)
  rect((0, -0.05), (1.45, 0.4), fill: rgb("#f0f0ff"), stroke: none)
  content((0.725, 0.175), [#text(size: 9pt)[$cal(S)_0$]])
  rect((1.45, -0.05), (2.9, 0.4), fill: rgb("#f0f0ff"), stroke: none)
  content((2.175, 0.175), [#text(size: 9pt)[$cal(S)_1$]])
  rect((2.9, -0.05), (4.35, 0.4), fill: rgb("#f0f0ff"), stroke: none)
  content((3.625, 0.175), [#text(size: 9pt)[$cal(S)_2$]])
  rect((4.35, -0.05), (5.8, 0.4), fill: rgb("#f0f0ff"), stroke: none)
  content((5.075, 0.175), [#text(size: 9pt)[$cal(S)_3$]])
  rect((5.8, -0.05), (7.25, 0.4), fill: rgb("#f0f0ff"), stroke: none)
  content((6.525, 0.175), [#text(size: 9pt)[$cal(S)_4$]])
  line((0, -0.05), (7.25, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0.4), (0, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.45, 0.4), (1.45, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.9, 0.4), (2.9, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.35, 0.4), (4.35, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.8, 0.4), (5.8, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.25, 0.4), (7.25, -0.12), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.12), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((1.45, -0.12), [#text(size: 9pt)[$1"/"5$]], anchor: "north", padding: 0.1176cm)
  content((2.9, -0.12), [#text(size: 9pt)[$2"/"5$]], anchor: "north", padding: 0.1176cm)
  content((4.35, -0.12), [#text(size: 9pt)[$3"/"5$]], anchor: "north", padding: 0.1176cm)
  content((5.8, -0.12), [#text(size: 9pt)[$4"/"5$]], anchor: "north", padding: 0.1176cm)
  content((7.25, -0.12), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((3.625, -0.65), [#text(size: 9pt)[charge phase]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The fifth-phase grid. Inclusion arrows point toward the larger aisle. The autoequivalence $Phi$ advances two indices, and the shift $\[ 1 \]$ advances five. A nonzero object of $cal(S)_k$ has charge phase in the closed interval $\[ k \/ 5 \, \( k + 1 \) \/ 5 \]$, by Proposition 13. At a shared endpoint, generators from both adjacent blocks enter the definition of the slicing. The diagram shows the unperturbed grid; Proposition 11 gives the independent-parameter nesting. ],
) <fig:fifth-phase-grid>

=== 4.2 Full numerical support on the blocks <full-numerical-support-on-the-blocks>

We first locate a block’s charge using its two adjacent unperturbed hearts. To bound its numerical class, we then place the same object in every perturbed heart at the preceding grid position. This second step retains the two independent inequalities that control rank and first Chern character.

#thm([Proposition 4.3.])[
  #emph[For the fixed Euclidean norm on $K_(upright("num")) \( X \)_(bb(R))$, there is a constant $C > 0$ such that, for every $k in bb(Z)$ and every nonzero $E in cal(S)_k$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ Z \( E \) in { t e^(i pi phi) : t > 0 \, med k \/ 5 lt.eq phi lt.eq \( k + 1 \) \/ 5 } \,\
∥\[ E \]∥ lt.eq C \| Z \( E \) \| . $ <eq:block-support>]

]
] <prop:block-support>

#proof[
  For $k = 2 m + 5 j$, the functor $Phi^(- m) \[ - j \]$ takes $cal(H)_k$ to $cal(A)_0$ and multiplies its charge by $e^(- i pi k \/ 5)$. Positivity therefore gives $"Im" \( e^(- i pi k \/ 5) Z \( E \) \) gt.eq 0$ on $cal(H)_k$. An object $E in cal(S)_k$ belongs both to $cal(H)_k$ and to
  $ cal(H)_(k + 1) \[ - 1 \] = V_(k - 4) ∩ V_(k + 1)^perp . $
  The two tests are consequently
  $ "Im" \( e^(- i pi k \/ 5) Z \( E \) \) gt.eq 0 \, #h(2em) "Im" \( e^(- i pi \( k + 1 \) \/ 5) Z \( E \) \) lt.eq 0 . $
  Their intersection is the closed sector in (4.9), together with the origin.
  Choose $epsilon > 0$ such that the closed square $\[ - epsilon \, epsilon \]^2$ is contained in $Omega_1$. For every $eta$ in this square, independent-parameter nesting gives
  $ V_k subset V_(k - 1)^eta \, #h(2em) V_(k - 1)^eta \[ 1 \] = V_(k + 4)^eta subset V_(k + 1) . $
  Thus $E$ belongs to the heart of $V_(k - 1)^eta$ for every such $eta$: the second inclusion supplies exactly its required right orthogonality. Write $k - 1 = 2 m + 5 j$, and set $w = \[ Phi^(- m) E \[ - j \] \]$. This is the class of an actual object of $cal(A)_eta$ for every parameter under consideration, including the shift in this formula. Hence
  $ N_0 \( w \) + eta_1 c \( w \) + eta_0 r \( w \) gt.eq 0 quad upright("for all ") \| eta_0 \| \, \| eta_1 \| lt.eq epsilon . $
  Choosing the two signs independently proves
  #[#set math.equation(numbering: n => "(4.10)")
   $ epsilon #scale(x: 120%, y: 120%)[\(] \| r \( w \) \| + \| c \( w \) \| #scale(x: 120%, y: 120%)[\)] lt.eq N_0 \( w \) = frac("Im" Z \( w \), 5 t_0) lt.eq frac(\| Z \( E \) \|, 5 t_0) . $ <eq:perturbed-support>]
  The invertible real coordinate map $w mapsto \( r \( w \) \, c \( w \) \, "Re" Z \( w \) \, "Im" Z \( w \) \)$, established in (2.10), now bounds $∥w∥$ by a constant times $\| Z \( E \) \|$. Explicitly, $d \( w \) = "Im" Z \( w \) \/ \( 5 t_0 \) - c \( w \) \/ 2 - u r \( w \)$, and then the real part of (2.8) recovers $e \( w \)$.
  We can choose $m in { 0 \, 1 \, 2 \, 3 \, 4 }$ according to $k - 1$ modulo five. There are therefore only five norm-conversion operators $Phi_(*)^m$; the arbitrary shift $j$ only changes the sign of a numerical class. Taking the maximum of their operator norms gives one $C$ for every $k$. If $Z \( E \) = 0$, the estimate gives $w = 0$. The object $Phi^(- m) E \[ - j \]$ belongs to $cal(A)_0$, so Lemma 7 forces $Phi^(- m) E \[ - j \] = 0$ and hence $E = 0$. This excludes the origin for a nonzero block object and completes the proof. ◻
]

=== 4.3 Finite refinement inside a block <finite-refinement-inside-a-block>

The support estimate is now in place. We use it with the discreteness of the full numerical lattice to obtain maximal phases and a bound on the length of refinement; no discreteness of the charge image is needed.

Fix $k$, and put $a = k \/ 5$, $b = \( k + 1 \) \/ 5$. Each nonzero $E in cal(S)_k$ has a unique phase $phi_k \( E \) in \[ a \, b \]$ with $Z \( E \) = \| Z \( E \) \| e^(i pi phi_k \( E \))$. A subobject $F subset E$ in $cal(H)_k$ is called #emph[saturated in the block] if $E \/ F in cal(S)_k$. Its source already belongs to $cal(S)_k$ by Lemma 12. We call $E$ #emph[block-semistable] if

$ phi_k \( F \) lt.eq phi_k \( E \) quad upright("for every nonzero subobject saturated in the block.") $

The whole object is allowed as such a subobject.

#thm([Lemma 4.4.])[
  (Finite block refinement).  #emph[Every nonzero object of $cal(S)_k$ has a finite filtration by short exact sequences in $cal(H)_k$, with all intermediate quotients in $cal(S)_k$, whose nonzero factors are block-semistable with strictly decreasing phases.]
] <lem:block-hn>

#proof[
  Let $ell > 0$ be a lower bound for the norms of nonzero elements of the full numerical lattice, supplied by Lemma 3, and define
  $ q_k \( z \) = "Re" #scale(x: 120%, y: 120%)[\(] e^(- i pi \( a + b \) \/ 2) z #scale(x: 120%, y: 120%)[\)] \, #h(2em) d_(*) = frac(ell cos \( pi \/ 10 \), C) > 0 . $
  For every nonzero block object, Proposition 13 implies
  #[#set math.equation(numbering: n => "(4.11)")
   $ q_k \( Z \( E \) \) gt.eq cos \( pi \/ 10 \) \| Z \( E \) \| gt.eq d_(*) . $ <eq:block-mass>]
  This projection is additive in short exact sequences. Hence every filtration of a fixed $E$ with nonzero block factors has length at most $q_k \( Z \( E \) \) \/ d_(*)$.
  If $F subset E$ is saturated in the block, then both $F$ and $E \/ F$ are block objects. Their projections are nonnegative, so
  $ ∥\[ F \]∥ lt.eq C \| Z \( F \) \| lt.eq frac(C, cos \( pi \/ 10 \)) q_k \( Z \( F \) \) lt.eq frac(C, cos \( pi \/ 10 \)) q_k \( Z \( E \) \) . $
  Only finitely many lattice classes, and therefore only finitely many charges and phases, can occur for such $F$. Choose a nonzero saturated subobject $F subset E$ of maximal phase, and among those of maximal $\| Z \( F \) \|$. These maxima concern finite sets of numerical values; no finiteness of the set of subobjects is needed.
  This $F$ is block-semistable. Indeed, a saturated subobject of $F$ is saturated in $E$, since the resulting quotient of $E$ is an extension of two objects of $cal(S)_k$. If $G subset E \/ F$ is a nonzero saturated subobject, its preimage $tilde(G) subset E$ is also saturated and is an extension of $G$ by $F$. Charges in a sector of width less than $pi$ have the elementary strict see-saw property: the argument of their sum is strictly between their arguments when those arguments differ, and their magnitudes add when they agree. Thus $phi_k \( G \) > phi_k \( F \)$ contradicts maximal phase of $F$ by using $tilde(G)$; equality contradicts maximal magnitude. Every such $G$ therefore has phase strictly less than $phi_k \( F \)$.
  Apply the same selection to the nonzero quotient $E \/ F$, if there is one, and continue. Preimages give a filtration in the original heart with all factors and intermediate quotients in the block. The phases strictly decrease by the preceding argument, and (4.11) bounds the number of nonzero factors, so the process terminates. ◻
]

#thm([Lemma 4.5.])[
  (The unsaturated test and Hom vanishing).  #emph[If $E in cal(S)_k$ is block-semistable, then every nonzero subobject $G subset E$ in $cal(H)_k$ satisfies $phi_k \( G \) lt.eq phi_k \( E \)$, without a saturation assumption. Consequently, for block-semistable $E \, F in cal(S)_k$, 
$ phi_k \( E \) > phi_k \( F \) quad arrow.r.double quad "Hom" \( E \, F \) = 0 . $

]
] <lem:block-hom>

#proof[
  Suppose $G subset E$ violates the stated inequality. Decompose $E \/ G$ by (4.8) and take the preimage of its torsion part:
  $ 0 arrow.r T arrow.r E \/ G arrow.r F' arrow.r 0 \, #h(2em) 0 arrow.r G arrow.r overline(G) arrow.r T arrow.r 0 \, quad T in cal(T)_k \, med F' in cal(S)_k . $
  The object $overline(G) subset E$ lies in $cal(S)_k$ by subobject closure, and is saturated because $E \/ overline(G) = F'$. The four-block filtration of $T$ has charge rays with phases in $\[ b \, a + 1 \]$. If $g = phi_k \( G \)$, then
  $ a < g lt.eq b \, #h(2em) 0 lt.eq psi - g lt.eq a + 1 - g < 1 quad upright("for every such phase ") psi . $
  Thus $Z \( G \)$ and every added ray lie in the sector with phase interval $\[ g \, a + 1 \]$ of width strictly less than one. Their sum is nonzero and has phase in that same interval. Since $overline(G) in cal(S)_k$, its phase in $\[ a \, b \]$ must therefore be at least $g$. In particular, $phi_k \( overline(G) \) > phi_k \( E \)$, a contradiction. The strict inequality $g > a$, supplied by the alleged destabilization, is what excludes an antipodal endpoint in this argument. If $T = 0$, the contradiction already comes from $G$ itself being saturated.
  For a nonzero map $E arrow.r F$, take its image $I$ in $cal(H)_k$. Since $I subset F$, we have $I in cal(S)_k$. The kernel in $E$ is therefore saturated. If that kernel is zero, $phi_k \( I \) = phi_k \( E \)$; otherwise semistability and the see-saw property give $phi_k \( I \) gt.eq phi_k \( E \)$. The unsaturated test applied to $I subset F$ gives $phi_k \( I \) lt.eq phi_k \( F \)$. These inequalities exclude a nonzero map when the source phase is strictly larger. ◻
]

=== 4.4 The slicing and its phase cuts <the-slicing-and-its-phase-cuts>

For $phi in bb(R)$, let $cal(P) \( phi \)$ be the extension closure of all block-semistable objects whose assigned phase equals $phi$. There is one possible block unless $5 phi in bb(Z)$, in which case the two adjacent blocks are both included in this definition.

#thm([Proposition 4.6.])[
  #emph[The categories $cal(P) \( phi \)$ form a slicing of $cal(D)$ with finite Harder–Narasimhan filtrations. They satisfy 
#[#set math.equation(numbering: n => "(4.12)")
 $ cal(P) \( phi + 1 \) = cal(P) \( phi \) \[ 1 \] \, #h(2em) Phi cal(P) \( phi \) = cal(P) \( phi + 2 \/ 5 \) quad \( phi in bb(R) \) \, $ <eq:slicing-covariance>]

 and every nonzero $E in cal(P) \( phi \)$ satisfies 
#[#set math.equation(numbering: n => "(4.13)")
 $ Z \( E \) in bb(R)_(> 0) e^(i pi phi) \, #h(2em) ∥\[ E \]∥ lt.eq C \| Z \( E \) \| . $ <eq:semistable-support>]

]
] <prop:slicing>

#proof[
  First consider the generators. If two are in different blocks and the source has strictly larger phase, its block index is larger: for $j < k$ one has $\( j + 1 \) \/ 5 lt.eq k \/ 5$. Thus their Hom group vanishes by Lemma 12. The case of a common block is Lemma 15. Induction along extensions in each variable now gives
  $ "Hom" \( cal(P) \( phi \) \, cal(P) \( psi \) \) = 0 #h(2em) \( phi > psi \) . $
  The categories are additive, since finite direct sums are split extensions. The charge of an extension of phase-$phi$ generators is a sum of positive multiples of $e^(i pi phi)$ and hence is again positive on that ray. Likewise the triangle inequality gives
  $ ∥\[ E \]∥ lt.eq sum_j ∥\[ E_j \]∥ lt.eq C sum_j \| Z \( E_j \) \| = C \| Z \( E \) \| $
  for any such extension filtration. This proves (4.13).
  Refine the decreasing block filtration of any object by Lemma 14, splicing the resulting triangles by the octahedral axiom. The phases are weakly decreasing globally and strictly decreasing inside each block. Adjacent equal phases can only occur at a shared endpoint; merging each run of equal-phase factors into its extension gives a finite filtration with strictly decreasing phases and factors in the corresponding $cal(P) \( phi \)$. This also explains why both blocks at a shared endpoint must enter the same phase category.
  By (4.5), the functors $\[ 1 \]$ and $Phi$ take $\( cal(H)_k \, cal(S)_k \)$ to $\( cal(H)_(k + 5) \, cal(S)_(k + 5) \)$ and $\( cal(H)_(k + 2) \, cal(S)_(k + 2) \)$, respectively. These equivalences take exact sequences in the hearts to exact sequences, preserve the condition of being saturated in a block, and change the assigned phase by $1$ and $2 \/ 5$. They therefore preserve block-semistability with these phase increments. Applying them and their inverses to the extension closures proves both equalities in (4.12). The phase-cut argument that follows proves closure under direct summands without presupposing a slicing heart. ◻
]

For any interval $I subset bb(R)$, write $cal(P) \( I \)$ for the extension closure of the $cal(P) \( phi \)$ with $phi in I$.

#thm([Lemma 4.7.])[
  (Direct construction of the phase cuts).  #emph[For every real $c$, both pairs 
#[#set math.equation(numbering: n => "(4.14)")
 $ #scale(x: 120%, y: 120%)[\(] cal(P) \( \( c \, oo \) \) \, cal(P) \( \( - oo \, c \] \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) #scale(x: 120%, y: 120%)[\(] cal(P) \( \[ c \, oo \) \) \, cal(P) \( \( - oo \, c \) \) #scale(x: 120%, y: 120%)[\)] $ <eq:phase-cuts>]

 are an aisle and its right orthogonal for a bounded t-structure. Their hearts are respectively $cal(P) \( \( c \, c + 1 \] \)$ and $cal(P) \( \[ c \, c + 1 \) \)$. Every interval category is the intersection of its lower and upper cut categories, with the indicated endpoint conventions. In particular, these categories, including each $cal(P) \( phi \)$, are closed under direct summands.]
] <lem:phase-cuts>

#proof[
  Denote either pair in (4.14) by $\( cal(U) \, cal(L) \)$. Strict phase separation gives $"Hom" \( cal(U) \, cal(L) \) = 0$ by extension induction. Equation (4.12) gives $cal(U) \[ 1 \] subset cal(U)$ and $cal(L) \[ - 1 \] subset cal(L)$. Cutting the finite decreasing filtration at $c$ and splicing triangles gives, for every $E$, a triangle
  #[#set math.equation(numbering: n => "(4.15)")
   $ U_E arrow.r E arrow.r L_E arrow.r U_E \[ 1 \] \, #h(2em) U_E in cal(U) \, med L_E in cal(L) . $ <eq:phase-truncation>]
  All factors of phase exactly $c$ are assigned to the same side, according to the selected convention. These are the t-structure axioms in the aisle/right-orthogonal convention, and we can verify the orthogonal characterizations directly before using any summand closure. If $E in zws^perp cal(L)$, applying $"Hom" \( - \, L_E \)$ to (4.15) shows that $"Hom" \( L_E \, L_E \) = 0$, since its neighboring terms $"Hom" \( U_E \[ 1 \] \, L_E \)$ and $"Hom" \( E \, L_E \)$ vanish. Thus $L_E = 0$ and $E in cal(U)$. Similarly, if $E in cal(U)^perp$, apply $"Hom" \( U_E \, - \)$ and use $"Hom" \( U_E \, L_E \[ - 1 \] \) = "Hom" \( U_E \, E \) = 0$ to obtain $U_E = 0$. Hence
  $ cal(U) = zws^perp cal(L) \, #h(2em) cal(L) = cal(U)^perp . $
  They are consequently closed under direct summands, and (4.15) is a genuine truncation triangle. Finite upper and lower bounds on the phases of each object’s filtration, and the shift law, prove boundedness.
  We justify the interval description explicitly. A nonempty decreasing filtration with nonzero phase factors cannot have zero total object. Indeed, the identity of its first factor maps nontrivially into the total object: at each subsequent triangle this map remains nonzero because $"Hom" \( F_1 \, F_j \[ - 1 \] \) = 0$. Now group a chosen filtration of an object at the two endpoints of an interval. If the object lies in the upper and lower cut categories, the preceding orthogonal characterizations force the exterior truncation objects to be zero. By the observation just made, their groups of factors are empty. The remaining factors lie in the interval. The reverse inclusion follows from extension closure. This works with either choice at either endpoint, as well as for rays and singletons. Intersecting the aisle with the right orthogonal of its shift therefore gives precisely the two displayed hearts. Finally, intersections of orthogonals are closed under summands, which proves the last assertion. ◻
]

=== 4.5 Quasi-abelian intervals and local finite length <quasi-abelian-intervals-and-local-finite-length>

It remains to verify local finiteness. We first identify the exact sequences in a short phase interval by realizing it inside a phase-cut heart. We then use a positive projection of the charge to bound the length of every strict filtration in that interval.

#thm([Lemma 4.8.])[
  (The exact structure on a short phase interval).  #emph[For every interval $I$ of width less than one, with any choices of open or closed endpoints, $cal(P) \( I \)$ is quasi-abelian. Its strict exact sequences are exactly the short exact sequences of a suitable bounded heart whose three terms belong to $cal(P) \( I \)$.]
] <lem:interval-quasiabelian>

#proof[
  The empty interval gives the zero category. Otherwise let $a lt.eq b$ be its endpoints, with $b - a < 1$. If $a$ is excluded, use the heart $cal(H) = cal(P) \( \( a \, a + 1 \] \)$; if it is included, use $cal(H) = cal(P) \( \[ a \, a + 1 \) \)$. Inside this heart, the cut at $b$ gives a torsion pair $\( cal(T) \, cal(F) \)$ with $cal(F) = cal(P) \( I \)$. Equality at $b$ is assigned to $cal(F)$ exactly when $b in I$. For example, for $I = \( a \, b \)$ it is
  $ cal(T) = cal(P) \( \[ b \, a + 1 \] \) \, #h(2em) cal(F) = cal(P) \( \( a \, b \) \) quad upright("in ") cal(P) \( \( a \, a + 1 \] \) . $
  For $I = \( a \, b \]$ the corresponding torsion class is $cal(P) \( \( b \, a + 1 \] \)$. The lower-closed variants use the other heart above and the same upper-endpoint rule. Hom orthogonality follows from the phase inequality, and the cut triangles have all terms in $cal(H)$, so they give the required short exact decompositions.
  We prove the quasi-abelian assertion directly for a torsion-free class $cal(F)$ in an abelian heart $cal(H)$; this standard fact is also recorded in #cite(label("Tattar2021")) Lemma 3.1. It is closed under subobjects and extensions. For a morphism $f : A arrow.r B$ in $cal(F)$, put $K = ker_(cal(H)) f$, $J = "im"_(cal(H)) f$, and $Q = "coker"_(cal(H)) f$. The kernel in $cal(F)$ is $K$, and the cokernel is $Q \/ t \( Q \)$, where $t \( Q \)$ denotes the torsion part of $Q$. Indeed, maps from $Q$ to an object of $cal(F)$ annihilate $t \( Q \)$; this proves the cokernel’s universal property. Both $K$ and $J$ lie in $cal(F)$. Consequently the internal coimage of $f$ is $J$, whereas its internal image is the preimage of $t \( Q \)$ under $B arrow.r Q$.
  Recall that a morphism is strict if its canonical coimage-to-image map is an isomorphism. The preceding formulas show that a strict monomorphism in $cal(F)$ is exactly a monomorphism in $cal(H)$ whose cokernel belongs to $cal(F)$. A strict epimorphism in $cal(F)$ is exactly an epimorphism in $cal(H)$ between its objects: for an internal epimorphism the internal image is $B$, and strictness says precisely that $J = B$. This statement is about strict epimorphisms, not all epimorphisms of the subcategory.
  The pushout in $cal(H)$ of a strict monomorphism $A arrow.r.hook B$ along $A arrow.r A'$ fits into
  $ 0 arrow.r A' arrow.r B' arrow.r B \/ A arrow.r 0 . $
  Both outside terms are in $cal(F)$, so $B' in cal(F)$ and the new monomorphism is strict. The pullback in $cal(H)$ of a strict epimorphism $A arrow.r.twohead B$ along $B' arrow.r B$ is a subobject of $A xor B'$, hence lies in $cal(F)$, and its projection to $B'$ is an ambient epimorphism, hence strict. These ambient universal properties remain universal in the full subcategory $cal(F)$. Thus kernels and cokernels exist, pushouts preserve strict monomorphisms, and pullbacks preserve strict epimorphisms. This proves quasi-abelianity and the stated description of strict exact sequences. ◻
]

#thm([Proposition 4.9.])[
  (Local finiteness).  #emph[Every phase interval of width less than one generates a finite-length quasi-abelian category. Hence the slicing in Proposition 16 is locally finite.]
] <prop:local-finiteness>

#proof[
  Let $I$ have endpoints $a lt.eq b$ and width $w = b - a < 1$, and put
  $ q_I \( z \) = "Re" #scale(x: 120%, y: 120%)[\(] e^(- i pi \( a + b \) \/ 2) z #scale(x: 120%, y: 120%)[\)] \, #h(2em) d_I = ell / C cos \( pi w \/ 2 \) > 0 \, $
  where $ell$ is the full-lattice norm lower bound used in Lemma 14. A nonzero semistable $F$ of phase in $I$ has nonzero numerical class, since its charge is nonzero. Therefore (4.13) gives
  $ q_I \( Z \( F \) \) gt.eq cos \( pi w \/ 2 \) \| Z \( F \) \| gt.eq d_I . $
  Every nonzero object of $cal(P) \( I \)$ is a finite extension of nonzero semistable objects with phases in $I$. Additivity thus gives the same lower bound $q_I \( Z \( E \) \) gt.eq d_I$ for every such object.
  By Lemma 18, a strict exact sequence in $cal(P) \( I \)$ is exact in its ambient heart, so the projection $q_I Z$ is additive on it. Every nonzero successive quotient in a strict filtration of a fixed $E in cal(P) \( I \)$ is again an object of $cal(P) \( I \)$ and consumes at least $d_I$ of this projection. The number of such quotients is consequently at most $q_I \( Z \( E \) \) \/ d_I$. This bounds both increasing and decreasing strict subobject chains, and proves finite length in the quasi-abelian exact structure. The argument uses discreteness of the full numerical lattice; it requires no discreteness of its image under $Z$. ◻
]

The charge is numerical and normalized on point sheaves by Proposition 4; its eigencharge identity combines with (4.12). Proposition 16, Lemma 17, and Proposition 19 give all slicing, Harder–Narasimhan, and local-finiteness requirements. Finally (4.13) is the support property on the #emph[full] space $K_(upright("num")) \( X \)_(bb(R))$. This completes the proof of Theorem 1.

== 5 A relative-kernel proof of periodicity <app:periodicity>

#proof[
  Write $T_j = T_(cal(O)_X \( j \))$ and $L = \( - ⊗ cal(O)_X \( 1 \) \)$. We interpret the twist as the Fourier–Mukai transform whose kernel is the cone of the evaluation map
  $ cal(O)_X \( - j \) times.square cal(O)_X \( j \) arrow.r cal(O)_Delta . $
  We take cones in the standard enhancement by complexes of perfect kernels, so that the evaluation squares below induce maps of cones. Their transforms give natural transformations of functors. Tensoring the evaluation kernel gives $L T_j L^(- 1) tilde.eq T_(j + 1)$, and hence
  #[#set math.equation(numbering: n => "(5.1)")
   $ Phi^5 tilde.eq T_0 T_1 T_2 T_3 T_4 L^5 . $ <eq:twist-product>]
  We will identify the kernel of $T_0 T_1 T_2 T_3 T_4$ with $cal(O)_Delta \( - 5 \) \[ 2 \]$, where the twist is in the second factor.
  Keep the first copy of $X$ as a source parameter. Set
  $ f = 1_X times i : X times X arrow.r X times upright(bold(P))^4 \, #h(2em) p : X times upright(bold(P))^4 arrow.r X \, quad q : X times X arrow.r X . $
  Here $p$ and $q$ are the first projections. The kernel convention is that $F in D^(upright(b)) \( "Coh" \( X times Y \) \)$ sends $E$ to $R pi_(Y *) \( pi_X^(*) E ⊗^(upright(bold(L))) F \)$. For such a kernel, let
  $ a_j^Y \( F \) = R pi_(X *) #scale(x: 120%, y: 120%)[\(] F ⊗ pi_Y^(*) cal(O)_Y \( - j \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) sans(L)_j^Y \( F \) = "Cone" #scale(x: 120%, y: 120%)[\(] a_j^Y \( F \) times.square cal(O)_Y \( j \) arrow.r F #scale(x: 120%, y: 120%)[\)] . $
  The arrow is the adjunction evaluation. Projection formula and proper base change show that $sans(L)_j^Y \( F \)$ represents postcomposition of the transform of $F$ with the evaluation cone for $cal(O)_Y \( j \)$. Indeed, on an input $E$ the first kernel in this cone gives
  $ R Gamma #scale(x: 120%, y: 120%)[\(] X \, E ⊗^(upright(bold(L))) a_j^Y \( F \) #scale(x: 120%, y: 120%)[\)] ⊗ cal(O)_Y \( j \) tilde.eq R "Hom" #scale(x: 120%, y: 120%)[\(] cal(O)_Y \( j \) \, Phi_F \( E \) #scale(x: 120%, y: 120%)[\)] ⊗ cal(O)_Y \( j \) . $
  In particular the source coefficient here is $a_j^Y \( F \)$ itself.
  These coefficient functors let us compare the evaluation cones on $X$ with those on $upright(bold(P))^4$. We will show that the five projective-space evaluations remove all coefficients and leave the zero kernel, while the comparison preserves the cone of the divisor counit. Computing that cone will give the required shift.
  Start with
  $ K_5 = f_(*) cal(O)_Delta \, #h(2em) G_5 = cal(O)_Delta \, #h(2em) u_5 : L f^(*) K_5 arrow.r G_5 $
  given by the counit. For $j = 4 \, 3 \, dots.h \, 0$, form successively
  $ K_j = sans(L)_j^(upright(bold(P))^4) \( K_(j + 1) \) \, #h(2em) G_j = sans(L)_j^X \( G_(j + 1) \) . $
  We construct compatible maps $u_j : L f^(*) K_j arrow.r G_j$ and show that their cones are all isomorphic to $"Cone" \( u_5 \)$.
  For any map $u : L f^(*) K arrow.r G$, the unit followed by $f_(*) u$ gives $K arrow.r f_(*) G$, hence comparison maps
  $ theta_l : a_l^(upright(bold(P))^4) \( K \) arrow.r a_l^X \( G \) . $
  For $\( K_5 \, G_5 \, u_5 \)$ these are isomorphisms for every $l$: the composite $f_(*) cal(O)_Delta arrow.r f_(*) L f^(*) f_(*) cal(O)_Delta arrow.r f_(*) cal(O)_Delta$ is the identity by the adjunction identity. Suppose that, before the step indexed by $j$, the maps $theta_l$ are isomorphisms for $0 lt.eq l lt.eq j$. The evaluation square
  $ q^(*) a_j^(upright(bold(P))^4) \( K_(j + 1) \) ⊗ cal(O)_X \( j \) & arrow.r & L f^(*) K_(j + 1)\
arrow.b tilde.eq &  & arrow.b u_(j + 1)\
q^(*) a_j^X \( G_(j + 1) \) ⊗ cal(O)_X \( j \) & arrow.r & G_(j + 1) $
  commutes by adjunction. Taking its cones defines $u_j$; because its left vertical arrow is an isomorphism, the cone of $u_j$ is isomorphic to the cone of $u_(j + 1)$.
  For $l < j$, apply the coefficient functor $a_l$ to the two evaluation triangles. The comparison on their first terms is
  $ a_j^(upright(bold(P))^4) \( K_(j + 1) \) ⊗ R Gamma \( upright(bold(P))^4 \, cal(O) \( j - l \) \) arrow.r a_j^X \( G_(j + 1) \) ⊗ R Gamma \( X \, cal(O)_X \( j - l \) \) . $
  It is an isomorphism: $theta_j$ is an isomorphism, and the divisor sequence
  $ 0 arrow.r cal(O)_(upright(bold(P))^4) \( m - 5 \) arrow.r cal(O)_(upright(bold(P))^4) \( m \) arrow.r i_(*) cal(O)_X \( m \) arrow.r 0 $
  identifies the two cohomology complexes for $1 lt.eq m lt.eq 4$. The comparison on the middle terms is also an isomorphism by induction, so the remaining maps $theta_l$ stay isomorphisms after the mutation. This proves the induction and the constancy of the cone.
  We next show that $K_0 = 0$. The step indexed by $j$ kills $a_j^(upright(bold(P))^4)$, since $R Gamma \( upright(bold(P))^4 \, cal(O) \) = bb(C)$. It preserves the already vanishing coefficients with indices $k > j$, since $R Gamma \( upright(bold(P))^4 \, cal(O) \( j - k \) \) = 0$ for $1 lt.eq k - j lt.eq 4$. Thus $a_j^(upright(bold(P))^4) \( K_0 \) = 0$ for $0 lt.eq j lt.eq 4$. All these kernels are perfect, and proper base change implies that every derived source fiber $F$ of $K_0$ satisfies
  $ R "Hom"_(upright(bold(P))^4) \( cal(O) \( j \) \, F \) = 0 #h(2em) \( 0 lt.eq j lt.eq 4 \) . $
  The exact Koszul complex of the five homogeneous coordinates propagates these five consecutive vanishings to $R Gamma \( upright(bold(P))^4 \, F \( n \) \) = 0$ for every integer $n$. For sufficiently large $n$, Serre vanishing and global generation, applied to the finitely many cohomology sheaves of $F$, force all those sheaves to vanish. Therefore every derived source fiber is zero, and the derived Nakayama lemma gives $K_0 = 0$. It follows that
  $ G_0 tilde.eq "Cone" \( u_0 \) tilde.eq "Cone" \( u_5 \) . $
  Finally, $f$ is a Cartier divisor embedding with normal bundle $cal(O)_X \( 5 \)$ in the target variable. Its two-term divisor resolution computes
  $ cal(H)^(- 1) \( L f^(*) f_(*) cal(O)_Delta \) = cal(O)_Delta \( - 5 \) \, #h(2em) cal(H)^0 \( L f^(*) f_(*) cal(O)_Delta \) = cal(O)_Delta \, $
  with no other cohomology sheaves. The counit $u_5$ induces the identity in degree zero. Consequently its cone has the single cohomology sheaf $cal(O)_Delta \( - 5 \)$ in degree $- 2$, and
  $ G_0 tilde.eq cal(O)_Delta \( - 5 \) \[ 2 \] . $
  Since $G_0$ is the composition kernel for $T_0 T_1 T_2 T_3 T_4$, this is an isomorphism of kernels and therefore a natural functor isomorphism. Equation (5.1) now gives $Phi^5 tilde.eq \[ 2 \]$. The asserted inverse follows by composing this relation with $\[ - 2 \]$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
