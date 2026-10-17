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

#align(center)[#text(size: 16pt, weight: "bold")[A CH obstruction to a prescribed categoricity threshold]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Categoricity asks whether a class has exactly one model of a given cardinality, up to isomorphism. For an abstract elementary class $K$, write $I \( K \, kappa \)$ for the number of isomorphism types of its models of cardinality $kappa$, and $"LS" \( K \)$ for its Löwenheim–Skolem number. Thus categoricity in $kappa$ means $I \( K \, kappa \) = 1$. Put

#[#set math.equation(numbering: n => "(1.1)")
 $ h \( kappa \) = ℶ_(\( 2^kappa \)^(+)) \, #h(2em) H \( K \) = h \( "LS" \( K \) \) . $ <eq:hanf-function>]

Here cardinal successors are identified with their initial ordinals when used as beth indices, and the beth hierarchy starts at $ℶ_0 = ℵ_0$. All structures and index sets are set-sized, all languages are finitary, and categoricity includes existence. The AEC axioms are recalled in Section 3.

=== 1.1 The prescribed threshold and the result <the-prescribed-threshold-and-the-result>

For complete first-order theories in a countable language, Morley’s categoricity theorem transfers categoricity from one uncountable cardinal to every uncountable cardinal #cite(label("Morley1965")). Abstract elementary classes retain a coherent notion of strong substructure and closure under increasing unions while allowing classes that are not axiomatized by a first-order theory. Shelah introduced this framework in the mid-1970s for classes of models in infinitary logics #cite(label("BoneyVasey2017Survey")) Section 2. His categoricity questions for abstract elementary classes have both qualitative and quantitative forms. Qualitative eventual categoricity asks for a cardinal $chi \( kappa \)$, depending only on the infinite cardinal $kappa$, such that, whenever $"LS" \( K \) lt.eq kappa$, categoricity in some $lambda gt.eq chi \( kappa \)$ implies categoricity in every $mu gt.eq chi \( kappa \)$. The prescribed-threshold form asks for the particular bound in (1.1):

#[#set math.equation(numbering: n => "(1.2)")
 $ upright("If ") K upright(" is categorical in some ") lambda gt.eq H \( K \) upright(",")\
upright("then it is categorical in every ") mu gt.eq H \( K \) upright(".") $ <eq:target>]

No amalgamation, joint embedding, tameness, or absence of maximal models is assumed here. The exact formulation, with both endpoints included, appears in the discussion of the general conjecture in #cite(label("SarochTrlifaj2024")) Section 2.3.

The number $H \( K \)$ is a general existence bound: a model at that size gives arbitrarily large models by the presentation and Ehrenfeucht–Mostowski methods; see #cite(label("Shelah1999CategoricityAP")) Claim 0.6. Existence alone does not assert uniqueness or that every given model extends to arbitrarily large ones. Categoricity transfers in the literature obtain stronger conclusions under structural assumptions. For example, amalgamation and $"LS" \( K \)$-tameness yield transfer from a successor categoricity cardinal at least $H \( K \)$ down to $H \( K \)$ and throughout the tail #cite(label("Vasey2017Downward")) Corollary 9.10. The distinction between these assumptions and the bare AEC axioms is essential for the construction below.

The distinction between a prescribed bound and an unspecified uniform threshold is already explicit in Grossberg’s discussion of the two forms of the conjecture #cite(label("Grossberg2021Draft")) Chapter 2, Section 4, Conjectures 4.4–4.6. There the possible failure of the prescribed bound is considered separately from eventual categoricity. A transfer at the prescribed bound for arbitrary AECs is claimed in #cite(label("Espindola2023Spectra")) Theorem 4.1. The CH construction below has the opposite conclusion at that bound. Its proof therefore includes explicit verification of all AEC axioms, as well as separate arguments for the endpoint models and for the higher categoricity tail. Section 7 also identifies a specific obstruction to the canonical-point step in the cited proof: on the countable-model site, a dense cosieve need not be lifted by a large categorical model. The comparison concerns that specific factorization, not alternative constructions of points.

#thm([Theorem 1.1.])[
  #emph[Assume the continuum hypothesis. There is an abstract elementary class $K$ in a countable finitary relational language such that]
  + #emph[$"LS" \( K \) = ℵ_0$;]
  + #emph[$K$ has at least two nonisomorphic models of cardinality $ℶ_(omega_2) = H \( K \)$;]
  + #emph[putting $Lambda = ℶ_(\( 2^(ℵ_1) \)^(+))$, the class $K$ is categorical in every cardinal $mu gt.eq Lambda$.]
  #emph[In particular, $lambda = Lambda^(+) > H \( K \)$ is a categoricity cardinal from which downward transfer to $H \( K \)$ fails.]
] <thm:main>

Theorem 1 refutes the prescribed-threshold transfer under CH. Combining the construction with Gödel’s relative consistency of CH gives the corresponding conditional nonprovability statement; Corollary 34 states it with a precise first-order formulation. The same class is categorical on the higher tail beginning at $Lambda$, so the obstruction is compatible with qualitative eventual categoricity. The construction and both cardinal bounds are proved here without a qualitative eventual-categoricity theorem.

=== 1.2 The mechanism of the construction <the-mechanism-of-the-construction>

There are two principal sorts. The index sort $I$ controls the size of the model. The base sort $B$ is a dense linear order without endpoints whose bounded intervals are countable; hence $\| B \| lt.eq ℵ_1$. For each nonempty finite ordered tuple of distinct entries from $I$, the structure has row fibers indexed by $omega$ and column fibers indexed by $B$. A row fiber is a torsor for $\[ B \]^(< omega)$, and a column fiber for $\[ omega \]^(< omega)$, with symmetric difference as addition: choosing an origin identifies a fiber with its group, but no origin is named in the language. Choosing one point in each fiber displays the bit relation as an $omega$-by-$B$ matrix. Changing row origins alters finitely many entries in each row, and changing column origins alters finitely many entries in each column.

When $B$ is countable, these changes absorb every matrix of bits. All models in $K$ with countable base orders and equally sized index sorts are therefore isomorphic. When $B$ is uncountable, the matrix retains a family of colors in $2^omega \/ =^(*)$, the quotient of binary sequences by equality outside a finite set. These colors are meaningful outside a countable set of columns. We impose tests on them, separately for each tuple. The tests describe countable extensional relations whose rank labels lie below $omega_1$.

In the following overview, $V_alpha$ denotes the ordinary cumulative hierarchy of sets. The technical features can be summarized as follows.

+ #emph[Exceptions compatible with strong substructure.] An object may have countably many exceptional columns for each tuple. A strong inclusion requires every newly added column to pass the tests on old tuples. Finite row supports make these outside tests exactly independent of old choices of origins. This permits both small strong submodels and arbitrary directed unions, including smoothness.
+ #emph[Local rank approximation.] An $omega_2$-long sequence of functions $omega_1 arrow.r omega_1$, increasing modulo countable sets, lets countable membership diagrams drawn from $V_(omega_2)$ pass the rank tests at all but countably many coordinates. This produces the model of size $ℶ_(omega_2)$ with uncountable $B$.
+ #emph[An obstruction to large index sets.] A fixed coherent pattern for every finite arity would give arbitrarily large extensional structures with ranks below $omega_1$, contradicting their collapse into $V_(omega_1)$. A finite partition argument and an unbounded-sample selection produce such a pattern if $\| I \| gt.eq Lambda$ and $B$ is uncountable.

Finite-support groups, torsors with no named origins, and parity relations have a close predecessor in the Hart–Shelah examples #cite(label("HartShelah1990")) Section 1. Their canonical structures also use binary-sequence colors modulo finitely supported sequences, $2^omega \/ 2^(< omega)$, the same quotient as eventual equality #cite(label("HartShelah1990")) Section 3. The present construction couples finite row and column translations with a locally countable base order; the surviving colors encode the extensional rank diagrams needed for the endpoint obstruction. Allowed finite color diagrams and ranks also play a central role in the coloring classes studied by Kolesnikov and Lambie-Hanson #cite(label("KolesnikovLambieHanson2016")). Here the encoded diagrams are countable, and the full-subsequence tests supply the exact compatibility used in their limit.

The first mechanism separates the invariance needed for objects from the exact invariance needed for extensions. The last two mechanisms compare local approximations, with different exceptional sets, to one global pattern. Their proofs are given explicitly; in particular, no infinite homogeneous subset is assumed.

Section 2 defines the diagram tests. Section 3 constructs the AEC and verifies all its axioms. Section 4 constructs the two endpoint models. Section 5 proves the fixed-pattern obstruction, uses it to bound models with uncountable base, and then establishes categoricity on the tail. Section 6 combines the results and explains the failure of amalgamation and joint embedding. Section 7 proves the dense-cosieve obstruction and makes the precise comparison with the cited topos argument.

=== 1.3 Conventions <conventions>

The construction in Sections 2–5 is carried out in ZFC with CH. Throughout those sections,

#[#set math.equation(numbering: n => "(1.3)")
 $ delta = omega_1 \, #h(2em) eta = delta^(+) = omega_2 \, #h(2em) S = 2^omega \/ =^(*) \, #h(2em) xi = 2^delta \, #h(2em) Lambda = ℶ_(xi^(+)) . $ <eq:standing-cardinals>]

The relation $=^(*)$ means equality except at finitely many natural numbers. “Countable” includes finite, and “tuple” in the color tests always means a nonempty finite ordered tuple with distinct entries. Subsequences preserve the order of the remaining positions. The hierarchy $V_alpha$ is the ordinary cumulative hierarchy of sets; it is unrelated to the model sorts. We use choice for set-indexed families only.

== 2 Countable diagrams and their tests <sec:colors>

The construction uses colors that encode countable diagrams with ordinal tags. A finite tuple passes a test when its diagram and all subsequence diagrams are valid and agree exactly on their shared labels. These tests will define the object condition in Section 3; the endpoint construction will realize them outside a tuple-dependent countable set of coordinates.

Restrictions and ranks of finite color patterns also occur in coloring classes #cite(label("KolesnikovLambieHanson2016")) Definitions 1.1–1.7. There the rank measures extensions of finite monochromatic diagrams. Here ordinal tags are assigned to the elements of countable extensional relations, and the tests require exact agreement under restriction.

Throughout the construction we work in ZFC with CH and put $delta = omega_1$. For $a \, a' in 2^omega$, write $a =^(*) a'$ if ${ n < omega : a \( n \) eq.not a' \( n \) }$ is finite, and set

$ S = 2^omega \/ =^(*) . $

The quotient here is a set of colors; its elements will later be realized by binary sequences in structures.

=== 2.1 Diagrams, codes, and restrictions <diagrams-codes-and-restrictions>

For a positive integer $k$, write $\[ k \] = { 1 \, dots.h \, k }$ and let

$ cal(L)_k = { \( J \, i \) : diameter eq.not J subset.eq \[ k \] \, med i < omega } . $

The set $cal(L)_k$ is countably infinite. A label records a nonempty set of tuple positions and an integer coordinate.

#prodef([Definition 2.1.])[
  (Valid diagrams).  An #emph[arity-$k$ diagram] is a triple $cal(D) = \( E \, R \, rho \)$, where $E \, R$ are binary relations on $cal(L)_k$ and $rho : cal(L)_k arrow.r delta$. It is #emph[valid] if the following conditions hold.
  + $E$ is an equivalence relation. The relation $R$ and the tags respect $E$: whenever $a E a'$ and $b E b'$,
    $ a R b med arrow.l.r.double med a' R b' \, #h(2em) rho \( a \) = rho \( a' \) . $
  + On the quotient $Q_(cal(D)) = cal(L)_k \/ E$, use $R$ and $rho$ also for the induced relation and tag function. They satisfy
    $ y R x med arrow.r.double med rho \( y \) < rho \( x \) . $
    The relation $R$ is extensional: distinct $x \, x' in Q_(cal(D))$ have different predecessor sets
    $ { y in Q_(cal(D)) : y R x } quad upright("and") quad { y in Q_(cal(D)) : y R x' } . $
  + The labels $\( { j } \, 0 \)$, for $j in \[ k \]$, lie in pairwise distinct $E$-classes.
] <col:diagram>

Let $frak(D)_k$ be the set of all arity-$k$ diagrams, including the invalid ones.

#thm([Lemma 2.2.])[
  (Coding).  #emph[There are injections 
$ iota_k : frak(D)_k arrow.r S #h(2em) \( k gt.eq 1 \) $

 whose ranges are pairwise disjoint.]
] <col:coding>

#proof[
  Each $=^(*)$-class is countable: its members are obtained by changing the values of one sequence on finitely many integers. If $kappa = \| S \|$, choice therefore gives
  $ 2^(ℵ_0) lt.eq kappa dot.op ℵ_0 . $
  The quotient cannot be countable, since then $2^omega$ would be countable. Infinite cardinal multiplication and the reverse inequality $kappa lt.eq 2^(ℵ_0)$ now give $\| S \| = 2^(ℵ_0)$.
  For each $k$, there are at most $2^(ℵ_0)$ choices for each of $E$ and $R$. By CH,
  $ delta^(ℵ_0) = \( 2^(ℵ_0) \)^(ℵ_0) = 2^(ℵ_0) \, $
  so there are at most continuum many choices for $rho$ as well. It follows that
  $ lr(|product.co_(k gt.eq 1) frak(D)_k|) lt.eq ℵ_0 dot.op 2^(ℵ_0) = \| S \| . $
  An injection from this disjoint union into $S$ gives the stated maps. ◻
]

Fix such coding maps for the remainder of the proof. A color in the range of $iota_k$ uniquely decodes to an arity-$k$ diagram. A color outside that range is not a code of the required arity. The coding maps are fixed set parameters in the definition of the class, not symbols of its language. Allowing codes for invalid diagrams will let us assign colors at exceptional coordinates.

We next specify restriction, including its position reindexing. If $diameter eq.not J subset.eq \[ k \]$, enumerate $J = { j_1 < dots.h.c < j_m }$ and define

$ ell_J : cal(L)_m arrow.r cal(L)_k \, #h(2em) ell_J \( U \, i \) = \( { j_u : u in U } \, i \) . $

For an arity-$k$ diagram $cal(D)$, its restriction $cal(D) harpoon.tr J$ is the arity-$m$ diagram obtained by pulling back both relations and the tag function along $ell_J$. Thus it retains exactly those labels whose position sets are contained in $J$. In particular, for $diameter eq.not U subset.eq \[ m \]$,

#[#set math.equation(numbering: n => "(2.1)")
 $ \( cal(D) harpoon.tr J \) harpoon.tr U = cal(D) harpoon.tr { j_u : u in U } . $ <col:restriction-composition>]

Validity of a diagram does not by itself guarantee extensionality of a restriction; the tests below require validity of every constituent diagram separately.

#prodef([Definition 2.3.])[
  (The full subsequence test).  Given $k gt.eq 1$ and colors $\( s_J : diameter eq.not J subset.eq \[ k \] \)$, let
  $ T_k #scale(x: 120%, y: 120%)[\(] \( s_J \)_J #scale(x: 120%, y: 120%)[\)] $
  mean that both of the following conditions hold.
  + For every nonempty $J subset.eq \[ k \]$, the color $s_J$ decodes under $iota_(\| J \|)$ to a valid diagram $cal(D)_J$.
  + For every nonempty $J subset.eq \[ k \]$,
    $ cal(D)_J = cal(D)_(\[ k \]) harpoon.tr J . $
  For an ordered tuple $t = \( x_1 \, dots.h \, x_k \)$ of distinct elements, write $t harpoon.tr J = \( x_(j_1) \, dots.h \, x_(j_m) \)$. Colors attached to $t$ and its nonempty subsequences pass the test when $T_k \( \( s_(t harpoon.tr J) \)_J \)$ holds.
] <col:test>

The order in this definition is the order of the tuple positions. It requires no order on the set from which tuple entries are chosen. Equation (2.1) shows that agreement with the full diagram implies agreement between every two nested subsequences.

#thm([Lemma 2.4.])[
  (Maps between quotient diagrams).  #emph[Suppose the test in Definition 4 passes. If $diameter eq.not J subset.eq \[ k \]$, then the label map $ell_J$ induces an injective map 
$ Q_(cal(D)_J) arrow.r Q_(cal(D)_(\[ k \])) . $

 This map preserves tags and preserves and reflects $R$. The quotient maps for nested subsequences compose.]
] <col:quotients>

#proof[
  Write $cal(D)_J = \( E_J \, R_J \, rho_J \)$. The equality $cal(D)_J = cal(D)_(\[ k \]) harpoon.tr J$ gives, for labels $a \, b in cal(L)_(\| J \|)$,
  $ a E_J b med arrow.l.r.double med ell_J \( a \) E_(\[ k \]) ell_J \( b \) . $
  The forward implication makes the quotient map well-defined, and the reverse implication makes it injective. The analogous equivalence for $R$ proves preservation and reflection of the quotient relation; equality of the restricted tag functions proves preservation of tags. The maps on labels compose by their definition, so the induced quotient maps do also. ◻
]

The tests permit the tuple-dependent diagrams constructed in Section 4. They do not permit one fixed color $s_j$ for each arity $j$ such that $T_k \( \( s_(\| J \|) \)_(diameter eq.not J subset.eq \[ k \]) \)$ holds for every $k gt.eq 1$. Lemma 25 will prove this obstruction; it is the ingredient that later bounds models with uncountable base.

== 3 The abstract elementary class <sec:aec>

We now turn the tests of Section 2 into a class of structures. The distinction between the object condition and the strong substructure condition is essential: objects allow countably many bad coordinates for each tuple, whereas a strong extension must introduce no bad coordinate for an old tuple outside the old base order.

=== 3.1 The axioms and the basic structures <the-axioms-and-the-basic-structures>

#prodef([Definition 3.1.])[
  (Abstract elementary class).  An #emph[abstract elementary class] is a pair $K = \( cal(C) \, lt.eq_K \)$, where $cal(C)$ is a class of set-sized structures in one fixed set-sized finitary language $tau$, and $lt.eq_K$ is a partial order on $cal(C)$, with the following properties. Write $\| M \|$ for a structure’s underlying set and $parallel M parallel$ for its cardinality.
  + #emph[Isomorphisms and substructures.] The class is closed under $tau$-isomorphisms; $M lt.eq_K N$ implies that $M$ is a $tau$-substructure of $N$; and if $f : N tilde.equiv N'$ and $M lt.eq_K N$, then $f \[ M \] lt.eq_K N'$.
  + #emph[Coherence.] If $M_0$ is a $tau$-substructure of $M_1$, and $M_0 lt.eq_K M_2$ and $M_1 lt.eq_K M_2$, then $M_0 lt.eq_K M_1$.
  + #emph[Unions and smoothness.] For every nonzero ordinal $gamma$ and every increasing chain $\( M_i : i < gamma \)$ under $lt.eq_K$, its union $U$ belongs to $cal(C)$, and $M_i lt.eq_K U$ for all $i < gamma$. If also $M_i lt.eq_K N$ for every $i < gamma$, where $N in cal(C)$, then $U lt.eq_K N$.
  + #emph[Downward Löwenheim–Skolem property.] There is an infinite cardinal $theta gt.eq \| tau \| + ℵ_0$ such that, for every $M in cal(C)$ and every $A subset.eq \| M \|$, there exists $N lt.eq_K M$ with $A subset.eq \| N \|$ and $parallel N parallel lt.eq \| A \| + theta$.
  The least such infinite cardinal $theta$ is denoted by $"LS" \( K \)$.
] <aec:definition>

We will prove the union and common-upper-bound assertions directly for every nonempty set-indexed directed family of strong substructures. This in particular proves all the chain assertions in Definition 6, with no restriction on the chain’s cofinality.

For a nonempty set $I$, let $cal(T) \( I \)$ be the set of all nonempty finite ordered tuples of distinct members of $I$. If $t = \( a_1 \, dots.h \, a_k \)$ and $diameter eq.not J subset.eq \[ k \]$, write $t harpoon.tr J$ for the subsequence in the original order. No order is placed on the sort $I$.

Finite-support groups and torsors also occur in the Hart–Shelah construction #cite(label("HartShelah1990")) Section 1; see also #cite(label("BoneyVasey2018HartShelah")) Definition 3.1 and Fact 3.2. We specify two families of torsors, one for rows and one for columns, and the precise finite-support action on their common bit relation.

#prodef([Definition 3.2.])[
  (Basic structures).  A basic structure has the following data, with pairwise disjoint underlying carriers.
  + A nonempty set $I$, and a nonempty dense linear order $B$ without endpoints in which every bounded interval is countable.
  + A group sort $G \( B \)$ coding $\[ B \]^(< omega)$ under symmetric difference. More precisely, an incidence relation determines a bijection
    $ "supp" : G \( B \) arrow.r \[ B \]^(< omega) \, #h(2em) "supp" \( u + u' \) = "supp" \( u \) triangle.stroked.t "supp" \( u' \) . $
    There is also a group sort $G_(*)$ identified, by a separate unary singleton label for each of its elements, with $\[ omega \]^(< omega)$ under symmetric difference. These labels exhaust $G_(*)$.
  + For each $t in cal(T) \( I \)$ and $n < omega$, a nonempty set $Z_(t \, n)$ with a free transitive action of $G \( B \)$. For each $t in cal(T) \( I \)$ and $b in B$, a nonempty set $W_(t \, b)$ with a free transitive action of $G_(*)$. We write both actions additively. Thus each element of a fiber is obtained uniquely by translating any one chosen element of that fiber.
  + A binary relation on row and column points, written as its indicator $e \( z \, w \) in { 0 \, 1 }$. It can hold only when the row and column have the same tuple $t$. On these pairs it satisfies
    #[#set math.equation(numbering: n => "(3.1)")
     $ e \( z + u \, w + v \) = e \( z \, w \) + bold(1)_(b in "supp" \( u \)) + bold(1)_(n in v) med \( mod med 2 \) $ <aec:bit>]
    for $z in Z_(t \, n)$, $w in W_(t \, b)$, $u in G \( B \)$, and $v in G_(*)$. In the last term $v$ is read through its fixed finite-subset label. Here $bold(1)_P$ is $1$ when $P$ holds and $0$ otherwise.
  The domain consists exactly of the listed carriers. There are no additional relations or distinguished representatives.
] <aec:basic>

Here is an explicit countable finitary relational language for these data. Use unary predicates for $I \, B \, G \( B \) \, G_(*)$, for each carrier

$ Z_(k \, n) = union.big_(t in cal(T) \( I \)\
\| t \| = k) Z_(t \, n) quad \( k gt.eq 1 \, med n < omega \) \, #h(2em) W_k = union.big_(t in cal(T) \( I \)\
\| t \| = k \, med b in B) W_(t \, b) \, $

and for each singleton label in $G_(*)$. The carrier predicates, excluding the labels within $G_(*)$, partition the domain. For each $k \, n$, a $\( k + 1 \)$-ary projection graph associates a row point with its $k$ tuple entries. For each $k$, a $\( k + 2 \)$-ary projection graph associates a column point with its tuple entries and its coordinate $b$. These projections are semantically total and single-valued on their carriers, have distinct tuple coordinates in $I$, and have exactly the nonempty fibers required in Definition 7. A carrier may be empty if there are no tuples of its length.

Use binary relations for the order, finite-set incidence, and the bit relation, and ternary graphs for group operations and the two actions. Every operation and action is semantically total on its stated domain. Operation graphs give precisely the specified groups; action graphs preserve the indicated fibers and give precisely the free transitive actions. There are no relation instances outside these specified types. In particular, bits between different tuple fibers are zero. This last requirement rules out any unspecified structure linking different tuples.

All the symbols just listed are indexed by countable sets, and each has finite arity. The language is therefore countable and finitary. Using operation graphs is harmless: in an inclusion of induced relational substructures, a graph triple already in the smaller object remains in the larger one. Semantic uniqueness in the larger object forces it to give the same operation or action value on the old arguments. The smaller object’s semantic totality supplies the needed closure on those arguments.

The fixed coding maps and tests from Section 2 are set parameters in the definition of the class, not additional language symbols. Neither the countability restrictions nor the condition using these tests needs to be first-order expressible.

#prodef([Definition 3.3.])[
  (Basic inclusion).  For basic structures $M_0 \, M_1$, write $M_0 prec.curly.eq_(upright(b)) M_1$ if $M_0$ is an induced $tau$-substructure of $M_1$, and the following further conditions hold:
  + $G_(*)^(M_0) = G_(*)^(M_1)$ as underlying sets;
  + $B^(M_0)$ is a convex suborder of $B^(M_1)$;
  + for every $u in G \( B \)^(M_0)$, $"supp"^(M_1) \( u \) = "supp"^(M_0) \( u \)$.
  All inclusions here and below allow equality.
] <aec:basic-inclusion>

Condition (iii) forbids an old finite-set code from acquiring new members in the larger base order. Since support gives a bijection onto finite subsets in both objects, this condition makes the old group exactly the naturally included copy of $\[ B^(M_0) \]^(< omega)$ in $\[ B^(M_1) \]^(< omega)$. The group elements themselves may have arbitrary underlying codes. Basic inclusions compose: induced substructures, convexity, equality of $G_(*)$, and support preservation each compose.

#thm([Lemma 3.4.])[
  (Size of the base order).  #emph[Every order $B$ in a basic structure has cardinality at most $ℵ_1$.]
] <aec:order-size>

#proof[
  Fix $p in B$. If the final segment above $p$ has a countable cofinal subset, its cardinality is countable: it is covered by countably many bounded intervals with one endpoint $p$, together with their endpoints. Otherwise one can recursively choose a strictly increasing sequence $\( b_alpha : alpha < omega_1 \)$ above $p$. At each stage there are only countably many earlier choices, so the assumption that no countable set is cofinal provides a point above all of them. This sequence must be cofinal above $p$. A point above the whole sequence would enclose uncountably many $b_alpha$’s in a bounded interval, contrary to local countability. The final segment is therefore covered by at most $ℵ_1$ countable bounded intervals and their endpoints. It has size at most $ℵ_1$. The same argument in the reversed order applies below $p$, proving the claim. ◻
]

#thm([Lemma 3.5.])[
  (Size of a basic structure).  #emph[For every basic structure $M$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ parallel M parallel = max #scale(x: 120%, y: 120%)[\(] \| I^M \| \, \| B^M \| \, ℵ_0 #scale(x: 120%, y: 120%)[\)] . $ <aec:size-equation>]

]
] <aec:size>

#proof[
  The right-hand side is a lower bound, since $I \, B \, G_(*)$ are sorts and $G_(*)$ is countably infinite. For the upper bound put $kappa = max \( \| I \| \, \| B \| \, ℵ_0 \)$. There are at most $kappa$ finite injective tuples over $I$. The order $B$ is infinite, so $\| G \( B \) \| = \| B \|$; hence every row fiber has size $\| B \|$, and every column fiber has size $\| G_(*) \| = ℵ_0$. There are at most $kappa$ row fibers, indexed by $cal(T) \( I \) times omega$, and at most $kappa$ column fibers, indexed by $cal(T) \( I \) times B$. All the carriers together consequently have size at most $kappa$. ◻
]

=== 3.2 Colors, objects, and strong inclusions <colors-objects-and-strong-inclusions>

A #emph[row-choice system] in a basic structure is a family $upright(bold(z)) = \( z_(t \, n) : t in cal(T) \( I \) \, thin n < omega \)$ with $z_(t \, n) in Z_(t \, n)$. Such systems exist by choice, since the structure and the indexing set are set-sized. For $b in B$ define

#[#set math.equation(numbering: n => "(3.3)")
 $ c_t^(upright(bold(z))) \( b \) = #scale(x: 120%, y: 120%)[\[] \( e \( z_(t \, n) \, w \) \)_(n < omega) #scale(x: 120%, y: 120%)[\]]_(=^(*)) in S \, #h(2em) w in W_(t \, b) . $ <aec:color>]

#thm([Lemma 3.6.])[
  (Representative independence).  #emph[The color in (3.3) is independent of $w$. If $upright(bold(z)) \, upright(bold(z))'$ are two row-choice systems, then, for each fixed $t$, their colors $c_t^(upright(bold(z))) \( b \)$ and $c_t^(upright(bold(z))') \( b \)$ agree outside a countable subset of $B$. The full subsequence test for a fixed tuple therefore has the same truth value for the two systems outside a countable set.]
  #emph[More strongly, suppose $M_0 prec.curly.eq_(upright(b)) M_1$. For a tuple in $cal(T) \( I^(M_0) \)$ and a point $b in B^(M_1) \\ B^(M_0)$, compute colors in $M_1$ using row representatives from $M_0$. These colors are independent of every such row choice, with no exceptional coordinates.]
] <aec:representatives>

#proof[
  Two column representatives differ by a translator $v in G_(*)$. Equation (3.1) changes their binary sequences only at the finitely many indices in $v$, so their classes modulo $=^(*)$ agree.
  For a fixed tuple $t$, write $z'_(t \, n) = z_(t \, n) + u_(t \, n)$, with $u_(t \, n) in G \( B \)$. Put
  $ D_t = union.big_(n < omega) "supp" \( u_(t \, n) \) . $
  Each support is finite, so $D_t$ is countable. At every $b in.not D_t$, all coordinates of the two bit sequences are identical when computed with the same column representative. The full test for a tuple of length $k$ involves just its $2^k - 1$ nonempty subsequences. Outside the union of their sets $D_(t harpoon.tr J)$, all its input colors agree, proving the test assertion.
  In the last assertion, the translators between two old representatives belong to $G \( B \)^(M_0)$. Their supports in $M_1$ are still subsets of $B^(M_0)$, by basic inclusion. At any $b$ outside $B^(M_0)$, Equation (3.1) therefore leaves every individual bit unchanged. This proves the stronger assertion. ◻
]

For a row-choice system $upright(bold(z))$ and a tuple $t = \( a_1 \, dots.h \, a_k \)$, let

#[#set math.equation(numbering: n => "(3.4)")
 $ E_t \( upright(bold(z)) \) = {b in B : not T_k #scale(x: 120%, y: 120%)[\(] \( c_(t harpoon.tr J)^(upright(bold(z))) \( b \) \)_(diameter eq.not J subset.eq \[ k \]) #scale(x: 120%, y: 120%)[\)]} \, $ <aec:bad-set>]

where $T_k$ is the full subsequence test of Definition 4.

#prodef([Definition 3.7.])[
  (Objects and strong substructures).  A basic structure is an #emph[object] if $E_t \( upright(bold(z)) \)$ is countable for every $t in cal(T) \( I \)$, for one, equivalently every, row-choice system $upright(bold(z))$. Let $cal(C)$ be the class of objects.
  For $M_0 \, M_1 in cal(C)$, declare $M_0 lt.eq_K M_1$ if $M_0 prec.curly.eq_(upright(b)) M_1$, and, for every $t in cal(T) \( I^(M_0) \)$ and every $b in B^(M_1) \\ B^(M_0)$, the full test for $t$ passes when its colors in $M_1$ are computed using row representatives in $M_0$, for $t$ and all its nonempty subsequences. Put $K = \( cal(C) \, lt.eq_K \)$.
] <aec:objects>

Both formulations are well-defined by Lemma 11. The exceptional set in the object condition is allowed to depend on $t$; no single countable set is required to work for all tuples. In a strong inclusion, there are no exceptions among the new base-order points.

#thm([Lemma 3.8.])[
  (Free realization of bit arrays).  #emph[Let $I eq.not diameter$, and let $B$ be an order satisfying Definition 7(a). For every family of binary sequences $\( a_(t \, b) in 2^omega : t in cal(T) \( I \) \, thin b in B \)$, there is a basic structure whose index and base sorts are disjoint copies of $I$ and $B$, with row-choice colors, under these identifications, 
$ c_t \( b \) = \[ a_(t \, b) \]_(=^(*)) . $

 If $B$ is countable, every basic structure with base sort $B$ is an object.]
] <aec:arrays>

#proof[
  Replace $I$ and $B$ by disjoint copies and transport the array indices along these identifications. Use separate disjoint copies for the two group sorts as well. Take tagged, disjoint copies of the appropriate groups for all the fibers. Denote the row points by $\( t \, n \, u \)$ for $u in \[ B \]^(< omega)$, and the column points by $\( t \, b \, v \)$ for $v in \[ omega \]^(< omega)$; the tags distinguish the carrier types. Use the regular translation actions and put
  #[#set math.equation(numbering: n => "(3.5)")
   $ e \( \( t \, n \, u \) \, \( t \, b \, v \) \) = a_(t \, b) \( n \) + bold(1)_(b in u) + bold(1)_(n in v) med \( mod med 2 \) . $ <aec:array-realization>]
  Set bits between different tuples to zero, and equip the carriers with exactly the specified projections and other relations. Translation by symmetric difference gives (3.1). The zero row representatives and a zero column representative give the sequence $a_(t \, b)$, as required. Finally, when $B$ is countable, each set $E_t \( upright(bold(z)) \) subset.eq B$ is countable automatically. ◻
]

=== 3.3 Isomorphisms, the partial order, and coherence <isomorphisms-the-partial-order-and-coherence>

#thm([Lemma 3.9.])[
  #emph[The class and strong relation are isomorphism invariant, $lt.eq_K$ is a partial order whose comparisons are induced substructure inclusions, and coherence holds.]
] <aec:order-coherence>

#proof[
  All the basic conditions are preserved by a $tau$-isomorphism, so the isomorphic image of a basic structure is basic. Now consider an isomorphism of basic structures. It preserves the carrier predicates, every row number $n$, all tuple-coordinate projections, the fixed labels of $G_(*)$, the order, supports, actions, and bits. Transporting a row-choice system along it thus preserves the color at each corresponding base point. Countable bad sets are transported to countable bad sets. This proves invariance of the object condition. Convexity, fixed $G_(*)$, and equality of old supports are likewise preserved under an isomorphism of a pair of structures. Applying the same color calculation at each new base point proves invariance of the strong relation. In particular, if $f : N tilde.equiv N'$ and $M lt.eq_K N$, then $f \[ M \] lt.eq_K N'$.
  Reflexivity follows because equality is a basic inclusion and the additional condition has an empty set of new base points. Antisymmetry follows from induced substructure inclusion. To prove transitivity, suppose $M_0 lt.eq_K M_1 lt.eq_K M_2$. Basic inclusions compose. Fix a tuple $t$ from $I^(M_0)$, a point $b in B^(M_2) \\ B^(M_0)$, and row representatives in $M_0$ for $t$ and its nonempty subsequences. If $b in B^(M_1) \\ B^(M_0)$, choose its column representatives in $M_1$. The bits against these old rows are unchanged in $M_2$, by induced substructure, and the tests hold by $M_0 lt.eq_K M_1$. If $b in.not B^(M_1)$, the selected rows in $M_0$ are also allowable old representatives for $M_1 lt.eq_K M_2$; this latter inclusion supplies the tests. Hence $M_0 lt.eq_K M_2$.
  For coherence, suppose that $M_0$ is an induced $tau$-substructure of $M_1$, and that both are strong substructures of $M_2$. Their $G_(*)$ sorts both equal that of $M_2$. Convexity of $B^(M_0)$ in $B^(M_2)$ implies its convexity in $B^(M_1)$. For $u in G \( B \)^(M_0)$, its support in $M_2$ is exactly its support in $M_0$; restricting incidence to $M_1$ gives the same support there. Thus $M_0 prec.curly.eq_(upright(b)) M_1$. For a tuple from $I^(M_0)$ and $b in B^(M_1) \\ B^(M_0)$, compute colors using rows in $M_0$ and columns in $M_1$. They are the same colors computed in $M_2$, where $M_0 lt.eq_K M_2$ makes the full test pass. Therefore $M_0 lt.eq_K M_1$. ◻
]

=== 3.4 Directed unions and smoothness <directed-unions-and-smoothness>

#thm([Lemma 3.10.])[
  #emph[Let $\( M_i : i in D \)$ be a nonempty set-indexed family of objects directed under strong inclusion: any two members have a common strong upper bound within the family. Its union $U$ is an object, and $M_i lt.eq_K U$ for every $i in D$. If $N$ is an object with $M_i lt.eq_K N$ for all $i in D$, then $U lt.eq_K N$.]
] <aec:directed>

#proof[
  Every finite collection of family members has a common upper member, by induction from directedness. In particular, relations agree on overlapping domains: two members embed as induced substructures of a common member. Their union therefore gives a well-defined relational structure $U$.
  #emph[The basic data in the union.] The carrier predicates still partition the union domain, and every finite tuple in $I^U$ lies in one member. That member supplies a nonempty row fiber for the tuple at every $n < omega$. A tuple together with a base point $b$ is also contained in a common member, which supplies the required column fiber. Projection graphs remain single-valued and total by the same finite-parameter argument.
  The sorts $G_(*)^(M_i)$ are all the same set: for any two indices, a common upper member has $G_(*)$ equal to both. Their labels and group structures agree. Every $u in G \( B \)^U$ originates in a member. It has exactly its old support in the union, since a common upper member with any other proposed incident point cannot add to that support. Thus its support is finite. Conversely, every finite subset of $B^U$ lies in a member and is coded there. Uniqueness of its code can be checked in a common member containing any two proposed codes. The support map in $U$ is consequently a bijection onto $\[ B^U \]^(< omega)$.
  All arguments and values needed for a group operation or an action lie in a common member. This proves semantic totality and uniqueness in the union, as well as the group laws and fiber preservation. For two row points in the same union fiber, a common member containing both supplies their unique translator; the same argument applies to column points. Freeness is also checked in a common member. The fibers are therefore torsors for the required groups. Equation (3.1) follows by putting its finitely many arguments in a common member. No relations outside the prescribed types can appear in the union.
  The base order is linear, dense, and without endpoints, since these assertions for finitely many points have witnesses in a containing member. More precisely, if $a \, c in B^(M_i)$ and $a < b < c$ in $B^U$, choose a member containing $b$ and then a common upper member with $M_i$. Convexity in that member gives $b in B^(M_i)$. Hence $B^(M_i)$ is convex in $B^U$. A bounded interval in the union is exactly the corresponding interval in any member containing its endpoints, and so is countable. These arguments show that $U$ is basic and that $M_i prec.curly.eq_(upright(b)) U$ for all $i$.
  #emph[The object condition.] Fix $t in cal(T) \( I^U \)$, and choose one member $M_i$ containing its entries. Every row of $t$ and of its nonempty subsequences is nonempty already in $M_i$. Choose all their row representatives in this one member, for every $n < omega$. Over $B^(M_i)$ their full test has a countable exception set, by the object condition for $M_i$. These same colors can be calculated in $U$ with columns from $M_i$, so the old exception bound remains valid.
  For $b in B^U \\ B^(M_i)$, choose a member containing $b$, followed by a common upper member with $M_i$. The strong inclusion of $M_i$ into that common member makes the full test pass at $b$ using the selected rows. The same row and column points compute the same colors in $U$. Thus the test fails only on the original countable set in $B^(M_i)$.
  The convenient choices just made may depend on $t$. To check the definition with a single global row-choice system in $U$, compare that system with these choices for $t$ and its finitely many nonempty subsequences. Lemma 11 adds at most a countable set of possible differences. For each $t$, its bad set is therefore countable also for the global system. Hence $U$ is an object.
  #emph[Strongness of the members.] Fix $i$, a tuple from $I^(M_i)$, and $b in B^U \\ B^(M_i)$. The same common-upper-member calculation, using rows from $M_i$, supplies the full test at $b$. Together with the verified basic inclusion this gives $M_i lt.eq_K U$.
  #emph[A common upper bound.] Suppose now that every $M_i lt.eq_K N$. The union is an induced substructure of $N$, because each finite relation instance can be checked in a member containing its entries. Its $G_(*)$ sort equals $G_(*)^N$, and every union group element has its original support in $N$. For two points of $B^U$, choose a member containing both; convexity of that member in $N$ forces every intervening point of $B^N$ into that member and hence into $B^U$. Thus $U prec.curly.eq_(upright(b)) N$.
  Fix $t in cal(T) \( I^U \)$ and $b in B^N \\ B^U$. Choose a member $M_i$ containing $t$, and choose all the rows required for $t$ and its subsequences inside $M_i$. Because $b in.not B^(M_i)$, the assumption $M_i lt.eq_K N$ supplies the full test at $b$. Those representatives are also in $U$ and are eligible for its strong-inclusion test into $N$. Canonicality outside $B^U$, from Lemma 11, makes this one choice sufficient. Hence $U lt.eq_K N$. ◻
]

The proof does not put an arbitrary preselected countable set of union row points into one stage. It first puts the finite tuple into a member and then selects all the needed row representatives there. This is what permits both the object-condition argument and smoothness at chains of countable cofinality.

=== 3.5 The downward Löwenheim–Skolem bound <the-downward-löwenheimskolem-bound>

We first record explicitly the small convex-hull fact needed for arbitrary requested subsets.

#thm([Lemma 3.11.])[
  #emph[Let $B$ be a nonempty dense linear order without endpoints, with countable bounded intervals. For every infinite cardinal $kappa$ and every $D subset.eq B$ of size at most $kappa$, there is a nonempty convex suborder $B_0$ containing $D$, of size at most $kappa$, which is dense and has no endpoints.]
] <aec:convex-hull>

#proof[
  If necessary add one point to make $D$ nonempty. Set $T_0 = D$. Given $T_m$, for each $x in T_m$ choose points $x^(-) < x < x^(+)$ in $B$, and adjoin them to form $T_(m + 1)$. Put $T = union.big_(m < omega) T_m$. Then $T eq.not diameter$, $\| T \| lt.eq kappa$, and $T$ has no endpoints. Let
  $ B_0 = { b in B : upright("there exist ") x \, y in T upright(" with ") x lt.eq b lt.eq y } . $
  This is the convex hull of $T$. It is a union of at most $kappa^2 = kappa$ closed bounded intervals, each countable after adjoining its endpoints. Thus $\| B_0 \| lt.eq kappa$. Convexity and density of $B$ make $B_0$ dense. If $b in B_0$ lies between $x \, y in T$, choose points of $T$ below $x$ and above $y$. They give points of $B_0$ on both sides of $b$, so $B_0$ has no endpoints. ◻
]

#thm([Lemma 3.12.])[
  #emph[For every $M in cal(C)$ and every $A subset.eq \| M \|$, there is $N lt.eq_K M$ such that $A subset.eq \| N \|$ and $parallel N parallel lt.eq \| A \| + ℵ_0$.]
] <aec:ls>

#proof[
  Put $kappa = \| A \| + ℵ_0$. Choose a nonempty $I_0 subset.eq I^M$ of size at most $kappa$ containing $A ∩ I^M$ and every tuple-coordinate projection of every row or column element of $A$. There are at most $kappa$ tuples in $cal(T) \( I_0 \)$. For each of them, and for each $n < omega$, choose a representative $z_(t \, n) in Z_(t \, n)^M$. When computing the bad sets $E_t$ for $t in cal(T) \( I_0 \)$, always use this same system of choices for all its subtuples. The object condition in $M$, or an extension of these choices to a full row-choice system in $M$, shows that each such $E_t$ is countable.
  Collect a subset $D subset.eq B^M$ consisting of:
  + all points of $A ∩ B^M$, and all base-point projections of column elements of $A$;
  + $"supp" \( u \)$ for every $u in A ∩ G \( B \)^M$;
  + for every requested row point $z in A ∩ Z_(t \, n)^M$, the support of the unique $u in G \( B \)^M$ satisfying $z = z_(t \, n) + u$;
  + all the sets $E_t$, for $t in cal(T) \( I_0 \)$.
  In (ii)–(iv) the listed sets are included by taking their union. The first three clauses contribute at most $kappa$ points, since supports and projections are finite for each requested element. The last clause contributes at most $kappa dot.op ℵ_0 = kappa$ points. Therefore $\| D \| lt.eq kappa$.
  Apply Lemma 16 to obtain a nonempty convex dense $B_0 subset.eq B^M$ without endpoints, containing $D$, of size at most $kappa$. Let
  $ H = { u in G \( B \)^M : "supp"^M \( u \) subset.eq B_0 } . $
  This is exactly the subgroup coding $\[ B_0 \]^(< omega)$. Define $N$ by retaining $I_0 \, B_0 \, H$, and the whole group $G_(*)^M$, together with the fibers
  $ Z_(t \, n)^N & = { z_(t \, n) + u : u in H } &  & \( t in cal(T) \( I_0 \) \, med n < omega \) \,\
W_(t \, b)^N & = W_(t \, b)^M &  & \( t in cal(T) \( I_0 \) \, med b in B_0 \) \, $
  and all relations restricted from $M$.
  Each displayed row orbit is a nonempty $H$-torsor. Each retained column is the whole old $G_(*)^M$-torsor and remains one. The projections land in the retained sorts, the group operations and actions are total there, and Equation (3.1) restricts to these groups and fibers. Thus $N$ is basic and $N prec.curly.eq_(upright(b)) M$.
  The choices $z_(t \, n)$ are present in $N$: they are obtained by the zero translator. At every $b in B_0$, they compute precisely the same colors in $N$ and $M$, using the retained whole column fibers. The bad set in $N$ for any $t in cal(T) \( I_0 \)$ is therefore $E_t ∩ B_0$, which is countable. Hence $N$ is an object. For $b in B^M \\ B_0$, all these full tests pass because $E_t subset.eq D subset.eq B_0$. The same chosen rows are eligible old representatives from $N$. This proves the strong condition, so $N lt.eq_K M$.
  It remains to verify containment of the requested data. The choices of $I_0$ and $B_0$ retain requested index and base points and all needed projections. A requested group element belongs to $H$ by clause (ii). A requested row point belongs to its retained orbit by clause (iii). A requested column point belongs to a retained whole column fiber by clause (i) and the choice of $I_0$. All requested elements of $G_(*)^M$ are present because that entire group was retained. These are all possible carrier types, so $A subset.eq \| N \|$. Finally Lemma 10 gives
  $ parallel N parallel = max \( \| I_0 \| \, \| B_0 \| \, ℵ_0 \) lt.eq kappa \, $
  as required. ◻
]

#thm([Theorem 3.13.])[
  #emph[The pair $K = \( cal(C) \, lt.eq_K \)$ of Definition 12 is an abstract elementary class in a fixed countable finitary relational language, with 
$ "LS" \( K \) = ℵ_0 . $

 It has the union and common-upper-bound properties for every nonempty set-indexed directed family of strong substructures.]
] <aec:class>

#proof[
  The language and its semantic structures were specified after Definition 7. Lemma 14 proves isomorphism invariance, substructure, the partial-order properties, and coherence. Lemma 15 proves the directed union and smoothness assertions, in particular the required chain axioms. Lemma 17 proves the downward bound $ℵ_0$. Since the language is countable and $"LS" \( K \)$ is by definition infinite, its least possible value is $ℵ_0$, which is therefore the value attained here. ◻
]

== 4 Two models at the prescribed endpoint <sec:endpoint>

We construct an object whose index sort is $V_eta$ and whose order sort has cardinality $delta$, where

$ delta = omega_1 \, #h(2em) eta = delta^(+) = omega_2 . $

The construction assigns to every finite tuple a countable extensional membership diagram. Actual ranks below $eta$ are replaced, separately at each order point, by tags below $delta$. For any one tuple, all required inequalities hold outside a countable set of order points. The exception set is allowed to depend on the tuple, as in the definition of $K$.

=== 4.1 Ranks represented modulo countable sets <ranks-represented-modulo-countable-sets>

#thm([Lemma 4.1.])[
  #emph[There are functions $f_alpha : delta arrow.r delta$, for $alpha < eta$, such that for all $gamma < alpha < eta$ the set 
$ E_(gamma \, alpha) = { beta < delta : f_gamma \( beta \) gt.eq f_alpha \( beta \) } $

 is countable.]
] <end:domination>

#proof[
  For each $alpha < eta = delta^(+)$, fix an injection $j_alpha : alpha arrow.r delta$. These form a set-sized family of choices. Define the functions by transfinite recursion, putting
  #[#set math.equation(numbering: n => "(4.1)")
   $ f_alpha \( beta \) = sup { f_gamma \( beta \) + 1 : gamma < alpha \, med j_alpha \( gamma \) < beta } \, #h(2em) sup diameter = 0 . $ <end:diagonal-formula>]
  For each $beta < omega_1$, the set of indices in this supremum is countable, because $j_alpha$ is injective and $beta$ is a countable ordinal. Regularity of $omega_1$ implies that the supremum is below $delta$. Thus the recursion defines a function into $delta$ at every stage $alpha < eta$.
  If $gamma < alpha$ and $beta > j_alpha \( gamma \)$, the term $f_gamma \( beta \) + 1$ occurs in (4.1). Hence
  $ f_gamma \( beta \) < f_alpha \( beta \) \, #h(2em) E_(gamma \, alpha) subset.eq j_alpha \( gamma \) + 1 . $
  The latter ordinal is countable, proving the assertion. ◻
]

#thm([Lemma 4.2.])[
  #emph[The cumulative hierarchy satisfies 
$ \| V_(omega + gamma) \| = ℶ_gamma quad upright("for every ordinal ") gamma . $

 In particular, $\| V_eta \| = ℶ_eta$, and every element of $V_eta$ has rank below $eta$.]
] <end:hierarchy-size>

#proof[
  The set $V_omega$ of hereditarily finite sets is countably infinite, giving the assertion at $gamma = 0$. At a successor stage,
  $ \| V_(omega + \( gamma + 1 \)) \| = \| cal(P) \( V_(omega + gamma) \) \| = 2^(ℶ_gamma) = ℶ_(gamma + 1) . $
  If $gamma$ is a nonzero limit ordinal, continuity of ordinal addition and of the cumulative hierarchy gives
  $ V_(omega + gamma) = union.big_(zeta < gamma) V_(omega + zeta) . $
  The inductive hypothesis gives a lower bound of $sup_(zeta < gamma) ℶ_zeta = ℶ_gamma$ for the cardinality of this union. It also gives the upper bound $\| gamma \| dot.op ℶ_gamma$. Strict increase of the beth sequence implies $\| gamma \| lt.eq ℶ_gamma$: the map $zeta mapsto ℶ_zeta$, for $zeta < gamma$, is an injection into the ordinal $ℶ_gamma$. The upper bound is therefore $ℶ_gamma$, completing the induction.
  Since $omega + omega_2 = omega_2$, the first conclusion follows. The rank assertion is the defining property of membership in $V_eta$. ◻
]

=== 4.2 Compatible countable membership diagrams <compatible-countable-membership-diagrams>

Put $D = V_eta$. We first choose a countable set of diagram entries for each nonempty finite subset of $D$. The closure below ensures extensionality separately for every such set. Starting from a nonempty countable set of entries, we repeatedly adjoin one distinguishing membership witness for each pair of distinct entries. The resulting set remains countable and has an extensional membership relation, even when the entries themselves are large sets.

#thm([Lemma 4.3.])[
  #emph[There is a family 
$ \( D_X : diameter eq.not X in \[ D \]^(< omega) \) $

 of nonempty countable subsets of $D$ such that:]
  + #emph[$X subset.eq D_X$;]
  + #emph[$D_Y subset.eq D_X$ whenever $diameter eq.not Y subset.eq X$;]
  + #emph[the relation of actual membership on $D_X$ is extensional: for distinct $a \, b in D_X$, some $w in D_X$ belongs to exactly one of $a \, b$.]
  #emph[We may also fix surjections $d_X : omega arrow.r D_X$ such that $d_({ x }) \( 0 \) = x$ for each $x in D$.]
] <end:countable-closures>

#proof[
  Fix a well-order of the set $D$. For distinct $a \, b in D$, let $w \( a \, b \)$ be the first element of $a triangle.stroked.t b$ in this well-order. This witness exists by set extensionality and belongs to $D$, since $D = V_eta$ is transitive.
  If $A subset.eq D$ is nonempty and countable, define
  $ A_0 = A \, #h(2em) A_(n + 1) = A_n union { w \( a \, b \) : a \, b in A_n \, med a eq.not b } \, #h(2em) C \( A \) = union.big_(n < omega) A_n . $
  Every $A_n$, and hence $C \( A \)$, is countable. Any two distinct elements of $C \( A \)$ lie together in some $A_n$; their chosen witness lies in $A_(n + 1)$. Thus membership on $C \( A \)$ is extensional.
  Recursively on the finite cardinality of $X$, set
  $ D_X = C (X union union.big_(diameter eq.not Y subset.neq X) D_Y) . $
  The seed is nonempty and countable, because there are only finitely many proper subsets of $X$. This proves (i) and (iii) and directly gives (ii) for proper inclusions; equality gives the remaining case.
  Each $D_X$ is nonempty and at most countable, so it admits a surjection from $omega$, allowing repetitions when it is finite. For $X = { x }$, choose one whose initial entry is $x$. All these choices are indexed by a set, and the axiom of choice supplies the family of surjections. ◻
]

Fix the functions from Lemma 19 and the sets and enumerations from Lemma 21. For every nonempty finite $X subset.eq D$, define

#[#set math.equation(numbering: n => "(4.2)")
 $ F_X = union.big_(x \, y in D_X\
y in x) E_("rank" \( y \) \, "rank" \( x \)) . $ <end:bad-set>]

Each index pair is legitimate: $"rank" \( y \) < "rank" \( x \) < eta$. There are countably many pairs in the union, so $F_X$ is countable. Moreover,

#[#set math.equation(numbering: n => "(4.3)")
 $ diameter eq.not Y subset.eq X quad arrow.r.double quad F_Y subset.eq F_X . $ <end:bad-monotone>]

Indeed, $D_Y subset.eq D_X$, so every edge used to define $F_Y$ is also used to define $F_X$.

We use the label sets and the coding maps of Section 2. For an ordered tuple

$ t = \( x_1 \, dots.h \, x_k \) $

of distinct elements of $D$, write $X = { x_1 \, dots.h \, x_k }$. If $diameter eq.not J subset.eq \[ k \]$, let $X_J = { x_j : j in J }$. Define a map from the label set $cal(L)_k$ by

$ q_t \( J \, i \) = d_(X_J) \( i \) . $

For each $beta < delta$, define an arity-$k$ diagram $cal(D)_(t \, beta) = \( cal(E)_t \, R_t \, rho_(t \, beta) \)$ by

#[#set math.equation(numbering: n => "(4.4)")
 $ ell cal(E)_t ell' & quad arrow.l.r.double quad q_t \( ell \) = q_t \( ell' \) \,\
ell R_t ell' & quad arrow.l.r.double quad q_t \( ell \) in q_t \( ell' \) \,\
rho_(t \, beta) \( ell \) & = f_("rank" \( q_t \( ell \) \)) \( beta \) . $ <end:diagram-equality>]

All entries of $q_t$ lie in $D_X$, by the inclusion property of the closures. Since the labels $\( \[ k \] \, i \)$ enumerate all of $D_X$, the map $q_t$ is onto $D_X$.

#thm([Lemma 4.4.])[
  #emph[For every tuple $t$ as above, the equality quotient of $cal(D)_(t \, beta)$ identifies with $D_X$, with its actual membership relation, for every $beta < delta$. The diagrams satisfy the following additional properties.]
  + #emph[If $diameter eq.not J subset.eq \[ k \]$, restriction of $cal(D)_(t \, beta)$ to the labels belonging to $J$, with the increasing reindexing of positions, is exactly $cal(D)_(t harpoon.tr J \, beta)$.]
  + #emph[If $beta in.not F_X$, then every diagram $cal(D)_(t harpoon.tr J \, beta)$, including the full diagram, is valid.]
  #emph[Consequently, for every $beta in.not F_X$, the colors 
$ s_(t harpoon.tr J \, beta) = iota_(\| J \|) \( cal(D)_(t harpoon.tr J \, beta) \) \, #h(2em) diameter eq.not J subset.eq \[ k \] \, $

 pass the full subsequence test of Definition 4.]
] <end:diagrams>

#proof[
  Surjectivity of $q_t$, together with (4.4), identifies the quotient bijectively with $D_X$. Equation (4.4) identifies its relation with membership on $D_X$, which is extensional. The tags in (4.4) depend only on the image under $q_t$, so both the relation and the tags respect the equality relation.
  For (i), list $J$ increasingly as ${ j_1 < dots.h.c < j_m }$. A label $\( A \, i \)$ of the subtuple $t harpoon.tr J = \( x_(j_1) \, dots.h \, x_(j_m) \)$ corresponds to $\( { j_a : a in A } \, i \)$ in the original tuple. Both labels denote the same entry
  $ d_({ x_(j_a) : a in A }) \( i \) . $
  Their equality relations, membership relations, and tags therefore agree exactly. This proof applies to every ordered tuple; the enumeration $d_Y$ was fixed for the underlying set $Y$.
  For the full diagram in (ii), suppose $beta in.not F_X$. Every membership edge $y in x$ with $x \, y in D_X$ then satisfies
  $ f_("rank" \( y \)) \( beta \) < f_("rank" \( x \)) \( beta \) $
  by (4.2). This is precisely the strict tag inequality required for that edge. Finally, $q_t \( { j } \, 0 \) = x_j$, so the distinguished singleton labels are pairwise inequivalent. All validity conditions now hold.
  For a subtuple with underlying set $Y = X_J$, its quotient is $D_Y$, whose membership relation is extensional by its own construction. In addition, $beta in.not F_Y$ follows from (4.3). The same argument proves the validity of this subtuple diagram. Combined with (i), these are exactly the conditions of the full subsequence test. ◻
]

For all $t$ and all $beta < delta$, define

#[#set math.equation(numbering: n => "(4.5)")
 $ s_(t \, beta) = iota_k \( cal(D)_(t \, beta) \) \, #h(2em) k = \| t \| . $ <end:prescribed-colors>]

The coding maps are defined on arbitrary diagrams, so this prescription also makes sense at the exceptional coordinates in $F_X$.

=== 4.3 Realizing the colors in an object <realizing-the-colors-in-an-object>

Let $B = delta times bb(Q)$ with its lexicographic order. This is a dense linear order without endpoints: within any rational block there are points above and below each given point; if two points belong to different blocks, a larger point in the earlier block lies strictly between them. The interval between points in blocks $alpha lt.eq alpha' < omega_1$ is contained in

$ #scale(x: 120%, y: 120%)[\(] \[ alpha \, alpha' \] ∩ omega_1 #scale(x: 120%, y: 120%)[\)] times bb(Q) \, $

which is countable. Thus $B$ meets the order requirements for a basic structure and has cardinality $delta$. Fix a bijection $beta mapsto b_beta$ from $delta$ to $B$; this indexing is independent of the order.

Take $I = D$. For every nonempty finite ordered tuple $t$ of distinct elements of $I$, and every $beta < delta$, choose a binary sequence $a_(t \, b_beta) in 2^omega$ representing $s_(t \, beta)$. The tuples and coordinates form a set, so these simultaneous choices are available in ZFC.

The order $B$ has the properties required by Lemma 13. Apply that lemma to this family of sequences, using disjoint tagged copies of $I$, $B$, and the other carriers as in its construction. It gives a basic structure $M_(upright(u))$ and a row-choice system $upright(bold(z))$ such that

$ c_t^(upright(bold(z))) \( b_beta \) = \[ a_(t \, b_beta) \]_(=^(*)) = s_(t \, beta) . $

If $X$ is the underlying set of $t$, Lemma 22 therefore makes its full subsequence test pass whenever $beta in.not F_X$. In the notation of (3.4),

$ E_t \( upright(bold(z)) \) subset.eq { b_beta : beta in F_X } . $

The right-hand side is countable. This verifies the object condition for every tuple, so $M_(upright(u)) in K$. The chosen representatives verify that condition; they are not named in the structure.

#thm([Theorem 4.5.])[
  #emph[The class $K$ has two nonisomorphic models of cardinality $ℶ_eta$. One has an order sort of cardinality $ℵ_1$, and the other has a countable order sort.]
] <end:two-models>

#proof[
  The construction above and Lemma 20 give $M_(upright(u)) in K$ with
  $ \| I^(M_(upright(u))) \| = \| V_eta \| = ℶ_eta \, #h(2em) \| B^(M_(upright(u))) \| = ℵ_1 . $
  Lemma 10 gives total cardinality $kappa = ℶ_eta$.
  For $M_(upright(c))$, take an index set of cardinality $kappa$, base order $B = bb(Q)$, and constant zero sequences $a_(t \, b)$. Lemma 13 supplies a basic structure and makes the object condition automatic because $B$ is countable. Hence $M_(upright(c)) in K$, and Lemma 10 gives $parallel M_(upright(c)) parallel = kappa$.
  An isomorphism preserves the unary predicate for the order sort. It therefore cannot identify $M_(upright(u))$, whose order sort is uncountable, with $M_(upright(c))$, whose order sort is countable. ◻
]

== 5 A bound on uncountable base orders and categoricity on a tail <sec:categoricity>

Continue to work in ZFC with CH and with the class $K$ of Section 3. Recall the cardinals

$ delta = omega_1 \, #h(2em) xi = 2^delta \, #h(2em) Lambda = ℶ_(xi^(+)) . $

Section 4 has supplied an object with uncountable $B$. Its diagrams depend on the tuple and the coordinate, and their validity has tuple-dependent countable exceptions. We first rule out a stronger configuration: one fixed color for each arity passing every finite test. A finite partition argument then forces precisely this configuration if an uncountable-base object has at least $Lambda$ index points. This proves the universal bound $\| I \| < Lambda$ for such objects. Categoricity at and above $Lambda$ will then follow by classifying the remaining, countable-base objects through a matrix isomorphism calculation.

=== 5.1 The obstruction to a fixed pattern <the-obstruction-to-a-fixed-pattern>

We first give the rank argument used to bound a diagram limit. It is the ordinal-tagged form of the Mostowski collapse #cite(label("Mostowski1949")); the construction and its range bound are proved below. The following lemma concerns a set, with no countability assumption on it or on its predecessor sets.

#thm([Lemma 5.1.])[
  (Collapse of the tagged relation).  #emph[Let $Q$ be a set with an extensional binary relation $R$ and a function $rho : Q arrow.r delta$ such that 
$ y R x med arrow.r.double med rho \( y \) < rho \( x \) . $

 Then there is an injection $F : Q arrow.r V_delta$ satisfying 
$ F \( x \) = { F \( y \) : y R x } . $

 More precisely, $F \( x \) in V_(rho \( x \) + 1)$ for every $x in Q$.]
] <col:collapse>

#proof[
  Define $F$ recursively in increasing order of the tag $alpha < delta$. At tag $alpha$, all predecessors have smaller tags, so their images have already been defined; the displayed formula then defines the images of all elements with tag $alpha$. These are sets, since $Q$ is a set. Transfinite recursion and Replacement give a function on $Q$.
  We prove the stated bound by induction on $alpha = rho \( x \)$. If $y R x$ and $beta = rho \( y \)$, the induction hypothesis gives
  $ F \( y \) in V_(beta + 1) subset.eq V_alpha \, #h(2em) beta < alpha . $
  Thus $F \( x \) subset.eq V_alpha$, and consequently $F \( x \) in V_(alpha + 1)$. At $alpha = 0$ the predecessor set is empty, so the same conclusion holds. Since $delta$ is a limit ordinal, $alpha + 1 < delta$ for every $alpha < delta$, and the range of $F$ lies in $V_delta$.
  For injectivity, induct on $max \( rho \( x \) \, rho \( x' \) \)$. Suppose $F \( x \) = F \( x' \)$. For each $y R x$, equality of these sets supplies $y' R x'$ with $F \( y \) = F \( y' \)$. Both $rho \( y \) < rho \( x \)$ and $rho \( y' \) < rho \( x' \)$, so the induction hypothesis gives $y = y'$. This proves that every predecessor of $x$ is a predecessor of $x'$, and the reverse inclusion follows in the same way. Extensionality gives $x = x'$. At induction parameter zero both predecessor sets are empty, so extensionality gives the conclusion directly. ◻
]

The proof uses the whole powerset $V_(alpha + 1) = cal(P) \( V_alpha \)$. Thus the bound remains valid when many local diagrams contribute predecessors to the same element.

#thm([Lemma 5.2.])[
  (No fixed pattern at all finite arities).  #emph[There is no sequence $\( s_j : j gt.eq 1 \)$ of elements of $S$ such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ T_k #scale(x: 120%, y: 120%)[\(] \( s_(\| J \|) \)_(diameter eq.not J subset.eq \[ k \]) #scale(x: 120%, y: 120%)[\)] quad upright("holds for every ") k gt.eq 1 . $ <col:fixed-pattern>]

]
] <col:no-pattern>

#proof[
  Suppose that such a sequence exists. For each $k$, let $cal(D)_k$ be the diagram decoded from $s_k$. The tests assert that every $cal(D)_k$ is valid and that
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(D)_k harpoon.tr J = cal(D)_(\| J \|) #h(2em) \( diameter eq.not J subset.eq \[ k \] \) . $ <col:pattern-restrictions>]
  Choose a linearly ordered set $X$ with $\| X \| > \| V_delta \|$. Such an $X$ can be the initial ordinal of cardinality $\| V_delta \|^(+)$. For each nonempty finite $A subset.eq X$, transport $cal(D)_(\| A \|)$ along the increasing enumeration of $A$, so that its labels become
  $ { \( U \, i \) : diameter eq.not U subset.eq A \, med i < omega } . $
  Let $Q_A$, $R_A$, and $rho_A$ denote its quotient, quotient relation, and tag function. If $A subset.eq B$ are nonempty and finite, the label inclusion and Equation (5.2) give a map
  $ j_(A \, B) : Q_A arrow.r Q_B . $
  By Lemma 5, these maps are injective, preserve tags, preserve and reflect the relation, and satisfy
  $ j_(B \, C) j_(A \, B) = j_(A \, C) #h(2em) \( A subset.eq B subset.eq C \) . $
  We construct their limit explicitly. Form the set
  $ P = { \( A \, a \) : diameter eq.not A subset.eq X upright(" is finite") \, med a in Q_A } . $
  This is a set-indexed union of countable sets. Declare
  #[#set math.equation(numbering: n => "(5.3)")
   $ \( A \, a \) tilde.op \( B \, b \) quad arrow.l.r.double quad j_(A \, A union B) \( a \) = j_(B \, A union B) \( b \) . $ <col:limit-equivalence>]
  Passing to a larger finite common stage preserves equality and reflects it by injectivity. The composition identities therefore show that $tilde.op$ is an equivalence relation: in particular, two equalities witnessing transitivity can both be read in the stage indexed by the union of their three finite index sets. Put $Q = P \/ tilde.op$, and let $j_A : Q_A arrow.r Q$ send $a$ to the class of $\( A \, a \)$. Each $j_A$ is injective, and
  $ j_B j_(A \, B) = j_A . $
  Every finite collection of elements of $Q$ lies in the image of one $j_A$, by taking a union of finitely many index sets.
  Define tags on the limit by $rho \( j_A \( a \) \) = rho_A \( a \)$. Define its relation using a finite common stage: for $a in Q_A$, $b in Q_B$, and $C = A union B$, set
  #[#set math.equation(numbering: n => "(5.4)")
   $ j_B \( b \) thin R thin j_A \( a \) quad arrow.l.r.double quad j_(B \, C) \( b \) thin R_C thin j_(A \, C) \( a \) . $ <col:limit-relation>]
  These definitions are independent of the representatives. Indeed, representatives that describe the same limit points become equal in a finite common stage by Equation (5.3). Taking the union of that stage with all stages used in Equation (5.4) makes the relevant representatives equal simultaneously. Tag preservation gives the same tag, and preservation and reflection of $R$ give the same truth value for the relation. It also follows that each $j_A$ preserves and reflects $R$, and that
  $ y R x med arrow.r.double med rho \( y \) < rho \( x \) #h(2em) \( x \, y in Q \) . $
  The limit relation is extensional. To see this, take distinct $x \, x' in Q$ and put them in a common stage, say $x = j_A \( a \)$ and $x' = j_A \( a' \)$. Injectivity implies $a eq.not a'$. Extensionality in $Q_A$ gives a predecessor distinguishing them. After exchanging $a \, a'$ if needed, there is $b in Q_A$ with
  $ b R_A a \, #h(2em) not \( b R_A a' \) . $
  Because $j_A$ preserves and reflects the relation, $j_A \( b \) R x$ and $not \( j_A \( b \) R x' \)$. This witness remains valid even if larger stages add other predecessors.
  For $u in X$, consider the element of $Q_({ u })$ represented by the label $\( { u } \, 0 \)$, and let $q_u$ be its image in $Q$. If $u eq.not v$, condition (iii) of Definition 2, applied in the stage $Q_({ u \, v })$, says that the two corresponding elements are distinct. Injectivity of the stage map gives $q_u eq.not q_v$. Thus
  $ \| X \| lt.eq \| Q \| . $
  Lemma 24 applies to the set $Q$, with its extensional relation and tags below $delta$. It gives an injection into $V_delta$, whence
  $ \| X \| lt.eq \| Q \| lt.eq \| V_delta \| . $
  This contradicts the choice of $X$. ◻
]

#prodef([Remark 5.3.])[
  (What the pattern quantifiers require).  Lemma 25 rules out one fixed sequence of colors satisfying every finite test. To obtain the contradiction, it is enough to find, for each $k$, a separate ordered $k$-tuple whose $j$-element subsequences all have color $s_j$, and whose full subsequence test passes. Each such tuple certifies precisely the instance of Equation (5.1) for that $k$. The tuples need not be nested or come from a common infinite homogeneous set: the fixed colors determine the same decoded diagrams, and the tests determine every increasing position restriction between them. This is the form used below in Proposition 30.
] <col:pattern-quantifiers>

=== 5.2 The cardinal and finite partition estimates <the-cardinal-and-finite-partition-estimates>

The finite-arity proof uses the end-homogeneous method of classical partition calculus #cite(label("ErdosRado1956")). We give the particular estimate and the subsequent selection of fixed colors explicitly, so their cardinal bounds and quantifiers are part of the argument.

For a set $X$ and a positive integer $m$, write $\[ X \]^m$ for its $m$-element subsets. A subset $Y subset.eq X$ is #emph[homogeneous] for a map $c : \[ X \]^m arrow.r C$ if $c$ is constant on $\[ Y \]^m$. Cardinals used as ordered sets below are identified with their initial ordinals.

#thm([Lemma 5.4.])[
  #emph[The cardinal $Lambda$ is a strong limit and 
$ "cf" \( Lambda \) = xi^(+) > xi . $

 If $zeta < Lambda$ is infinite, then both $xi^zeta$ and $\( xi^zeta \)^(+)$ are below $Lambda$.]
] <cat:cardinals>

#proof[
  Put $kappa = xi^(+)$. This is a regular cardinal and a limit ordinal. The beth sequence is strictly increasing and continuous at limit ordinals, so
  $ Lambda = sup_(alpha < kappa) ℶ_alpha . $
  This gives $"cf" \( Lambda \) lt.eq kappa$. Conversely, a set of fewer than $kappa$ ordinals below $Lambda$ can be bounded by beth values with fewer than $kappa$ indices. Regularity of $kappa$ bounds these indices below $kappa$, and therefore bounds the original set below $Lambda$. This proves $"cf" \( Lambda \) = kappa$.
  Given an infinite cardinal $nu < Lambda$, choose $alpha < kappa$ with $nu lt.eq ℶ_alpha$. Since $alpha + 1 < kappa$,
  $ 2^nu lt.eq 2^(ℶ_alpha) = ℶ_(alpha + 1) < Lambda . $
  Thus $Lambda$ is a strong limit. It is also a limit cardinal: for every cardinal below it, a strictly larger beth value still lies below it. In particular $xi < Lambda$, and for infinite $zeta < Lambda$,
  $ xi^zeta lt.eq \( 2^xi \)^zeta = 2^(xi dot.op zeta) < Lambda . $
  The last inequality uses $xi dot.op zeta < Lambda$ and strong limitness. The successor of $xi^zeta$ is also below the limit cardinal $Lambda$. ◻
]

#thm([Lemma 5.5.])[
  (Finite partition estimate).  #emph[For every positive integer $m$ and every infinite cardinal $chi < Lambda$, there is a cardinal $mu < Lambda$ such that every map $c : \[ mu \]^m arrow.r C$ with $\| C \| lt.eq xi$ has a homogeneous subset of cardinality $chi$.]
] <cat:finite-partition>

#proof[
  By identifying the colors with elements of $xi$, it suffices to use the palette $xi$. We induct on $m$, proving the statement for all infinite targets $chi < Lambda$ at each step. When $m = 1$, take
  $ mu = \( max \( xi \, chi \) \)^(+) < Lambda . $
  If every color class had size less than $chi$, their union would have size at most $xi dot.op chi < mu$. Thus some class has at least $chi$ elements, from which we select exactly $chi$.
  Suppose the statement is known for $m$, and fix a target $chi < Lambda$. Choose an infinite cardinal $zeta < Lambda$ such that every $xi$-coloring of $\[ zeta \]^m$ has a homogeneous $chi$-element subset. Set
  $ q = xi^zeta \, #h(2em) mu = q^(+) < Lambda \, $
  where the last inequality follows from Lemma 27. Let $c : \[ mu \]^(m + 1) arrow.r xi$. We seek $zeta$ increasing representatives and a later point $x$ such that the color of any $m + 1$ representatives is unchanged when its last point is replaced by $x$. Coloring an $m$-set by the color obtained after adjoining $x$ then reduces to the induction hypothesis. The residual-set tree below groups points by their profiles on the named representatives along each branch. Its node count leaves an unnamed $x$, whose residuals determine the required branch.
  For each $alpha < zeta$, fix an injection
  #[#set math.equation(numbering: n => "(5.5)")
   $ iota_alpha : zws^(\[ alpha + 1 \]^m) xi arrow.r q . $ <cat:profile-codes>]
  Such an injection exists because $\| \[ alpha + 1 \]^m \| lt.eq zeta$. Index potential tree nodes by sequences $s in zws^alpha q$, for $alpha lt.eq zeta$. Define their residual sets $X_s subset.eq mu$ recursively as follows.
  + At the root, put $X_diameter = mu$.
  + Suppose $s$ has length $alpha < zeta$ and $X_s$ is nonempty. Name its least point
    $ r_s = min X_s . $
    For $y in X_s \\ { r_s }$, define its profile $u_(s \, y) in zws^(\[ alpha + 1 \]^m) xi$ by
    #[#set math.equation(numbering: n => "(5.6)")
     $ u_(s \, y) \( a \) = c #scale(x: 120%, y: 120%)[\(] { r_(s harpoon.tr beta) : beta in a } union { y } #scale(x: 120%, y: 120%)[\)] \, #h(2em) a in \[ alpha + 1 \]^m . $ <cat:profile>]
    For each $i < q$, put
    $ X_(s^frown i) = { y in X_s \\ { r_s } : iota_alpha \( u_(s \, y) \) = i } . $
    If $X_s$ is empty, set every immediate successor residual to the empty set.
  + If $gamma lt.eq zeta$ is a nonzero limit ordinal and $s in zws^gamma q$, put
    #[#set math.equation(numbering: n => "(5.7)")
     $ X_s = ⋂_(alpha < gamma) X_(s harpoon.tr alpha) . $ <cat:limit-residual>]
  Only nodes with nonempty residuals matter. Every such node has nonempty ancestral residuals, so all representatives in (5.6) are defined. Along a branch the representatives increase strictly: each one is the least point of the current residual, and successor residuals exclude that point. Consequently the arguments of $c$ in (5.6) are $\( m + 1 \)$ distinct points. Once $alpha + 1 gt.eq m$, the index set $\[ alpha + 1 \]^m$ includes subsets containing $alpha$ itself, so the profile includes tests using the just named point $r_s$.
  The number of potential nodes, including those at limit levels, is bounded by
  #[#set math.equation(numbering: n => "(5.8)")
   $ lr(|union.big_(alpha lt.eq zeta) zws^alpha q|) lt.eq \| zeta + 1 \| dot.op q^zeta = zeta dot.op \( xi^zeta \)^zeta = xi^zeta = q . $ <cat:tree-count>]
  Here $zeta$ is infinite, $q gt.eq zeta$, and $zeta dot.op zeta = zeta$. In particular at most $q$ points are named at levels below $zeta$. Since $mu = q^(+)$, choose a point $x in mu$ that is never named.
  There is a unique branch of residuals containing $x$ through all levels at most $zeta$. Indeed, if $x in X_s$ at a successor step, then $x eq.not r_s$, so exactly one of the profile classes contains it. At a limit step, it belongs to the intersection (5.7) along the branch already constructed. Thus the branch cannot disappear at a limit. Write its named representatives as
  $ r_alpha quad \( alpha < zeta \) \, #h(2em) P = { r_alpha : alpha < zeta } . $
  They increase strictly and are all less than $x$, so $\| P \| = zeta$.
  Define a coloring of the preceding arity by
  $ d : \[ P \]^m arrow.r xi \, #h(2em) d \( A \) = c \( A union { x } \) . $
  Consider indices $alpha_0 < dots.h.c < alpha_m < zeta$. At level $alpha_(m - 1)$ of the branch, all the first $m$ representatives in this list have appeared, including the just named one. The last representative $r_(alpha_m)$ and the point $x$ belong to the same successor residual at that level. Their profiles therefore agree on ${ alpha_0 \, dots.h \, alpha_(m - 1) }$, giving
  #[#set math.equation(numbering: n => "(5.9)")
   $ c \( { r_(alpha_0) \, dots.h \, r_(alpha_m) } \) = d \( { r_(alpha_0) \, dots.h \, r_(alpha_(m - 1)) } \) . $ <cat:arity-reduction>]
  By the choice of $zeta$, the map $d$ has a homogeneous subset $H subset.eq P$ of cardinality $chi$. Equation (5.9) shows that $H$ is homogeneous for $c$ as well. This proves the induction step. ◻
]

=== 5.3 Extracting a forbidden pattern <extracting-a-forbidden-pattern>

The next lemma combines the finite partition estimates without asserting the existence of a common infinite homogeneous subset.

#thm([Lemma 5.6.])[
  #emph[Let $X$ be a set with $\| X \| gt.eq Lambda$. For each positive integer $j$, let $c_j : \[ X \]^j arrow.r C_j$, where $\| C_j \| lt.eq xi$. There are colors $p_j in C_j$ such that for every positive integer $k$ there is $A_k in \[ X \]^k$ satisfying 
$ c_j \( A \) = p_j #h(2em) \( 1 lt.eq j lt.eq k \, med A in \[ A_k \]^j \) . $

 The sets $A_k$ need not be nested.]
] <cat:finite-patterns>

#proof[
  Choose the colors recursively. After choosing $p_1 \, dots.h \, p_j$, maintain the following invariant: for every infinite cardinal $chi < Lambda$, there is a set $Y subset.eq X$ with $chi lt.eq \| Y \| < Lambda$ such that each $c_i$ for $1 lt.eq i lt.eq j$ is constantly $p_i$ on $\[ Y \]^i$. For $j = 0$ this follows from $\| X \| gt.eq Lambda$.
  Assume the invariant holds at $j$. For each infinite $chi < Lambda$, Lemma 28 supplies a source cardinal $mu_chi < Lambda$ for arity $j + 1$ and target $chi$. Choose an existing sample of size at least $mu_chi$, restrict to $mu_chi$ points, and apply the lemma to obtain a subset $Z_chi$ of size $chi$ on which $c_(j + 1)$ has a constant color $q_chi in C_(j + 1)$. All earlier colors are retained on this subset.
  At least one color occurs as $q_chi$ for target cardinals $chi$ unbounded below $Lambda$. Otherwise, for every $q in C_(j + 1)$ there would be a bound below $Lambda$ for the targets assigned color $q$. Since $\| C_(j + 1) \| lt.eq xi < "cf" \( Lambda \)$, the supremum of these bounds would still be below $Lambda$. This contradicts the fact that we made the construction for every infinite target below the limit cardinal $Lambda$. Choose such a color as $p_(j + 1)$; its samples establish the invariant at $j + 1$.
  After this recursion, fix a positive integer $k$. The invariant at stage $k$ supplies an infinite sample homogeneous in the first $k$ chosen colors. Any $k$ points of that sample give $A_k$. ◻
]

#thm([Proposition 5.7.])[
  #emph[If $M in K$ and $B^M$ is uncountable, then $\| I^M \| < Lambda$.]
] <cat:bounded>

#proof[
  Suppose instead that $\| I^M \| gt.eq Lambda$. Fix a well-order of $I^M$, used only in this proof, and fix row representatives $z_(t \, n)$ for every tuple $t$ and every $n < omega$ in $M$. Let
  $ c_t : B^M arrow.r S $
  be the resulting color profile of $t$, as defined in Section 3. By CH, $\| S \| = delta$, and Lemma 9 gives $\| B^M \| lt.eq delta$. Thus the palette of whole profiles has size at most
  #[#set math.equation(numbering: n => "(5.10)")
   $ \| S^(B^M) \| lt.eq delta^delta = 2^delta = xi . $ <cat:palette>]
  For the middle equality, $2^delta lt.eq delta^delta$ follows from $2 lt.eq delta$, while $delta^delta lt.eq \( 2^delta \)^delta = 2^delta$ gives the reverse inequality.
  For each $j gt.eq 1$, color a $j$-element subset of $I^M$ by the profile of its increasing enumeration. Apply Lemma 29 to these colorings, with every palette equal to $S^(B^M)$. Obtain profiles $p_j in S^(B^M)$ and, for each $k$, an increasing witness tuple $t_k$ of length $k$ whose increasing $j$-subtuples all have profile $p_j$, for $j lt.eq k$.
  For the fixed global row representatives, let $E_k subset.eq B^M$ be the countable exceptional set for the full object test of $t_k$. By the definition of that test, it includes all required checks on the nonempty subsequences of $t_k$. The set
  $ E = union.big_(1 lt.eq k < omega) E_k $
  is countable. Choose $b in B^M \\ E$, possible because $B^M$ is uncountable, and put $s_j = p_j \( b \)$ for every $j gt.eq 1$. For each $k$, evaluation on $t_k$ proves
  $ T_k #scale(x: 120%, y: 120%)[\(] \( s_(\| J \|) \)_(diameter eq.not J subset.eq { 1 \, dots.h \, k }) #scale(x: 120%, y: 120%)[\)] . $
  This is the sequence forbidden by Lemma 25. The contradiction proves the bound. ◻
]

#prodef([Remark 5.8.])[
  The witness tuples $t_k$ may be unrelated. At the chosen coordinate $b$, the length-$k$ witness certifies validity of the one diagram decoded from $s_k$, together with its restrictions along every increasing inclusion of positions. Those fixed diagrams are exactly the data to which Lemma 25 applies. The proof uses only countably many full-tuple exceptional sets; it does not seek a coordinate good for every tuple in $I^M$.
] <cat:separate-witnesses>

=== 5.4 Isomorphisms when the base order is countable <isomorphisms-when-the-base-order-is-countable>

#thm([Lemma 5.9.])[
  #emph[If $M \, N in K$ have countable base orders and $\| I^M \| = \| I^N \|$, then $M tilde.equiv N$.]
] <cat:countable-base>

#proof[
  Fix a bijection $f : I^M arrow.r I^N$. Both base orders are nonempty countable dense linear orders without endpoints. There is an order isomorphism $g : B^M arrow.r B^N$, as follows. Enumerate the two orders and build finite partial increasing bijections, alternately including the next unused point of each enumeration in the domain and in the range. At each step, density supplies a point between the finitely many already matched neighbors, or absence of endpoints supplies a point beyond them. The appropriate interval contains infinitely many points, so the finitely many used points can be avoided. The union is the required bijection $g$.
  The map $g$ induces the group isomorphism
  $ hat(g) : G \( B^M \) arrow.r G \( B^N \) \, #h(2em) u mapsto g \[ u \] \, $
  where elements of the coded groups are identified here with their finite supports. Match the two copies of $G_(*)$ by their distinguished elements. Enumerate $B^M$ as $\( b_k : k < omega \)$; this enumeration need not respect its order.
  Fix one tuple $t$ of distinct points in $I^M$, and let $f \( t \)$ be its coordinatewise image. Choose representatives
  $ z_n in Z_(t \, n)^M \, & w_k in W_(t \, b_k)^M \,\
z'_n in Z_(f \( t \) \, n)^N \, & w'_k in W_(f \( t \) \, g \( b_k \))^N . $
  Write their bit matrices as
  $ a \( n \, k \) = e^M \( z_n \, w_k \) \, #h(2em) a' \( n \, k \) = e^N \( z'_n \, w'_k \) \, $
  and let $d \( n \, k \) = a \( n \, k \) + a' \( n \, k \)$, with addition in $bb(Z) \/ 2 bb(Z)$. Define translators by
  #[#set math.equation(numbering: n => "(5.11)")
   $ U_n & = { g \( b_k \) : k lt.eq n upright(" and ") d \( n \, k \) = 1 } in G \( B^N \) \,\
V_k & = { n : n < k upright(" and ") d \( n \, k \) = 1 } in G_(*) . $ <cat:triangle-supports>]
  Every $U_n$ is finite, since it uses only the first $n + 1$ columns; every $V_k$ is finite, since it uses only the first $k$ rows. The two regions in (5.11) partition the matrix, so
  #[#set math.equation(numbering: n => "(5.12)")
   $ bold(1)_(g \( b_k \) in U_n) + bold(1)_(n in V_k) = d \( n \, k \) med \( mod med 2 \) #h(2em) \( n \, k < omega \) . $ <cat:triangle-equation>]
  Figure 1 illustrates this allocation of finite supports.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.52, -0.52), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, 0), (1.04, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((1.04, 0), (1.56, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((1.56, 0), (2.08, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((2.08, 0), (2.6, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((2.6, 0), (3.12, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((3.12, 0), (3.64, -0.52), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -0.52), (0.52, -1.04), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -0.52), (1.04, -1.04), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -0.52), (1.56, -1.04), fill: rgb("#f9dda7"), stroke: none)
  rect((1.56, -0.52), (2.08, -1.04), fill: rgb("#f9dda7"), stroke: none)
  rect((2.08, -0.52), (2.6, -1.04), fill: rgb("#f9dda7"), stroke: none)
  rect((2.6, -0.52), (3.12, -1.04), fill: rgb("#f9dda7"), stroke: none)
  rect((3.12, -0.52), (3.64, -1.04), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -1.04), (0.52, -1.56), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -1.04), (1.04, -1.56), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -1.04), (1.56, -1.56), fill: rgb("#b6dadf"), stroke: none)
  rect((1.56, -1.04), (2.08, -1.56), fill: rgb("#f9dda7"), stroke: none)
  rect((2.08, -1.04), (2.6, -1.56), fill: rgb("#f9dda7"), stroke: none)
  rect((2.6, -1.04), (3.12, -1.56), fill: rgb("#f9dda7"), stroke: none)
  rect((3.12, -1.04), (3.64, -1.56), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -1.56), (0.52, -2.08), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -1.56), (1.04, -2.08), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -1.56), (1.56, -2.08), fill: rgb("#b6dadf"), stroke: none)
  rect((1.56, -1.56), (2.08, -2.08), fill: rgb("#b6dadf"), stroke: none)
  rect((2.08, -1.56), (2.6, -2.08), fill: rgb("#f9dda7"), stroke: none)
  rect((2.6, -1.56), (3.12, -2.08), fill: rgb("#f9dda7"), stroke: none)
  rect((3.12, -1.56), (3.64, -2.08), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -2.08), (0.52, -2.6), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -2.08), (1.04, -2.6), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -2.08), (1.56, -2.6), fill: rgb("#b6dadf"), stroke: none)
  rect((1.56, -2.08), (2.08, -2.6), fill: rgb("#b6dadf"), stroke: none)
  rect((2.08, -2.08), (2.6, -2.6), fill: rgb("#b6dadf"), stroke: none)
  rect((2.6, -2.08), (3.12, -2.6), fill: rgb("#f9dda7"), stroke: none)
  rect((3.12, -2.08), (3.64, -2.6), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -2.6), (0.52, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -2.6), (1.04, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -2.6), (1.56, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((1.56, -2.6), (2.08, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((2.08, -2.6), (2.6, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((2.6, -2.6), (3.12, -3.12), fill: rgb("#b6dadf"), stroke: none)
  rect((3.12, -2.6), (3.64, -3.12), fill: rgb("#f9dda7"), stroke: none)
  rect((0, -3.12), (0.52, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((0.52, -3.12), (1.04, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((1.04, -3.12), (1.56, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((1.56, -3.12), (2.08, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((2.08, -3.12), (2.6, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((2.6, -3.12), (3.12, -3.64), fill: rgb("#b6dadf"), stroke: none)
  rect((3.12, -3.12), (3.64, -3.64), fill: rgb("#b6dadf"), stroke: none)
  line((0, -3.64), (0, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0.52, -3.64), (0.52, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.04, -3.64), (1.04, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.56, -3.64), (1.56, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.08, -3.64), (2.08, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.6, -3.64), (2.6, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.12, -3.64), (3.12, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.64, -3.64), (3.64, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -3.64), (3.64, -3.64), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -3.12), (3.64, -3.12), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2.6), (3.64, -2.6), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2.08), (3.64, -2.08), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -1.56), (3.64, -1.56), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -1.04), (3.64, -1.04), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.52), (3.64, -0.52), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (3.64, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.468), (3.952, 0.468), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.952, 0.468), [#text(size: 9pt)[column $k$]], anchor: "west", padding: 0.1176cm)
  line((-0.52, 0), (-0.52, -3.952), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-0.52, -3.952), [#text(size: 9pt)[row $n$]], anchor: "north", padding: 0.1176cm)
  content((0.26, 0.182), [#text(size: 9pt)[$0$]])
  content((0.78, 0.182), [#text(size: 9pt)[$1$]])
  content((1.3, 0.182), [#text(size: 9pt)[$2$]])
  content((1.82, 0.182), [#text(size: 9pt)[$3$]])
  content((2.34, 0.182), [#text(size: 9pt)[$4$]])
  content((2.86, 0.182), [#text(size: 9pt)[$5$]])
  content((3.38, 0.182), [#text(size: 9pt)[$6$]])
  content((-0.208, -0.26), [#text(size: 9pt)[$0$]])
  content((-0.208, -0.78), [#text(size: 9pt)[$1$]])
  content((-0.208, -1.3), [#text(size: 9pt)[$2$]])
  content((-0.208, -1.82), [#text(size: 9pt)[$3$]])
  content((-0.208, -2.34), [#text(size: 9pt)[$4$]])
  content((-0.208, -2.86), [#text(size: 9pt)[$5$]])
  content((-0.208, -3.38), [#text(size: 9pt)[$6$]])
  rect((0, -2.08), (2.6, -2.6), stroke: (paint: rgb("#194169"), thickness: 1.2pt, miter-limit: 10))
  rect((2.6, 0), (3.12, -2.6), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  content((4.16, -0.624), [#text(size: 9pt)[$k lt.eq n$: adjust in row $n$#linebreak()at most $n+1$ positions]], anchor: "west", padding: 0.1176cm)
  content((4.16, -1.664), [#text(size: 9pt)[$n<k$: adjust in column $k$#linebreak()at most $k$ positions]], anchor: "west", padding: 0.1176cm)
  content((4.16, -2.964), [#text(size: 9pt)[Highlighted examples:#linebreak()row $n=4$, column $k=5$]], anchor: "west", padding: 0.1176cm)
  content((3.9, -3.38), [#text(size: 9pt)[$dots.h$]])
  content((3.38, -3.9), [#text(size: 9pt)[$dots.v$]])
})],
    caption: [Figure 1: A finite portion of the countably infinite difference matrix. The two regions partition its entries. Each row uses only the finitely many positions $k lt.eq n$, and each column only the finitely many positions $n < k$; within these positions one shifts exactly where the difference bit is one. Thus finite row and column translations remove every difference matrix. The column enumeration need not respect the dense order. ],
  ) <fig:matrix-decomposition>
  Set $tilde(z)'_n = z'_n + U_n$ and $tilde(w)'_k = w'_k + V_k$. The action equation for the bit relation and (5.12) give
  $ e^N \( tilde(z)'_n \, tilde(w)'_k \) = a' \( n \, k \) + d \( n \, k \) = a \( n \, k \) . $
  Because every fiber is a torsor, its points have unique expressions relative to its chosen representative. We therefore obtain bijections of the row and column fibers by setting
  #[#set math.equation(numbering: n => "(5.13)")
   $ z_n + u & mapsto tilde(z)'_n + hat(g) \( u \) &  & \( u in G \( B^M \) \) \,\
w_k + v & mapsto tilde(w)'_k + v &  & \( v in G_(*) \) . $ <cat:equivariant-maps>]
  These maps are equivariant and hence preserve the action graphs. For arbitrary $u in G \( B^M \)$ and $v in G_(*)$, their target bit is
  $ e^N \( tilde(z)'_n + hat(g) \( u \) \, tilde(w)'_k + v \) & = a \( n \, k \) + bold(1)_(g \( b_k \) in hat(g) \( u \)) + bold(1)_(n in v)\
 & = a \( n \, k \) + bold(1)_(b_k in u) + bold(1)_(n in v)\
 & = e^M \( z_n + u \, w_k + v \) . $
  Thus they preserve the entire bit relation, not just the bits at representatives.
  Carry out this construction separately for every tuple $t$. The row and column fibers of distinct tuples are disjoint, and there are no additional bit or action relations between different tuples. Together with $f$, $g$, $hat(g)$, and the distinguished-element map on $G_(*)$, these fiber maps give a bijection of the whole universes. They preserve and reflect the sort predicates, tuple and base projections, order, group incidence and operation graphs, action graphs, distinguished elements, and bits. They therefore form an isomorphism of the structures. ◻
]

#thm([Theorem 5.10.])[
  #emph[The class $K$ is categorical in every cardinal $mu gt.eq Lambda$.]
] <cat:tail>

#proof[
  Fix such a cardinal $mu$. By Lemma 13, choose a model with $\| I \| = mu$, base order $bb(Q)$, the specified group torsors, and, for example, zero bit sequences at the chosen representatives. The countable base order makes the object test automatic. Lemma 10 gives cardinality exactly $mu$, proving existence.
  Now let $M in K$ have cardinality $mu$. By Lemmas 9 and 10,
  $ \| B^M \| lt.eq delta < Lambda lt.eq mu \, #h(2em) mu = max \( \| I^M \| \, \| B^M \| \, ℵ_0 \) . $
  It follows that $\| I^M \| = mu$. Proposition 30 therefore forces $B^M$ to be countable. Any two models of size $mu$ now have equally sized index sorts and countable base orders, so Lemma 32 makes them isomorphic. This proves existence of exactly one isomorphism type at every $mu gt.eq Lambda$, including $mu = Lambda$ itself. ◻
]

== 6 The endpoint failure and its logical scope <sec:conclusion>

#proof[
  Work in ZFC with CH. Theorem 18 gives an AEC $K$ with $"LS" \( K \) = ℵ_0$. Hence
  $ H \( K \) = ℶ_(\( 2^(ℵ_0) \)^(+)) = ℶ_(omega_2) = ℶ_eta . $
  Theorem 23 supplies two nonisomorphic models of this cardinality. Theorem 33 gives categoricity in every $mu gt.eq Lambda$. Finally, Cantor’s theorem gives $xi = 2^delta gt.eq delta^(+) = eta$, so $xi^(+) > eta$. By strict increase of the beth hierarchy,
  $ Lambda = ℶ_(xi^(+)) > ℶ_eta = H \( K \) . $
  Thus $lambda = Lambda^(+)$ satisfies the premise of the proposed transfer and its conclusion fails at $mu = H \( K \)$, as claimed. ◻
]

=== 6.1 The set-theoretic formulation <the-set-theoretic-formulation>

For a literal first-order consistency statement, let $Theta$ assert that there is a set $p = \( iota_k : k gt.eq 1 \)$ of coding maps as in Lemma 3 for which the particular formulas of Definition 12 define an AEC $K_p$ with $"LS" \( K_p \) = ℵ_0$, two nonisomorphic models of cardinality $h \( ℵ_0 \)$, and categoricity in $Lambda^(+) > h \( ℵ_0 \)$, where $Lambda = ℶ_(\( 2^(ℵ_1) \)^(+))$. Here the fixed definitions and the AEC and categoricity conditions are expanded into one sentence of set theory; all quantified parameters, structures, maps, and sequences are sets.

For the statements involving $Phi$, fix a first-order formulation of the universal assertion (1.2) such that ZFC proves its implication to the following fixed-family instance: for every valid $p$, if $K_p$ is an AEC with $"LS" \( K_p \) = ℵ_0$, $Lambda^(+) > h \( ℵ_0 \)$, and categoricity in $Lambda^(+)$, then $K_p$ is categorical in $h \( ℵ_0 \)$. The conclusions about $Phi$ below are read separately for each such formulation. In particular, ZFC proves $Theta arrow.r.double not Phi$.

#thm([Corollary 6.1.])[
  #emph[ZFC proves $upright("CH") arrow.r.double Theta$. For each fixed $Phi$ as above, it also proves $upright("CH") arrow.r.double not Phi$, and 
$ "Con" \( upright("ZFC") \) quad arrow.r.double quad "Con" \( upright("ZFC") + Theta \) quad arrow.r.double quad "Con" \( upright("ZFC") + not Phi \) . $

 If ZFC is consistent, no such $Phi$ is a theorem of ZFC.]
] <cor:consistency>

#proof[
  The class and strong relation are given by fixed formulas with the set of coding maps as parameter. Expanding these formulas in the AEC axioms and the stated model assertions gives the sentence $Theta$. The construction and its verification in Theorem 1 therefore prove, in ZFC, $upright("CH") arrow.r.double Theta$.
  For each $Phi$ specified above, its ZFC-provable fixed-family instance applies to the parameter witnessing $Theta$. It would give categoricity in $h \( ℵ_0 \)$, contradicting the two nonisomorphic models required by $Theta$. Thus ZFC proves $Theta arrow.r.double not Phi$.
  Gödel’s relative-consistency theorem #cite(label("Godel1938")) gives $"Con" \( upright("ZFC") \) arrow.r.double "Con" \( upright("ZFC") + upright("CH") \)$. Since the latter theory proves $Theta$, its consistency implies $"Con" \( upright("ZFC") + Theta \)$, and the proved implication $Theta arrow.r.double not Phi$ then gives $"Con" \( upright("ZFC") + not Phi \)$. If $Phi$ were a theorem of consistent ZFC, adjoining $not Phi$ could not give a consistent theory. ◻
]

The corollary gives one-sided nonprovability, not independence in both directions: neither an unconditional ZFC proof of $not Phi$ nor consistency of $Phi$ is asserted. The constructed class is categorical on a higher tail, so the obstruction concerns the prescribed endpoint and is compatible with qualitative eventual categoricity. No qualitative eventual-categoricity theorem is used in the argument.

=== 6.2 Why structural transfer theorems do not apply <why-structural-transfer-theorems-do-not-apply>

For clarity, the construction fails both joint embedding and amalgamation, although neither failure was needed as an input to the proof. Joint embedding means that any two models admit strong embeddings into a common model. Amalgamation requires such embeddings over a given common strong submodel, agreeing on that submodel.

#thm([Proposition 6.2.])[
  #emph[The class $K$ has neither joint embedding nor amalgamation. The failure of amalgamation can be witnessed over a countable model.]
] <prop:no-amalgamation>

#proof[
  Let $M$ be the model with uncountable base from Theorem 23. By Theorem 18, choose a countable $A lt.eq_K M$. Construct an extension $N$ of $A$ by enlarging only its index sort to cardinality $Lambda^(+)$, keeping $B^N = B^A$, both old group sorts, and all fibers and bits belonging to old tuples. For each new tuple add the required independent torsors and any bit array satisfying the translation law. The countability of $B^N$ makes the object condition automatic. This is a basic inclusion $A subset.eq N$, and the strong condition is vacuous because the base order has not grown. Thus $A lt.eq_K N$.
  If $M$ and $N$ strongly embedded into a common model $P$, the image of $M$ would force $B^P$ to be uncountable and the image of $N$ would force $\| I^P \| gt.eq Lambda^(+)$. This contradicts Proposition 30. There is therefore no joint embedding of $M \, N$, and in particular no amalgam of the two extensions $A lt.eq_K M \, N$. ◻
]

Proposition 35 explains why results imposing amalgamation, such as #cite(label("Vasey2017Downward")) Corollary 9.10, do not contradict Theorem 1. Likewise, the existence Hanf theorem does not imply that the particular model $M$ has arbitrarily large extensions. The full class has arbitrarily large models with countable base; its uncountable-base part has the separate bound proved in Proposition 30. That part cannot itself have Löwenheim–Skolem number $ℵ_0$, because it has no countable models.

== 7 An obstruction to Booleanizing the canonical point <sec:booleanization>

The distinction between an extension somewhere in the class and an extension inside a fixed model also affects the topos argument in #cite(label("Espindola2023Spectra")) Theorem 4.1. We give a concrete obstruction on the site of countable models: adding a base point is always possible there, but need not be possible inside a given countable-base model. The resulting dense cosieve prevents that model’s canonical presheaf point from factoring through the full double-negation subtopos. Throughout this section we retain CH and the class constructed above.

=== 7.1 Adding base points to a countable model <adding-base-points-to-a-countable-model>

#thm([Lemma 7.1.])[
  #emph[Every countable $M in K$ has a countable strong extension $M'$ with $I^(M') = I^M$ and $B^M subset.neq B^(M')$.]
] <bool:extension>

#proof[
  First we construct compatible colors for all tuples over $I = I^M$. Choose an injection $j : I arrow.r omega$. For each nonempty finite $X subset.eq I$, choose a surjection $d_X : omega arrow.r omega$, requiring $d_({ x }) \( 0 \) = j \( x \)$. For example, set $d_X \( n + 1 \) = n$, and choose the zeroth value as prescribed for singletons and as zero otherwise. For a tuple $t = \( x_1 \, dots.h \, x_k \)$ and a label $\( J \, n \) in cal(L)_k$, put
  $ q_t \( J \, n \) = d_({ x_r : r in J }) \( n \) . $
  Define a diagram $D_t$ by equality of these values, by ordinal membership between them, and by the tag $rho_t \( J \, n \) = q_t \( J \, n \)$. Its quotient is $omega$, since the labels $\( \[ k \] \, n \)$ already surject onto $omega$. Ordinal membership on this quotient is extensional and strictly decreases the tags, which lie below $delta$. The distinguished singleton labels have the distinct values $j \( x_r \)$. Thus $D_t$ is valid. Restricting to a subsequence gives exactly its separately valid diagram: the definition of $d_X$ depends on the underlying finite set, not its position in a larger tuple. Consequently the colors $s_t = iota_k \( D_t \)$ satisfy every full-subsequence test. When $I$ is infinite, the unary colors are distinct; when $I$ is finite, there are no tuples at sufficiently large arities. Thus this does not produce the fixed-arity pattern excluded by Lemma 25.
  Take the ordered sum $B' = B^M + bb(Q)$, with a disjoint copy of $bb(Q)$. It is a countable dense order without endpoints, and $B^M$ is convex in it. Keep $I^M$ and the exact old labeled group $G_(*)^M$. Enlarge $G \( B^M \)$ to $G \( B' \)$ by retaining each old code with its old support and adding one new code for every remaining finite subset of $B'$. Choose old row origins $z_(t \, n)$, and extend each old row torsor to a $G \( B' \)$-torsor: retain the points with old support coordinates and adjoin one point for each remaining coordinate, with the action given by symmetric difference. Keep every old column torsor, choose an origin $w_(t \, b)$ in it, and add a new $G_(*)^M$-torsor with an origin $w_(t \, b)$ for each new $b$.
  Choose $a_t in 2^omega$ representing $s_t$, and prescribe the origin bits by
  $ a_(t \, b) \( n \) = cases(delim: "{", e^M \( z_(t \, n) \, w_(t \, b) \) \, & b in B^M \,, a_t \( n \) \, & b in B' \\ B^M .) $
  Extend them to all points by the torsor formula
  $ e' \( z_(t \, n) + u \, w_(t \, b) + v \) = a_(t \, b) \( n \) + bold(1)_(b in "supp" \( u \)) + bold(1)_(n in v) med \( mod med 2 \) . $
  Unique torsor coordinates make this well-defined. The old translation law (3.1) shows that every old bit, true or false, is unchanged. All group and action values on old arguments are unchanged as well. Give the enlarged carriers exactly the required relations, with zero bits between different tuple fibers. This is a basic inclusion, and its countable base makes the enlarged structure an object.
  At every new base point the colors, using the chosen old rows, are the $s_t$, so all old-tuple tests pass. Changing to other old row points has no effect there: the translators have supports contained in $B^M$. Changing column origins preserves colors modulo $=^(*)$. Hence the inclusion is strong, not just basic. Finally, Lemma 10 makes the extension countable. ◻
]

=== 7.2 The site and the canonical point <the-site-and-the-canonical-point>

Let $cal(C)_0$ be a small skeleton of the category of countable models in $K$ and strong embeddings. We use covariant presheaves $cal(P) = upright("Set")^(cal(C)_0)$, that is, presheaves on $cal(C)_0^(upright("op"))$, and write $y_A = "Hom"_(cal(C)_0) \( A \, - \)$. A cosieve on $A$ is a collection of maps out of $A$ closed under postcomposition, or equivalently a subfunctor of $y_A$. The double-negation topology $J_(not not)$ on $cal(C)_0^(upright("op"))$ declares a cosieve $R$ covering exactly when

#[#set math.equation(numbering: n => "(7.1)")
 $ upright("for every ") f : A arrow.r D upright(" there is ") g : D arrow.r E upright(" with ") g f in R . $ <bool:density>]

Thus $"Sh" \( cal(C)_0^(upright("op")) \, J_(not not) \)$ is the full double-negation Booleanization of $cal(P)$.

For a regular infinite cardinal $theta$, a poset is $theta$-directed if every subset of cardinality less than $theta$ has an upper bound. A model $M$ is $theta$-presentable if $"Hom"_K \( M \, - \)$ preserves $theta$-directed colimits; its presentability rank is the least regular infinite $theta$ with this property. Our site is also the countable #emph[internal-size] site in the convention of #cite(label("Espindola2022Eventual")) Definition 2.3 and the notation at the end of Section 2. Indeed, for every regular $theta > ℵ_0$, a model of cardinality less than $theta$ is $theta$-presentable: its image in a $theta$-directed colimit lies in one stage, coherence makes the factorization strong, and embeddings give uniqueness. Conversely, every model is the union of its strong submodels of cardinality less than $theta$, a $theta$-directed family by the downward Löwenheim–Skolem property and regularity of $theta$. If the model has cardinality at least $theta$, its identity cannot factor through any member of this family. An uncountable model of cardinality $nu$ therefore has presentability rank $nu^(+)$. A countable model has rank either $ℵ_0$ or $ℵ_1$. The cited convention assigns internal size $nu$ to rank $nu^(+)$, and assigns a limit rank to itself. Thus internal and underlying cardinalities agree here, including at $ℵ_0$.

For any $H in K$, let $cal(C)_0 \/ H$ have as objects the strong maps $c : C arrow.r H$ with $C in cal(C)_0$, and as arrows the commuting triangles. It is $ℵ_1$-filtered: countably many images are contained in a countable strong submodel of $H$, and coherence gives the required transition maps. Parallel arrows over $H$ are equal because the maps into $H$ are injective. The canonical point $p_H : upright("Set") arrow.r cal(P)$ has inverse image

#[#set math.equation(numbering: n => "(7.2)")
 $ p_H^(*) \( X \) = upright("colim")_(\( C \, c \) in cal(C)_0 \/ H) X \( C \) \, #h(2em) p_H^(*) \( y_A \) = "Hom"_K \( A \, H \) . $ <bool:point>]

The first formula preserves colimits and finite limits, giving a point; in fact it preserves countable limits since the indexing category is $ℵ_1$-filtered. In the second formula, a representative $r : A arrow.r C$ maps to $c r$. Every map into $H$ occurs this way, and two representatives with the same composite agree after passing to a common countable strong submodel of $H$. No identification of all points of $cal(P)$ with models of $K$ is needed.

#thm([Proposition 7.2.])[
  #emph[If $H in K$ has countable base, its canonical point $p_H$ does not factor through $"Sh" \( cal(C)_0^(upright("op")) \, J_(not not) \)$. This applies, in particular, to every model on the categoricity tail $parallel H parallel gt.eq Lambda$.]
] <bool:obstruction>

#proof[
  Choose a countable strong map $a : A arrow.r H$ whose image contains $B^H$, using the downward Löwenheim–Skolem property and then the representative in $cal(C)_0$. Define
  $ R_A = { r : A arrow.r D upright(" in ") cal(C)_0 : r \[ B^A \] subset.neq B^D } subset.eq y_A . $
  Injectivity makes this a cosieve. For any $f : A arrow.r D$, Lemma 36, followed by an isomorphism to the chosen representative in $cal(C)_0$, gives a countable strong map $g : D arrow.r D'$ adding a base point outside $g \[ B^D \]$. It follows that $g f in R_A$. Thus $R_A$ satisfies (7.1), without any amalgamation assumption.
  The image of $p_H^(*) \( R_A \) arrow.r p_H^(*) \( y_A \)$ consists exactly of maps $A arrow.r H$ factoring as $h r$ with $r in R_A$ and $h : D arrow.r H$ strong. But $a$ has no such factorization. If $a = h r$, choose $b in B^D \\ r \[ B^A \]$. Since $h \( b \) in B^H = a \[ B^A \]$, there is $x in B^A$ with $h \( b \) = a \( x \) = h \( r \( x \) \)$, contrary to injectivity of $h$.
  Sheafification for $J_(not not)$ inverts the dense inclusion $R_A arrow.r.hook y_A$. If $p_H$ factored through the sheaf subtopos, its inverse image would therefore send that inclusion to an isomorphism. The omitted element $a$ proves that it does not even send it to a surjection. Finally, models of cardinality at least $Lambda$ have countable base by Lemmas 9 and 10 together with Proposition 30, and exist by Theorem 33. ◻
]

=== 7.3 The precise comparison <the-precise-comparison>

The proof of #cite(label("Espindola2023Spectra")) Theorem 4.1, in the cited version, starts with the full double-negation subtopos on the internal-size site and asserts that the large categorical model gives a point of it. Proposition 37 rules out the canonical factorization for the present class, even though its point preserves countable limits. A topology generated by a smaller chosen family of covers could omit $R_A$; in that case it would not be the full double-negation topology used in that step.

This is an explicit obstruction to that step, not a classification of all points of the Booleanization or a proof that it has no points. It does not analyze alternative constructions of points or establish what additional hypotheses would suffice to repair the cited argument.


#bibliography("refs.bib", style: "ieee", title: [References])
