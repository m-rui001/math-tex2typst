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

#align(center)[#text(size: 16pt, weight: "bold")[An infinite finitely presented periodic group]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A group is #emph[periodic] if every element has finite order.
  An #emph[ordinary finite presentation] specifies finitely many generators and finitely many relator words,
  and takes the quotient of the free group by their normal closure.
  The finitely presented Burnside question asks whether a periodic group with such a presentation must be finite.
  We construct a counterexample.

The group arises from a unital associative algebra $R$ over $bb(F)_2$.
  For $n gt.eq 3$, the elementary matrix $e_(i j) \( a \)$ is the $n times n$ matrix with ones on the diagonal,
  entry $a in R$ in position $\( i \, j \)$ with $i eq.not j$, and zeros elsewhere.
  These matrices generate $"E"_n \( R \)$. The Steinberg group $"St"_n \( R \)$ has generators $x_(i j) \( a \)$,
  where $1 lt.eq i \, j lt.eq n$, $i eq.not j$, and $a in R$, with relations

#[#set math.equation(numbering: n => "(1.1)")
 $ x_(i j) \( a + b \) & = x_(i j) \( a \) x_(i j) \( b \) \, &  & a \, b in R \,\
 & = 1 \, &  & j eq.not k \, med i eq.not l \,\
 & = x_(i k) \( a b \) \, &  & i \, j \, k upright(" pairwise distinct") . $ <fp:steinberg-addition>]

Here $\[ g \, h \] = g h g^(- 1) h^(- 1)$, and every root symbol has unequal row and column indices.
  Sending $x_(i j) \( a \)$ to $e_(i j) \( a \)$ gives a surjection $pi_n : "St"_n \( R \) arrow.r "E"_n \( R \)$;
  denote its kernel by $J_n \( R \)$.

#thm([Theorem 1.1.])[
  #emph[There is an infinite periodic group with an ordinary finite presentation.
    More precisely, the construction below gives a unital associative $bb(F)_2$-algebra $R$ for which
    $"St"_12 \( R \)$ is infinite, finitely presented, and periodic.]
] <thm:main>

The order of an element may depend on that element. Ordinary finite presentation here has its group-theoretic
  meaning above: additional identities defining a variety of groups are not implicit in the relators.

===== 1.1 Kazhdan property and nonamenability. <kazhdan-property-and-nonamenability.>

A discrete group has Kazhdan’s property $\( T \)$ if every unitary representation with almost invariant unit
  vectors has a nonzero invariant vector.

#thm([Corollary 1.2.])[
  (A periodic Kazhdan group).  #emph[The group $"St"_12 \( R \)$ of Theorem 1 is infinite, finitely presented,
    and periodic, and has Kazhdan’s property $\( T \)$. In particular, it is nonamenable.]
] <cor:kazhdan>

The proof in Section 6.5 applies the theorem of Ershov and Jaikin-Zapirain that $"St"_n \( S \)$ has
  property $\( T \)$ for every finitely generated unital ring $S$ and every $n gt.eq 3$ [5] Theorem 6.2,
  then uses the left regular representation to deduce nonamenability.

Infinite finitely generated periodic groups with property $\( T \)$ were already known.
  Ershov constructed examples that are also residually finite [4] Proposition 8.4.
  The result here combines periodicity and property $\( T \)$ with ordinary finite presentation.

===== 1.2 The Burnside problems and finite presentation. <the-burnside-problems-and-finite-presentation.>

Burnside’s questions initiated the study of finiteness under restrictions on element orders [1].
  Golod constructed infinite finitely generated periodic groups by passing from nil algebras to groups,
  using the Golod–Shafarevich inequality [6,7]. Novikov and Adian constructed infinite finitely generated groups
  of bounded exponent [12]. The restricted Burnside problem concerns finite groups with a fixed number of
  generators and a fixed exponent. Zel’manov proved the corresponding order bounds for odd exponents and for
  powers of two [23,24]. These are different finiteness questions from the requirement of an ordinary finite
  presentation.

Ol’shanskii and Sapir explicitly distinguish the finitely presented periodic-group question [13] p. 45.
  Their finitely presented torsion-by-infinite-cyclic groups [13] Theorem 1.1 have an infinite cyclic quotient.
  Those constructions show the strength of finite-presentation methods in this setting while leaving the
  periodic-group question separate.

===== 1.3 Nil and algebraic finiteness questions. <nil-and-algebraic-finiteness-questions.>

For an associative algebra $A$ without an identity, #emph[nil] means that each $a in
  A$ has some power equal to zero, while #emph[nilpotent] means that $A^N = 0$ for one integer $N gt.eq 1$.
  Here $A^N$ is the linear span of products of $N$ elements.
  A finite presentation in the nonunital category is a quotient of a free nonunital associative algebra on
  finitely many generators by a two-sided ideal generated by finitely many relations.
  Smoktunowicz records as Ufnarovskij’s question whether a finitely presented nil algebra must be nilpotent [15]
  Question 8.1; Lenagan, Smoktunowicz, and Young ask the same question after constructing infinite-dimensional
  finitely generated nil algebras of restricted growth [11] Section 9.
  Amitsur asked the analogous question for finitely presented Jacobson radical algebras [15] Section 8.
  An algebra is Jacobson radical when every element is quasi-regular, equivalently when $1 -
  a$ is invertible in its unitization for every element $a$.

An algebra over a field is #emph[algebraic] if each element satisfies a nonzero polynomial over that field.
  Kurosh posed the algebraic analogue of Burnside’s question:
  must a finitely generated unital algebra that is algebraic over a field contained in its center be
  finite-dimensional [10] p. 240, Problem (R)? Golod’s nil-algebra construction, after adjoining an identity,
  already gives a negative answer [6,11]. The finite-presentation version imposes the stronger requirement of
  finitely many defining relations. Corollary 19 gives negative answers to the nil and radical nilpotence
  questions over $bb(F)_2$. The unitization of its nil algebra gives a negative answer to this finite-presentation
  version of Kurosh’s question. Elementwise nilpotence and algebraicity follow from the finite relations;
  they are not imposed as additional axioms.

===== 1.4 The ring and the four obligations. <the-ring-and-the-four-obligations.>

The ring used throughout the proof is an infinite finitely presented graded algebra

$ R = xor.big_(b gt.eq 0) R_b = bb(F)_2 xor I \, wide R_0 = bb(F)_2 \, wide I = xor.big_(b > 0) R_b \, $

for which every individual matrix in $M_d \( I \)$ is nilpotent, for every finite $d$.
  The nilpotence index is allowed to depend on the matrix. Theorem 18 constructs this ring using finitely many
  homogeneous word relations. Establishing the matrix property is a separate step from establishing nilpotence of
  individual word images.

Krstić and McCool prove finite presentability of $"St"_n \( S \)$ for every finitely presented unital ring $S$ and
  $n gt.eq 4$ [9] Theorem 3. Following their method of extending monomial root relations by word length,
  we give an explicit presentation over $bb(F)_2$ for $n gt.eq 5$,
  including the induction from finitely many root relations to all parameters in $R$.
  This converts the finite algebra presentation into an ordinary finite group presentation.
  Infinitude follows from the distinct elementary matrices $e_(i j) \( a \)$ as $a$ varies in the infinite ring.
  The matrix-nil property, together with reduction to the finite group $"GL"_n \( bb(F)_2 \)$,
  makes $"E"_n \( R \)$ periodic.

The fourth obligation is torsion of $J_12 \( R \)$. Periodicity of the elementary matrix image alone does not
  supply this. Once the kernel is torsion, a power of any element of $"St"_12 \( R \)$ lies in the kernel and a
  further power is the identity. The construction must therefore provide finite presentation, infinitude,
  matrix periodicity, and kernel torsion for the same ring and the same group.

===== 1.5 Finite rules and matrix cancellation. <finite-rules-and-matrix-cancellation.>

The algebra presentation uses a finite alphabet, length-preserving word replacements, and word-zero relations.
  Its local rules encode the next level of a hierarchy by replacing each upper-level letter by a prescribed block
  of lower-level letters. These blocks are the clean encodings.
  Only the first level’s finite rule table is used in the defining presentation.
  The self-simulation method has a close predecessor in the fixed-point tile constructions of Durand,
  Romashchenko, and Shen, including polynomial-time local checks and variable-scale simulation [3] Sections 2.3
  and 5. Here we must also control every finite word allowed by the relations,
  including words containing unfinished or forged verification states.

A related semigroup construction of Ivanov-Pogodaev and Kanel-Belov gives an infinite ordinarily finitely
  presented nilsemigroup satisfying $x^9 = 0$ [8]. Its hierarchical path encodings and finite local relations are
  pertinent predecessors. That theorem does not assert nilpotence of arbitrary sums of word images or of matrices
  over the resulting word algebra. The additional algebraic property required here is established by cancellation
  of matrix-valued word tests.

The finite-rule construction has two outputs. Clean encodings preserve nonzero words from the next level,
  yielding surviving words of unbounded degrees. For the second output,
  a cut is a position recognized by the letter that follows it,
  and a token is an interval between successive cuts. Every sufficiently long nonzero word has bounded end pieces
  outside its first and last cuts, and each intervening token can be normalized using only replacements within
  that token. Palette letters carry colors; every such word has a long consecutive interval of them whose distinct
  colors can be permuted freely. Assign a numerical matrix of a fixed size to each letter,
  and give a word the ordered product of its letter matrices.
  Summing the matrix weights over these permutations gives zero in characteristic two once the interval is long
  enough compared with the test dimension.

Passing to the next level converts tokens into bounded-length words.
  A finite weighted automaton records their possible segmentations,
  at the cost of increasing the matrix dimension; this use of matrix word weights belongs to the theory developed
  by Schützenberger [14]. The palette sizes grow fast enough that after finitely many levels direct cancellation
  applies. Finally a central indeterminate records the number of factors separately from their word length.
  Extracting its coefficients proves nilpotence for every fixed matrix over $I$.

===== 1.6 Torsion in the lift. <torsion-in-the-lift.>

The central-kernel argument uses standard structures from Steinberg groups and algebraic $K$-theory [16,20].
  We first prove centrality using root strips: subgroups generated by roots whose source coordinates lie in one
  set and target coordinates in a disjoint set. The matrix map is injective on these strips.
  A presentation of the full matrix group by relations on small coordinate sets supplies the rank control.
  We then use a frame complex, whose simplices are sets of columns linearly independent after reduction modulo
  $I$. This complex gives the rational homological stability needed to extend every homomorphism $J_n \( R \)
  arrow.r bb(Q)$ to larger ranks when $n gt.eq 12$. The local argument keeps track of the standard inclusion;
  no injectivity of a stabilization map on kernels is required.

The grading gives a homomorphism $R arrow.r R \[ t \]$ by $a_b mapsto a_b t^b$ for $a_b in R_b$.
  This homomorphism and the cyclic and truncated shift substitutions below occur in Weibel’s operations on graded
  $K$-theory [22] Section 1, pp. 468–469. Here we compare the substitutions directly in Steinberg groups.
  Apply the grading homomorphism to a word representing a kernel element $u in J_n \( R \)$.
  Substituting an $N times N$ numerical matrix for the central variable $t$ replaces each root by a block of roots
  and gives a word in $"St"_(n N) \( R \)$. Substitution of a cyclic shift of power-of-two size behaves,
  after a change of basis, like evaluation at $t = 1$. Substitution of the corresponding truncated shift behaves
  like evaluation at $t = 0$. Their difference consists of roots crossing the cyclic boundary.
  We collect those roots in a strip with disjoint endpoint sets, where the matrix map is faithful,
  and prove that the two substitutions agree in the Steinberg group itself.

This equality makes a power of a stabilized copy of $u$ equal to a product of ground-field kernel elements,
  which are torsion. Rational stability then returns torsion to rank twelve:
  every rational homomorphism extends to the larger kernel and kills this element;
  such homomorphisms detect every nontorsion element of an abelian group.
  All of these comparisons are proved with the Steinberg relations.

===== 1.7 Organization. <organization.>

Section 2 constructs the finite rule hierarchy and proves faithful encoding and bounded-end token decomposition of
  sufficiently long nonzero words. Section 3 proves cancellation and constructs the infinite algebra with a
  matrix-nil positive-degree ideal, then derives the nil, radical, and algebraic finiteness consequences.
  Section 4 gives the ordinary finite Steinberg presentation and proves periodicity of its matrix image.
  Section 5 establishes centrality and rational stability. Section 6 compares the two matrix substitutions,
  descends kernel torsion, and completes Theorem 1 and Corollary 2.

== 2 A hierarchy defined by finite local rules <sec:finite-rules>

Our objective is a finite presentation with two simultaneous properties:
  clean encodings preserve nonzero words from the next level,
  and sufficiently long nonzero words admit the token decomposition used for matrix cancellation.
  The two properties require different arguments. We must control every sequence of replacements starting from an
  encoded word, and we must also analyze words containing control states that no such sequence ever reaches.

We use presentations of associative algebras by words. An elementary replacement is a relation $v =
  v'$ between nonempty words of the same length; it may be used in either direction inside a word.
  An elementary zero declaration is a relation $v = 0$, with $v$ nonempty.
  The lengths of these relations mean the lengths of $v$ and $v'$, not their degrees as binomials.

#thm([Lemma 2.1.])[
  #emph[For a presentation of this kind over a field $K$, the nonzero replacement classes of words form a
    $K$-basis of the algebra. A class is zero precisely when one of its words contains an elementary zero-declared
    substring. The empty word is one of the surviving classes, and the algebra is graded by word length.]
] <fr:basis>

#proof[
  Make a graph whose vertices are words, including the empty word,
    and whose edges are elementary replacements in arbitrary contexts.
    The ideal generated by the binomial relations is the span of the differences between vertices in a common
    connected component. Quotienting by it leaves one basis vector per component.
    The ideal generated in this quotient by the zero declarations is the span of the components containing a word
    with a declared zero substring. No edge changes length, and no zero declaration involves the empty word. ◻
]

Here and throughout this Section, the parameter $h$ is a positive integer and $q_h = 2^h$.
  Bounds asserted for sufficiently large $h$ are uniform along the sequence of parameters used in the following
  Proposition. A field is not part of the rule table: the same word relations are used over every field.
  Besides its color, a palette letter has a finite tuple of auxiliary data, called its non-color fields.
  These include two control tracks, one checking colors and one verifying an encoded rule.
  Each track designates whether a head is present at a cell; the rule construction below specifies these head flags.

#thm([Proposition 2.2.])[
  #emph[There are absolute positive integers $c \, k$, with $c = 10000$ and $k = 10$ permitted,
    with the following property. Fix an integer $D gt.eq 2$. There is an integer $h_0$ and, for every
$ h in { h_0 \, h_0 D \, h_0 D^2 \, dots.h } \, $

 a finite alphabet $Sigma_h$, of cardinality at most $2^(c h)$,
   and a finite table of elementary replacements and zero declarations of length at most $k$.
   Write $A_h \( K \)$ for the resulting unital associative algebra over a field $K$,
   and write $\[ w \]$ for the image of a word. These tables have the following three properties.]
  + #emph[ There is a fixed-length substitution $E_h : Sigma_(D h) arrow.r Sigma_h^(L_h)$, where $L_h = 2 q_h +
    1$. Every elementary relation or zero declaration at parameter $D
    h$ is a consequence of the relations at parameter $h$ after substitution.
    Thus $E_h$ induces a unital algebra homomorphism $A_(D h) \( K \) arrow.r A_h \( K \)$.
    If a word $w$ is nonzero at parameter $D h$, then $E_h \( w \)$ is nonzero at parameter $h$.
    There is a nonzero one-letter word at every parameter.]
  + #emph[ A subset of $Sigma_h$ specifies cuts immediately before its letters.
    There are a bound $B_h$ and a finite list $cal(T)_h$ of tokens such that every sufficiently long nonzero word
    has a unique decomposition
$ p thin t_1 dots.h.c t_r thin s \, wide t_i in cal(T)_h \, wide \| p \| \, \| s \| lt.eq B_h . $

 Here $p$ is the part before its first cut, $s$ is the part from its last cut,
   and the $t_i$ are exactly the intervals between consecutive cuts.
   Cuts are counted only when their following letter occurs in the word.
   Each token starts with a cut letter and has no other cut letter.
   For each $t in cal(T)_h$ there is a nonempty word $u_t$ over $Sigma_(D h)$ such that
$ 1 lt.eq \| u_t \| lt.eq k \, wide \| t \| = L_h \| u_t \| \, wide \[ t \] = \[ E_h \( u_t \) \] . $

 The equalities can be effected by replacements supported inside the token.
   No assertion is made that arbitrary concatenations of tokens are nonzero.]
  + #emph[ Some letters are designated palette letters and have a color in a set of $q_h$ colors.
    An eligible run consists of consecutive palette letters with a common tuple of non-color fields and with
    neither of the two control-track head flags set. Every adjacent transposition within such a run is an
    elementary replacement of the whole letters. Every eligible run in a nonzero word has pairwise distinct
    colors. Every sufficiently long nonzero word contains an eligible run of length at least $q_h \/ 100$.
    Eligibility and the endpoints of maximal eligible runs depend only on the non-color fields.]
  #emph[The integer $D$ is chosen before the program fixed point used to define the tables;
    $h_0$ is chosen afterward. The constants $c \, k$ do not depend on $D$.]
] <prop:hierarchy>

We give the rule tables and then prove their properties. Giving a finite predicate for table membership specifies
  an ordinary finite presentation: enumerate all words of length at most $k$ over the finite alphabet and retain
  exactly the declared entries. No relation at another parameter is itself included in the table at $h$.

=== 2.1 The alphabet and its encoded blocks <fr:formats>

Take $Sigma_h$ to be the set of all bit strings of length $c h$.
  The following named fields are placed in fixed disjoint slots; unused bits must be zero.
  For definiteness, reserve 32 integer slots of width $2 h$ and 512 individual flag slots,
  and fill the remaining positions with zero. Only a fixed number of these slots will be used.
  Thus $c = 10000$ suffices, including at $h = 1$. Integers have ordinary binary encodings;
  zero-based encodings may be used for intervals beginning at 1.
  A letter with an out-of-range field or an unlisted combination of tags is declared zero,
  but remains a letter of $Sigma_h$. Once $D$ is fixed, the allowable ranges and the assignment of named fields
  are given by the procedures below.

The structural type of a letter is $C \( p \)$, $P \( a \)$, or $S$, where $1 lt.eq p lt.eq q_h$ and $1 lt.eq
  a lt.eq q_h$. The number $p$ is a core position and $a$ is a palette color.
  The only allowed structural adjacencies are

#[#set math.equation(numbering: n => "(2.1)")
 $ C \( p \) C \( p + 1 \) \, quad C \( q_h \) P \( a \) \, quad P \( a \) P \( b \) \, quad P \( a \) S \, quad
   S C \( 1 \) . $ <fr:structural-pairs>]

The first adjacency requires $p < q_h$. Every other structural pair is declared zero.
  Thus a complete block has $q_h$ core cells, a nonempty palette, and a stop cell.
  Missing neighbors at the ends of the whole word impose no structural test.

Each letter also has a transaction control track, and each palette cell has an independent palette-checker track.
  Each track has a distinguished idle state; its nonidle states will be listed below.
  A core cell whose transaction track is idle has a data bit if $p lt.eq c D h$ and has no data otherwise.
  The first $c D h$ data bits of a complete idle block therefore encode one letter of $Sigma_(D h)$,
  whether or not that letter satisfies the format restrictions at parameter $D h$.
  Palette and stop cells have no data payload. These are unary format requirements.
  We take $h$ large enough that $c D h lt.eq q_h$.

A #emph[clean block] has both tracks idle and has each palette color exactly once.
  It is #emph[canonical] when those colors occur in increasing order.
  For $a in Sigma_(D h)$, let $E_h \( a \)$ be the canonical block whose core data are the $c D h$ bits of $a$,
  and extend $E_h$ to words by concatenation. Its block length is $L_h = 2 q_h + 1$.
  Figure 1 shows this chosen encoding. Structural syntax alone still allows any nonempty palette:
  its length and colors will be forced only by the nonzero-word arguments.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (11.4, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0, 0), (2.8, 0.8), fill: rgb("#ececec"), stroke: none)
  line((2.8, 0), (2.8, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.8, 0), (5.8, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10.4, 0), (10.4, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.4, 0.4), [letter bits])
  content((4.3, 0.4), [no data bits])
  content((8.1, 0.4), [colors $1,2, dots.h ,q_h$])
  content((10.9, 0.4), [$S$])
  line((0, 1.15), (5.8, 1.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((2.9, 1.15), [$q_h$ core cells], anchor: "south", padding: 0.1176cm)
  line((5.8, 1.15), (10.4, 1.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((8.1, 1.15), [$q_h$ palette cells], anchor: "south", padding: 0.1176cm)
  content((1.4, -0.12), [$"cDh"$ bits of the upper letter], anchor: "north", padding: 0.1176cm)
  line((0, -1), (11.4, -1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((5.7, -1), [$L_h=2q_h+1$ letters in $E_h(a)$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A canonical block encoding one letter $a in Sigma_(D h)$. The core carries its $c D h$ data bits, the palette contains each color once in increasing order, and the stop cell closes the block. Both control tracks are idle. The widths are schematic; the data positions fit inside the core by the choice of $h_0$. ],
) <fr:block-figure>

The replacements will carry out a proposed upper-level relation inside one or more complete blocks.
  They temporarily acquire the cells of those blocks, keeping the present data and a proposed replacement in
  separate slots. The verifier checks a certificate for the proposed relation before the replacement can become
  the represented data. We first specify the control fields that keep this operation confined to its own cells.

=== 2.2 Control tracks and admissible neighboring pairs <control-tracks-and-admissible-neighboring-pairs>

The palette-checker track has states

$ I \, wide A_x \, wide H_x wide \( 1 lt.eq x lt.eq q_h \) \, $

meaning idle, passed while seeking $x$, and the checker head seeking $x$.
  The checker-head flag is set exactly in state $H_x$. Within a palette the allowed adjacent checker-state pairs are

$ \( I \, I \) \, wide \( A_x \, A_x \) \, wide \( A_x \, H_x \) \, wide \( H_x \, I \) . $ <fr:checker-pairs>

There is no restriction on the first palette state except its format; the last palette state must be $I$ or $H_x$.
  These are pair tests at $C \( q_h \) P$ and $P S$. They enforce a passed prefix, then its head,
  then an idle suffix, or an entirely idle palette, whenever both ends of the palette are present.
  Truncated versions are allowed at the ends of a word.

The transaction track is either idle or has one of the markers

$ L \, quad R \, quad B \, quad F . $

The first two are left and right wing markers; $B$ is a boundary cursor and $F$ is a full verification head.
  The transaction-head flag is set exactly on $B$ and $F$. Every nonidle transaction letter carries metadata

$ \( l \, tau \, b \) \, wide 1 lt.eq l lt.eq k \, quad tau in { upright("rep") \, upright("zero") } \, quad
  1 lt.eq b lt.eq l . $

Here $l$ is the intended number of blocks and $b$ is the relative block number.
  A head, and only a head, also carries a committed-side bit $epsilon.alt$. For a zero task $epsilon.alt = 0$.
  A full head carries the verifier control and three reading bits described below.
  A boundary cursor has no verifier control or reading bits.
  Wing markers store neither a committed-side bit nor a verifier phase.

A core cell with a nonidle transaction track is called locked.
  It has data slots numbered zero and one at positions $p lt.eq c D h$,
  and one certificate bit at every core position. Palette and stop cells have neither data slots nor certificate
  payload. These are unary format requirements. In a replacement transaction,
  the two slots hold the proposed source and target upper words.
  The side bit $epsilon.alt$ on the head selects which slot currently represents the data of the acquired cells.
  Acquisition copies the old data into that slot; release restores the selected slot to the idle data field.
  Once acquisition has reached the end of all $l$ blocks, full verification keeps both slots and the certificate
  fixed. Only successful verification permits changing $epsilon.alt$;
  reversing verification and releasing the cells then exposes the other word.
  For a zero transaction only slot zero is tested, and success will instead be declared zero.

These describe the intended use of the fields, not a restriction to states reached by that use.
  The pair tests and moves below also specify the meaning of arbitrary letters with those fields.

For a nonidle letter define its #emph[known first position] to mean $b = 1$ and structural type $C \( 1 \)$,
  and its #emph[known last position] to mean $b = l$ and structural type $S$.
  The following two unary zero declarations are part of the table:

#[#set math.equation(numbering: n => "(2.2)")
 $ R upright(" at its known first position is zero") \, wide
   L upright(" at its known last position is zero") . $ <fr:endpoint-zero>]

They depend on the letter itself and do not test for an absent word neighbor.

Here is a complete specification of the transaction pair tests.
  Give each side of a letter a required interface, internal or external, using the following table.
  An internal interface also prescribes the marker on the neighboring side.

$ upright("marker") & upright("left interface") & upright("right interface")\
upright("idle") & upright("external") & upright("external")\
L & upright("external at first; otherwise internal from ") L & upright("internal to ") L \, B \, F\
B & upright("external at first; otherwise internal from ") L & upright("external")\
F & upright("external at first; otherwise internal from ") L & upright("external at last; otherwise internal to ") R\
R & upright("internal from ") F \, R & upright("external at last; otherwise internal to ") R $

For each available neighboring pair its two facing interfaces must both be external or must both be internal with
  the prescribed markers. In an internal pair, $l \, tau$ agree,
  $b$ is unchanged within a block and increases by one across $S C \( 1 \)$,
  and the structural adjacency is one in (2.1). No internal pair may enter the known first position or leave the
  known last position. External pairs still obey the structural adjacency test.
  These rules are precisely comparisons of the fields of the two letters.

In particular an external entrance into a locked region occurs only at $C \( 1 \)$ with $b = 1$.
  A complete full region has the form $L^(*) F R^(*)$, occupying its $l$ blocks;
  a boundary-cursor region has the form $L^(*) B$ and can stop at any acquired cell.
  If it stops inside a block, the rest of that block is idle. Distinct regions can abut at a block boundary.
  Their metadata need not agree. At the ends of the whole word an interface for which no neighbor is present is
  not checked; the unary exclusions (2.2) continue to apply.

All violations of the structural, checker, or transaction pair tests are elementary zero declarations of length
  two. All unary format violations are elementary zero declarations of length one.
  This specifies the syntax also for words that were never reached by a computation.

=== 2.3 Palette operations <fr:palette-operations>

The following replacements preserve every field not explicitly changed.
  Their instances are taken for every admissible value of those fields.

+ At $C \( q_h \) P$, change an idle checker state on the palette cell to $H_x$, with any $x$,
  and include the inverse replacement.
+ On two consecutive palette cells, replace the checker states $H_x \, I$ by $A_x \,
  H_x$ if the color of the first cell differs from $x$; include the inverse replacement.
+ Transpose the colors of two consecutive palette cells whose other fields are identical,
  provided neither cell carries a checker head or a transaction head.

The following additional zeros are declared: a passed cell $A_x$ of color $x$;
  two consecutive palette cells of the same color; and the pair $P \( a \)
  S$ when the palette cell carries $H_x$ and $a eq.not x$. There are no other palette operations.
  In the third operation the non-color fields coincide, so transposing the colors is exactly transposing the whole
  letters.

#thm([Lemma 2.3.])[
  #emph[A complete palette containing each color exactly once, initially idle on its checker track,
    cannot reach a palette zero under the palette operations,
    interleaved arbitrarily with the transaction operations defined below.
    Conversely, suppose a palette together with its preceding $C \( q_h \)$ and following $S$ occurs in a nonzero
    word. Its checker can be removed by replacements supported on those cells.
    Once its transaction track is also idle, the palette has each color exactly once and can be sorted into
    increasing color order.]
] <fr:palette-soundness>

#proof[
  The transaction operations leave all colors and checker fields in place.
    Palette operations preserve the multiset of colors. During a check for $x$,
    every passed cell has color different from $x$: this is the condition for a forward step,
    and swaps within a passed run preserve it. A swap cannot cross from the passed region to the head or idle
    region because their checker fields differ. In particular, if every color occurs,
    a head seeking $x$ cannot reach the last cell with a different color after having passed all earlier cells.
    Distinctness also prevents an equal-color adjacency.
  For the converse, checker syntax in a complete palette either gives an idle palette or gives a single head after
    a passed prefix. If a passed cell has the sought color the whole word is zero.
    Otherwise every backward checker step is allowed. Move the head back to the first palette cell and apply the
    inverse creation rule using $C \( q_h \)$. This does not require a transaction head to be in any specified
    place. With both tracks idle, all palette letters have identical non-color fields.
    Repeated colors can be brought adjacent by swaps, and a missing color can be sought from the first cell to the
    last, where the final test gives zero. A nonzero palette therefore has exactly one copy of each color,
    which can be sorted by adjacent transpositions. ◻
]

=== 2.4 Acquisition and the local verifier <fr:verifier>

For the moment fix any finite program code $a$. At parameter $h$ the verifier will test a certificate asserting
  that this program accepts the proposed elementary rule at parameter $D h$.
  The certificate and its addressable clauses will be specified in Subsection 2.5.
  All that is needed for the local moves is a nonempty ordered list of clauses

#[#set math.equation(numbering: n => "(2.3)")
 $ Phi_1 \, dots.h \, Phi_m \, wide m lt.eq q_h \, $ <fr:clause-list>]

each reading at most three bits. A bit address specifies either a data slot,
  its relative block number and core position, or a certificate bit in the first relative block.
  Repeated addresses are allowed. Clauses with fewer than three inputs can be padded by repeated inputs;
  a constant clause uses a dummy certificate address whose value its truth function ignores.
  The addresses and the truth function of an indexed clause are computable from $a \, h \, l \,
  tau$ and the index. They do not depend on the committed side.
  The tested input uses both data slots for a replacement task and only slot zero for a zero task.

The acquisition replacements are the following.

+ An idle $C \( 1 \)$ can become a boundary cursor with $b = 1$, with chosen $l \, tau \, epsilon.alt$.
  Its previous data bit is placed in slot $epsilon.alt$; its other data slot, when present,
  and its certificate bit are chosen arbitrarily.
+ A boundary cursor can acquire its immediate next cell if that cell is idle for transactions and would be an
  internal next position of the chosen region. The old cursor becomes $L$,
  the next cell becomes the boundary cursor, and the metadata and side pass to the new cursor.
  On a core cell the old idle data are copied into the committed slot and the other slot and certificate bit are
  chosen arbitrarily. Palette and stop cells acquire no payload.

Both moves have their inverse moves and there are no other acquisition or release moves.
  Thus release returns the data in the committed slot to the idle data field.
  An acquisition cannot advance beyond its known last position.
  At that position, and only there, its boundary cursor may become a full head in the initial verifier state
  described next, with zero reading registers; this change also has its inverse.

A full head holds $epsilon.alt$, a clause index when appropriate, a phase tag from the following fixed list,
  and a register $rho in { 0 \, 1 }^3$. For clause $j$ its control path is

#[#set math.equation(numbering: n => "(2.4)")
 $ A_j med arrow.l.r med upright("reading tour") med arrow.l.r med B_j^(upright("gate")) med arrow.l.r med
   G_j^(upright("gate")) med arrow.l.r med upright("undo tour") med arrow.l.r med Z_j . $ <fr:control-path>]

The symbols $B_j^(upright("gate"))$ and $G_j^(upright("gate"))$ here name verifier phases, not boundary cursors.
  The endpoint phases in (2.4) occur only at the known last position; this is a unary format condition.
  All eight register tuples are syntactically allowed in every full-head phase.
  A state $A_j$, $Z_j$, or success with $rho eq.not 0$ is declared zero.
  These are semantic zero declarations, not exclusions from the alphabet’s syntactic formats.
  Likewise a false after-gate state below is syntactically representable but zero.
  Replacement edges may have such zero-declared endpoints. This distinction is essential:
  a forged tour must be able to reach a zero-declared interface during rollback.
  The initial acquisition interface is $A_1$ with $rho = 0$.

Here are the complete movement conventions for both tours.
  The reading tour starts at the last position in a left-going phase.
  A left move changes a neighboring transaction pair $L \, F$ to $F \, R$.
  Each cell retains its payload, structural fields, and transaction metadata $\( l \, tau \, b \)$.
  Only the head’s control phase, clause index, committed-side bit $epsilon.alt$,
  and reading registers pass to the new head position; the vacated cell loses these head-only fields.
  Thus the relative block number at the new head is the number already carried by that cell,
  including when the move crosses a block boundary. For each address of clause $j$ located at the new head
  position, XOR the bit at that address into its corresponding reading register.
  If the cell is not an address, do nothing to the registers.
  At the known first position a unary turn enters a right-going phase.
  Right moves change $F \, R$ to $L \, F$ using the same field-transport convention and do not read bits.
  At the known last position a unary exit enters $B_j^(upright("gate"))$.
  Each of these moves has its exact inverse. The tour’s entry and exit edges preserve every register tuple,
  including tuples making an endpoint a semantic zero; they never reset a register.
  The last position is a stop cell, which is never a bit address,
  so the left-going convention reads every addressed bit once and none is lost at the initial endpoint.

At $B_j^(upright("gate"))$ the gate edge to $G_j^(upright("gate"))$ exists exactly when $Phi_j \( rho \)$ is true.
  An after-gate state $G_j^(upright("gate"))$ with false $Phi_j \( rho \)$ is declared zero.
  A before-gate state with a false value has no gate edge but is not, for that reason, zero.

The undo tour starts at $G_j^(upright("gate"))$, travels left without reading, turns at the first position,
  and travels right. On #emph[leaving] a cell, it XORs each bit addressed there into its corresponding reading
  register. It exits at the last position into $Z_j$. Its movement phases are distinct from the reading-tour
  phases, and all its edges have their inverse edges. Its entry and exit likewise preserve every register tuple,
  including zero-declared endpoint states. For $j < m$, a unary edge takes $Z_j$ to $A_(j + 1)$ with zero
  registers. For $j = m$ it takes $Z_m$ to a success phase, again with zero registers.
  The success phase is allowed only at the last position. For a replacement task with zero registers a unary
  success edge changes $epsilon.alt$ to $1 - epsilon.alt$. For a zero task the success phase is itself a unary
  zero declaration. There is no success-to-acquisition edge.
  A return to acquisition follows the inverses of (2.4) all the way to $A_1$.

Movement phases allow every position of the region, with clause index in ${ 1 \, dots.h \, m }$.
  Every turn or entry or exit is a separate unary phase change at its prescribed endpoint.
  The only register tests are the specified zero-register interfaces and the after-gate tests.
  This convention completely lists the control transitions; there is no clock or phase stored on wing cells.

Each elementary move is a unary or two-letter replacement.
  Take its instances for every value of unaffected fields, preserving them exactly,
  subject to the syntactic formats and the internal-pair conditions on a pair used inside a region.
  In an acquisition the changed pair is tested as an internal pair after acquisition.
  Every zero mentioned so far is also unary or binary. All strings of lengths $3 \, dots.h \,
  k$ have no elementary entries except in the provisional small-parameter convention below.
  The allowance of $l lt.eq k$ in the verifier causes no problem when a task of arity $l >
  2$ has no accepting input. A semantic zero declaration never removes an otherwise specified replacement edge.
  The acquisition interface, interclause edges, and edge from $Z_m$ to success retain their explicitly specified
  zero-register condition.

#thm([Lemma 2.4.])[
  #emph[Starting from a concatenation of complete clean blocks, the structural, transaction,
    and checker syntax is preserved under all elementary replacements.
    Distinct transactions never own cells of the same block. The elementary moves are context safe at both
    untouched neighboring letters, even when two transaction regions abut.]
] <fr:context>

#proof[
  Structural tags never change, so structural syntax is preserved.
    For the transaction syntax it suffices to check the interfaces of each kind of move.
  If an idle $C \( 1 \)$ occurs in a syntactically admissible complete configuration, its predecessor, if present,
    has an external right interface. The predecessor may be idle, a completed full region’s last letter,
    or a boundary cursor stopped at the preceding stop. Its successor $C \( 2 \)$ is idle:
    a new locked region cannot start at an internal core position.
    Creating a boundary cursor therefore preserves the external interface on each side.
    This remains true when the preceding boundary cursor intends to acquire more blocks.
    It has not acquired this block, and its next acquisition is blocked until the new cursor releases it.
  In an acquisition, the old cursor becomes a left marker and its idle successor becomes the new cursor.
    Its untouched predecessor previously permitted a left marker or a head with these same metadata,
    and still does. The new cursor has an external right interface, as the old idle cell did.
    If its untouched successor is inside that block, the successor is idle,
    since a locked region cannot start there; if it is a block start, it may also start a new region,
    which is an allowed external joint. The known-last restriction prevents acquisition from creating the
    prohibited last left marker. The inverse release has the same interface checks in reverse.
    At $C \( 1 \)$ inverse creation is possible only for a boundary cursor with no acquired successor,
    so it too preserves the outside interfaces.
  In a full movement $F \, R arrow.l.r L \, F$, the exterior predecessor permits respectively $F$ or $L$,
    and the exterior successor permits respectively $R$ or $F$. Their internal metadata are unchanged.
    A move cannot introduce a right marker at first or a left marker at last because the old head must have the
    indicated neighbor inside its region. Endpoint phase changes do not change these interfaces.
    The boundary-to-full change is at the last position, where both heads have an external right interface and the
    same left-interface requirement. Changing the committed side at success changes no interface at all.
  For the checker track, head creation occurs at its first position with an idle next checker cell, if present.
    A forward step changes $H_x \, I$ to $A_x \, H_x$ and has the prescribed predecessor and successor in the
    checker grammar. Its inverse has the same property. Palette swaps preserve both marker tracks,
    since their non-color fields must coincide. The main moves leave checker fields and colors in place;
    checker moves leave main fields and payload in place. In particular a main head may cross a checker head
    without any additional interface change.
  Finally any acquired part of a block includes its $C \( 1 \)$,
    or is a continuation of a region that acquired that $C \( 1 \)$ earlier.
    Creation is allowed only at an idle $C \( 1 \)$, and acquisition takes only idle cells.
    Since the only idle suffix of a partially acquired block is strictly after its cursor,
    no other transaction can start in that suffix or enter it from the left.
    This proves the ownership claim and completes the induction over replacements. ◻
]

For configurations reached from clean blocks, the context lemma ensures that a full transaction keeps its data and
  certificate fixed even when operations elsewhere are interleaved with its verification.
  For a fixed payload, the control path has two properties.
  A head started at its acquisition interface checks the clauses correctly;
  an arbitrary full-head state can be undone or exposes a zero.
  The second property is needed for words that did not start clean.

#thm([Lemma 2.5.])[
  #emph[Fix the data slots and certificate of a complete syntactically admissible transaction region.
    Using only full-head control moves and starting at $A_1$ with zero registers,
    a full head can reach success precisely when every clause is true on those fixed bits.
    No such path reaches a format, nonblank-register, or false-after-gate zero.
    After a replacement success changes the committed side, verification can be reversed to the acquisition interface.]
] <fr:verification>

#proof[
  The tour edges are invertible. Starting at $A_j$ with zero registers,
    the reading tour reaches its gate with exactly the three bits from the clause’s addresses,
    and the undo tour restores zero registers. A false gate breaks the path before its after-gate state.
    Backtracking cannot circumvent this break: the only changes of clause index are the specified edges from $Z_j$
    to $A_(j + 1)$, the only acquisition interface is $A_1$, and the only extra success edge changes a side bit
    which the schedule does not read. Thus success is reached exactly when all clauses are true, and no format,
    nonblank-register, or false-after-gate zero is reached. After a side change,
    the same clauses still read the same fixed slots, independently of the selected side,
    so all verification moves can be reversed. ◻
]

#thm([Lemma 2.6.])[
  #emph[A complete transaction region with one full head in any allowed control state can either be returned to
    acquisition by replacements inside the region, or can reach a declared zero there.
    This remains true when its control state and registers were not reached from acquisition.
    A boundary-cursor region can always be released inside its acquired interval.]
] <fr:rollback>

#proof[
  Fix the payload of the region. Each tour edge is a bijection on register tuples:
    it is either the identity or XOR by a specified tuple of the fixed payload bits.
    The legs and turns give a prescribed finite path. From any interior tour position,
    reversing that path reaches the endpoint preceding the tour, regardless of the initial register tuple.
    The endpoints exist because this is a complete region.
  For a reading tour this returns to its $A_j$ endpoint, where a nonzero register tuple is zero by declaration.
    For an undo tour it returns to $G_j^(upright("gate"))$. If the gate predicate there is false,
    the word is zero. Otherwise cross the gate backward and reverse the reading tour,
    again reaching $A_j$ or zero. The same argument starts directly from either gate phase.
    In particular a false before-gate value is not a trap: it can reverse its reading tour.
  From $A_j$ with $j > 1$, reverse the edge from $Z_(j - 1)$ and apply the same argument to the preceding clause.
    A success state first reverses to $Z_m$; its registers must already be zero, or it is a declared zero.
    Thus the clause index decreases until $A_1$ is reached, or a specified violation occurs.
    No argument assumes that an earlier clause has actually been checked.
    The reverse gate test and the required blank-register endpoints supply precisely the checks needed for
    arbitrary starting states.
  At $A_1$ reverse the boundary-to-full change. Inverse acquisition then moves the boundary cursor back through
    its acquired prefix, returning committed data to the idle cells; finally inverse creation removes it.
    None of these moves reads a cell outside the acquired interval.
    The same release argument applies immediately to a region already carrying a boundary cursor. ◻
]

=== 2.5 An addressable computation tableau and the fixed point <fr:tableau>

The moves above use a finite list of three-bit tests. We now produce that list from a computation deciding
  membership in the next-level rule table. Encoding an accepting computation by local Boolean constraints is the
  computation-tableau method used in Cook’s theorem [2] proof of Theorem 1.
  Here we specify the addresses and size bounds needed by the word rules.

We specify the clauses in (2.3). Fix once and for all a deterministic universal one-tape machine with a fixed
  finite tape alphabet and state set. It is arranged to simulate a supplied program code,
  to return its head to a distinguished origin when accepting, and then to remain frozen.
  The simulation and the return to the origin have polynomial overhead for every fixed simulated program.
  One explicit implementation stores the simulated tapes and head marks on tracks and scans their used portions to
  implement each simulated step; the used portions grow at most linearly in the number of simulated steps.
  A fixed binary interpreter handles the finite program code.
  Such scans give polynomial, rather than an assumed constant, simulation overhead, which is all that is needed here.

Put

$ T = 2^(floor.l h \/ 5 floor.r) \, wide W = 4 T \, wide o = 2 T . $

Use time rows $0 \, dots.h \, T - 1$ and tape positions $0 \, dots.h \, W - 1$, with the marked origin at $o$.
  Encode each tape symbol, origin marker, and possible head state with $beta$ bits,
  where $beta$ is an absolute constant. Let

$ "enc" \( n \) = 1^(\| "bin" \( n \) \|) 0 "bin" \( n \) $

for a nonnegative integer $n$, with $"bin" \( 0 \) = 0$. The initial tape,
  starting immediately to the right of the origin, contains

$ "enc" \( \| a \| \) thin a thin "enc" \( D h \) thin "enc" \( l \) thin "task" \( tau \) thin "data" . $

The data are the $l c D h$ bits in slot zero, ordered by block and core position, followed,
  for a replacement task, by the same list from slot one. All other initial cells are fixed,
  including the initial head and blank cells. Each bit coordinate of a cell encoding one input bit is a constant,
  that input bit, or its negation. Take $h$ large enough that this input occupies fewer than $T \/
  4$ tape positions. Neither the input nor a head starting at the origin can reach the boundary cells in fewer
  than $T$ steps.

A deterministic tape-machine step has a radius-one description:
  the new symbol and head label at a cell are determined by the previous labels at that cell and its two
  neighbors. Extend this map arbitrarily on inconsistent three-cell patterns to a total Boolean function

$ f : { 0 \, 1 }^(3 beta) arrow.r { 0 \, 1 }^beta . $

Fix a NAND circuit for $f$ with $g$ gates. Both $beta$ and $g$ are independent of $a \, D \, h$.
  The initial row is a valid one-head configuration, so the arbitrary values on inconsistent patterns will not be
  used in a satisfying tableau.

Allocate certificate variables $X \( t \, j \, r \)$ for all tableau bits,
  and $Y \( t \, j \, v \)$ for the auxiliary circuit gates, with exact one-based core addresses

$ X \( t \, j \, r \) & : quad 1 + beta \( W t + j \) + r \, &  & 0 lt.eq t < T \, quad 0 lt.eq j < W \, quad
  0 lt.eq r < beta \,\
Y \( t \, j \, v \) & : quad 1 + beta W T + g \( \( W - 2 \) t + j - 1 \) + v \, &  & 0 lt.eq t < T - 1 \, quad
  1 lt.eq j < W - 1 \, quad 0 lt.eq v < g . $

The total number of certificate variables is

#[#set math.equation(numbering: n => "(2.5)")
 $ beta W T + g \( W - 2 \) \( T - 1 \) . $ <fr:certificate-count>]

List the following clause families in the displayed order,
  using lexicographic order of their coordinates within each family.

+ For each initial-row bit use two clauses. A prescribed constant uses its unit clause twice;
  equality to an addressed data bit $x$, or to its negation, uses the two clauses expressing that equality.
+ For every later time and each of the two boundary cells, use one unit clause per bit, keeping that cell blank.
+ For each pair $\( t \, j \)$ with $t < T - 1$ and $1 lt.eq j < W - 1$, encode the $g$ NAND gates in order.
  The equation $z = not \( u and v \)$ uses the three clauses
  $ \( u or z \) \, wide \( v or z \) \, wide \( not u or not v or not z \) . $
  Here the circuit inputs are the appropriate neighboring variables $X \( t \, j - 1 \, r \) \,
    X \( t \, j \, r \) \, X \( t \, j + 1 \, r \)$ and the preceding gate variables at $\( t \, j \)$.
    Add two clauses for each of the $beta$ circuit outputs to equate it to the corresponding
    $X \( t + 1 \, j \, r \)$. Thus this family has exactly $3 g + 2 beta$ clauses per $\( t \, j \)$.
+ Use $beta$ unit clauses fixing the final cell at the origin to the accepting head state and its fixed origin
  symbol. The universal machine is arranged to leave that symbol fixed when it accepts and freezes.

Constants on circuit wires are allowed; clauses containing them are interpreted as Boolean functions of the
  remaining inputs. Use repeated literals, or an ignored dummy input for a constant function,
  to supply the three reading addresses. The number of clauses is exactly

#[#set math.equation(numbering: n => "(2.6)")
 $ 2 beta W + 2 beta \( T - 1 \) + \( 3 g + 2 beta \) \( W - 2 \) \( T - 1 \) + beta . $ <fr:clause-count>]

The clauses force a unique next row from the preceding row, with the correct gate values.
  Induction from the valid initial row therefore makes every satisfying tableau the actual computation of the
  universal machine. The fixed blank boundaries do not alter it, since the head cannot reach them.
  The final constraint is satisfied exactly when the computation accepts before time $T$;
  an earlier acceptance extends to the final row by freezing.
  Conversely every such accepting computation, with its circuit gate values, gives a satisfying certificate.

The four family sizes and the formulas for their addresses are explicit.
  Comparison with the four cumulative sizes followed by quotient and remainder recovers from one clause index its
  family, time, position, and bounded subindex. The gate circuit is fixed.
  Initial-row lookup selects a bit of the fixed code, a parameter bit, a delimiter, or one addressed data bit.
  Thus one clause and its at most three addresses are generated in time polynomial in $h$ for fixed $a \, D$,
  using $O \( h \)$-bit arithmetic. No preceding clauses or complete tableau are enumerated.

Both (2.5) and (2.6) are $O \( T^2 \)$ with absolute constants,
  so for all sufficiently large $h$ they are at most $q_h$.
  Store the entire certificate in the first relative core, in its first required number of certificate positions.
  Any unused certificate bits have no effect. Thus the only nonconstant quantities on a verifier head are its
  $O \( h \)$-bit clause index and the already listed metadata and three reading bits.
  Code $a$, the next-level letters, and the tableau are not head fields.

We now remove the apparent reference to an unspecified program. For a provisional code $a$, let

$ P \( a \, h \; l \, tau \, upright("candidate data") \) in { 0 \, 1 } $

be the following finite predicate. Decode the candidate one- or two-sided string of $l$ letters of length $c
  h$ and decide whether it is an elementary table entry described in Subsections 2.1–2.4,
  using the tableau with initial program code $a$ just specified.
  For replacements accept either orientation of every listed move.
  For zeros use the listed unary and binary declarations. For all other proposed entries return zero.
  Format zeros include illegal letter formats; replacement entries always have the specified syntactic fields on
  both sides. The additional semantic register and gate zeros do not exclude these fields or suppress any
  specified replacement entry. If the parameter is too small for any of the declared encodings, input layout,
  clause count, or certificate count to fit, use instead the trivial table declaring every one-letter word zero
  and having no replacements. These fit conditions are integer inequalities in the explicit layout sizes.

This predicate is computable in time polynomial in $h$ for fixed $a \, D$.
  A syntax test compares a bounded number of fields. A movement test checks the indicated changed bits and,
  if needed, generates the addresses for its one clause. An after-gate test evaluates one three-input truth
  function on the head registers. The predicate never asks whether a tableau exists and never executes the program
  $a$. It merely uses the finite string $a$ as part of the prescribed time-zero data.

We use Kleene’s fixed-point construction in the self-simulation setting developed by Durand, Romashchenko,
  and Shen, where polynomial-time local checks are also explicit [3] Section 2.3.
  The simulation overhead and clause-address computation for the present implementation must still be checked,
  as above and below.

For completeness, the fixed-point construction can be given at the level of finite programs.
  There is an effective constructor $s \( t \, v \)$ for a code that, on input $x$,
  simulates the two-input program $t$ on $\( v \, x \)$. A fixed wrapper obtains polynomial simulation overhead by
  the scanning implementation just described. Let $t$ be the two-input program which, on first input $v$,
  forms the finite code $s \( v \, v \)$ and, on remaining input $x$, computes $P \( s \( v \, v \) \, x \)$. Set

#[#set math.equation(numbering: n => "(2.7)")
 $ a = s \( t \, t \) . $ <fr:fixed-point>]

Then the program $a$ returns $P \( a \, x \)$ for every input.
  With this particular $a$ fixed, forming $s \( t \, t \)$ is a constant cost;
  evaluation of $P$ and the fixed wrapper have polynomial running time in $h$.
  There is no recursive call to $a$ during evaluation of $P$.

Choose $D$ before making (2.7). The program $a$ then has a polynomial running-time bound at parameter $D h$,
  with constants allowed to depend on the fixed $D \, a$. Since $T$ grows exponentially in $h$,
  choose $h_0$ so large that for every $h gt.eq h_0$ all field and layout bounds hold, and every such computation,
  including universal simulation and return to the origin, finishes strictly before $T$.
  In particular an input has an accepting tableau exactly when it is an elementary table entry at parameter $D h$.
  This is the desired finite, nonrecursive definition of all the tables.
  No increase of $c$ or $k$ depends on $D$ or on the length of $a$.

=== 2.6 Faithful simulation on clean words <fr:simulation>

We now combine the local verifier with the fixed point. An accepting certificate exists exactly for an elementary
  rule at parameter $D h$. We show that the canonical encoding $E_h$ simulates each such rule and that arbitrary
  lower-level replacements cannot destroy a nonzero encoded word.

#thm([Lemma 2.7.])[
  #emph[The substitution $E_h$ simulates every elementary next-parameter replacement and zero declaration.
    Moreover, if $w$ is a nonzero word at parameter $D h$, no sequence of lower-parameter replacements starting
    from $E_h \( w \)$ can reach a zero declaration.]
] <fr:faithful>

#proof[
  For an elementary replacement on $l$ letters, acquire the $l$ canonical blocks with the source data in the
    committed slot, the target data in the other slot, and an accepting computation certificate in the first core.
    All required acquisitions exist. The verifier checks every clause, reaches success,
    changes the committed side, and follows inverse verification and release moves to leave the target blocks.
    Their palettes and checker tracks have not changed. The same procedure for an elementary zero declaration uses
    its accepting certificate and reaches the success zero. No cell outside those blocks is needed.
  For the converse, consider any sequence from a concatenation of canonical blocks.
    By Lemmas 6 and 5, all structural and marker syntax remains valid and all palettes retain exactly one of each
    color. At any time read a represented higher-level word as follows.
    An idle core cell contributes its idle data bit. An acquired core cell contributes the data bit in the side
    selected on its region’s unique head. The ownership assertion in Lemma 6 makes this unambiguous.
    Acquisition and release preserve the represented word, even when they choose new uncommitted data or
    certificate bits after a partial release. Palette operations do not affect it.
  While a head is full, every slot and certificate bit of its region is fixed.
    Interleavings with another transaction cannot change this payload, by ownership;
    palette operations cannot change an addressed bit. Lemma 7 therefore applies throughout the transaction.
    If it reaches replacement success, its certificate establishes a genuine elementary rule on the currently
    represented letters. Changing the selected side changes the represented word by precisely that rule,
    and subsequent backtracking remains valid. A reached zero-task success likewise establishes an elementary zero
    on the currently represented word. No format, nonblank-register,
    or false-after-gate zero can be reached by verification started from acquisition.
  These statements induct over the arbitrary sequence of replacements.
    All represented words are replacement-equivalent to the starting word.
    If that word is nonzero, a simulated zero success is impossible;
    all other zero declarations have already been excluded by the invariants. This proves nonzero preservation.
    Complete initial blocks keep all transaction regions complete;
    an absent neighbor can only prevent a requested acquisition, never supply a new transition. ◻
]

A legal idle letter $C \( p \)$ at a middle core position $1 < p < q_h$ is a nonzero one-letter word.
  It is neither a unary zero nor the site of unary cursor creation, and no two-letter move applies to it.
  Such a position exists after increasing $h_0$. In particular,
  iterating Lemma 9 a finite number of times produces nonzero words of unbounded lengths at any fixed level.
  This observation does not require taking an infinite word or an infinite presentation.

=== 2.7 Arbitrary words, cuts, and isolated normalization <fr:tokens>

It remains essential to control words that do not begin clean. Here we use rollback in the opposite direction:
  any complete transaction appearing in a nonzero word must admit release,
  since exposing a zero inside that transaction would make the whole word zero.
  Declare a cut immediately before $C \( 1 \)$ if its transaction track is idle or has relative block number 1.
  This is a condition on one letter. In a locally admissible word it marks either an idle block beginning or the
  beginning of a transaction’s first block. In particular the unary exclusion of a right marker at a known first
  position prevents a headless right wing from masquerading as such a beginning at the left end of the whole word.

#thm([Lemma 2.8.])[
  #emph[There is a bound depending only on $h$ for every palette fragment in a nonzero word.
    One may take $16 q_h + 2$. An interval without a cut has bounded length depending only on $h$,
    including when the interval reaches an end of the word.]
] <fr:fragment-bound>

#proof[
  There is no transaction start strictly inside a palette. Its transaction track has at most one head and
    otherwise consists of constant-metadata wings, with a possible idle suffix after a boundary cursor.
    The checker track likewise has at most one head and constant passed and idle runs.
    The common refinement of these two ordered partitions, after removing their at most two head positions,
    has at most 16 homogeneous non-head intervals. This deliberately loose absolute bound also covers fragments
    with one or both ends missing. No payload is present on palette cells,
    and their relative block number is constant within an acquired part,
    so these intervals have identical fields except for color.
  If a color repeats inside such an interval, adjacent transpositions bring its two occurrences together,
    producing an equal-color zero. Hence each interval in a nonzero word has at most $q_h$ cells.
    The asserted palette bound follows. A whole block, or either of its fragments,
    therefore has length at most $17 q_h + 3$.
  At successive core beginnings an acquired region’s relative number strictly increases until at most $k$,
    unless a new transaction or idle block begins; the latter creates a cut.
    There is no other possible continuation, by the internal and external interface tests.
    Thus an interval with no cut contains at most $k$ intervening blocks, apart from its two end fragments. For example
  $ B_h = \( k + 2 \) \( 17 q_h + 3 \) $
  bounds every such interval. This argument uses available pair tests and the unary known-endpoint exclusions,
    not tests for missing word neighbors. ◻
]

#thm([Lemma 2.9.])[
  #emph[An interval between consecutive cuts in a nonzero word consists of between one and $k$ complete structural
    blocks and can be changed, using only replacements inside that interval, to a concatenation of canonical blocks.]
] <fr:token-normalization>

#proof[
  The interval begins at $C \( 1 \)$ and ends at $S$, because the next cut is another $C \( 1 \)$.
    If its first block is idle, there can be no locked start inside that block,
    and the next block would give a cut. The interval is then just one idle block.
    Otherwise its first nonidle letter has relative block number 1 and is $L$, a boundary cursor, or a full head;
    it cannot be $R$ by (2.2).
  Starting with a left marker, follow its internal successors.
    The chain cannot stop at an external interface, cross the next cut, or end at the known last position,
    where a left marker is forbidden. It must therefore reach a head inside the interval.
    A boundary cursor ends the acquired prefix; its remaining current block is idle,
    and any later block would begin a new interval. A full head forces a right wing as far as its known last
    position. The interfaces admit no second head on that wing.
    This proves that a nonidle interval contains exactly one transaction and at most $k$ blocks,
    including the final block if acquisition stopped partway through it.
  Every palette here is complete. First remove all its checker heads using Lemma 5, or obtain a zero.
    Apply Lemma 8 to the transaction head and release the acquired cells, or again obtain a zero.
    The interval is a factor of a nonzero word, so any sequence producing zero in the interval would produce zero
    in that word and is impossible. All these operations are thus successful replacements.
    Their support is inside the interval: checker removal stays in the palette and its preceding core cell,
    and release uses only the acquired prefix. Unlike the clean-start argument,
    this step does not require the initial control state to have been reached by acquisition.
  The interval is now idle on both tracks. In each palette a missing or repeated color would give zero by Lemma 5.
    Each palette has exactly $q_h$ cells and can be sorted. The remaining idle core data specify one bit string of
    length $c D h$ per block. These are letters of the upstairs bit-string alphabet,
    including its unused formats when considered before imposing its unary zero relations.
    The resulting word is exactly $E_h \( u \)$ for the corresponding string $u$ of between one and $k$ letters. ◻
]

To finish the proof of Proposition 4, the alphabet $Sigma_h$ has the required cardinality $2^(c h)$,
  and the tables just constructed are finite and have length at most two, in particular at most $k = 10$.
  Property Proposition 2.2 follows from Lemma 9 and the nonzero middle-core letter.

For Property Proposition 2.2, take as tokens the nonzero intervals with the syntax in Lemma 11.
  There are only finitely many: each has at most $k$ blocks and each block has the bound in Lemma 10.
  For each token fix one of the normalizations furnished by Lemma 11 and denote its upstairs word by $u_t$.
  A cleaned block has $q_h$ core cells, $q_h$ palette cells and one stop cell,
  so length preservation gives $\| t \| = \( 2 q_h + 1 \) \| u_t \|$.
  Every sufficiently long nonzero word has at least two cuts by Lemma 10;
  its prefix before the first and suffix from the last have length at most $B_h$.
  All intervening intervals are tokens, and the letter-recognized cuts make the decomposition unique.
  The normalizations take place in isolated intervals; no exterior head, palette cell, or boundary test has been used.

Finally, every complete palette in a nonzero token has length $q_h$ even before normalization,
  since its normalization preserves length and structural tags.
  Its at most two head singletons and at most 16 homogeneous non-head intervals therefore include an eligible run
  of length at least $\( q_h - 2 \) \/ 16$, hence at least $q_h \/ 100$ for the chosen parameters.
  A sufficiently long nonzero word has a token and such a palette.
  Swappability is an explicit table entry, and every eligible run has distinct colors by the duplication argument
  in Lemma 10. Its non-color tuple also determines its maximal endpoints.
  This proves Property Proposition 2.2 and completes the Proposition.

== 3 Cancellation and the matrix-nil algebra <sec:cancellation>

We now use the hierarchy of Proposition 4 to construct the algebra needed for the group argument.
  Fix its absolute constants $c \, k$, choose an integer

#[#set math.equation(numbering: n => "(3.1)")
 $ D > 10 \( c + 1 \) \( k + 1 \) \, $ <ca:D>]

and then perform the program construction in that proposition and choose $h_0$ sufficiently large.
  Thus $D$ is fixed before the program fixed point and before $h_0$. Throughout this section put

$ h_j = h_0 D^j \, wide q_j = 2^(h_j) \, wide L_j = 2 q_j + 1 \, wide Sigma_j = Sigma_(h_j) . $

In particular $\| Sigma_j \| lt.eq 2^(c h_j)$. Write $A_j \( K \) =
  A_(h_j) \( K \)$ for the algebra at level $j$ over a field $K$ of characteristic two, and write

$ E_j : A_(j + 1) \( K \) arrow.r A_j \( K \) $

for the homomorphism induced by the block substitution $E_(h_j)$.
  The same symbol denotes that substitution on words. Each upper letter is replaced by a word of length $L_j$.

For a word $w$ on $Sigma_j$, let $\[ w \]_j$ denote its algebra image. The empty word has image $1$.
  Scalar extension gives $A_j \( K \) = K ⊗_(bb(F)_2) A_j \( bb(F)_2 \)$:
  the defining relations have coefficients in $bb(F)_2$, and tensoring vector spaces over $bb(F)_2$ is exact.
  In particular a nonzero word over $bb(F)_2$ remains nonzero over $K$. We use the usual identification

$ M_d \( K \) ⊗_K A_j \( K \) = M_d \( A_j \( K \) \) . $

Thus a numerical matrix commutes with an algebra element when the latter is placed in every diagonal position,
  but numerical matrix factors retain their original order.

=== 3.1 Weighted sums and matrix powers <weighted-sums-and-matrix-powers>

A matrix with entries in the positive-degree part of $A_j \( K \)$ has a finite expansion

$ T = sum_(gamma in cal(C)) A_gamma ⊗ \[ v_gamma \]_j \, wide A_gamma in M_d \( K \) \, quad \| v_gamma \| gt.eq 1 . $

Each term in $T^a$ is indexed by a sequence of $a$ summands,
  whereas its total word length is the sum of the lengths of their labels.
  This length can vary among terms in the same power. We first prove cancellation after grouping such sequences by
  total word length. The final subsection will recover cancellation at each sufficiently large fixed number of factors.

#prodef([Definition 3.1.])[
  (Weighted tests).  A #emph[letter test] of dimension $d gt.eq
    1$ at level $j$ assigns a matrix $M \( a \) in M_d \( K \)$ to each $a in Sigma_j$.
    For $w = a_1 dots.h.c a_n$ put $M \( w \) = M \( a_1 \) dots.h.c M \( a_n \)$ and $M \( diameter \) = 1_d$.
    Its length-$n$ sum is
  #[#set math.equation(numbering: n => "(3.2)")
   $ S_(j \, n) \( M \) = sum_(w in Sigma_j^n) M \( w \) ⊗ \[ w \]_j . $ <ca:letter-sum>]
  A #emph[chunk test] of dimension $d$ and label bound $b gt.eq
    1$ consists of a finite set $cal(C)$ of chunk identifiers,
    a nonempty label $v_gamma in Sigma_j^(*)$ with $\| v_gamma \| lt.eq b$ for each $gamma in cal(C)$,
    and a weight $W_gamma in M_d \( K \)$. Its length-$n$ sum is
  #[#set math.equation(numbering: n => "(3.3)")
   $ C_(j \, n) \( cal(C) \, W \) = sum_(r gt.eq 0 \, med gamma_1 \, dots.h \, gamma_r in cal(C)\
\| v_(gamma_1) \| + dots.h.c + \| v_(gamma_r) \| = n) W_(gamma_1) dots.h.c
  W_(gamma_r) ⊗ \[ v_(gamma_1) dots.h.c v_(gamma_r) \]_j . $ <ca:chunk-sum>]
  The empty sequence contributes $1_d ⊗ 1$ when $n = 0$. A test #emph[eventually vanishes] if its length-$n$ sum
    is zero for every sufficiently large integer $n$.
] <ca:tests>

Different chunk identifiers may have the same label. Moreover,
  different sequences may spell the same word with different segmentations.
  All such sequences occur separately in Equation (3.3). The sums are finite because every label has positive
  length. For a letter test, the length-$n$ sum is exactly a matrix power:

$ S_(j \, n) \( M \) = (sum_(a in Sigma_j) M \( a \) ⊗ \[ a \]_j)^n . $

For longer chunk labels, the length-$n$ sum instead includes sequences with different numbers of factors.
  Unless a different bound is specified, a chunk test below has label bound $k$.

=== 3.2 Cancellation inside one palette run <cancellation-inside-one-palette-run>

The cancellation estimate uses an elementary alternating-multilinear argument.
  Its dimension bound is sufficient for the hierarchy below.

#thm([Lemma 3.2.])[
  (Alternating matrix sum).  #emph[For a field $K$ of characteristic two and matrices $X_1 \, dots.h \,
    X_m in M_d \( K \)$, put
$ cal(A)_m \( X_1 \, dots.h \, X_m \) = sum_(sigma in S_m) X_(sigma \( 1 \)) dots.h.c X_(sigma \( m \)) . $

 If $m > d^2$, then $cal(A)_m \( X_1 \, dots.h \, X_m \) = 0$.]
] <ca:alternating>

#proof[
  The map $cal(A)_m$ is multilinear. If $X_i = X_j$ with $i eq.not j$,
    pair a permutation $sigma$ with $\( i med j \) compose sigma$.
    The two products are equal, and the pairing has no fixed point. Their sum is zero in characteristic two.
    Hence $cal(A)_m$ is alternating, meaning that it vanishes whenever two arguments agree.
    Expand its arguments in a basis of the $d^2$-dimensional vector space $M_d \( K \)$.
    If $m > d^2$, each term in the multilinear expansion has a repeated basis argument and is therefore zero.
    This proves the result without any division by $m !$. ◻
]

#thm([Lemma 3.3.])[
  (Direct cancellation).  #emph[Fix $j \, d \, b$. If
#[#set math.equation(numbering: n => "(3.4)")
 $ q_j / 100 > b \( d^2 + 3 \) \, $ <ca:direct-bound>]

 then every dimension-$d$ chunk test of label bound $b$ at level $j$ eventually vanishes over every field of
   characteristic two.]
] <ca:direct>

#proof[
  Fix such a test and choose $n$ above the long-word threshold in Proposition 4.
    In its length-$n$ sum discard the sequences whose concatenated word is zero.
    We partition the remaining sequences into permutation orbits and prove that each orbit contributes zero.
  For each remaining sequence let $w$ be its concatenated word.
    Erase only the color field from each letter of $w$, retaining its position and all other fields.
    Among the maximal eligible runs, choose the first one having length at least $q_j \/ 100$.
    This choice exists by Proposition 4 and depends only on the color-erased word.
    Every eligible run in a nonzero word has distinct colors:
    if two colors agreed, adjacent transpositions within that run could bring them together and give a declared
    zero substring. This also explains why color distinctness need not enter the rule selecting the run.
  Mark the chunk boundaries of the sequence. Its #emph[packet] is the consecutive list of all complete chunks
    contained in the chosen run. Keep all other chunks fixed, including any chunk crossing an endpoint of the run.
    There are at most two crossing chunks. If the run has length $r$ and the packet contains $m$ chunks, then
  $ r lt.eq m b + 2 b \, wide m gt.eq r \/ b - 2 > d^2 . $
  Here the last inequality follows from Equation (3.4). In particular the packet is nonempty.
  Permute these $m$ whole chunks arbitrarily. They may have unequal lengths, but their total length is fixed.
    Thus the packet occupies the same letter interval after every permutation,
    and every letter in that interval retains the common non-color tuple.
    The color-erased word is unchanged at every position. Consequently the chosen maximal run is unchanged.
    The exterior chunks, including the endpoint-crossing chunks, are unchanged as well,
    so the complete chunks in this run are again exactly the packet just permuted.
    Its internal chunk boundaries may move; its endpoints and the rule selecting it do not.
  All words obtained in this way have the same algebra image:
    arbitrary permutations of their letters within the run are products of the allowed adjacent transpositions.
    If any permuted word were zero, their common image would be zero and the starting word would also be zero.
    Thus the discarded zero sequences cannot remove any member of a nonzero orbit,
    and every permuted sequence is still among the summands under consideration.
    Conversely applying the same procedure to any of them produces the same set of sequences.
    These sets are therefore a partition into orbits.
  The labels of the packet chunks are pairwise distinct. Indeed each begins with a different color,
    since their first letters occupy distinct positions of the distinct-color run.
    Hence the chunk identifiers in the packet are also pairwise distinct,
    even if the original list admitted several identifiers with a common label.
    All $m !$ permutations give different sequences of identifiers; the orbit is a free permutation orbit.
    This assertion concerns sequences, not their concatenated words.
    Distinct segmentations of a word remain separate summands and belong to their respective orbits.
  Choose one orbit and write its fixed exterior matrix products as $U \, V$, the packet weights as $X_1 \,
    dots.h \, X_m$, and its common algebra image as $a in A_j \( K \)$. Its entire contribution is
  $ U (sum_(sigma in S_m) X_(sigma \( 1 \)) dots.h.c X_(sigma \( m \))) V ⊗ a . $
  The weights $X_i$ themselves need not be distinct. The displayed middle sum vanishes by Lemma 13.
    There are only finitely many sequences of total length $n$,
    so summing the zero orbit contributions proves the desired vanishing. ◻
]

=== 3.3 Moving a test to a larger palette <moving-a-test-to-a-larger-palette>

Direct cancellation applies when the palette is large compared with the test dimension.
  The fixed palette at level zero cannot meet Equation (3.4) for every dimension.
  We first treat a letter test by moving it to the next level, where the palette is larger.
  The cuts turn it into a chunk test on the bounded upper words attached to tokens.
  The matrix automaton then turns such a chunk test back into a letter test,
  so that the passage to the next level can be repeated. We keep track of the increase in dimension and apply
  direct cancellation as soon as its inequality holds for an incoming chunk test.
  The automaton will also reduce any level-zero chunk test to a letter test,
  thereby covering the longer labels in the original matrix expansion.

#thm([Lemma 3.4.])[
  (Reduction by the cuts).  #emph[Fix a level $j$, a field $K$ of characteristic two, and a dimension $d$.
    If every dimension-$d$ chunk test of label bound $k$ at level $j + 1$ eventually vanishes,
    then every dimension-$d$ letter test at level $j$ eventually vanishes.]
] <ca:cut-reduction>

#proof[
  Let $M$ be a letter test at level $j$. By Proposition 4, there are integers $B \,
    N_0$ such that every nonzero word of length at least $N_0$ has the stated cut decomposition,
    with initial and final pieces of length at most $B$. Increase $B$ to at least one.
    A cut is recognized solely from the letter immediately after it;
    there is no additional cut after the last letter of the word.
  Take the token list $cal(T)$ to be a set of distinct literal words.
    For each $t in cal(T)$ fix once and for all an upper word $u_t$ with
  #[#set math.equation(numbering: n => "(3.5)")
   $ 1 lt.eq \| u_t \| lt.eq k \, wide \| t \| = L_j \| u_t \| \, wide \[ t \]_j =
     E_j \( \[ u_t \]_(j + 1) \) . $ <ca:token-normalization>]
  If a token has more than one possible upper normal form, choose one; it is the literal token,
    not its normal form, that indexes this list. Every token begins with a cut letter and contains no further cut
    letter.
  Let $cal(P)$ be the finite set of words of length at most $B$ containing no cut letter,
    including the empty word. Let $cal(S)$ be the finite set of words of lengths $1$ through $B$ whose first
    letter is a cut letter and whose remaining letters are not. Consider concatenations
  #[#set math.equation(numbering: n => "(3.6)")
   $ p thin t_1 dots.h.c t_r thin s \, wide p in cal(P) \, quad s in cal(S) \, quad t_i in cal(T) . $ <ca:cut-language>]
  They have a unique such representation: the prefix ends at the first cut, the suffix begins at the last cut,
    and the intervening cut intervals are exactly $t_1 \, dots.h \, t_r$.
    This also proves uniqueness when $r = 0$. For sufficiently large length every nonzero word has this
    representation. Some concatenations in Equation (3.6) may be zero,
    and some zero words may have no representation; in either case their contribution to Equation (3.2) is zero.
    Thus summing all concatenations in Equation (3.6) neither loses nor duplicates any nonzero contribution.
  Use $cal(T)$ as the chunk identifiers at level $j + 1$, with label $u_t$ and weight $M \( t \)$.
    Denote the resulting length-$m$ sum by $C_m$. For every sufficiently large $n$ we have the exact identity
  #[#set math.equation(numbering: n => "(3.7)")
   $ S_(j \, n) \( M \) = sum_(p in cal(P) \, med s in cal(S)\
m = \( n - \| p \| - \| s \| \) \/ L_j in bb(Z)_(gt.eq 0)) #scale(x: 120%, y: 120%)[\(] M \( p \) ⊗ \[ p \]_j
  #scale(x: 120%, y: 120%)[\)] \( upright("id") ⊗ E_j \) \( C_m \) #scale(x: 120%, y: 120%)[\(]
  M \( s \) ⊗ \[ s \]_j #scale(x: 120%, y: 120%)[\)] . $ <ca:cut-identity>]
  Indeed the length equation follows from Equation (3.5); multiplicativity of $M$ preserves the matrix order,
    and the token equalities give the algebra factor. No nonzero-preservation or injectivity assertion about $E_j$
    is required for this identity. In particular, an upper concatenation whose encoded product vanishes causes no
    difficulty.
  By hypothesis $C_m = 0$ for $m gt.eq N_1$, for some $N_1$.
    Since $\| p \| + \| s \| lt.eq 2 B$, every integer $m$ occurring in Equation (3.7) is at least $N_1$ once $n
    gt.eq 2 B + L_j N_1$. Taking $n$ also large enough for that identity proves the lemma. ◻
]

Finite-dimensional matrix products as word weights are part of the theory of weighted automata and recognizable
  series developed by Schützenberger [14]. A related matrix encoding of products of bounded lengths is used by
  Smoktunowicz [15] Sections 6 and 7 to derive quasi-regularity from matrix nilpotence.
  The following prefix-state construction keeps chunk boundaries explicit and supplies the dimension estimate
  needed for our reduction.

#thm([Lemma 3.5.])[
  (A matrix automaton for chunks).  #emph[Let $Sigma$ be a nonempty finite alphabet of size $s$,
    and let a chunk test over $Sigma$ have dimension $d$ and label bound $b$.
    There is a letter test of dimension at most
#[#set math.equation(numbering: n => "(3.8)")
 $ C_b s^b d \, wide C_b = b \, $ <ca:automaton-bound>]

 whose length-$n$ sum has the chunk sum as one fixed $d$ by $d$ block for every $n$.
   Consequently eventual vanishing of all letter tests in that dimension implies eventual vanishing of the chunk test.]
] <ca:automaton>

#proof[
  First combine all identifiers with the same label $v$ into one weight
  $ W \( v \) = sum_(gamma : thin v_gamma = v) W_gamma . $
  Distributivity shows that this leaves every chunk sum unchanged,
    including the contributions from repeated occurrences of such a label.
    Zero weights can be retained or removed. If there are no labels,
    take every letter matrix to be the zero $d$ by $d$ matrix; this gives the assertion, including length zero.
    Hence suppose the label set is $cal(V) eq.not diameter$.
  The states are the empty word $epsilon.alt$ and all nonempty proper prefixes of labels in $cal(V)$.
    For each state $p$ and letter $a in Sigma$ put an identity-weighted transition
  $ p arrow.r^(med a \, thin 1_d med) p a $
  whenever $p a$ is a proper prefix of some label. Put a closing transition
  $ p arrow.r^(med a \, thin W \( p a \) med) epsilon.alt $
  whenever $p a in cal(V)$. Both kinds of transition are allowed when $p a$ is both a label and a proper prefix.
    We add the weights of any transitions with identical initial state, final state, and letter.
  If the number of states is $e$, define $B \( a \) in M_(e d) \( K \)$ by taking its $\( p \, q \)$ block to be
    the sum of the weights of transitions from $p$ to $q$ with letter $a$.
    The $\( epsilon.alt \, epsilon.alt \)$ block of $B \( a_1 \) dots.h.c
    B \( a_n \)$ is the sum of the weights of all paths reading $a_1 dots.h.c
    a_n$ and beginning and ending at $epsilon.alt$. The visits to $epsilon.alt$ mark exactly the closures of
    chunks. A path between two consecutive visits reads one label $v$,
    contributes identity weights until its last step, and then contributes $W \( v \)$.
    Paths therefore correspond bijectively to segmentations into labels,
    with exactly the ordered matrix products required in Equation (3.3).
    Taking the $\( epsilon.alt \, epsilon.alt \)$ block after summing the words with their algebra images proves
    the asserted identity.
  Every state is a word of length less than $b$, so
  $ e lt.eq sum_(i = 0)^(b - 1) s^i lt.eq b s^(b - 1) lt.eq C_b s^b . $
  Padding the matrices by zero blocks, if needed, realizes any larger specified dimension without changing
    positive-length sums in the original block. This proves the dimension claim. ◻
]

=== 3.4 Finite termination of the reduction <finite-termination-of-the-reduction>

A fixed level directly cancels tests whose dimension is small compared with its palette.
  Passing to the next level enlarges the palette and also enlarges the test dimension through the chunk automaton.
  We now compare these two growth rates and stop the reduction after finitely many levels for each fixed test.

#thm([Proposition 3.6.])[
  (Eventual vanishing of every fixed test).  #emph[Over every field $K$ of characteristic two,
    every letter test at level zero eventually vanishes. The same is true of every level-zero chunk test with any
    fixed finite label bound.]
] <ca:all-tests>

#proof[
  Fix the field and a starting letter-test dimension $d$. For $j gt.eq 1$ define integer dimension bounds
  #[#set math.equation(numbering: n => "(3.9)")
   $ d_j = d product_(i = 1)^(j - 1) #scale(x: 120%, y: 120%)[\(] C_k \| Sigma_i \|^k
     #scale(x: 120%, y: 120%)[\)] . $ <ca:dimension-product>]
  The empty product gives $d_1 = d$. Lemma 15 reduces dimension-$d$ letter tests at level zero to dimension-$d_1$
    chunk tests at level one. At a level $i gt.eq 1$, Lemma 16 turns a dimension-$d_i$ chunk test into a letter
    test of dimension at most $d_(i + 1) = C_k \| Sigma_i \|^k d_i$ at that same level.
    Padding to dimension $d_(i + 1)$ and applying Lemma 15 reduces its vanishing to that of a
    dimension-$d_(i + 1)$ chunk test at level $i + 1$.
  We show that these reductions can be stopped after finitely many levels.
    Using $\| Sigma_i \| lt.eq 2^(c h_i)$ and the geometric sum for $h_i$, we obtain
  #[#set math.equation(numbering: n => "(3.10)")
   $ log_2 \( d_j^2 \) & lt.eq 2 log_2 d + 2 \( j - 1 \) log_2 C_k + 2 k c sum_(i = 1)^(j - 1) h_i\
 & = 2 log_2 d + 2 \( j - 1 \) log_2 C_k + frac(2 k c, D - 1) \( h_j - h_1 \) . $ <ca:dimension-growth>]
  By Equation (3.1), the number $delta = 1 - 2 k c \/ \( D - 1 \)$ is strictly positive.
    Since $h_j = h_0 D^j$, it follows from Equation (3.10) that
  $ h_j - log_2 \( d_j^2 \) arrow.r + oo . $
  In particular there is a finite $J gt.eq 1$ such that
  $ 2^(h_J) > 400 k d_J^2 gt.eq 100 k \( d_J^2 + 3 \) \, $
  where the second inequality uses $d_J gt.eq 1$. Direct cancellation, Lemma 14,
    therefore applies to all dimension-$d_J$ chunk tests of label bound $k$ at level $J$.
  Work backwards through the finitely many reductions. If all dimension-$d_(i + 1)$ chunk tests at level $i +
    1$ eventually vanish, then all dimension-$d_(i + 1)$ letter tests at level $i$ eventually vanish by Lemma 15.
    Lemma 16 then gives eventual vanishing for all dimension-$d_i$ chunk tests at level $i$.
    Descending to level one and using Lemma 15 once more proves the letter-test assertion at level zero.
  For precision, no common length threshold for all tests is being postulated.
    The stopping level $J$ above depends only on the starting dimension and the fixed hierarchy.
    Each application of the reductions uses a finite test and, in the cut reduction,
    finitely many bounded end pieces. A threshold for the particular resulting test is pulled back through
    finitely many length dilations and additions of bounded end lengths. The conclusion has the order of quantifiers
  $ upright("for every fixed test, there is ") N upright(" such that every length ") n gt.eq
    N upright(" has zero sum") . $
  It does not require one $N$ for all dimensions.
  Finally, a level-zero chunk test of dimension $d$ with any label bound $b$ is a block of a level-zero letter
    test of finite dimension at most $C_b \| Sigma_0 \|^b d$, by Lemma 16.
    The already proved letter-test assertion applies to that test and proves the final claim. ◻
]

=== 3.5 The algebra and coefficient extraction <the-algebra-and-coefficient-extraction>

#thm([Theorem 3.7.])[
  #emph[There is an infinite, finitely presented, graded unital associative $bb(F)_2$-algebra
$ R = xor.big_(n gt.eq 0) R_n = bb(F)_2 xor I \, wide R_0 = bb(F)_2 \, wide I = xor.big_(n gt.eq 1) R_n \, $

 such that $M_ell \( I \)$ is nil for every integer $ell gt.eq 1$:
   each matrix with entries in $I$ is nilpotent, with its own nilpotence index.]
] <thm:algebra>

#proof[
  Take $R = A_0 \( bb(F)_2 \)$, using only the level-zero alphabet and the level-zero relations.
    The alphabet is finite, and there are only finitely many words of length at most $k$ on it.
    The chosen replacement rules and zero rules thus give an ordinary finite algebra presentation
  $ R = bb(F)_2 chevron.l Sigma_0 chevron.r \/ cal(J)_0 \, $
  where $cal(J)_0$ is the two-sided ideal generated by $u -
    v$ for the listed replacements $u arrow.l.r v$ and by $w$ for the listed zero words $w$.
    No relation from a higher level is added to this ideal. All defining polynomials are homogeneous of positive
    degree, so word length gives the displayed grading, the empty word spans $R_0 = bb(F)_2$,
    and the positive-degree part $I$ is a two-sided ideal.
  For every $j gt.eq 1$, choose a nonzero letter $a_j$ at level $j$. The word
  $ w_j = E_0 E_1 dots.h.c E_(j - 1) \( a_j \) $
  is nonzero by repeated use of the nonzero-preservation clause of Proposition 4.
    Its length is $L_0 L_1 dots.h.c L_(j - 1)$, which tends strictly to infinity because each $L_i > 1$.
    The nonzero classes $\[ w_j \]_0$ lie in distinct homogeneous degrees and are therefore linearly independent.
    Consequently $R$ is infinite-dimensional over $bb(F)_2$, and in particular is an infinite set.
  Fix $ell gt.eq 1$ and $T in M_ell \( I \)$. Express its entries as finite linear combinations of nonempty word
    images and collect matrix coefficients to write
  #[#set math.equation(numbering: n => "(3.11)")
   $ T = sum_(gamma in cal(C)) A_gamma ⊗ \[ v_gamma \]_0 \, wide A_gamma in M_ell \( bb(F)_2 \) \,
     wide \| v_gamma \| gt.eq 1 . $ <ca:T-expansion>]
  If this list is empty then $T = 0$ and there is nothing to prove. Otherwise let $b = max_gamma \| v_gamma \|$.
    Introduce a central indeterminate $z$ and apply Proposition 17 over the field $K =
    bb(F)_2 \( z \)$ to the chunks $v_gamma$ with weights $z A_gamma$. Its length-$n$ sum is the image of the polynomial
  #[#set math.equation(numbering: n => "(3.12)")
   $ P_n \( z \) = sum_(r gt.eq 0 \, med gamma_1 \, dots.h \, gamma_r in cal(C)\
sum_i \| v_(gamma_i) \| = n) z^r A_(gamma_1) dots.h.c A_(gamma_r) ⊗ \[ v_(gamma_1) dots.h.c v_(gamma_r) \]_0 med
  in M_ell \( R \) \[ z \] . $ <ca:length-polynomial>]
  For fixed $n$ this is a finite polynomial: nonempty chunks imply $r lt.eq n$ for every positive-length term.
    The proposition supplies $N$ such that the image of $P_n \( z \)$ in $M_ell \( K ⊗_(bb(F)_2) R \)$ is zero
    whenever $n gt.eq N$.
  The map
  $ M_ell \( R \) \[ z \] arrow.r M_ell \( bb(F)_2 \( z \) ⊗_(bb(F)_2) R \) $
  is injective. For example, choose an $bb(F)_2$-basis of $R$ and expand the finitely many coefficients of a
    polynomial in that basis; its image is zero exactly when every resulting scalar polynomial is zero in
    $bb(F)_2 \( z \)$, hence in $bb(F)_2 \[ z \]$. Thus $P_n \( z \)$ itself is zero for all $n gt.eq N$,
    and each of its coefficients can legitimately be extracted in the original matrix algebra.
  For an integer $a gt.eq 1$, expansion of Equation (3.11) and grouping its sequences by total word length gives
    the finite identity
  #[#set math.equation(numbering: n => "(3.13)")
   $ T^a = sum_(n = a)^(a b) \[ z^a \] P_n \( z \) . $ <ca:power-coefficient>]
  The lower bound $a$ uses that every factor has a nonempty label;
    the upper bound $a b$ uses the fixed maximum label length.
    If $a gt.eq N$, every polynomial on the right of Equation (3.13) is zero. Hence $T^a = 0$.
    Since $ell$ and $T$ were arbitrary, every $M_ell \( I \)$ is nil, as asserted. ◻
]

The positive-degree presentation also gives a finitely presented algebra without an identity.
  Recall that a nonunital algebra is nil if each of its elements is nilpotent,
  whereas it is nilpotent if one power of the whole algebra is zero.
  Its unitization adjoins a scalar identity; an algebra over a field is algebraic if every element satisfies a
  nonzero polynomial over that field.

#thm([Corollary 3.8.])[
  (Finitely presented nil and algebraic algebras).  #emph[For the algebra $R = bb(F)_2 xor I$ of Theorem 18,
    the following hold.]
  + #emph[The positive-degree ideal $I$, regarded as a nonunital associative $bb(F)_2$-algebra,
    is finitely presented, infinite-dimensional, and nil, but $I^m eq.not 0$ for every integer $m gt.eq 1$.
    In particular, it is a finitely presented Jacobson radical algebra that is not nilpotent.]
  + #emph[The algebra $R$ is the unitization of $I$ and is an infinite-dimensional finitely presented algebraic
    unital associative $bb(F)_2$-algebra. More precisely, if $r = a 1 + i$ with $a in bb(F)_2$ and $i in I$,
    there is an integer $N = N \( i \) gt.eq 1$ such that
$ \( r - a 1 \)^N = i^N = 0 . $

 Thus $r$ satisfies the nonzero monic polynomial $\( t - a \)^N$.]
] <cor:nil-algebra>

#proof[
  Let $F = bb(F)_2 chevron.l Sigma_0 chevron.r$ be the free unital algebra used in Theorem 18,
    and let $F_(+)$ be its subalgebra spanned by the nonempty words.
    This is the free nonunital associative algebra on the finite alphabet $Sigma_0$.
    Let $S subset F_(+)$ be the finite set of defining polynomials:
    the listed $u - v$ and the listed zero words $w$. Write $\( S \)_(+)$ for the two-sided ideal of the nonunital
    algebra $F_(+)$ generated by $S$. Both $\( S \)_(+)$ and the unital ideal $cal(J)_0 = \( S \)_F$ are the
    linear span of the products $u s v$, with $s in S$ and with each word context $u \, v$ allowed to be empty.
    Indeed, closure under multiplication by $F_(+)$ gives the nonempty contexts,
    while the generators themselves and one-sided products give the empty contexts.
    Since every $s$ has positive degree, these products lie in $F_(+)$.
    Hence $cal(J)_0 = \( S \)_(+) subset F_(+)$, and restriction of the quotient map gives
  $ I tilde.equiv F_(+) \/ \( S \)_(+) . $
  This is a finite presentation in the nonunital category. The splitting $F = bb(F)_2 xor F_(+)$ descends to $R =
    bb(F)_2 xor I$ with the usual unitization multiplication.
  Theorem 18 and this direct sum show that $I$ is infinite-dimensional.
    Taking matrix size one in that theorem shows that $I$ is nil. If $i^N = 0$, then in its unitization
  $ \( 1 - i \)^(- 1) = sum_(j = 0)^(N - 1) i^j . $
  Thus every element of $I$ is quasi-regular, so $I$ is Jacobson radical.
    If $I^m = 0$ for some $m$, every word in the finite generating alphabet of length at least $m$ would vanish.
    The images of the finitely many words of lengths $1 \, dots.h \, m - 1$ would then span $I$,
    contradicting its infinite dimension. Therefore $I^m eq.not 0$ for every $m gt.eq 1$.
  The finite presentation and infinite dimension of $R$ are already part of Theorem 18.
    For $r = a 1 + i$ choose $N = N \( i \)$ with $i^N = 0$. Then $\( r - a 1 \)^N = i^N = 0$,
    which proves that $r$ is algebraic over $bb(F)_2$. This applies to every element of $R$. ◻
]

#prodef([Remark 3.9.])[
  The nilpotence indices in Theorem 18 and the polynomial degrees in Corollary 19 may depend on the chosen matrix
    or element. No common exponent is asserted.
] <ca:no-uniform-index>

== 4 An ordinary finite presentation for the Steinberg group <sec:finite-presentation>

Let $R$ be a unital associative algebra over $bb(F)_2$ and let $n gt.eq 3$.
  Recall that $"St"_n \( R \)$ is generated by the root symbols $x_(i j) \( a \)$ with relations (1.1)–(1.1).
  We continue to use $\[ g \, h \] = g h g^(- 1) h^(- 1)$. In the commutation relation,
  both generators have unequal row and column indices; in particular, roots in a single position commute.
  The addition relation gives $x_(i j) \( 0 \) = 1$ and $x_(i j) \( a \)^2 = 1$.

Write $e_(i j) \( a \)$ for the matrix with diagonal entries $1$, entry $a$ in position $\( i \, j \)$,
  and all other entries $0$. These matrices satisfy Equations (1.1)–(1.1), with $x$ replaced by $e$.
  Let $"GL"_n \( R \)$ be the group of invertible $n times n$ matrices over $R$,
  and let $"E"_n \( R \)$ be the subgroup generated by the matrices $e_(i j) \( a \)$.
  We therefore have a surjective homomorphism

#[#set math.equation(numbering: n => "(4.1)")
 $ pi_n : "St"_n \( R \) arrow.r "E"_n \( R \) \, wide x_(i j) \( a \) mapsto e_(i j) \( a \) . $ <fp:matrix-map>]

We write

#[#set math.equation(numbering: n => "(4.2)")
 $ J_n \( R \) = "Ker" pi_n . $ <fp:kernel-definition>]

When the algebra is understood, we omit $R$ from these group names.

=== 4.1 The finite presentation <the-finite-presentation>

Krstić and McCool prove finite presentability of Steinberg groups over finitely presented unital rings for $n
  gt.eq 4$ [9] Theorem 3. The explicit characteristic-two presentation below follows their method of extending
  monomial root relations by word length and then imposing the algebra relators [9] Section 3.
  We give the induction for $n gt.eq 5$ and prove that the finite relations imply every Steinberg relation.
  The algebra construction supplies the required input.

Let $cal(A)$ be a finite alphabet. Its free monoid $cal(A)^(*)$ includes the empty word $epsilon$, of length zero.
  The free unital associative algebra $T = bb(F)_2 chevron.l cal(A)
  chevron.r$ has $cal(A)^(*)$ as a vector-space basis, with $epsilon$ representing $1$ and multiplication given by
  concatenation. Thus each $f in T$ has a unique expression

$ f = sum_(w in S_f) w $

for a finite set $S_f subset.eq cal(A)^(*)$. We fix an ordering of the alphabet and use length followed by
  lexicographic order to order such finite sets. The order will only specify literal words in a finite group
  presentation; the resulting root elements will commute.

#thm([Theorem 4.1.])[
  (Finite presentation of the Steinberg group).  #emph[Let
$ R = T \/ frak(a) \, wide T = bb(F)_2 chevron.l cal(A) chevron.r \, wide frak(a) = \( f_1 \, dots.h \, f_s \) $

 be a finite presentation as a unital associative $bb(F)_2$-algebra,
   where $frak(a)$ denotes the two-sided ideal generated by the listed polynomials.
   If $n gt.eq 5$, then $"St"_n \( R \)$ has the following ordinary finite group presentation.]
  #emph[The generators are
$ g_(i j) \( w \) \, wide i eq.not j \, quad w in cal(A)^(*) \, quad \| w \| lt.eq 2 . $

 To specify the relators, define a formal group word $xi_(i j) \( w \)$ in these generators for every $w in
   cal(A)^(*)$. For $\| w \| lt.eq 2$, put $xi_(i j) \( w \) = g_(i j) \( w \)$.
   For $\| w \| > 2$, write $w = a v$, with $a in cal(A)$ its first letter, choose the least $h in { 1 \,
   dots.h \, n } \\ { i \, j }$, and put
$ xi_(i j) \( w \) = \[ xi_(i h) \( a \) \, xi_(h j) \( v \) \] . $

 This recursion terminates and gives a finite group word for each $w$. The defining relations are
#[#set math.equation(numbering: n => "(4.3)")
 $ g_(i j) \( w \)^2 & = 1 \, &  & \| w \| lt.eq 2 \,\
 & = 1 \, &  & \| u \| \, \| v \| lt.eq 2 \, quad j eq.not k \, med i eq.not l \,\
 & = g_(i k) \( u v \) \, &  & \| u \| + \| v \| lt.eq 2 \, quad i \, j \, k upright(" pairwise distinct") \,\
product_(w in S_(f_t)) xi_(i j) \( w \) & = 1 \, &  & 1 lt.eq t lt.eq s \, quad i eq.not j . $ <fp:finite-square>]

 The product in Equation (4.3) is taken in the fixed order above, and an empty product is $1$.
   The isomorphism to $"St"_n \( R \)$ sends $g_(i j) \( w \)$ to $x_(i j) \( overline(w) \)$,
   where $overline(w)$ is the image of $w$ in $R$.]
] <thm:finite-presentation>

The proof constructs a root for a longer monomial as a commutator of roots for shorter pieces.
  Spare coordinates will show that the result is independent of the split and the intermediate index.
  At each new length we then establish commutation before treating products with the empty word.
  The following group identity makes the split comparison; its centrality conclusion is proved, rather than assumed.

#thm([Lemma 4.2.])[
  (Three-factor commutator identity).  #emph[Let $X \, Y \, Z$ belong to a group,
    and put $A = \[ X \, Y \]$ and $B = \[ Y \, Z \]$. Assume that $A$ commutes with $X$ and $Y$,
    that $B$ commutes with $Y$ and $Z$, and that $A$ commutes with $B$ and $X$ commutes with $Z$. Then
$ \[ A \, Z \] = \[ X \, B \] . $

 Moreover, this common element centralizes each of $A \, Z \, X \, B$.]
] <fp:three-factor>

#proof[
  Let $H_1 = chevron.l A \, Z chevron.r$ and $H_2 = chevron.l X \, B chevron.r$.
    Every generator of $H_1$ commutes with every generator of $H_2$ by the assumptions,
    so these two subgroups centralize one another. Conjugation of $\[ X \, Z \] = 1$ by $Y$, together with
  $ Y X Y^(- 1) = A^(- 1) X \, wide Y Z Y^(- 1) = B Z \, $
  gives $\[ A^(- 1) X \, B Z \] = 1$. Since $B$ and $Z$ commute,
    and since the factors from $H_1$ commute with those from $H_2$, expansion of this commutator gives
  $ 1 = \[ A^(- 1) X \, Z B \] = \[ A^(- 1) \, Z \] \[ X \, B \] . $
  Set $C = \[ A^(- 1) \, Z \]$ and $D = \[ X \, B \]$. Then $C = D^(- 1)$ belongs to both $H_1$ and $H_2$.
    An element in their intersection centralizes each subgroup, so $C$ commutes with $A \, Z \, X \, B$.
    Finally, direct expansion gives
  $ \[ A \, Z \]^(- 1) = A \[ A^(- 1) \, Z \] A^(- 1) = A C A^(- 1) = C = D^(- 1) . $
  This proves both assertions. ◻
]

#proof[
  First omit Equation (4.3), and denote the resulting finitely presented group by $P_0$.
    We will prove $P_0 tilde.equiv "St"_n \( T \)$, and then impose the algebra relators.
  ===== 4.1.1 Construction of all monomial roots. <construction-of-all-monomial-roots.>
  We construct elements $y_(i j) \( w \) in P_0$ for every word $w$.
    For $\| w \| lt.eq 2$, set $y_(i j) \( w \) = g_(i j) \( w \)$.
    The precise induction assertion at an integer $N gt.eq 2$ is the following:
  + The elements $y_(i j) \( w \)$ are defined for all $\| w \| lt.eq N$.
    For every positive-length split $w = u v$ with $\| w \| lt.eq N$ and every $h in.not { i \, j }$, they satisfy
    #[#set math.equation(numbering: n => "(4.4)")
     $ y_(i j) \( w \) = \[ y_(i h) \( u \) \, y_(h j) \( v \) \] . $ <fp:positive-split>]
    In particular, the value is independent of both the split and $h$.
  + Every $y_(i j) \( w \)$ with $\| w \| lt.eq N$ is an involution.
  + Whenever $\| u \| \, \| v \| lt.eq N$, $j eq.not k$, and $i eq.not l$, one has
    #[#set math.equation(numbering: n => "(4.5)")
     $ \[ y_(i j) \( u \) \, y_(k l) \( v \) \] = 1 . $ <fp:all-monomial-commutations>]
    There is no restriction on $\| u \| + \| v \|$ beyond the consequence $\| u \| + \| v \| lt.eq 2 N$.
  + Whenever $\| u \| + \| v \| lt.eq N$ and $i \, j \, k$ are pairwise distinct,
    #[#set math.equation(numbering: n => "(4.6)")
     $ \[ y_(i j) \( u \) \, y_(j k) \( v \) \] = y_(i k) \( u v \) . $ <fp:all-monomial-products>]
    This assertion includes $u = epsilon$ or $v = epsilon$.
  At $N = 2$ these assertions follow directly from Equations (4.3)–(4.3).
  Suppose the assertions hold at $N - 1$, where $N gt.eq 3$,
    and fix a word $w$ of length $N$ and distinct indices $i \, j$.
    Each positive split $w = u v$ and each $h in.not { i \, j }$ gives a candidate
    $\[ y_(i h) \( u \) \, y_(h j) \( v \) \]$, since both factors have already been defined.
    We first show that all these candidates agree.
  Write $w = u v z$ with all three pieces nonempty, and choose distinct indices $i \, a \, b \, j$. Set
  $ X = y_(i a) \( u \) \, wide Y = y_(a b) \( v \) \, wide Z = y_(b j) \( z \) . $
  The product relations at the preceding stage give
  $ A = \[ X \, Y \] = y_(i b) \( u v \) \, wide B = \[ Y \, Z \] = y_(a j) \( v z \) . $
  Every word occurring in $X \, Y \, Z \, A \, B$ has length less than $N$.
    The pairs $\( A \, X \)$, $\( A \, Y \)$, $\( B \, Y \)$, $\( B \, Z \)$, $\( A \, B \)$,
    and $\( X \, Z \)$ all occupy the commuting positions in Equation (4.5).
    Thus the induction hypothesis verifies every assumption of Lemma 22. Its conclusion is
  #[#set math.equation(numbering: n => "(4.7)")
   $ \[ y_(i b) \( u v \) \, y_(b j) \( z \) \] = \[ y_(i a) \( u \) \, y_(a j) \( v z \) \] . $ <fp:comparison>]
  Only the two final brackets in this equation involve total word length $N$.
  For completeness, consider the graph whose vertices are pairs $\( p \, h \)$, where $1 lt.eq
    p < N$ specifies a cut after the $p$th letter of $w$ and $h in.not { i \,
    j }$ specifies the intermediate index. Equation  (4.7) equates the candidates at any two vertices whose cut
    positions and intermediate indices are both different. This graph is connected.
    Indeed, vertices with both coordinates different are adjacent.
    If $\( p \, a \)$ and $\( p \, b \)$ have the same first coordinate and $a eq.not b$,
    choose $q eq.not p$ and an index $c$ different from $a \, b$; then
  $ \( p \, a \) \, med \( q \, c \) \, med \( p \, b \) $
  is a path. If $\( p \, a \)$ and $\( q \, a \)$ have the same second coordinate and $p eq.not q$,
    choose two distinct indices $b \, c$, both different from $a$; then
  $ \( p \, a \) \, med \( q \, b \) \, med \( p \, c \) \, med \( q \, a \) $
  is a path. Such choices exist because $N - 1 gt.eq 2$ and $n - 2 gt.eq 3$. All candidates consequently agree.
    Define $y_(i j) \( w \)$ to be their common value. This proves the positive-split assertion at length $N$,
    for all choices of $w \, i \, j$, before making any other assertion at this length.
    It also shows, by induction, that $y_(i j) \( w \)$ is the element represented by the explicitly specified
    word $xi_(i j) \( w \)$.
  ===== 4.1.2 Commuting pairs at the new length. <commuting-pairs-at-the-new-length.>
  We next prove Equation (4.5) for all $\| u \| \, \| v \| lt.eq N$.
    Pairs with both lengths less than $N$ are already covered.
    For the other pairs, use induction on the total length $\| u \| + \| v \|$,
    beginning at $N$ and ending at $2 N$. Commutation is symmetric,
    so we may arrange that the first element in the desired relation is $y_(i j) \( u \)$ with $\| u \| = N$;
    write the other element as $y_(k l) \( v \)$. The index assumptions are $j eq.not k$ and $i eq.not l$. Choose
  $ h in.not { i \, j \, k \, l } \, $
  which is possible since $n gt.eq 5$, and split $u = u_1 u_2$ into two nonempty words.
    The positive-split assertion gives
  $ y_(i j) \( u \) = \[ y_(i h) \( u_1 \) \, y_(h j) \( u_2 \) \] . $
  Both factors have commuting-pair positions with $y_(k l) \( v \)$:
    for the first factor the needed inequalities are $h eq.not k$ and $i eq.not l$,
    and for the second they are $j eq.not k$ and $h eq.not l$.
    Their respective total lengths with $v$ are strictly smaller than $\| u \| + \| v \|$.
    Their commutations therefore follow either from the preceding word-length stage or from the current induction
    on total length. An element commuting with two elements also commutes with their commutator.
    This proves the desired relation and completes the commutation induction,
    including pairs of two words of length $N$.
  ===== 4.1.3 Involutions and empty-word inputs. <involutions-and-empty-word-inputs.>
  Write a new root element as
  $ C = y_(i j) \( w \) = \[ U \, V \] \, wide U = y_(i h) \( u \) \, quad V = y_(h j) \( v \) \, $
  using a positive split. By the preceding word-length stage, $U$ and $V$ are involutions.
    The commutations just proved show that $C$ commutes with each of $U \, V$,
    since their root positions are commuting positions. On the other hand, direct expansion using $U^2 = V^2 = 1$ gives
  $ U C U^(- 1) = V U V U = C^(- 1) . $
  As $C$ commutes with $U$, it follows that $C = C^(- 1)$ and $C^2 = 1$.
  The product relation at total length $N$ is already established when both inputs have positive length.
    For a right empty-word input, fix pairwise distinct $i \, j \, k$, write $w = u v$ with $u \, v$ nonempty,
    and choose $h in.not { i \, j \, k }$. In Lemma 22, take
  $ X = y_(i h) \( u \) \, wide Y = y_(h j) \( v \) \, wide Z = y_(j k) \( epsilon \) . $
  Then
  $ A = y_(i j) \( w \) \, wide B = y_(h k) \( v \) . $
  The formula for $A$ follows from positive-split independence;
    that for $B$ uses the right empty-word relation at a smaller length.
    All the commutations in Lemma 22 are commuting-pair relations among words of length at most $N$,
    and so have now been proved. The lemma and another positive split give
  $ \[ y_(i j) \( w \) \, y_(j k) \( epsilon \) \] = \[ y_(i h) \( u \) \, y_(h k) \( v \) \] = y_(i k) \( w \) . $
  For a left empty-word input, apply the same lemma to
  $ X = y_(i j) \( epsilon \) \, wide Y = y_(j h) \( u \) \, wide Z = y_(h k) \( v \) . $
  Here $A = y_(i h) \( u \)$ by the smaller-length left empty-word relation, and $B =
    y_(j k) \( w \)$ by positive-split independence. The lemma gives
  $ \[ y_(i j) \( epsilon \) \, y_(j k) \( w \) \] = \[ y_(i h) \( u \) \, y_(h k) \( v \) \] = y_(i k) \( w \) . $
  This completes every part of the induction. In particular,
    all monomial Steinberg relations hold for words of arbitrary length.
  ===== 4.1.4 From monomials to all algebra elements. <from-monomials-to-all-algebra-elements.>
  For $f in T$, define
  $ y_(i j) \( f \) = product_(w in S_f) y_(i j) \( w \) . $
  Same-position commutation makes this product independent of its order.
    The involution relations cancel terms appearing twice, so
  $ y_(i j) \( f + g \) = y_(i j) \( f \) y_(i j) \( g \) . $
  Likewise, the monomial commutations imply $\[ y_(i j) \( f \) \, y_(k l) \( g \) \] =
    1$ whenever $j eq.not k$ and $i eq.not l$.
  For pairwise distinct $i \, j \, k$, each commutator of a monomial factor in $y_(i j) \( f \)$ with a monomial
    factor in $y_(j k) \( g \)$ is $y_(i k) \( u v \)$. Every such resulting factor commutes with all factors of
    both input products: positions $\( i \, k \)$ commute with both $\( i \, j \)$ and $\( j \, k \)$.
    Expanding the commutator of the two finite products therefore gives
  $ \[ y_(i j) \( f \) \, y_(j k) \( g \) \] = product_(u in S_f) product_(v in S_g) y_(i k) \( u v \) =
    y_(i k) \( f g \) . $
  For the first equality, the usual identities for the commutator of a product reduce to multiplication of the
    individual commutators because all those commutators centralize both input subgroups.
    For the second, same-position commutation permits rearrangement,
    and involutivity implements exactly the cancellation of equal monomials over $bb(F)_2$.
    Thus the elements $y_(i j) \( f \)$ satisfy all defining relations of $"St"_n \( T \)$ and give a homomorphism
  $ Phi : "St"_n \( T \) arrow.r P_0 \, wide x_(i j) \( f \) mapsto y_(i j) \( f \) . $
  Conversely, the assignment $g_(i j) \( w \) mapsto x_(i j) \( w \)$ satisfies Equations (4.3)–(4.3),
    and hence defines a homomorphism $Psi : P_0 arrow.r "St"_n \( T \)$.
    Recursive use of Equation (1.1) gives $Psi \( y_(i j) \( w \) \) = x_(i j) \( w \)$ for every monomial $w$.
    Additivity then gives $Psi \( y_(i j) \( f \) \) = x_(i j) \( f \)$ for every $f in T$.
    It follows that $Psi Phi$ fixes every defining generator of $"St"_n \( T \)$.
    The composition $Phi Psi$ fixes every defining generator $g_(i j) \( w \)$ of $P_0$.
    These two homomorphisms are inverse, proving $P_0 tilde.equiv "St"_n \( T \)$.
  ===== 4.1.5 Imposing the algebra ideal. <imposing-the-algebra-ideal.>
  Under this isomorphism, Equation (4.3) kills $x_(i j) \( f_t \)$ for every $t$ and every root position.
    Let $P$ be the resulting quotient of $"St"_n \( T \)$, and write $tilde(x)_(i j) \( a \)$ for the image in $P$
    of $x_(i j) \( a \)$. We verify directly that
  #[#set math.equation(numbering: n => "(4.8)")
   $ tilde(x)_(i j) \( a \) = 1 quad upright("for every ") a in frak(a) upright(" and every ") i eq.not j .
     $ <fp:ideal-killed>]
  For $c in T$ and $h in.not { i \, j }$, the product relation gives
  $ tilde(x)_(i j) \( c f_t \) = \[ tilde(x)_(i h) \( c \) \, tilde(x)_(h j) \( f_t \) \] = 1 . $
  This conclusion holds in every root position. Applying it to position $\( i \, h \)$ and using another product
    relation gives, for every $d in T$,
  $ tilde(x)_(i j) \( c f_t d \) = \[ tilde(x)_(i h) \( c f_t \) \, tilde(x)_(h j) \( d \) \] = 1 . $
  Every element of the two-sided ideal $frak(a)$ is a finite sum of terms $c f_t d$; additivity proves Equation (4.8).
  The algebra quotient map $T arrow.r R$ induces a surjective homomorphism $"St"_n \( T \) arrow.r
    "St"_n \( R \)$, and the specified relators lie in its kernel.
    It therefore induces a homomorphism $alpha : P arrow.r "St"_n \( R \)$.
    In the other direction, assign to $x_(i j) \( r \)$ the element $tilde(x)_(i j) \( a \)$ for any lift $a in
    T$ of $r in R$. This is independent of the lift: two lifts differ by an element of $frak(a)$,
    whose root element is trivial by Equation (4.8) and additivity.
    The Steinberg relations hold for these elements by choosing lifts $a + b$ and $a b$ for sums and products.
    Thus the assignment defines $beta : "St"_n \( R \) arrow.r P$.
    The composition $alpha beta$ fixes every $x_(i j) \( r \)$,
    and $beta alpha$ fixes every $tilde(x)_(i j) \( a \)$, which generate $P$. The two maps are inverse.
  There are finitely many words of length at most two over $cal(A)$, finitely many indices,
    and finitely many algebra relators. Every $xi_(i j) \( w \)$ appearing in the presentation is a finite word in
    the specified generators. Consequently all four displayed families give finitely many ordinary group relators.
    This proves the theorem. ◻
]

=== 4.2 Perfectness, infinitude, and matrix periodicity <perfectness-infinitude-and-matrix-periodicity>

#thm([Lemma 4.3.])[
  #emph[For every unital associative $bb(F)_2$-algebra $R$ and $n gt.eq 3$,
    the groups $"St"_n \( R \)$ and $"E"_n \( R \)$ are perfect. If $R$ is infinite, both groups are infinite.]
] <fp:perfectness>

#proof[
  For each $i eq.not j$, choose $h in.not { i \, j }$. Every defining generator of the Steinberg group is a commutator:
  $ x_(i j) \( a \) = \[ x_(i h) \( a \) \, x_(h j) \( 1 \) \] . $
  Hence the commutator subgroup contains all the generators, proving perfectness.
    Its quotient $"E"_n \( R \)$ is perfect as well. For a fixed root position $\( i \, j \)$,
    the matrices $e_(i j) \( a \)$ for distinct $a in R$ are distinct, as is seen in their $\( i \, j \)$ entries.
    Thus an infinite $R$ gives an infinite $"E"_n \( R \)$, and the surjection (4.1) then gives an infinite
    $"St"_n \( R \)$. ◻
]

#thm([Lemma 4.4.])[
  (Periodicity of the matrix groups).  #emph[Suppose that $R = bb(F)_2 xor I$ as a vector space,
    where $I$ is a two-sided ideal and the indicated copy of $bb(F)_2$ contains the identity of $R$.
    Suppose that $M_d \( I \)$ is a nil algebra for every positive integer $d$; that is,
    each individual matrix in $M_d \( I \)$ is nilpotent. Then a square matrix over $R$ is invertible if and only
    if its reduction modulo $I$ is invertible. Moreover, every element of $"GL"_n \( R \)$ has finite order,
    and therefore $"E"_n \( R \)$ is periodic.]
] <fp:matrix-periodicity>

#proof[
  An invertible matrix remains invertible under reduction. Conversely,
    let $A in M_n \( R \)$ have invertible reduction $overline(A)$ over $bb(F)_2$.
    Regard $B = overline(A)^(- 1)$ as a matrix over the specified copy of $bb(F)_2$ in $R$;
    it is already invertible over $R$. Then $A B = I_n + U$ with $U in M_n \( I \)$.
    Choose $m gt.eq 1$ such that $U^m = 0$. In characteristic two,
  $ \( I_n + U \)^(- 1) = I_n + U + dots.h.c + U^(m - 1) . $
  Thus $A B$, and hence $A$, is invertible.
  Now take $A in "GL"_n \( R \)$. The finite group $"GL"_n \( bb(F)_2 \)$ contains its reduction,
    so $overline(A)$ has some finite order $d gt.eq 1$. Consequently $A^d = I_n + V$ with $V in M_n \( I \)$.
    Choose $m gt.eq 1$ with $V^m = 0$, and choose $e gt.eq 0$ with $2^e gt.eq m$.
    Successive squaring in characteristic two gives
  $ A^(d 2^e) = \( I_n + V \)^(2^e) = I_n + V^(2^e) = I_n . $
  This proves the periodicity assertions without requiring a common nilpotence index or a common bound on element
    orders. ◻
]

By Equation (4.1), if $"E"_n \( R \)$ is periodic and each element of $J_n \( R \)$ has finite order,
  then $"St"_n \( R \)$ is periodic: for $g in "St"_n \( R \)$, some positive power $g^d$ lies in $J_n \( R \)$,
  and a further positive power is the identity. The required control of $J_n \( R \)$ is addressed in the
  subsequent sections.

== 5 Centrality and rational stability <sec:stability>

Throughout this section, let $R = bb(F)_2 xor I$ be a unital associative algebra,
  where $I$ is a two-sided ideal and the indicated copy of $bb(F)_2$ contains the identity of $R$.
  Suppose that every matrix over $I$ is nilpotent. These are among the properties supplied by Theorem 18.
  No commutativity or finite generation assumption on $R$ is needed in this Section.
  Write $H_n = "GL"_n \( R \)$, retain the groups $"E"_n \( R \)$ and $"St"_n \( R \)$ of Section 4, and set

$ J_n = "Ker" #scale(x: 120%, y: 120%)[\(] "St"_n \( R \) arrow.r "E"_n \( R \) #scale(x: 120%, y: 120%)[\)] . $

All maps between successive ranks are the standard coordinate stabilization maps.
  Our two outputs are centrality of $J_n$ and extension of every rational homomorphism on $J_n$ to larger ranks.
  The latter will allow torsion proved after stabilization to descend to rank twelve.

=== 5.1 Frames and presentations of the full matrix groups <frames-and-presentations-of-the-full-matrix-groups>

#thm([Lemma 5.1.])[
  #emph[A square matrix over $R$ is invertible if and only if its reduction modulo $I$ is invertible.
    Every tuple of columns whose reductions are linearly independent extends to an invertible matrix.
    The group $H_n$ is generated by elementary matrices and the diagonal matrices $d_i \( u \)$ having a unit $u
    in R^times$ in one position and ones elsewhere.]
] <st:linear-algebra>

#proof[
  The invertibility assertion is Lemma 24. To complete a tuple of columns,
    complete their reductions to a basis over $bb(F)_2$ and lift the additional columns;
    the resulting matrix is invertible by that assertion.
  In particular, an element of $R$ with nonzero reduction is a unit.
    An invertible matrix has such an entry in its first column.
    Interchange rows to put that entry in position $\( 1 \, 1 \)$, and denote it by $u$.
    Left multiplication by elementary matrices with parameters $-
    a_(i 1) u^(- 1)$ clears the remaining entries of the first column.
    Right multiplication by elementary matrices with parameters $-
    u^(- 1) a_(1 j)$ then clears the remaining entries of the first row.
    The resulting complementary block is invertible by reduction.
    Induction reduces the matrix to a diagonal matrix of units.
    The order of the products used here is valid in a noncommutative ring.
    Finally, a row interchange is elementary because, in characteristic two, its two by two block is
  $ e_12 \( 1 \) e_21 \( 1 \) e_12 \( 1 \) = mat(delim: "(", 0, 1; 1, 0) . $
  This proves the generation assertion. ◻
]

A #emph[frame] is a tuple of columns of $R^n$ with linearly independent reductions in $bb(F)_2^n$.
  Let $X_n$ be the abstract simplicial complex whose vertices are columns with nonzero reduction and whose
  simplices are the finite sets that form frames. Distinct columns remain distinct vertices even when their
  reductions coincide.

Complexes of partial bases and frames are classical tools in homological stability.
  Van der Kallen treats associative rings under Bass stable-range conditions [17].
  We prove the connectivity and rational comparison needed for our particular ring directly.

#thm([Lemma 5.2.])[
  #emph[The complex $X_n$ has vanishing reduced rational homology in degrees at most $n - 2$.
    It is simply connected for $n gt.eq 3$.]
] <st:frames>

#proof[
  We first work with a finite labeled collection of nonzero vectors spanning a vector space of dimension $n$ over
    $bb(F)_2$. Its independence complex has one vertex for every label;
    parallel vectors with different labels are not identified.
    We prove the homology assertion by induction on $n$. For $n = 1$, the asserted vanishing is just nonemptiness.
  Choose a basis from the collection. Its independence complex is a simplex.
    Adjoin the remaining labeled vectors one at a time. When a vector $v$ is adjoined,
    its link in the preceding complex is the independence complex of the preceding vectors projected to the
    quotient by $bb(F)_2 v$, with zero projections discarded.
    The projected collection spans a space of dimension $n - 1$, and its labels are retained.
    By induction its reduced homology vanishes through degree $n - 3$.
    Adjoining $v$ attaches the cone on this link. The relative simplicial chains are its augmented link chains
    shifted by one. The long exact sequence of this pair therefore preserves vanishing of reduced homology through
    degree $n - 2$.
  For $n gt.eq 3$ each of these links is connected, by the homology assertion in rank $n - 1$.
    Attaching a cone on a connected subcomplex to a simply connected complex preserves simple connectivity:
    a path through the new cone may be replaced, with the same endpoints, by a path in its link,
    and the replacement is homotopic relative to the endpoints in the cone.
    Starting with the basis simplex proves the finite assertion on fundamental groups as well.
  Any finite set of vertices of $X_n$ can be augmented by columns whose reductions form a basis.
    The independence complex on that finite set is one of the finite complexes just considered.
    Every simplicial cycle and every edge loop uses finitely many vertices,
    so the finite results give the corresponding assertions for $X_n$. ◻
]

To prove centrality, we will assign to each elementary matrix conjugation by its Steinberg root and extend this
  assignment to an action of $H_n$ on $"St"_n \( R \)$. For $n gt.eq 6$,
  a matrix relation on at most five coordinates leaves a spare coordinate on which to check the action.
  The next proposition reduces all matrix relations to relations of that form.

Call a word in elementary and single-position diagonal generators #emph[supported on $S$] if every index occurring
  in it belongs to $S$.

#thm([Proposition 5.3.])[
  #emph[For $n gt.eq 5$, the group $H_n$ has the presentation with elementary generators $e_(i j) \( a \)$ and
    diagonal generators $d_i \( u \)$, subject to all true matrix relations supported on coordinate sets of size
    at most five.]
] <st:small-presentation>

#proof[
  Let $H'_n$ be the presented group and let $pi : H'_n arrow.r H_n$ be its natural surjection,
    which is surjective by Lemma 25. We prove injectivity by induction on $n$.
    For $n = 5$, every true relation is included, so there is nothing to prove.
    Suppose that $n > 5$ and the result is known in rank $n - 1$.
  The stabilizer $P$ of the column $e_1$ in $H_n$ consists of matrices
  $ mat(delim: "(", 1, b; 0, B) \, wide B in H_(n - 1) . $
  Its complementary copy of $H_(n - 1)$ lifts homomorphically to $H'_n$ by the induction hypothesis.
    Its row subgroup, generated by $e_(1 j) \( a \)$ for $j eq.not 1$, also lifts:
    its additive and commuting relations involve at most three coordinates.
    Conjugation of this row subgroup by each complementary elementary or diagonal generator is its matrix
    conjugation, again by relations on at most three coordinates.
    These relations give a homomorphic section $P arrow.r H'_n$ of $pi$ on $P$.
    For example, writing a matrix of $P$ uniquely as a row transvection times $"diag" \( 1 \, B \)$ gives its lift
    using this semidirect product structure. Denote the image by $P'$.
    The section is injective because its composite with $pi$ is the inclusion of $P$.
  Let $s in H'_n$ be the elementary word for the swap $\( 12 \)$. Its square is one by a two-coordinate relation.
    The groups $P'$ and $chevron.l s chevron.r$ generate $H'_n$.
    Indeed, conjugating the generators already in $P'$ by $s$ gives every first-column elementary generator and
    the first diagonal generator; these conjugation identities involve at most three coordinates.
  Let $Q lt.eq P$ fix both $e_1$ and $e_2$ pointwise. It is generated by the complementary elementary and diagonal
    generators on coordinates $3 \, dots.h \, n$ and the row generators $e_(i j) \( a \)$ with $i in { 1 \,
    2 }$ and $j gt.eq 3$. Its image $Q'$ under the section of $P$ is generated by the same displayed generators in
    $H'_n$. Conjugation by $s$ fixes the complementary generators and exchanges the two row families,
    by small-coordinate relations. Hence
  $ s Q' s^(- 1) = Q' . $
  At the first induction step $n = 6$, this argument uses only generators of the complementary $H_4$ inside the
    already lifted $P$; it does not require a presentation theorem in rank four.
  We use $X_n$ to identify the cosets of $P'$. The map
  $ H'_n \/ P' arrow.r X_n^(\( 0 \)) \, wide h P' mapsto pi \( h \) e_1 $
  is well defined. If $w$ is adjacent to $pi \( h \) e_1$, frame completion provides $p in P$ with $p e_2 =
    pi \( h \)^(- 1) w$. From $h P'$ transport along this oriented edge to
  $ h tilde(p) thin s P' \, $
  where $tilde(p)$ is the section of $p$. The result is independent of $p$:
    if $p e_2 = p' e_2$, then $p' ""^(- 1) p in Q$, and $s^(- 1) Q' s subset.eq P'$.
    It is also independent of the representative $h$ of its coset, since replacing $h$ by $h r$, with $r in P'$,
    may be offset by replacing $p$ by $pi \( r \)^(- 1) p$. None of these assertions assumes global injectivity of $pi$.
  Transport reverses along an edge: from the representative $h tilde(p) s$, the reverse step can use $p = 1$,
    giving $h tilde(p) s^2 P' = h P'$. Transport around every triangle is also trivial.
    By translating its first vertex and then using one element of $P$,
    frame completion reduces the triangle to $\( e_1 \, e_2 \, e_3 \)$.
    Put $t = \( 23 \) in P'$, expressed as an elementary word. The three successive representatives can be taken to be
  $ s \, wide s t s \, wide s t s t s = t . $
  The final equality is a true relation on the first three coordinates, and $t in P'$.
    Thus the endpoint coset is the starting coset.
  By Lemma 26, $X_n$ is simply connected. Combinatorial edge paths with the same endpoints therefore differ by
    backtracks and triangle moves, after subdivisions of a null homotopy; both moves preserve transport.
    Starting at $P'$, transport consequently assigns exactly one coset to every vertex.
    Every coset is reached, since $P'$ and $s$ generate $H'_n$:
    multiplication on the right by an element of $P'$ changes only a representative,
    and multiplication by $s$ is one of the allowed edge steps. The displayed coset map is therefore a bijection.
  If $h in "Ker" pi$, its coset maps to $e_1$, so $h in P'$. The restriction of $pi$ to $P'$ is injective.
    Hence $h = 1$, completing the induction. ◻
]

=== 5.2 The central kernel and the quotient by elementary matrices <the-central-kernel-and-the-quotient-by-elementary-matrices>

The faithful-strip argument below is a finite-rank form of the argument in Steinberg’s proof of stable centrality
  [16] Section 7, Theorem 14. The presentation on small coordinate sets provides the rank control here.
  Centrality for the present ring also lies within Voronetsky’s semilocal-ring theorem [19] Theorem 1:
  the nonunits of $R$ are exactly $I$, since each $1 + a$ with $a in
  I$ is invertible and a nilpotent element cannot be a unit.
  Thus $R$ is local, and $M_n \( R \)$ is semilocal with the standard matrix idempotents.
  We retain the direct strip proof and its stated rank bound.

#thm([Proposition 5.4.])[
  #emph[For $n gt.eq 6$, the subgroup $J_n$ is central in $"St"_n \( R \)$.]
] <prop:centrality>

#proof[
  Assign to each elementary generator $e_(i j) \( a \)$ of $H_n$ conjugation by $x_(i j) \( a \)$ on
    $"St"_n \( R \)$. Assign to a diagonal generator the automorphism
  $ x_(i j) \( a \) mapsto x_(i j) \( u_i a u_j^(- 1) \) \, $
  where all but one of the $u_i$ are one. This preserves the Steinberg relations;
    in particular the adjacent-root product becomes $\( u_i a u_j^(- 1) \) \( u_j b u_k^(- 1) \) = u_i a b u_k^(- 1)$.
  We check that every true relation supported on a set $S$ of at most five coordinates acts trivially.
    Choose $t in.not S$. For parameters indexed by $S$, the two groups
  $ U_t \( v \) = product_(i in S) x_(i t) \( v_i \) \, wide V_t \( w \) = product_(i in S) x_(t i) \( w_i \) $
  are additive abelian groups. Their maps to elementary matrices are injective,
    since their parameters occur in distinct matrix positions and no cross product occurs inside either strip.
  The assigned action of $e_(a b) \( r \)$, with $a \, b in S$, sends $v_a$ to $v_a + r v_b$ in the first strip.
    In the second it sends $w_b$ to $w_b - w_a r$. To see the latter formula directly, use
  $ \[ x_(t a) \( w_a \) \, x_(a b) \( r \) \] = x_(t b) \( w_a r \) \; $
  the right side commutes with both factors, so reversing the commutator replaces its parameter by its negative.
    A diagonal $d_a \( u \)$ sends $v_a$ to $u v_a$ and $w_a$ to $w_a u^(- 1)$.
    Thus a word with matrix product $M$ supported on $S$ acts on these two strips by
  $ v mapsto M v \, wide w mapsto w M^(- 1) . $
  These formulas preserve the order of all noncommutative products.
    A true relation has $M = I$, so fixes both strips pointwise.
    Repeating this calculation for each $t in.not S$ fixes every root with exactly one index in $S$.
    It also fixes every root supported outside $S$. Finally, for $i \, j in S$,
  $ x_(i j) \( a \) = \[ x_(i t) \( a \) \, x_(t j) \( 1 \) \] \, $
  so it fixes the internal roots as well. Exactly one outside coordinate is needed for this argument.
  Proposition 27 now gives a homomorphism $H_n arrow.r "Aut" \( "St"_n \( R \) \)$.
    On the image of each Steinberg generator it is conjugation by that generator.
    Hence for every $z in "St"_n \( R \)$, the action of its matrix image is conjugation by $z$.
    If $z in J_n$, that matrix image is the identity. Therefore $z$ commutes with every element of $"St"_n \( R \)$. ◻
]

#thm([Lemma 5.5.])[
  #emph[The group $"E"_n \( R \)$ is normal in $H_n$. For $n gt.eq 5$, inclusion induces an isomorphism
$ H_n \/ "E"_n \( R \) arrow.r H_(n + 1) \/ "E"_(n + 1) \( R \) . $

]
] <st:quotient>

#proof[
  Elementary generators normalize their own generated subgroup,
    and diagonal conjugation preserves each elementary root subgroup. Lemma 25 therefore proves normality.
  In the presentation of Proposition 27, kill all elementary generators.
    Elementary swap words then become trivial, so the conjugation relation for a swap identifies $d_i \( u \)$
    with $d_j \( u \)$ for every pair of positions. Diagonals in different positions commute.
    We may consequently use a single generator $d \( u \)$ for each unit.
    Every remaining defining relation is obtained from a true matrix relation on at most five coordinates by
    deleting elementary generators and replacing each $d_i \( u \)$ by $d \( u \)$.
  This list of relations is independent of $n gt.eq 5$. Indeed,
    whether a word supported on $S$ is a true relation depends only on its matrix block on $S$,
    and not on the other coordinates. Every such word can be relabeled onto at most five fixed coordinates,
    and all those relations already occur in rank five. Inclusion is the identity on the resulting unit generators
    and on their relations, proving the assertion. ◻
]

=== 5.3 Central extensions and the rational dual of the kernel <central-extensions-and-the-rational-dual-of-the-kernel>

We now turn to extension of homomorphisms $J_n arrow.r bb(Q)$.
  We first identify these homomorphisms with central extensions of $"E"_n \( R \)$ by $bb(Q)$,
  and then with the dual of its second rational homology. This comparison will reduce the desired extension
  property to a homology calculation for the frame complex.
  The connection between central extensions, second homology, and Steinberg kernels is classical;
  see [16] Section 7 and [20] Sections III.5.3–III.5.5. Here the comparison must also preserve the specified maps
  between ranks.

We use rational group homology with arbitrary left coefficient modules. It may be computed as

$ H_q \( G \; M \) = H_q #scale(x: 120%, y: 120%)[\(] P_bullet ⊗_(bb(Q) \[ G \]) M #scale(x: 120%, y: 120%)[\)] \, $

where $P_bullet arrow.r bb(Q)$ is a free right $bb(Q) \[ G \]$-resolution.
  For example, the homogeneous bar resolution has ordered lists of group elements as generators,
  deletion boundary, and free diagonal group action. Its augmented complex is exact by the contraction that
  inserts the identity element. The usual comparison maps between free resolutions are obtained by lifting
  successive generators through surjective boundary maps; the same procedure gives the comparison homotopies.

#thm([Lemma 5.6.])[
  #emph[Every central extension of a locally finite group by the additive group $bb(Q)$ has a unique homomorphic
    splitting.]
] <st:finite-splitting>

#proof[
  First let the quotient group $L$ be finite. Choose normalized set-theoretic lifts and write their additive
    multiplication defect as $f \( g \, h \) in bb(Q)$. Associativity says
  $ f \( g \, h \) + f \( g h \, t \) = f \( h \, t \) + f \( g \, h t \) . $
  Define $b \( g \) = \| L \|^(- 1) sum_(t in L) f \( g \, t \)$. Averaging this identity over $t$ gives
  $ f \( g \, h \) = b \( g \) + b \( h \) - b \( g h \) . $
  Changing the chosen lift of $g$ by the central element $- b \( g \)$ therefore makes it a homomorphic splitting.
    Two splittings differ by a homomorphism $L arrow.r bb(Q)$, which must be zero.
  If $L$ is locally finite, apply the finite result to the inverse image of each finite subgroup.
    Uniqueness makes the splittings compatible under inclusion.
    Every finite set of elements of $L$ lies in a finite subgroup,
    so these splittings glue to a unique homomorphic splitting on $L$. ◻
]

#thm([Lemma 5.7.])[
  #emph[For $n gt.eq 6$, equivalence classes of central extensions of $"E"_n \( R \)$ by the additive group
    $bb(Q)$ are naturally in bijection with $"Hom" \( J_n \, bb(Q) \)$.
    This bijection commutes with restriction along inclusions of ranks.]
] <st:extensions>

#proof[
  Every upper unitriangular subgroup over $R$, for any ordering of the coordinates, is locally finite.
    To see this, start with finitely many unitriangular matrices and collect their entries above the diagonal in a
    finite set $S$. Entries of products and inverses are prime-field linear combinations of words in $S$ of length
    at most $n - 1$. Indeed, every such product follows a strictly increasing sequence of coordinate indices;
    the inverse formula is the finite geometric series for a strictly triangular matrix and has the same property.
    There are finitely many words of these bounded lengths, and their $bb(F)_2$-span is finite.
    Only finitely many matrices can consequently occur in the subgroup generated by the original matrices.
  Let
  $ 1 arrow.r bb(Q) arrow.r^iota X arrow.r "E"_n \( R \) arrow.r 1 $
  be a central extension. Lemma 30 gives a unique splitting on each unitriangular subgroup.
    Their root lifts agree whenever a root occurs in different orderings:
    the root group itself is locally finite and has a unique splitting.
    These root lifts satisfy every Steinberg relation. Addition is a relation in one root group.
    A consecutive-root commutator relation fits in a unitriangular group with its three indices in the path order.
    A commuting relation fits in a unitriangular group as well:
    the two directed edges specified by its root positions have no directed cycle,
    since the opposite-root case is excluded. Extend the resulting partial ordering to an ordering of all
    coordinates. In each case the relevant splitting is a homomorphism, so proves the relation among lifts.
    We have obtained a homomorphism
  $ f : "St"_n \( R \) arrow.r X $
  over $"E"_n \( R \)$. Its restriction to $J_n$ lands in the prescribed central copy of $bb(Q)$ and defines
    $phi : J_n arrow.r bb(Q)$. The map $f$ is unique: two such maps differ pointwise by a homomorphism from the
    perfect group $"St"_n \( R \)$ to the central abelian group $bb(Q)$.
    Perfectness also follows directly from $x_(i j) \( a \) = \[ x_(i k) \( a \) \, x_(k j) \( 1 \) \]$.
  Conversely, given $phi in "Hom" \( J_n \, bb(Q) \)$, form
  $ X_phi = \( "St"_n \( R \) times bb(Q) \) \/ { \( j \, - phi \( j \) \) : j in J_n } . $
  The subgroup being divided out is central by Proposition 28.
    The map $q mapsto \[ \( 1 \, q \) \]$ is injective, and the induced map $X_phi arrow.r
    "E"_n \( R \)$ is surjective with this central kernel. In fact
    $\[ \( j \, q \) \] = \[ \( 1 \, q + phi \( j \) \) \]$ for $j in J_n$.
    Thus this is a central extension by the specified copy of $bb(Q)$.
    The map $s mapsto \[ \( s \, 0 \) \]$ gives its canonical root lifts, and its restriction to $J_n$ recovers $phi$.
  Starting instead with the extension $X$ and its map $f$, the homomorphism
  $ "St"_n \( R \) times bb(Q) arrow.r X \, wide \( s \, q \) mapsto f \( s \) iota \( q \) $
  is surjective: choose $s$ with the same elementary image as any given element of $X$,
    and account for the difference in the central kernel. Its kernel is exactly ${ \( j \, - phi \( j \) \) :
    j in J_n }$. It therefore identifies $X_phi$ with $X$ as an extension. This proves the bijection.
    Restricting an extension to a smaller rank preserves its canonical root lifts, by their uniqueness.
    The bijection consequently commutes with rank restriction. ◻
]

For completeness, the relation between these extensions and rational homology can also be read directly from
  chains. For any group $G$, a choice of normalized lifts in a central extension by $bb(Q)$ gives a function $f :
  G times G arrow.r bb(Q)$ satisfying

$ f \( g \, h \) + f \( g h \, k \) = f \( h \, k \) + f \( g \, h k \) . $

Changing the lifts adds a coboundary $b \( g \) + b \( h \) - b \( g h \)$.
  Conversely, a normalized function satisfying this identity defines an extension on $bb(Q) times G$ with product

$ \( a \, g \) \( b \, h \) = \( a + b + f \( g \, h \) \, g h \) . $

The identity gives associativity, and also the required inverse identities.
  Thus extension classes are the degree-two cohomology of the rational bar cochain complex.
  This is the linear dual of the bar chain complex computing $H_(*) \( G \; bb(Q) \)$.
  Every exact sequence of vector spaces splits, so evaluation on cycles gives a natural isomorphism

$ H^2 \( G \; bb(Q) \) tilde.equiv "Hom"_(bb(Q)) #scale(x: 120%, y: 120%)[\(] H_2 \( G \; bb(Q) \) \,
  bb(Q) #scale(x: 120%, y: 120%)[\)] . $

The isomorphism is natural even though a splitting can be used to prove that it is bijective.
  Combining this identification with Lemma 31 gives, for $n gt.eq 6$, the natural bijections

$ "Hom" \( J_n \, bb(Q) \) arrow.l.r H^2 \( "E"_n \( R \) \; bb(Q) \) tilde.equiv "Hom"_(bb(Q))
  #scale(x: 120%, y: 120%)[\(] H_2 \( "E"_n \( R \) \; bb(Q) \) \, bb(Q) #scale(x: 120%, y: 120%)[\)] . $

Thus it remains to show that the standard inclusion induces an isomorphism on second rational homology for $n
  gt.eq 12$. Consequently every homomorphism $J_n arrow.r bb(Q)$ will extend to $J_(n + 1)$.

=== 5.4 Rational homology of stabilizers <rational-homology-of-stabilizers>

We prove the required homology comparison using the action on the frame complex $X_m$.
  The stabilizers of unordered frames contain permutations of the frame.
  For frames of two, three, or four columns, the orientation signs will force the stabilizer homology to vanish,
  leaving only the vertex stabilizer in the degree-two calculation.

#thm([Lemma 5.8.])[
  #emph[Let $N$ be a locally finite normal subgroup of $K$, and let $M$ be a left $bb(Q) \[ K \]$-module.
    There are natural isomorphisms
$ H_q \( K \; M \) tilde.equiv H_q \( K \/ N \; M_N \) \, $

 where $M_N$ denotes the module of $N$-coinvariants.]
] <st:coinvariants>

#proof[
  First, taking $N$-coinvariants is exact over $bb(Q)$. Only preservation of injections needs proof.
    If $U subset.eq V$ and $u in U$ becomes zero in $V_N$, write
  $ u = sum_i \( n_i v_i - v_i \) . $
  The subgroup $B$ generated by the finitely many $n_i$ is finite.
    The averaging operator $e_B = \| B \|^(- 1) sum_(b in B) b$ kills the right side, so $e_B u = 0$. Hence
  $ u = u - e_B u = \| B \|^(- 1) sum_(b in B) \( u - b u \) $
  is already zero in $U_N$.
  Take a free left $bb(Q) \[ K \]$-resolution $L_bullet arrow.r M$.
    Coinvariants give an exact resolution $\( L_bullet \)_N arrow.r M_N$, free over $bb(Q) \[ K \/ N \]$,
    because coinvariants of $bb(Q) \[ K \]$ are $bb(Q) \[ K \/ N \]$. Moreover,
  $ bb(Q) ⊗_(bb(Q) \[ K \]) L_bullet = bb(Q) ⊗_(bb(Q) \[ K \/ N \]) \( L_bullet \)_N . $
  Computing homology by a resolution of the coefficient module gives the same answer as resolving the trivial
    right module: tensor the two resolutions together, and augment first in either direction.
    For each fixed index the other tensor factor is free, so the augmented rows or columns are exact.
    Finite elimination along the diagonals of this first-quadrant double complex identifies its total homology
    with both computations. This proves the assertion and its naturality. ◻
]

The simplicial chains carry orientation signs, so the relevant stabilizers are those of unordered frames with
  their sign modules. Unordered resolutions and this use of orientation signs also appear in the infinite-field
  setting of Vasilev and Yagunov [18]. The following computation supplies the required statement for the present
  algebra with residue field $bb(F)_2$.

#thm([Lemma 5.9.])[
  #emph[Let $m gt.eq 13$, put $G = "E"_m \( R \)$, and let $1 lt.eq l lt.eq 4$.
    The group $G$ acts transitively on ordered $l$-frames. Put $r = m - l$,
    and let $K_l$ be the stabilizer of the unordered frame ${ e_(r + 1) \, dots.h \, e_m }$.
    Its complementary-block projection gives a split exact sequence
$ 1 arrow.r N_l arrow.r K_l arrow.r "E"_r \( R \) arrow.r 1 \, $

 where $N_l$ is locally finite. Let $bb(Q)_(epsilon.alt_l)$ be the one-dimensional orientation module of this
   frame. Then
$ H_q \( K_l \; bb(Q)_(epsilon.alt_l) \) =
  cases(delim: "{", H_q \( "E"_(m - 1) \( R \) \; bb(Q) \) \, & l = 1 \,, 0 \, & 2 lt.eq l lt.eq 4 \,) $

 where in the first case the identification is induced by the complementary inclusion.]
] <st:stabilizers>

#proof[
  Complete a prescribed ordered frame to a matrix $h in H_m$,
    putting the prescribed columns in the last $l$ positions.
    By Lemma 29, the complementary $H_r$ represents every coset of $"E"_m \( R \)$ in $H_m$, since $r gt.eq 9$.
    Multiplying $h$ on the right by an appropriate complementary matrix therefore puts it in $G$ without changing
    these columns. This proves transitivity.
  In block form the unordered stabilizer in $H_m$ consists of
  $ mat(delim: "(", A, 0; B, P) \, wide A in H_r \, quad P upright(" a permutation matrix") . $
  The permutation block is elementary in characteristic two, as is the strip that removes $B$.
    The whole matrix belongs to $"E"_m \( R \)$ if and only if its block $A$ does, by injectivity in Lemma 29.
    Thus projection onto $A$ has image $"E"_r \( R \)$ and section $A mapsto "diag" \( A \, I_l \)$.
    Its kernel is the semidirect product of the additive group $M_(l times r) \( R \)$ with the finite symmetric
    group $S_l$.
  This kernel is locally finite. Given finitely many of its elements,
    take all permutation translates of their finitely many strips.
    Their span over $bb(F)_2$ is finite, and its semidirect product with $S_l$ is a finite group containing the
    given elements.
  The orientation character is the sign of $P$. If $l gt.eq 2$, a transposition in $N_l$ acts as $-
    1$ on $bb(Q)_(epsilon.alt_l)$. Thus its coinvariants are zero:
    their defining relations include $- a - a = - 2 a$. The characteristic of $R$ does not change the rational
    orientation sign. Lemma 32 gives vanishing in every degree.
    If $l = 1$, the orientation module is trivial and the same Lemma identifies homology with that of
    $"E"_(m - 1) \( R \)$. The projection induces this identification,
    and its complementary section induces the inverse. ◻
]

#thm([Proposition 5.10.])[
  #emph[For $n gt.eq 12$, the standard inclusion induces an isomorphism
$ H_2 \( "E"_n \( R \) \; bb(Q) \) arrow.r H_2 \( "E"_(n + 1) \( R \) \; bb(Q) \) . $

]
] <st:h2>

#proof[
  Put $m = n + 1$, $G = "E"_m \( R \)$, and let $C_bullet$ be the oriented simplicial chain complex of $X_m$ over
    $bb(Q)$, with augmentation $C_0 arrow.r bb(Q)$. Fix a free right resolution $P_bullet arrow.r
    bb(Q)$ over $bb(Q) \[ G \]$. Consider the first-quadrant double complex
  $ D_(p \, q) = P_q ⊗_(bb(Q) \[ G \]) C_p \, $
  with horizontal differential induced by the simplicial boundary,
    vertical differential induced by the resolution, and total differential $d = d_h + \( - 1 \)^p d_v$.
    Write $T_bullet$ for its total complex and $A_bullet = P_bullet ⊗_(bb(Q) \[ G \]) bb(Q)$.
  The augmentation induces a chain map $F : T_bullet arrow.r A_bullet$.
    We verify explicitly that it induces an isomorphism in degree two.
    Adjoin column $p = - 1$ by setting $C_(- 1) = bb(Q)$. The resulting total complex has the form
  $ K_j = T_j xor A_(j + 1) \, wide d_K \( t \, a \) = \( d_T t \, F \( t \) - d_A a \) . $
  Every augmented horizontal row is exact at positions $p = - 1 \, 0 \, 1 \, 2$,
    by Lemma 26 and the freeness of each $P_q$. To kill a cycle of total degree $j lt.eq 2$ in $K_bullet$,
    choose its component of largest resolution degree $q$. That component is horizontally closed,
    since no component of larger $q$ contributes to its horizontal target.
    Its horizontal position is $p = j - q lt.eq 2$. Row exactness supplies a horizontal primitive in position
    $\( p + 1 \, q \)$. Subtracting its total boundary removes the chosen component and introduces only smaller
    resolution degrees. Repeating this finite procedure kills the cycle.
    In particular $H_1 \( K_bullet \) = H_2 \( K_bullet \) = 0$. The long exact sequence of
  $ 0 arrow.r A_bullet \[ - 1 \] arrow.r K_bullet arrow.r T_bullet arrow.r 0 $
  therefore shows that $F_(*) : H_2 \( T_bullet \) arrow.r H_2 \( A_bullet \)$ is an isomorphism.
    Here the connecting map is precisely the augmentation map $F_(*)$.
  For $0 lt.eq p lt.eq 3$, Lemma 33 gives a single orbit of simplices, and the oriented chain module is
  $ C_p tilde.equiv bb(Q) \[ G \] ⊗_(bb(Q) \[ K_(p + 1) \]) bb(Q)_(epsilon.alt_(p + 1)) . $
  The stabilizer is that of the #emph[unordered] simplex, with its orientation sign on the coefficient line.
    Tensoring with the right resolution identifies the vertical column with $P_bullet ⊗_(bb(Q) \[ K_(p + 1) \])
    bb(Q)_(epsilon.alt_(p + 1))$. Restriction of $P_bullet$ to a subgroup is still an exact free resolution,
    so the vertical column homology is the stabilizer homology in Lemma 33.
    Consequently columns one, two, and three have zero homology in every degree.
    Column zero has homology $H_q \( "E"_(m - 1) \( R \) \; bb(Q) \)$.
  Inclusion of column zero induces an isomorphism onto $H_2 \( T_bullet \)$.
    For surjectivity, remove the component in position $\( 2 \, 0 \)$ of a total two-cycle using the vanishing of
    vertical homology there. Subtracting the chosen total boundary leaves a cycle whose largest possible column is
    one. Remove its component in $\( 1 \, 1 \)$ in the same way. The remaining cycle belongs to column zero.
    For injectivity, suppose a column-zero two-cycle bounds a total three-chain.
    Remove successively that chain’s components in $\( 3 \, 0 \)$, $\( 2 \, 1 \)$,
    and $\( 1 \, 2 \)$ by subtracting total boundaries. At each step the component to remove is vertically closed,
    because the boundary is in column zero and all higher components have already been removed.
    The requisite vertical homology vanishes. The resulting bounding chain is in column zero, as required.
    Columns of index at least four cannot occur in these cycles or bounding chains.
    Equivalently, the only possible incoming differentials to bidegree $\( 0 \, 2 \)$ have sources $\( 1 \, 2 \)$,
    $\( 2 \, 1 \)$, and $\( 3 \, 0 \)$, all of which vanish.
  For column zero choose the representative vertex $e_m$. Under the chain identification above,
    its map through the augmentation is the map induced by inclusion of its stabilizer into $G$.
    The complementary section from $"E"_(m - 1) \( R \)$ is exactly $A mapsto "diag" \( A \, 1 \)$.
    Combining the two proved isomorphisms thus gives the asserted standard stabilization map. ◻
]

#thm([Proposition 5.11.])[
  #emph[For $n gt.eq 12$, restriction along $J_n arrow.r J_(n + 1)$ induces an isomorphism,
    and in particular a surjection,
$ "Hom" \( J_(n + 1) \, bb(Q) \) arrow.r "Hom" \( J_n \, bb(Q) \) . $

]
] <prop:rational-stability>

#proof[
  Proposition 34 and the bar-cochain identification above show that restriction gives a bijection on central
    extension classes by $bb(Q)$. By Lemma 31, this is precisely restriction on the displayed Hom groups.
    Restriction is a homomorphism of these Hom groups, so its bijectivity makes it an isomorphism. ◻
]

== 6 Torsion in the Steinberg kernel <sec:kernel-torsion>

Throughout this section, let

$ R = xor.big_(b gt.eq 0) R_b \, wide R_0 = bb(F)_2 \, wide I = xor.big_(b > 0) R_b \, $

be the algebra of Theorem 18. We use Proposition 28 and Proposition 35 for this algebra and, when specified,
  for the field $bb(F)_2$. For $n gt.eq 6$, we first show that each element of $J_n \( R \)$ becomes torsion under
  a standard coordinate stabilization to a sufficiently large rank. The rank may depend on the element.
  Rational stability will then bring this conclusion back to the original kernel for $n gt.eq 12$.

The grading supplies a unital homomorphism

$ gamma : R arrow.r R \[ t \] \, wide sum_b a_b mapsto sum_b a_b t^b \, wide a_b in R_b . $

This homomorphism and the finite matrix substitutions below have close antecedents in Weibel’s operations on
  graded $K$-theory [22] Section 1, pp. 468–469. If a finite root word represents $u in J_n \( R \)$,
  applying $gamma$ to its entries gives a word $u \( t \)$ with identity elementary matrix image over $R \[ t \]$.
  Evaluation at $t = 1$ recovers $u$; evaluation at $t = 0$ gives an element of $J_n \( bb(F)_2 \)$.
  We will compare these two evaluations by substituting finite numerical matrices for $t$.
  The comparison must hold in Steinberg groups themselves, since periodicity of their elementary images does not
  settle torsion in the kernel.

=== 6.1 The ground-field kernel and coordinate changes <the-ground-field-kernel-and-coordinate-changes>

#thm([Lemma 6.1.])[
  #emph[Let $A$ be an abelian group and $a in A$. If every homomorphism $A arrow.r bb(Q)$ kills $a$,
    then $a$ has finite order.]
] <kt:rational-detection>

#proof[
  The image of $a$ in $A ⊗_(bb(Z)) bb(Q)$ is zero exactly when some positive integer kills $a$:
    this is the defining equality criterion in localization at the nonzero integers.
    If that image is nonzero, extend it to a basis of the $bb(Q)$-vector space $A ⊗_(bb(Z)) bb(Q)$.
    The functional taking that basis vector to $1$ and the other basis vectors to $0$,
    composed with the natural map from $A$, is a homomorphism detecting $a$. ◻
]

#thm([Lemma 6.2.])[
  #emph[For $n gt.eq 6$, the group $J_n \( bb(F)_2 \)$ is torsion.]
] <kt:field-kernel>

#proof[
  It is abelian by Proposition 28. Suppose that $phi : J_n \( bb(F)_2 \) arrow.r bb(Q)$ is a homomorphism.
    Form the central extension
  $ H = #scale(x: 120%, y: 120%)[\(] "St"_n \( bb(F)_2 \) times
    bb(Q) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\/] { \( z \, - phi \( z \) \) :
    z in J_n \( bb(F)_2 \) } . $
  The copy of $bb(Q)$ injects into $H$, and the quotient by that copy is $"E"_n \( bb(F)_2 \)$.
    This last group is finite. By Lemma 30, its central extension by $bb(Q)$ splits.
    Projection onto the resulting $bb(Q)$ factor, composed with $"St"_n \( bb(F)_2 \) arrow.r H$,
    is a homomorphism from a perfect group to an abelian group, and is therefore zero.
    On the kernel $J_n \( bb(F)_2 \)$ it is $phi$. Thus every such $phi$ is zero, and Lemma 36 proves the claim. ◻
]

We will use changes of coordinates in a Steinberg group. The following observation records the exact action,
  rather than merely its action after passage to matrices.

#thm([Lemma 6.3.])[
  #emph[Let $B$ be a unital algebra over $bb(F)_2$, and let $q gt.eq 3$.
    Every permutation $sigma$ of the $q$ coordinates has a lift $p_sigma in "St"_q \( B \)$ such that
$ p_sigma x_(i j) \( a \) p_sigma^(- 1) = x_(sigma \( i \) sigma \( j \)) \( a \)
  wide \( i eq.not j \, med a in B \) . $

]
] <kt:permutations>

#proof[
  For a transposition interchanging $a$ and $b$, take
  $ p = x_(a b) \( 1 \) x_(b a) \( 1 \) x_(a b) \( 1 \) . $
  For a coordinate $c$ outside ${ a \, b }$, the two commuting roots $x_(a c) \( r \)$ and $x_(b c) \( s \)$ form
    an additive column strip. Conjugation by $x_(a b) \( 1 \)$ adds the second entry to the first,
    by the consecutive Steinberg relation. The analogous statement holds for $x_(b a) \( 1 \)$.
    The three indicated additions interchange the two entries in characteristic two.
    Thus conjugation by $p$ interchanges $x_(a c) \( r \)$ and $x_(b c) \( r \)$.
    Applying the same relations to the incoming row strip interchanges $x_(c a) \( r \)$ and $x_(c b) \( r \)$.
    Roots with both indices outside ${ a \, b }$ commute with all three factors of $p$.
  For the remaining roots, use an outside coordinate $c$ and the identities
  $ x_(a b) \( r \) = \[ x_(a c) \( r \) \, x_(c b) \( 1 \) \] \, wide
    x_(b a) \( r \) = \[ x_(b c) \( r \) \, x_(c a) \( 1 \) \] . $
  The already established strip action interchanges these two roots as well.
    Decomposing a permutation into transpositions and composing their exact actions gives the result. ◻
]

=== 6.2 Block roots and faithful triangular subgroups <block-roots-and-faithful-triangular-subgroups>

Fix integers $n gt.eq 3$ and $N gt.eq 1$. Label the $n N$ coordinates by pairs $\( i \, s \)$,
  with outer index $1 lt.eq i lt.eq n$ and inner index $1 lt.eq s lt.eq N$.
  For $i eq.not j$ and a matrix $A = \( a_(s t) \) in M_N \( R \)$, put

$ X_(i j) \( A \) = product_(s \, t = 1)^N x_(\( i \, s \) \, \( j \, t \)) \( a_(s t) \) quad
  upright("in ") "St"_(n N) \( R \) . $

Every pair of factors in this product commutes: a source has outer index $i$ and a target has the different outer
  index $j$. Its order is consequently immaterial.

#thm([Lemma 6.4.])[
  #emph[The block roots satisfy
$ X_(i j) \( A + B \) & = X_(i j) \( A \) X_(i j) \( B \) \,\
 & = 1 &  & \( j eq.not k \, med i eq.not l \) \,\
 & = X_(i k) \( A B \) &  & \( i \, j \, k upright(" distinct") \) . $

 Moreover, an elementary change of basis inside one outer block acts on every cross-block root by the exact
   corresponding row or column operation. In particular, if $P in
   "GL"_N \( bb(F)_2 \)$ and $B$ is the matrix with a copy of $P$ in each outer diagonal block,
   there is a lift $b in "St"_(n N) \( R \)$ such that
$ b^(- 1) X_(i j) \( A \) b = X_(i j) \( P^(- 1) A P \) wide \( i eq.not j \) . $

]
] <kt:block-laws>

#proof[
  The first two identities follow factor by factor from the root relations.
    In the third identity, the only nontrivial commutators are
  $ \[ x_(\( i \, s \) \, \( j \, t \)) \( a_(s t) \) \, x_(\( j \, t \) \, \( k \, v \)) \( b_(t v) \) \] =
    x_(\( i \, s \) \, \( k \, v \)) \( a_(s t) b_(t v) \) . $
  Every resulting root commutes with every root in either input block.
    The commutator therefore expands into the product of the displayed terms.
    Additivity at a fixed pair of coordinates gives the entries $sum_t a_(s t) b_(t v)$ of $A B$.
  An elementary operation inside outer block $i$ acts on the outgoing strip from $i$ to $j$ by left
    multiplication. This follows by the same commutator computation,
    with one of the two factors supported inside block $i$. An operation inside block $j$ acts by inverse right
    multiplication. There is no opposite-root case, since the other endpoint lies in a different outer block.
    Operations in any other block centralize the strip. These are group equalities in $"St"_(n N) \( R \)$.
  Finally, Gaussian elimination over $bb(F)_2$ expresses $P$ as a product of elementary matrices.
    All nonzero pivots equal $1$, and a row interchange is the product of the three additions used in Lemma 38.
    Lift these elementary factors inside each outer block and apply the exact strip actions successively.
    This proves the last assertion. ◻
]

Let $U$ be the subgroup generated by all roots

$ x_(\( i \, s \) \, \( j \, t \)) \( a \) \, wide s < t \, $

where $i$ and $j$ may be equal. The inner indices, not the outer indices, determine this triangular subgroup.

#thm([Lemma 6.5.])[
  #emph[The natural map from $U$ to matrices is injective. A root whose two inner indices agree normalizes $U$.]
] <kt:triangular-faithfulness>

#proof[
  Call $t - s$ the gap of the displayed root. Two positive-gap roots either commute or have a commutator root
    whose gap is the sum of their gaps. The two noncommuting possibilities are concatenation in either order.
    They cannot be opposite roots, since both gaps are positive.
    These statements follow directly from the Steinberg relations,
    using the inverse of a consecutive commutator for the reverse order.
  For $g gt.eq 1$, let $U_g$ be generated by roots of gap at least $g$; put $U_N = 1$.
    The preceding computation shows that $U_g$ is normal in $U$ and that interchanging two root factors changes
    the product only by factors of larger gap. It follows successively, for $g = 1 \, dots.h \, N - 1$,
    that any element of $U$ can be written as an ordered product with one factor per pair of coordinates,
    in increasing gap, and with all coefficients at an identical pair added.
    To see this without an infinite collection process, first collect the finitely many gap-one positions modulo
    $U_2$, then collect the residual element of $U_2$ modulo $U_3$, and continue until $U_N = 1$.
  If the matrix of such a product is the identity, its entries of inner gap one are exactly the corresponding
    collected coefficients, so these vanish. Once all gaps below $g$ have vanished,
    entries of gap $g$ are likewise exactly their collected coefficients:
    a product of two remaining strictly upper entries has larger gap.
    Induction on $g$ makes every coefficient zero. The original group element is therefore the identity.
  A root with equal inner indices cannot be opposite to a positive-gap root.
    Its commutator with such a root is either trivial or again has that positive gap.
    Conjugating the generators of $U$ therefore keeps them in $U$,
    and the same argument applies to the inverse conjugation. ◻
]

For each $s$ there is a coordinate homomorphism

$ iota_s : "St"_n \( R \) arrow.r "St"_(n N) \( R \) \, wide
  x_(i j) \( a \) mapsto x_(\( i \, s \) \, \( j \, s \)) \( a \) . $

The defining relations verify that these are homomorphisms; no injectivity assertion is needed.
  Their images for different $s$ commute, since their coordinate sets are disjoint.

Suppose a root word $v \( t \)$ over $R \[ t \]$ has elementary matrix product equal to the identity.
  For a matrix $T in M_N \( bb(F)_2 \)$, let $W_v \( T \)$ denote the word obtained by substituting $T$ for $t$ in
  every entry and replacing roots by block roots. This substitution is a ring homomorphism because numerical
  matrices commute with the scalar matrices from $R$. Thus $W_v \( T \)$ has identity matrix image.

#thm([Lemma 6.6.])[
  #emph[If $T$ is upper triangular with all diagonal entries equal to $lambda in bb(F)_2$, then
$ W_v \( T \) = product_(s = 1)^N iota_s \( v \( lambda \) \) . $

]
] <kt:triangular-evaluation>

#proof[
  For every polynomial entry $a \( t \)$, the matrix $a \( T \)$ is upper triangular and has diagonal entry
    $a \( lambda \)$ at each inner index. Split its block root into the commuting product of its diagonal terms
    and its strictly upper terms. By Lemma 40, the diagonal terms normalize $U$,
    so all strictly upper terms in the whole word can be collected on the right.
    The diagonal terms at different inner indices commute. We obtain
  $ W_v \( T \) = (product_(s = 1)^N iota_s \( v \( lambda \) \)) z \, wide z in U . $
  Both the word on the left and every $v \( lambda \)$ have identity matrix image.
    Hence the matrix image of $z$ is the identity. Faithfulness of $U$ gives $z = 1$. ◻
]

=== 6.3 Removing the wrap of a cyclic shift <removing-the-wrap-of-a-cyclic-shift>

The next lemma supplies the finite support estimate needed when a cyclic shift is replaced by a shift on an interval.

#thm([Lemma 6.7.])[
  #emph[Let $v \( t \)$ be a product of $m gt.eq 1$ root factors with polynomial entries of degrees at most $d$,
    and suppose its elementary matrix product is the identity over $R \[ t \]$. Set $delta = max { 1 \, d }$.
    For any integer
$ N > 2 \( m + 1 \) delta \, $

 let $C_N$ be the cyclic shift with entries from row $s$ to column $s + 1$ modulo $N$,
   and let $S_N$ be the truncated shift with entries from row $s$ to column $s + 1$ for $s < N$. Then
$ W_v \( C_N \) = W_v \( S_N \) quad upright("in ") "St"_(n N) \( R \) . $

]
] <kt:wrap-removal>

#proof[
  Write the $h$th block factor of $W_v \( C_N \)$ as $D_h F_h$,
    where $D_h$ is the corresponding factor of $W_v \( S_N \)$ and $F_h$ is the product of its wrap entries.
    This splitting is exact by the commutativity of the roots in a single outer rectangle.
    Since $d < N$, a term of degree $b$ goes from inner row $s$ to inner column $s + b$, and wraps only when $s +
    b > N$. Consequently every root in $F_h$ has source inner index greater than $N -
    delta$ and target inner index at most $delta$.
  For an integer $r gt.eq 1$, consider the strip generated by roots whose source inner index is greater than $N -
    r delta$ and whose target inner index is at most $r delta$.
    As long as $N > 2 r delta$, these source and target sets are disjoint.
    All roots in the strip commute, and their matrix product is the identity plus the matrix of their entries.
    Additivity at a fixed coordinate pair shows that this strip injects into matrices.
  Figure 2 displays the support condition on the inner indices; each band includes all outer indices.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (9, 0.48), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0, 0), (1.8, 0.48), fill: rgb("#ececec"), stroke: none)
  rect((7.2, 0), (9, 0.48), fill: rgb("#d9d9d9"), stroke: none)
  line((1.8, 0), (1.8, 0.48), (7.2, 0), (7.2, 0.48), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.9, 0.24), [$L_r$])
  content((8.1, 0.24), [$H_r$])
  line((8.1, 0.64), (8.1, 1.04), (0.9, 1.04), (0.9, 0.64), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.5, 1.32), [correction roots])
  content((0, 0), [$1$], anchor: "north", padding: 0.1176cm)
  content((1.8, 0), [$r delta$], anchor: "north", padding: 0.1176cm)
  content((7.2, 0), [$N-r delta +1$], anchor: "north", padding: 0.1176cm)
  content((9, 0), [$N$], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 2: The correction strip goes from the right band $H_r = { N - r delta + 1 \, dots.h \, N }$ to the left band $L_r = { 1 \, dots.h \, r delta }$. Conjugation by one truncated block factor enlarges each band by at most $delta$. Choosing $N > 2 \( m + 1 \) delta$ keeps them disjoint throughout the collection. ],
  ) <kt:strip-figure>
  We claim that conjugating an element of the strip of width $r delta$ by one truncated block factor $D_h$,
    or by its inverse, keeps it in the strip of width $\( r + 1 \) delta$, whenever $r lt.eq m$.
    It is enough to check a strip root. Every constituent of $D_h$ goes from an outer index $i$ to a fixed
    different outer index $j$, and has inner displacement between $0$ and $d$. All these constituents commute.
    A constituent initially commuting with the strip root can therefore be omitted when computing the conjugation:
    it also commutes with every conjugate of that root by the other constituents.
  An interacting constituent can change the source endpoint only when its target is the old source;
    it then moves that endpoint left by at most $d$. It can change the target endpoint only when its source is the
    old target; it then moves that endpoint right by at most $d$.
    These assertions, including the coefficients in their prescribed multiplication order,
    are precisely the consecutive Steinberg relations and their reversed versions.
    No constituent can be opposite to a strip root: an edge from its low target to its high source would have
    displacement greater than $d$, by the bound on $N$. This exclusion also holds after one endpoint has moved.
    The source inner index minus the target inner index is then greater than $N - \( 2 r + 1 \) delta > delta$,
    since $r lt.eq m$ and $N > 2 \( m + 1 \) delta$. A constituent of displacement at most $d lt.eq
    delta$ therefore cannot be opposite to an intermediate root.
  There is also no accumulation of many shifts at one endpoint during this single block factor.
    After a source change, that source has outer index $i$, whereas every constituent has target outer index $j
    eq.not i$, so it cannot change the source again. After a target change, that target has outer index $j$,
    whereas every constituent has source outer index $i$, so it cannot change the target again.
    Both endpoints may change, but each changes at most once.
    Every root produced thus belongs to the strip of width $\( r + 1 \) delta$.
    The argument applies to a product of strip roots and to inverse conjugation as well.
    In characteristic two, each block factor is in fact its own inverse.
  Collecting all $D_h$ to the left now gives
  $ W_v \( C_N \) = W_v \( S_N \) thin z \, $
  where $z$ is a product of the wrap factors $F_h$ conjugated by suffixes of the truncated factors.
    More explicitly, set $D_(> h) = D_(h + 1) dots.h.c D_m$ and $D_(> m) = 1$. The group identity
  $ product_(h = 1)^m \( D_h F_h \) = \( D_1 dots.h.c D_m \) product_(h = 1)^m \( D_(> h)^(- 1) F_h D_(> h) \) $
  keeps the last product in increasing order of $h$. Thus no correction factor is used to conjugate another
    correction. Each suffix has at most $m$ factors. The claim puts every resulting correction in the single strip
  $ upright("source inner index") > N - \( m + 1 \) delta \, wide
    upright("target inner index") lt.eq \( m + 1 \) delta . $
  Its endpoint sets are disjoint by our choice of $N$. Both evaluated words have identity matrix image,
    so $z$ also has identity matrix image. Faithfulness of this strip gives $z = 1$, as required. ◻
]

=== 6.4 Stable torsion and its descent <stable-torsion-and-its-descent>

Torsion of nil $K$-groups in positive characteristic is part of the stable theory [21] Corollary 3.3(d).
  We make the needed comparison directly in Steinberg groups and use the rational stability already proved to
  descend to the fixed rank.

#thm([Proposition 6.8.])[
  #emph[Let $n gt.eq 6$ and $u in J_n \( R \)$. The image of $u$ in $"St"_q \( R \)$ is torsion for some $q gt.eq
    n$ under the standard coordinate homomorphism.]
] <kt:stable-torsion>

#proof[
  Choose a finite root word representing $u$ and apply the grading homomorphism $gamma$ to its entries,
    obtaining the word $u \( t \)$ from the opening of this section.
    Its matrix image is the identity, $u \( 1 \)$ represents $u$,
    and $u \( 0 \)$ represents an element of $J_n \( bb(F)_2 \)$ before the field is included into $R$.
  If the word is empty there is nothing to prove. Otherwise let $m$ be its number of root factors and $d$ the
    maximum degree of their entries. Choose a power of two $N$ with
  $ N > 2 \( m + 1 \) max { 1 \, d } \, $
  and set $W = W_u \( C_N \) in "St"_(n N) \( R \)$.
  Since $C_N^N = I$ and $N$ is a power of two, the binomial identity in characteristic two gives
    $\( C_N - I \)^N = 0$. A nilpotent linear map has an upper triangular matrix with zero diagonal in a basis
    adapted to its successive kernels. Thus some $P in "GL"_N \( bb(F)_2 \)$ makes $P^(- 1) C_N
    P$ upper triangular with all diagonal entries equal to $1$.
    Lemma 39 gives an exact conjugation between the two evaluated root words.
    Both belong to $J_(n N) \( R \)$, which is central by Proposition 28; that conjugation consequently fixes $W$.
    Lemma 41 now yields
  $ W = product_(s = 1)^N iota_s \( u \) . $
  Each $iota_s \( u \)$ belongs to the central kernel at rank $n N$.
    By Lemma 38, a permutation of coordinates conjugates any one of these coordinate images to any other.
    Centrality therefore makes them equal, and
  #[#set math.equation(numbering: n => "(6.1)")
   $ W = iota_1 \( u \)^N . $ <kt:cyclic-power>]
  On the other hand, Lemma 42 and then Lemma 41, now with diagonal value $0$, give
  #[#set math.equation(numbering: n => "(6.2)")
   $ W = W_u \( S_N \) = product_(s = 1)^N iota_s \( u \( 0 \) \) . $ <kt:truncated-power>]
  By Lemma 37, $u \( 0 \)$ has finite order. Its coordinate images commute,
    so their product in (6.2) has finite order as well. It follows from (6.1) that $iota_1 \( u \)$ has finite
    order: if $W^a = 1$, then $iota_1 \( u \)^(N a) = 1$.
  Finally, a permutation of the $n N$ coordinates carries the ordered coordinates $\( 1 \, 1 \) \,
    dots.h \, \( n \, 1 \)$ to the first $n$ usual coordinates.
    Lemma 38 identifies $iota_1 \( u \)$ with a conjugate of the usual stabilized image of $u$.
    Hence that stabilized image is torsion. This argument used only coordinate homomorphisms and never their
    injectivity. ◻
]

#thm([Theorem 6.9.])[
  #emph[For every $n gt.eq 12$, the group $J_n \( R \)$ is torsion.]
] <kt:kernel-torsion>

#proof[
  Fix $u in J_n \( R \)$ and a homomorphism $phi : J_n \( R \) arrow.r bb(Q)$.
    Proposition 43 provides a rank $q gt.eq n$ at which the image of $u$ has finite order.
    Successively applying Proposition 35 extends $phi$ to a homomorphism $J_q \( R \) arrow.r bb(Q)$.
    This extension kills the torsion image of $u$, so $phi \( u \) = 0$.
    The group $J_n \( R \)$ is abelian by Proposition 28. Lemma 36 therefore makes $u$ torsion.
    Again, no stabilization map was required to be injective. ◻
]

#proof[
  Take the algebra $R$ from Theorem 18 and put $G = "St"_12 \( R \)$.
    Theorem 21 gives an ordinary finite presentation of $G$. Its image $"E"_12 \( R \)$ is infinite,
    because distinct entries in any one elementary matrix position give distinct matrices and $R$ is infinite.
    Thus $G$ is infinite.
  By Lemma 24, the elementary matrix group $"E"_12 \( R \)$ is periodic.
    For $g in G$, choose a positive integer $a$ killing its elementary matrix image.
    Then $g^a in J_12 \( R \)$, and Theorem 44 gives a positive integer $b$ with $\( g^a \)^b = 1$.
    Consequently every element of $G$ has finite order. The group $G$ is the required infinite,
    finitely presented periodic group. ◻
]

=== 6.5 The Kazhdan consequence <sec:kazhdan>

#proof[
  Theorem 18 presents $R$ as a unital associative $bb(F)_2$-algebra on finitely many generators.
    Since $bb(F)_2$ is the prime field, those generators together with $1$ generate $R$ as a ring.
    Ershov and Jaikin-Zapirain prove that $"St"_n \( S \)$ has property $\( T \)$ for every finitely generated
    associative ring $S$ with $1$ and every $n gt.eq 3$ [5] Theorem 6.2.
    This applies directly to $S = R$ and $n = 12$. Infinitude, finite presentation,
    and periodicity are those of Theorem 1.
  Write $G = "St"_12 \( R \)$. If $G$ were amenable, normalized characteristic functions of Følner sets would give
    almost invariant unit vectors in the left regular representation on $ell^2 \( G \)$.
    Property $\( T \)$ would then give a nonzero invariant vector.
    Such a vector is constant on $G$, and a nonzero constant function on the infinite group $G$ is not
    square-summable. Hence $G$ is nonamenable. ◻
]

#heading(level: 1)[References]
#bibitem([1])[W.~Burnside, On an unsettled question in the theory of discontinuous groups, #emph[Quart. J.
  Pure Appl. Math.] #strong[33] (1902), 230--238.]
#bibitem([2])[S.~A.~Cook, The complexity of theorem-proving procedures,
  in #emph[Proceedings of the Third Annual ACM Symposium on Theory of Computing], ACM, 1971, pp.~151--158.
  #link("https://doi.org/10.1145/800157.805047").]
#bibitem([3])[B.~Durand, A.~Romashchenko, and A.~Shen, Fixed-point tile sets and their applications, #emph[J.
  Comput. Syst. Sci.] #strong[78] (2012), no.~3, 731--764. #link("https://doi.org/10.1016/j.jcss.2011.11.001").]
#bibitem([4])[M.~Ershov, Golod--Shafarevich groups with property~$\( T \)$ and Kac--Moody groups, #emph[Duke Math.
  J.] #strong[145] (2008), no.~2, 309--339. #link("https://doi.org/10.1215/00127094-2008-053").
  Proposition locator refers to the author version.
  #link("https://uva.theopenscholar.com/files/mikhail-ershov/files/gosha_revised4.pdf").]
#bibitem([5])[M.~Ershov and A.~Jaikin-Zapirain, Property $\( T \)$ for noncommutative universal lattices,
  #emph[Invent. Math.] #strong[179] (2010), no.~2, 303--347. #link("https://doi.org/10.1007/s00222-009-0218-2").
  Theorem locator refers to the author version arXiv:0809.4095v2. #link("https://arxiv.org/abs/0809.4095v2").]
#bibitem([6])[E.~S.~Golod, On nil-algebras and finitely approximable $p$-groups, #emph[Izv. Akad. Nauk SSSR Ser.
  Mat.] #strong[28] (1964), no.~2, 273--276 (Russian). #link("https://www.mathnet.ru/eng/im2956").]
#bibitem([7])[E.~S.~Golod and I.~R.~Shafarevich, On the class field tower, #emph[Izv. Akad. Nauk SSSR Ser.
  Mat.] #strong[28] (1964), no.~2, 261--272 (Russian). #link("https://www.mathnet.ru/eng/im2955").]
#bibitem([8])[I.~A.~Ivanov-Pogodaev and A.~Ya.~Kanel-Belov,
  Construction of a nilsemigroup of paths in a countable family of uniformly elliptic complexes,
  #emph[Algebra and Logic] #strong[63] (2025), no.~6, 410--438. #link("https://doi.org/10.1007/s10469-025-09803-3").]
#bibitem([9])[S.~Krstić and J.~McCool, #emph[Presenting $upright(G L)_n \( k chevron.l T chevron.r \)$], J.
  Pure Appl. Algebra #strong[141] (1999), no.~2, 175--183.
  #link("https://doi.org/10.1016/S0022-4049(98)00022-X")[doi:10.1016/S0022-4049(98)00022-X].]
#bibitem([10])[A.~G.~Kurosh, Ringtheoretische Probleme, die mit dem Burnsideschen Problem über periodische Gruppen
  in Zusammenhang stehen, #emph[Izv. Akad. Nauk SSSR Ser. Mat.] #strong[5] (1941), no.~3, 233--240 (Russian,
  with German summary). #link("https://www.mathnet.ru/rus/im3832").]
#bibitem([11])[T.~H.~Lenagan, A.~Smoktunowicz, and A.~A.~Young, Nil algebras with restricted growth, #emph[Proc.
  Edinb. Math. Soc.] #strong[55] (2012), no.~2, 461--475. #link("https://doi.org/10.1017/S0013091510001100").]
#bibitem([12])[P.~S.~Novikov and S.~I.~Adian, Infinite periodic groups. I--III, #emph[Math.
  USSR-Izv.] #strong[2] (1968), 209--236, 241--479, 665--685. #link("https://doi.org/10.1070/IM1968v002n01ABEH000637").]
#bibitem([13])[A.~Yu.~Ol'shanskii and M.~V.~Sapir, Non-amenable finitely presented torsion-by-cyclic groups,
  #emph[Publ. Math. Inst. Hautes Études Sci.] #strong[96] (2003), 43--169.
  #link("https://doi.org/10.1007/s10240-002-0006-7").]
#bibitem([14])[M.~P.~Schützenberger, On the definition of a family of automata,
  #emph[Information and Control] #strong[4] (1961), nos.~2--3, 245--270.
  #link("https://doi.org/10.1016/S0019-9958(61)80020-X").]
#bibitem([15])[A.~Smoktunowicz, The Jacobson radical of rings with nilpotent homogeneous elements, #emph[Bull.
  Lond. Math. Soc.] #strong[40] (2008), no.~6, 917--928. #link("https://doi.org/10.1112/blms/bdn086").]
#bibitem([16])[R.~Steinberg, #emph[Lectures on Chevalley Groups], notes prepared by J.~Faulkner and R.~Wilson,
  Yale University, New Haven, 1967.]
#bibitem([17])[W.~van der Kallen, #emph[Homology stability for linear groups], Invent. Math.
  #strong[60] (1980), no.~3, 269--295. #link("https://doi.org/10.1007/BF01390018")[doi:10.1007/BF01390018].]
#bibitem([18])[I.~Vasilev and S.~Yagunov, #emph[Unordered resolutions and homological stability for linear
  groups], arXiv:2512.18110, 2025. #link("https://arxiv.org/abs/2512.18110")[arXiv:2512.18110].]
#bibitem([19])[E.~Voronetsky, #emph[Centrality of $K_2$-functor revisited], J. Pure Appl.
  Algebra #strong[225] (2021), no.~4, 106547.
  #link("https://doi.org/10.1016/j.jpaa.2020.106547")[doi:10.1016/j.jpaa.2020.106547].]
#bibitem([20])[C.~A.~Weibel, #emph[The $K$-Book: An Introduction to Algebraic $K$-Theory],
  Graduate Studies in Mathematics #strong[145], American Mathematical Society, Providence, RI, 2013.]
#bibitem([21])[C.~A.~Weibel, #emph[Mayer--Vietoris sequences and module structures on $N K_(*)$],
  in #emph[Algebraic $K$-Theory, Evanston 1980], Lecture Notes in Mathematics #strong[854], Springer, 1981,
  466--493. #link("https://doi.org/10.1007/BFb0089534").]
#bibitem([22])[C.~A.~Weibel, #emph[Module structures on the $K$-theory of graded rings], J.
  Algebra #strong[105] (1987), no.~2, 465--483.
  #link("https://doi.org/10.1016/0021-8693(87)90210-9")[doi:10.1016/0021-8693(87)90210-9].]
#bibitem([23])[E.~I.~Zel'manov, Solution of the restricted Burnside problem for groups of odd exponent,
  #emph[Math. USSR-Izv.] #strong[36] (1991), no.~1, 41--60. #link("https://doi.org/10.1070/IM1991v036n01ABEH001946").]
#bibitem([24])[E.~I.~Zel'manov, A solution of the restricted Burnside problem for $2$-groups, #emph[Math.
  USSR-Sb.] #strong[72] (1992), no.~2, 543--565. #link("https://doi.org/10.1070/SM1992v072n02ABEH001272").]
