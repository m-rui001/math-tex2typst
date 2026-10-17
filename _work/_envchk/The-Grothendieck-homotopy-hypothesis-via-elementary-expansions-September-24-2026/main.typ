#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The Grothendieck homotopy hypothesis via elementary expansions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Grothendieck’s homotopy hypothesis asks whether weak globular infinity-groupoids describe the homotopy theory of spaces. In #emph[Pursuing Stacks], the operations on paths and higher homotopies are specified by freely adjoining coherence operations to globular pasting diagrams #cite(label("Grothendieck1983")) Sections 9 and 12–13. A #emph[coherator] records these choices. Maltsiniotis gave a precise formulation in terms of coherators and their models, together with realization and fundamental-infinity-groupoid functors #cite(label("Maltsiniotis2007")) #cite(label("Maltsiniotis2010")). The resulting categories depend on the chosen coherator; the hypothesis asserts that their homotopy theory recovers that of spaces. We establish it for every coherator in the Ara–Henry convention specified below.

The choice of algebraic model is substantive. Simplicial sets already model spaces through the classical realization–singular-complex Quillen equivalence #cite(label("Hovey1999")) Theorem 3.6.7. For strict globular infinity-groupoids, however, the simply connected homotopy types represented under a realization preserving homotopy groups are precisely products of Eilenberg–Mac Lane spaces #cite(label("AraStrict2013")) Theorem 5.4. The passage from strict identities to weak coherence is therefore substantive. Here weak equivalences are defined inside the chosen globular algebraic category, using components and based homotopy groups.

Henry isolated a concrete obstruction to constructing their canonical semi-model structure #cite(label("Henry2016")) Conjecture 5.3.3. Suppose that $X$ is built by attaching globular cells. Select an $n$-cell $a$ of $X$, adjoin a new parallel $n$-cell $a'$, and adjoin an $\( n + 1 \)$-cell from $a$ to $a'$. The conjecture asserts that this free extension is a weak equivalence. Although the extension has an elementary retraction, its free algebraic construction also creates composites and higher coherence cells. Controlling the homotopy classes of all those cells is the issue.

We use Grothendieck coherators in the convention of Ara #cite(label("Ara2013")) Sections 2.3 and 2.9–2.11, fixed by Henry in #cite(label("Henry2016")) Section 5.3; the precise definition appears in Section 2. Thus generating fillers of output dimension $j$ have pasting-scheme arity of dimension at most $j$. Write $D_j$ for the free model on a $j$-globe and $partial D_j$ for its boundary, with $partial D_0 = diameter$. A model is #emph[cellular] if it is obtained from the initial model by a possibly transfinite sequence of boundary attachments. Weak equivalences induce a bijection on components and isomorphisms on all based homotopy groups.

#prodef([Theorem 1.1.])[
  #emph[Fix any Grothendieck coherator $cal(C)$. Let $X$ be a cellular $cal(C)$-infinity-groupoid, let $n gt.eq 0$, and let $a : D_n arrow.r X$ be any cell. In the pushout square 
$ Z Q T 2 T T I K Z 0 $

 where $s_n$ is the source inclusion, the map $i : X arrow.r X^(+)$ is a weak equivalence.]
] <thm:main>

The pushout is taken in models of the fixed theory $cal(C)$. The selected cell $a$ can be any composite or coherence cell. For $n = 0$, the extension adjoins an object and an arrow from the selected object to it. In particular, Theorem 1 resolves Henry’s pushout conjecture affirmatively. Henry already showed how its finitely cellular case extends to transfinite cellular objects and their cofibrant retracts #cite(label("Henry2016")) Lemma 5.3.4; the proof here treats arbitrary cellular objects directly. The canonical semi-model structure and its equivalence with the homotopy theory of spaces follow in Section 5.

The algebraic and homotopical sides of this question developed together. Berger’s globular theories organize operations by tree-shaped pasting arities #cite(label("Berger2002")) Definition 1.5. Ara constructed the homotopy-group calculus and fixed-boundary tests for weak equivalences used here #cite(label("Ara2013")) Section 4. Bourke described cellular globular theories through iterated algebraic injectivity and proved faithfulness of their free stages #cite(label("Bourke2020")) Theorems 3.12 and 5.2. These results make the algebraic models and their weak equivalences precise; the remaining task is to show that elementary expansions have the required homotopical behavior.

Henry identified the elementary pushout assertion as sufficient both for the canonical semi-model structure and for the comparison with spaces #cite(label("Henry2016")) Theorem 5.3.5 and Corollary 5.3.13. One route to this assertion is a functorial path construction. Bourke’s endomorphism-theory argument puts weak groupoid structures on iterated path objects in identity type categories #cite(label("Bourke2016")) Theorem 5.1. Within Grothendieck groupoids, Lanari constructed a globular candidate with compositions, identities and inverses #cite(label("Lanari2020")) Definitions 5.2 and 6.1, Proposition 6.2, and Theorem 6.5. His construction leaves the extension to compatible interpretations of all higher operations open. The partial paths used here are adapted to one expansion index at a time: the already established higher-index expansions make their representing objects contractible, which then permits every operation of the fixed coherator to be interpreted in its original free order.

In dimension three, Lanari obtained the canonical semi-model structure for Grothendieck groupoids of a suitable type #cite(label("Lanari2018")) Theorem 4.10, and Henry and Lanari proved the corresponding homotopy-hypothesis comparison #cite(label("HenryLanari2023")). Their study of coskeletal and truncated globular models also supplies context for the cutoffs used below #cite(label("HenryLanari2023")) Section 2. Taylor’s later construction of algebraic coherators and Grothendieck realizations retains a generalized pushout conjecture as a hypothesis #cite(label("Taylor2026")) Conjecture 5.7 and Theorem 5.8. Theorem 1 proves Henry’s assertion for an arbitrary fixed coherator in our convention. Its consequence in Section 5 is a Quillen equivalence with spaces, and hence independence of the resulting homotopy theory from that choice of coherator.

=== The proof <the-proof>

Section 2 first expresses weak equivalence as a lifting test with a prescribed boundary. The proof can then work with individual cells and their joining homotopies throughout. The next step, in Section 3, is a reflection to models in which every boundary above dimension $q$ has a unique filler. It preserves all cells through $q$. We then hold $q$ fixed and descend in the index $n$ of the elementary expansion. The top case is immediate from the retraction and the unique higher fillers.

At the induction step, expansions in dimensions greater than $n$ are already known to be weak equivalences. A factorization argument then gives Lemma 14: every weak equivalence built by boundary attachments strictly above $n$ splits and remains a weak equivalence after the cellular pushouts needed in the proof.

The main geometric input concerns finite trees in a globular pasting diagram. Such a tree can be compared with a string on the same vertices. The composite comparison is homotopic to the identity on its generating edges. To pass from these individual homotopies to a statement about all coherences, we duplicate the top generators using only expansions already covered by the induction. Freeness and two-out-of-three then prove contractibility of the whole tree model (Proposition 15).

In Section 4, these tree models provide partial cylinders: an $n$-cell moves along an $\( n + 1 \)$-cell, while its lower boundary stays fixed. Higher cylinders fit these movements together along shared faces. A skeletal gluing formula proves that the objects representing such compatible tuples of cylinders are contractible. Interpreting the freely adjoined operations in their chosen stage order then makes the associated path construction a functor on models of $cal(C)$. Its two endpoint maps record the ends of each cylinder. Individually they lift all boundary inclusions; together they lift the current source inclusion (Proposition 19). The endpoint maps produce self-maps of the source and target that are weak equivalences; a retract argument then proves that the expansion itself is a weak equivalence. Each fixed-boundary test uses finitely many dimensions, so the end of Section 4 recovers both the tested disk and its homotopy witness before the cutoff. Section 5 derives the canonical left semi-model structure and applies Henry’s comparison with spaces.

The main construction uses three orders: at fixed $q$, descending induction on the expansion index $n$; within each step, increasing cylinder dimension $j$; and, for operation interpretations, the chosen free stage order of $cal(C)$. Its reusable ingredients are the reflection preserving lower cells, the promotion of generator homotopies by higher-dimensional expansions, and the use of partial cylinders tailored to a single expansion index.

== 2 Globular models and the weak-equivalence test <sec:preliminaries>

We first fix the algebraic conventions and prove the elementary homotopy calculus needed below. No model structure is used in this section.

=== 2.1 The fixed coherator and its free models <the-fixed-coherator-and-its-free-models>

A #emph[globular set] consists of sets of cells in dimensions $0 \, 1 \, dots.h$, with source and target maps satisfying the globular identities: the source and target of a positive-dimensional cell have the same lower source and the same lower target. Two cells of the same dimension are #emph[parallel] if their immediate sources and targets agree; any two $0$-cells are parallel. For a cell of dimension greater than $i$, write $s_i \, t_i$ for its $i$-dimensional source and target. The representable globular set $d_j$ is the $j$-globe, and $partial d_j$ is its boundary; $partial d_0 = diameter$.

A #emph[globular sum shape], or #emph[pasting scheme], is a globe or a finite iterated amalgamation

$ S = d_(h_1) product.co_(d_(b_1)) d_(h_2) product.co_(d_(b_2)) dots.h.c product.co_(d_(b_(l - 1))) d_(h_l) \, #h(2em) b_a < h_a \, h_(a + 1) \, quad "(2.1)" $ <eq:prelim-shape>

where each gluing identifies a target face with a source face. Its height $dim \( S \)$ is its largest cell dimension. A tuple of shape $S$ in a globular set $X$ means a globular map $S arrow.r X$. Let $Theta_0$ denote the category of these shapes and their globular maps. Its designated sums are the amalgamations in Equation (2.1). The language of globular theories and their pasting arities goes back to Berger #cite(label("Berger2002")) Definition 1.5.

#prodef([Definition 2.1.])[
  (The coherator convention).  A #emph[globular theory] is a category under $Theta_0$, with the same objects and preserving the designated globular sums. A #emph[Grothendieck coherator] $cal(C)$ is such a theory with the following two properties.
  + It admits a defining tower $cal(C)_0 = Theta_0 arrow.r cal(C)_1 arrow.r dots.h.c$ with $cal(C) tilde.equiv "colim"_(r gt.eq 0) cal(C)_r$. At stage $r + 1$, one freely adjoins a filler for each pair in a chosen set of parallel pairs $d_(j - 1) arrows.rr S$ in $cal(C)_r$ satisfying $j > 0$ and $dim \( S \) lt.eq j$. The new arrow $d_j arrow.r S$ has that pair as its source and target.
  + Every parallel pair $d_(j - 1) arrows.rr S$ with $dim \( S \) lt.eq j$ has a filler $d_j arrow.r S$.
  Here freeness includes globular completion: the designated sums continue to be sums after the new arrows have been adjoined.
] <def:coherator>

This is the admissibility convention of Ara #cite(label("Ara2013")) Sections 2.3 and 2.9–2.11, fixed in #cite(label("Henry2016")) Section 5.3. The height bound concerns the #emph[generating] fillers; a composite operation of output dimension $j$ can have an arity of height greater than $j$. We retain the chosen free cellular order throughout the proof and never replace it by an order on output dimensions. The tower index records the stage at which an operation is adjoined, independently of its output dimension. This sequential presentation of the theory is separate from the possibly transfinite cellular presentations of its models below.

Fix $cal(C)$ and put $cal(A) = "Mod" \( cal(C) \)$. Its objects are presheaves $cal(C)^(upright("op")) arrow.r upright(bold(S e t))$ taking the designated sums to limits. Equivalently, a model is a globular set with an interpretation of each freely adjoined operation on its tuple set, subject to its two specified face equations. There are no additional equations equating independently chosen fillers. One obtains this description successively from the universal property of each free stage: an interpretation of a new arrow is exactly a function on tuples with the prescribed faces, and globular completion interprets sums as tuple sets.

To make this universal-property argument explicit, let $G$ be a globular set and let $G \( S \)$ be its set of tuples of shape $S$. Form a category $cal(E)_G$ with objects labelled by the shapes and

$ "Hom"_(cal(E)_G) \( S \, T \) = "Hom"_(upright(bold(S e t))) \( G \( T \) \, G \( S \) \) . $

Composition is composition of functions in the indicated opposite direction. Restriction of tuples defines $Theta_0 arrow.r cal(E)_G$. The designated globular sums are sums in $cal(E)_G$: their tuple sets are the corresponding finite limits, and maps from any fixed set preserve those limits. An interpretation at stage $r$ is therefore a functor $cal(C)_r arrow.r cal(E)_G$ under $Theta_0$. A function interpreting a new filler, with its two prescribed faces, extends this functor by the free-adjunction and globular-completion universal properties #cite(label("Ara2013")) Section 2.9. Passage up the tower gives the model. Equations among composites follow from functoriality; no independent filler equation is being assumed.

The forgetful functor to globular sets has a left adjoint $F$. Set

$ D_j = F \( d_j \) \, #h(2em) partial D_j = F \( partial d_j \) \, #h(2em) I_j : partial D_j arrow.r D_j \, #h(2em) J_j : D_j arrow.r^s D_(j + 1) . $

Put $I = { I_j divides j gt.eq 0 }$ and $J = { J_j divides j gt.eq 0 }$. Thus maps $D_j arrow.r X$ are $j$-cells, and maps $partial D_j arrow.r X$ are specified boundaries. The representable presheaf $cal(C) \( - \, S \)$ is a model, since the designated diagrams are sums in $cal(C)$. Yoneda identifies its maps into $X$ with $X \( S \)$, the set of tuples of shape $S$. Consequently

$ F \( S \) = cal(C) \( - \, S \) \, #h(2em) "Hom"_(cal(A)) \( D_j \, F \( S \) \) = cal(C) \( d_j \, S \) . quad "(2.2)" $ <eq:prelim-free-shape>

In particular, cells of $F \( S \)$ are precisely operations on the arity $S$.

An #emph[$I$-cellular extension] is a transfinite composite of pushouts of coproducts of the $I_j$; an object is #emph[cellular] if its map from the initial model is such an extension. “Finitely cellular” means finitely many attachments, including $I_0 : diameter arrow.r D_0$.#footnote[We include the initial vertex attachment. Although Definition 5.3.2 of #cite(label("Henry2016")) prints $n > 0$, Section 5.3.1 specifies the empty boundary $S_(- 1)$, and Proposition 5.3.7 starts with finite globular sets and the marked object $D_0$. Our indexing makes that convention explicit.] For a globular set $K$, adjoining its cells in increasing dimension is a globular boundary-cell presentation; applying $F$ makes $F \( K \)$ cellular. This does not assert that its underlying globular set has only the cells of $K$.

The algebraic constructions below are instances of finite-limit sketch theory; see #cite(label("BarrWells1985")) Section 4.4, Theorems 1, 2 and 4. We recall the specific finiteness facts needed here. Models of this small finitary essentially algebraic theory form a locally presentable category, hence have the required limits and colimits. Concretely, free constructions use finite terms in the specified operations with the prescribed matching and face equations. Filtered colimits are computed on the sets of cells: finite tuples and their finite matching equations commute with filtered colimits of sets. It follows from adjunction that $F \( K \)$ is finitely presentable for every finite globular set $K$, in particular for the disks and their boundaries. Thus the small-object argument of Quillen #cite(label("Quillen1967")), in the cellular form of #cite(label("Hovey1999")) Theorem 2.1.14 and Corollary 2.1.15, is available for any subfamily of $I$ or $J$: adjoin cells for all lifting problems, repeat, and take the sequential colimit. Each lifting problem into that colimit already occurs at a finite stage. These are algebraic constructions and make no homotopical assertion.

=== 2.2 Homotopies, division, and change of boundary <homotopies-division-and-change-of-boundary>

Contractibility of the theory supplies operations of the following forms. There are units $e \( a \) : a arrow.r a$; write $e_p^q \( a \)$ for their iteration from dimension $p$ to $q$, and set $e_p^p \( a \) = a$. For $r$-cells $alpha \, gamma$ and $i < r$ with $s_i gamma = t_i alpha$, there are compositions $gamma *_i alpha$ and $i$-inverses $w_i \( alpha \)$. Their exact face equations at level $i$ are

$ s_i \( gamma *_i alpha \) = s_i alpha \, quad t_i \( gamma *_i alpha \) = t_i gamma \, #h(2em) s_i w_i \( alpha \) = t_i alpha \, quad t_i w_i \( alpha \) = s_i alpha . $

For $i < k < r$, their $k$-faces are obtained by applying the same operations to the corresponding $k$-faces. To construct them, start in dimension $i + 1$ with these prescribed faces and then proceed in increasing dimension, prescribing the already constructed operations on each face. The arities are $d_r product.co_(d_i) d_r$ and $d_r$, of height $r$, so each required filler is admissible. Units are fillers of the pair consisting twice of the same operation. Fix all these choices once in $cal(C)$.

Write $alpha tilde.op beta$ when there is one $\( r + 1 \)$-cell from an $r$-cell $alpha$ to a parallel $r$-cell $beta$. Units, inverses and top-level compositions make this an equivalence relation, also for $r = 0$. Put

$ pi_0 \( X \) = X_0 \/ tilde.op \, #h(2em) pi_r \( X \; u \, v \) = { alpha : u arrow.r v } \/ tilde.op quad \( r gt.eq 1 \) \, $

where $u \, v$ are parallel $\( r - 1 \)$-cells. Top-level composition makes these sets the hom sets of a groupoid on the $\( r - 1 \)$-cells having a fixed lower boundary. Indeed associativity, unit and inverse expressions are parallel on the appropriate string of globes or on a single globe; an admissible $\( r + 1 \)$-filler makes their classes equal. Composition at any level $i$ respects homotopy: compose the given homotopy with the unit on the fixed factor in dimension $r + 1$.

The expansion argument will require a cell with an arbitrary prescribed boundary, whereas based homotopy groups use iterated unit boundaries. Division and change of boundary connect these two kinds of tests. The point requiring care is that multiplication below the top level can alter the entire boundary. The following is the division calculus of #cite(label("Ara2013")) Lemma 4.12; we give its boundary correction explicitly.

#prodef([Lemma 2.2.])[
  (Division with specified boundaries).  #emph[Fix an $r$-cell $gamma$ and $i < r$. Left multiplication $alpha mapsto gamma *_i alpha$ induces a bijection from the homotopy set at any prescribed input boundary composable with $gamma$ to the homotopy set at its induced output boundary. The same holds for right multiplication. Empty homotopy sets are allowed.]
] <lem:prelim-division>

#proof[
  We describe universal expressions before evaluating them in a model. For each $k > i$, let $\( g \, a \)$ be the generic pair of $i$-composable $k$-cells on $d_k product.co_(d_i) d_k$. Initially put
  $ U_(i + 1)^k \( g \, a \) = w_i \( g \) *_i \( g *_i a \) . $
  We inductively construct $U_h^k$ for $k gt.eq h > i$ with the following two properties: its faces below $h$ equal those of $a$, and its $l$-faces for $h lt.eq l < k$ are $U_h^l$ evaluated on the corresponding $l$-faces of $\( g \, a \)$. These statements hold for $h = i + 1$ by the exact face equations just given. In particular $U_h^h \( g \, a \)$ and $a$ are parallel #emph[as operations on the generic pair of $h$-globes]. Choose admissible operations
  $ c_h \( g \, a \) : a arrow.r U_h^h \( g \, a \) \, #h(2em) d_h \( g \, a \) : U_h^h \( g \, a \) arrow.r a . $
  They have output dimension $h + 1$ on an arity of height $h$. For $k > h$, define
  $ U_(h + 1)^k \( g \, a \) =  & e_(h + 1)^k d_h \( t_h g \, t_h a \) med *_h #scale(x: 120%, y: 120%)[\(] U_h^k \( g \, a \) med *_h e_(h + 1)^k c_h \( s_h g \, s_h a \) #scale(x: 120%, y: 120%)[\)] . quad "(2.3)" $ <eq:prelim-normalization>
  The two compositions are defined because the old $h$-faces are $U_h^h$ on the indicated face inputs. Their new $h$-faces are exactly $s_h a \, t_h a$, and lower faces retain their required values. Faces above $h$ obey the same formula in their own dimension, by the composition and unit face equations. This proves both inductive properties. Notice that parallelism for $c_h \, d_h$ is an identity in their arity, and does not result from a special equality in the model under consideration.
  Now prescribe the input boundary of an $r$-cell $alpha$, without assuming that such a cell exists, and let $beta$ have the induced boundary of $gamma *_i alpha$. Begin with $z = w_i \( gamma \) *_i beta$. For $h = i + 1 \, dots.h \, r - 1$, replace $z$ by the right side of Equation (2.3), with $k = r$, $U_h^r \( g \, a \)$ replaced by $z$, and the correction factors evaluated at $\( s_h gamma \, s_h alpha \)$ and $\( t_h gamma \, t_h alpha \)$. These faces of $alpha$ belong to the #emph[prescribed boundary]. At every stage the proper faces of $z$ obey the universal formulas already proved, because $beta$ has the prescribed output boundary. The construction therefore finishes with an $r$-cell $K_gamma \( beta \)$ having exactly the desired input boundary.
  All correction factors depend only on $gamma$ and that boundary. Write $L_gamma$ for left multiplication by $gamma$ on homotopy classes. Thus $K_gamma$ is a composite of multiplication maps by fixed cells and induces a map of homotopy sets. On an actual input $beta = gamma *_i alpha$, it equals $U_r^r \( gamma \, alpha \)$. The latter is parallel to $alpha$ on the generic pair of $r$-globes, so an admissible $\( r + 1 \)$-filler shows that $K_gamma L_gamma = upright("id")$ on classes.
  The same construction with left and right interchanged gives a left inverse for every right multiplication. Consequently all left and right multiplication maps are injective. Each factor of $K_gamma$ is one of these now-known injective maps, so $K_gamma$ is injective as well. Applying this injectivity to $K_gamma L_gamma K_gamma = K_gamma$ gives $L_gamma K_gamma = upright("id")$. This proves bijectivity without a nonemptiness assumption on the input set. ◻
]

For a vertex $x$, the group

$ pi_r \( X \, x \) = pi_r #scale(x: 120%, y: 120%)[\(] X \; e_0^(r - 1) \( x \) \, e_0^(r - 1) \( x \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r gt.eq 1 \, $

uses top-level composition. These are the globular homotopy groups in Henry’s statement. A model map induces group homomorphisms, since it preserves the chosen operations.

#prodef([Lemma 2.3.])[
  (Change of boundary and vertex).  #emph[The endomorphism homotopy set at any $\( r - 1 \)$-cell $u$ is naturally in bijection with the underlying set of $pi_r \( X \, x \)$, where $x$ is either its source or its target vertex. An arrow $x arrow.r y$ gives bijections between the underlying sets of $pi_r \( X \, x \)$ and $pi_r \( X \, y \)$, natural in model maps. If $pi_r \( X \; u \, v \)$ is nonempty, a chosen cell $u arrow.r v$ gives a bijection from the endomorphism set at $u$ to this homotopy set.]
] <lem:prelim-boundary-change>

#proof[
  The last assertion is composition in the groupoid above. When $r = 1$, the first assertion is the definition and change of vertex is conjugation in the fundamental groupoid. For $r gt.eq 2$, put $x = s_0 u$, $a = e_0^(r - 1) \( x \)$ and $w = u *_0 a$, and abbreviate $e \( u \)$ to $1_u$. Lemma 3 gives a span of bijections
  $ pi_r \( X \; u \, u \) arrow.r^(med \[ alpha \] mapsto \[ alpha *_0 1_a \] med) pi_r \( X \; w \, w \) arrow.l^(med \[ beta \] mapsto \[ 1_u *_0 beta \] med) pi_r \( X \; a \, a \) . $
  For the target vertex $y = t_0 u$, use $b = e_0^(r - 1) \( y \)$ and $w' = b *_0 u$ instead: the maps are $\[ alpha \] mapsto \[ 1_b *_0 alpha \]$ and $\[ beta \] mapsto \[ beta *_0 1_u \]$. Finally, for an arrow $p : x arrow.r y$, apply these two comparisons to $u = e_1^(r - 1) \( p \)$. Naturality follows from the fixed choices of operations; inverses of the resulting bijections are natural too. Only set bijections are needed here. ◻
]

=== 2.3 The exact-boundary criterion <the-exact-boundary-criterion>

Let $cal(W)$ consist of the maps inducing a bijection on $pi_0$ and isomorphisms on all $pi_r$ at all source vertices. The next formulation is #cite(label("Ara2013")) Theorem 4.18, with the change-of-boundary part supplied by #cite(label("Ara2013")) Theorem 4.13 and Corollaries 4.14–4.15.

#prodef([Proposition 2.4.])[
  (Weak-equivalence test).  #emph[For a model map $f : X arrow.r Y$, the following are equivalent.]
  + #emph[$f in cal(W)$.]
  + #emph[It induces a bijection on $pi_0$ and a bijection 
$ pi_r \( X \; u \, v \) arrow.r pi_r \( Y \; f u \, f v \) $

 for every $r gt.eq 1$ and every parallel pair $u \, v$ in $X$.]
  + #emph[For every $r gt.eq 0$, every specified boundary $b : partial D_r arrow.r X$, and every $r$-cell $y$ of $Y$ with boundary $f b$, there are an $r$-cell $x$ with boundary #emph[exactly] $b$ and an $\( r + 1 \)$-cell $f x arrow.r y$ in $Y$.]
  #emph[In particular, a weak equivalence reflects homotopy between parallel cells, including equality of components for vertices.]
] <prop:weak-test>

#proof[
  Suppose (1) holds. Lemma 4 shows that $f$ is bijective on every endomorphism homotopy set. We prove (2) by induction on $r$. First address existence of a class: if a $1$-cell joins $f u$ to $f v$, injectivity on $pi_0$ gives a cell $u arrow.r v$. If $r > 1$ and a target $r$-cell joins $f u$ to $f v$, then $f u \, f v$ represent the same class in the appropriate $\( r - 1 \)$-dimensional homotopy set. Injectivity already proved in dimension $r - 1$ gives a source $r$-cell $u arrow.r v$. Thus a nonempty target homotopy set has a nonempty source homotopy set. Choose a source joining cell; composition with it and its image identifies the map on these homotopy sets with the map on endomorphism sets. The latter is bijective. If the target set is empty, the source is empty as well, so the assertion also holds in that case.
  Condition (2) immediately gives (3), using surjectivity on $pi_0$ when $r = 0$. Conversely (3) gives surjectivity on $pi_0$ and on every homotopy set at a source boundary. If parallel source $r$-cells have homotopic images, apply (3) in dimension $r + 1$ to their exact boundary and the target joining cell. This produces a source joining cell. For $r = 0$ it proves injectivity on $pi_0$, and for $r gt.eq 1$ it proves injectivity on the indicated homotopy sets. Hence (2) follows, and its based instances give (1). ◻
]

#prodef([Lemma 2.5.])[
  (Closure properties).  #emph[The class $cal(W)$ has two-out-of-three, is closed under retracts, and is closed under filtered colimits of arrows. Consequently a transfinite composite of weak equivalences is a weak equivalence.]
] <lem:weak-closure>

#proof[
  For two-out-of-three, use the induced maps of components and based groups. In the case where $f$ and $g f$ are weak equivalences, a vertex of the intermediate model is joined to some $f \( x \)$, by surjectivity of $pi_0 \( f \)$. Lemma 4 transfers bijectivity of the homomorphism induced by $g$ at $f \( x \)$ to that vertex. The other two cases follow directly by cancellation of bijections. Retract closure follows from Proposition 5(3), even for a retract of underlying globular arrows: apply its disk and homotopy witnesses in the larger arrow and retract them.
  For a filtered colimit of weak equivalences, the prescribed boundary, target disk, and their finitely many matching equations in Proposition 5(3) all occur together at some stage. Apply the test there and map its two witnesses to the colimit. Finally, transfinite induction handles a transfinite composite: use composition at successor stages and, at a limit, apply filtered-colimit closure to the arrows from the constant initial stage to the preceding stages. No injectivity of the transition maps is required. ◻
]

#prodef([Definition 2.6.])[
  A model $X$ is #emph[contractible] if $X arrow.r 1$ belongs to $cal(W)$. Equivalently, $X$ is nonempty and every parallel pair of cells has a joining cell.
] <def:prelim-contractible>

The equivalence in this definition is Proposition 5(3) applied to $X arrow.r 1$: the condition in dimension zero is nonemptiness, and in positive dimension it is exact boundary filling. Equivalently, $X arrow.r 1$ lifts against every $I_j$. Thus a map from any cellular domain extends across an $I$-cellular extension whenever its target is contractible.

For a set of maps $K$, write $K upright("-") upright("inj")$ for the maps with the right lifting property against every member of $K$.

#prodef([Lemma 2.7.])[
  (Lifting tests).  #emph[If $f in cal(W)$ has the right lifting property against $J_j$, it has the right lifting property against $I_j$. Moreover 
$ I upright("-") upright("inj") = cal(W) ∩ J upright("-") upright("inj") . $

 Every model maps to the terminal model with the right lifting property against all $J_j$.]
] <lem:lifting-test>

#proof[
  For a square against $I_j$, Proposition 5 provides an approximate $j$-cell lift $x$ and a target $\( j + 1 \)$-cell $H : f x arrow.r y$. Lifting $H$ against $J_j : D_j arrow.r D_(j + 1)$ with prescribed source $x$ gives a $\( j + 1 \)$-cell whose target is a strict lift of $y$ with the specified boundary. This also proves the assertion for $j = 0$.
  An $I$-injective map satisfies the test strictly, using the unit on the target disk as its homotopy, so it belongs to $cal(W)$. Each $J_j$ is the composite of two boundary attachments: first adjoin the parallel target $j$-cell using $I_j$, then the joining $\( j + 1 \)$-cell using $I_(j + 1)$. Thus $I$-injectivity implies $J$-injectivity, and the first paragraph proves the reverse inclusion in the displayed equality. Finally a $J_j$-lifting problem for $X arrow.r 1$ is solved by the unit on its prescribed source cell. ◻
]

The same unit defines a retraction $D_(j + 1) arrow.r D_j$ of $J_j$. Its pushout along any specified cell therefore has a retraction as well. A transfinite composite of such pushouts has compatible retractions to its initial object: choose the retraction at each successor and use the induced map out of the colimit at each limit. The existence of these retractions alone does not establish weak equivalence.

== 3 Coskeletal cutoffs and contractible trees <sec:cutoffs-trees>

We first establish two facts without using any elementary-expansion assertion: higher cell attachments preserve lower cells, and free models on globular sums are contractible. We then fix a finite cutoff and set up a descending induction. Within one step of that induction, the already established higher-dimensional expansions will suffice to contract the tree diagrams needed for partial cylinders.

=== 3.1 The cutoff reflector <the-cutoff-reflector>

Coskeletal globular models and their relation to truncated models are studied in #cite(label("HenryLanari2023")) Section 2. We construct the reflector needed here directly, keeping the chosen free order of the coherator.

For an integer $q gt.eq 0$, call a model #emph[$q$-coskeletal] if every globular boundary of dimension $j > q$ has exactly one filler. Thus the restriction map

$ "Hom" \( D_j \, Y \) arrow.r "Hom" \( partial D_j \, Y \) $

is bijective for every $j > q$. Let $cal(A)_q$ be the full subcategory of such models. The uniqueness begins in dimension $q + 1$; distinct parallel $q$-cells are retained. To recover a homotopy-class test in dimension $k$, we will choose $q gt.eq k + 1$, retaining both the tested cells and their joining homotopies.

#prodef([Lemma 3.1.])[
  (Cutoff reflector).  #emph[The inclusion $cal(A)_q subset.eq cal(A)$ has a left adjoint $R_q$. Its unit $X arrow.r R_q X$ is bijective on the sets of cells in every dimension at most $q$. For $0 lt.eq k < q$, the same construction gives the reflector $cal(A)_q arrow.r cal(A)_k$, and $R_k R_q$ is naturally isomorphic to $R_k$.]
] <lem:cutoff>

#proof[
  On underlying globular sets, retain the cells and face maps of $X$ through dimension $q$. In successive dimensions $j > q$, put one $j$-cell over each parallel pair of $\( j - 1 \)$-cells. Denote the resulting globular set by $Z$. There is a canonical globular map $eta : X arrow.r Z$, equal to the identity through $q$.
  To interpret the theory on $Z$, follow the #emph[given free cellular presentation of $cal(C)$ in its original order]. Maintain that $eta$ respects the part of the theory already interpreted. Suppose a newly adjoined generating operation has output dimension $j$ and arity $S$. Its two prescribed faces are operations of the earlier theory.
  If $j lt.eq q$, the generating arity bound $dim \( S \) lt.eq j$ in Definition 2 makes the tuple sets on $S$ in $X$ and $Z$ identical. Use the original interpretation in $X$. Its prescribed face equations hold in $Z$: the tuple comes from $X$, and $eta$ already respects both earlier face operations. It also respects the new operation, since it is the identity in dimension $j$.
  If $j > q$, the earlier interpretation gives a parallel boundary in $Z$, and the new operation is its unique filler. The image under $eta$ of the operation in $X$ has that boundary, so uniqueness again shows compatibility with $eta$. At a limit stage take the union of the preceding interpretations. Freeness of the presentation now gives a model structure on $Z$. This argument places no bound on the arities of #emph[composite] face operations and does not reorder generators by dimension.
  For a $q$-coskeletal model $Y$, a model map $f : X arrow.r Y$ has a unique globular factorization through $eta$: use $f$ through dimension $q$ and unique fillers thereafter. This factorization is a model map. For a generator of output at most $q$, every tuple comes from $X$; for a higher generator, preservation follows from uniqueness in $Y$. This proves the adjunction. Starting with $X in cal(A)_q$ and performing the construction at $k < q$ proves the remaining statements by the same universal property. ◻
]

Write $F_q = R_q F$ for the free $q$-coskeletal model functor. Since $R_q$ is a left adjoint, it preserves actual algebraic pushouts and cellular presentations. In $cal(A)_q$ the images of $I_j$ and $J_j$ are isomorphisms for $j > q$. The image of $J_q$ freely adjoins a parallel $q$-cell; its joining $\( q + 1 \)$-cell is forced by uniqueness. This description includes all operations of the fixed theory on the new cell.

Filtered colimits of $q$-coskeletal models, computed in $cal(A)$, remain $q$-coskeletal: both disks and their finite boundaries commute with such colimits, so the required restriction maps remain bijective. Consequently filtered colimits in $cal(A)_q$ are computed on cells as well. The adjunction for $F_q$ now shows that $F_q \( K \)$ is finitely presentable whenever $K$ is a finite globular set. The category $cal(A)_q$ is cocomplete by reflection, and the same ordinary small-object construction is therefore available for its disk and boundary maps. No model structure is being used.

#prodef([Lemma 3.2.])[
  (Higher attachments preserve lower cells).  #emph[Fix $k gt.eq 0$. In $cal(A)$, any relative cellular extension using only $I_j$ with $j > k$ is bijective on all cells through dimension $k$. The same holds in $cal(A)_q$ whenever $k < q$. Consequently these conclusions also hold for relative extensions using only $J_j$ with $j > k$.]
] <lem:high-cells>

#proof[
  The reflection of $I_j$ into $cal(A)_k$ is an isomorphism when $j > k$: every $k$-coskeletal model has a unique filler of every $j$-boundary. Reflect a pushout, a coproduct of attachments, or a transfinite composite of such maps. Colimit preservation makes its reflection an isomorphism. Since both reflection units preserve the cells through $k$, the original map is bijective on those cells. Within $cal(A)_q$, use the further reflection to $cal(A)_k$. Finally, $J_j$ is the composite of an $I_j$ attachment, adjoining its new target $j$-cell, and an $I_(j + 1)$ attachment, adjoining the comparison cell. ◻
]

=== 3.2 Spines of globular sums <spines-of-globular-sums>

We use an explicit recursive description of finite globular-sum shapes. For nonempty shapes $S_1 \, dots.h \, S_p$, write $\[ S_1 \, dots.h \, S_p \]$ for the shape with vertices $v_0 \, dots.h \, v_p$ whose cells over each consecutive pair $\( v_(i - 1) \, v_i \)$ form the suspension of $S_i$. Suspension raises dimensions by one and gives the suspended shape these two vertices as poles. Every shape is either a vertex or has this form. To see this from a table of dimensions, split its ordered amalgamation at all gluings in dimension zero and lower every dimension in each remaining block by one. Repeating gives the stated recursion.

For a shape $S$, let $v \( S \)$ denote its first vertex. Define a subshape $T_m \( S \)$, for $m gt.eq 0$, recursively. A vertex is fixed, and for $S = \[ S_1 \, dots.h \, S_p \]$ put

$ T_0 \( S \) & = \[ v \( S_1 \) \, dots.h \, v \( S_p \) \] \,\
T_m \( S \) & = \[ T_(m - 1) \( S_1 \) \, dots.h \, T_(m - 1) \( S_p \) \] #h(2em) \( m gt.eq 1 \) . quad "(3.1)" $ <eq:spine-recursion>

In the first line each $v \( S_i \)$ denotes the one-vertex subshape of $S_i$. Thus at depth $m$ the construction keeps every vertex and one generating edge between consecutive vertices. A branch ending before that depth is retained in full.

#prodef([Lemma 3.3.])[
  (Finite spine).  #emph[For every finite globular-sum shape $S$ and every $m gt.eq 0$, the subshape $T_m \( S \)$ has height at most $m + 1$ and contains every cell of $S$ through dimension $m$. The inclusion $T_m \( S \) arrow.r S$ is a finite composite of pushouts of the globular source inclusions $d_j arrow.r d_(j + 1)$ with $j > m$.]
] <lem:spine>

#proof[
  First, every shape $S$ can be built from $v \( S \)$ by finitely many source inclusions $d_j arrow.r d_(j + 1)$ with $j gt.eq 0$. This is induction on the recursive description. If $S$ is a vertex there is nothing to attach. Otherwise, for $S = \[ S_1 \, dots.h \, S_p \]$, first build the outer vertex string by source inclusions in dimension zero, using in its $i$th slot the edge corresponding to $v \( S_i \)$. Then build each $S_i$ from $v \( S_i \)$ by the induction hypothesis and suspend its attachments into that slot. Under this suspension an elementary pair of dimensions $\( j \, j + 1 \)$ becomes one of dimensions $\( j + 1 \, j + 2 \)$, with exactly the same source-attachment description. This follows directly from the face maps: the two added cells acquire the fixed outer poles, and their other faces are the suspended old faces.
  The height and lower-cell claims for $T_m$ now follow directly from Equation (3.1). For the attachment claim when $m = 0$, rebuild each $S_i$ from $v \( S_i \)$ as above. All these attachments are suspended once, so their indices are at least one. For $m gt.eq 1$, the induction hypothesis for $T_(m - 1) \( S_i \) arrow.r S_i$ uses indices $j > m - 1$; suspending gives indices $j + 1 > m$. Apply this construction in every slot. There are finitely many slots and attachments because $S$ is finite. ◻
]

Contractibility of free globular sums is established in #cite(label("Lanari2020")) Proposition 3.8. The spine argument below proves the statement directly in our convention and also gives its reflected form.

#prodef([Proposition 3.4.])[
  (Contractibility of free shapes).  #emph[For every nonempty finite globular-sum shape $S$, the models $F \( S \)$ and $F_q \( S \)$ are contractible, for every $q gt.eq 0$.]
] <prop:shape-contractible>

#proof[
  Let $a \, b$ be parallel $m$-cells of $F \( S \)$, where $m gt.eq 0$ and in dimension zero there is no parallelism condition. By Lemmas 11 and 10, the map $F \( T_m \( S \) \) arrow.r F \( S \)$ is bijective on every cell set through $m$. Hence $a \, b$ have unique lifts $a' \, b'$ there, and the lifts are parallel: their lower faces agree by the same injectivity.
  The free model on a globular-sum shape is represented by that object of $cal(C)$. Thus $a' \, b'$ are a parallel pair of theory arrows with domain the $m$-globe and codomain $T_m \( S \)$. Since $dim \( T_m \( S \) \) lt.eq m + 1$, this pair is admissible for a filler of dimension $m + 1$. Contractibility of $cal(C)$ supplies such a filler. Its image joins $a$ to $b$ in $F \( S \)$. The model is nonempty because $S$ has a vertex, so the contractibility criterion of Proposition 5 applies. No assertion about weak equivalences of elementary attachments was used here.
  For $F_q \( S \)$, a parallel pair of $m$-cells with $m < q$ lifts to $F \( S \)$ by Lemma 9; the filler just constructed is preserved through dimension $m + 1 lt.eq q$. If $m gt.eq q$, the required filler has dimension $m + 1 > q$ and exists uniquely. The vertex is retained, so $F_q \( S \)$ is also contractible. ◻
]

=== 3.3 The descending induction and its upper-cell consequence <the-descending-induction-and-its-upper-cell-consequence>

Fix $q gt.eq 0$. Until the cutoff is removed in the next section, all constructions take place in $cal(A)_q$. We keep the notation $F_q$ for free models, and write $D_j \, partial D_j \, I_j \, J_j$ for their images under $R_q$. Weak equivalence means the same component and based-homotopy-group test on these models; all the properties in Section 2 remain applicable.

For $0 lt.eq n lt.eq q$, let $sans(E) \( q \, n \)$ be the following assertion:

#quote(block: true)[
  For every cellular object $X in cal(A)_q$ and every model map $a : D_n arrow.r X$, the actual pushout of $J_n$ along $a$ is a weak equivalence.
]

Here cellular objects and extensions may have any set-sized transfinite presentation. The attaching map $a$ need not select a presentation generator. We will prove $sans(E) \( q \, n \)$ by descending induction on $n$.

#prodef([Lemma 3.5.])[
  (Top-dimensional base case).  #emph[The assertion $sans(E) \( q \, q \)$ holds for every $q gt.eq 0$.]
] <lem:cutoff-base>

#proof[
  Let $i : X arrow.r Y$ be a pushout of $J_q$. It has a retraction $r : Y arrow.r X$, obtained by sending the new $q$-cell to the attaching cell and its comparison to a unit. For $q > 0$, Lemma 10 shows that $i$ is bijective on cells through dimension $q - 1$.
  Check the exact-boundary criterion of Proposition 5 in dimension $d$. If $d < q$, the given $d$-cell of $Y$ comes from a unique $d$-cell of $X$, whose boundary is the prescribed one by injectivity on lower cells. Its image is the given cell, so its unit supplies the homotopy. If $d = q$, apply $r$ to the given cell. Its boundary is the prescribed boundary because $r i = upright("id")_X$, and its image is parallel to the given cell. These two $q$-cells have a unique joining $\( q + 1 \)$-cell. If $d > q$, the prescribed source boundary has a unique filler in $X$, whose image is the given filler in $Y$. This proves the criterion in every dimension. For $q = 0$, the first case is absent; the same retraction and unique-arrow argument proves the dimension-zero case directly. ◻
]

For the rest of this section and the construction in the next, fix $0 lt.eq n < q$ and assume $sans(E) \( q \, j \)$ for every $n < j lt.eq q$. Call an index #emph[upper] if it is strictly greater than $n$. Thus an upper $I$-cellular extension uses only $I_j$ with $j > n$, and likewise for upper $J$-cellular extensions. Every upper $J$-cellular extension with cellular source is in $cal(W)$: the successor stages use the induction hypothesis (or an isomorphism for $j > q$), and limit stages use Lemma 6. Every intermediate object remains cellular, since each $J_j$ is a composite of two boundary attachments.

#prodef([Lemma 3.6.])[
  (Upper-cell splitting and pushout).  #emph[Suppose $i : U arrow.r V$ is an upper $I$-cellular extension, $U$ is cellular, and $i in cal(W)$. Then $i$ admits a retraction. For every map $U arrow.r U'$ with $U'$ cellular, the pushout 
$ U' arrow.r U' product.co_U V $

 also belongs to $cal(W)$.]
] <lem:upper-cell>

#proof[
  Apply the ordinary small-object construction with the upper $J_j$ to factor $i$ as
  $ U arrow.r^(thin a thin) Z arrow.r^(thin p thin) V \, $
  where $a$ is upper $J$-cellular and $p$ lifts against every upper $J_j$. The preceding induction hypotheses imply $a in cal(W)$, so $p in cal(W)$ by two-out-of-three. By Lemma 8, $p$ lifts against every upper $I_j$: the approximate lift of a $j$-cell is corrected by lifting its $\( j + 1 \)$-dimensional homotopy against $J_j$. In particular the lowest index required is $J_(n + 1)$, which is already available.
  Since $i$ is upper $I$-cellular, there is a map $s : V arrow.r Z$ with $s i = a$ and $p s = upright("id")_V$. Thus, in the category under $U$, the map $i$ is a retract of $a$. Each individual $J_j$ attachment admits a unit retraction. A transfinite composite of such attachments also retracts to its initial object: choose the maps back recursively at successor stages, and use their compatible colimit map at a limit stage. Let $t : Z arrow.r U$ be the resulting retraction of $a$. Then $t s$ is a retraction of $i$.
  Push the retract diagram out along $U arrow.r U'$. The pushout of $i$ is a retract of the pushout of $a$, and the latter is upper $J$-cellular with cellular source $U'$. It is therefore in $cal(W)$ by the induction hypotheses. Retract closure proves the claim. ◻
]

=== 3.4 Trees in a fixed globular dimension <trees-in-a-fixed-globular-dimension>

Define a #emph[tree diagram at depth $n$] as follows. At depth zero, it is a finite nonempty oriented tree, regarded as a globular set of dimensions zero and one; a single vertex is allowed. At depth $n > 0$, it is either a vertex or a string $\[ K_1 \, dots.h \, K_p \]$ with every $K_i$ a tree diagram at depth $n - 1$. Such a diagram $K$ is a finite globular set of height at most $n + 1$. In each depth-$n$ slot, the tree vertices are $n$-cells with one common lower boundary, and its edges are $\( n + 1 \)$-cells. All orientations of the edges are allowed. At $n = 0$ the lower boundary condition is empty.

The free model $F_q \( K \)$ is cellular: attach its finitely many globular cells along their boundaries in increasing dimension and apply the free functor. Its finite generating globular set must be distinguished from the generally infinite collection of cells created by the operations of $cal(C)$.

#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.2), radius: 0.05, fill: rgb("#000000"))
  circle((1.45, 1.2), radius: 0.05, fill: rgb("#000000"))
  circle((2.9, 1.2), radius: 0.05, fill: rgb("#000000"))
  circle((0, 0), radius: 0.05, fill: rgb("#000000"))
  circle((1.45, 0), radius: 0.05, fill: rgb("#000000"))
  circle((2.9, 0), radius: 0.05, fill: rgb("#000000"))
  line((0, 1.2), (1.45, 1.2), mark: (end: ">"))
  line((1.45, 1.2), (2.9, 1.2), mark: (end: ">"))
  line((0, 1.2), (0, 0), mark: (end: ">"))
  line((1.45, 1.2), (1.45, 0), mark: (end: ">"))
  line((2.9, 1.2), (2.9, 0), mark: (end: ">"))
  content((1.45, -1.05), [#text(size: 9pt)[a tree slot]])
  circle((4.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  circle((5.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  circle((6.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  circle((7.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  circle((8.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  circle((9.4, 0.6), radius: 0.05, fill: rgb("#000000"))
  line((4.4, 0.6), (5.4, 0.6), mark: (end: ">"))
  line((5.4, 0.6), (6.4, 0.6), mark: (end: ">"))
  line((6.4, 0.6), (7.4, 0.6), mark: (end: ">"))
  line((7.4, 0.6), (8.4, 0.6), mark: (end: ">"))
  line((8.4, 0.6), (9.4, 0.6), mark: (end: ">"))
  content((6.9, -1.05), [#text(size: 9pt)[a string on the same vertices]])
})

#prodef([Proposition 3.7.])[
  (Contractibility of tree diagrams).  #emph[Under the fixed-cutoff induction hypotheses above, $F_q \( K \)$ is contractible for every tree diagram $K$ at depth $n$.]
] <prop:tree-contractible>

#proof[
  In each depth-$n$ slot, order its tree vertices in any way and replace the tree by the forward linear string on those same labeled vertices. A singleton remains a singleton. The resulting globular set $K^(upright("lin"))$ is a globular-sum shape, and its cells through dimension $n$ are canonically the same as those of $K$; Figure [??] illustrates one slot. Reordering within a slot leaves unchanged any outer poles and every earlier concatenation or suspension. Put
  $ A = F_q \( K \) \, #h(2em) L = F_q \( K^(upright("lin")) \) . $
  The model $L$ is contractible by Proposition 12.
  There are model maps
  $ f : A arrow.r L \, #h(2em) g : L arrow.r A $
  fixing the generating cells through dimension $n$. To define $f$, send each tree edge to a composite along the path between its endpoints in the corresponding line, using inversion for any backward traversal. Define $g$ using paths in the tree. All compositions are at level $n$. Within one slot the vertices are parallel $n$-cells, so these assignments have exactly the required faces. They extend to model maps by the free universal property.
  For each $\( n + 1 \)$-dimensional generating edge $e$ of $K$, choose a cell
  $ alpha_e : e arrow.r g f \( e \) #h(2em) upright("of dimension ") n + 2 upright(" in ") A . quad "(3.2)" $ <eq:tree-generator-homotopy>
  Such a cell exists by the groupoid calculus of Section 2. Indeed, $g f \( e \)$ represents a walk in the original tree with the same endpoints as $e$. Here an inverse of a composite is expanded at the level of homotopy classes, using uniqueness of inverses in the hom-set groupoid. Successively delete backtracking pairs from this walk. A walk in a tree without backtracking is the unique simple path between its endpoints, here the edge $e$. Associativity, units, and inverse cancellation hold for $\( n + 1 \)$-cells modulo $\( n + 2 \)$-cell homotopy, so the two cells represent the same class. The homotopy relation is given by existence of a single joining cell, giving Equation (3.2).
  We next turn these homotopies on generators into a statement about the whole model. For every such edge $e$, adjoin a duplicate $e'$ with the same boundary and a cell $delta_e : e arrow.r e'$ of dimension $n + 2$. Let $Q$ be the resulting model and $a_0 : A arrow.r Q$ its canonical map. These are finitely many $J_(n + 1)$ attachments, so $a_0 in cal(W)$ by the already proved higher-index case. Define a second model map $a_1 : A arrow.r Q$ by fixing every generator through dimension $n$ and sending $e$ to $e'$. This is permitted because $A = F_q \( K \)$ and $K$ has no generators above dimension $n + 1$. The face equations of this globular assignment are the only conditions needed to extend it to the full model.
  There is a common retraction $r : Q arrow.r A$: keep the original generators, send $e'$ to $e$, and send $delta_e$ to a unit on $e$. Thus $r a_0 = r a_1 = upright("id")_A$. Two-out-of-three gives first $r in cal(W)$ and then $a_1 in cal(W)$. Likewise Equation (3.2) defines a model map $h : Q arrow.r A$ which is the identity on the original copy, sends $e'$ to $g f \( e \)$, and sends $delta_e$ to $alpha_e$. The free universal property gives
  $ h a_0 = upright("id")_A \, #h(2em) h a_1 = g f . $
  It follows that $h in cal(W)$ and $g f in cal(W)$. This promotion uses only $J_(n + 1)$, not $J_n$.
  The map $g f$ factors through the contractible model $L$. Hence its map on components factors through a singleton and its maps on positive based homotopy groups factor through trivial groups. Since these maps are respectively bijective and isomorphisms, $A$ has one component and trivial homotopy groups. It is nonempty, so it is contractible.
  When $q = n + 1$, the attachments used above are precisely $J_q$, whose case was proved in Lemma 13. They retain the duplicate $q$-generators, while the joining $\( q + 1 \)$-cells are unique. The definitions of $a_1 \, r \, h$ still have exactly their stated universal properties. Thus this boundary case requires no additional induction step. ◻
]

=== 3.5 Whiskers on globular sums <whiskers-on-globular-sums>

Let $S$ be a finite globular-sum shape with $dim \( S \) lt.eq q$. For $epsilon.alt in { 0 \, 1 }$, define $H_epsilon.alt \( S \)$ by starting with $F_q \( S \)$ and, for each actual $n$-cell $x$ of the globular set $S$, adjoining a duplicate $x'$ with the same boundary and one $\( n + 1 \)$-cell joining them. Orient the join $x arrow.r x'$ when $epsilon.alt = 0$ and $x' arrow.r x$ when $epsilon.alt = 1$. Every original higher generating cell of $S$ keeps its original boundary. These are cellular constructions: attach each duplicate along its boundary, then its joining cell. For $n = 0$ the duplicate attachment is an attachment of a vertex. If $S$ has no $n$-cells, set $H_epsilon.alt \( S \) = F_q \( S \)$.

#prodef([Proposition 3.8.])[
  (Contractibility after adjoining whiskers).  #emph[Under the fixed-cutoff induction hypotheses above, $H_epsilon.alt \( S \)$ is contractible for both choices of $epsilon.alt$. The same conclusion holds if the orientation of the join is chosen independently for each $n$-cell of $S$.]
] <prop:whiskered-shape>

#proof[
  Set $S' = T_n \( S \)$. It contains exactly the same $n$-cells as $S$, so the same duplicates and joins can be adjoined to either shape. In $S'$ every slot at depth $n$ is a linear string or a singleton. Adding one leaf and its edge at each vertex turns each such slot into a finite oriented tree. Thus $H_epsilon.alt \( S' \)$ is the free model on a tree diagram at depth $n$, and is contractible by Proposition 15. The same argument allows independent orientations.
  By Lemma 11, $S' arrow.r S$ is a finite composite of source attachments with indices strictly greater than $n$. Those attachments add no further $n$-cells. Perform them after adjoining the fixed set of duplicates and joins. Their original attaching maps use the retained generators of $S$ and their original faces, so the resulting model is exactly $H_epsilon.alt \( S \)$ by the pushout universal properties. Therefore $H_epsilon.alt \( S' \) arrow.r H_epsilon.alt \( S \)$ is upper $J$-cellular. Its source and all intermediate objects are cellular, so the descending induction hypotheses make it a weak equivalence. Contractibility follows from that of $H_epsilon.alt \( S' \)$. If the recursion ends before depth $n$, there are no joins in that branch and it remains unchanged throughout. ◻
]

The hypotheses $0 lt.eq n < q$ and $sans(E) \( q \, j \)$ for $j > n$ remain in force in the next section. The tree and whisker propositions have established the needed non-pasting diagrams using only those hypotheses; the assertion $sans(E) \( q \, n \)$ itself is still to be proved.

== 4 Partial cylinders and elementary expansions <sec:partial-cylinders>

Continue to work at a fixed cutoff $q$. Fix $0 lt.eq n < q$, and assume the descending induction hypothesis for every index greater than $n$, with arbitrary cellular starting objects. In this section, write $F$ for $F_q$, and retain $D_j \, partial D_j \, I_j \, J_j$ for their images in $cal(A)_q$; an #emph[upper] attachment has index greater than $n$. In particular, Lemma 14 and Propositions 15 and 16 are available.

Our goal is a functor $cal(P)$ with natural endpoint maps $p_0 \, p_1 : cal(P) Y arrow.r Y$. Each endpoint must lift every boundary inclusion, while the pair $\( p_0 \, p_1 \)$ must lift $J_n$. Here is how these properties will prove the induction step. For a cellular $X$, the individual lifting property supplies a section $h : X arrow.r cal(P) X$ of $p_0$, and $u = p_1 h$ is a weak equivalence. For an elementary expansion $i : X arrow.r Y$ with its unit retraction $r : Y arrow.r X$, the joint lifting property extends this comparison over $Y$ and makes $i u r$ a weak equivalence. The map $i u$ is then a retract of $i u r$, so retract closure and two-out-of-three will give the desired weak equivalence $i$. We construct the representing cylinder objects first, then interpret the operations of $cal(C)$ to obtain this functor and its endpoint properties.

=== 4.1 The cylinder objects <the-cylinder-objects>

Representing path cells by maps out of a coglobular cylinder follows the strategy of Lanari #cite(label("Lanari2020")) Definitions 5.2–5.3 and 6.1. Here the cylinders depend on the fixed cutoff and expansion index; their upper completions will support the descending induction and the interpretation of every operation of the chosen coherator.

The object $P_j$ will represent a cylinder on a $j$-cell: a map $P_j arrow.r Y$ specifies that cylinder in $Y$, with two endpoint $j$-cells. The endpoints coincide below dimension $n$. In dimension $n$, a cylinder is a single $\( n + 1 \)$-cell joining them. In higher dimensions we will attach cells to make these data compatible along their common faces.

We construct a coglobular diagram $P_0 \, dots.h \, P_q$, together with two maps of coglobular diagrams

$ e_epsilon.alt : D_bullet arrow.r P_bullet \, #h(2em) epsilon.alt = 0 \, 1 . $

For a globular set $S$ of dimension at most $q$, put

$ P \( S \) = "colim"_(\( d_j arrow.r S \)) P_j . quad "(4.1)" $ <eq:cylinder-realization>

The indexing category is the category of cells and their faces in $S$. In particular, the structure maps into $P_j$ specify a map $P \( partial d_j \) arrow.r P_j$, and the endpoint maps induce $e_epsilon.alt \( S \) : F \( S \) arrow.r P \( S \)$. This notation will also be used while only the cylinder objects needed by $S$ have been constructed.

Given the objects in dimensions below $j$, a boundary cylinder and one prescribed endpoint are represented by $A_j^epsilon.alt$; prescribing both endpoints instead gives $A_j^01$. Their precise definitions are

$ A_j^epsilon.alt & = P \( partial d_j \) product.co_(partial D_j \, e_epsilon.alt) D_j \,\
A_j^01 & = P \( partial d_j \) product.co_(partial D_j product.co partial D_j) \( D_j product.co D_j \) . quad "(4.2)" $ <eq:cylinder-one-sided>

In Equation (4.2), the first attaching map uses both endpoints on the boundary, and the second uses the two boundary inclusions. Empty boundaries have their usual meaning at $j = 0$.

The two domains have different tasks. The two-sided domain records the boundary and both endpoint values that an operation on cylinders must preserve. We will choose $P_j$ receiving these data. The resulting one-sided maps $A_j^epsilon.alt arrow.r P_j$ will admit retractions, so boundary-cylinder data with one prescribed endpoint extend to a cylinder in every target model. The joint endpoint lifting problem will use a separate tree of prescribed data.

For $j < n$, set $P_j = D_j$, with the usual coglobular maps and with both endpoints equal to the identity. Set

$ P_n = D_(n + 1) \, $

with endpoints the source and target $n$-faces. Its boundary map is the inclusion of their common boundary: all dimensions below $n$ are stationary. Thus

$ P \( partial d_n \) = partial D_n \, #h(2em) A_n^epsilon.alt = D_n \, #h(2em) A_n^01 = partial D_(n + 1) \, quad "(4.3)" $ <eq:cylinder-critical-level>

and $A_n^01 arrow.r P_n$ is $I_(n + 1)$.

For $n < j lt.eq q$, use the ordinary small-object construction on ${ I_k : k > n }$ to factor the terminal map as

$ A_j^01 arrow.r P_j arrow.r 1 \, quad "(4.4)" $ <eq:cylinder-upper-completion>

where the first map is upper cellular and the second lifts every upper boundary inclusion. This completion may attach infinitely many cells; the objects $P_j$ need not be finitely cellular. The given map from $P \( partial d_j \)$ and the two endpoint disks supply the coglobular and endpoint maps at this level. Their identities hold because they already agree on the boundary. These choices complete the construction of $P_bullet$.

We record the cellularity needed in its analysis. Inductively, $P \( partial d_j \)$ is cellular: apply the globular skeletal filtration and use the cellular maps $P \( partial d_k \) arrow.r P_k$ at earlier levels. For $j < n$, the latter map is $I_j$. At $j = n$, it attaches two $n$-cells to $partial D_n$, obtaining $partial D_(n + 1)$, and then attaches the joining $\( n + 1 \)$-cell. For $j > n$, it attaches the two endpoint $j$-cells, followed by the completion in Equation (4.4). This proves cellularity of all the boundary objects, the two domains in Equations (4.2)–(4.2), and the $P_j$. Moreover, for $j > n$,

$ A_j^epsilon.alt arrow.r P_j quad "(4.5)" $ <eq:cylinder-upper-one-sided>

is upper cellular: it first attaches the missing endpoint $j$-cell and then makes the chosen upper attachments. The two-sided maps $A_j^01 arrow.r P_j$ are cellular in the range $n lt.eq j lt.eq q$ used below.

=== 4.2 The exact skeletal gluing <the-exact-skeletal-gluing>

We next deduce contractibility of the prescribed-data objects from the whiskered shapes of the preceding section. The following formula specifies which cylinder objects are used at each stage and keeps track of all shared faces.

#prodef([Lemma 4.1.])[
  #emph[Fix $epsilon.alt in { 0 \, 1 }$. For a finite globular set $S$, define, whenever the required cylinder objects have been constructed, 
$ C_ell \( S \) = F \( S \) product.co_(F \( "sk"_ell S \) \, e_epsilon.alt) P \( "sk"_ell S \) . quad "(4.6)" $ <eq:cylinder-skeletal-stage>

 For $ell > n$, there is a pushout square 
$ Z Q T 2 T T I K Z 2 quad "(4.7)" $ <eq:cylinder-skeletal-pushout>

 Here $S_ell$ is the set of actual $ell$-cells of the globular set $S$. If $S$ is a pasting scheme, then 
$ C_n \( S \) = H_epsilon.alt \( S \) \, #h(2em) C_(j - 1) \( d_j \) = A_j^epsilon.alt quad \( j > n \) \, #h(2em) C_(dim \( S \)) \( S \) = P \( S \) . quad "(4.8)" $ <eq:cylinder-skeletal-ends>

 The first identity uses the whisker orientation for which the retained copy of $S$ is endpoint $epsilon.alt$.]
] <lem:cylinder-skeletal-gluing>

#proof[
  The ordinary skeleton $"sk"_ell S$ is obtained from $"sk"_(ell - 1) S$ by attaching one globe along its boundary for each $s in S_ell$. Both $F$ and the construction $P \( - \)$ in Equation (4.1) preserve these colimits. More explicitly, a map $C_ell \( S \) arrow.r T$ consists of a map $F \( S \) arrow.r T$ and maps from its cylinder objects through level $ell$, compatible on faces and on endpoint $epsilon.alt$. After specifying the same data through level $ell - 1$, extending them at a particular cell $s$ amounts to choosing a map $P_ell arrow.r T$ with its values already prescribed on $P \( partial d_ell \)$ and on the retained endpoint $D_ell$. Those prescribed values form precisely a map $A_ell^epsilon.alt arrow.r T$. This is the universal property of Equation (4.7).
  In particular, faces shared by two cells use the same map from the previous skeleton. No additional copy of a shared face is introduced. The argument concerns colimits of the specified cylinder objects, so it also applies when an earlier upper completion has attached cells of dimension less than its cylinder index.
  Through dimension $n - 1$, all the cylinders are stationary. At dimension $n$, each cell acquires one duplicate and one joining cell; the original higher cells retain their original boundaries. This proves $C_n \( S \) = H_epsilon.alt \( S \)$, including the case $dim \( S \) < n$, in which there are no whiskers. The other two identities follow from $"sk"_(j - 1) d_j = partial d_j$ and $"sk"_(dim \( S \)) S = S$, respectively. ◻
]

#prodef([Proposition 4.2.])[
  #emph[Every $P_j$ is contractible. For $n < j lt.eq q$, both one-sided domains $A_j^epsilon.alt$ are contractible, and $A_j^epsilon.alt arrow.r P_j$ is an upper cellular weak equivalence. For every pasting scheme $S$ of height at most $q$, the model $P \( S \)$ is cellular and contractible.]
] <prop:cylinder-contractibility>

#proof[
  The objects $P_j$ for $j lt.eq n$ are free globes and are contractible by Proposition 12. Proceed by induction on $j > n$, handling both endpoints. By Lemma 17, $A_j^epsilon.alt$ is obtained from $H_epsilon.alt \( d_j \)$ by pushing out the maps $A_ell^epsilon.alt arrow.r P_ell$ on the boundary cells of dimensions $n < ell < j$, in increasing order of $ell$. At each dimension, attach its finitely many cells one at a time. The resulting iterated pushout is the coproduct pushout of Lemma 17, by its universal property. The starting object is cellular and contractible by Proposition 16. Each map used in this filtration is already an upper cellular weak equivalence by the induction on $j$. Lemma 14 therefore makes every one of its pushouts a weak equivalence. All intermediate objects are cellular, so the lemma applies at every stage. It follows that $A_j^epsilon.alt$ is contractible. When $j = n + 1$, this filtration has no intervening stages: $A_(n + 1)^epsilon.alt = H_epsilon.alt \( d_(n + 1) \)$.
  The upper cellular map $A_j^epsilon.alt arrow.r P_j$ preserves all cells through dimension $n$, by Lemma 10. Thus $P_j$ is nonempty and inherits fillers of dimensions $1 \, dots.h \, n$ from $A_j^epsilon.alt$. Its map to the terminal object lifts the upper boundary inclusions by construction, so it has every remaining boundary filler. Hence $P_j$ is contractible. At $n = 0$, the inherited condition is simply nonemptiness. Both terminal maps are now weak equivalences, so $A_j^epsilon.alt arrow.r P_j$ is a weak equivalence. Its upper cellularity was established in Equation (4.5). This completes the induction on $j$.
  For a pasting scheme $S$ with $dim \( S \) gt.eq n$, start with $C_n \( S \) = H_epsilon.alt \( S \)$ and use the same filtration through all dimensions $n < ell lt.eq dim \( S \)$. It ends at $P \( S \)$. Every step is again a cellular weak equivalence by Lemma 14; its cellular, contractible starting object therefore gives the assertion. If $dim \( S \) < n$, then $P \( S \) = F \( S \)$, so Proposition 12 applies directly. ◻
]

=== 4.3 Interpreting every operation of the coherator <interpreting-every-operation-of-the-coherator>

Contractibility of $P \( S \)$ is the output needed from the geometric construction. It will let us extend each operation from its already prescribed boundary and endpoints. Making that extension once on the representing objects will ensure naturality in the model.

For $Y in cal(A)_q$, form the globular set with cells

$ \( cal(P) Y \)_j = "Hom"_(cal(A)_q) \( P_j \, Y \) \, #h(2em) 0 lt.eq j lt.eq q \, quad "(4.9)" $ <eq:partial-path-cells>

and complete it above dimension $q$ by unique fillers of all boundaries. The coglobular identities give its globular identities. Precomposition with $e_epsilon.alt$ gives globular maps $p_epsilon.alt : cal(P) Y arrow.r Y$ through dimension $q$, which extend uniquely above it. Equation (4.1) gives the natural representation

$ { upright("globular maps ") S arrow.r cal(P) Y } tilde.equiv "Hom"_(cal(A)_q) \( P \( S \) \, Y \) #h(2em) \( dim \( S \) lt.eq q \) . quad "(4.10)" $ <eq:partial-path-tuples>

#prodef([Proposition 4.3.])[
  #emph[The construction in Equation (4.9) admits interpretations of every operation of $cal(C)$, making $cal(P) : cal(A)_q arrow.r cal(A)_q$ a functor and both $p_epsilon.alt$ natural model morphisms. They lift all boundary inclusions $I_j$. Their joint map 
$ \( p_0 \, p_1 \) : cal(P) Y arrow.r Y times Y $

 lifts $J_n$.]
] <prop:partial-path>

#proof[
  #emph[Construction of the algebraic interpretation.] Interpret the generators in the #emph[original free construction order] of $cal(C)$. At each stage, the globular set $cal(P) Y$ already interprets the entire preceding theory, naturally in the full model $Y$, and both endpoints preserve that preceding theory. This holds initially for the globular structure.
  Consider a new generating filler $theta$, of output dimension $j > 0$, on a pasting-scheme arity $S$. If $j > q$, evaluate its already interpreted boundary and take its unique filler in $cal(P) Y$. The endpoint equations follow from the boundary equations and unique fillers in $Y$. This is natural in $Y$.
  Suppose $j lt.eq q$. The generator condition gives $dim \( S \) lt.eq j$, so Equation (4.10) applies. If $j < n$, the entire tuple lies in stationary dimensions: $P \( S \) = F \( S \)$ and $P_j = D_j$. Use the original operation of $Y$. Its prescribed boundary follows from the preceding endpoint compatibility, since the endpoint maps are identical isomorphisms on all the cell sets involved.
  It remains to handle $n lt.eq j lt.eq q$. View the given operation, in the fixed category of full models, as a map
  $ theta : D_j arrow.r F \( S \) . $
  This map exists independently of the interpretation being constructed on $cal(P) Y$. Its required endpoint values are the two existing maps
  $ e_epsilon.alt \( S \) theta : D_j arrow.r P \( S \) . quad "(4.11)" $ <eq:partial-path-endpoint-prescription>
  The two face operations of $theta$ belong to the preceding theory. Evaluating either one on an $S$-tuple gives, naturally in $Y$, a function
  $ "Hom"_(cal(A)_q) \( P \( S \) \, Y \) arrow.r "Hom"_(cal(A)_q) \( P_(j - 1) \, Y \) . $
  By Yoneda, these functions are represented by maps $P_(j - 1) arrow.r P \( S \)$. Their parallelism is an equation in the preceding theory, so they agree on all their common faces and give
  $ b_theta : P \( partial d_j \) arrow.r P \( S \) . $
  The previous endpoint compatibility says exactly that
  $ b_theta e_epsilon.alt \( partial d_j \) = e_epsilon.alt \( S \) \( theta \|_(partial D_j) \) . quad "(4.12)" $ <eq:partial-path-boundary-compatibility>
  Consequently $b_theta$ and the two maps in Equation (4.11) glue to a map
  $ A_j^01 arrow.r P \( S \) . quad "(4.13)" $ <eq:partial-path-two-sided-prescription>
  The map $A_j^01 arrow.r P_j$ is cellular for $n lt.eq j lt.eq q$, and $P \( S \)$ is contractible by Proposition 18. Its terminal map therefore lifts every boundary inclusion, and hence every cellular map. It extends Equation (4.13) to a map $P_j arrow.r P \( S \)$. Precomposition with this chosen map is the required operation on $cal(P) Y$. Its boundary and endpoint equations hold by construction.
  In this step a face operation can be a composite of output dimension $j - 1$ whose arity $S$ has height $j$. Its evaluation and Yoneda representation use the whole preceding theory. Preservation of its generators makes the endpoints preserve all their composites and substitutions as well. The inequality $dim \( S \) lt.eq j$ was used for the new generator; no smaller arity bound on its composite faces is needed.
  Make the representing choices once, independently of $Y$. Postcomposition by a map $Y arrow.r Z$ then preserves every chosen operation. At limit stages of the free theory, the compatible interpretations give the interpretation of its union. Freeness now provides a model of the full $cal(C)$, natural in $Y$, and both endpoints are full model morphisms. The construction leaves the chosen globular set unchanged; it is therefore still $q$-coskeletal. ◻
]

#proof[
  #emph[Lifting for an individual endpoint.] For $j lt.eq q$, an $I_j$-lifting problem against $p_epsilon.alt$ specifies a boundary cylinder and one endpoint disk with matching endpoint boundary. By Equation (4.2), it is a map $A_j^epsilon.alt arrow.r Y$, and a solution is an extension to $P_j arrow.r Y$.
  For $j < n$, the map $A_j^epsilon.alt arrow.r P_j$ is the identity. For $j = n$, it is one face inclusion $D_n arrow.r D_(n + 1)$, which has a retraction given by a unit operation. For $j > n$, it is an upper cellular weak equivalence by Proposition 18, and has a retraction by Lemma 14. Precomposing with these retractions gives the desired extensions into every $Y$. For $j > q$, the map $I_j$ is an isomorphism in $cal(A)_q$. Thus both endpoints lift all $I_j$, and belong to $cal(W)$ by Lemma 8. ◻
]

#proof[
  #emph[Lifting for the joint endpoint.] A lifting problem against $J_n$ consists of a map $h : P_n arrow.r Y$ and two maps $a_0 \, a_1 : D_(n + 1) arrow.r Y$ whose source faces are the two endpoints of $h$. Its representing object is
  $ B = P_n product.co_(D_n product.co D_n) \( D_(n + 1) product.co D_(n + 1) \) \, quad "(4.14)" $ <eq:partial-path-tree-domain>
  where the attaching maps use the two endpoints of $P_n$ and the source of each new disk. Since $P_n = D_(n + 1)$, its presentation in the depth-$n$ slot has four $n$-cells and three $\( n + 1 \)$-cells:
  $ h : x_0 arrow.r x_1 \, #h(2em) a_0 : x_0 arrow.r y_0 \, #h(2em) a_1 : x_1 arrow.r y_1 . $
  For $n > 0$, the four $n$-cells have their common lower globular boundary. For $n = 0$, they are four ordinary vertices. The underlying graph is the tree $y_0 - x_0 - x_1 - y_1$. Thus $B$ is cellular and contractible by Proposition 15.
  #cetz.canvas({
  import cetz.draw: *
  circle((0, 1.7), radius: 0.05, fill: rgb("#000000"))
  circle((4.2, 1.7), radius: 0.05, fill: rgb("#000000"))
  circle((0, 0), radius: 0.05, fill: rgb("#000000"))
  circle((4.2, 0), radius: 0.05, fill: rgb("#000000"))
  line((0, 1.7), (4.2, 1.7), mark: (end: ">"))
  content((2.1, 1.7), [$h$], anchor: "south")
  line((0, 1.7), (0, 0), mark: (end: ">"))
  content((0, 0.85), [$a_0$], anchor: "east")
  line((4.2, 1.7), (4.2, 0), mark: (end: ">"))
  content((4.2, 0.85), [$a_1$], anchor: "west")
  line((0, 0), (4.2, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  content((2.1, 0), [$k$], anchor: "south")
})
  The cylinder on the source $n$-face is already $P_n$. Attach the missing comparison $y_0 arrow.r y_1$, one $\( n + 1 \)$-cell, to supply the cylinder on the target face. Together with the two endpoint disks this is exactly $A_(n + 1)^01$. Hence the natural map to $P_(n + 1)$ factors as
  $ B arrow.r A_(n + 1)^01 arrow.r P_(n + 1) \, $
  where the first map is one $I_(n + 1)$-attachment and the second is the chosen upper completion. It is an upper cellular map between cellular contractible objects, so it is a weak equivalence and splits by Lemma 14. A retraction $P_(n + 1) arrow.r B$, followed by the prescribed map $B arrow.r Y$, solves the lifting problem. This also applies when $q = n + 1$: the missing comparison is a legitimate $I_q$-attachment, and all subsequent required fillers are provided by the same construction. This completes the proof of Proposition 19. ◻
]

=== 4.4 An arbitrary attaching cell <an-arbitrary-attaching-cell>

#proof[
  #emph[Completion of the descending induction.] Let $X$ be cellular in $cal(A)_q$, let $a : D_n arrow.r X$ be arbitrary, and form the algebraic pushout
  $ Y = X product.co_(D_n) D_(n + 1) \, #h(2em) i : X arrow.r Y . $
  The unit on $a$ gives the elementary retraction $r : Y arrow.r X$, with $r i = upright("id")_X$. Because $p_0 : cal(P) X arrow.r X$ lifts every boundary inclusion and $X$ is cellular, there is a map $h : X arrow.r cal(P) X$ with $p_0 h = upright("id")_X$. Set
  $ u = p_1 h : X arrow.r X \, #h(2em) macron(u) = u r : Y arrow.r X . $
  Both endpoints are weak equivalences; thus two-out-of-three first gives $h in cal(W)$ and then $u in cal(W)$. Also $macron(u) i = u$.
  Consider the square
  $ Z Q T 2 T T I K Z 4 quad "(4.15)" $ <eq:partial-path-final-square>
  Naturality and $macron(u) i = u$ give its commutativity explicitly:
  $ \( p_0 \, p_1 \) cal(P) \( i \) h = \( i \, i u \) = \( upright("id")_Y \, i macron(u) \) i . $
  The right-hand map lifts $J_n$ by Proposition 19, so it lifts its pushout $i$. Indeed, restrict the top map along the given $a : D_n arrow.r X$, and restrict the bottom map along the new disk $D_(n + 1) arrow.r Y$. Solve this $J_n$-square; its solution agrees with the original top map on $D_n$, and the actual pushout universal property glues the two maps. This produces $f : Y arrow.r cal(P) Y$ with
  $ p_0 f = upright("id")_Y \, #h(2em) p_1 f = i macron(u) . $
  This use of the pushout requires no condition on the selected cell $a$ beyond being a model morphism from $D_n$. Two-out-of-three again gives
  $ v := i macron(u) in cal(W) . $
  Finally, $i u : X arrow.r Y$ is a retract of $v = i u r : Y arrow.r Y$ in the arrow category. The maps of arrows in the two directions have domain maps $i$ and $r$, respectively, and codomain map $upright("id")_Y$ in both cases. The identities
  $ v i = i u \, #h(2em) \( i u \) r = v \, #h(2em) r i = upright("id")_X $
  verify the two commuting squares and their identity composite. Retract closure gives $i u in cal(W)$, and two-out-of-three with $u in cal(W)$ gives $i in cal(W)$. Every map in this argument is a morphism of the full algebraic models; the conclusion therefore includes all freely generated composites and coherence cells of the pushout, for the arbitrary attaching cell $a$.
  This proves the induction step at $n$. Together with the top case established in the preceding section, descending induction proves the elementary expansion assertion for every index at this fixed cutoff $q$. ◻
]

#proof[
  Return to the original category $cal(A)$, and write $i : X arrow.r Y$ for the pushout in the theorem. Fix an instance of the exact-boundary test in dimension $k$. Choose $q gt.eq max { n + 1 \, k + 1 }$. By Lemma 9, the reflector $R_q$ preserves the cellular presentation of $X$ and the actual pushout defining $Y$. The fixed-cutoff theorem therefore applies to $R_q \( i \)$.
  The reflector preserves all cells through dimension $q$, with their face maps. Consequently the given boundary and target disk are unchanged by reflection. The source disk and its $\( k + 1 \)$-cell homotopy supplied by the fixed-cutoff theorem are also in unchanged dimensions. They are therefore a source disk with the original exact boundary and an actual homotopy in $Y$ before reflection. Proposition 5 proves that $i$ is a weak equivalence. This holds for every $k$, every $n gt.eq 0$, every cellular $X$, and the arbitrary fixed coherator $cal(C)$, as required. ◻
]

== 5 Semi-model structure and the homotopy hypothesis <sec:consequences>

We now apply the expansion theorem to the original category $cal(A) = "Mod" \( cal(C) \)$, without a coskeletal cutoff. The first consequence is the canonical structure of #cite(label("Henry2016")) Theorem 5.3.5. We give its transfer argument explicitly to distinguish cellular objects from their cofibrant retracts.

=== 5.1 The canonical semi-model structure <the-canonical-semi-model-structure>

Recall

$ I = { I_j : partial D_j arrow.r D_j divides j gt.eq 0 } \, #h(2em) J = { J_j : D_j arrow.r D_(j + 1) divides j gt.eq 0 } . $

For a set of maps $K$, write $K upright("-") upright("cof")$ for the maps with the left lifting property against $K upright("-") upright("inj")$.

We use the left semi-model convention in which cofibration–trivial-fibration factorization and lifting hold for all maps. Trivial-cofibration–fibration factorization and lifting are required for maps with cofibrant domain. The proof below verifies these restrictions explicitly.

#prodef([Corollary 5.1.])[
  #emph[For every Grothendieck coherator $cal(C)$, the category $cal(A)$ admits a cofibrantly generated left semi-model structure with 
$ upright("weak equivalences") & = cal(W) \,\
upright("cofibrations") & = I upright("-") upright("cof") \,\
upright("fibrations") & = J upright("-") upright("inj") \,\
upright("trivial fibrations") & = I upright("-") upright("inj") . $

 Here $cal(W)$ is the class defined by components and based homotopy groups. Cofibrant objects are exactly retracts of cellular objects, and every object is fibrant.]
] <cor:semimodel>

#proof[
  Each $J_j$ is a composite of two boundary attachments: an $I_j$-attachment adds the parallel $j$-cell, and an $I_(j + 1)$-attachment adds the cell joining the two. Consequently $J subset I upright("-") upright("cof")$. The lifting calculation of Lemma 8 gives
  $ I upright("-") upright("inj") = cal(W) ∩ J upright("-") upright("inj") . quad "(5.1)" $ <eq:consequences-trivial-fibrations>
  Indeed an $I$-injective map satisfies the exact-boundary test and lifts $J$; conversely, for a weak equivalence lifting $J$, first lift a disk up to one higher homotopy and then lift that homotopy to correct the disk exactly.
  The small object argument for $I$ supplies a weak factorization system
  $ #scale(x: 120%, y: 120%)[\(] I upright("-") upright("cof") \, med I upright("-") upright("inj") #scale(x: 120%, y: 120%)[\)] $
  on all maps. In particular, factoring $diameter arrow.r X$ shows that every cofibrant $X$ is a retract of a cellular object: the cofibrancy of $X$ provides a section of the resulting trivial fibration onto $X$. The converse follows from closure of the left lifting class under retracts.
  Theorem 1 extends from cellular starts to cofibrant starts. To see this explicitly, choose a retract diagram $X arrow.r^u Z arrow.r^v X$, with $v u = upright("id")_X$ and $Z$ cellular. Given $a : D_j arrow.r X$, form the two expansions
  $ X^(+) = X product.co_(D_j \, a) D_(j + 1) \, #h(2em) Z^(+) = Z product.co_(D_j \, u a) D_(j + 1) . $
  The maps $u \, v$, together with the identity on the new $D_(j + 1)$, induce maps $X^(+) arrow.r Z^(+) arrow.r X^(+)$ whose composite is the identity. Thus $X arrow.r X^(+)$ is a retract of $Z arrow.r Z^(+)$ in the arrow category and belongs to $cal(W)$.
  Every relative $J$-cell map with cofibrant domain is therefore a weak equivalence. Cofibrancy is preserved at each stage because every $J_j$ is an $I$-cofibration. At successor stages use the preceding paragraph, and at limit stages use the filtered-colimit closure of $cal(W)$ from Lemma 6. A set of simultaneous attachments can equally be attached in any well-order, so this also covers the coproducts used by the small object argument. The small object argument for $J$ consequently factors every map with cofibrant domain as
  $ X arrow.r^j Z arrow.r^p Y \, #h(2em) j in I upright("-") upright("cof") ∩ cal(W) \, quad p in J upright("-") upright("inj") . $
  As a relative $J$-cell map, $j$ has the left lifting property against every fibration.
  Conversely, let $i : X arrow.r Y$ be an $I$-cofibration and a weak equivalence, with $X$ cofibrant. Apply this factorization to $i$, writing $i = p j$. Two-out-of-three puts $p$ in $cal(W)$, so Equation (5.1) makes $p$ $I$-injective. A lift of $i$ against $p$ exhibits $i$ as a retract of $j$. Hence every trivial cofibration with cofibrant domain lifts against every fibration.
  These are precisely the required factorizations and lifting axioms: cofibration–trivial-fibration factorization and lifting hold without restriction, while trivial-cofibration–fibration factorization and lifting are required for cofibrant domains. Completeness and cocompleteness follow from the algebraic description of $cal(A)$; the retract and two-out-of-three axioms were proved in Lemma 6. Finally, the unit of a $j$-cell extends it along $J_j$. Thus every map $X arrow.r 1$ is $J$-injective, and every object is fibrant. ◻
]

=== 5.2 The comparison with spaces <the-comparison-with-spaces>

We use the cylinder-category comparison established in #cite(label("Henry2016")) Sections 5.1 and 5.3. The relevant implication is all-dimensional and has exactly the expansion assertion as its additional hypothesis. We spell out its application to the fixed coherator.

The comparison first packages finite cellular models and their cylinders into a small category. Its completion recovers all models of the same coherator. Henry’s recognition theorem then identifies that completion with spaces up to Quillen equivalence. The proof below records the hypotheses at each of these three interfaces.

A cylinder category has cofibrations and weak equivalences satisfying #cite(label("Henry2016")) Definition 2.1.1; in particular, it has cofibration pushouts, its weak equivalences satisfy two-out-of-six, every object has a cylinder, and every trivial cofibration retracts. Its completion is the full category of set-valued presheaves taking the initial object to a singleton and cofibration pushouts to pullbacks #cite(label("Henry2016")) Definition 2.4.1.

Here $upright(bold(S p a c e s))$ denotes the usual model category of topological spaces, with weak homotopy equivalences.

#prodef([Corollary 5.2.])[
  #emph[For every Grothendieck coherator $cal(C)$, the canonical semi-model category $"Mod" \( cal(C) \)$ is Quillen equivalent to spaces. More precisely, there is a geometric-realization/fundamental- infinity-groupoid adjunction 
$ \| - \| : "Mod" \( cal(C) \) med arrows.rl med upright(bold(S p a c e s)) : Pi_oo $

 which is a Quillen equivalence. In particular, 
$ "Mod" \( cal(C) \) \[ cal(W)^(- 1) \] tilde.eq "Ho" \( upright(bold(S p a c e s)) \) . $

 Thus the Grothendieck homotopy hypothesis holds for these groupoids.]
] <cor:homotopy-hypothesis>

#proof[
  Let $cal(A)_(upright("fin"))$ be a small skeleton of the full subcategory of finitely cellular $cal(C)$-groupoids, with finite boundary-cell extensions as cofibrations and the restriction of $cal(W)$ as weak equivalences. Henry’s comparison uses the following three facts.
  First, under the expansion assertion, $cal(A)_(upright("fin"))$ is a cylinder category #cite(label("Henry2016")) Proposition 5.3.6. The finite nature of its cylinders is explicit: a relative cylinder for the generating cofibration $partial D_j arrow.r D_j$ is
  $ D_j product.co_(partial D_j) D_j arrow.r D_(j + 1) arrow.r D_j . $
  The first map is $I_(j + 1)$, and the source endpoint is $J_j$; the last map is induced by a unit. The source endpoint is a weak equivalence by Theorem 1, and hence so is the last map. Finite relative cylinders are obtained by the finite cell induction of that proposition. Trivial cofibrations in this category have retractions by Corollary 20, since their domains are cofibrant and all objects are fibrant.
  Second, the free construction of the original coherator identifies the completion of $cal(A)_(upright("fin"))$ with $"Mod" \( cal(C) \)$, equipped with precisely the structure in Corollary 20 #cite(label("Henry2016")) Proposition 5.3.7. In this construction one begins with finite globular sets and adjoins the operations in the given free order of $cal(C)$. Thus the identification retains the chosen theory and its actual algebraic models. The generating cofibrations in the completion are the $I_j$, and its generating trivial cofibrations are the relative-cylinder endpoints $J_j$.
  Third, the marked object $D_0$ makes $cal(A)_(upright("fin"))$ a cylinder coherator #cite(label("Henry2016")) Corollary 5.3.12. In Henry’s terminology this means that the map from the free pre-cylinder category $F_(*)$ on one object, selecting $D_0$, is a trivial cofibration and that the target is a cylinder category #cite(label("Henry2016")) Definition 5.1.1. The hypotheses used in this implication are the free cellular construction of $cal(C)$, the expansion assertion, and the homotopical terminality of $D_0$. The first is part of Definition 2, the second is Theorem 1, and the third follows here also from Proposition 12: the map $D_0 arrow.r 1$ is $I$-injective by the boundary-filling characterization of contractibility. Every map $A arrow.r D_0$ therefore extends across every finite cellular cofibration $A arrow.r B$; this gives homotopical terminality inside $cal(A)_(upright("fin"))$. More explicitly, the projection $p : cal(A)_(upright("fin"))^(D_0) arrow.r cal(A)_(upright("fin"))$ in Henry’s construction is an acyclic fibration by #cite(label("Henry2016")) Proposition 4.4.4.#footnote[The phrase “trivial cofibration” for this projection in the proof of #cite(label("Henry2016")) Lemma 5.3.11 is a typographical error; Proposition 4.4.4 gives an acyclic fibration.] The relative cofibrancy of $F_(*) arrow.r cal(A)_(upright("fin"))$ from #cite(label("Henry2016")) Proposition 5.3.7 therefore gives a section of $p$ sending the marked $D_0$ to its cylinder $\( D_0 \, D_1 \)$. The lifting argument of #cite(label("Henry2016")) Lemma 5.3.9 then gives the asserted cylinder-coherator property, as in #cite(label("Henry2016")) Lemma 5.3.11 and Corollary 5.3.12.
  Henry’s Theorem 5.1.2(5) now gives a fundamental-infinity-groupoid right Quillen equivalence from spaces to this completion, with geometric realization as its left adjoint. By the second step the completion is the original $"Mod" \( cal(C) \)$ with its canonical weak equivalences. This proves the displayed statements and is the implication summarized in #cite(label("Henry2016")) Corollary 5.3.13. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
