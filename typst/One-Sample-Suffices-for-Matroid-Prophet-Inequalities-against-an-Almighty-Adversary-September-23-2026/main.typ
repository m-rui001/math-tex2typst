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

#align(center)[#text(size: 16pt, weight: "bold")[One Sample Suffices for Matroid Prophet Inequalities \
against an Almighty Adversary]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A prophet inequality compares irrevocable online choices with the best feasible choice after all values are known. Here feasibility is described by a known finite labeled matroid $M = \( E \, cal(I) \)$: its independent sets $cal(I)$ are closed under taking subsets and satisfy the augmentation axiom. For a nonnegative vector $v = \( v_e : e in E \)$, write

$ "OPT"_M \( v \) = max_(I in cal(I)) sum_(e in I) v_e . $

An online rule observes labels and their values one at a time, and must accept or reject each label before the next arrival while keeping its accepted set independent. The value at each label has an unknown distribution; before arrivals the rule receives one independent sample from each of these distributions.

We prove a constant guarantee against an #emph[almighty] ordering adversary. Besides the samples and the entire online value vector, this adversary sees the rule’s complete random seed before choosing the permutation. The rule is not told that future order. This exposes both the statistical information and every random choice that might otherwise protect the online rule from an unfavorable ordering.

#thm([Theorem 1.1.])[
  #emph[There is a measurable online selection rule, independent of the value distributions, with the following property. Let $M = \( E \, cal(I) \)$ be any finite known labeled matroid, and let $\( S_e \, V_e : e in E \)$ be mutually independent nonnegative real random variables, with $S_e$ and $V_e$ having the same arbitrary law $D_e$. Assume $bb(E) \[ "OPT"_M \( V \) \] < oo$. The rule receives exactly the sample vector $S$ before arrivals and uses a seed $R$ independent of $S \, V$.]
  #emph[For every measurable permutation rule $pi$ depending on $M$, the laws $\( D_e \)$, $S$, $V$, and $R$, the rule accepts an independent set $A$, irrevocably deciding at each arrival using only the available history, and 
#[#set math.equation(numbering: n => "(1.1)")
 $ bb(E) [sum_(e in A) V_e] gt.eq 2^(- 310) bb(E) \[ "OPT"_M \( V \) \] . $ <eq:main>]

]
] <thm:main>

The constant is independent of the matroid, its size and rank, and the distributions. The rule is a finite measurable construction; no running-time or polynomial independence-oracle guarantee is claimed. Section 6 proves the stronger constant $2^(- 293)$, leaving slack in the stated bound. We use no distributional description, extra samples, or randomness concealed from the adversary.

The proof also gives a secretary consequence. In that model the weights are fixed before any randomness, and the rule observes and rejects a random initial segment of a uniformly random permutation. After this prefix, an adversary that sees all weights, the ordered prefix, and the complete rule seed may rearrange the remaining labels arbitrarily. Corollary 18 gives a constant guarantee even with this suffix order. Both results follow from the same fixed-weight guarantee: after a random set of weights is revealed and its labels sacrificed, the expected minimum reward over all orders is a constant fraction of the fixed optimum.

===== 1.1 Historical context. <historical-context.>

In the classical single-choice problem, independent nonnegative values with known distributions admit a sharp reward fraction of $1 \/ 2$; the original work of Krengel and Sucheston credits Garling for the factor-two bound #cite(label("KS77")). Kleinberg and Weinberg proved the same $1 \/ 2$ guarantee for arbitrary matroid constraints when the distributions are known #cite(label("KW12")). Their arrival model permits the next label to depend on previously revealed values, without giving the adversary the unseen values.

For unknown distributions, independent labeled samples provide a natural alternative source of information. Azar, Kleinberg, and Weinberg developed this limited-information framework and a reduction from order-oblivious secretary algorithms to single-sample prophet algorithms #cite(label("AKW14")). In the single-choice setting, Rubinstein, Wang, and Weinberg obtained the optimal one-sample reward fraction $1 \/ 2$ #cite(label("RWW20")). Caramanis et al. developed greedy-ordered selection and a pointwise sample-pair framework for single-sample guarantees under structured feasibility constraints #cite(label("CDF22")). These works illustrate how symmetry between a sample and a realized value can replace knowledge of a distribution.

This connection also links sample-based selection to the matroid secretary problem, introduced by Babaioff, Immorlica, and Kleinberg #cite(label("BIK07")). In that problem the weights are fixed and the arrival order is uniformly random. Lachish #cite(label("Lachish14")) and Feldman, Svensson, and Zenklusen #cite(label("FSZ15")) obtained guarantees with a doubly logarithmic loss in the rank. The latter gave an order-oblivious rule, whose guarantee survives adversarial reordering after its observation prefix, and derived a one-sample prophet inequality with the same loss #cite(label("FSZ15")) Theorem 1.1 and Corollary 1.2. Thus one sample already gave guarantees for general matroids; we obtain a constant independent of rank under full-seed order selection. Recent work also obtains constant guarantees for ordinary random-order matroid secretary selection #cite(label("Singla26")) #cite(label("Huang26")). Section 7 compares these results, which retain uniformly random arrivals throughout, with the full-seed adversarial-suffix consequence proved here.

For every fixed $0 < delta < 1 \/ 4$, Fu et al. obtained a reward fraction $1 \/ 4 - delta$ for arbitrary matroids on $n$ elements, using $O_delta \( log^4 \( 2 + n \) \)$ samples per element #cite(label("FLTWWZ24")). Feldman, Svensson, and Zenklusen subsequently improved the sample dependence on the ground-set size and rank #cite(label("FSZ26")). These latter results allow an almighty adversary, which observes all random realizations before choosing the order, including the algorithm’s randomness. The full-seed adversary is the almighty adversary of the greedy online-contention-resolution framework of Feldman, Svensson, and Zenklusen #cite(label("FSZ16")) Section 1.1. The distinction between one sample and a sample budget growing with the matroid remains essential even when the latter gives a much larger numerical constant.

For a different arrival model, Abdi, Banihashem, Hajiaghayi, and Mittal give a one-sample $1 \/ 2$ matroid prophet guarantee using $O \( n^2 \)$ independence queries #cite(label("ABHM26")) Theorem 1.3. Their order is fixed independently of the samples, online values, and internal random coins. Theorem 1 instead permits the order to depend jointly on all of them. A bound for every fixed order controls the minimum of expected rewards, whereas this information pattern requires an expected minimum of rewards. The two guarantees therefore have different adversary interfaces, as well as different quantitative and computational bounds.

The density decompositions used below have a classical foundation in Edmonds’s matroid partition theorem #cite(label("Edmonds65")). Soto used principal partitions and their uniformly dense minors for secretary selection in the random-assignment model #cite(label("Soto13")); Santiago, Sergeev, and Zenklusen subsequently developed that approach without advance knowledge of the matroid #cite(label("SSZ25")). Our density optimizer is applied within each sampled weight group and incorporated into paths expanded by independent guards. The layer construction also has a predecessor in the alternating restriction–contraction minors along sampled spans used by Feldman, Svensson, and Zenklusen #cite(label("FSZ15")) Section 3. Here the sampled density expansions and guards produce the flats, and the analysis must control the expected minimum over orders after all seed information is exposed.

===== 1.2 Proof strategy. <proof-strategy.>

We work first with a fixed hidden vector of weights. Independent masks reveal some coordinates, which are then sacrificed. The goal in this formulation is the expectation of the #emph[minimum over all orders], not a guarantee for an order chosen independently of the masks. A simple coordinatewise coupling subsequently transfers this guarantee to the one-sample model (Section 2).

After rounding weights into geometric levels, the main rule constructs nested paths of flats, that is, subsets closed under matroid span. The path index is an auxiliary integer, unrelated to arrival time. Process weight groups from low to high. For each group, enlarge the incoming flats to capture revealed labels at high density relative to rank. A separate sparse mask of revealed labels supplies #emph[guards], which enlarge a flat one auxiliary step before those labels enter its nominal path. Differences between alternate flats give two-step layers. Within each layer the rule greedily selects labels independent over the earlier endpoint flat. Nesting makes their union feasible for every arrival order (Section 3).

The proof must show that these layers retain enough valuable rank. Three losses arise, each requiring a different argument.

First, lower-weight arrivals may block a focal weight group. At a revealed label’s nominal entry step, the #emph[safety test] asks whether it remains outside the density expansion of the earlier flat together with all possible lower-weight competitors. Expose the guards backwards in auxiliary time, so that the nominal flats shrink. A disjoint-certificate bound shows that a label usually leaves at a step with substantial conditional exit probability. A second transition, using the independent mask that governs online eligibility, turns this exit estimate into an expected safe count (Section 4). All masks are drawn initially; reverse exposure analyzes their law without concealing any coins from the adversary.

Second, the safe labels themselves have been sacrificed. In each layer, choose an independent set spanning the unsacrificed labels over the earlier flat and lower-weight competitors. The density inequality bounds the safe count by the density charge times the total size of these sets, plus the number of labels left outside their span. A large safe count can therefore fail to yield rank only if this residual is large. The residual lies entirely in the sacrificed mask. Such a set can depend on that mask, so a bound for one fixed set does not suffice. We encode residuals by the marks at which their labels first become spanned in two sequences with boundedly many inserted generators. A combinatorial bound controls all such marked-pivot patterns before the focal group’s mask is exposed. Crucially, its bound depends on the number of inserted generators, not the number of auxiliary times. A union bound then rules out large residuals with high probability, giving rank on unsacrificed labels (Section 5).

Third, passing from a group’s nominal path to the final guarded path enlarges the layer bases, which can reduce that rank. One common set of generators accounts for all such expansions. A telescoping conditional-rank identity charges its cost only once across the entire path. After independent eligibility thinning, the remaining rank lower-bounds cumulative accepted counts simultaneously for every permutation. Only then do we average and sum over weight levels (Section 6). A separate single-choice branch covers the case in which the heaviest label is a substantial part of the optimum.

Section 7 realizes the sacrificed mask as a random observation prefix and proves the secretary consequence.

== 2 A fixed-vector formulation <sec:setup>

Throughout, $M = \( E \, cal(I) \)$ is a finite labeled matroid. For $X subset.eq E$, its rank $"r" \( X \)$ is the maximum size of an independent subset of $X$, and $"cl" \( X \) = { e in E : "r" \( X union { e } \) = "r" \( X \) }$ is its closure. A flat equals its closure; $X$ spans $A$ when $A subset.eq "cl" \( X \)$. Write $L = "cl" \( diameter \)$ for the set of loops, and put

$ "r" \( A divides P \) = "r" \( A union P \) - "r" \( P \) \, #h(2em) "OPT"_M \( w \) = max_(I in cal(I)) sum_(e in I) w_e . $

Inside a closure, a rank argument, or a map on flats, a sum of sets denotes their union. A set is independent over $P$ if its conditional rank over $P$ equals its cardinality. We fix a total order on the labels once and for all.

We first consider a deterministic nonnegative weight vector $w$ that is initially hidden. Before arrivals, a rule draws a mask $B_0 subset.eq E$ independently of $w$ and learns $w$ on $B_0$. It must reject every label in $B_0$. On other labels it learns the weight at arrival. The mask may be a function of the rule’s complete initial random seed $R$. Let $A \( w \, R \, pi \)$ denote its accepted set under permutation $pi$.

#thm([Proposition 2.1.])[
  #emph[There is a measurable rule in the fixed-vector formulation that is feasible for every realization and every permutation, and for every $w in \[ 0 \, oo \)^E$ satisfies 
#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E)_R [min_pi sum_(e in A \( w \, R \, pi \)) w_e] gt.eq 2^(- 293) "OPT"_M \( w \) . $ <eq:hidden-guarantee>]

 Its revealed mask is selected before any weights are seen.]
] <prop:hidden>

The minimum in (2.1) is inside the expectation. In particular, an adversary may choose a different order for each seed. All estimates below are for a fixed $M \, w$; we suppress these deterministic objects in conditional expectations.

Using samples on a sacrificed observation set and realized values on its complement is the simulation underlying the limited-information reduction of Azar, Kleinberg, and Weinberg #cite(label("AKW14")) Section 3. Related sample/value symmetries appear in the paired-draw analyses of Rubinstein, Wang, and Weinberg #cite(label("RWW20")) Section 3 and Caramanis et al. #cite(label("CDF22")) Sections 2 and 6. Here the mask may depend on the entire seed, and the transfer must preserve the minimum inside the expectation. We verify these requirements directly.

#thm([Lemma 2.2.])[
  (One-sample simulation).  #emph[A measurable fixed-vector rule satisfying (2.1) yields a measurable one-sample rule with the same competitive ratio against the adversary of Theorem 1.]
] <lem:simulation>

#proof[
  Draw its entire seed independently of the sample and value vectors $S \, V$. For analysis, define
  $ w_e^(upright("glue")) = cases(delim: "{", S_e \, & e in B_0 \( R \) \,, V_e \, & e in.not B_0 \( R \) .) $
  Given any seed, the choices of which copies to use are fixed. The mutual independence and matching laws of $S_e \, V_e$ imply
  $ cal(L) \( w^(upright("glue")) divides R \) = ⨂_(e in E) D_e . $
  Thus $w^(upright("glue"))$ is independent of the complete seed and has the law of $V$. Implement the fixed-vector rule using $S_e$ only on its revealed mask and $V_e$ elsewhere when a label arrives. Ignore unused samples and reject revealed labels without using their online values. For every fixed $S \, V \, R$ and every permutation, induction on arrivals shows that this execution has exactly the accepted set $A \( w^(upright("glue")) \, R \, pi \)$; each accepted weight is its actual online value.
  Consequently, for any adversarial choice of $pi$, including one depending on all the unused samples and values, its reward is at least $min_(pi') sum_(e in A \( w^(upright("glue")) \, R \, pi' \)) w_e^(upright("glue"))$. Integrate (2.1) using independence of the glued vector and seed. This gives the desired inequality. Nonnegative integration is valid without further moment assumptions, and feasibility bounds the reward by $"OPT"_M \( V \)$, whose expectation is finite. ◻
]

=== 2.1 Elementary matroid facts <elementary-matroid-facts>

The independent sets contain $diameter$, are closed under subsets, and satisfy augmentation: for $I \, J in cal(I)$ with $\| I \| < \| J \|$, some $e in J \\ I$ has $I union { e } in cal(I)$. A basis of a set $X$ is a maximal independent subset of $X$. We use only rank and closure, so the argument applies to nonrepresentable matroids as well. The augmentation axiom implies that all maximal independent subsets of a given set have the same size, and that independent sets extend to bases of larger sets. Rank is submodular:

#[#set math.equation(numbering: n => "(2.2)")
 $ "r" \( A \) + "r" \( B \) gt.eq "r" \( A union B \) + "r" \( A ∩ B \) . $ <eq:rank-submodular>]

Indeed, extend a basis of $A ∩ B$ to one of $A$, then to one of $A union B$ using elements of $B \\ A$. The initial intersection basis together with these last elements is independent in $B$, which proves the inequality. It follows that $"r" \( Z divides P \)$ decreases when $P$ grows. Closure is increasing and idempotent, and adjoining spanned elements changes neither rank nor closure. In particular, scanning a set and greedily accepting elements that increase rank over a fixed base $P$ selects an independent set over $P$ of size $"r" \( Z divides P \)$ and spans all of $Z$ over $P$.

== 3 Constructing the fixed-vector rule <sec:algorithm>

We construct the rule of Proposition 2 for a fixed hidden weight vector. It uses geometric rounding and chooses with equal probability between a single-choice maximum branch and a main branch. The maximum branch handles weight concentrated on one label. The main branch filters arriving labels against revealed weights and assigns eligible arrivals to layers of nested flats constructed from those revealed weights. Greedy independent sets from different layers can then be combined feasibly.

=== 3.1 Rounding and a maximum branch <rounding-and-a-maximum-branch>

Fix the constants

#[#set math.equation(numbering: n => "(3.1)")
 $ B = 2^32 \, #h(2em) kappa = 2^100 \, #h(2em) t = 2^(- 140) \, #h(2em) eta = 2^(- 12) \, #h(2em) gamma = eta \/ 16 = 2^(- 16) . $ <eq:constants>]

Here $B$ separates weight levels, $kappa$ is the rank charge in the density expansions, and $t$ is the common sparsity of the guard and eligibility masks. The exit-probability cutoff $eta$ gives the sample-to-rank coefficient $gamma$. The choices leave room for the losses combined in Section 6. For $w_e > 0$, round down to $u_e = B^(floor.l log_B w_e floor.r)$, and put $u_e = 0$ when $w_e = 0$. Define $u \( Z \) = sum_(e in Z) u_e$ and $W = "OPT"_M \( u \)$. The rule rounds each coordinate when its weight is revealed or arrives; the full vector $u$ is used only for analysis. Then

#[#set math.equation(numbering: n => "(3.2)")
 $ "OPT"_M \( w \) \/ B lt.eq W lt.eq "OPT"_M \( w \) . $ <eq:rounding>]

Larger rounded weights have higher priority, with ties resolved by the fixed label order. Priority greedy on all positive labels produces an independent set $I^(*)$ of weight $W$: its intersection with every initial segment of weight levels has full rank there, so summing the differences of successive levels proves optimality.

Let $m_(*)$ be the largest rounded weight of a positive nonloop, or zero if there is none. A #emph[maximum rule] reveals a fair independent mask and accepts the first unmasked positive nonloop of higher priority than every revealed positive nonloop, then accepts nothing further. If there are at least two positive nonloops, with probability $1 \/ 4$ the highest-priority one is unmasked and the second is masked. On this event only the highest can exceed the threshold, so it is accepted in every order. With one positive nonloop, success has probability $1 \/ 2$. Thus in all cases

#[#set math.equation(numbering: n => "(3.3)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] min_pi u \( A_(upright("max")) \( R \, pi \) \) #scale(x: 120%, y: 120%)[\]] gt.eq m_(*) \/ 4 . $ <eq:maximum>]

The final fixed-vector rule uses this rule or the main rule constructed next, with equal probability. The maximum branch gives the guarantee when the largest rounded weight is large enough relative to the rounded optimum; the main branch handles the complementary case. Draw all coins, including unused branch coins, initially and independently of the weights.

=== 3.2 Candidates and weight groups <candidates-and-weight-groups>

For the main rule draw mutually independent masks $H \, D \, C \, T$, independently across labels, with respective membership probabilities $1 \/ 2 \, 1 \/ 4 \, t \, t$. Their roles are summarized below.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Mask
], table.cell(rowspan: 1, colspan: 1)[Probability
], table.cell(rowspan: 1, colspan: 1)[Role
]),
  table.cell(rowspan: 1, colspan: 1)[$H$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[Filters candidates by higher-priority span
],
  table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 4$
], table.cell(rowspan: 1, colspan: 1)[Lists weight groups and supplies density data
],
  table.cell(rowspan: 1, colspan: 1)[$C$
], table.cell(rowspan: 1, colspan: 1)[$t$
], table.cell(rowspan: 1, colspan: 1)[Supplies guards for the flat paths
],
  table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[$t$
], table.cell(rowspan: 1, colspan: 1)[Thins online eligibility independently of the paths
],
)
]

Reveal the fixed-vector weights on $H union D union C$ and sacrifice these labels. Under Lemma 3, these revealed weights are the corresponding sample coordinates. Membership in $T$ alone reveals no weight and forces no rejection. For each label $e$, let $H_(> e)$ be the labels in $H$ with higher priority than $e$. Define the candidate set and a comparison independent set by

#[#set math.equation(numbering: n => "(3.4)")
 $ U = { e in.not H : u_e > 0 \, med e in.not "cl" \( H_(> e) \) } \, #h(2em) Y = I^(*) \\ H . $ <eq:candidates>]

The full set $U$ is used for analysis; the candidate test itself is computable as soon as the weight of $e$ is known.

#thm([Lemma 3.1.])[
  (Candidate mass).  #emph[The set $Y$ is independent, $Y subset.eq U$, and 
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(E)_H u \( Y \) = W \/ 2 \, #h(2em) bb(E)_H u \( U \) lt.eq W . $ <eq:candidate-mass>]

]
] <lem:filter>

#proof[
  For $e in I^(*)$, no higher-priority labels span $e$, so neither do the higher-priority labels of $H$. This proves $Y subset.eq U$; its expectation follows from the fair mask. Conditional on all higher-priority memberships in $H$, the event $e in.not "cl" \( H_(> e) \)$ is fixed. Its contribution to $u \( U \)$ has the same expected weight as the event that $e$ belongs to $H$ and is selected by priority greedy on $H$. Sum over the positive labels. The resulting expected greedy weight on $H$ is at most $W$. ◻
]

Conditional on $H$, the #emph[true weight groups]

$ U_i = { e in U : u_e = B^i } \, #h(2em) n_i = \| U_i \| \, #h(2em) Y_i = Y ∩ U_i quad \( i in bb(Z) \) $

are fixed. Empty groups may be omitted. A group is #emph[listed] when $D ∩ U_i eq.not diameter$. Enumerate the listed groups as $G_1 \, dots.h \, G_m$ from lower to higher weight, and write $D_h = D ∩ G_h$, $C_h = C ∩ G_h$, and $T_h = T ∩ G_h$. The complete $D_h \, C_h$ are known before arrivals: every label of $D union C$ is revealed, and its candidate test uses only $H$ and its own weight. The algorithm needs neither the complete $G_h$ nor the true group sizes $n_i$. All candidates are nonloops.

=== 3.3 Density expansions <density-expansions>

For a listed group $h$ and a flat $P$, let $Q_h \( P \)$ be the largest flat maximizing

#[#set math.equation(numbering: n => "(3.6)")
 $ f_h \( Z \) = \| D_h ∩ Z \| - kappa "r" \( Z \) #h(2em) upright("over flats ") Z supset.eq P . $ <eq:density-objective>]

For a nonflat argument, take its closure first. The objective rewards the number of $D_h$ labels spanned and charges $kappa$ per unit of rank. Comparison with a further extension bounds its additional sample count by $kappa$ times its additional rank. A separate telescoping argument in Lemma 8 bounds the generators used over the entire path.

This is a contracted, sample-restricted form of the cardinality-minus-rank maximization associated with principal partitions; see Santiago, Sergeev, and Zenklusen #cite(label("SSZ25")) Section 3.1, Equation (1). We prove the needed monotonicity and residual-rank bounds directly.

#thm([Lemma 3.2.])[
  (Density expansion).  #emph[The largest maximizer in (3.6) exists, the map $Q_h$ is increasing, and $P subset.eq Q_h \( P \)$. If $Q = Q_h \( P \)$, then for every set $Z$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ \| D_h ∩ \( "cl" \( Q + Z \) \\ Q \) \| lt.eq kappa "r" \( Z divides Q \) . $ <eq:density-residual>]

]
] <lem:density>

#proof[
  The function $f_h$ is supermodular on the lattice of flats: the counting term is supermodular under intersection and closed union, and the negative rank term is supermodular by (2.2). There are finitely many flats. The closed union of any two maximizers containing $P$ is again a maximizer, so there is a largest one.
  For $P subset.eq P'$, put $Q = Q_h \( P \)$ and $Q' = Q_h \( P' \)$. The flat $Q ∩ Q'$ is feasible at $P$ and $"cl" \( Q union Q' \)$ is feasible at $P'$. Optimality gives one inequality and supermodularity the reverse:
  $ f_h \( Q ∩ Q' \) + f_h \( "cl" \( Q union Q' \) \) lt.eq f_h \( Q \) + f_h \( Q' \) lt.eq f_h \( Q ∩ Q' \) + f_h \( "cl" \( Q union Q' \) \) . $
  Equality in the two optimality comparisons shows that $"cl" \( Q union Q' \)$ is also a maximizer at $P'$. Its largest maximizer contains $Q$, as claimed. Finally compare $Q$ with the feasible flat $"cl" \( Q + Z \)$ in (3.6). The difference of their ranks is $"r" \( Z divides Q \)$, giving (3.7). ◻
]

=== 3.4 Nominal paths and guards <nominal-paths-and-guards>

Integer $k$ denotes an #emph[auxiliary time], unrelated to arrival time. Set $F_0 \( k \) = L$ for $k < 0$ and $F_0 \( k \) = E$ for $k gt.eq 0$. For each listed group, put $a_h = - 3 h$ and define an enabled expansion

$ Q_(h \, k) \( P \) = cases(delim: "{", Q_h \( P \) \, & k gt.eq a_h \,, P \, & k < a_h \,) #h(2em) \( P upright(" a flat") \) . $

In increasing group order, form its #emph[nominal] and #emph[guarded] paths

#[#set math.equation(numbering: n => "(3.8)")
 $ X_h \( k \) = Q_(h \, k) \( F_(h - 1) \( k \) \) \, #h(2em) F_h \( k \) = "cl" #scale(x: 120%, y: 120%)[\(] X_h \( k \) + \( C_h ∩ X_h \( k + 1 \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:paths>]

Thus a guard uses a label one auxiliary step before it enters the nominal path. Each density map uses only $D_h$ and the known matroid, and each guard set uses the revealed labels $C_h$. Consequently these flats can be computed as subsets of $E$ before arrivals, even though the weights of some labels they contain remain unknown.

#thm([Lemma 3.3.])[
  (Path properties).  #emph[The paths increase with $k$ and satisfy 
#[#set math.equation(numbering: n => "(3.9)")
 $ F_(h - 1) \( k \) subset.eq X_h \( k \) subset.eq F_h \( k \) subset.eq X_h \( k + 1 \) . $ <eq:path-inclusions>]

 They equal $E$ for $k gt.eq 0$. Moreover $X_h \( k \) = L$ for $k < a_h$ and $F_h \( k \) = L$ for $k < a_h - 1$. If $e$ is a nonloop, its nominal birth 
$ b_h \( e \) = min { k : e in X_h \( k \) } $

 is either $a_h$, with $e in Q_h \( L \)$, or belongs to $\[ a_h + 2 \, 0 \]$.]
] <lem:paths>

#proof[
  Induct on $h$. The map $Q_(h \, k)$ is increasing both in its argument and in $k$, since enabling it replaces the identity by an extensive increasing map. Thus $X_h$ and then $F_h$ are increasing. The first two inclusions in (3.9) are extensiveness; the last follows because both sets adjoined in the definition of $F_h \( k \)$ lie in the flat $X_h \( k + 1 \)$. The same recursion gives $E$ at times at least zero.
  For $h > 1$, $a_(h - 1) = a_h + 3$ and the inductive lower bound makes $F_(h - 1) \( k \) = L$ for $k < a_h + 2$; this also holds for $h = 1$ directly from $F_0$. Before $a_h$ the new map is the identity, proving the asserted lower bounds for $X_h$ and $F_h$. At $a_h$ and $a_h + 1$, the nominal flat is the same flat $Q_h \( L \)$, so no nonloop is born at $a_h + 1$. ◻
]

=== 3.5 The online decisions <the-online-decisions>

Choose an independent fair parity $epsilon in { 0 \, 1 }$ and put $hat(F) \( k \) = F_m \( k \)$. When $m = 0$, use $hat(F) = F_0$ and reject all arrivals. In general the layer endpoints are the integers $b equiv epsilon med \( mod med 2 \)$, with layer $\( b - 2 \, b \]$ having base $hat(F) \( b - 2 \)$. The rule maintains a set $A_b subset.eq hat(F) \( b \)$ in each layer, independent over its base $hat(F) \( b - 2 \)$. Since successive layers share an endpoint, all labels selected in an earlier layer lie in the base of every later layer. Greedy selection in alternating restriction–contraction minors also appears in Feldman, Svensson, and Zenklusen #cite(label("FSZ15")) Section 3; here the nested flats come from the guarded density paths.

At arrival of a label $e$, perform the following operations.

+ Reject if $e in H union D union C$, if its candidate test fails, or if its rounded weight is not listed.
+ For its listed group $h$, compute $b = b_h \( e \)$. Reject unless
  #[#set math.equation(numbering: n => "(3.10)")
   $ e in T \, #h(2em) b gt.eq a_h + 2 \, #h(2em) b equiv epsilon med \( mod med 2 \) \, #h(2em) e in.not hat(F) \( b - 2 \) . $ <eq:eligibility>]
+ Let $A_b$ be the previously accepted labels assigned to this layer. Accept $e$ exactly when $"r" \( { e } divides hat(F) \( b - 2 \) + A_b \) = 1$, and then add it to $A_b$.

These operations use the revealed data, the arriving label and weight, the seed, and the previous decisions. In particular, no full true weight group or future arrival is needed. By Lemma 6, the three-step activation schedule leaves no birth at $a_h + 1$. Excluding the baseline birth $a_h$ therefore leaves exactly the births for which $b - 2 gt.eq a_h$: the density map is already enabled at the preceding layer endpoint. Figure 1 shows both the guard step and the nesting that makes layerwise decisions feasible.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F_(h-1)(k)$]]])])
  content((3.746, 0), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_h(k)$]]])])
  content((8.182, 0), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F_h(k)$]]])])
  content((8.182, 1.989), [#text(size: 9pt)[$C_h inter X_h(k+1)$]])
  line((0.7788, 0), (3.079, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.873, 0), [#text(size: 9pt)[$Q_(h,k)$]], anchor: "south", padding: 0.1176cm)
  line((4.414, 0), (7.514, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.964, 0), [#text(size: 9pt)[adjoin and close]], anchor: "north", padding: 0.1176cm)
  line((8.182, 1.706), (8.182, 0.4057), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -3.551), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$hat(F) (b-2)$]]])])
  content((3.746, -3.551), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$hat(F) (b)$]]])])
  content((8.182, -3.551), [#box(inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#16405f"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$hat(F) (b+2)$]]])])
  line((0.874, -3.551), (3.031, -3.551), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.873, -3.651), [#text(size: 9pt)[layer $(b-2,b]$#linebreak()accept $A_b$]], anchor: "north", padding: 0.1176cm)
  line((4.462, -3.551), (7.308, -3.551), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.964, -3.651), [#text(size: 9pt)[layer $(b,b+2]$#linebreak()accept $A_(b+2)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Above: a density expansion followed by guards from the next nominal time gives $F_h \( k \) subset.eq X_h \( k + 1 \)$. Below: two consecutive layers of the chosen parity on the final path. The set $A_b$ is independent over $hat(F) \( b - 2 \)$ and lies in $hat(F) \( b \)$; $A_(b + 2)$ is independent over this latter base. In the lower panel, the horizontal order is auxiliary time, regardless of the actual arrival order. ],
) <fig:paths>

#thm([Lemma 3.4.])[
  (Feasibility and measurability).  #emph[The main rule maintains an independent accepted set at every arrival prefix, for every permutation. It is a measurable rule based only on the allowed information.]
] <lem:feasibility>

#proof[
  Every eligible label at endpoint $b$ lies in $X_h \( b \) subset.eq hat(F) \( b \)$. The accepted set of its layer is independent over $hat(F) \( b - 2 \)$. In increasing auxiliary endpoint order, all earlier accepted layers lie in that base flat, so extending by the current layer preserves independence. This proves independence of the union for any interleaving of arrivals, and of every prefix.
  All masks are drawn initially and the matroid is known. Each density maximization is over finitely many flats. By Lemma 6, it is enough to compute a finite interval of integer times for the at most $\| E \|$ listed groups. Positive rounding has countably many measurable level sets; each realized vector has finitely many occupied levels. All remaining operations are finite rank tests, comparisons, and set operations with fixed tie rules. They therefore define measurable decisions. Zeros are never passed to a logarithm, and loops fail the candidate test. ◻
]

=== 3.6 A generator budget for the entire path <a-generator-budget-for-the-entire-path>

The rule is now fully specified. To analyze it, we need a bound on how much each density expansion can change the path. Bounding the rank increase separately at each time would charge the same sample labels repeatedly. The next lemma instead chooses one set of generators for all times. It also bounds the independent sampled mass excluded by the baseline-birth condition.

#thm([Lemma 3.5.])[
  (A generator budget for the entire path).  #emph[For each listed group $h$ there is a set $J_h subset.eq D_h$ and increasing subsets $J_h \( k \) subset.eq J_h$ such that 
#[#set math.equation(numbering: n => "(3.11)")
 $ X_h \( k \) = "cl" \( F_(h - 1) \( k \) + J_h \( k \) \) \, #h(2em) \| J_h \| lt.eq \| D_h \| \/ kappa . $ <eq:generator-budget>]

 In particular $"r" \( Q_h \( L \) \) lt.eq \| D_h \| \/ kappa$.]
] <lem:generators>

#proof[
  Before $a_h$ no generators are needed. Process the enabled times $k = a_h \, a_h + 1 \, dots.h \, 0$ in order. Given the preceding generators, set
  $ P_k = "cl" \( F_(h - 1) \( k \) + X_h \( k - 1 \) \) . $
  By monotonicity, $P_k subset.eq X_h \( k \)$. It is feasible in the maximization defining $X_h \( k \)$, whence
  $ kappa #scale(x: 120%, y: 120%)[\(] "r" \( X_h \( k \) \) - "r" \( P_k \) #scale(x: 120%, y: 120%)[\)] & lt.eq \| D_h ∩ X_h \( k \) \| - \| D_h ∩ P_k \|\
 & lt.eq \| D_h ∩ X_h \( k \) \| - \| D_h ∩ X_h \( k - 1 \) \| . $
  The flat $R_k = "cl" \( F_(h - 1) \( k \) + \( D_h ∩ X_h \( k \) \) \)$ is contained in $X_h \( k \)$ and has exactly the same $D_h$ count. If this inclusion were proper, $R_k$ would have smaller rank, since a proper subflat has smaller rank. It would then improve the objective, contradicting optimality. Thus $R_k = X_h \( k \)$, and the extension over $P_k$ has a basis chosen from $D_h ∩ X_h \( k \)$.
  Adjoin such a basis to the generators, choosing by the fixed label order. Since $F_(h - 1)$ increases, the preceding generators together with $F_(h - 1) \( k \)$ already generate $P_k$. This proves the first identity inductively. The new generators are distinct, and their counts satisfy the displayed inequality. Summing it telescopes the $D_h$ counts and gives $\| J_h \| lt.eq \| D_h \| \/ kappa$. Extend the generator sets constantly for $k > 0$. At $k = a_h$, the lower-group flat is $L$, yielding the last assertion. ◻
]

For the analysis, we first work on a group’s own nominal path. The next section shows that earlier groups’ guards protect a constant fraction of its independent sampled mass against lower-weight competition. We then transfer this sampled count to unsacrificed rank. Later groups’ path expansions will be paid for by a single rank budget in Section 6.

== 4 Reverse exposure and safe samples <sec:safety>

The guards from lower-weight groups serve two purposes. They determine the paths, and they protect a sampled label against lower-weight competition in its layer. We relate these purposes by exposing the guard mask backwards in auxiliary time. A label leaves its nominal flat at a step having a reasonably large conditional exit probability with constant probability. A comparison using the test mask then turns the square of that exit probability into a safety guarantee.

Fix $H \, D$ and a listed group $h$ throughout this section. Thus the groups, their indices, the density maps, and $Y$ are fixed. As elsewhere, the deterministic $M \, w$ are suppressed from conditioning. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ K_(h \, b) = union.big_(j < h) #scale(x: 120%, y: 120%)[\(] T_j ∩ \( X_j \( b \) \\ X_j \( b - 1 \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:competition-set>]

This set contains all possible eligible lower-weight competitors at endpoint $b$, and is contained in $F_(h - 1) \( b \)$. It includes test-mask memberships on sacrificed labels; this only enlarges the comparison set. Let $sigma_h$ count the labels $d in D_h ∩ Y$ whose birth $b$ on $X_h$ satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ a_h + 2 lt.eq b lt.eq 0 \, #h(2em) b equiv epsilon med \( mod med 2 \) \, #h(2em) d in.not Q_h #scale(x: 120%, y: 120%)[\(] F_(h - 1) \( b - 2 \) + K_(h \, b) #scale(x: 120%, y: 120%)[\)] . $ <eq:safe-definition>]

These are analysis quantities; the online rule does not compute them. Our objective is Lemma 11: a constant fraction of $D_h ∩ Y$ contributes to $sigma_h$ in expectation, apart from the loss $\| D_h \| \/ kappa$. We first expose the guards backwards so that each step queries only previously untouched bits. A bound on disjoint positive certificates then locates an exit of substantial conditional probability. Comparing two transitions at that exit will establish the exclusion in (4.2).

=== 4.1 The reverse computation and its filtration <the-reverse-computation-and-its-filtration>

The guard mask was drawn as part of the initial seed and may be fully known to the adversary. Reverse exposure analyzes that mask’s product law; it introduces no new online randomness and does not restrict the adversary’s information.

For $k < 0$, a later state $S = \( S_j : j lt.eq h \)$ and a guard-bit vector $c$, define a one-step map $cal(G)_k \( c \, S \)$ as follows:

#[#set math.equation(numbering: n => "(4.3)")
 $ A_0 & = F_0 \( k \) \, #h(2em) N_j = Q_(j \, k) \( A_(j - 1) \) \,\
A_j & = "cl" #scale(x: 120%, y: 120%)[\(] N_j + { e in G_j ∩ S_j : c_e = 1 } #scale(x: 120%, y: 120%)[\)] quad \( 1 lt.eq j lt.eq h \) . $ <eq:reverse-map>]

Its output is $\( N_j : j lt.eq h \)$. The map is increasing in $k$, in each coordinate of $S$, and in the bits $c$, by monotonicity and extensivity of the density maps. We may view $c$ as a bit vector on the fixed union of the groups, even though only its restrictions to $G_j ∩ S_j$ are used.

Starting with $X_j \( 0 \) = E$, compute $X \( k \)$ at $k = - 1 \, - 2 \, dots.h \, a_h - 1$ using

$ X \( k \) = cal(G)_k \( C \, X \( k + 1 \) \) . $

This is exactly the defining path recursion. For an actual later state $S = X \( k + 1 \)$, the new $N_j$ is contained in $S_j$ for every choice of $c$. Indeed, inductively $A_(j - 1) subset.eq S_(j - 1) subset.eq F_(j - 1) \( k + 1 \)$, so $N_j subset.eq Q_(j \, k + 1) \( F_(j - 1) \( k + 1 \) \) = S_j$; all the guard additions forming $A_j$ also belong to $S_j$. For $j = 1$, use $F_0 \( k \) subset.eq F_0 \( k + 1 \)$ to begin the induction.

After computing $N_j$, inspect only the bits on

#[#set math.equation(numbering: n => "(4.4)")
 $ G_j ∩ \( S_j \\ N_j \) . $ <eq:departing-query>]

The omitted additions inside $N_j$ do not change its closure. Fix a label order within each such batch. Its domain is determined before its first query: $N_j$ uses only previous groups’ bits. The groups are disjoint and their domains shrink at each reverse step, so no coordinate is ever queried twice.

Let $cal(H)_b$ be the sigma-field generated by the complete transcript just before the step from $X \( b \)$ to $X \( b - 1 \)$, including the queried labels, their answers, and the states obtained from them. Thus $cal(H)_b subset.eq cal(H)_(b - 1)$ as reverse time advances. Conditional on $cal(H)_b$, the unqueried bits on

$ V_b = union.big_(j lt.eq h) \( G_j ∩ X_j \( b \) \) $

are jointly independent Bernoulli bits of rate $t$. Indeed, the unqueried coordinates are exactly these domains, and each preceding query was chosen from its prior transcript. In particular, the conditional transition law is (4.3) with fresh product bits. The transcript reveals no test bits, parity, or flat at a smaller time that has not yet been computed.

For a fixed nonloop $d$, on ${ d in X_h \( b \) }$ define the predictable exit probability

#[#set math.equation(numbering: n => "(4.5)")
 $ p_(b - 1) = bb(P) #scale(x: 120%, y: 120%)[\(] d in.not X_h \( b - 1 \) divides cal(H)_b #scale(x: 120%, y: 120%)[\)] . $ <eq:exit-probability>]

Set $p_(b - 1) = 0$ when $d in.not X_h \( b \)$. Before exit, these probabilities are nondecreasing in the order of the reverse computation. To see this, evaluate each conditional transition probability with an independent product mask $xi$ on the whole union of the groups. Smaller time and smaller input state give a smaller output under this same $xi$. Taking probabilities proves the assertion even though the domains of the unqueried bits change.

=== 4.2 Certificates and exit mass <certificates-and-exit-mass>

To control exits at steps with $p_(b - 1) < eta$, we consider bands of comparable exit probabilities. We will show that each survival within a band certifies one fixed increasing event using only that step’s newly queried positive bits. The next lemma bounds how many such disjoint certificates can occur.

An increasing Boolean event is a family $cal(A) subset.eq 2^V$ closed under taking supersets. A positive certificate for $cal(A)$ is a set $I$ with $I in cal(A)$: setting the coordinates in $I$ to one already forces the event, whatever the other bits are.

#thm([Lemma 4.1.])[
  (Disjoint-query certificates).  #emph[Let $V_0$ be finite, let its bits be independent Bernoulli random variables, and let $cal(A) subset.eq 2^(V_0)$ be increasing with failure probability $delta > 0$. An adaptive procedure queries each coordinate at most once and divides its queries into transactions. The next query, transaction boundaries, and stopping decisions depend only on the transcript and, if desired, an independent auxiliary seed. Suppose the number of transactions has a deterministic finite bound. A transaction may be declared successful only if the positive bits queried within that transaction alone form a certificate for $cal(A)$. Then 
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) \[ upright("number of successful transactions") \] lt.eq log \( 1 \/ delta \) . $ <eq:certificate-budget>]

 Here and below $log$ denotes the natural logarithm.]
] <lem:transactions>

#proof[
  Condition on the auxiliary seed, if present. Conditional on every possible query transcript, all unqueried bits retain their joint original product law: the transcript specifies values only at the coordinates it queries. This follows by induction over the successive, predictably chosen queries.
  For a remaining coordinate set $V subset.eq V_0$, let $p \( V \)$ be the failure probability of $cal(A)$ when the bits on $V$ have their original laws and all other bits are zero. If $I$ is the set of positive bits already queried in the current transaction, let $p_I \( V \)$ be the same failure probability with the bits on $I$ forced to one. Monotonicity gives
  $ delta lt.eq p \( V \) lt.eq 1 \, #h(2em) 0 lt.eq p_I \( V \) lt.eq p \( V \) \, #h(2em) p \( V \\ { e } \) gt.eq p \( V \) . $
  The ratio $Z = p_I \( V \) \/ p \( V \)$ starts each transaction at one.
  Suppose the next query is $e in V$, whose success probability is $q_e$. Write $V' = V \\ { e }$, and let $Z'$ be the ratio after that query. The one-coordinate identity
  $ p_I \( V \) = \( 1 - q_e \) p_I \( V' \) + q_e p_(I union { e }) \( V' \) $
  holds conditional on the full current transcript. In particular, the denominator $p \( V' \)$ is the same for either answer, so the exact expected decrement and its logarithmic bound are
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) \[ Z - Z' divides upright("current transcript") \] & = Z (1 - frac(p \( V \), p \( V' \)))\
 & = Z (1 - e^(- \( log p \( V' \) - log p \( V \) \))) lt.eq log p \( V' \) - log p \( V \) . $ <eq:log-resource>]
  The last inequality uses $0 lt.eq Z lt.eq 1$ and $1 - e^(- x) lt.eq x$ for $x gt.eq 0$.
  At the end of a successful transaction, the certificate forces $p_I \( V \) = 0$, so $Z = 0$. At every other transaction end, $0 lt.eq Z lt.eq 1$. Thus its success indicator is at most its realized net decrement $1 - Z_(upright("end"))$. Summing (4.7) over its queries and taking conditional expectations bounds its success probability by the expected increase of $log p \( V \)$. Reset $I$ to the empty set for the next transaction, but keep the depleted $V$. The logarithmic increments then telescope across all transactions. Their total is at most $0 - log p \( V_0 \) = log \( 1 \/ delta \)$.
  This summation also covers adaptive stopping: there are at most $\| V_0 \|$ queries and a bounded number of transactions, so one may pad every stopped sequence with zero increments and sum a deterministic finite number of conditional identities. No stopping-time limit is required. ◻
]

#thm([Lemma 4.2.])[
  (Exit mass).  #emph[Every nonloop $d$ exits its $h$-th nominal path by the end of the reverse computation, and 
#[#set math.equation(numbering: n => "(4.8)")
 $ bb(P) \( d upright(" exits at a step with ") p_(b - 1) < eta divides H \, D \) < 1 / 2 . $ <eq:low-exit-hazard>]

 Consequently, 
#[#set math.equation(numbering: n => "(4.9)")
 $ sum_(b = a_h)^0 bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ d in X_h \( b \) }) p_(b - 1)^2 divides H \, D #scale(x: 120%, y: 120%)[\]] gt.eq eta / 2 . $ <eq:squared-exit-mass>]

]
] <lem:exit>

#proof[
  Fix $p_0 > 0$ and consider steps, before exit, whose conditional exit probability lies in $\[ p_0 \, 2 p_0 \)$. By monotonicity they form one block, possibly empty. Its first step is determined by the pre-step transcript, since the exit probabilities are predictable. Condition on a possible transcript there, with time $k_0$ and input state $S^0$. On the fresh bits in $V_0 = union.big_(j lt.eq h) \( G_j ∩ S_j^0 \)$, fix the increasing event
  $ cal(A) = { c : d in \( cal(G)_(k_0) \( c \, S^0 \) \)_h } . $
  Its failure probability $delta$ is at least $p_0$.
  Treat the queries within each subsequent step of the block as one transaction. If that step does not exit, its own positive queried bits alone certify $cal(A)$. Here is the reason that earlier positive answers are unnecessary. Hold this step’s actual incoming state $S$ fixed, and let $I$ consist only of its queried positives. Write $c_e^I = upright(bold(1))_({ e in I })$. Evaluating $cal(G)_k \( c^I \, S \)$, with every other guard bit set to zero, gives the same output as the actual step. Inductively in $j$, the new $N_j$ is unchanged, all positive guard additions outside $N_j$ were queried and belong to $I$, and omitted additions inside $N_j$ are already spanned. Previously queried coordinates are outside the current domains. Finally $k lt.eq k_0$ and $S subset.eq S^0$ coordinatewise, so
  $ cal(G)_k \( c^I \, S \) subset.eq cal(G)_(k_0) \( c^I \, S^0 \) . $
  Non-exit in the actual step therefore implies $I in cal(A)$. The incoming state is held fixed in this comparison; no earlier state is recomputed after previous positive bits are erased.
  All transactions consume distinct coordinates. Lemma 9 bounds the conditional expected number of non-exit steps in this block by $log \( 1 \/ delta \) lt.eq log \( 1 \/ p_0 \)$. There is at most one exit step. Thus, also without conditioning on the entry transcript, the expected number of steps in this range is at most $log \( 1 \/ p_0 \) + 1$. Summing their conditional exit probabilities bounds the probability of exit in this range by
  $ 2 p_0 #scale(x: 120%, y: 120%)[\(] log \( 1 \/ p_0 \) + 1 #scale(x: 120%, y: 120%)[\)] . $
  For $p_0 = 2^(- \( ell + 1 \))$, sum this bound over $ell gt.eq 12$ to obtain
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_(ell = 12)^oo 2^(- ell) #scale(x: 120%, y: 120%)[\(] \( ell + 1 \) log 2 + 1 #scale(x: 120%, y: 120%)[\)] = 2^(- 11) \( 14 log 2 + 1 \) < 1 / 2 . $ <eq:dyadic-exit>]
  An exit at a step with conditional probability zero has probability zero, since there are finitely many steps. Also $X_h \( a_h - 1 \) = L$, so every nonloop exits. This proves (4.8).
  The total exit mass at steps having $p_(b - 1) gt.eq eta$ is at least $1 \/ 2$. For those steps $p_(b - 1)^2 gt.eq eta p_(b - 1)$, and $upright(bold(1))_({ d in X_h \( b \) }) p_(b - 1)$ has expectation equal to the probability of exit at that step. Summing gives (4.9). ◻
]

=== 4.3 A hybrid transition <a-hybrid-transition>

Lemma 10 supplies mass for squared exit probabilities. To use it, we compare the ordinary guard transition with a second transition that has the same conditional law but incorporates the test bits of departing labels. The joint exit of the two transitions will imply protection against the competitors in $K_(h \, b)$.

Fix an endpoint $a_h + 2 lt.eq b lt.eq 0$ and a pre-step transcript $cal(H)_b$. Perform the ordinary step from $S = X \( b \)$ to $S' = X \( b - 1 \)$, obtaining its complete transcript $cal(H)_(b - 1)$. Both transitions start from the same frozen input $S$; the ordinary output $S'$ determines which source supplies each hybrid bit:

#[#set math.equation(numbering: n => "(4.11)")
 $ upright("coordinates ") e & upright("ordinary guard-bit status") & tilde(c)_e\
G_j ∩ S'_j & upright("unqueried") & upright(bold(1))_({ e in C })\
G_j ∩ \( S_j \\ S'_j \) & upright("queried in this step") & upright(bold(1))_({ e in T }) $ <eq:hybrid-bits>]

Let $tilde(N) = cal(G)_(b - 1) \( tilde(c) \, S \)$, and write $tilde(A)_j$ for its intermediate flats in (4.3).

Conditional on the #emph[complete] ordinary-step transcript, the partition in (4.11) is fixed. The retained $C$-bits on $G_j ∩ S'_j$ have never been queried, so all of them jointly retain their independent rate-$t$ laws. No $T$-bit has been queried, and the entire test mask is independent of the guard mask. Consequently the whole hybrid vector on the input domains has the fresh product law, conditional on $cal(H)_(b - 1)$. Its output law is the ordinary transition law determined by the earlier $cal(H)_b$.

In particular, on ${ d in X_h \( b \) }$, $bb(P) \( d in.not tilde(N)_h divides cal(H)_(b - 1) \) = p_(b - 1)$. The tower property therefore gives

#[#set math.equation(numbering: n => "(4.12)")
 $ & bb(P) \( d in X_h \( b \) \, med d in.not X_h \( b - 1 \) \, med d in.not tilde(N)_h divides cal(H)_b \)\
 & quad = bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ d in X_h \( b \) }) upright(bold(1))_({ d in.not X_h \( b - 1 \) }) p_(b - 1) divides cal(H)_b #scale(x: 120%, y: 120%)[\]] = upright(bold(1))_({ d in X_h \( b \) }) p_(b - 1)^2 . $ <eq:double-exit>]

More generally, the ordinary and hybrid outputs are independent with the same law conditional on the pre-step transcript. This assertion is for one endpoint at a time. The same mask $T$ is reused at all endpoints, and no joint independence of the different hybrid experiments is asserted or needed.

The hybrid also has a deterministic containment property:

#[#set math.equation(numbering: n => "(4.13)")
 $ Q_h #scale(x: 120%, y: 120%)[\(] F_(h - 1) \( b - 2 \) + K_(h \, b) #scale(x: 120%, y: 120%)[\)] subset.eq tilde(N)_h . $ <eq:hybrid-containment>]

To prove it, induct over $j < h$. If $tilde(A)_(j - 1) supset.eq F_(j - 1) \( b - 2 \)$, monotonicity gives

$ tilde(N)_j = Q_(j \, b - 1) \( tilde(A)_(j - 1) \) supset.eq Q_(j \, b - 2) \( F_(j - 1) \( b - 2 \) \) = X_j \( b - 2 \) . $

The retained guards in (4.11) include exactly $C_j ∩ X_j \( b - 1 \)$, which are the guards used to form $F_j \( b - 2 \)$. Hence $tilde(A)_j supset.eq F_j \( b - 2 \)$. The hybrid additions also include every $T$-positive in $G_j ∩ \( X_j \( b \) \\ X_j \( b - 1 \) \)$. Extensivity preserves the analogous test additions from earlier groups. Starting with $F_0 \( b - 1 \) supset.eq F_0 \( b - 2 \)$, the induction therefore proves

$ tilde(A)_(h - 1) supset.eq "cl" #scale(x: 120%, y: 120%)[\(] F_(h - 1) \( b - 2 \) + K_(h \, b) #scale(x: 120%, y: 120%)[\)] . $

The focal map $Q_(h \, b - 1) = Q_h$ is enabled, so another application of monotonicity proves (4.13). This is an inclusion for every completed assignment of the bits; it does not condition on the not-yet-exposed flat $F_(h - 1) \( b - 2 \)$.

An ordinary exit at this step means that $d$ has birth $b$. If it also exits the hybrid, (4.13) gives its safety exclusion. Thus (4.12) implies

#[#set math.equation(numbering: n => "(4.14)")
 $ & bb(P) #scale(x: 120%, y: 120%)[\(] b_h \( d \) = b \, quad d in.not Q_h \( F_(h - 1) \( b - 2 \) + K_(h \, b) \) divides H \, D #scale(x: 120%, y: 120%)[\)]\
 & #h(25mm)  gt.eq bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ d in X_h \( b \) }) p_(b - 1)^2 divides H \, D #scale(x: 120%, y: 120%)[\]] #h(2em) \( a_h + 2 lt.eq b lt.eq 0 \) . $ <eq:birth-safety-probability>]

These bounds may be summed by linearity. For a fixed label the actual birth events at distinct endpoints are disjoint.

#thm([Lemma 4.3.])[
  (Safe sampled labels).  #emph[For every listed group $h$, 
#[#set math.equation(numbering: n => "(4.15)")
 $ bb(E) \[ sigma_h divides H \, D \] gt.eq eta / 4 \| D_h ∩ Y \| - frac(\| D_h \|, kappa) . $ <eq:safe-samples>]

]
] <lem:safe>

#proof[
  Apply Lemma 10 to each $d in D_h ∩ Y$. By Lemma 6, the only birth excluded from the range $a_h + 2 lt.eq b lt.eq 0$ is the baseline birth $a_h$; a birth at $a_h + 1$ is impossible. Since $p^2 lt.eq p$, the total discarded contribution is at most
  $ sum_(d in D_h ∩ Y) bb(P) \( b_h \( d \) = a_h divides H \, D \) = \| D_h ∩ Y ∩ Q_h \( L \) \| lt.eq "r" \( Q_h \( L \) \) lt.eq frac(\| D_h \|, kappa) . $
  Here $Y$ is independent in the matroid, and the last inequality is the generator bound of Lemma 8. Summing (4.14) over labels and valid birth times therefore gives a pre-parity expected safe count at least
  $ eta / 2 \| D_h ∩ Y \| - frac(\| D_h \|, kappa) . $
  The independent fair parity keeps each such label with probability $1 \/ 2$. Consequently the stronger lower bound $eta \| D_h ∩ Y \| \/ 4 - \| D_h \| \/ \( 2 kappa \)$ holds, which implies (4.15). ◻
]

== 5 From safe samples to unobserved rank <sec:transfer>

We continue with the fixed matroid and hidden weight vector, suppressing them in all conditional expectations. The next step turns the safe sample estimate into rank available on labels outside the revealed mask. The paths themselves depend on that mask, so the argument needs a uniform bound on the sets that the paths can leave unspanned.

Write $O = D union C$. For a listed group $h$, let

$ cal(B)_h = { b in bb(Z) : a_h + 2 lt.eq b lt.eq 0 \, med b equiv epsilon med \( mod med 2 \) } \, #h(2em) P_(h \, b) = G_h ∩ #scale(x: 120%, y: 120%)[\(] X_h \( b \) \\ X_h \( b - 1 \) #scale(x: 120%, y: 120%)[\)] quad \( b in cal(B)_h \) . $

Put $P_(h \, b) = diameter$ for other endpoints of the chosen parity, and define the nominal rank statistic

#[#set math.equation(numbering: n => "(5.1)")
 $ z_h = sum_(b in cal(B)_h) "r" #scale(x: 120%, y: 120%)[\(] P_(h \, b) \\ O divides X_h \( b - 2 \) union K_(h \, b) #scale(x: 120%, y: 120%)[\)] . $ <eq:nominal-rank>]

This statistic measures rank before thinning by the focal mask $T_h$ and before replacing $X_h$ by the final path $hat(F)$. The result needed for the final accounting is the following estimate.

#thm([Lemma 5.1.])[
  (Sample-to-rank transfer).  #emph[Fix $H$. For a true group $U_i$, define $z_i = z_h$ and $sigma_i = sigma_h$ if the group is listed with index $h$, and set both quantities to zero if it is unlisted. If $n_i gt.eq kappa$, then 
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) \[ z_i divides H \] gt.eq frac(gamma \| Y_i \| - 2^(- 23) n_i, kappa) \, #h(2em) gamma = eta / 16 = 2^(- 16) . $ <eq:rank-transfer>]

]
] <lem:transfer>

We first relate $z_h$ to the safe sampled count $sigma_h$. Choose enough unsacrificed labels to witness the rank in each summand of (5.1). A safe sample spanned by these witnesses over its summand’s base can be charged to their rank by the density bound. Every other safe sample belongs to a residual set contained in the revealed mask. The main task will be to bound this residual uniformly over the masks that determine it.

For each summand choose a basis extension $Z_b subset.eq P_(h \, b) \\ O$ over $X_h \( b - 2 \) union K_(h \, b)$. Thus

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_b \| Z_b \| = z_h \, #h(2em) P_(h \, b) \\ O subset.eq "cl" #scale(x: 120%, y: 120%)[\(] X_h \( b - 2 \) union K_(h \, b) union Z_b #scale(x: 120%, y: 120%)[\)] . $ <eq:rank-witnesses>]

The sets $Z_b$ are disjoint, since the birth sets $P_(h \, b)$ are disjoint. We may choose them by a fixed label order. Set

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(R)_h = union.big_(b in cal(B)_h) (P_(h \, b) \\ "cl" #scale(x: 120%, y: 120%)[\(] X_h \( b - 2 \) union K_(h \, b) union Z_b #scale(x: 120%, y: 120%)[\)]) . $ <eq:residual-set>]

By (5.3), $cal(R)_h subset.eq O$.

There is a deterministic comparison with the safe count from Section 4:

#[#set math.equation(numbering: n => "(5.5)")
 $ sigma_h lt.eq kappa z_h + \| cal(R)_h \| . $ <eq:safe-residual>]

Indeed, fix $b in cal(B)_h$ and put $Q'_b = Q_h \( F_(h - 1) \( b - 2 \) union K_(h \, b) \)$. Since $b - 2 gt.eq a_h$, monotonicity of the density map gives

$ X_h \( b - 2 \) = Q_h \( F_(h - 1) \( b - 2 \) \) subset.eq Q'_b \, #h(2em) K_(h \, b) subset.eq Q'_b . $

A safe sample at $b$ outside $cal(R)_h$ belongs to $D_h ∩ \( "cl" \( Q'_b union Z_b \) \\ Q'_b \)$. The residual density inequality (3.7) bounds the number of these samples by $kappa "r" \( Z_b divides Q'_b \) lt.eq kappa \| Z_b \|$. Summing proves (5.5).

=== 5.1 Counting marked pivots <counting-marked-pivots>

The selected set $cal(R)_h$ depends on the focal group’s mask. We control it by constructing, before those bits are revealed, a small family containing every possible such residual with $z_h lt.eq \| G_h \| \/ kappa$. The following combinatorial lemma supplies a bound that does not depend on the number of times at which a path can change.

#thm([Lemma 5.2.])[
  (Marked pivots).  #emph[Let $M$ be any finite matroid, and let $V$ be a set of $n$ nonloops. Let $s gt.eq 0$ be an integer. Fix an ordered sequence of labeled #emph[old occurrences], each with a mark in ${ 0 \, 1 }$, whose labels span $E$. Also fix at most $s$ labeled #emph[movable occurrences]. Repetitions of labels are allowed in both sequences. Insert the movable occurrences into the old sequence in any order and positions, and give each movable occurrence either mark. For $f in V$, its pivot is the first occurrence after whose insertion $f$ is spanned; record that occurrence’s mark. The number of resulting vectors of $n$ marks is at most 
#[#set math.equation(numbering: n => "(5.6)")
 $ 4^s sum_(ell = 0)^s binom(n, ell) \, $ <eq:pivot-pattern-bound>]

 where $binom(n, ell) = 0$ for $ell > n$.]
] <lem:pivot-patterns>

#proof[
  We first bound the possible bases retained by greedy processing of an interleaving. Remove every old occurrence whose label is spanned by its old predecessors. This leaves the span after every old prefix unchanged. Such an occurrence remains redundant after any insertions, so its removal preserves all pivot marks. The surviving old labels form an ordered basis $b_1 \, dots.h \, b_r$ of $M$. Write $B_j = { b_1 \, dots.h \, b_j }$, and let $A$ denote all specified movable occurrences, with rank interpreted through their labels.
  For each old position define
  $ Delta_j = "r" \( A divides B_(j - 1) \) - "r" \( A divides B_j \) = 1 - "r" \( { b_j } divides B_(j - 1) union A \) in { 0 \, 1 } . $
  These numbers are fixed before any insertions are chosen, and $sum_j Delta_j = "r" \( A \) lt.eq s$. If $Delta_j = 0$, then $b_j$ increases rank even after all of $A$ has been adjoined to $B_(j - 1)$, and hence it increases rank in every interleaving. Thus greedy processing of an interleaving can omit old occurrences only at the at most $s$ positions with $Delta_j = 1$. There are at most $2^s$ choices of omitted old occurrences and at most $2^s$ choices of retained movable occurrences. Consequently the retained greedy basis, regarded as a collection of occurrences, has at most $4^s$ possibilities.
  Fix one such basis $J$. We next identify each pivot from a spanning subset of $J$, independently of how the other occurrences were inserted. For every $f in V$ there is a unique minimal subset $S_f subset.eq J$ that spans $f$. To verify uniqueness using only matroid rank, suppose $S \, T subset.eq J$ both span $f$. Submodularity applied to $S union { f }$ and $T union { f }$ gives
  $ \| S \| + \| T \| gt.eq \| S union T \| + "r" \( \( S ∩ T \) union { f } \) \, $
  so $S ∩ T$ also spans $f$. Intersecting the finitely many spanning subsets proves the assertion. The support $S_f$ is nonempty because $f$ is a nonloop. At every prefix, the retained greedy occurrences span exactly the same flat as the full prefix. It follows that the pivot of $f$ is the last occurrence of $S_f$ in the interleaving.
  It remains to count the possible marks of these last support members. For this fixed $J$, assign its retained old occurrences, in their prescribed order, fixed absolute scores $2^(s + 1) \, 2^(2 \( s + 1 \)) \, dots.h$, with positive sign for mark $1$ and negative sign for mark $0$. There are at least $s$ unused integer powers of $2$ before the first old score and between successive old scores; reserve another $s$ powers after the last. Every order of the retained movable occurrences can therefore be represented by assigning them distinct unused powers in the appropriate gaps, in that order, with either sign according to their marks. If no old occurrence is retained, simply use distinct powers for the movable occurrences. Every absolute score then exceeds the sum of all preceding absolute scores.
  Let the signed scores of the retained movable occurrences be real variables, at most $s$ in number. For each $f$, the sum of scores over $S_f$ is an affine function of these variables, whose constant term is the sum of the fixed old scores in $S_f$. At the representations just constructed this sum is nonzero, and its sign is precisely the mark of the last member of $S_f$. Thus every pivot-mark vector for $J$ is a strict sign pattern of $n$ affine functions in dimension at most $s$.
  The remaining estimate is the classical region bound for affine hyperplane arrangements; see Schläfli #cite(label("Schlafli1901")) Section 16, pp. 39–40. We include the recurrence and its degenerate cases: $n$ affine functions in dimension $d$ have at most $sum_(ell = 0)^d binom(n, ell)$ strict sign patterns. A prescribed strict pattern defines an open convex region. Adding a proper affine hyperplane splits at most as many existing regions as there are regions of the induced arrangement on that hyperplane, giving the recurrence $N \( n \, d \) lt.eq N \( n - 1 \, d \) + N \( n - 1 \, d - 1 \)$, with $N \( 0 \, d \) = 1$ and $N \( n \, 0 \) lt.eq 1$. A nonzero constant has a fixed sign; an identically zero function yields no all-strict patterns. Coincident hyperplanes and degenerate restrictions cannot increase the recurrence bound. Induction gives the displayed binomial sum. Applying this to each of the at most $4^s$ bases proves (5.6). In particular, all movable orders, positions, and marks have already been counted, with no additional permutation or timeline factor. ◻
]

=== 5.2 Encoding residual sets <encoding-residual-sets>

We now apply the counting bound twice to describe the residuals. The first marked sequence tests whether a label has a valid nominal birth of the chosen parity. Among labels passing that test, the second tests whether, in that layer, the label remains outside the span of the preceding flat, competing test labels, and rank witnesses. Their intersection is exactly the residual set. Counting both tests uniformly before exposing the focal group’s bits is what permits a later union bound despite the dependence of the actual residual on those bits.

#thm([Lemma 5.3.])[
  (A uniform family of residuals).  #emph[Fix $H$ and a true group $U_i$ of size $n = n_i gt.eq kappa$. Condition also on the parity and on the $D \, C \, T$ bits outside $U_i$, but do not condition on their bits in $U_i$ or on whether $U_i$ is listed. There is a deterministic family $frak(R)_i subset.eq 2^(U_i)$ with 
#[#set math.equation(numbering: n => "(5.7)")
 $ \| frak(R)_i \| lt.eq exp (frac(1000 log kappa, kappa) thin n) $ <eq:pattern-family-size>]

 such that, whenever this group is listed and $z_h lt.eq n \/ kappa$, every residual (5.4) obtained from witnesses (5.3) belongs to $frak(R)_i$.]
] <lem:pattern-family>

#proof[
  If $U_i$ is listed, its index must be one plus the number of listed lower-weight groups. Denote this now-fixed index by $h$, whether or not the focal group is actually listed. The lower-group paths, $F \( k \) := F_(h - 1) \( k \)$, and all $K_(h \, b)$ are fixed by the conditioning. No $D \, C \, T$ bit on $U_i$ enters this incoming path or these competition sets. Write $a = a_h$ and $q = floor.l n \/ kappa floor.r$.
  On any actual listed outcome, Lemma 8 supplies a set $J_h subset.eq U_i$ of at most $q$ density generators and an insertion time $tau \( g \)$ for each $g in J_h$ such that
  #[#set math.equation(numbering: n => "(5.8)")
   $ X_h \( k \) = "cl" #scale(x: 120%, y: 120%)[\(] F \( k \) union { g in J_h : tau \( g \) lt.eq k } #scale(x: 120%, y: 120%)[\)] . $ <eq:encoded-path>]
  All insertion times can be taken between $a$ and $0$. When $z_h lt.eq n \/ kappa$, the witness union $Z = union.big_b Z_b$ has at most $q$ labels. We allow every choice of these two subsets of $U_i$, then use two marked sequences to encode the residual. An element chosen for both subsets is treated as two distinct occurrences, one for each role.
  For the first sequence, advance through integer times from $a - 2$ to $1$. At time $k$ take as old occurrences a fixed label-ordered listing of $F \( k \)$; mark all occurrences in this block by $1$ exactly when $k in cal(B)_h$. These old slots, including their labels, order, and marks, are fixed by the conditioning and span $E$, since $F \( 0 \) = E$. For the actual path, insert each $g in J_h$ at its time $tau \( g \)$, after that time’s old block, with the same mark as the block. After processing time $k$, the generated flat is exactly $X_h \( k \)$ by (5.8). Hence the set receiving mark $1$ among the tested labels $U_i$ is precisely
  #[#set math.equation(numbering: n => "(5.9)")
   $ union.big_(b in cal(B)_h) P_(h \, b) . $ <eq:first-pivot-test>]
  The second sequence runs through layers of the chosen parity. Choose the unique $b_0 in { a - 2 \, a - 1 }$ with $b_0 equiv epsilon med \( mod med 2 \)$, and then take successive endpoints $b_0 + 2 \, b_0 + 4 \, dots.h \, b_1$, where $b_1 in { 0 \, 1 }$ has the chosen parity. The initial span is $L = X_h \( b_0 \)$. For each layer $\( b - 2 \, b \]$ use the following two phases:
  + Insert a fixed listing of $K_(h \, b)$ as old occurrences with mark $0$, followed by the movable witnesses $Z_b$, also with mark $0$. Here $Z_b = diameter$ if $b in.not cal(B)_h$.
  + Insert a fixed listing of $F \( b \)$ as old occurrences with mark $1$, followed by the movable density generators whose insertion times satisfy $b - 2 < tau \( g \) lt.eq b$, also with mark $1$.
  Again the old slots, their order, and their marks are fixed; their labels span $E$ by the final endpoint. Only the density and witness occurrences move when the focal mask changes.
  The two phases are designed to give the following sequence of spans:
  $ X_h \( b - 2 \) arrow.r_(upright("mark ") 0)^(upright("phase (i)")) "cl" #scale(x: 120%, y: 120%)[\(] X_h \( b - 2 \) union K_(h \, b) union Z_b #scale(x: 120%, y: 120%)[\)] arrow.r_(upright("mark ") 1)^(upright("phase (ii)")) X_h \( b \) . $
  We verify these identities before interpreting the pivot marks. Suppose the generated flat at the preceding endpoint is $X_h \( b - 2 \)$. At the end of phase (i) it is exactly
  #[#set math.equation(numbering: n => "(5.10)")
   $ "cl" #scale(x: 120%, y: 120%)[\(] X_h \( b - 2 \) union K_(h \, b) union Z_b #scale(x: 120%, y: 120%)[\)] . $ <eq:encoded-interior>]
  The inclusions $K_(h \, b) subset.eq F \( b \)$ and $Z_b subset.eq X_h \( b \)$, together with (5.8), show that the flat at the end of phase (ii) is exactly $X_h \( b \)$. This proves the endpoint assertion by induction from $b_0$. Density generators originally inserted at $b - 1$ have been postponed to phase (ii). They affect the intermediate span, but the endpoints and the explicit span (5.10) remain exact.
  Now restrict attention to a label passing the first test, with valid birth $b$. It is outside $X_h \( b - 1 \)$ and hence outside $X_h \( b - 2 \)$, so its second-sequence pivot occurs in this layer. Its second mark is $1$ exactly when it is not spanned at the end of phase (i). By (5.10), this is exactly its membership in $cal(R)_h$. Thus the residual is the intersection of the two sets of labels receiving mark $1$. Phase (ii) can also span labels born at $b - 1$, which explains why the first test is needed: the second mark alone need not describe a valid birth of the chosen parity.
  We now define $frak(R)_i$ without using the focal bits: for every pair of subsets $J \, Z subset.eq U_i$ of size at most $q$, include every intersection of two marked-pivot sets obtained from the fixed old sequences just described, allowing arbitrary placements, orders, and marks of the specified movable occurrences. The first sequence uses only the $J$ occurrences; the second uses both roles. This definition may include intersections that do not arise from valid paths or witnesses, which only increases the family. The preceding construction shows that it includes every required actual residual.
  Let $S_d \( n \) = sum_(ell = 0)^d binom(n, ell)$. There are at most $S_q \( n \)^2$ subset choices. Each sequence has at most $2 q$ movable occurrences, so Lemma 13 gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ \| frak(R)_i \| lt.eq S_q \( n \)^2 #scale(x: 120%, y: 120%)[\(] 4^(2 q) S_(2 q) \( n \) #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:raw-pattern-count>]
  This estimate includes all ways of assigning labels to times or layers. To bound it with the floors intact, for $0 < alpha lt.eq 1 \/ 2$ note that
  $ alpha^(alpha n) S_(floor.l alpha n floor.r) \( n \) lt.eq sum_(ell = 0)^(floor.l alpha n floor.r) binom(n, ell) alpha^ell lt.eq \( 1 + alpha \)^n lt.eq e^(alpha n) . $
  Use $q lt.eq n \/ kappa$ and $2 q lt.eq floor.l 2 n \/ kappa floor.r$, with $alpha = 1 \/ kappa$ and $alpha = 2 \/ kappa$, respectively, in (5.11). This yields
  $ log \| frak(R)_i \| lt.eq n / kappa #scale(x: 120%, y: 120%)[\(] 6 log kappa + 6 + 4 log 2 #scale(x: 120%, y: 120%)[\)] lt.eq frac(1000 log kappa, kappa) thin n \, $
  as claimed. All labels tested here are nonloops by the initial candidate filter, and the argument uses no representability property of the matroid. ◻
]

=== 5.3 Completing the sample-to-rank estimate <completing-the-sample-to-rank-estimate>

The residual family is fixed before the focal mask is exposed. We can therefore bound the chance that any large member lies entirely in $O$, even though the actual residual is chosen using that mask.

#proof[
  Put $n = n_i$. On the unlisted branch $D ∩ U_i$ is empty, so Lemma 11, with both sides extended by zero on that branch, can be averaged over $D$. Since each label belongs to $D$ with probability $1 \/ 4$, it gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ bb(E) \[ sigma_i divides H \] gt.eq eta / 16 \| Y_i \| - frac(n, 4 kappa) gt.eq gamma \| Y_i \| - n / kappa . $ <eq:averaged-safe-count>]
  Use the conditioning in Lemma 14. Within $U_i$, the events ${ e in O }$ remain independent across labels, each with probability
  $ p_O = 1 - \( 1 - 1 \/ 4 \) \( 1 - t \) = 1 / 4 + 3 / 4 t lt.eq 1 / 2 . $
  Thus, for each fixed $R_0 in frak(R)_i$, $bb(P) \( R_0 subset.eq O \) lt.eq 2^(- \| R_0 \|)$ under this conditioning. Let $delta = 2^(- 26)$ and let $cal(E)_i$ be the event that some $R_0 in frak(R)_i$ satisfies $R_0 subset.eq O$ and $\| R_0 \| > delta n$. The union bound, without conditioning on listing, gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ bb(P) \( cal(E)_i divides H \, epsilon \, upright("masks outside ") U_i \) & lt.eq exp (frac(1000 log kappa, kappa) n - delta n log 2)\
 & = 2^(- \( 2^(- 26) - 100000 thin 2^(- 100) \) n) lt.eq 2^(- 2^(- 27) n) lt.eq 2^(- 2^73) < 2^(- 26) . $ <eq:residual-tail>]
  Here we used $kappa = 2^100$ and $n gt.eq kappa$; in particular the bound already holds at the smallest analyzed group size.
  Define an error variable $e_i$ as follows. On a listed outcome with $z_i lt.eq n \/ kappa$, choose the witnesses in (5.3) and set $e_i = \| cal(R)_h \|$. Set $e_i = 0$ on all other outcomes. In its nonzero branch, $cal(R)_h in frak(R)_i$ and $cal(R)_h subset.eq O$, so
  $ e_i lt.eq delta n + n upright(bold(1))_({ cal(E)_i }) \, #h(2em) bb(E) \[ e_i divides H \] lt.eq 2 delta n = 2^(- 25) n . $
  The latter bound follows first under the conditioning of (5.13), then by averaging that conditioning away. No independence is asserted for the selected residual itself.
  In every outcome,
  $ sigma_i lt.eq kappa z_i + e_i . $
  For listed outcomes with $z_i lt.eq n \/ kappa$ this is (5.5); for listed outcomes with $z_i > n \/ kappa$ it follows from $sigma_i lt.eq n < kappa z_i$; for unlisted outcomes both statistics vanish. Taking expectations and using (5.12) gives
  $ kappa bb(E) \[ z_i divides H \] gt.eq gamma \| Y_i \| - \( kappa^(- 1) + 2^(- 25) \) n gt.eq gamma \| Y_i \| - 2^(- 23) n \, $
  which proves (5.2). ◻
]

== 6 Rank and payoff for every arrival order <sec:accounting>

We now pass from the nominal rank guarantee of Lemma 12 to the actual greedy reward. A rank statistic on the final layers will give a lower bound for every arrival order with all coins fixed. We then compare final and nominal layers using one generator budget over the entire auxiliary timeline. Only after these deterministic comparisons do we average over the independent test thinning and the other masks.

=== 6.1 A simultaneous rank lower bound <a-simultaneous-rank-lower-bound>

Fix all weights and coins. For a listed group $h$, write $S_(h \, b) = P_(h \, b) \\ O$, and define the order-independent statistic

#[#set math.equation(numbering: n => "(6.1)")
 $ lambda_h = sum_b "r" #scale(x: 120%, y: 120%)[\(] T_h ∩ S_(h \, b) divides hat(F) \( b - 2 \) + K_(h \, b) #scale(x: 120%, y: 120%)[\)] . $ <eq:actual-rank-statistic>]

Sums over $b$ use the chosen parity; terms outside the finite nontrivial range are zero. Each summand measures the rank left among tested, unobserved labels of group $h$ after contracting the preceding final flat and all lower-weight test competitors. It depends on the coins but not on the arrival order. Let $N_(gt.eq h) \( pi \)$ be the number of accepted labels whose rounded weight is at least that of $G_h$.

#thm([Lemma 6.1.])[
  (Order-uniform rank bound).  #emph[For each realization of all coins and every permutation $pi$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ N_(gt.eq h) \( pi \) gt.eq lambda_h . $ <eq:all-orders>]

]
] <lem:all-orders>

#proof[
  At endpoint $b$, let $F = hat(F) \( b - 2 \)$ and let $E_b$ be the entire eligible set of that layer. Whatever the arrival order or the interleaving with other layers, its final greedy set $B_b$ is a basis of $E_b$ over $F$. Partition $B_b = L_b union.sq H_b$ into selected labels of strictly lower weight than $G_h$ and the remaining labels. Independence and spanning give
  $ \| H_b \| = "r" \( H_b divides F + L_b \) = "r" \( E_b divides F + L_b \) . $
  Every element of $T_h ∩ S_(h \, b)$ outside $F$ is eligible. Those in $F$ contribute no rank. Also $L_b subset.eq K_(h \, b)$, because each lower-weight accepted label is test-positive and has nominal birth $b$ in a lower listed group. Thus
  $ \| H_b \| gt.eq "r" \( T_h ∩ S_(h \, b) divides F + L_b \) gt.eq "r" \( T_h ∩ S_(h \, b) divides F + K_(h \, b) \) . $
  Sum over the layers to prove (6.2). Including unselected or sacrificed labels in $K_(h \, b)$ only weakens this bound. ◻
]

=== 6.2 One budget for later path expansions <one-budget-for-later-path-expansions>

#thm([Lemma 6.2.])[
  (Telescoping rank cost).  #emph[For each listed group $h$, the nominal statistic $z_h$ satisfies 
#[#set math.equation(numbering: n => "(6.3)")
 $ sum_b "r" \( S_(h \, b) divides hat(F) \( b - 2 \) + K_(h \, b) \) gt.eq z_h - c_h \, #h(2em) c_h = \| C_h \| + sum_(j > h) #scale(x: 120%, y: 120%)[\(] \| C_j \| + \| D_j \| \/ kappa #scale(x: 120%, y: 120%)[\)] . $ <eq:rank-cost>]

]
] <lem:rank-cost>

#proof[
  Choose the generator sets of Lemma 8 and put
  $ J = C_h union union.big_(j > h) \( C_j union J_j \) . $
  This single set satisfies $\| J \| lt.eq c_h$ and, for every integer $k$,
  #[#set math.equation(numbering: n => "(6.4)")
   $ X_h \( k \) subset.eq hat(F) \( k \) subset.eq "cl" \( X_h \( k \) + J \) . $ <eq:common-generator-set>]
  Indeed the first group’s guards are contained in $C_h$; at each later group, its whole density path uses portions of $J_j$, and its guards are contained in $C_j$. Induction over groups proves the second inclusion for all times at once. The set $J$ may depend on the realized masks.
  At endpoint $b$, abbreviate $A = X_h \( b - 2 \) + K_(h \, b)$ and $S' = S_(h \, b)$. The conditioning set in the left side of (6.3) lies between $A$ and $"cl" \( A + J \)$. The resulting rank loss is at most
  #[#set math.equation(numbering: n => "(6.5)")
   $ "r" \( S' divides A \) - "r" \( S' divides A + J \) & = "r" \( J divides A \) - "r" \( J divides A + S' \)\
 & lt.eq "r" \( J divides X_h \( b - 2 \) \) - "r" \( J divides X_h \( b \) \) . $ <eq:rank-telescope-step>]
  The inequality follows from two applications of decreasing conditional rank along the nested sets
  $ X_h \( b - 2 \) subset.eq A subset.eq A + S' subset.eq X_h \( b \) : $
  the last inclusion follows from $K_(h \, b) subset.eq F_(h - 1) \( b \)$ and $P_(h \, b) subset.eq X_h \( b \)$. Specifically, $"r" \( J divides A \) lt.eq "r" \( J divides X_h \( b - 2 \) \)$ and $"r" \( J divides A + S' \) gt.eq "r" \( J divides X_h \( b \) \)$. Summing the right side of (6.5) over the chosen parity telescopes to at most $"r" \( J \) lt.eq \| J \|$. Missing endpoints may be added, since all differences are nonnegative. This proves (6.3); neither independence of $J$ nor a separate budget for each layer is required. ◻
]

=== 6.3 Independent thinning and group estimates <independent-thinning-and-group-estimates>

The two preceding lemmas apply simultaneously to every realization and arrival order. We now average the focal group’s test bits, which played no role in constructing its paths or lower-weight competition sets.

#thm([Lemma 6.3.])[
  (Independent test thinning).  #emph[For a listed group $h$, let $cal(F)_(- h)$ be generated by $H \, D \, C$, the parity $epsilon$, and all test-mask memberships outside $G_h$. Then 
#[#set math.equation(numbering: n => "(6.6)")
 $ bb(E) \[ lambda_h divides cal(F)_(- h) \] gt.eq t sum_b "r" \( S_(h \, b) divides hat(F) \( b - 2 \) + K_(h \, b) \) gt.eq t \( z_h - c_h \) . $ <eq:test-thinning>]

]
] <lem:thinning>

#proof[
  The group $G_h$ is determined by $H \, D$ and the fixed weights. All paths depend on $H \, D \, C$ and not on $T$. The birth sets $P_(h \, b)$ also use the parity; $O = D union C$ omits $T$, and $K_(h \, b)$ uses only lower groups’ test bits. Thus these sets, as well as $z_h$ and $c_h$, are $cal(F)_(- h)$-measurable, while the bits of $T_h$ remain independent Bernoulli bits of rate $t$.
  Conditional on $cal(F)_(- h)$, choose a fixed independent witness for each unthinned rank in (6.6). Its intersection with $T_h$ is still independent over the same base and has expected size $t$ times its size. Linearity proves the first inequality, and Lemma 16 proves the second. No selected order is conditioned upon. ◻
]

Return to true weight indices. For a listed true group $U_i = G_h$, let $lambda_i = lambda_h$ and $c_i = c_h$; if it is unlisted, set both to zero, as with $z_i$. Conditional on $H$, dominate the cost pointwise by counts on all true groups, listed or not:

$ c_i lt.eq \| C ∩ U_i \| + sum_(ell > i) (\| C ∩ U_ell \| + frac(\| D ∩ U_ell \|, kappa)) . $

Only then take expectations. The mask probabilities are unchanged under this conditioning, so

#[#set math.equation(numbering: n => "(6.7)")
 $ bb(E) \[ c_i divides H \] lt.eq t n_i + \( t + 1 \/ kappa \) sum_(ell > i) n_ell . $ <eq:expected-cost>]

The exact density-mask contribution would be $1 \/ \( 4 kappa \)$; the larger coefficient is convenient. Lemmas 12 and 17 now imply, for every true group of size $n_i gt.eq kappa$,

#[#set math.equation(numbering: n => "(6.8)")
 $ bb(E) \[ lambda_i divides H \] gt.eq t / kappa (gamma \| Y_i \| - \( 2^(- 23) + t kappa \) n_i - \( 1 + t kappa \) sum_(ell > i) n_ell) . $ <eq:group-payoff>]

Although the different $lambda_i$ may depend on one another’s test bits, each separate thinning calculation is valid. Their expectations can be summed without asserting independence.

=== 6.4 The weighted sum and the final constant <the-weighted-sum-and-the-final-constant>

Let $A_(upright("main")) \( R \, pi \)$ be the main rule’s accepted set and let $cal(A) \( H \) = { i : n_i gt.eq kappa }$ be the analyzed true groups. For a true weight index $i$, let $N_i \( pi \)$ count accepts of weight at least $B^i$. Lemma 15, with $lambda_i = 0$ on unlisted groups, gives $lambda_i lt.eq N_i \( pi \)$ simultaneously for every $pi$. Each accepted weight $B^ell$ contributes at most $sum_(i lt.eq ell) B^i = B^ell B \/ \( B - 1 \) < 2 B^ell$ to the cumulative weighted counts. Hence the pointwise inequality is

#[#set math.equation(numbering: n => "(6.9)")
 $ min_pi u \( A_(upright("main")) \( R \, pi \) \) gt.eq 1 / 2 sum_(i in cal(A) \( H \)) B^i lambda_i . $ <eq:minimum-before-expectation>]

The order has been minimized before any expectation is taken.

Multiply (6.8) by $B^i$ and sum over analyzed groups. The higher-weight cost is bounded using

$ sum_(i in cal(A) \( H \)) B^i sum_(ell > i) n_ell lt.eq sum_ell n_ell sum_(i < ell) B^i = frac(1, B - 1) sum_ell B^ell n_ell . $

With the constants in (3.1),

#[#set math.equation(numbering: n => "(6.10)")
 $ 2^(- 23) + t kappa + frac(1 + t kappa, B - 1) < 2^(- 21) . $ <eq:error-constant>]

For example $t kappa = 2^(- 40)$ and the fractional term is less than $2^(- 30)$; these bounds already give the displayed strict inequality. Combining with (6.9) yields

#[#set math.equation(numbering: n => "(6.11)")
 $ bb(E) [min_pi u \( A_(upright("main")) \( R \, pi \) \) thin mid(bar.v) thin H] gt.eq frac(t, 2 kappa) (gamma sum_(i in cal(A) \( H \)) B^i \| Y_i \| - 2^(- 21) u \( U \)) . $ <eq:conditional-main-payoff>]

Suppose $W > 0$, so $m_(*) > 0$. Ignoring the smaller true groups loses at most

#[#set math.equation(numbering: n => "(6.12)")
 $ sum_(i in.not cal(A) \( H \)) B^i \| Y_i \| lt.eq kappa sum_(B^i lt.eq m_(*)) B^i < 2 kappa m_(*) . $ <eq:small-groups>]

If $m_(*) lt.eq W \/ \( 8 kappa \)$, Lemma 4 and (6.12) give

$ bb(E)_H sum_(i in cal(A) \( H \)) B^i \| Y_i \| gt.eq W \/ 4 \, #h(2em) bb(E)_H u \( U \) lt.eq W . $

Since $gamma = 2^(- 16)$, we have $gamma \/ 4 - 2^(- 21) = 7 dot.op 2^(- 21) gt.eq gamma \/ 8$. Therefore

#[#set math.equation(numbering: n => "(6.13)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] min_pi u \( A_(upright("main")) \( R \, pi \) \) #scale(x: 120%, y: 120%)[\]] gt.eq frac(t gamma, 16 kappa) W . $ <eq:main-branch-guarantee>]

If instead $m_(*) > W \/ \( 8 kappa \)$, the maximum branch gives more than $W \/ \( 32 kappa \)$ by (3.3).

#proof[
  Choose the two branches with equal probability. In the first case above, the main branch contributes at least $t gamma W \/ \( 32 kappa \)$ after mixing. In the second case, the maximum branch contributes more than $W \/ \( 64 kappa \)$, which is larger than the same target. The minimum over orders is taken separately for every complete seed, including the branch; the fair mixture is therefore valid against branch-dependent orders. True accepted weights dominate their rounded weights. By (3.2), the resulting fixed-vector reward fraction is
  $ frac(t gamma, 32 kappa B) = 2^(- 140 - 16 - 5 - 100 - 32) = 2^(- 293) . $
  When $W = 0$, the benchmark is zero and the conclusion is immediate. Feasibility and measurability follow from Lemma 7 and the analogous immediate properties of the maximum branch. This proves Proposition 2. The revealed mask is selected from the initial seed, independently of the weights, so Lemma 3 proves Theorem 1, with slack in its announced constant.
  The construction covers empty ground sets, loops, rank zero, ties, and zero values as specified above. Each realized weight vector is finite, even when the distributions have unbounded support. Only the expected optimum needs to be finite; loop values, which can never be accepted, need no separate moment condition. ◻
]

== 7 An order-oblivious secretary consequence <sec:secretary>

The fixed-vector guarantee also gives a secretary rule with a random observation prefix and an adversarial suffix. This follows the order-oblivious prefix/suffix form introduced by Azar, Kleinberg, and Weinberg #cite(label("AKW14")) Definition 1, Section 3. Their definition permits a possibly random rejected prefix and an adversarially ordered suffix; it does not explicitly specify visibility of the rule’s entire seed. We state that information pattern separately here.

The mechanism is the sacrificed observation mask of Proposition 2. Within either branch, a binomial prefix length chosen independently of the permutation reproduces that branch’s product-mask law. After observing that set, the rule uses predrawn random coordinates to reconstruct the remaining source coins from their conditional law. The expected minimum over all orders then accommodates any rearrangement of the suffix.

#thm([Corollary 7.1.])[
  (Order-oblivious selection with full-seed visibility).  #emph[For each known finite labeled matroid $M = \( E \, cal(I) \)$, there is one measurable randomized online rule $cal(S)_M$ with the following property. Fix any vector $w in \[ 0 \, oo \)^E$ of finite nonnegative weights before all rule and arrival randomness. Without knowing $w$, the rule draws its complete initial seed $Q$, independently of a uniformly random permutation $sigma$ of $E$, and fixes a possibly random prefix length $K$ before any arrival. It observes the first $K$ label–weight pairs of $sigma$ in order and rejects those labels.]
  #emph[After this ordered prefix is observed and before any suffix arrival, an adversary may know $M$, the entire fixed vector $w$, the ordered prefix, and the complete seed $Q$, including $K$, the branch choice, and unused coins. It may choose any measurable permutation $tau$ of the remaining labels as a function of this information. The rule is not told the future suffix order and decides irrevocably at each suffix arrival while maintaining an independent set. Writing $A_(cal(S))$ for its accepted set, for every such adversary, 
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E) [sum_(e in A_(cal(S))) w_e] gt.eq 2^(- 293) "OPT"_M \( w \) . $ <eq:secretary-guarantee>]

 The expectation is over the rule seed and random prefix, and over any adversary randomization. The adversary cannot alter the random-prefix law or choose the weights after observing the seed or prefix.]
] <cor:secretary>

#proof[
  Let $R$ denote the complete source seed of Proposition 2, including the independent fair branch choice $J$. In the maximum branch the sacrificed mask has independent membership rate $p_(upright("max")) = 1 \/ 2$. In the main branch it is $B_0 = H union D union C$, so its rate is
  $ p_(upright("main")) = 1 - \( 1 - 1 \/ 2 \) \( 1 - 1 \/ 4 \) \( 1 - t \) = 5 / 8 + 3 thin 2^(- 143) \, #h(2em) t = 2^(- 140) . $
  The test mask $T$ is not sacrificed. Both rates are independent of $w$ and lie strictly between zero and one.
  Let $n = \| E \|$. Draw $J$ and then $K divides J tilde.op "Bin" \( n \, p_J \)$ as part of $Q$ before arrivals, independently of $sigma$. Write $P = { sigma_1 \, dots.h \, sigma_K }$ for the prefix set. For each fixed $p subset.eq E$,
  #[#set math.equation(numbering: n => "(7.2)")
   $ bb(P) \( P = p divides J \) = frac(bb(P) \( K = \| p \| divides J \), binom(n, \| p \|)) = p_J^(\| p \|) \( 1 - p_J \)^(n - \| p \|) . $ <eq:secretary-prefix-mask>]
  Thus $P divides J$ has exactly the product law of the source sacrificed mask. This statement averages over $K$: conditional on $K$, the set is uniform of that fixed size, and no product-law assertion is made conditional on the complete secretary seed.
  After the prefix, reconstruct $R$ from its source conditional law given $J$ and $B_0 = P$. In the maximum branch set its fair mask equal to $P$. In the main branch set $\( H_e \, D_e \, C_e \) = \( 0 \, 0 \, 0 \)$ for $e in.not P$; for each $e in P$, independently use the original product law of this triple conditioned on being nonzero. Each of its seven probabilities is the corresponding original triple probability divided by $p_(upright("main"))$. Keep the source laws of $T$, parity, unused branch coins, and all other coins. All conditioning events have positive probability. Multiplying this conditional kernel by (7.2) recovers exactly the source joint law of the branch and complete seed $R$, with $B_0 \( R \) = P$.
  This reconstruction requires no concealed later randomness. The initial seed $Q$ predraws independent uniform coordinates for the finite conditional kernels and the remaining source coins. After the prefix, evaluate the kernels by fixed interval partitions using only its label set $P$, not its weights. Hence the derived $R$ is a function of $\( Q \, P \)$ and is known to the adversary. The extra information in $Q$ may reveal more than $R$; the pointwise comparison below allows this.
  Initialize the hidden-weight rule using $R$ and the observed vector $w \|_P$. Virtually feed it the prefix in its observed order. Every prefix label is forced to be rejected, and this replay includes any internal state changes on rejected arrivals. Then feed it each suffix label and weight as that label arrives. No unseen suffix weight or future suffix order is supplied. For the concatenated permutation $pi = \( sigma_1 \, dots.h \, sigma_K \, tau \)$, induction on arrivals gives exactly the accepted set $A \( w \, R \, pi \)$ of the hidden rule. For every realization, including when $tau$ depends on all of $Q$ and the ordered prefix,
  $ sum_(e in A_(cal(S))) w_e = sum_(e in A \( w \, R \, pi \)) w_e gt.eq min_(pi') sum_(e in A \( w \, R \, pi' \)) w_e . $
  The marginal law of $R$ is the source law and $w$ was fixed before the randomness. Averaging this pointwise inequality and applying Proposition 2 proves (7.1) without any additional loss.
  Feasibility follows from the hidden rule’s feasibility for every arrival prefix and permutation. For fixed finite $M$, the mask kernels have finite support and their interval-partition realizations are Borel measurable; composition with the measurable source decisions therefore gives a measurable rule. The minimum is over finitely many measurable rewards, and feasibility bounds each reward by the finite $"OPT"_M \( w \)$. The cases $K = 0$, $K = n$, empty ground sets, loops, rank zero, ties, and zero weights are covered by the same construction and the source conventions. ◻
]

The construction uses a known finite labeled matroid and numerical weights, and supplies a finite measurable rule. Its computational cost is not bounded here. Its distinguishing feature is the order guarantee: after the observation prefix, the suffix may depend on the weights and every coin in the rule’s initial seed.

For ordinary uniformly random arrivals, recent results give much larger constants with stronger computational guarantees. Abdi, Banihashem, Hajiaghayi, and Mittal give a polynomial-time $1 \/ 64$-competitive ordinal rule for known matroids #cite(label("ABHM26")) Corollary 1.4. Their Theorem 6.1 also gives a reduction from single-sample prophet inequalities to the ordinary secretary problem, recording Fu et al.’s attribution of this implication to Wenzheng Li’s 2023 personal communication. Singla #cite(label("Singla26")) Theorem 3.1 and Huang #cite(label("Huang26")) Theorem 1 give ordinal rules selecting each element of a fixed optimum with probability at least $1 \/ 4$ and $1 \/ e$, respectively, even when the matroid is accessed only through independence queries on arrived elements. These results use uniformly random arrivals throughout. Corollary 18 instead applies after arbitrary full-seed adversarial rearrangement of the unobserved suffix, with no additional loss from the fixed-vector guarantee.


#bibliography("refs.bib", style: "ieee", title: [References])
