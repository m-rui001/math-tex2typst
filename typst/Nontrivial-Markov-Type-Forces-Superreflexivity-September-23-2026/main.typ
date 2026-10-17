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

#align(center)[#text(size: 16pt, weight: "bold")[Nontrivial-Markov-Type-Forces-Superreflexivity-September-23-2026]]
#align(center)[OpenAI]
#align(center)[]

Nontrivial Markov Type Forces Superreflexivity

OpenAI

September 23, 2026

== 1 Introduction <introduction>

A finite Markov chain $\( Z_t \)_(t gt.eq 0)$ on a set $S$, with transition matrix $P$ and initial distribution $pi$, is #emph[stationary and reversible] if

$ pi_i P_(i j) = pi_j P_(j i) #h(2em) \( i \, j in S \) . $

A normed space $X$ has #emph[Markov type $p > 0$ with constant $0 < K < oo$] if, for every such chain, every $f : S arrow.r X$, and every integer $t gt.eq 1$,

#[#set math.equation(numbering: n => "(1)")
 $ bb(E) ∥f \( Z_t \) - f \( Z_0 \)∥^p lt.eq K^p t thin bb(E) ∥f \( Z_1 \) - f \( Z_0 \)∥^p . $ <eq:markov-type>]

A Banach space is #emph[superreflexive] if it admits an equivalent uniformly convex norm. Here a norm $\| dot.op \|$ is equivalent to $parallel dot.op parallel$ if $a parallel x parallel lt.eq \| x \| lt.eq b parallel x parallel$ for some $a \, b > 0$; it is uniformly convex if, for every $epsilon.alt in \( 0 \, 2 \]$, there is $delta > 0$ such that

$ \| x \| \, \| y \| lt.eq 1 \, quad \| x - y \| gt.eq epsilon.alt quad arrow.r.double quad lr(|frac(x + y, 2)|) lt.eq 1 - delta . $

#thm([Theorem 1.1.])[
  #emph[Every real Banach space with Markov type $p$ for at least one $p > 1$ is superreflexive.]
] <thm:main>

===== 1.1 Context and result. <context-and-result.>

Ball introduced Markov type to study Lipschitz extension from metric spaces [1]. The inequality tests every finite reversible walk, so it is a metric property even when the target is a Banach space. Superreflexivity, by contrast, is defined through an equivalent norm; its metric characterizations are central examples in the Ribe program, which seeks metric descriptions of linear-geometric properties. Bourgain characterized it by the distortion of finite complete binary trees [2]; finite diamonds provide another metric test [9]. Lee, Naor, and Peres introduced Markov convexity in their study of tree distortion [10]. Mendel and Naor later characterized superreflexivity through #emph[Markov convexity], an inequality comparing walks that share their past and then evolve independently [11]. Theorem 1 identifies what ordinary Markov type alone detects for Banach spaces. Ordinary Rademacher type, which controls sums with independent random signs, does not suffice for this conclusion: James constructed nonreflexive spaces of Rademacher type $2$ [8].

Naor, Peres, Schramm, and Sheffield showed that uniform smoothness of power type $p$ implies Markov type $p$ for $1 < p lt.eq 2$ [13]. Pisier’s power-type renorming theorem [16] therefore gives nontrivial Markov type to every superreflexive space; Markov type is invariant under equivalent norms. Naor asked whether a Banach space could have nontrivial Markov type without an equivalent uniformly smooth norm [12] Question 4. Since equivalent uniformly smooth and uniformly convex renormings exist for precisely the superreflexive spaces [16], Theorem 1 answers this question negatively and completes the characterization for real Banach spaces.

The classical structural input is the James–Enflo characterization:

#[#set math.equation(numbering: n => "(2)")
 $ X upright(" admits an equivalent uniformly convex norm")\
arrow.l.r.double\
upright("every Banach space finitely representable in ") X upright(" is reflexive") . $ <eq:superreflexive-characterization>]

Here $Y$ is #emph[finitely representable] in $X$ if, for every finite-dimensional $E subset.eq Y$ and every $eta > 0$, there is an injective linear $T : E arrow.r X$ with $∥T∥ ∥T^(- 1)∥ < 1 + eta$. We use (2) in its standard form [7,6]; the other background tools are Hahn–Banach and the finite Ramsey theorem. The finite-dimensional form of Goldstine’s theorem needed below is included in the proof.

===== 1.2 Proof strategy. <proof-strategy.>

We argue by contradiction. The James–Enflo characterization supplies a nonreflexive space finitely representable in a nonsuperreflexive one. From it we construct a spreading norm $N$ on finite sequences for which summing consecutive entries is contractive. This is a concrete version of the equal-sign-additive construction of Brunel and Sucheston [3,4,5]. Equal-sign additivity means that merging adjacent coefficients of the same sign preserves the norm. The finite-representability formulation and related graph-embedding applications appear in [14,15]. We include the precise version and its finite-representability proof in Appendix 6.

For each time $n$, the central task is a finite reversible walk with unit edge labels, changing sign under reversal, whose sum has norm at least $n \/ 24$ with probability at least $3 \/ 20$. Before normalization, the labels are sums of signed differences of standard basis vectors in finite coefficient sequences. Their prefix sums are signed indicators of unions of intervals. A reduced word acting on the line makes selected prefix sums of the total label alternate between two levels separated by its reduced length. Consecutive summation converts these oscillations into a lower bound proportional to the reduced length, measured in units of the common one-step label norm. Finite Ramsey averaging supplies increasing charts from a finite set of real points to coefficient indices, with matching marginal laws, so this ordered motion can occur along reversible transitions. The transition letters are independent and uniform; their reduced length is proportional to $n$ with a fixed positive probability.

An edge label need not be the difference of values assigned to its two chart states; a marked transition may carry a nonzero label even when the chart state does not change. A finite lattice lift records traversed oriented edges as integer coordinates. Its potential has exactly the required increments away from the boundary, and rejected boundary moves keep the lifted chain reversible. Section 2 proves this transfer and reduces Theorem 1 to the finite-walk target. Section 3 constructs chart transport, Section 4 constructs the two prefix levels, and Section 5 assembles the walk and proves its displacement.

== 2 Reduction to a finite walk <sec:reduction>

The reduction has three inputs. Lemma 2 supplies an ordered norm from nonsuperreflexivity, Proposition 3 constructs a walk in that norm, and Lemma 4 transfers the Markov type inequality to its odd edge labels.

=== 2.1 The ordered norm <the-ordered-norm>

Write $c_00$ for the real sequences with finite support, and $b_i$ for the $i$th coordinate vector. Finite coefficient arrays are identified with elements of $c_00$ by appending zeros. A norm $N$ on $c_00$ is #emph[spreading invariant] if

#[#set math.equation(numbering: n => "(3)")
 $ N (sum_(i = 1)^m a_i b_i) = N (sum_(i = 1)^m a_i b_(k_i)) #h(2em) \( k_1 < dots.h.c < k_m \) . $ <eq:spreading>]

Thus inserting or removing zero entries does not change the norm.

#thm([Lemma 2.1.])[
  #emph[If a real Banach space $X$ is not superreflexive, there is a norm $N$ on $c_00$ such that:]
  + #emph[$N$ is spreading invariant;]
  + #emph[merging two adjacent entries is contractive: 
#[#set math.equation(numbering: n => "(4)")
 $ N \( a_1 \, dots.h \, a_(i - 1) \, a_i + a_(i + 1) \, a_(i + 2) \, dots.h \, a_m \) lt.eq N \( a_1 \, dots.h \, a_m \) \; $ <eq:merge>]

]
  + #emph[every initial coordinate span, equipped with $N$, admits linear embeddings into $X$ with distortion arbitrarily close to $1$.]
] <lem:ordered-norm>

The construction is proved in Appendix 6. Repeated adjacent merging shows that replacing every block of a partition into consecutive intervals by its sum is contractive. Spreading invariance will allow us to place coordinates by increasing maps, while consecutive summation will convert differences of prefix sums into a norm lower bound.

=== 2.2 The finite-walk target <the-finite-walk-target>

A #emph[finite marked chain] has a finite state set $S$ and a finite set of oriented edges $cal(E)$. An edge $e$ has source $e^(-)$, target $e^(+)$, and reverse $e^(*)$, where star is an involution and $\( e^(*) \)^(-) = e^(+)$, $\( e^(*) \)^(+) = e^(-)$. The probability of choosing $e$ from its source is $q \( e \)$, with $sum_(e : e^(-) = z) q \( e \) = 1$ for every state $z$. We require a probability distribution $pi$ satisfying

#[#set math.equation(numbering: n => "(5)")
 $ pi \( e^(-) \) q \( e \) = pi \( e^(+) \) q \( e^(*) \) . $ <eq:edge-balance>]

The state chain is then stationary and reversible when started in $pi$.

Marks allow several distinct edges between the same states. A labeling $g$ is #emph[odd] if $g \( e^(*) \) = - g \( e \)$ for every edge.

#thm([Proposition 2.2.])[
  (A finite walk with linear displacement).  #emph[Let $N$ be a spreading invariant norm on $c_00$ for which merging adjacent entries is contractive. For every integer $n gt.eq 1$, there are a finite stationary reversible marked chain and an odd labeling $g$ in a finite coordinate span such that 
$ N \( g \( e \) \) = 1 #h(2em) upright("for every edge ") e \, $

 and, for the first $n$ edges $E_1 \, dots.h \, E_n$ of the stationary chain, 
#[#set math.equation(numbering: n => "(6)")
 $ bb(P) {N (sum_(i = 1)^n g \( E_i \)) gt.eq n / 24} gt.eq 3 / 20 . $ <eq:unit-walk>]

]
] <prop:walks>

The construction occupies Sections 3–5. The chain and coordinate dimension may depend on $n$; the numerical constants do not.

=== 2.3 Applying Markov type to edge labels <applying-markov-type-to-edge-labels>

The labels in Proposition 3 need not be differences of a function on the chart states. A finite lattice lift will turn them into such differences and allow Markov type to control their sums.

The Markov type inequality passes to normed spaces finitely representable in its target, with the same constant. More precisely, only the span of the finitely many values of $f$ needs to admit embeddings with distortion arbitrarily close to $1$. After scaling such an embedding $T$, we have

$ ∥x∥ lt.eq ∥T x∥_X lt.eq \( 1 + eta \) ∥x∥ \, $

so applying (1) in $X$ gives its counterpart in the original target with constant $\( 1 + eta \) K$. Let $eta arrow.b 0$.

#thm([Lemma 2.3.])[
  (Odd edge labels).  #emph[Suppose $V$ is a normed space of Markov type $p$ with constant $K$. For a finite marked chain satisfying (5), let $g : cal(E) arrow.r V$ satisfy $g \( e^(*) \) = - g \( e \)$. If $E_1 \, dots.h \, E_n$ are its first $n$ edges, with initial state distributed as $pi$, then 
#[#set math.equation(numbering: n => "(7)")
 $ bb(E) ∥sum_(i = 1)^n g \( E_i \)∥^p lt.eq K^p n thin bb(E) ∥g \( E_1 \)∥^p . $ <eq:odd-markov>]

 The same conclusion holds if the finite span of the labels is finitely representable in a space of Markov type $p$ with constant $K$.]
] <lem:edge-labels>

#proof[
  Choose one edge $e_j$ from each two-element star orbit, $1 lt.eq j lt.eq r$, and let $u_j$ be the coordinate vectors of $bb(Z)^r$. Give $e_j$ displacement $u_j$ and $e_j^(*)$ displacement $- u_j$. A fixed point of star has label zero and is given displacement zero. If $r = 0$, there is nothing to prove.
  For an integer $R > n$, put $Q_R = { - R \, dots.h \, R }^r$. Lift the chain to $S times Q_R$ by choosing an edge as before and making the corresponding lattice move. If the move would leave $Q_R$, remain at the same full state. Every accepted transition satisfies detailed balance under $pi ⊗ "Unif" \( Q_R \)$ by (5); rejections add only self-loop probabilities. This is a finite stationary reversible chain.
  Define
  $ Phi \( z \, a \) = sum_(j = 1)^r a_j g \( e_j \) . $
  On an accepted edge its increment is $g \( e \)$, and on a rejection its increment is zero. The expected one-step cost is therefore at most $bb(E) ∥g \( E_1 \)∥^p$. If the initial lattice point lies in $Q_(R - n)$, every possible sequence of $n$ edges is accepted. Couple the lifted walk to the original marked walk by using the same proposed edges until the first rejection. On this interior event the first $n$ edges agree, and the event is independent of the original marked trajectory. Its probability is
  $ alpha_R = (frac(2 \( R - n \) + 1, 2 R + 1))^r arrow.r 1 . $
  Consequently the expected $n$-step cost of the lifted potential is at least $alpha_R bb(E) ∥sum_(i = 1)^n g \( E_i \)∥^p$. Applying Markov type to $Phi$ gives
  $ alpha_R bb(E) ∥sum_(i = 1)^n g \( E_i \)∥^p lt.eq K^p n thin bb(E) ∥g \( E_1 \)∥^p . $
  Let $R arrow.r oo$. The last assertion follows from finite-dimensional transfer; enlarging the cube does not enlarge the span of the labels. ◻
]

=== 2.4 Proof of the main theorem <proof-of-the-main-theorem>

#proof[
  Suppose that $X$ has Markov type $p > 1$ with constant $K$ and is not superreflexive. Lemma 2 supplies a spreading invariant norm $N$ with contractive adjacent merging, whose finite coordinate spans embed in $X$ with arbitrarily small distortion. For each $n$, apply Proposition 3 to $N$. Lemma 4, applied through the finite span of these labels, gives
  #[#set math.equation(numbering: n => "(8)")
   $ 3 / 20 (n / 24)^p lt.eq bb(E) N (sum_(i = 1)^n g \( E_i \))^p lt.eq K^p n . $ <eq:contradiction>]
  Since $n$ is arbitrary and $K$ is fixed, this contradicts $p > 1$. ◻
]

All chains used in this deduction are finite and start in their reversible stationary distributions. Their sizes and the embeddings into $X$ may depend on $n$; only $K$ must be uniform. It remains to construct the walks in Proposition 3. The proof of Lemma 2, deferred until Appendix 6, completes the other construction used here.

== 3 Finite charts for ordered motion <sec:finite-lemmas>

To place ordered motion in a finite stationary chain, we seek random increasing maps with the following property: an increasing partial bijection $T$ can be matched by two maps with the same marginal law, so that $C' \( a \) = C \( T \( a \) \)$ throughout its domain with high probability. Thus a landmark moving from $T \( a \)$ to $a$ retains its coordinate index as the chart changes from $C$ to $C'$.

=== 3.1 Averaging on a finite order <averaging-on-a-finite-order>

For a finite ordered set $Lambda$, call a strictly increasing map $C : Lambda arrow.r { 1 \, dots.h \, B }$ a #emph[chart]. If $A$ is an increasing subtuple of $Lambda$, then $C \( A \)$ denotes its ordered tuple of values. For probability distributions on a finite set we use $"TV" \( mu \, mu' \) = 1 / 2 sum_x \| mu \( x \) - mu' \( x \) \|$.

#thm([Lemma 3.1.])[
  (Finite order averaging).  #emph[For every finite ordered set $Lambda$ and every $epsilon.alt > 0$, there are an integer $B$ and a probability distribution $nu$ on charts such that, whenever $A \, A'$ are increasing subtuples of $Lambda$ of the same length, 
#[#set math.equation(numbering: n => "(9)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] "Law"_nu \( C \( A \) \) \, "Law"_nu \( C \( A' \) \) #scale(x: 120%, y: 120%)[\)] < epsilon.alt . $ <eq:subtuple-TV>]

]
] <lem:order-averaging>

#proof[
  List all nontrivial ordered comparisons $\( A_rho \, A'_rho \)$ of equal-length subtuples, $1 lt.eq rho lt.eq R$. The assertion is immediate if $R = 0$. Let $m_rho$ be their common length, and let $T_(B \, m)$ denote the increasing $m$-tuples in ${ 1 \, dots.h \, B }$. For each chart $C$, form the vector
  $ v_C = #scale(x: 120%, y: 120%)[\(] delta_(C \( A_rho \)) - delta_(C \( A'_rho \)) #scale(x: 120%, y: 120%)[\)]_(rho = 1)^R quad upright("in") quad W_B = xor.big_(rho = 1)^R ell_1 \( T_(B \, m_rho) \) \, $
  where $W_B$ carries the sum norm. It suffices to show that $"conv" { v_C }$ contains a vector of norm less than $epsilon.alt$: its convex coefficients give $nu$, and each individual total-variation distance is at most half the resulting norm.
  Fix $delta > 0$ with $R delta < epsilon.alt$. A dual functional of norm at most $1$ is a collection $f_rho : T_(B \, m_rho) arrow.r \[ - 1 \, 1 \]$. For each $m$, color the $m$-tuples by the list of bins of width at most $delta$ containing $f_rho$ for all $rho$ with $m_rho = m$. The number of colors is bounded in terms of $R$ and $delta$, independently of the functions and of $B$. The finite Ramsey theorem therefore supplies a single sufficiently large $B$ such that, for #emph[every] such collection of functions, there is a set $H subset.eq { 1 \, dots.h \, B }$ of size $\| Lambda \|$ homogeneous for all these colorings. Map $Lambda$ increasingly onto $H$. Then
  $ lr(|chevron.l f \, v_C chevron.r|) lt.eq sum_(rho = 1)^R lr(|f_rho \( C \( A_rho \) \) - f_rho \( C \( A'_rho \) \)|) lt.eq R delta < epsilon.alt . $
  If the compact convex set $"conv" { v_C }$ had distance at least $epsilon.alt$ from zero, finite-dimensional separation would give a dual functional of norm $1$ whose value on every $v_C$ is at least $epsilon.alt$, contradicting the preceding bound. Thus the required convex combination exists. ◻
]

=== 3.2 Reversible chart transport <sec:chart-chain>

We now turn the averaging lemma into a finite reversible chain.

#thm([Proposition 3.2.])[
  (Reversible chart transport).  #emph[Let $Lambda$ be a finite ordered set, and let $T_s : D_s arrow.r R_s$ be order-preserving bijections between its subsets, indexed by a nonempty finite set $cal(S)$ with a fixed-point-free involution $s mapsto s^(- 1)$ and $T_(s^(- 1)) = T_s^(- 1)$. For every $epsilon.alt > 0$, there are an integer $B$ and a finite stationary reversible marked chain on charts $C : Lambda arrow.r { 1 \, dots.h \, B }$ whose successive edge letters are independent and uniform in $cal(S)$. At every stationary step $\( C \, s \, C' \)$, 
$ C' \( a \) = C \( T_s \( a \) \) quad \( a in D_s \) $

 holds simultaneously with probability at least $1 - epsilon.alt$.]
] <prop:chart-transport>

#proof[
  Apply Lemma 5 to obtain $B$ and a chart law $nu$. The matching condition is
  #[#set math.equation(numbering: n => "(10)")
   $ C' \( a \) = C \( T_s \( a \) \) quad \( a in D_s \) . $ <eq:chart-match>]
  Figure 1 depicts the rank equality needed along one transition.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 1.25), (6, 1.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (6, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((0, 1.25), [#text(size: 9pt)[$C$]], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$C'$]], anchor: "east", padding: 0.1176cm)
  circle((1, 1.25), radius: 0.05644, fill: black, stroke: none)
  circle((1, 0), radius: 0.05644, fill: black, stroke: none)
  content((1, 1.391), [#text(size: 9pt)[$T_s(a_1)$]], anchor: "south", padding: 0.1176cm)
  content((1, -0.1411), [#text(size: 9pt)[$a_1$]], anchor: "north", padding: 0.1176cm)
  line((1, 1.1), (1, 0.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((3, 1.25), radius: 0.05644, fill: black, stroke: none)
  circle((3, 0), radius: 0.05644, fill: black, stroke: none)
  content((3, 1.391), [#text(size: 9pt)[$T_s(a_2)$]], anchor: "south", padding: 0.1176cm)
  content((3, -0.1411), [#text(size: 9pt)[$a_2$]], anchor: "north", padding: 0.1176cm)
  line((3, 1.1), (3, 0.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((5, 1.25), radius: 0.05644, fill: black, stroke: none)
  circle((5, 0), radius: 0.05644, fill: black, stroke: none)
  content((5, 1.391), [#text(size: 9pt)[$T_s(a_3)$]], anchor: "south", padding: 0.1176cm)
  content((5, -0.1411), [#text(size: 9pt)[$a_3$]], anchor: "north", padding: 0.1176cm)
  line((5, 1.1), (5, 0.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.15, 0.62), [#text(size: 9pt)[$C(T_s(a_i))=C'(a_i)$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: On a matching transition from $C$ to $C'$, the points $a_i in D_s$ and $T_s \( a_i \)$ receive the same coordinate rank: $C' \( a_i \) = C \( T_s \( a_i \) \)$. Horizontal positions indicate the matched chart ranks schematically; their spacing carries no additional information. The diagram shows three points; the match is required on the whole finite domain $D_s$. ],
  ) <fig:chart-transport>
  For one representative of each inverse pair, couple two charts with law $nu$ so that (10) holds with probability at least $1 - epsilon.alt$. Such a coupling exists by (9). For two laws $mu \, mu'$ on the same finite set, place mass $min { mu \( a \) \, mu' \( a \) }$ at each diagonal pair $\( a \, a \)$ and couple the remaining masses arbitrarily. The matching probability is $1 - "TV" \( mu \, mu' \)$. Apply this to the laws of $C \( T_s \( D_s \) \)$ and $C' \( D_s \)$, then sample the full charts from their conditional distributions. Denote the resulting coupling by $lambda_s$. For the inverse index set
  $ lambda_(s^(- 1)) \( C \, C' \) = lambda_s \( C' \, C \) . $
  This gives the inverse version of (10), with the same success probability.
  Discard charts of zero $nu$-mass and start $C_0$ with law $nu$. At each step choose a fresh uniform letter $s in cal(S)$, independently of the past. From the current chart $C$, then choose $C'$ with probability $lambda_s \( C \, C' \) \/ nu \( C \)$ and record $\( C \, s \, C' \)$. The first marginal of $lambda_s$ is $nu$, so these conditional probabilities sum to one. Its stationary edge mass is
  #[#set math.equation(numbering: n => "(11)")
   $ frac(1, \| cal(S) \|) lambda_s \( C \, C' \) \, $ <eq:chart-edge-mass>]
  which is invariant under $\( C \, s \, C' \)^(*) = \( C' \, s^(- 1) \, C \)$. We have therefore constructed a finite stationary reversible marked chain with independent uniform letters. At stationarity, each step fails (10) with probability at most $epsilon.alt$. ◻
]

== 4 Two levels from reduced words <sec:action>

We construct a sum of periodic functions along a word of increasing homeomorphisms. For a word with nonempty reduced form, this sum has one value at integer points and another at the integer translates of the image of $0$; the two values differ by the reduced length of the word. These two interlaced families will supply the alternating prefix sums in the walk construction.

Let $cal(S) = { u \, v \, u^(- 1) \, v^(- 1) }$, with positive letters $u \, v$ and negative letters $u^(- 1) \, v^(- 1)$. A word is #emph[reduced] if it has no adjacent inverse letters. Its reduced form is obtained by scanning from left to right: delete the last retained letter when its inverse arrives, and append the new letter otherwise. Choose intervals $\[ alpha_s \, beta_s \] subset \( 0 \, 1 \)$, $s in cal(S)$, with positive lengths and pairwise disjoint closures, and put

$ cal(A)_s = union.big_(j in bb(Z)) \[ alpha_s + j \, beta_s + j \) . $

#thm([Lemma 4.1.])[
  #emph[There are increasing homeomorphisms $h_s : bb(R) arrow.r bb(R)$ such that 
#[#set math.equation(numbering: n => "(12)")
 $ h_s \( y + 1 \) & = h_s \( y \) + 1 \, & h_(s^(- 1)) & = h_s^(- 1) \,\
h_s \( bb(R) \\ cal(A)_(s^(- 1)) \) & = cal(A)_s \, & \| h_s \( y \) - y \| & < 2 . $ <eq:periodic-action>]

 For a word $w = s_1 dots.h.c s_k$, write $h_w = h_(s_1) compose dots.h.c compose h_(s_k)$, with $h_diameter$ the identity. If $w$ is nonempty and reduced, then 
#[#set math.equation(numbering: n => "(13)")
 $ h_w \( 0 \) in "int" \( cal(A)_(s_1) \) \; $ <eq:interior>]

 in particular, $h_w \( 0 \) in.not bb(Z)$.]
] <lem:action>

#proof[
  For positive $s$, define $h_s$ to be affine on the intervals between the following three points, with the indicated values:
  $ y & alpha_(s^(- 1)) & beta_(s^(- 1)) & alpha_(s^(- 1)) + 1\
h_s \( y \) & beta_s - 1 & alpha_s & beta_s . $
  Both slopes are positive. Extend by $h_s \( y + 1 \) = h_s \( y \) + 1$, and define $h_(s^(- 1)) = h_s^(- 1)$. The complement intervals $\[ beta_(s^(- 1)) + j \, alpha_(s^(- 1)) + j + 1 \)$ map exactly onto $\[ alpha_s + j \, beta_s + j \)$, proving the set identity for positive letters. Taking complements and inverses proves it for negative letters. At the breakpoints $\| h_s \( y \) - y \| < 2$; the difference is affine between breakpoints and periodic. The same displacement bound holds for inverses.
  The point $0$ lies outside all the arc closures. Reading a reduced word from right to left, the first image lies in the interior of the arc of the rightmost letter. At every subsequent step this arc is disjoint from the inverse arc of the next letter, so the image enters the interior of that letter’s arc. This proves (13). ◻
]

Subtracting one for negative letters makes the interval indicator change sign under reversal. Define the periodic integer-valued functions

#[#set math.equation(numbering: n => "(14)")
 $ chi_s \( y \) = upright(bold(1))_(cal(A)_s) \( y \) - upright(bold(1))_({ s upright(" is negative") }) . $ <eq:chi>]

The complement identity gives

$ upright(bold(1))_(cal(A)_(s^(- 1))) \( h_s^(- 1) \( y \) \) = 1 - upright(bold(1))_(cal(A)_s) \( y \) \, $

and hence

#[#set math.equation(numbering: n => "(15)")
 $ chi_(s^(- 1)) \( h_s^(- 1) \( y \) \) = - chi_s \( y \) . $ <eq:chi-cancellation>]

For a word $w = s_1 dots.h.c s_k$ and an initial point $y_0 = y$, set

#[#set math.equation(numbering: n => "(16)")
 $ y_i = h_(s_i)^(- 1) \( y_(i - 1) \) \, #h(2em) c_w \( y \) = sum_(i = 1)^k chi_(s_i) \( y_(i - 1) \) . $ <eq:c-word>]

The final point is $y_k = h_w^(- 1) \( y \)$. Periodicity of the $chi_s$ and (12) give $c_w \( y + 1 \) = c_w \( y \)$. Deleting adjacent inverse letters leaves both the final point and $c_w \( y \)$ unchanged, by (15).

#thm([Lemma 4.2.])[
  (Two levels).  #emph[Let the reduced form of $w$ have length $ell > 0$, with $n_(+)$ positive letters and $n_(-)$ negative letters. For every $j in bb(Z)$, 
#[#set math.equation(numbering: n => "(17)")
 $ c_w \( j \) = - n_(-) \, #h(2em) c_w \( h_w \( 0 \) + j \) = n_(+) . $ <eq:two-levels>]

]
] <lem:two-levels>

#proof[
  We may replace $w$ by its reduced form $t_1 dots.h.c t_ell$. Start first at $j$. Before the first letter the point is outside every arc. If the point before $t_i$ is outside $cal(A)_(t_i)$, its inverse image under $h_(t_i)$ belongs to $cal(A)_(t_i^(- 1))$; this is disjoint from $cal(A)_(t_(i + 1))$ because the word is reduced. Thus every indicator $upright(bold(1))_(cal(A)_(t_i))$ in (16) is zero, giving the first equality.
  Starting instead at $h_w \( 0 \) + j$, the point before $t_i$ is $h_(t_i dots.h.c t_ell) \( 0 \) + j$. By (13) it lies in $cal(A)_(t_i)$, so every indicator is one. The sum is $ell - n_(-) = n_(+)$. ◻
]

For a word with nonempty reduced form, let $z in \( 0 \, 1 \)$ be the fractional part of $h_w \( 0 \)$. By periodicity, the two levels occur at the interlaced points

$ j < z + j < j + 1 \, #h(2em) c_w \( j \) = - n_(-) \, quad c_w \( z + j \) = n_(+) #h(2em) \( j in bb(Z) \) . $

The next construction places these points at fixed coordinate ranks throughout a chart trajectory.

== 5 Construction of the finite walks <sec:walks>

We now combine chart transport with the two-level cocycle. On matching transitions, moving landmarks keep their chart ranks; their prefix values will then yield a norm lower bound. We finish by checking how often matching transitions and a long reduced word occur together.

#proof[
  Fix a norm $N$ as in the proposition. We first construct labels with a common nonzero norm and normalize them at the end. For $k gt.eq 1$, put
  $ D_k = N \( underbrace(1 \, - 1 \, dots.h \, 1 \, - 1, k upright(" pairs")) \) . $
  These numbers are positive, and spreading invariance and the triangle inequality give $D_(k + l) lt.eq D_k + D_l$.
  #emph[Step 1: the finite chart chain.] Fix an integer $n gt.eq 1$, and let
  $ L = 8 \( n + 1 \) \, #h(2em) epsilon.alt = frac(1, 10 n) . $
  Use the homeomorphisms of Lemma 7. The landmarks below record the interval endpoints used by labels and all orbit points needed to follow $n$ steps. The integer shifts provide a margin around the label window. Let $Lambda$ be the following finite subset of $bb(R)$, in its usual order:
  #[#set math.equation(numbering: n => "(18)")
   $ Lambda =  & { alpha_s + j \, beta_s + j : s in cal(S) \, med 0 lt.eq j < L }\
 & quad union { h_w \( 0 \) + j : \| w \| lt.eq n \, med - 2 n lt.eq j lt.eq L + 2 n } . $ <eq:landmarks>]
  All displayed shifts $j$ are integers, $\| w \|$ denotes the length before reduction, the empty word is included, and coincident points are counted only once. For each $s$ use the partial order-preserving bijection
  $ T_s = h_s \|_(D_s) \, #h(2em) D_s = { a in Lambda : h_s \( a \) in Lambda } . $
  Its inverse is $T_(s^(- 1))$. Proposition 6 gives a finite stationary reversible marked chain on charts; denote its stationary chart law by $nu$. Call a transition $\( C \, s \, C' \)$ #emph[good] when
  #[#set math.equation(numbering: n => "(19)")
   $ C' \( a \) = C \( h_s \( a \) \) #h(2em) \( a in D_s \) . $ <eq:good>]
  Every step is good with probability at least $1 - epsilon.alt$.
  For positive $s$, define
  #[#set math.equation(numbering: n => "(20)")
   $ g \( C \, s \, C' \) = sum_(j = 0)^(L - 1) #scale(x: 120%, y: 120%)[\(] b_(C \( alpha_s + j \)) - b_(C \( beta_s + j \)) #scale(x: 120%, y: 120%)[\)] \, $ <eq:labels>]
  and define negative labels by oddness: $g \( C \, s \, C' \) = - g \( C' \, s^(- 1) \, C \)$. Strict increase of the charts and spreading invariance imply
  #[#set math.equation(numbering: n => "(21)")
   $ N \( g \( C \, s \, C' \) \) = D_L $ <eq:one-step-norm>]
  for every transition, good or otherwise.
  #emph[Step 2: transport along a good trajectory.] Consider a trajectory $\( C_(i - 1) \, s_i \, C_i \)_(i = 1)^n$ all of whose steps are good, and let $w = s_1 dots.h.c s_n$ have reduced length $ell > 0$. Put
  $ m = floor.l h_w \( 0 \) floor.r \, #h(2em) z = h_w \( 0 \) - m . $
  Since every letter moves every point by less than $2$, $\| h_w \( 0 \) \| < 2 n$, so $- 2 n lt.eq m lt.eq 2 n - 1$; and (13) gives $0 < z < 1$. For the integers $L \/ 4 lt.eq j lt.eq 3 L \/ 4$, define
  #[#set math.equation(numbering: n => "(22)")
   $ r_j = C_0 \( j \) \, #h(2em) t_j = C_0 \( z + j \) . $ <eq:rank-pairs>]
  These points belong to $Lambda$ by (18), and $r_j < t_j < r_(j + 1)$ whenever the indices occur.
  For either starting point $y_0 = j$ or $y_0 = z + j$, follow $y_i = h_(s_i)^(- 1) \( y_(i - 1) \)$. For the first family,
  $ y_i = h_(s_i^(- 1) dots.h.c s_1^(- 1)) \( 0 \) + j \; $
  for the second,
  $ y_i = h_(s_(i + 1) dots.h.c s_n) \( 0 \) + j - m . $
  The words have length at most $n$, and the shifts lie in $\[ - 2 n \, L + 2 n \]$. Thus all these points belong to $Lambda$. Moreover, for every $0 lt.eq i lt.eq n$,
  #[#set math.equation(numbering: n => "(23)")
   $ j - 2 n < y_i < j + 1 + 2 n \, $ <eq:transport-bounds>]
  and the whole interval lies in $\( 0 \, L \)$ for the chosen range of $j$. Because $h_(s_i) \( y_i \) = y_(i - 1)$, goodness gives
  #[#set math.equation(numbering: n => "(24)")
   $ C_i \( y_i \) = C_(i - 1) \( y_(i - 1) \) = C_0 \( y_0 \) . $ <eq:transport-rank>]
  #emph[Step 3: cumulative coefficient sums.] Let
  $ G = sum_(i = 1)^n g \( C_(i - 1) \, s_i \, C_i \) \, #h(2em) F \( k \) = sum_(a = 1)^k G_a quad \( 0 lt.eq k lt.eq B \) . $
  Every label has total coefficient sum zero, so $F \( 0 \) = F \( B \) = 0$. For landmarks $alpha < beta$ and $y$, strict increase of a chart gives
  $ sum_(a lt.eq C \( y \)) \( b_(C \( alpha \)) - b_(C \( beta \)) \)_a = upright(bold(1))_(\[ alpha \, beta \)) \( y \) . $
  This explains the half-open interval convention. Evaluate $F$ at a transported rank $C_0 \( y_0 \)$. For a positive step, (20), (24), and $y_(i - 1) in \( 0 \, L \)$ therefore give the contribution $upright(bold(1))_(cal(A)_(s_i)) \( y_(i - 1) \)$. For a negative step the label is read in chart $C_i$. Since $y_i in \( 0 \, L \)$ as well, its contribution is
  $ - upright(bold(1))_(cal(A)_(s_i^(- 1))) \( y_i \) = upright(bold(1))_(cal(A)_(s_i)) \( y_(i - 1) \) - 1 . $
  Thus in both cases the contribution is $chi_(s_i) \( y_(i - 1) \)$, and
  #[#set math.equation(numbering: n => "(25)")
   $ F \( C_0 \( y_0 \) \) = c_w \( y_0 \) . $ <eq:F-cocycle>]
  Reduction is applied to this scalar expression; $G$ retains all $n$ original edge labels. Let $n_(+) \, n_(-)$ be the numbers of positive and negative letters in the reduced word. Lemma 8, applied with the integer shifts $j$ and $j - m$, now gives
  #[#set math.equation(numbering: n => "(26)")
   $ F \( r_j \) = V := - n_(-) \, #h(2em) F \( t_j \) = U := n_(+) \, #h(2em) U - V = ell . $ <eq:F-levels>]
  #emph[Step 4: converting oscillations to norm.] Put $a = L \/ 4$ and $b = 3 L \/ 4$. The selected cuts and their prefix sums determine every consecutive block sum:
  $ upright("cut") & 0 & r_a & t_a & r_(a + 1) & dots.h.c & t_(b - 1) & r_b & B\
F & 0 & V & U & V & dots.h.c & U & V & 0\
upright("block sum") &  & V & ell & - ell & dots.h.c & ell & - ell & - V $
  The last row gives the sum of the block ending at that cut. There are $b - a = L \/ 2$ inner pairs. Replacing every block by its sum is contractive and yields
  #[#set math.equation(numbering: n => "(27)")
   $ \( V \, underbrace(ell \, - ell \, dots.h \, ell \, - ell, L \/ 2 upright(" pairs")) \, - V \) . $ <eq:compressed>]
  The last block is nonempty, since the rank $t_b$ from (22) satisfies $r_b < t_b lt.eq B$. We control the endpoint contribution by combining the estimate from all oscillations with the estimate from a single level. Subtracting the endpoint array by the triangle inequality and using $\| V \| lt.eq ell$ gives
  $ N \( G \) gt.eq ell D_(L \/ 2) - \| V \| D_1 gt.eq ell \( D_(L \/ 2) - D_1 \) . $
  Independently, partitioning just at an $r_j$ or a $t_j$ gives the arrays $\( V \, - V \)$ and $\( U \, - U \)$. Hence
  $ N \( G \) gt.eq max { \| V \| \, U } D_1 gt.eq ell / 2 D_1 . $
  For nonnegative $A \, B$, $max { A - B \, B \/ 2 } gt.eq A \/ 3$. Together with $D_L lt.eq 2 D_(L \/ 2)$, this proves
  #[#set math.equation(numbering: n => "(28)")
   $ N \( G \) gt.eq ell / 3 D_(L \/ 2) gt.eq ell / 6 D_L . $ <eq:linear-displacement>]
  #emph[Step 5: probability and normalization.] The probability that at least one transition fails to be good is at most $n epsilon.alt = 1 \/ 10$, by stationarity and the union bound. Without conditioning on goodness, the letters are independent and uniform in $cal(S)$. As letters are appended, the reduced length has conditional expected increment $1 \/ 2$ when positive, since exactly one of the four letters cancels its last letter; at zero the increment is $1$. Thus $bb(E) ell gt.eq n \/ 2$. Since $0 lt.eq ell lt.eq n$,
  $ n / 2 lt.eq bb(E) ell lt.eq n / 4 + n bb(P) { ell gt.eq n \/ 4 } \, #h(2em) upright("so") #h(2em) bb(P) { ell gt.eq n \/ 4 } gt.eq 1 / 4 . $
  With probability at least $1 \/ 4 - 1 \/ 10 = 3 \/ 20$, all steps are good and $ell gt.eq n \/ 4$. On this event (28) gives $N \( G \) gt.eq n D_L \/ 24$. Every edge label has norm $D_L > 0$ by (21), so dividing all labels by $D_L$ proves the proposition. ◻
]

== 6 Construction of the spreading norm <app:norm>

We prove the ordered-norm lemma used in the reduction. Its spreading-model and subdivision steps follow the approach of Brunel and Sucheston [3,4]; their later work develops the resulting equal-sign-additive basis [5]. The classical conclusion, recorded in [14] Theorem 2.2, is that every nonreflexive Banach space finitely represents a Banach space with an equal-sign-additive basis. We give the finite-array construction of the norm properties needed here.

#proof[
  By (2), there is a nonreflexive Banach space $Y$ finitely representable in $X$. Identify $Y$ with its canonical image in $Y^(* *)$, and choose $v in B_(Y^(* *))$ and $d > 0$ with $"dist" \( v \, Y \) > d$.
  The first limit will produce a spreading norm $N_0$, finitely representable in $Y$, that controls coefficient prefix sums. A second limit averages increasingly fine subdivisions. It preserves these properties and makes the resulting norm $N$ invariant under subdivision. Same-sign merging then preserves $N$, and convexity gives contractive merging for arbitrary adjacent coefficients.
  #emph[Step 1: finite triangular arrays.] For every integer $M gt.eq 1$, we construct $y_1 \, dots.h \, y_M in B_Y$ and $f_1 \, dots.h \, f_M in B_(Y^(*))$ such that
  #[#set math.equation(numbering: n => "(29)")
   $ f_i \( y_j \) = 0 quad \( j < i \) \, #h(2em) \| f_i \( y_j \) - d \| lt.eq M^(- 1) quad \( j gt.eq i \) . $ <eq:triangle>]
  Suppose $y_1 \, dots.h \, y_(i - 1)$ have been chosen and let $E = "span" { y_1 \, dots.h \, y_(i - 1) }$. The restriction map $Y^(* *) arrow.r \( E^perp \)^(*)$ is a quotient map with kernel the canonical copy of $E$: Hahn–Banach extends every bounded functional on $E^perp subset.eq Y^(*)$ to all of $Y^(*)$ with the same norm, while finite dimensionality gives $\( E^perp \)^perp = E$. Thus the quotient norm of $v + E$ equals the norm of its restriction to $E^perp$. Hence
  $ ∥v \|_(E^perp)∥ = "dist" \( v \, E \) gt.eq "dist" \( v \, Y \) > d . $
  We may therefore choose $f_i in B_(Y^(*)) ∩ E^perp$ with $v \( f_i \) = d$, by changing a sign and rescaling if necessary. The finite-dimensional form of Goldstine’s theorem gives $y_i in B_Y$ with $\| f_h \( y_i \) - v \( f_h \) \| lt.eq M^(- 1)$ for $1 lt.eq h lt.eq i$. Indeed, $\( v \( f_1 \) \, dots.h \, v \( f_i \) \)$ belongs to the closure of ${ \( f_1 \( y \) \, dots.h \, f_i \( y \) \) : y in B_Y }$: otherwise a separating linear functional would give $v \( f \) > sup_(y in B_Y) f \( y \) = parallel f parallel$ for some $f in "span" { f_1 \, dots.h \, f_i }$, contradicting $parallel v parallel lt.eq 1$. This proves (29) inductively.
  Read the vectors in the reverse order. For any subtuple $y_(i_1) \, dots.h \, y_(i_m)$ with $i_1 > dots.h.c > i_m$, the functional $f_(i_j)$ annihilates the terms after the $j$th and approximates $d$ on the first $j$ terms. Consequently,
  #[#set math.equation(numbering: n => "(30)")
   $ d max_(1 lt.eq j lt.eq m) lr(|sum_(h = 1)^j a_h|) - 1 / M sum_(h = 1)^m \| a_h \| lt.eq ∥sum_(h = 1)^m a_h y_(i_h)∥ lt.eq sum_(h = 1)^m \| a_h \| . $ <eq:finite-prefix>]
  #emph[Step 2: a spreading limit.] Fix $k$. For each $m lt.eq k$, choose a finite grid in $\[ - 1 \, 1 \]^m$ with mesh at most $k^(- 2)$ in the maximum norm. Color every increasing $m$-subtuple of the reversed array by the list of the norms of its grid combinations, rounded into intervals of length $k^(- 1)$. The number of colors is finite and independent of $M$. The finite Ramsey theorem, applied successively for $m = 1 \, dots.h \, k$, shows that, for sufficiently large $M = M_k gt.eq k^3$, there is a tuple $\( x_1^(\( k \)) \, dots.h \, x_k^(\( k \)) \)$ on which all these colorings are homogeneous. At each arity, thin a previously homogeneous set; homogeneity from earlier arities persists under this thinning. For fixed $m lt.eq k$ and $a in \[ - 1 \, 1 \]^m$, the norms of the combinations with coefficients $a$ on any two increasing $m$-subtuples differ by at most
  $ k^(- 1) + 2 m k^(- 2) lt.eq 3 k^(- 1) . $
  The additional error follows from the upper bound in (30).
  Taking a diagonal subsequence over all finite rational coefficient tuples, and then using the common $ell_1$ Lipschitz bound, gives limits
  $ N_0 \( a_1 \, dots.h \, a_m \) = lim_(k arrow.r oo) ∥sum_(i = 1)^m a_i x_i^(\( k \))∥ . $
  The limits are compatible with appending zeros. The vanishing subtuple oscillations give (3) for $N_0$. Passing to the limit in (30) yields
  #[#set math.equation(numbering: n => "(31)")
   $ d max_j lr(|sum_(i = 1)^j a_i|) lt.eq N_0 \( a \) lt.eq sum_i \| a_i \| . $ <eq:N0-bounds>]
  The norm axioms pass to the limit, and the lower bound gives positive definiteness. On each fixed coefficient cube the convergence is uniform, by the common Lipschitz bound and compactness. Moreover,
  #[#set math.equation(numbering: n => "(32)")
   $ N_0 \( a \) gt.eq d / 2 max_i \| a_i \| \, $ <eq:nondegenerate>]
  since every coefficient is the difference of two successive prefix sums. Thus the maps $a mapsto sum_i a_i x_i^(\( k \))$ give linear embeddings of every fixed coordinate span into $Y$ with distortions tending to $1$.
  #emph[Step 3: averaging subdivisions.] For positive integers $J_1 \, dots.h \, J_m$, let $F_(bold(J)) a$ be the array obtained by replacing $a_i$ by $J_i$ copies of $a_i \/ J_i$. Write $F_J$ when all multiplicities equal $J$. If $J_i lt.eq M_i$ for every $i$, then
  #[#set math.equation(numbering: n => "(33)")
   $ N_0 \( F_(bold(M)) a \) lt.eq N_0 \( F_(bold(J)) a \) . $ <eq:dilation-monotone>]
  Indeed, in the $i$th block of length $M_i$, select a uniformly random $J_i$-element subset and place $a_i \/ J_i$ in those positions, with zeros elsewhere. Every resulting array is obtained from $F_(bold(J)) a$ by inserting zeros, so has the same $N_0$ norm. Its mean is $F_(bold(M)) a$, and convexity proves the claim.
  It follows that
  #[#set math.equation(numbering: n => "(34)")
   $ N \( a \) = lim_(J arrow.r oo) N_0 \( F_J a \) $ <eq:N-definition>]
  exists. The bounds in (31) survive subdivision, because the original prefix sums still occur at the ends of the blocks. Consequently, for every $a = \( a_1 \, dots.h \, a_m \)$,
  #[#set math.equation(numbering: n => "(35)")
   $ d max_(1 lt.eq j lt.eq m) lr(|sum_(i = 1)^j a_i|) lt.eq N \( a \) lt.eq sum_(i = 1)^m \| a_i \| . $ <eq:prefix-bounds>]
  Spreading invariance and the norm axioms also pass to the limit. The functions $a mapsto N_0 \( F_J a \)$ again have the common $ell_1$ Lipschitz bound, so convergence is uniform on every fixed coefficient cube. The lower bound (32) also holds for $N$. Fix a source dimension $m$ and $eta > 0$. First choose $J$ so that $F_J$ embeds the $m$-dimensional $N$ span into the $m J$-dimensional $N_0$ span with distortion less than $1 + eta$. Indeed, uniform additive convergence on the compact $N$-unit sphere, together with (32), gives uniform relative error. Approximate this now fixed $N_0$ span in $Y$ with distortion less than $1 + eta$, and then embed its finite-dimensional image into $X$ with distortion less than $1 + eta$. The composite distortion is less than $\( 1 + eta \)^3$; letting $eta arrow.b 0$ proves (iii).
  #emph[Step 4: consecutive summation.] First, $N$ is unchanged by every fixed varying-multiplicity subdivision:
  #[#set math.equation(numbering: n => "(36)")
   $ N \( F_(bold(J)) a \) = N \( a \) . $ <eq:subdivision-invariance>]
  To see this, put $J_(-) = min_i J_i$ and $J_(+) = max_i J_i$. The composite $F_r F_(bold(J))$ replaces each $a_i$ by $r J_i$ equal pieces. Thus, for every $r$,
  $ N_0 \( F_(r J_(+)) a \) lt.eq N_0 \( F_r F_(bold(J)) a \) lt.eq N_0 \( F_(r J_(-)) a \) $
  by (33); let $r arrow.r oo$.
  If adjacent nonzero coefficients have the same sign and rational ratio, subdivide them into equal pieces. Subdividing their sum into the combined number of pieces gives the identical array. Equation (36) shows that merging these coefficients preserves $N$. Continuity extends this statement to every same-sign pair, and spreading invariance handles zeros.
  Fix all other coefficients and fix $s eq.not 0$. The function
  $ t mapsto N \( dots.h \, t \, s - t \, dots.h \) $
  is convex and is constant, at the merged norm $N \( dots.h \, s \, dots.h \)$, on the nondegenerate interval with endpoints $0$ and $s$. A convex function constant on a nondegenerate interval is at least that constant everywhere: a smaller exterior value, together with the farther endpoint, would force the nearer endpoint below that constant. This proves (4) when $s eq.not 0$. Letting $s arrow.r 0$ proves it for $s = 0$ as well. ◻
]

#heading(level: 1)[References]
#bibitem([1])[K.~Ball, #emph[Markov chains, Riesz transforms and Lipschitz maps], Geometric and Functional Analysis #strong[2] (1992), 137--172. #link("https://doi.org/10.1007/BF01896971")[doi:10.1007/BF01896971].]
#bibitem([2])[J.~Bourgain, #emph[The metrical interpretation of superreflexivity in Banach spaces], Israel Journal of Mathematics #strong[56] (1986), 222--230. #link("https://doi.org/10.1007/BF02766125")[doi:10.1007/BF02766125].]
#bibitem([3])[A.~Brunel and L.~Sucheston, #emph[On B-convex Banach spaces], Mathematical Systems Theory #strong[7] (1973), 294--299. #link("https://doi.org/10.1007/BF01795947")[doi:10.1007/BF01795947].]
#bibitem([4])[A.~Brunel and L.~Sucheston, #emph[On J-convexity and some ergodic super-properties of Banach spaces], Transactions of the American Mathematical Society #strong[204] (1975), 79--90. #link("https://doi.org/10.1090/S0002-9947-1975-0380361-2")[doi:10.1090/S0002-9947-1975-0380361-2].]
#bibitem([5])[A.~Brunel and L.~Sucheston, #emph[Equal signs additive sequences in Banach spaces], Journal of Functional Analysis #strong[21] (1976), 286--304. #link("https://doi.org/10.1016/0022-1236(76)90041-0")[doi:10.1016/0022-1236(76)90041-0].]
#bibitem([6])[P.~Enflo, #emph[Banach spaces which can be given an equivalent uniformly convex norm], Israel Journal of Mathematics #strong[13] (1972), 281--288. #link("https://doi.org/10.1007/BF02762802")[doi:10.1007/BF02762802].]
#bibitem([7])[R.~C.~James, #emph[Super-reflexive Banach spaces], Canadian Journal of Mathematics #strong[24] (1972), 896--904. #link("https://doi.org/10.4153/CJM-1972-089-7")[doi:10.4153/CJM-1972-089-7].]
#bibitem([8])[R.~C.~James, #emph[Nonreflexive spaces of type 2], Israel Journal of Mathematics #strong[30] (1978), 1--13. #link("https://doi.org/10.1007/BF02760825")[doi:10.1007/BF02760825].]
#bibitem([9])[W.~B.~Johnson and G.~Schechtman, #emph[Diamond graphs and super-reflexivity], Journal of Topology and Analysis #strong[1] (2009), 177--189. #link("https://doi.org/10.1142/S1793525309000114")[doi:10.1142/S1793525309000114].]
#bibitem([10])[J.~R.~Lee, A.~Naor, and Y.~Peres, #emph[Trees and Markov convexity], Geometric and Functional Analysis #strong[18] (2009), 1609--1659. #link("https://doi.org/10.1007/s00039-008-0689-0")[doi:10.1007/s00039-008-0689-0].]
#bibitem([11])[M.~Mendel and A.~Naor, #emph[Markov convexity and local rigidity of distorted metrics], Journal of the European Mathematical Society #strong[15] (2013), 287--337. #link("https://doi.org/10.4171/JEMS/362")[doi:10.4171/JEMS/362].]
#bibitem([12])[A.~Naor, #emph[An introduction to the Ribe program], Japanese Journal of Mathematics #strong[7] (2012), 167--233. #link("https://doi.org/10.1007/s11537-012-1222-7")[doi:10.1007/s11537-012-1222-7].]
#bibitem([13])[A.~Naor, Y.~Peres, O.~Schramm, and S.~Sheffield, #emph[Markov chains in smooth Banach spaces and Gromov-hyperbolic metric spaces], Duke Mathematical Journal #strong[134] (2006), 165--197. #link("https://doi.org/10.1215/S0012-7094-06-13415-4")[doi:10.1215/S0012-7094-06-13415-4].]
#bibitem([14])[M.~I.~Ostrovskii, #emph[Connections between metric characterizations of superreflexivity and the Radon--Nikodym property for dual Banach spaces], Canadian Mathematical Bulletin #strong[58] (2015), 150--157. #link("https://doi.org/10.4153/CMB-2014-049-9")[doi:10.4153/CMB-2014-049-9].]
#bibitem([15])[M.~I.~Ostrovskii and B.~Randrianantoanina, #emph[A new approach to low-distortion embeddings of finite metric spaces into non-superreflexive Banach spaces], Journal of Functional Analysis #strong[273] (2017), 598--651. #link("https://doi.org/10.1016/j.jfa.2017.03.017")[doi:10.1016/j.jfa.2017.03.017].]
#bibitem([16])[G.~Pisier, #emph[Martingales with values in uniformly convex spaces], Israel Journal of Mathematics #strong[20] (1975), 326--350. #link("https://doi.org/10.1007/BF02760337")[doi:10.1007/BF02760337].]


