#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[An explicit counterexample to the Auslander--Reiten conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

The Auslander–Reiten conjecture asks whether a finitely generated module $M$ over an Artin algebra $R$ must be projective when

#[#set math.equation(numbering: n => "(1.1)")
 $ "Ext"_R^i \( M \, M xor R \) = 0 #h(2em) upright("for every ") i > 0 . $ <eq:arc>]

Here an Artin algebra is finite over a commutative Artinian central base ring. In particular, every finite-dimensional algebra over a field is an Artin algebra. The conjecture originates in the work of Maurice Auslander and Idun Reiten on the generalized Nakayama conjecture #cite(label("AuslanderReiten1975")); its module and generator formulations are recalled in #cite(label("HunekeLeuschke2004")) Introduction.

We give a counterexample. A module is called #emph[Gorenstein-projective] if it is a cokernel in a doubly infinite exact complex of finite projectives that remains exact after applying $"Hom"_R \( - \, R \)$. The #emph[Gorenstein-projective conjecture] asks whether a finite Gorenstein-projective module $M$ with $"Ext"_R^i \( M \, M \) = 0$ for every $i > 0$ must be projective #cite(label("LuoHuang2008")) p. 2. The ambient algebra is not assumed to be Gorenstein. Total acyclicity gives $"Ext"_R^i \( M \, R \) = 0$ for $i > 0$, so this conjecture is precisely the restriction of the Auslander–Reiten conjecture to Gorenstein-projective modules.

#thm([Theorem 1.1.])[
  #emph[Let $k = bb(F)_2 \( q \, H_1 \, H_2 \)$, where $q \, H_1 \, H_2$ are algebraically independent. There exist a finite-dimensional $k$-algebra $Lambda$ and a finite-dimensional nonprojective left $Lambda$-module $Z$ such that 
$ "Ext"_Lambda^i \( Z \, Z \) = 0 = "Ext"_Lambda^i \( Z \, Lambda \) #h(2em) upright("for every integer ") i gt.eq 1 . $

 The module $Z$ is Gorenstein-projective. The semisimple quotient is $Lambda \/ "rad" Lambda tilde.eq k^8$, so the algebra is split with eight isomorphism classes of simple modules; also $"rad" \( Lambda \)^4 eq.not 0$. These conclusions persist after every field extension of $k$.]
] <thm:main>

Thus both conjectures fail for Artin algebras, including finite-dimensional algebras over an algebraically closed field of characteristic two: one can extend scalars to an algebraic closure of $k$. The parameters play essential roles in the proof. The powers of $q$ give an infinite resolution with uniform kernel formulas, and $H_1 \/ H_2$ has infinite multiplicative order. The algebraic closure in this assertion contains these transcendental elements.

The final algebra is triangular and noncommutative. The companion article #cite(label("OpenAITachikawa2026")) Theorem 1.1 and Corollary 1.2 constructs a symmetric counterexample over the same field by a different bimodule construction and a transfer requiring control of negative complete self-extensions, and develops the homological consequences of its associated endomorphism algebra. The contribution here is the explicit eight-simple Gorenstein-projective example and its persistence under every field extension. Each paper contains its own complete proof. The commutative restriction is not resolved by either construction; see #cite(label("ChristensenHolm2010")) Appendix A for its relationship with the various Auslander and Tachikawa conditions. The generator formulation also fails: $Z xor Lambda$ is a nonprojective generator with no positive self-extensions. Indeed Ext is additive in both arguments, and all positive Ext groups with first argument $Lambda$ vanish.

=== 1.1 Earlier constructions and restricted results <earlier-constructions-and-restricted-results>

The positive cases developed along several lines. For the commutative Noetherian formulation, Auslander, Ding and Solberg treated complete local complete intersections by lifting across regular sequences #cite(label("AuslanderDingSolberg1993")) Proposition 1.9. Huneke and Leuschke proved the conjecture for excellent commutative Cohen–Macaulay normal domains containing the rational numbers, among other classes #cite(label("HunekeLeuschke2004")) Theorem 0.1. Christensen and Holm established a general cohomological criterion: every left-noetherian ring satisfying Auslander’s condition satisfies the conjecture #cite(label("ChristensenHolm2010")) Theorem A. That condition requires, for each fixed finitely generated first module, a common bound after which Ext vanishes for every finitely generated second module whose Ext groups vanish eventually.

Algebras with radical cube zero form another important positive class. Huneke, Şega and Vraciu treated commutative Artinian local rings #cite(label("HunekeSegaVraciu2004")) Theorem 4.1(1). For split finite-dimensional local algebras with radical cube zero, Ringel and Zhang proved the stronger assertion that every nonprojective module with no positive Ext to the algebra has a nonzero first self-extension #cite(label("RingelZhang2022")) Theorem 1.5. Zhang and Zhou subsequently proved the conjecture for split finite-dimensional algebras with radical cube zero #cite(label("ZhangZhou2026")) Theorem 1.1. Their result for Igusa–Todorov Artin algebras includes all Artin algebras with radical cube zero #cite(label("ZhangZhouIgusaTodorov2026")) Theorem 3.2 and Corollary 4.4. The algebra constructed here has nonzero fourth radical power, as proved in Proposition 20.

Schulz’s construction of a nonprojective module without self-extensions #cite(label("Schulz1994")) is an important antecedent, but its particular skew-field example lies outside the Artin-algebra setting above; see #cite(label("DiverisPurin2012")) Introduction. A separate distinction is between all-degree and eventual vanishing: both summands in (1.1) must vanish in every positive degree.

Schulz also exhibited two-dimensional modules over quantum exterior algebras whose syzygies move through a parameter family and whose self-extensions vanish eventually, while the first self-extension remains nonzero #cite(label("Schulz1995")) Example 7. The corresponding quantum exterior algebra occurs as a corner of our starting algebra. We use the same parameter-shifting mechanism for a resolution over a larger algebra, then remove every positive self-extension by two independent twists. For indecomposable weakly symmetric algebras over an algebraically closed field with $J^3 = 0 eq.not J^2$, Erdmann characterizes those admitting nonprojective modules with eventually vanishing self-extensions #cite(label("Erdmann2017")); eventual vanishing alone does not give (1.1). Xia proves the Auslander–Reiten conjecture for quantum complete intersections #cite(label("Xia2026")), including the quantum exterior algebras used in Schulz’s parameter-shifting examples.

Vanishing in a finite range also differs from the hypothesis of (1.1). Böhmler and Marczinzik #cite(label("BoehmlerMarczinzik2026")) Theorem 3.1 and the end of Section 3 construct a characteristic-two commutative self-injective example with vanishing first and second self-extensions, and nonzero third self-extension.

Tachikawa’s second conjecture is the self-injective case of (1.1). Enomoto proves that this conjecture for the two-fold trivial extension of an Artin algebra implies the Auslander–Reiten conjecture for that algebra #cite(label("Enomoto2026")) Theorem 3.1. His reduction produces a self-injective algebra. The symmetric construction in our companion and the structural assertions of Theorem 1 are separate contributions.

=== 1.2 How the construction removes self-extensions <how-the-construction-removes-self-extensions>

The proof has two parts. First we give a conversion principle: a suitable stable map $v : X arrow.r F ⊗_A X$ over a symmetric algebra $A$ produces a module over

$ Lambda = mat(delim: "(", A, 0; F, A) . $

Its positive self-extensions are controlled by the difference between the actions of a self-extension of $X$ on the two sides of $v$. Total acyclicity separately gives the vanishing of Ext into $Lambda$. This principle is stated and proved before the example, so the subsequent construction has an explicit target.

We then build the required $A \, F \, X \, v$. Write $D$ for the $k$-linear dual. A ten-dimensional algebra $C$ has a simple module $s$ whose Ext groups are especially sparse. Passing to its symmetric trivial extension $T = C times.l D C$ produces $"Ext"_T^(*) \( s \, s \) = k \[ tau \]$ with $\| tau \| = 3$. An explicit Hochschild cocycle realizes $tau$ and supplies a homotopy compatible with twists of $T$. For $A = T ⊗ T$ and $X = s ⊗ s$, the nonnegative self-extension algebra is $k \[ tau_1 \, tau_2 \]$.

Write $cal(C)$ for the bimodule obtained from the two cones of these classes. In the stable category, maps factoring through projective modules are identified with zero, and the shift $\[ 1 \]$ is inverse syzygy. The stable maps from $X$ to $\( cal(C) ⊗_A X \) \[ a \]$ form a line for $a = 0$ and $a = 3$ and vanish in every other integer degree. This profile supplies a common target for two differently twisted maps.

For a nonzero scalar $H$, let $h_H$ fix $C$ and scale $D C$ by $H$, and let $U_H$ be $A$ with right action twisted by $h_H ⊗ h_H$. Its tensor functor fixes $X$ but multiplies its degree-$3 m$ self-extensions by $H^(- m)$. Using the symmetrizing trace and the cocycle’s boundary identity, we construct maps $U_H arrow.r cal(C) \[ 3 \]$ whose evaluations on $X$ are nonzero. After rescaling the maps for $H_1$ and $H_2$, their evaluations are the same nonzero element of that degree-three line. Their finite fiber $F$ then has a single diagonal stable map $v : X arrow.r F ⊗_A X$ in degree zero, with both projections equal to $"id"_X$. In positive degrees, projection identifies the stable maps from $X$ to $\( F ⊗_A X \) \[ a \]$ with two copies of the self-extensions of $X$. In degree $3 m > 0$, the comparison takes two independently chosen self-extension classes $g \, j$ to $F \( g \) v + v \[ 3 m \] j$, where $F \( g \)$ denotes tensoring with $F$. Under these projections its matrix is

$ mat(delim: "(", H_1^(- m), 1; H_2^(- m), 1) ⊗ "id"_(k \[ tau_1 \, tau_2 \]_(3 m)) . $

This matrix is invertible for every $m > 0$. In degree zero, the comparison is surjective with a nonzero kernel. The conversion principle therefore removes all positive self-extensions while keeping a nonzero stable endomorphism, which proves nonprojectivity.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.3), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C$#linebreak()$dim C=10$]]])])
  content((4.2, 3.3), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$T=C "ltimes" "DC"$#linebreak()$"Ext"_T^*(s,s)=k[ tau ]$]]])])
  content((8.6, 3.3), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A=T ⊗ T$#linebreak()$X=s ⊗ s$]]])])
  content((0, 1.4), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F$]]])])
  content((4.2, 1.4), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_(H_1) plus.o U_(H_2)$]]])])
  content((8.6, 1.4), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$cal(C) [3]$]]])])
  content((0, -0.3), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Lambda = ( "smallmatrix" A&0#h(0.3333em) F &A "smallmatrix" )$]]])])
  content((4.2, -0.3), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Z$ from $X,v$]]])])
  line((0.68, 3.3), (2.741, 3.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.1, 4.2), [#text(size: 9pt)[trivial extension]], anchor: "south", padding: 0.1176cm)
  line((5.659, 3.3), (7.825, 3.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.4, 4.2), [#text(size: 9pt)[tensor square]], anchor: "south", padding: 0.1176cm)
  line((8.6, 2.773), (8.6, 1.77), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.6, 2.35), [#text(size: 9pt)[two cones#linebreak()and shift]], anchor: "west", padding: 0.1176cm)
  line((0.3387, 1.4), (3.231, 1.4), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.1, 1.4), [#text(size: 9pt)[fiber projection]], anchor: "south", padding: 0.1176cm)
  line((5.169, 1.4), (7.92, 1.4), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.4, 1.4), [#text(size: 9pt)[lifted twists]], anchor: "south", padding: 0.1176cm)
  line((0, 1.08), (0, 0.2644), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.55), [#text(size: 9pt)[triangular#linebreak()algebra]], anchor: "east", padding: 0.1176cm)
  line((1.688, -0.3), (3.21, -0.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.1, -0.3), [#text(size: 9pt)[finite quotient]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The algebraic and homological stages of the construction. The middle row begins the stable fiber triangle; the other arrows indicate construction steps. The finite bimodule $F$ is the ordinary kernel in (8.3) before $Lambda$ is formed. Evaluating this fiber on $X$ gives the diagonal stable map $v$; the final module is the finite quotient (3.2), using both $X$ and $v$. ],
) <fig:construction>

The main construction-specific ingredients are the explicit cocycle with its twisted boundary identity, the lift through both cones, and the resulting uniform comparison of the two twist actions. The surrounding tools have a substantial history. Trivial extensions and their Hochschild complexes are studied in #cite(label("CibilsMarcosRedondoSolotar2003")); Hochschild evaluation as a characteristic action is treated in #cite(label("Lowen2008")) Section 4.3. Bimodules attached to Hochschild classes and their iterated tensor products occur in the support-variety constructions of Erdmann, Holloway, Snashall, Solberg and Taillefer #cite(label("ErdmannEtAl2003")) Section 2. We use the natural symmetric stable duality of #cite(label("Linckelmann2013")) Section 2 and the complete-resolution methods of #cite(label("Veliche2006")). Gorenstein-projective modules over triangular matrix rings are studied in #cite(label("EshraghiEtAl2014")). We supply the particular comparison and finiteness arguments needed here.

For reference, the objects and their roles are summarized in Table 1. The finite cocycle table appears in Appendix 10; its identities are finite algebra calculations. The resolution, duality, cone, and complete-resolution arguments establish the assertions in all degrees.

Section 2 fixes the stable-category conventions, and Section 3 proves the conversion principle. Sections 4 and 5 give the starting algebra and its self-extension calculation. Section 6 computes the two-cone profile; Sections 7 and 8 construct the lifts and the finite fiber. Section 9 proves the structural and scalar-extension assertions.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Object
], table.cell(rowspan: 1, colspan: 1)[Ambient algebra
], table.cell(rowspan: 1, colspan: 1)[Role or dimension
]),
  table.cell(rowspan: 1, colspan: 1)[$C$
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[ten-dimensional algebra
],
  table.cell(rowspan: 1, colspan: 1)[$T = C times.l D C$, $s$
], table.cell(rowspan: 1, colspan: 1)[$k$, $T$
], table.cell(rowspan: 1, colspan: 1)[symmetric algebra of dimension $20$; simple
],
  table.cell(rowspan: 1, colspan: 1)[$A = T ⊗ T$, $X = s ⊗ s$
], table.cell(rowspan: 1, colspan: 1)[$k$, $A$
], table.cell(rowspan: 1, colspan: 1)[symmetric algebra of dimension $400$; simple
],
  table.cell(rowspan: 1, colspan: 1)[$cal(C)$
], table.cell(rowspan: 1, colspan: 1)[stable bimodules over $A$
], table.cell(rowspan: 1, colspan: 1)[two cones of degree-three classes
],
  table.cell(rowspan: 1, colspan: 1)[$U_(H_i)$
], table.cell(rowspan: 1, colspan: 1)[$A$-bimodules
], table.cell(rowspan: 1, colspan: 1)[right twists of $A$
],
  table.cell(rowspan: 1, colspan: 1)[$F$
], table.cell(rowspan: 1, colspan: 1)[$A$-bimodules
], table.cell(rowspan: 1, colspan: 1)[finite fiber, projective on both sides
],
  table.cell(rowspan: 1, colspan: 1)[$v : X arrow.r F ⊗_A X$
], table.cell(rowspan: 1, colspan: 1)[stable $A$-modules
], table.cell(rowspan: 1, colspan: 1)[both projections equal $"id"_X$
],
  table.cell(rowspan: 1, colspan: 1)[$Lambda$, $Z$
], table.cell(rowspan: 1, colspan: 1)[$k$, $Lambda$
], table.cell(rowspan: 1, colspan: 1)[dimension $800 + dim_k F$; finite module
],
)
]],
  caption: [Table 1: Objects used in the proof. Shifts are homological. ],
)

== 2 Stable maps and complete resolutions <sec:stable>

We first fix the language needed to pass from extension classes to an ordinary finite module. All algebras and modules in the paper are finite-dimensional over the indicated field. Modules are left modules unless a side is specified. Write $D V = "Hom"_k \( V \, k \)$ and $R^e = R ⊗_k R^(upright("op"))$; an $R$-bimodule is a left $R^e$-module. All tensor products without a subscript are over $k$.

Complexes have homological differentials $d_i : P_i arrow.r P_(i - 1)$ and shifts $P \[ a \]_i = P_(i - a)$. Thus a degree-$a$ cohomology class is represented by a chain map $P arrow.r Q \[ a \]$. Throughout the construction

$ k = bb(F)_2 \( q \, H_1 \, H_2 \) \, $

where the three parameters are algebraically independent. Characteristic two removes all differential, shift, and interchange signs.

For any finite algebra $R$, the space $underline("Hom")_R \( M \, N \)$ is the quotient of $"Hom"_R \( M \, N \)$ by maps factoring through finite projective modules. An algebra $R$ is #emph[symmetric] if it has a linear form $t : R arrow.r k$ such that $t \( a b \) = t \( b a \)$ and $\( a \, b \) mapsto t \( a b \)$ is nondegenerate. The resulting bimodule isomorphism $R tilde.eq D R$ shows that finite projective $R$-modules are injective. Every finite module embeds in a finite projective: dualize a finite projective surjection onto its dual.

For symmetric $R$, set $M \[ - 1 \] = Omega M$, the kernel of a projective surjection onto $M$, and set $M \[ 1 \]$ to be the cokernel of an embedding of $M$ into a projective. These are well defined on stable maps and inverse to each other there. Lifting through projective surjections and extending into injectives give the maps on shifts; different choices differ by projective factorizations. A short exact sequence induces a stable triangle and long exact sequences of stable Hom groups in all integer degrees. One concrete cone of $u : M arrow.r N$ is the cokernel of $\( u \, i \) : M arrow.r N xor I$, where $i : M arrow.r.hook I$ is a projective embedding. Its sequence is

$ M arrow.r^u N arrow.r "cone" \( u \) arrow.r M \[ 1 \] . $

The usual Hom and Ext sequences prove exactness in positive degrees. At degree zero, maps through a projective lift through a surjection and extend across an injection, giving exactness after quotienting by those maps. Shifting gives every other degree. In particular,

#[#set math.equation(numbering: n => "(2.1)")
 $ underline("Hom")_R \( M \, N \[ a \] \) tilde.eq "Ext"_R^a \( M \, N \) #h(2em) \( a > 0 \) \, $ <eq:stable-ext>]

compatibly with composition and Yoneda products.

A #emph[complete resolution] of $M$ over a symmetric algebra is a doubly infinite exact complex $P$ of finite projectives with $M = "coker" \( d_1 : P_1 arrow.r P_0 \)$. Splicing a projective resolution and an injective coresolution constructs one. A complex of finite projectives over an arbitrary finite algebra is #emph[totally acyclic] if both it and $"Hom"_R \( P \, R \)$ are exact. Because every term is finitely generated, exactness into $R$ also gives exactness into every projective target, by direct sums and summands. A module is #emph[Gorenstein-projective] if it is such a cokernel in a totally acyclic complex. Complete resolutions over symmetric algebras are totally acyclic. We will prove the precise comparison with full Hom complexes in the next section; this also applies over the final algebra, which need not be self-injective.

For an $A$-bimodule $F$, the notation $F M$ means $F ⊗_A M$. If $F$ is projective as a left and as a right $A$-module, this is an exact functor preserving finite projectives, hence induces a functor on stable modules compatible with shifts. We always mean these two separate projectivity conditions when describing a bimodule as projective on both sides. They are weaker than projectivity over $A^e$.

== 3 From two stable actions to a finite module <conv:section>

The last step of the construction uses a finite bimodule $F$ and a stable map $v : X arrow.r F ⊗_A X$. Two actions on maps out of $X$ will determine all positive self-extensions of a module over a triangular algebra. We prove this conversion independently of the particular bimodule. The module itself is a finite quotient; complete resolutions are used to compute its extensions.

=== 3.1 The conversion principle <the-conversion-principle>

For a finite bimodule $F$ projective on both sides, tensoring with $F$ is exact and preserves projectives. Over a symmetric algebra it therefore induces an exact functor on the stable category and commutes with shifts. In the following statement we write $F X = F ⊗_A X$ and use these shift identifications when writing $F \( g \)$.

For the triangular algebra $Lambda = mat(delim: "(", A, 0; F, A)$, we write a left module as a triple $\( M \, N \, eta \)$: here $M \, N$ are left $A$-modules and $eta : F ⊗_A M arrow.r N$ is $A$-linear. The action is

$ mat(delim: "(", a, 0; f, b) \( m \, n \) = \( a m \, eta \( f ⊗ m \) + b n \) . $

A morphism $\( alpha \, beta \)$ satisfies $beta eta = eta' \( F ⊗ alpha \)$.

#thm([Proposition 3.1.])[
  (Triangular conversion).  #emph[Let $A$ be a finite-dimensional symmetric algebra over a field $k$ of characteristic two, let $F$ be a finite $A$-bimodule projective on both sides, and let $X$ be a finite left $A$-module. Suppose $v in underline("Hom")_A \( X \, F X \)$. For each integer $a$, put 
$ H^a = underline("Hom")_A \( X \, X \[ a \] \) \, #h(2em) K^a = underline("Hom")_A \( X \, \( F X \) \[ a \] \) \, $

 and define 
#[#set math.equation(numbering: n => "(3.1)")
 $ delta^a : H^a xor H^a arrow.r K^a \, #h(2em) \( g \, j \) mapsto F \( g \) v + v \[ a \] j . $ <conv:delta>]

 Assume that $delta^0$ is surjective with nonzero kernel and that $delta^a$ is an isomorphism for every integer $a > 0$.]
  #emph[Choose an actual map $v_0 : X arrow.r F X$ representing $v$ and an embedding $i : X arrow.r Q$ into a finite projective $A$-module. Define 
#[#set math.equation(numbering: n => "(3.2)")
 $ Lambda = mat(delim: "(", A, 0; F, A) \, #h(2em) Y = \( F X xor Q \) \/ { \( v_0 \( x \) \, i \( x \) \) : x in X } \, #h(2em) Z = \( X \, Y \, iota \) \, $ <conv:finite-module>]

 where $iota : F X arrow.r Y$ is induced by the first summand and specifies the structure map of the left triangular module. Then $Z$ is a finite nonprojective Gorenstein-projective left $Lambda$-module and 
$ "Ext"_Lambda^a \( Z \, Z \) = 0 = "Ext"_Lambda^a \( Z \, Lambda \) #h(2em) upright("for every integer ") a > 0 . $

]
] <conv:proposition>

=== 3.2 Comparison of complete resolutions <comparison-of-complete-resolutions>

For homological complexes $P_bullet \, Q_bullet$, use the full Hom complex

#[#set math.equation(numbering: n => "(3.3)")
 $ "Hom"_R^a \( P_bullet \, Q_bullet \) = product_(j in bb(Z)) "Hom"_R \( P_j \, Q_(j - a) \) \, #h(2em) \( partial f \)_j = d_(j - a)^Q f_j + f_(j - 1) d_j^P . $ <conv:full-hom>]

This product convention is also used in #cite(label("Veliche2006")) Section 1.1.1. The product permits comparison maps with infinitely many nonzero components. Each component of the differential uses only two maps. Its degree-$a$ cocycles are chain maps $P_bullet arrow.r Q_bullet \[ a \]$, and its boundaries are nullhomotopic chain maps. Throughout this section the field has characteristic two, so the displayed signs apply to shifts and cones as well.

#thm([Lemma 3.2.])[
  (Complete-resolution comparison).  #emph[Let $R$ be a finite-dimensional algebra over a field of characteristic two. Let $P_bullet$ be a totally acyclic complex of finite projective left $R$-modules, and let $Q_bullet$ be an exact complex of finite projective left $R$-modules. Put 
$ C_j \( P_bullet \) = "coker" \( d_(j + 1)^P : P_(j + 1) arrow.r P_j \) \, #h(2em) M = C_0 \( P_bullet \) \, #h(2em) N = C_0 \( Q_bullet \) . $

 There are natural, composition-compatible identifications 
$ H^0 "Hom"_R^bullet \( P_bullet \, Q_bullet \) tilde.eq underline("Hom")_R \( M \, N \) . $

 Applying this identification to shifted complexes gives, for every integer $a$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ H^a "Hom"_R^bullet \( P_bullet \, Q_bullet \) tilde.eq underline("Hom")_R \( C_a \( P_bullet \) \, N \) tilde.eq underline("Hom")_R \( M \, C_(- a) \( Q_bullet \) \) . $ <conv:shift-comparison>]

 For every integer $a > 0$, these groups are naturally $"Ext"_R^a \( M \, N \)$.]
] <conv:comparison>

#proof[
  Exactness identifies $C_j \( P_bullet \)$ with $"im" d_j^P subset P_(j - 1)$. We first record the extension property supplied by total acyclicity: for every finite projective $T$, a map $phi.alt : "im" d_j^P arrow.r T$ extends to $P_(j - 1)$. Indeed, $phi.alt d_j^P : P_j arrow.r T$ is a cocycle in $"Hom"_R \( P_bullet \, T \)$. Its exactness gives $psi : P_(j - 1) arrow.r T$ with $psi d_j^P = phi.alt d_j^P$, which is the required extension. This argument does not assume that projective $R$-modules are injective.
  A chain map induces a map of cokernels. Conversely, given $u : M arrow.r N$, first lift $u epsilon.alt_P$ to $f_0 : P_0 arrow.r Q_0$, where $epsilon.alt_P$ and $epsilon.alt_Q$ denote the quotient maps. Projectivity and exactness give $f_1 \, f_2 \, dots.h$ successively, with $d_j^Q f_j = f_(j - 1) d_j^P$. To extend in the other direction, $d_0^Q f_0$ kills $"im" d_1^P = ker d_0^P$. It therefore induces a map $"im" d_0^P arrow.r Q_(- 1)$, which extends to $f_(- 1) : P_(- 1) arrow.r Q_(- 1)$ by the preceding extension property. The same argument gives $f_(- 2) \, f_(- 3) \, dots.h$. This constructs a full comparison map.
  A nullhomotopy has components $h_j : P_j arrow.r Q_(j + 1)$ and satisfies
  $ f_j = d_(j + 1)^Q h_j + h_(j - 1) d_j^P . $
  On cokernels its first summand vanishes and its second factors through $P_(- 1)$. Thus a nullhomotopic map induces a projective factorization. For the converse, suppose the induced map factors as $M arrow.r T arrow.r N$ with $T$ finite projective. Extend $M arrow.r T$ to $P_(- 1)$ by the extension property, and lift $T arrow.r N$ to $Q_0$. Their composite is a homotopy component $h_(- 1)$ whose boundary induces exactly the given factorization. Subtract this boundary. It remains to nullhomotope a chain map $f'$ inducing zero on cokernels.
  For this remaining map take $h_(- 1) = 0$. Since $f'_0$ has image in $"im" d_1^Q$, projectivity gives $h_0 : P_0 arrow.r Q_1$ with $d_1^Q h_0 = f'_0$. Proceeding upwards, the residual $f'_j + h_(j - 1) d_j^P$ lands in $ker d_j^Q = "im" d_(j + 1)^Q$ and hence lifts to $h_j$. Proceeding downwards from $j = - 1$, the residual $f'_j + d_(j + 1)^Q h_j$ kills $"im" d_(j + 1)^P$ by the homotopy equation already obtained at $j + 1$. It descends to $"im" d_j^P$ and extends to $h_(j - 1) : P_(j - 1) arrow.r Q_j$ by the extension property. Each recursion assigns one component at a time and changes only adjacent equations. Together they define a homotopy in the full product (3.3). This proves the degree-zero identification. Passing to cokernels respects composition, and the proved uniqueness modulo homotopy gives its asserted compatibility.
  Apply the degree-zero result to $P_bullet \[ - a \]$ or to $Q_bullet \[ a \]$ to obtain (3.4). For $a > 0$, $C_a \( P_bullet \)$ is the $a$th syzygy of $M$. The projective-resolution definition of $"Ext"_R^a \( M \, N \)$ quotients $"Hom"_R \( C_a \( P_bullet \) \, N \)$ by maps extending to $P_(a - 1)$. These maps factor through a projective. Conversely, every projective factorization extends to $P_(a - 1)$ by the extension property. The two quotients coincide, including when $a = 1$. ◻
]

=== 3.3 Proof of the conversion principle <proof-of-the-conversion-principle>

#proof[
  We first check finiteness and introduce the two column functors. Since $i$ is injective, the map $iota$ in (3.2) is injective and there is an exact sequence
  #[#set math.equation(numbering: n => "(3.5)")
   $ 0 arrow.r F X arrow.r^iota Y arrow.r Q \/ i \( X \) arrow.r 0 . $ <conv:finite-extension>]
  In particular all the modules in (3.2) are finite. The algebra is finite as well, with $dim_k Lambda = 2 dim_k A + dim_k F$.
  The column functors below are standard; see #cite(label("EshraghiEtAl2014")) Section 2. Define
  $ E \( M \) = \( M \, F M \, "id" \) \, #h(2em) J \( N \) = \( 0 \, N \, 0 \) . $
  The functor $E$ is exact because $F$ is projective as a right $A$-module; $J$ is exact directly. Both preserve finite projectives: $E \( A \)$ and $J \( A \)$ are the two projective columns of $Lambda$, and $Lambda = E \( A \) xor J \( A \)$ as a left module. The morphism condition above gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Hom"_Lambda \( E \( M \) \, E \( M' \) \) & tilde.eq "Hom"_A \( M \, M' \) \,\
"Hom"_Lambda \( J \( N \) \, J \( N' \) \) & tilde.eq "Hom"_A \( N \, N' \) \,\
"Hom"_Lambda \( E \( M \) \, J \( N \) \) & = 0 \,\
"Hom"_Lambda \( J \( N \) \, E \( M \) \) & tilde.eq "Hom"_A \( N \, F M \) . $ <conv:four-homs>]
  In the first line the lower component of a map is $F \( alpha \)$. The third line is a vanishing of ordinary module maps, so it holds termwise for complexes in every shift.
  Choose a complete resolution $P_bullet$ of $X$ with $P_(- 1) = Q$ and $d_0 = i epsilon.alt_P$. This is possible by splicing a projective resolution with a projective-injective coresolution, since $A$ is symmetric. Put
  $ G_0 = E \( P_bullet \) \, #h(2em) G_1 = J \( P_bullet \) . $
  They are exact complexes of finite projective $Lambda$-modules. Moreover (3.6) gives
  $ "Hom"_Lambda \( G_0 \, Lambda \) & tilde.eq "Hom"_A \( P_bullet \, A \) \,\
"Hom"_Lambda \( G_1 \, Lambda \) & tilde.eq "Hom"_A \( P_bullet \, F \) xor "Hom"_A \( P_bullet \, A \) . $
  These complexes are exact: the left $A$-modules $F$ and $A$ are projective-injective. Thus both $G_0$ and $G_1$ are totally acyclic. Also $F ⊗_A P_bullet$ is a complete resolution of $F X$. Here right projectivity of $F$ gives exactness, left projectivity gives projective terms, and self-injectivity of $A$ gives Hom exactness.
  We can now compute all maps between the two induced complexes. Lemma 3 and (3.6) identify their full Hom cohomology as
  #[#set math.equation(numbering: n => "(3.7)")
   $ H^a "End"_Lambda^bullet \( G_0 \) & tilde.eq H^a \, & H^a "End"_Lambda^bullet \( G_1 \) & tilde.eq H^a \,\
H^a "Hom"_Lambda^bullet \( G_1 \, G_0 \) & tilde.eq K^a \, & "Hom"_Lambda^bullet \( G_0 \, G_1 \) & = 0 . $ <conv:column-cohomology>]
  Lift the actual map $v_0$ to a chain map $V : G_1 arrow.r G_0$ using the comparison construction, and form
  $ P_Z = "Cone" \( V \) \, #h(2em) \( P_Z \)_j = \( G_0 \)_j xor \( G_1 \)_(j - 1) \, #h(2em) d_j^(P_Z) = mat(delim: "(", d^(G_0), V_(j - 1); 0, d^(G_1)) . $
  The degreewise split cone sequence shows that $P_Z$ is totally acyclic with finite projective terms.
  Its cokernel at degree zero is precisely the module $Z$ already defined in (3.2). Its upper component is $X$. For the lower component, first quotient $F ⊗_A P_0$ by the image of $F ⊗_A d_1$, obtaining $F X$. The remaining relations, from $P_0$, are $\( v_0 \( x \) \, i \( x \) \)$: the lift $V_0$ induces $v_0$ on cokernels and $d_0 = i epsilon.alt_P$. The resulting lower component is therefore $Y$, with structure map $iota$. This supplies a complete resolution of a concrete finite module.
  It remains to compute its self-extensions. Every graded endomorphism of $P_Z$ has two diagonal blocks and one block from $G_1 \[ 1 \]$ to $G_0$; the other direction vanishes by (3.6). Projection to the diagonal gives a short exact sequence of cochain complexes
  #[#set math.equation(numbering: n => "(3.8)")
   $ 0 arrow.r "Hom"_Lambda^bullet \( G_1 \[ 1 \] \, G_0 \) arrow.r "End"_Lambda^bullet \( P_Z \) arrow.r "End"_Lambda^bullet \( G_0 \) xor "End"_Lambda^bullet \( G_1 \[ 1 \] \) arrow.r 0 . $ <conv:end-sequence>]
  This sequence is split in each graded degree, although the splitting need not commute with the differentials. Reindexing the full product in (3.3) gives
  $ H^a "Hom"_Lambda^bullet \( G_1 \[ 1 \] \, G_0 \) = K^(a - 1) . $
  The connecting map from diagonal degree $a$ to off-diagonal degree $a + 1$ is exactly (3.1). Indeed the differential of a diagonal lift has cross term obtained by composing with $V$ on the two sides. The $E$-diagonal acts there by $F \( g \)$, and the $J$-diagonal acts by precomposition with $j$, as specified in (3.6). Compatibility of comparison with composition identifies this cross term with $F \( g \) v + v \[ a \] j$.
  The long exact sequence of (3.8) consequently contains, for every integer $a$, the short exact sequence
  #[#set math.equation(numbering: n => "(3.9)")
   $ 0 arrow.r "coker" delta^(a - 1) arrow.r H^a "End"_Lambda^bullet \( P_Z \) arrow.r ker delta^a arrow.r 0 . $ <conv:end-cohomology>]
  For $a = 1$, surjectivity of $delta^0$ and injectivity of $delta^1$ make both outer terms zero. For $a > 1$, the two comparison maps are isomorphisms. Therefore the middle group vanishes for every $a > 0$. Lemma 3 identifies it with $"Ext"_Lambda^a \( Z \, Z \)$.
  At degree zero, (3.9) shows that $H^0 "End"_Lambda^bullet \( P_Z \)$ surjects onto the nonzero kernel of $delta^0$. By comparison this is a nonzero stable endomorphism group of $Z$. Its stable identity is consequently nonzero, since a zero identity would annihilate every stable endomorphism. Thus $Z$ is not projective.
  Finally, total acyclicity gives exactness of $"Hom"_Lambda \( P_Z \, Lambda \)$. Its positive degrees compute the ordinary groups $"Ext"_Lambda^a \( Z \, Lambda \)$ on the nonnegative resolution tail, so these vanish for every $a > 0$. Exactness also identifies $Z = "coker" d_1^(P_Z)$ with the cycle $"im" d_0^(P_Z) = ker d_(- 1)^(P_Z)$ in this totally acyclic complex. Hence $Z$ is Gorenstein-projective. ◻
]

Proposition 2 reduces the construction to a finite bimodule $F$ projective on both sides and a stable map $v$ with the stated two action properties. Surjectivity at degree zero is needed separately: it is the term that removes a possible self-extension in degree one in (3.9).

== 4 A symmetric algebra and a degree-three class <alg:section>

We begin with a symmetric algebra carrying a simple module and a Hochschild class of degree three. The class will have two uses: its value on the simple will generate the positive self-extension algebra, and an explicit boundary identity will allow us to lift maps through the two cones used later.

=== 4.1 The ten-dimensional algebra and its trivial extension <the-ten-dimensional-algebra-and-its-trivial-extension>

Let $C$ be the vector space with the following basis, arranged by corners. The notation $i C j$ specifies the left idempotent first.

#[#set math.equation(numbering: n => "(4.1)")
 $ upright("corner") & upright("basis") & upright("corner") & upright("basis")\
e C e & e \, x \, y \, z & e C f & u \, v\
f C e & t \, j & f C f & f \, n $ <alg:C-corners>]

The elements $e \, f$ are orthogonal idempotents with sum $1$. Besides their actions specified by the corners, the complete list of nonzero products is

#[#set math.equation(numbering: n => "(4.2)")
 $ x y = q z \, #h(2em) y x = z \, #h(2em) x u = y u = v \, #h(2em) t x = j \, #h(2em) t y = q^2 j \,\
u t = y + q x \, #h(2em) v t = q z \, #h(2em) u j = z \, #h(2em) t u = \( 1 + q \) n \, #h(2em) n t = q j \, #h(2em) u n = v . $ <alg:C-products>]

All products not specified by these rules are zero.

#thm([Lemma 4.1.])[
  #emph[The rules (4.1)–(4.2) define an associative unital algebra of dimension ten. Its radical is the span of the eight non-idempotent basis vectors, and 
$ \( "rad" C \)^5 = 0 \, #h(2em) u t u t = q \( 1 + q \) z eq.not 0 . $

]
] <alg:C>

#proof[
  Give $u \, t$ degree one, $x \, y \, n$ degree two, $v \, j$ degree three, and $z$ degree four; the idempotents have degree zero. Every listed product is homogeneous. Associativity involving an idempotent follows from the corners. For three non-idempotent basis vectors, incompatible corners or total degree greater than four force both bracketings to vanish. The complete remaining list is recorded below; direct substitution gives the same value under either bracketing.
  $ a b c & u t u & t u t & x u t & y u t & n t u & u n t & t x u & t y u & u t x & u t y & t u n\
\( a b \) c = a \( b c \) & \( 1 + q \) v & q \( 1 + q \) j & q z & q z & 0 & q z & 0 & 0 & z & q^2 z & 0 $
  This proves associativity by trilinearity. The positive-degree span $N$ is a nilpotent ideal with $N^5 = 0$ and $C \/ N tilde.equiv k times k$; therefore $N = "rad" C$. Finally, $\( u t \) u = \( 1 + q \) v$ and $v t = q z$ give the asserted nonzero fourth radical product. ◻
]

#prodef([Remark 4.2.])[
  The corner $e C e$ is the quantum exterior algebra $k chevron.l x \, y chevron.r \/ \( x^2 \, y^2 \, x y - q y x \)$, with $z = y x$. The right module $f C e$ has basis $t \, j$ and actions $t x = j$, $t y = q^2 j$, $j x = j y = 0$. More precisely, put $R = e C e$. The map
  $ t mapsto x + q^(- 1) y \, #h(2em) j mapsto q^(- 1) z $
  identifies $f C e$ with the right ideal $\( x + q^(- 1) y \) R$. In the notation of Schulz #cite(label("Schulz1995")) Example 7, the parameter is $q^(- 1)$ and this ideal is the first syzygy of $\( x + y \) R$. Here its interactions with the other corners are fixed by the complete multiplication table above.
] <alg:antecedent>

Put $L = D C$ and equip it with the dual bimodule actions

#[#set math.equation(numbering: n => "(4.3)")
 $ \( a phi.alt \) \( c \) = phi.alt \( c a \) \, #h(2em) \( phi.alt a \) \( c \) = phi.alt \( a c \) quad \( a \, c in C \, med phi.alt in L \) . $ <alg:dual-actions>]

Trivial extensions and their cohomology are studied in #cite(label("CibilsMarcosRedondoSolotar2003")). Here the trivial extension is

#[#set math.equation(numbering: n => "(4.4)")
 $ T = C times.l L \, #h(2em) \( a \, phi.alt \) \( b \, psi \) = \( a b \, a psi + phi.alt b \) . $ <alg:T-definition>]

For every lower-case basis letter $a$ of $C$, its upper-case letter $a^(*)$ denotes the dual basis vector in $L$; for example, $j^(*) = J$ and $f^(*) = F$. We also set $\( a^(*) \)^(*) = a$. Thus a capital letter $J$ is a basis vector, whereas the radical below is denoted by $frak(r)$.

#thm([Lemma 4.3.])[
  #emph[The algebra $T$ is symmetric of dimension twenty. A symmetrizing trace is 
$ lambda \( a \, phi.alt \) = phi.alt \( 1 \) \, $

 and the trace-dual of each basis letter is its starred letter. Its radical $frak(r)$ is the span of all basis letters except $e \, f$; it satisfies $frak(r)^6 = 0$ and $T \/ frak(r) tilde.equiv k times k$.]
] <alg:T>

#proof[
  The dual actions satisfy the bimodule identities by associativity of $C$, so (4.4) is associative. Moreover,
  $ lambda #scale(x: 120%, y: 120%)[\(] \( a \, phi.alt \) \( b \, psi \) #scale(x: 120%, y: 120%)[\)] = psi \( a \) + phi.alt \( b \) \, $
  which is symmetric and nondegenerate. In particular, $lambda \( a b^(*) \) = delta_(a \, b)$ for lower-case basis letters $a \, b$. The dual of the corner $i C j$ lies in $j L i$.
  Extend the grading of $C$ by $deg \( a^(*) \) = 5 - deg \( a \)$. Formula (4.3) shows that every product in $T$ is homogeneous. All basis vectors except $e \, f$ have positive degree, and no degree exceeds five. Their span is therefore a nilpotent ideal whose quotient is $k times k$; this proves the radical assertions. ◻
]

Let $s$ be the one-dimensional left $T$-module on which $f$ acts as $1$ and every other basis letter acts as zero. It is inflated from the corresponding $C$-simple. Write $s^(upright(r))$ for the right simple defined by the same character.

=== 4.2 The bar class and the finite identities <the-bar-class-and-the-finite-identities>

Set $I = k e xor k f$. The normalized relative bar resolution of $T$ has terms

#[#set math.equation(numbering: n => "(4.5)")
 $ P_n = T ⊗_I frak(r)^(⊗_I n) ⊗_I T quad \( n gt.eq 0 \) \, #h(2em) P_n = 0 quad \( n < 0 \) . $ <alg:bar>]

We write $a_0 \[ a_1 \| dots.h.c \| a_n \] a_(n + 1)$ for an elementary tensor. The differential multiplies each adjacent pair of factors and sums the results; the augmentation $P_0 arrow.r T$ is multiplication. All signs are $+$ because the characteristic is two. Splitting by idempotents expresses each term as a finite sum of projective bimodules $T i ⊗ j T$ with $i \, j in { e \, f }$. Exactness follows from a contraction: replace the first coefficient $a_0$ by its projection to $frak(r)$, insert that projection as a new first bar, and put $1$ in the first coefficient. In augmented degree send $a$ to $1 \[ \] a$. Writing $sigma$ for this contraction, the identity $d sigma + sigma d = "id"$ follows by canceling successive multiplications; the $I$-component of $a_0$ is balanced over $I$. This contraction is right $T$-linear, so $P ⊗_T s$ is a projective resolution of $s$ as well.

Give a lower-case letter weight zero and an upper-case letter weight one. This weight records the effect of scaling the square-zero ideal $L = D C$; it is distinct from the positive grading in Lemma 6. The complete table in Appendix 10 defines an $I$-bimodule map

$ p : frak(r) ⊗_I frak(r) ⊗_I frak(r) arrow.r T . $

Every unlisted value is zero. The following records exactly the properties of this finite table that the proof needs.

#thm([Lemma 4.4.])[
  #emph[The cochain $p$ has weight $- 1$ and is a Hochschild cocycle. Its associated class evaluated on $s$ is nonzero in $"Ext"_T^3 \( s \, s \)$.]
  #emph[For any $H in k^times$, let $h = h_H$ be the automorphism of $T$ fixing $C$ and multiplying $L$ by $H$. On the radical basis define 
$ z_H \( a \) = cases(delim: "{", H q a \, & a in { u \, v \, t \, E \, X \, Y \, Z \, U \, V } \,, 0 \, & upright("otherwise") \,) $

 and extend linearly. For all $a \, b in frak(r)$ one has 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(w in cal(B)_(frak(r))) p \( a \, b \, h \( w \) \) w^(*) = a z_H \( b \) + z_H \( a b \) + z_H \( a \) h^(- 1) \( b \) \, $ <coc:boundary>]

 where $cal(B)_(frak(r))$ is the radical basis.]
] <coc:data>

#proof[
  The endpoint, weight, cocycle and boundary identities are verified from the complete finite data in Appendix 10. We prove the nonzero evaluation explicitly. In the bar complex $s^(upright(r)) ⊗_T P ⊗_T s$, consider
  #[#set math.equation(numbering: n => "(4.7)")
   $ zeta = q^2 \[ t \| x \| J \] + \[ t \| y \| J \] . $ <coc:cycle>]
  Both words have endpoint $f$ on each side. All outer radical actions vanish on the endpoint simples. The multiplication rules, including the dual actions, give
  $ t x = j \, #h(2em) t y = q^2 j \, #h(2em) x J = T \, #h(2em) y J = q^2 T . $
  Consequently
  $ d zeta = q^2 \( \[ j \| J \] + \[ t \| T \] \) + q^2 \[ j \| J \] + q^2 \[ t \| T \] = 0 . $
  The table gives $p \( t \, x \, J \) = 0$ and $p \( t \, y \, J \) = q^3 f$, so its evaluation on $zeta$ is $q^3 eq.not 0$. Every $T$-linear map from $P ⊗_T s$ to $s$ factors through the left simple quotient and hence pairs with this two-sided-simple bar complex. A coboundary pairs to zero with its cycles. Thus the evaluated class is nonzero. ◻
]

The evaluation of a Hochschild class on modules is the characteristic action; see #cite(label("Lowen2008")) Section 4.3. We use the same letter $p$ for its comparison map $P arrow.r P \[ 3 \]$: for $n gt.eq 3$ apply the cochain to the last three bars and multiply its output into the right coefficient,

#[#set math.equation(numbering: n => "(4.8)")
 $ a_0 \[ a_1 \| dots.h.c \| a_n \] a_(n + 1) mapsto a_0 \[ a_1 \| dots.h.c \| a_(n - 3) \] p \( a_(n - 2) \, a_(n - 1) \, a_n \) a_(n + 1) \; $ <coc:comparison>]

the map is zero for $n < 3$. This is a chain map: strict-prefix multiplications cancel, and the remaining equation on the last four bars is precisely the Hochschild cocycle equation. At the bottom index the target differential is zero. Composing its evaluation on $s$ with the augmentation represents the class in Lemma 7.

We have now obtained the finite algebra and the specific degree-three class. The next step is to compute all self-extension degrees of $s$, so that this nonzero class can be identified as a polynomial generator.

== 5 A simple module with polynomial self-extensions <res:section>

The cocycle constructed above will control the two cones in our example. We now determine all self-extensions of the simple on which it acts. The key step is a calculation over the smaller algebra $C$: its simple $s$ has no positive self-extensions, but $"Ext"_C^2 \( s \, C \)$ is a simple module. Passing to the trivial extension $T = C times.l D C$ turns this exceptional class into a polynomial generator of degree three.

=== 5.1 The resolution over $C$ <the-resolution-over-c>

Let $s^(upright(r))$ denote the one-dimensional right $f$-simple. For every integer $i gt.eq 0$, set

$ ell_i = x + q^i y . $

The transcendence of $q$ implies $q eq.not 0$ and $1 + q^m eq.not 0$ for every positive integer $m$. We will use these conditions for arbitrarily large indices.

#thm([Lemma 5.1.])[
  #emph[A projective resolution $R arrow.r s$ over $C$ has terms 
$ R_0 = C f \, #h(2em) R_i = C e quad \( i gt.eq 1 \) \, $

 and differentials given by right multiplication: 
$ dots.h.c arrow.r C e arrow.r^(thin dot.op ell_1 thin) C e arrow.r^(thin dot.op ell_0 thin) C e arrow.r^(thin dot.op u thin) C f arrow.r s arrow.r 0 . $

 More precisely, $d_(i + 2)$ is right multiplication by $ell_i$ for every $i gt.eq 0$. For every integer $i gt.eq 0$, 
$ "Ext"_C^i \( s \, s \) = cases(delim: "{", k & i = 0 \,, 0 & i > 0 \,) #h(2em) "Ext"_C^i \( s \, C \) = cases(delim: "{", s^(upright(r)) & i = 2 \,, 0 & i eq.not 2 .) $

 The second identification is an identification of right $C$-modules.]
] <res:base>

#proof[
  The left ideals $C e$ and $C f$ have respective bases
  $ \( e \, x \, y \, z \, t \, j \) \, #h(2em) \( f \, u \, v \, n \) . $
  The multiplication table gives the following formulas, valid for every $i gt.eq 0$:
  $ a & e & x & y & z & t & j\
a u & u & v & v & 0 & \( 1 + q \) n & 0\
a ell_i & ell_i & q^(i + 1) z & z & 0 & \( 1 + q^(i + 2) \) j & 0 . $
  Consequently, right multiplication by $u$ has image $chevron.l u \, v \, n chevron.r = "rad" \( C f \)$ and kernel $chevron.l ell_0 \, z \, j chevron.r$. Right multiplication by $ell_i$ has image $chevron.l ell_i \, z \, j chevron.r$ and kernel $chevron.l ell_(i + 1) \, z \, j chevron.r$. In the latter calculation, a kernel vector has zero $e$- and $t$-coefficients, while its $x \, y$ coefficients satisfy $a_y = q^(i + 1) a_x$. These identities prove exactness at every index. Since $"Hom"_C \( C e \, s \) = e s = 0$ and $"Hom"_C \( C f \, s \) = f s = k$, they also give the asserted self-extension groups over $C$.
  To compute $"Ext"_C^(*) \( s \, C \)$, identify $"Hom"_C \( C e \, C \) = e C$ and $"Hom"_C \( C f \, C \) = f C$ by evaluation at the idempotent. Precomposition with right multiplication becomes left multiplication. Thus the Hom complex is
  $ f C arrow.r^(thin u dot.op thin) e C arrow.r^(thin ell_0 dot.op thin) e C arrow.r^(thin ell_1 dot.op thin) e C arrow.r dots.h.c . $
  Left multiplication by $u$ sends the basis $\( f \, t \, j \, n \)$ of $f C$ to $\( u \, y + q x \, z \, v \)$. These four vectors are independent. On the basis $\( e \, x \, y \, z \, u \, v \)$ of $e C$, left multiplication by $ell_i$ is
  $ a & e & x & y & z & u & v\
ell_i a & ell_i & q^i z & q z & 0 & \( 1 + q^i \) v & 0 . $
  The index $i = 0$ is exceptional:
  $ ker \( ell_0 dot.op \) = chevron.l q x + y \, z \, u \, v chevron.r = "im" \( u dot.op \) \, #h(2em) "im" \( ell_0 dot.op \) = chevron.l ell_0 \, z chevron.r . $
  For every $i gt.eq 1$, the coefficient $1 + q^i$ is nonzero, and
  $ ker \( ell_i dot.op \) = chevron.l ell_(i - 1) \, z \, v chevron.r \, #h(2em) "im" \( ell_i dot.op \) = chevron.l ell_i \, z \, v chevron.r . $
  The cohomology in degrees zero and one therefore vanishes. In degree two it is the line represented by $v$; in every higher degree the displayed kernel equals the preceding image. Finally, $v f = v$, $v e = 0$, and the only possibly nonzero right radical product is $v t = q z$, which is a boundary. The surviving line is precisely $s^(upright(r))$. ◻
]

=== 5.2 The trivial-extension triangle and its product <the-trivial-extension-triangle-and-its-product>

Write $L = D C$. The duality calculation in Lemma 8 determines $L ⊗_C^(upright(bold(L))) s$. The extension $0 arrow.r L arrow.r T arrow.r C arrow.r 0$ then provides a connecting morphism over $T$. We identify its products explicitly so that the calculation controls every positive degree.

#thm([Lemma 5.2.])[
  #emph[For the algebra $T = C times.l D C$ and its left $f$-simple $s$, 
$ "Ext"_T^(*) \( s \, s \) = k \[ tau \] \, #h(2em) \| tau \| = 3 \, $

 as a graded algebra, where $tau = p \( s \)$ is the evaluation of the cocycle from Lemma 7.]
] <res:polynomial>

#proof[
  For a finite projective left $C$-module $V$, evaluation gives a natural isomorphism of left $C$-modules
  $ D C ⊗_C V arrow.r D "Hom"_C \( V \, C \) \, #h(2em) lambda ⊗ v mapsto #scale(x: 120%, y: 120%)[\(] phi mapsto lambda \( phi \( v \) \) #scale(x: 120%, y: 120%)[\)] . $
  Apply this isomorphism termwise to the resolution $R$ of Lemma 8. Exactness of vector-space duality shows that $L ⊗_C R$ has homology only in degree two, where it is $D \( s^(upright(r)) \) = s$. Moreover, $L$ acts by zero on the entire complex, since $L^2 = 0$. Good truncations therefore give a $T$-linear derived identification
  $ L ⊗_C R tilde.eq s \[ 2 \] . $
  Regard $0 arrow.r L arrow.r T arrow.r C arrow.r 0$ as a sequence of $\( T \, C \)$-bimodules. Tensoring it termwise with $R$ gives a short exact sequence of complexes of left $T$-modules,
  $ 0 arrow.r L ⊗_C R arrow.r T ⊗_C R arrow.r R arrow.r 0 \, $
  where the last complex is inflated along $T arrow.r C$. Exactness uses projectivity of each left $C$-module $R_i$; it does not require flatness of $L$ or $T$ as right $C$-modules. Put $cal(I) = T ⊗_C R$. We obtain the derived triangle
  #[#set math.equation(numbering: n => "(5.1)")
   $ s \[ 2 \] arrow.r cal(I) arrow.r s arrow.r^(thin delta thin) s \[ 3 \] . $ <res:triangle>]
  The middle complex has homology $s$ in degrees zero and two and no other homology. Its terms are finite dimensional, so good truncation makes it an object of the bounded derived category of finite $T$-modules.
  Each term of $cal(I)$ is a finite projective $T$-module. Because the complex is bounded below homologically, it computes derived maps out of it: a map from it to an acyclic complex is nullhomotopic by successive projective lifts starting in its bottom degree. Termwise induction and restriction adjunction thus gives, for every integer $i$,
  $ B^i := "Hom"_(D^b \( T upright("-mod") \)) \( cal(I) \, s \[ i \] \) = H^i "Hom"_C \( R \, s \) = cases(delim: "{", k & i = 0 \,, 0 & i eq.not 0 .) $
  Set $E^i = "Hom"_(D^b \( T upright("-mod") \)) \( s \, s \[ i \] \)$. These are ordinary Ext groups for $i gt.eq 0$ and vanish for $i < 0$. Applying $"Hom" \( - \, s \[ i \] \)$ to (5.1) gives the exact segment
  #[#set math.equation(numbering: n => "(5.2)")
   $ B^(i - 1) arrow.r E^(i - 3) arrow.r^(thin delta^(*) thin) E^i arrow.r B^i . $ <res:recurrence>]
  For $i = 1$, the groups $E^(- 2)$ and $B^1$ vanish, so $E^1 = 0$. For every $i gt.eq 2$, both displayed $B$-groups vanish; hence $delta^(*) : E^(i - 3) arrow.r E^i$ is an isomorphism. This includes $E^2 = 0$, and at $i = 3$ it sends $"id"_s$ to the nonzero class $delta$.
  More precisely, if $beta : s arrow.r s \[ i - 3 \]$, its image under this connecting map is
  $ delta^(*) \( beta \) = beta \[ 3 \] compose delta . $
  Thus (5.2) is multiplication by $delta$ in the Yoneda algebra. Every power $delta^m$ is nonzero and spans $E^(3 m)$, and all other nonnegative degrees vanish. We have proved $"Ext"_T^(*) \( s \, s \) = k \[ delta \]$ as an algebra.
  Lemma 7 shows that $p \( s \)$ is nonzero in degree three: the simple-valued cochain evaluates to $q^3 eq.not 0$ on the cycle $q^2 \[ t \| x \| J \] + \[ t \| y \| J \]$. Hence $p \( s \)$ is a nonzero scalar multiple of $delta$ and is itself a polynomial generator. This proves the stated normalization $tau = p \( s \)$ without choosing an isomorphism $L ⊗_C R tilde.eq s \[ 2 \]$ with a prescribed scalar. ◻
]

=== 5.3 Two independent degree-three generators <two-independent-degree-three-generators>

We now pass to the symmetric algebra and simple used in the remaining construction:

$ A = T ⊗_k T \, #h(2em) X = s ⊗_k s . $

The tensor product of the symmetrizing forms makes $A$ symmetric, and $dim_k A = 400$. Let $p_1 \, p_2$ be the external copies of the bimodule class $p$ on the two factors, and write $tau_i = p_i \( X \)$ for their evaluations.

#thm([Lemma 5.3.])[
  #emph[The simple left $A$-module $X$ is nonprojective, and 
$ xor.big_(a gt.eq 0) underline("Hom")_A \( X \, X \[ a \] \) = k \[ tau_1 \, tau_2 \] \, #h(2em) \| tau_1 \| = \| tau_2 \| = 3 . $

 The multiplication is composition with shifts, and its positive-degree part agrees with the ordinary Ext algebra.]
] <res:tensor>

#proof[
  Tensor two projective $T$-resolutions of $s$ over $k$. In each total degree the direct sum is finite, so this is a resolution of $X$ by finite projective $A$-modules. The Hom complex is the total tensor product of the two Hom complexes over $T$. Splitting complexes of vector spaces gives the Künneth isomorphism. Tensoring the comparison maps identifies multiplication as well; the external maps commute in characteristic two. Lemma 9 therefore gives
  $ "Ext"_A^(*) \( X \, X \) = k \[ tau_1 \, tau_2 \] . $
  In particular $X$ has a nonzero positive self-extension and cannot be projective. Its ordinary endomorphism ring is $k$, since $X$ is one dimensional. Its identity cannot factor through a projective module: such a factorization would make $X$ a direct summand of that projective. Thus its stable endomorphism ring is also $k$. Positive stable Hom agrees with Ext over the symmetric algebra $A$, giving the result. ◻
]

We have obtained two polynomial classes acting on $X$, together with specific bimodule representatives for them. The next step uses their cones to leave only two stable Hom groups; their degrees will determine the shift in the subsequent fiber construction.

== 6 Two cones with two surviving Hom groups <cone:section>

We now use the two degree-three classes to construct an $A$-bimodule $cal(C)$, projective on each side, for which the stable maps from $X$ to $cal(C) ⊗_A X \[ a \]$ survive only in degrees $0$ and $3$. The degree-three group will detect the maps constructed in the next section. Throughout this section, put

$ A = T ⊗_k T \, #h(2em) X = s ⊗_k s \, #h(2em) R = A^e . $

The algebras $A$ and $R$ are symmetric: their symmetrizing forms are the tensor products of the form on $T$ and, for opposite factors, the same form. Write

$ H^a = underline("Hom")_A \( X \, X \[ a \] \) . $

The preceding calculation gives

#[#set math.equation(numbering: n => "(6.1)")
 $ H^(gt.eq 0) = k \[ tau_1 \, tau_2 \] \, #h(2em) \| tau_1 \| = \| tau_2 \| = 3 . $ <cone:positive-ring>]

In degree zero this is also the stable endomorphism space: $X$ is one-dimensional, and its nonzero degree-three self-extension proves that it is nonprojective.

=== 6.1 Negative degrees and multiplication <negative-degrees-and-multiplication>

We first record the symmetric stable duality, including the compatibility with multiplication that will be needed below; see also #cite(label("Linckelmann2013")) Section 2. For finite modules $M \, N$ over a symmetric algebra $G$, it says that

#[#set math.equation(numbering: n => "(6.2)")
 $ D underline("Hom")_G \( M \, N \) tilde.eq underline("Hom")_G \( N \, M \[ - 1 \] \) \, #h(2em) D = "Hom"_k \( - \, k \) \, $ <cone:duality>]

naturally in $N$. Here is a direct proof with our indexing conventions. Choose a complete resolution $Q$ of $M$, so that $M = "coker" \( Q_1 arrow.r Q_0 \)$. For a finite projective $Q_i$, symmetry gives a natural isomorphism

$ D "Hom"_G \( Q_i \, N \) tilde.eq "Hom"_G \( N \, Q_i \) . $

It suffices to check this for $Q_i = G$, where it is the isomorphism $D G tilde.eq G$, and then to pass to finite sums and summands. Dualizing the cochain complex $"Hom"_G \( Q \, N \)$ therefore gives the chain complex $"Hom"_G \( N \, Q \)$. Its homology at zero consists of maps into $ker \( Q_0 arrow.r Q_(- 1) \) = Omega M$, modulo maps through $Q_1$. These are exactly the projective factorizations, since maps from a projective to $Omega M$ lift through $Q_1 arrow.r.twohead Omega M$. Vector-space duality is exact, proving (6.2) and its naturality.

In particular,

#[#set math.equation(numbering: n => "(6.3)")
 $ D H^a tilde.eq H^(- a - 1) . $ <cone:negative-duality>]

For $m gt.eq 0$, let $cal(P)_m$ denote the degree-$m$ part of the polynomial ring $k \[ tau_1 \, tau_2 \]$ when each variable is assigned degree one. Thus

#[#set math.equation(numbering: n => "(6.4)")
 $ H^(3 m) = cal(P)_m \, #h(2em) H^(- 3 m - 1) = D cal(P)_m quad \( m gt.eq 0 \) \, $ <cone:support>]

and all other groups vanish.

These identifications also determine the action of the two classes in negative degrees. Postcomposition by $tau_i \[ a \]$ gives $H^a arrow.r H^(a + 3)$. By naturality of (6.2), its transpose, after shifting the source back to $X$, is

$ H^(- a - 4) arrow.r H^(- a - 1) \, #h(2em) g mapsto g \[ 3 \] compose tau_i . $

When $a lt.eq - 4$, the last map is multiplication by $tau_i$ in the polynomial ring (6.1). The action within negative degrees is therefore the dual of polynomial multiplication. There is no nonzero product crossing from negative to nonnegative degree: the only nonzero possible source is $H^(- 1)$, and its target is $H^2 = 0$.

=== 6.2 Finite bimodules from projective tails <finite-bimodules-from-projective-tails>

We will form the two cones as ordinary complexes before passing to stable bimodules. We give the passage explicitly to retain finite representatives and exact tensor evaluation.

Bimodules attached to Hochschild classes and their iterated tensor products have a precursor in the support-variety constructions of Erdmann, Holloway, Snashall, Solberg and Taillefer #cite(label("ErdmannEtAl2003")) Section 2. Here we compute the full stable Hom profile directly, including negative degrees and the top attaching map.

If $V$ is a bounded below complex of finite projective $R$-modules that is exact in sufficiently high degrees, put

#[#set math.equation(numbering: n => "(6.5)")
 $ chevron.l V chevron.r = #scale(x: 120%, y: 120%)[\(] "coker" \( V_(N + 1) arrow.r V_N \) #scale(x: 120%, y: 120%)[\)] \[ N \] $ <cone:tail-definition>]

in the stable category, with $N$ sufficiently large. This does not depend on $N$: writing $V_N^(upright(c))$ for this cokernel, exactness gives

$ 0 arrow.r V_(N + 1)^(upright(c)) arrow.r V_N arrow.r V_N^(upright(c)) arrow.r 0 . $

Thus $V_(N + 1)^(upright(c)) tilde.eq V_N^(upright(c)) \[ - 1 \]$ stably. Chain maps defined in sufficiently high degrees induce maps on these cokernels, compatibly with increasing $N$ and with shifts. A chain homotopy changes the bottom induced map by a factorization through a projective, so homotopic tail maps induce the same stable map.

For a degreewise split short exact sequence of such complexes $0 arrow.r B arrow.r V arrow.r D arrow.r 0$, their cokernels at $N$ form a short exact sequence once $H_(N + 1) \( D \) = 0$. Indeed, a possible extra relation in the $B$-cokernel is obtained by lifting a cycle in $D_(N + 1)$. That cycle is a boundary; subtracting a lifted boundary leaves a relation already in $B$. The resulting stable sequence has the usual long exact stable Hom sequence: apply $"Hom"$ from a complete projective resolution to the short exact sequence and use its cohomology description of stable Hom. If the cross term of the differential is $r : D_j arrow.r B_(j - 1)$, the connecting stable map $chevron.l D chevron.r arrow.r chevron.l B chevron.r \[ 1 \]$ is induced by $r$. This follows by lifting along the degreewise splitting and taking the $B$-component of the differential, which is precisely $r$.

Call a bimodule #emph[side-projective] if it is projective separately as a left and as a right $A$-module. Finite stable shifts of a finite side-projective bimodule have finite side-projective representatives. For a syzygy, take a finite $R$-projective surjection; its kernel sequence splits on each side because its quotient is side-projective. For a cosyzygy, take a finite $R$-projective-injective embedding; its cokernel sequence splits on each side because its submodule is side-injective, by symmetry of $A$. Likewise a stable map $M arrow.r N$ between such bimodules has a finite side-projective cone: represent the map by $f$, embed $M$ into a finite $R$-projective $I$, and take the cokernel of $\( f \, i \) : M arrow.r N xor I$. Again the sequence splits on each side.

#thm([Lemma 6.1.])[
  #emph[Let $P$ be the bimodule bar resolution of $T$ and let $p : P arrow.r P \[ 3 \]$ be the selected comparison map. Form the ordinary complex 
$ K = "Cone" \( p : P \[ - 3 \] arrow.r P \) ⊗_k "Cone" \( p : P \[ - 3 \] arrow.r P \) . $

 Then $K$ has finite projective $R$-terms and is exact in degrees greater than zero. For every $N gt.eq 1$, its cokernel $C_N = "coker" \( K_(N + 1) arrow.r K_N \)$ is finite and side-projective. Consequently $cal(C) = chevron.l K chevron.r$ has a finite side-projective module representative. The same conclusions hold for the first two filtration levels of $K$.]
] <cone:finite>

#proof[
  Write $P^(upright("tot")) = P ⊗_k P$. In each total degree there are only finitely many summands, each an external tensor of projective bimodules; these are projective over $R$. The complex $P^(upright("tot"))$ resolves $A$. Label the four cone cells by subsets $S subset.eq { 1 \, 2 }$, where $i in S$ means that the shifted cell is selected in cone factor $i$. The $S$-cell is $P^(upright("tot")) \[ - 2 \| S \| \]$; its differential to the cell $S \\ { i }$ is the shifted comparison map $p_i$. Filtering by $\| S \|$ gives the three associated levels
  #[#set math.equation(numbering: n => "(6.6)")
   $ P^(upright("tot")) \, #h(2em) \( P^(upright("tot")) \[ - 2 \] \)^(xor 2) \, #h(2em) P^(upright("tot")) \[ - 4 \] . $ <cone:cells>]
  The cell homology is supported at $0 \, - 2 \, - 4$, respectively. The filtration long exact sequences therefore show that $K$ is exact in positive degrees.
  For $N gt.eq 1$, the cokernel filtration is exact by the preceding observation. Its factors, with multiplicities $1 \, 2 \, 1$, are
  $ "coker" #scale(x: 120%, y: 120%)[\(] P_(N + 2 r + 1)^(upright("tot")) arrow.r P_(N + 2 r)^(upright("tot")) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r = 0 \, 1 \, 2 . $
  The augmented resolution of $A$ splits on either $A$-side, since the regular module is projective; inductively all its syzygies are projective on each side. Thus these filtration factors are side-projective. Their extensions split on each side, proving the same property for $C_N$. Finally $C_N \[ N \]$ has a finite side-projective representative by the shift construction above. In particular one may take $N = 1$ and one finite cosyzygy of $C_1$. ◻
]

Forming the external tensor of ordinary complexes gives all four cells of (6.6) as projective resolutions of shifts of the regular $A$-bimodule. We pass to their stable representatives only after this construction.

Evaluation on a finite left module means tensoring over $A$ on the right. Tensoring with a side-projective bimodule is an exact functor of left $A$-modules and preserves projectives. Every $R$-projective evaluates to an $A$-projective, since a free bimodule evaluates to a module of the form $A ⊗_k V$. For evaluation at a fixed module, the right-split sequences used above remain exact. Their evaluations therefore preserve the stable shifts and long exact Hom sequences in the construction. Accordingly the filtration (6.6), after evaluation on $X$, has stable cells

$ X \, #h(2em) X \[ - 2 \]^(xor 2) \, #h(2em) X \[ - 4 \] . $

Its adjacent connecting maps are the shifted actions of $tau_1 \, tau_2$: they are induced by the original bimodule comparison maps tensored with $X$. This specifies the attaching maps whose Hom groups we now compute.

=== 6.3 The Hom profile and its top projection <the-hom-profile-and-its-top-projection>

#thm([Proposition 6.2.])[
  #emph[For the finite side-projective bimodule $cal(C)$ of Lemma 11, put 
$ W^a = underline("Hom")_A \( X \, \( cal(C) ⊗_A X \) \[ a \] \) . $

 For every integer $a$, 
$ W^a = cases(delim: "{", k \, & a = 0 upright(" or ") 3 \,, 0 \, & a in.not { 0 \, 3 } .) $

 Moreover the projection to the top cell induces an isomorphism 
#[#set math.equation(numbering: n => "(6.7)")
 $ W^3 arrow.r^(med tilde.op med) H^(- 1) . $ <cone:top-projection>]

]
] <cone:profile>

#proof[
  Let $cal(C)_(lt.eq 1)$ denote the first two filtration levels, represented by their projective tails as above. In total cohomological degree $a$, the Hom groups of the three associated levels are
  $ B^a = H^a \, #h(2em) D^a = \( H^(a - 2) \)^2 \, #h(2em) E^a = H^(a - 4) . $
  The adjacent connecting maps are
  $ d_a : D^a arrow.r B^(a + 1) \, #h(2em) d_a \( u \, v \) = tau_1 u + tau_2 v \, $
  $ d'_a : E^a arrow.r D^(a + 1) \, #h(2em) d'_a \( z \) = \( tau_2 z \, tau_1 z \) . $
  The order in the column records that deleting the first slot from the full cell leaves the second singleton, and conversely.
  We need the degreewise exact Koszul sequence
  #[#set math.equation(numbering: n => "(6.8)")
   $ 0 arrow.r cal(P)_(m - 1) arrow.r^(\( tau_2 \, tau_1 \)^t) cal(P)_m^(xor 2) arrow.r^(\( tau_1 \, tau_2 \)) cal(P)_(m + 1) arrow.r 0 #h(2em) \( m gt.eq 0 \) \, $ <cone:koszul>]
  where $cal(P)_j = 0$ for $j < 0$. The row is surjective because every positive-degree monomial is divisible by one of the variables. The column is injective, and coprimality of the variables shows that every relation $tau_1 u + tau_2 v = 0$ is of the form $\( u \, v \) = \( tau_2 w \, tau_1 w \)$. On negative groups, dualize (6.8) and interchange its two middle components. By the multiplication calculation above this gives exactly the sequence through $D^a$ there. At the seam its terminal zero space is the actual group $H^2 = 0$. We obtain, in all degrees,
  #[#set math.equation(numbering: n => "(6.9)")
   $ ker d_a & = "im" d'_(a - 1) \,\
"coker" d_(a - 1) & = cases(delim: "{", k \, & a = 0 \,, 0 \, & a eq.not 0 \,) & ker d'_a & = cases(delim: "{", k = H^(- 1) \, & a = 3 \,, 0 \, & a eq.not 3 .) $ <cone:koszul-consequences>]
  For the column kernel, its maps on $D cal(P)_m$ for $m gt.eq 1$ are dual to the surjective positive row and hence injective. Its remaining source is $D cal(P)_0 = H^(- 1)$, whose two products vanish in $H^2$.
  It remains to check that the actual filtration has no further effect on these scalar classes. Put
  $ K_1^a = underline("Hom")_A \( X \, \( cal(C)_(lt.eq 1) ⊗_A X \) \[ a \] \) . $
  The first filtration long exact sequence gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ 0 arrow.r "coker" d_(a - 1) arrow.r K_1^a arrow.r^(q_a) ker d_a arrow.r 0 . $ <cone:first-les>]
  The top-cell connecting map is $r_a : E^a arrow.r K_1^(a + 1)$, and its projection satisfies $q_(a + 1) r_a = d'_a$. Thus $ker r_a subset.eq ker d'_a$, so it can be nonzero only when $a = 3$. At that index $K_1^4 = 0$ by (6.10), since $D^4 = \( H^2 \)^2 = 0$. Hence $ker r_3 = E^3 = H^(- 1)$.
  The image of $r_(a - 1)$ surjects onto $ker d_a$ by (6.9). When $a eq.not 0$, the left term of (6.10) vanishes, so $r_(a - 1)$ is surjective. When $a = 0$, that sequence gives $K_1^0 = k$, whereas the only incoming source is $E^(- 1) = H^(- 5) = 0$. Therefore $"coker" r_(a - 1)$ is $k$ exactly at $a = 0$ and zero elsewhere.
  Finally the second filtration long exact sequence gives
  $ 0 arrow.r "coker" r_(a - 1) arrow.r W^a arrow.r ker r_a arrow.r 0 . $
  This proves the asserted groups. At $a = 3$ its left term vanishes and its right term is all of $E^3 = H^(- 1)$, so the actual top-cell projection is an isomorphism, proving (6.7). ◻
]

The two exact sequences in the proof account for the complete filtration, including any attaching map not determined by its adjacent component. We have therefore obtained the required two-scalar profile together with a concrete way to detect its degree-three class: after shifting the cone by three, it suffices to project to $X \[ - 1 \]$. The next construction supplies maps with a nonzero projection there.

== 7 Twisted bimodules and a lift to the two cones <sec:lift>

We now construct two stable bimodule maps whose evaluations generate the one-dimensional degree-three group of the cone calculation. Their sources will have distinct twisting actions. The essential point is a chain-level lift: we give the homotopies in every degree and identify its projection to the top cell.

For a nonzero scalar $H in k$, let $h = h_H$ be the automorphism of $T$ that fixes $C$ and multiplies $D C$ by $H$. Write $T_h$ for the bimodule with its usual left action and right action $x dot.op a = x h \( a \)$. Put

$ U = T_h \, #h(2em) Q = P_h \, #h(2em) U_H = A_(h ⊗ h) \, #h(2em) Q^(upright("tot")) = Q ⊗_k Q . $

Thus $Q$ is the right-twisted bar resolution of $U$, with augmentation $epsilon.alt : Q_0 arrow.r U$. A formula on its bar generators extends by

#[#set math.equation(numbering: n => "(7.1)")
 $ psi #scale(x: 120%, y: 120%)[\(] a_0 \[ a_1 \| dots.h.c \| a_i \] a_(i + 1) #scale(x: 120%, y: 120%)[\)] = a_0 psi \( \[ a_1 \| dots.h.c \| a_i \] \) h^(- 1) \( a_(i + 1) \) . $ <lift:extension>]

Here the displayed terminal coefficient is its underlying element of $T$. This convention makes $psi$ right linear from the twisted source to an untwisted target.

#thm([Proposition 7.1.])[
  #emph[For each $H in k^times$, there is a stable bimodule map 
$ f_H : U_H arrow.r cal(C) \[ 3 \] $

 whose composite with the top-cell projection $cal(C) \[ 3 \] arrow.r A \[ - 1 \]$ is represented by the bimodule map $beta_H : U_H arrow.r Omega A subset P_0 ⊗ P_0$ determined by 
$ beta_H \( 1 \) = (sum_w h \( w \) ⊗_I w^(*)) ⊗ (sum_w h \( w \) ⊗_I w^(*)) \, $

 where each sum is over the letter basis of $T$. Under the canonical identification $U_H ⊗_A X tilde.eq X$, its projection after evaluation sends 
$ 1 mapsto H^2 \( f^(*) ⊗ f^(*) \) quad upright("in") quad Omega X = "rad" \( A \) \( f ⊗ f \) subset A \( f ⊗ f \) . $

 This evaluated map is nonzero modulo maps factoring through projectives. In particular, $f_H X$ is nonzero in $underline("Hom")_A \( X \, cal(C) X \[ 3 \] \)$.]
] <lift:main>

=== 7.1 A twisted trace-dual tensor <a-twisted-trace-dual-tensor>

For a basis letter $w$ of $T$, write $w^(*)$ for its trace-dual letter. In $P_0 = T ⊗_I T$, set

#[#set math.equation(numbering: n => "(7.2)")
 $ xi_H = sum_(w upright(" in the basis of ") T) h \( w \) ⊗_I w^(*) . $ <lift:casimir>]

The trace-dual coevaluation identity is standard; see #cite(label("Broue2009")) Proposition 3.3. The associative symmetric trace gives the ordinary coevaluation identity $a sum_w w ⊗ w^(*) = sum_w w ⊗ w^(*) a$. Applying $h$ to the first factor and projecting to $⊗_I$ gives

$ h \( a \) xi_H = xi_H a . $

Consequently $b : U arrow.r P_0$, defined by $b \( x \) = x xi_H$, is a bimodule map.

We need the stronger fact that $b$ takes values in $ker pi$, where $pi : P_0 arrow.r T$ is multiplication. For a lower-case basis letter $w$ of $C$, the product $w w^(*)$ is the dual of its left vertex idempotent, and $w^(*) w$ is the dual of its right vertex idempotent. Indeed $\( w w^(*) \) \( c \) = w^(*) \( c w \)$; the positive grading makes this zero for $c in "rad" C$, and the idempotent values determine the assertion. The row dimensions of $C$ are $6 \, 4$, and its column dimensions are also $6 \, 4$. Separating the lower-case and upper-case letters therefore gives

$ pi xi_H = sum_(w upright(" lower-case")) w w^(*) + H sum_(w upright(" lower-case")) w^(*) w = 0 $

in characteristic two. The same calculation on each left vertex $r in { e \, f }$ gives

#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(w in frak(r) upright(" a basis letter")\
upright("left") \( w \) = r) h \( w \) w^(*) = r^(*) . $ <lift:endpoint>]

Here the full sum is zero and the omitted idempotent term is $r r^(*) = r^(*)$.

Taking the external square, define

#[#set math.equation(numbering: n => "(7.4)")
 $ beta_H = b ⊗_k b : U_H arrow.r ker \( P_0^(upright("tot")) arrow.r A \) = Omega A \, #h(2em) P^(upright("tot")) = P ⊗_k P . $ <lift:beta>]

Its image lies in the indicated kernel because $pi b = 0$. The remaining task is to lift this map through the top-cell projection.

=== 7.2 Two homotopies on the bar resolution <two-homotopies-on-the-bar-resolution>

Let $D_b : Q arrow.r P$ be $b epsilon.alt$ in degree zero and zero in every positive degree. It is a chain map. A homotopy for $D_b$ will supply a comparison representing $beta_H$ in the top cell. Define maps $B_i : Q_i arrow.r P_(i + 1)$ for every $i gt.eq 0$ by

#[#set math.equation(numbering: n => "(7.5)")
 $ B_i \( \[ a_1 \| dots.h.c \| a_i \] \) = sum_(w in frak(r) upright(" a basis letter")) \[ a_1 \| dots.h.c \| a_i \| h \( w \) \] w^(*) \, $ <lift:Bformula>]

retaining only composable terms and extending by (7.1).

#thm([Lemma 7.2.])[
  #emph[On the nonnegative resolutions, with $B_(- 1) = 0$, one has 
$ d B + B d = D_b . $

]
] <lift:B>

#proof[
  For $a in frak(r)$ with right vertex $r$, project the first factor of $a xi_H = xi_H h^(- 1) \( a \)$ to $frak(r)$ along $I$. Removing the idempotent terms leaves
  #[#set math.equation(numbering: n => "(7.6)")
   $ sum_(w in frak(r)) a h \( w \) ⊗ w^(*) + sum_(w in frak(r)) h \( w \) ⊗ w^(*) h^(- 1) \( a \) = a ⊗ r^(*) \, $ <lift:projected-casimir>]
  with the appropriate vertex restrictions in each sum. On the left side of the original identity, the omitted term is $a ⊗ r^(*)$; on its right side the omitted first factors lie in $I$ and disappear under the projection.
  For $i > 0$, expand $d B_i + B_(i - 1) d$ on a bar generator. All multiplications strictly before the old final bar cancel in pairs. The two terms adjacent to the old final letter have sum $\[ a_1 \| dots.h.c \| a_i \] r^(*)$ by (7.6). The last multiplication in $d B_i$ is exactly the same expression by (7.3), so these terms also cancel.
  At degree zero, on the generator $r \[ \] r$, the differential gives
  $ d B_0 \( r \[ \] r \) = sum_(w in frak(r)\
upright("left") \( w \) = r) h \( w \) \[ \] w^(*) + r \[ \] sum_(w in frak(r)\
upright("left") \( w \) = r) h \( w \) w^(*) . $
  The second term is $r \[ \] r^(*)$ by (7.3). It restores the omitted idempotent term of the full tensor (7.2); the result is $r xi_H = b epsilon.alt \( r \[ \] r \)$. Bimodule linearity proves the identity on every degree-zero element. ◻
]

We now use $B$ to represent the prescribed top projection. In $K \[ 3 \]$, the cell indexed by ${ 1 \, 2 }$ is $P^(upright("tot")) \[ - 1 \]$. Put $V = B ⊗ D_b$, which raises the underlying total degree by one, as this shift requires. Lemma 14 gives

$ d V + V d = \( b ⊗ b \) epsilon.alt^(upright("tot")) \, $

where the right side is supported in degree zero. Thus $d V_0 = beta_H epsilon.alt_0^(upright("tot"))$, and at positive indices $V$ satisfies the comparison equation. The complex with terms $P_(i + 1)^(upright("tot"))$ and augmentation to $Omega A$ resolves $Omega A$. Consequently $V$ is a comparison lifting $beta_H$.

To extend $V$ from the top cell to $K \[ 3 \]$, we must account for the two attaching maps. Deleting slot 1 contributes $p B ⊗ D_b$ to the cell indexed by ${ 2 }$. The suffix comparison $p : P arrow.r P \[ 3 \]$ from the finite cochain data lowers the underlying bar degree by three, so $p D_b = 0$. The contribution from deleting slot 2 is therefore zero. It remains to cancel $p B ⊗ D_b$ by a component in cell ${ 2 }$. Lemma 14 shows that $p B : Q arrow.r P \[ 2 \]$ is a chain map. The additional boundary identity (4.6) supplies its nullhomotopy; cocycle closure by itself would not suffice.

#thm([Lemma 7.3.])[
  #emph[There are bimodule maps $G_i : Q_i arrow.r P_(i - 1)$ for all $i gt.eq 0$ such that 
$ p B = d G + G d . $

]
] <lift:G>

#proof[
  Let $z' : Q_1 arrow.r T$ be the cochain given by $z' \( \[ a \] \) = z_H \( a \)$ from Lemma 7, with extension (7.1). Its boundary on $\[ a \| b \]$ is
  $ a z' \( b \) + z' \( a b \) + z' \( a \) h^(- 1) \( b \) . $
  By identity (4.6), this equals $sum_(w in frak(r)) p \( a \, b \, h \( w \) \) w^(*)$, which is the augmentation of $\( p B \)_2$. Hence
  #[#set math.equation(numbering: n => "(7.7)")
   $ pi \( p B \)_2 = z' d : Q_2 arrow.r T . $ <lift:boundary>]
  Set $G_0 = 0$ and choose $G_1 : Q_1 arrow.r P_0$ with $pi G_1 = z'$. The choice is possible because $Q_1$ is projective and $pi$ is surjective. By (7.7), the map $\( p B \)_2 + G_1 d$ has image in $ker pi = "im" \( d : P_1 arrow.r P_0 \)$. Projectivity of $Q_2$ therefore supplies $G_2$ with $d G_2 = \( p B \)_2 + G_1 d$.
  Suppose $i gt.eq 3$ and the homotopy equation has been established below $i$. Since $p B$ is a chain map,
  $ d #scale(x: 120%, y: 120%)[\(] \( p B \)_i + G_(i - 1) d #scale(x: 120%, y: 120%)[\)] = \( p B \)_(i - 1) d + #scale(x: 120%, y: 120%)[\(] \( p B \)_(i - 1) + G_(i - 2) d #scale(x: 120%, y: 120%)[\)] d = 0 . $
  Exactness of $P$ in positive degree and projectivity of $Q_i$ allow this map to be lifted through $d : P_(i - 1) arrow.r P_(i - 2)$, giving $G_i$. This proves the equation for every $i gt.eq 2$. At $i = 0 \, 1$ both sides are zero, since $p B$ has negative target index and $G_0 = 0$. ◻
]

=== 7.3 The tail map and its evaluation <the-tail-map-and-its-evaluation>

The homotopy $G$ supplies the required correction in the singleton cell ${ 2 }$, whose shift in $K \[ 3 \]$ is $1$. Together with the top component $V$, it defines a graded map $Phi : Q^(upright("tot")) arrow.r K \[ 3 \]$:

#[#set math.equation(numbering: n => "(7.8)")
 $ Phi_({ 1 \, 2 }) = B ⊗ D_b \, #h(2em) Phi_({ 2 }) = G ⊗ D_b \, #h(2em) Phi_({ 1 }) = Phi_diameter = 0 . $ <lift:tail>]

The second component lowers underlying degree by one, as the singleton shift requires; the first is the comparison $V$ constructed above.

In the top cell, the chain defect $d Phi + Phi d$ is $D_b ⊗ D_b$. In cell ${ 2 }$, deletion of slot 1 gives $p B ⊗ D_b$, canceled by $\( d G + G d \) ⊗ D_b$. Deleting slot 2 from either nonzero component gives zero because $p D_b = 0$. Thus the only defect is $D_b ⊗ D_b$, supported in total source degree zero. The map therefore commutes with the differential in every positive total degree. Passing to high cokernels, at a common index at least $4$ as in Lemma 11, gives $f_H : U_H arrow.r cal(C) \[ 3 \]$.

The top component is still $V$, so the resulting stable projection is $beta_H$, as identified above.

#thm([Lemma 7.4.])[
  #emph[Under $U_H ⊗_A X tilde.eq X$, the evaluated map $beta_H X$ sends $1$ to $H^2 \( f^(*) ⊗ f^(*) \)$ in $Omega X subset A \( f ⊗ f \)$. It does not factor through a projective $A$-module.]
] <lift:evaluation>

#proof[
  In one slot, tensoring (7.2) with the simple leaves only the term whose right coefficient is $f$. It is the term $w = f^(*)$, so its value is $H f^(*)$. Taking the external square gives the stated value. The cover sequence remains exact on evaluation because it splits on the right. Its evaluated degree-zero term is $A \( f ⊗ f \)$, the projective cover of $X$, with kernel $"rad" \( A \) \( f ⊗ f \)$.
  Suppose a map $X arrow.r "rad" \( A \) \( f ⊗ f \)$ factors through a projective. It then factors through a finite free module. Every component of a map $X arrow.r A$ has image in the left socle, since $"rad" \( A \) X = 0$. In a symmetric algebra the left socle also annihilates the radical on the right: if $"rad" \( A \) u = 0$, then, for $j in "rad" \( A \)$ and $a in A$,
  $ "tr" \( a u j \) = "tr" \( j a u \) = 0 \, $
  so nondegeneracy of the trace gives $u j = 0$. A map $A arrow.r "rad" \( A \) \( f ⊗ f \)$ is right multiplication by its value at $1$, which lies in $"rad" \( A \)$, and hence kills the left socle. Every such factorization is therefore zero. Our displayed map has the nonzero value $H^2 \( f^(*) ⊗ f^(*) \)$, proving the claim. ◻
]

By Proposition 12, the top-cell projection is an isomorphism on the degree-three group of the cone calculation. Lemma 16 therefore proves that $f_H X$ is nonzero, completing Proposition 13. We have obtained the two required maps by taking $H = H_1 \, H_2$; the next section combines them into a finite bimodule.

== 8 Two twists and a finite bimodule fiber <branch:section>

We now construct the finite bimodule and the stable map required by Proposition 2. The two twists will act differently on every positive self-extension of $X$, while agreeing on its identity. The fiber of their maps to $cal(C) \[ 3 \]$ turns this distinction into the comparison isomorphisms used in that proposition.

=== 8.1 A finite representative and an exact sequence <a-finite-representative-and-an-exact-sequence>

Write $R = A^e$. Lemma 11 provides the finite bimodule

$ C_1 = "coker" \( K_2 arrow.r K_1 \) \, #h(2em) cal(C) = C_1 \[ 1 \] $

in the stable category of $R$. It is projective on both $A$-sides. To fix actual finite representatives for its shifts, for a finite left $R$-module $M$ use the injection

#[#set math.equation(numbering: n => "(8.1)")
 $ j_M : M arrow.r I_R \( M \) := "Hom"_k \( R \, M \) \, #h(2em) j_M \( m \) \( t \) = t m \, #h(2em) \( r phi \) \( t \) = phi \( t r \) . $ <branch:finite-embedding>]

Evaluation at $1$ proves injectivity. Since $R$ is symmetric, $I_R \( M \) tilde.equiv D R ⊗_k M tilde.equiv R ⊗_k M$ as left $R$-modules, so this is a finite projective module. Put $Sigma_R M = "coker" j_M$. When $M$ is projective on each $A$-side, the sequence defining $Sigma_R M$ splits on each side: $A$ is self-injective, so $M$ is injective on either side. Thus $Sigma_R M$ remains projective on both sides and represents $M \[ 1 \]$.

In particular, fix the actual finite bimodule

#[#set math.equation(numbering: n => "(8.2)")
 $ cal(Y) = Sigma_R^4 C_1 . $ <branch:Y>]

It is projective on both sides and represents $cal(C) \[ 3 \]$. This fixes one target for both lifts of Proposition 13. Concretely, the tail map there at index $4$ induces $Omega_R^4 U_H arrow.r C_1$, because

$ "coker" #scale(x: 120%, y: 120%)[\(] K \[ 3 \]_5 arrow.r K \[ 3 \]_4 #scale(x: 120%, y: 120%)[\)] = "coker" \( K_2 arrow.r K_1 \) . $

Taking four cosyzygies gives the stable map $U_H arrow.r cal(Y)$, using $Sigma_R^4 Omega_R^4 U_H tilde.equiv U_H$ stably. It therefore has an actual bimodule-map representative between these finite modules.

For $i = 1 \, 2$, put

$ sigma_i = h_(H_i) ⊗ h_(H_i) \, #h(2em) U_i = A_(sigma_i) . $

Thus $U_i$ has its usual left action and right action $u dot.op a = u sigma_i \( a \)$. Each $U_i$ is free of rank one on both $A$-sides. The canonical identification $U_i ⊗_A X = X$ uses the fact that $sigma_i$ fixes the simple character of $X$.

By Lemma 16, the top projections of the evaluated lifts are $H_i^2 beta_0$ for one fixed nonzero class $beta_0 in underline("Hom")_A \( X \, X \[ - 1 \] \)$. By Proposition 12, the top projection

$ W^3 = underline("Hom")_A \( X \, cal(C) X \[ 3 \] \) arrow.r underline("Hom")_A \( X \, X \[ - 1 \] \) $

is an isomorphism. Rescale the two lifts by $H_i^(- 2)$, and choose actual representatives $g_i : U_i arrow.r cal(Y)$ of these rescaled maps. Their evaluations are the same nonzero element $w in W^3$.

Take the finite free $R$-module $Q = R ⊗_k cal(Y)$ and its surjection $pi : Q arrow.r cal(Y)$, $pi \( r ⊗ y \) = r y$. Define $F$ by the exact sequence

#[#set math.equation(numbering: n => "(8.3)")
 $ 0 arrow.r F arrow.r U_1 xor U_2 xor Q arrow.r^(med \( g_1 \, g_2 \, pi \) med) cal(Y) arrow.r 0 \, $ <branch:finite-fiber>]

and let $rho_i : F arrow.r U_i$ be the two projections. This is a construction of finite modules: $C_1$ is a cokernel of two finite terms, four finite cokernels give $cal(Y)$, and one finite kernel gives $F$. Since $cal(Y)$ is projective on each side, (8.3) splits on each side. Consequently $F$ is projective as both a left and a right $A$-module.

Tensoring (8.3) with $X$ preserves exactness. Furthermore, $Q ⊗_A X$ is projective over $A$: evaluation of a free $A^e$-module is a free $A$-module, and evaluation preserves direct summands. Thus the evaluated stable triangle is

#[#set math.equation(numbering: n => "(8.4)")
 $ F X arrow.r X xor X arrow.r^(med \( w \, w \) med) cal(C) X \[ 3 \] arrow.r F X \[ 1 \] . $ <branch:evaluated-triangle>]

Here and below $F M$ means $F ⊗_A M$. Tensoring with $F$ is exact because $F$ is right projective; it preserves projectives because $F$ is left projective. It therefore acts on stable maps compatibly with shifts. The actual maps $rho_i$ give natural transformations from this functor to tensoring with $U_i$.

#thm([Lemma 8.1.])[
  #emph[Put $V^a = underline("Hom")_A \( X \, F X \[ a \] \)$ for each integer $a$. There is a unique $v in V^0$ whose two projections are $"id"_X$. It spans $V^0$. For every integer $a > 0$, projection induces an isomorphism 
#[#set math.equation(numbering: n => "(8.5)")
 $ \( rho_1 \[ a \] \, rho_2 \[ a \] \) : V^a arrow.r^tilde.op \( H^a \)^2 \, #h(2em) H^a = underline("Hom")_A \( X \, X \[ a \] \) . $ <branch:positive-projection>]

]
] <branch:profile>

#proof[
  Applying stable Hom from $X$ to (8.4) gives
  $ \( H^(a - 1) \)^2 arrow.r W^(a + 2) arrow.r V^a arrow.r \( H^a \)^2 arrow.r W^(a + 3) . $
  At $a = 0$, the first relevant group is $W^2 = 0$, and the last map is $k^2 arrow.r W^3$, $\( c \, d \) mapsto \( c + d \) w$. It is surjective, so $V^0$ identifies with the diagonal line in $k^2$. This proves the assertion about $v$.
  At $a = 1$, the preceding map $\( H^0 \)^2 arrow.r W^3$ is precisely this surjection. It kills the potential connecting term from $W^3$ to $V^1$, and $W^4 = 0$. Therefore (8.5) is an isomorphism in degree $1$ as well. For $a gt.eq 2$, both $W^(a + 2)$ and $W^(a + 3)$ vanish by Proposition 12, giving the isomorphism directly. ◻
]

We have obtained an actual finite bimodule $F$ and a nonzero stable map $v : X arrow.r F X$. It remains to compare tensoring an extension with $F$ and composing that extension with $v$.

=== 8.2 The twist eigenvalues and the comparison map <the-twist-eigenvalues-and-the-comparison-map>

#thm([Lemma 8.2.])[
  #emph[For $H in { H_1 \, H_2 }$, tensoring with $U_H = A_(h_H ⊗ h_H)$, under its canonical identification on $X$, acts on the whole space $H^(3 m)$ as multiplication by $H^(- m)$ for every integer $m gt.eq 0$.]
] <branch:twist>

#proof[
  The inverse automorphism in this formula follows from the right-twist convention. For an automorphism $h$ of $T$ and a left $T$-module $M$, the balanced map
  $ T_h ⊗_T M arrow.r zws_(h^(- 1)) M \, #h(2em) a ⊗ m mapsto h^(- 1) \( a \) m $
  is an isomorphism; the target action is $b dot.op m = h^(- 1) \( b \) m$. For $M = s$ it is the canonical simple identification.
  In the normalized bar resolution of $s$, a comparison into its $T_h$-tensor image applies $h^(- 1)$ to every bar letter. It commutes with the differential because $h^(- 1)$ preserves products; the first multiplication agrees by the balancing relation for the right-twisted factor, and the last action agrees because $h$ fixes the character of $s$. The simple-valued degree-three cocycle obtained from $p$ has exactly one dual-ideal input in each nonzero component. Indeed $p$ lowers the dual-letter weight by one, and only weight-zero outputs can act nontrivially on $s$. The bar comparison therefore multiplies this cochain, and hence its class $tau$, by $H^(- 1)$.
  The tensor functor preserves Yoneda products. In the two-factor algebra $A$, both factors of one branch use the same $H$, so both $tau_1$ and $tau_2$ acquire the factor $H^(- 1)$. Every basis monomial $tau_1^r tau_2^(m - r)$ of $H^(3 m)$ acquires $H^(- m)$. Linearity gives the assertion on the entire homogeneous piece. ◻
]

#thm([Proposition 8.3.])[
  #emph[The finite bimodule $F$ in (8.3) is projective on both $A$-sides, and the map $v$ of Lemma 17 satisfies the following conditions. For every integer $a gt.eq 0$, define 
#[#set math.equation(numbering: n => "(8.6)")
 $ delta^a : H^a xor H^a arrow.r V^a \, #h(2em) \( g \, j \) mapsto F \( g \) v + v \[ a \] j . $ <branch:delta>]

 Then $delta^0$ is surjective with a one-dimensional kernel, and $delta^a$ is an isomorphism for every integer $a > 0$.]
] <branch:comparison>

#proof[
  Finiteness and both projectivity assertions were proved in the construction. The actual bimodule projections $rho_i$ are natural with respect to tensoring module maps and their stable shifts. Since $rho_i v = "id"_X$, they give
  $ rho_i \[ a \] F \( g \) v = U_i \( g \) \, #h(2em) rho_i \[ a \] v \[ a \] j = j . $
  For $a = 0$, $k$-linearity therefore gives $delta^0 \( c "id"_X \, d "id"_X \) = \( c + d \) v$. This is onto and has the diagonal line as its kernel.
  Let $a = 3 m > 0$. Under (8.5) and Lemma 18, the map (8.6) is
  #[#set math.equation(numbering: n => "(8.7)")
   $ \( g \, j \) mapsto #scale(x: 120%, y: 120%)[\(] H_1^(- m) g + j \, med H_2^(- m) g + j #scale(x: 120%, y: 120%)[\)] . $ <branch:matrix>]
  It is a $2 times 2$ scalar matrix tensored with the identity of $H^(3 m)$; that space has dimension $m + 1$. The scalar matrix has determinant $H_1^(- m) + H_2^(- m) eq.not 0$. Otherwise $H_1^m = H_2^m$, contrary to algebraic independence: the two distinct monomials remain distinct in the fraction field of $bb(F)_2 \[ q \, H_1 \, H_2 \]$. This argument holds for every positive integer $m$, including those divisible by the characteristic. Hence (8.7) is invertible.
  If $a > 0$ is not divisible by $3$, then $H^a = 0$, and Lemma 17 gives $V^a = 0$. Thus $delta^a$ is an isomorphism in these degrees too. ◻
]

The hypotheses of Proposition 2 are now verified for the finite symmetric algebra $A$, its finite module $X$, and the actual finite bimodule $F$ and stable map $v$. Applying that proposition to

$ Lambda = mat(delim: "(", A, 0; F, A) $

produces the required finite nonprojective Gorenstein-projective left module, with both positive Ext vanishings in every degree. In particular, the degree-one assertion uses the surjectivity at degree zero established in Proposition 19, in addition to the positive-degree invertibility.

== 9 The radical and extension of scalars <sec:consequences>

The construction has already supplied the two Ext vanishings and a finite nonprojective Gorenstein-projective module. We verify the remaining assertions of Theorem 1.

#thm([Proposition 9.1.])[
  #emph[The algebra $Lambda$ is noncommutative, satisfies $Lambda \/ "rad" Lambda tilde.eq k^8$, and has $"rad" \( Lambda \)^4 eq.not 0$.]
] <prop:radical>

#proof[
  Put $J_T = "rad" T$. Since $T = C times.l D C$ and $C \/ "rad" C tilde.eq k^2$,
  $ J_T = "rad" C xor D C \, #h(2em) T \/ J_T tilde.eq k^2 . $
  The ideal $J_T ⊗ T + T ⊗ J_T$ in $A = T ⊗ T$ is nilpotent: the two summand ideals commute, and each is nilpotent. Its quotient is $k^4$, so it equals $J_A = "rad" A$. In the triangular algebra, the ideal
  $ J_Lambda = mat(delim: "(", J_A, 0; F, J_A) $
  is nilpotent as well. Indeed, a product has at most one off-diagonal factor, with powers of $J_A$ on its two sides; sufficiently long products vanish. Its quotient is $k^4 xor k^4$. A nilpotent ideal with semisimple quotient is the radical, proving the split assertion and the count of simple modules.
  Let $chi : T arrow.r k$ be the character of $s$. There are surjective algebra maps
  $ Lambda arrow.r A arrow.r^("id"_T ⊗ chi) T arrow.r C . $
  For a surjection of finite-dimensional algebras, the image of the radical is the radical of the quotient: the image is nilpotent, and the quotient by that image is a quotient of a semisimple algebra. In $C$, the multiplication table gives
  $ \( u t \)^2 = \( y + q x \)^2 = q \( 1 + q \) z eq.not 0 . $
  Since $u \, t in "rad" C$, the fourth radical power of $C$ is nonzero, and consequently so is that of $Lambda$. Finally $e u = u$ and $u e = 0$ in $C$, so $C$ and its covering algebra $Lambda$ are noncommutative. ◻
]

#thm([Proposition 9.2.])[
  #emph[For every field extension $K \/ k$, the algebra $Lambda_K = K ⊗_k Lambda$ and module $Z_K = K ⊗_k Z$ satisfy all conclusions of Theorem 1 over $K$.]
] <prop:basechange>

#proof[
  For finite $Lambda$-modules $M \, N$, take a resolution of $M$ with finite projective terms. In each degree, finite projectivity gives
  $ K ⊗_k "Hom"_Lambda \( P_i \, N \) tilde.eq "Hom"_(Lambda_K) \( K ⊗_k P_i \, K ⊗_k N \) . $
  Flatness of $K$ over $k$ commutes with kernels and images, hence
  #[#set math.equation(numbering: n => "(9.1)")
   $ K ⊗_k "Ext"_Lambda^i \( M \, N \) tilde.eq "Ext"_(Lambda_K)^i \( M_K \, N_K \) #h(2em) \( i gt.eq 0 \) . $ <eq:basechange>]
  This proves both Ext vanishings. The totally acyclic complex defining $Z$ remains exact after tensoring with $K$; the same termwise Hom isomorphism, now with target $Lambda$, shows that its dual complex over $Lambda_K$ is exact. Thus $Z_K$ is Gorenstein-projective.
  Choose a finite projective surjection $P arrow.r.twohead Z$ with kernel $N$. It does not split, because $Z$ is nonprojective. Its class in $"Ext"_Lambda^1 \( Z \, N \)$ is nonzero and stays nonzero under (9.1), since field extension is faithful. Thus the extended sequence does not split and $Z_K$ is nonprojective.
  The radical ideal in Proposition 20 stays nilpotent and has quotient $K^8$ after scalar extension, so it is the radical of $Lambda_K$. Its nonzero fourth power stays nonzero. This also proves the split and radical assertions over $K$. ◻
]

== 10 The complete degree-three cochain <app:cochain>

This appendix specifies the finite cochain used in Lemma 7, including the coefficient identities that verify its properties. Lower-case letters are the basis of $C$ from (4.1); capital letters are the dual basis of $D C$. A four-letter entry $a b c v$ in the table means that the indicated coefficient is the coefficient of $v$ in $p \( a \, b \, c \)$. All unlisted coefficients are zero. For example, the entry #raw("tyJf") in the $q^3$ row means $p \( t \, y \, J \) = q^3 f$. Each entry has composable radical inputs and an output with the same two endpoints.

#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (right, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[coefficient
], table.cell(rowspan: 1, colspan: 1)[input and output letters
]),
  table.cell(rowspan: 1, colspan: 1)[$q^2$
], table.cell(rowspan: 1, colspan: 1)[#raw("EuNT EyZX FNtU JtXZ NtEU NtXV XzJT ZxEY tEun tXuf")
],
  table.cell(rowspan: 1, colspan: 1)[$q^2$
], table.cell(rowspan: 1, colspan: 1)[#raw("tXvn tXzj tuFn tuNf tvNn uFNT vNNT vtJu xEyz zJtx")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("EuUE EuVX EvVE ExXE EyYE EzZE FNnF FVvF FVxU FtTF")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("FtYU Ftun Ftxj JFtX JNtZ JUyX JVyZ JjEE JjTT JjXX")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("NFtU NNtV NUyU NVyV NjJN NjZV NnNN NnVV Ntuf Ntvn")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("Ntzj TtEE TtXX UuFF UuUU UvNF UvVU UxXU Uyun Uyxj")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("UzZU VvNN VvVV VxEU VxXV Vyuf Vyvn Vyzj VzZV XxEE")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("XxXX YuFT YuUY YvNT YvVY YxXY YyEE YyJJ YyTT YyXX")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("YyYY YyZZ YzZY ZxXZ ZzEE ZzJJ ZzTT ZzXX jJFF jJUU")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("jJjj jJnn jYyj jZvn jZzj nNFF nNUU ntTn tJjt tTNN")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("tTVV tTtt tYyt tZzt tzJn uFVX uFty uNFT uNUY uNte")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("uUyy uVye ujJu vNUE vNVX vNty vVyy vtTv xEuv xJFT")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("xJUY xJjx xJte xTtx xXuu xXvv xXyy xXzz xYyx xZye")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("xZzx xuFv xuNu xvNv yxJu yzJv zJNT zJVY zYyz zZuu")
],
  table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[#raw("zZvv zZyy zZzz")
],
  table.cell(rowspan: 1, colspan: 1)[$q^3$
], table.cell(rowspan: 1, colspan: 1)[#raw("EyJT JtEY tEyj tyJf")
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[#raw("JNjX JVzX NNjU NVzU NjYU Njun Njxj Ntxt TNtX TVyX")
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[#raw("Vyxt VzYU Vzun Vzxj YuNJ YuVZ jYun juNn jxJn txTn")
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[#raw("uNNJ uNVZ uNjy uVzy xJNJ xJVZ xTNT xTVY yxTv zYuv")
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[#raw("zuNv zxJv")
],
)
]

There are 179 entries, with distinct three-letter inputs. In each entry the number of capital input letters is one more than the number of capital output letters. This proves the weight assertion.

Here are explicit finite recurrences for checking the remaining identities. They also specify how every zero entry participates in the calculation. Let $cal(B)$ be the twenty-letter basis and $cal(B)_(frak(r)) = cal(B) \\ { e \, f }$. Write

$ a b = sum_v mu_(a b)^v v \, #h(2em) p \( a \, b \, c \) = sum_v p_(a b c)^v v . $

The lower-case coefficients $mu$ are exactly (4.2) and the idempotent actions. The remaining coefficients are determined, for lower-case $a \, b \, c$, by

#[#set math.equation(numbering: n => "(10.1)")
 $ mu_(a \, b^(*))^(c^(*)) = mu_(c a)^b \, #h(2em) mu_(b^(*) \, a)^(c^(*)) = mu_(a c)^b \, #h(2em) mu_(a^(*) \, b^(*))^v = 0 . $ <coc:transpose-recurrence>]

Unspecified coefficients are zero. In particular every coefficient belongs to $bb(F)_2 \[ q \]$.

For each $a \, b \, c \, d in cal(B)_(frak(r))$ and $v in cal(B)$, substitution of the table and (10.1) gives

#[#set math.equation(numbering: n => "(10.2)")
 $ 0 =  & sum_(x in cal(B)) #scale(x: 120%, y: 120%)[\(] mu_(a x)^v p_(b c d)^x + mu_(a b)^x p_(x c d)^v + mu_(b c)^x p_(a x d)^v\
 & #h(35mm)  + mu_(c d)^x p_(a b x)^v + p_(a b c)^x mu_(x d)^v #scale(x: 120%, y: 120%)[\)] . $ <coc:closure-recurrence>]

This is the coefficient of $v$ in the normalized Hochschild differential. One may check it on all $18^4 = 104 thin 976$ radical four-words; precisely $15 thin 250$ have composable endpoints, and the other equations vanish by the corners. Thus the finite calculation covers the whole relative bar term, not a selected collection of words.

For completeness, the boundary identity has an equally short coefficient check. Set $epsilon.alt_a = 0$ on lower-case letters and $epsilon.alt_a = 1$ on capital letters. For every basis letter put

$ gamma_a = cases(delim: "{", q \, & a in { u \, v \, t \, E \, X \, Y \, Z \, U \, V } \,, 0 \, & upright("otherwise") .) $

For all $a \, b in cal(B)_(frak(r))$ and $v in cal(B)$, the same table gives

#[#set math.equation(numbering: n => "(10.3)")
 $ sum_(w in cal(B)_(frak(r))\
epsilon.alt_w = 0) sum_x p_(a b w)^x mu_(x \, w^(*))^v & = epsilon.alt_b gamma_a mu_(a b)^v \,\
sum_(w in cal(B)_(frak(r))\
epsilon.alt_w = 1) sum_x p_(a b w)^x mu_(x \, w^(*))^v & = #scale(x: 120%, y: 120%)[\(] gamma_b + gamma_v + \( 1 - epsilon.alt_b \) gamma_a #scale(x: 120%, y: 120%)[\)] mu_(a b)^v . $ <coc:boundary-constant>]

There are $18^2 = 324$ input pairs. These two equations are the constant and linear coefficients in $H$ of (4.6): its left side gives $H^(epsilon.alt_w)$, while the three terms on the right give respectively $H gamma_b mu_(a b)^v$, $H gamma_v mu_(a b)^v$, and $H^(1 - epsilon.alt_b) gamma_a mu_(a b)^v$. This verifies the identity for an indeterminate $H$, hence for either $H_1$ or $H_2$.

All these substitutions are polynomial identities in characteristic two. They require no specialization of $q$ or $H$. Finally the entries $p \( t \, x \, J \) = 0$ and $p \( t \, y \, J \) = q^3 f$ give

$ q^2 p \( t \, x \, J \) + p \( t \, y \, J \) = q^3 f \, $

which is the nonzero value on the explicit cycle (4.7).


#bibliography("refs.bib", style: "ieee", title: [References])
