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

#align(center)[#text(size: 16pt, weight: "bold")[An exponential state lower bound for \
two-way nondeterministic complementation]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A two-way nondeterministic finite automaton (2NFA) has a finite set of states and a single read-only head,
  which may move in either direction along an input bounded by endmarkers.
  It accepts when some finite computation reaches an accepting state.
  The complementation problem asks whether every $n$-state 2NFA over a finite alphabet $Sigma$ has a 2NFA for the
  complementary language with at most $p \( n \)$ states, for one polynomial $p$ independent of $Sigma$.
  We answer this question negatively.

For exact state counts, there is one initial state and a set of accepting states.
  Each transition depends only on the current state and scanned symbol, updates the state,
  and moves the head left, right, or not at all. We start the head on the left endmarker and forbid moves beyond
  either endmarker. Missing transitions reject that branch; infinite nonaccepting computations do not accept.
  An accepting initial configuration counts as acceptance. All states, including initial and accepting states,
  are counted. A deterministic two-way automaton (2DFA) has at most one successor for each state and scanned symbol.

For a finite set $H$, let $cal(R)_H$ denote all binary relations on $H$. Products are composed in path order:
  $\( p \, r \) in A B$ if and only if $\( p \, q \) in A$ and $\( q \, r \) in B$ for some $q$.
  Use $Sigma_H = cal(R)_H$ as an input alphabet. The product $r \( w \)$ of a word $w =
  R_1 dots.h.c R_k$ is $R_1 dots.h.c R_k$, and the empty product is $r \( epsilon \) = I_H = { \( p \, p \) :
  p in H }$. Define the relation-product liveness language

$ L_H = { w in Sigma_H^(*) : r \( w \) eq.not diameter } . $

In particular, $L_H$ contains the empty word when $H$ is nonempty.
  For nonempty words, this is Sakoda and Sipser’s family $B_h$,
  where $h = \| H \|$ #cite(label("SakodaSipser1978")) Section 2.1 and Theorem 2.3;
  the name #emph[one-way liveness] is used in #cite(label("Kapoutsis2006")) Section 2.2.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 4$, set $H = { 1 \, dots.h \, n - 2 }$ and $Sigma_n = cal(R)_H$.
    There is an $n$-state 2NFA $A_n$ recognizing $L_H$ such that every 2NFA recognizing
    $Sigma_n^(*) \\ L \( A_n \)$ has at least
$ 1 / 2 thin 2^(floor.l \( n - 4 \) \/ 127 floor.r) - 1 $

 states. In particular, there is no polynomial state bound for complementation that is independent of the finite
   alphabet.]
] <main:theorem>

The alphabet $Sigma_n$ consists of all binary relations on a set of $n - 2$ points, so $\| Sigma_n \| =
  2^(\( n - 2 \)^2)$. The parameter is the number of states, not the size of the transition table.
  Theorem 1 concerns bounds uniform over finite alphabets; it does not assert a lower bound over one fixed alphabet.

===== 1.1 History and significance. <history-and-significance.>

Sakoda and Sipser’s work on nondeterminism and two-way finite automata #cite(label("SakodaSipser1978")) initiated
  the central state-succinctness problem of simulating two-way nondeterministic automata deterministically.
  Complementation is a separate question: here the target remains nondeterministic.
  Vardi’s construction gives an exponential-state one-way nondeterministic automaton for the complement of a
  two-way nondeterministic automaton #cite(label("Vardi1989")) Theorem 3.2.
  It certifies nonacceptance by locally consistent sets of states.
  For sweeping automata, whose head can reverse direction only at the endmarkers,
  Kapoutsis proved that the complement of one-way liveness requires exponentially many states in every sweeping
  2NFA #cite(label("Kapoutsis2006")) Theorem 1. Theorem 1 allows unrestricted two-way motion in the complementing
  automaton.

For deterministic two-way automata, complementation has a linear state bound independent of the alphabet
  #cite(label("GeffertMereghettiPighizzini2007")). Guillon, Prigioniero,
  and Taheri describe polynomial 2NFA complementation as open #cite(label("GuillonPrigionieroTaheri2026"))
  Section 1 and give polynomial complementation by 1-limited automata #cite(label("GuillonPrigionieroTaheri2026"))
  Theorem 4.1. These automata may rewrite a tape cell on its first visit;
  this resource is absent from the read-only model considered here.
  Theorem 1 resolves the alphabet-uniform polynomial complementation question negatively.
  The same growing-alphabet family also requires exponentially many states in every equivalent deterministic
  two-way automaton: a smaller deterministic simulator could be complemented with linear state overhead.
  Corollary 16 makes this implication explicit, including the treatment of infinite nonaccepting computations.

The companion paper #cite(label("CompanionDeterminization2026")) Theorem 1.1 proves a deterministic lower bound
  with a larger exponential rate for the same language, by an independent matching-diagram argument.
  We compare the exact bounds after Corollary 16. The new obstruction here applies even when the complementing
  machine is nondeterministic.

===== 1.2 The argument. <the-argument.>

An automaton with $h + 2$ states guesses a path through the relations and accepts exactly when their product is
  nonempty. We prove that recognizing product emptiness requires exponentially many states.

The proof separates a representation of computations from a finite algebraic lower bound.
  A segment of a computation is represented by four relations recording the possible entries and exits through its
  two boundaries. These #emph[path diagrams] compose by joining boundaries.
  Their monoid is the monoid of partitioned binary relations introduced by Martin and Mazorchuk
  #cite(label("MartinMazorchuk2013")) Sections 2.1–2.3, written with separate labels for the two directions of
  travel. Adding edges only increases the available accepting paths.
  On the other hand, singleton relation contexts test the absence of any prescribed pair.
  Consequently a machine for product emptiness induces a surjective multiplicative map from its path diagrams to
  the relation monoid that reverses inclusion.

To bound such maps, we attach recurrent classes of boundary labels to an idempotent diagram $e$, meaning $e^2 =
  e$. These classes group labels joined in both directions by through paths together with returns.
  Their precise definition is given in Section 2. The diagrams $z$ satisfying $e z = z e =
  z$ form a submonoid with identity $e$, called its #emph[corner].
  Such a $z$ may destroy the loops on some of those classes; we record the destroyed classes as a missing set.
  Two structural facts control this loss. First, one common missing-set bound transports through any fixed diagram
  context with only a factor of two. Second, along a chain of nested idempotents the sum of successive losses is
  bounded by twice a single initial missing-set budget. The second fact permits the corner identity to change
  during the argument.

For an integer parameter $t$, the amplification step converts $2
  t$ conjugates of one relation with an added off-diagonal pair into $t^2$ additions sharing a common budget.
  Each addition, after restriction to a smaller relation corner, incurs an inductively bounded loss.
  Taking $t = 64$ gives the exponential recurrence. This strategy adapts the conjugate-amplification pattern of
  the matching-diagram rank-loss argument in #cite(label("CompanionDeterminization2026")) Section 3;
  that argument concerns a deterministic state lower bound.
  Here all diagram paths may be nondeterministic, and the transport and nested-class bounds are proved anew.
  They are stated independently of automata and may be useful for other order-reversing images of finite path monoids.

Section 2 states the algebraic bound and derives the order-reversing map before developing recurrent classes and
  transport. Section 3 proves the chain bound, and Section 4 proves the algebraic lower bound.
  Section 5 proves the promised automata representation and completes the proof of Theorem 1.

The bounds impose no restriction on input length or on the running time of a successful computation.
  They compare finite-state machines without a work tape, and give no separation between uniform logarithmic-space
  complexity classes.

== 2 Path diagrams and missing recurrent classes <sec:diagrams>

We first describe finite paths through a segment, without assuming that the paths come from an automaton.
  Our goal is a loss measure that detects edge inclusion and remains controlled when a segment is put in context.

Relations are composed in #emph[path order]: $x \( A B \) y$ means that $x A z$ and $z B y$ for some $z$.
  On a single set, $A^(*)$ denotes the reflexive transitive closure, so it includes paths of length zero.
  We use the elementary path identities

#[#set math.equation(numbering: n => "(2.1)")
 $ \( A union B \)^(*) = A^(*) \( B A^(*) \)^(*) \, wide A \( B A \)^(*) = \( A B \)^(*) A . $ <diag:star>]

The first groups successive $A$-steps between $B$-steps; the second groups the same alternating path from its
  opposite end. These identities hold whenever the relation types permit the displayed products.

=== 2.1 The diagram monoid <the-diagram-monoid>

Fix disjoint sets $D^(+)$ and $D^(-)$, each of size $m gt.eq 1$. A diagram $a$ consists of four arbitrary relations

$ F_a subset.eq D^(+) times D^(+) \, quad B_a subset.eq D^(-) times D^(-) \, quad L_a subset.eq D^(+) times
  D^(-) \, quad R_a subset.eq D^(-) times D^(+) . $

Entering the segment on the left uses a label of $D^(+)$;
  $F_a$ records an exit on the right and $L_a$ an exit on the left.
  Entering on the right uses a label of $D^(-)$; $B_a$ records an exit on the left and $R_a$ an exit on the right.
  The relations $F_a \, B_a$ are the #emph[through relations], and $L_a \, R_a$ are the #emph[return relations];
  see Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.4, -0.35), (6.6, 2.35), fill: rgb("#f7f7f7"), stroke: none)
  line((0.4, -0.4), (0.4, 2.4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((6.6, -0.4), (6.6, 2.4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((1, 2), [#text(size: 9pt)[$D^+$]])
  content((1, 0), [#text(size: 9pt)[$D^-$]])
  content((6, 2), [#text(size: 9pt)[$D^+$]])
  content((6, 0), [#text(size: 9pt)[$D^-$]])
  line((1.307, 2), (5.693, 2), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.5, 2), [#text(size: 9pt)[$F_a$]], anchor: "south", padding: 0.1176cm)
  line((5.693, 0), (1.307, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.5, 0), [#text(size: 9pt)[$B_a$]], anchor: "north", padding: 0.1176cm)
  bezier((1, 2), (1, 0), (0.5526, 1.361), (0.5526, 0.6389), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.6645, 1), [#text(size: 9pt)[$L_a$]], anchor: "east", padding: 0.1176cm)
  bezier((6, 0), (6, 2), (6.447, 0.6389), (6.447, 1.361), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.336, 1), [#text(size: 9pt)[$R_a$]], anchor: "west", padding: 0.1176cm)
  content((3.5, 1), [#text(size: 9pt)[segment $a$]])
  content((-0.15, 2), [#text(size: 9pt)[entry]], anchor: "east", padding: 0.1176cm)
  content((-0.15, 0), [#text(size: 9pt)[exit]], anchor: "east", padding: 0.1176cm)
  content((7.15, 2), [#text(size: 9pt)[exit]], anchor: "west", padding: 0.1176cm)
  content((7.15, 0), [#text(size: 9pt)[entry]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The four relations of a path diagram. Each arrow represents a relation between entire label sets, not a single deterministic edge. In a product, an exit enters the neighboring segment with the same label. ],
) <fig:diagram>

Place diagrams in a line. At each internal boundary, identify an exit with the entry of the neighboring diagram
  bearing the same label. The product records finite paths from an outer entry to the first outer exit,
  with all earlier joins internal. A traversal of any consecutive block can be replaced by one edge of the block’s
  product, and that edge can conversely be expanded into a finite traversal. This proves associativity.
  The diagram with $F$ and $B$ identity relations and $L \, R$ empty is the identity.
  Thus the diagrams form a finite monoid $cal(T)_m$.

This is the degree-$m$ monoid of partitioned binary relations of Martin and Mazorchuk
  #cite(label("MartinMazorchuk2013")) Sections 2.1–2.3. To identify the two descriptions,
  label $D^(+)$ and $D^(-)$ by a common $m$-element set. At each boundary,
  an entry and an exit with the same underlying label give one vertex.
  The four relations above become the four blocks of a binary relation on the left and right vertex sets.
  A join always switches from one factor to its neighbor, exactly as in their alternating-path composition.
  We have included the path expansion and contraction proof of associativity to fix the finite-path convention
  used below.

Write $a subset.eq.sq b$ when all four relations of $a$ are included in the corresponding relations of $b$.
  Products preserve this order in each argument. Joining two diagrams at one boundary gives

#[#set math.equation(numbering: n => "(2.2)")
 $ F_(a b) & = F_a \( L_b R_a \)^(*) F_b \, & B_(a b) & = B_b \( R_a L_b \)^(*) B_a \,\
L_(a b) & = L_a union F_a \( L_b R_a \)^(*) L_b B_a \, & R_(a b) & =
  R_b union B_b R_a \( L_b R_a \)^(*) F_b . $ <diag:product>]

For example, a forward path crosses $a$, alternates returns at the join, and crosses $b$.
  Reflection exchanges $D^(+)$ with $D^(-)$, $F$ with $B$, and $L$ with $R$, while reversing product order.
  We will prove symmetric statements for the positive sign and obtain the negative sign by this reflection.

=== 2.2 From complementation to an order-reversing image <from-complementation-to-an-order-reversing-image>

The algebraic obstruction to complementation is the following bound.
  As in the introduction, $cal(R)_H$ is the monoid of all binary relations on $H$, composed in path order.

#thm([Theorem 2.1.])[
  (Order-reversing image bound).  #emph[ Let $m gt.eq 1$, let $H$ be a finite set of cardinality $h gt.eq 2$,
    and let $S_0$ be a submonoid of $cal(T)_m$. Suppose that a surjective multiplicative map $phi.alt_0 :
    S_0 arrow.r cal(R)_H$ satisfies
#[#set math.equation(numbering: n => "(2.3)")
 $ z subset.eq.sq w quad arrow.r.double quad phi.alt_0 \( w \) subset.eq phi.alt_0 \( z \)
   wide \( z \, w in S_0 \) . $ <amp:reverse>]

 Then
#[#set math.equation(numbering: n => "(2.4)")
 $ 2 m gt.eq 2^(floor.l \( h - 2 \) \/ 127 floor.r) . $ <amp:bound>]

 The map need not initially be assumed to preserve identities.]
] <amp:image>

The proof is completed in Section 4. We first explain the automata reduction,
  using the finite-computation representation below. Its construction, proved in Section 5.2,
  uses one additional state to represent success by an exit past the right endmarker.
  Local diagram edges record finitely many stay moves followed by one move out of a cell;
  no bound on repeated crossings is imposed.

#thm([Lemma 2.2.])[
  #emph[Let $B$ be an $s$-state 2NFA over a finite alphabet $Sigma$ in the model fixed in the introduction.
    There are a monoid homomorphism
$ tau : Sigma^(*) arrow.r cal(T)_(s + 1) \, $

 two fixed endmarker diagrams $lambda \, rho in cal(T)_(s + 1)$, and fixed positive labels $a \, b$ such that,
   for every word $w$,
#[#set math.equation(numbering: n => "(2.5)")
 $ w in L \( B \) quad arrow.l.r.double quad \( a \, b \) in F_(lambda tau \( w \) rho) . $ <auto:recognition>]

 Consequently, if $tau \( u \) subset.eq.sq tau \( v \)$, then
#[#set math.equation(numbering: n => "(2.6)")
 $ alpha u beta in L \( B \) quad arrow.r.double quad alpha v beta in L \( B \)
   wide \( alpha \, beta in Sigma^(*) \) . $ <auto:context-monotonicity>]

]
] <auto:representation>

The acceptance equivalence immediately implies the stated monotonicity in arbitrary word contexts:

#proof[
  #emph[Derivation of context monotonicity.] Diagram multiplication is increasing in each factor.
    If $tau \( u \) subset.eq.sq tau \( v \)$, then
  $ lambda tau \( alpha \) tau \( u \) tau \( beta \) rho med subset.eq.sq med
    lambda tau \( alpha \) tau \( v \) tau \( beta \) rho . $
  The designated forward edge persists under this inclusion. Applying (2.5) proves (2.6). ◻
]

For relation-product emptiness, singleton contexts convert this increasing behavior of acceptance into a
  decreasing relation image. For $F subset.eq H$, write $I_F = { \( x \, x \) : x in F }$.
  A multiplicative map is #emph[unital] if it preserves identities.

#thm([Proposition 2.3.])[
  #emph[Let $H$ be a finite set with at least two elements.
    If an $s$-state 2NFA recognizes $Sigma_H^(*) \\ L_H$, then a submonoid of $cal(T)_(s + 1)$ admits a surjective
    unital homomorphism $phi.alt$ onto $cal(R)_H$ satisfying
#[#set math.equation(numbering: n => "(2.7)")
 $ z subset.eq.sq z' quad arrow.r.double quad phi.alt \( z' \) subset.eq phi.alt \( z \) . $ <auto:reverse-order>]

]
] <auto:order-reversal>

#proof[
  Apply Lemma 3 to the complementing machine, and let $S = tau \( Sigma_H^(*) \)$.
    Suppose $tau \( u \) subset.eq.sq tau \( v \)$. For each $p \, q in H$, take the one-letter words
  $ alpha = I_({ p }) \, wide beta = I_({ q }) . $
  They belong to $Sigma_H$, and
  $ I_({ p }) r \( u \) I_({ q }) =
    cases(delim: "{", { \( p \, q \) } \, & \( p \, q \) in r \( u \) \,, diameter \, & \( p \, q \) in.not r \(
    u \) .) $
  Since the machine accepts exactly the words with empty relation product, (2.6) implies
  $ \( p \, q \) in.not r \( u \) quad arrow.r.double quad \( p \, q \) in.not r \( v \) . $
  Thus
  #[#set math.equation(numbering: n => "(2.8)")
   $ tau \( u \) subset.eq.sq tau \( v \) quad arrow.r.double quad r \( v \) subset.eq r \( u \) . $ <auto:word-order>]
  If $tau \( u \) = tau \( v \)$, applying (2.8) in both directions yields $r \( u \) = r \( v \)$. Therefore
  $ phi.alt : S arrow.r cal(R)_H \, wide phi.alt \( tau \( w \) \) = r \( w \) \, $
  is well-defined. Concatenation of words proves multiplicativity,
    and the empty word proves preservation of the identity. It is surjective because every relation in $cal(R)_H$
    is itself a letter of $Sigma_H$. Equation (2.8) is exactly the required order reversal (2.7). ◻
]

With $m = s + 1$, Theorem 2 therefore bounds the states of a complementing machine.
  Section 5 constructs the $h + 2$-state source machine and completes the numerical deduction.
  It remains to prove the algebraic bound. The next subsection associates at most $2
  m$ recurrent classes with an idempotent diagram. We will measure loss by the classes whose through loops are
  missing, and force that loss to grow exponentially with $h$.

=== 2.3 Recurrent classes in a corner <recurrent-classes-in-a-corner>

For an idempotent $e in cal(T)_m$, define

#[#set math.equation(numbering: n => "(2.9)")
 $ K_e^(+) & = \( L_e R_e \)^(*) \, & P_e^(+) & = K_e^(+) F_e K_e^(+) \,\
K_e^(-) & = \( R_e L_e \)^(*) \, & P_e^(-) & = K_e^(-) B_e K_e^(-) . $ <diag:KP>]

When working only with the positive sign we omit superscripts. By $e^2 = e$ and (2.2),

#[#set math.equation(numbering: n => "(2.10)")
 $ F_e K_e F_e = F_e \, wide P_e^2 = P_e . $ <diag:idempotent>]

In particular, $P_e$ is transitive. A point $x in D^sigma$ is #emph[recurrent] if $x P_e^sigma x$.
  Mutual relatedness under $P_e^sigma$ is an equivalence relation on the recurrent points.
  Let $cal(C)_e$ be the collection of its classes for both signs, keeping the signs distinct. Then

#[#set math.equation(numbering: n => "(2.11)")
 $ \| cal(C)_e \| lt.eq 2 m . $ <diag:class-count>]

For the identity diagram, $K_e^sigma = P_e^sigma$ is the identity relation on $D^sigma$,
  so all $2 m$ directional labels form singleton recurrent classes.

The #emph[corner] $e cal(T)_m e = { e a e : a in cal(T)_m }$ is a monoid with identity $e$;
  membership is equivalent to $e z = z e = z$. For $z$ in this corner put

$ U_e^(+) \( z \) = K_e^(+) F_z K_e^(+) \, wide U_e^(-) \( z \) = K_e^(-) B_z K_e^(-) . $

The return formulas and the two corner identities give

#[#set math.equation(numbering: n => "(2.12)")
 $ L_e subset.eq L_z \, quad R_e subset.eq R_z \, wide F_z = F_e \( L_z R_e \)^(*) F_z =
   F_z \( L_e R_z \)^(*) F_e . $ <diag:corner>]

Consequently

#[#set math.equation(numbering: n => "(2.13)")
 $ F_e K_e F_z subset.eq F_z \, quad F_z K_e F_e subset.eq F_z \, wide P_e U_e \( z \) \, med
   U_e \( z \) P_e subset.eq U_e \( z \) . $ <diag:corner-absorb>]

The last two inclusions follow by multiplying the first two by $K_e$ on the appropriate sides.
  If $x \, y$ belong to one recurrent class, then $y P_e x$, $x P_e y$,
  and (2.13) show that a loop $x U_e \( z \) x$ implies $y U_e \( z \) y$.
  Reflection gives the same fact for the negative sign. Hence the following is well-defined:

$ cal(M)_e \( z \) = { C in cal(C)_e : x U_e^sigma \( z \) x upright(" fails for ") x in C \,
  upright(" where ") C subset.eq D^sigma } . $

We call $cal(M)_e \( z \)$ the #emph[missing set] of $z$ relative to $e$.

#thm([Lemma 2.4.])[
  (Products of missing sets).  #emph[Let $e in cal(T)_m$ be idempotent. For $z \, w in e cal(T)_m e$,
$ cal(M)_e \( z w \) subset.eq cal(M)_e \( z \) union cal(M)_e \( w \) \, wide cal(M)_e \( e \) = diameter . $

 In particular, $cal(M)_e \( z^k \) subset.eq cal(M)_e \( z \)$ for every positive integer $k$.]
] <diag:missing>

#proof[
  The returns of $e$ persist in both $z$ and $w$, so $\( L_w R_z \)^(*) supset.eq K_e$.
    Formula (2.2) therefore gives $U_e^(+) \( z w \) supset.eq U_e^(+) \( z \) U_e^(+) \( w \)$.
    Two loops at the same point compose to a loop. For the negative sign the corresponding product is
    $U_e^(-) \( w \) U_e^(-) \( z \)$, which gives the same conclusion.
    Finally $U_e^sigma \( e \) = P_e^sigma$, so no recurrent class is missing from $e$. ◻
]

#thm([Lemma 2.5.])[
  (Rectangles of through edges).  #emph[Let $e in cal(T)_m$ be idempotent and let $z in e cal(T)_m e$.
    For a positive recurrent class $C in cal(C)_e$ and any $p in C$, set
$ A_C = { u : u \( F_e K_e \) p } \, wide B_C = { v : p \( K_e F_e \) v } . $

 The rectangle $A_C times B_C$ is independent of $p$ and is contained in $F_e$. These rectangles cover $F_e$.
   If $C in.not cal(M)_e \( z \)$, its rectangle is contained in $F_z$.
   The reflected assertions hold for negative classes and $B_e$. In particular,
#[#set math.equation(numbering: n => "(2.14)")
 $ cal(M)_e \( z \) = diameter quad arrow.r.double quad e subset.eq.sq z . $ <diag:detect>]

]
] <diag:rectangles>

#proof[
  Containment in $F_e$ follows from $F_e K_e F_e = F_e$. The identities
  $ \( F_e K_e \) P_e = F_e K_e \, wide P_e \( K_e F_e \) = K_e F_e $
  show that replacing $p$ by a mutually $P_e$-related point does not change either factor of the rectangle.
  To prove coverage, (2.10) implies $F_e P_e^k F_e = F_e$ for every $k gt.eq 1$.
    Given a pair in $F_e$, choose a witness for this expression with $k > m$.
    Some label repeats along the $P_e$ portion. That label $p$ is recurrent,
    since a nonempty $P_e$-path from $p$ back to itself is a $P_e$-edge by transitivity.
    The portions before and after $p$ belong to $F_e K_e$ and $K_e F_e$:
    indeed $F_e P_e^j subset.eq F_e K_e$ and $P_e^j F_e subset.eq K_e F_e$ for $j gt.eq 0$, including $j =
    0$ since $K_e$ is reflexive.
  If $C$ is not missing from $z$, insert $p K_e F_z K_e p$ between the two halves of its rectangle.
    The resulting relation is contained in $F_e K_e F_z K_e F_e subset.eq F_z$ by (2.13).
    Reflection proves the backward assertion. When the missing set is empty all through edges of $e$ are thus
    present in $z$, and its return edges persist by (2.12). ◻
]

=== 2.4 Transport through a fixed context <transport-through-a-fixed-context>

The next statement controls a whole family of replacements at once.
  The common target set, rather than merely a bound for each replacement,
  will be essential in the amplification argument.

#thm([Lemma 2.6.])[
  (Transport).  #emph[Let $e \, d in cal(T)_m$ be idempotents and let $u \, v in cal(T)_m$ satisfy $u e v = d$.
    For every $J subset.eq cal(C)_e$ there exists a single set $J' subset.eq cal(C)_d$, with $\| J' \| lt.eq
    2 \| J \|$, such that
$ cal(M)_d \( u z v \) subset.eq J' $

 for every $z in e cal(T)_m e$ satisfying $cal(M)_e \( z \) subset.eq J$ and $u z v in d cal(T)_m d$.]
] <diag:transport>

#proof[
  For each positive class of $cal(C)_d$, choose a representative $x$ and a witness for $x K_d^(+) F_(u e v)
    K_d^(+) x$. Expand the middle edge into an actual finite path through the three diagrams $u \, e \, v$.
    For a negative class do the same with $x K_d^(-) B_(u e v) K_d^(-) x$.
    Make these choices once, independently of $z$.
  For every occurrence of a through edge of the middle factor $e$ on a chosen path,
    choose an $e$-class whose rectangle covers that edge, using Lemma 6.
    Mark a $d$-class if any class chosen along its witness lies in $J$; let $J'$ be the marked set.
    If a class is unmarked, all its chosen through edges survive replacement of $e$ by $z$,
    as do all return edges of $e$. Its original outer $K_d^sigma$ pieces remain fixed.
    Thus its witness is a loop in $U_d^sigma \( u z v \)$, and the class is not missing.
    This proves the required common-set inclusion.
  It remains to count marked classes. For each $d$-class $C$,
    let $S_C$ be the set of $e$-classes chosen along its fixed witness.
    We show that the sets $S_C$ are pairwise disjoint among $d$-classes of a fixed sign.
    Consider two positive witnesses, written as
  $ x K_d^(+) alpha thick F_d thick beta K_d^(+) x \, wide y K_d^(+) alpha' thick F_d thick beta' K_d^(+) y \, $
  where $alpha \, beta \, alpha' \, beta' in D^(+)$ and the displayed $F_d$-edges have been expanded through $u \,
    e \, v$. Suppose the expanded paths use occurrences of middle-factor edges $\( a \, b \)$ and $\( a' \, b' \)$
    covered by one $e$-class. Its rectangle also contains $\( a \, b' \)$ and $\( a' \, b \)$.
    The sign of that $e$-class fixes the orientation of both edges and their entry and exit boundaries inside the
    three-factor product. Thus the prefix ending at $a$, the crossed edge $\( a \, b' \)$,
    and the suffix starting at $b'$ concatenate to a path from $alpha$ to $beta'$.
    Neither retained subpath has an earlier outer exit. The concatenation is therefore a valid finite path for
    $F_d$, even if it repeats internal crossings or its selected middle edge points backward.
    Interchanging the two prefixes and suffixes similarly gives $alpha' F_d beta$.
  The original exterior factors now give $x P_d^(+) y$ and $y P_d^(+) x$,
    so $x$ and $y$ belong to the same recurrent class. Reflection gives the same conclusion for negative
    witnesses, with $B_d$ in place of $F_d$. This proves the asserted disjointness for each sign.
    A witness using only returns of $e$ has $S_C = diameter$ and is never marked.
    Since $J' = { C : S_C ∩ J eq.not diameter }$, at most $\| J \|$ classes of each sign are marked,
    and $\| J' \| lt.eq 2 \| J \|$. ◻
]

== 3 A loss budget for nested idempotents <nest:section>

For idempotents in a semigroup, write $d lt.closed.eq e$ if $d e = e d = d$,
  and say that $d$ is #emph[nested under] $e$. This is a partial order:
  reflexivity and antisymmetry are immediate, and if $d lt.closed.eq e lt.closed.eq f$, then $d f = \( d e \) f =
  d \( e f \) = d e = d$ and $f d = f \( e d \) = \( f e \) d = e d = d$.
  Nesting is distinct from the edge-inclusion order $subset.eq.sq$.

We will bound the sum of the losses incurred along a nested chain, even though the identity,
  the recurrent classes, and hence the meaning of a loss change at every step.
  The key fact is a containment dichotomy: a new recurrent class contains either an old class that is not lost,
  or at least two old classes.

#thm([Lemma 3.1.])[
  (Absorption under nesting).  #emph[Let $d \, e in cal(T)_m$ be idempotents with $d lt.closed.eq e$.
    For either sign $sigma$,
$ K_e^sigma subset.eq K_d^sigma \, wide P_e^sigma P_d^sigma subset.eq P_d^sigma \, wide
  P_d^sigma P_e^sigma subset.eq P_d^sigma . $

 In the positive sign one also has
#[#set math.equation(numbering: n => "(3.1)")
 $ F_e P_d^(+) subset.eq P_d^(+) \, wide P_d^(+) F_e subset.eq P_d^(+) . $ <nest:through-absorption>]

 The corresponding negative-sign inclusions use $B_e$.]
] <nest:absorption>

#proof[
  We prove the positive-sign statements and suppress the superscript $+$.
    Because $d in e cal(T)_m e$, its returns contain those of $e$: $L_e subset.eq L_d$ and $R_e subset.eq R_d$. Set
  $ S = \( L_d R_e \)^(*) \, wide T = \( L_e R_d \)^(*) . $
  Then $K_e subset.eq S \, T subset.eq K_d$. The multiplication formulas applied to $e d = d e = d$ give
  #[#set math.equation(numbering: n => "(3.2)")
   $ F_d & = F_e S F_d = F_d T F_e \,\
L_d & = L_e union F_e S L_d B_e \, & R_d & = R_e union B_e R_d T F_e . $ <nest:forward-identities>]
  We spell out the two star rearrangements needed below, using the finite-path identities in (2.1).
    Expanding $R_d$ in $K_d = \( L_d R_d \)^(*)$, we obtain
  $ K_d & = #scale(x: 120%, y: 120%)[\(] L_d R_e union L_d B_e R_d T F_e #scale(x: 120%, y: 120%)[\)]^(*)\
 & = S #scale(x: 120%, y: 120%)[\(] L_d B_e R_d T F_e S #scale(x: 120%, y: 120%)[\)]^(*) \,\
F_e K_d F_d & = #scale(x: 120%, y: 120%)[\(] F_e S L_d B_e R_d T #scale(x: 120%, y: 120%)[\)]^(*) F_e S F_d\
 & = #scale(x: 120%, y: 120%)[\(] F_e S L_d B_e R_d T #scale(x: 120%, y: 120%)[\)]^(*) F_d subset.eq K_d F_d . $
  Indeed, $F_e S L_d B_e subset.eq L_d$ by (3.2), so the relation inside the last star is contained in $L_d R_d T
    subset.eq K_d$. For the other side, expand $L_d$ instead:
  $ K_d & = #scale(x: 120%, y: 120%)[\(] L_e R_d union F_e S L_d B_e R_d #scale(x: 120%, y: 120%)[\)]^(*)\
 & = T #scale(x: 120%, y: 120%)[\(] F_e S L_d B_e R_d T #scale(x: 120%, y: 120%)[\)]^(*) \,\
F_d K_d F_e & = F_d T F_e #scale(x: 120%, y: 120%)[\(] S L_d B_e R_d T F_e #scale(x: 120%, y: 120%)[\)]^(*)\
 & = F_d #scale(x: 120%, y: 120%)[\(] S L_d B_e R_d T F_e #scale(x: 120%, y: 120%)[\)]^(*) subset.eq F_d K_d . $
  Here $B_e R_d T F_e subset.eq R_d$, so the relation inside the star is contained in $S L_d R_d subset.eq K_d$.
    These inclusions, multiplied by the remaining $K_d$, prove (3.1) because $P_d = K_d F_d K_d$.
    Finally, $K_d P_d = P_d K_d = P_d$ and $K_e subset.eq K_d$ imply
  $ P_e P_d = K_e F_e K_e P_d subset.eq P_d \, wide P_d P_e = P_d K_e F_e K_e subset.eq P_d . $
  Reflection proves all negative-sign statements. ◻
]

#thm([Lemma 3.2.])[
  (Containment of recurrent classes).  #emph[Let $d \, e in cal(T)_m$ be idempotents with $d lt.closed.eq e$.
    Every class in $cal(C)_d$ contains either]
  + #emph[a whole class in $cal(C)_e \\ cal(M)_e \( d \)$; or]
  + #emph[two distinct whole classes in $cal(C)_e$.]
  #emph[All classes in either containment have the same sign.]
] <nest:containment>

#proof[
  Again work in the positive sign and omit its superscript. Fix a recurrent point $x$ of $P_d$.
    Using (3.2) twice, its recurrence gives
  $ x #scale(x: 120%, y: 120%)[\(] K_d F_e S F_d T F_e K_d #scale(x: 120%, y: 120%)[\)] x . $
  By the rectangle cover in Lemma 6, each of the two displayed $F_e$-edges can be factored through an
    $e$-recurrent point. Denote the first point by $p$ and the second by $q$. The resulting witness has the form
  #[#set math.equation(numbering: n => "(3.3)")
   $ x thin alpha thin p thin beta thin q thin gamma thin x \, $ <nest:factored-witness>]
  where
  $ alpha & = K_d F_e K_e \,\
beta & = K_e F_e S F_d T F_e K_e = K_e F_d K_e = U_e^(+) \( d \) \,\
gamma & = K_e F_e K_d . $
  Here $beta subset.eq P_d$ because $K_e subset.eq K_d$. Moreover,
    Lemma 8 shows that multiplying $P_d$ on either side by $alpha$ or $gamma$ gives a subrelation of $P_d$.
    Thus all four endpoint relations needed for class membership follow from (3.3) and $x P_d x$:
  $ x thin P_d thin x thin alpha thin p & arrow.r.double x P_d p \,\
p thin beta thin q thin gamma thin x & arrow.r.double p P_d x \,\
x thin alpha thin p thin beta thin q & arrow.r.double x P_d q \,\
q thin gamma thin x thin P_d thin x & arrow.r.double q P_d x . $
  In particular $p$ and $q$ are recurrent for $P_d$ and belong to the class of $x$.
    In the first and last lines, inserting the recurrence at $x$ is essential:
    the shorter witness portion alone need not contain a $d$-through edge.
  The entire $P_e$-class of $p$ lies in the $P_d$-class of $x$.
    Indeed, if $r$ is in the former class, then $x P_d p P_e r$ and $r P_e p P_d x$,
    and the two mixed absorptions of Lemma 8 give $x P_d r$ and $r P_d x$. The same argument applies to $q$.
    If their $P_e$-classes are distinct, this proves the second alternative.
    If they coincide, then $p U_e^(+) \( d \) q$ by (3.3) and $q P_e p$.
    The corner absorption $U_e^(+) \( d \) P_e subset.eq U_e^(+) \( d \)$ gives $p U_e^(+) \( d \) p$,
    so that class is not in $cal(M)_e \( d \)$. This proves the first alternative.
    Reflection handles the negative sign. ◻
]

#thm([Proposition 3.3.])[
  (Chain bound).  #emph[Let $b_0 \, b_1 \, dots.h \, b_k in cal(T)_m$ be idempotents such that $b_j lt.closed.eq
    b_(j - 1)$ for $1 lt.eq j lt.eq k$. Suppose a single set $J_0 subset.eq cal(C)_(b_0)$ satisfies
$ cal(M)_(b_0) \( b_j \) subset.eq J_0 wide \( 0 lt.eq j lt.eq k \) . $

 Then
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(j = 1)^k \| cal(M)_(b_(j - 1)) \( b_j \) #scale(x: 120%, y: 120%)[\|] lt.eq 2 \| J_0 \| . $ <nest:chain-bound>]

]
] <nest:chain>

#proof[
  Choose one #emph[protected] label in every class of $cal(C)_(b_0) \\ J_0$, and keep these choices fixed.
    Every protected label $x$ of sign $sigma$ satisfies $x U_(b_0)^sigma \( b_j \) x$ at every stage $j$.
    By transitivity of nesting and Lemma 8, $K_(b_0)^sigma subset.eq K_(b_j)^sigma$,
    so this loop also belongs to $P_(b_j)^sigma$. Thus every protected label remains recurrent.
    Let $s_j$ count the classes in $cal(C)_(b_j)$ containing no protected label. In particular $s_0 = \| J_0 \|$.
  Write $delta_j = \| cal(M)_(b_(j - 1)) \( b_j \) \|$. Every class missing at step $j$ is unprotected.
    Otherwise it would contain a protected label $x$ of sign $sigma$;
    the loop $x U_(b_0)^sigma \( b_j \) x$ and the inclusion $K_(b_0)^sigma subset.eq
    K_(b_(j - 1))^sigma$ would then give $x U_(b_(j - 1))^sigma \( b_j \) x$, contradicting missingness.
  Assign weight $1 \/ 2$ to each missing unprotected class of $cal(C)_(b_(j - 1))$,
    and weight $1$ to each other unprotected class there. Their total weight is $s_(j - 1) - delta_j \/ 2$.
    Figure 2 illustrates the two ways that an unprotected new class can obtain weight at least one from the
    previous stage.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (5, 2.3), stroke: (thickness: 0.8pt, miter-limit: 10), radius: 4pt)
  rect((6, 0), (11, 2.3), stroke: (thickness: 0.8pt, miter-limit: 10), radius: 4pt)
  content((2.5, 1.95), [#text(size: 9pt)[one new unprotected class]])
  content((8.5, 1.95), [#text(size: 9pt)[one new unprotected class]])
  content((2.5, 0.95), [#box(inset: (x: 0.2117cm, y: 0.1764cm), radius: 4pt, stroke: (thickness: 0.8pt, miter-limit: 10), fill: rgb("#ededff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[old nonmissing class#linebreak()weight $1$]]])])
  content((7.3, 0.95), [#box(inset: (x: 0.2117cm, y: 0.1764cm), radius: 4pt, stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[old class#linebreak()weight $gt.eq frac(1, 2)$]]])])
  content((9.7, 0.95), [#box(inset: (x: 0.2117cm, y: 0.1764cm), radius: 4pt, stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[old class#linebreak()weight $gt.eq frac(1, 2)$]]])])
  content((5.5, 1.1), [#text(size: 9pt)[or]])
})],
    caption: [Figure 2: The weighted containment argument in the chain bound. All classes shown have one fixed sign and contain no protected label. Each new class contains either a whole nonmissing old class or two distinct whole old classes. A missing old class has weight $1 \/ 2$; every other old class has weight $1$. The displayed regions express set containment schematically. Distinct new classes cannot use the same whole old class, so their unit weight requirements add. ],
  ) <fig:nesting-budget>
  By Lemma 9, each unprotected class at stage $j$ contains previous classes of total weight at least $1$:
    either one nonmissing class, or two distinct classes. Every contained previous class is unprotected,
    since a protected label in it would also protect the new class.
    Distinct new classes cannot use the same previous class, because classes of a fixed sign are disjoint and the
    two sign-label sets are disjoint. Consequently
  $ s_j lt.eq s_(j - 1) - delta_j / 2 . $
  Summing and using $s_k gt.eq 0$ yields $sum_(j = 1)^k delta_j lt.eq 2 \( s_0 - s_k \) lt.eq 2 \| J_0 \|$. ◻
]

== 4 An exponential bound for order-reversing images <amp:section>

We now prove Theorem 2, combining transport and the nested-chain inequality to bound order-reversing relation
  images. Write $cal(R)_H$ for the monoid of all binary relations on a finite set $H$,
  with multiplication in path order. For $F subset.eq H$, write $I_F = { \( x \, x \) : x in F }$;
  relations on $F$ are also regarded as relations on $H$ supported on $F times F$.

The proof amplifies one off-diagonal pair in the image into a family of pair additions.
  The chain inequality bounds their total cost in missing recurrent classes;
  restriction to smaller relation monoids bounds each cost from below.
  We first record two elementary facts that allow these restrictions without losing the hypotheses.
  The pattern of relation additions follows the matching-diagram argument in
  #cite(label("CompanionDeterminization2026")) Section 3; all loss estimates needed here are supplied by the
  path-diagram results just proved.

=== 4.1 Corners and unit lifts <corners-and-unit-lifts>

For an idempotent $d$ in a semigroup $A$, its #emph[corner] $d A d = { d a d :
  a in A }$ is a monoid with identity $d$. A #emph[unit] means an element with a two-sided inverse relative to the
  specified monoid identity.

#thm([Lemma 4.1.])[
  (Minimal idempotent corners).  #emph[Let $A$ be a finite semigroup, let $M$ be a monoid, and let $theta :
    A arrow.r M$ be a surjective multiplicative map. For every idempotent $q in M$,
    there is an idempotent $d in A$ with $theta \( d \) = q$ that is minimal among such idempotents under
    $lt.closed.eq$. For every such minimal $d$, restriction of $theta$ gives a unital surjection
$ d A d arrow.r q M q . $

 Every element of $d A d$ whose image is a unit of $q M q$ is itself a unit of $d A d$.
   In particular, every unit of $q M q$ has a unit lift.]
] <amp:minimal-corner>

#proof[
  Every element $w$ of a finite semigroup has an idempotent positive power:
    the sequence of powers is eventually periodic, so a sufficiently large exponent divisible by its eventual
    period gives $w^(2 k) = w^k$. Applying this to a preimage of $q$ gives an idempotent preimage of $q$.
    Finiteness then gives one minimal in the nesting order.
  For any $y in q M q$, choose $x in A$ with $theta \( x \) = y$.
    Then $theta \( d x d \) = q y q = y$, proving surjectivity on the corner; its identity $d$ maps to $q$.
    Now let $w in d A d$ have unit image. An idempotent power $w^k$ has an image that is both a unit and an
    idempotent in $q M q$, hence equals $q$. Since $w^k lt.closed.eq d$, minimality gives $w^k = d$.
    If $k > 1$, the element $w^(k - 1)$ is a two-sided inverse of $w$ in $d A d$; if $k = 1$, then $w =
    d$ is already the identity. ◻
]

The next lemma identifies a smaller full relation monoid inside an idempotent corner.
  Its hypothesis says that the old relation restricts to the identity on the retained points.

#thm([Lemma 4.2.])[
  (Restriction of a relation corner).  #emph[Let $P in cal(R)_H$ be idempotent, let $F subset.eq H$, and put $i =
    I_F$. Suppose that $i P i = i$, and define $Q = P i P$. Then $Q$ is idempotent, $Q lt.closed.eq P$,
    and restriction is a unital monoid isomorphism
#[#set math.equation(numbering: n => "(4.1)")
 $ rho : Q cal(R)_H Q arrow.r cal(R)_F \, wide rho \( Z \) = i Z i . $ <amp:restriction>]

 Its inverse sends $A in cal(R)_F$ to $P A P$.]
] <amp:relation-corner>

#proof[
  Using $P^2 = P$ and $i P i = i$, we obtain
  $ Q^2 = Q \, wide P Q = Q P = Q \, wide Q i = P i \, wide i Q = i P \, wide i Q i = i . $
  If $Z = Q Z Q$, then $P Z P = Z$, and therefore
  $ Z = P i P Z P i P = P i Z i P . $
  Thus restriction determines $Z$ uniquely. Conversely, for a relation $A = i A i$ supported on $F$,
    the relation $P A P$ belongs to $Q cal(R)_H Q$, since $P A P = Q A Q$, and
  $ i \( P A P \) i = \( i P i \) A \( i P i \) = A . $
  This proves bijectivity with the claimed inverse. For supported relations $A \, B in cal(R)_F$,
  $ \( P A P \) \( P B P \) = P A P B P = P A \( i P i \) B P = P A B P . $
  Hence the inverse, and therefore restriction, preserves multiplication.
    Finally $rho \( Q \) = i$, the identity of $cal(R)_F$. ◻
]

=== 4.2 Amplifying a single added pair <amplifying-a-single-added-pair>

Set

#[#set math.equation(numbering: n => "(4.2)")
 $ t = 64 \, wide D \( h \) = 2^(floor.l \( h - 2 \) \/ \( 2 t - 1 \) floor.r) quad \( h gt.eq 2 \) . $ <amp:D>]

The choice $t = 64$ balances the two estimates proved below:
  $t^2$ pair additions each cost at least half the smaller-instance bound,
  while their total cost is at most $16 t$ times the original loss.
  The resulting gain is $t \/ 32 = 2$, at a reduction of $2 t - 1 = 127$ points.
  We prove a missing-set bound strong enough to survive passage to any of the corners above.
  The additional unit-lifting hypothesis permits conjugation by arbitrary permutations of $H$;
  Lemma 11 will supply it when we return to Theorem 2.

#thm([Proposition 4.3.])[
  (Cost of one added pair).  #emph[Let $m gt.eq 1$, let $e in cal(T)_m$ be idempotent,
    and let $S subset.eq e cal(T)_m e$ be a submonoid with identity $e$.
    Let $H$ be a finite set of cardinality $h gt.eq 2$. Suppose that $phi.alt : S arrow.r
    cal(R)_H$ is a unital surjective homomorphism such that
$ z subset.eq.sq w med arrow.r.double med phi.alt \( w \) subset.eq phi.alt \( z \) wide \( z \, w in S \) \, $

 and suppose that each permutation of $H$ has a lift that is a unit of $S$.
   If $a in S$ is idempotent and, for distinct $x \, y in H$,
$ phi.alt \( a \) = I_H union { \( x \, y \) } \, $

 then $\| cal(M)_e \( a \) \| gt.eq D \( h \)$.]
] <amp:single-edge>

#proof[
  We induct on $h$, simultaneously over all the data in the statement, including $m$, $e$, $S$, and $phi.alt$.
    For $2 lt.eq h lt.eq 2 t$, we have $D \( h \) = 1$. If $cal(M)_e \( a \)$ were empty,
    Lemma 6 would give $e subset.eq.sq a$. Order reversal would then give $I_H union { \( x \, y \) } subset.eq
    I_H$, a contradiction.
  Assume henceforth that $h gt.eq 2 t + 1$, and put $c = \| cal(M)_e \( a \) \|$.
    We will construct $t^2$ nested steps with total missing-set size at most $16 t c$.
    Each step will contain a smaller instance of the Proposition, on $h - 2 t + 1$ points.
  #strong[Step 1: A common budget for all pair additions.] Choose disjoint sets
  $ U = { u_1 \, dots.h \, u_t } \, wide V = { v_1 \, dots.h \, v_t } \, wide { z } $
  in $H$. Conjugating $a$ by unit lifts of permutations gives elements $s_i \, s'_j in S$ with
  #[#set math.equation(numbering: n => "(4.3)")
   $ phi.alt \( s_i \) = I_H union { \( u_i \, z \) } \, wide phi.alt \( s'_j \) =
     I_H union { \( z \, v_j \) } . $ <amp:hub>]
  Indeed, permutation conjugation acts transitively on ordered pairs of distinct points,
    and the inverse of a unit lift maps to the inverse permutation.
    Explicitly, a unit $p in S$ gives the conjugate $p a p^(- 1)$, with $p e p^(- 1) = e$.
    Applying Lemma 7 with $J = cal(M)_e \( a \)$ therefore gives
  $ \| cal(M)_e \( s_i \) \| lt.eq 2 c \, wide \| cal(M)_e \( s'_j \) \| lt.eq 2 c . $
  Consequently the single set
  $ J = union.big_(i = 1)^t cal(M)_e \( s_i \) med union med union.big_(j = 1)^t cal(M)_e \( s'_j \) med
    subset.eq cal(C)_e $
  has $\| J \| lt.eq 4 t c$, and the product inequality of Lemma 5 gives $cal(M)_e \( s_i s'_j \) subset.eq
    J$ for every $i \, j$.
  Let $P_0 = I_(H \\ { z })$. Choose an idempotent lift $b_0 in S$ of $P_0$,
    by taking an idempotent positive power of any lift, and define
  $ g_(i j) = b_0 s_i s'_j b_0 in b_0 S b_0 . $
  The image of $s_i s'_j$ consists of the identity and the three pairs $\( u_i \, z \)$, $\( z \, v_j \)$,
    and $\( u_i \, v_j \)$. The outer factors $P_0$ remove the first two, so
  #[#set math.equation(numbering: n => "(4.4)")
   $ phi.alt \( g_(i j) \) = P_0 union { \( u_i \, v_j \) } . $ <amp:pair-image>]
  Figure 3 illustrates this conversion of two generator families into a family indexed by $U times V$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$u_i$]])
  content((1.8, 0), [#text(size: 9pt)[$z$]])
  content((3.6, 0), [#text(size: 9pt)[$v_j$]])
  line((0.2596, 0), (1.596, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.9, 0), [#text(size: 9pt)[$phi (s_i)$]], anchor: "south", padding: 0.1176cm)
  line((2.004, 0), (3.34, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.7, 0), [#text(size: 9pt)[$phi (s'_j)$]], anchor: "south", padding: 0.1176cm)
  content((1.8, -0.8), [#text(size: 9pt)[Compose the two relations]])
  line((4.35, 0), (6.35, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.35, 0), [#text(size: 9pt)[$P_0 thin ( dot.op ) thin P_0$]], anchor: "south", padding: 0.1176cm)
  content((7.1, 0), [#text(size: 9pt)[$u_i$]])
  content((9.5, 0), [#text(size: 9pt)[$v_j$]])
  line((7.36, 0), (9.24, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.3, 0), [#text(size: 9pt)[$phi (g_(i j))$]], anchor: "south", padding: 0.1176cm)
  content((8.3, -0.8), [#text(size: 9pt)[Remove endpoints at $z$]])
})],
    caption: [Figure 3: The relation images of the hub construction, with identity pairs omitted. Composing the $u_i arrow.r z$ and $z arrow.r v_j$ additions creates $u_i arrow.r v_j$; sandwiching by $P_0$ removes the two pairs incident to $z$. The $2 t$ generators yield all $t^2$ pair additions. ],
  ) <fig:hub>
  Since $b_0 e b_0 = b_0$, the common-set conclusion of Lemma 7 gives a #emph[single] set $J_0 subset.eq
    cal(C)_(b_0)$ such that
  #[#set math.equation(numbering: n => "(4.5)")
   $ \| J_0 \| lt.eq 8 t c \, wide cal(M)_(b_0) \( g_(i j) \) subset.eq J_0 quad \( 1 lt.eq i \, j lt.eq t \) .
     $ <amp:common-budget>]
  #strong[Step 2: A nested chain spending that budget.] List the $t^2$ pairs of $U times V$ in any order,
    without repetitions. Let $E_ell$ be the set of the first $ell$ pairs, and put $P_ell =
    P_0 union E_ell$ for $0 lt.eq ell lt.eq t^2$. For any $E \, E' subset.eq U times V$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( P_0 union E \) \( P_0 union E' \) = P_0 union E union E' . $ <amp:union>]
  To check this, $P_0$ acts as the identity on all the endpoints in question,
    and no pair of $E$ can be followed by a pair of $E'$, because $U ∩ V = diameter$.
    In particular, every $P_ell$ is idempotent.
  If the pair at position $ell$ is $\( u_i \, v_j \)$, choose $b_ell$ to be an idempotent positive power of
    $b_(ell - 1) g_(i j) b_(ell - 1)$. Inductively, Equation (4.6) gives $phi.alt \( b_ell \) = P_ell$.
    The sandwich, and hence all its positive powers, is absorbed on both sides by $b_(ell - 1)$. Thus
  $ b_ell lt.closed.eq b_(ell - 1) wide \( 1 lt.eq ell lt.eq t^2 \) . $
  All these elements lie in the $b_0$-corner. Starting with $cal(M)_(b_0) \( b_0 \) = diameter$,
    repeated use of Lemma 5 and Equation (4.5) shows that
  $ cal(M)_(b_0) \( b_ell \) subset.eq J_0 wide \( 0 lt.eq ell lt.eq t^2 \) . $
  Here taking a positive power cannot enlarge the missing set:
    all factors have the same missing set, and their union is unchanged. Proposition 10 now yields
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_(ell = 1)^(t^2) delta_ell lt.eq 16 t c \, wide delta_ell = \| cal(M)_(b_(ell - 1)) \( b_ell \) \| .
     $ <amp:total-cost>]
  We have bounded the total cost of the chain using only the $2 t$ original conjugates.
    It remains to give an inductive lower bound for each of its $t^2$ steps.
  #strong[Step 3: A smaller instance inside every step.] Fix $ell$,
    let $\( u_i \, v_j \)$ be its newly added pair, and write $b = b_(ell - 1)$ and $P = P_(ell - 1)$.
    Retain the two endpoints of this pair and all points outside the construction:
  $ F = { u_i \, v_j } union #scale(x: 120%, y: 120%)[\(] H \\ \( U union V union { z } \)
    #scale(x: 120%, y: 120%)[\)] \, wide i_F = I_F \, wide Q = P i_F P . $
  Then $\| F \| = h - 2 t + 1 gt.eq 2$. Among the possible extra pairs of $P$,
    only $\( u_i \, v_j \)$ has both endpoints in $F$, and this pair has not yet been added.
    Therefore $i_F P i_F = i_F$. By Lemma 12, $Q lt.closed.eq P$ and restriction gives $Q cal(R)_H Q tilde.eq
    cal(R)_F$. Moreover, Equation (4.6) gives $P P_ell P = P_ell$. Using $i_F Q = i_F P$ and $Q i_F = P i_F$, we obtain
  #[#set math.equation(numbering: n => "(4.8)")
   $ i_F \( Q P_ell Q \) i_F = i_F P_ell i_F = I_F union { \( u_i \, v_j \) } . $ <amp:compressed-pair>]
  Consider the finite monoid $A = b S b$. The restriction of $phi.alt$ maps it onto $P cal(R)_H P$:
    sandwiching any preimage by $b$ gives a preimage of its $P$-sandwich.
    Apply Lemma 11 #emph[inside $A$] to the idempotent $Q$. We obtain an idempotent $d in
    A$ with $phi.alt \( d \) = Q$, minimal there among idempotent lifts of $Q$. Its corner $d A d$ maps unitally onto
  $ Q \( P cal(R)_H P \) Q = Q cal(R)_H Q \, $
  and all units of this image have unit lifts. Composing with restriction gives a unital surjective homomorphism
  #[#set math.equation(numbering: n => "(4.9)")
   $ psi : d A d arrow.r cal(R)_F \, wide psi \( w \) = i_F phi.alt \( w \) i_F . $ <amp:smaller-map>]
  This map is order-reversing because $phi.alt$ is and restriction preserves inclusion.
    It has unit lifts of every permutation of $F$, by the isomorphism in Lemma 12.
    Also $d A d$ is a submonoid of $d cal(T)_m d$ with identity $d$.
    These observations verify all the map and domain hypotheses needed for induction.
  Because $b_ell lt.closed.eq b$, we have $b_ell in A$. By Equation (4.8),
    the element $d b_ell d in d A d$ maps under $psi$ to $I_F union { \( u_i \, v_j \) }$.
    This relation is idempotent, so an idempotent positive power $v$ of $d b_ell d$ has the same image.
    Since $d in A$ is idempotent, $d b d = d$. Apply Lemma 7 from the identity $b$ to the identity $d$,
    with context $\( d \, d \)$ and missing set $cal(M)_b \( b_ell \)$.
    Then apply the power consequence of Lemma 5 in the $d$-corner. This gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| cal(M)_d \( v \) \| lt.eq \| cal(M)_d \( d b_ell d \) \| lt.eq 2 delta_ell . $ <amp:step-cost>]
  The induction hypothesis applies to $d$, $d A d$, $psi$, and $v$, with the smaller parameter $\| F \| = h -
    2 t + 1$. It follows that
  $ 2 delta_ell gt.eq D \( h - 2 t + 1 \) . $
  Summing this lower bound and using Equation (4.7), we conclude that
  $ 16 t c med gt.eq med t^2 / 2 D \( h - 2 t + 1 \) \, wide c med gt.eq med t / 32 D \( h - 2 t + 1 \) . $
  For $t = 64$, the last expression is $2 D \( h - 127 \) = D \( h \)$, by the definition of $D$.
    This completes the induction. ◻
]

#proof[
  Apply Lemma 11 to $phi.alt_0$ and the idempotent $I_H$. It supplies an idempotent $e in S_0$ such that $S =
    e S_0 e$ maps unitally onto $cal(R)_H$ and every permutation has a unit lift.
    The restricted map retains order reversal, and $S$ is a submonoid of $e cal(T)_m e$ with identity $e$.
  Choose distinct $x \, y in H$ and any lift in $S$ of $I_H union { \( x \, y \) }$.
    An idempotent positive power $a$ of that lift has the same image. Proposition 13 therefore gives
  $ D \( h \) lt.eq \| cal(M)_e \( a \) \| lt.eq \| cal(C)_e \| lt.eq 2 m \, $
  as required. ◻
]

== 5 Finite computations and the main lower bound <auto:section>

We complete the concrete obligations deferred in Section 2:
  constructing the small source automaton and proving the finite-computation representation.
  The order-reversing map has already been derived in Proposition 4;
  we then combine it with Theorem 2 to finish the main proof.
  Throughout, we use the automaton model fixed in the introduction, including stay moves, finite acceptance,
  and acceptance in the initial configuration.

=== 5.1 The source automaton <the-source-automaton>

Fix a set $H$ of size $h gt.eq 2$. Recall that the alphabet is $Sigma_H = cal(R)_H$,
  the word product is $r \( w \)$ with $r \( epsilon \) = I_H$, and

#[#set math.equation(numbering: n => "(5.1)")
 $ L_H = { w in Sigma_H^(*) : r \( w \) eq.not diameter } . $ <auto:language>]

#thm([Lemma 5.1.])[
  #emph[The language $L_H$ is recognized by a 2NFA with exactly $h + 2$ states.]
] <auto:source>

#proof[
  Use one initial state $q_(upright("in"))$, the $h$ states in $H$, and one accepting state $q_(upright("acc"))$,
    all distinct. From $q_(upright("in"))$ on the left endmarker,
    the machine moves right into any chosen state of $H$. On a letter $R in cal(R)_H$,
    it may move right from $p in H$ to $q in H$ precisely when $\( p \, q \) in R$.
    At the right endmarker, every state in $H$ has a stay transition to $q_(upright("acc"))$.
    There are no other transitions, and $q_(upright("acc"))$ is the only accepting state.
  On $R_1 dots.h.c R_k$, an accepting computation is exactly a sequence $p_0 \, dots.h \,
    p_k in H$ with $\( p_(i - 1) \, p_i \) in R_i$ for $1 lt.eq i lt.eq k$.
    Such a sequence exists exactly when the relation product is nonempty.
    For $k = 0$, the initial move reaches the right endmarker directly, and the machine accepts.
    This agrees with $r \( epsilon \) = I_H eq.not diameter$. ◻
]

=== 5.2 Finite computations as diagram paths <auto:finite-computations>

We now prove the representation promised in Lemma 3. The construction records arbitrary finite computations,
  including stay moves and repeated crossings of the same cut. It does not require termination of every computation.

#proof[
  Let $B$ be the $s$-state automaton in the lemma, with state set $Q$ and initial state $q_0$.
    Introduce one new state $q_dagger$. From every original accepting state, at every cell,
    add a stay transition to $q_dagger$. In state $q_dagger$, move right regardless of the scanned symbol,
    finally exiting past the right endmarker in state $q_dagger$.
    This last exit is only a device for representing acceptance, not a transition of the original machine.
    All original transitions remain subject to the endmarker restrictions.
  A finite augmented computation from the original initial configuration to the designated exit exists if and only
    if $B$ accepts. Indeed, an accepting original computation can be followed by the added stay and rightward
    sweep. Conversely, the first entry into $q_dagger$ must come from an original accepting configuration.
    This argument includes the case that $q_0$ itself is accepting.
    Infinite computations create no additional finite successful computation.
  Put $hat(Q) = Q union { q_dagger }$ and $m = s + 1$. Take the directional label sets to be two disjoint copies
  $ D^(+) = { q^(+) : q in hat(Q) } \, wide D^(-) = { q^(-) : q in hat(Q) } . $
  For a cell symbol $c$, including either endmarker with its boundary rules,
    let $E_c$ be the relation on $hat(Q)$ given by the augmented stay transitions.
    Let $T_c^(+)$ and $T_c^(-)$ be the relations given by the augmented rightward and leftward transitions,
    respectively; their second coordinates record the state #emph[after] the move.
    At the right endmarker, $T_c^(+)$ includes only the designated augmented exit,
    and at the left endmarker $T_c^(-)$ is empty. Define a diagram $d_c$ by
  $ \( q^(+) \, p^(+) \) in F_(d_c) & quad arrow.l.r.double quad \( q^(-) \, p^(+) \) in R_(d_c) quad
    arrow.l.r.double quad \( q \, p \) in E_c^(*) T_c^(+) \,\
\( q^(-) \, p^(-) \) in B_(d_c) & quad arrow.l.r.double quad \( q^(+) \, p^(-) \) in L_(d_c) quad
  arrow.l.r.double quad \( q \, p \) in E_c^(*) T_c^(-) . $
  Thus each local diagram edge represents a finite sequence of stays, possibly empty,
    followed by one move out of the cell. The incoming sign specifies the side of entry,
    not additional machine memory; the transition rules themselves depend only on the state and symbol.
  Set $lambda = d_(upright("left"))$ and $rho = d_(upright("right"))$ for the two endmarkers, and set
  $ tau \( c_1 dots.h.c c_k \) = d_(c_1) dots.h.c d_(c_k) \, wide tau \( epsilon \) = 1_(cal(T)_m) . $
  This is a monoid homomorphism. Every finite augmented computation ending in the designated exit decomposes into
    successive visits to individual cells, each consisting of finitely many stays and one exit move.
    These visits give a path through the product of the cell diagrams.
    In the opposite direction, each local edge in a finite diagram path has a finite transition witness.
    Expanding these witnesses and concatenating them gives an augmented computation,
    because the exit state from one cell is exactly the entry state to the next.
    Neither direction assumes that a cut is crossed at most once.
  The fictitious entry into the left endmarker with label $q_0^(+)$ represents the initial configuration;
    it is not an additional machine transition. No path can leave the tape to the left,
    and a path can leave to the right only through the designated exit.
    Hence (2.5) holds with $a = q_0^(+)$ and $b = q_dagger^(+)$.
    For the empty word, the two endmarker cells are adjacent,
    and the identity $tau \( epsilon \)$ gives precisely their product. A stay cycle causes no difficulty:
    only its finite traversals are represented in $E_c^(*)$. ◻
]

#prodef([Remark 5.2.])[
  (Other standard conventions).  The exponential conclusion also survives the usual changes of starting position
    or acceptance convention, with possible changes to the additive state offsets.
    To use our representation for a machine whose convention requires a positive transition into an accepting
    state, add a fresh nonaccepting initial copy with the same outgoing transitions,
    keeping all original states and transition destinations. This prevents the initial configuration alone from
    accepting, while preserving every acceptance after a transition.
    Starting on the first input cell can be simulated from the left endmarker by one additional initial state.
    If success must occur at a designated marker or on a specified exit,
    enable the added success routine only at that local accepting event.
    These versions of the path representation use $m = s + O \( 1 \)$ labels per sign,
    and the source automaton still uses $h + O \( 1 \)$ states.
    The exact offsets in Theorem 1 refer to the convention fixed in the introduction.
] <auto:conventions>

#proof[
  For any $n gt.eq 4$, let $h = n - 2$, choose a set $H$ of size $h$,
    and use the $n$-state source automaton from Lemma 14. If an $s$-state 2NFA recognizes its complement,
    then Proposition 4 supplies the order-reversing relation image required by Theorem 2.
    With $m = s + 1$, that bound gives
  $ 2 \( s + 1 \) gt.eq 2^(floor.l \( h - 2 \) \/ 127 floor.r) = 2^(floor.l \( n - 4 \) \/ 127 floor.r) . $
  Rearranging proves the stated lower bound. Since its right-hand side grows exponentially with $n$,
    no fixed polynomial can bound the complementation cost for all finite alphabets. ◻
]

=== 5.3 The determinization consequence <the-determinization-consequence>

The lower bound also applies indirectly to deterministic simulation.
  Here we use one external automata transformation: deterministic two-way automata can be complemented with linear
  state overhead independent of the alphabet, even when the original computation may fail to halt
  #cite(label("GeffertMereghettiPighizzini2007")). The possible nonaccepting loops are the reason that exchanging
  accepting and rejecting states alone does not give this transformation.

#thm([Corollary 5.3.])[
  #emph[There are absolute constants $c > 0$ and $n_0$ such that, for every $n gt.eq n_0$,
    every 2DFA recognizing the language of the $n$-state 2NFA $A_n$ in Theorem 1 has at least
$ c thin 2^(floor.l \( n - 4 \) \/ 127 floor.r) $

 states. Hence no polynomial state bound independent of the finite alphabet can determinize all 2NFAs.]
] <auto:determinization>

#proof[
  We use only the linear-overhead conclusion of #cite(label("GeffertMereghettiPighizzini2007")),
    allowing constant-factor changes for model conventions. The standard marker model and its normalization are
    described in the precursor #cite(label("GeffertMereghettiPighizzini2005")) Section 2 and Lemma 3.1.
    Stay moves can be replaced by a two-step excursion that stores the destination state and the return direction
    in a fixed number of copies of the state set. The excursion goes left at the right endmarker and right
    elsewhere. Even on the empty word, the two distinct endmarker cells provide the needed adjacent cell.
    Auxiliary states are nonaccepting, and the destination state is entered only on returning to the original
    cell. A reached accepting configuration, including the initial configuration,
    can instead start a fixed marker sweep to a designated accepting halt.
    Missing transitions can halt and reject. These changes require $O \( s + 1 \)$ states for an $s$-state 2DFA
    and preserve finite acceptance. The cited transformation supplies the substantive additional step of handling
    infinite nonaccepting computations.
  Thus an $s$-state deterministic recognizer for $L \( A_n \)$ has a deterministic complement, also a 2NFA,
    with at most $C \( s + 1 \)$ states for an absolute constant $C$. Theorem 1 gives
  $ C \( s + 1 \) gt.eq 1 / 2 thin 2^(floor.l \( n - 4 \) \/ 127 floor.r) - 1 . $
  For all sufficiently large $n$ this implies the asserted bound with an absolute $c > 0$.
    Since the same alphabets are finite for every $n$, it also excludes every polynomial bound uniform over alphabets. ◻
]

For comparison, the companion theorem #cite(label("CompanionDeterminization2026")) Theorem 1.1 gives

$ 4 \( s + 2 \)^2 gt.eq 2^(floor.l \( h - 2 \) \/ 31 floor.r) $

for an $s$-state deterministic recognizer of the same language $L_H$.
  That theorem also states the improvement from $s + 2$ to $s +
  1$ when the initial configuration counts as acceptance, as it does here.
  Its exponent therefore grows as $h \/ 62$, compared with $h \/ 127$ in Corollary 16.
  The source constructions use $h + 3$ and $h + 2$ states, respectively:
  the companion includes a rejecting sink, which the partial source automaton above does not need.
  Its matching-diagram proof gives a stronger deterministic bound independently of the complementation theorem
  proved here.

#bibliography("refs.bib", style: "ieee", title: [References])
