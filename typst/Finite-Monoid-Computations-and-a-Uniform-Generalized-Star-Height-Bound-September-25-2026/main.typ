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

#align(center)[#text(size: 16pt, weight: "bold")[Finite Monoid Computations and a Uniform Generalized Star-Height Bound]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The generalized star-height problem asks how much nested iteration is needed to describe regular languages when
  complement is available. Complement can replace some uses of iteration,
  but its presence does not make ordinary star-height arguments applicable:
  a lower bound proved for expressions without complement need not survive its addition.
  Our aim is an absolute bound, independent of the alphabet and of the recognizing automaton,
  obtained from a fixed number of operations on finite computations.

A generalized regular expression over a finite alphabet $Sigma$ is formed from $0 \, 1$,
  and the letters of $Sigma$, using union, concatenation, complement, and Kleene star.
  The constants denote the empty language and ${ epsilon.alt }$, and a letter denotes its singleton language.
  Every complement is relative to the same $Sigma^(*)$. Define the height by

$ "ht" \( 0 \) = "ht" \( 1 \) = "ht" \( a \) & = 0 \,\
"ht" \( P + Q \) = "ht" \( P Q \) & = max { "ht" \( P \) \, "ht" \( Q \) } \,\
"ht" \( not P \) & = "ht" \( P \) \, & "ht" \( P^(*) \) & = "ht" \( P \) + 1 . $

For a regular language $L subset.eq Sigma^(*)$, let $h_Sigma \( L \)$ be the minimum of these heights among
  expressions denoting $L$. Here regular means accepted by a deterministic finite automaton (DFA),
  with a finite state set, letter transitions, an initial state, and accepting states.
  There is no restriction on expression length. The uniform-boundedness question asks whether one integer bounds
  $h_Sigma \( L \)$ for every finite $Sigma$ and every regular $L$ over it.
  These conventions agree with the standard Boolean expression model in [9] §1.

#thm([Theorem 1.1.])[
  #emph[For every finite alphabet $Sigma$ and every regular language $L subset.eq Sigma^(*)$,
$ h_Sigma \( L \) lt.eq 13 . $

]
] <thm:main>

This gives an affirmative answer to uniform boundedness. It does not settle whether height one always suffices.
  Straubing explicitly distinguishes these two questions [12] p. 537:
  a language requiring height greater than one would rule out the bound one,
  but would not rule out a larger absolute bound. Computing the minimum generalized height of a given language is
  a further question. The construction below supplies a uniform upper bound; it does not determine that minimum.

The complete construction below uses prediction trials and full decision histories.
  Two separate companion articles prove the smaller bounds four [7] Theorem 1.1 and three [8] Theorem 1.1,
  respectively by multiscale periodic transport and by arbitrary-function shift tables with a whole-stencil
  decoder. Each article proves its own needed local statements.
  Here the value thirteen records the depth of the prediction/history method;
  the stronger numerical bounds do not replace any step of its proof.

=== Historical and algebraic context <historical-and-algebraic-context>

Eggan related ordinary star height to transition graphs [4],
  and Dejean and Schützenberger gave ordinary-height examples over a binary alphabet [3].
  Their expressions omit complement, so their lower bounds do not transfer to the generalized model.
  The effect of complement already appears at height zero: $Sigma^(*) = not 0$ is star-free.
  Schützenberger’s 1965 theorem characterizes the star-free languages as those recognized by finite aperiodic
  monoids [11]. Here a finite monoid is aperiodic if each element $x$ satisfies $x^n = x^(n + 1)$ for some $n$.

This characterization makes finite monoids a natural setting for the problem.
  A word acts on the states of a DFA, and the induced transformations form a finite monoid under composition.
  Height-one results cover several algebraic classes. Henneman’s result for finite abelian groups is recalled and
  proved by Pin, Straubing, and Thérien [9] Theorem 3.4; their own Theorem 7.3 establishes height at most one for
  languages recognized by finite nilpotent groups of class two.
  Bourne and Ruškuc subsequently proved the same bound for languages recognized by finite Rees zero-matrix
  semigroups over abelian groups [1] Theorem 3.6. These results treat specified recognizing classes;
  the construction here applies to every finite transition monoid.

The alphabet and morphism conventions are essential to this comparison.
  Pin, Straubing, and Thérien prove that star-free injective substitutions and inverse alphabetic morphisms do not
  increase generalized height [9] Theorem 4.6 and Corollary 4.7.
  Their Theorem 8.1 also represents every regular language as an inverse image, under a general morphism,
  of a language of ordinary height at most one. The inverse-image closure above is restricted to alphabetic
  morphisms, so it does not turn this representation into a height-one theorem.
  Our proof constructs every expression directly over the original alphabet.

Place and Zeitoun’s 2017 account distinguishes the ordinary and generalized problems and records that no language
  of generalized height greater than one was then known [10] §1.
  Cotumaccio’s February 2025 discussion still identifies generalized star height as an open problem connected with
  automata and compression [2] p. 46. The theorem above addresses uniform boundedness;
  the two stronger companion bounds stated earlier also do not settle whether height one suffices.

The local-marker ingredient comes from a different tradition.
  Krieger’s separated-marker construction [5] Lemma 2 places markers apart while controlling markerless regions by
  periodicity. Meyerovitch presents a clopen-marker form and its finite merging argument [6] §3, Lemmas 3.2–3.4.
  Section 4 proves the precise finite-window construction and periodicity estimates needed here.
  The historical results provide context; every local lemma used to obtain the bound thirteen is proved below.

=== The mechanism of the proof <the-mechanism-of-the-proof>

Fix the finite monoid of a recognizing DFA. We represent its action on a finite vector space over
  $upright(bold(F))_2$. A word will be parsed into nonempty pieces, called episodes, and one final remainder.
  The episodes form a prefix code: no episode is a proper prefix of another. Consequently their parsing is unique.
  Each episode carries a total finite-state update. A graph language specifies the initial and final states of the
  composed update on an episode sequence.

The basic step splits an episode into a prefix and a suffix.
  The prefix checks the incoming state and the suffix checks the outgoing state.
  Each side may choose its own finite metadata. For soundness,
  every pair of successful choices must describe the actual episode update and consume exactly one episode.
  For availability, every designated episode and every input state must admit some successful cut.
  If graph languages for the remaining episodes are already known,
  one additional star combines their sequences with the successful splits.
  Lemma 3 states this identity and its exact height cost.

Three constructions make a bounded number of these steps sufficient.

+ #emph[An affine computation tolerates a controlled disagreement.] A map $v mapsto v A + b$ has linear part $A$,
  which is recovered from its values at $v$ and at zero. Our finite clock ensures that,
  at a given total length residue, independently successful tags either agree or have one fixed off-diagonal pair.
  In the latter case the claimed input and output fit one affine correction with the required linear part.
  The clock also bounds how many ordered pairs of candidate cuts are spoiled,
  independently of the size of their finite roster.
+ #emph[Prediction and periodicity handle two large episode classes.] A trial predicts the monoid products on a
  fixed subdivision and offers one block of cuts for each input–output vector pair.
  Partial prefix and suffix checks always fit a deterministic affine trial update;
  a perfect prediction supplies a cut for every input. Local markers select the trial boundaries.
  When a boundary window is markerless, periodicity supplies a second family of cuts with a constant monoid prefix
  product and constant context. These are the two outer splits.
+ #emph[Five residual witnesses permit exact time decoding.] Failure of the two availability conditions has one of
  five explicit types. At each type we place many copies of every required cut kind.
  A suffix checks all candidate origins and identifies the unique one having the current witness after later
  witnesses have been excluded. A bound on ambiguous ordered pairs leaves a usable copy of each kind.
  One aligned split then uses a perfect trial. If the actual full decision history has no perfect trial,
  a second split recovers a measurement from that history. Both splits compute the same affine update on a larger
  space; its linear part encodes the target update and resets an auxiliary monoid register,
  so the encoding composes across episodes. The argument counts all leaves,
  including those that no actual prefix can realize; it never cancels a monoid factor.

The finite objects in this description can be extremely large.
  The construction first fixes their state sets and event kinds, then their copy counts, clocks, marker scales,
  and positions in a compatible order. Only the number of nested split steps matters for height:
  there are two outer steps and two steps for each of five residual types.
  Their component languages have height at most one because the episode-end rule restricts unbounded words to a
  fixed periodic middle between bounded ends. The final compilation includes the incomplete remainder and yields
  the thirteen-height count without an alphabet substitution.

===== 1.1 Organization. <organization.>

Section 2 develops finite computation, the split identity, and prediction trials.
  Section 3 proves the finite clock. Section 4 constructs local markers and exact episode-end guards.
  Section 5 gives the two outer splits and their five residual witnesses;
  Section 6 eliminates those witnesses with full-history transmission.
  Section 7 makes all finite choices compatible. Section 8 gives explicit original-alphabet expressions and
  completes the proof.

== 2 Finite computations and split expressions <sec:algebra>

Our first task is to express a finite computation on a sequence of words using tests on the two sides of selected
  cuts. The essential requirement is universal soundness: any independently accepted prefix and suffix must
  describe the same deterministic update. We first prove the expression identity that uses this requirement,
  and then give two ways to arrange the updates, by affine correction and by predicted products.

Every test reads the original alphabet. Auxiliary finite sets index unions, intersections, and state queries;
  they do not introduce input letters.

=== 2.1 Words, monoids, and graph tests <words-monoids-and-graph-tests>

If $Sigma = diameter$, the only languages are $0$ and $1$, and Theorem 1 is immediate.
  Assume henceforth that $Sigma eq.not diameter$. Let $M$ be a finite monoid and let $T : Sigma^(*) arrow.r
  M$ be a morphism. Positions are integer gaps; the factor on $\[ a \, b \)$ has length $b -
  a$ and monoid value $T_(a \, b)$. Composition is in reading order:

$ T_(a \, b) T_(b \, c) = T_(a \, c) . $

A right action on a vector space is denoted $v mapsto v T_(a \, b)$.
  The vector space with basis indexed by $M$ has the faithful action $e_m d = e_(m d)$;
  the image of $e_(1_M)$ identifies $d$. All vector spaces used below are finite and are over $upright(bold(F))_2$.

For a DFA, take $M$ to be its monoid of state transformations induced by words, including the identity.
  The product of a word determines acceptance. It is therefore enough to construct uniformly bounded-height tests
  for each value of $T$. The theorem will follow by a finite accepting union.

#prodef([Remark 2.1.])[
  (A DFA-state representation).  One may instead begin with the basis indexed by DFA states and query only the
    image of the initial-state vector to test acceptance. That image need not identify the monoid product.
    The main proof uses the basis indexed by $M$; the alternative and its final acceptance query are described at
    the end of Section 8. In either case interval predictions and the later work registers still take values in $M$.
] <rem:dfa-basis>

A #emph[prefix code] $E$ is a set of nonempty words, no one a proper prefix of another.
  Every word in $E^(*)$ has a unique factorization into members of $E$:
  compare first factors, one of which would otherwise properly prefix the other, and continue inductively.
  Members of $E$ will be called #emph[episodes]. For $D subset.eq E$, let each $e in D$ have a total update $G_e :
  S arrow.r S$ on a finite state set. For a sequence $w = e_1 dots.h.c e_r$,
  let $G_w$ be their composition in reading order. The empty sequence has the identity update.
  The #emph[graph test] from $x$ to $y$ on $D^(*)$ is

$ { w in D^(*) : G_w \( x \) = y } . $

Totality and determinism refer to the word itself, not to a chosen factorization of a test expression or a
  successful metadata guess.

Intersections stand for $not \( not P + not Q \)$, and other Boolean operations have analogous expansions.
  They do not increase height. A fixed finite language is a finite union of concatenations of letters,
  with $1$ for the empty word, so has height zero. We use this observation only when the #emph[whole argument] of
  the test has bounded length.

=== 2.2 The split identity <the-split-identity>

#thm([Lemma 2.2.])[
  (Split identity).  #emph[Let $D' subset.eq D subset.eq E$,
    with the same deterministic updates on the common episodes.
    Suppose languages $P_x \, Q_y$, indexed by $x \, y in S$, satisfy:]
  + #emph[If $w in D^(*)$ and $u v$ is a prefix of $w$, with $u in P_x$ and $v in Q_y$,
    then $w$ has a first episode $e$, $u v = e$, and $G_e \( x \) = y$.]
  + #emph[For every $e in D \\ D'$ and $x in S$, there is a split $e = u v$ with $u in P_x$ and $v in Q_(G_e \( x \))$.]
  #emph[Write $W_(x \, y)$ for the exact graph test on $\( D' \)^(*)$. Then the exact graph test on $D^(*)$ is
#[#set math.equation(numbering: n => "(2.1)")
 $ D^(*) ∩ #scale(x: 180%, y: 180%)[\(] W_(x \, y) med union med & #scale(x: 120%, y: 120%)[\(] thin union.big_a
   W_(x \, a) P_a thin #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] thin union.big_(b \, c) Q_b
   W_(b \, c) P_c thin #scale(x: 120%, y: 120%)[\)]^(*)\
 & #h(35mm)  dot.op #scale(x: 120%, y: 120%)[\(] thin union.big_r Q_r W_(r \, y) thin #scale(x: 120%, y: 120%)[\)]
   #scale(x: 180%, y: 180%)[\)] . $ <eq:split>]

 In particular, if $D \, P_x \, Q_y$ have heights at most $1 \, 0 \, 1$, respectively,
   and all $W_(x \, y)$ have height at most $H$, the new graph tests have height at most $max { 2 \, H + 1 }$.]
] <lem:split>

#proof[
  Consider a word accepted by the right side of (2.1). Its membership in $D^(*)$ fixes its actual episode parsing.
    In a factorization through the nontrivial branch, the initial $W$-factor is a sequence of $D'$-episodes.
    Prefix-code uniqueness makes these actual initial episodes.
    The adjacent $P \, Q$ factors now begin at a true boundary; condition (i),
    applied to the remaining word in $D^(*)$, makes them exactly the next episode and gives its indexed update.
    The next $W$-factor consumes actual skipped episodes. Inducting through the finite number of starred factors
    proves the claimed whole update. The $W_(x \, y)$ branch handles words without an explicit split.
  Conversely, for a genuine episode sequence, split every episode outside $D'$ using (ii) and collect consecutive
    skipped episodes into $W$-factors. The deterministic computation supplies the intervening state indices.
    If every episode is skipped, use $W_(x \, y)$. This also handles $epsilon.alt$.
  For the height statement, $D^(*)$ has height at most two.
    The starred middle factor has height at most $1 + max { 1 \, H }$.
    All remaining operations and factors fit the asserted maximum. ◻
]

Condition (i) quantifies over #emph[every] pair of independent successful witnesses.
  Equality of guessed parameters is never part of the ambient meaning of a split.
  It must follow from the actual tests, or its failure must be harmless for the declared update.

When $D' = diameter$, the bottom graph tests are $1$ for equal states and $0$ for unequal states.
  Thus the recursion has height-zero initial tests.

=== 2.3 Affine corrections and linear recovery <affine-corrections-and-linear-recovery>

#thm([Lemma 2.3.])[
  (Affine recovery).  #emph[Suppose the deterministic update on each episode is $v mapsto v A_e +
    b_e$ on a fixed finite vector space. Exact graph tests for the composed affine update on all vectors give,
    by finite Boolean operations, the graph tests for the composition of the $A_e$.]
] <lem:affine-recovery>

#proof[
  The composite of $v mapsto v A + b$ followed by $v mapsto v C + d$ is $v mapsto v A C + b C + d$.
    Therefore the linear part of the composed update $g_w$ is $g_w \( v \) - g_w \( 0 \)$,
    with the desired product of linear parts. If $R_(x \, z)$ are its graph tests, then
  $ union.big_z #scale(x: 120%, y: 120%)[\(] R_(x \, y + z) ∩ R_(0 \, z) #scale(x: 120%, y: 120%)[\)] $
  is exactly the test for linear output $y$ on input $x$. Both tests concern the same word and hence the same map. ◻
]

An affine map $f \( v \) = v A + b$ has the homogeneous linear lift

#[#set math.equation(numbering: n => "(2.2)")
 $ \( v \, c \) mapsto \( v A + c b \, c \) $ <eq:homogeneous>]

on $V xor upright(bold(F))_2$. These lifts compose and recover $f$ on inputs $\( v \, 1 \)$.
  More generally, any map of a finite set has a unique linear extension sending each basis vector to the basis
  vector of its image. Neither device requires invertibility.

=== 2.4 Prediction trials <prediction-trials>

Fix a representation of $M$ on a finite vector space $U$, and put $J = \| U \|^2$. A trial has endpoints and checkpoints

$ B = z_0 < z_1 < dots.h.c < z_J < z_(J + 1) = C . $

Its block $j$ is an ordered set of potential cuts strictly between $z_(j - 1)$ and $z_j$.
  Enumerate all pairs of vectors as $\( x_j \, y_j \)$, $1 lt.eq j lt.eq J$.
  A prediction is a tuple $\( p_1 \, dots.h \, p_(J + 1) \) in M^(J + 1)$, and $T_(*) = p_1 dots.h.c p_(J + 1)$.
  Write $T = T_(B \, C)$.

#prodef([Definition 2.4.])[
  Block $j$ is #emph[ideally eligible] if
  $ x_j T_(*) = y_j \, wide T_(z_(i - 1) \, z_i) = p_i med \( 1 lt.eq i < j \) \, wide T_(z_j \, C) =
    p_(j + 1) dots.h.c p_(J + 1) . $
  A trial is #emph[perfectly predicted] if every interval product is its corresponding $p_i$.
] <def:eligibility>

#thm([Lemma 2.5.])[
  (Prediction trial).  #emph[There is a deterministic shift $beta in U$,
    defined from the actual trial word and its prediction, such that every ideally eligible pair satisfies $y_j =
    x_j T + beta$. A perfectly predicted trial has an eligible block for every possible input vector.]
] <lem:prediction>

#proof[
  Suppose $h < j$ are eligible. The prefix conditions for $j$ determine every actual interval through $z_h$,
    and the suffix condition for $h$ determines the product from $z_h$ to $C$. Hence
  $ T = T_(B \, z_h) T_(z_h \, C) = \( p_1 dots.h.c p_h \) \( p_(h + 1) dots.h.c p_(J + 1) \) = T_(*) . $
  This uses multiplication, without cancellation.
  If $T = T_(*)$, every eligible pair fits $beta = 0$. If $T eq.not T_(*)$, at most one block is eligible;
    choose its forced shift $y_j - x_j T$, or zero if none is eligible. These rules define $beta$ on every trial.
    For a perfect prediction, the block for $\( x \, x T \)$ is eligible for each $x$. ◻
]

The conclusion for two eligible blocks is equality of the #emph[whole] products $T = T_(*)$.
  It does not assert that the individual factors in the prediction tuple are correct.
  Perfect prediction is the separate, stronger condition used to obtain an eligible block for every input.

We replace the action on the trial by $v mapsto v T + beta$, implemented by adding $beta$ at its end.
  At a cut in block $j$, the prefix can verify arrival at $B$ with vector $x_j$, the predicted transfer,
  and every preceding interval condition. The suffix can verify the product from $z_j$ to $C$ and continue from
  vector $y_j$ at $C$. If these checks agree on the trial data,
  Lemma 6 proves their transfer without either side knowing the entire current trial shift.

Whenever a computation passes through an entire other trial,
  its shift is computed using #emph[ideal] eligibility from Definition 5.
  Tag failures, decoding failures, and the choice of a particular split never affect that shift.
  This convention will keep all episode updates deterministic.

== 3 A finite tag clock <sec:clock>

A prefix and a suffix may choose different metadata. We need a finite residue test that either makes their choices
  agree or confines every successful disagreement to one fixed input–output pair.
  A deterministic affine correction can absorb the latter case without changing the linear part to be recovered.
  We also need many possible cuts: the number spoiled by the clock must remain bounded when more copies are added.

The following lemma supplies both properties. Its tags are finite metadata, never input letters.
  Its roster is the finite index set of possible cut copies.
  The modulus may grow with this roster, but the obstruction bound does not.
  Throughout this section, $log$ denotes the natural logarithm.

#thm([Lemma 3.1.])[
  (Tag clock).  #emph[Let $Lambda$ be a nonempty finite set, let $m = \| Lambda \|$,
    let $cal(R)$ be any finite set, and let $B > 0$. There are a positive integer $n$, sets $I_alpha \,
    J_alpha subset.eq bb(Z) \/ n bb(Z)$ for $alpha in Lambda$, a set $W subset.eq bb(Z) \/ n bb(Z)$,
    and residues $v_p in bb(Z) \/ n bb(Z)$ for $p in cal(R)$, with the following properties.]
  + #emph[Every prime factor of $n$ exceeds $B$.]
  + #emph[For every $ell in bb(Z) \/ n bb(Z)$, the directed graph
$ cal(E)_ell = { \( alpha \, beta \) in Lambda^2 : ell in I_alpha + J_beta } $

 is either contained in the diagonal ${ \( alpha \, alpha \) :
   alpha in Lambda }$ or consists of exactly one ordered pair $\( alpha \, beta \)$ with $alpha eq.not beta$.]
  + #emph[If $ell in.not W$, then $cal(E)_ell$ is the full diagonal.]
  + #emph[For every $u in bb(Z) \/ n bb(Z)$,
#[#set math.equation(numbering: n => "(3.1)")
 $ lr(|{\( p \, p' \) in cal(R)^2 : p eq.not p' \, quad u + v_(p') - v_p in W}|) lt.eq
   c_(upright("cl")) log \( 2 m \) \, $ <eq:clock-roster>]

 where the absolute constant $c_(upright("cl")) = 1 thin 300 thin 000$ is valid.]
  #emph[In particular, $c_(upright("cl"))$ is independent of $B$, $m$, and $\| cal(R) \|$.]
] <lem:clock>

The ordered-pair estimate will control false guesses of a word’s origin.
  Choose integer cut offsets congruent to their assigned roster residues.
  If an actual cut has offset $p$ from an origin $t$, interpreting it as offset $p'$ instead gives the candidate
  origin $t + p - p'$. For a fixed end anchor $q$, its total residue is $q - t + p' - p$.
  Property (iv) therefore bounds how many such wrong candidates have a bad total residue,
  even when the roster contains many copies of every cut kind.
  The modulus may be very large; the number of bad pairs is the quantity needed below.

#proof[
  We first specify finitely many cyclic coordinates and construct the sets and roster values in their product.
    At the end we identify this product with a single cyclic group. Put
  $ a = ceil.l 64 log \( 2 m \) ceil.r \, wide b = ceil.l log_2 m ceil.r \, wide K_(upright("cl")) = 400 \, wide
    r = \| cal(R) \| . $
  Here $K_(upright("cl"))$ is fixed once and for all.
  ===== 3.1 Partitions and coordinate layout. <partitions-and-coordinate-layout.>
  Choose $a$ assignments of $Lambda$ to a left side and a right side, allowing either side to be empty, so that,
    whenever
  #[#set math.equation(numbering: n => "(3.2)")
   $ alpha eq.not beta \, wide { alpha \, beta } eq.not { gamma \, delta } \, $ <eq:clock-separation-constraint>]
  some partition puts $alpha$ on the left, $beta$ on the right, and $gamma \, delta$ on the same side.
    We allow $gamma = delta$. To prove existence, independently assign each tag to a side with probability $1 \/
    2$. The required assignment is feasible: if ${ gamma \, delta }$ contains $alpha$, put both on the left;
    if it contains $beta$, put both on the right; and if it contains neither, put both on the left.
    The excluded equality in Equation (3.2) ensures that these prescriptions never force $alpha$ and $beta$ onto
    the same side. Specifying sides for at most four distinct tags has probability at least $1 \/ 16$.
    There are at most $m^4$ constraints. With $a$ independent partitions,
    the expected number that all partitions miss is at most
  $ m^4 \( 15 \/ 16 \)^a lt.eq m^4 exp \( - a \/ 16 \) lt.eq m^4 \( 2 m \)^(- 4) = 1 \/ 16 < 1 . $
  The number missed is a nonnegative integer, so some choice misses none.
    We give each of these $a$ partitions one coordinate, called a #emph[first coordinate].
  Also choose $b$ partitions into Type 1 and Type 2 that separate every two distinct tags.
    For example, label the tags by distinct binary strings of length $b$, and use the bit at each position.
    When $m = 1$, $b = 0$ and there are no such partitions. Give each Type partition a batch of coordinates as
    follows. List every ordered list of $K_(upright("cl"))$ directed pairs $\( p \, p' \)$ of distinct roster
    labels whose underlying unordered edges are distinct and form a forest.
    A forest here is a finite simple graph with no cycles. Give each such list one dedicated coordinate in the
    batch, and add spare coordinates if needed to make the batch size positive and odd.
    All these lists form a finite set. This defines a finite coordinate set $cal(C)$ before choosing any prime orders.
  Choose pairwise distinct primes $N_c$, $c in cal(C)$, satisfying
  #[#set math.equation(numbering: n => "(3.3)")
   $ N_c > max { B \, 400 \, 2^(r + 1) } . $ <eq:clock-prime-threshold>]
  This is possible recursively: the product of all primes at most any given finite bound, plus one,
    has a prime divisor exceeding that bound. At each step include the previously chosen primes in the bound. Write
  $ G = product_(c in cal(C)) bb(Z) \/ N_c bb(Z) . $
  For $x in bb(Z) \/ N_c bb(Z)$, identify $x \/ N_c$ with its point on $bb(T) = bb(R) \/ bb(Z)$.
    On this circle write $parallel z parallel_(bb(T)) = min_(j in bb(Z)) \| z -
    j \|$ and $"dist"_(bb(T)) \( z \, A \) = min_(a' in A) parallel z -
    a' parallel_(bb(T))$ for a nonempty finite set $A$.
  ===== 3.2 The first coordinates. <the-first-coordinates.>
  In the coordinate for a left/right partition, impose the requirements
  $ upright("side of ") alpha & I_alpha upright(" coordinate") & J_alpha upright(" coordinate")\
upright("left") & { 0 } & \( bb(Z) \/ N_c bb(Z) \) \\ { 0 }\
upright("right") & \( bb(Z) \/ N_c bb(Z) \) \\ { 0 } & { 0 } . $
  Any nonzero total is a sum for a diagonal pair: put the total in the required nonzero summand and put zero in
    the other. At total zero, however, no edge between two tags on the same side is possible,
    since it would have exactly one nonzero summand.
  Suppose an off-diagonal edge $alpha arrow.r beta$ occurs at a total $ell in G$.
    For any $\( gamma \, delta \)$ satisfying Equation (3.2), choose its separating partition.
    The edge $alpha arrow.r beta$ forces total zero in that coordinate,
    because its two summands are both required to be zero. The competing edge $gamma arrow.r
    delta$ is impossible there because its tags are on the same side.
    Thus the only other edge that could coexist with $alpha arrow.r beta$ is $beta arrow.r alpha$.
    This argument also excludes every diagonal edge, because the constraints explicitly include $gamma = delta$.
  ===== 3.3 Type 1 batches: all sums and separated differences. <type-1-batches-all-sums-and-separated-differences.>
  Put
  $ A = { 0 \, 1 \, 3 } \/ 6 subset.eq bb(T) \, wide D = { 2 \, 4 \, 5 } \/ 6 subset.eq bb(T) . $
  For a tag of Type 1 in a batch, require in every coordinate $c$ of that batch
  $ "dist"_(bb(T)) \( i_c \/ N_c \, A \) lt.eq 1 \/ 16 quad upright("for ") i in I_alpha \, wide
    "dist"_(bb(T)) \( j_c \/ N_c \, D \) lt.eq 1 \/ 16 quad upright("for ") j in J_alpha . $
  The sums of the two center sets contain every sixth of the circle:
  $ { 0 \, 1 \, 3 } + { 2 \, 4 \, 5 } = bb(Z) \/ 6 bb(Z) . $
  Every target $z in bb(T)$ is therefore within $1 \/ 12$ of some center sum $a' + d'$.
    Choose a signed adjustment $theta$, with $\| theta \| lt.eq 1 \/ 12$, such that $z = a' + d' +
    theta$ on the circle. The continuous summands $a' + theta \/ 2$ and $d' +
    theta \/ 2$ are each within $1 \/ 24$ of their respective centers.
    If $z$ is a point of the $N_c$-grid, round the first summand to the nearest grid point and define the second
    to be $z$ minus the rounded first. Both summands then lie on the grid and each changes by circular distance at
    most $1 \/ \( 2 N_c \)$. Since $N_c > 24$,
  $ 1 / 24 + frac(1, 2 N_c) < 1 / 16 . $
  Thus the Type 1 sumset is the entire batch group, with the choices made independently in its coordinates.
  The two center sets have circular distance at least $1 \/ 6$ from each other.
    Consequently, every Type 1 difference $i - j$ satisfies
  #[#set math.equation(numbering: n => "(3.4)")
   $ parallel \( i_c - j_c \) \/ N_c parallel_(bb(T)) gt.eq 1 / 6 - 2 / 16 = 1 / 24 quad
     upright("in every coordinate of its batch") . $ <eq:clock-type-one-difference>]
  ===== 3.4 Type 2 batches: majority sums and differences. <type-2-batches-majority-sums-and-differences.>
  Suppose a batch has $2 s + 1$ coordinates. Call a coordinate value #emph[small] if its circular distance from
    zero is at most $1 \/ 100$. For a tag of Type 2, both $I_alpha$ and $J_alpha$ require a strict majority,
    that is, at least $s + 1$, of the batch coordinates to be small. There are no restrictions on the other coordinates.
  Their sumset contains every target vector $z$ with at least one small coordinate.
    Indeed, at one such coordinate set the first summand equal to $z$ and the second to zero, making both small.
    Partition the other $2 s$ coordinates into two sets of size $s$.
    On the first set make the first summand zero, and on the second set make the second summand zero;
    in each coordinate determine the remaining summand by the target.
    Both vectors have at least $s + 1$ small coordinates. Conversely,
    the sets of small coordinates of two vectors satisfying the majority condition must intersect.
    Every Type 2 difference therefore satisfies
  #[#set math.equation(numbering: n => "(3.5)")
   $ parallel \( i_c - j_c \) \/ N_c parallel_(bb(T)) lt.eq 2 \/ 100 quad
     upright("for at least one coordinate in its batch") . $ <eq:clock-type-two-difference>]
  This argument also covers a one-coordinate batch, with $s = 0$.
  ===== 3.5 The exclusive graph alternative. <the-exclusive-graph-alternative.>
  Define each $I_alpha subset.eq G$ and $J_alpha subset.eq G$ by imposing all its first-coordinate and batch
    requirements. These requirements concern disjoint coordinate blocks.
    We already know that an off-diagonal edge can coexist only with its reversal.
    If both $alpha arrow.r beta$ and $beta arrow.r alpha$ occurred, there would be elements $i_alpha in I_alpha$,
    $j_alpha in J_alpha$, $i_beta in I_beta$, and $j_beta in J_beta$ with
  $ i_alpha + j_beta = ell = i_beta + j_alpha \, wide i_alpha - j_alpha = i_beta - j_beta . $
  Choose a Type partition separating $alpha$ and $beta$. In its batch the common difference would satisfy the
    bounds in both Equation (3.4) and Equation (3.5), which is impossible because $2 \/ 100 < 1 \/ 24$.
    This proves the alternative in (ii) in $G$.
  Let $W subset.eq G$ be the union of the following obstructions:
  + a first coordinate of the total is zero;
  + in some Type batch, none of the total’s coordinates is small.
  If $ell in.not W$, every diagonal pair has a decomposition of $ell$ in every first coordinate and every batch,
    by the sumset arguments above. Combining these decompositions gives $ell in I_alpha +
    J_alpha$ for every $alpha$. The exclusive graph alternative then implies that the graph is the full diagonal.
    This proves (iii). No converse assertion about $W$ is needed.
  We have now established the graph alternative and the availability of all diagonal pairs outside $W$.
    It remains to choose the roster residues so that every translate produces few ordered pairs in $W$.
    The first coordinates and the Type batches require different counting arguments.
  ===== 3.6 Roster values in the first coordinates. <roster-values-in-the-first-coordinates.>
  Enumerate $cal(R) = { p_0 \, dots.h \, p_(r - 1) }$. In every first coordinate assign
  $ \( v_(p_j) \)_c = 2^j med \( mod med N_c \) . $
  The nonzero ordered integer differences are all distinct. For a positive difference with $j > i$, the factorization
  $ 2^j - 2^i = 2^i \( 2^(j - i) - 1 \) $
  determines $i$ as the exponent of the largest power of two dividing the difference, and then determines $j$.
    The sign distinguishes the reverse ordering. For $r gt.eq 2$,
    all signed differences lie between $- \( 2^(r - 1) - 1 \)$ and $2^(r - 1) - 1$; by Equation (3.3),
    their range has length less than $N_c$. Thus they remain distinct modulo $N_c$.
    For any fixed $u in G$, at most one ordered pair $p eq.not p'$ can satisfy
  $ u_c + \( v_(p') \)_c - \( v_p \)_c = 0 . $
  This also holds when $r lt.eq 1$, since there are no such pairs.
  ===== 3.7 Roster values in a dedicated coordinate. <roster-values-in-a-dedicated-coordinate.>
  Consider a coordinate $c$ dedicated to a list with directed pairs
  $ \( pi_j \, pi'_j \) \, wide 0 lt.eq j < K_(upright("cl")) . $
  Choose $d_j in bb(Z) \/ N_c bb(Z)$ by rounding $j \/ K_(upright("cl"))$ to the nearest point of the $N_c$-grid,
    so that
  $ parallel d_j \/ N_c - j \/ K_(upright("cl")) parallel_(bb(T)) lt.eq 1 \/ \( 2 N_c \) . $
  Prescribe $\( v_(pi'_j) \)_c - \( v_(pi_j) \)_c = d_j$. To realize these prescriptions,
    root each tree component and assign its root value zero. On traversing an edge to a previously unassigned
    vertex, add $d_j$ if traversing from $pi_j$ to $pi'_j$, and subtract $d_j$ if traversing in the opposite
    direction. The absence of cycles means that each new vertex is assigned once,
    with no consistency condition left to check. Give isolated roster labels value zero.
    Spare coordinates can have arbitrary roster values, for example all zero.
    Distinct roster labels may receive the same value in a batch coordinate;
    only the prescribed edge differences will be used.
  For every $u_c in bb(Z) \/ N_c bb(Z)$, one of the equally spaced points $j \/
    K_(upright("cl"))$ is within $1 \/ \( 2 K_(upright("cl")) \)$ of $- u_c \/ N_c$. For that edge,
  #[#set math.equation(numbering: n => "(3.6)")
   $ parallel \( u_c + \( v_(pi'_j) \)_c - \( v_(pi_j) \)_c \) \/ N_c #scale(x: 120%, y: 120%)[parallel]_(bb(T))
     lt.eq frac(1, 2 K_(upright("cl"))) + frac(1, 2 N_c) < 1 / 100 \, $ <eq:clock-forest-net>]
  using $K_(upright("cl")) = 400$ and $N_c > 400$. Thus every translate makes at least one edge of this dedicated
    forest small in this coordinate.
  ===== 3.8 The bound for one batch. <the-bound-for-one-batch.>
  Fix $u in G$ and a batch, and let $S$ be the set of ordered pairs $p eq.not p'$ for which $u + v_(p') -
    v_p$ has no small coordinate in that batch. Suppose that $\| S \| > 4 K_(upright("cl"))^2$.
    Forget directions and identify the two orientations of each unordered edge to obtain a simple graph on the
    nonisolated roster labels. This graph contains a forest with $K_(upright("cl"))$ edges.
    To see this, take a spanning forest, obtained by growing a tree in each connected component until all its
    vertices are reached. If its edge count $f$ were less than $K_(upright("cl"))$, then,
    writing $v$ for its number of vertices and $t$ for its number of components, we would have
  $ f = v - t \, wide t lt.eq v \/ 2 \, wide v lt.eq 2 f < 2 K_(upright("cl")) . $
  Here each component has at least two vertices because isolated vertices were removed.
    But then $\| S \| lt.eq v \( v - 1 \) < 4 K_(upright("cl"))^2$, a contradiction.
  Choose $K_(upright("cl"))$ forest edges, choose for each an orientation belonging to $S$,
    and order the resulting directed pairs. The batch already has a coordinate dedicated to this list.
    By Equation (3.6), one of its pairs has a small translated difference in that coordinate,
    contradicting membership in $S$. Consequently every batch contributes at most $4
    K_(upright("cl"))^2$ ordered pairs to the obstruction. The forest may depend on $u$;
    every possible directed list was allocated a coordinate in advance.
    If no such forest can be formed from the roster, the spanning-forest count alone gives the required bound,
    and the spare coordinates do not affect it.
  ===== 3.9 Combining the estimates and the cyclic coordinates. <combining-the-estimates-and-the-cyclic-coordinates.>
  Taking a union over the $a$ first coordinates and $b$ batches gives
  $ lr(|{ \( p \, p' \) : p eq.not p' \, med u + v_(p') - v_p in W }|) lt.eq a + 4 K_(upright("cl"))^2 b . $
  Since $log 2 > 1 \/ 2$,
  $ a lt.eq 66 log \( 2 m \) \, wide b lt.eq frac(log \( 2 m \), log 2) lt.eq 2 log \( 2 m \) . $
  It follows that the last bound is at most
  $ \( 66 + 8 dot.op 400^2 \) log \( 2 m \) lt.eq c_(upright("cl")) log \( 2 m \) . $
  Only the number of partitions enters this estimate. The number of coordinates within a batch,
    and the eventual modulus, may depend on the entire roster.
  Finally put $n = product_(c in cal(C)) N_c$. The residue map
  $ bb(Z) \/ n bb(Z) arrow.r G \, wide x mapsto \( x med mod med N_c \)_(c in cal(C)) \, $
  is an isomorphism of additive groups. For an explicit proof of surjectivity,
    $n \/ N_c$ is nonzero modulo the prime $N_c$, so some multiple $e_c$ of it is $1$ modulo $N_c$;
    the same $e_c$ is zero in all other coordinates. A prescribed tuple $\( x_c \)$ is therefore the image of
    $sum_c x_c e_c$. The kernel consists of integers divisible by every $N_c$, hence by their product,
    proving injectivity. Transport $I_alpha \, J_alpha \, W$, and all $v_p$ through this isomorphism.
    All sum, difference, and translation statements are preserved, and every prime factor of $n$ satisfies (i).
  For $m = 1$ the first-coordinate construction still uses the positive number $a$ of coordinates,
    while no Type batches are needed. The separation constraints are vacuous,
    and the diagonal is available whenever all first totals are nonzero.
    Thus this case uses the same proof, without an empty product of moduli.
    Empty and singleton rosters have no ordered distinct pairs and were also included above. This completes the proof. ◻
]

=== 3.1 Interpretation at a cut <interpretation-at-a-cut>

Suppose a prefix test selects $alpha$ and knows an integer $i$,
  while a suffix test independently selects $beta$ and knows an integer $j$. Their clock requirements are

$ i med mod med n in I_alpha \, wide j med mod med n in J_beta . $

If $i + j = ell$ is fixed across all successful cuts under consideration,
  Lemma 7 applies to every such pair of tests. In the diagonal case their tags must agree.
  In the off-diagonal case every successful pair uses the same prefix tag $alpha$ and the same suffix tag $beta$.
  In the episode applications below,

$ i = k - t \, wide j = q - k \, wide ell = q - t . $

The common total is available only after an independent end guard has established the actual anchor $q$.
  The clock does not itself establish the anchor or the validity of other metadata.

The tags will include a claimed input $X$ and output $Y$ in a vector space, with the prefix checking $x =
  X \( alpha \)$ and the suffix checking $y = Y \( beta \)$.
  If the unique edge is off-diagonal, every successful transfer therefore has the same input and output,
  and is consistent with the affine map

$ v mapsto v T + Y \( beta \) - X \( alpha \) T $

for any specified linear part $T$. This explains why the exclusive alternative in Lemma 7 is sufficient for the
  affine updates used below. An empty graph simply permits no successful transfer.

For availability, if $ell in.not W$, every desired diagonal tag $alpha$ has some decomposition $ell = i +
  j$ with $i in I_alpha$ and $j in J_alpha$. Thus a family of candidate cuts whose first residues exhaust
  $bb(Z) \/ n bb(Z)$ contains a cut meeting both requirements for that tag,
  provided its other checks hold throughout the family. Consecutive $n$ cuts have this property,
  as does a progression of $n$ cuts whose step is coprime to $n$.
  Indeed multiplication by a coprime step permutes the residue classes.

Lastly, suppose integer offsets $p$ have been assigned the roster residues $v_p$, and $q \, t \,
  gamma$ are fixed integers. Then

$ q - \( t + gamma + p - p' \) in W quad arrow.l.r.double quad \( q - t - gamma \) + v_(p') - v_p in W \, $

where membership uses residues modulo $n$. Equation (3.1) bounds the number of ordered pairs satisfying this
  condition. For a fixed finite set of translates $Gamma$, the union over $gamma in Gamma$ has at most $\|
  Gamma \| c_(upright("cl")) log \( 2 m \)$ such pairs. Both $q$ and each $gamma$ are held fixed while applying
  the roster estimate; choosing a usable offset afterwards does not alter that bound.

== 4 Local markers and episode ends <sec:geometry>

The split identity requires each accepted suffix to stop at the actual first episode end.
  Agreement of tags alone cannot guarantee that endpoint. This section constructs an intrinsic episode rule from
  local markers and proves two ways for a suffix to identify its end, including when its guessed origin is false.
  The same marker rule also identifies periodic intervals for the second outer split.

We use integer positions between letters: the letter at position $x$ occupies $\[ x \, x + 1 \)$.
  Intervals of possible marker positions, in contrast, are inclusive integer intervals.
  Throughout this section the alphabet is nonempty, so every finite word has a two-sided extension.
  Such extensions will only be used to prove statements about local rules;
  all tests on a finite word must have their stated inspection intervals inside that word.

=== 4.1 An elementary local marker rule <an-elementary-local-marker-rule>

A positive integer $d$ is a #emph[period] of a finite block if letters at positions $d$ apart agree whenever both
  positions belong to the block. Equivalently, the block extends to a two-sided $d$-periodic word.
  If the block has length at least $d$, this extension is unique for that period.

This use of markers to isolate local periodicity follows the viewpoint of Krieger’s marker lemma [5] Lemma 2.
  Related clopen-marker constructions are set out in [6] Lemmas 3.2–3.4.
  The local rule and its explicit finite-window bounds are proved below.

#thm([Lemma 4.1.])[
  (Local markers).  #emph[For integers $d gt.eq 2$ and $K gt.eq 1$ there are an integer $r gt.eq K$ and a fixed,
    translation-equivariant marking rule on two-sided words with the following properties.]
  + #emph[Distinct markers have distance at least $d$.]
  + #emph[Whether $x$ is marked depends only on the letters in $\[ x - r \, x + r \)$.]
  + #emph[If no marker lies in $\[ z - d \, z + d \]$, the block $\[ z \, z + K \)$ has a period strictly less
    than $d$.]
  #emph[Consequently a marker test whose inspection interval is present in a finite word is independent of its
    two-sided extension.]
] <lem:markers>

#proof[
  List as $v_1 \, dots.h \, v_N$ all length-$K$ words having no period below $d$. Start with no markers.
    At stage $j$, mark every occurrence of $v_j$ whose start is at distance at least $d$ from all markers
    installed at earlier stages. Two occurrences installed at this same stage cannot be less than $d$ apart.
    Indeed a word in the list has $K gt.eq d$, since otherwise $K$ itself would be a period below $d$.
    Starts at positive distance $a < d lt.eq K$ would therefore overlap and give $v_j$ period $a$,
    a contradiction. Separation is preserved at every stage.
  For locality, take $r_0 = K$ and $r_j = K + j \( d - 1 \)$.
    If earlier decisions have radius $r_(j - 1)$, deciding the stage-$j$ rule at $x$ requires its length-$K$ block
    and the earlier decisions at $x - \( d - 1 \) \, dots.h \, x + \( d - 1 \)$.
    These are all determined in $\[ x - r_j \, x + r_j \)$. The union with earlier markers is determined there
    too. Thus $r = r_N$ suffices. The construction commutes with every integer translation.
  If the block at $z$ equals some $v_j$, at stage $j$ its start is either marked or blocked by an earlier marker
    at distance less than $d$. That marker remains installed.
    Absence of a marker in $\[ z - d \, z + d \]$ therefore excludes every word on the list and proves the last
    assertion. Locality proves extension independence. ◻
]

#thm([Lemma 4.2.])[
  (Overlap of short-period blocks).  #emph[Two two-sided words of respective periods $a \,
    b$ which agree on $a b$ consecutive letter positions agree everywhere. In particular:]
  + #emph[If $K - w > d^2$, length-$K$ blocks starting at a finite nonempty set of positions of diameter at most
    $w$, each having a period below $d$, have one common two-sided periodic extension.
    The word agrees with this extension on the whole union of these blocks.]
  + #emph[Use the rule of Lemma 8 with $K > 3 d^2$. If $H gt.eq d$ and $\[ z - H \, z + H \]$ contains no marker,
    all the blocks starting at integer positions from $z - H + d$ through $z + H -
    d$ belong to one common two-sided periodic word of some period below $d$.
    The original word agrees with it throughout $\[ z - H + d \, z + H - d + K \)$.]
  #emph[All statements apply to a finite word when the indicated blocks and marker inspection intervals are available.]
] <lem:periodic-overlap>

#proof[
  The integer $a b$ is a period of both two-sided words. Given any position,
    translate it by a multiple of $a b$ into the interval of agreement.
    Both letters are preserved by this translation, proving the first assertion.
  For (i), any two blocks overlap in at least $K - w > d^2$ letters,
    more than the product of their two short periods. Their periodic extensions therefore agree.
    This also shows that choosing a different short period for any one block gives the same extension.
    Fixing one block now gives a common extension for them all.
    Their union is the interval from the least start to the greatest start plus $K$, since $w < K$;
    every letter there belongs to a block and has the asserted value.
  For (ii), each indicated start $x$ has $\[ x - d \, x + d \] subset.eq \[ z - H \, z + H \]$,
    so Lemma 8 gives a period below $d$ for its length-$K$ block.
    Consecutive blocks overlap in $K - 1$ letters, at least the product of their periods.
    The first assertion, applied successively, identifies all their extensions.
    The common extension retains, for example, the short period of the first block. ◻
]

=== 4.2 How often a sliding search can fail <how-often-a-sliding-search-can-fail>

For a set $S subset.eq bb(Z)$ of marker positions and an integer $L gt.eq 0$, write

$ f_L \( z \) = min #scale(x: 120%, y: 120%)[\(] S ∩ \[ z - L \, z + L \] #scale(x: 120%, y: 120%)[\)] \, $

with value $tack.t$ when the intersection is empty. Equality of two search results means equality of their
  positions in the word, or that both are $tack.t$.

#thm([Lemma 4.3.])[
  (Search crossings and right margins).  #emph[Let $I$ be an interval of integer centers of diameter $D$.]
  + #emph[Suppose distinct points of $S$ are at least $d$ apart.
    If $h gt.eq 0$ and $D + 2 h < d$, at most $2 \( 2 h + 1 \)$ centers $z in I$ satisfy
$ f_L \( z + e \) eq.not f_L \( z \) quad upright("for some integer ") \| e \| lt.eq h . $

 This estimate is independent of $L$.]
  + #emph[Let $h gt.eq 1$. If $D < 2 L + 2$, at most $h$ centers $z in I$ satisfy
$ S ∩ \[ z - L \, z + L \] = diameter \, wide S ∩ \( z + L \, z + L + h \] eq.not diameter . $

 This estimate does not require a separation hypothesis on $S$.]
  #emph[If centers are indexed by ordered pairs $\( p \, p' \)$, $p eq.not p'$, as $z = z_0 + p - p'$,
    and all their ordered nonzero differences are distinct, the same bounds count ordered pairs.]
] <lem:search-crossings>

#proof[
  If a first-marker result changes, a marker belongs to the symmetric difference of the two search intervals.
    Such a marker is within distance $h$ of $z - L$ or of $z + L$.
    As $z$ ranges over $I$, each of these enlarged endpoint ranges has diameter $D +
    2 h < d$ and hence contains at most one marker. For a fixed marker and a fixed endpoint,
    the condition of being within distance $h$ permits at most $2 h + 1$ integer centers.
    Summing over the two endpoints proves (i). We only use the implication from a changed result to a crossing;
    an entering marker need not change the minimum.
  For (ii), assign to a center $z$ its first marker $m$ strictly after $z + L$.
    It satisfies $z + L < m lt.eq z + L + h$. Suppose distinct serving markers $m <
    m'$ are assigned to centers $z \, z'$. Since $m'$ is the first marker after $z' + L$, we have $m lt.eq z' +
    L$. The marker-free interval about $z'$ then forces $m lt.eq z' - L - 1$.
    Combining this with $m gt.eq z + L + 1$ gives $z' - z gt.eq 2 L + 2$, contrary to the diameter hypothesis.
    Thus at most one marker serves the centers under consideration. For that fixed $m$,
  $ m - L - h lt.eq z lt.eq m - L - 1 \, $
  which allows at most $h$ integer centers. Finally, distinct ordered differences make the indexing map
    $\( p \, p' \) mapsto z_0 + p - p'$ injective. ◻
]

For local markers, the counting estimates apply to a finite word when all the shifted search inspection intervals
  are present. Indeed one may evaluate the rule on any common two-sided extension,
  and locality identifies all the results being counted.

The marker and search lemmas now supply the two kinds of control we need:
  absence yields a periodic interval, while instability can occur at only a bounded number of translated centers.
  We next use a separate marker search to define an episode end that an independently chosen suffix can check.

=== 4.3 The episode rule <the-episode-rule>

We now introduce the geometric parameters; their finite order of choice and all placement requirements are
  verified in Proposition 22. An episode begins at $s$, and its sampling origin is

$ t = s + L_0 . $

The five aligned subbuffers will lie between $s$ and $t$.
  The outer split layers will use finitely many nominal offsets after $t$.

Apply Lemma 8 to an #emph[inner] marker system with parameters

$ d_compose gt.eq 2 \, wide K_compose > 3 d_compose^2 \, wide r_compose gt.eq K_compose . $

For each label $lambda$ in a finite set $cal(Z)$, let $o_lambda$ be its nominal offset and set

$ z_lambda \( t \) = t + o_lambda \, wide u_lambda \( t \) =
  upright("first inner marker in ") \[ z_lambda \( t \) - H \, z_lambda \( t \) + H \] \, $

again using $tack.t$ for absence. The labels, offsets, trials, and full cut-offset sets $cal(H)_1 \,
  cal(H)_2$ are specified in Section 5; no trial roster is needed to define the end rule.

Independently apply Lemma 8 to an #emph[end] marker system with parameters

$ d_bullet gt.eq 2 \, wide K_bullet > 3 d_bullet^2 \, wide r_bullet gt.eq K_bullet . $

Its nominal position and search are

$ z_bullet \( t \) = t + o_bullet \, wide eta \( t \) =
  upright("first end marker in ") \[ z_bullet \( t \) - d_bullet \, z_bullet \( t \) + d_bullet \] . $

The value is $tack.t$ in the markerless case. The inspection interval for this search is

$ \[ z_bullet \( t \) - d_bullet - r_bullet \, z_bullet \( t \) + d_bullet + r_bullet \) . $

When $eta \( t \) = tack.t$, Lemma 8 gives the seed block $\[ z_bullet \( t \) \, z_bullet \( t \) + K_bullet \)$
  a period below $d_bullet$. Lemma 9 makes its two-sided periodic extension unique even when several such periods
  are possible. Denote it by $pi_t$.

#prodef([Definition 4.4.])[
  (Complete episodes).  Fix a positive integer $B_(upright("tail"))$.
    With all required bounded data present, the #emph[anchor] at origin $t$ is defined as follows:
  + if $eta \( t \) eq.not tack.t$, the anchor is $q = eta \( t \)$;
  + if $eta \( t \) = tack.t$, the anchor is the first letter position $q gt.eq z_bullet \( t \) +
    K_bullet$ whose letter differs from $pi_t \( q \)$. If no such letter is present, no anchor has yet been found.
  An episode beginning at $s$ ends exactly at $q + B_(upright("tail"))$.
    The language $E$ consists of the nonempty words which, with $s = 0$,
    contain the required search and seed data, have an anchor under this rule, and end exactly there.
    In the markerless case the tail includes the mismatch letter at $q$, since $B_(upright("tail")) gt.eq 1$.
] <def:episodes>

In the markerless case, “first” is part of the end test: every letter from the seed’s end up to $q$ must agree
  with the repetition, and the letter at $q$ must disagree.
  Applying the rule at an origin relative to a suffix beginning at a cut uses precisely the same convention.

#thm([Lemma 4.5.])[
  (Prefix code).  #emph[The language $E$ is a prefix code. Its end decisions have the same values in an episode
    considered alone and in any word containing that episode at the same position.]
] <lem:prefix-code>

#proof[
  Let $e \, f in E$, with $e$ a prefix of $f$. Their starts and sampling origins coincide.
    All end-marker inspections used by $e$ are internal to $e$,
    so the two words obtain the same value of $eta \( t \)$. A present marker immediately fixes the same anchor.
    If it is absent, the same seed fixes the same repetition.
    The first mismatch seen in $e$ is present in $f$, and all earlier letters inspected for continuation coincide;
    hence their first mismatches coincide too. In either case $\| e \| = q + B_(upright("tail")) = \| f \|$,
    proving the prefix-code assertion. The same argument, and locality of all bounded searches, prove the final claim. ◻
]

=== 4.4 Independent suffix choices have one end <independent-suffix-choices-have-one-end>

Fix a stability radius satisfying

#[#set math.equation(numbering: n => "(4.1)")
 $ 0 lt.eq w_E < d_bullet \, wide K_bullet - w_E > d_bullet^2 . $ <eq:end-overlap>]

We say that $eta$ is #emph[stable within $w_E$ at $t$] if $eta \( t + v \) =
  eta \( t \)$ for every integer $\| v \| lt.eq w_E$.

#thm([Lemma 4.6.])[
  (Shared anchor and exact suffix consumption).  #emph[Let a word begin with a complete episode $e$ at $s$,
    with origin $t$, anchor $q$, and end $b_0 = q + B_(upright("tail"))$.
    Let $s < k < b_0$ be a cut, and let $\[ k \, b \)$ be any proposed suffix factor of that word;
    its endpoint $b$ may be before or after $b_0$. Let $cal(T)$ be a finite nonempty set of candidate origins such that
$ t in cal(T) \, wide "diam" cal(T) lt.eq w_E . $

 Assume that every candidate’s end-search inspections and seed block lie inside both $\[ s \, b_0 \)$ and
   $\[ k \, b \)$. Suppose the proposed suffix requires]
  + #emph[equality of $eta \( tau \)$ for all $tau in cal(T)$;]
  + #emph[the exact end rule of Definition 11 at any one reference $tau_0 in cal(T)$, with anchor $b -
    B_(upright("tail"))$.]
  #emph[Then $b = b_0$, and the reference anchor is $q$. Moreover,
    if $eta$ is stable within $w_E$ at $t$ and all the candidate data are visible in the actual suffix
    $\[ k \, b_0 \)$, these two requirements hold for that suffix and every choice of reference.]
] <lem:shared-anchor>

#proof[
  All bounded tests in the two factors inspect the same ambient letters.
    By locality they obtain the same results, including for false candidate origins.
    If the common value of $eta$ is a marker position, it is also $eta \( t \) = q$,
    so the exact end requirement gives $b = q + B_(upright("tail"))$.
  Suppose instead that every value is $tack.t$. The seed starts $x_tau =
    z_bullet \( tau \)$ have diameter at most $w_E$. By Equation (4.1) and Lemma 9,
    all seeds have one common two-sided extension $pi$. The word agrees with $pi$ throughout their union
  $ \[ x_min \, x_max + K_bullet \) \, wide x_min = min_(tau in cal(T)) x_tau \, quad x_max =
    max_(tau in cal(T)) x_tau . $
  Thus the true first mismatch $q$, which occurs after the true seed, cannot lie inside any later seed.
    It follows that $q gt.eq x_max + K_bullet$. There is no mismatch between the end of any seed and $q$:
    before $x_max + K_bullet$ this follows from the seed union,
    and afterwards it follows from the true first-mismatch rule.
    Hence every candidate seed has exactly the same first subsequent mismatch $q$.
  For completeness this argument also excludes incorrectly truncated or extended proposed suffixes.
    Put $q' = b - B_(upright("tail"))$. If $q' < q$, the proposed mismatch letter at $q'$ is present in both
    factors and contradicts the continuation just proved. If $q' > q$,
    the proposed continuation reaches the visible mismatch at $q$ and fails there.
    A suffix lacking any required bounded inspection or its claimed mismatch letter cannot pass the requirements
    in the first place. Therefore $q' = q$ and $b = b_0$.
  Finally, stability and $t in cal(T)$ imply equality of $eta$ on $cal(T)$.
    The same seed-union argument shows that the actual suffix satisfies the exact end rule for every reference. ◻
]

Figure 1 shows the markerless part of this argument: all seed blocks lie in one common periodic word,
  and the first mismatch occurs after their union. This is what makes the endpoint independent of the chosen
  reference seed.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.69, 1.16), (4.14, 1.45), fill: rgb("#ebebeb"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.38, 0.58), (4.83, 0.87), fill: rgb("#ebebeb"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.07, 0), (5.52, 0.29), fill: rgb("#ebebeb"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.5175, 1.305), [seed 1], anchor: "east", padding: 0.1176cm)
  content((0.5175, 0.725), [seed 2], anchor: "east", padding: 0.1176cm)
  content((0.5175, 0.145), [seed 3], anchor: "east", padding: 0.1176cm)
  line((0.69, -0.116), (0.69, -0.87), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.52, -0.116), (5.52, -0.87), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.69, -0.58), (7.59, -0.58), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((7.762, -0.58), (8.28, -0.58), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.105, -0.58), [seed union agrees with $pi$], anchor: "south", padding: 0.1176cm)
  content((6.555, -0.58), [continuation], anchor: "north", padding: 0.1176cm)
  line((7.507, -0.6554), (7.673, -0.5046), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.507, -0.5046), (7.673, -0.6554), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.59, -0.435), [$q$], anchor: "south", padding: 0.1176cm)
  content((7.659, -0.899), [first mismatch], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Different seed ends initiate the same first-mismatch test. The overlapping seed union already agrees with the common repetition, so no scan can stop inside a later seed. ],
) <fig:common-seeds>

For an outer layer with full cut-offset set $cal(H)_i$, a suffix beginning at $k$ uses

$ cal(T) = { k - h : h in cal(H)_i } . $

If the prefix chooses an actual cut $k = t + h_0$ with $h_0 in cal(H)_i$,
  the true origin belongs to this set regardless of the suffix’s independent role or tag.
  Its diameter is $"diam" cal(H)_i$. Thus the end guard in Lemma 13 establishes exact consumption before any
  agreement of tags is used. Likewise an aligned stencil $cal(P)_i$ gives candidate origins $k + L_0 - p'$;
  at a true cut $k = s + p$ these are $t + p - p'$. Their diameter is $"diam" cal(P)_i$.

#thm([Lemma 4.7.])[
  (End selection after bounded decoding).  #emph[Let $e \, k \, \[ k \, b \) \, t \, q$ be as in Lemma 13,
    and let $cal(T)$ be any finite candidate set containing $t$, with no diameter restriction.
    Suppose its candidates are tested by bounded predicates which do not use an anchor,
    all their inspection intervals lie inside both the actual episode and the proposed suffix,
    and the true origin passes its predicate. If exactly one candidate passes, it is the true origin.
    Applying the exact end rule at that decoded origin, with its search and seed data also present in both
    factors, forces the proposed suffix to end at $q + B_(upright("tail"))$ without any stability assumption.]
] <lem:decoded-end>

#proof[
  The bounded predicates have the same values on their common letters,
    so the passing true candidate cannot disappear in the proposed suffix. Uniqueness therefore identifies it.
    Apply Lemma 13 with the singleton reference set ${ t }$; its equality condition is automatic. ◻
]

The last aligned stage will use Lemma 14. Its current witness is a bounded end-marker test independent of $q$,
  so decoding precedes the end rule. At the other stages one reference end rule is applied first.
  In either order, subsequent controls at translated origins keep that same $q$ fixed.
  They do not apply additional first-mismatch searches.

=== 4.5 The finite margin interface <the-finite-margin-interface>

The end guards require every bounded inspection to lie inside the true episode,
  even when the suffix proposes a wrong origin or a wrong end.
  This requirement can be met after all finite schedules have been chosen.
  We state the margin calculation here; Proposition 22 will supply the complete inventory of inspections for the
  actual splits.

Take the union of the bounded inspection intervals under every allowed cut, metadata choice, and candidate origin.
  Include the neighborhoods needed to decide markers and the intervals swept out in Lemma 10.
  Let $I_(-) lt.eq 0 lt.eq I_(+)$ bound the inner-marker and trial data and all outer cuts relative to $t$,
  and let $E_(-) \, E_(+)$ bound the end-marker inspections and seed blocks relative to $z_bullet \( t \)$.
  These are finite bounds. The continuation to the selected first mismatch is governed separately by the exact end
  rule; products ending there and residues involving $q$ do not enlarge this bounded inventory.

Let $A$ bound the offsets from $s$ of the buffers before $t$. Sufficient final margin inequalities are

#[#set math.equation(numbering: n => "(4.2)")
 $ L_0 + I_(-) & > A \,\
o_bullet + min { E_(-) \, - d_bullet } & > I_(+) \,\
B_(upright("tail")) & > E_(+) + d_bullet \, wide B_(upright("tail")) gt.eq 1 . $ <eq:geometry-margins>]

The first inequality puts all inner data after the early buffers.
  The second puts the end controls and every possible anchor after the inner data and the outer cuts included in
  that inventory. Since $q gt.eq z_bullet \( t \) - d_bullet$,
  the last inequality puts every end control strictly before even the earliest complete end $z_bullet \( t \) -
  d_bullet + B_(upright("tail"))$. Thus all bounded controls are internal to every true complete episode.

Internal visibility does not by itself put data on the correct side of a cut.
  Each split must also place its prefix computations before its cut and its suffix computations after it.
  Any supplied left context must be declared as finite metadata and verified by the prefix.
  The schedules in Proposition 22 will meet these reading-side conditions.

Every test argument must itself contain every position it is required to inspect on its reading side.
  An unavailable candidate or translate causes rejection; it is never omitted from a universal guard or uniqueness
  test. Requested product intervals must likewise have available, correctly ordered endpoints.
  This applies to a standalone suffix with false metadata and to a proposed endpoint different from the true
  episode end. The margin inequalities give availability for the true suffix;
  the rejection rule ensures that every accepted suffix sees the same bounded control values used in Lemmas 13 and 14.

The remaining obligation is to fix this finite inventory independently of $L_0 \, o_bullet \,
  B_(upright("tail"))$. Proposition 22 does so before choosing those three lengths in the order displayed above.

== 5 Two outer splits and five residual witnesses <sec:outer>

We first transmit the finite computation through prediction trials whose boundaries are selected by markers.
  When a required boundary is absent, a second split uses a long periodic interval to keep the prefix metadata
  constant while varying the clock residue. Each construction defines a total affine update before describing its
  successful cuts. The episodes where neither construction supplies every input with a cut will have one of five
  explicit witnesses.

The schedules in this section have fixed finite lengths and offsets for the chosen monoid and alphabet.
  We state every separation and visibility condition when it is used.
  Proposition 22 constructs all of them in one consistent order;
  until then they are the explicit hypotheses of the two split constructions.

Use the episode start $s$, sampling origin $t = s + L_0$, anchor $q$, and end $q +
  B_(upright("tail"))$ from Definition 11. Five later subbuffers will lie between $s$ and $t$;
  the two splits of this section make their cuts after $t$. Write $T_e = T_(s \, q + B_(upright("tail")))$.

=== 5.1 The main schedule and the common end guard <the-main-schedule-and-the-common-end-guard>

Fix the initial representation on $V$, and put $J = \| V \|^2$.
  There is a finite collection of #emph[main trials], indexed by $nu$,
  with fixed predictions $Theta_nu in M^(J + 1)$. Let

$ cal(Z) = { \( nu \, j \) : 0 lt.eq j lt.eq J + 1 } $

label their endpoints and checkpoints. For $lambda in cal(Z)$, let $o_lambda$ be its nominal offset from $t$.
  Use an inner marker system of separation $d_compose$, block length $K_compose > 3 d_compose^2$,
  and radius $r_compose gt.eq K_compose$. Define

#[#set math.equation(numbering: n => "(5.1)")
 $ z_lambda \( t \) & = t + o_lambda \,\
u_lambda \( t \) & = upright("first inner marker in ") \[ z_lambda \( t \) - H \, z_lambda \( t \) + H \] \,
  $ <eq:main-boundaries>]

with value $tack.t$ when the search is empty. Let $cal(A) \( t \)$ mean that every $u_lambda \( t \)$ is present.
  On $cal(A) \( t \)$, these are the actual ordered trial boundaries.
  For trial $nu$, its actual endpoints are $B_nu = u_(nu \, 0) \( t \)$, $C_nu = u_(nu \, J + 1) \( t \)$.
  Its block $j$ consists of cuts

#[#set math.equation(numbering: n => "(5.2)")
 $ k = t + c_(nu \, j) + a \, wide 0 lt.eq a < R_1 . $ <eq:main-cuts>]

The offsets place this entire block between boundaries $j - 1$ and $j$.
  All earlier-boundary searches, including their inspection neighborhoods, are before the block;
  all later ones are after it. Trials are disjoint and ordered.

The second layer will use cuts

#[#set math.equation(numbering: n => "(5.3)")
 $ k = z_lambda \( t \) + a \, wide 0 lt.eq a < R_2 . $ <eq:periodic-cuts>]

Let $cal(H)_1 \, cal(H)_2$ be the respective full finite sets of cut offsets from $t$ in (5.2) and (5.3).
  Choose the end-stability radius with

$ "diam" cal(H)_1 \, "diam" cal(H)_2 < w_E < d_bullet \, wide K_bullet - w_E > d_bullet^2 . $

Every suffix test in outer layer $r in { 1 \, 2 }$ uses the following guard, independently of its tag.
  At its beginning $k$, form #emph[all] origins

$ k - h \, wide h in cal(H)_r . $

Require their values of $eta$ to be equal, and require exact consumption to the episode end obtained from one
  fixed reference origin in this set. Let $q$ be that reference anchor.
  All bounded guard data must be present in the suffix argument.

If paired with an actual prefix cut, the true $t$ belongs to this list.
  Lemma 13 forces the reference anchor to be the true $q$, even if the proposed suffix initially extends beyond
  the first episode or ends prematurely. Thus it consumes exactly the first episode.
  In particular the clock integers supplied on the two sides,

$ k - t \, wide q - k \, $

always have common total

#[#set math.equation(numbering: n => "(5.4)")
 $ ell = q - t . $ <eq:clock-total>]

For availability, it suffices that $eta$ is stable under every shift of magnitude at most $w_E$,
  since this covers every reference origin relative to the actual one.

=== 5.2 The main affine update <the-main-affine-update>

Apply Lemma 7 to tags

$ alpha = \( nu \, j \, X \, Y \) \, wide X \, Y in V . $

Write the resulting clock as $n_1 \, I_alpha^(\( 1 \)) \, J_alpha^(\( 1 \)) \, W_1$,
  and let $cal(G)_1 \( ell \)$ be its graph of possible tag pairs. Take $R_1 = n_1$.

Define $F_(1 \, e) : V arrow.r V$ for every episode, without referring to any split.

+ If $cal(G)_1 \( ell \)$ is contained in the diagonal and $cal(A) \( t \)$ holds,
  process letters normally except that each main trial has the ideal deterministic shift of Lemma 6 added at its end.
+ If $cal(G)_1 \( ell \)$ is contained in the diagonal and $cal(A) \( t \)$ fails, use $v mapsto v T_e$.
+ If $cal(G)_1 \( ell \)$ has its unique off-diagonal edge $alpha arrow.r beta$, use
  #[#set math.equation(numbering: n => "(5.5)")
   $ F_(1 \, e) \( v \) = v T_e + Y \( beta \) - X \( alpha \) T_e . $ <eq:main-error>]

These are exhaustive cases, including the empty graph in the diagonal case.
  In every case $F_(1 \, e)$ is deterministic affine with linear part $T_e$.

Here and below a language with metadata is the finite union over #emph[its own] metadata choices.
  Prefix and suffix unions are independent. Let $P_x^(\( 1 \))$ require, for one tag $\( nu \, j \, X \, Y \)$:

+ its length is one prescribed cut in (5.2); $k - t in I_alpha^(\( 1 \))$, and $x = X$;
+ every boundary preceding the cut is present, including the boundaries of all earlier trials and through boundary
  $j - 1$ of the current trial;
+ processing from $x$ to $B_nu$, with ideal shifts on earlier trials,
  arrives at the enumerated input $x_j$ of this block;
+ the block’s predicted transfer and all its preceding individual interval conditions in Definition 5 hold.

All these data are before the cut, by placement.

Let $Q_y^(\( 1 \))$ use its own tag $\( nu \, j \, X \, Y \)$, the independent end guard, the residue check $q -
  k in J_alpha^(\( 1 \))$, and $y = Y$. For each candidate

#[#set math.equation(numbering: n => "(5.6)")
 $ k - c_(nu \, j) - a \, wide 0 lt.eq a < R_1 \, $ <eq:main-role-origins>]

perform the future-boundary searches for that role. Require every boundary from $j$ onward in the current trial,
  and every boundary in later trials, to be present at the #emph[same word position] for all these candidates.
  These searches are after $k$ for every fixed role, whether the role is true or false.
  Use their common positions to check the suffix-product condition from boundary $j$ to $C_nu$.
  From the block’s enumerated output $y_j$ at $C_nu$, compute onward with ideal shifts in later trials and require
  final result $y$.

Define $S_1 subset.eq E$ by the following conditions on actual episode data:

#[#set math.equation(numbering: n => "(5.7)")
 $ eta \( t \) upright(" is stable within ") w_E \, wide ell in.not W_1 \, wide cal(A) \( t \) \,\
u_lambda \( t \) upright(" is stable within ") R_1 upright(" for every ") lambda \, wide
  upright("some main trial is perfectly predicted") . $ <eq:S1>]

Stability means equality of the returned position or of the absent value for every integer shift of either sign up
  to the indicated bound.

#thm([Lemma 5.1.])[
  (Main split).  #emph[The languages $P_x^(\( 1 \)) \, Q_y^(\( 1 \))$ satisfy Lemma 3 on $D = E$,
    with updates $F_(1 \, e)$ and skipped class $E \\ S_1$.]
] <lem:main-split>

#proof[
  Take an arbitrary accepted prefix/suffix pair at a genuine episode boundary.
    The end guard gives exact consumption and the common total $ell$.
    If $cal(G)_1 \( ell \)$ is diagonal, the tags match. The actual $t$ then appears among (5.6).
    The prefix establishes all earlier boundaries and the suffix establishes all later boundaries,
    so $cal(A) \( t \)$ holds. Their joint checks give an ideally eligible pair of the actual current trial.
    Lemma 6, together with the ideal computations before and after that trial, gives $F_(1 \, e) \( x \) = y$.
  If tags differ, the clock graph consists of that unique off-diagonal edge.
    The input and output checks fix $x = X \( alpha \)$, $y = Y \( beta \)$, so (5.5) fits the transfer.
    The calculations performed under possibly false roles introduce no competing input or output.
    These cases prove soundness for every independent pair of witnesses.
  For $e in S_1$ and input $x$, select a perfect trial and its block for the vector actually arriving there and
    its trial output. Choose the tag $X = x$, $Y = F_(1 \, e) \( x \)$.
    Since $ell in.not W_1$, this diagonal tag pair is available at some first residue.
    Its $n_1$ consecutive cut choices realize every such residue.
    Every role-origin differs from the true one by less than $R_1$,
    so future-boundary stability makes all suffix comparisons pass.
    End stability makes the independent guard pass. All required data are present, giving the desired split. ◻
]

The first split is sound on every episode, but its availability needs all main boundaries and a perfect
  prediction. We next handle an episode with a sufficiently long markerless boundary window.
  Its short-period run will supply many cuts with identical prefix products and local contexts;
  only the second clock residue changes.

=== 5.3 The periodic-window affine update <the-periodic-window-affine-update>

To compute $F_1$ on skipped sequences, use its homogeneous lift $hat(F)_(1 \, e)$ on

$ U_0 = V xor upright(bold(F))_2 . $

Take a second clock with modulus $n_2$, bad set $W_2$, and tags

#[#set math.equation(numbering: n => "(5.8)")
 $ alpha = \( lambda \, X \, Y \, m \, r \, xi \) \, wide {lambda in cal(Z) \, quad X \, Y in U_0 \,\
m in M \, quad r in bb(Z) \/ n_1 \,\
xi in Sigma^(2 r_compose) . $ <eq:second-tags>]

These fields propose the boundary label, episode input/output, product $T_(s \, k)$, residue $k - t med mod med
  n_1$, and immediate left context of the cut. There is no field for the cut index or $n_2$.

Let $cal(G)_2 \( ell \)$ be its graph. On every episode define $F_(2 \, e)$ to be $hat(F)_(1 \, e)$ in the
  diagonal case; in the unique off-diagonal case $alpha arrow.r beta$, define

#[#set math.equation(numbering: n => "(5.9)")
 $ F_(2 \, e) \( v \) = v hat(F)_(1 \, e) + Y \( beta \) - X \( alpha \) hat(F)_(1 \, e) . $ <eq:second-error>]

This is deterministic affine with linear part $hat(F)_(1 \, e)$.

The prefix language $P_x^(\( 2 \))$ chooses its own tag and requires:

+ a cut in (5.3) for its label, $k - t in I_alpha^(\( 2 \))$, and $x = X$;
+ the proposed product $m = T_(s \, k)$, first-clock residue $r$, and context $xi$ are correct;
+ there is no inner marker in
  $ \[ z_lambda \( t \) - H \, k - r_compose \] . $

The marker decisions use only prefix data, since their radius is $r_compose$.

The suffix language $Q_y^(\( 2 \))$ uses its own tag, the second layer’s independent end guard, $q -
  k in J_alpha^(\( 2 \))$, and $y = Y$. Adjoin the proposed $xi$ immediately before its argument for the following
  local test: require no inner marker in

#[#set math.equation(numbering: n => "(5.10)")
 $ \[ k - r_compose \, k + H + R_2 \] . $ <eq:periodic-suffix-window>]

Exactly $2 r_compose$ preceding letters suffice for the earliest radius $r_compose$ decision.
  All other required letters must be in the suffix.

Use the proposed $m$ and the actual suffix product to obtain a proposed $T_e$.
  Use $r + \( q - k \) med mod med n_1$ as the proposed first-clock total.
  Under the hypothesis $not cal(A) \( t \)$, these two data determine $F_1$:
  it is the linear action in the diagonal first-clock case and (5.5) in the off-diagonal case. Require

$ y = X hat(F)_(1 \, e) $

as evaluated by precisely this rule. The suffix need not decode $t$.

Put $N_M = \| M \| !$, and require

#[#set math.equation(numbering: n => "(5.11)")
 $ R_2 = n_2 n_1 N_M d_compose \, wide H - d_compose > 2 r_compose + \| M \| d_compose + R_2 \,\
upright("every prime factor of ") n_2 upright(" exceeds ") d_compose \, N_M \, n_1 . $ <eq:periodic-parameters>]

Within $E \\ S_1$, let $S_2$ be the episodes with

#[#set math.equation(numbering: n => "(5.12)")
 $ eta \( t \) upright(" stable within ") w_E \, wide ell in.not W_2 \,\
upright("for some ") lambda \, quad \[ z_lambda \( t \) - H \, z_lambda \( t \) + H + 2 R_2 \]
  upright(" has no inner marker") . $ <eq:S2>]

#thm([Lemma 5.2.])[
  (Periodic-window split).  #emph[The second pair of languages satisfies Lemma 3 on $D = E \\ S_1$,
    with updates $F_(2 \, e)$ and skipped class
$ D_0 = E \\ \( S_1 union S_2 \) . $

]
] <lem:periodic-split>

#proof[
  Again the independent guard gives exact consumption and total $ell$.
    For matching tags, their product, residue and context are actual.
    Since $k = z_lambda \( t \) + a$, $0 lt.eq a < R_2$, the prefix absence interval and (5.10) cover the full
    actual search $\[ z_lambda \( t \) - H \, z_lambda \( t \) + H \]$.
    Thus this boundary is absent and $not cal(A) \( t \)$ is proved by the successful split.
    The suffix has consequently evaluated $hat(F)_(1 \, e)$ correctly.
    In the diagonal second-clock case its output is $F_(2 \, e) \( x \)$.
    Mismatched tags fit the unique input/output pair in (5.9).
    This proves soundness without assuming correctness of unmatched context.
  For availability, let $e in S_2$, with the indicated center $z$.
    The marker property gives short-period $K_compose$-blocks at all starts from $z - H + d_compose$ through $z +
    H - d_compose$. Lemma 9 makes these one periodic run of some period $d < d_compose$.
    The second inequality of (5.11) places all needed contexts and at least $\|
    M \|$ whole periods immediately before $z$ within this run.
  For any $c in M$, two of $c^0 \, dots.h \, c^(\| M \|)$ agree.
    Multiplying onward gives an eventual period at most $\| M \|$, starting before $\| M \|$,
    and that period divides $N_M$. In particular
  $ c^(r + N_M) = c^r wide \( r gt.eq \| M \| \) . $
  Consider cuts
  #[#set math.equation(numbering: n => "(5.13)")
   $ k_a = z + a thin d N_M n_1 \, wide 0 lt.eq a < n_2 . $ <eq:special-cuts>]
  They have $0 lt.eq k_a - z < R_2$, identical $2 r_compose$-letter contexts, and a fixed residue modulo $n_1$.
    Take the period word in phase at $z$, with product $c = T_(z \, z + d)$, and put $A = T_(s \, z - \| M \| d)$. Then
  $ T_(s \, k_a) = A c^(\| M \| + a N_M n_1) = A c^(\| M \|) . $
  Thus the prefix-product field $m$ is fixed. Although the suffix product can vary with $a$,
    it always satisfies $m T_(k_a \, q + B_(upright("tail"))) = T_e$;
    the recovered first-clock total is likewise always $q - t$.
    For input $x$, one correct tag in (5.8), with $X = x$ and $Y = x hat(F)_(1 \, e)$,
    is therefore valid at all these cuts. The prime-factor requirement gives $gcd \( d N_M n_1 \, n_2 \) = 1$.
    The cuts realize every residue modulo $n_2$, so one realizes this diagonal tag pair since $ell in.not W_2$.
    Both absence tests lie in the markerless interval from (5.12):
    their rightmost endpoint is less than $z + H + 2 R_2$, and their leftmost positions are covered by the same
    margin. The stable end guard passes. This gives a split for every input. ◻
]

We have two total updates and two availability sets. The remaining task is to describe failure of both
  availability conditions using a fixed number of predicates.
  These predicates will locate the true cut in the aligned constructions of Section 6.

=== 5.4 The five witnesses <the-five-witnesses>

We use the following predicates $A_i \( t \, q \)$ on episode data, and also at formally translated sampling origins:

#[#set math.equation(numbering: n => "(5.14)")
 $ i & A_i \( t \, q \)\
0 & q - t in W_1 \, o r cal(A) \( t \) a n d n o m a i n t r i a l i s p e r f e c t l y p r e d i c t e d a t t h
  e s e b o u n d a r i e s \;\
1 & s o m e u_lambda \( t \) c h a n g e s u n d e r a s h i f t o f m a g n i t u d e a t m o s t R_1 \;\
2 & q - t in W_2 \;\
3 & s o m e \[ z_lambda \( t \) - H \, z_lambda \( t \) + H \] i s m a r k e r l e s s \,
  b u t a n i n n e r m a r k e r l i e s a m o n g t h e n e x t 2 R_2 p o s i t i o n s t o i t s r i g h t \;\
4 & eta \( t \) c h a n g e s u n d e r a s h i f t o f m a g n i t u d e a t m o s t w_E . $ <eq:witnesses>]

In particular $A_4$ does not use $q$. Membership in a clock bad set always uses the corresponding modulus.

At a translated origin, these are #emph[formal predicates on the given data], with $q$ fixed.
  They do not assert that the origin completes another episode, and do not run another first-break scan.
  All marker decisions and products they request will be internal to the available data.

#thm([Lemma 5.3.])[
  (Residual coverage).  #emph[Every episode of $D_0$ satisfies at least one of $A_0 \, dots.h \, A_4$.]
] <lem:witness-coverage>

#proof[
  Suppose $A_4$ fails. If $cal(A) \( t \)$ holds and both $A_0 \, A_1$ fail, all conditions of $S_1$ hold.
    If $cal(A) \( t \)$ fails, choose a missing boundary. Failure of $A_2 \,
    A_3$ gives a good second-clock total and an empty window extended by $2 R_2$ at that boundary,
    hence $S_2$ unless the episode was already in $S_1$. Thus an episode in neither designation has a witness. ◻
]

== 6 Aligned splits for the residual witnesses <sec:aligned>

The two outer splits leave the task of computing $F_2$ on $D_0^(*)$.
  Every episode in $D_0$ has one of the five witnesses from Lemma 17. We eliminate them in order.
  At stage $i$, the current computation is a map $g_(i \, e) : U_i arrow.r U_i$, with $g_(0 \, e) =
  F_(2 \, e)$ and $U_0 = V xor upright(bold(F))_2$. We construct a new affine update $g_(i + 1 \, e)$ on a larger
  vector space. Two splits compute this new update while removing the current witness;
  its linear part then recovers $g_(i \, e)$, by a basis encoding described below.
  The new update is the same for both splits and is defined on every complete episode.

The witnesses serve to decode the cut position. A suffix tests every candidate origin,
  excludes later witnesses there, and requires a unique candidate with the current witness.
  After decoding, the first split uses a perfectly predicted trial.
  On the remaining domain, a second split uses a full decision tree to recover a prefix product from one of its
  measurements. The secondary guard must exclude later witnesses on a larger set of translates:
  this will ensure that the actual history has no perfectly predicted trial.
  Proposition 22 supplies the finite schedules and ambiguity bounds used here.

=== 6.1 Stencils, domains, and the induction invariant <stencils-domains-and-the-induction-invariant>

For $i = 0 \, dots.h \, 4$, place a nonempty finite stencil $cal(P)_i$ of cut offsets from $s$ in its own
  subbuffer. The buffers occur in the reverse order $4 \, 3 \, 2 \, 1 \, 0$, after $s$ and before $t$,
  and the $i$-th ends at $a_i$. Thus $a_(i + 1)$ is before the entire stage-$i$ buffer whenever $i < 4$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10.79, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -0.085), (0, 0.085), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.1411), [#text(size: 9pt)[$s$]], anchor: "north", padding: 0.1176cm)
  line((5.81, -0.085), (5.81, 0.085), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.81, -0.1411), [#text(size: 9pt)[$t$]], anchor: "north", padding: 0.1176cm)
  line((9.13, -0.085), (9.13, 0.085), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.13, -0.1411), [#text(size: 9pt)[$q$]], anchor: "north", padding: 0.1176cm)
  line((10.38, -0.085), (10.38, 0.085), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.38, -0.1411), [#text(size: 9pt)[${q+B_( upright(t) "ail")}$]], anchor: "north", padding: 0.1176cm)
  rect((0.332, 0.34), (1.162, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.747, 0.5737), [#text(size: 9pt)[$i=4$]])
  line((1.162, 0.085), (1.162, 0.2975), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.162, 0.867), [#text(size: 7pt)[$a_4$]], anchor: "south", padding: 0.1176cm)
  rect((1.369, 0.34), (2.2, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.784, 0.5737), [#text(size: 9pt)[$i=3$]])
  line((2.2, 0.085), (2.2, 0.2975), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.2, 0.867), [#text(size: 7pt)[$a_3$]], anchor: "south", padding: 0.1176cm)
  rect((2.407, 0.34), (3.237, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.822, 0.5737), [#text(size: 9pt)[$i=2$]])
  line((3.237, 0.085), (3.237, 0.2975), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.237, 0.867), [#text(size: 7pt)[$a_2$]], anchor: "south", padding: 0.1176cm)
  rect((3.445, 0.34), (4.274, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.86, 0.5737), [#text(size: 9pt)[$i=1$]])
  line((4.274, 0.085), (4.274, 0.2975), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.274, 0.867), [#text(size: 7pt)[$a_1$]], anchor: "south", padding: 0.1176cm)
  rect((4.482, 0.34), (5.312, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.897, 0.5737), [#text(size: 9pt)[$i=0$]])
  line((5.312, 0.085), (5.312, 0.2975), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.312, 0.867), [#text(size: 7pt)[$a_0$]], anchor: "south", padding: 0.1176cm)
  line((6.059, 0.8925), (8.549, 0.8925), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.304, 1.139), [#text(size: 9pt)[outer trials#linebreak()and windows]], anchor: "south", padding: 0.1176cm)
  rect((6.059, 0.34), (8.549, 0.8075), fill: rgb("#f2f2f2"), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.798, 0.34), (9.13, 0.34), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((9.462, 0.85), [#text(size: 7pt)[end rule#linebreak()and padding]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: The aligned buffers occur in reverse stage order. For $i < 4$, the stage-$i$ buffer and the entire suffix beginning at $a_i$ lie after $a_(i + 1)$. Their data are therefore on the reading side of a suffix starting at $a_(i + 1)$. The drawing is schematic; the end-marker lag and padding are chosen after every bounded inspection range. ],
) <fig:reverse-buffers>

Write

#[#set math.equation(numbering: n => "(6.1)")
 $ Delta_i = cal(P)_i - cal(P)_i \, wide Gamma_i = sum_(j < i) \( Delta_j + Delta_j \) \, wide Gamma_0 =
   { 0 } . $ <eq:gamma>]

Every $Delta_i \, Gamma_i$ contains zero, and $Gamma_(i + 1) = Gamma_i + Delta_i + Delta_i$.
  For any finite set $Gamma$, define

$ A_h^Gamma \( t \, q \) quad arrow.l.r.double quad upright("there is ") gamma in Gamma upright(" with ")
  A_h \( t + gamma \, q \) . $

The anchor $q$ remains fixed. The entry domain $D_i subset.eq D_0$ has the promise

#[#set math.equation(numbering: n => "(6.2)")
 $ or.big_(h gt.eq i) A_h^(Gamma_i) \( t \, q \) . $ <eq:entry-promise>]

For $i = 0$, this is Lemma 17; the two full sets defined below will give the induction step.
  Graph tests at stage $i$ concern $g_i$ on $D_i^(*)$, although every $g_(i \, e)$ is defined on all complete episodes.

The quantitative hypothesis is

#[#set math.equation(numbering: n => "(6.3)")
 $ \# { \( p \, p' \) in cal(P)_i^2 : p eq.not p' \, med A_i^(Gamma_i) \( t + p - p' \, q \) } lt.eq
   C_i . $ <eq:ambiguity-bound>]

Every required kind of cut has more than $C_i$ copies in $cal(P)_i$.
  Also $h_i = "diam" cal(P)_i < w_E$ for $i < 4$. All witness controls at every candidate and every required
  translate are after the cut and inside the true first episode.
  A suffix must itself contain their full reading intervals to pass.

The reverse order of the buffers has a computational purpose.
  From $a_(i + 1)$, the whole stage-$i$ buffer and the suffix starting at $a_i$ are still unread.
  This lets a suffix formula for $g_i$ be incorporated into a suffix formula for $g_(i + 1)$, as shown next.

=== 6.2 Total tables and the new affine update <total-tables-and-the-new-affine-update>

The suffix beginning at $a_i$ does not know the product $T_(s \, a_i)$ of the omitted prefix.
  We therefore keep a table for every possible value of that product.
  For fixed suffix letters and fixed $t \, q$, the table is a finite formula

$ Phi_i \( m \) : U_i arrow.r U_i wide \( m in M \) $

with

#[#set math.equation(numbering: n => "(6.4)")
 $ Phi_i \( T_(s \, a_i) \) = g_(i \, e) . $ <eq:table-property>]

It is defined for every $m$, including values that no prefix realizes.
  It may use the indicated suffix, bounded marker data, $M$-products, and fixed $t \, q$.
  Evaluating this table is a finite calculation on one episode;
  it is not a query to a graph language for a sequence of episodes.
  We prove the existence of these tables inductively below.

To carry this table through another pair of splits, encode a payload $v in U_i$ and a work-register value $m in
  M$ as a single basis vector. Set

$ U_(i + 1) = upright(bold(F))_2^(thin U_i times M) $

with basis $\[ v \, m \]$. A letter product $d in M$ acts linearly by $\[ v \, m \] rho \( d \) = \[ v \, m d \]$.
  At the end of the stage-$i$ buffer, replace the remaining computation by the terminal linear map $H_i$ defined by

#[#set math.equation(numbering: n => "(6.5)")
 $ \[ v \, m \] H_i = \[ Phi_i \( m \) \( v \) \, 1_M \] . $ <eq:late-map>]

This is a linear extension from the displayed basis assignment;
  it does not require $Phi_i \( m \)$ to be linear on $U_i$.
  The unshifted episode computation consists of $rho \( T_(s \, a_i) \)$ followed by $H_i$.
  No letter action follows $H_i$, which already represents the entire remaining suffix. In particular,

$ \[ v \, 1_M \] rho \( T_(s \, a_i) \)
  H_i = \[ Phi_i \( T_(s \, a_i) \) \( v \) \, 1_M \] = \[ g_(i \, e) \( v \) \, 1_M \] . $

Resetting the work register to $1_M$ makes the output suitable as the input to the next episode.
  If $L_e = rho \( T_(s \, a_i) \) H_i$, then for two episodes $e \, f$,

$ \[ v \, 1_M \] L_e L_f = \[ g_(i \, f) \( g_(i \, e) \( v \) \) \, 1_M \] . $

Thus products of these linear maps recover the composed $g_i$ update.
  Our new affine update will have precisely $L_e$ as its linear part.

In the first part of the stage-$i$ buffer, take a full decision tree with $b$ measurements along each path.
  A node has its own fixed position $u$ and branches on $T_(s \, u) in M$,
  with a separate subtree or leaf for every value. Ancestors precede descendants;
  all nodes can be ordered topologically. The resulting leaf history depends only on the letters,
  not on the input vector.

After all these measurements, place aligned prediction trials with fixed endpoints, checkpoints, and blocks,
  using the representation $rho$. Put

$ J' = \| U_(i + 1) \|^2 \, wide R = \| M \|^(J' + 1) \, wide b > R . $

For every ordered list of $R$ distinct leaf histories, allocate a trial whose predictions across those histories
  exhaust $M^(J' + 1)$. Give arbitrary predictions to its other histories,
  and include a spare trial with arbitrary predictions. Every history has a prediction on every trial,
  including histories that cannot occur on an actual prefix.
  Only predictions depend on history; physical trial intervals do not.

Define $g_(i + 1 \, e)$ by the unshifted computation above,
  adding the ideal shift of Lemma 6 at each stage-$i$ trial end, using the actual leaf history.
  These are its only shifts. Before $a_i$, any buffers of other stages contribute only their letter actions $rho$;
  their shifts and terminal maps are not applied there. The shifts are constants determined by the episode,
  so they do not change its linear part. This is why the two splits can compute $g_(i + 1)$ and then recover $g_i$
  by Lemma 4 and the basis-state calculation above.

#thm([Lemma 6.1.])[
  (Total suffix tables).  #emph[The tables $Phi_i$ exist for $0 lt.eq i lt.eq 4$.
    Every $g_(i + 1 \, e)$ just defined is deterministic affine,
    independent of split success and domain restrictions. Its linear part $L_(i + 1 \, e)$ satisfies
#[#set math.equation(numbering: n => "(6.6)")
 $ \[ v \, 1_M \] L_(i + 1 \, e) = \[ g_(i \, e) \( v \) \, 1_M \] . $ <eq:basis-recovery>]

 The state spaces, tree sizes, and aligned trial counts depend only on the preceding state sizes and $M$,
   not on the length or complexity of a table formula.]
] <lem:total-tables>

#proof[
  For $i = 0$, all main boundaries and trials are after $a_0$.
    Their marker decisions and actual interval products are suffix data,
    and both clock graphs depend on fixed $q - t$. Replace each required $T_(s \, z)$ by $m T_(a_0 \, z)$.
    The explicit rules of Section 5 then compute $F_1$, its homogeneous lift, and $F_2$ for every $m$,
    agreeing with $F_2$ at the actual prefix product. This gives $Phi_0$.
  For $i < 4$, put $a = a_(i + 1)$ and $b = a_i$. Every stage-$i$ measurement and trial lies after $a$.
    A hypothetical product $m$ assigns $m T_(a \, u)$ to the measurement at $u$,
    selecting a leaf $h \( m \)$ in the full tree. Let $C_nu$ be the stage-$i$ trial ends,
    and compute their ideal shifts $beta_nu \( h \( m \) \)$ from that leaf’s predictions and the actual interval
    products. For every $x in U_(i + 1)$, set
  #[#set math.equation(numbering: n => "(6.7)")
   $ Phi_(i + 1) \( m \) \( x \) =
     (x rho \( m T_(a \, b) \) + sum_nu beta_nu \( h \( m \) \) rho \( T_(C_nu \, b) \)) H_i .
     $ <eq:total-table-formula>]
  The first term transports the input to $b$; each summand transports one trial shift from its insertion point to
    $b$. Each shift is added once to the whole vector, and the terminal map is then applied linearly.
    The result is affine in $x$.
  Every basis value encountered by $H_i$ has a defined image because $Phi_i$ is total on $M$.
    Hence this formula is defined even for an infeasible hypothetical $m$ or an arbitrary sum of basis vectors.
    At $m = T_(s \, a)$, it is exactly $g_(i + 1 \, e)$. A hypothetical $m$ changes the work evolution and
    selected history; it changes neither the actual suffix interval products nor $t \, q$.
    This proves the next table property.
  For fixed word data, the letter actions and terminal map are linear and all inserted shifts are independent of
    the input. Removing the shifts therefore gives the linear part $rho \( T_(s \, a_i) \) H_i$, proving (6.6).
    All schedules and basis sets are finite functions of the already specified state sizes and $M$;
    formula complexity changes none of them. ◻
]

The update and its total suffix table are now fixed independently of successful splits.
  We next define the primary and secondary full sets: they determine where each split must be available,
  and never redefine the update that both splits compute.

=== 6.3 Copies and full sets <copies-and-full-sets>

There are two sorts of stencil kinds.

+ A #emph[trial kind] specifies an aligned trial, its block, and a leaf history. Its copies lie inside that block.
+ A #emph[measurement kind] specifies a tree node and an input payload $x in U_(i + 1)$.
  Its copies lie before that node’s measurement and after all its ancestor measurements.

Every offset is distinct, so recovering an offset recovers all its metadata.

Inside $D_i$, define the primary full set $cal(F)_i$ by

#[#set math.equation(numbering: n => "(6.8)")
 $ upright("the true history has a perfect aligned trial") \, wide
   not A_h^(Gamma_i + Delta_i) \( t \, q \) quad \( h > i \) . $ <eq:primary-full>]

Put $D'_i = D_i \\ cal(F)_i$. Inside $D'_i$, define the secondary full set $cal(O)_i$ by

#[#set math.equation(numbering: n => "(6.9)")
 $ not A_h^(Gamma_i + Delta_i + Delta_i) \( t \, q \) quad \( h > i \) \, $ <eq:secondary-full>]

and put $D_(i + 1) = D'_i \\ cal(O)_i$. Every episode left in $D_(i + 1)$ has a later witness expanded by
  $Gamma_(i + 1)$, proving the next entry promise. At $i = 4$, the secondary condition is empty, so $D_5 = diameter$.

Both splits at this stage transmit the #emph[same] $g_(i + 1 \, e)$ from Lemma 18.
  These full sets and residual restrictions do not redefine it.

=== 6.4 An exact suffix decoder <an-exact-suffix-decoder>

At a cut $k = s + p$, the suffix lists all possibilities

#[#set math.equation(numbering: n => "(6.10)")
 $ tau_(p') = k + L_0 - p' \, wide p' in cal(P)_i . $ <eq:time-candidates>]

In a primary test, it requires absence of every later $A_h^(Gamma_i)$ at every candidate.
  In a secondary test, this guard is strengthened to absence of every later $A_h^(Gamma_i + Delta_i)$.

For $i < 4$, do the $q$-free last-type checks first and require equality of $eta$ across all candidates.
  Apply the exact end rule at one reference candidate, as in Lemma 13, and use its $q$.
  Then perform the other required later-type checks. Finally require a unique $p' in
  cal(P)_i$ such that $A_i^(Gamma_i) \( tau_(p') \, q \)$.

At $i = 4$, there is no later guard. Use the uniqueness test for $A_4^(Gamma_4)$, which is $q$-free,
  and only after decoding apply the exact end rule at the decoded origin.
  Both uniqueness tests range over all of $cal(P)_i$. After decoding, require metadata of the appropriate kind.
  Every bounded control is mandatory; an argument missing any required window rejects.

#thm([Lemma 6.2.])[
  (Time decoder).  #emph[Paired with a genuine stencil prefix in the promised domain $D_i$,
    a successful primary or secondary decoder returns the actual offset and consumes exactly the first episode.
    On its respective full set, all later guards pass at every stencil cut,
    and at most $C_i$ offsets fail uniqueness. Thus every required kind has a successfully decoded copy.]
] <lem:time-decoder>

#proof[
  For an actual cut $p$, the candidate $p' = p$ is the true $t$; the others are $t + p - p'$.
  For $i < 4$, the explicit equality/end guard and $h_i < w_E$ give the true $q$,
    independently of any decoded metadata. The true complete episode contains every bounded control,
    and the proposed suffix must contain those same controls.
    Thus even a prematurely or excessively long proposed suffix sees the same control values.
    The later guard eliminates every later witness at the true origin.
    Since $Gamma_i subset.eq Gamma_i + Delta_i$, this holds for either guard.
    The entry promise forces the true current witness to pass.
    Uniqueness therefore selects precisely the actual $p$, and the shared anchor already gives exact consumption.
  For $i = 4$, the entry promise itself makes the true candidate pass the $q$-free test.
    Internal visibility of all controls prevents any choice of proposed length or two-sided extension from hiding
    it. Uniqueness first recovers the true time; applying its end rule then forces exact consumption.
    This argument uses no anchor to prove the uniqueness assertion.
  For availability of the primary guard, a candidate differs from $t$ by an element of $Delta_i$,
    and (6.8) excludes every corresponding later $Gamma_i$-translate.
    For the secondary guard, (6.9) excludes the further $Delta_i$-expanded tests at every candidate.
    When $i < 4$, both full conditions include absence of $A_4 \( t \)$, since all expansion sets contain zero.
    This is stability for #emph[every] shift of magnitude at most $w_E$, so the equality/end guard is available.
  The true candidate now passes at each stencil cut. If actual offset $p$ is ambiguous,
    some $p' eq.not p$ satisfies the condition counted in (6.3).
    Choosing one such $p'$ for each ambiguous $p$ injects ambiguous offsets into the counted pairs.
    At most $C_i$ offsets are lost in the whole stencil, so more than $C_i$ copies of each kind leave a decodable
    copy of that kind. ◻
]

For the secondary split one further consequence is crucial.
  On $D'_i$, a successful guard includes absence of every later $A_h^(Gamma_i + Delta_i) \( t \, q \)$ at the true
  candidate. If the true history had a perfect trial, the episode would satisfy (6.8),
  contradicting membership in $D'_i$. Thus the true history has no perfect trial.
  The same conclusion holds on the secondary full set by (6.9). The extra expansion is necessary here:
  membership in $D'_i$ alone allows an episode with a perfect true-history trial whose primary full condition
  fails because of a later witness. Without the strengthened guard,
  the secondary test could discard the actual measurement value.

The decoder has separated time recovery from state recovery.
  Any accepted pair now knows the actual copy and its metadata.
  On each full set, the whole-stencil count guarantees a copy of every required kind.
  We use these facts first for a trial and then for a tree measurement.

=== 6.5 Primary transmission <primary-transmission>

The primary $P_x$ requires a trial-copy length $p$. It checks its metadata history against the actual
  measurements, processes from $x$ to the current trial start, and verifies the enumerated arrival vector,
  predicted transfer, and preceding individual interval products of that block.
  The whole tree and all earlier trials are on its side.

The primary $Q_y$ applies the primary time decoder. Using the decoded history, trial and block,
  it checks the suffix-product condition and computes from the enumerated trial-end output through all later stage
  trials and the terminal map, requiring result $y$. Whole other trial shifts are evaluated by ideal eligibility.
  In particular, the late map is evaluated on its stored basis work values;
  the suffix does not need to learn a separate actual prefix product at the cut.

For an accepted pair, Lemma 19 identifies exactly the same metadata on both sides.
  The trial conditions give ideal eligibility, and Lemma 6 proves $g_(i + 1 \, e) \( x \) = y$.
  For a primary full episode, choose a perfect true-history trial and its eligible block for the actually arriving
  vector. There is a decodable copy of that history/trial/block kind, giving a split for every input vector.

=== 6.6 Secondary transmission and bad histories <secondary-transmission-and-bad-histories>

#thm([Lemma 6.3.])[
  (Bad histories).  #emph[Fix one episode and the actual product tuples on all its aligned trial intervals.
    Fewer than $R$ leaf histories have no perfectly predicted trial, including infeasible histories.
    Along the true path, fewer than $R$ nodes have a wrong proposed measurement value whose suffix continuation
    yields such a history.]
] <lem:bad-histories>

#proof[
  Let $cal(B)$ be the set of #emph[all] leaf histories whose prediction differs from the actual tuple on every
    trial. If $R$ distinct leaves belonged to $cal(B)$, their allocated common trial would assign all $R$ possible
    tuples across those leaves. One assignment equals that trial’s actual tuple, a contradiction.
    Thus $\| cal(B) \| < R$.
  At a true-path node with measurement $u$, a wrong proposed value $d$ chooses a different branch.
    Continue at any later measurement $u'$ using $d T_(u \, u')$.
    This selects a well-defined leaf in the off-path subtree, whether or not the whole history is feasible.
    Departures at two different nodes of the true path lie in disjoint subtrees, so their leaves differ.
    Selecting one wrong surviving value at each ambiguous node injects those nodes into $cal(B)$, proving the bound. ◻
]

The secondary $P_x$ requires a measurement-copy length, verifies that its node lies on the true path by checking
  ancestor measurements, and requires payload $x$.

The secondary $Q_y$ applies the strengthened time decoder and obtains the node, its ancestor-path metadata,
  and payload. At the node’s measurement position $u$, try every $d in M$.
  Follow its branch and every later branch using $d T_(u \, u')$,
  and retain exactly the values whose resulting history has no perfectly predicted trial.
  Require a unique retained value.

On an accepted pair in $D'_i$, the true history has no perfect trial by the strengthened-guard consequence above.
  Its actual value $T_(s \, u)$ therefore survives, and uniqueness identifies it.
  This datum suffices to compute the full update on every payload, not only on a single basis vector. Indeed, if

$ x = sum_(v \, m) c_(v \, m) \[ v \, m \] \, $

then before $u$ there have been no shifts in $g_(i + 1 \, e)$, and the vector there is

#[#set math.equation(numbering: n => "(6.11)")
 $ x rho \( T_(s \, u) \) = sum_(v \, m) c_(v \, m) \[ v \, m T_(s \, u) \] . $ <eq:secondary-payload>]

The suffix knows all subsequent letters and trials, and all their ideal shifts from the recovered history.
  It simulates to $a_i$, applies the total terminal map termwise, and requires result $y$.
  Each affine shift is added once to this entire vector, after the linear work action;
  it is not added separately to each basis summand. The final map $H_i$ is applied once by linearity,
  and no letter action follows it. No inverse in $M$ is used.

For availability on a secondary full episode, the true history survives.
  Lemma 20 and $b > R$ provide a true-path node at which no wrong value survives.
  For any input payload, a decodable copy of its node and payload kind exists.
  All continuation checks are after that cut, so this copy gives an accepted split.

=== 6.7 The recursive conclusion <the-recursive-conclusion>

#thm([Lemma 6.4.])[
  (Aligned stage).  #emph[Assume the entry promise, the table and placement properties, and (6.3),
    with more than $C_i$ copies per kind. Exact graph tests for $g_(i + 1)$ on $D_(i + 1)^(*)$ yield graph tests
    for $g_i$ on $D_i^(*)$ by two uses of Lemma 3 and finite Boolean operations.
    All required hypotheses hold at the next residual stage, and $D_5 = diameter$.]
] <lem:aligned-stage>

#proof[
  The secondary split first gives graph tests for $g_(i + 1)$ on $\( D'_i \)^(*)$.
    The primary split uses these as skips and gives its graph tests on $D_i^(*)$.
    Both splits act on $U_(i + 1)$ with the same deterministic affine update $g_(i + 1)$.
    By Lemma 4 these determine the product of its episode linear parts.
    Equation (6.6) shows that starting from $\[ v \, 1_M \]$,
    this product ends at $\[ g_(i \, w) \( v \) \, 1_M \]$. Thus finite basis-state queries recover the required
    graph tests for $g_i$.
  The domain promise and empty terminal domain follow from the definitions of the full sets,
    and the next total table follows from Lemma 18. Starting with identity graph tests on the empty $D_5$ domain,
    the five stages consequently produce graph tests for $g_0 = F_2$ on $D_0^(*)$. ◻
]

== 7 Choosing the parameters <sec:parameters>

The preceding splits require two properties of their finite schedules.
  For each aligned stage, the number of ambiguous cut offsets must be smaller than the number of copies of every
  cut kind. At the same time, every prefix and suffix test must see its prescribed data,
  including the bounded controls at all false candidate origins.
  We now choose the schedules so that both properties hold.

The number of cut kinds and the positions of their copies play different roles.
  Enlarging the stage-0 roster creates more main trials and tags,
  but the clock obstruction bound grows only logarithmically with the tag count.
  This lets us fix the number of copies first. Their integer positions remain free until the clocks and marker
  windows have fixed the required main-trial width. The order of choices below makes this separation explicit.

Throughout this section $q$ is the anchor of the true episode.
  Evaluating $A_j \( t + delta \, q \)$ keeps that anchor fixed; it never starts a new episode-end search at $t +
  delta$. This convention is needed both for the clock estimates and for finite final padding.

#thm([Proposition 7.1.])[
  #emph[For every fixed nonempty finite alphabet, finite monoid $M$, and finite representation space $V$,
    all parameters in the two outer splits and the five aligned stages can be chosen to satisfy their stated
    hypotheses. More precisely, the stencils are nonempty, have more than $C_i$ copies of each required kind,
    and satisfy
$ \# { \( p \, p' \) in cal(P)_i^2 : p eq.not p' \, med A_i^(Gamma_i) \( t + p - p' \, q \) } lt.eq
  C_i wide \( 0 lt.eq i lt.eq 4 \) $

 on every complete episode. Write $N_i = \| cal(P)_i \|$. In order,
   these bounds concern first-clock or prediction failure, inner-search instability, second-clock failure,
   a right-margin marker, and end-search instability. The constants can be taken to be
#[#set math.equation(numbering: n => "(7.1)")
 $ C_0 & = K + c_(upright("cl")) log \( 2 m_1 \) \,\
C_1 & = 10 \| cal(Z) \| N_0^4 \( 2 R_1 + 3 \) \,\
C_2 & = N_0^4 N_1^4 c_(upright("cl")) log \( 2 m_2 \) \,\
C_3 & = 10 \| cal(Z) \| \( 2 R_2 + 3 \) product_(j < 3) N_j^4 \,\
C_4 & = 10 \( 2 w_E + 3 \) product_(j < 4) N_j^4 . $ <eq:parameter-c0>]

 Here $K = \| M \|^(\| V \|^2 + 1)$, $m_1 \, m_2$ are the respective full tag alphabet sizes,
   and $c_(upright("cl"))$ is the absolute constant of Lemma 7; logarithms are natural.
   Also, $"diam" cal(P)_i < w_E$ for $i < 4$. All measurements, trials,
   and inspections have the chronological and reading-side access required in Lemmas 15, 16, and 21.
   Every bounded control, including every control at a false candidate origin, lies inside the true first episode.
   The same choices satisfy the end margins of Section 4.]
] <prop:parameters>

#proof[
  Write $kappa_i$ for the number of cut kinds at stage $i$, and use $mu_i$ copies of each kind, so that $N_i =
    kappa_i mu_i$. We will choose the finite objects in the following order and verify each estimate as its inputs
    become fixed.
  + Fix the spaces $U_i$, full trees, aligned trial identities, and prediction assignments.
    These determine the numbers $kappa_i$ before any clock or position is chosen.
  + Choose the stage-0 copy count $mu_0$ and its abstract roster.
    This fixes the main-trial identities and predictions, the first tag count $m_1$, and $cal(Z)$.
    Choose the first clock and $R_1$, retaining its prescribed roster residues but leaving the integer stage-0
    positions open.
  + Choose the stage-1 count and numerical stencil. Then choose the inner marker separation $d_compose$,
    block length $K_compose$, and inspection radius $r_compose$.
  + Fix the second tag alphabet, choose the stage-2 count, and construct the second clock and numerical stencil.
    Then fix the periodic-window width $R_2$.
  + Choose the stage-3 count and numerical stencil. Then choose the inner search halfwidth $H$ and a common
    main-trial template large enough for all the prescribed inspections.
  + Place the stage-0 stencil with its reserved residues and with differences separated by more than this template
    length. Place the main trials; this determines the outer cut sets.
  + Choose the end-stability radius $w_E$, then the stage-4 count and numerical stencil,
    and finally the end marker parameters $d_bullet \, K_bullet \, r_bullet$.
  + Translate the aligned arrangements into reverse stage order.
    Choose $L_0$, then $o_bullet$, then $B_(upright("tail"))$ to put every bounded inspection inside the true episode.
  At steps 3–5 the stage-0 positions, and hence the numerical sets $Gamma_1 \, Gamma_2 \, Gamma_3$,
    are not yet fixed. Their cardinalities are already bounded in terms of the chosen roster sizes.
    The clock and marker estimates are uniform in the translated origin and in the nominal search centers,
    so these cardinality bounds suffice until the actual positions are selected.
    The only copy count that enters its own obstruction bound is $mu_0$;
    its logarithmic dependence will be resolved explicitly below.
  === Finite kinds before numerical parameters <finite-kinds-before-numerical-parameters>
  Put $m = \| M \|$. The sets
  $ U_0 = V xor upright(bold(F))_2 \, wide U_(i + 1) = upright(bold(F))_2^(thin U_i times M)
    quad \( 0 lt.eq i lt.eq 4 \) $
  are fixed now; in particular $\| U_(i + 1) \| = 2^(m \| U_i \|)$. At stage $i$, set
  $ J_i^(upright("al")) = \| U_(i + 1) \|^2 \, wide K_i^(upright("al")) = m^(J_i^(upright("al")) + 1) \, wide
    b_i = K_i^(upright("al")) + 1 . $
  Use the full rooted $m$-ary tree with $b_i$ measurements along each root-to-leaf path. It has
  $ e_i = sum_(j = 0)^(b_i - 1) m^j quad upright("measurement nodes") \, wide ell_i = m^(b_i) quad upright("leaves") . $
  These formulas also apply when $m = 1$. For integers $a \, r gt.eq 0$, write $\( a \)_r =
    a \( a - 1 \) dots.h.c \( a - r + 1 \)$ when $r lt.eq a$, and $\( a \)_r = 0$ when $r > a$.
    Allocate one aligned trial for each ordered list of $K_i^(upright("al"))$ distinct leaves,
    and one spare trial. There are $tau_i = 1 + \( ell_i \)_(K_i^(upright("al")))$ trials.
    On a listed trial, assign the $K_i^(upright("al"))$ possible product tuples bijectively to its listed leaves;
    assign arbitrary tuples to all other leaves. The spare trial has arbitrary predictions.
    Thus every history, including every infeasible history, has a prediction on every trial,
    as required in Lemmas 18 and 20.
  There is one measurement kind for each node and payload in $U_(i + 1)$, and one trial kind for each trial,
    block, and leaf. Hence the number of kinds introduced above is
  #[#set math.equation(numbering: n => "(7.2)")
   $ kappa_i = e_i \| U_(i + 1) \| + tau_i J_i^(upright("al")) ell_i . $ <eq:parameter-kinds>]
  None of these sets or counts involves a clock, a marker radius, a main-trial identity, or a numerical position.
    In the terminal map $\[ v \, a \] mapsto \[ Phi_i \( a \) \( v \) \, 1_M \]$, the argument set $U_i times
    M$ and the output basis set are already fixed. A later, more complicated formula for the total table $Phi_i$
    therefore does not introduce new kinds or enlarge the spaces.
    The formulas in Lemma 18 evaluate every hypothetical product; they do not add a prefix-feasibility field to a kind.
  We fix an ordering of these kinds and their eventual copies compatible with the following finite event order.
    First order the tree nodes topologically, so that each ancestor precedes its descendants.
    Place all copies for a node before that node’s measurement,
    and place that measurement before the copies for every subsequent node.
    After all measurements, place the aligned trials in order,
    with their blocks in order and all copies for a block between its neighboring boundaries.
    Checkpoints and trial starts and ends are interposed in the indicated order.
    The extra ordering between unrelated nodes is harmless. In particular,
    every measurement copy sees its ancestor measurements before the cut and its own and descendant measurements
    after the cut; every aligned trial follows the entire tree.
  === Separated differences with prescribed residues <separated-differences-with-prescribed-residues>
  We shall repeatedly use the following elementary construction.
    Given a finite ordered roster, a modulus $n gt.eq 1$, an assigned residue for every roster slot,
    and an integer $S gt.eq 1$, there are increasing integer positions for the slots with those residues such that
    all nonzero ordered differences are distinct and are separated from each other and from zero by more than $S$.
    Any fixed finite number of interposed events can also be accommodated in each prescribed gap.
  Here is a direct induction. Suppose the already chosen positions are $x_1 < dots.h.c < x_a$,
    with all their positive differences separated by more than $S$, and each positive difference greater than $S$.
    Their largest positive difference is $D = x_a - x_1$, taking $D = 0$ when $a = 1$.
    Choose $x_(a + 1)$ in its prescribed residue class so large that
  $ x_(a + 1) - x_a > D + S \, $
  and also so that the gap has room for every event to be inserted there.
    The new positive differences all exceed $D + S$. The difference of two of them is an old point gap,
    and is greater than $S$. They are consequently separated from one another and from all old differences.
    Their negatives have the same property, and the positive and negative differences are separated through zero.
    The first gap can be chosen greater than $S$, initiating the induction.
    Arbitrarily large representatives of every residue class exist, so no residue restricts this choice.
    Events are then placed at distinct integer positions inside the reserved gaps.
    Extra room before the first and after the last cut accommodates any exterior trial boundaries.
  We shall choose each stencil together with its interposed events in this way. Denote its diameter by $h_i$.
    A subsequent translation of the entire stage changes none of its differences or internal chronology.
    In particular, if before translation its residues are $v_p$, then afterwards they are $v_p +
    c$ for one constant $c$; all differences $v_(p') - v_p$ used by the clock remain unchanged.
  For every such stencil, $\| Delta_i \| lt.eq N_i^2$ and $\| Delta_i + Delta_i \| lt.eq N_i^4$.
    The cardinality of a sumset is at most the product of the cardinalities of its summands, whence
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| Gamma_i \| lt.eq product_(j < i) N_j^4 \, wide Gamma_i subset.eq
     [- 2 sum_(j < i) h_j \, thin 2 sum_(j < i) h_j] . $ <eq:parameter-gamma-size>]
  All these sets contain zero. The second formula is a bound on the absolute values of their elements,
    not a bound by the same number on their diameters.
  === Stage 0: the number of copies and the first clock <stage-0-the-number-of-copies-and-the-first-clock>
  Put $J = \| V \|^2$ and $K = m^(J + 1)$. Initially regard $cal(P)_0$ as an indexed roster,
    without numerical positions. With $N_0 = kappa_0 mu_0$, it has $Q =
    N_0 \( N_0 - 1 \)$ ordered pairs of distinct slots. For every ordered list of $K$ distinct such pairs,
    allocate a group of $K$ main trials, whose predictions exhaust $M^(J + 1)$. Include one spare main trial.
    Thus the number of main trials is
  $ T_1 = 1 + K \( Q \)_K lt.eq 1 + K N_0^(2 K) . $
  The full first tag alphabet consists of trial, block, and two vectors in $V$. Consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ m_1 = J \| V \|^2 T_1 = J^2 T_1 lt.eq J^2 \( 1 + K N_0^(2 K) \) \,
     wide \| cal(Z) \| = \( J + 2 \) T_1 . $ <eq:parameter-main-tags>]
  No position or clock modulus occurs in this count.
  For completeness, the simultaneous requirement $mu_0 > K +
    c_(upright("cl")) log \( 2 m_1 \)$ has the following explicit solution.
    Define constants, independently of $mu_0$, by
  $ A = K + c_(upright("cl")) log #scale(x: 120%, y: 120%)[\(] 2 J^2 \( 1 + K kappa_0^(2 K) \)
    #scale(x: 120%, y: 120%)[\)] \, wide B = 2 c_(upright("cl")) K . $
  Choose an integer
  #[#set math.equation(numbering: n => "(7.5)")
   $ mu_0 > max { 1 \, 2 A \, 4 B^2 } . $ <eq:parameter-copy0>]
  For $mu_0 gt.eq 1$, Equation (7.4) gives
  $ K + c_(upright("cl")) log \( 2 m_1 \) lt.eq A + B log mu_0 lt.eq A + B sqrt(mu_0) < mu_0 . $
  We used $log x lt.eq sqrt(x)$ for $x gt.eq 1$, which follows, for example, by minimizing $sqrt(x) - log x$;
    its minimum is $2 - log 4 > 0$. This proves the desired strict inequality without a fixed-point assumption
    about the clock size.
  Fix this roster, tag alphabet, prediction schedule, and $cal(Z)$.
    Apply Lemma 7 with this roster and prime threshold $1$, obtaining $n_1 \, W_1$ and roster residues.
    Set $R_1 = n_1$. Reserve the prescribed residues for the stage-0 positions.
    Their actual integer values will be chosen only after the common main-trial template length is known.
  === Stage 1 and the inner marker system <stage-1-and-the-inner-marker-system>
  Choose $mu_1 = floor.l C_1 floor.r + 1$, with $C_1$ as in Equation (7.1); all its inputs are now fixed.
    Construct the stage-1 stencil and event order with separated differences, using modulus $1$, and record $h_1$.
    Choose integers
  #[#set math.equation(numbering: n => "(7.6)")
   $ d_compose > 10 \( 2 h_1 + 2 R_1 + 5 \) \, wide K_compose > 3 d_compose^2 \, $ <eq:parameter-inner-marker>]
  and obtain the inner marker rule from Lemma 8, with an integer inspection radius $r_compose gt.eq K_compose$.
  To prove the stage-1 count, fix $gamma in Gamma_1$ and a boundary label $lambda$.
    As the nonzero difference $delta = p - p'$ varies, the center $t + gamma + o_lambda +
    delta$ lies in an interval of diameter $2 h_1$. If the first-marker search changes under some shift of
    absolute value at most $R_1$, a marker lies within $R_1$ of one of the two original search endpoints.
    For either endpoint, the swept interval has diameter $2 h_1 + 2 R_1 < d_compose$,
    so contains at most one marker. Such a marker accounts for at most $2 R_1 + 1$ integer values of $delta$.
    This is also the endpoint-crossing estimate of Lemma 10; it does not depend on the as yet unchosen halfwidth
    $H$. Distinct nonzero differences identify distinct ordered pairs.
    Summing over the two endpoints, $gamma$, and $lambda$ gives
  $ \# { \( p \, p' \) : p eq.not p' \, med A_1^(Gamma_1) \( t + p - p' \, q \) } lt.eq
    2 \( 2 R_1 + 1 \) \| cal(Z) \| N_0^4 < C_1 . $
  The choice of nominal boundary positions will not affect this count.
  === Stage 2 and the second clock <stage-2-and-the-second-clock>
  The full second tag alphabet is now fixed. Its fields have sizes $\| cal(Z) \|$, $\| U_0 \|$, $\| U_0 \|$, $m$,
    $n_1$, and $\| Sigma \|^(2 r_compose)$, respectively. We take the whole Cartesian product,
    including tags that no particular word realizes. Therefore
  #[#set math.equation(numbering: n => "(7.7)")
   $ m_2 = \| cal(Z) \| thin \| U_0 \|^2 m n_1 \| Sigma \|^(2 r_compose) . $ <eq:parameter-second-tags>]
  Neither the second modulus nor the cut index in a periodic window is a field.
    Choose $mu_2 = floor.l C_2 floor.r + 1$, and apply Lemma 7 to the resulting stage-2 roster,
    with threshold $max { n_1 \, N_M \, d_compose }$, where $N_M = m !$.
    This gives $n_2 \, W_2$ and the stage-2 roster residues. Construct its numerical stencil with these residues
    and separated differences, and record $h_2$. Set
  #[#set math.equation(numbering: n => "(7.8)")
   $ R_2 = n_2 n_1 N_M d_compose . $ <eq:parameter-r2>]
  For a fixed $gamma in Gamma_2$, the stage-2 predicate on an ordered pair is exactly
  $ q - t - gamma + p' - p in W_2 . $
  Here $q - t - gamma$ is fixed while the pair varies. The roster bound therefore gives at most $c_(upright("cl"))
    log \( 2 m_2 \)$ pairs for this $gamma$. Equation (7.3) proves the bound $C_2$.
    The clock estimate is uniform in the translate $q - t - gamma$; only $\| Gamma_2 \|$,
    not its eventual numerical values, enters this bound.
  Every prime factor of $n_2$ exceeds $n_1 \, N_M \, d_compose$. For each $1 lt.eq d < d_compose$, it follows that
  $ gcd \( n_2 \, d N_M n_1 \) = 1 . $
  Thus the cuts with displacements $a d N_M n_1$, $0 lt.eq a < n_2$, run through every second-clock residue.
    Each displacement is less than $R_2$, as required by Lemma 16.
  === Stage 3 and the inner search halfwidth <stage-3-and-the-inner-search-halfwidth>
  Choose $mu_3 = floor.l C_3 floor.r + 1$, construct the stage-3 stencil with separated differences,
    and record $h_3$. Choose an integer
  #[#set math.equation(numbering: n => "(7.9)")
   $ H > 10 #scale(x: 120%, y: 120%)[\(] h_3 + R_2 + r_compose + d_compose \( 1 + m \) +
     1 #scale(x: 120%, y: 120%)[\)] . $ <eq:parameter-h>]
  Fix $gamma in Gamma_3$ and $lambda$. The relevant centers lie in an interval of diameter $2 h_3$.
    Apply Lemma 10(ii) with $D = 2 h_3$, $L = H$, and $h = 2 R_2$. Equation (7.9) gives $D < 2 L + 2$.
    At most $2 R_2$ centers have the required empty search and right-margin marker.
    Distinct ordered differences identify distinct ordered pairs, and a union bound gives
  $ \# { \( p \, p' \) : p eq.not p' \, med A_3^(Gamma_3) \( t + p - p' \, q \) } lt.eq
    2 R_2 \| cal(Z) \| product_(j < 3) N_j^4 < C_3 . $
  This argument is independent of the nominal positions of the boundaries.
    Equation (7.9) also implies the separate periodic-window requirement
  #[#set math.equation(numbering: n => "(7.10)")
   $ H - d_compose > 2 r_compose + m d_compose + R_2 . $ <eq:parameter-periodic-margin>]
  Indeed, subtracting the right side from the left and using Equation (7.9) leaves a positive quantity.
    Together with $K_compose > 3 d_compose^2$, this supplies both the overlapping short-period blocks and all the
    context and stabilized-power margins used in Lemma 16.
  At this point the first three numerical stencils, both clocks, the inner marker radius,
    and the periodic-window width have all been fixed. The only postponed early choice is the numerical stage-0
    stencil. We can now place it with gaps exceeding the complete main-trial template while preserving the
    first-clock residues chosen earlier.
  === The main template and the postponed stage-0 positions <the-main-template-and-the-postponed-stage-0-positions>
  Choose an even integer
  $ G > 10 \( H + r_compose + R_1 + R_2 + 1 \) \, wide T = \( J + 3 \) G . $
  The common template is the interval of length $T$. Boundary $i$, $0 lt.eq i lt.eq J + 1$,
    has center $\( i + 1 \) G$ relative to its start; block $j$, $1 lt.eq j lt.eq J$, begins at $j G +
    G \/ 2$ and has the $R_1$ consecutive cut positions prescribed in Section 5.
    All boundary inspection windows, and all periodic-window cuts and their inspection neighborhoods,
    fit strictly inside the template. For a block cut, its preceding boundary’s entire inspection window lies to
    the left, and the next boundary’s entire inspection window lies to the right.
    The same holds for the future searches under every origin $k - c_(nu \, j) - a$, $0 lt.eq a < R_1$:
    relative to $k$ the nearest future center is $G \/ 2 - a$, which exceeds $H + r_compose$.
    The nearest preceding center for the actual prefix is $- G \/ 2 - a$,
    whose whole inspection window precedes the cut. Earlier and later trial windows have still larger separations.
    The periodic suffix’s absence test uses starts from $k - r_compose$ onward,
    so a marker inspection needs no letter earlier than $k - 2 r_compose$.
    This is exactly the context length included in its tag.
  We may now choose the numerical positions of the stage-0 roster,
    with its previously prescribed first-clock residues. Use the separated-difference induction with spacing $S =
    T$, reserving all aligned events in their required order. Record $h_0$.
    For each allocated group, let $delta_a = p_a - p'_a$, $1 lt.eq a lt.eq K$,
    be the differences of its listed pairs. Give its trial $a$ the template start
  #[#set math.equation(numbering: n => "(7.11)")
   $ b_(upright("group")) - delta_a $ <eq:parameter-translated-template>]
  relative to $t$, retaining the prediction already assigned to that abstract trial.
    The differences are distinct and separated by more than $T$, so the templates within a group are disjoint.
    Bases for distinct groups can be chosen explicitly. Put the spare trial at offset $T$,
    enumerate the groups by $g = 1 \, dots.h \, \( Q \)_K$, and take
  $ b_g = T + g \( 2 h_0 + 2 T \) + h_0 . $
  Every group lies between offsets $T + g \( 2 h_0 + 2 T \)$ and $T + g \( 2 h_0 + 2 T \) + 2 h_0 + T$.
    These intervals are positive, mutually separated, and disjoint from the spare template.
    Sort all trials by physical position for the processing rules.
    Sorting changes neither their identities nor their assigned predictions.
    It now determines all $o_lambda \, c_(nu \, j) \, cal(H)_1 \, cal(H)_2$.
  It remains to justify $C_0$. Its first-clock part contributes at most $c_(upright("cl")) log \( 2 m_1 \)$, since
  $ q - \( t + p - p' \) = q - t + p' - p $
  and the first-clock roster differences have been preserved.
    Suppose that the prediction-failure part held for $K$ distinct ordered pairs.
    Take their ordered list and its allocated group. At origin $t + delta_a$,
    the indicated trial has physical template start
  $ \( t + delta_a \) + \( b_(upright("group")) - delta_a \) = t + b_(upright("group")) . $
  All these $K$ trials therefore have identical physical boundary search centers.
    The predicate under consideration includes $cal(A) \( t + delta_a \)$, so all their boundaries exist.
    Locality and translation equivariance of the marker rule give the same actual boundary positions,
    hence the same actual tuple of $J + 1$ interval products, for all $K$ trials.
    Their predictions exhaust all possible tuples; one must be perfect.
    This contradicts the assumed absence of any perfectly predicted main trial at its origin.
    There are thus at most $K - 1$ prediction-failure pairs, and the total is strictly less than $C_0$.
    If the roster has fewer than $K$ ordered pairs, that last assertion already follows from its size.
    The internal visibility needed for this argument, including all translated templates, is established below.
  === Stage 4 and the end marker system <stage-4-and-the-end-marker-system>
  Choose an integer
  #[#set math.equation(numbering: n => "(7.12)")
   $ w_E > 1 + max {"diam" cal(H)_1 \, "diam" cal(H)_2 \, 2 \( h_0 + h_1 + h_2 + h_3 \)} . $ <eq:parameter-we>]
  In particular $h_i < w_E$ for $i < 4$. Choose $mu_4 = floor.l C_4 floor.r + 1$,
    construct its stencil with separated differences, and record $h_4$. Choose integers
  #[#set math.equation(numbering: n => "(7.13)")
   $ d_bullet > 10 \( 2 h_4 + 2 w_E + 5 \) \, wide K_bullet > 3 d_bullet^2 \, $ <eq:parameter-end-marker>]
  and obtain its marker rule and radius $r_bullet gt.eq K_bullet$. These choices imply
  $ w_E < d_bullet \, wide K_bullet - w_E > d_bullet^2 \, $
  so Lemma 13 applies to each required set of unexpanded candidate origins.
    For fixed $gamma in Gamma_4$, apply the same endpoint argument as at stage 1,
    with center range of diameter $2 h_4$, stability radius $w_E$, and marker separation $d_bullet$.
    Each endpoint sweep has diameter $2 h_4 + 2 w_E < d_bullet$,
    and the number of bad nonzero differences is at most $2 \( 2 w_E + 1 \)$. Hence
  $ \# { \( p \, p' \) : p eq.not p' \, med A_4^(Gamma_4) \( t + p - p' \, q \) } lt.eq
    2 \( 2 w_E + 1 \) product_(j < 4) N_j^4 < C_4 . $
  This count is independent of the end search’s eventual lag.
  All five ambiguity bounds are now proved, and each stencil has more copies per kind than its bound.
    It remains to put the finite arrangements inside words. This last step must cover every false-origin
    inspection, not only the windows used by a correctly chosen split.
  === Final placement and visibility under every hypothesis <final-placement-and-visibility-under-every-hypothesis>
  Translate the five complete aligned arrangements, including all interposed events,
    into disjoint integer intervals strictly after $s$, in order $4 \, 3 \, 2 \, 1 \, 0$.
    End stage $i$’s interval at $a_i$, after all its events and before the next interval begins.
    Write $A_(upright("buf"))$ for a positive upper bound on all their offsets from $s$.
    These translations do not change any $h_i \, N_i$, $Delta_i \, Gamma_i$, or clock difference.
    Every stage-$i$ measurement, trial, and endpoint is after $a_(i + 1)$, for $i < 4$.
    This is the chronological hypothesis for the recursion of the total suffix tables in Lemma 18.
  We give explicit finite envelopes, so that the remaining choices do not hide a dependence on an episode length. Let
  #[#set math.equation(numbering: n => "(7.14)")
   $ D = 1 + max {"diam" cal(H)_1 \, "diam" cal(H)_2 \, 2 R_1 \, med
     2 sum_(i = 0)^4 h_i} . $ <eq:parameter-origin-envelope>]
  Every origin displacement that must be tested, before the extra stability shifts in $A_1$ and $A_4$,
    has absolute value less than $D$. To check this assertion exhaustively,
    an outer end guard uses differences in $cal(H)_j - cal(H)_j$.
    At an actual main cut, even a suffix with an unrelated trial/block role uses a candidate $k - c_(nu \, j) -
    a$ whose displacement from $t$ is in $cal(H)_1 - cal(H)_1$.
    Aligned candidates have displacements in $Delta_i$. Current-witness and primary later-witness tests use
    $Delta_i + Gamma_i$; the secondary later-witness tests use $Delta_i + Gamma_i + Delta_i$.
    Designations and the next-domain promises use subsets of these same expansions, or $Gamma_(i + 1) = Gamma_i +
    Delta_i + Delta_i$. Equation (7.3) bounds all their absolute values by $2 sum_(j lt.eq i) h_j$.
    The swept intervals used in the count proofs satisfy the same bounds even when the displacement ranges over
    every integer in $\[ - h_i \, h_i \]$. The additional shifts of $A_1$ have magnitude at most $R_1$,
    and those of $A_4$ at most $w_E$; we include them in the respective inspection envelopes below.
  Let $A_(upright("main")) gt.eq 1$ be an integer exceeding the absolute values of all main-template endpoints,
    all $o_lambda$, and all elements of $cal(H)_1 union cal(H)_2$. Set
  #[#set math.equation(numbering: n => "(7.15)")
   $ B_compose = A_(upright("main")) + D + H + 2 R_2 + R_1 + r_compose + K_compose +
     2 . $ <eq:parameter-inner-envelope>]
  All bounded inner-marker, boundary, main-trial, and periodic-window data at every origin just listed lie
    strictly between $t - B_compose$ and $t + B_compose$. This includes inspection neighborhoods of radius
    $r_compose$, the right-margin overhang $2 R_2$, the preceding periodic contexts, the short-period blocks,
    and the whole swept ranges used in the estimates. Equation (7.9) gives $H > r_compose$, so the term $H +
    r_compose$ also covers the $2 r_compose$-letter context. Actual marker-selected interval endpoints differ from
    their centers by at most $H$, so products within these bounded trials have endpoints in the same envelope. Choose
  #[#set math.equation(numbering: n => "(7.16)")
   $ L_0 > A_(upright("buf")) + B_compose + 2 . $ <eq:parameter-l0>]
  Consequently this entire envelope follows every aligned buffer.
    It is available in every aligned suffix as far as its left endpoint is concerned,
    including before time has been decoded. Its right endpoint will be put before every possible true anchor next.
  For the end controls put
  #[#set math.equation(numbering: n => "(7.17)")
   $ B_bullet = D + w_E + d_bullet + r_bullet + K_bullet + 2 . $ <eq:parameter-end-envelope>]
  Every bounded end-marker inspection and seed block required under any candidate origin or witness translate lies
    strictly between $z_bullet \( t \) - B_bullet$ and $z_bullet \( t \) + B_bullet$.
    Indeed the origin contributes at most $D$, a stability test at most $w_E$,
    a searched marker start at most $d_bullet$, and its inspection at most $r_bullet$;
    a seed extends by at most $K_bullet$. We have used a sum of these bounds to cover all cases at once. Choose
  #[#set math.equation(numbering: n => "(7.18)")
   $ o_bullet > B_compose + B_bullet + 2 \, wide B_(upright("tail")) > B_bullet + d_bullet +
     2 . $ <eq:parameter-final-margins>]
  The entire bounded end envelope now follows the inner envelope and all actual cuts.
    Even an end-rule origin among the stated hypotheses has its marker anchor,
    or the beginning of its possible first-break scan, after the earlier activities, since $B_bullet > D +
    d_bullet$. For the true episode, its anchor always satisfies $q gt.eq z_bullet \( t \) - d_bullet$. Therefore
  $ q + B_(upright("tail")) > z_bullet \( t \) + B_bullet + 2 . $
  Every bounded control is thus strictly internal to the true episode,
    even when its anchor is the earliest possible marker. In the markerless case the actual first break may occur
    arbitrarily later; this only increases the available length.
    Its mismatching letter is visible because $B_(upright("tail")) > 1$.
    In the notation of Equation (4.2), take $I_(-) = - B_compose \, I_(+) = B_compose \, E_(-) = - B_bullet \,
    E_(+) = B_bullet$ and use $A_(upright("buf"))$ for its last buffer endpoint.
    Equations (7.16) and (7.18) then imply each of those margin inequalities directly.
  In particular, the stage-4 controls do not presuppose knowing the end.
    At $k = s + p$, all their inspected letters have displacement from $z_bullet \( t \)$ at most
  $ h_4 + 2 sum_(j < 4) h_j + w_E + d_bullet + r_bullet + 1 . $
  A sufficient padding inequality just for these controls is
  #[#set math.equation(numbering: n => "(7.19)")
   $ B_(upright("tail")) > h_4 + 2 sum_(j < 4) h_j + w_E + 2 d_bullet + r_bullet + 1 \, $ <eq:parameter-stage4-padding>]
  which follows from Equations (7.14), (7.17), and (7.18). It contains no occurrence of the unbounded break
    position $q$.
  We spell out the consequences for arbitrary prefix/suffix pairings.
    Every proposed suffix must have all of its specified bounded controls on its reading side;
    an unavailable candidate is a reason to reject the suffix, not a reason to remove that candidate.
    At a cut of a true complete episode, a shorter proposed suffix either fails this availability test or reads
    exactly the true letters in all those windows. A longer one reads the same letters there,
    because all the windows precede the true first episode’s end.
    Locality of both marker rules therefore fixes the same control values in either case.
    This applies to every candidate, including the true candidate, independently of the proposed suffix length.
    For $i < 4$, the candidate-origin diameter is $h_i < w_E$;
    for the outer guards it is at most the diameter of the appropriate $cal(H)_j$.
    The equal-search and seed-overlap argument of Lemma 13 hence supplies the true anchor before any
    anchor-dependent witness is used. At stage 4 the witness is $q$-free:
    the true candidate cannot disappear from the uniqueness test,
    because its entire inspected neighborhood is already internal by Equation (7.19).
    Unique decoding therefore precedes the exact end test at that decoded origin, just as required by Lemma 19.
  Finally, the side of every noncontrol computation is determined by the event order.
    Prefixes read earlier measurements, earlier trial boundaries, and the indicated prefix products.
    Suffixes at aligned trial cuts read the later boundaries, the later trials, and the terminal table at $a_i$.
    At a measurement copy they read its measurement and every descendant measurement after the cut,
    using ancestor values only as verified metadata. The reverse stage order puts every earlier-stage event needed
    by a terminal table after the current buffer. The main-template inequalities already put all main prefix and
    suffix boundary searches on their specified sides, including all suffix role hypotheses.
    The periodic suffix uses only its stated $2 r_compose$ letters of supplied left context.
    After correct decoding, all required suffix computations thus have their prescribed access.
    For an arbitrary standalone suffix with false metadata, a needed unavailable position or ill-ordered interval
    is rejected; its evaluation never calls for an unspecified prefix factor.
    Products that extend to the true or proposed end have that end as an endpoint,
    and the total formulas $Phi_i$ use the supplied hypothetical product for their omitted prefix.
  These observations also give the finite-endpoint property used in Section 8.
    In any single test, all local inspections and all interval endpoints other than its exact end range over fixed
    finite sets of offsets from the beginning of that test; bounded offsets from its exact end are allowed as
    well. There is only the one first-break scan belonging to its selected reference or decoded end-rule origin.
    Witness translations and hypothetical table evaluations keep that scan’s $q$ fixed and introduce no additional
    search for a break. This assertion holds for false suffix metadata as well as for successful pairings.
  Later translations preserve every earlier count and residue difference.
    The final three lengths change no schedule diameter, clock, state set, or number of copies.
    Every marker count now applies to complete words because its full inspection windows are internal,
    including those at false origins. Thus the ambiguity bounds, chronological requirements,
    and end margins in the proposition all hold. ◻
]

== 8 Expressions, the final suffix, and the uniform bound <sec:compilation>

The finite constructions and their soundness are complete.
  To obtain a height bound, we must still express every component test at a controlled height over $Sigma$.
  The episode-end rule is decisive: an unbounded argument of a component test consists of a bounded prefix,
  a fixed periodic run, and a bounded tail. On each such template,
  every required finite calculation becomes ultimately periodic in the repetition count.

We first prove this compilation statement for the component languages, including suffixes with false metadata.
  We then handle the part of an input that does not complete an episode and assemble the twelve split steps.

=== 8.1 A finite-template compilation lemma <a-finite-template-compilation-lemma>

#thm([Lemma 8.1.])[
  (Periodic templates).  #emph[Fix words $a \, b \, c in Sigma^(*)$, with $b eq.not epsilon.alt$.
    If $S subset.eq bb(N)$ is ultimately periodic, then
$ { a b^j c : j in S } $

 has a generalized expression of height at most one. The same bound holds for a finite union of such languages and
   finite languages.]
  #emph[Moreover, on the template $a b^j c$, every fixed finite calculation from the following data is ultimately
    periodic as a function of $j$:]
  + #emph[letters, and their availability, at offsets in a fixed finite set from the argument start or end;]
  + #emph[geometric validity and $M$-products of intervals whose endpoints belong to such finite offset sets;]
  + #emph[the argument length, or a fixed offset from it, modulo any one of finitely many fixed moduli.]
  #emph[Finite branching among fixed endpoint choices and a fixed finite recursion of table calculations are allowed.]
] <lem:template>

#proof[
  There are integers $N gt.eq 0 \, d gt.eq 1$ such that membership in $S$ above $N$ depends only on the residue
    modulo $d$. For each accepted residue choose its least representative $r gt.eq N$.
    Its tail is expressed by $a b^r \( b^d \)^(*) c$; use singleton words for the finitely many accepted exponents
    below $N$. A fixed word means its concatenation of letters, and an empty factor means $1$.
    Each expression has height at most one, and finite union preserves this bound.
  For the last assertion, enlarge the finite endpoint sets to include every position that any branch might
    inspect. A fixed start offset eventually lies in a fixed initial segment of the repeated word;
    a fixed end offset lies in a fixed final segment. Their letters stabilize because the varying middle contains
    whole copies of the same $b$. Availability and ordering of any two endpoints also eventually stabilize.
  An interval between two start offsets, or between two end offsets, has eventually constant letters.
    An interval stretching from a start offset to an end offset has, for all sufficiently large $j$,
    a product of the form
  $ A thin T_b^(thin j - j_0) C $
  for fixed $A \, C in M$ and integer $j_0$. This follows by removing the fixed initial and final partial copies
    of $b$. The reverse ordering is eventually invalid and is handled as such.
    Powers of an element of a finite monoid are ultimately periodic,
    by repetition of two powers followed by right multiplication. Length residues are periodic.
  There are finitely many queried data values. Take a common threshold and a common multiple of all their periods.
    The entire data array is then periodic, so any fixed finite function of it is periodic.
    Branching or finite table recursion still computes such a function. This proves the assertion. ◻
]

The lemma does not make arbitrary monoid-product tests inexpensive.
  It applies only after the input has been restricted to the specified templates.

=== 8.2 Complete episodes and suffix arguments <complete-episodes-and-suffix-arguments>

#thm([Proposition 8.2.])[
  (Component expressions).  #emph[Every single-episode domain used in the construction, including $E$, $S_1 \,
    S_2 \, D_i \, D'_i$ and the full sets, has height at most one.
    Every prefix component $P_x$ has height zero and every suffix component $Q_y$ has height at most one.
    These are expressions over the original alphabet, including when a standalone suffix’s guessed metadata or
    origin is false.]
] <prop:component-cost>

#proof[
  Every $P_x$ has length in a fixed finite set of cut offsets.
    Hence it is a finite language, whatever finite test decides its members.
  For an exact-end language, take finite cases for the origin at which its end rule is applied.
    Relative to the argument start, this origin has a fixed offset in each case.
    If its end marker is present, the anchor lies in a bounded search window and the argument has bounded length.
    There are only finitely many such words.
  In the markerless case, a length-$K_bullet$ block at a fixed offset determines a short-period repetition.
    The word agrees with it from the seed end until its first mismatch $q$, and the argument ends at $q +
    B_(upright("tail"))$. Take finite cases for the prefix through the seed,
    the period word in the phase immediately after the seed, the partial period just before $q$,
    and the $B_(upright("tail"))$-letter tail beginning with the mismatch.
    The resulting words have shape $a b^j c$, with $b eq.not epsilon.alt$.
    The finite case specifies continuation, the first mismatch, and the required tail.
    Additional bounded inspections extending past the seed remain finite tests on the template;
    the finitely many small exponents cause no difficulty.
  For $E$, the origin is $t = s + L_0$. For an outer $Q$, the guard selects one fixed reference from $k -
    cal(H)_r$. At an aligned stage below 4, it selects a reference among (6.10);
    at stage 4 it first selects the decoded candidate. There are finitely many choices in each case.
    A standalone $Q$’s own end condition gives the template, without presuming that its reference is the true
    origin of any episode. In every such case its indicated $q$ is the argument end minus $B_(upright("tail"))$.
  It remains to check that the other conditions fit Lemma 23. Their possible endpoints have a finite inventory:
  + nominal main boundaries, their fixed search windows and inspection neighborhoods,
    and actual markers chosen inside those windows;
  + fixed tree measurements, aligned checkpoints, trial endpoints and buffer ends;
  + all candidate origins, all required $Delta_i \, Gamma_i$ translates, and all bounded end-marker searches at them;
  + the exact argument end, $q$, and bounded offsets from them.
  All start-side positions range over a fixed finite set, even when a branch selects which one is used.
    Marker-selected positions have finitely many possibilities because their searches are bounded.
    The only distant anchor is the already selected $q$. Translated witnesses keep it fixed and do not run new
    first-break scans.
  Prefix products passed as tags or as hypothetical table inputs are finite indices in $M$.
    For a suffix’s own candidate copy, $a_i$ has positive offset from its cut because every copy of stage $i$ lies
    before $a_i$. All buffer ends and schedules invoked recursively by $Phi_i$ are later still.
    Thus table recursion never introduces a missing arbitrary prefix word.
    It only multiplies the supplied $M$-value through actual intervals on the reading side.
    Every schedule has finitely many measurements and trials, irrespective of word length.
  The table formulas in Lemma 18 use these interval products, finite clock graphs, bounded marker values,
    and finite vector operations. They run no sequence graph test and do not redefine $q$.
    If any position required on the reading side is unavailable or an interval is ill-ordered, the suffix rejects.
    These availability and order conditions are themselves among the eventually stable data in Lemma 23.
    A false tag or infeasible hypothetical product is consequently included in the same compilation argument.
  The full-set conditions add only stability over a fixed finite range, fixed-clock membership,
    actual-history choices, and equalities of finitely many trial products.
    The residual domains are finite Boolean combinations of these conditions on $E$;
    their definitions use no split-success oracle. On each template every component condition is therefore
    ultimately periodic. Lemma 23 gives height at most one. All metadata choices are finite unions,
    and every Boolean operation is implemented over the same alphabet by union and complement. ◻
]

=== 8.3 The incomplete last part <the-incomplete-last-part>

Let $top = not 0$, and define

#[#set math.equation(numbering: n => "(8.1)")
 $ F = not \( E top \) . $ <eq:final-F>]

Thus $F$ consists of words with no complete episode prefix.

#thm([Lemma 8.3.])[
  (Final suffix).  #emph[For every $m in M$, the language
$ { f in F : T_f = m } $

 has height at most one. Every word of $Sigma^(*)$ belongs to $E^(*) F$.]
] <lem:final-suffix>

#proof[
  By Proposition 24, (8.1) has height at most one. Fix a length threshold large enough to contain all bounded
    end-decision windows and to exceed every marker-present episode length.
    Words shorter than this threshold form a finite language.
  A longer word in $F$ cannot be in the marker-present case,
    since the corresponding bounded complete episode would be its prefix.
    Thus its markerless seed fixes a periodic continuation. If the first mismatch is $q$ and at least
    $B_(upright("tail"))$ letters remain beginning there, the prefix ending at $q +
    B_(upright("tail"))$ is an episode, a contradiction. That prefix contains every bounded decision window by the
    padding conditions, so the argument does not use letters beyond the proposed complete prefix.
  Accordingly the word either has no mismatch yet, or has fewer than $B_(upright("tail"))$ letters from its first
    mismatch through its end. Take finite cases for its bounded prefix/seed, period word,
    partial-period remainder, and bounded final tail. These give finitely many templates $a b^j c$,
    covering all sufficiently long $F$-words. On each template $T_f = m$ is ultimately periodic in $j$.
    Intersect the resulting height-one product language with $F$; this gives the exact required test,
    including the bounded cases.
  Finally, remove a complete episode prefix whenever one exists.
    Episode lengths are positive, so the process terminates on a finite word.
    The remainder has no episode prefix and belongs to $F$. Thus every word factors as an $E^(*)$-word followed by
    an $F$-word. ◻
]

Every component test now has the required cost, and every input can be completed by a height-one product test on
  its final remainder. The proof therefore reduces to applying the split identity backward through the five
  aligned stages and the two outer layers.

=== 8.4 Completion and height count <completion-and-height-count>

#proof[
  Fix the DFA transition monoid and choose its faithful representation on basis vectors indexed by $M$.
    Proposition 22 supplies all finite constructions and their hypotheses.
  Start with identity graph tests on the empty residual domain $D_5$, of height zero.
    Apply Lemma 21 backward for $i = 4 \, 3 \, 2 \, 1 \, 0$. The same-update requirement makes the secondary tests
    valid skips for the primary tests, and Boolean recovery gives the preceding computation on each domain.
    We obtain graph tests for $F_2$ on $D_0^(*)$.
  Lemma 16 now gives graph tests for $F_2$ on $\( E \\ S_1 \)^(*)$.
    By Lemma 4, their linear parts give the products of the homogeneous lifts of $F_1$.
    Querying homogeneous inputs $\( v \, 1 \)$ gives $F_1$ on these skipped sequences.
    Lemma 15 then gives $F_1$ on $E^(*)$. One further Boolean linear-part recovery gives the original monoid
    action on $E^(*)$.
  By Proposition 24 and Lemma 3, each split changes a skip bound $H$ to at most $max { 2 \, H + 1 }$.
    There are exactly twelve split applications along the recursion:
  $ upright("successive computation") & upright("height bound")\
upright("empty residual graph tests") & 0\
upright("stage 4: secondary, primary") & 2 \, med 3\
upright("stage 3: secondary, primary") & 4 \, med 5\
upright("stage 2: secondary, primary") & 6 \, med 7\
upright("stage 1: secondary, primary") & 8 \, med 9\
upright("stage 0: secondary, primary") & 10 \, med 11\
upright("periodic-window split") & 12\
upright("main split") & 13 . $
  The stars within the component languages are included in this recurrence.
    All recoveries and restrictions to particular finite states are Boolean operations and add no nesting.
  Let $L_m$ be the height-at-most-thirteen test that an $E^(*)$-word has product $m$,
    obtained by querying the identity basis vector. Let $F_n$ be the height-at-most-one product test from
    Lemma 25. If $A subset.eq M$ is the set of transformations taking the DFA’s initial state to an accepting
    state, the DFA language is
  $ union.big_(m n in A) L_m F_n . $
  Every input has the required $E^(*) F$ factorization, and every accepted factorization has actual total product
    $m n$. Concatenation and finite union preserve the bound thirteen.
    Every expression is over $Sigma$, and no bound depends on the size of $Sigma$, $M$, or the DFA.
    This proves the theorem. ◻
]

#prodef([Remark 8.4.])[
  (Final query in the DFA-state representation).  For the option in Remark 2,
    take the vector space with basis $e_q$ indexed by the DFA state set $Q$.
    A transition transformation $d$ acts linearly by $e_q d = e_(q d)$.
    Its images on all basis vectors identify the transformation, hence the element of the DFA transition monoid.
    Its image on the initial-state vector alone identifies only the reached state,
    which is enough to test acceptance. For a general monoid action on $Q$,
    even all basis images may fail to identify an element of $M$ if distinct elements induce the same transformation.
  This initial representation is compatible with the construction:
    the interval predictions, product comparisons, and work registers still use $M$.
    Let $q_0$ be the initial state and let $A_Q subset.eq Q$ be the accepting states.
    The split and affine-recovery construction gives a height-at-most-thirteen language $R_(q_0 \, q)$ for those
    $E^(*)$-words sending $e_(q_0)$ to $e_q$. Keep the height-one $M$-product languages $F_n$ for the final
    suffix. Then the accepted language is
  $ union.big_(q in Q \, med n in M\
q n in A_Q) R_(q_0 \, q) F_n . $
  Thus the complete-episode part needs only the reached DFA state,
    while the final suffix still has its full monoid-product test.
]

#heading(level: 1)[References]
#bibitem([1])[Tom Bourne and Nik Ruškuc. On the star-height of subword counting languages and their relationship
  to Rees zero-matrix semigroups. #emph[Theoretical Computer Science] #strong[653] (2016), 87--96.
  #link("https://doi.org/10.1016/j.tcs.2016.09.024")[doi:10.1016/j.tcs.2016.09.024].
  #link("https://arxiv.org/abs/1603.06236v2")[Author version].]
#bibitem([2])[Nicola Cotumaccio. Data compression meets automata theory.
  #emph[Bulletin of the European Association for Theoretical Computer Science] #strong[145] (February 2025),
  42--49. #link("https://schmiste.github.io/beatcs145.pdf")[Issue hosted by the bulletin editor].]
#bibitem([3])[F.~Dejean and M.-P.~Schützenberger. On a question of Eggan.
  #emph[Information and Control] #strong[9]\(1) (1966), 23--25.]
#bibitem([4])[L.~C. Eggan. Transition graphs and the star-height of regular events.
  #emph[Michigan Mathematical Journal] #strong[10] (1963), 385--397.]
#bibitem([5])[Wolfgang Krieger. On the subsystems of topological Markov chains.
  #emph[Ergodic Theory and Dynamical Systems] #strong[2]\(2) (1982), 195--202.
  #link("https://doi.org/10.1017/S0143385700001516")[doi:10.1017/S0143385700001516].]
#bibitem([6])[Tom Meyerovitch. An embedding theorem for multidimensional subshifts.
  #emph[Ergodic Theory and Dynamical Systems] #strong[45]\(6) (2025), 1870--1914.
  #link("https://doi.org/10.1017/etds.2024.117")[doi:10.1017/etds.2024.117].
  #link("https://arxiv.org/abs/2312.05650v5")[Author version, 22 December 2024].]
#bibitem([7])[OpenAI. Generalized Star Height at Most Four.
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Generalized-Star-Height-at-Most-Four-September-25-2026/Generalized-Star-Height-at-Most-Four-September-25-2026.pdf")[OAI:Generalized-Star-Height-at-Most-Four-September-25-2026],
  2026, Theorem~1.1.]
#bibitem([8])[OpenAI. Generalized Star Height at Most Three.
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Generalized-Star-Height-at-Most-Three-September-25-2026/article.pdf")[OAI:Generalized-Star-Height-at-Most-Three-September-25-2026],
  2026, Theorem~1.1.]
#bibitem([9])[Jean-Éric Pin, Howard Straubing, and Denis Thérien.
  Some results on the generalized star-height problem. #emph[Information and Computation] #strong[101]\(2) (1992),
  219--250. #link("https://doi.org/10.1016/0890-5401(92)90063-L")[doi:10.1016/0890-5401(92)90063-L].
  #link("https://www.irif.fr/~jep/PDF/StarHeight.pdf")[Author version dated 12 May 2002].]
#bibitem([10])[Thomas Place and Marc Zeitoun. Concatenation hierarchies: New bottle, old wine.
  In Pascal Weil (ed.), #emph[Computer Science---Theory and Applications (CSR 2017)],
  Lecture Notes in Computer Science #strong[10304], Springer, 2017, pp.~25--37.
  #link("https://doi.org/10.1007/978-3-319-58747-9_5")[doi:10.1007/978-3-319-58747-9\_5].
  #link("https://www.labri.fr/perso/zeitoun/research/pdf/2017_new_bottle.pdf")[Author extended abstract].]
#bibitem([11])[M.-P.~Schützenberger. On finite monoids having only trivial subgroups.
  #emph[Information and Control] #strong[8]\(2) (1965), 190--194.
  #link("https://doi.org/10.1016/S0019-9958(65)90108-7")[doi:10.1016/S0019-9958(65)90108-7].]
#bibitem([12])[Howard Straubing. On logical descriptions of regular languages.
  In Sergio Rajsbaum (ed.), #emph[LATIN 2002: Theoretical Informatics],
  Lecture Notes in Computer Science #strong[2286], Springer, 2002, pp.~528--538.
  #link("https://doi.org/10.1007/3-540-45995-2_46")[doi:10.1007/3-540-45995-2\_46].]
