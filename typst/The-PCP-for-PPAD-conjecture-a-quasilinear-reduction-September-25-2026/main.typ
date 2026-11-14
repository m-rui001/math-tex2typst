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

#align(center)[#text(size: 16pt, weight: "bold")[The PCP-for-PPAD conjecture: \
a quasilinear reduction]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction and the exact search relation <sec:introduction>

The class PPAD organizes total search problems whose existence proofs are based on the parity of endpoints in a
  directed graph #cite(label("Papadimitriou1994")). Its canonical problem, End-of-Line,
  asks for an endpoint other than a specified source, when the graph is described by predecessor and successor
  circuits. Generalized circuits provide another useful language for this class:
  a solution assigns real values in $\[ 0 \, 1 \]$ to wires and approximately satisfies local arithmetic,
  comparison, and Boolean constraints. The generalized-circuit intermediary was developed by Chen, Deng,
  and Teng #cite(label("CDT2007Preprint")) Section 4.2; arithmetic, comparison,
  and Boolean gadgets also underlie the equilibrium reductions of Daskalakis, Goldberg,
  and Papadimitriou #cite(label("DGP2009")) Section 5.1. Rubinstein established constant-error hardness with every
  gate required to be satisfied #cite(label("Rubinstein2018")) Theorem 2.
  These results motivate the circuit language used here, with the precise normalization and thresholds specified below.

Babichenko, Papadimitriou, and Rubinstein formulated the PCP-for-PPAD conjecture as a quasilinear reduction from
  End-of-Line to generalized circuits in which both the allowed numerical error and the allowed fraction of
  violated gates are positive constants #cite(label("BPR2016")) Conjecture 2.
  The failure fraction is the essential robustness requirement:
  the decoder must succeed even if an adversary chooses which constraints to violate.
  The quasilinear size requirement is a separate restriction on the reduction.
  Ordinary polynomial-time PPAD-hardness, even with constant numerical error, does not provide it.
  For example, hardness for every numerical error below $1 \/
  10$ is known for the standard generalized-circuit problem with every gate required to be
  satisfied #cite(label("DFHM2024")) Theorem 4.1. Subsequent uses of PCP-for-PPAD also consider the weaker
  conjecture asserting ordinary PPAD-hardness with a positive failure fraction;
  the distinction from the original quasilinear formulation is explicit in #cite(label("Fisher2026")) Section 2.2.2.

Rubinstein’s 2016 work combined encoded-path geometry, a locally evolving version of End-of-Line,
  and a holographic proof system whose certificates can be constructed and decoded through restricted
  access #cite(label("Rubinstein2016Settling")) Sections 3, 5, and 6.
  It established quasipolynomial hardness for constant-error two-player Nash under the exponential-time hypothesis
  for PPAD, while leaving the PCP-for-PPAD conjecture open and identifying composition as a remaining
  question #cite(label("Rubinstein2016Settling")) Theorem 1.2 and Section 1.3.
  More recently, Golowich derives sharper two-player Nash lower bounds for vanishing approximation error under PCP
  for PPAD together with the exponential-time hypothesis for PPAD #cite(label("Golowich2026")) Theorem 1.1.
  These time lower bounds retain their additional exponential-time hypothesis;
  the result here concerns the conjectured reduction itself.

We give a positive resolution of the quasilinear PCP-for-PPAD conjecture.
  Our size bound counts the complete finite output, including connection indices, every auxiliary gate,
  and the bits of all rational parameters. The gate conventions below are the standard bounded-rational
  conventions of #cite(label("DFHM2024")) #cite(label("Fisher2026"));
  the totality and witness-size statement is proved explicitly.
  When restricted to the nearly linear predecessor and successor circuits in the original formulation,
  the theorem gives the conjectured quasilinear reduction there as well.#footnote[The original Definition 1
  of #cite(label("BPR2016")) allows $x = 0^n$ in its first solution disjunct $P \( S \( x \) \) eq.not x$.
  If $P \( S \( 0^n \) \) eq.not 0^n$, this is an immediately computable solution.
  Otherwise the instance satisfies the additional source promise used below.
  Thus this normalization requires only circuit evaluation and a trivial branch of the reduction:
  output a fixed one-gate Constant circuit and have the decoder return $0^n$.]

=== 1.1 The source and target problems <the-source-and-target-problems>

We fix conventional explicit binary encodings of circuit gate lists, connection indices, input and output lists,
  and rational parameters. Integers are encoded in binary with delimiters.
  All size bounds concern these complete encodings. Changing between the usual such explicit encodings changes
  only constant or logarithmic factors.

#prodef([Definition 1.1.])[
  (End-of-Line).  An instance $I$ consists of two explicitly listed, acyclic, bounded-fanin Boolean circuits
  $ S \, P : { 0 \, 1 }^n arrow.r { 0 \, 1 }^n \, wide n gt.eq 1 \, $
  using AND, OR, and NOT gates, with unrestricted fan-out, and satisfying
  $ P \( 0^n \) = 0^n \, wide S \( 0^n \) eq.not 0^n \, wide P \( S \( 0^n \) \) = 0^n . $
  A solution is a string $v eq.not 0^n$ such that
  #[#set math.equation(numbering: n => "(1.1)")
   $ P \( S \( v \) \) eq.not v quad upright("or") quad S \( P \( v \) \) eq.not v . $ <eq:end-of-line-solution>]
  The input length $N gt.eq 2$ includes the complete descriptions of both circuits and their input and output lists.
] <def:eol>

#prodef([Definition 1.2.])[
  (Generalized circuit).  A generalized circuit $G = \( V \, T \)$ has an explicitly listed finite set of nodes
    $V$ and a nonempty set of gates $T$. Each gate has one output and at most two inputs.
    A node is the output of at most one gate. Directed cycles and unrestricted fan-out are permitted.
    Every gate parameter $alpha$ is a binary-encoded rational in $\[ 0 \, 1 \]$.
  For an assignment $x : V arrow.r \[ 0 \, 1 \]$, write $x_a \, x_b$ for input values and $x_z$ for the output.
    The five arithmetic gate types are $epsilon$-satisfied when the corresponding condition holds:
  $ upright("Constant") \( alpha \; z \) & : & quad \| x_z - alpha \| & lt.eq epsilon \,\
upright("Scale") \( alpha \; a \; z \) & : & \| x_z - alpha x_a \| & lt.eq epsilon \,\
upright("Copy") \( a \; z \) & : & \| x_z - x_a \| & lt.eq epsilon \,\
upright("Add") \( a \, b \; z \) & : & \| x_z - min { x_a + x_b \, 1 } \| & lt.eq epsilon \,\
upright("Subtract") \( a \, b \; z \) & : & \| x_z - max { x_a - x_b \, 0 } \| & lt.eq epsilon . $
  The comparison gate $upright("Less") \( a \, b \; z \)$ has the two implications
  $ x_a < x_b - epsilon med arrow.r.double med x_z gt.eq 1 - epsilon \, wide x_a > x_b + epsilon med
    arrow.r.double med x_z lt.eq epsilon . $
  The Boolean gates have the following implications:
  $ upright("Or") \( a \, b \; z \) :
    wide \( x_a gt.eq 1 - epsilon med upright("or") med x_b gt.eq 1 - epsilon \) & arrow.r.double x_z gt.eq 1 -
    epsilon \,\
\( x_a lt.eq epsilon med upright("and") med x_b lt.eq epsilon \) & arrow.r.double x_z lt.eq epsilon \;\
upright("And") \( a \, b \; z \) : wide \( x_a gt.eq 1 - epsilon med upright("and") med x_b gt.eq 1 - epsilon \) &
  arrow.r.double x_z gt.eq 1 - epsilon \,\
\( x_a lt.eq epsilon med upright("or") med x_b lt.eq epsilon \) & arrow.r.double x_z lt.eq epsilon \;\
upright("Not") \( a \; z \) : wide x_a lt.eq epsilon & arrow.r.double x_z gt.eq 1 - epsilon \,\
x_a gt.eq 1 - epsilon & arrow.r.double x_z lt.eq epsilon . $
  For these four gate types, every applicable implication must hold.
    If no antecedent holds, any output in $\[ 0 \, 1 \]$ is permitted.
    In particular, the comparison thresholds are strict and the Boolean thresholds are weak.
  Let $M$ be the complete binary encoding length of $G$. For fixed $epsilon \,
    delta > 0$ and a fixed polynomial $p$, an acceptable assignment is rational,
    has total binary encoding length at most $p \( M \)$, and $epsilon$-satisfies at least $\( 1 - delta \) \|
    T \|$ gates. Each gate has equal weight; at most $floor.l delta \| T \| floor.r$ gates may fail.
    Failed gates may violate their relations arbitrarily, but all their nodes still have one globally consistent
    value in $\[ 0 \, 1 \]$.
] <def:gcircuit>

The Boolean predicates make the error parameter nonmonotone:
  increasing $epsilon$ can activate an antecedent that was previously vacuous.
  This issue is analyzed by Schuldenzucker and Seuken #cite(label("SchuldenzuckerSeuken2019")) Proposition 1.
  Our gate arguments use one actual tolerance throughout. Later upper bounds on that tolerance ensure explicit
  margins; they do not reclassify a satisfied Boolean gate at a larger tolerance.

=== 1.2 Main theorem <main-theorem>

#thm([Theorem 1.3.])[
  (Quasilinear PCP for PPAD).  #emph[There are fixed rational constants
$ 0 < epsilon < 1 / 10 \, wide 0 < delta < 1 \, $

 a fixed positive integer $A$, a fixed nonnegative integer $b$,
   a fixed polynomial $p$ with nonnegative integer coefficients, and deterministic algorithms $R \,
   D$ with the following properties.]
  + #emph[Every generalized circuit in Definition 2 has an acceptable rational assignment of encoding length at
    most $p \( M \)$.]
  + #emph[For every End-of-Line instance $I$ of length $N$,
    the output $R \( I \)$ is a generalized circuit whose complete encoding length satisfies
$ M lt.eq A N ceil.l log_2 \( N + 2 \) #scale(x: 120%, y: 120%)[ceil.r]^b . $

]
  + #emph[The construction $R$ runs in time polynomial in $N$, with one fixed polynomial bound.]
  + #emph[For every acceptable assignment $x$ of $R \( I \)$,
    the algorithm $D \( I \, x \)$ returns a solution of $I$ in time polynomial in $N$ plus the encoding length of
    $x$, with one fixed polynomial bound.]
  #emph[All constants, polynomials, and algorithms are chosen once.
    They use no advice depending on the input length and no randomized construction.]
] <thm:main>

The conclusion about $D$ is universal over the locations and values of the failed gates.
  In fact, the soundness argument applies to arbitrary real assignments meeting the gate-failure budget;
  rationality is needed for the finite search relation and its computational decoder.
  The totality proof supplies an assignment satisfying every gate on a fixed rational mesh.
  Neither tolerance tends to zero with $N$.

=== 1.3 Proof strategy: encoded paths and robust local computation <proof-strategy-encoded-paths-and-robust-local-computation>

We begin with the geometric target of the reduction. Replace the End-of-Line graph by a locally evolving directed
  graph with a known source, no isolated vertices, and the same endpoint-decoding property.
  Represent each vertex $w$ by a separated binary word $E_w in { 0 \, 1 }^m$.
  In the box $\[ - 1 \, 2 \]^(4 m)$, viewed as four blocks of $m$ coordinates, each edge $u arrow.r
  v$ traces a polygon that first changes a copy of $E_u$ to $E_v$, changes a repeated control bit,
  updates the other copy, and resets the control bit. Rounded corners join these polygons into paths and cycles.
  An additional segment enters the known source, and a separate field prescription handles its far end.
  Every other path endpoint encodes an End-of-Line answer.

Section 10 constructs a bounded displacement field $v$ on this box.
  Close to a path it uses the directed tangent and the inward normal; farther away it passes to a fixed direction.
  For a sufficiently small fixed step $beta > 0$, the clipped move $"clip" \( X + beta v \( X \) \) -
  X$ has norm at least a fixed positive multiple of $beta$ outside a fixed neighborhood of the desired endpoints.
  Here clipping keeps each coordinate in the box, and the norm is normalized by the word length.
  Thus an accurate enough approximate fixed point identifies an endpoint.
  The proof must also provide local numerical access to the field:
  it cannot inspect the entire encoded graph when computing one coordinate of $v$.

This use of encoded paths and restricted access has a close predecessor in Rubinstein’s holographic proof
  system #cite(label("Rubinstein2016Settling")) Sections 3, 5, and 6.
  The present reduction needs two further properties simultaneously:
  quasilinear total storage and robustness to an arbitrary fixed fraction of failed gates.
  The two scales of the construction address these requirements as follows.

#strong[A quasilinear outer word.] Sections 2–5 construct canonical representations

$ R_w = \( s_k \)_(k in Gamma) \, wide s_k in { 0 \, 1 }^L \, wide \| Gamma \| = N \( log N \)^(O \( 1 \)) \, wide
  L = \( log N \)^(O \( 1 \)) . $

A bounded number of symbol positions suffices to test local validity, propose a neighboring symbol,
  or perform one correction step. Each such operation has Boolean complexity polynomial in $L$,
  with an exponent fixed before the later correction accuracy.
  Distinct valid words have constant symbol distance, and a word within a fixed symbol-error radius can be decoded
  globally in polynomial time.

Begin with the sparse transcript graph of Section 2, whose vertices record partial computations of the predecessor
  and successor circuits and whose edges change one tape position and its occupation bit.
  Transcript validity is expressed by bounded-degree polynomial equations in the tape entries.
  Sampling an individual equation could miss one false equation.
  Sections 3 and 4 instead encode polynomial remainders recording the equation residuals,
  and retain certificates for the intermediate products and linear computations that produce them.
  On exact codewords, a nonzero remainder differs from zero at a constant fraction of positions.
  The code’s commuting row and column constraints also permit whole-row or whole-column comparisons that give a
  constant gap for an incorrect certificate identity. All stored components are tested together on one fixed list
  of neighboring positions, so more certificates enlarge a symbol without diluting the gap.

One tape edit can change all these encoded arrays. Before making an allowed edit,
  Section 5 prepares each retained array’s finite difference:
  its value on the edited tape minus its value on the old tape.
  Certificates introduced by this preparation need their own increments as well.
  Each new increment has lower assigned polynomial degree in the logical tape entries,
  so this recursion has bounded depth. Once preparation is complete,
  adding the increments updates the whole retained tuple to its canonical value on the new tape;
  the preparation can then be reversed.

The remaining storage issue is the long linear computation needed to prepare an increment.
  It is carried out one small group of Fourier frequencies at a time:
  each such orbit is preserved by the encoder and has only polylogarithmically many frequencies.
  A clock records progress and scratch space is reused. Thus the preparation’s elapsed time lengthens the
  represented path rather than the data stored at a vertex. The resulting words are the locally evolving $R_w$ above.

#strong[One fixed binary port.] A polynomial-size robust construction applied directly to an $N$-bit vertex would
  not give the required size. Instead we apply it only to the $L$-bit outer symbols.
  The inner construction supplies one injective encoding

$ cal(D) : { 0 \, 1 }^L arrow.r { 0 \, 1 }^(S_0) \, wide S_0 = "poly" \( L \) \, wide
  E_w = \( cal(D) \( s_k \) \)_(k in Gamma) . $

Its encoding and positive correction radius are chosen before the number of symbols inspected by a local function.
  From that fixed radius, it supports every prescribed fixed average accuracy for requests with bounded address
  density. More outer correction rounds may enlarge the number of symbols inspected,
  and hence the number of input ports in the resulting local computation.
  More inner correction rounds improve its requested bit accuracy.
  These choices may enlarge constant factors, but they do not change $cal(D)$ or its radius.
  All polynomial factors in $L$ remain fixed powers of $log N$.

Sections 7–9 construct this port and its robust decision gadget independently of the outer reduction.
  For a fixed tuple $s = \( s_1 \, dots.h \, s_k \)$ of $L$-bit inputs to a Boolean function $f$,
  the inner graph is one computation path with blank work at its source and output $f \( s \)$ at its sink.
  Polynomial charts encode its tapes and certificates. Their dependencies are kept separate for each read-only
  input, including throughout the finite-difference closure.
  Consequently the input-dependent parts of the source and its first successor have the same formulas in every
  later invocation. A one-input template at these two labels defines $cal(D) \( s_i \)$ for one input $s_i$;
  its bits then supply the source data for an actual multi-input computation.

The binary representation in Section 8 adds point tables, line tables, and tables for the required products.
  Correction keeps both addresses in each product request and preserves the required bound on their joint
  distribution. Its error bound is averaged over requested coordinates;
  arbitrarily accurate correction at every individual coordinate is neither asserted nor needed.
  At the inner scale, the geometric construction forces a feedback state near the unique sink,
  where a positive fraction of encoded coordinates reveal $f \( s \)$.
  These become the many designated outputs of the decision gadget.

#strong[From local decisions to an endpoint under gate failures.] Section 6 uses the outer tester and correction
  routines to supply the field’s local information. Two rounded blocks serve as possible vertex encodings.
  On good validation decisions, each accepted seed has a unique reference vertex;
  corrected calls supply its incident flags and the requested bits of its own and neighboring encodings.
  The geometric estimator reserves a bounded list of possible pieces and estimates their statistics before
  selecting a numerical winner. This order makes average bit accuracy sufficient even when the selected piece
  depends on the output coordinate.

The generalized circuit has many physical replicas of each geometric coordinate.
  Write $X_(i r)$ for replica $r$ of component $i$, and $macron(X)_i$ for their mean.
  A fixed-degree expander average $A$ couples the replicas.
  Each output is produced by a circuit that realizes the approximate relation

$ X_(i r) approx "clip" #scale(x: 120%, y: 120%)[\(] \( A X \)_(i r) +
  beta hat(v)_(i r) \( macron(X) \) #scale(x: 120%, y: 120%)[\)] \, $

where $hat(v)$ is the bounded local field estimator. First,
  boundedness of the update and the expander gap force the replicas close to their means,
  without assuming that any decision is correct. This synchronization then bounds the number of reads far from
  their means. Randomized threshold offsets control ambiguous comparisons,
  and the gate-failure budget controls the circuits containing a failed gate.
  The randomness describes the sampling analysis: the printed circuit assigns replicas a deterministically
  enumerated list of fixed tapes of size polynomial in $L$.

These charges apply to the complete wired computation. All hypothetical answer branches are allocated before
  routing, and each physical read occurrence is routed separately with bounded load.
  Expensive Boolean decision gadgets are shared by groups of output replicas.
  Their many designated outputs ensure that failures concentrated on extraction wires still spoil only a
  controlled fraction of the group. On reliable outputs the update approximates the true field;
  on unreliable outputs whose gates are satisfied, its bounded size still gives an error proportional to $beta$,
  apart from the numerical gate tolerance. An estimate that keeps clipping inside the replica contraction argument
  then makes the mean an approximate fixed point. The displacement lower bound forces $macron(X)$ near an
  endpoint. Rounding its first block and applying the global binary and outer decoders yields the required
  End-of-Line answer.

The same synchronization, error charging, and clipped-mean argument is used inside the decision gadget.
  At that scale every output has its own bounded estimator circuit;
  the additional sharing of decision gadgets occurs only in the outer composition.
  In both uses, a fixed hypothetical answer branch is analyzed under the original random-tape law,
  rather than by conditioning on that branch being executed.

#strong[Organization and imported inputs.] Section 6 assembles the main theorem from the outer representation,
  the port interface stated there, and the independent geometric interface.
  It proves universal decoding, the complete binary size bound, and rational-witness totality.
  Sections 7–9 prove the port interface, and Section 10 proves both the displacement bound and finite numerical
  access. Section 11 gives the consequences described below.
  Appendix 12 collects the separate full-macrograph and unrestricted-product variants;
  these are not prerequisites for the fixed-port composition.

The outer code uses ternary Goldbach, fixed-generator prime-quotient expansion,
  and an effective least-prime bound #cite(label("Helfgott2013")) #cite(label("BG2008"))
  #cite(label("Xylouris2011")). Its simultaneous systematic encoders, matrix twists,
  and joint correction guarantees are proved here; a general locally testable code theorem such
  as #cite(label("DEL+2022")) does not by itself supply this combination.
  The inner binary construction uses the corrected scalar line test and two group-theoretic inputs
  #cite(label("FS1995")) #cite(label("EJZ2010")) #cite(label("Shalom1999")); its vector replacement,
  affine expansion, and average correction are proved here.
  The all-modulus Margulis–Gabber–Galil bound supplies the local and replica walks #cite(label("MGGAFP")).
  The inner fields and groups are introduced afresh and are distinct from those of the outer construction.

=== 1.4 Consequences for games and markets <consequences-for-games-and-markets>

Section 11 applies the theorem to the conditional reductions for weak approximate Nash and relative bimatrix Nash
  #cite(label("BPR2016")), course allocation #cite(label("BPR2016")),
  markets with approximately optimal bundles #cite(label("Fisher2026")),
  stationary equilibria in discounted games #cite(label("DGZ2023")) #cite(label("PZO2025"))
  #cite(label("FKPP2026")), and approximate Hylland–Zeckhauser allocation #cite(label("HZ2026")).
  For each target we state the precise approximation and encoding conventions before its consequence.
  The cited reductions provide the transfers to these problems.
  We supply the needed gate-basis and fan-out conversions, track their fixed error and failure losses,
  and verify the rational witness and decoder bounds. These consequences use fixed-gap circuit hardness;
  the quasilinear complete-output bound is the additional assertion of Theorem 3.

== 2 A sparse macrograph for End-of-Line <sec:macrograph>

We first replace the circuit transitions by a graph in which one edge changes at most one tape bit and its
  occupation bit. The graph is specified by short labels and local transition rules;
  its vertices are not enumerated. The use of a clock to expose sparse circuit updates has a close precedent in
  Rubinstein’s LocalEndOfALine construction #cite(label("Rubinstein2016Settling")) Sections 5–5.1,
  where a counter schedules activation and deactivation of individual wires.
  We give the transcript, reciprocal proposals, and bounded-incidence validity description needed here explicitly.

Throughout the outer construction, let $n_0$ be the number of input bits of the End-of-Line instance and let $N$
  be its complete binary encoding length. We use the promises

#[#set math.equation(numbering: n => "(2.1)")
 $ P \( 0^(n_0) \) = 0^(n_0) \, wide S \( 0^(n_0) \) eq.not 0^(n_0) \, wide P \( S \( 0^(n_0) \) \) =
   0^(n_0) . $ <macro:promises>]

Thus a nonzero string $y$ is an answer if

#[#set math.equation(numbering: n => "(2.2)")
 $ P \( S \( y \) \) eq.not y quad upright("or") quad S \( P \( y \) \) eq.not y . $ <macro:answer>]

=== 2.1 Sparse transcripts and their two orders <macro:transcripts>

Normalize both circuits to gates of fan-in at most two. In particular,
  replace any larger AND or OR by a binary tree. Give every input and every gate a distinct tape position.
  For each listed output, introduce a separate terminal copy gate,
  even if several listed outputs originally name the same wire.
  Replace the outgoing uses of a wire by a binary tree of copy gates,
  including its uses as feeds to terminal copies. A wire with $d$ uses needs $O \( d \)$ such gates.
  The total number of positions is therefore bounded by a constant times the number of gates, connections,
  and input and output list entries in the original instance, and hence is $O \( N \)$.

These changes preserve $S$ and $P$. They also make every tape position an operand of only a bounded number of
  internal gate rules. Choose a topological order of the nonterminal gates of each circuit,
  followed by all its terminal output copies. Such an order exists because those copies have no internal
  consumers: any branching needed for other uses was placed before them.
  Copy gates here are auxiliary transcript rules and need not belong to the source circuit’s original basis.

Pad the tape with dummy positions to a power of two $h = 2^ell$.
  An arbitrary fixed lower cutoff on $h$ may be imposed, and still $h = O \( N \)$.
  Write $\[ h \] = { 0 \, dots.h \, h - 1 }$. On these same positions define the two permutations

$ pi_(upright(f)) : thick & S upright(" inputs") \, med S upright(" gates") \, med P upright(" inputs") \, med
  P upright(" gates") \, med upright("dummies") \,\
pi_(upright(r)) : thick & P upright(" inputs") \, med P upright(" gates") \, med S upright(" inputs") \, med
  S upright(" gates") \, med upright("dummies") \, $

using the chosen gate order inside each block. For a content array $D in { 0 \, 1 }^(\[ h \])$,
  let $"pref"_(pi \, k) \( D \)$ agree with $D$ on $pi \( 0 \) \, dots.h \, pi \( k - 1 \)$ and be zero elsewhere.
  Its occupation array is the indicator of these $k$ positions.
  Empty and full tapes have occupation arrays $upright(bold(0))$ and $upright(bold(1))$, respectively.
  The content and occupation arrays are separate: an occupied position may contain zero.

For a full content array $D$, the notation $"in"_S \( D \)$, $"out"_S \( D \)$, $"in"_P \( D \)$,
  and $"out"_P \( D \)$ denotes the vectors at the designated input or terminal output positions.
  A #emph[valid full transcript] $Q_x$ computes $S$ on input $x$, copies its output to the inputs of $P$,
  computes $P$, and satisfies

#[#set math.equation(numbering: n => "(2.3)")
 $ "in"_S \( Q_x \) = x \, wide "in"_P \( Q_x \) = "out"_S \( Q_x \) \, wide "out"_P \( Q_x \) =
   x . $ <macro:full-transcript>]

Its dummy positions are zero. Consequently $Q_x$ exists precisely when $P \( S \( x \) \) = x$,
  and is unique when it exists.

For every $y in { 0 \, 1 }^(n_0)$, define two complete computation templates,
  without imposing any terminal comparisons. The template $U_y$ first computes $S \( y \)$ and then
  $P \( S \( y \) \)$; the template $V_y$ first computes $P \( y \)$ and then $S \( P \( y \) \)$.
  Both occupy the same tape coordinates and have zero dummies.
  In $V_y$, the $P$ inputs are $y$ and the $S$ inputs are $P \( y \)$.
  Thus $U_y$ is a valid full transcript exactly when $P \( S \( y \) \) = y$, in which case it is $Q_y$;
  and $V_y$ is a valid full transcript exactly when $S \( P \( y \) \) = y$, in which case it is $Q_(P \( y \))$.

#prodef([Definition 2.1.])[
  (Computed prefixes).  A #emph[forward prefix of length $k$ with parameter $y$] has the first $k$ positions in
    $pi_(upright(f))$ occupied. At occupied positions it obeys these rules:
    $S$ inputs copy the corresponding bits of $y$; $P$ inputs copy the corresponding designated $S$ outputs;
    every gate obeys its Boolean or copy rule; and dummies are zero.
    In addition, each occupied designated $P$ output equals the corresponding bit of $y$. Unoccupied contents are zero.
  A #emph[reconstruction prefix of length $k$ from $y$] uses $pi_(upright(r))$.
    Its occupied $P$ inputs copy $y$, its occupied $S$ inputs copy the designated $P$ outputs,
    and its occupied gates and dummies obey the same rules as above.
    Each occupied designated $S$ output must additionally equal the corresponding bit of $y$.
    Unoccupied contents are again zero.
] <macro:prefixes>

Every operand in a prefix rule is either an earlier occupied position or a specified bit of $y$.
  In particular, a designated comparison is an extra test on the newly computed terminal copy,
  not a substitute for its computation rule.

#thm([Lemma 2.2.])[
  (Unique prefixes and their first obstruction).  #emph[For a fixed $y$,
    the valid forward prefixes exist uniquely for an initial interval of lengths $0 lt.eq k lt.eq
    k_(upright(f)) \( y \)$ and equal $"pref"_(pi_(upright(f)) \, k) \( U_y \)$.
    The valid reconstruction prefixes likewise exist uniquely for $0 lt.eq k lt.eq
    k_(upright(r)) \( y \)$ and equal $"pref"_(pi_(upright(r)) \, k) \( V_y \)$. Moreover,
#[#set math.equation(numbering: n => "(2.4)")
 $ k_(upright(f)) \( y \) = h & quad arrow.l.r.double quad P \( S \( y \) \) = y \,\
k_(upright(r)) \( y \) = h & quad arrow.l.r.double quad S \( P \( y \) \) = y . $ <macro:forward-obstruction>]

 If a maximal length is less than $h$, the next position is a designated output at which the additional comparison
   fails.]
] <macro:prefix-uniqueness>

#proof[
  Induct along the relevant order. Input copies, gates, and dummies uniquely determine the next content bit from
    data already determined. These are exactly the bits of $U_y$ or $V_y$.
    The only possible obstruction is an additional terminal comparison.
    Shortening a valid prefix removes requirements without changing retained bits,
    so the valid lengths form an initial interval. At length $h$, all terminal comparisons have been imposed,
    giving the two equivalences. ◻
]

=== 2.2 The cyclic schedule and reciprocal proposals <macro:schedule>

A logical tape vector is

$ b = \( A \, E^A \, B \, E^B \) in { 0 \, 1 }^(4 h) \, $

where $A \, B$ are contents and $E^A \, E^B$ are occupations. The schedule uses four phases.
  To see their effect when all computations succeed, suppose $Q_x$ and $Q_y$ exist and $y = S \( x \)$.
  Starting with $A = Q_x$ and $B$ empty, it fills $B$ with $Q_y$, erases $A$ by reversing reconstruction from $y$,
  copies $B$ into $A$, and erases $B$. The resulting tapes are $A = Q_y$ and $B$ empty.
  The identity $P \( y \) = x$, which follows from validity of $Q_x$,
  is what makes the reconstruction recover the old tape.

For intermediate prefixes, including those at a failed terminal comparison, validity is defined as follows.
  The stage $s$ lies in $bb(Z) \/ \( 4 h \) bb(Z)$. Write $cal(V)_s$ for the following set of valid logical
  vectors; the endpoint descriptions in adjacent cases are identified.

+ $0 lt.eq s lt.eq h$: $A = Q_x$ is full for some $x$, and $B$ is a forward prefix of length $s$ with parameter
  $y = "out"_S \( A \) = S \( x \)$.
+ $h lt.eq s lt.eq 2 h$: $B = Q_y$ is full for some $y$, and $A$ is a reconstruction prefix of length $2 h -
  s$ from $y = "in"_S \( B \)$.
+ $2 h lt.eq s lt.eq 3 h$: $B$ is a valid full transcript and $A = "pref"_(pi_(upright(f)) \, s - 2 h) \( B \)$.
  This copied prefix has no additional computation requirements.
+ $3 h lt.eq s lt.eq 4 h$: $A$ is a valid full transcript and $B = "pref"_(pi_(upright(f)) \, 4 h - s) \( A \)$.

Occupations in every case are the stated full or prefix indicators.
  Stage $4 h$ is stage $0$, at which $A$ is full and $B$ is empty.

#thm([Lemma 2.3.])[
  (Boundary agreement).  #emph[The two validity descriptions agree at each of $h \, 2 h \, 3 h$, and $4 h = 0$.]
] <macro:boundaries>

#proof[
  At stage $h$, the first description gives
  $ A = Q_x \, wide B = Q_y \, wide y = S \( x \) \, wide P \( y \) = x . $
  The reconstruction template from $y$ computes $P \( y \) = x$ and then $S \( x \) = y$,
    so it agrees with $A$ at every position and satisfies all its comparisons. This gives the second description.
    Conversely, the second description at $h$ gives $B = Q_y$ and a full reconstruction $A =
    V_y$ with $S \( P \( y \) \) = y$. Put $x = P \( y \)$. Then $P \( S \( x \) \) = P \( y \) = x$, so $A =
    Q_x$ and $"out"_S \( A \) = y$. Since $B = Q_y$, it is the full forward prefix required in the first
    description. These identities include all copy gates and dummies.
    At $2 h$, both descriptions have $A$ empty and $B$ a valid full transcript.
    At $3 h$, both have $A = B$ a valid full transcript. At $4 h = 0$, both have $A$ full and $B$ empty. ◻
]

For each #emph[start frame] $c in { 0 \, dots.h \, 4 h - 1 }$,
  define a forward proposal $F_c$ from stage $c$ to stage $c + 1$, and a reverse proposal $R_c$ from stage $c +
  1$ to stage $c$, with stages reduced modulo $4 h$. Thus at current stage $s$,
  the successor uses $F_s$ and the predecessor uses $R_(s - 1)$,
  where the latter subscript is reduced modulo $4 h$. The following table specifies their content changes.
  Every fill or copy sets the corresponding occupation to one, and every erasure sets it to zero.
  All other bits remain unchanged.

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Start frame
], table.cell(rowspan: 1, colspan: 1)[Position $j$
], table.cell(rowspan: 1, colspan: 1)[$F_c$
], table.cell(rowspan: 1, colspan: 1)[$R_c$
]),
  table.cell(rowspan: 1, colspan: 1)[$0 lt.eq c < h$
], table.cell(rowspan: 1, colspan: 1)[$pi_(upright(f)) \( c \)$
], table.cell(rowspan: 1, colspan: 1)[fill $B_j$ forward
], table.cell(rowspan: 1, colspan: 1)[erase $B_j$
],
  table.cell(rowspan: 1, colspan: 1)[$h lt.eq c < 2 h$
], table.cell(rowspan: 1, colspan: 1)[$pi_(upright(r)) \( 2 h - c - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[erase $A_j$
], table.cell(rowspan: 1, colspan: 1)[fill $A_j$ by reconstruction
],
  table.cell(rowspan: 1, colspan: 1)[$2 h lt.eq c < 3 h$
], table.cell(rowspan: 1, colspan: 1)[$pi_(upright(f)) \( c - 2 h \)$
], table.cell(rowspan: 1, colspan: 1)[copy $B_j$ to $A_j$
], table.cell(rowspan: 1, colspan: 1)[erase $A_j$
],
  table.cell(rowspan: 1, colspan: 1)[$3 h lt.eq c < 4 h$
], table.cell(rowspan: 1, colspan: 1)[$pi_(upright(f)) \( 4 h - c - 1 \)$
], table.cell(rowspan: 1, colspan: 1)[erase $B_j$
], table.cell(rowspan: 1, colspan: 1)[copy $A_j$ to $B_j$
],
)
]

A computed fill always writes its Boolean rule value, even if the additional terminal comparison fails.
  Thus the proposal itself is defined separately from the test of whether its result is valid.

The #emph[macrograph] has vertex set

$ cal(V) = { \( s \, b \) : s in bb(Z) \/ \( 4 h \) bb(Z) \, b in cal(V)_s } . $

It has an edge $\( c \, b \) arrow.r \( c + 1 \, b' \)$ precisely when $b' = F_c \( b \)$ and both endpoints are valid.

#thm([Lemma 2.4.])[
  (Reciprocity and local existence tests).  #emph[Whenever $b in cal(V)_c$ and $b' in cal(V)_(c + 1)$,
#[#set math.equation(numbering: n => "(2.5)")
 $ b' = F_c \( b \) quad arrow.l.r.double quad b = R_c \( b' \) . $ <macro:reciprocity>]

 For a valid input to either proposal, validity of its output is determined by a bounded number of bits at public,
   frame-dependent addresses. The forward proposal can fail only when $0 lt.eq
   c < h$ and the new forward terminal comparison fails. The reverse proposal can fail only when $h lt.eq
   c < 2 h$ and the new reconstruction terminal comparison fails.
   The graph has indegree and outdegree at most one, and no self-edges.]
] <macro:local-edges>

#proof[
  In the first range, erasing the newly filled position recovers its previous blank content and occupation.
    Conversely, a valid longer forward prefix has the uniquely prescribed value at its last position,
    so filling its shortened prefix recovers it. In the second range, erasure shortens a reconstruction prefix.
    Its erased value is uniquely determined by earlier retained positions and the unchanged full tape $B$,
    so reverse reconstruction recovers it. The converse follows from the same uniqueness.
    In the last two ranges, the unchanged full tape determines the copied value,
    and erasure recovers the blank position. Boundary agreement applies to each use of these statements at a
    boundary. In particular, at $c = 4 h - 1$, the reverse proposal from stage zero copies
    $A_(pi_(upright(f)) \( 0 \))$ into the first forward position of the empty $B$ tape,
    exactly reversing the wraparound erasure.
  Shortening a valid computed prefix is always valid, as are extending or shortening a copied prefix.
    When extending a computed prefix, all earlier conditions remain true.
    Its next value is obtained from at most two earlier operands or a specified full-tape input bit,
    so the only new condition that can fail is the stated terminal comparison.
    That comparison needs one additional specified bit. Thus the relevant operands, old bits,
    and comparison bits suffice to decide both proposals and the corresponding existence flags.
    Equation (2.5) gives at most one predecessor, and the definition gives at most one successor.
    Every edge changes the stage by one modulo $4 h$, and $4 h gt.eq 4$, so no edge is a self-edge. ◻
]

=== 2.3 Endpoints, sparse edits, and uniform size <macro:interface>

The following statement is the interface used by the evolving representation.

#thm([Lemma 2.5.])[
  (Macrograph interface).  #emph[From every promised End-of-Line instance of explicit length $N$,
    one can deterministically construct, in time polynomial in $N$, the above tape specification with $h = 2^ell =
    O \( N \)$, the stage conditions $cal(V)_c$, and the following data and algorithms.]
  + #emph[The macrograph has indegree and outdegree at most one, no self-edges, and no isolated vertices.
    It has a distinguished source $v_(*)$ whose label and actual successor are computable in polynomial time.
    Every endpoint other than $v_(*)$ supplies a nonzero End-of-Line answer by reading a designated vector on a
    full tape.]
  + #emph[Forward and reverse proposals at the same start frame are reciprocal on valid pairs.
    Their edits and existence flags use only a fixed number of logical bits at public addresses,
    with a fixed finite set of Boolean decision rules.]
  + #emph[There is a fixed finite alphabet $Sigma = { - 1 \, 0 \,
    1 }^4$ and public edit vectors $h_sigma \( c \)$ such that each chosen proposal has the form $b mapsto b +
    h_sigma \( c \)$. One public address is allotted to each logical array.
    On actual edges only the active tape’s content position and its occupation position can change.
    The same fixed edit formulas are defined over any field, whether or not their arguments represent valid
    Boolean tapes.]
  + #emph[For each fixed phase, the local tape requirements have bounded arity and bounded operand multiplicity,
    uniformly in $N$. The full tape specification and all frame-dependent rule and address tables have $O \( h \)$
    records of $O \( log \( N + 2 \) \)$ bits each. A vertex label has $4 h + ceil.l log_2 \( 4 h \) ceil.r =
    O \( N \)$ bits; validity and endpoint decoding take polynomial time.
    These bounds concern descriptions and individual labels and do not require enumeration of the macrograph.]
] <lem:macrograph>

#proof[
  We first identify all endpoints. A missing successor can occur only in the first range of the schedule.
    Write its full tape as $A = Q_x$ and put $y = "out"_S \( A \) = S \( x \)$.
    The current $B$ tape is its longest valid forward prefix, so Lemma 5 gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ P \( S \( y \) \) eq.not y \, wide P \( y \) = x . $ <macro:sink-identity>]
  If $y = 0^(n_0)$, then $x = P \( 0^(n_0) \) = 0^(n_0)$ and $y = S \( 0^(n_0) \) eq.not 0^(n_0)$,
    a contradiction. Thus this designated vector is a nonzero End-of-Line answer. Such a vertex has a predecessor:
    shorten its forward prefix when its length is positive; at stage zero use the reverse wraparound copy from the
    preceding frame.
  A missing predecessor can occur only at a stage $s = c + 1$ with $h lt.eq c < 2 h$.
    Its full tape is $B = Q_y$, where $y = "in"_S \( B \)$, and its reconstruction prefix has its maximal length
    $k_(upright(r)) \( y \) < h$. Hence
  #[#set math.equation(numbering: n => "(2.7)")
   $ s = 2 h - k_(upright(r)) \( y \) \, wide S \( P \( y \) \) eq.not y . $ <macro:source-identity>]
  For $y eq.not 0^(n_0)$ this is again a permitted answer. The vertex has a successor obtained by shortening the
    reconstruction prefix; if the prefix is empty, the next copying step supplies a successor.
    Every proposal in the two copying ranges succeeds in the relevant direction,
    except that an incoming reconstruction proposal at stage $2 h$ is covered by the case just considered.
    Together with Lemma 7, this exhausts the possible missing neighbors and proves that no vertex is isolated.
  It remains to specify the zero-labelled exception. The last promise in (2.1) supplies the unique full transcript
    $Q_(0^(n_0))$, whereas the first two promises give
  $ S \( P \( 0^(n_0) \) \) = S \( 0^(n_0) \) eq.not 0^(n_0) . $
  Let $k_(*) = k_(upright(r)) \( 0^(n_0) \) < h$. Then $v_(*)$ is exactly the vertex at stage $2 h -
    k_(*)$ whose $B$ tape is $Q_(0^(n_0))$ and whose $A$ tape is
    $"pref"_(pi_(upright(r)) \, k_(*)) \( V_(0^(n_0)) \)$, with their prescribed occupations.
    Prefix uniqueness proves that this is the only missing-predecessor vertex with designated vector zero.
    It has no predecessor and has the successor just described.
    Evaluate $U_(0^(n_0))$ and $V_(0^(n_0))$, locate the first failed reconstruction terminal comparison,
    and take the preceding prefix. This computes $v_(*)$ and its successor in polynomial time.
    This proves the endpoint claims, including the existence of the public source.
    Other directed paths and directed cycles may remain in the graph; nothing here requires one connected component.
  We next make the local edit interface explicit. At start frame $c$,
    let $j \( c \)$ be the position in the transition table. Allot this position to the content and occupation
    arrays of the active tape, and allot the fixed default position $0$ to the two inactive arrays.
    Denote these four addresses by $j_D \( c \)$, for $D in { A \, E^A \, B \, E^B }$.
    If $upright(bold(e))_(D \, j)$ is the unit vector at position $j$ of array $D$, define, over a field $K$,
  #[#set math.equation(numbering: n => "(2.8)")
   $ h_sigma \( c \) = sum_(D in { A \, E^A \, B \, E^B }) sigma_D upright(bold(e))_(D \, j_D \( c \)) in
     K^(4 h) \, wide sigma in { - 1 \, 0 \, 1 }^4 \, $ <macro:finite-edits>]
  where the integers $- 1 \, 0 \, 1$ are mapped into $K$. For a proposed Boolean write,
    choose its content coefficient as the desired bit minus the old bit and its occupation coefficient as the
    desired occupation minus the old occupation. Set both inactive coefficients to zero.
    Each coefficient lies in ${ - 1 \, 0 \, 1 }$, and the resulting additive edit is precisely the proposal,
    in either direction. The vector in (2.8) is public once $c$ and $sigma$ are fixed;
    addition by it is defined on all of $K^(4 h)$. The assertion about valid Boolean proposals does not require a
    validity interpretation for other field-valued inputs.
  The necessary public data at a frame are its phase, active tape, write position, rule type,
    at most two operand addresses, the old content and occupation addresses, and, when applicable,
    the extra comparison address. A forward fill uses its forward rule;
    a reverse fill uses its reconstruction rule. Lemma 7 shows that the existence flag is the new comparison
    result in the only direction where failure is possible, and is one otherwise.
    These are fixed Boolean decisions once the finitely many addressed bits and public rule data are supplied.
    Define the decisions on arbitrary Boolean reads by the same formulas,
    using a fixed default rule and address for unused roles. Their agreement with graph neighbors is asserted on
    valid input vertices. No global validity check or full circuit evaluation is hidden in an existence flag.
  For completeness, the bounded-multiplicity assertion includes more than internal gate edges.
    Each internal value has boundedly many uses after copy-tree normalization.
    Each designated output is used once by the other circuit’s input-copy rule and participates in only a bounded
    number of terminal or external-vector comparisons. Each external-vector bit is used once as an input bit and
    once for its corresponding terminal comparison. Copied-prefix equations use each full-tape position once.
    Occupation indicators condition only the rules at their positions; prefix monotonicity,
    if expressed by adjacent-position tests, reads a position at most twice in each order.
    Thus all local content, bitness, occupation, gate, copy, comparison,
    and dummy conditions use bounded-arity records, and each logical position appears as an operand only boundedly
    often across the fixed list of phases. The requirement that the occupied prefix have its specified length is
    separate: one may either inspect the prescribed occupation pattern directly,
    or use prefix monotonicity together with the occupation sum.
    The latter is a single global count condition for each tape and will be represented separately in the
    algebraic construction.
  All normalization and ordering operations are deterministic.
    Their records and the two permutations occupy $O \( h log \( N + 2 \) \)$ bits.
    Tabulate the transition data for the $4 h$ frames in the same space bound,
    including both directions and defaults. Scanning the arrays and these records tests membership in $cal(V)_s$
    in polynomial time. The designated endpoint vectors and the circuit inequalities (2.6) and (2.7) give a
    polynomial-time endpoint decoder. At every fixed stage a valid vertex is determined by the input of its full
    transcript, since its other tape is a unique computed or copied prefix.
    Consequently the graph has at most $4 h thin 2^(n_0)$ vertices,
    even though an individual label has only $O \( N \)$ bits.
    The construction outputs the normalized records, public tables, and algorithms,
    never this potentially exponential vertex list. All constants in these bounds depend only on the fixed Boolean
    basis and padding cutoff. This proves the remaining uniformity and size assertions. ◻
]

== 3 Outer index groups and systematic square codes <sec:outer-codes>

The outer code has two roles. Its systematic coordinates carry the data on which the representation computes,
  and its redundant coordinates make local consistency imply proximity in the metric that counts an entire stored
  symbol as one position. We construct the code, including its matrix twists and simultaneous systematic encoders.
  All vector-valued statements below use joint support: a coordinate is erroneous when any component is erroneous.
  Their constants do not depend on the number of components or stored slots.
  The notation in this section is local to the outer construction; in particular,
  the group constructed here is not the affine group used later for the inner construction.

The index group must provide commuting left and right moves, constant expansion,
  and only polylogarithmically many frequencies in each relevant orbit.
  The first two properties support local consistency; the orbit bound makes the local filling in Lemma 21
  possible. The code and correction guarantees are summarized in Theorem 16 and Lemma 17.

=== 3.1 A group of quasilinear order <a-group-of-quasilinear-order>

Let $h = 2^ell = O \( N \)$ be the padded tape length supplied by Lemma 8.
  Fix a sufficiently large absolute integer $C$, and choose an even $r$ with

#[#set math.equation(numbering: n => "(3.1)")
 $ ell + C lt.eq r lt.eq ell + C + 2 \, wide M_o = 2^r \, wide G_0 = bb(F)_2^r . $ <oc:outer-size>]

We increase $C$ whenever a fixed lower cutoff is needed. Thus $4 h lt.eq M_o$, $M_o = O \( N \)$, and $r =
  O \( log \( N + 2 \) \)$. The bits of $x in G_0$ are ordered from least to most significant;
  $underline(x) in \[ 0 \, M_o \)$ denotes the integer they represent.

Helfgott’s ternary Goldbach theorem says that every odd integer greater than five is a sum of three primes
  #cite(label("Helfgott2013")) Main Theorem. For our even $r$ we can therefore find primes $p_1 \, p_2 \,
  p_3$ with $r - 3 = p_1 + p_2 + p_3$, by exhaustive search in $\[ r \]$.
  They need not be distinct or comparable in size. Partition the $r$ bit positions into blocks of lengths $p_a +
  1$, and let

#[#set math.equation(numbering: n => "(3.2)")
 $ H = product_(a = 1)^3 "PGL"_2 \( bb(F)_(p_a) \) \, wide Gamma = G_0 times.r H . $ <oc:group>]

Each factor acts on its projective line, hence permutes its block of bit positions.
  Since $\| "PGL"_2 \( bb(F)_q \) \| = q \( q^2 - 1 \)$, we have

#[#set math.equation(numbering: n => "(3.3)")
 $ \| H \| lt.eq r^9 \, wide \| Gamma \| = M_o \| H \| lt.eq M_o r^9 . $ <oc:group-order>]

A generator of $bb(F)_(p_a^2)^times$, acting on its one-dimensional $bb(F)_(p_a)$-subspaces,
  induces a cycle $R_a$ of length $p_a + 1$: the scalar subgroup has order $p_a -
  1$ and its quotient acts freely and transitively on these subspaces.
  Label each block in this cycle order, and denote its first unit vector by $e_a$.
  The three finite fields, permutation groups, cycles, and their tables have size polynomial in $r$ and can be
  found by exhaustive finite-field computations of that size.

The product is $\( g \, u \) \( w \, v \) = \( g + u w \, u v \)$.
  It is useful to write a group element $k = \( g \, u \)$ instead as $\( x \, u \)$, where $x = u^(- 1) g$.
  Left and right multiplication by $\( w \, v \)$ then have the formulas

#[#set math.equation(numbering: n => "(3.4)")
 $ \( x \, u \) mapsto \( x + u^(- 1) v^(- 1) w \, v u \) \,
   wide \( x \, u \) mapsto \( v^(- 1) \( x + w \) \, u v \) \, $ <oc:actions>]

respectively. These formulas also give polynomial-in-$r$ Boolean algorithms for multiplication and inversion,
  using the small tables for $H$ rather than a table for $Gamma$.

#thm([Lemma 3.1.])[
  (Uniform expansion).  #emph[For every fixed $0 < lambda < 1$,
    the groups $Gamma$ in (3.2) admit symmetric labelled Cayley multisets of a fixed degree whose averaging
    operator has norm at most $lambda$ on mean-zero functions. The same assertion holds for $H$.
    Their labels can be constructed deterministically in time polynomial in $N$ and represented with
    $"polylog" \( N \)$ bits of public data. Multiplicities and identity labels are permitted.]
] <oc:expansion>

#proof[
  First consider a factor of $H$. The reductions of the upper and lower unit elementary matrices,
    with their inverses, have a uniform Cayley gap in $"SL"_2 \( bb(F)_p \)$.
    This is the elementary-generator case of the congruence gap discussed in #cite(label("BG2008")) p. 626,
    and also follows directly from #cite(label("BG2008")) Theorem 1,
    since the corresponding fixed subgroup of $"SL"_2 \( bb(Z) \)$ is non-elementary.
    Passing to the quotient by the center preserves the upper gap. A half-lazy walk has a uniform absolute gap.
    The finitely many small primes are absorbed by decreasing this fixed gap.
  For odd $p$, the subgroup $"PSL"_2 \( bb(F)_p \)$ is normal of index two in $"PGL"_2 \( bb(F)_p \)$.
    Add a representative of the nonsquare determinant class and its inverse;
    in the index-one case pad with identities. To check a uniform gap,
    work in an arbitrary unitary representation. The preceding subgroup gap bounds the distance of a vector to its
    subgroup-invariant projection by a fixed multiple of its maximum displacement under the subgroup labels.
    Normality makes that invariant subspace invariant under the extra label,
    which controls its quotient of order at most two. Thus distance to the full invariant subspace is bounded by a
    fixed multiple of the maximum displacement under all these labels.
    The three factor projections commute; applying this argument to the three factors gives the same statement for
    $H$, with a fixed-size generating list. The regular-representation gap used here applies to every
    representation of the finite group, by its decomposition into irreducible representations.
  We next give a bounded list of translations which, together with these $H$ labels, expands $Gamma$.
    Consider a block of $n'$ bits with cycle $R$. For a nonzero frequency $y in bb(F)_2^(n')$,
    let $d'$ be the dimension of the span of its cyclic shifts.
    Identifying vectors with polynomials modulo $Z^(n') - 1$, this span is a cyclic ideal.
    Every such ideal of dimension $d'$ is specified by a complementary monic divisor of degree $d'$.
    There are at most $2^(d')$ such divisors and at most $2^(d')$ vectors in each ideal.
    In particular, there are at most $2^(2 d')$ frequencies with this span dimension.
    This argument uses only the ideal structure of the polynomial quotient and remains valid when $Z^(n') -
    1$ has repeated factors in characteristic two.
  For a uniform seed $a in bb(F)_2^(n')$, the correlation vector $\( y dot.op R^t a \)_(t = 0)^(n' - 1)$ is
    uniform on a shift-invariant linear space of dimension $d'$. Take $j_0$ independent seeds.
    In the product of these spaces, the subset with total weight less than $j_0 n' \/
    4$ is invariant under cyclic shifts and permutation of the seeds.
    If this subset is nonempty, its uniform distribution has the same marginal at every coordinate,
    with probability of one at most $1 \/ 4$. An information set of $j_0
    d'$ coordinates determines a vector in the product space.
    Entropy subadditivity consequently bounds the size of this subset by $2^(j_0 d' cal(H) \( 1 \/ 4 \))$,
    where $cal(H)$ is binary entropy. The subset of weight greater than $3 j_0 n' \/ 4$ has the same bound,
    by the marginal entropy estimate with probabilities at least $3 \/ 4$;
    it is unnecessary for the space to be closed under complementation.
    Thus a fixed sufficiently large $j_0$ makes the probability of any failure at any nonzero frequency at most
  #[#set math.equation(numbering: n => "(3.5)")
   $ 2 sum_(d' gt.eq 1) 2^(- { j_0 \( 1 - cal(H) \( 1 \/ 4 \) \) - 2 } d') < 1 . $ <oc:seed-bound>]
  There exist $j_0$ seeds whose cyclic translates have absolute Walsh bias at most $1 \/
    2$ at every nonzero frequency. Enumerating all seed tuples and checking their biases constructs them in time
    $2^(O \( r \))$, which is polynomial in $N$.
  Take the Cartesian product of the three block seed lists.
    Averaging its translations under $chevron.l R_1 chevron.r times chevron.l R_2 chevron.r times
    chevron.l R_3 chevron.r$ has absolute Walsh bias at most $1 \/ 2$ off zero:
    the three factors multiply, and a nonzero frequency has a nonzero block.
    Averaging further over cosets in $H$ preserves this bound.
    Denote by $T$ the average of the resulting $H$-conjugates of seed translations.
    On the orthogonal complement of $G_0$-invariants, $T$ has all eigenvalues in $\[ - 1 \/ 2 \, 1 \/ 2 \]$,
    by Fourier decomposition for $G_0$.
  Let $v$ be a unit vector in a representation of $Gamma$, and let $eta$ be its maximum displacement under the
    fixed $H$ labels and the fixed product-seed translations.
    The $H$-invariant projection $v_H$ satisfies $parallel v - v_H parallel lt.eq K eta$ for an absolute $K$.
    Its displacement under any seed translation is at most $\( 1 + 2 K \) eta$.
    Since $v_H$ is $H$-invariant, the same holds for every $H$-conjugate of a seed.
    Writing $P_(G_0)$ for projection to $G_0$-invariants gives
  $ parallel v_H - P_(G_0) v_H parallel^2 lt.eq 2 chevron.l v_H \, \( I - T \) v_H chevron.r lt.eq \( 1 + 2 K \)^2
    eta^2 . $
  Normality of $G_0$ implies that $P_(G_0) v_H$ is also $H$-invariant.
    Distance to the $Gamma$-invariant subspace is therefore at most a fixed multiple of $eta$.
    The symmetric half-lazy average on our fixed generating list has a uniform positive gap:
    its Dirichlet form is the average of squared label displacements divided by a fixed constant.
    Its spectrum is nonnegative. A fixed power of this walk has mean-zero norm at most the requested $lambda$.
    Reversing words shows that the powered list remains symmetric.
    Its length is fixed, and the same conclusion holds for left and right regular actions. ◻
]

=== 3.2 Common scalar local codes <common-scalar-local-codes>

The distance and agreement estimates in this subsection hold over an arbitrary field $J$,
  conditional on the scalar check matrices satisfying the stated minor conditions.
  We will choose the special outer field and those matrices after fixing the constants in these estimates.

The local agreement constant must be fixed before the outer Cayley degree is chosen.
  To obtain this order, we make the label positions the edges of a separate expander.
  For every integer $s_b gt.eq 1$, consider the Margulis–Gabber–Galil multigraph #cite(label("Margulis1973"))
  #cite(label("GabberGalil1981")) on $bb(Z)_(s_b)^2$ with the eight labelled moves

$ \( x plus.minus 2 y \, y \) \, quad \( x plus.minus \( 2 y + 1 \) \, y \) \, quad \( x \, y plus.minus 2 x \) \,
  quad \( x \, y plus.minus \( 2 x + 1 \) \) . $

Its normalized mean-zero norm is at most $5 sqrt(2) \/ 8$ for every positive integer modulus,
  including composite moduli. The primary formal development #cite(label("MGGAFP")) #raw("mgg_graph_step"),
  #raw("mgg_numerical_radius") proves exactly this labelled, symmetric, all-modulus statement.
  Add eight identity labels for half-laziness and take a sufficiently large fixed power.
  Viewing the result as a bipartite graph between two copies of $bb(Z)_(s_b)^2$ gives a graph $B_0$ with fixed
  degree $d_0$, permutation labels $1 \, dots.h \, d_0$, and mean-zero cross-part norm

#[#set math.equation(numbering: n => "(3.6)")
 $ lambda_0 < 10^(- 4) \, wide c_0 = floor.l d_0 \/ 16 floor.r \, wide delta_0 = 1 \/ 16 . $ <oc:base-parameters>]

Take the fixed power large enough that $c_0 gt.eq 1$. Let $n_b = s_b^2$ and $d = d_0 n_b$.
  Each of the $d$ edge coordinates is named by its left base vertex and permutation label.
  Both ends of an outer edge use these same coordinate names.

For each of the four types $C_A^0 \, C_A^1 \, C_B^0 \, C_B^1$, choose two $c_0 times d_0$ scalar matrices,
  one for each base side. Impose the corresponding checks at every base vertex,
  with incident edges in permutation-label order. There are eight check matrices in total;
  their entries are shared by all stars of the same type. We require every $c_0$-column minor to be nonzero.
  Section 3.3 constructs matrices meeting these conditions and the global encoder conditions simultaneously.
  Until then the following conclusions hold for every choice satisfying the stated minors.
  For a finite-dimensional $J$-space $U$, notation such as $C_A^s \( U \)$ means that the scalar constraints are
  applied componentwise to a word in $U^d$.

#thm([Lemma 3.2.])[
  (Local distance and tensor agreement).  #emph[Set
#[#set math.equation(numbering: n => "(3.7)")
 $ delta_1 = delta_0 \( delta_0 - lambda_0 \) > 0 . $ <oc:delta-one>]

 Every nonzero word of any of the four local codes, over any finite-dimensional $J$-space $U$,
   has at least $delta_1 d$ nonzero coordinates. There is a constant $C_0 < oo$, depending only on $d_0 \,
   delta_0 \, lambda_0$, with the following property for every $s_b$, every field and check matrices as above,
   every $U$, and every $s \, t$. If $F$ is a $d times d$ table with rows in $C_B^t \( U \)$ and $D$ is such a
   table with columns in $C_A^s \( U \)$, and their joint cell-disagreement fraction is $z$,
   there is a table $W$ whose rows and columns obey both codes and such that
#[#set math.equation(numbering: n => "(3.8)")
 $ Pr_i \[ W \( i \, dot.op \) eq.not F \( i \, dot.op \) \] +
   Pr_j \[ W \( dot.op \, j \) eq.not D \( dot.op \, j \) \] lt.eq C_0 z . $ <oc:tensor-agreement>]

 In particular, $C_0$ is independent of $d$, $\| J \|$, and $dim_J U$.]
] <oc:local-agreement>

#proof[
  The maximal-minor condition gives star distance at least $c_0 + 1 gt.eq delta_0 d_0$:
    a nonzero word of smaller support would give a linear dependence among at most $c_0$ columns,
    which could be enlarged to a dependence among $c_0$ columns.
    This also proves the assertion for vector entries, either by applying a nonzero scalar component or by solving
    the independent-column equations componentwise.
  For a nonzero whole local word, let $l \, u$ be the fractions of left and right base vertices incident to its
    support, and let $a = max \( l \, u \)$. Its edge-support fraction $e$ obeys, by star distance and mixing,
  $ delta_0 a lt.eq e lt.eq l u + lambda_0 sqrt(l u) lt.eq a \( a + lambda_0 \) . $
  Hence $a gt.eq delta_0 - lambda_0$ and $e gt.eq delta_1$.
    Mixing here and below follows by subtracting the two constant means and applying the cross-part operator norm
    to the indicator functions.
  For agreement, apply the A-base checks to the columns of $F$.
    Mark every base star at which any check syndrome is nonzero.
    Each nonzero syndrome, as a row indexed by the $d$ columns, is a scalar linear combination of B-code rows,
    and is therefore a nonzero B-codeword over $U$. Its support has size at least $delta_1 d$.
    In each such column there must be a discrepancy with $D$ on an edge incident to the marked star,
    since $D$ satisfies that star’s check. A discrepancy cell is incident to at most two base stars.
    If $w_0$ is the total marked-star count divided by $n_b$ (counting both base sides), then
  #[#set math.equation(numbering: n => "(3.9)")
   $ w_0 lt.eq frac(2 z d^2, delta_1 d n_b) = frac(2 d_0 z, delta_1) . $ <oc:marked-size>]
  We now confine every low-discrepancy difference column to edges inside a small set of base vertices.
    Deleting those row indices, together with the columns having large discrepancy,
    will leave a rectangle on which $F$ and $D$ agree.
  Close the marked set by adding a vertex whenever at least $\( delta_0 \/ 2 \)
    d_0$ incident edges lead to the set. If the initial set is empty it stays empty.
    Otherwise suppose its normalized size first reaches $w gt.eq 2 w_0$.
    A single addition is at most $1 \/ n_b lt.eq w_0$, so $w lt.eq 3 w_0$.
    Edges made internal by additions give internal edge fraction at least $\( delta_0 \/ 2 \) \( w - w_0 \)$.
    Mixing gives the upper bound $w^2 \/ 4 + lambda_0 w \/ 2$.
    Since $w gt.eq 2 w_0$, these inequalities imply $delta_0 lt.eq w + 2 lambda_0$.
    They are incompatible when $3 w_0 < delta_0 - 2 lambda_0$.
    For sufficiently small $z$, therefore, the final closure $T$ satisfies $\| T \| \/ n_b lt.eq 2 w_0$,
    with strict inequality when $w_0 > 0$. Every star outside $T$ still satisfies all checks on $F$,
    and fewer than $\( delta_0 \/ 2 \) d_0$ of its edges enter $T$.
  Fix a constant
  $ 0 < z_0 < delta_0 \( delta_0 \/ 2 - lambda_0 \) . $
  Consider a column whose discrepancy fraction is less than $z_0$.
    The difference between its $F$ and $D$ columns satisfies all checks outside $T$.
    An outside vertex incident to its support consequently has at least $delta_0
    d_0$ support edges in total and more than $\( delta_0 \/ 2 \) d_0$ support edges to other outside vertices.
    The left and right fractions of such outside vertices are each at most $z_0 \/ delta_0$,
    by counting their total support edges. If $a$ is their maximum fraction, mixing on the outside support would give
  $ \( delta_0 \/ 2 \) a lt.eq a \( a + lambda_0 \) \, wide a lt.eq z_0 \/ delta_0 < delta_0 \/ 2 - lambda_0 . $
  Thus $a = 0$. The difference column vanishes on every edge having an endpoint outside $T$.
  Delete the row indices corresponding to edges internal to $T$,
    and delete columns with discrepancy fraction at least $z_0$.
    The former fraction is at most $\| T \| \/ \( 2 n_b \) lt.eq w_0$,
    since each internal edge consumes two incidences in $T$, and the latter fraction is at most $z \/ z_0$.
    The two tables agree on the complementary rectangle. Choose a fixed $z_(*) > 0$,
    depending only on the base parameters, so small that for $z <
    z_(*)$ the closure inequality holds and each deleted fraction is less than $delta_1$.
    Puncturing either scalar local code to its retained coordinates is then injective by distance.
    Its inverse on the image is a scalar linear map. Lift the common rectangle in the B direction and then in the
    A direction. Applying scalar linear maps in one direction preserves the constraints in the other;
    hence the resulting table belongs to the full tensor code.
    By injectivity it agrees with every retained whole row of $F$ and every retained whole column of $D$.
    This gives (3.8) with $2 d_0 \/ delta_1 + 1 \/ z_0$ for $z < z_(*)$.
    For $z gt.eq z_(*)$, use the zero tensor table and the bound $2 lt.eq \( 2 \/ z_(*) \) z$.
    The maximum of these two constants is a suitable $C_0$. All lifting maps and all support counts act on joint
    vector entries, so no dimension factor occurs. ◻
]

We now fix, once and for all,

#[#set math.equation(numbering: n => "(3.10)")
 $ 0 < lambda lt.eq min { \( 8 C_0 \)^(- 1) \, delta_1 \/ 16 } . $ <oc:lambda-choice>]

Apply Lemma 9 to obtain an outer Cayley list of degree $D$. Choose $s_b$ to be a positive multiple of $D$.
  Then $d = d_0 s_b^2$ is divisible by $D$, so label the $d$ local coordinates by a balanced repetition of the
  outer list. This repetition changes neither averaging operator nor its norm.
  Use such lists $\( a_i \)_(i = 1)^d$ and $\( b_j \)_(j = 1)^d$ for the A and B directions.
  All of $d_0 \, c_0 \, lambda_0 \, delta_1 \, C_0 \, lambda \, s_b \, d$ are now fixed constants.
  We now specialize $J$; the field choice will not change these constants.

Choose an odd characteristic independently of the primes $p_a$ and independently of the characteristic-two
  translation group. Put $m = M_o$. Linnik’s theorem, for example the effective bound in
  #cite(label("Xylouris2011")) Theorem 1.1, supplies a prime

#[#set math.equation(numbering: n => "(3.11)")
 $ p equiv 1 med \( mod med m \) \, wide m < p lt.eq C_L m^L $ <oc:prime>]

for absolute constants $C_L \, L$. Searching integers and testing primality, even by trial division,
  takes polynomial time in $m$. Search the prime field for an element $zeta$ of exact order $m$;
  such an element exists because its multiplicative group is cyclic.
  Since $m$ is a power of two, testing $zeta^m = 1$ and $zeta^(m \/ 2) eq.not 1$ suffices. We will use

#[#set math.equation(numbering: n => "(3.12)")
 $ J = bb(F)_(p^4) . $ <oc:field>]

The proof below verifies that degree four supplies enough room for every simultaneous outer-code choice.
  One can find an irreducible quartic by enumeration and represent $J$ as its polynomial quotient.
  Field operations and the root $zeta$ then use $O \( log N \)$ bits and polynomial-in-$log
  N$ Boolean computations. Our fixed lower cutoff also ensures $p > m > \| H \|$,
  so both $m$ and $\| H \|$ are invertible in $J$.

=== 3.3 Twists and simultaneous systematic extension <oc:encoders-subsec>

There are four outer parts

$ V = Gamma times { 0 \, 1 } times { 0 \, 1 } . $

At $\( k \, s \, t \)$ a full slot stores a $d times d$ matrix $W_k^(s t)$ over a finite-dimensional $J$-space
  $U$, with columns in $C_A^s \( U \)$ and rows in $C_B^t \( U \)$. The A and B edges impose, respectively,

#[#set math.equation(numbering: n => "(3.13)")
 $ W_(a_i k)^(1 t) \( i \, j \) = alpha_i W_k^(0 t) \( i \, j \) \, wide W_(k b_j)^(s 1) \( i \, j \) =
   beta_j W_k^(s 0) \( i \, j \) . $ <oc:edge-equations>]

The maps $alpha_i \, beta_j$ are invertible $J$-linear maps on $U$, independent of $k \, s \, t$,
  and satisfy $alpha_i beta_j = beta_j alpha_i$ for every $i \, j$.
  An A edge of label $i$ transports the entire B-coded row $i$,
  while a B edge of label $j$ transports the entire A-coded column $j$. A reverse edge uses the inverse map.
  At their intersection the two transports give

$ W_k^00 \( i \, j \) & arrow.r^(med alpha_i med) & W_(a_i k)^10 \( i \, j \)\
beta_j arrow.b &  & arrow.b beta_j\
W_(k b_j)^01 \( i \, j \) & arrow.r^(med alpha_i med) & W_(a_i k b_j)^11 \( i \, j \) . $

Left and right multiplication on $Gamma$ commute, so the two routes reach the same index;
  commuting entry maps give the same entry value.

The scalar type has $U = J$ and identity twists. The programs in Section 4 will also need to multiply scalar data
  $v : Gamma arrow.r J$ by $\( - 1 \)^(e dot.op x)$ for a distinguished bit $e = e_a$.
  The matrix types below supply edge equations compatible with this operation.
  The programs will use them to retain one axis of code constraints while changing the other.
  For each of the three distinguished bits $e = e_a$, define a representation on the basis
  $\( upright(bold(e))_(t') \)_(t' in H)$ by

#[#set math.equation(numbering: n => "(3.14)")
 $ rho_e \( g \, u \) upright(bold(e))_(t') = \( - 1 \)^(\( u t' e \) dot.op g) upright(bold(e))_(u t') . $ <oc:rho>]

Its entries are signed permutation entries in the prime field.
  Indeed, for $k = \( g \, u \)$ and $k' = \( g' \, u' \)$,
  the exponent in $rho_e \( k \) rho_e \( k' \) upright(bold(e))_(t')$ is

$ \( u' t' e \) dot.op g' + \( u u' t' e \) dot.op g = \( u u' t' e \) dot.op \( g + u g' \) \, $

which proves multiplicativity. In a matrix type let $U = "Mat"_(\| H \|) \( J \)$ and independently choose each
  axis to be untwisted or to use

#[#set math.equation(numbering: n => "(3.15)")
 $ alpha_i D = rho_e \( a_i \) D \, wide beta_j D = D rho_e \( b_j \) . $ <oc:matrix-twists>]

Left and right matrix multiplication commute. Right multiplication in (3.15) specifies edge maps;
  no convention about its order as a group representation is needed.
  This gives at most $1 + 3 dot.op 4 = 13$ full types. Finite tuples, with arbitrary repetitions of these types,
  use direct sums of their entry spaces and block diagonal twists.

On either local-label graph, let the parity set consist of all edges with permutation number in $\[ 4 c_0 \]$.
  Its size and complement are

#[#set math.equation(numbering: n => "(3.16)")
 $ q_(upright("par")) = 4 c_0 s_b^2 \, wide I_A = \[ d \] \\ upright("A-parity set") \, wide
   I_B = \[ d \] \\ upright("B-parity set") . $ <oc:parity-set>]

Both systematic sets are nonempty; in fact they contain at least $3 d \/ 4$ labels.

#thm([Lemma 3.3.])[
  (Simultaneous systematic encoders).  #emph[One can choose the eight scalar check matrices over $J$ so that all
    their maximal minors are nonzero and every A and B one-axis system of the thirteen types above is
    systematically invertible. Precisely, arbitrary data at the systematic labels of part zero have a unique
    extension to both parts satisfying that axis’s local checks and edge equations.
    Consequently arbitrary data on $Gamma times I_A times I_B$ in part $\( 0 \, 0 \)$ have a unique full extension
    satisfying both axes, and the two orders of axis extension give the same answer.
    The matrices and the full encoders are deterministically constructible in polynomial time in $N$.
    These assertions continue to hold for arbitrary finite direct sums of the listed types,
    without any further field or check-matrix choices.]
] <oc:systematic>

#proof[
  Consider one A-axis system. Eliminate part-one variables with the A-edge equations.
    At each $k$, the two types of base-star checks in part zero contribute $2 c_0 s_b^2$ equations;
    those in part one contribute the same number after substitution.
    There are exactly $q_(upright("par")) = 4 c_0 s_b^2$ parity-label variables at part zero for each $k$,
    so the resulting parity system is square, also after scalarizing $U$.
    Its entries are linear polynomials in the entries of the four A check matrices.
  Its determinant polynomial is nonzero in the prime characteristic.
    For this purpose partition the $4 c_0$ parity permutation numbers into four disjoint sets of $c_0$ numbers,
    one for each pair consisting of an outer part and a base side.
    Specialize each associated check matrix to selectors of its set.
    For a fixed permutation number, every label-index edge occurs exactly once at the specified base side.
    At outer part zero its selected coordinate is unshifted; at part one it is pulled back through an invertible
    group shift and an invertible entry twist. Thus every scalarized parity coordinate is selected exactly once,
    up to an invertible block and a permutation. The specialized parity matrix is invertible.
    The same proof works for the B axis and for every allowed twist type.
    It does not require this selector specialization itself to have the desired maximal minors:
    it separately witnesses that each determinant is a nonzero polynomial.
    Each maximal-minor polynomial is also nonzero. Their product is nonzero because a polynomial ring over a field
    is an integral domain.
  Here is a degree bound that justifies this field choice without reference to any future number of slots.
    There are exactly
  #[#set math.equation(numbering: n => "(3.17)")
   $ 8 c_0 d_0 $ <oc:number-variables>]
  scalar indeterminates. Scalarizing a one-axis parity matrix gives dimension at most
  #[#set math.equation(numbering: n => "(3.18)")
   $ q_(upright("par")) \| Gamma \| dim_J U lt.eq q_(upright("par")) m \| H \|^3 lt.eq
     q_(upright("par")) m r^27 . $ <oc:parity-dimension>]
  Its determinant has degree at most this number. At most $2 \( 1 + 3 dot.op 4 \) =
    26$ axis systems cover every required type, with redundancies harmless.
    The product of the maximal minors of the eight check matrices has degree $8 c_0 binom(d_0, c_0)$.
    Thus the total degree is at most
  #[#set math.equation(numbering: n => "(3.19)")
   $ 26 q_(upright("par")) m r^27 + 8 c_0 binom(d_0, c_0) < m^3 . $ <oc:determinant-degree>]
  For the last inequality increase the fixed cutoff so that $r^27 lt.eq m$, $m gt.eq
    2 dot.op 26 q_(upright("par"))$, and $m^2 gt.eq 2 dot.op 8 c_0 binom(d_0, c_0)$.
    The first term is then at most $m^3 \/ 2$ and the second at most $m^2 \/ 2 < m^3 \/ 2$.
    The exponent three is independent of $s_b$; only the cutoff depends on the already fixed local degree.
  A nonzero polynomial of total degree less than a finite field’s cardinality cannot vanish on every tuple over
    that field. For completeness, view it as a polynomial in the last variable;
    by induction choose the other variables so that a nonzero leading coefficient remains nonzero,
    and then use the univariate root bound. Since $\| J \| = p^4 > m^3$, such a tuple exists in $J$.
    Enumerate all tuples of the fixed number (3.17) of field elements, testing maximal minors and parity ranks,
    until one succeeds. The field cardinality and every matrix dimension are polynomial in $N$,
    so this is a deterministic polynomial-time algorithm with a fixed exponent.
    A direct sum of already invertible parity systems is invertible with the direct sum of their inverses.
    It introduces no new polynomial condition, even when the number of slots grows with $N$.
  It remains to justify two-axis extension. Regard an A parity matrix as a matrix of operators on $U^Gamma$:
    each entry is a scalar combination of left translations and A twists.
    B entries are scalar combinations of right translations and B twists. They commute entrywise across axes.
    An invertible A parity matrix $L_A$ therefore intertwines the diagonal actions of any B-entry operator $T$ on
    its domain and codomain. From $L_A T = T L_A$ one obtains $L_A^(- 1) T = T L_A^(- 1)$,
    with the same indexed domain and codomain interpretation.
    Thus the operators making up either axis encoder commute with every entry operator of the other axis encoder,
    including its inverse parity solve.
  Start with the systematic rectangle at part $\( 0 \, 0 \)$.
    Extend along A for every systematic B column and then along B for every resulting A row.
    The second extension preserves all first-axis constraints by this commutation.
    Both encoders leave their systematic entries unchanged. Reversing their order gives the same map.
    Finally, one-axis uniqueness applied in both directions shows that a full word is uniquely determined by its
    systematic rectangle. Gaussian elimination computes these extensions in polynomial time in $N$,
    or in polynomial time in the total explicit input size for an arbitrary direct sum. ◻
]

For $v : Gamma arrow.r U$, give every systematic cell in part $\( 0 \, 0 \)$ the same value $v \( k \)$.
  Its full extension is denoted

#[#set math.equation(numbering: n => "(3.20)")
 $ E_(alpha \, beta) v \, $ <oc:encoder>]

or $E v$ when its type is specified. We call this the #emph[duplicated-payload] encoder.
  It is linear and injective, and its rate in field coordinates is exactly $1 \/ \( 4 d^2 \)$:
  its domain has $\| Gamma \| dim_J U$ coordinates and its stored word has $4 d^2 \| Gamma \| dim_J
  U$ coordinates. In the largest individual type the entry dimension is $\| H \|^2 lt.eq r^18$.
  Therefore one full slot occupies $"polylog" \( N \)$ bits at each of $\| Gamma \| =
  O \( N "polylog" N \)$ sites. Any fixed power of $log \( N + 2 \)$ slots preserves this size form.

#prodef([Remark 3.4.])[
  (Operator invariance).  The preceding inverse argument also justifies restriction to frequency orbits,
    as required by the local filling algorithms. Expand a function of $\( x \, u \)$ in the Walsh characters
    $\( - 1 \)^(nu dot.op x)$, using $m^(- 1)$ for the inverse transform over $J$.
    By (3.4), a left pull preserves each $x$-frequency, with a phase depending on $u$,
    whereas a right pull permutes frequencies by $H$. Constant entry twists do not change the frequency.
    For any $H$-orbit $O subset.eq G_0$, both the $O$-frequency subspace and its complementary frequency subspace
    are invariant under each parity operator. Its domain and codomain have equal dimensions on this subspace:
    the parity-label and check-label counts are both $q_(upright("par"))$.
    Global invertibility therefore implies invertibility of the restriction.
    Its scalar dimension is at most $q_(upright("par")) \| O \| \| H \| dim_J U lt.eq
    q_(upright("par")) \| H \|^4$, polynomial in $r$, so the restriction and its inverse can be computed by
    polynomial-in-$log N$ field operations. This is an algebraic consequence of the explicit parity matrices;
    it does not require reading unspecified global values of a word.
] <oc:orbit-invariance>

=== 3.4 Proximity and one-axis gaps <proximity-and-one-axis-gaps>

Write $"dist"_V$ for relative Hamming distance on the four-part vertex set $V$.
  When all four parts at the same $k$ are packed into one symbol, write $"dist"_Gamma$. For any two words,

#[#set math.equation(numbering: n => "(3.21)")
 $ "dist"_V lt.eq "dist"_Gamma lt.eq 4 "dist"_V . $ <oc:packing-metric>]

An #emph[A-only word] retains the A local constraints and A agreements at all four parts;
  any other label indices and any collection of slots are regarded as coordinates of a single row symbol.
  No B validity or B agreement is asserted. Define B-only words symmetrically.

For a tuple of full slots a local check rejects when any component fails its scalar local checks,
  and an edge is conflicting when any slot fails its agreement on the whole row or column carried by that edge.
  In particular, a growing tuple does not enlarge the set of address maps or cause separate per-slot error charges.

#thm([Lemma 3.5.])[
  (Full-code proximity).  #emph[There are fixed $theta_(*) > 0$ and $K_(*) <
    oo$ such that the following holds for every finite tuple of allowed full types and every received word.
    Check local validity and all A and B agreements at a uniformly random packed center,
    rejecting if any check there fails. If the rejection fraction is $theta lt.eq theta_(*)$,
    the word is at packed distance at most $K_(*) theta$ from a word satisfying every local and edge constraint.
    The constants are independent of the tuple length, the field size, and the entry dimensions.
    Duplicated-payload constraints are addressed separately below.]
] <oc:full-proximity>

The proof uses the decreasing-disagreement method of #cite(label("DEL+2022")) Section 4.2,
  Algorithm 1 and Propositions 4.7–4.8. We prove the version for joint tuples with commuting twists needed here.

#proof[
  First replace every locally invalid whole tuple at a vertex by zero.
    There are at most $theta \| V \|$ such vertices. Initially at most $d theta \|
    V \|$ undirected edges conflict, and this replacement creates at most $2 d theta \| V \|$ further conflicts.
    Starting with this locally valid word, repeatedly replace a whole vertex by a locally valid tuple whenever
    that strictly decreases its number of incident conflicting edges.
    The total integer conflict count strictly decreases, so at most $3 d theta \| V \|$ replacements occur.
    This argument establishes existence and termination; it is not asserted to be an efficient search through the
    alphabet. At most $\( 1 + 3 d \) theta \| V \|$ vertices have been touched,
    and the final conflict count is no larger than the count before the replacements.
  At a stable vertex $v$, let $p_A \( v \) \, p_B \( v \)$ be the fractions of its A and B edges that conflict,
    and put $p \( v \) = p_A \( v \) + p_B \( v \)$ and $mu = bb(E)_V p$.
    Neighbors across A edges suggest rows, transported by the appropriate twist or inverse twist.
    They are valid B-code rows. Neighbors across B edges similarly suggest valid A-code columns.
    At cell $\( i \, j \)$ these suggestions agree unless at least one of the two opposite square edges conflicts:
    the common far corner and commuting twists supply the equality when both opposite edges agree.
    If $P_A \, P_B$ average over the respective neighbor maps,
    their cell-disagreement fraction is at most $P_A p_B \( v \) + P_B p_A \( v \)$.
    Lemma 10 gives a local replacement whose incident conflict fraction is at most $C_0$ times this number.
    Stability therefore gives pointwise
  #[#set math.equation(numbering: n => "(3.22)")
   $ p lt.eq C_0 \( P_A p_B + P_B p_A \) lt.eq C_0 \( P_A p + P_B p \) . $ <oc:stability>]
  All norms and inner products in this proof use uniform normalized counting measure on $V$.
    Let $macron(p)$ be the function equal to the mean of $p$ on each of the four parts.
    Nonnegativity gives $parallel macron(p) parallel_2 lt.eq 2 mu$.
    Each neighbor operator permutes the part means and has norm at most $lambda$ on their orthogonal complement.
    Consequently (3.22) implies
  $ parallel p parallel_2 lt.eq 2 C_0 \( 2 mu + lambda parallel p parallel_2 \) \, wide
    parallel p parallel_2 lt.eq C_1 mu \, quad C_1 = 8 C_0 \, $
  by (3.10). This bound has no dependence on $d$.
  Fix an A label $i$, let $S_i$ be the vertices whose incident A edge of that label conflicts, and let $p_i =
    Pr_V \( S_i \)$. At such an edge the difference of its two transported rows is a nonzero B-codeword,
    so it has at least $delta_1 d$ nonzero cells. In each corresponding B direction,
    either a B edge conflicts at one A endpoint or an $i$-label A edge conflicts at the opposite B neighbor.
    The involution exchanging the two A endpoints preserves $S_i$.
    Averaging this implication, and then subtracting the four part means in the mixing term, yields
  #[#set math.equation(numbering: n => "(3.23)")
   $ delta_1 p_i & lt.eq 2 bb(E)_V \[ 1_(S_i) p_B \] + chevron.l 1_(S_i) \, P_B 1_(S_i) chevron.r\
 & lt.eq 2 bb(E)_V \[ 1_(S_i) p_B \] + 4 p_i^2 + lambda p_i . $ <oc:conflict-propagation>]
  Indeed, the squared norm of the four part means of $1_(S_i)$ is at most $4 p_i^2$,
    and the squared norm of its remaining part is at most $p_i$. Also $p_i lt.eq d mu$.
    For sufficiently small $mu$, depending on the now fixed $d$, we have $4 d mu + lambda < delta_1 \/ 2$.
    Average (3.23) over $i$ and repeat the argument with A and B exchanged. It follows that
  #[#set math.equation(numbering: n => "(3.24)")
   $ \( delta_1 \/ 2 \) mu lt.eq 4 bb(E)_V \[ p_A p_B \] lt.eq 4 bb(E)_V \[ p^2 \] lt.eq
     4 C_1^2 mu^2 . $ <oc:stable-zero>]
  If $0 < mu < delta_1 \/ \( 8 C_1^2 \)$ this is impossible.
    Since the initial zeroing left at most $3 d theta \| V \|$ conflicts, stability has $mu lt.eq 6 theta$.
    For example, choose $theta_(*)$ so that $6 theta_(*) < min { delta_1 \/ \( 32 d \) \,
    delta_1 \/ \( 16 C_1^2 \) }$. Then $mu = 0$. The final word is exact, and (3.21) gives $K_(*) =
    4 \( 1 + 3 d \)$ as a permissible proximity constant for this normalization.
    Common scalar local checks, block diagonal twists, and joint conflict events justify every step for an
    arbitrary tuple without a slot-count factor. ◻
]

#thm([Lemma 3.6.])[
  (One-axis distance and exact comparisons).  #emph[Let $Delta_A = \( delta_1 - lambda \) \/ 4 > 0$.
    Every nonzero A-only or B-only word with the specified local constraints and invertible twists has relative
    vertex support at least $Delta_A$ on $V$. The same holds for differences of two words with the same axis
    constraints, and for arbitrary finite joint tuples. It also holds for full words.]
  #emph[Among exact full words, the duplicated-payload condition has a fixed gap under the following checks:
    at $s = 0$, compare all systematic A rows as whole rows, at both values of $t$; at $t = 0$,
    compare all systematic B columns as whole columns, at both values of $s$.
    If any payload is not duplicated, the packed-center rejection fraction is at least $Delta_A$.
    The tests accept every word $E v$.]
  #emph[More generally, suppose an expression $X$ and a full target $Y = E v$ both obey the same A constraints,
    and the systematic rectangle of $X$ is duplicated with payload $w$.
    Equality of their whole systematic B columns at $t = 0$, including both $s$ parts, holds if and only if $v =
    w$. If $v eq.not w$, the comparison rejects at least a $Delta_A$ fraction of packed centers.
    The symmetric assertion holds for a shared B axis and comparisons of whole systematic A rows at $s = 0$.
    No constraint on the other axis of $X$ is needed.]
] <oc:one-axis>

#proof[
  For one A slice with fixed $t$, a nonzero vertex has at least $delta_1 d$ nonzero row symbols by local distance.
    Each is carried to a nonzero symbol at its opposite endpoint, because twists are invertible.
    If $l \, u$ are the two vertex-support fractions and $a = max \( l \, u \)$,
    the fraction $e$ of nonzero carried edges obeys
  $ delta_1 a lt.eq e lt.eq l u + lambda sqrt(l u) lt.eq a \( a + lambda \) . $
  Thus $a gt.eq delta_1 - lambda$. Support on these two parts is at least $\( delta_1 - lambda \) \/
    2$ in their own normalization and at least $Delta_A$ in the four-part normalization.
    At least one slice is nonzero. The argument for B, differences, and joint entries is identical.
  For two systematic A row labels, their difference at $s = 0$, considered over both $t$ parts and all $k$,
    is a B-only word: the scalar B checks and B twists are the same for both rows.
    If nonzero it has the distance just proved. Differences between systematic B columns are A-only words.
    A nonduplicated systematic rectangle contains two unequal entries connected either by a change of its A label
    or a change of its B label, so one of these comparisons is nonzero.
    Conversely, for a duplicated payload, B-axis uniqueness extends the same systematic row data identically at
    every systematic A label, and A-axis uniqueness does the analogous thing for columns.
  For the last assertion, if $v = w$, A-axis uniqueness identifies the two whole columns at every systematic B
    label. If $v eq.not w$, a systematic payload cell differs somewhere,
    so one of the compared column differences is a nonzero A-only word and has support at least $Delta_A$.
    The B-sharing assertion is proved in the same way. These comparisons use whole one-axis codewords,
    which is why an arbitrary localized payload disagreement has a constant exact gap. ◻
]

The next estimate will control a growing tuple of A-only scratch slots against one exact reference.
  It uses the tuple’s joint edge conflicts, with no factor for its number of components.

#thm([Lemma 3.7.])[
  (One-axis near-code estimate).  #emph[Let $W$ and $V_0$ be locally A-valid joint tuples on $V$,
    and suppose $V_0$ has exact A agreement with the same twists as $W$.
    Let $p = "dist"_V \( W \, V_0 \)$ and let $z_A$ be the A-edge conflict fraction of $W$,
    normalized as the probability that a uniform vertex and a uniform A label give a conflict. Then
#[#set math.equation(numbering: n => "(3.25)")
 $ delta_1 p lt.eq z_A + 4 p^2 + lambda p . $ <oc:near-code-inequality>]

 In particular, if $p lt.eq delta_1 \/ 16$, then $p lt.eq 2 z_A \/ delta_1$.
   Both statements hold for every finite tuple of A-only and full slots, uniformly in its size.
   They also hold with A and B exchanged.]
] <oc:near-code>

#proof[
  Let $S$ be the joint vertex-disagreement set. At each vertex in $S$,
    local distance gives at least $delta_1 d$ nonzero difference rows.
    For each corresponding label, either the other endpoint also lies in $S$,
    or agreement of $V_0$ forces an actual conflict of $W$. Consequently
  $ delta_1 p lt.eq z_A + chevron.l 1_S \, P_A 1_S chevron.r lt.eq z_A + 4 p^2 + lambda p \, $
  by the four-part mixing bound used above. For $p lt.eq delta_1 \/ 16$ and (3.10), $4 p + lambda < delta_1 \/ 2$,
    giving the stated rearrangement. The proof concerns one fixed received word and one joint reference.
    It can be applied to successively larger prefixes of a tuple without modifying the received word or
    accumulating a number-of-prefixes loss. ◻
]

We also allow a clock or control tuple repeated identically at every $k$.
  For any received tuple, let its distinct-value class proportions be $u_j$.
  Equality across an expanding symmetric A list has probability at most

#[#set math.equation(numbering: n => "(3.26)")
 $ sum_j u_j^2 + lambda (1 - sum_j u_j^2) . $ <oc:clock-gap>]

This follows by applying the mean-zero bound to each class indicator and summing.
  If the equality rejection is $eta$, then $1 - max_j u_j lt.eq 1 - sum_j u_j^2 lt.eq eta \/ \( 1 - lambda \)$.
  Thus a small rejection fraction implies proximity to one constant tuple, irrespective of its bit length.

Use unique bit representations of field elements and canonical zero padding.
  At a packed center check parsing, ranges, and padding. Replace a malformed symbol by a fixed parsable default
  when reasoning from acceptance. If all checks read from one fixed finite list $Pi$ of permutation addresses,
  modifying a set of $u \| Gamma \|$ symbols can change their center outcomes on at most $\| Pi \| u \|
  Gamma \|$ centers, by taking the union of inverse images.
  This applies even when many slots are checked together or branches use only subsets of the list.
  Combining this observation with Lemma 13, (3.26), and the duplicated-payload gap of Lemma 14 gives proximity to
  exact duplicated full encodings and a repeated clock whenever the total packed rejection is sufficiently small.
  Indeed, the one-time repair changes only $O \( theta \)$ centers and hence leaves duplication rejection
  $O \( theta \)$; choose its threshold below the fixed exact gap.
  Any required public range for a corrected clock is likewise enforced,
  since a constant illegal value fails its local range test everywhere.
  These constants may depend on the fixed address-list size, but not on the slot count.

#thm([Theorem 3.8.])[
  (Outer-code interface).  #emph[There exist fixed constants $d$, $delta_1 > 0$, $C_0 < oo$, $lambda > 0$,
    $theta_(upright("out")) > 0$, and $K_(upright("out")) < oo$, with $lambda lt.eq min { \( 8 C_0 \)^(- 1) \,
    delta_1 \/ 16 }$, having the following uniform properties for every input length $N$ and its padded tape
    length $h = O \( N \)$, after the fixed padding in (3.1).]
  + #emph[The group $Gamma = bb(F)_2^r times.r H$ has $\| Gamma \| lt.eq M_o r^9 = O \( N "polylog" N \)$,
    where $M_o = 2^r = O \( N \)$. Its A and B label lists are symmetric, of degree $d$,
    and have mean-zero norm at most $lambda$. There is a field $J = bb(F)_(p^4)$ with $p > M_o > \| H \|$,
    $p equiv 1 med \( mod med M_o \)$, and a primitive $M_o$-th root $zeta in bb(F)_p$.
    All public group and field data and the common scalar check matrices are deterministically constructible in
    polynomial time in $N$, and the data needed at an index have $"polylog" \( N \)$ size and Boolean computation cost.]
  + #emph[Each of the scalar and three matrix-representation families,
    with either axis independently twisted or untwisted as specified in (3.15),
    has the simultaneous systematic encoder (3.20). Arbitrary systematic rectangle data extend uniquely;
    the A and B extensions commute. Duplicated payload encoding is injective, linear,
    and has rate $1 \/ \( 4 d^2 \)$ in field coordinates. A full slot has $"polylog" \( N \)$ bits per packed
    site. Arbitrary finite tuples reuse the same checks and inverses.]
  + #emph[The local distance and tensor-agreement statement of Lemma 10 holds uniformly in field size and joint
    vector dimension. Local validity, edge agreement, and duplicated-payload comparisons have perfect
    completeness. For every finite tuple of full slots, if their joint packed-center rejection fraction is $theta
    lt.eq theta_(upright("out"))$, their packed distance to a tuple of exact duplicated encodings is at most
    $K_(upright("out")) theta$. Canonical parsing and a repeated control tuple can be included with the same form
    of conclusion, changing only the fixed constants.]
  + #emph[The one-axis distance and shared-axis comparison gaps of Lemma 14 hold with
    $Delta_A = \( delta_1 - lambda \) \/ 4$. For every actual and reference joint tuple satisfying the hypotheses
    of Lemma 15, $delta_1 p lt.eq z_A + 4 p^2 + lambda p$ and, when $p lt.eq delta_1 \/ 16$, $p lt.eq
    2 z_A \/ delta_1$. A-only slots require no B constraints for these conclusions.
    The symmetric B assertions hold as well.]
  #emph[All constants are independent of $N$ and of the number of later program slots.
    The field search has only $8 c_0 d_0$ indeterminates, at most $26$ parity determinant factors,
    and total degree less than $M_o^3$; in particular it causes no feedback into $C_0$, $lambda$, or $d$.]
] <thm:outer-codes>

#proof[
  Parts (i) and (ii) follow from Lemmas 9 and 11, the field construction, and the coordinate count after (3.20).
    Part (iii) is Lemma 10, Lemma 13, and the parsing and exact-gap argument following (3.26).
    Decrease $theta_(upright("out"))$ and increase $K_(upright("out"))$ once to cover those fixed costs.
    Part (iv) is Lemmas 14 and 15. The degree and dependency assertions are (3.17)– (3.19) and the parameter order
    fixed in (3.10). No external local-testability theorem is used for these specialized conclusions. ◻
]

=== 3.5 Correction with value-independent uncertainty supports <correction-with-value-independent-uncertainty-supports>

The next guarantee is stronger than correction of a single fixed word.
  It tracks a set on which values are wholly unspecified, and therefore applies to separate bounded-cone
  simulations with different choices on that set.

#thm([Lemma 3.9.])[
  (Outer uncertainty shrinkage).  #emph[Fix the data in Theorem 16,
    and any finite tuple of full or A-only slots with their allowed A twists.
    Optionally include a control tuple constant over $Gamma$ and canonical padding.
    There is a deterministic synchronous local correction map $cal(C)$ with the following property.
    Let $V_0$ be any reference word satisfying all A local constraints and A agreements,
    with constant control and canonical parsing. Let $S subset.eq
    Gamma$ and let $W$ be any input equal to $V_0$ outside $S$, with arbitrary values or malformed symbols on $S$.
    Then $cal(C) W = V_0$ outside
#[#set math.equation(numbering: n => "(3.27)")
 $ S' = {k : 1 / d \# { i : a_i k in S } gt.eq delta_1 \/ 2} med union med {k : 1 / d \# { i :
   a_i^(- 1) k in S } gt.eq delta_1 \/ 2} . $ <oc:uncertainty-set>]

 In particular, $S'$ depends on $S$ alone. If $u = \| S \| \/ \| Gamma \| < delta_1 \/ 4$, then
#[#set math.equation(numbering: n => "(3.28)")
 $ frac(\| S' \|, \| Gamma \|) lt.eq frac(2 lambda^2 u, \( delta_1 \/ 2 - u \)^2) lt.eq
   u \/ 2 . $ <oc:uncertainty-shrink>]

 The local map uses a fixed number of permutation addresses and time polynomial in the symbol bit length and the
   public local-parameter length, with total default behavior on arbitrary inputs.]
  #emph[For every fixed integer $q gt.eq 0$, the $q$-round map has a bounded input cone consisting of fixed
    permutations of its target; the bound may depend on $q$ but not on $N$.
    For an arbitrary initial $S$, the recursively defined supports contain the errors simultaneously for all
    completions on $S$. If $\| S \| \/ \| Gamma \| < delta_1 \/ 4$,
    their densities are at most $2^(- q) \| S \| \/ \| Gamma \|$ after $q$ rounds.
    Different target-cone simulations may use different such completions,
    provided each simulation assigns one consistent initial value to every address repeated within that cone.
    Under this small-initial-support hypothesis, $O \( log \| Gamma \| \)$ rounds correct the whole word exactly
    in time polynomial in its explicit size and $N$.]
] <lem:outer-uncertainty>

#proof[
  At a target part $\( k \, 0 \, t \)$, take the row of label $i$ from $\( a_i k \, 1 \, t \)$ and apply
    $alpha_i^(- 1)$. At $\( k \, 1 \, t \)$, take it from $\( a_i^(- 1) k \, 0 \, t \)$ and apply $alpha_i$.
    Combine all other indices and all slots into one row-symbol vector.
    Decode these $d$ row suggestions in $C_A^s$ up to strictly fewer than $delta_1 d \/ 2$ joint row errors.
    There is at most one such local word by the distance in Lemma 10.
    A total deterministic implementation enumerates all subsets $T subset.eq \[ d \]$ with $\| T \| > d -
    delta_1 d \/ 2$, solves the local scalar constraints together with the suggested values on $T$ componentwise,
    and verifies that the candidate has fewer than $delta_1 d \/ 2$ joint row errors.
    Such a puncturing is injective by local distance, so each consistent system gives at most one candidate.
    If the distance promise holds, the set of all correct suggestions is one enumerated $T$ and gives the required
    word. Return zero if no candidate passes. Malformed neighbor symbols are first replaced by the fixed parsable
    default. Restore each control bit by majority on the forward A-neighbor list, with fixed tie behavior,
    and write canonical padding.
  If $k in.not S'$, each relevant list contains fewer than $delta_1 d \/ 2$ positions of $S$.
    Every other row suggestion equals the corresponding row of $V_0$, by its exact A agreement.
    Thus the local decoder recovers all four reference parts and all slots jointly.
    The same good-neighbor count is strictly below $d \/ 2$, so control majorities are also correct.
    This proves the support containment for every assignment of values on $S$.
  For either forward or inverse averaging operator $P$ on $Gamma$, the mean-zero bound gives
  $ bb(E)_k \( P 1_S \( k \) - u \)^2 lt.eq lambda^2 u \( 1 - u \) lt.eq lambda^2 u . $
  When $u < delta_1 \/ 4$, Chebyshev’s inequality at threshold $delta_1 \/ 2 -
    u > 0$ and a union bound for the two lists prove the first inequality in (3.28).
    Its right side is then at most $32 lambda^2 u \/ delta_1^2 lt.eq u \/ 2$ by (3.10).
  Iterate the deterministic operation on supports in (3.27).
    The preceding reasoning holds for every completion at each step,
    so the same iterated supports contain all possible errors.
    A depth-$q$ dependency cone is obtained by composing at most $q$ forward or inverse A moves,
    with the finite part and slot bookkeeping. For fixed $q$ this is a fixed finite list of permutations.
    A consistent assignment to repeated initial addresses in one cone extends to a global initial word agreeing
    with $V_0$ outside $S$. Applying the global support statement to that extension proves the claimed result for
    that cone. This argument can use a different global extension for each target.
  Assume now $\| S \| \/ \| Gamma \| < delta_1 \/ 4$. Every iterated support stays in this regime,
    so its integer cardinality decreases by a factor of at least two while nonempty.
    More than $log_2 \| Gamma \|$ rounds make it zero. Running these rounds synchronously on the complete array
    uses $O \( \| Gamma \| log \| Gamma \| \)$ local calls, each of polynomial bit complexity as established
    above. This proves polynomial-time global correction without using the existential greedy repair in Lemma 13
    as an algorithm. ◻
]

== 4 Certified programs and persistent tape equations <sec:outer-programs>

We turn local code constraints into certificates for computations on the tape.
  This section supplies local reversible filling (Lemma 21) and a persistent tuple of tape equations (Lemma 22);
  Section 5 will assemble them into the evolving representation.

We retain the outer notation of Sections 2 and 3: $h = 2^ell$, $M_o = 2^r$, the odd-characteristic field $J$,
  the group $Gamma = bb(F)_2^r times.r H$, and coordinates $k = \( g \, u \) = \( u x \, u \)$.
  In particular $r = O \( log N \)$, $\| H \| lt.eq r^9$, and a field element has $O \( log N \)$ bits.
  All constants and polynomial exponents in this section are fixed independently of $N$.
  The local star degree $d$ is a constant. We pack the four parts $\( s \, t \) in { 0 \,
  1 }^2$ at one $k$ into one symbol; “part distance” instead normalizes over the four parts separately.
  These distances differ by at most a factor of four.

There are two kinds of storage. A #emph[full slot] has both axis constraints and duplicated systematic payload,
  and thus equals $E_(alpha \, beta) v$ for a unique payload $v : Gamma arrow.r U$.
  An #emph[A-only scratch slot] has the same local A constraints and A-edge agreements,
  but its other labels and entry coordinates are merely vector coordinates: no B condition is imposed.
  Keeping all intermediate certificates, rather than just the values being computed,
  will let us certify a computation at every point of a reversible schedule.

=== 4.1 Full operations and a fixed query list <full-operations-and-a-fixed-query-list>

#prodef([Definition 4.1.])[
  (Certified full operation).  A full operation specifies parent full slots,
    a target encoder $E_(upright("out"))$, and a local expression $X_k^(s t) \( i \, j \)$ in the parents.
    For arbitrary exact duplicated full parents, $X$ must have duplicated systematic payload $v$ and satisfy an
    allowed A-axis constraint system. In addition, either its A system is that of the target,
    or $X$ satisfies the target’s B system. The required target is $E_(upright("out")) v$.
    Scalar coefficients in linear combinations are identical at every index.
    They may depend on an identical clock and on previously certified, completed public address data.
    The specified covariant primitive $W \( k \) mapsto W \( k \)
    rho_e \( k \)$ below may additionally use its explicit index-dependent public matrix;
    it must satisfy the same axis-constraint requirements on $X$.
] <op:full-operation>

In the first case compare $X$ and the target on all systematic B columns at $t = 0$,
  retaining every entry in each such column at both A parts.
  In the second case compare all systematic A rows at $s = 0$, retaining their entire rows at both B parts.
  The one-axis uniqueness and distance in Theorem 16 give a constant $gamma_(upright("op")) >
  0$ with the following alternative: the required payload identity is true and all comparisons hold,
  or these comparisons fail on at least $gamma_(upright("op"))$ of the centers.
  Indeed, equality of payloads fixes each compared column or row by the shared one-axis extension.
  If a payload differs, at least one compared column or row is a nonzero codeword difference for that axis,
  so its vertex support has constant density. The number of labels and parts is fixed.
  A comparison of isolated systematic cells would not have this implication.

We use the following full operations, splitting sums into bounded-arity stages whenever necessary.

+ Scalar linear combinations and right pulls $R_b F \( k \) = F \( k b \)$ share the scalar A system.
  Elementary pulls are the identity, the three first-bit translations $\( e_a \, 1 \)$,
  and one-step Singer-cycle rotations of each block and their inverses.
+ A matrix payload can be reencoded while changing only one axis type, using the other as the shared axis.
  Constant linear maps and contractions of fully untwisted entry alphabets also give full operations.
+ To multiply a payload by a one-bit Walsh character, we must also certify the resulting full encoding.
  An index-dependent scalar multiplier need not preserve the scalar edge equations.
  The matrix representation supplies a shared-axis route through the twisted types.
  Starting from an untwisted scalar slot $W$, form
  $ X_k^(s t) \( i \, j \) = W_k^(s t) \( i \, j \) rho_e \( k \) \, $
  where $e$ is a distinguished first bit of a block and $rho_e$ is the representation of Section 3.
    Multiplicativity gives
  $ X_(a_i k)^(1 t) \( i \, j \) = rho_e \( a_i \) X_k^(0 t) \( i \, j \) \, wide X_(k b_j)^(s 1) \( i \, j \) =
    X_k^(s 0) \( i \, j \) rho_e \( b_j \) . $
  Scalar local checks continue to hold, since the same entry matrix multiplies every local scalar.
    Reencode first with twisted A and untwisted B, sharing A, and then with both axes untwisted, sharing B.
    The column of $rho_e \( g \, u \)$ indexed by $1_H$ has just one nonzero entry, in row $u$,
    equal to $\( - 1 \)^(\( u e \) dot.op g) = \( - 1 \)^(e dot.op x)$.
    Summing this entry-alphabet column therefore produces the full scalar encoding of $\( - 1 \)^(e dot.op x)
    v_W \( k \)$. The contraction is on entry coordinates, not on outer star labels.

Every intermediate matrix slot in this construction has a specified homogeneous linear payload recipe.
  An arbitrary multiplier depending on one bit, with values $a_0 \, a_1 in J$, is $1 / 2 \( a_0 + a_1 \) I + 1 /
  2 \( a_0 - a_1 \) M_e$, where $M_e f \( x \, u \) = \( - 1 \)^(e dot.op x)
  f \( x \, u \)$ is the corresponding modulation. The divisions by two are valid because $J$ has odd characteristic.

Right rotations move these operations to any bit in a block. For a block rotation $v$ the pull convention gives

$ R_(\( 0 \, v \)) R_(\( e \, 1 \)) R_(\( 0 \, v^(- 1) \)) = R_(\( v e \, 1 \)) . $

Conjugating the modulation in the same way gives the modulation of bit $v e$.
  A power of a rotation is implemented as a sequence of single rotations,
  returning to the original layout after the operation. Thus an arbitrary bit operation costs $O \( r \)$
  elementary full stages, without introducing new query maps.

Fix once and for all a permutation list $Pi$ containing identity,
  the required forward and inverse A and B neighbor maps, left pulls by a fixed generating list of $H$,
  the elementary right pulls above, and right pulls by a fixed generating list of $H$ and its inverses.
  Include any bounded compositions used in a local expression.
  Its cardinality $q = \| Pi \|$ is independent of $N$. All constraints of all slots are checked together at a
  center using the symbols at $Pi \( k \)$. A growing number of slots consequently increases local computation and
  symbol size, but not the number of queried positions. In particular a single false exact full operation retains
  the gap $gamma_(upright("op"))$, rather than having its gap divided by the program length.

=== 4.2 Scalar transforms with certified stages <scalar-transforms-with-certified-stages>

#thm([Lemma 4.2.])[
  (Scalar program library).  #emph[On scalar tables indexed by $x in bb(F)_2^r$,
    the full operations above give homogeneous linear programs of $"poly" \( r \)$ stages for:
    bit-conjunction and interval masks; controlled bit flips and bit permutations; integer cyclic shifts;
    discrete Fourier transforms and their inverses of lengths $M_o$ and $h$; the Walsh transform;
    and cyclic coefficient multiplication by any systematic Lagrange polynomial $L_j$, $0 lt.eq j < h$.
    The last operation is uniform also when $j$ is supplied by already identical address bits.
    All intermediate stages are full slots with fixed encoder types and query maps in $Pi$.]
] <op:scalar-programs>

#proof[
  A bit-conjunction mask is a product of one-bit masks, applied in sequence.
    For the integer interval $\[ 0 \, a \)$ with $0 lt.eq a lt.eq M_o$, represent $a$ by $r +
    1$ public or already identical control bits. Use the zero operator for $a = 0$ and the identity for $a = M_o$.
    For $0 < a < M_o$, use the disjoint prefix rectangles obtained by specifying the most significant differing
    bit: at a position where $a$ has bit one, match its more significant bits and require the current bit to be
    zero. There are at most $r$ rectangles. More explicitly, writing $a_r$ for the endpoint bit,
    one fixed padded program applies the mask
  $ a_r + \( 1 - a_r \) sum_(i = 0)^(r - 1) a_i thin 1 \[ x_i = 0 \] product_(j = i + 1)^(r - 1) 1 \[ x_j = a_j \] . $
  All endpoint decisions and rectangle coefficients are identical at every index;
    the program keeps all candidate stages and uses scalar coefficient selection,
    so its topology and polynomial size do not depend on $a$. Differences of two such masks give arbitrary intervals.
  Let $m$ be the indicator of a conjunction not involving bit $i$.
    The pullback of the permutation that flips bit $i$ precisely when $m = 1$ is
  #[#set math.equation(numbering: n => "(4.1)")
   $ f - m f + R_(\( e_i \, 1 \)) \( m f \) . $ <op:controlled-flip>]
  To verify this, if $m \( x \) = 0$ then $m \( x + e_i \) = 0$, and the result is $f \( x \)$; if $m \( x \) =
    1$ then $m \( x + e_i \) = 1$, and the result is $f \( x + e_i \)$.
    The independence of $m$ from the flipped bit is essential here.
    Three controlled XOR operations exchange two index bits, so they implement bit reversal and any prescribed bit
    permutation.
  For an integer subtraction of $2^j$ modulo $2^r$, flip bit $i > j$ when the original bits $j \, dots.h \, i -
    1$ are all zero, and flip bit $j$ unconditionally. Process the higher bits in descending order;
    then none of the bits used by a condition has yet changed. The addition rule uses ones instead of zeros.
    Pullbacks reverse the chronological composition of index permutations:
    thus the table stages apply these borrow gates in ascending bit order,
    the reverse of their descending index-permutation order. This implements the desired cyclic table shift.
    A conjunction uses $O \( r \)$ bit operations, so this procedure is polynomial in $r$.
  For the Fourier transform we realize the radix-two Cooley–Tukey decomposition #cite(label("CooleyTukey1965"))
    pp. 299–300 by the certified full operations above. Let $D = 2^v in { h \, M_o }$ and let $xi =
    zeta^(M_o \/ D)$ have order $D$. The transform acts on the low $v$ integer bits,
    independently within each block of fixed higher bits, and is
  #[#set math.equation(numbering: n => "(4.2)")
   $ cal(F)_D \( f \) \( y \) = sum_(z = 0)^(D - 1) xi^(y z) f \( z \) . $ <op:dft>]
  First reverse these $v$ bits. At level $j$, pair positions separated by XOR of bit $j -
    1$ in each aligned window of length $2^j$. Writing $a < 2^(j - 1)$ for the offset and $U \,
    V$ for the lower and upper entries, replace the pair by
  #[#set math.equation(numbering: n => "(4.3)")
   $ U + xi^(a D \/ 2^j) V \, wide U - xi^(a D \/ 2^j) V . $ <op:butterfly>]
  The factor is a product of one-bit factors, since if $a = sum_(i < j - 1) 2^i a_i$, then $xi^(a D \/ 2^j) =
    product_(i < j - 1) \( xi^(2^i D \/ 2^j) \)^(a_i)$. Half-window masks, the bit pull, these factors,
    and addition implement the displayed rule. The identity
  $ sum_(z = 0)^(D - 1) xi^(y z) f \( z \) = sum_(z = 0)^(D \/ 2 - 1) \( xi^2 \)^(y z) f \( 2 z \) +
    xi^y sum_(z = 0)^(D \/ 2 - 1) \( xi^2 \)^(y z) f \( 2 z + 1 \) $
  proves the algorithm by induction, with bit reversal placing the recursive even and odd subproblems in the
    required order. More explicitly, if $"rev"_a$ reverses $a$ bits, after level $j$ the entry at $b 2^j + y$,
    $0 lt.eq y < 2^j$, is
  $ sum_(z = 0)^(2^j - 1) \( xi^(D \/ 2^j) \)^(y z) f #scale(x: 120%, y: 120%)[\(] "rev"_(v - j) \( b \) +
    2^(v - j) z #scale(x: 120%, y: 120%)[\)] . $
  The level-$j$ butterfly combines the even and odd values of $z$ in the level-$\( j - 1 \)$ formula,
    proving this invariant from the bit-reversed input at level zero; at level $v$ it is (4.2).
    Using $xi^(- 1)$ and multiplying by $D^(- 1)$ gives the inverse:
    $sum_(y = 0)^(D - 1) xi^(y \( z - z' \)) = D thin 1 \[ z = z' \]$.
    Without initial bit reversal, apply the sum/difference butterflies directly to the input table,
    one coordinate bit at a time, and use no twiddle factors. This gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ cal(W) \( f \) \( x \) = sum_y \( - 1 \)^(x dot.op y) f \( y \) . $ <op:walsh>]
  They can be applied on all $r$ bits or just a specified block.
    The Walsh inverse is $M_o^(- 1) cal(W)$ when all bits are used.
  Finally set $omega = zeta^(M_o \/ h)$ and
  #[#set math.equation(numbering: n => "(4.5)")
   $ L_j \( Z \) = h^(- 1) sum_(a = 0)^(h - 1) omega^(- j a) Z^a . $ <op:lagrange>]
  The root sum just used gives $L_j \( omega^i \) = 1 \[ i = j \]$.
    For a length-$M_o$ coefficient table $F$, cyclic multiplication by $L_j$ has coefficient at $w$ equal to
  #[#set math.equation(numbering: n => "(4.6)")
   $ h^(- 1) omega^(- j w) sum_(a = 0)^(h - 1) F_(w - a) omega^(j \( w - a \)) \, $ <op:lagrange-convolution>]
  with subscripts modulo $M_o$. The powers are well defined under cyclic indexing because $h divides M_o$.
    Each of the two diagonal factors splits over the bits of $w$ and has coefficients computable from $j$.
    If $T_b f \( w \) = f \( w - b med mod med M_o \)$, the middle window sum is
  $ product_(i = 0)^(ell - 1) \( I + T_(2^i) \) . $
  Every integer in $\[ 0 \, h \)$ has a unique binary expansion, proving this identity.
    The previously constructed shifts implement it. When $deg \( F L_j \) < M_o$,
    cyclic and ordinary multiplication coincide; we impose this degree bound at every ordinary-product use.
  For clarity, crude stage bounds suffice: a bit operation uses $O \( r \)$ elementary stages,
    a conjunction $O \( r^2 \)$, a carry shift $O \( r^3 \)$, and the window product $O \( r^4 \)$.
    The Fourier, Walsh, and range-mask constructions also fit a fixed polynomial bound.
    Coefficient calculation, layout descriptions and every elementary local operation use polynomially many bit
    operations in $r$. Padding unused steps with zero or identity operations makes all lengths independent of the
    particular control or address values. ◻
]

=== 4.3 Triangular A-only certificates <triangular-a-only-certificates>

An A-only program starts from A-coded public constants or a local expression $X$ from Definition 18.
  It forms identical-coefficient linear combinations and right pulls of earlier slots having the same A twist.
  Right pulls commute with left translations and constant entry twists, and therefore preserve A constraints.
  A fixed generating list of $H$ suffices to compute all desired right-$H$ pulls through stored paths in its
  Cayley graph. Each path has length at most $\| H \| - 1$ after removing repetitions.
  Arbitrary bit pulls use the rotation sequences already described.
  The number of stored stages is polynomial in $r$, while all recurrence queries still belong to $Pi$.

At a fixed clock value, the initialized slots form triangular prefixes and satisfy their recurrences;
  every other scratch slot is zero. Filling one next stage evaluates its recurrence locally.
  Erasing in reverse order replaces that stage by zero while its parents are still available.
  Each step changes one designated slot or fixed family of slots, with the same definition of every retained slot.

#thm([Lemma 4.3.])[
  (Simultaneous scratch restoration).  #emph[Suppose all scratch recurrences at a legal repeated clock are
    triangular and their references, on arbitrary exact duplicated full parents,
    satisfy their assigned A constraints. Public address-focus recurrences precede every recurrence using the
    resulting coefficients. There exist constants $C_(upright("sc"))$ and $theta_(upright("sc")) > 0$,
    independent of the number of stages, slots and entry coordinates, with the following property.
    If the packed parsing, clock, full-code, duplication, scratch local-code, scratch-edge,
    recurrence and inactive-zero tests reject on a fraction $theta < theta_(upright("sc"))$ of centers,
    then after one preprocessing of the parsing, clock and full slots,
    all scratch can be replaced simultaneously by its exact triangular reference at total symbol cost at most
    $C_(upright("sc")) theta$. The references are taken on the corrected full parents;
    those parents need not yet satisfy their advertised payload-operation identities.]
] <op:scratch-restoration>

#proof[
  Theorem 16 first repairs parsing, repetition and full codes at $O \( theta \)$ symbol cost.
    A repeated illegal clock is excluded by its range test. The full-code duplication gap then excludes any
    failure of duplicated payload, for small enough $theta$. Replace all locally A-invalid scratch parts by zero.
    This is one further packed $O \( theta \)$ change. Call the resulting word $W$,
    and #emph[keep this word fixed throughout the following induction].
  If preprocessing changed at most $C_(upright("pre")) theta$ packed sites,
    any test using $Pi$ can change its outcome only on their $q$ inverse images.
    After harmless fixed conversions of edge and part normalizations there are constants $C_z \, C_r$ such that
  #[#set math.equation(numbering: n => "(4.7)")
   $ z_A \( W \) lt.eq C_z theta \, wide
     Pr \[ upright("some scratch recurrence or inactive-zero test fails on ") W \] lt.eq
     C_r theta . $ <op:fixed-word-invariant>]
  One can use constant multiples of $1 + q C_(upright("pre"))$ for both constants.
    These bounds concern the #emph[entire] packed scratch tuple, so they contain no slot-count factor.
  Order all initialized families topologically, putting public focus first,
    and include the inactive-zero families with their zero references.
    Let $V_j$ be the exact reference of the first $j$ families on the corrected full parents and legal clock,
    and let $p_j$ be the joint part distance from the corresponding prefix of $W$ to $V_j$.
    The empty prefix has $p_0 = 0$. The full parents may have incorrect advertised identities, but are A-coded;
    every allowed initial $X$ is A-coded on such parents. Right pulls and identical coefficients preserve this
    property. Public focus begins with hardwired correct constant encodings and the identical clock.
    Its completed reference supplies globally identical coefficients to subsequent recurrences.
    Consequently every $V_j$ is exactly A-coded.
  An error in the new family occurs only at a recurrence-failure center or at a center reading an erroneous
    earlier part. A joint part-error set of density $p_j$ occupies at most $4 p_j$ of the packed sites.
    Taking a union over the $q$ maps, and retaining the old prefix, gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ p_(j + 1) lt.eq C_r theta + \( 1 + 4 q \) p_j . $ <op:prefix-provisional>]
  This remains true when a recurrence reads all earlier slots or types at one of those sites:
    the error event is already joint. Put $K = 2 C_z \/ delta_1$ and choose $theta_(upright("sc"))$ so small that
  #[#set math.equation(numbering: n => "(4.9)")
   $ \( C_r + \( 1 + 4 q \) K \) theta_(upright("sc")) < delta_1 \/ 16 . $ <op:scratch-smallness>]
  If $p_j lt.eq K theta$, the provisional estimate is in the small-error range of the A near-code inequality of
    Theorem 16. Apply that inequality to the #emph[same fixed word] $W$, restricted to the enlarged tuple,
    and to $V_(j + 1)$:
  $ delta_1 p_(j + 1) lt.eq z_A \( W \|_(j + 1) \) + 4 p_(j + 1)^2 + lambda p_(j + 1) . $
  The conflict count of a prefix is at most that of the whole tuple.
    Since $lambda lt.eq delta_1 \/ 8$ and $p_(j + 1) < delta_1 \/ 16$, this implies
  $ p_(j + 1) lt.eq 2 z_A \( W \) \/ delta_1 lt.eq K theta . $
  Induction proves this bound for the complete scratch tuple.
    It resets an #emph[estimate], without making successive word repairs.
    Only now replace the whole scratch tuple by its reference, at symbol cost at most $4 K theta$.
    The common scalar local checks act on joint vectors, and the finitely many twist types act by a block-diagonal
    invertible map; the near-code estimate is therefore valid in exactly this joint metric.
    Together with preprocessing this proves the lemma. ◻
]

=== 4.4 Mode-serial filling of a full slot <mode-serial-filling-of-a-full-slot>

The target must remain a full codeword while it is being filled,
  even though its final value can depend on the parents at every index.
  We use a sequence of frequency cutoffs that commute with the encoder.
  Each increment is supported on one $H$-orbit, so its encoded contribution can be computed from a polylogarithmic
  list of coefficients gathered locally. A completed certificate for the old cutoff is retained until the next
  cutoff and its increment have both been prepared.

Retaining the completed target while reversing its auxiliary computation follows the reversible-cleanup principle
  of Bennett #cite(label("Bennett1973")) pp. 525–526. The two-buffer schedule, local transitions,
  and certification guarantees needed here are established in the following proof.

#thm([Lemma 4.4.])[
  (Local reversible filling).  #emph[For every full operation in Definition 18,
    there is a canonical reversible schedule from zero target and zero temporary scratch to its required full
    target and zero temporary scratch. Parents and all coefficient data remain fixed throughout.
    The schedule has $O \( M_o "poly" \( r \) \)$ steps, a $"poly" \( r \)$-bit local symbol and local algorithm,
    and an $O \( log M_o + log "poly" \( r \) \)$-bit microclock.
    Its checks and both local transition directions use only $Pi$.
    At each clock location the target is a specified full encoding and all scratch consists of specified
    initialized prefixes. After simultaneous scratch restoration,
    failure of the required target identity has a constant center gap.
    Each reference scratch slot satisfies its A constraints, even when its full parents have not yet been shown to
    satisfy their advertised payload identities.]
] <lem:outer-fill>

#proof[
  Write the operation’s local expression as $X$ and its duplicated systematic payload as $v$.
    For each label, part and entry coordinate expand in the $x$ variable:
  $ X \( x \, u \) = sum_(nu in bb(F)_2^r) hat(X)_nu \( u \) \( - 1 \)^(x dot.op nu) \, wide hat(X)_nu \( u \) =
    M_o^(- 1) sum_x X \( x \, u \) \( - 1 \)^(x dot.op nu) . $
  For $0 lt.eq tau lt.eq M_o$ define a Fourier multiplier $P_tau$ by
  #[#set math.equation(numbering: n => "(4.10)")
   $ w_tau \( nu \) = \| H \|^(- 1) sum_(a in H) 1 \[ underline(a^(- 1) nu) < tau \] . $ <op:cutoff>]
  Thus $P_0 = 0$ and $P_(M_o) = I$. The inverses of $\| H \|$ and $M_o$ exist in $J$.
    The multipliers are constant on frequency orbits of $H$; they are not asserted to be projections.
  Here is the required commutation in detail. A left pull by $\( w \, a \)$ sends $\( x \, u \)$ to
    $\( x + u^(- 1) a^(- 1) w \, a u \)$, so it preserves each frequency,
    changing its coefficient by a known sign and an $H$-index permutation.
    A right pull sends $\( x \, u \)$ to $\( a^(- 1) \( x + w \) \, u a \)$, carrying a frequency $nu$ to $a nu$,
    with sign $\( - 1 \)^(w dot.op a nu)$. Hence $P_tau$ commutes with both pulls.
    The constant entry twists act on a different coordinate and also commute.
    Every parity operator and every systematic injection thus intertwines $P_tau$ on its domain and codomain.
    If an invertible parity operator $T$ satisfies $T P_tau = P_tau T$, then its inverse does too,
    by multiplication by $T^(- 1)$ on both sides. Applying the two one-axis extensions gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ P_tau E_(upright("out")) v = E_(upright("out")) \( P_tau v \) . $ <op:cutoff-extension>]
  No commutation with a preliminary index-dependent operation such as $W \( k \) mapsto W \( k \)
    rho_e \( k \)$ is needed: $P_tau$ is applied to its already formed expression $X$.
  The mode-bit selector
  #[#set math.equation(numbering: n => "(4.12)")
   $ frac(I + \( - 1 \)^b R_(\( e_i \, 1 \)), 2) $ <op:mode-selector>]
  retains precisely those frequencies with $nu_i = b$. For each $a in H$,
    decompose $underline(a^(- 1) nu) < tau$ into at most $r$ disjoint prefix rectangles and multiply their
    selectors. Sum over rectangles and average over $a$. This gives an A-only program computing $P_tau
    X$ with $"poly" \( r \)$ stages. Include all candidate rectangles and use coefficient bits from the
    microclock, so topology and length are fixed. The case $tau = M_o$ uses the identity with the same padding.
    All selectors use the elementary pull list via stored bit alignments.
  The partial target at cutoff $tau$ is $Y_tau = E_(upright("out")) \( P_tau v \)$.
    Compare it with the completed cutoff program using the shared-axis test of Definition 18.
    In the shared-B case, intermediate scratch is only A-coded.
    The test’s justification is made #emph[after] Lemma 20: the completed reference is then exactly $P_tau X$,
    which satisfies the target’s B constraints by the commutation above.
    One may now use B distance on its whole systematic A rows.
    This argument neither assumes nor tests B validity of unfinished scratch.
    The shared-A case uses the analogous columns. Thus equality of the required payload suffices,
    and its failure has the same constant gap at every cutoff.
  It remains to compute a cutoff increment locally. Let $a_tau$ be the bit vector for the integer $tau < M_o$,
    and set $O = H a_tau$. The increment multiplier is zero outside $O$ and, for $nu in O$, is
  #[#set math.equation(numbering: n => "(4.13)")
   $ \( w_(tau + 1) - w_tau \) \( nu \) = frac(\# { a in H : a a_tau = nu }, \| H \|) =
     frac(1, \| O \|) . $ <op:orbit-weight>]
  For each $nu$ in the fixed-length list $\( a a_tau \)_(a in H)$, apply all $r$ mode selectors to $X$.
    Repetitions are harmless. The resulting pure-mode slot is $X_nu \( x \, u \) = \( - 1 \)^(x dot.op nu)
    hat(X)_nu \( u \)$. Also store each right pull $R_(\( 0 \, b \)) X_nu$, $b in H$,
    through generator paths and their intermediate stages. At the current $k = \( x \, u \)$ its systematic payload is
  #[#set math.equation(numbering: n => "(4.14)")
   $ \( - 1 \)^(\( b^(- 1) x \) dot.op nu) hat(v)_nu \( u b \) . $ <op:orbit-focus>]
  For any desired $u' in H$, take $b = u^(- 1) u'$ and remove the displayed known sign.
    One symbol now contains every coefficient $hat(v)_nu \( u' \)$ for $nu in O$ and every $u' in H$.
    These are read from locally stored pull slots, not from remote global payload positions.
  We can apply $E_(upright("out"))$ to this coefficient list locally.
    Remark 12 supplies the inverse of each one-axis parity system on the $O$-frequency subspace:
    both this subspace and its complement are invariant, and the restricted domain and codomain have equal
    dimensions. Here its Fourier coordinates are indexed by frequency, $H$, labels, parts and entry coordinates,
    so the restricted dimension is at most
  #[#set math.equation(numbering: n => "(4.15)")
   $ C \| O \| thin \| H \| thin dim_J U lt.eq C \| H \|^4 = "poly" \( r \) \, $ <op:orbit-dimension>]
  where $C$ depends only on the fixed labels, and $dim_J U lt.eq \| H \|^2$.
    Form its entries using the explicit pulls and Walsh signs,
    solve the two successive axis systems by Gaussian elimination, and sum the output modes at $x$.
    Together with (4.13), this computes every local entry of
  $ E_(upright("out")) \( \( P_(tau + 1) - P_tau \) v \) . $
  Matrix assembly, elimination and field arithmetic take $"poly" \( r \)$ bit operations.
    Canonical parsing and fixed defaults on malformed values,
    illegal clocks or failed pivots make the local algorithm total;
    on the promised data the prescribed matrices are invertible.
  Use two cutoff-program buffers and one orbit-focus buffer. Initially the target and all three buffers are zero.
    At iteration $tau$ keep the completed buffer for cutoff $tau$ when $tau > 0$, and compare the target with it;
    at $tau = 0$ compare the entire target with zero. In the other, empty buffer fill the cutoff-$tau +
    1$ program in dependency order, and fill the orbit focus in dependency order.
    With both complete, perform one pivot adding the local encoded increment to the target.
    Its required comparison now uses the completed cutoff-$tau + 1$ buffer.
    Erase focus in reverse order and erase the old cutoff buffer in reverse order when present.
    Swap the buffer roles, determined by the iteration parity.
    At cutoff $M_o$, compare the target directly with $X$ while erasing the final cutoff buffer.
    This finishes with the full desired target and zero temporary scratch.
  At every clock value enforce the full-code and duplication constraints of the target,
    all initialized-prefix recurrences, inactive zeros, and the stated comparison.
    While a new proof is being prepared, a completed old proof remains available.
    At a pivot both the next proof and the increment focus are complete.
    In reverse traversal, erased prefixes are first reconstructed in forward dependency order,
    so the reverse pivot subtracts the same locally available increment.
    Thus both directions are local, mutually inverse on canonical data,
    and never use a partial certificate as a completed one.
  For the size bound, each cutoff program uses at most $O \( \| H \| r^3 \)$ elementary stages up to fixed padding
    factors. The orbit selectors and all right-$H$ paths use at most $O \( \| H \| r^2 + \| H \|^3 \)$ such
    stages, with a polynomial allowance for metadata. Even a bound $O \( r^30 \)$ for both programs and their
    descriptions suffices. Each entry alphabet has at most $r^18$ field coordinates, each of $O \( r \)$ bits.
    The two reused buffers therefore have $"poly" \( r \)$ bits per index.
    There are $M_o$ iterations of a common polynomial sublength,
    with a special initial omission and final erasure; their location is decoded by arithmetic on a logarithmic
    microclock. No local step loops over all $M_o$ modes. The different cutoffs reuse the same zeroed buffers and
    do not contribute a factor $M_o$ to the word length. Separate buffers for the finitely many required A types
    keep every slot’s type fixed. These observations prove all bounds and claims of the lemma. ◻
]

=== 4.5 From sparse tape wiring to row systems <from-sparse-tape-wiring-to-row-systems>

We next construct a persistent tuple $P \( b \)$ independent of the clock frame,
  where $b$ comprises the four tape-content and occupation arrays.
  Its canonical formulas are defined for every $b in J^(4 h)$;
  Boolean and phase-validity tests are additional conditions.
  Testing a uniformly chosen tape row would not detect one false row with constant probability.
  Instead we interpolate the row data, certify the required products,
  and encode the remainder of each row-equation polynomial modulo $Z^h - 1$.
  A single false row makes that remainder nonzero; comparing its full encoding with zero then has the code’s
  constant gap. The tuple retains the intermediate linear computations needed to perform these checks at every frame.

#thm([Lemma 4.5.])[
  (Persistent wiring and certification).  #emph[There are $"poly" \( r \)$ persistent full slots $P \( b \)$,
    with polynomial canonical payload formulas in $b in J^(4 h)$, and packed local tests using $Pi$,
    with the following properties.]
  + #emph[Structural tests uniquely determine $P \( b \)$ from its four logical arrays.
    Each variable factor array is a fixed permutation of one logical array;
    a one-address logical edit changes that factor at at most one publicly determined address.]
  + #emph[Each primary has assigned logical degree at most a fixed $d_2$.
    Every other persistent slot has a homogeneous linear recipe on the primaries,
    including all intermediate matrix reencodings and all phase-specific computations.
    Its assigned logical degree can be the maximum degree of its primary inputs.]
  + #emph[There are persistent full encodings of
#[#set math.equation(numbering: n => "(4.16)")
 $ U_D \( x \) = sum_(j = 0)^(h - 1) \( - 1 \)^(x dot.op j) D_j $ <op:address-transform>]

 for every needed logical singleton $D$, where $j$ denotes its padded $r$-bit vector.
   Its Walsh coefficient at $j < h$ is exactly $D_j$.]
  + #emph[Conditional on exact duplicated full codes and a legal repeated clock,
    either all structural formulas hold and $b$ is a valid Boolean macrovertex at that clock,
    or one packed test rejects on at least a fixed fraction $gamma_(upright("per")) > 0$ of centers.
    The same alternative without the macro-validity conclusion holds if only structural tests are imposed.]
  #emph[The canonical tuple and public data are deterministically constructible in $"poly" \( N \)$ time.
    The number of field coordinates, public local parameters and bit operations at one index is $"poly" \( r \)$.]
] <lem:outer-wiring>

#proof[
  #strong[Sparse row equations.] Use the normalization in Lemma 8.
    The Boolean tests for the four arrays are $z \( z - 1 \) = 0$ at each row,
    and content must vanish where occupation is zero, by $a \( 1 - e \) = 0$.
    For occupation in a prescribed order $pi$, impose
  $ e_(pi \( i + 1 \)) \( 1 - e_(pi \( i \)) \) = 0 quad \( 0 lt.eq i < h - 1 \) . $
  Together with Booleanity, these equations say that occupied positions form a prefix.
    Its desired length is imposed separately by its integer count.
    Full occupation may instead be imposed row by row. Fixed gate truth tables have multilinear representing
    polynomials over $J$: for a Boolean input $a in { 0 \, 1 }^m$ its indicator is $product_(i : a_i = 1) z_i
    product_(i : a_i = 0) \( 1 - z_i \)$, so summing the indicators weighted by the truth-table values gives the
    desired polynomial. The arity is fixed. Gate, input-copy, designated-comparison, dummy,
    and tape-to-tape-copy equations are conditioned by the occupation of their destination where appropriate.
    This expresses exactly the phase rules in Section 2; the phase prescription ensures that an occupied
    computation only depends on earlier occupied positions or the fixed full tape.
    In a full $Q_x$, its $S$ inputs are free, with the terminal and other-input relations imposed as in its
    definition. At shared phase boundaries fix either equivalent description.
  For each of the four phases and each unconditional family,
    organize these equations into a fixed number of length-$h$ lists, padding with zero equations.
    Every operand map from list rows to an original logical array has bounded multiplicity:
    this follows from bounded fan-out for internal feeds, separate designated copies,
    and partial permutations for adjacency and same-position copies.
    An operand map of multiplicity at most $B$ splits into $B$ partial injections by coloring its preimages
    separately at each target. Each partial injection extends to a permutation of $\[ h \]$,
    by any bijection between the unused domain and range. Separate logical array types and intersect the finitely
    many operand-color and active-row cases. Because arity and $B$ are constants,
    this causes only a constant number of cases. Expand the representing polynomials into monomials.
    Each row list is now a sum of a fixed number of bounded-length monomials,
    whose factors are permuted logical arrays or public coefficient and mask arrays.
    Empty monomials represent constant terms. Counting coefficient factors in the length still gives a fixed bound
    on the degree.
  #strong[Routing arbitrary permutations.] For completeness a permutation of $2^ell$ locations has a binary switch
    realization with $2 ell - 1$ layers, each layer switching pairs along one fixed XOR bit,
    with a public Boolean mask constant on each pair. This is the binary specialization of the Beneš
    rearrangeability construction #cite(label("Benes1964Permutation")) Lemma 3 and Theorems 2–3.
    Pair sources along the top bit and do the same for targets.
    The prescribed item routes form a bipartite multigraph on these pairs with degree two at every vertex.
    Every component is an even cycle, including a pair of parallel edges; alternate its edges with two colors.
    An initial top-bit switch and a final top-bit switch route each item through the half corresponding to its
    color. Each half now has a permutation of $2^(ell - 1)$ items.
    Recurse with the same layer schedule in the two halves. The base case $ell = 1$ has one layer and $ell =
    0$ none; the recurrence for depth is $L \( ell \) = L \( ell - 1 \) + 2$.
    Cycle coloring and recursive routing take polynomial time in $h$.
  Introduce a variable factor type for every routed intermediate,
    and for each layer introduce the XOR-pulled counterpart $D^(*)$ of its input $D$.
    The layer output $D'$ satisfies the row equation
  #[#set math.equation(numbering: n => "(4.17)")
   $ D' - D - m_(upright("sw")) \( D^(*) - D \) = 0 . $ <op:switch-row>]
  The mask is pair-constant, so this is exactly either the identity or a transposition on each pair.
    The counterpart identity itself is checked by a scalar program below.
    These equations are always imposed, including in inactive phases.
    Induction through the network makes each variable factor a known permutation of an original logical array,
    for arbitrary field values of that array. There are only $O \( r \)$ layers among a fixed number of routing
    networks, hence $"poly" \( r \)$ factor and equation types with bounded arity per row.
    For an edit of an original logical array at $j$, every factor derived from it changes only at the image of $j$
    under its fixed permutation. All such addresses for one frame occupy $"poly" \( r \)$ bits.
    Their entire frame-indexed tables need not have a succinct random-access formula;
    they will be stored as public encoded tables and focused before use in Section 5.
  #strong[Primaries and assigned degree.] For every factor array $D in J^h$,
    define its unique degree-$< h$ interpolant on the subgroup grid by
  #[#set math.equation(numbering: n => "(4.18)")
   $ F_D \( Z \) = sum_(j = 0)^(h - 1) D_j L_j \( Z \) . $ <op:factor-interpolant>]
  For each factor-occurrence list of each monomial, include primaries for every subset $S$ of its occurrences,
    with payload the length-$M_o$ coefficient table, padded by zeros, of
  #[#set math.equation(numbering: n => "(4.19)")
   $ F_S \( Z \) = product_(a in S) F_(D_a) \( Z \) . $ <op:subset-primary>]
  The index set here consists of occurrences: repeated uses of one factor remain distinct.
    The empty subset gives $1$. Identify shared singleton primaries or impose direct full-word equalities on
    copies, and include independent singletons when needed. The assigned logical degree $k_S$ counts variable
    occurrences only; public factors have degree zero. Let $d_2$ bound the length of every factor-occurrence list
    after all switch and row equations have been included. It is a fixed constant, and $k_S lt.eq d_2$.
    The honest ordinary polynomial degree is at most $d_2 \( h - 1 \)$. Choose the earlier size constant so that
  #[#set math.equation(numbering: n => "(4.20)")
   $ M_o > \( 8 d_2 + 8 \) h . $ <op:degree-slack>]
  All primary formulas exist for arbitrary $b in J^(4 h)$.
  #strong[Index independence and support.] Scalar primaries are intended to depend only on $x$, not on $u$.
    Test invariance of their payloads under left $\( 0 \, a \)$ pulls for the fixed generating list of $H$.
    Such a pull fixes $x$ and changes $u$ to $a u$, and shares B with the original untwisted scalar slot.
    Compare whole systematic A rows as above, using the pulled local expression without introducing a free encoder
    witness. The shared-B exact gap forces invariance under each generator; since these generate $H$,
    this is precisely independence from $u$. No independent invariance test is needed on a derived program stage
    whose exact recipe already determines it, and matrix intermediates need not be $u$-independent.
  Use range masks from Lemma 19 to require singleton coefficient support in $\[ 0 \, h \)$ and product-primary
    support in $\[ 0 \, d_2 h + 1 \)$, with sharper public bounds when appropriate.
    Encode the masked complement as a full output and compare that entire word with zero.
    A nonzero output has full-code distance. Compare each public singleton and each empty product with its
    precomputed canonical full encoding. These are structural conditions.
  #strong[Product certification.] Compute the length-$M_o$ DFT of each relevant primary coefficient table by
    certified full stages. Its payload at integer $y$ is the polynomial’s value at $zeta^y$.
    For every nontrivial subset choose one occurrence $a in S$ and check,
    at one fixed systematic payload cell at $s = t = 0$,
  #[#set math.equation(numbering: n => "(4.21)")
   $ F_S \( zeta^y \) = F_(S \\ { a }) \( zeta^y \) F_(D_a) \( zeta^y \) . $ <op:primary-product-test>]
  These are pointwise nonlinear tests; the stored transform stages themselves have linear recipes.
    Once support, independence and transform identities hold, a false equality is the nonzero polynomial $F_S -
    F_(S \\ { a }) F_(D_a)$, of degree less than $\( d_2 + 1 \) h + 1 < M_o \/ 2$.
    A nonzero polynomial of degree $D$ over a field has at most $D$ roots,
    as follows by successively dividing by $Z - z$ at distinct roots.
    Thus the false equality fails at more than half the $M_o$ distinct points $zeta^y$.
    Uniform $k$ has uniform $x$, and independence from $u$ prevents the extra index from diluting this gap.
    Induction on subset size forces exactly all products (4.19) once these tests hold.
  #strong[Counterparts and the subgroup annihilator.] Apply the length-$h$ Fourier transform to the low $ell$ bits
    of each singleton’s padded coefficient table. Its first block is the value table $D$,
    and every higher block is zero by coefficient support. For each XOR counterpart use the certified bit pull on
    this padded table and compare its full output with the counterpart’s separately computed padded value table.
    Their full-operation gap forces the exact counterpart identity needed in (4.17).
  For a row-equation list let $R \( Z \)$ be the indicated linear combination of its product primaries.
    Its value at $omega^j$ is exactly the row expression at $j$. Its remainder modulo $Z^h - 1$ has coefficients
  #[#set math.equation(numbering: n => "(4.22)")
   $ \[ Z^i \] \( R med mod med \( Z^h - 1 \) \) = sum_(z = 0)^(M_o \/ h - 1) \[ Z^(i + z h) \] R \, quad 0 lt.eq
     i < h \, $ <op:remainder-fold>]
  and zero padding elsewhere. This formula follows from $Z^(i + z h) equiv Z^i med \( mod med Z^h - 1 \)$,
    since the coefficient table is supported below $M_o$. It is a short linear program:
    apply $product_(i = ell)^(r - 1) \( I + R_(\( e_i \, 1 \)) \)$ to sum all high-bit blocks,
    then mask to high bits zero. Require its entire full word to be zero when the equation is imposed.
  The polynomial $Z^h - 1$ is exactly the annihilator of the subgroup grid:
    it has the $h$ distinct roots $omega^j$, because $h$ is invertible in $J$, and its degree is $h$.
    The remainder has degree below $h$. Therefore it vanishes as a polynomial if and only if $R$ vanishes at all
    grid points. In one direction divisibility suffices; in the other direction a degree-$<
    h$ polynomial with $h$ distinct roots is zero. This proves that the folded full-word checks impose the row
    equations exactly, without any random sampling loss over rows.
    All structural switch equations and their folded computations are always present.
    All phase-specific folded computations are also stored persistently;
    the repeated clock selects only which final zero conditions are imposed.
  #strong[Counts and address transforms.] The constant coefficient of (4.18) is
  #[#set math.equation(numbering: n => "(4.23)")
   $ \[ Z^0 \] F_e = h^(- 1) sum_(j = 0)^(h - 1) e_j \, $ <op:occupation-count>]
  since every $L_j$ has constant coefficient $h^(- 1)$. Mask the occupation coefficient table to index zero,
    using all bit masks. Compare its full word with the public full encoding of $1 \[ underline(x) = 0 \]$ times
    $c h^(- 1)$, where the expected count $c in \[ 0 \, h \]$ is computed from the legal repeated stage and phase.
    This scalar is used in the comparison; it is not part of a changing persistent value.
    On Boolean occupation data, characteristic $p > M_o gt.eq
    h$ implies that two counts in $\[ 0 \, h \]$ are equal in $J$ only when they are equal as integers.
    Together with monotonicity this enforces the prescribed prefix exactly.
  For address access, take the padded length-$h$ value table obtained above and apply the full $r$-bit Walsh
    transform. Its result is (4.16). Walsh orthogonality gives
  $ M_o^(- 1) sum_x U_D \( x \) \( - 1 \)^(x dot.op j) = sum_(i < h) D_i
    (M_o^(- 1) sum_x \( - 1 \)^(x dot.op \( i + j \))) = D_j wide \( j < h \) . $
  In particular the high bits of the zero-padded value table cause $U_D$ to repeat across the corresponding high
    output blocks; they do not introduce an additional normalization factor.
  #strong[Exact alternatives and complexity.] Every stage of every mask, transform,
    counterpart comparison and remainder computation is stored as a full slot with its specified linear recipe,
    including mixed and untwisted matrix intermediates. Give a derived stage the maximum assigned degree of its
    primary ancestors and retain its ancestor subprogram or shared directed acyclic recipe.
    Public indexed arrays are degree-zero inputs with precomputed encoded constants.
  On exact duplicated full codewords, a false independence, support, public-constant, full-operation, counterpart,
    folded-zero or count identity has a constant gap by the shared-axis or full-code distance.
    If none is false, the polynomial root argument forces all primary products.
    Singleton support makes the interpolant unique from its subgroup values.
    The counterpart and switch equations then determine all factors as their prescribed permutations of the four
    original logical arrays, and the public factors are fixed.
    Thus the structural tests force precisely $P \( b \)$. The remaining Boolean, prefix,
    count and selected-phase row equations are exactly the macrovertex rules.
    If any is false, its folded or count check has the same exact gap.
    All tests are packed at the center; choosing one false relation in this argument entails no division by their
    number. The minimum of the fixed code gaps and the product gap gives $gamma_(upright("per")) >
    0$ and proves both alternatives.
  There are $O \( r \)$ routed factor and row families before the scalar program expansions,
    a constant number of occurrence subsets per monomial, and polynomially many stages per transform.
    Thus the number of full slots, recipes and local metadata is $"poly" \( r \)$.
    The entry dimension and field bit length give a further fixed polynomial factor.
    At one center the checker scans these lists, performs field operations and evaluates fixed-length control
    decisions, all in $"poly" \( r \)$ bit operations. It reads public encoded constants only at the publicly
    specified positions in $Pi \( k \)$; arbitrary hidden-frame table lookup is never assumed.
    All public permutations, masks, coefficients, encodings and complete canonical arrays are constructible
    globally by polynomial-time combinatorial and linear-algebra algorithms.
    Since $\| Gamma \| = M_o \| H \| = O \( N "polylog" N \)$ and every scalarized encoding system has polynomial
    dimension in $N$, this takes $"poly" \( N \)$ time. The persistent word length is $O \( N "polylog" N \)$
    field-bit storage, with a fixed exponent in the polylogarithmic factor. This completes the construction and proof. ◻
]

== 5 A locally evolving outer representation <sec:outer-representation>

We now combine the macrograph, the outer codes, and the certified programs into one representation.
  A long preparation is part of the represented path: its current position is recorded by a binary clock,
  while its scratch space is reused. Thus preparation time does not multiply the length of a represented vertex.
  The main additional requirement is that every retained certificate,
  including certificates introduced to verify other certificates, can change locally when a logical tape entry changes.

All notation in this section belongs to the outer construction.
  In particular, $J$, $H$, and $Gamma = bb(F)_2^r times.r H$ are those of Section 3.
  We retain $M_o = 2^r$, the tape length $h$, the four logical arrays $b$,
  and the persistent tuple $P \( b \)$ of Lemma 22. The assigned degree $k_S$ of a primary $F_S$ counts its
  variable factor occurrences, and $d_2$ is the fixed upper bound on the number of factor occurrences. In particular,

$ r = O \( log N \) \, wide M_o = O \( N \) \, wide \| H \| lt.eq r^9 \, wide M_o > \( 8 d_2 + 8 \) h . $

Every persistent program stage has a specified linear payload recipe in the primaries.
  This includes support masks, transforms, routing checks, remainder computations for inactive phases,
  and every matrix-valued reencoding intermediate. Its assigned degree is at most the maximum assigned degree of
  the primary inputs to that recipe.

=== 5.1 Finite differences of the complete certificate tuple <finite-differences-of-the-complete-certificate-tuple>

Fix a start frame $c in { 0 \, dots.h \, 4 h - 1 }$. The finite edit alphabet $Sigma$ of Lemma 8 describes
  additive changes $h_sigma \( c \)$ of the logical arrays.
  Enlarge this fixed alphabet by inverse edits and a zero edit if necessary.
  All addresses depend only on $\( c \, sigma \)$ and public routing data.
  The choice of the edit can depend on the critical logical bits; a recipe for a specified edit cannot.
  For a field-valued function $F$ define

$ Delta_sigma F \( b \) = F \( b + h_sigma \( c \) \) - F \( b \) . $

This definition is made on arbitrary field arrays $b$, independently of whether they satisfy the macrograph conditions.

For a variable singleton occurrence $a$, routing gives either no change or a change $epsilon.alt_(a \, sigma)
  L_(j_(a \, sigma)) \( Z \)$, where $epsilon.alt_(a \, sigma) in { - 1 \, 0 \,
  1 }$ and $j_(a \, sigma) < h$ are public at this frame. A default address is used when
  $epsilon.alt_(a \, sigma) = 0$. Public factors have zero increment.
  If $S_(upright("var"))$ is the set of variable #emph[occurrences] in $S$, distributivity gives

#[#set math.equation(numbering: n => "(5.1)")
 $ Delta_sigma F_S = sum_(diameter eq.not A subset.eq S_(upright("var"))) F_(S \\ A) \( b \) product_(a in A)
   epsilon.alt_(a \, sigma) L_(j_(a \, sigma)) . $ <oe:primary-difference>]

Repeated occurrences are retained separately in this formula.
  Every primary on its right has assigned degree at most $k_S - 1$.
  Multiplication by a specified Lagrange polynomial is the linear coefficient program of Lemma 19.
  The number of subsets in (5.1) is bounded in terms of $d_2$ alone.
  Every ordinary polynomial product appearing here has degree at most $d_2 \( h - 1 \) < M_o$;
  consequently its implementation by cyclic coefficient convolution has no wraparound error.
  All possible addresses and zero coefficients use a common padded program topology.

#thm([Lemma 5.1.])[
  (Closure under finite differences).  #emph[For every positive-degree persistent full slot $D$ and every $sigma
    in Sigma$, one can allocate a finite certified full program whose output, in the same encoder type as $D$,
    is the increment of $D$ under $b mapsto b + h_sigma \( c \)$.
    One can do this simultaneously for every positive-degree full intermediate introduced by these programs,
    including all their verification intermediates. The resulting list has $"poly" \( r \)$ slots and description
    bits. Every new slot has a specified linear recipe in persistent primaries of strictly smaller assigned degree
    than its parent target. All identities hold on arbitrary field arrays $b$.]
] <oe:derivative-closure>

#proof[
  For a primary use (5.1). If $D$ is another persistent stage with linear payload recipe $cal(L)_D$,
    apply $cal(L)_D$ to the corresponding primary increments, replacing degree-zero primary increments by zero.
    At this fixed frame its coefficients, pulls, and encoder types are fixed. Hence
  $ cal(L)_D #scale(x: 120%, y: 120%)[\(] \( F_S \( b + h_sigma \( c \) \) \)_S #scale(x: 120%, y: 120%)[\)] -
    cal(L)_D #scale(x: 120%, y: 120%)[\(] \( F_S \( b \) \)_S #scale(x: 120%, y: 120%)[\)] =
    cal(L)_D #scale(x: 120%, y: 120%)[\(] \( Delta_sigma F_S \( b \) \)_S #scale(x: 120%, y: 120%)[\)] . $
  The operations used in Section 4 implement this identity at the payload level.
    In particular, multiplying a scalar slot by the public matrix $rho_e \( k \)$ is linear in that scalar;
    changing one encoder axis or contracting matrix entries is also linear.
    These operations introduce no additional logical degree.
  Allocate full slots for every stage of each increment program,
    with new slots for its mixed and untwisted verification stages.
    An identity or zero stage may be inserted to give an output its required type.
    Order stages topologically, so that Lemma 21 can initialize one full target using already completed parents.
    For every newly allocated stage, record the ancestor directed acyclic graph that expresses its payload in the
    persistent primaries. Its roots have degrees at most one less than those of the target whose increment is
    being computed. If its assigned degree is positive, apply the same construction to this new stage for every
    edit. This includes a stage introduced solely for verification:
    it will be retained at full preparation and therefore needs its own increment.
  Inlining here means substitution in a directed acyclic graph,
    with sharing retained within each target computation. If a primary is used many times,
    substitute its increment program once and fan out its result.
    Separate target computations may use fresh copies. Along any chain of newly generated targets the assigned
    degree drops by at least one. Therefore the construction stops after at most $d_2$ derivative tiers.
    At each tier the number of target graphs, their sizes, their ancestor descriptions,
    and their substitutions are bounded by a fixed polynomial in the preceding total description size and $r$.
    A fixed number of such polynomial expansions remains polynomial in $r$.
  The programs verify the computed increments by their own stage relations,
    starting from the lower-degree primaries. They do not test a finite-difference assertion about an otherwise
    unspecified witness. Neither their construction nor their identities use the final validity equations.
    This also ensures that increment recipes remain defined on field data produced by an edit that is not a legal
    macrograph move. ◻
]

=== 5.2 Public addresses, logical reads, and a reversible preparation <public-addresses-logical-reads-and-a-reversible-preparation>

Public address tables need not admit succinct evaluation at a hidden frame $c$.
  We therefore represent the needed access explicitly. For each field entry $a \( c \)$ of the public data table,
  form the scalar payload

#[#set math.equation(numbering: n => "(5.2)")
 $ V_a \( x \, u \) = sum_(0 lt.eq c' < 4 h) a \( c' \) \( - 1 \)^(x dot.op c') . $ <oe:public-walsh-table>]

Integers in this display are identified with their $r$-bit vectors,
  and the coefficient table is zero outside $\[ 0 \, 4 h \)$. The payload is independent of $u$.
  Hardwire its full encoding at every publicly requested symbol position.
  The table includes operand addresses, rule types, terminal-comparison addresses,
  and choice-rule data for both directions, together with the permuted edit addresses of every factor type used by
  Lemma 23. Addresses for inactive phases are included too.
  Strings and indices are split into field entries with fixed parsing conventions.
  There are only $"poly" \( r \)$ entries per frame.

The first preparation steps are an A-only public focus. For the bits of the repeated frame $c$, apply the mode selectors

$ frac(I + \( - 1 \)^(c_i) R_(\( e_i \, 1 \)), 2) $

successively, implementing a nonfirst-bit pull by the fixed generators as in Section 4.
  Applied to (5.2), their completed output is $a \( c \) \( - 1 \)^(x dot.op c)$ on the systematic payload.
  Removing that known sign recovers $a \( c \)$ identically at every center.
  No recurrence using a table-dependent coefficient is active before the public focus is complete.
  Retain this focus until preparation has been reversed. On malformed data use fixed default field values,
  indices, and instructions; thus every local algorithm is total.

Next, in the topological order of Lemma 23, fill every transient full computation stage by Lemma 21.
  Previously completed targets remain full and their temporary fill scratch is empty.
  At every intermediate location check their direct full-operation relations;
  apply the two-buffer fill checks to the current target; and check zero in all still empty full targets and
  inactive scratch slots. The persistent tuple $P \( b \)$ is checked throughout.
  All these conditions are tested together at the same center.

Finally prepare the critical logical reads. The persistent slot $U_D$ provided by Lemma 22 has payload

$ U_D \( x \) = sum_(j < h) \( - 1 \)^(x dot.op j) D_j . $

Its Walsh coefficient at address $j$ is $D_j$. Using the completed public address focus,
  build A-only selector stacks for the fixed list of critical roles needed by either the forward or reverse macro
  proposal and its existence flag. Unused roles use default addresses.
  Include enough roles for each logical array type; their number is constant.
  Build the identical focus stacks on the full increment outputs for $U_D$ for every $sigma$.
  The recipe for $U_D$ uses just one degree-one singleton, so each increment input has assigned degree zero.
  At a fixed frame its entire focused stack is independent of $b$ as well.

#thm([Lemma 5.2.])[
  (Preparation and local evolution).  #emph[There is an integer $J_max gt.eq
    1$ and a canonical preparation indexed by $j = 0 \, dots.h \, J_max$ with the following properties.]
  + #emph[At $j = 0$ all frame-dependent full and A-only transient slots are zero.
    At $j = J_max$ all full increment programs and critical focuses are complete,
    and every full-target fill buffer and orbit-focus buffer is zero.]
  + #emph[For every field array $b$ and frame $c$, every snapshot is uniquely specified.
    Its transition to the next or previous snapshot uses a fixed finite list of permutation-neighbors of each
    requested center.]
  + #emph[The number of steps is $J_max = O \( M_o "poly" \( r \) \)$.
    The number of stored slots, the schedule description, and the work to interpret one microclock or perform one
    local transition are $"poly" \( r \)$, including entry dimensions and bit lengths.]
  + #emph[At full preparation, applying an edit $h_sigma \( c \)$ changes the entire retained tuple to its
    canonical value on $b + h_sigma \( c \)$ by local addition of the stored increment outputs.
    The public focus is unchanged.]
] <oe:preparation>

#proof[
  Concatenate the public focus, all full-target filling schedules, and the critical-read focuses.
    The stage lists for selectors and cutoffs have fixed padded lengths independent of their address values.
    The per-target mode schedule consists of $M_o$ iterations of fixed polylogarithmic sublength,
    together with its initial and final buffer steps. The exceptional first iteration and final erasure are
    specified separately. Thus a binary microclock can be interpreted by scanning the polynomial-in-$r$ list of
    program boundaries and performing arithmetic on $O \( log M_o + log "poly" \( r \) \)$ bits.
    The interpreter selects the current iteration, buffer, initialized prefix, and transition;
    it does not execute all preceding iterations. Distinct programs may use distinct scratch indices to keep their
    shapes and twists fixed. An idle preparation step supplies $J_max gt.eq 1$ if needed.
  For the last assertion, write $D_sigma \( b \)$ for the stored full increment of a positive-degree full slot
    $D$. At the top perform, simultaneously,
  #[#set math.equation(numbering: n => "(5.3)")
   $ D \( b \) mapsto D \( b \) + D_sigma \( b \) = D \( b + h_sigma \( c \) \) $ <oe:simultaneous-edit>]
  for every persistent and transient full computation slot.
    Equation (5.3) is valid in its own encoder because that encoder is linear.
    The increment slots themselves are included in this update whenever their assigned degree is positive;
    their required increments exist by Lemma 23. Degree-zero slots do not change.
    All additions read the old tuple before writing the new one.
  The full-target temporary buffers are already empty. Public focus depends only on $c$ and remains fixed.
    Each main critical-read stack is a linear selector-and-pull program at fixed public addresses.
    Adding the matching focused increment stack therefore updates all its initialized stages to their new
    canonical values. Those increment stacks have degree zero and stay fixed.
    This verifies the assertion also for the retained A-only data.
    The preparation can now be erased in the reverse order, using exactly the same recipes on the new $b$ and
    unchanged frame. ◻
]

=== 5.3 The extended graph and its endpoint payload <the-extended-graph-and-its-endpoint-payload>

Define an extended valid label to be

#[#set math.equation(numbering: n => "(5.4)")
 $ v = \( c \, b \, eta \, j \) \, wide 0 lt.eq c < 4 h \, quad eta in { 0 \, 1 } \, quad 0 lt.eq j lt.eq J_max \,
   $ <oe:extended-label>]

where $b$ is a valid macrograph state at stage $c$ if $eta = 0$, and at stage $c +
  1 med \( mod med 4 h \)$ if $eta = 1$. We call these modes pre and post, respectively.
  Its raw word $R_v$ contains, at every $k in Gamma$, all four parts of the persistent tuple $P \( b \)$,
  all full and A-only transient data in the canonical snapshot $\( c \, b \, j \)$,
  and a canonically encoded repeated copy of $\( c \, eta \, j \)$ and its range information.
  Padding conventions will be fixed below.

In pre mode increase $j$ until the top. At the top use the prepared critical reads to compute the macrograph’s
  forward choice and existence flag. If the edge exists, perform (5.3), leave $c \, j$ fixed,
  and change the mode to post. In post mode decrease $j$ until zero, then perform

#[#set math.equation(numbering: n => "(5.5)")
 $ \( c \, b \, 1 \, 0 \) mapsto \( c + 1 med mod med 4 h \, b \, 0 \, 0 \) . $ <oe:frame-advance>]

The reverse rules use the reverse preparation transition, the reverse macro choice at the same start frame,
  and the inverse of (5.5). Both directions read their choice and flag before the top update.
  At a missing edge the corresponding proposed word is defined to be the current raw word and its flag is zero.
  This is a total proposal convention, not a graph self-edge.
  At a malformed input the local proposal and flag likewise have a fixed total default.

For each valid macro vertex at stage $s$, the extended graph contains the directed path

#[#set math.equation(numbering: n => "(5.6)")
 $ \( s - 1 \, b \, 1 \, J_max \) & arrow.r dots.h.c arrow.r \( s - 1 \, b \, 1 \, 0 \)\
 & arrow.r \( s \, b \, 0 \, 0 \) arrow.r dots.h.c arrow.r \( s \, b \, 0 \, J_max \) \, $ <oe:replacement-path>]

with frames taken modulo $4 h$. Macro edges join the corresponding ends of these paths.
  Every internal edge changes the clock or mode, and every top edge changes mode, so none is a self-edge.
  The graph has indegree and outdegree at most one. Every label belongs to a path of positive length;
  there are no isolated vertices.

Let $\( s_(*) \, b_(*) \)$ be the public exceptional macro source of Lemma 8.
  The unique exceptional extended source and its actual successor are

#[#set math.equation(numbering: n => "(5.7)")
 $ v_(*) = \( s_(*) - 1 \, b_(*) \, 1 \, J_max \) \, wide v_(*)^(+) = \( s_(*) - 1 \, b_(*) \, 1 \, J_max - 1 \) .
   $ <oe:public-source>]

Their entire raw words are deterministically computable in $"poly" \( N \)$ time.
  Indeed the macro source is public, all full encoders and program formulas are computable by global array
  algorithms, and even explicitly following this one preparation takes only polynomially many steps.

An extended endpoint can occur only at a top label of (5.6).
  Map it to its macro vertex by retaining $b$ and taking stage $c + eta med \( mod med 4 h \)$.
  If it is not $v_(*)$, the endpoint decoder of Lemma 8 returns a nonzero string $y$ with $P \( S \( y \) \)
  eq.not y$ or $S \( P \( y \) \) eq.not y$. Thus the endpoint payload consists of the logical tapes and the
  repeated label; it does not require finding a history of the transient computation.

=== 5.4 A packed tester for valid represented vertices <a-packed-tester-for-valid-represented-vertices>

Let $Pi$ contain identity, all forward and inverse A- and B-neighbor maps needed by the codes,
  the left $H$ generators used for payload independence, the right first-bit shifts and single-cycle rotations and
  their inverses, and the right $H$ generators used by scratch programs.
  Add the finitely many bounded compositions required by a primitive local expression.
  Its cardinality $q = \| Pi \|$ is fixed independently of $N$.
  Arbitrary powers of a rotation or paths through $H$ are represented by successive stages;
  they do not add new query maps to this list. At every center the tester reads $W \|_(Pi \( k \))$ and rejects if
  #emph[any] applicable condition below fails:

+ canonical parsing, legal repeated clock, range checks, and zero padding;
+ all full-slot local codes, A/B agreements, and systematic-payload duplication,
  including targets that are partial or inactive;
+ all A-only local codes and A agreements, including inactive scratch;
+ all structural persistent relations and the macro-validity conditions selected by $\( c \, eta \)$;
+ every required current-snapshot relation: completed full-operation checks,
  the current partial-target comparison, initialized scratch-prefix recurrences in both buffers and all focuses,
  and inactive-zero checks.

In particular, the tester does not choose one relation uniformly from a growing list.
  All relations share this fixed set of center permutations.
  Write $"rej" \( W \)$ for its rejection probability at uniform $k in Gamma$, and use normalized whole-symbol distance

$ "dist" \( W \, W' \) = Pr_(k in Gamma) \[ W \( k \) eq.not W' \( k \) \] . $

#thm([Lemma 5.3.])[
  (Soundness of the valid-word tester).  #emph[There are fixed constants $C_(upright("rep")) <
    oo$ and $g_(upright("rep")) > 0$ such that, if $"rej" \( W \) < g_(upright("rep"))$,
    some valid extended label $v$ satisfies
$ "dist" \( W \, R_v \) lt.eq C_(upright("rep")) "rej" \( W \) . $

 The tester has perfect completeness. Conversely, $"rej" \( W \) lt.eq
   q "dist" \( W \, R_v \)$ for every valid label $v$. Distinct valid labels have raw distance at least a fixed
   $delta_(upright("raw")) > 0$.]
] <oe:valid-testing>

#proof[
  Put $theta = "rej" \( W \)$. The parsing, repetition, and full-code proximity conclusions of Theorem 16 first
    change $O \( theta \)$ centers to give legal constant clock data and exact full codewords.
    A corrected repeated clock of illegal range would cause rejection everywhere,
    so small enough $theta$ rules it out. Exact one-axis distance then forces systematic-payload duplication in
    every full slot. Otherwise that one failed duplication relation already has a fixed positive rejection
    probability. Zeroing locally A-invalid scratch parts costs another $O \( theta \)$ centers.
    A change on $z$ centers changes any simultaneous test on at most $q z$ centers;
    this estimate uses the common permutation list and does not depend on the number of slots.
  We next restore all scratch relative to these corrected full codewords and the corrected clock,
    before using any advertised full-operation identity. The reference for the public focus is the actual
    hardwired public word at the corrected frame. Treat its recurrences first.
    A later table-dependent recurrence is active only when this reference focus is complete and hence gives
    identical correct coefficients at every center. Each initial expression $X$ in a mode-fill program is A-coded
    from its exact full parents, even if those parents do not yet satisfy their advertised payload recipes.
    The critical and increment focuses also start from exact A-coded full words.
    Thus every required reference prefix is exactly A-coded.
  These are precisely the reference and ordering hypotheses of Lemma 20.
    The preprocessing above changed only $O \( theta \)$ sites,
    so the common query list bounds both the joint A-conflict fraction and the simultaneous recurrence-failure
    fraction of this one preprocessed word by $O \( theta \)$.
    Apply the lemma to its entire scratch tuple, including inactive zeros.
    Its fixed-word induction keeps every prefix estimate $O \( theta \)$ and makes only one final replacement.
    All scratch is therefore restored at cost $O \( theta \)$, independently of the number of stages.
    No full-operation identity has been used to obtain this conclusion.
  Call the resulting tuple $tilde(W)$. Its remaining tests still fail with probability at most $C'
    theta$ for a fixed $C'$. By Lemma 22, either its persistent tuple is exactly $P \( b \)$ for logical bits $b$
    valid at the selected macro stage, or a persistent relation fails with fixed positive probability.
    Choose $theta$ below that gap divided by $C'$ to obtain the former alternative.
    Now follow the initialization order of the transient full targets.
    Completed targets with canonical parents are forced to their exact outputs by the shared-axis gap following
    Definition 18. For the current partial target, its required cutoff comparison has the same gap by Lemma 21.
    The cutoff scratch has already been restored: its completed value is precisely $P_(t') X$.
    In the case that the target shares only the B axis with $X$,
    orbit invariance makes this completed reference B-coded. Only at this point is B-axis distance applied.
    No intermediate A-only scratch is assumed to be B-valid. Inactive full targets are forced to zero by full-word
    distance.
  There are only finitely many kinds of these gaps, uniformly in their stage indices, program lengths,
    and vector dimensions. Their minimum is positive. If any relation failed exactly on $tilde(W)$,
    it alone would give at least that gap in the packed test.
    Decrease $theta$ once more to rule out every such failure.
    All full slots and restored scratch then have the unique canonical values of $\( c \, b \, eta \, j \)$.
    The total restoration cost is $C_(upright("rep")) theta$ for a fixed $C_(upright("rep"))$.
  Canonical snapshots satisfy every test by their construction, proving perfect completeness.
    If a neighborhood avoids the disagreement set between $W$ and $R_v$, its test accepts;
    a union bound over $Pi$ proves the converse. Finally, two labels with different repeated data differ at every
    center. If only their logical arrays differ, one logical singleton interpolant differs.
    Its full encoded difference is nonzero and has the fixed distance of Theorem 16,
    including the constant conversion between four-part and whole-symbol metrics.
    This gives $delta_(upright("raw")) > 0$. ◻
]

=== 5.5 Full representation cost and a fixed local Boolean exponent <full-representation-cost-and-a-fixed-local-boolean-exponent>

We record the size argument before choosing any correction accuracy or any number of Boolean ports.
  This order is needed later. All constants in the following count depend only on the fixed gate basis, $d_2$,
  and the already chosen outer code parameters.

One-bit alignment takes $O \( r \)$ elementary rotations.
  A conjunction of bit conditions takes $O \( r^2 \)$ primitive stages,
  and a carry or borrow shift takes $O \( r^3 \)$. The Lagrange window product takes $O \( r^4 \)$ stages.
  The other transforms and masks in Section 4 fit within this last bound.
  There are $O \( r \)$ initial factor and row families: a fixed number of row lists,
  with $O \( r \)$ routing layers for each needed permutation and a bounded subset list for each monomial.
  Hence there are $O \( r^5 \)$ persistent primitive stages.
  Storing their ancestor graphs, parent indices, types, and coefficient instructions is bounded, with ample slack,
  by $C r^20$ description bits. Public indexed field data are counted separately as local constant words below;
  descriptors refer to their entries by indices, rather than copying an entire length-$h$ array into a descriptor.

Here is an explicit finite-depth bound for derivative expansion.
  Let $T$ bound the complete current list of graph descriptions and subgraph descriptions, with each slot,
  parent occurrence, and instruction counted at least once.
  A target graph has at most $T$ nodes and at most $T$ primary roots.
  Substitution at one root uses a bounded number of the $O \( r^4 \)$ Lagrange programs.
  There are at most $T$ target graphs. Recording an ancestor subgraph for every newly introduced stage,
  retaining sharing within it and allowing fresh copies for separate targets,
  costs at most the square of the size of its target computation.
  Public address instructions and index encodings contribute fixed powers of $r$ and logarithms of these list
  lengths. The following deliberately loose bound therefore covers all these operations at one tier:

#[#set math.equation(numbering: n => "(5.8)")
 $ T_(a + 1) lt.eq C r^20 \( T_a + 1 \)^6 \, wide T_0 lt.eq C r^20 . $ <oe:recipe-size-recurrence>]

For example, the six factors allow a separate factor for choosing a target, traversing its graph,
  substituting its roots, and copying the ancestor descriptions,
  with two additional factors for indexing and duplication; the actual substitution keeps more sharing. If

#[#set math.equation(numbering: n => "(5.9)")
 $ E_0 = 20 \, wide E_(a + 1) = 6 E_a + 20 \, wide E = E_(d_2) \, $ <oe:recipe-exponent>]

then all descriptions are $O \( r^E \)$. This recurrence is composed only $d_2$ times, by Lemma 23.

For each full target, a cutoff program uses at most $\| H \|$ group elements, $r$ prefix rectangles,
  $r$ selectors per rectangle, and $O \( r \)$ primitive alignment stages per selector.
  This is $O \( r^12 \)$ stages. For the orbit focus, there are at most $\| H \|$ frequencies and $\|
  H \|$ requested group indices. Even finding and storing a separate generator path of length $\|
  H \|$ for every such pull gives $\| H \|^3$ stages, in addition to the mode selectors.
  A bound $O \( r^30 \)$ covers both focus and cutoff work and the two buffers.
  An entry alphabet has dimension at most $\| H \|^2 lt.eq r^18$, and a field entry uses $O \( r \)$ bits. Therefore

#[#set math.equation(numbering: n => "(5.10)")
 $ upright("raw data, local public constants, and schedule metadata at one
 center") med lt.eq C r^(E + 60) . $ <oe:raw-size-bound>]

This includes public-address focus, critical focus, all slot types and all four parts.
  The long sequence of $M_o$ cutoffs is represented by a clock and reusable buffers, not by $M_o$ copies of these data.

Put $ell_N = ceil.l log_2 \( N + 2 \) ceil.r$. Fix once an integer $C_L > E + 100$ and pad each raw symbol to

#[#set math.equation(numbering: n => "(5.11)")
 $ L = \( ell_N + C_(upright("base")) \)^(C_L) . $ <oe:raw-length>]

A fixed lower bound on $C_(upright("base")) gt.eq 1$ makes (5.10) fit for every $N$.
  The unpadded construction is still parameterized by $r$ and the same slot schema.
  Increasing $C_(upright("base"))$ later adds zero padding only.
  The raw word and all center-specific public descriptions have total length

#[#set math.equation(numbering: n => "(5.12)")
 $ \| Gamma \| "poly" \( ell_N \) = M_o \| H \| "poly" \( ell_N \) = N "poly" \( ell_N \) . $ <oe:total-raw-size>]

This is a bound on the listed bits, including index and field representations, rather than just the number of slots.

Every local test and proposal can now be implemented by a fixed polynomial-time bit algorithm on a bounded number
  of $L$-bit symbols. Parsing, loops over slots and the explicit group $H$, arithmetic in $J$,
  program interpretation, and multiplexing within a supplied polylogarithmic array use bounded nests of
  polynomially bounded loops. The largest local computation is the orbit-restricted parity solve of Lemma 21.
  Its dimension is at most

$ C \| O \| thin \| H \| thin dim_J \( U \) lt.eq C \| H \|^4 lt.eq C L^4 . $

Its explicitly stored matrix has $O \( L^9 \)$ bits if each field entry is bounded by $L$ bits.
  Gaussian elimination uses $O \( L^12 \)$ field operations,
  and elementary arithmetic and inversion have a schoolbook bound $O \( L^4 \)$ in this generous bit-length
  allowance. Even accessing each entry by a linear scan through the matrix,
  and scanning the full slot and metadata lists, adds only fixed polynomial factors.
  All other displayed local operations have the same type of finite loop bound.
  No routine iterates through the $M_o$ cutoffs to answer one query.
  Choose an integer $a$ exceeding the sum of these fixed loop and arithmetic exponents.
  A standard direct time-unrolling of a deterministic bit computation of length $O \( L^a \)$ gives an acyclic
  bounded-fanin Boolean circuit of size $O \( L^(2 a + 2) \)$:
  represent each configuration by its used tape cells and head indicators,
  and implement each next configuration by Boolean selection.
  Thus one fixed exponent $c_(upright("raw"))$ bounds all raw local circuits.
  Its precise numerical value is immaterial; the displayed construction fixes it before correction rounds or port
  arities are selected.

All lists and constants are uniformly constructible. Global algorithms enumerate the finite fields, groups,
  public routing tables, and full constant encodings, using the deterministic searches and linear algebra of
  Sections 3 and 4. Their time is $"poly" \( N \)$, though it need not be quasilinear.
  Input-dependent data without succinct evaluation at $c$ are accessed through (5.2);
  other public constants are hardwired only at the bounded, publicly specified neighbors of the requested center.
  There is no hidden access to an unrepresented length-$N$ array.

=== 5.6 Correction and the complete outer interface <correction-and-the-complete-outer-interface>

All full and scratch slots of $R_v$ satisfy their A constraints.
  Apply the joint A-axis corrector of Lemma 17 to all of them,
  together with majority correction of the repeated clock and canonical padding.
  The local decoder enumerates at most $2^d$ label subsets and solves the common scalar constraints componentwise.
  Since $d$ is fixed, this again has a fixed polynomial bound in $L$,
  independent of the number or dimensions of the packed slots.
  Enlarge $c_(upright("raw"))$ once to cover this one-round routine.

Let $Q gt.eq 2$ bound its neighborhood size and the sizes of the raw neighborhoods.
  For any fixed nonnegative integer $t$, unrolling $t$ correction rounds followed by a raw local routine uses at most

#[#set math.equation(numbering: n => "(5.13)")
 $ C \( 1 + Q + dots.h.c + Q^t \) = O \( Q^t \) $ <oe:fixed-interface-composition>]

copies of these same $L$-bit circuits. Their intermediate outputs still have length $L$.
  It follows that, for a constant $C_t$ depending on $t$, the composite circuit has size at most $C_t
  L^(c_(upright("raw")))$. Its ports are the finitely many compositions of the original permutations to depth at
  most $t$, followed by a raw neighborhood. The exponent is independent of $t$.
  A later increase of $C_(upright("base"))$ changes only the linear work of checking and writing padding;
  it changes neither this exponent nor the number of ports.
  In particular, fixed multiplicative constants may be absorbed into a subsequent exponent allowance with slack by
  increasing $C_(upright("base"))$ after all those constants have been fixed.

#thm([Theorem 5.4.])[
  (Outer representation interface).  #emph[There are fixed positive constants $delta_(upright("raw")) \,
    rho_(upright("raw"))$, fixed integers $C_L \, c_(upright("raw"))$,
    and uniform deterministic algorithms with the following properties for every End-of-Line input of length $N$.
    They construct a directed graph of valid extended labels, represented by canonical words
$ R_v in \( { 0 \, 1 }^L \)^Gamma \, wide \| Gamma \| = N "poly" \( ell_N \) \, wide
  L = \( ell_N + C_(upright("base")) \)^(C_L) \, wide ell_N = ceil.l log_2 \( N + 2 \) ceil.r \, $

 where $C_(upright("base"))$ may be any sufficiently large fixed integer.]
  + #emph[#strong[Graph and endpoint data.] The graph has indegree and outdegree at most one, no self-edges,
    and no isolated vertices. It has the public distinguished source $v_(*)$ and actual successor $v_(*)^(+)$ in
    (5.7); their entire words are computable in $"poly" \( N \)$ time.
    Every other endpoint is mapped in $"poly" \( N \)$ time to a nonzero solution of the input End-of-Line
    instance. Every canonical word is computable from its valid label in polynomial time.]
  + #emph[#strong[Distance and valid-word testing.] Distinct canonical words have normalized symbol distance at
    least $delta_(upright("raw"))$. A uniform center test has perfect completeness and uses only a fixed finite
    list $Pi$ of permutation-neighbors, of cardinality $q$ independent of $N$.
    For every fixed $alpha > 0$ there is a fixed $theta_alpha > 0$ such that
$ "rej" \( W \) < theta_alpha quad arrow.r.double quad "dist" \( W \, R_v \) < alpha quad
  upright("for some valid ") v . $

 Also $"rej" \( W \) lt.eq q "dist" \( W \, R_v \)$ for every valid $v$.]
  + #emph[#strong[Local proposals and flags.] At each requested center,
    total deterministic routines on $Pi \( k \)$ compute a next or previous proposed symbol and an existence bit.
    On $R_v$ the bit is independent of the center and equals the actual edge-existence flag.
    If it is one, the proposed symbols form exactly the canonical neighboring word; if it is zero,
    the default proposal is $R_v$ itself.]
  + #emph[#strong[Value-independent uncertainty correction.] There is a total local one-round corrector with a
    bounded permutation neighborhood. If $\| U \| \/ \| Gamma \| lt.eq rho_(upright("raw"))$,
    it maps every word agreeing with $R_v$ outside $U$ to a word agreeing with $R_v$ outside a set $U^(+)$
    determined only by $U$, with $\| U^(+) \| lt.eq \| U \| \/ 2$.
    Consequently $t$ rounds leave a prescribed uncertainty support of density at most $2^(- t) \| U \| \/ \|
    Gamma \|$. The guarantee holds for arbitrary values on $U$.
    Different requested-center simulations may use different values there,
    provided repeated occurrences of a position are consistent within each individual cone.]
  + #emph[#strong[Global recovery.] From any word within $rho_(upright("raw"))$ symbol distance of a valid word,
    a deterministic polynomial-time algorithm recovers its exact extended label and raw word.
    It then recovers the logical bits by systematic coefficient extraction and evaluation on the subgroup.
    In particular it extracts an End-of-Line answer whenever the recovered label is a nonexceptional endpoint.]
  + #emph[#strong[Uniform cost and order of choices.] The total raw data and listed public descriptions have $N
    "poly" \( ell_N \)$ bits and are constructible in $"poly" \( N \)$ time.
    Each raw local test, proposed symbol, flag, and one-round corrector has a Boolean circuit of size at most $C
    L^(c_(upright("raw")))$ on a fixed number of symbols. For each fixed $t$,
    correction for $t$ rounds followed by any such raw routine has size at most $C_t
    L^(c_(upright("raw")))$ and at most $O \( Q^t \)$ symbol ports, with uniform construction for that $t$.
    The exponents $C_L \, c_(upright("raw"))$ are fixed before $t$ and any later port arity.
    Further fixed additive padding in $C_(upright("base"))$ has only linear processing cost and does not change
    these exponents or arities.]
] <thm:outer-representation>

#proof[
  The graph and local evolution were established in Lemma 24 and (5.6). The tester and distance are Lemma 25.
    For example, its constants allow
  $ theta_alpha = min { g_(upright("rep")) \/ 2 \, alpha \/ \( 2 C_(upright("rep")) \) } . $
  All local proposals use the same primitive permutation list as the tester,
    enlarging it by a fixed number of maps if necessary.
  For the correction claim, let $d$ and $delta_1$ be the outer A-code degree and distance.
    Choose $rho_(upright("raw"))$ smaller than both $delta_(upright("raw")) \/ 3$ and $delta_1 \/ 4$,
    and smaller than the fixed uncertainty radius in Lemma 17.
    An admissible choice of $U^(+)$ is the set of centers having at least $\( delta_1 \/ 2 \)
    d$ neighbors in $U$ in a forward or inverse A list. Off this set all row suggestions have fewer than half the
    local minimum distance in errors, so the joint decoder recovers the reference exactly;
    the clock majority and padding agree there too. If $u = \| U \| \/ \| Gamma \|$,
    the spectral estimate from that lemma gives
  $ frac(\| U^(+) \|, \| Gamma \|) lt.eq frac(2 lambda^2 u, \( delta_1 \/ 2 - u \)^2) lt.eq u / 2 . $
  Neither this support nor the proof refers to the values inside $U$.
    For a requested-center cone with consistent repeated positions,
    extend its initially supplied values arbitrarily to the whole word, setting the reference outside $U$.
    The same support argument applies. This proves the assertion even when separate cones choose different extensions.
  After $O \( log \| Gamma \| \)$ synchronous global rounds the uncertainty set has cardinality less than one,
    giving exact recovery in polynomial time. From a recovered logical singleton slot,
    read its coefficient payload and evaluate the degree-$< h$ interpolant at $omega^j$, $0 lt.eq j < h$,
    to obtain the corresponding logical bits. The repeated clock gives $\( c \, eta \, j \)$.
    The distance choice makes the promised reference unique. On inputs outside the recovery promise the algorithm
    has a total default; it may check the decoded label and its canonical word by the global polynomial-time
    algorithms. Finally, (5.8)–(5.12) and (5.13) give all asserted cost and parameter-order statements. ◻
]

== 6 Binary composition and the robust outer circuit <sec:outer-composition>

We now convert the symbol representation into a generalized circuit.
  Two features of the conversion require separate arguments.
  A local Boolean function may inspect polynomially many bits of a bounded number of symbols;
  its implementation must tolerate failures among its own gates.
  Moreover, sharing such implementations must not allow one corrupted physical value to spoil an unbounded number
  of decisions. We state the first interface, proved in Section 9,
  and then give the construction and all the counting and synchronization arguments for the second.
  The same sequence is used inside a decision gadget in Section 9:
  first obtain replica synchronization without trusting decisions,
  then bound unstable comparisons and failed computations, and finally use the clipped mean displacement to locate
  an endpoint. At the outer scale, a completed decision is shared by a group of output replicas, called a cohort;
  its internal gates and external read occurrences are charged separately from each output’s own remaining gates.

Throughout this section, a distance between words is relative Hamming distance, unless a norm is displayed.
  A constant may depend on previously fixed accuracies, but never on the End-of-Line input or its length.
  A “fixed branch” of a randomized answer tree means that the earlier hypothetical answers are fixed when the
  randomized algorithm is described. It does not mean conditioning the probability space on receiving those
  answers. This distinction applies also to branches never executed.

=== 6.1 A fixed port and a robust Boolean decision <a-fixed-port-and-a-robust-boolean-decision>

The port family will encode every raw symbol in the same binary format.
  Its tester lets us recognize symbols close enough to use,
  and its recovery radius is fixed before we know how many symbols a corrected local computation will inspect.
  Once that arity is fixed, the robust-decision part of the interface realizes one Boolean output of such a
  computation. It provides many designated copies of the answer,
  so the guarantee remains useful even when failed gates concentrate on designated outputs.

#thm([Theorem 6.1.])[
  (Standardized ports and robust decisions).  #emph[For every fixed positive integer exponent allowance
    $c_(upright("allow"))$, there are a cutoff $L_(upright("port"))$ and a uniform family of injective binary
    encodings, for $L gt.eq L_(upright("port"))$,
$ cal(D) : { 0 \, 1 }^L arrow.r { 0 \, 1 }^(S_0) \, wide S_0 = "poly" \( L \) \, $

 with fixed positive relative distance $d_B$, satisfying (i)– (ii) below.
   The radius $nu_B$ in (iii) is fixed with this port family;
   the actual-gadget assertions in that part have the separate later cutoff specified there.]
  + #emph[Every coordinate of $cal(D) \( s \)$ is a multilinear polynomial in the bits of $s$ over $bb(F)_2$,
    of degree at most $10$. Its coefficient list is computable in time polynomial in $L$.
    The degree bound is independent of $c_(upright("allow"))$.
    Encoding and exact recovery from a fixed positive relative-error radius are deterministic polynomial-time
    algorithms.]
  + #emph[A perfect-completeness tester makes a bounded number of bit queries and performs bounded Boolean answer
    processing. Its public randomness has an enumerable polynomial-size rational support and polynomial bit
    complexity. For every fixed $a > 0$, there are a fixed $theta_B \( a \) > 0$ and a cutoff $L_B \( a \) gt.eq
    L_(upright("port"))$, allowed to depend on $a$, such that for every $L gt.eq
    L_B \( a \)$ rejection below $theta_B \( a \)$ implies distance less than $a$ from
    $cal(D) \( { 0 \, 1 }^L \)$. A word at distance $a$ from an encoding has rejection at most $C_B a$,
    for a fixed $C_B$. Each fixed-branch query has a bounded-density marginal relative to the uniform distribution
    on the block. These assertions include arbitrary words and all hypothetical branches.]
  + #emph[There is a constant $0 < nu_B < d_B \/ 4$ determined with this encoding, before any arity is specified.
    Subsequently fix an arity bound $k$, a size factor $C_f$, and a desired output loss $upsilon > 0$.
    There is a further cutoff $L_g$, allowed to depend on these fixed choices,
    such that all actual-gadget assertions below hold for every $L gt.eq max { L_(upright("port")) \, L_g }$.
    Consider any single-bit Boolean function of at most $k$ length-$L$ strings,
    described by an acyclic fan-in-at-most-two circuit over a fixed Boolean basis with public constants,
    of size at most $C_f L^(c_(upright("allow")))$. Some inputs may be declared public $0^L$.]
    #emph[There is a uniform generalized subcircuit for this function, with a common count scale $G_0 =
      "poly" \( L \)$ for all padded functions under these bounds, at most $C_g G_0$ gates,
      and a set of $W$ designated output wires produced by its gates, where
#[#set math.equation(numbering: n => "(6.1)")
 $ c_g G_0 lt.eq W lt.eq C_g G_0 . $ <out:designated-count>]

 Here $c_g \, C_g > 0$ are fixed. Each nonpublic external input is a block of physical reads $X = 3 x - 1$,
   with $x in \[ 0 \, 1 \]$, compared to a public common rational threshold $xi in \[ 2 \/ 5 \, 3 \/ 5 \]$.
   Every external comparison occurrence in the complete unfolded subcircuit can be routed separately to an
   external replica. For each external port position, the total number of these occurrences is at most
#[#set math.equation(numbering: n => "(6.2)")
 $ C_(upright("occ")) G_0 \/ S_0 \, $ <out:port-occurrence>]

 uniformly over $xi$, the function, and its public parameters.
   This counts all hypothetical branches, including unsuccessful and default branches.]
    #emph[There are fixed $delta_g \, gamma_g \, epsilon_g > 0$ with the following universal soundness property.
      Fix logical strings $s_1 \, dots.h \, s_k$ and ideal binary port words $y_j$ satisfying
      $"dist" \( y_j \, cal(D) \( s_j \) \) lt.eq nu_B$ for each nonpublic port.
      For any subsequently chosen fixed physical margin $omega > 0$, use
$ 0 < epsilon lt.eq epsilon_g \, wide epsilon < omega \/ 1000 . $

 Suppose at most $gamma_g G_0$ external comparison occurrences fail to have a physical value on the side of $xi$
   specified by the corresponding bit of $y_j$, at gap greater than $omega$.
   Repeated occurrences need not have consistent physical values.
   Then every assignment of the internal nodes in $\[ 0 \, 1 \]$ with at most $delta_g
   G_0$ failed gates makes all but $upsilon W$ designated wires correct near-bits for
   $f \( s_1 \, dots.h \, s_k \)$: at most $epsilon$ for zero and at least $1 - epsilon$ for one.]
  #emph[The port construction and $nu_B$ are independent of $k \, C_f \, upsilon$.
    The later constants, the gate-count bounds, and the topology bounds may depend on these fixed choices,
    but not on $L \, xi$, or the later margin $omega$. The threshold may appear as a rational gate parameter.
    Construction and other parameter computations take polynomial time in $L$ and the supplied description
    lengths, including the bit length of $xi$; all parameter lengths are bounded by a polynomial in these
    quantities. In particular an arbitrarily long externally supplied threshold is charged for its bits.]
] <thm:port-gadget>

Sections 7 and 8 construct the algebraic and binary ingredients.
  Proposition 70 proves the fixed encoding, tester, and recovery assertions.
  The remaining construction in Section 9 proves the physical occurrence bound (9.14), gate count (9.18),
  and robust output guarantee (9.25), using the independent geometric procedures proved in Section 10.
  None of these constructions uses the outer circuit constructed here.

=== 6.2 Port substitution, validation, and average correction <port-substitution-validation-and-average-correction>

Apply Theorem 26, writing its raw encoding as $R_w = \( s_k \)_(k in Gamma)$, with

$ ell_N = ceil.l log_2 \( N + 2 \) ceil.r \, wide L = \( ell_N + C_(upright("base")) \)^(C_L) \,
  wide \| Gamma \| = O \( N ell_N^(O \( 1 \)) \) . $

Choose $c_(upright("allow")) > c_(upright("raw")) + 12$, with any additional fixed local polynomial overhead
  absorbed in this inequality, and construct $cal(D)$ before choosing correction rounds. Put

#[#set math.equation(numbering: n => "(6.3)")
 $ E_w = \( cal(D) \( s_k \) \)_(k in Gamma) \, wide m = \| Gamma \| S_0 . $ <out:binary-encoding>]

The product of the two relative distances is a positive Hamming-distance bound;
  write $d_(*) > 0$ for its square root, a lower bound on normalized Euclidean separation.
  The distinguished source and its actual successor are publicly computable in polynomial time.

There is a fixed radius $rho_(upright("dec")) > 0$ from which these words can be decoded globally.
  Indeed, let $r_B > 0$ be a port recovery radius and $r_(upright("raw")) > 0$ a raw recovery radius.
  If the whole binary distance is less than $r_B r_(upright("raw")) \/ 2$,
  at most an $r_(upright("raw")) \/ 2$ fraction of port blocks can be at distance at least $r_B$ from their true
  block. Decode all ports, using a fixed default on an invalid or unsuccessful decoder output,
  and then use the raw decoder. An incorrect decoding at a bad site need not be detectable;
  the raw error bound already charges all such sites. Fix a smaller radius $rho_(upright("dec"))$ if necessary.

The graph in Theorem 26 has indegree and outdegree at most one, no self-edges, and no isolated vertices.
  Write $w_(*)$ for its distinguished source, which has an actual successor,
  and call every other missing-neighbor vertex a desired endpoint.
  The geometric construction applies to this encoded graph.
  For an edge $u arrow.r v$, its four-block polygon successively changes the second, third, first, and third blocks:

$ \( E_u \, E_u \, 0 \, 0 \) & arrow.r \( E_u \, E_v \, 0 \, 0 \) arrow.r \( E_u \, E_v \, 1 \, 0 \)\
 & arrow.r \( E_v \, E_v \, 1 \, 0 \) arrow.r \( E_v \, E_v \, 0 \, 0 \) . $

Here a scalar in a block denotes its constant repetition.
  The corners are rounded, and a segment in the fourth block enters the distinguished source from
  $\( E_(w_(*)) \, E_(w_(*)) \, 0 \, 2 \)$. Theorem 73 constructs a displacement field on

$ cal(B) = \[ - 1 \, 2 \]^(4 m) \, wide lr(bar.v.double U bar.v.double)_(upright(b))^2 = 1 / m sum_i U_i^2 \, $

where all distances to subsets of $cal(B)$ use this norm.
  Each point of its endpoint set $cal(E)$ has first block exactly $E_w$ for a desired endpoint $w$;
  the top of the extra segment is excluded. For any sufficiently small fixed rational $tau > 0$,
  chosen to meet the validation and global-recovery bounds in (6.6), there are constants $B_1 \, c_(*) \,
  beta_0 > 0$ and a field $v$ such that, after increasing $B_1$ to an integer,

#[#set math.equation(numbering: n => "(6.4)")
 $ lr(bar.v.double v \( U \) bar.v.double)_oo lt.eq B_1 - 1 \, wide
   lr(bar.v.double "clip"_(cal(B)) \( U + beta v \( U \) \) - U bar.v.double)_(upright(b)) gt.eq
   c_(*) beta $ <out:geometry-displacement>]

whenever $"dist" \( U \, cal(E) \) > 10 tau$ and $0 < beta lt.eq beta_0$.
  These constants precede estimator accuracy and the step $beta$.
  The circuit will keep many replicas of each physical coordinate and force their mean vector close to $cal(E)$;
  rounding the first block will then permit global recovery.

To approximate the field locally, the numerical procedure of Lemma 80 rounds the first two blocks at one common
  threshold $xi in \[ 2 \/ 5 \, 3 \/ 5 \]$. Each rounded word is a seed for validation.
  On good decisions an accepted seed must identify one fixed reference vertex,
  independent of the random acceptance decision and of the requested confidence or numerical accuracy;
  a seed in the intermediate region may be accepted or rejected.
  If one of the first two physical blocks is within $5 tau$ of a valid word,
  its seed must be accepted with that reference on good decisions for every allowed threshold.
  The procedure then asks for incident-edge flags, bits of each reference and its actual neighbors,
  and bits of the distinguished source and its successor. Each word-bit request uses either the coordinate
  matching the field component being estimated or a preallocated uniform coordinate for a bounded scalar
  statistic. Each reference and its neighbors determine a bounded list of incident path pieces;
  a fixed mesh and estimates of their scalar data approximate the field near those pieces.
  Scalar reads use fixed-width quantization with a public offset. We next supply these calls.
  Their number is fixed once the geometric mesh, scalar sample counts and numerical tolerances have been chosen,
  before the smaller bit-error budgets are assigned.

#thm([Lemma 6.2.])[
  (Protecting functional inputs).  #emph[There are constants $0 < a_1 < a_2 < nu_B$,
    fixed before the arity of any functional invocation, with the following property.
    A bounded Boolean flag routine on an arbitrary binary port block can have arbitrarily small fixed failure
    probability, unflagging every block within $a_1$ of an encoding and flagging every block at distance at least
    $a_2$ from all encodings. In a functional invocation replace flagged ports by public $0^L$.
    Except on the union of the completed flag routines’ failure events,
    every nonpublic input of every selected invocation is within $nu_B$ of its intended encoding.]
] <out:flags>

#proof[
  Choose $a_2 < nu_B$ and then $a_1$ so small that $C_B a_1 < theta_B \( a_2 \) \/ 4$.
    Estimate port-tester rejection by a fixed number of independent trials and compare to $theta_B \( a_2 \) \/
    2$. Bounded independent variables give any fixed confidence by increasing the fixed sample count.
    In the interval between the two promises either Boolean result is permitted.
    An unflagged block on the good event is within $a_2$ of an encoding, unique because $a_2 < d_B \/ 4$;
    take its logical string as the intended input. A flagged input is explicitly a public zero,
    so it requires no external near-port premise. A union bound is applied to the finite list of completed flag
    promises, after that list has been fixed. Their internal tester answer trees are not counted as new logical
    promises. ◻
]

Fix a physical vector $U$ and initially fix its rounding threshold and scalar offset.
  A rounded seed $y = \( y_k \)_(k in Gamma)$ is now a fixed binary word;
  use bit one at equality with the threshold. For analysis,
  define a global nearest-symbol convention $s^(*) \( k \)$ at every site within $a_2$ of a port encoding,
  and choose a fixed arbitrary string elsewhere. An ideal functional call computes its Boolean function on these
  symbols at unflagged inputs and on $0^L$ at flagged inputs.
  Within one correction cone, deduplicate repeated raw sites and share their flag and initial logical value.
  Different cones may make different choices at uncertain sites.

#thm([Lemma 6.3.])[
  (Binary validation).  #emph[There are fixed $0 < rho_(upright("comp")) < rho_(upright("acc"))$,
    with $rho_(upright("acc"))$ smaller than the uniqueness radius of (6.3),
    and a finite ideal Boolean validation procedure such that, with arbitrarily high fixed probability,
    acceptance implies distance less than $rho_(upright("acc"))$ from a unique valid $E_w$,
    and distance less than $rho_(upright("comp"))$ implies acceptance with the true reference.
    The procedure uses port flags, port tests, and bounded raw-checker functional calls.
    It remains valid with averaged stationary expander-walk sampling as described below.]
] <out:validation>

#proof[
  Choose $rho_(upright("acc"))$ small enough that $rho_(upright("acc")) \/
    a_1$ is within the raw uncertainty-correction radius. Choose $alpha < rho_(upright("acc")) \/
    4$ and take the raw gap $0 < theta_alpha lt.eq 1$ from Theorem 26.
    Writing $q = \| Pi \|$ for its bounded checker-neighborhood size, choose $0 < a < a_1$ and $b_0 > 0$ satisfying
  #[#set math.equation(numbering: n => "(6.5)")
   $ alpha + a + b_0 < rho_(upright("acc")) \, wide q b_0 < theta_alpha \/ 16 \, wide p_max =
     b_0 theta_B \( a \) > 0 . $ <out:validation-constants>]
  Decrease $p_max$ if necessary. Let $p$ be the average port-tester rejection over all sites.
    Estimate $p$, and independently simulate the raw checker at sampled centers using the flagged/substituted
    inputs. Accept when the first estimate is at most $p_max \/
    2$ and the simulated raw rejection estimate is at most $theta_alpha \/ 2$.
  On statistics of error less than $p_max \/ 4$, acceptance gives $p < p_max$.
    Consequently the fraction of sites not within $a$ of any port encoding is less than $b_0$.
    At a center whose entire neighborhood avoids these sites,
    good flag promises leave all inputs unflagged and make the simulated checker exactly the checker on the global
    word $s^(*)$. Exceptional centers occupy at most $q b_0$.
    In the analysis, also estimate the true checker result on $s^(*)$ to accuracy $theta_alpha \/
    8$ and the exceptional-center fraction to accuracy $theta_alpha \/ 16$.
    These are fixed bounded statistics; the algorithm need not compute the hypothetical true statistic.
    On their good events and the completed flags’ good events,
  $ Pr \[ upright("raw checker rejects ") s^(*) \] lt.eq theta_alpha \/ 2 + theta_alpha \/ 8 + q b_0 +
    theta_alpha \/ 16 < theta_alpha . $
  Raw soundness makes $s^(*)$ $alpha$-close to a valid $R_w$.
    Charging all raw-disagreement sites and all non-$a$-close sites at cost one yields
  $ "dist" \( y \, E_w \) < alpha + a + b_0 < rho_(upright("acc")) . $
  The uniqueness radius makes this reference independent of subsequent random acceptance decisions for the fixed $y$.
  Conversely, if $"dist" \( y \, E_w \) < rho_(upright("comp"))$, then $p lt.eq C_B rho_(upright("comp"))$.
    By Markov’s inequality at most $rho_(upright("comp")) \/ a$ of the ports are at distance at least $a$ from
    their true block. Outside their $Pi$-neighborhoods the simulated checker is the perfectly accepting raw
    checker. Choose $rho_(upright("comp"))$ so small that both means are strictly below one quarter of their
    acceptance thresholds; choose the sampling errors with the remaining slack.
    Flag error probabilities are set after the sample counts. This proves both assertions.
    The proof requires concentration of the sampled exceptional fraction when $p$ is small.
    It never requires an arbitrarily long batch to avoid every exceptional site. ◻
]

Choose the geometric radius so that

#[#set math.equation(numbering: n => "(6.6)")
 $ 4 \( 10 tau \)^2 < rho_(upright("dec")) \, wide frac(\( 5 tau \)^2, \( 2 \/ 5 \)^2) < rho_(upright("comp")) .
   $ <out:tau>]

The second inequality supplies physical validation completeness:
  every incorrectly rounded coordinate of a binary word costs at least $\( 2 \/ 5 \)^2$ in squared distance for
  every allowed threshold. Fix the resulting $B_1 \, c_(*) \, beta_0$ and fix $kappa = 1 \/ 100$,
  the replica gap used below. Set the unscaled estimator error target with slack,
  smaller than $c_(*) kappa \/ 100$ in normalized root-mean-square norm.

#thm([Lemma 6.4.])[
  (Average correction of every relevant word role).  #emph[After fixing the high-level mesh and statistical call
    counts, boundedly many raw correction rounds suffice to supply every required incident flag and every
    requested encoding bit, with any prescribed fixed average error.
    The average is over a uniform output component or its uniform-marginal statistical requests.
    The conclusion holds unconditionally for every true reference that can be accepted on good validation
    decisions, before selecting pieces or numerical winners. All resulting single-bit functions fit the fixed
    exponent allowance of Theorem 27.]
] <out:average-correction>

#proof[
  Fix a rounded seed that can be accepted on good validation, and its unique reference $R_w = \( s_k \)$. Put
  $ U_0 = { k : "dist" \( y_k \, cal(D) \( s_k \) \) > a_1 } \, wide \| U_0 \| \/ \| Gamma \| lt.eq
    rho_(upright("acc")) \/ a_1 . $
  Outside $U_0$, good flags unflag the port and its unique nearest logical string is $s_k$.
    Within $U_0$, substitution and intermediate flag choices may supply arbitrary values.
    In each deduplicated cone extend those initial values to a whole raw word agreeing with $R_w$ outside $U_0$.
    The raw uncertainty theorem gives a residual set $U_t$, depending only on $U_0$,
    with arbitrarily small fixed density after sufficiently many fixed rounds $t$.
    Its guarantee holds simultaneously for every such extension.
    Thus different cones and correlated intermediate flags cause no additional exceptional support.
    A corrected symbol is right off $U_t$; a local proposal and edge flag are right off a fixed permutation
    expansion of $U_t$.
  Compute an edge flag at a uniform-marginal center. For a requested own or neighboring encoding bit,
    compute the appropriate raw output symbol and then the requested coordinate polynomial of $cal(D)$.
    Matching coordinates are uniform in the output average; the statistical requests have the same center
    marginal. Each fixed permutation expansion therefore costs at most its size times $\| U_t \| \/ \| Gamma \|$.
    Set $t$ for the already fixed list of high-level true roles and calls.
    No union over all possible intermediate flag patterns is necessary.
  The raw simulation uses at most $C_t L^(c_(upright("raw")))$ Boolean gates, with exponent independent of $t$.
    A degree-at-most-ten Boolean polynomial has at most $sum_(j = 0)^10 binom(L, j) =
    O \( \( L + 1 \)^10 \)$ monomials. Compute each monomial by a bounded-fanin AND tree and their sum by XOR
    gates expanded in the fixed basis. Coefficients and the requested bit’s description are publicly generated.
    The extra bit-index and padding work has a fixed polynomial exponent.
    Our initial choice of $c_(upright("allow"))$ leaves slack for this work.
    The number of raw ports and the multiplicative factor may increase with $t$, but are now fixed.
    The port encoding and its radius do not change. ◻
]

The completed port flags are now amplified for the finite list of logical promises in validation and these
  correction cones. Conditional on a sampled site, they use fresh tester randomness.
  Make the probability that any selected invocation has a nonpublic input outside $nu_B$ arbitrarily small.
  This protection concerns arbitrary rounded seeds, including seeds undergoing validation,
  and does not require exclusion of the geometric endpoint neighborhood.
  Uncertain flag results only choose which already uncertain inputs are substituted.

=== 6.3 Small-support ideal tapes and complete branch counts <small-support-ideal-tapes-and-complete-branch-counts>

#thm([Lemma 6.5.])[
  (Averaged expander sampling).  #emph[The statistics needed above can be sampled with polynomial-in-$L$ random
    support per output coordinate, with any desired fixed confidence in the average over output coordinates.]
] <out:walk>

#proof[
  Write an output coordinate as $\( b \, k_0 \, z_0 \)$ with $b in \[ 4 \]$, $k_0 in Gamma$,
    and $z_0 in \[ S_0 \]$. Use fixed-length labeled walks in the outer Cayley expander starting at $k_0$.
    Fresh bounded segments and auxiliary uniform positions in $\[ S_0 \]$ supply all center and word statistics.
    Averaging over uniform $k_0$ makes every walk position stationary.
    If the mean-zero operator norm is at most $lambda < 1$, bounded centered functions at times $s \,
    t$ have covariance at most $C lambda^(\| s - t \|)$. Independent auxiliary randomness only changes the bounded
    diagonal terms and replaces off-diagonal functions by their conditional means.
    Therefore a batch of $q_s$ samples satisfies
  $ "Var" (1 / q_s sum_(j = 1)^(q_s) Z_j) lt.eq C / q_s^2 sum_(s \, t = 1)^(q_s) lambda^(\| s - t \|) lt.eq
    frac(C \( 1 + lambda \), \( 1 - lambda \) q_s) . $
  Chebyshev’s inequality and a finite union give any fixed confidence by choosing a sufficiently large fixed
    $q_s$. The argument permits distinct bounded functions at the different slots and separate batches for
    physical blocks.
  Apply it to port rejection, the fixed global raw-checker and exceptional indicators in validation,
    and each actual reference candidate’s statistics in the geometric procedure.
    At fixed rounded seeds those reference vertices are fixed whenever good acceptance is possible.
    Analyze all their roles before a numerical minimum or uncertain acceptance chooses which ones to use.
    The concentration is not conditioned on the realized answer path.
    Each walk has a fixed number of fixed-degree label choices.
    Each remaining choice has polynomial-in- $L$ support, and only a fixed number of choices is used.
    Their joint support per output coordinate is consequently polynomial in $L$. ◻
]

The preceding routines now meet the local-access contract of Definition 78.
  Validation supplies fixed unique references, average correction supplies the matching and statistical bit
  requests, and the walk lemma supplies concentration for each underlying true candidate.
  The geometric procedure reserves at most eight true word roles and thirty-two piece roles,
  as enumerated in Section 10.5. Missing roles are omitted; duplicate roles may be retained.
  For fixed $U$ outside the endpoint neighborhood and each fixed admissible binary and scalar-quantization offset,
  it gives arbitrarily small prescribed $4 bb(E)_(i \, upright("trial")) \| hat(v)_i - v_i \( U \) \|^2$,
  with $i$ uniform among the $4 m$ components. All bit and flag errors and all candidate statistics are analyzed
  before a numerical winner is selected. On the resulting good event,
  Lemma 82 controls every sufficiently near-minimizing candidate in each component before selection,
  so a winner correlated with the requested component is harmless.
  The needed bit-error bounds remain average bounds over the allocated requests.

Apart from the supplied calls, the procedure uses bounded comparison and Boolean-answer processing,
  public rational numerical tables, and a signed dyadic output in $\[ - B_1 \, B_1 \]$,
  including on every bad branch. A fixed-width scalar-quantization grid with an independently randomized offset
  suffices. Refining the finite grids of offsets changes comparison thresholds, not the number of bins, answers,
  or slots. All these statements concern the unscaled field.

This outer application uses the accuracy and finite-role clauses (i)–(iii) of Lemma 80 with completed ideal
  Boolean functional calls. Its optional physical-read clause (iv) is not applied to the full outer gadget
  expansion. The fixed count $H_(upright("out"))$ below counts direct outer read slots,
  and $B_(upright("out"))$ counts ideal functional invocations.
  Theorem 27 and Lemma 33 separately bound every physical read created by substituting those invocations.

Applying parts (i)–(iii) of Lemma 80 at this ideal-oracle level, with the preceding accuracy choices,
  we obtain ideal dyadic outputs satisfying, for every eligible fixed $U$ and every fixed admissible offset,

#[#set math.equation(numbering: n => "(6.7)")
 $ 4 bb(E)_(i \, upright("tape")) \| hat(v)_i - v_i \( U \) \|^2 < \( c_(*) kappa \/ 100 \)^2 . $ <out:ideal-accuracy>]

All outputs remain in $\[ - B_1 \, B_1 \]$ on bad trials.
  The good-port failure probability can independently be made arbitrarily small on this high-level call list.
  It is useful to record the order explicitly:

+ Fix geometric roles, mesh, scalar counts and numerical tolerances.
+ Choose validation confidence and raw correction rounds for this finite logical-call list;
  fix the number of ports in every cone.
+ Amplify each completed flag for its prescribed failure probability.
  Amplification adds tester reads, not new logical promises.
+ Only now unfold the complete outer answer tree, leaving functional calls unexpanded and obtaining a fixed number
  $H_(upright("out"))$ of direct read slots and $B_(upright("out"))$ of hypothetical functional invocations.
+ Choose $upsilon$ for these $B_(upright("out"))$ invocations and apply Theorem 27 with the now fixed arity and
  size factor.

This order does not define a bit accuracy by a union bound over the very answer tree created by amplifying that
  accuracy.

At the ideal-oracle level, unfold every flag pattern, substitution pattern, quantized bin and hypothetical answer.
  Functional-call nodes remain unexpanded: each contributes one completed Boolean oracle answer,
  and its physical implementation is separately accounted for below.
  Thus $H_(upright("out"))$ counts only direct read slots and $B_(upright("out"))$ counts functional invocations.
  Supply randomness to unused nodes too. Earlier answers that determine an invocation’s function or addresses are
  fixed publicly in that copy; they are not additional fragile input wires.
  Thus all port functions remain Boolean functions on their declared raw ports.
  A wrong numerical answer selects another reserved role or a finite table case.
  It cannot become an arbitrary hidden word address. Each hypothetical raw site is $pi \( k_0 \)$ for $pi$ in a
  fixed finite set $cal(P)$: compose walk-label moves, raw-neighborhood permutations and correction-cone moves.
  This set is independent of later offset-grid refinement. Direct scalar and bit slots use matching $z_0$,
  independently sampled uniform within-block positions, or the port tester’s smooth queries.
  For fixed $k_0$ and fixed offsets, summing their unconditioned position densities over the finite complete tree
  gives a constant.

The tape law in the next lemma includes both late offset grids—the binary threshold and the independent
  scalar-quantization offset—together with all internal choices at the hypothetical nodes.
  The grids are fixed before this final law is rationalized.
  The preceding accuracy estimates hold for each fixed offset, and hence for this joint law;
  the finite grids multiply its support bound only by a fixed factor.

#thm([Lemma 6.6.])[
  (Rational tapes and their read loads).  #emph[The true tape law can be replaced deterministically,
    at each output coordinate, by a list of a common square length $T_(upright("tap")) = "poly" \( L \)$,
    with total variation at most $eta_0 \/ S_0$, for any prescribed fixed $eta_0 > 0$.
    The lists use only choices in the original support. They preserve (6.7) and any bounded rare-event estimate
    with arbitrarily small fixed slack. Across these lists, every base physical coordinate is read by at most $C
    T_(upright("tap"))$ direct comparison slots in the complete unfolded outer trees.]
] <out:tapes>

#proof[
  Let $Q \( L \)$ bound the enumerable rational support of every tape law.
    For a common square $T gt.eq Q \( L \) S_0 \/ eta_0$, round each mass $T
    p_j$ down to an integer and distribute the remaining copies among nonzero support entries.
    Each mass error is at most $1 \/ T$, and total variation is at most $Q \( L \) \/ T lt.eq eta_0 \/ S_0$.
    Floors, remainders and the ordering of entries are computed with exact rational arithmetic in polynomial time.
    The probability descriptions have polynomial bit complexity.
    A function in $\[ 0 \, A \]$ changes expectation by at most $A$ times total variation,
    proving the bounded-statistic assertions.
  For the load assertion, explicitly list all potential direct slots $cal(A)$,
    including their fixed earlier-answer paths; set $H = \| cal(A) \|$.
    If a slot is omitted or supplied a public value, its read subdistribution is dominated by that of its
    potential slot; it is never renormalized on being selected.
    Fix a target $\( b' \, k' \, z' \)$ and a possible $pi in cal(P)$.
    Its preimage $k_0 = pi^(- 1) \( k' \)$ is fixed. For every fixed offset, the true law gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ sum_(z_0 = 1)^(S_0) bb(E) \[ upright("number of direct reads at ") \( b' \, k' \, z' \) \] lt.eq C \,
     $ <out:direct-density>]
  where $C$ is the sum of the unconditioned fixed-slot density constants.
    Matching coordinates contribute one, uniform sampled coordinates contribute their bounded counts,
    and tester queries contribute their smoothness constants. Branches and seed roles add only a fixed factor.
    A position-count random variable lies in $\[ 0 \, H \]$. Changing the law for one output by total variation
    $eta_0 \/ S_0$ adds at most $H eta_0 \/ S_0$ to its expectation; summing over $z_0$ adds only $H eta_0$.
    Sum the fixed preimages and physical roles and multiply by $T_(upright("tap"))$.
    This is the asserted $O \( T_(upright("tap")) \)$ load. A constant total-variation tolerance without the $S_0$
    denominator would not give this bound. ◻
]

The occurrence bound (6.2) for each substituted gadget uses the same full-tree principle at its own scale.
  Its tape approximation must control loads both on its internal word, of length $m_(upright("in"))$,
  and on an external port, of length $S_0$. Section 9 therefore uses total variation $eta \/ max { 4
  m_(upright("in")) \, S_0 }$; the calculations (9.14)–(9.14) give $O \( G_0 \/ S_0 \)$ external occurrences per
  port position and $O \( R_(upright("in")) \)$ internal reads per base coordinate,
  where $R_(upright("in"))$ is the gadget’s replica count and $G_0 = 4 m_(upright("in")) R_(upright("in"))$.
  This accounts for unequal polynomial block lengths without conditioning on an executed branch.

=== 6.4 Cohorts, individual read routing, and gate realization <cohorts-individual-read-routing-and-gate-realization>

At each base component $i in \[ 4 m \]$, allocate one cohort for every tape in its list.
  A cohort has $K_c$ output replicas, where $K_c$ is a square satisfying

#[#set math.equation(numbering: n => "(6.9)")
 $ max { 1 \, C_g G_0 } lt.eq K_c lt.eq C_K G_0 $ <out:cohort-size>]

for a fixed $C_K$; increasing $C_g$ if necessary also covers all designated-wire counts.
  The total number of replicas per component is $R = T_(upright("tap")) K_c$, again a square.
  Each cohort contains its complete bounded list of functional invocations,
  sharing these invocations among its $K_c$ outputs. For each invocation,
  assign its $W$ designated wires to these outputs by round robin. Since $W lt.eq K_c$,

#[#set math.equation(numbering: n => "(6.10)")
 $ \# { upright("uses of any designated wire") } lt.eq ceil.l K_c \/ W ceil.r lt.eq 2 K_c \/ W . $ <out:round-robin>]

A fraction $upsilon$ of wrong designated wires therefore affects at most $2 upsilon$ of the cohort outputs.
  The remaining gates, called a direct cone, are separately allocated for each output replica.

#thm([Lemma 6.7.])[
  (Bounded physical read multiplicity).  #emph[Every physical replica can be made the input of at most a fixed
    number of comparison occurrences, counting all outer and inner hypothetical branches.
    The construction is deterministic and uses no shared rounded bit between different comparison occurrences.]
] <out:routing>

#proof[
  Fix a physical block and a raw site $k'$. For each of the fixed possible address permutations,
    a functional port requesting $k'$ has a fixed $k_0$ preimage.
    There are $S_0$ output bit positions and $T_(upright("tap"))$ tapes at that preimage,
    and only a bounded number of invocation/port roles. Thus at most $C S_0
    T_(upright("tap"))$ invocation ports request $k'$. By (6.2), any position in that site is used at most
  #[#set math.equation(numbering: n => "(6.11)")
   $ C S_0 T_(upright("tap")) thin frac(C_(upright("occ")) G_0, S_0) lt.eq C' T_(upright("tap")) K_c =
     C' R $ <out:gadget-load>]
  times. Lemma 32, followed by replication over the cohort, gives $O \( T_(upright("tap")) K_c \) =
    O \( R \)$ direct comparison occurrences at each base coordinate.
    Enumerate all these occurrences and assign successive ones round robin to its $R$ physical replicas.
    Each actual replica has bounded resulting multiplicity. Each comparison is performed in its own gate cone
    directly on that replica’s $x$ value. In particular, an error in one comparison wire is not broadcast to other
    inner cones. ◻
]

Write the physical replica values and their means as

$ X_(i r) = 3 x_(i r) - 1 \, wide macron(X)_i = R^(- 1) sum_r X_(i r) \, wide
  lr(bar.v.double Y bar.v.double)_(upright("rep"))^2 = frac(1, m R) sum_(i = 1)^(4 m) sum_(r = 1)^R Y_(i r)^2 . $

A vector constant over replicas has replica norm equal to its base norm.
  Let $J$ be orthogonal projection onto these constant-over-replica vectors, so $J X =
  macron(X)$ with the usual identification.

For each $i$, average the replica labels using the half-lazy Margulis–Gabber–Galil operator $A_(upright("rep"))$
  on $\( bb(Z) \/ q bb(Z) \)^2$, $q = sqrt(R)$. Its sixteen equally weighted labels consist of eight identity
  labels and the eight moves

$ \( a plus.minus 2 b \, b \) \, quad \( a plus.minus \( 2 b + 1 \) \, b \) \, quad \( a \, b plus.minus 2 a \) \,
  quad \( a \, b plus.minus \( 2 a + 1 \) \) \, $

with multiplicities retained. For every positive integer modulus the normalized eight-move operator is symmetric
  with nonconstant numerical radius at most $5 sqrt(2) \/ 8$;
  see the primary formal proof #cite(label("MGGAFP")) #raw("mgg_numerical_radius"). Thus

#[#set math.equation(numbering: n => "(6.12)")
 $ A_(upright("rep")) J = J \, wide
   lr(bar.v.double A_(upright("rep")) \( I - J \) Y bar.v.double)_(upright("rep")) lt.eq \( 1 - kappa \)
   lr(bar.v.double \( I - J \) Y bar.v.double)_(upright("rep")) \, wide kappa = 1 \/ 100 . $ <out:replica-gap>]

The modulus need not be prime. Loops and parallel labels are kept as individual averaging inputs.
  The mean-zero space for modulus one is zero. Every averaging connection has bounded multiplicity as well.

We specify the direct cones using exactly the gate types in Definition 2.
  This also specifies how public constants and finite numerical processing are charged.
  Every needed constant node is the fresh output of a Constant gate in the cone using it,
  unless its value is incorporated as a legal Scale parameter or into a Boolean truth table.
  A physical comparison at threshold $t in \[ - 1 \, 2 \]$ is a Constant gate with parameter $\( t + 1 \) \/
  3$ and a Less gate on the physical replica’s $x$ node and that constant,
  with orientation chosen for the required bit. Outside the physical range its answer is a public constant.
  On a satisfied comparison, an ideal mean gap greater than $4 omega$, an actual read deviation at most $omega$,
  and $epsilon < omega \/ 1000$ leave a strict Less antecedent even after the constant error:
  the node-scale gap is at least $omega - epsilon > epsilon$.

Boolean finite tables, flag processing, and quantization-bin processing use And,
  Or and Not with fan-in at most two. If their inputs are correct near-bits,
  each gate produces the same correct near-bit interval, without accumulating Boolean error.
  In particular the weak inequalities at $epsilon$ and $1 - epsilon$ are sufficient.
  A selection among hypothetical invocations is implemented as a Boolean multiplexer:
  And each candidate answer with its selector and Or the resulting terms.
  An inactive selector is a low near-bit and forces that term low even if the unused candidate answer is arbitrary
  in $\[ 0 \, 1 \]$. Thus unsuccessful unused branches are shielded, without assuming that their outputs are bits.
  All finite answer tables have fixed size, although their public entries may depend on the tape and threshold.

Represent the ideal dyadic field value by

#[#set math.equation(numbering: n => "(6.13)")
 $ hat(v) = B_1 \( p^(*) - n^(*) \) \, wide p^(*) \, n^(*) in \[ 0 \, 1 \] \, quad p^(*) n^(*) = 0 \,
   $ <out:signed-value>]

using a fixed number of binary digits; enlarge the dyadic precision within the earlier estimator slack.
  Scale the near-bit digits by their dyadic weights and combine them by clipped Add gates to obtain $p \, n$.
  Compute the $x$-average by sixteen Scale gates of weight $1 \/ 16$ and a bounded Add chain.
  All exact partial sums are in $\[ 0 \, 1 \]$. Choose a positive rational step with $t_beta = beta B_1 \/ 3 lt.eq
  1$. Scale $p \, n$ by $t_beta$, add the positive term to the computed average, then subtract the negative term.
  The last output, or a final Copy output, is $x_(i r)$ itself.
  When the ideal signs are exclusive this expression is exactly

$ frac(1 + "clip"_(\[ - 1 \, 2 \]) \( \( A_(upright("rep")) X \)_(i r) + beta hat(v) \), 3) . $

Indeed if the negative term vanishes the only possible clipping is at the upper end;
  if the positive term vanishes it is at the lower end. The affine change of coordinates commutes with the
  stochastic average.

#thm([Lemma 6.8.])[
  (Coarse and fine direct-cone bounds).  #emph[There is a fixed $C_(upright("ar"))$,
    determined by the finite direct-cone shape before $beta$ is filled in,
    such that every entirely $epsilon$-satisfied direct cone obeys
#[#set math.equation(numbering: n => "(6.14)")
 $ \| X_(i r) - \( A_(upright("rep")) X \)_(i r) \| lt.eq 2 beta B_1 +
   C_(upright("ar")) epsilon . $ <out:coarse-pointwise>]

 No correctness of its Boolean or functional inputs is required.
   If its direct comparisons and selected invocation answers are correct near-bits for the ideal run on
   $macron(X)$, then also
#[#set math.equation(numbering: n => "(6.15)")
 $ \| X_(i r) -
   "clip"_(\[ - 1 \, 2 \]) \( \( A_(upright("rep")) X \)_(i r) + beta hat(v)_(i r) \( macron(X) \) \) \| lt.eq
   C_(upright("ar")) epsilon . $ <out:fine-pointwise>]

]
] <out:direct-cone>

#proof[
  All hidden nodes, including $p \, n$, remain in $\[ 0 \, 1 \]$ even when their logical values are wrong.
    Satisfied final Scale gates therefore make each signed term at most $t_beta + epsilon$.
    The absolute change from the computed average is at most their sum plus the final arithmetic errors.
    The averaging chain is within $C epsilon$ of its exact average.
    Returning to physical units gives (6.14), after enlarging $C_(upright("ar"))$.
    For the fine bound, induction through the shielded Boolean selections supplies the correct digits in (6.13).
    Scale is nonexpansive and clipped Add and Subtract are Lipschitz with respect to the sum of their input
    errors. For an explicit bound, let $J_d$ be the number of dyadic digits in one magnitude.
    A magnitude uses $J_d$ Scale and $J_d - 1$ Add gates; its error is at most $\( 3 J_d - 1 \) epsilon$.
    The sixteen Scale and fifteen Add gates for the average contribute at most $31 epsilon$.
    The two final Scale gates and the final Add/Subtract pair therefore contribute a total error at most
    $\( 6 J_d + 33 \) epsilon$ in node units, or $\( 18 J_d + 99 \) epsilon$ in physical units.
    An optional final Copy adds $3 epsilon$. The coarse bound’s arithmetic error is at most $108
    epsilon$ including that Copy. Thus $C_(upright("ar")) = 18 J_d + 108$ suffices for this implementation,
    uniformly in all Scale parameters in $\[ 0 \, 1 \]$. The exclusive-sign identity gives (6.15). ◻
]

Every invocation owns a disjoint gate set, and every direct cone owns a disjoint gate set.
  Internal outputs are fresh; designated and external wires are read-only fan-outs.
  The cyclic physical replica output is produced by the final gate of its own unique cone and by no other gate.
  There is no promised free constant node. Let

#[#set math.equation(numbering: n => "(6.16)")
 $ K_(upright("out")) = 4 m R \, wide \| T \| lt.eq C_(upright("tot")) K_(upright("out")) . $ <out:gate-count>]

The second assertion follows because a cohort has a bounded number of invocations, each with $O \( G_0 \) =
  O \( K_c \)$ gates, and $K_c$ direct cones of bounded size.
  Each designated output is included in its invocation’s gate count.
  In particular, concentrating failures on extraction gates receives the same charge as any other failures.

=== 6.5 All failure and spoilage charges <all-failure-and-spoilage-charges>

We next choose the late offsets. Use a uniform rational grid in $\[ 2 \/ 5 \, 3 \/ 5 \]$ for $xi$ and,
  independently, a uniform rational grid modulo the fixed scalar-bin width for the quantization offset.
  For every fixed physical value, the probability of lying within $4
  omega$ of a binary threshold or any relevant shifted scalar boundary is at most

#[#set math.equation(numbering: n => "(6.17)")
 $ C_(upright("bin")) \( D_(upright("grid"))^(- 1) + omega \) \, $ <out:anticoncentration>]

where $D_(upright("grid"))$ is a lower bound on the two grid sizes and $C_(upright("bin"))$ depends only on the
  already fixed widths and bin count. This follows by counting grid points in intervals of total length
  $O \( omega \)$, adding at most a fixed number of boundary grid points.
  The number of comparison slots is unchanged when the grids are refined.
  The ideal accuracy estimate is conditional on every allowed offset, so refinement cannot invalidate it.

Call a routed comparison occurrence #emph[spoiled] if its mean value is within $4
  omega$ of its prescribed boundary or if its physical replica value differs from its mean by more than $omega$.
  Otherwise its input has the prescribed ideal side with physical gap greater than $omega$.
  For direct cones, spoiled comparisons are charged to their output.
  For functional invocations, count the occurrences themselves, including all hypothetical branches.

#thm([Lemma 6.9.])[
  (Deterministic charges for arbitrary assignments).  #emph[There are fixed counting constants with the following
    properties. For an assignment with at most $delta \| T \|$ failed gates:]
  + #emph[At most a $C_(upright("tot")) delta$ fraction of direct cones contains a failed gate.]
  + #emph[Cohorts containing an invocation with more than $delta_g G_0$ failed gates account for at most $C
    delta \/ delta_g$ of all outputs.]
  + #emph[The total number of excessive-deviation comparison occurrences, divided by $K_(upright("out"))$,
    is at most $C lr(bar.v.double X - macron(X) bar.v.double)_(upright("rep"))^2 \/ omega^2$.]
  + #emph[The averaged number of ambiguous gadget comparison occurrences, divided by $K_(upright("out"))$,
    is at most $C \( D_(upright("grid"))^(- 1) + omega + eta_0 \)$.
    The fraction of direct cones with an ambiguous comparison has the same form of bound.
    Here the averaging over tapes is the actual empirical frequency of the circuit,
    and the bounds hold for every fixed mean vector.]
  + #emph[Cohorts containing an invocation with more than $gamma_g
    G_0$ spoiled external occurrences account for at most $C \/ gamma_g$ times the total normalized gadget-spoil count.]
] <out:charges>

#proof[
  Disjointness of direct gate sets proves (i). The number of invocations violating the threshold in (ii) is at
    most $delta \| T \| \/ \( delta_g G_0 \)$. Charging $K_c$ outputs for each and using (6.9) and (6.16) proves
    (ii), even if the same cohort is charged repeatedly. For (iii),
    Markov’s inequality gives at most $m R lr(bar.v.double X - macron(X) bar.v.double)_(upright("rep"))^2 \/
    omega^2$ excessive physical replicas. Lemma 33 bounds their total comparison multiplicity by a constant.
    The normalization $K_(upright("out")) = 4 m R$ only improves the bound.
  For (iv), fix a port of an invocation at site $k$ and threshold $xi$.
    Equation (6.2) bounds its ambiguous occurrences by
  $ C_(upright("occ")) G_0 thin frac(\# { z : \| macron(X)_(k z) - xi \| lt.eq 4 omega }, S_0) . $
  Every site is an image of a uniform $k_0$ under a member of the fixed permutation list.
    Sum over that list and all invocation ports under the unconditioned tape law,
    before selecting any answer branch. Averaging the offset and using (6.17) bounds the expected number per trial
    by $C G_0 \( D_(upright("grid"))^(- 1) + omega \)$. The full occurrence bound is uniform in
    threshold-dependent function data. Tape rationalization changes a count bounded by $C G_0$ by at most $C G_0
    eta_0 \/ S_0$. Dividing each trial’s charge by its $K_c$ output replicas gives (iv).
    Direct slots use the full-tree density argument in (6.8), and the same grid count;
    their count per trial is bounded by $H_(upright("out"))$.
    This reasoning applies to every fixed eventual mean, rather than a mean selected before construction.
    Finally, (v) is the same threshold counting proof as (ii), with spoiled occurrences replacing failed gates. ◻
]

=== 6.6 Parameter order and synchronization before decisions <parameter-order-and-synchronization-before-decisions>

We give an acyclic choice of all remaining constants. Reserve enough slack in (6.7) that after tape
  rationalization the ideal error norm is at most $c_(*) kappa \/ 20$. Choose $q_0 > 0$ so small that

#[#set math.equation(numbering: n => "(6.18)")
 $ 20 \( B_1 + 1 \) sqrt(q_0) < c_(*) kappa \/ 20 . $ <out:q0>]

The geometric and statistical accuracies, correction rounds,
  and completed flags are chosen as above to put the ideal good-port failure probability below, for example,
  $q_0 \/ 20$. These are logical-call budgets. After the complete outer tree is fixed,
  choose $2 B_(upright("out")) upsilon < q_0 \/ 20$ and obtain the gadget constants.
  Increasing $K_c$ for these gadgets weights every trial equally and does not magnify its ideal failure probability.

Now choose fine fixed offset grids, then a small positive rational $omega$, then a small tape tolerance $eta_0$,
  and then a desired synchronization radius $d_(upright("sync")) > 0$.
  By Lemmas 32 and 35, they can be chosen so that, whenever
  $lr(bar.v.double X - macron(X) bar.v.double)_(upright("rep")) lt.eq d_(upright("sync"))$,
  the sum of the following empirical output fractions is less than $q_0 \/ 2$:
  failure of the ideal good-port event, direct ambiguous/excessive comparisons,
  and cohorts having an invocation with too many spoiled occurrences.
  For example assign $q_0 \/ 20$ to each grouped term, with the $C \/
  gamma_g$ factors included before choosing the responsible parameter.
  Ideal squared error is bounded, so make $eta_0$ small enough for its reserved norm slack as well.
  This order is possible because all counts and density constants are already fixed and independent of these late
  grids and margins.

Choose a positive rational $beta lt.eq beta_0$ with $beta B_1 \/ 3 lt.eq
  1$ and small enough that $4 beta B_1 \/ kappa < d_(upright("sync")) \/ 2$.
  Finally choose positive rational $epsilon < 1 \/ 10$ and $delta < 1$ so small that

#[#set math.equation(numbering: n => "(6.19)")
 $ epsilon lt.eq epsilon_g \, wide epsilon < omega \/ 1000 \, wide C delta \/ delta_g < q_0 \/ 20 \,\
frac(4 beta B_1 + 2 C_(upright("ar")) epsilon + 6 sqrt(C_(upright("tot")) delta), kappa) < d_(upright("sync")) \,\
2 C_(upright("ar")) epsilon + 6 sqrt(C_(upright("tot")) delta) < beta c_(*) kappa \/ 20 . $ <out:epsilon-delta>]

There is positive slack in each inequality at $epsilon = delta = 0$, so fixed positive rational choices exist.
  If necessary decrease them for any remaining direct numerical slack.
  All unstable events other than failed direct cones, including the mapped extraction errors, now total less than $q_0$.

The finitely many lower-size cutoffs are imposed after these choices by increasing $C_(upright("base"))$.
  These include $L_(upright("port"))$, the finitely many $L_B \( a \)$ for the chosen tester accuracies,
  and $L_g$ for the fixed arity, size factor, and output loss. This does not create arity feedback.
  The raw algorithm’s exponent is independent of correction rounds;
  the chosen port allowance has slack above that exponent and the degree-ten output polynomial evaluation.
  For the fixed cones, increasing the additive padding absorbs remaining multiplicative factors and cutoffs into a
  single fixed size factor, even factor one if desired. Padding checks and zero construction are $O \( L \)$ scans
  with uniform coefficients; their implementation does not perform hidden work growing with $C_(upright("base"))$.
  Public computation of bit-polynomial coefficients may have a larger fixed polynomial exponent than the circuit
  evaluating the resulting monomials. Only the latter exponent is charged to the functional size allowance.
  No parameter varies with $N$ after this single choice.

#thm([Lemma 6.10.])[
  (Coarse synchronization).  #emph[Every assignment satisfying all but $delta \|
    T \|$ gates has $lr(bar.v.double X - macron(X) bar.v.double)_(upright("rep")) < d_(upright("sync"))$,
    without any assumption that its functional decisions are correct.]
] <out:coarse-sync>

#proof[
  Apply (6.14) to nonfailed direct cones. At failed ones, both $X_(i r)$ and $\( A_(upright("rep")) X \)_(i r)$
    belong to $\[ - 1 \, 2 \]$, so their difference is at most three. The factor four in the norm and Lemma 35(i) give
  $ lr(bar.v.double X - A_(upright("rep")) X bar.v.double)_(upright("rep")) lt.eq 4 beta B_1 +
    2 C_(upright("ar")) epsilon + 6 sqrt(C_(upright("tot")) delta) . $
  On the other hand (6.12) and the reverse triangle inequality give $kappa
    lr(bar.v.double X - macron(X) bar.v.double)_(upright("rep")) lt.eq
    lr(bar.v.double X - A_(upright("rep")) X bar.v.double)_(upright("rep"))$.
    Equation (6.19) proves the assertion. In particular, failures at physical feedback outputs,
    threshold constants, or the numeric averaging gates are already included;
    no decision is trusted in establishing this estimate. ◻
]

=== 6.7 The clipped mean contradiction and universal decoding <the-clipped-mean-contradiction-and-universal-decoding>

#thm([Lemma 6.11.])[
  (Fine residual).  #emph[If an assignment meets the gate-failure budget and $"dist" \( macron(X) \, cal(E) \) >
    10 tau$, then
#[#set math.equation(numbering: n => "(6.20)")
 $ E_(upright("res")) :=
   lr(bar.v.double X - "clip"_(cal(B)) \( A_(upright("rep")) X + beta v \( macron(X) \) \)
   bar.v.double)_(upright("rep")) < beta c_(*) kappa \/ 2 . $ <out:residual>]

 Here clipping is componentwise on the replicas, and $v \( macron(X) \)$ is repeated identically over them.]
] <out:fine-residual>

#proof[
  Fix the actual mean $macron(X)$ in all ideal tape experiments.
    Coarse synchronization permits all spoilage charges already budgeted.
    Discard cohorts with a high-failure or high-spoil invocation.
    In every remaining invocation whose ideal branch-pattern inputs are all near ports or public substitutions,
    Theorem 27 applies. Mark all cohort outputs receiving an incorrect designated wire from any such invocation.
    Equations (6.1) and (6.10) bound their union by $2 B_(upright("out")) upsilon$ of the outputs.
    Do this marking for every near-input hypothetical invocation before following the selected path.
    Non-near-input invocations are irrelevant unless selected;
    on the ideal good-port event a selected invocation necessarily is a near-input one.
  Outside these marks and the other unstable events, every direct comparison in the complete tree has the needed
    margin and every selected invocation supplies its correct near-bit. Induct on the ideal answer sequence:
    earlier reliable bits select its actual substitution/function branch, the selected gadget is reliable,
    and Boolean shielding removes arbitrary unused outputs. Thus the whole selected direct computation equals its
    ideal Boolean run, and (6.15) holds.
  For an unstable but entirely satisfied direct cone, use only (6.14) and $\| v_i \( macron(X) \) \| lt.eq B_1$:
    its discrepancy from the clipped true-field update is at most $3 beta B_1 + C_(upright("ar")) epsilon$.
    This is proportional to $beta$ apart from numeric error. Failed direct cones use only the range bound three.
    The empirical ideal error, clipping nonexpansiveness, and the total unstable fraction at most $q_0$ therefore give
  $ E_(upright("res")) lt.eq beta #scale(x: 120%, y: 120%)[\(] c_(*) kappa \/ 20 +
    6 B_1 sqrt(q_0) #scale(x: 120%, y: 120%)[\)] + 2 C_(upright("ar")) epsilon +
    6 sqrt(C_(upright("tot")) delta) < beta c_(*) kappa \/ 2 $
  by (6.18) and (6.19). This includes arbitrary concentration on extraction gates:
    above-budget invocations lose their whole cohort; below-budget invocations lose their guaranteed fraction of
    designated wires, and the lower bound in (6.1) prevents a concentration factor. ◻
]

#thm([Lemma 6.12.])[
  (Clipping and replica means).  #emph[Let $A$ be a stochastic replica operator satisfying (6.12),
    and let $c$ be constant across the replicas of each component.
    Put $F = "clip"_(cal(B)) \( A X + c \)$ and $E = lr(bar.v.double X - F bar.v.double)_(upright("rep"))$. Then
$ lr(bar.v.double X - J X bar.v.double)_(upright("rep")) lt.eq E \/ kappa \, wide
  lr(bar.v.double J X - "clip"_(cal(B)) \( J X + c \) bar.v.double)_(upright(b)) lt.eq E \/ kappa . $

]
] <out:clip-mean>

#proof[
  Write $Q = I - J$ and $g = "clip"_(cal(B)) \( J X + c \)$, a repeated vector.
    The mean projection minimizes distance to repeated vectors, and coordinate clipping is nonexpansive. Hence
  $ lr(bar.v.double Q F bar.v.double)_(upright("rep")) lt.eq
    lr(bar.v.double F - g bar.v.double)_(upright("rep")) lt.eq
    lr(bar.v.double A \( X - J X \) bar.v.double)_(upright("rep")) lt.eq \( 1 - kappa \)
    lr(bar.v.double Q X bar.v.double)_(upright("rep")) . $
  Projecting $X - F$ gives $lr(bar.v.double Q X bar.v.double)_(upright("rep")) lt.eq
    E + \( 1 - kappa \) lr(bar.v.double Q X bar.v.double)_(upright("rep"))$, which proves the first inequality.
    Taking means and then comparing to $g$ gives
  $ lr(bar.v.double J X - g bar.v.double)_(upright(b)) lt.eq
    lr(bar.v.double J \( X - F \) bar.v.double)_(upright("rep")) +
    lr(bar.v.double J F - g bar.v.double)_(upright("rep")) lt.eq
    E + \( 1 - kappa \) lr(bar.v.double Q X bar.v.double)_(upright("rep")) lt.eq E \/ kappa . $
  This argument does not exchange averaging and clipping. ◻
]

Apply Lemma 38 with $c = beta v \( macron(X) \)$ and the fine residual.
  If the mean were farther than $10 tau$ from $cal(E)$, it would give

$
  lr(bar.v.double macron(X) - "clip"_(cal(B)) \( macron(X) + beta v \( macron(X) \) \)
  bar.v.double)_(upright(b)) < beta c_(*) \, $

contrary to (6.4). Thus every assignment meeting the gate-failure budget satisfies

#[#set math.equation(numbering: n => "(6.21)")
 $ "dist" \( macron(X) \, cal(E) \) lt.eq 10 tau . $ <out:endpoint-proximity>]

Choose an endpoint witnessing this bound. Its first block is exactly $E_w$ for a desired endpoint.
  Round the first block of $macron(X)$ at $1 \/ 2$. Each erroneous bit contributes at least $1 \/
  4$ to its squared coordinate distance from $E_w$, and so the resulting word $y$ obeys

$ "dist" \( y \, E_w \) lt.eq 4 \( 10 tau \)^2 < rho_(upright("dec")) . $

The global decoder following (6.3) recovers $w$. The endpoint decoder in Theorem 26 and Lemma 8 returns a nonzero
  End-of-Line solution. It does not require knowing which gates failed or which endpoint witnessed (6.21).

This defines a deterministic decoder on every acceptable rational assignment.
  Means and comparisons can be computed exactly: forming a common denominator within a group increases its bit
  length by at most the sum of its input denominator bit lengths,
  followed by polynomial integer-arithmetic overhead. The port and raw algorithms are polynomial time,
  with arbitrary fixed defaults on out-of-promise inputs. The proved proximity places this actual input inside
  their guaranteed radii. Hence decoding is polynomial in $N$ plus the total assignment encoding length.
  The soundness argument itself applied to all real assignments satisfying the failure budget.

=== 6.8 Complete output length, uniformity, and totality <complete-output-length-uniformity-and-totality>

Every constituent scale is a fixed polynomial in $L$, and $\| Gamma \| = O \( N ell_N^(O \( 1 \)) \)$.
  Equations (6.16) and (6.9) give, for some fixed exponent $b_1$,

#[#set math.equation(numbering: n => "(6.22)")
 $ \| V \| + \| T \| = O \( m T_(upright("tap")) K_c \) = O \( \| Gamma \| S_0 T_(upright("tap")) G_0 \) =
   O \( N ell_N^(b_1) \) . $ <out:size>]

This count includes every copied direct cone, every entire shared invocation, its extraction gates,
  every Constant gate, and every comparison in every hypothetical branch.
  Routing creates one connection record per counted input occurrence;
  it is not an implicit description of a larger circuit. Explicit node and gate identifiers require
  $O \( log \( N ell_N^(b_1) \) \) = O \( ell_N \)$ bits. Field/index metadata,
  locally generated function coefficients, and every rational parameter have fixed polynomial-in-$L$ bit bounds.
  The offsets, bin widths, $beta \, epsilon \, delta$ and numerical precisions are fixed rational constants.
  In particular, the threshold-input length qualification in Theorem 27 contributes only a fixed bound here.
  If a representation repeats local parameter descriptions instead of sharing them,
  multiplying (6.22) by their polynomial-in-$L$ length still changes only a fixed logarithmic exponent.
  Input/output lists and delimiters obey the same bound. Thus there are a fixed positive integer $A$ and fixed
  nonnegative integer $b$ for which the complete output encoding has length at most $A N ell_N^b$.

All tape masses and their integer multiplicities are deterministically enumerable.
  So are every raw-neighborhood and correction-cone address, every padded function, every inner invocation gate,
  every replica move, and every round-robin routing record.
  Public outer encodings and the source data are constructed by the polynomial-time algorithms already proved.
  Polynomially many operations on polynomial-bit integers suffice for all these tasks.
  Products and compositions of the finitely many fixed polynomial bounds give one deterministic polynomial-time
  reduction. It never lists the graph of all logical vertex labels.
  The gate set is nonempty, all parameters lie in $\[ 0 \, 1 \]$, fan-in is at most two,
  and the fresh-output construction enforces the required unique output ownership despite the feedback cycles.

It remains to establish the finite totality assertion for arbitrary generalized circuits,
  independently of this reduction.

#thm([Lemma 6.13.])[
  (A fixed rational mesh satisfies every gate).  #emph[For every fixed rational $0 < epsilon < 1 \/ 10$,
    every generalized circuit in Definition 2 has a rational assignment satisfying all its gates,
    each coordinate having denominator $q = ceil.l 20 \/ epsilon ceil.r$.
    The complete assignment length is bounded by one fixed polynomial with nonnegative integer coefficients in the
    circuit encoding length.]
] <out:totality>

#proof[
  Construct a continuous self-map of $\[ 0 \, 1 \]^V$. At an arithmetic gate’s unique output use its exact
    numerical operation. At a Less gate with inputs $a \, b$, use the clipped linear ramp that is zero when $x_b -
    x_a lt.eq - epsilon \/ 2$ and one when $x_b - x_a gt.eq epsilon \/ 2$.
    For Boolean gates define a continuous signal $h : \[ 0 \, 1 \]
    arrow.r \[ 0 \, 1 \]$ equal to zero on $\[ 0 \, 2 epsilon \]$, equal to one on $\[ 1 - 2 epsilon \, 1 \]$,
    and linear between them. Use respectively
  $ max { h \( x_a \) \, h \( x_b \) } \, wide min { h \( x_a \) \, h \( x_b \) } \, wide 1 - h \( x_a \) $
  for Or, And, and Not. Set coordinates not produced by gates to zero.
    Unique output ownership makes these prescriptions a well-defined continuous cube map.
    Brouwer’s fixed-point theorem #cite(label("Brouwer1911")) gives a fixed point $x^(*)$;
    no efficient computation of it is asserted.
  Round every coordinate to the nearest point of ${ 0 \, 1 \/ q \, dots.h \, 1 }$,
    obtaining $tilde(x)$ with $\| tilde(x)_v - x_v^(*) \| lt.eq 1 \/ \( 2 q \) lt.eq epsilon \/ 40$.
    Constant errors are at most $epsilon \/ 40$, Scale and Copy errors at most $2 epsilon \/ 40$,
    and Add and Subtract errors at most $3 epsilon \/ 40$, using parameter bounds and nonexpansive clipping.
    For a triggered strict Less antecedent after rounding, its signed input gap before rounding has the same sign
    and magnitude strictly greater than $epsilon - 2 epsilon \/ 40 > epsilon \/ 2$.
    Its fixed-point output is therefore the required endpoint zero or one, which rounding preserves.
  If a weak Boolean low antecedent $tilde(x)_a lt.eq epsilon$ holds, then $x_a^(*) lt.eq epsilon +
    epsilon \/ 40 < 2 epsilon$, so $h \( x_a^(*) \) = 0$. Similarly $tilde(x)_a gt.eq 1 -
    epsilon$ implies $h \( x_a^(*) \) = 1$. Every applicable Or, And,
    or Not conclusion follows from its displayed exact formula, including equality at the weak threshold.
    The corresponding fixed-point output is zero or one and is unchanged by rounding.
    This verifies every gate implication.
  The denominator $q$ is a fixed integer depending only on $epsilon$.
    There are at most a fixed multiple of $M + 1$ explicitly listed nodes in a length-$M$ input,
    and each output rational has a fixed bit bound. Accounting also for order, indices if used, and delimiters,
    a sufficiently large fixed integer $C$ makes $p \( M \) =
    C \( M + 1 \)^2$ an upper bound for the entire assignment.
    This polynomial has nonnegative integer coefficients and is independent of the particular circuit and its
    parameter denominators. ◻
]

#proof[
  The preceding argument uses Theorem 27, whose construction is proved in Sections 7–9, and Lemma 80,
    proved in Section 10. Use the fixed rational $epsilon \, delta$ chosen in (6.19)–(6.19) and the polynomial $p$
    from Lemma 39. That lemma proves totality, with all gates satisfied.
    The explicit construction and (6.22) give the claimed complete quasilinear encoding bound and a deterministic
    polynomial-time reduction. Equations (6.21) and (6.6), followed by the global endpoint decoder,
    give the required solution from every acceptable assignment, with the stated polynomial running time.
    Every constant and algorithm has been fixed independently of the input. This proves all four assertions. ◻
]

== 7 The inner path and its algebraic representation <sec:inner-algebra>

We construct the algebraic part of the decision gadget promised in Theorem 27.
  Its graph consists of one directed path for each tuple of read-only inputs.
  Besides encoding these paths, the construction arranges that every chart involving one read port has exactly the
  same native layout and formula in a common one-port template.
  This literal correspondence, including all verification auxiliaries,
  will supply the distinguished source in Section 9.

#emph[All field, clock, dimension, and size notation is reset in this section.] In particular,
  the fields and the polynomial-size affine domain below are independent of the outer index group.
  The construction and its proof do not use the outer circuit realization.
  All graphs in this section are described implicitly; we never enumerate their exponentially many Boolean input tuples.

=== 7.1 Parameters and the extended path <ia:path-parameters>

Fix the exponent allowance $c_(upright("allow"))$ in Theorem 27,
  and choose a fixed integer $c_0 > c_(upright("allow")) + 5$. For a port length $L$, set

#[#set math.equation(numbering: n => "(7.1)")
 $ n' = \( L + 2 \)^(c_0) \, wide h = Theta #scale(x: 120%, y: 120%)[\(] \( log \( n' + 2 \) \)^(1 \/ 4)
   #scale(x: 120%, y: 120%)[\)] \, wide H = bb(F)_h \, wide q = h^v \, $ <ia:parameters>]

where $h$ is a deterministically chosen power of two and $v$ is a fixed sufficiently large integer.
  Let $ell$ be the least positive integer coprime to $v$ for which $h^ell gt.eq \( n' \)^3 + 3$, and put

#[#set math.equation(numbering: n => "(7.2)")
 $ K_1 = bb(F)_(h^ell) \, quad K = bb(F)_(q^ell) \, quad C = K_1^times \, quad M = h^ell - 1 \, quad D = ell^2 -
   1 . $ <ia:fields>]

Fix a generator $gamma$ of $C$. Since $gcd \( ell \, v \) = 1$,
  the subfields $K_1$ and $bb(F)_q$ of $K$ intersect in $H$ and generate $K$.
  An $H$-basis of $K_1$ is therefore an $bb(F)_q$-basis of $K$. We use it throughout:
  one $K$ variable has $ell$ coordinates over $bb(F)_q$, and its $H^ell$ digit grid is precisely $K_1$.

An interval of $v$ consecutive integers contains an integer congruent to $1$ modulo $v$.
  Thus the coprimality restriction changes the first size threshold for $ell$ by at most $v$, and

#[#set math.equation(numbering: n => "(7.3)")
 $ ell = Theta \( log n' \/ log log n' \) \, wide h = o \( ell \) \, wide \| K \| =
   q^ell = \( n' \)^(O \( 1 \)) . $ <ia:size-bounds>]

Choose $v$ large enough that $q$ dominates the fixed power of $D$ needed by the scalar line–point input in
  Section 8, with positive power slack. In particular, $D \/ q arrow.r 0$. After $v$, fix an integer $a > v$ and set

#[#set math.equation(numbering: n => "(7.4)")
 $ B = ceil.l q^(1 \/ a) ceil.r lt.eq ell $ <ia:radix-size>]

for all sufficiently large $L$. Every fixed multiple of $ell h$ is then eventually below $D$.
  All these choices precede the number of ports and the particular Boolean function.

All finite sets used below have polynomial cardinality in $n'$.
  Field presentations, compatible embeddings, bases, generators, interpolation matrices,
  and deterministic orderings can consequently be found by exhaustive finite-field algebra in polynomial time in
  these cardinalities. For instance, irreducible presentations and suitable generators can be found by enumeration
  and their defining properties checked by finite arithmetic.
  No claim of polynomial time in the logarithm of a field’s cardinality is required.
  Fix these conventions once for the common template. Finitely many smaller sizes can be handled by enlarging the
  fixed lower cutoff as in the gadget statement.

Now fix an arbitrary constant number $k gt.eq 1$ of ports and an arbitrary constant size factor for the Boolean
  circuit of $f : \( { 0 \, 1 }^L \)^k arrow.r { 0 \, 1 }$.
  Invocations with fewer ports are padded by unused public-zero ports.
  Normalize the circuit to a topological list of gates with Boolean rules of degree at most two over
  characteristic two, and finish with a separate output copy gate.
  This costs only a constant factor in circuit size. The size cutoff may depend on $k$ and on the fixed size factor.

The logical tape has read-only groups $s_i in { 0 \, 1 }^L$ for $i in \[ k \]$, a work group $w$ indexed by $K_1$,
  and legacy bits $e_z$ indexed by $z in C$. Each $s_i$ is embedded by the same fixed injection of $\[ L \]$ into
  $K_1$; other grid entries are specified zeros. Stages $r = 0 \, dots.h \, M - 1$ have labels $c = gamma^r$.
  Work is blank at stage zero. During step $r = j - 1 arrow.r j$, for $1 lt.eq j lt.eq L$,
  copy $s_i \[ j \]$ to a distinct work location $w_(i \, j)$ for every $i$ in parallel.
  Thereafter assign one new gate location per step, using earlier work locations or public constants.
  Reserve a fixed grid position $y_(upright("out"))$ solely for the final output assignment.
  Pad remaining steps by idle work rules. The number of work positions and nonidle steps is at most

$ k L + O \( 1 \) + O \( L^(c_(upright("allow"))) \) \, $

with constants allowed to depend on the circuit size factor.
  The choices above make both counts fit below the available grid and stage sizes.

At stage $c$, require $e$ to be one-hot at $c^(- 1)$. Require every unassigned work position to be zero,
  every assigned copy to equal its specified input, and every assigned gate to satisfy its rule.
  Consequently each Boolean tuple $s = \( s_i \)_i$ has exactly one valid tape $b = \( w \, e \, \( s_i \)_i \)$
  at every stage. Join consecutive stages by their assignment steps, and disable the wrap step $gamma^(- 1) arrow.r 1$.

#thm([Lemma 7.1.])[
  (Validity and a constant edit alphabet).  #emph[The union of the stage-valid tapes is described by polynomially
    many Boolean equations of degree at most $d = 3$. For fixed $k$,
    every macro step and its inverse use a fixed finite alphabet of flips,
    whose coefficients are determined by a bounded number of logical reads and public rule bits.
    Equations involving $s_i$ and other groups can be written as the sum of an $\( e \, s_i \)$ contribution and
    an $\( e \, w \)$ contribution. No equation requires a product involving two distinct positive port groups.]
] <ia:validity>

#proof[
  Impose bitness on all logical coordinates, and
  #[#set math.equation(numbering: n => "(7.5)")
   $ e_z e_(z') = 0 quad \( z eq.not z' \) \, wide sum_(z in C) e_z = 1 . $ <ia:one-hot>]
  For each stage $c$, multiply all its work requirements by $e_(c^(- 1))$.
    Gate equations have degree at most two before this multiplication, so the resulting degree is at most three.
    A copy requirement at an occupied position is specifically
  #[#set math.equation(numbering: n => "(7.6)")
   $ e_(c^(- 1)) w_(i \, j) - e_(c^(- 1)) s_i \[ j \] = 0 . $ <ia:copy-equation>]
  The requirements are vacuous at unselected stages. At the one selected stage,
    the prefix equations determine all assigned work positions in topological order and force every other position
    to zero. This proves the characterization and the dependency assertion.
  For start frame $c$, list $k$ work write slots and the two legacy slots $c^(- 1) \, \( gamma c \)^(- 1)$.
    During a gate step only the first work slot is active; use a zero unit vector for every inactive slot.
    Write $v_1 \( c \) \, dots.h \, v_(k + 2) \( c \)$ for these public vectors in the logical tape space,
    and for $sigma in { 0 \, 1 }^(k + 2)$ put
  #[#set math.equation(numbering: n => "(7.7)")
   $ h_sigma \( c \) = sum_(r = 1)^(k + 2) sigma_r v_r \( c \) . $ <ia:flip-mask>]
  At a valid pre tape, choose a work coefficient to be the old bit plus its required new assignment;
    choose both legacy coefficients to be one. The required assignment is a read input,
    a degree-at-most-two gate of earlier work bits, or the unchanged value for an inactive slot.
    At a valid post tape, the inverse clears precisely the newly assigned positions and flips the same legacy
    positions. Earlier operands have not changed, so the two operations are reciprocal.
    There is a bounded list of old-value, operand, and input reads for fixed $k$.
    Public phase, gate, activity, and wrap bits select their roles.
    Define the same coefficient rules on arbitrary Boolean read answers;
    at the disabled wrap use an idle work proposal. This gives a finite branch system without any assumption that
    those arbitrary answers describe a valid tape. ◻
]

#prodef([Definition 7.2.])[
  (Extended inner graph).  An extended label is $\( c \, b \, eta \, t \)$, where $c in C$, $eta in { 0 \, 1 }$,
    and $0 lt.eq t lt.eq q - 1$. In pre mode $eta = 0$, $b$ must be valid at stage $c$; in post mode $eta = 1$,
    it must be valid at stage $gamma c$. Edges are the following:
  + in pre mode, increase $t$ by one until $q - 1$;
  + at full pre progress, perform the enabled macro edit and change to post mode, retaining the frame and full progress;
  + in post mode, decrease $t$ by one until zero;
  + at empty post progress, change to empty pre mode in frame $gamma c$, leaving $b$ unchanged.
  The fourth operation is included also for $c = gamma^(- 1)$; only the second operation is disabled at that frame.
] <ia:extended-path>

#thm([Lemma 7.3.])[
  (Endpoints and output).  #emph[For each $s$, the extended labels with that read-only tuple form a single
    directed path, without isolated vertices or self edges. Its unique source and immediate successor are respectively
#[#set math.equation(numbering: n => "(7.8)")
 $ \( gamma^(- 1) \, b_0 \( s \) \, 1 \, q - 1 \) \, wide \( gamma^(- 1) \, b_0 \( s \) \, 1 \, q - 2 \) \,
   $ <ia:source-successor>]

 where $b_0 \( s \)$ has blank work and legacy bit $e_1 = 1$.
   Its other endpoint is the full pre label at stage $M - 1$, and there $w \[ y_(upright("out")) \] = f \( s \)$.]
] <ia:path-endpoints>

#proof[
  Replace the unique macro tape at stage $x$ by its post labels in frame $gamma^(- 1) x$,
    in decreasing order of $t$, followed by its pre labels in frame $x$, in increasing order of $t$.
    The frame-advance edge joins the two halves. Each enabled macro edit joins the full pre end of one such
    segment to the full post start of the next. The only absent join is the wrap join from the final stage to
    stage zero. This gives exactly the stated path and endpoints.
    Every segment has more than one vertex, so there are no isolated vertices;
    each edge changes a label component, so there are no self edges.
    The final work assignment and all its ancestors have been completed at the last stage, proving the output claim. ◻
]

=== 7.2 Chart conventions and lifted cyclic interpolation <ia:lifts-and-masks>

A native chart is an $bb(F)_q$-coefficient polynomial on $O \( ell \)$ coordinates over $bb(F)_q$,
  possibly with slots. A persistent chart has at most one slot axis of length $O \( ell \)$;
  stacks will have a bounded number of such axes. A full rotating or projection variable always occupies one whole
  $K$ label. Native charts will later be embedded in one common $K^u$, with unused coordinates ignored.

For slot lengths $t_1 \, dots.h \, t_r$ and masks $L_b in bb(F)_q^(t_b)$, write

#[#set math.equation(numbering: n => "(7.9)")
 $ L dot.op F \( Y \) = sum_(z_1 \, dots.h \, z_r) (product_(b = 1)^r L_b \[ z_b \])
   F_(z_1 \, dots.h \, z_r) \( Y \) . $ <ia:contraction>]

There are $q^(O \( ell \))$ mask tuples. To query any specified mask tuple smoothly,
  choose independent uniform $A_b$, substitute $L_b = A_b + \( L_b - A_b \)$, and expand the $2^r$ terms.
  Each term has uniform mask marginals, even conditional on the point and the requested tuple.
  A nonzero tensor remains nonzero after independent random contractions with probability at least
  $\( 1 - 1 \/ q \)^r$: at each step a nonzero linear map has a kernel of relative size at most $1 \/ q$.

We repeatedly use the elementary polynomial zero bound: a nonzero polynomial of total degree $d_(*)$ on
  $bb(F)_q^m$ vanishes on at most a $d_(*) \/ q$ fraction of the grid.
  For completeness, expand in the last variable with leading coefficient of degree at most $d_(*) -
  r$ and last variable degree $r$. Inductively that coefficient vanishes on at most $\( d_(*) - r \) \/
  q$ of the earlier coordinates; elsewhere there are at most $r$ roots in the last variable.
  Induction on $m$ proves the bound. We apply it also after adjoining the finitely many mask groups.
  Thus any nonzero degree-$O \( D + ell h \)$ chart identity, including a whole slot list,
  is detected with constant probability. An ignored coordinate group is checked by comparing two independent
  replacements of that group with common uniform other coordinates.
  Its difference is a polynomial; the same bound gives an exact alternative between independence and constant
  rejection probability. Throughout, smoothness means bounded marginal density relative to uniform point and mask
  coordinates. Ignored coordinates are independently filled uniformly.

Ordinary interpolation on the $H$ digits extends a function on $K_1$ with individual degrees below $h$ and total
  degree at most $ell \( h - 1 \)$. The punctured cyclic grid requires a different extension.

#thm([Lemma 7.4.])[
  (Cyclic lift, including descent at zero).  #emph[For $0 lt.eq j < M$, write $j =
    sum_(t = 0)^(ell - 1) j_t h^t$ and define
#[#set math.equation(numbering: n => "(7.10)")
 $ tilde(j) = sum_(b = 0)^(ell - 1) j_(v b med mod med ell) q^b . $ <ia:lift-exponent>]

 Replacing $Z^j$ by $Z^(tilde(j))$ in interpolation on $C$ gives a linear extension to $K$,
   of coordinate degree at most $ell \( h - 1 \)$. For $bb(F)_q$-valued data this extension has coefficients in
   $bb(F)_q$ in the chosen coordinates, including its value at zero.
   It commutes with $Z mapsto x Z$ for every $x in C$.]
] <ia:cyclic-lift>

#proof[
  Modulo $M$ we have $q^b = h^(v b)$ and $h^ell = 1$, hence
  $ tilde(j) equiv sum_b j_(v b med mod med ell) h^(v b med mod med ell) = j med \( mod med M \) . $
  The two monomials therefore agree on $C$, where the powers $1 \, Z \, dots.h \,
    Z^(M - 1)$ form the usual interpolation basis. Each map $Z mapsto Z^(q^b)$ is linear over $bb(F)_q$,
    so the coordinate degree of the lifted monomial is at most $sum_t j_t lt.eq ell \( h - 1 \)$.
  Multiplication of $tilde(j)$ by $q$ modulo $q^ell - 1$ cyclically rotates its base-$q$ digits.
    Under (7.10), this is the permutation $j mapsto q j med mod med M$.
    The digit list all of whose entries equal $h - 1$ is excluded by $j < M$;
    exponent zero is consequently the unique representative of residue zero on $C$.
    If the original interpolant is $sum_j a_j Z^j$ and its values belong to $bb(F)_q$,
    uniqueness of interpolation on $C$ gives
  $ a_(q j med mod med M) = a_j^q . $
  The digit rotation then proves that its lift $F$ satisfies $F \( z \)^q = F \( z \)$ for every $z in K^times$.
    At zero, $F \( 0 \) = a_0$ and $a_0^q = a_0$, so the same assertion holds.
  The coordinate degree is below $q$ after our cutoff. Conjugating the coordinate coefficients by the $q$-power
    map leaves the values on $bb(F)_q^ell$ unchanged. Uniqueness of interpolation with individual degrees below
    $q$ forces each coefficient to be fixed by that conjugation, and thus to lie in $bb(F)_q$.
    Finally $x^(tilde(j)) = x^j$ for $x in C$, which proves the scaling assertion on every basis monomial.
    These arguments apply coefficientwise in any additional independent variables. ◻
]

=== 7.3 Canonical certificates for linear conditions <ia:linear-certificates>

Partial-sum polynomial certificates also appear in Rubinstein’s
  construction #cite(label("Rubinstein2016Settling")) Sections 6.2–6.3.
  Here each input chart has its own canonical certificates,
  and contributions from different charts meet only in a tested identity.
  We require these recipes to remain linear in their input chart and, in rotating calls,
  to respect cyclic scaling of the designated variables even when the final condition fails.

#thm([Lemma 7.5.])[
  (Smooth linear verification).  #emph[Let a fixed finite list of primary native charts,
    each scalar or with one $O \( ell \)$ slot axis, be subject to an explicit $bb(F)_q$-linear condition $cal(S)$
    on their full evaluation arrays. Its matrix has polynomially many rows and columns,
    with logarithms $O \( ell log q \)$. Coefficient and special-grid conditions may be expressed by public linear
    matrices. A nonrotating call may adjoin a separately enforced primary $1$ for affine terms.]
  #emph[In a rotating call, at most one full variable in each primary is designated to scale by a common $x in C$.
    Assume $cal(S)$ is invariant under this simultaneous pullback and imposes the lifted shape of Lemma 43 in
    every rotating variable. No arbitrary noninvariant affine term is allowed in such a call.]
  #emph[The condition has a canonical verification construction with the following properties.]
  + #emph[A fixed number of auxiliary families is stored #emph[separately for each primary block].
    Each has native dimension $O \( ell \)$ and at most one slot axis of length $O \( ell \)$.
    Its canonical arrays are linear in that primary’s arrays, also when $cal(S)$ fails.]
  + #emph[Honest input coordinate degree $d_(upright("in"))$ produces auxiliary degree
    $O \( d_(upright("in")) + ell h \)$. A fixed mixture of bounded,
    smooth linear field probes is perfectly complete on legal canonical tuples within the degree budgets.
    On genuine degree-at-most-$D$ polynomial tuples, either $cal(S)$ holds and every auxiliary is canonical,
    or the mixture rejects with a fixed positive probability.]
  + #emph[In a rotating call each auxiliary has a new designated full variable $R$,
    and rotating its primary by $x$ changes the auxiliary by $R mapsto x R$.
    Its canonical recipe has the lifted shape in $R$ whenever its primary has the required shape,
    even if final rows fail. All canonical arrays and public maps are polynomial-time constructible.]
] <ia:linear-tool>

#proof[
  We give the construction, uniqueness, degree, and probe arguments.
  #strong[Why arbitrary scaling factors preserve the linear condition.] In a rotating call substitute $R
    Z$ for the designated variable of a primary and denote the resulting chart by $f_R$.
    An unchanged primary stays unchanged. We first show that legal input arrays satisfy $cal(S)$ for every $R in
    K$, rather than only for $R in C$. Extend scalars in the evaluation space and its linear subspace $cal(S)$
    from $bb(F)_q$ to $K$. Since $\| C \| = M$ is odd, it is invertible in characteristic two. The character projections
  $ Pi_j = 1 / M sum_(x in C) x^(- j) rho \( x \) wide \( 0 lt.eq j < M \) $
  for the simultaneous scaling action $rho$ decompose the space and preserve every invariant subspace.
    On the imposed lift shape, the character $j$ is represented by the single exponent $tilde(j)$ in every
    rotating primary. Nonrotating components occur in character zero.
    Substitution by $R eq.not 0$ therefore acts by the scalar $R^(tilde(j))$ on each character space,
    and preserves the extended subspace. At $R = 0$ it projects onto character zero,
    which also preserves the subspace. Scaled evaluations of our $bb(F)_q$-valued chart are still
    $bb(F)_q$-valued; intersecting with the original evaluation space, or using the original defining rows,
    proves the assertion over $bb(F)_q$.
  A failed original row fails at $R = 1$, so it remains a nonzero polynomial condition.
    Tests requiring the substitution sample $R$ uniformly from $K^times$;
    this changes a uniform density by at most $\( 1 - \| K \|^(- 1) \)^(- 1)$ and keeps primary point marginals
    uniform. The substitution is bilinear in coordinate variables and at most doubles total degree.
    In a nonrotating call omit $R$ everywhere below.
  #strong[Separate row contributions and partial sums.] Pad the row set by zero rows to $H^rho$, with $rho =
    O \( ell \)$. For one primary block with $m_0$ native $q$-coordinates, put $m' = v m_0$.
    An $H$-basis of $bb(F)_q$ gives a packing map
  $ w_(upright("pack")) : bb(F)_q^(m') arrow.r bb(F)_q^(m_0) . $
  This is a surjective $bb(F)_q$-linear map whose restriction to $H^(m')$ is a bijection onto $bb(F)_q^(m_0)$.
    In particular it sends uniform inputs to uniform outputs.
    For each primary slot $s_0$, interpolate that block’s public matrix entries as $A_(s_0) \( I \, X \)$ on
    $H^rho times H^(m')$, with individual degrees below $h$. Define, for this block only,
  #[#set math.equation(numbering: n => "(7.11)")
   $ p_(m') \( R \, I \, X \) & = sum_(s_0) A_(s_0) \( I \, X \) f_(s_0 \, R) \( w_(upright("pack")) \( X \) \) \,\
p_j \( R \, I \, X_1 \, dots.h \, X_j \) & = sum_(x_(j + 1) \, dots.h \, x_(m') in H)
  p_(m') \( R \, I \, X_1 \, dots.h \, X_j \, x_(j + 1) \, dots.h \, x_(m') \) quad \( 0 lt.eq j < m' \) .
  $ <ia:linear-top>]
  The top identity requests the primary with the public slot mask $\( A_(s_0) \( I \, X \) \)_(s_0)$,
    made smooth by additive splitting. This is a linear probe; the matrix entries are not unknown operands.
  The final condition is the tested identity
  #[#set math.equation(numbering: n => "(7.12)")
   $ sum_(upright("primary blocks ") b) p_(0 \, b) \( R \, I \) = 0 . $ <ia:final-row-sum>]
  #emph[No chart for this mixed sum is stored.] On legal data it vanishes on every $I in H^rho$ and every $R in
    K$. Its individual $I$ degrees are below $h$, and its honest $R$ coordinate degrees are below $q$,
    so this is a polynomial identity. Conversely, its vanishing at $R = 1$ and at the row grid,
    with correct partial sums, is exactly the original matrix condition.
  #strong[Division enforces all partial sums uniquely.] For $1 lt.eq j lt.eq
    m'$ introduce quotient and remainder charts and impose
  #[#set math.equation(numbering: n => "(7.13)")
   $ p_j & = \( X_j^h - X_j \) Q_j + X_j^(h - 1) p_(j - 1) + E_j \,\
p_(j - 1) & upright(" is independent of ") X_j \, wide deg_(X_j) E_j lt.eq h - 2 . $ <ia:division>]
  In characteristic two,
  $ sum_(x in H) x^r = 0 quad \( 0 lt.eq r < h - 1 \) \, wide sum_(x in H) x^(h - 1) = 1 . $
  Here the $r = 0$ identity is $h = 0$ in the field. The coefficient of $X_j^(h - 1)$ in the remainder modulo
    $X_j^h - X_j$ is thus precisely the sum of the original polynomial over $X_j in H$.
    Euclidean division by this monic polynomial uniquely fixes $Q_j$, the top remainder coefficient $p_(j - 1)$,
    and $E_j$. Starting at (7.11), downward induction fixes all certificates and gives (7.11).
    Independence from later trailing coordinates follows in the same induction.
  To test the degree restriction without concentrated reads, write
  #[#set math.equation(numbering: n => "(7.14)")
   $ G_j \( R \, I \, X_(eq.not j) \, U \) = sum_(b = 0)^(h - 2) E_(j b) \( R \, I \, X_(eq.not j) \) U_b \, wide
     U in bb(F)_q^(h - 1) \, $ <ia:coefficient-chart>]
  where $E_(j b)$ is the coefficient of $X_j^b$ in $E_j$. Check independence from $X_j$, addition in $U$,
    and homogeneity under a uniform nonzero scalar $lambda in bb(F)_q$.
    Sampling a nonzero scalar makes $lambda U$ uniform; zero homogeneity already follows from addition.
    If these identities are exact, $G_j$ is pointwise $bb(F)_q$-linear in $U$,
    and uniqueness of reduced interpolation makes its polynomial linear in $U$. Now check
  #[#set math.equation(numbering: n => "(7.15)")
   $ E_j \( R \, I \, X \) = G_j \( R \, I \, X_(eq.not j) \, \( 1 \, X_j \, dots.h \, X_j^(h - 2) \) \) .
     $ <ia:coefficient-evaluation>]
  The special $U$ tuple is queried as two uniform additive summands.
    Only #emph[after] linearity has been established in the exact-soundness case analysis do we use the
    $O \( D + h \)$ degree bound for this substitution. The earlier linearity discrepancies have degree
    $O \( D \)$ and themselves have constant gap. Equation (7.15) then enforces (7.13) and fixes $G_j$ uniquely.
  #strong[A whole list is checked at once.] Sampling a single recurrence index would lose a factor $m'$.
    Instead choose a cyclic permutation $omega$ of the $m'$ scalar coordinates so that coordinate $j$ of $omega^j
    X$ is one fixed coordinate of $X$. Store
  #[#set math.equation(numbering: n => "(7.16)")
   $ overline(p)_j \( R \, I \, X \) = p_j \( R \, I \, omega^j X \) \, wide p_(j - 1) \( R \, I \, omega^j X \) =
     overline(p)_(j - 1) \( R \, I \, omega X \) \, $ <ia:recurrence-frames>]
  and store $Q_j \, E_j \, G_j$ in the equation-$j$ frame, with $U$ unchanged.
    Both public powers in (7.13), and the predecessor independence axis in its corresponding frame,
    are now common across all $j$. A uniform mask on the recurrence-index list checks all its equations with
    boundedly many point probes. Endpoint slices and predecessor shifts only change the requested linear mask,
    which is split smoothly. The coefficient families use the same $U$ group in every slot.
    If $m' = 0$, retain only the unsummed top contribution and introduce no division family.
  #strong[Degree, covariance, and exact gap.] The top degree is at most
  #[#set math.equation(numbering: n => "(7.17)")
   $ 2 d_(upright("in")) + \( rho + m' \) \( h - 1 \) . $ <ia:tool-degree>]
  Monic division by $X_j^h - X_j$, reduction, coefficient extraction,
    and finite summation do not increase total degree. Multiplication by a linear $U_b$ costs at most one.
    This proves the honest degree bound. There is a fixed number of families per primary;
    the growing recurrence index is one $O \( ell \)$ slot axis, and the additional $U$ domain has $h - 1 lt.eq
    ell$ coordinates.
  First test ignored coordinates and the independence and linearity devices.
    Unless they hold identically, one has a nonzero polynomial discrepancy of degree $O \( D \)$ and constant
    rejection probability. Once they hold, every remaining displayed discrepancy has degree $O \( D + ell h \) =
    o \( q \)$ and a failed slot identity survives a random contraction with constant probability.
    Exact identities give the uniqueness just proved and then (7.12).
    A fixed mixture of test types therefore has a uniform positive gap.
    Perfect completeness concerns canonical tuples within the budgets;
    it does not claim that every legal primary of degree exactly $D$ has auxiliaries of degree at most $D$.
  For covariance even on invalid inputs, expand a lifted primary after substitution over $K$ as
  $ f_R = sum_(j = 0)^(M - 1) R^(tilde(j)) v_j $
  in its evaluation arrays. All subsequent operations in (7.11)–(7.14) are the same fixed linear maps on that
    primary, independent of $R$. This includes division and coefficient extraction,
    since honest-degree evaluation arrays determine the required polynomials by interpolation.
    These maps preserve the exponent list, and rotating the input by $x in C$ replaces $R$ by $x R$.
    No final zero-row identity is used. In particular every canonical certificate is defined even when its primary
    belongs to data failing the final condition.
  Finally, all point substitutions used in these tests are coordinate permutations, surjective packing,
    nonzero scaling, fresh independent coordinate replacement, or additive splitting.
    They have bounded point marginals. Requested masks are split.
    All arrays have polynomial size, and every construction operation is finite linear algebra on them.
    This proves the remaining claims. ◻
]

=== 7.4 Persistent charts and their dependency tags <ia:persistent>

Every persistent chart has a canonical recipe $F \( c \, b \; Y \)$, possibly with one slot axis.
  At each fixed frame $c$, both its values and its coordinate coefficients have an assigned multilinear Boolean
  degree $kappa_F lt.eq d = 3$ in $b$, after reducing by $b_j^2 = b_j$.
  This logical degree is different from the coordinate degree bounded by $D$.
  All recipes are defined for every Boolean tape, including tapes that fail validity.
  A recipe either is independent of $c$, or has one designated full variable whose scaling realizes $c mapsto x c$.

Give each family a tag in ${ 0 \, 1 \, dots.h \, k }$. A tag-$0$ recipe depends only on $c \, w \,
  e$ and public data; that public data may include the circuit, work addresses, and the port index.
  A tag-$i$ recipe depends only on $c \, s_i \, e$ and public data fixed by the standardized one-port template.
  It may ignore $s_i$ if it is a certificate created inside that template.
  Call tags compatible if they are equal or one of them is zero.
  After fixing a finite Boolean transition branch, tag-$0$ update operands will all have tag $0$,
  and tag-$i$ update operands will have compatible tags.

#strong[Monomials and the separated validity calls.] Use the ordinary full-grid extension for $W_w$ and each
  $W_(s_i)$, and the cyclic lift for $W_e$. Include the constant chart $1$, tested against its prescribed value.
  For all ordered lists of length at most $d$ from ${ w \, e }$, and separately from ${ s_i \, e }$ for each $i$,
  include

#[#set math.equation(numbering: n => "(7.18)")
 $ W_(g_1 \, dots.h \, g_j) \( b \; Y_1 \, dots.h \, Y_j \) =
   product_(r = 1)^j W_(g_r) \( b \; Y_r \) . $ <ia:monomial-charts>]

Repeated types use independent variables. Share the legacy-only types.
  A monomial containing $s_i$ has tag $i$; all other monomials have tag $0$.
  Enforce each nontrivial product by factorization into its shorter prefix and last factor on independent native
  variables, together with all ignored-coordinate requirements.

Apply the nonrotating linear tool as follows.

+ One tag-$0$ validity call uses the monomials from ${ w \, e }$ and $1$.
  It imposes the order-one extension shapes, bitness on the grids, the one-hot requirements (7.5),
  and all blank and gate requirements of Lemma 40. Use one work-requirement row for each pair (stage,
  work grid position), with a zero row when that position is an occupied copy.
  Other conditions have fixed lists of rows. Circuit data affect matrix entries only.
+ For each $i$, a separate copy/port call imposes the shape, padding, and bitness of $W_(s_i)$,
  and the copy rows indexed by $\( c \, j \)$ for $c in C$ and $1 lt.eq j lt.eq L$.
  The row is zero when the stage index of $c$ is less than $j$. Otherwise it compares
  #[#set math.equation(numbering: n => "(7.19)")
   $ W_(e \, s_i) \( c^(- 1) \, iota \( j \) \) - W_(e \, w) \( c^(- 1) \, w_(i \, j) \) = 0 \,
     $ <ia:separate-copy-row>]
  where $iota$ is the common input injection. Primary-list, row-order,
    and padding conventions are identical in every such call.
    The matrix blocks for port-dependent primaries depend only on these common stage and source-bit indices.
    Work destinations occur only in the separate $W_(e \, w)$ matrix block.
    Auxiliaries for port-dependent blocks receive tag $i$; auxiliaries for the work-side block receive tag $0$.

For example, bitness is the linear row

$ W_(g \, g) \( y \, y \) - W_g \( y \) = 0 $

on represented grid entries. Although its two grid arguments coincide, it is verified as a matrix row,
  not by a concentrated unknown-product query. The same representation handles every degree-at-most-three Boolean
  validity term. Extension shapes are linear evaluation/interpolation conditions;
  the cyclic shape is $bb(F)_q$-linear by Lemma 43.

If these conditions and the factorization identities hold exactly on genuine polynomials,
  order-one grid entries are bits, their shapes fix their full extensions, products fix higher monomials,
  and the rows give exactly a valid union-of-stages tape. The linear tool fixes each certificate separately.
  The initial auxiliary assigned degrees can all be bounded by $d$,
  or by the smaller degree of their primary when useful. Since every certificate map is linear in one primary,
  the same degree statement holds on arbitrary Boolean tapes even when a final validity row is nonzero.

Include also a tag-$0$, point-constant output chart

#[#set math.equation(numbering: n => "(7.20)")
 $ F_(upright("out")) \( b \) = w \[ y_(upright("out")) \] . $ <ia:output-chart>]

A separate nonrotating linear call ties it to the designated grid entry of $W_w$ and enforces its ignored
  coordinates. Give it and the associated certificates assigned degree one.
  This output chart does not need a critical-address projection for transitions.

#strong[Frame and clock-times-monomial charts.] Let $J_c \( X \)$ be the cyclic lift of the indicator of $c^(- 1)$
  on $C$. It has tag $0$, assigned degree zero, and

#[#set math.equation(numbering: n => "(7.21)")
 $ J_(x c) \( X \) = J_c \( x X \) . $ <ia:clock-covariance>]

Tie it to the legacy chart by

#[#set math.equation(numbering: n => "(7.22)")
 $ W_e \( X \) = J_c \( gamma^eta X \) . $ <ia:clock-legacy>]

Below, $eta$ is enforced as a point-constant bit. Equation (7.22) is then a finite choice of two smooth polynomial
  identities. One-hot legacy validity determines a unique $c$ and the required pre/post relation, and fixes $J_c$.
  For every monomial $W$, including $1$, include

#[#set math.equation(numbering: n => "(7.23)")
 $ T_W \( c \, b \; X \, Y \) = J_c \( X \) W \( b \; Y \) \, $ <ia:clock-monomial>]

with independent arguments. It has the same tag and degree tier as $W$, and rotates only $X$.
  Enforce it by factorization.

#thm([Lemma 7.6.])[
  (Clock-indexed linear formulas).  #emph[Suppose for each $y in
    C$ that $L_y$ is an explicitly given $bb(F)_q$-linear map from selected monomial evaluation arrays of logical
    degree at most $k_0$ to the full native array of a scalar or one-slot output.
    There is a canonical chart, lifted in $Z$, with
#[#set math.equation(numbering: n => "(7.24)")
 $ G \( c \, b \; z \, dot.op \) = L_(c z) \( W \( b \) \) quad \( z in C \) . $ <ia:clock-formula-value>]

 It rotates only $Z$, and it and its verification auxiliaries have assigned degree at most $k_0$.
   A rotating linear-tool call verifies them. The recipes and their covariance hold for all Boolean $b$.]
] <ia:clock-formula>

#proof[
  Use the needed $T_W$ inputs and the output $G$ as primaries.
    Impose their lifted shapes in the designated variables and the linear rows
  #[#set math.equation(numbering: n => "(7.25)")
   $ G \( z \, dot.op \) = sum_(x in C) L_(x^(- 1) z) \( T \( x \, dot.op \) \) quad \( z in C \) .
     $ <ia:clock-convolution>]
  Rows also range over every output evaluation position and slot.
    On canonical $T$ inputs, only $x = c^(- 1)$ contributes, giving (7.24).
    The lift shape then determines the whole chart uniquely. The row condition is invariant under the simultaneous
    replacement $G \( z \) mapsto G \( u_0 z \)$ and $T \( x \) mapsto T \( u_0 x \)$:
    setting $x' = u_0 x$ changes the map index to $\( x' \)^(- 1) u_0 z$.
    The shape conditions are invariant too, so Lemma 44 applies.
    Every input has logical degree at most $k_0$; interpolation and all per-primary certificate operations are
    linear and preserve that degree. Covariance follows first on $C$ and then by uniqueness of the lift,
    and for the auxiliaries by the last part of the linear tool. No validity row on $b$ was used.
    Public clock-dependent terms are supplied through $T_1 = J_c$, keeping the rotating condition linear. ◻
]

Apply this lemma to a fixed list, for fixed $k$, of critical addresses needed by either transition direction.
  A critical output chart has only the variable $Z$ and gives at $z in
  C$ the required logical read or rule bit for absolute frame $c z$.
  For each port, make a separate tag-$i$ read chart that reads $s_i \[ j \]$ during initial copy step $j$ and is
  identically zero on every other step. This is a standardized degree-one call independent of all subsequent
  computation. Work reads have separate tag-$0$ charts, defined as zero when inactive;
  there are a bounded number per write slot for old and operand reads.
  Phase, gate, activity, and wrap-disable bits use tag-$0$ degree-zero calls.
  Fix their numbers and tiers by the rule basis and write-slot bound, padding inactive roles.
  Their public values and work address maps may depend on the circuit.

Every auxiliary of a tag-$0$ clock call has tag $0$. Every auxiliary of a standardized tag-$i$ clock call has tag
  $i$, even an auxiliary for a shared legacy-only or public $T$ primary in that call.
  The shared primary itself retains its base tag and formula.
  This distinction between an input’s tag and the ancestry of its per-call certificate is part of the construction.

A fixed-frame tape edit must update every persistent chart,
  including the certificates introduced to verify other charts. Its effect on a chart $F$ is the difference

$ F \( c \, b + h_sigma \( c \) \; Y \) - F \( c \, b \; Y \) . $

For a positive-tier chart we store this difference in a new chart with a clock variable $Z$,
  whose restriction at $Z = 1$ gives the required change. Taking a Boolean difference lowers the logical degree.
  We can also store the changes of this new chart and its certificates, stopping after at most three levels.
  The construction below supplies these polynomial charts; the projection stacks in Section 7.5 will realize the
  restriction at $Z = 1$ without a concentrated point read.

#thm([Lemma 7.7.])[
  (Derivative closure for all persistent families).  #emph[The persistent system can be closed under every
    required fixed-frame Boolean edit, including edits to verification auxiliaries,
    with a fixed number of families for fixed $k$. Each has at most one $O \( ell \)$ slot axis,
    native dimension $O \( ell \)$, honest coordinate degree $O \( ell h \)$,
    and assigned logical degree at most three. The closure and its polynomial-time canonical recipes are defined
    on invalid Boolean tapes as well.]
] <ia:derivative-closure>

#proof[
  Let $F$ have positive assigned tier $k_0$. For every required flip mask,
    retain its native variables $Y$ and slots, adjoin a new full variable $Z$, and prescribe on the cyclic grid
  #[#set math.equation(numbering: n => "(7.26)")
   $ G_F^sigma \( c \, b \; z \, Y \) = F \( c z \, b + h_sigma \( c z \) \; Y \) - F \( c z \, b \; Y \) \, wide
     z in C . $ <ia:derivative>]
  Extend in $Z$ by the cyclic lift. Both parent terms are evaluated in frame $c z$;
    the parent’s existing argument coordinates remain exactly $Y$.
    A tag-$0$ parent uses the full flip alphabet (7.7). For a tag-$i$ parent,
    only the two legacy coefficients matter: the input bits $s_i$ are never written and work bits are absent from
    its recipe. Use the fixed four masks
  #[#set math.equation(numbering: n => "(7.27)")
   $ h_chi \( y \) = chi_1 upright(bold(1))_(e_(y^(- 1))) + chi_2 upright(bold(1))_(e_(\( gamma y \)^(- 1))) \,
     wide chi in { 0 \, 1 }^2 \, $ <ia:port-flip-mask>]
  independent of $k$ and $i$.
  For a squarefree monomial, a fixed Boolean translation gives
  #[#set math.equation(numbering: n => "(7.28)")
   $ product_(j in S) \( b_j + h_j \) - product_(j in S) b_j =
     sum_(T subset.neq S) (product_(j in T) b_j) (product_(j in S \\ T) h_j) . $ <ia:degree-drop>]
  Thus (7.26) has logical degree at most $k_0 - 1$. Lifting its new variable adds at most $ell \( h - 1 \)$ to its
    coordinate degree. For each absolute frame $y$, output evaluation point, and inherited slot,
    the derivative is a known linear combination of grid monomials of degree at most $k_0 - 1$:
    from ${ w \, e }$ for tag $0$, or from ${ s_i \, e }$ for tag $i$.
  These coefficients are computed from the #emph[canonical parent recipe],
    not from the presently supplied parent table. An explicit method is bounded-degree Boolean interpolation.
    For a multilinear function $P$ of degree at most $r$ on a universe of $N$ bits, its coefficient on $S$,
    $\| S \| lt.eq r$, is
  #[#set math.equation(numbering: n => "(7.29)")
   $ \[ b_S \] P = sum_(T subset.eq S) \( - 1 \)^(\| S \| - \| T \|) P \( upright(bold(1))_T \) .
     $ <ia:boolean-inversion>]
  In characteristic two the signs are all one. Use this on the right side of (7.26),
    which is computable on every Boolean argument, including translated invalid tapes.
    There are only $sum_(j lt.eq r) binom(N, j) = "poly" \( n' \)$ required subsets, because $r lt.eq 3$ and $N =
    "poly" \( n' \)$. For tag $i$ the interpolation universe is the common ordered list of its $L$ source bits and
    $M$ legacy bits, with no work coordinates. Interpret the resulting coefficients as public maps $L_y$ on the
    permitted monomial arrays.
  Apply Lemma 45 using only inputs through tier $k_0 - 1$. The output derivative and every newly introduced
    auxiliary receive that tier and the parent’s tag. In particular a certificate for a shared tag-$0$ $T$ input
    in this positive call receives the positive ancestry tag.
    The derivative rotates only its new variable, since on the grid
  $ G_F^sigma \( u_0 c \, b \; z \, Y \) = G_F^sigma \( c \, b \; u_0 z \, Y \) \, $
  and lift uniqueness extends this to $K$. Its older parent variables are not additionally scaled under a frame
    change. Each verification auxiliary instead rotates its own new $R$, as proved by the linear tool.
  Repeat this operation for every added positive-tier family, including derivatives and all their proof families.
    Every descendant call strictly lowers its assigned tier, whether or not its actual degree was already smaller.
    The recursion ends after at most three levels. A family has only finitely many children for fixed $k$.
    A derivative inherits its parent’s single slot axis; a verification auxiliary uses its own recurrence-index
    axis rather than tensoring it with primary slots. Consequently the number of families is fixed,
    their native dimensions and slot lengths remain $O \( ell \)$,
    and their coordinate degrees remain $O \( ell h \)$. Tier-zero charts require no derivative for a fixed-frame
    Boolean edit.
  All maps have polynomial construction cost: there are polynomially many frames, evaluations, slots, monomials,
    and rows, and only a fixed number of recursive levels. Finite sums, monic division, coefficient extraction,
    and interpolation are fixed linear operations on each primary array.
    They neither create a further logical product nor import another primary’s dependency.
    This remains true when the final row sum fails, by Lemma 44.
    The asserted invalid-tape recipes and their degree bounds follow as well. ◻
]

#thm([Lemma 7.8.])[
  (Literal positive-port ancestry).  #emph[There are deterministic local call and ancestry conventions such that
    the entire tag-$i$ construction in an actual $k$-port graph is identical, after renaming $s_i$ to $s$,
    to the positive-tag construction in the one-port template with the same $L \, n'$ and field parameters.
    The agreement includes primary lists, row indexing and zero padding, packing maps,
    all auxiliary and derivative families, native dimensions, slot orders,
    and canonical arrays whenever $\( c \, e \, s_i \) = \( c \, e \, s \)$.
    It holds independently of the actual work destinations, $k$, and $f$.]
] <ia:port-ancestry>

#proof[
  Choose row lists, their order, and zero padding separately for each call’s local template.
    Do not choose a row dimension by maximizing over all calls in the actual graph.
    In each copy/port call use the same input-shape rows, bitness rows, and $\( c \, j \)$ copy rows,
    and the same full primary-list conventions. Although the work-side matrix depends on $w_(i \, j)$,
    its dimensions do not. This makes all port-dependent primary blocks literal copies of their dummy blocks.
  For a concrete example, consider $W_(e \, s_i)$ in (7.19).
    Its matrix $A_(e \, s) \( I \, X \)$ knows the stage and the source position $iota \( j \)$,
    and has no reference to $w_(i \, j)$. That destination appears only in the separate $A_(e \, w)$ block.
    The top formula for its positive certificate is
  $ p_(m' \, e \, s) \( I \, X \) = A_(e \, s) \( I \, X \) W_(e \, s_i) \( w_(upright("pack")) \( X \) \) \, $
  with the evident slot contraction when needed. Its row padding, packing, recurrence permutation,
    recurrence-index order, and coefficient-vector domain are therefore exactly those of the one-port
    construction. Each partial sum, quotient, remainder, and coefficient chart uses that block alone.
    The equality with the work-side contribution is tested only in (7.12);
    there is no mixed stored chart from which work addresses could enter this positive family.
  The critical source-bit calls agree directly, since they use the same initial-copy address rule and the same
    zero rule thereafter. For the remaining families, induct on positive ancestry.
    If a parent’s recipe and native layout agree, its derivative uses exactly the same restricted mask (7.27).
    Its values on every subset in (7.29), including translated invalid inputs, are identical in the two templates.
    Hence its maps $L_y$ are identical. Make each derivative call separately by parent type and mask,
    with the fixed allowed lower-tier monomial list, full output-equality rows, shape rows, deterministic order,
    and local padding. Its output and every per-primary auxiliary then agree literally by the linear-tool
    formulas. This includes auxiliaries whose primary is a shared legacy-only or constant $T$ chart:
    the input formula is common and the auxiliary’s own call matrix is the standardized positive one.
    These auxiliary families are themselves parents in the induction. Strictly decreasing tiers terminate it.
  Keep descendants from distinct standardized calls separate,
    without coalescing them differently with circuit-dependent tag-$0$ families.
    Additional full work masks and additional tag-$0$ calls then create separate branches and do not change any
    positive branch. The construction does not use validity to establish this correspondence. ◻
]

#thm([Lemma 7.9.])[
  (A common dimension and inherited full labels).  #emph[The common point domain $K^u$ and all per-chart dimension
    bounds can be fixed before $k$. Persistent charts can be placed in it so that every derivative preserves all
    its parent’s labels and slot order and adds an unused whole label for its new variable.
    Corresponding positive families have identical placements.
    For each fixed $k \, L$, all actual graph family and slot layouts can be fixed independently of the
    size-bounded circuit’s values and wiring.]
] <ia:placements>

#proof[
  Initially a monomial uses at most $d$ full variables and a $T$ chart one more.
    Base linear calls have native dimension $O_d \( ell \)$. Their row counts are bounded by $q^(C ell)$ for an
    absolute fixed $C$ independent of $k$: the work grid, clock grid, input length,
    and stage count are at most $h^ell$, and shape conditions are polynomial in the corresponding full evaluation
    sizes. Occupied-copy calls are separate, so their number does not enter an individual row dimension.
    They use fixed stage/source-index lists.
  For a derivative call on a parent of $m_0$ native coordinates and one possible slot axis, its output, shape,
    and clock-equality rows have size polynomial in $q^(m_0 + C ell)$, with a fixed exponent.
    Its permitted monomial input list is fixed by its tag and tier. Different masks have separate calls.
    Therefore $rho \/ ell$, the new native dimension divided by $ell$,
    and the new slot length divided by $ell$ are bounded by a fixed multiple of one plus the corresponding parent
    bounds. Digit unpacking contributes the fixed factor $v$;
    the coefficient-vector domain contributes at most $h - 1 lt.eq ell$ coordinates.
    Iterating through the at most three tier drops gives an absolute bound $C_(upright("dim")) ell$,
    independent of the number of calls or ports.
  Choose $u$ to accommodate this bound and at most $d + 1$ additional whole labels along an inherited
    derivative-axis chain. Put every full $K$ variable in a whole label,
    and pack remaining native $q$-coordinates into additional labels, ignoring their padding.
    An initial chart or a new verification auxiliary is a placement root;
    unrelated roots may reuse labels according to their native templates.
    A derivative retains exactly its parent’s placements and chooses a deterministically first unused whole label
    for its new variable. Repeat along that chain. No labels have to be globally disjoint across all ports:
    tests between unrelated charts assemble their native arguments separately and fill ignored coordinates
    uniformly. Enforce all ignored-coordinate conditions. These deterministic choices depend only on local
    templates and ancestry, proving positive-family agreement.
  For tag-$0$ calls at fixed $k \, L$, use the full uniform (stage, work-position) validity list,
    fixed critical-read roles and tiers, the full fixed flip alphabet for every parent, and the allowed monomial,
    shape, and output lists fixed by domain and tier. Only matrix entries and rule values vary with the circuit.
    This makes the entire actual layout independent of circuit wiring, as claimed. ◻
]

=== 7.5 Projection stacks and their exact tests <ia:projection-stacks>

Critical reads and tape edits require algebraic restrictions of charts with one or more full labels set to $1$.
  Reading these special points directly would not preserve a uniform point marginal.
  Instead we express each restriction as a sum of invertible affine pullbacks and store the affine-pulled values
  in slots. The progress coordinate $t$ specifies which of these slots are active.
  At full progress, summing over the new stack axes will give the required restriction;
  changing progress will use bounded slot shifts and affine pulls.

Give each critical address output its clock-formula variable as a projection axis.
  Other initial persistent charts, including all verification auxiliaries, start with no projection axes.
  A derivative inherits its parent’s axes, with their exact labels, and adds its new outer variable.
  New verification auxiliaries again start with no axes. Denote the resulting set by $A_F$; its size is at most $d + 1$.

Fix a generator $g$ of $bb(F)_q^times$. For a full label $alpha$, let $D_alpha$ be pullback by

#[#set math.equation(numbering: n => "(7.30)")
 $ Z_alpha mapsto 1 + g \( Z_alpha - 1 \) . $ <ia:dilation>]

This is an invertible $K$-affine map on the common domain.

#thm([Lemma 7.10.])[
  (Projection by full-label dilations).  #emph[If the coordinate degree in label $alpha$ is below $q - 1$, then
#[#set math.equation(numbering: n => "(7.31)")
 $ sum_(r = 0)^(q - 2) D_alpha^r F = F \|_(Z_alpha = 1) \, $ <ia:projection-identity>]

 where the right side ignores that label. Dilations on distinct full labels commute.]
] <ia:projection>

#proof[
  Center the $bb(F)_q$ coordinates of $Z_alpha$ at the coordinate vector of $1 in K$.
    Decompose $F$ into parts homogeneous of degree $r$ in the centered coordinates.
    Their sums under all nonzero scalar dilations have multiplier
  $ sum_(j = 0)^(q - 2) g^(j r) = cases(delim: "{", 1 \, & r = 0 \,, 0 \, & 0 < r < q - 1 .) $
  For $r = 0$ this is $q - 1 = 1$ in characteristic two, and for positive $r$ it is a geometric sum with ratio
    different from one. Thus only the constant homogeneous part remains.
    Pullbacks on disjoint labels commute by direct substitution. ◻
]

#strong[Mode and progress marker.] Represent $eta$ by a point-constant scalar chart.
  Enforce constancy, then membership in $bb(F)_2 dot.op 1$ by random additive binary forms annihilating $1$.
  A value outside this subspace is detected with probability $1 \/ 2$; on the subspace,
  a fixed form sending $1$ to $1$ reads the bit.

Let $N = B^a$. Represent progress by a point-constant marker tensor $M_j^(upright("mark"))$,
  with $a$ radix axes of length $B$, indexing $0 lt.eq j < N$.
  At $t = 0$ it is zero; at $t > 0$ it is one-hot at $t - 1$.
  After constancy is enforced, test with independent uniform separable masks $L \, L'$ the identity

#[#set math.equation(numbering: n => "(7.32)")
 $ \( L dot.op M^(upright("mark")) \) \( L' dot.op M^(upright("mark")) \) = \( L L' \) dot.op
   M^(upright("mark")) \, $ <ia:marker-identity>]

where each axis of $L L'$ is an entrywise product. Expanding in the separate mask variables,
  exactness says $M_j^(upright("mark")) M_(j')^(upright("mark")) =
  0$ for $j eq.not j'$ and $\( M_j^(upright("mark")) \)^2 = M_j^(upright("mark"))$ for each $j$.
  Hence the tensor is zero or has exactly one coefficient equal to one.
  A nonzero discrepancy is a polynomial of bounded mask degree and is detected with constant probability.
  Enforce zero support for

#[#set math.equation(numbering: n => "(7.33)")
 $ q - 1 lt.eq j < N . $ <ia:marker-padding>]

This range is a union of at most $a + 1$ radix rectangles:
  compare digits from the most significant end, separating the first larger digit and the boundary itself.
  Masked restrictions check every rectangle with boundedly many probes.
  The remaining possibilities are exactly $t in { 0 \, dots.h \, q - 1 }$. Both mode and marker have tag $0$.

For each persistent $F$ and each nonempty $S subset.eq A_F$, include a stack with the same tag, point placements,
  and inherited slots as $F$, and $a$ additional radix slot axes for each $alpha in S$. Its intended formula is

#[#set math.equation(numbering: n => "(7.34)")
 $ C_(F \, upright(bold(j)))^S \( c \, b \, eta \, t \; Y \) =
   cases(delim: "{", (product_(alpha in S) D_alpha^(t - 1 - j_alpha)) F \( c \, b \; Y \) \, & j_alpha < t
   upright(" for every ") alpha in S \,, 0 \, & upright("otherwise") \,) wide C_F^diameter = F . $ <ia:stack-formula>]

Indices run through $0 \, dots.h \, N - 1$ on each integer axis.

#thm([Lemma 7.11.])[
  (Canonical stacks and bounded radix probes).  #emph[For a legal marker,
    the stacks are uniquely characterized by a fixed number of types of bounded-probe polynomial identities.
    These tests are perfectly complete and have constant exact gap on degree-at-most-$D$ polynomials.
    Their only unknown products are marker times smaller-stack products,
    with independent full operand point marginals and compatible tags.
    All slot shifts, restrictions, and boundary slices have bounded separable-mask expansions.]
] <ia:stacks>

#proof[
  For each nonempty $S$, fix one $alpha in S$ and require
  #[#set math.equation(numbering: n => "(7.35)")
   $ C_(F \, \( j_alpha \, upright(bold(j))_(-) \))^S = D_alpha
     C_(F \, \( j_alpha + 1 \, upright(bold(j))_(-) \))^S + M_(j_alpha)^(upright("mark"))
     C_(F \, upright(bold(j))_(-))^(S \\ { alpha }) \, $ <ia:stack-recurrence>]
  with the upper boundary at $j_alpha = N$ defined to be zero.
    For fixed $upright(bold(j))_(-)$ this is triangular downward in $j_alpha$.
    If the marker is zero its only solution is zero. If it is one-hot at $t - 1$, its solution is
  $ C_(F \, \( j_alpha \, upright(bold(j))_(-) \))^S =
    cases(delim: "{", D_alpha^(t - 1 - j_alpha) C_(F \, upright(bold(j))_(-))^(S \\ { alpha }) \, & j_alpha <
    t \,, 0 \, & j_alpha gt.eq t .) $
  Induction on $\| S \|$ gives exactly (7.34).
  Here are explicit slot formulas for the shift, including boundary handling.
    Use little-endian radix digits $j = sum_(s = 0)^(a - 1) j_s B^s$ and let $lambda_L \( j \) =
    product_(s = 0)^(a - 1) L_s \[ j_s \]$. With out-of-range coefficients zero,
  #[#set math.equation(numbering: n => "(7.36)")
   $ sum_(j = 0)^(N - 1) lambda_L \( j \) C_(j + 1) & = sum_(r = 0)^(a - 1) L^(\( r \, + \)) dot.op C \,\
L_s^(\( r \, + \)) \[ d \] & =
  cases(delim: "{", L_s \[ B - 1 \] upright(bold(1))_(d = 0) \, & s < r \,, upright(bold(1))_(d gt.eq 1) L_r \[
  d - 1 \] \, & s = r \,, L_s \[ d \] \, & s > r \,)\
sum_(j = 0)^(N - 1) lambda_L \( j \) C_(j - 1) & = sum_(r = 0)^(a - 1) L^(\( r \, - \)) dot.op C \,\
L_s^(\( r \, - \)) \[ d \] & =
  cases(delim: "{", L_s \[ 0 \] upright(bold(1))_(d = B - 1) \, & s < r \,, upright(bold(1))_(d lt.eq B - 2)
  L_r \[ d + 1 \] \, & s = r \,, L_s \[ d \] \, & s > r .) $ <ia:radix-plus>]
  Indeed the first pullback mask on index $k > 0$ is $lambda_L \( k - 1 \)$.
    Partition $k$ by its least digit $r$ which is nonzero; precisely the lower digits borrow.
    The second pullback is $lambda_L \( k + 1 \)$ for $k < N - 1$; partition by the least digit below $B - 1$.
    Overflow is absent in both formulas. Slicing at zero is a single separable restriction,
    and interval restrictions use the bounded rectangle decomposition used in (7.33).
    Tensoring these expansions over the bounded number of stack axes still gives a bounded number of separable
    masks. Split every requested mask additively as in (7.9).
  Contract the entire identity (7.35) over all slots. The last term factors into a contraction of the marker on
    axis $alpha$ and a contraction of the smaller stack on its other axes and inherited slots.
    In the exact-soundness analysis marker constancy has already been imposed,
    so its full point can be sampled independently of the smaller stack point.
    This retains perfect completeness on canonical data. If the recurrence is not an identity,
    its discrepancy has point degree at most $2 D$ and bounded mask degree, giving constant rejection probability.
    Honest stacks are affine pullbacks of persistent charts or zero,
    so they have the same honest coordinate degree. Marker tag $0$ is compatible with every parent tag.
    This proves all claims. ◻
]

=== 7.6 Exact validation and locally encoded evolution <ia:validation-and-evolution>

#thm([Lemma 7.12.])[
  (Exact algebraic validity).  #emph[For each fixed $k$ there is a fixed finite mixture of bounded-probe tests
    with perfect completeness on canonical extended labels and a uniform constant gap on genuine
    degree-at-most-$D$ polynomial families. Passing all identities is equivalent to being the unique canonical
    tuple of a valid extended label. The gap is independent of $L$ past the fixed cutoff and uniform over the
    allowed circuit coefficients. Linear probes have bounded point and mask density.
    Every unknown product has compatible tags and can be queried with independent full point marginals for its two
    operands.]
] <ia:exact-validator>

#proof[
  The tests just constructed constitute a fixed number of family types for fixed $k$;
    growing slot lists are checked by whole contractions. We prove exact soundness in an order that licenses all
    substitutions. First consider ignored-coordinate requirements, mode and marker constancy,
    and the independence and coefficient linearity devices of every linear tool.
    If one fails, its direct test has constant gap. Otherwise these are exact polynomial identities.
    Monomial factorization and the nonrotating base calls then force a Boolean tape, all its monomial extensions,
    its union-of-stages validity, its output chart, and the canonical per-primary certificates.
    Mode and marker membership give unique $eta$ and $t$. The legacy identity (7.22) forces the unique frame $c$
    and fixes $J_c$; clock-monomial factorizations fix all $T_W$.
  Now apply the clock-formula calls in construction order. Their uniqueness fixes each critical output,
    each derivative, and every auxiliary. A derivative’s rows were computed from a prescribed parent recipe;
    the proof never treats an unverified parent table as an additional oracle for those rows.
    The strictly decreasing tier construction is therefore acyclic.
    Finally the triangular stack identities give (7.34). Hence exactness of all identities gives precisely a valid
    label’s canonical tuple. Conversely every valid label satisfies every identity for every random choice in the
    support.
  If exactness fails, the first failed identity in this ordering has point degree $O \( D + ell h \)$ after the
    stated preliminary devices and bounded degree in its mask variables.
    The polynomial zero and contraction bounds give a uniform positive rejection probability.
    Taking the minimum over the fixed mixture gives the asserted gap.
    Honest degrees are $O \( ell h \) < D$ eventually, also after any later fixed-factor enlargement of the point
    domain. The constants in these degree bounds and in the finite family list depend on fixed templates,
    not on the values of public circuit coefficients.
  For the product claim, the only possibilities are monomial factorizations, $J_c W$ factorizations,
    marker membership, and marker times smaller stack. In a factorization,
    choose the two native operand arguments independently, assemble the output’s relevant groups from them,
    and independently fill all ignored coordinates. Even repeated operand types then have independent full operand
    points. The relevant output groups are independent uniform too.
    For marker products use independent points, justified by the earlier constancy step.
    Every such pair has compatible tags by construction. Bitness, diagonal grid entries, copy equalities,
    and all other correlated grid uses are linear matrix rows,
    so they require no concentrated unknown-product query. The linear tool’s packing, permutation,
    and splitting probes have bounded individual point density.
    Dependent or prescribed masks, including those inside products,
    are smoothed by fresh independent axis splittings. These observations prove the stated probe interface. ◻
]

#thm([Lemma 7.13.])[
  (All neighbor coordinates evolve by bounded affine pulls).  #emph[For canonical valid data,
    edge existence and the transition branch in either direction are determined using only mode,
    empty/full marker comparisons, and boundedly many critical projected bits at full progress.
    Equality decisions can have any prescribed fixed error probability by a fixed number of repetitions.
    Once the finite Boolean branch is fixed, every requested contraction in the neighbor tuple is a bounded public
    linear sum of contractions in the current tuple at invertible $K$-affine pullbacks of the common point.
    Its coefficients and slot pulls depend on the branch, requested masks, and public data, but not on the point,
    row index, or further hidden values. Tag-$0$ updates use only tag $0$; tag-$i$ updates use only compatible types.]
] <ia:evolution>

#proof[
  We give formulas for each transition, including the boundaries.
    Write $C_(F \, upright(bold(j)))^(S \, t)$ for the stack at progress $t$.
  #strong[Progress increase and decrease.] On increasing from $0$ to $1$, initialize every nonempty stack by
  #[#set math.equation(numbering: n => "(7.37)")
   $ C_(F \, upright(bold(j)))^(S \, 1) = upright(bold(1))_(upright(bold(j)) = upright(bold(0))) F \, wide
     M_j^(upright(m a r k \, n e w)) = upright(bold(1))_(j = 0) . $ <ia:increase-zero>]
  For $0 < t < q - 1$, and $upright(bold(j))$ in the padded radix range, let $Z \( upright(bold(j)) \) =
    { alpha in S : j_alpha = 0 }$ and put $k_alpha = 0$ for $alpha in Z \( upright(bold(j)) \)$ and $k_alpha =
    j_alpha - 1$ otherwise. Then
  #[#set math.equation(numbering: n => "(7.38)")
   $ C_(F \, upright(bold(j)))^(S \, t + 1) = (product_(alpha in Z \( upright(bold(j)) \)) D_alpha)
     C_(F \, upright(bold(k)))^(S \, t) \, wide M_j^(upright(m a r k \, n e w)) =
     M_(j - 1)^(upright(m a r k \, o l d)) \, $ <ia:increase-positive>]
  with zero padding. For $j_alpha > 0$, the old exponent is $t - 1 - \( j_alpha - 1 \) = t - j_alpha$,
    as required; for $j_alpha = 0$, one extra dilation gives exponent $t$. Old inactive coefficients remain zero.
    Partitioning by $Z \( upright(bold(j)) \)$ and using the radix pull formulas implements this with boundedly
    many mask operations. For a decrease from $t > 0$, the formula is simply
  #[#set math.equation(numbering: n => "(7.39)")
   $ C_(F \, upright(bold(j)))^(S \, t - 1) = C_(F \, \( j_alpha + 1 \)_(alpha in S))^(S \, t) \, wide
     M_j^(upright(m a r k \, n e w)) = M_(j + 1)^(upright(m a r k \, o l d)) . $ <ia:decrease>]
  Its exponent is $t - 1 - \( j_alpha + 1 \) = t - 2 - j_alpha$ and its support is $j_alpha < t - 1$.
    In particular $t = 1$ produces empty stacks and a zero marker.
    Persistent data remain fixed during these progress transitions.
  #strong[Critical readings and full-progress edits.] At $t = q - 1$,
    for a critical chart $F$ with projection axis $alpha$,
  #[#set math.equation(numbering: n => "(7.40)")
   $ sum_(j = 0)^(N - 1) C_(F \, j)^({ alpha }) = sum_(j = 0)^(q - 2) D_alpha^(q - 2 - j) F =
     F \|_(Z_alpha = 1) . $ <ia:critical-projection>]
  All-ones radix masks perform this sum. A critical output ignores every other native group,
    so the result is a constant-in-point logical or public rule bit.
    Lemma 40 therefore determines the edit mask from finitely many such bits.
  Fix that mask and direction. For every positive-tier parent $F$ and every $S subset.eq A_F$, including $S =
    diameter$, add the increment
  #[#set math.equation(numbering: n => "(7.41)")
   $ Delta C_(F \, upright(bold(j)))^S = sum_(r = 0)^(N - 1)
     C_(G_F^sigma \, \( upright(bold(j)) \, r \))^(S union { alpha_(upright("new")) }) . $ <ia:edit-increment>]
  For a positive port parent use its corresponding legacy mask $chi$.
    For active old indices, commuting all inherited-label dilations with projection on the new label gives
  #[#set math.equation(numbering: n => "(7.42)")
   $ Delta C_(F \, upright(bold(j)))^S & = (product_(alpha in S) D_alpha^(q - 2 - j_alpha))
     G_F^sigma \( c \, b \; 1 \, Y \)\
 & = (product_(alpha in S) D_alpha^(q - 2 - j_alpha)) #scale(x: 120%, y: 120%)[\(]
   F \( c \, b + h_sigma \( c \) \; Y \) - F \( c \, b \; Y \) #scale(x: 120%, y: 120%)[\)] . $ <ia:edit-calculation>]
  If any inherited index is inactive, every summand is zero.
    This is precisely the new stack minus the old one, including the empty stack,
    which is the persistent chart itself. The recursion supplied the necessary lower-tier derivative for
    #emph[every] positive-tier parent, including proof and derivative charts,
    so all coordinates update simultaneously from old data. Tier-zero charts stay fixed under the Boolean change.
    The marker is unchanged and the mode changes as prescribed.
    Reverse edits obey the same calculation with the inverse branch’s coefficients.
  #strong[Frame change and edge flags.] At empty progress all stacks are zero.
    For frame advance, a rotating persistent chart is pulled back on its one designated variable by multiplication
    by $gamma$; for reverse advance use $gamma^(- 1)$. A nonrotating persistent chart stays fixed.
    The empty stacks remain zero, and the mode changes. In particular,
    an auxiliary with native variables $\( R \, I \, X \, U \)$ rotates only $R$; its packing, division,
    and coefficient formulas are not recomputed by the update.
  The successor rules are: pre increases unless full; at full pre perform the enabled edit,
    or report the absent wrap edge; post decreases unless empty; at empty post advance the frame.
    The predecessor rules are: full post performs the inverse enabled edit, or reports the absent wrap edge;
    other post reverses a decrease; positive-progress pre reverses an increase;
    empty pre reverses the frame advance. Empty must also be distinguished for initialization in (7.37).
    These are all finite cases. Comparing the marker with the public zero tensor or the public full tensor uses
    random separable masks and binary forms, with a constant inequality-detection gap.
    A fixed number of repetitions makes either comparison as reliable as prescribed.
    Mode and critical constant bits are read with forms taking $1$ to $1$.
    No progress index scan or proposed-target validity check is needed for edge flags on the valid inner path.
  Finally, all point maps in these formulas are identities, full-label dilations (7.30),
    or full-label multiplications by $gamma^(plus.minus 1)$, and their bounded compositions.
    They are invertible $K$-affine maps. In (7.41), the child retains the parent’s placements and has an already
    available extra whole label; the sum projects that label to one and makes it irrelevant to the target
    coordinate. Thus a requested update has the form
  #[#set math.equation(numbering: n => "(7.43)")
   $ L dot.op F^(upright("new")) \( Y \) = P_L \( Y \) + sum_(r = 1)^(R_(*))
     a_r \( L_r dot.op F_r \) \( T_r Y \) \, $ <ia:affine-update>]
  where $R_(*)$ is bounded, $P_L$ is publicly computable, $a_r$ and $L_r$ are fixed by the requested masks and
    branch, and $T_r$ is an invertible $K$-affine map. No $a_r$ or slot pull depends on $Y$ or on a later row
    index. The inherited tags in Lemma 46, and the public fixed branch, give the tag assertions. ◻
]

#prodef([Remark 7.14.])[
  (Native tests and encoded updates have different maps).  The arbitrary $bb(F)_q$ coordinate permutations and
    surjective digit packing in Lemma 44 need not be $K$-affine.
    They are used to construct certificates and to test systematic target-point values with bounded density.
    They are not maps for propagating an encoded parity row or a line-coefficient array.
    Equation (7.43) is the separate evolution interface for those encodings.
    For example, the proof chart $F \( c \, b \; R \, I \, X \, U \)$ changes frame only through its whole $R$
    label, and changes Boolean tape through its stored child’s full-label projection.
    Its canonical division is not rerun on the requested encoded symbol.
    This distinction permits the binary construction to use ordinary systematic representations for all native
    tests while transporting neighbor updates through its common affine action and linear row encoding.
] <ia:testing-versus-evolution>

#thm([Lemma 7.15.])[
  (Source data, original indices, and Boolean degree).  #emph[At each of the two labels in (7.8),
    every tag-$0$ chart and stack is publicly computable. Every tag-$i$ chart and stack has exactly the value of
    its corresponding positive-tag one-port-template chart at the same native point, slot, and mask indices,
    evaluated on input $s_i$. These statements hold for the source and its first successor separately,
    with their indicated progresses $q - 1$ and $q - 2$.]
  #emph[At either label, every prime-field coordinate function of every chart value or coordinate coefficient has
    multilinear degree at most three in the read inputs. Any common public linear representation of these arrays
    preserves this bound and their original-index correspondence.
    A binary bilinear form of two such represented values has degree at most six.
    Its coefficients are computable in polynomial time by bounded-degree Boolean interpolation.]
] <ia:source-data>

#proof[
  At both labels, $c = gamma^(- 1)$, work is blank, $e_1 = 1$ and other legacy bits are zero, the mode is post,
    and progress is the public value specified in (7.8). Tag-$0$ persistent recipes depend only on these values
    and public circuit data, so they are computable. Their derivatives might evaluate a translated tape with
    nonblank work, but every flip vector is then public and the translated work is public too.
    Such a tape need not be valid: the canonical recipe is evaluated by its finite-array operations,
    and never by solving for a valid circuit computation. In particular a work-side copy certificate uses its own
    work primary and public matrix, not a stored sum involving $s_i$.
    Recursively, all its derivative and proof arrays remain public.
    Stack dilations at either fixed progress preserve this conclusion.
  Positive persistent recipes and layouts agree by Lemma 47, and their placements agree by Lemma 48.
    The projection-axis choices, inherited labels, $q \, a \, B$, and radix slot conventions also agree.
    Formula (7.34) therefore gives identical stacks at each of the two progresses,
    including every descendant proof stack. This proves a literal map of original algebraic indices,
    not merely equality up to unspecified isomorphisms or comparable sizes.
    Applying the same public row extension, restriction to an ordered line, extraction of its coefficients,
    slot contraction, or basis map to corresponding arrays preserves both values and indices.
    Later balancing by repeated copies may use different multiplicities;
    it does not alter this statement about original indices.
  At a fixed frame every persistent value and coefficient has assigned degree at most three in the Boolean tape.
    At the present labels all tape bits except the read inputs are fixed public bits.
    Fixed-progress stacks are fixed affine pullbacks or zero.
    Their degree is thus at most three in the read inputs as well.
    A public linear operation over $bb(F)_q$, or over any fixed public extension field followed by prime-field
    coordinates, is $bb(F)_2$-linear on these functions. It cannot increase multilinear degree.
    For two degree-three coordinate vectors, a binary bilinear form is a sum of products of two such coordinate
    functions and hence has degree at most six. Copies do not alter degree.
    Evaluate the specified canonical bit on supports of size at most six and apply (7.29);
    the number of evaluations and each canonical finite-array computation are polynomial.
    This proves the coefficient-computation assertion. ◻
]

=== 7.7 The complete inner algebra interface <ia:interface>

#thm([Lemma 7.16.])[
  (Inner algebra interface).  #emph[Fix $c_(upright("allow"))$.
    The field and grid parameters (7.1)–(7.4), the common domain $K^u$,
    and the one-port positive family templates can be chosen before the port count and the function.
    For every fixed $k$ and fixed circuit size factor, and all sufficiently large $L$,
    a uniform polynomial-time construction has the following properties.]
  + #emph[#strong[Paths and endpoints.] The graph on all port tuples is the graph of Definition 41.
    On each fixed tuple $s$ it is one directed path with source and first successor (7.8),
    no isolated vertices or self edges, and a sink at full pre stage $M - 1$.
    The point-constant output chart (7.20) equals $f \( s \)$ at the sink.]
  + #emph[#strong[Canonical polynomial arrays and their size.] Each valid extended label has a unique canonical
    tuple $cal(A) \( c \, b \, eta \, t \)$ of $bb(F)_q$-coefficient polynomials on $K^u$.
    Persistent native dimensions are at most $C_(upright("dim")) ell$,
    with $C_(upright("dim"))$ independent of $k$, and each persistent family has at most one $O \( ell \)$ slot
    axis. Stack families have a bounded number of slot axes, each of length $O \( ell \)$.
    Their honest coordinate degrees are $O \( ell h \) < D$. For fixed $k$,
    the number of families is fixed and every full evaluation table, fully masked table, public matrix,
    and indexing map has polynomial size and is polynomial-time constructible.
    The layouts for fixed $k \, L$ are independent of the circuit’s values and wiring.
    The construction does not enumerate all Boolean tapes or graph vertices.]
  + #emph[#strong[Exact validity with smooth binary-form probes.] There is a fixed finite mixture of bounded-probe
    algebraic tests, perfectly complete on canonical valid tuples.
    For every tuple of genuine degree-at-most-$D$ polynomials,
    either it is a canonical valid tuple or the rejection probability is at least $theta_(upright("alg")) > 0$.
    For fixed $k$ this gap and the probe density bounds are uniform in $L$ and in the allowed circuit
    coefficients. Each linear probe has bounded point and mask marginals.
    Every unknown product has compatible tags and independent full point marginals for its two operands,
    also for repeated types. The tests require only a bounded number of additive binary forms and binary bilinear
    forms of hidden field values, followed by a bounded number of Boolean operations.
    They do not require reading the full binary expansion of a hidden field element.]
  + #emph[#strong[Invalid tapes and finite derivative closure.] Canonical recipes exist also for arbitrary Boolean
    $b$ at every specified $c \, eta \, t$, whether or not that label is valid.
    They retain their coordinate bounds, logical degree at most three, per-primary dependencies,
    and designated frame covariance. Every positive-tier persistent family,
    including every verification auxiliary, has all its required lower-tier derivatives.
    The recursion terminates in at most three tier drops. A nonvalid tuple so obtained has the same exact
    rejection gap; no alternative certificate can hide a failed row condition.]
  + #emph[#strong[Neighbor evolution.] On valid data, both edge flags and finite transition branches use only
    mode, empty/full marker comparisons, and boundedly many critical projected bits at full progress.
    At any desired fixed reliability, these distinctions use boundedly many binary probes.
    After a branch is fixed, every neighbor contraction has the form (7.43) with boundedly many invertible
    $K$-affine pulls of the common point. Coefficients and slot pulls are independent of point and row position.
    Tag-$0$ updates use tag $0$ only; positive updates use compatible tags.
    The formulas update all proof data simultaneously. Their fixed-branch algebraic identities remain valid on
    canonical invalid Boolean inputs, without asserting that the resulting proposed label is valid.]
  + #emph[#strong[Standardized ports and source access.] Every positive-tag family has the literal per-call
    ancestry and original-index correspondence of Lemma 47, including all descendants, full-label placements,
    projection axes, and stacks. At the source and first successor, the tag-$0$ part is public,
    and tag $i$ agrees with the one-port template on $s_i$. The source Boolean-degree bounds are three under
    public linear representations and six after one binary bilinear pairing, as in Lemma 54.
    These templates and bounds are fixed before actual $k$ or any later correction accuracy is chosen.]
] <lem:inner-algebra-interface>

#proof[
  The path and endpoint assertions are Lemmas 40 and 42. The linear tool, clock-formula construction,
    derivative closure, and common placements give the persistent arrays. Lemma 50 gives their stacks.
    At fixed $k$, all depths and family counts are fixed, while all dimensions and total mask lengths are
    $O \( ell \)$. Consequently every domain and mask space has size $q^(O \( ell \)) = "poly" \( n' \) =
    "poly" \( L \)$. Row and coefficient arrays have the same polynomial bounds.
    Their construction consists of the explicit finite-array operations and bounded-degree interpolation above.
    In particular, increasing the number of separate calls does not change the already chosen common $u$.
  Lemma 51 proves the exact gap and all point and tag restrictions.
    Here is its conversion to the asserted binary-form interface.
    A nonzero element of $bb(F)_q$ is detected by a uniformly random additive form $mu : bb(F)_q arrow.r
    bb(F)_2$ with probability $1 \/ 2$. Applying $mu$ to a field equality turns its public linear terms into
    additive forms, since
  $ mu (sum_r a_r x_r) = xor.big_r \( mu compose \[ a_r \] \) \( x_r \) \, wide \[ a_r \] \( x \) = a_r x . $
  For a product, the requested bit is the binary bilinear form $\( x \, y \) mapsto mu \( x y \)$.
    Random annihilating forms handle mode membership as already specified.
    A bounded field test therefore uses a bounded number of such bits and Boolean operations,
    losing at most a fixed factor in its gap. Prescribed masks and forms can be split by fresh additive
    randomness. Their public descriptions have polynomial size;
    even the space of all binary bilinear forms on $bb(F)_q$ has cardinality
  $ 2^(\( log_2 q \)^2) = "poly" \( n' \) \, $
  since $log q = O \( log log n' \)$. A bounded sequence of all the displayed random choices consequently has
    polynomial support.
  The invalid-tape assertion follows from the per-primary canonical formulas and the finite-difference
    construction, not from successful final rows. If a label is invalid,
    a validity or frame/legacy condition fails and exact soundness rejects;
    uniqueness of the division certificates prevents a different proof table from canceling the failed condition.
    Lemma 52 proves all fixed-branch update formulas, including for canonical invalid tapes.
    Frame changes occur only when stacks are empty, so no commutation between centered dilations and frame scaling
    is needed. Finally Lemmas 47, 48, and 54 give the exact standardized source correspondence and its
    Boolean-degree bounds. This proves every part of the interface. ◻
]

== 8 Binary testing and average correction at a fixed radius <sec:inner-binary>

We convert the polynomial arrays of Section 7 into binary words.
  The correction guarantee is averaged over the requested encoded coordinates.
  Its radius is fixed before the requested accuracy and the density of those coordinates are specified.
  This quantifier order is essential when the one-port construction is subsequently used many times.

All notation in this section is inner notation. In particular,
  the groups below are polynomial-size affine groups and are unrelated to the outer index group.
  Fix one of the padded templates of Lemma 55. We call each polynomial family in its canonical tuple,
  together with its slot axes, a #emph[track]. We use its fields $bb(F)_q subset K = bb(F)_(q^ell)$,
  common target domain $K^u$, degree bound $D = ell^2 - 1$, and fixed number of slot-mask axes per track.
  The integer $u$ and the field conventions are common to the actual and one-port templates.
  Honest chart degrees, including the constant factor enlargement below,
  are $O \( ell h \) < D$ for sufficiently large size. The field-size choice already made in Section 7.1 ensures
  $q \/ D arrow.r oo$. Constants in this section may depend on the fixed template,
  but are uniform in the public circuit within that template.

=== 8.1 Rectangular coordinates and the common row code <ib:rectangular-code>

The algebraic neighbor formulas use invertible affine maps of the target $K^u$.
  We will add parity rows so that local row decoding can reduce errors,
  and use a group action to move a requested value among columns without changing it.
  The rectangular coordinates below make this action transitive on point and ordered-line columns.
  Target affine maps commute with it, so neighbor updates remain column permutations after row encoding.

Choose a constant integer $r > 2 u$, $r gt.eq 3$. A rectangular point is $I = \( P \, z \)$, where $P \( x \) =
  A x + b$ maps $K^r$ affinely to $K^u$ and $z in K^r$. Retain points with $"rank" A = u$. For an ordered $bb(F)_q$-line

$ I_t = \( P_0 + t P_1 \, z_0 + t z_1 \) \, wide t in bb(F)_q \, $

retain it precisely when the matrix obtained by stacking $A_0 \, A_1$ has rank $2 u$ and $z_1 eq.not 0$.
  Every point on such a line is retained, since a dependence in $A_0 +
  t A_1$ would give a dependence in the stacked matrix. A sequential row-exposure bound shows that the omitted
  point and line fractions are $o \( 1 \)$ as $\| \| K arrow.r oo$;
  for example rank failure for an $s$-by-$r$ uniform matrix is at most $sum_(j = 0)^(s - 1) \| \| K^(j - r)$.

Write

$ U \( K \) = K^r times.r upright("SL")_r \( K \) \, wide cal(H) = U \( K \) times U \( K \) \,
  wide \( g_1 \, g_2 \) \( P \, z \) = \( P compose g_1^(- 1) \, g_2 z \) . $

This is an affine action on the rectangular $bb(F)_q$-coordinates,
  and acts on ordered lines without changing their parameter.
  There is one orbit of retained points and one orbit of retained ordered lines.
  Indeed, right special-linear transformations are transitive on full-rank matrices with $u$ rows,
  and on those with $2 u$ rows: first align by a general-linear transformation and then adjust its determinant on
  an unused complementary dimension. Translation in the argument of $P$ adjusts the one or two offsets because the
  corresponding matrix has full row rank. Independently, the second affine factor is transitive on points and on
  ordered pairs of a base point and a nonzero direction. All retention conditions are invariant.
  In particular the point at each fixed parameter of a uniform retained ordered line is uniform on retained points.

An invertible affine target map $d : K^u arrow.r K^u$ induces $\( P \, z \) mapsto \( d compose P \, z \)$.
  It commutes with $cal(H)$, preserves both retained domains, and preserves line parameters.
  A target chart $f$ is represented by $f \( P \( z \) \)$;
  this substitution increases its coordinate degree by at most a factor two.

#thm([Lemma 8.1.])[
  (Uniform affine-group expansion).  #emph[There is a fixed symmetric labelled multiset $u_1 \, dots.h \,
    u_(d_e)$ in each $cal(H)$, with $d_e gt.eq 8$, whose averaging operator has norm at most $1 \/
    64$ on mean-zero functions. The labels, group operations,
    and complete group tables are deterministically constructible in polynomial time in the inner size.
    The degree and gap are independent of the fields.]
] <ib:affine-expansion>

#proof[
  Here are the two primary group-theoretic inputs and their exact use.
    Ershov–Jaikin-Zapirain #cite(label("EJZ2010")) Theorem 1.1 prove property $\( T \)$ for
    $upright("EL")_r \( R \)$ for every finitely generated associative unital ring $R$ and $r gt.eq 3$.
    Their generating-set bound in Section 6.1 applies to the elementary matrices with entries in a fixed
    ring-generating set containing 1. In particular, their equations (6.1)–(6.2) give the positive Kazhdan constant
  $ kappa_r = #scale(x: 120%, y: 120%)[\[] 8 \( 48 sqrt(2) + 2 sqrt(3 r) \) #scale(x: 120%, y: 120%)[\]]^(- 1) $
  for ${ e_(i j) \( 1 \) \, e_(i j) \( t \) : i eq.not j }$ in $upright("SL")_r \( bb(F)_2 \[ t \] \)$;
    the equality with the elementary group holds because $bb(F)_2 \[ t \]$ is Euclidean.
    No restriction excluding characteristic two occurs in this theorem.
  Shalom #cite(label("Shalom1999")) Theorem 3.4 and Corollary 3.5, applied to the discrete commutative ring $R =
    bb(F)_2 \[ t \]$, bounds the displacement of every translation in $R^2 times.r
    upright("SL")_2 \( R \)$ by 484 times the maximum displacement on the basis translations and $e_12 \( 1 \) \,
    e_12 \( t \) \, e_21 \( 1 \) \, e_21 \( t \)$. Signs coincide in characteristic two.
    This is the homogeneous displacement form of the corollary’s tolerance statement,
    obtained by scaling and taking limits. It bounds the translation sector;
    it alone does not assert expansion of the full affine group.
  Set $Lambda = R^r times.r upright("SL")_r \( R \)$ and let $S$ consist of all basis translations and the
    elementary matrices just listed for all ordered coordinate pairs.
    Embed Shalom’s rank-two group on each such pair. Since a translation is a product of $r$ coordinate
    translations, every unitary representation satisfies
  #[#set math.equation(numbering: n => "(8.1.1)")
   $ sup_(a in R^r) lr(bar.v.double a v - v bar.v.double) lt.eq
     484 r max_(s in S) lr(bar.v.double s v - v bar.v.double) . $]
  Let $V_N$ be the translation-invariant subspace. Its orthogonal projection commutes with $Lambda$,
    since the translations are normal. On $V_N^perp$, the minimum-norm point of the closed convex
    translation-orbit hull is zero. The displayed bound therefore gives $lr(bar.v.double  bar.v.double) v lt.eq
    484 r max_(s in S) lr(bar.v.double s v - v bar.v.double)$ on this subspace.
    On $V_N$, a representation without group-invariant vectors is a representation of $upright("SL")_r \( R \)$
    without invariant vectors, so the preceding Kazhdan bound applies.
    Orthogonally combining the two bounds gives a positive Kazhdan constant $kappa$ for $\( Lambda \, S \)$.
    Explicitly, if $kappa_r$ is the quoted linear-group constant,
    one may take $kappa = \( \( 484 r \)^2 + kappa_r^(- 2) \)^(- 1 \/ 2)$.
  The set $S$ generates $Lambda$: the third-index elementary commutator multiplies entries,
    entries in a root subgroup add, and conjugating basis translations gives arbitrary coordinate translations.
    Choose a field presentation $K = R \/ \( p \( t \) \)$ by a monic irreducible polynomial.
    Elementary generation over a field shows that the quotient map surjects onto $U \( K \)$.
    Pulling back its mean-zero regular representation preserves the Kazhdan bound.
    If $d = \| \| S$, the half-lazy walk has Dirichlet form
  $ chevron.l v \, \( 1 - M \) v chevron.r = frac(1, 4 d) sum_(s in S) lr(bar.v.double s v - v bar.v.double)^2
    gt.eq frac(kappa^2, 4 d) lr(bar.v.double  bar.v.double) v^2 $
  on mean-zero vectors, and nonnegative spectrum. On the product group,
    choose a factor uniformly and take this step there. The commuting tensor-factor operators give another uniform
    positive gap and nonnegative spectrum. A sufficiently large fixed power has mean-zero norm at most $1 \/ 64$.
    Keep all walk labels, including identities and coincident group elements, as a symmetric multiset;
    repeat labels if necessary to ensure $d_e gt.eq 8$. All matrices have fixed dimensions over polynomial-size
    fields, so enumeration and every stated computation are polynomial-time finite-array operations. ◻
]

Form a bipartite graph with both vertex sets $cal(H)$, and edges $cal(R) = \[ d_e \] times cal(H)$,
  where $\( i \, g \)$ joins left $g$ to right $u_i g$. Its cross-part normalized second singular norm is $lambda
  lt.eq 1 \/ 64$. Put $c_e = floor.l d_e \/ 4 floor.r$.

#thm([Lemma 8.2.])[
  (Systematic row extension).  #emph[There is a polynomial-size extension field $J \/
    bb(F)_q$ and two $c_e$-by-$d_e$ matrices $H_L \, H_R$ over $J$ whose every $c_e$-column minor is nonzero,
    such that the edge code
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_i \( H_L \)_(b i) U_(i \, g) & = 0 \,\
sum_i \( H_R \)_(b i) U_(i \, u_i^(- 1) x) & = 0 $ <ib:left-row>]

 has a unique linear extension $E$ from labels $i > 2 c_e$ to all labels.
   The same holds with symbols in any finite-dimensional $J$-space.
   Each local code has distance at least $c_e + 1$, and $E$ commutes with every right shift
   $\( R_h U \)_(i \, g) = U_(i \, g h)$.]
] <ib:row-extension>

#proof[
  Treat the $2 c_e d_e$ matrix entries as indeterminates. The square system matrix on parity labels $1 \,
    dots.h \, 2 c_e$ has nonzero determinant polynomial: specialize left row $b$ to select label $b$,
    and right row $b$ to select label $c_e + b$. This gives a permutation matrix,
    including when some generators coincide. Multiply this determinant by all maximal minors of both local
    matrices. Each factor is a nonzero polynomial; their product is nonzero and has total degree at most
  $ 2 c_e \| cal(H) \| + 2 c_e binom(d_e, c_e) . $
  Take the least extension $J \/ bb(F)_q$ of cardinality exceeding this bound. It has polynomial cardinality.
    A nonzero polynomial of smaller total degree than $\| \| J$ cannot vanish everywhere on $J^(2 c_e d_e)$.
    Exhaustive search over this constant number of entries, testing the determinant and minors,
    therefore finds a specialization in polynomial time. Inverting the parity matrix constructs $E$.
  Column independence proves local distance $c_e + 1$, also for vector symbols:
    a nonzero vector-valued local word supported on at most $c_e$ columns would contradict that independence after
    any nonzero coordinate projection. Right shifts permute left stars and right stars in (8.1)–(8.1) and preserve
    the systematic labels. Uniqueness proves $E R_h = R_h E$. ◻
]

Choose this field, these matrices, and their deterministic ordering from the common point and field parameters
  alone, independently of the number or identities of tracks. Every track uses this one encoder.
  On systematic rows prescribe, slotwise,

$ Y_(i \, g) \( I \) = f \( P' \( z' \) \) \, wide \( P' \, z' \) = g I \, $

and extend columnwise by $E$. Equivariance yields

#[#set math.equation(numbering: n => "(8.2)")
 $ Y_(i \, g h) \( I \) = Y_(i \, g) \( h I \) quad upright("for all rows, including parity rows.") $ <ib:covariance>]

Every parity-slot function is a degree-in-bound polynomial over $J$.
  At an ordered retained line store its actual restriction,
  using coefficients through degree $D$ and padding by zero.
  These coefficients obey the same row constraints and covariance.
  The commuting target maps act by the same column permutations on point tables, line tables,
  and their encoded parity rows. In particular, covariance gives $Y_(i \, g h) \( h^(- 1) I \) =
  Y_(i \, g) \( I \)$ for a point or an ordered line $I$. Thus changing the row and making the inverse change to
  the column preserves the requested symbol. This is the movement among columns that will accompany local row decoding.

=== 8.2 Binary blocks and smooth probes <ib:binary-blocks>

For each track there are point and line blocks, both denoted $Y$ with their type understood.
  A point position specifies a row edge, a retained point, one $bb(F)_q$-vector mask per slot axis,
  and an additive binary form $mu : J arrow.r bb(F)_2$. Its bit is $mu$ of the slot contraction.
  A line position additionally specifies masks $A \, B in bb(F)_q^ell$ for the coefficient index.
  If $Y \( t \)$ is already contracted on the original slots, the bit is

#[#set math.equation(numbering: n => "(8.3)")
 $ mu (sum_(j \, l = 0)^(ell - 1) A \[ j \] B \[ l \] \[ t^(j + ell l) \] Y \( t \)) . $ <ib:line-bit>]

This uses $D + 1 = ell^2$. Evaluation at a specified parameter uses the separable masks $\( t^j \)_j$ and
  $\( t^(ell l) \)_l$, with the usual convention $t^0 = 1$.

The short two-mask coefficient representation in (8.3) is adapted,
  through the inherited polynomial-size construction, from Amireddy–Behera–Srinivasan–Sudan–Willumsgaard
  #cite(label("ABSsw26")) Section 3.1, Definition 3.1 and Claim 3.2.
  This attribution concerns the coefficient encoding and its evaluation masks,
  not the correction and evolution machinery developed here.

Fix an $bb(F)_q$-linear map $pi : J arrow.r bb(F)_q$ restricting to the identity on $bb(F)_q$.
  For each compatible ordered pair of point-track types, include a product block $Z$.
  Compatibility means that one tag is zero or both positive tags agree.
  A type may be paired with itself, with two independent positions.
  An original $Z$ position consists of the two complete edge/point/slot-mask positions, $b_1 \, b_2 in J$,
  and a binary bilinear form $Q$ on the $bb(F)_2$-coordinates of $bb(F)_q$. For the two contracted symbols the bit is

#[#set math.equation(numbering: n => "(8.4)")
 $ Q #scale(x: 120%, y: 120%)[\(] pi \( b_1 Y_1 \) \, pi \( b_2 Y_2 \) #scale(x: 120%, y: 120%)[\)] .
   $ <ib:product-bit>]

There are no line-product blocks and no products of distinct positive tags.

Give every block equal weight. If its original length is $L_b$,
  repeat each original bit uniformly until every block has length $product_b L_b$.
  Every raw query chooses a uniform repetition copy. Let $b_(\#)$ be the block count,
  $m_(upright("in"))$ the total length, and $cal(W) \( v \)$ the canonical word for an extended label $v$.
  These lengths are polynomial in the inner size: there are constantly many blocks, $q^(O \( ell \))$ slot masks,
  fixed-dimensional matrix domains over $K$, polynomial-size $J$, and $2^(\( log_2 q \)^2)$ bilinear forms $Q$.
  Here $log q = O \( log log n' \)$, so the last quantity is also polynomial in $n'$.
  The product used for balancing has constantly many polynomial factors.
  Lengths are fixed within a padded template independently of the circuit coefficients.
  Positive-tag original indices and canonical formulas coincide with the corresponding one-port indices;
  repetition counts need not coincide.

We will repeatedly use the following explicit smoothing operation.
  For a specified additive argument $a$, choose uniform $r$ and write $a = r + \( a + r \)$.
  Multilinearity expands a requested value into a bounded XOR of terms, each uniform in that argument.
  Split different axes independently. This applies to slot masks, coefficient masks, bit forms, $Q$, and,
  when needed, the two multiplier axes. Each term has uniform marginals jointly across its independently split
  axes, conditional on the entire specified request. Pull back all public scalars and other linear maps before
  splitting. This remains true for zero coefficients; a zero term may instead be omitted and supplied as public zero.

To probe a target value at $y in K^u$, choose a uniform row group $g$, full-rank $A$, and $z$, set $P \( x \) =
  A x + y - A z$, and use the systematic position

#[#set math.equation(numbering: n => "(8.5)")
 $ \( i \, g \, g^(- 1) \( P \, z \) \) . $ <ib:systematic-probe>]

For uniform $y$, this is jointly uniform in row and retained point within its systematic label;
  every fiber has the same number of $\( A \, z \)$ choices.
  A density bound for $y$ therefore gives the same bound for this joint distribution.
  Independently chosen target arguments can use independent representations.
  An additive form on a target $bb(F)_q$-value extends to $J$, for example by composition with $pi$.
  These procedures are defined on every raw word and are smooth before any replacement or soundness claim.

=== 8.3 Dimension-independent replacement lemmas <ib:replacement-tools>

The tester’s soundness proof replaces arbitrary binary data by symbol tables and then by polynomial arrays.
  The two replacement lemmas below make the error cost independent of the number of field coordinates and slot entries.

We state precisely the low-degree input being used. The corrected Theorem 13 of
  Friedl–Sudan #cite(label("FS1995")) says that for every $eta > 0$ there is $C_eta < oo$ such that,
  if $\| bb(F) \| gt.eq C_eta D$, $D gt.eq 1$, and a function $f : bb(F)^m arrow.r
  bb(F)$ and degree-at-most-$D$ univariate claims $p_(x \, h)$ satisfy

$ e = Pr_(x \, h in bb(F)^m \, thin t in bb(F)) \[ p_(x \, h) \( t \) eq.not f \( x + t h \) \] lt.eq 1 / 8 - eta \, $

then a polynomial $p : bb(F)^m arrow.r bb(F)$ of total degree at most $D$ satisfies $"dist" \( f \, p \) lt.eq
  2 e$. The variables in this probability are independent and uniform, including the possible direction $h = 0$;
  the field-size constant does not depend on $m$. We use $eta = 1 \/ 16$.
  Neither a vector-valued conclusion nor a restriction on the line domain is part of this cited statement.

#thm([Lemma 8.3.])[
  (Vector and deleted-domain low-degree replacement).  #emph[Let $V$ be any finite-dimensional $bb(F)_q$-space.
    In the preceding field regime, line–point disagreement tending to zero for $V$-valued point functions and
    degree-in-bound line claims implies point distance tending to zero from a single $V$-valued polynomial of
    total degree at most $D$, uniformly in both dimensions. The conclusion remains true if the point and
    ordered-line domains omit fractions tending to zero, every retained line lies entirely in the retained point
    domain, and the point at a uniform parameter on a uniform retained line is uniform on retained points.
    In this case the mean fraction of line coefficient vectors differing from the polynomial’s restrictions also
    tends to zero.]
] <ib:vector-ld>

#proof[
  First use the full domains. For every $alpha in V^(*)$, scalar projection and the cited theorem give a
    polynomial $p_alpha$ with $"dist" \( alpha f \, p_alpha \) lt.eq 2 e$.
    Distinct scalar polynomials in this degree range differ at a fraction at least $1 - D \/ q$ of points.
    Consequently, when $6 e < 1 - D \/ q$, comparison with $\( alpha + beta \) f$ forces
  $ p_(alpha + beta) = p_alpha + p_beta \, wide p_(a alpha) = a p_alpha quad \( a in bb(F)_q \) . $
  The second identity uses at most $4 e$ disagreement; the assertions with a zero form or scalar follow in the
    same way. Coefficientwise finite-dimensional duality now gives one $V$-valued polynomial $p$ for which $alpha
    p = p_alpha$ for all $alpha$. A uniform $alpha$ detects each nonzero vector with probability $1 - 1 \/ q$, so
  $ \( 1 - 1 \/ q \) "dist" \( f \, p \) = bb(E)_alpha "dist" \( alpha f \, p_alpha \) lt.eq 2 e . $
  There is no factor depending on $dim V$.
  For deleted domains, extend the point function arbitrarily and give every added line any degree-in-bound claim,
    for example zero. The full incidence disagreement is at most the retained-line disagreement plus the
    omitted-line fraction. The full-domain conclusion therefore gives vanishing error also on retained points.
    On any retained line whose claim differs from the restriction of $p$,
    a nonzero scalar projection of their difference is a univariate polynomial of degree at most $D$.
    The two claims disagree at a fraction at least $1 - D \/ q$ of its parameters.
    Averaging the original test error and the point replacement error, using the asserted uniform point marginal,
    bounds the fraction of such lines by their sum divided by $1 - D \/ q$.
    This tends to zero and proves the coefficient claim. ◻
]

The addition-test argument below uses the majority self-correction method of Blum, Luby,
  and Rubinfeld #cite(label("BLR1993")) Generic Linear Self-Testing.
  We include it together with the field-homogeneity, multiple-axis,
  and slice-averaging extensions needed for our vector alphabets.

#thm([Lemma 8.4.])[
  (Axis replacement).  #emph[For elementary binary vector groups,
    the addition test has a dimension-independent high-agreement replacement by an additive map,
    also with a vector-group alphabet. For $bb(F)_q$-spaces of characteristic two,
    addition and scalar-homogeneity tests give replacement by an $bb(F)_q$-linear map.
    For any fixed number of axes, testing these identities in each axis at uniform other arguments gives
    replacement by a multilinear map as the failure probability tends to zero,
    uniformly in every domain and alphabet dimension. These conclusions also hold in mean over additional slice
    parameters.]
] <ib:axis-replacement>

#proof[
  Suppose first that $f : G arrow.r A$ fails addition with probability $e$, where both groups have exponent two.
    For fixed $x$ put $D_x \( y \) = f \( x + y \) + f \( y \)$.
    The addition identities on the pairs $\( x + y \, y + z \)$ and $\( y \, y + z \)$ imply $D_x \( y \) =
    D_x \( z \)$. Each pair is uniform when $y \, z$ are independent uniform elements,
    so the collision probability is at least $1 - 2 e$, for every $x$.
    The most frequent value $L \( x \)$ therefore has mass at least $1 - 2 e$. The identity
  $ D_(x + y) \( z \) = D_x \( y + z \) + D_y \( z \) $
  and three majority bounds imply $L \( x + y \) = L \( x \) + L \( y \)$ when $6 e < 1$:
    at least one $z$ realizes all three majority values. If $f \( x \) eq.not L \( x \)$,
    the conditional addition failure at $x$ is at least $1 - 2 e$. Thus $"dist" \( f \, L \) lt.eq e \/ \( 1 - 2 e \)$.
  For the field version, transfer the homogeneity test to $L$.
    The scalars $a$ satisfying $L \( a x \) = a L \( x \)$ identically form an additive subgroup of $bb(F)_q$.
    If it is proper, at least half the nonzero scalars fail; for each failing scalar its nonzero additive
    discrepancy is nonzero on at least half the inputs. The homogeneity test with uniform nonzero scalar would
    then have failure at least $1 \/ 4$. This contradicts failure tending to zero after a vanishing replacement
    cost. Hence $L$ is field-linear.
  Induct on the number $j$ of axes. Markov’s inequality, with a threshold tending slowly to zero,
    makes all but a vanishing fraction of first-axis slices good for the remaining $j - 1$ tests.
    Replace good slices by multilinear maps and the remaining slices by zero.
    This changes a vanishing fraction of values. Regard the resulting slices as a map into the vector space of
    multilinear maps on $j - 1$ axes. A nonzero such map is nonzero on at least $2^(- \( j - 1 \))$ of uniform
    inputs: successively contract each axis, using that a nonzero linear map has a kernel of relative size at most
    $1 \/ 2$. Thus vanishing first-axis test failure on values gives vanishing failure as equalities in this
    vector-space alphabet. The one-axis result finishes the induction.
    The same Markov cutoff over any additional parameters proves the mean version. ◻
]

=== 8.4 Testing the binary representation <ib:testing>

#thm([Proposition 8.5.])[
  (Smooth tester and distance).  #emph[For each fixed template,
    the canonical encodings of valid extended labels have constant relative distance.
    They admit a perfectly complete bounded-bit tester with the following uniform gap:
    for every fixed $a > 0$, there are $theta \( a \) > 0$ and a size cutoff such that rejection below
    $theta \( a \)$ implies distance less than $a$ from one canonical valid word.
    Each potential raw read on each fixed answer branch has bounded density relative to the balanced word,
    without conditioning on execution of that branch. Consequently rejection is at most a fixed constant times
    distance from a canonical valid word.]
] <ib:tester>

#proof[
  Take a positive fixed mixture of the test families described below, including each present block type.
    Their query counts are bounded, and all requested nonuniform masks are implemented by the splitting operation
    above. We prove the gap by a sequential replacement argument.
    Consider any sequence of increasing sizes and words whose rejection tends to zero,
    allowing the public circuits to vary in the fixed template.
    We show distance tending to zero from a canonical valid word.
    A bounded smooth test retains vanishing rejection after a vanishing-distance change,
    by the union bound over its potential reads; for a branching test use its entire bounded answer tree.
  #strong[Copies, symbols, and slot tensors.] Compare two independent random copies of a uniform original bit.
    If the fraction of ones among its copies is $p$, the test rejects with probability $2 p \( 1 - p \)$,
    which is at least $min \( p \, 1 - p \)$. Replacing all copies by their majority costs vanishing distance.
    In each point or line $Y$ block test additivity in $mu$. Lemma 59 and binary double duality replace the block,
    in mean over other indices, by Hadamard tables of genuine $J$-symbols.
    Next test addition and $bb(F)_q$-homogeneity in every slot-mask axis,
    including the two coefficient-mask axes for a line. Test symbol equality by uniform $mu$,
    which detects any inequality with probability $1 \/ 2$; pull field scalars onto this form before smoothing its
    raw accesses. The same replacement lemma makes all these symbols honest multilinear slot tensors at each edge
    and point or line, at vanishing mean cost. No global polynomial property has yet been asserted.
  #strong[Point and line polynomials.] At a uniform edge, retained ordered line, and parameter,
    compare the point symbol with line evaluation, using uniform original slot masks and a uniform bit comparison.
    Split the two specified evaluation masks in (8.3). A nonzero symbol discrepancy has a constant binary
    detection probability, so the line–point disagreement tends to zero in mean.
    For most edge and original-mask tuples apply Lemma 58, with $V = J$ as an $bb(F)_q$-space,
    to obtain a degree-at-most-$D$ rectangular polynomial. Use zero on the exceptional tuples.
    The lemma’s line-coefficient conclusion also replaces the line tables by the restrictions of these polynomials
    at vanishing cost.
  The selected polynomials need not yet be coherent between original mask tuples.
    Transfer the previous multilinearity identities to them using their mean point error.
    A false identity between degree-in-bound polynomials is nonzero on at least $1 - D \/ q -
    o \( 1 \)$ of retained points. Thus the identities fail with vanishing probability as equalities in the vector
    space of degree-in-bound polynomials. Apply Lemma 59 in that vector-space alphabet, in mean over edges,
    and use zero on exceptional edges. Changing a vanishing fraction of mask tuples changes a vanishing fraction
    of point and line bits. We now have genuine polynomial slot families at every row,
    and their exact line restrictions.
  #strong[Covariance and common systematic data.] Test (8.2) on point symbols with independent uniform $g \, h \,
    I$, uniform masks, and a bit form. Undo each row’s chart:
  $ F_(i \, g) \( I \) = Y_(i \, g) \( g^(- 1) I \) . $
  If two such polynomial slot tuples differ, the discrepancy is seen with constant probability,
    first on a retained point, then by successive nonzero mask contractions, then by the bit form.
    Since $g$ and $g h$ are independent uniform elements, for each fixed label and track the squared frequencies
    of the uncharted tuples sum to $1 - o \( 1 \)$. Their maximum frequency is therefore $1 - o \( 1 \)$.
    Replace other rows by this predominant tuple, charted back.
    This changes vanishing point and line distance and enforces covariance exactly, including on lines.
  Compare uncharted tuples of the finitely many systematic labels,
    using a shared uniform retained point and masks and independent row groups.
    The same constant gap forces an exactly common polynomial tuple $F$ on all systematic labels of a track.
    Test that its contracted values lie in $bb(F)_q$ by a random binary form on $J \/ bb(F)_q$,
    pulled back to $J$ and split. The quotient is an $bb(F)_q$-space.
    If a polynomial coefficient were outside $bb(F)_q$, its quotient would be a nonzero vector polynomial and
    would have a constant detection gap. Consequently every systematic coefficient is in $bb(F)_q$.
  #strong[Factoring through the target and enforcing parity.] Choose uniform $y in
    K^u$ and two conditionally independent generic representations as in (8.5).
    Compare their values, with independent row groups. Each individual marginal is smooth;
    this test is a linear comparison and makes no product query on the correlated pair.
    For a slot coefficient the uncharted identity tested is
  #[#set math.equation(numbering: n => "(8.6)")
   $ F \( A \, y - A z \, z \) = F \( A' \, y - A' z' \, z' \) . $ <ib:factor-target>]
  The difference has coordinate degree at most $2 D$, and the full-rank restrictions omit an $o \( 1 \)$ fraction.
    A failed polynomial identity therefore has constant detection probability,
    also after the bounded slot contractions. Hence (8.6) holds identically. Fix any full-rank $A'$ and any $z'$.
    Its right side defines a target polynomial $f \( y \)$ of degree at most $D$ with $bb(F)_q$ coefficients.
    Substitute $y = A z + b$ to obtain the exact factorization $F \( P \, z \) = f \( P \( z \) \)$.
  Test the left and right star equations at uniform stars and retained points,
    with slot masks and random $J$-bit forms; pull row coefficients onto these forms.
    In an exactly covariant family, a failed polynomial star relation fails on every right-shift translate of that
    star, with an invertible affine change of argument. Polynomial, mask,
    and bit detection thus give a constant rejection gap for any failure.
    All star identities hold once the rejection is sufficiently small.
    Lemma 57 now forces the exact parity extension of the systematic target data and its line restrictions.
  #strong[Product blocks.] In each present $Z$ block test additivity in $Q$ and replace at vanishing cost by exact
    $Q$-linear maps, in mean over all its other indices. Sample a uniform independent pair of edge/point/slot-mask
    indices and uniform multipliers. Test the product identity for $Q \( x \, x' \) =
    alpha \( x \) alpha' \( x' \)$, with independent uniform binary forms $alpha \, alpha'$ on $bb(F)_q$.
    On the $Z$ side split only $Q$, keeping these already uniform other indices fixed.
    On each $Y$ side pull the multiplier and $pi$ into the requested bit form and split that form.
    Compare with the Boolean product of the two resulting bits.
  The $Y$’s are already genuine symbols. The difference between a wrong $Q$-linear map and their true product is a
    nonzero binary matrix. A uniform outer-product form detects it with probability at least $1 \/ 4$,
    by two successive nonzero contractions. The fraction of wrong maps therefore tends to zero.
    Replace them by (8.4). This works separately for every compatible pair and never invokes a missing product block.
  #strong[Algebraic validity.] Finally run the algebraic validator of Lemma 55 on the recovered target
    polynomials, using systematic representations. Linear target probes need only their individual bounded-density
    marginal. For each product probe that lemma gives compatible tags and independent uniform full target
    arguments. Represent these independently in rectangular coordinates.
    The corresponding $Z$ query therefore has the required joint density.
    Identity multipliers on $bb(F)_q$-symbols and the demanded bilinear form implement the field-level product;
    split the necessary slot, form, and multiplier axes for its raw reads.
    The exact algebraic gap forces canonical extended validity.
    The native linear maps used by the validator, including coordinate packing,
    need not commute with the row action: they are used here only to specify systematic target arguments.
  All replacements have vanishing total binary cost, so the original word is at vanishing distance from a
    canonical valid word. If the stated fixed-gap conclusion failed,
    for each integer $j$ one could choose a size at least $j$ and a word of distance at least $a$ with rejection
    below $1 \/ j$, contradicting this sequence argument. Each constituent test is perfectly complete for every
    random choice in its support. All its raw marginals are smooth by the displayed representations and splitting;
    this also proves the claimed linear upper bound on rejection near a canonical word.
  For distance, different logical tapes differ in an order-one grid polynomial.
    Its difference is nonzero on a constant fraction of uniform target arguments,
    hence on a constant fraction of systematic row/point positions;
    a bit form detects the symbol difference with probability $1 \/ 2$.
    A concerned block has fixed positive weight. If the logical tape agrees,
    different valid extended labels differ in mode or in the progress marker,
    because legacy and mode fix the frame. These constant slot tensors likewise have a fixed nonzero-contraction
    gap. This gives a constant lower bound on relative distance. ◻
]

=== 8.5 Value-independent uncertainty supports <ib:uncertainty>

The correction argument uses uncertainty sets rather than the actual wrong symbols at intermediate stages.
  This permits separate consistent choices in each bounded dependency cone.

The alternating local decoding strategy is classical; see Zémor #cite(label("Zemor2001")) Section III-A,
  Lemma 5 and Theorem 6. The proofs below supply the vector-space, repeated-edge, value-independent-support,
  and finite-cone refinements needed here, rather than invoking that result verbatim.

For a $Y$ block, a column fixes a retained point or line and all slot masks, including line coefficient masks.
  At that column, varying the edge gives a row codeword of $J$-symbols in the reference encoding.
  The binary data for one such symbol form its Hadamard table, including all repetition copies;
  we call this its #emph[inner table]. The first lemma controls uncertainty in these row-code positions without
  examining the uncertain symbols’ values.

#thm([Lemma 8.6.])[
  (One-axis support contraction).  #emph[For the row code above, set
$ t_(*) = floor.l c_e \/ 2 floor.r + 1 \, wide theta.alt = t_(*) \/ d_e gt.eq 1 \/ 8 \, wide zeta_(*) = 1 \/ 256 . $

 Starting with an uncertain edge set of density $zeta lt.eq zeta_(*)$,
   a constant number of alternating local decoding half-rounds leaves an arbitrarily small fixed uncertain edge
   density. The resulting support depends only on the starting uncertainty set and contains every possible output
   error for every assignment equal to the reference codeword off that set.
   This holds for symbols in any finite-dimensional $J$-space.]
] <ib:one-axis-support>

#proof[
  At a star decode to the unique local codeword within $t_(*) - 1 = floor.l c_e \/ 2 floor.r$ errors,
    if it exists; otherwise output zero on that star. Distance $c_e + 1$ gives uniqueness.
    This decoder uses a bounded number of linear symbol operations and symbol-equality decisions:
    enumerate the information sets of size $d_e - c_e$, solve using the complementary invertible minor,
    and count agreements with each candidate. There are constantly many such choices.
  On a half-round mark a star bad if it meets at least $t_(*)$ currently uncertain edges,
    and declare all edges incident to bad stars possibly uncertain afterward.
    Every other star decodes correctly, regardless of the values on uncertain edges.
    The first bad-star fraction is at most $zeta \/ theta.alt lt.eq 8 zeta$.
    If $x$ and $y$ are consecutive bad-star fractions on opposite sides,
    the new bad stars receive at least a $theta.alt$ fraction of their incident edges from the preceding bad
    stars. Expander mixing with multiplicities gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ theta.alt y lt.eq x y + lambda sqrt(x y) . $ <ib:mixing-contraction>]
  When $x lt.eq theta.alt \/ 2$, either $y = 0$, or division and squaring imply
  $ y lt.eq \( 2 lambda \/ theta.alt \)^2 x lt.eq x \/ 16 . $
  Since $8 zeta_(*) lt.eq theta.alt \/ 2$, induction applies at every subsequent half-round.
    The current edge-support fraction equals the latest bad-star fraction.
    A constant number of half-rounds therefore gives any prescribed fixed residual density.
    Every support operation used only sets of uncertain positions, proving the value-independent assertion. ◻
]

For a $Z$ block, a column fixes both retained points, their slot masks, and $Q$.
  Its row position is a joint pair of edges, and its inner table consists of the multiplier pairs and repetition
  copies. The reference multiplier tables obey row constraints along each edge axis,
  but the two axes use different scalar actions. We verify these actions before applying a two-axis contraction.

For $Z$, the relevant symbol alphabet is the additive group $cal(B)_(upright("mul"))$ of all binary bilinear
  functions $F : J times J arrow.r bb(F)_2$. It carries two commuting $J$-space structures

#[#set math.equation(numbering: n => "(8.8)")
 $ \( a dot.op_1 F \) \( b_1 \, b_2 \) = F \( a b_1 \, b_2 \) \, wide \( a dot.op_2 F \) \( b_1 \, b_2 \) =
   F \( b_1 \, a b_2 \) . $ <ib:two-actions>]

Additivity in each argument and the field laws verify the vector space axioms and commutation.
  Distinct such functions differ on at least $1 \/ 4$ of uniform multiplier pairs.
  Fixing the two outer points, the original slot masks, and $Q$ makes the true multiplier tables across edge pairs
  a two-axis codeword. For example the first-axis relation with coefficients $a_j$ is

$ sum_j Q #scale(x: 120%, y: 120%)[\(] pi \( b_1 a_j Y_(1 \, j) \) \,
  pi \( b_2 Y_2 \) #scale(x: 120%, y: 120%)[\)] = Q #scale(x: 120%, y: 120%)[\(]
  pi \( b_1 sum_j a_j Y_(1 \, j) \) \, pi \( b_2 Y_2 \) #scale(x: 120%, y: 120%)[\)] = 0 . $

The second-axis relation is identical with the roles exchanged.
  The next lemma permits precisely these two possibly different space structures.

#thm([Lemma 8.7.])[
  (Two-axis support contraction and cone consistency).  #emph[Consider an array on two edge axes whose reference
    obeys the row code in each slice, with possibly different $J$-space structures on the same additive symbol
    group for the two axes. Put $zeta_(* *) = zeta_(*)^2 \/ 4$.
    From initial uncertainty density at most $zeta_(* *)$, a constant number of first-axis half-rounds followed by
    a constant number of second-axis half-rounds leaves any prescribed fixed residual density.
    The uncertainty support is value-independent. For one output position,
    the same guarantee holds when arbitrary values are chosen on initially uncertain positions specifically for
    its finite dependency cone, provided each repeated initial position receives one consistent value inside that cone.]
] <ib:two-axis-support>

#proof[
  First-axis slices with uncertainty density greater than $zeta_(*)$ occupy at most a $zeta_(*) \/ 4$ fraction.
    Keep these whole stripes uncertain. On all other slices use Lemma 61 to make residual density at most
    $delta_1$. In all but $2 delta_1 \/ zeta_(*)$ of the second-axis slices,
    the additional residual outside these stripes has density at most $zeta_(*) \/ 2$.
    Such a slice starts with uncertainty at most $3 zeta_(*) \/ 4 < zeta_(*)$.
    Contract it to $delta_2$, leaving all other second-axis slices uncertain. The final density is at most
  $ 2 delta_1 \/ zeta_(*) + delta_2 \, $
  which is arbitrarily small. Intermediate arrays need not satisfy both slice constraints:
    each phase is compared to the fixed reference and uses its appropriate space structure only.
  A fixed number of rounds and constant degree give a finite dependency cone.
    Extend any consistent assignment in that cone arbitrarily to the other uncertain initial positions,
    retaining the reference elsewhere. The global support statement applies to this extension and determines the
    same output. Separate cones may use different values on their uncertain inputs;
    no common assignment between cones is needed. ◻
]

=== 8.6 Bit simulation of a finite decoding cone <ib:cone-simulation>

#thm([Lemma 8.8.])[
  (Inner-table flags and arbitrary-form prediction).  #emph[There are constants $0 < nu_1 < nu_2 < 1 \/ 64$,
    independent of the number of row rounds, with the following properties.
    For a table of bits, including its actual repetition copies,
    one can distinguish distance at most $nu_1$ from a legal inner table from distance greater than $nu_2$ from
    every legal inner table, with any prescribed fixed reliability and bounded smooth queries.
    The legal inner tables are either Hadamard tables of $J$-symbols or binary bilinear functions on $J times J$.
    Inside radius $nu_2$ the legal symbol is unique, and any specified bit of it can be predicted with arbitrarily
    high fixed reliability by bounded queries with uniform inner-index and copy marginals.
    The specified form or multiplier pair may be any function of previously exposed data;
    the assertion holds conditional on those data, using fresh randomness.]
] <ib:inner-table-prediction>

#proof[
  Random-copy agreement and binary addition, or the two-axis binary tests, are perfectly complete.
    Lemma 59, together with the majority replacement of copies,
    gives a dimension- and copy-count-independent positive rejection lower bound $gamma_2$ at distance greater
    than a fixed $nu_2$ from every legal inner table. If this failed,
    a sequence of such tables with rejection tending to zero would contradict that lemma.
    Near a legal table, smoothness bounds rejection by $C_2$ times distance, with an absolute $C_2$.
    Choose $nu_1 < min \( nu_2 \, gamma_2 \/ \( 4 C_2 \) \)$.
    Estimating rejection from independent trials and comparing with $gamma_2 \/
    2$ distinguishes the two promised cases with any fixed reliability;
    Chebyshev’s inequality suffices to choose a bounded sample count.
    The intermediate annulus may be assigned either flag.
  Distinct Hadamard tables differ on half their forms. Distinct bilinear functions differ on at least a quarter of
    multiplier pairs. Repetition preserves these distances, proving uniqueness within $nu_2$.
    For a specified Hadamard form $mu$, choose uniform $alpha$, query random copies at $alpha$ and $mu + alpha$,
    and XOR. Each query is uniform in its inner index, so one trial errs with probability at most $2 nu_2$.
    For a bilinear table at specified $\( b_1 \, b_2 \)$, choose independent uniform $r_1 \, r_2$ and use
  $ F \( b_1 \, b_2 \) =  & F \( r_1 \, r_2 \) + F \( b_1 + r_1 \, r_2 \)\
 & + F \( r_1 \, b_2 + r_2 \) + F \( b_1 + r_1 \, b_2 + r_2 \) . $
  Each pair is jointly uniform, with a fresh random copy, and the error probability is at most $4 nu_2 < 1 \/ 16$.
    Independent repetition and majority give any desired fixed error.
    These bounds hold for every specified bit, so remain valid after conditioning on all prior data if the splits
    and copies are fresh. ◻
]

#thm([Lemma 8.9.])[
  (Consistent bit simulation).  #emph[Fix a finite cone of one- or two-axis row decoding,
    a reference satisfying the corresponding row constraints, and a requested bit of the output symbol.
    For analysis, declare an initial position uncertain when its received inner table is more than $nu_1$ from its
    reference table, and propagate this set by the support rules above.
    With bounded bit queries the requested bit can be simulated to any fixed error probability $sigma > 0$,
    on a consistent assignment of initially uncertain symbols that agrees with the reference at every initial
    table within $nu_1$ of its true inner table. If the output position lies outside the value-independent
    support, the predicted bit equals its reference bit except with probability $sigma$.
    All hidden operations are bit equalities and requested bits;
    field coefficients and address computations are public. The routine is bounded and defined on arbitrary words.]
] <ib:bit-simulation>

#proof[
  List the cone’s initial positions and deduplicate repeated positions within that cone.
    Flag each distinct table once by Lemma 63, calling the far outcome flagged,
    and assign flagged positions the zero symbol. At an unflagged table within $nu_2$ of a legal table,
    assign its unique nearby symbol. Choose the flag reliability so that,
    except with a prescribed small probability, every table within $nu_1$ of its true symbol is unflagged and no
    table farther than $nu_2$ from all legal symbols is unflagged.
    On this event the assignment is well-defined and consistent inside the cone.
    Certain inputs receive their true symbols: a competing symbol within $nu_2$ would contradict inner distance.
    The remaining assignments, including arbitrary choices in the gap annulus, are permitted by Lemmas 61 and 62.
  There is no need to recover the assigned symbols in full.
    Unfold the finite symbol-level decision tree for information-set decoding, agreement counts,
    and fallback-zero outcomes. On each fixed branch every candidate, comparison,
    and output is a linear expression in the assigned initial symbols.
    For two axes these expressions are sums of compositions of the two scalar actions (8.8).
    Their coefficients are obtained publicly from the fixed local matrices and the finite branch choices.
  A false symbol equality is detected by a fresh uniform Hadamard form with probability $1 \/ 2$,
    or by a fresh uniform multiplier pair with probability at least $1 \/ 4$.
    Each resulting bit of a linear expression reduces, by additivity and scalar pullback,
    to a bounded number of specified bits of the initial assigned tables.
    Use Lemma 63 on unflagged inputs and public zero on flagged inputs.
    Independent equality trials make the chance of missing a false equality arbitrarily small;
    an exact equality fails only if one of its input-bit predictions fails.
    The requested final output bit is handled in the same manner.
  The order of choices prevents circular error bookkeeping.
    First fix the row rounds and the complete finite symbol-level tree.
    Next choose flag and equality-detection budgets for its bounded number of possible decisions.
    This fixes the number of initial-bit predictions needed in each tested expression.
    Then choose their smaller error budgets and their repetitions.
    Given successful flags, every later specified bit has the uniform worst-request guarantee of the previous
    lemma conditional on prior answers, using fresh splits after all scalar pullbacks.
    A union bound, or conditioning successively on the preceding correct symbol-level decisions,
    bounds total simulation error by $sigma$. We do not choose the same budgets by union-bounding over the later
    amplified bit tree. After all choices that full tree is nevertheless finite and bounded.
    When a promise fails, the same finite comparisons and fallback-zero rules still define an output;
    only correctness is relinquished. ◻
]

=== 8.7 Arbitrarily accurate average correction <ib:average-correction-section>

For a point $Y$ request its #emph[outer index] means its row edge together with its retained point;
  for a line $Y$ request it means its edge and retained ordered line.
  For $Z$ it means the #emph[joint pair] of edge/point indices.
  A request law has density at most $C_(upright("req"))$ within its block when its outer index probability is at
  most $C_(upright("req"))$ times the corresponding uniform probability.
  Every other requested mask, form, or multiplier may be an arbitrary public function of the request.

Call a binary word #emph[structurally canonical] if it is obtained from the canonical recipes of Lemma 55 at a
  specified frame, mode, progress, and arbitrary Boolean tape, followed by the point, line, row-extension,
  product, and repetition constructions above. The tape need not satisfy the final validity conditions.
  Such a word nevertheless satisfies the row-code, covariance,
  and multilinear mask identities and has exactly the prescribed product tables.

#thm([Proposition 8.10.])[
  (Average correction from one fixed radius).  #emph[For every fixed template there is $rho >
    0$ such that the following holds for all sufficiently large sizes.
    Let a received balanced word $w$ satisfy $"dist" \( w \, cal(W) \) lt.eq rho$,
    where $cal(W)$ is structurally canonical; validity of its label is not needed here.
    For every fixed $C_(upright("req")) < oo$ and $eta > 0$, a bounded-bit algorithm predicts requests with outer
    density at most $C_(upright("req"))$ with average error at most $eta$.
    It has smooth potential raw reads on every fixed hypothetical answer branch.
    The radius is independent of $C_(upright("req"))$, $eta$, the row-round count,
    and the subsequent amplification count.]
] <ib:average-correction>

#proof[
  Use the constants $nu_1 \, nu_2$ already chosen, and put $zeta = min \( zeta_(*) \, zeta_(* *) \)$.
    Use the column and inner-table descriptions in Section 8.5: rows are edges for $Y$ and edge pairs for $Z$.
    Call an initial row position uncertain if its received inner table is more than $nu_1$ from its reference table.
  Each block has error fraction at most $b_(\#) rho$. If $u_(upright("unc"))$ is the uncertain edge fraction in a
    uniform column, or pair fraction for $Z$, then
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E) u_(upright("unc")) lt.eq frac(b_(\#) rho, nu_1) . $ <ib:uncertain-average>]
  Call columns with $u_(upright("unc")) > zeta$ bad. Their fraction is at most $b_(\#) rho \/ \( nu_1 zeta \)$.
    On every other column, choose enough rounds in the support lemmas to leave uncertainty fraction at most
    $delta' > 0$, whose value will be fixed later. No residual-support claim is made on bad columns.
  For a $Y$ request, independently split all its slot masks, including the line coefficient masks, and expand.
    Keep its specified Hadamard form as the inner bit request.
    For each expanded term choose independent uniform $h in cal(H)$ and replace the row/outer pair by
  #[#set math.equation(numbering: n => "(8.10)")
   $ \( i \, g \, I \) mapsto \( i \, g h \, h^(- 1) I \) . $ <ib:random-shift>]
  Covariance preserves the true value. For a $Z$ request split both slot-mask lists and $Q$, expand,
    and shift its two row/outer indices independently by (8.10).
    Keep the specified multipliers as its inner bit request. Let $T_0$ be a fixed common upper bound on the
    expansion count, determined by the template, before any accuracy choices.
  For each fixed original request, every term has a uniform column:
    the relevant $cal(H)$-action is transitive and all its column-mask axes have been independently randomized.
    In $Z$ the two independent shifts give the uniform pair of outer points. Choose the radius once and for all so that
  #[#set math.equation(numbering: n => "(8.11)")
   $ frac(T_0 b_(\#) rho, nu_1 zeta) lt.eq 1 / 64 . $ <ib:fixed-radius>]
  Then, for every individual request, the chance that any term uses a bad column is at most $1 \/ 64$.
    This conclusion does not assume that the shifted row is independent of the shifted outer point.
  For every fixed shift, (8.10) is a permutation of the complete row/outer index;
    the independent pair of shifts is a permutation of the complete $Z$ index.
    Thus averaging over an outer-density-$C_(upright("req"))$ request law preserves that density bound.
    Expanded column masks are uniform conditional on the indices.
    The mean chance of hitting the good-column residual support in any of the terms is consequently at most $T_0
    C_(upright("req")) delta'$. By Markov’s inequality, outside an exceptional fraction at most $8 T_0
    C_(upright("req")) delta'$ of original requests, the conditional sum of those residual-hit probabilities is at
    most $1 \/ 8$.
  Bit-simulate every term’s row cone by Lemma 64, with total simulation error at most $1 \/ 64$.
    On any nonexceptional request, the full randomized XOR trial therefore errs with probability at most
  $ 1 / 64 + 1 / 8 + 1 / 64 = 5 / 32 < 1 / 4 . $
  Cone-specific assignments are sufficient because the support bounds cover every consistent assignment in each
    cone. Choose $delta'$ so that $8 T_0 C_(upright("req")) delta' lt.eq eta \/ 2$.
    This determines a constant row-round count. Repeat the entire trial independently at the fixed request,
    including shifts, flags, and all predictions, and take majority.
    A bounded number of repetitions makes its error at each nonexceptional request at most $eta \/ 2$.
    Adding the exceptional fraction proves average error at most $eta$ from the fixed radius (8.11).
    This proves an average guarantee, and makes no assertion of arbitrarily accurate correction at every
    prescribed outer index. Smoothness is proved in the next lemma. ◻
]

#thm([Lemma 8.11.])[
  (All hypothetical read slots are smooth).  #emph[For the tester, the corrector of Proposition 65,
    and the finite linear compositions used below, use their stated bounded outer-index request laws,
    with joint pair density for $Z$. Freeze any hypothetical sequence of hidden answer bits.
    Under the original, unconditioned public random tape and request law,
    the raw-read subdistribution of every potential slot has bounded density relative to its balanced input block.
    After all accuracy counts have been fixed, the sum of these bounds over the complete finite answer tree is a
    constant independent of the size. Defaults, wrong flags, and wrong equality answers satisfy the same
    assertion. Public numerical thresholds that only select among these fixed schedules do not change the bound.]
] <ib:all-branch-density>

#proof[
  First enumerate every potential initial row-cone #emph[path slot], including all candidate uses,
    before deduplication. A term’s initial covariance shift is the joint permutation (8.10).
    A fixed row-star path subsequently changes the edge label among finitely many possibilities and multiplies $g$
    on the left by a fixed group element. A right-star move from label $i$ to $j$, for example,
    uses $g mapsto u_j^(- 1) u_i g$. Each such map is a permutation within a fixed edge-label class,
    so costs only a fixed label factor in a density bound. In a two-axis cone the same reasoning applies
    separately to each axis and preserves the joint pair bound.
    Consequently each enumerated path slot has a fixed density bound.
  Deduplication, representative selection, and omission of unused terms only decide whether an already enumerated
    slot is read. Its resulting unconditioned subdistribution is dominated by the original slot distribution.
    We never condition and renormalize on the event that this slot was chosen as a representative or that its flag
    had a specified outcome. Summing the bounds of all potential slots, including unexecuted ones,
    bounds their complete occurrence count. A flagged, failed,
    or unused zero value is public zero and requires no placeholder query at a special address.
  On a frozen symbolic branch, all information-set interpolation matrices depend only on $H_L \,
    H_R$ and public graph indices. The relevant inverses exist by their maximal-minor property.
    The coefficients of all selected linear expressions, including the compositions of (8.8),
    can therefore be computed publicly. Hidden work is only the bounded equality and output-bit calls described in
    Lemma 64. Their specified forms and multiplier pairs may depend on every frozen answer, public coefficient,
    and preceding random choice. Fresh splits #emph[after] these pullbacks give uniform raw inner forms or jointly
    uniform multiplier pairs conditional on all that information.
    Zero coefficients can be split as well, or omitted. Fresh uniform copies give the required copy marginal.
    Wrong answers change the selected expression, but introduce no new type of row-cone path.
  The tester’s schedules were explicitly smooth before replacements.
    The neighbor compositions below use finite lists of commuting affine column permutations and changes between
    fixed block types, so the same argument adds only fixed type factors.
    Dropping a public operand takes a marginal of a joint law, which also preserves a density bound.
    Finally freeze all simulation and amplification counts, unfold the full raw bit tree,
    and sum these finitely many bounds. This tree may be large, but is constant at the chosen accuracy.
    A later threshold offset that selects its branches changes neither its slot count nor these public address
    maps. The assertion concerns the unconditioned schedules for all branches,
    not correctness on unsuccessful branches. ◻
]

The request statement also applies to a subdistribution within a type:
  pad its missing mass by the uniform law, which increases a density bound by at most 1,
  and charge the original subdistribution by the resulting error bound.
  A bounded list of type or branch choices is handled by adding their bounds and error budgets.
  This does not normalize on a rare branch. Likewise, if a mixed product has a public operand,
  a joint density $p \( x \, y \) lt.eq C \/ \( \| \| X \| \| Y \)$ implies

#[#set math.equation(numbering: n => "(8.12)")
 $ sum_y p \( x \, y \) lt.eq C \/ \| \| X . $ <ib:public-marginal>]

The surviving $x$ is the complete edge/point index, not only its point.
  The requested form $u mapsto Q \( pi \( b_1 u \) \, pi \( b_2 v_(upright("public")) \( y \) \) \)$ may depend on
  the discarded index; it does not select a new surviving index.
  One may forget an actual repetition-copy index and choose a fresh uniform copy in the corresponding one-port
  block. This changes only the fixed block-weight factor, not the original-index bound.

All public supports used here have polynomial cardinality for fixed accuracy.
  Groups, retained points and lines, representation fibers, fields, masks, forms,
  and copy sets are polynomial-listable; only a constant number of independent draws is used.
  Their sampling laws are rational. Public indices, coefficient operations,
  and the bounded Boolean answer tables can be enumerated in polynomial time.
  Neither a hidden field symbol nor a hidden array is processed as one unit-cost query.

=== 8.8 Neighbor bits and global port recovery <ib:neighbors-recovery>

#thm([Proposition 8.12.])[
  (Local flags and encoded neighbors).  #emph[Within a sufficiently small fixed radius of a valid canonical word,
    one can decide its incident-edge flags with arbitrarily high fixed reliability,
    and supply its own bits and those of every existing neighbor with arbitrarily small average error for
    bounded-density requests. The number of bit probes is bounded at each accuracy.
    The complete hypothetical answer tree, including wrong decisions and missing-edge defaults, satisfies Lemma 66.]
] <ib:neighbors>

#proof[
  Reduce $rho$ if needed to lie below half the distance of Proposition 60; a nearby valid label is then unique.
    Use average correction at uniform systematic edge/point positions to read the mode and the needed critical-bit
    projections of Lemma 55. At full progress the all-ones contraction of the relevant singleton stack is a
    constant polynomial equal to its critical Boolean read. Use a specified additive form taking 1 to 1;
    its actual raw queries are smoothed by the corrector. Such uniform systematic requests have bounded outer
    density even though the logical read itself has a sparse public address.
  Compare the progress marker with its public empty and full tensors by uniform separable masks and bit forms at
    systematic points. On the true constant tensors a false equality has a fixed gap by successive nonzero
    contractions. Corrected probes and sufficiently many repetitions distinguish these cases with arbitrary fixed
    reliability. Together with mode and the full-progress critical bits, including the wrap predicate,
    these are exactly the finite decisions required by the path transition rules.
    Explicitly, a pre successor increases progress unless full;
    at full it performs the enabled edit or has a missing wrap edge.
    A post successor decreases progress unless empty; at empty it advances the frame.
    For predecessors, full post reverses the edit or has the missing wrap edge, other post reverses a decrease,
    positive-progress pre reverses an increase, and empty pre reverses a frame advance.
    An increase also distinguishes empty progress for initialization.
    There is no scan of the full progress index and no proposed-tape validity test.
  Fix the true Boolean transition branch of an existing edge.
    The algebraic interface expresses every updated contraction as a bounded sum of public terms and public scalar
    multiples of old contractions at invertible $K$-affine pullbacks of the common target.
    Slot pulls and scalars are independent of the target point and row.
    The pullbacks commute with the rectangular action, so they commute through the common row encoder as column
    permutations. Public initialization terms have publicly computable actual parity values.
    Thus each requested point $Y$ bit is an XOR of boundedly many input $Y$ requests with specified masks and
    forms at bounded-density indices. For line $Y$, the affine map preserves the line parameter,
    so the identical argument applies to the separable coefficient contractions (8.3).
    The derivative update uses the separately stored child and its summed new-axis stack;
    it does not recompute native packing, polynomial division,
    or coefficient extraction from a requested line or parity symbol.
  For a $Z$ bit insert the two $Y$ update sums into (8.4) and expand by bilinearity.
    Two variable terms give an available input $Z$ block by tag compatibility;
    absorb public coefficients into multipliers or masks. The two row/point coordinates undergo separate affine
    column permutations, with their rows fixed. This preserves their joint density even when the two input types
    coincide: their two positions are still distinct coordinates of the product domain,
    never identified into a diagonal. A term with one public operand is an arbitrary specified binary linear form
    of the other $J$-symbol, and (8.12) gives the necessary complete surviving row/point bound.
    Here the public operand is its actual encoded $J$-symbol, including parity values,
    not an unencoded target value. Two public operands give a public bit.
  Apply Proposition 65 to every needed term with a suitably smaller accuracy.
    Each output type and fixed branch has a bounded list of transformations, including radix pulls and zero terms.
    Charge their error and density bounds by their sum before selecting a term or branch.
    Charge the finite decision errors separately, and analyze each relevant correct branch with its true decisions
    fixed before intersecting the good events. Wrong decisions still select from the same public lists;
    missing or unused values are public zero. Therefore the all-hypothetical-branch smoothness assertion follows
    from Lemma 66. ◻
]

#thm([Proposition 8.13.])[
  (Deterministic global read-port recovery).  #emph[At a sufficiently small fixed balanced distance from a
    canonical word, every order-one logical read port can be recovered exactly in deterministic polynomial time.
    In particular this applies to the one-port template. No constant-query claim is made for this global decoder.]
] <ib:global-recovery>

#proof[
  At every systematic edge/point position in the port’s order-one point block,
    read the entire Hadamard table including copies and choose a nearest $J$-symbol, breaking ties publicly.
    Whenever the table error is less than $1 \/ 4$, the selected symbol is true.
    Markov’s inequality bounds the fraction of incorrect systematic symbols by a fixed multiple of balanced word
    error, accounting for the block weight and the systematic row fraction.
  Map these symbols to their represented target arguments using the known row action. All fibers have equal size:
    for a fixed target $y$, any full-rank $A$ and any $z$ determine the unique offset $y - A z$,
    and the number of choices is the same for every row group. Take a plurality in each fiber.
    Every wrong plurality requires at least half its fiber’s symbols to be wrong,
    so this loses at most a factor two. Project outputs outside the subfield to any fixed $bb(F)_q$-estimate,
    which cannot spoil a correct symbol, and take another plurality over ignored target coordinates.
    After reducing the fixed radius, we have an estimate $hat(f) : bb(F)_q^ell arrow.r
    bb(F)_q$ of the native order-one polynomial with symbol error at most a sufficiently small fixed $alpha > 0$.
  For each desired grid point $x$, enumerate all directions $z in bb(F)_q^ell$.
    Along the $q$-word $\( hat(f) \( x + t z \) \)_(t in bb(F)_q)$,
    the expected number of errors over $z$ is at most $1 + \( q - 1 \) alpha$:
    every nonzero $t$ makes $x + t z$ uniform. Let
  $ t_(upright("RS")) = ⌊frac(q - D - 1, 2)⌋ . $
  For sufficiently small fixed $alpha$ and large size, Markov’s inequality shows that a strict majority of
    directions have at most $t_(upright("RS"))$ errors, since $D \/ q arrow.r 0$.
  Use the Berlekamp–Welch reconstruction method in the linear-system presentation of Gemmell and
    Sudan #cite(label("GemmellSudan1992")) Appendix A. Specifically,
    uniquely decode each line by solving the linear equations
  $ N \( t \) = E \( t \) hat(f) \( x + t z \) quad \( t in bb(F)_q \) \, wide
    E upright(" monic of degree ") t_(upright("RS")) \, quad deg N lt.eq D + t_(upright("RS")) . $
  On a good direction, the error locator, padded by any monic factor to degree $t_(upright("RS"))$,
    provides a solution with $N = E f_(upright("line"))$. Every solution has this equality:
    the difference $N - E f_(upright("line"))$ has degree at most $D +
    t_(upright("RS"))$ and vanishes at at least $q - t_(upright("RS")) > D + t_(upright("RS"))$ correct positions.
    Divide, verify degree and agreement, and use public zero on a failure.
    The strict majority of returned values at parameter zero is exactly $f \( x \)$.
    Repeat for all port grid indices. All domains, tables, directions, fields,
    and linear systems here are polynomial-size, so the complete algorithm is deterministic polynomial time. ◻
]

=== 8.9 The binary interface <the-binary-interface>

#thm([Lemma 8.14.])[
  (Inner binary interface).  #emph[For the inner algebraic families of Lemma 55,
    there is a deterministic polynomial-time binary encoding with the following properties,
    uniform over the circuits in each fixed padded template.]
  + #emph[Its balanced blocks are the point and line $Y$’s and the compatible point-product $Z$’s above.
    Canonical valid extended labels have constant distance, and admit the perfectly complete bounded-bit tester
    and fixed-gap proximity conclusion of Proposition 60.]
  + #emph[One radius $rho > 0$, fixed by the template before any request accuracy or density,
    permits every fixed average error $eta > 0$ for requests of any fixed bounded outer-index density.
    For $Z$, the requirement is a joint pair-density bound. Other masks, multipliers,
    and forms may be arbitrary request-dependent ones. Finite type subdistributions are charged without
    renormalization. Mixed products with a public operand may be reduced to arbitrary linear forms using (8.12).]
  + #emph[In a small fixed neighborhood of a valid label, incident flags and current or existing-neighbor encoded
    bits have the bounded-query reliability and averaged accuracy in Proposition 67.
    Every routine is total with bounded decisions and public-zero defaults.]
  + #emph[After all fixed accuracy counts are chosen, all hypothetical raw read slots in the full answer tree have
    a finite summed density bound as in Lemma 66. This includes potential cone paths before deduplication,
    unsuccessful flags and comparisons, and arbitrary pulled-back forms.
    All coefficient and address computations are public, all remaining hidden processing uses boundedly many bits,
    and all random supports and rational sampling tables are polynomial-time constructible.]
  + #emph[The common row encoder, field presentations, positive-tag original layouts,
    and fixed-label formulas are identical in corresponding actual and one-port families.
    Repetition copies may differ and are sampled afresh in the receiving family.
    At a fixed distinguished source or its first successor, a positive $Y$ bit has Boolean degree at most three in
    that port’s read input, and a same-positive-tag $Z$ bit has degree at most six.
    An order-one port has the deterministic polynomial global recovery of Proposition 68.]
  #emph[In particular, the radius for the one-port template can be fixed before a later actual port-count bound is
    chosen. The actual template’s own radius may depend on that bound through its number of blocks.]
] <lem:inner-binary-interface>

#proof[
  The construction and the preceding propositions prove (i)–(iv) and global recovery.
    For (v), field and row-code choices were made solely from the common point parameters.
    The positive charts, including per-primary verification auxiliaries and their tagged descendants,
    have the literal common-index ancestry of Lemma 55. Columnwise linear extension and fixed-parameter line
    restriction preserve that identity. Passing through an original index and choosing a fresh copy therefore
    suffices even when balanced multiplicities differ.
  At either of the two specified fixed labels, legacy, work, frame, mode, and progress are public,
    and every positive persistent recipe has Boolean degree at most three in its port input.
    Public matrix operations, division by fixed monic polynomials, coefficient extraction, slot contraction,
    fixed affine substitutions, line restriction, $J$-linear row extension, coordinate changes,
    and additive bit forms are all $bb(F)_2$-linear in these hidden-data functions. None raises that degree.
    The one additional binary bilinear operation in (8.4) gives degree at most six.
    Finally (8.11) uses only the template’s $T_0 \, b_(\#) \, nu_1 \, zeta$;
    the later requested density and accuracy affect only row rounds and repetitions.
    Applying it first to the fixed one-port template proves the last assertion. ◻
]

== 9 The fixed port and its robust decision gadget <sec:inner-gadget>

We now prove Theorem 27. Throughout this section all fields, groups, block lengths,
  and path labels are those of the inner construction of Sections 7 and 8.
  In particular, its polynomial-size affine group is unrelated to the outer index group.
  We first construct the port independently of the eventual arity.
  We then fix an actual arity and construct a generalized subcircuit for one Boolean decision.
  The subcircuit will use the geometric procedures of Lemma 80, whose proof is independent of this section.
  Word distances in this section are relative Hamming distances;
  vector distances use the displayed normalized block norm.

=== 9.1 A port fixed before the arity <a-port-fixed-before-the-arity>

Fix the exponent allowance $c_(upright("allow"))$ and the common field, point, slot,
  and row-code parameters supplied by Lemmas 55 and 69. In particular these parameters are chosen from
  $n' = \( L + 2 \)^(c_0)$, with fixed $c_0 > c_(upright("allow")) + 5$,
  before specifying the number of input ports or the actual Boolean circuit.
  Construct the one-port instance of the inner path with the prescribed initial copy phase and, afterwards,
  a fixed trivial computation. Include all its positive-tag validity, critical-address, derivative,
  and verification-auxiliary families, as well as its tag-zero families. This is the #emph[dummy template].
  Write $a_s$ for its distinguished source and $a_s^(+)$ for its immediate successor.
  Their common tape has blank work, stage-zero legacy, input $s$, frame $gamma^(- 1)$, and post mode.
  Their progress values are respectively $q - 1$ and $q - 2$. Define

#[#set math.equation(numbering: n => "(9.1)")
 $ cal(D) \( s \) = #scale(x: 120%, y: 120%)[\(] cal(W)_(upright("dum")) \( a_s \) \,
   cal(W)_(upright("dum")) \( a_s^(+) \) #scale(x: 120%, y: 120%)[\)] \, wide S_0 =
   2 m_(upright("dum")) . $ <ig:port-definition>]

Both halves use the entire balanced binary word of the same dummy template.

#thm([Proposition 9.1.])[
  (Fixed dummy port).  #emph[The map in (9.1) has polynomial length,
    constant relative Hamming distance $d_(cal(D)) > 0$, and the following properties.]
  + #emph[Every output bit is a multilinear polynomial in $s$ over $bb(F)_2$ of degree at most six.
    Its coefficients, and the whole canonical encoding, are computable deterministically in time polynomial in $L$.]
  + #emph[There is a perfectly complete tester using a bounded number of bit reads and bounded Boolean processing.
    Its public randomness is uniformly enumerable with polynomial-size support and rational probabilities of
    polynomial bit length. Every fixed branch has unconditioned read subdistributions of bounded density relative
    to $\[ S_0 \]$. There is a constant $C_B$ such that proximity $a$ to a port word implies rejection at most
    $C_B a$. For every fixed $a > 0$, there is a fixed $theta_B \( a \) >
    0$ such that rejection less than $theta_B \( a \)$ implies proximity less than $a$ to some $cal(D) \( s \)$,
    for all sufficiently large $L$.]
  + #emph[There are a deterministic polynomial-time exact decoder at a fixed positive Hamming radius and a fixed
    $0 < nu_B < d_(cal(D)) \/ 4$. From any word within $nu_B$ of $cal(D) \( s \)$,
    either half supplies bits of its canonical word with any fixed requested average accuracy under any fixed
    bounded-density law on the original edge and outer indices.
    For a product block this law is on the joint pair of indices.
    Requested masks and additive forms may depend arbitrarily on the public request.
    The read procedures have unconditioned fixed-branch smoothness, including their unsuccessful branches.]
  #emph[The dummy template, its decoder radius, and $nu_B$ are all fixed before any later actual arity,
    circuit-size factor, or correction-round count. They are not decreased when those constants increase.]
] <prop:dummy-port>

#proof[
  The inner distance assertion applies separately to each half.
    Distinct inputs give distinct labels already in the order-one input track,
    so it gives the claimed distance for their concatenation.
  For testing, mix the ordinary valid-label testers on the two halves with the following additional checks.
    At systematic point probes compare the legacy chart with the public stage-zero polynomial, the mode with post,
    and the progress marker with its specified one-hot tensor,
    using the source or successor progress value as appropriate.
    Uniform slot masks and additive binary forms give smooth bit versions of these checks;
    a specified form can also be split into fresh uniform summands.
    On exact valid labels, an incorrect location condition has a fixed positive rejection gap by the low-degree or
    constant-tensor distance. Correct conditions force the blank-work tape, the specified progress and mode,
    and frame $gamma^(- 1)$. Finally compare the two order-one input point tracks at identical original systematic
    edge/point indices and identical uniform bit forms, choosing copies independently in the two halves.
    Different inputs give a fixed positive discrepancy gap. The two reads have smooth marginals individually;
    they do not require a product block. Each mixture weight is a fixed positive constant.
  Here is the fixed-gap implication explicitly. Let $g > 0$ be a common lower bound for the rejection of any
    violated location or equality requirement on exact pairs of valid labels, with the mixture weights included.
    Let $C$ bound the change in these tests’ rejection under changes to a fraction of the whole port.
    Given $a > 0$, choose
  $ 0 < a_0 < min { a \, g \/ \( 4 C \) } . $
  Ordinary soundness supplies a positive rejection threshold forcing each half within $a_0$ of an exact valid
    label. Take the total tester threshold small enough to imply both of these assertions and also smaller than
    $g \/ 2$. The pair of nearby exact labels is at distance less than $a_0$ from the received port.
    If any required exact condition were wrong, smoothness would make the received rejection at least $g -
    C a_0 > g \/ 2$, a contradiction. Thus the exact pair is precisely $cal(D) \( s \)$ and the received distance
    is less than $a$. This defines $theta_B \( a \)$. Perfect completeness and the upper bound $C_B
    a$ follow by charging every read whose answer differs from the exact port word.
    All choices and computations have the bounded, polynomially enumerable properties asserted in the two inner
    interfaces.
  At the two fixed labels all logical inputs except $s$ are public.
    Canonical persistent values and their coordinate coefficients have logical degree at most three,
    even on invalid Boolean tapes. Their verification certificates use public linear maps on one primary array:
    multiplication by the public test matrix, summation, division by a public monic polynomial,
    coefficient extraction, and interpolation. These operations preserve degree.
    Fixed-progress stack formation, restriction to a point or a line, line-coefficient extraction,
    slot contraction, row extension, and additive bit forms are linear over the prime field.
    Thus a $Y$ bit has degree at most three. A $Z$ bit is a binary bilinear form of two such operands and has
    degree at most six. Repeating bits for balance changes nothing.
    The degree bound is independent of the allowance and of all future template choices.
  For completeness, the coefficient algorithm need not manipulate a large symbolic expression.
    For a specified bit function $b$, evaluate the canonical dummy word on $1_T$ for all $T
    subset.eq \[ L \]$ with $\| T \| lt.eq 6$. Its coefficient at the squarefree monomial indexed by $A$ is
  $ c_A = sum_(T subset.eq A) b \( 1_T \) quad upright("in ") bb(F)_2 \, wide \| A \| lt.eq 6 . $
  Boolean multilinear inversion and the degree bound give every coefficient;
    there are $O \( \( L + 1 \)^6 \)$ evaluations, each polynomial-time.
  Use the deterministic order-one recovery from Lemma 69 on the first half.
    A port error fraction $r$ causes an error fraction at most $2 r$ there,
    so a fixed sufficiently small $r$ gives exact recovery of $s$.
    Finally choose $nu_B < d_(cal(D)) \/ 4$ with $2 nu_B$ inside the dummy average-correction radius and,
    if necessary, the just established recovery radius. A port within $nu_B$ corrupts either half by at most $2
    nu_B$. The dummy corrector therefore answers the stated requests from that half;
    its read density relative to the whole port loses only a factor two.
    Its radius is independent of the requested accuracy and density constant.
    Every constant used here belongs to the one-port template. ◻
]

=== 9.2 Exact original-index correspondence and virtual source bits <exact-original-index-correspondence-and-virtual-source-bits>

Now fix an actual arity $k$, a circuit-size factor, and a Boolean circuit $f$ covered by Theorem 27,
  padding unused inputs with public zero ports. Fix words $y_i$ with

#[#set math.equation(numbering: n => "(9.2)")
 $ "dist" #scale(x: 120%, y: 120%)[\(] y_i \, cal(D) \( s_i \) #scale(x: 120%, y: 120%)[\)] lt.eq
   nu_B . $ <ig:fixed-ports>]

For a public zero port all bits of $cal(D) \( 0^L \)$ are computed publicly.
  The true graph used below is the single actual-template path for the fixed tuple
  $s = \( s_1 \, dots.h \, s_k \)$, rather than the union over possible input tuples.
  Write $w_(*) \( s \)$ and $w_(*)^(+) \( s \)$ for its source and immediate successor.
  These have the same public frame, tape locations, mode, and progress as their dummy counterparts,
  but their input-dependent encoding bits must be supplied from the ports.

#thm([Lemma 9.2.])[
  (Source correspondence and virtual access).  #emph[For either $w_(*) \( s \)$ or $w_(*)^(+) \( s \)$,
    every tag-$i$ point or line $Y$ operand agrees with its dummy counterpart for $s_i$ at the same original
    indices, after renaming the port tag. The same is true of a $Z$ block whose two operands both have tag $i$.
    Tag-zero data at either label are publicly computable. Consequently source and successor encoded-bit requests
    with bounded original-index density admit arbitrarily accurate average answers from (9.2),
    with smooth external reads. For mixed products the requisite density is joint density on the complete
    edge/point indices before marginalization. Actual and dummy balanced-copy multiplicities need not agree.]
] <ig:virtual-source>

#proof[
  Apply Lemma 54 at the two labels in (7.8). Both have frame $gamma^(- 1)$, blank work, stage-zero legacy,
    and post mode; their progresses are respectively $q - 1$ and $q - 2$.
    At either progress the lemma identifies each positive algebraic array with its one-port counterpart at the
    same native point, slot, and mask indices. This includes verification auxiliaries and all derivative
    descendants: Lemma 47 fixes their separate call layouts independently of work destinations,
    the number of ports, and the actual circuit. The placements and fixed-progress stack formulas are common as well.
  The common row field, row matrices, systematic extension, and point/line domains were fixed before $k$.
    Applying these same linear operations preserves the equality at the original encoded indices,
    for the source and its first decrement separately. The actual template may balance its block types with
    different copy counts. Forgetting its copy index and choosing a fresh uniformly random dummy copy preserves
    the original index and costs only the fixed actual block-weight factor.
  The same source-data lemma makes every tag-zero array public at these labels.
    Its conclusion includes derivatives evaluated on public shifted work,
    even when the shifted Boolean tape is invalid: canonical certificate recipes are defined there and do not
    solve a final validity equation. Thus no work-side certificate needs to evaluate $f \( s \)$ or a stored sum
    with a port-dependent primary. The actual encoded $J$-symbols of these public arrays,
    including their parity values, are computed with the actual template’s common row encoder.
  The only remaining case is a product with tags $\( i \, 0 \)$ or $\( 0 \, i \)$.
    Write $x$ for the positive operand’s entire original edge/point index and $z$ for the public operand’s entire
    index. After the indicated contractions and public scalar multipliers its bit is, in one orientation,
  #[#set math.equation(numbering: n => "(9.3)")
   $ Q #scale(x: 120%, y: 120%)[\(] pi \( b_i u \( x \) \) \,
     pi \( b_0 v_(upright("pub")) \( z \) \) #scale(x: 120%, y: 120%)[\)] =
     mu_(z \, b_i \, b_0 \, Q) #scale(x: 120%, y: 120%)[\(] u \( x \) #scale(x: 120%, y: 120%)[\)] \, $ <ig:mixed-form>]
  where $mu_(z \, b_i \, b_0 \, Q)$ is a specified additive binary form.
    The dummy $Y$ corrector permits precisely such arbitrary forms,
    including dependence on both requested positions and all the public coefficients.
    It retains $x$ at the same original index. If the request law satisfies
  $ p \( x \, z \) lt.eq frac(C, \| cal(X) \| thin \| cal(Z) \|) \, wide upright("then") wide
    sum_z p \( x \, z \) lt.eq frac(C, \| cal(X) \|) . $
  This proves the required density for the dummy $Y$ request on both its edge and its point.
    A same-positive-tag $Z$ request retains both original indices and their joint density;
    even when its types coincide, no pair is replaced by a diagonal. A $\( 0 \, 0 \)$ product is public.
    There are no products of two distinct positive tags. Proposition 70 now supplies all the answers.
    Fixing a source/successor choice, orientation, or block type costs a fixed factor.
    All error and density bounds are summed before any later answer-dependent selection;
    no density bound is conditioned on that selection. ◻
]

=== 9.3 Validation of the true path and numerical access <validation-of-the-true-path-and-numerical-access>

Let $m = m_(upright("in"))$ be the length of one actual-template word,
  and let $b_(\#)$ be its number of equally weighted original binary block types.
  The path labels have fixed separation $d_(*) > 0$ in the normalized Euclidean norm.
  Constants from this point may depend on the actual arity, circuit-size factor,
  and desired output-loss fraction $upsilon > 0$. They will not alter $cal(D)$ or $nu_B$.

The ordinary binary tester recognizes the union of paths over all input tuples.
  Before using a seed for geometry, we must ensure that its nearby label belongs to the path for the externally
  supplied tuple $s$. We do this by comparing each input track with its corresponding port.

#thm([Lemma 9.3.])[
  (Validation at the fixed external tuple).  #emph[There are fixed $rho_(upright("in")) \,
    rho_(upright(i n \, c o m p)) > 0$ and bounded-read validation routines for an internal binary seed $z in {
    0 \, 1 }^m$ such that, with arbitrarily small prescribed failure probability,
    acceptance implies distance less than $rho_(upright("in"))$ to a unique label on the true-$s$ path,
    and distance less than $rho_(upright(i n \, c o m p))$ to a true-path label implies acceptance.
    These radii are chosen before the reliability of the routines.
    For each fixed seed that can be accepted on good decisions its reference label is fixed independently of the
    decision randomness. Current and actual incident-neighbor bits and existence flags can subsequently be
    supplied with arbitrary fixed average accuracy for the request laws of Lemma 80.]
] <ig:validation>

#proof[
  Choose $rho_(upright("in"))$ within the whole-word uniqueness and actual-template correction radii.
    Estimate rejection of the ordinary tester for the union of all port tuples.
    For each port $i$, also sample the order-one point track $W_(s_i)$ of $z$ at uniform systematic original
    edge/point indices and uniform forms, and compare it with the bit at the identical original index of the
    corrected dummy source half of $y_i$. Choose a random actual copy for the direct read.
    This input track is unrotating and uses the same extension at every actual path label.
  On an exact valid label the ideal mismatch is zero if its $i$th port is $s_i$,
    and at least a constant $p_s > 0$ otherwise: the nonzero order-one polynomial differs on a constant fraction
    of represented arguments, and a uniform additive form detects a nonzero difference with probability $1 \/ 2$.
    We can choose one $p_s$ for the fixed templates. A balanced error fraction $a'$ in $z$ changes a comparison
    rate by at most $C'_k a'$, where $C'_k$ includes the systematic and block-weight density factors. Choose
  $ 0 < a' < rho_(upright("in")) \, wide C'_k a' < p_s \/ 8 . $
  Use half the ordinary soundness threshold for $a'$ as the rejection cutoff,
    and $p_s \/ 2$ as each mismatch cutoff. Good statistics with fixed positive slack imply that an accepted seed
    is $a'$-close to an exact valid label. The mismatch gap then forces every port of that label to be $s_i$.
    Conversely, smoothness of the ordinary tester and of the comparison probes makes all rates lie strictly below
    their cutoffs when the seed is within a sufficiently small fixed $rho_(upright(i n \, c o m p)) >
    0$ of a true-path label.
  First fix sample counts that concentrate the underlying ideal rates at the required slack;
    independent samples and Chebyshev’s inequality suffice. Next choose the dummy correction accuracy so that the
    bounded number of supplied comparison bits fail with the desired total probability.
    This order leaves $a'$, $rho_(upright(i n \, c o m p))$, and $nu_B$ unchanged.
    On good acceptance, the ordinary correction and neighbor procedures of Lemma 69 apply to the fixed unique
    reference. They return the true incident flags, including the disabled wrap flag,
    and true encoding bits at existing neighbors with arbitrary average accuracy.
    Analyze each possible reference of the fixed seed before intersecting with acceptance;
    one never conditions a smoothness estimate on that event.
    On unsuccessful branches every routine still has a bounded Boolean output or a fixed default. ◻
]

The point-vector space for the gadget is

#[#set math.equation(numbering: n => "(9.4)")
 $ cal(B) = \[ - 1 \, 2 \]^(4 m) \, wide parallel U parallel_(upright(b))^2 = 1 /
   m sum_(i = 1)^(4 m) U_i^2 . $ <ig:point-space>]

Among its first-block coordinates select the systematic point $Y$ bits of the constant output track
  $F_(upright("out"))$, with forms $mu$ satisfying $mu \( 1 \) = 1$, including all their balanced copies.
  At the unique sink all these bits equal $f \( s \)$. At least half the row labels are systematic,
  half the forms take $1$ to $1$, and the track has weight $1 \/ b_(\#)$.
  Consequently the selected fraction among all $4 m$ coordinates is at least

#[#set math.equation(numbering: n => "(9.5)")
 $ c_(upright("sel")) = frac(1, 16 b_(\#)) . $ <ig:selection>]

Choose the geometric parameter $tau > 0$ so small that

#[#set math.equation(numbering: n => "(9.6)")
 $ frac(\( 5 tau \)^2, \( 2 \/ 5 \)^2) < rho_(upright(i n \, c o m p)) \, wide
   frac(16 \( 10 tau \)^2, c_(upright("sel"))) < upsilon / 4 . $ <ig:tau>]

A binary disagreement after rounding a physical block at any threshold in $\[ 2 \/ 5 \, 3 \/ 5 \]$ incurs squared
  error at least $\( 2 \/ 5 \)^2$ from the true bit. Thus the first inequality gives the geometric completeness
  condition. Obtain fixed $B_1 \, c_(*) \, beta_0 > 0$ from Lemma 80 and its geometric lower bound,
  increasing $B_1$ to an integer if necessary. Write $cal(E)$ for the endpoint set of the true path.
  It excludes the top of the distinguished vertical segment;
  here every member of $cal(E)$ has first block equal to the unique sink encoding. In particular,

#[#set math.equation(numbering: n => "(9.7)")
 $ parallel v \( U \) parallel_oo lt.eq B_1 - 1 \, wide parallel "clip"_(cal(B)) \( U + beta v \( U \) \) -
   U parallel_(upright(b)) gt.eq c_(*) beta $ <ig:geometric-bound>]

whenever $"dist" \( U \, cal(E) \) > 10 tau$ and $0 < beta lt.eq beta_0$.

We verify the numerical access contract rather than presupposing access to hidden circuit values.
  There are at most eight true word roles: each of two seed roles and its two possible neighbors,
  and the special source and successor. Four incident edge roles contribute four straight pieces and three
  internal fillets each; with two possible seed junctions and the special vertical and its bottom fillet there are
  at most 32 piece roles. Lemma 71 always supplies the special roles, even when neither seed validates.
  The other roles use Lemma 72 and the actual neighbor routines.
  Their requests are full-word uniform samples for statistics or the coordinate matching the requested field
  component. Condition on a fixed output block type, or sum over the finite type list,
  to obtain the required edge/outer laws, including joint laws for $Z$ blocks.
  Mode, progress, and critical decisions use their own uniform systematic marginals.

Fix the geometric mesh, numerical tolerances, scalar sample counts, and high-level role list first.
  Allocate calls for the possible roles and matching components before any numerical minimum or branch is
  selected. For a fixed input and rounding threshold, each seed has at most one reference that good validation
  could accept, so there are only boundedly many underlying actual candidates.
  Independent uniform-coordinate samples concentrate all their bounded statistics,
  including physical block statistics, without conditioning on which candidate wins.
  Set the required bit and decision error budgets for these high-level calls next,
  and only then fix the lower-level correction and repetition counts.
  A numerical winner chooses a reserved role and mesh case;
  it cannot turn a hidden answer into a new arbitrary word address.

Raw scalar samples can be quantized on fixed-width grids with public random offsets.
  Their finite range and fixed widths give finitely many answers.
  All public field, address, coefficient, mesh, reciprocal, square-root,
  and trigonometric calculations are made during the reduction, to the fixed required precision.
  A finite table indexed by the bounded answers supplies the required numerical operations.
  The procedures return bounded values on arbitrary unsuccessful trials as well.
  Refining an offset grid later changes the thresholds and public table entries, but not the bin count,
  word-address primitives, or number of answer slots.

It follows from Lemma 80, with these explicit oracles, that for $kappa =
  1 \/ 100$ we can fix a finite unscaled estimator whose signed output has the form

#[#set math.equation(numbering: n => "(9.8)")
 $ hat(v)_i \( U \, y \) = B_1 \( p_i^(*) - n_i^(*) \) \, wide p_i^(*) \,
   n_i^(*) in \[ 0 \, 1 \] upright(" fixed-precision dyadics") \, quad p_i^(*) n_i^(*) = 0 \, $ <ig:ideal-estimator>]

and, whenever $"dist" \( U \, cal(E) \) > 10 tau$,

#[#set math.equation(numbering: n => "(9.9)")
 $ 4 bb(E)_(i \, t) \| hat(v)_i \( U \, y \) - v_i \( U \)
   #scale(x: 120%, y: 120%)[\|]^2 < \( c_(*) kappa \/ 100 \)^2 . $ <ig:ideal-error>]

Here $i$ is uniform on $\[ 4 m \]$, $t$ is the true public tape,
  and the inequality holds conditional on each fixed admissible internal rounding threshold and scalar offset.
  Rounding the signed output to its fixed dyadic grid is included in the accuracy.
  All choices to this point are independent of $beta$ and of any external comparison margin.

=== 9.4 Full tapes, deterministic copies, and read routing <full-tapes-deterministic-copies-and-read-routing>

We require bounds for every read actually wired into the circuit.
  Unfold all hypothetical Boolean, validation, equality, and quantization answers,
  assigning fresh public randomness to unexecuted nodes as well.
  After the accuracy choices above this is a fixed finite tree.
  Let $H$ bound the number of its raw comparison occurrences.
  A branch may select an unsuccessful seed, a wrong flag, a wrong transition type, or a default;
  these choices do not license a new addressing primitive.

More explicitly, list each potential initial row-cone path before removing repeated positions.
  On a frozen symbolic branch the covariance map $\( g \, I \)
  mapsto \( g h \, h^(- 1) I \)$ is a joint permutation; a further row-star step is a fixed left multiplication of
  the edge coordinate, with a change among boundedly many edge labels.
  On product blocks the two axes undergo these transformations separately.
  Neighbor proposals use a finite list of the affine pullbacks from the inner algebra.
  Omissions, deduplication, and representative choices only select subdistributions of the listed paths,
  without renormalization. A flagged zero is a public value and needs no artificial dummy read at a concentrated
  address. Information-set inverses and linear-expression coefficients are public functions of the frozen branch
  and indices. Fresh additive splitting is performed after all form or multiplier pullbacks,
  so arbitrary answer-dependent requested forms still give the uniform inner marginals.
  These facts are exactly the unconditioned guarantees of Lemma 69;
  they apply whether the answers on the frozen branch are correct or not.

These inner routines satisfy the additional physical-read hypothesis Definition 10.6 of Definition 78.
  We therefore invoke part (iv) of Lemma 80 at the physical-read level:
  each completed inner bit or decision already has a bounded physical answer tree with the stated unconditioned
  branch marginals.

For a fixed internal offset choice, sum these bounds over all potential slots and geometric roles.
  With $i$ uniform on $\[ 4 m \]$, the expected number of reads of a specified internal base coordinate is at most
  $C \/ \( 4 m \)$, and of a specified position of any one external port is at most $C \/ S_0$,
  for a fixed constant $C$. Internal direct reads use uniform statistic positions or matching output positions.
  Virtual external reads use the original-index correspondence and the marginal calculation in (9.3).
  The constants $H \, C$ are uniform over the function and over the external threshold $xi$ for the fixed bounds,
  and remain unchanged by later offset-grid refinement. These are counts on the whole tree,
  not smoothness conditioned on execution.

Choose finite uniform rational grids for the internal common binary threshold $xi_(upright("in"))
  in \[ 2 \/ 5 \, 3 \/ 5 \]$ and the scalar offsets modulo the already fixed quantization widths.
  If $D_(upright("grid"))$ is a lower bound on their sizes,
  then for a fixed scalar value the probability of being within $4
  omega_(upright("in"))$ of a binary threshold or one of its relevant shifted boundaries is at most

#[#set math.equation(numbering: n => "(9.10)")
 $ O #scale(x: 120%, y: 120%)[\(] D_(upright("grid"))^(- 1) +
   C_(upright("width")) omega_(upright("in")) #scale(x: 120%, y: 120%)[\)] \, $ <ig:ambiguity>]

where $C_(upright("width"))$ is fixed by the widths and finite range.
  Sum the conditional slot-density bounds over all base positions at every offset,
  and then over the bounded slot list. Thus the true-law fraction of cones having any such ambiguous internal
  comparison is uniformly as small as desired, for every fixed mean array,
  by refining the grids and decreasing the positive rational $omega_(upright("in"))$.
  External comparisons are not included here; their spoil budget is a separate hypothesis.

For each output coordinate $i$, the full tape law, including the offsets and conditional random choices at all
  hypothetical nodes, has enumerable polynomial support and rational probabilities of polynomial bit length.
  A fixed product or finite tree of polynomial-size choices still has these bounds.
  Choose a common square $R$ and replace each law by an equal list of $R$ tapes with total variation at most

#[#set math.equation(numbering: n => "(9.11)")
 $ t_(upright("tv")) = frac(eta_(upright("tv")), max { 4 m \, S_0 }) . $ <ig:tv>]

Indeed floor $R$ times each probability and distribute the remaining integer counts within the support.
  If $P \( L \)$ is a common support bound, choosing a square $R gt.eq P \( L \) max { 4 m \,
  S_0 } \/ eta_(upright("tv"))$ suffices. A square within a fixed factor of this polynomial bound is available,
  and the integer and rational operations cost polynomial time.
  The bound and $R$ can be common to all padded functions in the stated class.
  Use the $r$th listed tape at physical replica $\( i \, r \)$ and put

#[#set math.equation(numbering: n => "(9.12)")
 $ G_0 = 4 m R . $ <ig:gscale>]

By bounded outputs, sufficiently small fixed $eta_(upright("tv"))$ preserves from (9.9) the empirical bound

#[#set math.equation(numbering: n => "(9.13)")
 $ (frac(1, m R) sum_(i \, r) \| hat(v)_(i r) \( U \, y \) - v_i \( U \) \|^2)^(1 \/ 2) lt.eq c_(*) kappa \/ 20 \,
   $ <ig:empirical-error>]

as well as the desired rare-event slack in (9.10). This estimate holds for every fixed $U$:
  the tape lists depend only on the public laws, and total variation controls every bounded function of the tape,
  including its error on that $U$.

For clarity, the unequal-size load calculation is

#[#set math.equation(numbering: n => "(9.14)")
 $ \# { upright("reads of external position ") j } & lt.eq
   G_0 (C / S_0 + frac(H eta_(upright("tv")), max { 4 m \, S_0 })) lt.eq \( C + H eta_(upright("tv")) \) G_0 / S_0 \,\
\# { upright("reads of internal base coordinate ") j } & lt.eq
  G_0 (frac(C, 4 m) + frac(H eta_(upright("tv")), max { 4 m \, S_0 })) lt.eq \( C + H eta_(upright("tv")) \) R .
  $ <ig:external-load>]

For one position the count on a tape lies in $\[ 0 \, H \]$,
  so changing its law by total variation $t_(upright("tv"))$ changes its expectation by at most $H
  t_(upright("tv"))$, which proves these inequalities. They hold even when $m \/
  S_0$ grows as an arbitrarily large fixed power of $L$. Route the internal occurrences round-robin to the $R$
  replicas of their base coordinate. Every replica is then read a bounded number of times.
  Every external occurrence is exposed separately for the caller to route;
  (9.14) proves the constant $C_(upright("occ"))$ in Theorem 27.

=== 9.5 An explicit generalized subcircuit <an-explicit-generalized-subcircuit>

Let $R = b^2$ and identify replica labels with $\( bb(Z) \/ b bb(Z) \)^2$.
  On each base coordinate use the average $A$ of the eight labeled moves

$ \( u plus.minus 2 v \, v \) \, quad \( u plus.minus \( 2 v + 1 \) \, v \) \, quad \( u \, v plus.minus 2 u \) \,
  quad \( u \, v plus.minus \( 2 u + 1 \) \) $

and eight identity labels, each with weight $1 \/ 16$. The all-modulus Margulis–Gabber–Galil bound,
  in the primary formal development #cite(label("MGGAFP")) #raw("mgg_numerical_radius"),
  bounds the normalized upper mean-zero eigenvalue of the eight-move operator by $5 sqrt(2) \/ 8$.
  The operator is symmetric with spectrum in $\[ - 1 \, 1 \]$. Half-laziness therefore yields

#[#set math.equation(numbering: n => "(9.15)")
 $ parallel A D parallel lt.eq \( 1 - kappa \) parallel D parallel \, wide kappa = 1 \/ 100 \, $ <ig:replica-gap>]

on replica deviations, since $\( 1 + 5 sqrt(2) \/ 8 \) \/ 2 < 1 - kappa$.
  The statement includes every positive integer $b$ and retains loops and repeated labels.
  No prime-modulus choice or randomized graph search is needed.

Each physical replica is a node $x_(i r) in \[ 0 \, 1 \]$, interpreted as $X_(i r) = 3 x_(i r) -
  1 in \[ - 1 \, 2 \]$. Its own #emph[direct cone] produces it using the prescribed 16 averaging inputs and its
  fixed estimator tape. All gates of different direct cones are distinct;
  they may read the same existing node as input. The estimator uses only the nine gate types of Definition 2,
  as follows.

For every raw comparison occurrence create its own Constant threshold node and a Less gate,
  oriented to give the desired high bit. Internal binary thresholds and quantization boundaries are translated
  from physical coordinates by $a mapsto \( a + 1 \) \/ 3$. Out-of-range constant cases use Boolean constants.
  An external occurrence reads its individually routed external node and compares it with a Constant at
  $\( xi + 1 \) \/ 3$. Threshold gates are inside the cone and are never shared between cones.
  All public zero bits are produced by Constant gates.

Unfold finite answer-dependent choices and implement their Boolean answers and finite lookup outputs by
  truth-table circuits over And, Or, and Not. A multiplexer, for example,
  is $\( c upright("And") a \) upright("Or") \( \( upright("Not") thin c \) upright("And") b \)$.
  Copy gates may provide fan-out, although unrestricted input fan-out already suffices.
  Induction through these circuits preserves a correct near-bit with the same tolerance:
  weak Boolean antecedents apply to inputs at most $epsilon$ or at least $1 - epsilon$.
  This costs a fixed number of gates because the complete answer tree and output precision have already been
  fixed. In particular, polynomial-size field elements and indices are computed publicly to choose wires,
  coefficients, and tables; they are not hidden strings being processed by a bounded Boolean cone.

Apply Scale with parameter $1 \/ 16$ to each averaging input and accumulate with Add to obtain their mean.
  Use Scale and Add to sum the fixed dyadic weights of the signed-output bits, obtaining nodes $p \,
  n in \[ 0 \, 1 \]$ for $p^(*) \, n^(*)$ in (9.8). For a positive rational $beta$ chosen below, put $t_beta =
  beta B_1 \/ 3 lt.eq 1$. Scale $p \, n$ by $t_beta$, add the positive term to the averaging node,
  and subtract the negative term, in that order, to produce $x_(i r)$. All parameters lie in $\[ 0 \, 1 \]$.
  Exact partial sums for averages and dyadic expansions are at most one;
  hence their clipped Add realization is exact on ideal inputs.
  Clipped sums and differences are Lipschitz in their inputs,
  so there is a fixed arithmetic constant $C_(upright("ar"))$ with the following two implications whenever the
  entire direct cone is $epsilon$-satisfied. First,

#[#set math.equation(numbering: n => "(9.16)")
 $ \| X_(i r) - \( A X \)_(i r) \| lt.eq 2 beta B_1 + C_(upright("ar")) epsilon . $ <ig:coarse-direct>]

Under the same hypothesis, if all its raw comparisons give the ideal near-bits, then

#[#set math.equation(numbering: n => "(9.17)")
 $
   lr(|X_(i r) - "clip"_(\[ - 1 \, 2 \]) #scale(x: 120%, y: 120%)[\(] \( A X \)_(i r) + beta hat(v)_(i r)
   #scale(x: 120%, y: 120%)[\)]|) lt.eq C_(upright("ar")) epsilon . $ <ig:fine-direct>]

Here are explicit error counts. Sixteen Scale gates and fifteen Add gates produce an averaging node $tilde(a)$
  with $\| tilde(a) - a \| lt.eq 31 epsilon$, where $a = \( A x \)_(i r)$. For

$ H \( a \, p \, n \) = max { min { a + t_beta p \, 1 } - t_beta n \, 0 } \, $

the two final Scale gates, Add, and Subtract give $\| x_(i r) - H \( a \, p \, n \) \| lt.eq 35 epsilon$.
  Since $\| H \( a \, p \, n \) - a \| lt.eq 2 t_beta$, this proves (9.16) with arithmetic error $105
  epsilon$ and requires no estimator correctness. If the raw comparisons give the ideal near-bits,
  pad each signed dyadic expansion to $J$ bits. Its $J$ Scale gates and $J -
  1$ Add gates reconstruct each of $p^(*) \, n^(*)$ within $\( 3 J - 1 \) epsilon$:
  at most $J epsilon$ comes from its input bits and $\( 2 J - 1 \) epsilon$ from the arithmetic gates.
  Every exact partial sum is at most one. The map $H$ is 1-Lipschitz in $a$ and $t_beta$-Lipschitz in each of
  $p \, n$. Since $p^(*) n^(*) = 0$,

$ 3 H \( a \, p^(*) \, n^(*) \) - 1 = "clip"_(\[ - 1 \, 2 \]) #scale(x: 120%, y: 120%)[\(] \( A X \)_(i r) +
  beta B_1 \( p^(*) - n^(*) \) #scale(x: 120%, y: 120%)[\)] . $

Thus both estimates hold with $C_(upright("ar")) = 18 J + 99$. This calculation also covers intermediate saturations.

For each selected first-block coordinate and each replica add a separate extraction pair:
  a Constant at $1 \/ 2$ in $x$ coordinates and a Less gate comparing that constant with $x_(i r)$.
  Its output is the designated near-bit. These gates are not used in the feedback.
  Let $W$ be the number of designated outputs. The construction has

#[#set math.equation(numbering: n => "(9.18)")
 $ c_(upright("sel")) G_0 lt.eq W lt.eq G_0 \, wide \| T_(upright("invocation")) \| lt.eq C_g G_0 $ <ig:gate-count>]

for a fixed $C_g gt.eq 1$ including every extraction gate and every hypothetical branch.
  Each node is the output of at most one gate, and cycles arise only through the prescribed physical input nodes.
  Gate listing, tape construction, address calculations, and all parameters other than the supplied threshold cost
  polynomial time and polynomial bit length in $L$, with fixed exponents for the chosen bounds.
  Uses of an arbitrary rational $xi$ additionally cost its supplied bit length (and polynomial time in that
  length). The gate topology and count do not depend on that length or on the external physical margin.

=== 9.6 Robustness under arbitrary failed gates <robustness-under-arbitrary-failed-gates>

We give the choice order and prove the universal assignment guarantee. For a replica array put

#[#set math.equation(numbering: n => "(9.19)")
 $ parallel Y parallel_(upright("rep"))^2 = frac(1, m R) sum_(i \, r) Y_(i r)^2 \, wide macron(X)_i = 1 /
   R sum_r X_(i r) . $ <ig:replica-norm>]

Repeated mean vectors have precisely the norm (9.4). Projection onto means and onto deviations are orthogonal
  contractions. The maximum norm of an array bounded coordinatewise by three is six;
  this explains the constants in the failure charges below.

#strong[Parameter choices.] Choose $q_(upright("bad")) > 0$ so that

#[#set math.equation(numbering: n => "(9.20)")
 $ 6 B_1 sqrt(q_(upright("bad"))) < c_(*) kappa \/ 10 \, $ <ig:qbad>]

and choose $gamma_g > 0$ much smaller than $q_(upright("bad"))$.
  Choose the internal grids, the positive $omega_(upright("in"))$, and the tape-TV tolerance so that,
  for every fixed means, the empirical fraction of cones with an ambiguous internal comparison is less than
  $q_(upright("bad")) \/ 4$. The full-tree constants $H \, C$ are already fixed.
  By (9.14), let $D_(upright("read"))$ bound the number of routed internal comparison inputs using any actual
  replica. Choose $d_(upright("sync")) > 0$ sufficiently small that

#[#set math.equation(numbering: n => "(9.21)")
 $ frac(D_(upright("read")) d_(upright("sync"))^2, 4 omega_(upright("in"))^2) < q_(upright("bad")) \/ 4 \, wide
   frac(64 d_(upright("sync"))^2, c_(upright("sel"))) < upsilon \/ 4 . $ <ig:sync-choice>]

If $parallel X - macron(X) parallel_(upright("rep")) lt.eq d_(upright("sync"))$,
  the first bound and Markov’s inequality charge fewer than $q_(upright("bad")) \/
  4$ of the cones for any internal routed read deviating more than $omega_(upright("in"))$ from its base mean.
  Choose grouped budgets with positive slack, so that this charge, the ambiguity charge,
  and the $gamma_g$ external charge sum to less than $q_(upright("bad"))$.

Now fix a positive rational $beta lt.eq beta_0$ such that $t_beta lt.eq
  1$ and $4 beta B_1 \/ kappa < d_(upright("sync")) \/ 2$. Finally choose positive rational $epsilon_g \, delta_g$ with

#[#set math.equation(numbering: n => "(9.22)")
 $ epsilon_g < min { 1 \/ 100 \, omega_(upright("in")) \/ 1000 } \, wide
   delta_g \/ c_(upright("sel")) < upsilon \/ 4 \,\
frac(4 beta B_1 + 2 C_(upright("ar")) epsilon_g + 6 sqrt(delta_g), kappa) < d_(upright("sync")) \, wide
  2 C_(upright("ar")) epsilon_g + 6 sqrt(delta_g) < beta c_(*) kappa \/ 10 . $ <ig:last-small>]

All inequalities can hold because each right side has positive slack when the later constants are decreased.
  None of these choices uses the subsequently supplied external margin $omega > 0$.
  That margin imposes only the additional restriction $epsilon < omega \/ 1000$ on the actual gate tolerance,
  alongside $epsilon lt.eq epsilon_g$.

Fix any assignment of values in $\[ 0 \, 1 \]$ to all nodes with at most $delta_g G_0$ failed invocation gates.
  Assume that at most $gamma_g G_0$ of the external comparison occurrences are spoiled:
  every other occurrence lies on the side of $xi$ prescribed by the fixed word $y_i$,
  with physical gap greater than $omega$. Different occurrences are not required to have equal physical values.
  A direct cone is called failed if any of its own gates fails.
  Since its gates are disjoint from those of other direct cones, their failed fraction is at most $delta_g$.

#strong[Coarse synchronization.] First obtain synchronization without assuming any correct estimator answer.
  Apply (9.16) on the unfailed cones and the physical range bound on the others.
  The triangle inequality, the factor-four norm normalization, and (9.15) give

#[#set math.equation(numbering: n => "(9.23)")
 $ kappa parallel X - macron(X) parallel_(upright("rep")) lt.eq parallel X - A X parallel_(upright("rep")) lt.eq
   4 beta B_1 + 2 C_(upright("ar")) epsilon + 6 sqrt(delta_g) < kappa d_(upright("sync")) . $ <ig:coarse-sync>]

For the first inequality write $D = X - macron(X)$ and use $parallel D parallel lt.eq parallel D - A D parallel +
  parallel A D parallel$. Mark as unstable a cone with an ambiguous internal comparison at these fixed means,
  an excessive routed internal deviation, or any spoiled external occurrence.
  The fraction of unstable cones is less than $q_(upright("bad"))$ by the choices above.
  An external spoiled occurrence charges only its own cone; no repeated-value consistency was used.

#strong[Fine residual and endpoint proximity.] Suppose for a contradiction that
  $"dist" \( macron(X) \, cal(E) \) > 10 tau$. In a stable, unfailed cone,
  each internal comparison has physical mean gap greater than $4
  omega_(upright("in"))$ and input deviation at most $omega_(upright("in"))$.
  Its transformed $x$ gap is therefore at least $omega_(upright("in"))$.
  The Constant error and the strict Less tolerance are dominated by $epsilon lt.eq
  epsilon_g < omega_(upright("in")) \/ 1000$, forcing the ideal near-bit.
  Every external comparison likewise has $x$ gap greater than $omega \/ 3$;
  its Constant and Less errors are dominated by $epsilon < omega \/ 1000$.
  Thus (9.17) applies with the empirical ideal estimator on $\( macron(X) \, y \)$.
  On unstable but unfailed cones, (9.16) and $parallel v parallel_oo lt.eq
  B_1$ give discrepancy at most $3 beta B_1 + C_(upright("ar")) epsilon$ from the clipped mean-field update at $A
  X$. On failed cones that discrepancy is at most three. Using (9.13), obtain

#[#set math.equation(numbering: n => "(9.24)")
 $ E_(upright("in")) & := parallel X - "clip"_(cal(B)) \( A X + beta v \( macron(X) \) \)
   #scale(x: 120%, y: 120%)[parallel]_(upright("rep"))\
 & lt.eq beta #scale(x: 120%, y: 120%)[\(] c_(*) kappa \/ 20 +
   6 B_1 sqrt(q_(upright("bad"))) #scale(x: 120%, y: 120%)[\)] + 2 C_(upright("ar")) epsilon +
   6 sqrt(delta_g) < beta c_(*) kappa \/ 2 . $ <ig:refined-error>]

The notation $"clip"_(cal(B))$ here means coordinatewise clipping on every replica,
  with $v \( macron(X) \)$ repeated over replicas.

We keep the clipping inside the contraction argument. Put

$ F = "clip"_(cal(B)) \( A X + beta v \( macron(X) \) \) \, wide C_0 =
  "clip"_(cal(B)) \( macron(X) + beta v \( macron(X) \) \) \, $

where $C_0$ is constant on replicas. Nonexpansiveness and (9.15) show

$ parallel F - C_0 parallel_(upright("rep")) lt.eq \( 1 - kappa \) parallel X -
  macron(X) parallel_(upright("rep")) \, wide parallel F - macron(F) parallel_(upright("rep"))
  lt.eq \( 1 - kappa \) parallel X - macron(X) parallel_(upright("rep")) . $

Projecting $X - F$ onto deviations now gives $parallel X - macron(X) parallel_(upright("rep")) lt.eq
  E_(upright("in")) \/ kappa$. Projecting onto means and comparing $macron(F)$ with $C_0$ gives

$ parallel macron(X) - C_0 parallel_(upright(b)) & lt.eq E_(upright("in")) + \( 1 - kappa \) parallel X -
  macron(X) parallel_(upright("rep"))\
 & lt.eq E_(upright("in")) \/ kappa < c_(*) beta . $

This contradicts (9.7). No commutation of clipping with taking means was asserted.
  Hence $"dist" \( macron(X) \, cal(E) \) lt.eq 10 tau$, and its first block has mean squared distance at most
  $\( 10 tau \)^2$ from the sink word.

#strong[Designated outputs.] It remains to account for adversarial concentration on designated outputs.
  Among all $G_0$ replica indices, discard those in the first block with mean discrepancy at least $1 \/
  4$ from the corresponding sink bit, and those with replica deviation greater than $1 \/ 8$.
  The squared bounds just proved and (9.23) bound their respective counts, with harmless slack for normalization, by

$ 16 \( 10 tau \)^2 G_0 quad upright("and") quad 64 d_(upright("sync"))^2 G_0 . $

At each remaining selected position, the physical replica differs by less than $3 \/ 8$ from the bit $f \( s \)$,
  so its distance from the physical threshold $1 \/ 2$ is greater than $1 \/ 8$.
  In $x$ coordinates the gap is greater than $1 \/ 24$. Since $epsilon lt.eq epsilon_g < 1 \/ 100$,
  a satisfied extraction pair returns the correct near-bit.
  Every extraction pair has its own two gates, so at most $delta_g
  G_0$ designated outputs are charged for their own failed gates, even if every failed gate is concentrated there.
  By (9.18), the incorrect fraction is at most

#[#set math.equation(numbering: n => "(9.25)")
 $ frac(16 \( 10 tau \)^2 + 64 d_(upright("sync"))^2 + delta_g, c_(upright("sel"))) < upsilon . $ <ig:extraction-loss>]

The choice of $tau$, synchronization radius, and failure budget reserved this divisor explicitly.

We have proved the assertion for every assignment satisfying the stated failure and spoil budgets,
  with all failed gates otherwise arbitrary. Taking $c_g = c_(upright("sel"))$,
  together with Proposition 70, (9.14), and (9.18), gives every assertion of Theorem 27.
  The proof uses no part of the outer circuitization: its only remaining independent input is the geometric lemma
  proved next.

== 10 Encoded paths and finite local displacement procedures <sec:geometry>

The encoded-path and displacement-field method follows the construction in
  Rubinstein #cite(label("Rubinstein2016Settling")) Sections 3.1–3.2:
  current and successor blocks trace a copy–toggle polygon,
  and radial interpolation moves from the tangent through the inward and reverse-tangent directions to a fixed
  vertical direction. Here we prove the geometric interface at the normalized codeword scale,
  including rounded corners, displacement after clipping, and finite local access with average errors.
  This section is independent of both circuit realizations.
  Its hypotheses concern entire binary words and local access to their bits;
  they do not depend on the algebraic interpretation of an individual coordinate.
  In particular, in the inner application the graph is the path for the fixed true input tuple,
  and the distinguished source is accessed through the virtual procedures of Section 9.

=== 10.1 The geometric statement and its parameters <geo:setup>

Let $G$ be a finite directed graph of indegree and outdegree at most one,
  with no self-edge and no isolated vertex. Fix a source $w_(*)$ with an actual successor.
  All other vertices missing an incoming or an outgoing edge are called desired endpoints.
  Suppose that distinct vertices have encodings $E_w in { 0 \, 1 }^m$ satisfying

#[#set math.equation(numbering: n => "(10.1)")
 $ lr(bar.v.double E_u - E_v bar.v.double)_(upright(b)) gt.eq d_(*) > 0 wide \( u eq.not v \) . $ <geo:distance>]

We decrease $d_(*)$ to a positive rational at most one. On any number of blocks of length $m$ use the inner
  product and norm

#[#set math.equation(numbering: n => "(10.2)")
 $ chevron.l U \, V chevron.r_(upright(b)) = m^(- 1) sum_j U_j V_j \, wide
   lr(bar.v.double U bar.v.double)_(upright(b))^2 = m^(- 1) sum_j U_j^2 . $ <geo:norm>]

An unqualified norm in this section means this norm. The infinity norm is unnormalized.
  Write $cal(B) = \[ - 1 \, 2 \]^(4 m)$, and let $"clip"_(cal(B))$ denote coordinatewise clipping to this cube.
  Clipping is nonexpansive for (10.2). Scalars occupying a block mean constant repetitions.

#thm([Theorem 10.1.])[
  (Encoded-path geometry).  #emph[Under these hypotheses, there is a union $cal(L) subset cal(B)$ of directed,
    rounded paths and cycles, with desired endpoint set $cal(E)$, having the following properties.
    For every sufficiently small positive rational $tau$, there are a positive integer $B_1$ and positive rational
    constants $c_(*) \, beta_0$, depending only on $d_(*)$ and $tau$, and a field $v : cal(B) arrow.r
    bb(R)^(4 m)$ such that
#[#set math.equation(numbering: n => "(10.3)")
 $ lr(bar.v.double v \( X \) bar.v.double)_oo & lt.eq B_1 - 1 \,\
lr(bar.v.double "clip"_(cal(B)) \( X + beta v \( X \) \) - X bar.v.double) & gt.eq c_(*) beta quad
  upright("if ") "dist" \( X \, cal(E) \) > 10 tau \, quad 0 < beta lt.eq beta_0 . $ <geo:bounded-field>]

 The field is continuous on the relative open set ${ X in cal(B) : "dist" \( X \, cal(E) \) > 10 tau }$.
   Every $P in cal(E)$ has first block exactly $E_w$ for a desired endpoint $w$.
   Consequently, if $lr(bar.v.double X - P bar.v.double) lt.eq 10 tau$,
   rounding $X_1$ at $1 \/ 2$ gives relative Hamming distance at most $4 \( 10 tau \)^2$ from $E_w$.
   The exceptional top of the distinguished vertical is excluded from $cal(E)$ and has field $- upright(bold(e))$,
   where $upright(bold(e)) = \( 0 \, 0 \, 0 \, 1 \)$.]
  #emph[The initial choice of $tau$ may impose any further fixed positive upper bounds,
    including validation and global-recovery radii. All these choices, and $B_1 \, c_(*) \, beta_0$,
    precede every numerical accuracy choice and the choice of a step size $beta$.]
] <thm:geometry>

We prove the theorem before formulating the precise access contract for its finite numerical implementation.
  In particular no global regularity claim at desired endpoints will be needed.

=== 10.2 Polygons, fillets, and local projection <geo:curves>

For an edge $u arrow.r v$, draw, with fourth block zero,

#[#set math.equation(numbering: n => "(10.4)")
 $ & \( E_u \, E_u \, 0 \) arrow.r^(thick 2 thick) \( E_u \, E_v \, 0 \)
   arrow.r^(thick 3 arrow.t thick) \( E_u \, E_v \, 1 \)\
 & wide arrow.r^(thick 1 thick) \( E_v \, E_v \, 1 \) arrow.r^(thick 3 arrow.b thick) \( E_v \, E_v \, 0 \) .
   $ <geo:polygon>]

An arrow label names the changing block; the up and down arrows record the direction of the third block.
  This is a schematic of block changes, not a distance-preserving planar drawing.
  Concatenate these polygons at graph-vertex junctions. Put $H_(*) = \( E_(w_(*)) \, E_(w_(*)) \, 0 \)$ and
  prepend the segment $\( H_(*) \, 2 \) arrow.r \( H_(*) \, 0 \)$ to the path out of $w_(*)$.
  We call the four segment types in (10.4) #emph[horizontal], meaning that their fourth block is zero;
  this includes the two third-block toggles. Every horizontal segment has length in $\[ d_(*) \, 1 \]$,
  and consecutive unit directions are orthogonal: the successive varying blocks in a polygon are $2 \, 3 \, 1 \,
  3$, a graph junction changes from block $3$ to block $2$, and the special bottom changes from block $4$ to block $2$.

#thm([Lemma 10.2.])[
  (Separation of original segments).  #emph[There is $d_(upright("sep")) > 0$, depending only on $d_(*)$,
    such that distinct nonconsecutive original segments are at distance at least $d_(upright("sep"))$.
    Their adjacency graph, with adjacency meaning consecutiveness, has no triangle.]
] <geo:separation>

#proof[
  For binary words $a \, b \, c$ and $0 lt.eq s lt.eq 1$,
  #[#set math.equation(numbering: n => "(10.5)")
   $ lr(bar.v.double \( 1 - s \) a + s b - c bar.v.double) gt.eq
     min \( s \, 1 - s \) lr(bar.v.double a - b bar.v.double) . $ <geo:binary-chord>]
  Indeed on a coordinate where $a \, b$ differ, the chord coordinate is $s$ or $1 - s$,
    whose distance from a binary coordinate is at least $min \( s \, 1 - s \)$. Summing squares proves the claim.
    In particular, a point on this chord within distance $z$ of a binary word is within distance $z$ of one of the
    chord endpoints.
  Consider first segments varying the same block. If their distance is less than $d_(*)$,
    all fixed encoding blocks and repeated binary levels agree.
    For block $2$, the tail agrees and determines the outgoing edge.
    For block $1$, the head agrees and determines the incoming edge.
    For block $3$, an upward segment has a fixed unequal pair $\( E_u \, E_v \)$,
    whereas a downward segment has an equal pair $\( E_v \, E_v \)$;
    the two types cannot have the same fixed pair. Within either type that pair determines the segment,
    using uniqueness of the incoming edge for the downward type. There is only one block-$4$ segment.
  For two segments varying different blocks, choose points at distance $z$.
    Each varying block of a horizontal segment is within distance $z$ of a fixed binary block of the other.
    By (10.5), its point is within distance $z$ of an endpoint of its original segment.
    For the special vertical, its distance from a horizontal segment forces its height to be at most $z$,
    so it is within $z$ of its bottom. The two selected endpoints are therefore within $3 z$.
    Distinct original endpoints are separated by at least $d_(*)$:
    one of their encoding blocks, binary third levels, or vertical levels differs.
    Taking $3 z < d_(*)$ forces the endpoints to coincide.
  An unequal ordered pair $\( E_u \, E_v \)$ occurs at the two internal toggle corners of its own edge only,
    with the third level distinguishing them. An endpoint $\( E_v \, E_v \, 1 \, 0 \)$ belongs to the last
    internal corner of the unique incoming edge. An endpoint $\( E_v \, E_v \, 0 \, 0 \)$ belongs to at most the
    incoming final segment and the outgoing first segment. If both exist, they are consecutive.
    At $w_(*)$ there is no incoming graph edge, and the special bottom takes exactly that role.
    The top belongs only to the special vertical. Thus equality of endpoints of distinct segments implies
    consecutiveness. For example $d_(upright("sep")) = d_(*) \/
    4$ is sufficient for the asserted strict-distance argument.
    The adjacency components are paths and cycles; any cycle contains at least eight segments because the graph
    has no self-edge. Adding a segment at a path beginning creates no triangle. ◻
]

Choose a positive rational $a_0$ such that

#[#set math.equation(numbering: n => "(10.6)")
 $ 2 a_0 < d_(upright("sep")) \/ 2 \, wide 4 a_0 < d_(*) \, wide a_0 < 1 \/ 10 . $ <geo:trim-choice>]

Trim arclength $a_0$ from both ends of every horizontal segment,
  whether or not its outer graph junction is present. At a shared corner $C$ with incoming and outgoing unit
  directions $u_0 \, v_0$, join the trim points by

#[#set math.equation(numbering: n => "(10.7)")
 $ Z \( s \) & = C - a_0 u_0 + a_0 v_0 + a_0 \( sin s thin u_0 - cos s thin v_0 \) \, & 0 lt.eq s lt.eq pi \/ 2 \,\
T \( s \) & = cos s thin u_0 + sin s thin v_0 . $ <geo:fillet>]

The arc has speed $a_0$ in the parameter $s$, and $T$ is its directed unit tangent.
  Figure 1 shows this replacement in the plane of its two orthogonal directions.
  Use the same fillet at the special bottom, trimming the vertical there only. Its top is not trimmed.
  Unmatched horizontal trim points remain endpoints. Let $cal(L)$ be the resulting compact union and set

#[#set math.equation(numbering: n => "(10.8)")
 $ cal(E) = { upright("unmatched endpoints of ") cal(L) } \\ { \( H_(*) \, 2 \) } . $ <geo:endpoint-set>]

The first three blocks stay in $\[ 0 \, 1 \]$: on a fillet the separate varied block coordinates stay in the
  intervals traversed by their original segments. The fourth block is zero except on the vertical and its bottom
  fillet; on that fillet it is a repeated scalar in $\[ 0 \, a_0 \]$.
  Consequently $chevron.l T \, upright(bold(e)) chevron.r lt.eq 0$ everywhere.
  Fix an integer $C_t gt.eq 2 \/ d_(*)$. For arclength $lambda$,

#[#set math.equation(numbering: n => "(10.9)")
 $ lr(bar.v.double  bar.v.double) T_oo lt.eq C_t \, wide lr(bar.v.double d T \/ d lambda bar.v.double) lt.eq
   1 \/ a_0 \, wide lr(bar.v.double d T \/ d lambda bar.v.double)_oo lt.eq 2 C_t \/ a_0 . $ <geo:tangent-bounds>]

These derivative bounds hold on piece interiors and give the same Lipschitz bounds across joins because the
  tangent is continuous there.

#figure(
  [(290,160) (180,30)(-5,0)10(-1,0)2 (180,30)(0,5)10(0,1)2 (180,30) (187,24)(0,0)\[l\]$C$ (130,80) (122,87)(0,0)\[r\]$O$ (20,30)(1,0)110 (62,30)(1,0)25 (74,18)(0,0)\[t\]$u_0$ (130,30)(139.946,30)(149.134,33.806) (149.134,33.806)(158.323,37.612)(165.355,44.645) (165.355,44.645)(172.388,51.677)(176.194,60.866) (176.194,60.866)(180,70.054)(180,80) (180,80)(0,1)65 (180,103)(0,1)24 (170,116)(0,0)\[r\]$v_0$ (130,30) (180,80) (130,9)(0,0)\[t\]$C - a_0 u_0$ (188,80)(0,0)\[l\]$C + a_0 v_0$],
  caption: [Figure 1: Rounding one orthogonal corner. The dashed legs are removed; the directed path follows the retained straight portions and the fillet from $C - a_0 u_0$ to $C + a_0 v_0$. Its center is $O = C - a_0 u_0 + a_0 v_0$ and its radius is $a_0$. This local geometry lies in the orthonormal $\( u_0 \, v_0 \)$ plane. ],
) <fig:geo-fillet>

The numerical procedure will choose a curve point by minimizing estimated distances.
  We therefore need more than a unique projection: a curve point with small squared-distance excess must be close
  to the true projection, and its tangent close to the projection’s tangent, in every coordinate.
  The next lemma gives these bounds before any candidate is selected.

#thm([Lemma 10.3.])[
  (Local chains and strong excess).  #emph[There is $rho_(upright("loc")) > 0$, depending only on $d_(*) \, a_0$,
    such that two points $Z \, Z' in cal(L)$ with $lr(bar.v.double Z - Z' bar.v.double) <
    rho_(upright("loc"))$ are joined along one local straight or single-corner chain.
    Its length $Delta$ satisfies $Delta lt.eq sqrt(2) lr(bar.v.double Z - Z' bar.v.double)$.
    For every sufficiently small $tau > 0$, if
#[#set math.equation(numbering: n => "(10.10)")
 $ r = "dist" \( X \, cal(L) \) lt.eq 4 tau \, wide "dist" \( X \, cal(E) union { \( H_(*) \, 2 \) } \) > 10
   tau \, $ <geo:tube-hypothesis>]

 there is a unique closest point $Z$, which is interior and satisfies $chevron.l X - Z \, T \( Z \) chevron.r =
   0$. If $Z' in cal(L)$ has squared excess $g = lr(bar.v.double X - Z' bar.v.double)^2 - r^2 lt.eq
   tau^2$ and signed arclength difference $s'$ from $Z$ on that chain, then
#[#set math.equation(numbering: n => "(10.11)")
 $ g gt.eq \( s' \)^2 \/ 2 . $ <geo:strong-excess>]

 In particular,
#[#set math.equation(numbering: n => "(10.12)")
 $ lr(bar.v.double Z' - Z bar.v.double) & lt.eq sqrt(2 g) \, & lr(bar.v.double Z' - Z bar.v.double)_oo & lt.eq
   C_t sqrt(2 g) \,\
lr(bar.v.double T \( Z' \) - T \( Z \) bar.v.double) & lt.eq
  sqrt(2 g) \/ a_0 \, & lr(bar.v.double T \( Z' \) - T \( Z \) bar.v.double)_oo & lt.eq
  2 C_t sqrt(2 g) \/ a_0 . $ <geo:point-error>]

 The tangent at an endpoint competitor is its one-sided tangent.]
] <geo:projection>

#proof[
  Support a straight point by its original segment, and an arc point by the two segments of its corner.
    An arc point is within $a_0$ of each supporting segment. Choose $rho_(upright("loc")) +
    2 a_0 < d_(upright("sep"))$. Every across-point pair of supports is then identical or consecutive.
    Each point’s support set is itself a clique, so their union is a clique and contains at most two segments by
    Lemma 74. In the one-segment case both points lie on its retained straight.
    In the two-segment case they lie on the two retained straights and their shared fillet.
    Opposite-end trims are disjoint by (10.6). This also rules out unintended identifications or intersections.
  Along a two-direction chain, all tangent coefficients in its orthogonal directions $u_0 \, v_0$ are nonnegative,
    and $chevron.l T \, u_0 + v_0 chevron.r gt.eq 1$. Integrating in the directed order gives $Delta lt.eq
    chevron.l Z' - Z \, u_0 + v_0 chevron.r lt.eq sqrt(2) lr(bar.v.double Z' - Z bar.v.double)$.
    Reverse the order if necessary. A straight chain has equality between length and endpoint distance.
  Compactness gives a minimizer. The endpoint assumption makes every minimizer interior,
    so differentiating squared distance along its $C^1$ path gives the asserted perpendicularity.
    A competitor of the stated excess satisfies
  $ lr(bar.v.double Z' - Z bar.v.double) lt.eq 4 tau + sqrt(17) tau < 9 tau . $
  Require $9 tau < rho_(upright("loc"))$. The local chain then has $\| s' \| < 13 tau$, and integration of (10.9) gives
  $ Z' - Z = s' T \( Z \) + R \, wide lr(bar.v.double  bar.v.double) R lt.eq \( s' \)^2 \/ \( 2 a_0 \) . $
  For $\| s' \| \/ \( 2 a_0 \) < 1$, expansion of squared distance and perpendicularity therefore imply
  $ g & = lr(bar.v.double Z' - Z bar.v.double)^2 - 2 chevron.l X - Z \, Z' - Z chevron.r\
 & gt.eq \( s' \)^2 [(1 - frac(\| s' \|, 2 a_0))^2 - r / a_0] gt.eq \( s' \)^2 \/ 2 \, $
  where, for example, $tau \/ a_0 lt.eq 1 \/ 64$ makes the last inequality hold.
    Applying this to a second minimizer proves uniqueness. Integrating the unit tangent, its infinity bound,
    and its two Lipschitz bounds over length $\| s' \| lt.eq sqrt(2 g)$ proves (10.12) and (10.12).
    All estimates are independent of $m$. ◻
]

At an unmatched beginning, the trimmed segment varies only block $2$;
  at an unmatched ending it varies only block $3$. Their first blocks are therefore exactly the encoding of the
  missing-neighbor vertex. There are no isolated vertices requiring a separate convention.
  The source’s horizontal beginning is joined to the special vertical and is not an endpoint of $cal(L)$.
  This proves the endpoint assertion in Theorem 73. If $P in cal(E)$ and $lr(bar.v.double X - P bar.v.double)
  lt.eq 10 tau$, every wrongly rounded first coordinate costs at least $1 \/ 4$ in squared error,
  proving the Hamming bound in that theorem.

#prodef([Remark 10.4.])[
  (Local Lipschitz continuity of projection).  Suppose both $X$ and $Y$ satisfy (10.10),
    and $lr(bar.v.double X - Y bar.v.double) lt.eq tau \/ 20$.
    Write $P \, Q$ for their respective projections onto $cal(L)$ and $r_X \,
    r_Y$ for their distances to $cal(L)$. With the same sufficiently small choice of $tau$, one has
  #[#set math.equation(numbering: n => "(10.13)")
   $ (1 - frac(r_X + r_Y, a_0)) lr(bar.v.double P - Q bar.v.double)^2 lt.eq chevron.l X - Y \, P -
     Q chevron.r lt.eq lr(bar.v.double X - Y bar.v.double) lr(bar.v.double P - Q bar.v.double) .
     $ <geo:projection-lipschitz-bound>]
  In particular, the projection is locally $2$-Lipschitz on this tube.
    This is a local assertion away from the specified endpoints.
  Indeed, the conclusion is immediate if $P = Q$. Otherwise, $lr(bar.v.double P - Q bar.v.double) lt.eq r_X +
    lr(bar.v.double X - Y bar.v.double) + r_Y lt.eq \( 8 + 1 \/ 20 \) tau < rho_(upright("loc"))$.
    Lemma 75 therefore puts $P \, Q$ on one local chain, whose arclength $s$ satisfies $s^2 lt.eq
    2 lr(bar.v.double P - Q bar.v.double)^2$. Integrating (10.9) from either end expresses its chord as the signed
    length times the tangent there, with remainder of norm at most $s^2 \/ \( 2 a_0 \)$.
    Perpendicularity at $P$ and $Q$ gives
  $ \| chevron.l X - P \, P - Q chevron.r \| lt.eq frac(r_X s^2, 2 a_0) \, wide \| chevron.l Y - Q \, P -
    Q chevron.r \| lt.eq frac(r_Y s^2, 2 a_0) . $
  Expanding $X - Y = \( P - Q \) + \( X - P \) - \( Y - Q \)$ proves the first inequality in (10.13);
    Cauchy–Schwarz proves the second. Finally $r_X + r_Y lt.eq 8 tau$ and $tau \/ a_0 lt.eq
    1 \/ 64$ make its left coefficient at least $7 \/ 8$, and in particular at least $1 \/ 2$,
    proving the stated factor $2$.
] <geo:projection-lipschitz>

=== 10.3 A field with uniform displacement after clipping <a-field-with-uniform-displacement-after-clipping>

For the inside prescription, away from the desired endpoint neighborhood,
  successive radial intervals interpolate from the directed tangent through the inward normal and reverse tangent
  to the fixed fourth-block direction. The four directional stages in (10.15) parallel
  #cite(label("Rubinstein2016Settling")) Equation (1); the projection and clipping estimates below establish the
  bounds needed for the present curve. A separate prescription above fourth-block mean level $1 \/
  2$ handles the distinguished vertical. We check that the prescriptions agree and that clipping preserves
  positive displacement away from the desired endpoints. The normalized tube bound permits individual coordinates
  of $X$ to be far from the curve, so raw field length alone does not prove this last claim.
  We will bound the fraction of coordinates where clipping can remove motion, and then handle the upper face separately.

Fix $tau$ satisfying Lemma 75, and impose also

#[#set math.equation(numbering: n => "(10.14)")
 $ tau < 1 \/ 100 \, wide 6 \( C_t + 1 \) tau lt.eq 1 \/ 4 . $ <geo:tau-choice>]

All further fixed validation or recovery upper bounds on $tau$ are imposed now.
  For $X = \( X_1 \, X_2 \, X_3 \, X_4 \)$ put $mu = m^(- 1) sum_j \( X_4 \)_j$.
  For a point $Z$ and a unit tangent $T$ let $r = lr(bar.v.double X - Z bar.v.double)$ and define

#[#set math.equation(numbering: n => "(10.15)")
 $ Phi \( X \; Z \, T \) =
   cases(delim: "{", \( 1 - r \/ tau \) T + \( Z - X \) \/ tau \, & 0 lt.eq r lt.eq tau \,, - \( r \/ tau - 1 \)
   T + frac(2 tau - r, tau r) \( Z - X \) \, & tau lt.eq r lt.eq 2 tau \,, - frac(3 tau - r, tau) T + frac(r - 2
   tau, tau) upright(bold(e)) \, & 2 tau lt.eq r lt.eq 3 tau \,, upright(bold(e)) \, & r gt.eq 3 tau .) $ <geo:Phi>]

The values at shared boundaries agree. There is no reciprocal radius in the formula used near zero.

For $mu lt.eq 1 \/ 2$ and $"dist" \( X \, cal(E) \) > 10 tau$, use $v \( X \) =
  Phi \( X \; Z \, T \( Z \) \)$ when $"dist" \( X \, cal(L) \) lt.eq 3 tau$, and $v \( X \) =
  upright(bold(e))$ otherwise. The top is at distance at least $3 \/ 2$ from this region,
  by the difference of fourth-block means; hence the projection lemma applies.
  At the remaining inside points put $v \( X \) = 0$. For $mu gt.eq 1 \/ 2$,
  the default upward motion can be lost at the upper face. We add motion toward the distinguished vertical,
  with coefficient zero at the mean interface. Close to that vertical the tangent direction is downward,
  including at its top. Set

#[#set math.equation(numbering: n => "(10.16)")
 $ Z_mu & = \( H_(*) \, mu \) \, wide r_mu = lr(bar.v.double X - Z_mu bar.v.double) \, wide h_mu = min { 1 \,
   2 \( mu - 1 \/ 2 \) } \,\
v \( X \) & = Phi \( X \; Z_mu \, - upright(bold(e)) \) + h_mu \( Z_mu - X \) . $ <geo:outside>]

#thm([Lemma 10.5.])[
  (Agreement at the mean interface).  #emph[In $2 \/ 5 < mu < 3 \/ 5$,
    the inside prescription extended to this slab equals $Phi \( X \; Z_mu \, - upright(bold(e)) \)$.
    The outside extension, using $h_mu = max { 0 \, min { 1 \, 2 \( mu - 1 \/ 2 \) } }$,
    differs from it in norm by at most $12 \| mu - 1 \/ 2 \|$ and in each component by at most $6 \| mu -
    1 \/ 2 \|$. Thus the definitions agree at $mu = 1 \/ 2$.]
] <geo:interface>

#proof[
  Every nonvertical piece, including the bottom fillet, has fourth height at most $a_0 < 1 \/ 10$.
    Its distance to a point in the slab exceeds $3 \/ 10$, by the mean inequality
    $lr(bar.v.double X_4 - z upright(bold(1)) bar.v.double) gt.eq \| mu - z \|$. It cannot be in the $4 tau$ tube.
    The retained vertical contains all heights of this slab, and
  $ m^(- 1) sum_j \( \( X_4 \)_j - t \)^2 = m^(- 1) sum_j \( \( X_4 \)_j - mu \)^2 + \( t - mu \)^2 $
  shows that its nearest line point is $Z_mu$. For $T = - upright(bold(e))$,
    the last annulus of (10.15) is already identically $upright(bold(e))$ at every $r gt.eq 2 tau$.
    Consequently the same equality holds even where the closest curve piece is far away and the inside field is
    default. The desired endpoints have fourth height zero and the top has height two,
    so neither endpoint exception occurs in the slab. Each coordinate of $Z_mu -
    X$ has magnitude at most three and its norm is at most six.
    Multiplication by $h_mu lt.eq 2 \| mu - 1 \/ 2 \|$ proves both bounds. ◻
]

The projection is continuous wherever it is unique in the tube:
  if $X_n arrow.r X$, compactness makes every subsequential limit of their projections a minimizer for $X$,
  hence the unique minimizer. Its tangent is continuous along the local chains.
  Formula (10.15) matches the default at $3 tau$, and Lemma 77 matches the mean interface.
  This proves precisely the continuity claimed in Theorem 73.

#proof[
  Choose $beta_0 > 0$ satisfying all the upper bounds on $beta$ used below.
  #strong[Inside the tube and in the inside default region.] First suppose $mu lt.eq 1 \/ 2$ and $r =
    "dist" \( X \, cal(L) \) lt.eq 3 tau$. For $r lt.eq tau$ the raw field is the convex combination of $T$ and
    the inward unit normal with coefficients $1 - r \/ tau \, r \/ tau$.
    For $tau lt.eq r lt.eq 2 tau$ it is the convex combination of $-
    T$ and the inward unit normal with coefficients $r \/ tau - 1 \, 2 - r \/ tau$.
    The two directions in each combination are orthogonal. At $r = 0$ the field is $T$.
    In the third annulus the two unit directions are $- T \, upright(bold(e))$,
    whose inner product is nonnegative. Therefore in all three annuli $lr(bar.v.double v \( X \) bar.v.double)
    gt.eq 1 \/ sqrt(2)$.
  Write $v = b + w \( Z - X \)$, where $lr(bar.v.double  bar.v.double) b_oo lt.eq C_t + 1$ and $0 lt.eq w lt.eq
    1 \/ tau$. All coordinates of $Z$ lie in $\[ 0 \, 1 \]$: for a vertical projection its height is at most $mu +
    3 tau < 1$, and all other pieces already have this property.
    Require $beta \/ tau lt.eq 1 \/ 2$ and $beta \( C_t + 1 \) lt.eq 1 \/ 4$.
    The preliminary point $Y = X + beta w \( Z - X \)$ lies in the box.
    If $\| X_i - Z_i \| < 1 \/ 2$, then $- 1 \/ 2 < Y_i < 3 \/ 2$,
    and the additional displacement $beta b_i$ causes no clipping.
    The number of remaining coordinates, divided by $m$, is at most $4 r^2 lt.eq 36 tau^2$.
    At each, the clipping loss is at most $beta \( C_t + 1 \)$ because $Y$ was in the box.
    The norm of all loss is at most $6 tau beta \( C_t + 1 \) lt.eq beta \/ 4$.
    Subtracting it from the raw displacement leaves at least $beta \/ 4$.
  In the inside default case, let $p$ be the fraction of fourth coordinates at most $7 \/ 4$.
    Since all entries are at least $- 1$,
  $ 1 \/ 2 gt.eq mu gt.eq - p + \( 7 \/ 4 \) \( 1 - p \) \, wide p gt.eq 5 \/ 11 . $
  For $beta lt.eq 1 \/ 4$ these coordinates retain the full upward displacement,
    giving norm at least $beta sqrt(5 \/ 11)$.
  #strong[Above the mean interface.] Now suppose $mu gt.eq 1 \/ 2$, and abbreviate $Z = Z_mu$, $r = r_mu$.
    The fourth coordinates of $Z - X$ have mean zero, so they are orthogonal to $upright(bold(e))$.
    Write $v = b upright(bold(e)) + w \( Z - X \)$, with the scalar table
  #[#set math.equation(numbering: n => "(10.17)")
   $ upright("radius") & b & w\
0 lt.eq r lt.eq tau & - 1 + r \/ tau & 1 \/ tau + h_mu\
tau lt.eq r lt.eq 2 tau & r \/ tau - 1 & 2 \/ r - 1 \/ tau + h_mu\
r gt.eq 2 tau & 1 & h_mu $ <geo:outside-coefficients>]
  and hence
  #[#set math.equation(numbering: n => "(10.18)")
   $ \| b \| lt.eq 1 \, quad 0 lt.eq w lt.eq w_max := 1 \/ tau + 1 \, quad b^2 + w^2 r^2 gt.eq
     1 \/ 2 . $ <geo:outside-norm>]
  The last assertion follows from the two orthogonal components of the first two radial regimes;
    adding $h_mu$ increases the nonnegative normal coefficient. In the last regime $b = 1$.
    Require $beta w_max lt.eq 1 \/ 2$. The move toward $Z$ is a convex move inside the box,
    and horizontal coordinates undergo no further move or clipping.
  If $b < 0$, then $r < tau$. The subsequent downward step cannot clip at the upper boundary.
    Where $\| \( X_4 \)_j - mu \| < 1 \/ 2$, the preliminary fourth coordinate is nonnegative since $mu gt.eq
    1 \/ 2$, and the following step is at least $- beta gt.eq - 1$.
    Thus lower clipping can occur only on a fraction at most $4 tau^2$ of the fourth coordinates.
    Its loss on each is at most $beta$, giving norm loss at most $2 tau beta$.
    By (10.18) this leaves at least $beta \/ 4$.
  It remains to treat $b gt.eq 0$. Set
  $ sigma^2 = m^(- 1) sum_j \( \( X_4 \)_j - mu \)^2 \, wide H =
    lr(bar.v.double \( X - Z \)_(1 \, 2 \, 3) bar.v.double) \, wide r^2 = H^2 + sigma^2 \, $
  and choose a positive rational
  #[#set math.equation(numbering: n => "(10.19)")
   $ eta lt.eq min {tau / 2 \, frac(1, 4 w_max) \, 1 / 2 min (1 / 2 \, frac(1, 4 w_max))} . $ <geo:eta-choice>]
  If $sigma gt.eq eta$, a uniform fourth coordinate satisfies
  $ sigma^2 lt.eq 3 bb(E) \| \( X_4 \)_j - mu \| = 6 bb(E) \( mu - \( X_4 \)_j \)_(+) . $
  Put $c = eta^2 \/ 12$. Since the positive part is at most three, $bb(E) \( mu - \( X_4 \)_j \)_(+) gt.eq
    eta^2 \/ 6$ implies that a fraction at least $eta^2 \/ 36$ have $mu - \( X_4 \)_j gt.eq c$:
    otherwise its expectation would be less than $c + 3 eta^2 \/ 36 = eta^2 \/ 6$.
    On those coordinates the room to the upper boundary is at least $c$. Also $b + w c gt.eq c \/ 12$.
    Indeed (10.18) and $r lt.eq 6$ imply that either $b gt.eq 1 \/ 2$ or $w gt.eq 1 \/ 12$;
    $c < 1$ handles the first alternative. For $beta lt.eq 1$,
    clipping therefore retains displacement at least $beta c \/ 12$ on that fraction.
    Its norm is at least $beta eta^3 \/ 864$.
  Suppose instead $sigma < eta$. If $w H gt.eq tau \/ 4$, the horizontal displacement, which is not clipped,
    is at least $beta tau \/ 4$. Otherwise (10.18) gives
  $ b^2 gt.eq 1 / 2 - w^2 H^2 - w^2 sigma^2 gt.eq 1 / 2 - tau^2 / 16 - w_max^2 eta^2 gt.eq 3 / 8 \, $
  so $b gt.eq 1 \/ 2$. If $mu lt.eq 1$, let $d_0 = min { 1 \/ 2 \, 1 \/ \( 4 w_max \) }$.
    By (10.19), at least three quarters of the fourth coordinates have deviation from $mu$ at most $d_0$.
    Their upper room is at least $1 \/ 2$, and their velocity is at least $b - w_max d_0 gt.eq 1 \/ 4$.
    They retain at least $beta \/ 4$ for $beta lt.eq 1$, giving norm at least $sqrt(3) beta \/ 8 > beta \/ 8$.
    If $mu > 1$, then $h_mu = 1$, $w gt.eq 1$, and $b gt.eq 0$ in (10.17) requires $r gt.eq tau$. It follows that
  $ w H gt.eq H gt.eq sqrt(tau^2 - eta^2) gt.eq sqrt(3) tau \/ 2 \, $
  contrary to the remaining case assumption. This exhausts all outside points, including the upper face.
    At $\( H_(*) \, 2 \)$, $r = 0$ and the formula gives $v = - upright(bold(e))$ exactly.
  Take positive rational $c_(*) lt.eq min { 1 \/ 8 \, tau \/ 4 \,
    eta^3 \/ 864 }$ and positive rational $beta_0$ satisfying all restrictions just made.
    All coordinate differences used in the formulas have magnitude at most three, so any integer $B_1 gt.eq C_t +
    6 + 3 \/ tau$ satisfies (10.3), including the zero convention near inside endpoints.
    These choices depend only on the previously fixed geometric constants. This completes the proof of Theorem 73. ◻
]

=== 10.4 The local-access contract <geo:access>

We next state the information needed to approximate this particular field.
  All probability statements below are for a fixed physical vector $X$,
  averaged over a uniform physical component $I in \[ 4 m \]$ and the public trial randomness.
  Write $J = 1 + \( \( I - 1 \) med mod med m \)$ for its word coordinate.
  Fix a common threshold $xi in \[ 2 \/ 5 \, 3 \/ 5 \]$ and round the first two blocks at $xi$.
  The two resulting binary words $y_1 \, y_2$ are fixed, although the procedures only read requested coordinates.
  Any scalar-quantization offset may also be fixed throughout the following contract and accuracy analysis.

#prodef([Definition 10.6.])[
  (Admissible local access).  An #emph[oracle access implementation] satisfies parts (a)–(c) below and the
    following operational condition. At its declared oracle level,
    each supplied bit or decision routine uses a bounded tree of completed Boolean answers,
    apart from public index computations. Every input, including an input outside a correctness promise,
    gives Boolean answers or public defaults. After its requested accuracies are fixed,
    the oracle tree and its symbolic query roles are bounded independently of $m$ and remain fixed under
    refinement of threshold-offset grids. These conditions impose no constant bound on the physical circuit
    realizing a completed oracle answer. Part (d) is an additional #emph[physical-read hypothesis],
    required only when a conclusion about the fully expanded physical reads is explicitly invoked.
    All constants are uniform in $m$, $X$, and admissible fixed offsets.
    Geometric and validation radii and the reference rule below are fixed before reliability and numerical
    accuracy choices. Operational, sample, repetition, and read-density bounds may depend on the requested fixed
    accuracies as well as the encoding construction.
  + Each seed has a validation decision whose failure probability can be made any prescribed fixed positive
    number. For fixed $y_s$ there is either no valid reference or a single fixed vertex $u_s$ such that,
    off the validation failure event, acceptance identifies $u_s$.
    This reference is independent of the actual random acceptance decision.
    It is also independent of requested confidence and numerical accuracy.
    If $lr(bar.v.double X_s - E_u bar.v.double) lt.eq 5 tau$,
    off that failure event the seed is accepted with reference $u$.
    Intermediate seeds with a proper reference may be accepted or rejected.
    An accepted seed is used only through local routines, not through a globally decoded vertex name.
  + For any accepted reference, incident-edge flags can be supplied with arbitrarily small fixed error,
    and bits of its own and its actual immediate neighbors’ encodings can be supplied with any prescribed fixed
    average error. The same bit guarantee holds for $E_(w_(*))$ and the encoding of its actual successor,
    even if neither seed is accepted. These special words may be public or virtual.
    The bit guarantee is unconditioned for each fixed relevant symbolic role and branch:
      a request at a whole-word coordinate with density at most a fixed constant times $1 \/
      m$ has the asserted error under its given request law. It is not a guarantee conditional on selecting that
      branch. Requests to different word operands may use the same complete coordinate.
      The guarantee is required for the matching coordinate $J$ and for all preallocated statistical coordinates
      below. A finite union of role or fixed block-type alternatives is allowed.
  + For every finite family of bounded functions $f : \[ m \] arrow.r bb(R)$ fixed by $X$,
    the rounded seeds’ possible actual references, and their actual candidate data,
    one can choose fixed sample counts so that each sample average estimates $m^(- 1) sum_j
    f \( j \)$ to any prescribed fixed additive tolerance with any prescribed fixed failure probability.
    The law is again unconditioned under $\( I \, upright("trial") \)$, for each fixed relevant role alternative.
    Every individual sampled word coordinate has uniform marginal,
    or the prescribed bounded-density marginal supported by the same bit-access guarantee.
    Corresponding word operands and physical blocks are evaluated at matching coordinates.
    Independent uniform samples satisfy this requirement. Other sample schemes are permitted if their
      concentration statement holds for the fixed underlying functions in this sense;
      samples and different batches need not be independent after averaging over $I$.
  + #emph[Additional physical-read hypothesis.] After a fixed accuracy has been specified,
    every supplied routine has a realization with a bounded number of primitive physical read answers and bounded
    Boolean processing, apart from public index computations. The bound is independent of $m$.
    On every fixed branch of its complete physical answer tree, including branches with wrong earlier answers,
    the unconditioned marginal of each raw address in a physical domain of size $M$ is at most $C \/ M$,
    with a fixed $C$. A branch that uses public data need not make a physical read.
    These bounds hold uniformly in admissible offsets, whose refinement changes comparison constants and not
    address primitives or numbers of hidden-answer slots. On each fixed symbolic answer branch,
    the address rule itself is independent of the numerical values of these offsets.
] <geo:access-contract>

Part Definition 10.6 controls accuracy of a completed logical call on a fixed valid reference.
  The optional part Definition 10.6 additionally controls physical reads on every wired branch,
  whether or not it is accurate or executed. The inner implementation of Section 9 satisfies this additional
  hypothesis. The outer construction invokes only the oracle contract:
  its ideal functional answers are subsequently replaced by gadgets of polynomial size in the port length.
  Its fixed direct-read count $H_(upright("out"))$ and functional-invocation count $B_(upright("out"))$,
  followed by Theorem 27 and Lemma 33, account separately for that physical substitution.
  We do not assert a size-independent physical read count for the expanded outer construction.
  Neither application requires per-coordinate correctness.

The physical completeness condition in part Definition 10.6 is obtained from a binary completeness radius
  $rho_(upright("comp")) > 0$ by the initial choice

#[#set math.equation(numbering: n => "(10.20)")
 $ frac(\( 5 tau \)^2, \( 2 \/ 5 \)^2) < rho_(upright("comp")) . $ <geo:rounding-radius>]

Indeed a rounded error relative to a binary coordinate costs squared physical error at least $\( 2 \/ 5 \)^2$ for
  every allowed $xi$. An acceptance radius smaller than half the encoding’s relative Hamming distance makes its
  reference unique. In the inner application this reference must lie on the path for the fixed true input tuple,
  exactly as established by the validation in Section 9.

#prodef([Remark 10.7.])[
  (Whole-word coordinates in the inner application).  A matching target is a whole encoding coordinate.
    In a product block called $Z$, that coordinate includes both internal labels of the product.
    Using the same whole coordinate in $E_u$ and $E_v$ preserves the supplied joint request law;
    it does not replace the two internal labels of either word by a diagonal pair.
  For mixed public and variable products in the virtual source, the joint density bound gives the marginal bound
  $ p \( x \, y \) lt.eq frac(C, \| A \| \| B \|) quad arrow.r.double quad sum_(y in B) p \( x \, y \) lt.eq
    frac(C, \| A \|) . $
  The product becomes an additive form on the variable operand.
    That form may depend on the public operand and the discarded coordinate,
    but it does not use that coordinate to select a new variable address.
    Same-positive-tag products retain the whole pair, as required by Lemma 69.
    Lemma 71 proves this transport from the actual source and first successor to the fixed dummy ports.
    Thus their virtual supply has exactly the whole-coordinate access required by the contract.
]

#thm([Lemma 10.8.])[
  (Geometric procedures).  #emph[Fix the geometric constants of Theorem 73 and an oracle access implementation
    satisfying parts (a)–(c) and the operational condition of Definition 78.
    For every fixed $a > 0$ there is a finite local numerical schema with properties (i)–(iii) below.
    Property (iv) additionally assumes the physical-read hypothesis Definition 10.6.]
  + #emph[It returns a signed value $hat(v)_I \( X \)$ on a fixed dyadic grid inside $\[ - B_1 \, B_1 \]$.
    It terminates and is bounded on every input and every trial.
    For every fixed $X$ with $"dist" \( X \, cal(E) \) > 10 tau$,
    and conditional on each fixed admissible binary threshold and scalar-quantization offset,
#[#set math.equation(numbering: n => "(10.21)")
 $ 4 bb(E)_(I \, thin upright("trial")) \| hat(v)_I \( X \) - v_I \( X \) \|^2 lt.eq a^2 . $ <geo:average-accuracy>]

]
  + #emph[At fixed rounded seeds, correct decisions refer to at most eight true-word roles and 32 actual piece
    roles. Meshes, scalar tolerances, sample counts, and all statistical and final matching bit requests are fixed
    before choosing the smaller bit-error budgets, and all final matching requests are allocated before numerical
    minimization.]
  + #emph[Apart from the supplied routines and public index computations,
    the schema uses finitely many scalar comparisons and bounded Boolean lookup.
    Its only word-coordinate address primitives are the matching coordinate and the preallocated statistical
    coordinates. This remains true on every hypothetical wrong or default branch.
    If the oracle-level public spaces, probabilities, routine descriptions,
    and address computations are uniformly enumerable with polynomial support, time,
    and rational-probability bit complexity in a caller’s size parameter,
    the composed oracle-level schema has those properties as well.
    This does not include physical expansion of an oracle call.]
  + #emph[If in addition the physical-read hypothesis Definition 10.6 holds, then,
    once all accuracies and implementation counts have been fixed,
    the fully unfolded physical primitive tree has a fixed number $H$ of possible read slots.
    For each physical domain of size $M$, its unconditioned expected occurrence count at any fixed position,
    averaged over $I$ and public trials, is at most $C \/ M$, for a fixed sum $C$ of slot density bounds.
    Both $H \, C$ remain fixed under subsequent refinement of threshold-offset grids.
    Under the corresponding polynomial enumerability premise for these physical realizations,
    the fully expanded physical schema also has the enumerability properties in part (iii).]
  #emph[Every choice concerns the unscaled field. In particular none depends on a subsequently chosen $0 < beta
    lt.eq beta_0$.]
] <lem:geometric-procedures>

=== 10.5 A finite list covering every close piece <geo:candidates>

From a seed reference $u$, reserve the encoding roles for $u$, its predecessor, and its successor.
  Reserve its two possible incident edge roles. For each actual incident edge list the four retained straight
  segments and its three internal fillets. The trim convention uses the same $a_0$ at both outer ends regardless
  of whether those ends are shared, so these seven pieces need only their two endpoint words.
  When both graph edges at $u$ exist, also list the graph-junction fillet at $u$.
  The incoming direction there is the fixed downward third-block direction, so the junction needs only $E_u$,
  the outgoing neighbor, and the two flags. Apply this procedure to both seeds.

Always add the special retained vertical and its bottom fillet using the distinguished source and its actual
  successor. These two pieces are present even on a trial with no accepted seed.
  The ordinary junction rule requires both graph edges and therefore never invents another junction at the source,
  which has no graph predecessor. There is no need to recognize the source by comparing hidden names.

This is the following explicit reservation schedule; duplicate roles do no harm.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Reserved roles
], table.cell(rowspan: 1, colspan: 1)[Word roles
], table.cell(rowspan: 1, colspan: 1)[Piece roles
]),
  table.cell(rowspan: 1, colspan: 1)[Self, predecessor, successor for two seeds
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Four incident edges, seven pieces each
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[28
],
  table.cell(rowspan: 1, colspan: 1)[Two ordinary junctions
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
],
  table.cell(rowspan: 1, colspan: 1)[Distinguished source and actual successor
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Special vertical and bottom fillet
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
],
  table.cell(rowspan: 1, colspan: 1)[Total upper bound
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[32
],
)
]

On good validation and flag answers, the admitted roles are actual pieces.
  A gray acceptance merely chooses whether to include one fixed reference’s list.
  For fixed $X \, xi$, all possible underlying actual words and pieces in the table are fixed independently of
  later accuracy choices and numerical decisions.

#thm([Lemma 10.9.])[
  (Two-seed coverage).  #emph[Every non-special piece has either its first or its second block fixed to an
    encoding of a vertex whose seed generates it. Consequently, on the strong-completeness and flag good event,
    every piece at distance at most $4 tau$ from $X$ is included in the reserved candidate list.]
] <geo:coverage>

#proof[
  For $u arrow.r v$, its first segment, first fillet, and upward toggle have first block $E_u$.
    The fillet from that toggle to the block-$1$ segment, the block-$1$ segment,
    and its fillet to the downward toggle have second block $E_v$. The downward toggle has both blocks $E_v$.
    An ordinary graph-junction fillet at $u$ changes only blocks $3$ and $2$, so its first block is $E_u$.
    In each case the stated vertex generates the piece from its incident data.
    If the piece is within $4 tau$ of $X$, its fixed block is within $4 tau$ of the corresponding physical block.
    Part Definition 10.6 of the contract therefore accepts that seed with its true reference.
    Correct flags include the piece. The two special pieces are included unconditionally.
    Gray acceptance cannot remove a piece required by this argument; it can only add or remove other actual pieces. ◻
]

=== 10.6 Numerical data and the order of their estimation <geo:numerical>

Put a finite parameter mesh, including endpoints, on each straight piece and each angle interval
  $\[ 0 \, pi \/ 2 \]$ of a fillet. All original lengths are at most two,
  so a sufficiently fine fixed mesh gives maximum arclength spacing at most any prescribed fixed $D > 0$.
  For the proof, a mesh entry means its exact point $Z'$ and its exact tangent on its underlying actual piece.
  The implementation computes approximations to these entries.

At most five endpoint-word distance statistics are needed: the four ordinary edge roles and the special edge.
  Each estimates

#[#set math.equation(numbering: n => "(10.22)")
 $ ell_(u v)^2 = m^(- 1) sum_(j = 1)^m \( E_u \( j \) - E_v \( j \) \)^2 . $ <geo:length-statistic>]

Use the same coordinate in the two words. The true nonconstant lengths are in $\[ d_(*) \, 1 \]$;
  clamp their estimated square roots to $\[ d_(*) \/ 2 \, 2 \]$.
  The formulas for trim points, straight tangents, and (10.7)–(10.7) then have only bounded denominators separated
  from zero. Their coordinates are uniformly continuous functions of the endpoint bits at that coordinate,
  the lengths, and the finitely many fixed trigonometric mesh constants.
  Thus correct endpoint bits and sufficiently accurate length and public constant approximations give any desired
  component error, uniformly in the coordinate and in $m$. A component error at most $z$ everywhere gives
  full-vector norm error at most $2 z$.

Also estimate the fourth-block mean $mu$. For each of the at most 32 meshed roles,
  estimate each exact mesh point’s squared distance by the sum of its four block means,

#[#set math.equation(numbering: n => "(10.23)")
 $ lr(bar.v.double X - Z' bar.v.double)^2 = sum_(b = 1)^4 m^(- 1) sum_j \( X_b \( j \) - Z'_b \( j \) \)^2 .
   $ <geo:mesh-statistic>]

Finally reserve the corresponding outside-radius statistic for the exact point $Z_mu$.
  Physical samples and endpoint-bit samples in a summand use the same $j$.
  One may use separate batches for every statistic and alternative role.
  Before a numerical winner is selected, reserve the final matching-coordinate requests for all eight word roles,
  as well as the matching physical coordinate. Inactive requests may later be omitted or use public defaults.

These data define the numerical estimator. Use the estimated mean to choose the inside or outside prescription,
  with a fixed rule at equality. For the inside prescription,
  select an admitted mesh entry with minimum estimated squared distance, again with a fixed rule for ties.
  Clamp that estimate at zero and take its square root. Substitute this scalar radius,
  the computed tangent component, and the computed component of $Z' - X$ into the component formula (10.15);
  its last regime gives the default value. The radius is supplied by the statistic,
  not by a full-vector norm computation. For the outside prescription,
  clamp the outside squared-radius estimate at zero and take its square root.
  Use this radius, the estimated mean, and the special matching bits in (10.16).
  Bounded clamping and final dyadic rounding will make this a bounded procedure on every trial.
  We next prove that the estimates are accurate and that the resulting component is stable under approximate
  minimization and side selection.

Here is a precise reason that estimates based on earlier approximate lengths still satisfy the required
  concentration statement. Fix $X$, the rounded seeds, and one possible actual reference assignment.
  The exact functions in (10.22), $mu$, (10.23), and the outside-radius statistic are fixed functions of the
  sample index; they do not depend on an estimated length or a numerical winner. They have bounded ranges:
  a squared physical difference is at most nine, and the sum of four such terms is at most 36.
  Apply part Definition 10.6 to these exact functions. On the event of correct sampled bits,
  earlier good length estimates and good numerical constants perturb every implemented summand by a uniformly
  small amount. For example if $\| z - z' \| lt.eq t$ and $x \, z \, z' in \[ - 2 \, 3 \]$, then

$ \| \( x - z \)^2 - \( x - z' \)^2 \| = \| z - z' \| \| 2 x - z - z' \| lt.eq 10 t . $

Clamps keep all approximations in one such fixed range. The analogous bound for replacing a physical read by its
  quantized representative is the same. For the outside point,
  a good mean estimate changes all fourth coordinates by at most its scalar error;
  the other coordinates use special-word bits. It follows that concentration of the exact statistics yields
  accuracy of all implemented statistics after these small deterministic perturbations.
  No assertion conditioned on the earlier estimates is being used.

For independent uniform sampling, this concentration needs no external input.
  If $\| f \| lt.eq M$, independence gives $"Var" \( q^(- 1) sum_(j = 1)^q f \( K_j \) \) lt.eq M^2 \/ q$.
  Chebyshev’s inequality gives failure probability at most $M^2 \/ \( q z^2 \)$ at tolerance $z$;
  a union bound handles the fixed finite list. In the outer application the batches are instead stationary under
  the output-coordinate average. The concentration calculation in Section 6 supplies the same required small
  failure probabilities for these fixed functions. The geometry uses that conclusion,
  and does not condition on a gray acceptance pattern, a realized mesh winner, or a particular output coordinate.

#thm([Lemma 10.10.])[
  (Uniform component stability).  #emph[Fix a positive desired component error $e$.
    Mesh resolution, quantization width, scalar tolerances, and precision of public constants can be chosen so
    that, whenever all relevant decisions, exact scalar statistics, and requested bits are good,
    the local procedure’s component error is at most $e$ at every $X$ outside the endpoint neighborhood.
    The bound holds for every output coordinate, even if the approximate winner depends on that coordinate.
    It also holds with arbitrary tie choices between numerically minimizing entries.]
] <geo:stability>

#proof[
  For the inside prescription, consider the selected mesh entry.
    Let $z > 0$ bound every squared-distance error, including the parameter, bit, quantization,
    and scalar-statistic errors just discussed. Suppose first that $r = "dist" \( X \, cal(L) \) lt.eq 3 tau$.
    By Lemma 81, a minimizing piece is present. A mesh point at arclength at most $D$ from its projection has
    squared excess at most $2 r D + D^2$. Every admitted exact entry is on the actual curve,
    so none has negative excess. The exact point $Z'$ underlying the approximate winner therefore has
  #[#set math.equation(numbering: n => "(10.24)")
   $ 0 lt.eq g = lr(bar.v.double X - Z' bar.v.double)^2 - r^2 lt.eq 2 r D + D^2 + 2 z . $ <geo:winner-excess>]
  Choose $D \, z$ first small enough that the right side is at most $tau^2$, and then still smaller as required.
    Equations (10.12)–(10.12) show that both its point and tangent approach those of the true projection in
    infinity norm, uniformly. Correct endpoint bits at the final matching coordinate also make its computed point
    and tangent close to their exact values. Clamping a squared-radius estimate at zero and taking square root is
    uniformly continuous on the fixed bounded interval. Consequently its estimated radius approaches $r$.
  Each component of (10.15) is a bounded continuous expression in that radius, the tangent component,
    and the components of $Z - X$. The formulas match at $tau \, 2 tau \, 3 tau$,
    and the only reciprocal radius is protected by $r gt.eq tau$ in its regime.
    Safe clamping can be used at approximate regime boundaries.
    Uniform continuity on these fixed compact ranges proves the desired component error.
    Crucially, the infinity-norm bounds hold for every good candidate satisfying (10.24);
    they therefore also hold when the chosen candidate is correlated with the requested coordinate.
  If the true inside radius is $r > 3 tau$, the true field is default.
    Every actual candidate entry has distance at least $r$. Good squared distance estimates can yield a nondefault
    computed expression only arbitrarily near the $3 tau$ cutoff as $z$ tends to zero.
    Near that cutoff the coefficient of $T$ tends to zero and the coefficient of $upright(bold(e))$ tends to one,
    uniformly on the clamped coordinate ranges. Thus the computed value approaches default.
    If its radius estimate is at least $3 tau$, it is already default.
    Coverage far from the curve is not needed in either case.
  For the outside prescription, use the special bits, the estimated mean and outside squared radius in (10.16).
    Correct special matching bits and good statistics make all its scalar and coordinate arguments close to their
    exact values. The same protected denominators and compact-range continuity apply, and $h_mu$ is continuous.
    This includes the special top, where the exact value is $- upright(bold(e))$.
  Finally consider the choice between the inside and outside computations.
    If it differs from the side of the true mean, a good estimate forces $\| mu - 1 \/ 2 \|$ to be small.
    In the interface slab all endpoints remain far, and the only possible close piece is the always included
    vertical. The inside computation is therefore valid for the inside prescription extended to that slab.
    The outside computation is valid for its extension using the clamped $h_mu$.
    By Lemma 77, the two target values differ componentwise by at most $6 \| mu - 1 \/ 2 \|$.
    Adding that error proves stability even with the wrong side choice.
    These cases include exact mean, radius, and minimum ties,
    without requiring a reliable hidden-real comparison at zero gap. ◻
]

=== 10.7 Average accuracy and finite answer trees <geo:finite-schema>

#proof[
  #strong[Oracle accuracy with fixed references.] Fix a desired $a > 0$.
    Choose a component error $e > 0$ and failure budget $p > 0$ so that
  #[#set math.equation(numbering: n => "(10.25)")
   $ 4 e^2 + 16 B_1^2 p < a^2 . $ <geo:accuracy-budget>]
  First choose the mesh, scalar tolerances, quantization width, and public numerical precision for Lemma 82,
    with slack for final output rounding. Fix scalar sample counts that give its concentration events a total
    failure probability below a chosen part of $p$. The eight word roles, 32 piece roles,
    five possible length statistics, mean, mesh-distance statistics,
    and outside-radius statistic now determine a fixed number $N_(upright("call"))$ of high-level completed calls.
    This count includes all sampled bit requests and all matching final bit requests over the possible relevant
    true references and flag alternatives.
  Make validation and edge-flag errors small enough for their total budget.
    For every remaining high-level bit call require average error smaller than the allocated part of $p \/
    N_(upright("call"))$. Analyze each call on its possible fixed reference before conditioning on acceptance or
    on the numerical winner. Parts Definition 10.6–Definition 10.6 of the access contract and a union bound then
    charge the event of #emph[any] required bit, decision, or statistical error by at most $p$.
    Independence of these events is unnecessary. A fixed reference does not have to be selected on every good
    trial; the unconditioned analysis simply pays for its possible calls in advance.
    Validation failures, including any acceptance with no proper reference, are charged separately.
    The two special-word roles are charged in exactly the same way when their supply is virtual.
  On the complement of the charged failure event, component error is at most $e$ by Lemma 82 and the planned final
    rounding. On every outcome clamp the numerical answer to $\[ - B_1 \, B_1 \]$ and round to a sufficiently fine
    fixed dyadic grid there. Detected invalid numerical inputs may return any fixed bounded default.
    Undetected incorrect choices are already included in the failure event.
    The true field satisfies (10.3), so the component error on an arbitrary outcome is at most $2 B_1$. Hence
  $ 4 bb(E) \| hat(v)_I \( X \) - v_I \( X \) \|^2 lt.eq 4 e^2 + 16 B_1^2 p < a^2 . $
  This proves (10.21) unconditionally over the output-coordinate and trial law.
    It does not assert correctness conditioned on a rare selected coordinate or branch.
    The proof began with arbitrary fixed admissible offsets, so it applies to each such pair,
    and therefore also after averaging any chosen laws on them.
  #strong[Finite oracle implementation.] Here are the finite implementation and raw-address details.
    Fix a small rational bin width $h > 0$ and compare each physical scalar read to thresholds $a + k h +
    zeta$ on a fixed interval larger than $\[ - 1 \, 2 \]$, where $zeta$ is an offset modulo $h$.
    Clamp at the endpoints. Representatives can depend just on the bin number, on a fixed rational grid,
    and are within $O \( h \)$ of the input for every $zeta$.
    This error was included in the earlier tolerance choice. Comparisons whose answers are forced by the allowed
    physical range can be public. Seed bits use the common threshold $xi$.
    Each offset may eventually range over a fine finite rational grid.
    No numerical assertion above requires a continuous offset distribution.
  There are now only finitely many bits and bin indices in the geometric computation.
    Public rational approximations to the fixed mesh sine and cosine values, protected length normalizations,
    clamped square roots, and all other numerical expressions can be tabulated to the chosen precision.
    Bounded Boolean lookup implements the resulting answer function.
    In particular neither an exact curve minimum nor an unbounded hidden vertex name or transcript is processed by
    the local Boolean computation. Public index arithmetic and any caller-specific field or interpolation
    calculations are performed when constructing the corresponding fixed branch and its wiring.
  Wrong validation, flag, or type answers can invoke a reserved symbolic routine on an unsuitable seed or select
    another reserved role. Wrong length, radius, side, or minimum answers select a fixed mesh or lookup case.
    None of these answers supplies a new word-coordinate address:
    statistical coordinates remain the preallocated coordinates and final data remain at $J$.
    Inactive or nonsensical roles may use public-zero defaults,
    which require no query to a distinguished physical position.
    Consequently direct scalar reads have the matching or prescribed statistical marginals on every fixed
    hypothetical oracle branch. This proves the structural assertion of part (iii),
    without inspecting the physical realization of a supplied oracle answer.
    A constant number of choices from polynomially enumerable oracle-level public spaces has polynomial support;
    a constant product of rational probabilities of polynomial bit complexity has polynomial bit complexity.
    Public indices, oracle descriptions, and bounded answer tables retain the same polynomial construction bound.
    This proves the oracle-level enumerability assertion of part (iii).
  #strong[Physical read load under the additional hypothesis.] For part (iv),
    now assume the additional physical-read hypothesis Definition 10.6.
    The supplied routines then have its all-branch primitive bounds, even on unsuitable seeds.
  Only at this point, after all requested accuracies and the repetitions implementing them have been fixed,
    unfold the full lower-level answer tree. Give unused possible nodes their prescribed public random choices as
    well. It has a fixed finite number $H$ of potential primitive slots.
    For a domain of size $M$, let $C_ell \/ M$ bound the probability that slot $ell$ reads any specified position,
    for its fixed symbolic branch under the unconditioned public law.
    A slot not using this domain has $C_ell = 0$. Summing gives
  #[#set math.equation(numbering: n => "(10.26)")
   $ bb(E)_(I \, thin upright("trial")) \[ upright("number of potential reads of position ") j \] lt.eq
     frac(sum_(ell = 1)^H C_ell, M) = C / M . $ <geo:raw-load>]
  This counts all wired possibilities rather than conditioning on the executed path.
    Omitting an inactive occurrence only reduces its unconditioned mass.
    In particular this argument does not require accuracy on wrong branches.
    The high-level count $N_(upright("call"))$ used for the correctness union bound preceded amplification;
    the larger count $H$ is used for raw load and subsequent gate-failure accounting.
    It is not fed back into the choice of the accuracy that determines $H$.
  Refining offset grids changes the values of thresholds for a fixed finite set of comparisons.
    It changes neither the bin width and bin count, nor the mesh, nor the symbolic answer-tree slots,
    nor a fixed branch’s address primitive. Thus $H$ and $C$ remain uniform under that refinement.
    Under the stated polynomial enumerability premise for the physical routines,
    a constant number of their public choices, also at unused tree nodes,
    again has polynomial support and rational-probability bit complexity.
    Their public addresses and bounded answer tables are constructed in polynomial time.
    This proves the physical enumerability assertion of part (iv) and completes the proof. ◻
]

#prodef([Remark 10.11.])[
  (Late margins under physical realization).  Assume the additional physical-read hypothesis Definition 10.6.
    Its grid uniformity explains the margin order for the fully expanded physical schema in part (iv).
    Once the full number of physical comparison slots is fixed,
    a uniform $K$-point threshold grid on an interval of length $L_0 > 0$ satisfies, for every fixed scalar $x$,
  $ Pr \( \| x - xi \| lt.eq d \) lt.eq 2 \/ K + 4 d \/ L_0 . $
  For an offset grid modulo $h$, the probability of lying within $d$ of any bin boundary is at most $4 \/ K +
    8 d \/ h$. To see these bounds, intersect the relevant interval of length $2 d$ with the equally spaced grid;
    each interval contains at most its length divided by the mesh spacing plus two points.
    Modulo $h$ there are at most two intervals after wraparound. These enlarged constants cover the endpoints.
  Fix an output coordinate and all nonthreshold public choices on every hypothetical branch.
    Each possible raw address is then fixed under the address contract, regardless of the eventual branch.
    A union bound over their fixed finite list, first choosing the offset grids fine enough and then a positive
    rational margin small enough, makes the probability of any small-gap comparison as small as prescribed,
    uniformly in $X$. No search over offsets or enlargement of the hidden-answer tree is involved.
    These margin losses are separate from (10.21); the latter already holds for each fixed admissible offset.
    Occurrence-dependent perturbations within the margin are allowed because the full list was charged before
    following any branch. For an application using only the oracle contract,
    this argument does not account for physical comparisons inside substituted oracle gadgets.
    The outer construction uses its own direct-read and functional-boundary margin analysis in Section 6,
    together with the port theorem and its separate physical substitution count.
] <geo:late-margins>

The geometric procedures are now proved independently of both circuit constructions.
  Together with the port construction in Section 9, they establish the two interfaces used in Section 6,
  completing the proof of Theorem 3.

== 11 Consequences for games and markets <sec:weak-nash>

Theorem 3 supplies the positive failed-gate premise in the cited reductions to equilibrium problems.
  We first put its circuits into the forms those reductions use.
  This preparation, together with the finite-witness checks below,
  makes the transfers precise for our gate conventions and complete binary encodings.
  The applications then concern weak and relative Nash equilibria, allocation and market equilibria,
  and stationary equilibria in discounted games. Their approximation requirements differ,
  so we specify each target relation before stating its consequence.

=== 11.1 Circuit preparation for the applications <circuit-preparation-for-the-applications>

The Boolean tolerance in Definition 2 is nonmonotone. We therefore remove Boolean gates before reducing numerical
  tolerances or controlling fan-out. The two stages of the following lemma are used separately below.

#thm([Lemma 11.1.])[
  (Common circuit interfaces).  #emph[There are fixed positive rational constants $eta \, gamma \, tau \,
    gamma_2$ and deterministic polynomial-time constructions which, from any End-of-Line instance $I$,
    produce circuits $G_(upright("nb"))$ and $G_2$ using only Constant, Scale, Copy, Add, Subtract, and Less.
    Their parameters lie in $\[ 0 \, 1 \]$, and every used node has a defining gate.
    The circuit $G_2$ has fan-out at most two.]
  #emph[Every assignment of $G_(upright("nb"))$ satisfying all but a $gamma$ fraction of its gates at tolerance
    $eta$, and every assignment of $G_2$ satisfying all but a $gamma_2$ fraction at tolerance $tau$,
    can be converted to an assignment of $R \( I \)$ meeting the tolerances of Theorem 3.
    For rational assignments the conversion and the resulting End-of-Line decoder take time polynomial in the
    input length plus the total assignment encoding length.]
] <lem:application-circuits>

#proof[
  Let $epsilon_c \, delta_c$ be the constants in Theorem 3, and let $G = \( V \, T \) = R \( I \)$.
  #strong[Removing Boolean gates.] First give every used node a defining gate, if necessary.
    A node used as an input but not defined by a gate can be given the self-copy gate
    $upright("Copy") \( v \; v \)$, which every assignment satisfies.
    There are at most $2 \| T \|$ such nodes, because the original gates have at most $2 \| T \|$ input positions.
    Thus the new gate count is at most $3 \| T \|$; reducing the permitted failed-gate fraction by a factor three
    compensates. Unused nodes may be omitted and later assigned zero.
  On this gate list, use the strong-Boolean relation of Schuldenzucker and Seuken at the same tolerance
    $epsilon_c$. Their Proposition 2 shows gatewise that a strong-Boolean $epsilon_c$ solution satisfies the
    weak-Boolean relations in Definition 2, since $epsilon_c < 1 \/ 10 < 1 \/ 4$.
    Their Lemma 1 replaces each Boolean gate by a constant-size gadget with no Boolean gates,
    such that an $epsilon_c \/ 2$ solution restricts to a strong-Boolean $epsilon_c$ solution.
    Their Section 6 records the same reduction with a positive failed-gate fraction:
    the constant-size gadgets lose only a constant factor in that
    fraction #cite(label("SchuldenzuckerSeuken2019")) Proposition 2, Lemma 1, and Section 6.
    The comparison gate in that paper has the opposite orientation from $upright("Less")$ here,
    so we swap its two inputs. The new parameters remain bounded rationals.
  Consequently there are fixed positive rationals $eta = epsilon_c \/
    2$ and $gamma$ and a polynomial-time constructed circuit $G_(upright("nb"))$ using only Constant, Scale, Copy,
    Add, Subtract, and Less such that any assignment satisfying its gates at tolerance $eta$ with at most a
    $gamma$ fraction of failures yields an assignment of $G$ satisfying the original $epsilon_c \,
    delta_c$ bounds. All scale factors are at most one. This no-Boolean relation is monotone in its numerical
    tolerance. We use that monotonicity only after this conversion;
    at no point is a weak-Boolean gate reclassified at a larger tolerance.
  #strong[Fan-out reduction with fixed slack.] We spell out the precision and failure accounting in the fan-out
    steps of #cite(label("BPR2016")) proof of Theorem 2, pp. 4–5.
    Suppose $G_(upright("nb"))$ has $m$ gates, put $gamma_0 = min { gamma \, 1 \/ 4 }$, and set
  $ D = ceil.l 8 \/ gamma_0 ceil.r \, wide eta_1 = eta \/ 3 \, wide gamma_1 = gamma_0 \/ 4 . $
  There are at most $2 m$ outgoing wire occurrences in total,
    hence at most $gamma_0 m \/ 4$ gates with fan-out at least $D$. Delete those gates.
    For each wire from a deleted output into a retained gate,
    supply an independent $upright("Constant") \( 0 \)$ gate.
    The resulting circuit has at most $3 m$ gates and fan-out less than $D$.
  Given an assignment to this circuit, restore each deleted output as zero.
    A failed new constant can spoil only its one receiving gate.
    A new constant satisfied at tolerance $eta_1$ changes its receiving input by at most $eta_1$ under
    restoration. For a retained arithmetic gate satisfied at tolerance $eta_1$,
    the residual after changing its two inputs increases by at most $2 eta_1$; this uses the scale bound one.
    For Less, an original input gap greater than $3 eta_1$ remains greater than $eta_1$ after those two changes,
    so its required output also remains valid at tolerance $3 eta_1 = eta$.
    Therefore, if $f_1$ gates failed before restoration, at most $gamma_0 m \/ 4 +
    f_1$ original gates can fail at tolerance $eta$. The bound $f_1 lt.eq
    gamma_1 \( 3 m \)$ makes this at most $gamma_0 m$. This also shows why a smaller numerical tolerance is used
    when the replacement constants are made exact. The large-multiplier step in the cited construction is
    unnecessary for our bounded scale factors.
  Next route the $d > 2$ outgoing wires of each remaining gate through a balanced binary tree of Copy gates.
    One may use at most $2 d$ new gates and depth at most
  $ h = ceil.l log_2 D ceil.r + 1 . $
  If the preceding circuit has $m_1$ gates, there are at most $2 m_1$ wire occurrences,
    so the new fan-out-two circuit has at most $5 m_1$ gates. Use the fixed parameters
  $ tau = frac(eta_1, 2 \( 2 h + 1 \)) \, wide gamma_2 = frac(gamma_1, 5 D) . $
  When every Copy gate on a route is $tau$-satisfied, its leaf differs from the root by at most $h tau$.
    The same arithmetic and comparison check shows that a retained gate satisfied at tolerance $tau$ becomes
    satisfied at tolerance at most $\( 2 h + 1 \) tau < eta_1$ when its inputs are restored to the roots.
    A failed Copy gate has fewer than $D$ descendant receiving gates.
    Charging these receivers, and charging each failed retained gate to itself,
    loses at most $D$ retained gates per failed gate. Thus at most a $gamma_2$ fraction of failures in the new
    circuit produces at most a $gamma_1$ fraction in the preceding one.
    All depths, blowups, and tolerance losses are fixed independently of $I$.
  Denote the final fan-out-two circuit by $G_2$. All instance maps have polynomial bit cost:
    they copy bounded rational parameters and introduce only fixed rational constants.
    Their solution maps restrict assignments, restore zero values, or copy existing coordinates,
    so they also have polynomial bit cost on rational inputs.
  The resulting assignment of $G$ need not obey the particular witness polynomial $p \( M \)$ in Definition 2.
    This causes no restriction on the decoder. The argument after (6.21) proves soundness for every real
    assignment meeting the gate-failure budget, and gives a deterministic decoder for rational assignments in time
    polynomial in $N$ plus their total encoding length. Applying it proves the stated interface. ◻
]

=== 11.2 Weak approximate Nash equilibria <weak-approximate-nash-equilibria>

Babichenko, Papadimitriou, and Rubinstein reduce positive-gap generalized circuits to weak approximate Nash
  search, where a fixed fraction of players may have deviation gain larger than a fixed positive
  error #cite(label("BPR2016")) Definition 4 and Theorem 2. Lemma 84 supplies the required circuit interface.
  We retain the normalization and finite-witness details of the transfer.

An $n$-player two-action polymatrix game is specified by an undirected interaction graph and, for each edge,
  a pair of rational $2$-by-$2$ payoff matrices. Each player chooses action $0$ or $1$ and receives the sum of its
  payoffs on incident edges. We use matrices with entries in $\[ 0 \, 1 \/ 3 \]$ and graphs of maximum degree at
  most three, so every total payoff lies in $\[ 0 \, 1 \]$.
  The encoding explicitly lists all players, edges, and matrices, so its length is at least $n$.
  For a product mixed-strategy profile $sigma$, write

$ "reg"_i \( sigma \) = max_(a in { 0 \, 1 }) u_i \( a \, sigma_(- i) \) - u_i \( sigma \) $

for player $i$’s possible gain from deviation. A rational profile is encoded by the binary rational probabilities
  $sigma_i \( 1 \) in \[ 0 \, 1 \]$.

#thm([Corollary 11.2.])[
  (Fixed-gap weak approximate Nash hardness).  #emph[There are fixed positive rational constants
    $epsilon_(upright(w)) \, delta_(upright(w))$ and a fixed polynomial $p_(upright(w))$ for which the following
    search problem is PPAD-hard under deterministic polynomial-time many-one search reductions.
    Given an explicitly encoded rational two-action polymatrix game of maximum degree at most three with the
    normalization above and complete binary length $L$, find a rational product profile of total encoding length
    at most $p_(upright(w)) \( L \)$ such that
#[#set math.equation(numbering: n => "(11.1)")
 $ \| { i : "reg"_i \( sigma \) > epsilon_(upright(w)) } #scale(x: 120%, y: 120%)[\|] lt.eq
   floor.l delta_(upright(w)) n floor.r . $ <eq:weak-nash>]

 No further regret bound is imposed on the players counted on the left.]
] <cor:weak-nash>

#proof[
  Use the fan-out-two circuit of Lemma 84, with numerical tolerance $tau$ and failure allowance $gamma_2$.
  #strong[The game reduction.] For a fan-out-two generalized circuit,
    the gate construction in Rubinstein #cite(label("Rubinstein2018")) Section 7,
    used in the forward reduction of #cite(label("BPR2016")) Theorem 2,
    has two actions per player and maximum degree at most three.
    If the players of a gate gadget use only actions within $xi_0$ of a best response,
    their node probabilities satisfy that gate at tolerance $2 xi_0$.
    Choose a fixed positive rational $xi_0 < tau \/ 2$. These bounds imply our no-Boolean gate relations at
    tolerance $tau$: an antecedent for Less at tolerance $tau$ is also an antecedent at tolerance $2 xi_0$,
    and the arithmetic and output bounds are stronger. The scale gadget’s output $min { alpha x \,
    1 }$ equals $alpha x$ here because $alpha lt.eq 1$. Each gate uses a fixed number of players,
    and a player belongs to only a fixed number of gate gadgets.
    Hence there are fixed integers $C_1 \, C_2$ such that the game has at most $C_1$ times as many players as
    circuit gates and each player not meeting the well-supported condition can spoil at most $C_2$ gates.
    Choose a fixed positive rational
  $ delta_(upright(w)) lt.eq frac(gamma_2, C_1 C_2) . $
  The decoded circuit assignment then meets its failure budget whenever all but a $delta_(upright(w))$ fraction of
    players meet that condition.
  The gadget matrices have rational entries bounded in absolute value by a fixed rational $B gt.eq 1$:
    their variable scale parameters lie in $\[ 0 \, 1 \]$, and all other gadget constants are fixed.
    Replacing every payoff entry $a$ by $\( a + B \) \/ \( 6 B \)$ puts the entries in $\[ 0 \, 1 \/ 3 \]$.
    For each player this adds an action-independent constant and scales every deviation gain by $lambda =
    1 \/ \( 6 B \)$. Put $xi = lambda xi_0$. Thus the needed well-supported tolerance in the normalized game is
    the fixed positive rational $xi$.
  Choose a fixed rational $t > 0$ such that $t \( t + 13 \) < xi$, and put $epsilon_(upright(w)) = t^2$.
    We use the local pruning argument of Rubinstein #cite(label("Rubinstein2018")) Lemma 5;
    this is the lemma cited with an earlier number in the proof of BPR’s Theorem 2.
    For every player whose regret is at most $t^2$, remove actions whose payoff is more than $\( 1 + 1 \/ t \)
    t^2$ below its best response and renormalize. Leave the other players unchanged.
    The regret bound ensures that the removed probability is less than one.
    The lemma’s calculation, with incoming degree at most three and total payoffs in $\[ 0 \, 1 \]$,
    shows that every retained action of each formerly happy player is within
  $ t \( t + 1 + 4 dot.op 3 \) = t \( t + 13 \) < xi $
  of a best response after all these changes. Unchanged unhappy neighbors contribute no change to that
    calculation. The fraction of players not meeting the well-supported condition therefore does not increase.
    This gives the required circuit assignment from any profile satisfying (11.1).
  #strong[Rational witnesses and decoding.] All instance maps above have polynomial bit cost.
    The auxiliary constants are fixed rationals, and the game matrices copy bounded rational gate parameters
    through fixed-size gadgets. For a rational profile, its regrets require only a fixed number of rational
    operations per player. The pruning threshold is rational, so exact comparisons, deletion of actions,
    and renormalization have polynomial bit cost. The extracted node probabilities, restrictions,
    and restored zero values consequently form a rational assignment of polynomial total encoding length.
  Lemma 84 decodes this assignment in its total encoding length,
    so the particular witness polynomial $p \( M \)$ of Definition 2 imposes no additional condition here.
  Finally, the finite target search relation has a polynomial witness bound.
    Round the probabilities of a mixed Nash equilibrium to a grid of denominator $q$,
    where the fixed integer $q$ is greater than $3 \/ epsilon_(upright(w))$.
    With entries in $\[ 0 \, 1 \/ 3 \]$ and degree at most three,
    each pure-action payoff changes by at most $1 \/ q$ when the neighboring probabilities are rounded.
    Changing the player’s own probability changes its payoff by at most another $1 \/ q$.
    Its resulting regret is therefore at most $3 \/ q < epsilon_(upright(w))$.
    A fixed polynomial $p_(upright(w))$ can encode these $n$ rational probabilities.
    Satisfaction of (11.1) is checked by rational arithmetic in polynomial time.
    The composed instance map and solution decoder establish the stated search reduction. ◻
]

=== 11.3 Relative approximate bimatrix equilibria <relative-approximate-bimatrix-equilibria>

For a rational bimatrix game $\( A \, B \)$ with $A gt.eq 0$ and $B lt.eq 0$ entrywise,
  a pair of mixed strategies $\( x \, y \)$ is a relative $epsilon_(upright(r))$-approximate Nash equilibrium if

#[#set math.equation(numbering: n => "(11.2)")
 $ x^(sans(T)) A y gt.eq \( 1 - epsilon_(upright(r)) \) max_i \( A y \)_i \, wide
   x^(sans(T)) B y gt.eq \( 1 + epsilon_(upright(r)) \) max_j \( x^(sans(T)) B \)_j . $ <eq:relative-nash>]

The plus sign in the second inequality reflects the column player’s nonpositive payoffs:
  each player’s loss is at most $epsilon_(upright(r))$ times the absolute value of its best-response payoff.
  These are conditions on expected payoffs, not on every action in the support.

#thm([Corollary 11.3.])[
  (Relative approximate Nash hardness).  #emph[There are a fixed rational $0 < epsilon_(upright(r)) <
    1$ and a fixed polynomial $p_(upright(r))$ such that the following search problem is PPAD-complete under
    deterministic polynomial-time many-one search reductions.
    Given an explicitly encoded rational bimatrix game $\( A \, B \)$ with $A gt.eq 0$, $B lt.eq 0$,
    and complete binary length $L$, find a rational mixed-strategy profile of total encoding length at most
    $p_(upright(r)) \( L \)$ satisfying (11.2).]
] <cor:relative-nash>

#proof[
  Apply the implication from Conjecture 2 to Theorem 3 in #cite(label("BPR2016")) Section 4.
    This published chain passes through a bipartite degree-three family of weak approximate Nash instances.
    Theorem 3 supplies its fixed-tolerance circuit premise on a bounded-rational subclass,
    and Lemma 84 makes the gate-basis and fan-out preparation explicit.
    No change of weak-Boolean tolerance is needed. The remaining polynomial reduction gives hardness for a fixed
    positive relative error; choosing a smaller positive rational error only strengthens the requirements.
    Its marginal and conditional-probability decoder uses polynomial-time rational arithmetic.
    Composing with the circuit decoder after (6.21), which is polynomial in the total rational assignment length,
    gives the required search reduction.
  For membership, an exact Nash equilibrium of the same game satisfies (11.2).
    Exact rational bimatrix Nash belongs to PPAD, and every rational bimatrix game has an exact equilibrium of
    polynomial encoding length #cite(label("CDT2007Preprint")) Theorem 1.1 and Section 2.
    Choose $p_(upright(r))$ to accommodate that bound. The displayed inequalities are checked by polynomial-time
    rational arithmetic, so the stated finite search problem is total and belongs to PPAD. ◻
]

=== 11.4 Indivisible course allocation <indivisible-course-allocation>

We also apply the course-allocation implication of Babichenko, Papadimitriou,
  and Rubinstein #cite(label("BPR2016")) Theorem 4 and Appendix B.
  There are $M gt.eq 1$ courses with nonnegative integer capacities $q_j$ and $N gt.eq 1$ students.
  Each student’s acceptable bundles are explicitly listed in strict preference order,
  with the empty bundle as a final, always-available choice; let $k$ be the maximum bundle size.
  At prices $p_j gt.eq 0$ and budgets $b_i > 0$, each student receives its most-preferred bundle $x_i in { 0 \,
  1 }^M$ satisfying $p dot.op x_i lt.eq b_i$. Budish’s clearing convention and guaranteed threshold are
  #cite(label("Budish2011")) Definition 1 and Theorem 1

$ z_j = cases(delim: "{", sum_i x_(i j) - q_j \, & p_j > 0 \,, max { sum_i x_(i j) - q_j \, 0 } \, & p_j = 0 \,)
  wide alpha_(*) = sqrt(M min { 2 k \, M }) / 2 . $

For positive budgets, their Gini coefficient is

$ "Gini" \( b \) = frac(sum_(i \, h) \| b_i - b_h \|, 2 N sum_i b_i) . $

#thm([Corollary 11.4.])[
  (Low-Gini course-allocation hardness).  #emph[There are a fixed rational $0 < gamma_(upright(c)) < 1 \/
    2$ and a fixed polynomial $p_(upright(c))$ such that the following search problem is PPAD-complete under
    deterministic polynomial-time many-one search reductions.
    Given the explicit lists and capacities above, of total binary length $L$,
    find rational prices and positive rational budgets, together with the demanded bundles,
    of total encoding length at most $p_(upright(c)) \( L \)$, satisfying
$ lr(bar.v.double z bar.v.double)_2 lt.eq alpha_(*) \, wide "Gini" \( b \) lt.eq gamma_(upright(c)) . $

]
] <cor:course-allocation>

#proof[
  Use the no-Boolean, fan-out-two circuits of Lemma 84, with their fixed positive numerical and failed-gate
    tolerances. The published reduction in #cite(label("BPR2016")) Appendix B.2–B.3 applies to this
    bounded-rational subclass: after common normalization of prices and budgets,
    any invalid circuit decoding forces the Gini coefficient to be at least a fixed positive constant.
    Choose $gamma_(upright(c))$ strictly below that bound. Median normalization and price extraction have
    polynomial bit cost on rational outputs. Composing with the circuit decoder after (6.21) therefore gives the
    hardness reduction, with time polynomial in the input and total witness length.
  For membership, Othman, Papadimitriou, and Rubinstein #cite(label("OPR2014")) Appendix A,
    Remarks 1–2 prove that computing an allocation at this clearing threshold with budgets in
    $\[ 1 \, 1 + beta \]$ belongs to PPAD in the explicit-list model, for every fixed rational $beta > 0$.
    Choose a rational $0 < beta < gamma_(upright(c))$. Such budgets have Gini coefficient at most $beta \/ 2 <
    gamma_(upright(c))$; existence is guaranteed by #cite(label("Budish2011")) Theorem 1.
    The budget interval selects solutions for membership and is not an additional requirement of the target problem.
  Polynomial-size rational witnesses can also be seen directly.
    Fix such an allocation and its zero-price pattern, and cap prices at $2 + beta$ without changing demands.
    Keep the budget interval, these price bounds and affordability of the chosen bundles.
    Introduce a common slack $s in \[ 0 \, 1 \]$ for the unaffordability of every strictly preferred listed bundle
    and for the positivity of every positive price. Maximizing $s$ over the resulting bounded rational polytope
    has a positive optimum and a rational vertex optimum of polynomial bit length.
    Demands and the price-sign pattern, hence clearing error, are preserved.
    All target conditions are checked by rational arithmetic and enumeration of the explicit lists;
    the clearing test is equivalently $4 sum_j z_j^2 lt.eq M min { 2 k \, M }$. ◻
]

=== 11.5 Markets with approximately optimal bundles <markets-with-approximately-optimal-bundles>

The market reduction of Deligkas, Fearnley, Hollender, and Melissourgos #cite(label("Fisher2026")) uses a ternary
  circuit intermediary. We record it first; it will also supply the input to the single-controller game reduction below.

A Pure-Circuit instance consists of explicit finite lists of nodes and gates.
  An assignment $z$ gives each node a value in ${ 0 \, 1 \, tack.t }$.
  A gate $upright("NAND") \( u \, v \; w \)$ requires $z_w = 0$ if $z_u = z_v = 1$, and $z_w =
  1$ if either input is zero; otherwise it imposes no condition.
  A gate $upright("PURIFY") \( u \; v \, w \)$ requires at least one of $z_v \, z_w$ to lie in ${ 0 \, 1 }$,
  and requires $z_v = z_w = z_u$ whenever $z_u in { 0 \, 1 }$.
  Each gate uses three distinct nodes, and each node is the output of exactly one gate.
  We use the version in which each node is also an input to exactly one gate #cite(label("Fisher2026")) Section 2.2.1.

#thm([Lemma 11.5.])[
  (The input-once Pure-Circuit interface).  #emph[There are a fixed positive rational $delta_F$ and a
    deterministic polynomial-time reduction from End-of-Line to NAND/PURIFY circuits of the form just defined.
    Every ternary assignment satisfying all but a $delta_F$ fraction of the gates yields an End-of-Line solution
    in polynomial time.]
] <lem:application-pure-circuit>

#proof[
  Apply #cite(label("Fisher2026")) Theorem 2.2 and Lemma A.2 to the no-Boolean, fan-out-two circuits of Lemma 84.
    The published bridge gives a fixed positive failure allowance and makes every node an input to exactly one
    gate. Its solution decoder returns rational unary-count values, to which the decoder in Lemma 84 applies.
    All comparisons and arithmetic have polynomial bit cost. No change of tolerance for a weak-Boolean gate is
    required. ◻
]

We now define the simple market families used in the reduction.
  There is one unit of each good, and utilities have the separable form

$ u_i \( x_i \) = sum_j min { a_(i j) x_(i j) \, b_(i j) } \, wide a_(i j) gt.eq 0 \, quad b_(i j) in \[ 0 \, oo \] . $

All finite data are rational and explicitly encoded. Each buyer has nonzero utility for only a bounded number of
  goods, each good has nonzero utility for only a bounded number of buyers,
  and the ratio of nonzero slopes for each buyer is bounded. These bounds are constants for the family.
  Every buyer has at least one uncapped term of positive slope. Fisher buyers have budget one.
  In the exchange version, every buyer initially owns $1 \/ \| B \|$ units of every good,
  where $B$ is the set of buyers; in particular the endowments are identical and the economy is strongly connected.

For errors $epsilon_(upright(m)) \, delta_(upright(m)) > 0$,
  an approximate equilibrium consists of prices $p_j gt.eq 0$ and bundles $x_(i j) gt.eq 0$.
  Each bundle must be affordable and give its buyer at least $1 -
  delta_(upright(m))$ times the maximum utility attainable within that budget;
  each good satisfies $\| sum_i x_(i j) - 1 \| lt.eq epsilon_(upright(m))$.
  In the exchange case the budget is the value of the buyer’s endowment at $p$. Affordability is exact.
  Outputs are rational prices and bundles of polynomial encoding length;
  the rational-witness formulation is discussed in #cite(label("Fisher2026")) Section 2.1.

#thm([Corollary 11.6.])[
  (Approximate market equilibrium hardness).  #emph[For every fixed $0 < epsilon_(upright(m)) < 1 \/ 9$,
    there is a fixed rational $0 < delta_(upright(m)) < 1$ such that finding an
    $\( epsilon_(upright(m)) \, delta_(upright(m)) \)$-approximate equilibrium in the simple Fisher markets above
    is PPAD-hard under deterministic polynomial-time many-one search reductions.
    The same holds for their exchange-market versions with identical endowments and strongly connected economies.]
] <cor:market-hardness>

#proof[
  Use the circuits of Lemma 88. For each fixed $epsilon_(upright(m)) < 1 \/ 9$,
    #cite(label("Fisher2026")) Proposition 4.4 supplies a fixed positive $delta_(upright(m))$ and a
    polynomial-time reduction to the stated Fisher markets. Composing its solution decoder with the circuit
    decoders proves the Fisher assertion of #cite(label("Fisher2026")) Theorem 4.1 without its conjectural
    premise. For rational $epsilon_(upright(m))$, the other constants may be chosen rational within the
    reduction’s strict margins. For a nonrational fixed $epsilon_(upright(m))$,
    choose a rational clearing tolerance strictly between $epsilon_(upright(m))$ and $1 \/
    9$ and use its reduction: every solution with the smaller clearing error also satisfies the larger one.
    The Pure-Circuit bridge returns rational unary-count values; for rational market witnesses,
    all comparisons and decoding have polynomial bit cost. The decoder after (6.21) applies in the total length of
    the resulting rational assignment, without requiring the particular bound $p \( M \)$ in Definition 2.
  For the exchange markets, normalize prices so that $sum_j p_j = \| B \|$.
    Every buyer’s endowment then has value one, so the same prices and bundles give a Fisher equilibrium with
    precisely the same two errors. The positive-slope uncapped terms ensure that the price sum is nonzero at any
    approximate equilibrium. This is the transfer in #cite(label("Fisher2026")) Appendix B and Theorem B.1;
    normalization also preserves polynomial rational encoding length. ◻
]

=== 11.6 Stationary equilibria in discounted games <stationary-equilibria-in-discounted-games>

Daskalakis, Golowich, and Zhang #cite(label("DGZ2023")) obtain conditional hardness for stationary equilibria
  whose incentive constraints are averaged over an initial distribution. Their premise also follows from Theorem 3.

A finite two-player discounted stochastic game has explicitly encoded rational transition probabilities, rewards,
  and initial distribution $mu$. A stationary joint policy $pi$ assigns a distribution on action pairs to each
  state, sampled afresh at every visit. Write $pi_(- i)$ for the other player’s marginal policy and use normalized
  values

$ V_i^pi \( mu \) = \( 1 - gamma \) bb(E)_(mu \, pi) sum_(t gt.eq 0) gamma^t r_i \( s_t \, a_t \) . $

The policy is an $epsilon$-stationary Markov coarse correlated equilibrium (CCE) when

$ sup_(sigma_i) #scale(x: 120%, y: 120%)[\(] V_i^(sigma_i times pi_(- i)) \( mu \) -
  V_i^pi \( mu \) #scale(x: 120%, y: 120%)[\)] lt.eq epsilon wide \( i = 1 \, 2 \) \, $

where $sigma_i$ ranges over stationary policies chosen independently of any action recommendation.
  These constraints use the supplied $mu$, rather than requiring the bound at every state.
  An $epsilon$-stationary Nash equilibrium has the same supplied-$mu$ incentive bound and additionally requires
  $pi$ to be a product policy.

#thm([Corollary 11.7.])[
  (Stationary stochastic-game hardness).  #emph[For some fixed rational $epsilon_(upright(s)) > 0$,
    finding an $epsilon_(upright(s))$-stationary Markov CCE is PPAD-hard under deterministic polynomial-time
    many-one search reductions, even for two-player turn-based general-sum games with discount $gamma = 1 \/ 2$,
    rewards in $\[ - 1 \, 1 \]$, and at most two actions for the active player at each state.
    The inactive player’s action affects neither rewards nor transitions.
    The same hardness holds for $epsilon_(upright(s))$-stationary Nash equilibria with the same
    supplied-initial-distribution convention. Outputs are rational policy tables of polynomial encoding length.]
] <cor:stationary-game-hardness>

#proof[
  Use the no-Boolean circuit $G_(upright("nb"))$ of Lemma 84,
    with its fixed positive rational tolerance $eta$ and failure allowance $delta_(upright("nb"))$ (the constant
    $gamma$ of that lemma). The target basis in #cite(label("DGZ2023")) Definition 8 and Appendix D consists of
    exact zero/one constants, clipped linear gates, and comparison gates.
    For Scale and Copy, repeat the input with coefficient pairs $\( alpha \/ 2 \, alpha \/ 2 \)$ and
    $\( 1 \/ 2 \, 1 \/ 2 \)$, respectively; Add and Subtract use $\( 1 \, 1 \)$ and $\( 1 \, - 1 \)$.
    A Constant$\( alpha \)$ uses its own exact-one node followed by the scaled linear gate. Retain Less:
    each strict source comparison antecedent implies the corresponding weak target antecedent,
    and the target output error is smaller. Choose a positive rational target tolerance below $min { eta \,
    1 \/ 12 }$. Each original gate uses at most two target gates,
    and each failed target gate can spoil only its own original gate.
    A target failure fraction at most $delta_(upright("nb")) \/ 2$ therefore suffices.
    This proves the positive-gap premise in #cite(label("DGZ2023")) Conjecture 10; no weak-Boolean tolerance is changed.
  Apply the second assertion of #cite(label("DGZ2023")) Theorem 4.
    Its turn-based construction has the stated discount, reward bounds and binary choices.
    Taking statewise marginals of a joint policy in such a game gives a product policy with the same values and
    unilateral deviation gains, so its approximate stationary CCE decodes to an approximate stationary Nash
    equilibrium with the same error. Choose a smaller positive rational error if needed.
    The fixed reduction parameters can be chosen rational with slack.
    For rational policy tables, policy evaluation solves rational linear systems,
    and the gate decoder and restrictions have polynomial bit cost.
    The decoder after (6.21) then applies in the total rational assignment length.
    Polynomial-size rational approximate policy tables exist by rounding stationary Nash policies at this fixed
    discount, as in #cite(label("DGZ2023")) Section 2.5. ◻
]

=== 11.7 Restricted stationary-game families <restricted-stationary-game-families>

The preceding consequence also supplies the input for the triangular zero-sum construction of Park, Zhang,
  and Ozdaglar #cite(label("PZO2025")). Here the interaction graph concerns the whole auxiliary function,
  not just immediate rewards: for every $V : S arrow.r bb(R)$, each

$ Q_i^V \( s \, a \) = r_i \( s \, a \) + gamma sum_(s') P \( s' divides s \, a \) V \( s' \) $

must be a sum of functions of $\( s \, a_i \, a_j \)$ over neighbors $j$ of $i$.
  This is the Q-function separability of #cite(label("PZO2025")) Definition 1.
  Use the same normalized values and supplied-initial-distribution CCE inequalities as above,
  now for all three players, with $pi_(- i)$ the joint marginal of the other two players.

#thm([Corollary 11.8.])[
  (Triangular zero-sum stationary-game hardness).  #emph[For some fixed rational $epsilon_triangle.stroked.t > 0$,
    finding an $epsilon_triangle.stroked.t$-stationary Markov CCE is PPAD-hard under deterministic polynomial-time
    many-one search reductions even for rational three-player zero-sum games with Q-function-separable
    interactions on the fixed triangle $K_3$, discount $1 \/ 2$,
    and each player’s stage reward in $\[ - 1 \, 1 \]$. The hard games are turn-based,
    with at most two actions for the active player and a third player with only one action.
    Outputs are rational joint-policy tables of polynomial encoding length;
    incentives are required only from the supplied rational initial distribution.]
] <cor:triangle-stationary-hardness>

#proof[
  Apply the triangle construction in #cite(label("PZO2025")) Appendix C, Case 1 to Corollary 90.
    Write $c \( s \) in { 1 \, 2 }$ for the state controller and suppress inactive actions.
    Add a one-action third player and retain states, transitions and initial distribution.
    Specify oriented edge rewards before scaling by
  $ \( b_12 \, b_13 \, b_23 \) =
    cases(delim: "{", \( - r_2 \, r_1 + r_2 \, 0 \) \, & c \( s \) = 1 \,, \( r_1 \, 0 \, r_1 + r_2 \) \, & c \(
    s \) = 2 \,) wide b_(j i) = - b_(i j) . $
  Each term depends only on the actions at its edge. Divide every edge reward by two.
    The resulting total rewards are $\( r_1 \/ 2 \, r_2 \/ 2 \, - \( r_1 + r_2 \) \/ 2 \)$,
    lie in $\[ - 1 \, 1 \]$, and sum to zero. For every test function $V$,
    the continuation term in $Q_i^V$ depends only on $a_(c \( s \))$.
    Allocate it to edge ${ i \, c \( s \) }$ when $i eq.not c \( s \)$, and to any incident edge when $i =
    c \( s \)$. This proves the required separability on $K_3$ for every player and every $V$.
  The state process of any new-game policy agrees with that of its first-two-player restriction in the original
    game. Each original player’s normalized value and deviation gain in the new game is half the corresponding
    quantity in the original game; the dummy has no deviation.
    Thus error $epsilon_triangle.stroked.t = epsilon_(upright(s)) \/
    2$ suffices at the unchanged initial distribution. The primary source uses unnormalized values,
    which are twice our normalized values at discount $1 \/ 2$;
    the stated error calculation uses our convention throughout.
    All new data use only rational addition and halving, and restriction has polynomial bit cost.
    Polynomial-size rational witnesses follow by the same fixed-discount rounding argument as above. ◻
]

The single-controller construction of Farina, Kontogiannis, Panageas,
  and Pollatos #cite(label("FKPP2026")) gives a different restricted family.
  One player controls transitions at every state, while both players’ actions may affect rewards.
  Joint policies need not be product policies.

#thm([Corollary 11.9.])[
  (Single-controller stationary-game hardness).  #emph[For some fixed rational $epsilon_(upright("sc")) > 0$,
    finding an $epsilon_(upright("sc"))$-stationary Markov CCE is PPAD-hard under deterministic polynomial-time
    many-one search reductions for rational two-player single-controller games with discount $1 \/ 16$,
    rewards in $\[ 0 \, 1 \]$, and at most two actions per player per state.
    In the hard instances, the initial law is uniform on the circuit-output variable states of the cited
    construction and gives no mass to its absorbing sinks. Outputs are rational joint-policy tables of polynomial
    encoding length. The same assertion, with the same error,
    holds for every fixed rational $gamma in \[ 1 \/ 16 \, 1 \)$.]
] <cor:single-controller-hardness>

#proof[
  Lemma 88 supplies input-once NAND/PURIFY circuits with a fixed positive failed-gate allowance $delta_F$.
    Convert each NAND$\( u \, v \; w \)$ to
  $ upright("NOT") \( u \; a \) \, wide upright("NOT") \( v \; b \) \, wide upright("OR") \( a \, b \; w \) \, $
  using fresh private nodes $a \, b$, and keep PURIFY unchanged.
    These are the ternary relations on ${ 0 \, 1 \, tack.t }$ of #cite(label("FKPP2026")) Definition 2.6:
    if $u = v = 1$, the NOT outputs are both zero and OR forces $w = 0$; if either input is zero,
    its NOT output is one and OR forces $w = 1$, even when the other input is $tack.t$.
    In all other cases NAND imposes no condition. PURIFY has the same relation in both bases.
    Every node remains the input of exactly one gate, and outputs remain uniquely defined.
    An original failed gate charges a failure in its own disjoint replacement block.
    Since $m$ original gates give at most $3 m$ new gates, a failed-gate allowance $delta_F \/ 3$ suffices.
    No numerical tolerance of a weak-Boolean gate is changed.
  This establishes the premise of #cite(label("FKPP2026")) Conjecture 1.
    Apply its Theorem 5.5, choosing the fixed reduction parameters and a positive rational equilibrium error
    within the strict bounds in its equations (23)–(24). Its states consist of circuit-variable states and
    constantly many absorbing sinks; the initial law is uniform precisely on the output-variable states.
    For a rational joint policy, equation (8) of that paper decodes a node from the reward player’s marginal $p$:
    output zero for $p lt.eq 1 \/ 4$, one for $p gt.eq 3 \/ 4$, and $tack.t$ otherwise.
    Marginalization, comparison and restriction have polynomial bit cost.
    Follow these by the Fisher unary-count decoder and the decoder after (6.21).
    At fixed discount, rounding stationary equilibrium policies with slack gives polynomial-size rational
    witnesses; policy evaluation and best-response optimization are rational finite-state discounted MDP
    computations. No collapse of correlated policies to Nash policies is used in this reduction.
  Finally, the extension in #cite(label("FKPP2026")) Remark 5.7 preserves the normalized incentive inequalities
    exactly. Put $beta = 1 \/ 16$ and, for a fixed rational $gamma in \[ beta \, 1 \)$, set
  $ tau = frac(beta \( 1 - gamma \), gamma \( 1 - beta \)) \, wide tilde(P) = \( 1 - tau \) I + tau P . $
  For every stationary joint or unilaterally deviated policy $pi$,
  $ I - gamma tilde(P)^pi = frac(1 - gamma, 1 - beta) \( I - beta P^pi \) . $
  Thus $\( 1 - gamma \) \( I - gamma tilde(P)^pi \)^(- 1) r_i^pi$ equals $\( 1 - beta \) \( I - beta P^pi \)^(- 1)
    r_i^pi$. Rewards, actions and initial law are unchanged, and the lazy transition remains rational and
    single-controller with polynomial encoding length. ◻
]

=== 11.8 Hylland–Zeckhauser equilibria <hyllandzeckhauser-equilibria>

The reduction of Braverman, Liu, Xue, and Zhou #cite(label("HZ2026")) also yields constant-error hardness for
  one-sided allocation with unit demand. An instance has $n$ agents, $n$ unit-supply goods,
  and an explicitly encoded rational utility matrix $u in \[ 0 \, 1 \]^(n times n)$.
  In their approximate Hylland–Zeckhauser (HZ) equilibrium #cite(label("HZ2026")) Definition 2.1,
  an allocation $x gt.eq 0$ and prices $p gt.eq 0$ satisfy

$ sum_i x_(i j) = 1 \, wide sum_j x_(i j) = 1 \, wide min_j p_j = 0 \, $

and, for each agent $i$,

$ p dot.op x_i lt.eq 1 + epsilon \, wide u_i dot.op x_i gt.eq max { u_i dot.op y : y gt.eq 0 \, med sum_j y_j =
  1 \, med p dot.op y lt.eq 1 } - epsilon . $

Thus clearing and unit demand are exact; the additive errors concern expenditure and utility,
  with comparison budget one.

#thm([Corollary 11.10.])[
  (Approximate HZ equilibrium hardness).  #emph[There are a fixed rational $epsilon_(upright(h)) >
    0$ and a fixed polynomial $p_(upright(h))$ such that finding an $epsilon_(upright(h))$-HZ equilibrium with
    rational prices and allocation of total encoding length at most $p_(upright(h)) \( L \)$ is PPAD-hard under
    deterministic polynomial-time many-one search reductions, where $L$ is the input encoding length.]
] <cor:hz-hardness>

#proof[
  Use the fan-out-two circuit of Lemma 84, with its fixed positive numerical tolerance $tau$ and failure allowance
    $gamma_2$. Its no-Boolean gate relations agree with #cite(label("HZ2026")) Table 1,
    so no Boolean tolerance is changed. The reduction underlying #cite(label("HZ2026")) Theorem 3.2 has two
    stages: Lemma 3.4 of that paper converts these circuits to bounded-degree threshold games,
    and Lemma 3.25 converts those games to HZ instances. The construction uses a fixed integer $m$ and rational
    market data, with HZ error $m^(- 40)$. In that construction,
    each threshold-game vertex $v$ has an associated group $G_(v \, 1)$ of goods.
    The first decoder assigns $v$ the value $min { 1 \, m^2 p \( G_(v \, 1) \) }$,
    where $p \( G_(v \, 1) \)$ is the minimum price in that group.
    This decoder, the threshold-game-to-circuit decoder, and the subsequent circuit decoders have polynomial bit
    cost on rational witnesses. Composing with the decoder after (6.21) therefore gives an End-of-Line solution in
    time polynomial in the input and total rational witness length.
  For completeness, polynomial-size rational HZ witnesses preserve the exact equalities above.
    Start from a normalized exact equilibrium $\( x \, p \)$, as in #cite(label("HZ2026")) Lemma B.2;
    summing budgets and column sums gives $sum_j p_j lt.eq n$.
    Round prices upward on a rational grid of mesh at most $epsilon_(upright(h)) \/ 4$, retaining zero prices.
    Express $x$ as a convex combination of at most $n^2$ permutation matrices and round its weights,
    preserving nonnegativity and total weight one, so each row changes in $ell_1$ norm by at most
    $epsilon_(upright(h)) \/ \[ 4 \( n + 1 \) \]$. A denominator of order $n^3 \/ epsilon_(upright(h))$ suffices.
    Row and column sums remain exact, expenditures increase by less than $epsilon_(upright(h))$,
    and utilities decrease by less than $epsilon_(upright(h))$.
    Since prices only increase, the comparison optimum cannot increase.
    These rational witnesses have a fixed polynomial encoding bound;
    their utility conditions are checked by rational linear programming. ◻
]

== 12 Further algebraic and binary representations <sec:extensions>

The constructions above use separate algebraic representations at the outer and inner scales,
  and retain only the binary products needed for functional evaluation.
  We record two extensions of these representations. The first applies the inner algebraic charts directly to the
  End-of-Line macrograph. The second allows unrestricted binary products and checks proposed moves.
  These extensions are independent of the proof of Theorem 3 and the consequences in Section 11.

=== 12.1 A polynomial chart representation of the End-of-Line macrograph <ia:eol-variant>

The polynomial-chart construction also realizes the full reciprocal End-of-Line macrograph,
  including its other paths and cycles, without the standardized-port requirement.
  We record this separate application of the same algebraic tools.
  Its size is polynomial; the quasilinear outer representation used in the main reduction remains the construction
  of Sections 3– 5. All field and chart notation in this subsection is local to this separate instantiation.
  The fields, allowance, and one-port templates fixed in Section 7 retain their original meaning outside this
  subsection.

#thm([Proposition 12.1.])[
  (Full macrograph polynomial representation).  #emph[For a normalized End-of-Line instance of encoding length
    $N$, one can construct in deterministic polynomial time a cyclic macrograph and its progress-path extension
    with the following properties.]
  + #emph[The graph has indegree and outdegree at most one, no isolated vertices or self edges,
    and a public exceptional source with a public successor. Every other endpoint yields an End-of-Line answer
    from its logical tape in polynomial time. Other paths and cycles are retained.]
  + #emph[Its valid extended labels have unique canonical polynomial chart tuples on one fixed-dimensional domain
    $K^u$. There are a fixed number of chart families, native dimensions $O \( ell \)$,
    a bounded number of $O \( ell \)$ slot axes, and honest coordinate degree $O \( ell h \) < D$.
    All full evaluation, mask, coefficient, and indexing arrays have polynomial size.
    The construction does not enumerate the graph’s vertices.]
  + #emph[The tuples have a perfectly complete bounded binary-form algebraic validator with a constant exact gap
    on genuine degree-at-most-$D$ polynomials. Linear probes are smooth;
    each unknown product uses two independent full point marginals.
    Canonical recipes with the same degree and covariance properties are defined on every Boolean logical tape at
    every specified frame, mode, and progress. An invalid label so represented has the same exact gap.]
  + #emph[Mode, empty/full progress, and the critical bits for a proposed edit admit bounded smooth decisions at
    any fixed reliability. Once the true decision branch is fixed,
    either proposed canonical tuple has the bounded affine update formulas of (7.43),
    including its full proof data, whether or not the proposed target is valid.
    The coefficients are independent of point and row position,
    and the updates commute with common linear row encodings and ordered-line coefficient encodings.]
  #emph[Here the fields and all fixed constants are chosen for this whole construction.
    No common one-port source or radius-before-arity conclusion is asserted.
    Target validity is tested after prediction, as in Proposition 96; it is not presumed by an affine update formula.]
] <ia:eol-algebra-interface>

#proof[
  #strong[Cyclic schedule and Boolean validity.] Use the normalized transcript positions and the two orders of
    Section 2.1, renaming their length $T = O \( N \)$. For this variant keep two content tapes $A \, B$;
    their occupied prefix lengths are specified by the public stage, so no occupation coordinates are needed.
    With the notation $Q_x \, U_y \, V_y$ from that section, use the following four stage conditions:
  $ 0 lt.eq s lt.eq T & A = Q_x \, quad B upright(" a forward prefix of length ") s upright(" from ") S \( x \) \,\
T lt.eq s lt.eq 2 T & B = Q_y \, quad A upright(" a reconstruction prefix of length ") 2 T - s upright(" from ") y \,\
2 T lt.eq s lt.eq 3 T & B upright(" a valid full transcript") \, quad A =
  "pref"_(pi_(upright(f)) \, s - 2 T) \( B \) \,\
3 T lt.eq s lt.eq 4 T & A upright(" a valid full transcript") \, quad B =
  "pref"_(pi_(upright(f)) \, 4 T - s) \( A \) . $
  The boundary descriptions agree. At $s = T$, the first gives $A = Q_x \, B = Q_y \, y = S \( x \) \, P \( y \) =
    x$; hence reconstruction from $y$ gives exactly $A$. Conversely,
    a complete valid reconstruction from $y$ gives $x = P \( y \)$, $S \( x \) = y$, and the same pair.
    At $2 T$, $3 T$, and $4 T$ the descriptions respectively say that $A$ is empty, that $A = B$ is full,
    and that $B$ is empty. The last is the stage-zero hub condition.
  Choose a fixed polynomial scale $n_G = C_G \( N + 2 \)^2$, with $C_G$ large enough that $n_G gt.eq 4 T +
    3$ and all fixed lower cutoffs and degree inequalities below hold,
    and use (7.1)– (7.4) with $n'$ replaced by $n_G$. In particular $h^ell gt.eq n_G^3 + 3$, $M = h^ell - 1$,
    and $C = K_1^times = chevron.l gamma chevron.r$. Pad stages $4 T \, dots.h \, M - 1$ by the hub condition,
    and identify stage $s$ with $c = gamma^s$ by enumerating the group. No discrete logarithm is needed.
    All hub-to-hub steps, including the wrap to stage zero, are allowed.
  The forward tape proposals are, in order: fill the next forward $B$ position;
    erase the last reconstruction $A$ position; copy the next $B$ position into $A$;
    erase the last copied $B$ position; or do nothing at a padded hub.
    The reverse proposals are respectively erasure, local reconstruction, erasure, copying, and the identity.
    A fill uses its computed bit even if the new terminal comparison fails.
    An actual edge is exactly a proposed pair whose two stage conditions hold.
    Prefix uniqueness from Section 2.1 makes the operations reciprocal on such pairs:
    earlier operands or the unchanged full tape determine each erased bit. Thus both degrees are at most one.
  Add a legacy vector $e$ on $C$, one-hot at $c^(- 1)$, and write $b = \( A \, B \, e \)$.
    Impose bitness, the one-hot equations (7.5), and, for each stage $c$,
    multiply every tape constraint at that stage by $e_(c^(- 1))$.
    Gate constraints have degree at most two; blank, copy, and terminal-comparison constraints are linear.
    The resulting $O \( M T + M^2 \)$ rows have degree at most three and describe exactly the union of valid stage
    tapes. Their row and column index sets are polynomial in $N$,
    hence require only $O \( ell \)$ digit coordinates in the linear verification tool.
    Padding other tape coordinates by zero to full digit grids preserves these bounds.
    A proposal changes at most one content coordinate and the two legacy coordinates
    $c^(- 1) \, \( gamma c \)^(- 1)$. Use these three unit vectors, or a zero content vector at hubs,
    as a fixed binary flip alphabet. The coefficient of the content flip is the old bit plus its required new
    value. Either direction needs only the old bit, at most two operands or one copy bit,
    and finitely many public phase and rule bits. The same rule defines proposals on every Boolean tape,
    without a validity call.
  #strong[Endpoints and progress paths.] A forward prefix can always be shortened,
    so a missing successor is its first failed terminal comparison. With $A = Q_x$, put $y = S \( x \)$.
    Then $P \( S \( y \) \) eq.not y$ and $P \( y \) = x$. If $y = 0$, the source promises would give $x =
    P \( 0 \) = 0$ and $S \( 0 \) = 0$, a contradiction. A reconstruction prefix can always be shortened in the
    forward direction; a missing predecessor gives $y = "in"_S \( B \)$ and $S \( P \( y \) \) eq.not y$.
    Copy and hub stages have both neighbors. Thus there are no isolated vertices.
    The only zero exception is $B = Q_0$ with its longest valid reconstruction prefix from zero.
    This transcript exists because $P \( S \( 0 \) \) = 0$, and its maximal length $k_(*) <
    T$ follows from $S \( P \( 0 \) \) = S \( 0 \) eq.not 0$.
    Its stage is $2 T - k_(*)$, and its successor shortens the prefix or starts copying if $k_(*) = 0$.
    Direct circuit evaluation computes this source and successor.
  For each macro tape at stage $c$, introduce the path
  $ \( gamma^(- 1) c \, b \, 1 \, q - 1 \) \,
    dots.h \, \( gamma^(- 1) c \, b \, 1 \, 0 \) \, \( c \, b \, 0 \, 0 \) \, dots.h \, \( c \, b \, 0 \, q - 1 \) . $
  Attach each actual macro edge from the full pre end of one path to the full post start of the next.
    This is the four-operation extension of Definition 41, with actual macroedge validity in place of that
    definition’s disabled-wrap rule. The replacement paths are disjoint, so they preserve all components,
    endpoints, and degree bounds. Every edge changes a mode or progress coordinate.
    If the exceptional macro source is $\( c_(*) \, b_(*) \)$,
    its extended source and successor are $\( gamma^(- 1) c_(*) \, b_(*) \, 1 \, q - 1 \)$ and
    $\( gamma^(- 1) c_(*) \, b_(*) \, 1 \, q - 2 \)$. At another endpoint,
    scanning the legacy vector and transcript gives the appropriate nonzero vector above in polynomial time.
  #strong[Canonical arrays without positive tags.] Use the ordinary order-one lifts for $A \, B$,
    the cyclic lift of Lemma 43 for $e$, and the constant chart.
    Include #emph[every] ordered monomial type list of length at most three in these groups,
    with independent argument groups even for repeated types. There are constantly many lists.
    Recursive factorization fixes the monomials from the order-one charts.
    Apply Lemma 44 to their extension, zero-padding, bitness, and cubic validity rows.
    A coincident-grid product in a validity row is a linear condition on a tensor entry,
    so its verification uses that lemma rather than a diagonal unknown-product query.
    This fixes all its canonical certificates uniquely.
  Adjoin $J_c$, the clock-times-monomial charts, and the clock/legacy identity (7.22).
    The clock-indexed construction of Lemma 45 provides every critical logical bit and every public rule bit for
    both proposal directions. Their addresses are indexed by the absolute frame $c z$;
    they do not require reading the unknown frame as a binary word.
    All these canonical formulas are defined for arbitrary Boolean $b$, even when a final validity row fails.
  For every persistent chart of positive assigned Boolean degree, including every verification auxiliary,
    and each of the eight flip masks, apply the derivative construction (7.26) using the same frame in both terms.
    The top Boolean degree cancels, so the derivative and all certificates introduced to verify it have degree at
    most one less. Construct the coefficient maps from the parent’s specified canonical recipe by (7.29),
    and repeat on every new positive-degree family. After at most three drops the process stops.
    It updates the certificates themselves and does not assume their validity. The number of families is fixed.
    Each persistent family has at most one $O \( ell \)$ slot axis,
    and finitely many applications of the degree estimate (7.17) leave coordinate degree $O \( ell h \) < D$.
    Give all inherited projection axes consistent full $K$ labels and reserve a new label for each derivative
    axis; a fixed common $K^u$ suffices. No positive-tag reuse or one-port identification is needed.
  #strong[Validation, affine updates, and size.] Use exactly the mode, radix marker,
    and projection stacks of Lemma 50. Their triangular recurrences uniquely fix all coefficients.
    At full progress, the singleton-stack sums (7.40) supply the constant-polynomial critical values for the
    finite proposal rule. For every persistent chart and every stack subset,
    the summed derivative stack in (7.41) gives its exact change at the fixed frame.
    These simultaneous identities hold on every Boolean tape.
    Increasing and decreasing progress use (7.37)– (7.39); frame advancement occurs only with empty stacks and
    uses the designated scaling by $gamma$. Thus the complete proposed target, including every proof chart,
    obeys the bounded affine formulas. Public coefficients and mask pulls are independent of target point and row;
    a common linear row extension and line-coefficient extraction commute with them.
  The exact-gap argument of Lemma 51 now applies to this finite family:
    first enforce shape, independence, and linearity, then monomial and clock identities,
    then all unique linear certificates, and finally the marker and stack recurrences.
    If every identity holds, there is one valid tape and its canonical tuple.
    Otherwise a nonzero polynomial discrepancy, after the stated earlier linearity conditions,
    is detected with a fixed positive probability by uniform points, separable masks, and binary forms.
    Products of nonconstant monomial factors use their independent argument groups;
    clock products use a fresh independent group; marker products are sampled at independent points after
    constancy is enforced. Ignored coordinates are filled independently.
    Hence all unknown products have independent full point marginals,
    and all linear probes retain the smoothness of the linear tool.
    On an invalid Boolean tape the recipes, covariance, and degree bounds still hold,
    but some final identity fails with the same gap.
  Finally, $M \, \| K \| \, q^(O \( ell \))$, the validity matrices,
    and all mask spaces have polynomial size in $N$. More explicitly, $T lt.eq M$,
    the stage rows number $O \( M^2 \)$, and the logical monomials of degree at most three number $O \( M^3 \)$.
    All later row and column sets have size a fixed power of these quantities or of $\| K \|$;
    their base-$h$ digit dimensions are therefore $O \( ell \)$.
    The fixed-depth degree estimates remain $O \( ell h \) < D$ after the chosen cutoff.
    Boolean interpolation through degree three, every array operation,
    and every fixed-depth certificate construction consequently take polynomial time.
    No step enumerates Boolean assignments or graph vertices. This proves all the asserted costs and interfaces. ◻
]

=== 12.2 Unrestricted products and validation of proposed moves <ib:unrestricted-variants>

We return to the binary construction and notation of Section 8.
  The restriction to compatible tags is needed for the standardized one-port source in Section 9.
  The binary methods also give the following variant when that source requirement is absent.
  Its constants are fixed for the entire chosen chart family.

#thm([Proposition 12.2.])[
  (All ordered products and full logical recovery).  #emph[Fix an inner algebraic template,
    and replace the compatible-pair list by the list of #emph[all] ordered pairs of point-track types in (8.4).
    The two positions remain independent even when the types coincide; no line-product blocks are added.
    Rebalance all blocks by the repetition construction of Section 8.2.
    This encoding has polynomial length and a uniform polynomial-time construction, and has the following properties.]
  + #emph[Valid canonical words have constant distance and the perfectly complete smooth tester and proximity
    guarantee of Proposition 60. A structurally canonical word whose label is invalid has rejection probability at
    least one fixed $theta_(upright("inv")) > 0$.]
  + #emph[One fixed radius permits arbitrary fixed average accuracy for bounded-density requests,
    with joint pair density for products, arbitrary public masks and forms,
    and all-hypothetical-branch smoothness as in Proposition 65 and Lemma 66.]
  + #emph[From a sufficiently small fixed neighborhood of any structurally canonical word,
    its #emph[entire] logical tape $b = \( w \, e \, \( s_i \)_i \)$ is recoverable exactly in deterministic
    polynomial time, whether or not that tape is valid.]
  #emph[The constants and the radius may depend on the whole fixed template and its block list.
    No common one-port layout or radius fixed before arity is asserted for this variant.]
  #emph[More generally, the same binary transfer applies to a supplied fixed finite chart template with the field,
    degree, slot, and polynomial-size bounds used in Section 8, subject to these explicit conditions:
    its canonical recipes are defined also on invalid logical tapes;
    its bounded binary-form algebraic validator has perfect completeness and an exact constant gap on genuine
    degree-in-bound polynomial tuples; its linear probes have bounded point marginals and its products have
    independent full point marginals; and its order-one grid charts and constant mode/marker tensors separate
    labels. Full logical recovery requires order-one grid charts for every logical coordinate.
    This transfer assumes these algebraic properties; it does not assert that the fixed-input path of Section 7
    realizes an arbitrary macrograph.]
] <ib:all-pairs-interface>

#proof[
  There are still only constantly many blocks, each of polynomial size,
    so the balancing product remains polynomial. The point and line construction, rectangular action,
    and common row extension do not use tags. In the proof of Proposition 60,
    all replacements before the product step concern individual $Y$ tracks.
    For each added product block, the additivity test in $Q$ and the two independent uniform operand positions
    give exactly the same product replacement: a false binary matrix is detected by a uniform outer-product form
    with probability at least $1 \/ 4$. Taking a positive fixed mixture over the enlarged finite block list
    therefore gives the same vanishing-rejection replacement argument.
    The algebraic validator is then applied to the common target tuple;
    every requested point product is now present. Its exact gap forces validity.
    On an invalid structurally canonical word, no replacement is necessary:
    the final validator component already rejects with a fixed positive probability.
    Its mixture weight and the fixed losses in binary-form simulation define $theta_(upright("inv"))$.
    Distinct logical or mode/marker data retain the positive distance witnessed by their $Y$ blocks,
    with the new fixed block weights.
  For correction, the two-axis support and inner-table arguments apply to any ordered pair of point tracks.
    They use independent row coordinates and the two row-code actions, not tag compatibility.
    Use the new block count in (8.9) and choose one radius satisfying (8.11) for this block list.
    The bad-column bound, support contraction, finite-cone consistency,
    and amplification then prove the same average guarantee. Each pair of affine shifts remains a permutation of
    the full pair domain, even for a repeated type. The proof of Lemma 66 consequently applies to every added
    block, with a new finite summed density bound. In particular, no product request is converted to a diagonal pair.
  For full recovery, apply the proof of Proposition 68 to each order-one chart $W_w \, W_e \, W_(s_i)$.
    The work and port charts use ordinary grid extensions, and the legacy chart uses its degree-in-bound cyclic
    lift. In each case nearest Hadamard symbols, equal-fiber plurality,
    and plurality over ignored coordinates produce a native polynomial estimate of sufficiently small constant
    symbol error. For each logical grid point, the complete enumeration of lines and the verified Berlekamp–Welch
    systems in that proof recover its exact value by a strict majority.
    The argument uses degree and table structure, not the final validity equations.
    There are polynomially many grid points and a fixed number of charts.
    Reducing the radius by the fixed block-weight factors makes all these decodings valid simultaneously.
    The same proof applies to the supplied general chart template under the stated separation and grid hypotheses. ◻
]

#thm([Proposition 12.3.])[
  (Prediction before target validation).  #emph[Use the unrestricted representation of Proposition 95.
    Suppose a valid current label has a prescribed proposal chosen by finitely many decisions which are
    recoverable, to any fixed reliability, by bounded smooth bit procedures.
    On a valid current label, once its true decision branch is fixed,
    suppose the full canonical proposed tuple is a definite structurally canonical tuple, possibly invalid,
    whose contractions are bounded sums of public terms and old contractions at invertible $K$-affine target
    pulls. For each branch these pulls must belong to a fixed bounded public list,
    independent of the requested outer indices and mask or form values.
    Masks may select terms from that list and determine their slot pulls and forms.
    Require bounded slot expansions, coefficients independent of target point and row,
    compatibility with the common row and line encodings, and publicly computable actual encoded values for public
    terms. On hypothetical wrong branches only these bounded schedules and smooth defaults are required;
    a canonical target identity is asserted only when the branch predicates hold.
    All branch lists, supports, and public computations are to have the uniform polynomial-size bounds of Section 8.]
  #emph[From a sufficiently small fixed neighborhood of the current valid word,
    its proposed word can be predicted to arbitrary fixed average accuracy on bounded-density requests
    #emph[before] deciding target validity. That validity can then be decided with arbitrary fixed reliability.
    If an actual-edge predicate is exactly target validity together with specified public or similarly recoverable
    guards, this also decides that edge flag. All routines are bounded on every received word and retain the
    complete hypothetical-tree smoothness bound. No reciprocity of a general proposed graph is inferred from
    target validity alone.]
] <ib:proposal-validation>

#proof[
  Fix the true decision branch of the nearby current label, charging the selector’s error separately.
    For a point or line $Y$ request, commute the proposed update through the common row encoder and, for a line,
    through restriction and coefficient contraction. This gives a bounded XOR of old $Y$ requests with publicly
    pulled-back forms, plus public bits. Each map in the fixed public list induces a commuting column permutation
    on the retained point and ordered-line domains, preserving bounded outer-index density.
    If masks select among these maps, sum their unconditioned slot bounds before selection;
    the list is bounded independently of the request. Apply average correction with the error divided among these
    boundedly many slots.
  For a proposed $Z$ bit, expand both updated symbols by bilinearity.
    Every two-variable term is present because all ordered point-track pairs were included.
    Each side undergoes its own affine column permutation, preserving the joint density of the pair.
    A term with one public actual $J$-symbol is an arbitrary linear form of the other symbol,
    and (8.12) supplies its complete surviving row/point density. Two public operands give a public bit.
    Thus the proposal is predicted using only the current close word;
    its target need not be valid or supplied as a received word.
  Now simulate the tester on the proposed word by supplying each bit from this predictor with fresh internal
    randomness. First fix the selector error below $theta_(upright("inv")) \/ 16$ and its complete bounded tree.
    Unfold that tree and the bounded tester tree. Each fixed hypothetical tester request has bounded density,
    so next choose the per-prediction errors to sum to less than $theta_(upright("inv")) \/
    16$ over all these slots. The simulated rejection probability differs from the true one by less than
    $theta_(upright("inv")) \/ 8$. A valid proposal has true rejection zero;
    an invalid structural proposal has rejection at least $theta_(upright("inv"))$.
    Independent repeated simulations and the threshold $theta_(upright("inv")) \/
    2$ therefore give any specified fixed reliability. Include the stated guards separately when interpreting the
    result as an edge flag.
  All error estimates use the unconditioned request law on each fixed branch,
    followed by a union bound over the complete bounded tree.
    They do not renormalize after a successful comparison or condition on a rare selected branch.
    Wrong decisions and failed comparisons still select only from the supplied finite lists;
    public-zero defaults and fresh splitting preserve the raw-read bounds of Lemma 66.
    At fixed accuracy, the number of simulations and all their supports are bounded and polynomially
    constructible, as required. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
