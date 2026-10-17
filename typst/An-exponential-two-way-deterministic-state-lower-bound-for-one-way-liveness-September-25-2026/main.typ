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

#align(center)[#text(size: 16pt, weight: "bold")[An exponential two-way deterministic \
state lower bound for one-way liveness]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Two-way deterministic automata recognize the same languages as one-way finite automata, as established by Rabin and Scott and by Shepherdson #cite(label("RabinScott1959")) #cite(label("Shepherdson1959")). Allowing the head to return to a symbol can nevertheless change the amount of finite control needed to recognize a language. How much finite control is needed to replace nondeterministic choices by deterministic head motion? Sakoda and Sipser posed the state cost of converting one-way and two-way nondeterministic finite automata to two-way deterministic automata in 1978 #cite(label("SakodaSipser1978")). The question concerns succinctness: the simulator may revisit the input, but must store all information other than the head position in its finite state. A polynomial simulation would make nondeterminism inexpensive in this measure even when the source machine itself moves in both directions.

The witness used here is Sakoda and Sipser’s complete family $B_h$, now called #emph[one-way liveness]: each letter specifies a binary relation on an $h$-element set, and a word is live when the product of its letters is nonempty. Their Theorem 2.3 establishes this family’s completeness for one-way-nondeterministic to two-way-deterministic state conversion #cite(label("SakodaSipser1978")). Our proof below gives the small source automaton and the context-separation property directly, with the conventions and exact state counts used here.

Earlier exponential lower bounds restrict the motion of the deterministic target. Sipser proved an exponential separation for sweeping automata, whose head changes direction only at an endmarker #cite(label("Sipser1980")). Kapoutsis extended this phenomenon to deterministic machines constrained to make sublinearly many reversals as a function of input length #cite(label("Kapoutsis2013")). An unrestricted target can instead reverse at an interior cell and make arbitrarily many reversals as the input length grows.

Quadratic lower bounds against unrestricted two-way deterministic targets already occur in Chrobak’s work on unary languages #cite(label("Chrobak1986Unary")) #cite(label("Chrobak2003Errata")). For the promise restriction of one-way liveness to words of exactly three relation letters, Kapoutsis proved the optimal order $Theta \( h^2 \/ log h \)$ #cite(label("Kapoutsis2018ShortLiveness")); the alphabet there is still the full relation alphabet. Adeogun and Kapoutsis #cite(label("AdeogunKapoutsis2026")) prove a quadratic lower bound for unrestricted deterministic two-way automata against one-way liveness. We prove an exponential bound for that unrestricted target model. The source automata use no left moves, whereas the lower bound permits stay moves, partial transition rules, and nonaccepting infinite computations in the target.

The main representation difficulty is to account for repeated visits to a cell while assigning each input symbol a fixed object independent of its neighbors. We use the Brauer diagram monoid, whose matchings underlie Brauer’s algebras #cite(label("Brauer1937")) #cite(label("Auinger2012")): its elements are perfect matchings on two equally sized sets of ports, and multiplication glues the adjoining sets and contracts paths. Determinism makes the configurations reaching a designated accepting sink form a tree. A tour of that tree gives the required matching representation, with separate leaves for unused transition candidates ensuring that each cell’s wiring depends only on its own symbol. The algebraic part then proves an exponential lower bound on the number of ports whenever matching products retain all the information in arbitrary relation products. All diagram and relation-monoid facts needed for this argument are proved below.

=== 1.1 Model and statement <model-and-statement>

An automaton has a finite state set and one read-only head on a finite word over an alphabet $Sigma$, bracketed by two distinct endmarkers outside $Sigma$. Its head starts at the left endmarker in a designated initial state. A transition changes the state and moves the head left, right, or not at all; the head cannot cross an endmarker. A transition depends only on the current state and scanned symbol. Deterministic transition rules may be partial. A nondeterministic rule permits several successors. There are no additional heads, writable cells, work tapes, advice, or randomness. All states, including initial and accepting states, are counted.

Acceptance means that a finite computation reaches an accepting state; a nonaccepting infinite computation rejects. We initially count an accepting initial configuration as success. If success instead requires a positive transition into an accepting state, the normalization in Section 4 uses one additional initial copy. The main bound below includes this extra state and holds with either convention.

For a finite set $H$, let $cal(R)_H$ be the monoid of all binary relations on $H$. Products are in path order from left to right:

$ \( x \, z \) in A B quad arrow.l.r.double quad upright("there exists ") y in H upright(" with ") \( x \, y \) in A \, med \( y \, z \) in B . $

Write $I_F = { \( x \, x \) : x in F }$ for $F subset.eq H$; the identity is $I_H$ and the zero is the empty relation $0$. For $H = \[ h \]$ define

#[#set math.equation(numbering: n => "(1.1)")
 $ sans(O W L)_h = { R_1 dots.h.c R_ell in \( cal(R)_(\[ h \]) \)^(*) : R_1 dots.h.c R_ell eq.not 0 } . $ <eq:liveness-language>]

The product of the empty word is $I_(\[ h \])$, so $epsilon in sans(O W L)_h$.

#thm([Theorem 1.1.])[
  #emph[For every integer $h gt.eq 2$, the language $sans(O W L)_h$ is recognized by a nondeterministic automaton with $h + 3$ states using no left moves. Every equivalent deterministic two-way automaton with $s$ states satisfies 
#[#set math.equation(numbering: n => "(1.2)")
 $ 4 \( s + 2 \)^2 gt.eq 2^(floor.l \( h - 2 \) \/ 31 floor.r) . $ <eq:main-bound>]

 If an initially accepting configuration counts as acceptance, $s + 2$ in (1.2) may be replaced by $s + 1$.]
] <thm:main>

#thm([Corollary 1.2.])[
  #emph[There are no absolute constants $C \, c > 0$ such that every $n$-state two-way nondeterministic automaton over every finite alphabet has an equivalent two-way deterministic automaton with at most $C n^c$ states.]
] <cor:no-polynomial>

#proof[
  Put $n = h + 3$ in Theorem 1. Every deterministic equivalent for this family has at least
  $ 2^(1 / 2 floor.l \( n - 5 \) \/ 31 floor.r - 1) - 2 $
  states. This bound exceeds $C n^c$ for every fixed $C \, c$ when $n$ is large enough. For each $h$ the alphabet has $2^(h^2)$ symbols and is finite. Since the constants in the proposed simulation must be independent of the alphabet, the family is within its scope. ◻
]

=== 1.2 Proof architecture <proof-architecture>

Write $cal(D)_k$ for the matching monoid of degree $k$. The proof compares two bounds on $k$. Theorem 9 represents each $s$-state deterministic machine by symbol diagrams in $cal(D)_k$, with $k lt.eq 4 \( s + 2 \)^2$. For a machine recognizing $sans(O W L)_h$, Lemma 13 gives a unital surjection from the submonoid generated by its ordinary-symbol diagrams onto $cal(R)_(\[ h \])$. Concretely, the map sends each word diagram to its relation product, preserves multiplication and the empty product, and reaches every relation on $\[ h \]$. These three properties, including the full image, are the algebraic input to the lower bound. Corollary 8 then forces $k gt.eq 2^(floor.l \( h - 2 \) \/ 31 floor.r)$. These three statements give the deterministic lower bound in Theorem 1.

We prove the algebraic bound first. The #emph[rank] of a matching diagram counts its pairs joining opposite sides. A diagram $e$ is #emph[idempotent] if $e^2 = e$; its #emph[corner] consists of the diagrams $z$ with $e z = z e = z$, with identity $e$. Section 2 reduces the corner of an idempotent of rank $r$ to degree $r$, preserving rank and controlling the indices at which the diagram differs from the identity. An idempotent of rank $r$ in $cal(D)_k$ differs from the identity on at most $2 \( k - r \)$ indices. The support control is uniform: a family supported in one set remains supported in a single set of no greater size after reduction. Section 3 uses $32$ conjugates of one idempotent to make $256$ successive relation additions. A common support set bounds their total rank loss, while each addition yields a further corner representing all relations on $h - 31$ points. Comparing these bounds doubles the required rank loss every $31$ points.

Section 4 obtains local symbol diagrams by converting acceptance to reachability of a designated sink. Its undirected component is a tree, whose doubled tour supplies the matching test. This traversal has precedents in Sipser’s halting method and in the reversible simulation of Lange, McKenzie, and Tapp #cite(label("SipserHalting1980")) #cite(label("LangeMcKenzieTapp2000")). Candidate transition slots completed by separate leaves make the construction independent of neighboring symbols. Finally, Section 5 obtains the quotient by using singleton-identity context letters to test each pair in a relation product. No input-length or running-time bound is imposed.

=== 1.3 Related results <related-results>

Adeogun and Kapoutsis also analyze limitations of their earlier lower-bound construction #cite(label("AdeogunKapoutsisLimitation2026")). They prove a quadratic ceiling for its sequences of connectivity properties and state a general-property extension whose proof is deferred. The amplification here uses a fixed chain of $256$ additions. Its exponential bound comes from the inductive lower bound on each rank loss in a smaller full relation corner, together with one common support budget for all additions.

The companion paper #cite(label("CompanionComplementation2026")) Theorem 1.1 proves that a nondeterministic two-way automaton for the complement of $sans(O W L)_h$ requires at least $1 / 2 2^(floor.l \( h - 2 \) \/ 127 floor.r) - 1$ states. The present proof establishes the deterministic bound directly using matching diagrams. Both results concern state succinctness over growing alphabets; neither yields a uniform logarithmic-space separation or a bound measured by transition-table size.

== 2 Matching and relation corners <sec:matching>

We first establish the algebraic properties used in the rank argument. All monoid products in this paper are in path order: in a product $a b$, the factor $a$ is placed to the left of the factor $b$. A homomorphism is called #emph[unital] when it preserves the designated identities.

=== 2.1 Matching diagrams, rank, and support <matching-diagrams-rank-and-support>

For an integer $m gt.eq 0$, let $\[ m \] = { 1 \, dots.h \, m }$, with $\[ 0 \] = diameter$. A #emph[matching diagram of degree $m$] is a perfect matching on two disjoint sets of ports, a left set and a right set, each indexed by $\[ m \]$. Only the paired ports matter; crossings in a drawing have no significance. Let $cal(D)_m$ be the set of these diagrams.

To multiply $a \, b in cal(D)_m$, identify the right port indexed $i$ of $a$ with the left port indexed $i$ of $b$, for every $i in \[ m \]$. In the resulting finite multigraph, each outside port has degree one and each identified port has degree two. Thus every component meeting an outside port is a path with two outside endpoints. Pair these endpoints and discard the components without outside ports. The result is $a b$. Parallel edges, when they occur at the interface, are counted separately.

This multiplication is associative. Indeed, in any string of glued diagrams, a substring can be replaced by the matching of its boundary endpoints: each path through the substring is replaced by one edge with the same endpoints. This preserves the connections between the outer ports of the whole string. Components internal to the substring have no connection to those ports. Contracting the first or the last two factors in a string of three therefore gives the same outside matching. The diagram $upright(bold(1))_m$ pairing each left port $i$ with right port $i$ is an identity. In particular, $cal(D)_0 = { upright(bold(1))_0 }$ is the one-element monoid. The monoids $cal(D)_m$ are the Brauer diagram monoids, whose matchings underlie Brauer’s algebras #cite(label("Brauer1937")). Their semigroup structure and transversal rank have been studied in particular by Auinger and by East and Gray #cite(label("Auinger2012")) #cite(label("EastGray2017")).

A pair joining opposite sides is a #emph[transversal]; a pair on one side is a #emph[cap]. Write $"rank" \( a \)$ for the number of transversals of $a$, and define

$ "supp" \( a \) = { i in \[ m \] : a upright(" does not pair left ") i upright(" with right ") i } . $

We say that $a$ is #emph[supported in] $J subset.eq \[ m \]$ if $"supp" \( a \) subset.eq J$.

#thm([Lemma 2.1.])[
  (Rank and support).  #emph[For $a \, b in cal(D)_m$, 
$ "rank" \( a b \) lt.eq min { "rank" \( a \) \, "rank" \( b \) } \, #h(2em) m - "rank" \( a \) lt.eq \| "supp" \( a \) \| . $

 The units of $cal(D)_m$ are exactly its rank-$m$ diagrams, which are the permutation diagrams. The only rank-$m$ idempotent is $upright(bold(1))_m$. Conjugation by a permutation diagram preserves rank. For every $J subset.eq \[ m \]$, the diagrams supported in $J$ form a submonoid of $cal(D)_m$.]
] <lem:rank-basic>

#proof[
  Each transversal path in the product uses a transversal of $a$ and a transversal of $b$. Different product paths are disjoint, so they use distinct transversals of either factor. This proves the rank inequality. Every index outside $"supp" \( a \)$ supplies a fixed transversal, proving the support inequality.
  A rank-$m$ diagram is a bijection between its two sides and has the inverse permutation diagram as a two-sided inverse. Conversely, the rank inequality forces every unit to have rank $m$. An idempotent in a group is its identity, proving the assertion about idempotents. If $u$ is a permutation diagram, the rank inequality gives $"rank" \( u a u^(- 1) \) lt.eq "rank" \( a \)$; applying it to $a = u^(- 1) \( u a u^(- 1) \) u$ gives the reverse inequality.
  If both $a$ and $b$ fix the transversal at an index $i$, their product also fixes it. Hence any product of diagrams supported in $J$ is supported in $J$, and $upright(bold(1))_m$ is supported in every such set. ◻
]

=== 2.2 Reduction at an idempotent <reduction-at-an-idempotent>

If $e^2 = e$ in a monoid and $S$ is a subset closed under multiplication and containing $e$, its #emph[corner]

$ e S e = { e s e : s in S } $

is a monoid with identity $e$. In particular, every $z in e S e$ satisfies $e z = z e = z$. This is the standard local-monoid construction of finite-semigroup theory #cite(label("Pin1997")) Section 2.7. For $m gt.eq 3$, Auinger observes that the corner of the standard rank-$\( m - 2 \)$ projection in $cal(D)_m$ is isomorphic to $cal(D)_(m - 2)$ #cite(label("Auinger2012")) Section 3. The following reduction treats an arbitrary idempotent and realizes its matching corner on fewer ports. Its third part controls one common support set for an entire family of sandwiches.

#thm([Lemma 2.2.])[
  (Matching corners).  #emph[Let $e in cal(D)_m$ be idempotent and let $r = "rank" \( e \)$.]
  + #emph[There is a unital injective homomorphism 
$ R_e : e cal(D)_m e arrow.r cal(D)_r $

 satisfying $"rank" \( R_e \( z \) \) = "rank" \( z \)$ for all $z in e cal(D)_m e$.]
  + #emph[The idempotent satisfies 
$ \| "supp" \( e \) \| lt.eq 2 \( m - r \) . $

]
  + #emph[For every $J subset.eq \[ m \]$ there is a set $J' subset.eq \[ r \]$, depending only on $e$, $J$, and the numbering chosen for $R_e$, such that $\| J' \| lt.eq \| J \|$ and 
$ "supp" \( R_e \( e a e \) \) subset.eq J' quad upright("for every ") a in cal(D)_m upright(" supported in ") J . $

]
] <lem:corners>

#proof[
  Let $X \, Y subset.eq \[ m \]$ be the indices of the left and right transversal endpoints of $e$, respectively. Its transversals define a bijection $p : X arrow.r Y$, with $\| X \| = \| Y \| = r$.
  We describe the connector at the interface between two copies of $e$. Keep two distinct tagged rows of vertices, $R_i$ and $L_i$ for $i in \[ m \]$, and put an edge $R_i L_i$ between each matching pair of indices. On the $R$ row put the right caps of $e$, and on the $L$ row put the left caps of $e$. Thus the degree-one vertices are precisely
  $ { R_y : y in Y } med union med { L_x : x in X } \, $
  and all other vertices have degree two. These tagged vertices remain distinct even when $X$ and $Y$ overlap. Pairing the endpoints of its paths, and discarding its closed components, gives a matching on the $2 r$ displayed vertices.
  This is exactly the connector encountered by the transversals in $e upright(bold(1))_m e = e^2$. Since $"rank" \( e^2 \) = r$, all $r$ left transversal endpoints of the first copy must reach the right boundary of the second. Consequently the connector cannot pair two $R$ endpoints or two $L$ endpoints: it pairs $R_y$ with $L_(gamma \( y \))$ for a bijection $gamma : Y arrow.r X$. The path from an outer left endpoint $x in X$ ends at the right endpoint $p \( gamma \( p \( x \) \) \)$. Equality $e^2 = e$ gives
  $ p \( gamma \( p \( x \) \) \) = p \( x \) \, #h(2em) upright("hence") #h(2em) gamma \( p \( x \) \) = x . $
  Thus $gamma = p^(- 1)$.
  Every diagram $z in e cal(D)_m e$ contains the left caps of $e$ on its outer left side and the right caps of $e$ on its outer right side. Delete precisely these prescribed caps. The remaining ports are the left ports indexed by $X$ and the right ports indexed by $Y$, and they retain a perfect matching. In particular, any additional caps among these retained ports remain in the reduced diagram. Number $X$ by $\[ r \]$ in any fixed way, and give the right endpoint $p \( x \)$ the same number as $x$. This defines $R_e \( z \)$.
  Figure 1 illustrates the connector and the numbering for a rank-$2$ idempotent.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0.9, 2.05), [#text(size: 9pt)[idempotent $e in cal(D)_4$]])
  content((0, 1.271), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((1.8, 1.271), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((0, 0.4706), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((1.8, 0.4706), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((0, -0.3294), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  content((1.8, -0.3294), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  content((0, -1.129), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  content((1.8, -1.129), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.2), (1.8, 1.2), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((0, 0.4), (1.8, -1.2), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  bezier((0, -0.4), (0, -1.2), (-0.55, -0.4), (-0.55, -1.2), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.8, 0.4), (1.8, -0.4), (2.35, 0.4), (2.35, -0.4), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10))
  circle((0, -0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((0, -1.2), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((1.8, 0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((1.8, -0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((0, 1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.4), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.8, 1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.8, -1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.9, -1.85), [#text(size: 9pt)[$X=\{1,2\}$, $Y=\{1,4\}$#linebreak()$p(1)=1, p(2)=4$]])
  line((2.7, 0), (3.4, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.05, 0), [#text(size: 9pt)[glue]], anchor: "south", padding: 0.1176cm)
  content((5.2, 2.05), [#text(size: 9pt)[connector in $e bold(1)_4e$]])
  content((4.3, 1.271), [#text(size: 9pt)[$R_1$]], anchor: "south", padding: 0.1176cm)
  content((6.1, 1.271), [#text(size: 9pt)[$L_1$]], anchor: "south", padding: 0.1176cm)
  content((4.3, 0.4706), [#text(size: 9pt)[$R_2$]], anchor: "south", padding: 0.1176cm)
  content((6.1, 0.4706), [#text(size: 9pt)[$L_2$]], anchor: "south", padding: 0.1176cm)
  content((4.3, -0.3294), [#text(size: 9pt)[$R_3$]], anchor: "south", padding: 0.1176cm)
  content((6.1, -0.3294), [#text(size: 9pt)[$L_3$]], anchor: "south", padding: 0.1176cm)
  content((4.3, -1.129), [#text(size: 9pt)[$R_4$]], anchor: "south", padding: 0.1176cm)
  content((6.1, -1.129), [#text(size: 9pt)[$L_4$]], anchor: "south", padding: 0.1176cm)
  line((4.3, 1.2), (6.1, 1.2), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((4.3, -1.2), (6.1, -1.2), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  bezier((6.1, -1.2), (6.1, -0.4), (6.65, -1.2), (6.65, -0.4), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  line((6.1, -0.4), (4.3, -0.4), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  bezier((4.3, -0.4), (4.3, 0.4), (3.75, -0.4), (3.75, 0.4), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  line((4.3, 0.4), (6.1, 0.4), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  circle((4.3, 0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((4.3, -0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((6.1, -0.4), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((6.1, -1.2), radius: 0.06985, fill: rgb("#a6a6a6"), stroke: none)
  circle((4.3, 1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((4.3, -1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.1, 1.2), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.1, 0.4), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.2, -1.85), [#text(size: 9pt)[$gamma (1)=1, gamma (4)=2$]])
  line((7, 0), (8.15, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.575, 0), [#text(size: 9pt)[retain and#linebreak()renumber]], anchor: "south", padding: 0.1176cm)
  content((10, 2.05), [#text(size: 9pt)[$R_e(e)= bold(1)_2$]])
  line((9.1, 0.6), (10.9, 0.6), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((9.1, -0.6), (10.9, -0.6), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  circle((9.1, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((9.1, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((10.9, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((10.9, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.1, 0.6706), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((9.1, -0.5294), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((10.9, 0.6706), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  content((10.9, -0.5294), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  content((10, -1.85), [#text(size: 9pt)[$x$ and $p(x)$ share a number;#linebreak()right $4=p(2)$ becomes $2$]])
})],
    caption: [Figure 1: A rank-$2$ idempotent of degree $4$ and its reduction. In the left panel, the gray caps are prescribed and the colored transversals are retained. The connector paths are $R_1$–$L_1$ and $R_4$–$L_4$–$L_3$–$R_3$–$R_2$–$L_2$, giving $gamma = p^(- 1)$. Numbering left $x$ and right $p \( x \)$ alike yields $R_e \( e \) = upright(bold(1))_2$. For a general corner element $z$, only the prescribed outer caps are deleted; every pair among retained ports, including caps, remains. ],
  ) <fig:corner-reduction>
  Restoring the prescribed caps and the original indices reconstructs $z$, so $R_e$ is injective. Only nontransversal pairs were deleted, so it preserves rank, and by construction $R_e \( e \) = upright(bold(1))_r$. To check multiplication, let $z \, w in e cal(D)_m e$. The fixed caps at their middle interface are the right caps and left caps of $e$. Their connector is therefore the one just computed: the retained right port $p \( x \)$ of $z$ is connected to the retained left port $x$ of $w$. In the reduced numbering these ports have the same index. Contracting the connector, including when the reduced diagrams have caps of their own, thus gives ordinary multiplication in $cal(D)_r$. It follows that $R_e \( z w \) = R_e \( z \) R_e \( w \)$, proving (i).
  For (ii), suppose that $i in X ∩ Y$. The vertices $R_i \, L_i$ in the connector have no incident caps, so their edge $R_i L_i$ is an entire connector path. Hence $gamma \( i \) = i$, and $gamma = p^(- 1)$ implies $p \( i \) = i$. Thus every index in $X ∩ Y$ is fixed by $e$, and
  $ "supp" \( e \) subset.eq \( \[ m \] \\ X \) union \( \[ m \] \\ Y \) . $
  Both complements have size $m - r$, which proves the bound.
  For (iii), consider the full glued graph $e upright(bold(1))_m e$, keeping the middle identity diagram explicit. Its transversal paths have the same outside endpoint pairs as $e$, and so are indexed by the $r$ numbers used in the reduction. Mark a transversal path if it uses any middle identity edge whose index belongs to $J$. Let $J'$ be the numbers of the marked paths. A transversal path may use several middle identity edges; the only counting fact needed is that different paths are disjoint. Each middle identity edge therefore marks at most one transversal path, and $\| J' \| lt.eq \| J \|$.
  Now replace the middle identity by any diagram $a$ supported in $J$. Every middle identity edge at an index outside $J$ remains present. An unmarked transversal path used only such edges, so that entire path survives with the same outside endpoints. Each of its internal vertices still has its two original incident edges; a new path cannot attach to it. In particular, changes to closed components or to paths with both endpoints on the same side cannot join an unmarked transversal: all its middle ports are already paired by the unchanged identity edges. Its corresponding reduced port is therefore still paired with the equally indexed port on the other side. Only numbers in $J'$ can belong to $"supp" \( R_e \( e a e \) \)$. The construction of $J'$ did not depend on $a$, as required.
  When $r = 0$, the prescribed caps exhaust all outside ports. Then $e a e = e$ for every $a$, and the corner is identified with the singleton $cal(D)_0$. The reduction above is its unique map, and (iii) holds with $J' = diameter$; (ii) also holds since $\| "supp" \( e \) \| lt.eq m$. ◻
]

The reduction will also be applied to a submonoid $e S e$. We write $R_e \( e S e \)$ for its image in $cal(D)_r$. It contains the ambient identity $upright(bold(1))_r$. When discussing support in this reduced monoid, the port set is $\[ r \]$; support in the original monoid still refers to $\[ m \]$.

=== 2.3 Homomorphic images and permutation lifts <homomorphic-images-and-permutation-lifts>

Every element of a finite semigroup has an idempotent positive power. Indeed, for an element $x$ there are integers $a gt.eq 1$ and $d gt.eq 1$ such that $x^(k + d) = x^k$ for all $k gt.eq a$. Choose $N gt.eq a$ divisible by $d$. Then $x^(2 N) = x^N$. If a multiplicative map sends $x$ to an idempotent $q$, the same is true of every positive power of $x$, including this idempotent power.

#thm([Lemma 2.3.])[
  (Unit lifts from a minimum-rank corner).  #emph[Let $S subset.eq cal(D)_m$ be nonempty and closed under multiplication, and let $phi.alt : S arrow.r M$ be an onto multiplicative map to a monoid $M$. Let $q in M$ be idempotent. There is an idempotent $e in S$ with $phi.alt \( e \) = q$. For every such $e$, the reduced monoid $R_e \( e S e \)$ has a unital surjection 
$ phi.alt_e : R_e \( e S e \) arrow.r q M q \, #h(2em) phi.alt_e \( R_e \( z \) \) = phi.alt \( z \) . $

 If $e$ has minimum rank among all idempotents in $S$ mapping to $q$, then every element of $e S e$ mapping to a unit of $q M q$ reduces to a permutation diagram. In particular, every unit of $q M q$ has a permutation lift in $R_e \( e S e \)$, and that lift is a unit of the reduced monoid.]
] <lem:unit-lifts>

#proof[
  The sets $S$ and $M$ are finite because $cal(D)_m$ is finite and $phi.alt$ is onto. Take any preimage of $q$ and then an idempotent positive power to obtain $e$. The image of $e S e$ under $phi.alt$ is exactly $q M q$: for any $v in M$, a preimage $s in S$ gives $phi.alt \( e s e \) = q v q$. Its identity $e$ maps to the identity $q$ of this corner. Lemma 4(i) makes the displayed definition of $phi.alt_e$ well-defined and transfers both multiplication and surjectivity.
  Suppose now that $e$ has the stated minimum rank, put $r = "rank" \( e \)$, and let $y in e S e$ map to a unit $u$ of $q M q$. The group of units of $q M q$ is finite, so $u^t = q$ for some positive integer $t$. Take an idempotent positive power $z$ of $y^t$. Then $z in S$ is idempotent and $phi.alt \( z \) = q$. The rank inequalities and minimum choice of $e$ give
  $ r lt.eq "rank" \( z \) lt.eq "rank" \( y \) lt.eq r . $
  The last inequality uses $y in e S e$. Hence $R_e \( y \)$ has rank $r$ in $cal(D)_r$ and is a permutation diagram. Its inverse is a power of the same finite-order permutation, so lies in $R_e \( e S e \)$. Surjectivity of $phi.alt_e$ supplies a lift for each unit $u$ and completes the proof. ◻
]

=== 2.4 Corners of the relation monoid <corners-of-the-relation-monoid>

For a finite set $H$ and a subset $F subset.eq H$, we regard a relation on $F$ as a relation on $H$ containing no pairs outside $F times F$. With $i = I_F$, these are precisely the relations $A$ satisfying $A = i A i$. Under this identification their monoid is $i cal(R)_H i$ with identity $i$. Permutations of a finite set are identified with their graph relations.

#thm([Lemma 2.4.])[
  (A relation corner).  #emph[Let $P in cal(R)_H$ be idempotent, and let $F subset.eq H$ satisfy $I_F P I_F = I_F$. Put $i = I_F$ and $Q = P i P$. Then $Q$ is idempotent, $P Q = Q P = Q$, and restriction is a unital isomorphism 
$ theta : Q cal(R)_H Q arrow.r cal(R)_F \, #h(2em) theta \( Z \) = i Z i . $

 Its inverse sends $A in cal(R)_F$ to $P A P = Q A Q$.]
] <lem:relation-corner>

#proof[
  The identities $P^2 = P$ and $i P i = i$ give
  $ Q^2 = P i P^2 i P = P \( i P i \) P = Q \, #h(2em) P Q = Q P = Q . $
  They also give $i Q = i P$, $Q i = P i$, and $i Q i = i$. If $Z in Q cal(R)_H Q$, then $Z = Q Z Q$ and $P Z P = Z$. Consequently
  #[#set math.equation(numbering: n => $*$)
   $ Z = P i P Z P i P = P i Z i P . $]
  Thus its restriction $i Z i$ determines $Z$ uniquely.
  Conversely, if $A in cal(R)_F$, so that $A = i A i$, then
  $ Q A Q = Q i A i Q = P i A i P = P A P \, #h(2em) i \( P A P \) i = i P i A i P i = A . $
  Hence every relation on $F$ is a restriction of an element of the corner, and $A mapsto P A P$ is the inverse bijection by $\( * \)$.
  For multiplication, write $Z = P A P$ and $W = P B P$, where $A = i Z i$ and $B = i W i$ are relations on $F$. Since $A = A i$ and $B = i B$, we have
  $ Z W = P A P^2 B P = P A P B P = P A \( i P i \) B P = P A B P . $
  Restricting this equality gives $theta \( Z W \) = A B = theta \( Z \) theta \( W \)$. Finally, the identity $Q$ of the source corner restricts to $i$, the identity of $cal(R)_F$. This proves unitality and the claimed isomorphism. ◻
]

== 3 An exponential rank-loss bound <sec:rank>

We now bound the rank lost by an idempotent diagram whose image adds one off-diagonal pair to the identity relation. The amplification step uses $32$ conjugates of that diagram to construct $256$ successive relation additions. Their joint support bounds the total rank loss, while a smaller relation corner bounds the loss at each addition.

For every integer $h gt.eq 2$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ L \( h \) = 2^(floor.l \( h - 2 \) \/ 31 floor.r) . $ <eq:rank-loss-function>]

All reductions below are the maps $R_e$ of Lemma 4. Their ranges are regarded as submonoids of the indicated smaller matching monoids. In particular, their identities are the ambient identity diagrams, and they preserve absolute rank.

The theorem first assumes permutation lifts in addition to a unital surjection onto the #emph[entire] relation monoid. A surjection onto only the relations generated by the displayed additions would not suffice: the proof must also lift arbitrary elements of smaller relation corners. Corollary 8 removes the extra lift assumption by passing to a minimum-rank idempotent corner.

#thm([Theorem 3.1.])[
  (Rank loss for a single relation addition).  #emph[Let $H$ be a finite set of size $h gt.eq 2$, let $m gt.eq 0$, and let $S subset.eq cal(D)_m$ be a submonoid containing $upright(bold(1))$. Suppose that $phi.alt : S arrow.r cal(R)_H$ is a unital surjection and that every permutation of $H$ has a lift in $S$ which is a permutation diagram. If $a in S$ is idempotent and 
$ phi.alt \( a \) = I_H union { \( x \, y \) } \, #h(2em) x \, y in H \, quad x eq.not y \, $

 then 
$ m - "rank" \( a \) gt.eq L \( h \) . $

]
] <thm:rank-loss>

#proof[
  We induct on $h$, simultaneously for every ambient degree $m$ and every choice of $S \, phi.alt \, a$ satisfying the hypotheses. Put $t = 16$. For $2 lt.eq h < 2 t + 1 = 33$, one has $L \( h \) = 1$. A full-rank diagram is a permutation, and an idempotent permutation is the identity. Since $phi.alt$ is unital and $phi.alt \( a \) eq.not I_H$, the rank of $a$ is strictly smaller than $m$. This proves the base cases.
  Now let $h gt.eq 33$ and assume the theorem for every smaller size at least two. Write
  $ c = m - "rank" \( a \) . $
  ===== 3.1 Conjugates with a common support bound. <conjugates-with-a-common-support-bound.>
  Choose pairwise disjoint sets
  $ U = { u_1 \, dots.h \, u_t } \, #h(2em) V = { v_1 \, dots.h \, v_t } \, #h(2em) { z } $
  in $H$. For each ordered pair of distinct points of $H$, a permutation $pi$ can send $\( x \, y \)$ to that pair. Choose a permutation-diagram lift $tilde(pi) in S$. Its inverse belongs to $S$ because a permutation diagram has finite order. In path order,
  $ phi.alt \( tilde(pi)^(- 1) a tilde(pi) \) = pi^(- 1) #scale(x: 120%, y: 120%)[\(] I_H union { \( x \, y \) } #scale(x: 120%, y: 120%)[\)] pi = I_H union { \( pi \( x \) \, pi \( y \) \) } . $
  Using the pairs $\( u_i \, z \)$ and $\( z \, v_j \)$ in this construction gives idempotents $s_i \, s'_j in S$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ phi.alt \( s_i \) = I_H union { \( u_i \, z \) } \, #h(2em) phi.alt \( s'_j \) = I_H union { \( z \, v_j \) } quad \( 1 lt.eq i \, j lt.eq t \) . $ <eq:rank-conjugate-images>]
  Conjugation by permutation diagrams preserves rank, so all these idempotents have rank $m - c$. By Lemma 4(ii), each has support of size at most $2 c$. Thus the set
  $ J = union.big_(i = 1)^t "supp" \( s_i \) med union med union.big_(j = 1)^t "supp" \( s'_j \) subset.eq \[ m \] $
  has size at most $4 t c$. Every product $s_i s'_j$ is supported in $J$, because diagrams supported in a fixed set form a submonoid.
  ===== 3.2 A chain of $t^2$ additions. <a-chain-of-t2-additions.>
  Put $P_0 = I_(H \\ { z })$. Choose an idempotent $b_0 in S$ with $phi.alt \( b_0 \) = P_0$: take any lift of $P_0$ and then a positive idempotent power. The image stays $P_0$ because $P_0$ is idempotent. For $1 lt.eq i \, j lt.eq t$, define
  $ g_(i j) = b_0 s_i s'_j b_0 in b_0 S b_0 . $
  In path order, the two added pairs in (3.2) allow the path $u_i \, z \, v_j$. The outer factors $P_0$ delete pairs with endpoint $z$, so
  #[#set math.equation(numbering: n => "(3.3)")
   $ phi.alt \( g_(i j) \) = P_0 union { \( u_i \, v_j \) } . $ <eq:rank-generator-image>]
  Figure 2 shows how the same $2 t$ conjugates provide all $t^2$ choices of the pair $\( u_i \, v_j \)$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.2475, 0.9525), (0.2475, 1.447), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_1$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.2475, -0.2475), (0.2475, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_i$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.2475, -1.447), (0.2475, -0.9525), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_t$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0.6), [#text(size: 9pt)[$dots.v$]])
  content((0, -0.6), [#text(size: 9pt)[$dots.v$]])
  content((1.953, -0.2475), (2.447, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.153, 0.9525), (4.647, 1.447), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_1$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.153, -0.2475), (4.647, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_j$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.153, -1.447), (4.647, -0.9525), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_t$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.4, 0.6), [#text(size: 9pt)[$dots.v$]])
  content((4.4, -0.6), [#text(size: 9pt)[$dots.v$]])
  line((0.3135, 1.029), (1.887, 0.171), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((0.3571, 0), (1.843, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((1.1, 0), [#text(size: 9pt)[$phi (s_i)$]], anchor: "south", padding: 0.1176cm)
  line((0.3135, -1.029), (1.887, -0.171), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((2.513, 0.171), (4.087, 1.029), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((2.557, 0), (4.043, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((3.3, 0), [#text(size: 9pt)[$phi (s'_j)$]], anchor: "south", padding: 0.1176cm)
  line((2.513, -0.171), (4.087, -1.029), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((1.05, 1.7), [#text(size: 9pt)[incoming#linebreak()family]])
  content((3.35, 1.7), [#text(size: 9pt)[outgoing#linebreak()family]])
  line((5.15, 0), (6.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.9, 0), [#text(size: 9pt)[sandwich#linebreak()by $P_0$]], anchor: "south", padding: 0.1176cm)
  content((7.103, -0.2475), (7.597, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$u_i$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.953, -0.2475), (9.447, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v_j$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.707, 0), (8.843, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((8.25, -0.9), [#text(size: 9pt)[$phi (g_(i j))=P_0 union \{(u_i,v_j)\}$]])
})],
    caption: [Figure 2: The gray arrows are alternatives from the two families of relation images; each individual image has one added arrow. The highlighted path creates the selected pair after both outer factors delete endpoints at $z$. Identity loops are omitted. Only relations on $H$ are shown. The common matching support bound comes from taking the union of the supports of the $32$ conjugates and reducing at $b_0$; the same conjugates provide all $256$ choices. ],
  ) <fig:amplification>
  Let $r_0 = "rank" \( b_0 \)$. Applying Lemma 4(iii) at $b_0$ to the single set $J$ gives one set $J_0 subset.eq \[ r_0 \]$, with $\| J_0 \| lt.eq 4 t c$, such that
  #[#set math.equation(numbering: n => "(3.4)")
   $ "supp" #scale(x: 120%, y: 120%)[\(] R_(b_0) \( g_(i j) \) #scale(x: 120%, y: 120%)[\)] subset.eq J_0 #h(2em) \( 1 lt.eq i \, j lt.eq t \) . $ <eq:rank-common-support>]
  This set is common to all $t^2$ generators.
  List the pairs $\( i \, j \) in \[ t \] times \[ t \]$ in any order, without repetition. Let $E_ell$ be the set of relation pairs $\( u_i \, v_j \)$ in the first $ell$ positions, and set
  $ P_ell = P_0 union E_ell #h(2em) \( 0 lt.eq ell lt.eq t^2 \) . $
  All additional pairs go from $U$ to $V$, and $U ∩ V = diameter$. Consequently two additional pairs cannot be composed with each other; the identity pairs in $P_0$ preserve their endpoints. Thus
  #[#set math.equation(numbering: n => "(3.5)")
   $ \( P_0 union A \) \( P_0 union B \) = P_0 union \( A union B \) #h(2em) \( A \, B subset.eq U times V \) . $ <eq:rank-union>]
  In particular, $P_ell^2 = P_ell$.
  Starting from $b_0$, construct $b_ell$ as follows. If $\( i \, j \)$ occupies position $ell$, take $b_ell$ to be a positive idempotent power of
  $ b_(ell - 1) g_(i j) b_(ell - 1) . $
  Inductively, its image before taking the power is $P_ell$, by (3.3) and (3.5); the power has the same image. Hence
  #[#set math.equation(numbering: n => "(3.6)")
   $ b_ell^2 = b_ell \, #h(2em) b_ell in b_(ell - 1) S b_(ell - 1) \, #h(2em) phi.alt \( b_ell \) = P_ell . $ <eq:rank-chain>]
  Every $b_ell$ also belongs to $b_0 S b_0$. Indeed, this is true initially, and this latter set is a submonoid containing every $g_(i j)$; it is therefore preserved by the construction.
  Write
  $ r_ell = "rank" \( b_ell \) quad \( 0 lt.eq ell lt.eq t^2 \) \, #h(2em) Delta_ell = r_(ell - 1) - r_ell quad \( 1 lt.eq ell lt.eq t^2 \) . $
  The nested corners in (3.6) and Lemma 3 give $Delta_ell gt.eq 0$. In the single coordinate system obtained by reducing at $b_0$, the starting element is the identity and all generators are supported in $J_0$ by (3.4). The same is true of every constructed product and power, in particular $R_(b_0) \( b_(t^2) \)$. Rank preservation and the elementary bound of rank defect by support size give
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(ell = 1)^(t^2) Delta_ell = r_0 - r_(t^2) lt.eq \| "supp" \( R_(b_0) \( b_(t^2) \) \) #scale(x: 120%, y: 120%)[\|] lt.eq \| J_0 \| lt.eq 4 t c . $ <eq:rank-total-budget>]
  ===== 3.3 The loss at one addition. <the-loss-at-one-addition.>
  We claim that for every $1 lt.eq ell lt.eq t^2$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ 2 Delta_ell gt.eq L \( h - 2 t + 1 \) . $ <eq:rank-single-step>]
  Each local argument uses fresh port coordinates to certify this bound on the already defined absolute rank difference $Delta_ell$ in (3.7). Fix $ell$, let $\( i \, j \)$ be its pair, and put $P = P_(ell - 1)$. Reduce at $b_(ell - 1)$ and define
  $ T = R_(b_(ell - 1)) \( b_(ell - 1) S b_(ell - 1) \) subset.eq cal(D)_(r_(ell - 1)) \, #h(2em) beta = R_(b_(ell - 1)) \( b_ell \) in T . $
  Here $T$ contains the ambient identity $R_(b_(ell - 1)) \( b_(ell - 1) \) = upright(bold(1))$. The unital-surjection assertion of Lemma 5 gives
  $ theta : T arrow.r P cal(R)_H P \, #h(2em) theta \( R_(b_(ell - 1)) \( w \) \) = phi.alt \( w \) quad \( w in b_(ell - 1) S b_(ell - 1) \) . $
  Moreover, $beta$ is idempotent, $theta \( beta \) = P_ell$, and rank preservation gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ "rank" \( beta \) = r_ell \, #h(2em) \| "supp" \( beta \) \| lt.eq 2 Delta_ell \, $ <eq:rank-step-support>]
  where support now refers to the indices $\[ r_(ell - 1) \]$.
  ===== 3.4 A full relation corner on fewer points. <a-full-relation-corner-on-fewer-points.>
  Set
  $ F = { u_i \, v_j } union #scale(x: 120%, y: 120%)[\(] H \\ \( U union V union { z } \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) E = I_F \, #h(2em) Q = P E P . $
  Thus $\| F \| = h - 2 t + 1 = h - 31$. Among the possible extra pairs in $P$, the only one with both endpoints in $F$ is $\( u_i \, v_j \)$, which has not yet been added. Every point of $F$ is different from $z$. Therefore
  $ E P E = E . $
  Lemma 6 shows that $Q$ is idempotent, $P Q = Q P = Q$, and restriction $Z mapsto E Z E$ is a unital isomorphism from $Q cal(R)_H Q$ onto $cal(R)_F$. In particular,
  $ Q \( P cal(R)_H P \) Q = Q cal(R)_H Q . $
  Equation (3.5) also gives $P P_ell = P_ell P = P_ell$. Since $E Q = E P$ and $Q E = P E$, we obtain
  #[#set math.equation(numbering: n => "(3.10)")
   $ E \( Q P_ell Q \) E = E P P_ell P E = E P_ell E = I_F union { \( u_i \, v_j \) } . $ <eq:rank-smaller-image>]
  ===== 3.5 The second reduction and the induction hypotheses. <the-second-reduction-and-the-induction-hypotheses.>
  Among the idempotents $d in T$ with $theta \( d \) = Q$, choose one of minimum rank. Such idempotents exist because $theta$ is onto and an idempotent power of a lift of $Q$ still maps to $Q$. This minimum is taken inside $T$, in its current coordinates in $cal(D)_(r_(ell - 1))$. Put $r' = "rank" \( d \)$ and reduce once more, defining
  $ T' = R_d \( d T d \) subset.eq cal(D)_(r') . $
  The identity of $T'$ is $R_d \( d \) = upright(bold(1))$. Its induced map onto $Q \( P cal(R)_H P \) Q$, followed by restriction to $F$, is the unital surjection
  $ psi : T' arrow.r cal(R)_F \, #h(2em) psi \( R_d \( w \) \) = E theta \( w \) E quad \( w in d T d \) . $
  By Lemma 5 and the minimum-rank choice of $d$, every unit of $Q \( P cal(R)_H P \) Q$ has a permutation-diagram lift in $T'$. The restriction isomorphism preserves units, so every permutation of $F$ has such a lift under $psi$.
  Let $J_ell = "supp" \( beta \) subset.eq \[ r_(ell - 1) \]$. Apply Lemma 4(iii) to the idempotent $d$ in this ambient matching monoid. There is a set $K subset.eq \[ r' \]$ with $\| K \| lt.eq \| J_ell \| lt.eq 2 Delta_ell$ such that
  $ "supp" #scale(x: 120%, y: 120%)[\(] R_d \( d beta d \) #scale(x: 120%, y: 120%)[\)] subset.eq K . $
  The sandwich $d beta d$ need not be idempotent. Choose a positive idempotent power $v$ of its reduction $R_d \( d beta d \)$ in $T'$. Support remains in $K$ under taking powers. By (3.10), the image before taking the power is $I_F union { \( u_i \, v_j \) }$, an idempotent relation; hence
  $ v^2 = v \, #h(2em) psi \( v \) = I_F union { \( u_i \, v_j \) } \, #h(2em) \| "supp" \( v \) \| lt.eq 2 Delta_ell . $
  We have obtained an identity-containing submonoid of $cal(D)_(r')$, a unital surjection onto $cal(R)_F$ with permutation lifts, and the required idempotent above a single off-diagonal addition. These are all the hypotheses of the theorem at size $\| F \| = h - 31$, which lies between $2$ and $h - 1$. The induction hypothesis and the support bound therefore give
  $ L \( h - 31 \) lt.eq r' - "rank" \( v \) lt.eq \| "supp" \( v \) \| lt.eq 2 Delta_ell . $
  This proves (3.8) for the chosen $ell$, and hence for every step of the chain.
  ===== 3.6 Completion of the recurrence. <completion-of-the-recurrence.>
  The bounds established above are collected in Table 1. The support is measured once, in the coordinates of $b_0$; the separate smaller corners certify each summand in the resulting rank-loss budget.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[General expression
], table.cell(rowspan: 1, colspan: 1)[$t = 16$
]),
  table.cell(rowspan: 1, colspan: 1)[Conjugates
], table.cell(rowspan: 1, colspan: 1)[$2 t$
], table.cell(rowspan: 1, colspan: 1)[$32$
],
  table.cell(rowspan: 1, colspan: 1)[Successive additions
], table.cell(rowspan: 1, colspan: 1)[$t^2$
], table.cell(rowspan: 1, colspan: 1)[$256$
],
  table.cell(rowspan: 1, colspan: 1)[Common support budget
], table.cell(rowspan: 1, colspan: 1)[$4 t c$
], table.cell(rowspan: 1, colspan: 1)[$64 c$
],
  table.cell(rowspan: 1, colspan: 1)[Retained relation points
], table.cell(rowspan: 1, colspan: 1)[$h - 2 t + 1$
], table.cell(rowspan: 1, colspan: 1)[$h - 31$
],
  table.cell(rowspan: 1, colspan: 1)[Loss per addition
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 L \( h - 2 t + 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1 / 2 L \( h - 31 \)$
],
  table.cell(rowspan: 1, colspan: 1)[Total required loss
], table.cell(rowspan: 1, colspan: 1)[$t^2 / 2 L \( h - 2 t + 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$128 L \( h - 31 \)$
],
)
]],
    caption: [Table 1: The support upper bound and the inductive rank-loss lower bound are applied to the same chain. Here $c = m - "rank" \( a \)$. ],
  )
  Summing (3.8) and applying (3.7) yields
  $ 4 t c gt.eq sum_(ell = 1)^(t^2) Delta_ell gt.eq t^2 / 2 L \( h - 2 t + 1 \) . $
  With $t = 16$, it follows that
  $ c gt.eq 2 L \( h - 31 \) = 2^(1 + floor.l \( h - 33 \) \/ 31 floor.r) = 2^(floor.l \( h - 2 \) \/ 31 floor.r) = L \( h \) . $
  This completes the induction. ◻
]

#thm([Corollary 3.2.])[
  (Degree bound for a unital relation-monoid divisor).  #emph[Let $H$ be a finite set of size $h gt.eq 2$. If an identity-containing submonoid $S subset.eq cal(D)_k$ admits a unital surjection $phi.alt : S arrow.r cal(R)_H$, then 
$ k gt.eq L \( h \) = 2^(floor.l \( h - 2 \) \/ 31 floor.r) . $

 No hypothesis about permutation lifts is required here.]
] <cor:divisor-degree>

#proof[
  Choose an idempotent $e in S$ of minimum rank among those with $phi.alt \( e \) = I_H$. The set of choices is nonempty, since the identity of $S$ is one such idempotent. Put $r = "rank" \( e \)$. By Lemmas 4 and 5, the reduced corner
  $ T = R_e \( e S e \) subset.eq cal(D)_r $
  contains the ambient identity and maps unitally onto $I_H cal(R)_H I_H = cal(R)_H$. The minimum-rank choice supplies permutation-diagram lifts for all permutations of $H$.
  Choose distinct $x \, y in H$. Surjectivity supplies a lift in $T$ of $I_H union { \( x \, y \) }$. A positive idempotent power of that lift is an idempotent $a in T$ with the same image. Theorem 7 applies to this representation, so
  $ L \( h \) lt.eq r - "rank" \( a \) lt.eq r lt.eq k . $
  ◻
]

== 4 Local matching representation of deterministic machines <sec:machines>

Fix a finite alphabet $Sigma$. We use one read-only head on an input $tack.r w tack.l$, where $w in Sigma^(*)$ and the two endmarkers are distinct symbols outside $Sigma$. A deterministic machine has a finite state set $Q$, an initial state $q_0$, a set $A subset.eq Q$ of accepting states, and a partial transition function

$ delta : Q times \( Sigma union { tack.r \, tack.l } \) harpoon.rt Q times { - 1 \, 0 \, 1 } . $

The three moves are left, stay, and right. A transition at an endmarker never moves beyond that endmarker. The initial configuration is $\( 0 \, q_0 \)$, with cell $0$ carrying $tack.r$. In this section a computation accepts when an accepting state occurs at any time, including time $0$. A missing transition halts the computation; an infinite computation without an accepting state rejects. All states, including initial and accepting states, count toward $s = \| Q \|$.

#thm([Theorem 4.1.])[
  (Local matching representation).  #emph[For every $s$-state deterministic machine in this model, there is a map 
$ eta : Sigma union { tack.r \, tack.l } arrow.r cal(D)_k \, #h(2em) k = 4 \( s + 1 \)^2 \, $

 with the following property. Designate ports $1 \, 2$ on each of the two sides as test ports. For every word $w = a_1 dots.h.c a_ell$, the machine accepts $w$ if and only if the diagram 
$ eta \( tack.r \) eta \( a_1 \) dots.h.c eta \( a_ell \) eta \( tack.l \) $

 pairs a left test port with a right test port. Each symbol diagram is independent of the input length, the symbol’s position, and its neighboring symbols.]
  #emph[If acceptance instead requires entry into an accepting state after a positive number of transitions, the same conclusion holds with $k = 4 \( s + 2 \)^2$.]
] <thm:machine-diagrams>

The diagrams will encode a tour of an undirected graph. Determinism is used to ensure that the component of one designated vertex is a tree; no condition is imposed on the other components. Configuration-tree traversal also underlies Sipser’s halting method #cite(label("SipserHalting1980")) and the reversible simulation of Lange, McKenzie, and Tapp #cite(label("LangeMcKenzieTapp2000")) Section 3.1. We prove the traversal facts needed here and then realize them by matching diagrams. The candidate-slot construction below supplies the further requirement that each diagram depend only on the symbol at its own cell, with the stated quadratic degree.

=== 4.1 A sink and its tree <a-sink-and-its-tree>

#thm([Lemma 4.2.])[
  (Sink component).  #emph[Let $V$ be finite, let $sigma : V harpoon.rt V$ be a partial function, and let $t in V$ have no successor. Make an undirected multigraph on $V$ with one edge for each defined successor $v mapsto sigma \( v \)$, retaining self-loops and distinct edges with the same endpoints. Then a vertex lies in the connected component of $t$ if and only if some finite sequence of successor steps takes it to $t$. This component is a tree.]
] <lem:sink-tree>

#proof[
  Let $B$ be the set of vertices reaching $t$, allowing a sequence of length zero. For every successor edge $u mapsto v$, one has $u in B$ if and only if $v in B$. One implication prepends that edge to a path to $t$; the other removes the first step of the unique successor path from $u$ to $t$. This removal is legitimate because $u eq.not t$. Thus membership in $B$ is constant along undirected edges. Since $t in B$, its entire component lies in $B$. Conversely, a successor path is an undirected path, so every element of $B$ belongs to that component.
  If the component has $v$ vertices, each of its vertices other than $t$ has exactly one outgoing edge, and $t$ has none. All these edges stay in the component, and every edge in the component is counted once at its source. Hence the connected multigraph has $v - 1$ edges and is a tree. In particular, it has neither self-loops nor parallel edges. ◻
]

To apply the lemma, add one new state $f$ to the machine and put $N = s + 1$. This is an auxiliary successor rule for a reachability test, not a change in the language to be recognized. For every $b in Sigma union { tack.r \, tack.l }$, define

$ hat(delta) \( q \, b \) = cases(delim: "{", \( f \, 0 \) \, & q in A \,, delta \( q \, b \) \, & q in Q \\ A \,, \( f \, 1 \) \, & q = f \, med b eq.not tack.l \,, upright("undefined") \, & q = f \, med b = tack.l .) $

The first case applies even when the old transition was undefined. Only the rows at old nonaccepting states retain their old partial rules, including undefined entries.

For a fixed input of length $ell$, let

$ c_0 = \( 0 \, q_0 \) \, #h(2em) t = \( ell + 1 \, f \) . $

The original machine accepts precisely when the modified successor rule reaches $t$ from $c_0$. Indeed, the computations agree until the first accepting state, which now leads into $f$ and then to $t$. Conversely, the first entry into $f$ must come from an old accepting state. This also covers acceptance initially or on an endmarker. Let $G$ be the undirected successor multigraph on all configurations $\( i \, q \)$, where $0 lt.eq i lt.eq ell + 1$ and $q in Q union { f }$. Lemma 10 shows that the component of $t$ is a tree, and that $c_0$ belongs to it exactly on accepted inputs. Nonaccepting cycles in other components require no further modification.

=== 4.2 Tours determined by cyclic orders <tours-determined-by-cyclic-orders>

An incidence of an edge at a vertex records its endpoint there. A loop has two incidences at its vertex. Choose a cyclic order of the incidences at every vertex of positive degree. Regard each edge as having two directed traversals. Upon arriving at a vertex along one incidence, depart along the next incidence in its cyclic order. At a vertex of degree one this means returning along the same edge.

#thm([Lemma 4.3.])[
  (Tree tour).  #emph[For a finite tree with at least one edge, this rule has a single cycle on its directed edge traversals, for every choice of cyclic orders. If the two joins at two distinct leaves are opened, the resulting two paths each connect a tip at one leaf to a tip at the other.]
] <lem:tree-tour>

#proof[
  The rule is a permutation of the directed traversals: a departure has exactly one preceding arrival, determined by the preceding incidence in the cyclic order. A tree consisting of one edge gives a cycle of its two traversals.
  For the induction step, remove a leaf $z$ with neighbor $v$ from a tree with more than one edge. Restrict the cyclic order at $v$ by removing the incidence of $v z$. The smaller tree has one tour cycle by induction. Inserting $v z$ back into that order replaces one transition
  $ \( u \, v \) mapsto \( v \, w \) $
  of the smaller tour by
  $ \( u \, v \) mapsto \( v \, z \) mapsto \( z \, v \) mapsto \( v \, w \) . $
  Here $u = w$ is allowed. No other transition changes. Thus two new traversals are inserted into the existing cycle, proving the first assertion.
  Realize the tour as a circular wire, using one lane for each directed traversal and a join for each arrival-to-departure step. The joins at two different leaves are two different points on this circle. Opening both cuts the circle into two paths, each running between the two cuts. Each path consequently has one tip at each of the two leaves. ◻
]

=== 4.3 Cell diagrams and their composition <cell-diagrams-and-their-composition>

#proof[
  Use the modified successor rule with its $N = s + 1$ states, numbered by $\[ N \]$. We first augment its undirected graph by leaves so that each cell’s portion of the graph can be determined from that cell’s symbol alone.
  ===== 4.3.1 Candidate edges at an internal boundary. <candidate-edges-at-an-internal-boundary.>
  At every boundary between two neighboring cells, reserve one slot for each triple
  $ \( d \, p \, q \) in { arrow.l \, arrow.r } times \[ N \] times \[ N \] . $
  The direction $d$ specifies which cell is the prospective source and which is the prospective target. The slot represents a candidate transition from state $p$ in the source cell to state $q$ in the target cell. It carries two lane ports, labeled by the absolute directions of travel $arrow.r$ and $arrow.l$. These labels, together with $\( d \, p \, q \)$, give a fixed enumeration of the
  $ k = 2 dot.op N^2 dot.op 2 = 4 N^2 $
  ports on either side of a cell. Equal labels are identified when neighboring cell diagrams are multiplied.
  For each slot put an undirected edge across the boundary. At its target end, always attach it to the target cell’s state vertex $q$. At its source end, attach it to state vertex $p$ if the modified transition from $p$ on the source cell’s symbol is exactly the transition specified by the slot. Otherwise attach that end to a new degree-one vertex in the source cell. Use a different new vertex for each unused slot.
  Every actual crossing successor edge is represented once, in its own slot. Each other slot contributes a single leaf edge attached to a state vertex. Keep every actual stay edge inside its cell, with two distinct incidences when it is a loop. The resulting graph is therefore $G$ with additional leaves and leaf edges. It has the same connectivity between state vertices as $G$, and the component of $t$ is still a tree.
  The target-end attachment makes the construction local: a target cell does not need to know whether its neighbor uses a slot. Every possible incoming slot is attached to its indicated state there. Only the source cell decides between its state vertex and a fresh leaf, using its own scanned symbol and successor rule. Figure 3 isolates this choice for one slot.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((1.9, 1.15), [#text(size: 9pt)[Active slot]])
  content((7.25, 1.15), [#text(size: 9pt)[Unused slot]])
  line((1.9, -0.9), (1.9, 0.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7.25, -0.9), (7.25, 0.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.2525, -0.2475), (0.7475, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$p$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.053, -0.2475), (3.547, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$q$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.8571, 0.07056), (2.943, 0.07056), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0.8571, -0.07056), (2.943, -0.07056), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#0000a6"))))
  content((5.603, -0.8475), (6.097, -0.3525), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$p$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.75, 0.2), (5.95, 0.4), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.85, 0.7054), [#text(size: 9pt)[fresh leaf]])
  content((8.403, 0.05251), (8.897, 0.5475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$q$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.95, 0.3706), (8.293, 0.3706), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((5.95, 0.2294), (8.293, 0.2294), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#0000a6"))))
  content((0.6, -1.25), [#text(size: 9pt)[source cell]])
  content((3.25, -1.25), [#text(size: 9pt)[target cell]])
  content((5.95, -1.25), [#text(size: 9pt)[source cell]])
  content((8.55, -1.25), [#text(size: 9pt)[target cell]])
})],
    caption: [Figure 3: One candidate transition slot with $d = arrow.r$, with its two travel lanes. The target end is always attached to state $q$. Only the source attachment changes: an actual transition uses state $p$, and an unused slot uses its own new leaf, adding no state-to-state connection. Thus the target cell needs no information about the source symbol. Other slots and local cyclic joins are omitted; lane arrows indicate traversal, not two machine transitions. ],
  ) <fig:candidate-slot>
  ===== 4.3.2 The two outward boundaries. <the-two-outward-boundaries.>
  An ordinary cell has a neighbor on each side. The left-marker cell has only its right neighbor, and the right-marker cell only its left neighbor. Use candidate slots exactly on these inward boundaries. On the outward side of the left marker, instead attach a test edge from $c_0$ to a new outer leaf $z_L$. On the outward side of the right marker attach a test edge from $t$ to another new outer leaf $z_R$.
  Each test edge has two lanes whose outer tips occupy ports $1 \, 2$ of the corresponding outward side; the same indices serve as ordinary candidate-lane ports on internal sides. These tips will remain unjoined at the outer leaf. Pair the other outward ports as $\( 3 \, 4 \) \, \( 5 \, 6 \) \, dots.h \, \( k - 1 \, k \)$, independently of all graph edges. This uses all remaining ports because $k$ is even. Denote the graph including the two test leaves by $hat(G)$. Its component containing $t$ is a tree, and its two test leaves are connected if and only if the machine accepts.
  ===== 4.3.3 Lanes and local joins. <lanes-and-local-joins.>
  Place two travel lanes on every edge of $hat(G)$, one in each direction of traversal. Each incidence consequently has an incoming tip and an outgoing tip. For an edge with incidences $i$ and $j$, its lanes connect the outgoing tip at $i$ to the incoming tip at $j$, and the outgoing tip at $j$ to the incoming tip at $i$. This prescription applies also to a loop, whose incidences are different even though their vertices coincide.
  For a crossing edge, each half-lane ends at the corresponding boundary port. Absolute travel directions determine the following local correspondence:
  $ upright("side of the cell") & arrow.r upright(" lane") & arrow.l upright(" lane")\
upright("left") & upright("incoming tip") & upright("outgoing tip")\
upright("right") & upright("outgoing tip") & upright("incoming tip") $
  Thus equal-index gluing connects an outgoing half-lane in one cell to an incoming half-lane in its neighbor, as required.
  At every vertex other than $z_L \, z_R$, choose a cyclic order of its incidences and join the incoming tip at each incidence to the outgoing tip at the next incidence. A leaf reflects one lane into the other; a vertex of degree zero requires no joins. Choose these orders separately for each symbol type and then use the same orders at every occurrence of that symbol. This is possible because all incidences are local: incoming crossing slots are always present, outgoing attachments depend only on the scanned symbol, and stay edges are internal. Marker incidences, including their test edges, are likewise fixed by marker type. Incidences can, for example, be ordered by their slot labels and their roles in internal edges.
  ===== 4.3.4 Contracting one cell. <contracting-one-cell.>
  Inside a cell, every lane tip is incident with one lane and one local join. The only exposed ends are its boundary ports, each used exactly once, including the separately paired outward ports. Hence the finite wiring inside the cell has degree two at internal points and degree one at its ports. Every component containing a port is a path ending at exactly one other port. Discard components without ports and pair the two endpoints of each remaining path. The result is a perfect matching on the cell’s $2 k$ ports, hence an element of $cal(D)_k$. Let $eta \( a \)$ be this matching for symbol $a$.
  All preceding choices for one cell depend only on $a$, which proves the asserted symbol locality. Gluing cells with equal port indices reconstructs their full wiring. Contracting paths first within cells or only after gluing yields the same pairing of outside ports, by the definition of diagram multiplication. Consequently the whole-input diagram in the theorem is precisely the pairing obtained from the wires of $hat(G)$, with the two test-leaf joins omitted and the unused outward ports separately paired. Figure 4 shows the test-port part of this contraction in the accepted case.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2.3, 1.65), [#text(size: 9pt)[glued local cell wirings,#linebreak()each fixed by its symbol]])
  line((2.3, -1), (2.3, 1), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  bezier((0, 0.6), (2.3, 0.55), (1, 1), (1.5, 0.15), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((2.3, 0.55), (4.6, 0.6), (3.1, 0.95), (3.7, 0.2), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((0, -0.6), (2.3, -0.55), (1, -1), (1.5, -0.15), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  bezier((2.3, -0.55), (4.6, -0.6), (3.1, -0.95), (3.7, -0.2), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  bezier((0, 0.6), (0, -0.6), (-0.65, 0.6), (-0.65, -0.6), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  bezier((4.6, 0.6), (4.6, -0.6), (5.25, 0.6), (5.25, -0.6), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((0, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((4.6, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((4.6, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0.6706), [#text(size: 9pt)[$L_1$]], anchor: "south", padding: 0.1176cm)
  content((0, -0.6706), [#text(size: 9pt)[$L_2$]], anchor: "north", padding: 0.1176cm)
  content((4.6, 0.6706), [#text(size: 9pt)[$R_1$]], anchor: "south", padding: 0.1176cm)
  content((4.6, -0.6706), [#text(size: 9pt)[$R_2$]], anchor: "north", padding: 0.1176cm)
  line((5.65, 0), (7.15, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.4, 0), [#text(size: 9pt)[contract paths;#linebreak()same endpoints]], anchor: "south", padding: 0.1176cm)
  content((9.2, 1.65), [#text(size: 9pt)[test-port part of the#linebreak()product of cell matchings]])
  line((8, 0.6), (10.4, 0.6), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((8, -0.6), (10.4, -0.6), stroke: (paint: rgb("#b25a00"), thickness: 1.2pt, miter-limit: 10))
  circle((8, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((8, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((10.4, 0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((10.4, -0.6), radius: 0.08481, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8, 0.6706), [#text(size: 9pt)[$L_1$]], anchor: "south", padding: 0.1176cm)
  content((8, -0.6706), [#text(size: 9pt)[$L_2$]], anchor: "north", padding: 0.1176cm)
  content((10.4, 0.6706), [#text(size: 9pt)[$R_1$]], anchor: "south", padding: 0.1176cm)
  content((10.4, -0.6706), [#text(size: 9pt)[$R_2$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 4: The accepted case, restricted to the four test ports already exposed on the marker outward sides: $L_i$ and $R_i$ name port $i$ at the left and right. For the connected sink tree, Lemma 11 shows that restoring the dashed test-leaf reflections closes one tour cycle; opening them leaves two arcs, each joining the two sides. Contracting within cells before gluing or after gluing preserves these outside endpoints and their pairing. The displayed cross pairing is one possibility. Other ports, caps, and wire components of the degree-$k$ construction are omitted. ],
  ) <fig:tour-test-ports>
  ===== 4.3.5 Reading acceptance. <reading-acceptance.>
  If a wire pairs a left test port to a right test port, it travels only along edges and joins within one component of $hat(G)$. The separately paired outward ports are disconnected from these wires. Thus $z_L$ and $z_R$ lie in the same component, and the machine accepts.
  Conversely, on an accepted input both test leaves lie in the tree component containing $t$. Temporarily add their degree-one reflection joins. Lemma 11 gives a single circular wire containing both joins. Removing them again gives two paths, each from a left test port to a right test port. This proves the acceptance criterion. Other components, including components with cycles, cannot affect these paths.
  When $w = epsilon$, the input still has two distinct adjacent marker cells. Their inward sides glue by exactly the same slot scheme, and both outward test edges are present. In the connected case the tree has at least these two edges, so the nonempty-tree hypothesis of Lemma 11 holds. Thus the argument also gives the criterion for $eta \( tack.r \) eta \( tack.l \)$.
  Finally, under the positive-transition acceptance convention, first perform the following operation on the original machine, before the sink normalization above. Add a new nonaccepting initial state $q'_0$ with partial row $delta' \( q'_0 \, b \) = delta \( q_0 \, b \)$ for every scanned symbol $b$, using the original partial transition function. Keep all old states and accepting states, and leave every transition destination in the old state set. Starting at $q'_0$ simulates exactly the original computation from its first transition onward, so acceptance with the time-zero convention for this $\( s + 1 \)$-state machine is the desired positive-transition acceptance of the original. Apply the construction already proved to obtain degree $4 \( s + 2 \)^2$. ◻
]

Extend $eta$ to body words by multiplication, with $eta \( epsilon \) = upright(bold(1))$. If $eta \( u \) = eta \( v \)$, then for every $x \, y in Sigma^(*)$ the whole-input diagrams of $x u y$ and $x v y$ coincide. The theorem therefore makes $u$ and $v$ indistinguishable in all input contexts, including empty contexts.

== 5 From relation products to the state lower bound <sec:separation>

We now connect the two representations. The use of the full relation alphabet makes this step elementary: every relation occurs as a single letter, and two additional letters select any one entry of a product. This is the context-separation property of one-way liveness #cite(label("AdeogunKapoutsis2026")).

#thm([Proposition 5.1.])[
  #emph[For $h gt.eq 2$, the language $sans(O W L)_h$ has a nondeterministic automaton with $h + 3$ states, with no left moves.]
] <prop:small-nfa>

#proof[
  Use the $h$ elements of $H = \[ h \]$ as path states, together with three distinct states $q_(upright("in")) \, q_(upright("acc")) \, q_(upright("rej"))$. Start in $q_(upright("in"))$ on the left endmarker and move right into any path state $p in H$. At a letter $R in cal(R)_H$ in path state $p$, move right into any $q$ with $\( p \, q \) in R$. If there is no such $q$, enter $q_(upright("rej"))$ by a stay move. At the right endmarker in any path state, enter $q_(upright("acc"))$ by a stay move. Declare only $q_(upright("acc"))$ accepting. The rejecting state stays forever, and all unused rules may enter it by a stay move.
  An accepting computation on $R_1 dots.h.c R_ell$ specifies states $p_0 \, dots.h \, p_ell$ with $\( p_(j - 1) \, p_j \) in R_j$ for every $j$. Such states exist exactly when $R_1 dots.h.c R_ell eq.not 0$. For the empty word, the first right move goes directly from the left marker to the right marker in a path state, and the next step accepts. This agrees with $I_H eq.not 0$. All transitions respect the boundaries, all $h + 3$ states are counted, and acceptance always follows a positive transition. ◻
]

#thm([Lemma 5.2.])[
  #emph[Let $H$ be a nonempty finite set. Suppose a deterministic automaton recognizing nonzero relation products over $cal(R)_H$ has a symbol-diagram representation in $cal(D)_k$ as in Theorem 9. Let $S subset.eq cal(D)_k$ be the submonoid generated by the ordinary-symbol diagrams, including the empty product. Then there is a unital surjection $S arrow.r cal(R)_H$ sending each ordinary-symbol diagram to its relation letter.]
] <lem:syntactic-quotient>

#proof[
  For a body word $w$, let $d \( w \) in S$ be its diagram product and let $r \( w \) in cal(R)_H$ be its relation product. Suppose $d \( u \) = d \( v \)$. For any body words $x \, y$, associativity gives
  $ d_(upright(L)) thin d \( x \) d \( u \) d \( y \) thin d_(upright(R)) = d_(upright(L)) thin d \( x \) d \( v \) d \( y \) thin d_(upright(R)) \, $
  where $d_(upright(L)) \, d_(upright(R))$ are the fixed marker diagrams. The recognition rule therefore gives the same membership decision for $x u y$ and $x v y$.
  If $r \( u \) eq.not r \( v \)$, choose $\( i \, j \)$ belonging to exactly one of them. Take $x$ to be the single letter $I_({ i })$ and $y$ the single letter $I_({ j })$. For any relation $A$,
  $ I_({ i }) A I_({ j }) = cases(delim: "{", { \( i \, j \) } \, & \( i \, j \) in A \,, 0 \, & \( i \, j \) in.not A .) $
  Exactly one of the two surrounded words would belong to the language, a contradiction. Thus $d \( u \) = d \( v \)$ implies $r \( u \) = r \( v \)$, and $phi.alt \( d \( w \) \) = r \( w \)$ is well-defined on $S$.
  Concatenation proves that $phi.alt$ preserves multiplication. The empty word gives $phi.alt \( upright(bold(1)) \) = I_H$, including when a nonempty word also has diagram product $upright(bold(1))$. Every relation is the image of its one-letter diagram, so $phi.alt$ is surjective. ◻
]

#proof[
  The source-state assertion is Proposition 12. Let an arbitrary $s$-state deterministic two-way automaton recognize $sans(O W L)_h$ on all finite words. Under initial-configuration acceptance, Theorem 9 gives a representation in $cal(D)_k$ with $k = 4 \( s + 1 \)^2$. Lemma 13 supplies a unital surjection from the generated submonoid onto $cal(R)_(\[ h \])$. Corollary 8 then gives
  $ 4 \( s + 1 \)^2 = k gt.eq L \( h \) = 2^(floor.l \( h - 2 \) \/ 31 floor.r) . $
  With positive-transition acceptance, use the additional initial copy in Theorem 9; its degree is $4 \( s + 2 \)^2$. This proves both stated bounds. ◻
]

#prodef([Remark 5.3.])[
  The auxiliary vertices and wires used in the matching representation are an algebraic encoding of a computation graph, not additional memory granted to the deterministic simulator. The lower bound is proved for every machine in the ordinary model stated in the introduction. The family uses a growing finite alphabet, as permitted by the required alphabet-independent constants; the proof makes no separate fixed-alphabet claim.
]


#bibliography("refs.bib", style: "ieee", title: [References])
