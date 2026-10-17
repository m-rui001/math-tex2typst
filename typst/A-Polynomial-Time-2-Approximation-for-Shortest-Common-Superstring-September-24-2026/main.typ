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

#align(center)[#text(size: 16pt, weight: "bold")[A Polynomial-Time 2-Approximation for \
Shortest Common Superstring]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

In the #emph[shortest common superstring problem], the input is a finite collection $cal(S)$ of finite strings, and the task is to find a shortest string containing every member of $cal(S)$ as a contiguous substring. Write $"OPT" \( cal(S) \)$ for its minimum possible length. The strings are represented explicitly, with encoded symbol labels and string boundaries. Let $N$ be the total bit length of this representation and $L$ the sum of the string lengths measured in symbols. Each symbol and boundary occupies at least one bit, so $L \, \| cal(S) \| lt.eq N$; operations on symbol labels are charged for their encoded lengths.

#thm([Theorem 1.1.])[
  #emph[There is a deterministic algorithm, polynomial in the total encoded input size, that on every finite collection $cal(S)$ of explicitly represented ordinary strings outputs a common superstring $T$ satisfying 
$ \| T \| lt.eq 2 "OPT" \( cal(S) \) . $

]
] <thm:main>

===== 1.1 History and significance. <history-and-significance.>

Tarhio and Ukkonen proposed the factor-$2$ conjecture for the maximum-overlap Greedy procedure [11]. Blum, Jiang, Li, Tromp, and Yannakakis established a polynomial-time $3$-approximation [1]; Sweedyk later obtained a $5 \/ 2$ guarantee [10]. Subsequent guarantees include $2 + 11 \/ 23$ due to Mucha [8] and $\( 14 + sqrt(67) \) \/ 9 < 2.466$ due to Englert, Matsakis, and Veselý [4]. An August 2026 preprint of Chukhin, Kulikov, Mihajlin, and Smal reports a $7 \/ 3$-approximation [3]. 1 answers affirmatively the question of whether a polynomial-time factor-$2$ approximation exists.

Many earlier approximation algorithms use the distance graph on the input strings, whose edge costs are the lengths of prefixes left after maximum suffix–prefix overlap. A minimum-weight cycle cover gives a computable lower bound, but its cycles must then be opened and joined while controlling the extra length [1]. Breslauer, Jiang, and Jiang use rotations of periodic strings to control overlaps [2]; Mucha sharpens this analysis through lexicographically extremal primitive rotations [8]. These provide conceptual precedents for the periodic comparisons below; our lower bound and the graph to which we apply them are different.

Our graph representation comes from another formulation. Golovnev, Kulikov, and Mihajlin introduced a hierarchical graph in the bounded-length setting [7], and the Collapsing framework developed its all-substrings form [6]. In this graph, appending or deleting a letter gives an edge between substring vertices, and a superstring is represented by a closed walk visiting the required strings. The separation between a balanced graph and the operations that connect it also appears in the hierarchical cycle-cover discussion of that framework [6] revised version, Section 7.2. We use this representation to turn forced occurrence counts into a balanced graph and then connect it within the same cost bound.

The factor-$2$ question has also motivated conjectures about specific procedures. The classical Greedy conjecture concerns repeatedly merging a pair of maximum overlap, while the Collapsing conjecture concerns a prescribed normalization of doubled hierarchical-graph walks [6]. A September 2026 preprint of Shibata reports a counterexample to the Greedy conjecture, with worst-case ratio at least $9 \/ 4$ [9]. Our theorem concerns the algorithm proved here; neither of those prescribed procedures is assumed to attain factor $2$.

===== 1.2 Proof overview. <proof-overview.>

The vertices of our hierarchical graph are all substrings of the inputs, including the empty word. An up edge appends a letter and costs one; a down edge deletes the first letter and costs zero. A balanced multiset of edges has equal incoming and outgoing degree at each vertex. If its support is connected and visits the empty word and every required string, an Euler tour spells a common superstring whose length is its up-edge cost.

We first construct integer counts $m \( s \)$ no larger than the number of occurrences of $s$ in any common superstring. Their one-letter sum $W$ is therefore a lower bound on the optimum. Counts for longer words constrain those of their prefixes and suffixes. A further rule handles periodic words. Relative to a fixed periodic text, a bracketing word consists of a matching interval with a mismatching letter at each end. When the assigned count of a long word exceeds the contribution of its bracketing words, a prefix shorter by $k$ periods must have count at least $k + 1$ above its own bracketing contribution. The resulting counts determine a balanced, possibly disconnected graph of cost $W$.

Next decompose that graph into closed walks. The letters appended during a walk, repeated in both directions, form a periodic text; each visited vertex is a finite interval of that text. Walks with the same periodic text can be rearranged, preserving every edge, into ordered walks that each traverse one least period. We call these walks #emph[layers]. A layer of period $p$ has cost $p$ and receives a further budget $p$, so all additional budgets together equal $W$. In the remaining case of the connection procedure, the count rule forces a shorter word to occur on a layer with a different aligned text. A visited interval agreeing with both texts gives an actual graph vertex at which to attach a connection.

The final task is to arrange these connections without spending a budget twice. Some closed walks connect their source layers to a target using only the source budgets. Others require a contribution from the target, but these requests go only to a strictly larger period and are handled together when that period is processed. For each connection paid for only by its source layers, those layers can instead be joined internally while saving one period of budget. The remaining source-funded connections may form directed cycles. On each cycle, a maximal lexicographic rotation yields a contact word no longer than the target’s period. Omitting that target’s outgoing connection and joining its layers internally therefore pays for a round trip from the contact to the empty word. This connects the base graph at additional cost at most $W$ and completes the factor-$2$ bound.

===== 1.3 Organization. <organization.>

2 constructs the counts and their balanced graph. 3 develops the layer representation and the periodicity facts. 4 gives the connection operations, 5 processes groups of equal primitive text, and 6 resolves the remaining cycles. 7 proves polynomial time and extracts the output string.

== 2 Forced occurrence counts <sec:counts>

Delete the empty string, duplicates, and every input string contained in another input string. This preserves the set of common superstrings and its optimum. If nothing remains, output the empty string. Henceforth the remaining instance is nonempty. Let $Sigma$ be its alphabet and let $V$ be the set of its distinct substrings, including the empty word $epsilon$. Thus $V$ is closed under taking substrings, $\| \| V = O \( L^2 \)$, and every required string is maximal under extension in $V$.

For a finite string $s$, indices start at zero. Write $s \[ i : j \)$ for its substring on the indicated half-open interval. A #emph[periodic text] is a map $A : bb(Z) arrow.r Sigma$ with $A \( i + p \) = A \( i \)$ for some positive integer $p$. The period need not be least unless this is specified.

=== 2.1 Blocking an occurrence <blocking-an-occurrence>

Fix a text $A$ and a nonempty $s$ such that $A \[ 0 : \| \| s \) = s$. For $r in V$, let $b_(A \, s) \( r \)$ be the number of integers $j$ with

$ 1 lt.eq j \, #h(2em) j + \| \| s lt.eq \| \| r - 1 \, $

for which $r \[ j : j + \| \| s \) = s$ and

#[#set math.equation(numbering: n => "(2.1)")
 $ r \( h \) & = A \( h - j \) &  & \( 1 lt.eq h lt.eq \| \| r - 2 \) \,\
r \( 0 \) & eq.not A \( - j \) \, #h(2em) r \( \| \| r - 1 \) eq.not A \( \| \| r - 1 - j \) . $ <eq:block-interior>]

The word $r$ consists of a matching interval bracketed by one mismatching letter on each side of the specified $s$. Define the linear functional

#[#set math.equation(numbering: n => "(2.2)")
 $ B_A \( s \; m \) = sum_(r in V \\ { epsilon }) b_(A \, s) \( r \) m \( r \) . $ <eq:block-functional>]

Only words with $\| \| r gt.eq \| \| s + 2$ contribute.

If an occurrence of $s$ in a finite word $T$ is aligned with $A$, its nearest mismatch on each side, when both exist, determines a unique bracketing word $r$. Call the occurrence #emph[blocked] if this word belongs to $V$, and #emph[unblocked] otherwise. In particular, an occurrence with no mismatch on one side is unblocked. When $N_T \( r \)$ denotes the number of occurrences of $r$ in $T$, uniqueness of the nearest mismatches gives

#[#set math.equation(numbering: n => "(2.3)")
 $ B_A \( s \; N_T \) = \# { upright("blocked occurrences of ") s upright(" in ") T } lt.eq N_T \( s \) . $ <eq:block-count>]

The multiplicity in $b_(A \, s) \( r \)$ is necessary: a single occurrence of $r$ may bracket several distinct occurrences of $s$.

=== 2.2 The rules <the-rules>

Construct nonnegative integers $m \( s \)$ for $s in V \\ { epsilon }$ in decreasing order of length. Missing words have count zero. At each $s$, take the smallest integer satisfying

#[#set math.equation(numbering: n => "(2.4)")
 $ m \( s \) gt.eq sum_(c in Sigma) m \( c s \) \, #h(2em) m \( s \) gt.eq sum_(c in Sigma) m \( s c \) \, $ <eq:extension-rules>]

and $m \( s \) gt.eq 1$ if $s$ is required. Impose also the following rules for every period-$p$ text $A$, every $v = A \[ 0 : \| \| v \) in V$, and every nonempty prefix $w$ of $v$ with $\| \| v = \| \| w + k p$, $k gt.eq 1$:

#[#set math.equation(numbering: n => "(2.5)")
 $ m \( v \) > B_A \( v \; m \) quad arrow.r.double quad m \( w \) gt.eq B_A \( w \; m \) + k + 1 . $ <eq:period-rule>]

All quantities constraining $m \( w \)$ have already been determined: $v$ is longer than $w$, and every term of either blocking functional is longer than its inner word. Thus these are explicit lower bounds in a descending recursion.

The apparent range over periodic texts is finite for this purpose. In a rule, $p < \| \| v$, and $A$ is determined by the first $p$ letters of $v$. One may enumerate $v$, $p$, and $k$, check that repetition of the first $p$ letters agrees with $v$, and retain the admissible rules. This includes nonleast periods.

#thm([Lemma 2.1.])[
  (Occurrence lower bound).  #emph[For every common superstring $T$ and every nonempty $s in V$, 
$ m \( s \) lt.eq N_T \( s \) . $

 Consequently, for 
#[#set math.equation(numbering: n => "(2.6)")
 $ W = sum_(c in Sigma) m \( c \) \, $ <eq:W>]

 we have $W lt.eq "OPT" \( cal(S) \)$ and $m \( s \) lt.eq L$.]
] <lem:counts>

#proof[
  Fix $T$ and abbreviate $N_T$ to $N$. Induct on decreasing word length. The counts $N$ satisfy (2.4): occurrences with different preceding letters are disjoint, as are those with different following letters. They also satisfy the requirement for input strings.
  Consider a rule (2.5) constraining $m \( w \)$ whose trigger holds. If $N \( v \) > B_A \( v \; N \)$, choose an unblocked occurrence of $v$. It contains occurrences of $w$ at offsets $0 \, p \, dots.h \, k p$. Each is unblocked. Indeed, because $v$ matches $A$ and the offsets are multiples of $p$, a nearest mismatch bracketing one of these shorter occurrences must lie outside $v$. A blocking word in $V$ for it would therefore also block the chosen occurrence of $v$. The $k + 1$ shorter occurrences are distinct, so (2.3) and induction give
  $ N \( w \) gt.eq B_A \( w \; N \) + k + 1 gt.eq B_A \( w \; m \) + k + 1 . $
  In the other case, (2.3) implies
  $ B_A \( v \; N \) = N \( v \) gt.eq m \( v \) > B_A \( v \; m \) . $
  Every difference $N \( r \) - m \( r \)$ in this blocking sum is nonnegative by induction. Some contributing word $r$ therefore has $N \( r \) - m \( r \) gt.eq 1$. Choose one of its counted placements of $v$. The $k + 1$ period-spaced prefixes $w$ within that placement give distinct counted placements of $w$ in the same $r$. Hence $b_(A \, w) \( r \) gt.eq k + 1$. All other terms in the difference of blocking sums are nonnegative, and therefore
  $ N \( w \) gt.eq B_A \( w \; N \) gt.eq B_A \( w \; m \) + k + 1 . $
  Every lower bound used to define $m \( w \)$ is thus at most $N \( w \)$, completing the induction.
  For an optimal $T$, summing over one-letter words gives $W lt.eq \| \| T$. For a concatenation of the inputs, $N_T \( s \) lt.eq \| \| T lt.eq L$, giving the second assertion. ◻
]

=== 2.3 The balanced base graph <the-balanced-base-graph>

The #emph[hierarchical graph] on $V$ has, for each nonempty $s$, an up edge $"pref" \( s \) arrow.r s$ and a down edge $s arrow.r "suf" \( s \)$, where $"pref"$ deletes the last letter and $"suf"$ deletes the first. The up edge has cost one and the down edge cost zero. Golovnev, Kulikov, and Mihajlin introduced a hierarchical graph for bounded-length inputs [7]; the all-substrings form and these edge costs appear in the Collapsing framework [6] Section 2.2. We give every graph property needed here directly.

Give the two edges at $s$ multiplicities

#[#set math.equation(numbering: n => "(2.7)")
 $ u \( s \) = m \( s \) - sum_c m \( c s \) \, #h(2em) d \( s \) = m \( s \) - sum_c m \( s c \) \, $ <eq:base-multiplicities>]

respectively. Write $G$ for the resulting directed multigraph, omitting unused edges and vertices.

#thm([Lemma 2.2.])[
  #emph[The graph $G$ is balanced, contains every required string as a used vertex, and has $W$ up edges and $W$ down edges, counted with multiplicity.]
] <lem:base>

#proof[
  The multiplicities are nonnegative by (2.4). At a nonempty $s$, the incoming and outgoing degrees are, respectively,
  $ u \( s \) + sum_c d \( c s \) \, #h(2em) d \( s \) + sum_c u \( s c \) \, $
  and both simplify to $m \( s \) - sum_(c \, d) m \( c s d \)$. Balance at $epsilon$ follows by summing degrees over the other vertices. Telescoping (2.7) over all nonempty words gives $sum_s u \( s \) = sum_s d \( s \) = sum_c m \( c \) = W$. Finally, a remaining required string has no proper extension in $V$, so both its edge multiplicities equal its positive count. ◻
]

For example, suppose the only required word is $a^h$, with $h gt.eq 2$. The extension inequalities alone allow $m \( a^j \) = 1$ for $1 lt.eq j lt.eq h$. Their base graph is only the two-edge walk between $a^(h - 1)$ and $a^h$, with cost $1$. In the constant text $a$, every blocking functional is zero. Applying the period-one rule to $v = a^h$ and $w = a^j$ forces $m \( a^j \) gt.eq h - j + 1$ for $1 lt.eq j < h$; the terminal requirement gives the same bound for $j = h$. The occurrence lower bound gives equality. The resulting graph contains both directions of the entire path from $epsilon$ to $a^h$, and $W = h$. Thus the periodicity rules record the repeated letters that the extension inequalities alone miss.

We retain all base edges throughout. Adding closed walks preserves balance. To prove 1, it remains to connect every component of $G$ to $epsilon$ at additional up cost at most $W$.

== 3 Periodic layers <sec:layers>

Our goal is to replace the closed walks of the base graph by ordered layers without changing any edge. Their actual windows will later provide the occurrence records and same-text joins used to spend the second $W$ budget.

=== 3.1 Lifting closed walks to windows <lifting-closed-walks-to-windows>

Decompose the balanced base graph into nonempty closed walks. Every such walk has the same positive number of up and down steps: the word length changes by $+ 1$ or $- 1$ at each step and returns to its starting value. Read the letters appended on the up steps cyclically, and repeat this circular word in both directions to obtain a periodic text.

On the infinite repetition of the walk, represent a vertex by a window $\[ x \, e \)$ of this text. An up step increases $e$ by one; a down step increases $x$ by one. The window spells the vertex word. To verify this last assertion, follow the repeated walk sufficiently far back: its down steps eventually remove every letter previously present, so each current letter must have entered at one of the indicated up steps. A closed walk with $P$ up steps advances both coordinates by $P$.

An occurrence interval of a nonempty word $s$ is #emph[recorded] on the walk if some visited window contains it. Count occurrences modulo the walk’s turn length $P$, so each starting-position residue contributes at most once. Here the modulus is $P$, even if the text has a smaller least period.

#thm([Lemma 3.1.])[
  #emph[The total number of recorded occurrences of $s$ on all the closed walks is $m \( s \)$.]
] <lem:recorded>

#proof[
  At the unique up step reaching the right endpoint of a given occurrence, the current window contains the occurrence if and only if it is recorded. Indeed, subsequent left endpoints only increase, so a later containing window implies containment at that step as well. The up step generates a word ending in $s$. Summing its multiplicity over all such words gives
  $ sum_(r in V : med r upright(" ends in ") s) u \( r \) = m \( s \) $
  by telescoping over left extensions in (2.7). The argument is on the infinite lift and therefore also applies when $\| \| s$ exceeds a turn length. ◻
]

=== 3.2 Sorting primitive passages <sorting-primitive-passages>

Group the walks by their periodic texts up to integer translation, and align the texts within each group. Group membership is up to translation, while a later record compares a specified coordinate alignment of two layers; that alignment can differ even within one group. Write $p$ for the least positive period of a group. Every original turn length is a multiple of $p$: the shifts preserving a two-sided text form a subgroup of $bb(Z)$, generated by its least positive member.

#thm([Lemma 3.2.])[
  (Ordered layers).  #emph[The walks of a group can be rearranged, without changing the multiset of their graph edges, into one-turn layers of period $p$. Each layer has an integer function $z : bb(Z) arrow.r bb(Z)$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ z \( x - 1 \) lt.eq z \( x \) \, #h(2em) z \( x - 1 \) gt.eq x \, #h(2em) z \( x + p \) = z \( x \) + p . $ <eq:layer-properties>]

 At start coordinate $x$, its windows are exactly 
#[#set math.equation(numbering: n => "(3.2)")
 $ \[ x \, e \) \, #h(2em) z \( x - 1 \) lt.eq e lt.eq z \( x \) \; $ <eq:layer-vertical>]

 it then takes a down step to start $x + 1$. The functions of the layers in a group are pointwise ordered. Each layer has up cost $p$, and the sum of these costs over all groups is $W$.]
] <lem:layers>

#proof[
  For original walk $j$, let $P_j = d_j p$ be its turn length and let $Z_j \( x \)$ be its exit end at start $x$ on the infinite lift. Thus $Z_j \( x + P_j \) = Z_j \( x \) + P_j$. At each integer start $x$, collect the normalized exit ends
  $ cal(E)_x = { Z_j \( x + r p \) - r p : med j \, med 0 lt.eq r < d_j #scale(x: 120%, y: 120%)[}] \, $
  with multiplicity. These are the passages through the same start residue, translated to start $x$. Translation by $r p$ preserves their word labels. Sort $cal(E)_x$ increasingly and call its order statistics $z_1 \( x \) \, dots.h \, z_h \( x \)$, where $h = sum_j d_j$.
  The corresponding entering ends at $x$ form $cal(E)_(x - 1)$. Each original exit is at least its paired entry, so the increasing order statistics also satisfy $z_i \( x - 1 \) lt.eq z_i \( x \)$. Every entry is at least $x$. Moreover, increasing $x$ by $p$ permutes the passages from each original walk and adds $p$ to their ends. Thus $cal(E)_(x + p) = cal(E)_x + p$, proving all of (3.1).
  The multiset of down steps is fixed by the exit-end multisets. At a fixed $x$, the number of copies of a vertical unit edge with lower end $e$ is the number of entries at or below $e$ minus the number of exits at or below $e$. Thus the up-edge multiset is unchanged as well. The sorted passages therefore use exactly the original graph edges, with multiplicity, and in particular only actual base vertices. Each layer advances both coordinates by $p$ in one turn and has $p$ up steps. Their total up cost remains $W$. ◻
]

We henceforth use this fixed layer decomposition. A layer of period $p$ receives an additional #emph[budget] $p$. Budgets belong to layers even when several layers happen to share graph vertices.

For a layer $i$, write

#[#set math.equation(numbering: n => "(3.3)")
 $ f_i \( x \) = z_i \( x - 1 \) \, #h(2em) l_i \( x \) = z_i \( x \) $ <eq:first-last>]

for its first and last ends at start $x$. A higher layer has both functions at least those of a lower layer. When a collection of layers is under discussion, the subscripts $H$ and $L$ denote its highest and lowest layers; a scalar such as $H = f_H \( t \)$ denotes an end coordinate. 1 shows the first and last ends in start–end coordinates. Every actual window on a layer is a graph vertex in $V$; two windows that spell the same word are the same graph vertex, even when they have different coordinates.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 6.05), [#text(size: 9pt)[A window layer]], anchor: "west", padding: 0.1176cm)
  line((0, 0.75), (3.9, 0.75), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((3.9, 0.75), [#text(size: 9pt)[start $x$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.75), (0, 5.25), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((0, 5.25), [#text(size: 9pt)[end $e$]], anchor: "south", padding: 0.1176cm)
  line((0.55, 2), (1.6, 2), (1.6, 3.8), (3.1, 3.8), (3.1, 4.8), (3.75, 4.8), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  circle((1.6, 2), radius: 0.05644, fill: rgb("#595959"), stroke: none)
  circle((1.6, 3.8), radius: 0.05644, fill: rgb("#595959"), stroke: none)
  content((1.6, 2), [#text(size: 9pt)[$f_i(x)$]], anchor: "north-east", padding: 0.1058cm)
  content((1.6, 3.8), [#text(size: 9pt)[$l_i(x)$]], anchor: "south-east", padding: 0.1058cm)
  line((1.25, 2.55), (1.25, 3.3), stroke: (paint: rgb("#000073"), thickness: 1.35pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((1.25, 2.925), [#text(size: 9pt)[up]], anchor: "east", padding: 0.1058cm)
  line((1.95, 4.15), (2.8, 4.15), stroke: (paint: rgb("#000073"), thickness: 1.35pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((2.375, 4.15), [#text(size: 9pt)[down]], anchor: "south", padding: 0.07056cm)
  circle((1.6, 2.85), radius: 0.07056, fill: rgb("#000073"), stroke: none)
  content((1.6, 2.85), [#text(size: 9pt)[$[x,e)$]], anchor: "west", padding: 0.1764cm)
  line((1.6, 0.75), (1.6, 1.92), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  content((1.6, 0.75), [#text(size: 9pt)[$x$]], anchor: "north", padding: 0.1058cm)
  content((1.8, 0.2), [#text(size: 7pt)[$f_i(x)=z_i(x-1)$, $l_i(x)=z_i(x)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A layer in start–end coordinates. An up step appends a letter and increases the end; a down step deletes the first letter and increases the start. At start $x$, the layer visits every window $\[ x \, e \)$ between its first end $f_i \( x \)$ and its last end $l_i \( x \)$. ],
) <fig:layers>

=== 3.3 Unblocked occurrences on layers <unblocked-occurrences-on-layers>

Align a recorded occurrence of $s$ on a layer with a template $A$ containing $s$ at position zero. Call it blocked if the interval from the nearest left mismatch to the nearest right mismatch is itself recorded on that layer. Such a block automatically belongs to $V$, since it is a substring of a visited window.

#thm([Lemma 3.3.])[
  (Matching window).  #emph[Over all layers, the number of blocked occurrences of $s$ relative to $A$ is $B_A \( s \; m \)$. Every unblocked occurrence is contained in an actual layer window that agrees with $A$ throughout.]
] <lem:matching-window>

#proof[
  Each recorded occurrence of a word $r$ counted in (2.2), together with a counted placement of $s$ in it, gives a blocked occurrence. Conversely, the nearest mismatch pair uniquely determines $r$ and its placement. This correspondence commutes with translation by one layer turn, so it is a bijection also for the occurrences counted modulo that turn. 4 gives the asserted count. Sorting layers did not change that lemma, since it preserved all base edges.
  For the second assertion, write the selected occurrence as $\[ u \, v \)$. Its first containing window is reached by the up step with end $v$, so that window contains no right mismatch. If it has no left mismatch either, it suffices. Otherwise let $ell < u$ be the nearest left mismatch. Follow the layer until a down step removes $ell$; this happens while the windows still contain $\[ u \, v \)$, since their starts eventually reach $u$. No right mismatch can enter before that step: together with $ell$ it would make the nearest-mismatch bracket a recorded interval, contrary to the occurrence being unblocked. The down step introduces no new letter. Immediately afterward no mismatch remains on either side, and the resulting actual window agrees throughout with $A$. ◻
]

In particular,

#[#set math.equation(numbering: n => "(3.4)")
 $ m \( s \) - B_A \( s \; m \) $ <eq:unblocked-count>]

counts unblocked recorded occurrences. A layer whose entire text is the aligned template has no blocked occurrences relative to that template.

=== 3.4 Two periodicity facts <two-periodicity-facts>

Periodicity and extremal rotations also enter earlier superstring cycle-cover analyses [2,8]. We prove the exact agreement and maximal-rotation statements needed here. Use the total order on $Sigma$ induced by the encoded symbol labels. The lexicographic order of infinite forward words is determined by their first differing letter; equality means agreement at every nonnegative position. In a periodic group, a #emph[distinguished position] $t$ starts its lexicographically greatest forward rotation.

The agreement bound below uses only the weaker $p + q$ consequence of Fine–Wilf periodicity [5]; we retain its direct proof here.

#thm([Lemma 3.4.])[
  (Agreement bounds).  #emph[Two distinct aligned periodic texts of periods $p \, q$ agree on fewer than $p + q$ consecutive letters. If both have period $p$, they agree on fewer than $p$ consecutive letters.]
] <lem:agreement>

#proof[
  Suppose that a period-$p$ text and a period-$q$ text agree on an interval of length $p + q$. For a full set of $q$ consecutive residues, both positions $i$ and $i + p$ lie in that interval. Equality with the first text therefore makes the second invariant under shift by $p$ at those residues, and $q$-periodicity extends this invariance everywhere. Both texts now have period $p$, and agreement for $p$ consecutive letters makes them equal. The same final observation proves the equal-period bound. ◻
]

#thm([Lemma 3.5.])[
  (Maximal rotation).  #emph[Let $A$ have least period $p$, and let $t$ be distinguished. Let $D$ be a distinct aligned periodic text of period $q$, all of whose forward rotations are lexicographically at most the forward word of $A$ at $t$. Then $D$ and $A$ cannot agree on all $q$ positions starting at $t$.]
] <lem:max-rotation>

#proof[
  Set $t = 0$ by translating coordinates, and let $S$ be the forward word of $A$. It is at least its shift by $q$. If they are equal, $A$ has period $q$, and any period-$q$ text agreeing on the first $q$ letters is the identical aligned text.
  Otherwise let $j gt.eq 0$ be the first index at which $S \( j \) eq.not S \( j + q \)$. Maximality gives $S \( j \) > S \( j + q \)$. Let $U$ repeat the first $q$ letters of $S$. The equalities $S \( i \) = S \( i + q \)$ for $i < j$ imply that $U$ and $S$ agree before index $j + q$. At that index,
  $ U \( j + q \) = U \( j \) = S \( j \) > S \( j + q \) \, $
  so $U > S$. If $D$ agreed on the first $q$ letters, its forward word there would be $U$, contrary to the hypothesis on its rotations. ◻
]

== 4 Connection operations <sec:connections>

We now construct closed walks that touch existing layers at a cost charged to specified period budgets. We first give joins paid for entirely by the layers being attached, then an operation that also spends the receiving layer’s budget. Each cross-text contact uses an actual word common to the two alignments; the band operation below is restricted to layers of one primitive-text group.

A collection of layers and added walks is #emph[rooted] if its graph support is connected to $epsilon$. Connectivity is in the underlying undirected graph; every edge multiset we use is balanced. To #emph[touch] a layer means to share at least one of its graph vertices. Since all base edges remain, touching any vertex of a layer connects to every vertex of that layer.

=== 4.1 Following ordered windows <following-ordered-windows>

#thm([Lemma 4.1.])[
  (Ordered windows).  #emph[Let $\[ a \, b \)$ and $\[ c \, d \)$ be windows in a common text over $Sigma$, each spelling a word in $V$. If $a lt.eq c$ and $b lt.eq d$, there is a hierarchical-graph walk from the first word to the second of cost $d - b$. It visits a word of length at most $max \( 0 \, b - c \)$.]
  #emph[Consequently an ordered list of windows, with both starts and ends nondecreasing, can be followed at cost equal to the total increase in its ends. If its last window is a translate of the first by $h$ in a text of period dividing $h$, this is a closed walk of cost $h$.]
] <lem:ordered-windows>

#proof[
  If $c lt.eq b$, delete the first $c - a$ letters, reaching $\[ c \, b \)$, and append through $d$. The words on the down path are suffixes of the first word; those on the up path are prefixes of the second. All belong to $V$, and the up cost is $d - b$.
  If $c > b$, delete to the empty word. For each letter in the gap $\[ b \, c \)$, take an up step to that letter and a down step back to empty. Then build $\[ c \, d \)$. Single-letter words in the gap belong to $V$ because the text uses only $Sigma$. The cost is $\( c - b \) + \( d - c \) = d - b$. Concatenating these constructions proves the assertions about lists and translates. ◻
]

In particular, a round trip from a vertex $s$ to $epsilon$ and back costs $\| \| s$. Prescribed windows, rather than all intervals they sweep across, must belong to $V$; 9 supplies the intermediate vertices.

#thm([Lemma 4.2.])[
  (Joining an ordered band).  #emph[Consider $k$ ordered layers from one primitive-text group of period $p$. At a start $t$, let $H$ be the top layer’s first end and $E$ the bottom layer’s last end. If $h$ is a nonnegative multiple of $p$ and $H - E lt.eq h$, the layers can be joined together by a closed walk of cost at most $h$.]
] <lem:band>

#proof[
  If $E gt.eq H$, every layer contains $\[ t \, E \)$: its first end is at most $H$ and its last end is at least $E$. No added walk is needed. Otherwise grow at start $t$ from end $E$ to $H$. Every layer has a vertical range intersecting $\[ E \, H \]$, so the growth touches them all. The endpoints are actual bottom and top vertices, and every intermediate word is a prefix of the top vertex. Finish by following to $\[ t + h \, E + h \)$, which is a period translate of the starting window. Since $E + h gt.eq H$, 9 gives a closed walk of cost $h$. ◻
]

=== 4.2 A collective outgoing link <a-collective-outgoing-link>

We call a chosen actual layer window, together with an alignment to a specified periodic text agreeing throughout it, a #emph[record]. A record on a receiving layer provides a vertex at which to attach layers following the other text. An ordinary #emph[link] spends only the attached layers’ budgets. The following link attaches $k$ source layers at combined cost $k p$; it can therefore be planned without reserving any budget of the receiving layer. 2 illustrates its construction.

#thm([Lemma 4.3.])[
  (Collective link).  #emph[Consider $k$ ordered layers with a common period-$p$ text $A$, and put $K = k p$. Let $R = \[ a \, b \)$ spell a word in $V$ agreeing with $A$. Let $r_H = f_H \( a \)$ be the top layer’s first end and $r_L = l_L \( a \)$ the bottom layer’s last end. If 
#[#set math.equation(numbering: n => "(4.1)")
 $ r_H lt.eq b + K \, #h(2em) r_H - r_L lt.eq K \, #h(2em) r_L + K gt.eq b \, $ <eq:collective-conditions>]

 there is a cost-$K$ closed walk based at the word of $R$ that touches all $k$ layers.]
] <lem:collective>

#proof[
  Put $Y = max \( b \, r_H \)$. Then $b lt.eq Y lt.eq b + K$. For each constituent layer $i$,
  $ f_i \( a \) lt.eq Y lt.eq l_i \( a \) + K = l_i \( a + K \) . $
  Consequently its path meets height $Y$ at a start in $\[ a \, a + K \]$. More explicitly, choose the least such start $x_i$ with $z_i \( x_i \) gt.eq Y$. If $x_i = a$, then $z_i \( a - 1 \) = f_i \( a \) lt.eq Y$; otherwise minimality gives $z_i \( x_i - 1 \) < Y$. Thus $\[ x_i \, Y \)$ is an actual vertex. Pointwise layer order makes the $x_i$ nondecreasing when layers are taken from top to bottom. The list from $R$ through these vertices to $R + K$ has nondecreasing starts and ends, and it closes because $K$ is a multiple of $p$. Apply 9. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.48, 6.05), [#text(size: 9pt)[A collective link through ordered layers]], anchor: "west", padding: 0.1176cm)
  line((-0.48, 0.75), (6.432, 0.75), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((6.432, 0.75), [#text(size: 9pt)[start]], anchor: "west", padding: 0.1176cm)
  line((-0.48, 0.75), (-0.48, 5.425), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((-0.48, 5.425), [#text(size: 9pt)[end]], anchor: "south", padding: 0.1176cm)
  line((0, 0.75), (0, 3), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((5.76, 0.75), (5.76, 3), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  line((-0.48, 3), (0, 3), stroke: (paint: rgb("#bfbfbf"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dotted"))
  content((-0.48, 3), [#text(size: 9pt)[$Y=b$]], anchor: "east", padding: 0.1058cm)
  content((0, 0.75), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1058cm)
  content((5.76, 0.75), [#text(size: 9pt)[$a+K$]], anchor: "north", padding: 0.1058cm)
  line((-0.352, 2.5), (0, 2.5), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((0, 2.5), (0, 2.75), (0.64, 2.75), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((0.64, 2.75), (0.64, 3), (1.28, 3), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((1.28, 3), (1.28, 3.25), (1.92, 3.25), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((1.92, 3.25), (1.92, 3.5), (2.56, 3.5), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((2.56, 3.5), (2.56, 3.75), (3.2, 3.75), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((3.2, 3.75), (3.2, 4), (3.84, 4), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((3.84, 4), (3.84, 4.25), (4.48, 4.25), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((4.48, 4.25), (4.48, 4.5), (5.12, 4.5), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((5.12, 4.5), (5.12, 4.75), (5.76, 4.75), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((5.76, 4.75), (5.76, 5), (6.112, 5), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((-0.352, 1.75), (0, 1.75), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((0, 1.75), (0, 2), (0.64, 2), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((0.64, 2), (0.64, 2.25), (1.28, 2.25), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((1.28, 2.25), (1.28, 2.5), (1.92, 2.5), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((1.92, 2.5), (1.92, 2.75), (2.56, 2.75), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((2.56, 2.75), (2.56, 3), (3.2, 3), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((3.2, 3), (3.2, 3.25), (3.84, 3.25), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((3.84, 3.25), (3.84, 3.5), (4.48, 3.5), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((4.48, 3.5), (4.48, 3.75), (5.12, 3.75), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((5.12, 3.75), (5.12, 4), (5.76, 4), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((5.76, 4), (5.76, 4.25), (6.112, 4.25), stroke: (paint: rgb("#737373"), thickness: 0.65pt, miter-limit: 10))
  line((-0.352, 1), (0, 1), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((0, 1), (0, 1.25), (0.64, 1.25), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((0.64, 1.25), (0.64, 1.5), (1.28, 1.5), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((1.28, 1.5), (1.28, 1.75), (1.92, 1.75), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((1.92, 1.75), (1.92, 2), (2.56, 2), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((2.56, 2), (2.56, 2.25), (3.2, 2.25), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((3.2, 2.25), (3.2, 2.5), (3.84, 2.5), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((3.84, 2.5), (3.84, 2.75), (4.48, 2.75), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((4.48, 2.75), (4.48, 3), (5.12, 3), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((5.12, 3), (5.12, 3.25), (5.76, 3.25), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((5.76, 3.25), (5.76, 3.5), (6.112, 3.5), stroke: (paint: rgb("#999999"), thickness: 0.65pt, miter-limit: 10))
  line((0, 3), (5.76, 3), stroke: (paint: rgb("#000073"), thickness: 1.35pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((5.76, 3), (5.76, 5.25), stroke: (paint: rgb("#000073"), thickness: 1.35pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  circle((0.64, 3), radius: 0.07408, fill: rgb("#000073"), stroke: none)
  content((0.64, 3), [#text(size: 7pt)[top]], anchor: "south", padding: 0.1411cm)
  circle((2.56, 3), radius: 0.07408, fill: rgb("#000073"), stroke: none)
  content((2.56, 3), [#text(size: 7pt)[middle]], anchor: "south", padding: 0.1411cm)
  circle((4.48, 3), radius: 0.07408, fill: rgb("#000073"), stroke: none)
  content((4.48, 3), [#text(size: 7pt)[bottom]], anchor: "south", padding: 0.1411cm)
  circle((0, 3), radius: 0.08467, fill: rgb("#ffffff"), stroke: (paint: rgb("#000073"), thickness: 0.9pt, miter-limit: 10))
  content((0, 3), [#text(size: 9pt)[$R$]], anchor: "south-east", padding: 0.1411cm)
  circle((5.76, 5.25), radius: 0.08467, fill: rgb("#ffffff"), stroke: (paint: rgb("#000073"), thickness: 0.9pt, miter-limit: 10))
  content((5.76, 5.25), [#text(size: 9pt)[$R+K$]], anchor: "south-east", padding: 0.1411cm)
  line((6.464, 3), (6.464, 5.25), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#595959")), end: (symbol: ")>", fill: rgb("#595959"))))
  content((6.464, 4.125), [#text(size: 7pt)[$K$ up steps]], anchor: "west", padding: 0.1411cm)
  line((0, 0.1375), (5.76, 0.1375), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#595959")), end: (symbol: ")>", fill: rgb("#595959"))))
  content((2.88, 0.1375), [#text(size: 7pt)[$K="kp"$]], anchor: "south", padding: 0.1058cm)
})],
  caption: [Figure 2: A collective link in start–end coordinates. The common height $Y$ meets the ordered layers from top to bottom as the start increases. The endpoints $R$ and $R + K$ spell the same word in the source text, so the path closes at cost $K$. The illustration uses $Y = b$; the precise conditions are in 11. ],
) <fig:collective>

=== 4.3 Several requests at one host <several-requests-at-one-host>

A #emph[request] reserves a source layer’s budget for an operation at a receiving layer, called its #emph[host]. Unlike a link, this operation may also spend the host’s budget. It handles all requests at that host together and roots every participating layer. In 5, we will send requests only when the following hypotheses hold.

#thm([Lemma 4.4.])[
  (Host requests).  #emph[Let a host layer have period $q$. On that layer choose actual windows $R_i = \[ a_i \, b_i \)$, indexed by a nonempty collection of distinct child groups. The text of child group $i$ has period $p_i$, is different up to translation from the host’s text and from every other child group’s text, and agrees with the host throughout $R_i$ in the chosen alignment.]
  #emph[For each $i$, one or more child layers request a connection at this same record. Each has a specified actual window $\[ a_i \, e \)$ satisfying 
#[#set math.equation(numbering: n => "(4.2)")
 $ a_i + p_i < e lt.eq b_i - p_i . $ <eq:request-condition>]

 Its period-$p_i$ budget is reserved for the request. If the host’s period-$q$ budget is also available, the host and all requesting layers can be rooted using at most these budgets.]
] <lem:host>

#proof[
  We will spend the host budget on one closed excursion through contact words for the requesting layers. Requesters from all but one child group attach to those contacts using their own budgets. The requesters from the remaining group are touched directly by the host excursion, leaving one of their budgets to connect a contact shorter than their period to $epsilon$.
  By 7,
  #[#set math.equation(numbering: n => "(4.3)")
   $ b_i - a_i < p_i + q . $ <eq:host-length>]
  If record $i$ is before record $l$ along a lift of the host path, their starts and ends are ordered. When $b_i > a_l$, their overlap is an agreement interval between two distinct child texts, so
  #[#set math.equation(numbering: n => "(4.4)")
   $ b_i - a_l < p_i + p_l . $ <eq:child-overlap>]
  If there is no overlap, the same strict inequality is immediate.
  Choose an index $j$ of minimum $p_j$. Start at its record and order all other records before the next copy of it, translating coordinates by multiples of $q$ as needed. A shift by $delta in q bb(Z)$ also transports that record’s entire child coordinate system: replace its text by $A'_i \( x \) = A_i \( x - delta \)$, its layer functions by $z'_i \( x \) = z_i \( x - delta \) + delta$, and its requester ends by $e + delta$. This preserves all graph words, child periods, and budgets; the host text is unchanged because it is $q$-periodic. The same convention applies to the next copy of record $j$ when comparing overlaps. Put $T = a_j + q$. The order gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ a_j lt.eq a_i lt.eq T \, #h(2em) b_j lt.eq b_i lt.eq b_j + q . $ <eq:host-order>]
  To construct the host excursion, first visit all specified windows of the requesters at $j$ at start $a_j$, in increasing order of their ends $e$, and then visit $R_j$. For each later record $i$, the raw contact $\[ a_i + p_i \, e \)$ is obtained by deleting the first $p_i$ letters of the requester window and lies inside $R_i$. To place these contacts after $R_j$ and before the return at start $T$, we must keep their ends at least $b_j$ and their starts at most $T$. Accordingly, replace the raw contact by
  #[#set math.equation(numbering: n => "(4.6)")
   $ Q_(i \, e) = \[ s_i \, h_(i \, e) \) = \[ min \( a_i + p_i \, T \) \, max \( e \, b_j \) \) . $ <eq:host-target>]
  Visit these targets in record order and, within each record, in increasing order of $e$. Finally return to the first requester window translated by $q$.
  For earlier $i$ and later $l$, (4.2) and (4.4) give
  $ a_i + p_i < e_i lt.eq b_i - p_i < a_l + p_l < e_l . $
  Thus the raw targets have ordered starts and ends. The monotone operations in (4.6) preserve this order. By (4.5), each modified target remains inside its record $R_i$, and it is nonempty because $s_i lt.eq a_i + p_i < e lt.eq h_(i \, e)$. It therefore spells a word in $V$ and matches child text $i$.
  Applying (4.4) to $i$ and the next occurrence of $j$ gives
  $ b_i - T < p_i + p_j . $
  Together with (4.3), this implies
  #[#set math.equation(numbering: n => "(4.7)")
   $ e lt.eq b_i - p_i < T + p_j \, #h(2em) b_j < T + p_j \, #h(2em) h_(i \, e) < T + p_j . $ <eq:host-short-end>]
  If $e_0$ is the first requester end at $j$, then $e_0 > a_j + p_j$, so the final translated window $\[ T \, e_0 + q \)$ has end greater than $T + p_j$. The whole list is therefore ordered. Its closed excursion costs $q$ by 9. On its final transition it reaches a vertex of length less than $p_j$. If there are no later records, the same conclusion follows using $b_j < T + p_j$.
  It remains to attach the other requesters and root the piece. For a requester at $i eq.not j$, the target satisfies
  #[#set math.equation(numbering: n => "(4.8)")
   $ a_i lt.eq s_i lt.eq a_i + p_i \, #h(2em) e lt.eq h_(i \, e) lt.eq e + p_i . $ <eq:target-child-range>]
  Only the upper end bound needs an additional check. Here the choice of a minimum period $p_j$ is used: if $h_(i \, e) = b_j$, then
  $ b_j < a_i + p_j + p_i lt.eq a_i + 2 p_i < e + p_i . $
  In child text $i$, follow the ordered list
  $ Q_(i \, e) \, quad \[ a_i + p_i \, e + p_i \) \, quad Q_(i \, e) + p_i . $
  The middle word is a period translate of the actual requester vertex; the last word equals the first. The inequalities (4.8) make the list ordered. Its cost-$p_i$ loop attaches this requester at the target. Do this separately for all requesters with $i eq.not j$.
  The requesters at $j$ were already touched in the initial vertical part, so their budgets have not been spent. Use one of their budgets $p_j$ to connect the short contact from (4.7) to $epsilon$. The host is touched at $R_j$, all requesters are attached, and the expenditure is at most the host budget plus all requester budgets. ◻
]

== 5 Processing the period groups <sec:processing>

We now give the connection procedure. Process the primitive-text groups in increasing order of least period, breaking ties by the lexicographically least rotation of their primitive texts. Requests reserve budgets and are fulfilled when their host group is processed. Ordinary links are planned now and finalized in 6. Every record and every layer in these plans refers to the fixed base decomposition from 5. For bookkeeping, mark a layer rooted when a stated operation explicitly roots it. Incidental connections to $epsilon$ do not change these marks or budget assignments.

=== 5.1 Incoming requests and a baseline <incoming-requests-and-a-baseline>

At entry to a group of period $p$, fulfill all requests received by each recipient layer in one application of 12. We will prove below that every requester has smaller period, and that a child group sends requests using only one record on one recipient layer. These are precisely the facts needed to apply that lemma with fresh recipient budgets.

Every recipient has an actual vertex of length less than $2 p$: its record with a child of period $r < p$ has length less than $p + r$ by 7. If there are recipients, choose their highest layer as a #emph[baseline]. They and their requesters have already been rooted.

Each remaining layer below the baseline can be rooted with its own budget $p$. If it has a vertex of length at most $p$, take a round trip through $epsilon$. Otherwise choose a baseline vertex $S = \[ a \, h \)$ of length less than $2 p$. A lower layer has a vertex $\[ a \, e \)$ with

$ p < e - a lt.eq h - a < 2 p . $

For example, take $e = min \( l_i \( a \) \, h \)$; pointwise ordering ensures this lies in its vertical range. The windows

$ \[ a \, h \) \, #h(2em) \[ a + p \, e + p \) \, #h(2em) \[ a + p \, h + p \) $

are ordered because $h < a + 2 p < e + p$. Their cost-$p$ closed walk touches the lower layer and the rooted baseline. Recipient layers themselves need no further budget.

Let $n$ be the number of layers above the baseline, or the entire number in the group when there is no baseline. Their budgets are all still available. If $n = 0$, proceed to the next group.

=== 5.2 Easy connections for the upper layers <easy-connections-for-the-upper-layers>

Use a distinguished position $t$ of the group’s text $A$, and put

$ H = f_H \( t \) \, $

the top layer’s first end at that start. If $H - t lt.eq n p$, a round trip from $epsilon$ through $\[ t \, H \)$ costs at most $n p$. Its up path touches every upper layer, since every such layer has first end at most $H$. This roots them all.

If a baseline exists and its last end $E$ at $t$ satisfies $E gt.eq H - n p$, 10, including the baseline as the bottom layer and taking $h = n p$, joins it to all upper layers within their combined budget. This also roots them all.

It remains to handle the case

#[#set math.equation(numbering: n => "(5.1)")
 $ H > t + n p \, #h(2em) l_(upright("base")) \( t \) < H - n p quad upright("when a baseline exists") . $ <eq:hard-case>]

=== 5.3 Forcing a record on another aligned text <forcing-a-record-on-another-aligned-text>

The count rule will supply $k + 1$ unblocked occurrences of a word obtained by shortening the top vertex by $k p$. We choose $k$ so that at most $k$ of those occurrences can have the present full-text alignment. The same choice must keep the top $k$ layers close enough to join for at most $\( k - 1 \) p$, leaving one period of their combined budget available. The following threshold search gives both properties.

Starting at $k = 1$, increase $k$ while the number of layers of this group satisfying

$ l_i \( t \) gt.eq H - k p $

exceeds $k$. Stop at the first failure of this test and set $K = k p$.

#thm([Lemma 5.1.])[
  #emph[This procedure stops with $1 lt.eq k lt.eq n$. If $L_(*)$ is the lowest of the top $k$ layers, then 
#[#set math.equation(numbering: n => "(5.2)")
 $ l_(L_(*)) \( t \) & gt.eq H - \( k - 1 \) p \,\
f_H \( x \) - l_(L_(*)) \( x \) & lt.eq K #h(2em) \( x in bb(Z) \) . $ <eq:sharp-band>]

 At most $k$ recorded occurrences of $w = A \[ t : H - K \)$ have a full-text alignment identical to $A$.]
] <lem:choose-k>

#proof[
  For $k lt.eq n$, layers at or below the baseline do not qualify, by (5.1). Thus the process stops by $n$. If $k = 1$, the top last end is at least its first end $H$. If $k > 1$, reaching $k$ means that at least $k$ layers qualified at the previous threshold $H - \( k - 1 \) p$. Pointwise ordering gives (5.2).
  For any $x$, choose its translate $x'$ modulo $p$ in $\( t - p \, t \]$. Then
  $ f_H \( x' \) lt.eq H \, #h(2em) l_(L_(*)) \( x' \) gt.eq l_(L_(*)) \( t \) - p . $
  Their difference is invariant under period translation, proving (5.2).
  By (5.1), $H - K > t$, so $w$ is nonempty. Each primitive layer has exactly one position residue whose full-text alignment agrees with $A$: the shifts preserving its text are exactly the multiples of $p$. At that alignment, $w$ is recorded exactly when $l_i \( t \) gt.eq H - K$. At most $k$ layers satisfy this inequality when the test stops. Other primitive-text groups have no identical full-text alignment. ◻
]

Apply the count rule (2.5), with origin shifted to $t$, to the actual vertex word

$ v = A \[ t : H \) \, #h(2em) w = A \[ t : H - K \) . $

The top layer records an unblocked occurrence of $v$ in its own text. By (3.4), the trigger holds, and the rule gives at least $k + 1$ unblocked occurrences of $w$. 13 leaves at least one on a layer $D$ whose aligned text differs from $A$. A different phase of this same group is allowed.

Choose one such occurrence. 6 gives an actual window $R = \[ a \, b \)$ on $D$, agreeing with $A$ throughout and containing the specified interval $\[ t \, H - K \)$. Let $q$ be the least period of $D$. Thus

#[#set math.equation(numbering: n => "(5.3)")
 $ a lt.eq t \, #h(2em) b gt.eq H - K \, #h(2em) b - a < p + q . $ <eq:chosen-record>]

If $D$ belongs to this same primitive-text group, then

#[#set math.equation(numbering: n => "(5.4)")
 $ b - a < p . $ <eq:same-group-record>]

The strict length bounds follow from 7. Use this #emph[one] chosen record for every subsequent connection from this processed group.

=== 5.4 Distributing the remaining budgets <distributing-the-remaining-budgets>

At start $a$, put $r_H = f_H \( a \)$ and $r_L = l_(L_(*)) \( a \)$. Monotonicity, (5.2), and (5.3) give

#[#set math.equation(numbering: n => "(5.5)")
 $ r_H - r_L lt.eq K \, #h(2em) r_H lt.eq H lt.eq b + K . $ <eq:block-preconditions>]

===== 5.4.1 The collective case. <the-collective-case.>

If $r_L + K gt.eq b$, make the top $k$ layers one #emph[collective block]. Plan the link in 11 from these layers to $D$ at $R$, reserving their combined budget $K$. Here a collective block is allowed to have $k = 1$; its plan is still the collective construction. If the test fails, do not make the block. In that event,

#[#set math.equation(numbering: n => "(5.6)")
 $ r_H lt.eq r_L + K < b . $ <eq:failed-collective>]

===== 5.4.2 The individual cases. <the-individual-cases.>

Handle every upper layer not placed in that collective block separately. Its first end at $a$ is at most $b$. When the collective test failed, this follows from (5.6); a layer below the top $k$ has

$ f_i \( a \) lt.eq l_i \( t \) < H - K lt.eq b $

by the stopping rule and $a lt.eq t$.

For such a layer, do exactly one of the following.

+ If some vertex has length at most $p$, root the layer by a round trip through $epsilon$ using at most its budget.
+ If all its vertex lengths exceed $p$ and
  #[#set math.equation(numbering: n => "(5.7)")
   $ l_i \( a \) + p gt.eq b \, $ <eq:single-test>]
  make it an #emph[individual block] with a planned link to $D$ at $R$. At start $a + p$, its vertical range intersects $\[ b \, b + p \]$, since
  $ f_i \( a + p \) = f_i \( a \) + p lt.eq b + p \, #h(2em) l_i \( a + p \) = l_i \( a \) + p gt.eq b . $
  Choose an actual end $e' in \[ b \, b + p \]$ there and follow
  #[#set math.equation(numbering: n => "(5.8)")
   $ \[ a \, b \) \, #h(2em) \[ a + p \, e' \) \, #h(2em) \[ a + p \, b + p \) . $ <eq:individual-list>]
  This is a cost-$p$ closed walk in $A$ touching the layer. Its incoming transition to start $a + p$ reaches a word of length at most
  #[#set math.equation(numbering: n => "(5.9)")
   $ max \( 0 \, b - a - p \) lt.eq q \, $ <eq:single-short>]
  by (5.3) and 9. Reserve this layer’s budget for that link.
+ Otherwise reserve the layer’s budget $p$ and send a request to $D$ at the same record $R$. Its first end $e = f_i \( a \)$ satisfies
  #[#set math.equation(numbering: n => "(5.10)")
   $ a + p < e lt.eq l_i \( a \) < b - p . $ <eq:outgoing-request>]
  This is the condition of 12. In particular $b - a > 2 p$; combining this with $b - a < p + q$ gives $q > p$. The recipient group will therefore be processed later.

This verifies the promised hypotheses for incoming requests. They always go to strictly larger periods, and a child group uses just one record on one recipient layer, even if several of its layers request there. Ordinary planned links consume no recipient budget. When a recipient is processed, its own budget and all reserved requester budgets are available. After 12 is applied, those layers are rooted and do not enter any outgoing block.

#thm([Proposition 5.2.])[
  #emph[After all groups have been processed, every layer is either marked rooted or belongs to exactly one outgoing block. These two classes are disjoint. Each block consists of layers from one primitive-text group and targets a single actual layer. Its total budget remains reserved for its planned link. A collective block of $k$ layers and period $p$ also satisfies (5.2) at its distinguished position; an individual block consists of one layer.]
] <prop:partition>

#proof[
  Incoming requests use disjoint requester budgets, and each recipient budget is spent only when its group is processed. The baseline step uses only budgets of remaining lower layers. The easy upper-layer branches use at most the combined budgets of the upper layers and finish them. In the remaining branch, the collective case and the individual cases partition those upper layers. Each request is eventually fulfilled, because its recipient is processed later. The layers not marked rooted by a direct operation or a fulfilled request are precisely the outgoing blocks. Their links have only been planned, so their budgets are unspent. The asserted inequality for collective blocks is (5.2). ◻
]

== 6 Opening cycles of planned links <sec:cycles>

It remains to execute the plans in 14. Regard a block as one node and map its target layer to the block containing that layer, or to a rooted sink if the target is marked rooted. Each nonsink node has exactly one outgoing edge. A component therefore reaches a rooted sink or contains one directed cycle. Additional graph intersections between layers can only help; the following argument does not need them to be recorded by this bookkeeping graph.

#thm([Lemma 6.1.])[
  (One free period).  #emph[A block of $k$ layers and period $p$ can be joined internally, in place of its outgoing link, for cost at most $\( k - 1 \) p$. Thus this replacement leaves at least $p$ of its total budget available.]
] <lem:free-period>

#proof[
  For an individual block, or any block with $k = 1$, no internal addition is needed. For a collective block, (5.2) gives
  $ f_H \( t \) - l_(L_(*)) \( t \) lt.eq \( k - 1 \) p . $
  Apply 10 with $h = \( k - 1 \) p$. ◻
]

#thm([Lemma 6.2.])[
  (A short contact on a maximal link).  #emph[On a directed cycle of blocks, choose a block whose group’s distinguished forward rotation is lexicographically greatest. If its target layer has period $q$, its planned outgoing link can be realized within its reserved budget so that the resulting connected piece contains a vertex of length at most $q$.]
] <lem:cycle-contact>

#proof[
  If the plan is an individual link, (5.9) already gives the contact. For a collective plan with $k$ source layers of period $p$, put $K = k p$. Recall that $t$ is distinguished, $H = f_H \( t \)$, and the target record $R = \[ a \, b \)$ agrees with the source text and satisfies
  $ a lt.eq t < H - K lt.eq b \, #h(2em) b - a < p + q . $
  If any constituent layer already contains a vertex of length at most $q$, the ordinary collective link connects that vertex to the target and to all other constituents, so it suffices.
  Otherwise every vertex on every constituent layer has length greater than $q$. Every forward rotation of the target’s text is at most its own distinguished rotation, and hence at most the selected block’s distinguished rotation. The target alignment is different from the source alignment by construction. If $b - t gt.eq q$, agreement on $R$ would include all $q$ positions starting at $t$, contrary to 8. Thus
  #[#set math.equation(numbering: n => "(6.1)")
   $ b - t < q . $ <eq:cycle-agreement>]
  Put $x = min \( t \, a + K \)$. We have $a lt.eq x lt.eq a + K$ and $x lt.eq t < b$. If $x = t$, (6.1) gives $b - x < q$. If $x = a + K < t$, then
  $ b - x = b - a - K < p + q - K lt.eq q . $
  Thus $\[ x \, b \)$ is a suffix of $R$ of length less than $q$.
  At start $x$, every constituent layer’s first end exceeds $b$, because its corresponding word has length greater than $q > b - x$. These first ends are all at most $H$: they are no greater than the top first end at $x$, which is at most its first end at $t$. Let $F = f_H \( x \)$. Then $b < F lt.eq H lt.eq b + K$. Descend from $R$ to $\[ x \, b \)$ and grow at start $x$ to $\[ x \, F \)$. This growth touches every constituent at its first end, and all intermediate words are prefixes of the actual top-layer vertex. Finish at $R + K$.
  In summary, the prescribed list is
  #[#set math.equation(numbering: n => "(6.2)")
   $ \[ a \, b \) \, #h(2em) \[ x \, b \) \, #h(2em) \[ x \, F \) \, #h(2em) \[ a + K \, b + K \) . $ <eq:cycle-list>]
  Its starts and ends are nondecreasing. Every prescribed word is in $V$, and the last equals the first in the period-$p$ source text. 9 makes it a cost-$K$ closed walk, with the short contact $\[ x \, b \)$. ◻
]

#thm([Theorem 6.3.])[
  (Connecting the base graph).  #emph[The base graph can be connected to $epsilon$ by adding closed walks of total up cost at most $W$.]
] <thm:connection>

#proof[
  Use the group procedure of 5. Its fulfilled requests and direct connections have already rooted the layers outside outgoing blocks within their assigned budgets. Consider the remaining functional graph.
  For a cycle consisting of one block, its target layer belongs to the same block, hence to the same primitive-text group. The chosen record has a different alignment, so (5.4) gives $\| \| R < p$. Replace the outgoing link by the internal joining of 15. The target layer, and therefore $R$, lies in this joined piece. The freed budget $p$ pays for a round trip between $R$ and $epsilon$.
  For a cycle of at least two blocks, choose the outgoing link in 16; write $q$ for its target block’s period. Retain that selected link, with its contact of length at most $q$. Omit the #emph[target block’s] outgoing link, replacing it by internal joining. This frees $q$ by 15. The selected link and the omitted link are different, since the cycle has length greater than one. All other cycle links, together with the target’s internal joining, connect the entire cycle into one piece. Use the freed $q$ to root the short contact. 3 illustrates this choice of the omitted edge.
  Distinct directed cycles have disjoint blocks, so these replacements do not compete for budgets. Finally execute the links leading into the rooted pieces, in increasing distance from a root or an opened cycle. Each attaches its source block using only that source’s reserved budget. All layers are now rooted.
  Every addition is a closed walk. The initial layer budgets sum to $W$, and each budget was used only in its assigned operation or its cycle replacement. The total added up cost is therefore at most $W$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.8), [#box(width: 3.05cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Selected source#linebreak()$k$ layers, period $p$]]])])
  content((7.8, 2.8), [#box(width: 3.05cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Target block#linebreak()$ell$ layers, period $q$]]])])
  content((7.8, 0), [#box(width: 3.05cm, height: 1.15cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Next block]]])])
  content((0, 0), [#box(width: 3.05cm, height: 1.15cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Another block]]])])
  line((1.525, 2.8), (6.275, 2.8), stroke: (paint: rgb("#000073"), thickness: 1.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((3.9, 2.553), [#text(size: 7pt)[retain selected link#linebreak()cost at most $"kp"$]], anchor: "north", padding: 0.1176cm)
  line((6.275, 0), (1.525, 0), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  line((0, 0.575), (0, 2.225), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  line((7.8, 2.225), (7.8, 0.575), stroke: (paint: rgb("#a6a6a6"), thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: rgb("#a6a6a6"))))
  line((7.59, 1.21), (8.01, 1.63), stroke: (paint: rgb("#4d4d4d"), thickness: 1.1pt, miter-limit: 10))
  line((7.59, 1.63), (8.01, 1.21), stroke: (paint: rgb("#4d4d4d"), thickness: 1.1pt, miter-limit: 10))
  content((8.17, 1.42), [#text(size: 7pt)[omit target's#linebreak()outgoing link]], anchor: "west", padding: 0.1176cm)
  circle((3.9, 2.8), radius: 0.08467, fill: rgb("#000073"), stroke: none)
  content((3.9, 2.8), [#text(size: 9pt)[$s$, $|s| lt.eq q$]], anchor: "south-east", padding: 0.1764cm)
  content((3.73, 4.48), (4.07, 4.82), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$epsilon$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#000073"), thickness: 0.9pt, miter-limit: 10))
  content((3.9, 5.012), [#text(size: 7pt)[empty word]], anchor: "south", padding: 0.1176cm)
  line((3.9, 2.8), (3.9, 4.394), stroke: (paint: rgb("#000073"), thickness: 1.05pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#000073")), end: (symbol: ")>", fill: rgb("#000073"))))
  content((4.076, 3.597), [#text(size: 7pt)[round trip#linebreak()cost at most $q$]], anchor: "west", padding: 0.1176cm)
  content((0, 3.587), [#text(size: 7pt)[greatest distinguished#linebreak()rotation on the cycle]], anchor: "south", padding: 0.1176cm)
  content((3.9, -0.93), [#text(size: 9pt)[Target budget $ell q$: internal joining costs at most $( ell -1)q$;#linebreak()at least $q$ remains to root the short contact.]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 3: Opening a directed cycle of planned block links. Keep a link whose source has maximal distinguished rotation and realize it with a contact of length at most $q$, the target’s period. Omit the target block’s outgoing link and join that block internally, freeing $q$ to connect the contact to the empty word. Arrows between blocks represent planned dependencies, each realized by a closed walk; the dot is a contact vertex, not an extra block. ],
) <fig:cycles>

== 7 Polynomial time and the output string <sec:algorithm>

#proof[
  Parse and preprocess the explicit input in time polynomial in its encoded size $N$. This handles the empty instance and preserves the optimum otherwise. In the nonempty case, construct the counts and base graph of 2. By Lemma 2.1, Lemma 2.2, its cost is $W lt.eq "OPT" \( cal(S) \)$ and it contains every required vertex. Apply 17. The resulting graph is balanced, its used support is connected, it includes $epsilon$, and its total up cost is at most $2 W$.
  A finite balanced directed multigraph with connected used support has a closed Euler tour from any used vertex. One may obtain it by following unused edges until a closed walk is formed, and splicing further closed walks at visited vertices until all edges have been used. Balance prevents an unfinished walk from stopping away from its starting point, and connectivity ensures that any unused edges can eventually be reached for a splice.
  Start such a tour at $epsilon$ and write down the appended letter at each up step. At every step, the current vertex word is a suffix of the string written so far: an up step appends a letter to both, and a down step removes the first letter of the vertex. Every required string is visited and therefore occurs as a substring of the output. Its length is the number of up steps, at most $2 W lt.eq 2 "OPT" \( cal(S) \)$.
  We finish by verifying that all preceding constructions are deterministic polynomial-time operations on explicit finite data. Order encoded symbols, input strings, substring vertices, layers, records, and edge copies by their explicit codes and stable indices. At every finite choice in the construction, including walk decompositions, eligible records, tied extrema, and Euler splices, take the first admissible item in this order. Comparisons and output of variable-width symbol codes are charged their bit cost; no unit-cost operation on an unbounded label or random choice is used.
  ===== 7.1 Counts and graph. <counts-and-graph.>
  There are $O \( L^2 \)$ words in $V$, each of length at most $L lt.eq N$; store their explicit labels or interned identifiers in a dictionary. For each $v$, enumerate $1 lt.eq p < \| \| v$ and $k gt.eq 1$ with $k p < \| \| v$. The period-$p$ template is specified by $v \[ 0 : p \)$, and testing whether it matches $v$ takes polynomial time. Thus all rules (2.5) form a polynomial list. Each blocking functional is evaluated by enumerating $r in V$ and the possible placements in (2.1)–(2.1). The descending count recursion uses only such evaluations and integer maxima. By 2, all counts are at most $L$, so their bit lengths are polynomial as well.
  By 3, the explicit base graph has exactly $2 W lt.eq 2 L$ edges with multiplicity; adjacency lists retain individual edge-copy IDs. Its closed-walk decomposition can be found by finite edge traversals. Primitive periods, alignments of texts, and sorted passage lists can be found by direct string comparisons and sorting. The total number of primitive layer phases is the sum of their periods, namely $W$. Store each layer by its primitive period word, one period of exit-end values $z \( x \)$, and a stable ID; (3.1) recovers other coordinates without enumerating an infinite text.
  ===== 7.2 Records and connections. <records-and-connections.>
  The first and last ends of a layer, its minimum vertex length, and the distinguished rotation of its text can be computed from one period. Equality or lexicographic comparison of two periodic texts requires at most the sum of their periods to find a difference, by 7. Normalize the start of each considered periodic record to one turn, translating its aligned child coordinates with it as in 12. Each actual window labels a substring of length at most $L$, so the resulting coordinates, lengths, and end differences have polynomial bit length. A record is stored by layer ID, phase, normalized start and end, and its alignment.
  The search for a record in 5 is also finite. A period-$p$ layer has $p$ up steps and $p$ down steps, hence $2 p$ window visits per turn, counting the initial vertex but not its repeated final copy. There are therefore $2 W$ such visits over all layers. For the specified $w$ and template $A$, enumerate these actual windows and all placements of $w$ in them. Align each placement with $\[ t \, H - K \)$, reject a candidate whose complete aligned text equals $A$, and retain one whose entire window agrees with $A$. There are at most $2 W L$ candidates. The count rule and Lemma 5.1, Lemma 3.3 guarantee a covering window on a different aligned text, so this search succeeds.
  The host operations, collective links, and internal joins require only ordered lists of windows and the paths of 9; materialize these as explicit edge lists. Finding the intersections used in 11 is a scan along at most $K = k p$ units of start coordinate, with $K$ no larger than the group’s budget and hence at most $W$. Group processing and the final outgoing-block functional graph likewise use polynomially many layers and blocks.
  ===== 7.3 Materializing the answer. <materializing-the-answer.>
  Every added walk is closed, so its number of down steps equals its number of up steps. The total added up cost is at most $W$, and hence the final graph has at most $4 W lt.eq 4 L$ edges with multiplicity. Its explicit construction and Euler traversal are polynomial. This proves both the approximation guarantee and the running-time assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Avrim Blum, Tao Jiang, Ming Li, John Tromp, and Mihalis Yannakakis. Linear approximation of shortest superstrings. #emph[Journal of the ACM], 41(4):630--647, 1994. #link("https://doi.org/10.1145/179812.179818")[doi:10.1145/179812.179818].]
#bibitem([2])[Dany Breslauer, Tao Jiang, and Zhigen Jiang. Rotations of periodic strings and short superstrings. #emph[Journal of Algorithms], 24(2):340--353, 1997. #link("https://doi.org/10.1006/jagm.1997.0861")[doi:10.1006/jagm.1997.0861].]
#bibitem([3])[Nikolai Chukhin, Alexander S. Kulikov, Ivan Mihajlin, and Alexander Smal. A tight cycle-cover inequality for shortest common superstring. #emph[Electronic Colloquium on Computational Complexity], Report TR26-157, August 2026. Preprint. #link("https://eccc.weizmann.ac.il/report/2026/157/").]
#bibitem([4])[Matthias Englert, Nicolaos Matsakis, and Pavel Veselý. Approximation guarantees for shortest superstrings: Simpler and better. In #emph[34th International Symposium on Algorithms and Computation (ISAAC 2023)], volume 283 of #emph[LIPIcs], pages 29:1--29:17, 2023. #link("https://doi.org/10.4230/LIPIcs.ISAAC.2023.29")[doi:10.4230/LIPIcs.ISAAC.2023.29].]
#bibitem([5])[N. J. Fine and H. S. Wilf. Uniqueness theorems for periodic functions. #emph[Proceedings of the American Mathematical Society], 16:109--114, 1965. #link("https://doi.org/10.1090/S0002-9939-1965-0174934-9")[doi:10.1090/S0002-9939-1965-0174934-9].]
#bibitem([6])[Alexander Golovnev, Alexander S. Kulikov, Alexander Logunov, Ivan Mihajlin, and Maksim Nikolaev. Collapsing superstring conjecture. In #emph[APPROX/RANDOM 2019], volume 145 of #emph[LIPIcs], article 26, 2019. #link("https://doi.org/10.4230/LIPIcs.APPROX-RANDOM.2019.26")[doi:10.4230/LIPIcs.APPROX-RANDOM.2019.26]\; #link("https://arxiv.org/abs/1809.08669v3")[revised arXiv version, 4 June 2020].]
#bibitem([7])[Alexander Golovnev, Alexander S. Kulikov, and Ivan Mihajlin. Solving SCS for bounded length strings in fewer than $2^n$ steps. #emph[Information Processing Letters], 114(8):421--425, 2014. #link("https://doi.org/10.1016/j.ipl.2014.03.004")[doi:10.1016/j.ipl.2014.03.004].]
#bibitem([8])[Marcin Mucha. Lyndon words and short superstrings. In #emph[Proceedings of SODA 2013], pages 958--972, 2013. #link("https://doi.org/10.1137/1.9781611973105.69")[doi:10.1137/1.9781611973105.69].]
#bibitem([9])[Hiroki Shibata. Disproving the greedy superstring conjecture. #link("https://arxiv.org/abs/2609.01365v1")[arXiv:2609.01365v1], 1 September 2026. Preprint.]
#bibitem([10])[Z. Sweedyk. A 2.5-approximation algorithm for shortest superstring. #emph[SIAM Journal on Computing], 29(3):954--986, 1999. #link("https://doi.org/10.1137/S0097539796324661")[doi:10.1137/S0097539796324661].]
#bibitem([11])[Jorma Tarhio and Esko Ukkonen. A greedy approximation algorithm for constructing shortest common superstrings. #emph[Theoretical Computer Science], 57(1):131--145, 1988. #link("https://doi.org/10.1016/0304-3975(88)90167-3")[doi:10.1016/0304-3975(88)90167-3].]


