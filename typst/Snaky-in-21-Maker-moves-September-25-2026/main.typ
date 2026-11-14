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

#align(center)[#text(size: 16pt, weight: "bold")[Snaky in 21 Maker moves]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Polyomino achievement games ask whether one player can obtain a fixed shape despite an opponent’s attempts to
  obstruct it. In the weak achievement game, usually called the Maker–Breaker game,
  only Maker seeks to complete the shape. The opponent need not make a competing copy. Snaky is the six-cell target

#[#set math.equation(numbering: n => "(1)")
 $ S = { \( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 2 \, 0 \) \, \( 3 \, 0 \) \, \( 3 \, 1 \) \, \( 4 \, 1 \) } subset
   bb(Z)^2 . $ <eq:target>]

Let $cal(G)$ be the eight $2 times 2$ signed permutation matrices:
  each row and column has one nonzero entry, equal to $1$ or $- 1$.
  An allowed copy is $t + R \( S \)$ with $t in bb(Z)^2$ and $R in cal(G)$.
  Thus reflections and quarter turns are permitted, and scaling is not.
  Figure 1 shows the target in the coordinates of (1).

The board is all of $bb(Z)^2$, initially empty. Maker moves first, and thereafter Maker and Breaker alternate,
  each claiming one previously unclaimed cell. Ownership is permanent.
  Maker wins immediately upon owning every cell of an allowed copy, and may own additional cells.
  There are no initially owned cells or additional handicap moves.
  A strategy chooses a legal cell from the complete finite history.

#thm([Theorem 1.])[
  #emph[In this game, there is one globally legal Maker policy that completes an allowed copy of $S$ within at
    most $21$ actual Maker claims against every legal continuation of Breaker.
    Equivalently, extend the policy by fresh claims after an earlier win:
    its Maker set after claim $21$ contains a target whenever the first $20$ Breaker replies are legal.]
] <thm:main>

The bound counts Maker’s actual claims, including any replacement moves used in the proof.
  It corresponds to a win no later than the $41$st individual turn of the alternating game.
  Corollary 6 also gives the same bound on a finite $17 times 17$ board.
  We do not assert optimal move counts or board sizes, or a result for the strong game in which both players seek
  a copy.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.8, 0.8), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.8, 0), (1.6, 0.8), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.6, 0), (2.4, 0.8), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.4, 0), (3.2, 0.8), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.4, 0.8), (3.2, 1.6), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.2, 0.8), (4, 1.6), fill: rgb("#e8e8e8"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.4, 0), [$(0,0)$], anchor: "north", padding: 0.1176cm)
  content((2.8, 0), [$(3,0)$], anchor: "north", padding: 0.1176cm)
  content((3.6, 1.6), [$(4,1)$], anchor: "south", padding: 0.1176cm)
  line((4.8, 0), (5.6, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((5.6, 0), [$x$], anchor: "west", padding: 0.1176cm)
  line((4.8, 0), (4.8, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.8, 0.8), [$y$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The six cells of Snaky. A cell is indexed by the coordinates of its lower left corner. Every integral translation and signed coordinate permutation of this shape is an allowed target. ],
) <fig:target>

===== 1.1 Earlier results and methods. <earlier-results-and-methods.>

Sieben attributes the introduction of polyomino achievement games to Frank Harary #cite(label("Sieben2004"))
  Section 1. His account records handicap-two strategies of Harary,
  Harborth and Seemann and the nonexistence of a pairing defense for Snaky,
  and proves victory in $41$ dimensions #cite(label("Sieben2004")) Section 4 and Proposition 4.1.
  Csernenszky, Martin and Pluhár later gave a computer-free proof of the nonexistence of a pairing defense
  #cite(label("CsernenszkyMartinPluhar2011")) Theorem 10. This rules out a class of Breaker strategies,
  but does not by itself give Maker a winning strategy.

Halupczok and Schlage-Puchta proved that Snaky wins in three dimensions, loses on an $8 times 8$ board,
  and has planar handicap number at most one #cite(label("HSP2007")) Theorem 1.
  A handicap of one allows Maker two stones on the opening turn, before Breaker’s first reply.
  Ito and Miyagawa also presented a handicap-one construction #cite(label("ItoMiyagawa2007")).
  Sieben subsequently gave a finite proof sequence for that handicap and described the ordinary planar problem as
  undecided at the time #cite(label("Sieben2008")) Section 1 and Appendix B.

Theorem 1 treats the empty planar board without a handicap.
  We give three complete constructions, with bounds of $21$, $25$, and $35$ Maker moves.
  They share a composition rule but retain different information and different openings.
  The $21$-move certificate ends directly with no required Maker stones.
  The $25$-move construction removes already-owned cells from each Breaker-free region and uses required cells as
  placement anchors. The $35$-move construction supplies four explicit conditional statements at arbitrary
  positions and an opening that reaches one of them. We keep these methods explicit because their content is not
  determined by the empty-board move bounds alone.

Our method belongs to the proof-tree approach to weak achievement studied by Sieben #cite(label("Sieben2008"))
  Sections 2–3. His finite situations and territory-intersection conditions encode ways of combining continuations
  at Breaker’s turn. Our conditional positions are stated at Maker’s turn,
  with a separate Breaker-turn consequence for openings in which the pivot is already owned.
  The formulation explicitly keeps track of arbitrary previous Maker and Breaker ownership and counts actual
  future Maker moves. We prove its soundness in Section 2. The perpendicular attacks discussed by Halupczok and
  Schlage-Puchta #cite(label("HSP2007")) Section 3 also illuminate why a line of four Maker stones can exert
  substantial pressure. Section 5 gives a separate, fully stated local result of this kind.

Shaik, Mayer-Eichberger, van de Pol and Saffidine studied bounded-depth QBF encodings of finite Maker–Breaker
  games, including Snaky on a $5 times 5$ board #cite(label("ShaikEtAl2023")) Sections 2.1 and 6.
  Boucher and Villemaire study QBF encodings for finite strong achievement games on ordinary and toroidal boards
  #cite(label("BoucherVillemaire2025")) Sections 2.2, 3.3–3.4, and 4.
  Here the finite object is a proof of sufficient conditions for the infinite weak game.
  Breaker is free to play outside every displayed region, and the proof covers those replies without a board cutoff.

===== 1.2 Proof overview. <proof-overview.>

A conditional winning position is described by three finite data:
  a set $A$ that Maker must own, a set $T$ that must contain no Breaker cell,
  and a bound $h$ on further Maker moves. Starting with the six immediate completions of $S$,
  we combine such conditions as follows. Maker claims a chosen cell.
  The required cells of every child condition then belong to Maker; moreover,
  the intersection of the child envelopes belongs to Maker.
  Consequently one new Breaker cell cannot lie in every child envelope, and at least one continuation remains available.

Section 3 specifies $728$ numbered conditions, including the six bases,
  by exact integer coordinates and backward references. The final one has $A = diameter$,
  an envelope of $251$ cells, and height $21$. Section 4 turns the recursive proof into one policy chosen before
  Breaker’s play. The independent four-in-a-row result follows in Section 5.
  Section 6 distinguishes the mathematical induction, exact data identities, and independent finite calculations.
  Appendix 7 proves the reduced-envelope construction and its five-class opening.
  Appendix 8 gives the complete $35$-move construction, its unbounded opening, and its conditional tactics.
  Appendix 9 describes the finite reconstruction supplement.
  Appendices 10–12 print the three literal certificates, and Appendix 13 explains the standalone verification programs.

== 2 Conditional winning positions <sec:templates>

The purpose of this section is to justify a finite rule that remains valid when Breaker may play anywhere on the
  infinite board. At a finite position let $M \, B subset bb(Z)^2$ be the finite disjoint sets currently owned by
  Maker and Breaker. Their complete contents are retained throughout the argument.

#prodef([Definition 2.])[
  Let $A subset.eq T subset bb(Z)^2$ be finite and let $h gt.eq 1$ be an integer.
    The triple $\( A \, T \, h \)$ is a #emph[valid claim] if, at every position with Maker to move and with
  $ A subset.eq M \, wide B ∩ T = diameter \, $
  Maker has already completed a target or has a strategy that completes one within $h$ further actual Maker moves.
    We call $A$ the required set, $T$ the envelope, and $h$ the height.
] <def:claim>

This definition imposes no restriction on additional Maker cells, on Breaker cells outside $T$,
  or on how the position was reached. In particular, it applies to arbitrary finite disjoint ownership,
  without requiring a prescribed difference between $\| M \|$ and $\| B \|$. Only the starting turn is specified.
  A #emph[placement] is an affine map $F \( x \) = R x + t$ with $R in cal(G)$ and $t in bb(Z)^2$.
  A valid claim remains valid under the simultaneous replacement of $A \, T$ by $F \( A \) \, F \( T \)$,
  with the same height: the bijection $F$ transports a legal strategy, preserves disjointness and targets,
  and does not change the number of moves.

The use of finite sufficient conditions and alternative continuations has a close antecedent in Sieben’s proof
  trees and situations #cite(label("Sieben2008")) Sections 2–3.
  His situations consist of a Maker core and a neighborhood without Breaker stones and are stated at Breaker’s
  turn; the proof trees use an empty intersection of continuation territories.
  The rule below works with arbitrary finite prior ownership and counts every actual fresh Maker claim.
  Its quantitative form applies to all three constructions in this article.

#thm([Lemma 3.])[
  (Combination rule).  #emph[ Let $\( A_i \, T_i \, h_i \)$, $1 lt.eq i lt.eq r$, be valid claims, where $1 lt.eq
    r < oo$, and let $p in bb(Z)^2$. Define
#[#set math.equation(numbering: n => "(2)")
 $ T = { p } union union.big_(i = 1)^r T_i \, wide A =
   (union.big_(i = 1)^r A_i med union med ⋂_(i = 1)^r T_i) \\ { p } \, wide h = 1 + max_i h_i . $ <eq:combination>]

 Then $\( A \, T \, h \)$ is valid. Also, at a position with Breaker to move,
   if $A union { p } subset.eq M$ and $B ∩ T = diameter$, then Maker has already won or can win within $h -
   1$ further Maker moves.]
] <lem:combination>

#proof[
  Every $A_i$ is contained in $T_i$, so $A subset.eq T$. Suppose first that Maker is to move, $A subset.eq M$,
    $B ∩ T = diameter$, and no target is yet complete. Since $p in T$, Breaker does not own $p$.
    If $p$ is free, Maker claims it. If $p in M$, Maker instead claims any free cell.
    Such a cell exists because the board is infinite and $M union B$ is finite. This replacement is one real move.
    In both cases the resulting Maker set $M'$ contains
  #[#set math.equation(numbering: n => "(3)")
   $ union.big_i A_i med union med ⋂_i T_i subset.eq A union { p } subset.eq M' . $ <eq:intersection-owned>]
  If this move completes a target, stop immediately. Otherwise let $b$ be the next legal Breaker cell.
    As $b in.not M'$, (3) implies $b in.not ⋂_i T_i$. Choose an index $i$ with $b in.not T_i$.
    The older Breaker cells also avoid $T_i$, since $T_i subset.eq T$. Thus, at the next Maker turn,
  $ A_i subset.eq M' \, wide \( B union { b } \) ∩ T_i = diameter . $
  The child claim gives a win within $h_i$ more Maker moves.
    Including the move already spent gives at most $1 + h_i lt.eq h$.
  For the Breaker-turn assertion, the inclusions in (3) already hold with $M$ in place of $M'$.
    After Breaker’s next move the same surviving child applies, without spending the parent Maker move.
    Its bound is at most $max_i h_i = h - 1$. ◻
]

The replacement move cannot invalidate this argument: it only adds Maker ownership,
  and its actual ensuing Breaker reply is included in the proof. It must not be omitted from the count.
  A reply outside $T$ misses every child envelope, so distant play requires no separate case analysis.
  The Breaker-turn assertion also shows that $p$ need not have been Maker’s most recent claim.

#thm([Lemma 4.])[
  (Six bases).  #emph[Write the points of $S$ in the order in (1) as $s_0 \, dots.h \, s_5$. The claims
#[#set math.equation(numbering: n => "(4)")
 $ \( A_j \, T_j \, h_j \) = \( S \\ { s_j } \, S \, 1 \) \, wide 0 lt.eq j < 6 \, $ <eq:bases>]

 are valid.]
] <lem:bases>

#proof[
  If Maker owns $s_j$, it already owns all of $S$. Otherwise $s_j$ is free because Breaker owns none of $S$.
    Claiming it completes the target in one move. ◻
]

Every application of Lemma 3 may use placed versions of earlier claims.
  We will describe a finite collection of such applications and calculate its last required set and height.
  The semantic proof is already complete: once that required set is empty,
  the final height bounds play from the empty board.

== 3 The certificate and its final condition <sec:certificate>

This section specifies the finite applications of the combination rule.
  We use the word #emph[card] for a numbered claim in this $21$-move certificate.
  Its numbering is independent of the $25$- and $35$-move tables in Appendices 7 and 8.
  Numbered references allow a previously proved claim to be reused;
  an expression written in parentheses is simply an additional, unnumbered application of the same rule.
  The complete literal data are in Appendix 10.

=== 3.1 Coordinates, placements, and expressions <coordinates-placements-and-expressions>

The coordinate alphabet is

#raw("0123456789ABCDEFG").

A two-character word #raw("XY") denotes the point $\( x \, y \)$ whose coordinates are the positions of #raw("X")
  and #raw("Y") in this alphabet, counting from zero. For example, #raw("88") means $\( 8 \, 8 \)$,
  #raw("7A") means $\( 7 \, 10 \)$, and #raw("GG") means $\( 16 \, 16 \)$.
  The encoded pivots and translation vectors have nonnegative coordinates;
  the sets produced after signed transformations may contain negative coordinates.

A reference #raw("j:sUV") means: take numbered card $j$, apply the signed coordinate permutation $R_s$,
  and then translate by the point encoded by #raw("UV"). To compute $R_s$,
  negate the first coordinate if the bit of weight $2$ is set, negate the second if the bit of weight $4$ is set,
  and #emph[then] interchange the coordinates if the bit of weight $1$ is set. The resulting maps are

#[#set math.equation(numbering: n => "(5)")
 $ s & 0 & 1 & 2 & 3\
R_s \( x \, y \) & \( x \, y \) & \( y \, x \) & \( - x \, y \) & \( y \, - x \)\
 quad s & 4 & 5 & 6 & 7\
R_s \( x \, y \) & \( x \, - y \) & \( - y \, x \) & \( - x \, - y \) & \( - y \, - x \) . $ <eq:symmetries>]

These are precisely the eight matrices in $cal(G)$. A bare reference #raw("j") uses the identity placement.
  References change neither the child’s height nor the meaning of its winning condition.

Every data line consists of its decimal card number $j$, a pivot coordinate,
  and a nonempty ordered list of children. Each child is either a reference or an expression of the form

#raw("(XY child child ...)").

Such an expression combines its children at the pivot #raw("XY") using (2).
  All coordinates inside parentheses remain in the coordinate frame of the line.
  They are not offsets from the enclosing pivot. When the entire card is later placed by an affine map,
  that map transports every pivot and set in its proof.

Cards $0 \, dots.h \, 5$ are the six bases (4). The data specify cards $6 \, dots.h \, 727$ in order.
  Every numbered reference in a line, including a reference inside parentheses, is to a smaller card number.
  We evaluate innermost expressions first, using (2) for the sets and height.
  Consequently structural induction on each expression, followed by induction on the line number,
  proves that every resulting card is a valid claim. The finite calculation determines which sufficient conditions
  this particular list produces.

=== 3.2 Two elementary cards <two-elementary-cards>

The first two lines illustrate both the geometry and the encoding:

#raw(block: true, lang: "", "6 14 4:100 5:101\n7 05 6:001 6:405")

For card $6$, the two bases are first transposed; the second is also translated by $\( 0 \, 1 \)$.
  Direct substitution gives

#[#set math.equation(numbering: n => "(6)")
 $ A_6 = { \( 0 \, y \) : 0 lt.eq y lt.eq 4 } \, wide T_6 =
   A_6 union { \( 1 \, 3 \) \, \( 1 \, 4 \) \, \( 1 \, 5 \) } \, wide h_6 = 2 . $ <eq:first-card>]

Claiming $\( 1 \, 4 \)$ prepares two copies, completed respectively at $\( 1 \, 3 \)$ and $\( 1 \, 5 \)$.
  Unless a copy is already complete, Breaker can occupy at most one of these cells. Figure 2 shows the two alternatives.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, -0.35), (0, 3.85), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.7, -0.35), (0.7, 3.85), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 0), (1.05, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 0.7), (1.05, 0.7), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 1.4), (1.05, 1.4), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 2.1), (1.05, 2.1), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 2.8), (1.05, 2.8), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, 3.5), (1.05, 3.5), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.08819, fill: black, stroke: none)
  circle((0, 0.7), radius: 0.08819, fill: black, stroke: none)
  circle((0, 1.4), radius: 0.08819, fill: black, stroke: none)
  circle((0, 2.1), radius: 0.08819, fill: black, stroke: none)
  circle((0, 2.8), radius: 0.08819, fill: black, stroke: none)
  circle((0.7, 2.1), radius: 0.1058, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0.7, 3.5), radius: 0.1058, stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((0.581, 2.681), (0.819, 2.919), fill: rgb("#c6c6c6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.945, 2.1), [completion $(1,3)$], anchor: "west", padding: 0.1176cm)
  content((0.945, 2.8), [pivot $(1,4)$], anchor: "west", padding: 0.1176cm)
  content((0.945, 3.5), [completion $(1,5)$], anchor: "west", padding: 0.1176cm)
  content((0, -0.35), [$x=0$], anchor: "north", padding: 0.1176cm)
  line((-0.196, 0), (-0.196, 2.1), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((0.196, 0.7), (0.196, 2.8), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  content((-0.42, 1.4), [two four-cell#linebreak()subcolumns], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 2: Card $6$: dots are required Maker cells, the square is the next pivot, and circles mark the two possible completions. The vertical guides indicate the two four-cell bodies. The envelope contains no Breaker cell; any of its additional cells may already belong to Maker. ],
) <fig:fork>

For card $7$, the two copies of $A_6$ both occupy the column $x = 0$, $1 lt.eq y lt.eq 5$.
  Their additional envelope cells have heights $4 \, 5 \, 6$ and $0 \, 1 \, 2$, respectively.
  These triples are disjoint, so the intersection of the envelopes is precisely the common column.
  Deleting the pivot $\( 0 \, 5 \)$ therefore gives

$ A_7 & = { \( 0 \, y \) : 1 lt.eq y lt.eq 4 } \, wide h_7 = 3 \,\
T_7 & = { \( 0 \, y \) : 1 lt.eq y lt.eq 5 } union { \( 1 \, y \) : y in { 0 \, 1 \, 2 \, 4 \, 5 \, 6 } } . $

The general certificate repeats this mechanism with longer conditional continuations and cells that need not lie
  near the current line of Maker stones.

=== 3.3 The final card <the-final-card>

#thm([Proposition 5.])[
  #emph[The data in Appendix 10 have exactly $722$ numbered lines, with indices $6 \, dots.h \, 727$.
    Every line has a nonempty child list, every reference uses an allowed placement of an earlier card,
    and every parenthesized expression is a finite nonempty combination.
    Together with the six bases, they produce $728$ valid claims. Their heights are at most $21$, and the last card has
#[#set math.equation(numbering: n => "(7)")
 $ p_727 = \( 8 \, 8 \) \, wide A_727 = diameter \, wide \| T_727 \| = 251 \, wide h_727 = 21 . $ <eq:final-card>]

 Moreover, $T_727 subset.eq { 0 \, dots.h \, 16 }^2$.]
] <prop:certificate>

#proof[
  The syntactic and set assertions are a finite calculation from (4), (2), and (5), using the full displayed data.
    The verifier in Appendix 13 reconstructs every numbered card. Its arrays initially contain the six bases.
    Before line $j$ is processed, their entries at indices below $j$ are exactly the sets and heights specified by
    the preceding lines. A reference retrieves an earlier entry and applies its stated placement.
    Recursive evaluation applies (2) at every parenthesized node and at the root of the line.
    The nonempty-child and backward-reference tests make every union, intersection, maximum,
    and lookup well-defined. This proves the invariant for the next line and identifies the computed sets with the
    mathematically defined ones. The final tests give (7), maximum height $21$,
    and the intermediate values in Table 1. The separate reconstruction
    #raw("verification/supporting/independent_evaluator.py") also computes all sets and heights and checks the
    successive intersections. Validity then follows from Lemmas 3 and 4, by the structural induction just described. ◻
]

For clarity, Table 1 records how the final empty requirement arises.
  The last line has $32$ placed children, grouped by their six card numbers.
  Each placed required set is exactly ${ \( 8 \, 8 \) }$. The last column is the number of cells other than
  $\( 8 \, 8 \)$ in the intersection of the envelopes from that group and all preceding groups.
  The full placements occur in the last line of the certificate.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Card $j$
], table.cell(rowspan: 1, colspan: 1)[$A_j$
], table.cell(rowspan: 1, colspan: 1)[$\| T_j \|$
], table.cell(rowspan: 1, colspan: 1)[$h_j$
], table.cell(rowspan: 1, colspan: 1)[Placements
], table.cell(rowspan: 1, colspan: 1)[Remaining cells
]),
  table.cell(rowspan: 1, colspan: 1)[648
], table.cell(rowspan: 1, colspan: 1)[${ \( 4 \, 5 \) }$
], table.cell(rowspan: 1, colspan: 1)[87
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[35
],
  table.cell(rowspan: 1, colspan: 1)[708
], table.cell(rowspan: 1, colspan: 1)[${ \( 8 \, 8 \) }$
], table.cell(rowspan: 1, colspan: 1)[225
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[31
],
  table.cell(rowspan: 1, colspan: 1)[712
], table.cell(rowspan: 1, colspan: 1)[${ \( 5 \, 5 \) }$
], table.cell(rowspan: 1, colspan: 1)[96
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[21
],
  table.cell(rowspan: 1, colspan: 1)[713
], table.cell(rowspan: 1, colspan: 1)[${ \( 5 \, 5 \) }$
], table.cell(rowspan: 1, colspan: 1)[98
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[12
],
  table.cell(rowspan: 1, colspan: 1)[725
], table.cell(rowspan: 1, colspan: 1)[${ \( 7 \, 7 \) }$
], table.cell(rowspan: 1, colspan: 1)[167
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[4
],
  table.cell(rowspan: 1, colspan: 1)[726
], table.cell(rowspan: 1, colspan: 1)[${ \( 7 \, 7 \) }$
], table.cell(rowspan: 1, colspan: 1)[169
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[0
],
)
]],
  caption: [Table 1: The six groups of children in card $727$. All their requirements become the pivot. Their common envelope has no other cell, so the combination rule leaves an empty required set. ],
)

In particular, the intersection of all child envelopes is exactly ${ \( 8 \, 8 \) }$:
  it contains that point because every child requirement does, and the last table entry removes every other point.
  The union of the child requirements is the same singleton. Equation (2) therefore gives $A_727 = diameter$.
  The maximum child height is $20$, giving the bound $21$.

The data also illustrate how play may leave an immediately adjacent line.
  After Maker plays $\( 8 \, 8 \)$ and Breaker replies $\( 7 \, 8 \)$,
  the placed child #raw("708:100") is available. Its pivot is $\( 8 \, 7 \)$.
  If Breaker next takes $\( 8 \, 6 \)$, the child #raw("684:011") of card $708$,
  still under the outer transposition, is available and has pivot $\( 11 \, 8 \)$.
  These are legal illustrative choices, not imposed responses by Breaker.
  Every other reply is covered by the same intersection rule.

== 4 One strategy against every continuation <sec:strategy>

We now turn the final card into a single strategy. Making its choices definite also clarifies that the height
  counts actual Maker moves.

#proof[
  Fix an enumeration of $bb(Z)^2$: order cells by increasing $max \( \| x \| \, \| y \| \)$,
    then lexicographically within each finite level. Retain the printed order of the children in every combination
    expression. These choices are fixed before any play. Initially the active claim is card $727$ in its identity
    placement. Its hypotheses hold on the empty board by (7).
  At an active combination with current placement $F$, claim its placed pivot $F \( p \)$ if free.
    If Maker already owns $F \( p \)$, claim the first free cell in the fixed enumeration instead.
    The invariant of Definition 2 guarantees that Breaker does not own the pivot,
    and finiteness of ownership guarantees a free replacement. Stop if a target is complete.
    Otherwise, after Breaker’s next legal reply, choose the first child in the printed list whose placed envelope
    avoids that reply. Lemma 3 proves that such a child exists and that all its requirements and its full envelope
    satisfy the invariant, including the older Breaker cells.
    For a referenced card whose reference placement is $G$, the new placement is $F compose G$;
    for an inline expression, retain $F$ and use that expression.
  At a placed base card, either the target is already present or its one missing cell is free.
    In the latter case claim it and win. Thus a nonterminal step spends one actual Maker move and passes,
    after one actual Breaker reply, to a child of strictly smaller height. The bases have height $1$.
    Starting at height $21$, this procedure wins within $21$ Maker moves.
  The active expression and placement are determined by the complete history:
    replay the prescribed pivot or replacement choices and the first-surviving-child choices from card $727$.
    On a history inconsistent with an earlier prescribed Maker choice, use the first free cell of the enumeration.
    Use the same fallback on an already-won history if one chooses to continue it formally.
    This defines a globally legal policy on all finite legal histories,
    including histories not reached from the empty board under the policy.
    No choice of the policy depends on future Breaker moves. The preceding induction applies to every legal
    continuation from the empty board and proves the theorem. ◻
]

Only replies before victory are used in this argument. If the first win occurs on Maker move $m lt.eq 21$,
  there have been precisely $m - 1$ Breaker moves. In particular,
  no reply after Maker’s winning move is assumed or required.

One can express the same quantifier order using a fixed endpoint.
  Extend the policy beyond a completed target by the first-free-cell rule.
  For every sequence of proposed Breaker cells whose first $20$ entries are legal along this extended policy,
  the Maker set immediately after move $21$ contains an allowed copy of $S$.
  An earlier completed copy persists because ownership is permanent.
  This formulation is $exists sigma thin forall beta$, with $sigma$ chosen in the proof and $beta$ the sequence of
  Breaker replies; it makes no assumption about a twenty-first Breaker reply.
  Stopping at the first target recovers the ordinary game.

#thm([Corollary 6.])[
  (A finite board).  #emph[Maker wins the weak Maker–Breaker game within $21$ actual Maker claims on the initially
    empty $251$-cell board $T_727$, and also on the initially empty $17 times 17$ board ${ 0 \, dots.h \, 16 }^2$.
    In each game, Maker moves first, the players alternate claiming one previously unclaimed cell,
    and the targets are the allowed copies of $S$ contained in the board.]
] <cor:finite-board>

#proof[
  Evaluation of the literal certificate gives
  $ T_727 subset.eq { 0 \, dots.h \, 16 }^2 \, $
  in addition to the endpoint data in (7). Every placed child envelope is contained in its parent envelope,
    and every pivot and base target lies in its own envelope.
    Thus all prescribed pivots and base completions lie in $T_727$.
    Use that strategy, replacing an already-owned pivot by the first free cell in a fixed ordering of $T_727$.
    Before Maker claim $m lt.eq 21$, at most $2 \( m - 1 \) lt.eq 40$ cells have been occupied,
    so such a replacement is always available on either board.
  After a pivot or replacement claim, Maker owns every child requirement and the intersection of the child
    envelopes. Every legal Breaker reply therefore leaves a surviving child envelope;
    nesting also keeps the older Breaker cells outside that envelope.
    This includes replies outside $T_727$ on the square board.
    The same height induction now gives victory within $21$ actual Maker claims, counting each replacement.
    Play stops as soon as a target is complete; no Breaker reply after victory is used. ◻
]

== 5 Four stones in a row <sec:geometry>

The certificate establishes the empty-board theorem without assuming that nearby Breaker cells stay sparse.
  A separate local statement explains some of the geometry behind its threats.
  The perpendicular attack below is related to the four-in-a-row tactics of Halupczok and Schlage-Puchta
  #cite(label("HSP2007")) Section 3, pp. 13–15; their planar row extensions also appear in Sections 4.4–4.6 of
  that paper. We give a complete proof for the precise finite-neighborhood hypothesis used here.

#thm([Proposition 7.])[
  #emph[Suppose it is Maker’s turn at an arbitrary finite position, Maker owns the four cells
$ { \( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 2 \, 0 \) \, \( 3 \, 0 \) } \, $

 and Breaker owns at most three cells in
$ Q = \( \[ - 3 \, 6 \] times \[ - 4 \, 4 \] \) ∩ bb(Z)^2 . $

 Then Maker has already won or can force a win. Additional Maker cells and arbitrary Breaker cells outside $Q$ are
   allowed.]
] <prop:four-row>

Call a set #emph[clean] if it contains no Breaker cell. Throughout this section,
  an instruction to claim an already-owned Maker cell means to claim any free cell instead,
  unless a target has already been completed. Such a replacement is a real move and allows exactly one new Breaker
  reply. Extra Maker cells therefore cause no difficulty in any of the arguments below.

When a move is said to force Breaker to a cell $q$, the precise meaning is that $q$ completes an allowed target on
  Maker’s next move. If $q$ is already Maker’s, the target is already complete.
  Otherwise $q$ is free, and Breaker must claim it or allow that immediate completion.
  Every forced continuation is considered only when Maker has not already won or obtained this next-move win.

=== 5.1 A five-cell fork <a-five-cell-fork>

Suppose Maker owns the horizontal five ${ \( r \, 0 \) \, dots.h \, \( r + 4 \, 0 \) }$.
  For an endpoint $e in { r \, r + 4 }$ and a sign $epsilon in { - 1 \, 1 }$, put

#[#set math.equation(numbering: n => "(8)")
 $ H \( e \, epsilon \) = { \( e - 1 \, epsilon \) \, \( e \, epsilon \) \, \( e + 1 \, epsilon \) } .
   $ <eq:horizontal-triple>]

If this triple is clean at Maker’s turn, claiming its middle cell $\( e \, epsilon \)$ creates two one-cell
  completions, at its other two cells. The two targets use respectively the first and last four-cell subrows of
  the five; they are reflected or translated copies of $S$.
  Breaker can occupy at most one completion, so Maker wins on the next move unless it has already won.
  This is the horizontal version of Figure 2.

The four triples in (8) are pairwise disjoint. Consequently,
  if Maker has just created the five and at least two of these triples are clean #emph[before] Breaker’s response,
  at least one remains clean afterwards, and the fork wins.
  The same assertion holds after interchanging the coordinates. For a vertical five we use the notation

$ V \( c \, d \) = { \( c \, d - 1 \) \, \( c \, d \) \, \( c \, d + 1 \) } \, $

where $c in { - 1 \, 1 }$ and $d$ is an endpoint height.

=== 5.2 The perpendicular endpoint attack <the-perpendicular-endpoint-attack>

We first establish a local tactic at the right endpoint of a row. Assume Maker owns the four cells

$ \( - 3 \, 0 \) \, quad \( - 2 \, 0 \) \, quad \( - 1 \, 0 \) \, quad \( 0 \, 0 \) \, $

and the set

#[#set math.equation(numbering: n => "(9)")
 $ Z = { \( x \, y \) : x in { - 1 \, 0 \, 1 } \, med 1 lt.eq \| y \| lt.eq 4 } $ <eq:endpoint-zone>]

is clean. Other ownership is arbitrary. Maker claims $\( 0 \, 1 \)$, forcing $\( 1 \, 1 \)$,
  and then $\( 0 \, - 1 \)$, forcing $\( 1 \, - 1 \)$. Indeed,
  the original horizontal body with the respective pair of cells above or below its endpoint is an allowed Snaky.
  If Breaker declines either forced reply, Maker completes that copy on its next turn.

After those two replies, Maker claims $\( 0 \, 2 \)$. Denote the new Breaker reply by $b$, and set

$ E = { \( 0 \, - 2 \) } union V \( - 1 \, - 2 \) union V \( - 1 \, 2 \) . $

Figure 3 separates the two possible continuations after this reply.
  If $b in.not E$, Maker claims $\( 0 \, - 2 \)$. It now owns the vertical five from height $- 2$ to height $2$,
  and both $V \( - 1 \, - 2 \)$ and $V \( - 1 \, 2 \)$ are clean before the ensuing Breaker reply.
  They are disjoint, and neither of the two earlier forced Breaker cells is in either triple.
  The five-cell fork therefore wins.

If $b in E$, Maker instead claims $\( 0 \, 3 \)$, creating the vertical five from height $- 1$ to height $3$.
  The triple $V \( 1 \, 3 \)$ is clean. The triple $V \( - 1 \, 3 \)$ is also clean unless

$ b = \( - 1 \, 2 \) quad upright("or") quad b = \( - 1 \, 3 \) . $

If both are clean, the same two-triple argument wins. In either exceptional case there is instead an immediate
  completion at $q = \( - 1 \, - 1 \)$, because Maker already owns the other five cells of

#[#set math.equation(numbering: n => "(10)")
 $ { \( 0 \, 3 \) \, \( 0 \, 2 \) \, \( 0 \, 1 \) \, \( 0 \, 0 \) \, \( - 1 \, 0 \) \, \( - 1 \, - 1 \) } =
   { \( - y \, 3 - x \) : \( x \, y \) in S } . $ <eq:perpendicular-copy>]

The cell $q$ lies in the initially clean zone, and differs from $b$ and from the two earlier forced replies.
  It is thus free unless Maker already owns it, in which case the target is complete.
  It also lies outside $V \( 1 \, 3 \) = { \( 1 \, 2 \) \, \( 1 \, 3 \) \, \( 1 \, 4 \) }$.
  Breaker must either claim $q$, leaving that clean triple for the five-cell fork,
  or leave $q$ as an immediate winning move. This completes the endpoint tactic.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.95, -2.275), (-1.95, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.3, -2.275), (-1.3, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-0.65, -2.275), (-0.65, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2.275), (0, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.65, -2.275), (0.65, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, -1.95), (0.975, -1.95), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, -1.3), (0.975, -1.3), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, -0.65), (0.975, -0.65), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, 0), (0.975, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, 0.65), (0.975, 0.65), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, 1.3), (0.975, 1.3), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, 1.95), (0.975, 1.95), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-2.275, 2.6), (0.975, 2.6), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.95, 0), radius: 0.07056, fill: black, stroke: none)
  circle((-1.3, 0), radius: 0.07056, fill: black, stroke: none)
  circle((-0.65, 0), radius: 0.07056, fill: black, stroke: none)
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  circle((0, -0.65), radius: 0.07056, fill: black, stroke: none)
  circle((0, 0.65), radius: 0.07056, fill: black, stroke: none)
  circle((0, 1.3), radius: 0.07056, fill: black, stroke: none)
  line((0.5655, -0.7345), (0.7345, -0.5655), (0.5655, -0.5655), (0.7345, -0.7345), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.5655, 0.5655), (0.7345, 0.7345), (0.5655, 0.7345), (0.7345, 0.5655), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$o$]], anchor: "north-west", padding: 0.1176cm)
  line((5.05, -2.275), (5.05, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.7, -2.275), (5.7, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((6.35, -2.275), (6.35, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((7, -2.275), (7, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((7.65, -2.275), (7.65, 2.925), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, -1.95), (7.975, -1.95), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, -1.3), (7.975, -1.3), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, -0.65), (7.975, -0.65), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 0), (7.975, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 0.65), (7.975, 0.65), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 1.3), (7.975, 1.3), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 1.95), (7.975, 1.95), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 2.6), (7.975, 2.6), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  circle((5.05, 0), radius: 0.07056, fill: black, stroke: none)
  circle((5.7, 0), radius: 0.07056, fill: black, stroke: none)
  circle((6.35, 0), radius: 0.07056, fill: black, stroke: none)
  circle((7, 0), radius: 0.07056, fill: black, stroke: none)
  circle((7, -0.65), radius: 0.07056, fill: black, stroke: none)
  circle((7, 0.65), radius: 0.07056, fill: black, stroke: none)
  circle((7, 1.3), radius: 0.07056, fill: black, stroke: none)
  line((7.566, -0.7345), (7.734, -0.5655), (7.566, -0.5655), (7.734, -0.7345), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.566, 0.5655), (7.734, 0.7345), (7.566, 0.7345), (7.734, 0.5655), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((7, 0), [#text(size: 9pt)[$o$]], anchor: "north-west", padding: 0.1176cm)
  content((-0.455, 3.055), [#text(size: 9pt)[$b in.not E$: claim $(0,-2)$]], anchor: "south", padding: 0.1176cm)
  rect((-0.8125, -2.113), (-0.4875, -0.4875), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.8125, 0.4875), (-0.4875, 2.113), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-0.65, -1.95), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.65, -1.3), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.65, -0.65), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.65, 0.65), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.65, 1.3), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-0.65, 1.95), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((-0.0845, -1.385), (0.0845, -1.216), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((-0.9425, -1.3), [#text(size: 9pt)[$V(-1,-2)$]], anchor: "east", padding: 0.1176cm)
  content((-0.9425, 1.3), [#text(size: 9pt)[$V(-1,2)$]], anchor: "east", padding: 0.1176cm)
  content((6.545, 3.055), [#text(size: 9pt)[$b in E$: claim $(0,3)$]], anchor: "south", padding: 0.1176cm)
  rect((6.188, 1.137), (6.513, 2.763), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  rect((7.487, 1.137), (7.812, 2.763), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((6.35, 1.3), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.35, 1.95), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.35, 2.6), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((7.65, 1.3), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((7.65, 1.95), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((7.65, 2.6), radius: 0.07056, stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((6.915, 1.866), (7.085, 2.034), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.35, -0.5395), (6.46, -0.65), (6.35, -0.7605), (6.239, -0.65), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((6.058, 1.95), [#text(size: 9pt)[$V(-1,3)$]], anchor: "east", padding: 0.1176cm)
  content((7.942, 1.95), [#text(size: 9pt)[$V(1,3)$]], anchor: "west", padding: 0.1176cm)
  content((6.122, -0.65), [#text(size: 9pt)[$q=(-1,-1)$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 3: Alternative endpoint continuations after the reply $b$, which is not drawn; here $o = \( 0 \, 0 \)$. Dots show guaranteed Maker cells, crosses the two earlier forced Breaker cells, and each square the prescribed next claim. Solid outlines enclose clean triples, whose cells may already be Maker-owned. On the left, their union with the square is $E$. On the right, the dashed triple is clean except when $b = \( - 1 \, 2 \)$ or $b = \( - 1 \, 3 \)$; in those cases, claiming $\( 0 \, 3 \)$ leaves the diamond $q$ as an immediate completion while $V \( 1 \, 3 \)$ stays clean. The panels are conditional alternatives, not consecutive moves. ],
) <fig:endpoint-branches>

Every prescribed target or threat cell in this tactic lies in ${ - 3 \, - 2 \, - 1 \, 0 } times { 0 }$ or in $Z$.
  Fresh replacement moves may be elsewhere on the board. In particular,
  arbitrary Breaker moves outside the stated zone are included in the preceding cases and cannot defeat the tactic.

=== 5.3 Proof of the four-in-a-row result <proof-of-the-four-in-a-row-result>

#proof[
  Assume no target is already complete, and consider the two extensions $\( - 1 \, 0 \)$ and $\( 4 \, 0 \)$ of the
    given row.
  If both extensions belong to Breaker, there is at most one further old Breaker cell in $Q$.
    The endpoint tactic has two possible placements: at the left endpoint use $\( x \, y \)
    mapsto \( - x \, y \)$, and at the right endpoint use $\( x \, y \) mapsto \( x + 3 \, y \)$.
    Their off-row zones are respectively
  $ { - 1 \, 0 \, 1 } times { - 4 \, - 3 \, - 2 \, - 1 \, 1 \, 2 \, 3 \, 4 } quad upright("and") quad { 2 \, 3 \,
    4 } times { - 4 \, - 3 \, - 2 \, - 1 \, 1 \, 2 \, 3 \, 4 } . $
  They are disjoint subsets of $Q$, and neither contains the two row blockers. At least one zone is clean.
    The corresponding endpoint tactic proves the result.
  If exactly one extension belongs to Breaker, claim the other. This produces a five in a row.
    The four endpoint triples are pairwise disjoint and all lie in $Q$.
    The old row blocker meets none of them, and at most two further old Breaker cells can meet them.
    Thus at least two triples are clean before the new Breaker response, and the five-cell fork wins.
  It remains to consider the case that neither extension belongs to Breaker.
    If one extension produces a five with at least two clean endpoint triples, use it and finish as above.
    Suppose that both choices fail this test. For extension to the left,
    the four triples are $H \( - 1 \, plus.minus 1 \) \, H \( 3 \, plus.minus 1 \)$; for extension to the right,
    they are $H \( 0 \, plus.minus 1 \) \, H \( 4 \, plus.minus 1 \)$.
    Failure of either test requires at least three of its disjoint triples to contain an old Breaker cell.
    Since at most three old Breaker cells lie in $Q$, there are exactly three,
    and each must meet a triple for both tests. A cell with this property lies on level $-
    1$ or $1$ and has its first coordinate in ${ - 1 \, 0 }$ or in ${ 3 \, 4 }$.
    Moreover, their three combinations of #emph[left or right cluster] and #emph[lower or upper level] are
    distinct; otherwise fewer than three disjoint triples would be met in one of the tests.
  The reflections $\( x \, y \) mapsto \( 3 - x \, y \)$ and $\( x \, y \)
    mapsto \( x \, - y \)$ preserve both the original four-cell row and $Q$.
    They allow us to take the missing cluster-level combination to be the lower right one.
    The three old Breaker cells then have the form
  #[#set math.equation(numbering: n => "(11)")
   $ \( l_(-) \, - 1 \) \, quad \( l_(+) \, 1 \) \, quad \( r \, 1 \) \, wide l_(-) \, l_(+) in { - 1 \, 0 } \,
     quad r in { 3 \, 4 } . $ <eq:three-blockers>]
  No other old Breaker cell lies in $Q$. Let $a$ count the true statements $l_(-) = 0$, $l_(+) = 0$, and $r = 4$.
  Suppose first that $a gt.eq 2$. Claim $\( - 1 \, 0 \)$. The resulting five from $-
    1$ to $3$ has the clean triple $H \( 3 \, - 1 \)$. Unless Breaker meets it on its next move,
    Maker uses that fork. Hence we may assume Breaker’s new cell belongs to $H \( 3 \, - 1 \) =
    { \( 2 \, - 1 \) \, \( 3 \, - 1 \) \, \( 4 \, - 1 \) }$. Claim $\( - 2 \, 0 \)$,
    which is free or already Maker’s: neither an old blocker nor that new cell can occupy it.
    For the five from $- 2$ to $2$, each of the following is a clean endpoint triple when its indicated condition holds:
  $ upright("triple") & upright("condition")\
H \( - 2 \, - 1 \) & l_(-) = 0\
H \( - 2 \, 1 \) & l_(+) = 0\
H \( 2 \, 1 \) & r = 4 . $
  They are pairwise disjoint and are all missed by the last Breaker move.
    There are at least $a gt.eq 2$ such triples before the next response. The five-cell fork wins.
  If $a lt.eq 1$, claim $\( 4 \, 0 \)$ instead. Its clean lower-right triple $H \( 4 \, - 1 \)$ forces the next
    Breaker cell into ${ \( 3 \, - 1 \) \, \( 4 \, - 1 \) \, \( 5 \, - 1 \) }$, or gives an immediate fork win.
    Claim $\( 5 \, 0 \)$, again free or already Maker’s. For the five from $1$ to $5$, the clean disjoint triples are
  $ upright("triple") & upright("condition")\
H \( 1 \, - 1 \) & l_(-) = - 1\
H \( 1 \, 1 \) & l_(+) = - 1\
H \( 5 \, 1 \) & r = 3 . $
  At least $3 - a gt.eq 2$ conditions hold, and the most recent Breaker cell meets none of these triples.
    The fork again wins. All extension cells and triples in both cases lie in $Q$.
    This exhausts the possibilities and proves the proposition. ◻
]

Proposition 7 is a sufficient condition at an arbitrary Maker turn.
  Its proof does not assume that the four stones were obtained consecutively,
  and the $21$-move theorem does not assume that its three-blocker hypothesis occurs during play.
  The full certificate supplies the empty-board strategy.

== 6 Finite verification and its scope <sec:verification>

The three certificates describe finite applications of proved rules. Their verification has three separate parts:
  the game-theoretic soundness of those rules, the exact finite sets produced by the data,
  and the identity of the distributed files. A checksum addresses only the last part.
  The mathematical implication from a computed card to every legal continuation is Lemma 3,
  together with the reduced-envelope bridge in Appendix 7.

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Construction
], table.cell(rowspan: 1, colspan: 1)[Base cards
], table.cell(rowspan: 1, colspan: 1)[Numbered nonbase rows
], table.cell(rowspan: 1, colspan: 1)[References
], table.cell(rowspan: 1, colspan: 1)[Final bound
]),
  table.cell(rowspan: 1, colspan: 1)[$21$ moves
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[722
], table.cell(rowspan: 1, colspan: 1)[4,089
], table.cell(rowspan: 1, colspan: 1)[21
],
  table.cell(rowspan: 1, colspan: 1)[$25$ moves
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[2,010
], table.cell(rowspan: 1, colspan: 1)[5,862
], table.cell(rowspan: 1, colspan: 1)[25
],
  table.cell(rowspan: 1, colspan: 1)[$35$ moves
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[610
], table.cell(rowspan: 1, colspan: 1)[1,837
], table.cell(rowspan: 1, colspan: 1)[35
],
)
]

The reference count for the $21$-move construction includes occurrences inside its $898$ inline combinations.
  It therefore has $1 \, 620$ combination nodes altogether.
  The other two encodings have one combination per nonbase row.
  Their row numbers and orientation codes belong to three distinct tables.

=== 6.1 Exact reconstruction <exact-reconstruction>

All calculations use finite sets of integer pairs. Each primary program parses its literal data,
  checks the grammar and backward references, applies the specified placements,
  and reconstructs every required set, envelope, and height.
  A separate implementation for each dialect independently parses and reconstructs the same data.
  These programs are supplied with the complete editable source; no strategy search, network connection,
  or undistributed game tree is needed. Appendix 13 gives the commands.

For the $21$-move certificate the reconstruction includes every inline node, its enclosing coordinate frame,
  and the $32$ children of the last card. It checks the endpoint,
  including containment of its 251-cell envelope in ${ 0 \, dots.h \, 16 }^2$, the elementary cards,
  the successive intersections in Table 1, and the nonlocal continuation.
  There are $37 \, 042$ local reply classes over all combination nodes.
  For the $25$-move certificate it checks all $2 \, 010$ reduced compositions, their normalized full cards,
  the required-size histogram, the five exceptional opening classes, and the elementary and nonlocal examples.
  For the $35$-move certificate it checks all $616$ templates, $26 \, 703$ local reply classes,
  the four terminal interfaces, and the longer tactical identities in Appendix 8.

A local reply check uses the minimal Maker ownership required after the pivot;
  additional Maker cells only remove possible legal replies.
  One exterior case represents cells outside the parent envelope, since every child envelope lies inside it.
  In the reduced encoding this statement is applied after normalization.
  These finite checks support the set calculations. Their coverage of arbitrary ownership and the infinite board
  follows from the proved composition rule. Likewise, tests of sample opening coordinates supplement the symbolic
  whole-grid opening proof in Appendix 8.

The supplied test harnesses compare the full reconstructed cards, not only terminal cardinalities.
  They also test rejection of malformed or truncated inputs and execution with Python optimization.
  Programs either use explicit exceptions for required checks or refuse execution when assertions have been
  disabled. The harnesses state their finite checks separately from the game-theoretic claims.

=== 6.2 Literal identities and formal coverage <literal-identities-and-formal-coverage>

The literal data are printed in Appendices 10–12. Their literal SHA-256 identities are

#raw(block: true, lang: "", "21: 3fa12d36a6d4dbb185e3f2808c8dfde13d85ee309afbca030d6ad17ae9fe3d04\n25: 41cd04620af889771862dcceda7383afd99933ae03ddb0a566a00d742a8249b0\n35: 16d077f0b64df70dd67fb6e9651636d42eaab0ce0f01f46180a57846e38fedc2")

The middle file includes its initial newline and all $41$ index markers.
  The source guide also records the normalized numeric serialization of that table;
  it is a separate identity from the full literal. The programs read these files as data and do not execute them
  as code. Matching bytes do not replace reconstruction, and matching sets do not replace the semantic induction
  or the move-count argument.

Appendix 9 records the scope of the finite reconstruction supplement for the $35$-move certificate.
  This supplement proves seven finite reconstruction claims.
  It does not prove a complete winning strategy, the $21$- or $25$-move construction,
  or the finite-board corollary. The finite Python reconstructions do not themselves establish a Lean theorem or
  kernel compilation. All three conventional proofs are given independently of this supplement.

== 7 The reduced-envelope 25-move construction <app:route25>

This construction records only those cells whose freedom from Breaker is not already implied by Maker’s required
  holdings. It gives a second finite strategy, with a different placement convention and a different opening
  cover. We first justify this representation and its exact relationship to Section 2,
  then reconstruct the certificate and explain its elementary and nonlocal attacks.

Throughout this appendix, a numbered #emph[$25$-card] belongs to the family

$ sans(C)_i^25 = \( P_i \, E_i \, h_i \) \, wide 0 lt.eq i lt.eq 2015 . $

The symbols $P_i \, E_i \, h_i$ in this appendix refer only to that family.
  Its card numbers, placement codes, and local coordinates are independent of the $21$- and $35$-move
  constructions. In particular, their cards with the same number need not have the same sets or meaning.

=== 7.1 Reduced requirements and their normalization <r25:semantics>

Let $P \, E subset bb(Z)^2$ be finite and let $h gt.eq 1$ be an integer.
  A #emph[valid reduced card] $\( P \, E \, h \)$ means the following:
  at every Maker turn with finite disjoint ownership sets $M \, B$, if

#[#set math.equation(numbering: n => "(12)")
 $ P subset.eq M \, wide B ∩ E = diameter \, $ <r25:condition>]

Maker has already won or can win within $h$ further actual Maker claims.
  We do not impose $P subset.eq E$, nor do we require $P$ and $E$ to be disjoint.
  Additional Maker cells and arbitrary Breaker cells outside $E$ are allowed.
  A signed permutation and translation applied to both sets preserves validity and height,
  by the same transport argument as for full cards.

The normalization

#[#set math.equation(numbering: n => "(13)")
 $ \( P \, E \, h \) mapsto \( A \, T \, h \) = \( P \, P union E \, h \) $ <r25:normalization>]

preserves exactly the admissible positions. Indeed, $P subset.eq M$ and $M ∩ B = diameter$ already imply $B ∩ P =
  diameter$; under that assumption,

$ B ∩ E = diameter quad arrow.l.r.double quad B ∩ \( P union E \) = diameter . $

Conversely, a full card $\( A \, T \, h \)$ with $A subset.eq
  T$ has the reduced representative $\( A \, T \\ A \, h \)$.
  Normalizing this representative returns $\( A \, T \, h \)$ exactly.
  Normalizing an arbitrary $\( P \, E \, h \)$ and then reducing replaces $E$ by $E \\ P$;
  this changes no hypothesis on a legal position. Thus disjoint reduced sets are convenient representatives,
  not an extra assumption in the semantics.

#thm([Proposition 8.])[
  (Reduced composition).  #emph[Let $\( P_j \, E_j \, h_j \)$, $1 lt.eq j lt.eq m$,
    be valid reduced cards already placed in one coordinate plane, where $1 lt.eq m < oo$. Given an attack cell $x$, put
#[#set math.equation(numbering: n => "(14)")
 $ U & = union.big_j P_j \, & V & = union.big_j E_j \, & I & = ⋂_j E_j \,\
H & = U union I \, & P & = H \\ { x } \, & E & = \( V \\ H \) union { x } \, wide h = 1 +
  max_j h_j . $ <r25:reduced-rule>]

 Then $\( P \, E \, h \)$ is valid. Its normalization is exactly the full card obtained by Lemma 3 from the
   normalized children $\( P_j \, P_j union E_j \, h_j \)$ at $x$; in particular,
   normalization changes neither the required set nor the height.]
] <r25:composition>

#proof[
  We give the direct game argument, including the move that is needed when the attack cell is already owned.
    Suppose (12) holds for the parent and no target is complete. Because $x in E$, Breaker does not own $x$.
    If it is free, claim it. Otherwise Maker already owns it and claims any free cell instead;
    finite ownership on $bb(Z)^2$ guarantees that one exists.
    This replacement consumes one actual Maker claim, with its ensuing Breaker reply if play continues.
    In either case the new Maker set $M'$ contains $H$, since it contains $P$ and $x$.
  Every older Breaker cell avoids every child envelope $E_j$.
    To see this without assuming $P_j subset.eq E_j$, note that the cells of $E_j$ outside $H$ lie in $E$,
    while its cells inside $H$ now belong to Maker. If the move has not won,
    the next legal Breaker cell $b$ is outside $M'$, hence outside $I subset.eq H$.
    Since the child list is nonempty, some $E_j$ omits $b$. At the next Maker turn this child satisfies
  $ P_j subset.eq U subset.eq M' \, wide \( B union { b } \) ∩ E_j = diameter . $
  It wins in at most $h_j$ additional Maker claims. The total is at most $1 + h_j lt.eq h$.
    This also covers replies anywhere outside the finite sets displayed in the construction.
  For the asserted exact agreement, the pointwise identity is
  #[#set math.equation(numbering: n => "(15)")
   $ U union ⋂_j \( P_j union E_j \) = U union ⋂_j E_j = H . $ <r25:intersection-identity>]
  For a point outside $U$, membership in $P_j union E_j$ is equivalent to membership in $E_j$ for every $j$;
    points inside $U$ belong to both sides. This proves the identity without any containment or disjointness
    assumption on the child sets. Consequently the full composition’s required set is $H \\ { x } = P$. Its envelope is
  $ { x } union union.big_j \( P_j union E_j \) & = { x } union U union V\
 & = #scale(x: 120%, y: 120%)[\(] H \\ { x } #scale(x: 120%, y: 120%)[\)] union
   #scale(x: 120%, y: 120%)[\(] \( V \\ H \) union { x } #scale(x: 120%, y: 120%)[\)] = P union E . $
  Here $I subset.eq V$, using the nonempty list. Both height recursions are $1 + max_j h_j$. ◻
]

The same argument has a Breaker-turn form. If immediately before a Breaker reply Maker owns $P union {
  x }$ and Breaker avoids $E$, then after that reply a child applies within at most $max_j
  h_j$ further Maker claims. The attack cell need not have been the latest Maker claim.
  This follows directly from ownership of $H$ and the older Breaker avoidance proved above.

=== 7.2 Bases, anchors, and the decimal certificate <r25:decoder>

All attacks in the local coordinates of a $25$-card occur at $o = \( 0 \, 0 \)$. Order the target cells as

$ \( L_0 \, dots.h \, L_5 \) = \( \( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 2 \, 0 \) \, \( 3 \, 0 \) \, \( 3 \,
  1 \) \, \( 4 \, 1 \) \) . $

Thus $S = { L_0 \, dots.h \, L_5 }$. The six base cards are

#[#set math.equation(numbering: n => "(16)")
 $ P_i = \( S \\ { L_i } \) - L_i \, wide E_i = { o } \, wide h_i = 1 \, wide 0 lt.eq i < 6 . $ <r25:bases>]

If $o$ is already Maker’s, the translated target $S - L_i$ is already complete.
  Otherwise $o$ is free and completes it in one move. Their normalized envelopes are exactly $S - L_i$.

For a reference to card $j$, order its required set $P_j$ lexicographically,
  by the first coordinate and then the second, starting with index zero.
  Write a placement code $r$ uniquely as $r = 8 k + d$, $0 lt.eq d < 8$,
  and let $a_(j \, k)$ be the $k$th cell in that order. The code is defined only when $0 lt.eq k < \| P_j \|$. Set

#[#set math.equation(numbering: n => "(17)")
 $ Phi_(j \, r) \( v \) = R_d \( v - a_(j \, k) \) \, $ <r25:placement>]

where the signed permutations are given explicitly by

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3$
]),
  table.cell(rowspan: 1, colspan: 1)[$R_d \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( y \, x \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - y \, x \)$
],
  table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$7$
],
  table.cell(rowspan: 1, colspan: 1)[$R_d \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( x \, - y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( y \, - x \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - x \, - y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - y \, - x \)$
],
)
]

Equivalently, swap first when $d$ is odd, then negate the first coordinate for the bit of value $2$,
  and the second for the bit of value $4$. In particular codes $3$ and $5$ use the swap-first order;
  they must not be interpreted using the $21$-card decoder.
  Each map in (17) aligns one #emph[required] child cell with the parent’s attack $o$.
  The anchor is taken from $P_j$, not $E_j$ or the normalized envelope.
  A child placement inside a current placement $F$ is $F compose Phi_(j \, r)$.

The complete literal certificate, printed in Appendix 11 and supplied as ,
  has $2010$ numeric lines defining cards $6$ through $2015$ in order. Blank lines have no effect.
  A marker #raw("# n") asserts that the next card number is $n$ and creates no card. There are $41$ such markers.
  Every numeric line consists of decimal blocks of exactly three digits.
  At current card $i$, read these blocks from left to right; a block with value $b$ decodes as follows:

#[#set math.equation(numbering: n => "(18)")
 $ upright("condition") & upright("referenced card ") j & upright("placement code ") r\
0 lt.eq b < 240 & floor.l b \/ 40 floor.r & b med mod med 40\
240 lt.eq b < 740 & i - 1 - floor.l \( b - 240 \) \/ 100 floor.r & \( b - 240 \) med mod med 100\
740 lt.eq b lt.eq 999 & 10 \( b - 740 \) + floor.l c \/ 100 floor.r & c med mod med 100 $ <r25:decimal>]

The last case consumes the next three-digit block as $c$ as well. A missing second block is invalid.
  Leading zeros are part of the three-digit format. Every resulting pair $\( j \, r \)$ must satisfy $0 lt.eq
  j < i$ and the anchor range in (17), and each numeric line must contain at least one pair.

For the decoded list $cal(L)_i$ of card $i$, form the placed children

$ \( Phi_(j \, r) \( P_j \) \, Phi_(j \, r) \( E_j \) \, h_j \) \, wide \( j \, r \) in cal(L)_i \, $

and apply (14) at $x = o$ to define $P_i \, E_i \, h_i$. Every placed required set contains $o$,
  because of its anchor. The resulting $P_i$ and $E_i$ are disjoint, and $o in E_i$.
  These properties are consequences of the recurrence; the soundness proof did not assume them.
  All references are backward, so induction from (16) proves the validity of every card whose line decodes.
  No game-tree search or additional compatibility test is needed:
  the union and intersection in the composition formula put all necessary extra ownership into the parent’s
  required set.

For example, #raw("193233") decodes into $\( 4 \, 33 \) \, \( 5 \, 33 \)$.
  The next line, #raw("165272"), decodes at $i = 7$ into $\( 4 \, 5 \) \, \( 6 \, 32 \)$.
  At $i = 2015$, #raw("927400") is an extended term $\( 1874 \, 0 \)$,
  whereas #raw("240") is the relative term $\( 2014 \, 0 \)$.
  Thus all three cases in (18) refer to the same anchor placement rule after decoding.

=== 7.3 The first two composite cards <r25:elementary>

The first two rows exhibit both simultaneous finishes and transfer after a forced block.
  For card $6$, the two codes $33 = 8 dot.op 4 + 1$ use anchors $\( 1 \, 0 \) in P_4$ and $\( - 1 \, 0 \) in P_5$,
  respectively. Their placed envelopes are the singletons ${ \( 0 \, - 1 \) }$ and ${ \( 0 \, 1 \) }$.
  Their placed required sets are

$ { \( - 1 \, t \) : - 4 lt.eq t lt.eq - 1 } union { o } \, wide { \( - 1 \, t \) : - 3 lt.eq t lt.eq
  0 } union { o } . $

The intersection of the two singleton envelopes is empty. Composition therefore gives exactly

#[#set math.equation(numbering: n => "(19)")
 $ P_6 = { \( - 1 \, t \) : - 4 lt.eq t lt.eq 0 } \, wide E_6 = { \( 0 \, - 1 \) \, o \, \( 0 \, 1 \) } \, wide
   h_6 = 2 . $ <r25:card6>]

After the attack at $o$, the two one-hole copies have different holes.
  If neither is already complete, a single Breaker reply cannot block both.
  All five cells of the required column are outside $E_6$; this is an explicit reason the reduced notation must
  allow $P_6 subset.eq.not E_6$.

For card $7$, code $5$ at card $4$ uses the first lexicographic anchor $\( - 3 \, - 1 \)$ and
  $R_5 \( x \, y \) = \( y \, - x \)$. Its placed required set and hole are

$ { \( 0 \, - 3 \) \, \( 0 \, - 2 \) \, \( 0 \, - 1 \) \, o \, \( 1 \, - 4 \) } \, wide { \( 1 \, - 3 \) } . $

Code $32 = 8 dot.op 4$ at card $6$ uses anchor $\( - 1 \, 0 \)$ and is translation by $\( 1 \, 0 \)$.
  Its placed required set is ${ \( 0 \, t \) : - 4 lt.eq t lt.eq 0 }$,
  its envelope is ${ \( 1 \, - 1 \) \, \( 1 \, 0 \) \, \( 1 \, 1 \) }$, and its attack is $\( 1 \, 0 \)$.
  Again the two child envelopes are disjoint, giving

#[#set math.equation(numbering: n => "(20)")
 $ P_7 & = { \( 0 \, - 4 \) \, \( 0 \, - 3 \) \, \( 0 \, - 2 \) \, \( 0 \, - 1 \) \, \( 1 \, - 4 \) } \,\
E_7 & = { o \, \( 1 \, - 3 \) \, \( 1 \, - 1 \) \, \( 1 \, 0 \) \, \( 1 \, 1 \) } \, wide h_7 = 3 . $ <r25:card7>]

After the attack at $o$, failure to block $\( 1 \, - 3 \)$ lets Maker complete the base child on the next move.
  A block there leaves the translated card $6$ available, whose next attack is $\( 1 \, 0 \)$.
  If one of these attacks was already owned, the general card semantics either detects an earlier target or
  charges the required fresh replacement. The ensuing reply is never skipped. Figure 4 displays the two configurations.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.7, -3.15), (-0.7, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((0, -3.15), (0, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((0.7, -3.15), (0.7, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, -2.8), (1.05, -2.8), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, -2.1), (1.05, -2.1), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, -1.4), (1.05, -1.4), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, -0.7), (1.05, -0.7), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, 0), (1.05, 0), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((-1.05, 0.7), (1.05, 0.7), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.7, -2.8), radius: 0.07761, fill: black, stroke: none)
  circle((-0.7, -2.1), radius: 0.07761, fill: black, stroke: none)
  circle((-0.7, -1.4), radius: 0.07761, fill: black, stroke: none)
  circle((-0.7, -0.7), radius: 0.07761, fill: black, stroke: none)
  circle((-0.7, 0), radius: 0.07761, fill: black, stroke: none)
  circle((0, 0), radius: 0.1129, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.105, 0), [$o$], anchor: "west", padding: 0.1176cm)
  rect((-0.077, -0.777), (0.077, -0.623), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.077, 0.623), (0.077, 0.777), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, -3.29), [$25$-card $6$], anchor: "north", padding: 0.1176cm)
  line((6, -3.15), (6, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((6.7, -3.15), (6.7, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((7.4, -3.15), (7.4, 1.05), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, -2.8), (7.75, -2.8), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, -2.1), (7.75, -2.1), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, -1.4), (7.75, -1.4), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, -0.7), (7.75, -0.7), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, 0), (7.75, 0), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  line((5.65, 0.7), (7.75, 0.7), stroke: (paint: rgb("#d9d9d9"), thickness: 0.4pt, miter-limit: 10))
  circle((6, -2.8), radius: 0.07761, fill: black, stroke: none)
  circle((6, -2.1), radius: 0.07761, fill: black, stroke: none)
  circle((6, -1.4), radius: 0.07761, fill: black, stroke: none)
  circle((6, -0.7), radius: 0.07761, fill: black, stroke: none)
  circle((6.7, -2.8), radius: 0.07761, fill: black, stroke: none)
  circle((6, 0), radius: 0.1129, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((5.895, 0), [$o$], anchor: "east", padding: 0.1176cm)
  rect((6.623, -2.177), (6.777, -2.023), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((6.805, -2.1), [block], anchor: "west", padding: 0.1176cm)
  circle((6.7, 0), radius: 0.1129, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((6.805, 0), [next], anchor: "west", padding: 0.1176cm)
  rect((6.623, -0.777), (6.777, -0.623), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((6.623, 0.623), (6.777, 0.777), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((6.7, -3.29), [$25$-card $7$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 4: The elementary reduced cards. Solid disks are the required Maker cells. In card $6$, attacking the open disk $o$ gives the two square-marked finishes. In card $7$, the attack at $o$ threatens the square $\( 1 \, - 3 \)$; after that block, the open disk $\( 1 \, 0 \)$ starts the translated card $6$, with finishes at the other two squares. ],
) <r25:elementary-figure>

=== 7.4 The complete finite reconstruction and its endpoint <r25:reconstruction>

We now apply the same recurrence to the entire literal, retaining every row.
  The supplied primary program and independent program reconstruct its finite sets and heights.
  Their checks include the decimal grammar, every backward reference and anchor, the marker numbers,
  the required number of rows, and the exact endpoint. Malformed or truncated input is rejected;
  Appendix 13 gives the verification commands and their scope.
  Their finite arithmetic supports the set identities below;
  the reason these sets give a game strategy is Proposition 8 and the induction just proved,
  independently of either program.

The complete reconstruction has $2016$ cards and $5862$ placed child terms.
  The number of cards of each required-set size is

#[#set math.equation(numbering: n => "(21)")
 $ \| P_i \| & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10\
upright("number") & 1 & 5 & 52 & 217 & 448 & 523 & 416 & 219 & 103 & 30 & 2 . $ <r25:histogram>]

The last card can also be inspected through the much smaller terminal table.
  Its $28$ children comprise exactly the following five groups in the printed order.
  Each listed code has anchor index $k = 0$. The last column gives the size of the intersection of all placed
  reduced envelopes through the end of that row of the table.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (right, center, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Child $j$
], table.cell(rowspan: 1, colspan: 1)[Codes $r$
], table.cell(rowspan: 1, colspan: 1)[$\| E_j \|$
], table.cell(rowspan: 1, colspan: 1)[$h_j$
], table.cell(rowspan: 1, colspan: 1)[Cumulative intersection
]),
  table.cell(rowspan: 1, colspan: 1)[$1874$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 2 \, 5$
], table.cell(rowspan: 1, colspan: 1)[$292$
], table.cell(rowspan: 1, colspan: 1)[$24$
], table.cell(rowspan: 1, colspan: 1)[$184$
],
  table.cell(rowspan: 1, colspan: 1)[$1985$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 2 \, 4 \, 6$
], table.cell(rowspan: 1, colspan: 1)[$162$
], table.cell(rowspan: 1, colspan: 1)[$19$
], table.cell(rowspan: 1, colspan: 1)[$96$
],
  table.cell(rowspan: 1, colspan: 1)[$1996$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 2 \, 5$
], table.cell(rowspan: 1, colspan: 1)[$117$
], table.cell(rowspan: 1, colspan: 1)[$15$
], table.cell(rowspan: 1, colspan: 1)[$49$
],
  table.cell(rowspan: 1, colspan: 1)[$1998$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 2 \, 3 \, 4 \, 5 \, 6 \, 7$
], table.cell(rowspan: 1, colspan: 1)[$119$
], table.cell(rowspan: 1, colspan: 1)[$20$
], table.cell(rowspan: 1, colspan: 1)[$32$
],
  table.cell(rowspan: 1, colspan: 1)[$2014$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 2 \, 3 \, 4 \, 5 \, 6 \, 7$
], table.cell(rowspan: 1, colspan: 1)[$76$
], table.cell(rowspan: 1, colspan: 1)[$14$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
)
]],
  caption: [Table 4: All children of $25$-card $2015$. The common reduced envelope disappears after the last group. ],
)

The required sets of these five child cards are

#[#set math.equation(numbering: n => "(22)")
 $ P_1874 = P_1985 = P_1996 = { \( - 1 \, 0 \) } \, wide P_1998 = { \( 0 \, 1 \) } \, wide P_2014 =
   { \( 1 \, 0 \) } . $ <r25:singleton-requirements>]

Every placed requirement is therefore ${ o }$. The table gives $U = { o }$ and $I = diameter$, hence $H = { o }$ and

#[#set math.equation(numbering: n => "(23)")
 $ P_2015 = diameter \, wide \| E_2015 \| = 389 \, wide h_2015 = 25 . $ <r25:terminal>]

The last height is $1 + 24$, not a bound obtained by identifying this certificate with either of the other two
  constructions.

For an explicit description of the final finite region, its section at ordinate $y$ is empty when $\| y \| > 11$;
  otherwise it is the set of integer abscissae in the following table:

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\| y \|$
], table.cell(rowspan: 1, colspan: 1)[Abscissae $x$
], table.cell(rowspan: 1, colspan: 1)[$\| y \|$
], table.cell(rowspan: 1, colspan: 1)[Abscissae $x$
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 10 \, 10 \]$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 9 \, 9 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 11 \, 11 \]$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 7 \, 7 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 10 \, 10 \]$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 6 \, 6 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 11 \, 11 \]$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 6 \, 6 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 10 \, 10 \]$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 5 \, 5 \]$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 10 \, 10 \]$
], table.cell(rowspan: 1, colspan: 1)[$11$
], table.cell(rowspan: 1, colspan: 1)[${ - 3 \, - 1 \, 1 \, 3 }$
],
)
]

Here intervals mean all integer points. The row counts give $21 +
  2 \( 23 + 21 + 23 + 21 + 21 + 19 + 15 + 13 + 13 + 11 + 4 \) = 389$.

#thm([Proposition 9.])[
  (The $25$-move strategy).  #emph[There is one ordinary Maker policy on the infinite square board that,
    from the empty position, completes a copy of $S$ within $25$ actual fresh Maker claims against every legal
    Breaker continuation. In the fixed-endpoint formulation, after extending the policy by fresh moves beyond an
    earlier win, the Maker set after its $25$th claim contains a target whenever the first $24$ Breaker replies
    are legal along the policy.]
] <r25:bound>

#proof[
  Induction using (16) and Proposition 8 proves the validity of all $2016$ cards.
    Equation (23) therefore applies at the empty position. To fix one policy before the opponent’s choices,
    fix an enumeration of $bb(Z)^2$ and the printed order of every child list.
    Start with card $2015$ in its identity placement. At a composite card in placement $F$,
    take $F \( o \)$ if free, or the first free cell of the enumeration if $F \( o \)$ is already owned.
    Stop at a target. If play continues, after the next legal Breaker reply choose the first child $\( j \, r \)$
    whose placed reduced envelope avoids the current Breaker set.
    The composition proof guarantees its existence and its required ownership.
    Replace the active placement by $F compose Phi_(j \, r)$.
    At a base, its hole is either already filled, giving a target, or can be taken to finish one.
  Each nonterminal descent consumes one actual fresh Maker claim, including every replacement,
    and decreases the height. No path from height $25$ needs more than $25$ such claims.
    As in Section 4, the active card and placement are determined by replaying the complete history.
    On a history inconsistent with the policy, or beyond a completed target,
    prescribe the first free cell instead. This makes the policy globally legal on finite legal histories and
    fixes it independently of future replies.
  If the first win is on claim $m lt.eq 25$, exactly $m - 1$ replies have preceded it.
    Thus only $24$ replies can be needed. Under the extended policy an earlier target persists,
    proving the fixed-endpoint statement without any assumption on a $25$th Breaker reply. ◻
]

=== 7.5 Why only five first-reply classes need extra cards <r25:opening>

The final row can be understood geometrically as a cover of all first Breaker replies.
  After Maker takes $o$, each of the eight placements $Phi_(2014 \, d)$, $0 lt.eq d < 8$,
  has required set ${ o }$. Let $D$ be the intersection of their reduced envelopes. The exact finite calculation is

#[#set math.equation(numbering: n => "(24)")
 $ D =  & { \( plus.minus t \, 0 \) \, \( 0 \, plus.minus t \) : t = 1 \, 2 \, 3 }\
 & med
   union { \( plus.minus 1 \, plus.minus 1 \) } union
   { \( plus.minus 2 \, plus.minus 1 \) \, \( plus.minus 1 \, plus.minus 2 \) } \, $ <r25:opening-common>]

with independent signs. It contains $24$ cells. In particular the sorted absolute coordinates, larger first,
  have exactly the five values

$ \( 1 \, 0 \) \, quad \( 1 \, 1 \) \, quad \( 2 \, 0 \) \, quad \( 2 \, 1 \) \, quad \( 3 \, 0 \) . $

The set $D$ is invariant under all signed permutations: composing any one of those permutations with the eight
  placements merely permutes them. Equation (24) is a finite set identity,
  so it covers unbounded first replies as well: for every $b in.not D$,
  at least one of the eight envelopes omits $b$. That placement of card $2014$ is already available,
  giving at most $14$ further claims.

For the five remaining classes, the following placements omit the listed first Breaker cell.
  All use $k = 0$ and have placed required set ${ o }$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[First Breaker cell
], table.cell(rowspan: 1, colspan: 1)[Child $j$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[Next attack
], table.cell(rowspan: 1, colspan: 1)[Further bound $h_j$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$1874$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$24$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1985$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$19$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$1996$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$15$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1998$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$20$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$1996$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$15$
],
)
]],
  caption: [Table 6: The five exceptional opening classes for the $25$-move construction. Each bound begins at Maker’s second turn. ],
)

For example, the first placement is $Phi_(1874 \, 2) \( x \, y \) = \( - x - 1 \, y \)$ because its anchor is
  $\( - 1 \, 0 \)$; the fourth is $Phi_(1998 \, 2) \( x \, y \) = \( - x \, y - 1 \)$ because its anchor is
  $\( 0 \, 1 \)$. These formulas give the displayed attacks directly.
  For an arbitrary reply in one of the five classes, choose a signed permutation $Q$ taking its representative to
  that reply and use the placement $Q compose Phi_(j \, d)$.
  It still requires only $o$, and its envelope omits that reply.
  Thus the table and the eight placements of card $2014$ give a direct whole-board opening proof,
  with largest total $1 + 24 = 25$. The terminal row in Table 2 encodes a finite opening cover of this kind using
  its specified $28$ placements.

=== 7.6 Two continuations that leave the initial line <r25:nonlocal>

We finish by following two actual children of card $1874$.
  This makes the composition of coordinate maps visible and shows why an implementation must retain the complete
  envelopes. Suppose Maker has played $o$, Breaker has replied $\( 1 \, 0 \)$,
  and Maker uses the first row of Table 3 to attack $\( - 1 \, 0 \)$. The current outer placement is

$ F \( x \, y \) = Phi_(1874 \, 2) \( x \, y \) = \( - x - 1 \, y \) \, wide M = { o \, \( - 1 \, 0 \) } \, wide
  B = { \( 1 \, 0 \) } $

before Breaker’s next reply. The two following continuations are present in the literal row for card $1874$:

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Next reply
], table.cell(rowspan: 1, colspan: 1)[Child $j$
], table.cell(rowspan: 1, colspan: 1)[Code $r$
], table.cell(rowspan: 1, colspan: 1)[Anchor $a_(j \, k)$
], table.cell(rowspan: 1, colspan: 1)[Next attack
]),
  table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$1716$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - 3 \, 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$1752$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - 1 \, 2 \)$
],
)
]

For the first, the native required set is $P_1716 = { \( - 3 \, - 1 \) \, \( - 2 \, - 1 \) }$.
  Since $8 = 8 dot.op 1 + 0$, the lexicographic anchor is the second point, $\( - 2 \, - 1 \)$, and

$ Phi_(1716 \, 8) \( x \, y \) = \( x + 2 \, y + 1 \) \,
  wide \( F compose Phi_(1716 \, 8) \) \( x \, y \) = \( - x - 3 \, y + 1 \) . $

The transformed requirement is precisely ${ o \, \( - 1 \, 0 \) }$.
  The reduced envelope has $256$ cells and satisfies the exact check

#[#set math.equation(numbering: n => "(25)")
 $ \( F compose Phi_(1716 \, 8) \) \( E_1716 \) ∩ { \( 1 \, 0 \) \, \( - 1 \, - 1 \) } = diameter . $ <r25:avoidance1>]

Thus the old reply as well as the new reply is excluded, and the transformed pivot is $\( - 3 \, 1 \)$.
  It is distinct from all four cells then owned by either player.
  Card $1716$ supplies a height-$23$ continuation after the first two Maker claims,
  consistent with the total bound $25$.

For the second, $P_1752 = { \( - 2 \, 0 \) \, \( - 2 \, 1 \) }$ and $r =
  3$ selects the first anchor and the swap-first map $R_3 \( x \, y \) = \( - y \, x \)$. Hence

$ Phi_(1752 \, 3) \( x \, y \) = \( - y \, x + 2 \) \,
  wide \( F compose Phi_(1752 \, 3) \) \( x \, y \) = \( y - 1 \, x + 2 \) . $

Its requirement is again exactly ${ o \, \( - 1 \, 0 \) }$, while its $93$-cell reduced envelope satisfies

#[#set math.equation(numbering: n => "(26)")
 $ \( F compose Phi_(1752 \, 3) \) \( E_1752 \) ∩ { \( 1 \, 0 \) \, \( - 2 \, 0 \) } = diameter . $ <r25:avoidance2>]

Its pivot $\( - 1 \, 2 \)$ is free, and this child has height $15$.
  Equations (25)–(26) use the complete reconstructed envelopes,
  not just the new pivot or the required pair of Maker cells.

The two replies here are legal examples, not forced Breaker choices.
  For either example the indicated child is usable; the globally fixed first-surviving-child policy may select an
  earlier usable child in the same row. Other replies are covered by the full child list and Proposition 8.
  Neither the game nor this certificate restricts Maker’s holdings to a connected shape:
  these two attacks deliberately leave the initial horizontal pair.

== 8 The 35-move construction and its conditional interfaces <app:route35>

This appendix gives a separate construction from six immediate-completion cards and 610 further rows.
  Besides an ordinary 35-move strategy, it provides four conditional strategies with small required sets and
  specified regions in which Breaker may already have played.
  Those conditional conclusions concern arbitrary prior ownership,
  so they do not follow merely from a better bound for the empty board.
  We retain both the complete opening and the transfer, opposite-tip,
  and bent-shape continuations that explain how this certificate operates.

Throughout this appendix, $A_i^35 \, T_i^35 \, h_i^35$ denote the required set, envelope,
  and height of row $i$ of the #emph[35-move certificate]. These indices and the placement codes below are
  separate from those of the 21- and 25-move constructions.
  The meaning of a card is the arbitrary-ownership meaning of Section 2:
  at any Maker turn, finite disjoint sets $M \, B$ with $A_i^35 subset.eq M$ and $B ∩ T_i^35 =
  diameter$ permit a win within $h_i^35$ further actual Maker claims, unless a target is already complete.
  Additional ownership is allowed everywhere.

=== 8.1 The letter-and-offset certificate <r35:decoder>

Write the target points in the fixed order

$ s_0 = \( 0 \, 0 \) \, quad s_1 = \( 1 \, 0 \) \, quad s_2 = \( 2 \, 0 \) \, quad s_3 = \( 3 \, 0 \) \, quad
  s_4 = \( 3 \, 1 \) \, quad s_5 = \( 4 \, 1 \) \, wide o = \( 0 \, 0 \) . $

The six initial cards are

#[#set math.equation(numbering: n => "(27)")
 $ T_i^35 = S - s_i \, wide A_i^35 = T_i^35 \\ { o } \, wide h_i^35 = 1 quad \( 0 lt.eq i lt.eq 5 \) . $ <r35:bases>]

They are valid by immediate completion. If the missing point is already Maker-owned,
  the target has already been obtained.

For $i = 6 \, dots.h \, 615$, the literal row consists of $i$ followed by a nonempty list of placement terms.
  A term #raw("kLuv") contains an earlier decimal row index $k < i$, one letter $L$,
  and two individual decimal digits $u \, v$. Its placement is

#[#set math.equation(numbering: n => "(28)")
 $ F_(L u v) \( x \, y \) = R_L \( x \, y \) + \( u - 4 \, v - 4 \) \, $ <r35:placement>]

with the eight maps specified by

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[a
], table.cell(rowspan: 1, colspan: 1)[b
], table.cell(rowspan: 1, colspan: 1)[c
], table.cell(rowspan: 1, colspan: 1)[d
]),
  table.cell(rowspan: 1, colspan: 1)[$R_L \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( y \, x \)$
], table.cell(rowspan: 1, colspan: 1)[$\( x \, - y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - y \, x \)$
],
  table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[e
], table.cell(rowspan: 1, colspan: 1)[f
], table.cell(rowspan: 1, colspan: 1)[g
], table.cell(rowspan: 1, colspan: 1)[h
],
  table.cell(rowspan: 1, colspan: 1)[$R_L \( x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - x \, y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( y \, - x \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - x \, - y \)$
], table.cell(rowspan: 1, colspan: 1)[$\( - y \, - x \)$
],
)
]

Thus #raw("614b43") means $\( x \, y \) mapsto \( y \, x - 1 \)$, including its translation;
  it is not one of the decimal orientation codes used in the other two certificates.

If the terms of row $i$ are $\( k_j \, L_j u_j v_j \)$, put $C_j = F_(L_j u_j v_j) \( A_(k_j)^35 \)$ and $D_j =
  F_(L_j u_j v_j) \( T_(k_j)^35 \)$. Define

#[#set math.equation(numbering: n => "(29)")
 $ T_i^35 & = { o } union union.big_j D_j \,\
A_i^35 & = (union.big_j C_j med union med ⋂_j D_j) \\ { o } \,\
h_i^35 & = 1 + max_j h_(k_j)^35 . $ <r35:recursion>]

Lemma 3 and induction on $i$ prove every card defined in this way.
  The inductive argument is valid for every syntactically correct list of backward references;
  the particular list determines the useful required sets and envelopes.

For clarity, the complete finite substitution can be performed as follows. Initialize the six triples by (27).
  Read each remaining row in increasing order, reject an empty list or a reference outside $0 \, dots.h \, i - 1$,
  decode each affine map by (28), and apply it to both stored sets.
  Take the union and intersection in (29), store the resulting triple, and proceed to the next row.
  All coordinates are integers and all sets are finite. At the end of each iteration the stored triples are
  exactly the triples defined by the displayed equations, which is the loop invariant justifying the reconstruction.

The complete 610-row literal is printed in Appendix 12 and supplied as
  #raw("verification/supporting/prior-35/certificate.txt"); it has one row per line, including the final newline.
  The primary and two independent reconstructions are described in Appendix 13.
  They use, respectively, integer matrices and ordinary set operations, quarter turns and incidence masks,
  and signed coordinate lookups with cellwise membership tests.
  Thus no search procedure or undisclosed strategy tree is needed to recover the certificate.

=== 8.2 The first two compositions: five cells in a row <r35:elementary>

The first two nonbase rows are

$ mono("6 0a03") \, wide mono("7 4a34 6a54") . $

Set

$ L_(-) = { - 4 \, - 3 \, - 2 \, - 1 } times { - 1 } \, wide L_(+) = { - 3 \, - 2 \, - 1 \, 0 } times { - 1 } . $

Row 6 has

$ T_6^35 = S + \( - 4 \, - 1 \) = L_(-) union { \( - 1 \, 0 \) \, o } \, wide A_6^35 =
  L_(-) union { \( - 1 \, 0 \) } \, wide h_6^35 = 2 . $

The height is the recursively assigned upper bound: after claiming its pivot,
  Maker has in fact completed this target immediately.

The two placed children in row 7 have

#[#set math.equation(numbering: n => "(30)")
 $ upright("term") & upright("required set") & upright("envelope")\
mono("4a34") & L_(-) union { o } & L_(-) union { \( - 1 \, 0 \) \, o }\
mono("6a54") & L_(+) union { o } & L_(+) union { o \, \( 1 \, 0 \) } . $ <r35:elementary-children>]

Their common envelope is $\( { - 3 \, - 2 \, - 1 } times { - 1 } \) union { o }$,
  already contained in the union of their required sets. Consequently

$ A_7^35 = { - 4 \, - 3 \, - 2 \, - 1 \, 0 } times { - 1 } \, wide T_7^35 = A_7^35 union { \( - 1 \, 0 \) \,
  o \, \( 1 \, 0 \) } \, wide h_7^35 = 3 . $

After Maker owns the five lower cells and the pivot $o$, either $\( - 1 \, 0 \)$ or $\( 1 \, 0 \)$ completes one
  of the two displayed copies. Both lie in the parent envelope,
  so neither is occupied by an earlier Breaker stone. If neither target is already complete,
  Breaker can claim at most one of these two cells. This is the elementary double threat that the longer
  compositions reuse. Its direct two-claim bound is sharper than the stored height 3;
  the certificate deliberately uses the uniform recursion (29).

=== 8.3 Four conditional outputs <r35:outputs>

The following finite identities supply the opening. A set in the last column is wholly disjoint from the envelope;
  it is not asserted to be the entire complement of that envelope.

#thm([Proposition 10.])[
  #emph[The 35-move certificate has 616 cards, including its six base cards, and 1,837 placement terms.
    Every card satisfies $A_i^35 subset.neq T_i^35$, $o in T_i^35 \\ A_i^35$, and $h_i^35 lt.eq 34$.
    Four of its conditional interfaces are
#[#set math.equation(numbering: n => "(31)")
 $ i & A_i^35 & \| T_i^35 \| & h_i^35 & upright("region disjoint from ") T_i^35\
557 & { \( - 1 \, 0 \) } & 118 & 19 & { \( x \, y \) : x lt.eq - 3 \, med y lt.eq - 2 }\
595 & { \( - 1 \, 0 \) } & 222 & 27 & { \( x \, y \) : x = - 2 \, med y lt.eq - 2 }\
603 & { \( - 1 \, 0 \) } & 275 & 27 & { \( x \, y \) : x lt.eq - 3 \, med y = 0 }\
615 & { \( 1 \, 0 \) } & 686 & 34 & { \( 1 \, - 1 \) } . $ <r35:conditional-table>]

 Each row applies at any Maker turn with its required point owned and its entire envelope free of Breaker,
   regardless of all other ownership. For row 615 there is also a Breaker-turn conclusion:
   if Maker owns ${ o \, \( 1 \, 0 \) }$ and Breaker avoids $T_615^35$,
   then after any legal next reply Maker wins within 33 further claims, unless already victorious.]
] <r35:conditional>

#proof[
  The finite identities follow by the substitutions (27)–(29).
    The delivered reconstructions check every row index, every placement and backward reference,
    the full sets and heights, and the four outputs in (31). An omitted infinite region is checked by testing its
    defining predicate at #emph[every] point of the finite envelope.
    For example, the first check verifies $x > - 3$ or $y > - 2$ for every $\( x \, y \) in T_557^35$;
    this proves disjointness from the whole infinite region, without sampling it.
  For each composed card the reconstruction also verifies $C_j subset.eq A_i^35 union { o }$ and $D_j subset.eq
    T_i^35$. It checks each possibly legal local reply in $T_i^35 \\ \( A_i^35 union { o } \)$,
    and one extra class representing all cells outside $T_i^35$.
    There are 26,703 such classes in total over the 610 composed rows.
    In each class some child envelope is missed. The exterior class is exact because every child envelope is
    contained in the parent envelope. Extra Maker ownership can only remove legal reply cells,
    and earlier Breaker ownership is excluded by the envelope hypothesis.
    These checks establish the stated finite identities; the game-theoretic conclusion is the induction using
    Lemma 3, not an inference from the number of tests. Its Breaker-turn assertion gives the final claim,
    since $h_615^35 - 1 = 33$. ◻
]

=== 8.4 The complete ordinary opening <r35:opening>

#thm([Theorem 11.])[
  #emph[There is one ordinary Maker policy on the initially empty infinite square board that completes an allowed
    copy of $S$ within 35 actual Maker claims against every legal Breaker play.
    Equivalently, after extending a won position by fresh moves if necessary,
    its 35th Maker set contains a target whenever the first 34 Breaker replies are legal.
    No 35th Breaker reply is required.]
] <r35:theorem>

#proof[
  Maker first claims the actual origin. Write $q_(*) eq.not o$ for Breaker’s first cell, and let $0 lt.eq a lt.eq
    b$ be the sorted absolute values of its two coordinates. Since the cell differs from the origin, $b gt.eq 1$.
    We first handle all unbounded distant replies, and then the eight adjacent or diagonal replies.
  Suppose $b gt.eq 2$. In local coordinates put $p = \( - 1 \, 0 \)$, and choose
  #[#set math.equation(numbering: n => "(32)")
   $ \( i \, d \) =
     cases(delim: "{", \( 557 \, \( - a \, - b \) \) \, & a gt.eq 2 \,, \( 595 \, \( - 1 \, - b \) \) \, & a =
     1 \,, \( 603 \, \( - b \, 0 \) \) \, & a = 0 .) $ <r35:distant-choice>]
  In each case $d$ and $q_(*)$ have the same sorted absolute coordinates,
    so there is a signed permutation $R in cal(G)$ with $R d = q_(*)$. Use the affine map
  #[#set math.equation(numbering: n => "(33)")
   $ F \( z \) = R \( z - p \) . $ <r35:opening-map>]
  It sends the required cell $p$ to Maker’s first cell, and the local Breaker cell $p + d$ to $q_(*)$.
    In the three respective cases,
  $ p + d = \( - a - 1 \, - b \) \, wide \( - 2 \, - b \) \, wide \( - b - 1 \, 0 \) . $
  The first has $x lt.eq - 3 \, y lt.eq - 2$, the second has $x = - 2 \, y lt.eq - 2$,
    and the third has $x lt.eq - 3 \, y = 0$. Thus it lies in the corresponding omitted region in (31).
    At Maker’s second turn, $F \( A_i^35 \)$ is owned and $F \( T_i^35 \)$ contains no Breaker cell.
    The placed conditional card applies, giving totals at most $1 + 19 = 20$, $1 + 27 = 28$, and $1 + 27 = 28$,
    respectively. The argument used no upper bound on $a$ or $b$.
  It remains to treat $b = 1$. Put
  $ q = \( 1 \, - 1 \) \, wide P = { o \, \( 1 \, 0 \) } \, wide p =
    cases(delim: "{", \( 1 \, 0 \) \, & a = 0 \,, o \, & a = 1 .) $
  For the coordinate-adjacent reply, $q - p = \( 0 \, - 1 \)$; for the diagonal reply, $q - p = \( 1 \, - 1 \)$.
    In either case choose $R in cal(G)$ with $R \( q - p \) = q_(*)$, and again use (33).
    Then $F \( p \) = o$ and $F \( q \) = q_(*)$. Maker’s second move claims the other cell of $F \( P \)$.
    It is fresh: the two cells of $P$ differ, and $q in.not P$. Immediately after this move,
  $ M = F \( P \) = F \( A_615^35 union { o } \) \, wide B = { F \( q \) } \, wide B ∩ F \( T_615^35 \) = diameter . $
  The two Maker cells have been obtained with the actual first Breaker reply between them.
    In the adjacent case the local pivot $o$ was played second; in the diagonal case it was played first.
    This order does not matter to the state-based Breaker-turn assertion of Proposition 10.
  It is now Breaker’s second turn. Every legal reply misses at least one child envelope of the placed row 615,
    with that child’s required set already owned. The child wins within at most 33 further Maker claims.
    Thus the total in the near case is
  $ 2 + 33 = 35 . $
  Figure 5 records both possible orders of the domino.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, -1.2), (0, 0.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0.8, -1.2), (0.8, 0.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((-0.4, -0.8), (1.2, -0.8), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((-0.4, 0), (1.2, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  circle((0.8, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0.4), [$M_2$], anchor: "south", padding: 0.1176cm)
  content((0.8, 0.4), [$M_1$], anchor: "south", padding: 0.1176cm)
  content((0, 0), [$o$], anchor: "north-east", padding: 0.1176cm)
  line((0.696, -0.904), (0.904, -0.696), (0.696, -0.696), (0.904, -0.904), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((1.2, -0.8), [$B_1=q$], anchor: "west", padding: 0.1176cm)
  content((0.4, -1.6), [adjacent first reply])
  line((6, -1.2), (6, 0.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((6.8, -1.2), (6.8, 0.4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((5.6, -0.8), (7.2, -0.8), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((5.6, 0), (7.2, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((6, 0), radius: 0.07056, fill: black, stroke: none)
  circle((6.8, 0), radius: 0.07056, fill: black, stroke: none)
  content((6, 0.4), [$M_1$], anchor: "south", padding: 0.1176cm)
  content((6.8, 0.4), [$M_2$], anchor: "south", padding: 0.1176cm)
  content((6, 0), [$o$], anchor: "north-east", padding: 0.1176cm)
  line((6.696, -0.904), (6.904, -0.696), (6.696, -0.696), (6.904, -0.904), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((7.2, -0.8), [$B_1=q$], anchor: "west", padding: 0.1176cm)
  content((6.4, -1.6), [diagonal first reply])
})],
    caption: [Figure 5: Local coordinates immediately after Maker’s second claim and before Breaker’s second reply. Dots are Maker’s domino $P$, the cross is the existing Breaker cell $q$, and subscripts show the order of the actual moves. Row 615 controls the next reply in both cases. ],
  ) <r35:near-figure>
  Fix the choices before play: order the eight signed permutations and the terms in every row,
    and fix an enumeration of $bb(Z)^2$. Use the first admissible opening matrix and the first child envelope
    missed by the latest reply. Compose each child map with the current affine frame.
    If its pivot is already Maker-owned and no target is complete,
    claim the first genuinely free cell in the enumeration; that replacement and the following legal reply are
    charged in the height recursion. Every child has smaller index,
    so the recursion terminates within the stated height. On histories inconsistent with earlier prescriptions,
    use the first free cell. This gives one total fresh policy,
    with the same early-stopping and extension conventions as Section 4.
    An extended 35-claim play contains only 34 intervening Breaker replies, proving the precise endpoint. ◻
]

=== 8.5 Transferring a four-cell attack to a new pair <r35:transfer>

We now examine the longer tactics inside the certificate.
  They explain how a small required set can support a continuation even after several forced parries.
  The conditions always concern the entire envelope; the visible stones alone do not license a card.

Put $V = { - 1 } times { - 4 \, - 3 \, - 2 \, - 1 }$. The relevant literal rows and reconstructed outputs are

$ mono("588 3b33 586a45") \, wide mono("589 4b43 588a45") \, $

#[#set math.equation(numbering: n => "(34)")
 $ i & A_i^35 & \| T_i^35 \| & h_i^35\
586 & { \( 0 \, - 2 \) \, \( 0 \, - 1 \) } & 198 & 26\
588 & \( V \\ { \( - 1 \, - 1 \) } \) union { \( 0 \, - 1 \) } & 202 & 27\
589 & V & 204 & 28 . $ <r35:transfer-data>]

Their envelopes satisfy the more informative identities

#[#set math.equation(numbering: n => "(35)")
 $ T_588^35 & = \( T_586^35 + \( 0 \, 1 \) \) union V \,\
T_589^35 & = \( T_586^35 + \( 0 \, 2 \) \) union \( { - 1 } times { - 4 \, - 3 \, - 2 \, - 1 \, 0 } \) union
  { \( 0 \, - 1 \) } . $ <r35:transfer-envelopes>]

In particular, each smaller continuation envelope is contained in the envelope under which the tactic starts.

For an explicit description of these envelopes, Table 4 gives every vertical fiber of $T_586^35$.
  In this table $\[ a \, b \]_(bb(Z))$ means every integer from $a$ to $b$, and unlisted fibers are empty.
  Together with (35), it specifies all three complete envelopes, including cells far from the initial column.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, left, center, left, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$x$
], table.cell(rowspan: 1, colspan: 1)[${ y : \( x \, y \) in T_586^35 }$
], table.cell(rowspan: 1, colspan: 1)[$x$
], table.cell(rowspan: 1, colspan: 1)[${ y : \( x \, y \) in T_586^35 }$
], table.cell(rowspan: 1, colspan: 1)[$x$
], table.cell(rowspan: 1, colspan: 1)[${ y : \( x \, y \) in T_586^35 }$
]),
  table.cell(rowspan: 1, colspan: 1)[$- 7$
], table.cell(rowspan: 1, colspan: 1)[$\[ 3 \, 4 \]_(bb(Z)) union { 6 }$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$\[ - 2 \, 9 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[$\[ - 5 \, 5 \]_(bb(Z))$
],
  table.cell(rowspan: 1, colspan: 1)[$- 6$
], table.cell(rowspan: 1, colspan: 1)[${ 1 } union \[ 3 \, 6 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$\[ - 6 \, 9 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$\[ - 2 \, 4 \]_(bb(Z))$
],
  table.cell(rowspan: 1, colspan: 1)[$- 5$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 1 \, 9 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\[ - 7 \, 9 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$\[ - 2 \, 4 \]_(bb(Z))$
],
  table.cell(rowspan: 1, colspan: 1)[$- 4$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 1 \, 8 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\[ - 6 \, 9 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$\[ - 2 \, 0 \]_(bb(Z))$
],
  table.cell(rowspan: 1, colspan: 1)[$- 3$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 1 \, 11 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\[ - 7 \, 7 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[${ - 2 \, 0 }$
],
  table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 2 \, 10 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$\[ - 5 \, 6 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[$- 1$
], table.cell(rowspan: 1, colspan: 1)[$\[ - 1 \, 11 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$\[ - 5 \, 6 \]_(bb(Z))$
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[],
)
]],
  caption: [Table 9: The complete 198-cell envelope of row 586. The translated envelopes governing the two forced parries and the transferred pair follow from (35). ],
)

Suppose $V subset.eq M$ and $B ∩ T_589^35 = diameter$ at a Maker turn.
  Claim $o$ (or make the charged fresh replacement if it is already owned). The set

$ Q_1 = V union { o \, \( 0 \, - 1 \) } $

is the target in the placed base card #raw("4b43"). Its only possibly missing Maker cell is $\( 0 \, - 1 \)$.
  If this point is already owned, Maker has won. Otherwise it is free, because it lies in the parent envelope.
  A Breaker reply other than $\( 0 \, - 1 \)$ leaves that immediate completion available,
  so any defense avoiding this win must claim $\( 0 \, - 1 \)$.

The other child #raw("588a45") uses the map $z mapsto z + \( 0 \, 1 \)$. Its required set is

$ \( { - 1 } times { - 3 \, - 2 \, - 1 } \) union { o } \, $

which is contained in the Maker set. Its envelope $T_588^35 + \( 0 \, 1 \)$ is a subset of $T_589^35$ and omits
  $\( 0 \, - 1 \)$. All Breaker cells, including that first parry, therefore avoid it.
  Claim its pivot $\( 0 \, 1 \)$, with the same charged-replacement convention if necessary. Now

$ Q_2 = { \( - 1 \, - 3 \) \, \( - 1 \, - 2 \) \, \( - 1 \, - 1 \) \, \( - 1 \, 0 \) \, o \, \( 0 \, 1 \) } $

is complete except possibly at $\( - 1 \, 0 \)$. It is another allowed target:
  $Q_1 = R_b \( S \) + \( - 1 \, - 4 \)$ and $Q_2 = R_b \( S \) + \( - 1 \, - 3 \)$.
  Thus, unless Maker has already won or can complete $Q_2$ on the next move, Breaker must parry at $\( - 1 \, 0 \)$.

After these two parries, the continuation #raw("586a45") of the translated row 588 is row 586 translated by
  $\( 0 \, 2 \)$. Its required set is exactly ${ o \, \( 0 \, 1 \) }$, now owned. Its envelope

$ D = T_586^35 + \( 0 \, 2 \) $

lies in the original envelope and contains neither parry: $\( 0 \, - 1 \) in.not D$ and $\( - 1 \, 0 \) in.not D$.
  These omissions follow directly from the fibers $x = 0$ and $x = - 1$ in Table 4.
  The envelope of the preceding row-588 continuation likewise omits the first parry by (35).
  Row 586 therefore applies at the next Maker turn, with pivot $\( 0 \, 2 \)$ and bound 26.
  The two earlier claims and their forced replies have transferred the attack from the original column to a new
  vertical pair, at total cost at most $1 + 1 + 26 = 28$ Maker claims.

This argument preserves every earlier Breaker restriction:
  all earlier Breaker cells lie outside the original envelope and hence outside every continuation envelope.
  Extra Maker cells may complete a target early or occupy one of the prescribed pivots;
  in the latter case a genuinely fresh replacement uses the same charged turn.
  No assumption that the displayed stones are the only owned stones is needed.

=== 8.6 Opposite-tip continuations from four in a row <r35:opposite>

Row 612 consists exactly of

$ mono("612 589b55 589h03") . $

Writing

$ W = { - 3 \, - 2 \, - 1 \, 0 } times { 0 } \, wide G_(+) \( x \, y \) = \( y + 1 \, x + 1 \) \, quad
  G_(-) \( x \, y \) = \( - y - 4 \, - x - 1 \) \, $

the two placed requirements are both $W$, and their envelopes obey

#[#set math.equation(numbering: n => "(36)")
 $ G_(+) \( T_589^35 \) ∩ G_(-) \( T_589^35 \) = W . $ <r35:opposite-intersection>]

Consequently

$ A_612^35 = W \\ { o } \, wide T_612^35 = G_(+) \( T_589^35 \) union G_(-) \( T_589^35 \) \,
  wide \| T_612^35 \| = 404 \, quad h_612^35 = 29 . $

After Maker adds the pivot, $W$ is owned. A legal Breaker reply therefore cannot belong to both child envelopes;
  choose a child whose envelope it misses. All earlier Breaker cells avoid both envelopes by the parent
  hypothesis, and the full required column of the selected copy of row 589 is already owned.
  Its next pivot is either $\( 1 \, 1 \)$ or $\( - 4 \, - 1 \)$,
  so the two attacks leave from opposite ends of the four-cell row.
  The transferred pair in the selected frame is $G_(+) \( { o \, \( 0 \, 1 \) } \)$ or
  $G_(-) \( { o \, \( 0 \, 1 \) } \)$, respectively. Identity (36) is what ensures a safe continuation against
  every reply, including replies far from the displayed four stones.

The overlap identity can also be read directly from Table 4 and (35).
  The vertical supports of the two placed envelopes are $\[ - 6 \, 12 \]_(bb(Z))$ and $\[ - 12 \, 6 \]_(bb(Z))$,
  respectively. On their common possible levels $- 6 lt.eq y lt.eq 6$,
  the fibers have separated extrema for every $y eq.not 0$:
  the rightmost point of the $G_(-)$ fiber is strictly left of the leftmost point of the $G_(+)$ fiber.
  At $y = 0$, the $G_(+)$ fiber is $\[ - 3 \, 14 \]_(bb(Z))$ and the $G_(-)$ fiber is $\[ - 17 \, 0 \]_(bb(Z))$.
  Their overlap is $\[ - 3 \, 0 \]_(bb(Z))$. This gives exactly $W$, and also explains the envelope count $204 +
  204 - 4 = 404$.

=== 8.7 The exceptional bent-shape continuation <r35:exception>

The near opening reaches the local Breaker-turn position with $P =
  { o \, \( 1 \, 0 \) }$ owned and $q = \( 1 \, - 1 \)$ occupied by Breaker. Here the twelve child terms of row 615 are

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[#raw("602h64")
], table.cell(rowspan: 1, colspan: 1)[#raw("614b43")
], table.cell(rowspan: 1, colspan: 1)[#raw("533f64")
], table.cell(rowspan: 1, colspan: 1)[#raw("590h64")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("611g34")
], table.cell(rowspan: 1, colspan: 1)[#raw("587d34")
], table.cell(rowspan: 1, colspan: 1)[#raw("601f64")
], table.cell(rowspan: 1, colspan: 1)[#raw("406b64")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("591d34")
], table.cell(rowspan: 1, colspan: 1)[#raw("586d34")
], table.cell(rowspan: 1, colspan: 1)[#raw("584f64")
], table.cell(rowspan: 1, colspan: 1)[#raw("406d34").
],
)
]

For each term let $C_j \, D_j$ be its placed requirement and envelope.
  Every $C_j$ equals $P$, all $D_j$ avoid $q$, and their full intersection is $P$.
  On deleting the second term, the intersection becomes

#[#set math.equation(numbering: n => "(37)")
 $ ⋂_(j : thin upright("term")_j eq.not mono("614b43")) D_j =
   P union { \( - 1 \, 0 \) } . $ <r35:exception-intersection>]

The next pivots in these eleven children are end extensions $\( - 1 \, 0 \)$ or $\( 2 \, 0 \)$.
  Since Breaker cannot claim a point of $P$, one of them survives every next reply except $\( - 1 \, 0 \)$.
  Against that exceptional reply, the only surviving child is #raw("614b43"). Its map and pivot are

$ K \( x \, y \) = \( y \, x - 1 \) \, wide K \( o \) = \( 0 \, - 1 \) . $

The pivot is fresh in the near-opening position: it differs from both Maker points and both Breaker points
  $q \, \( - 1 \, 0 \)$.

More explicitly,

$ A_614^35 = { \( 1 \, 0 \) \, \( 1 \, 1 \) } \, wide K \( A_614^35 \) = P \, wide \| T_614^35 \| = 678 \, wide
  h_614^35 = 33 . $

The complete envelope $K \( T_614^35 \)$ lies in $T_615^35$ and avoids both existing Breaker cells.
  An exact expression for the difference is

#[#set math.equation(numbering: n => "(38)")
 $ T_615^35 \\ K \( T_614^35 \) = { & \( - 15 \, 0 \) \, \( - 15 \, 2 \) \, \( - 14 \, 0 \) \, \( - 14 \, 1 \) \,\
 & \( - 14 \, 2 \) \, \( - 13 \, - 4 \) \, \( - 13 \, 4 \) \, \( - 1 \, 0 \) } . $ <r35:exception-difference>]

Thus the exceptional reply is excluded by the #emph[full] continuation envelope,
  not merely by the three-cell configuration that Maker will obtain.

After Maker claims $\( 0 \, - 1 \)$, write $Q = P union { \( 0 \, - 1 \) }$.
  The seven children of row 614, composed with $K$, are listed in Table 5.
  In the table the term in the second column is expressed directly in the local coordinates of the near opening.
  For example, $K compose F_(b 75) \( x \, y \) = \( x + 1 \, y + 2 \) = F_(a 56) \( x \, y \)$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[K
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[]),
  table.cell(rowspan: 1, colspan: 1)[#raw("608b75")
], table.cell(rowspan: 1, colspan: 1)[#raw("608a56")
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[354
], table.cell(rowspan: 1, colspan: 1)[32
],
  table.cell(rowspan: 1, colspan: 1)[#raw("543d56")
], table.cell(rowspan: 1, colspan: 1)[#raw("543c64")
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[55
], table.cell(rowspan: 1, colspan: 1)[11
],
  table.cell(rowspan: 1, colspan: 1)[#raw("370g34")
], table.cell(rowspan: 1, colspan: 1)[#raw("370h42")
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, - 2 \)$
], table.cell(rowspan: 1, colspan: 1)[35
], table.cell(rowspan: 1, colspan: 1)[11
],
  table.cell(rowspan: 1, colspan: 1)[#raw("392h34")
], table.cell(rowspan: 1, colspan: 1)[#raw("392g42")
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, - 2 \)$
], table.cell(rowspan: 1, colspan: 1)[41
], table.cell(rowspan: 1, colspan: 1)[11
],
  table.cell(rowspan: 1, colspan: 1)[#raw("610d56")
], table.cell(rowspan: 1, colspan: 1)[#raw("610c64")
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[343
], table.cell(rowspan: 1, colspan: 1)[32
],
  table.cell(rowspan: 1, colspan: 1)[#raw("600a64")
], table.cell(rowspan: 1, colspan: 1)[#raw("600b45")
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[259
], table.cell(rowspan: 1, colspan: 1)[29
],
  table.cell(rowspan: 1, colspan: 1)[#raw("613a64")
], table.cell(rowspan: 1, colspan: 1)[#raw("613b45")
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[563
], table.cell(rowspan: 1, colspan: 1)[30.
],
)
]],
  caption: [Table 11: All seven continuations after the exceptional pivot. Every placed child requires exactly $Q = { o \, \( 1 \, 0 \) \, \( 0 \, - 1 \) }$. Several children have the same pivot but different complete envelopes. ],
)

Let $C'_j \, D'_j$ be the placed sets of these seven terms. Their reconstructed identities are

#[#set math.equation(numbering: n => "(39)")
 $ C'_j = Q quad upright("for every ") j \, wide ⋂_(j = 1)^7 D'_j = Q \, wide D'_j subset.eq K \( T_614^35 \) quad
   upright("for every ") j . $ <r35:exception-coverage>]

The last inclusion excludes both old Breaker stones from every child envelope.
  Any legal third Breaker reply lies outside $Q$, so the intersection identity supplies a child envelope it
  misses. Its required set is already owned, and its height is at most 32.
  The selected pivot belongs to that envelope and is outside $Q$;
  hence neither an old Breaker cell nor the new reply occupies it.
  It is therefore fresh in this exact opening position. The full conditional version permits extra Maker ownership
  and uses a charged replacement if that pivot was owned previously.

The four distinct possible pivots are $\( 0 \, 1 \) \, \( 0 \, - 2 \) \, \( 2 \, 0 \) \, \( 1 \, 2 \)$,
  as shown in Figure 6. They are alternatives selected #emph[after] the next Breaker reply,
  rather than a prescribed sequence of four Maker moves. The seven distinct envelopes in (39) determine which
  alternative is valid; the visible bent shape by itself does not justify any arbitrary choice.
  The bound after the exceptional second reply is $1 + 32 = 33$ further Maker claims,
  including the bent-shape pivot, which agrees with the $2 + 33 = 35$ opening calculation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.8, -2), (-0.8, 2), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2), (0, 2), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.8, -2), (0.8, 2), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.6, -2), (1.6, 2), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.2, -1.6), (2, -1.6), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.2, -0.8), (2, -0.8), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.2, 0), (2, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.2, 0.8), (2, 0.8), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-1.2, 1.6), (2, 1.6), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.07761, fill: black, stroke: none)
  circle((0.8, 0), radius: 0.07761, fill: black, stroke: none)
  circle((0, -0.8), radius: 0.07761, fill: black, stroke: none)
  line((0.696, -0.904), (0.904, -0.696), (0.696, -0.696), (0.904, -0.904), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-0.904, -0.104), (-0.696, 0.104), (-0.904, 0.104), (-0.696, -0.104), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.104, 0.696), (0.104, 0.904), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((-0.104, -1.704), (0.104, -1.496), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((1.496, -0.104), (1.704, 0.104), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((0.696, 1.496), (0.904, 1.704), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [$o$], anchor: "south-east", padding: 0.1176cm)
  content((2, 0), [$(2,0)$], anchor: "west", padding: 0.1176cm)
  content((-0.24, 0.8), [$(0,1)$], anchor: "east", padding: 0.1176cm)
  content((0.8, 2), [$(1,2)$], anchor: "south", padding: 0.1176cm)
  content((0, -2), [$(0,-2)$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 6: After the exceptional reply $\( - 1 \, 0 \)$ and Maker’s claim $\( 0 \, - 1 \)$, the filled dots form $Q$ and the crosses are the two Breaker cells. Hollow squares mark possible pivots after Breaker’s next reply. The diagram displays their geometry; their availability is determined by the seven envelopes specified by the terms in Table 5. ],
) <r35:bent-figure>

== 9 Exact scope of the finite reconstruction supplement <app:formal>

This appendix records the scope of the finite reconstruction supplement for the 35-move certificate.
  The conventional proofs in this article are independent of this supplement.

=== 9.1 The finite reconstruction theorem <rformal:evidence>

The finite reconstruction supplement linked from , relative to the article root,
  has the endpoint #raw("OAI.SnakyCertificate.certificate_correct").
  Its definitions fix the target, six ordered base points, eight letter-order orientations,
  offset-by-four translation digits, and full-envelope recurrence of Appendix 8.
  The formal envelope symbol $H$ denotes $T_i^35$ in that appendix. The theorem has seven clauses:

+ The table has exactly 610 nonbase rows, indexed $6$ through $615$,
  each with a nonempty list of allowed placements referencing earlier rows.
+ There are exactly 1,837 ordered placement terms, counted with multiplicity.
+ Row $557$ has required set ${ \( - 1 \, 0 \) }$, envelope size $118$, height $19$,
  and no envelope cell with $x lt.eq - 3$ and $y lt.eq - 2$.
+ Row $595$ has required set ${ \( - 1 \, 0 \) }$, envelope size $222$, height $27$,
  and no envelope cell with $x = - 2$ and $y lt.eq - 2$.
+ Row $603$ has required set ${ \( - 1 \, 0 \) }$, envelope size $275$, height $27$,
  and no envelope cell with $x lt.eq - 3$ and $y = 0$.
+ Row $615$ has required set ${ \( 1 \, 0 \) }$, envelope size $686$, height $34$,
  and omits $\( 1 \, - 1 \)$ from its envelope.
+ Every row $0$ through $615$ satisfies $A_i^35 subset.eq T_i^35$, $\( 0 \, 0 \) in T_i^35 \\ A_i^35$,
  and $h_i^35 lt.eq 34$.

The last clause makes the required-set containment proper.
  The literal entries in the Lean source agree with the printed letter-and-offset certificate.
  This is a finite reconstruction statement, not a game-winning theorem:
  it does not include the opening, the arbitrary-ownership and Breaker-turn interfaces, policy extraction,
  or the additional tactical conclusions of Appendix 8. The conventional arguments supply these game-theoretic
  implications.

The finite Python reconstructions described in this article are separate from Lean kernel checking;
  they do not themselves establish a Lean theorem or kernel compilation.
  The certificate copy under contains only the literal certificate data.

== 10 Complete certificate data <app:data>

The following listing contains every line of the certificate used in Proposition 5, without omissions.
  Cards $0 \, dots.h \, 5$ are the six bases (4); the listing starts at card $6$.
  The grammar and bit-coded placements are specified in Section 3. A long logical line may wrap visually.
  The editable file #raw("verification/certificate.txt") has one logical line per numbered card.
  Parentheses describe inline applications of exactly the same combination rule,
  with coordinates in the enclosing line’s frame.

#raw(block: true, lang: "", "")

== 11 Complete reduced-envelope certificate <app:data25>

This is the complete decimal certificate of Appendix 7. It begins at card $6$ and ends at card $2015$,
  after the six bases specified there. A marker beginning with #raw("#") states the next card number;
  it is not itself a card. Each other nonempty logical line is one composition.
  Every three-digit block, including its leading zeros, belongs to the decimal grammar.
  For readable line breaking, the displayed numeric rows have a bracketed card number and spaces between blocks.
  Remove that bracketed prefix and those spaces to recover each exact numeric line of the literal file;
  markers and blank lines are unchanged. This reversible formatting is checked in the source distribution.
  Long rows may wrap visually.

#raw(block: true, lang: "", "")

== 12 Complete letter-and-offset certificate <app:data35>

This listing supplies every row $6$ through $615$ of the $35$-move certificate.
  Appendix 8 defines the six base cards, every letter and translation offset, and the complete reconstruction.
  Each line starts with its row number, followed by a nonempty list of placed earlier cards.
  Long logical lines may wrap visually.

#raw(block: true, lang: "", "")

== 13 Complete executable verifier <app:checker>

The verifier below reads the literal certificate and evaluates the set operations described in the paper.
  From the paper root, run

#raw(block: true, lang: "", "python3 verification/verify_certificate.py")

An explicit input path may be supplied with #raw("--table").
  The wrapper rejects any data bytes with a different checksum and refuses optimized Python execution,
  which would disable the assertions in the checking function.
  Successful termination means that every executed check has passed;
  the semantic implication is the induction in Proposition 5 and Lemma 3.

The arrays #raw("AA"), #raw("TT"), and #raw("HH") hold the required sets, envelopes,
  and heights of completed numbered cards. The recursive function #raw("expr") evaluates an inline expression in
  the current line’s coordinate frame. A reference uses an earlier array entry;
  it never interprets an inline pivot as a translation. All computations use exact Python integers and finite sets.

#raw(block: true, lang: "Python", "")

=== 13.1 Independent reconstructions of all three certificates <independent-reconstructions-of-all-three-certificates>

The source distribution contains an additional, independently parsed reconstruction for every dialect,
  together with tests of the finite identities used in the article. From the paper root run

#raw(block: true, lang: "", "python3 verification/supporting/verify_all.py --output-dir ../all-checks")

Choose a new output directory outside the paper directory.
  The command runs the primary and independent checks for all three literal tables and records their full-card
  agreement, exact identities, and rejection tests. The support guide gives each program’s standalone command.
  The $21$-move programs under #raw("verification/supporting/route21/") additionally check every inline node and
  local reply class; they are distinct from the short verifier printed above.
  The $25$-move programs under #raw("verification/supporting/route25/") use the reduced sets and swap-first anchor
  maps. The programs under #raw("verification/supporting/route35/") check the letter-and-offset table and its
  conditional and tactical identities. All three literal tables and every checking program are included in the
  editable source distribution. The directory #raw("verification/supporting/prior-35/") contains only a copy of
  the $35$-move literal certificate. The scope of the finite reconstruction supplement is stated in Appendix 9.

#bibliography("refs.bib", style: "ieee", title: [References])
