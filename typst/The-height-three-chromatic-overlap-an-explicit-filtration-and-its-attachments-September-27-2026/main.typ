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

#align(center)[#text(size: 16pt, weight: "bold")[The height-three chromatic overlap: \
an explicit filtration and its attachments]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Fix a prime $p$. Write $L_i = L_(E \( i \))$ for localization at Johnson–Wilson theory and $L_(K \( i \))$ for
  localization at Morava $K$-theory. We use the derived $p$-completion $S =
  bb(S)_p^and$ of the sphere and study the overlap

$ T = L_(K \( 3 \)) S \, wide X = L_2 T . $

The object $X$ is the part of the height-three local sphere visible below height three.
  Our question is how to build it from lower local spheres while retaining the maps by which the pieces are joined.

Chromatic fracture makes the gluing problem precise. An $E \( 2 \)$-local spectrum is a homotopy pullback of its
  $K \( 2 \)$-local and $E \( 1 \)$-local parts over their common localization.
  The gluing map is part of the data; the fracture square does not determine it from the two corners alone
  #cite(label("BB")) Section 2.4, diagram (2.19). Hopkins’ chromatic splitting conjecture,
  as recorded by Hovey #cite(label("Hovey")) Conjecture 4.2, proposes classes, factorizations,
  and summands that would split the relevant canonical cofiber sequence.
  The revised strong formulation of Barthel–Beaudry #cite(label("BB")) Conjecture 6.3 and Remark 6.4 has the same
  lower-sphere pattern at the height and primes considered here.
  We study an ordered filtration with those cofibers and a canonical first unit, allowing nonzero connecting maps.

The low-height results already distinguish these formulations.
  Hovey’s July 1993 account records the height-one case and the height-two case at primes greater than three,
  attributing the latter to Hopkins using Shimomura–Yabe #cite(label("Hovey")) pp. 17–19.
  Goerss–Henn–Mahowald later proved the height-two splitting at the prime three
  #cite(label("GoerssHennMahowald2014")) Theorem 1.2. Their proof identifies the actual rational comparison map
  before applying chromatic fracture #cite(label("GoerssHennMahowald2014")) proof of Theorem 5.11, p. 1288.
  At height two and the prime two, Beaudry disproved the original strong form #cite(label("Beaudry2017"))
  Theorem 1.4; Beaudry–Goerss–Henn established a corrected decomposition with Moore-spectrum terms that retains
  the weak unit splitting #cite(label("BGH2022")) Theorem 1.1.6.

Two established calculations explain the pieces at height three.
  At odd primes the height-two splitting gives two $E \( 1 \)$-local pieces and two rational pieces
  #cite(label("BB")) Theorem 6.7. At every prime and positive height,
  the theorem of Barthel–Schlank–Stapleton–Weinstein computes the rational homotopy of the $K \( n \)$-local
  sphere as an exterior algebra over $bb(Q)_p$ on generators of degrees $1 - 2 i$, $1 lt.eq i lt.eq
  n$ #cite(label("BSSW")) Theorem A. At height three the resulting degrees are

$ 0 \, med - 1 \, med - 3 \, med - 4 \, med - 5 \, med - 6 \, med - 8 \, med - 9 . $

This algebra calculation determines neither integral representatives nor their images under lower-height
  localization. Those map identifications are what allow the layers to be assembled.

=== 1.1 The explicit filtration <the-explicit-filtration>

All spectra and maps in the theorem carry their natural $S$-module structures.
  A filtration means a sequence of homotopy cofiber sequences:
  its $i$-th cofiber $C_i$ has a connecting map $partial_i : C_i arrow.r Sigma F_(i - 1)$.

#thm([Theorem 1.1.])[
  (Explicit height-three filtration).  #emph[For every prime $p gt.eq 5$,
    there are $E \( 2 \)$-local $S$-modules and maps
$ 0 = F_0 arrow.r F_1 arrow.r dots.h.c arrow.r F_8 \, wide e : F_8 arrow.r^tilde.eq X \, $

 whose successive cofibers $C_i = "cofib" \( F_(i - 1) arrow.r F_i \)$, in order, are
$ i & C_i & i & C_i\
1 & L_2 S & 5 & Sigma^(- 5) H bb(Q)_p\
2 & Sigma^(- 1) L_2 S & 6 & Sigma^(- 6) H bb(Q)_p\
3 & Sigma^(- 3) L_1 S & 7 & Sigma^(- 8) H bb(Q)_p\
4 & Sigma^(- 4) L_1 S & 8 & Sigma^(- 9) H bb(Q)_p . $

 Under $F_1 tilde.eq L_2 S$, the composite $F_1 arrow.r F_8 arrow.r^e
   X$ is the canonical map $L_2 \( S arrow.r L_(K \( 3 \)) S \)$.]
] <thm:main>

The attachment identification is a separate formal part of the result.
  Once the stages and their fracture data have been defined,
  4 collects every connecting map and both signed roofs. The application in 11 establishes 1 and the height-three
  instance of 4 from one choice of local maps, compatibility homotopy, and coherent inverse data.
  The first unit is canonical; the attachment identification is relative to those choices.

Existence of a canonical-unit filtration with these cofibers is also the height-three case of
  #cite(label("CompanionFilteredChromaticSplitting")) Theorem 1.1, whose range $p > n + 1$ becomes $p gt.eq
  5$ here. That theorem supplies one family of product bases at all lower positive heights.
  The present proof constructs the height-three maps independently of that theorem,
  identifies the rational degree-three comparison, and records every attachment relative to one compatible set of
  choices. Neither filtration statement asserts the strong wedge or splits its first unit.
  The construction of 1 is independent of the rational-obstruction theorem used in 11.2.
  That separate theorem supplies additional information about the extensions:
  for this explicit filtration, the first height-one connecting map is nonzero.

=== 1.2 Three blocks and two gluing problems <three-blocks-and-two-gluing-problems>

Put $Q = L_0 S tilde.eq H bb(Q)_p$, and group the layers as

$ W & = L_2 S or Sigma^(- 1) L_2 S \,\
U_(upright("mid")) & = Sigma^(- 3) L_1 S or Sigma^(- 4) L_1 S \,\
V & = Sigma^(- 5) Q or Sigma^(- 6) Q or Sigma^(- 8) Q or Sigma^(- 9) Q . $

The first localized basis is an actual map

$ w = \( 1 \, zeta \) : W arrow.r X \, $

where $zeta : Sigma^(- 1) S arrow.r T$ is the integral determinant class.
  It becomes an equivalence after $K \( 2 \)$-localization. Hence its cofiber $Y$ is $E \( 1 \)$-local.
  To insert the two summands of $U_(upright("mid"))$, one needs a map to $Y$,
  not merely the knowledge that $Y$ has the expected local homotopy groups.

There are two descriptions of that map. At height one, an integral orientation class $delta in pi_(- 3)
  L_(K \( 1 \)) T$ participates in the actual basis

$ \( 1 \, zeta \, delta \, zeta delta \) : R_1 or Sigma^(- 1) R_1 or Sigma^(- 3) R_1 or Sigma^(- 4) R_1
  arrow.r^tilde.eq L_(K \( 1 \)) T \, wide R_1 = L_(K \( 1 \)) S . $

The first two components are localizations of the same maps used in $w$;
  quotienting them gives the $K \( 1 \)$-local part of a map from $U_(upright("mid"))$.
  Rationally, the degree-three primitive $alpha_3 in pi_(- 3) L_0 T$ maps to $c delta$ for a nonzero $c in
  bb(Q)_p$, and its product with $zeta$ maps to $c zeta delta$.
  Rescaling only the rational primitive by $c^(- 1)$ makes the two descriptions agree on the rationalized
  $K \( 1 \)$-local overlap. The height-one fracture square then constructs

$ h : U_(upright("mid")) arrow.r Y . $

The specified compatibility homotopy, rather than a dimension count, is the input to this gluing step.

Pulling $X arrow.r Y$ back along the first summand and then all of $U_(upright("mid"))$ gives $F_3$ and $F_4$.
  The cofiber of $F_4 arrow.r X$ is rational. The four remaining exterior products give an actual equivalence from
  $V$ to that cofiber, and their ordered partial sums give $F_5 \, dots.h \, F_8$ by pullback.
  The terminal projection is an equivalence because the full map from $V$ is.
  The proof in 2 follows the two fracture squares far enough to identify their connecting maps,
  including both rotation signs.

=== 1.3 Why the localized bases require geometry <why-the-localized-bases-require-geometry>

The two coefficient comparisons use the loci of the height-three deformation where the connected part has height
  two and height one. Their étale parts have heights one and two, respectively;
  these are the coheight-one and ordinary strata. Finite marking towers on these loci are related to extensions of
  vector bundles on the Fargues–Fontaine curve. The bundle and local-system framework comes from Fargues–Fontaine
  and Scholze–Weinstein #cite(label("FarguesFontaine")) #cite(label("ScholzeWeinstein"));
  relative full faithfulness of derived sections is supplied by Anschütz–Le Bras
  #cite(label("AnschuetzLeBrasFourier")) Corollary 3.11. Retaining the integral Tate frames and the determinant
  lattice makes the group actions and the determinant product identity part of the comparison.
  These data are later used to identify the coefficient classes of the unit and determinant maps in
  $w = \( 1 \, zeta \)$.

The Kummer and translation calculations in the coheight-one work of Barthel–Mann–Ray–Schlank–Senger–Weinstein–Zhou
  #cite(label("BMR")) Sections 3.3–3.6 provide methodological context for the cohomology of the completed strata.
  The geometric answers must then be carried to the algebraic coefficients in ordinary Morava cooperations.
  A cochain in their marking union must occur at one finite stage on its compact domain;
  a cochain with Laurent coefficients must have one pole bound.
  Completion does not preserve those requirements by definition,
  so the comparisons must establish the required finite bounds before returning to the algebraic coefficients.

On the locus with connected height two, the completed calculation controls cohomology at each finite stage of the
  connected marking tower. The comparison in 6 proves finite cohomology for a cofinal family of finite products of
  complete local fields, then removes completion while preserving the group actions and the constants map.
  The descent calculation in 7 then uses these algebraic coefficients to prove that the actual unit and
  determinant map $w = \( 1 \, zeta \)$ is a $K \( 2 \)$-equivalence.

On the locus with connected height one, the completed calculation provides the constants comparison determined by
  the Tate frame of rank two and the connected part. To reach the ordinary coefficients,
  8 first proves finite cohomology for each compact lattice of power series.
  An intermediate chromatic descent calculation then supplies finite cohomology for the union of coefficients with
  bounded poles. Only after this step is the analytic completion removed.
  The resulting constants comparison is the input to 9, where finite Witt coefficients carry the orientation
  through compatible length transitions and derived completion produces $delta$.

The rational comparison uses these integral maps and the established rational exterior algebra,
  whose height-three proof is reconstructed in 12 following #cite(label("BSSW")).
  10 transports a trace class in degree three along the actual Tate frame of rank two on the ordinary stratum.
  The finite Witt comparisons carry this class through the coefficient tower,
  whose derived limit is taken before rationalization. The resulting comparison proves that its image in the line
  $bb(Q)_p delta$ is nonzero. This supplies the scalar $c$ in the gluing overview.
  Product naturality for the same $zeta$ gives the same scalar on $zeta alpha_3$.

=== 1.4 Reading the proof <reading-the-proof>

2 first constructs the ordered filtration from precisely stated local maps and a compatibility homotopy,
  and identifies all its attachments for those same choices. The remainder of the paper constructs the required maps.

3 fixes the coefficient, group, and cochain conventions. 4 constructs the finite Tate-coordinate towers and their
  integral frame comparisons, and 5 computes the completed strata with their actual constants maps.
  6 removes completion on the coheight-one stratum, using finite local-field stages and the full reduced-norm
  quotient. 7 then compares ordinary residue cooperations with those stages and obtains the actual height-two basis.

8 proves the second coefficient comparison in the order required by its dependencies:
  root and Laurent-tail control, compact lattice finiteness, intermediate chromatic finiteness,
  bounded-pole finiteness, and only then the natural ordinary comparison.
  9 carries the orientation through finite Witt coefficients and derived completion to the actual height-one
  basis. The trace argument of 10 identifies the localization of the particular degree-three primitive.

Finally, 11 inserts these maps into the earlier fracture construction,
  proving the main theorem and its attachment identification from one common choice.
  11.2 proves a conditional criterion for the first middle attachment and applies the companion canonical-map
  theorem through the local completion, localization, and scalar comparisons proved there.
  12 then reconstructs the rational exterior algebra from its arithmetic and geometric inputs.

== 2 A finite fracture construction <sec:fracture>

This section isolates the topological assembly. Its inputs are a height-two equivalence,
  a compatible height-one and rational pair of maps, and a basis for the final rational quotient.
  The construction produces the stages themselves and computes every connecting map.
  It does not use the coefficient calculations of 8.

=== 2.1 Module localizations and rotation signs <module-localizations-and-rotation-signs>

Put $Q = L_0 S tilde.eq H bb(Q)_p$ and $J = K \( 1 \) or K \( 2 \)$. We work in $"Mod"_S$.
  Homological Bousfield localization $L_E$ lifts to this category with the same underlying spectrum,
  whether or not it is smashing. Indeed, $S^(and n) and M arrow.r S^(and n) and
  L_E M$ is an $E$-equivalence for every $n$. Mapping into the local spectrum $L_E
  M$ extends the action maps and their coherent unit and associativity homotopies.
  The free-module bar resolution then gives, for every local $S$-module $N$,

#[#set math.equation(numbering: n => "(2.1)")
 $ "Map"_("Mod"_S) \( L_E M \, N \) tilde.eq "Map"_("Mod"_S) \( M \, N \) . $ <eq:module-localization>]

Thus the units below are module maps. The forgetful functor creates limits and detects equivalences,
  so the spectral fracture pullbacks are also pullbacks of $S$-modules.

Rationalization is extension of scalars: $Q ⊗_S M tilde.eq L_0 M$. In particular, for a rational module $D$,

#[#set math.equation(numbering: n => "(2.2)")
 $ "Map"_("Mod"_S) \( M \, D \) tilde.eq "Map"_("Mod"_Q) \( L_0 M \, D \) . $ <eq:rational-adjunction>]

A map from a finite sum of shifts of $Q$ is determined up to homotopy by the images of its module generators.
  A homotopy between the rational maps in (2.2) gives the corresponding $S$-module homotopy after precomposition
  by $M arrow.r L_0 M$.

The height-two fracture square for an $E \( 2 \)$-local module $B$ is

#[#set math.equation(numbering: n => "(2.3)")
 $ B tilde.eq L_(K \( 2 \)) B times_(L_1 L_(K \( 2 \)) B) L_1 B . $ <eq:height-two-fracture>]

For an $E \( 1 \)$-local module the corresponding square uses $K \( 1 \)$ and $L_0$ #cite(label("BB"))
  Section 2.4, diagram (2.19). Consequently an $E \( 2 \)$-local, $K \( 2 \)$-acyclic module is $E \( 1 \)$-local,
  and an $E \( 2 \)$-local module acyclic for both $K \( 1 \)$ and $K \( 2 \)$ is rational.
  There is also a fracture square separating all positive heights:

#[#set math.equation(numbering: n => "(2.4)")
 $ B tilde.eq L_J B times_(L_0 L_J B) L_0 B . $ <eq:positive-fracture>]

To see this, $L_J B$ is $E \( 2 \)$-local because $chevron.l E \( 2 \) chevron.r =
  chevron.l K \( 0 \) or J chevron.r$. The fiber $N = "fib" \( B arrow.r L_J B \)$ is therefore $E \( 2 \)$-local
  and $J$-acyclic, hence rational. Exactness of $L_0$ identifies it with $"fib" \( L_0 B arrow.r L_0 L_J B \)$,
  which proves (2.4).

For $f : A arrow.r B$ and $C = "cofib" \( f \)$, we fix the cofiber-rotation convention

$ A arrow.r^f B arrow.r C arrow.r Sigma A arrow.r^(- Sigma f) Sigma B . $

If $i : N arrow.r A$ is the fiber of $A arrow.r D$, the induced identification $"cofib" \( A arrow.r D \) tilde.eq
  Sigma N$ therefore makes the boundary to $Sigma A$ equal to $- Sigma i$.

#thm([Lemma 2.1.])[
  (Boundary of a localization comparison).  #emph[Let $a : A arrow.r B$ be a map in a stable category,
    and let $L$ be an exact localization for which $L a$ is an equivalence.
    Choose an inverse of $L a$ and its inverse homotopies, and put
$ tau : B arrow.r L B arrow.r^(\( L a \)^(- 1)) L A \, wide N = "fib" \( A arrow.r L A \) . $

 The inverse homotopy makes $tau$ a map under $A$, and therefore gives
$ macron(tau) : "cofib" \( a \) arrow.r "cofib" \( A arrow.r L A \) tilde.eq Sigma N . $

 If $i : N arrow.r A$ is the fiber inclusion, then the connecting map of the cofiber sequence of $a$ is
#[#set math.equation(numbering: n => "(2.5)")
 $ partial_a = \( - Sigma i \) macron(tau) . $ <eq:boundary-lemma>]

 If $M$ is another exact localization and $N$ is $M$-local,
   the middle cofiber can equivalently be written $"cofib" \( M A arrow.r M L A \)$,
   using its localization identification.]
] <lem:boundary>

#proof[
  The under-$A$ homotopy supplies a map of cofiber sequences
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$A$])
  content((2.123, 0), [$B$])
  content((4.709, 0), [$"cofib" \( a \)$])
  content((7.294, 0), [$Sigma A$])
  content((0, -1.239), [$A$])
  content((2.123, -1.239), [$L A$])
  content((4.709, -1.239), [$Sigma N$])
  content((7.294, -1.239), [$Sigma A .$])
  line((0.336, 0), (1.787, 0), mark: (end: ">"))
  content((1.062, 0.2266), [#text(size: 0.73em)[$a$]])
  line((0.11, -0.2725), (0.11, -0.9661))
  line((-0.11, -0.2725), (-0.11, -0.9661))
  line((2.459, 0), (3.911, 0), mark: (end: ">"))
  line((2.123, -0.2725), (2.123, -0.9661), mark: (end: ">"))
  content((2.397, -0.6193), [#text(size: 0.73em)[$tau$]])
  line((5.507, 0), (6.958, 0), mark: (end: ">"))
  content((6.232, 0.2266), [#text(size: 0.73em)[$partial_a$]])
  line((4.709, -0.2725), (4.709, -0.9661), mark: (end: ">"))
  content((4.983, -0.6193), [#text(size: 0.73em)[$macron(tau)$]])
  line((7.404, -0.2725), (7.404, -0.9661))
  line((7.184, -0.2725), (7.184, -0.9661))
  line((0.336, -1.239), (1.721, -1.239), mark: (end: ">"))
  line((2.525, -1.239), (4.373, -1.239), mark: (end: ">"))
  line((5.045, -1.239), (6.892, -1.239), mark: (end: ">"))
  content((5.969, -1.012), [#text(size: 0.73em)[$- Sigma i$]])
})
  The right square is (2.5); its sign is the rotation sign fixed above.
    If $N$ is $M$-local, so is $"cofib" \( A arrow.r L A \) tilde.eq Sigma N$.
    Its $M$-localization map is then an equivalence, and exactness identifies the localized cofiber with
    $"cofib" \( M A arrow.r M L A \)$. ◻
]

=== 2.2 The stages and their boundaries <the-stages-and-their-boundaries>

Use the following ordered blocks:

$ W & = W_1 or W_2 = L_2 S or Sigma^(- 1) L_2 S \,\
U_(upright("mid")) & = U_3 or U_4 = Sigma^(- 3) L_1 S or Sigma^(- 4) L_1 S \,\
V & = V_5 or V_6 or V_7 or V_8\
 & = Sigma^(- 5) Q or Sigma^(- 6) Q or Sigma^(- 8) Q or Sigma^(- 9) Q . $

#thm([Proposition 2.2.])[
  (Ordered fracture filtration).  #emph[Let $X$ be an $E \( 2 \)$-local $S$-module.
    Suppose the following module maps and homotopies are given.]
  + #emph[A map $w : W arrow.r X$ for which $L_(K \( 2 \)) w$ is an equivalence.
    Put $Y = "cofib" \( w \)$, with quotient $q : X arrow.r Y$.]
  + #emph[An equivalence $kappa : L_(K \( 1 \)) U_(upright("mid")) arrow.r^tilde.eq L_(K \( 1 \)) Y$,
    a rational map $r : L_0 U_(upright("mid")) arrow.r L_0 Y$, and a specified homotopy of $Q$-module maps between
#[#set math.equation(numbering: n => "(2.6)")
 $ L_0 U_(upright("mid")) arrow.r L_0 L_(K \( 1 \)) U_(upright("mid")) arrow.r^(L_0 kappa) L_0 L_(K \( 1 \)) Y \,\
L_0 U_(upright("mid")) arrow.r^r L_0 Y arrow.r L_0 L_(K \( 1 \)) Y . $ <eq:compatibility>]

]
  + #emph[A map $b : V arrow.r L_0 X$ for which
#[#set math.equation(numbering: n => "(2.7)")
 $ t_0 : V arrow.r^b L_0 X arrow.r^(L_0 q) L_0 Y arrow.r "cofib" \( r \) $ <eq:quotient-basis>]

 is an equivalence.]
  #emph[Then there is a filtration in $E \( 2 \)$-local $S$-modules
$ 0 = F_0 arrow.r F_1 arrow.r dots.h.c arrow.r F_8 arrow.r_tilde.eq^e X $

 with ordered cofibers $W_1 \, W_2 \, U_3 \, U_4 \, V_5 \, V_6 \, V_7 \, V_8$.
   The composite $F_2 = W arrow.r F_8 arrow.r^e X$ is $w$.]
] <prop:fracture>

#proof[
  #emph[Constructing the middle map.] The cofiber $Y$ is $E \( 2 \)$-local and $K \( 2 \)$-acyclic by (i),
    hence $E \( 1 \)$-local. Exactness identifies it naturally with $"cofib" \( L_1 w \)$.
    Its height-one fracture square is
  $ Y tilde.eq L_(K \( 1 \)) Y times_(L_0 L_(K \( 1 \)) Y) L_0 Y . $
  The two proposed maps from $U_(upright("mid"))$ to its corners are
  $ U_(upright("mid")) arrow.r L_(K \( 1 \)) U_(upright("mid")) arrow.r^kappa L_(K \( 1 \)) Y \, wide
    U_(upright("mid")) arrow.r L_0 U_(upright("mid")) arrow.r^r L_0 Y . $
  By (2.2), the specified rational homotopy in (2.6) identifies their composites to the overlap as $S$-module
    maps. The pullback therefore gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ h : U_(upright("mid")) arrow.r Y \, wide L_(K \( 1 \)) h = kappa \, quad L_0 h = r . $ <eq:middle-map>]
  Here each equality includes the homotopy obtained from the corresponding pullback projection:
    localizing that homotopy and using idempotence gives the displayed identification.
    In particular, $h$ is a $K \( 1 \)$-equivalence.
  #emph[The first four stages.] Let $partial_w : Y arrow.r Sigma W$ be the boundary of $w$, and put
  $ d = partial_w h : U_(upright("mid")) arrow.r Sigma W \, wide d_i = d \|_(U_i) quad \( i = 3 \, 4 \) . $
  Define
  #[#set math.equation(numbering: n => "(2.9)")
   $ F_0 = 0 \, quad F_1 = W_1 \, quad F_2 = W \, quad F_3 = X times_Y U_3 \, quad F_4 =
     X times_Y U_(upright("mid")) . $ <eq:first-stages>]
  The first nonzero transition is the wedge inclusion $W_1 arrow.r W$.
    The identification $X times_Y 0 tilde.eq W$ makes the next transitions the pullbacks of $0 arrow.r U_3 arrow.r
    U_3 or U_4$. In a stable category a pullback square is also a pushout square.
    Their cofibers are consequently $U_3$ and $U_4$, and
  $ F_3 tilde.eq "fib" \( d_3 : U_3 arrow.r Sigma W \) \, wide
    F_4 tilde.eq "fib" \( d : U_(upright("mid")) arrow.r Sigma W \) . $
  Naturality of the cofiber sequence for each pullback gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ partial_1 = 0 \, wide partial_2 = 0 \, wide partial_3 = d_3 \, wide partial_4 =
     Sigma \( F_2 arrow.r F_3 \) d_4 . $ <eq:first-boundaries>]
  For the last formula, the quotient of the pullback square for $U_3 arrow.r
    U_3 or U_4$ identifies its quotient with $U_4$. There is a map of cofiber sequences from $W arrow.r
    F_4 arrow.r U_(upright("mid"))$ to $F_3 arrow.r F_4 arrow.r U_4$, whose components are $W arrow.r F_3$,
    the identity of $F_4$, and the projection $"pr"_4 : U_(upright("mid")) arrow.r U_4$.
    Its boundary square gives $partial_4 "pr"_4 = Sigma \( W arrow.r F_3 \) d$.
    Restricting to the summand $U_4$ gives the displayed formula.
  We next express $d$ through the height-two fracture map. Choose coherent inverse data for $L_(K \( 2 \)) w$, and form
  $ tau_2 : L_1 X arrow.r L_1 L_(K \( 2 \)) X arrow.r^(\( L_1 L_(K \( 2 \)) w \)^(- 1)) L_1 L_(K \( 2 \)) W . $
  It is a map under $L_1 W$, so it induces
  $ macron(tau)_2 : Y tilde.eq "cofib" \( L_1 w \) arrow.r "cofib" \( L_1 W arrow.r L_1 L_(K \( 2 \)) W \) . $
  Let $j_W : "fib" \( W arrow.r L_(K \( 2 \)) W \) arrow.r W$ be the fiber inclusion. Then
  #[#set math.equation(numbering: n => "(2.11)")
   $ d : med U_(upright("mid")) arrow.r^h Y arrow.r^(macron(tau)_2) & "cofib" \( L_1 W arrow.r L_1 L_(K \( 2 \)) W \)\
 & tilde.eq Sigma "fib" \( W arrow.r L_(K \( 2 \)) W \) arrow.r^(- Sigma j_W) Sigma W . $ <eq:first-roof>]
  Indeed, (2.3) identifies the fiber of $W arrow.r L_(K \( 2 \)) W$ with the fiber of $L_1 W arrow.r
    L_1 L_(K \( 2 \)) W$; it is $E \( 1 \)$-local. 2, with $L = L_(K \( 2 \))$ and $M = L_1$,
    then says that the composite from $Y$ in (2.11) is exactly $partial_w$.
    This proves the formula and fixes its minus sign.
  #emph[The rational quotient.] Let $a : F_4 arrow.r X$ be the pullback projection and set $Z = "cofib" \( a \)$.
    Taking the cofiber of the pullback square defining $F_4$ gives a natural equivalence
  #[#set math.equation(numbering: n => "(2.12)")
   $ Z tilde.eq "cofib" \( h : U_(upright("mid")) arrow.r Y \) . $ <eq:quotient-identification>]
  This cofiber is $E \( 1 \)$-local and $K \( 1 \)$-acyclic by (2.8), hence rational.
    Thus $a$ is an equivalence after localization at $K \( 1 \)$ or $K \( 2 \)$, and therefore after $L_J$.
    Rationalizing (2.12) identifies $Z tilde.eq "cofib" \( r \)$.
  Write $z : X arrow.r Z$ for the quotient. Since $Z$ is rational, (2.2) gives its factorization $tilde(z) :
    L_0 X arrow.r Z$. Under the preceding cofiber identification, the map in (iii) is
  #[#set math.equation(numbering: n => "(2.13)")
   $ t = tilde(z) thin b : V arrow.r^tilde.eq Z . $ <eq:terminal-quotient>]
  This records the factorization used to compare the last attachments with fracture.
  #emph[The last four stages.] Let $V_(lt.eq j)$ be the first $j$ summands of $V$, for $0 lt.eq j lt.eq 4$,
    and use the restriction of $t$ to define
  #[#set math.equation(numbering: n => "(2.14)")
   $ F_(4 + j) = X times_Z V_(lt.eq j) . $ <eq:last-stages>]
  At $j = 0$, the cofiber sequence of $a$ identifies this definition with the previous $F_4$, over $X$.
    The cofiber of $V_(lt.eq j - 1) arrow.r V_(lt.eq j)$ is $V_(4 + j)$.
    Exact pullback gives the same cofiber for $F_(4 + j - 1) arrow.r F_(4 + j)$.
  Let $partial_a : Z arrow.r Sigma F_4$ be the boundary of $a$, put $g = partial_a t$, and write $g_i =
    g \|_(V_i)$. The quotient-of-a-pullback argument used above gives every remaining connecting map:
  #[#set math.equation(numbering: n => "(2.15)")
   $ partial_i = Sigma \( F_4 arrow.r F_(i - 1) \) g_i : V_i arrow.r Sigma F_(i - 1) \, wide 5 lt.eq i lt.eq
     8 . $ <eq:last-boundaries>]
  The map $g$ is described by the positive-height fracture square.
    Choose coherent inverse data for $L_J a$, and let $j_a : "fib" \( F_4 arrow.r L_J F_4 \) arrow.r
    F_4$ be the fiber inclusion. The formula is
  #[#set math.equation(numbering: n => "(2.16)")
   $ \[ b \] g : med V arrow.r^b L_0 X arrow.r L_0 L_J X & arrow.r^(\( L_0 L_J a \)^(- 1)) L_0 L_J F_4\
 & arrow.r "cofib" \( L_0 F_4 arrow.r L_0 L_J F_4 \)\
 & tilde.eq Sigma "fib" \( F_4 arrow.r L_J F_4 \) arrow.r^(- Sigma j_a) Sigma F_4 . $ <eq:second-roof>]
  We verify in particular why this roof begins with $b$, rather than only with the quotient equivalence $t$. Put
  $ C_a = "cofib" \( F_4 arrow.r L_J F_4 \) \, wide tau_J = \( L_J a \)^(- 1) compose \( X arrow.r L_J X \) \, $
  and let $q_a : L_J F_4 arrow.r C_a$ be the quotient. The chosen inverse homotopy makes $tau_J
    a$ the localization unit of $F_4$. 2 gives $macron(tau)_J : Z arrow.r C_a$, with a specified homotopy
  $ macron(tau)_J z tilde.eq q_a tau_J . $
  Both $Z$ and $C_a$ are rational: for $C_a$ this follows from (2.4).
    If $rho : C_a arrow.r^tilde.eq L_0 C_a$ is its localization map,
    the rational adjunction transports the last homotopy to
  $ rho macron(tau)_J tilde(z) tilde.eq \( L_0 q_a \) \( L_0 tau_J \) . $
  Using $t = tilde(z) b$, this becomes
  $ rho macron(tau)_J t tilde.eq \( L_0 q_a \) \( L_0 L_J a \)^(- 1) compose \( L_0 X arrow.r L_0 L_J X \) compose b . $
  Exactness identifies $L_0 C_a$ with the cofiber in (2.16).
    The boundary formula $partial_a = \( - Sigma j_a \) macron(tau)_J$ now identifies that entire roof with
    $partial_a t = g$, including the second minus sign.
  Finally, (2.13) makes the projection
  $ e : F_8 = X times_Z V arrow.r X $
  an equivalence. All stages use finite limits or colimits of $E \( 2 \)$-local $S$-modules,
    so they remain in that category. Their maps to $X$ extend $w$; hence $F_2 arrow.r F_8 arrow.r^e X$ is $w$. ◻
]

#thm([Theorem 2.3.])[
  (Attachment identification for the ordered fracture filtration).  #emph[Fix the data $w \, kappa \, r \,
    b$ and the compatibility homotopy of 3. Choose coherent inverse data for $L_(K \( 2 \)) w$,
    and carry out that proposition’s construction. Use exactly its fracture map $h$, pullback stages $F_i$,
    projection $a : F_4 arrow.r X$, quotient $Z = "cofib" \( a \)$, equivalence $t = tilde(z) b :
    V arrow.r^tilde.eq Z$, and terminal projection $e : F_8 arrow.r X$,
    choosing the coherent inverse data for $L_J a$ at the indicated step.
    Under the resulting ordered cofiber identifications
$ W_1 \, med W_2 \, med U_3 \, med U_4 \, med V_5 \, med V_6 \, med V_7 \, med V_8 \, $

 the connecting maps of this same filtration are
$ partial_1 = 0 \, wide partial_2 = 0 \, wide partial_3 = d_3 \, wide partial_4 = Sigma \( F_2 arrow.r F_3 \) d_4 \,\
partial_i = Sigma \( F_4 arrow.r F_(i - 1) \) g_i wide \( 5 lt.eq i lt.eq 8 \) \, $

 where $d = partial_w h$, $g = partial_a t$, $d_i = d \|_(U_i)$, and $g_i = g \|_(V_i)$.
   The maps $d$ and $g$ are the signed roofs
$ d : med U_(upright("mid")) arrow.r^h Y arrow.r^(macron(tau)_2) & "cofib" \( L_1 W arrow.r L_1 L_(K \( 2 \)) W \)\
 & tilde.eq Sigma "fib" \( W arrow.r L_(K \( 2 \)) W \) arrow.r^(- Sigma j_W) Sigma W \, $

 and
$ g : med V arrow.r^b L_0 X arrow.r L_0 L_J X & arrow.r^(\( L_0 L_J a \)^(- 1)) L_0 L_J F_4\
 & arrow.r "cofib" \( L_0 F_4 arrow.r L_0 L_J F_4 \)\
 & tilde.eq Sigma "fib" \( F_4 arrow.r L_J F_4 \) arrow.r^(- Sigma j_a) Sigma F_4 . $

 Here $macron(tau)_2 \, j_W \, j_a$ are the maps defined from the same construction and inverse data above.]
] <thm:attachment-identification>

#proof[
  The proof of 3 established (2.10) and (2.15) under these ordered cofiber identifications.
    It identified their components by (2.11) and (2.16) using precisely the stated inverse data.
    The collected formulas therefore apply to the same $h \, F_i \, a \, Z \, t \, e$. ◻
]

#prodef([Remark 2.4.])[
  The choices of compatibility homotopy and coherent inverses are part of this realization.
    4 does not claim that the filtration is unique or that its attachments are canonical without those choices.
    Together with 3, it identifies the original map $w$, the terminal projection,
    and the connecting maps associated with the stated data. In the height-three application,
    only the first component of $w$ is asserted to be the canonical unit.
]

== 3 Coefficients, stabilizers, and comparison inputs <h3:sec:framework>

The coefficient arguments require three kinds of data: the local sphere and its finite constant-field extensions,
  the stabilizer actions on the deformation rings, and the topology used on continuous cochains.
  We fix these data here and state the external bundle and boundary results at the precise scope used later.
  The actual comparisons between algebraic and completed coefficients will be proved in the following sections.

=== 3.1 Localizations and coefficient fields <localizations-and-coefficient-fields>

Fix $p gt.eq 5$. We work with $p$-local spectra and write

$ S = bb(S)_p^and \, wide T = L_(K \( 3 \)) S \, wide X = L_2 T \, wide R_i = L_(K \( i \)) S . $

We use the natural $S$-module structures throughout. In particular, $L_0 S = H bb(Q)_p$,
  and the rational maps used in fracture are $H bb(Q)_p$-linear.
  The rationalization of $L_i S$, for $i = 1 \, 2$, is $H bb(Q)_p$; it should be distinguished from $L_0 R_i$.

Choose a finite field $k supset.eq bb(F)_(p^6)$. Further finite enlargement will be specified when needed to
  define markings or characters. Let $W \( k \)$ be its Witt ring.
  The finite étale extension $bb(Z)_p arrow.r W \( k \)$ has a unique finite étale lift to an $E_oo$ $S$-algebra
  $S_k$, with

$ pi_(*) S_k = pi_(*) S ⊗_(bb(Z)_p) W \( k \) . $

This is the finite étale classification for ring spectra; see #cite(label("Mathew")) Theorem 2.32.
  We write $R_(i \, k) = L_(K \( i \)) S_k$. A $bb(Z)_p$-basis of $W \( k \)$ gives an equivalence of the
  underlying $S$-module with a finite wedge of copies of $S$, so extension to $S_k$ is faithful.
  The Galois automorphisms lift coherently through the same classification.
  They will be used to descend constructions made over $k$.

Let $E_n \( k \)$ be Morava $E$-theory for the height-$n$ Honda formal group over $k$.
  At height three our coefficient convention is

$ E_(3 \, *) \( k \) = W \( k \) \[ \[ x \, y \] \] \[ u^(plus.minus 1) \] \, wide \| u \| = - 2 . $

The invariant cotangent, or periodicity, line is $omega = pi_2 E_3 \( k \)$;
  it is generated by $u^(- 1)$ over the degree-zero ring. Set

$ A = k \[ \[ x \, y \] \] \, wide x = u_1 \, quad y = u_2 \, wide B_0 = A \[ x^(- 1) \] . $

Twists by powers of $omega$ and finite characters are retained whenever a finiteness argument requires them.
  A trivialization made after finite extension will always be descended.

=== 3.2 Stabilizers and reduced norm <stabilizers-and-reduced-norm>

Let $D_n$ be the central division algebra over $bb(Q)_p$ of invariant $1 \/ n$, and let

$ P_n = cal(O)_(D_n)^times . $

This is the ordinary Honda stabilizer. Its action on $E_n \( k \)$ fixes $W \( k \)$.
  The coefficient-field Galois group acts semilinearly and gives the extended stabilizer

$ G_n \( k \) = P_n times.r "Gal" \( k \/ bb(F)_p \) . $

The field contains the endomorphism field for every $n = 1 \, 2 \, 3$ used here.

At height three, define

$ H = ker #scale(x: 120%, y: 120%)[\(] "Nrd" : P_3 arrow.r bb(Z)_p^times #scale(x: 120%, y: 120%)[\)] \, wide H' =
  "Nrd"^(- 1) \( mu_(p - 1) \) . $

The reduced norm is surjective, and therefore

#[#set math.equation(numbering: n => "(3.1)")
 $ H' \/ H tilde.eq mu_(p - 1) \, wide P_3 \/ H' tilde.eq 1 +
   p bb(Z)_p tilde.eq bb(Z)_p . $ <h3:eq:framework-norm-quotients>]

For example, the norm on the maximal unramified subfield is surjective on units.
  The logarithm on the last quotient is normalized using a topological generator.
  The resulting integral determinant class is denoted $zeta in pi_(- 1) T$;
  its construction as an actual sphere map is recalled in 7.

#thm([Lemma 3.1.])[
  #emph[The compact groups $P_3 \, H \, P_2 \, P_1 \, "GL"_2 \( bb(Z)_p \)$ and $"SL"_2 \( bb(Z)_p \)$ have no
    elements of order $p$. Their $p$-cohomological dimensions are respectively $9 \, 8 \, 4 \, 1 \, 4 \, 3$.
    Their adjoint orientation characters are trivial. Their trivial $bb(Z)_p$-modules admit finite resolutions by
    finitely generated projective completed group-ring modules.]
] <h3:lem:framework-groups>

#proof[
  An element of order $p$ in $D_n^times$ would generate a copy of $bb(Q)_p \( zeta_p \)$.
    Its degree $p - 1$ must divide $n^2$, since $D_n$ would be a vector space over that subfield.
    For $n = 1 \, 2 \, 3$ and $p gt.eq 5$, this is impossible except for the apparent numerical possibility $n =
    2 \, p = 5$; in that case a commutative subfield of a degree-two central division algebra has degree at most
    two, whereas $p - 1 = 4$. Equivalently, the usual subfield-degree theorem rules out all these cases at once.
    An element of order $p$ in $"GL"_2 \( bb(Q)_p \)$ would give a faithful two-dimensional representation of the
    nontrivial irreducible factor of $X^p - 1$, whose degree is $p - 1 > 2$, and is likewise impossible.
  The Lie dimensions are the stated ones. Reduced norm has surjective differential,
    so its kernel has dimension eight. Conjugation has determinant one on a central simple algebra;
    its restriction to the trace-zero summand also has determinant one.
    The same calculation applies to the matrix groups. Thus their adjoint orientation characters are trivial.
  For a compact $p$-adic analytic group without $p$-torsion,
    $p$-cohomological dimension equals its Lie dimension #cite(label("Serre1965CohomologicalDimension"))
    Section 1, Corollary (1). Writing $Lambda = bb(Z)_p \[ \[ G \] \]$,
    Venjakob #cite(label("Venjakob")) pp. 275–276 records both Noetherianity of $Lambda$ and $"pd"_Lambda
    bb(Z)_p = "cd"_p \( G \)$, with agreement between finitely generated compact and abstract modules.
    Successive finite free presentations therefore have finitely generated kernels and a projective final syzygy,
    giving the asserted finite projective resolution. The associated duality is used with the continuous
    coefficient models specified below. ◻
]

No torsion-freeness claim about an arbitrary finite Galois factor is needed.
  Its action is instead handled by semilinear descent.

#thm([Lemma 3.2.])[
  #emph[Let $k' \/ k$ be a finite extension of finite fields with Galois group $Gamma$.
    On $W \( k' \)$-modules carrying a semilinear $Gamma$-action, the invariants functor is exact.
    The same assertion holds for reductions modulo $p^ell$, and the associated finite-group higher cohomology
    vanishes. These assertions respect continuous equivariant maps.]
] <h3:lem:framework-semilinear>

#proof[
  The residue-field trace is surjective. Lifting a trace-one element to $W \( k' \)$ and dividing by its unit
    trace produces $a in W \( k' \)$ with $sum_(gamma in Gamma) gamma \( a \) = 1$.
    For a semilinear module $M$, the finite sum
  $ P \( m \) = sum_(gamma in Gamma) gamma \( a \) thin gamma \( m \) $
  is an additive projection onto $M^Gamma$. If an invariant element in a quotient has a lift,
    applying $P$ to that lift gives an invariant lift. This proves exactness,
    and the same formula works modulo $p^ell$. For an equivariant homogeneous cochain $f$ of positive degree,
    the operator
  $ \( h f \) \( g_0 \, dots.h \, g_(q - 1) \) = sum_(gamma in Gamma) gamma \( a \)
    f \( gamma \, g_0 \, dots.h \, g_(q - 1) \) $
  is still equivariant, by semilinearity and reindexing the sum.
    The alternating homogeneous differential satisfies $d h + h d = upright("id")$ in positive degrees,
    since the sum of the coefficients is one. This proves the higher vanishing.
    All sums and scalar operations are finite and continuous. No division by $\| Gamma \|$ has been made. ◻
]

=== 3.3 Continuous cochains and filtered coefficients <continuous-cochains-and-filtered-coefficients>

For a topological group $G$ and a continuous coefficient module $M$, we use the inhomogeneous continuous cochain complex

$ C_(upright("cts"))^q \( G \, M \) = C_(upright("cts")) \( G^q \, M \) $

with its usual differential. Complete power-series and valuation lattices have their linear topologies.
  Their discrete quotients have the quotient topology. For a profinite parameter space $Q$,
  all constructions are also made with coefficients $C_(upright("cts")) \( Q \, M \)$.

A filtered localization or algebraic union is interpreted at the level of complexes.
  If $M = "colim"_lambda M_lambda$ is such a coefficient object, our notation means

#[#set math.equation(numbering: n => "(3.2)")
 $ C_(upright("cts"))^bullet \( G \, M \) := "colim"_lambda C_(upright("cts"))^bullet \( G \, M_lambda \) .
   $ <h3:eq:framework-filtered-cochains>]

Thus a cochain has a common finite stage or pole bound. This is the coefficient convention produced by ordinary
  tensor products in the residue tests. It is generally different from the complex of all metric-continuous maps
  into a topologized union.

We use completed group-ring resolutions to compute continuous cohomology only after comparing them with the
  continuous cochain model on the coefficient category in question.
  For complete linearly topologized modules the comparison, compact duality,
  and the required strictness statements are established in 6.
  For the geometric integral complexes in 10, profinite parameters are retained through descent and the derived
  limits. The finite solid resolution argument there justifies the later calculation on their point-valued
  cohomology rows.

The holomorphic coefficient ring $B_(upright("hol"))$ consists of integral-exponent Laurent series converging on

$ 0 < \| x \| < 1 \, wide \| y \| < 1 $

over the trivially valued field $k$. We give it the inverse-limit topology from Gauss norms on an exhaustion by
  closed polyannuli. The analogous analytic completed perfection is $B_(upright("pk"))$.
  The precise exhaustion, coefficient growth conditions and root projections are specified in 8.
  Bounded-pole submodules of $B_0$ carry their compact lattice topology.
  We distinguish the coheight-one Cartier operator $cal(C)$ from the ordinary root-projection operator $cal(P)$.
  Their different Frobenius identities will be proved on their respective coefficient modules.

=== 3.4 Geometric coefficient theory <geometric-coefficient-theory>

We use perfectoid tilting and the Fargues–Fontaine curve over an algebraically closed perfectoid field.
  The notation $cal(O)^flat$ denotes the analytic tilted structure sheaf;
  an integral valuation lattice is indicated separately. In particular,
  the affinoid perfectoid acyclicity used below concerns this analytic sheaf.
  We do not replace an integral almost-vanishing statement by ordinary vanishing.

Let

$ V_s = cal(O) \( 1 \/ s \) $

be the stable rank-$s$, degree-one bundle. We use the classification of vector bundles by slopes,
  $H^0 \( cal(O) \) = bb(Q)_p$, and the relative vanishing of $H^1$ for trivial bundles and positive basic bundles
  as a $v$-sheaf. On a fixed basic stratum, bundles admit $v$-local standard forms with the indicated locally
  profinite automorphism groups. Slope-zero bundles correspond to rational local systems;
  their integral lattices are additional data. These are the precise background bundle results needed from
  #cite(label("FarguesFontaine")) #cite(label("KedlayaLiu")) #cite(label("ScholzeWeinstein"));
  the precise relative arguments appear in 11.

The Honda universal cover identifies the section sheaf of $V_s$ with the perfected open Honda ball,
  compatibly with addition and endomorphisms. The Banach–Colmez description is provided by #cite(label("LeBras"))
  #cite(label("ScholzeWeinstein")). For maps over a varying perfectoid base we use relative full faithfulness of
  derived sections #cite(label("AnschuetzLeBrasFourier")) Corollary 3.11;
  its application to positive bundles is made explicit in 4.
  4 verifies the finite-level coordinate comparison and the relative integral frame reductions used in this paper.
  5 proves the nonproper relative support calculations; they are not supplied by affinoid acyclicity alone.

=== 3.5 The two boundary calculations <the-two-boundary-calculations>

We use two boundary calculations. The rational height-three calculation is

#[#set math.equation(numbering: n => "(3.3)")
 $ pi_(*) L_0 T tilde.eq Lambda_(bb(Q)_p) \( alpha_1 \, alpha_3 \, alpha_5 \) \, wide \| alpha_i \| = -
   i . $ <h3:eq:framework-rational-boundary>]

For the primes $p gt.eq 5$ considered here, 86 gives the argument of #cite(label("BSSW")) Theorem A,
  including its arithmetic and tower-comparison inputs. Its identification with the particular constant trace
  class needed here is treated separately in 10; a rational dimension calculation cannot identify a localization map.

For context, the known odd-prime height-two splitting is

#[#set math.equation(numbering: n => "(3.4)")
 $ L_1 R_2 tilde.eq L_1 \( S or Sigma^(- 1) S \) or L_0 \( Sigma^(- 3) S or Sigma^(- 4) S \) \,
   $ <h3:eq:framework-height-two-boundary>]

as stated in #cite(label("BB")) Theorem 6.7. Exactness also gives $R_2 \/ p tilde.eq L_(K \( 2 \)) \( S \/ p \)$,
  where $S \/ p$ is the finite Moore spectrum. For $p gt.eq 5$,
  #cite(label("HS99")) Theorem 15.1 therefore implies that $pi_a \( R_2 \/ p \)$ is finite for every integer $a$.
  The finite groups $pi_a \( R_2 \/ p \)$ give one boundary for the intermediate finiteness argument in 8.
  That argument derives the required finiteness of $L_1 \( R_2 \/ p \)$ directly from the height-two group
  calculation of #cite(label("Behrens2012")) Remark 7.8. The coheight-one test, the ordinary comparison,
  and all the attaching maps are proved below.

Morava descent will be used with an explicit convergence statement:
  the completed Amitsur error tower has a uniform nilpotence bound,
  so the exact tests in this proof preserve its totalization, as derived from descendability in 50.
  The cooperation calculation of Devinatz–Hopkins #cite(label("DevinatzHopkins")) Theorem 2(ii) and
  Proposition 2.2 is used first for the usual coefficient ring $W \( bb(F)_(p^n) \)$ and extended stabilizer.
  The passage to the chosen $k$, the relative algebra over $S_k$,
  and its ordinary-stabilizer action-cobar terms are local arguments of 7,
  which also retains the actual unit and cofaces.

== 4 Tate coordinates and integral frames <h3:sec:towers>

Our goal is to describe the two completed height strata by extension spaces carrying their actual integral frames.
  The finite torsion coordinates first identify the completed Tate-basis towers.
  Relative sections on the Fargues–Fontaine curve then identify their quotient frames and determinant characters.
  We finish by descending the markings and the finite root torsors to the algebraic coefficient rings needed for
  ordinary descent.

Fix a finite field $k$ containing $bb(F)_(p^6)$. For $s = 1 \, 2 \,
  3$ let $Gamma_s$ be a Honda formal group over $k$, with $\[ p \]_(Gamma_s) \( T \) = T^(p^s)$, and put

$ D_s = "End"_k \( Gamma_s \) \[ 1 \/ p \] \, wide P_s = "Aut"_k \( Gamma_s \) = cal(O)_(D_s)^times . $

We use the convention in which the corresponding Fargues–Fontaine bundle $V_s =
  cal(O) \( 1 \/ s \)$ has rank $s$ and degree one. The notation $H_s$ denotes the perfected open Honda ball:
  on an affinoid perfectoid $k$-algebra $\( R \, R^(+) \)$ it is $R^(compose compose)$,
  with addition defined by $Gamma_s$. It is a sheaf of $bb(Q)_p$-vector spaces, since $\[ p \]$ is invertible.
  All assertions about a locus in these sheaves are understood fiberwise at geometric points.

Let $cal(G)$ be the $p$-divisible group obtained from the universal height-three deformation, reduced modulo $p$,
  over $A = k \[ \[ x \, y \] \]$. Here and below this is the algebraic $p$-divisible group formed by its finite
  kernels. In detail, preparation applied to $\[ p^l \] \( T \)$ gives finite free algebras

$ A \[ \[ T \] \] \/ \( \[ p^l \] \( T \) \) $

of rank $p^(3 l)$. Their coordinates are topologically nilpotent for the maximal-ideal topology,
  so substitution in the formal group law defines their algebraic group operations.
  Preparation applied to $\[ p \] \( T \) - Z$ proves the required finite flat transition maps.
  We base change these finite groups when we pass to a height stratum;
  we do not complete the generic fiber at its identity and thereby discard its étale part.

For $m = 1 \, 2$ put $r = 3 - m$ and

$ A_m = A \/ \( u_1 \, dots.h \, u_(m - 1) \) = k \[ \[ u_m \, dots.h \, u_2 \] \] \, wide u_1 = x \, quad u_2 = y \, $

where the ideal is zero for $m = 1$. We use the same symbol $cal(G)$ for its base change to $"Spec" \( A_m \)$ and
  for subsequent base changes to covers. Let $cal(X)_m$ be the completed perfection of the analytic locus where
  the displayed parameters are topologically nilpotent and $u_m$ is invertible.
  The $p$-divisible group on this locus has connected height $m$ and étale height $r$.
  Let $cal(T)_m arrow.r cal(X)_m$ be the tower of integral bases of its étale Tate module.
  Thus its structure group is $"GL"_r \( bb(Z)_p \)$.

=== 4.1 Finite levels and their norms <finite-levels-and-their-norms>

#thm([Lemma 4.1.])[
  #emph[For $l gt.eq 1$, form the reduced closure of the locus of $r$ points of $cal(G) \[ p^l \]$ whose images
    are a basis of the étale quotient at the generic point of $A_m$.
    Its coordinate algebra $B_l$ is finite over $A_m$, and its lifted point coordinates $t_(1 \, l) \, dots.h \,
    t_(r \, l)$ give isomorphisms
$ B_l = k \[ \[ t_(1 \, l) \, dots.h \, t_(r \, l) \] \] \, wide C_l :=
  A_m \[ t_(1 \, l)^(p^(m l)) \, dots.h \, t_(r \, l)^(p^(m l)) \] =
  k \[ \[ t_(1 \, l)^(p^(m l)) \, dots.h \, t_(r \, l)^(p^(m l)) \] \] . $

 The subalgebra on the left is already complete. The algebra $C_l \[ u_m^(- 1) \]$ is the finite étale algebra of
   bases of $cal(G)^(upright("et")) \[ p^l \]$ over $A_m \[ u_m^(- 1) \]$.
   Over this basis cover, $B_l \[ u_m^(- 1) \]$ is the algebra of all generator lifts, without taking a reduction.
   The transition maps $B_j arrow.r B_l$, $j lt.eq l$, are finite injective maps, and
$ t_(i \, j) in k \[ \[ t_(1 \, l)^(p^(m \( l - j \))) \, dots.h \, t_(r \, l)^(p^(m \( l - j \))) \] \] . $

]
] <h3:geom:regular-levels>

#proof[
  One precise definition of the closure is the image of the finite $A_m$-algebra of $r$-tuples in
    $cal(G) \[ p^l \]$ in the reduced coordinate algebra of the indicated generic locus.
    It is therefore finite and reduced, the map $A_m arrow.r B_l$ is injective,
    and every irreducible component dominates $"Spec" A_m$. At the closed point all torsion coordinates are
    nilpotent. Consequently $B_l$ is local with residue field $k$,
    and its maximal ideal is generated by the height parameters and the $t_(i \, l)$.
  Write $d = p^m$ and $q = p^3$. Put $a_i = \[ p^(l - 1) \]_(cal(G)) \( t_(i \, l) \)$,
    and for $v = \( v_1 \, dots.h \, v_r \) in bb(F)_p^r$ put $a_v = sum_(cal(G)) \[ v_i \] a_i$.
    If $W_p \( T \)$ is the distinguished polynomial for $\[ p \]_(cal(G)) \( T \)$, then
  #[#set math.equation(numbering: n => "(4.1)")
   $ W_p \( T \) = product_(v in bb(F)_p^r) \( T - a_v \)^d =
     product_(v in bb(F)_p^r) \( T^d - a_v^d \) . $ <h3:geom:basis-divisor>]
  Indeed, over each geometric generic field the connected part has length $d$ and the $a_v$ enumerate the distinct
    étale points. Both sides are monic of degree $q$. Equality of their coefficients there implies equality in the
    reduced generic closure.
  On $A_m$, the series $\[ p \] \( T \)$ factors through $T^d$.
    It follows that every $a_v^d$ is a series over $A_m$ in $w_i = t_(i \, l)^(d^l)$,
    with zero constant term as a series in the $w_i$. The algebra $C_l =
    A_m \[ w_1 \, dots.h \, w_r \]$ is finite over the complete ring $A_m$, hence complete.
    Equation (4.1) is an identity over $C_l$. Modulo $\( w_1 \, dots.h \, w_r \)$ it becomes $W_p \( T \) = T^q$.
    The preparation unit for $\[ p \] \( T \)$ lies over $A_m$;
    thus every coefficient below degree $q$ in $\[ p \] \( T \)$ vanishes in this quotient.
    The successive height-coordinate congruences
  $ \[ p \] \( T \) equiv u_i T^(p^i) med \( mod med \( u_m \, dots.h \, u_(i - 1) \, T^(p^i + 1) \) \) \, wide
    m lt.eq i lt.eq 2 \, $
  now imply, successively, that all $u_i$ vanish. Hence the maximal ideal of $C_l$ is generated by the $r$
    elements $w_i$. The ring has dimension $r$, because it is integral over $A_m$. It is a regular local ring.
    The surjection $k \[ \[ W_1 \, dots.h \, W_r \] \] arrow.r C_l$, $W_i mapsto w_i$, is an isomorphism:
    a nonzero kernel would lower dimension in the regular domain on the left.
    Applying the identical maximal-ideal argument with $t_(i \, l)$ in place of $w_i$ proves $B_l =
    k \[ \[ t_(1 \, l) \, dots.h \, t_(r \, l) \] \]$. This also proves the asserted identification of the
    inclusion $C_l subset B_l$, rather than just abstract regularity of both rings.
  Over $u_m eq.not 0$, relative Frobenius of order $m l$ identifies the quotient of $cal(G) \[ p^l \]$ by its
    connected part with its image under $T mapsto T^(d^l)$. Here is a check that retains the prepared finite
    algebra. Write $\[ p^l \] \( T \) = g_l \( T^(d^l) \)$ and prepare $g_l \( S \) = U_l \( S \) V_l \( S \)$,
    with $U_l$ a unit and $V_l$ monic of degree $p^(r l)$. Its linear coefficient $a_l$ is a unit multiple of
    $u_m^(1 + d + dots.h.c + d^(l - 1))$. Invariant differentials for this Frobenius-divided homomorphism give
  $ g'_l \( S \) = a_l frac(h_(upright("source")) \( S \), h_(upright("target")) \( g_l \( S \) \)) \, $
  where both $h$ are unit series. In the finite algebra defined by $V_l$,
    this says that $U_l V'_l$ becomes a unit after inverting $u_m$. Thus that algebra is étale of rank $p^(r l)$.
    The kernel of relative Frobenius has rank $d^l$ and is the connected part.
    Taking bases gives exactly $S_l = C_l \[ u_m^(- 1) \]$.
  Over $S_l$, the scheme of lifts of its universal basis is finite locally free of rank $d^(l r)$.
    Its coordinate algebra surjects onto $B_l \[ u_m^(- 1) \]$:
    the latter is generated by the same lifted coordinates. But the identified power-series rings show that
    $B_l \[ u_m^(- 1) \]$ is free over $S_l$ of this same rank, with the monomials $product_i t_(i \, l)^(e_i)$,
    $0 lt.eq e_i < d^l$, as a basis. A surjection between finite locally free modules of the same rank is an
    isomorphism. This proves the assertion about the full lift scheme;
    in particular the earlier generic reduction has removed no infinitesimal part on the exact-height locus.
  Every étale basis at level $j$ lifts to a basis at level $l$ after a geometric field extension.
    The transition map on generic coordinate algebras is therefore injective.
    Its restriction $B_j arrow.r B_l$ is injective by generic density and finite since $B_l$ is finite over $A_m$.
    Finally $t_(i \, j) = \[ p^(l - j) \]_(cal(G)) \( t_(i \, l) \)$ factors through $t_(i \, l)^(d^(l - j))$.
    Substituting the expressions for the base parameters in $C_l$ gives the last assertion. ◻
]

The finite-level calculation has retained both the étale basis and every infinitesimal lift.
  To pass to the completed tower, we now give explicit inverse coordinates on the universal cover.

#thm([Lemma 4.2.])[
  #emph[Let $\( R \, R^(+) \)$ be an affinoid perfectoid $k$-algebra and specialize the parameters of $A_m$ to
    $R^(compose compose)$. For the resulting formal law $cal(G)_a$, there is a natural additive isomorphism
$ H_3 \( R \) med arrow.r^(med Phi_a med) med "proj lim"_(\[ p \]) cal(G)_a \( R^(compose compose) \) . $

 Writing $P_a = \[ p \]_(cal(G)_a)$, its coordinates and inverse are
#[#set math.equation(numbering: n => "(4.2)")
 $ Phi_a \( z \)_j = lim_(n arrow.r oo) P_a^(compose n) #scale(x: 120%, y: 120%)[\(] z^(1 \/ p^(3 \( j + n \)))
   #scale(x: 120%, y: 120%)[\)] \, wide Phi_a^(- 1) \( \( t_j \) \) =
   lim_(j arrow.r oo) t_j^(p^(3 j)) . $ <h3:geom:cover-formulas>]

 These formulas commute with change of coefficients and with changes of deformation framing.
   Over an algebraically closed perfectoid field, the kernel of the zeroth projection is the integral Tate module
   of the étale quotient of $cal(G)_a$.]
] <h3:geom:universal-cover>

#proof[
  Choose a power-multiplicative spectral norm and $lambda < 1$ bounding the specialized parameters.
    All coefficients of $cal(G)_a - Gamma_3$ and of $P_a \( T \) - T^q$, $q = p^3$, have norm at most $lambda$.
    Integral formal series are $1$-Lipschitz on the open unit ball.
    Since $P_a$ factors through $T^d$, $d = p^m$, we have
  $ \| P_a^(compose n) \( v \) - P_a^(compose n) \( w \) \| lt.eq \| v - w \|^(d^n) . $
  Consecutive approximations in the first formula differ by at most $lambda^(d^n)$.
    Their limits exist, are topologically nilpotent, and satisfy
  $ \| Phi_a \( z \)_j - z^(1 \/ q^j) \| lt.eq lambda \, wide P_a \( Phi_a \( z \)_(j + 1) \) = Phi_a \( z \)_j . $
  For a compatible sequence $\( t_j \)$, consecutive terms in the second formula differ by at most $lambda^(q^j)$.
    Its limit $z$ satisfies $\| z - t_j^(q^j) \| lt.eq lambda^(q^j)$.
    Substitution in the first formula and the displayed contraction show in both directions that the formulas are
    inverse. This reasoning never requires a common strict upper bound on all the $\| t_j \|$.
  The coefficients of $Gamma_3$ are fixed by the $q$th-power map.
    The difference between the two addition laws is at most $lambda$;
    after $n$ applications of $P_a$ it is at most $lambda^(d^n)$. Taking the limit proves additivity.
    If $g$ changes the deformation framing, its evaluated coordinate change differs from its Honda reduction by
    coefficients of norm at most $lambda$, after increasing $lambda$ if necessary.
    The same contraction proves $Phi_(g a) \( g z \) = g Phi_a \( z \)$.
    Uniform convergence on smaller balls proves continuity and compatibility with maps of perfectoid algebras.
  Over an algebraically closed field the points with $t_0 = 0$ are exactly the compatible $p^j$-torsion points.
    A finite connected group over a perfect field has just its identity as a geometric point,
    so these points form the Tate module of the étale quotient. The zeroth projection is surjective:
    preparation applied to $\[ p \] \( T \) - w$ gives a monic distinguished polynomial,
    each of whose roots is small when $w$ is small. Successively choosing roots gives a compatible sequence with
    prescribed $t_0$. ◻
]

Write $\( H_3^r \)_(upright("ind"))$ for the locus of tuples whose images on every geometric fiber are
  $bb(Q)_p$-linearly independent for the Honda vector-space structure on $H_3$.

#thm([Theorem 4.3.])[
  (Coordinate comparison).  #emph[There is a natural $P_3 times "GL"_r \( bb(Z)_p \)$-equivariant isomorphism
$ cal(T)_m med tilde.eq med \( H_3^r \)_(upright("ind")) . $

 The map takes a compatible basis of generator lifts to $z_i = lim_l t_(i \, l)^(p^(3 l))$.
   It identifies the relevant completed function algebras with their spectral norms on exhausted closed smaller
   balls. The assertion holds on the relative perfectoid site and remains valid after adjoining arbitrary
   profinite parameters.]
] <h3:thm:coordinate-comparison>

#proof[
  First retain the reduced finite-level closures, including their higher-height boundary.
    Perfection identifies a point of the étale quotient with its unique connected generator lift,
    so their perfected inverse tower is the tower from 8.
  We check the complete algebras after extension to an algebraically closed perfectoid field $C^flat$;
    these field extensions form v-covers, and all constructions are defined over $k$.
    Put $q = p^3$, $d = p^m$ and $y_(i \, l) = t_(i \, l)^(q^l)$.
    For $0 < rho < 1$ in the value group, let $X_l \( rho \)$ be the closed polydisc $max_i \| y_(i \, l) \| lt.eq
    rho$. If $lambda$ is the maximum norm of the height parameters at a point of this polydisc,
    then 8 at level one gives
  $ lambda lt.eq parallel t_(dot.op \, 1) parallel^d \, wide parallel t_(dot.op \, 1) parallel lt.eq
    max \( rho^(1 \/ q) \, lambda \) . $
  The second inequality follows by finite telescoping of the normalized division coordinates.
    If $lambda > rho^(1 \/ q)$, the two inequalities would give $0 < lambda lt.eq lambda^d < lambda$. Therefore
  #[#set math.equation(numbering: n => "(4.3)")
   $ lambda lt.eq rho^(d \/ q) . $ <h3:geom:uniform-radius>]
  For consecutive levels it follows that
  $ parallel y_(dot.op \, l + 1) - y_(dot.op \, l) parallel lt.eq lambda^(q^l) lt.eq
    rho^(d q^(l - 1)) < rho wide \( l gt.eq 1 \) . $
  The finite transition maps take $X_(l + 1) \( rho \)$ to $X_l \( rho \)$.
    Conversely every point of $X_l \( rho \)$ has a lift, by finiteness, injectivity and lying-over,
    and the last strict inequality forces every lift to remain in $X_(l + 1) \( rho \)$.
    They are thus surjective maps of these closed polydiscs. Pullback is isometric for their spectral norms,
    before and after completed perfection.
  In the completed direct limit of the perfected Banach algebras, the $y_(i \, l)$ converge to elements $z_i$.
    The homomorphism from the perfected Gauss algebra of a polydisc of radius $rho$ sending its coordinates to
    $z_i$ is isometric. Indeed, for any polynomial in finitely many fractional powers,
    evaluation on $y_(dot.op \, l)$ has exactly its Gauss norm:
    $t_(dot.op \, l)$ are free polydisc coordinates and $q^l$ is a power of $p$.
    These evaluations converge to evaluation on $z$. A nonzero limiting polynomial therefore has precisely that
    norm. Completing preserves the isometry.
  Its image is all the completed direct limit. For $l gt.eq j$, write
  $ t_(i \, j) = F_(i \, j \, l) \( t_(1 \, l)^(d^(l - j)) \, dots.h \, t_(r \, l)^(d^(l - j)) \) \, wide
    F_(i \, j \, l) in k \[ \[ T_1 \, dots.h \, T_r \] \] . $
  The formulas in 9 show that replacing $t_(i \, l)$ by $z_i^(1 \/ q^l)$ changes this expression by at most
  $ lambda^(d^(l - j)) lt.eq rho^(\( d \/ q \) d^(l - j)) \, $
  which tends to zero. Its substituted series converges on the $z$-polydisc.
    Thus the closed image contains every $t_(i \, j)$ and, by applying roots to the same estimates,
    all its $p$-power roots. These elements generate the completed direct limit.
    Varying $rho$ proves the comparison for the open balls.
  It remains to identify the open locus. For $a = \( a_1 \, dots.h \, a_r \) in bb(Z)_p^r$,
    form the compatible points $t_(a \, j) = sum_(cal(G)) \[ a_i \] t_(i \, j)$.
    The normalized limit is $sum_(Gamma_3) \[ a_i \] z_i$ by 9.
    If it vanishes, then $\| t_(a \, l) \| lt.eq lambda$ at every level, and hence
  $ \| t_(a \, j) \| = \| \[ p^(l - j) \] \( t_(a \, l) \) \| lt.eq lambda^(d^(l - j)) arrow.r 0 . $
  Thus every $t_(a \, j)$ vanishes. Conversely a relation in the Tate module gives the same relation among the
    $z_i$. At height exactly $m$, (4.1) gives a basis of the étale quotient modulo $p$,
    and the compatible points give an injective map $bb(Z)_p^r$ into its Tate module.
    At greater height that Tate module has rank less than $r$, so there is a relation.
    Multiplying a rational relation by a power of $p$ reduces to the integral assertion.
    Exact height $m$ is therefore exactly the independent locus.
    This identifies the corresponding open subsheaves; it is not only a bijection on their field-valued points.
  Equivariance is part of 9. All the estimates are spectral estimates on affinoid perfectoid algebras.
    They apply to continuous functions with a profinite parameter by taking their uniform norm,
    so the same isomorphisms retain those parameters. ◻
]

=== 4.2 Sections and extension spaces on the curve <sections-and-extension-spaces-on-the-curve>

We recall precisely the curve results we need. For a perfectoid test object $S$,
  write $X_S$ for its relative Fargues–Fontaine curve; this notation does not posit a morphism of schemes $X_S
  arrow.r S$. Relative sections and relative cohomology below mean the corresponding sheaves on the perfectoid site.

#thm([Lemma 4.4.])[
  #emph[There are natural isomorphisms of additive sheaves
$ H_s tilde.eq #scale(x: 120%, y: 120%)[\(] S mapsto H^0 \( X_S \, V_s \) #scale(x: 120%, y: 120%)[\)] . $

 The automorphism sheaf of $V_s$ is the locally profinite group $D_s^times$.
   A family fiberwise isomorphic to $V_s$ is locally of that form for the pro-étale topology.
   If $tau$ denotes the morphism of v-sites associated with $X_S$, then
$ R tau_(*) cal(O)^a = underline(bb(Q)_p)^(thin a) \, wide R tau_(*) E = tau_(*) E \[ 0 \] $

 for every family $E$ fiberwise isomorphic to a $V_s$. Relative sections are fully faithful on $bb(Q)_p$-linear
   sheaf morphisms between these bundles and slope-zero bundles. All assertions commute with base change and v-descent.]
] <h3:geom:curve-inputs>

#proof[
  For the unramified degree-$s$ extension of $bb(Q)_p$, the Lubin–Tate universal cover is the section sheaf of
    $cal(O) \( 1 \)$ on the curve with that coefficient field #cite(label("FarguesScholze")) Proposition II.2.2.
    Unramified pushforward gives $V_s$. Reduction of the universal cover and tilting identify it with the Honda
    universal cover; one can check reduction directly by the contracting formulas of 9,
    using $\| \[ p \] \( v \) - \[ p \] \( w \) \| lt.eq max \( \| p \| thin \| v - w \| \, \| v - w \|^2 \)$
    before reduction. This proves the first assertion with its addition and endomorphisms.
    For the local-form assertion, the vector-bundle equivalence and pure-module theorem identify a pure family of
    slope $c \/ d$ in lowest terms, after adjoining $bb(F)_(p^d)$,
    with a $\( c \, d \)$-$bb(Q)_p$ local system #cite(label("KedlayaLiu")) Theorems 8.7.8 and 8.5.12.
    Its semilinear Frobenius supplies the action of the constant cyclic division algebra
    #cite(label("KedlayaLiu")) Definition 8.5.7. These local systems trivialize in the pro-étale topology
    #cite(label("KedlayaLiu")) Lemma 9.1.11; a module basis over that division algebra gives the specified basic
    local form. Its automorphism sheaf is therefore the locally profinite $D_s^times$.
    The slope-zero case is also #cite(label("KedlayaLiu")) Corollary 8.7.10.
    To retain the ground field $k$, observe that every geometric Honda endomorphism $f \( T \) =
    sum a_i T^i$ commutes with $\[ p \] \( T \) = T^(p^s)$. Hence $a_i^(p^s) = a_i$,
    so all integral endomorphisms, and then all of $D_s$, are defined over $bb(F)_(p^s) subset k$.
    The actual Honda bundle over $k$ therefore defines a map from $B underline(D_s^times)$ to the rank-$s$,
    degree-one basic locus. After extending $k$ to its algebraic closure,
    the preceding local-form theorem and its identification of automorphisms make this an equivalence.
    Equivalences of v-stacks descend along that cover, so the frame torsors already have descent over $k$.
  For the required cohomology, on the curve with unramified coefficient field of degree $s$,
    the bundle $cal(O) \( 1 \)$ is the positive geometric twist of the globally étale bundle $cal(O)$.
    Thus its $H^1$ vanishes on every affinoid perfectoid test object #cite(label("KedlayaLiu")) Corollary 8.8.7
    and Theorem 8.7.13. Unramified finite pushforward gives the same assertion for the standard $V_s$.
    A family of that basic type first standardizes pro-étale locally, so its $H^1$ sheaf vanishes.
    For $cal(O)^a$, its $H^0$ sheaf is $underline(bb(Q)_p)^(thin a)$.
    An extension of $cal(O)$ by $cal(O)^a$ is pointwise of slope zero;
    the local-system equivalence makes it split pro-étale locally.
    This proves vanishing of its $H^1$ sheaf, without asserting vanishing over an unrefined affinoid.
    Higher cohomology on affinoid tests is zero by #cite(label("KedlayaLiu")) Theorem 8.7.13.
  The needed full faithfulness is relative: for any small v-stack $S$, the functor
  $ R tau_(*) : "Perf" \( X_S \) arrow.r D \( S_v \, bb(Q)_p \) $
  is fully faithful #cite(label("AnschuetzLeBrasFourier")) Corollary 3.11.
    For the basic positive and slope-zero bundles just considered,
    the preceding vanishing identifies $R tau_(*) E$ with its section sheaf in degree zero.
    Taking degree-zero morphisms therefore identifies bundle maps with $bb(Q)_p$-linear maps of section sheaves.
    This construction is compatible with every base change on $S$,
    so it also applies to relative forms of the basic bundles. ◻
]

Put

$ N_m = #scale(x: 120%, y: 120%)[\(] S mapsto H^1 \( X_S \, V_m^or \) #scale(x: 120%, y: 120%)[\)] \, wide
  cal(E)_m = \( N_m^r \)_(upright("ind")) . $

The extension interpretation uses sheafified relative $H^1$ and classifies extensions with both ends framed.
  Independence in $N_m^r$ means independence over $bb(Q)_p$ on every geometric fiber.

#thm([Lemma 4.5.])[
  #emph[Independent sections of $V_3$ define a subbundle $cal(O)^r arrow.r.hook
    V_3$ with quotient fiberwise $V_m$. Conversely, an extension of $V_m$ by $cal(O)^r$ has middle bundle
    fiberwise $V_3$ if and only if its class lies in $cal(E)_m$.]
] <h3:geom:independent-extensions>

#proof[
  First work on an absolute curve. Let $M$ be the saturation of the generic span of $r$ independent sections and
    put $b = "rank" M$. A wedge of $b$ generically independent sections gives a nonzero section of $det M$,
    so $deg M gt.eq 0$. Stability of $V_3$ gives $deg M lt.eq b \/ 3 < 1$. Since degree is integral, it is zero.
    The wedge has no zeros, because a nonzero effective divisor has positive degree.
    The selected sections trivialize $M$. Since $H^0 \( X \, cal(O) \) = bb(Q)_p$,
    independence of the original sections forces $b = r$; hence their map is a subbundle map.
    All slopes of its quotient are positive: a quotient of nonpositive slope would give a nonzero map from $V_3$
    to a bundle of slope at most zero. A positive bundle of rank $m lt.eq 2$ and degree one is $V_m$,
    by the classification of bundles and integrality of degrees #cite(label("FarguesScholze")) Theorem II.2.14.
  An extension of $V_m$ by $cal(O)^r$ has no negative-slope quotient,
    since neither end has a nonzero map to a negative bundle.
    A nonnegative bundle of rank three and degree one is either $V_3$ or has a quotient $cal(O)$.
    Such a quotient restricts nontrivially to $cal(O)^r$, because $"Hom" \( V_m \, cal(O) \) = 0$.
    The resulting nonzero linear functional on $bb(Q)_p^r$ kills the extension class.
    Conversely, if a nonzero functional kills that class, its pushout extension splits and gives a quotient
    $cal(O)$. This proves the equivalence. Fiberwise surjectivity of a morphism of vector bundles is a relative
    subbundle condition, and 11 supplies local standard forms and the relative extension sheaf,
    so the argument gives the asserted relative loci. ◻
]

=== 4.3 Integral frames and determinant normalization <integral-frames-and-determinant-normalization>

The extension locus is now identified as a rational bundle problem.
  The next step retains the integral Tate basis and connected marking,
  because their determinant lattices determine the group actions in the coefficient calculation.

A $P_s$-structured form of $V_s$ is a form whose $D_s^times$-torsor of frames has been reduced to $P_s$. Since

$ P_s = "Nrd"^(- 1) \( bb(Z)_p^times \) \, $

this is determinant-lattice data. It is not an integral lattice in a rank-$s$ slope-zero local system.
  We choose determinant identifications between the $V_s$ over $k$. They exist there:
  the determinant of the cyclic Honda isocrystal differs from the degree-one rank-one isocrystal by its cyclic
  permutation sign $\( - 1 \)^(s - 1)$. For even $s$, choose $a in bb(F)_(p^2)^times$ with $a^p = - a$;
  its Teichmüller lift changes the Frobenius multiplier by $- 1$. Thus $bb(F)_(p^2) subset k$ removes the sign.
  We specify a common valuation normalization in the following proof.

For the height-two statement below, let $"Surj" \( V_3 \, V_2 \)$ be the relative sheaf of bundle maps $V_3
  arrow.r V_2$ that are surjective on every geometric fiber.
  Write $N_2^(*) = N_2 \\ { 0 }$ for the locus of extension classes that are nonzero on every geometric fiber.
  The zero class represents the split extension, so this is exactly the locus where the extension of $V_2$ by
  $cal(O)$ is nonsplit on every geometric fiber.

#thm([Proposition 4.6.])[
  (Integral frame comparison).  #emph[Put $cal(Y)_m = \[ cal(X)_m \/ P_3 \]$.
    There is an equivalence of v-stacks over $k$
#[#set math.equation(numbering: n => "(4.4)")
 $ cal(Y)_m tilde.eq \[ cal(E)_m \/ \( "GL"_r \( bb(Z)_p \) times P_m \) \] . $ <h3:geom:frame-stack>]

 It carries an actual universal sequence
#[#set math.equation(numbering: n => "(4.5)")
 $ 0 arrow.r cal(L)_r ⊗_(bb(Z)_p) cal(O) arrow.r cal(V)_3 arrow.r cal(V)_m arrow.r 0 \, $ <h3:geom:universal-sequence>]

 where $cal(L)_r$ is the integral étale Tate local system and $cal(V)_s$ are $P_s$-structured forms.
   The two presentations give the classifying maps to $B P_3$, $B "GL"_r \( bb(Z)_p \)$ and $B P_m$,
   and their determinant characters satisfy
#[#set math.equation(numbering: n => "(4.6)")
 $ "Nrd"_3 = det_("GL"_r) thin "Nrd"_m . $ <h3:geom:determinant-product>]

 With the convention $\( A \, b \) e = A_(*) \( \( b^(- 1) \)^(*) e \)$ for extension classes,
   the kernel scalar $u$ acts on $N_m^r$ by $u$ and the quotient scalar $u$ by $u^(- 1)$.]
  #emph[For $m = 2$, let $tilde(cal(X))_2$ be the full connected-marking tower.
    It admits a normalized integral étale generator, fixed by $H = ker \( "Nrd" : P_3 arrow.r bb(Z)_p^times \)$.
    There are compatible equivalences
#[#set math.equation(numbering: n => "(4.7)")
 $ tilde(cal(X))_2 tilde.eq "Surj" \( V_3 \, V_2 \) \, wide \[ tilde(cal(X))_2 \/ H \] tilde.eq N_2^(*) .
   $ <h3:geom:normalized-tower>]

 The full residual norm quotient acts in the second equivalence by scalar units,
   in the kernel convention just specified. No section of $P_3 arrow.r bb(Z)_p^times$ is involved.]
] <h3:prop:integral-frames>

#proof[
  Put $R_m = A_m \[ u_m^(- 1) \]$. Apply #cite(label("LurieFormalGroups2010")) Theorem 1 and its proof,
    pp. 1–4 to the formal completion $hat(cal(G))_(R_m)$ of $cal(G)$ over $R_m$ and to $Gamma_m$,
    both of exact height $m$. That theorem defines the isomorphism ring using every coefficient of the full identity
  $ F_(Gamma_m) \( f \( X \) \, f \( Y \) \) = f \( F_(cal(G)) \( X \, Y \) \) $
  and expresses it as a filtered union of injective finite étale $R_m$-algebras.
    Pullback to $cal(X)_m$ therefore gives the pro-étale tower of genuine connected markings;
    any finite set of Taylor coefficients is defined at one finite stage.
    Composition makes it a torsor under the automorphism sheaf of $Gamma_m$.
    The Honda coefficient calculation in 11 makes the latter the constant profinite group $P_m =
    "Aut"_k \( Gamma_m \)$: its finite étale coefficient stages have all geometric coefficients in $bb(F)_(p^m)
    subset k$.
  For the needed bound, pull a genuine marking $f \( T \) = sum_(n gt.eq 1) a_n T^n :
    hat(cal(G))_R arrow.r^tilde.op Gamma_(m \, R)$ to a characteristic-$p$ affinoid perfectoid test algebra $R$ on
    this tower, with its power-multiplicative spectral norm. Put $q = p^m$.
    The factorization of the $p$-series used in 8 reads
  $ \[ p \]_(cal(G)) \( T \) = P \( T^q \) \, wide P \( S \) = u_m S + sum_(j gt.eq 2) c_j S^j \, $
  where $u_m in R^times ∩ R^(compose compose)$ and $c_j in R^compose$;
    these bounds come from the integral deformation coefficients.
    The necessary identity $f \( \[ p \]_(cal(G)) \( T \) \) = f \( T \)^q$ gives
  $ a_1^(q - 1) = u_m \, wide a_n^q - u_m^n a_n = sum_(1 lt.eq i < n) a_i \[ S^n \] P \( S \)^i quad \( n gt.eq 2 \) . $
  Here $\[ S^n \]$ denotes coefficient extraction. First $parallel a_1 parallel =
    parallel u_m parallel^(1 \/ \( q - 1 \)) < 1$. If the earlier coefficients have norm at most one and $A =
    parallel a_n parallel > 1$, the second equation gives $A^q lt.eq max { parallel u_m parallel^n A \, 1 } lt.eq
    A$, a contradiction. Thus every $a_n$ belongs to $R^compose$.
    The series $f \( z \)$ converges in $R^(compose compose)$,
    uniformly on each closed ball of radius less than one. The full formal-law identity then evaluates on small
    points and proves additivity; evaluation commutes with maps of perfectoid test algebras.
    Compose it with the zeroth projection in 9. The resulting additive sheaf map $H_3 arrow.r
    H_m$ is $bb(Q)_p$-linear: it commutes with integral formal-group multiplications and with inverse
    multiplication by $p$. It kills the $bb(Q)_p$-span of the Tate basis:
    it kills all $p$-power torsion because $\[ p \]$ is injective on $H_m$.
    By Lemma 4.5, Lemma 4.4, it therefore factors through the section sheaf of the quotient bundle.
    By the relative full faithfulness in 11, this is the section map of a unique relative bundle morphism from the
    quotient to $V_m$. On every geometric fiber the section map is nonzero:
    restrict near the origin, where the formal isomorphism has nonzero linear coefficient.
    After identifying that fiber of the quotient with $V_m$, the bundle map is a nonzero element of the division
    algebra $D_m$, hence invertible. A bundle morphism invertible on every geometric fiber is an isomorphism.
    Uniqueness under relative full faithfulness makes these frames compatible with base change and with the group
    actions.
  Connected markings form a $P_m$-torsor, and the constructed frames change by that same maximal compact subgroup.
    The relative frame theorem shows that their only possible discrepancy with the determinant-lattice reduction
    of the quotient is its integer valuation. This integer is locally constant on the Tate-basis space and
    invariant under $P_3$, $P_m$ and $"GL"_r \( bb(Z)_p \)$: all their determinant changes are units.
    For $m = 2$, that space is $H_3 \\ { 0 }$ by 10. It is geometrically connected:
    after extending the base field it is exhausted by intersecting connected closed annuli,
    and perfection preserves their underlying topology. The integer is therefore constant,
    and we choose the fixed determinant identification to absorb it.
    For $m = 1$, let the locally constant valuation discrepancy be $nu_(upright("val"))$.
    Multiplication of the quotient frame by $p^(- nu_(upright("val")))$ corrects it.
    Since $D_1^times = bb(Q)_p^times$ is central and $nu_(upright("val"))$ is invariant under all three actions,
    this correction is equivariant and glues without any connectedness assumption.
    These choices give the common determinant-lattice normalization.
  Now mark both the connected group and the integral Tate basis. By 10 this tower is the sheaf of exact sequences
  $ 0 arrow.r cal(O)^r arrow.r V_3 arrow.r V_m arrow.r 0 $
  whose induced determinant identification is a unit multiple of the chosen one.
    The left frame changes are exactly $"GL"_r \( bb(Z)_p \) times P_m$.
    Forgetting the middle frame instead gives $cal(E)_m$, and its middle frames preserving that determinant
    lattice form exactly a $P_3$-torsor. This pair of torsor presentations proves (4.4).
    Descent of the displayed sequence proves (4.5); taking its determinants proves (4.6).
    Pushout at the kernel and pullback at the quotient give the stated action on extension classes.
    This construction uses actual frames throughout, so the maps to the classifying stacks are part of the equivalence.
  For $r = 1$, the fixed determinant identification and quotient frame identify the kernel line with $cal(O)$.
    On the integral Tate-basis torsor its determinant multiplier is a unit.
    Dividing the generator by that multiplier gives the unique generator with multiplier one.
    Uniqueness glues this normalization and shows that $g in P_3$ changes it by $"Nrd" \( g \)$,
    with the inverse if all frame conventions are reversed. It is therefore fixed by $H$.
    Forgetting this now determined generator identifies the connected marking tower with all surjections $V_3
    arrow.r V_2$. Indeed, a surjection $q$ determines its unique kernel generator $i_q$ of determinant multiplier
    one. Coordinate comparison on the entire nonzero Honda ball reconstructs a deformation and a primitive
    integral Tate generator from $i_q$, at every valuation. Scaling $i_q$ by a power of $p$ can change that
    deformation; the comparison always returns a basis for the reconstructed one.
    Choose a connected marking locally and let $q_h$ be its quotient frame.
    The constant discrepancy already normalized above ensures that the determinant multiplier of
    $\( i_q \, q_h \)$ is a unit. Write $q = d q_h$ with $d in D_2^times$.
    Since $\( i_q \, q \)$ has multiplier one, $v_p \( "Nrd" d \) = 0$, so $d in P_2$.
    Thus the required change of marking is an integral Honda automorphism and yields a unique connected formal
    isomorphism. Allowing the middle bundle to vary while keeping its determinant frame gives precisely the
    nonsplit extensions of $V_2$ by $cal(O)$, namely $N_2^(*)$.
    Changing the middle determinant scales the kernel generator by its full reduced norm.
    This norm maps $P_3$ onto $bb(Z)_p^times$, as is seen on the units of the unramified cubic subfield of $D_3$.
    This proves (4.7), with the full norm quotient action. ◻
]

=== 4.4 Algebraic markings and infinitesimal splitting torsors <algebraic-markings-and-infinitesimal-splitting-torsors>

The stack comparison supplies normalized markings after completed perfection.
  Ordinary cooperations require those markings at finite algebraic stages.
  We first prove a uniform descent statement that also allows the number of field factors to grow,
  and then identify the resulting finite flat root torsors.

Set $K = k \( \( y \) \)$. Let $L$ be the algebraic union of finite connected-marking algebras over $K$, and write

$ L^(upright(c)) = hat(L^(upright("perf"))) . $

Finite products of complete fields are allowed in this notation;
  all assertions below are compatible with their idempotents.
  The commuting actions of $P_3$ and $P_2$ are the actions on the deformation and on its connected marking respectively.

#thm([Lemma 4.7.])[
  #emph[Let $L = "colim"_i B_i$ be an injective union of finite étale $K$-algebras,
    with their maximum valuation norms, and put $C = hat(L^(upright("perf")))$.
    For every finite étale $L$-algebra $E$, the map
$ "Hom"_(L upright("-alg")) \( E \, L \) arrow.r "Hom"_(L upright("-alg")) \( E \, C \) $

 is bijective. Each section on the right is defined at one finite separable stage $B_j$,
   even if the numbers of field factors in the $B_i$ are unbounded.]
] <h3:geom:uniform-etale-descent>

#proof[
  Every $B_i$ and every $B_i^(1 \/ p^n)$ is a finite product of complete valued fields.
    First let $e in C$ be an idempotent. Choose $a in B_i^(1 \/ p^n)$ with $parallel a - e parallel < 1$.
    Then $parallel a parallel lt.eq 1$ and $parallel a^2 - a parallel < 1$, and $2 a -
    1$ is a unit whose inverse has norm at most one. Hensel’s lemma in this one complete finite product gives an
    idempotent $e_i$ with $parallel e_i - a parallel < 1$. Two idempotents at distance less than one are equal:
    each of $e \( 1 - e_i \)$ and $e_i \( 1 - e \)$ is an idempotent of norm less than one and hence vanishes.
    Thus $e = e_i$. Purely inseparable extensions create no idempotents, so $e_i in B_i$.
    Any finite list of idempotents descends to a common stage.
  The algebra $E$ descends to a finite étale algebra at some $B_i$.
    After a finite idempotent partition it admits a monogenic étale presentation:
    each component field of $B_i$ is infinite, so a primitive element may be chosen for its finite product of
    separable extensions. The preceding paragraph descends the idempotents chosen by a section to $C$.
    It remains to descend its finitely many roots.
  Suppose $f \( z \) = 0$ and $f' \( z \)$ is invertible in $C$, with $f in B_i \[ T \]$.
    Approximate both $z$ and $f' \( z \)^(- 1)$ simultaneously by $a \, c in B_j^(1 \/ p^n)$, for one $j gt.eq
    i$ and one $n$. We may require $parallel 1 - c f' \( a \) parallel < 1$.
    The geometric series in this complete finite product makes $f' \( a \)$ invertible with inverse norm at most
    $parallel c parallel$. Put $C_0 = max \( 1 \, parallel c parallel \)$, and let $M gt.eq
    1$ bound the quadratic Taylor remainder of $f$ on the unit ball about $a$.
    By making the approximations closer, require $parallel f \( a \) parallel C_0^2 M < 1$ and $parallel f \( a \)
    parallel C_0 < min \( 1 \, \( C_0 M \)^(- 1) \)$. Newton iteration stays in $B_j^(1 \/ p^n)$,
    its inverse derivatives stay bounded by $C_0$, and its residual norms are bounded successively by $M C_0^2
    parallel f \( a \) parallel^2$ and their iterates. It converges there to a root $b$ with $parallel b -
    a parallel lt.eq C_0 parallel f \( a \) parallel$. Taking the original approximation inside the same
    simple-root ball makes $b = z$: the divided difference $\( f \( b \) - f \( z \) \) \/ \( b - z \)$ is a unit
    throughout that ball. The element $b$ is separable over each component of $B_j$ and lies in its purely
    inseparable extension, so $b in B_j$. The finitely many roots use a common $j$.
    Injectivity follows from $L arrow.r.hook C$, proving the assertion. ◻
]

#thm([Lemma 4.8.])[
  (Descent of the normalized marking).  #emph[The normalized étale generator of 13 descends to a compatible
    integral marking over $L$. It is $H$-invariant, and the full $P_3$ action changes it by the constant unit
    $"Nrd" \( g \)$, up to the common inverse convention. At level $l$,
    the torsor of its lifts to $cal(G) \[ p^l \]$ has coordinate algebra
#[#set math.equation(numbering: n => "(4.8)")
 $ L^(1 \/ p^(2 l)) . $ <h3:geom:height-two-roots>]

 The connected marking makes this a torsor for $Gamma_2 \[ p^l \]_L$.
   The group $H$ acts trivially on the translation group, while $P_2$ acts by constant Honda automorphisms.]
  #emph[For a finite connected-marking level $B = L^Pi$, with $Pi subset P_2$ open, put $B^(upright(b)) =
    hat(B^(upright("perf")))$; the superscript here denotes completed perfection, not tilting.
    There is a pro-étale $Pi$-torsor
#[#set math.equation(numbering: n => "(4.9)")
 $ "Spa" \( L^(upright(c)) \) arrow.r "Spa" \( B^(upright(b)) \) \, $ <h3:geom:completed-level-torsor>]

 and consequently
#[#set math.equation(numbering: n => "(4.10)")
 $ \[ "Spa" \( B^(upright(b)) \) \/ H \] tilde.eq \[ N_2^(*) \/ Pi \] . $ <h3:geom:finite-level-stack>]

 These equivalences are natural under level changes and after extension to an algebraically closed perfectoid base.]
] <h3:lem:marking-descent>

#proof[
  For each $l$ the normalized generator is a point of
  $ "Isom"_L \( \( bb(Z) \/ p^l \)_L \, cal(G)^(upright("et")) \[ p^l \]_L \) . $
  By 14, it descends to $L$ at one finite separable stage. Compatibility and equivariance descend through the
    injective coefficient extension, so the descended points give the asserted integral marking.
    This argument descends a finite étale marking, not a splitting of the connected–étale extension.
  The fiber over this marked generator in $cal(G) \[ p^l \]$ is a torsor for its connected kernel.
    Over the étale generator cover, 8 identifies its two fields as
  $ k \( \( t_l^(p^(2 l)) \) \) subset k \( \( t_l \) \) . $
  They have purely inseparable degree $p^(2 l)$. The marked generator supplies a map from the separable field on
    the left to $L$. Root extensions commute with separable scalar extension,
    so the torsor algebra after this base change is exactly (4.8); no degree is lost.
    The connected marking identifies its group with $Gamma_2 \[ p^l \]$.
    The equivariance already proved fixes both markings under $H$ and changes them by constant automorphisms under
    $P_2$, giving the stated actions on translations.
  To prove the torsor assertion, choose a cofinal system of normal open subgroups $Pi' subset Pi$.
    The algebra $B_(Pi') = L^(Pi')$ is a finite étale $Pi \/ Pi'$-torsor over $B = L^Pi$.
    Perfection commutes with finite étale base change, and completion commutes with finite modules. Consequently
  $ A_(Pi') := B_(Pi') ⊗_B B^(upright(b)) tilde.eq hat(B_(Pi')^(upright("perf"))) $
  is again a finite étale $Pi \/ Pi'$-torsor. Their transition maps are surjective.
    The affinoid perfectoid inverse limit is $"Spa" \( L^(upright(c)) \)$:
    its algebra is the uniform completed union of the $A_(Pi')$, equal to $hat(L^(upright("perf")))$.
    Passing the finite torsor identities to inverse limits gives
  $ "Spa" \( L^(upright(c)) \) times_("Spa" \( B^(upright(b)) \)) "Spa" \( L^(upright(c)) \) tilde.eq
    underline(Pi) times "Spa" \( L^(upright(c)) \) . $
  Each geometric fiber is a nonempty inverse limit of finite nonempty sets with surjective transition maps.
    Thus the map is surjective and is the pro-étale $Pi$-torsor in (4.9).
    These arguments permit arbitrarily many factors at later finite stages.
    Finally $H$ and $Pi$ commute, so quotienting this torsor and applying (4.7) gives (4.10).
    No cohomological Galois-descent assertion is used in this deduction. ◻
]

We fix the periodicity convention needed for the coefficient arguments.
  The invariant cotangent line is $omega = pi_2 E_3$; if $\| u \| = - 2$, its generator is $U = u^(- 1)$.
  In particular $v_1 = x U^(p - 1)$ modulo $p$.

#thm([Lemma 4.9.])[
  (Invariant differential).  #emph[There is an equivariant isomorphism
#[#set math.equation(numbering: n => "(4.11)")
 $ and.big^2 Omega_(A \/ k \, upright("cts"))^1 tilde.eq omega^3 \[ det \] \, wide
   Omega_(K \/ k)^1 tilde.eq omega_K^(p + 2) \[ det \] . $ <h3:geom:canonical-lines>]

 Here $det$ is the reduced norm character of $P_3$. The connected marking over $L$ supplies a generator $U_0$ of
   $omega_L$ fixed by $P_3$. Consequently (4.11) gives a nonzero differential $eta in
   Omega_(L \/ k)^1$ fixed by $H$, defined at a finite separable marking level.
   Changes of the connected marking act on these frames by their constant cotangent characters.]
] <h3:lem:invariant-differential>

#proof[
  The integral canonical-line theorem gives the first isomorphism #cite(label("GHdual")) Theorem 20.
    In that theorem $omega = E_2$, and the determinant is the reduced norm,
    so its line and action conventions are the ones just fixed.
    If $g \( U \) = q_g U$, comparison of the first nonzero graded $p$-series coefficient gives $g \( x \) =
    q_g^(- \( p - 1 \)) x$ modulo $p$. Equivalently the graded coefficient $v_1 = x U^(p - 1)$ is invariant there.
    Hence $\( x \) \/ \( x^2 \) tilde.eq omega^(- \( p - 1 \))$ on the height-two slice.
    Taking determinants in its conormal sequence yields
  $ Omega_(k \[ \[ y \] \] \/ k \, upright("cts"))^1 tilde.eq omega^(3 + \( p - 1 \)) \[ det \] =
    omega^(p + 2) \[ det \] . $
  Localizing at $y$ proves the second isomorphism.
  There is no change of differential theory at the generic point.
    Every power series in one variable over a perfect field can be grouped uniquely by its exponent modulo $p$;
    thus $y$ is a $p$-basis of $K$ and $Omega_(K \/ k)^1 = K thin d y$.
    Separable extension gives $Omega_(L \/ k)^1 = L ⊗_K Omega_(K \/ k)^1$.
    Transport a nonzero invariant differential on $Gamma_2$ along the tautological connected marking.
    This gives $U_0$. The $P_3$ action transports the marking, so it fixes this frame.
    The image of $U_0^(p + 2) ⊗ 1_det$ under (4.11) is $eta$.
    Its remaining character is the reduced norm, trivial on $H$.
    Its coefficient and that of $U_0$ occur at a finite separable stage,
    since each belongs to the algebraic union $L$. The action of $P_2$ is the constant change of Honda marking,
    and differentiation gives the asserted constant characters. ◻
]

#thm([Lemma 4.10.])[
  (The ordinary splitting torsor).  #emph[Let $B_0 = A \[ x^(- 1) \]$.
    The ordinary connected–étale sequence of $cal(G)$ over $B_0$ is
$ 0 arrow.r cal(C) arrow.r cal(G) arrow.r cal(E) arrow.r 0 \, $

 where $cal(C)$ has height one and is of multiplicative type, and $cal(E)$ is étale of height two.
   For every $l gt.eq 1$, the scheme of splittings of its $p^l$-torsion sequence is canonically
#[#set math.equation(numbering: n => "(4.12)")
 $ "Spec" B_0^(1 \/ p^l) arrow.r "Spec" B_0 . $ <h3:geom:ordinary-root-torsor>]

 It is a finite flat torsor for
$ "Hom" \( cal(E) \[ p^l \] \, cal(C) \[ p^l \] \) \, $

 a form of $mu_(p^l)^2$. These identifications commute with the $P_3$ action, with truncation in $l$,
   and with Frobenius. They therefore define a natural tower of multiplicative-type torsors over the uncompleted
   ring $B_0$.]
] <h3:lem:ordinary-torsor>

#proof[
  On the ordinary locus the relative Frobenius kernels define the connected height-one subgroup;
    dividing by them gives the finite étale quotients. These compatible finite groups give $cal(C)$ and $cal(E)$.
    A height-one one-dimensional connected $p$-divisible group becomes $mu_(p^oo)$ on its connected-marking cover;
    at each finite level the required cover is étale. Thus $cal(C) \[ p^l \]$ is of multiplicative type.
  The $p^l$-torsion sequence is fpqc exact. Locally choose a basis of $cal(E) \[ p^l \]$ and lift its two
    generators to $cal(G) \[ p^l \]$. Every lift is killed by $p^l$,
    so the two lifts define a homomorphism and a splitting. Two splittings differ by a unique homomorphism to
    $cal(C) \[ p^l \]$. Consequently the splitting scheme is a finite flat torsor for the displayed group,
    of rank $p^(2 l)$.
  The étale basis cover is $B' = C_l \[ x^(- 1) \]$, with $m = 1$ in 8.
    On this cover, the splitting scheme is the scheme of generator lifts, whose algebra is
  $ B_l \[ x^(- 1) \] =
    k \[ \[ t_(1 \, l) \, t_(2 \, l) \] \] \[ x^(- 1) \] = \( C_l \[ x^(- 1) \] \)^(1 \/ p^l) = \( B' \)^(1 \/ p^l) . $
  Relative Frobenius on an étale algebra is an isomorphism. Therefore
  $ \( B' \)^(1 \/ p^l) tilde.eq B' ⊗_(B_0) B_0^(1 \/ p^l) . $
  These local identifications descend canonically. More explicitly,
    in the splitting algebra the $p^l$th power of every element lies in the base algebra,
    as can be checked after the faithfully flat cover $B'$. Send that element to the unique $p^l$th root of its
    power in $B_0^(1 \/ p^l)$. The resulting algebra map is an isomorphism after the cover, hence an isomorphism.
    This description shows both its uniqueness and its independence of all basis and connected-marking choices.
  The splitting construction is functorial for changes of deformation framing.
    Its canonical root identification is therefore $P_3$-equivariant.
    Restricting a splitting at level $l + 1$ to level $l$ is the quotient by the kernel of the corresponding
    homomorphism of the translation groups. Under the unique root identifications it is the inclusion
    $B_0^(1 \/ p^l) subset B_0^(1 \/ p^(l + 1))$. Frobenius compatibility follows from the same uniqueness and the
    natural relative Frobenius maps of the finite groups. Thus all the stated compatibilities hold over $B_0$
    itself, rather than only on an auxiliary étale extension. ◻
]

== 5 Cohomology of the completed strata <h3:sec:analytic>

We compute the two completed strata together with their maps from constants.
  These maps retain the class from the rank-two Tate frame through the changes of coefficients later in the proof.
  The Kummer and translation calculations of Barthel–Mann–Ray–Schlank–Senger–Weinstein–Zhou #cite(label("BMR"))
  Sections 3.3–3.6 provide the methodological setting. We prove the relative estimates, support maps,
  and limit arguments needed to retain the particular constants maps in this setting.

We use the relative extension sheaf $N_m$ and integral-frame stacks of 4. In this section we abbreviate

$ E_m = cal(E)_m = \( N_m^(thin 3 - m) \)_(upright("ind")) \, wide Y_m =
  cal(Y)_m tilde.eq \[ E_m \/ \( "GL"_(3 - m) \( bb(Z)_p \) times P_m \) \] . $

Here $N_m$ is the sheafified relative $H^1$ of $V_m^or$ defined before 12, and the stack equivalence is 13.
  Independence is over $bb(Q)_p$. In particular $E_2 = N_2^(*)$,
  whereas $E_1$ is the space of independent pairs in $N_1$.
  All coefficient maps below are maps on these stacks or on their marking torsors.
  They therefore commute with the actions and the changes of marking in 13.

=== 5.1 Relative coefficients and the affine calculation <relative-coefficients-and-the-affine-calculation>

Fix an algebraically closed perfectoid untilt $C$ of $C^flat$ and an embedding $k subset C^flat$.
  If $S = "Spa" \( R \, R^(+) \)$ is an affinoid perfectoid space over $C^flat$,
  a relative affine space means the diamond of the affine space over its induced untilt.
  Its characteristic-$p$ structure sheaf is denoted by $cal(O)^flat$.
  The notation $R \( - 1 \)$ retains the Kummer orientation line;
  choosing compatible roots of unity in $C$ identifies it with $R$.
  This choice does not make the arithmetic action on this line trivial.

For the ordinary stratum over this relative base, we will prove that the structure map $Y_1 arrow.r
  B \( "GL"_2 \( bb(Z)_p \) times P_1 \)$ induces an equivalence

$ R Gamma_(upright("cts")) \( "GL"_2 \( bb(Z)_p \) times P_1 \, R \) arrow.r R Gamma \( Y_1 \, cal(O)^flat \) . $

For coheight one, we first compute $N_2^(*)$: its cohomology consists of constants $R$ in degree zero and a free
  $R$-line in degree three, whose scalar action must be retained.
  We will obtain both descriptions by computing support cohomology in affine spaces and then taking translation
  and frame-group cohomology. Descent to $k$ will turn these relative calculations into the completed coefficient
  comparisons, including the finite connected-marking stages needed for coheight one.

Our relative assertions also include a profinite parameter space $T$.
  On coefficients this replaces $R$ by $C_(upright("cts")) \( T \, R \)$.
  Products have their product topology, and countable inverse limits are derived until their higher derived limits
  have been shown to vanish. These conventions are particularly relevant for the distribution modules introduced
  below. Finiteness means finite-dimensional cohomology over $C^flat$ at the geometric base $R =
  C^flat$ and $T = *$; after descent, the field is $k$. For an arbitrary relative base $R$,
  the corresponding answer is obtained by scalar extension from $C^flat$.
  The corresponding parameter assertion for a computing complex $K^bullet$ is the natural identification

$ H^a \( C_(upright("cts")) \( T \, K^bullet \) \) = C_(upright("cts")) \( T \, H^a \( K^bullet \) \) . $

Thus, after descent to $k$, a finite-dimensional answer gives a finite free module over
  $C_(upright("cts")) \( T \, k \)$. It need not be finite-dimensional over $k$ when $T$ is infinite.
  The proofs below establish this identity for the actual computing complexes.

#thm([Lemma 5.1.])[
  (The relative additive presentation).  #emph[Let $F \/ bb(Q)_p$ be the unramified extension of degree $m$,
    embedded in $C$. There is an identification over $C^flat$
$ N_m tilde.eq bb(G)_(a \, C)^diamond.stroked.small \/ underline(F) . $

 It is compatible with base change in $S$ and with scalar multiplication by $bb(Q)_p^times$. In particular
$ N_m^(*) tilde.eq \[ \( bb(A)_C^1 \\ underline(F) \)^diamond.stroked.small \/ underline(F) \] . $

]
] <h3:ana:relative-bc>

#proof[
  On the Fargues–Fontaine curve with coefficient field $F$, the divisor of the chosen untilt gives
  $ 0 arrow.r cal(O)_F \( - 1 \) arrow.r cal(O)_F arrow.r i_(*) cal(O)_(S^sharp) arrow.r 0 . $
  The relative section sheaf of $cal(O)_F$ is $underline(F)$, its relative first cohomology vanishes,
    and $cal(O)_F \( - 1 \)$ has no relative sections. These are the slope-zero and negative-slope cases of the
    relative bundle calculation in 11 and #cite(label("FarguesFontaine")) #cite(label("KedlayaLiu")).
    Pushforward along the unramified coefficient extension identifies $cal(O)_F \( - 1 \)$ with $V_m^or$:
    its isocrystal has rank $m$, degree $- 1$, and the cyclic Frobenius of slope $- 1 \/ m$.
    The cohomology sequence is consequently the displayed quotient.
    All its arrows are relative arrows of sheaves, so the presentation holds over $S$,
    not only over geometric fields. The inverse image of the zero section is precisely $underline(F)$. ◻
]

Here is the estimate used in the nonproper calculation. It is useful to give it explicitly,
  since affinoid perfectoid acyclicity alone does not compute the cohomology of an untilted affine line.

#thm([Lemma 5.2.])[
  (Restriction on Kummer annuli).  #emph[Fix a topological generator of $bb(Z)_p \( 1 \)$,
    let $epsilon.alt in C^flat$ be its compatible system of roots, and put $theta = \| epsilon.alt - 1 \| < 1$.
    Consider an untilted closed annulus $A \[ r \, b \] = { r lt.eq \| z \| lt.eq
    b }$ and a smaller annulus $A \[ r' \, b' \]$ satisfying
$ r' gt.eq r \/ theta \, wide b' lt.eq theta b . $

 In the Kummer cochain models, restriction is homotopic to its constant-monomial part.
   That part is $R xor R \( - 1 \) \[ - 1 \]$. The homotopy on the nonconstant part is bounded by one in these two
   Gauss norms. The assertion holds uniformly after $R$ is replaced by $C_(upright("cts")) \( T \, R \)$.]
] <h3:ana:annulus-contraction>

#proof[
  Adjoin all $p$-power roots of $z$. The resulting annulus is perfectoid,
    and its $bb(Z)_p \( 1 \)$-torsor computes the cohomology by
  $ \[ thin M arrow.r^(gamma - 1) M thin \] . $
  Here $M$ is the tilted Laurent algebra, completed for the two Gauss norms.
    Its elements have unique expansions $sum_(u in bb(Z) \[ 1 \/ p \]) a_u z^u$;
    the weighted coefficients form a $c_0$ family. In this statement $c_0$ concerns all the fractional exponents:
    for each positive bound only finitely many weighted coefficients exceed that bound.
    It is stronger than a condition only as $\| u \|$ tends to infinity.
  The differential on the $u$-th monomial is multiplication by $epsilon.alt^u - 1$.
    Write $u = v p^j$, where $v in bb(Z)$ is prime to $p$. For $u eq.not 0$, characteristic $p$ and $\| v \|_p = 1$ give
  $ \| epsilon.alt^u - 1 \| = theta^(p^j) \, wide p^j lt.eq \| u \|_(bb(R)) . $
  For $u > 0$, the outer-radius estimate is
  $ frac(\( b' \/ b \)^u, \| epsilon.alt^u - 1 \|) lt.eq theta^(u - p^j) lt.eq 1 . $
  For $u < 0$, the inner-radius estimate is
  $ frac(\( r' \/ r \)^u, \| epsilon.alt^u - 1 \|) lt.eq theta^(\| u \| - p^j) lt.eq 1 . $
  Thus division by $epsilon.alt^u - 1$ after restriction defines a continuous contracting homotopy on all nonzero
    monomials. The $c_0$ condition is preserved by these inequalities.
    The zero monomial has zero differential, giving the two stated terms;
    the second is $"Hom" \( bb(Z)_p \( 1 \) \, R \)$ and hence $R \( - 1 \)$.
  The two-term model follows by applying continuous Hom to
  $ 0 arrow.r bb(F)_p \[ \[ bb(Z)_p \] \] arrow.r^(gamma - 1) bb(F)_p \[ \[ bb(Z)_p \] \] arrow.r bb(F)_p arrow.r 0 . $
  Its comparison with the completed bar resolution is continuous.
    Affinoid perfectoid acyclicity #cite(label("ScholzeDiamonds")) Proposition 8.8 then identifies it with the
    cohomology of the annulus. The displayed coefficientwise inequalities are unchanged for the supremum norm on
    $C_(upright("cts")) \( T \, R \)$, proving the parameter assertion. ◻
]

#thm([Lemma 5.3.])[
  (The analytic inverse limits).  #emph[Let $M_0 arrow.l M_1 arrow.l
    dots.h.c$ be a tower of complete nonarchimedean Banach spaces with dense transition maps of norm at most one.
    Its derived inverse limit has no higher cohomology. The assertion remains true after applying
    $C_(upright("cts")) \( T \, - \)$. In particular it applies to the tilted Laurent algebras on an exhaustion by
    closed smaller annuli or polyannuli.]
] <h3:ana:analytic-limits>

#proof[
  It suffices to show that the Roos difference map
  $ product_n M_n arrow.r product_n M_n \, wide \( x_n \) mapsto \( x_n - f_n x_(n + 1) \) $
  is surjective. Given $\( y_n \)$, construct a solution of the first $j$ equations at stage $j$.
    To add the next equation, choose $x_(j + 1)$ so that $f_j x_(j + 1)$ approximates $x_j -
    y_j$ to within $2^(- j)$. Set the new $x_j$ equal to $y_j +
    f_j x_(j + 1)$ and propagate this correction backwards through the earlier equations.
    The transition norm bound makes the change in each earlier coordinate at most $2^(- j)$.
    Every fixed coordinate therefore converges, and the resulting tuple solves all the equations. This proves the claim.
  Density persists for continuous functions on $T$: approximate on a finite clopen partition and lift
    approximations to the finitely many values. Completeness and the norm bound persist as well,
    so the proof applies unchanged. Fractional Laurent polynomials belong to every algebra in the specified
    exhaustion and are dense in each of them, verifying its hypotheses. ◻
]

#thm([Lemma 5.4.])[
  (Affine space and zero-section purity).  #emph[For every $d gt.eq 1$ and every $S \, T$ as above,
    the natural maps give
$ R Gamma \( bb(A)_S^d \, cal(O)^flat \) = R \, wide R Gamma_0 \( bb(A)_S^d \, cal(O)^flat \) =
  R \( - d \) \[ - 2 d \] . $

 The first identification is the map of constants. The second is the product of the normal Kummer classes.
   It is natural under translation of the section and invertible linear changes of the normal coordinates.
   The equalities are relative equalities, including the continuous parameters $T$.]
] <h3:ana:affine-purity>

#proof[
  We first treat a line. An untilted disc is covered by the perfectoid disc obtained by adjoining all roots of its
    coordinate. A section of $cal(O)^flat$ on the original disc pulls back to an invariant section on this cover.
    The monomial computation in 19, now with nonnegative exponents, shows that every such section is constant.
    Consequently the degree-zero cohomology of a relative disc is $R$.
  Restrictions from sufficiently large discs to a fixed smaller disc kill positive cohomology.
    To see this without making an assertion about the branched cover at the center,
    choose a point $a$ outside the smaller disc and inside the larger one.
    The inclusion of the smaller disc factors through two nested annuli centered at $a$,
    with the radius gaps of 19. The larger disc can be chosen to contain these annuli.
    Restriction between them kills the nonconstant part and all degrees above one.
    The remaining degree-one class is the mod-$p$ Kummer class of $z - a$.
    On a sufficiently small disc about zero it vanishes: if $\| z \/ a \| < \| p \|^(p \/ \( p - 1 \))$,
    the binomial series for $\( 1 - z \/ a \)^(1 \/ p)$ converges, and a $p$-th root of $-
    a$ supplies a first $p$-th root of $z - a$. All choices can be made using constants from $C$,
    with bounds independent of $S$ and $T$.
  Exhaust the line by such discs. For each positive degree the inverse system of cohomology groups is pro-zero,
    and degree zero is the constant system $R$. The countable derived-limit sequence therefore proves the first
    assertion for a line. In particular, no assertion that density alone kills a derived limit is used.
  Exhaust the punctured line by annuli whose inner radii tend to zero and outer radii tend to infinity,
    taking a cofinal subsequence with the stated radius gaps.
    The homotopies of 19 show that its cohomology is $R xor R \( - 1 \) \[ - 1 \]$.
    The constants identify the first summand. The fiber of restriction from the line to the punctured line is
    therefore $R \( - 1 \) \[ - 2 \]$. Its generator is the boundary of the Kummer class.
    Multiplication of a coordinate by an invertible constant changes its Kummer class by the class of that
    constant, which vanishes locally after adjoining a root. Translation simply changes the chosen section.
    This proves the asserted naturality.
  For $d$ coordinates apply the relative line calculation one coordinate at a time.
    Successive cohomology with support in their zero loci gives the product of the $d$ Kummer boundary classes,
    in degree $2 d$ with twist $- d$. Invertible changes of coordinates preserve this local fundamental class:
    elementary additions are checked on the complement by the same nearby-coordinate Kummer calculation,
    diagonal changes were just checked, and coordinate permutations permute classes of even degree.
    These operations generate the invertible linear changes locally on the base.
    The constructions and the limiting arguments above are uniform on continuous profinite families,
    proving the relative statement. ◻
]

=== 5.2 Tubes, distributions, and translation orientation <tubes-distributions-and-translation-orientation>

The next support calculation replaces the single zero section by a locally profinite family of sections.
  We surround the family by disjoint tubes and refine those tubes to the support.
  The resulting support classes will be identified with compatible residue assignments:
  when tubes merge, their residues add. The distribution module below records this summation rule.
  For a compact totally disconnected space $K$ define

#[#set math.equation(numbering: n => $∗$)
 $ cal(D) \( K \, R \) = "proj lim"_(cal(P)) xor.big_(U in cal(P)) R \,
   wide \( a_V \)_(V in cal(Q)) mapsto (sum_(V subset U) a_V)_(U in cal(P)) \, $ <h3:ana:distribution-definition>]

where $cal(Q)$ refines the finite clopen partition $cal(P)$.
  For a locally compact totally disconnected space $Z = product.co_i K_i$,
  put $cal(D)_(upright("lf")) \( Z \, R \) = product_i cal(D) \( K_i \, R \)$.
  Equivalently this is the continuous dual, in this product sense,
  of compactly supported locally constant functions on $Z$.
  This description makes it independent of the decomposition.
  It imposes no common norm bound on the different components.
  The transition maps in $(∗)$ are split surjections, by choosing one child of each partition member.
  For a profinite $T$ there are natural identifications

#[#set math.equation(numbering: n => "(5.1)")
 $ C_(upright("cts")) \( T \, cal(D)_(upright("lf")) \( Z \, R \) \) =
   cal(D)_(upright("lf")) \( Z \, C_(upright("cts")) \( T \, R \) \) . $ <h3:ana:distribution-parameters>]

They follow directly by commuting continuous maps with products and inverse limits.

#thm([Lemma 5.5.])[
  (Support in a family of rational lattices).  #emph[The following supports in an untilted relative affine line
    have cohomology
$ R Gamma_Z \( bb(A)_S^1 \, cal(O)^flat \) tilde.eq cal(D)_(upright("lf")) \( Z \, R \) \( - 1 \) \[ - 2 \] : $

]
  + #emph[a constant finite extension $F subset C$ of $bb(Q)_p$;]
  + #emph[the image of $\( a \, b \) mapsto a z + b$, with $a \,
    b in bb(Q)_p$ and $z$ a section of the relative affine line whose value in each geometric untilt lies outside
    $bb(Q)_p$; one may also restrict $a$ to a compact open subset.]
  #emph[These are relative identifications, natural for the translations and linear changes preserving the
    indicated support. They retain all profinite parameters. Taking products of the first support in two separate
    coordinates gives
$ R Gamma_(F^2) \( bb(A)_S^2 \, cal(O)^flat \) tilde.eq cal(D)_(upright("lf")) \( F^2 \, R \) \( - 2 \) \[ - 4 \] . $

]
] <h3:ana:tube-purity>

#proof[
  We describe both the neighborhoods and the limit that computes their support cohomology.
    On a geometric fiber the map in (ii) is a continuous linear injection from the finite-dimensional
    $bb(Q)_p$-Banach space $bb(Q)_p^2$ into the geometric untilt.
    Its induced norm is equivalent to the maximum norm, and hence is bounded above and below on the unit sphere.
    The lower bound can be made uniform on a neighborhood of that fiber.
    Indeed the parameter unit sphere in $bb(Q)_p^2$ is compact; for each of its points the corresponding $a z +
    b$ is nonzero, and finitely many neighborhoods give a common positive lower bound.
    Shrink the base by their intersection. Homothety by powers of $p$ now gives constants $c_(-) \, c_(+) > 0$ such that
  $ c_(-) max \( \| a \| \, \| b \| \) lt.eq \| a z + b \| lt.eq c_(+) max \( \| a \| \, \| b \| \) $
  uniformly on that neighborhood. The same assertion for (i) is the norm comparison for the fixed embedding $F
    subset C$.
  Write $V$ for the parameter space and $d = dim_(bb(Q)_p) V$; thus $d = \[ F : bb(Q)_p \]$ in (i) and $d =
    2$ in (ii). For the compact open restriction on $a$, use $V =
    bb(Q)_p^2$ and start at a level at which the restricted strip is a union of lattice cosets;
    compact openness permits this. Choose a lattice adapted to the norm, as follows.
    At the chosen geometric point, the norm of the injection is locally constant and nowhere zero on the compact
    parameter unit sphere, so it takes only finitely many values there.
    Choose a radius in a gap and let $Lambda$ be its closed parameter ball. This is a $bb(Z)_p$-lattice.
    After a further rational restriction of the base there are constants $rho_(-) < rho < rho_(+)$ such that
  $ \| ell \( v \) \| lt.eq rho_(-) quad \( v in Lambda \) \, wide \| ell \( v \) \| gt.eq
    rho_(+) quad \( v in.not Lambda \) \, $
  where $ell$ denotes the indicated injection. Only finitely many inequalities are needed for this restriction:
    use a $bb(Z)_p$-basis of $Lambda$ for the upper bound and representatives $w_j$ of the nonzero cosets of
    $\( p^(- 1) Lambda \) \/ Lambda$ for the lower bound. Indeed, for $v in.not Lambda$,
    a nonnegative power of $p$ takes $v$ to $v' = w_j + lambda in p^(- 1) Lambda \\ Lambda$.
    The strict gap gives $\| ell \( v' \) \| = \| ell \( w_j \) \| gt.eq rho_(+)$,
    and scalar rescaling gives the desired bound for $v$. These are inequalities on the rational base neighborhood
    and hence hold on every perfectoid test over it.
  For every $n$ take discs of radius $\| p \|^n rho$ about the images of representatives modulo $p^n Lambda$.
    Distinct centers are separated by at least $\| p \|^n rho_(+)$,
    so the discs are disjoint and nested under refinement. Only finitely many meet any bounded relative affine
    disc: the lower norm bound restricts their parameters to a bounded, hence compact, subset of $V$,
    which has finitely many cosets modulo $p^n Lambda$. Thus the family is locally finite.
  We verify its limiting support on an arbitrary affinoid perfectoid test $S' arrow.r S$.
    Choose two buffered radii between $rho_(-)$ and $rho_(+)$.
    A section $w$ belonging to every smaller closed tube system belongs to every larger open tube system.
    The inverse images of the latter’s disjoint components are open and closed in $S'$.
    They define compatible locally constant maps $c_n : S' arrow.r V \/ p^n Lambda$.
    Quasicompactness gives finitely many values at each level.
    Since $V = "proj lim"_n V \/ p^n Lambda$ with its locally profinite topology,
    these maps give a continuous parameter $c : S' arrow.r V$. Choose representatives of the $c_n$.
    Their images under $ell$ converge uniformly, since the successive differences have norm at most $\| p \|^n
    rho_(-)$. The tube condition gives $parallel w - ell \( c_n \) parallel lt.eq \| p \|^n rho_(upright("outer"))
    arrow.r 0$; completeness therefore gives $w = ell \( c \)$.
    Conversely a continuous parameter $c$ belongs to all the smaller tube systems by the upper bound on $Lambda$.
    The buffered neighborhoods consequently have the required intersection as relative v-sheaves,
    including analytic boundary points. Their complements exhaust the desired complement,
    and support cohomology is their derived inverse limit.
  The exterior of a disc is exhausted by annuli. By 20 its cohomology is the two-term Kummer complex of Laurent
    series converging on that exterior. Its degree-zero invariants are $R$.
    Taking the fiber from the affine line consequently puts the tube support entirely in degree two.
    Constant-monomial extraction gives a split surjective residue map in that degree to $R \( - 1 \)$.
    Its kernel is the nonconstant cokernel of the difference operator.
  There is a canonical description of this residue: map to the direct limit of support cohomology over all larger
    enclosing discs. The annulus homotopy identifies that limit with $R \( - 1 \)$.
    Recentring gives the same identification, since sufficiently far out the ratio of the two coordinates has a
    first $p$-th root. Inclusions of discs therefore commute with residues to this common target.
    Excision identifies disjoint children with a direct sum, so the residue of their merger is literally the sum
    of their residues. Surjectivity is also witnessed by the class of any section inside the tube,
    which has residue one.
  The kernels of the residue maps form a pro-zero system with a fixed level gap.
    Choose $j$ such that $\| p \|^j < theta$, with $theta$ as in 19;
    increase $j$ if necessary for the two buffered radii. The ratio of a level-$\( n + j \)$ child’s radius to its
    level-$n$ parent’s radius is $\| p \|^j$, independently of $n$ and of the parent coset.
    Recenter the parent disc at this child’s center. Its exterior is unchanged because the center difference is
    strictly smaller than the parent’s radius. On restriction between these exteriors the inverse of the
    difference operator is bounded on negative monomials by the fixed radius gap.
    For positive monomials use a source outer radius at least the target outer radius divided by $theta$,
    which is always available on an exterior. Thus the entire child residue kernel maps to zero in the parent’s
    support cohomology.
  Each parent has exactly $p^(d j)$ children. Finite summation shows that the map from all level-$\( n + j \)$
    residue kernels to all level-$n$ kernels is zero. For infinitely many parents the homotopies operate
    coordinatewise in the product topology; they require no common bound on the coefficient values.
    For a profinite $T$ the same inequalities apply in each $C_(upright("cts")) \( T \, R \)$ supremum norm.
    Thus one level gap annihilates the kernels on every profinite test, and not merely on geometric fibers.
  This proves that the actual system of tube support cohomology is pro-isomorphic to the system of finite sums
    $R \( - 1 \)$ under summation. It does not require that the classes of different sections in a fixed tube be
    equal. Those classes can differ by a residue-zero class before passage to the limit.
    The residue system has split surjective transitions, while the discarded systems are pro-zero.
    Both their $"proj lim"^1$ terms consequently vanish. Locally finite disjoint components give products by
    excision. This proves the formula $(∗)$ with its product topology.
  All norm estimates and all residue maps were made over the base neighborhood.
    Applying them to $C_(upright("cts")) \( T \, R \)$ proves the parameter assertion,
    and descent glues the neighborhoods of the base. The product statement follows by performing the two relative
    support calculations successively; its partition system consists of rectangles and is cofinal in the finite
    clopen partitions of the product. ◻
]

#thm([Lemma 5.6.])[
  (Translation cohomology).  #emph[Let $F \/ bb(Q)_p$ have degree $m$, acting by translations. Then
$ R Gamma_(upright("cts")) \( F \, R \) = R \, wide
  R Gamma_(upright("cts")) \( F \, cal(D)_(upright("lf")) \( F \, R \) \) = R ⊗_(bb(F)_p) "or"_F \[ - m \] . $

 Here $"or"_F$ is the inverse orientation of the $m$-dimensional translation group.
   With the convention that $a$ acts on points by $z mapsto a z$,
   a scalar $a in bb(Z)_p^times$ acts on this line by $macron(a)^(- m)$.
   The assertions and their support maps hold with continuous profinite parameters.]
] <h3:ana:translations>

#proof[
  Choose a lattice $K tilde.eq bb(Z)_p^m$ in $F$. On its distributions the finite Koszul complex is the Koszul
    cochain complex for
  $ R \[ \[ X_1 \, dots.h \, X_m \] \] \, wide X_i = gamma_i - 1 . $
  The power-series notation here means the inverse limit of finite group algebras, as in $(∗)$,
    hence a product of coefficient copies. Multiplication by a variable is injective and its quotient is obtained
    by setting that variable to zero. Successively applying these statements shows that the Koszul cochain complex
    has just its top cohomology, the augmentation quotient $R$, in degree $m$.
    The coefficient splitting by powers of $X_i$ makes these statements exact also with continuous parameters.
  There is an identification of translation modules
  $ cal(D)_(upright("lf")) \( F \, R \) = "Coind"_K^F cal(D) \( K \, R \) . $
  Indeed $F \/ K$ is discrete, and both sides are the product of one copy of $cal(D) \( K \, R \)$ for each coset,
    with the same translation rule. Evaluation on $K$, and the bar contraction using representatives for these
    open cosets, give continuous cohomological Shapiro for this coinduced module. This proves the second formula.
    Changing a lattice basis acts on the top cochain generator by the inverse determinant of its change matrix.
    Scalar multiplication by $a$ has determinant $a^m$, proving the asserted character.
  For the first formula, exhaust $F$ by $p^(- j) K$. In every cochain degree,
    restriction between these open-and-closed subgroups is surjective by extension by zero.
    The inverse limit is the continuous cochain complex on $F$, since these open subgroups cover $F$;
    the same statements hold with the parameter $T$. On trivial characteristic-$p$ coefficients the Koszul
    differentials are zero, and compact-lattice cohomology is the exterior algebra on the continuous linear forms
    of the lattice. Restriction from $p^(- j - 1) K$ to $p^(- j)
    K$ multiplies each degree-one form by $p$ and is therefore zero in every positive degree.
    In degree zero restriction is the identity. The derived inverse limit is consequently $R$.
    The same finite complexes and the same vanishing transition maps compute the parameter versions. ◻
]

#thm([Proposition 5.7.])[
  (The punctured negative space).  #emph[For $m = 1 \, 2$ the natural constants map fits into a fiber sequence
$ R arrow.r R Gamma \( N_m^(*) \, cal(O)^flat \) arrow.r R \( - 1 \) ⊗ "or"_F \[ - m - 1 \] . $

 It is equivariant for scalar units and natural in $S$ and in profinite parameters.
   Thus the only cohomology groups are $R$ in degree zero and an orientation line in degree $m + 1$.
   The scalar $a in bb(Z)_p^times$ has weight $macron(a)^(- m)$ on the latter.
   Reversing the action convention reverses all these exponents simultaneously.]
] <h3:prop:punctured-cohomology>

#proof[
  Use the support fiber sequence for $underline(F) subset bb(A)_C^1$ in 18.
    Its middle term is $R$ by 21, and its first term is $cal(D)_(upright("lf")) \( F \, R \) \( - 1 \) \[ - 2 \]$
    by 22. Take the translation cohomology of 23. The resulting support term has degree $m + 2$;
    rotation gives the stated cofiber in degree $m + 1$. The map from $R$ throughout this construction is the
    coefficient unit. Scalar multiplication preserves the normal Kummer class and contributes exactly the
    translation orientation computed in that lemma. ◻
]

=== 5.3 Independent pairs and compact frame cohomology <independent-pairs-and-compact-frame-cohomology>

The punctured calculation has produced the two cohomology rows for coheight one.
  For the ordinary stratum, we must instead remove the dependent pairs in $N_1^2$.
  We compute the two support terms with their frame characters before taking the compact frame-group cohomology.

Put $N = N_1$, $E = E_1$, and $G_f = "GL"_2 \( bb(Z)_p \) times P_1$.
  Let $D subset N^2 \\ { 0 }$ be the locus of proportional pairs, so that $E = \( N^2 \\ { 0 } \) \\ D$.
  The direction of a proportional pair belongs to $bb(P)^1 \( bb(Q)_p \)$.

#thm([Lemma 5.8.])[
  (The two support terms).  #emph[The support at the double origin in $N^2$ is a line in degree six,
    of scalar weight $- 2$. The support in $D$ has cohomology in degrees three and five.
    In each degree it is a distribution module on $bb(P)^1 \( bb(Q)_p \)$ with a one-dimensional continuous fiber.
    The scalar weights of these two fibers are respectively $- 1$ and $- 2$.]
  #emph[These descriptions are equivariant relative descriptions, with continuous profinite parameters.
    For the stabilizer of the direction $\( 1 \, 0 \)$, written
$ B = {mat(delim: "(", a, b; 0, d) in "GL"_2 \( bb(Z)_p \)} \, $

 the two fibers have characters $macron(d)^(- 1)$ and $macron(a)^(- 1) macron(d)^(- 1)$.
   An element $v in P_1 = bb(Z)_p^times$ has characters $macron(v)$ and $macron(v)^2$, respectively.
   Normal Kummer twists are understood in these descriptions.]
] <h3:ana:ordinary-support>

#proof[
  The preimage of the double origin under $bb(A)_C^2 arrow.r N^2$ is $bb(Q)_p^2$.
    The product support calculation gives its distributions in degree four.
    Taking the two translation directions adds degree two and inverse determinant orientation,
    giving degree six and scalar weight $- 2$.
  On a slope chart, lift the first coordinate to $z_1 in.not bb(Q)_p$. The support in the second coordinate is
  $ z_2 = a z_1 + b \, wide a \, b in bb(Q)_p \, $
  with $a$ in a compact open slope patch when desired. 22 gives distributions in $\( a \, b \)$ in normal support
    degree two. Taking translations in the second coordinate is the $b$-translation calculation of 23.
    It leaves distributions in $a$ and adds degree one with inverse orientation.
    First-coordinate translation replaces $b$ by $b - a c$ and leaves $a$ fixed.
    It consequently preserves the resulting orientation line.
    The remaining base is $N^(*)$; 24 adds its degrees zero and two.
    We obtain degrees three and five, and weights $- 1$ and $- 2$ with the same sign.
    To justify this computation with distributions in the slope, first use a finite clopen slope partition.
    It gives a finite sum of the relative punctured calculation. Then take the partition limit.
    The summation maps are split and the discarded residue kernels are uniformly pro-zero by 22;
    hence this limit introduces no additional cohomology. This also specifies the topology of the resulting
    distribution rows.
  For equivariance, a point mass at a direction is the support map from that direction’s tubes.
    These maps commute with linear changes of the pair. Finite sums of point masses are dense in the
    finite-partition topology: on any finite partition every prescribed collection of values is realized by such a
    sum. Transport of the point masses therefore determines transport on the full distribution module.
    At the direction $\( 1 \, 0 \)$ the tangential coordinate is changed by $a$ and the normal coordinate by $d$.
    The inverse translation orientations just computed are $macron(d)^(- 1)$ and $macron(a)^(- 1)
    macron(d)^(- 1)$; the upper-right entry acts trivially on both fibers.
    The quotient frame $v$ scales both coordinates by $v^(- 1)$, giving the stated $P_1$ characters.
    These are finite characters. The calculations of tubes and translations were relative,
    so this transport argument also applies with all the indicated parameters. ◻
]

#thm([Proposition 5.9.])[
  (The ordinary constants map).  #emph[For $p gt.eq 5$, the structure map $Y_1 arrow.r
    B G_f$ and the coefficient unit induce an equivalence
$ R Gamma_(upright("cts")) \( G_f \, R \) arrow.r^(med tilde.eq med) R Gamma \( Y_1 \, cal(O)^flat \) . $

 This is an equivalence of derived algebras and is natural over $S$, with continuous profinite parameters.
   It retains both frame-group actions before taking their cohomology.
   In particular the degree-three class from the rank-two Tate frame is carried by this actual map from constants.]
] <h3:prop:ordinary-constants>

#proof[
  By Lemma 5.4, Lemma 5.6, constants compute the cohomology of $N^2$.
    Remove the double origin and then the proportional locus.
    These two support fiber sequences are equivariant for $G_f$ and their maps from constants are the coefficient unit.
  The central subgroup $mu_(p - 1) I_2 subset "GL"_2 \( bb(Z)_p \)$ acts on their support cohomology by the
    characters of weights $- 1$ and $- 2$ in 25. Neither character is trivial when $p gt.eq 5$.
    Its averaging idempotent is defined in characteristic $p$,
    so its derived invariants are exact and annihilate both support complexes.
    Taking the remaining frame-group cohomology therefore turns the constants arrow into an equivalence.
    The arrow was induced by the structure map and coefficient unit, which are multiplicative.
    Its equivalence on underlying complexes proves the assertion for derived algebras as well. ◻
]

For later finiteness arguments we need twists even when the preceding averaging no longer kills the support.
  The appropriate induction is induction of measures.

#thm([Lemma 5.10.])[
  (Cohomology of induced measure modules).  #emph[Let $G$ be a compact $p$-adic analytic group without
    $p$-torsion, let $B subset G$ be a closed analytic subgroup without $p$-torsion, and suppose $G arrow.r
    G \/ B$ has continuous local sections. If $V$ is a finite-dimensional continuous $k$-representation of $B$, then
$ M = k \[ \[ G \] \] hat(⊗)_(k \[ \[ B \] \]) V $

 has finite-dimensional continuous $G$-cohomology in every degree.
   The same cohomology after replacing coefficient copies of $k$ by $R$ is the corresponding finite-dimensional
   cohomology tensored with $R$, including continuous profinite parameters.]
] <h3:ana:measure-induction>

#proof[
  Write $g = dim G$. Analytic group duality identifies cohomology with homology in complementary degree:
  $ H_(upright("cts"))^a \( G \, M \) tilde.eq H_(g - a)^(upright("cts")) \( G \, "or"_G ⊗_k M \) . $
  The orientation module is retained in this formula. One obtains it by dualizing a finite projective completed
    group-ring resolution of $k$ and reversing its degrees. Such resolutions exist for the stated groups by
    #cite(label("AW")) Proposition 3.3; their dualizing module is the top inverse adjoint orientation
    #cite(label("BGHS")) Proposition 4.16, Remark 4.23, and Proposition 4.40.
    Thus the formula applies to compact measure modules, not just to finite coefficients.
  Completed homological Shapiro gives
  $ H_(g - a)^(upright("cts")) \( G \, "or"_G ⊗ M \) tilde.eq H_(g - a)^(upright("cts")) \( B \, "or"_G \|_B ⊗ V \) . $
  For completeness, local sections identify $k \[ \[ G \] \]$, as a right completed $k \[ \[ B \] \]$-module,
    with a completed free module on $G \/ B$. Inducing a completed projective $B$-resolution and then taking
    $G$-coinvariants is therefore the same complex as taking $B$-coinvariants.
    This proves the displayed Shapiro identification. The last homology is finite-dimensional,
    since a finite projective $B$-resolution has finite-dimensional terms after tensoring with the
    finite-dimensional fiber. This argument includes the duality shift;
    it makes no unshifted cohomological Shapiro assertion for $M$.
  To justify extension to $R$, start with compact $k$-modules and apply the exact functor
  $ A mapsto "Hom"_k \( A^or \, R \) \, wide A^or = "Hom"_(upright("cts") \, k) \( A \, k \) . $
  After a choice of a basis of $A^or$ its value is a product of copies of $R$.
    Exactness follows by splitting sequences of the discrete vector spaces $A^or$.
    Finite projective resolutions use only finite powers and idempotent summands, so their comparison, duality,
    and Shapiro maps commute with this functor. Apply the same argument to $C_(upright("cts")) \( T \, R \)$,
    or use (5.1). ◻
]

#thm([Corollary 5.11.])[
  (Twisted ordinary finiteness).  #emph[If a coefficient line on $Y_1$ becomes a finite-character constant line on
    $E_1$, its geometric cohomology is finite-dimensional in every degree and vanishes outside a finite range.
    This applies to all powers of the periodicity line and all finite tame determinant twists.
    For a profinite parameter $T$, the corresponding cohomology is $C_(upright("cts")) \( T \, - \)$ of this
    finite-dimensional answer.]
] <h3:ana:twisted-finiteness>

#proof[
  The ambient constants and the origin-support line have finite-dimensional fibers with finite-character action.
    The two remaining support rows in 25 are completed measure induction from $B times P_1$ to $G_f$.
    To check the local-section hypothesis, a primitive vector over $bb(Z)_p$ can, on either standard slope chart,
    be completed continuously to an invertible matrix. These sections also show that $"GL"_2 \( bb(Z)_p \)$ acts
    transitively on $bb(P)^1 \( bb(Q)_p \)$. Its stabilizer is the displayed upper triangular group.
    Both $G_f$ and $B times P_1$ are compact analytic without $p$-torsion when $p gt.eq 5$:
    a matrix of order $p$ in dimension two would require the degree-$p - 1$ cyclotomic polynomial,
    and $bb(Z)_p^times$ has no $p$-torsion. 27 proves finiteness of their support cohomology.
    The two support sequences prove the claim for the independent locus.
  On the connected Honda marking the periodicity line is framed by the leading derivative of the formal-group
    isomorphism. At height one its change of frame is the reduction $bb(Z)_p^times arrow.r bb(F)_p^times$.
    The determinant identity of 13 expresses a tame middle determinant character through the two frame characters.
    The indicated coefficient lines therefore have exactly the finite-character property used above. ◻
]

=== 5.4 Descent to the finite constant field <descent-to-the-finite-constant-field>

The geometric calculations are over $C^flat$. We now return to the finite field $k$ while retaining the stack maps
  and the residual group actions. This step uses base-field Frobenius on the $k$-defined spaces;
  the chosen untilt chart remains a device for computing their geometric cohomology.

For a $k$-defined space $X$, base-field Frobenius means the map $upright("id")_X times
  phi_q$ on $X times_("Spd" k) "Spd" C^flat$. In a coordinate chart defined over $k$ it raises coefficients to the
  $q$-th power and fixes the variables. It is distinct from Frobenius of all the variables in a perfected
  coefficient ring. A chosen untilt-divisor presentation need not be preserved by this map.

#thm([Lemma 5.12.])[
  (Base-field Frobenius with parameters).  #emph[Let $q = \| k \|$,
    and let $M_k$ be the analytic function space over $k$ on a chosen perfected punctured ball or on the perfected
    ordinary polyannular open. Let $M_C$ be the corresponding function space after extension from $k$ to $C^flat$.
    Let $phi$ act as the $q$-th power on coefficients and fix the variables. Then
$ 0 arrow.r M_k arrow.r M_C arrow.r^(phi - 1) M_C arrow.r 0 $

 is exact, including after $C_(upright("cts")) \( T \, - \)$ for a profinite space $T$.
   The same statement applies to finite products of the punctured-ball charts at finite marking levels.
   Consequently the coefficient comparison is an equality with derived base-Frobenius invariants,
   naturally for all group actions defined over $k$.]
] <h3:ana:base-frobenius>

#proof[
  Use the expansions in fractional monomials on exhausted closed smaller polyannuli.
    An invariant expansion has each coefficient in $bb(F)_q = k$, and hence is precisely an element of $M_k$.
    For a coefficient $a in C^flat$, choose a root $b$ of $b^q - b = a$ of least absolute value.
    The Newton polygon, or the convergent series $b = - sum_(j gt.eq 0) a^(q^j)$ when $\| a \| < 1$, gives
  $ \| b \| = \| a \| quad \( \| a \| < 1 \) \, wide \| b \| lt.eq 1 quad \( \| a \| = 1 \) \,
    wide \| b \| = \| a \|^(1 \/ q) quad \( \| a \| > 1 \) . $
  In particular $\| b \| lt.eq \| a \|$. Solving for each coefficient preserves the $c_0$ convergence conditions
    in every smaller polyannulus norm. This proves surjectivity and also supplies solutions arbitrarily small
    whenever the input is sufficiently small in any finite collection of these norms.
    The Frobenius map itself is continuous in the full analytic topology:
    for a Gauss poly-radius $rho$, $parallel phi f parallel_rho = parallel f parallel_(rho^(1 \/ q))^q$.
    The slightly larger poly-radius on the right belongs to the same open domain.
  For continuous parameter families, first approximate a given function on a finite clopen partition of $T$ and
    lift the finitely many values. The remaining error is small.
    Solve for its coefficients with the small branch just described, refine the partition,
    and repeat with errors tending to zero in successive defining norms.
    The estimates give a uniformly convergent sum of continuous corrections; its limit is a continuous lift.
    This argument proves exactness on parameters directly. For the spaces defined by an exhaustion,
    the continuous Laurent-polynomial approximation and the complete norm topologies meet the hypotheses of 20.
    Thus these analytic inverse limits have no additional derived term.
  The maps $M_k arrow.r M_C$ and $phi - 1$ themselves are natural for changes of variables defined over $k$.
    Their auxiliary coefficient choices need not be natural. The exact sequence therefore identifies the original
    coefficient complex with the fiber of $phi - 1$, equivariantly and with parameters.
    If a finite marking chart has residue field $k' \/ k$, geometric base change gives a product indexed by the
    embeddings of $k'$. The canonical base Frobenius permutes these factors.
    On a cycle of length $e = \[ k' : k \]$, eliminating successive coordinates reduces its difference equation to
    coefficient Frobenius $q^e$ minus identity. The preceding estimates and continuous lifting apply with $q^e$.
    Thus finite products and finite constant-field descent retain the claimed exact sequence,
    with the actual permutation of factors. ◻
]

Write $B_(upright("pk"))$ for the algebra of functions on $cal(X)_1$,
  the completed perfection of the ordinary locus, with the inverse-limit topology of uniform convergence on the
  exhausted closed polyannular charts. 8 gives an equivalent description using finite root levels of Laurent
  series and a countable family of defining norms.

#thm([Theorem 5.13.])[
  (Completed cohomology and its constants maps).  #emph[The completed strata of 10 have the following properties.]
  + #emph[For the ordinary completed coefficient ring $B_(upright("pk"))$, the natural constants map is an equivalence
$ R Gamma_(upright("cts")) \( "GL"_2 \( bb(Z)_p \) times P_1 \, k \) arrow.r^(med tilde.eq med) R
  Gamma_(upright("cts")) \( P_3 \, B_(upright("pk")) \) . $

 It is the map defined by $Y_1 arrow.r B \( "GL"_2 \( bb(Z)_p \) times P_1 \)$,
   and is compatible with geometric constant extension, products, coefficient Frobenius, and profinite parameters.
   Every periodicity twist and finite tame character twist has finite cohomology in each degree, in a bounded range.]
  + #emph[Let $L$ be the connected height-two marking algebra, $U subset P_2$ an open subgroup, $B = L^U$,
    and $B^(upright(b)) = hat(B^(upright("perf")))$. Finite products of fields are allowed.
    Then each $H_(upright("cts"))^a \( H \, B^(upright(b)) \)$ is finite-dimensional over $k$,
    and its degree-zero group is $k$ by constants. The same finiteness holds for lines framed on a finite
    connected-marking cover, including the periodicity and tame determinant lines used below.
    On taking the filtered colimit over marking levels there is a natural fiber sequence
$ k arrow.r "colim"_U R Gamma_(upright("cts")) \( H \, \( L^U \)^(upright(b)) \) arrow.r k_lambda \[ - 3 \] . $

 The first arrow is the inclusion of constants. The full residual norm quotient $P_3 \/ H =
   bb(Z)_p^times$ acts on $k_lambda$ by $a mapsto macron(a)^(- 2)$ in the point-action convention above.
   The commuting $P_2$ action is retained. It is smooth on the displayed finite-dimensional rows.
   The statement includes restrictions between marking levels.
   With a profinite parameter $T$, each displayed cohomology group is replaced by its
   $C_(upright("cts")) \( T \, - \)$, as specified at the start of the section.]
  #emph[In particular, invariants of the order-$p - 1$ subgroup of the full norm quotient kill the extra line in
    (ii). This subgroup is in the quotient; no section of $P_3 arrow.r bb(Z)_p^times$ is required.]
] <h3:thm:completed-cohomology>

#proof[
  First compute over $C^flat$. For the ordinary locus, 26 is precisely the desired map on the quotient-stack
    presentation in 13. The perfected polyannular exhaustion has affinoid perfectoid charts.
    Its coefficient complex is the function complex $B_(upright("pk"))$,
    since the successive polynomial approximation in 20 gives the required vanishing of the derived analytic
    limit. Thus this is also the ordinary continuous $P_3$-cochain comparison with the stated topology.
  Take derived invariants of base-field Frobenius using 29. On the constants side the fiber of $phi - 1$ is $k$.
    This proves the untwisted comparison over $k$ with its actual coefficient map.
    For a twist, 28 gives a bounded complex with finite-dimensional geometric cohomology.
    Frobenius acts semilinearly and bijectively on these groups.
    On a finite-dimensional $C^flat$-space a bijective $q$-semilinear operator $F$ has $F -
    1$ surjective and a finite-dimensional fixed space over $k$.
    Indeed write $F \( x \) = A x^(\[ q \])$ with $A$ invertible.
    The system $A x^(\[ q \]) - x = b$ is equivalent to monic equations $x_i^q = \( A^(- 1) \( x + b \) \)_i$.
    Their pairwise coprime leading monomials show that the coordinate algebra is free over the $b$-coordinate
    algebra on the $q^n$ monomials with each exponent less than $q$.
    The derivative is $- I$, so the map is finite étale, surjective, and has kernel of order $q^n$.
    The kernel is a $k$-vector space and therefore has dimension $n$.
    This proves the asserted semilinear calculation. Hence Frobenius descent preserves the finite-dimensional
    conclusion. All these operators commute with the frame actions and with the coefficient maps.
  For (ii), define Frobenius before choosing an untilt-divisor presentation.
    The space $N_2$ and its $P_2$ and residual norm actions are defined over $k$.
    Consequently $upright("id")_(N_2) times phi_q$ induces a $q$-semilinear automorphism $Phi$ of
  $ cal(K)_C = R Gamma \( N_(2 \, C)^(*) \, cal(O)^flat \) \, wide N_(2 \, C) = N_2 times_("Spd" k) "Spd" C^flat \, $
  commuting with both actions. The presentation $N_(2 \, C)^(*)
    tilde.eq \[ \( bb(A)_C^1 \\ F \) \/ F \]$ computes $cal(K)_C$. It is not required to commute with $Phi$:
    transporting $Phi$ through it can change the chosen untilt divisor.
    Put $cal(K)_k = "fib" \( Phi - 1 : cal(K)_C arrow.r cal(K)_C \)$.
  Write $X_B = "Spa" \( B^(upright(b)) \)$ and $M_(B \, C) = Gamma \( X_B times_k "Spd" C^flat \, cal(O)^flat \)$.
    The perfected punctured-ball exhaustion and 20 give no higher cohomology on this geometric chart.
    On its $k$-defined coordinates the canonical base Frobenius is coefficient Frobenius,
    with any finite residue-field factor permutation retained.
    Thus 29, applied in every bar degree with parameter $H^a$,
    identifies $R Gamma_(upright("cts")) \( H \, B^(upright(b)) \)$ with the fiber of $Phi -
    1$ on $R Gamma_(upright("cts")) \( H \, M_(B \, C) \)$.
  The actual marking torsor of (4.10) gives a $k$-defined equivalence $\[ X_B \/ H \]
    tilde.eq \[ N_2^(*) \/ U \]$. Base-changing this equivalence supplies the vertical maps in the commutative diagram
  (5.2)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$R Gamma_(upright("cts")) \( H \, M_(B \, C) \)$])
  content((4.103, 0), [$R Gamma_(upright("cts")) \( H \, M_(B \, C) \)$])
  content((0, -1.239), [$R Gamma_(upright("cts")) \( U \, cal(K)_C \)$])
  content((4.103, -1.239), [$R Gamma_(upright("cts")) \( U \, cal(K)_C \) .$])
  line((1.326, 0), (2.777, 0), mark: (end: ">"))
  content((2.052, 0.2266), [#text(size: 0.73em)[$Phi - 1$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.2741, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((4.103, -0.2725), (4.103, -0.9661), mark: (end: ">"))
  content((4.377, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((1.326, -1.239), (2.711, -1.239), mark: (end: ">"))
  content((2.019, -1.012), [#text(size: 0.73em)[$Phi - 1$]])
})
  These maps come from the quotient stacks over $k$. The diagram is natural for $P_2$-transport between marking
    levels and is equivariant for the full residual norm and the coherent Frobenius actions.
    Taking fibers, and commuting the two derived limits, gives the natural identity
  $ R Gamma_(upright("cts")) \( H \, B^(upright(b)) \) tilde.eq R Gamma_(upright("cts")) \( U \, cal(K)_k \) . $
  There are no additional rows in this fiber. 24 gives geometric cohomology only in degrees zero and three.
    In every degree the fiber sequence gives
  $ 0 arrow.r "coker" \( Phi - 1 divides H^(i - 1) cal(K)_C \) arrow.r H^i cal(K)_k arrow.r
    ker \( Phi - 1 divides H^i cal(K)_C \) arrow.r 0 . $
  The semilinear calculation above makes the two potentially nonzero cokernels vanish.
    Thus $cal(K)_k$ has the two stated $k$-rows, with degree zero equal to $k$ and trivial $P_2$ action.
    Smoothness of the upper action can also be seen directly:
    if $e$ is a basis, $Phi \( e \) = A e$, and $u \( e \) = c \( u \) e$, commutation gives $c \( u \)^q =
    c \( u \)$. Hence $c \( u \) in k^times$. The scalar norm character $macron(a)^(- 2)$ survives this descent
    since it already takes values in $bb(F)_p^times$.
  A compact analytic $U subset P_2$ has finite completed resolutions:
    it has no $p$-torsion, because an order-$p$ element in its degree-two division algebra would require a
    subfield of degree $p - 1 > 2$. The quotient spectral sequence with the two finite $k$-rows therefore proves
    finite-stage finiteness and identifies degree zero with $k$.
    The resolutions consist of finite powers and idempotent summands.
    The continuous Artin–Schreier lifting above and these finite resolutions identify the actual parameter
    cohomology with $C_(upright("cts")) \( T \, - \)$ of the point-valued finite groups.
    For a line framed on a finite connected-marking cover, the same argument has a finite-character $U$-fiber.
    The tautological connected frame trivializes the periodicity line under $H$,
    and a tame determinant character is trivial on $H$. This proves the additional finite-stage assertion.
  Finally choose a cofinal sequence of open uniform subgroups $U$,
    small enough to act trivially on these two finite rows. Restriction to a sufficiently deep $p$-power subgroup
    is zero in positive cohomological degrees: on the mod-$p$ exterior cohomology of a uniform group it is zero in
    degree one and hence in every positive degree. Filtered colimits of the quotient spectral sequences therefore
    retain precisely the two rows themselves. The constants arrow gives the stated fiber sequence.
    Its scalar character was computed on $N_2^(*)$ in 24. By determinant normalization in 13,
    this scalar is the #emph[full] reduced norm of an element of $P_3$.
    The induced quotient action on $H$-cohomology is well defined because inner conjugation by $H$ acts trivially
    there. Exact averaging in the prime-to-$p$ norm quotient gives the final assertion. ◻
]

#prodef([Remark 5.14.])[
  The structure map used in Proposition 5.9, Theorem 5.13 also defines
  $ R Gamma \( G_f \, W_ell \( k \) \) arrow.r R Gamma \( Y_1 \, W_ell cal(O)^flat \) $
  for every $ell$. These maps commute with Verschiebung, Frobenius, truncation,
    and the maps from $bb(Z) \/ p^ell$-constants. Their equivalence follows by induction on the finite
    Verschiebung filtration from the length-one equivalence. Thus the constants comparison retains the actual
    frame classes through the finite Witt comparisons used later.
] <h3:ana:witt-naturality>

== 6 Removing completion in coheight one <h3:sec:coheight-one>

The calculation of the completed height-two stratum must be compared with the algebraic coefficient algebra
  occurring in ordinary Morava cooperations. This section proves that comparison.
  The two main points are finiteness at each complete local-field stage and the use of the #emph[full]
  reduced-norm quotient. In particular, averaging over central tame units fails at $p = 7$.

Put

$ K = k \( \( y \) \) \, wide J = P_2 \, wide H = ker \( "Nrd" : P_3 arrow.r bb(Z)_p^times \) \, wide H' =
  "Nrd"^(- 1) \( mu_(p - 1) \) . $

Let $L$ be the connected-marking algebra of Proposition 4.6, Lemma 4.8.
  Its commuting $P_3$- and $J$-actions make it an ind-étale $J$-torsor over $K$.
  For a normal open subgroup $U subset J$, write $B_U = L^U$.
  It is a finite Galois étale $K$-algebra with group $J \/ U$; in particular,
  it is a finite product of complete discretely valued fields.
  All field valuations are normalized by $v \( y \) = 1$. Statements about valuation ideals in a product are
  imposed on every factor. Both $P_3$ and $J$ preserve these valuations, allowing permutations of the factors.

We write $C \( T \, M \) = C_(upright("cts")) \( T \, M \)$ for continuous functions from a profinite space $T$ to
  a topological module $M$, and use this notation termwise for cochain complexes. We also put

$ R = L^(upright("perf")) = "colim"_(U \, e) B_U^(1 \/ p^e) \, wide B_U^b = hat(B_U^(upright("perf"))) . $

As throughout the paper, a cochain complex with coefficients in an algebraic union means the filtered colimit of
  the cochain complexes of the displayed complete stages. Thus, for example,

#[#set math.equation(numbering: n => "(6.1)")
 $ C_(upright("cts"))^bullet \( H \, R \) := "colim"_(U \, e)
   C_(upright("cts"))^bullet \( H \, B_U^(1 \/ p^e) \) . $ <h3:co:filtered-convention>]

We do not identify this complex with continuous functions into a union endowed with its subspace metric.
  Group cohomology in negative degrees is understood to be zero.

The input from 30 has the following precise form. Each $H_(upright("cts"))^a \( H \, B_U^b \)$ is finite. Moreover,

#[#set math.equation(numbering: n => "(6.2)")
 $ H^a #h(-0.16667em) ("colim"_U C_(upright("cts"))^bullet \( H \, B_U^b \)) =
   cases(delim: "{", k \, & a = 0 \,, k \( 2 epsilon.alt \) \, & a = 3 \,, 0 \, & a eq.not 0 \, 3 \,) wide
   epsilon.alt in { 1 \, - 1 } . $ <h3:co:completed-input>]

The degree-zero map is the constants map. In the notation $k \( 2 epsilon.alt \)$,
  an element of the full quotient $H' \/ H = mu_(p - 1)$ represented by a norm unit $u$ acts as
  $u^(2 epsilon.alt)$. The comparison, the commuting $J$-action,
  and the filtered transition maps are retained with every profinite parameter space.
  No statement about Galois descent of a single completed infinite field is required below.

#thm([Theorem 6.1.])[
  (Coheight-one comparison).  #emph[For every $p gt.eq 5$, the natural constants map is a quasi-isomorphism
#[#set math.equation(numbering: n => "(6.3)")
 $ k arrow.r^(med tilde.op med) "colim"_U C_(upright("cts"))^bullet \( H' \, B_U \) . $ <h3:co:main-constants>]

 It is equivariant for the commuting connected-frame action and for the remaining height-three action.
   For every profinite space $T$, its parameterized version
$ C \( T \, k \) arrow.r^(med tilde.op med) "colim"_U C #scale(x: 120%, y: 120%)[\(] T \,
  C_(upright("cts"))^bullet \( H' \, B_U \) #scale(x: 120%, y: 120%)[\)] $

 is also a quasi-isomorphism. All maps are the maps induced by constants and inclusions of coefficient algebras.]
] <h3:thm:coheight-one-comparison>

The proof has three stages. First, the distribution algebra of the connected Honda marking torsor and its Cartier
  residue transpose prove finiteness at every sufficiently deep complete local-field stage.
  Second, Frobenius contracts the positive valuation lattices and compares the algebraic perfection with its
  completion. Finally, the full norm quotient removes the remaining nonconstant row and the distribution target.
  Every comparison in the conclusion is the original constants map, even though the proof uses auxiliary operators.

=== 6.1 Continuous cohomology and finite resolutions <continuous-cohomology-and-finite-resolutions>

We first establish the topological facts needed for both the present comparison and the ordinary-stratum argument
  of 8. A linearly topologized $bb(F)_p$-vector space below is complete and separated;
  an action has invariant neighborhoods if its open linear subspaces have a cofinal subsystem preserved by the group.

#thm([Lemma 6.2.])[
  (Finite resolutions and continuous duality).  #emph[Let $G$ be a compact $p$-adic analytic group with no element
    of order $p$, and put $d = dim G$. The trivial module $bb(F)_p$ has a resolution of length $d$ by finitely
    generated projective $bb(F)_p \[ \[ G \] \]$-modules. For every complete linearly topologized representation
    $M$ with invariant neighborhoods, applying continuous $bb(F)_p \[ \[ G \] \]$-linear Hom to this resolution
    computes $C_(upright("cts"))^bullet \( G \, M \)$ up to a continuous chain homotopy equivalence.
    Its terms are continuous direct summands of finite powers of $M$.]
  #emph[If $M$ is compact, $H_(upright("cts"))^a \( G \, M \)$ is compact Hausdorff.
    For $G = H$ or $G = P_3$, put $d_H = 8$ and $d_(P_3) = 9$.
    Their adjoint orientation characters are trivial, and there are natural identifications
#[#set math.equation(numbering: n => "(6.4)")
 $ H_(upright("cts"))^a \( G \, M \)^or tilde.equiv H_(upright("cts"))^(d_G - a) \( G \, M^or \) \, wide M^or =
   "Hom"_(upright("cts") \, bb(F)_p) \( M \, bb(F)_p \) \, $ <h3:co:compact-duality>]

 where $M^or$ has its discrete topology and contragredient action.
   The transposed coefficient map induces the dual cohomology map.
   The same formula, with compact and discrete sides interchanged,
   holds for a discrete continuous $bb(F)_p$-representation and its compact dual.
   In particular, finite coefficient modules have finite cohomology.]
] <h3:co:compact-resolution>

#proof[
  The groups needed here satisfy the hypotheses by 6; their open subgroups inherit the absence of $p$-torsion and
    have the same Lie dimension. For the general assertion, use the Noetherian finite-global-dimension theorem for
    the completed group ring #cite(label("AW")) Proposition 3.3 and the fact that its integral dualizing
    cohomology is a free rank-one module in degree $d$ and vanishes in the other degrees,
    with the adjoint orientation action #cite(label("BGHS")) Proposition 4.16 and Remark 4.23.
    These statements give a finite projective resolution over $bb(Z)_p \[ \[ G \] \]$.
    Noetherianity makes its terms finitely generated. Give each term its compact topology as a summand of a finite
    power of the group ring. The maps and their images are continuous and closed.
    Its syzygies are $p$-torsion-free, so reduction modulo $p$ is exact.
    The integral completed bar resolution is projective in compact modules:
    the completed free $bb(Z)_p$-module on a profinite set is compact and torsion-free, hence projective,
    since its Pontryagin dual is divisible and therefore injective.
    Induction to $bb(Z)_p \[ \[ G \] \]$ preserves that projectivity.
    The continuous projective comparison therefore shows that the dual of the finite integral resolution computes
    the quoted continuous dualizing cohomology. Its reduction modulo $p$ does so as well,
    because both its terms and its unique integral cohomology module are $p$-torsion-free.
    The reduced dual complex has cohomology only in degree $d$.
    If the reduced resolution extends beyond $d$, its last dual differential surjects onto a projective module;
    splitting and dualizing removes a contractible pair. Repetition gives the stated length-$d$ resolution.
  Here is why the resolution computes the asserted topological cochains.
    For a profinite space $Z$, continuous maps $Z arrow.r M$ identify with continuous linear maps
    $bb(F)_p \[ \[ Z \] \] arrow.r M$. Modulo an invariant open subspace of $M$,
    the map has finite image and its linear extension factors through a finite clopen partition of $Z$.
    Taking the inverse limit over these subspaces gives the claimed extension into $M$.
    The completed bar resolution is projective in compact modules:
    a surjection of compact $bb(F)_p$-vector spaces admits a continuous linear section,
    obtained by dualizing and splitting the corresponding injection of discrete vector spaces.
    Such a section lifts the profinite set of bar generators; the lift extends group-ring linearly.
    The projective comparison construction therefore gives continuous chain maps and homotopies between the
    completed bar resolution and the finite resolution. Applying continuous Hom into $M$ proves the assertion.
    Continuity for the uniform cochain topologies can be checked after quotienting by each invariant open subspace.
  For compact coefficients, the finite complex has compact terms and closed boundaries,
    which proves the compact Hausdorff assertion. Now take $G = H$ or $G = P_3$.
    The adjoint orientation of each is trivial by 6: conjugation has determinant one on $D_3$,
    and also on its trace-zero summand. Thus the dualizing module has the trivial right action, in degree $d_G =
    8$ or $9$ respectively.
  Let $Q_bullet$ be the finite resolution for this $G$, and set $Q_i^(*) =
    "Hom"_(bb(F)_p \[ \[ G \] \]) \( Q_i \, bb(F)_p \[ \[ G \] \] \)$.
    The reversed group-ring dual resolves the trivial right module, by the dualizing calculation above.
    Regard $Q_i^(*)$ as a left module through the involution $g mapsto g^(- 1)$. Finite-projective evaluation gives
  $ "Hom"_(upright("cts") \, bb(F)_p \[ \[ G \] \]) \( Q_i \, M \)^or tilde.equiv
    "Hom"_(upright("cts") \, bb(F)_p \[ \[ G \] \]) \( Q_i^(*) \, M^or \) . $
  For a finite free module this is evaluation coordinate by coordinate;
    passing to a projective summand preserves the identification.
    It commutes with both differentials and coefficient maps.
    Continuous $bb(F)_p$-duality is exact on compact vector spaces,
    as follows by extending a functional on a finite-dimensional quotient.
    Reversing degrees about $d_G$ and taking cohomology proves (6.4) and its naturality for both groups.
    For a discrete continuous representation, each element has a finite $G$-orbit;
    finite sets therefore lie in finite $G$-stable submodules.
    Their annihilators give invariant open neighborhoods in the compact dual.
    Dualizing the compact formula again proves the discrete version.
    Finally, the finite-resolution complex has finite terms when $M$ is finite. ◻
]

Here the coefficient actions have the required invariant neighborhoods.
  For the local-field and root stages, valuation balls are invariant.
  For the ordinary spaces $B_(upright("hol"))$ and $B_(upright("pk"))$ of 8, write $A =
  k \[ \[ x \, y \] \]$ and use the valuations $v_(a \, b)$ with $v_(a \, b) \( x \) =
  a$ and $v_(a \, b) \( y \) = b$. Since $g \( x \) = x u_g$ with $u_g in A^times$ and $g \( y \) in \( x \, y \)$,

#[#set math.equation(numbering: n => "(6.5)")
 $ v_(a \, b) \( g f \) gt.eq v_(a \, min \( a \, b \)) \( f \) wide \( g in P_3 \, med a \, b > 0 \) .
   $ <h3:co:uniform-action-bound>]

Indeed units and their inverses have valuation zero, so the estimate holds termwise on Laurent polynomials.
  Density extends it to $B_(upright("hol"))$, then to its finite root levels and $B_(upright("pk"))$.
  The coefficient lines used in 8 have unit action multipliers in their free $A$-lattices,
  so the same estimate holds in those frames. Given a basic open linear neighborhood $V$,
  (6.5) supplies a neighborhood contained in $⋂_(g in P_3) g^(- 1) V$.
  This intersection is therefore open, invariant, and contained in $V$.
  The bound also holds uniformly for continuous functions on a compact cochain domain,
  with any profinite parameter space. Thus these spaces satisfy the hypothesis of 33 for the actual uniform
  cochain topologies.

An exact coefficient sequence induces an exact sequence of ordinary continuous cochain complexes whenever its
  surjection has a continuous section as a map of spaces. Equivariance and additivity of the section are
  unnecessary: compose a cochain with the section. We will use this for discrete valuation quotients and for
  finite-dimensional linear maps over complete local fields, including their Frobenius transports.
  In a filtered union it suffices that every target stage have a continuous lift at one larger source stage,
  and that each stage’s kernel lie in a kernel stage with its subspace topology.

#thm([Lemma 6.3.])[
  (Strictness).  #emph[Let $A^bullet$ be a complex of Polish abelian groups with continuous differentials.
    If $H^a \( A^bullet \)$ is finite, its quotient topology is discrete.
    More precisely, the boundary subgroup $B^a$ is open and closed in the cycle group $Z^a$, and $partial :
    A^(a - 1) arrow.r.twohead B^a$ is open. Consequently, for every neighborhood $V$ of zero in $A^(a - 1)$ there
    is a neighborhood $W$ of zero in $Z^a$ such that every member of $W$ has a primitive in $V$.]
] <h3:co:strictness>

#proof[
  The cycles form a closed Polish group. The boundary subgroup is an analytic subset of it,
    being the continuous image of a Polish space, and hence has the Baire property #cite(label("Kechris"))
    Theorem 21.6. Its finite index implies that it is nonmeagre.
    A nonmeagre set with the Baire property is comeagre in some nonempty open set;
    intersecting two sufficiently small translates of that open set shows that its difference set contains a
    neighborhood of zero. Applied to the subgroup $B^a$, this proves openness, and an open subgroup is also closed.
  We also recall the open-mapping step. If $q : E arrow.r.twohead
    F$ is a continuous surjective homomorphism of Polish groups and $V$ is a neighborhood of zero in $E$,
    choose open $V'$ with $V' - V' subset V$. Separability gives a countable covering of $E$ by translates of
    $V'$. Thus $q \( V' \)$ is an analytic nonmeagre subset of $F$,
    and its difference set contains a neighborhood of zero. This difference set lies in $q \( V \)$.
    Hence $q$ is open. Apply this to the differential with target $B^a$, which is already open in $Z^a$. ◻
]

#thm([Lemma 6.4.])[
  (Profinite parameters).  #emph[Let $T$ be a profinite space.]
  + #emph[A continuous map $T arrow.r F$ lifts through every continuous open surjective homomorphism $E
    arrow.r.twohead F$ of Polish abelian groups.]
  + #emph[If a Polish complex $A^bullet$ has finite cohomology in every degree, then
$ H^a C \( T \, A^bullet \) tilde.equiv C \( T \, H^a \( A^bullet \) \) \, $

 where the finite cohomology group on the right is discrete.]
  + #emph[For a filtered system of such complexes, the corresponding identity commutes with the cochain colimit,
    with the colimit of the cohomology groups given its discrete topology.]
] <h3:co:parameters>

#proof[
  For the first assertion, choose complete translation-invariant metrics on the groups and successively smaller
    neighborhoods of zero in $E$ whose diameters tend to zero and whose sums converge.
    Openness provides corresponding neighborhoods in $F$. Compactness and zero-dimensionality give a finite clopen
    partition on which the given map is approximated by finitely many chosen images. Lift those values to $E$.
    Repeat on the error, refining the partition and choosing the correction inside the next prescribed
    neighborhood of zero in $E$. The successive locally constant lifts converge uniformly to a continuous lift;
    their images converge to the original map. This construction uses no metrizability assumption on $T$.
  A continuous family of cycles gives a continuous family of cohomology classes.
    If that family is zero, the first assertion and 34 lift it continuously through $A^(a - 1) arrow.r.twohead
    B^a$. Conversely, a continuous map from $T$ to the finite discrete cohomology group has finite image;
    choose a cycle for each value to obtain a continuous family. This proves the second assertion.
    For the third, a continuous function to a discrete filtered colimit has finite image.
    Its finitely many values and equality relations are represented at one stage.
    Filtered colimits of vector spaces are exact, which proves the claimed compatibility. ◻
]

All coefficient spaces to which 34 is applied are Polish.
  A finite product of local fields with finite residue fields is Polish.
  Its perfected completion has a countable dense subset obtained from the finite root levels.
  For a compact metrizable profinite space $Z$, $C \( Z \, M \)$ is Polish when $M$ is Polish:
  uniform limits give completeness, and finite clopen partitions with a countable dense subset of $M$ give
  separability. The groups $H^a$ serving as cochain domains are compact metrizable.
  The parameterized complex $C \( T \, A^bullet \)$ itself is not asserted to be Polish for arbitrary $T$.

We shall also use the following elementary countability fact.
  If $G$ is compact and second-countable and $N$ is countable discrete,
  then every $C_(upright("cts"))^a \( G \, N \)$ is countable.
  Indeed $G^a$ has countably many clopen sets, and a cochain is specified by a finite clopen partition and
  finitely many values. For discrete coefficients the same finite-image description shows that continuous cochains
  commute with filtered colimits, even when the transition maps are not injective.

=== 6.2 Distribution operators and the invariant differential <distribution-operators-and-the-invariant-differential>

The normalized generator-lift torsors of 15 are torsors over $L$ under the constant group schemes
  $Gamma_2 \[ p^l \]$. Their coordinate algebras and transition embeddings are

#[#set math.equation(numbering: n => "(6.6)")
 $ R_l = L^(1 \/ p^(2 l)) \, wide R_l arrow.r R_(l + 1) . $ <h3:co:root-torsors>]

Here the transition on the torsors is multiplication by $p$.
  The group $H$ commutes with translations, and $J$ conjugates them by continuous constant automorphisms.
  These assertions concern the finite flat torsors, not just their geometric points.
  In particular, their radicial rank $p^(2 l)$ is retained under the separable connected-marking extension.
  Before perfection, 8 gives the regular finite algebras of this rank,
  and 15 identifies their generator-lift algebra after the separable base change.

#thm([Lemma 6.5.])[
  (Distribution parameter).  #emph[After a finite enlargement of $k$,
    the inverse-limit distribution algebra of (6.6) is $k \[ \[ D \] \]$,
    with a parameter $D$ having the following properties.]
  + #emph[It acts $L$-linearly and locally nilpotently on $R$. For every $i gt.eq 0$,
$ ker \( D^(p^i) : R arrow.r R \) = L^(1 \/ p^i) . $

 It is surjective, and $D^(p^i - 1) : L^(1 \/ p^i) arrow.r L$ is nonzero on every factor.]
  + #emph[It commutes with $H$. Its residual $mu_(p - 1)$-character is $chi \( u \) = u^(s_(upright("dist")))$,
    where $s_(upright("dist")) in { 1 \, - 1 }$. Thus
#[#set math.equation(numbering: n => "(6.7)")
 $ 0 arrow.r L arrow.r R arrow.r^D R \( chi^(- 1) \) arrow.r 0 $ <h3:co:distribution-sequence>]

 is an exact sequence of $H'$-modules.]
  + #emph[If $q = p^i$, where $i$ is even and divisible by $\[ k : bb(F)_p \]$, then
#[#set math.equation(numbering: n => "(6.8)")
 $ D \( f^q \) = \( D^q f \)^q \, wide D^q \( z^(1 \/ q) \) = \( D z \)^(1 \/ q) . $ <h3:co:frobenius-distribution>]

 In particular $D^q$ is $L^(1 \/ q)$-linear.]
  + #emph[On any complete finite separable and root stage these operators are continuous after passage to a larger
    such stage. Each target stage admits a continuous additive right inverse of $D$ with values in one larger
    stage. Therefore (6.7) is exact on the filtered continuous cochain complexes, with profinite parameters.]
] <h3:co:distribution>

#proof[
  The Cartier dual of the height-two, dimension-one Honda group is again connected of height two and dimension
    one. Indeed, on the Honda model $Phi^2 = \[ p \]$, so duality gives $V^2 = \[ p \]$ on its dual.
    Together with $Phi V = \[ p \]$, cancellation on the divisible group gives $Phi = V$;
    thus each finite dual torsion kernel is killed by a Frobenius iterate and is connected.
    The dimension formula and formal-group construction in #cite(label("Tate1967PDivisible")) Section 2.2,
    Proposition 1, and Section 2.3, Proposition 3 give dimension one and a power-series coordinate,
    already over $bb(F)_p$. No identification with a chosen coordinate law on the original Honda group is needed.
    A parameter on the dual identifies the finite distribution algebra with
  $ cal(O) \( Gamma_2 \[ p^l \] \)^(*) = k \[ D \] \/ \( D^(p^(2 l)) \) . $
  The duals of the torsor transition maps are the inclusions of the dual torsion kernels.
    Their restriction maps give the inverse limit $k \[ \[ D \] \]$.
  After a faithfully flat trivialization of a torsor, its functions form the dual regular module of this truncated
    polynomial ring. The pairing given by the coefficient of $D^(p^(2 l) - 1)$ in a product is perfect,
    so that module is one regular nilpotent block. Ranks descend under faithful flatness.
    Consequently the kernel of $D^e$ on $R_l$ has rank $e$ over $L$ for $1 lt.eq e lt.eq p^(2 l)$.
  For $q = p^i$, the formal-group coproduct satisfies
  $ Delta \( D^q \) in \( D^q ⊗ 1 \, 1 ⊗ D^q \) . $
  The module-algebra identity therefore makes $ker D^q$ a subalgebra.
    On a field factor it is an intermediate field of degree $q$.
    The element $y$ is a $p$-basis of $K$ and remains a $p$-basis after separable extension:
    if $E \/ K$ is finite separable, then $\[ E : E^p \] = \[ K : K^p \] = p$,
    and $y in.not E^p$ because a separable extension contains no nontrivial purely inseparable subextension of
    $K$. An intermediate field of degree $q$ in $E^(1 \/ p^(2 l)) \/ E$ lies in $E^(1 \/ q)$,
    since every element has purely inseparable degree at most $q$; equality follows from the degrees.
    Applying this on every factor and then passing to $L$ proves the kernel formula.
    The block calculation also proves nonvanishing of the top operator.
    In a larger block the old kernel is contained in the image of $D$, which proves surjectivity on $R$.
  By 15, a full reduced-norm unit $u$ rescales the normalized étale generator by $u$ or $u^(- 1)$.
    On the fixed connected framing cover this conjugates translations by the corresponding scalar automorphism.
    Cartier duality preserves scalar multiplication, so the dual tangent character is $chi \( u \) =
    u^(s_(upright("dist")))$ with $s_(upright("dist")) = plus.minus 1$.
    Since $H$ acts trivially on translations, this is an action of the quotient $H' \/ H$,
    whether or not that quotient has a subgroup section. Starting with a parameter $D_0$, replace it by
  $ D = frac(1, p - 1) sum_(u in mu_(p - 1)) chi \( u \)^(- 1) u \( D_0 \) . $
  Its linear term is the linear term of $D_0$, and it is an eigenparameter.
    This proves the second assertion, including the inverse twist on the target of (6.7).
  For the Frobenius assertion, the Honda model over $bb(F)_p$ satisfies $Phi^2 = \[ p \]$.
    On the full divisible group, $V Phi = \[ p \] = Phi^2$; cancellation of the faithfully flat epimorphism $Phi$
    gives $V = Phi$. Cartier duality exchanges the two operators.
    For the stated even $i$, their $i$th iterates are $\[ p^(i \/ 2) \]$.
    To make the scalar and duality conventions explicit, put $A_l =
    cal(O) \( Gamma_2 \[ p^l \] \)$ and pair it with its finite dual by $chevron.l b \, xi chevron.r =
    xi \( b \)$. Since $q$ fixes $k$, Cartier-dual naturality for the $i$th relative Frobenius reads
  #[#set math.equation(numbering: n => "(6.9)")
   $ chevron.l b^q \, D chevron.r = chevron.l b \, \( V^i \)^(*) D chevron.r = chevron.l b \,
     D^q chevron.r . $ <h3:co:frobenius-dual-pairing>]
  For the second equality, choose an $bb(F)_p$-coordinate $t$ on the Cartier dual, which descends to $bb(F)_p$.
    Tame averaging leaves $D = sum_n c_n t^n$ defined over $k$, and hence $\( V^i \)^(*) D = sum_n c_n t^(n q) =
    D^q$ because $c_n^q = c_n$. Here multiplication in the distribution algebra corresponds to composition of
    operators. If a finite torsor coaction is written $rho \( f \) = sum_j f_j ⊗ b_j$, (6.9) therefore gives
  $ D \( f^q \) = sum_j f_j^q D \( b_j^q \) = sum_j f_j^q D^q \( b_j \) = (sum_j f_j D^q \( b_j \))^q . $
  The last equality uses $q$-power invariance of the constants.
    The coefficients $f_j$ retain their $q$th powers throughout;
    this finite Hopf-coaction calculation requires no splitting of the torsor. This proves (6.8).
    If $a in L^(1 \/ q)$, apply it to $a f$ and use $a^q in L$ and $L$-linearity of $D$ to obtain $D^q \( a f \) =
    a D^q f$. The cancellation above was on a divisible group; no cancellation on a finite torsion kernel has been used.
  On a fixed root level only finitely many powers of $D$ act.
    In the basis of successive fractional powers of the $p$-basis $y$,
    their matrices have finitely many coefficients in $L$, and these lie in one finite separable stage.
    The resulting matrices between finite-dimensional spaces over complete local fields are continuous.
    To construct a right inverse on a stage, choose a $D$-preimage of each member of its finite field basis and
    put those preimages in one larger complete separable/root stage.
    Linear extension gives a continuous additive section. The kernel at a finite stage has the required subspace
    topology; intersection with the separable union is that stage’s separable part,
    by uniqueness of purely inseparable roots. The cochain-exactness criterion preceding 34 proves the last
    assertion. All of these arguments are factorwise for a finite product, with finitely many choices at each stage. ◻
]

The injection of $L$ into the filtered completed coefficient algebra, together with degree zero of (6.2), gives

#[#set math.equation(numbering: n => "(6.10)")
 $ L^H = k . $ <h3:co:fixed-constants>]

Indeed an invariant element belongs to an $H$-stable finite stage; completion injects on its invariants,
  and filtered degree-zero cohomology of the target is exactly $k$.

The $p$-basis calculation also identifies ordinary and continuous differentials:
  on a factor $kappa \( \( s \) \)$ both are freely generated by $d s$,
  since derivations kill $p$th powers and the constant field is perfect.
  Thus Cartier below is the intrinsic field operator, with its usual continuous Laurent-series formula.

Let $eta$ be the nowhere vanishing differential of 16. It is defined at a finite separable stage and is
  $H$-invariant. The canonical-line and conormal identifications used there give, on this slice,

$ Omega_(K \/ k)^1 tilde.equiv omega_K^(⊗ \( p + 2 \)) \[ det \] . $

The connected marking trivializes $omega_L$, and the full norm kernel fixes the determinant factor.
  We write $upright("Car")$ for Cartier on differentials and set

#[#set math.equation(numbering: n => "(6.11)")
 $ cal(C) \( f \) = frac(upright("Car") \( f eta \), eta) . $ <h3:co:cartier-definition>]

This is the coheight-one Cartier operator. It is distinct from the ordinary root projection $cal(P)$ of 8.

#thm([Lemma 6.6.])[
  (Cartier and distribution traces).  #emph[For every $i gt.eq 1$, put $q = p^i$.
    There exists $c_i in k^times$ such that
#[#set math.equation(numbering: n => "(6.12)")
 $ D^(q - 1) \( f^(1 \/ q) \) = c_i cal(C)^i \( f \) wide \( f in L \) . $ <h3:co:cartier-distribution-trace>]

 In particular,
#[#set math.equation(numbering: n => "(6.13)")
 $ cal(C) \( f^p \) = 0 . $ <h3:co:cartier-frobenius-zero>]

 At every finite separable stage $B$ containing $eta$ there is an exact sequence of continuous $bb(F)_p \[ H \]$-modules
#[#set math.equation(numbering: n => "(6.14)")
 $ 0 arrow.r B arrow.r^(upright("Fr")) B arrow.r^(d \/ eta) B arrow.r^(cal(C)) B arrow.r
   0 . $ <h3:co:cartier-four-term>]

 Here and throughout this section, $upright("Fr") \( f \) = f^p$ is coefficient $p$-Frobenius.
   The ordinary-stratum argument in 8 separately fixes a $q$-power operator.
   The two short exact factors of (6.14) admit continuous additive sections onto their images. Under the residue pairing
#[#set math.equation(numbering: n => "(6.15)")
 $ chevron.l f \, g chevron.r_B = sum_j "Tr"_(kappa_j \/ bb(F)_p) "Res"_(s_j) \( f g eta \) \, wide B =
   product_j kappa_j \( \( s_j \) \) \, $ <h3:co:residue-pairing>]

 the $H$-action is isometric and $chevron.l cal(C) f \, g chevron.r_B = chevron.l f \, g^p chevron.r_B$.]
] <h3:co:cartier-trace>

#proof[
  The functional $I_i \( f \) = D^(q - 1) \( f^(1 \/ q) \)$ takes values in $L$, is nonzero on every factor,
    is $H$-equivariant, and satisfies $I_i \( a^q f \) = a I_i \( f \)$.
    The same semilinearity and equivariance hold for $cal(C)^i$. The Cartier pairing gives an isomorphism
  #[#set math.equation(numbering: n => "(6.16)")
   $ upright("Fr")_(*)^i L arrow.r "Hom"_L \( upright("Fr")_(*)^i L \, L \) \, wide
     b mapsto #scale(x: 120%, y: 120%)[\[] f mapsto cal(C)^i \( b f \) #scale(x: 120%, y: 120%)[\]] .
     $ <h3:co:perfect-cartier-pairing>]
  Here $a$ acts on $upright("Fr")_(*)^i L$ as multiplication by $a^q$.
    For a field factor, both sides have dimension $q$; the map is injective,
    since for $b eq.not 0$ one can choose $z$ with $cal(C)^i \( z \) eq.not 0$ and evaluate at $b^(- 1) z$.
    This proves the isomorphism on products and separable filtered unions as well;
    equivalently it is the perfect coefficient-extraction pairing in the common $p$-basis.
    Thus there is a unique multiplier $b_i$ with $I_i \( f \) = cal(C)^i \( b_i f \)$.
    It is a unit because both functionals are nonzero on every field factor.
    Equivariance and uniqueness give $b_i in L^H = k$, by (6.10). Semilinearity gives (6.12), with $c_i = b_i^(1 \/ q)$.
  This comparison applies in particular when $i = 1$; it does not require the even-iterate identity (6.8).
    Since $D$ kills $L$, it yields $c_1 cal(C) \( f^p \) = D^(p - 1) f = 0$, proving (6.13).
    The latter is therefore a consequence of the invariant torsor and differential,
    not an identity for an arbitrary normalization of Cartier.
  On a factor $kappa \( \( s \) \)$ the logarithmic Laurent formula is
  #[#set math.equation(numbering: n => "(6.17)")
   $ upright("Car") #h(-0.16667em) (sum_n a_n s^n frac(d s, s)) =
     sum_n a_(p n)^(1 \/ p) s^n frac(d s, s) . $ <h3:co:cartier-laurent>]
  It proves continuity and surjectivity. The kernel consists of the forms whose coefficients in indices divisible
    by $p$ vanish; a continuous additive primitive is $sum_(p divides.not n) \( a_n \/ n \) s^n$.
    The kernel of $d$ is $B^p$, and its root map is continuous.
    A continuous section of Cartier sends $sum_n a_n s^n d s \/ s$ to $sum_n a_n^p s^(p n) d s \/ s$.
    Multiplication or division by the fixed nonzero $eta$ transports these sections to (6.14).
    The maps themselves are $H$-equivariant because $eta$ is invariant and Cartier is intrinsic.
  Residue is invariant under change of uniformizer. The sum of finite field traces is preserved by residue-field
    automorphisms and factor permutations. This proves $H$-invariance of (6.15).
    Finally, $"Res" upright("Car") \( alpha \) = \( "Res" alpha \)^(1 \/ p)$ and $g upright("Car") \( alpha \) =
    upright("Car") \( g^p alpha \)$. The finite-field trace is unchanged by $p$th roots.
    Applying these identities to $alpha = f eta$ proves the transposition formula. ◻
]

#thm([Lemma 6.7.])[
  (Good finite stages).  #emph[There is a cofinal family of normal open subgroups $U subset J$ such that, for $B =
    B_U$, the differential $eta$ is defined over $B$, there is $theta in B^(1 \/ p)$ with $D theta = 1$, and
#[#set math.equation(numbering: n => "(6.18)")
 $ sigma \( D \) - D in D^(p + 2) k \[ \[ D \] \] wide \( sigma in U \) . $ <h3:co:good-jet>]

 The operator $D$ restricts continuously to $B^(1 \/ p)$. Writing $eta =
   h_j \( s_j \) d s_j \/ s_j$ on each field factor, the lattice
#[#set math.equation(numbering: n => "(6.19)")
 $ P_B = product_j h_j^(- 1) s_j kappa_j \[ \[ s_j \] \] $ <h3:co:positive-differential-lattice>]

 is compact, open, and preserved by $H$ and $cal(C)$. Its annihilator for (6.15) is $cal(O)_B$,
   and the annihilator of $cal(O)_B$ is $P_B$.]
] <h3:co:good-stages>

#proof[
  The nilpotent block on $L^(1 \/ p)$ puts $1$ in the image of $D$, so choose $theta$ there.
    The finite data $theta^p$ and $eta$ lie at a finite separable stage.
    The action of $J$ on the finite set of jets $k \[ \[ D \] \] \/ \( D^(p + 2) \)$ is continuous.
    Intersect their open stabilizers with any prescribed open subgroup and pass to a normal core.
    This proves cofinality and (6.18). For $f in B^(1 \/ p)$, $D^p f = 0$ and
  $ sigma \( D f \) - D f = \( sigma \( D \) - D \) f = 0 . $
  The kernel filtration and uniqueness of roots therefore put $D f$ in $\( L^(1 \/ p) \)^U = B^(1 \/ p)$.
    Its finite matrix over the complete stage proves continuity.
  The condition defining $P_B$ says that $f eta$ is an integral ordinary differential on each factor.
    That condition is independent of the uniformizer and is preserved by $H$.
    Formula (6.17) preserves strictly positive logarithmic order, proving Cartier stability.
    The annihilator statements follow coefficient by coefficient:
    an integral $g$ pairs trivially with all strictly positive logarithmic coefficients,
    while every pole of $g$ is detected by a suitable positive coefficient of $f eta$.
    Conversely every nonpositive coefficient of $f eta$ is detected by a monomial in $cal(O)_B$.
    Nondegeneracy of the finite-field trace makes these detections nonzero when needed. ◻
]

=== 6.3 Finiteness at the local-field stages <finiteness-at-the-local-field-stages>

We now use the distribution and Cartier operators to prove the missing finite-stage bound.
  The only finiteness assumed at this point is for the completed perfected fields.
  Compact residue duality first controls the stable Cartier image of a lattice;
  a separate Frobenius-kernel argument then forces the uncompleted field cohomology to be finite.

An order lattice in a finite product of local fields means a product of fractional powers of their maximal ideals.

#thm([Proposition 6.8.])[
  (Finite-stage finiteness).  #emph[Let $B = B_U$ be a good stage as in 38.
    For every $a gt.eq 0$, each of the following cohomology groups is finite:
$ H_(upright("cts"))^a \( H \, B \) \, wide H_(upright("cts"))^a \( H \, Lambda \) \, wide
  H_(upright("cts"))^a \( H \, B \/ Lambda \) \, $

 where $Lambda$ is any $H$-stable order lattice in $B$. The assertion holds at each finite root stage and for a
   coefficient line which has an $H$-invariant frame at a finite separable stage,
   with its order lattices and their quotients. In particular it holds for the periodicity and determinant lines
   used in this paper after choosing a sufficiently deep stage.]
] <h3:prop:finite-stage-finiteness>

We prove the proposition without assuming finite cohomology of the uncompleted fields.

#thm([Lemma 6.9.])[
  (Positive completed coefficients).  #emph[Let $B$ be a good stage.
    All $H_(upright("cts"))^a \( H \, B^b \)$ are finite, and
$ R Gamma_(upright("cts")) \( H \, \( B^b \)^(+ +) \) = 0 \, wide \( B^b \)^(+ +) = { f : v \( f \) > 0 } . $

 The cohomology groups of $cal(O)_(B^b)$ and $B^b \/ cal(O)_(B^b)$ are finite as well.]
] <h3:co:completed-positive>

#proof[
  The first assertion is the finite-stage statement of 30. Let $z$ be a continuous positive-valued $a$-cocycle.
    Compactness of $H^a$ supplies $epsilon > 0$ with $v \( z \) gt.eq epsilon$ on the entire cochain domain.
    Hence $z^(p^n) arrow.r 0$ uniformly. For $a > 0$, apply 34 to the complete coefficient complex,
    prescribing the open neighborhood of positive-valued $\( a - 1 \)$-cochains.
    A sufficiently high Frobenius power has a primitive $b$ in that neighborhood.
    Inverse Frobenius is a continuous additive automorphism of the completed perfect algebra and preserves
    positivity, so $b^(1 \/ p^n)$ is a positive primitive of $z$.
    For $a = 0$, the finite invariant group is discrete; the invariant elements $z^(p^n)$ tend to zero and are
    eventually zero. Injectivity of Frobenius then gives $z = 0$.
  The quotient of $cal(O)_(B^b)$ by its strictly positive ideal is the finite product of the residue fields of
    $B$. The two valuation-cutoff sequences are exact on cochains because their quotients are discrete.
    Their long exact sequences, the vanishing just proved, and finite cohomology of finite coefficients establish
    the last assertions. ◻
]

Fix a good $B$ and put

$ P = P_B \, wide M_a = H_(upright("cts"))^a \( H \, P \) \, wide X_a = H_(upright("cts"))^a \( H \, B \) \, wide
  f_a : M_a arrow.r X_a . $

The group $M_a$ is compact Hausdorff by 33. Since $B \/ P$ is countable discrete,
  the countability observation above and the cochain-exact lattice sequence give

#[#set math.equation(numbering: n => "(6.20)")
 $ ker f_a med upright("and") med "coker" f_a quad upright("are countable.") $ <h3:co:countable-kernel-cokernel>]

We first prove that every $X_a$ is countable. If $a$ were the largest degree where countability failed,
  the Cartier exact sequences would make $M_a \/ cal(C) M_a$ finite.
  The next two lemmas combine this bound with a finite stable Cartier image to control the Cartier kernel in
  $X_a$. Since $cal(C) upright("Fr") = 0$, the Frobenius image would then be countable;
  the following kernel estimate makes its kernel countable as well, a contradiction.
  Once every $X_a$ is countable, the comparison $f_a$ makes each compact $M_a$ finite.
  A second use of residue duality gives finite cohomology of the lattice quotient,
  and the lattice sequence then makes $X_a$ finite.

#thm([Lemma 6.10.])[
  (Finite stable Cartier image).  #emph[For every $a$, the subgroup
$ I_a = ⋂_(n gt.eq 0) cal(C)^n M_a $

 is finite.]
] <h3:co:stable-image>

#proof[
  The residue pairing and 38 give topological identifications
  #[#set math.equation(numbering: n => "(6.21)")
   $ P^or = B \/ cal(O)_B \, wide \( B \/ P \)^or = cal(O)_B . $ <h3:co:residue-duals>]
  A continuous functional on $P$ uses only finitely many Laurent coefficients and is represented by a finite
    principal part in the first quotient. An arbitrary functional on the discrete $B \/
    P$ is represented by a power series, which proves the second identification and its topology.
    The trace transposition in 37 and (6.4) identify the dual of the inverse system $\( M_a \, cal(C) \)$ with
  $ #scale(x: 120%, y: 120%)[\(] H_(upright("cts"))^(8 - a) \( H \, B \/ cal(O)_B \) \,
    upright("Fr") #scale(x: 120%, y: 120%)[\)] . $
  Its coefficient colimit is
  #[#set math.equation(numbering: n => "(6.22)")
   $ "colim"_(upright("Fr")) B \/ cal(O)_B = B^(upright("perf")) \/ cal(O)_(B^(upright("perf"))) =
     B^b \/ cal(O)_(B^b) . $ <h3:co:discrete-perfection-quotient>]
  At index $n$ the first map sends $f$ to $f^(1 \/ p^n)$. The second equality follows by approximating any
    completed element with integral error. All these quotients are discrete,
    so their continuous cochains commute with the colimit. By 40,
    the direct limit of the displayed cohomology system is finite.
    Compact–discrete duality shows that $"proj lim"_(cal(C)) M_a$ is finite.
  Its zeroth projection has image $I_a$. To prove surjectivity onto that intersection, fix $x in I_a$.
    For each $n$ there is a compatible length-$n$ chain of preimages ending at $x$.
    These conditions define nested nonempty closed subsets of the compact product $product_(n gt.eq 0) M_a$.
    Their intersection is an infinite compatible chain. Thus $I_a$ is an image of the finite inverse limit. ◻
]

#thm([Lemma 6.11.])[
  (A compact Cartier module).  #emph[Let $M$ be a compact Hausdorff $bb(F)_p$-vector space with a continuous
    endomorphism $C$. Suppose that $I = ⋂_n C^n M$ and $M \/ C M$ are finite.
    Then $C \( I \) = I$, the quotient $Q = M \/ I$ is a finitely generated $bb(F)_p \[ \[ t \] \]$-module with
    $t$ acting as $C$, and both $Q \[ C^oo \]$ and $ker \( C : M arrow.r M \)$ are finite.
    If a $C$-stable subgroup $N subset M$ has finite forward $C$-orbits elementwise, then $N$ is finite and
#[#set math.equation(numbering: n => "(6.23)")
 $ ⋂_n "im" \( C^n M arrow.r M \/ N \) = "im" \( I arrow.r M \/ N \) . $ <h3:co:stable-quotient>]

]
] <h3:co:compact-cartier>

#proof[
  For $x in I$, the sets $C^(- 1) \( x \) ∩ C^n M$ are nested nonempty compact sets, so they meet.
    This proves $C \( I \) = I$. The compact images $C^n Q$ have intersection zero and shrink uniformly to zero:
    otherwise their intersections with the complement of a fixed open neighborhood would be nested nonempty
    compact sets. Therefore $sum_(n gt.eq 0) a_n C^n x$ converges for every formal power series $sum a_n t^n$,
    uniformly in the tails, and defines an $bb(F)_p \[ \[ t \] \]$-action on $Q$.
  Lift a finite basis of $Q \/ C Q$ to $e_1 \, dots.h \, e_s$. Repeatedly expressing an element modulo $C Q$ gives
  $ x = sum_(i = 1)^s sum_(j = 0)^(N - 1) a_(i j) C^j e_i + C^N x_N . $
  The remainder tends uniformly to zero. Taking the limit expresses $x$ as a sum of $s$ power-series multiples of
    the $e_i$. The structure theorem over the discrete valuation ring $bb(F)_p \[ \[ t \] \]$ now writes $Q$ as a
    finite free module plus finitely many modules $bb(F)_p \[ \[ t \] \] \/ \( t^e \)$.
    Its $C$-power torsion and $C$-kernel are finite. The kernel on $M$ has kernel in $I$ and image in the kernel
    on $Q$, so it is finite too.
  The image in $Q$ of an element with finite forward orbit both tends to zero and belongs to a finite set;
    it is eventually zero. Thus the image of $N$ is in the finite group $Q \[ C^oo \]$,
    and its kernel lies in finite $I$. Hence $N$ is finite and closed.
    A coset meeting every $C^n M$ meets their intersection, by compactness of its nested intersections with those
    images. This proves (6.23). ◻
]

We record one algebraic consequence used in applying this lemma.
  Suppose $f : M arrow.r X$ commutes with $C$ and has countable kernel and cokernel.
  If $X \/ C X$ is countable, so is $M \/ C M$. Indeed, with $N = ker f$, $A = "im" f$, and $E = X \/ A$,
  the exact portions

$ N \/ C N arrow.r M \/ C M arrow.r A \/ C A arrow.r 0 \, wide ker \( C \| E \) arrow.r A \/ C A arrow.r X \/ C X $

prove the assertion. If $N$ and $ker \( C \| M \)$ are finite, then $ker \( C \| A \)$ is finite,
  by its exact sequence with $N \/ C N$, and $ker \( C \| X \)$ is countable since its remaining quotient embeds in $E$.

#thm([Lemma 6.12.])[
  (Frobenius-kernel bound).  #emph[If $⋂_n "im" \( cal(C)^n M_a arrow.r X_a \)$ is finite,
    then $ker \( upright("Fr") : X_a arrow.r X_a \)$ is countable.]
] <h3:co:frobenius-kernel>

#proof[
  For $a = 0$, Frobenius is injective. For $a > 0$, its kernel is the kernel of the inclusion into the root-stage
    cohomology under the $H$-equivariant homeomorphism $B^(1 \/ p) arrow.r B$.
    Consequently each kernel class has a presentation $\[ partial b \]$, where
  $ b in cal(B)_a := { b in C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ p) \) :
    partial b in C_(upright("cts"))^a \( H \, B \) } . $
  Put $w = D b$. It is a $B^(1 \/ p)$-valued cocycle because $D$ kills $B$. The quotient map
  $ cal(B)_a arrow.r C_(upright("cts"))^(a - 1) #scale(x: 120%, y: 120%)[\(] H \,
    B^(1 \/ p) \/ \( B^(1 \/ p) \)^(+ +) #scale(x: 120%, y: 120%)[\)] \, wide b mapsto D b med mod med + + \, $
  has countable target. Its kernel $cal(B)_a^(+)$ consists of presentations with positive-valued $w$ and has
    countable index. It suffices to put the classes presented by this kernel into the finite intersection in the
    hypothesis.
  Fix such a $b$, and let $i$ range through arbitrarily large positive integers divisible by two and by
    $\[ k : bb(F)_p \]$; put $q = p^i$. For $theta$ in 38, define
  $ b' = theta^(1 \/ q) w in C_(upright("cts"))^(a - 1) \( H \, B^(1 \/ \( p q \)) \) . $
  By (6.8), $D^q theta^(1 \/ q) = 1$, and $D^q$ is $L^(1 \/ q)$-linear.
    As $w in B^(1 \/ p) subset L^(1 \/ q)$, this proves $D^q b' = w$.
    Taking differentials and using the kernel formula gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ partial b' in C_(upright("cts"))^a \( H \, B^(1 \/ q) \) . $ <h3:co:primitive-root-level>]
  Here $b'$ is fixed by $U$, and $\( L^(1 \/ q) \)^U = B^(1 \/ q)$ by uniqueness of roots.
  We must also descend $D^(q - 1) b'$. For $sigma in U$ write $sigma \( D \) = D \( 1 + h_sigma \)$,
    with $h_sigma in D^(p + 1) k \[ \[ D \] \]$. Then
  $ sigma \( D \)^(q - 1) - D^(q - 1) in D^(q + p) k \[ \[ D \] \] . $
  The whole error kills $b'$, since $D^(q + p) b' = D^p w = D^(p + 1) b = 0$ and $D^p b = 0$.
    Local nilpotence makes each error series finite on the relevant stage.
    Thus $D^(q - 1) b'$ is $U$-fixed, and $D \( D^(q - 1) b' - b \) = 0$ proves that $D^(q - 1) b' -
    b$ is a $B$-valued cochain. For each $q$ all the operators act continuously after one finite-stage
    enlargement. The descended subspaces carry their valuation subspace topologies,
    so these descended cochains are continuous as well.
  Let $alpha_i = \( partial b' \)^q$. By (6.24), it is a $B$-valued cocycle. The descended difference and 37 give
  #[#set math.equation(numbering: n => "(6.25)")
   $ \[ partial b \] = \[ D^(q - 1) partial b' \] = c_i cal(C)^i \[ alpha_i \] quad
     upright("in ") X_a . $ <h3:co:kernel-deep-image>]
  Compactness gives a common $epsilon > 0$ with $v \( w \) gt.eq epsilon$. Because $H$ preserves valuations,
  $ v \( alpha_i \) gt.eq q epsilon + v \( theta \) . $
  This eventually exceeds the finitely many thresholds defining $P$.
    Hence $alpha_i$ is a $P$-valued cocycle for all sufficiently large admissible $i$.
    The scalar $c_i$ can be absorbed into the lattice: $c_i cal(C)^i \( alpha_i \) =
    cal(C)^i \( c_i^q alpha_i \)$ and $c_i^q P = P$. Equation (6.25) puts our class in a cofinal set of the
    decreasing images $f_a \( cal(C)^i M_a \)$, hence in their intersection.
    The subgroup $cal(B)_a^(+)$ has finite image and countable index, so the entire Frobenius kernel is countable. ◻
]

#proof[
  Suppose some $X_a$ were uncountable and choose the largest such $a$. It exists by the degree-eight bound in 33.
    Split (6.14) at $V = "im" \( d \/ eta \) = ker cal(C)$:
  $ 0 arrow.r B arrow.r^(upright("Fr")) B arrow.r V arrow.r 0 \, wide 0 arrow.r V arrow.r
    B arrow.r^(cal(C)) B arrow.r 0 . $
  The first sequence places $H_(upright("cts"))^(a + 1) \( H \, V \)$ between a quotient of $X_(a + 1)$ and a
    subgroup of $X_(a + 2)$, so this group is countable. The second embeds $X_a \/ cal(C) X_a$ into it.
    By (6.20) and the observation after 42, $M_a \/ cal(C) M_a$ is countable.
    It is compact Hausdorff since $cal(C) M_a$ is compact and closed.
    A countable compact Hausdorff group is finite: Baire applied to its singleton cover gives an isolated point,
    and a discrete compact group is finite.
  Apply 42 using the finite stable image from 41. To treat $N_a = ker f_a$,
    use its connecting presentation from $H_(upright("cts"))^(a - 1) \( H \, B \/ P \)$.
    A representing cochain has finite image, hence a uniform lower bound on the logarithmic orders of its
    differential coefficients. The identity
  $ cal(C)^n \( f \) eta = upright("Car")^n \( f eta \) $
  and (6.17) show that for sufficiently large $n$ all negative indices in that finite image disappear modulo $P$.
    Its iterate is therefore a cocycle in the finite, $H$- and $cal(C)$-stable module
  $ P \( 0 \) \/ P \, wide P \( 0 \) = product_j h_j^(- 1) kappa_j \[ \[ s_j \] \] . $
  Finite cohomology of this module and naturality of the connecting map show that every element of $N_a$ has
    finite forward Cartier orbit. For $a = 0$ the kernel is already zero.
    The compact-module lemma makes $N_a$ finite and gives
  $ ker \( cal(C) : X_a arrow.r X_a \) upright(" countable") \, wide ⋂_n f_a \( cal(C)^n M_a \) =
    f_a \( I_a \) upright(" finite") . $
  By (6.13), the Frobenius image in $X_a$ is countable. An uncountable group with countable image has uncountable
    kernel, contradicting 43.
  All $X_a$ are therefore countable. Equation (6.20) makes the compact $M_a$ countable, hence finite.
    Any $H$-stable order lattice is commensurable with $P$; intersecting the two lattices gives finite quotients.
    The associated long exact sequences prove finite cohomology for every such lattice, including $cal(O)_B$.
    By the second identification in (6.21) and (6.4),
  $ H_(upright("cts"))^a \( H \, B \/ P \)^or tilde.equiv H_(upright("cts"))^(8 - a) \( H \, cal(O)_B \) $
  is finite. Thus the quotient cohomology is finite, and the lattice sequence now proves finiteness of $X_a$
    itself. Other lattice quotients follow by commensurability.
  The homeomorphism $B^(1 \/ p^e) arrow.r B$, $f mapsto f^(p^e)$,
    is $H$-equivariant and $bb(F)_p$-linear and carries order lattices to order lattices.
    It proves the assertion for finite root stages. Finally, an $H$-invariant frame identifies a coefficient line
    at a sufficiently deep finite stage with $B$ as an $H$-module, and its lattices with order lattices.
    The connected marking supplies such a frame for every periodicity power;
    the full norm kernel fixes every determinant twist. Enlarging the good stage to contain finitely many frame
    coefficients proves the stated twisted assertion. ◻
]

=== 6.4 The natural completion comparison and the norm quotient <the-natural-completion-comparison-and-the-norm-quotient>

Finite cohomology is now known at every cofinal good field and root stage.
  This is the input needed to contract positive valuation cochains before comparing the algebraic and completed
  coefficient complexes. We then apply the residual norm characters to the resulting natural comparison.

#thm([Lemma 6.13.])[
  (Positive-order decompletion).  #emph[The inclusions induce a natural quasi-isomorphism
#[#set math.equation(numbering: n => "(6.26)")
 $ "colim"_(U \, e) C_(upright("cts"))^bullet \( H \, B_U^(1 \/ p^e) \) arrow.r^(med tilde.op med) "colim"_U
   C_(upright("cts"))^bullet \( H \, B_U^b \) . $ <h3:co:decompletion-map>]

 It retains the commuting actions and remains a quasi-isomorphism after forming continuous families parametrized
   by any profinite space.]
] <h3:co:decompletion>

#proof[
  Fix a good $B$. The positive order lattice $B^(+ +)$ has finite cohomology by 39.
    A positive-valued cocycle has a uniform positive valuation bound,
    so its Frobenius powers tend uniformly to zero. 34 makes each cohomology class eventually zero under
    Frobenius. Since the cohomology is finite, a single power in each degree kills every class.
  The homeomorphisms $B^(1 \/ p^e) arrow.r B$ identify inclusion of one positive root stage into the next with
    Frobenius. Their cochain colimit is therefore acyclic. The positive ideal in $B^b$ is acyclic by 40.
    Density gives an isomorphism of discrete coefficient modules
  $ B^(upright("perf")) \/ \( B^(upright("perf")) \)^(+ +) tilde.equiv B^b \/ \( B^b \)^(+ +) . $
  A continuous cochain to either quotient has finite image, whose values can be lifted at one root stage.
    Thus this is also an isomorphism of the prescribed quotient cochain complexes.
    Comparing the two valuation-cutoff exact sequences proves the quasi-isomorphism for this $B$.
    Passing through the cofinal good stages proves (6.26).
  Each finite root stage has finite cohomology by 39, and each completed stage has finite cohomology by 40.
    Apply 35 to their Polish cochain complexes and pass to the filtered colimits.
    It proves the assertion with any profinite parameter space.
    All comparisons used inclusions and valuation quotients, so their naturality retains all the indicated actions. ◻
]

#thm([Lemma 6.14.])[
  (The full norm weights).  #emph[On $H_(upright("cts"))^(*) \( H \, R \)$ the full residual norm quotient has the
    two characters in (6.2). The distribution target $R \( chi^(- 1) \)$ has no $H'$-cohomology,
    whereas $R Gamma_(upright("cts")) \( H' \, R \)$ is $k$ by its constants map.
    These assertions hold for every $p gt.eq 5$, without choosing a subgroup section of $H' arrow.r mu_(p - 1)$.]
] <h3:lem:full-norm-weights>

#proof[
  44 transports the actual residual actions in (6.2) to $R$.
    The quotient $H' \/ H$ has order prime to $p$, so its invariants functor is exact;
    the continuous Hochschild–Serre complex thus computes $H'$-cohomology by taking those invariants on
    $H$-cohomology. The untwisted characters are $0$ and $2 epsilon.alt$.
    Only the first is trivial modulo $p - 1$. After twisting by $chi^(- 1)$ the exponents are
  $ - s_(upright("dist")) \, wide 2 epsilon.alt - s_(upright("dist")) \, wide epsilon.alt \,
    s_(upright("dist")) in { 1 \, - 1 } . $
  They belong to ${ 1 \, - 1 \, 3 \, - 3 }$ and are nonzero modulo $p - 1 gt.eq 4$.
    Both target rows therefore vanish. In the source the invariant row is exactly the given constants row.
  The distinction from the center can be seen at $p = 7$. A central $a in mu_6 subset P_3$ has norm $a^3$,
    so pulling a norm-weight-two character to that central subgroup would make it trivial.
    Here the normalized étale generator transforms by the full norm unit $u$;
    the source weight is $u^(plus.minus 2)$ and the twisted exponents are $plus.minus 1 \, plus.minus 3$,
    nontrivial modulo six. The reduced norm surjects on tame units,
    as follows from the residue-field norm $bb(F)_(p^3)^times arrow.r bb(F)_p^times$.
    Since $H$ acts trivially on the translation group and by inner automorphisms trivially on its own cohomology,
    all residual actions used here factor through the quotient itself.
    Neither the eigenparameter construction nor the invariants calculation requires it to split inside $P_3$. ◻
]

#proof[
  The distribution sequence (6.7) is exact on the specified continuous cochain complexes.
    By 45, its last term has zero $H'$-cohomology, and its middle term is computed by constants.
    Thus its first term is also computed by the actual constants map, proving (6.3).
    The finite-stage $H'$-cohomology is finite by 39 and exact tame invariants.
    35 proves the parameterized assertion. Although a choice of $D$ was used to prove the comparison,
    the resulting quasi-isomorphism is the original constants inclusion.
    Its naturality therefore retains the connected-frame action and the remaining height-three action. ◻
]

=== 6.5 Descent to base fields and base lattices <descent-to-base-fields-and-base-lattices>

The ordinary-stratum argument needs finiteness on the coheight-one #emph[base lattices],
  including all conormal and periodicity twists. We give descent separately for fields and for lattices;
  the latter does not divide by a possibly ramified Galois degree.

#thm([Lemma 6.15.])[
  (Continuous field descent).  #emph[For every profinite space $T$, the natural augmentation is a quasi-isomorphism
#[#set math.equation(numbering: n => "(6.27)")
 $ C \( T \, K \) arrow.r "colim"_U C_(upright("cts"))^bullet #scale(x: 120%, y: 120%)[\(] J \,
   C \( T \, B_U \) #scale(x: 120%, y: 120%)[\)] . $ <h3:co:field-descent-map>]

 The same statement holds for a coefficient line pulled back from $K$.
   These comparisons are natural in $T$ and equivariant for the commuting $P_3$-action.]
] <h3:co:field-descent>

#proof[
  For fixed normal open $U$, set $W_U = C \( T \, B_U \)$ with its uniform topology.
    The action on it factors through $J \/ U$. Compare locally constant $J$-cochains, viewing $W_U$ as discrete,
    with continuous $J$-cochains for its given topology. A fixed finite-projective
    $bb(F)_p \[ \[ J \] \]$-resolution from 33 computes both.
    Their Hom complexes are the same underlying finite summands of powers of $W_U$:
    every module map factors through the finite-dimensional quotient of a resolution term by the augmentation
    ideal of $U$, and is continuous with either topology. The canonical inclusion of the two bar-cochain complexes
    is consequently a quasi-isomorphism.
  After taking the colimit over normal open subgroups, every locally constant cochain,
    its finite clopen partition, and its finitely many values are represented at one finite quotient.
    Refining $U$ if necessary gives an equality of complexes
  $ "colim"_U C_(upright("lc"))^bullet \( J \, W_U \) = "colim"_U C^bullet \( J \/ U \, W_U \) . $
  A finite topological $K$-basis of $B_U$ gives $W_U = B_U ⊗_K C \( T \, K \)$.
    The normal-basis theorem for the finite Galois étale algebra $B_U \/ K$ makes this a coinduced $J \/
    U$-module. The finite-group cochain complex of a coinduced module has zero positive cohomology:
    its bar contraction is evaluation in the induced function coordinate.
    Its invariants are exactly $C \( T \, K \)$. Thus the canonical augmentation is a quasi-isomorphism at each
    finite quotient. Exactness of the filtered colimit proves (6.27).
  For a pulled-back coefficient line, tensor the finite-basis and normal-basis argument with that line over $K$.
    All choices were used only to prove exactness. The comparison maps themselves are the canonical augmentations,
    hence are natural and retain the commuting action. This proof makes no claim about cochains into the metric
    union $L$. ◻
]

#thm([Corollary 6.16.])[
  (Base lattice finiteness).  #emph[Let $cal(L)$ be a coefficient line over $K$ whose pullback to $L$ has an
    $H$-invariant frame at a finite stage. Suppose that $Lambda subset
    cal(L)$ is a $P_3$-stable order lattice over $k \[ \[ y \] \]$. Then
$ H_(upright("cts"))^a \( P_3 \, Lambda \) quad upright("and") quad H_(upright("cts"))^a \( H \, Lambda \) $

 are finite for every $a$. This applies to every periodicity power, every finite determinant character,
   their inverses, and their products with conormal or canonical-line twists.
   In particular each adjacent $x$-pole strip used in 8 has finite $P_3$-cohomology.]
] <h3:co:base-lattices>

#proof[
  Choose a sufficiently deep good normal stage $B = B_U$ containing the frame and put $Q = J \/ U$.
    Let $cal(O)_B$ be its integral closure lattice and set
  $ M = cal(O)_B ⊗_(k \[ \[ y \] \]) Lambda . $
  The actions of $H$ and $Q$ commute and $M^Q = Lambda$. In the $H$-invariant frame,
    $M$ is an $H$-stable order lattice at the stage $B$, so 39 gives finite $H$-cohomology for it.
  For $b > 0$, $H^b \( Q \, M \)$ is a finite group. To see this without averaging,
    the finite-group cochain terms are finitely generated modules over $k \[ \[ y \] \]$.
    Their cohomology is finitely generated as well. Inverting $y$ commutes with that cohomology and gives zero in
    positive degrees by normal-basis descent on the field algebra.
    Hence $H^b \( Q \, M \)$ has finite length over $k \[ \[ y \] \]$, whose residue field is finite.
    The finite group boundaries are compact and closed, so these finite cohomology groups have their discrete
    quotient topology and continuous $H$-action.
  Use the bounded finite-projective $H$-resolution together with the finite-$Q$ bar complex on $M$.
    Taking $H$-cohomology first gives finite groups $H^i \( Q \, H_(upright("cts"))^j \( H \, M \) \)$ in every
    bidegree, hence finite total cohomology in every degree. Taking $Q$-cohomology first gives
  $ E_2^(a \, b) = H_(upright("cts"))^a \( H \, H^b \( Q \, M \) \) . $
  All rows with $b > 0$ are finite by 33. The bottom term $E_2^(a \, 0) =
    H_(upright("cts"))^a \( H \, Lambda \)$ has no outgoing differential and only finitely many incoming
    differentials, each with finite image. Its surviving quotient is finite because the total cohomology is
    finite. Thus it is finite. These two spectral sequences compute the same first-quadrant complex:
    finite projective Hom is exact on the compact $Q$-cycle and boundary sequences,
    and the finite $Q$-cochain functors are finite products. No strictness assertion about the still unknown
    base-lattice cohomology was used.
  Finally $P_3 \/ H = bb(Z)_p^times$ has finite cohomology on finite discrete modules:
    take exact invariants for $mu_(p - 1)$ and the two-term resolution for $1 + p bb(Z)_p$.
    The continuous Hochschild–Serre sequence for $H subset P_3$ now proves finite $P_3$-cohomology of $Lambda$.
    The residual action on its finite $H$-cohomology is continuous,
    since the coefficient lattice is compact and the finite-resolution cohomology has the quotient topology.
  The connected marking trivializes all periodicity powers and the full norm kernel fixes determinant characters.
    The canonical-line and conormal identifications express the other indicated lines as products of these.
    An adjacent $x$-pole strip is a power-series lattice in $y$ with precisely one such conormal and
    coefficient-line twist. It therefore satisfies the hypotheses just proved. ◻
]

#prodef([Remark 6.17.])[
  (Finite constant fields).  Finite enlargement of $k$ does not lose either these finiteness statements or the
    natural comparison maps. Scalar extension of a coefficient module, of each order lattice,
    or of each continuous cochain complex is a finite direct sum in its given topology.
    The continuous trace-one contraction of 7 makes the associated semilinear Galois complex acyclic in positive
    degrees; its invariants are the original coefficient complex.
    This remains true with profinite parameters, because finite scalar extension commutes with continuous
    functions and the contraction consists of finite sums. For the original extended stabilizer one retains the
    finite coefficient Galois action on the Honda stabilizer as well;
    the equivariant augmentations give the corresponding semidirect-product descent.
    Thus constants, units, line twists, and base lattice finiteness descend to the original coefficient field.
    No division by the constant-field extension degree is involved.
] <h3:co:constant-descent>

== 7 Exact descent and the height-two map <h3:sec:descent>

The coheight-one coefficient comparison first gives two actual maps at height two:
  the unit and the determinant class. We then use those maps in the finiteness argument needed for the ordinary
  comparison. Throughout these sections $p gt.eq 5$. Put $U = u^(- 1)$, so that $\| U \| = 2$ and $v_1 = x U^(p - 1)$.

=== 7.1 Relative descent and exact functors <relative-descent-and-exact-functors>

The tests below are applied to already formed, completed Morava cooperation spectra.
  Their preservation of descent is a finite categorical statement, which we establish first.
  We then identify the relative cooperation terms and their actual cofaces.
  A commutative algebra is #emph[descendable] if the unit belongs to the thick tensor ideal it generates.

#thm([Lemma 7.1.])[
  (Exact Amitsur descent).  #emph[Let $cal(C)$ be a stable symmetric monoidal $oo$-category with limits and with
    tensor product exact in each variable. Let $E$ be a descendable commutative algebra,
    write $upright(bold(1))$ for the unit, and put $I_E = "fib" \( upright(bold(1)) arrow.r E \)$.
    For its full Amitsur object $C^q = E^(⊗ \( q + 1 \))$, the partial totalization
$ "Tot"_s C^bullet = lim_(\[ q \] in Delta_(lt.eq s)) C^q $

 is a finite cubical limit. Its augmentation fiber, including its map to the unit, is
#[#set math.equation(numbering: n => "(7.1)")
 $ #scale(x: 120%, y: 120%)[\(] "fib" \( upright(bold(1)) arrow.r "Tot"_s C^bullet \) arrow.r
   upright(bold(1)) #scale(x: 120%, y: 120%)[\)] tilde.eq #scale(x: 120%, y: 120%)[\(] I_E^(⊗ \( s + 1 \)) arrow.r
   upright(bold(1)) #scale(x: 120%, y: 120%)[\)] . $ <h3:des:partial-amitsur-fiber>]

 The transition between successive fibers applies $I_E arrow.r upright(bold(1))$ to the last factor.
   There is an integer $N$ such that every composite of $N$ successive maps between these augmentation fibers is
   null. Every exact functor from $cal(C)$ to a stable category preserves the augmented totalization
   $upright(bold(1)) tilde.eq "Tot" C^bullet$ and this same null-composite bound.]
] <h3:lem:exact-amitsur>

#proof[
  Here $Delta_(lt.eq s)$ is the full simplex category on $\[ 0 \] \, dots.h \, \[ s \]$,
    so its limit includes the codegeneracies. Let $cal(P)_s^times$ be the finite poset of nonempty subsets of ${
    0 \, dots.h \, s }$. The functor
  $ theta_s : cal(P)_s^times arrow.r Delta_(lt.eq s) \, wide J mapsto \[ \| J \| - 1 \] \, $
  sends an inclusion to the order-preserving injection between the ordered subsets. It is initial for limits.
    To verify the cofinality criterion, fix $\[ q \]$, where $q lt.eq s$.
    An object of $theta_s arrow.b \[ q \]$ is a nonempty subset $J$ together with a weakly increasing map $J
    arrow.r { 0 \, dots.h \, q }$; its morphisms are extensions of these partial maps.
    Thus this comma category is the nonempty face poset of the simplicial complex $P \( s \, q \)$ whose simplices
    are the lists
  $ \( i_0 \, j_0 \) \, dots.h \, \( i_b \, j_b \) \, wide 0 lt.eq i_0 < dots.h.c < i_b lt.eq s \, quad 0 lt.eq
    j_0 lt.eq dots.h.c lt.eq j_b lt.eq q . $
  Its nerve is the barycentric subdivision of $P \( s \, q \)$.
  The complex $P \( s \, q \)$ is contractible whenever $s gt.eq q$. The base case $P \( 0 \, 0 \)$ is a point.
    For the induction, the simplices containing the vertex $\( s \, j \)$, together with their faces,
    form the cone on $P \( s - 1 \, j \)$. Start with the cone with apex $\( s \, q \)$ on $P \( s - 1 \, q \)$;
    this includes all simplices with first coordinates less than $s$ and is contractible even if its base is not.
    Attach the cones with apices $\( s \, j \)$, for $j = q - 1 \, dots.h \, 0$.
    The intersection of each such cone with the preceding union is exactly its base $P \( s - 1 \, j \)$:
    a simplex cannot contain two vertices with first coordinate $s$.
    Every attaching base is contractible by induction, since $j < q lt.eq s$ implies $j lt.eq s - 1$.
    These are inclusions of finite simplicial subcomplexes, hence cofibrations;
    attaching a cone along a contractible subcomplex preserves contractibility.
    This proves the claim, including the endpoint $q = s$, where no assertion about the contractibility of the
    initial base $P \( s - 1 \, s \)$ was used. The comma categories are therefore contractible,
    proving initiality of $theta_s$.
  It follows that $"Tot"_s C^bullet$ is the limit of the punctured finite $\( s + 1 \)$-cube
  $ J mapsto ⨂_(i = 0)^s cases(delim: "{", E \, & i in J \,, upright(bold(1)) \, & i in.not J \,) wide
    diameter eq.not J subset.eq { 0 \, dots.h \, s } \, $
  whose maps insert units. Successive fibers and exactness of tensor product identify its augmentation fiber as
    the arrow in (7.1). Omitting the last cubical direction gives the stated transition.
    Thus the model and its transition refer to full partial totalizations, not a coface-only truncation.
    An exact functor preserves this finite cubical limit. The finite-cube formula appears in
    #cite(label("MNN2017")) Proposition 2.14; the comparison with full partial totalizations and the augmentation
    fiber have been proved here in the stated setting.
  For a descendable $E$, the partial Amitsur tower represents the constant pro-object with value the unit
    #cite(label("Mathew")) Proposition 3.20. Its limit is preserved by every finite-limit-preserving functor
    #cite(label("Mathew")) Proposition 3.10. Together with the finite cubical comparison,
    this proves the asserted identification of the transformed totalization.
    There is also an integer $N$ such that every composite of $N$ maps which become null after tensoring with $E$
    is null #cite(label("Mathew")) Proposition 3.27. One can read this bound from a finite thick-ideal
    construction of the unit: it is one for $E$, is unchanged by retracts and tensor products,
    and adds across a cofiber sequence. The arrow $I_E arrow.r
    upright(bold(1))$ becomes null after tensoring with $E$: its tensor is the composite through the null map $I_E
    arrow.r E$, followed by multiplication. Thus the error transitions in (7.1) become null after tensoring with
    $E$, and their $N$-fold composites are null. An exact functor preserves those null composites,
    supplying the same convergence bound after applying the functor. ◻
]

#thm([Proposition 7.2.])[
  (Exact relative Morava descent).  #emph[Let $n gt.eq 1$, let $k$ be a finite field containing $F = bb(F)_(p^n)$,
    and let $R_(n \, k) = L_(K \( n \)) S_k$. In the $K \( n \)$-local category of $S_k$-modules,
    the algebra $E_n \( k \)$ is descendable over the unit $R_(n \, k)$.
    Write $hat(⊗)$ for the tensor product in this local category and put
$ cal(N)_n^q = E_n \( k \)^(hat(⊗)_(R_(n \, k)) \( q + 1 \)) wide \( q gt.eq 0 \) . $

 Its augmented Amitsur object totalizes to $R_(n \, k)$. Every exact functor from this local category to a stable
   category preserves that totalization and a uniform nilpotence bound for its error tower.
   In particular this applies to the inclusion in spectra followed by ordinary smash, a finite Moore quotient,
   a chromatic localization, or a monochromatic fiber.]
  #emph[There are identifications of graded rings
#[#set math.equation(numbering: n => "(7.2)")
 $ pi_(*) cal(N)_n^q tilde.equiv C_(upright("cts")) \( P_n^q \, E_n \( k \)_(*) \) \, $ <h3:des:relative-cooperations>]

 with the maximal-ideal topology on the coefficients. Under these identifications the actual cofaces and
   codegeneracies induce those of the continuous action cobar construction,
   and the augmented unit is the constant unit. Each $cal(N)_n^q$ is an ordinary $E_n \( k \)$-module through its
   first factor. This is the module structure used when an ordinary exact functor is applied to a term.]
] <h3:prop:exact-descent>

#proof[
  We begin with the standard coefficient field, keeping the scalar extension separate.
    Set $R_n = L_(K \( n \)) S$, $E_F = E_n \( F \)$, $Gamma_n = "Gal" \( F \/ bb(F)_p \)$, and $G_n^0 =
    P_n times.r Gamma_n$. The Hopkins–Ravenel theorem in the form of #cite(label("Mathew")) Theorem 4.18 says that
    $E_F$ generates the unit $L_n bb(S)_(\( p \))$ as a thick tensor ideal in the $E \( n \)$-local category.
    Applying the symmetric monoidal localization $L_(K \( n \))$ preserves this finite generation statement
    #cite(label("Mathew")) Corollary 3.21. The map $bb(S)_(\( p \)) arrow.r S$ is a mod-$p$ equivalence,
    hence a $K \( n \)$-equivalence for $n gt.eq 1$, so the resulting unit is $R_n$.
    The same localized base case is stated directly in #cite(label("Mathew")) Proposition 10.10 for Morava theory
    attached to a perfect residue field; the relative assertion still needs the following scalar step.
    Now base change along $R_n arrow.r R_(n \, k)$ inside the $K \( n \)$-local category. Thus
  $ B = E_F hat(⊗)_(R_n) R_(n \, k) $
  is descendable over $R_(n \, k)$.
  We identify one factor of this base change and prove that it is itself descendable.
    A $bb(Z)_p$-basis of $W \( k \)$ gives an equivalence $R_(n \, k) tilde.eq
    R_n^(or \[ k : bb(F)_p \])$ of underlying $R_n$-modules. More precisely, the natural map $R_n ⊗_S S_k arrow.r
    R_(n \, k)$ is an equivalence: its source is a finite sum of $K \( n \)$-local copies of $R_n$,
    and localizing the finite free decomposition of $S_k$ gives the same map.
    The natural scalar map therefore identifies the graded coefficient ring of $B$ with $E_(F \, *) ⊗_(bb(Z)_p)
    W \( k \)$; no infinite limit is interchanged with scalar extension here.
    The finite étale algebra of constants splits as
  #[#set math.equation(numbering: n => "(7.3)")
   $ W \( F \) ⊗_(bb(Z)_p) W \( k \) arrow.r^(med tilde.equiv med) product_(sigma : F arrow.r.hook k) W \( k \) \,
     wide a ⊗ b mapsto \( sigma \( a \) b \)_sigma . $ <h3:des:embedding-idempotents>]
  Let $e_sigma$ denote its embedding idempotents. Idempotent localization splits $B$ into the finite product of
    $B_sigma = B \[ e_sigma^(- 1) \]$: on homotopy groups the map to this product is the displayed
    orthogonal-idempotent decomposition, hence is an equivalence.
    Each factor is even periodic, with degree-zero ring $W \( k \) \[ \[ u_1 \, dots.h \, u_(n - 1) \] \]$.
    Its orientation is the universal Honda deformation after the indicated unramified base change.
    We may therefore take the factor for the chosen inclusion $iota :
    F subset.eq k$ as the model $E_n \( k \)$ used here.
  For $gamma in Gamma_n$, the Galois automorphism of the standard factor $E_F$,
    base changed with the identity on $R_(n \, k)$, is an $R_(n \, k)$-algebra automorphism of $B$.
    It permutes the idempotents by $e_sigma mapsto e_(sigma gamma^(- 1))$.
    In particular it identifies all the factors $B_sigma$ as $R_(n \, k)$-algebras while the second scalar action
    stays fixed. This is the factor equivalence being used; coefficient Frobenius on the chosen $E_n \( k \)$
    alone is semilinear over $W \( k \)$. The underlying module of $B$ is consequently a finite sum of modules
    equivalent to $E_n \( k \)$. The thick tensor ideal generated by $E_n \( k \)$ contains $B$,
    and the ideal generated by $B$ contains the unit. This proves descendability of the chosen factor.
  Apply 49 in the $K \( n \)$-local category of $S_k$-modules,
    with its local tensor product and unit $R_(n \, k)$. The inclusion into spectra is exact,
    as are the ordinary tests in the statement. The lemma therefore proves the asserted totalization and uniform
    error-tower bound for the relative Amitsur object and for each of those tests.
    We now keep the same $B$ and its embedding idempotents to identify the terms and maps of that object.
  It remains to prove (7.2) with its maps. The completed-cooperations theorem of Devinatz–Hopkins applies to the
    standard $E_F$ and the standard extended group $G_n^0$: #cite(label("DevinatzHopkins")) Proposition 2.2 and
    formulas (2.5)–(2.7) identifies
  $ pi_(*) #scale(x: 120%, y: 120%)[\(] E_F^(hat(⊗)_(R_n) \( q + 1 \)) #scale(x: 120%, y: 120%)[\)] tilde.equiv
    C_(upright("cts")) \( \( G_n^0 \)^q \, E_(F \, *) \) . $
  The tensor on the left is the $K \( n \)$-local tensor; with its local unit $R_n$ it is the completed smash
    appearing in that theorem. Base change gives a canonical equivalence of actual terms
  $ B^(hat(⊗)_(R_(n \, k)) \( q + 1 \)) tilde.eq E_F^(hat(⊗)_(R_n) \( q + 1 \)) hat(⊗)_(R_n) R_(n \, k) . $
  Because $R_(n \, k)$ is finite free over $R_n$, the preceding coefficient identification becomes
  #[#set math.equation(numbering: n => "(7.4)")
   $ pi_(*) #scale(x: 120%, y: 120%)[\(] B^(hat(⊗)_(R_(n \, k)) \( q + 1 \)) #scale(x: 120%, y: 120%)[\)]
     tilde.equiv C_(upright("cts")) \( \( G_n^0 \)^q \, E_(F \, *) \) ⊗_(bb(Z)_p) W \( k \) tilde.equiv
     C_(upright("cts")) \( \( G_n^0 \)^q \, B_(*) \) . $ <h3:des:basechanged-cooperations>]
  The last isomorphism uses a finite basis of $W \( k \)$, so it only commutes continuous functions with a finite
    direct sum.
  We spell out the coordinate convention because it controls the first coface and the field component.
    Write the action of $G_n^0$ on $B$ for its action on $E_F$ tensored with the identity on $R_(n \, k)$.
    In inhomogeneous coordinates the evaluation of a class in the left side of (7.4) at
    $\( g_1 \, dots.h \, g_q \)$ is induced by the actual multiplication map
  #[#set math.equation(numbering: n => "(7.5)")
   $ mu compose #scale(x: 120%, y: 120%)[\(] 1 accent(⊗ g, ̂)_1 hat(⊗) \( g_1 g_2 \) hat(⊗) dots.h.c
     hat(⊗) \( g_1 dots.h.c g_q \) #scale(x: 120%, y: 120%)[\)] : B^(hat(⊗)_(R_(n \, k)) \( q + 1 \)) arrow.r
     B . $ <h3:des:inhomogeneous-evaluation>]
  For $q = 0$ this is the identity. For $q gt.eq 1$, the evaluation in Devinatz–Hopkins applies $h_i^(- 1)$ to the
    first $q$ factors and leaves the last factor fixed. Put $h_i =
    g_i dots.h.c g_q$ and then apply $h_1$ to the value. This continuous change of variables gives exactly (7.5).
    Their natural evaluation formulas apply to every homotopy class,
    so this argument does not assume that products of factor coefficients generate the completed term.
  The projection $B arrow.r E_n \( k \) = B_iota$ is a unital algebra map.
    In degree $q$, the induced projection to $cal(N)_n^q$ is the all-$iota$ idempotent summand of the tensor
    product. Under (7.5), its projector acts on a function by multiplication by
  $ e_iota thin g_1 \( e_iota \) thin \( g_1 g_2 \) \( e_iota \) dots.h.c \( g_1 dots.h.c g_q \) \( e_iota \) . $
  The action of $Gamma_n$ on the embedding idempotents is free and transitive, and its kernel in $G_n^0$ is $P_n$.
    This product is $e_iota$ precisely when every $g_i$ lies in $P_n$, and is zero otherwise.
    Since $P_n^q$ is clopen in $\( G_n^0 \)^q$, the selected summand is exactly
    $C_(upright("cts")) \( P_n^q \, \( B_iota \)_(*) \)$. The $P_n$-action on the selected coefficient ring fixes
    its $W \( k \)$ scalars. This proves (7.2).
  The same evaluation maps identify all cobar maps. For a coefficient function $f$ in degree $q$, their formulas are
  $ \( d^0 f \) \( g_1 \, dots.h \, g_(q + 1) \) & = g_1 #scale(x: 120%, y: 120%)[\(]
    f \( g_2 \, dots.h \, g_(q + 1) \) #scale(x: 120%, y: 120%)[\)] \,\
\( d^i f \) \( g_1 \, dots.h \, g_(q + 1) \) & =
  f \( g_1 \, dots.h \, g_i g_(i + 1) \, dots.h \, g_(q + 1) \) &  & \( 1 lt.eq i lt.eq q \) \,\
\( d^(q + 1) f \) \( g_1 \, dots.h \, g_(q + 1) \) & = f \( g_1 \, dots.h \, g_q \) \,\
\( s^i f \) \( g_1 \, dots.h \, g_(q - 1) \) & =
  f \( g_1 \, dots.h \, g_i \, 1 \, g_(i + 1) \, dots.h \, g_(q - 1) \) &  & \( 0 lt.eq i < q \) . $
  They follow by inserting a unit or multiplying adjacent factors in (7.5).
    The unital projection from the $B$-Amitsur object to the $E_n \( k \)$-Amitsur object commutes with these
    maps. Thus its selected cofaces are obtained by projecting the actual cofaces and then restricting the
    displayed formulas to $P_n$. Their higher compatibilities are those of that actual Amitsur object.
    The augmented unit evaluates to the constant unit. The first coface is $R_(n \, k)$-linear and has the
    displayed varying stabilizer action on coefficients; the other cofaces and all codegeneracies are linear for
    the first-factor $E_n \( k \)$-module structures. This proves the claims about maps and naturality. ◻
]

The notation $C_(upright("cts")) \( P_n^q \, E_n \( k \) \)$ below refers to the actual term $cal(N)_n^q$,
  equipped with (7.2); it does not infer an equivalence of spectra from a coefficient isomorphism.
  The inclusion of the $K \( n \)$-local category in spectra is exact,
  but its tensor product is still the completed one. Only after forming a term do we regard it as an ordinary
  module and apply an ordinary exact functor.

We also record the finite-field descent, including its unit.
  For $tau in "Gal" \( k \/ bb(F)_p \)$, combine the standard automorphism $tau \|_F$ on $E_F$ with $tau$ on the
  second factor $R_(n \, k)$. On constants, evaluation at $iota$ sends $\( tau \|_F \) \( a \) ⊗
  tau \( b \)$ to $tau \( iota \( a \) b \)$. Consequently this combined action preserves $B_iota$,
  is semilinear over $W \( k \)$, and conjugates $P_n$ by the usual Honda action.
  It gives the coefficient-field action on the relative object just constructed and respects its augmentation and
  cofaces.

Let $Gamma = "Gal" \( k \/ bb(F)_p \)$. A normal-basis element $macron(a) in k$ has nonzero trace:
  otherwise the sum of its conjugates would be a nontrivial $bb(F)_p$-linear dependence.
  Lift it to $a_0 in W \( k \)$. The conjugates of $a_0$ are a $bb(Z)_p$-basis,
  since their determinant is a unit modulo $p$, and its trace is a unit.
  Replacing $a_0$ by $a = a_0 \/ "Tr" \( a_0 \)$ gives a normal basis with trace one. The map

$ "Ind"_1^Gamma S = or.big_(gamma in Gamma) S arrow.r S_k \, wide 1_gamma mapsto gamma \( a \) \, $

is a coherent $Gamma$-equivariant equivalence of underlying $S$-modules:
  it is the induced map adjoint to the class $a$, and it is an isomorphism on every homotopy group.
  The diagonal unit maps to $sum_gamma gamma \( a \) = 1$. Equivalently,
  under the induction–coinduction adjunction its invariant unit is the specified unit of $S_k$.
  Localizing gives the same statement for $R_n arrow.r R_(n \, k)$.

Let an exact functor be defined on the underlying $K \( n \)$-local $S$-modules,
  as are the inclusion followed by the ordinary tests used for spectral finiteness below.
  It preserves this finite sum, its action, and the diagonal map.
  Finite induction equals finite coinduction, so the homotopy fixed points of the transformed $R_(n \, k)$ recover
  the transformed $R_n$ and its specified unit. This argument does not require that the functor commute with an
  arbitrary homotopy limit. On coefficient cochains the trace-one averaging and contraction of 7 likewise give
  exact semilinear descent, even when $p$ divides $\| Gamma \|$. Finally, scalar extension is faithful:
  its underlying finite free module of positive rank detects a zero cofiber.

=== 7.2 The ordinary residue test <the-ordinary-residue-test>

#thm([Lemma 7.3.])[
  #emph[Put $tilde(A) = W \( k \) \[ \[ x \, y \] \]$, and let $Q$ be profinite.
    The module $C_(upright("cts")) \( Q \, tilde(A) \)$, for the $\( p \, x \, y \)$-adic topology,
    is pro-free and flat over $tilde(A)$. For every ordinary $E_3 \( k \)$-module $N_Q$ whose graded coefficient
    module is $C_(upright("cts")) \( Q \, \( E_3 \( k \) \)_(*) \)$,
    ordinary smash with $E_2 \( k \)$ over the $p$-local sphere $bb(S)_(\( p \))$ has homotopy
#[#set math.equation(numbering: n => "(7.6)")
 $ \( E_2 \( k \) \)_(*) E_3 \( k \) ⊗_(\( E_3 \( k \) \)_(*))
   C_(upright("cts")) \( Q \, \( E_3 \( k \) \)_(*) \) . $ <h3:des:ordinary-kunneth>]

 The first tensor factor in (7.6) denotes absolute ordinary cooperations over $bb(S)_(\( p \))$.
   This applies in particular to the actual term $N_Q = cal(N)_3^q$ for $Q = P_3^q$,
   with its first-factor module structure.]
] <h3:des:flat-functions>

#proof[
  For each power $frak(m)^a$ of $frak(m) = \( p \, x \, y \)$, coefficient reduction gives
  $ C_(upright("cts")) \( Q \, tilde(A) \) \/ frak(m)^a tilde.equiv
    C_(upright("lc")) \( Q \, tilde(A) \/ frak(m)^a \) . $
  Surjectivity follows by lifting on a finite clopen partition.
    For the kernel, partition the monomials in $p \, x \, y$ among the finitely many monomial generators of
    $frak(m)^a$; the resulting division operations on coefficients are continuous and write a kernel function as a
    sum of these generators times continuous functions. The right side is the filtered colimit of finite free
    modules associated to finite clopen partitions. It is flat over the Artinian local ring $tilde(A) \/ frak(m)^a$.
  Choose a basis of the residue module over $k$, lift the basis elements,
    and let $F$ be the free $tilde(A)$-module on those lifts.
    An element of $hat(F)$ is a family of coefficients for which, modulo each $frak(m)^a$,
    only finitely many are nonzero. Consequently $hat(F) \/ frak(m)^a$ is the free $tilde(A) \/
    frak(m)^a$-module on the chosen basis; continuous monomial division gives the kernel equality used here.
    The map $hat(F) arrow.r C_(upright("cts")) \( Q \, tilde(A) \)$ is an isomorphism modulo $frak(m)$.
    It is an isomorphism modulo every $frak(m)^a$: both modules there are flat,
    and successive nilpotent-ideal reduction proves injectivity and surjectivity.
    Taking the inverse limit proves pro-freeness. For the ordinary flatness conclusion, $tilde(A) =
    W \( k \) \[ \[ x \, y \] \]$ is a regular complete Noetherian local ring,
    and $frak(m) = \( p \, x \, y \)$ is generated by the minimal regular sequence $p \, x \, y$.
    The module $F$ is free, hence flat, and $F \/ frak(m) F$ is free over $tilde(A) \/ frak(m)$.
    Thus #cite(label("BarthelStapleton2016")) Proposition 3.13 applies and makes the ordinary $frak(m)$-adic
    completion $hat(F)$ flat. The pro-free characterizations are also described in #cite(label("HS99"))
    Theorem A.9 and Proposition A.13.
  Now use the ordinary module tensor identity
  $ E_2 \( k \) and N_Q tilde.eq \( E_2 \( k \) and E_3 \( k \) \) ⊗_(E_3 \( k \)) N_Q . $
  The module Künneth spectral sequence has no positive Tor terms by the flatness just proved.
    Periodicity reduces graded modules over this coefficient ring to parity-graded modules over the regular local
    ring $W \( k \) \[ \[ x \, y \] \]$, of global dimension three.
    A projective resolution of length at most three therefore gives bounded convergence of this Künneth
    calculation. This proves (7.6). ◻
]

#thm([Lemma 7.4.])[
  #emph[Let
$ overline(E)_2 = E_2 \( k \) \/ \( p \, u_1 \) . $

 Apply the ordinary relative tensor $overline(E)_2 ⊗_(S_k) \( - \)$ to the $K \( 3 \)$-completed Amitsur object
   for $E_3 \( k \)$. Its homotopy is even periodic. After using the test periodicity generator,
   the degree-zero coefficient in cosimplicial degree $q$ is
$ "colim"_B C_(upright("cts")) \( P_3^q \, B \) \, $

 where $B$ runs through the finite connected-marking algebras over $k \( \( y \) \)$ of 6.
   The cofaces give their actual $P_3$-action, and the test of the unit is the constant cochain.]
] <h3:des:residue-cooperations>

#proof[
  Before imposing the residue ideal, both Morava theories are Landweber exact over $B P$:
    the sequence $p \, u_1 \, dots.h \, u_(n - 1)$ is regular and the height-$n$ coefficient is a unit,
    and these facts are retained by finite unramified scalar extension.
    Landweber exactness gives the homology base-change formula for all spectra,
    as recalled in the introduction and Example 0.1(d) of #cite(label("HoveyStrickland")).
    Applying it first to $E_2 \( k \)_(*) \( E_3 \( k \) \)$,
    then to $E_3 \( k \)_(*) \( B P \)$ and using the symmetry of ordinary smash, gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ \( E_2 \( k \) \)_(*) E_3 \( k \) tilde.equiv \( E_2 \( k \) \)_(*) ⊗_(B P_(*)) B P_(*) B
     P ⊗_(B P_(*)) \( E_3 \( k \) \)_(*) . $ <h3:des:absolute-landweber-cooperations>]
  The two tensor products use the two unit maps of $B P_(*) B P$.
    The strict $p$-typical formal-law groupoid represented by $\( B P_(*) \, B P_(*) B P \)$,
    including its units and composition, is recalled in #cite(label("BhattacharyaEgger2019")) Section 2,
    Lemma 2.9 and the following discussion, p. 7. Naturality of the two multiplicative orientations identifies
    these base-changed operations with those of the oriented formal isomorphisms.
    This is an absolute ordinary cooperation calculation, which is precisely the first factor in (7.6).
  We also record the needed flatness over each coefficient factor.
    For a Landweber-exact $B P_(*)$-algebra $B$, #cite(label("HoveyStrickland")) Lemma 2.2 makes $B ⊗_(B P_(*)) B
    P_(*) B P$ flat for its other $B P_(*)$-action. Hopf-algebroid conjugation gives the analogous assertion for
    $B P_(*) B P ⊗_(B P_(*)) B$. Applying these two assertions with $B = \( E_2 \( k \) \)_(*)$ and
    $B = \( E_3 \( k \) \)_(*)$, and then base changing the remaining unit,
    proves that (7.7) is flat over either coefficient factor.
    Hence the sequence $\( p \, u_1 \)$ on the height-two factor acts regularly on these cooperations.
    Tensoring over the height-three factor with the flat module in 51 preserves that regularity.
    The two residue cofibers therefore create no odd homotopy in the absolute smash product.
  We next pass from this absolute residue calculation to the relative test in the statement. Let
  $ C = "cofib" \( bb(S)_(\( p \)) arrow.r S \) . $
  The completion map is a mod-$p$ equivalence, so $C \/ p = 0$.
    Thus multiplication by $p$ is invertible on $C$, and the $p$-local spectrum $C$ is rational.
    The spectrum $overline(E)_2$ is rationally acyclic, already after its first residue cofiber.
    Hence $overline(E)_2 and C = 0$. The unit map $overline(E)_2 arrow.r overline(E)_2 and
    S$ is an equivalence of spectra. Its composite with the action map $overline(E)_2 and S arrow.r
    overline(E)_2$ is the identity. The action map is therefore an equivalence of right $S$-modules.
    Consequently, for every $S$-module $N$, there is a natural equivalence
  #[#set math.equation(numbering: n => "(7.8)")
   $ overline(E)_2 and N tilde.eq \( overline(E)_2 and S \) ⊗_S N tilde.eq overline(E)_2 ⊗_S N .
     $ <h3:des:absolute-relative-residue>]
  For $S_k$-modules, the two scalar actions on the last object give an action of
  $ S_k ⊗_S S_k tilde.eq product_(sigma in "Gal" \( k \/ bb(F)_p \)) S_k . $
  The multiplication map $S_k ⊗_S S_k arrow.r S_k$ is projection to the identity factor.
    Indeed, balancing the two scalar actions is
  $ \( overline(E)_2 ⊗_S N \) ⊗_(S_k ⊗_S S_k) S_k tilde.eq overline(E)_2 ⊗_(S_k) N . $
  Thus the identity idempotent selects $overline(E)_2 ⊗_(S_k) N$.
    On the absolute residue coefficient algebra already calculated,
    this is the equal-embeddings summand of $k ⊗_(bb(F)_p) k tilde.eq product_sigma k$.
    It is a retract and therefore remains even. Applying this to $N =
    C_(upright("cts")) \( P_3^q \, E_3 \( k \) \)$ gives the required relative term.
    The comparison (7.8) and the identity idempotent are natural for $S_k$-linear maps.
    Every $P_3$-cobar coface is $S_k$-linear, so these identifications commute with all cofaces and with the
    constant unit. Regularity was needed only for the absolute calculation before the residue cut.
  In this identity summand, the coefficients are described by the formal-group-isomorphism Hopf algebroid over
    $k$. Under an isomorphism of formal groups the ideals $\( p \, v_1 \)$ agree on the two sides.
    Thus this cut is $p = x = 0$ on the height-three factor. The height-two $v_2$ is a unit,
    so $y$ is a unit as well. After fixing the test periodicity generator,
    the conversion from graded to ungraded coordinates retains the invertible leading coefficient of the
    isomorphism #cite(label("BhattacharyaEgger2019")) (2.10)–(2.11) and (2.15)–(2.16), pp. 7–9.
    For the oriented isomorphism used here, write $a T^(p^2)$ and $b
    T^(p^2)$ for the first nonzero terms of the two $p$-series and $r T$ for the linear term of the isomorphism.
    The equation intertwining the $p$-series gives $r a = b r^(p^2)$, or $r^(p^2 - 1) = a \/ b$.
    Both $a$ and $b$ are units, and $p^2 - 1$ is prime to $p$,
    so this is the finite étale equation identifying the nonzero height-two coefficients.
    The remaining equations are precisely the coefficients of an isomorphism from the specialized law to the Honda law.
  The finite connected-marking stages of Theorem 4.3, Proposition 4.6 represent these truncated equations.
    Their union represents the full isomorphism algebra; every polynomial in the cooperation coordinates belongs
    to a finite such stage. Thus the ordinary algebraic tensor product gives this algebraic union,
    without its valuation completion.
  It remains to check the parameter topology. Reduction of continuous power-series functions modulo $\( p \, x \)$
    gives continuous functions into $k \[ \[ y \] \]$: coefficient lifting proves surjectivity,
    and continuous monomial division by $p \, x$ identifies the kernel with $\( p \, x \)
    C_(upright("cts")) \( Q \, tilde(A) \)$. There is an equality
  #[#set math.equation(numbering: n => "(7.9)")
   $ C_(upright("cts")) \( Q \, k \[ \[ y \] \] \) \[ y^(- 1) \] =
     C_(upright("cts")) \( Q \, k \( \( y \) \) \) . $ <h3:des:compact-laurent>]
  Indeed, the image of compact $Q$ in the local field is bounded,
    so multiplication by one power of $y$ puts that image in $k \[ \[ y \] \]$.
    The reverse inclusion in (7.9) is immediate. A finite étale algebra over $k \( \( y \) \)$ is a finite product
    of finite-dimensional complete vector spaces over it; a basis gives the identical assertion at each finite
    marking stage. Consequently the final union is a colimit on continuous cochain complexes with a common stage
    for every compact family.
  Lastly, all the identifications were made in the isomorphism Hopf algebroid.
    Its composition law transports the tautological marking and is exactly the coface action.
    The identity arrow gives the constant test-unit. This proves the assertions about the maps,
    not just the coefficient modules. ◻
]

=== 7.3 The determinant map and the height-two basis <the-determinant-map-and-the-height-two-basis>

Choose once and for all a topological generator of $bb(Z)_p^times \/ mu_(p - 1)$,
  and let $c_(upright("det"))$ be the reduced-determinant logarithm normalized to send it to $1$.
  On the standard extended height-three stabilizer set $c_(upright("det")) \( g \, sigma \) =
  c_(upright("det")) \( g \)$ for $g in P_3$. The reduced norm is invariant under Galois conjugation,
  so this is a surjective continuous homomorphism to $bb(Z)_p$.
  Let $T^1$ be the Devinatz–Hopkins fixed-point spectrum for its kernel,
  and let $gamma$ represent the chosen generator in the residual quotient.
  Their Proposition 8.1 gives a fiber sequence with middle map $1 - gamma$ and first map the unit.
  Negating the target of the middle map gives the convention used here,

$ T arrow.r T^1 arrow.r^(gamma - 1) T^1 arrow.r^(partial_(+)) Sigma T . $

The first map stays the same; if $partial_(-)$ denotes the boundary in the $1 - gamma$ sequence,
  the resulting boundary is $partial_(+) = - partial_(-)$. By #cite(label("DevinatzHopkins")) Theorem 6 and
  Propositions 8.1–8.2, the boundary of the unit is an actual permanent degree-one class detected by $plus.minus
  c_(upright("det"))$. We determine its sign in our cobar convention locally.

We use the cochain differential $partial = d^0 - d^1$ in degree zero, so $\( partial b \) \( g \) = g b - b$.
  For the standard field $F = bb(F)_(p^3)$, #cite(label("DevinatzHopkins")) Theorem 2(i)–(ii) identifies the
  Morava module of $T^1$ with $C_(upright("cts")) \( bb(Z)_p \, E_(F \, *) \)$ and its Adams spectral sequence
  with continuous cohomology. Realize this module with the $T^1$ factor first and the test $E_F$ factor second.
  If $i : T^1 arrow.r E_F$ is the standard map and $h$ represents the coset with $c_(upright("det")) \( h \) = t$,
  its homogeneous evaluation is $"ev"_t = mu compose \( h^(- 1) i ⊗ 1 \)$.
  The $bb(Z)_p$-valued submodule $C_(upright("cts")) \( bb(Z)_p \, bb(Z)_p \)$ contains the unit and the lift
  needed below. Write $t$ for the coordinate with $c_(upright("det")) \( gamma \) = 1$.
  The actual evaluation formula gives two commuting actions: the residual action on the $T^1$ factor is

$ \( gamma_L f \) \( t \) = f \( t - 1 \) \, $

while the action induced by the other Morava factor is $\( g_R f \) \( t \) =
  g \( f \( t + c_(upright("det")) \( g \) \) \)$. On the $bb(Z)_p$-valued submodule used here this is simply

$ \( g_R f \) \( t \) = f \( t + c_(upright("det")) \( g \) \) . $

Indeed, equivariance of $i$ gives $"ev"_t compose \( gamma ⊗ 1 \) = "ev"_(t - 1)$,
  using $gamma^(- 1) h$ for the new representative, while $"ev"_t compose \( 1 ⊗ g \) = g compose
  "ev"_(t + c_(upright("det")) \( g \))$, using $h g$ for that representative.
  These are identities of the actual multiplication maps, and the $bb(Z)_p$ values have trivial coefficient
  action. Both displayed Morava modules are even, so completed Morava homology of the fiber sequence gives the
  exact coefficient sequence

$ 0 arrow.r E_(F \, *) arrow.r C_(upright("cts")) \( bb(Z)_p \, E_(F \, *) \) arrow.r^(D = gamma_L - 1)
  C_(upright("cts")) \( bb(Z)_p \, E_(F \, *) \) arrow.r 0 \, $

where the first map includes the constant functions. We fix the sign of every descent edge used below on its
  coefficient Postnikov layer. For normalized cosimplicial degree $s$ and internal cochain degree $r = - t$,
  use total degree $s + r$ and differential

$ d_(upright("Tot")) = d_(upright("cos")) + \( - 1 \)^s d_(upright("int")) \, wide d_(upright("cos")) =
  sum_i \( - 1 \)^i d^i . $

Thus the unit edge is the constant $1$, and the internal-degree-zero cochain differential is the one just
  specified. Model suspension by $K \[ 1 \]^n = K^(n + 1)$ with differential $- d_K$,
  with the strict inverse shift for desuspension. The comparison $"Tot" \( K \[ 1 \] \)
  arrow.r \( "Tot" K \) \[ 1 \]$ is multiplication by $\( - 1 \)^s$ in column $s$.

Here is the resulting boundary sign. For a degreewise exact sequence of normalized cochain complexes $0 arrow.r
  A arrow.r^i B arrow.r^D C arrow.r 0$, use

$ "Cone" \( i \)^n = B^n xor A^(n + 1) \, wide d \( b \, a \) = \( d_B b + i \( a \) \, - d_A a \) \, $

with inclusion $j \( b \) = \( b \, 0 \)$ and projection $p \( b \, a \) = a$ to $A \[ 1 \]$.
  This cone has the rotation convention of Section 2: the map $a
  mapsto \( \( 0 \, a \) \, - i \( a \) \)$ from $A \[ 1 \]$ to $"Cone" \( j \)$ identifies the next cone
  projection with $- i \[ 1 \]$. The quotient $q : "Cone" \( i \) arrow.r C$, $q \( b \, a \) = D \( b \)$,
  is a quasi-isomorphism under $B$, so the boundary is the roof $p q^(- 1)$.
  For a cocycle $c_0 = D \( b \)$, put $a_1 = i^(- 1) d_B b$.
  The cone cocycle lifting $c_0$ is $\( b \, - a_1 \)$, and its boundary is $- a_1$.
  In particular this boundary is the negative of the short-exact-cochain connecting cocycle $+ a_1$.

This is also the sign of the actual desuspended boundary at its first Adams edge.
  On the coefficient Postnikov layer, the comparison from the totalization of a termwise cone to the cone of the
  totalized map is $\( b \, a \) mapsto \( b \, \( - 1 \)^s a \)$ in column $s$.
  It commutes with the cone projection and the displayed suspension comparison.
  Evenness gives the displayed short exact coefficient sequence,
  and the unit’s boundary first occurs in bidegree $\( 1 \, 0 \)$; hence this layer computes its leading edge.
  The strict inverse shift contributes no further desuspension sign.

For the constant unit, take $b \( t \) = - t$. Then

$ \( D b \) \( t \) = b \( t - 1 \) - b \( t \) = 1 \, wide \( d_(upright("cos")) b \) \( g \) \( t \) =
  b \( t + c_(upright("det")) \( g \) \) - b \( t \) = - c_(upright("det")) \( g \) . $

The boundary-unit map $Sigma^(- 1) \( partial_(+) compose 1 \)$ is therefore detected by $-
  d_(upright("cos")) b = + c_(upright("det"))$. Define

$ zeta = Sigma^(- 1) \( partial_(+) compose 1 \) in pi_(- 1) T . $

It is an actual sphere map detected by the inflated normalized logarithm $c_(upright("det"))$.
  The normalization also agrees with the two-term group-ring resolution:
  its degree-one generator maps to the bar generator $\[ gamma \]$, whose boundary is $gamma - 1$,
  so the corresponding one-cocycle takes value $1$ on $gamma$.
  This normalization is used for all later descent edges. On the internal-degree-zero rows the total-complex
  Alexander–Whitney product has no interchange sign, so these edges retain the usual cup products and their
  naturality under the Moore quotient maps. The relative coface calculation restricts this class to the same
  logarithm on $P_3$, and finite-field descent retains this map and the unit.

#thm([Theorem 7.5.])[
  #emph[Set
$ W = L_2 S or Sigma^(- 1) L_2 S \, wide w = \( 1 \, zeta \) : W arrow.r X . $

 The first component is the canonical unit, and $L_(K \( 2 \)) w$ is an equivalence.
   More explicitly, the specified maps give
$ \( 1 \, zeta \) : R_2 or Sigma^(- 1) R_2 arrow.r^(med tilde.eq med) L_(K \( 2 \)) T . $

]
] <h3:thm:height-two-test>

#proof[
  The unit and the integral class just constructed are maps out of $S$.
    Thus they define $w$ by applying $L_2$; no extension of a map defined only on $R_2$ is being asserted.
  Use Proposition 7.2, Lemma 7.4 over $S_k$. By 32, the actual coefficient augmentation gives
  $ R Gamma_(upright("cts")) \( H' \, L \) tilde.eq k . $
  It retains compact parameters and the action of $P_3 \/ H'$.
    This quotient is $bb(Z)_p$, with trivial action on $k$. The continuous group-ring resolution
  $ 0 arrow.r k \[ \[ bb(Z)_p \] \] arrow.r^(gamma - 1) k \[ \[ bb(Z)_p \] \] arrow.r k arrow.r 0 $
  therefore shows that the residue-tested spectral sequence has only columns zero and one.
    They are generated by the constant unit and the normalized logarithm.
    There is no possible differential, and the specified maps $1 \,
    zeta$ detect these two generators by the coface identification in 52.
  Because $L_2$ is smashing and $overline(E)_2$ is $E \( 2 \)$-local, the ordinary relative tests satisfy
  $ overline(E)_2 ⊗_(S_k) \( W ⊗_S S_k \) tilde.eq overline(E)_2 or Sigma^(- 1) overline(E)_2 \, wide
    overline(E)_2 ⊗_(S_k) \( X ⊗_S S_k \) tilde.eq overline(E)_2 ⊗_(S_k) R_(3 \, k) . $
  The preceding two detected classes therefore prove that the test of $w ⊗_S S_k$ is an equivalence.
    By associativity this test is $overline(E)_2 ⊗_S w$, and (7.8) identifies it with the absolute ordinary
    residue test of $w$. The residue theory $overline(E)_2$ has Bousfield class $K \( 2 \)$;
    its coefficient ring is a graded field after a finite field extension.
    Consequently $w$ is a $K \( 2 \)$-equivalence. Applying $L_(K \( 2 \))$ to $w$ therefore gives an equivalence
    with source $R_2 or Sigma^(- 1) R_2$ and target $L_(K \( 2 \)) T$.
    The scalar passage preserved the two original $S$-maps by the naturality of the test and the unit-compatible
    finite-field descent. Its components are consequently the specified unit and $zeta$. ◻
]

== 8 Removing completion on the ordinary stratum <h3:sec:ordinary>

The ordinary stratum has two enlargements to remove: adjoining all Frobenius roots,
  and allowing unbounded negative powers of $x$. Equivariant root retractions give the first comparison.
  For the second, we first prove finiteness for every compact power-series lattice using a Laurent-tail estimate
  and a compact stable image. The intermediate finiteness argument below uses those lattices and the height-two
  map to prove the separate bounded-pole finiteness needed to remove unbounded tails.

=== 8.1 Coefficient spaces and their topology <coefficient-spaces-and-their-topology>

Put $G = P_3$, $A = k \[ \[ x \, y \] \]$, and $B_0 = A \[ x^(- 1) \]$. For $a \, b > 0$ write

$ v_(a \, b) (sum_(i in bb(Z) \, thin j gt.eq 0) c_(i j) x^i y^j) = inf_(c_(i j) eq.not 0) \( a i + b j \) \, wide
  v_(a \, b) \( 0 \) = + oo . $

The ring $B_(upright("hol"))$ consists of the integral-exponent series for which, for every $a \,
  b > 0$ and every real $N$, only finitely many nonzero terms have $a i + b j lt.eq N$.
  This is precisely convergence on $0 < \| x \| < 1$, $\| y \| < 1$ over trivially valued $k$.
  Rational positive $a \, b$ give a countable defining family of norms $exp \( - v_(a \, b) \)$.
  Coefficientwise limits of Cauchy sequences show completeness; Laurent polynomials give a countable dense subset.
  Thus $B_(upright("hol"))$ is a Polish additive group. The algebra $B_(upright("pk"))$ introduced before 30 is,
  equivalently, the completion for these norms of the union of the finite root levels
  $B_(upright("hol"))^(1 \/ p^n)$. This identification is the comparison of function algebras in Theorem 4.3,
  Theorem 5.13. The countable union of the root Laurent polynomials is dense,
  so this complete space is Polish as well. Frobenius and its inverse are continuous on $B_(upright("pk"))$,
  with valuations multiplied and divided by $p$, respectively.

In particular, 30 concerns the ordinary continuous $G$-cochain complex of this space,
  including continuous profinite parameters. We use both its natural constants comparison and its finiteness
  assertion for coefficient lines.

The lines needed below are tensor products of integral powers of the periodicity line and finite
  determinant-character lines; their duals are included. The canonical line is among them by the canonical-line
  calculation used in 16. Write $cal(L)$ for such a line, with its original free $A$-lattice $cal(L)_A$, and set

$ A_d \( cal(L) \) = x^(- d) cal(L)_A quad \( d in bb(Z) \) \, wide B_(upright("hol")) \( cal(L) \) =
  B_(upright("hol")) ⊗_A cal(L)_A \, wide B_(upright("pk")) \( cal(L) \) = B_(upright("pk")) ⊗_A cal(L)_A . $

Each $A_d \( cal(L) \)$ is $G$-stable and compact, with its $\( x \, y \)$-adic topology.
  This is also its subspace topology in $B_(upright("hol")) \( cal(L) \)$:
  on a fixed pole lattice, every $v_(a \, b)$ is bounded below by a positive multiple of total-degree order minus
  a constant, while $v_(1 \, 1)$ recovers that order up to the fixed lattice shift.
  The group preserves $\( x \, y \)$ and carries $x$ to $x$ times a unit;
  its action on the chosen line lattice is by units.

For clarity, the notation for algebraic localization always means

#[#set math.equation(numbering: n => "(8.1)")
 $ R Gamma_(upright("cts")) \( G \, B_0 \( cal(L) \) \) :=
   "colim"_d C_(upright("cts"))^bullet \( G \, A_d \( cal(L) \) \) . $ <h3:ord:cochain-colimit>]

An additional profinite parameter space $T$ means applying $C \( T \, - \)$ at each displayed finite stage before
  taking the colimit. No topology on an unrestricted union of cochain values is being used.

=== 8.2 Natural root projections <natural-root-projections>

#thm([Lemma 8.1.])[
  (Equivariant root retractions).  #emph[There is a continuous $G$-equivariant $B_0$-linear retraction
    $B_0^(1 \/ p) arrow.r B_0$. Its iterates give compatible retractions from every finite root level and extend
    to a continuous retraction
$ rho : B_(upright("pk")) arrow.r B_(upright("hol")) $

 of the natural inclusion. For every line $cal(L)$ above, the same construction gives a continuous equivariant
   retraction from $B_(upright("pk")) \( cal(L) \)$ to $B_(upright("hol")) \( cal(L) \)$.
   There are also an integer $e > 0$, $q = p^e$, and continuous $G$-equivariant additive operators $upright("Fr")$
   and $cal(P)$ on its holomorphic coefficients such that
#[#set math.equation(numbering: n => "(8.2)")
 $ cal(P) upright("Fr") = 1 . $ <h3:ord:retraction-identity>]

 Here $upright("Fr")$ is the $q$-power map in a horizontal frame.
   It is invertible on the perfected coefficients, preserves some $A_(- r) \( cal(L) \)$,
   and $cal(P)$ preserves $A_D \( cal(L) \)$ for every sufficiently large $D$.
   All these maps are compatible with constant-field descent.]
] <h3:ord:root-retractions>

#proof[
  By 17, the finite scheme of splittings of the ordinary connected–étale sequence at level $p^ell$ is a torsor under
  $ underline("Hom") \( cal(E) \[ p^ell \] \, cal(C) \[ p^ell \] \) \, $
  a form of $mu_(p^ell)^2$. Its algebra is $B_0^(1 \/ p^ell)$ over $B_0$. This includes the divisor $y = 0$.
    A unit $p$-basis on this open is $x \, 1 + y$; adjoining a root of $1 +
    y$ also adjoins the corresponding root of $y$. Thus multiplicative torsor coordinates can be units throughout
    the open. The additive monomial basis $x^i y^j$ used below only expresses the matrix of the resulting
    operator; its equivariance comes from the splitting torsor.
    We recall why the construction supplies a retraction without a choice of a splitting.
    After an étale cover the group is diagonalizable, and a comodule is graded by its character group.
    Projection onto the degree-zero summand is linear over the invariant algebra.
    Every comodule map preserves this summand. Changing the étale frame permutes characters and fixes zero,
    so the projections descend by faithfully flat descent. The invariant subalgebra of a torsor is the base
    algebra, and its inclusion is fixed by this projection. This proves the required retraction.
    It is an additive, base-linear projection; no multiplicativity or preservation of the ideal $\( y \)$ is used.
    The construction commutes with automorphisms of the ordinary sequence,
    hence with $G$ and with coefficient-field automorphisms. It uses no division by the order of $mu_(p^ell)^2$.
  For the untwisted coefficients choose $q = p^e$ with $q$ acting trivially on $k$, and let $rho_1 :
    B_0^(1 \/ q) arrow.r B_0$ be the corresponding retraction.
    Set $cal(P) \( f \) = rho_1 \( f^(1 \/ q) \)$ and $upright("Fr") \( f \) = f^q$.
    Then $cal(P) \( g^q f \) = g cal(P) \( f \)$ and (8.2) holds. On the level $B_0^(1 \/ q^n)$ define
  #[#set math.equation(numbering: n => "(8.3)")
   $ rho_n \( f^(1 \/ q^n) \) = cal(P)^n f . $ <h3:ord:finite-root-projection>]
  These maps are $B_0$-linear. They agree on overlapping levels because $cal(P)^(n + 1) \( f^q \) = cal(P)^n f$.
    Thus a single natural root retraction already supplies the whole compatible system.
  Here is also the construction for the actual line twists.
    If $omega$ denotes the periodicity line, the invariant height-one section $v_1$ trivializes $omega^(p - 1)$ on
    this open. In a free frame it is $x$ times that frame to the power $p - 1$,
    with the exponent reversed if the dual convention for $omega$ is used.
    Adjoin a $\( p - 1 \)$st root of this section. This is a finite étale frame cover on the open,
    and the resulting horizontal frame has finite tame transition characters.
    Include the finite determinant character and choose $q$ to fix all these characters and the constants.
    The $q$-power map on coefficients in that frame then descends to the line,
    as does the base-changed root retraction. Projection onto the required tame eigensummand is exact,
    since its order is prime to $p$. On the $n$th root level of a line, the intrinsic version of (8.3) is $rho_n =
    cal(P)^n upright("Fr")^n$; thus its notation does not require taking a root of a chosen line generator.
  In the original rational frame the coefficients in a horizontal frame have $x$-exponents in a fixed translate
    $lambda + bb(Z)$, with $\( q - 1 \) lambda in bb(Z)$. More explicitly, write the horizontal frame as $h =
    x^(- lambda) e_0$, where $e_0$ is the original line frame, and put $kappa = \( q - 1 \) lambda$. Then
  $ upright("Fr") \( f e_0 \) = f^q x^kappa e_0 . $
  Thus Frobenius multiplies normalized order by $q$. For line coefficients we use these normalized Gauss
    valuations: relative to the original frame they add the fixed number $a lambda$ to $v_(a \, b)$.
    They define the same topology, and satisfy $v_(a \, b) \( upright("Fr") f \) = q v_(a \, b) \( f \)$ exactly.
    Choosing $r + lambda gt.eq 0$ makes $x^r cal(L)_A$ Frobenius-stable.
    This also shows explicitly that passing to the tame frame introduces only a fixed shift of pole orders.
    The continuity, extension to completion, and assertion about $A_D$ follow from the estimates proved next;
    these estimates apply to the descended eigensummand as well. ◻
]

#thm([Lemma 8.2.])[
  (Uniform loss bounds).  #emph[Fix the operators of 54 and a free rational frame of $cal(L)$,
    using the normalized Gauss valuations just specified. There are constants $c gt.eq 0$ and $c_(a \, b) gt.eq
    0$ such that
#[#set math.equation(numbering: n => "(8.4)")
 $ cal(P) \( A_L \( cal(L) \) \) & subset.eq A_(L \/ q + c) \( cal(L) \) \,\
v_(a \, b) \( cal(P) f \) & gt.eq q^(- 1) v_(a \, b) \( f \) - c_(a \, b) . $ <h3:ord:one-pole-bound>]

 For real indices the pole inequality defines the lattice, so $A_t =
   A_(floor.l t floor.r)$ in the original integral frame. With $C = c \/ \( 1 - q^(- 1) \)$ and $C_(a \, b) =
   c_(a \, b) \/ \( 1 - q^(- 1) \)$, iteration gives
#[#set math.equation(numbering: n => "(8.5)")
 $ cal(P)^n \( A_L \( cal(L) \) \) & subset.eq A_(q^(- n) L + C) \( cal(L) \) \,\
v_(a \, b) \( cal(P)^n f \) & gt.eq q^(- n) v_(a \, b) \( f \) - C_(a \, b) . $ <h3:ord:iterated-poles>]

 The losses for $rho_n$ in (8.3) are therefore independent of the root level.]
] <h3:ord:loss-bounds>

#proof[
  Let $e_0$ be the original free line frame, and temporarily write $w_(a \, b)$ for the unshifted scalar Gauss
    valuation. Every scalar coefficient has the unique decomposition
  $ f = sum_(0 lt.eq i \, j < q) x^i y^j f_(i j)^(thin q) . $
  The inverse-semilinear operator is consequently given by a finite matrix, here a single row:
  $ cal(P) \( f e_0 \) = (sum_(0 lt.eq i \, j < q) b_(i j) f_(i j)) e_0 \, wide b_(i j) in B_0 . $
  The terms of the decomposition have disjoint exponent residue classes, so
  $ w_(a \, b) \( f \) = min_(i \, j) { a i + b j + q w_(a \, b) \( f_(i j) \) } . $
  Put
  $ c_(a \, b)^0 = max (0 \, max_(i \, j) {frac(a i + b j, q) - w_(a \, b) \( b_(i j) \)}) . $
  The scalar output has valuation at least $q^(- 1) w_(a \, b) \( f \) - c_(a \, b)^0$.
    Since $v_(a \, b) \( f e_0 \) = w_(a \, b) \( f \) + a lambda$, its normalized valuation is at least
  $ q^(- 1) v_(a \, b) \( f e_0 \) - c_(a \, b)^0 + a lambda \( 1 - q^(- 1) \) . $
  Thus (8.4) holds, for example, with $c_(a \, b) = c_(a \, b)^0 + a \| lambda \| \( 1 - q^(- 1) \)$.
    All $b_(i j)$ have one common finite pole bound. For $f in A_L$,
    its components have pole at most $L \/ q + \( q - 1 \) \/ q$.
    This proves (8.4) with a constant independent of $L$. Each iteration divides the previous loss by $q$,
    giving the displayed geometric sums and proving (8.5) and (8.5).
  The component decomposition and finite matrix are continuous on $B_(upright("hol"))$:
    taking an exponent residue class and then a root preserves convergence in every defining norm.
    On a root level the last inequality reads
  $ v_(a \, b) \( rho_n h \) gt.eq v_(a \, b) \( h \) - C_(a \, b) . $
  Thus the compatible maps extend continuously from the dense root union to $B_(upright("pk"))$,
    with values in the complete space $B_(upright("hol"))$. Their common restriction is the identity on
    $B_(upright("hol"))$. Finally $D > C$ implies $D \/ q + c < D$, proving stability of $A_D$.
    The proof on the tame frame cover uses its finitely many character components and the same finite matrix
    calculation. Descent therefore retains both estimates for every specified twist. ◻
]

#thm([Proposition 8.3.])[
  (Holomorphic comparison).  #emph[For every specified coefficient line the natural map
$ R Gamma_(upright("cts")) \( G \, B_(upright("hol")) \( cal(L) \) \) arrow.r
  R Gamma_(upright("cts")) \( G \, B_(upright("pk")) \( cal(L) \) \) $

 is a quasi-isomorphism. Its cohomology groups are finite, and the chosen Frobenius power acts invertibly on them.
   For a profinite parameter space $T$, the comparison and Frobenius invertibility persist,
   and the cohomology is naturally
$ C #scale(x: 120%, y: 120%)[\(] T \, H_(upright("cts"))^a \( G \, B_(upright("hol")) \( cal(L) \) \)
  #scale(x: 120%, y: 120%)[\)] \, $

 where the finite point-value cohomology group has its discrete topology.
   Finiteness is asserted for the cohomology without parameters.
   The comparison is compatible with coefficient-field descent.
   For the untwisted line it identifies the natural constants comparison of 26.]
] <h3:prop:holomorphic-comparison>

#proof[
  The retraction induces a split injection on cohomology into the finite groups of 30.
    Hence holomorphic cohomology is finite before any bounded-pole assertion is used.
    The identity $cal(P) upright("Fr") = 1$ makes Frobenius injective on these finite groups, hence bijective.
    Both cochain complexes are Polish, so their finite cohomology groups are discrete by 34.
  For completeness, consider a completed class, rather than merely a class in the algebraic root union.
    On perfected coefficients define
  $ R_ell = upright("Fr")^(- ell) rho upright("Fr")^ell : B_(upright("pk")) \( cal(L) \) arrow.r
    B_(upright("hol")) \( cal(L) \)^(1 \/ q^ell) . $
  This is a projection onto the indicated root level and satisfies
  #[#set math.equation(numbering: n => "(8.6)")
   $ v_(a \, b) \( R_ell f \) gt.eq v_(a \, b) \( f \) - q^(- ell) C_(a \, b) . $ <h3:ord:root-approximation-bound>]
  It converges to the identity uniformly on compact subsets in every defining norm.
    Indeed, approximate a compact subset, at any prescribed accuracy in finitely many norms,
    by finitely many elements at a common finite root level. For every later $ell$,
    $R_ell$ fixes these approximants. The bound (8.6) controls the errors uniformly;
    increasing the accuracy proves the assertion.
  If $z$ is a continuous completed cocycle, its image is compact.
    Thus $R_ell z arrow.r z$ in the cochain topology. These are cocycles because the projections are equivariant.
    Discreteness of completed cohomology gives $\[ R_ell z \] = \[ z \]$ for all sufficiently large $ell$.
    Every completed class therefore comes from a finite root level.
    Under Frobenius transport, the image of this level is the image of holomorphic cohomology,
    because Frobenius is already invertible on that image. This proves surjectivity and hence the comparison.
  The finite-cohomology lifting assertion of 35 now applies to these two Polish complexes.
    It proves the comparison with any profinite parameters. All the maps used to define the comparison are the
    natural inclusions; the retractions prove their properties.
    In particular the comparison preserves products and the original constants maps.
    Naturality of the torsor construction also proves its coefficient-field equivariance. ◻
]

=== 8.3 Uniform Laurent tails and compact stable images <uniform-laurent-tails-and-compact-stable-images>

Let $T_D$ discard the terms of pole order at most $D$, retaining only $x^i y^j$ with $i < - D$,
  in a chosen rational frame. It is a continuous linear operator on $B_(upright("hol")) \( cal(L) \)$;
  its complementary projection has image $A_D \( cal(L) \)$.
  The frame shifts in 54 can be absorbed in the constants of 55.

#thm([Lemma 8.4.])[
  (Tail contraction on compact families).  #emph[Choose an integer $D > C$ in 55.
    For every compact subset $K subset B_(upright("hol")) \( cal(L) \)$,
$ T_D cal(P)^n f arrow.r 0 quad upright("uniformly for ") f in K $

 in every defining Gauss norm.]
] <h3:ord:tail-contraction>

#proof[
  Choose $0 < delta < D - C$ and set $L_n = floor.l delta q^n floor.r$. The pole estimate implies
  $ cal(P)^n \( 1 - T_(L_n) \) f in A_D \( cal(L) \) \, wide T_D cal(P)^n f = T_D cal(P)^n T_(L_n) f . $
  Fix $a \, b > 0$. For any $R > 0$, compactness gives a finite lower bound
  $ m_R := inf_(f in K) v_(a + R \, b) \( f \) > - oo . $
  A monomial with pole $i > L$ has normalized $v_(a \, b)$-value equal to its $v_(a + R \, b)$-value plus
    $R \( i - lambda \)$. Consequently
  $ inf_(f in K) v_(a \, b) \( T_(L_n) f \) gt.eq m_R + R \( L_n - lambda \) . $
  Truncation cannot lower a Gauss valuation. By the iterated norm bound,
  #[#set math.equation(numbering: n => "(8.7)")
   $ inf_(f in K) v_(a \, b) \( T_D cal(P)^n f \) gt.eq q^(- n) \( m_R - R lambda \) + R q^(- n) L_n -
     C_(a \, b) . $ <h3:ord:quantitative-tail>]
  The lower limit is at least $R delta - C_(a \, b)$. Since $R$ can be arbitrarily large, it is $+ oo$.
    This includes $lambda = 0$ for the untwisted line. ◻
]

#thm([Lemma 8.5.])[
  (The compact kernel and its stable image).  #emph[For $D$ as above and every $a gt.eq 0$, put
$ M = H_(upright("cts"))^a \( G \, A_D \( cal(L) \) \) \, wide phi.alt : M arrow.r
  H_(upright("cts"))^a \( G \, B_(upright("hol")) \( cal(L) \) \) . $

 Then $M$ is compact Hausdorff, and $cal(P)^n z arrow.r 0$ for every $z in ker phi.alt$. Moreover its stable image
$ M_oo = ⋂_(n gt.eq 0) cal(P)^n M $

 is finite.]
] <h3:ord:stable-image>

#proof[
  Compactness, Hausdorffness and the asserted cohomology topology follow from the finite completed resolution
    in 33. The continuous map $phi.alt$ has finite discrete target by 56, so $K = ker phi.alt$ is compact.
    For $a = 0$ it is zero, since the coefficient inclusion is injective.
    For $a > 0$, represent $z in K$ by an $A_D$-valued cocycle $z_0$ and write $z_0 =
    partial b$ with a holomorphic continuous cochain $b$. Set
  $ b_n = \( 1 - T_D \) cal(P)^n b \, wide e_n = cal(P)^n z_0 - partial b_n = partial \( T_D cal(P)^n b \) . $
  The first expression shows that $e_n$ is an $A_D$-valued cocycle.
    The image of $b$ is compact, so 57 makes $T_D cal(P)^n b$ tend uniformly to zero.
    The group differential preserves this convergence in total-degree order:
    every group element preserves $\( x \, y \)$, sends $x$ to $x$ times a unit and sends a line generator to a
    unit multiple. Thus its action does not decrease total-degree order in a fixed rational frame.
    The finite sum defining $partial$ has the same property. It follows that $e_n arrow.r
    0$ in the compact lattice topology, and $cal(P)^n z = \[ e_n \] arrow.r 0$ in $M$.
  We give the uniformity step explicitly. For an open additive subgroup $U$ of $K$, let
  $ K_N \( U \) = ⋂_(n gt.eq N) { z in K : cal(P)^n z in U } . $
  These are increasing closed subgroups covering $K$ by the convergence just proved.
    The Baire theorem makes one of them have interior; as a subgroup it is open and has finite index.
    Choose representatives for its finitely many cosets. Each representative has all sufficiently late iterates in
    $U$. Taking the largest of these finitely many bounds gives $cal(P)^n K subset.eq
    U$ for all sufficiently large $n$. Hence
  #[#set math.equation(numbering: n => "(8.8)")
   $ ⋂_(n gt.eq 0) cal(P)^n K = 0 . $ <h3:ord:kernel-intersection>]
  The operator $cal(P)$ is bijective on holomorphic cohomology:
    it is the inverse of Frobenius there by finiteness and (8.2).
    If $z in M_oo ∩ K$, choose, for each $n$, an $m_n in M$ with $cal(P)^n m_n = z$.
    Applying $phi.alt$ and using this bijectivity gives $m_n in K$. Equation (8.8) therefore forces $z = 0$.
    Thus $M_oo$ injects into the finite holomorphic cohomology group, which proves its finiteness. ◻
]

#thm([Proposition 8.6.])[
  (Finiteness of all ordinary lattices).  #emph[For every $a gt.eq 0$, $d in bb(Z)$,
    and coefficient line $cal(L)$ specified above, the group
$ H_(upright("cts"))^a \( P_3 \, A_d \( cal(L) \) \) $

 is finite. This includes all periodicity, determinant, conormal, and canonical-line twists and their inverses,
   with the original $\( x \, y \)$-adic lattice topology. The conclusion uses no finiteness or cohomology
   comparison for $B_0$.]
] <h3:prop:ordinary-lattice-finiteness>

#proof[
  Each adjacent quotient $A_j \( cal(L) \) \/ A_(j - 1) \( cal(L) \)$ is a free $k \[ \[ y \] \]$-line.
    Its action is the restriction of $cal(L)$ tensored with the appropriate power of the conormal of $x = 0$.
    That conormal is a periodicity power. Thus 47 says that every such quotient has finite $G$-cohomology.
    Finite strips of adjacent quotients have finite cohomology as well, by their finite filtration.
    The sequences are exact on continuous cochains: the finite Laurent-coordinate truncations give continuous
    nonequivariant sections.
  Choose $A_(- r) \( cal(L) \) subset.eq A_D \( cal(L) \)$ with the former Frobenius-stable and the latter
    $cal(P)$-stable, as in 54. If $z in H^a \( G \, A_(- r) \( cal(L) \) \)$, then its image in $M$ satisfies
  $ iota \( z \) = cal(P)^n iota \( upright("Fr")^n z \) quad upright("for every ") n . $
  It therefore belongs to the finite subgroup $M_oo$ of 58.
    The kernel of this map is a quotient of $H^(a - 1) \( G \, A_D \/ A_(- r) \)$,
    which is finite by the strip calculation (and is zero for $a = 0$). Hence $H^a \( G \, A_(- r) \)$ is finite.
    The same strip sequence then proves finiteness for $A_D$; further finite strips reach every $A_d$,
    in either direction. All twists have been retained throughout. ◻
]

=== 8.4 Intermediate finiteness and bounded poles <h3:sec:intermediate-finiteness>

The compact lattice calculation now supplies a finite chromatic abutment.
  We use it to bound the algebraic bounded-pole cohomology before invoking the ordinary comparison.

Write $M_3$ for the fiber of $L_3 arrow.r L_2$.

#thm([Lemma 8.7.])[
  #emph[The groups
$ pi_j \( T \/ p \) \, wide pi_j \( M_3 S \/ p \) \, wide pi_j \( X \/ p \) \, wide pi_j \( L_1 X \/ p \) $

 are finite for every integer $j$. This assertion uses 59 but does not use 62.]
] <h3:des:monochromatic-finiteness>

#proof[
  #emph[The height-three local term $T \/ p$.] Apply the finite Moore quotient to the relative object of 50.
    Its abutment is $pi_(*) \( R_(3 \, k) \/ p \)$, and its coefficient in internal degree $2 j$ is $A ⊗ omega^j$;
    odd coefficients vanish. These compact modules have finite $P_3$-cohomology by 59.
    They are complete and separated with invariant open neighborhoods,
    so the reduced $bb(F)_p \[ \[ P_3 \] \]$-resolution of 33, which has length nine,
    computes their continuous cochains. Hence only columns $0 lt.eq s lt.eq 9$ occur.
    The bounded convergence from 50 gives finitely many finite associated-graded groups in each total degree,
    so $pi_(*) \( R_(3 \, k) \/ p \)$ is degreewise finite. The underlying equivalence $R_(3 \, k) \/ p
    tilde.eq \( T \/ p \)^(or \[ k : bb(F)_p \])$ then gives finiteness for $T \/ p$ over $S$.
  #emph[The monochromatic term $M_3 S \/ p$.] The chromatic fracture square gives natural equivalences
  $ M_3 S tilde.eq M_3 T tilde.eq "fib" \( T arrow.r L_2 T \) . $
  The first identity is also #cite(label("HS99")) Theorem 6.19.
    Put $E = E_3 \( k \)$, $tilde(A) = pi_0 E = W \( k \) \[ \[ x \, y \] \]$ and $I = \( p \, x \, y \)$.
    The module-spectrum form of chromatic localization is needed here.
    For every ordinary $E$-module $N$, including a completed continuous-function term, there is a natural fiber sequence
  $ "Kos"_E \( I \) ⊗_E N arrow.r N arrow.r L_2 N \, wide "Kos"_E \( I \) = ⨂_(z in { p \, x \, y })
    "fib" \( E arrow.r E \[ z^(- 1) \] \) . $
  This is #cite(label("BarthelStapleton2016")) Proposition 3.4(1) and Remark 3.5,
    with its support functor described in Lemmas 2.3 and 2.5 of that paper.
    The statement is about the underlying chromatic localization of arbitrary module spectra;
    it imposes no flatness or finite-generation condition. Since $E$ is $E \( 3 \)$-local and $L_3$ is smashing,
    every $E$-module is $E \( 3 \)$-local. Thus the first term is $M_3 N$.
    In particular it applies to the actual completed Amitsur spectrum $N_Q = cal(N)_3^q$ for $Q = P_3^q$,
    equipped with (7.2) and viewed as an ordinary $E$-module;
    no completed tensor product is replaced by an ordinary one.
  The spectrum $N_Q \/ p$ has zero $p$-inversion, so its $p$-support factor is the whole spectrum.
    The remaining two factors give the finite Čech support complex for $\( x \, y \)$. Its homotopy spectral sequence is
  $ H_(\( x \, y \))^s \( pi_t \( N_Q \/ p \) \) arrow.r.double pi_(t - s) \( M_3 \( N_Q \/ p \) \) \, wide
    0 lt.eq s lt.eq 2 . $
  By 51, the even coefficient modules of $N_Q \/ p$ are $C_(upright("cts")) \( Q \, A \) ⊗ omega^(t \/ 2)$,
    where $A = k \[ \[ x \, y \] \]$, and are flat over $A$; the odd ones vanish.
    The regular sequence $x \, y$ therefore makes the displayed support cohomology vanish except for $s = 2$.
    For $Q$ a point it is
  $ H_(\( x \, y \))^2 A = A \[ x^(- 1) \, y^(- 1) \] \/ \( A \[ x^(- 1) \] + A \[ y^(- 1) \] \) . $
  Thus the shift is exactly two. The finite support complex introduces no further convergence issue.
  These identifications also respect the action-cobar maps.
    All faces other than the first, and all degeneracies, are $E$-linear;
    the first face uses the continuous stabilizer action. The invariant ideal $I$ is preserved even for this
    varying family: in $C_(upright("cts")) \( P_3^(q + 1) \, tilde(A) \)$ one has
    $\( p \, g_1 \( x \) \, g_1 \( y \) \) = \( p \, x \, y \)$.
    Indeed, the continuous monomial-division operations used in 51 express any element of $I$ as a continuous sum
    of $p \, x \, y$ multiples. Apply them to $g_1^(- 1) \( x \)$ and $g_1^(- 1) \( y \)$, then apply $g_1$;
    joint continuity gives continuous coefficients expressing $x \, y$ in the image ideal.
    The reverse containment follows in the same way. For precision, let $I_q$ be the image of $I$ in $pi_0 N_Q$.
    Base change of the displayed finite fiber construction from $E$ to $N_Q$ identifies the ordinary $E$-support
    term with $"Kos"_(N_Q) \( I_q \)$. Along an actual coface ring map $N_Q arrow.r N_(Q')$,
    its further base change is the construction for the image generators in $pi_0 N_(Q')$.
    The support functor on ordinary $N_(Q')$-modules is the canonical right adjoint for modules supported at that
    finitely generated ideal, so it depends on the ideal, not on the chosen generators.
    The equality of ideals just proved identifies the first-face image with the target support ideal.
    Uniqueness of this right adjoint makes the resulting comparisons compatible with the first face and with
    compositions. No individual generator is assumed fixed by the action.
    The calculation therefore applies to the whole completed Amitsur object,
    and 50 permits its termwise use before totalization.
  For a continuous function term the same quotient is
  #[#set math.equation(numbering: n => "(8.9)")
   $ H_(\( x \, y \))^2 C_(upright("cts")) \( Q \, A \) = C_(upright("lc")) \( Q \, H_(\( x \, y \))^2 A \) \,
     $ <h3:des:principal-parts-parameters>]
  where the target coefficient module is discrete. To verify this,
    express $H_(\( x \, y \))^2 A$ as the colimit of $A \/ \( x^a \, y^a \)$,
    with transition multiplication by $x y$. At each stage, quotienting continuous functions gives continuous
    functions to the finite discrete quotient, using coefficient truncation to lift them.
    A locally constant map from compact $Q$ has finite image, so one common stage represents it.
    This proves (8.9) with the required denominator and parameter bounds.
  Residue pairing, followed by $"Tr"_(k \/ bb(F)_p)$, identifies the continuous dual of
    $H_(\( x \, y \))^2 \( A ⊗ omega^j \)$ with the compact module
  $ M = A ⊗ omega^(- j) ⊗ and.big^2 Omega_(A \/ k \, upright("cts"))^1 . $
  Concretely the pairing is the coefficient of $x^(- 1) y^(- 1)$ in a product with a two-form.
    It is perfect on finite principal-parts quotients and hence on their colimit against the inverse-limit
    power-series module. Its change-of-variables formula proves equivariance.
    The canonical-line identity of 16 makes this an admissible twist in 59.
    The principal-parts module is discrete and $M$ is compact.
    The reversed compact/discrete duality (6.4), applied to $P_3$ in dimension nine, therefore gives
  $ H_(upright("cts"))^s #scale(x: 120%, y: 120%)[\(] P_3 \,
    H_(\( x \, y \))^2 \( A ⊗ omega^j \) #scale(x: 120%, y: 120%)[\)] tilde.equiv
    H_(upright("cts"))^(9 - s) \( P_3 \, M \)^or . $
  The right side is finite by 59, so the principal-parts cohomology is finite in every degree.
    The relative descent spectral sequence for $M_3 \( R_(3 \, k) \/ p \)$ is bounded in columns by the same
    reduced length-nine resolution and has finite entries in every total degree.
    It therefore has degreewise finite abutment. Its underlying spectrum is a sum of $\[ k : bb(F)_p \]$ copies of
    $M_3 \( T \/ p \)$, because the exact functor $M_3 \( - \/ p \)$ preserves the finite free decomposition of
    $R_(3 \, k)$. Using $M_3 T tilde.eq M_3 S$ proves finiteness of $pi_(*) \( M_3 S \/ p \)$.
  #emph[The overlap $X \/ p$.] The fiber sequence $M_3 S \/ p arrow.r T \/ p arrow.r
    X \/ p$ gives finiteness for $X \/ p$.
  #emph[The height-one localization $L_1 X \/ p$.] By 53, $L_(K \( 2 \)) X \/
    p$ is the sum of two shifts of $R_2 \/ p$. The completion map identifies $S \/
    p$ with the finite torsion Moore spectrum $bb(S)_(\( p \)) \/ p$, and exactness of $L_(K \( 2 \))$ gives
  $ R_2 \/ p tilde.eq L_(K \( 2 \)) \( S \/ p \) . $
  For $p gt.eq 5$, #cite(label("HS99")) Theorem 15.1 applied at height two to this finite torsion spectrum says
    that every integer-graded homotopy group is finite; see also #cite(label("BB")) p. 49(c).
  For the other height-two boundary put $E = L_1 R_2$. The completion map from the $p$-local sphere to $S$ has
    rational cofiber, so it is a $K \( 2 \)$-equivalence. Thus $R_2$ is the $K \( 2 \)$-local sphere in the group
    calculation of #cite(label("Behrens2012")) Remark 7.8. We use the following features of that formula.
    Write $d_v = \| v_1 \| = 2 \( p - 1 \)$. Besides finitely many shifted copies of $bb(Z)_p$, $bb(Q)_p$,
    and $bb(Q) \/ bb(Z)_(\( p \))$, the formula contains finite cyclic $p$-groups with generators
    $1_(s p^n \/ \( n + 1 \))$, where $n gt.eq 0$, $p divides.not s$, and the internal degree is $d_v s p^n$.
    Its exterior factor on the degree-minus-one class denoted here by $zeta_(upright(B))$ adds only two shifts.
    This notation distinguishes that height-two class from the map $zeta$ constructed above.
  For a fixed nonzero internal degree, division by $d_v$, when possible,
    determines at most one integer of the form $s p^n$ with $p divides.not s$:
    $n$ is its $p$-adic valuation and $s$ its remaining $p$-unit integer.
    The cyclic family therefore contributes at most one summand in each such degree before the two exterior
    shifts. Multiplication by $p$ has finite kernel and cokernel on each listed group:
    these pairs are $\( 0 \, bb(F)_p \)$, $\( 0 \, 0 \)$, and $\( bb(F)_p \, 0 \)$ on $bb(Z)_p$, $bb(Q)_p$,
    and $bb(Q) \/ bb(Z)_(\( p \))$, respectively, and they are finite on a finite cyclic $p$-group.
    Hence both $pi_j \( E \) \[ p \]$ and $pi_j \( E \) \/ p$ are finite for every integer $j$.
    The Moore cofiber sequence gives
  $ 0 arrow.r pi_j \( E \) \/ p arrow.r pi_j \( E \/ p \) arrow.r pi_(j - 1) \( E \) \[ p \] arrow.r 0 . $
  It follows that $pi_j \( E \/ p \)$ is finite in every degree.
    Exactness identifies $E \/ p tilde.eq L_1 \( R_2 \/ p \)$, the boundary needed here.
    The local height-two equivalence then identifies $L_1 L_(K \( 2 \)) \( X \/ p \)$ with two shifts of $E \/ p$,
    so that corner is degreewise finite. Finally, apply the height-two fracture square to $X \/ p$.
    Its other three corners are degreewise finite, so its long exact sequence proves finiteness of $L_1 X \/ p$.
    No bounded-pole comparison has been used in this argument. ◻
]

#thm([Proposition 8.8.])[
  #emph[For every $a gt.eq 0$, the group $H_(upright("cts"))^a \( P_3 \, B_0 \)$,
    with the prescribed bounded-pole cochain convention, is finite.]
] <h3:prop:bounded-pole-finiteness>

#proof[
  Apply $L_1 \( - \/ p \)$ to the completed relative descent object.
    We first identify this exact test on an actual term $N_Q = cal(N)_3^q$.
    For odd $p$, an Adams self-map of the finite Moore spectrum has degree $2 \( p - 1 \)$ and acts nontrivially
    in $K \( 1 \)$-homology #cite(label("RavenelNilpotence")) Example 2.4.1(ii).
    Its action on $B P_(*) \( S \/ p \) = B P_(*) \/ p$ is multiplication by an element of degree $2 \( p - 1 \)$,
    and that graded group is $bb(F)_p v_1$. This even-degree coefficient detects the entire $B P$-module map:
    applying maps into $B P \/ p$ to $B P arrow.r^p B P arrow.r
    B P \/ p$ shows that the only possible extra term is $pi_(2 \( p - 1 \) + 1) \( B P \/ p \) = 0$.
    If the coefficient were zero, the $B P$-module map would be null, and so would its base change to $K \( 1 \)$,
    contrary to the chosen Adams map. Its coefficient is therefore a unit multiple of $v_1$.
    Rescaling the self-map by an integer unit makes its $B P$-Hurewicz action exactly $v_1$.
    The height-three orientation sends this element to $v_1 = x U^(p - 1)$ modulo $p$.
    This unit rescaling does not change the telescope: powers of the unit give an isomorphism between the two
    defining towers.
  The height-one telescope theorem for this finite Moore spectrum is the consequence of #cite(label("Miller1981"))
    Theorem 4.11 and Corollary 4.12 identified as the $n = 1$ case in #cite(label("RavenelNilpotence"))
    Section 7.5, after Conjecture 7.5.5. Since $L_1$ is smashing, it gives,
    for the already formed ordinary module $N_Q$,
  $ L_1 \( N_Q \/ p \) tilde.eq N_Q and L_1 \( S \/ p \) tilde.eq N_Q and
    "Tel" \( v_1 : S \/ p arrow.r Sigma^(- 2 \( p - 1 \)) S \/ p \) . $
  Thus the test is a termwise ordinary telescope of the same finite Moore self-map.
    Homotopy groups commute with that telescope. In internal degree zero the resulting coefficient is exactly
  $ "colim"_d x^(- d) C_(upright("cts")) \( P_3^q \, A \) . $
  Its other coefficients are the periodic translates. The actual action preserves every bounded-pole lattice
    modulo $p$, because $g \( x \) \/ x$ is a unit in $A$. This is the prescribed cochain complex of $B_0$;
    no completion of the algebraic localization is taken.
  The central tame units act trivially on $A$ and by their scalar powers on $U$.
    Averaging over $mu_(p - 1)$ kills internal degrees not divisible by $2 \( p - 1 \)$.
    Modulo $p$, $v_1$ is invariant, so multiplication by its powers identifies all the remaining coefficient
    complexes. For each compact lattice $x^(- d) A$, the reduced finite $bb(F)_p \[ \[ P_3 \] \]$-resolution of 33
    computes its continuous cochains and has length nine. Taking the exact filtered colimit of these complexes
    proves the same column bound for this prescribed bounded-pole union;
    it does not apply a compact-module theorem directly to the union. Thus the spectral sequence has
  $ E_2^(a \, thin 2 b \( p - 1 \)) = H_(upright("cts"))^a \( P_3 \, B_0 \) thin v_1^b \, wide 0 lt.eq a lt.eq 9 \, $
  and no other nonzero internal degrees. The abutment is the relative one, $pi_(*) L_1 \( R_(3 \, k) \/ p \)$.
    If $m = \[ k : bb(F)_p \]$, the underlying finite free decomposition gives
  $ L_1 \( R_(3 \, k) \/ p \) tilde.eq L_1 \( T \/ p \)^(or m) tilde.eq L_1 \( X \/ p \)^(or m) . $
  Here $L_1 L_2 = L_1$, and all functors involved preserve finite sums.
    Thus this relative abutment is degreewise finite by 60. The error-tower bound in 50 and the finite column
    range give the bounded filtration whose associated graded is $E_oo$.
  The differential has bidegree $\( r \, r - 1 \)$, so a nonzero differential requires $2 \( p - 1 \) divides r -
    1$. For $p gt.eq 7$, no such $r gt.eq 2$ fits the column range;
    the finite abutment then gives the result directly. For $p = 5$, the only possible differential is
  $ d_9 : E_9^(0 \, t) arrow.r E_9^(9 \, t + 8) . $
  Its source is finite. Indeed, coefficient inclusion gives
  $ H^0 \( P_3 \, B_0 \) arrow.r.hook H^0 \( P_3 \, B_(upright("hol")) \) \, $
  and the target is finite by 56. All earlier differentials vanish by the displayed sparsity,
    and hence the $d_9$-image is finite. Column zero is already finite by this invariants argument.
    Columns one through eight are unchanged and are finite from their $E_oo$ groups.
    In column $9$, $E_2^(9 \, t) = E_9^(9 \, t)$ is an extension of its finite $E_oo$-quotient by that finite
    image, and is finite. This proves the proposition also at five, without asserting that $d_9$ vanishes. ◻
]

=== 8.5 The natural ordinary comparison <h3:sec:ordinary-comparison>

The preceding proposition supplies the finiteness needed for the second decompletion.
  We now remove unbounded Laurent tails by combining that finiteness with the contraction already proved on every
  fixed quotient.

#thm([Theorem 8.9.])[
  (Natural ordinary comparison).  #emph[The natural coefficient maps induce quasi-isomorphisms
#[#set math.equation(numbering: n => "(8.10)")
 $ "colim"_d C_(upright("cts"))^bullet \( P_3 \, x^(- d) A \) arrow.r
   C_(upright("cts"))^bullet \( P_3 \, B_(upright("hol")) \) arrow.r
   C_(upright("cts"))^bullet \( P_3 \, B_(upright("pk")) \) . $ <h3:ord:natural-comparison>]

 They preserve products, constants, and coefficient-field descent,
   and remain quasi-isomorphisms with any profinite space of continuous parameters in the convention (8.1).
   Every Frobenius power, including the $p$th-power map, acts invertibly on these untwisted cohomology groups.
   Consequently there is the natural identification
$ H_(upright("cts"))^(*) \( P_3 \, B_0 \) tilde.equiv
  H_(upright("cts"))^(*) \( P_1 times "GL"_2 \( bb(Z)_p \) \, k \) . $

]
] <h3:thm:ordinary-comparison>

#proof[
  By 61, the cohomology of the left-hand complex in (8.10) is finite.
    The lattice, height-two, and spectral arguments establishing this input have already been completed.
  First keep $D > C$ fixed. The quotient $Q_D = B_(upright("hol")) \/
    A_D$ is Polish and has the continuous tail section $T_D$. Hence
  $ 0 arrow.r C_(upright("cts"))^bullet \( G \, A_D \) arrow.r
    C_(upright("cts"))^bullet \( G \, B_(upright("hol")) \) arrow.r C_(upright("cts"))^bullet \( G \, Q_D \) arrow.r 0 $
  is exact degreewise. Its long exact sequence, together with Proposition 8.3, Proposition 8.6,
    shows that $H^a \( G \, Q_D \)$ is finite. It is discrete by 34.
    Since $cal(P)$ preserves $A_D$, it acts on this fixed quotient.
    Represent a quotient cocycle by its continuous holomorphic tail section $f$.
    Its iterates are represented by $T_D cal(P)^n f$, which converge to zero by 57,
    uniformly on the compact cochain domain. These are quotient cocycles.
    Discreteness therefore implies that the given class is killed by some power of $cal(P)$.
    Thus $cal(P)$ is locally nilpotent on the cohomology of every fixed $Q_D$.
  Now form the quotient complex
  $ Q^bullet = C_(upright("cts"))^bullet \( G \, B_(upright("hol")) \) #scale(x: 120%, y: 120%)[\/] "colim"_d
    C_(upright("cts"))^bullet \( G \, A_d \) = "colim"_(D > C) C_(upright("cts"))^bullet \( G \, Q_D \) . $
  The equality follows from the preceding degreewise exact sequences.
    Filtered colimits of vector spaces are exact, so the fixed-quotient argument makes $cal(P)$ locally nilpotent
    on $H^a \( Q^bullet \)$. These groups are finite, using the long exact sequence for this quotient, 56,
    and the separately proved 61. Both Frobenius and $cal(P)$ preserve the bounded-pole cochain union.
    Their descended maps on $Q^bullet$ satisfy $cal(P) upright("Fr") = 1$.
    Thus $cal(P)$ is surjective, hence bijective, on its finite cohomology groups.
    A bijective locally nilpotent endomorphism can act only on the zero group.
    This proves that the first arrow of (8.10) is a quasi-isomorphism. The second is 56.
  Every $A_d$, $B_(upright("hol"))$, and $B_(upright("pk"))$ has finite point-value cohomology and a Polish
    cochain complex. The family-lifting result 35 identifies the cohomology with a profinite parameter space $T$
    at each such stage with continuous maps from $T$ to its finite discrete cohomology.
    In the filtered union, a continuous map from compact $T$ to the discrete colimit has finite image,
    and those finitely many classes occur at one common stage.
    Thus this identification commutes with the stagewise filtered colimit and gives the comparison for every
    profinite $T$. This argument does not assert that $B_0$, or its quotient cochain complex, is Polish.
    Finally the arrows being proved to be quasi-isomorphisms are the coefficient inclusions,
    so they retain products and constants. Write $phi.alt_p \( f \) =
    f^p$ for this untwisted coefficient Frobenius. It is distinct from the fixed $q$-power operator
    $upright("Fr")$ used with the line retractions above. The inclusions commute with $phi.alt_p$,
    which is an automorphism on perfected cochains; hence $phi.alt_p$ is an isomorphism on each of the compared
    cohomology groups. 26 identifies their endpoint with the displayed group cohomology.
    All constructions are natural under the semilinear coefficient-field action,
    so the comparison also descends to the original constants. ◻
]

#thm([Corollary 8.10.])[
  (The ordinary exterior classes).  #emph[For $p gt.eq 5$ the last group in 62 is
$ Lambda_k \( h \, e \, d \) \, wide \| h \| = \| e \| = 1 \, quad \| d \| = 3 . $

 Here $h$ is the logarithmic class of $P_1 = bb(Z)_p^times$,
   $e$ is the determinant logarithm of $"GL"_2 \( bb(Z)_p \)$,
   and $d$ restricts to the orientation class of $"SL"_2 \( bb(Z)_p \)$.
   All three classes have integral lifts in continuous $bb(Z)_p$-cohomology of these frame groups.]
] <h3:ord:exterior-classes>

#proof[
  The group $"SL"_2 \( bb(Z)_p \)$ has dimension three, no element of order $p$, and trivial adjoint orientation.
    Its first mod-$p$ cohomology vanishes. To see this directly, let $f : "SL"_2 \( bb(Z)_p \) arrow.r
    k$ be a continuous homomorphism. Choose $a in bb(Z)_p^times$ with $a^2 - 1$ a unit, possible for $p gt.eq 5$.
    Conjugation by $"diag" \( a \, a^(- 1) \)$ gives
  $ f mat(delim: "(", 1, a^2 t; 0, 1) = f mat(delim: "(", 1, t; 0, 1) . $
  Additivity on this root subgroup and invertibility of $a^2 - 1$ force its restriction to vanish.
    The lower root subgroup is treated by the same displayed conjugation, with $a^(- 2)$ in place of $a^2$.
    These subgroups generate $"SL"_2 \( bb(Z)_p \)$ by row reduction over the local ring $bb(Z)_p$, so $f = 0$.
    Compact group duality now gives $H^2 = 0$ and $H^3 = k$, with the orientation generator, while $H^0 = k$.
  The determinant quotient $bb(Z)_p^times$ has cohomology $Lambda_k \( e \)$:
    average its tame subgroup and use the two-term resolution of its procyclic quotient.
    Its action on $H^3$ of $"SL"_2$ is trivial, since conjugation on $frak(s l)_2$ has determinant one.
    The Hochschild–Serre sequence for
  $ 1 arrow.r "SL"_2 \( bb(Z)_p \) arrow.r "GL"_2 \( bb(Z)_p \) arrow.r^det bb(Z)_p^times arrow.r 1 $
  has only rows $0 \, 3$ and columns $0 \, 1$. It has no possible differential,
    and its edge map onto the orientation row is surjective. Choose a lift $d$ of that row.
    The product $e d$ is nonzero on the associated graded, and odd squares vanish because $p$ is odd.
    This proves the exterior algebra on $e \, d$. The finite-resolution Künneth calculation with $P_1$ adds $h$.
  Integrally the same finite resolutions have finitely generated $bb(Z)_p$-cohomology.
    Integral duality gives the invariant $bb(Z)_p$-orientation line in degree three for $"SL"_2$.
    The preceding elementary-matrix argument also gives $H^1 \( "SL"_2 \, bb(Z)_p \) = 0$.
    Reduction embeds $H^2 \( "SL"_2 \, bb(Z)_p \) \/ p$ into $H^2 \( "SL"_2 \, bb(F)_p \) = 0$;
    finite generation and Nakayama’s lemma therefore give $H^2 \( "SL"_2 \, bb(Z)_p \) = 0$.
    For clarity, vanishing in the integral degree needed for this reduction also follows from the finite
    coefficient models. The length-three reduced resolution and the finite filtration by powers of $p$ make
    $H^a \( "SL"_2 \, bb(Z) \/ p^ell \)$ finite and zero for $a > 3$ at every $ell$.
    Cochain reductions are surjective by continuous set-theoretic sections,
    and the finite cohomology towers are Mittag–Leffler. The inverse-limit cochain sequence therefore gives
    $H^4 \( "SL"_2 \, bb(Z)_p \) = 0$. The coefficient reduction long exact sequence now proves that the integral
    orientation surjects onto its mod-$p$ class. The integral determinant Hochschild–Serre sequence uses the same
    two-term completed resolution for the procyclic quotient, after exact tame averaging.
    It again has no possible differential out of the orientation row, so that orientation lifts to $"GL"_2$.
    Normalized continuous logarithms give integral $e$ and $h$.
    Reduction of these choices gives the three specified mod-$p$ classes. ◻
]

== 9 An integral basis at height one <h3:sec:integral-basis>

The ordinary comparison now identifies the actual coefficient map and its mod-$p$ cup products.
  We use it to construct four maps of $K \( 1 \)$-local spectra.
  The first two are the unit and the determinant class already used at height two.
  The other two will be an integral degree-minus-three class $delta$ and its product with that same determinant
  class. The main point is to lift the ordinary orientation through finite Witt coefficients while keeping the
  transition maps and the maps from constants visible.

Throughout this section $p gt.eq 5$, $T = L_(K \( 3 \)) S$, and $R_1 = L_(K \( 1 \)) S$.
  We use the local relative Morava descent result 50, including its finite coefficient-field extension and its
  naturality for the ordinary tests. The ordinary cochain convention remains the colimit over stable compact pole
  lattices from 3.

=== 9.1 The two logarithms and the orientation class <the-two-logarithms-and-the-orientation-class>

Write

$ G_(upright(f)) = P_1 times "GL"_2 \( bb(Z)_p \) . $

The ordering of these two factors is immaterial; they are the connected and étale frame groups on the ordinary stratum.

#thm([Lemma 9.1.])[
  #emph[For every $ell gt.eq 1$, there are compatible choices of generators for which
$ H_(upright("cts"))^(*) \( G_(upright(f)) \, bb(Z) \/ p^ell \) = Lambda_(bb(Z) \/ p^ell) \( h \, e \, d \) \,
  wide \| h \| = \| e \| = 1 \, quad \| d \| = 3 . $

 The degree-one generators are the two normalized logarithms,
   and the restriction of $d$ to $"SL"_2 \( bb(Z)_p \)$ is its orientation generator.
   Coefficient extension to $W_ell \( k \)$ gives the same exterior algebra over $W_ell \( k \)$.
   These generators are fixed by the changes of integral frames and by coefficient Frobenius.]
] <h3:des:frame-cohomology>

#proof[
  The group $"SL"_2 \( bb(Z)_p \)$ has no element of order $p$:
    a nontrivial $p$-th root of unity in a two-dimensional $bb(Q)_p$-representation has minimal polynomial of
    degree $p - 1 > 2$. It is an analytic duality group of dimension three.
    Its orientation character is trivial, since conjugation on its trace-zero Lie algebra has determinant one.
    The continuous duality theorem, in the finite completed resolution form used in 6,
    gives perfect pairings between degrees $a$ and $3 - a$ with coefficients $bb(Z) \/ p^ell$.
  Its first cohomology is zero by the elementary-matrix argument in 63, now with coefficients $bb(Z) \/ p^ell$.
    That argument applies at every length: choose $b in bb(Z)_p^times$ with $b^2 - 1 in bb(Z)_p^times$;
    conjugation invariance forces a homomorphism to vanish on the upper root subgroup because multiplication by
    $b^2 - 1$ is surjective on its parameter group $bb(Z)_p$.
    The same holds for the lower root subgroup using $b^(- 2) - 1$,
    and these two subgroups generate $"SL"_2 \( bb(Z)_p \)$. Duality gives $H^2 =
    0$ and identifies $H^3$ with $bb(Z) \/ p^ell$. The orientation in the completed resolution gives these
    generators compatibly in $ell$.
  The determinant extension
  $ 1 arrow.r "SL"_2 \( bb(Z)_p \) arrow.r "GL"_2 \( bb(Z)_p \) arrow.r bb(Z)_p^times arrow.r 1 $
  has the section $a mapsto "diag" \( a \, 1 \)$. Its action on the orientation generator is trivial,
    again by determinant one on the adjoint Lie algebra. The finite subgroup $mu_(p - 1)$ has exact invariants,
    and the remaining $bb(Z)_p$ has its two-term continuous resolution.
    The Hochschild–Serre sequence thus has only quotient columns zero and one, and kernel rows zero and three.
    It gives the logarithm $e$, a lift $d$ of the orientation, and their nonzero product. Their squares are zero:
    $e^2 = 0$ because $2$ is invertible and $e$ is odd, and $d^2 =
    0$ also follows from the cohomological dimension. This proves the exterior formula for $"GL"_2 \( bb(Z)_p \)$.
    The factor $P_1 = bb(Z)_p^times$ contributes the second logarithm $h$, by its two-term resolution.
    Tensoring these finite resolution calculations gives the asserted exterior algebra.
  The constructions use determinant and oriented Lie-algebra classes,
    which are preserved under conjugation and transport of a lattice. They have coefficients in $bb(Z) \/ p^ell$.
    Consequently coefficient Frobenius fixes them. Extension to the finite free coefficient ring $W_ell \( k \)$
    commutes with the finite resolution and proves the last assertion. ◻
]

#thm([Lemma 9.2.])[
  #emph[Under the natural ordinary coefficient comparison, the map from the height-one sphere sends its
    degree-minus-one mod-$p$ generator to the connected logarithm $h$.
    Under the same comparison, the mod-$p$ reduction of the normalized height-three logarithm detecting $zeta$ has image
$ a h + b e \, wide a \, b in bb(F)_p \, quad b eq.not 0 . $

 Thus, writing $zeta$ also for its image, the ordinary mod-$p$ coefficient algebra is
$ bb(F)_p \[ v_1^(plus.minus 1) \] ⊗ Lambda_(bb(F)_p) \( h \, zeta \, d \) . $

 In this formula the degree-minus-one $h$-action is the action of the actual unit $R_1 arrow.r L_(K \( 1 \)) T$.]
] <h3:des:unit-directions>

#proof[
  We first identify the unit direction, since an abstract cohomology isomorphism would not specify it.
    In the integral $B P_(*) B P$ cobar construction use the degree-zero differential $d = eta_R - eta_L$,
    and write bars for reduction modulo $p$. The invariance of $macron(v)_1$ makes
  $ c_(v_1) = frac(eta_R \( v_1 \) - eta_L \( v_1 \), p) $
  integral; $d^2 = 0$ and the $p$-torsion-free cobar terms make it a cocycle.
    For $0 arrow.r B P_(*) arrow.r^p B P_(*) arrow.r B P_(*) \/ p arrow.r 0$, the coefficient connecting map is
  $ partial_(upright("coeff")) \( macron(v)_1 \) = \[ c_(v_1) \] in
    "Ext"_(B P_(*) B P)^(1 \, 2 \( p - 1 \)) \( B P_(*) \, B P_(*) \) . $
  Its mod-$p$ reduction is represented by $macron(c)_(v_1)$.
    On the mod-$p$ height-one open, $macron(v)_1$ is an invariant unit,
    so $macron(c)_(v_1) \/ macron(v)_1$ is a cocycle of cohomological degree one and internal degree zero.
    Its naturality is literal cobar naturality: for two composable formal-group arrows,
    the difference of the two images of $v_1$ is the sum of the two corresponding differences after transport.
    Changing a trivialization by one tautological arrow therefore changes the pulled-back cocycle by a coboundary.
  Pull the height-one specialized formal law to Honda form on the connected-marking torsor of 13.
    The preceding coboundary identity identifies $macron(c)_(v_1) \/ macron(v)_1$ with the Honda-height-one class.
    It is nonzero: on an automorphism $a in 1 + p bb(Z)_p$ the integral periodic frame changes $v_1$ by
    $a^(p - 1)$, and the cocycle is
  $ frac(a^(p - 1) - 1, p) med \( mod med p \) . $
  At $a = 1 + p$ this is $p - 1 med \( mod med p \)$, a unit.
    It is a unit multiple of the normalized logarithm on $P_1$.
    We choose $h$ with the corresponding normalization. The leading coefficient of the formal-group arrow has been
    retained here through the periodic frame $U$; discarding that frame would discard this calculation.
  The height-one sphere calculation identifies its mod-$p$ groups with $bb(F)_p \[ v_1^(plus.minus 1) \] ⊗
    Lambda \( h \)$. For the Adams self-map normalized in 61,
    the image of the Moore bottom cell has $B P$-Hurewicz coefficient $macron(v)_1$.
    Its Moore boundary is a unit multiple of $alpha_1$. The normalized cobar terms for $B
    P$ are even and $p$-torsion-free, so the comparison in 7 between the termwise cone and the cone of
    totalization applies to this cofiber sequence. For the lift $v_1$,
    the coefficient connecting cocycle is $c_(v_1)$, while the actual desuspended boundary has leading detector
    $- \[ c_(v_1) \]$. The internal degree $2 \( p - 1 \)$ is even,
    and strict desuspension contributes no further sign. Choose the negative of this boundary class,
    map it to the Moore quotient, and invert the same self-map.
    The resulting source generator in degree $- 1$ has detector $macron(c)_(v_1) \/ macron(v)_1$,
    the logarithm normalized above. The odd-prime Adams-summand fiber is realized with the unit as its first map
    in #cite(label("BB")) Section 4.2, pp. 30–32. Its logarithm, mod-$p$ algebra,
    and unit-induced rational splitting are given in #cite(label("BB")) Section 4.3, Remarks 4.16–4.17 and (4.18).
    The maps of the preceding paragraph are the unit maps of the formal-group cobar construction.
    Hence their $h$ is precisely the $R_1$-action, rather than an independently chosen degree-one direction.
  For the second direction use the actual determinant identity in 13:
    the determinant of the middle height-three frame is the product of the norm of the connected height-one frame
    and the determinant of the rank-two kernel frame. It is an identity of integral determinant lattices.
    Applying the normalized logarithm yields the sum of the two logarithms,
    with the signs introduced by inverse-frame conventions. In particular its coefficient on $e$ is a unit modulo
    $p$. This is the class $zeta$, by its determinant construction.
    The change of basis from $\( h \, e \)$ to $\( h \, zeta \)$ is invertible.
  Finally, Theorem 8.9, Lemma 9.1 identify the actual coefficient algebra with this exterior algebra.
    The comparisons preserve products and the two unit maps, proving all assertions. ◻
]

The coefficient calculation now has columns only from zero to five.
  Since the internal degrees are still multiples of $2 \( p - 1 \)$, no mod-$p$ differential is possible.
  Cup products give the associated-graded multiplication. For the actions used here one may use a Moore pairing
  and the height-one Adams self-map; their cobar actions are the same cup actions.
  We next lift the degree-three orientation before using these products to construct an equivalence of spectra.

=== 9.2 Finite Witt length and ordinary integral coefficients <finite-witt-length-and-ordinary-integral-coefficients>

Put

$ A_ell = \( W \( k \) \/ p^ell \) \[ \[ x \, y \] \] \, wide D_ell = A_ell \[ x^(- 1) \] . $

Write $phi.alt_p \( a \) = a^p$ for coefficient $p$-Frobenius on the characteristic-$p$ rings $B_0$ and
  $B_(upright("pk"))$, and let $sigma_k$ be the Witt automorphism of $W \( k \)$ lifting $a mapsto a^p$ on $k$.
  This notation is distinct from the chosen $q$-power operator used in the ordinary root comparison.
  The symbol $D_ell$ is separate from the distribution parameter of 6.
  The action of $P_3$ preserves $A_ell$ and satisfies $g \( x \) = x u_g + p h_g$,
  with $u_g$ a unit and $h_g in A_ell$. It therefore extends to $D_ell$,
  since the second term is nilpotent relative to the invertible first term.
  An action on the uncompleted mixed-characteristic localization $W \( k \) \[ \[ x \, y \] \] \[ x^(- 1) \]$ is
  not needed.

To specify the cochain topologies at finite length, use the following stable compact additive lattices, for $d gt.eq 0$:

#[#set math.equation(numbering: n => "(9.1)")
 $ cal(L)_(ell \, d) = \[ x \]^(- d) W_ell \( A \) \, wide cal(M)_(ell \, d) =
   sum_(j = 0)^(ell - 1) p^j x^(- d - j) A_ell . $ <h3:des:witt-pole-lattices>]

The first has its $i$-th Witt coordinate in $x^(- d p^i) A$.
  These lattices exhaust $W_ell \( B_0 \)$; the bounds are cofinal with finite coordinate pole bounds. Moreover,

$ x^(- d) A_ell subset cal(M)_(ell \, d) subset x^(- d - ell + 1) A_ell \, $

so the second family is cofinal with bounded poles in $D_ell$.
  Stability of the first follows from $g \( \[ x \] \) = \[ x \] \[ overline(u)_g \]$.
  For the second, expand $\( x u_g + p h_g \)^(- d - j)$ modulo $p^(ell - j)$;
  a term with an extra $p^a$ has pole at most $d + j + a$, as required by the $\( j + a \)$-th summand.
  These actions are continuous in the compact lattice topologies.
  All cochains on either union mean the filtered colimit of the continuous cochains on these stable lattices.
  In particular, no coordinatewise pole-bound set that fails to be additive is being used as a coefficient module.

#thm([Lemma 9.3.])[
  #emph[For each $ell gt.eq 1$, the last-ghost formula
#[#set math.equation(numbering: n => "(9.2)")
 $ gamma_ell \( a_0 \, dots.h \, a_(ell - 1) \) = sum_(i = 0)^(ell - 1) p^i tilde(a)_i^(thin p^(ell - 1 - i)) quad
   upright("in ") D_ell $ <h3:des:ghost-formula>]

 for arbitrary lifts $tilde(a)_i in D_ell$ defines a natural equivariant unital ring map
$ W_ell \( B_0 \) arrow.r^(gamma_ell) D_ell . $

 Both this map and the natural coefficient map
$ beta_ell : W_ell \( B_0 \) arrow.r W_ell \( B_(upright("pk")) \) $

 induce isomorphisms on $P_3$-cohomology with the prescribed cochain conventions.
   For $ell gt.eq 2$, let $R_ell : W_ell \( B_0 \) arrow.r W_(ell - 1) \( B_0 \)$ be Witt truncation and let
   $"red"_(ell \, ell - 1) : D_ell arrow.r D_(ell - 1)$ be coefficient reduction. Then
#[#set math.equation(numbering: n => "(9.3)")
 $ "red"_(ell \, ell - 1) gamma_ell = gamma_(ell - 1) R_ell W_ell \( phi.alt_p \) wide \( ell gt.eq 2 \) .
   $ <h3:des:ghost-transition>]

 The map $gamma_ell$ fixes the constant $bb(Z) \/ p^ell = W_ell \( bb(F)_p \)$.]
] <h3:lem:ghost-comparison>

#proof[
  The binomial theorem gives
  $ a equiv b med \( mod med p \) quad arrow.r.double quad a^(p^j) equiv
    b^(p^j) med \( mod med p^(j + 1) \) wide \( j gt.eq 0 \) . $
  For the $i$-th summand of (9.2), changing a lift consequently changes the result by a multiple of $p^ell$.
    This proves independence of all lifts. Lift two Witt vectors to $W_ell \( D_ell \)$,
    and use their Witt sum or product to lift the corresponding operation over $B_0$.
    The last ghost component on $W_ell \( D_ell \)$ is a ring homomorphism.
    Its reduction and the lift independence prove the ring identities for $gamma_ell$.
    The construction is natural for maps of the reduction $D_ell arrow.r B_0$,
    and hence equivariant for the actual $P_3$-action on $D_ell$.
    These are the elementary ghost identities of #cite(label("Hesselholt")) Lemma 1 and Proposition 2.
  The map is continuous on each compact pole lattice. Indeed,
    coefficientwise lifts and the finite polynomial (9.2) prove continuity on $W_ell \( A \)$;
    its ring property then gives
  $ gamma_ell \( cal(L)_(ell \, d) \) subset x^(- d p^(ell - 1)) A_ell subset cal(M)_(ell \, d p^(ell - 1)) . $
  It therefore acts on the specified cochain colimits.
  Filter the source by $V^i W_(ell - i) \( B_0 \)$ and the target by $p^i D_ell$, for $0 lt.eq i lt.eq ell$.
    The source filtration iterates the one-coordinate restriction–Verschiebung sequence in
    #cite(label("Hesselholt")) proof of Lemma 9, p. 6. Their $i$-th graded pieces are additively $B_0$;
    the induced map is
  $ a mapsto a^(p^(ell - 1 - i)) . $
  The quotient sequences remain exact on cochains. For a Witt quotient the section is the coordinate section $a
    mapsto V^i \[ a \]$; for the corresponding target quotient use $a mapsto p^i
    tilde(a)$ with coefficientwise lifts. These sections are continuous and send a compact bounded-pole family
    into some bounded-pole stage of (9.1). They need not be additive or equivariant:
    their role is to give degreewise surjectivity of continuous cochains.
    The kernels and differentials are the equivariant ones.
  By 62, the coefficient $p$-Frobenius $phi.alt_p$ is an isomorphism on $H^(*) \( P_3 \, B_0 \)$.
    The long exact cohomology sequences and induction on the finite filtration now prove the assertion for
    $gamma_ell$. For $beta_ell$, use the two Verschiebung filtrations.
    Their graded maps are the natural comparison $B_0 arrow.r B_(upright("pk"))$,
    which is a cohomology isomorphism by the same theorem. Witt-coordinate sections on the analytic side are
    continuous, so the identical finite-filtration argument proves the assertion for $beta_ell$.
  In characteristic $p$, truncated Witt Frobenius is
  $ R_ell W_ell \( phi.alt_p \) \( a_0 \, dots.h \, a_(ell - 1) \) = \( a_0^p \, dots.h \, a_(ell - 2)^p \) \; $
  see #cite(label("Hesselholt")) Lemma 8. Substitution into (9.2) proves (9.3).
    Since $gamma_ell$ is unital, it is the identity on $bb(Z) \/ p^ell$.
    Its restriction to $W_ell \( k \)$, under the identification with $W \( k \) \/ p^ell$,
    is $sigma_k^(ell - 1)$; we do not identify that restriction with the identity. ◻
]

#thm([Lemma 9.4.])[
  #emph[The actual ordinary constants map gives natural equivalences
$ eta_ell : R Gamma_(upright("cts")) \( G_(upright(f)) \, W_ell \( k \) \) arrow.r^(med tilde.eq med) R
  Gamma_(upright("cts")) \( P_3 \, W_ell \( B_(upright("pk")) \) \) . $

 They commute with truncation, coefficient Frobenius, and the maps from $bb(Z) \/ p^ell$ constants.
   The maps $beta_ell \, gamma_ell$ in 66 preserve these latter constant maps as well.]
] <h3:des:witt-constants>

#proof[
  On the ordinary quotient stack, the comparison of 26 is induced by its map to $B
    G_(upright(f))$ and by the coefficient unit $k arrow.r cal(O)^flat$.
    Apply $W_ell$ to the coefficient sheaves on this same diagram.
    It gives the displayed map before taking cohomology, and all the asserted naturalities follow from the natural
    Witt operations. Its Verschiebung filtration has the length-one constants comparison on each graded piece.
    The continuous coordinate sections make the associated short exact sequences exact on the computing cochains,
    including their profinite parameters. Finite-filtration induction from 26 proves the equivalence.
  The coefficient map $beta_ell$ preserves constants by definition. For $gamma_ell$, the composite
  $ C_(upright("cts"))^(*) \( P_3 \, bb(Z) \/ p^ell \) arrow.r
    C_(upright("cts"))^(*) \( P_3 \, W_ell \( B_0 \) \) arrow.r C_(upright("cts"))^(*) \( P_3 \, D_ell \) $
  is exactly the ordinary coefficient inclusion, since $gamma_ell$ is the identity on $bb(Z) \/ p^ell$.
    Thus these are statements about the specified maps from constants,
    not about an abstract isomorphism of their images in cohomology. ◻
]

#thm([Lemma 9.5.])[
  #emph[The ordinary spectrum $L_1 \( T \/ p^ell \)$ is the totalization of the termwise $L_1 \( - \/ p^ell \)$
    Morava descent object. Its terms are even, and their internal degree-zero cochain complex is the $D_ell$
    complex above. The corresponding spectral sequence is strongly convergent, has columns $0 lt.eq s lt.eq 5$,
    and has no differentials. All its abutment groups are finite in each stem.
    In particular there is a natural identification
#[#set math.equation(numbering: n => "(9.4)")
 $ pi_(- 3) L_1 \( T \/ p^ell \) tilde.equiv H_(upright("cts"))^3 \( G_3 \( k \) \, D_ell \) \,
   $ <h3:des:minus-three-edge>]

 where the right side includes the coefficient Galois descent just described.]
] <h3:des:finite-length-model>

#proof[
  The totalization assertion is 50. Put $M_ell = bb(S)_(\( p \)) \/ p^ell$ and $E = E_3 \( k \)$.
    The completion map identifies $M_ell$ with $S \/ p^ell$, naturally in the ordinary Moore quotient transitions:
    its cofiber has zero mod-$p$ quotient, so multiplication by $p$ is an equivalence there and every mod-$p^ell$
    quotient vanishes. Each finite $M_ell$ has type one, since its rational homology vanishes and its
    $K \( 1 \)$-homology is nonzero. Let $psi : Sigma^(2 \( p - 1 \)) M_1 arrow.r
    M_1$ be the normalized Adams $v_1$-map chosen in the proof of 61;
    its action on $E \/ p$ is multiplication by $x U^(p - 1)$.
    The periodicity theorem #cite(label("RavenelNilpotence")) Theorem 1.5.4(i)–(ii),
    pp. 9–10 supplies a $v_1$-map $f_ell : Sigma^(d_ell) M_ell arrow.r M_ell$ and,
    for the ordinary reduction $r_ell : M_ell arrow.r M_1$, positive integers $i_ell \,
    j_ell$ such that $d_ell i_ell = 2 j_ell \( p - 1 \)$ and
  $ r_ell compose f_ell^(i_ell) tilde.eq psi^(j_ell) compose Sigma^(2 j_ell \( p - 1 \)) r_ell . $
  Here the theorem is applied after a common suspension to finite CW-complexes and then desuspended to spectra.
    Multiplication of the Adams map by the integer unit used in its normalization preserves its $v_1$-map
    property. Fix this iterate $phi_ell = f_ell^(i_ell)$, of degree $e_ell = 2 j_ell \( p - 1 \)$.
  The cofiber sequence $E arrow.r^(p^ell) E arrow.r E \/ p^ell$ and evenness of $E \/ p^ell$ give an isomorphism
  $ \[ Sigma^(e_ell) E \/ p^ell \, E \/ p^ell \]_E arrow.r^(med tilde.eq med) pi_(e_ell) \( E \/ p^ell \) $
  by evaluation on the unit: the possible kernel is a quotient of $pi_(e_ell + 1) \( E \/ p^ell \) = 0$,
    and multiplication by $p^ell$ vanishes on the group on the right.
    Thus the $E$-module map induced by $phi_ell$ is determined by a scalar $theta_ell$ in this group.
    Applying $E and -$ to the chosen reduction square proves
  $ theta_ell med mod med p = \( x U^(p - 1) \)^(j_ell) \, wide theta_ell = U^(j_ell \( p - 1 \)) c_ell \, wide
    c_ell = x^(j_ell) + p b_ell quad \( b_ell in A_ell \) . $
  A lift of $theta_ell$ to $pi_(e_ell) E$ gives the same $E$-module map by the evaluation isomorphism.
    Tensoring with an ordinary $E$-module $N_Q$ therefore makes $phi_ell$ act on $pi_(*) \( N_Q \/ p^ell \)$ by
    multiplication by this scalar.
  The two localizations of $A_ell$ at $c_ell$ and at $x$ agree canonically.
    Indeed, in $A_ell \[ x^(- 1) \]$ the factorization $c_ell =
    x^(j_ell) \( 1 + p b_ell x^(- j_ell) \)$ makes $c_ell$ invertible.
    In $A_ell \[ c_ell^(- 1) \]$, the factorization $x^(j_ell) =
    c_ell \( 1 - p b_ell c_ell^(- 1) \)$ makes $x$ invertible.
    Both parenthesized factors have finite geometric-series inverses because $p^ell = 0$.
    Miller’s odd-prime result for $M_1$ #cite(label("Miller1981")) Theorem 4.11 and Corollary 4.12,
    together with the thick-subcategory argument in #cite(label("RavenelNilpotence")) Section 7.5,
    after Conjecture 7.5.5, p. 85, identifies the telescope of a $v_1$-map with $L_1
    M_ell$ for every finite type-one $M_ell$. Taking the chosen iterate does not change the telescope,
    since it selects a cofinal subsequence. As $L_1$ is smashing,
    this is an equivalence under $N_Q \/ p^ell$ between $L_1 \( N_Q \/ p^ell \)$ and the telescope of its
    $phi_ell$-action.
  For the actual term $N_Q = cal(N)_3^q$, with $Q = P_3^q$, 51 gives even, $p$-torsion-free coefficients.
    Coefficientwise continuous lifts identify $pi_0 \( N_Q \/ p^ell \) = C_(upright("cts")) \( Q \, A_ell \)$.
    Homotopy groups commute with the telescope, so the scalar calculation and the two localizations above give
  $ pi_0 L_1 \( N_Q \/ p^ell \) tilde.equiv C_(upright("cts")) \( Q \, A_ell \) \[ x^(- 1) \] =
    "colim"_d x^(- d) C_(upright("cts")) \( Q \, A_ell \) . $
  The odd groups vanish, and the other even groups are its periodic translates.
    This is the algebraic bounded-pole localization; the stable cofinal lattices $cal(M)_(ell \, d)$ specify it in
    (9.1).
  These coefficient identifications preserve the actual transition maps.
    Each is the unique extension of the map on coefficients induced by the $L_1$-localization unit,
    by the universal property of localization of a module at $x$.
    The ordinary Moore quotient transition is induced by the cofiber square with vertical maps $p$ and
    $upright("id")$; it reduces coefficients and preserves the fixed coordinate $x$.
    Naturality of the localization unit therefore identifies its localized coefficient map with ordinary reduction
    $D_ell arrow.r D_(ell - 1)$. The same argument applies to every coface and codegeneracy of the actual descent
    object: coefficient actions send $x$ to $x u_g + p h_g$, which is invertible in $D_ell$,
    and precomposition on continuous functions preserves the bounded-pole colimit.
    Hence the degree-zero coefficient complex is the stated $D_ell$ complex, with its actual cochain maps,
    ordinary Moore transitions, and maps from constants.
  The tame central units kill internal degrees not divisible by $2 \( p - 1 \)$.
    For all remaining degrees the finite $p$-filtration has associated graded the mod-$p$ coefficient complex,
    trivialized by powers of $v_1$. By Theorem 8.9, Lemma 9.1 that complex has finite cohomology in columns zero
    through five, and vanishes above five. The long exact sequences of the finite $p$-filtration give those same
    finiteness and vanishing conclusions in every length. There is no assertion that $v_1$ itself is an integral
    invariant in length $ell$; only the associated-graded trivialization is used.
  A differential has $2 \( p - 1 \) divides r - 1$, so the first candidate has $r = 2 p - 1 gt.eq 9$.
    It cannot fit the column range $0 lt.eq s lt.eq 5$. Thus the spectral sequence collapses,
    and its finite column range proves degreewise finiteness of the abutment. Strong convergence comes from 50.
  Finally, in stem $- 3$ one must have $t - s = - 3$ with $0 lt.eq s lt.eq 5$ and $t in 2 \( p - 1 \) bb(Z)$.
    The unique solution is $\( s \, t \) = \( 3 \, 0 \)$. There is consequently no additive extension or choice of
    filtration quotient in (9.4). The construction is natural in the Moore quotient maps and in coefficient
    constants. This proves its stated naturality as well. ◻
]

The finite coefficient calculation has now isolated one degree-three line at every length,
  with ordinary reduction as the spectral transition. To turn a compatible family on these lines into a map of
  spectra, we spell out the completion step.

#thm([Lemma 9.6.])[
  (Completion inside height one).  #emph[Let $M$ be an $E \( 1 \)$-local $S$-module. The natural map
$ M arrow.r hat(M)_p := "holim"_(ell gt.eq 1) M \/ p^ell $

 is its $K \( 1 \)$-localization in $S$-modules. Here $M \/ p^ell$ is the cofiber of multiplication by $p^ell$,
   with the ordinary Moore quotient transitions.]
] <h3:lem:height-one-completion>

#proof[
  Write $S \/ p^oo = "colim"_ell S \/ p^ell$, with the usual inclusions of Moore spectra.
    Duality of the finite Moore $S$-modules identifies $M \/ p^ell tilde.eq
    F_S \( Sigma^(- 1) S \/ p^ell \, M \)$. The inclusion $S \/ p^ell arrow.r
    S \/ p^(ell + 1)$ is induced by the square with vertical maps $upright("id")$ and $p$;
    dualizing gives the ordinary quotient transition induced by $p$ and $upright("id")$.
    Thus these identifications respect the tower. Applying the internal function functor to
  $ Sigma^(- 1) S \/ p^oo arrow.r S arrow.r S \[ 1 \/ p \] $
  therefore gives a natural fiber sequence
  $ F_S \( S \[ 1 \/ p \] \, M \) arrow.r M arrow.r hat(M)_p . $
  Multiplication by $p$ is invertible on the first term. Moreover
  $ F_S \( S \[ 1 \/ p \] \, hat(M)_p \) tilde.eq F_S \( S \[ 1 \/ p \] ⊗_S Sigma^(- 1) S \/ p^oo \, M \) = 0 . $
  Thus $hat(M)_p$ is local with respect to the Moore quotient:
    maps from any $p$-invertible $S$-module vanish, since such a module is an $S \[ 1 \/ p \]$-module and the
    displayed function object is zero. Each $M \/ p^ell$ is $E \( 1 \)$-local,
    and local objects are closed under limits, so $hat(M)_p$ is also $E \( 1 \)$-local.
  In the $E \( 1 \)$-local category the Moore-acyclic objects are exactly the rational objects:
    the Moore condition makes $p$ invertible, and conversely rationalization kills every Moore spectrum.
    The height-one fracture square identifies these with the $K \( 1 \)$-acyclic $E \( 1 \)$-local objects.
    Hence Moore localization and $K \( 1 \)$-localization have the same acyclic objects and the same local objects
    in this category. The $E \( 1 \)$-localization unit is itself a $K \( 1 \)$-equivalence,
    so passing first to $E \( 1 \)$-local objects does not change $K \( 1 \)$-localization.
    The displayed natural map is therefore the asserted localization in $S$-modules. ◻
]

#thm([Proposition 9.7.])[
  #emph[There is a class
$ delta in pi_(- 3) L_(K \( 1 \)) T $

 whose reduction is the orientation generator $d$ in 65. Moreover,
$ pi_(- 3) L_(K \( 1 \)) T tilde.equiv bb(Z)_p \, $

 with $delta$ a generator after the chosen orientation normalization.
   The finite-length identifications used to construct it preserve the given maps from $P_3$-cochains with
   integral constant coefficients.]
] <h3:prop:integral-delta>

#proof[
  Choose the compatible classes $o_ell in H^3 \( G_(upright(f)) \, bb(Z) \/ p^ell \)$ of 64.
    Write $rho_ell$ for the cohomology isomorphism induced by $beta_ell$, and set
  $ nu_ell = rho_ell^(- 1) eta_ell \( o_ell \) \, wide z_ell = gamma_ell \( nu_ell \) in H^3 \( P_3 \, D_ell \) . $
  Here the constant coefficient extension to $W_ell \( k \)$ is understood.
    The naturalities in 67 give $R_ell nu_ell = nu_(ell - 1)$.
    Coefficient Frobenius fixes $o_ell$, because it fixes $bb(Z) \/ p^ell$; injectivity of $rho_ell$ then gives
  $ W_ell \( phi.alt_p \) \( nu_ell \) = nu_ell . $
  Using (9.3) we obtain
  $ "red"_(ell \, ell - 1) \( z_ell \) = gamma_(ell - 1) R_ell W_ell \( phi.alt_p \) \( nu_ell \) = z_(ell - 1) . $
  Thus the Frobenius twist in the ghost transition does not obstruct compatibility of these actual integral
    orientation classes.
  By Lemma 9.1, Lemma 9.4, Lemma 9.3, the degree-three cohomology over $k$ is one free copy of $W_ell \( k \)$.
    The determinant and orientation constructions are preserved under coefficient Galois action and transport of
    the integral frames. Normal-basis descent therefore identifies its descended group with $bb(Z) \/ p^ell$.
    The elements $z_ell$ are generators and their transitions are ordinary reduction.
    This proves the corresponding assertions for $pi_(- 3) L_1 \( T \/ p^ell \)$ by (9.4).
  Apply 69 to $L_1 T$. Exactness of $L_1$ identifies its Moore quotients with $L_1 \( T \/ p^ell \)$. Consequently
  $ L_(K \( 1 \)) T tilde.eq "holim"_ell L_1 \( T \/ p^ell \) . $
  All finite-length homotopy groups are finite by 68; their inverse systems are Mittag–Leffler,
    so the Milnor $lim^1$-term vanishes in every stem. The compatible generators $z_ell$ therefore give an actual
    class $delta$, and their inverse limit is $bb(Z)_p$. The last assertion follows from the equality of the
    constant cochain maps in 67 and from the natural edge identification in 68. ◻
]

#prodef([Remark 9.8.])[
  The preceding argument does not identify the usual full Witt tower on the uncompleted $B_0$ with the ordinary
    $D_ell$ tower. For later use, the exact statement needed for any class from integral $P_3$-constants is
    simpler. Its image in $W_ell \( B_0 \)$ is fixed by coefficient Frobenius,
    so (9.3) gives an ordinary reduction-compatible family in $D_ell$.
    The two cohomology isomorphisms in 66 preserve the order of each finite-length element.
    Hence unbounded $p$-power order of the corresponding analytic Witt images implies unbounded order of these
    specified ordinary images. Combined with 70, this is the bridge used by the rational detector in 10.
] <h3:des:constants-order-bridge>

=== 9.3 The actual height-one equivalence <the-actual-height-one-equivalence>

#thm([Theorem 9.9.])[
  #emph[The integral classes $zeta$ and $delta$ above and the canonical unit define an equivalence
$ \( 1 \, zeta \, delta \, zeta delta \) : R_1 or Sigma^(- 1) R_1 or Sigma^(- 3) R_1 or Sigma^(- 4) R_1
  arrow.r^(med tilde.eq med) L_(K \( 1 \)) T . $

 The maps use the $R_1$-action and the multiplication induced from $T$.
   In particular the first two components are the $K \( 1 \)$-localizations of the same maps from $S$ used in 53.]
] <h3:thm:height-one-maps>

#proof[
  The target is a $K \( 1 \)$-local algebra and hence a module over the local unit $R_1$.
    Each homotopy class displayed defines an actual map from the indicated suspension of $R_1$.
    The product $zeta delta$ is formed using this algebra multiplication,
    so no independent choice of a degree-minus-four line is being made.
  Modulo $p$, the source groups are the direct sum of the four shifts of
  $ pi_(*) \( R_1 \/ p \) = bb(F)_p \[ v_1^(plus.minus 1) \] ⊗ Lambda \( h \) . $
  By 65, the images of $1 \, zeta \, d \, zeta d$, together with their $h$-multiples,
    are exactly the eight exterior basis elements in the target coefficient calculation.
    The class $delta$ reduces to $d$ by 70. Products are detected by the cup action,
    so these statements specify the leading filtered class of each of the eight actual homotopy images.
    The spectral sequence has collapsed with finite filtration.
    In each stem, filter the source homotopy group by assigning these eight periodic basis elements the
    cohomological degrees of their displayed leading classes.
    The map is filtered, and its associated-graded map is an isomorphism in every degree.
    Induction on the finite filtration, using the short exact sequences for successive filtration quotients,
    shows that the original map of homotopy groups is an isomorphism.
    This argument does not require an a priori splitting of the target filtration.
    The displayed map is therefore an isomorphism on mod-$p$ homotopy in every stem.
  Its cofiber is $K \( 1 \)$-local, hence derived $p$-complete by 69.
    The vanishing of its mod-$p$ quotient makes multiplication by $p$ an equivalence,
    so all its quotients by $p^ell$ vanish. Derived completeness then makes the cofiber zero.
    This proves the equivalence, including the asserted compatibility of its first two components. ◻
]

== 10 The rational primitive and its localization <h3:sec:rational>

The integral basis gives a distinguished line $bb(Z)_p delta subset pi_(- 3) L_(K \( 1 \)) T$.
  We now construct a rational class in $pi_(- 3) L_0 T$ whose image is nonzero in its rational span $bb(Q)_p delta$.

Fix $C = hat(overline(bb(Q))_p)$, with tilted base $C^flat$ and untilt divisor $oo$.
  Let $cal(M)$ classify $P_3$-structured forms $E$ of $V_3$ equipped with a quotient line at $oo$.
  The lower modification $E^(-)$ is a slope-zero rank-three bundle, hence a rational local system;
  its determinant inherits an integral lattice from the $P_3$-structure. The two frame descriptions give

$ cal(M) & tilde.eq \[ upright(bold(P))_C^2 \/ P_3 \] tilde.eq \[ Omega_C^2 \/ J_3 \] \,\
J_3 & = { g in "GL"_3 \( bb(Q)_p \) : v_p \( det g \) = 0 } \, $

where $Omega_C^2$ is the projective plane minus its $bb(Q)_p$-rational hyperplanes.
  The first presentation records quotient lines of a framed $E$;
  the second records upper modifications of a rationally framed $E^(-)$ with the prescribed determinant lattice.
  These identifications, including their common arithmetic action, are proved in 75.

The projective presentation singles out the reduced-trace line from $P_3$ as the arithmetic-invariant part of
  rational degree-three cohomology. The Drinfeld presentation places a nonzero matrix-trace class in that same
  line. Pulling their proportionality back along the ordinary sequence then restricts the rank-three matrix trace
  to the trace of its original integral rank-two kernel. We retain these actual classifying maps through finite
  Witt coefficients and exact Morava descent to identify the nonzero image in $bb(Q)_p delta$ under localization.

=== 10.1 Integral coefficients and continuous geometric descent <integral-coefficients-and-continuous-geometric-descent>

Put $Lambda_ell = bb(Z) \/ p^ell$. For a small v-stack $Z$ in this section, set

$ R Gamma_(upright("int")) \( Z \) = R "proj lim"_ell R Gamma_v \( Z \, Lambda_ell \) \, wide
  H_(upright("int"))^i \( Z \) = H^i \( R Gamma_(upright("int")) \( Z \) \) \, wide H_(upright(b))^i \( Z \) =
  H_(upright("int"))^i \( Z \) \[ 1 \/ p \] . $

For a locally profinite group $G$ we use a separate complex in $D \( bb(Z) \)$,
  defined independently of a geometric base:

$ R Gamma_(upright("int")) \( G \) = R "proj lim"_ell C_(upright("cts"))^bullet \( G \, Lambda_ell \) \, wide
  H_(upright("int"))^i \( G \) = H^i \( R Gamma_(upright("int")) \( G \) \) \, wide H_(upright(b))^i \( G \) =
  H_(upright("int"))^i \( G \) \[ 1 \/ p \] . $

The coefficients here are finite discrete modules with trivial action,
  and the cochains are the inhomogeneous cochains of 3. At each finite level the cochain complex is the external
  derived cohomology of the condensed classifying topos $upright(B)_(upright("cond")) G$,
  the topos of condensed sets with $G$-action. Indeed, the standard resolution there has terms indexed by $G^a$.
  Finite discrete coefficients are solid, and their higher condensed cohomology on a locally profinite set
  vanishes. Its degree-zero sections are $C_(upright("cts")) \( G^a \, Lambda_ell \)$,
  so the standard resolution gives the natural identification in the derived category

$ R Gamma_(upright("Cond")) \( upright(B)_(upright("cond")) G \, underline(Lambda_ell) \) tilde.eq
  C_(upright("cts"))^bullet \( G \, Lambda_ell \) $

by #cite(label("AnschuetzSolidGroupCohomology")) Section 2, standard resolution and Lemmas 2.1–2.2, pp. 5–7.
  This is an external complex of ordinary modules. We reserve $R
  Gamma \( G \, K \)$ for internal condensed derived invariants of a condensed coefficient object $K$ with its
  actual $G$-action; evaluation at the point, denoted $\( * \)$, gives its external complex.

Twists are made at finite level. For compact $G$, reduction of finite cochains is surjective:
  lift the finitely many values on their clopen fibers. Thus the derived coefficient limit is represented by
  $C_(upright("cts"))^bullet \( G \, bb(Z)_p \)$. Every continuous function from the compact space $G^a$ to
  $bb(Q)_p$ is bounded, so exact inversion of $p$ identifies this complex with
  $C_(upright("cts"))^bullet \( G \, bb(Q)_p \)$. For the noncompact groups below we retain the displayed
  definition using finite coefficients before the derived limit and inversion of $p$.

We now specify how a group class enters relative geometric cohomology.
  For a small v-base $B$, let $underline(G)_B = B times underline(G)$ be the constant locally profinite v-group
  and put $upright(B)_B G = \[ B \/ underline(G)_B \]$, with trivial action on $B$.
  Products with group parameters below are over this base.

#thm([Lemma 10.1.])[
  (Finite classifying maps).  #emph[For a $G$-space $X$ over $B$ there is a natural finite coefficient map
#[#set math.equation(numbering: n => "(10.1)")
 $ sans(u)_(X \, G \, ell) : C_(upright("cts"))^bullet \( G \, Lambda_ell \) arrow.r
   "Tot"_(\[ a \] in Delta) R Gamma_v \( X times underline(G^a) \, Lambda_ell \) tilde.eq R
   Gamma_v \( \[ X \/ G \] \, Lambda_ell \) . $ <h3:eq:rat-finite-classifying>]

 For a $G$-torsor $T arrow.r Z$ over $B$ with relative classifying map $c_T : Z arrow.r upright(B)_B G$, this gives
$ "cl"_(c_T \, ell) := c_T^(*) sans(u)_(B \, G \, ell) : C_(upright("cts"))^bullet \( G \, Lambda_ell \) arrow.r
  R Gamma_v \( Z \, Lambda_ell \) . $

 It equals (10.1) for $X = T$ under $\[ T \/ G \] tilde.eq Z$.
   These maps commute with continuous group homomorphisms and extension of torsor structure, equivariant maps,
   base change, base automorphisms with compatible descent, coefficient reductions, and cup products.
   They also commute with the finite coefficient units $Lambda_ell = W_ell \( bb(F)_p \) arrow.r
   W_ell cal(O)^flat$. Their derived coefficient limits and their rationalizations define maps denoted
   $"cl"_(c_T \, upright("int"))$ and $"cl"_(c_T \, upright(b))$ on the corresponding cohomology.]
  #emph[For an algebraically closed perfectoid field $C$ of characteristic zero, put $B_C =
    "Spa" \( C \, cal(O)_C \)^diamond.stroked.small$. For every profinite $Q$ and every finite constant
    coefficient module $A$ on $B_C$, the actual constants map is an equivalence
#[#set math.equation(numbering: n => "(10.2)")
 $ C_(upright("cts")) \( Q \, A \) \[ 0 \] arrow.r^(med tilde.eq med) R
   Gamma_v \( B_C times underline(Q) \, A \) . $ <h3:eq:rat-geometric-point-constants>]

 This is natural in $Q$, in $A$, and in base automorphisms with their actions on $A$.
   In particular it includes the finite Tate fibers $Lambda_ell \( - j \)$.
   For compact $G$, it makes $sans(u)_(B_C \, G \, ell)$ an equivalence.]
] <h3:rat:finite-classifying>

#proof[
  For a locally profinite parameter $Q$, regard $A_Q = C_(upright("cts")) \( Q \, Lambda_ell \)$ as a discrete
    ring. Evaluation gives a map of ring sheaves on $X times underline(Q)$,
  $ underline(A_Q) arrow.r underline(Lambda_ell) \, wide \( f \, q \) mapsto f \( q \) . $
  It is defined on the finitely many clopen fibers of each $f$; this uses no compactness of $Q$.
    The unit of the derived constant-sheaf/global-sections adjunction, followed by derived sections of evaluation, gives
  $ C_(upright("cts")) \( Q \, Lambda_ell \) \[ 0 \] arrow.r R Gamma_v \( X times underline(Q) \, Lambda_ell \) . $
  Equivalently, this sends a continuous $Lambda_ell$-valued function on $Q$ to its ordinary section and then to
    derived sections. With $Q = G^a$, the projections of the action-groupoid nerve commute with all bar faces and
    codegeneracies, including the action face. These maps therefore form a cosimplicial map.
    Its totalization is (10.1) by quotient Čech descent.
  The map of nerves that forgets $T$ over $B$ proves the stated equality with $c_T^(*) sans(u)_(B \, G \, ell)$.
    For a continuous homomorphism $h : H arrow.r G$, let $S arrow.r
    Z$ be an $H$-torsor over $B$ with a specified identification $S times^H G tilde.eq T$ over $Z$.
    The resulting map of torsor nerves acts in degree $a$ by $h^a$ on the transition elements.
    Evaluation commutes with these maps, with equivariant maps of $X$, and with every base change.
    A base automorphism whose descent commutes with the constant group acts on a torsor nerve by
    $\( t \, g_1 \, dots.h \, g_a \) mapsto \( gamma \( t \) \, g_1 \, dots.h \, g_a \)$,
    which proves the asserted arithmetic naturality. The construction uses maps of coefficient ring sheaves and
    the lax monoidal derived sections functor, so it preserves cup products.
    Composing the same ring-sheaf maps with $Lambda_ell arrow.r Lambda_(ell - 1)$ or with $Lambda_ell =
    W_ell \( bb(F)_p \) arrow.r W_ell cal(O)^flat$ proves the coefficient naturalities term by term.
    In particular these are maps of the derived coefficient towers before cohomology is taken.
  For (10.2), use all finite clopen quotients $Q_i$ of $Q$.
    The example after Definition 7.8 and Proposition 7.16 of #cite(label("ScholzeDiamonds")) identify $B_C times
    underline(Q)$ with the inverse limit of $B_C times Q_i$ and make $B_C$ a strictly totally disconnected
    geometric point. Its étale covers split, so its finite constant cohomology is $A \[ 0 \]$.
    Continuity and comparison with v-cohomology in #cite(label("ScholzeDiamonds")) Propositions 14.9–14.10 now give
  $ R Gamma_v \( B_C times underline(Q) \, A \) tilde.eq "colim"_i "Map" \( Q_i \, A \) \[ 0 \] =
    C_(upright("cts")) \( Q \, A \) \[ 0 \] . $
  Every map here is induced by the coefficient unit and is natural in the finite partitions, coefficient fiber,
    and base. This proves the stated naturality, including the arithmetic action on a Tate fiber.
    Apply the equivalence to $Q = G^a$ for compact $G$ and totalize to obtain the last assertion.
    Over the finite-field base used below we use the finite classifying map itself;
    this point comparison is only asserted over $B_C$. ◻
]

We retain profinite parameters throughout geometric descent. Write

$ cal(C)_(Z \, ell) \( Q \) = R Gamma_v \( Z times underline(Q) \, Lambda_ell \) \, wide cal(C)_Z =
  R "proj lim"_ell cal(C)_(Z \, ell) \, $

where $Q$ is profinite; these are derived sections on $Q$.

=== 10.2 Trace classes and a parabolic subgroup <trace-classes-and-a-parabolic-subgroup>

The invariant form

$ \( X \, Y \, Z \) mapsto "Tr" \( X \[ Y \, Z \] \) $

uses reduced trace for the division algebra and matrix trace for the split groups.
  This is the classical degree-three cocycle attached to an invariant symmetric form,
  as in Chevalley–Eilenberg #cite(label("ChevalleyEilenberg1948")) Section 21 and Koszul
  #cite(label("Koszul1950")) Section 11. The next lemma constructs the corresponding group-cohomology classes and
  identifies the restriction needed for the ordinary kernel.

#thm([Lemma 10.2.])[
  #emph[The groups $P_3$, $J_3$, and $"GL"_2 \( bb(Z)_p \)$ have rational cohomology $H_(upright(b))^1 = bb(Q)_p$,
    $H_(upright(b))^2 = 0$, and $H_(upright(b))^3 = bb(Q)_p$.
    They admit nonzero classes $e_3$, $e_J$, and $e_2$, respectively,
    whose rational Lie-algebra images are nonzero multiples of the displayed trace form.
    For every compact open $K subset J_3$, restriction followed by the compact Lie-algebra comparison identifies
    $H_(upright(b))^(*) \( J_3 \)$ with $H^(*) \( frak(g l)_3 \, bb(Q)_p \)$;
    the identifications for different $K$ agree under further restriction. For
$ D = {mat(delim: "(", A, v; 0, a) : A in "GL"_2 \( bb(Z)_p \) \, med a in bb(Z)_p^times \, med v in bb(Q)_p^2} \, $

 write $iota : D arrow.r J_3$ and $rho : D arrow.r "GL"_2 \( bb(Z)_p \)$ for inclusion and projection. Then
#[#set math.equation(numbering: n => "(10.3)")
 $ iota^(*) e_J = b rho^(*) e_2 quad upright("for some ") b in bb(Q)_p^times . $ <h3:eq:rat-parabolic-trace>]

]
] <h3:rat:trace-groups>

#proof[
  We first make the continuous comparison on compact groups precise.
    Each compact group $K$ under consideration has an open normal uniform pro-$p$ subgroup $U$.
    For $P_3$ and $"GL"_2 \( bb(Z)_p \)$ one may use a sufficiently deep principal congruence subgroup.
    A compact open $K subset J_3$ preserves a lattice in $bb(Q)_p^3$:
    the orbit of any lattice is finite, and its sum is stable.
    A sufficiently deep principal congruence subgroup for this lattice lies in $K$ and is normal there.
    If the depth is at least one, the corresponding Lie lattice $frak(u) = p^m cal(O)$,
    for the relevant endomorphism order $cal(O)$, satisfies $\[ frak(u) \, frak(u) \] subset p frak(u)$.
    At odd $p$, logarithm and exponential converge on these lattices,
    identify the $p$th-power map with multiplication by $p$, and show that the group is finitely generated,
    powerful, and torsion free. It is therefore uniform.
  Give $U$ its lower-$p$-series valuation. For $p gt.eq 5$ it is saturated and equi-$p$-valued,
    with value denominator $e = 1$ and graded generators in degree one.
    The trivial finite free coefficient module $bb(Z)_p$ has action in $1 + p "End"_(bb(Z)_p) \( bb(Z)_p \)$.
    The continuous comparison of #cite(label("HuberKingsNaumann")) Theorem 3.3.3 therefore gives a cup-compatible
    isomorphism
  $ H_(upright("cts"))^(*) \( U \, bb(Z)_p \) tilde.eq H^(*) \( frak(u) \, bb(Z)_p \) \, $
  where $frak(u)$ is the integral Lie algebra of $U$. Coefficient naturality and rational agreement in
    #cite(label("HuberKingsNaumann")) Theorem 3.1.1(1)–(2), together with the boundedness of compact rational
    cochains, identify its rationalization with Lazard’s comparison for $"Lie" \( K \) = frak(u) \[ 1 \/ p \]$.
    Continuous group homomorphisms preserve lower $p$-series,
    so Theorem 3.1.1(3) of the same source gives naturality for restrictions and for the block maps after passing
    to such small opens.
  The rational Hochschild–Serre sequence for $U lt.closed K$ collapses to finite quotient invariants:
    positive cohomology of the finite group $K \/ U$ vanishes by averaging in $bb(Q)_p$.
    Here $"Lie" \( K \)$ is the Lie algebra of a $"GL"_n$-form, with $n = 2$ or $3$.
    The exterior calculation and triviality of its adjoint action are given by #cite(label("BSSW")) Lemma 3.8.2.
    They give generators in degrees $1 \, 3 \, dots.h \, 2 n - 1$,
    without choosing explicit cocycles for all of them. Thus the finite quotient fixes the cohomology,
    and in particular the low-degree dimensions are $1 \, 0 \, 1$ in degrees $1 \, 2 \, 3$.
  We identify the particular degree-three generator needed here.
    For the split Lie algebra put $q \( X \, Y \) = "Tr" \( X Y \)$; for the inner form use reduced trace.
    Cyclicity gives $q \( \[ X \, Y \] \, Z \) = "Tr" \( X \[ Y \, Z \] \)$.
    After an algebraically closed splitting-field extension the restriction of $q$ to $frak(s l)_n$, for $n = 2 \,
    3$, is nonzero and nondegenerate. The degree-three invariant-form calculation of #cite(label("Koszul1950"))
    Section 11, Theorems 11.1–11.2 therefore makes its class nonzero.
    The finite Chevalley–Eilenberg cochain complex commutes with field extension,
    so the class already defined on the form over $bb(Q)_p$ is nonzero.
    Comparing restrictions through a common small uniform subgroup shows that the group identifications are
    independent of the chosen open subgroup. The upper-left block map restricts the displayed degree-three matrix
    trace form to the identical form on the $2 times 2$ block, and hence restricts it nontrivially.
  For $P_3$, choose $e_3$ to have exactly this reduced-trace Lie-algebra class under the natural compact
    comparison. The coefficient-field group $Gamma = "Gal" \( k \/ bb(F)_p \)$ acts by automorphisms of the Honda
    division algebra and preserves reduced trace. Naturality of that comparison therefore makes this normalized
    rational class $Gamma$-invariant.
  For the noncompact group $J_3$, use the reduced affine building in 87 with $F = bb(Q)_p$.
    That lemma supplies a contractible two-dimensional complex on which $J_3$ preserves types,
    has compact open face stabilizers fixing their faces pointwise,
    and has a closed chamber as a fundamental domain. The cellular resolution and continuous Shapiro give,
    first with finite coefficients and then with the derived integral limit,
  $ E_1^(a \, s) = xor.big_(sigma subset Delta\
dim sigma = a) H_(upright("int"))^s \( K_sigma \) med arrow.r.double med H_(upright("int"))^(a + s) \( J_3 \) . $
  There are finitely many summands and cellular degrees. After inversion of $p$,
    every restriction in a fixed row identifies with the identity on $H^s \( frak(g l)_3 \, bb(Q)_p \)$;
    changing a face representative only introduces an inner conjugation.
    That row is therefore the cellular cochain complex of the simplex $Delta$ with these constant coefficients.
    It has cohomology only in cellular degree zero. The edge map,
    and then further restriction to an arbitrary compact open subgroup using intersections,
    gives the required assertion for $J_3$.
  It remains to account for the unipotent radical of $D$. Fix $ell$ and write $bb(Q)_p^2 =
    union.big_(r gt.eq 0) p^(- r) bb(Z)_p^2$. The two-variable Koszul resolution computes
  $ H^q \( p^(- r) bb(Z)_p^2 \, bb(Z) \/ p^ell \) = and.big^q \( bb(Z) \/ p^ell \)^2 . $
  Restriction from stage $r + 1$ to $r$ multiplies degree $q$ by $p^q$.
    These systems are pro-zero for $q > 0$ and constant for $q = 0$.
    The restrictions of cochains themselves are surjective: the smaller subgroup is clopen,
    so a cochain extends by zero. Thus their inverse limit computes the derived limit,
    and the Milnor sequence gives $R Gamma \( bb(Q)_p^2 \, bb(Z) \/ p^ell \) = bb(Z) \/ p^ell \[ 0 \]$.
    The calculation remains valid with profinite parameters, by the same finite Koszul complexes and extension of
    cochains. Thus this equality holds for internal derived condensed invariants.
    The constants map is equivariant for the Levi action, and its underlying equivalence is therefore an
    equivariant equivalence. Hochschild–Serre consequently makes inflation from the Levi subgroup an equivalence
    at each finite level and then integrally. The rational Künneth calculation for $"GL"_2 \( bb(Z)_p \) times
    bb(Z)_p^times$ has degree three equal to the degree-three group of its first factor,
    since the second factor has cohomological dimension one and the first has $H^2 = 0$.
    Restriction along $A mapsto "diag" \( A \, 1 \)$ detects the nonzero trace form. This proves (10.3). ◻
]

=== 10.3 Two presentations of a modification <two-presentations-of-a-modification>

Write

$ B_k = "Spd" k \, wide B_C = "Spd" C^flat tilde.eq "Spa" \( C \, cal(O)_C \)^diamond.stroked.small . $

The chosen embedding $F = W \( k \) \[ 1 \/ p \] subset C$ gives the embedding $k subset
  C^flat$ and hence the base map $B_C arrow.r B_k$. All quotient presentations in this subsection are over $B_C$.
  A determinant lattice on a slope-zero rank-three bundle is a $bb(Z)_p$-lattice in its determinant rational local
  system. Its frame group is $J_3$. Fix a lattice in the one-dimensional rational local system associated to

$ Delta_3 = det \( V_3 \) \( - oo \) . $

The action of $D_3^times$ on it is reduced norm. Its stabilizer is therefore exactly $P_3$.

#thm([Lemma 10.3.])[
  #emph[Let $cal(M)$ classify a form of $V_3$ with $P_3$-structure and a quotient line at $oo$. There are equivalences
#[#set math.equation(numbering: n => "(10.4)")
 $ cal(M) tilde.eq \[ upright(bold(P))_C^2 \/ P_3 \] tilde.eq \[ Omega_C^2 \/ J_3 \] . $ <h3:eq:rat-two-presentations>]

 The relative classifying maps
$ c_(3 \, cal(M)) : cal(M) arrow.r upright(B)_(B_C) P_3 \, wide c_(J \, cal(M)) : cal(M) arrow.r upright(B)_(B_C) J_3 $

 record the positive bundle and its lower modification, respectively.
   For the prescribed finite unramified field $F = W \( k \) \[ 1 \/ p \]$,
   these presentations carry a common semilinear arithmetic action of $G_F$ over its action on $B_C$,
   commuting with both constant groups and inducing the usual action on $Omega_C^2$.]
] <h3:rat:modification-presentations>

#proof[
  The kernel of a length-one quotient of a form $E$ of $V_3$ is a rank-three bundle $E^(-)$ of degree zero.
    If it had a positive Harder–Narasimhan subbundle of rank $b < 3$ and integral degree $d gt.eq 1$,
    its inclusion in $E$ would contradict semistability: $d \/ b gt.eq 1 \/ b > 1 \/ 3$.
    Thus $E^(-)$ has slope zero. By the relative slope-zero correspondence it is a rational local system
    #cite(label("KedlayaLiu")) Corollary 8.7.10; see 11.
  Conversely an upper length-one modification of $cal(O)^3$ has,
    at a geometric point with local parameter $t$ at $oo$, lattice
  $ \( B_(upright("dR"))^(+) \)^3 + B_(upright("dR"))^(+) t^(- 1) tilde(ell) $
  for a direction line $ell$. If $ell$ lies in a proper rational subspace $W$,
    modifying $W ⊗ cal(O)$ gives a degree-one subbundle of rank less than three, which destabilizes.
    In the other direction, let $F'$ be a saturated destabilizing subbundle of the upper modification,
    of rank $b < 3$ and degree $d gt.eq 1$. Its intersection $F''$ with $cal(O)^3$ has degree $d - epsilon.alt$,
    where $0 lt.eq epsilon.alt lt.eq 1$. Semistability of $cal(O)^3$ forces $d = epsilon.alt = 1$ and $deg F'' =
    0$. The saturation of $F''$ in $cal(O)^3$ has degree at least zero,
    while semistability forces its degree to be at most zero.
    Its torsion quotient therefore has degree zero, so $F''$ is already saturated.
    Thus $F''$ is a slope-zero subbundle of $cal(O)^3$, hence equals $W ⊗ cal(O)$ for a rational subspace $W$;
    maps between trivial bundles are matrices over $H^0 \( cal(O) \) = bb(Q)_p$.
    The equality $epsilon.alt = 1$ says that $ell subset W_C$. This proves precisely the Drinfeld condition.
  Let $cal(Z)$ be the sheaf of injections $cal(O)^3 arrow.r.hook
    V_3$ with length-one cokernel at $oo$ preserving the chosen determinant lattices.
    The commuting actions are postcomposition by $P_3$ and inverse precomposition by $J_3$.
    The preceding slope calculation and the relative trivial/basic-stratum theorems #cite(label("FarguesScholze"))
    Theorems III.2.4 and III.4.5 give actual sheaves of frames in families.
    They identify $cal(Z) \/ J_3 = upright(bold(P))_C^2$. In the other direction they identify $cal(Z) \/ P_3 =
    Omega_C^2$: the full frame group of the positive bundle is $D_3^times$,
    and its surjective norm valuation lets one match the determinant lattice locally.
    Taking the remaining quotient proves (10.4).
  The arithmetic field is $F = W \( k \) \[ 1 \/ p \]$; the coefficient field of the curve remains $bb(Q)_p$.
    Let $N$ be the fixed Honda isocrystal over $k$, whose period-ring construction gives $V_3$.
    All Honda endomorphisms are defined over $k$. On the period coefficients tensored over $F$ with $N$,
    define the action of $gamma in G_F$ by $gamma ⊗ upright("id")_N$.
    It commutes with Frobenius and so descends to the bundle.
    Every element of $D_3$ is an $F$-linear endomorphism of $N$ commuting with its Frobenius;
    its matrix entries are fixed by $G_F$. Thus this specified descent commutes with the entire $D_3$-action.
    We have not trivialized a torsor of frames of an arbitrary descended basic bundle.
  The untilt ideal $ker theta$ is functorial, so $Delta_3$ inherits descent.
    The relative slope-zero correspondence makes its rational section space a continuous one-dimensional
    representation of $G_F$. This representation need not be trivial.
    Its valuation character has compact subgroup image in $bb(Z)$, hence zero, so every lattice in it is stable;
    no generator is asserted to be invariant. Define the arithmetic action on an injection $u$ by pullback and the
    specified descent on source and target. The standard rational coordinate vectors of $cal(O)^3$ are fixed, so
  $ gamma \( g u j^(- 1) \) = g gamma \( u \) j^(- 1) wide \( g in P_3 \, med j in J_3 \) . $
  The determinant condition is preserved by lattice stability.
    On the upper side, directions lie in $bb(Q)_p^3 ⊗ \( cal(O) \( oo \) \/ cal(O) \) \|_oo$.
    The semilinear scalar in the second factor is common to all coordinates and cancels in projective space.
    This is the usual arithmetic action on $Omega_C^2$, commuting with $J_3$.
    No arithmetic invariant choice of a frame is required. ◻
]

#thm([Lemma 10.4.])[
  #emph[The first presentation in (10.4) has a natural arithmetic-equivariant splitting
#[#set math.equation(numbering: n => "(10.5)")
 $ H_(upright(b))^3 \( cal(M) \) = H_(upright(b))^3 \( P_3 \) xor H_(upright(b))^1 \( P_3 \) \( - 1 \) \,
   $ <h3:eq:rat-projective-h3>]

 whose first inclusion is the classifying map $"cl"_(c_(3 \, cal(M)) \, upright(b))$ of 73.]
] <h3:rat:fixed-projective>

#proof[
  For a profinite set $Q = "proj lim"_i Q_i$ with finite $Q_i$,
    continuity on spatial diamonds and comparison of finite coefficients give
  $ R Gamma_v \( upright(bold(P))_C^2 times underline(Q) \, Lambda_ell \) tilde.eq "colim"_i "Map"
    #scale(x: 120%, y: 120%)[\(] Q_i \, R Gamma_(acute(e) t) \( upright(bold(P))_C^2 \, Lambda_ell \)
    #scale(x: 120%, y: 120%)[\)] . $
  Here one applies #cite(label("ScholzeDiamonds")) Proposition 14.9 to $upright(bold(P))_C^2 times
    Q_i$ and then #cite(label("ScholzeDiamonds")) Proposition 14.10 and Lemma 15.6;
    these statements allow the coefficient ring $Lambda_ell$ also when its torsion prime is $p$.
    The finite-coefficient cohomology of the analytic projective space agrees with its algebraic cohomology:
    the proper comparison of #cite(label("ScholzeSurvey")) Theorem 3.12,
    restating #cite(label("Huber")) Theorem 3.7.2, applies to $upright(bold(P))_C^2 arrow.r
    "Spec" C$ with $bb(F)_p$ coefficients, and the coefficient exact sequences extend it to $Lambda_ell$.
    Thus the projective-space calculation is valid as the actual condensed geometric complex.
  The anticanonical bundle has canonical projective equivariance, including arithmetic descent,
    and restricts to $cal(O) \( 3 \)$. Since $p gt.eq 5$, the class $h_ell =
    3^(- 1) c_1 \( omega_(upright(bold(P))^2)^(- 1) \)$ on the quotient restricts to the hyperplane class.
    Its powers give an actual morphism of equivariant derived coefficient objects
  $ xor.big_(j = 0)^2 Lambda_ell \( - j \) \[ - 2 j \] arrow.r cal(C)_(upright(bold(P))_C^2 \, ell) . $
  The preceding calculation shows that this is an equivalence on every profinite parameter.
    Apply it to $Q = P_3^a$ in the quotient nerve and totalize.
    The finite direct sum commutes with totalization, giving an equivalence
  $ xor.big_(j = 0)^2 C_(upright("cts"))^bullet \( P_3 \, Lambda_ell \( - j \) \) \[ - 2 j \]
    arrow.r^(med tilde.eq med) R Gamma_v \( cal(M) \, Lambda_ell \) . $
  In its $j = 0$ component, each bar term sends a continuous constant function to its coefficient-unit section.
    By 73, this component is exactly $"cl"_(c_(3 \, cal(M)) \, ell)$.
    The Kummer classes commute with coefficient reduction. Take the derived limit in $ell$ and then invert $p$;
    the finite direct sum commutes with both operations. Only $j = 0 \, 1$ contribute to degree three,
    giving (10.5). Naturality of the Kummer classes gives its arithmetic compatibility and the displayed twists. ◻
]

The projective splitting identifies the classifying image of the $P_3$ trace.
  We next need to show that the $J_3$ trace has a nonzero classifying image on the same modification stack.
  The Drinfeld cohomology theorem gives arithmetic scalar actions on point-valued cohomology;
  the following finite resolution justifies their use on the compact-group descent rows.

#thm([Lemma 10.5.])[
  (Finite resolutions for geometric coefficients).  #emph[The complexes $cal(C)_Z$ are bounded below,
    derived solid, and derived $p$-complete. Let $G$ be a compact $p$-adic analytic group without $p$-torsion.
    There is a finite projective resolution $P_bullet arrow.r bb(Z)_p$ over $Lambda_G = bb(Z)_p \[ \[ G \] \]$,
    with finitely generated terms and length $dim G$, such that,
    for every derived solid $underline(bb(Z)_p)$-module complex $K$ with $underline(bb(Z)_p)$-linear continuous
    $G$-action,
#[#set math.equation(numbering: n => "(10.6)")
 $ R Gamma \( G \, K \) \( * \) tilde.eq "Hom"_(Lambda_G) \( P_bullet \, K \) . $ <h3:eq:rat-solid-hom>]

 Here $"Hom"$ is the external complex of morphisms in solid $underline(Lambda_G)$-modules.
   A continuous action means an actual module over $underline(bb(Z)_p) \[ underline(G) \]$ in the derived
   condensed category, rather than an action on $K \( * \)$.
   If $K$ is bounded below, and an operator $gamma$ commuting with $G$ acts by the scalar $lambda_j in
   bb(Q)_p$ on $H^j \( K \) \( * \) \[ 1 \/ p \]$, it acts by $lambda_j$ on
   $H^s \( G \, H^j \( K \) \) \( * \) \[ 1 \/ p \]$ for every $s$.
   For $K = cal(C)_Z$ the resulting spectral sequence is
#[#set math.equation(numbering: n => "(10.7)")
 $ H^s \( G \, H^j \( cal(C)_Z \) \) \( * \) \[ 1 \/ p \] med arrow.r.double med
   H_(upright(b))^(s + j) \( \[ Z \/ G \] \) \, $ <h3:eq:rat-solid-descent>]

 with a finite filtration in each total degree.]
] <h3:rat:solid-resolution>

#proof[
  Let $V = "Spa" \( R \, R^(+) \)$ be affinoid perfectoid, and write $R^flat$ for its tilt (equal to $R$ in
    characteristic $p$). Its product with $underline(Q)$ is affinoid perfectoid with ring
    $C_(upright("cts")) \( Q \, R \)$ and tilt $C_(upright("cts")) \( Q \, R^flat \)$. Affinoid acyclicity gives
  $ R Gamma_v \( V times underline(Q) \, cal(O)^flat \) = C_(upright("cts")) \( Q \, R^flat \) \[ 0 \] $
  by #cite(label("ScholzeDiamonds")) Proposition 8.8. Choose a decreasing countable basis of open additive
    subgroups $R_a^flat$ of the complete additive group $R^flat$.
    Then $underline(R^flat) = "proj lim"_a \( R^flat \/ R_a^flat \)_(upright("disc"))$ is solid.
    This limit is also the derived limit: continuous maps from a profinite set to each discrete quotient have
    finite image, and lifts of their finitely many values give surjectivity at each successive quotient.
    A v-hypercover by disjoint unions of affinoid perfectoids now expresses the $cal(O)^flat$ complex,
    with all parameters, as a limit of products of solid modules.
    Derived solid modules are closed under limits and extensions #cite(label("Tang")) Theorem 4.4(ii).
    Artin–Schreier gives the assertion for $bb(F)_p$, the coefficient exact sequences give it for $bb(Z) \/
    p^ell$, and the derived limit gives it for $cal(C)_Z$. These complexes are bounded below.
    The finite coefficient complexes are derived $p$-complete, so their limit is too.
    Evaluation at the point is exact and preserves limits; in particular
  $ H^j \( cal(C)_Z \) \( * \) = H^j \( R Gamma_(upright("int")) \( Z \) \) . $
  The compact-resolution argument in 33 gives Noetherianity of $Lambda_G$ and projective dimension $dim
    G$ for its trivial profinite module, using #cite(label("Venjakob")) Sections 1.1–1.2,
    pp. 275–276 together with #cite(label("Serre1965CohomologicalDimension")) Section 1, Corollary (1).
    Successive finite free presentations therefore give the stated finite resolution.
    We give the derived comparison needed to use it. Let $cal(C) =
    D \( "Cond"_(underline(bb(Z)_p)) \)$ and $cal(D) = D \( "Solid"_(underline(bb(Z)_p)) \)$.
    Solidification is a symmetric monoidal localization $L : cal(C) arrow.r
    cal(D)$ with fully faithful right adjoint $I$ #cite(label("Tang")) Theorem 4.4(ii).
    For the free condensed group ring $A = underline(bb(Z)_p) \[ underline(G) \]$,
    its solidification $L A$ is $underline(Lambda_G)$ in degree zero,
    including multiplication #cite(label("Tang")) Section 3.6 and the proof of Theorem 4.4.
    The underived assertion also holds for a free module on any profinite set $Q$:
    choose an extremally disconnected hypercover $Q_bullet arrow.r Q$ and solidify its free resolution.
    The resulting augmented complex is $bb(Z)_p \[ \[ Q_bullet \] \] arrow.r bb(Z)_p \[ \[ Q \] \]$.
    Its Pontryagin dual is the augmented complex of continuous $bb(Q)_p \/ bb(Z)_p$-valued functions.
    Discrete coefficients are acyclic on a profinite set, by passage to finite clopen partitions,
    so that dual complex is exact. Pontryagin duality and exact condensation prove the assertion.
    Functoriality with respect to multiplication on $G$ gives the ring identification.
  For any symmetric monoidal localization there is an induced adjunction
  $ L_A : "Mod"_A \( cal(C) \) med arrows.rl med "Mod"_(L A) \( cal(D) \) : J \, $
  where $J$ is inclusion followed by restriction along $A arrow.r I \( L A \)$.
    Its unit has underlying map $M arrow.r I L M$, and its counit has underlying map $L I N arrow.r N$.
    The counit is an equivalence; hence $J$ is fully faithful,
    with essential image exactly the modules whose underlying complex is derived solid.
    This proves the assertion in unbounded degrees. To identify the target,
    apply this same localization to the already solid ring $B = underline(Lambda_G)$.
    Its essential image inside $D \( "Cond"_B \)$ consists of precisely the complexes with derived solid
    underlying coefficients. By #cite(label("Tang")) Theorem 4.4,
    the unbounded category $D \( "Solid"_B \)$ has that same essential image.
    This identifies the two derived module categories; it is stronger than an equivalence of their hearts.
    Equivalently, the comparison is computed on free modules $B \[ Q \]$ for extremally disconnected profinite $Q$
    and their solidifications, which give the projective resolutions in these categories.
    Thus the actual condensed action on $K$ belongs to this category,
    and full faithfulness identifies its external derived invariants with those computed there.
    For geometric $K$, the action and its coherent group law come from the maps on $Z times
    underline(Q)$ with all group parameters retained; the preceding solidity argument applies to its underlying complex.
  Condensation preserves the exact profinite resolution #cite(label("Tang")) Theorem 3.2.
    Every $P_a$ is a retract of a finite free $Lambda_G$-module, and $"Hom"_(Lambda_G) \( Lambda_G \, M \) =
    M \( * \)$ is exact. Thus these terms are projective against arbitrary solid coefficient modules and prove
    (10.6). The complex $"Hom"_(Lambda_G) \( P_bullet \, H^j \( K \) \)$ consists of retracts of finite sums of
    $H^j \( K \) \( * \)$. Its retracts commute with $gamma$.
    After exact inversion of $p$, the entire complex therefore has scalar action $lambda_j$,
    proving the assertion about its cohomology. No assertion about a condensed sheaf is inferred from its point value.
  Finally the nerve of $Z arrow.r \[ Z \/ G \]$ has terms $Z times underline(G)^a$.
    With parameters retained, its descent complex is precisely the continuous bar construction on $cal(C)_Z$.
    At finite level the equivariant coefficient unit $underline(Lambda_ell) arrow.r
    cal(C)_(Z \, ell)$ is the evaluation map of 73 on every profinite parameter.
    Its map on $G$-invariants is therefore exactly $sans(u)_(Z \, G \, ell)$,
    since their degree-$a$ bar maps agree. This identity also holds after the derived coefficient limit and
    inversion of $p$. Its source after that limit is $R Gamma \( G \, underline(bb(Z)_p) \) \( * \) tilde.eq R
    Gamma_(upright("int")) \( G \)$: the finite reductions of constants are surjective on every profinite
    parameter, and internal invariants and point evaluation preserve limits.
    The resolution bounds the group direction by $dim G$, giving (10.7) and the asserted finite filtration before
    and after rationalization. ◻
]

#thm([Lemma 10.6.])[
  #emph[On $cal(M)$, abbreviate the classifying images $"cl"_(c_(3 \, cal(M)) \, upright(b)) \( e_3 \)$ and
    $"cl"_(c_(J \, cal(M)) \, upright(b)) \( e_J \)$ by $e_3$ and $e_J$.
    Both are nonzero and satisfy $e_3 = kappa e_J$ for some $kappa in bb(Q)_p^times$.
    We retain this abbreviation for subsequent pullbacks from $cal(M)$.]
] <h3:rat:two-traces>

#proof[
  By (10.5), the class $e_3$ is nonzero. Arithmetic acts trivially on its first summand and by
    $chi_(upright("cyc"))^(- 1)$ on the second. The cyclotomic character of $G_F$ has open image,
    so the invariant subspace is precisely $bb(Q)_p e_3$.
  Choose a compact uniform open subgroup $U subset J_3$. The restriction $"res"_U \( e_J \)$ of the source group
    class $e_J in H_(upright(b))^3 \( J_3 \)$ is nonzero by 74.
    Let $q_U : \[ Omega_C^2 \/ U \] arrow.r cal(M)$ be the quotient map and $c_U : \[ Omega_C^2 \/ U \] arrow.r
    upright(B)_(B_C) U$ its relative classifying map. Extension of torsor structure gives $c_(J \, cal(M)) q_U
    tilde.eq \( upright(B)_(B_C) \( U arrow.r.hook J_3 \) \) c_U$.
    Thus 73 identifies the restriction of the geometric $e_J$ with
    $"cl"_(c_U \, upright(b)) \( "res"_U \( e_J \) \)$. Apply (10.7) to $\[ Omega_C^2 \/ U \]$.
    The integral Drinfeld computation #cite(label("CDN")) Theorems 1.1 and 5.1 identifies
    $H^j \( cal(C)_(Omega_C^2) \) \( * \) \[ 1 \/ p \]$ as a representation on which arithmetic acts by the scalar
    $chi_(upright("cyc"))^(- j)$, with $j = 0 \, 1 \, 2$ and no higher rows.
    Its integral convention is the derived limit of finite $p$-power coefficients followed by inversion of $p$,
    exactly the convention here: the finite reduction tower defines $hat(bb(Z))_p$ on the pro-etale site,
    and derived global sections preserve its derived inverse limit.
    The calculation is for hyperplanes rational over the ground field, here $bb(Q)_p$;
    we merely restrict its arithmetic action to $G_F$.
  In degree zero the same computation gives a one-dimensional rational point value.
    The finite coefficient units form a map $eta : underline(bb(Z)_p) arrow.r
    cal(C)_(Omega_C^2)$ after their derived limit: on every profinite parameter the finite reductions of constants
    are surjective, so their limit is $underline(bb(Z)_p)$. Pullback to any geometric point sends the unit to $1$. Hence
  $ H^0 \( eta \) \( * \) \[ 1 \/ p \] : bb(Q)_p arrow.r^(med tilde.eq med)
    H^0 \( cal(C)_(Omega_C^2) \) \( * \) \[ 1 \/ p \] . $
  For each finite projective term $P_a$ in the $U$-resolution of 77,
    applying $"Hom"_(Lambda_U) \( P_a \, - \)$ gives a retract of a finite sum of these point maps,
    and the unit commutes with its defining idempotent. It is therefore an isomorphism after inversion of $p$ in
    every term. Naturality of the descent spectral sequence for $eta$ maps its single constant row to the bottom
    row of geometric descent. By the compact bar identity, the $E_2^(3 \, 0)$ bottom-row map of the
    spectral-sequence morphism induced by the finite units defining $"cl"_(c_U \, upright(b))$ is the resulting
    isomorphism
  $ H_(upright(b))^3 \( U \) arrow.r^(med tilde.eq med)
    H^3 \( U \, H^0 \( cal(C)_(Omega_C^2) \) \) \( * \) \[ 1 \/ p \] . $
  It sends $"res"_U \( e_J \)$ to the nonzero bottom-row class.
    This argument uses the rational point value and the natural finite projective complex.
  By 77, an element $gamma in G_F$ with cyclotomic character of infinite order acts on the actual $j$th descent
    row by this scalar. The only possible incoming differentials to $\( 3 \, 0 \)$ are from $\( 1 \, 1 \)$ and
    $\( 0 \, 2 \)$. Their source scalars differ from $1$, so both differentials vanish.
    There is no outgoing differential from the bottom row. Thus the nonzero bottom-row image of
    $"res"_U \( e_J \)$ survives in $H_(upright(b))^3 \( \[ Omega_C^2 \/ U \] \)$,
    proving that the geometric class $e_J$ on $cal(M)$ is nonzero.
    The map to $upright(B)_(B_C) J_3$ is arithmetic equivariant,
    so this class is invariant and belongs to the line $bb(Q)_p e_3$. This proves the assertion. ◻
]

=== 10.4 The actual rank-two kernel on the ordinary stratum <the-actual-rank-two-kernel-on-the-ordinary-stratum>

Let $cal(Y)_1$ be the ordinary stratum stack of 13, over $B_k$. Put $G_o = "GL"_2 \( bb(Z)_p \) times P_1$.
  Its two frame presentations give relative classifying maps

$ c_(3 \, k) : cal(Y)_1 arrow.r upright(B)_(B_k) P_3 \, wide c_(o \, k) : cal(Y)_1 arrow.r upright(B)_(B_k) G_o . $

On this stack, $e_3$ means $"cl"_(c_(3 \, k) \, upright(b)) \( e_3 \)$,
  and $e_2$ means $"cl"_(c_(o \, k) \, upright(b)) \( "pr"_1^(*) e_2 \)$, where $"pr"_1 : G_o arrow.r
  "GL"_2 \( bb(Z)_p \)$ is the first projection. Set $cal(Y)_(1 \, C) =
  cal(Y)_1 times_(B_k) B_C$ and write $c_(3 \, C) \, c_(o \, C)$ for the base-changed classifying maps.
  The finite base-change identity in 73 identifies the corresponding classes on $cal(Y)_(1 \, C)$ with the base
  changes of these same classes over $k$.

#thm([Proposition 10.7.])[
  (Transport along the ordinary kernel).  #emph[There is $a in bb(Q)_p^times$ such that
#[#set math.equation(numbering: n => "(10.8)")
 $ e_3 = a e_2 quad upright("in ") H_(upright(b))^3 \( cal(Y)_(1 \, C) \) . $ <h3:eq:rat-ordinary-traces>]

 The class $e_2$ is pulled back from the actual integral frame group of the rank-two kernel.]
] <h3:prop:trace-transport>

#proof[
  The universal sequence on this stack is
  $ 0 arrow.r cal(L)_2 ⊗_(bb(Z)_p) cal(O) arrow.r cal(V)_3 arrow.r cal(V)_1 arrow.r 0 \, $
  where $cal(L)_2$ is the integral rank-two local system of 13.
    The canonical quotient $cal(V)_1 arrow.r i_(oo *) i_oo^(*) cal(V)_1$ defines $cal(V)_1^(-) =
    cal(V)_1 \( - oo \)$ and, by pullback, a lower modification $cal(V)_3^(-)$ of $cal(V)_3$.
    It gives a map $m : cal(Y)_(1 \, C) arrow.r cal(M)$ and the exact sequence of slope-zero bundles
  $ 0 arrow.r cal(L)_2 ⊗ cal(O) arrow.r cal(V)_3^(-) arrow.r cal(V)_1^(-) arrow.r 0 . $
  Apply the relative slope-zero equivalence on the pro-etale site of a perfectoid test object over
    $cal(Y)_(1 \, C)$. To verify exactness without assuming it,
    take a common pro-etale cover trivializing the three rational local systems.
    Full faithfulness identifies the maps with matrices of sections of $underline(bb(Q)_p)$.
    Write the quotient map as $\( b_1 \, b_2 \, b_3 \)$. The open loci $b_i eq.not 0$ cover,
    since its rank is one on every geometric fiber. On such a locus,
    $1 mapsto b_i^(- 1) e_i$ is a continuous section. The kernel has basis $e_j - \( b_j \/ b_i \) e_i$ for $j
    eq.not i$. The given map from $cal(L)_2 ⊗ bb(Q)_p$ to this kernel is a square matrix invertible on every
    geometric fiber; its inverse is continuous by the determinant formula.
    Thus the sequence of rational local systems is exact and locally split.
  The $P_3$-structure gives an integral determinant lattice on the middle local system.
    Its tensor quotient by $det cal(L)_2$ is an integral lattice on the quotient line.
    Refine the cover to choose an integral basis of the original $cal(L)_2$ and an integral generator of this
    quotient lattice, and lift the generator by the displayed splitting.
    The resulting middle frame has determinant generating its prescribed determinant lattice.
    Its possible changes are exactly $mat(delim: "(", A, v; 0, a)$ with $A in "GL"_2 \( bb(Z)_p \)$,
    $a in bb(Z)_p^times$, and $v in bb(Q)_p^2$. Its determinant is a unit,
    so these adapted frames form exactly the $D$-torsor of 74.
    Forgetting the quotient generator and its lift gives the original integral Tate-frame torsor under $D arrow.r
    "GL"_2 \( bb(Z)_p \)$. These constructions commute with all perfectoid base changes and descend on the v-site,
    giving the actual relative map $c_D : cal(Y)_(1 \, C) arrow.r upright(B)_(B_C) D$.
    The identifications of the associated torsors give homotopies of relative classifying maps
  $ c_(3 \, cal(M)) m & tilde.eq c_(3 \, C) \,\
\( upright(B)_(B_C) iota \) c_D & tilde.eq c_(J \, cal(M)) m \,\
\( upright(B)_(B_C) rho \) c_D & tilde.eq \( upright(B)_(B_C) "pr"_1 \) c_(o \, C) . $
  The first remembers the same structured positive bundle. The second forgets the adapted filtration and retains
    the middle determinant lattice induced from the same chosen $Delta_3$ lattice.
    The third forgets the quotient generator and its lift, retaining the original integral Tate frame.
    These forgetful identifications can be checked on the local frames just constructed and then descend;
    they commute with base change and with the specified semilinear arithmetic descent.
    Applying the finite classifying naturality and then its rational limit to $e_3 =
    kappa e_J$ and (10.3) therefore gives $e_3 = kappa b e_2$. Both factors are nonzero. ◻
]

=== 10.5 Witt constants and the localization map <witt-constants-and-the-localization-map>

Define $H_W^i \( Z \) = H^i \( R "proj lim"_ell R Gamma_v \( Z \, W_ell cal(O)^flat \) \)$.
  For $A = k$ and $A = C^flat$, write $cal(Y)_(1 \, A)$ for $cal(Y)_1$ and $cal(Y)_(1 \, C)$, respectively,
  and use $c_(o \, A)$ for the corresponding ordinary classifying map.
  Give $W_ell \( A \)$ its finite Witt coordinate topology; it is discrete when $A = k$.
  At each length there is a commutative square of external derived complexes

(10.9)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$C_(upright("cts"))^bullet \( G_o \, Lambda_ell \)$])
  content((4.631, 0), [$R Gamma_v \( cal(Y)_(1 \, A) \, Lambda_ell \)$])
  content((0, -1.239), [$R Gamma \( G_o \, underline(W_ell \( A \)) \) \( * \)$])
  content((4.631, -1.239), [$R Gamma_v \( cal(Y)_(1 \, A) \, W_ell cal(O)^flat \) .$])
  line((1.392, 0), (3.239, 0), mark: (end: ">"))
  content((2.316, 0.2266), [#text(size: 0.73em)[$"cl"_(c_(o \, A) \, ell)$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  line((4.631, -0.2725), (4.631, -0.9661), mark: (end: ">"))
  line((1.458, -1.239), (2.843, -1.239), mark: (end: ">"))
  content((2.151, -1.012), [#text(size: 0.73em)[$upright("constants")$]])
})

The vertical arrows are induced by $Lambda_ell = W_ell \( bb(F)_p \) arrow.r
  W_ell \( A \)$ and by the Witt coefficient unit. The bottom arrow is the actual ordinary constants map:
  over $B_C$ it comes from 26, and over $B_k$ from its base-field Frobenius descent in 30.
  Its extension to Witt coefficients is proved below. On the torsor nerve both composites send a finite constant
  function to the same section through $W_ell \( bb(F)_p \) arrow.r W_ell \( A \) arrow.r W_ell cal(O)^flat$.
  Thus 73 proves the square term by term, including its base change from $k$ to $C^flat$ and its reductions in
  $ell$. Over $B_k$, the same identity for the $P_3$ presentation identifies the Witt image of
  $"cl"_(c_(3 \, k) \, ell)$ with the map from $C_(upright("cts"))^bullet \( P_3 \, Lambda_ell \)$ to the ordinary
  perfected Witt cochains in 67. Here the canonical interchange of the two frame factors identifies $G_o$ with the
  group $G_(upright(f))$ used there; the earlier geometric maps written $B
  G_(upright(f))$ are these relative classifying maps on their displayed bases.
  Those proofs retain profinite parameters through the identification of this quotient nerve with the computing
  cochains.

Taking the derived coefficient limits of the ordinary constants maps gives the following square;
  their finite equivalences are justified in the proof below:

(10.10)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$H^i \( G_o \, W \( k \) \)$])
  content((3.905, 0), [$H_W^i \( cal(Y)_1 \)$])
  content((0, -1.239), [$H^i \( G_o \, W \( C^flat \) \)$])
  content((3.905, -1.239), [$H_W^i \( cal(Y)_(1 \, C) \) .$])
  line((1.128, 0), (2.843, 0), mark: (end: ">"))
  content((1.986, 0.2266), [#text(size: 0.73em)[$tilde.op$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  line((3.905, -0.2725), (3.905, -0.9661), mark: (end: ">"))
  line((1.26, -1.239), (2.645, -1.239), mark: (end: ">"))
  content((1.953, -1.012), [#text(size: 0.73em)[$tilde.op$]])
})

#thm([Lemma 10.8.])[
  #emph[The right vertical map of (10.10) is injective after inversion of $p$.
    The Witt coefficient image of $e_3$ on $cal(Y)_1$ is nonzero.
    Its corresponding image under the actual ordinary deformation-coefficient map is nonzero.]
] <h3:rat:witt-nonvanishing>

#proof[
  For completeness, the Witt extension of the constants calculation uses the natural additive exact sequences
  $ 0 arrow.r R arrow.r^(V^(ell - 1)) W_ell \( R \) arrow.r W_(ell - 1) \( R \) arrow.r 0 . $
  They are exact for the solid coefficient objects and v-sheaves in question:
    in Witt coordinates, restriction has the continuous set-theoretic section that appends zero.
    Apply the sequence to both sides of the characteristic-$p$ constants equivalence.
    Induction using the resulting morphisms of exact triangles proves the equivalence at every length.
    Take derived inverse limits and then the residual group invariants.
    All maps in this construction are induced by constants, so it proves the square with its asserted arrows and
    their compatibility with cup products.
  The group $G_o$ has no $p$-torsion. Choose its resolution in 77 and put $Q_bullet =
    bb(Z)_p ⊗_(bb(Z)_p \[ \[ G_o \] \]) P_bullet$. Each $Q_j$ is finite projective,
    hence finite free over $bb(Z)_p$. For a trivial coefficient module $M$,
    the computing complex is $"Hom"_(bb(Z)_p) \( Q_bullet \, M \)$,
    a fixed bounded complex of finite matrices over $bb(Z)_p$ tensored with $M$.
    Since $W \( C^flat \)$ is torsion free over the discrete valuation ring $W \( k \)$, it is flat,
    and its fraction field extension is faithfully flat. Consequently
  $ H^i \( G_o \, W \( k \) \) \[ 1 \/ p \] ⊗_(W \( k \) \[ 1 \/ p \]) W \( C^flat \) \[ 1 \/ p \] tilde.eq
    H^i \( G_o \, W \( C^flat \) \) \[ 1 \/ p \] . $
  This proves the injection in the square. It also proves that the image of $e_2$ is nonzero:
    it is the scalar extension of the nonzero trace class of the first factor of $G_o$.
  By (10.9) and its $P_3$ counterpart, the two Witt images of the group classes on $cal(Y)_(1 \, C)$ are the
    coefficient-unit images of the exact classifying images in (10.8).
    Their maps over $k$ base change to these maps before the derived limit is taken.
    Applying that limit and inversion of $p$ to the geometric equality, and then using the injection in (10.10),
    proves the same equality over $k$ in Witt cohomology. Its right side is nonzero, as just shown.
  It remains to follow this nonzero Witt class through the actual deformation-coefficient map. Put
  $ sans(C)_ell^W = C_(upright("cts"))^bullet \( P_3 \, W_ell B_0 \) \, wide sans(C)_ell^D =
    C_(upright("cts"))^bullet \( P_3 \, D_ell \) \, wide
    D_ell = \( W \( k \) \/ p^ell \) \[ \[ x \, y \] \] \[ x^(- 1) \] . $
  By 66, the two maps from $W_ell B_0$ to $D_ell$ and to $W_ell B_(upright("pk"))$ induce cohomology isomorphisms.
    The graded maps for $gamma_ell$ are powers of $phi.alt_p$,
    while those for $beta_ell$ are the natural maps $B_0 arrow.r B_(upright("pk"))$.
    Both are cohomological equivalences by 62. This statement is used at each finite length;
    the two inverse systems have different transition maps.
  Choose an integral constant class $beta in H_(upright("int"))^3 \( P_3 \)$ with $beta \[ 1 \/ p \] =
    p^N e_3$ for some $N gt.eq 0$, where $e_3$ denotes the source class in $H_(upright(b))^3 \( P_3 \)$.
    The normalized rational trace is fixed by $Gamma = "Gal" \( k \/ bb(F)_p \)$, as proved in 74.
    Thus each difference $gamma beta - beta$ is killed by a power of $p$.
    Since $Gamma$ is finite, one common power kills all these differences.
    Replacing $beta$ by that multiple and increasing $N$ makes the integral cohomology class $Gamma$-invariant
    while retaining the same nonzero rational trace line. Let $macron(beta)_ell$ be its canonical projection to
    $H^3 \( C_(upright("cts"))^bullet \( P_3 \, Lambda_ell \) \)$.
    These finite cohomology classes are reduction-compatible and $Gamma$-invariant.
    Let $a in H^3 \( R "proj lim"_(R_ell) sans(C)_ell^W \)$ be its coefficient image, where $R_ell :
    W_ell B_0 arrow.r W_(ell - 1) B_0$ is ordinary Witt restriction.
    The maps to perfected and geometric Witt coefficients commute with these restrictions.
    The nonvanishing already proved therefore implies $a \[ 1 \/ p \] eq.not 0$.
    The groups $H^2 \( sans(C)_ell^W \)$ are finite, by the finite-length additive Witt filtration and Proposition
    8.8, Theorem 8.9. Their tower is Mittag–Leffler, so the Milnor sequence gives
  $ H^3 \( R "proj lim"_(R_ell) sans(C)_ell^W \) = "proj lim"_(R_ell) H^3 \( sans(C)_ell^W \) . $
  Consequently the component classes $a_ell$ have unbounded $p$-power orders.
    By naturality of the projections, $a_ell$ is the coefficient image of $macron(beta)_ell$ in $W_ell B_0$ cohomology.
  Write $d_ell$ for their ghost images in $H^3 \( sans(C)_ell^D \)$. These have exactly the same orders.
    The ghost maps fix $bb(Z) \/ p^ell$, so $d_ell$ is the direct coefficient image of $macron(beta)_ell$ and is
    compatible with coefficient reduction. More explicitly the transition identity is
  $ "red"_(ell \, ell - 1) gamma_ell = gamma_(ell - 1) R_ell W_ell \( phi.alt_p \) \, $
  where $phi.alt_p \( b \) = b^p$ is the characteristic-$p$ Frobenius defined in 66.
    The class $a_ell$ is fixed by $W_ell \( phi.alt_p \)$ because it comes from $W_ell \( bb(F)_p \)$.
    The naturalities of the finite units also make each $d_ell$ $Gamma$-invariant.
    Exact semilinear descent in Lemma 3.2, Proposition 7.2 identifies, by restriction,
  $ H_(upright("cts"))^3 \( G_3 \( k \) \, D_ell \) tilde.eq H_(upright("cts"))^3 \( P_3 \, D_ell \)^Gamma . $
  Here descent is applied after extension to the semilinear $D_ell$ coefficients.
    The descended class restricts to $d_ell$, so it has the same order;
    these identifications also preserve ordinary reduction. Thus the specified descended constant classes have
    unbounded $p$-power order. The natural spectral comparison in (9.4), Proposition 9.7,
    with its unique bidegree $\( s \, t \) = \( 3 \, 0 \)$ in stem $- 3$,
    identifies this family with the finite projections of a class in $pi_(- 3) L_(K \( 1 \)) T$.
    Its unbounded finite orders make that class nonzero after rationalization,
    and the identification preserves the actual maps from constants. ◻
]

#thm([Lemma 10.9.])[
  (Origin in the rational sphere).  #emph[The reduced-trace class in $H_(upright(b))^3 \( P_3 \)$,
    after the constant coefficient map and coefficient-field descent,
    is the degree-three class of an element $alpha_3 in pi_(- 3) L_0 T$.
    This element is nonzero and its image in $pi_(- 3) L_0 L_(K \( 1 \)) T$ is nonzero.]
] <h3:lem:constants-origin>

#proof[
  Reduction followed by the ordinary coefficient localization $E_(3 \, 0) \( k \) arrow.r
    D_ell$ sends the integral constant class chosen in 80 to its specified finite classes $d_ell$.
    These have unbounded $p$-power order and are compatible with ordinary reduction.
    Hence the coefficient image of the rational trace in $H^3 \( P_3 \, E_(3 \, 0) \( k \) \) \[ 1 \/ p \]$ is
    nonzero. The trace construction and its coefficient map commute with the semilinear finite Galois action;
    their class is invariant and descends by 7.
  We explain why this cohomology class is an actual rational homotopy class.
    A central element $z = 1 + p$ acts trivially on $E_(3 \, 0) \( k \)$ and by the nontrivial scalar $z^(- q)$ on
    the nonzero periodicity twist $E_(3 \, 2 q) \( k \)$, for $q eq.not 0$.
    This is the action on $omega^(⊗ q)$ in the contravariant deformation convention of 16.
    A central group element acts as the identity on group cohomology when its coefficient action is combined with
    its trivial inner conjugation. Equivalently, the natural transformation furnished by that element gives a
    homotopy to the identity on the bar resolution. Thus $z^(- q) -
    1$ annihilates $H^s \( P_3 \, E_(3 \, 2 q) \( k \) \)$. It is a nonzero element of $bb(Z)_p$,
    so every such row vanishes after inversion of $p$.
  The descent of 50 is exact and strongly convergent. The finite stabilizer resolutions and exact semilinear
    descent of Lemma 10.5, Lemma 3.2 bound its cohomological amplitude.
    Rationalization therefore preserves its finite filtrations. Only internal degree zero remains.
    After finite coefficient-field descent, the actual coefficient maps fit into the commutative square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$H_(upright("cts"))^3 \( G_3 \( k \) \, E_(3 \, 0) \( k \) \) \[ 1 \/ p \]$])
  content((5.867, 0), [$\( "proj lim"_ell H_(upright("cts"))^3 \( G_3 \( k \) \, D_ell \) \) \[ 1 \/ p \]$])
  content((0, -1.239), [$pi_(- 3) L_0 T$])
  content((5.867, -1.239), [$pi_(- 3) L_0 "holim"_ell L_1 \( T \/ p^ell \) .$])
  line((2.25, 0), (3.023, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((0.2741, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((5.867, -0.2725), (5.867, -0.9661), mark: (end: ">"))
  content((6.141, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((0.732, -1.239), (3.881, -1.239), mark: (end: ">"))
})
  The upper arrow is induced by the coefficient reductions and localizations just described.
    The left isomorphism is the single-row rational descent calculation.
    The right isomorphism uses the natural, unique $\( s \, t \) = \( 3 \, 0 \)$ edge of 68 and the vanishing of
    the Milnor $lim^1$ term in 70. The finite-length model identifies those coefficient maps with the actual Moore
    quotient and localization maps on every descent term. For commutativity,
    first choose an integral representative of a $p$-power multiple of a rational source cohomology class.
    Finite source filtration and rational collapse allow a further $p$-power multiple to survive to homotopy.
    Naturality in 50 identifies its finite target edges with that same multiple of the coefficient images,
    for every $ell$. This multiplier is chosen in the source, independently of $ell$.
    Taking the coefficient limit and then inverting $p$ gives the displayed square.
  By 69, the bottom map is the rationalization of $T arrow.r L_(K \( 1 \)) T$.
    The nonzero rational trace image in the upper left therefore determines $alpha_3 in pi_(- 3) L_0 T$,
    and its image in the upper right is the nonzero rational class of the compatible finite constants.
    The square proves the asserted nonvanishing of its actual localization without an additional arithmetic
    coefficient splitting. ◻
]

#thm([Theorem 10.10.])[
  (Rational compatibility).  #emph[The generators in (3.3) may be chosen so that $alpha_1 =
    zeta$ and the actual localization map $T arrow.r L_(K \( 1 \)) T$ satisfies
#[#set math.equation(numbering: n => "(10.11)")
 $ alpha_3 mapsto c delta \, wide zeta alpha_3 mapsto c zeta delta wide \( c in bb(Q)_p^times \)
   $ <h3:eq:rat-actual-images>]

 after rationalization. In particular the rational homotopy of $T$ has basis
$ 1 \, med zeta \, med alpha_3 \, med zeta alpha_3 \, med alpha_5 \, med zeta alpha_5 \, med alpha_3 alpha_5 \,
  med zeta alpha_3 alpha_5 $

 in degrees $0 \, - 1 \, - 3 \, - 4 \, - 5 \, - 6 \, - 8 \, - 9$, respectively.]
] <h3:thm:rational-compatibility>

#proof[
  The rational exterior calculation (3.3) makes degree $- 3$ one-dimensional.
    Choose its generator to be the nonzero constant-origin class of 81.
    The determinant class is the degree-one group primitive by its construction in 7,
    and its actual image is nonzero rationally by 72. Thus it may be used as $alpha_1$.
    Choose any remaining exterior generator in degree $- 5$.
  By 70, the rational target in degree $- 3$ is precisely $bb(Q)_p delta$.
    Nonvanishing of the actual image gives $alpha_3 mapsto c delta$ with $c eq.not 0$.
    All coefficient comparisons and localizations used above respect products,
    and the same actual determinant class occurs on source and target.
    Multiplication by it gives the second formula with the same scalar.
    The exterior calculation then supplies the displayed basis. ◻
]

== 11 Applying fracture to the height-three overlap <sec:application>

The coefficient arguments have now produced the maps required by the finite construction of 3.
  We apply it with one choice of local maps and compatibility homotopy,
  obtaining both the filtration and its attachment identification.
  The local basis results used here were proved without the rational-obstruction theorem,
  which enters only in the final subsection.

=== 11.1 Checking the fracture data <checking-the-fracture-data>

#proof[
  Put $T = L_(K \( 3 \)) S$, $X = L_2 T$, and $R_1 = L_(K \( 1 \)) S$. Recall $Q = L_0 S tilde.eq H bb(Q)_p$, and set
  $ W = W_1 or W_2 = L_2 S or Sigma^(- 1) L_2 S . $
  53 supplies the actual unit and determinant map $w = \( 1 \, zeta \) : W arrow.r X$, a $K \( 2 \)$-equivalence.
    This verifies (i) of 3. Put $Y = "cofib" \( w \)$ and write $q : X arrow.r Y$.
  For the middle block, set
  $ U_(upright("mid")) = U_3 or U_4 = Sigma^(- 3) L_1 S or Sigma^(- 4) L_1 S . $
  72 supplies the equivalence of actual $R_1$-module maps
  #[#set math.equation(numbering: n => "(11.1)")
   $ \( 1 \, zeta \, delta \, zeta delta \) : R_1 or Sigma^(- 1) R_1 or Sigma^(- 3) R_1 or Sigma^(- 4) R_1
     arrow.r^tilde.eq L_(K \( 1 \)) T . $ <eq:height-one-basis>]
  Its first two components are the localizations of the same maps from $S$ used in $w$.
    Their restrictions are the same unit and determinant maps,
    and the module localization adjunction (2.1) identifies their extensions to $R_1$,
    including the required homotopies. The fourth component is the specified product $zeta delta$.
    Localizing the cofiber sequence at $K \( 1 \)$ therefore identifies $L_(K \( 1 \))
    Y$ with the cofiber of the first two components of (11.1) using those specified maps.
    Consequently the last two components of (11.1), followed by the quotient, give the required equivalence
  #[#set math.equation(numbering: n => "(11.2)")
   $ kappa : L_(K \( 1 \)) U_(upright("mid")) arrow.r^tilde.eq L_(K \( 1 \)) Y . $ <eq:kappa-application>]
  They are represented by the projections of $delta$ and $zeta delta$.
  For the rational part of the middle map, 82 gives
  $ pi_(*) L_0 T = Lambda_(bb(Q)_p) \( zeta \, alpha_3 \, alpha_5 \) \, wide \| zeta \| = - 1 \,
    quad \| alpha_3 \| = - 3 \, quad \| alpha_5 \| = - 5 \, $
  and identifies the actual rationalized localization map by
  #[#set math.equation(numbering: n => "(11.3)")
   $ alpha_3 mapsto c delta \, wide zeta alpha_3 mapsto c zeta delta quad
     upright("for one ") c in bb(Q)_p^times . $ <eq:rational-images>]
  Set
  $ beta_3 = c^(- 1) alpha_3 . $
  This normalization is made only in the rational source. No condition $c in bb(Z)_p^times$ is required.
    The projections of $beta_3$ and $zeta beta_3$ to $L_0 Y$ define a $Q$-module map
  $ r : L_0 U_(upright("mid")) = Sigma^(- 3) Q or Sigma^(- 4) Q arrow.r L_0 Y . $
  By (11.3), their images in $L_0 L_(K \( 1 \)) Y$ are the projections of $delta$ and $zeta delta$.
    These are also the images, under $L_0 kappa$, of the two unit generators of $L_0 U_(upright("mid"))$.
    The maps in (2.6) therefore agree on the generators of this finite free $Q$-module.
    An identifying homotopy of $Q$-module maps exists; choose one as the compatibility datum in (ii) of 3.
  It remains to check the final quotient. Since $L_0 L_i S = Q$ for $i = 1 \, 2$,
    rationalization of $w$ is the map from $Q or Sigma^(- 1) Q$ represented by $1 \, zeta$.
    These are two distinct members of the exterior basis in 82, so this map is injective on rational homotopy.
    Its cofiber $L_0 Y$ has one copy of $bb(Q)_p$ in each degree
  $ - 3 \, med - 4 \, med - 5 \, med - 6 \, med - 8 \, med - 9 . $
  There are no suspended kernel terms. The map $r$ is likewise injective on homotopy and includes the first two
    lines, represented by $beta_3 \, zeta beta_3$.
  Put
  $ V & = V_5 or V_6 or V_7 or V_8\
 & = Sigma^(- 5) Q or Sigma^(- 6) Q or Sigma^(- 8) Q or Sigma^(- 9) Q . $
  Define $b : V arrow.r L_0 X tilde.eq L_0 T$ by the four ordered classes
  #[#set math.equation(numbering: n => "(11.4)")
   $ alpha_5 \, wide zeta alpha_5 \, wide beta_3 alpha_5 \, wide
     zeta beta_3 alpha_5 . $ <eq:rational-basis-application>]
  They represent the remaining quotient lines in degrees $- 5 \, - 6 \, - 8 \, - 9$.
    The composite (2.7) is therefore an isomorphism on all homotopy groups,
    and hence an equivalence of rational modules. This verifies (iii).
  Carry out 3 with this single choice of $w \, kappa \, r \, b$ and compatibility homotopy,
    choosing coherent inverse data for $L_(K \( 2 \)) w$ and for $L_J
    a$ at the steps where those equivalences are established.
    This gives the same $h \, F_i \, a \, Z \, t \, e$ used by 4, with exactly the ordered cofibers in 1.
    The terminal projection $e : F_8 arrow.r X$ is an equivalence.
    Its restriction to $F_1 = L_2 S$ is the first component of $w$,
    namely the canonical map $L_2 \( S arrow.r T \)$, proving 1.
    For these same choices, 4 identifies all eight connecting maps by its two signed roofs.
    This proves its height-three instance without replacing the filtration or choosing new local maps. ◻
]

#prodef([Remark 11.1.])[
  The exact compatibility in (11.3) is needed for this application.
    Rational dimensions alone would not give the homotopy in (2.6);
    independently chosen degree-three and degree-four maps would not ensure that the same normalization works for
    the product with $zeta$.
]

=== 11.2 The first middle attachment <sec:attachment>

The filtration has been constructed without a nonvanishing assumption.
  We now ask whether its first height-one layer attaches nontrivially.
  The answer depends on the actual canonical $K \( 2 \)$-localization map, not on the rational dimensions of the layers.

First note why rationalizing the filtration does not answer this question.
  Its rationalized cofibers are single $Q$-modules in the strictly decreasing degrees $0 \, - 1 \, - 3 \, - 4 \, -
  5 \, - 6 \, - 8 \, - 9$. Inductively, if the previous rationalized boundaries vanish,
  $L_0 F_(i - 1)$ is the sum of the earlier shifts of $Q$. The degree of the new cofiber is smaller than every
  earlier degree, and hence cannot be a homotopy degree of $Sigma L_0 F_(i - 1)$.
  A $Q$-module map from the new shift to that suspension is zero.
  This proves by induction that every rationalized boundary vanishes. A spectral boundary can nevertheless be nonzero.

==== 11.2.1 A conditional lifting criterion <a-conditional-lifting-criterion>

Let

$ u_X : L_0 X arrow.r L_0 L_(K \( 2 \)) X $

be induced by the canonical localization unit. Retain the specific $h : U_(upright("mid")) arrow.r Y$, $beta_3$,
  and $d_3 = partial_w h \|_(U_3)$ constructed in 11, where $U_3 = Sigma^(- 3) L_1 S$.

#thm([Proposition 11.2.])[
  (Canonical-map criterion).  #emph[If $u_X$ does not kill $beta_3 in pi_(- 3) L_0 X$, then
$ d_3 : U_3 = Sigma^(- 3) L_1 S arrow.r Sigma W $

 is nonzero as a map of underlying spectra.]
] <prop:attachment-criterion>

#proof[
  Suppose $d_3$ were null after forgetting the module structure.
    Applying spectral mapping spaces from $U_3$ to the cofiber sequence
  $ W arrow.r X arrow.r^q Y arrow.r^(partial_w) Sigma W $
  shows that the chosen nullhomotopy lifts $h \|_(U_3)$ to a map $tilde(h)_3 : U_3 arrow.r X$.
    Rationally, $L_0 W$ has homotopy only in degrees $0$ and $- 1$.
    Its groups in degrees $- 3$ and $- 4$ are zero, so the cofiber sequence makes $pi_(- 3) L_0 X arrow.r
    pi_(- 3) L_0 Y$ an isomorphism. The construction of $h$ sends the degree-$-
    3$ generator of $L_0 U_3$ to the projection of $beta_3$. Thus $L_0 tilde(h)_3$ sends it to $beta_3$ itself.
    This uses only the image of that underlying homotopy element.
  But $L_(K \( 2 \)) U_3 = 0$, since $U_3$ is $E \( 1 \)$-local.
    By localization adjunction, every map from $U_3$ to the $K \( 2 \)$-local target $L_(K \( 2 \)) X$ is null.
    In particular, the composite of $tilde(h)_3$ with the unit $X arrow.r L_(K \( 2 \)) X$ is null.
    Rationalizing and using naturality would make $u_X$ kill $beta_3$, contrary to the hypothesis. ◻
]

This criterion is independent of the existence argument: its antecedent was not used to construct $h$, the stages,
  or their terminal equivalence.

==== 11.2.2 The companion canonical-map theorem <the-companion-canonical-map-theorem>

For every prime $p gt.eq 5$, the canonical map for the uncompleted sphere $bb(S)$,

#[#set math.equation(numbering: n => "(11.5)")
 $ L_0 L_(K \( 3 \)) bb(S) arrow.r L_0 L_(K \( 2 \)) L_(K \( 3 \)) bb(S) \, $ <eq:companion-map>]

is nonzero on $pi_(- 3)$. This is #cite(label("CompanionHeightThreeObstruction")) Theorem 1.1.

#thm([Corollary 11.3.])[
  (Nonzero first middle attachment).  #emph[For every prime $p gt.eq 5$,
    retain the common height-three choice in 11, which realizes 1 and the height-three instance of 4. Then
$ d_3 : Sigma^(- 3) L_1 S arrow.r Sigma #scale(x: 120%, y: 120%)[\(] L_2 S or Sigma^(- 1) L_2 S
  #scale(x: 120%, y: 120%)[\)] $

 is nonzero as a map of underlying spectra.]
] <cor:nonzero-attachment>

#proof[
  Set $T_0 = L_(K \( 3 \)) bb(S)$. The completion map $bb(S) arrow.r S$ is a mod-$p$ equivalence.
    After $p$-localization its cofiber has invertible multiplication by $p$,
    hence is rational and $K \( 3 \)$-acyclic. Completion therefore induces an equivalence $e_c :
    T_0 arrow.r^tilde.eq T$. Naturality of the $K \( 2 \)$-localization unit gives
  (11.6)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$L_0 T_0$])
  content((3.113, 0), [$L_0 L_(K \( 2 \)) T_0$])
  content((0, -1.239), [$L_0 T$])
  content((3.113, -1.239), [$L_0 L_(K \( 2 \)) T .$])
  line((0.666, 0), (2.051, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.5632, -0.6193), [#text(size: 0.73em)[$L_0 e_c$]])
  content((0.2741, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((3.113, -0.2725), (3.113, -0.9661), mark: (end: ">"))
  content((2.261, -0.6193), [#text(size: 0.73em)[$L_0 L_(K \( 2 \)) e_c$]])
  content((3.388, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((0.534, -1.239), (2.117, -1.239), mark: (end: ">"))
})
  The top map is nonzero on $pi_(- 3)$ by #cite(label("CompanionHeightThreeObstruction")) Theorem 1.1.
    Hence so is the bottom map.
  Let $ell : T arrow.r X = L_2 T$ be the localization map. Its cofiber is $E \( 2 \)$-acyclic.
    Since $chevron.l E \( 2 \) chevron.r = chevron.l K \( 0 \) or K \( 1 \) or K \( 2 \) chevron.r$,
    that cofiber is both rationally and $K \( 2 \)$-acyclic. The vertical maps in the next naturality square are
    therefore equivalences:
  (11.7)
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$L_0 T$])
  content((2.915, 0), [$L_0 L_(K \( 2 \)) T$])
  content((0, -1.239), [$L_0 X$])
  content((2.915, -1.239), [$L_0 L_(K \( 2 \)) X .$])
  line((0.534, 0), (1.985, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.4186, -0.6193), [#text(size: 0.73em)[$L_0 ell$]])
  content((0.2741, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((2.915, -0.2725), (2.915, -0.9661), mark: (end: ">"))
  content((2.208, -0.6193), [#text(size: 0.73em)[$L_0 L_(K \( 2 \)) ell$]])
  content((3.189, -0.6193), [#text(size: 0.73em)[$tilde.eq$]])
  line((0.534, -1.239), (1.919, -1.239), mark: (end: ">"))
  content((1.227, -1.012), [#text(size: 0.73em)[$u_X$]])
})
  Thus $u_X$ is nonzero on $pi_(- 3)$, and it is the same canonical map under these identifications.
    An arbitrary nonzero map between the same two objects would not suffice.
  The square (11.7) is a square of $S$-modules by (2.1). Rationalization is extension to $Q = H bb(Q)_p$,
    so its homotopy maps are $bb(Q)_p$-linear. Equivalently, the action of $pi_0 S =
    bb(Z)_p$ on rational homotopy extends uniquely across inversion of $p$. By 82,
  $ pi_(- 3) L_0 X = bb(Q)_p alpha_3 . $
  A nonzero $bb(Q)_p$-linear map from this one-dimensional space cannot kill $alpha_3$ or its nonzero scalar
    multiple $beta_3 = c^(- 1) alpha_3$. This conclusion requires no numerical identification of a primitive
    chosen in the companion proof with the chosen $alpha_3$.
  The hypothesis of 84 is now satisfied, so $d_3 eq.not 0$. ◻
]

Thus the companion theorem enters only in verifying the antecedent of the conditional criterion.
  The stages and local bases in 1 were constructed independently.

== 12 The rational boundary <h3:app:rational-boundary>

We give the height-three argument of #cite(label("BSSW")) Sections 2.5–2.6 and 3.9–6.3 for the rational algebra
  used in 82. The separate trace calculation in 10 identifies the localization of its degree-three generator.

#thm([Proposition 12.1.])[
  (The rational height-three sphere).  #emph[For every prime $p gt.eq 5$, there is an isomorphism of graded algebras
$ pi_(*) L_0 T tilde.eq Lambda_(bb(Q)_p) \( alpha_1 \, alpha_3 \, alpha_5 \) \, wide \| alpha_i \| = - i . $

]
] <h3:prop:rational-boundary>

The proof reduces this homotopy calculation to a comparison with constant coefficients. Put

$ overline(W) & = W \( overline(bb(F))_p \) \, & breve(K) & = overline(W) \[ 1 \/ p \] \,\
overline(A) & = overline(W) \[ \[ u_1 \, u_2 \] \] \, & overline(G) & =
  P_3 times.r "Gal" \( overline(bb(F))_p \/ bb(F)_p \) . $

The map to be proved an isomorphism is the constants inclusion

#[#set math.equation(numbering: n => "(12.1)")
 $ H^(*) \( overline(G) \, overline(W) \) \[ 1 \/ p \] arrow.r
   H^(*) \( overline(G) \, overline(A) \) \[ 1 \/ p \] . $ <h3:eq:rational-boundary-constants>]

The compact Lie-algebra calculation identifies the source with the exterior algebra in cohomological degrees $1 \,
  3 \, 5$. Comparisons of the Lubin–Tate and Drinfeld towers identify the target with the same graded vector space
  after adjoining to both sides an exterior class $epsilon.alt$ of degree one.
  A continuous equivariant additive retraction onto $overline(W)$ makes the source a direct summand.
  Comparing dimensions, including the common $epsilon.alt$ factor,
  then forces the complementary cohomology to vanish. Since the original constants inclusion is multiplicative,
  this proves the algebra comparison. Rational Morava descent converts it to the asserted homotopy algebra.

The tower comparisons must be made integrally: the arithmetic estimates give torsion bounds uniform over the
  charts and radii, so that the derived limits and group invariants can be taken before inverting $p$.
  We first establish the Drinfeld model’s actual scalar equivalence.
  Its building calculation also supplies the properties used for the group $J_3$ in 74.

=== 12.1 The Drinfeld model and its building <the-drinfeld-model-and-its-building>

#thm([Lemma 12.2.])[
  (The reduced rank-three building).  #emph[Let $F$ be a non-Archimedean local field with normalized valuation
    $nu$, valuation ring $cal(O)$, uniformizer $pi$, and residue field $kappa$ of cardinality $q$.
    Let $cal(B)$ be the reduced affine building of $upright("GL")_3 \( F \)$,
    equivalently the building of $upright("PGL")_3 \( F \)$, and put
$ J_3 \( F \) = { g in upright("GL")_3 \( F \) : nu \( det g \) = 0 } . $

 Then $cal(B)$ is a contractible, locally finite, two-dimensional simplicial complex.
   Each vertex has $2 \( q^2 + q + 1 \)$ adjacent vertices. The group $J_3 \( F \)$ preserves vertex types.
   The setwise stabilizer of every nonempty face is compact open in $J_3 \( F \)$ and fixes that face pointwise.
   Any closed chamber is a fundamental domain, including all its faces.]
] <h3:lem:rank-three-building>

#proof[
  For $upright("GL")_3$, the semisimple quotient used to define the reduced building is the split group
    $upright("PGL")_3$ of rank two. The geometry statement in #cite(label("MeyerSolleveldBuildings"))
    Section 1.1.2, p. 6 applies over the local field $F$: the reduced building is locally finite,
    has dimension the rank of this quotient, and is equivariantly contractible for every compact subgroup of the
    quotient. Taking the trivial compact subgroup gives contractibility.
  In the lattice-chain model of #cite(label("DeligneFlicker2013")) Section 5.6, pp. 952–953,
    vertices are homothety classes $\[ L \]$ of $cal(O)$-lattices in $F^3$,
    and a chamber can be represented by a strict cyclic chain
  $ L_0 supset L_1 supset L_2 supset pi L_0 . $
  Modulo $pi L_0$ this is a complete flag in $kappa^3$. Thus a chamber has three vertices and is a two-simplex.
    An adjacent vertex to $\[ L \]$ has a unique representative $M$ with $pi L subset.neq M subset.neq L$.
    These representatives correspond to the nonzero proper subspaces of $L \/ pi L tilde.equiv kappa^3$.
    There are $q^2 + q + 1$ lines and the same number of planes,
    giving the stated valency and a direct local-finiteness check.
    Since the complex is locally finite, its metric polyhedral and weak simplicial topologies agree locally on
    finite unions of simplices. Its realization is therefore a contractible CW complex.
    The augmented cellular chain complex over $bb(Z)$ is exact, with free direct-sum terms in degrees $0 \, 1 \, 2$.
  Fix the standard lattice $cal(O)^3$ and define
  $ "type" \( \[ g cal(O)^3 \] \) = nu \( det g \) med \( mod med 3 \) . $
  Changing an integral basis changes the determinant by a unit;
    scalar homothety changes its valuation by a multiple of three.
    This type is therefore well defined, and $J_3 \( F \)$ preserves it.
    The three vertices of a chamber have all three types, since successive flag steps change the lattice
    determinant valuation by one.
  To send the standard chamber to a given chamber, start at the latter’s unique type-zero vertex.
    Write its lattice as $M = g cal(O)^3$ with $nu \( det g \) = 3 m$, and replace $M$ by $M_0 = pi^(- m) M$.
    Reanchor the cyclic chain at $M_0$. A basis $f_1 \, f_2 \, f_3$ of $M_0$ adapted to its residue flag gives
  $ M_i = pi cal(O) f_1 + dots.h.c + pi cal(O) f_i + cal(O) f_(i + 1) + dots.h.c + cal(O) f_3 quad \( i = 1 \, 2 \) . $
  The map from the standard basis to $\( f_1 \, f_2 \, f_3 \)$ has determinant valuation zero,
    because its image lattice is $M_0$. It lies in $J_3 \( F \)$ and sends the standard chamber to the given chamber.
  If $h in J_3 \( F \)$ stabilizes $\[ L \]$, then $h L = a L$ for some $a in F^times$.
    Taking determinant valuations relative to $L$ gives $0 = nu \( det h \) = 3 nu \( a \)$,
    so $a$ is a unit and $h L = L$. Hence the vertex stabilizer is exactly $"Aut"_(cal(O)) \( L \)$,
    a conjugate of the compact open group $upright("GL")_3 \( cal(O) \)$.
    A setwise face stabilizer fixes each vertex because their types are distinct.
    It is therefore the finite intersection of these vertex stabilizers,
    hence is compact open and fixes the face pointwise.
  Every face lies in a chamber, and chamber transitivity sends it into the standard chamber.
    Its set of vertex types picks out a unique face there. Type preservation also preserves the barycentric
    coordinates labeled by those types, so no distinct points of the closed chamber are identified.
    This proves the fundamental-domain assertion, including its faces. ◻
]

#thm([Lemma 12.3.])[
  (The structure sheaf of the height-three Drinfeld model).  #emph[Let $frak(H)$ be the $p$-adic completion of the
    standard separated strictly semistable weak formal model of $Omega_(bb(Q)_p)^2$ over $bb(Z)_p$.
    The canonical scalar map
$ underline(bb(Z)_p) arrow.r R Gamma \( frak(H) \, cal(O) \) $

 is an equivalence of condensed complexes, and is equivariant for the action of $"GL"_3 \( bb(Z)_p \)$.
   Here the right side retains the derived sections on $frak(H) times underline(Q)$ for every profinite set $Q$.]
] <h3:lem:drinfeld-structure-sheaf>

#proof[
  The imported model facts are given in #cite(label("GKModel")) Sections 3.6, 3.8, 6.1–6.2, 6.4 and 7.1,
    and the proof of Proposition 6.5. After ordinary $p$-adic completion the local strictly semistable equations
    and the special fiber are unchanged. The model is separated:
    each of the increasing weak-formal opens lies in a separated blowup stage,
    and any two lie in one common such stage; the local closed-diagonal criterion is preserved by completion.
    The components and their nonempty intersections are products of successive blowups of projective spaces along
    rational linear subspaces. They are indexed by the vertices and simplices of the locally finite
    two-dimensional Bruhat–Tits building $cal(B)$ of 87. Only the factors in dimensions $0 \, 1 \, 2$ occur here.
  We compute the structure-sheaf cohomology of exactly these factors.
    For $upright(bold(P))_k^n$, $0 lt.eq n lt.eq 2$, over a field $k$, use the standard affine cover.
    On an intersection indexed by a nonempty set $I subset { 0 \, dots.h \, n }$,
    its degree-zero homogeneous Laurent monomials have exponent vector $\( a_0 \, dots.h \, a_n \)$ with $sum
    a_i = 0$ and $a_i gt.eq 0$ when $i in.not I$. The Čech complex decomposes by these monomials.
    The constant monomial gives the cochain complex of the full simplex and hence $k$ in degree zero.
    For any other monomial its negative support $N = { i : a_i < 0 }$ is nonempty and proper,
    and the monomial occurs exactly for $I supset N$. Adding and deleting a fixed index outside $N$,
    with the usual alternating sign, contracts this summand. It follows that
  $ R Gamma \( upright(bold(P))_k^n \, cal(O) \) = k \[ 0 \] . $
  The only nontrivial blowups needed for a surface factor are blowups at the specified smooth rational points.
    The calculation for one such point is local on the surface and can be made in étale coordinates
    $\( u \, v \)$. For the blowup of $upright(bold(A))_k^2$ at the origin,
    the two standard charts and their overlap have rings
  $ B_u = k \[ u \, t \] \, wide B_v = k \[ v \, s \] \, wide B_(u v) = k \[ u \, t \, t^(- 1) \] \, wide v =
    u t \, quad s = t^(- 1) . $
  In the common Laurent ring a monomial $u^a t^b$, with $a gt.eq 0$ and $b in bb(Z)$,
    belongs to $B_u$ when $b gt.eq 0$ and to $B_v$ when $b lt.eq a$. These two conditions cover all monomials.
    Their intersection is spanned by $0 lt.eq b lt.eq a$, where $u^a t^b = u^(a - b) v^b$. Thus the affine Čech sequence
  $ 0 arrow.r k \[ u \, v \] arrow.r B_u xor B_v arrow.r B_(u v) arrow.r 0 $
  is exact. The same sequence remains exact after localization and flat étale base change,
    which are the local coordinate changes in question. The affine chart calculation therefore proves $R pi_(*)
    cal(O) = cal(O)$ for each required smooth-point blowup $pi$. Blowing up an invertible ideal is an isomorphism.
    This covers the later strict transforms of rational lines on the surface and the point centers on a projective
    line, all of which are Cartier divisors. Iterating the result,
    and using the finite affine-cover double Čech complex for products over $k$, proves
  $ R Gamma \( Y \, cal(O)_Y \) = k \[ 0 \] $
  for every stratum $Y$ occurring in this height-three model.
    This argument makes no assertion about other rational varieties.
    For a profinite parameter $Q$ the same calculations give $C_(upright("cts")) \( Q \, k \) \[ 0 \]$:
    continuous maps to each discrete section module factor through a finite clopen partition of $Q$,
    and the filtered union of the resulting finite powers preserves the exact Čech sequences.
  We next justify the resolution by intersections of components.
    On a standard special-fiber chart its augmented form is the alternating complex
  $ k \[ t_0 \, dots.h \, t_d \] \/ \( t_0 dots.h.c t_r \) arrow.r
    xor.big_i k \[ t_0 \, dots.h \, t_d \] \/ \( t_i \) arrow.r
    xor.big_(i < j) k \[ t_0 \, dots.h \, t_d \] \/ \( t_i \, t_j \) arrow.r dots.h.c . $
  For a nonzero monomial, let $Z$ be the nonempty set of indices $i lt.eq r$ at which its exponent is zero.
    Its coefficient complex is the augmented cochain complex of the simplex on $Z$, so it is exact.
    This proves exactness monomial by monomial. The calculation is unchanged by the torus variables,
    localizations, and flat étale base changes in the semistable charts.
    Local finiteness of the components now gives the global resolution by the products of their intersection
    sheaves. Taking derived global sections with a profinite parameter and using the preceding stratum calculation
    computes $R Gamma \( frak(H)_(bb(F)_p) times underline(Q) \, cal(O) \)$ by the three product terms below.
    The arrow from $C_(upright("cts")) \( Q \, bb(F)_p \)$ is the separate canonical constants augmentation:
  $ C_(upright("cts")) \( Q \, bb(F)_p \) arrow.r product_(sigma in cal(B)_0)
    C_(upright("cts")) \( Q \, bb(F)_p \) arrow.r product_(sigma in cal(B)_1)
    C_(upright("cts")) \( Q \, bb(F)_p \) arrow.r product_(sigma in cal(B)_2) C_(upright("cts")) \( Q \, bb(F)_p \) \, $
  with the cellular incidence signs. Products occur because the strata are indexed by all cells of the building.
  Here is a contraction valid for these product cochains. By 87,
    the augmented bounded cellular chain complex $C_bullet \( cal(B) \; bb(Z) \) arrow.r bb(Z)$ is exact.
    Its terms are free abelian, and each cycle subgroup is free because it is a subgroup of a free abelian group.
    The short exact sequences of cycles therefore split. Choosing splittings gives a chain contraction of the
    augmented complex. This contraction is not asserted to be equivariant.
    Each basis cell maps to a finite cellular chain, since a cellular chain group is a direct sum of its cells.
    Dualizing into $C_(upright("cts")) \( Q \, bb(F)_p \)$ consequently gives a contraction of the displayed
    product cochains: every output coordinate is a finite linear combination of input coordinates and is
    continuous for the product topology. The contraction is natural in $Q$.
  The canonical constants map into cellular cochains is equivariant for the building action.
    The contraction proves that its underlying condensed map is an equivalence;
    the forgetful functor from equivariant derived objects is conservative,
    so this same canonical map is an equivariant equivalence. In particular
  $ underline(bb(F)_p) arrow.r^(med tilde.eq med) R Gamma \( frak(H)_(bb(F)_p) \, cal(O) \) . $
  Finally the formal structure sheaf is derived $p$-complete,
    and derived global sections preserve its inverse limit of reductions.
    The cone of the actual scalar map $underline(bb(Z)_p) arrow.r
    R Gamma \( frak(H) \, cal(O) \)$ is therefore derived $p$-complete.
    Flatness of the semistable model identifies its reduction modulo $p$ with the zero cone just computed.
    Every successive reduction modulo $p^ell$ is then zero, and derived $p$-completeness makes the cone itself
    zero. This proves the claimed equivariant equivalence. ◻
]

=== 12.2 The rational boundary calculation <the-rational-boundary-calculation>

#proof[
  All cohomology complexes below retain their condensed parameters;
    all inverse limits and group invariants are derived and taken before inverting $p$.
  #emph[1. Arithmetic bounds.] Let $K$ be complete discretely valued of mixed characteristic $\( 0 \, p \)$ with
    perfect residue field, and let $C$ be a completed algebraic closure.
    The scalar class obtained from the cyclotomic logarithm gives a natural map
  $ cal(O)_K \[ epsilon.alt \] arrow.r R Gamma \( G_K \, cal(O)_C \) \, wide \| epsilon.alt \| = 1 \, quad
    epsilon.alt^2 = 0 . $
  Its cone is cohomologically nonnegative, and in each degree its cohomology is killed by a power of $p$.
    The required bounds can be chosen uniformly after finite tame extensions of $K$.
    For the finitely many nonzero twists $j = 1 \, 2$, the same assertion of bounded torsion holds for
    $H^i \( G_K \, cal(O)_C \( - j \) \)$, with $H^0 = 0$. Here is the part of the proof that gives uniformity,
    #cite(label("BSSW")) Sections 4.2–4.4. Choose a finite cyclotomic stage $B \/
    K$ far enough out that the remaining $bb(Z)_p$-tower is totally ramified and sufficiently ramified in the
    sense of #cite(label("BSSW")) Definition 4.2.5 and Lemma 4.2.6, generated by $sigma$,
    with $chi \( sigma \)$ a generator of $1 + p^s bb(Z)_p$, $s gt.eq 2$.
    Write $M = cal(O)_(hat(K)_oo)$ and $V = ker \( t : hat(K)_oo arrow.r B \)$ for normalized trace.
    The estimates in #cite(label("BSSW")) (4.2.9), (4.2.15), Lemmas 4.2.12 and 4.2.17,
    and the proof of Proposition 4.2.18 are
  $ parallel t parallel lt.eq \| p \|^(- 1 \/ \( p - 1 \)) \, wide
    parallel \( sigma - 1 \)^(- 1) parallel_V lt.eq \| p \|^(- 1 - 1 \/ \[ p \( p - 1 \) \]) . $
  For existence of the inverse, at a finite cyclic level $sigma -
    1$ has kernel $B$ and image the trace-zero subspace. Its inverse there is bounded by the second estimate,
    so the inverses extend compatibly to the completion. The estimate follows by induction from normalized layer
    trace $t_n = p^(- 1) "Tr"$ and
  $ x - t_n x = p^(- 1) sum_(a = 1)^(p - 1) \( 1 - sigma^(a p^(n - 1)) \) x \, wide
    parallel t_n parallel lt.eq \| p \|^(- p^(- n)) . $
  Set $M_0 = cal(O)_B xor \( V ∩ M \) subset M$. The first norm bound gives $p M subset M_0$,
    so $M \/ M_0$ is killed by $p$. For $j in { - 2 \, - 1 \, 1 \, 2 }$, put $lambda = chi \( sigma \)^(- j)$;
    then $v_p \( lambda - 1 \) = s$, since $p gt.eq 5$. The inequality $\| lambda -
    1 \| thin parallel \( sigma - 1 \)^(- 1) parallel_V < 1$ follows from $s gt.eq 2 > 1 +
    1 \/ \[ p \( p - 1 \) \]$. A Neumann series therefore inverts $sigma -
    lambda$ on $V$ with the same bound #cite(label("BSSW")) Lemma 4.4.1,
    so its cokernel on $V ∩ M$ is killed by $p^2$. On $cal(O)_B$ its cokernel is killed by $p^s$.
    Thus $H^1 \( chevron.l sigma chevron.r \, M_0 \( j \) \)$ is killed by $p^s$, while the invariants vanish.
    The sequence $M_0 arrow.r M arrow.r M \/ M_0$ gives a $p^(s + 1)$ bound for
    $H^1 \( chevron.l sigma chevron.r \, M \( j \) \)$. The rational decomposition $B xor
    V$ also shows directly that $M \( j \)$ has no invariants under the tail.
    Restriction from $"Gal" \( K_oo \/ K \)$ to this open tail injects $H^1$, because the tail has no invariants.
    The cyclotomic fixed-field calculation and affinoid perfectoid integral acyclicity compare this with
    $cal(O)_C \( j \)$ #cite(label("BSSW")) Lemmas 4.3.2 and 4.3.5.
    Before cyclotomic invariants, the perfectoid-tail degree-zero comparison has almost-zero cohomological error.
    The maximal ideal of the completed valuation ring is flat and idempotent,
    so this error is annihilated by $p$ in the equivariant derived category.
    In the resulting triangle after invariants, the error $Y$ has $H^0 \( Y \) = 0$ and $p H^i \( Y \) =
    0$ for $i > 0$ #cite(label("BSSW")) Lemma 4.3.5 and Theorem 4.4.3.
    This gives the conservative bound $p^(s + 2)$ in degree one;
    the remaining degrees are bounded as in the same triangle.
    The untwisted calculation retains the constant summand and its cyclotomic-logarithm class,
    giving the displayed map $cal(O)_K \[ epsilon.alt \]$ and its bounded-torsion cone.
    Sufficient ramification persists under tame base change. For a finite tame extension $L \/ K$, let $e =
    e \( L B \/ B \)$ be the effective tame ramification index after the chosen initial cyclotomic stage $B$.
    If $d_n$ is the different exponent of a $p$-layer above $B$, then the base-changed exponent is
  $ d'_n = e d_n - \( e - 1 \) \( p - 1 \) . $
  Consequently the same tail, $s$, and bounds work for all the tame extensions in question.
    Only existence of these tame-uniform bounds is used; the sharp numerical constants in the preprint are unnecessary.
  #emph[2. Semistable comparison.]
  First apply this to a small affine semistable formal $cal(O)_K$-scheme $frak(U) =
    "Spf" \( R_0 \)$ of relative dimension $d lt.eq 2$, where small means admitting an étale morphism to a
    standard semistable chart. Write $U$ for its generic fiber,
    $frak(U)_C$ for its completed base change to $cal(O)_C$, and $U_C$ for the geometric generic fiber.
    Use the divisorial log structure and the valuation log structure on the base.
    The semistable logarithmic comparison of #cite(label("CK")) Sections 1.5–1.6 and Theorem 4.11,
    extending the smooth comparison of #cite(label("BMS")) Theorem 8.3, applies on étale charts
  $ cal(O)_C chevron.l T_0 \, dots.h \, T_r \, T_(r + 1)^(plus.minus 1) \, dots.h \,
    T_d^(plus.minus 1) chevron.r \/ \( T_0 dots.h.c T_r - a \) \, wide 0 eq.not a in frak(m)_C . $
  They identify the cohomology of $L eta_(zeta_p - 1) R nu_(*) hat(cal(O))^(+)$ with $Omega_(frak(U)_C \, log)^j
    { - j }$ for $0 lt.eq j lt.eq d$. No properness is required for these local statements.
    The logarithmic differentials on $frak(U)$ are coherent and flat over $cal(O)_K$,
    and their higher cohomology on this affine vanishes. Their completed base changes are the displayed
    differentials on $frak(U)_C$. The needed completed projection formula can be checked modulo $p$:
    a flat module modulo $p$ is free over the artinian local ring $cal(O)_K \/ p$,
    and continuous cochains on a compact group commute with these direct sums,
    since a map to a discrete direct sum has finite image. Derived $p$-completeness then proves the projection
    formula before reduction. For $j > 0$, the normalized map from the Breuil–Kisin twist to the Tate twist has
    cokernel killed by $p$, so the preceding arithmetic bounds apply to each of the finitely many positive graded
    pieces.
  For the comparison with the original complex, put $C_U = R
    Gamma \( U_(C \, upright(p r o acute(e) t)) \, hat(cal(O))^(+) \)$, $I = \( zeta_p - 1 \) subset cal(O)_C$,
    and $A_U = L eta_I C_U$. The ideal $I$ is $G_K$-stable, although its displayed generator need not be fixed.
    On the semistable charts above, the perfectoid-cover edge map of #cite(label("CK")) Section 3.3,
    Equation (3.3.1) has almost-zero cone. Its source is the continuous cochain complex for $Delta tilde.eq
    bb(Z)_p^d$, represented by a $d$-variable Koszul complex #cite(label("CK")) Lemma 3.7.
    Thus $H^q \( C_U \)$ is almost zero for $q > d$. Moreover,
    #cite(label("CK")) Theorems 3.9 and 4.11 identifies $A_U$ with a complex concentrated in degrees
    $\[ 0 \, d \]$. The degree-zero cohomology of $C_U$ is $I$-torsion-free; indeed,
    it is the formal structure ring #cite(label("CK")) Proposition 4.4.
  Set $B_U = tau^(lt.eq d) C_U$. Lemma 6.9 of #cite(label("BMS")),
    together with compatibility of $L eta_I$ with truncation, gives maps
  $ a : A_U arrow.r B_U \, wide b : I^(⊗ d) ⊗ B_U arrow.r A_U $
  whose composites are the natural ideal inclusions. The invariant element $p^d in
    I^d$ gives an equivariant map $cal(O)_C arrow.r I^(⊗ d)$; composing it with $b$ gives $b_p : B_U arrow.r
    A_U$ with $a b_p = p^d$ and $b_p a = p^d$. Hence the kernel and cokernel of each $H^q \( a \)$ are killed by
    $p^d$, and the long exact sequence gives $p^(2 d) H^q \( "cone" \( a \) \) = 0$. The triangle
  $ "cone" \( a \) arrow.r "cone" \( A_U arrow.r C_U \) arrow.r tau^(> d) C_U $
  then shows that $p^(2 d + 1)$ kills every cohomology group of the full cone:
    the last term has almost-zero cohomology, which is killed by $p$. The full cone is connective.
    This argument concerns its cohomology and does not assert that it carries a strict $bb(Z) \/
    p^(2 d + 1)$-module structure.
  After $G_K$-invariants, the first-quadrant spectral sequence has terms
    $H^s \( G_K \, H^t \( "cone" \( A_U arrow.r C_U \) \) \)$.
    In total degree $k$ its filtration has at most $k + 1$ pieces, each killed by $p^(2 d + 1)$.
    Therefore $p^(\( 2 d + 1 \) \( k + 1 \))$ kills the cohomology in that degree.
    These conservative bounds depend on $d$ and $k$, and are independent of the chart and its tame extension.
    The positive logarithmic graded pieces retain the arithmetic bounds proved in Step 1.
    Tame descent preserves these bounds, by unramified semilinear descent and averaging over tame inertia.
    We obtain the natural comparison
  $ cal(O) \( frak(U) \) \[ epsilon.alt \] arrow.r R Gamma \( U_(upright(p r o acute(e) t)) \, hat(cal(O))^(+) \) $
  with nonnegative cone and degreewise bounds independent of the chosen charts and their tame extensions.
    For a general semistable affine, choose an étale hypercover refining the Čech nerve of a small-chart cover,
    with each term a finite disjoint union of small affine charts.
    Such finite covers of the matching objects exist because the base is quasi-compact and quasi-separated.
    Apply étale hyperdescent to the actual natural comparison map.
    Its levelwise cones are connective and have the uniform degreewise bounds just proved.
    In a fixed total degree the descent spectral sequence has only finitely many cosimplicial and cohomological
    positions, so the same bounded-torsion conclusion follows.
    Gluing next by a separated affine formal cover likewise preserves a bound in every total degree,
    since the relevant Čech diagonal is finite. This proves the part of #cite(label("BSSW")) Sections 5.3–5.6
    needed here.
  #emph[3. The two global calculations.] The Lubin–Tate space $upright("LT")_(breve(K))$ is the open
    two-dimensional ball. Exhaust it by closed balls of radii $\| p \|^(1 \/ ell)$ for primes $ell eq.not p$;
    each has a smooth model after a tame extension. The two-index system of integral functions modulo $p^j$,
    indexed by radius and $j$, is Mittag–Leffler. This coefficient limit is taken over the fixed base $breve(K)$,
    whose uniformizer is $p$; the tame extensions were used for the local comparisons.
    More generally, with uniformizer $pi.alt$, for a fixed inner radius $r$ and reduction exponent $j$ take $M =
    ceil.l \( j + 1 \) \/ log_(\| pi.alt \|) \( r \) ceil.r$.
    Restriction from any $s gt.eq r^(1 \/ \( j + 1 \))$, with source reduced modulo any $pi.alt^(j')$ for $j'
    gt.eq j$, kills modulo $pi.alt^j$ all terms of total degree at least $M$,
    and the surviving coefficients are integral. Conversely every monomial of degree less than $M$ is already
    integral on the larger ball. The image is therefore the fixed module spanned by those monomials.
    Continuous functions from a profinite parameter preserve this image statement by finite clopen partitions.
    A cofinal diagonal reduces the two indices to a countable Mittag–Leffler tower.
    Thus the derived two-index limit is $overline(A)$ in degree zero,
    as in #cite(label("BSSW")) Lemmas 6.1.2–6.1.3. The preceding local comparisons and the countable inverse-limit
    spectral sequence give
  $ overline(A) \[ epsilon.alt \] arrow.r
    R Gamma \( upright("LT")_(breve(K) \, upright(p r o acute(e) t)) \, hat(cal(O))^(+) \) $
  with nonnegative, degreewise bounded-torsion cone: in any degree the limit spectral sequence uses only a limit
    in that degree and a $lim^1$ from the preceding degree, both with bounds uniform over the radii.
    No uniform bound over all cohomological degrees is needed.
  The other space is $Omega_(bb(Q)_p)^2$, with the formal model $frak(H)$ of 88.
    That lemma gives the actual equivariant scalar equivalence $underline(bb(Z)_p) tilde.eq R
    Gamma \( frak(H) \, cal(O) \)$, including all profinite parameters.
    It supplies the structure-sheaf assertion needed from #cite(label("BSSW")) Theorem 6.2.1.
    The semistable comparison now gives
  $ bb(Z)_p \[ epsilon.alt \] arrow.r R Gamma \( Omega_(bb(Q)_p \, upright(p r o acute(e) t))^2 \, hat(cal(O))^(+) \) $
  with the same degreewise bounded-torsion conclusion.
  #emph[4. The tower comparison.] The bridge between these calculations is an equivalence of #emph[families],
    not merely a bijection of geometric points. The relative Rapoport–Zink/shtuka comparison
    #cite(label("ScholzeWeinsteinBerkeley")) Theorem 24.2.5 and its proof, pp. 227–229,
    using the family comparison of its Theorem 22.3.1, identifies the universal integral Tate local system with
    that in a modification
  $ 0 arrow.r cal(T) ⊗_(bb(Z)_p) cal(O) arrow.r cal(E) arrow.r i_(*) cal(L) arrow.r 0 \, $
  where $cal(T) = T_p \( cal(X) \)$ is the actual integral Tate local system of the universal $p$-divisible group
    $cal(X)$, of rank three, and $cal(L)$ is a line at the untilt divisor, and $cal(E)$ is fiberwise $V_3$.
    The relative basic-stratum frame torsors #cite(label("FarguesScholze")) Theorems III.2.4 and III.4.5 identify
    the two quotient presentations of this moduli problem. Honda endomorphisms are already defined over
    $bb(F)_(p^3)$; their canonical action and the basic-stratum equivalence descend from the geometric residue
    field as in 11. After the height-component normalization on the Lubin–Tate side, this gives
  $ \[ upright("LT")_(breve(K))^diamond.stroked.small \/ overline(G) \]
    tilde.eq \[ Omega_(bb(Q)_p)^(2 \, diamond.stroked.small) \/ "GL"_3 \( bb(Z)_p \) \] . $
  Pulling back the two atlases gives a common space with commuting pro-étale torsor actions.
    Their Čech nerves therefore compute the same integral condensed cohomology object;
    this is the actual descent argument behind #cite(label("BSSW")) Theorem 3.9.1 and (3.9.3).
    Taking invariants of the comparison cones remains harmless:
    they are nonnegative, so each diagonal of the group-cohomology spectral sequence contains finitely many
    bounded-torsion rows. After inverting $p$ we obtain
  $ H^(*) \( overline(G) \, overline(A) \) \[ 1 \/ p \] ⊗ bb(Q)_p \[ epsilon.alt \] tilde.eq
    H^(*) \( "GL"_3 \( bb(Z)_p \) \, bb(Q)_p \) ⊗ bb(Q)_p \[ epsilon.alt \] . $
  The extended residue-field action is retained here. Witt Artin–Schreier gives the continuous unramified
    calculation over $overline(W)$ in #cite(label("BSSW")) Lemma 3.8.5(1);
    its consequence for the full extended stabilizer is #cite(label("BSSW")) Lemma 3.8.5(2).
    Here $P_3$ fixes $overline(W)$ and the residue-field group acts by Witt Frobenius,
    exactly as in the chosen Honda semilinear action. The coefficient conventions also agree:
    for every profinite $Q$, cochains on $Q times overline(G)^a$ with values in the discrete
    $W_ell \( overline(bb(F))_p \)$ have finite image. Lifting those finitely many values makes cochain reduction
    surjective. Their derived inverse limit is therefore the continuous $overline(W)$ cochain complex.
    Every continuous cochain on this compact domain with values in $overline(W) \[ 1 \/ p \]$ has bounded image,
    so inverting $p$ gives the rational cochains used in part (2).
  To pass to the prescribed finite field $k$, put $Delta_k = "Gal" \( overline(bb(F))_p \/ k \)$.
    Its action fixes $u_1 \, u_2$ and acts by coefficient Frobenius.
    Each quotient $overline(A) \/ \( p \, u_1 \, u_2 \)^a$ is a finite direct sum of truncated Witt coefficient
    modules. Witt Artin–Schreier therefore identifies its $Delta_k$-invariants with
    $W \( k \) \[ \[ u_1 \, u_2 \] \] \/ \( p \, u_1 \, u_2 \)^a$ and makes its positive $Delta_k$-cohomology
    vanish. The coefficient reductions, including cochains with profinite parameters,
    are surjective by finite-value lifting. Taking the derived inverse limit gives
  $ R Gamma \( Delta_k \, overline(A) \) tilde.eq W \( k \) \[ \[ u_1 \, u_2 \] \] \, $
  equivariantly for $P_3$, since $k$ contains the Honda endomorphism field.
    Hochschild–Serre now identifies the algebraically closed residue-field calculation with the finite-field one.
    The trace-one contraction of 7 supplies the finite semilinear descent used by 50.
  #emph[5. Constants and rational homotopy.] The additive splitting in #cite(label("BSSW")) Proposition 2.5.1 has
    a direct construction. Compose each power operation with the $K \( 3 \)$-local transfer and write the
    resulting operations as $beta_m$. Transfer transitivity and the power-operation addition formula give
    $beta_m \( a + b \) = sum_(i + j = m) beta_i \( a \) beta_j \( b \)$.
    Thus $a mapsto sum_m beta_m \( a \) t^m$, followed by reduction to $overline(bb(F))_p$ and projection from big
    to $p$-typical Witt vectors, is an equivariant additive map $gamma : overline(A) arrow.r overline(W)$.
    For continuity, write the localized unit as the filtered colimit of its compact Moore stages $M_k$.
    The spectrum $L_(K \( 3 \)) Sigma_(+)^oo B Sigma_m$ is dualizable for the finite group $Sigma_m$
    #cite(label("HS99")) Corollary 8.7; its tensor product with the compact object $M_k$ is therefore compact.
    Compactness makes the map from $M_k ⊗ L_(K \( 3 \)) Sigma_(+)^oo B
    Sigma_m$ factor through some finite tensor stage $\( M_j^(⊗ m) \)_(h Sigma_m)$;
    hence each power operation is continuous for the Moore topology #cite(label("BSSW")) Lemma 2.5.4.
    Transfers are maps of $K \( 3 \)$-local spectra and are continuous for the same topology #cite(label("HS99"))
    Proposition 11.1(b). For $overline(A) = pi_0 overline(E)$, where $overline(E)$ is the Morava theory used here,
    the Moore topology is the $frak(m) = \( p \, u_1 \, u_2 \)$-adic topology by the following local check.
    Choose the unit-compatible generalized Moore spectra $bb(S) \/ J_j$ of #cite(label("HS99")) Proposition 4.22.
    Their $K \( 3 \)$-local duals $M_j = D_(K \( 3 \)) L_(K \( 3 \)) \( bb(S) \/ J_j \)$ are compact stages for
    the unit by #cite(label("HS99")) Corollary 7.11 and Theorem 8.5.
    Duality carries restriction along the dual unit exactly to the map induced by $bb(S) arrow.r bb(S) \/ J_j$.
    The latter spectrum is finite, so $overline(E) ⊗ \( bb(S) \/ J_j \)$ remains $K \( 3 \)$-local.
    The unit-normalized Landweber formula #cite(label("HoveyStrickland")) Introduction and Example 0.1(d) and the
    Moore coefficient calculation #cite(label("HS99")) Definition 4.12 identify the restriction as
  $ overline(A) arrow.r \[ M_j \, overline(E) \] tilde.equiv pi_0 \( overline(E) ⊗ \( bb(S) \/ J_j \) \)
    tilde.equiv overline(A) \/ overline(J)_j . $
  Here $overline(J)_j$ is the image of the Moore ideal after removing invertible periodicity factors.
    The normalized images of $p \, v_1 \, v_2$ form a regular sequence of length three in the three-dimensional
    regular local ring $overline(A)$. Their ideal is therefore $frak(m)$-primary.
    The pure-power ideals $overline(J)_j$, whose exponents tend to infinity,
    are cofinal with the powers of $frak(m)$, which proves the claimed equality of topologies from the restriction
    kernels. Thus each composite $beta_m : overline(A) arrow.r overline(A)$ is $frak(m)$-adically continuous.
    The coefficientwise Witt-vector construction is therefore continuous.
    Its restriction $f$ to $overline(W)$ is the identity modulo $p$;
    continuity and additivity make it $bb(Z)_p$-linear. Write $f = upright("id") +
    p h$ with a continuous $bb(Z)_p$-linear endomorphism $h$.
    The convergent series $sum_(n gt.eq 0) \( - p h \)^n$ is its inverse.
    Hence $f^(- 1) gamma$ is an equivariant retraction and $overline(A) = overline(W) xor overline(A)^c$ additively.
  The compact comparison used to compute the constants has the following integral hypotheses.
    Choose a deep normal uniform open in $P_3$ and in $"GL"_3 \( bb(Z)_p \)$.
    At $p gt.eq 5$ its lower-$p$-series valuation is saturated and equi-$p$-valued with denominator $e =
    1$ and generators in degree one. The trivial finite free module $bb(Z)_p$ satisfies the hypotheses of
    #cite(label("HuberKingsNaumann")) Theorem 3.3.3; its continuous comparison is cup compatible.
    The coefficient and restriction naturality in #cite(label("HuberKingsNaumann")) Theorem 3.1.1(1)–(3)
    identifies its rationalization with Lazard’s comparison #cite(label("Lazard")) V.2.4.9–V.2.4.10 and makes it
    equivariant for conjugation. Rational Hochschild–Serre then takes invariants under the finite quotient,
    whose higher cohomology vanishes by averaging. The full exterior calculation for the compact matrix and
    stabilizer groups, together with the Lie-algebra calculation and trivial adjoint action,
    is given by #cite(label("BSSW")) Proposition 3.8.1 and Lemma 3.8.2.
    At height three its generator degrees are $1 \, 3 \, 5$. The unramified and finite semilinear descent from
    Step 4, with #cite(label("BSSW")) Lemma 3.8.5(2) for the full extended stabilizer, therefore identifies both
  $ H^(*) \( overline(G) \, overline(W) \) \[ 1 \/ p \] quad upright("and") quad
    H^(*) \( "GL"_3 \( bb(Z)_p \) \, bb(Q)_p \) $
  with that exterior algebra over $bb(Q)_p$.
  The displayed tower comparison makes the cohomology of $overline(A)$ finite-dimensional in every degree.
    Its additive decomposition into constants and $overline(A)^c$ is a decomposition of continuous coefficient
    complexes. If $d_i = dim_(bb(Q)_p) H^i \( overline(G) \, overline(A)^c \) \[ 1 \/ p \]$,
    comparison with the identical constant algebra, including the common factor $bb(Q)_p \[ epsilon.alt \]$,
    gives $d_i + d_(i - 1) = 0$ (with $d_(- 1) = 0$). Thus every $d_i$ is zero.
    The constants inclusion is a ring map, so its resulting cohomology isomorphism is multiplicative.
    This proves (12.1).
  Apply the local relative Morava descent of 50 to $T$. The central procyclic subgroup generated by $1 +
    p$ acts on internal degree $2 t$ through $\( 1 + p \)^(- t)$.
    Its continuous two-term resolution has differential $\( 1 + p \)^(- t) - 1$ on that coefficient module.
    For $t eq.not 0$ this scalar is nonzero in $bb(Q)_p$, so the rationalized two-term complex is acyclic;
    Hochschild–Serre makes every nonzero internal row vanish.
    The locally proved relative spectral sequence is strongly convergent with finite cohomological amplitude.
    Exact rationalization preserves its bounded convergence. Only the internal-degree-zero row remains,
    with one filtration degree in each total degree. Multiplicativity therefore yields
  $ pi_(*) L_0 T = Lambda_(bb(Q)_p) \( alpha_1 \, alpha_3 \, alpha_5 \) \, wide \| alpha_i \| = - i . $
  This establishes the rational boundary used in 82; the image of its chosen primitive is determined by the
    separate map calculation in 10. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
