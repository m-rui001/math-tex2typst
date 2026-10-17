#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Polynomial-Time Algorithm for Three-Machine \
Unit-Job Scheduling]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A precedence-constrained schedule must respect two kinds of restrictions: jobs related by precedence must run in order, while unrelated jobs compete for the available machines. Even when every job takes one unit of time, the interaction between these restrictions is subtle. The two-processor case was treated by Fujii, Kasami, and Ninomiya #cite(label("FujiiKasamiNinomiya1969")) #cite(label("FujiiKasamiNinomiya1971Erratum")), and Coffman and Graham gave an optimal list-scheduling algorithm #cite(label("CG1972")). Allowing the number of machines to be part of the input yields an NP-complete problem #cite(label("Ullman1975")) Theorem 1. The fixed-three decision problem appears as OPEN8 in Appendix A13 of Garey and Johnson #cite(label("GJ1979")) and has remained a central complexity question in scheduling #cite(label("NSW2025")).

We consider the following precise decision problem. The input is an explicitly listed directed acyclic graph $G = \( V \, E \)$, with $V = { 1 \, dots.h \, n }$, and an integer $T$ satisfying $1 lt.eq T lt.eq n$. Every vertex is a nonpreemptive job of processing time one. The question is whether there is a function

$ tau : V arrow.r { 1 \, dots.h \, T } $

such that each value is taken at most three times and $tau \( u \) < tau \( v \)$ for every $\( u \, v \) in E$. There are no release dates, communication delays, eligibility restrictions, or additional resources. Slot $t$ means execution during $\[ t - 1 \, t \)$, and the makespan is the last completion time. Allowing nonnegative real start times would not improve the optimum: fix the machine assignment and within-machine order of a feasible schedule. The graph augmented by machine-order arcs is acyclic, as witnessed by the original schedule. In a topological order of this graph, set each start time to the maximum of zero and its predecessors’ completion times. Induction gives integer start times, and no completion time increases. The standard notation for the problem is $P 3 divides upright("prec") \, p_j = 1 divides C_max$ #cite(label("GrahamLawlerLenstraRinnooyKan1979")).

#thm([Theorem 1.1.])[
  #emph[Let an explicitly listed finite directed acyclic graph specify the precedence constraints on $n gt.eq 1$ nonpreemptive unit-length jobs on three identical machines. There is a uniform deterministic algorithm that constructs a feasible schedule of minimum makespan. Given also an integer deadline $1 lt.eq T lt.eq n$, it decides feasibility exactly and returns a schedule whenever the answer is affirmative. Both tasks can be performed in $O \( \( L + 2 \)^150020 \)$ steps on a deterministic multitape Turing machine, where $L$ is the total binary input length.]
] <thm:main>

The theorem resolves the polynomial-time side of this three-machine complexity question. Its scope is the explicit model just stated. The polynomial supplied by the proof has a very large constant exponent; no practical running-time claim is made.

===== 1.1 Prior work and the point of departure. <prior-work-and-the-point-of-departure.>

Structural restrictions on precedence yield important intermediate results. Garey, Johnson, Tarjan, and Yannakakis gave a linear-time algorithm on three processors for opposing forests, which are disjoint unions of an in-forest and an out-forest #cite(label("GareyJohnsonTarjanYannakakis1983")) Section 4. Dolev and Warmuth obtained a running time $O \( n^(h \( m - 1 \) + 1) \)$ when the precedence graph has height $h$, measured in arcs, and at most $m$ processors are available in each slot #cite(label("DW1984")) Theorem 3. The available number may vary over time. This is polynomial when both $h$ and $m$ are fixed. Their normalized optimal schedules, called zero-adjusted, have a slot whose at most $m - 1$ jobs with successors determine the prefix and the remaining subproblem, the latter up to isomorphism. When the graph has positive height, both recursive pieces have smaller height #cite(label("DW1984")) Theorem 2.

Nederlof, Swennenhuis, and Węgrzycki developed this structural approach into an exact algorithm with running time $\( 1 + n \/ m \)^(O \( sqrt(n m) \))$ for $n$ jobs on $m$ machines, hence $2^(O \( sqrt(n) log n \))$ for three machines #cite(label("NSW2025")) Theorem 1.1. Their decomposition at selected slots and memoization of subproblems described by source and sink sets already control the number of subproblems despite potentially linear recursion depth #cite(label("NSW2025")) Sections 5–6. Their proper-decomposition theorem assumes at most $m$ sources #cite(label("NSW2025")) Definition 1 and Theorem 3.1; their full algorithm handles arbitrary precedence graphs. The marked intervals below build on this decomposition viewpoint. We prove the required separator statements and bound the size of each global interval description directly; the polynomial bound does not follow by specializing their subexponential bound.

Approximation algorithms also revealed useful recursive structure. For fixed machine count and fixed $epsilon > 0$, Levey and Rothvoß obtained a $\( 1 + epsilon \)$-approximation using linear programming (LP) hierarchies #cite(label("LeveyRothvoss2016")); Garg improved the running time to quasipolynomial #cite(label("Garg2018")). Li replaced LP conditioning by combinatorial guesses and obtained the bound $n^(O \( \( m^4 \/ epsilon^3 \) \( log log n \)^3 \))$ #cite(label("Li2021")). Das and Wiese later gave a simpler combinatorial quasipolynomial-time approximation scheme #cite(label("DasWiese2022")). These works give a related perspective on the recursive structure of nearly optimal schedules. The exact separator and global-description statements used here are established separately.

===== 1.2 Why a finite search can suffice. <why-a-finite-search-can-suffice.>

After adding isolated jobs, we may assume that every slot contains three jobs. If selected slots are removed from a feasible schedule, the remaining open gaps can be scheduled independently: reordering the jobs of one gap does not change their temporal relation to any exterior job. This suggests a recursive search whose subproblems are the sets of jobs in those gaps. The obstacle is their number. Naming a gap by its two boundary triples does not by itself determine its job set, and repeatedly intersecting descriptions inherited from its ancestors can require an unbounded formula.

We prove that every feasible instance has a recursive decomposition in which each gap is described #emph[globally], as a subset of all jobs, by a Boolean formula of bounded size. The permitted tests are precedence to or from a triple of jobs, membership in that triple, and rank thresholds in a fixed linear extension or its reverse. The bound is independent of the depth of the decomposition. There are therefore only polynomially many sets that the algorithm must consider. Compatible selected triples connect smaller accepted gap sets, and their concatenation gives the schedule.

The structural proof chooses lexicographically minimal schedules only as existence witnesses; the algorithm enumerates the descriptions instead of computing those witnesses. Fix a priority order extending precedence, and call its current initial segment low and the remaining jobs high. A selected slot separates this cutoff when every earlier high job is a precedence predecessor of a job in that slot, and every later low job is a precedence successor of one. In a normalized interval, we promote jobs one at a time from high to low and move a separator forward. Each pair of successive selected slots separates one common cutoff: each low job in the intervening gap has a predecessor in its left slot, and each high job has a successor in its right slot.

The two sides of a center slot are treated by the same construction: for one side we reverse both time and precedence. To describe a gap without remembering all its ancestors, we maintain a short list of sets closed under taking successors in the current direction. A boundary slot limits the number of new list entries that can survive. A global boundary condition excludes distant jobs, while an exchange condition keeps that control valid after later reorderings. At a change of direction, a paired form of the inherited entries lets us replace their history by a bounded formula. The distinction between agreement inside a known interval and a description valid on all jobs is what makes this last step necessary.

===== 1.3 Organization. <organization.>

Section 2, Section 3 specify a finite description family and the uniform algorithm. 4 supplies common cutoffs, and 5 uses them to form smaller child intervals. 6 bounds inherited predicate information; 7 proves the global boundary invariants. 8 describes whole intervals and marked splits by bounded formulas, completing the hierarchy proof. 9 gives the explicit running-time bound.

== 2 Full schedules, frames, and descriptions <sec:preliminaries>

We write $x prec y$ if there is a directed path of positive length from $x$ to $y$. Transitive reachability can be computed in polynomial time. All restrictions of the precedence order below mean restrictions of this transitive order, including when a path in the original graph uses vertices outside the restricted set.

=== 2.1 Padding and interval reorderings <padding-and-interval-reorderings>

If $n > 3 T$, reject. Otherwise add $3 T - n$ isolated jobs and let $J$ be the resulting set, with $N = \| J \| = 3 T$. A #emph[full schedule] of a set $W subset.eq J$ is an ordered sequence of antichain triples partitioning $W$, respecting $prec$. Its length is necessarily $\| W \| \/ 3$. The empty set has the empty full schedule.

#thm([Lemma 2.1.])[
  #emph[The original deadline is feasible if and only if $J$ has a full schedule. The padded instance has polynomial size in the stated input encoding.]
] <lem:padding>

#proof[
  A schedule of the original jobs leaves exactly $3 T - n$ vacant positions among the three machines and $T$ slots. Fill them with the isolated jobs. Conversely, delete the isolated jobs from a full schedule. Since $T lt.eq n$ and the vertices are explicitly listed, $N = 3 T lt.eq 3 n$ is polynomially bounded. ◻
]

A schedule’s slots will also denote their job triples. An #emph[open interval] $\( a \, b \)$ consists of all slots strictly between two boundary slots; we use the same symbol $W$ for that interval’s job set. Virtual boundaries before the first and after the last slot are allowed.

#thm([Lemma 2.2.])[
  #emph[Replacing the schedule inside an open interval by any full schedule of its job set preserves feasibility of the complete schedule.]
] <lem:reorder>

#proof[
  All exterior jobs are either before the entire interval or after it. Their order relative to every interior job is unchanged. Interior precedences hold by the assumed feasibility of the replacement. ◻
]

=== 2.2 The two frames <the-two-frames>

Fix a linear extension of the order on $J$, with rank $lambda : J arrow.r { 1 \, dots.h \, N }$. A deterministic choice is obtained by successively removing a minimal job, breaking ties by its identifier. We also use the reversed order, reversed time, and reversed linear extension. These are our two #emph[frames]. The two ranks of a job sum to $N + 1$. Unless a frame is specified otherwise, all time comparisons, precedence relations, and ranks in an argument belong to its working frame.

For an actual slot $a$, identified with its job triple, define global cones

$ D_a = { x in J : exists y in a \, med y prec x } \, #h(2em) P_a = { x in J : exists y in a \, med x prec y } \, #h(2em) hat(D)_() a = D_a union a \, quad hat(P)_() a = P_a union a . $

At the left sentinel take $D_a = hat(D)_() a = J$ and $P_a = hat(P)_() a = diameter$. At the right sentinel use the opposite convention. Reversal exchanges $D$ and $P$, and exchanges their weak versions. In a fixed frame the $D$-cones and weak $D$-cones are upward closed, whereas the $P$-cones and weak $P$-cones are downward closed.

Cone membership always concerns the whole poset $J$, even when a formula is evaluated on an interval. A job that is temporally earlier than a block need not be a predecessor of that block.

=== 2.3 A fixed finite family <a-fixed-finite-family>

Let $cal(F)$ be the family of subsets of $J$ described by Boolean formulas with at most $K = 10000$ leaves. Leaves are the following atomic tests or their negations:

- true and false;
- rank thresholds $lambda lt.eq k$ and $lambda gt.eq k$, with $0 lt.eq k lt.eq N + 1$, in either frame;
- membership in a triple of jobs, or in any of its four cones $P \, D \, hat(P) \, hat(D)$, in either frame.

Internal nodes are binary conjunctions and disjunctions. Negating a formula does not increase its number of leaves: apply De Morgan’s laws and push negations to the leaves. Sentinel tests are constants. We distinguish a #emph[global description] $W = F$, with $F in cal(F)$, from a #emph[relative description] $L = W ∩ F$.

#thm([Lemma 2.3.])[
  #emph[The family $cal(F)$ can be generated deterministically in polynomial time and represented by $N$-bit vectors.]
] <lem:family>

#proof[
  There are $O \( N^3 \)$ atomic tests. The number of binary tree shapes and connective assignments with at most $K$ leaves is a constant depending only on $K$. Labelling the leaves therefore gives $O \( N^(3 K) \)$ formulas, with a constant implicit factor. Compute their truth sets after precomputing reachability, then deduplicate by comparing the bit vectors pairwise. This is a deterministic finite procedure with polynomial cost. ◻
]

== 3 The algorithm and its structural certificate <sec:algorithm>

The algorithm accepts or rejects each $W in cal(F)$, in increasing order of cardinality. Write $sans(A) \( W \)$ for its acceptance value, and regard $sans(A) \( U \)$ as false when $U in.not cal(F)$. Set $sans(A) \( diameter \)$ to true, and reject sets whose sizes are not divisible by three.

For each remaining nonempty $W$, form states

$ \( L \, Z \, R \) \, #h(2em) W = L dot(union) Z dot(union) R \, $

where $Z$ is an antichain triple and $L = W ∩ F$ for some $F in cal(F)$. Keep a state only if the displayed order of its three parts is #emph[compatible]: no job in a later part precedes a job in an earlier part. This test uses the transitive order on $J$. Declare the state initial when $sans(A) \( L \)$ is true and final when $sans(A) \( R \)$ is true. Add an edge

$ \( L \, Z \, R \) arrow.r \( L' \, Z' \, R' \) $

exactly when

#[#set math.equation(numbering: n => "(3.1)")
 $ L union Z subset.eq L' \, #h(2em) sans(A) #scale(x: 120%, y: 120%)[\(] L' \\ \( L union Z \) #scale(x: 120%, y: 120%)[\)] = upright("true") . $ <eq:transition>]

All acceptance values consulted concern smaller sets. Set $sans(A) \( W \)$ to true if an initial state reaches a final state, allowing a path consisting of a single state. Return $sans(Y E S)$ precisely when $sans(A) \( J \)$ is true.

#thm([Proposition 3.1.])[
  #emph[This is a uniform deterministic polynomial-time algorithm. Every set it accepts has a full schedule, which the algorithm can explicitly return. With $K = 10000$, its deadline decision and schedule construction take $O \( \( L + 2 \)^150020 \)$ deterministic multitape steps.]
] <prop:algorithm>

#proof[
  For soundness, consider a path with triples $Z_1 \, dots.h \, Z_k$ and left sets $L_1 \, dots.h \, L_k$. Put
  $ A_0 = L_1 \, #h(2em) A_i = L_(i + 1) \\ \( L_i union Z_i \) med \( 1 lt.eq i < k \) \, #h(2em) A_k = R_k . $
  The inclusions in (3.1) give the ordered disjoint partition
  #[#set math.equation(numbering: n => "(3.2)")
   $ W = A_0 dot(union) Z_1 dot(union) A_1 dot(union) dots.h.c dot(union) Z_k dot(union) A_k . $ <eq:partition>]
  Every $A_i$ is smaller than $W$ and was already accepted. By induction it has a full schedule. Every two distinct pieces in (3.2) are separated by a selected state, with the earlier piece in its left part or triple and the later piece in its triple or right part. Compatibility of that state excludes a backward precedence between the pieces. Concatenating their schedules with the selected triples is therefore a full schedule of $W$.
  To produce that schedule, record a predecessor whenever a state is first reached, with initial states distinguished as roots. Trace back from a reached final state and use the partition (3.2). Along every transition $\| L \|$ increases by at least three, so an accepting path has at most $N \/ 3$ triples. Retrieve the already stored schedules of its smaller gap sets and concatenate them with those triples. Store this one explicit schedule for $W$, avoiding any repeated recursive expansion.
  There are only polynomially many formula instances, sets, states, and state pairs because the leaf allowance $K$ is fixed. Sequential scans of their bit-vector records therefore give a uniform polynomial-time implementation. 9 gives the explicit multitape accounting, including the scans and copying needed for reconstruction, and proves the stated exponent. ◻
]

The completeness certificate uses only intervals, their marked triples, and descriptions; it imposes no bound on the number of levels.

#prodef([Definition 3.2.])[
  A #emph[bounded-description hierarchy] for a feasible $J$ has the whole schedule as its root interval. At a nonempty node $W$, one may first replace its schedule by a full schedule of the same job set. One then marks at least one actual slot; the nonempty open gaps between successive marks and the two boundaries become its children. Different children may be developed with separate copies of their witnessing exterior schedules. The following descriptions are required:
  + every node job set belongs to $cal(F)$;
  + for every marked triple, its earlier jobs within the node have a relative description $W ∩ F$, with $F in cal(F)$, in original time.
] <def:hierarchy>

#thm([Lemma 3.3.])[
  #emph[If a feasible $J$ has a bounded-description hierarchy, the algorithm accepts $J$.]
] <lem:hierarchy-dp>

#proof[
  Induct on node size. Its marks give compatible states in chronological order by property (ii). Their end gaps and transition gaps are empty or are its children, belong to $cal(F)$, and are strictly smaller because there is an actual mark. They have already been accepted by induction. The states consequently give an initial-to-final path. The root belongs to $cal(F)$ because its predicate is true. ◻
]

We prove the following structural assertion in Section 4, Section 5, Section 6, Section 7, Section 8. The considerably larger allowance $K = 10000$ avoids dependence on tight constant bookkeeping.

#thm([Theorem 3.4.])[
  #emph[Every feasible full three-machine schedule has a bounded-description hierarchy. In fact, the global node predicates and relative split predicates needed in the hierarchy have fewer than $500$ leaves.]
] <thm:structure>

#proof[
  Apply Lemma 2.1, Proposition 3.1, Lemma 3.3, Theorem 3.4. The algorithm is sound on every enumerated set and complete at $J$. For makespan minimization, test all deadlines $1 \, dots.h \, n$ and take the smallest feasible one. A topological ordering gives a feasible schedule of length at most $n$, so this search succeeds. Return the stored full schedule for its padded instance and delete the isolated padding jobs. Assign the at most three remaining jobs in each slot to distinct machines. The schedule has optimum makespan by the choice of deadline. The bound in 5 already allows all these deadline trials. ◻
]

== 4 Separators with a shared cutoff <sec:separators>

Decomposing a normalized schedule at selected slots is a central device in Dolev–Warmuth #cite(label("DW1984")) Theorem 2 and in the proper-decomposition construction of Nederlof, Swennenhuis, and Węgrzycki #cite(label("NSW2025")) Section 3. Here we prove the shared-cutoff form needed for the interval construction: successive boundaries must separate the same ideal of low-priority jobs. The global-list invariants in later sections control these descriptions inside descendant intervals.

This section concerns one fixed frame and a domain consisting of a contiguous interval of a feasible schedule. A set is an #emph[ideal] in the domain if it contains every domain predecessor of each of its members. Its complement in the domain is an upset.

#prodef([Definition 4.1.])[
  Given an ideal $S$ of low jobs in a domain, a slot $z$ is a #emph[separator at cutoff $S$] if
  + every domain job before $z$ that is outside $S$ belongs to $P_z$;
  + every domain job after $z$ that belongs to $S$ belongs to $D_z$.
  The other domain jobs are called high. A left boundary outside the domain is also a separator when all low domain jobs descend from it; there are then no domain jobs before that boundary.
] <def:separator>

An actual separator has a useful description of its earlier jobs. For a global set $H subset.eq J$, put

#[#set math.equation(numbering: n => "(4.1)")
 $ B_z \( H \) = P_z union #scale(x: 120%, y: 120%)[\(] H \\ hat(D)_() z #scale(x: 120%, y: 120%)[\)] . $ <eq:B-definition>]

#thm([Lemma 4.2.])[
  #emph[If $z$ is an actual separator for a domain $U$ at cutoff $S$, and $H ∩ U = S$, then $B_z \( H \) ∩ U$ is exactly the set of domain jobs strictly earlier than $z$. Reversing order and time, and exchanging low with high, preserves the separator property.]
] <lem:separator-description>

#proof[
  Every job in $P_z$ is strictly earlier than $z$. An earlier low job is outside $hat(D)_() z$. A low job at $z$ belongs to $hat(D)_() z$, and a later low job belongs to $D_z$ by separation. Finally, every earlier high job belongs to $P_z$. These observations give both inclusions. Reversal exchanges the two conditions in 9. ◻
]

=== 4.1 Lexicographic normalization <lexicographic-normalization>

A #emph[priority order] is a total order of the domain extending precedence. Read a full schedule chronologically, with each triple sorted by priority. Among the finitely many feasible full schedules of the domain, choose one whose resulting sequence of priority indices is lexicographically least. Call it #emph[normalized] for that priority. This is an existence choice, not an operation of the decision algorithm.

#thm([Lemma 4.3.])[
  #emph[In a normalized schedule, a feasible exchange that puts a better-priority job into an earlier slot is impossible. More generally, fix a slot $r$. After any feasible reordering confined strictly after $r$, a feasible exchange of a job at $r$ with a better-priority job at a later slot is still impossible.]
] <lem:lex-prefix>

#proof[
  Replacing one member of a sorted triple by a better-priority job lexicographically improves that triple. In the second assertion, the schedule through $r$ is unchanged by the intervening reordering. The proposed exchange would therefore first change the normalized sequence at $r$, and improve it there. The resulting full schedule would contradict minimality, regardless of what happens later. ◻
]

#thm([Lemma 4.4.])[
  (Shared-cutoff walk).  #emph[Fix a normalized full schedule of a domain and let $S$ and $S^(+)$ be consecutive priority prefixes, differing by the promotion of one job from high to low. Suppose $s$ is a separator at cutoff $S$, either inside the domain or at its exterior left boundary. Then there is a separator $t gt.eq s$, found by advancing only to domain slots on the right, that separates both $S$ and $S^(+)$. If the priority order is specified on a larger job set and the promoted job is outside the domain, one may take $t = s$.]
] <lem:shared>

#proof[
  #strong[One advance at a fixed cutoff.] Keep the normalized schedule and its priority order fixed. Let $L$ be a prefix of that priority order, and suppose the current position $s$ satisfies the earlier-high condition for $L$. If a later low job does not descend from $s$, choose the earliest slot $t > s$ containing such a job, and choose one of them, $x$. Every domain predecessor of $x$ lies strictly before $s$. Indeed, that predecessor is low because $L$ is an ideal. A predecessor at $s$ would force $x in D_s$. A predecessor strictly between $s$ and $t$ would descend from $s$, by the earliest choice of $t$, and again force $x in D_s$.
  Let $y$ be a high domain job at a slot $r$ with $s lt.eq r < t$. If $y$ had no domain successor at or before $t$, exchanging $x$ and $y$ would be feasible: all predecessors of $x$ are before $s$, and delaying $y$ would violate no successor constraint. Moving $x$ earlier and $y$ later preserves their other precedence constraints. Since $L$ is a priority prefix, $x$ has better priority than $y$, contradicting 11. Thus $y$ has a successor by $t$. The successor is high, since the high set is an upset. If it is strictly before $t$, repeat the argument. Strictly increasing times give a chain from $y$ to a high job at $t$.
  When $s$ is internal, every earlier high job has a descendant at $s$ by the earlier-high condition. That descendant is high, and the preceding tracing extends the chain to $t$. When $s$ is the exterior left boundary, there are no earlier domain jobs. Hence $t$ satisfies the earlier-high condition. We may advance to $t$ and repeat until there is no later low exception. There are finitely many slots, and every advance is strict, so the final position also satisfies the later-low condition. Throughout this walk the normalized schedule itself stays fixed; only the selected separator position changes.
  #strong[Adding one low job.] Apply this procedure with $L = S^(+)$, starting at the given separator for $S$. The earlier-high condition for $S^(+)$ holds initially because its high set is smaller. If no advance is needed, the same position separates both cutoffs.
  Otherwise the first exception is the single promoted job: every later job already low at $S$ descends from the starting position. At the first target, the promoted job lies in that target slot, so it introduces no earlier high job for the old cutoff $S$. Thus the earlier-high condition holds there for both cutoffs.
  In every subsequent advance, the exception is old-low: the promoted job stays at the first target, at or before the current position. An old-low exception has better priority than every old-high job. The same exchange and successor tracing therefore propagates the earlier-high condition for $S$ as well as for $S^(+)$. At the final position, the later-low condition for $S^(+)$ also implies the later-low condition for $S$, since $S subset.eq S^(+)$. The final position separates both cutoffs.
  If the promoted job is outside the domain, the two restricted prefixes coincide, so the original position already separates both. ◻
]

#thm([Corollary 4.5.])[
  #emph[Every ideal of a nonempty set with a full schedule has an actual separator in some full schedule of that set.]
] <cor:any-ideal>

#proof[
  Prioritize the ideal before its complement, using a linear extension inside each. Normalize. The first actual slot separates the empty prefix. Promote the jobs of the ideal one by one and use 12. The final position is an actual separator for the ideal. ◻
]

The shared cutoff, rather than merely the existence of separate separators, will be used for a gap: its low jobs descend from its left endpoint, while its high jobs precede its right endpoint. Keeping the final position of each promotion is important. Intermediate positions assist the proof but need not become marks.

== 5 The interval construction and its invariants <sec:construction>

We now construct the hierarchy from a feasible full schedule of $J$. Each node has a #emph[tag], one of the two frames, and a witnessing complete schedule. Descending to a child changes only the jobs inside that child; its boundary triples and exterior schedule remain fixed. Branches can retain separate witnesses, as allowed in 6.

=== 5.1 Global lists and boundary conditions <global-lists-and-boundary-conditions>

In the tag frame of a node $W = \( a \, b \)$, attach an ordered list $upright(bold(K)) = \( K_1 \, dots.h \, K_ell \)$ of global upsets. Define the global qualifier set and the local old-high set by

$ cal(Q) \( upright(bold(K)) \) = union.big_(i = 1)^ell K_i \, #h(2em) O = W ∩ cal(Q) \( upright(bold(K)) \) . $

For every globally qualifying job $x$, set

#[#set math.equation(numbering: n => "(5.1)")
 $ "key"_(upright(bold(K))) \( x \) = (max { i : x in K_i } \, thin lambda \( x \)) \, $ <eq:key>]

with lexicographic comparison. Entries may overlap. Their largest index, not their smallest one, is used. Because each entry is an upset, $x prec y$ with $x$ qualifying implies that $y$ qualifies and $"key"_(upright(bold(K))) \( x \) < "key"_(upright(bold(K))) \( y \)$.

We maintain the following three invariants in the node’s tag frame.

+ $O subset.eq P_b$, and $W \\ O subset.eq D_a$.
+ Every global qualifier scheduled at or before $a$ belongs to $hat(P)_() a$.
+ After #emph[any] feasible reordering of $W$ in its existing slots, there is no feasible direct exchange between $x in W \\ D_a$ and a qualifying job $y$ at $a$ when $"key"_(upright(bold(K))) \( x \) < "key"_(upright(bold(K))) \( y \)$.

Invariant (5.1) controls the jobs inside the interval; Invariant (5.1) controls qualifiers outside its left boundary, and Invariant (5.1) makes that control persist after later reorderings.

The exchange in Invariant (5.1) is tested for feasibility in the complete schedule. The hypothetical exchanged schedule need not preserve any decomposition or any of the list invariants. The key of $x$ is defined because Invariant (5.1) implies $W \\ D_a subset.eq O$. A sentinel has no boundary jobs, so the corresponding exchange condition is vacuous.

Lexicographic minimality within an interval controls exchanges of its interior jobs; it gives no such control over exchanges with an exterior boundary job. Invariant (5.1) supplies the latter control. Suppose a qualifying job $x in W \\ D_a$ has all its predecessors strictly before $a$, and its key is smaller than that of a qualifying $y in a$. If $y$ had no successor at or before the slot of $x$, their exchange would be feasible. Invariant (5.1) therefore forces such a successor. The proof in 7 uses this first successor to connect exterior qualifiers to the local separator walk.

All predicates are frozen global subsets of $J$ once constructed. In particular, a cone used in an old predicate continues to refer to its fixed triple of jobs; it is not redefined after later reorderings. We shall prove, simultaneously with the three invariants, that each pruned list has at most five entries and each entry has fewer than 40 leaves.

At the root, use the original frame, the two sentinels, and the one-entry list $\( J \)$. Invariant (5.1) follows from the sentinel cones, and Invariants (5.1) and (5.1) are vacuous.

=== 5.2 A center and two open sides <a-center-and-two-open-sides>

In either working frame, let $a \, b$ now mean the left and right boundaries of $W$ in that frame, and write

$ X = W \\ D_a \, #h(2em) Y = W \\ P_b . $

Invariant (5.1) gives

#[#set math.equation(numbering: n => "(5.2)")
 $ W subset.eq D_a union P_b \, #h(2em) X subset.eq P_b \, #h(2em) Y subset.eq D_a . $ <eq:cover>]

This cover is unchanged by reversal: the two boundary cones exchange roles. In either frame $X$ is an ideal in $W$, and $Y$ an upset. The list, $O$, and the other two invariants are used in their stated form only in the tag frame.

In the tag frame choose an actual center $v$ separating the ideal $W ∩ P_b$, using 13 and, if needed, reordering $W$. Mark $v$. At the root use the last slot as center; it separates the ideal $J$. The center triple and the job sets on its two sides are now fixed.

Treat each side as an open prefix $E = \( a \, v \)$, in the frame that makes it a prefix. Call that side $sans(s a m e)$ if its working frame is the node’s tag and $sans(s w i t c h)$ otherwise. Recompute all boundary notation in that working frame. The center is a separator at cutoff

#[#set math.equation(numbering: n => "(5.3)")
 $ S_(*) = cases(delim: "{", W ∩ P_b \, & sans(s a m e) \,, X = W \\ D_a \, & sans(s w i t c h) .) $ <eq:center-cutoff>]

Indeed the second formula is the complement of the original center-low set after reversing order and time, so 10 applies.

Use the following priority orders on $W$, and the following nested low cutoffs.

Begin with $S_0 = \( W \\ O \) ∩ P_b$. Order $S_0$ first by increasing rank, then $O$ by increasing $"key"_(upright(bold(K)))$, and then $Y$ by increasing rank. Promote the jobs of $O$ in that key order.

Begin with $S_0 = diameter$. Order $X$ first and $W ∩ D_a$ second, each by increasing rank in the switched frame. Promote the jobs of $X$ in that order.

These are total orders extending precedence. For the same case, $S_0$ is an ideal, $Y$ is an upset, and the key order on the middle group extends precedence. The groups partition $W$ since $O subset.eq P_b$. For the switch case use idealness of $X$. Every cutoff lies in $P_b$ on $W$, by (5.2), and the initial low set lies in $D_a$.

Normalize the open side $E$ using the restriction of its priority order to $E$. This can be done independently on the two sides before constructing children. It preserves feasibility by 3 and preserves the center separator, since neither side’s job set changes. The resulting sequence of low subsets of $W$ is

$ S_0 \, S_1 \, dots.h \, S_q = S_(*) . $

Some promoted jobs may lie outside $E$. Starting at its exterior left boundary $s_0 = a$, use 12 for every promotion, taking $s_i$ to be the #emph[final] position of that promotion. Thus

#[#set math.equation(numbering: n => "(5.4)")
 $ a = s_0 lt.eq s_1 lt.eq dots.h.c lt.eq s_q < s_(q + 1) = v . $ <eq:positions>]

The starting boundary is a separator on $E$ because $S_0 ∩ E subset.eq D_a$. For each $i < q$, both $s_i \, s_(i + 1)$ separate the cutoff $S_i$ on $E$. The same assertion for $i = q$ uses the center separator at $v$.

Mark the distinct actual walk positions in $E$, in addition to $v$. For each strict step $s_i < s_(i + 1)$, use

#[#set math.equation(numbering: n => "(5.5)")
 $ a' = s_i \, #h(2em) b' = s_(i + 1) \, #h(2em) S = S_i $ <eq:edge-data>]

as its edge data; Figure 1 shows one such step. Removing repetitions from (5.4) does not create an unassigned gap: consecutive distinct positions are exactly the endpoints of one of these strict steps. If the gap $W' = \( a' \, b' \)$ is nonempty, make it a child and tag it with this working frame.

#thm([Lemma 5.1.])[
  #emph[At every child edge, $b'$ is an actual triple in $W$, while $a'$ is either $a$ or an actual triple of $E$. On its child, 
#[#set math.equation(numbering: n => "(5.6)")
 $ W' ∩ S subset.eq D_(a') ∩ P_b \, #h(2em) W' \\ S subset.eq P_(b') . $ <eq:edge-labels>]

 Every child excludes the center and is strictly smaller than its parent. The root has no nonempty switched child.]
] <lem:edge-labels>

#proof[
  The shared cutoff at $a' \, b'$ gives the two required separator implications on the open side. All cutoffs lie in $P_b$ on $W$. The remaining assertions follow from the positions of the marks, and from the root’s last-slot center. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((3.15, -0.25), (6.35, 0.62), fill: rgb("#ededff"), stroke: none)
  line((-0.25, 0), (10.6, 0), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a0a0a0"))))
  content((10.6, -0.75), [#text(size: 8pt)[time in the working frame]], anchor: "east", padding: 0.1176cm)
  line((0, -0.18), (0, 0.62), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3, -0.18), (3, 0.62), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.5, -0.18), (6.5, 0.62), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((9.6, -0.18), (9.6, 0.62), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0.62), [#text(size: 9pt)[$a=s_0$]], anchor: "south", padding: 0.1176cm)
  content((3, 0.62), [#text(size: 9pt)[$a'=s_i$]], anchor: "south", padding: 0.1176cm)
  content((6.5, 0.62), [#text(size: 9pt)[$b'=s_(i+1)$]], anchor: "south", padding: 0.1176cm)
  content((9.6, 0.62), [#text(size: 9pt)[$v=s_(q+1)$]], anchor: "south", padding: 0.1176cm)
  content((4.75, 0.22), [#text(size: 9pt)[$W'=(a',b')$]])
  content((1.5, 0.22), [#text(size: 9pt)[$dots.h$]])
  content((8.05, 0.22), [#text(size: 9pt)[$dots.h$]])
  line((3, 1.18), (3, 1.4), (6.5, 1.4), (6.5, 1.18), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((4.75, 1.4), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[both endpoints separate at cutoff $S_i$]]], anchor: "south", padding: 0.1176cm)
  content((4.75, -1.05), [#text(size: 9pt)[$W' inter S_i subset.eq D_(a')$ $W' without S_i subset.eq P_(b')$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: One side of a node, viewed in its working frame. Each nonempty gap uses the cutoff belonging to its strict walk step. The endpoints separate that same cutoff, although adjacent gaps may use different cutoffs. The horizontal arrow denotes schedule time, not a precedence relation. ],
) <fig:shared-cutoff>

It remains to give each child a short list selecting exactly its high jobs, and to preserve the global boundary invariants. The following sections prove these claims by a top-down induction. When a child of $W$ is constructed, all data for $W$ and its ancestors have already been constructed. No claim about a deeper descendant is used.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Proof component
], table.cell(rowspan: 1, colspan: 1)[Interface used by the next step
]),
  table.cell(rowspan: 1, colspan: 1)[Shared cutoffs
], table.cell(rowspan: 1, colspan: 1)[A normalized side, a starting separator, and successive priority prefixes give two boundaries separating the same cutoff (12).
],
  table.cell(rowspan: 1, colspan: 1)[Child intervals
], table.cell(rowspan: 1, colspan: 1)[A valid parent gives a center and strictly smaller gaps with their shared cutoffs (14).
],
  table.cell(rowspan: 1, colspan: 1)[Global lists
], table.cell(rowspan: 1, colspan: 1)[Each child receives its high-job set and first invariant through at most five upset entries, each with fewer than $40$ leaves (Lemma 6.3, Lemma 6.4, Lemma 6.8).
],
  table.cell(rowspan: 1, colspan: 1)[Boundary stability
], table.cell(rowspan: 1, colspan: 1)[Parent invariants and side normalization give child Invariants (5.1)–(5.1), including all future feasible child reorderings (Lemma 7.1, Lemma 7.2).
],
  table.cell(rowspan: 1, colspan: 1)[Finite descriptions
], table.cell(rowspan: 1, colspan: 1)[Valid lists and boundaries give global child sets and relative splits with fewer than $500$ leaves (Lemma 8.1, Lemma 8.2, Lemma 8.3).
],
)
]],
  caption: [Table 1: The contracts connecting the structural proof. The executable dynamic program consumes the final node sets and split sets; lists and normalized schedules are used to prove that these sets suffice. ],
)

== 6 Short global lists and changes of direction <sec:lists>

Fix a nonempty child $W' = \( a' \, b' \)$ of $W = \( a \, b \)$, with center $v$, edge cutoff $S$, and working frame as in (5.5). The child’s tag is this working frame. At the end of an update, #emph[prune] every entry whose intersection with $W'$ is empty, preserving the order of the retained entries. We distinguish this pruning from the suffix operation used to form a carry.

=== 6.1 Carry and pruning <carry-and-pruning>

#thm([Lemma 6.1.])[
  (Suffix carry).  #emph[For a global upset list $upright(bold(K)) = \( K_1 \, dots.h \, K_ell \)$, fix $1 lt.eq d lt.eq ell$ and an integer $0 lt.eq r lt.eq N + 1$, and form 
#[#set math.equation(numbering: n => "(6.1)")
 $ "carry"_(d \, r) \( upright(bold(K)) \) = #scale(x: 120%, y: 120%)[\(] K_d ∩ { lambda gt.eq r } \, K_(d + 1) \, dots.h \, K_ell #scale(x: 120%, y: 120%)[\)] . $ <eq:carry>]

 Its qualifier set consists exactly of the old global qualifiers with old key at least $\( d \, r \)$. Among those jobs the new list preserves the old key order. Its entries are global upsets.]
] <lem:carry>

#proof[
  Let $j$ be a job’s largest old membership index. It is selected exactly when $j > d$, or $j = d$ and its rank is at least $r$. Whenever selected, its largest old membership is retained. Reindexing applies the same strictly increasing shift to these retained largest indices, and leaves the rank tiebreak unchanged. Rank suffixes are upsets because rank is a linear extension. ◻
]

#thm([Lemma 6.2.])[
  (The comparison preserved by pruning).  #emph[Let a list be pruned on $W'$. Suppose $x in W'$ qualifies and $y$ is any global qualifier of the pruned list. If the pruned key of $x$ is smaller than the pruned key of $y$, the same comparison held before pruning.]
] <lem:prune>

#proof[
  Use original indices for the retained entries; their eventual reindexing preserves order. Let $M \( z \)$ be the largest membership index before pruning and $R \( z \)$ the largest retained one. Every entry containing $x$ survives, so $R \( x \) = M \( x \)$, whereas $R \( y \) lt.eq M \( y \)$. If $R \( x \) < R \( y \)$, then $M \( x \) < M \( y \)$. If $R \( x \) = R \( y \)$ and $lambda \( x \) < lambda \( y \)$, then either $M \( y \) > M \( x \)$ or the rank comparison remains the tiebreak. Both cases give the asserted old key comparison. ◻
]

=== 6.2 The two updates <the-two-updates>

For a same-direction edge, the old list is in the working frame. If $O \\ S = diameter$, its carry is empty. Otherwise let $\( d \, r \)$ be the smallest key of a job of $O \\ S$, and use (6.1). Append the #emph[injection]

#[#set math.equation(numbering: n => "(6.2)")
 $ I = D_a ∩ \( J \\ P_b \) . $ <eq:injection>]

Then prune on $W'$.

For a switched edge, we shall construct a global upset $G$ in the new working frame with the following properties:

#[#set math.equation(numbering: n => "(6.3)")
 $ W \\ D_a subset.eq G \, #h(2em) G ∩ { x : x upright(" is scheduled at or before ") a } = diameter . $ <eq:G-properties>]

Choose $h$ so that the still-high part of $X = W \\ D_a$ is exactly $X ∩ { lambda gt.eq h }$. Take $h = N + 1$ if this part is empty. Discard the old list and begin a new list with the ordered pair

#[#set math.equation(numbering: n => "(6.4)")
 $ G ∩ { lambda gt.eq h } \, #h(2em) D_a . $ <eq:switch-pair>]

Then prune on $W'$. Notice that (6.3) covers #emph[all] of the parent’s $X$, not only the jobs in this child.

#thm([Lemma 6.3.])[
  #emph[For either update, assuming (6.3) in the switch case, the pre-pruning qualifier union on $W$ is exactly $W \\ S$. On these high jobs the pre-pruning key order agrees with the side’s priority order. After pruning, the qualifiers on $W'$ are exactly $W' \\ S$, and Invariant (5.1) holds for the child.]
] <lem:update-labels>

#proof[
  In the same case, 15 gives exactly $O \\ S$ on $W$, in its old key order. The injection gives exactly $Y$: use $Y subset.eq D_a$ in (5.2). It is disjoint from the old qualifier union on $W$, which is contained in $P_b$. Since the injection is last, the pre-pruning order is the unpromoted part of $O$, followed by $Y$ in rank order, as required.
  In the switch case, coverage of $X$ makes the first entry select exactly the unpromoted part of $X$ there. The second entry selects all of $W ∩ D_a$. Even if the two entries overlap, the larger index of the second puts this whole group last. The ordering therefore agrees with the switched priority.
  Pruning changes no membership on $W'$. Its high jobs lie in $P_(b')$, and its other jobs lie in $D_(a')$, by 14. These are precisely the two assertions of Invariant (5.1) for the child. ◻
]

=== 6.3 Why only five entries survive <why-only-five-entries-survive>

A #emph[run] is a chain of nodes with the same tag, starting at the root or just after a switch. Its initial entries are the root’s single entry, or the two entries in (6.4). Same-direction updates only take suffixes, restrict entries by rank suffixes, and append injections. Multiple restrictions of an entry by rank suffixes in the same frame combine into one tightest threshold.

Figure 2 isolates the use of machine capacity in the following bound.

#thm([Lemma 6.4.])[
  #emph[Every pruned list produced by this construction has at most five entries. At most three of them are injections from its current run.]
] <lem:list-length>

#proof[
  The root and switch updates have at most two initial entries. Consider a same update from $W$ to $W'$. Injections retained into this child are pairwise disjoint on $W$. To see this, consider any pair and the time the later one was introduced. It was disjoint on its then-current parent from all previous carried entries, by 17. That parent contains the current $W$, and subsequent carries only restrict the older predicates. The disjointness persists on $W$.
  Each surviving injection contains some $x in W'$. It is a high job, so $x prec z$ for some $z in b'$. Global upward closure puts $z$ in that same injection. The actual triple $b'$ lies in $W$. Pairwise disjointness on $W$ thus forces distinct surviving injections to contain distinct members of $b'$. There are only three such members. Together with the at most two initial entries this proves the bound. ◻
]

The freshly formed same-update list may have six entries before pruning. We will use the five-entry bound only for pruned lists or for a carry taken from such a list #emph[before] appending a new injection.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.15, -0.25), (10.75, 2.85), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), radius: 2pt)
  content((-0.15, 3.13), [#text(size: 9pt)[Parent $W$]], anchor: "west", padding: 0.1176cm)
  content((4, 3.13), [#text(size: 9pt)[Child $W'$]])
  content((9.1, 3.13), [#text(size: 9pt)[$b' subset W$, $|b'|=3$]])
  rect((8.55, -0.12), (9.65, 2.72), fill: rgb("#f2f2f2"), stroke: none)
  rect((0.03, 1.86), (10.57, 2.54), fill: rgb("#f2f2fb"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((1.05, 2.2), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$I_1 inter W$]]])
  content((2.5, 2.2), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$dots.h$]]])
  content((3.31, 1.96), (3.79, 2.44), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$x_1$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((8.86, 1.96), (9.34, 2.44), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z_1$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((3.897, 2.2), (8.753, 2.2), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((6.325, 2.2), [#text(size: 8pt)[$"prec"$]], anchor: "south", padding: 0.1176cm)
  content((10.05, 2.2), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$dots.h$]]])
  rect((0.03, 0.96), (10.57, 1.64), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((1.05, 1.3), [#text(size: 9pt)[$I_2 inter W$]])
  content((2.5, 1.3), [#text(size: 9pt)[$dots.h$]])
  content((3.76, 1.06), (4.24, 1.54), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$x_2$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.86, 1.06), (9.34, 1.54), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z_2$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.347, 1.3), (8.753, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.55, 1.3), [#text(size: 8pt)[$"prec"$]], anchor: "south", padding: 0.1176cm)
  content((10.05, 1.3), [#text(size: 9pt)[$dots.h$]])
  rect((0.03, 0.06), (10.57, 0.74), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((1.05, 0.4), [#text(size: 9pt)[$I_3 inter W$]])
  content((2.5, 0.4), [#text(size: 9pt)[$dots.h$]])
  content((4.21, 0.1596), (4.69, 0.6404), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$x_3$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.86, 0.1596), (9.34, 0.6404), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$z_3$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.797, 0.4), (8.753, 0.4), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.775, 0.4), [#text(size: 8pt)[$"prec"$]], anchor: "south", padding: 0.1176cm)
  content((10.05, 0.4), [#text(size: 9pt)[$dots.h$]])
  rect((3.03, -0.12), (4.98, 2.72), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 2pt)
  rect((8.55, -0.12), (9.65, 2.72), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), radius: 2pt)
  content((-0.15, -0.64), [#text(size: 8pt)[$x_i in I_i,#h(0.3333em) x_i "prec" z_i#h(0.3333em) arrow.r.double.long#h(0.3333em) z_i in I_i$]], anchor: "west", padding: 0.1176cm)
  content((10.75, -0.64), [#text(size: 8pt)[$I_i inter I_j inter W= nothing#h(0.3333em) (i != j)#h(0.3333em) arrow.r.double.long#h(0.3333em) z_i != z_j$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 2: Why at most three injections survive a same-direction update. For each surviving injection, choose a high job $x_i$ in the child and a successor $z_i$ in its ending triple $b'$. Upward closure puts $z_i$ in the same injection; disjointness on the parent $W$ makes the chosen $z_i$ distinct. The three-injection case is drawn; arrows denote precedence. Only witness pairs are shown: the injections may contain other jobs and may overlap outside $W$. ],
) <fig:capacity-three>

=== 6.4 Flattening the history of a run <flattening-the-history-of-a-run>

Only the first entry of a switch pair can carry a complicated predicate from an earlier run. The following lemma removes it whenever we need to reconstruct an old cutoff on a descendant parent.

#thm([Lemma 6.5.])[
  (Local flattening).  #emph[Suppose a run began with a switch out of a node $Q_0$, using left boundary $a_0$ in the resulting run frame, and entries 
$ G_0 ∩ { lambda gt.eq h_0 } \, #h(2em) D_(a_0) \, #h(2em) Q_0 \\ D_(a_0) subset.eq G_0 . $

 Let $U subset.eq Q_0$ be a later parent in that run. If the entry derived from the first displayed entry survives into an unpruned carry out of $U$, write its current form as $G_0 ∩ { lambda gt.eq k }$. Then the carried portion of this pair has the same union on $U$ as the global upset 
#[#set math.equation(numbering: n => "(6.5)")
 $ D_(a_0) union { lambda gt.eq k } . $ <eq:flatten>]

]
] <lem:flatten>

#proof[
  Track the original entries through later reindexings. As long as the first entry survives, a suffix operation cannot trim or discard the second entry: a cutoff at that later index would already discard the first, permanently. Thus the second entry is either still carried untrimmed, or was pruned because it was empty on some intermediate node containing $U$. In the latter case $D_(a_0) ∩ U = diameter$.
  On $U ∩ D_(a_0)$, the second entry, when this set is nonempty, therefore selects every job. Every job of $U \\ D_(a_0)$ lies in $G_0$, because $U subset.eq Q_0$. On that remainder the first entry selects exactly the rank suffix $lambda gt.eq k$. This proves equality of the two unions on $U$. Both factors in (6.5) are upsets, so their union is globally upward closed, although it need not agree with the carried pair outside $U$. ◻
]

A new switch out of a node $W$ uses the edge $U arrow.r W$ by which $W$ was created. Let $H_(-)$ be that incoming edge’s low cutoff, in its own working frame, and reserve $S$ for the cutoff of the new outgoing edge. We need an extension of $H_(-)$ that does not retain a complicated switch predicate from an earlier run. Local flattening provides it using lists and covering properties belonging to already constructed ancestors.

#thm([Lemma 6.6.])[
  (A short extension of an earlier low set).  #emph[Consider an already constructed edge from a parent $U$ to a child $W$, in its old working frame. Its low cutoff $H_(-) subset.eq U$ has a global downset extension $H_(-)^(*)$ agreeing with it on $U$. This extension can be chosen with at most $21$ leaves.]
] <lem:old-low>

#proof[
  Use the boundary notation of $U$ in that old frame for this proof. If the edge was a switch relative to the tag of $U$, its low cutoff is a rank prefix of $U \\ D_a$. Thus
  $ \( J \\ D_a \) ∩ { lambda lt.eq r } $
  is the required global downset, using at most two leaves.
  If the edge was same, its low cutoff on $U$ equals $P_b$ minus its unpruned carry union, without the fresh injection. The old list on $U$ has at most five entries by 18. If its run began at the root, all carry entries are simple: the root base or injections, possibly rank-trimmed. If it began at a switch, the only possibly complicated carry entry is the first of that switch pair. If it is present in the carry, replace the carried pair by (6.5); if it is absent from the carry, every carried entry is already simple.
  This gives a global upset agreeing with the carry union on $U$. It has at most five terms, each with at most four leaves. Indeed an injection with a rank trim has three leaves; a root base or a second switch base with a trim has at most two; and the flattened pair has two. Taking $P_b$ minus this union gives a global downset with at most $1 + 5 dot.op 4 = 21$ leaves. An empty carry is represented by false. ◻
]

=== 6.5 Constructing the new switch upset <constructing-the-new-switch-upset>

Suppose a switch out of $W$ produces a nonempty child. By 14, $W$ is not the root. Let $U$ be the parent that produced $W$. That preceding edge was taken in the tag frame of $W$, which is opposite to the current working frame. In the current frame write $a_(-) \, b_(-)$ for the boundaries of $U$ and $v_(-)$ for its center. The temporal arrangement is

#[#set math.equation(numbering: n => "(6.6)")
 $ a_(-) < v_(-) lt.eq a < b lt.eq b_(-) . $ <eq:ancestry>]

Here $a$ is an actual ending endpoint of that preceding edge, viewed in reverse; it can equal $v_(-)$. The node $W$ lies in the open suffix of $U$ after $v_(-)$; Figure 3 shows this arrangement.

Let $H_(-)$ be the low set of the preceding edge in its old working frame, regarded as a subset of all of $U$. The extension $H_(-)^(*)$ from 20 is an upset in the current, reversed frame. Define

#[#set math.equation(numbering: n => "(6.7)")
 $ G = D_(a_(-)) ∩ \( J \\ hat(P)_() a \) ∩ \( J \\ hat(P)_(v_(-)) \) ∩ H_(-)^(*) . $ <eq:G>]

#thm([Lemma 6.7.])[
  #emph[The set $G$ in (6.7) is a global upset satisfying both properties in (6.3).]
] <lem:G>

#proof[
  All four factors in (6.7) are global upsets in the current frame, so $G$ is an upset.
  Let $x in X = W \\ D_a$. If $x$ had been high at the preceding edge in its old frame, 14 would put it in the old predecessor cone of that edge’s ending endpoint. That endpoint is the current $a$, so reversal would give $x in D_a$, a contradiction. Thus $x in H_(-)$. Every job of $H_(-)$ precedes the old right boundary of $U$, because all edge cutoffs lie in that cone. Equivalently, $H_(-) subset.eq D_(a_(-))$ in the current frame. Since $x$ is strictly after both $a$ and $v_(-)$, feasibility excludes $x$ from their weak predecessor cones. Finally, $x in U$, so agreement of $H_(-)^(*)$ on $U$ gives $x in H_(-)^(*)$. Hence $X subset.eq G$.
  Conversely, suppose $z in G$ is scheduled at or before $a$. Membership in $D_(a_(-))$, together with (6.6), first places it strictly inside $U$:
  #[#set math.equation(numbering: n => "(6.8)")
   $ a_(-) < "time" \( z \) lt.eq a < b lt.eq b_(-) . $ <eq:localize-U>]
  Only now use $H_(-)^(*) ∩ U = H_(-)$. The old edge cutoff $H_(-)$ was contained in the old center-low set. If $z$ is at or before $v_(-)$ in the current frame, the old center separator puts it in current $hat(P)_(v_(-))$. If it is strictly after $v_(-)$ but at or before $a$, it lies in the old normalized side and the old separator at the endpoint $a$ puts it in current $hat(P)_() a$. Both possibilities contradict (6.7).
  These separator implications remain valid when preparing the current node: all intervening reorderings have been confined to $W = \( a \, b \)$, and therefore have not changed any job at or before $a$ in the current frame, the relevant boundary triples, or the fixed old cutoff sets. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((4.35, -0.25), (7.25, 0.65), fill: black, stroke: none)
  line((-0.25, 0), (10.6, 0), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a0a0a0"))))
  line((0, -0.18), (0, 0.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.2, -0.18), (2.2, 0.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((4.2, -0.18), (4.2, 0.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.4, -0.18), (7.4, 0.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((9.6, -0.18), (9.6, 0.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0.65), [#text(size: 9pt)[$a_-$]], anchor: "south", padding: 0.1176cm)
  content((2.2, 0.65), [#text(size: 9pt)[$v_-$]], anchor: "south", padding: 0.1176cm)
  content((4.2, 0.65), [#text(size: 9pt)[$a$]], anchor: "south", padding: 0.1176cm)
  content((7.4, 0.65), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  content((9.6, 0.65), [#text(size: 9pt)[$b_-$]], anchor: "south", padding: 0.1176cm)
  content((5.8, 0.25), [#text(size: 9pt)[$W=(a,b)$]])
  line((0, 1.24), (0, 1.43), (9.6, 1.43), (9.6, 1.24), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((4.8, 1.43), [#text(size: 9pt)[$U=(a_-,b_-)$]], anchor: "south", padding: 0.1176cm)
  content((10.6, -0.7), [#text(size: 8pt)[time in the new frame]], anchor: "east", padding: 0.1176cm)
  content((4.8, -1.05), [#text(size: 9pt)[$G=D_(a_-) inter (J without hat(P)_a) inter (J without hat(P)_(v_-)) inter H_-^*$]], anchor: "north", padding: 0.1176cm)
  content((4.8, -2.33), [#box(inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[If $z in G$ were at or before $a$, then $z in U$ and hence $z in H_-$.#linebreak() At or before $v_-$: $z in hat(P)_(v_-)$. After $v_-$ through $a$: $z in hat(P)_a$.]]])])
})],
  caption: [Figure 3: The ancestor configuration at a direction change, in the new working frame. A candidate early member of $G$ is first located inside $U$ by $D_(a_(-))$; only there is the earlier cutoff extension used. The two weak predecessor exclusions then cover the portions at or before $v_(-)$ and between $v_(-)$ and $a$. The equality $a = v_(-)$ is allowed; the intervening segment then collapses. The horizontal arrow denotes time. ],
) <fig:switch>

=== 6.6 Predicate bounds and the induction order <predicate-bounds-and-the-induction-order>

#thm([Lemma 6.8.])[
  #emph[Every entry constructed above has fewer than $40$ leaves. This bound persists through any number of same-direction updates.]
] <lem:entry-size>

#proof[
  Root bases, injections, and second switch bases are simple predicates. By 20, the $H_(-)^(*)$ factor in a new $G$ has at most $21$ leaves. The three other factors of $G$ and its outer rank suffix use four more. Thus a new first switch entry has at most $25$ leaves. Further same-direction trimming only tightens that outer rank suffix. It does not append a new independent condition. The same observation applies to simple entries. ◻
]

For completeness, the construction so far has a well-founded dependency order. Assume the parent and ancestor data already satisfy their assertions. A same update is defined directly. A switch update uses the preceding edge’s low set; 20 derives its short extension from already existing lists and, when necessary, an earlier switch’s covering property. 21 then proves the new covering and early-exclusion properties. 17 supplies the high-set identity and Invariant (5.1); 18 supplies the new length bound; and 22 supplies the predicate bound. The length argument needs global closure and high-set identities, but not the numerical predicate bound. Thus neither bound assumes itself at a deeper node.

The root starts this induction. We next prove the remaining boundary invariants for every update, using only the parent invariants and the current normalizations.

== 7 Preserving the global boundary invariants <sec:boundary>

We verify Invariants (5.1) and (5.1) for a child $W' = \( a' \, b' \)$ of $W = \( a \, b \)$. All notation is in the working frame of the child edge. In a same update this is also the parent’s tag frame. In a switch update the old list is not carried; the newly constructed upsets are used instead.

Preparatory changes to the schedule of $W$ preserve the parent invariants. Its boundary triples and all earlier exterior jobs stay fixed, so Invariant (5.1) is unchanged. Invariant (5.1) already quantifies over every feasible reordering of $W$.

=== 7.1 Excluding distant qualifiers <excluding-distant-qualifiers>

#thm([Lemma 7.1.])[
  #emph[The updated child list satisfies Invariant (5.1).]
] <lem:past>

#proof[
  It suffices to prove the assertion before pruning, since pruning only removes qualifiers. Let $z$ qualify for the pre-pruning child list and be scheduled at or before $a'$.
  If $a < "time" \( z \) lt.eq a'$, the job belongs to the normalized open side $E$ of the parent. By 17, it is high at the edge cutoff $S$. The local separator at $a'$ puts it in $P_(a')$ when strictly earlier, and membership in the triple puts it in $hat(P)_(a')$ when its time equals $a'$.
  Now suppose $z$ is at or before $a$. The new injection $D_a \\ P_b$ cannot contain such a job. Nor can either switch entry, by 21 and the strictness of $D_a$. Thus the only remaining case is a same-direction carry qualifier. The parent’s Invariant (5.1) supplies a job $y in a$ with $z = y$ or $z prec y$. The carry is a global upset, so $y$ also qualifies by carry. In particular $a$ is actual. If $a' = a$, we are done.
  Assume $a' > a$, and write $a' = s_i$, with edge cutoff $S = S_i$. Follow all the strict advances of the walk from $a$ through promotion $i$, including intermediate advances not retained as marks. Every cutoff used in this portion of the walk is contained in $S_i$. On $W$, the final carry is exactly $O \\ S_i$. Consequently every carry qualifier in $E$ is high, and has worse priority than the low exceptions, at every one of these advances.
  The first advance needs the parent exchange invariant, because $a$ lies outside the normalized open side $E$. Consider that first actual advance off $a$, with earliest exception $x$ at its target $t$. All #emph[global] predecessors of $x$ are before $a$. To verify this stronger readiness assertion, every predecessor is temporally before $t$. If one were at $a$, then $x in D_a$. If one were strictly between $a$ and $t$, it would belong to the contiguous side $E$, be low, and descend from $a$ by earliestness of the exception. Again $x in D_a$, a contradiction. There is no other possible predecessor at or after $a$.
  Also $x in X = W \\ D_a$, so Invariant (5.1) puts it among the old qualifiers, outside the starting low set. It has already been promoted by stage $i$, so its old key is strictly below the least unpromoted key at $S_i$. By 15, the boundary job $y$ has old key at least that least unpromoted key. The parent’s Invariant (5.1), applied after the current preparatory reorderings of $W$, therefore prohibits exchanging $x$ and $y$ in the complete schedule.
  If $y$ had no global successor at or before $t$, that exchange would be feasible. All global predecessors of $x$ lie strictly before $a$; moving it earlier preserves its successor constraints, and delaying $y$ to $t$ preserves its predecessor constraints and, under the supposition, its successor constraints. Thus $y$ must have a strict successor by $t$. Such a successor is in $E$ and is still a carry qualifier.
  Any carry job strictly between $a$ and $t$ must likewise have a successor by $t$: otherwise exchange it with $x$ within $E$, contradicting its lexicographic normalization. The carry is an upset, so these successors remain in the carry. Iterating along strictly increasing times reaches a carry job at $t$. It cannot be $x$, which is low and lies outside the final carry.
  At every subsequent advance, the local readiness and exchange argument from 12 applies inside $E$. All carry jobs remain high at that advance, so each carry job at its starting slot has a carry descendant at its target. Tracing from the descendant of $y$ at the first target eventually gives a descendant of $y$ at $a'$. Hence $z in hat(P)_(a')$, as required. ◻
]

=== 7.2 Exchanges after future child reorderings <exchanges-after-future-child-reorderings>

#thm([Lemma 7.2.])[
  #emph[The pruned child list satisfies Invariant (5.1), with its quantifier over all feasible reorderings of $W'$.]
] <lem:swap>

#proof[
  Take any feasible reordering of $W'$ in its slots. Suppose $x in W' \\ D_(a')$, that $y in a'$ qualifies for the child list, and that the new key of $x$ is smaller than the new key of $y$. Invariant (5.1), already proved for the child in 17, ensures that $x$ qualifies. By 16, the same comparison holds in the new list before pruning.
  First let $a' > a$. Both $x$ and $y$ are in the parent’s normalized side $E$, and both are high at its edge cutoff $S$, by 17. The pre-pruning key order agrees with the priority order used to normalize $E$. Thus $x$ has better priority than $y$. The child reordering changes only slots strictly after $a'$. A feasible exchange of $x \, y$ in the complete schedule would therefore give a feasible full schedule of the same $E$ with a better prefix at $a'$, contrary to 11.
  Now let $a' = a$. In the switch case there is no new qualifier at $a$, so no such $y$ exists. In the same case neither $x$ nor $y$ belongs to the new injection: $x in.not D_a$, and no job at $a$ is a strict descendant of $a$. Their pre-pruning comparison therefore uses only carry entries. By 15, it implies the same old key comparison in the parent’s list. Moreover $x in W \\ D_a$. The preparatory reorderings and the arbitrary subsequent reordering of $W'$ together form a feasible reordering confined to $W$. The parent’s Invariant (5.1) rules out the proposed exchange. ◻
]

#thm([Proposition 7.3.])[
  #emph[Starting from any feasible full schedule, the marking and list construction is defined at every node. Its pruned lists are global upset lists of length at most five, with fewer than $40$ leaves per entry, and satisfy Invariants (5.1)–(5.1). Every branch terminates.]
] <prop:construction-valid>

#proof[
  Proceed by depth from the root data of 5. Given valid ancestor and parent data, the center and the two normalized sides exist by Corollary 4.5, Lemma 2.2. The shared walk and 14 define the children. For a same update the new list is direct. For a switch, Lemma 6.6, Lemma 6.7 construct the needed global upset using only earlier data, as explained at the end of 6. Then Lemma 6.3, Lemma 6.4, Lemma 6.8 give the first invariant and the bounds. Lemma 7.1, Lemma 7.2 give the other two invariants without using a claim about any deeper child. This completes the simultaneous induction. Every child omits the center, so its size decreases strictly. ◻
]

Invariant (5.1) will let a bounded predicate distinguish the child from qualifiers arbitrarily far in the past. Invariant (5.1) is what allows that first invariant to continue propagating after recursive reorderings. Neither is replaced by an assertion only about local separators.

== 8 Global interval predicates and completion <sec:descriptions>

We now describe each child as a global set without intersecting with a recursively described parent. This is the step that converts the construction into a polynomial family of subproblems.

=== 8.1 Global tests for local cutoffs <global-tests-for-local-cutoffs>

The cutoff predicates in this section are used only in the final interval and split formulas. The list construction and its entry-size bound are now complete, so these formulas may retain the existing bounded entries. The historical extension in 20, by contrast, had to flatten an earlier run before a new switch entry could be constructed.

For every walk cutoff $S$ in a parent $W$, choose a global predicate $tilde(S)$ satisfying

#[#set math.equation(numbering: n => "(8.1)")
 $ tilde(S) ∩ W = S . $ <eq:cutoff-agreement>]

In the same case, let $upright(bold(K))_(upright("carry"))$ be the carry determined by $O \\ S$, before the new injection. Use

#[#set math.equation(numbering: n => "(8.2)")
 $ tilde(S) = P_b \\ cal(Q) \( upright(bold(K))_(upright("carry")) \) . $ <eq:direct-same-cutoff>]

On $W$, the carry selects precisely $O \\ S$, while the low jobs are the initial $\( W \\ O \) ∩ P_b$ and the promoted portion of $O$. Thus (8.1) holds. In the switch case use

#[#set math.equation(numbering: n => "(8.3)")
 $ tilde(S) = \( J \\ D_a \) ∩ { lambda lt.eq r } \, $ <eq:direct-switch-cutoff>]

where $r$ is the rank of the last promoted member of $X$, or $r = 0$ before any promotion. These formulas are available at every walk cutoff, whether or not the associated open gap is nonempty. They are not required to have any prescribed meaning outside $W$.

=== 8.2 A child as a global set <a-child-as-a-global-set>

Figure 4 summarizes the localization steps in the following formulas.

#thm([Lemma 8.1.])[
  #emph[In the valid construction of 25, let $W' = \( a' \, b' \)$ be a child of $W = \( a \, b \)$, with parent center $v$, edge cutoff $S$, new pruned list $upright(bold(K))'$, and cutoff predicate $tilde(S)$ satisfying (8.1). In the edge’s working frame, its high and low parts are the following global sets: 
#[#set math.equation(numbering: n => "(8.4)")
 $ W' \\ S & = cal(Q) \( upright(bold(K))' \) ∩ P_(b') ∩ \( J \\ hat(P)_(a') \) \,\
W' ∩ S & = D_(a') ∩ P_b ∩ \( J \\ hat(D)_(b') \) ∩ \( J \\ hat(D)_() v \) ∩ tilde(S) . $ <eq:global-high>]

]
] <lem:global-child>

#proof[
  Every high child job qualifies, precedes $b'$, and, because it is later than $a'$, is outside $hat(P)_(a')$. Conversely, a job selected by the right side of (8.4) is strictly before $b'$ by precedence. If it were at or before $a'$, the child’s global Invariant (5.1) would put it in $hat(P)_(a')$. It is therefore strictly in $W'$, and the child list selects exactly its high jobs.
  For (8.4), consider first a job selected by its right side. The two positive tests $D_(a') ∩ P_b$ locate it strictly inside the parent $W$: its time is after $a' gt.eq a$ and before $b$. This remains true with sentinel boundaries under our conventions. We can consequently use (8.1) to infer that the job is in $S$. This cutoff is contained in the center-low set $S_(*)$. A selected job at or after $v$ would therefore lie in $hat(D)_() v$, by the center separator or by membership in $v$ itself. The corresponding exclusion places it in the open side $E = \( a \, v \)$. Within $E$, a low job at or after $b'$ is in $hat(D)_(b')$, using the local separator at $b'$. The remaining exclusion puts the selected job strictly between $a'$ and $b'$.
  Conversely, a low job of this gap lies in $D_(a') ∩ P_b$ by 14, and it satisfies $tilde(S)$ by (8.1). Its time is strictly before both $b'$ and $v$, so it is in neither of their weak successor cones. It passes every test in (8.4). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.92, 2.18), [High jobs], anchor: "west", padding: 0.1176cm)
  content((0, 1.35), [#box(width: 1.8cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$ "bigcup"_j K'_j$]]])])
  content((2.35, 1.35), [#box(width: 1.8cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_(b')$]]])])
  content((4.9, 1.35), [#box(width: 2.15cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J without hat(P)_(a')$]]])])
  content((1.175, 1.35), [#text(size: 9pt)[$inter$]])
  content((3.54, 1.35), [#text(size: 9pt)[$inter$]])
  content((6.32, 1.35), [#text(size: 9pt)[$=#h(0.3333em) W' without S$]], anchor: "west", padding: 0.1176cm)
  content((4.9, 0.49), [#text(size: 8pt)[boundary invariant#linebreak()excludes early qualifiers]])
  content((-0.92, -0.36), [Low jobs], anchor: "west", padding: 0.1176cm)
  content((0.15, -1.18), [#box(width: 2.15cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$D_(a') inter P_b$]]])])
  content((2.5, -1.18), [#box(width: 1.4cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$tilde(S)$]]])])
  content((4.85, -1.18), [#box(width: 2.15cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J without hat(D)_v$]]])])
  content((7.55, -1.18), [#box(width: 2.15cm, height: 0.75cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J without hat(D)_(b')$]]])])
  content((1.51, -1.18), [#text(size: 9pt)[$inter$]])
  content((3.49, -1.18), [#text(size: 9pt)[$inter$]])
  content((6.2, -1.18), [#text(size: 9pt)[$inter$]])
  content((8.82, -1.18), [#text(size: 9pt)[$=#h(0.3333em) W' inter S$]], anchor: "west", padding: 0.1176cm)
  content((0.15, -2.08), [#text(size: 8pt)[localize#linebreak()inside $W$]])
  content((2.5, -2.08), [#text(size: 8pt)[cutoff test#linebreak()valid on $W$]])
  content((4.85, -2.08), [#text(size: 8pt)[center separator:#linebreak()before $v$]])
  content((7.55, -2.08), [#text(size: 8pt)[edge separator:#linebreak()before $b'$]])
})],
  caption: [Figure 4: The two global tests for a child. For the low part, positive cones locate a candidate inside the parent before its cutoff predicate is used; the two weak successor exclusions then restrict that candidate to the gap. For the high part, the global past-boundary invariant excludes qualifiers at or before $a'$. The intersection factors are arranged in the order used by the proof. ],
) <fig:gap>

The localization order matters. Neither the cutoff extension $tilde(S)$ nor the flattened historical extension needs to agree with its intended local set everywhere in $J$. Positive cone tests first place the candidate in the domain where agreement is known. The construction never appends a membership predicate for all ancestor intervals.

=== 8.3 Relative predicates for the marked splits <relative-predicates-for-the-marked-splits>

#thm([Lemma 8.2.])[
  #emph[Every marked slot $z$ in a node $W$ has a bounded relative description of its earlier jobs in either the working direction that produced it or the original direction. The formulas use the stated atomic language and have fewer than $500$ leaves, as counted in 28.]
] <lem:relative-splits>

#proof[
  Use the working frame for a side, and put
  $ H_(*) = cases(delim: "{", P_b \, & sans(s a m e) \,, J \\ D_a \, & sans(s w i t c h) .) $
  For the center $v$, the predicate $B_v \( H_(*) \)$, restricted to $W$, is its earlier set, by 10 and (5.3).
  For an internal mark $z$ in the open side $E$, choose a walk cutoff $S$ for which it is a local separator. The predicate
  #[#set math.equation(numbering: n => "(8.5)")
   $ F_z = B_v \( H_(*) \) ∩ B_z \( tilde(S) \) $ <eq:relative-split>]
  gives its earlier set upon restriction to $W$. The first factor selects $E$ on $W$; on that domain the second is the separator description from 10.
  If the working frame is opposite to original time, $F_z ∩ W$ describes the original #emph[later] jobs. Replace $F_z$ by
  #[#set math.equation(numbering: n => "(8.6)")
   $ \( J \\ F_z \) \\ z $ <eq:reverse-split>]
  to obtain the original earlier jobs after restriction to $W$. The exclusion of the marked triple is necessary: complementation alone includes it. Apply the same conversion to the center predicate when appropriate. ◻
]

#thm([Lemma 8.3.])[
  #emph[The predicates in Lemma 8.1, Lemma 8.2 have fewer than $500$ leaves.]
] <lem:final-count>

#proof[
  A pruned list or a carry contains at most five entries with fewer than $40$ leaves each, so its union has at most $195$ leaves. An empty union uses the false constant. The same-direction cutoff (8.2) therefore needs at most $196$ leaves; the switched one needs two. Use $205$ as a common loose allowance.
  The high predicate (8.4) uses at most $195 + 2 = 197$ leaves. The low predicate (8.4) uses at most $205 + 4 = 209$. Their union is a global description of $W'$ with at most $406$ leaves.
  The center predicate has three leaves. The internal split (8.5) has at most $3 + \( 205 + 2 \) = 210$, and conversion (8.6) adds one. Complementation does not increase leaf counts. Every cone uses an actual triple or a sentinel constant; all ranks and thresholds are from the two allowed frames. Thus these are formulas in the stated atomic language. ◻
]

#proof[
  Use 25 to construct marks and lists from a feasible full schedule. The root set $J$ is represented by true. Every nonempty child has the global description supplied by 26. Every mark has the relative split description supplied by 27. 28 places both kinds of description in $cal(F)$, independently of their depth. All branches terminate because the node sizes decrease strictly. These are exactly the conditions of 6. ◻
]

== 9 Running time in the explicit input model <sec:complexity>

The preceding structural proof establishes completeness of the finite search. We now give the detailed deterministic multitape accounting promised in 5. Its purpose is to make the polynomial-time assertion uniform; the structural argument does not require efficient normalization of a schedule or a small recursion depth.

#proof[
  #emph[Running-time bound in 5.] First specify a conservative implementation using sequential scans. Write $B = C_K N^(3 K)$ for an upper bound on the number of enumerated formulas, where $C_K$ depends only on the fixed $K$. There are at most $B$ distinct sets and at most $S = B N^3$ candidate states for each $W$. Store their bit vectors, reachability marks, and predecessor record numbers on work tapes. Each state record uses $O_K \( N \)$ bits: its indices require only $O_K \( log N \)$ bits. Store an explicit full schedule with each previously accepted set. This table uses $O_K \( B N^2 \)$ bits, since a schedule lists at most $N$ job identifiers and their slots.
  A complete scan to fetch or update a state record costs $O_K \( S N \) = O_K \( B N^4 \)$ steps. A lookup in the acceptance table by comparing all bit vectors costs $O_K \( B N^2 \)$ steps. Even checking all required precedence relations by repeated scans of the $N$-by-$N$ reachability table costs at most $O \( N^4 \)$. Thus one ordered state-pair test and reachability update costs $O_K \( B N^4 \)$ steps, without constant-time random access. Starting from the initial states, make at most $S$ passes over all ordered pairs, marking a target when its source is marked and (3.1) holds. These passes find every reachable state. For all sets together their cost is at most
  $ O_K #scale(x: 120%, y: 120%)[\(] B S^3 B N^4 #scale(x: 120%, y: 120%)[\)] = O_K \( B^5 N^13 \) = O_K \( N^(15 K + 13) \) . $
  Generating, evaluating, and deduplicating formulas by scans costs at most $O_K \( B^2 N^4 \)$; reachability preprocessing, state construction, and table initialization also fit within the displayed bound. The subscript $K$ denotes a constant fixed independently of the input. Since $N lt.eq 3 n$ and the vertices are explicitly listed, the looser bound $O \( \( L + 2 \)^150020 \)$ covers input processing and even all $n$ deadline trials needed for optimization. ◻
]

#prodef([Remark 9.1.])[
  For the deadline feasibility decision, the same preprocessing can handle an encoding that specifies an enormous number of isolated vertices only through a binary value of $n$. After checking $n lt.eq 3 T$, let $d$ be the number of vertices appearing in edges. If $T gt.eq d$, accept: schedule those $d$ vertices sequentially in topological order and fill free positions with the isolated vertices. Otherwise $N = 3 T < 3 d lt.eq 6 \| E \|$, so expansion is polynomial. This extra branch is not needed for the explicit encoding in 1.
] <rem:compact>

== 10 Conclusion <sec:conclusion>

The finite search succeeds because every interval in a suitable recursive schedule decomposition has a global description of bounded size, independent of its depth. Local separator descriptions alone do not give that guarantee: the short upset lists, the exterior boundary invariants, and the simplification at direction changes prevent the accumulation of ancestor information.

The resulting algorithm constructs an exact optimum for the stated three-machine model. The fixed leaf allowance $10000$ and the explicit large exponent establish polynomial time for the stated model. The proof supplies no practical performance guarantee.


#bibliography("refs.bib", style: "ieee", title: [References])
