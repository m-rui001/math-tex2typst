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

#align(center)[#text(size: 16pt, weight: "bold")[An algebra of infinite little finitistic dimension]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite-dimensional algebra $A$ over a field $k$, its #emph[little finitistic dimension] is

$ "fin.dim" A = sup { "pd"_A N : N upright(" is a finitely generated left ") A upright("-module") \, med "pd"_A N < oo } . $

The little finitistic-dimension conjecture asserts that this number is finite for every such algebra. Thus it asks for a bound on the lengths of the finite projective resolutions over each fixed algebra, while allowing other modules to have infinite projective dimension. The finitistic-dimension questions were publicized by Bass in 1960 #cite(label("Bass1960")). The #emph[big] finitistic dimension $"Fin.dim" A$ is defined by allowing all left modules in the same supremum; the little dimension is at most the big one.

This paper gives a negative resolution of the little finitistic-dimension conjecture.

#thm([Theorem 1.1.])[
  #emph[There is a finite-dimensional unital complex algebra $A$ such that, for every integer $m gt.eq 1$, there is a finite-dimensional left $A$-module $N_m$ with 
$ 2 m - 2 lt.eq "pd"_A N_m < oo . $

 In particular, $"fin.dim" A = oo$.]
] <thm:main>

The algebra in 1 is fixed before $m$ varies. Consequently its finitely generated modules admit terminating projective resolutions of unbounded lengths. This also makes its big finitistic dimension infinite and refutes the corresponding universal finiteness assertion for Artin algebras, since a finite-dimensional complex algebra is an Artin algebra.

Independently, the companion #cite(label("OpenAITachikawa2026")) Corollary 1.3 obtains finite-dimensional opposite endomorphism algebras $Gamma_K$ of infinite little and big left finitistic dimensions for every field extension $K \/ k$, where $k = bb(F)_2 \( q \, H_1 \, H_2 \)$, using successive cokernels in a projective-injective resolution. This is a distinct characteristic-two example; the algebra in Theorem 1 remains the complex example constructed here.

=== 1.1 Background and consequences <background-and-consequences>

The equality of the little and big finitistic dimensions is a different question from their finiteness. Huisgen-Zimmermann disproved that equality: for every integer $n gt.eq 2$, she constructed a finite-dimensional monomial algebra with little finitistic dimension $n$ and big finitistic dimension $n + 1$ #cite(label("HuisgenZimmermann1992")). Those examples have finite finitistic dimensions and vary with $n$; they do not give unbounded finite projective dimensions over a single algebra. Her survey #cite(label("HuisgenZimmermann1995")) describes the development of the two questions.

Important positive cases for little finitistic finiteness include finite-dimensional monomial algebras, by Green, Kirkman, and Kuzmanovich #cite(label("GreenKirkmanKuzmanovich1991")), and Artin algebras with radical cube zero, by Green and Huisgen-Zimmermann #cite(label("GreenHuisgenZimmermann1991")). Igusa and Todorov introduced numerical invariants of syzygies that give another proof of the radical-cube-zero case and establish little finiteness for Artin algebras of representation dimension at most three #cite(label("IgusaTodorov2005")) Corollaries 7 and 9. More recently, Cummings proved that universal little finitistic finiteness is equivalent to the assertion that, for every finite-dimensional algebra, finiteness holds on the left if and only if it holds on the right #cite(label("Cummings2024")) Theorem A. These results address bounds within classes or reductions between finiteness assertions. Our construction instead preserves arbitrarily long terminating processes while keeping all defining algebra data fixed.

There is also a derived-category consequence. Say that injective left modules #emph[generate] if the smallest triangulated subcategory of the unbounded derived category of all left modules that contains them and is closed under arbitrary coproducts is the whole category. Rickard proved that injective generation implies finite big finitistic dimension #cite(label("Rickard2019")) Theorem 4.3. Thus injective left $A$-modules do not generate for the algebra of 1: its big left finitistic dimension is infinite. This applies Rickard’s theorem to $A^(upright("op"))$, matching his right-module convention.

Combining this example with Cummings’ auxiliary triangular algebra gives an extreme left–right asymmetry for both dimensions and for injective generation.

#thm([Corollary 1.2.])[
  (Extreme left–right asymmetry).  #emph[There is a finite-dimensional unital complex algebra $Lambda$ such that 
$ "fin.dim" Lambda = "Fin.dim" Lambda = oo \, #h(2em) "fin.dim" \( Lambda^(upright("op")) \) = "Fin.dim" \( Lambda^(upright("op")) \) = 0 . $

 All four dimensions here use left modules. Thus the little and big finitistic dimensions of $Lambda$ are infinite on the left and zero on the right. Injective left $Lambda$-modules do not generate the unbounded derived category of all left $Lambda$-modules, whereas injective right $Lambda$-modules generate the unbounded derived category of all right $Lambda$-modules.]
] <cor:left-right-asymmetry>

The algebra $Lambda$ is auxiliary: the corollary makes no assertion about the right finitistic dimensions or right injective generation of the original algebra $A$. Passing from $Lambda$ to $Lambda^(upright("op"))$ reverses the two sides of the corollary. We give the proof in 6.4, after constructing $A$.

=== 1.2 The construction and its principal mechanisms <the-construction-and-its-principal-mechanisms>

The proof connects a finite presentation with a derived tensor process and then with ordinary projective resolutions. We describe the three stages, including the points at which compatibility of the constructions is needed.

First, 3 constructs one finitely presented complex algebra $R$, a central idempotent $e$, and an automorphism $alpha$. The functor

$ H \( Y \) = zws_alpha \( e Y \) $

selects the direct summand $e Y$ and restricts its action along $alpha$. It admits finite-dimensional modules $Y_m$ that survive exactly $m - 1$ iterations and vanish on the $m$th. The algebra $R$ is a group algebra. In the underlying group, an automorphism shifts an indexed family of central involutions; finite matrix quotients detect arbitrarily long independent segments of that family. Prescribing their characters gives the modules $Y_m$. The group is motivated by matrix groups of Abels type #cite(label("Rego2022")); its finite presentation, centrality relations, quotients, and representations are established here.

The second stage realizes this selection process over a finite-dimensional algebra. A quadratic presentation of $R$ gives a directed algebra $B$ with three vertices and $"gl.dim" B lt.eq 2$, together with modules $M \( Y \)$. The module $M \( Y \)$ places the vector space $Y$ at each vertex and records the generator actions along the arrows. The encoding follows the homogenization principle used in universal localization #cite(label("NRS2004")). The principal realization statement, 11, constructs a fixed bounded $B$-bimodule complex $P$, projective term by term on the right, for which

$ P ⊗_B^(upright(bold(L))) M \( Y \) tilde.eq M \( H \( Y \) \) xor M \( H \( Y \) \) \[ 3 \] $

for every finite-dimensional $R$-module $Y$.

The principal obstacle is to make this realization uniform in $Y$. Inverting the two distinguished arrows of $B$ makes the presentation of $R$ act on a localized category of complexes. The summand selected by $e$ need not lift by itself; two mapping cones represent its direct sum with a copy shifted by three inside that localized category (8). We then clear denominators for one finite diagram, before choosing any test module (9). Its relations initially hold only up to chain homotopy. A three-column differential incorporates those homotopies into an actual bimodule complex (12). There are no paths of length three, so no further relation overlaps require higher compatibility data. Finally, the gap between the two surviving cohomological degrees exceeds the global-dimension bound on $B$, so the complex splits as displayed. These steps realize selection by a single tensor functor over $B$.

The third stage turns this bounded complex into an ordinary bimodule. A directed radical-square-zero chain records the terms and differential of $P$. With a suitable product algebra $D$ of finite global dimension and an ordinary $D$-bimodule $X$, the second iterate of $F = X ⊗_D^(upright(bold(L))) -$ is isomorphic, on the $B$-factor of $D$, to $P ⊗_B^(upright(bold(L))) -$ up to a fixed shift (15). We then take

$ A = D times.l X . $

For a $D$-module $N$ inflated to $A$, the absolute bar construction decomposes by the number of occurrences of $X$:

$ D ⊗_A^(upright(bold(L))) N tilde.eq xor.big_(r gt.eq 0) \( F^r N \) \[ r \] . $

16 proves this decomposition with derived tensor powers, including the nonflat case. This splitting is also a consequence of Minamoto and Yamaura’s graded-component decomposition for trivial extensions #cite(label("MinamotoYamaura")) Lemma 4.13(4) and the proof of Theorem 4.17. Their projective-dimension formula gives a stronger form of the final transfer. We prove the required splitting directly by the bar construction and give the minimal-resolution argument used here. Eventual vanishing of $F^r N$ yields finite projective dimension, while a nonzero $r$th iterate forces projective dimension at least $r$. For $N_m = M \( Y_m \)$, the two-step simulation of selection gives $F^(2 m) N_m tilde.eq 0$ and $F^(2 m - 2) N_m tilde.eq.not 0$. These yield the finiteness and lower bound in 1, respectively.

11 applies to any finitely presented $k$-algebra with a central idempotent and a unital endomorphism. Readers interested in the homological constructions may begin with 3 and use 3 as input; 2 supplies the unbounded extinction times needed for the final counterexample.

In the proof order, 2 supplies the selection modules; 3 constructs the fixed lifted diagram; and 4 produces and identifies its bimodule complex. 5 makes the bimodule ordinary, and 6 turns its iterates into projective-dimension bounds.

=== 1.3 Conventions <conventions>

All algebras are associative and unital. Modules are left modules unless expressly designated right; over a finite-dimensional $k$-algebra, finite dimensionality and finite generation are equivalent. Tensor products carrying a superscript $upright(bold(L))$ are derived tensor products. Complexes have cohomological grading, with

$ K \[ s \]^n = K^(n + s) \, #h(2em) d_(K \[ s \])^n = \( - 1 \)^s d_K^(n + s) . $

In particular, a module shifted by $s$ has its cohomology in degree $- s$. Products of paths and endomorphisms are written in order of composition, from right to left. An isomorphism denoted $tilde.eq$ is taken in the derived category under discussion. Splittings used to iterate a tensor functor are needed only for individual objects; no natural choice of those splittings is asserted.

== 2 A selection process with unbounded extinction <sec:selection>

Let $R$ be a unital $k$-algebra, let $e in R$ be a central idempotent, and let $alpha : R arrow.r R$ be a unital endomorphism. For a left $R$-module $Y$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ H \( Y \) = zws_alpha \( e Y \) . $ <eq:selection-functor>]

Here $e Y$ is an $R$-submodule, and the subscript denotes restriction of scalars along $alpha$: on the vector space $e Y$, an element $r in R$ acts by the original operator $alpha \( r \)$. This construction defines an additive functor on left $R$-modules and preserves finite dimensionality. We write $H^(compose j)$ for its $j$-fold iterate, with $H^(compose 0)$ the identity functor; superscripts without a circle on $H$ will denote cohomology of a complex.

#thm([Proposition 2.1.])[
  #emph[There exist a finitely presented unital complex algebra $R$, a central idempotent $e in R$, and an automorphism $alpha$ of $R$ such that, for every integer $m gt.eq 1$, a finite-dimensional left $R$-module $Y_m$ satisfies 
#[#set math.equation(numbering: n => "(2.2)")
 $ H^(compose j) \( Y_m \) eq.not 0 quad \( 0 lt.eq j < m \) \, #h(2em) H^(compose m) \( Y_m \) = 0 . $ <eq:extinction>]

 The algebra, idempotent, and automorphism are independent of $m$.]
] <prop:selection>

We shall take $R = bb(C) G$, where $G$ is a finitely presented group with central involutions $z_N$ indexed by $N in bb(Z)$. An automorphism shifting this family will give $alpha$, and we shall take $e = \( 1 + z_0 \) \/ 2$.

The auxiliary group used below is motivated by finitely presented matrix groups of Abels type. In particular, the commutator transfer and centrality argument below parallels the proof of Proposition 4.9, equations (4.9)–(4.10), in #cite(label("Rego2022")). Our presentation and the finite quotients used for selection are specified here, and all required properties are proved directly.

=== 2.1 The group and its finite presentation <the-group-and-its-finite-presentation>

Write $\[ x \, y \] = x y x^(- 1) y^(- 1)$ and let $I = { 1 \, 2 \, 3 }$. Define a group $G$ with commuting generators $T_ell$, $ell in I$, and generators

$ U_i \( r \) \, #h(2em) V_i \( r \) \, #h(2em) W_(i j) \( r \) quad \( i \, j in I \, med i eq.not j \, med r in bb(Z) \) . $

Each generator type $S$ has a weight $lambda_S in bb(Z)^3$, given by

#[#set math.equation(numbering: n => "(2.3)")
 $ lambda_(U_i) = - epsilon_i \, #h(2em) lambda_(V_i) = epsilon_i \, #h(2em) lambda_(W_(i j)) = epsilon_i - epsilon_j \, $ <eq:group-weights>]

where $epsilon_1 \, epsilon_2 \, epsilon_3$ is the standard basis. Impose the conjugation rules

#[#set math.equation(numbering: n => "(2.4)")
 $ T_ell S \( r \) T_ell^(- 1) = S \( r + lambda_(S \, ell) \) . $ <eq:group-conjugation>]

The remaining relations, with all arguments ranging independently over $bb(Z)$, are

+ $U_i \( r \)^2 = 1$;
+ generators of types $U_i \, U_j$, of types $V_i \, V_j$, and of types $U_i \, V_j$ commute whenever $i eq.not j$;
+ $W_(i j)$ commutes with $U_h$ for $h eq.not i$ and with $V_h$ for $h eq.not j$;
+ for $i eq.not j$,
  #[#set math.equation(numbering: n => "(2.5)")
   $ \[ U_i \( r \) \, W_(i j) \( s \) \] = U_j \( r + s \) \, #h(2em) \[ W_(i j) \( s \) \, V_j \( r \) \] = V_i \( s + r \) . $ <eq:group-commutator-relations>]

#thm([Lemma 2.2.])[
  #emph[The group $G$ is finitely presented.]
] <lem:group-finite-presentation>

#proof[
  For $n = \( n_1 \, n_2 \, n_3 \) in bb(Z)^3$, put $T^n = T_1^(n_1) T_2^(n_2) T_3^(n_3)$ and regard a weight as the map $lambda_S \( n \) = sum_ell lambda_(S \, ell) n_ell$. Retain only the fifteen generators
  $ T_ell \, quad u_i = U_i \( 0 \) \, quad v_i = V_i \( 0 \) \, quad w_(i j) = W_(i j) \( 0 \) quad \( i eq.not j \) . $
  Besides commutation of the $T_ell$, require the following finite set of centralizer relations. Each of $u_i \, v_i$ commutes with $T_h$ for $h eq.not i$, and $w_(i j)$ commutes with $T_i T_j$ and with $T_h$ for the unique $h in.not { i \, j }$. These are precisely centralization by a basis of each kernel lattice:
  $ ker lambda_(U_i) = ker lambda_(V_i) & = xor.big_(h eq.not i) bb(Z) epsilon_h \,\
ker lambda_(W_(i j)) & = bb(Z) \( epsilon_i + epsilon_j \) xor bb(Z) epsilon_h quad \( h in.not { i \, j } \) . $
  Since the $T_ell$ commute, the kernel lattice also centralizes every $T$-conjugate of its argument-zero generator. Thus one may define
  #[#set math.equation(numbering: n => "(2.6)")
   $ U_i \( r \) & = T_i^(- r) u_i T_i^r \, & V_i \( r \) & = T_i^r v_i T_i^(- r) \, & W_(i j) \( r \) & = T_i^r w_(i j) T_i^(- r) . $ <eq:group-finite-generators>]
  Equivalently, $S \( r \) = T^n S \( 0 \) T^(- n)$ for any $n$ with $lambda_S \( n \) = r$. The kernel relations make this independent of the choice of $n$ and imply all of (2.4).
  It remains to impose the argument-zero instance of each of the remaining relation patterns. For every pair of input types actually occurring in those patterns, the two weights give a surjection $bb(Z)^3 arrow.r bb(Z)^2$. The following table supplies integral preimages of an arbitrary pair $\( r \, s \)$; unmentioned coordinates are zero.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Input types
], table.cell(rowspan: 1, colspan: 1)[Index condition
], table.cell(rowspan: 1, colspan: 1)[Coordinates of $n$
]),
  table.cell(rowspan: 1, colspan: 1)[$U_i \, U_j$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_i = - r \, med n_j = - s$
],
  table.cell(rowspan: 1, colspan: 1)[$V_i \, V_j$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_i = r \, med n_j = s$
],
  table.cell(rowspan: 1, colspan: 1)[$U_i \, V_j$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_i = - r \, med n_j = s$
],
  table.cell(rowspan: 1, colspan: 1)[$W_(i j) \, U_j$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_j = - s \, med n_i = r - s$
],
  table.cell(rowspan: 1, colspan: 1)[$W_(i j) \, U_h$
], table.cell(rowspan: 1, colspan: 1)[$h in.not { i \, j }$
], table.cell(rowspan: 1, colspan: 1)[$n_i = r \, med n_j = 0 \, med n_h = - s$
],
  table.cell(rowspan: 1, colspan: 1)[$W_(i j) \, V_i$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_i = s \, med n_j = s - r$
],
  table.cell(rowspan: 1, colspan: 1)[$W_(i j) \, V_h$
], table.cell(rowspan: 1, colspan: 1)[$h in.not { i \, j }$
], table.cell(rowspan: 1, colspan: 1)[$n_i = r \, med n_j = 0 \, med n_h = s$
],
  table.cell(rowspan: 1, colspan: 1)[$U_i \, W_(i j)$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_i = - r \, med n_j = - r - s$
],
  table.cell(rowspan: 1, colspan: 1)[$W_(i j) \, V_j$
], table.cell(rowspan: 1, colspan: 1)[$i eq.not j$
], table.cell(rowspan: 1, colspan: 1)[$n_j = s \, med n_i = r + s$
],
)
]
  Conjugating a zero-argument commutation relation by the corresponding $T^n$ therefore gives every required instance. For the two relations in (2.5), the output weight is the sum of the input weights:
  $ - epsilon_i + \( epsilon_i - epsilon_j \) = - epsilon_j \, #h(2em) \( epsilon_i - epsilon_j \) + epsilon_j = epsilon_i . $
  Hence the same conjugation also gives the correct output argument $r + s$. The square relation propagates from argument zero because each individual weight is surjective onto $bb(Z)$.
  We have obtained all the defining relations from finitely many relators on fifteen generators. Conversely, the chosen kernel centralizers and zero-argument relators hold in the original presentation by (2.4). The two presentations are therefore equivalent. ◻
]

=== 2.2 Central involutions and an automorphism <central-involutions-and-an-automorphism>

The finite presentation is now fixed. We next identify central involutions that the automorphism will shift; their independent images in finite quotients will let us prescribe the extinction time.

#thm([Lemma 2.3.])[
  #emph[For each $N in bb(Z)$, the expression 
#[#set math.equation(numbering: n => "(2.7)")
 $ z_N = \[ U_i \( a \) \, V_i \( b \) \] \, #h(2em) a + b = N \, $ <eq:central-involutions>]

 is independent of $i \, a \, b$. Each $z_N$ is central and satisfies $z_N^2 = 1$. There is an automorphism $alpha_G$ of $G$ fixing all $T_ell \, V_i \( r \) \, W_(i j) \( r \)$ and sending $U_i \( r \)$ to $U_i \( r + 1 \)$; it satisfies $alpha_G \( z_N \) = z_(N + 1)$.]
] <lem:central-shift>

#proof[
  Fix distinct $i \, j$ and integers $r \, q \, s$, and set
  $ x = U_i \( r \) \, quad y = W_(i j) \( q \) \, quad v = V_j \( s \) \, #h(2em) u = \[ x \, y \] = U_j \( r + q \) \, quad w = \[ y \, v \] = V_i \( q + s \) . $
  The defining commutations give $\[ x \, v \] = \[ w \, u \] = \[ w \, v \] = 1$. Using $x y = u y x$ and $y v = w v y$, reorder $x y v$ in the two ways
  $ x y v = u w v y x = \( x w x^(- 1) \) v u y x . $
  With $c = \[ x \, w \]$, cancellation gives $u w v = c w v u$, and consequently
  $ c = u w v u^(- 1) v^(- 1) w^(- 1) = u v u^(- 1) v^(- 1) = \[ u \, v \] . $
  The last equality uses only the commutation of $w$ with $u$ and $v$. We have proved
  #[#set math.equation(numbering: n => "(2.8)")
   $ \[ U_i \( r \) \, V_i \( q + s \) \] = \[ U_j \( r + q \) \, V_j \( s \) \] . $ <eq:commutator-transfer>]
  Given $a + b = c + d = N$ at distinct internal indices, choose $r = a$, $s = d$, and $q = c - a = b - d$ in (2.8). This compares the two expressions in (2.7). Two splittings at the same internal index can be compared through another index, proving the claimed independence.
  To show that $z_N$ commutes with $U_h \( r \)$ or $V_h \( r \)$, express $z_N$ using an index $i eq.not h$. Both factors of that commutator commute with the tested generator. To commute with $W_(h j) \( r \)$, use the index outside ${ h \, j }$, so that again both factors commute with it. Finally, conjugation by $T_ell$ changes the arguments $\( a \, b \)$ in (2.7) to $\( a - delta_(ell i) \, b + delta_(ell i) \)$. Their sum is unchanged, so the splitting independence proves invariance under $T_ell$. Thus $z_N$ is central. Since $U_i \( a \)^2 = 1$, centrality also gives
  $ 1 = \[ U_i \( a \)^2 \, V_i \( b \) \] = \[ U_i \( a \) \, V_i \( b \) \]^2 = z_N^2 . $
  Translation of every $U$-argument by $1$ preserves the conjugation, square, and commutation relations. The first relation in (2.5) becomes
  $ \[ U_i \( r + 1 \) \, W_(i j) \( s \) \] = U_j \( r + s + 1 \) \, $
  which is another defining instance; the second relation is unchanged. This defines an endomorphism $alpha_G$. Translation by $- 1$ preserves the relations for the same reason and is its two-sided inverse. Formula (2.7) then gives $alpha_G \( z_N \) = z_(N + 1)$. ◻
]

=== 2.3 Finite quotients detecting independent involutions <finite-quotients-detecting-independent-involutions>

#thm([Lemma 2.4.])[
  #emph[For every $m gt.eq 1$, there is a finite quotient $F_m$ of $G$ in which the images of $z_0 \, dots.h \, z_(m - 1)$ generate a central subgroup isomorphic to $\( bb(Z) \/ 2 bb(Z) \)^m$.]
] <lem:finite-central-quotients>

#proof[
  Let $S_m = bb(F)_2 \[ t \] \/ \( t^m - 1 \)$. This ring is finite, and $t$ is a unit with inverse $t^(m - 1)$, so $t^r$ is defined for every $r in bb(Z)$. Use matrices indexed by $0 \, 1 \, 2 \, 3 \, 4$. Send $T_ell$ to the diagonal matrix with $t$ in position $ell$ and $1$ elsewhere, and set
  #[#set math.equation(numbering: n => "(2.9)")
   $ U_i \( r \) & mapsto I_5 + t^r E_(0 i) \, & V_i \( r \) & mapsto I_5 + t^r E_(i 4) \, & W_(i j) \( r \) & mapsto I_5 + t^r E_(i j) . $ <eq:finite-matrix-images>]
  Here $E_(a b)$ denotes a matrix unit. Every displayed elementary matrix is invertible, with itself as inverse: its off-diagonal matrix unit has square zero, and the coefficient ring has characteristic two.
  We check the relations. Diagonal conjugation multiplies $E_(a b)$ by the ratio of the diagonal entries at $a$ and $b$, which gives exactly (2.3). The identity $E_(a b) E_(c d) = delta_(b c) E_(a d)$ shows that all products in both orders vanish for each required commuting pair: two units $E_(0 i)$, two units $E_(i 4)$, the pair $E_(0 i) \, E_(j 4)$ for $i eq.not j$, the pair $E_(i j) \, E_(0 h)$ for $h eq.not i$, and the pair $E_(i j) \, E_(h 4)$ for $h eq.not j$. The required square relations hold by the same square-zero calculation. For $i eq.not j$, the nonzero product in the first noncommutation relation is $E_(0 i) E_(i j) = E_(0 j)$, and in the second it is $E_(i j) E_(j 4) = E_(i 4)$. The higher products vanish, giving
  $ \[ I_5 + t^r E_(0 i) \, I_5 + t^s E_(i j) \] & = I_5 + t^(r + s) E_(0 j) \,\
 & = I_5 + t^(s + r) E_(i 4) . $
  Thus (2.9) defines a homomorphism from $G$ into the finite group $"GL"_5 \( S_m \)$. Let $F_m$ be its image.
  The image of $z_N$ is $I_5 + t^N E_04$. It is central in $F_m$: the unit $E_04$ has zero product in both orders with every off-diagonal unit in (2.9), and the diagonal matrices have entry $1$ at both $0$ and $4$. For $c_0 \, dots.h \, c_(m - 1) in { 0 \, 1 }$,
  $ product_(q = 0)^(m - 1) \( I_5 + t^q E_04 \)^(c_q) = I_5 + (sum_(q = 0)^(m - 1) c_q t^q) E_04 . $
  The classes $1 \, t \, dots.h \, t^(m - 1)$ are an $bb(F)_2$-basis of $S_m$, because the defining polynomial is monic of degree $m$. Thus this product is the identity only when all $c_q$ are zero. This argument also applies when $m$ is even and $S_m$ is nonreduced. The claimed independence and orders follow. ◻
]

=== 2.4 The algebra and its test modules <the-algebra-and-its-test-modules>

The quotient in 6 supplies the independent signs. We pass to the group algebra and choose the signs so that each selection before the last is the identity, while the last is zero.

#proof[
  Take $R = bb(C) G$. A finite group presentation yields a finite presentation of its unital group algebra: for each group generator adjoin a formal inverse and the two inverse equations, and impose the finitely many group relators as algebra relations. Hence $R$ is finitely presented by 4. Extend $alpha_G$ linearly to an algebra automorphism $alpha$ and put
  $ e = frac(1 + z_0, 2) . $
  By 5, this is a central idempotent. For $q gt.eq 0$, write
  $ e_q = alpha^q \( e \) = frac(1 + z_q, 2) . $
  These are commuting central idempotents of the one fixed algebra $R$.
  For the finite quotient in 6, let $overline(z)_q$ be the image of $z_q$ and let $Z_m = chevron.l overline(z)_0 \, dots.h \, overline(z)_(m - 1) chevron.r$. Independence defines a character $chi_m : Z_m arrow.r { 1 \, - 1 }$ by
  $ chi_m \( overline(z)_q \) = cases(delim: "{", 1 \, & 0 lt.eq q < m - 1 \,, - 1 \, & q = m - 1 .) $
  In the complex regular representation of $F_m$, form
  $ p_(chi_m) = frac(1, \| Z_m \|) sum_(z in Z_m) chi_m \( z \)^(- 1) z \, #h(2em) Y_m = bb(C) \[ F_m \] p_(chi_m) . $
  The element $p_(chi_m)$ is nonzero, since its identity coefficient is $1 \/ \| Z_m \|$, and $z p_(chi_m) = chi_m \( z \) p_(chi_m)$ for $z in Z_m$. Centrality of $Z_m$ then shows that every vector of $Y_m$ has this same character. In particular, $Y_m$ is a nonzero finite-dimensional left $bb(C) \[ F_m \]$-module. Regard it as an $R$-module through the quotient map.
  For every left $R$-module $Y$, induction in the definition of $H$ gives an identification
  #[#set math.equation(numbering: n => "(2.10)")
   $ H^(compose j) \( Y \) tilde.equiv zws_(alpha^j) #scale(x: 120%, y: 120%)[\(] e_0 e_1 dots.h.c e_(j - 1) Y #scale(x: 120%, y: 120%)[\)] \, #h(2em) j gt.eq 0 \, $ <eq:selection-iterates>]
  where the empty product is $1$. Indeed, on the vector space at stage $j$, selection by $e$ acts as the original operator $alpha^j \( e \) = e_j$. Pulling the resulting action back once more along $alpha$ makes $r$ act by $alpha^(j + 1) \( r \)$, proving the inductive step. Centrality of all the $e_q$ makes the subspace in (2.10) an $R$-submodule before this pullback.
  On $Y_m$, the operators $e_0 \, dots.h \, e_(m - 2)$ are the identity and $e_(m - 1)$ is zero. Consequently (2.10) gives (2.2), also for $m = 1$. This argument does not require $alpha$ to preserve the kernel of the finite quotient: each pullback uses the same finite-dimensional vector space with its action precomposed by an automorphism of $R$. The construction of $R \, e \, alpha$ preceded the choice of $m$, as required. ◻
]

== 3 Localization and a fixed lifted diagram <sec:localization>

Let $k$ be a field, let $R$ be a finitely presented unital $k$-algebra, let $e in R$ be a central idempotent, and let $alpha : R arrow.r R$ be a unital endomorphism. As in the preceding section,

$ H \( Y \) = zws_alpha \( e Y \) $

for a left $R$-module $Y$: the underlying vector space is $e Y$, and $r in R$ acts there by $alpha \( r \)$. Centrality of $e$ ensures that this action preserves $e Y$. The construction in this section uses these fixed data and applies to every finite-dimensional $Y$.

We first encode the presentation of $R$ in a finite-dimensional directed algebra. This is a three-vertex version of the homogenized quiver construction in #cite(label("NRS2004")) Section 1, Theorem 1.1 and Proposition 1.2. We then work directly with a Verdier quotient and its evaluation functors.

=== 3.1 A quadratic presentation and its directed encoding <a-quadratic-presentation-and-its-directed-encoding>

Choose a presentation

$ R = k chevron.l x_1 \, dots.h \, x_d chevron.r \/ \( p_1 \, dots.h \, p_t \) $

in which each $p_j$ has degree at most two, allowing constant and linear terms. Such a presentation exists: in any finite presentation, introduce finitely many auxiliary generators for the successive partial products in its finitely many monomials, together with their binary-product definitions. The resulting relations have degree at most two, and eliminating the auxiliary generators recovers the original presentation.

Consider the quiver with vertices $0 \, 1 \, 2$ and arrow sets

$ cal(A)_01 = { s \, a_1 \, dots.h \, a_d } \, #h(2em) cal(A)_12 = { s' \, a'_1 \, dots.h \, a'_d } \, #h(2em) cal(A) = cal(A)_01 union.sq cal(A)_12 \, $

where the subscripts specify the source and target. Products of arrows are written in the order of composition, from right to left. Impose the relations

#[#set math.equation(numbering: n => "(3.1)")
 $ a'_h s = s' a_h quad \( 1 lt.eq h lt.eq d \) \, #h(2em) tilde(p)_j = 0 quad \( 1 lt.eq j lt.eq t \) \, $ <eq:quadratic-encoding>]

where homogenization replaces

$ x_h x_l mapsto a'_h a_l \, #h(2em) x_h mapsto s' a_h \, #h(2em) 1 mapsto s' s . $

Let $B$ be the resulting path algebra with relations, and let $upright(bold(e))_0 \, upright(bold(e))_1 \, upright(bold(e))_2$ be its vertex idempotents. Write $cal(R)$ for a fixed vector-space basis of the span of all the relations in (3.1), viewed in the free space of paths of length two. Thus each $rho in cal(R)$ has a unique expression

$ rho = sum_(a in cal(A)_01\
b in cal(A)_12) rho_(b a) thin b a . $

The basis $cal(R)$ generates the same relation ideal. There are no paths of length three, so $B$ is finite-dimensional.

The following elementary bound will also be used for other directed algebras later.

#thm([Lemma 3.1.])[
  (Directed dimension bound).  #emph[Let $Lambda$ be a finite-dimensional $k$-algebra with complete orthogonal idempotents $epsilon_0 \, dots.h \, epsilon_(n - 1)$ such that 
$ 1 = sum_(i = 0)^(n - 1) epsilon_i \, #h(2em) epsilon_i Lambda epsilon_i = k epsilon_i \, #h(2em) epsilon_j Lambda epsilon_i = 0 quad \( j < i \) . $

 Then $Lambda$ has global dimension at most $n - 1$ on both sides. In particular, the algebra $B$ above has global dimension at most two on both sides.]
] <lem:directed-bound>

#proof[
  Say that a left module $M$ is supported at indices at least $p$ if $epsilon_j M = 0$ for $j < p$. There is a projective surjection
  $ xor.big_(i = p)^(n - 1) Lambda epsilon_i ⊗_k epsilon_i M arrow.r M \, #h(2em) c ⊗ v mapsto c v . $
  The source is projective even when $M$ is not finitely generated, since each summand is a direct sum of copies of $Lambda epsilon_i$. Its components below $p$ vanish, and its component at $p$ maps isomorphically onto $epsilon_p M$: only the summand $i = p$ contributes there. Its kernel is therefore supported at indices at least $p + 1$.
  Starting with $p = 0$ and repeating this construction, the $\( n - 1 \)$st kernel is supported only at the last vertex. Every such module is projective, since $Lambda epsilon_(n - 1) = k epsilon_(n - 1)$. This gives the left dimension bound, including the case $n = 1$. The same proof for $Lambda^(upright("op"))$, with the reverse ordering of the idempotents, gives the right bound. The path directions and the homogeneous quadratic relations of $B$ give precisely the displayed hypotheses with $n = 3$. ◻
]

For a finite-dimensional left $R$-module $Y$, define $M \( Y \)$ to be the left $B$-module with $Y$ at every vertex, with $s \, s'$ acting as the identity, and with $a_h \, a'_h$ acting as $x_h$. The relations of $B$ hold because they evaluate to the defining relations of $R$.

=== 3.2 The quotient action and evaluation <the-quotient-action-and-evaluation>

Let

$ K = sans(K)^b \( "proj" upright("-") B \) \, #h(2em) E_i = upright(bold(e))_i B \, $

so $K$ is the homotopy category of bounded complexes of finitely generated projective #emph[right] $B$-modules. With our path convention, an arrow $a : i arrow.r j$ belongs to $upright(bold(e))_j B upright(bold(e))_i$. Left multiplication by $a$ is consequently a right-module map $E_i arrow.r E_j$. Composing these maps agrees with multiplying paths in the stated order.

Let $cal(S)$ be the thick subcategory of $K$ generated by the cones of $s : E_0 arrow.r E_1$ and $s' : E_1 arrow.r E_2$, and form

$ q : K arrow.r Q = K \/ cal(S) . $

We use the same notation for objects and arrows after applying $q$. The maps $s$ and $s'$ are isomorphisms in $Q$. Put $L = E_0$ and

$ overline(x)_h = s^(- 1) a_h in "End"_Q \( L \) . $

The relation $a'_h s = s' a_h$ gives $a'_h = s' a_h s^(- 1)$, whence

$ \( s' s \)^(- 1) a'_h a_l = s^(- 1) a_h s^(- 1) a_l = overline(x)_h overline(x)_l . $

Likewise $\( s' s \)^(- 1) s' a_h = overline(x)_h$ and $\( s' s \)^(- 1) s' s = "id"_L$. The homogenized relations therefore give a unital homomorphism

#[#set math.equation(numbering: n => "(3.2)")
 $ theta : R arrow.r "End"_Q \( L \) \, #h(2em) x_h mapsto overline(x)_h . $ <eq:quotient-action>]

For each finite-dimensional $Y$, tensoring defines an exact functor

$ "ev"_Y : K arrow.r sans(D)^b \( k \) \, #h(2em) T mapsto T ⊗_B M \( Y \) . $

Here $sans(D)^b \( k \)$ denotes the bounded derived category of finite-dimensional $k$-vector spaces; termwise projectivity of $T$ computes the derived tensor product. Under the natural identifications

$ E_i ⊗_B M \( Y \) tilde.equiv upright(bold(e))_i M \( Y \) = Y \, $

an arrow map evaluates to its action on $M \( Y \)$. Thus $"ev"_Y$ takes $s \, s'$ to identities and their cones to zero. The kernel of an exact functor is thick, so it contains $cal(S)$. Equivalently, every map whose cone belongs to $cal(S)$ evaluates to an isomorphism. The functor consequently factors through $Q$. We retain the notation $"ev"_Y$ for this factorization. On $L$ the homomorphism (3.2) evaluates to the given $R$-action on $Y$.

=== 3.3 An odd double of a formal summand <an-odd-double-of-a-formal-summand>

The idempotent $theta \( e \)$ evaluates to the projection of $Y$ onto $e Y$, but it need not split inside $Q$. We therefore seek an object of $Q$ whose evaluation is $e Y$ plus a shifted copy. The following lemma gives such an object for a copy shifted by three.

For an additive category $cal(T)$, its idempotent completion $"Kar" \( cal(T) \)$ has objects $\( T \, p \)$, where $p^2 = p in "End" \( T \)$, and morphisms $u : \( T \, p \) arrow.r \( T' \, p' \)$ satisfying $u = p' u p$. The embedding $T mapsto \( T \, "id"_T \)$ is fully faithful. If $cal(T)$ has a shift functor, it extends by $\( T \, p \) \[ 1 \] = \( T \[ 1 \] \, p \[ 1 \] \)$.

We need the following consequence of the triangle axioms. It is compatible with the general idempotent-completion result of Balmer and Schlichting #cite(label("BalmerSchlichting2001")) Theorem 1.5; the argument below uses only triangles already present in $cal(T)$.

#thm([Lemma 3.2.])[
  (Odd double).  #emph[Let $cal(T)$ be a triangulated category, let $L in cal(T)$, and let $epsilon.alt in "End"_(cal(T)) \( L \)$ be idempotent. Put $U = \( L \, epsilon.alt \) in "Kar" \( cal(T) \)$. Both $U xor U \[ 1 \]$ and $U xor U \[ 3 \]$ are isomorphic in $"Kar" \( cal(T) \)$ to objects of $cal(T)$.]
] <lem:odd-double>

#proof[
  First consider a triangle from $cal(T)$,
  $ A arrow.r^f B arrow.r^g T arrow.r^h A \[ 1 \] \, $
  and suppose that formal decompositions $A = I xor A_0$, $B = I xor B_0$ identify $f$ with the identity on $I$ and zero elsewhere. For any $Z in "Kar" \( cal(T) \)$, the long exact sequence $"Hom" \( Z \, - \)$ still holds for this triangle: $Z$ is a retract of an object of $cal(T)$, and its Hom sequence is a direct summand of the exact sequence for that object.
  The equalities $g f = 0$ and $f \[ 1 \] h = 0$ give factorizations
  $ g = g_0 "pr"_(B_0) \, #h(2em) h = "in"_(A_0 \[ 1 \]) h_0 . $
  Exactness gives, for every such $Z$, a short exact sequence
  #[#set math.equation(numbering: n => "(3.3)")
   $ 0 arrow.r "Hom" \( Z \, B_0 \) arrow.r^(\( g_0 \)_(*)) "Hom" \( Z \, T \) arrow.r^(\( h_0 \)_(*)) "Hom" \( Z \, A_0 \[ 1 \] \) arrow.r 0 . $ <eq:formal-cone-hom>]
  Indeed, a map into $B_0$ killed by $g_0$ factors through $f$ after inclusion into $B$, and projection back to $B_0$ makes it zero. At the other end, every map into $A_0 \[ 1 \]$ is killed by $f \[ 1 \]$ after inclusion into $A \[ 1 \]$, so it lifts through $h$. Taking $Z = A_0 \[ 1 \]$ supplies a section $sigma$ of $h_0$. It follows from (3.3) that
  $ \( g_0 \, sigma \) : B_0 xor A_0 \[ 1 \] arrow.r T $
  induces isomorphisms on $"Hom" \( Z \, - \)$ for every $Z$, hence is an isomorphism.
  Apply this calculation to a triangle on $1 - epsilon.alt : L arrow.r L$. Its identity summand is $\( L \, 1 - epsilon.alt \)$, and its zero summand on both sides is $U$. Its cone is an object $S in cal(T)$ with $S tilde.equiv U xor U \[ 1 \]$ in the completion. Under this identification, consider the map
  $ S \[ 1 \] tilde.equiv U \[ 1 \] xor U \[ 2 \] arrow.r^(mat(delim: "(", 0, 0; "id", 0)) U xor U \[ 1 \] tilde.equiv S . $
  Fullness of $cal(T) arrow.r.hook "Kar" \( cal(T) \)$ makes this a morphism between the old objects $S \[ 1 \]$ and $S$. Its cone is again in $cal(T)$. The preceding calculation, with common identity summand $U \[ 1 \]$, source complement $U \[ 2 \]$, and target complement $U$, identifies that cone with $U xor U \[ 3 \]$. ◻
]

Apply 8 in $Q$ to $epsilon.alt = theta \( e \)$ and write

$ U = \( L \, theta \( e \) \) \, #h(2em) V = U xor U \[ 3 \] . $

Fix once and for all an object $V_0 in Q$ and an isomorphism $V_0 tilde.equiv V$ in $"Kar" \( Q \)$ supplied by 8. Centrality of $e$ gives a unital action of $R$ on $U$ by

$ r mapsto theta \( e alpha \( r \) e \) in "End"_("Kar" \( Q \)) \( U \) . $

Its unit is $theta \( e \) = "id"_U$, and its products agree with those in $R$ because $e$ commutes with every $alpha \( r \)$. Use the same action on $U \[ 3 \]$ and transport the resulting action on $V$ to $V_0$.

There is now a $B$-diagram in $Q$ with $V_0$ at all three vertices: $s \, s'$ act as identities, and $a_h \, a'_h$ act by the endomorphism just defined for $x_h$. Its relations hold by the unital $R$-action. Here a #emph[$B$-diagram] in an additive $k$-linear category means objects at the three vertices and arrow maps satisfying the relations of $B$ in that category.

The category $sans(D)^b \( k \)$ splits idempotents: every bounded complex of vector spaces is isomorphic to its cohomology with zero differential, where splitting can be done degree by degree. Thus evaluation extends additively to $"Kar" \( Q \)$. It takes $U$ to $e Y$, and the preceding action of $r$ to the restriction of $alpha \( r \)$ to $e Y$. Consequently the evaluated $B$-diagram has

#[#set math.equation(numbering: n => "(3.4)")
 $ e Y xor \( e Y \) \[ 3 \] $ <eq:target-evaluation>]

at every vertex, identities on $s \, s'$, and the action of $alpha \( x_h \)$ on both summands for $a_h \, a'_h$.

=== 3.4 Clearing denominators for the finite diagram <clearing-denominators-for-the-finite-diagram>

The quotient diagram is now fixed and has the required evaluation on every $Y$. We next represent it by one diagram in the homotopy category, so that the same chain data will work under all those evaluations.

We give the lifting argument together with the fraction rules it uses. Let

$ Sigma = { u in "Mor" \( K \) : "Cone" \( u \) in cal(S) } . $

The Verdier quotient is the localization of $K$ at $Sigma$. The following triangle arguments give its right-fraction description; see also #cite(label("StacksProject")) Section 13.6. Identities belong to $Sigma$, and composition preserves $Sigma$ by the octahedral axiom. If $u : Y' arrow.r Y$ belongs to $Sigma$ and $f : X arrow.r Y$ is any map, complete $u$ to a triangle

$ Y' arrow.r^u Y arrow.r^c T arrow.r Y' \[ 1 \] \, #h(2em) T in cal(S) . $

Complete $c f$ to a triangle $X' arrow.r^v X arrow.r^(c f) T arrow.r X' \[ 1 \]$. Then $v in Sigma$, and exactness of $"Hom" \( X' \, - \)$ gives $g : X' arrow.r Y'$ with $f v = u g$. This is the required Ore square.

For the cancellation rule, suppose that $u : Y arrow.r Y'$ belongs to $Sigma$ and $u g = 0$ for $g : X arrow.r Y$. A triangle $T \[ - 1 \] arrow.r Y arrow.r^u Y' arrow.r T$ shows that $g$ factors through a map $b : X arrow.r T \[ - 1 \]$ with $T in cal(S)$. Completing $b$ to a triangle gives a denominator $v : X' arrow.r X$ with $b v = 0$, hence $g v = 0$. Applying this to differences gives the corresponding rule for equality of morphisms.

These rules construct the localization by roofs

$ X arrow.l^u X' arrow.r^f Y \, #h(2em) u in Sigma \, $

representing $q \( f \) q \( u \)^(- 1)$; equality is tested after a common source refinement. In particular, every morphism $q \( X \) arrow.r q \( Y \)$ has this form, and

#[#set math.equation(numbering: n => "(3.5)")
 $ q \( g \) = 0 quad arrow.r.double quad g v = 0 upright(" for some ") v : X' arrow.r X upright(" in ") Sigma $ <eq:zero-fraction>]

for $g : X arrow.r Y$. For the last assertion compare the roofs $\( "id"_X \, g \)$ and $\( "id"_X \, 0 \)$. Finite families can be treated with one denominator by collecting their maps into a single map to a finite direct sum of targets.

#thm([Lemma 3.3.])[
  (Finite diagram lifting).  #emph[Every $B$-diagram in $Q$ is isomorphic to the image under $q$ of a $B$-diagram in $K$.]
] <lem:diagram-lift>

#proof[
  Write the given objects as $W_i$ and its arrow maps as $t_a$. Choose $C_i in K$ and isomorphisms $psi_i : q \( C_i \) arrow.r W_i$. First collect the maps
  $ \( psi_2^(- 1) t_b psi_1 \)_(b in cal(A)_12) : q \( C_1 \) arrow.r xor.big_(b in cal(A)_12) q \( C_2 \) . $
  Represent this tuple by one roof, with denominator $u_1 : D_1 arrow.r C_1$ and numerator components $f_b : D_1 arrow.r C_2$. Set $D_2 = C_2$ and
  $ phi.alt_1 = psi_1 q \( u_1 \) \, #h(2em) phi.alt_2 = psi_2 . $
  Then $phi.alt_2 q \( f_b \) = t_b phi.alt_1$ for every $b in cal(A)_12$.
  Next collect the adjusted maps
  $ \( phi.alt_1^(- 1) t_a psi_0 \)_(a in cal(A)_01) : q \( C_0 \) arrow.r xor.big_(a in cal(A)_01) q \( D_1 \) . $
  A single roof gives a denominator $u_0 : D_0 arrow.r C_0$ and maps $f_a : D_0 arrow.r D_1$. Put $phi.alt_0 = psi_0 q \( u_0 \)$. All the arrow squares now commute:
  #[#set math.equation(numbering: n => "(3.6)")
   $ phi.alt_j q \( f_a \) = t_a phi.alt_i #h(2em) \( a : i arrow.r j \) . $ <eq:lift-arrow-squares>]
  For $rho in cal(R)$, form the morphism in $K$
  $ g_rho = sum_(b \, a) rho_(b a) f_b f_a : D_0 arrow.r D_2 . $
  The relations for $t_a$ and (3.6) give $phi.alt_2 q \( g_rho \) = 0$, so $q \( g_rho \) = 0$. Apply (3.5) to the tuple $\( g_rho \)_rho$. There is one denominator $v : D'_0 arrow.r D_0$ such that $g_rho v = 0$ in $K$ for every $rho$. Replace $D_0$ by $D'_0$, every map $f_a$ with source vertex $0$ by $f_a v$, and $phi.alt_0$ by $phi.alt_0 q \( v \)$. The arrow squares still commute, and each relation becomes
  $ sum_(b \, a) rho_(b a) f_b \( f_a v \) = g_rho v = 0 quad upright("in ") K . $
  There are no arrows into vertex zero and no longer paths requiring further compatibility. Thus the new data form a $B$-diagram in $K$, and the three $phi.alt_i$ give an isomorphism from its image to the entire prescribed diagram in $Q$. ◻
]

=== 3.5 The chain data for tensor realization <the-chain-data-for-tensor-realization>

Apply 9 to the diagram on $V_0$ constructed above. The resulting relations hold in the homotopy category. Choosing representatives converts them into a finite list of specified null-homotopies, which are the input for the next section.

#thm([Proposition 3.4.])[
  (Fixed lifted diagram).  #emph[For the fixed data $R \, e \, alpha$ and the algebra $B$ above, there are bounded complexes $D_0 \, D_1 \, D_2$ of finitely generated projective right $B$-modules, chain maps 
$ f_a : D_i arrow.r D_j #h(2em) \( a : i arrow.r j \) \, $

 and right-$B$-linear maps $h_rho : D_0 arrow.r D_2$ of degree $- 1$ for $rho in cal(R)$, such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ d_(D_2) h_rho + h_rho d_(D_0) = sum_(b \, a) rho_(b a) f_b f_a . $ <eq:relation-homotopies>]

 For every finite-dimensional left $R$-module $Y$, the diagram whose objects and arrows in $sans(D)^b \( k \)$ are 
#[#set math.equation(numbering: n => "(3.8)")
 $ D_i ⊗_B M \( Y \) \, #h(2em) f_a ⊗_B "id"_(M \( Y \)) $ <eq:evaluated-diagram>]

 is isomorphic to the diagram having $e Y xor \( e Y \) \[ 3 \]$ at all three vertices, identities on $s \, s'$, and the action of $alpha \( x_h \)$ on both summands for $a_h \, a'_h$. All the complexes, maps, and homotopies in this statement are fixed before $Y$ is chosen.]
] <prop:lifted-diagram>

#proof[
  The presentation, the quotient, the two cones, their isomorphisms in the completion, and the action on $V_0$ have all been chosen using only $R \, e \, alpha$. Apply the finite lifting construction once to this fixed diagram. Its objects lie in $K$, so choose bounded right-projective complex representatives $D_i$ and chain-map representatives $f_a$. Each relation is zero in $K$, hence its representative is null-homotopic. Choose one right-linear homotopy $h_rho$ for each of the finitely many relations. This gives (3.7).
  The isomorphisms $phi.alt_i$ from the lifting construction are fixed morphisms in $Q$ and satisfy all the fixed arrow squares (3.6). Every $"ev"_Y$ factors through this same quotient. Applying it to those squares and then to the fixed identification $V_0 tilde.equiv V$ gives the asserted isomorphism of diagrams, by (3.4). Thus the same choices work for all $Y$. ◻
]

The construction has used the homomorphism (3.2) and the evaluation functors alone. It requires neither an identification of $Q$ with a derived category of $R$ nor a stable-flatness assertion about a universal localization. The maps $f_a$ satisfy the relations up to the chosen homotopies (3.7); the next section incorporates those homotopies into an actual complex of bimodules.

== 4 Realization by a bimodule complex <sec:realization>

We retain the algebra $B$, its relation basis $cal(R)$, and the module $M \( Y \)$ from the preceding section. The fixed lifted diagram will now give a single tensor functor realizing the selection process.

#thm([Theorem 4.1.])[
  #emph[Let $k$ be a field, let $R$ be a finitely presented $k$-algebra, let $e in R$ be a central idempotent, and let $alpha : R arrow.r R$ be a unital endomorphism. Use the finite-dimensional algebra $B$ and the modules $M \( Y \)$ constructed in the preceding section, and put $H \( Y \) = zws_alpha \( e Y \)$. There is a single bounded complex $P$ of finite-dimensional $B$-bimodules, termwise projective on the right, such that for every finite-dimensional left $R$-module $Y$ one has 
#[#set math.equation(numbering: n => "(4.1)")
 $ P ⊗_B^(upright(bold(L))) M \( Y \) tilde.eq M \( H \( Y \) \) xor M \( H \( Y \) \) \[ 3 \] #h(2em) upright("in ") sans(D)^b \( B upright("-") mod \) . $ <eq:realization>]

 All choices defining $P$ are made independently of $Y$.]
] <thm:realization>

To prove the theorem, we first replace the diagram of 10 by a complex of $B$-bimodules. Homotopy actions of algebras do not admit such replacements in general: higher coherence conditions can obstruct them; see #cite(label("Keller2000")) Sections 2 and 6. Here the three-vertex shape allows us to verify the construction directly. Keller’s homotopy-corrected complexes and bar construction #cite(label("Keller2000")) Sections 3 and 7 provide the general methodological context; the finite construction below uses only the displayed relation homotopies.

#thm([Lemma 4.2.])[
  #emph[Let $D_0 \, D_1 \, D_2$ be bounded complexes of finitely generated projective right $B$-modules. Suppose that each arrow $a : i arrow.r j$ of $B$ is assigned a chain map $f_a : D_i arrow.r D_j$, and that each relation 
$ rho = sum_(b \, a) rho_(b a) thin b a in cal(R) $

 is assigned a right $B$-linear map $h_rho : D_0 arrow.r D_2$ of degree $- 1$ satisfying 
$ d_(D_2) h_rho + h_rho d_(D_0) = f_rho \, #h(2em) f_rho := sum_(b \, a) rho_(b a) f_b f_a . $

 There is a bounded complex $P$ of finite-dimensional $B$-bimodules, termwise projective as a right $B$-module, together with homotopy equivalences of right-module complexes 
$ iota_i : D_i arrow.r upright(bold(e))_i P #h(2em) \( i = 0 \, 1 \, 2 \) \, $

 such that, for every arrow $a : i arrow.r j$, the two maps $a iota_i$ and $iota_j f_a$ from $D_i$ to $upright(bold(e))_j P$ are chain homotopic.]
] <lem:rectification>

#proof[
  We construct the differential, compare its vertex complexes with the given ones, and finally compare the arrow actions. All tensor products in this construction are over $k$. Form the complexes of bimodules
  $ L'_0 & = xor.big_(i = 0)^2 B upright(bold(e))_i ⊗_k D_i \,\
L'_1 & = xor.big_(a : i arrow.r j) B upright(bold(e))_j ⊗_k D_i \,\
L'_2 & = xor.big_(rho in cal(R)) B upright(bold(e))_2 ⊗_k D_0 . $
  The left $B$-action is on the first tensor factor and the right $B$-action is on the second. Let $d_0 \, d_1 \, d_2$ denote the respective internal differentials of these three complexes.
  On the summand of $L'_1$ indexed by $a : i arrow.r j$, define
  $ p \( c ⊗ v \) = \( c a ⊗ v \)_i - \( c ⊗ f_a \( v \) \)_j . $
  Here subscripts indicate summands of $L'_0$. On the summand of $L'_2$ indexed by $rho$, define
  $ q \( c ⊗ v \) = sum_(b \, a) rho_(b a) #scale(x: 120%, y: 120%)[\(] \( c b ⊗ v \)_a + \( c ⊗ f_a \( v \) \)_b #scale(x: 120%, y: 120%)[\)] . $
  These are bimodule chain maps of degree zero. Define also the bimodule map $h : L'_2 arrow.r L'_0$ of degree $- 1$ by
  $ h \( c ⊗ v \) = \( c ⊗ h_rho \( v \) \)_2 $
  on the relation summand $rho$. Expanding the composite $p q$ gives
  $ p q \( c ⊗ v \) & = sum_(b \, a) rho_(b a) #scale(x: 120%, y: 120%)[\(] \( c b a ⊗ v \)_0 - \( c b ⊗ f_a \( v \) \)_1\
 & #h(40mm)  + \( c b ⊗ f_a \( v \) \)_1 - \( c ⊗ f_b f_a \( v \) \)_2 #scale(x: 120%, y: 120%)[\)]\
 & = - \( c ⊗ f_rho \( v \) \)_2 . $
  The last equality uses $rho = 0$ in $B$.
  Set
  $ P = L'_0 xor L'_1 \[ 1 \] xor L'_2 \[ 2 \] $
  as a graded bimodule, and equip it with the differential
  $ d_P = mat(delim: "(", d_0, p, h; 0, - d_1, q; 0, 0, d_2) . $
  For example, $P^n = \( L'_0 \)^n xor \( L'_1 \)^(n + 1) xor \( L'_2 \)^(n + 2)$, so $p \, q \, h$ each have total degree one in this matrix. The diagonal signs agree with our shift convention. Since $p$ and $q$ commute with the internal differentials, the $\( 0 \, 1 \)$ and $\( 1 \, 2 \)$ entries of $d_P^2$ vanish. Its remaining off-diagonal entry is
  $ d_0 h + p q + h d_2 = 0 \, $
  by the displayed calculation and the identity for $h_rho$. The diagonal entries vanish as well. Thus $P$ is a complex of bimodules.
  Every term $B upright(bold(e))_j ⊗_k D_i^n$, viewed as a right $B$-module, is a finite direct sum of copies of $D_i^n$. Consequently all terms of $P$ are finite dimensional and projective on the right. There are finitely many summands, and the complexes $D_i$ are bounded; hence $P$ is bounded.
  It remains to recover the given vertex complexes and arrow maps from this strict bimodule complex.
  Define
  $ iota_i \( v \) = \( upright(bold(e))_i ⊗ v \)_i in upright(bold(e))_i L'_0 subset.eq upright(bold(e))_i P . $
  This is a chain map and is split injective as a map of graded right modules. We prove that its quotient is acyclic.
  Call $j$ the #emph[source index] of a summand whose second tensor factor is $D_j$, in any of the three columns. Give $upright(bold(e))_i P$ the decreasing filtration
  $ F^r \( upright(bold(e))_i P \) = upright("the sum of its summands with source index at least ") r #h(2em) \( 0 lt.eq r lt.eq 3 \) . $
  These are subcomplexes. Indeed, the internal differentials and the path-multiplication parts of $p \, q$ preserve the source index; the $f_a$ terms increase it; and $h$ increases it from $0$ to $2$. In particular $F^0 = upright(bold(e))_i P$ and $F^3 = 0$. The quotient by $iota_i \( D_i \)$ inherits this finite filtration.
  On the associated graded, only the internal differentials and the path-multiplication parts remain. The source-$i$ part consists solely of $iota_i \( D_i \)$, since the only path from $i$ to itself is the trivial path. It disappears in the quotient. Source indices larger than $i$ give zero. If $j < i$ are adjacent vertices, the source-$j$ part is the signed total complex obtained by tensoring $D_j$ with the exact sequence
  $ 0 arrow.r k^({ a : j arrow.r i }) arrow.r^(med a mapsto a med) upright(bold(e))_i B upright(bold(e))_j arrow.r 0 . $
  There are no relations of length one, so the displayed map is an isomorphism.
  For the remaining pair $\( j \, i \) = \( 0 \, 2 \)$, that part is the signed total complex of $D_0$ tensored with
  $ 0 arrow.r k^(cal(R)) arrow.r k^({ \( b \, a \) : a : 0 arrow.r 1 \, med b : 1 arrow.r 2 }) arrow.r upright(bold(e))_2 B upright(bold(e))_0 arrow.r 0 . $
  The three nonzero horizontal terms have degrees $- 2 \, - 1 \, 0$. The first map sends the basis vector indexed by $rho$ to $sum_(b \, a) rho_(b a) \( b \, a \)$; the second sends $\( b \, a \)$ to $b a$. The first map is injective because $cal(R)$ is a basis of the relation space. Its image is the kernel of the second map: all defining relations have length two, and no path of positive length can enter vertex $0$ or leave vertex $2$. Thus the ideal they generate, in this path space, is exactly their linear span. The second map is surjective because length-two paths span $upright(bold(e))_2 B upright(bold(e))_0$.
  These exact complexes of vector spaces are split, and tensoring with a bounded complex $D_j$ gives an acyclic total complex. All associated graded pieces of the quotient are therefore acyclic. Induction through the finite filtration proves that the quotient itself is acyclic. Thus $iota_i$ is a quasi-isomorphism. Its cone is a bounded acyclic complex of projective right modules, and is contractible: starting in the largest nonzero degree, split the surjection onto its projective last term and continue downward. It follows that $iota_i$ is a homotopy equivalence.
  Finally, for $a : i arrow.r j$ define a right-linear map of degree $- 1$
  $ H_a : D_i arrow.r upright(bold(e))_j P \, #h(2em) H_a \( v \) = \( upright(bold(e))_j ⊗ v \)_a in upright(bold(e))_j L'_1 \[ 1 \] . $
  The internal differential on this summand is $- d_(D_i)$; its contribution cancels that of $H_a d_(D_i)$. The remaining component is $p$, giving
  $ d_P H_a + H_a d_(D_i) = a iota_i - iota_j f_a . $
  This is the required arrow homotopy. ◻
]

#prodef([Remark 4.3.])[
  The proof also isolates the reason that higher relation homotopies are unnecessary here. Every relation runs from vertex $0$ to vertex $2$, and cannot be composed with another nonidentity path. The three-column differential has only the single square condition involving $h$ that was checked above. There is no further column or relation overlap that could introduce another coherence equation.
]

#proof[
  Choose the fixed complexes $D_i$, arrow maps $f_a$, and relation homotopies $h_rho$ of 10, and apply 12. Since $P$ and the $D_i$ are bounded complexes of projective right modules, their ordinary tensor products with $M \( Y \)$ compute the derived tensor products. Moreover, tensoring preserves the homotopy equivalences $iota_i$ and their arrow homotopies. Thus the vertex diagram of
  $ T_Y := P ⊗_B^(upright(bold(L))) M \( Y \) $
  in the derived category of $k$-vector spaces is isomorphic to the evaluated diagram of 10.
  At each vertex this diagram is $e Y xor e Y \[ 3 \]$. The arrows $s \, s'$ act by identity maps, and $a_h \, a'_h$ act by $alpha \( x_h \)$ on each summand. Applying cohomology, with its induced arrow maps, therefore gives isomorphisms of left $B$-modules
  $ H^n \( T_Y \) tilde.equiv cases(delim: "{", M \( H \( Y \) \) \, & n = 0 \, - 3 \,, 0 \, & n eq.not 0 \, - 3 .) $
  In particular these identifications specify the full $B$-action, not just the vector spaces at the vertices.
  Write $A_(- 3) = H^(- 3) \( T_Y \)$ and $A_0 = H^0 \( T_Y \)$. The canonical truncation triangle is
  $ A_(- 3) \[ 3 \] arrow.r T_Y arrow.r A_0 arrow.r^(med delta med) A_(- 3) \[ 4 \] . $
  The connecting morphism belongs to
  $ "Hom"_(sans(D)^b \( B upright("-") mod \)) \( A_0 \, A_(- 3) \[ 4 \] \) = "Ext"_B^4 \( A_0 \, A_(- 3) \) = 0 \, $
  where the vanishing follows from the bound $"gl.dim" B lt.eq 2$ in 7. The triangle consequently splits, giving $T_Y tilde.eq A_0 xor A_(- 3) \[ 3 \]$, which is (4.1). The complexes, chain maps, and homotopies were fixed before choosing $Y$, as was the rectification constructed from them. ◻
]

#thm([Corollary 4.4.])[
  #emph[Put $Phi = P ⊗_B^(upright(bold(L))) -$. For every integer $j gt.eq 0$ and every finite-dimensional left $R$-module $Y$, there is an isomorphism 
$ Phi^j \( M \( Y \) \) tilde.eq xor.big_(q = 0)^j #scale(x: 120%, y: 120%)[\(] M \( H^(compose j) \( Y \) \) \[ 3 q \] #scale(x: 120%, y: 120%)[\)]^(xor binom(j, q)) . $

]
]

#proof[
  The case $j = 0$ is immediate. For the induction step, apply $Phi$ to an isomorphism for $j$; derived tensor preserves isomorphisms, finite direct sums, and shifts. Apply (4.1) with $H^(compose j) \( Y \)$ in place of $Y$ to each summand, and combine the two resulting multiplicities using Pascal’s identity. Each $H^(compose j) \( Y \)$ is finite dimensional. This argument uses the isomorphisms only one object at a time; no natural choice of the truncation splittings is required. ◻
]

== 5 Simulation by an ordinary bimodule <sec:ordinary-simulation>

We now construct a larger finite-dimensional algebra and an ordinary bimodule whose second derived tensor iterate recovers $P ⊗_B^(upright(bold(L))) -$, up to a fixed shift. All choices in this section depend only on the fixed complex $P$ of 11.

Choose integers $a_(*) lt.eq 0 lt.eq b_(*)$ such that $P^n = 0$ outside $\[ a_(*) \, b_(*) \]$, enlarging the interval if necessary, and put $l = b_(*) - a_(*)$. Let $C$ be the algebra of the quiver

$ 0 arrow.r^(c_1) 1 arrow.r^(c_2) dots.h.c arrow.r^(c_l) l $

modulo all paths of length two. Write $epsilon_i$ for its vertex idempotents, and let $W$ be the simple #emph[right] $C$-module at vertex $l$. There is a projective resolution of right $C$-modules

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 arrow.r epsilon_0 C arrow.r^(c_1 dot.op) epsilon_1 C arrow.r^(c_2 dot.op) dots.h.c arrow.r^(c_l dot.op) epsilon_l C arrow.r W arrow.r 0 . $ <eq:right-chain-resolution>]

Indeed, for $i > 0$, the right projective $epsilon_i C$ has basis $epsilon_i \, c_i$, and its radical is the right simple at $i - 1$. Left multiplication by $c_i$ maps $epsilon_(i - 1)$ to $c_i$ and, when $i > 1$, maps $c_(i - 1)$ to zero. This proves exactness, including injectivity at the first term. For $l = 0$, the resolution consists of the isomorphism $epsilon_0 C arrow.r W$.

Define a $\( B ⊗_k C \, B \)$-bimodule $O$ by

$ epsilon_i O = P^(a_(*) + i) \, #h(2em) c_i \|_(epsilon_(i - 1) O) = d_P^(a_(*) + i - 1) . $

Here the two $B$-actions are those on the terms of $P$. The relation $d_P^2 = 0$ makes this a representation of $C$, and the bimodule linearity of $d_P$ makes the $C$-action commute with both $B$-actions. Thus $O$ is an ordinary finite-dimensional bimodule. Set

$ D = B times \( B ⊗_k C \) \, #h(2em) T = B ⊗_k W \, #h(2em) X = O xor T . $

Regard $O$ as having its left action from the second factor of $D$ and its right action from the first. Regard $T$ as having its left action from the first factor and its right action from the second, with the regular $B$-actions on its $B$-factor. These prescriptions define an ordinary finite-dimensional $D$-bimodule $X$.

The two summands of $X$ move complexes between the factors of $D$, as shown in 1. Thus two tensor steps return to the first factor; the next proposition identifies their composite.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$sans(D)^b \( B upright("-") mod \)$])
  content((4.433, 0), [$sans(D)^b \( \( B ⊗_k C \) upright("-") mod \)$])
  bezier((1.062, 0), (2.909, 0), (1.73, 0.2699), (2.241, 0.2699), mark: (end: ">"))
  content((1.986, 0.4291), [#text(size: 0.73em)[$O ⊗_B^(upright(bold(L))) -$]])
  bezier((2.909, 0), (1.062, 0), (2.241, -0.2699), (1.73, -0.2699), mark: (end: ">"))
  content((1.986, -0.4291), [#text(size: 0.73em)[$T ⊗_(B ⊗_k C)^(upright(bold(L))) -$]])
})],
  caption: [Figure 1: The two factors of $D$ and the tensor functors supplied by the off-diagonal summands of $X$. Starting on the left, the composite is $P \[ b_(*) \] ⊗_B^(upright(bold(L))) -$ by 15. ],
) <fig:simulation>

#thm([Proposition 5.1.])[
  #emph[The algebra $D$ has finite global dimension on both sides. Let $F = X ⊗_D^(upright(bold(L))) -$. For every complex $Z$ of left $B$-modules, regarded as a complex on the first factor of $D$, there is an isomorphism 
#[#set math.equation(numbering: n => "(5.2)")
 $ F^2 \( Z \) tilde.eq P \[ b_(*) \] ⊗_B^(upright(bold(L))) Z \, #h(2em) T ⊗_(B ⊗_k C)^(upright(bold(L))) O tilde.eq P \[ b_(*) \] . $ <eq:compression>]

 The second isomorphism is an isomorphism of complexes of $B$-bimodules, and the first is supported on the first factor of $D$.]
] <prop:ordinary-simulation>

#proof[
  The vertices of $B ⊗_k C$ are pairs $\( i \, j \)$, where $0 lt.eq i lt.eq 2$ and $0 lt.eq j lt.eq l$. Its diagonal vertex corners are $k$. A nonzero component between distinct vertices moves in the product of the two directed orders. Choosing a linear extension of that product order permits an application of 7, on both sides. In particular,
  $ "gl.dim" \( B ⊗_k C \) lt.eq 3 \( l + 1 \) - 1 \, #h(2em) "gl.dim" #scale(x: 120%, y: 120%)[\(] \( B ⊗_k C \)^(upright("op")) #scale(x: 120%, y: 120%)[\)] lt.eq 3 \( l + 1 \) - 1 . $
  7 also gives the bound $2$ for $B$ and $B^(upright("op"))$. Modules over a finite product split according to its factors, so
  $ "gl.dim" D \, med "gl.dim" D^(upright("op")) lt.eq 3 l + 2 . $
  Tensor (5.1) over $k$ with the regular $B$-bimodule, placing its last projective term in degree zero. This gives a bounded resolution $Q_T arrow.r T$ by right $B ⊗_k C$-projectives, preserving the left $B$-action. Also, $O$ is projective as a right $B$-module, being the finite direct sum of the terms of $P$. Thus $Q_X = O xor Q_T$, with the prescribed block actions, is a bounded right-$D$-projective resolution of $X$ retaining its left $D$-action. Ordinary tensor with $Q_X$ computes $F$ on every complex. On the first factor, the block supports therefore give
  $ F^2 \( Z \) tilde.eq Q_T ⊗_(B ⊗_k C) \( O ⊗_B Z \) tilde.equiv #scale(x: 120%, y: 120%)[\(] Q_T ⊗_(B ⊗_k C) O #scale(x: 120%, y: 120%)[\)] ⊗_B Z . $
  In degree $n$, for $- l lt.eq n lt.eq 0$, tensoring $Q_T$ with $O$ gives
  $ #scale(x: 120%, y: 120%)[\(] B ⊗_k epsilon_(l + n) C #scale(x: 120%, y: 120%)[\)] ⊗_(B ⊗_k C) O tilde.equiv epsilon_(l + n) O = P^(a_(*) + l + n) = P^(b_(*) + n) . $
  The induced differential is $d_P$. In comparison, the standard differential of $P \[ b_(*) \]$ is $\( - 1 \)^(b_(*)) d_P$. Multiplication by $\( - 1 \)^(b_(*) n)$ in degree $n$ defines a chain isomorphism to $P \[ b_(*) \]$; it respects both $B$-actions. Since this complex is termwise right-$B$-projective, its ordinary tensor with any $Z$ computes the derived tensor. This proves the second isomorphism in (5.2), and hence the first. ◻
]

== 6 A square-zero extension and projective dimension <sec:square-zero>

We first establish the homological statement for an arbitrary split square-zero extension over a field. Its derived tensor powers cannot in general be replaced by ordinary tensor powers. The decomposition below will let us prove two separate facts: eventual extinction gives a finite projective resolution, while survival of the $r$th iterate rules out any projective resolution of length less than $r$.

=== 6.1 The derived bar decomposition <the-derived-bar-decomposition>

The splitting below also follows from the graded-component decomposition of Minamoto and Yamaura #cite(label("MinamotoYamaura")) Lemma 4.13(4) and the proof of Theorem 4.17, after forgetting the grading and passing to opposite algebras. The direct proof identifies each derived tensor factor and its shift.

#thm([Proposition 6.1.])[
  #emph[Let $D$ be a finite-dimensional $k$-algebra, let $X$ be a finite-dimensional $D$-bimodule, and let $A = D times.l X$ be the algebra with multiplication 
$ \( d \, x \) \( d' \, x' \) = \( d d' \, d x' + x d' \) . $

 Let $N$ be a left $D$-module, inflated to $A$ through the projection $A arrow.r D$, and put $F = X ⊗_D^(upright(bold(L))) -$. In the derived category of left $D$-modules there is an isomorphism 
#[#set math.equation(numbering: n => "(6.1)")
 $ D ⊗_A^(upright(bold(L))) N tilde.eq xor.big_(r gt.eq 0) \( F^r N \) \[ r \] . $ <eq:bar-splitting>]

 Here $F^0 N = N$, and every $F^r$ denotes an iteration of the derived tensor functor.]
] <prop:bar-splitting>

#proof[
  Use the ordinary unnormalized bar resolution of $N$ over the field $k$. It is a free left $A$-resolution with degree $- n$ term $A ⊗_k A^(⊗_k n) ⊗_k N$. Its augmentation is a quasi-isomorphism: the augmented bar complex has the usual $k$-linear contraction obtained by inserting the unit. After tensoring with the right $A$-module $D$, it yields a model $cal(B)$ for $D ⊗_A^(upright(bold(L))) N$, with
  $ cal(B)^(- n) = D ⊗_k A^(⊗_k n) ⊗_k N #h(2em) \( n gt.eq 0 \) . $
  The differential is the alternating sum of the faces that multiply adjacent algebra entries or apply the two endpoint actions.
  Expand each internal copy of $A$ as $D xor X$. Every nonzero face preserves the number of entries from $X$. Indeed, a product involving exactly one $X$-entry remains in $X$, a product of two $X$-entries is zero, and an endpoint action by $X$ is zero on both $D$ and $N$. Thus there is an actual decomposition of complexes
  $ cal(B) = xor.big_(r gt.eq 0) cal(B)_r \, $
  where $cal(B)_r$ consists of words with precisely $r$ entries from $X$.
  For fixed $r$, write $i_0 \, dots.h \, i_r$ for the lengths of the blocks of $D$-entries before, between, and after the $X$-entries. The corresponding tensor is
  #[#set math.equation(numbering: n => "(6.2)")
   $ D ⊗_k D^(⊗_k i_0) ⊗_k X ⊗_k D^(⊗_k i_1) ⊗_k dots.h.c ⊗_k X ⊗_k D^(⊗_k i_r) ⊗_k N \, $ <eq:bar-block>]
  in degree $- r - sum_(j = 0)^r i_j$. We identify this with the multiple two-sided bar complex for
  #[#set math.equation(numbering: n => "(6.3)")
   $ D ⊗_D^(upright(bold(L))) underbrace(X ⊗_D^(upright(bold(L))) dots.h.c ⊗_D^(upright(bold(L))) X, r med upright("factors")) ⊗_D^(upright(bold(L))) N \, $ <eq:derived-multibar>]
  shifted by $r$.
  First consider the signs. Within block $j$, a bar face has alternating-sign offset
  $ j + sum_(h < j) i_h . $
  In the ordinary multibar total differential, ordered from left to right, the corresponding offset is $sum_(h < j) i_h$; shifting the total complex by $r$ adds the factor $\( - 1 \)^r$. Rescale the component (6.2) by
  $ \( - 1 \)^(sum_(j = 0)^r \( r - j \) i_j) . $
  When a face reduces $i_j$ by one, this factor changes by $\( - 1 \)^(r - j)$, precisely the discrepancy between the two differentials. This gives the required chain isomorphism. When $r gt.eq 1$ and $i_j = 0$, there is no nonzero face in that block: the prospective face multiplies two $X$-entries or applies an endpoint $X$-action. For $r = 0$, this is the ordinary two-sided bar complex for $D ⊗_D^(upright(bold(L))) N$. At $i_0 = 0$ its differential is absent; the map $D ⊗_k N arrow.r N$ is the separate augmentation.
  We next justify that the multibar computes the genuinely derived tensor in (6.3), without any flatness assumption on $X$ over $D$. For a bounded-above complex $Z$ of left $D$-modules, the total left-module bar resolution has terms obtained from
  $ D ⊗_k D^(⊗_k i) ⊗_k Z^q $
  in degree $q - i$. Its terms are free left $D$-modules because $k$ is a field, and its augmentation to $Z$ is a quasi-isomorphism. For each total degree there are only finitely many possible $i$, since $Z$ is bounded above. Thus it is a bounded-above complex of free modules and can be used to compute a derived tensor.
  Starting at the right, resolve $N$ in this way and tensor with $X$. Resolve the resulting left $D$-complex in the same way and tensor with the next $X$, continuing for the fixed finite number $r$ of factors. A final bar resolution with the leading factor $D$ gives exactly the multibar (6.2), before its shift. All exterior $D$-actions are preserved. This establishes its identification with (6.3), which is isomorphic to $F^r N$.
  Finally, in degree $- n$ of $cal(B)$ only $0 lt.eq r lt.eq n$ occur, and for each such $r$ there are finitely many tuples satisfying $r + sum_j i_j = n$. All totalizations above therefore use direct sums that are finite in each degree. There is no passage to products or completed tensor powers. Direct sums are exact for modules, so the componentwise quasi-isomorphisms give (6.1). The argument uses no connectedness assumption on $D$; in particular it applies to the product algebra of 5. ◻
]

=== 6.2 Detecting finite projective dimension and lower bounds <detecting-finite-projective-dimension-and-lower-bounds>

#thm([Corollary 6.2.])[
  #emph[In the setting of 16, suppose that $D$ has finite global dimension on both sides and that $N$ is finite-dimensional.]
  + #emph[If $F^t N tilde.eq 0$ for some $t gt.eq 1$, then $"pd"_A N < oo$.]
  + #emph[If $F^r N tilde.eq.not 0$, then $"pd"_A N gt.eq r$, with infinite projective dimension allowed.]
] <cor:pd-detection>

#proof[
  Every fixed iterate $F^r N$ has bounded, finite-dimensional cohomology. For example, if $g$ bounds the right global dimension of $D$, then for every finite-dimensional left $D$-module $V$ the groups $"Tor"_i^D \( X \, V \)$ are finite-dimensional and vanish for $i > g$. Applying this observation to successive truncation triangles shows inductively that
  $ H^q \( F^r N \) = 0 quad upright("unless") quad - r g lt.eq q lt.eq 0 . $
  In particular, all iterates lie in $sans(D)^(lt.eq 0) \( D \)$.
  For the first assertion, vanishing at $t$ implies vanishing at every $r gt.eq t$. By (6.1), $Z = D ⊗_A^(upright(bold(L))) N$ then has bounded cohomology. Since $X$ is a nilpotent ideal, it is contained in $"rad" A$, and
  $ "rad" A = \( "rad" D \) xor X \, #h(2em) A \/ "rad" A tilde.equiv D \/ "rad" D = : S . $
  Derived associativity gives
  $ S ⊗_A^(upright(bold(L))) N tilde.eq S ⊗_D^(upright(bold(L))) \( D ⊗_A^(upright(bold(L))) N \) = S ⊗_D^(upright(bold(L))) Z . $
  The right $D$-module $S$ has a finite projective resolution, so this complex also has bounded cohomology.
  Choose a minimal projective resolution of $N$ over the finite-dimensional algebra $A$, using successive projective covers. Its terms are finitely generated, and every differential has image in the radical of its target. Tensoring with $S = A \/ "rad" A$ therefore annihilates every differential. If $Q$ is a nonzero finitely generated projective $A$-module, then
  $ S ⊗_A Q tilde.equiv Q \/ \( "rad" A \) Q eq.not 0 $
  by Nakayama’s Lemma. Consequently bounded cohomology of $S ⊗_A^(upright(bold(L))) N$ forces the minimal resolution to have only finitely many nonzero terms. This proves $"pd"_A N < oo$.
  For the second assertion, choose $q lt.eq 0$ with $H^q \( F^r N \) eq.not 0$. Its direct summand in (6.1) gives
  $ H^(q - r) \( D ⊗_A^(upright(bold(L))) N \) eq.not 0 \, #h(2em) q - r lt.eq - r . $
  A projective $A$-resolution of $N$ of length strictly less than $r$ would make the derived tensor zero in this degree. Hence $"pd"_A N gt.eq r$, as asserted. ◻
]

#prodef([Remark 6.3.])[
  For inflated modules, the projective-dimension formula of Minamoto and Yamaura #cite(label("MinamotoYamaura")) Corollary 4.11, after passage to the opposite algebra to match our left-module convention, gives the stronger equality
  $ "pd"_A N = sup_(r gt.eq 0) { "pd"_D \( F^r N \) + r #scale(x: 120%, y: 120%)[}] \, $
  where projective dimension on the right is understood for derived complexes, with $"pd"_D \( 0 \) = - oo$. The graded and ungraded dimensions agree by #cite(label("MinamotoYamaura")) Proposition 2.5 and Lemma 3.6. Their #cite(label("MinamotoYamaura")) Theorem 4.17 also gives the corresponding perfectness criterion. The direct bar and minimal-resolution arguments above prove the assertions needed here.
]

=== 6.3 The fixed algebra and its modules <the-fixed-algebra-and-its-modules>

#proof[
  Work over $k = bb(C)$. Fix the algebra $R$, its central idempotent $e$, the automorphism $alpha$, and the selection functor $H$ supplied by 3. Apply 11 to these fixed data, obtaining $B$ and $P$ satisfying (4.1). Choose the support interval $\[ a_(*) \, b_(*) \]$ once, and construct $C \, W \, O \, D \, X$ as in 5. Finally fix the ordinary finite-dimensional unital algebra
  $ A = D times.l X . $
  These choices are made independently of $m$, as summarized in 1.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Choice
], table.cell(rowspan: 1, colspan: 1)[Objects
]),
  table.cell(rowspan: 1, colspan: 1)[Fixed once
], table.cell(rowspan: 1, colspan: 1)[$R \, e \, alpha$; the presentation and algebra $B$; the lifted diagram and complex $P$; the interval $\[ a_(*) \, b_(*) \]$; $C \, W \, O \, T \, D \, X$; and $A = D times.l X$.
],
  table.cell(rowspan: 1, colspan: 1)[Varying with $m$
], table.cell(rowspan: 1, colspan: 1)[The quotient $F_m$, its central character, the selection module $Y_m$, and the inflated module $N_m = M \( Y_m \)$.
],
)
]],
    caption: [Table 2: The quantifier order in the construction of $A$. Varying the test module changes neither the tensor functor nor the final algebra. ],
  )
  For a finite-dimensional left $R$-module $Y$, regard $M \( Y \)$ as supported on the first factor of $D$. By (5.2) and (4.1),
  $ F^2 M \( Y \) tilde.eq M \( H \( Y \) \) \[ b_(*) \] xor M \( H \( Y \) \) \[ b_(*) + 3 \] . $
  Induction, using preservation of finite direct sums and shifts by derived tensor, gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ F^(2 j) M \( Y \) tilde.eq xor.big_(q = 0)^j M \( H^(compose j) \( Y \) \) \[ j b_(*) + 3 q \]^(xor binom(j, q)) #h(2em) \( j gt.eq 0 \) . $ <eq:even-iterates>]
  The induction applies the realization isomorphism separately to each module $H^(compose j) \( Y \)$; it requires no splitting natural in $Y$.
  For each $m gt.eq 1$, let $Y_m$ be the finite-dimensional module supplied by (2.2), and let $N_m = M \( Y_m \)$, first as a left $D$-module on its first factor and then as an inflated left $A$-module. It is finite-dimensional. Since $H^(compose m) \( Y_m \) = 0$ and $H^(compose \( m - 1 \)) \( Y_m \) eq.not 0$, (6.4) yields
  $ F^(2 m) N_m tilde.eq 0 \, #h(2em) F^(2 m - 2) N_m tilde.eq.not 0 . $
  The latter nonvanishing follows because a finite direct sum of shifts of the nonzero module $M \( H^(compose \( m - 1 \)) \( Y_m \) \)$ is nonzero. Shifts preserve both extinction and nonvanishing; the lower bound now uses the iterate index $r = 2 m - 2$ in 17, not a new estimate on the shifts. The algebra $D$ has finite global dimension on both sides by 15. Applying 17 proves
  $ 2 m - 2 lt.eq "pd"_A N_m < oo #h(2em) \( m gt.eq 1 \) . $
  All $N_m$ are finitely generated over the single fixed algebra $A$, while these lower bounds are unbounded. Therefore $"fin.dim" A = oo$, which refutes the asserted finiteness for all finite-dimensional algebras. ◻
]

=== 6.4 The auxiliary left–right asymmetry <sec:left-right-asymmetry>

#proof[
  Let $A$ be the algebra of 1, and choose a basic finite-dimensional complex algebra $C$ Morita equivalent to $A^(upright("op"))$. The right-module little and big finitistic dimensions of $C$ are infinite, and its injective right modules do not generate: these are the conclusions for left $A$-modules in 1, transported through Morita equivalence. Indeed, this equivalence preserves projective dimensions and finite generation, and the induced equivalence of unbounded derived categories preserves injectives and coproducts.
  Choose primitive idempotents $e_1 \, dots.h \, e_n$ representing the simple right $C$-modules $S_C \( e_i \) = e_i C \/ e_i "rad" C$. In Cummings’ Construction 2.1 #cite(label("Cummings2024")), set
  $ E = product_(i = 1)^n bb(C) \[ epsilon_i \] \/ \( epsilon_i^2 \) \, #h(2em) U = xor.big_(i = 1)^n S_C \( e_i \) \, #h(2em) T = mat(delim: "(", C, 0; zws_E U_C, E) . $
  The left $E$-action on $U$ factors through $E \/ "rad" E tilde.equiv bb(C)^n$, with the $i$th factor acting on $S_C \( e_i \)$. This is a finite-dimensional complex algebra.
  Write $"fin.dim"_r$ and $"Fin.dim"_r$ for the right-module dimensions, to display Cummings’ convention. By #cite(label("Cummings2024")) Propositions 3.2–3.3,
  $ "fin.dim"_r C lt.eq "fin.dim"_r T \,\
"Fin.dim"_r C lt.eq "Fin.dim"_r T \,\
"fin.dim"_r \( T^(upright("op")) \) = "Fin.dim"_r \( T^(upright("op")) \) = 0 . $
  His Proposition 4.3 says that injective generation for right $T$-modules implies it for right $C$-modules, while Proposition 4.4 establishes it for right $T^(upright("op"))$-modules #cite(label("Cummings2024")) Propositions 4.3–4.4. Hence both right finitistic dimensions of $T$ are infinite and its injective right modules do not generate; for $T^(upright("op"))$, both right dimensions are zero and its injective right modules generate. Taking $Lambda = T^(upright("op"))$ translates these statements into our left-module convention. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
