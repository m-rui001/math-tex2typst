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

#align(center)[#text(size: 16pt, weight: "bold")[Harmonic heights and the Artin $K \( pi \, 1 \)$ conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $S$ be a finite set and $M = \( m_(s t) \)_(s \, t in S)$ a Coxeter matrix. Thus $m_(s s) = 1$ and, for distinct $s \, t$, the symmetric entry $m_(s t)$ belongs to ${ 2 \, 3 \, dots.h } union { oo }$. The Artin group $A = A \( W \, S \)$ has generators $sigma_s$, with the relation equating the two alternating words of length $m_(s t)$ whenever $m_(s t) < oo$. The Coxeter group $W$ is the quotient obtained by imposing $sigma_s^2 = 1$. A subset $T subset.eq S$ is #emph[spherical] if its standard Coxeter parabolic $W_T$ is finite.

The standard Artin Salvetti complex $X \( W \, S \)$ has one cell of dimension $\| T \|$ for each spherical subset $T$, including its vertex for $T = diameter$. Its attaching maps come from the oriented Coxeter-Salvetti construction. These include the braid relations in dimension two and the spherical cells in all higher dimensions. We recall the full model in Section 2.

#thm([Theorem 1.1.])[
  #emph[For every Coxeter matrix on a finite set $S$, the universal cover of $X \( W \, S \)$ is contractible. Equivalently, 
$ pi_n #scale(x: 120%, y: 120%)[\(] X \( W \, S \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( n gt.eq 2 \) . $

 The conclusion allows arbitrary finite labels, infinite labels, and connected or disconnected diagrams.]
] <thm:main>

Thus Theorem 1 resolves the $K \( pi \, 1 \)$ conjecture for Artin groups with finitely many standard generators. The theorem concerns the full Salvetti complex: its higher-dimensional cells are part of both the statement and the proof. Although the generating set is finite, the Coxeter group need not be.

Theorem 1 also supplies the asphericity input in several established implications. In Section 10, the finite-dimensional classifying space gives torsion-freeness, and the center theorem of Jankiewicz–Schreve #cite(label("JankiewiczSchreve2022")) Theorem 3, together with Deligne’s spherical center theorem #cite(label("Deligne1972")) Theorem 4.21, gives $Z \( A \) tilde.equiv bb(Z)^k$, where $k$ counts the connected Coxeter-diagram components whose Coxeter groups are finite. For the positive Artin monoid, defined by the same generators and braid relations in the category of monoids, Dobrinskaya’s equivalence #cite(label("Dobrinskaya2002")), as reproved by Ozornova #cite(label("Ozornova2013")) Section 5, gives the natural equivalence of its classifying space with that of the group. We also apply Boyd’s conditional stability theorem #cite(label("Boyd2020")) Corollary B to its exact family obtained by attaching a growing type-$A$ path to a distinguished vertex of an arbitrary fixed finite diagram, with no other new edges. Its constant-coefficient range is recorded in Corollary 57.

=== 1.1 Context <context>

In spherical type, the geometric model is the complement of the complexified reflection hyperplanes modulo the free action of the finite Coxeter group. Its fundamental group is the Artin group, and the conjecture asks whether this orbit space is aspherical #cite(label("Brieskorn1973")) Section 2. Modern accounts conventionally attribute the origins of the conjecture to Arnol’d, Brieskorn, Pham and Thom #cite(label("Paolini2026")) Introduction. The Salvetti model connects the pairwise braid presentation with a finite-dimensional cellular space governed by spherical parabolics. Asphericity makes this explicit complex a classifying space, so its cells and attaching maps encode group-topological invariants.

For ordinary braid groups, the configuration-space arguments of Fadell–Neuwirth and Fox–Neuwirth give the basic example #cite(label("FoxNeuwirth1962")) Section 8. Deligne proved the spherical case using finite real reflection arrangements #cite(label("Deligne1972")). The positive-monoid structure in finite type was developed by Brieskorn–Saito and Deligne #cite(label("BrieskornSaito1972")) #cite(label("Deligne1972")). Salvetti’s cellular constructions give the relevant arrangement and Coxeter models #cite(label("Salvetti1987")) #cite(label("Salvetti1994")); standard Artin parabolics embed by van der Lek’s theorem #cite(label("VanDerLek1983")). Paolini gives a recent account of the spherical theorem and its cell structure #cite(label("Paolini2026")).

Charney–Davis developed the modified Deligne complex, built from spherical parabolic cosets, and its equivalence to the asphericity problem #cite(label("CharneyDavis1995")) Section 1.5 and Corollary 3.2.6. They proved the FC case, in which every subset with all pairwise labels finite is spherical, and the dimension-at-most-two case #cite(label("CharneyDavis1995")) Theorems 4.3.5–4.3.6 and Proposition 4.4.5. Here dimension means the largest size of a spherical subset, which can be much smaller than the rank $\| S \|$. Paolini–Salvetti resolved all affine types using dual noncrossing partitions and discrete Morse theory #cite(label("PaoliniSalvetti2021")) Theorem 8.15, building on the dual and Garside constructions of McCammond–Sulway #cite(label("McCammondSulway2017")).

Recent geometric methods cover further broad classes. Huang–Przytycki proved the dimension-at-most-three case and additional specified higher-dimensional classes #cite(label("HuangPrzytycki2025")) Theorems 1.1 and 12.20. Hoda–Huang proved the conjecture when every irreducible spherical parabolic is of type $A$, $B$, or $I_2$ #cite(label("HodaHuang2026")) Theorem 1.3. Huang’s tree reduction #cite(label("Huang2026")) Theorem 1.1 and Corollary 9.2 requires both asphericity for tree diagrams and the condition that every special four-cycle of alternating types in their Artin complexes has a common neighboring vertex. Our proof uses the classical spherical-coset reduction and contracts that poset directly for every finite-rank matrix.

The algebraic tools have a different ancestry. Zigzag algebras and braid actions by evaluation cones were developed by Huerfano–Khovanov, Khovanov–Seidel and Seidel–Thomas #cite(label("HuerfanoKhovanov2001")) #cite(label("KhovanovSeidel2002")) #cite(label("SeidelThomas2001")). Heng–Licata extend these constructions to fusion categories and arbitrary Coxeter labels #cite(label("HengLicata2024")) Sections 4–5. We use a framed version of that construction, with explicit choices of fusion factors and edge objects. The extreme-degree tests adapt the positive-divisor method of Brav–Thomas for ADE configurations of $2$-spherical objects #cite(label("BravThomas2011")) Section 3; here the tests also apply to right simples and must recover original colors after unfolding. The proofs record these adaptations at their points of use.

Heng–Licata also relate their distinguished fusion-equivariant stability component to Artin hyperplane complements and formulate its contractibility as a route to the $K \( pi \, 1 \)$ conjecture #cite(label("HengLicata2024")) Theorem 7.7 and Conjecture 7.12. Here we contract the spherical-coset poset directly. The local requirements are a two-point comparison of spherical cosets and an obstruction to an isolated positive harmonic layer. They combine categorical cohomology with harmonic extension to control the links of a single well-ordered filtration.

=== 1.2 The proof and its local estimates <the-proof-and-its-local-estimates>

Write $cal(D)$ for the poset of spherical right cosets $A_T x$, ordered by inclusion with nested types. The classical spherical theorem, the parabolic embedding theorem, and Quillen’s Theorem A identify its order complex up to homotopy with the full Salvetti universal cover (Lemma 5). The task is therefore to contract $\| cal(D) \|$. We add the vertices in a well-order. A vertex’s #emph[earlier link] is the part of its link already present, and a #emph[source] has empty earlier link. If all earlier links are empty or contractible, each component is contractible and has exactly one source (Lemma 43). Thus controlling links and distinguishing sources are the two topological tasks.

We adjoin a frame vertex and construct a finite graded zigzag algebra. An Artin element acts by invertible bimodule complexes. Its action on the frame projectives has finitely many #emph[layers], indexed by the sum of cochain and internal generator degrees. Their nonnegative weighted multiplicities give vectors $m^d \( x \)$, with coordinates indexed by the original colors $S$ and the frame $o$. An original color means one standard generator. The frame coordinate is always one in layer zero and zero in every other layer. For distinct original colors $i \, j in S$, the diagram weights are $b_(i j) = 2 cos \( pi \/ m_(i j) \)$ for finite labels, $b_(i j) = 2$ for infinite labels, and $b_(i o) = b_(o i) = 1$ for frame edges. For a spherical coset $A_T x$, the multiplicities outside $T$ are independent of the representative. Their #emph[harmonic extension] $p = p^d \( A_T x \)$ retains those exterior coordinates and solves

$ 2 p_i = sum_(j eq.not i) b_(i j) p_j #h(2em) \( i in T \) . $

Sphericity guarantees a unique nonnegative solution. These vectors define the height: compare the highest nonnegative layer first, and at each level resolve equality of vectors by a type-order rule before comparing lower layers.

Passing to a larger spherical coset replaces more coordinates by harmonic values; passing to a smaller coset exposes actual layer multiplicities. Positive-definite Cartan forms control strict comparisons. A different rule is needed when the harmonic vector at a level $q > 0$ restricts on a connected component of its positive support to a null vector for that component’s Cartan matrix, and all higher harmonic vectors vanish on the component and its boundary. At those components we reverse the type-order tie. This rule permits the upper-link contraction, but requires closed inequalities in certain lower links.

Call data #emph[capped at $q$] on a set of colors if there are no generators there above layer $q$. The lower-link problem leads to two kinds of sublevel inside a fixed spherical coset $A_T x$ whose boundary data are capped at $q$. For a proper subcoset $A_J z subset.neq A_T x$, compare the exposed counts $m_i^q \( z \)$, $i in T \\ J$, with the harmonic values $p_i^q \( A_T x \)$, requiring these colors to be capped at $q$. Strict inequalities define the strict sublevel. When $T$ is contained in a support component of this null kind, we also need the special closed sublevel, which permits equality. Proposition 44 proves that the strict sublevel is empty or contractible, and that the special closed sublevel is nonempty and contractible. Its induction again uses earlier links, so every component has a unique source. The two algebraic estimates supply source uniqueness and closed-sublevel nonemptiness, respectively.

First, at a putative source $A_J z$, a lower bound valid at every capped representative of that coset turns the excess above $p^q \( A_J z \)$ into a convex combination of subrepresentation dimensions (Proposition 28). A three-step tensor filtration then compares two such sources. The resulting two-point inequalities have a sum equal to the negative of a positive-definite Cartan quadratic form, forcing equality of their harmonic data. Right-simple complexes supply a parabolic detector that then identifies the actual cosets. This proves uniqueness of the possible sources (Proposition 30).

Second, emptiness of a special closed sublevel would mean that every capped representative has all its interior counts strictly above the prescribed null harmonic values. The Hom calculation in Section 7, together with convexity, controls a finite sequence of twists that simplifies successive lower layers while retaining the cap. It forces the boundary of the null component to vanish in each layer reached by this process. The fixed frame supplies a nonzero boundary coordinate in layer zero, so the lowest nonzero boundary layer lies at or below zero. Reaching that layer, below $q > 0$, gives a contradiction. This is the isolated harmonic-layer obstruction (Proposition 39). The tensor and Hom arguments are proved independently of the subsequent topological contraction.

With these residue sublevels available, the earlier upper and lower links in the global filtration are empty or contractible. The vertex-filtration principle makes each component contractible; rank-one cosets connect all singleton cosets and hence the entire poset. This proves Theorem 55, and the Salvetti comparison proves Theorem 1.

Figure 1 summarizes these dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Framed category and twists#linebreak()Section~3]]])])
  content((5.607, 0), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Layer calculus#linebreak()Section~4]]])])
  content((11.21, 0), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Caps and convex subobjects#linebreak()Section~5]]])])
  content((0, -1.65), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Spherical Salvetti theorem,#linebreak()parabolic embeddings,#linebreak()poset fibers]]])])
  content((5.607, -1.65), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Two-point estimate:#linebreak()candidate uniqueness#linebreak()Section~6]]])])
  content((11.21, -1.65), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Isolated-layer obstruction#linebreak()Section~7]]])])
  content((0, -3.35), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Full Salvetti comparison#linebreak()$tilde(X) (W,S) tilde.eq | cal(D) |$#linebreak()Lemma~2.4]]])])
  content((8.41, -3.35), [#box(width: 7.372cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Spherical-residue sublevels#linebreak()Section~8]]])])
  content((8.41, -4.85), [#box(width: 7.372cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Earlier global links are empty or contractible#linebreak()Section~9]]])])
  content((8.41, -6.35), [#box(width: 7.372cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$| cal(D) |$ is contractible#linebreak()Filtration and rank-one connectedness#linebreak()Theorem~9.11]]])])
  content((0, -6.35), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$X(W,S)$ is a $K(A,1)$#linebreak()Theorem~1.1]]])])
  line((2.367, 0), (3.239, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.974, 0), (8.846, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((8.846, -0.51), (7.974, -1.14), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((11.21, -0.51), (11.21, -1.14), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.607, -2.16), (4.724, -2.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((11.21, -2.16), (12.1, -2.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((8.41, -3.86), (8.41, -4.34), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((8.41, -5.36), (8.41, -5.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -2.16), (0, -2.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -3.86), (0, -5.84), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.724, -6.35), (2.367, -6.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The main dependencies. The two algebraic estimates are proved before their use in the induction on spherical residues. The classical comparison is independent of the height argument and transfers the resulting contraction to the full Salvetti universal cover. Arrows display the main flow of the proof; the finite-type Coxeter and monoid inputs to the algebraic constructions are specified in the text. ],
) <fig:dependencies>

=== 1.3 Conventions and organization <conventions-and-organization>

All posets are realized as their order complexes with the CW topology. All tensor categories and algebras are over $bb(C)$. Complexes carry cochain and internal gradings; the total generator degree is their sum. Only cochain degrees determine differential signs. We use bimodule homotopy equivalences whenever a nonprojective module will subsequently be tensored. Subsets written with $subset.eq$ need not be proper.

Section 2 fixes the topological model and the classical inputs. Sections 3–5 construct the algebra, its action, the layers and their convexity. Sections 6 and 7 prove the two local estimates. Sections 8 and 9 establish the sublevel theorem and the global contraction. Section 10 derives the structural consequences and the homological-stability statement for fixed-core braid-tail families.

== 2 The Salvetti complex and spherical parabolic cosets <sec:topology>

We first specify the space whose universal cover will be contracted. Let $A = A \( W \, S \)$ be the Artin group in Theorem 1, and let

$ theta.alt : A arrow.r W \, #h(2em) theta.alt \( sigma_s \) = s \, $

be its Coxeter quotient. For $T subset.eq S$, write $W_T = chevron.l T chevron.r$ and $A_T = chevron.l sigma_s : s in T chevron.r$, and put

$ cal(S)^(upright(f)) = { T subset.eq S : W_T upright(" is finite") } . $

The members of $cal(S)^(upright(f))$ are called #emph[spherical]. In particular, $diameter in cal(S)^(upright(f))$ and $A_diameter = { 1 }$.

For a poset $cal(P)$, its realization $\| cal(P) \|$ will always mean the order complex: vertices are elements of $cal(P)$, simplices are nonempty finite chains, and the realization has its CW topology.

=== 2.1 Classical inputs <classical-inputs>

We use the following facts about Coxeter systems #cite(label("Bourbaki2002")) Chapter IV, §1, nos. 4–5 and 8. Each $\( W_T \, T \)$ is the Coxeter system defined by the submatrix on $T$. A left coset of $W_R$ in $W_T$, for $R subset.eq T$, has a unique element $u_0$ of minimal length, and

#[#set math.equation(numbering: n => "(2.1)")
 $ ell \( u_0 v \) = ell \( u_0 \) + ell \( v \) #h(2em) \( v in W_R \) . $ <eq:topology-length-additivity>]

Reduced expressions for an element of $W$ are related by braid moves. Consequently, if $w = s_1 dots.h.c s_r$ is reduced, the element

#[#set math.equation(numbering: n => "(2.2)")
 $ iota \( w \) = sigma_(s_1) dots.h.c sigma_(s_r) in A $ <eq:topology-positive-lift>]

is independent of the reduced expression. Whenever $ell \( u v \) = ell \( u \) + ell \( v \)$, it satisfies $iota \( u v \) = iota \( u \) iota \( v \)$.

We also use the geometric representation and its chamber description: the standard geometric form is positive definite exactly when the Coxeter group is finite #cite(label("Bourbaki2002")) Chapter V, §4, no. 8, Theorem 2; in finite type the chambers form a simply transitive Coxeter orbit, signs of roots detect descents, and the translates of a closed fundamental chamber cover the dual space #cite(label("Bourbaki2002")) Chapter V, §3, no. 3, and §4, nos. 4 and 6. These assertions apply both to spherical submatrices of the original system and to the finite Coxeter systems constructed below.

#thm([Theorem 2.1.])[
  (Standard parabolic embedding).  #emph[For every $T subset.eq S$, the homomorphism from the Artin group defined by the submatrix on $T$ to $A$, sending its standard generators to the corresponding $sigma_t$, is injective. Its image is $A_T$.]
] <thm:topology-parabolic-embedding>

This is van der Lek’s standard parabolic theorem #cite(label("VanDerLek1983")) Chapter II, Section 4, Theorem 4.13(i). No spherical hypothesis is imposed here.

The positive monoid on a subset $T$ means the monoid with the same generators and positive braid relations as its Artin group. Its identity is the empty word. An element $b$ #emph[right-divides] $a$ if $a = c b$ for some positive element $c$; left divisibility is defined in the opposite order.

#thm([Theorem 2.2.])[
  (Finite-type positive monoids).  #emph[Suppose that $T$ is spherical, and let $A_T^(+)$ be its positive Artin monoid. Then the following statements hold.]
  + #emph[The natural map $A_T^(+) arrow.r A_T$ is injective. In particular, $A_T^(+)$ is cancellative on both sides.]
  + #emph[Every element of $A_T$ can be written both as $a b^(- 1)$ and as $c^(- 1) d$, with $a \, b \, c \, d in A_T^(+)$.]
  + #emph[Any two elements of $A_T^(+)$ have a greatest common right divisor, and also a greatest common left divisor.]
  + #emph[If $w_T$ is the longest element of $W_T$, then $Delta_T = iota \( w_T \)$ is the finite-type fundamental element. Its left divisors and its right divisors coincide and are exactly the elements $iota \( w \)$, $w in W_T$.]
] <thm:topology-finite-monoid>

These are the finite-type monoid results of Brieskorn–Saito and Deligne. Cancellation and fractions are given in #cite(label("BrieskornSaito1972")) Propositions 2.3 and 5.5(iii)–(iv), and Theorem 5.6 and #cite(label("Deligne1972")) Theorem 4.14; the gcd statement is #cite(label("BrieskornSaito1972")) Proposition 4.2. For the fundamental element and its divisors, see #cite(label("BrieskornSaito1972")) Lemma 5.4 and Propositions 5.5 and 5.7. We use Theorem 3 only for spherical subsets and for finite Coxeter unfoldings. In particular, fractions in a positive monoid are never assumed for the full system when it is not spherical.

=== 2.2 Permutahedral cells and their face maps <permutahedral-cells-and-their-face-maps>

For each nonempty spherical $T$, take a point in the interior of a fundamental chamber of the finite reflection representation of $W_T$. Choose these points compatibly with diagram components: on a reducible system use the direct sum of the points chosen for its components. The convex hull of its $W_T$-orbit is a Coxeter permutahedron $Pi_T$. It is a closed ball of dimension $\| T \|$, with vertices labeled by $W_T$ and with a distinguished #emph[source] labeled $1$. Set $Pi_diameter$ to be a point.

The nonempty faces of $Pi_T$ are indexed by cosets $u_0 W_R$, where $R subset.eq T$ and $u_0$ is the shortest element of its coset. The face with this index will be denoted $F_(u_0 \, R)$; its vertices have labels $u_0 v$, $v in W_R$. There is a specified cellular homeomorphism

#[#set math.equation(numbering: n => "(2.3)")
 $ j_(u_0 \, R) : Pi_R arrow.r F_(u_0 \, R) \, #h(2em) v mapsto u_0 v quad upright("on vertices") . $ <eq:topology-face-identification>]

One precise choice is obtained by taking the barycentric subdivisions of both face lattices, sending the center of the face $v_0 W_Q$ to the center of $u_0 v_0 W_Q$, and extending affinely over their simplices. Centers on product faces are chosen as products of the centers of their factors.

These identifications are compatible on nested faces. Indeed, if $v_0$ is the shortest representative of a left $W_Q$-coset in $W_R$, then (2.1) makes $u_0 v_0$ the shortest representative of the corresponding left $W_Q$-coset in $W_T$. On barycentric subdivisions this gives the equality

#[#set math.equation(numbering: n => "(2.4)")
 $ j_(u_0 \, R) compose j_(v_0 \, Q) = j_(u_0 v_0 \, Q) . $ <eq:topology-nested-faces>]

Define $X \( W \, S \)$ by taking one copy of $Pi_T$ for every $T in cal(S)^(upright(f))$ and, for every proper face $F_(u_0 \, R) subset Pi_T$, identifying $j_(u_0 \, R) \( y \)$ with the point $y$ in the copy of $Pi_R$. Equation (2.4) makes all these identifications compatible. The resulting CW complex has one open $\| T \|$-cell of each spherical type $T$.

An edge in a model cell whose endpoints are $u_0$ and $u_0 s$, with $ell \( u_0 s \) = ell \( u_0 \) + 1$, projects to the edge of type $s$, oriented positively. This convention fixes the attaching maps, including their orientations. Equivalently, the Coxeter Salvetti complex has cells $\( w \, T \)$, $w in W$, $T in cal(S)^(upright(f))$, with the same models and face parameters $\( w u_0 \, R \)$. Its $W$-action is left multiplication on $w$, and its quotient has precisely the identifications just given. Thus this is the oriented Coxeter–Salvetti model #cite(label("Salvetti1994")) Theorem 1.4; compare #cite(label("Paolini2026")) Theorem 3.3 and Section 5.

The one-skeleton has one vertex and one oriented edge $sigma_s$ for each $s in S$. If ${ s \, t }$ is spherical, its model is a $2 m_(s t)$-gon. The two increasing paths from its source to its opposite vertex read the two alternating words of length $m_(s t)$. Its attaching relation is their equality. If $m_(s t) = oo$, there is no cell of this type. It follows that the two-skeleton is the Artin presentation complex, and hence

#[#set math.equation(numbering: n => "(2.5)")
 $ pi_1 \( X \( W \, S \) \) = A . $ <eq:topology-fundamental-group>]

The cells of dimension at least three remain part of $X \( W \, S \)$.

We invoke the spherical theorem in the following precise form.

#thm([Theorem 2.3.])[
  (Spherical asphericity).  #emph[If $T$ is spherical, the universal cover of the CW complex $X \( W_T \, T \)$ with the preceding permutahedral attaching maps is contractible.]
] <thm:topology-spherical-asphericity>

Deligne proved asphericity of the corresponding finite reflection arrangement complement #cite(label("Deligne1972")) opening theorem, p. 273. The Salvetti formulation is given, for example, in #cite(label("Paolini2026")) Theorem 3.3 and Corollary 5.7. The hypothesis here is finiteness of $W_T$, not merely finiteness of its generating set.

=== 2.3 The regular universal cover <the-regular-universal-cover>

Let $tilde(X)$ be the universal cover of $X \( W \, S \)$, and label its vertices by $A$, with the vertex $1$ chosen over the unique vertex of $X \( W \, S \)$. A positive edge of type $s$ goes from $alpha$ to $alpha sigma_s$. A lift of a cell of type $T$ is uniquely determined by the lift $alpha$ of its source, so denote this open cell by $\( alpha \, T \)$.

A reduced gallery from the source of $Pi_T$ to its vertex $u$ reads a reduced word for $u$. Its lift therefore ends at $alpha iota \( u \)$. In particular, the face indexed by $u_0 W_R$ has parameter

#[#set math.equation(numbering: n => "(2.6)")
 $ \( alpha iota \( u_0 \) \, R \) \, #h(2em) R subset.eq T \, quad u_0 upright(" shortest in ") u_0 W_R subset.eq W_T . $ <eq:topology-lifted-faces>]

The corresponding characteristic map on that face is (2.3). Compatibility also follows directly from $iota \( u_0 v_0 \) = iota \( u_0 \) iota \( v_0 \)$.

The lifted CW structure is regular. To see this, consider two open faces of a single $Pi_T$. If their types differ, their lifted cells differ. If both have type $R$, with shortest representatives $u_0$ and $u_1$, equality of their lifted parameters would give $alpha iota \( u_0 \) = alpha iota \( u_1 \)$. Applying $theta.alt$ gives $u_0 = u_1$, so the faces coincide. Each open face maps homeomorphically to its lifted cell. It follows inductively on dimension that the characteristic map of $Pi_T$ is injective on its whole closed ball. Since the model is compact and the cover is Hausdorff, this map is an embedding. Thus the face poset $cal(F) \( tilde(X) \)$ has realization canonically homeomorphic to the barycentric subdivision of $tilde(X)$.

=== 2.4 The spherical-coset comparison <the-spherical-coset-comparison>

The modified Deligne complex of Charney–Davis is built from spherical parabolic cosets #cite(label("CharneyDavis1995")) Section 1.5. We use its right-coset presentation. Define

#[#set math.equation(numbering: n => "(2.7)")
 $ cal(D) = { A_T x : x in A \, med T in cal(S)^(upright(f)) } \, $ <eq:topology-deligne-poset>]

with types retained, ordered by coset inclusion with nested types. Thus $A_R y lt.eq A_T x$ means $R subset.eq T$ and $A_R y subset.eq A_T x$. Inversion identifies this poset with the left-coset poset $cal(D)^ell = { x A_T : x in A \, med T in cal(S)^(upright(f)) }$.

We use the following form of Quillen’s Theorem A #cite(label("Quillen1973")) Section 1, Theorem A and its dual formulation: if $f : cal(P) arrow.r cal(Q)$ is a map of small posets and

$ \| f^(- 1) \( cal(Q)_(lt.eq q) \) #scale(x: 120%, y: 120%)[\|] quad upright("is contractible for every ") q in cal(Q) \, $

then $\| f \| : \| cal(P) \| arrow.r \| cal(Q) \|$ is a homotopy equivalence. Here $cal(Q)_(lt.eq q) = { q' in cal(Q) : q' lt.eq q }$ is the whole lower ideal, and the posets and fibers need not be finite.

#thm([Lemma 2.4.])[
  (Salvetti–coset comparison).  #emph[There is a homotopy equivalence 
$ tilde(X) \( W \, S \) tilde.eq \| cal(D) \| . $

 Consequently, contractibility of $\| cal(D) \|$ implies the conclusion of Theorem 1.]
] <lem:salvetti-comparison>

#proof[
  Define
  $ f : cal(F) \( tilde(X) \) arrow.r cal(D)^ell \, #h(2em) f \( alpha \, T \) = alpha A_T . $
  Formula (2.6) makes $f$ order preserving: if $\( alpha iota \( u_0 \) \, R \)$ is a face of $\( alpha \, T \)$, then $iota \( u_0 \) in A_T$ and $R subset.eq T$, so $alpha iota \( u_0 \) A_R subset.eq alpha A_T$.
  Fix $beta A_T in cal(D)^ell$. The inverse image of its lower ideal consists exactly of the cells
  #[#set math.equation(numbering: n => "(2.8)")
   $ \( alpha \, R \) \, #h(2em) alpha in beta A_T \, quad R subset.eq T . $ <eq:topology-fiber-cells>]
  Indeed, the indicated conditions imply $alpha A_R subset.eq beta A_T$, and the converse follows from the retained types and from $alpha in alpha A_R$.
  By Theorem 2, write $alpha = beta h$ uniquely with $h$ an element of the Artin group on $T$. Under this correspondence, every face formula becomes
  $ \( h \, R \) mapsto \( h iota \( u_0 \) \, Q \) \, #h(2em) Q subset.eq R subset.eq T \, $
  with $u_0$ the shortest representative of the specified $W_Q$-coset in $W_R$. These are exactly the lifted face maps of $X \( W_T \, T \)$. Thus the poset in (2.8) is its universal-cover face poset. Its realization is contractible by Theorem 4. For $T = diameter$ it is a single vertex.
  Quillen’s Theorem A now gives $\| cal(F) \( tilde(X) \) \| tilde.eq \| cal(D)^ell \|$. Regularity identifies the left side with a subdivision of $tilde(X)$, and inversion identifies the right side with $\| cal(D) \|$. This proves the lemma. ◻
]

#prodef([Remark 2.5.])[
  The comparison uses the full spherical universal covers over lower ideals, including all their higher cells. It does not assert that the translation action on $cal(D)$ is free: its vertex stabilizers are conjugates of standard parabolic subgroups. The classical comparison appears in #cite(label("CharneyDavis1995")) Corollary 3.2.6; it is also established in the more general framework of #cite(label("GodelleParis2012")) Section 3, Theorem 3.1 and Lemma 3.2.
]

We record two elementary coset facts for the later link calculations. If $R subset.eq T$ and $A_R y$ meets $A_T x$, then $A_R y subset.eq A_T x$. For a fixed coset $A_R y$ and a specified larger spherical type $T$, its unique upper extension is $A_T y$. Thus lower intervals can be computed entirely inside the indicated parabolic subgroup, and upper extensions are determined by their types. These assertions use only inclusions with nested types.

Finally, if $T = T_1 union.sq dots.h.c union.sq T_r$ is the decomposition into components of its Coxeter diagram, the presentation and Theorem 2 give

#[#set math.equation(numbering: n => "(2.9)")
 $ A_T = A_(T_1) times dots.h.c times A_(T_r) . $ <eq:topology-parabolic-product>]

Cosets of subgroups whose types lie in these blocks, and their inclusion relations, are accordingly products. When $S$ is empty, both $X \( W \, S \)$ and $\| cal(D) \|$ are points; in the rest of the proof we may assume $S eq.not diameter$.

== 3 A framed category and its Artin action <sec:category>

We construct a finite graded algebra and a homotopy action of the Artin group on complexes of its projectives. The construction uses a fusion category to realize the nonintegral entries of the geometric Coxeter form. This is a framed variant of the fusion-category zigzag construction and Artin action of Heng–Licata #cite(label("HengLicata2024")) Sections 4–5. We use a full Temperley–Lieb factor for each edge with finite label at least four, its string object as edge label, and an additional frame. These choices differ from their default labels; compare their Remarks 4.4 and 5.4. We give the algebra and its bimodule homotopies for these conventions.

=== 3.1 The geometric form and a frame <the-geometric-form-and-a-frame>

Adjoin a vertex $o$, called the frame, to the original finite set $S$, and put $hat(S) = S union.sq { o }$. For distinct original vertices set

$ b_(i j) = cases(delim: "{", 2 cos \( pi \/ m_(i j) \) \, & m_(i j) < oo \,, 2 \, & m_(i j) = oo \,) #h(2em) b_(i o) = b_(o i) = 1 quad \( i in S \) . $

Let $C$ be the symmetric matrix indexed by $hat(S)$ with diagonal entries $2$ and off-diagonal entries $- b_(i j)$. An edge means a pair with $b_(i j) > 0$; in particular a label $2$ gives no edge. The frame is not an Artin generator. If $T subset.eq hat(S)$, write $C_T$ for the corresponding principal submatrix, and write $partial T$ for the vertices outside $T$ adjacent to a vertex of $T$. This boundary includes the frame when appropriate.

We use the standard geometric representation of Coxeter systems: on root-coefficient vectors the simple reflection at $i$ is

#[#set math.equation(numbering: n => "(3.1)")
 $ s_i p = p - \( C p \)_i epsilon_i \, $ <eq:category-reflection>]

where $epsilon_i$ is the $i$th coordinate vector. Its restriction to the coordinates of a parabolic subsystem is its geometric representation. The standard Coxeter theorems identify spherical $T subset.eq S$ with the positive definite matrices $C_T$ #cite(label("Bourbaki2002")) Chapter V, §4, no. 8, Theorem 2. We also use the root-sign criterion for descents and the fact that reduced expressions are related by braid moves; these are Coxeter-system theorems, without a finiteness assumption on the ambient system #cite(label("Bourbaki2002")) Chapter IV, §1; Chapter V, §4, nos. 4 and 6. Whenever the chamber covering or a longest element is used below, the subsystem concerned has first been shown to be finite.

#thm([Lemma 3.1.])[
  #emph[For a spherical subset $T subset.eq S$, the inverse $C_T^(- 1)$ is entrywise nonnegative, and is strictly positive within each connected diagonal block. Prescribing the coordinates of $p$ outside $T$ therefore determines a unique vector harmonic on $T$, by which we mean $\( C p \) \|_T = 0$. Nonnegative prescribed coordinates give a nonnegative harmonic extension.]
  #emph[More generally, let $G$ be a nonempty connected vertex set. If $v_i > 0$ for $i in G$ and $C_G v gt.eq 0$ coordinatewise, then either $C_G$ is positive definite or $C_G v = 0$.]
] <lem:cartan-positive-null>

#proof[
  Write $C_T = 2 I - B_T$, where $B_T$ is symmetric and entrywise nonnegative. Positive definiteness implies that the largest eigenvalue of $B_T$ is less than $2$. The Perron–Frobenius bound for a nonnegative symmetric matrix then gives spectral radius less than $2$, so
  $ C_T^(- 1) = 1 / 2 sum_(n gt.eq 0) \( B_T \/ 2 \)^n . $
  This is nonnegative, and a path between any two vertices in the same block gives a strictly positive entry in some power. Harmonic extension is explicitly
  $ p_T = C_T^(- 1) B_(T \, hat(S) \\ T) p_(hat(S) \\ T) \, $
  which proves the first assertions, including uniqueness.
  For the last assertion, every real vector $x$ on $G$ satisfies
  #[#set math.equation(numbering: n => "(3.2)")
   $ x^(sans(t)) C_G x = sum_(i < j\
i \, j in G) b_(i j) v_i v_j (x_i / v_i - x_j / v_j)^2 + sum_(i in G) frac(\( C_G v \)_i, v_i) x_i^2 . $ <eq:category-scaled-form>]
  If at least one coordinate of $C_G v$ is positive, vanishing of this quadratic form forces all $x_i \/ v_i$ to be equal by connectedness, and then forces their common value to be zero. The form is therefore positive definite. If none is positive, the assumed inequalities say exactly that $C_G v = 0$. ◻
]

=== 3.2 Fusion labels <fusion-labels>

The ingredients are the Jones–Wenzl projectors and the spherical quotient by negligible maps. We recall their construction to fix the normalization; see Wenzl #cite(label("Wenzl1987")), Barrett–Westbury #cite(label("BarrettWestbury1999")) Theorem 2.9, and the Temperley–Lieb account in Chen #cite(label("Chen2014")) Sections 5.1–5.4. The finite semisimplicity below uses the specific projector decomposition, in addition to the general spherical quotient construction.

#thm([Proposition 3.2.])[
  #emph[There is a finite semisimple spherical $bb(C)$-linear tensor category $cal(C)$ with strictly positive real dimensions, and, for every ordered edge $\( s \, t \)$ of $hat(S)$, an object $D_(s t)^1$ of dimension $b_(s t)$, with $D_(t s)^1$ its dual, having the following properties. For every finite edge and simple objects $L \, L'$, 
$ dim_(bb(C)) "Hom"_(cal(C)) \( L \, D_(s t)^1 ⊗ L' \) lt.eq 1 . $

 On a label-$3$ edge or a frame edge one may take $D_(s t)^1 = upright(bold(1))$; on an infinite edge one may take $D_(s t)^1 = upright(bold(1)) xor upright(bold(1))$.]
] <prop:fusion-construction>

#proof[
  For each individual finite edge of label $m gt.eq 4$, use an independent Temperley–Lieb factor with circle value
  $ d_m = 2 cos \( pi \/ m \) \, #h(2em) \[ j \] = frac(sin \( j pi \/ m \), sin \( pi \/ m \)) . $
  Here is its construction. Begin with the pivotal diagram category whose objects are nonnegative tensor powers of a self-dual string and whose morphisms are $bb(C)$-linear combinations of planar pairings. Composition is stacking, a closed circle is replaced by $d_m$, and tensor product is juxtaposition. Closing a diagram gives its spherical trace. Take the additive idempotent completion, quotient by the ideal of negligible maps, and complete additively and idempotently again. A map $f : X arrow.r Y$ is negligible if $"tr" \( g f \) = 0$ for every $g : Y arrow.r X$. Cyclicity proves stability under composition, and partial trace proves stability under tensoring; hence this is a tensor ideal.
  For completeness, the idempotents and decompositions in this quotient can be obtained directly. Let $f_0$ and $f_1$ be the respective identity diagrams, and define, for $1 lt.eq j lt.eq m - 2$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ f_(j + 1) = p - frac(\[ j \], \[ j + 1 \]) p e_j p \, #h(2em) p = f_j ⊗ "id" \, $ <eq:category-jw-recursion>]
  where $e_j$ is the unnormalized cap–cup at the last two positions. All denominators in this recursion are nonzero. Inductively $f_j$ is idempotent, kills every elementary turnback on either side, and its partial trace over the last string is
  #[#set math.equation(numbering: n => "(3.4)")
   $ "ptr" \( f_j \) = frac(\[ j + 1 \], \[ j \]) f_(j - 1) #h(2em) \( 1 lt.eq j lt.eq m - 1 \) . $ <eq:category-jw-partial-trace>]
  Indeed the partial trace of the two terms defining $f_j$ is $d_m f_(j - 1) - \( \[ j - 1 \] \/ \[ j \] \) f_(j - 1)^2$, which is the right side of (3.4); the case $j = 1$ starts the induction. Sandwiched between the last cap–cups, $p$ consequently gives $\( \[ j + 1 \] \/ \[ j \] \) \( f_(j - 1) ⊗ e \)$, where $e$ is the last cap–cup. Since $p$ already factors through $f_(j - 1)$ on the first $j - 1$ strings, this identity shows that the subtracted term in (3.3) is a projection, proves idempotence of $f_(j + 1)$, and proves its turnback cancellation. The last cap and cup factor that projection through $f_(j - 1)$; their opposite composite is the nonzero scalar $\[ j + 1 \] \/ \[ j \]$. Thus its image is isomorphic to $f_(j - 1)$, giving
  #[#set math.equation(numbering: n => "(3.5)")
   $ f_j ⊗ f_1 tilde.equiv f_(j + 1) xor f_(j - 1) #h(2em) \( 1 lt.eq j < m - 1 \) . $ <eq:category-string-fusion>]
  Closing (3.4) gives $"tr" \( f_j \) = \[ j + 1 \]$.
  A planar pairing between the corners of $f_i$ and $f_j$ has a turnback unless $i = j$ and it is the straight pairing. Consequently these corners vanish for $i eq.not j$ and are one-dimensional for $i = j$. The object $f_(m - 1)$, whose trace is $\[ m \] = 0$, is therefore negligible. The objects $f_0 \, dots.h \, f_(m - 2)$ survive, are simple, and have positive dimensions $\[ 1 \] \, dots.h \, \[ m - 1 \]$. The decompositions (3.5), with $f_(m - 1)$ now zero, generate every tensor power from these objects. Thus the quotient is finite semisimple. Reflecting the diagrams gives the same fusion rule on the other side: the turnback-killing idempotent with straight coefficient one is unique, as follows by multiplying any two such idempotents. Duality and the spherical trace descend to the quotient and its completions. This proves all the stated properties of a single factor.
  Take the tensor product of these finitely many categories, with simple objects the tuples of simple objects in the factors and tensor product and Hom spaces given factorwise. If there are no such factors, take finite-dimensional vector spaces. For an edge of label $m gt.eq 4$, use the string object $f_1$ in its factor and units in the other factors. Tensoring by it has the path-$A_(m - 1)$ multiplicities in that factor and fixes the others, proving the multiplicity bound. The choices of units and two units cover the remaining edges. All dimensions are products of positive dimensions. Choose dual objects for opposite orientations and use the opposite pivotal evaluations on the two orientations. ◻
]

Fix representatives $"Irr" \( cal(C) \)$ of the simple objects, and put

$ w_L = dim_(cal(C)) L > 0 #h(2em) \( L in "Irr" \( cal(C) \) \) . $

The tensor category is not required to be symmetric. In what follows the labels are always tensored on the right, and evaluation of an edge and its dual occurs on the left of those labels.

=== 3.3 The graded algebra and its pairing <the-graded-algebra-and-its-pairing>

Ordinary zigzag algebras and their graded-symmetric pairing are developed by Huerfano–Khovanov #cite(label("HuerfanoKhovanov2001")) Section 3, Proposition 1. The following projective category is the basic-algebra realization of the fusion-labelled version; compare #cite(label("HengLicata2024")) Section 4.4, Proposition 4.13.

For $s in hat(S)$ and $X in cal(C)$ introduce an additive projective symbol $P_(s \, X)$. Besides $D_(s t)^1$ on edges, set $D_(s s)^0 = D_(s s)^2 = upright(bold(1))$ and set every unspecified $D_(s t)^a$ to zero. Define the length-$a$ morphisms by

#[#set math.equation(numbering: n => "(3.6)")
 $ "Hom"^a \( P_(s \, X) \, P_(t \, Y) \) = "Hom"_(cal(C)) \( X \, D_(s t)^a ⊗ Y \) . $ <eq:category-projective-hom>]

The length-zero units act as identities. For two length-one maps, composition is obtained by first tensoring their label maps and then applying

$ D_(s t)^1 ⊗ D_(t s)^1 arrow.r upright(bold(1)) = D_(s s)^2 $

on a backtrack. All other products of two positive lengths are zero. For opposite directions use the left and right pivotal evaluations. This is associative: the assertion involving a length-zero map is functoriality, and both products of any three positive lengths are zero.

An unfolded vertex is a pair $alpha = \( s \, L \)$ with $L$ simple. For a set of colors $T$ write $tilde(T) = T times "Irr" \( cal(C) \)$. Let $Z$ be the finite-dimensional basic graded algebra with

#[#set math.equation(numbering: n => "(3.7)")
 $ e_alpha Z e_beta = "Hom" \( P_alpha \, P_beta \) \, $ <eq:category-path-order>]

where multiplication is in path order. With this convention $P_alpha = Z e_alpha$ is a left projective and $"Hom"_Z \( Z e_alpha \, Z e_beta \) = e_alpha Z e_beta$ as required. Put $Q_alpha = e_alpha Z$ for the right projective. Let $U_alpha$ be the simple top of $Q_alpha$, concentrated in cochain and internal degrees zero. Decomposing $X$ into simples expresses $P_(s \, X)$ as a sum of the $P_alpha$’s. The algebra has only lengths $0 \, 1 \, 2$; length zero is the semisimple diagonal, and length two is one-dimensional on each unfolded diagonal. Write $t_alpha$ for the length-two token corresponding to $"id"_L$ when $alpha = \( s \, L \)$.

#thm([Lemma 3.3.])[
  #emph[The functional $tau : Z arrow.r bb(C)$ defined by 
$ tau \( t_(s \, L) \) = w_L \, #h(2em) tau \( Z^0 xor Z^1 \) = 0 $

 is a symmetric Frobenius trace of degree $- 2$. Thus $theta_alpha = t_alpha \/ w_L$ has trace one. The radical of $Z$ is $Z^(> 0)$, and the socle of each indecomposable left or right projective is its token subspace.]
  #emph[For every finite graded bimodule $M$, the adjoint dual has a natural bimodule identification 
#[#set math.equation(numbering: n => "(3.8)")
 $ M^or := "Hom"_(Z upright("-left")) \( M \, Z \) tilde.equiv D_(bb(C)) \( M \) chevron.l 2 chevron.r \, $ <eq:category-adjoint-duality>]

 where $D_(bb(C))$ is graded vector-space duality and $chevron.l a chevron.r$ raises degrees by $a$. It is an involutive contravariant equivalence, fixes the regular bimodule, and satisfies 
#[#set math.equation(numbering: n => "(3.9)")
 $ \( P_alpha ⊗_(bb(C)) Q_beta \)^or tilde.equiv \( P_beta ⊗_(bb(C)) Q_alpha \) chevron.l - 2 chevron.r . $ <eq:category-projective-dual>]

 In particular this duality preserves additive radicals.]
] <lem:category-frobenius>

#proof[
  The length-zero and length-two spaces pair perfectly. For length one, duality identifies maps $L' arrow.r D_(t s)^1 ⊗ L$ with maps $D_(s t)^1 ⊗ L' arrow.r L$. Pairing these against $L arrow.r D_(s t)^1 ⊗ L'$ by the semisimple trace is nondegenerate: on every simple summand the ordinary matrix trace is multiplied by its nonzero categorical dimension. This is exactly the backtrack pairing. Its symmetry is the pivotal partial-trace identity. Namely, the trace on $L$ of the first backtrack equals the trace on $D_(s t)^1 ⊗ L'$ of the opposite composite; taking partial trace in $D_(s t)^1$ gives the second pivotal cap and then the trace on $L'$. Hence $tau \( a b \) = tau \( b a \)$. This is ordinary symmetry; it has no sign from internal degree.
  The positive-length ideal is nilpotent and the quotient is the semisimple diagonal, so it is the radical. Tokens are annihilated by this radical. A nonzero length-one element has a nonzero product with a suitable opposite arrow by the perfect pairing, and a nonzero length-zero element has a nonzero product with its token. Therefore the token is the entire socle of each projective.
  For (3.8), send $f$ to $tau compose f$. A homogeneous $f$ of degree $k$ gives a functional of degree $k - 2$, which explains the shift $chevron.l 2 chevron.r$. Nondegeneracy of the trace gives the usual Frobenius identification for every finite left module. It respects both bimodule actions: with $\( a f b \) \( m \) = f \( m a \) b$ one has
  $ tau \( f \( m a \) b \) = tau \( b f \( m a \) \) = tau \( f \( b m a \) \) \, $
  which is the action $\( a lambda b \) \( m \) = lambda \( b m a \)$ on the vector dual. The shifted vector dual squares naturally to the identity, so this is a contravariant equivalence. Such an equivalence preserves the additive radical, characterized by invertibility of $1 - g f$ for all opposite maps $g$.
  The trace identifies $D_(bb(C)) \( P_alpha \) = Q_alpha chevron.l - 2 chevron.r$ and $D_(bb(C)) \( Q_beta \) = P_beta chevron.l - 2 chevron.r$. Vector duality reverses the factors of an external tensor product; combining its shift $- 4$ with the shift $+ 2$ in (3.8) proves (3.9). The same trace identifies $D_(bb(C)) \( Z \) chevron.l 2 chevron.r$ with $Z$. ◻
]

=== 3.4 Finite Coxeter unfoldings <finite-coxeter-unfoldings>

Fusion unfolding replaces labelled vertices by their simple constituents; see Heng–Licata #cite(label("HengLicata2024")) Section 8. For the chosen factors we prove the positivity and descent properties that will be needed for finite-type braid and termination arguments.

Define a symmetric matrix $tilde(C)$, indexed by unfolded vertices, with diagonal $2$ and off-diagonal entries

$ tilde(C)_(alpha beta) = - dim_(bb(C)) \( e_alpha Z^1 e_beta \) . $

Symmetry follows also from the perfect edge pairing. Define

#[#set math.equation(numbering: n => "(3.10)")
 $ \( phi.alt p \)_(s \, L) = w_L p_s . $ <eq:category-phi>]

Fusion and duality imply

#[#set math.equation(numbering: n => "(3.11)")
 $ tilde(C) phi.alt p = phi.alt C p . $ <eq:category-intertwining>]

Indeed, for fixed $L$ and an edge object $D$, the weighted sum of $dim "Hom"_(cal(C)) \( L \, D ⊗ L' \)$ over $L'$ is $dim \( D \) w_L$: adjunction identifies these multiplicities with those of $L'$ in $D^(*) ⊗ L$, whose dimension is $dim \( D \) w_L$. Equation (3.11) also holds on any color submatrix.

We write $D_L \( w \) = { s : ell \( s w \) < ell \( w \) }$ and $D_R \( w \) = { s : ell \( w s \) < ell \( w \) }$ for the left and right descent sets, where $s$ ranges over the simple generators of the Coxeter system in question.

#thm([Lemma 3.4.])[
  #emph[If $J subset.eq S$ is spherical, then $tilde(C)_(tilde(J))$ is positive definite and simply laced, and defines a finite Coxeter system. Replacing each original letter $s_i$, $i in J$, by the product of the commuting reflections in all vertices of its color gives a lift of words to this system. For every such word representing $w$, its lifted product $tilde(w)$ has 
#[#set math.equation(numbering: n => "(3.12)")
 $ D_L \( tilde(w) \) = accent(D_L \( w \), ̃) \, #h(2em) D_R \( tilde(w) \) = accent(D_R \( w \), ̃) . $ <eq:category-descents>]

 Reduced expressions lift to reduced expressions, and a reduced expression for the longest element of $W_J$ lifts to a reduced expression for the longest element of the unfolded system.]
] <lem:finite-unfolding>

#proof[
  The positive vector $v = phi.alt \( C_J^(- 1) upright(bold(1)) \)$ satisfies $tilde(C)_(tilde(J)) v = phi.alt upright(bold(1)) > 0$. Applying the scaled quadratic-form identity (3.2) to each connected component proves positive definiteness of the entire unfolded matrix. In particular this proves positivity on directions outside the image of $phi.alt$. An infinite edge cannot lie in $J$, since its two-by-two Cartan matrix is singular. The multiplicity assertion of Proposition 8 therefore makes every off-diagonal unfolded entry either $0$ or $- 1$. The finite Coxeter criterion applies.
  There are no edges between different vertices of a single color. Their reflections commute, and (3.11) shows that their product on a folded vector is the original reflection (3.1). Choose $p$ with $C_J p > 0$. Then $phi.alt p$ lies in the interior of a full unfolded fundamental chamber, since every row of $tilde(C)_(tilde(J)) phi.alt p$ is positive. For any word, intertwining identifies its image with $phi.alt \( w p \)$. The row at an unfolded vertex $alpha$ on this image tests the sign of $tilde(w)^(- 1) alpha$, while the corresponding original row tests the sign of $w^(- 1) alpha_i$.
  To see why this is a complete sign test, a root of either finite system has either all nonnegative or all nonpositive coefficients in the simple-root basis. Pairing it with one chamber-interior point is therefore strictly positive or strictly negative respectively. No assumption about the dimension of the folded subspace or about its orbit meeting every unfolded chamber is needed. The intertwining identity multiplies the original row by $w_L > 0$, proving the equality of left descent sets. Applying the same argument to reversed words proves the equality of right descent sets. The lifted product depends only on the original group element as well: a word for the identity fixes $phi.alt p$, and the stabilizer of a chamber-interior point in the finite unfolded reflection group is trivial #cite(label("Bourbaki2002")) Chapter V, §3, no. 3.
  Suppose an original reduced expression is extended by an ascent letter. Every vertex of its color is an ascent of the lifted prefix by (3.12). After one reflection of that color, the others remain ascents, because they are orthogonal to it. Consequently the whole block is a sequence of successive ascents. Induction proves reducedness of the lift. Finally the longest original element has every original simple reflection as a descent. Its lift has every unfolded simple reflection as a descent, and hence is the longest unfolded element. ◻
]

=== 3.5 Twist bimodules <twist-bimodules>

Two-term evaluation bimodules are the standard algebraic model for spherical twists. The inverse calculations below follow the method of Khovanov–Seidel #cite(label("KhovanovSeidel2002")) Section 2d, Proposition 2.4; for fusion-labelled zigzags see #cite(label("HengLicata2024")) Definition 5.2, Proposition 5.3.

All complexes are bounded cochain complexes of finite internally graded modules or bimodules. Differentials have cochain degree one and internal degree zero. The internal shift $chevron.l a chevron.r$ raises degrees by $a$, while $\[ 1 \]$ lowers cochain placements by one. Tensor products and Hom complexes use the ordinary cochain signs only; the internal grading contributes no additional signs. Graded Hom retains both degrees.

Put $M_alpha = P_alpha ⊗_(bb(C)) Q_alpha$. Multiplication gives $mu_alpha : M_alpha arrow.r Z$. The perfect trace pairing between $P_alpha$ and $Q_alpha$ gives the central tensor

$ delta_alpha \( 1 \) = sum_a p_a ⊗ q_a \, #h(2em) tau \( q_a p_b \) = delta_(a b) \, $

where the bases are homogeneous. It has internal degree two, and invariance of the pairing proves its centrality, so it defines a bimodule map $Z arrow.r M_alpha chevron.l - 2 chevron.r$. Define

#[#set math.equation(numbering: n => "(3.13)")
 $ B_alpha = \[ M_alpha arrow.r^(mu_alpha) Z \] \, #h(2em) D_alpha = \[ Z arrow.r^(delta_alpha) M_alpha chevron.l - 2 chevron.r \] \, $ <eq:category-twists>]

with $Z$ in cochain degree zero in both complexes. Thus the projective terms of $B_alpha \, D_alpha$ lie in degrees $- 1 \, 1$, respectively.

#thm([Lemma 3.5.])[
  #emph[There are bigraded bimodule chain homotopy equivalences 
$ B_alpha ⊗_Z D_alpha tilde.eq Z tilde.eq D_alpha ⊗_Z B_alpha . $

]
] <lem:category-twist-inverse>

#proof[
  The product has terms $M_alpha$ in degree $- 1$,
  $ Z xor P_alpha ⊗_(bb(C)) \( e_alpha Z e_alpha \) ⊗_(bb(C)) Q_alpha chevron.l - 2 chevron.r $
  in degree zero, and $M_alpha chevron.l - 2 chevron.r$ in degree one. Split the middle factor as $e_alpha Z e_alpha = bb(C) e_alpha xor bb(C) theta_alpha$. The incoming differential projects isomorphically, up to its cochain sign, onto the token summand. Explicitly, the token coefficient of $q p_a$ is $tau \( q p_a \)$, and the identity $sum_a tau \( q p_a \) q_a = q$ is the dual-basis identity. Cancel this degree-$- 1$/degree-zero isomorphism. The outgoing differential from the remaining unit summand is the identity onto $M_alpha chevron.l - 2 chevron.r$, by multiplication with $e_alpha$; cancel it as well. The remaining complex is the regular bimodule $Z$ in degree zero. These are Gaussian cancellations of actual bimodule complexes. In the reverse tensor order the dual-basis identity and unit multiplication give the same two cancellations, with the opposite tensor order and the prescribed cochain signs. ◻
]

We record the spherical-twist conjugation argument used for braid relations, following Seidel–Thomas #cite(label("SeidelThomas2001")) Lemma 2.11 and Propositions 2.12–2.13 with the required bimodule homotopies. For a bounded perfect left complex $P$, define its evaluation twist to be the bimodule cone

#[#set math.equation(numbering: n => "(3.14)")
 $ T_P = "Cone" #scale(x: 120%, y: 120%)[\(] P ⊗_(bb(C)) "Hom"_Z \( P \, Z \) arrow.r Z #scale(x: 120%, y: 120%)[\)] . $ <eq:category-evaluation-twist>]

It is unchanged up to homotopy by either shift of $P$. It is also unchanged under a homotopy equivalence of $P$: a chosen homotopy inverse and its homotopies identify the two evaluation morphisms up to homotopy and identify their cones. If $B$ is an invertible bimodule complex of the kind generated by (3.13), then

#[#set math.equation(numbering: n => "(3.15)")
 $ B ⊗_Z T_P ⊗_Z B^(- 1) tilde.eq T_(B ⊗_Z P) . $ <eq:category-conjugation>]

Here all terms of $B$ are finite projective on each side: they are sums of shifts of $Z$ and of $P_alpha ⊗_(bb(C)) Q_beta$. The left-module dual $B^or = "Hom"_Z \( B \, Z \)$, with the usual complex signs, is its tensor adjoint. The evaluation and coevaluation for finite projectives give the adjunction identities at chain level. Invertibility therefore identifies $B^or$ with $B^(- 1)$ in the bimodule homotopy category. Lemma 9 shows that these duals remain in the same class of terms. Tensor–Hom identifies the dual of $B ⊗_Z P$ with $"Hom"_Z \( P \, Z \) ⊗_Z B^or$, and under this identification the composed evaluations agree. Taking their cones proves (3.15).

#thm([Lemma 3.6.])[
  #emph[If there is no arrow between distinct unfolded vertices $alpha \, beta$, then $B_alpha B_beta tilde.eq B_beta B_alpha$. If there is exactly one arrow in each direction, then 
$ B_alpha B_beta B_alpha tilde.eq B_beta B_alpha B_beta . $

 Products here and below denote tensor products over $Z$.]
] <lem:category-local-braid>

#proof[
  In the first case $M_alpha M_beta = 0 = M_beta M_alpha$, so both products are the simultaneous evaluation cone with projective term $M_alpha xor M_beta$.
  In the second case, $B_alpha P_beta$ has the nonzero arrow $P_alpha chevron.l 1 chevron.r arrow.r P_beta$ in degrees $- 1 \, 0$. The complex $D_beta P_alpha$ has the nonzero arrow $P_alpha arrow.r P_beta chevron.l - 1 chevron.r$ in degrees $0 \, 1$. Nondegeneracy of the edge pairing makes both arrows nonzero, and their common Hom space is one-dimensional. Therefore
  $ B_alpha P_beta tilde.eq \( D_beta P_alpha \) chevron.l 1 chevron.r \[ 1 \] \, $
  after rescaling one term if needed. Their evaluation twists agree. Since $T_(P_gamma) = B_gamma$, conjugation gives
  $ B_alpha B_beta D_alpha tilde.eq D_beta B_alpha B_beta . $
  Multiplying on the left by $B_beta$ and on the right by $B_alpha$ gives the claimed braid relation. ◻
]

#thm([Proposition 3.7.])[
  #emph[For each original color $i$, let 
$ B_i = product_(alpha in accent({ i }, ̃)) B_alpha \, #h(2em) D_i = product_(alpha in accent({ i }, ̃)) D_alpha . $

 These products are independent of their order up to bimodule homotopy. The assignments $sigma_i mapsto B_i$ and $sigma_i^(- 1) mapsto D_i$ define an action of the original Artin group by invertible bimodule homotopy classes. For $x in A$ write $B_x$ for a representing complex, and write $F_i = B_i ⊗_Z -$ on left complexes.]
  #emph[For every $H in cal(C)$, right tensoring of labels, 
$ T_H \( P_(s \, X) \) = P_(s \, X ⊗ H) \, $

 is an additive functor on projectives that preserves path lengths and extends to their bounded homotopy category. It commutes naturally up to homotopy with the positive and inverse color twists, and hence with each $B_x ⊗_Z -$. All the action identities above are bimodule chain homotopy equivalences, so they remain valid upon tensoring with finite complexes of modules that are not projective.]
] <prop:twist-action>

#proof[
  Distinct vertices in a color have no mutual Hom spaces. Their twists commute by Lemma 12, and their products are inverse by Lemma 11. Moreover
  #[#set math.equation(numbering: n => "(3.16)")
   $ B_i tilde.equiv "Cone" (xor.big_(alpha in accent({ i }, ̃)) P_alpha ⊗_(bb(C)) Q_alpha arrow.r Z) : $ <eq:category-color-cone>]
  every mixed tensor term in the expansion vanishes by orthogonality.
  If $m_(i j) < oo$, the subsystem on ${ i \, j }$ is spherical. The two alternating words of length $m_(i j)$ are reduced expressions for its longest element. By Lemma 10, both lift to reduced expressions for the same longest element of its finite simply-laced unfolding. Matsumoto’s theorem relates these expressions by commutations and three-term braid moves, all of which hold for the bimodules by Lemma 12. This proves the original Artin relation. When $m_(i j) = oo$ there is no relation to verify. Thus the assignment defines the asserted homotopy action for every Coxeter matrix under consideration.
  On a morphism in (3.6), $T_H$ is right tensoring by $"id"_H$, with the associativity identifications. All cap multiplications are to the left of the label, so this preserves composition and path length. In the evaluation term of (3.16) applied to $P_(t \, Y)$, semisimplicity gives the canonical identification
  $ & xor.big_(a \, L) P_(i \, L) chevron.l a chevron.r ⊗_(bb(C)) "Hom"_(cal(C)) \( L \, D_(i t)^a ⊗ Y \)\
 & #h(35mm)  tilde.equiv xor.big_a P_(i \, D_(i t)^a ⊗ Y) chevron.l a chevron.r . $
  Its evaluation is the tautological label map. Tensoring this description on the right by $H$ is the same description with $Y$ replaced by $Y ⊗ H$, naturally in $Y$ and its projective morphisms. Hence the evaluation cones commute naturally with $T_H$ on projectives and on their complexes. Whiskering this natural commutation by the inverse equivalence proves the same assertion for $D_i$, without requiring $T_H$ itself to be invertible.
  Finally, tensoring an explicit chain homotopy and its equations with any module complex preserves those equations with the ordinary cochain tensor signs. The last assertion therefore follows from the homotopy-level inverse and braid calculations, without any flatness requirement on these additional module complexes. ◻
]

We will extract the height data from the images $B_x P_(o \, L)$ of the frame projectives, for $x in A$ and all simple labels $L$. Retaining the whole label family will allow us to combine its generator counts, using the positive label dimensions, into vectors indexed by the original colors and the frame. We first need to extract these counts from homotopy classes. The next section uses minimal complexes and groups their generators into layers according to $c + u$, where $c$ is the cochain placement and $u$ is the internal generator degree.

== 4 Layers and cohomological tests <sec:layers>

We turn the twist action into a calculus of generator layers. The objectives are to detect the top and socle of a layer by ordinary cohomology and to bound the layers created by a reduced spherical word. These bounds will make the later cap-preserving operations possible.

We work in the homotopy category of bounded complexes of finite graded left projective $Z$-modules. A differential has cochain degree $1$ and internal degree $0$. The internal shift $chevron.l u chevron.r$ raises internal degrees by $u$, whereas $\[ 1 \]$ lowers cochain placements by one. Thus a generator of a copy of $P_alpha chevron.l u chevron.r$ in cochain degree $c$ has #emph[level]

#[#set math.equation(numbering: n => "(4.1)")
 $ d = c + u . $ <eq:layers-level>]

Generator dimensions always count copies of projectives, rather than the vector-space dimensions of the projectives themselves.

=== 4.1 Minimal complexes and the linear heart <minimal-complexes-and-the-linear-heart>

A bounded projective complex is #emph[minimal] if each differential entry belongs to the graded radical of the additive category of projectives. Any invertible entry between shifted indecomposables can be removed by Gaussian elimination, splitting off a contractible two-term complex. There are finitely many summands, so this procedure ends in a minimal complex. Such a model is unique up to chain isomorphism: a homotopy equivalence between two minimal complexes is termwise invertible modulo the additive radical, since the homotopies are composed with radical differentials. Each term map is therefore invertible, by the Krull–Schmidt property of finite graded module terms. This also proves the corresponding minimality statement for any of the finite additive categories of module or bimodule terms used below.

In a minimal complex a nonzero differential entry has path length $a = 1$ or $2$. Its generator placements change by $\( 1 \, - a \)$, and hence its level changes by $1 - a$. The entries of length one preserve the level, and those of length two lower it by one. For a minimal complex $E$, let $Y^d \( E \)$ be the complex consisting of the generators of level $d$, with the length-one part of the differential. This is a complex: the length-two component of the equation $partial^2 = 0$ is exactly the square of its length-one part.

More concretely, write $V_(alpha \, c)^d \( E \)$ for the multiplicity space of $P_alpha chevron.l d - c chevron.r$ in cochain degree $c$. A coefficient of a length-one differential is a map

$ V_(alpha \, c)^d \( E \) arrow.r V_(beta \, c + 1)^d \( E \) $

for a chosen functional on $e_alpha Z^1 e_beta$. These coefficient maps satisfy the backtrack relation obtained by multiplying opposite arrows in $Z^2$. There are no other length-two products to impose. All these arrays are finite, and every coefficient arrow raises $c$. In particular their paths act nilpotently.

At an unfolded vertex $alpha$, the #emph[top] of such an array is the generator space modulo the images of all incoming coefficient maps, and its #emph[socle] is the common kernel of all outgoing coefficient maps. These spaces retain their cochain and internal placements. We write $"top"_alpha M$ and $"soc"_alpha M$ for them, and write $dim M_alpha$ for the sum of the generator multiplicities over all placements at $alpha$.

#thm([Lemma 4.1.])[
  (Layer structure).  #emph[The full subcategories defined by minimal generator levels $d lt.eq 0$ and $d gt.eq 0$ form a bounded $t$-structure. Its truncation $tau_(lt.eq k) E$ is represented by the subcomplex of a minimal model on levels at most $k$; the complementary quotient represents $tau_(gt.eq k + 1) E$.]
  #emph[The heart is equivalent to the abelian category of finite graded coefficient arrays just described. In particular, subobjects of a pure layer, after shifting that layer into the heart, are precisely graded subrepresentations of its array. The unshifted cohomology layer at $d$ is $Y^d \( E \)$.]
] <lem:layer-structure>

#proof[
  The level calculation shows that the indicated low terms form a subcomplex, with the indicated high quotient. An internal- and cochain-degree-zero map from a generator of level $d$ to one of level $e$ would require a path of length $d - e$. Consequently every such map from levels at most $0$ to levels at least $1$ is zero. This gives the required orthogonality. The cochain shift $\[ 1 \]$ decreases all levels by one, giving the two shift-closure axioms. The short exact sequence of low subcomplex, full complex, and high quotient gives the truncation triangle. There are finitely many occupied levels, so the $t$-structure is bounded.
  Between pure objects of the same level, a degree-zero map has only length-zero entries. It is therefore exactly a graded map of their multiplicity arrays commuting with the coefficient arrows. A cochain homotopy would have cochain degree $- 1$ and would require path length $- 1$, so there are no homotopies to quotient out. Conversely every finite array satisfying the backtrack relation defines a pure complex of projectives. Kernels and cokernels of array maps, taken in each graded coefficient space, still satisfy the relation. This identifies the heart with the asserted abelian category. Applying the truncations twice identifies its cohomology layers with the complexes $Y^d \( E \)$. ◻
]

We use the usual long exact cohomology sequence of a $t$-structure #cite(label("BBD1982")) Theorem 1.3.6. To distinguish it from the vector-space tests below, denote the heart-valued cohomology by $H_(upright("lay"))^d$; our conventions give

$ H_(upright("lay"))^d \( E \) = Y^d \( E \) \[ d \] \, #h(2em) H_(upright("lay"))^d \( E \[ 1 \] \) = H_(upright("lay"))^(d + 1) \( E \) . $

The corresponding fusion-category linear-heart construction appears in #cite(label("HengLicata2024")) §6.1.

An exact functor has #emph[layer amplitude] $\[ a \, b \]$ if it sends each pure layer at $d$ to levels in $\[ d + a \, d + b \]$. By bounded truncations, the same statement gives the corresponding bounds on an arbitrary interval of input levels.

#thm([Lemma 4.2.])[
  (Adjacent-layer exact sequences).  #emph[Suppose that an exact functor $F$ has layer amplitude $\[ 0 \, 1 \]$. For any $E$ and any $d$, there is a short exact sequence 
#[#set math.equation(numbering: n => "(4.2)")
 $ 0 arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^(d - 1) \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r Y^d \( F E \) arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^d \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 \, $ <eq:layers-adjacent-positive>]

 where all terms are shifted by $\[ d \]$ when regarded as objects of the heart. In particular their generator dimensions are additive.]
  #emph[For amplitude $\[ - 1 \, 0 \]$, the corresponding sequence is 
#[#set math.equation(numbering: n => "(4.3)")
 $ 0 arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^d \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r Y^d \( F E \) arrow.r Y^d #scale(x: 120%, y: 120%)[\(] F \( Y^(d + 1) \( E \) \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $ <eq:layers-adjacent-negative>]

]
] <lem:layers-amplitude-extension>

#proof[
  In the positive case apply $F$ to
  $ tau_(lt.eq d - 1) E arrow.r tau_(lt.eq d) E arrow.r Y^d \( E \) . $
  The first term has levels at most $d$, and the last term has levels $d \, d + 1$. The flanking groups in the long exact sequence at $d$ are $H_(upright("lay"))^(d - 1) F \( Y^d \( E \) \)$ and $H_(upright("lay"))^(d + 1) F \( tau_(lt.eq d - 1) E \)$; both are zero. This gives a short exact sequence at that level. Applying $F$ to the truncation below $d - 1$ identifies its left term with the one in (4.2), since levels at most $d - 2$ map to levels at most $d - 1$. Applying it to the truncation above $d$ identifies the middle term with $Y^d \( F E \)$, since levels at least $d + 1$ remain at least $d + 1$.
  For the negative case use $tau_(lt.eq d) E arrow.r tau_(lt.eq d + 1) E arrow.r Y^(d + 1) \( E \)$. After $F$ the first term has levels at most $d$, and the last has levels $d \, d + 1$. The same exact-sequence argument, now discarding input levels below $d$ and above $d + 1$, gives (4.3). ◻
]

#thm([Lemma 4.3.])[
  (Composition at the bottom).  #emph[Suppose that each of $F_1 \, dots.h \, F_r$ is exact and has no negative change of layer level. Starting from a pure layer at $d$, the level-$d$ part of $F_r dots.h.c F_1$ is obtained by retaining only the level-$d$ part after each intermediate operation. In particular, any relation between such composed functors gives the corresponding relation between their operations on the bottom layer.]
] <lem:layers-bottom-composition>

#proof[
  After the first operation the quotient by its level-$d$ truncation has levels at least $d + 1$. Every subsequent functor keeps that quotient in levels at least $d + 1$. The long exact sequence therefore identifies bottom cohomology before and after discarding it. Repeat this argument at each step. ◻
]

=== 4.2 Extremal tests and single twists <extremal-tests-and-single-twists>

When vector-space cohomology retains both gradings, we write $H^t \( V \)$ for the direct sum of its cohomology spaces whose cochain degree plus internal degree is $t$. Differentials raise this total degree by one. Only cochain degrees enter the signs.

#thm([Lemma 4.4.])[
  (Extremal cohomological tests).  #emph[For a pure layer $M$ at level $d$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ H^d \( e_alpha M \) tilde.equiv "soc"_alpha M \, #h(2em) H^(d + 2) \( e_alpha M \) tilde.equiv \( "top"_alpha M \) chevron.l 2 chevron.r \, $ <eq:layers-extremal-tests>]

 as graded multiplicity spaces, with their corresponding placements. The shift on the top is the internal placement of the token. If a minimal complex $E$ has no generators above $d$ at $alpha$ or its neighbors, its test in degree $d + 2$ is still $\( "top"_alpha Y^d \( E \) \) chevron.l 2 chevron.r$, and all higher test cohomology there vanishes. If it has no generators below $d$ at those vertices, its test in degree $d$ is the socle of $Y^d \( E \)$ at $alpha$.]
  #emph[A nonzero pure layer supported on a vertex set has a nonzero top and a nonzero socle somewhere in that set.]
] <lem:layers-extremal-tests>

#proof[
  For a pure layer at $d$, the paths in $e_alpha M$ have lengths $0 \, 1 \, 2$, and their total degrees are respectively $d \, d + 1 \, d + 2$. At the length-zero end, being a cycle means being killed by every outgoing coefficient map. At the token end, the incoming maps span exactly the images of the incoming coefficient maps, because the opposite-arrow pairing is nondegenerate. This proves (4.4).
  For the upper assertion, every term of $e_alpha E$ comes from a generator at $alpha$ or a neighbor. Its actual total degree is its generator level plus its path length, and is therefore at most $d + 2$. At degree $d + 2$ only the level-$d$ token terms occur. Their incoming differential consists of the indicated linear maps: any additional contribution would need a higher generator at the same vertex or a neighbor. The lower assertion follows in the same way from the length-zero end. Finally, the coefficient arrows strictly raise cochain placement in a finite array. Iterating them cannot avoid a socle, and iterating incoming images cannot generate a nonzero array with zero top everywhere. ◻
]

Let $F_i = B_(sigma_i) \( - \)$ be the positive color twist from Proposition 13. Write $r_i$ for the product of the commuting coordinate reflections in its unfolded fiber. On vectors of generator multiplicities this changes only that fiber.

#thm([Lemma 4.5.])[
  (Positive layers).  #emph[Each $F_i$ has layer amplitude $\[ 0 \, 1 \]$. Its upper piece on a pure layer $M$ at $d$ is supported on the fiber of $i$, has no arrows, and has multiplicity $dim "top"_alpha M$ at a vertex $alpha$ of that fiber. Its bottom piece has unchanged multiplicities at all other vertices, and at $alpha$ in the fiber it has multiplicity 
#[#set math.equation(numbering: n => "(4.5)")
 $ dim Y^d \( F_i M \)_alpha = sum_beta \( 2 "id" - tilde(C) \)_(alpha beta) dim M_beta - dim M_alpha + dim "top"_alpha M . $ <eq:layers-positive-dimension>]

 The bottom piece has zero socle in color $i$. If $M$ has zero socle in every color of a set $J$ containing $i$, its bottom piece after $F_i$ also has zero socle in all of $J$.]
  #emph[For any bounded left complex $E$, without a projectivity assumption on its terms, there is a natural homotopy equivalence of test complexes 
#[#set math.equation(numbering: n => "(4.6)")
 $ e_alpha F_i E tilde.eq \( e_alpha E \) chevron.l 2 chevron.r \[ 1 \] #h(2em) \( alpha upright(" of color ") i \) . $ <eq:layers-positive-test-shift>]

 There is the identical statement for right complexes tested on the right.]
] <lem:positive-layer>

#proof[
  For pure input at $d$, the simultaneous evaluation cone inserts generators in color $i$ at levels $d + a - 1$, for path lengths $a = 0 \, 1 \, 2$. Those at $d - 1$ are the length-zero evaluation copies. Their maps to the old generators of color $i$ are identities modulo the additive radical. Cancelling these pairs removes all generators below $d$. None were inserted above $d + 1$, proving the amplitude bound. Only the acted color can occur above $d$.
  For one vertex $alpha$ of this color put $A = e_alpha E$. All other vertices of the same color are orthogonal to it, so its simultaneous test is
  #[#set math.equation(numbering: n => "(4.7)")
   $ "Cone" #scale(x: 120%, y: 120%)[\(] A xor A chevron.l 2 chevron.r arrow.r^(\( "id" \, theta_alpha \)) A #scale(x: 120%, y: 120%)[\)] . $ <eq:layers-token-cone>]
  Projection onto the token source summand $A chevron.l 2 chevron.r \[ 1 \]$ is a chain map with kernel the cone of $"id"_A$. It is therefore a homotopy equivalence, proving (4.6) for arbitrary input. The same calculation works on the right. For pure input, the degree-$d + 3$ test on the output is the old degree-$d + 2$ test. Lemma 17 identifies it with the upper generator multiplicities and with the old top, respectively. There are no arrows among the vertices of the upper piece.
  For completeness, signed generator counts are computed with $\( - 1 \)^d$. A contractible scalar pair has consecutive levels, so its two signed contributions cancel. In the cone for one vertex, the inserted signed contribution from a generator at $beta$ is minus the alternating path count $2 delta_(alpha beta) - \( 2 "id" - tilde(C) \)_(alpha beta)$. Thus the total signed vector transforms by $r_i$. Since the output has only levels $d \, d + 1$, subtracting its upper vector from its bottom vector gives $r_i dim M$. The upper vector is the old top. At the acted fiber this gives (4.5); outside it the multiplicities are unchanged.
  At a vertex of color $i$, the degree-$d$ test of $F_i M$ is zero by (4.6), so its bottom socle is zero. For a vertex $beta$ of another color the evaluation triangle for $e_beta F_i M$ has first term a sum of copies of $\( e_alpha M \) chevron.l 1 chevron.r$, with $alpha$ in the acted fiber adjacent to $beta$. Its cohomology at $d$ is zero, and its cohomology at $d + 1$ is a sum of the old socles at those $alpha$. If the socles in $J$ vanish, the long exact sequence at $d$, together with the old socle vanishing at $beta$, gives the claimed vanishing at $beta$ after the move. ◻
]

#thm([Lemma 4.6.])[
  (Inverse amplitude).  #emph[If an exact equivalence $F$ has layer amplitude $\[ 0 \, 1 \]$, its inverse has amplitude $\[ - 1 \, 0 \]$. In particular each $F_i^(- 1)$ has that amplitude and satisfies 
#[#set math.equation(numbering: n => "(4.8)")
 $ e_alpha F_i^(- 1) E tilde.eq \( e_alpha E \) chevron.l - 2 chevron.r \[ - 1 \] #h(2em) \( alpha upright(" of color ") i \) \, $ <eq:layers-negative-test-shift>]

 with the analogous formula for right complexes.]
  #emph[For either sign, acting in color $i$ leaves the generator multiplicities in every layer unchanged at all other colors.]
] <lem:layers-inverse-amplitude>

#proof[
  It suffices to test the inverse on a heart object $X$. If $A$ has levels at most $- 2$, then $F A$ has levels at most $- 1$, whence
  $ "Hom" \( A \, F^(- 1) X \) = "Hom" \( F A \, X \) = 0 . $
  Orthogonality implies that $F^(- 1) X$ has levels at least $- 1$. If $B$ has levels at least $1$, then $F B$ does also, and
  $ "Hom" \( F^(- 1) X \, B \) = "Hom" \( X \, F B \) = 0 . $
  It follows that $F^(- 1) X$ has levels at most $0$. This proves the inverse bound; shifting proves it for every pure level. Formula (4.8) follows by applying (4.6) to $F_i^(- 1) E$ and using invertibility. This argument is at the homotopy level also for nonprojective test inputs.
  For $beta$ outside the acted color, the right simple $U_beta$ satisfies
  $ U_beta B_(sigma_i)^(plus.minus 1) tilde.eq U_beta \, $
  because all the inserted projective bimodule terms have left vertex in color $i$. Tensoring a minimal left projective complex with $U_beta$ kills its radical differential and counts precisely its generators at $beta$, with both placements retained. The displayed identity therefore proves the last assertion in every layer. ◻
]

=== 4.3 Positive divisors detected by cohomology <positive-divisors-detected-by-cohomology>

Fix a spherical subset $J$. Its unfolding is a finite simply-laced Coxeter system by Lemma 10. In the next two lemmas the letters are its individual unfolded vertices. For a bounded left complex $X$ put

#[#set math.equation(numbering: n => "(4.9)")
 $ h_J \( X \) = max { t : H^t \( e_alpha X \) eq.not 0 upright(" for some ") alpha in tilde(J) } \, $ <eq:layers-test-height>]

and set $h_J \( X \) = - oo$ if all these tests vanish. For right complexes replace $e_alpha X$ by $X e_alpha$. The statements require only bounded test cohomology; the input need not be a projective complex.

The next two lemmas use the extreme-degree method of Brav–Thomas #cite(label("BravThomas2011")) Lemma 3.3 and Proposition 3.1. They work with finite ADE configurations of $2$-spherical objects. We give the total-degree calculation on both module sides, including the nonprojective right simples needed below, and then pass from unfolded vertices to the original colors.

#thm([Lemma 4.7.])[
  (Change of test height).  #emph[For a positive unfolded letter $alpha$, if $h_J \( X \)$ is finite, 
$ h_J \( X \) lt.eq h_J \( B_alpha X \) lt.eq h_J \( X \) + 1 . $

 An increase occurs exactly when $alpha$ is an old highest-test vertex; in that case it is the only new highest-test vertex. Vanishing of all tests persists. The same assertions hold for right actions.]
] <lem:layers-height-change>

#proof[
  The test at $alpha$ shifts up by one in total degree. A nonneighbor’s test is unchanged. At a neighbor $beta$ in $tilde(J)$ the evaluation triangle is
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( e_alpha X \) chevron.l 1 chevron.r arrow.r e_beta X arrow.r e_beta B_alpha X . $ <eq:layers-neighbor-triangle>]
  If the old maximum is $t$, the neighboring new tests cannot exceed $t$. Thus the maximum rises precisely when the test at $alpha$ was nonzero at $t$, and only $alpha$ attains $t + 1$. If its old maximum was $t - 1$, its shifted test reaches $t$. If it was below $t - 1$, any nonzero old degree-$t$ test at another vertex survives, by the long exact sequence of (4.10). This proves monotonicity. The same triangles prove persistence of total vanishing. Reversing the module sides proves the right-action statements. ◻
]

#thm([Lemma 4.8.])[
  (Top-divisor test).  #emph[Let $b$ be a positive word in the unfolded finite-type Artin generators. If 
$ h_J \( B_b X \) > h_J \( X \) \, $

 then every unfolded vertex attaining the highest test cohomology of $B_b X$ is a left divisor of $b$ in the positive Artin monoid. For a right action, every such vertex is a right divisor of $b$. These assertions hold for arbitrary inputs with bounded test cohomology, including complexes of right simples.]
] <lem:top-divisor>

#proof[
  We prove the left statement by induction on the positive word length, writing $b = alpha b'$ and $Y = B_(b') X$. If this last action raises height, its only new top vertex is $alpha$, and the assertion follows immediately. Otherwise let $h_J \( Y \) = h_J \( B_alpha Y \) = t > h_J \( X \)$. The top vertex $alpha$, if present, already left-divides $b$. A top vertex $beta eq.not alpha$ not adjacent to $alpha$ was a top of $Y$; by induction it divides $b'$, and it commutes past $alpha$.
  It remains to treat an adjacent top vertex $beta$. Since height did not rise, $H^t \( e_alpha Y \) = 0$. The triangle (4.10) gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ H^t \( e_beta B_alpha Y \) = "coker" #scale(x: 120%, y: 120%)[\(] H^(t - 1) \( e_alpha Y \) arrow.r H^t \( e_beta Y \) #scale(x: 120%, y: 120%)[\)] . $ <eq:layers-divisor-cokernel>]
  The nonzero cokernel implies that $beta$ was a top of $Y$. Induction allows $b' = beta v$ using positive relations. Put $Z_0 = B_v X$, so $Y tilde.eq B_beta Z_0$.
  We identify the arrow in (4.11) directly. Set $A = e_beta Z_0$, $C = e_alpha Z_0$, and choose arrows
  $ r in e_alpha Z e_beta \, #h(2em) s in e_beta Z e_alpha \, #h(2em) s r = kappa theta_beta \, quad kappa eq.not 0 . $
  The two test complexes are
  $ e_beta Y = "Cone" #scale(x: 120%, y: 120%)[\(] A xor A chevron.l 2 chevron.r arrow.r^(\( "id" \, theta_beta \)) A #scale(x: 120%, y: 120%)[\)] \, #h(2em) e_alpha Y = "Cone" #scale(x: 120%, y: 120%)[\(] A chevron.l 1 chevron.r arrow.r^r C #scale(x: 120%, y: 120%)[\)] . $
  Let $pi : e_beta Y arrow.r A chevron.l 2 chevron.r \[ 1 \]$ be the token projection of (4.7). The arrow $s : \( e_alpha Y \) chevron.l 1 chevron.r arrow.r e_beta Y$ maps its source summand to $kappa$ times the token source summand, and maps its target summand into the target $A$, which $pi$ kills. Thus $pi s$ is exactly $kappa$ times the connecting projection of the second cone, up to a cochain sign. This is an identity of chain maps and needs no projectivity of $Z_0$.
  Since $pi$ is a homotopy equivalence, exactness of the second cone identifies the image of the map in (4.11) with
  #[#set math.equation(numbering: n => "(4.12)")
   $ ker #scale(x: 120%, y: 120%)[\(] H^(t - 1) \( e_beta Z_0 \) arrow.r H^t \( e_alpha Z_0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:layers-divisor-kernel>]
  The cokernel is nonzero, so the last map has nonzero image. Consequently $H^t \( e_alpha Z_0 \) eq.not 0$. Height monotonicity gives $h_J \( Z_0 \) lt.eq h_J \( Y \) = t$, hence $h_J \( Z_0 \) = t > h_J \( X \)$. Induction applied to $v$ makes $alpha$ a left divisor of $v$. Writing $v = alpha v'$ and using the three-term braid gives
  $ b = alpha beta alpha v' = beta alpha beta v' \, $
  which extracts $beta$ as required. All cases of the induction are proved. The right-sided cones and the opposite arrows give the right-divisor assertion by the same argument. ◻
]

A negative lift of a Coxeter expression is obtained by replacing each letter by its inverse Artin generator, without reversing the order.

#thm([Corollary 4.9.])[
  (Reduced-word amplitude).  #emph[For spherical $J$, a positive lift of any reduced expression in $W_J$ has layer amplitude $\[ 0 \, 1 \]$. A negative lift of a reduced expression has amplitude $\[ - 1 \, 0 \]$.]
] <cor:reduced-amplitude>

#proof[
  First consider a reduced unfolded word. Its test height can increase at most once. Indeed, at a second increase the new letter was a highest-test vertex of the preceding result, whose height already exceeded the starting one. By Lemma 21 that letter could be extracted on the last-action side of the preceding positive word. Prepending it would then give two equal consecutive Coxeter generators, contrary to reducedness.
  A pure input layer at $d$ has $h_J lt.eq d + 2$. Positives never produce a layer below $d$. Suppose that the output’s highest layer had level $a > d + 1$. Outside $tilde(J)$ generator multiplicities in each layer are unchanged, so that highest layer is supported in $tilde(J)$. It has a nonzero top there. Lemma 17 would give a test at degree $a + 2 > d + 3$, contrary to the preceding height bound. If the input tests all vanish, they remain zero and give the same contradiction. This proves the positive bound in the unfolding.
  By Lemma 10, reduced expressions in $W_J$ lift to reduced unfolded expressions, so the bound holds for their positive color actions. The inverse of a negative reduced lift is a positive reduced lift of the reversed expression. Lemma 19 therefore gives the negative bound. ◻
]

== 5 Weighted height data and convex subobjects <sec:height-data>

This section packages the layer counts by original colors and proves the two properties needed for their later comparisons. When the boundary layers vanish above a chosen level, we can choose a representative in the spherical coset with the same upper-layer vanishing on its type. A uniform lower bound on the remaining layer then produces actual subrepresentations through a convex-hull argument.

For $x in A$ and a simple object $L$ of $cal(C)$, consider the left projective complex

#[#set math.equation(numbering: n => "(5.1)")
 $ E_L \( x \) = B_x P_(o \, L) \, #h(2em) Y_L^d \( x \) = Y^d \( E_L \( x \) \) . $ <eq:height-data-frame-family>]

The family member with label $L$ is assigned weight $w_L = dim_(cal(C)) L > 0$. All layer multiplicities below are computed in minimal models. Their independence of those models follows from Lemma 14.

=== 5.1 Label tensoring and proportionality <label-tensoring-and-proportionality>

#thm([Lemma 5.1.])[
  (Tensoring and canonical truncations).  #emph[For $H in cal(C)$, right tensoring of all projective labels by $H$ defines a $t$-exact functor $T_H$ for the layer $t$-structure. It commutes naturally with its truncations, layers, and all the color twist functors and their inverses.]
  #emph[In particular, if a subobject is constructed by applying a word of twists, taking a layer truncation, and applying the inverse word, this construction commutes with $T_H$ as a morphism into the ambient object. No choice of minimal model or Gaussian elimination is required to be natural.]
] <lem:height-data-tensor-truncation>

#proof[
  Proposition 13 supplies the additive functor $P_(s \, X) mapsto P_(s \, X ⊗ H)$ and its natural commutation with twists. It extends termwise to complexes and commutes with cones and shifts. A positive-length differential entry remains of positive length after tensoring and decomposing the labels. Hence a minimal model stays minimal, with the same cochain and internal placements. Both halves of the layer $t$-structure are preserved, proving $t$-exactness.
  The images under a $t$-exact functor of the two objects in a truncation triangle still have the required bounds. The uniqueness of $t$-truncations therefore gives natural commutation with $tau_(lt.eq d)$ and $tau_(gt.eq d)$, and with the induced layers. Commutation with inverse twists follows from the natural commutation with the positive equivalences. Finally a truncation-defined subobject is a composite of a canonical truncation map with the unit or counit of the inverse equivalences. The preceding natural isomorphisms commute with that composite. One may subsequently represent the resulting pure objects and subobjects by their coefficient arrays using Lemma 14. ◻
]

#thm([Lemma 5.2.])[
  (Proportionality of the frame family).  #emph[There are nonnegative vectors $m^d \( x \) in bb(R)^(hat(S))$ such that the weighted generator dimension vector of the layer family is 
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_L w_L dim Y_L^d \( x \) = phi.alt m^d \( x \) . $ <eq:height-data-proportionality>]

 The weighted top and socle dimension vectors of these layers also have the form $phi.alt v$. Consequently, if a top or socle occurs anywhere in a color in the family, then at every unfolded vertex of that color it occurs in at least one member of the family.]
  #emph[For each $x$ the vectors $m^d \( x \)$ have finite support in $d$. Uniformly over $x$, $d$, and the colors, each coordinate has only finitely many possible values in a bounded interval. Operations on the left by $sigma_i^(plus.minus 1)$ change $m^d$ only in coordinate $i$, and 
#[#set math.equation(numbering: n => "(5.3)")
 $ m_o^d \( x \) = cases(delim: "{", 1 \, & d = 0 \,, 0 \, & d eq.not 0 .) $ <eq:height-data-frame-coordinate>]

 On folded signed counts, either twist in color $i$ acts by the coordinate reflection for $C$: 
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_d \( - 1 \)^d m^d \( sigma_i^(plus.minus 1) x \) = s_i (sum_d \( - 1 \)^d m^d \( x \)) . $ <eq:height-data-signed-reflection>]

]
] <lem:family-proportionality>

#proof[
  Let $upright(bold(1))$ be the unit label. Natural label equivariance gives
  $ E_L \( x \) tilde.eq T_L E_(upright(bold(1))) \( x \) \, #h(2em) Y_L^d \( x \) tilde.eq T_L Y_(upright(bold(1)))^d \( x \) . $
  For an object $X in cal(C)$ and a simple label $H$, rigidity and semisimplicity give
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_L w_L \[ X ⊗ L : H \] = w_H dim_(cal(C)) X . $ <eq:height-data-weighted-fusion>]
  Indeed $\[ X ⊗ L : H \]$ is the multiplicity of $L$ in $X^(*) ⊗ H$, by adjunction. Summing the dimensions of these simple summands gives $dim \( X^(*) ⊗ H \) = dim \( X \) dim \( H \)$.
  In a minimal representative of $E_(upright(bold(1))) \( x \)$, collect the projective labels at each color and pair of placements into an object $X in cal(C)$. Tensoring that summand by $L$ gives $P_(s \, X ⊗ L)$ with unchanged placements. Applying (5.5) and summing over the placements of a fixed level gives (5.2).
  The same argument applies to tops and socles, as follows. For any such projective complex and any color $s$, its test at $\( s \, H \)$ is obtained by applying $"Hom"_(cal(C)) \( H \, - \)$ to a complex of objects of $cal(C)$: a term of type $P_(t \, X)$ contributes $D_(s t)^a ⊗ X$ at path length $a$, with the given placements. The maps are induced by the same $D$-multiplications as the projective differential. Tensoring labels by $L$ tensors this entire label complex on the right by $L$. Tensoring in the semisimple category is exact, so it commutes with its cohomology. Apply (5.5) to the cohomology in the two extremal total degrees from Lemma 17. This proves the proportionality for both tops and socles. Since every $w_H$ and every family weight is positive, a nonzero proportional coordinate at one label is nonzero at all labels of that color, proving the occurrence assertion.
  There are finitely many family members and finitely many generators in each of their complexes, proving finite level support. Fixing one simple label $H$ in (5.2) writes $m_s^d$ as a nonnegative integer combination of the finitely many positive numbers $w_L \/ w_H$. Below a fixed bound, each integer coefficient is bounded. Thus there are only finitely many values; irrational label dimensions cause no accumulation through cancellation.
  The outside-color statement follows from the right-simple test in Lemma 19. In particular $U_(o \, H) B_x tilde.eq U_(o \, H)$, because the frame is never acted on. Its tensor product with $P_(o \, L)$ is one copy of $bb(C)$ in placements $\( 0 \, 0 \)$ when $H = L$, and is zero otherwise. The weighted count is therefore $w_H$ in level zero and zero in the other levels. This proves (5.3).
  Finally, the signed calculation in Lemma 18 gives the unfolded reflection on generator counts. Its inverse acts by the same reflection, which is an involution. The identity $tilde(C) phi.alt = phi.alt C$ in (3.11) folds this to (5.4). ◻
]

For later normalizations set

#[#set math.equation(numbering: n => "(5.6)")
 $ D_0 = sum_L w_L^2 . $ <eq:height-data-D0>]

In particular the ordinary dot product of two proportional arrays is $\( phi.alt p \)^(sans(t)) \( phi.alt y \) = D_0 p^(sans(t)) y$.

=== 5.2 Caps and spherical accessibility <caps-and-spherical-accessibility>

#prodef([Definition 5.3.])[
  (Cap).  For $q in bb(Z)$ and $K subset.eq hat(S)$, the data at a representative $x$ are #emph[capped at $q$ on $K$] if
  $ m_i^d \( x \) = 0 #h(2em) \( i in K \, d > q \) . $
  For a set of colors $J$, let $partial J$ denote its outside neighbors in the framed diagram; it includes the frame when the frame is a neighbor. Positivity of the family weights makes a cap equivalent to the absence of generators in all the corresponding unfolded vertices and levels in every member of the family.
] <def:height-data-cap>

The exterior coordinates of every $m^d$ are constant on a coset $A_J x$, by Lemma 24. All caps imposed on sets outside $J$ are therefore independent of the choice of representative in that coset.

We first isolate how a cap interacts with layers outside the operated region. A complex supported on colors outside $J union partial J$ has zero test at every unfolded vertex of $J$. Its positive evaluation and negative coevaluation terms in $J$ vanish, so every twist in $J$ acts on that complex as the identity.

#thm([Lemma 5.4.])[
  (A layer under a capped negative operation).  #emph[Let $E$ be a bounded minimal projective complex with no generators above $q$ on $J union partial J$. If $G$ is a word of negative twists in $J$, then 
#[#set math.equation(numbering: n => "(5.7)")
 $ Y^q \( G E \) tilde.eq Y^q #scale(x: 120%, y: 120%)[\(] G \( Y^q \( E \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:height-data-capped-layer>]

 Moreover $G E$ still has no generators above $q$ on $J union partial J$.]
] <lem:height-data-capped-layer>

#proof[
  Let $R = tau_(gt.eq q + 1) E$. By the cap, every generator of $R$ is outside $J union partial J$, so $G R tilde.eq R$ by the preceding observation. Negative twists do not increase levels. Apply $G$ to
  $ tau_(lt.eq q) E arrow.r E arrow.r R . $
  The first term has levels at most $q$, and the third is the unchanged complex $R$ in levels at least $q + 1$. The long exact sequence identifies level $q$ of $G E$ with level $q$ of $G tau_(lt.eq q) E$, and all higher layers with the corresponding layers of $R$. These higher layers remain outside the operated region, proving cap preservation. Now apply $G$ to
  $ tau_(lt.eq q - 1) E arrow.r tau_(lt.eq q) E arrow.r Y^q \( E \) . $
  Its first term still has levels at most $q - 1$, giving (5.7) by the long exact sequence. This argument does not require that $G$ be a reduced word. ◻
]

#thm([Lemma 5.5.])[
  (Cap accessibility).  #emph[Let $J subset.eq S$ be spherical, let $q in bb(Z)$, and suppose the data at $x$ are capped at $q$ on $partial J$. There exists $z in A_J x$ whose data are capped at $q$ on $J union partial J$.]
  #emph[Every negative generator in $J$ preserves an existing cap at $q$ on $J union partial J$. At a representative with this joint cap, a positive $F_i$, $i in J$, also preserves it whenever 
$ "top"_alpha Y_L^q = 0 #h(2em) upright("for every ") L upright(" and every ") alpha upright(" of color ") i . $

]
] <lem:cap-accessibility>

#proof[
  Negative preservation follows by applying Lemma 26 to each family member. For the positive assertion use the same high quotient $R = tau_(gt.eq q + 1) E_L$. It is unchanged by $F_i$. On $tau_(lt.eq q) E_L$ the only possible level $q + 1$ contribution is the upper piece of $F_i Y_L^q$: input levels below $q$ can rise by at most one. By Lemma 18, this upper piece is the old top at color $i$, and vanishes under the hypothesis. The low part therefore stays at levels at most $q$, while the high quotient stays outside $J union partial J$. This proves the positive cap assertion.
  For accessibility there is nothing to prove if $J$ is empty or already capped. Otherwise let $t > q$ be the largest level with nonzero data on $J$. The joint cap at $t$ holds on $J union partial J$. In each $Y_L^t$ the part supported on $tilde(J)$ is a direct summand, because all boundary generators at that level vanish. If these parts are nonzero, some member has a nonzero top at a color $i in J$. Apply $F_i^(- 1)$ and repeat while level $t$ persists. All these moves preserve the joint cap at $t$.
  We show that the chosen colors form a reduced expression in $W_J$, read in their order of action. Suppose the current negative word represents a reduced Coxeter expression $w$. Every left descent $j$ of $w$ can occur as its last-action letter, since reduced expressions are related by braid moves. The corresponding negative Artin words are related by the same braid moves. In that expression, let $E'_L$ be the family immediately before its last $F_j^(- 1)$. All preceding negative moves preserve the joint $t$-cap. For $alpha$ in color $j$, Formula (4.8) and Lemma 17 give
  $ H^(t + 2) \( e_alpha F_j^(- 1) E'_L \) = H^(t + 3) \( e_alpha E'_L \) = 0 . $
  Thus the current level-$t$ top vanishes in every descent color. A chosen nonzero top must be at a left ascent, so appending its action increases Coxeter length. This proves the induction from the empty word.
  The finite group $W_J$ has a longest length. Therefore level $t$ must disappear after at most that many chosen moves. Negative operations cannot recreate a larger level. Repeating at the next largest excess level terminates, since the initial largest level is finite and each stage decreases it toward $q$. All operations lie in $A_J$, and the exterior data stay fixed, proving the required accessibility. ◻
]

=== 5.3 Convex subobjects of a capped layer <convex-subobjects-of-a-capped-layer>

Let $J$ be spherical. Given nonnegative data on its complement, there is a unique vector agreeing with those data outside $J$ and harmonic on $J$, namely satisfying $\( C p \)_J = 0$. The nonnegative inverse $C_J^(- 1)$ gives nonnegative interpolation, as in Lemma 7. The reflection action of $W_J$ on the full coordinate space fixes such a vector $p$.

The use of reflection words to select subobjects has a parallel in the torsion-pair description of preprojective-module polytopes #cite(label("BaumannKamnitzerTingley2014")) Sections 3.2, 5.4 and 5.6. Here we construct the required graded subrepresentations by transporting layer truncations through the twists.

#thm([Proposition 5.6.])[
  (Convex subobjects).  #emph[Let $J subset.eq S$ be spherical, and suppose that at $x$ the data are capped at $q$ on $J union partial J$. Let $p$ agree with $m^q \( x \)$ outside $J$ and be harmonic on $J$, and put $e = m^q \( x \) - p$, which is supported on $J$. Assume that for #emph[every] representative $z in A_J x$ whose data are capped at $q$ on $J union partial J$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ m_j^q \( z \) gt.eq p_j #h(2em) \( j in J \) . $ <eq:height-data-universal-cap-inequality>]

 Then $e_J$ belongs to the convex hull in $bb(R)^J$ of vectors $s_J$ with the following property: $s$ is zero outside $J$, and there are graded subrepresentations 
#[#set math.equation(numbering: n => "(5.9)")
 $ cal(S)_L subset.eq Y_L^q \( x \) \, #h(2em) "supp" cal(S)_L subset.eq tilde(J) \, #h(2em) sum_L w_L dim cal(S)_L = phi.alt s . $ <eq:height-data-convex-subrepresentations>]

 One may use a finite collection of such vectors, together with the zero vector.]
  #emph[If all inequalities in (5.8) are strict, $e_J$ is in the ordinary interior in $bb(R)^J$ of such a convex hull. For $J = diameter$ the interior convention is that ${ 0 }$ is open in $bb(R)^0$.]
] <prop:convex-subobjects>

#proof[
  The exterior coordinates of $m^q$ are fixed on $A_J x$, so the vector $p$ in the hypothesis is the same for every representative under consideration. For each $w in W_J$, choose a reduced expression and let $G_w$ be its negative lift acting on the left. Its action on signed folded counts is $w$, because each negative letter acts by the same coordinate reflection as its positive inverse. Both $G_w$ and its inverse have the reduced-word amplitude from Corollary 22.
  Put $M_L = Y_L^q \( x \)$ and $N_L = G_w M_L$. The latter has levels $q - 1 \, q$. Its truncation triangle is
  #[#set math.equation(numbering: n => "(5.10)")
   $ N_(L \, upright("low")) arrow.r N_L arrow.r N_(L \, upright("high")) \, $ <eq:height-data-two-layer-triangle>]
  where the two end terms are pure at $q - 1$ and $q$, respectively. The low term is supported on $tilde(J)$: all outside-color multiplicities in each layer are unchanged under $G_w$, and the input was pure at $q$.
  Apply $G_w^(- 1)$ to (5.10). Write its end terms as $A_L$ and $C_L$, so that the triangle is
  $ A_L arrow.r M_L arrow.r C_L . $
  The amplitude bounds place $A_L$ in $\[ q - 1 \, q \]$ and $C_L$ in $\[ q \, q + 1 \]$. The long exact sequence at $q - 1$ forces $H_(upright("lay"))^(q - 1) \( A_L \) = 0$, since the adjacent middle and right groups there vanish. At $q + 1$ it forces $H_(upright("lay"))^(q + 1) \( C_L \) = 0$. Thus both end terms are pure at $q$, and the sequence at $q$ is short exact:
  #[#set math.equation(numbering: n => "(5.11)")
   $ 0 arrow.r A_L arrow.r M_L arrow.r C_L arrow.r 0 $ <eq:height-data-subobject-sequence>]
  in the shifted heart. By Lemma 14, $A_L$ is an actual graded subrepresentation $cal(S)_L$ of $M_L$. Its support is still in $tilde(J)$, because a twist at a color in $J$ sends a complex of projectives of colors in $J$ to another such complex.
  The subobject morphism in (5.11) is
  $ G_w^(- 1) tau_(lt.eq q - 1) \( G_w M_L \) arrow.r M_L . $
  Lemma 23 shows that it is obtained from the unit-label morphism by right tensoring with $L$, up to an isomorphism of inclusions. Applying the weighted fusion identity to its generator spaces therefore gives (5.9) for a vector $s = s_w$. This argument uses canonical truncations; it makes no choice of elimination splittings simultaneously in the different labels.
  The quotient family $C_L$ has weighted dimension $phi.alt \( m^q \( x \) - s_w \)$. Applying $G_w$ to it recovers $N_(L \, upright("high"))$, which is pure at $q$. Signed generator counts consequently give the folded dimension of this high family as
  #[#set math.equation(numbering: n => "(5.12)")
   $ w #scale(x: 120%, y: 120%)[\(] m^q \( x \) - s_w #scale(x: 120%, y: 120%)[\)] . $ <eq:height-data-reflected-quotient>]
  There is no contribution here from higher layers of the original $E_L \( x \)$ outside the operated region: Lemma 26 identifies its level-$q$ family after $G_w$ with the level-$q$ family of $G_w M_L$, exactly the high family used in (5.12).
  The representative obtained by $G_w$ belongs to $A_J x$ and retains the joint cap, by Lemma 27. Applying the universal hypothesis to (5.12), and using $w p = p$, gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ #scale(x: 120%, y: 120%)[\(] w \( e - s_w \) #scale(x: 120%, y: 120%)[\)]_j gt.eq 0 #h(2em) \( j in J \) . $ <eq:height-data-chamber-inequalities>]
  In the strict case every one of these coordinates is strictly positive.
  We finish in the finite-dimensional real vector space of root coordinates on $J$. The finite Coxeter chamber theorem says that every linear functional $f$ on this space can be written
  $ f \( v \) = sum_(j in J) lambda_j \( w v \)_j quad upright("for some ") w in W_J upright(" and ") lambda_j gt.eq 0 . $
  Indeed the nonnegative coordinate functionals form the closed fundamental chamber in the dual representation, whose $W_J$-translates cover the dual space. For the $w$ chosen for $f$, (5.13) implies
  #[#set math.equation(numbering: n => "(5.14)")
   $ f \( e \) gt.eq f \( s_w \) gt.eq min_(v in cal(V)) f \( v \) \, #h(2em) cal(V) = { s_u : u in W_J } union { 0 } . $ <eq:height-data-support-inequalities>]
  The set $cal(V)$ is finite. If $e$ lay outside its convex hull, a separating linear functional would contradict (5.14). Thus $e_J$ lies in that convex hull.
  If the original inequalities were all strict, then for nonzero $f$ at least one $lambda_j$ is positive, so $f \( e \) > f \( s_w \) gt.eq min_(v in cal(V)) f \( v \)$. A point in a finite convex hull which satisfies this strict inequality for every nonzero functional lies in its ordinary ambient interior: a boundary point, or a convex hull in a proper affine subspace, has a nonzero supporting functional with equality. This proves the strict assertion. For $J = diameter$ the construction gives $e = s_w = 0$ and the stated zero-dimensional conclusion directly. ◻
]

== 6 A two-point estimate on spherical cosets <sec:two-point>

We prove a uniqueness statement that will distinguish the sources in the spherical-residue filtrations. Throughout this section, $T subset.eq S$ is nonempty and spherical, $A_T x_0$ is a fixed right coset, and the data are capped at an integer $q$ on $partial T$. The data outside $T$ are constant on this coset by Lemma 24. We regard vectors on $T$ as vectors on $hat(S)$ by extension by zero when necessary.

#prodef([Definition 6.1.])[
  A #emph[candidate] in $A_T x_0$ is a pair
  $ X = \( J \, A_J z \) \, #h(2em) J subset.neq T \, #h(2em) z in A_T x_0 \, $
  with the following properties. Put $V = T \\ J$, and let $p$ agree with $m^q \( z \)$ outside $J$ and be harmonic on $J$.
  + The data are capped at $q$ on $V$.
  + The vector $a$, defined on $T$ by $a_i = - \( C p \)_i$, is strictly positive on $V$ and zero on $J$.
  + For every representative $y in A_J z$ whose data are capped at $q$ on $T$, one has
    $ m_j^q \( y \) gt.eq p_j #h(2em) \( j in J \) . $
] <def:two-point-candidate>

On the open colors $V$, the harmonic vector $p$ retains the actual layer counts, and condition (ii) requires its Cartan rows to be strictly negative. On $J$, the same vector is a harmonic prescription that condition (iii) places below every capped representative’s layer counts. The source argument in Section 8 will establish these conditions for each source of a residue sublevel.

All three conditions depend only on the indicated coset with its type. Indeed, changes of representative in $A_J z$ change no coordinate outside $J$, so they leave $p$, $a$, and the cap on $V$ unchanged. The universally quantified set of representatives in (iii) is nonempty: the cap on $V union partial T$ gives the cap on $partial J$, and Lemma 27 supplies a representative capped on $J$ as well. This includes $J = diameter$.

#thm([Proposition 6.2.])[
  #emph[There is at most one candidate in $A_T x_0$.]
] <prop:candidate-uniqueness>

The proof first compares the harmonic vectors of two candidates by a tensor estimate. It then uses right-module tests to turn equality of those vectors into equality of the cosets. We develop the tensor estimate before proving the parabolic detector needed for the second step.

=== 6.1 Minimal right complexes and inversion <minimal-right-complexes-and-inversion>

For an unfolded vertex $ell in tilde(T)$, let $U_ell$ be the simple top of $Q_ell = e_ell Z$, placed in cochain and internal degrees zero. For $h in A_T$, consider

#[#set math.equation(numbering: n => "(6.1)")
 $ R_ell \( h \) = U_ell ⊗_Z B_h . $ <eq:two-point-right-complex>]

Expansion of a word for $B_h$ gives a complex with the single term $U_ell$ at placements $\( 0 \, 0 \)$, together with shifts of right projectives $Q_beta$, $beta in tilde(T)$. Here and below a complex of this form is minimized in the additive category generated by these graded modules. This is a Krull–Schmidt category: its indecomposable terms have finite-dimensional local endomorphism rings. The cancellation argument of Lemma 14 therefore applies. The simple cannot cancel against a projective, because the latter has both a nonzero top and a nonzero token socle. Consequently the minimal complex still has exactly this one simple term.

Let

$ K_(ell beta)^r \( h \) $

denote the number of projective generators of type $Q_beta$ and total generator degree $r = c + u$ in this minimal complex. Counts in different cochain and internal placements with this same sum are added. They are well defined by uniqueness of minimal models.

#thm([Lemma 6.3.])[
  #emph[For every $h in A_T$, every $ell \, beta in tilde(T)$, and every integer $r$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ K_(ell beta)^r \( h \) = K_(beta ell)^(- 2 - r) \( h^(- 1) \) . $ <eq:two-point-duality>]

 If $J \, J' subset.eq T$, the rows with indices outside $tilde(J)'$ are unchanged by left multiplication of $h$ by $A_(J')$, and the columns with indices outside $tilde(J)$ are unchanged by right multiplication of $h$ by $A_J$.]
] <lem:right-duality>

#proof[
  Before minimizing, $B_h$ has one regular bimodule $Z$ in placements $\( 0 \, 0 \)$; every other term is a shift of $P_alpha ⊗_(bb(C)) Q_beta$ with $alpha \, beta in tilde(T)$. Tensor products of projective bimodules remain sums of such terms, since their middle tensor factor is a graded path space.
  No indecomposable summand of the regular bimodule is isomorphic to one of these projective bimodules. To see this, decompose $Z$ according to the connected components of its unfolded graph. The regular bimodule of one component is indecomposable: a decomposition would give a nontrivial central idempotent, whose degree-zero part would separate the vertices despite the nonzero arrows between them. Its top modulo the left and right radicals consists of the diagonal simple at every vertex of the component. The corresponding top of $P_alpha ⊗ Q_beta$ consists of just the single pair $\( alpha \, beta \)$. Equality of these tops would force a singleton component and $alpha = beta$. In that case the regular bimodule has dimension two, whereas $P_alpha ⊗ Q_alpha$ has dimension four. Isomorphism is again impossible. These observations are unaffected by shifts. Thus all regular summands remain in the minimal bimodule complex, and remain only in placements $\( 0 \, 0 \)$.
  A radical map between projective bimodules is a sum of path tensors with positive length on at least one side. The only possible term with both lengths zero is a scalar map between identical indecomposable shifted projectives; a nonzero such term would be an isomorphism modulo the radical and would have been canceled. Tensoring on the left by $U_ell$ kills terms with positive left length. Every surviving projective-to-projective differential therefore has positive right length and is radical. A map involving the regular term specializes to a map between $U_ell$ and a right projective, hence is also radical. There is no differential between two surviving simple terms, since the regular terms occur only in cochain degree zero. It follows that tensoring the minimal bimodule complex by $U_ell$ gives an already minimal right complex. Its projective counts are exactly the counts of the corresponding bimodule terms with first index $ell$.
  By Lemma 9, adjoint duality on finite graded bimodules satisfies
  $ "Hom"_(Z upright("-left")) \( M \, Z \) tilde.equiv "Hom"_(bb(C)) \( M \, bb(C) \) chevron.l 2 chevron.r . $
  It is a contravariant equivalence, preserves additive radicals, and sends
  $ P_ell ⊗ Q_beta quad mapsto quad \( P_beta ⊗ Q_ell \) chevron.l - 2 chevron.r . $
  For complexes it also reverses cochain placements, with the ordinary cochain dual differential. Hence a generator at $\( c \, u \)$ on the left corresponds to one at $\( - c \, - u - 2 \)$ on the right. The total generator degree changes from $r$ to $- 2 - r$. The adjoint dual of $B_h$ is homotopy equivalent to its inverse $B_(h^(- 1))$, by Proposition 13. As the dual minimal complex is still minimal, the preceding specialization proves (6.2).
  For $b in A_(J')$ and $ell in.not tilde(J)'$, each generator or inverse generator occurring in $b$ fixes $U_ell$: its projective evaluation or coevaluation term tensors to zero. Thus
  $ U_ell B_(b h) tilde.eq U_ell B_h \, $
  which proves row invariance. Apply (6.2) to $\( h a \)^(- 1) = a^(- 1) h^(- 1)$, for $a in A_J$, to obtain column invariance. ◻
]

=== 6.2 Normalized right layers <normalized-right-layers>

In a minimal complex $R_ell \( h \)$, keep the usual level $c + u$ for each projective generator, and assign the residual simple the #emph[normalized level] $- 1$. The actual placements of the simple remain $\( 0 \, 0 \)$. This assignment has the following elementary compatibility with differential entries.

A projective-to-projective entry of length $a in { 1 \, 2 }$ changes normalized level by $1 - a$. A nonzero entry from a projective to the simple must use the top quotient of $Q_ell$. Its source placements are $\( - 1 \, 0 \)$, so its source also has normalized level $- 1$. Conversely, an entry from the simple to a projective uses the token socle of $Q_ell$. Its target placements are $\( 1 \, - 2 \)$, again of level $- 1$. Give these two kinds of entries #emph[effective length one]. Every differential entry then changes normalized level by one minus its effective length, and in particular does not raise normalized level.

At a fixed level, retain the length-one projective entries and these effective length-one entries. They give coefficient maps, with the simple allowed as an additional framing coefficient. At a projective vertex $beta$, define the #emph[right top] to be the projective coefficient space modulo the images of all incoming coefficient maps, including maps from the simple. Coefficient paths are nilpotent because their cochain placements strictly increase and the complex is bounded.

If $r$ is the highest normalized level of $R_ell \( h \)$, the same path calculation as in Lemma 17 gives

#[#set math.equation(numbering: n => "(6.3)")
 $ dim H^(r + 2) \( R_ell \( h \) e_beta \) = dim "top"_beta \( R_ell \( h \)^r \) . $ <eq:two-point-right-top>]

Indeed, the projective token terms at level $r$ are the only terms of total degree $r + 2$. The incoming images are precisely the length-one coefficient images tested by the perfect backtrack pairing, together with the token inclusions from the simple when $r = - 1$. A length-two differential reaching such a token from a length-zero path would have to start at level $r + 1$, which is absent. All other possible incoming paths from lower levels would multiply beyond length two and vanish. The cohomology in all higher total degrees vanishes. Formula (6.3) also applies with a common upper bound $r$ for a finite family of these right complexes.

#thm([Lemma 6.4.])[
  #emph[Let $R$ be a minimal complex with a single simple $U_ell$ at $\( 0 \, 0 \)$ and shifted right projectives, and let $r gt.eq - 1$ bound its normalized levels. Applying a right inverse twist, and then minimizing, does not increase this bound. The same holds for the product of inverse twists in one color. At the acted vertex $alpha$, the test complexes satisfy 
#[#set math.equation(numbering: n => "(6.4)")
 $ \( R D_alpha \) e_alpha tilde.eq \( R e_alpha \) chevron.l - 2 chevron.r \[ - 1 \] . $ <eq:two-point-inverse-test>]

]
] <lem:two-point-negative-bound>

#proof[
  The inverse bimodule complex is
  $ D_alpha = \[ Z arrow.r \( P_alpha ⊗ Q_alpha \) chevron.l - 2 chevron.r \] \, $
  with its second term in cochain degree one. An old projective $Q_beta$ with placements $\( c \, u \)$, tested against a path of length $a$ in $e_beta Z e_alpha$, inserts a copy of $Q_alpha$ with placements
  #[#set math.equation(numbering: n => "(6.5)")
   $ \( c + 1 \, u + a - 2 \) \, #h(2em) upright("of level ") c + u + a - 1 . $ <eq:two-point-inserted-placements>]
  The only insertions that can exceed the old level have $a = 2$, and then $beta = alpha$. We cancel all of them simultaneously, keeping track of the old differential.
  Write $cal(E) = "Tot" \( R D_alpha \)$. In its underlying bigraded module, let $A$ be the sum of all old $Q_alpha$ terms in the $Z$-column, and let $B$ be the sum of their inserted length-two copies. The copy paired with an old term at $\( c \, u \)$ lies at $\( c + 1 \, u \)$. The token–unit summand of the Frobenius coevaluation gives an isomorphism
  $ Phi = pi_B d \|_A : A arrow.r B $
  of cochain degree one, with signed nonzero scalar identity entries. The old differential stays within its tensor column and contributes nothing to this particular block.
  Consider
  $ cal(K) = A xor d \( A \) subset.eq cal(E) . $
  Projection onto $B$ identifies $d \( A \)$ with $B$, so $A ∩ d \( A \) = 0$. The displayed sum is a subcomplex: its differential maps $A$ isomorphically to $d \( A \)$ and kills $d \( A \)$. It is contractible, and is a direct summand of the underlying bigraded module. Thus the quotient $cal(E) arrow.r cal(E) \/ cal(K)$ is a homotopy equivalence. More explicitly, if $cal(E) = A xor B xor W$ as a bigraded module, the quotient has underlying terms $W$. Representing a quotient class by its $W$-component gives the differential
  #[#set math.equation(numbering: n => "(6.6)")
   $ d'_W = d_(W W) - d_(W A) Phi^(- 1) d_(B W) . $ <eq:two-point-pivot-differential>]
  This formula includes any scalar entries that the old differential induces among the inserted projectives; their vanishing is not needed.
  The remaining projective terms are the old $Q_beta$ with $beta eq.not alpha$, and the length-zero and length-one insertions in (6.5). Their levels are, respectively, the old level, the old level minus one, and the old level. The original simple remains at normalized level $- 1$. If $alpha = ell$, the simple also inserts a projective with placements $\( 1 \, - 2 \)$, of level $- 1$; if $alpha eq.not ell$, it inserts nothing. All surviving terms have level at most $r$. Further minimization removes summands without introducing new ones, so preserves this bound. Applying this argument successively to the orthogonal vertices of a color proves the color statement.
  Finally, the inverse of the right-hand test-shift formula for the positive twist in Lemma 18 is (6.4). Equivalently, it follows by canceling the token–unit component of $D_alpha e_alpha$. Its total shift is $- 2 + 1 = - 1$, so in particular
  $ H^t \( \( R D_alpha \) e_alpha \) tilde.equiv H^(t + 1) \( R e_alpha \) . $
  The shift formula holds for the nonprojective simple input as well, since the cancellations are bimodule homotopies before tensoring. ◻
]

=== 6.3 The highest pair in the tensor filtration <the-highest-pair-in-the-tensor-filtration>

Compare two candidates, denoted by

$ \( J \, A_J z \) \, quad \( J' \, A_(J') z' \) \, #h(2em) V = T \\ J \, quad V' = T \\ J' \, $

and use $p \, a$ and $p' \, a'$ for their harmonic vectors and strictly positive open-color vectors. By cap accessibility inside $J$, choose $z$ capped at $q$ on $T$. The initial representative $z'$ need only have the prescribed cap on $V'$. Set

$ h = z' z^(- 1) in A_T \, #h(2em) R_ell = R_ell \( h \) quad \( ell in tilde(V)' \) . $

Give the row $ell = \( i \, L \)$ weight $a'_i w_L$, and give each left-family member $E_(L') \( z \)$ weight $w_(L')$, independently. All these weights are positive. Since

$ R_ell ⊗_Z E_(L') \( z \) tilde.eq U_ell B_h B_z P_(o \, L') tilde.eq U_ell E_(L') \( z' \) \, $

the weighted total cohomology in degree $d$ has dimension

#[#set math.equation(numbering: n => "(6.7)")
 $ D_0 sum_(i in V') a'_i m_i^d \( z' \) \, #h(2em) D_0 = sum_L w_L^2 . $ <eq:two-point-actual-homology>]

Here tensoring a minimal left complex with $U_ell$ kills its radical differential and counts its generators of type $ell$. Summing first over $L'$ gives $w_L m_i^d \( z' \)$, and summing the row weights gives (6.7). In particular all these tensor complexes have zero cohomology above $q$.

Let $r gt.eq - 1$ be the highest normalized level appearing in the finite right family. Write $N$ for its coefficient data at that level, retaining the row index, and let

$ M_(L') = Y_(L')^q \( z \) \, #h(2em) M = \( M_(L') \)_(L') . $

We define a three-term vector-space complex for each row and left member. Its length-zero terms are tensors of right and left coefficients with an intervening length-zero path, its length-two terms use tokens, and its length-one terms use arrows. If $r = - 1$, the simple-against-projective tensors are also placed in length one. The differential is the length-one part of the tensor differential. Write $H_j \( N \, M \)$ for the resulting cohomology in length $j in { 0 \, 1 \, 2 }$, keeping the family indices when needed. Its weighted dimension, denoted $dim_(upright("wt"))$, uses the two independent weights just specified.

#thm([Lemma 6.5.])[
  #emph[With these definitions, 
#[#set math.equation(numbering: n => "(6.8)")
 $ H_2 \( N \, M \) = 0 \, #h(2em) H_1 \( N \, M \) upright(" survives in actual total degree ") r + q + 1 . $ <eq:two-point-highest-tensor>]

 Moreover, at every unfolded projective vertex $beta$, the length-two cokernel surjects onto the tensor product of the right and left top quotients at $beta$. Consequently, if a right top at level $r$ occurs in a color $j in J$, then all the left-family tops at level $q$ in that color vanish.]
] <lem:two-point-tensor-filtration>

#proof[
  Filter the entire vector complex $R_ell ⊗_Z E_(L') \( z \)$ by middle path lengths zero, one, and two, assigning length one to a simple tensor. Minimal projective differentials have positive path length. The map from a projective to a simple sends a length-zero tensor to the assigned length-one tensor and kills positive middle paths; the map from the simple to a projective sends its assigned length-one tensor to a token tensor. A left radical differential tensored with a right simple is zero. Thus every differential strictly increases this filtration index.
  For a right projective generator at $\( c \, u \)$, a left generator at $\( c' \, u' \)$, and a middle path of length $a$, the total degree is
  $ \( c + u \) + \( c' + u' \) + a . $
  For the simple tensor it is $c' + u' = \( - 1 \) + \( c' + u' \) + 1$, the same rule with the normalized right level. The first differential of the filtration increases length by one and preserves each pair of levels. Its cohomology at the pair $\( r \, q \)$ is precisely $H_j \( N \, M \)$. With only three length columns, the only possible remaining differential goes from length zero to length two. Accordingly, every middle class survives to the associated graded of actual cohomology.
  Every right projective has its vertex in $tilde(T)$. The tensor $Q_beta ⊗_Z P_gamma = e_beta Z e_gamma$ is nonzero only if $gamma = beta$ or $gamma$ is a neighbor of $beta$. A simple tensor is nonzero only at its own vertex in $tilde(T)$. Hence every nonzero term of the entire tensor complex uses a left color in $T union partial T$, where the cap is $q$. Layers above $q$ outside this set give zero tensor terms.
  A secondary differential into length two at $\( r \, q \)$ would start in length zero at a pair whose level sum is $r + q + 1$: the differential raises actual total degree by one while raising length by two. Such a pair is absent, since the right level is at most $r$ and every relevant left level is at most $q$. Thus $H_2 \( N \, M \)$ survives as well. Its total degree is $r + q + 2 > q$, so (6.7) forces it to be zero. The middle degree is $r + q + 1$, proving (6.8).
  For the last assertion, project the token tensors at $beta$ to the tensor product of the two coefficient spaces modulo their incoming images, and send all other token tensors to zero. Every incoming length-one boundary has, at $beta$, an incoming coefficient on at least one side. The projection therefore annihilates boundaries and is surjective onto the tensor product of the two top quotients. If a right top at a vertex of color $j$ is nonzero, $H_2 \( N \, M \) = 0$ forces the left top at that same vertex to be zero for every family member. By Lemma 24, a top occurring anywhere in a color of the left family occurs at every unfolded label of that color in some member. Hence no left-family top in color $j$ can occur. ◻
]

Figure 2 records the two excluded incoming sources at $\( r \, q \)$ and the permanent middle column.

#figure(
  [Linear part: $C_0 arrow.r^(d_1) C_1 arrow.r^(d_1) C_2$, $H_a = H^a \( C_bullet \, d_1 \)$.
  #cetz.canvas({
  import cetz.draw: *
  content((-2.309, 0), [#text(size: 9pt)[Tensor: level pair $(u,v)=( "right" , "left" )$; total degree $t=u+v+a$.]], anchor: "west", padding: 0.1176cm)
  content((0, -0.62), [#text(size: 8pt)[length $a=0$]])
  content((5.607, -0.62), [#text(size: 8pt)[length $a=1$]])
  content((11.21, -0.62), [#text(size: 8pt)[length $a=2$]])
  content((0, -1.55), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_0(r+1,q) plus.o H_0(r,q+1)$#linebreak()absent at maximal $(r,q)$]]])])
  content((0, -3.15), [#box(width: 4.734cm, inset: 0.1411cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_0(r,q)$#linebreak()$t=r+q$]]])])
  content((5.607, -3.15), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.6pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_1(r,q)$#linebreak()$t=r+q+1$#linebreak()permanent]]])])
  content((11.21, -3.15), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_2(r,q)=0$#linebreak()$t=r+q+2>q$]]])])
  line((2.367, -1.55), (8.905, -1.55), (11.21, -2.675), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((6.926, -1.55), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[possible incoming $d_2$]]])])
})],
  caption: [Figure 2: The tensor length filtration at the highest contributing pair $\( r \, q \)$. The right normalized level is at most $r gt.eq - 1$, and every contributing left color is in $T union partial T$, where the cap is $q$. The only possible secondary differential is $d_2 : 0 arrow.r 2$, so the middle classes are permanent. Its two possible incoming sources at $\( r \, q \)$ are absent; hence the length-two classes also survive. Their actual degree $r + q + 2 > q$ forces $H_2 \( r \, q \) = 0$. A residual right simple has normalized level $- 1$ and assigned length $1$, which preserves the total-degree formula. The dashed arrow marks an excluded possibility. Family and bidegree indices are suppressed. ],
) <fig:filtrations>

#thm([Lemma 6.6.])[
  #emph[By replacing $z$ within $A_J z$, preserving the cap on $T$, one can arrange that the highest normalized right layer has no right top at any vertex of $tilde(J)$.]
] <lem:two-point-remove-tops>

#proof[
  Suppose a right top at the current highest level $r$ occurs in color $j in J$. Lemma 33 shows that the left-family top in this color at level $q$ vanishes. The positive operation $F_j$ therefore preserves the cap on $T union partial T$, by Lemma 27 applied with spherical set $T$. Replace
  $ z mapsto sigma_j z \, #h(2em) h mapsto h sigma_j^(- 1) \, #h(2em) R_ell mapsto R_ell B_(sigma_j)^(- 1) . $
  The candidate, its harmonic vector $p$, and the exterior cap are unchanged. The tensor products still compute the same complexes $U_ell E_(L') \( z' \)$. By Lemma 32, the new maximum normalized level is at most $r$. Thus the vanishing of the left top needed to license the next move follows anew from Lemma 33.
  At a fixed value of $r$, the sequence of chosen colors is reduced in $W_J$. To prove this, let $w$ be the reduced word already chosen at this level. If a color $j$ were a right descent of $w$, a reduced expression for $w$ could end in $j$. Matsumoto moves give the same negative Artin word in this expression. Each intermediate negative operation preserves the upper bound $r$, regardless of the expression. The final inverse operation in color $j$ lowers the total test degrees in that color by one. Before it, every test above $r + 2$ vanishes; after it, every test at $r + 2$ in color $j$ therefore vanishes. Formula (6.3) excludes a right top there. A color selected for a nonzero right top must consequently be an ascent, proving the assertion by induction on the number of moves.
  The length of a reduced word in $W_J$ is bounded by the length of its longest element. Therefore at a fixed $r$ the procedure either removes all the indicated tops or lowers the maximum level after finitely many steps. The maximum is an integer bounded below by $- 1$, because the residual simples remain. There are only finitely many possible decreases from its initial value. The procedure terminates with the desired representative. If $J = diameter$, no move is needed. ◻
]

=== 6.4 Subrepresentations and the Euler estimate <subrepresentations-and-the-euler-estimate>

Use the representative supplied by Lemma 34, and retain the notation $r \, N \, M$ for its highest right layer and left layer at $q$. Put

$ m = m^q \( z \) \, #h(2em) e = m - p . $

The vector $e$ is supported on $J$. The cap on $T union partial T$, together with the universal condition in Definition 29, verifies the hypotheses of Proposition 28 for $A_J z$. Indeed, on this coset the cap on $T \\ J$ is fixed, so a representative capped on $J union partial J$ is also capped on $T$. Consequently $e_J$ belongs to the convex hull of folded dimension vectors $s_J$ of families

#[#set math.equation(numbering: n => "(6.9)")
 $ cal(S)_(L') subset.eq M_(L') $ <eq:two-point-subfamilies>]

of graded layer subrepresentations supported on $tilde(J)$. Their weighted dimensions have the form $phi.alt s$, with $s$ zero outside $J$.

#thm([Lemma 6.7.])[
  #emph[For every family $cal(S) subset.eq M$ in (6.9), 
#[#set math.equation(numbering: n => "(6.10)")
 $ H_2 \( N \, cal(S) \) = 0 \, #h(2em) H_0 \( N \, cal(S) \) arrow.r.hook H_0 \( N \, M \) . $ <eq:two-point-subrepresentation-homology>]

]
] <lem:two-point-subrepresentation-tensor>

#proof[
  The inclusion in degree zero follows from the inclusion of the length-zero vector spaces and compatibility of the length-one differentials. Since there is no incoming term of negative length, their degree-zero cohomologies are kernels, and kernel inclusion gives the asserted injection.
  For the degree-two assertion, work first with a single right row and a single left subrepresentation, and retain homogeneous coefficient spaces in their cochain gradings. At every projective vertex of $tilde(J)$, vanishing of the right top says that every right coefficient is a sum of incoming coefficient images, from projective vertices or from the framing simple. Iterating this statement expresses coefficients in $tilde(J)$ using ones outside $tilde(J)$ or in the simple: along an incoming projective path the predecessor cochain placement is smaller by one, and these placements are bounded below.
  We make this iteration in the cokernel of the length-one differential, rather than in the coefficient spaces alone. Suppose an incoming right coefficient at $beta$ comes from a homogeneous coefficient at $gamma$, through a length-one map $Q_gamma arrow.r Q_beta$. Choose a middle path in $e_gamma Z^1 e_beta$ dual to this arrow under the perfect backtrack pairing. Tensor this middle path with the coefficient at $gamma$ and any homogeneous left coefficient in $cal(S)_beta$. Its differential has two possible token contributions. The contribution at $beta$ is the selected incoming right coefficient, tensored with the unchanged left coefficient. The contribution at $gamma$ is the original right coefficient tensored with the corresponding left-arrow image, with the ordinary cochain sign. The dual path can be normalized so that the first coefficient is one. Hence, modulo length-two boundaries, the token tensor at $beta$ is equal, up to a nonzero scalar and sign, to the latter token tensor at $gamma$.
  The new left coefficient lies in $cal(S)_gamma$, since $cal(S)$ is closed under the left coefficient maps. Varying the dual middle path tests every incoming arrow coefficient by nondegeneracy of the pairing, including when an arrow space has dimension greater than one. Thus this substitution accounts for the full span of incoming images. Each substitution decreases the right cochain placement by one and increases the left placement by one, so the represented total degree is unchanged and the substitution process terminates.
  If it terminates at a projective vertex outside $tilde(J)$, the left coefficient is zero. If an incoming coefficient comes from the simple, its tensor with the same left coefficient is itself an assigned length-one input. The right differential sends that tensor to exactly the token-inclusion image in question. Its left differential is zero because tensoring a radical left map with a right simple gives zero. Such a token tensor is therefore already a boundary. Every length-two generator is a sum of the tensors just treated, so the cokernel vanishes. This proves the first assertion row by row and member by member, hence for the families as well. ◻
]

Define the folded nonnegative vector $n$, supported on $T$, by

#[#set math.equation(numbering: n => "(6.11)")
 $ n_j = 1 / D_0 sum_H w_H sum_(i in V') sum_L a'_i w_L K_(\( i \, L \) \, \( j \, H \))^r \( h \) #h(2em) \( j in T \) . $ <eq:two-point-right-weight>]

For any left-layer family of weighted dimension $phi.alt y$, the weighted Euler characteristic of its length complex with $N$, divided by $D_0$, is

#[#set math.equation(numbering: n => "(6.12)")
 $ chi \( n \, y \) = n^(sans(t)) C y - upright(bold(1))_({ r = - 1 }) \( a' \)^(sans(t)) y_T . $ <eq:two-point-euler>]

Here is the count explicitly. If

$ N_beta^(upright("wt")) = sum_(i in V') sum_L a'_i w_L K_(\( i \, L \) \, beta)^r \( h \) \, $

the projective part of the unnormalized count is

$ sum_(beta \, gamma) N_beta^(upright("wt")) tilde(C)_(beta gamma) \( phi.alt y \)_gamma = sum_(j \, H) N_(\( j \, H \))^(upright("wt")) w_H \( C y \)_j = D_0 n^(sans(t)) C y . $

The two diagonal paths, of lengths zero and two, give diagonal coefficient two; the middle arrows give minus adjacency. We used $tilde(C) phi.alt = phi.alt C$ in the first equality. If $r = - 1$, the residual simples also occur at this level. Their length-one contribution is

$ - sum_(i in V') sum_L a'_i w_L thin \( w_L y_i \) = - D_0 \( a' \)^(sans(t)) y_T . $

No simple is present in $N$ when $r > - 1$. This proves (6.12), including its normalization and sign.

#thm([Lemma 6.8.])[
  #emph[At the representative with no highest right tops on $J$, 
#[#set math.equation(numbering: n => "(6.13)")
 $ 1 / D_0 dim_(upright("wt")) H_1 \( N \, M \) gt.eq n_T^(sans(t)) a + upright(bold(1))_({ r = - 1 }) \( a' \)^(sans(t)) p_T . $ <eq:two-point-estimate>]

]
] <lem:two-point-euler-estimate>

#proof[
  For a family $cal(S)$ with folded dimension $s$, Lemma 35 and the Euler identity give
  $ chi \( n \, s \) = frac(dim_(upright("wt")) H_0 \( N \, cal(S) \) - dim_(upright("wt")) H_1 \( N \, cal(S) \), D_0) lt.eq frac(dim_(upright("wt")) H_0 \( N \, M \), D_0) . $
  The right side is independent of the chosen subfamily. Since $e$ is a convex combination of these $s$, and $chi \( n \, dot.op \)$ is linear, the same upper bound holds for $chi \( n \, e \)$. On the other hand, Lemma 33 gives
  $ chi \( n \, m \) = frac(dim_(upright("wt")) H_0 \( N \, M \) - dim_(upright("wt")) H_1 \( N \, M \), D_0) . $
  Subtracting yields
  $ 1 / D_0 dim_(upright("wt")) H_1 \( N \, M \) gt.eq chi \( n \, e \) - chi \( n \, m \) = - chi \( n \, p \) . $
  Finally, $n$ is supported on $T$, and $\( C p \)_T = - a$. Equation (6.12) therefore turns the right side into the expression in (6.13). ◻
]

=== 6.5 A spherical parabolic detector <a-spherical-parabolic-detector>

The tensor estimate is now available. In the final comparison it will force the harmonic vectors of two candidates to agree; to identify their cosets as well, we need to recover parabolic membership from a vanishing block of the right-projective counts $K_(ell beta)^r$.

We need to reflect positive last-letter divisibility through the finite unfolding. Recall that a #emph[simple] positive element in a finite-type Artin monoid is a reduced-word lift of an element of the Coxeter group $W_T$. The finite-type monoid facts in Theorem 3 imply that the greatest simple right divisor of a positive element $b$ exists: it is its right gcd with the Garside element. Write it as $t \( b \)$.

#thm([Lemma 6.9.])[
  #emph[For nonidentity simple elements $d_1 \, dots.h \, d_k$, the factorization $d_1 dots.h.c d_k$ is obtained by repeatedly extracting the greatest simple suffix if and only if 
#[#set math.equation(numbering: n => "(6.14)")
 $ D_R \( d_i \) subset.eq D_L \( d_(i + 1) \) #h(2em) \( 1 lt.eq i < k \) . $ <eq:two-point-greedy-condition>]

 Here the descent sets are those of the corresponding elements of the Coxeter group. Consequently, if an unfolded vertex right-divides the unfolding of a positive element of $A_T^(+)$, its original color right-divides that positive element.]
] <lem:two-point-greedy>

#proof[
  An atom $s$ right-divides a simple element $d$ exactly when $s in D_R \( d \)$, and $s d$ is simple exactly when $s in.not D_L \( d \)$. If the inclusion in (6.14) fails, an atom in its difference can be transferred from the end of $d_i$ to the beginning of $d_(i + 1)$, giving a larger simple suffix of the corresponding prefix. This proves necessity.
  For sufficiency, induct on prefixes. Suppose $P = d_1 dots.h.c d_(j - 1)$ has greatest simple suffix $d_(j - 1)$, and let $g = t \( P d_j \)$. Since $d_j$ is a simple suffix, it right-divides $g$; write $g = c d_j$. If $c eq.not 1$, choose a final atom of $c$, so $c = c' s$. The element $s d_j$, being a factor of the simple element $g$, is simple. Also $P d_j = b g = b c d_j$ for some positive $b$, so cancellation gives $P = b c$. Thus $s$ right-divides $P$. Since an atom is simple, it right-divides $t \( P \) = d_(j - 1)$. We have obtained $s in D_R \( d_(j - 1) \)$ and $s in.not D_L \( d_j \)$, a contradiction. Therefore $g = d_j$, completing the induction. Removing the final factor successively gives the asserted greedy extraction.
  Now take the greedy factorization of a positive original element. Lemma 10 says that reduced-word lifts remain simple after unfolding, and that both descent sets become their full color preimages. Thus the unfolded factors satisfy (6.14) and form the unfolded greedy factorization. Every extractable final atom of the unfolded element right-divides its greatest simple suffix, hence is a right descent of the last unfolded factor. Descent reflection supplies its color as a right descent of the last original factor. That original atom therefore right-divides the original positive element. ◻
]

The following detector uses successive common-divisor removal, as in the proof of Brav–Thomas #cite(label("BravThomas2011")) Theorem 3.1. Here the vanishing block of a family of right-simple tests yields a specific parabolic subgroup; the unfolding step needed to recover original colors is Lemma 37.

#thm([Lemma 6.10.])[
  #emph[Let $h in A_T$ and $diameter eq.not V subset.eq T$. If 
#[#set math.equation(numbering: n => "(6.15)")
 $ K_(ell beta)^r \( h \) = 0 #h(2em) \( r in bb(Z) \, med ell \, beta in tilde(V) \) \, $ <eq:two-point-zero-block>]

 then $h in A_(T \\ V)$.]
] <lem:parabolic-detection>

#proof[
  Fix $ell in tilde(V)$. The only right projective admitting a nonzero map to or from $U_ell$ is $Q_ell$: a map to the simple uses its top quotient, and a map from the simple uses its token socle. Condition (6.15) excludes this projective from $R_ell \( h \)$. Its simple term therefore splits off as a complex. Tensoring with $B_h$ is a homotopy equivalence and preserves indecomposability. Since $U_ell$ is indecomposable, the remaining projective summand must be zero in the homotopy category. It follows that
  $ U_ell B_h tilde.eq U_ell #h(2em) \( ell in tilde(V) \) . $
  Use finite-type fractions to write $h = h_1 h_2^(- 1)$ with $h_1 \, h_2 in A_T^(+)$. On setting $U_V = xor.big_(ell in tilde(V)) U_ell$, the preceding equivalences give
  #[#set math.equation(numbering: n => "(6.16)")
   $ U_V B_(h_1) tilde.eq U_V B_(h_2) . $ <eq:two-point-equal-positive>]
  For a bounded right complex $R$, use the height
  $ max { t : H^t \( R e_beta \) eq.not 0 upright(" for some ") beta in tilde(T) } $
  from Lemma 21, with total cohomological degree as there. Its value on $U_V$ is zero. A positive word avoiding $V$ fixes $U_V$. If a positive word contains a color of $V$, all operations before its first such occurrence fix $U_V$, and that first occurrence acts on a highest test and raises the height. The height cannot subsequently decrease. Thus the final height is positive exactly when the word contains a color of $V$.
  If the common height in (6.16) is positive, any vertex with highest cohomology gives, by the right version of Lemma 21, an extractable final atom of both unfolded positive words. Lemma 37 supplies a common extractable original color $s$. Write $h_i = g_i sigma_s$, and tensor (6.16) on the right by $B_(sigma_s)^(- 1)$. This gives the same equality with $g_i$ in place of $h_i$, while
  $ h_1 h_2^(- 1) = g_1 sigma_s sigma_s^(- 1) g_2^(- 1) = g_1 g_2^(- 1) . $
  The sum of positive lengths decreases by two. Repetition therefore terminates with common height zero. Both remaining positive words then avoid $V$, so their fraction lies in $A_(T \\ V)$. ◻
]

=== 6.6 Equality of candidates <equality-of-candidates>

#proof[
  Suppose two candidates are given, and use the notation above. Carry out the top-removal procedure for the first candidate, with the second supplying the positive row weights. If its final highest normalized right level satisfies $r > - 1$, that level contains a nonzero projective coefficient and no framing simple. It must contain a nonzero coefficient in $tilde(V)$. Indeed, if it were supported entirely on $tilde(J)$, vanishing of all its right tops there would express every coefficient using incoming ones with strictly smaller cochain placement. Boundedness would force every coefficient to be zero.
  All row weights are strictly positive. A nonzero coefficient in $tilde(V)$ consequently gives $n_i > 0$ for some $i in V$. Since $a_i > 0$ there, $n_T^(sans(t)) a > 0$. Equation (6.13) then gives nonzero middle cohomology. It survives in actual total degree $r + q + 1 > q$, contradicting (6.7). We conclude that $r = - 1$.
  At this level the surviving middle cohomology lies in total degree $q$, so its weighted dimension is at most that of actual cohomology there. Since $a'$ is supported on $V'$, where $p'_i = m_i^q \( z' \)$, equations (6.7) and (6.13) give
  #[#set math.equation(numbering: n => "(6.17)")
   $ \( a' \)^(sans(t)) \( p'_T - p_T \) gt.eq n_T^(sans(t)) a gt.eq 0 . $ <eq:two-point-forward>]
  Interchanging the candidates and repeating the argument gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ a^(sans(t)) \( p_T - p'_T \) gt.eq 0 . $ <eq:two-point-reverse>]
  The two algorithms may choose different representatives. The vectors $p \, p' \, a \, a'$, being data of the candidate cosets, are unchanged by these choices.
  The exterior coordinates of $p$ and $p'$ outside $T$ agree. Put $delta = p'_T - p_T$. Then
  $ a' - a = - C_T delta . $
  The sum of the left sides of (6.17) and (6.18) is therefore
  $ \( a' - a \)^(sans(t)) delta = - delta^(sans(t)) C_T delta . $
  Both summands are nonnegative, whereas $C_T$ is positive definite. It follows that $delta = 0$ and equality holds throughout. Thus $p = p'$, $a = a'$, and
  $ V = { i in T : a_i > 0 } = V' \, #h(2em) J = J' . $
  In particular the nonnegative term $n_T^(sans(t)) a$ in (6.17) is zero.
  It remains to identify the cosets, rather than just their numerical data. Fix the comparison element $h_0 = z' z^(- 1)$ using any initial representatives of the two candidates. Replacing these by $b z$ and $c z'$, with $b in A_J$ and $c in A_(J')$, changes it to
  $ c h_0 b^(- 1) . $
  By Lemma 31, the block with row indices in $tilde(V)'$ and column indices in $tilde(V)$ is invariant under all such changes. After the equality just proved, this is the same block $tilde(V) times tilde(V)$ in both directions.
  In the forward comparison no right projective generator has degree above $- 1$. At degree $- 1$, the equality $n_T^(sans(t)) a = 0$, formula (6.11), and strict positivity of all its weights imply
  $ K_(ell beta)^(- 1) = 0 #h(2em) \( ell \, beta in tilde(V) \) . $
  Indeed every summand contributing to a column color in $V$ has a positive coefficient, and all counts are nonnegative. By block invariance, the fixed block for $h_0$ is therefore zero in every degree $d gt.eq - 1$. The reverse comparison proves that the same block for $h_0^(- 1)$ is zero for all $d gt.eq - 1$, irrespective of the representatives chosen in that direction. Formula (6.2) transposes these latter vanishings into vanishing of the block for $h_0$ in all degrees $d lt.eq - 1$. Together the two ranges give
  $ K_(ell beta)^d \( h_0 \) = 0 #h(2em) \( d in bb(Z) \, med ell \, beta in tilde(V) \) . $
  Lemma 38 gives $h_0 in A_(T \\ V) = A_J$. Thus $z' = h_0 z$ and $A_J z' = A_J z$, proving equality of the two candidates. ◻
]

== 7 The isolated harmonic-layer obstruction <sec:rigidity>

For a nonempty spherical type, we prove that prescribed null-vector data outside it force some capped representative to meet a closed layer bound inside it. This supplies the nonemptiness of the closed sublevels used when a harmonic height comparison has a null-vector tie. Throughout this section, $E_L = E_L \( x \) = B_x P_(o \, L)$ denotes the family from Section 5, and $Y_L^d$ denotes its pure layer of level $d$. We retain both the cochain and internal gradings. All signs below are cochain signs.

#thm([Proposition 7.1.])[
  (Isolated harmonic layer).  #emph[Let $I subset.eq S$ be nonempty and connected. Let $c_I$ be a strictly positive vector with $C_I c_I = 0$, and extend $c$ by zero on $hat(S) \\ I$. Let $J subset.eq I$ be spherical, possibly empty, let $q > 0$ be an integer, and fix a coset $A_J x$. Suppose that the fixed data on $\( I \\ J \) union partial I$ are capped at $q$ and satisfy 
#[#set math.equation(numbering: n => "(7.1)")
 $ m^q \|_(\( I \\ J \) union partial I) = c \|_(\( I \\ J \) union partial I) . $ <eq:rigidity-exterior-data>]

 It is impossible that every representative $z in A_J x$ capped at $q$ on $I$ satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ m_j^q \( z \) > c_j #h(2em) upright("for every ") j in J . $ <eq:rigidity-strict-hypothesis>]

 Equivalently, if $J eq.not diameter$ and (7.1) holds, there is a representative capped on $I$ and a color $j in J$ with $m_j^q lt.eq c_j$. If $J = diameter$, the exterior situation (7.1) itself is impossible.]
] <prop:isolated-layer>

The proof assumes the strict inequalities at every capped representative. Convex subobjects turn this hypothesis into an ordinary interior condition on the excess of the level-$q$ multiplicities over $c$. We then remove socles from successive lower layers by positive twists, preserving the cap and the conditions already established. The Hom estimates below justify these moves and force each processed layer to avoid $partial I$. Since the frame contributes at level zero, some layer below $q$ meets $partial I$, giving the contradiction.

=== 7.1 Linear Hom complexes and their three-column filtration <linear-hom-complexes-and-their-three-column-filtration>

Let $P$ and $Y$ be pure projective layers of levels $l$ and $k$, respectively. For $i in { 0 \, 1 \, 2 }$, let $cal(L)_i^(n \, v) \( P \, Y \)$ be the space of maps of path length $i$, cochain degree $n$, and internal degree $v$. Such a space can be nonzero only if

#[#set math.equation(numbering: n => "(7.3)")
 $ n + v = k - l + i . $ <eq:rigidity-hom-degree>]

Indeed, a path-length-$i$ map between generators at placements $\( c \, u \)$ and $\( c' \, u' \)$ has degrees $n = c' - c$ and $v = u' + i - u$. Write $delta_P$ and $delta_Y$ for the linear differentials of the layers. The linear Hom differential is

$ D_1 f = delta_Y f - \( - 1 \)^n f delta_P : cal(L)_i^(n \, v) \( P \, Y \) arrow.r cal(L)_(i + 1)^(n + 1 \, v) \( P \, Y \) . $

Put

$ sans(H)_i^(n \, v) \( P \, Y \) = frac(ker #scale(x: 120%, y: 120%)[\(] D_1 \|_(cal(L)_i^(n \, v) \( P \, Y \)) #scale(x: 120%, y: 120%)[\)], "im" #scale(x: 120%, y: 120%)[\(] D_1 \|_(cal(L)_(i - 1)^(n - 1 \, v) \( P \, Y \)) #scale(x: 120%, y: 120%)[\)]) \, #h(2em) h_i \( P \, Y \) = sum_(n \, v) dim_(bb(C)) sans(H)_i^(n \, v) \( P \, Y \) \, $

where a space with path length outside ${ 0 \, 1 \, 2 }$ is zero. These sums are finite, and the dimensions in them are unsigned. In particular, $sans(H)_0$ has no boundaries: it consists of the homogeneous maps of coefficient arrays commuting with the linear differentials up to the indicated cochain sign. The image of such a map is a graded subrepresentation, after accounting for its placements.

#thm([Lemma 7.2.])[
  (Hom pairing and middle vanishing).  #emph[For pure projective layers $P \, Y$, including those formed from graded subrepresentations, there are perfect pairings 
$ sans(H)_i^(n \, v) \( P \, Y \) med times med sans(H)_(2 - i)^(- n \, thin 2 - v) \( Y \, P \) arrow.r bb(C) . $

 Consequently, 
#[#set math.equation(numbering: n => "(7.4)")
 $ h_2 \( P \, Y \) & = h_0 \( Y \, P \) \,\
\( dim P \)^(sans(t)) tilde(C) thin dim Y & = h_0 \( P \, Y \) + h_0 \( Y \, P \) - h_1 \( P \, Y \) . $ <eq:rigidity-euler>]

 Here $dim P$ and $dim Y$ count projective generators, with all placements included. For any two labels $L \, H$ and any levels $l \, k$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ h_1 \( Y_L^l \, Y_H^k \) = 0 . $ <eq:rigidity-middle-vanishing>]

 The same vanishing holds after replacing either layer by a direct summand as a pure layer.]
] <lem:rigidity-hom-filtration>

#proof[
  The symmetric Frobenius trace of $Z$, normalized by $"tr" \( theta_alpha \) = 1$, pairs paths of length $i$ perfectly with opposite paths of length $2 - i$. On complexes use the supertrace
  $ "Str"_Y \( a \) = sum_c \( - 1 \)^c "tr" \( a \|_(Y^c) \) . $
  Here $Y^c$ denotes the cochain-degree-$c$ term, and the trace includes the ordinary matrix trace on multiplicity spaces. The summandwise pairing $chevron.l f \, g chevron.r = "Str"_Y \( f compose g \)$ is perfect between $cal(L)_i^(n \, v) \( P \, Y \)$ and $cal(L)_(2 - i)^(- n \, 2 - v) \( Y \, P \)$. Cyclicity gives, for the complementary degrees appearing in a differential pairing,
  $ chevron.l D_1 f \, g chevron.r + \( - 1 \)^n chevron.l f \, D_1 g chevron.r = 0 . $
  There is no sign from the internal degree. Finite-dimensional duality therefore gives the asserted perfect pairings on cohomology. This argument uses only the linear differentials and the Frobenius pairing, so it also applies to the pure layers associated with graded subrepresentations.
  The alternating sum of the dimensions of the three path-length columns is $\( dim P \)^(sans(t)) tilde(C) dim Y$: there are two equal-vertex paths, of lengths zero and two, and the length-one paths contribute the negative adjacency entries. Euler characteristic and the pairing of columns zero and two give (7.4).
  For the remaining assertion, consider the full bigraded Hom complex $"Hom"_Z \( E_L \, E_H \)$. Minimality writes each projective differential as a sum of its length-one and length-two parts. Thus its Hom differential is $D_1 + D_2$, where $D_a$ raises path length by $a$. Filter Hom by paths of length at least $i$. There are only the three columns $0 \, 1 \, 2$; the first nonzero differential is $D_1$. Its cohomology decomposes as the direct sum of the spaces above, indexed by the ordered pair of source and target layers. After this page, the only possible differential goes from column zero to column two. Every column-one class is therefore permanent.
  By Proposition 13, applying $B_x$ preserves the bigraded Hom cohomology. Between the initial frame projectives this cohomology is zero when $L eq.not H$. When $L = H$, it has dimension one in each of bidegrees $\( 0 \, 0 \)$ and $\( 0 \, 2 \)$ and is zero elsewhere. Both of these dimensions have specific permanent representatives in the filtration. First, the identity of $E_L$ is a nonzero class in column zero and bidegree $\( 0 \, 0 \)$; a boundary cannot have a length-zero component. Second, choose one projective summand in the nonzero minimal complex $E_L$, and place its normalized token on that diagonal matrix entry, with all other entries zero. This is a cycle in bidegree $\( 0 \, 2 \)$, since a token multiplied on either side by a radical entry is zero. If the chosen summand is in cochain placement $c$, this cycle has supertrace $\( - 1 \)^c eq.not 0$. Every Hom boundary has zero supertrace by graded cyclicity, so the token cycle is nonzero in actual Hom cohomology. It lies in filtration two, and filtration three is zero; hence it supplies a nonzero column-two class in the associated graded cohomology.
  The identity and token exhaust the two actual diagonal Hom dimensions. All actual off-diagonal Hom cohomology vanishes. Since every column-one class is permanent, every such class must be zero, proving (7.5). Finally, a direct summand of a pure layer gives a direct summand of each linear Hom complex. Its column-one cohomology is therefore zero as well. This last argument is on the linear page; it does not assert that the chosen layer summand splits off from the full complex $E_L$. ◻
]

The numerical identity (7.4) parallels Crawley–Boevey’s Hom–Ext formula for preprojective modules #cite(label("CrawleyBoevey2000")) Lemma 1.

We will also use weighted versions of these formulas. For families $cal(P) = \( P_L \)_L$ and $cal(Y) = \( Y_H \)_H$, define the nonnegative real number

$ h_i^(upright("wt")) \( cal(P) \, cal(Y) \) = sum_(L \, H) w_L w_H h_i \( P_L \, Y_H \) . $

These are weighted dimensions, not necessarily integer dimensions of vector spaces. If the two weighted generator arrays are $phi.alt p$ and $phi.alt y$, respectively, then

$ sum_(L \, H) w_L w_H \( dim P_L \)^(sans(t)) tilde(C) dim Y_H = \( phi.alt p \)^(sans(t)) tilde(C) phi.alt y = D_0 p^(sans(t)) C y \, #h(2em) D_0 = sum_L w_L^2 . $

The symmetry of $w_L w_H$ under interchange of the labels gives

#[#set math.equation(numbering: n => "(7.6)")
 $ D_0 p^(sans(t)) C y = h_0^(upright("wt")) \( cal(P) \, cal(Y) \) + h_0^(upright("wt")) \( cal(Y) \, cal(P) \) - h_1^(upright("wt")) \( cal(P) \, cal(Y) \) . $ <eq:rigidity-weighted-euler>]

#thm([Lemma 7.3.])[
  (The capped secondary injection).  #emph[Let $I subset.eq S$, and suppose the family $E_L$ is capped at $q$ on $I$. For every $L$, let $M_L$ be a direct summand of the pure layer $Y_L^q$ supported on $tilde(I)$. If $d < q$, then for every pair of labels $L \, H$ there are injections 
#[#set math.equation(numbering: n => "(7.7)")
 $ sans(H)_0^(n \, v) \( M_L \, Y_H^d \) arrow.r.hook sans(H)_2^(n + 1 \, v) \( M_L \, Y_H^(d - 1) \) \, #h(2em) n + v = d - q . $ <eq:rigidity-secondary-injection>]

 In particular, for $cal(M) = \( M_L \)_L$ and $cal(Y)^d = \( Y_H^d \)_H$, 
#[#set math.equation(numbering: n => "(7.8)")
 $ h_0^(upright("wt")) \( cal(M) \, cal(Y)^d \) lt.eq h_0^(upright("wt")) \( cal(Y)^(d - 1) \, cal(M) \) . $ <eq:rigidity-secondary-bound>]

]
] <lem:rigidity-secondary-injection>

#proof[
  Represent a class on the left of (7.7) by a homogeneous length-zero linear cocycle $f$, and extend it by zero on the other source-layer summands. This is a linear cocycle in $"Hom"_Z \( E_L \, E_H \)$ because $M_L$ is a direct summand for the linear differential. It defines an embedded column-zero class on the page after $D_1$: the linear differential preserves the ordered source/target layer pair, and column zero has no incoming boundaries.
  Write the length-two projective differentials as $d_(E_L)^(\( 2 \))$ and $d_(E_H)^(\( 2 \))$. The secondary differential on this class is represented by
  $ d_(E_H)^(\( 2 \)) f - \( - 1 \)^n f d_(E_L)^(\( 2 \)) . $
  The only possible ordered layer pairs in its target are
  #[#set math.equation(numbering: n => "(7.9)")
   $ \( q \, d - 1 \) & upright("from") & d_(E_H)^(\( 2 \)) f \,\
\( q + 1 \, d \) & upright("from") & f d_(E_L)^(\( 2 \)) . $ <eq:rigidity-secondary-blocks>]
  A length-two entry is diagonal in the unfolded vertex and lowers the layer by one. For the second term in (7.9) to be nonzero, its source would have to lie at level $q + 1$ on a vertex of $tilde(I)$. Such generators are excluded by the cap. Vertices outside $tilde(I)$ cannot contribute through a diagonal length-two entry. Thus the secondary image lies entirely in the first block. The splitting $Y_L^q = M_L xor M'_L$ is a splitting for the linear differential, so it splits the target column-two cohomology by source summands as well. The target-side composite is zero on $M'_L$ and therefore lands in the summand $sans(H)_2 \( M_L \, Y_H^(d - 1) \)$, giving the map in (7.7).
  If a class were in its kernel, it would be permanent: no differential enters column zero, and there is no possible differential after the secondary one. Its total degree is $d - q < 0$. Actual Hom cohomology between $E_L$ and $E_H$ is zero in this degree by the computation in Lemma 40. The class is therefore zero. This proves the injection for each pair of labels before any weighting. Sum the resulting dimension inequalities with positive weights $w_L w_H$ and use the dual pairing of Lemma 40; the result is (7.8). ◻
]

Figure 3 records the two possible secondary targets. The tensor estimate in Figure 2 excluded an incoming secondary differential at a maximal pair of levels. Here the cap removes one outgoing term, so negative-degree Hom vanishing forces injection into the other target.

#figure(
  [Linear part: $C_0 arrow.r^(d_1) C_1 arrow.r^(d_1) C_2$, $H_a = H^a \( C_bullet \, d_1 \)$.
  #cetz.canvas({
  import cetz.draw: *
  content((-2.309, -4.55), [#text(size: 9pt)[Hom: level pair $(q,d)=( "source" , "target" )$; total degree $t=d-q+a$, $d<q$.]], anchor: "west", padding: 0.1176cm)
  content((0, -5.16), [#text(size: 8pt)[length $a=0$]])
  content((5.607, -5.16), [#text(size: 8pt)[length $a=1$]])
  content((11.21, -5.16), [#text(size: 8pt)[length $a=2$]])
  content((0, -6.1), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_0(M,Y^d)$, $M subset.eq Y^q$#linebreak()$t=d-q<0$]]])])
  content((5.607, -6.1), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.6pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$H_1(M,Y^d)=0$#linebreak()permanent middle classes]]])])
  content((11.21, -7.35), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$(q,d-1)$: target block#linebreak()$H_2(M,Y^(d-1))$#linebreak()$t=d-q+1$]]])])
  content((11.21, -9.08), [#box(width: 4.734cm, inset: 0.1411cm, stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$(q+1,d)$: source-side term#linebreak()$f d_E^((2))=0$ by the cap on $I$]]])])
  line((0, -6.575), (0, -7.35), (8.846, -7.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.947, -7.35), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$d_2$ is injective]]])])
  line((0, -7.35), (0, -9.08), (8.846, -9.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((4.452, -9.08), [#box(width: 6.407cm, inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[possible source-side $d_2$#linebreak()$Y^(q+1)_ alpha =0$ for $alpha in tilde(I)$]]])])
})],
  caption: [Figure 3: The Hom length filtration for a direct summand $M$ of $Y^q$ supported on $tilde(I)$, with the family capped at $q$ on $I$. Here $d < q$, and $H_a$ denotes the linear cohomology $sans(H)_a$ with family and bidegree indices suppressed. The secondary differential of a length-zero linear cocycle $f$ has the two displayed target blocks; $d_E^(\( 2 \))$ denotes the length-two part of the source differential. The source-side contribution $f d_E^(\( 2 \))$ vanishes: length-two paths are diagonal and the cap excludes level-$q + 1$ source generators on $tilde(I)$. Higher source generators outside $I$ need not vanish. Negative-degree actual Hom vanishes, forcing injection into the remaining target block. The identity and token classes give the middle vanishing proved in Lemma 40. The dashed arrow marks an excluded possibility. ],
) <fig:hom-filtration>

=== 7.2 Convex subrepresentations and the boundary sign <convex-subrepresentations-and-the-boundary-sign>

The following consequence of the Hom calculation isolates the convex part of the argument. For a family of layers, saying that its socle vanishes on a color set means that this holds at every unfolded vertex of those colors in every member of the family.

#thm([Lemma 7.4.])[
  (Separation from the boundary).  #emph[Let $I subset.eq S$ be nonempty and connected, and let $c$ be zero off $I$ and strictly positive on $I$, with $C_I c_I = 0$. Let $J subset.eq I$. Suppose $cal(M) = \( M_L \)_L$ is a family of direct summands of one pure layer of the family $E_L$, supported on $tilde(I)$, with weighted generator array $phi.alt m$. Assume $m - c$ is supported on $J$ and that $\( m - c \)_J$ is an interior point in $bb(R)^J$ of the convex hull of finitely many vectors $s_J$ with the following properties: $s$ is zero off $J$, and $phi.alt s$ is the weighted generator array of a family of graded subrepresentations $cal(S) = \( S_L \)_L subset.eq cal(M)$ supported on $tilde(J)$.]
  #emph[Let $cal(Y) = cal(Y)^d$ be any layer of the family $E_L$, and write $phi.alt y$ for its weighted generator array. If its socle vanishes on $J$, then 
#[#set math.equation(numbering: n => "(7.10)")
 $ y \|_(partial I) = 0 \, #h(2em) \( C y \)_J = 0 \, #h(2em) h_0^(upright("wt")) \( cal(M) \, cal(Y) \) = h_0^(upright("wt")) \( cal(Y) \, cal(M) \) = 0 . $ <eq:rigidity-separation-conclusions>]

 Here $partial I$ is the outside-neighbor set, including the frame. The assertion includes the usual interior convention in $bb(R)^0$ when $J = diameter$.]
] <lem:rigidity-separation>

#proof[
  Fix one of the subrepresentation families $cal(S)$. A nonzero homogeneous coefficient-array map $S_L arrow.r Y_H$ has a nonzero graded image supported on $tilde(J)$. Such an image has a socle: arrow coefficients raise cochain placement, so a nonzero coefficient in its highest occupied placement is killed by every outgoing arrow. Since the image is a subrepresentation, this is a socle of $Y_H$ on $tilde(J)$. The hypothesis therefore gives
  $ h_0^(upright("wt")) \( cal(S) \, cal(Y) \) = 0 . $
  Also, composition with the inclusion $S_L arrow.r.hook M_L$ gives injections on length-zero linear cocycles, with no length-zero boundaries to quotient out. Thus
  $ h_0^(upright("wt")) \( cal(Y) \, cal(S) \) lt.eq h_0^(upright("wt")) \( cal(Y) \, cal(M) \) . $
  Apply (7.6) first to $\( cal(S) \, cal(Y) \)$ and then to $\( cal(M) \, cal(Y) \)$. The first application uses only $h_1^(upright("wt")) \( cal(S) \, cal(Y) \) gt.eq 0$; the second has $h_1^(upright("wt")) \( cal(M) \, cal(Y) \) = 0$ by Lemma 40. Subtracting gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ D_0 \( m - s \)^(sans(t)) C y gt.eq h_0^(upright("wt")) \( cal(M) \, cal(Y) \) gt.eq 0 . $ <eq:rigidity-convex-inequality>]
  In particular, no middle-Hom vanishing for $cal(S)$ is required.
  The left side of (7.11) is affine-linear in $s$, so the inequality holds throughout the convex hull. At its interior point $e = m - c$, it gives
  #[#set math.equation(numbering: n => "(7.12)")
   $ D_0 c^(sans(t)) C y gt.eq h_0^(upright("wt")) \( cal(M) \, cal(Y) \) gt.eq 0 . $ <eq:rigidity-null-average>]
  On the other hand, symmetry of $C$, the null equation on $I$, and nonnegativity of $y$ give
  #[#set math.equation(numbering: n => "(7.13)")
   $ c^(sans(t)) C y = - sum_(a in.not I) sum_(i in I) b_(a i) c_i y_a lt.eq 0 . $ <eq:rigidity-boundary-sign>]
  This is strictly negative if $y_a > 0$ for any $a in partial I$. Consequently $y \|_(partial I) = 0$, the two sides of (7.12) are zero, and $h_0^(upright("wt")) \( cal(M) \, cal(Y) \) = 0$.
  Because $e_J$ is an ordinary real interior point, for each $j in J$ the hull contains $e_J plus.minus epsilon upright(bold(e))_j$ for sufficiently small $epsilon > 0$. Substituting these two points into (7.11), whose value at $e$ is now zero, forces $\( C y \)_j = 0$. It follows that
  $ m^(sans(t)) C y = c^(sans(t)) C y + \( m - c \)_J^(sans(t)) \( C y \)_J = 0 . $
  The weighted Euler identity, with middle vanishing for $cal(M)$, now forces $h_0^(upright("wt")) \( cal(Y) \, cal(M) \) = 0$ as well. When $J = diameter$, one has $m = c$ and the hull is the singleton in $bb(R)^0$; the same argument applies with no coordinate perturbations. ◻
]

=== 7.3 The socle-removal induction <the-socle-removal-induction>

#proof[
  Assume (7.2) holds at every capped representative. Since $partial J subset.eq \( I \\ J \) union partial I$, Lemma 27 supplies a representative capped on $J$ and hence on all of $I$. We shall move only among such representatives. All the exterior data in (7.1) stay fixed, since operations in $A_J$ change multiplicities only in colors of $J$.
  At any capped representative, let $M_L$ be the part of $Y_L^q$ supported on $tilde(I)$, and set $cal(M) = \( M_L \)_L$. This is a direct summand of the pure layer: its outside neighbors have zero multiplicity at level $q$ by (7.1), so no linear arrow joins it to the rest of that layer. This statement concerns the pure layer, and does not assert a splitting of $E_L$. By Lemma 24, its weighted generator array is $phi.alt m$, where $m$ equals $m^q$ on $I$ and is zero off $I$.
  Harmonizing the full level-$q$ vector on $J$ gives the coordinates $c_J$. Indeed, only neighbors of $J$ enter these equations, their prescribed values are those of $c$, and $C_I c_I = 0$; uniqueness follows from the sphericity of $J$. Remote coordinates outside $I union partial I$ do not enter these equations. Capping a representative on $J$, with the fixed exterior cap, is equivalent to capping it on $I$. Proposition 28 therefore applies with its strict, universally quantified hypothesis. It shows that
  #[#set math.equation(numbering: n => "(7.14)")
   $ e = m - c \, #h(2em) "supp" \( e \) subset.eq J \, #h(2em) e_J in "int"_(bb(R)^J) "conv" { s_J } \, $ <eq:rigidity-interior>]
  where each $s$ is the folded weighted dimension of subrepresentations $cal(S) subset.eq cal(M)$ supported on $tilde(J)$. Such subrepresentations, initially obtained in the full layer, lie in $cal(M)$ because of their support.
  The interior in (7.14) is the ordinary real interior supplied by Proposition 28, even when folded multiplicities are not integers. For $J = diameter$, it means $e = 0$ in $bb(R)^0$.
  Thus Lemma 42 applies at every capped representative. This uniformity is essential: both $cal(M)$ and its convex hull may change during the following operations, but the hypothesis (7.2) supplies (7.14) anew after each cap-preserving move.
  Let $d_b$ be the lowest layer that meets $partial I$. This level exists because the frame $o$ belongs to $partial I$ and $m_o^0 = 1$. It is fixed throughout the coset, and
  #[#set math.equation(numbering: n => "(7.15)")
   $ d_b lt.eq 0 < q . $ <eq:rigidity-boundary-level>]
  Choose an integer $d_min$ below or equal to every initially occupied layer of every member of the family. Positive operations cannot create layers below $d_min$ by their amplitude. We shall proceed through $d = d_min \, dots.h \, d_b$. At the beginning of a stage, the induction conditions are, for every $k < d$,
  #[#set math.equation(numbering: n => "(7.16)")
   $ "soc"_(tilde(J)) cal(Y)^k & = 0 \, & \( C m^k \)_J & = 0 \,\
h_0^(upright("wt")) \( cal(Y)^k \, cal(M) \) & = 0 \, & h_0^(upright("wt")) \( cal(M) \, cal(Y)^k \) & = 0 . $ <eq:rigidity-induction>]
  Here $m^k$ is the folded vector of the full layer $cal(Y)^k$, and $cal(M)$ always denotes the current level-$q$ summand. The conditions hold initially since all lower layers are zero.
  Since $d lt.eq d_b < q$, Lemma 41 and the condition at $d - 1$ give
  #[#set math.equation(numbering: n => "(7.17)")
   $ h_0^(upright("wt")) \( cal(M) \, cal(Y)^d \) = 0 . $ <eq:rigidity-current-hom-zero>]
  Suppose that $cal(Y)^d$ has a nonzero socle in a color $j in J$. Then $cal(M)$ has zero top in that color. To see this, a top simple quotient of some $M_L$ and a socle simple of some $Y_H^d$ at the same unfolded vertex compose to a nonzero homogeneous length-zero map. Lemma 24 ensures that if a top occurs anywhere in color $j$ in the family, then it occurs at every label in that color in some family member. It can therefore be matched with the label of the chosen socle. The resulting map would contradict (7.17), since every weight is positive.
  Apply $F_j$ to this representative. The top of $cal(M)$ at color $j$ is the top of the full level-$q$ layer there, because $cal(M)$ is a direct summand containing that color. Its vanishing makes this move cap-preserving by Lemma 27. Concretely, the only new level-$q + 1$ contribution from the level-$q$ layer is this top; higher layers have no generators on $I union partial I$, and the twist acts identically on that remote part. Other colors keep their multiplicities.
  We next prove that this move preserves (7.16) and changes the level-$d$ layer only by its unshifted positive operation. Denote the data immediately before and after the move by “old” and “new”. For this single move, ascend again through the integers $k < d$, starting below all occupied layers. Suppose that the old top at color $j$ in level $k - 1$ has already been shown to vanish. This is vacuous at the starting level. Lemma 15 then identifies
  #[#set math.equation(numbering: n => "(7.18)")
   $ cal(Y)_(upright("new"))^k tilde.equiv upright("the level-") k upright(" part of ") F_j cal(Y)_(upright("old"))^k . $ <eq:rigidity-unshifted-step>]
  Indeed, the level-$k$ term from the old level $k - 1$ is exactly its top in color $j$, and no other input layer contributes at $k$. By Lemma 18, the vanishing of the old socle on $J$ implies the vanishing of the new socle on $J$ in (7.18).
  The new representative is capped, so Lemma 42 applies using its new family $cal(M)_(upright("new"))$. As $k < d lt.eq d_b$, the layer has no boundary support. The lemma yields all the new conditions (7.16) at this $k$, including $\( C m_(upright("new"))^k \)_j = 0$. The old row is also zero, and all multiplicities off color $j$ are unchanged. Since $C_(j j) = 2$, comparison of the two rows gives
  $ 2 #scale(x: 120%, y: 120%)[\(] m_(upright("new") \, j)^k - m_(upright("old") \, j)^k #scale(x: 120%, y: 120%)[\)] = 0 . $
  Let $t_j^k gt.eq 0$ be the folded weighted top multiplicity of $cal(Y)_(upright("old"))^k$ in color $j$. Formula (4.5), together with (7.18), says
  $ m_(upright("new") \, j)^k = m_(upright("old") \, j)^k - \( C m_(upright("old"))^k \)_j + t_j^k . $
  Thus $t_j^k = 0$. Positivity of the weights makes every old top in this color zero, providing the premise at $k + 1$. This completes the upward verification. In particular, the old top at level $d - 1$ is zero, so (7.18) also holds at $k = d$.
  The order of this verification is important: the absence of a shifted-in contribution at $k$ uses the top vanishing already established at $k - 1$; the top vanishing at $k$ is then deduced from the new row equation and the pure-layer dimension formula. Hence no assertion about the level being checked is assumed in advance. The verification also proves that (7.17) can be used again after the move, with the new $cal(M)$, by Lemma 41.
  Continue applying $F_j$ whenever a socle in a color $j in J$ remains in level $d$. This process terminates. To prove it, consider only the unshifted operations on that fixed pure layer. By Lemma 16, a composite is the bottom cohomology of the corresponding positive word, so these operations satisfy the positive braid relations. A last-action color has zero socle after its operation by Lemma 18. Inductively suppose the colors used so far form a reduced expression for $w in W_J$, with the most recent operation written on the left. If the next chosen color $j$ were a left descent of $w$, a reduced expression for $w$ would begin with $j$. Braid moves would therefore express the current pure layer as the result of an unshifted $F_j$ operation acting last. Its socle in color $j$ would be zero, contradicting the choice of $j$. Each choice is consequently a Coxeter ascent. Since $W_J$ is finite, the number of choices at level $d$ is bounded by the length of its longest element.
  At termination, the socle on $J$ vanishes in the current layer $d$. If $d < d_b$, Lemma 42 supplies (7.16) also at $k = d$, and we proceed to the next level. The range from $d_min$ to $d_b$ is finite, and the earlier conditions were preserved during every move. At $d = d_b$, the same lemma asserts that the layer has no support on $partial I$, contradicting the definition of $d_b$.
  If $J = diameter$, the procedure contains no firing steps: the socle condition on $J$ is vacuous, (7.14) says $m = c$, and Lemma 42 already contradicts the boundary layer. Thus the dimension-zero case is included. The contradiction proves the proposition. ◻
]

== 8 Sublevels in spherical residues <sec:residues>

Inside a spherical coset, we consider smaller cosets whose exposed layer counts lie below the ambient harmonic vector. The two-point estimate will show that a nonempty sublevel has only one source in its vertex filtration. The isolated-layer obstruction has a different role: for the closed inequalities associated with a positive null vector, it guarantees nonemptiness and excludes the rank-zero exterior data. We begin with the topological principle that converts the link calculations into contractibility.

#thm([Lemma 8.1.])[
  (Vertex filtration).  #emph[Let $cal(P)$ be a set-sized poset, and well-order its elements by $prec$. For $v in cal(P)$, define the earlier lower and upper posets 
$ cal(L)_v = { w in cal(P) : w < v \, med w prec v } \, #h(2em) cal(U)_v = { w in cal(P) : v < w \, med w prec v } . $

 The link along which $v$ is added to the induced order complex on its predecessors is the simplicial join of the order complexes of $cal(L)_v$ and $cal(U)_v$. If one poset is empty, this link is the order complex of the other; if both are empty, the link is empty.]
  #emph[Suppose each attaching link is empty or contractible. Then every component of $\| cal(P) \|$ is contractible and contains exactly one #emph[source], meaning a vertex with empty attaching link. In particular, the conclusion holds if each of $cal(L)_v$ and $cal(U)_v$ is empty or contractible for every $v$.]
] <lem:filtration-principle>

#proof[
  A chain containing $v$ consists of a chain below $v$, the vertex $v$, and a chain above $v$. Every element of the first chain precedes every element of the second in the poset order. Restricting all other vertices to those earlier than $v$ proves the asserted join description. The join of two nonempty contractible complexes is contractible. Together with the stated conventions for empty factors, this proves the last assertion from the first one.
  Index the vertices as $v_alpha$, $alpha < kappa$, and let $K_alpha$ be the induced order complex on ${ v_beta : beta < alpha }$. At a successor stage we attach the cone on the earlier link $L_alpha$:
  $ K_(alpha + 1) = K_alpha union_(L_alpha) \( v_alpha * L_alpha \) . $
  An empty link adds an isolated vertex and starts one component. A nonempty contractible link lies in a single component of $K_alpha$. The inclusion of that link in its cone is a homotopy equivalence and a subcomplex cofibration. The homotopy extension property therefore makes the induced inclusion of the old component into the new one a homotopy equivalence. No other component changes, and two old components cannot merge. Thus the asserted description of components and their sources persists at successor stages.
  At a limit ordinal $lambda$, the complex is the union of the earlier subcomplexes, with the CW topology. We recall why compact images cause no difficulty in this union. A compact subset of a closure-finite CW complex lies in a finite subcomplex. Otherwise it meets infinitely many open cells; choose one point in each of a countable set of these cells. Every subset of the chosen points meets each closed cell in a finite set, by closure-finiteness, and hence is closed in the whole complex by the weak topology. The chosen points would therefore form an infinite closed discrete subspace of the compact subset, a contradiction. The closures of the finitely many cells met by a compact subset form the required finite subcomplex.
  Consequently a path or a sphere map in $K_lambda$ has image in some $K_alpha$ with $alpha < lambda$: only finitely many vertex indices occur in its finite carrier. Paths cannot merge previously distinct components at the limit. Every sphere map within a component is null-homotopic in an earlier component, which is contractible by induction. Each component of $K_lambda$ is thus weakly contractible and has the same unique source as any of its earlier vertices. Components are CW subcomplexes, so the CW Whitehead theorem makes them contractible. Transfinite induction, including the final union, proves the result. ◻
]

We will also use the order homotopy observation that an order map $f : cal(P) arrow.r cal(P)$ satisfying $f \( x \) lt.eq x$ for every $x$, or $f \( x \) gt.eq x$ for every $x$, induces a map homotopic to the identity. For example, when $f \( x \) lt.eq x$, the assignments $\( x \, 0 \) mapsto f \( x \)$ and $\( x \, 1 \) mapsto x$ form an order map from $cal(P) times { 0 < 1 }$: if $x lt.eq y$, then $f \( x \) lt.eq y$. The usual prism triangulation on every chain gives the homotopy, and these homotopies agree on faces. Thus an order retraction pointwise comparable with the identity is a homotopy equivalence on order complexes. A poset with a maximum has a conical order complex.

=== 8.1 The two local sublevels <the-two-local-sublevels>

Fix a spherical subset $T subset.eq S$, an integer $q$, and a right coset $A_T x$. Assume that the layer data are capped at $q$ on $partial T$. Operations in $A_T$ leave all exterior data unchanged, so this assumption is independent of the representative. Let $b$ be the full vector obtained from $m^q \( x \)$ by harmonic extension on $T$:

$ b_i = m_i^q \( x \) quad \( i in.not T \) \, #h(2em) \( C b \)_T = 0 . $

The vector $b$ is nonnegative and independent of $x$ within its coset. Here and throughout, caps concern all levels greater than $q$, whereas the displayed inequalities concern level $q$ alone.

Consider pairs

#[#set math.equation(numbering: n => "(8.1)")
 $ X = \( J \, A_J z \) \, #h(2em) J subset.neq T \, #h(2em) z in A_T x \, $ <eq:residues-pairs>]

ordered by nested types and actual inclusion of cosets. The open colors of $X$ are $V = T \\ J$. Counts and caps on $V$ are well-defined on $A_J z$, since operations in $A_J$ change data only in colors of $J$.

The #emph[strict sublevel] $cal(R)_(<) \( T \, A_T x \; q \)$ consists of the pairs in (8.1) for which every $i in V$ is capped at $q$ and satisfies

#[#set math.equation(numbering: n => "(8.2)")
 $ m_i^q \( z \) < b_i . $ <eq:residues-strict>]

We use a closed sublevel only with the following additional data:

+ $q > 0$;
+ $I subset.eq S$ is nonempty and connected, with $T subset.eq I$;
+ $c_I > 0$ and $C_I c_I = 0$, and $c$ is extended by zero outside $I$;
+ on $\( I \\ T \) union partial I$ the data are capped at $q$ and satisfy $m^q = c$.

These are exterior conditions for $A_T x$. In particular they imply the assumed cap on $partial T$. Harmonicity and uniqueness of extension give $b_T = c_T$. The #emph[special closed sublevel] $cal(R)_lt.eq \( T \, A_T x \; q \, I \, c \)$ consists of the pairs in (8.1) for which every $i in V$ is capped at $q$ and satisfies

#[#set math.equation(numbering: n => "(8.3)")
 $ m_i^q \( z \) lt.eq b_i = c_i . $ <eq:residues-closed>]

No connectedness assumption is imposed on $T$.

#thm([Proposition 8.2.])[
  (Spherical-residue sublevels).  #emph[For every nonempty spherical $T$ and the data just specified:]
  + #emph[$cal(R)_(<) \( T \, A_T x \; q \)$ is empty or contractible;]
  + #emph[whenever the additional exterior hypotheses hold, $cal(R)_lt.eq \( T \, A_T x \; q \, I \, c \)$ is nonempty and contractible.]
  #emph[For $T = diameter$, the strict sublevel is empty, and the exterior hypotheses for the special closed sublevel cannot hold.]
] <prop:residue-sublevels>

#proof[
  We first dispose of nonemptiness and the rank-zero convention. If $T = diameter$, there is no proper subset $J$ in (8.1), so the strict sublevel is empty. The closed exterior hypotheses would prescribe a cap and $m^q = c$ on $I union partial I$. This is precisely the rank-zero situation excluded by Proposition 39.
  Now let $T eq.not diameter$ and assume the closed exterior hypotheses. Lemma 27 gives a representative capped on $T$, and hence on $I$. If the closed sublevel were empty, then at every such representative $z$ one would have $m_j^q \( z \) > c_j$ for every $j in T$. Indeed, any $j$ with $m_j^q \( z \) lt.eq c_j$ would give the allowed pair $\( T \\ { j } \, A_(T \\ { j }) z \)$. The resulting strict inequalities at every capped representative contradict Proposition 39, applied with its spherical subset equal to $T$. Thus the closed sublevel is nonempty.
  We prove the contractibility assertions together by induction on $\| T \|$, with the conventions just established as the base. Let $cal(R)$ denote either of the two sublevels, and suppose that the proposition holds for all smaller spherical subsets. For $X = \( J \, A_J z \) in cal(R)$, define $p_X$ by
  $ \( p_X \)_i = m_i^q \( z \) quad \( i in.not J \) \, #h(2em) \( C p_X \)_J = 0 \, #h(2em) u_X = \( p_X \)_T - b_T . $
  This vector is independent of the representative of $A_J z$. On $V = T \\ J$ it satisfies $\( u_X \)_i = m_i^q \( z \) - b_i lt.eq 0$. Harmonic extension gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ \( u_X \)_J = - C_J^(- 1) C_(J \, V) \( u_X \)_V lt.eq 0 \, #h(2em) \( C p_X \)_T = C_T u_X . $ <eq:residues-harmonic-difference>]
  The inequality uses nonnegativity of $C_J^(- 1)$ and nonpositivity of the off-diagonal entries of $C$; the formula includes the empty $J$ convention. In particular $u_X lt.eq 0$ coordinatewise. In the strict sublevel $u_X eq.not 0$, since $V$ is nonempty and all of its inequalities are strict.
  Filter the vertices by increasing height
  $ h \( X \) = sum_(i in T) \( u_X \)_i lt.eq 0 . $
  Only finitely many height values occur. For each possible type $J$, the open counts belong to bounded intervals $0 lt.eq m_i^q \( z \) lt.eq b_i$, and each such interval contains only finitely many possible layer counts, by Section 5. The exterior vector is fixed, and harmonic extension determines the remaining coordinates. There are only finitely many types. At equal negative height put larger $\| J \|$ first; at height zero put smaller $\| J \|$ first. Break all remaining ties by any well-order. This gives a well-order of $cal(R)$. Remaining ties occur only between incomparable distinct vertices, so they do not affect any earlier lower or upper part.
  #emph[The upper part at nonzero height.] Fix $X = \( J \, A_J z \)$ with $u = u_X eq.not 0$, and put $V = T \\ J$. Every upper extension has the unique form $\( K \, A_K z \)$ with $J subset.neq K subset.neq T$. It is allowed because its open colors are a subset of $V$ and retain the same data. Writing $p_K$ for its harmonic vector, the change is supported on $K$ and is
  #[#set math.equation(numbering: n => "(8.5)")
   $ \( p_K - p_X \)_K = - C_K^(- 1) \( C_T u \)_K . $ <eq:residues-upper-change>]
  The rows $\( C_T u \)_J$ vanish. Set
  $ D = { i in V : \( C_T u \)_i gt.eq 0 } . $
  If $K \\ J$ avoids $D$, all its rows in (8.5) are strictly negative. The nonnegative inverse, with positive diagonal, makes the total change in height strictly positive. Such an extension is later. If instead $diameter eq.not K \\ J subset.eq D$, the change is coordinatewise nonpositive, so the extension is earlier: a strict height decrease suffices, and equality is resolved in its favor by the larger type at the negative height $h \( X \)$.
  It follows that every earlier upper extension meets $D$ in a new color, whereas every extension using only new colors in $D$ is earlier. Also $D eq.not V$. Otherwise $C_T u gt.eq 0$, and $u = C_T^(- 1) C_T u gt.eq 0$, contradicting $u lt.eq 0$ and $u eq.not 0$. If $D = diameter$, the earlier upper part is empty. If $D eq.not diameter$, define on that part
  $ \( K \, A_K z \) mapsto #scale(x: 120%, y: 120%)[\(] K ∩ \( J union D \) \, A_(K ∩ \( J union D \)) z #scale(x: 120%, y: 120%)[\)] . $
  The new type properly contains $J$, uses only new colors in $D$, and is a proper subset of $T$. Hence the image is an earlier upper extension. This order map is below the identity and retracts onto the subposet of extensions whose types are contained in $J union D$. That subposet has maximum $\( J union D \, A_(J union D) z \)$, which is itself earlier. Thus the earlier upper part is contractible.
  #emph[The lower part at nonzero height.] Since equal negative heights place larger types first, every earlier lower pair has strictly smaller height. Write such a pair as $Y = \( R \, A_R w \)$, where $R subset.neq J$ and $w in A_J z$. Its newly open colors are $U = J \\ R$. The vector $delta = p_Y - p_X$ vanishes outside $J$, equals $m_i^q \( w \) - \( p_X \)_i$ on $U$, and is harmonic on $R$. If every one of these new open differences were nonnegative, nonnegative harmonic interpolation on $R$ would give $delta gt.eq 0$ and preclude a strict height decrease. Therefore the set
  $ N \( Y \) = { i in J \\ R : m_i^q \( w \) < \( p_X \)_i } $
  is nonempty. All its colors are capped, since $Y$ is allowed. Close the other newly open colors by defining
  #[#set math.equation(numbering: n => "(8.6)")
   $ rho \( Y \) = #scale(x: 120%, y: 120%)[\(] J \\ N \( Y \) \, A_(J \\ N \( Y \)) w #scale(x: 120%, y: 120%)[\)] . $ <eq:residues-lower-retraction>]
  This pair is well-defined on the coset $A_R w$: both the tests on $J \\ R$ and the larger coset are unchanged if $w$ is replaced by another element of $A_R w$.
  The boundary data on $partial J$ are capped. Indeed a neighbor outside $J$ lies either in $V$ or in $partial T$, where the cap is already known. The harmonic bound for the residue $\( J \, A_J z \)$ is exactly $p_X$. Consequently (8.6) belongs to the strict sublevel $cal(R)_(<) \( J \, A_J z \; q \)$. Viewed as a pair inside $A_T x$, it is allowed: its new open counts are strictly below $p_X lt.eq b$, and its old open colors $V$ retain their original inequalities. Its harmonic difference from $p_X$ is strictly negative on the nonempty set $N \( Y \)$ and is a nonnegative interpolation of these differences on the remaining colors of $J$. It is therefore coordinatewise nonpositive with strictly negative sum. Thus $rho \( Y \)$ remains an earlier lower pair.
  For completeness, this closure respects actual coset inclusions when representatives differ. Suppose
  $ \( R_1 \, A_(R_1) w_1 \) lt.eq \( R_2 \, A_(R_2) w_2 \) . $
  Then $R_1 subset.eq R_2$ and $w_1 in A_(R_2) w_2$. On their shared open colors $J \\ R_2$ the counts agree, whence
  $ N \( Y_2 \) = N \( Y_1 \) ∩ \( J \\ R_2 \) subset.eq N \( Y_1 \) . $
  Writing $K_a = J \\ N \( Y_a \)$, we obtain $K_1 subset.eq K_2$. Moreover $R_2 subset.eq K_2$, so $w_1 in A_(K_2) w_2$ and
  $ A_(K_1) w_1 subset.eq A_(K_2) w_2 . $
  This proves that $rho$ is an order map. It lies above the identity because $R subset.eq J \\ N \( Y \)$.
  Conversely, any pair in $cal(R)_(<) \( J \, A_J z \; q \)$ is an allowed earlier lower pair in $cal(R)$: the same interpolation argument gives a strict decrease of height, and $p_X lt.eq b$ gives the outer inequalities. All its newly open colors pass the strict test, so $rho$ fixes it. Thus $rho$ is an order retraction onto exactly that strict sublevel. Since $J subset.neq T$, induction says that the earlier lower part is empty or contractible. This includes $J = diameter$, when both lower posets are empty.
  #emph[The zero-height case.] If $u_X = 0$, the pair lies in the special closed sublevel. All open colors have $m_i^q \( z \) = c_i$ and are capped. An upper extension retains $p_X = b$, so its height remains zero and its larger type makes it later. There is no earlier upper part. Every allowed lower pair is earlier: its height is either negative, or zero with a smaller type.
  The lower part is exactly $cal(R)_lt.eq \( J \, A_J z \; q \, I \, c \)$. Its exterior hypotheses follow from the original ones together with the equalities and caps on $V = T \\ J$: these sets supply all of $\( I \\ J \) union partial I$. If $J = diameter$, those hypotheses contradict the rank-zero case. Hence $J eq.not diameter$, and induction makes this earlier lower part nonempty and contractible.
  #emph[Sources.] We have shown that every earlier lower and upper part is empty or contractible. Lemma 43 therefore makes each component contractible with exactly one source. The zero-height case has a nonempty earlier lower part, so a source must have $u_X eq.not 0$. The upper calculation then forces $D = diameter$, and the strict lower sublevel for $\( J \, A_J z \)$ must be empty.
  These facts give all the hypotheses of a candidate in Proposition 30, for the fixed ambient coset $A_T x$ and cap $q$. The colors $V$ are capped by definition. Equation (8.4) gives
  $ - \( C p_X \)_i = - \( C_T u_X \)_i > 0 quad \( i in V \) \, #h(2em) \( C p_X \)_J = 0 . $
  Finally consider #emph[any] representative $w in A_J z$ capped on $T$. If $m_j^q \( w \) < \( p_X \)_j$ for some $j in J$, the pair $\( J \\ { j } \, A_(J \\ { j }) w \)$ would belong to the strict lower sublevel. Its emptiness therefore proves
  $ m_j^q \( w \) gt.eq \( p_X \)_j #h(2em) \( j in J \) $
  at every such capped representative, as required. For $J = diameter$ this condition is vacuous.
  Proposition 30 gives at most one source in $cal(R)$. A nonempty $cal(R)$ has a first vertex in the filtration and hence a source. It therefore has one component and is contractible. The special closed sublevel was already shown to be nonempty. This completes both inductions. ◻
]

== 9 The global harmonic filtration <sec:global>

We now filter the entire spherical-coset poset. Throughout the construction assume that $S eq.not diameter$; the empty system will be included in the final theorem. Recall that $cal(D)$ consists of the right cosets $A_T x$, with $T$ spherical, ordered by inclusion with nested types. All realizations of posets have the CW topology.

=== 9.1 Harmonic vectors and a well-ordered height <harmonic-vectors-and-a-well-ordered-height>

For a spherical subset $T subset.eq S$ and a vector $v in bb(R)^(hat(S))$, let $sans(H)_T \( v \)$ be the vector that agrees with $v$ outside $T$ and is harmonic on $T$. Thus

#[#set math.equation(numbering: n => "(9.1)")
 $ sans(H)_T \( v \)_(hat(S) \\ T) = v_(hat(S) \\ T) \, #h(2em) sans(H)_T \( v \)_T = C_T^(- 1) (sum_(j in.not T) b_(i j) v_j)_(i in T) . $ <eq:global-harmonization>]

For $T = diameter$, this is the identity. Nonnegativity of $C_T^(- 1)$ shows that $sans(H)_T$ preserves nonnegative vectors.

For $P = A_T x in cal(D)$ and every integer $k$, put

#[#set math.equation(numbering: n => "(9.2)")
 $ p^k \( P \) = sans(H)_T #scale(x: 120%, y: 120%)[\(] m^k \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:global-coset-vector>]

Operations in a color of $T$ change the layer multiplicities only in that color. Therefore all $m_i^k \( x \)$ with $i in.not T$ are constant on $A_T x$, and (9.2) is independent of its representative. The vectors $p^k \( P \)$ are nonnegative and have finite support in $k$. The frame coordinate satisfies

#[#set math.equation(numbering: n => "(9.3)")
 $ p_o^k \( P \) = m_o^k \( x \) = cases(delim: "{", 1 \, & k = 0 \,, 0 \, & k eq.not 0 .) $ <eq:global-frame>]

For example, the identity representative has $m^0 \( 1 \) = epsilon_o$ and all other layers zero, because its family consists of the frame projectives themselves. On the coset $A_T$ this gives $p_T^0 \( A_T \) = C_T^(- 1) upright(bold(1))$, with frame coordinate $1$ and all other exterior coordinates zero. In rank one the interior coordinate is $1 \/ 2$. This is the simplest instance of replacing generator counts by harmonic coset data.

We shall repeatedly use two harmonic comparison formulas. If $P = A_T x subset.eq A_U x = P'$ with $U$ spherical, then the difference $p^k \( P' \) - p^k \( P \)$ is supported on $U$, and

#[#set math.equation(numbering: n => "(9.4)")
 $ #scale(x: 120%, y: 120%)[\(] p^k \( P' \) - p^k \( P \) #scale(x: 120%, y: 120%)[\)]_U = - C_U^(- 1) #scale(x: 120%, y: 120%)[\(] C p^k \( P \) #scale(x: 120%, y: 120%)[\)]_U . $ <eq:global-upper-change>]

Indeed the two vectors agree outside $U$ and the new vector has zero $C$-rows on $U$.

For a lower coset $Q = A_R z subset.eq P = A_T x$, set $V = T \\ R$. The two vectors agree outside $T$. Writing $delta_i = m_i^k \( z \) - p_i^k \( P \)$ for $i in V$, their difference $Delta = p^k \( Q \) - p^k \( P \)$ satisfies

#[#set math.equation(numbering: n => "(9.5)")
 $ Delta_V = delta_V \, #h(2em) Delta_R = C_R^(- 1) (sum_(j in V) b_(i j) delta_j)_(i in R) . $ <eq:global-lower-change>]

Both formulas also hold when one of the displayed types is empty. In particular, componentwise nonnegative or nonpositive changes on the open coordinates extend with the same sign. A nonzero change on an open coordinate remains nonzero in the full vector.

Fix an ordering of $hat(S)$. For a nonnegative vector, its positive-support components mean the connected components of the graph on its positive coordinates, using the edges with $b_(i j) > 0$. Boundaries of these components are taken in $hat(S)$, and may contain the frame.

The comparison formulas suggest ordering cosets by their harmonic vectors, from higher nonnegative layers down, but equal vectors still require a choice. Suppose that adjoining a color with positive coordinate leaves the vector at the comparison level unchanged. Our ordinary preference will put the larger type first, by assigning $- 1$ to each positive coordinate belonging to the type. Zero coordinates contribute nothing to this tie; they may leave the comparison to a lower level.

We reverse this preference on a positive-support component $I subset.eq S$ at a level $k > 0$ when $p^k \( P \)$ is harmonic on $I$ and all higher vectors vanish on $I union partial I$. The vector on such a component is a positive null vector for its Cartan matrix. The upper-link proof must exclude this singular alternative when it retracts the earlier upper part to extensions contained in one spherical type; this is why the preference cannot be uniform. Assigning $+ 1$ on this component instead puts those tied additions later. The same choice puts removal of an equal positive coordinate earlier, so the lower comparison must allow equality with the harmonic bound. This is the role of the special closed sublevels in Proposition 44, whose nonemptiness comes from the isolated-layer obstruction. The upper and lower verifications appear in Lemmas 48 and 52. The following definition encodes both preferences in the type-dependent integer at each level.

#prodef([Definition 9.1.])[
  For $P = A_T x$, $k gt.eq 0$, and $i in hat(S)$, define a sign $eta_i^k \( P \)$ as follows. It is zero if $p_i^k \( P \) = 0$. If $p_i^k \( P \) > 0$, let $I$ be its positive-support component at level $k$. Set $eta_i^k \( P \) = + 1$ precisely when
  #[#set math.equation(numbering: n => "(9.6)")
   $ k > 0 \, #h(2em) I subset.eq S \, #h(2em) #scale(x: 120%, y: 120%)[\(] C p^k \( P \) #scale(x: 120%, y: 120%)[\)]_I = 0 \, #h(2em) p_j^d \( P \) = 0 quad \( j in I union partial I \, med d > k \) . $ <eq:global-null-sign>]
  In every other positive-coordinate case set $eta_i^k \( P \) = - 1$. Define the level block
  #[#set math.equation(numbering: n => "(9.7)")
   $ sans(b)_k \( P \) = (sum_(i in hat(S)) p_i^k \( P \) \, med \( p_i^k \( P \) \)_(i in hat(S)) \, med sum_(i in T) eta_i^k \( P \)) . $ <eq:global-height-block>]
  Within a block use lexicographic order: first the sum, then the vector in the fixed coordinate order, then the integer. Compare the finite-support sequences $\( sans(b)_k \( P \) \)_(k gt.eq 0)$ at their highest differing level, with the smaller block earlier. Finally, choose a well-order of each set of cosets with identical block sequences.
] <def:global-sign-height>

Thus the sign comparison at level $k$ precedes every comparison at a lower level. The signs are functions only of the vectors at level $k$ and above; if those vectors coincide for two cosets, the same signs are used at that level.

#thm([Lemma 9.2.])[
  #emph[Definition 45 gives a well-order of the vertices of $cal(D)$. Distinct comparable cosets have different block sequences, so the final tie refinement does not affect either of their earlier links.]
] <lem:global-well-order>

#proof[
  The weighted layer counts of Section 5 have only finitely many possible values in a bounded interval, uniformly over the level. Indeed, for any fixed unfolded label the count is a nonnegative integer combination of finitely many fixed positive weights, up to a fixed positive proportionality factor. A bound on the count bounds each integer coefficient. This proves the asserted finiteness without requiring the real weights to lie in a lattice.
  If $sum_i p_i^k \( P \) lt.eq B$, every exterior coordinate $m_i^k \( x \) = p_i^k \( P \)$ for $i in.not T$ lies in $\[ 0 \, B \]$. There are therefore only finitely many exterior vectors. For a fixed type $T$, (9.1) determines the interior vector uniquely. There are only finitely many spherical types. Consequently there are only finitely many possible primary vectors with sum at most $B$, uniformly over $P$ and $k$. The secondary integer in (9.7) lies between $- \| S \|$ and $\| S \|$.
  The set of possible level blocks thus has only finitely many predecessors below any one of its members. Adjoin the zero block if necessary. It is the least block: a zero primary vector has all signs zero, whereas every nonzero primary vector has positive sum. Assign to each block its rank $n \( sans(b) \) in bb(Z)_(gt.eq 0)$ in this order, with $n \( 0 \) = 0$. For a finite-support sequence, the ordinal
  $ omega^N n \( sans(b)_N \) + omega^(N - 1) n \( sans(b)_(N - 1) \) + dots.h.c + omega n \( sans(b)_1 \) + n \( sans(b)_0 \) < omega^omega $
  has exactly the prescribed highest-level-first comparison. The block sequences are therefore well ordered. A well-ordered refinement of each fiber is again a well-order. Such a refinement may also be obtained from an enumeration of words in the finitely generated group and the finitely many types.
  It remains to examine comparable ties. For every $i in T$, the frame and (9.1) give
  #[#set math.equation(numbering: n => "(9.8)")
   $ p_T^0 \( P \) gt.eq C_T^(- 1) upright(bold(1)) > 0 . $ <eq:global-level-zero-positive>]
  All signs on positive coordinates at level zero are $- 1$, so the secondary value at that level is exactly $- \| T \|$. Suppose $A_T x subset.eq A_U x$ and all nonnegative primary vectors agree. If $T eq.not U$, their level-zero secondary values differ. If $T = U$, the two nested cosets are equal. Hence distinct comparable vertices are never fully tied. Negative levels may distinguish further incomparable cosets, but their omission cannot change this conclusion or the well-ordering argument. ◻
]

Write $Q prec P$ for the resulting order of vertices. We must show that the earlier strict lower and strict upper parts at every $P$ are each empty or contractible.

=== 9.2 The earlier upper part <the-earlier-upper-part>

Fix $P = A_T x$. For each $i in S \\ T$, let

#[#set math.equation(numbering: n => "(9.9)")
 $ H_i = max { k gt.eq 0 : p_i^k \( P \) > 0 upright(" or ") p_j^k \( P \) > 0 upright(" for some ") j upright(" with ") b_(i j) > 0 } . $ <eq:global-incidence-level>]

This maximum exists: the vectors have finite level support, and the frame is a positive neighbor at level zero. Call $i$ #emph[active] when

#[#set math.equation(numbering: n => "(9.10)")
 $ \( C p^(H_i) \( P \) \)_i > 0 \, #h(2em) upright("or") #h(2em) \( C p^(H_i) \( P \) \)_i = 0 med upright(" and ") med eta_i^(H_i) \( P \) = - 1 . $ <eq:global-active>]

Let $"Act" \( P \)$ be the set of active colors. If the row in (9.10) is zero, the coordinate $p_i^(H_i) \( P \)$ is positive: otherwise the zero row would force all its neighboring coordinates to vanish, contrary to the definition of $H_i$.

#thm([Lemma 9.3.])[
  #emph[Every earlier upper extension of $P$ adds an active color. Every spherical upper extension adding a nonempty set of active colors and no other colors is earlier than $P$.]
] <lem:global-upper-comparison>

#proof[
  Let $P' = A_U x$ with $T subset.neq U$ spherical, and put $H = max_(i in U \\ T) H_i$. At levels above $H$, the coordinates at every added color and all of its neighbors vanish. The $T$-rows of $C p^k \( P \)$ vanish by harmonicity, and the added rows vanish by this incidence condition. Formula (9.4) shows that the vectors agree above $H$. All added signs are zero there, so the secondary values agree as well.
  At level $H$, an added color with $H_i < H$ has zero coordinate, zero row, and zero sign. Suppose first that no added color is active. An added color with $H_i = H$ has row at most zero. Thus all rows on $U$ are nonpositive, and (9.4) gives a nonnegative change of vector. If any such row is negative, the positive diagonal of $C_U^(- 1)$ makes this change nonzero, and the sum increases strictly. If all these rows vanish, the vectors agree at $H$. Each added color with $H_i = H$ then has positive coordinate and sign $+ 1$. There is at least one such color. Since the signs for the two cosets agree whenever their vectors at and above $H$ agree, the secondary value increases strictly. In either case $P'$ is later.
  If all added colors are active, the same argument reverses the inequalities. The rows at level $H$ are nonnegative, so the vector change is nonpositive. A nonzero row decreases the sum strictly. If all rows are zero, every added color with $H_i = H$ has sign $- 1$, and their nonempty contribution decreases the secondary value strictly. Hence $P' prec P$. ◻
]

#thm([Lemma 9.4.])[
  #emph[The subset $T union "Act" \( P \)$ is spherical.]
] <lem:global-active-spherical>

#proof[
  Let $G$ be a connected component of this subset, and choose the highest level $k gt.eq 0$ having a positive coordinate on $G$ or on one of its neighbors. Such a level exists by the frame. For a vertex of $T$ the full $C$-row is zero. At an active vertex whose incidence maximum is less than $k$, its coordinate and neighboring coordinates are all zero at $k$. At an active vertex with incidence maximum $k$, the full row is nonnegative by (9.10). Therefore
  #[#set math.equation(numbering: n => "(9.11)")
   $ \( C p^k \( P \) \)_G gt.eq 0 \, #h(2em) C_G p_G^k \( P \) gt.eq 0 . $ <eq:global-full-row>]
  The vector $p_G^k \( P \)$ is nonzero. Otherwise a positive incident exterior coordinate, whose existence would be forced by the choice of $k$, would give a negative full row at its adjacent vertex of $G$. Moreover, a zero coordinate of $p_G^k \( P \)$ cannot neighbor a positive coordinate in $G$, since its $C_G$-row would be negative. Connectedness implies $p_G^k \( P \) > 0$.
  Apply Lemma 7. Either $C_G$ is positive definite, or $C_G p_G^k \( P \) = 0$. In the latter case the full rows equal minus the exterior incidence:
  $ \( C p^k \( P \) \)_i = - sum_(j in.not G) b_(i j) p_j^k \( P \) quad \( i in G \) . $
  Together with (9.11), this forces every displayed sum to vanish. There is no positive exterior neighbor, and the full rows are zero. Since $p_G^k \( P \) > 0$, the set $G$ is exactly one positive-support component of $p^k \( P \)$.
  The level $k$ cannot be zero: the frame lies outside $G subset.eq S$, has positive level-zero coordinate, and neighbors every vertex of $G$. By the maximality of $k$, all higher coordinates vanish on $G union partial G$. Thus $G$ satisfies every condition in (9.6), and all its signs at level $k$ are $+ 1$. Each active vertex in $G$ would now have $H_i = k$, positive coordinate, and zero full row, contradicting its active condition. Hence there are no active vertices in $G$, so $G subset.eq T$. This contradicts the assumption that $C_G$ is not positive definite, because $T$ is spherical. We conclude that every component $G$ has positive-definite Cartan matrix, proving the assertion. ◻
]

#thm([Proposition 9.5.])[
  #emph[The earlier strict upper part of $P$ is empty or contractible.]
] <prop:global-upper-link>

#proof[
  If $"Act" \( P \) = diameter$, there is no earlier upper extension by Lemma 47. Otherwise put $K = T union "Act" \( P \)$, which is spherical by Lemma 48. On the earlier upper part the map
  $ A_U x mapsto A_(U ∩ K) x $
  is an order map pointwise below the identity. Its image is still in the earlier strict upper part: $U ∩ K$ contains an added active color and adds only active colors. The map is a retraction onto the upper extensions adding only active colors, and that image has largest element $A_K x$. The order homotopy observation in Section 8 proves contractibility. ◻
]

=== 9.3 The earlier lower part <the-earlier-lower-part>

For $i in T$, define

#[#set math.equation(numbering: n => "(9.12)")
 $ q_i = max { k gt.eq 0 : p_i^k \( P \) > 0 } . $ <eq:global-prescribed-top>]

The maximum exists and is nonnegative by (9.8). On a connected component $B$ of $T$, the vector $p_B^k \( P \)$ is either zero everywhere or positive everywhere: apply the strict positivity of $C_B^(- 1)$ to the nonnegative exterior forcing vector. Consequently $q_i$ is constant on $B$, and the signs $eta_i^(q_i) \( P \)$ are also constant there, because $B$ lies in one positive-support component at that level.

#prodef([Definition 9.6.])[
  For a lower coset $Q = A_R z subset.neq P$, call an open color $i in T \\ R$ #emph[eligible] if
  #[#set math.equation(numbering: n => "(9.13)")
   $ m_i^d \( z \) = 0 quad upright("for every ") d > q_i \,\
m_i^(q_i) \( z \) < p_i^(q_i) \( P \) \, quad upright("or") quad m_i^(q_i) \( z \) = p_i^(q_i) \( P \) med upright(" and ") med eta_i^(q_i) \( P \) = + 1 . $ <eq:global-eligibility>]
  The first line is required in both alternatives of the second line. Write $E \( Q \)$ for the eligible open colors. This definition is independent of $z$, since all its tested colors lie outside $R$.
] <def:global-eligible>

#thm([Lemma 9.7.])[
  #emph[Every earlier lower coset has an eligible open color. A lower coset all of whose open colors are eligible is earlier than $P$. The earlier lower part retracts by an order map pointwise above the identity onto the poset of these all-eligible lower cosets.]
] <lem:global-lower-comparison>

#proof[
  Let $Q = A_R z subset.neq P$ and $V = T \\ R$. Test the comparison at the level
  $ H = max ({ q_i : i in V } med union med { k gt.eq 0 : m_i^k \( z \) > 0 upright(" for some ") i in V }) . $
  This is a finite maximum over a nonempty set. Above it all open coordinates of both vectors vanish. Formula (9.5) gives equality of the full vectors there, and the removed colors have zero signs, so the secondary values also agree.
  Suppose first that $E \( Q \) = diameter$. At level $H$, a color with $q_i < H$ has prescribed value zero and actual value nonnegative. A color with $q_i = H$ has no actual data above $q_i$ by the choice of $H$; ineligibility therefore implies $m_i^H \( z \) gt.eq p_i^H \( P \)$. Every open difference at $H$ is nonnegative. If one is positive, the full vector has a strictly larger sum by (9.5).
  If all open differences vanish, no color with $q_i < H$ has actual data at $H$. In particular $H$ is the prescribed maximum of at least one open color; it could not have arisen solely from actual data above a prescribed maximum. The open colors with $q_i < H$ contribute zero signs at $H$. Each with $q_i = H$ has equal positive actual and prescribed coordinates, and ineligibility forces sign $- 1$. The full vectors now agree at and above $H$, so the signs are common to the two cosets. The change in the secondary value is
  $ sum_(i in R) eta_i^H \( Q \) - sum_(i in T) eta_i^H \( P \) = - sum_(i in V) eta_i^H \( P \) > 0 . $
  Thus $Q$ is later in this case as well. This proves the first assertion by contraposition, including the possibility of actual data above the prescribed maximum on a different open component.
  If every open color is eligible, the actual caps imply $H = max_(i in V) q_i$. Open colors with smaller $q_i$ have zero actual and prescribed values at $H$; all other open differences are nonpositive. A strict difference decreases the sum. If every difference vanishes, the nonempty set of open colors with $q_i = H$ has sign $+ 1$, and its removal strictly decreases the secondary value. Hence $Q prec P$.
  For an earlier lower coset define
  #[#set math.equation(numbering: n => "(9.14)")
   $ rho \( Q \) = A_(T \\ E \( Q \)) z . $ <eq:global-closure>]
  Since $E \( Q \)$ is nonempty and contained in $T \\ R$, this is a proper lower coset above $Q$. Its open colors are exactly $E \( Q \)$ and remain eligible, so it is earlier. Changing the representative of $Q$ by $A_R$ does not change the displayed coset, since $R subset.eq T \\ E \( Q \)$.
  We verify order preservation with representatives included. If $Q_1 = A_(R_1) z_1 subset.eq Q_2 = A_(R_2) z_2$, then all colors outside $R_2$ have the same actual data at $z_1$ and $z_2$. Hence
  $ E \( Q_2 \) = E \( Q_1 \) ∩ \( T \\ R_2 \) . $
  Putting $K_a = T \\ E \( Q_a \)$ gives $K_1 subset.eq K_2$ and $R_2 subset.eq K_2$. Moreover $z_1 in Q_2 subset.eq A_(K_2) z_2$. Thus $A_(K_1) z_1 subset.eq A_(K_2) z_2$, as required. Finally, if every open color of $Q$ is eligible, then $T \\ E \( Q \) = R$ and $rho \( Q \) = Q$. So (9.14) is the stated order retraction. The order homotopy observation in Section 8 identifies the homotopy type of the earlier lower part with that of its all-eligible image. ◻
]

#thm([Lemma 9.8.])[
  #emph[The all-eligible lower poset at $P = A_T x$ is a product of the residue sublevel posets of Proposition 44, each with a largest element adjoined, with the all-largest tuple deleted. More precisely, its factors are as follows.]
  + #emph[Each connected component $B$ of $T$ with negative sign at its highest level $q_B$ contributes the strict sublevel in the coset $A_B x$ at level $q_B$.]
  + #emph[For a positive sign, group all components of $T$ belonging to the same positive-support component $I$ at the same level $q$. Their union is $B = T ∩ I$, and it contributes the special closed sublevel in $A_B x$ with data $I \, q \, c_I = p_I^q \( P \)$.]
  #emph[Every strict factor is empty or contractible, and every special closed factor is nonempty and contractible.]
] <lem:global-residue-blocks>

#proof[
  Consider first a connected component $B$ with sign $- 1$ and highest level $q_B$. Its boundary is outside $T$, because $B$ is an entire component of $T$. It has a cap at $q_B$: if some exterior neighbor had a positive coordinate at a level $d > q_B$, the harmonic equation on $B$ and positivity of $C_B^(- 1)$ would give a positive coordinate throughout $B$ at that level, contrary to its definition. On this boundary the actual data $m^d \( x \)$ equal $p^d \( P \)$. Their harmonic extension on $B$ therefore equals $p_B^(q_B) \( P \)$ at the test level. Eligibility is exactly a cap followed by the strict inequality against this harmonic vector. These are all the hypotheses of the strict residue sublevel.
  Now take a positive-sign component, with support component $I$ at level $q$. Condition (9.6) gives $q > 0$, a positive vector $c_I = p_I^q \( P \)$, and vanishing of all higher coordinates on $I union partial I$. The coordinates on $partial I$ at level $q$ are zero by the definition of a support component. Hence $\( C p^q \( P \) \)_I = 0$ also gives $C_I c_I = 0$.
  Every component of $T$ meeting $I$ lies wholly in $I$, by harmonic positivity on that component at level $q$. Its highest level is $q$ because the higher coordinates vanish on $I$, and it has the same positive sign. We must group all these components, giving $B = T ∩ I$. If a vertex $j in T \\ I$ neighbored $I$, then $p_j^q \( P \) = 0$, since otherwise it would lie in the same support component. An edge to a positive coordinate in $I$ would give $\( C p^q \( P \) \)_j < 0$, contradicting harmonicity on $T$. Therefore
  #[#set math.equation(numbering: n => "(9.15)")
   $ partial I ∩ T = diameter \, #h(2em) \( I \\ B \) union partial I subset.eq hat(S) \\ T . $ <eq:global-closed-exterior>]
  All exterior values required by the special closed sublevel are thus actual, fixed values on the entire coset $A_T x$. They are capped at $q$ and equal the zero-extended vector $c$ at that level. The block $B$ is spherical and its harmonic prescription is $c_B$. It cannot equal $I$, because a positive-definite principal matrix cannot have the positive null vector $c_I$. Eligibility on $B$ is exactly the closed inequality in Proposition 44. This verifies every special closed hypothesis, including when several disconnected components of $T$ meet the same $I$.
  These blocks partition $T$ into unions of its connected components. The presentation and the standard embeddings give $A_T = product_B A_B$. For $z in A_T x$, write uniquely $z x^(- 1) = product_B g_B$ with $g_B in A_B$. A subcoset $A_R z$ corresponds to the tuple
  $ #scale(x: 120%, y: 120%)[\(] A_(R ∩ B) g_B x #scale(x: 120%, y: 120%)[\)]_B . $
  Coset equality and inclusion are coordinatewise under this correspondence. Operations in other blocks leave every multiplicity in $B$ unchanged, so the eligible-color conditions in $B$ are precisely those for $g_B x$ in the displayed block coset. The boundary data just verified lie outside $T$: for a strict block this follows because it is a full component of $T$, and for a closed block it is (9.15). They are therefore fixed under every operation in $A_T$, including operations in the other blocks. Opening nothing in a block gives its single largest element $A_B x$; opening somewhere gives the stated proper residue sublevel. The requirement $R subset.neq T$ deletes just the all-largest tuple. This proves the product description. Its contractibility assertions follow from Proposition 44. ◻
]

#thm([Lemma 9.9.])[
  #emph[Let $cal(E)_1 \, dots.h \, cal(E)_r$ be posets whose realizations are each empty or contractible, and let $cal(E)_a^(+)$ denote the result of adjoining a largest element. Then 
$ (product_(a = 1)^r cal(E)_a^(+)) \\ { \( top \, dots.h \, top \) } $

 is empty if every $cal(E)_a$ is empty, and otherwise has contractible realization. The empty product has the same empty conclusion after its largest element is deleted.]
] <lem:global-product-minus-top>

#proof[
  We first record the product fact in the topology of order complexes. If $cal(P)$ and $cal(Q)$ are nonempty posets with contractible realizations, projection $cal(P) times cal(Q) arrow.r cal(P)$ has lower fiber $cal(P)_(lt.eq p) times cal(Q)$ over $p$. The order map $\( p' \, q \) mapsto \( p \, q \)$ is pointwise above the identity and retracts that fiber onto ${ p } times cal(Q)$. The fiber is contractible. Quillen’s Theorem A, in the form recalled in Section 2, shows that the product poset has contractible realization. Iteration proves this for any finite number of nonempty contractible factors. This argument does not require identifying an infinite order-complex realization with an ordinary topological product.
  Discard indices for which $cal(E)_a$ is empty, since their augmented factor has only its largest element. If no indices remain, the deleted product is empty. Otherwise cover its realization by the subcomplexes $X_a$ consisting of chains whose $a$th coordinate lies in $cal(E)_a$. They cover every chain: its largest vertex has a nonlargest coordinate, and every earlier vertex has a nonlargest coordinate at that same index. For a nonempty set $J$ of indices, the intersection $⋂_(a in J) X_a$ is the realization of
  $ (product_(a in J) cal(E)_a) times (product_(a in.not J) cal(E)_a^(+)) . $
  It is nonempty and contractible by the product fact: the required factors are contractible, and each augmented factor has a largest element.
  There are finitely many subcomplexes in this cover. Their union is contractible by induction on their number. Indeed the intersection of the last subcomplex with the preceding union has a cover by the corresponding intersections; all of its nonempty finite intersections are again nonempty contractible. Induction makes both the preceding union and this intersection contractible. Gluing the last contractible subcomplex along the contractible intersection preserves the homotopy type of a point, since subcomplex inclusions are cofibrations. This completes the proof. ◻
]

#thm([Proposition 9.10.])[
  #emph[The earlier strict lower part of every $P in cal(D)$ is empty or contractible.]
] <prop:global-lower-link>

#proof[
  For type $T = diameter$ the lower part is empty. Otherwise Lemma 51 retracts it onto the all-eligible part. Lemma 52 identifies that part with the product in Lemma 53, whose factors satisfy that lemma’s hypotheses. The conclusion follows. ◻
]

=== 9.4 Contractibility and the Salvetti complex <contractibility-and-the-salvetti-complex>

#thm([Theorem 9.11.])[
  #emph[For every Coxeter matrix on a finite set $S$, the order complex of the spherical-coset poset $cal(D)$ is contractible.]
] <thm:deligne-contractible>

#proof[
  If $S = diameter$, the poset has a single vertex. Otherwise use the well-order of Lemma 46. Propositions 49 and 54 show that the earlier strict upper and strict lower parts at each vertex are empty or contractible. Their join is the earlier attaching link. The empty-part convention and Lemma 43 therefore show that each component of the final order complex is contractible.
  Finally $cal(D)$ is connected. The singleton cosets $x$ and $sigma_s x$ both lie in $A_({ s }) x$, since rank-one types are spherical. Left generator steps therefore connect all singleton cosets. Every other coset contains a singleton coset and hence joins this same component. The preceding componentwise conclusion proves contractibility of $\| cal(D) \|$. ◻
]

#proof[
  Lemma 5 gives a homotopy equivalence from the universal cover of the full Artin Salvetti complex to $\| cal(D) \|$. The latter is contractible by Theorem 55, so the universal cover is contractible. Since covering maps induce isomorphisms on homotopy groups in degrees at least two, the specified Salvetti complex is aspherical. ◻
]

=== 9.5 Spherical, affine, and product cases <spherical-affine-and-product-cases>

If $S$ itself is spherical, the coset $A_S$ is a largest element of $cal(D)$. Its contractibility is therefore immediate and agrees with the spherical theorem used in the comparison. The proof for an arbitrary $S$ uses finite Coxeter length, finite Artin monoids, and positive-definite inverses only on spherical subsets and their finite unfoldings.

The positive-null-vector alternative, including the affine case, is handled by the reversed preference in (9.6).

If the original diagram splits as $S = S_1 union.sq dots.h.c union.sq S_t$ with all cross labels equal to $2$, its presentation gives $A = product_a A_(S_a)$, and a type $T$ is spherical exactly when every $T ∩ S_a$ is spherical. The finite Coxeter permutahedra split as products on these components. Shortest representatives and their positive lifts split as well, because lengths add and letters in different factors commute. Consequently the canonical Salvetti cell and face maps give the product of the factor Salvetti complexes, and their universal covers give the corresponding product of covers. The argument above is compatible with this decomposition; in particular the lower-block construction allows disconnected spherical types.

An infinite label contributes weight $2$ and an edge object consisting of two copies of the tensor unit, and imposes no Artin braid relation. It is excluded from a spherical subset by positive definiteness itself: the two-color principal matrix with that label is singular. No restriction on infinite labels in the original matrix, or on the connectedness of its diagram, was used in the contraction.

== 10 Structural consequences and homological stability <sec:consequences>

Since $S$ is finite, $X \( W \, S \)$ has finitely many cells, one for each spherical subset of $S$. Theorem 1 therefore gives a finite classifying space for $A$; its cellular chains and cochains compute the integral group homology and cohomology. The theorem also supplies the $K \( pi \, 1 \)$ hypothesis in the following results about torsion, centers, positive monoids, and Boyd’s homological-stability families.

=== 10.1 Torsion, centers, and monoid classifying spaces <torsion-centers-and-monoid-classifying-spaces>

The Coxeter diagram has vertex set $S$ and an edge between distinct $s \, t$ exactly when $m_(s t) eq.not 2$. Its connected components are the irreducible Coxeter components, and a component is spherical when its Coxeter group is finite. Let $A^(+)$ denote the positive Artin monoid: it has the same standard generators and positive braid relations as $A$, interpreted as a monoid presentation. For a monoid $M$, write $B M$ for the geometric realization of the nerve of the one-object category with endomorphism monoid $M$. A monoid homomorphism induces a map of these classifying spaces.

#thm([Corollary 10.1.])[
  (Torsion, center, and monoid consequences).  #emph[Let $A = A \( W \, S \)$ be an Artin group with $S$ finite, let $A^(+)$ be its positive Artin monoid, and let $k$ be the number of irreducible spherical components of the Coxeter diagram of $\( W \, S \)$. Then:]
  + #emph[$A$ is torsion-free.]
  + #emph[The center satisfies $Z \( A \) tilde.equiv bb(Z)^k$.]
  + #emph[The natural homomorphism $eta : A^(+) arrow.r A$ induces a homotopy equivalence 
$ B eta : B A^(+) arrow.r B A . $

]
] <cor:artin-structural>

#proof[
  When $S = diameter$, both $A$ and $A^(+)$ are trivial and $k = 0$, so all three assertions hold. Assume that $S eq.not diameter$.
  The complex $X \( W \, S \)$ has dimension at most $\| S \|$, and it is a $K \( A \, 1 \)$ by Theorem 1 and (2.5). If $A$ had a nonidentity element of finite order, it would contain a subgroup $P tilde.equiv C_p$ for some prime $p$. The corresponding covering space $tilde(X) \( W \, S \) \/ P$ would be a $K \( P \, 1 \)$ of dimension at most $\| S \|$. This is impossible: the standard two-periodic resolution of $C_p$, whose cochain maps with trivial $bb(Z)$-coefficients alternate between zero and multiplication by $p$, gives
  $ H^(2 q) \( C_p \; bb(Z) \) tilde.equiv bb(Z) \/ p bb(Z) #h(2em) \( q gt.eq 1 \) \, $
  whereas the cohomology of a CW complex of dimension at most $\| S \|$ vanishes in higher degrees. This proves (i).
  Let $S_1 \, dots.h \, S_r$ be the connected components of the Coxeter diagram. All cross labels are $2$, so the presentation gives
  $ A tilde.equiv product_(j = 1)^r A_(S_j) \, $
  as in (2.9). If $S_j$ is spherical, Deligne’s center theorem for a finite Coxeter system with nonempty connected diagram gives $Z \( A_(S_j) \) tilde.equiv bb(Z)$ #cite(label("Deligne1972")) Theorem 4.21. If $S_j$ is not spherical, its connectedness means that $A_(S_j)$ has no spherical factor. Theorem 1 applied to the submatrix on $S_j$ verifies the $K \( pi \, 1 \)$ hypothesis of Jankiewicz–Schreve’s theorem #cite(label("JankiewiczSchreve2022")) Theorem 3, which gives $Z \( A_(S_j) \) = { 1 }$. Taking centers of the direct product proves (ii).
  For (iii), Dobrinskaya’s equivalence #cite(label("Dobrinskaya2002")) Theorem 2 and the following paragraph, reproved by Ozornova #cite(label("Ozornova2013")) Section 5, especially Conjecture 5.9 and Theorem 5.10, states that the natural map $B A^(+) arrow.r B A$ is a homotopy equivalence exactly when the $K \( pi \, 1 \)$ conjecture holds for $A$. Theorem 1 supplies that condition. ◻
]

=== 10.2 Homological stability after adjoining a braid tail <homological-stability-after-adjoining-a-braid-tail>

Boyd studies a fixed initial diagram with a growing type-$A$ path. We give the full matrix construction so that the indexing in her stability range is explicit.

#thm([Corollary 10.2.])[
  (Boyd stability for fixed-core braid-tail families).  #emph[Let $A_1$ be the Artin group of a Coxeter matrix $m_1$ on a finite set $Sigma_1$, and choose a vertex $sigma_1 in Sigma_1$. For each $n gt.eq 2$, adjoin new vertices $sigma_2 \, dots.h \, sigma_n$ and let $A_n$ be the Artin group of the Coxeter matrix $m_n$ on $Sigma_n = Sigma_1 union.sq { sigma_2 \, dots.h \, sigma_n }$. Retain $m_1$ on $Sigma_1$, put diagonal entries equal to $1$, and set the remaining off-diagonal entries, symmetrically, by 
$ m_n \( sigma_j \, sigma_(j + 1) \) & = 3 &  & \( 1 lt.eq j < n \) \,\
m_n \( sigma_j \, sigma_ell \) & = 2 &  & \( 1 lt.eq j < ell lt.eq n \, med ell - j gt.eq 2 \) \,\
m_n \( u \, sigma_j \) & = 2 &  & \( u in Sigma_1 \\ { sigma_1 } \, med 2 lt.eq j lt.eq n \) . $

 Let $s_n : A_(n - 1) arrow.r.hook A_n$ be the natural inclusion for $n gt.eq 2$. For every $n gt.eq 2$, every abelian group $C$, used as a constant coefficient group, and every integer $i gt.eq 0$, the induced map 
$ \( B s_n \)_(*) : H_i \( B A_(n - 1) \; C \) arrow.r H_i \( B A_n \; C \) $

 is an isomorphism when $i < n \/ 2$ and a surjection when $i = n \/ 2$.]
] <cor:boyd-stability>

#proof[
  This is precisely Boyd’s sequence of diagrams #cite(label("Boyd2020")) Introduction, Definition 6.1 and Remark 6.2. Deleting $sigma_1$ from the initial diagram gives the diagram for her $A_0$, while $sigma_1 \, dots.h \, sigma_n$ form her type-$A$ subdiagram. In particular, the new vertices have no other edges to the fixed core, and our parameter $n$ is Boyd’s parameter. The inclusions $s_n$ are the standard parabolic inclusions.
  Every $Sigma_n$ is finite, so Theorem 1 proves the $K \( pi \, 1 \)$ conjecture for every $A_n$ in this sequence. This is exactly the hypothesis of Boyd’s Corollary B, whose conclusion is the displayed stabilization map and the stated constant-coefficient range. ◻
]

Here $n$ counts the vertices in the growing type-$A$ subdiagram, not the total rank $\| Sigma_1 \| + n - 1$; the equality case $i = n \/ 2$ can occur only when $n$ is even. The stability conclusion recorded here is restricted to the displayed fixed-core construction and constant coefficient systems. It makes no assertion for arbitrary sequences of Coxeter diagrams or for twisted coefficient systems.


#bibliography("refs.bib", style: "ieee", title: [References])
