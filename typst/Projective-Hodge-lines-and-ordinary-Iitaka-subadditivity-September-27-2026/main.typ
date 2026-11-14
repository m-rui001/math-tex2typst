#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Projective-Hodge-lines-and-ordinary-Iitaka-subadditivity-September-27-2026]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Let $f : X arrow.r Z$ be a surjective morphism with connected fibres between smooth projective varieties.
  The pluricanonical forms on $X$ measure its birational complexity.
  Iitaka’s subadditivity problem asks whether the forms on the base and on the geometric generic fibre always
  contribute additively to that complexity. More precisely,
  the Kodaira dimension $kappa \( X \)$ is the maximum dimension of the images of the complete linear systems $\|
  m K_X \|$, for positive integers $m$; it is $- oo$ if every such system is empty.
  If $F$ is the geometric generic fibre of $f$, the conjecture $C_(n \, m)$ asks for

$ kappa \( X \) gt.eq kappa \( F \) + kappa \( Z \) \, wide n = dim X \, quad m = dim Z . $

We use $\( - oo \) + a = - oo$ and $kappa \( upright("point") \) = 0$.

The problem belongs to Iitaka’s theory of dimensions of divisors #cite(label("IitakaOriginal")).
  Its development has repeatedly connected the growth of pluricanonical systems with positivity on the base.
  Viehweg’s weak-positivity method gives addition when the base is of general type
  #cite(label("ViehwegAdditivity")). Kawamata proved addition over curves and when the general fibre has a good
  minimal model #cite(label("KawamataCurves")) #cite(label("KawamataKodaira"));
  Kollár established the case of general-type fibres #cite(label("Kollar87")).
  The log-general-type-fibre theorem of Kovács–Patakfalvi and its formulation by Hashizume provide the addition
  theorem used below #cite(label("KovacsPatakfalvi")) #cite(label("Hashizume")).

Birkar proved the conjecture in total dimension at most six #cite(label("BirkarIitakaSix")).
  Using canonical-bundle and nonvanishing methods, Chang extended this to total dimension at most seven under the
  additional assumption $kappa \( X \) gt.eq 0$ #cite(label("ChangNonvanishing")) Theorem 1.8.
  Other advances include Cao–Păun’s theorem for projective klt pairs over abelian varieties,
  Hacon–Popa–Schnell’s result for bases of maximal Albanese dimension,
  and Cao’s theorem for projective klt pairs over surfaces #cite(label("CaoPaunAbelian"))
  #cite(label("HaconPopaSchnellAbelian")) #cite(label("CaoSurfaces")).
  These results show how information about the base and positivity of direct images can control the total
  pluricanonical system. Tsuji’s preprint states ordinary subadditivity in Theorem 1.13,
  while Maehara’s preprint states a broader variation inequality in Section 7,
  Theorem 8 #cite(label("TsujiDirectImages")) #cite(label("MaeharaIitaka")).
  Those preprint claims are not inputs to our proof. The argument here is a projective proof through a Hodge line
  and a canonical bundle formula.

#thm([Theorem 1.1.])[
  (Ordinary Iitaka subadditivity).  #emph[ Let $k$ be an algebraically closed field of characteristic zero,
    and let $f : X arrow.r Z$ be a surjective projective morphism with connected fibres between smooth connected
    projective $k$-varieties. If $F$ is its geometric generic fibre, then
$ kappa \( X \) gt.eq kappa \( F \) + kappa \( Z \) . $

]
] <thm:ordinary>

Thus the ordinary Iitaka conjecture has a positive answer in this setting.
  The main step in the proof is a positivity statement for the entire highest Hodge line of a rationally polarized
  variation. We first describe that statement, then explain how the canonical bundle formula brings it into the
  subadditivity problem.

Let $Y$ be a smooth connected projective complex variety and $U$ a dense open subset.
  A rationally polarized integral pure variation $bb(V)$ on $U$ consists of a rational local system with a
  monodromy-invariant lattice, a Hodge filtration of fixed weight, and a rational flat polarization.
  Suppose its highest nonzero filtration step $F^p bb(V)_(cal(O))$ is a line, so $F^(p + 1) = 0$ and $"rank" F^p =
  1$. On a simply connected open set, a flat marking identifies this line with a holomorphic map to the projective
  space of a fixed reference fibre. We call this the #emph[highest-line map].
  The #emph[full period map] records every step of the Hodge filtration.

The highest line has a rational parabolic extension across a smooth normal-crossing compactification.
  This is the extension whose pullback, after a finite level cover and resolution making local monodromy
  unipotent, is the Deligne–Schmid highest line. The rational weights retain the finite parts of the original
  local monodromies.

#thm([Theorem 1.2.])[
  (Projective adjoint positivity).  #emph[ Let $Y$ be a smooth connected projective complex variety,
    let $U subset Y$ be a dense Zariski open subset, and let $bb(V)$ be a rationally polarized integral pure
    variation of Hodge structure on $U$ whose entire highest nonzero Hodge filtration step is a line.
    Let $M in "Pic" \( Y \) ⊗ upright(bold(Q))$. Assume that,
    after a smooth projective birational modification of $Y$ if necessary,
    there are a smooth projective alteration $tau : hat(Y) arrow.r
    Y$ and a rational number $c > 0$ such that the pulled-back variation has unipotent monodromy along a
    simple-normal-crossing boundary and
$ tau^(*) M tilde.op_(upright(bold(Q))) c J_(hat(Y)) \, $

 where $J_(hat(Y))$ is its extended highest line. After further smooth projective birational modification,
   there are a surjective morphism $p : Y arrow.r S$ with connected fibres onto a smooth projective variety and a
   nef rational line $L$ on $S$ such that
$ M tilde.op_(upright(bold(Q))) p^(*) L \, wide K_S + j L upright(" is big for all sufficiently large integers ") j . $

 If $S$ is a point, the conclusion is $M tilde.op_(upright(bold(Q))) 0$.]
] <thm:adjoint>

The two period maps have separate jobs. The full period image provides the projective base on which an adjoint
  divisor can be big. The numerical dimension of $L$ is measured by the highest-line map,
  whose rank can be smaller. The argument must therefore remove the boundary using the rank of the line,
  without identifying it with the dimension of the full period image.

=== 1.1 The boundary obstruction and its resolution <the-boundary-obstruction-and-its-resolution>

The algebraicity theorem of Bakker–Brunebarbe–Tsimerman constructs the full period image as an algebraic variety
  #cite(label("BakkerBrunebarbeTsimerman")) Theorem 1.1. At a neat level,
  Brunebarbe–Cadorel’s theorem gives logarithmic general type when the full period map is generically immersive
  #cite(label("BrunebarbeCadorel")) Theorem 1.1. A finite quotient returns to the original level.
  This introduces a second divisor to be removed: besides the boundary with nonzero monodromy logarithm,
  there is divisorial ramification of the finite quotient. Ordinary adjoint positivity requires control of both.

We first retain the smallest rational subvariation containing the highest line.
  This is the pure transcendental-part construction of Bakker–Filipazzi–Mauri–Tsimerman #cite(label("BFMT"))
  Definition 2.9. Rational minimality has a useful consequence:
  a connected rational normal subgroup of monodromy that fixes the line pointwise must be trivial.
  Together with André’s monodromy normality theorem #cite(label("AndreMonodromy")) §5 and the fixed-part results
  of Griffiths, Deligne, and Schmid #cite(label("DeligneHodgeII")) added note to 4.2.6 and 4.2.8(i),(ii)
  #cite(label("Schmid")) Theorem 7.22 and Corollary 7.23, it also detects a flat automorphism that is scalar on
  all highest lines and preserves one full period. Such an automorphism preserves every full period.

The local analytic step concerns a family of holomorphic maps approaching a divisor.
  If its limiting tangential rank equals the full rank in the interior,
  then its nearby image is already contained in the limiting image.
  At a nilpotent degeneration, the limiting line is in the kernel of the monodromy logarithm;
  rational minimality rules out equality of ranks. At a divisor fixed by finite inertia,
  the limiting lines lie in one eigenspace. The same rank principle and the fixed-part theorem would make the
  inertia element fix the entire full period image.

For this last contradiction we use the normalization of the #emph[actual] period image.
  The finite group acts effectively on its function field. Equality of the full periods therefore forces the
  inertia element to be the identity. A further finite cover of the image could have a nontrivial automorphism
  acting trivially on every period, so connected-fibre factorization is taken only after this argument.
  Sections 2–4 give the rational, analytic, and finite-quotient parts of this rank loss in that order.

Once the ranks drop, elementary section counting removes the boundary and divisorial ramification.
  If the highest-line map has generic rank $r$, the ample perturbation in the interior supplies a polynomial of
  degree $r$ in a large multiple of $L$, whereas the restriction polynomials on those divisors have degree at most
  $r - 1$. Effective divisors exceptional over the quotient do not change its section growth.
  This yields the adjoint positivity in Theorem 2.

=== 1.2 From the period theorem to ordinary subadditivity <from-the-period-theorem-to-ordinary-subadditivity>

For the nonvacuous case of Theorem 1, put $d = kappa \( F \) gt.eq 0$ and assume $kappa \( Z \) gt.eq 0$.
  The relative Iitaka fibration factors a birational model of $X$ through a variety $Y$ with $dim \( Y \/ Z \) =
  d$ and Kodaira-dimension-zero generic fibre over $Y$. The canonical bundle formula separates the singular-fibre
  contribution from a nef moduli divisor:

$ K_(tilde(X)) tilde.op_(upright(bold(Q))) g^(*) \( K_Y + B + M \) + R \, wide tilde(X) arrow.r^g Y arrow.r^q Z . $

Here $B$ is an effective klt boundary, and the residual divisor $R$ has the direct-image and exceptionality
  properties needed to compare complete pluricanonical systems.
  This is the strategy of Fujino–Mori’s canonical bundle formula,
  with the birational discriminant and moduli theory of Ambro #cite(label("FujinoMori")) Theorem 4.5
  #cite(label("AmbroBoundary")) #cite(label("AmbroModuli")).

The least-index canonical root cover of the Kodaira-zero fibre has geometric genus one.
  Its unique top form is therefore the entire highest line of a rational variation,
  even if the character of the cyclic covering group is not rational.
  The Hodge realization of $M$ matches its extension on an alteration, not only its restriction to the open base.
  These facts place $M$ within Theorem 2. The auxiliary sub-boundary in this formula can be negative on the
  generic fibre; the argument uses nefness and the Hodge realization,
  not a semiampleness assertion requiring an effective generic boundary.

The section comparison gives

$ kappa \( X \) gt.eq kappa \( Y \, K_Y + B + M \) \, wide \( K_Y + B + M \) \|_(Y_(macron(eta))) upright(" big") \, $

where $Y_(macron(eta))$ is the geometric generic fibre of $q$.
  The period projection writes $M = p^(*) L$ for a morphism $p : Y arrow.r S$.
  Write $mu : tilde(X) arrow.r X$ for the birational modification of the original source in the relative Iitaka
  construction. Figure 1 separates the two maps from $Y$: their bases need not map to one another.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$tilde(X)$])
  content((2.057, 0), [$Y$])
  content((4.115, 0), [$S$])
  content((2.057, -1.585), [$Z$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$g$]])
  line((0.2108, -0.1625), (1.847, -1.423), mark: (end: ">"))
  content((0.818, -1.066), [#text(size: 0.73em)[$f mu$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((2.38, -0.7927), [#text(size: 0.73em)[$q$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  content((3.086, 0.2266), [#text(size: 0.73em)[$p$]])
})],
  caption: [Figure 1: The relative Iitaka map $g$ has Kodaira-dimension-zero generic fibre. The original base map $q$ and the independent period map $p$ start from the same variety $Y$. The divisor $M = p^(*) L$ comes from $S$, while the desired addition inequality is measured over $Z$. ],
) <fig:two-bases>

A product-map argument first gives log pluricanonical nonvanishing on a general fibre of $p$.
  Fujino’s twisted weak positivity then turns the big divisor $K_S + j L - H$, for an ample $H$ and large $j$,
  into an effective divisor linearly equivalent to $K_Y + B + j M -
  p^(*) H$ #cite(label("FujinoWeakPositivity")) Theorem 1.1.
  Interpolating this divisor with an effective klt log canonical class reduces the desired inequality to the
  established addition theorem for log-general-type fibres #cite(label("Hashizume")) Theorem 2.11.
  Scalar extension of each pluricanonical space transfers the result from $upright(bold(C))$ to any algebraically
  closed field of characteristic zero.

There are two further proofs of the Hodge-line boundary estimate in the projective setting.
  An integral tensor replacement makes monodromy faithful on the moving highest line;
  projection to a fixed quotient by a monodromy logarithm then produces transverse loops on which the line is
  constant. A second calculation obtains the restriction-intersection bound directly from Hodge curvature:
  smooth Thom forms concentrate on a boundary divisor, and a product Poincaré estimate controls their limits at
  crossings. These two calculations share the integral tensor replacement and the transverse-loop criterion;
  the second supplies a different proof of the boundary restriction-intersection step.
  These arguments retain the same whole-top-line hypothesis but isolate different mechanisms behind the boundary
  estimate. In the main route, rational minimality and the tangential rank principle treat the finite quotient on
  the actual period image directly.

=== 1.3 Organization <organization>

Section 2 constructs the rationally minimal variation and proves the fixed-period criterion.
  Section 3 compares numerical rank with boundary limits and proves the tangential rank principle.
  Section 4 applies these results to boundary monodromy and divisorial ramification.
  Section 5 constructs the actual period quotient and completes the proof of adjoint positivity.
  Section 6 gives the canonical bundle data, the least-index root cover, and the section-growth comparison.
  Section 7 proves ordinary subadditivity and gives the scalar-extension argument in characteristic zero.
  Section 8 proves the integral tensor replacement and the alternative adjoint argument by transverse loops.
  Section 9 proves the restriction-intersection estimate using Thom forms, including the crossing calculation.

=== 1.4 Conventions <conventions>

An algebraic fibre space is a surjective projective morphism with connected fibres.
  All varieties in the Hodge-theoretic argument are over $upright(bold(C))$.
  Divisors and line-bundle identities are rational unless otherwise specified,
  and section comparisons are taken in degrees clearing all denominators.
  We write $A tilde.op_(upright(bold(Q))) B$ when a positive integral multiple of $A - B$ is principal.
  An effective rational class means a class rationally linearly equivalent to an effective divisor.
  The positive and negative parts of a rational divisor have disjoint support.
  Numerical dimension is used only for nef divisors and is defined in Section 3.

== 2 Rational minimality and fixed periods <sec:rational>

Our objective is to recognize when a symmetry that fixes all highest lines must fix the full periods.
  We first discard the rational subvariations that do not contribute to the highest line.
  Rationality is essential: the invariant spaces of rational normal monodromy subgroups will then be Hodge
  substructures.

Let $U$ be a smooth connected complex algebraic variety and let
  $V = \( V_(upright(bold(Z))) \, F^bullet V_(cal(O)) \, Q \)$ be a polarized integral pure variation of Hodge
  structure of weight $w$. Integral means that the underlying rational local system has a monodromy-invariant
  lattice; the polarization is rational and need not be integral.
  Write $m$ for the largest index with $F^m V_(cal(O)) eq.not 0$,
  and assume throughout that $"rk" F^m V_(cal(O)) = 1$. We call this piece the #emph[Hodge line].
  On a simply connected flat chart its inclusion in $V_(cal(O))$ defines a holomorphic map

$ ell : U_(upright("loc")) arrow.r bb(P) \( V_(upright(bold(C)) \, u) \) . $

Changes of flat chart compose $ell$ with a constant projective linear transformation,
  so its differential rank is intrinsic.

=== 2.1 The smallest rational subvariation <the-smallest-rational-subvariation>

We call a lifted point #emph[Hodge-generic] if it lies outside every proper Hodge locus of a rational flat tensor
  in tensor constructions on the variation and its dual. These are countably many closed analytic loci on the
  universal cover. Their complement is dense by the Baire theorem.
  Only this analytic genericity is needed in the Hodge arguments.

#thm([Lemma 2.1.])[
  (Rationally minimal variation).  #emph[There is a unique smallest rational subvariation $V^min subset
    V_(upright(bold(Q)))$ whose Hodge filtration contains $F^m V_(cal(O))$.
    At a Hodge-generic point, its fibre is the smallest rational Hodge substructure containing the Hodge line,
    and that fibre is simple. The subvariation has an induced polarization and integral lattice.
    On a smooth compactification with unipotent boundary monodromy, its extended Hodge line agrees with that of $V$.]
] <altord:h:minimal>

#proof[
  In a polarizable rational Hodge structure, intersect all rational Hodge substructures containing the specified
    line. A finite intersection already attains the minimum dimension, and gives the unique smallest one, say $W$.
    Semisimplicity shows that $W$ is simple: in a decomposition into simple summands exactly one summand can have
    a nonzero deepest Hodge piece, since that piece has dimension one, and that summand already contains the line.
  Here is also the generic-fibre justification, which is useful when passing between variations and individual
    Hodge structures. Trivialize the rational local system on the connected universal cover of $U$.
    For each rational endomorphism $e$, the condition that $e$ preserve every $F^p$ is closed analytic.
    Choose a lifted point outside all such loci which are proper.
    A rational Hodge projector onto $W$ at this point therefore preserves the filtration everywhere on the cover.
    Its action on the Hodge line is the identity everywhere: it is an idempotent on a line bundle,
    and equals the identity at the chosen point. Its constant image is thus a subvariation containing the line.
    At every other point chosen in the same way, applying the argument in both directions shows that its image is
    again the smallest Hodge substructure containing the line.
    Uniqueness and the deck action now imply monodromy invariance, so this subvariation descends to $U$.
    Any rational subvariation containing the line contains it, by inspection at the chosen point.
  Restriction of $Q$ to a Hodge substructure is nondegenerate,
    and $V^min ∩ V_(upright(bold(Z)))$ supplies the lattice. The polarization gives a complementary subvariation
    whose deepest Hodge piece is zero. Canonical extensions preserve this direct sum, proving the last claim.
    This is the pure case of the transcendental-part construction of #cite(label("BFMT")) Definition 2.9. ◻
]

=== 2.2 From a fixed highest line to a fixed full period <from-a-fixed-highest-line-to-a-fixed-full-period>

A variation is #emph[minimal for its highest line] if the generic fibre is the smallest rational Hodge
  substructure containing that line. Lemma 3 supplies this replacement without changing the line.
  The next two lemmas explain what this minimality buys. We use the usual Mumford–Tate group of a rational Hodge
  structure: the smallest rational algebraic group through which its Hodge homomorphism factors.

#thm([Lemma 2.2.])[
  (Normal subgroups and the deepest line).  #emph[Let $bb(V)$ be a rationally polarized integral pure variation on
    a smooth connected complex algebraic variety, minimal for its deepest Hodge line.
    In a flat trivialization on the universal cover, let $G subset
    upright("GL") \( V \)$ be connected algebraic monodromy and let $P =
    "MT" \( V \)$ be the generic Mumford–Tate group. If $H subset
    G$ is a connected normal algebraic subgroup defined over $upright(bold(Q))$,
    and $V_(upright(bold(C)))^H$ contains the deepest line at a Hodge-generic lifted point, then $H$ is trivial.]
] <altord:p:normality>

#proof[
  The monodromy and fixed-part theorems give that $G$ is semisimple and normal in the connected reductive group
    $P$; see #cite(label("AndreMonodromy")) §5, Theorem 1 and Corollary 1.
    Over an algebraic closure, a connected normal subgroup of a semisimple group is the product of a collection of
    its almost simple factors. Conjugation by $P$ preserves $G$.
    Since $P$ is connected, it acts trivially on the finite set of these factors, and therefore preserves $H$.
  Consequently $V^H$ is a rational $P$-subrepresentation. It is a rational Hodge substructure at a Hodge-generic
    point, and it contains the deepest Hodge line. Minimality gives $V^H = V$.
    The inclusion $G subset upright("GL") \( V \)$ is faithful, so $H = 1$. ◻
]

#thm([Lemma 2.3.])[
  (A flat automorphism over a fixed point).  #emph[Let $U$ be a smooth connected complex algebraic variety with a
    rationally polarized integral pure variation $bb(V)$ minimal for its deepest Hodge line.
    Suppose that an automorphism $b$ of $U$ fixes a point $e$, and that there is a flat isomorphism of variations
$ Phi_y : V_y arrow.r V_(b \( y \)) . $

 Use the fibre $V_e$ as the flat reference space, and put $a = Phi_e$.
   If, on a nonempty open subset of the universal cover, all deepest Hodge lines lie in a single eigenspace of
   $a$, then $a$ preserves the complete Hodge filtration at every lifted point.
   In particular, locally at $e$ the full lifted period maps at $y$ and $b \( y \)$ are equal.]
] <altord:p:inertia>

#proof[
  Write $rho$ for monodromy based at $e$. Flatness and $b \( e \) = e$ give
  $ a rho \( gamma \) a^(- 1) = rho \( b_(*) gamma \) wide \( gamma in pi_1 \( U \, e \) \) . $
  Thus $a$ normalizes both algebraic monodromy and its identity component $G$.
    Let $lambda$ be the eigenvalue in the hypothesis. The condition that the deepest line lies in
    $ker \( a - lambda \)$ is a holomorphic linear condition on the universal cover,
    so it holds throughout that connected cover by analytic continuation.
  Fix a Hodge-generic lifted point and let $W subset V_(upright(bold(C)))$ be the complex span of the monodromy
    orbit of its deepest line. This space is monodromy invariant, hence $G$-invariant.
    Equivariance places every line in this orbit among the deepest lines on the universal cover, so $a \|_W =
    lambda thin upright("id")_W$. Every element $a g a^(- 1) g^(- 1)$, with $g in G$,
    therefore acts trivially on $W$, as do all its $G$-conjugates.
    Let $H$ be their normal algebraic closure in $G$. It is defined over $upright(bold(Q))$,
    since $a$ and $G$ are rational. It is connected: the commutator map from the connected group $G$ has connected
    image containing the identity, and the algebraic subgroup generated by its conjugates is the closure of
    products of such connected sets. Although $W$ need not be rational,
    $V^H$ is rational and contains the chosen deepest line. Lemma 4 gives $H = 1$. Hence $a$ centralizes $G$.
  Pass to the connected finite étale cover $U_1 arrow.r U$ corresponding to the inverse image of $G$ under
    monodromy, and choose $e_1$ over $e$. Since $a$ centralizes all monodromy on $U_1$,
    it extends to a global flat rational section of $"End" \( bb(V) \|_(U_1) \)$.
    The latter is a polarizable pure variation of weight zero.
    The flat section $a$ has Hodge type $\( 0 \, 0 \)$ at $e_1$, since $Phi_e$ is a Hodge isomorphism.
    The base $U_1$ is a smooth algebraic variety and hence a Zariski open subset of a compact complex variety,
    so the fixed-part theorem applies. By #cite(label("Schmid")) Theorem 7.22 and Corollary 7.23,
    $a$ has type $\( 0 \, 0 \)$ everywhere. Thus $a$ preserves the full filtration on the universal cover.
  For completeness, take the lift of $b$ to the universal cover fixing a chosen lift of $e$.
    Flatness of $Phi$ gives $F^bullet \( b tilde(y) \) = a F^bullet \( tilde(y) \)$ in the reference space.
    The assertion just proved makes the right-hand side equal to $F^bullet \( tilde(y) \)$. ◻
]

== 3 Numerical rank and tangential limits <sec:limits>

We now compare a boundary restriction of the extended highest line with the limiting projective line map.
  The Hodge-theoretic input identifies the limiting graded line.
  The analytic rank principle then decides what would happen if its tangential rank did not drop.
  For a nef line $J$ on a smooth projective $t$-fold we use

$ nu \( J \) = max { a in { 0 \, dots.h \, t } : c_1 \( J \)^a H^(t - a) > 0 } \, $

where $H$ is ample. A line on a point has numerical dimension zero.

Let $U$ and its variation be as in Section 2. Take a smooth projective compactification $T$ of $U$ with reduced
  simple normal crossings boundary $D$, and suppose that all local monodromies along $D$ are unipotent.
  Denote the Deligne extension by $overline(V)$ and the Schmid extension of the Hodge line by $J =
  F^m overline(V)$. We use the following standard inputs.

#thm([Theorem 3.1.])[
  (Extension and positivity inputs).  #emph[Under these hypotheses:]
  + #emph[The extended Hodge filtration is by subbundles of $overline(V)$.
    For a morphism $g : \( T' \, D' \) arrow.r \( T \, D \)$ of smooth projective varieties with reduced simple
    normal crossings boundaries and $g \( T' \\ D' \) subset U$,
    the extended Hodge line of $g^(*) V$ is $g^(*) J$. These extensions commute with direct sums and tensor
    products. If the monodromy logarithms of some boundary components vanish,
    the variation extends purely across those components, including their crossings away from the remaining boundary.]
  + #emph[The line $J$ is nef. It is big precisely when the top Kodaira–Spencer map
$ T_U arrow.r "Hom" \( F^m V_(cal(O)) \, F^(m - 1) V_(cal(O)) \/ F^m V_(cal(O)) \) $

 is generically injective, equivalently when $ell$ is generically immersive.]
  #emph[The first assertions are the unipotent extension and nilpotent-orbit theorems of #cite(label("Schmid"))
    #cite(label("CKS")); functoriality is also recorded in #cite(label("BFMT")) Lemmas 2.16 and 5.6.
    The second assertion is #cite(label("BakkerBrunebarbeTsimerman")) Lemma 6.17.]
] <altord:h:inputs>

The equivalence in the second assertion uses Griffiths transversality:
  the differential of the line map is the indicated Kodaira–Spencer map followed by the inclusion of $F^(m - 1) \/
  F^m$ in $V_(cal(O)) \/ F^m$.

#thm([Proposition 3.2.])[
  (Numerical rank).  #emph[If $r = "rk"_(upright("gen")) d ell$, then
#[#set math.equation(numbering: n => "(3.1)")
 $ nu \( J \) = r . $ <altord:h:eq-numerical-rank>]

]
] <altord:h:numerical-rank>

#proof[
  Put $t = dim T$, and fix an ample divisor $H$ on $T$. For $1 lt.eq a lt.eq t$,
    choose a sufficiently general smooth complete intersection $C_a subset T$ of dimension $a$,
    using a sufficiently large multiple of $H$. It meets the boundary transversely.
    At general points of $C_a ∩ U$, the restriction of $d ell$ to $T_(C_a)$ has rank $min \( a \, r \)$.
    To see the required genericity, at a point where $d ell$ has rank $r$,
    the $a$-planes with this property form a nonempty open subset of the tangent Grassmannian.
    A sufficiently ample linear system prescribes the required first-order tangent conditions;
    Bertini then gives the assertion for general complete intersections.
    By Theorem 6, $J \|_(C_a)$ is big exactly when $a lt.eq r$.
    Since it is nef, this is equivalent to $\( J \|_(C_a) \)^a > 0$, and hence to $c_1 \( J \)^a H^(t - a) > 0$.
    This proves the formula, also when $r = 0$; dimension zero is immediate. ◻
]

=== 3.1 The limiting line along a divisor <the-limiting-line-along-a-divisor>

We recall the boundary input in the form needed here. Let $E$ be a component of $D$, let $E^compose =
  E \\ "Supp" \( D - E \)$, and let $N$ be its monodromy logarithm.
  The monodromy weight filtration $W \( N \)$ is centred at $w$.
  The limiting filtration induces polarized pure variations on its graded pieces over $E^compose$,
  with unipotent monodromy at the remaining boundary. If $k$ is the unique weight carrying the deepest line,
  then $J \|_E$ is the Schmid extension of the top line of $"Gr"_k^(W \( N \))$.
  These statements include compatibility at deeper strata; see #cite(label("BFMT")) §2.5.2–§2.5.3 and
  Lemma 2.16(3). For a single $N$, the relevant primitive summand is polarized by the form induced by
  $Q \( - \, N^(k - w) - \)$ when $k gt.eq w$.

The local expression below is Schmid’s nilpotent-orbit normal form #cite(label("Schmid")) Theorem 4.12;
  its compatibility at crossings uses #cite(label("CKS")). The rank comparison is the consequence needed here.

#thm([Proposition 3.3.])[
  (Boundary line).  #emph[On a transverse coordinate chart $\( u \, v \)$ about a general point of $E$,
    with $E = \( u = 0 \)$, write a generator of the lifted Hodge line as
#[#set math.equation(numbering: n => "(3.2)")
 $ e^(z N) a \( u \, v \) \, wide z = frac(log u, 2 pi i) \, $ <altord:h:nilpotent-expression>]

 where $a$ is holomorphic across $u = 0$ and $a \( 0 \, v \) eq.not 0$.
   After shrinking the chart there is an integer $ell gt.eq 0$ such that
#[#set math.equation(numbering: n => "(3.3)")
 $ N^(ell + 1) a \( 0 \, v \) = 0 \, wide N^ell a \( 0 \, v \) eq.not 0 \, $ <altord:h:primitive-line>]

 and the line belongs to weight $w + ell$ in the limiting mixed Hodge structure. Moreover,
#[#set math.equation(numbering: n => "(3.4)")
 $ nu \( J \|_E \) lt.eq "rk"_(upright("gen")) d #scale(x: 120%, y: 120%)[\(] v mapsto \[ N^ell a \( 0 \, v \) \]
   #scale(x: 120%, y: 120%)[\)] . $ <altord:h:boundary-rank>]

 The map on the right is formed in the chosen flat coordinates.
   If $N = 0$, take $ell = 0$; the variation then extends purely near the general point of $E$.]
] <altord:h:boundary-line>

#proof[
  Put $a_0 = a \( 0 \, v \)$. In the Deligne bigrading of the limiting mixed Hodge structure,
    $F^m$ is a single one-dimensional summand $I^(m \, q)$: all first indices are at most $m$, and $dim F^m = 1$.
    Set $ell = m + q - w$. The primitive decomposition on weight $w + ell$ expresses each summand as a sum of terms
  $ N^j P_(w + ell + 2 j) \, wide j gt.eq max \( 0 \, - ell \) \, $
  where $P_(w + b)$ denotes the primitive part for $b gt.eq 0$.
    A contribution to Hodge type $\( m \, q \)$ with $j > 0$ would come from type $\( m + j \, q + j \)$,
    impossible because its first index exceeds $m$. Thus $j = 0$, $ell gt.eq 0$, and the top line is primitive.
    Hard Lefschetz for the monodromy weight filtration gives nonvanishing of its image under $N^ell$ and vanishing
    under $N^(ell + 1)$ on the associated graded. Since $N$ has bidegree $\( - 1 \, - 1 \)$ in the Deligne
    bigrading, these statements hold for $a_0$ itself: a vector in a single Deligne summand maps injectively to
    its weight-graded piece. The integer $ell$ is constant on a sufficiently small open stratum,
    so the identities hold throughout the chosen $v$-chart.
  Let $J_E^(upright("gr"))$ be the extended top line of the pure variation on $"Gr"_(w + ell)^(W \( N \))$ along
    $E^compose$. The boundary extension input identifies it with $J \|_E$.
    Projecting $N^ell a_0$ to $"Gr"_(w - ell)^(W \( N \))$ yields the image of this graded top line under the flat
    isomorphism
  $ N^ell : "Gr"_(w + ell)^(W \( N \)) arrow.r "Gr"_(w - ell)^(W \( N \)) . $
  Consequently the projective map of the graded line has rank no greater than $v mapsto \[ N^ell a_0 \( v \) \]$:
    projection is a fixed linear map on the flat chart, defined near the line in question.
    Apply Proposition 7 to the graded variation on $E^compose$ and its smooth projective compactification $E$.
    This proves (3.4). ◻
]

=== 3.2 A local rank principle <a-local-rank-principle>

The boundary-line proposition has reduced the numerical question to a projective differential.
  We next prove the local assertion that will force a symmetry to fix the interior whenever the limiting rank is
  as large as the interior rank. This analytic fact requires control of tangential derivatives only.
  A sector below has the form $S_epsilon.alt = { 0 < \| u \| < epsilon.alt \, med
  alpha < arg u < beta }$ with a fixed branch of the argument and finite opening $beta - alpha < 2 pi$.

#thm([Lemma 3.4.])[
  (Rank and a tangential limit).  #emph[Let $B subset upright(bold(C))^n$ be a polydisc and let $f :
    S_epsilon.alt times B arrow.r M$ be a holomorphic map to a complex manifold.
    Suppose $f \( u \, dot.op \)$ converges uniformly on compact subsets of $B$, as $u arrow.r
    0$ throughout the sector, to a holomorphic map $f_0$. Assume that the full generic differential rank of $f$ is
    at most $r$ and that $"rk" d f_0 \( v_0 \) = r$ at some $v_0 in B$.
    Then, after shrinking the sector and taking neighborhoods $v_0 in B' subset.double B_0 subset B$,
$ f \( S_(epsilon.alt') times B' \) subset f_0 \( B_0 \) \, $

 where the indicated local image of $f_0$ is an embedded complex submanifold of dimension $r$.
   In particular, every fixed closed analytic subset containing this local image also contains the nearby image of $f$.]
] <altord:h:rank-principle>

#proof[
  Use a common coordinate chart in $M$, shrinking $B$ and the sector.
    Cauchy estimates give convergence of all derivatives in the $B$ variables on smaller polydiscs.
    The $\( r + 1 \)$-minors of $d f$ vanish identically, so those of $d f_0$ vanish as well.
    Thus $f_0$ has constant rank $r$ near $v_0$. The holomorphic constant rank theorem supplies source coordinates
    $v = \( x \, y \) in upright(bold(C))^r times upright(bold(C))^(n - r)$ and target coordinates in which
    $f_0 \( x \, y \) = \( x \, 0 \)$.
  Write $f = \( F \, G \)$ in these coordinates, with $F \( u \, x \, y \) = x + E \( u \, x \, y \)$.
    On fixed smaller polydiscs, both $E$ and $partial_x E$ tend uniformly to zero.
    Choose nested $x$-balls, a smaller ball $W$ for $w$, and a ball $Y$ for $y$.
    For sufficiently small $epsilon.alt'$, the maps
  $ x mapsto w - E \( u \, x \, y \) $
  send a fixed closed $x$-ball into itself and have Lipschitz constant less than $1 \/ 2$,
    uniformly for $\( u \, w \, y \) in S_(epsilon.alt') times W times Y$.
    The contraction theorem gives a unique solution $x = chi \( u \, w \, y \)$ of $F \( u \, x \, y \) =
    w$ on this common product. The holomorphic inverse function theorem and uniqueness make $chi$ holomorphic in
    all interior parameters; moreover $chi arrow.r w$ uniformly on smaller products.
  In the new source coordinates the map is
  $ f \( u \, chi \( u \, w \, y \) \, y \) = \( w \, H \( u \, w \, y \) \) . $
  The $w$-derivatives already have rank $r$. The rank bound therefore forces $partial_u H = 0$ and $partial_y H =
    0$: either derivative, if nonzero, would give an additional image vector with zero first $r$ coordinates.
    Since the sector and $Y$ are connected, $H$ depends only on $w$.
    Its limit as $u arrow.r 0$ is zero, hence $H = 0$. Shrinking the original source neighborhood so that its
    $F$-values belong to $W$ proves the assertion. If $r = 0$,
    the rank bound directly makes $f$ constant on the connected source, and the same conclusion follows. ◻
]

#thm([Lemma 3.5.])[
  (Nilpotent tangential convergence).  #emph[Let $N$ be a nilpotent endomorphism of a finite-dimensional complex
    vector space, and let $a \( u \, v \)$ be holomorphic on $Delta times B$.
    Suppose, for a fixed $ell gt.eq 0$, that $N^(ell + 1) a \( 0 \, v \) =
    0$ and $N^ell a \( 0 \, v \) eq.not 0$ throughout $B$. On a sector with the above choice of $z =
    log u \/ \( 2 pi i \)$,
#[#set math.equation(numbering: n => "(3.5)")
 $ \[ e^(z N) a \( u \, v \) \] arrow.r \[ N^ell a \( 0 \, v \) \] $ <altord:h:eq-nilpotent-limit>]

 normally on sufficiently small $v$-charts, with all tangential derivatives.
   Thus Lemma 9 applies whenever the rank of this limit equals an upper bound for the full rank of the line map.
   Its nearby image then lies in $bb(P) \( ker N \)$.]
] <altord:h:nilpotent-limit>

#proof[
  Choose $k$ with $N^(k + 1) = 0$, and write $a \( u \, v \) = a_0 \( v \) + u q \( u \, v \)$.
    Set $b \( v \) = N^ell a_0 \( v \) \/ ell !$. Direct expansion gives
  $ z^(- ell) e^(z N) a \( u \, v \) & = b \( v \) + sum_(j < ell) frac(z^(j - ell), j !) N^j a_0 \( v \) +
    u sum_(j = 0)^k frac(z^(j - ell), j !) N^j q \( u \, v \) . $
  For every fixed tangential derivative, uniformly on compact subsets of $B$, the remainder is
  $ O \( \| z \|^(- 1) \) + O \( \| u \| thin \| z \|^(k - ell) \) \; $
  the first term is absent when $ell = 0$. On the sector $\| z \|$ is comparable to $\| log \| u \| \|$,
    so both terms tend to zero. Choose a linear functional nonzero on $b \( v_0 \)$ and shrink the $v$-chart.
    Dividing by that functional gives convergence with all tangential derivatives in a fixed affine projective
    chart, proving (3.5). Finally $N b = 0$, so the limiting image belongs to the fixed projective linear subspace
    $bb(P) \( ker N \)$, and the last assertion follows from Lemma 9. ◻
]

#prodef([Remark 3.6.])[
  All numerical-rank statements are unchanged on replacing a Hodge line by a positive rational multiple of its
    class in $"Pic" \( T \) ⊗ upright(bold(Q))$. The local statements also apply with $N = 0$,
    when the line map extends holomorphically across the divisor.
] <altord:h:scaling>

== 4 Rank loss on the boundary and the ramification divisor <sec:rankloss>

The preceding lemmas apply to a smooth model of a full period image.
  At a neat level the variation is unipotent at the boundary.
  Returning to the original level also introduces ramification divisors.
  We now prove the strict numerical rank drop for both kinds of divisor.

We specify the finite-group data because the group acting on the variation can be larger than the effective group
  acting on its base. Let $T$ be a smooth connected projective complex variety of positive dimension,
  let $D_T$ be a reduced simple-normal-crossing divisor, and put $U = T \\ D_T$.
  Let $bb(V)$ be a rationally polarized integral pure variation on $U$, minimal for its entire highest Hodge line,
  with unipotent boundary monodromy. Write $J$ for the extended highest line.
  Let $D_N$ be the union of the components of $D_T$ with nonzero monodromy logarithm, and put $U_N = T \\ D_N$.
  The variation extends purely over $U_N$ by Theorem 6.

Suppose a finite group $H$ acts on $T$, preserves $D_T$, and acts on the variation by flat Hodge isomorphisms
  preserving its integral lattice and rational polarization and covering that action. Set

$ G_f = H \/ ker #scale(x: 120%, y: 120%)[\(] H arrow.r "Aut" \( T \) #scale(x: 120%, y: 120%)[\)] . $

Thus $G_f$ acts effectively on $T$. We retain $H$ for its action on the variation,
  since its kernel on $T$ can act nontrivially on fibres. Uniqueness of the pure extension preserves this action
  over $U_N$.

Fix a connected period domain $cal(D)$ for the rational polarized reference space and a neat arithmetic group
  $Gamma'$ of lattice isometries containing the monodromy. Let

$ phi : U_N arrow.r Gamma' without cal(D) $

be the full period map. Assume that the normalization $B$ of the closure of its actual image is an algebraic
  variety, that the natural rational map $T arrow.r.dashed B$ is birational,
  and that $phi$ is generically immersive. In particular,

$ upright(bold(C)) \( T \) = upright(bold(C)) \( B \) . $

These assumptions describe the actual period-image model.
  The algebraicity of $B$ is the period-image theorem of #cite(label("BakkerBrunebarbeTsimerman")) Theorem 1.1;
  here its construction is an explicit input to the rank-loss statement.

#thm([Theorem 4.1.])[
  (Boundary and ramification rank loss).  #emph[For the data just specified, put $r = nu \( J \)$. Then $r > 0$.
    If $E$ is either a component of $D_N$, or a component of $D_T$ fixed pointwise by a nonidentity element of
    $G_f$, then
$ nu \( J \|_E \) < r . $

 In particular, after placing the divisorial fixed loci in $D_T$ on an equivariant smooth model,
   the conclusion applies to every divisorial ramification component of $T arrow.r T \/ G_f$.]
] <thm:rankloss>

#proof[
  Proposition 7 identifies $r$ with the generic rank of the highest-line map.
    We first show that this rank is positive, then consider the nilpotent and finite cases.
  If $r = 0$, the highest line is constant on the connected universal cover of $U_N$. Monodromy preserves it.
    Its connected algebraic monodromy group $G$ is semisimple and hence acts trivially on that line.
    Lemma 4, applied with the normal subgroup equal to $G$, gives $G = 1$.
    After a finite étale cover the monodromy is trivial, and the fixed-part theorem makes the entire variation
    constant. Its full period map then has rank zero, contrary to generic immersivity on the positive-dimensional
    variety $T$. Thus $r > 0$.
  #emph[A component with nonzero monodromy logarithm.] Let $E subset D_N$ and write $N eq.not
    0$ for its rational monodromy logarithm. In coordinates $\( u \, v \)$ near a general point of $E$,
    with $E = \( u = 0 \)$, the lifted highest-line map has the form
  $ \[ e^(z N) a \( u \, v \) \] \, wide z = frac(log u, 2 pi i) . $
  Proposition 8 provides an integer $ell gt.eq 0$ with
  $ N^(ell + 1) a \( 0 \, v \) = 0 \, wide N^ell a \( 0 \, v \) eq.not 0 \, wide nu \( J \|_E \) lt.eq
    "rk"_(upright("gen")) d #scale(x: 120%, y: 120%)[\(] v mapsto \[ N^ell a \( 0 \, v \) \]
    #scale(x: 120%, y: 120%)[\)] . $
  Lemma 10 gives its normal tangential convergence on a sector from the interior line maps.
    All interior $\( r + 1 \)$-minors vanish. Cauchy convergence of tangential derivatives therefore bounds the
    rank of the limiting map by $r$.
  Suppose that $nu \( J \|_E \) gt.eq r$. The limiting map has rank exactly $r$ at a suitable general point,
    and its image lies in $bb(P) \( ker N \)$. Lemma 9 forces all nearby interior lines to lie in this same linear
    subspace. The condition that $N$ annihilates the highest line is holomorphic,
    so it continues over the connected universal cover of $U_N$.
  The one-parameter group $exp \( t N \)$ belongs to $G$: it is the connected Zariski closure of the cyclic
    unipotent local monodromy. Every monodromy conjugate of this group fixes the highest line pointwise.
    Let $G_N$ be the algebraic subgroup they generate. It is connected, defined over $upright(bold(Q))$,
    and normalized by monodromy; Zariski density makes it normal in $G$.
    Its invariant space contains the highest line at a Hodge-generic point.
    By Lemma 4, $G_N = 1$, contradicting $N eq.not 0$. This proves the required inequality for components of $D_N$.
  We have controlled all divisors at which the pure variation fails to extend.
    The remaining obstruction is a divisor of finite ramification where the variation does extend.
    Its inertia element can act on the rational fibre even when it fixes every point of the divisor,
    so we must use the full-period conclusion of Lemma 5.
  #emph[A divisor fixed by finite inertia.] Let $b in G_f$ be nonidentity and fix $E$ pointwise.
    If $E$ is contained in $D_N$, the preceding case applies. Otherwise a general point $e in E$ lies in $U_N$.
    Choose a lift $h in H$ of $b$. The retained $H$-action supplies a flat Hodge isomorphism
  $ Phi_y : V_y arrow.r V_(b \( y \)) $
  on $U_N$. Use $V_e$ as a flat reference space on a small simply connected $b$-invariant neighborhood,
    and set $a = Phi_e$. If $x$ is the full lifted period map, flatness gives
  $ x \( b y \) = a thin x \( y \) . $
  The operator $a$ is a rational Hodge isometry at $e$. Because $H$ acts on the variation and $b \( e \) = e$,
    the group-action law gives $a^("ord" \( h \)) = 1$. Since $b$ fixes $E$,
    every highest line on the nearby part of $E$ is an eigenline of $a$.
    Its eigenvalue is constant on a connected small patch, so these lines lie in one eigenspace $ker \( a - lambda \)$.
  Proposition 8 with $N = 0$ bounds $nu \( J \|_E \)$ by the rank of this extending line map on $E$.
  Suppose again that $nu \( J \|_E \) gt.eq r$. The rank on $E$ is at most $r$,
    since all $\( r + 1 \)$-minors of the ordinary extending line map vanish by continuation from the interior.
    It is therefore $r$. Apply Lemma 9 in a transverse coordinate with $N = 0$.
    A nonempty open set of lifted highest lines lies in $ker \( a - lambda \)$.
    Lemma 5, applied on the smooth algebraic variety $U_N$ with fixed point $e$,
    now shows that $a$ preserves every full period. Consequently $x \( b y \) = x \( y \)$.
  Projecting to $Gamma' without cal(D)$ gives $phi \( b y \) = phi \( y \)$ on a nonempty open set.
    Since $B$ is the normalization of the actual image, its normalization map is birational and hence injective on
    a dense open subset of that image. It follows that $b$ acts trivially on $upright(bold(C)) \( B \)$.
    The chosen model has $upright(bold(C)) \( T \) = upright(bold(C)) \( B \)$, so $b$ acts trivially on $T$,
    contrary to its nonidentity in $G_f$. This proves the strict inequality.
  Finally, in a finite quotient in characteristic zero, ramification at a divisorial valuation is detected by a
    nontrivial inertia group, which acts identically on that divisor’s function field.
    Its elements therefore fix the divisor pointwise. The last assertion follows from the case just proved. ◻
]

#prodef([Remark 4.2.])[
  The conclusion concerns the numerical dimension of the highest line,
    while generic immersivity is a hypothesis on the full period map.
    Neither the proof nor the conclusion identifies these ranks.
    The function-field equality with the actual period image is used only at the last contradiction in the finite
    case; it cannot be replaced there by an arbitrary finite extension of that function field.
]

== 5 The period quotient and adjoint bigness <sec:quotient>

We prove Theorem 2. The full period image supplies an algebraic base,
  and Section 4 controls the divisors introduced by compactification and finite descent.
  We first show that those numerical rank drops suffice to remove the divisors from an adjoint class.
  This is a section-growth calculation; no abundance statement for the highest line is needed.

=== 5.1 Section estimates <altord:sec:estimates>

#thm([Lemma 5.1.])[
  #emph[Let $T$ be a smooth projective $t$-fold, $A$ a rational divisor, and $J$ a nef rational divisor with $r =
    nu \( J \) > 0$, and $D = sum_i d_i E_i$ an effective integral divisor with smooth prime components. Suppose
$ nu \( J \|_(E_i) \) < r quad upright("for every ") i . $

 If $A + D$ is big, then $A + j J$ is big for every sufficiently large integer $j$.]
] <altord:e:volume-lemma>

#proof[
  Choose an ample rational divisor $H_1$ such that $A + D - H_1$ is effective.
    In this proof $m$ tends to infinity through sufficiently divisible positive integers.
    For each fixed $j gt.eq 0$, asymptotic Riemann–Roch for the ample divisor $H_1 + j J$ gives
  $ liminf_(m arrow.r oo) frac(t !, m^t) h^0 #scale(x: 120%, y: 120%)[\(] T \,
    m \( A + D + j J \) #scale(x: 120%, y: 120%)[\)] med gt.eq med \( H_1 + j J \)^t med gt.eq c j^r $
  for a constant $c > 0$ and all $j gt.eq 1$. The last inequality follows from $J^r H_1^(t - r) > 0$.
  Remove $m D$ one prime divisor at a time. Each quotient in a divisor exact sequence is a line bundle on some
    $E_i$, of the form
  $ cal(O)_(E_i) (m \( A + D + j J \) - sum_h k_h E_h) \, wide 0 lt.eq k_h lt.eq m d_h . $
  There is a single ample rational divisor $H_2$ on $T$ for which every such quotient has at most
    $h^0 \( E_i \, m \( H_2 + j J \) \|_(E_i) \)$ sections, in divisible degrees and for every $j gt.eq 0$.
    To see this, choose an ample Cartier divisor $B_0$ with a globally generated multiple clearing the denominator
    of $B_0 - \( A + D \)$, and ample Cartier divisors $B_h$ such that both $B_h$ and $B_h +
    E_h$ are globally generated. Enlarge $B_0$ if necessary and take $H_2 = B_0 + sum_h d_h B_h$.
    The difference, restricted to $E_i$, is
  $ m \( B_0 - A - D \) + sum_h #scale(x: 120%, y: 120%)[\(] \( m d_h - k_h \) B_h +
    k_h \( B_h + E_h \) #scale(x: 120%, y: 120%)[\)] . $
  It has a section nonzero on $E_i$, by global generation and multiplication, giving the claimed bound.
  There are $m sum_i d_i$ quotient terms. For fixed $j$, asymptotic Riemann–Roch on each $E_i$ bounds their total
    contribution on the scale $m^t \/ t !$ by
  $ t sum_i d_i thin \( H_2 + j J \)^(t - 1) dot.op E_i . $
  This is $O \( j^(r - 1) \)$, since every intersection containing at least $r$ factors of $J \|_(E_i)$ vanishes.
    Consequently
  $ liminf_(m arrow.r oo) frac(t !, m^t) h^0 #scale(x: 120%, y: 120%)[\(] T \,
    m \( A + j J \) #scale(x: 120%, y: 120%)[\)] med gt.eq med c j^r - O \( j^(r - 1) \) > 0 $
  for all sufficiently large $j$, proving bigness. ◻
]

#thm([Lemma 5.2.])[
  #emph[Let $pi : T arrow.r S$ be a surjective generically finite morphism of smooth projective varieties.
    Let $E gt.eq 0$ be a rational divisor on $T$ whose components have image of codimension at least two in $S$.
    For a rational divisor $D$ on $S$, the divisor $pi^(*) D + E$ is big if and only if $D$ is big.]
] <altord:e:exceptional-pullback>

#proof[
  Factor $pi$ as $T arrow.r^rho macron(S) arrow.r^tau S$, where $macron(S)$ is the normalization of $S$ in
    $upright(bold(C)) \( T \)$. Then $rho$ is birational and $tau$ is finite.
    Every component of $E$ is $rho$-exceptional, since a finite map preserves dimensions.
    Normality gives $rho_(*) cal(O)_T \( m E \) = cal(O)_(macron(S))$ in divisible degrees:
    a rational function with poles only on exceptional divisors has no codimension-one pole downstairs.
    Projection formula identifies the sections of $m \( pi^(*) D + E \)$ with those of $m tau^(*) D$.
    Finally, bigness is invariant under surjective finite pullback. ◻
]

=== 5.2 Construction and descent <construction-and-descent>

#proof[
  We may first make the birational modification allowed in the hypothesis.
    Replace $bb(V)$ by the minimal rational subvariation from Lemma 3,
    and equip it with the intersection lattice and the restricted polarization.
    Its deepest Hodge line and the line $J_(hat(Y))$ are unchanged. We continue to denote this variation by $bb(V)$.
  #strong[The actual period image and its finite quotient.] Choose a rational reference space with lattice and
    polarization, and let $cal(D)$ be the connected period-domain component containing a chosen lift of the
    periods. Let $Gamma$ be the arithmetic group of integral polarizing isometries preserving this component;
    it contains the monodromy of $bb(V)$. Let $Gamma' lt.closed Gamma$ be a normal neat subgroup of finite index.
    The kernel of
  $ pi_1 \( U \) arrow.r Gamma \/ Gamma' $
  defines a connected finite étale Galois cover $U' arrow.r U$.
    Denote its deck group by $H$; thus $H$ is the image of this homomorphism, not necessarily all of $Gamma \/ Gamma'$.
  The period map of $bb(V) \|_(U')$ factors algebraically through the normalization $B$ of the closure of its
    image in $Gamma' without cal(D)$. The space $B$ is a normal quasiprojective variety,
    and on a smooth dense open subset its period realization has generically immersive differential;
    this is the period-image theorem #cite(label("BakkerBrunebarbeTsimerman")) Theorem 1.1.
    Here and below the function field of $B$ is the function field of this normalized #emph[actual image].
    We do not replace it by its relative algebraic closure in $upright(bold(C)) \( U' \)$.
  Neatness makes the arithmetic action free. The universal local system on the quotient is
  $ \( cal(D) times V_(upright(bold(Z))) \) \/ Gamma' \, $
  with its tautological filtration. On the smooth open of $B$ this filtration is horizontal:
    the dominant map $U' arrow.r B$ is generically submersive and its pullback is the original variation,
    so Griffiths transversality holds on a dense open and hence everywhere.
    Thus the restricted local system and filtration form a polarizable integral variation.
    Moreover, the action of $Gamma \/ Gamma'$ on this local system is an honest action:
  $ \[ x \, v \] mapsto \[ gamma x \, gamma v \] . $
  Normality of $Gamma'$ makes the formula independent of the representative $gamma$.
    Restricting gives an action of $H$ on the variation over $B$, covering its action on $B$.
    The action on $B$ is algebraic: apply uniqueness in #cite(label("BakkerBrunebarbeTsimerman")) Theorem 1.1 to
    the period map and its expression obtained by a deck transformation on $U'$ and the corresponding arithmetic
    translation on the target, and then lift to the normalization. Let
  $ G_f = H \/ ker \( H arrow.r "Aut" \( B \) \) $
  be the effective group on the image. The full group $H$ will still be retained for its action on the variation.
  Choose a $G_f$-equivariant smooth projective compactification $S'$ of a smooth dense invariant open of $B$,
    with snc boundary, by equivariant compactification and resolution.
    All boundary monodromies of its variation are unipotent. Indeed they are quasi-unipotent by the monodromy
    theorem, and they belong to the neat group $Gamma'$; their root-of-unity eigenvalues must therefore all be
    one. Let $J'$ denote the extended deepest Hodge line and put $L' = c J'$. This is nef by Theorem 6.
    The $H$-action extends to $J'$ by functoriality of the unipotent Deligne and Hodge extensions.
  Let $q : S' arrow.r Q_0 = S' \/ G_f$ be the finite quotient.
    Although an element of $ker \( H arrow.r G_f \)$ may act nontrivially on $J'$,
    it acts on its fibres through finite-order characters. Taking a tensor power divisible by $\|
    H \|$ kills the fibre action of every stabilizer in $H$, including this kernel.
    That tensor power therefore descends to an actual line bundle on $Q_0$ by finite-group descent.
    Consequently there is a rational line bundle $overline(L)$ on $Q_0$ with
  $ q^(*) overline(L) tilde.op_(upright(bold(Q))) L' . $
  It is nef, since its pullback by the finite surjective map $q$ is nef.
    Choose a smooth projective resolution $s : S_0 arrow.r Q_0$ and put $L_0 = s^(*) overline(L)$.
  The equivariant period map on $U'$ descends to a dominant rational map $Y arrow.r.dashed Q_0$,
    and hence to $S_0$. Resolve its graph by a smooth projective birational modification of $Y$, obtaining
  $ p_0 : Y arrow.r S_0 . $
  We claim that
  #[#set math.equation(numbering: n => "(5.1)")
   $ M tilde.op_(upright(bold(Q))) p_0^(*) L_0 . $ <altord:p:line-descent>]
  To verify this claim, choose a common smooth projective alteration $W$ dominating the alteration in the
    hypothesis and the level cover, and resolve the graph of its rational map to $S'$.
    Write $mu : W arrow.r Y$ and $t : W arrow.r S'$ for the resulting morphisms.
    Arrange snc boundaries by further resolution, containing the inverse images of the boundaries in question.
    The pulled-back variations agree on a dense open subset. Unipotent Deligne extensions and their extended Hodge
    filtrations commute with these pullbacks between smooth snc pairs; see #cite(label("BFMT")) Lemma 5.6,
    or the unipotent extension theory #cite(label("Schmid")) #cite(label("CKS")).
    The extended top line $J_W$ is consequently the pullback of the top line on either model.
    The hypothesis and the commutative maps to $Q_0$ give
  $ mu^(*) M tilde.op_(upright(bold(Q))) c J_W tilde.op_(upright(bold(Q))) t^(*) L' tilde.op_(upright(bold(Q)))
    mu^(*) p_0^(*) L_0 . $
  Pullback by a proper generically finite map is injective on rational line-bundle classes:
    applying divisor pushforward, or the norm of a principal rational function,
    multiplies the original class by the degree. This proves (5.1).
    In particular no boundary twist has been inferred from an equality merely on the open locus.
  If $dim S_0 = 0$, equation (5.1) gives $M tilde.op_(upright(bold(Q))) 0$, and the theorem follows.
    Assume henceforth that $dim S_0 > 0$.
  #strong[A common equivariant model and log general type.] Normalize $S_0$ in $upright(bold(C)) \( S' \)$,
    and take a $G_f$-equivariant smooth projective resolution of the resulting model and its birational map to
    $S'$. Denote the resulting maps by
  $ eta : T arrow.r S' \, wide pi : T arrow.r S_0 . $
  Thus $eta$ is birational, $pi$ is generically finite with Galois function-field group $G_f$,
    and $G_f$ acts on $T$ over $S_0$. Choose the resolution so that there is a $G_f$-invariant snc boundary $D_T$
    containing the complement of the open period locus and the support of the Jacobian divisor of $pi$.
    The pulled-back variation has unipotent boundary monodromy. If $J_T$ is its extended top line, then
  #[#set math.equation(numbering: n => "(5.2)")
   $ L_T := c J_T tilde.op_(upright(bold(Q))) eta^(*) L' tilde.op_(upright(bold(Q))) pi^(*) L_0 . $ <altord:p:T-line>]
  Let $D_N$ be the reduced sum of those components of $D_T$ having nonzero monodromy logarithm.
    The variation extends as a pure polarized variation over
  $ U_N = T \\ D_N . $
  Indeed, near a point where all the remaining logarithms are zero,
    the nilpotent-orbit extension is a pure polarized Hodge filtration;
    the several-variable extension gives the same statement at crossings #cite(label("Schmid"))
    #cite(label("CKS")). These extensions are unique and preserve the $H$-equivariance of the variation.
    The divisor $D_N$ is snc, since it is a union of components of $D_T$.
  The full period map on $U_N$ has generically immersive differential, because $T$ is birational to $B$.
    The log-general-type theorem for a polarized variation with generically immersive period map therefore gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ K_T + D_N quad upright("big") . $ <altord:p:log-big>]
  Here the applicable theorem is #cite(label("BrunebarbeCadorel")) Theorem 1.1.
    Its boundary is precisely $D_N$, because the pure variation has just been extended over all the other boundary
    components.
  We now have precisely the geometric data of Theorem 12: $T$ is birational to the actual normalized period image,
    the full period map is generically immersive, and the retained finite group $H$ acts on its integral polarized
    variation. The effective group on $T$ is $G_f$. Minimality is preserved here:
    the variation on $T$ and the original variation have the same Hodge structures at Hodge-generic points,
    since the original source dominates the period image. Consequently
  #[#set math.equation(numbering: n => "(5.4)")
   $ r := nu \( L_T \) > 0 \, wide nu \( L_T \|_E \) < r $ <altord:p:rank-drop>]
  for every component of $D_N$ and every divisorial ramification component of $pi$ mapping onto a divisor of
    $S_0$. For the latter, the inertia group of the Galois extension $upright(bold(C)) \( T \) \/
    upright(bold(C)) \( S_0 \)$ contains a nonidentity element of $G_f$ fixing the divisor pointwise.
    These fixed loci were included in $D_T$. Positive rational rescaling from $J_T$ to $L_T$ leaves all these
    numerical dimensions unchanged. The use of the actual image, before Stein factorization,
    is exactly the function-field hypothesis needed in the finite-inertia part of Theorem 12.
  #strong[Removal of the boundary and ramification.] Write the effective Jacobian divisor as
  $ R_pi = K_T - pi^(*) K_(S_0) = R_(upright("div")) + R_(upright("exc")) \, $
  where $R_(upright("div"))$ is supported on components mapping onto divisors of $S_0$,
    and each component of $R_(upright("exc"))$ has image of codimension at least two. In the volume Lemma 14, take
  $ J = L_T \, wide D = D_N + R_(upright("div")) \, wide A = K_T - R_(upright("div")) = pi^(*) K_(S_0) +
    R_(upright("exc")) . $
  All components of $D$ satisfy the rank inequality above, and $A + D = K_T + D_N$ is big by (5.3).
    The volume lemma gives
  $ A + j L_T tilde.op_(upright(bold(Q))) pi^(*) \( K_(S_0) + j L_0 \) + R_(upright("exc")) quad
    upright("big for ") j gt.double 0 . $
  Lemma 15 removes the effective divisors exceptional over $S_0$ and descends bigness through the generically
    finite map. Therefore
  #[#set math.equation(numbering: n => "(5.5)")
   $ K_(S_0) + j L_0 quad upright("is big for every sufficiently large integer ") j . $ <altord:p:adjoint-big>]
  #strong[Connected fibres.] Finally take the Stein factorization of $p_0$,
    and resolve its finite normal intermediate variety to a smooth projective variety $S$.
    Resolving the induced rational map from $Y$ gives, by further smooth projective birational modification,
    a morphism $p : Y arrow.r S$ with connected fibres. Indeed,
    its Stein factor is finite birational over the normal variety $S$,
    because $upright(bold(C)) \( S \)$ is already algebraically closed in $upright(bold(C)) \( Y \)$,
    and is therefore $S$ itself. If $sigma : S arrow.r S_0$ is the resulting generically finite morphism, set $L =
    sigma^(*) L_0$. It is nef, and (5.1) pulls back to $M tilde.op_(upright(bold(Q))) p^(*) L$.
    Since both $S$ and $S_0$ are smooth, the Jacobian divisor of $sigma$ is effective. Thus
  $ K_S + j L = sigma^(*) \( K_(S_0) + j L_0 \) + R_sigma $
  is big for $j gt.double 0$ by (5.5) and preservation of bigness under generically finite pullback.
    This proves the theorem. ◻
]

== 6 Canonical bundle data and the least-index root cover <sec:canonical>

We return to the original algebraic fibre space. The goal of this section is to construct the rational line to
  which Theorem 2 applies and to retain the exact section comparison with the source.
  The generic fibre of a relative Iitaka fibration has Kodaira dimension zero;
  its least-index canonical root cover provides the entire highest Hodge line.

We work over $upright(bold(C))$. All varieties in this section are projective.
  A rational pair $\( Y \, B \)$ is klt if, on a log resolution,
  the boundary defined by crepant pullback of $K_Y + B$ has every coefficient less than one;
  it is log canonical if those coefficients are at most one.
  We allow negative coefficients when explicitly discussing a sub-pair.
  A b-divisor records compatible divisor traces on all birational models of the base.
  Saying that its moduli part descends to $Y$ means that every higher trace is the pullback of its trace $M$ on
  $Y$. We distinguish a divisor exceptional over a birational model of the total space from a divisor whose image
  on the base has codimension at least two.

=== 6.1 The canonical bundle formula and its normalization <the-canonical-bundle-formula-and-its-normalization>

We use the following parabolic form of the canonical bundle formula as a deep theorem.

#thm([Theorem 6.1.])[
  (Parabolic canonical bundle formula).  #emph[Let $g_0 : X_0 arrow.r
    Y_0$ be an algebraic fibre space between smooth projective varieties,
    with geometric generic fibre of Kodaira dimension zero. After birational modifications of its source and base
    there is a commutative diagram
$ X' & arrow.r^alpha & X_0\
g arrow.b &  & arrow.b g_0\
Y & arrow.r^beta & Y_0 $

 with $X'$ and $Y$ smooth, and rational divisors $B \, M \, R$ such that
#[#set math.equation(numbering: n => "(6.1)")
 $ K_(X') tilde.op_(upright(bold(Q))) g^(*) \( K_Y + B + M \) + R . $ <altord:cb:formula>]

 Here $B gt.eq 0$, its support has simple normal crossings, $\( Y \, B \)$ is klt, and $M$ is nef. Moreover,
#[#set math.equation(numbering: n => "(6.2)")
 $ g_(*) cal(O)_(X') \( floor.l k R^(+) floor.r \) = cal(O)_Y quad \( k in upright(bold(Z))_(> 0) \) \, wide
   "codim"_Y g \( "Supp" R^(-) \) gt.eq 2 \, $ <altord:cb:residual>]

 and $R^(-)$ is $alpha$-exceptional. The divisor $M$ is the trace of the moduli b-divisor,
   which can be assumed to descend to $Y$. On a sufficiently high generically finite base change admitting
   semistable reduction, its pullback is $upright(bold(Q))$-linearly equivalent to a positive rational multiple of
   the Schmid extension of the distinguished canonical Hodge eigensheaf of the canonical root cover.]
] <altord:cb:parabolic>

The residual divisor and discriminant assertions, with the normalization by the least nonzero pluricanonical
  index, are #cite(label("FujinoMori")) §4.4 and Theorem 4.5(i)–(v).
  For original boundary zero, the logarithmic semistable part agrees with the semistable part of Section 2 by
  #cite(label("FujinoMori")) Proposition 4.7. The moduli interpretation follows from the discriminant-threshold
  definition in #cite(label("FujinoMori")) Definition 4.3 and the following Ambro results.
  The b-divisor and Hodge assertions use #cite(label("AmbroBoundary")) Theorems 0.2 and 4.4(1),(3),
  Lemma 5.2(4)–(5), and Propositions 5.4–5.5; see also #cite(label("AmbroModuli")) Proposition 3.1.
  These statements allow the auxiliary sub-boundary to have negative coefficients.

We record how the hypotheses of these results fit together.
  In the notation of #cite(label("FujinoMori")) §4.4, applied with original boundary zero,
  the crepant boundary upstairs is the negative of the effective relative canonical divisor over the smooth
  original source. Thus the choice $Xi = 0$ satisfies the hypotheses of their Theorem 4.5,
  including those of part (v). The coefficients of our $B$ are their $s_P \/ b$;
  part (v) places them in $\[ 0 \, 1 \)$. Their residual divisor is $b R$.
  We verify the all-degree direct-image condition from the normalization below,
  so that it remains available after the final change of model.
  For the exceptionality assertion, flatten before resolving the main transform,
  as in #cite(label("FujinoMori")) §4.4. The inverse image of a base subset of codimension at least two has
  codimension at least two in the flat main transform; finite normalization preserves this bound.
  A prime divisor of its resolution lying over that subset is therefore exceptional over the normalized main
  transform. This transform maps birationally to $X_0$, so the prime is also $alpha$-exceptional.
  Apply this to every component of $R^(-)$. Its small image on $Y$ alone would not imply exceptionality over $X_0$.

Here is also the relevant normalization of the associated sub-pair.
  On the geometric generic fibre $C$, let $b$ be the least positive integer with $H^0 \( C \, b K_C \) eq.not 0$,
  and let $D_C$ be the divisor of its unique section up to scalar. The horizontal restriction is

$ R_C = 1 / b D_C \, wide Delta_C = - R_C . $

The least positive integer making $K_C + Delta_C$ principal is also $b$. Indeed, $b K_C - D_C$ is principal.
  Conversely, if $m \( K_C - D_C \/ b \)$ is principal for a positive integer $m$,
  then $m D_C \/ b$ is an integral effective divisor linearly equivalent to $m K_C$.
  Thus $H^0 \( C \, m K_C \) eq.not 0$, which forces $m gt.eq b$.
  This identifies the least-index normalization in the sub-pair construction with the pluricanonical index used
  for the root cover. A rational relative pluricanonical section first defines a divisor $R_0$ with this
  restriction. For a prime divisor $P subset Y$, subtract from $R_0$ the pullback of $P$ multiplied by

$ a_P = min_(E mapsto P) frac("coeff"_E \( R_0 \), "mult"_E \( g^(*) P \)) . $

Only finitely many $a_P$ are nonzero. The resulting residual divisor is nonnegative over the generic point of $P$,
  with coefficient zero on at least one component over $P$.

This normalization also gives the direct-image condition in every positive degree.
  Let $V subset Y$ be a nonempty open subset, let $k > 0$ be an integer,
  and let $phi$ represent a section of $cal(O)_(X') \( floor.l k R^(+) floor.r \)$ over $g^(- 1) \( V \)$.
  On the geometric generic fibre $C$, its poles are bounded by $floor.l k D_C \/ b floor.r$,
  hence by an integral multiple of $D_C$. Since $D_C tilde.op b K_C$ and $kappa \( C \) = 0$,
  every such function is constant on $C$. Since $g_(*) cal(O)_(X') = cal(O)_Y$,
  the field $upright(bold(C)) \( Y \)$ is algebraically closed in $upright(bold(C)) \( X' \)$.
  Thus $phi = g^(*) psi$ for a rational function $psi$ on $V$.
  For each prime divisor $P$ meeting $V$, choose a component $E$ over $P$ on which the normalized residual
  coefficient is zero. Regularity of $phi$ along $E$ gives

$ 0 lt.eq "ord"_E \( g^(*) psi \) = "mult"_E \( g^(*) P \) "ord"_P \( psi \) . $

Thus $psi$ has no codimension-one pole on $V$, and normality of $Y$ makes it regular.
  Pullbacks of regular functions give the reverse inclusion, proving

$ g_(*) cal(O)_(X') \( floor.l k R^(+) floor.r \) = cal(O)_Y wide \( k in upright(bold(Z))_(> 0) \) . $

For the sub-pair $\( X' \, - R \)$ its discriminant coefficient is $1 - t_P$, where

$ t_P = sup { t in upright(bold(R)) : \( X' \, - R + t thin g^(*) P \)
  upright(" is sub-lc over the generic point of ") P } . $

Nonnegativity of $R$ there implies $t_P > 0$; the component with residual coefficient zero gives $t_P lt.eq 1$.
  This explains the effective boundary in this normalization.

The rank-one hypothesis for this sub-pair holds even though $Delta_C$ is negative.
  Indeed, $kappa \( C \, R_C \) = 0$. On a log resolution of $\( C \, - R_C \)$,
  a section of the rounded discrepancy sheaf pushes down to a rational function on $C$ whose poles are bounded by
  a sufficiently large integral multiple of $D_C$. The space of such functions has dimension one,
  while the constant function is allowed. Consequently

$ "rk" g_(*) cal(O)_(X') #scale(x: 120%, y: 120%)[\(] ceil.l upright(bold(A)) \( X' \, - R \) ceil.r
  #scale(x: 120%, y: 120%)[\)] = 1 \, $

where the expression is interpreted by pushing down from a log resolution.
  This is the rank condition in #cite(label("AmbroBoundary")) introductory assumptions (1)–(3).

After choosing a model on which the moduli b-divisor descends,
  take a common higher base model satisfying the flattening and normal-crossing requirements,
  with boundary containing the total transform of the original normalized discriminant support and all exceptional
  base divisors. Crepantly pull back the auxiliary sub-pair to a smooth resolved main transform,
  taking a log resolution that includes its residual support and the pullbacks of the base boundary.
  Apply the same minimum-coefficient normalization to this residual divisor.
  Its horizontal restriction is again $D_C \/ b$ for the unique least-index pluricanonical divisor on the new
  geometric generic fibre: for the induced birational morphism $lambda : C' arrow.r C$, crepant pullback gives

$ lambda^(*) \( D_C \/ b \) + K_(C' \/ C) = D_(C') \/ b . $

The preceding argument therefore restores the all-degree direct-image condition on this final model.
  The normalized residual is nonnegative over every codimension-one base point;
  its negative part has base image of codimension at least two and is exceptional over the original source by the
  flattening argument above. Over the strict transform of an original base prime,
  its zero-coefficient component survives and the crepant residual stays nonnegative,
  so renormalization makes no further change there. Any new discriminant support is therefore exceptional and lies
  in the chosen simple-normal-crossing boundary. Its coefficients are in $\[ 0 \, 1 \)$ by the same threshold
  calculation, so the discriminant is effective and klt.

This renormalization does not change the moduli b-divisor.
  Indeed, changing a sub-boundary from $Delta$ to $Delta + g^(*) A$ changes the divisor pulled back in $K_(X') +
  Delta$ by $A$, while the discriminant changes by $A$ as well, by its threshold definition.
  Their difference is unchanged, and the same calculation holds on every higher base model.
  Crepant birational pullback likewise preserves the induced b-divisor.
  Thus the final normalized residual retains the descended nef moduli part together with the effective klt
  discriminant and the residual properties needed for the section comparisons below.
  The parabolic pullback statement and independence of the chosen root trivialization are also given directly in
  #cite(label("AmbroBoundary")) Definition-Proposition 7.1.

#prodef([Remark 6.2.])[
  No abundance assertion for $M$ is part of the input. The stronger conclusion of #cite(label("AmbroModuli"))
    Theorem 3.3 assumes effectivity of the boundary on the geometric generic fibre,
    an assumption which need not hold for $- R_C$. The b-nefness and Hodge identification used above instead come
    from the results of #cite(label("AmbroBoundary")) just cited.
    In particular, no good minimal model of $C$ is required. For the Hodge-theoretic formulation with sub-pairs,
    see also #cite(label("BFMT")) Definition 6.18, Construction-Definition 6.23, Remark 6.25, and Theorem 6.28.
] <altord:cb:no-abundance>

=== 6.2 The least-index root cover and its rational variation <the-least-index-root-cover-and-its-rational-variation>

#thm([Lemma 6.3.])[
  (Canonical root cover).  #emph[Let $C$ be a smooth connected projective variety with $kappa \( C \) = 0$,
    and let $b > 0$ be the least integer for which $H^0 \( C \, b K_C \) eq.not 0$.
    Choose a nonzero section $s$ of $b K_C$ and a nonzero rational canonical form $omega$.
    Let $T$ be the normalization of $C$ in the field obtained by adjoining a root
$ xi^b = s / omega^b . $

 Then $T arrow.r C$ has degree $b$, and every smooth projective resolution $W$ of $T$ satisfies
$ kappa \( W \) = 0 \, wide h^0 \( W \, K_W \) = 1 . $

 The unique canonical line is spanned by the form $xi h^(*) omega$, where $h : W arrow.r C$ is the induced morphism.]
] <altord:cb:root-cover>

#proof[
  Put $n = dim C$ and $D_C = "div" \( s \)$. The case $n = 0$ is immediate.
    For $n > 0$, first note that every nonzero pluricanonical space on $C$ has dimension one:
    two independent sections in the same degree would give a nonconstant rational map and hence positive Kodaira
    dimension.
  The field $upright(bold(C)) \( C \)$ contains all roots of unity.
    If $s \/ omega^b = u^p$ for a prime $p divides b$, the rational $\( b \/ p \)$-canonical form $u
    omega^(b \/ p)$ has $p$-th power $s$. At every prime divisor its order is $p^(- 1)$ times the nonnegative
    order of $s$, so this form has no poles. A rational section of a line bundle on the smooth variety $C$ with no
    divisorial poles is regular. This contradicts the minimality of $b$.
    The Kummer irreducibility criterion now gives a field extension of degree $b$.
    Denote the normalization map by $pi : T arrow.r C$, and a smooth projective resolution by $rho : W arrow.r T$,
    so $h = pi rho$.
  The differential of $h$ gives a nonzero morphism $h^(*) K_C arrow.r K_W$ at the generic point,
    and a regular morphism of line bundles everywhere. Use this morphism and its tensor powers when pulling back
    canonical forms. The rational canonical form $eta = xi h^(*) omega$ then satisfies
  $ eta^(⊗ b) = h^(*) s . $
  The right side is a regular section of $b K_W$. Thus $b thin "ord"_E \( eta \) gt.eq
    0$ for every prime divisor $E subset W$. Normality of $W$ again implies that $eta$ is regular,
    and therefore $h^0 \( W \, K_W \) gt.eq 1$.
  We next bound the canonical divisor from above. Choose $K_C = "div" \( omega \)$,
    and on $T$ use the canonical Weil divisor determined by the differential pullback of $omega$.
    At a prime divisor $P subset C$ outside $"Supp" D_C$, the order of $s \/ omega^b$ is divisible by $b$.
    Locally over the discrete valuation ring at $P$, after dividing the root by a power of a uniformizer,
    the defining equation is a $b$-th root of a unit. It is unramified, since the characteristic is zero.
    Consequently all ramification divisors lie over $"Supp" D_C$.
  If $Q subset T$ lies over $P subset "Supp" D_C$, write $e = e \( Q \/ P \)$ and $d = "ord"_P \( D_C \) gt.eq 1$.
    Tameness gives the ramification coefficient $e - 1$, and
  $ e - 1 lt.eq e d = "ord"_Q \( pi^(*) D_C \) . $
  The canonical divisor formula for finite maps, interpreted at codimension-one points, therefore gives
  $ K_T lt.eq pi^(*) \( K_C + D_C \) . $
  On $W$ the same inequality holds away from the $rho$-exceptional divisors.
    Hence there is an effective integral $rho$-exceptional divisor $E$ such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ K_W lt.eq h^(*) \( K_C + D_C \) + E . $ <altord:cb:cover-upper-bound>]
  This argument does not require a pullback of the Weil divisor $K_T$.
  Set $A = K_C + D_C$. Normality of $T$ implies $rho_(*) cal(O)_W \( m E \) = cal(O)_T$ for every $m gt.eq 0$:
    a rational function allowed poles only on exceptional divisors is regular in codimension one on $T$,
    hence regular on $T$. Projection formula and (6.3) imply
  $ kappa \( W \, K_W \) lt.eq kappa \( W \, h^(*) A + E \) = kappa \( T \, pi^(*) A \) = kappa \( C \, A \) . $
  The last equality is invariance of Iitaka dimension under a finite surjective pullback.
    In this situation it can be seen directly from section rings:
    a homogeneous section upstairs satisfies its monic characteristic polynomial over $upright(bold(C)) \( C \)$;
    its coefficients, in degree $j m$, are sections of $j m A$,
    by the valuation bounds for sections of $m pi^(*) A$. Thus the upstairs graded ring is integral over the
    downstairs ring, and their fraction fields have the same transcendence degree. Finally $D_C tilde.op b K_C$, so
  $ kappa \( C \, A \) = kappa \( C \, \( b + 1 \) K_C \) = 0 . $
  Together with the nonzero form $eta$, this proves $kappa \( W \) = 0$, and then $h^0 \( W \, K_W \) = 1$. ◻
]

The underlying cover of Lemma 18 is the canonical root cover used in #cite(label("FujinoMori")) Remark 2.6 and
  Theorem 3.1. Over a dense open subset $U subset Y$, a rational relative pluricanonical section constructs this
  cover in families; a projective resolution, followed by shrinking $U$, gives a smooth projective morphism $h_U :
  cal(W)_U arrow.r U$. Its geometric generic fibre has the invariants in Lemma 18.
  Constancy of Hodge numbers in the smooth projective family then gives geometric genus one on every fibre.
  If their dimension is $n$, then

$ bb(V) = R^n \( h_U \)_(*) upright(bold(Q)) \, wide "rk" F^n \( bb(V) ⊗ cal(O)_U \) = 1 . $

The variation has an integral lattice modulo torsion and is polarizable,
  using a relative ample class and the Lefschetz decomposition.
  Alternatively, its primitive middle cohomology is polarizable and contains all of $H^(n \, 0)$,
  since cup product with a $\( 1 \, 1 \)$-class annihilates $H^(n \, 0)$.
  The cyclic deck transformation $xi mapsto zeta xi$ acts on the unique top form through $zeta$.
  Thus the distinguished canonical eigensheaf is the entire top Hodge line of a rational polarizable variation,
  even when the character itself is not defined over $upright(bold(Q))$.
  We do not replace the rational variation by that character eigenspace.

After a smooth projective alteration $tau : T_Y arrow.r Y$, resolution of the boundary,
  and semistable reduction in codimension one, the identification in Theorem 16 reads

#[#set math.equation(numbering: n => "(6.4)")
 $ tau^(*) M tilde.op_(upright(bold(Q))) a J \, wide a in upright(bold(Q))_(> 0) \, $ <altord:cb:hodge-realization>]

where $J$ is the Schmid extension of the top Hodge line of $tau^(*) bb(V)$, with unipotent local monodromy.
  Birational changes of the resolved root cover do not change its canonical direct image:
  on a common resolution, differential pullback identifies its canonical forms.
  The extension comparison is the one in #cite(label("AmbroBoundary")) Theorem 4.4(1),(3), Lemma 5.2(5),
  and Proposition 5.5, rather than an identification asserted only on $U$.
  Changing the chosen rational trivialization by a function from the base gives the same identification after a
  further finite base change extracting the corresponding root.

=== 6.3 Relative Iitaka reduction and section comparisons <relative-iitaka-reduction-and-section-comparisons>

#thm([Proposition 6.4.])[
  (Canonical bundle reduction).  #emph[Let $f : X arrow.r Z$ be an algebraic fibre space between smooth connected
    projective varieties, and let its geometric generic fibre $F$ have $d = kappa \( F \) gt.eq 0$.
    There exist smooth projective varieties $tilde(X) \, Y$, a birational morphism $mu : tilde(X) arrow.r X$,
    and algebraic fibre spaces
$ tilde(X) arrow.r^g Y arrow.r^q Z \, wide q g = f mu \, $

 such that $dim Y - dim Z = d$ and the geometric generic fibre of $g$ has Kodaira dimension zero.
   They admit the data $B \, M \, R$ of Theorem 16, with $R^(-)$ exceptional over $X$.
   The moduli divisor $M$ has the realization (6.4) for a polarizable rational variation whose top Hodge piece has
   rank one. Writing
$ D = K_Y + B + M \, $

 one has
#[#set math.equation(numbering: n => "(6.5)")
 $ kappa \( X \) gt.eq kappa \( Y \, D \) \, wide D \|_(Y_(macron(eta))) upright(" is big") \,
   $ <altord:cb:two-comparisons>]

 where $macron(eta)$ is a geometric generic point of $Z$. The same bigness holds on very general smooth fibres of $q$.]
] <altord:cb:reduction>

#proof[
  Over $upright(bold(C)) \( Z \)$, take a sufficiently divisible pluricanonical map of the generic fibre and its
    Iitaka fibration, including the relative algebraic closure of the image field.
    The Iitaka fibration theorem gives image dimension $d$ and Kodaira dimension zero for the geometric generic
    fibre of this fibration. Formation of its pluricanonical spaces commutes with extension to an algebraic
    closure of $upright(bold(C)) \( Z \)$; thus these statements can be checked geometrically.
    Extend the rational map to projective models over $Z$, resolve source and target,
    and take the connected-fibre factorization. This gives $X_0 arrow.r Y_0 arrow.r
    Z$ with the required dimensions. The second map has connected fibres as well:
    pushing $cal(O)_(X_0)$ first to $Y_0$ and then to $Z$ gives $cal(O)_Z$,
    because the original $f$ and the birational map to its smooth source have this property.
  Apply Theorem 16 to $X_0 arrow.r Y_0$. All its modifications can be performed over $Z$.
    Exceptionality over $X_0$ implies exceptionality over $X$.
    Lemma 18 and the subsequent family construction give the required rational variation and its top line.
    The two comparisons are proved in Lemma 20 below. ◻
]

#thm([Lemma 6.5.])[
  (Comparison of section growth).  #emph[For the factorization and canonical bundle data in Proposition 19,
    (6.5) holds.]
] <altord:cb:comparison>

#proof[
  The formula gives
  $ K_(tilde(X)) + R^(-) tilde.op_(upright(bold(Q))) g^(*) D + R^(+) . $
  Write $K_(tilde(X)) = mu^(*) K_X + E_mu$, using compatible canonical divisors.
    Since $X$ and $tilde(X)$ are smooth, $E_mu$ is effective and $mu$-exceptional.
    The same is true of $E_mu + R^(-)$. For sufficiently divisible $m$, normality and projection formula therefore give
  $ H^0 #scale(x: 120%, y: 120%)[\(] tilde(X) \, m \( K_(tilde(X)) + R^(-) \) #scale(x: 120%, y: 120%)[\)]
    tilde.eq H^0 \( X \, m K_X \) . $
  Multiplication by the canonical section of $m R^(+)$ injects $H^0 \( Y \, m D \)$ into the space on the left;
    here we also use $g_(*) cal(O)_(tilde(X)) = cal(O)_Y$. This proves $kappa \( Y \, D \) lt.eq kappa \( X \)$.
  Now make the flat base change $macron(eta) arrow.r Z$. The varieties $tilde(X)_(macron(eta))$ and
    $Y_(macron(eta))$ are smooth; the former is birational to the geometric generic fibre $F$ of $f$.
    Restrictions of canonical divisors agree, up to linear equivalence,
    with the corresponding canonical divisors of these fibres. The restricted formula consequently implies
  $ K_(tilde(X)_(macron(eta))) lt.eq_(upright(bold(Q))) g_(macron(eta))^(*) \( D \|_(Y_(macron(eta))) \) +
    R^(+) \|_(tilde(X)_(macron(eta))) . $
  Here $lt.eq_(upright(bold(Q)))$ means that the difference is $upright(bold(Q))$-linearly equivalent to an
    effective divisor. Formation of a proper direct image commutes with this flat base change, so (6.2) yields,
    for sufficiently divisible $m$,
  $ \( g_(macron(eta)) \)_(*) cal(O)_(tilde(X)_(macron(eta))) \( m R^(+) \|_(tilde(X)_(macron(eta))) \) =
    cal(O)_(Y_(macron(eta))) . $
  Projection formula now gives
  $ h^0 \( tilde(X)_(macron(eta)) \, m K_(tilde(X)_(macron(eta))) \) & lt.eq
    h^0 #scale(x: 120%, y: 120%)[\(] tilde(X)_(macron(eta)) \,
    m g_(macron(eta))^(*) \( D \|_(Y_(macron(eta))) \) + m R^(+) \|_(tilde(X)_(macron(eta)))
    #scale(x: 120%, y: 120%)[\)]\
 & = h^0 \( Y_(macron(eta)) \, m D \|_(Y_(macron(eta))) \) . $
  It follows that
  $ d = kappa \( F \) lt.eq kappa \( Y_(macron(eta)) \, D \|_(Y_(macron(eta))) \) lt.eq dim Y_(macron(eta)) = d . $
  Thus $D \|_(Y_(macron(eta)))$ is big, including the zero-dimensional case.
  For completeness, the bigness assertion spreads to a dense open subset after restricting to the smooth locus of
    $q$. Fix a relatively ample divisor $H$. Bigness on the geometric generic fibre gives,
    for some sufficiently divisible integer $m$, a nonzero section of $m D - H$ there.
    Flat scalar extension of cohomology first gives such a section over $upright(bold(C)) \( Z \)$.
    Shrinking the base, the section extends to the family and remains nonzero on its fibres.
    Hence $m D \|_(Y_z)$ is the sum of the ample divisor $H \|_(Y_z)$ and an effective divisor for general $z$,
    proving the stated very-general-fibre assertion. ◻
]

#thm([Lemma 6.6.])[
  (Further birational modifications).  #emph[Suppose $Y \, B \, M \, D$ satisfy the conclusions of Proposition 19.
    Let $nu : Y' arrow.r Y$ be a smooth projective log resolution, and write
$ K_(Y') + B^(upright("cr")) = nu^(*) \( K_Y + B \) . $

 Set $B' = \( B^(upright("cr")) \)^(+)$, $M' = nu^(*) M$, and $D' = K_(Y') + B' + M'$.
   Then $B'$ is effective, $\( Y' \, B' \)$ is klt, $M'$ is nef with the same Hodge realization after pullback, and
$ D' = nu^(*) D + \( B^(upright("cr")) \)^(-) . $

 The additional divisor is effective and $nu$-exceptional.
   Consequently $kappa \( Y' \, D' \) = kappa \( Y \, D \)$, and $D'$ is big on the geometric generic fibre over $Z$.]
] <altord:cb:high-model>

#proof[
  The nonexceptional coefficients of $B^(upright("cr"))$ are those of the effective divisor $B$,
    so its negative part is exceptional. All coefficients of $B^(upright("cr"))$ are less than one by the klt
    hypothesis. Its positive part has simple normal-crossing support and coefficients in $\[ 0 \, 1 \)$,
    proving that $\( Y' \, B' \)$ is klt. The displayed identity follows directly from the definitions.
    Exceptional effective twists do not change section spaces of a pullback to a normal base,
    so they do not change the Iitaka dimension. On the geometric generic fibre over $Z$,
    the induced map is birational and the restricted identity expresses $D'$ as the pullback of a big divisor plus
    an effective divisor. Nefness is preserved by pullback. For the Hodge assertion,
    use a common smooth alteration of $Y'$ and the alteration in (6.4);
    the unipotent Deligne and Schmid extensions commute with the resulting morphisms of smooth normal-crossing pairs. ◻
]

#prodef([Remark 6.7.])[
  After Lemma 21, $B'$ need not be described as the discriminant of the original sub-pair.
    The properties used later are precisely effectiveness and klt singularities,
    the nef Hodge realization of $M'$, and the two comparisons in (6.5); all have been preserved.
    In particular, since the big cone of $Y_(macron(eta))$ is open,
    there is a rational number $v$ with $0 < v < 1$ such that
  $ \( K_Y + B + v M \) \|_(Y_(macron(eta))) quad upright("is big") . $
  This remains true on very general fibres by the spreading argument in Lemma 20.
] <altord:cb:reduced-moduli-remark>

== 7 Ordinary subadditivity and extension of scalars <sec:ordinary>

We complete Theorem 1. Section 6 has reduced the problem to an effective klt pair $\( Y \, B \)$ with a nef Hodge
  line $M$. The period theorem writes $M = p^(*) L$. The original base map $q : Y arrow.r Z$ and this new map $p :
  Y arrow.r S$ need not factor through one another. Their combined image will first give nonvanishing on a period
  fibre. Weak positivity and one exact interpolation identity then supply the missing total-space sections.

We first work over $upright(bold(C))$. Two established positivity results will be used in precisely the following forms.

#thm([Theorem 7.1.])[
  (Subadditivity with log-general-type fibre).  #emph[Let $u : V arrow.r
    T$ be a surjective morphism with connected fibres, where $V$ is normal projective and $T$ is smooth
    projective. Let $Delta gt.eq 0$ be a $upright(bold(Q))$-divisor such that $\( V \, Delta \)$ is log canonical.
    If the log canonical divisor of the geometric generic fibre $G$ is big and $kappa \( T \) gt.eq 0$, then
$ kappa \( V \, K_V + Delta \) gt.eq dim G + kappa \( T \) . $

]
] <altord:a:log-general-type>

This is the log-general-type-fibre theorem of Kovács–Patakfalvi #cite(label("KovacsPatakfalvi")) Theorem 9.9,
  in the normal-total-space form #cite(label("Hashizume")) Theorem 2.11,
  with the auxiliary divisor equal to $K_T$. It also follows from #cite(label("Hashizume")) Theorem 1.4(1):
  a big divisor is abundant. In particular, the theorem does not require abundance of $K_T$.

#thm([Theorem 7.2.])[
  (Twisted weak positivity).  #emph[Let $u : V arrow.r T$ be a surjective morphism from a normal projective
    variety to a smooth projective variety, and let $\( V \, Delta \)$ be an effective log canonical
    $upright(bold(Q))$-pair. If $k$ is a positive integer such that $k \( K_V + Delta \)$ is Cartier, then
$ u_(*) cal(O)_V #scale(x: 120%, y: 120%)[\(] n k \( K_(V \/ T) + Delta \) #scale(x: 120%, y: 120%)[\)] $

 is weakly positive for every positive integer $n$.]
] <altord:a:weak-positivity>

This is the projective case of #cite(label("FujinoWeakPositivity")) Theorem 1.1.
  The meaning needed here is that, for a torsion-free weakly positive sheaf $cal(E)$,
  every ample Cartier divisor $A$, and every positive integer $alpha$, there is a positive integer $beta$ such that

$ #scale(x: 120%, y: 120%)[\(] "Sym"^(alpha beta) cal(E) #scale(x: 120%, y: 120%)[\)]^(* *) ⊗ cal(O)_T \( beta A \) $

is generated by global sections at the generic point; see #cite(label("FujinoWeakPositivity")) Definitions 7.1–7.2.

=== 7.1 Nonvanishing on fibres of the period projection <nonvanishing-on-fibres-of-the-period-projection>

#thm([Lemma 7.3.])[
  #emph[Let $p : Y arrow.r S$ and $q : Y arrow.r Z$ be algebraic fibre spaces between smooth projective varieties.
    Let $\( Y \, B \)$ be an effective klt $upright(bold(Q))$-pair and let $M tilde.op_(upright(bold(Q))) p^(*)
    L$ for a $upright(bold(Q))$-divisor $L$ on $S$. Suppose that $kappa \( Z \) gt.eq 0$ and
$ D := K_Y + B + M $

 is big on the geometric generic fibre of $q$. Then the geometric generic fibre of $p$ has nonnegative log Kodaira
   dimension.]
] <altord:a:period-fibre>

#proof[
  Take the Stein factorization of the map from $Y$ to its image in $S times Z$.
    Resolve its intermediate normal variety and resolve the induced rational map from $Y$,
    choosing the modification of $Y$ also to be a log resolution of $\( Y \, B \)$. We obtain morphisms
  $ Y arrow.r^r W \, wide t : W arrow.r S \, wide h : W arrow.r Z \, wide p = t compose r \, quad q = h compose r \, $
  where $Y \, W$ are smooth projective, $r$ has connected fibres, and $W arrow.r S times
    Z$ is generically finite onto its image. We continue to write $Y \, B \, M \, D$ for the modified data.
    This replacement is harmless: for such a log resolution $mu : Y' arrow.r Y$,
    take the positive part $B'$ of the crepant boundary. Then
  $ K_(Y') + B' = mu^(*) \( K_Y + B \) + E \, wide E gt.eq 0 $
  with $E$ exceptional, and $\( Y' \, B' \)$ is klt. The same identity on the general $p$-fibres preserves their
    log Kodaira dimensions. Pullback of $M$ and the effective correction preserve the required bigness on the
    geometric generic $q$-fibre.
  Since $p_(*) cal(O)_Y = cal(O)_S$ and $r_(*) cal(O)_Y = cal(O)_W$, the fibres of $t$ are connected.
    For general $s in S$, the fibre $W_s$ is smooth and connected, and $h_s : W_s arrow.r
    Z$ is generically finite onto its image. Write
  $ a = dim W_s \, wide m = dim Z . $
  The generically finite map onto its image gives $a lt.eq m$. We claim that $kappa \( W_s \) gt.eq 0$.
    The assertion is immediate for $a = 0$; assume $a > 0$. Along a smooth fibre of $t$, the cotangent sequence is
  $ 0 arrow.r Omega_(S \, s)^1 ⊗ cal(O)_(W_s) arrow.r Omega_W^1 \|_(W_s) arrow.r Omega_(W_s)^1 arrow.r 0 . $
  Since the last term has rank $a$, the entire $m$-th exterior power lies in the filtration term with at least
    $m - a$ base factors. Its quotient by the next term gives, after pulling back top forms on $Z$, a morphism
  #[#set math.equation(numbering: n => "(7.1)")
   $ h_s^(*) omega_Z arrow.r and.big^(m - a) Omega_(S \, s)^1 ⊗ omega_(W_s) . $ <altord:a:cotangent-map>]
  At a general point of a general $W_s$, the differential of $h$ has rank $m$,
    and its restriction to the tangent space of $W_s$ has rank $a$. Thus (7.1) is nonzero.
    A suitable linear functional on the constant exterior-power factor yields a nonzero morphism $h_s^(*) omega_Z
    arrow.r omega_(W_s)$.
  Choose $n > 0$ and $0 eq.not tau in H^0 \( Z \, n K_Z \)$.
    For general $s$, the image $h_s \( W_s \)$ is not contained in the zero divisor of $tau$:
    otherwise dominance of $h$ would fail. The $n$-th tensor power of the preceding morphism therefore sends
    $h_s^(*) tau$ to a nonzero section of $n K_(W_s)$. This proves the claim.
  Let $G$ be a general fibre of $r$. For general $z in Z$, such fibres form a moving family covering $Y_z$.
    A big divisor restricts to a big divisor on a general member of this family:
    restrict an ample-plus-effective decomposition, choosing a member not contained in the support of the
    effective part. Consequently $D \|_G$ is big. Since $G$ maps to a point of $S$,
    $M \|_G tilde.op_(upright(bold(Q))) 0$, and adjunction gives
  $ D \|_G tilde.op_(upright(bold(Q))) K_G + B \|_G . $
  For general $s$, the morphism $r_s : Y_s arrow.r W_s$ has connected fibres, $\( Y_s \, B \|_(Y_s) \)$ is klt,
    and its general fibre has big log canonical divisor. Theorem 23 gives
  $ kappa \( Y_s \, K_(Y_s) + B \|_(Y_s) \) gt.eq dim G + kappa \( W_s \) gt.eq 0 . $
  Finally choose $s$ outside the countably many proper jumping loci for the spaces of sections of all divisible
    log pluricanonical bundles on the smooth $p$-fibres. Generic base change identifies their dimensions with
    those on the geometric generic fibre. Thus the last nonvanishing holds on that fibre as well. ◻
]

=== 7.2 Effectivity from weak positivity <effectivity-from-weak-positivity>

#thm([Lemma 7.4.])[
  #emph[Let $p : Y arrow.r S$ be an algebraic fibre space between smooth projective varieties,
    and let $\( Y \, B \)$ be an effective klt $upright(bold(Q))$-pair.
    Suppose that the geometric generic fibre has nonnegative log Kodaira dimension.
    For every big $upright(bold(Q))$-divisor $P$ on $S$, the divisor
$ K_(Y \/ S) + B + p^(*) P $

 is $upright(bold(Q))$-linearly equivalent to an effective divisor.]
] <altord:a:effectivity>

#proof[
  Choose a dense open over which $p$ is flat. Flatten $p$ by a projective birational modification of the base and
    then resolve the base, retaining flatness of the main transform by base change;
    see #cite(label("StacksFlatten")) Lemma 38.31.1, Tag 081R.
    Resolve the resulting main transform $V arrow.r S_1$, choosing the projective resolution so that its composite
    $mu : Y_1 arrow.r Y$ is also a log resolution of $\( Y \, B \)$. Thus
  $ sigma : S_1 arrow.r S \, wide mu : Y_1 arrow.r Y \, wide p_1 : Y_1 arrow.r S_1 $
  are compatible morphisms, $S_1 \, Y_1$ are smooth projective, $sigma \, mu$ are birational, and $Y_1 arrow.r
    V$ is a resolution with $V arrow.r S_1$ flat. Any prime divisor of $Y_1$ whose image in $S_1$ has codimension
    at least two is $mu$-exceptional. Indeed, flatness implies that the inverse image of such a base subset has
    codimension at least two in $V$; hence the divisor is exceptional over $V$,
    and its image in $Y$ also has codimension at least two.
  Take the positive part $B_1$ of the crepant boundary, so that $\( Y_1 \, B_1 \)$ is effective klt and
  #[#set math.equation(numbering: n => "(7.2)")
   $ K_(Y_1) + B_1 = mu^(*) \( K_Y + B \) + E \, wide E gt.eq 0 \, quad E med
     mu upright("-exceptional") . $ <altord:a:source-correction>]
  Generic-fibre nonvanishing and field-extension base change allow us to choose a sufficiently divisible $k >
    0$ for which
  $ cal(E) = p_(1 *) cal(O)_(Y_1) #scale(x: 120%, y: 120%)[\(] k \( K_(Y_1 \/ S_1) + B_1 \)
    #scale(x: 120%, y: 120%)[\)] $
  has positive rank. Theorem 24 applies to $cal(E)$.
  Fix an ample Cartier divisor $A$ on $S_1$, and choose a positive integer $alpha$ so large that
  $ sigma^(*) P - frac(1, k alpha) A $
  is big. For some $beta > 0$, weak positivity makes
  $ #scale(x: 120%, y: 120%)[\(] "Sym"^(alpha beta) cal(E) #scale(x: 120%, y: 120%)[\)]^(* *) ⊗
    cal(O)_(S_1) \( beta A \) $
  generically generated. Set $ell = alpha beta$. Let $U subset
    S_1$ be the locally free locus of the torsion-free sheaf $cal(E)$;
    its complement has codimension at least two. On all of $U$, multiplication of sections gives
  $ "Sym"^ell cal(E) \|_U arrow.r p_(1 *) cal(O)_(Y_1) #scale(x: 120%, y: 120%)[\(] k
    ell \( K_(Y_1 \/ S_1) + B_1 \) #scale(x: 120%, y: 120%)[\)] \|_U . $
  This map is nonzero at the generic point: a nonzero section on the integral generic fibre has nonzero powers.
    Generic generation therefore supplies a global section of the twisted reflexive symmetric power whose product
    is nonzero. Its image is a regular section over $p_1^(- 1) \( U \)$ of
  $ k ell \( K_(Y_1 \/ S_1) + B_1 \) + beta p_1^(*) A . $
  Here $U$ is the locally free locus, not merely a smaller open where the chosen sections generate.
  The big divisor
  $ k ell sigma^(*) P - beta A = k ell (sigma^(*) P - frac(1, k alpha) A) $
  has an effective sufficiently divisible multiple. Taking the same power of the preceding section and multiplying
    by the pullback of a nonzero section of that multiple gives a nonzero section over $p_1^(- 1) \( U \)$ of a
    multiple of
  $ D_1 := K_(Y_1 \/ S_1) + B_1 + p_1^(*) sigma^(*) P . $
  As a rational section on $Y_1$, it has poles only above $S_1 \\ U$.
    Thus there are $n > 0$, a rational function $phi eq.not 0$, and an effective $mu$-exceptional divisor $T$ such that
  #[#set math.equation(numbering: n => "(7.3)")
   $ "div" \( phi \) + n D_1 + T gt.eq 0 . $ <altord:a:section-with-poles>]
  Choose compatible canonical divisors and put
  $ D_0 = K_(Y \/ S) + B + p^(*) P \, wide R = K_(S_1) - sigma^(*) K_S gt.eq 0 . $
  Equation (7.2) gives the exact identity
  $ D_1 = mu^(*) D_0 + E - p_1^(*) R . $
  Push (7.3) forward to the smooth variety $Y$. Since $mu_(*) E = mu_(*) T = 0$, we obtain
  $ "div" \( phi \) + n D_0 gt.eq n mu_(*) p_1^(*) R gt.eq 0 . $
  This proves rational linear effectivity of $D_0$. ◻
]

=== 7.3 Completion over the complex numbers <completion-over-the-complex-numbers>

#proof[
  If either $kappa \( F \)$ or $kappa \( Z \)$ is $- oo$, the assertion follows from the convention in the
    statement. Assume therefore that
  $ d := kappa \( F \) gt.eq 0 \, wide kappa \( Z \) gt.eq 0 . $
  Proposition 19 and Lemma 20 provide algebraic fibre spaces
  $ tilde(X) arrow.r Y arrow.r^q Z $
  and an effective klt pair $\( Y \, B \)$, together with a nef $upright(bold(Q))$-divisor $M$ having the required
    Hodge realization. Writing $D = K_Y + B + M$, their conclusions include
  #[#set math.equation(numbering: n => "(7.4)")
   $ dim \( Y \/ Z \) = d \, wide kappa \( X \) gt.eq kappa \( Y \, D \) \, wide D \|_(Y_(macron(eta))) med
     upright("big") \, $ <altord:a:reduction>]
  where $Y_(macron(eta))$ is the geometric generic $q$-fibre.
  Apply adjoint positivity, Theorem 1.2, and the compatible modifications of Lemma 21.
    We obtain an algebraic fibre space $p : Y arrow.r S$ with $S$ smooth projective and
  $ M tilde.op_(upright(bold(Q))) p^(*) L \, wide L med upright("nef") . $
  If $dim S = 0$, then $M tilde.op_(upright(bold(Q))) 0$. Theorem 23, applied directly to $q$,
    and (7.4) give the result. We may consequently suppose $dim S > 0$. Adjoint positivity also gives
  $ K_S + j L med upright("big for all sufficiently large integers ") j . $
  Openness of the big cone on $Y_(macron(eta))$ permits a rational number $v$ with $0 < v < 1$ such that
  #[#set math.equation(numbering: n => "(7.5)")
   $ \( K_Y + B + v M \) \|_(Y_(macron(eta))) med upright("is big") . $ <altord:a:reduced-moduli>]
  Lemma 25 shows that the geometric generic $p$-fibre has nonnegative log Kodaira dimension.
    Choose a sufficiently large integer $j > 1$ and an ample $upright(bold(Q))$-divisor $H$ on $S$ such that
  $ P_0 := K_S + j L - H $
  is big. Lemma 26 gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ E_1 := K_Y + B + j M - p^(*) H tilde.op_(upright(bold(Q))) K_(Y \/ S) + B + p^(*) P_0 med
     tilde.op_(upright(bold(Q))) med upright("an effective divisor") . $ <altord:a:effective-term>]
  Choose
  $ lambda = frac(1 - v, j - v) in \( 0 \, 1 \) ∩ upright(bold(Q)) \, wide lambda j + \( 1 - lambda \) v = 1 . $
  This balances the coefficients of $M$; to cancel the corresponding term $- lambda p^(*) H$, put
  $ A_S = v L + frac(lambda, 1 - lambda) H \, wide E_2 = K_Y + B + p^(*) A_S . $
  Then $A_S$ is ample and
  #[#set math.equation(numbering: n => "(7.7)")
   $ D tilde.op_(upright(bold(Q))) lambda E_1 + \( 1 - lambda \) E_2 . $ <altord:a:interpolation>]
  Choose a sufficiently divisible integer $N > 1$ such that $\| N p^(*) A_S \|$ is basepoint-free.
    A general member $T_N in \| N p^(*) A_S \|$ gives
  $ Gamma = 1 / N T_N tilde.op_(upright(bold(Q))) p^(*) A_S $
  with $\( Y \, B + Gamma \)$ klt. This follows from Bertini,
    or after pulling the basepoint-free system to a log resolution of $\( Y \, B \)$ and choosing $N$ sufficiently
    large. Thus $E_2 tilde.op_(upright(bold(Q))) K_Y + B + Gamma$ is the log canonical class of an effective klt
    pair. Its restriction to $Y_(macron(eta))$ is the big divisor in (7.5) plus the nef divisor $lambda p^(*)
    H \/ \( 1 - lambda \)$, and hence is big. Theorem 23 now yields
  $ kappa \( Y \, E_2 \) gt.eq d + kappa \( Z \) . $
  In sufficiently divisible degrees, multiplication by powers of a nonzero section in (7.6) embeds the
    corresponding linear systems of $\( 1 - lambda \) E_2$ into those of $D$.
    Positive rational scaling leaves Iitaka dimension unchanged, so
  $ kappa \( X \) gt.eq kappa \( Y \, D \) gt.eq kappa \( Y \, E_2 \) gt.eq kappa \( F \) + kappa \( Z \) \, $
  as required. ◻
]

=== 7.4 Extension to arbitrary characteristic-zero fields <extension-to-arbitrary-characteristic-zero-fields>

#thm([Lemma 7.5.])[
  #emph[Let $K subset K'$ be a field extension and let $V$ be a smooth projective geometrically integral variety
    over $K$. The Kodaira dimension of $V$ is unchanged by extending scalars to $K'$.
    The same assertion holds for the geometric generic fibre of an algebraic fibre space between smooth projective
    geometrically integral varieties when the ground field is extended.]
] <altord:a:field-extension>

#proof[
  Flat base change for proper coherent cohomology gives, in every positive degree $n$,
  $ H^0 \( V \, n K_V \) ⊗_K K' tilde.eq H^0 \( V_(K') \, n K_(V_(K')) \) . $
  The canonical bundle commutes with this smooth scalar extension. Nonvanishing is therefore unchanged.
    When the space is nonzero, choose a $K$-basis. The rational map defined by that basis and its image
    base-change to the complete pluricanonical map over $K'$;
    dimensions of finite-type schemes are unchanged by extension of the ground field.
    Taking the supremum of these image dimensions proves the first assertion, including the case $- oo$.
  For the fibre assertion, put $E = K \( Z \)$ and $E' = K' \( Z_(K') \)$,
    and write $F_K$ for the generic fibre over $E$. The generic fibre after ground-field extension is $F_K times_E
    E'$. Choose an algebraic closure $Omega$ of $E'$ and an algebraic closure $overline(E) subset Omega$ of $E$.
    The two geometric generic fibres are $F_K times_E overline(E)$ and $F_K times_E Omega$;
    the latter is a scalar extension of the former. Their Kodaira dimensions agree by the first assertion. ◻
]

To complete the proof of Theorem 1.1, let $k$ be any algebraically closed field of characteristic zero.
  The varieties, their projective embeddings, and the morphism descend to a finitely generated subfield $K subset
  k$ over $upright(bold(Q))$. Smoothness, geometric integrality and surjectivity hold for the descended data by
  faithful flatness. Proper flat base change and faithful flatness also preserve the equality $f_(*) cal(O)_X =
  cal(O)_Z$, hence the connected-fibre condition. Choose an embedding $K arrow.r.hook upright(bold(C))$.
  Lemma 27 identifies all three Kodaira dimensions in the statement with their counterparts over
  $upright(bold(C))$, using the geometric generic fibre for $F$.
  The complex case just proved therefore establishes the theorem over $k$.

== 8 An integral projective proof of adjoint positivity <p1logalt:section>

We give another proof of adjoint positivity for the whole highest Hodge line of a rationally polarized integral
  pure variation. The conclusion is the same adjoint conclusion as Theorem 2 for the rational parabolic extension
  itself. A positive rational multiple has the same conclusion after rescaling the large adjoint parameter.
  We first replace the variation by an integral tensor construction,
  then descend it through its full period map and subtract the boundary by comparing intersection growth.

The tensor construction removes every monodromy element acting trivially on the moving projective line.
  This makes a transverse loop detect strict loss of the line’s numerical dimension at each remaining boundary
  divisor. The full period map supplies an algebraic base; the differential of the map remembering only the
  highest line controls the boundary subtraction. These two ranks need not agree.

Let $P$ be a smooth connected projective complex variety, let $D$ be a reduced simple normal crossing divisor,
  and put $P^compose = P \\ D$. A #emph[top Hodge line] of a rationally polarized integral pure variation $bb(V)$
  on $P^compose$ means

$ F^p bb(V)_(cal(O)) quad upright("with") quad F^(p + 1) bb(V)_(cal(O)) = 0 \, wide "rank" F^p bb(V)_(cal(O)) = 1 . $

Here an integral variation has a local system of finite-rank free $bb(Z)$-modules,
  and the polarization is rational and flat. The weight and $p$ may be arbitrary integers.
  The line itself is a complex Hodge subbundle; no rationality assumption is made on it.
  If $V$ is a flat reference fiber, its #emph[line period map] is the equivariant holomorphic map

$ ell : tilde(P^compose) arrow.r bb(P) \( V \) \, wide x mapsto F_x^p . $

Its generic differential rank does not depend on the reference fiber.

#thm([Theorem 8.1.])[
  (Adjoint positivity).  #emph[Let $P$ be a smooth connected projective complex variety and $D$ a reduced simple
    normal crossing divisor. Let $bb(V)$ be a rationally polarized integral pure variation on $P \\ D$ whose
    highest nonzero Hodge filtration piece is a line, and let $L in "Pic" \( P \) ⊗
    upright(bold(Q))$ be its rational parabolic extension. There are a projective birational morphism $pi :
    tilde(P) arrow.r P$, with $tilde(P)$ smooth, a smooth projective variety $Z$, a surjective morphism $h :
    tilde(P) arrow.r Z$ with connected fibers, and a nef rational divisor $A$ on $Z$ such that
$ pi^(*) L tilde.op_(upright(bold(Q))) h^(*) A \, wide K_Z + a A med
  upright("is big for every sufficiently large rational ") a . $

 Here a divisor on a point is big. Further smooth birational modifications of the source are permitted by
   replacing $h$ with its composition with the modification.]
] <p1logalt:positivity>

We first specify the extension and metric facts used in the proof.

=== 8.1 Extensions and numerical dimension <extensions-and-numerical-dimension>

The monodromy theorem makes the local monodromies quasi-unipotent.
  For unipotent local monodromy, $L$ is the top filtration subbundle in the Deligne–Schmid extension.
  For quasi-unipotent monodromy, its rational extension is characterized by the following rule:
  after an adapted cover making local monodromy unipotent, its pullback is the unipotent extension,
  as a rational line bundle. This convention includes the parabolic weights;
  it is not an arbitrary choice of a Deligne lattice.

#thm([Lemma 8.2.])[
  (Extension facts).  #emph[The rational extension has the following properties.]
  + #emph[It is nef and is compatible with positive tensor powers and pullback by morphisms of smooth projective
    log pairs whose interiors map to the original interior.]
  + #emph[In the unipotent case, on each connected boundary stratum the local limiting mixed Hodge structures
    determine a unique weight-graded piece containing the top Hodge line.
    These pieces glue to a polarizable pure variation with rank-one top filtration,
    whose extended top line on the closure of the stratum is the restriction of $L$.]
  + #emph[The preceding restriction statement remains valid after an adapted cover in the quasi-unipotent case.
    In particular, numerical dimensions of restrictions may be computed on a smooth adapted cover of the stratum.]
] <p1logalt:extensions>

#proof[
  In the unipotent case the canonical extension and relative monodromy weight filtration are supplied by
    nilpotent-orbit theory #cite(label("Schmid")) #cite(label("CKS"));
    precise formulations for the top line are given in #cite(label("BFMT")) §2.5.3, Lemma 2.16, Lemma 5.6.
    The graded pieces are polarized by the primitive decomposition.
  For a boundary stratum, take the weight filtration associated with an interior point of its monodromy cone;
    it is independent of that choice. Strictness and $"rank" F^p = 1$ select one nonzero highest graded piece.
    The global object in (ii) is this pure graded variation. To check its gluing when the normal bundle is
    nontrivial, choose a local normal coordinate $t$ and write $N$ for its monodromy logarithm.
    Replacing $t$ by $t' = u \( s \) t$, with $u$ invertible along the stratum, changes the local limiting filtration by
  $ exp (- frac(log u \( s \), 2 pi sqrt(- 1)) N) . $
  Since $N$ lowers the monodromy weight filtration by two, this transition acts identically on each weight graded.
    For several normal coordinates the same calculation uses the sum of the commuting monodromy logarithms,
    which also acts trivially on their common weight graded. The pure graded data therefore glue.
    Strictness identifies the rank-one top filtration with its unique nonzero top graded piece.
    At the remaining corners, #cite(label("BFMT")) §2.5.3 and Lemma 2.16(3) identifies the canonical extensions on
    the entire smooth stratum closure, so the identification of lines holds there as well.
  For completeness, the rational convention is compatible with these operations as follows.
    In a crossing chart, take sufficiently divisible roots of its boundary coordinates.
    The resulting unipotent extension is equivariant for the finite deck group.
    A common positive power kills the characters of the stabilizers on its line fibers and descends to a line
    bundle in the original chart. The descents agree on overlaps:
    compare them on a common root cover and use the uniqueness of the unipotent extension.
    This defines a class in $"Pic" \( P \) ⊗ upright(bold(Q))$ and proves compatibility with further pullbacks and
    powers. One can perform the comparison globally on a smooth adapted alteration;
    auxiliary branch divisors cause no difficulty because the original variation extends over them.
    Nefness descends under a proper surjective morphism, since every curve downstairs is dominated by a curve
    upstairs. Finally, nef numerical dimension is unchanged by a generically finite pullback,
    so the same construction on strata proves (iii). ◻
]

#thm([Lemma 8.3.])[
  (Curvature and intersections).  #emph[The numerical dimension of the rational top Hodge line equals the generic
    rank of its line period map:
$ nu \( L \) = "rank" \( d ell \)_(upright("gen")) . $

 In the unipotent case, if $d = dim P$, $omega$ is a smooth Kähler form,
   and $alpha$ is the first Chern form of the Hodge metric on $L \|_(P^compose)$, then, for $0 lt.eq k lt.eq d$,
#[#set math.equation(numbering: n => "(8.1)")
 $ integral_(P^compose) alpha^k and omega^(d - k) = c_1 \( L \)^k dot.op \[ omega \]^(d - k) . $ <p1logalt:chern>]

 The integrals are absolutely convergent.]
] <p1logalt:rank>

#proof[
  The closed-test-form version of this calculation is proved in Lemma 37;
    that proof uses only the extension facts in Lemma 29, not any descent or rank-drop result.
    Taking the test form to be $omega^(d - k)$ gives Equation (8.1). Griffiths’ curvature formula gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ ker alpha = ker \( d ell \) . $ <p1logalt:curvature-kernel>]
  If $r$ is the generic differential rank, then $alpha^(r + 1) = 0$ everywhere on the open set,
    whereas $alpha^r and omega^(d - r)$ is positive on a nonempty open subset.
    The intersection identity and nefness therefore give $nu \( L \) = r$.
    For quasi-unipotent monodromy, both numerical dimension and differential rank are unchanged by a smooth
    adapted generically finite cover, and Lemma 29 identifies the pulled-back rational line with its unipotent
    extension. ◻
]

=== 8.2 Eliminating the projective monodromy kernel <eliminating-the-projective-monodromy-kernel>

For a variation on a connected smooth algebraic variety, we will use the condition

#[#set math.equation(numbering: n => "(8.3)")
 $ gamma ell \( x \) = ell \( x \) upright(" for every ") x quad arrow.r.double quad gamma =
   "id" quad \( gamma upright(" in the monodromy image") \) . $ <p1logalt:faithful-line>]

This is a condition on the image of the moving line, rather than on all of the ambient projective space.

#thm([Lemma 8.4.])[
  (An integral tensor replacement).  #emph[Let $U$ be a smooth connected complex algebraic variety,
    and let $bb(V)$ be a rationally polarized integral pure variation on $U$ whose highest nonzero Hodge
    filtration piece is a line $L^compose$. There are an integer $b >
    0$ and a rationally polarized integral pure variation $bb(V)_1$ on $U$ satisfying Condition (8.3),
    whose highest nonzero Hodge filtration piece is $\( L^compose \)^(⊗ b)$.
    On any smooth projective simple-normal-crossing compactification of $U$,
    the rational parabolic highest line of $bb(V)_1$ is the $b$th power of that of $bb(V)$.]
] <p1logalt:kernel>

#proof[
  For a general algebraic $U$, choose a dense quasi-projective open $U_0$.
    The map $pi_1 \( U_0 \) arrow.r pi_1 \( U \)$ is surjective, since loops can be moved off the complement.
    Thus the monodromy decompositions below are unchanged, and a flat projector of Hodge type $\( 0 \, 0 \)$ on
    $U_0$ has that type throughout $U$ by continuity. Write $Gamma$ for the original monodromy image.
    By semisimplicity #cite(label("DeligneHodgeII")) Theorem 4.2.6 and the added-in-proof note,
    the complex local system is a sum of monodromy-isotypic summands $V_j$. These are complex Hodge subvariations.
    To see this precisely, the fixed-part theorem equips $"End"_Gamma \( V \)$ with its Hodge algebra structure,
    and its center has type $\( 0 \, 0 \)$ by #cite(label("DeligneHodgeII")) Corollary 4.2.8(i),(ii).
    Equivalently, the connected Hodge action fixes every primitive central idempotent of this semisimple algebra.
    The images of those idempotents are exactly the $V_j$.
  The top line belongs to one summand $V_(j_0)$. Retain that summand and all its rational conjugates.
    Their sum is a rational subvariation: the central idempotents are defined over a finite splitting field of the
    rational commutant algebra, and the selected sum is Galois invariant.
    It inherits the rational polarization and the lattice obtained by intersecting with the original lattice.
    Denote it by $V_0$. None of this construction requires the highest line, or its scalar character, to be rational.
  Suppose $gamma in Gamma$ fixes the moving line projectively everywhere.
    Its projective fixed locus is the finite union of the projectivizations of its eigenspaces.
    The connected line image lies in one of them, so $gamma$ is scalar on the linear span $S$ of that image.
    Equivariance makes $S$ a nonzero $Gamma$-subrepresentation of $V_(j_0)$.
    Write $V_(j_0) = E ⊗ M$, with $E$ irreducible and $Gamma$ acting trivially on $M$.
    Since $S$ contains a copy of $E$, scalar action on $S$ implies the same scalar action on $E$ and hence on all
    of $V_(j_0)$. Rational conjugation gives scalar action on every retained $V_j$.
  It follows that $gamma \|_(V_0)$ preserves the Hodge filtration at any point.
    It also preserves the rational polarization and the lattice.
    The stabilizer of a polarized Hodge structure in its real polarization group is compact,
    since it preserves the positive definite Hodge metric. Its intersection with the integral automorphism group
    is finite. Therefore $gamma \|_(V_0)$ has finite order. For this particular variation,
    one may take the exponent of that finite stabilizer at a fixed base point.
    There is also a choice depending only on $R = "rank" V_0$.
    Indeed, an eigenvalue of an integral finite-order matrix of rank $R$ has order $q$ with $phi \( q \) lt.eq R$,
    because its cyclotomic minimal polynomial divides the characteristic polynomial.
    The finite set of such $q$ therefore gives the explicit permissible choice
  $ b = "lcm" { q gt.eq 1 : phi \( q \) lt.eq R } . $
  Every scalar on every retained summand has $b$th power one.
    This uniform exponent is chosen before constructing the new variation.
  Inside $V_0^(⊗ b)$ take
  $ V_1 = xor.big_(j med upright("retained")) V_j^(⊗ b) . $
  The sum is taken inside $V_0^(⊗ b)$. The individual terms are distinct direct summands in the tensor expansion,
    so the sum is direct. It is Galois invariant and hence rational, and each summand is a Hodge subvariation.
    Restricting the tensor polarization and intersecting with the tensor lattice make it rationally polarized and
    integral. The summand $V_(j_0)^(⊗ b)$ has top line $\( L^compose \)^(⊗ b)$;
    all other summands have strictly smaller highest Hodge index. Thus this is the unique top line of $V_1$.
  Every element considered above acts trivially on $V_1$. Conversely,
    if an element of the new monodromy image fixes its moving top line, choose a lift in $Gamma$.
    Injectivity of the Veronese map $bb(P) \( V_(j_0) \) arrow.r
    bb(P) \( V_(j_0)^(⊗ b) \)$ shows that the lift fixes the original moving line.
    It is therefore killed on $V_1$. This proves Condition (8.3).
    Compatibility of extensions with tensor powers finishes the proof. ◻
]

We now descend the variation itself, using faithfulness to kill monodromy along connected period fibres.
  Consequently we may normalize the period image in the relative algebraic closure of its function field in
  $upright(bold(C)) \( P \)$ before estimating boundary ranks.
  The finite-inertia contradiction in Section 4 required the actual image;
  here the tensor replacement makes fibre monodromy trivial once it fixes the moving line on an open set.

#thm([Lemma 8.5.])[
  (Full-period descent).  #emph[After applying Lemma 31 and making smooth birational modifications of the
    projective models, the resulting variation descends over a dense open subset of a smooth projective variety
    $Z$. Its descended full period map is generically immersive and satisfies Condition (8.3).
    If $A_1$ is its rational top Hodge extension, then the original extension satisfies
$ b pi^(*) L tilde.op_(upright(bold(Q))) h^(*) A_1 $

 for a morphism $h : tilde(P) arrow.r Z$ with connected fibers.]
] <p1logalt:descent>

#proof[
  Let $cal(D)$ be the period domain for the chosen polarized lattice,
    and choose an arithmetic group $Gamma_(upright("ar"))$ containing the actual monodromy image $Gamma$.
    By #cite(label("BakkerBrunebarbeTsimerman")) Theorem 1.1,
    the full period map factors through an algebraic dominant morphism $P^compose arrow.r Y_0$,
    where $Y_0$ is an irreducible quasi-projective variety and $Y_0^(upright("an")) arrow.r
    Gamma_(upright("ar")) without cal(D)$ is a closed analytic immersion.
    Normalize $Y_0$ in the relative algebraic closure of $upright(bold(C)) \( Y_0 \)$ in
    $upright(bold(C)) \( P \)$. This extension is finite, so the normalization is finite over $Y_0$.
    Its function field is relatively algebraically closed in $upright(bold(C)) \( P \)$;
    in characteristic zero this makes the generic fiber geometrically connected.
    Shrink source and target so that the latter is smooth and the map is a smooth topologically locally trivial
    fibration with connected fibers. To obtain this shrinking for the possibly nonproper source,
    stratify a proper algebraic compactification of the map together with its source boundary and restrict over
    the open base stratum.
  A local lift of the full period map along a fiber takes values in one $Gamma_(upright("ar"))$-orbit.
    These orbits are discrete, including when the quotient has finite stabilizers,
    so that lift is locally constant in fiber directions. Continuation around a fiber loop therefore fixes the
    lifted full period. Transport the loop to nearby fibers using the local trivialization.
    In flat coordinates its actual monodromy fixes the top line on a nonempty analytic open subset of the source.
    This identity extends to its connected universal cover, and Lemma 31 kills that monodromy.
    The homotopy sequence of the fibration now factors the integral representation through the ordinary
    fundamental group of the base. The filtration descends as well:
    on a simply connected base chart the pulled-back flat bundle is trivial,
    the filtration is constant on each connected fiber, and holomorphic local sections of the smooth map show that
    the descended filtration is holomorphic. Its transversality and polarization follow by pullback.
  The descended period map has the dimension of the original full period image and is generically immersive.
    Base loops lift to the source, so the same argument and Condition (8.3) show that the descended variation
    retains that condition. Shrinking introduces no change to it:
    any monodromy element fixing the line on the smaller open fixes it identically by analytic continuation.
  Choose a smooth projective compactification of the base, resolve its boundary,
    and resolve the rational map from $P$ to this compactification.
    The resulting morphism $h : tilde(P) arrow.r Z$ has connected generic fiber and hence connected fibers,
    by Stein factorization and normality of $Z$. Enlarge the source boundary to contain the inverse image of the
    chosen base boundary and resolve it. The rational extension of the original variation is unchanged where it
    already extended. Lemma 29 identifies its $b$-th power with $h^(*) A_1$. ◻
]

=== 8.3 A strict rank drop at nontrivial monodromy <a-strict-rank-drop-at-nontrivial-monodromy>

#thm([Lemma 8.6.])[
  (A transverse-loop criterion).  #emph[Let $U = Delta times Delta^(d - 1)$, with coordinates $\( z \, s \)$,
    and let $U^(*) = Delta^(*) times Delta^(d - 1)$. Suppose that a holomorphic map $ell : tilde(U^(*)) arrow.r
    bb(P) \( V \)$ is equivariant for a linear transformation $T in
    "GL" \( V \)$ under one positive turn around $z = 0$, and that $"rank" \( d ell \) lt.eq r$.
    Suppose that a holomorphic map $q : U arrow.r bb(C)^r$ has tangential differential of rank $r$ at a point of
    $z = 0$, and that on $U^(*)$ its lift satisfies $ker \( d ell \) subset.eq ker \( d q \)$.
    Then $T$ fixes every line in the image of $ell$ on a nonempty open subset.
    If $ell$ is the restriction of a line period map on a connected universal cover,
    $T$ fixes that entire line image. This includes $r = 0$, when $q$ is the map to a point.]
] <p4int:transverse-loop>

#proof[
  After shrinking around the given point, the submersion theorem provides coordinates
  $ \( z \, q_1 \, dots.h \, q_r \, u_1 \, dots.h \, u_(d - r - 1) \) . $
  The coordinate $z$ is retained because $d q$ already has rank $r$ on its zero divisor.
    On the punctured neighborhood, the kernel inclusion and the rank bound imply $"rank" \( d ell \) =
    r$ and $ker \( d q \) = ker \( d ell \)$. Fix $q$ and $u$ and make one positive turn in the $z$ coordinate.
    Along every lift of that loop, the derivative of $ell$ vanishes, so its value is constant.
    Its endpoints are related by $T$, which consequently fixes the initial line.
    Varying the fixed coordinates proves the claim on an open subset.
    The projective equality $T ell = ell$ then extends by the identity theorem to the connected universal cover.
    For $r = 0$, the rank bound makes $ell$ locally constant and the same loop argument applies with no $q$
    coordinates. ◻
]

#thm([Lemma 8.7.])[
  (Boundary rank drop).  #emph[Let $Z$ be smooth projective, let $D$ be a reduced simple normal crossing divisor,
    and let a polarizable integral pure variation on $Z \\ D$ have a top Hodge line satisfying Condition (8.3).
    Write $A_1$ for its rational extension and $r = nu \( A_1 \)$.
    If $D_i$ is a component whose transverse monodromy is not the identity, then
$ nu \( A_1 \|_(D_i) \) < r . $

]
] <p1logalt:boundary-drop>

#proof[
  If the boundary rank did not drop, suitable single-valued functions of the moving line would have the same
    differential kernel as that line. A transverse loop in one of their fibers would then force the monodromy to
    fix the moving line on an open set, contradicting Condition (8.3) after analytic continuation.
  Work at a general point of $D_i$, with coordinates $\( z \, s \)$ on $Delta times Delta^(d - 1)$ and $D_i =
    { z = 0 }$. Write $T = T_s T_u$ for the Jordan decomposition of the transverse monodromy and put $N =
    log T_u$. Choose $e > 0$ with $T_s^e = 1$ and set $z = t^e$.
    In flat coordinates the nilpotent orbit extension supplies a holomorphic line map $Psi$ on the root polydisk
    such that
  #[#set math.equation(numbering: n => "(8.4)")
   $ ell \( t \, s \) = exp (frac(e log t, 2 pi sqrt(- 1)) N) Psi \( t \, s \) \, wide Psi \( zeta t \, s \) =
     T_s Psi \( t \, s \) \, quad zeta = exp \( 2 pi sqrt(- 1) \/ e \) . $ <p1logalt:untwist>]
  These are equalities of lines; $ell$ is evaluated on the logarithmic cover when necessary.
  Let $W = W \( N \)$, centered at the weight of the variation.
    On the boundary there is a unique index $k$ in which the top line has a nonzero weight-graded image.
    The map $N$ is a strict morphism of limiting mixed Hodge structures of type $\( - 1 \, - 1 \)$.
    Since $F^(p + 1) = 0$, it gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ F^p ∩ N V = N \( F^(p + 1) \) = 0 . $ <p1logalt:survives>]
  Thus the limiting line survives in $C = V \/ N V$.
  We also need to preserve its derivative rank. The primitive decomposition of the fixed graded local system identifies
  $ "Gr"_k^W V = P_k xor N "Gr"_(k + 2)^W V \, wide P_k arrow.r^(med tilde.op med) "Gr"_k^W C . $
  Here $k$ is at least the original weight: lower graded pieces are entirely in the image of $N$ and cannot
    contain the top line. The second summand has zero $F^p$, so the graded moving top line lies in the flat
    primitive summand $P_k$. Its projective derivative rank is therefore unchanged by the displayed isomorphism.
    Projecting the boundary line in $C$ further to its relevant graded piece recovers precisely this pure line
    period map. By Lemmas 29 and 30, its rank is
  $ r_i = nu \( A_1 \|_(D_i) \) . $
  This equality may be checked on a global adapted cover: restriction of the pulled-back line to a component
    dominating $D_i$ is its generically finite pullback, which preserves numerical dimension.
  Equation (8.4) makes $Psi \( 0 \, s \)$ an eigenline of $T_s$.
    Its eigenvalue $lambda$ is constant on a sufficiently small connected boundary neighborhood.
    Let $E = C_lambda$ and let $q_0 : V arrow.r E$ be the quotient followed by the eigenspace projection.
    The projective map
  $ Q \( t \, s \) = bb(P) \( q_0 \) \( Psi \( t \, s \) \) $
  is defined near the chosen boundary point and has boundary rank at least $r_i$.
    Since $N$ vanishes on $C$, it also equals $bb(P) \( q_0 \) \( ell \( t \, s \) \)$.
    Moreover $T_s$ acts by a scalar on $E$, so $Q \( zeta t \, s \) = Q \( t \, s \)$.
    Hence $Q$ descends holomorphically to the original $\( z \, s \)$-polydisk, including $z = 0$.
    This descent uses a projective map; a choice of a fractional scalar frame is unnecessary.
  Suppose $r_i gt.eq r$. Choose $r$ affine coordinates of $Q$, denoted $q_1 \, dots.h \, q_r$,
    whose differentials are independent along $D_i$. The map $q = \( q_1 \, dots.h \, q_r \)$ factors locally
    through $ell$ on the punctured chart. Its differential therefore satisfies the kernel inclusion in Lemma 33.
    The rank bound for $ell$ is $r$ by Lemma 30. The transverse-loop lemma shows that $T$ fixes the moving highest
    line everywhere on the connected universal cover. Condition (8.3) gives $T = "id"$,
    contrary to the choice of the divisor. If $r = 0$, the same lemma applies with no coordinate functions.
    If $r > d - 1$, the supposed inequality $r_i gt.eq r$ is already impossible. ◻
]

=== 8.4 Removing the boundary from the adjoint class <removing-the-boundary-from-the-adjoint-class>

#thm([Lemma 8.8.])[
  (A boundary subtraction estimate).  #emph[Let $Z$ be smooth projective of positive dimension $d$,
    let $A_1$ be a nef rational divisor, and let $J = sum_i D_i$ be reduced with smooth components.
    Suppose $K_Z + J$ is big and
$ nu \( A_1 \|_(D_i) \) < r := nu \( A_1 \) quad upright("for every ") i . $

 Then $K_Z + a A_1$ is big for every sufficiently large rational $a$.]
] <p1logalt:volume>

#proof[
  If $r = 0$, the restriction hypothesis forces $J = 0$, so $K_Z$ is already big. Suppose $r > 0$.
    By Kodaira’s lemma write
  $ K_Z + J tilde.op_(upright(bold(Q))) H + E \, wide H upright(" ample") \, quad E gt.eq 0 \, $
  and set $B_a = H + a A_1$ for rational $a gt.eq 0$. Choose one ample integral divisor $C_0$ such that both $C_0$
    and $C_0 + J$ are globally generated, and put $H' = H + C_0$.
    This choice is independent of $a$ and of all section degrees below.
  For every sufficiently divisible $m > 0$, filter by $k J$ for $0 lt.eq k < m$. The restriction sequences give
  $ h^0 #scale(x: 120%, y: 120%)[\(] Z \, m \( B_a - J \) #scale(x: 120%, y: 120%)[\)] gt.eq
    h^0 \( Z \, m B_a \) - sum_(k = 0)^(m - 1) h^0 #scale(x: 120%, y: 120%)[\(] J \, \( m B_a - k J \) \|_J
    #scale(x: 120%, y: 120%)[\)] . $
  Since $J$ is reduced, its structure sheaf injects into $xor.big_i cal(O)_(D_i)$. Also
  $ m C_0 + k J = \( m - k \) C_0 + k \( C_0 + J \) $
  is globally generated. On each $D_i$, multiplication by a section which is not identically zero bounds the
    restricted summand by $h^0 \( D_i \, m \( H' + a A_1 \) \|_(D_i) \)$. We obtain the exact estimate
  #[#set math.equation(numbering: n => "(8.6)")
   $ h^0 #scale(x: 120%, y: 120%)[\(] Z \, m \( B_a - J \) #scale(x: 120%, y: 120%)[\)] gt.eq
     h^0 \( Z \, m B_a \) - m sum_i h^0 #scale(x: 120%, y: 120%)[\(] D_i \,
     m \( H' + a A_1 \) \|_(D_i) #scale(x: 120%, y: 120%)[\)] . $ <p1logalt:uniform-sections>]
  Fix $a$ and divide by $m^d \/ d !$. Asymptotic Riemann–Roch for the ample divisors involved,
    along divisible $m arrow.r oo$, yields
  #[#set math.equation(numbering: n => "(8.7)")
   $ "vol" \( B_a - J \) gt.eq B_a^d - d sum_i \( H' + a A_1 \)^(d - 1) dot.op D_i . $ <p1logalt:uniform-volume>]
  No uniform Riemann–Roch remainder in $a$ is needed: the exact inequality in Equation (8.6) holds for every $a$,
    and the limit is taken with $a$ fixed.
  The first polynomial on the right of Equation (8.7) has degree $r$,
    with positive leading coefficient $binom(d, r) A_1^r H^(d - r)$.
    Every restriction polynomial has degree at most $nu \( A_1 \|_(D_i) \) lt.eq r - 1$.
    The right side is therefore positive for every sufficiently large $a$.
    Finally $K_Z + a A_1 tilde.op_(upright(bold(Q))) \( B_a - J \) + E$ is big. ◻
]

#proof[
  Apply Lemmas 31 and 32. We obtain a variation on a dense open of a smooth projective $Z$ satisfying
    Condition (8.3), with generically immersive full period map,
    and rational Hodge extension $A_1$ satisfying $b pi^(*) L tilde.op_(upright(bold(Q))) h^(*) A_1$.
    Resolve the boundary so that it is simple normal crossing. Pullback compatibility retains the line identity.
    Delete every boundary component with identity transverse monodromy, and call the remaining reduced divisor $J$.
  The variation extends to $Z \\ J$. Indeed, at a point lying only on deleted components all local monodromies are
    the identity, and the nilpotent orbit extension with all monodromy logarithms zero is a pure polarized
    extension. The full period map is still generically immersive.
    Thus #cite(label("BrunebarbeCadorel")) Theorem 1.1 and Remark 1.2(1) applies to the polarized variation on
    $Z \\ J$ and gives the bigness of $K_Z + J$; its hypothesis is immersivity at one point,
    and it imposes no extra condition on boundary monodromy. Lemma 34 applies to every component of $J$,
    and Lemma 35 proves that $K_Z + a A_1$ is big for all sufficiently large rational $a$.
    When $dim Z = 0$ the assertion holds by convention. Set $A = A_1 \/ b$.
    This is nef, satisfies $pi^(*) L tilde.op_(upright(bold(Q))) h^(*) A$,
    and has the same asserted adjoint positivity after rescaling the large parameter. ◻
]

#prodef([Remark 8.9.])[
  The construction permits $nu \( A \) < dim Z$. In particular,
    the algebraic map $h$ is obtained from the full period map of an integral tensor replacement;
    its fibers are not asserted to be the leaves of the line period map.
    Neither abundance nor semiampleness of $A$ occurs in the argument.
] <p1logalt:no-abundance>

== 9 Chern intersections and boundary limits of a highest Hodge line <p1varhd:section>

We prove the Chern-intersection formula deferred in Lemma 30,
  and then give a different proof of the boundary restriction estimate in Lemma 34.
  Its two ingredients are a Chern-intersection formula with arbitrary smooth closed test forms and a family of
  Thom forms concentrating on a boundary component. The limiting Hodge norm computes the tangential curvature at a
  general boundary point; a product Poincaré bound controls the crossings and permits passage to the restriction
  intersection number.

Throughout this section, $R$ is a smooth connected projective complex variety,
  $D_R$ is a reduced simple-normal-crossing divisor, and $bb(V)$ is a polarizable integral pure variation on
  $R \\ D_R$. A highest Hodge line is its highest nonzero filtration piece $F^p$, with $F^(p + 1) =
  0$ and $"rank" F^p = 1$. We denote its rational parabolic extension by $A$.
  The parabolic convention includes finite-monodromy weights.
  Its line period map is the map from the universal cover of $R \\ D_R$ to the projective space of a fixed flat
  reference fiber which remembers $F^p$. Its rank need not equal the full-period rank. For $n = dim R$ we use

$ nu \( A \) = max { j in { 0 \, dots.h \, n } : c_1 \( A \)^j dot.op H^(n - j) > 0 } \, $

where $H$ is any ample class and $A$ is nef. In particular, this numerical dimension is zero on a point.
  Normalize $d d^c = frac(i, 2 pi) partial macron(partial)$.

Lemma 29 supplies nefness and compatibility of the rational extension with positive tensor powers and log-pair
  pullbacks whose interiors map into the original interior.
  The Chern-intersection formula below uses these extension properties,
  but neither full-period descent nor a boundary rank-drop result.
  For strict rank loss we also use the integral tensor replacement of Lemma 31 and the transverse-loop criterion
  of Lemma 33. The replacement is faithful on the moving highest line:
  a monodromy element fixing that line at every point of the connected universal cover is the identity.
  The Thom-form calculation computes restriction intersections from tangential limiting curvature.
  It uses the local graded Hodge data, without identifying the boundary restriction with a globally extended
  graded line as in Section 8.

=== 9.1 Curvature and intersection powers <curvature-and-intersection-powers>

#thm([Lemma 9.1.])[
  (Chern intersections with closed test forms).  #emph[Let $A$ be the rational parabolic highest line of an
    integral polarized pure variation on the complement of a reduced simple-normal-crossing divisor in a smooth
    projective variety $R$. Then
#[#set math.equation(numbering: n => "(9.1)")
 $ nu \( A \) = upright("generic differential rank of its projective line map") $ <p1varhd:numrank>]

 provided $A$ is nef. In the unipotent case, if $alpha$ is the Chern form of its Hodge metric on $R \\ D_R$,
   then for every $0 lt.eq j lt.eq n = dim R$ and every smooth closed form $gamma$ of type $\( n - j \, n - j \)$,
   the integral $integral_(R \\ D_R) alpha^j and gamma$ is absolutely convergent and equals $c_1 \( A \)^j
   dot.op \[ gamma \]$.]
] <p1varhd:curvature>

#proof[
  We may compute after a generically finite smooth alteration on which all boundary monodromies are unipotent.
    To obtain one, pass to a finite level cover with neat monodromy, compactify, and resolve.
    Quasi-unipotence then gives unipotence, including for the commuting local monodromies on the resolved
    boundary. The parabolic pullback property of Lemma 29 identifies the new line with the pullback of $A$.
    Generically finite pullback preserves nef numerical dimension by the intersection and projection formulas.
    It also preserves the generic differential rank in characteristic zero.
    We therefore work on the unipotent model, retaining the notation $R \, A$.
  Let $alpha$ be the semipositive Chern form of the highest-line Hodge metric on the open part.
    Griffiths’ curvature formula #cite(label("GriffithsPeriodsIII")) Theorem 5.2, Formula 5.3,
    and Formula 6.18 says that $alpha \( v \, macron(v) \)$ is a positive fixed multiple of the squared norm of
    the projective highest-line differential in direction $v$. In particular, its rank is the rank in (9.1).
  Consider a crossing chart with coordinates $z_1 \, dots.h \, z_n$ and boundary $z_1 dots.h.c z_c = 0$.
    Put $rho_i = - log \| z_i \|^2$ and shrink the chart so that $rho_i > e$.
    The horizontal Schwarz estimate, applied separately to the coordinate disks, gives
  #[#set math.equation(numbering: n => "(9.2)")
   $ 0 lt.eq alpha lt.eq C Omega \, wide Omega = sum_(i = 1)^c
     frac(i thin d z_i and d macron(z)_i, \| z_i \|^2 rho_i^2) + sum_(i = c + 1)^n i thin d z_i and
     d macron(z)_i . $ <p1varhd:poincare>]
  Here and below harmless positive normalization constants are absorbed into $C$.
    The coordinate estimate follows from the curvature of the horizontal period metric and the singular
    Ahlfors–Schwarz lemma; see #cite(label("BrunebarbeCadorel")) §2.1, Proposition 2.4 and Lemma 2.5.
    Positivity and the Hermitian-form Cauchy–Schwarz inequality control the off-diagonal entries and give the
    uniform product estimate (9.2), even where the period differential is degenerate.
  By the nilpotent-orbit theorem #cite(label("Schmid")) Theorem 4.12, a nonvanishing top extension frame,
    written in flat coordinates on a bounded angular sector, is
  #[#set math.equation(numbering: n => "(9.3)")
   $ v \( z \) = exp (sum_(i = 1)^c frac(log z_i, 2 pi i) N_i) u \( z \) \, $ <p1varhd:frame>]
  where the $N_i$ commute and $u$ is holomorphic and nonvanishing.
    If $beta$ is the curvature of a fixed smooth metric on $A$, write $alpha - beta = d d^c phi$.
    The ratio of the two metrics satisfies
  #[#set math.equation(numbering: n => "(9.4)")
   $ \| phi \( z \) \| lt.eq C (1 + sum_(i = 1)^c log rho_i) . $ <p1varhd:loglog>]
  This is the logarithmic growth estimate for canonical Hodge frames;
    see #cite(label("CattaniKaplanDegenerating")) Theorem 5.1.
    Here the Schwarz estimate also gives a direct proof of the bound needed for integration.
    The differential of the logarithmic Hodge norm of any flat vector is bounded by a constant times the invariant
    period metric, with a constant independent of the point by homogeneity.
    Travel from a fixed point along coordinate paths in a bounded angular sector.
    Their product-Poincaré length is bounded by $C \( 1 + sum_i log rho_i \)$,
    so the Hodge metric and its inverse in a flat frame grow at most as products of powers of the $rho_i$.
    The exponential in (9.3) and its inverse are polynomials in the logarithms,
    since the $N_i$ are commuting nilpotent operators. Finally,
    $u$ has ordinary norm bounded above and below on a smaller chart.
    These three observations give the upper and lower logarithmic bounds in (9.4).
    We have therefore obtained the two controls needed for the cutoff argument:
  #[#set math.equation(numbering: n => "(9.5)")
   $ 0 lt.eq alpha lt.eq C Omega \, wide \| phi \| lt.eq C #scale(x: 180%, y: 180%)[\(] 1 +
     sum_i log rho_i #scale(x: 180%, y: 180%)[\)] . $ <p1logalt:metric-bounds>]
  Chern-current representation for canonical Hodge extensions is established in
    #cite(label("CattaniKaplanDegenerating")) Theorem 5.2. We now justify the highest-line intersection formula
    with closed test forms, including the absence of boundary contributions.
    For $0 lt.eq j lt.eq n$ and every smooth closed form $gamma$ of type $\( n - j \, n - j \)$,
  #[#set math.equation(numbering: n => "(9.6)")
   $ integral_(R \\ D_R) alpha^j and gamma = c_1 \( A \)^j dot.op \[ gamma \] . $ <p1varhd:chern>]
  The case $j = 0$ is immediate, so assume $j > 0$. Choose a smooth function $chi$ that is one on
    $\( - oo \, 1 \]$ and zero on $\[ 2 \, oo \)$, and use products of $chi \( \( log rho_i \) \/ M \)$ to cut off
    the boundary. The $rho_i$ can be globalized using smooth metrics on the boundary divisor bundles.
    Denote the resulting cutoff by $chi_M$. Its second derivatives are uniformly bounded in the product-Poincaré
    metric, and their support escapes to the boundary as $M arrow.r oo$.
  Since all curvature forms are closed, on the open part we have
  $ alpha^j - beta^j = d d^c (phi sum_(k = 0)^(j - 1) alpha^k and beta^(j - 1 - k)) . $
  Multiplying by $chi_M gamma$ and integrating by parts makes the difference of the integrals equal to
  $ integral phi thin d d^c chi_M and sum_(k = 0)^(j - 1) alpha^k and beta^(j - 1 - k) and gamma . $
  Its absolute value is bounded on escaping tails by a constant times
  $ (1 + sum_i log rho_i) Omega^n . $
  This is integrable: in a cusp variable the relevant radial integrals are bounded by
    $integral^oo \( 1 + log rho \) rho^(- 2) thin d rho$. Thus the error tends to zero.
    The same domination permits removal of $chi_M$ from the two curvature integrals, proving (9.6).
    Rational bundles are handled by first taking an integral tensor power and then dividing the forms and
    identities by that power.
  Let $r$ be the generic rank of the projective line map. Then $alpha^(r + 1) = 0$ on the open part,
    whereas $alpha^r$ is nonzero and positive on a nonempty open subset.
    Apply (9.6) with complementary powers of an ample Kähler form.
    It gives vanishing of the $\( r + 1 \)$st intersection power and strict positivity of the $r$th one.
    The nef intersection characterization proves (9.1). ◻
]

=== 9.2 Rank loss at a monodromy divisor <rank-loss-at-a-monodromy-divisor>

#thm([Lemma 9.2.])[
  (Boundary rank drop by a Thom-form calculation).  #emph[In the setting of Lemma 37,
    suppose that monodromy is faithful on the moving highest line.
    If $D_i$ is a boundary component with nonidentity transverse monodromy, then
#[#set math.equation(numbering: n => "(9.7)")
 $ nu \( A \|_(D_i) \) < nu \( A \) . $ <p1varhd:strictdrop>]

]
] <p1varhd:boundary>

#proof[
  Put $r = nu \( A \)$. We first compute a bound for the numerical dimension on a boundary component of a
    unipotent model. This computation is unchanged on a component dominating $D_i$ under a generically finite
    alteration, since restriction of the pulled-back line is the generically finite pullback of $A \|_(D_i)$.
  ===== 9.2.1 The limiting highest line. <the-limiting-highest-line.>
  Near a general point of a unipotent boundary component write the coordinates as $\( t \, s \)$,
    with divisor $t = 0$ and monodromy logarithm $N$. Let $w$ be the weight and $p$ the largest filtration index.
    The limiting mixed Hodge structure is polarized by $N$ #cite(label("Schmid")) Theorem 6.16;
    its graded structures vary as polarized variations along the smooth boundary stratum
    #cite(label("CattaniKaplanDegenerating")) Proposition 2.10 and the following discussion.
    The limiting $F^p$ has dimension one and $F^(p + 1) = 0$.
    Consequently it consists of one Deligne summand $I^(p \, q)$. Write $p + q = w + l$.
    In the primitive decomposition for $N$, a nonzero $N^k$-image term with $k >
    0$ would have to come from $F^(p + k)$, which is zero. The line is therefore primitive, $l gt.eq 0$, and,
    for a nonzero vector $u_0 \( s \) = u \( 0 \, s \)$ spanning it,
  $ N^l u_0 \( s \) eq.not 0 \, wide N^(l + 1) u_0 \( s \) = 0 . $
  Shrink the boundary stratum so that its Hodge type, and hence $l$, is fixed.
  For a highest Hodge vector in the pure variation, the Hodge norm is the flat polarization pairing with its
    conjugate, multiplied by the fixed factor determined by its Hodge type.
    Substituting the exponential frame into that pairing gives a polynomial in $y = - log \| t \|$.
    Primitive polarization identifies its leading term as a positive constant times $y^l$ times the squared norm
    $h_l \( s \)$ of the primitive graded line. Replacing $u \( t \, s \)$ by $u_0 \( s \)$ introduces errors
    $O \( \| t \| \)$ times powers of $y$; the same holds after tangential differentiation,
    by holomorphicity of $u$. It follows, locally uniformly with tangential derivatives, that
  #[#set math.equation(numbering: n => "(9.8)")
   $ log parallel v \( t \, s \) parallel^2 = l log y + log h_l \( s \) + c + O \( y^(- 1) \) +
     O \( \| t \| y^M \) $ <p1varhd:limitnorm>]
  for some $M$ and a constant $c$. Thus the tangential curvature converges to the curvature of the primitive
    graded highest line. If $q_i$ denotes the generic rank of its projective differential,
    the limiting tangential curvature has rank at most $q_i$.
  ===== 9.2.2 The restriction intersection and crossing points. <the-restriction-intersection-and-crossing-points.>
  We claim that
  #[#set math.equation(numbering: n => "(9.9)")
   $ nu \( A \|_(D_i) \) lt.eq q_i . $ <p1varhd:restrictionrank>]
  The following estimate proves the claim without assuming uniform convergence of (9.8) at crossings.
    Fix an ample Kähler form $omega$ and an integer $j$ with $q_i < j lt.eq n - 1$.
    Choose a smooth metric on $cal(O) \( D_i \)$, write its curvature as $beta_i$, and put $tau =
    log parallel s_(D_i) parallel^2$. Let $g$ be a fixed smooth convex function with $g' =
    0$ on $\( - oo \, 0 \]$ and $g' = 1$ on $\[ log 4 \, oo \)$, and set $f_epsilon.alt \( x \) =
    g \( x - log epsilon.alt^2 \)$. Then
  #[#set math.equation(numbering: n => "(9.10)")
   $ eta_epsilon.alt = beta_i + d d^c f_epsilon.alt \( tau \) = \( 1 - f'_epsilon.alt \( tau \) \) beta_i +
     frac(i, 2 pi) f''_epsilon.alt \( tau \) partial tau and macron(partial) tau $ <p1varhd:thom>]
  is a smooth closed representative of $c_1 \( cal(O) \( D_i \) \)$.
    Here the normalization is $d d^c log \| t \|^2 = \[ t = 0 \]$.
    The function $f_epsilon.alt \( tau \)$ is constant near $D_i$, so it extends smoothly there.
    Outside $parallel s_(D_i) parallel lt.eq 2 epsilon.alt$, the two curvature terms cancel and $eta_epsilon.alt = 0$.
  On a crossing chart put
  $ lambda = frac(i thin d t and d macron(t), \| t \|^2) \, wide rho = - log \| t \|^2 \, wide Omega = lambda /
    rho^2 + Omega_s \, wide T = alpha^j and omega^(n - 1 - j) . $
  The tangential form $Omega_s$ is a product cusp metric, with Euclidean summands in the remaining coordinates.
    It has finite volume. The bound (9.2) gives $0 lt.eq T lt.eq C Omega^(n - 1)$.
    Write $tau = log \| t \|^2 + psi$ with $psi$ smooth, and put $L_epsilon.alt = \| log epsilon.alt \|$.
    The smooth first term of (9.10) contributes at most
  $ C integral_(\| t \| lt.eq C epsilon.alt) Omega^n = O \( L_epsilon.alt^(- 1) \) . $
  For the second term write $partial tau = a_0 + b_0$, with $a_0 = d t \/ t$ and $b_0 = partial psi$.
    Its support lies in $c epsilon.alt lt.eq \| t \| lt.eq C epsilon.alt$, with constants independent of $s$.
    On this shell, positivity gives
  $ integral i a_0 and macron(a)_0 and T & = O \( 1 \) \,\
integral i b_0 and macron(b)_0 and T & lt.eq C integral_(c epsilon.alt lt.eq \| t \| lt.eq C epsilon.alt)
  Omega^n = O \( L_epsilon.alt^(- 2) \) . $
  The first estimate follows because wedging with $lambda$ selects only the tangential part of $T$.
    For the second, a smooth positive form dominating $i b_0 and macron(b)_0$ is bounded by $C Omega$.
    Cauchy–Schwarz for the positive form $T$ now bounds the mixed terms by $O \( L_epsilon.alt^(- 1) \)$.
    The bounded coefficient $f''_epsilon.alt$ does not change these estimates.
  It remains to consider the pure normal-shell term. Set $t = epsilon.alt u$. Its cutoff coefficient becomes
  $ g'' #scale(x: 120%, y: 120%)[\(] log \| u \|^2 + psi \( epsilon.alt u \, s \) #scale(x: 120%, y: 120%)[\)] \, $
  whose support is contained in a fixed annulus, since $psi$ is bounded.
    The absolute integrand is bounded, independently of $epsilon.alt$, by
  $ C thin frac(i thin d u and d macron(u), \| u \|^2) and Omega_s^(n - 1) . $
  This is integrable on that annulus times the tangential chart, including all tangential divisor crossings.
    For almost every $s$, (9.8) gives a tangential curvature limit of rank less than $j$,
    so the tangential $j$th power tends to zero. Dominated convergence makes the pure normal-shell integral tend
    to zero. The estimates are uniform under truncating the tangential cusp variables,
    so no mass is lost when those truncations are removed. Choose a finite partition of unity subordinate to
    crossing charts. Multiplication by its bounded smooth functions preserves each absolute estimate.
    Summing the local estimates proves the same conclusion on all of $D_i$;
    no integration by parts is performed after inserting this partition.
  For each fixed $epsilon.alt$, apply (9.6) with $gamma = omega^(n - 1 - j) and eta_epsilon.alt$.
    Its cohomology class is independent of $epsilon.alt$. The preceding limit gives
  $ c_1 \( A \|_(D_i) \)^j dot.op \[ omega \|_(D_i) \]^(n - 1 - j) = 0 . $
  Nefness proves (9.9). If $q_i = n - 1$, that inequality is automatic.
    This also explains why the generic limit calculation alone would not be sufficient:
    the uniform product bound is what controls the crossing locus.
  ===== 9.2.3 A fixed quotient and transverse loops. <a-fixed-quotient-and-transverse-loops.>
  Return to the original boundary component, with transverse monodromy $T_s exp N$, where $T_s$ has finite order.
    Work first in a transverse root coordinate killing $T_s$.
    Set $C_N = "coker" N$, endowed with the quotient of the fixed monodromy weight filtration.
    The primitive limiting line of weight $k = w + l$ projects nontrivially into $W_k C_N$. The fixed linear quotient
  #[#set math.equation(numbering: n => "(9.11)")
   $ W_k C_N arrow.r "Gr"_k^W C_N $ <p1varhd:fixedquotient>]
  recovers its primitive graded line. Indeed, in the Lefschetz decomposition of $"Gr"_k^W$,
    quotienting by the image of $N$ removes exactly the summands that are positive powers of $N$ applied to higher
    primitives. The induced quotient is the primitive part of weight $k$.
    In particular, projective differential rank cannot increase under (9.11).
    No choice of a moving primitive splitting is involved.
  The limiting line in $C_N$ lies in one $T_s$-eigenspace. Compose the quotient by $N$ with the fixed projection
    onto this eigenspace. Near the chosen general boundary point this gives a nonzero holomorphic projective map
    from the untwisted highest line. Under deck rotation the untwisted line is acted on by $T_s$;
    on the projected eigenspace that action is scalar. The projective map therefore descends to the original
    chart. On the punctured chart it factors through the moving highest-line map,
    since the exponential of $N$ disappears in $C_N$. Its boundary differential rank is at least the rank $q_i$ of
    the primitive graded line.
  Suppose $nu \( A \|_(D_i) \) gt.eq r$. By (9.9), the projected map has at least $r$ independent tangential
    differentials at a general boundary point. Choose $r$ affine components $g_1 \, dots.h \,
    g_r$ with that property. Their differentials are independent along the boundary at that point,
    and the map $g = \( g_1 \, dots.h \, g_r \)$ extends holomorphically over the original chart.
    On the punctured chart it factors through the highest-line map. Lemma 37 gives the latter rank at most $r$.
    The hypotheses of the transverse-loop criterion (Lemma 33) are therefore satisfied in the original transverse
    coordinate, before the finite root cover. It follows that the original transverse monodromy fixes the moving
    line on the connected universal cover. This contradicts faithfulness and its nonidentity.
    When $r = 0$, use the same lemma with an empty list of functions; when $r > n - 1$,
    the supposed inequality $nu \( A \|_(D_i) \) gt.eq r$ is impossible on dimensional grounds.
    This proves Equation (9.7). ◻
]

=== 9.3 Connection with the integral projective argument <connection-with-the-integral-projective-argument>

The hypotheses required for the preceding calculation arise from the integral tensor replacement and full-period
  descent in Lemmas 31 and 32. On the resulting projective base,
  Lemma 38 gives the same strict inequality as Lemma 34, with the boundary intersection justified directly by Thom
  forms. The boundary subtraction estimate of Lemma 35 then applies to the union $J$ of the divisors with
  nonidentity transverse monodromy. The full-period map supplies the bigness of $K_R +
  J$ as in the proof of Theorem 28; the highest-line rank supplies the strict decrease in the degree of the
  restriction polynomials. Thus the two different period ranks retain their separate roles in adjoint positivity.

#prodef([Remark 9.3.])[
  (Tensor replacement on a restricted locus).  The same local results also give the curve-constancy part of the
    highest-line properties used in such comparisons. On a smooth complete curve,
    degree zero gives zero integral of the semipositive Hodge curvature by Equation (9.6),
    after an adapted cover if necessary. The curvature is therefore zero,
    and the highest line is projectively constant in a flat reference.
    If the highest line is projectively constant on a connected smooth algebraic locus,
    apply Lemma 31 to the restricted variation itself. Use its own monodromy image and isotypic decomposition:
    restricting an ambient replacement need not preserve faithfulness,
    because the restricted line image may have a larger projective stabilizer.
    Every monodromy element of the replacement fixes its constant highest line,
    so faithfulness makes that monodromy trivial. Since the new line is a positive tensor power of the original
    line, the original highest-line character on that locus has finite image.
    The tensor exponent here is allowed to depend on the restricted variation.
] <p4int:restricted-tensor>

#prodef([Remark 9.4.])[
  The adjoint conclusion is preserved under further smooth projective birational modification $pi : R' arrow.r R$,
    together with a compatible modification of the source. The parabolic pullback property preserves the
    line-bundle identity and nefness, while
  $ K_(R') + b pi^(*) A = pi^(*) \( K_R + b A \) + E_pi \, wide E_pi gt.eq 0 \, $
  preserves bigness. The calculations here concern the whole rank-one highest step of a polarizable integral pure
    variation on a projective pair; they assert no equality between highest-line rank, full-period rank,
    and whole-fiber birational variation.
] <p1varhd:further-models>

#bibliography("refs.bib", style: "ieee", title: [References])
